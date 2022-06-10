/**
 * $Id: mxEdgeHandler.js,v 1.84 2009/01/23 14:49:45 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxEdgeHandler
 *
 * Graph event handler that reconnects edges and modifies control points and
 * the edge label location. Uses <mxTerminalMarker> for finding and
 * highlighting new source and target vertices. This handler is automatically
 * created in <mxGraph.createHandler> for each selected edge.
 */
{

	/**
	 * Constructor: mxEdgeHandler
	 *
	 * Constructs an edge handler for the specified <mxCellState>.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> of the cell to be handled.
	 */
	function mxEdgeHandler(state)
	{
		if (state != null)
		{
			this.state = state;
			this.graph = this.state.view.graph;
			this.graph.addGraphListener(this);
			this.marker = this.createMarker();
			this.init();
		}
	};

	/**
	 * Variable: LABEL_INDEX
	 * 
	 * Index for for specifying that the label handle is active.
	 * Default is -1. This value should not be changed.
	 */
	mxEdgeHandler.prototype.LABEL_INDEX = -1;
	
	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxEdgeHandler.prototype.graph = null;
		
	/**
	 * Variable: state
	 * 
	 * Reference to the <mxCellState> being modified.
	 */
	mxEdgeHandler.prototype.state = null;
			
	/**
	 * Variable: marker
	 * 
	 * Holds the <mxTerminalMarker> which is used for highlighting terminals.
	 */
	mxEdgeHandler.prototype.marker = null;
			
	/**
	 * Variable: error
	 * 
	 * Holds the current validation error while a connection is being changed.
	 */
	mxEdgeHandler.prototype.error = null;
			
	/**
	 * Variable: shape
	 * 
	 * Holds the <mxShape> that represents the preview edge.
	 */
	mxEdgeHandler.prototype.shape = null;
			
	/**
	 * Variable: bends
	 * 
	 * Holds the <mxShapes> that represent the points.
	 */
	mxEdgeHandler.prototype.bends = null;
			
	/**
	 * Variable: labelShape
	 * 
	 * Holds the <mxShape> that represents the label position.
	 */
	mxEdgeHandler.prototype.labelShape = null;

	/**
	 * Variable: cloneEnabled
	 * 
	 * Specifies if cloning by control-drag is enabled. Default is true.
	 */
	mxEdgeHandler.prototype.cloneEnabled = true;

	/**
	 * Function: init
	 * 
	 * Initializes the shapes required for this edge handler.
	 */
	mxEdgeHandler.prototype.init = function()
	{	
		// Clones the original points from the cell
		// and makes sure at least one point exists
		this.points = new Array();
		
		// Uses the absolute points of the state
		// for the initial configuration and preview
		this.abspoints = this.state.absolutePoints;
		
		this.shape = new mxPolyline(this.abspoints, mxConstants.SELECTION_COLOR);
		this.shape.strokewidth = mxConstants.SELECTION_STROKEWIDTH;
		this.shape.isDashed = mxConstants.SELECTION_DASHED;		
		
		this.shape.dialect = (this.graph.dialect != mxConstants.DIALECT_SVG) ?
			mxConstants.DIALECT_VML : mxConstants.DIALECT_SVG;
		this.shape.init(this.graph.getView().getOverlayPane());
		this.shape.node.style.cursor = 'pointer';

		// Event-transparency
		var self = this; // closure
		mxEvent.addListener(this.shape.node, 'dblclick', function (evt)
		{
			self.graph.dblClick(evt, self.state.cell);
			mxEvent.consume(evt);
		});
		mxEvent.addListener(this.shape.node, 'mousedown', function (evt)
		{
			self.graph.dispatchGraphEvent('mousedown', evt, self.state.cell);
		});
		mxEvent.addListener(this.shape.node, 'mousemove', function (evt)
		{
			var cell = self.state.cell;
			
			// Finds the cell under the mouse if the edge is being connected
			// in which case the edge is never highlighted as it cannot
			// be its own source or target terminal (transparent preview)
			if (self.index != null)
			{
				var pt = mxUtils.convertPoint(self.graph.container,
						evt.clientX, evt.clientY);
				cell = self.graph.getCellAt(pt.x, pt.y);
				
				// Swimlane content area is transparent in this case
				if (self.graph.isSwimlane(cell) &&
					self.graph.hitsSwimlaneContent(cell, pt.x, pt.y))
				{
					cell = null;
				}
			}
			
			self.graph.dispatchGraphEvent('mousemove', evt, cell);
		});
		mxEvent.addListener(this.shape.node, 'mouseup', function (evt)
		{
			self.graph.dispatchGraphEvent('mouseup', evt, self.state.cell);
		});


		// Creates bends for the non-routed absolute points
		// or bends that don't correspond to points
		if (this.graph.getSelectionCount() < mxGraphHandler.prototype.maxCells ||
			mxGraphHandler.prototype.maxCells <= 0)
		{
			this.bends = this.createBends();
		}

		// Adds a rectangular handle for the label position
		this.label = new mxPoint(this.state.absoluteOffset.x, this.state.absoluteOffset.y);
		
		this.labelShape = new mxRectangleShape(new mxRectangle(),
				mxConstants.LABEL_HANDLE_FILLCOLOR,
				mxConstants.HANDLE_STROKECOLOR);
		this.initBend(this.labelShape);
		this.labelShape.node.style.cursor = 'move';

		// Redirectes event processing of the label handle to the graph
		// event loop
		var cell = this.state.cell;
		mxEvent.addListener(this.labelShape.node, 'dblclick', function (evt)
		{
			self.graph.dblClick(evt, cell);
			mxEvent.consume(evt);
		});
		
		mxEvent.addListener(this.labelShape.node, 'mousedown', function (evt)
		{
			self.graph.dispatchGraphEvent('mousedown', evt, cell,
				mxEdgeHandler.prototype.LABEL_INDEX);
		});
		
		this.redraw();
	};
	
	/**
	 * Function: createMarker
	 * 
	 * Creates and returns the <mxCellMarker> used in <marker>.
	 */
	mxEdgeHandler.prototype.createMarker = function()
	{
		var marker = new mxCellMarker(this.graph);
		var self = this; // closure

		// Only returns edges if they are connectable and never returns
		// the edge that is currently being modified
		marker.getCell = function(evt, cell)
		{
			var cell = mxCellMarker.prototype.getCell.apply(this, arguments);
			var model = self.graph.getModel();
			
			if (cell == self.state.cell ||
				(cell != null &&
				!self.graph.connectableEdges &&
				model.isEdge(cell)))
			{
				cell = null;
			}
			
			return cell;
		};

		// Sets the highlight color according to validateConnection
		marker.isValidState = function(state)
		{
			var model = self.graph.getModel();
			var other = model.getTerminal(self.state.cell, !self.isSource);
			var source = (self.isSource) ? state.cell : other;
			var target = (self.isSource) ? other : state.cell;
			
			// Updates the error message of the handler
			self.error = self.validateConnection(source, target);

			return self.error == null;
		};
		
		return marker;
	};
	
	/**
	 * Function: validateConnection
	 * 
	 * Returns the error message or an empty string if the connection for the
	 * given source, target pair is not valid. Otherwise it returns null. This
	 * implementation uses <mxGraph.getEdgeValidationError>.
	 * 
	 * Parameters:
	 * 
	 * source - <mxCell> that represents the source terminal.
	 * target - <mxCell> that represents the target terminal.
	 */
	mxEdgeHandler.prototype.validateConnection = function(source, target)
	{
		return this.graph.getEdgeValidationError(this.state.cell, source, target);
	};
	
	/**
	 * Function: createBends
	 * 
	 * Creates and returns the bends used for modifying the edge. This is
	 * typically an array of <mxRectangleShapes>.
	 */
	 mxEdgeHandler.prototype.createBends = function()
	 {
		var cell = this.state.cell;
		var bends = new Array();

		for (var i=0; i<this.abspoints.length; i++)
		{
			if (!this.abspoints[i].isRouted)
			{
				var source = i == 0;
				var target = i == this.abspoints.length - 1;
				var terminal = source || target;

				if (terminal ||
					this.graph.isBendable(cell))
				{				
					var bend = new mxRectangleShape(new mxRectangle(),
							mxConstants.HANDLE_FILLCOLOR,
							mxConstants.HANDLE_STROKECOLOR);
					this.initBend(bend);

					bend.node.style.cursor = 'all-scroll';

					this.installListeners(bend.node, bends.length);
					bends.push(bend);
				
					if (!terminal)
					{
						this.points.push(new mxPoint(0,0));
					}
				}
			}
		}

		return bends;
	};

	/**
	 * Function: initBend
	 * 
	 * Helper method to initialize the given bend.
	 * 
	 * Parameters:
	 * 
	 * bend - <mxShape> that represents the bend to be initialized.
	 */
	mxEdgeHandler.prototype.initBend = function(bend)
	{
		if (this.graph.dialect == mxConstants.DIALECT_SVG)
		{
			bend.dialect = mxConstants.DIALECT_PREFERHTML;
			bend.init(this.graph.container);
		}
		else
		{
			bend.dialect = this.graph.dialect;
			bend.init(this.graph.getView().getOverlayPane());
		}
	};

	/**
	 * Function: mouseDown
	 * 
	 * Handles the event by checking if a special element of the handler
	 * was clicked, in which case the index parameter is non-null. The
	 * indices may be one of <LABEL_INDEX> or the number of the respective
	 * control point. The source and target points are used for reconnecting
	 * the edge.
	 */
	mxEdgeHandler.prototype.mouseDown = function(evt, cell, index)
	{
		if (index == this.LABEL_INDEX &&
			!this.graph.isLabelMovable(cell))
		{
			mxEvent.consume(evt);
		}
		else if (this.graph.isEnabled() &&
			this.state.cell == cell &&
			this.marker != null &&
			index != null)
		{
			this.start(evt, cell, index);
			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: start
	 * 
	 * Starts the handling of the mouse gesture.
	 */
	mxEdgeHandler.prototype.start = function(evt, cell, index)
	{
		this.isSource = index == 0;
		this.isTarget = index == this.bends.length - 1;
		this.isLabel = index == this.LABEL_INDEX;

		this.startX = evt.clientX;
		this.startY = evt.clientY;

		if (this.isSource ||
			this.isTarget)
		{
			var terminal = this.graph.model.getTerminal(cell, this.isSource);
			
			if (terminal == null ||
				this.graph.isDisconnectable(cell, terminal, this.isSource))
			{
				// Draws a straight line as a preview for changes
				var p0 = this.abspoints[0];
				var pe = this.abspoints[this.abspoints.length-1];

				this.abspoints = new Array();
				this.abspoints.push(p0);
				this.abspoints.push(pe);
				
				this.index = index;
			}
		}
		else
		{
			this.index = index;
		}
	};
	
	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by updating the preview.
	 */
	mxEdgeHandler.prototype.mouseMove = function(evt, cell)
	{
		if (this.index != null &&
			this.marker != null)
		{
			var view = this.graph.getView();
			var point = mxUtils.convertPoint(this.graph.container,
					evt.clientX, evt.clientY);
			var scale = view.scale;
			
			if (mxEvent.isGridEnabledEvent(evt))
			{
				point.x = this.graph.snap(point.x / scale) * scale;
				point.y = this.graph.snap(point.y / scale) * scale;
			}
			
			if (this.isLabel)
			{
				this.label.x = point.x;
				this.label.y = point.y;
			}
			else
			{
				// Clones the cell state and updates the absolute points using
				// the current state of this handle. This is required for
				// computing the correct perimeter points and edge style.
				var clone = this.state.clone();
				var geometry = this.graph.getCellGeometry(this.state.cell);
				var points = geometry.points;
				
				var source = null;
				var target = null;
				
				if (this.isSource || this.isTarget)
				{
					this.marker.process(evt, cell);
					var currentState = this.marker.getValidState();
					target = this.graph.getView().getVisibleTerminal(
						this.state.cell, !this.isSource);
					
					if (currentState != null)
					{
						source = currentState.cell;
					}
					else
					{
						clone.setAbsoluteTerminalPoint(point, this.isSource);
						
						if (this.marker.getMarkedState() == null)
						{
							this.error = (this.graph.allowDanglingEdges) ? null : '';
						}
					}
					
					if (!this.isSource)
					{
						var tmp = source;
						source = target;
						target = tmp;
					}
				}
				else
				{
					this.convertPoint(point);
					
					if (points == null)
					{
						points = [point];
					}
					else
					{
						points[this.index - 1] = point;
					}
	
					this.points = points;
					this.active = true;
					
					source = clone.view.getVisibleTerminal(this.state.cell, true);
					target = clone.view.getVisibleTerminal(this.state.cell, false);
				}
	
				// Computes the points for the edge style and terminals
				clone.view.updatePoints(clone, points, source, target);
				clone.view.updateTerminalPoints(clone, source, target);
	
				// Sets the color of the preview to valid or invalid, updates the
				// points of the preview and redraws
				var color = (this.error == null) ? this.marker.validColor :
					this.marker.invalidColor;
				this.setPreviewColor(color);
				this.abspoints = clone.absolutePoints;
			}
			
			this.drawPreview();
			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event to applying the previewed changes on the edge by
	 * using <moveLabel>, <connect> or <changePoints>.
	 */
	mxEdgeHandler.prototype.mouseUp = function(evt)
	{
		if (this.index != null &&
			this.marker != null)
		{
			var edge = this.state.cell;
			
			// Ignores event if mouse has not been moved
			if (evt.clientX != this.startX ||
				evt.clientY != this.startY)
			{
				// Displays the reason for not carriying out the change
				// if there is an error message with non-zero length
				if (this.error != null)
				{
					if (this.error.length > 0)
					{
						this.graph.validationAlert(this.error);
					}
				}
				else if (this.isLabel)
				{
					this.moveLabel(this.state, this.label.x, this.label.y);
				}
				else if (this.isSource ||
					this.isTarget)
				{
					if (this.marker.hasValidState())
					{
						var edge = this.connect(
							edge,
							this.marker.getValidState().cell,
							this.isSource,
							mxEvent.isCloneEvent(evt) &&
							this.cloneEnabled &&
							this.graph.isCloneable());
					}
					else if (this.graph.allowDanglingEdges)
					{
						var pt = this.graph.getPointForEvent(evt);
						var pstate = this.graph.getView().getState(
								this.graph.getModel().getParent(edge));
								
						if (pstate != null)
						{
							pt.x -= pstate.origin.x;
							pt.y -= pstate.origin.y;
						}
						
						// Destroys and rectreates this handler
						this.changeTerminalPoint(edge, pt, this.isSource);
					}
				}
				else if (this.active)
				{
					this.changePoints(edge, this.points);
				}
				else
				{
					this.graph.getView().invalidate(this.state.cell);
					this.graph.getView().revalidate(this.state.cell);						
				}

				// Updates local copy of absolute points
				this.abspoints = this.state.absolutePoints;
			}

			// Resets the preview color the state of the handler if this
			// handler has not been recreated
			if (this.marker != null)
			{
				this.reset();
	
				// Updates the selection if the edge has been cloned
				if (edge != this.state.cell)
				{
					this.graph.setSelectionCell(edge);
				}
			}

			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: reset
	 * 
	 * Resets the state of this handler.
	 */
	mxEdgeHandler.prototype.reset = function()
	{
		this.error = null;
		this.index = null;
		this.label = null;
		this.active = false;
		this.isLabel = false;
		this.isSource = false;
		this.isTarget = false;
		this.marker.reset();
		this.setPreviewColor(mxConstants.SELECTION_COLOR);
		this.redraw();
	};

	/**
	 * Function: setPreviewColor
	 * 
	 * Sets the color of the preview to the given value.
	 */
	mxEdgeHandler.prototype.setPreviewColor = function(color)
	{
		if (this.shape != null &&
			this.shape.node != null)
		{
			if (this.shape.dialect == mxConstants.DIALECT_SVG)
			{
				this.shape.innerNode.setAttribute('stroke', color);
			}
			else
			{
				this.shape.node.setAttribute('strokecolor', color);
			}
		}
	};

	/**
	 * Function: convertPoint
	 * 
	 * Converts the given point in-place from screen to unscaled, untranslated
	 * graph coordinates and applies the grid. Returns the given, modified
	 * point instance.
	 * 
	 * Parameters:
	 * 
	 * point - <mxPoint> to be converted.
	 */
	mxEdgeHandler.prototype.convertPoint = function(point)
	{
		var scale = this.graph.getView().scale;

		point.x = this.graph.snap(point.x) / scale -
			this.graph.getView().translate.x;
		point.y = this.graph.snap(point.y) / scale -
			this.graph.getView().translate.y;
			
		return point;
	};

	/**
	 * Function: moveLabel
	 * 
	 * Changes the coordinates for the label of the given edge.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge.
	 * x - Integer that specifies the x-coordinate of the new location.
	 * y - Integer that specifies the y-coordinate of the new location.
	 */
	mxEdgeHandler.prototype.moveLabel = function(edgeState, x, y)
	{
		var model = this.graph.getModel();
		var geometry = model.getGeometry(edgeState.cell);
		
		if (geometry != null)
		{
			geometry = geometry.clone();
			
			// Resets the relative location stored inside the geometry
			var pt = this.graph.getView().getRelativePoint(edgeState, x, y);
			geometry.x = pt.x;
			geometry.y = pt.y;
			
			// Resets the offset inside the geometry to find the offset
			// from the resulting point
			var scale = this.graph.getView().scale;
			geometry.offset = new mxPoint(0, 0);
			var pt = this.graph.view.getPoint(edgeState, geometry);
			geometry.offset = new mxPoint((x - pt.x) / scale, (y - pt.y) / scale);

			model.setGeometry(edgeState.cell, geometry);
		}
	};
	
	/**
	 * Function: connect
	 * 
	 * Changes the terminal or terminal point of the given edge in the graph
	 * model.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge to be reconnected.
	 * terminal - <mxCell> that represents the new terminal.
	 * isSource - Boolean indicating if the new terminal is the source or
	 * target terminal.
	 * isClone - Boolean indicating if the new connection should be a clone of
	 * the old edge.
	 */
	mxEdgeHandler.prototype.connect = function(edge, terminal, isSource, isClone)
	{
		var model = this.graph.getModel();
		var parent = model.getParent(edge);
		
		model.beginUpdate();
		try
		{
			// Clones and adds the cell
			if (isClone)
			{
				var clone = edge.clone();
				model.add(parent, clone, model.getChildCount(parent));
				
				var other = model.getTerminal(edge, !isSource);
				model.setTerminal(clone, other, !isSource);
				
				edge = clone;
			}
			
			// Removes the terminal and sets terminal point
			if (terminal == null)
			{
				var scale = this.graph.getView().scale;
				var tr = this.graph.getView().translate;

				var pstate = this.graph.getView().getState(parent);
				
				var dx = (pstate != null) ? pstate.origin.x : 0;
				var dy = (pstate != null) ? pstate.origin.y : 0;

				var current = this.abspoints[(isSource) ? 0 : this.abspoints.length-1];
				var geo = model.getGeometry(edge).clone();

				geo.setTerminalPoint(new mxPoint(
					(current.x - dx) / scale - tr.x,
					(current.y - dy) / scale - tr.y),
					isSource);

				model.setGeometry(edge, geo);
				model.setTerminal(edge, null, isSource);
			}
			else
			{
				this.graph.connect(edge, terminal, isSource);
			}
		}
		finally
		{
			model.endUpdate();
		}
		
		return edge;
	};
	
	/**
	 * Function: changePoints
	 * 
	 * Changes the control points of the given edge in the graph model.
	 */
	mxEdgeHandler.prototype.changeTerminalPoint = function(edge, point, isSource)
	{
		var model = this.graph.getModel();
		var geo = model.getGeometry(edge);
		
		if (geo != null)
		{
			model.beginUpdate();
			try
			{
				geo = geo.clone();
				geo.setTerminalPoint(point, isSource);
				model.setGeometry(edge, geo);
				model.setTerminal(edge, null, isSource);
			}
			finally
			{
				model.endUpdate();
			}
		}
	};
	
	/**
	 * Function: changePoints
	 * 
	 * Changes the control points of the given edge in the graph model.
	 */
	mxEdgeHandler.prototype.changePoints = function(edge, points)
	{
		var model = this.graph.getModel();
		var geo = model.getGeometry(edge);
		
		if (geo != null)
		{
			geo = geo.clone();
			geo.points = points;
			
			model.setGeometry(edge, geo);
		}
	};
	
	/**
	 * Function: redraw
	 * 
	 * Redraws the preview, and the bends- and label control points.
	 */
	mxEdgeHandler.prototype.redraw = function()
	{
		this.abspoints = this.state.absolutePoints;
		var cell = this.state.cell;
				
		if (this.bends != null &&
			this.bends.length > 0)
		{
			var model = this.graph.getModel();
			var s = (this.graph.dialect == mxConstants.DIALECT_SVG) ? 3 : 4;

			var n = this.abspoints.length-1;
			
			var p0 = this.abspoints[0];
			var x0 = this.abspoints[0].x;
			var y0 = this.abspoints[0].y;
			
			this.bends[0].bounds = new mxRectangle(x0-s, y0-s, 2*s, 2*s);
			
			// Determines the color of the terminal bend
			var terminal = model.getTerminal(cell, true);
			var connected = terminal != null;
			var movable = !connected ||
				this.graph.isDisconnectable(cell, terminal, true);
			
			var color = (movable) ? ((connected) ?
					mxConstants.CONNECT_HANDLE_FILLCOLOR :
						mxConstants.HANDLE_FILLCOLOR) :
							mxConstants.LOCKED_HANDLE_FILLCOLOR;
				
			this.bends[0].fill = color;
			this.bends[0].reconfigure();
			this.bends[0].redraw();
			
			var pe = this.abspoints[n];
			var xn = this.abspoints[n].x;
			var yn = this.abspoints[n].y;
			
			var bn = this.bends.length-1;
			this.bends[bn].bounds = new mxRectangle(xn-s, yn-s, 2*s, 2*s);
			
			terminal = model.getTerminal(cell, false);
			connected = terminal != null;
			movable = !connected ||
				this.graph.isDisconnectable(cell, terminal, false);
			
			color = (movable) ? ((connected) ?
					mxConstants.CONNECT_HANDLE_FILLCOLOR :
						mxConstants.HANDLE_FILLCOLOR) :
							mxConstants.LOCKED_HANDLE_FILLCOLOR;
			
			this.bends[bn].fill = color;
			this.bends[bn].reconfigure();
			this.bends[bn].redraw();

			this.redrawInnerBends(p0, pe);
		}

		// Updates the handle for the label position
		var s = (this.graph.dialect == mxConstants.DIALECT_SVG) ? 2 : 3;
		
		this.label = new mxPoint(this.state.absoluteOffset.x, this.state.absoluteOffset.y);
		var bounds = new mxRectangle(this.label.x-s, this.label.y-s, 2*s, 2*s);
		
		this.labelShape.bounds = bounds;
		this.labelShape.redraw();
		
		// Shows or hides the label handle depending on the label
		var lab = this.graph.getLabel(cell);
		
		if (lab != null &&
			lab.length > 0 &&
			this.graph.isLabelMovable(cell))
		{
			this.labelShape.node.style.visibility = 'visible';
		}
		else
		{
			this.labelShape.node.style.visibility = 'hidden';
		}
		
		this.drawPreview();
	};
		
	/**
	 * Function: redrawInnerBends
	 * 
	 * Updates and redraws the inner bends.
	 * 
	 * Parameters:
	 * 
	 * p0 - <mxPoint> that represents the location of the first point.
	 * pe - <mxPoint> that represents the location of the last point.
	 */
	mxEdgeHandler.prototype.redrawInnerBends = function(p0, pe)
	{
		var s = 4;

		var g = this.graph.getModel().getGeometry(this.state.cell);
		var pts = g.points;
	
		if (pts != null)
		{
			for (var i=1; i<this.bends.length-1; i++)
			{
				if (this.abspoints[i] != null)
				{
					var x = this.abspoints[i].x;
					var y = this.abspoints[i].y;
					
					this.bends[i].bounds = new mxRectangle(x-s, y-s, 2*s, 2*s);
					this.bends[i].redraw();
					
					this.points[i-1] = pts[i-1];
				}
				else if (this.bends[i] != null)
				{
					this.bends[i].destroy();
					this.bends[i] = null;
				}
			}
		}
	};
	
	/**
	 * Function: drawPreview
	 * 
	 * Redraws the preview.
	 */
	mxEdgeHandler.prototype.drawPreview = function()
	{
		if (this.isLabel)
		{
			var s = (this.graph.dialect == mxConstants.DIALECT_SVG) ? 2 : 3;
		
			var bounds = new mxRectangle(
				this.label.x - s,
				this.label.y - s,
				2 * s, 2 * s);
			this.labelShape.bounds = bounds;
			this.labelShape.redraw();
		}
		else
		{
			this.shape.points = this.abspoints;
			this.shape.redraw();
		}
	};
	
	/**
	 * Function: installListeners
	 * 
	 * Installs a redirection for the mousedown event in the given node.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node to add the listeners to.
	 * index - Integer that specifies the event handling index.
	 */
	mxEdgeHandler.prototype.installListeners = function(node, index)
	{
		var self = this; // closure
		mxEvent.addListener(node, 'mousedown', function (evt)
		{
			self.graph.dispatchGraphEvent(
				'mousedown', evt, self.state.cell, index);
		});
		mxEvent.addListener(node, 'mouseup', function (evt)
		{
			self.graph.dispatchGraphEvent(
				'mouseup', evt, self.state.cell, index);
		});
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes. This does
	 * normally not need to be called as handlers are destroyed automatically
	 * when the corresponding cell is deselected.
	 */
	mxEdgeHandler.prototype.destroy = function()
	{
		this.graph.removeGraphListener(this);
		this.marker.destroy();
		this.marker = null;
		this.shape.destroy();
		this.shape = null;
		this.labelShape.destroy();
		this.labelShape = null;

		// Destroy the control points for the bends
		if (this.bends != null)
		{
			for (var i=0; i<this.bends.length; i++)
			{
				if (this.bends[i] != null)
				{
					this.bends[i].destroy();
					this.bends[i] = null;
				}
			}
		}
	};

}
