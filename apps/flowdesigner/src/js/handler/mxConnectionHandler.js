/**
 * $Id: mxConnectionHandler.js,v 1.98 2009/01/12 15:57:49 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxConnectionHandler
 *
 * Graph event handler that creates new connections. Uses <mxTerminalMarker>
 * for finding and highlighting the source and target vertices and
 * <factoryMethod> to create the edge instance. This handler is built-into
 * <mxGraph.connectionHandler> and enabled using <mxGraph.setConnectable>.
 *
 * Example:
 * 
 * (code)
 * new mxConnectionHandler(graph, function(source, target)
 * {
 *   edge = new mxCell('', new mxGeometry());
 *   edge.setEdge(true);
 *   edge.geometry.relative = true;
 *   return edge;
 * });
 * (end)
 * 
 * Using images to trigger connections:
 * 
 * This handler uses mxTerminalMarker to find the source and target cell for
 * the new connection and creates a new edge using <connect>. The new edge is
 * created using <createEdge> which in turn uses <factoryMethod> or creates a
 * new default edge.
 * 
 * The handler uses a "highlight-paradigm" for indicating if a cell is being
 * used as a source or target terminal, as seen in MS Visio and other products.
 * In order to allow both, moving and connecting cells at the same time,
 * <mxConstants.DEFAULT_HOTSPOT> is used in the handler to determine the hotspot
 * of a cell, that is, the region of the cell which is used to trigger a new
 * connection. The constant is a value between 0 and 1 that specifies the
 * amount of the width and height around the center to be used for the hotspot
 * of a cell and its default value is 0.5. In addition,
 * <mxConstants.MIN_HOTSPOT_SIZE> defines the minimum number of pixels for the
 * width and height of the hotspot.
 * 
 * This solution, while standards compliant, may be somewhat confusing because
 * there is no visual indicator for the hotspot and the highlight is seen to
 * switch on and off while the mouse is being moved in and out. Furthermore,
 * this paradigm does not allow to create different connections depending on
 * the highlighted hotspot as there is only one hotspot per cell and it
 * normally does not allow cells to be moved and connected at the same time as
 * there is no clear indication of the connectable area of the cell.
 * 
 * To come across these issues, the handle has an additional <createIcons> hook
 * with a default implementation that allows to create one icon to be used to
 * trigger new connections. If this icon is specified, then new connections can
 * only be created if the image is clicked while the cell is being highlighted.
 * The <createIcons> hook may be overridden to create more than one
 * <mxImageShape> for creating new connections, but the default implementation
 * supports one image and is used as follows:
 * 
 * In order to display the "connect image" whenever the mouse is over the cell,
 * an DEFAULT_HOTSPOT of 1 should be used:
 * 
 * (code)
 * mxConstants.DEFAULT_HOTSPOT = 1;
 * (end)
 * 
 * In order to avoid confusion with the highlighting, the highlight color
 * should not be used with a connect image:
 * 
 * (code)
 * mxConstants.HIGHLIGHT_COLOR = null;
 * (end)
 * 
 * To install the image, the connectImage field of the mxConnectionHandler must
 * be assigned a new <mxImage> instance:
 * 
 * (code)
 * mxConnectionHandler.prototype.connectImage = new mxImage('images/green-dot.gif', 14, 14);
 * (end)
 * 
 * This will use the green-dot.gif with a width and height of 14 pixels as the
 * image to trigger new connections. In createIcons the icon field of the
 * handler will be set in order to remember the icon that has been clicked for
 * creating the new connection. This field will be available under selectedIcon
 * in the connect method, which may be overridden to take the icon that
 * triggered the new connection into account. This is useful if more than one
 * icon may be used to create a connection.
 */
{

	/**
	 * Constructor: mxConnectionHandler
	 *
	 * Constructs an event handler that connects vertices using the specified
	 * factory method to create the new edges. Modify
	 * <mxConstants.ACTIVE_REGION> to setup the region on a cell which triggers
	 * the creation of a new connection or use connect icons as explained
	 * above.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 * factoryMethod - Optional function to create the edge. The function takes
	 * the source and target <mxCell> as the first and second argument and
	 * returns the <mxCell> that represents the new edge.
	 */
	function mxConnectionHandler(graph, factoryMethod)
	{
		if (graph != null)
		{
			this.graph = graph;
			this.factoryMethod = factoryMethod;
			this.init();
	
			if (document.body != null)
			{
				this.graph.addGraphListener(this);
			}
		}
	};
	
	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxConnectionHandler.prototype.graph = null;
	
	/**
	 * Variable: factoryMethod
	 * 
	 * Function that is used for creating new edges. The function takes the
	 * source and target <mxCell> as the first and second argument and returns
	 * a new <mxCell> that represents the edge. This is used in <createEdge>.
	 */
	mxConnectionHandler.prototype.factoryMethod = true;
		
	/**
	 * Variable: connectImage
	 * 
	 * <mxImage> that is used to trigger the creation of a new connection. This
	 * is used in <createIcons>. Default is null.
	 */
	mxConnectionHandler.prototype.connectImage = null;

	/**
	 * Variable: enabled
	 * 
	 * Specifies if events are handled. Default is true.
	 */
	mxConnectionHandler.prototype.enabled = true;

	/**
	 * Variable: select
	 * 
	 * Specifies if new edges should be selected. Default is true.
	 */
	mxConnectionHandler.prototype.select = true;

	/**
	 * Variable: createTarget
	 * 
	 * Specifies if <createTargetVertex> should be called if no target was under the
	 * mouse for the new connection. Setting this to true means the connection
	 * will be drawn as valid if no target is under the mouse, and
	 * <createTargetVertex> will be called before the connection is created between
	 * the source cell and the newly created vertex in <createTargetVertex>, which
	 * can be overridden to create a new target. Default is false.
	 */
	mxConnectionHandler.prototype.createTarget = false;

	/**
	 * Variable: marker
	 * 
	 * Holds the <mxTerminalMarker> used for finding source and target cells.
	 */
	mxConnectionHandler.prototype.marker = null;

	/**
	 * Variable: error
	 * 
	 * Holds the current validation error while connections are being created.
	 */
	mxConnectionHandler.prototype.error = null;
	
	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation
	 * returns <enabled>.
	 */
	mxConnectionHandler.prototype.isEnabled = function()
	{
		return this.enabled;
	};
		
	/**
	 * Function: setEnabled
	 * 
	 * Enables or disables event handling. This implementation
	 * updates <enabled>.
	 * 
	 * Parameters:
	 * 
	 * enabled - Boolean that specifies the new enabled state.
	 */
	mxConnectionHandler.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};

	/**
	 * Function: init
	 * 
	 * Initializes the shapes required for this connection handler. This should
	 * be invoked if <mxGraph.container> is assigned after the connection
	 * handler has been created.
	 */
	mxConnectionHandler.prototype.init = function()
	{
		if (this.graph.container != null)
		{
			this.marker = this.createMarker();
			
			// Creates the edge preview
			this.shape = new mxPolyline(new Array(), mxConstants.INVALID_COLOR);
			this.shape.isDashed = true;
			this.shape.dialect = (this.graph.dialect != mxConstants.DIALECT_SVG) ?
				mxConstants.DIALECT_VML : mxConstants.DIALECT_SVG;
			this.shape.init(this.graph.getView().getOverlayPane());
			this.shape.node.style.display = 'none';
			
			// Event-transparency
			if (this.graph.dialect != mxConstants.DIALECT_SVG)
			{
				mxEvent.redirectMouseEvents(this.shape.node,
					this.graph, null, null, true);
			}
			else
			{
				// Sets event transparency on the internal shapes that represent
				// the actual dashed line on the screen
				this.shape.pipe.setAttribute('style', 'pointer-events:none;');
				this.shape.innerNode.setAttribute('style', 'pointer-events:none;');
			}
			
			// Redraws the icons if the graph changes
			var self = this; // closure
			var changeHandler = function(sender)
			{
				if (self.iconState != null)
				{
					self.iconState = self.graph.getView().getState(self.iconState.cell);
				}
				
				if (self.iconState != null)
				{
					self.redrawIcons(self.icons);
				}
				else
				{
					self.destroyIcons(self.icons);
					self.previous = null;
				}
			};
			
			this.graph.getModel().addListener('change', changeHandler);
			this.graph.getView().addListener('scale', changeHandler);
			this.graph.getView().addListener('translate', changeHandler);
			this.graph.getView().addListener('scaleAndTranslate', changeHandler);
			
			// Removes the icon if we step into/up or start editing
			var drillHandler = function(sender)
			{
				self.destroyIcons(self.icons);
			};
			
			this.graph.addListener('startEditing', drillHandler);
			this.graph.getView().addListener('down', drillHandler);
			this.graph.getView().addListener('up', drillHandler);
		}
	};
	
	/**
	 * Function: createMarker
	 * 
	 * Creates and returns the <mxCellMarker> used in <marker>.
	 */
	mxConnectionHandler.prototype.createMarker = function()
	{
		var marker = new mxCellMarker(this.graph);
		marker.hotspotEnabled = true;
		
		var self = this; // closure
	
		// Overrides to return cell at location only if valid (so that
		// there is no highlight for invalid cells)
		marker.getCell = function(evt, cell)
		{
			var cell = mxCellMarker.prototype.getCell.apply(this, arguments);
			self.error = null;

			if (cell != null)
			{
				if (self.isConnecting())
				{
					if (self.previous != null)
					{
						self.error = self.validateConnection(self.previous.cell, cell);
						
						if (self.error != null &&
							self.error.length == 0)
						{
							cell = null;
							
							// Enables create target inside groups
							if (self.createTarget)
							{
								self.error = null;
							}
						}
					}
				}
				else if (!self.isValidSource(cell))
				{
					cell = null;
				}
			}
			else if (self.isConnecting() &&
					!self.createTarget &&
					!self.graph.allowDanglingEdges)
			{
				self.error = '';
			}

			return cell;
		};

		// Sets the highlight color according to validateConnection
		marker.isValidState = function(state)
		{
			if (self.isConnecting())
			{
				return self.error == null;
			}
			else
			{
				return mxCellMarker.prototype.isValidState.apply(this, arguments);
			}
		};

		// Overrides to use marker color only in highlight mode or for
		// target selection
		marker.getMarkerColor = function(evt, state, isValid)
		{
			return (self.connectImage == null || self.isConnecting()) ?
				mxCellMarker.prototype.getMarkerColor.apply(this, arguments) :
				null;
		};

		// Overrides to use hotspot only for source selection otherwise
		// intersects always returns true when over a cell
		marker.intersects = function(state, evt)
		{
			if (self.connectImage != null || self.isConnecting())
			{
				return true;
			}
			
			return mxCellMarker.prototype.intersects.apply(this, arguments);
		};

		return marker;
	};
	
	/**
	 * Function: isConnecting
	 * 
	 * Returns true if the source terminal has been clicked and a new
	 * connection is currently being previewed.
	 */
	mxConnectionHandler.prototype.isConnecting = function()
	{
		return this.start != null && this.shape.node.style.display == 'inline';
	};

	/**
	 * Function: isValidSource
	 * 
	 * Returns <mxGraph.isValidSource> for the given source terminal.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the source terminal.
	 */
	mxConnectionHandler.prototype.isValidSource = function(cell)
	{
		return this.graph.isValidSource(cell);
	};
	
	/**
	 * Function: isValidTarget
	 * 
	 * Returns true. The call to <mxGraph.isValidTarget> is implicit by calling
	 * <mxGraph.getEdgeValidationError> in <validateConnection>. This is an
	 * additional hook for disabling certain targets in this specific handler.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the target terminal.
	 */
	mxConnectionHandler.prototype.isValidTarget = function(cell)
	{
		return true;
	};

	/**
	 * Function: validateConnection
	 * 
	 * Returns the error message or an empty string if the connection for the
	 * given source target pair is not valid. Otherwise it returns null. This
	 * implementation uses <mxGraph.getEdgeValidationError>.
	 * 
	 * Parameters:
	 * 
	 * source - <mxCell> that represents the source terminal.
	 * target - <mxCell> that represents the target terminal.
	 */
	mxConnectionHandler.prototype.validateConnection = function(source, target)
	{
		if (!this.isValidTarget(target))
		{
			return '';
		}
		
		return this.graph.getEdgeValidationError(null, source, target);
	};
	
	/**
	 * Function: getConnectImage
	 * 
	 * Hook to return the <mxImage> used for the connection icon of the given
	 * <mxCellState>. This implementation returns <connectImage>.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose connect image should be returned.
	 */
	mxConnectionHandler.prototype.getConnectImage = function(state)
	{
		return this.connectImage;
	};

	/**
	 * Function: createIcons
	 * 
	 * Creates the array <mxImageShapes> that represent the connect icons for
	 * the given <mxCellState>.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose connect icons should be returned.
	 */
	mxConnectionHandler.prototype.createIcons = function(state)
	{
		var image = this.getConnectImage(state);
		
		if (image != null &&
			state != null)
		{
			this.iconState = state;
			var icons = new Array();

			var bounds = new mxRectangle(0, 0, image.width, image.height);
			var icon = new mxImageShape(bounds, image.src);
			
			// Needs VML in IE for proper event handling when image is removed from DOM
			icon.dialect = (this.graph.dialect == mxConstants.DIALECT_SVG) ?
				mxConstants.DIALECT_STRICTHTML :
				mxConstants.DIALECT_VML;
			icon.init((this.graph.dialect == mxConstants.DIALECT_SVG) ?
				this.graph.container :
				this.graph.getView().getOverlayPane());
			
			icon.node.style.cursor = (mxClient.IS_IE) ? 'all-scroll' : 'pointer';
			
			var self = this; // closure
			mxEvent.addListener(icon.node, 'dblclick', function (evt)
			{
				self.graph.dblClick(evt, state.cell);
				mxEvent.consume(evt);
			});

			mxEvent.addListener(icon.node, 'mousedown', function(evt)
			{
				self.icon = icon;
				self.graph.dispatchGraphEvent('mousedown', evt, state.cell);
			});
	
			mxEvent.addListener(icon.node, 'mousemove', function(evt)
			{
				self.graph.dispatchGraphEvent('mousemove', evt, state.cell);
			});
	
			mxEvent.addListener(icon.node, 'mouseup', function(evt)
			{
				self.graph.dispatchGraphEvent('mouseup', evt, state.cell);
			});

			icons.push(icon);
			this.redrawIcons(icons);
			
			return icons;
		}
		
		return null;
	};
	
	/**
	 * Function: redrawIcons
	 * 
	 * Redraws the given array of <mxImageShapes>.
	 * 
	 * Parameters:
	 * 
	 * icons - Optional array of <mxImageShapes> to be redrawn.
	 */
	mxConnectionHandler.prototype.redrawIcons = function(icons)
	{
		if (icons != null &&
			this.iconState != null)
		{
			var image = this.getConnectImage(this.iconState);
			
			if (image != null)
			{
				var scale = this.graph.getView().scale;
				var cx = this.iconState.getCenterX();
				var cy = this.iconState.getCenterY();
				
				if (this.graph.isSwimlane(this.iconState.cell))
				{
					var size = this.graph.getStartSize(this.iconState.cell);
					
					cx = (size.width != 0) ? this.iconState.x +
						size.width * scale / 2 : cx;
					cy = (size.height != 0) ? this.iconState.y +
						size.height * scale / 2 : cy;
				}

				var icon = icons[0];
				icon.bounds.x = cx - icon.bounds.width / 2;
				icon.bounds.y = cy - icon.bounds.height / 2;
				icon.redraw();
			}
		}
	};
	
	/**
	 * Function: destroyIcons
	 * 
	 * Destroys the given array of <mxImageShapes>.
	 * 
	 * Parameters:
	 * 
	 * icons - Optional array of <mxImageShapes> to be destroyed.
	 */
	mxConnectionHandler.prototype.destroyIcons = function(icons)
	{
		if (icons != null)
		{
			this.iconState = null;
			
			for (var i=0; i<icons.length; i++)
			{
				icons[i].destroy();
			}
		}
	};
	
	/**
	 * Function: mouseDown
	 * 
	 * Handles the event by initiating a new connection. By consuming the
	 * event all subsequent events of the gesture are redirected to this
	 * handler.
	 */
	mxConnectionHandler.prototype.mouseDown = function(evt, cell, index)
	{
		if (this.isEnabled() &&
			this.graph.isEnabled() &&
			!mxEvent.isForceMarqueeEvent(evt) &&
			this.previous != null &&
			this.error == null &&
			((this.icons == null) ||
			(this.icons != null &&
			this.icon != null)) &&
			index == null)
		{
			// Stores the location of the initial mousedown
			this.start = mxUtils.convertPoint(this.graph.container, evt.clientX, evt.clientY);
			mxEvent.consume(evt);
		}

		this.selectedIcon = this.icon;
		this.icon = null;
	};
	
	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by updating the preview edge or by highlighting
	 * a possible source or target terminal.
	 */
	mxConnectionHandler.prototype.mouseMove = function(evt, cell, index)
	{
		if (this.graph.isEnabled() &&
			this.isEnabled() &&
			index == null)
		{
			var state = this.marker.process(evt, cell);
				
			if (this.previous != null && this.start != null)
			{
				// Moves the connect icon with the mouse
				if (this.selectedIcon != null)
				{
					var w = this.selectedIcon.bounds.width;
					var h = this.selectedIcon.bounds.height;
					var pt = mxUtils.convertPoint(
						this.graph.container, evt.clientX, evt.clientY);

					var bounds = new mxRectangle(pt.x,
						pt.y+mxConstants.TOOLTIP_VERTICAL_OFFSET, w, h);
					this.selectedIcon.bounds = bounds;
					this.selectedIcon.redraw();
				}

				var view = this.graph.getView();
				var point = mxUtils.convertPoint(this.graph.container,
						evt.clientX, evt.clientY);
				var scale = view.scale;
				point.x = this.graph.snap(point.x / scale) * scale;
				point.y = this.graph.snap(point.y / scale) * scale;

				var current = point;

				if (state != null)
				{
					// Computes the target perimeter point
					var targetPerimeter = view.getPerimeterFunction(state);
					
					if (targetPerimeter != null)
					{
						var next = new mxPoint(this.previous.getCenterX(),	
							this.previous.getCenterY());
						var tmp = targetPerimeter(view.getPerimeterBounds(
							state, null, false),
							null, state, false, next);
							
						if (tmp != null)
						{
							current = tmp;
						}
					}
					else
					{
						current = new mxPoint(state.getCenterX(), state.getCenterY());
					}
				}

				var pt = this.start;
				
				// Computes the source perimeter point
				var sourcePerimeter = view.getPerimeterFunction(this.previous);
				
				if (sourcePerimeter != null)
				{
					var tmp = sourcePerimeter(view.getPerimeterBounds(
						this.previous, null, true),
						null, this.previous, true, current);
						
					if (tmp != null)
					{
						pt = tmp;
					}
				}
				else
				{
					pt = new mxPoint(this.previous.getCenterX(), this.previous.getCenterY());
				}

				if (state == null)
				{	
					// Makes sure the cell under the mousepointer can be detected
					// by moving the preview shape away from the mouse. This
					// makes sure the preview shape does not prevent the detection
					// of the cell under the mousepointer even for slow gestures.
					var dx = current.x - pt.x;
					var dy = current.y - pt.y;
					
					var len = Math.sqrt(dx*dx+dy*dy);
									
					current.x -= dx * 4 / len;
					current.y -= dy * 4 / len;
				}
								
				// Updates the points in the preview edge
				this.shape.points = [pt, current];
				
				if (this.shape.node.style.display != 'inline')
				{
					var dx = Math.abs(point.x - this.start.x);
					var dy = Math.abs(point.y - this.start.y);
	
					if (dx > this.graph.tolerance ||
						dy > this.graph.tolerance)
					{
						this.shape.node.style.display = 'inline';
					}
				}

				this.drawPreview();
				mxEvent.consume(evt);
			}
			else if (this.previous != state)
			{
				// Restores the cursor on the previous shape
				if (this.previous != null &&
					this.previous.shape != null)
				{
					this.previous.shape.node.style.cursor =
						this.previousCursor;
				}

				this.destroyIcons(this.icons);
				this.icons = null;
				
				// Sets the cursor on the current shape				
				if (state != null &&
					this.error == null)
				{
					this.previousCursor = state.shape.node.style.cursor;
					state.shape.node.style.cursor =
						(mxClient.IS_IE) ? 'all-scroll' : 'default';

					this.icons = this.createIcons(state);
				}

				this.previous = state;
			}
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by inserting the new connection.
	 */
	mxConnectionHandler.prototype.mouseUp = function(evt, cell)
	{
		if (this.isConnecting())
		{
			// Inserts the edge if no validation error exists
			if (this.error == null)
			{
				var source = this.previous.cell;
				var target = this.marker.hasValidState() ?
					this.marker.validState.cell : null;

				this.connect(source, target, evt, cell);
			}
			else
			{
				// Selects the source terminal for self-references
				if (this.previous != null &&
					this.marker.validState != null &&
					this.previous.cell == this.marker.validState.cell)
				{
					this.graph.selectCellForEvent(this.marker.source, evt);
				}
				
				// Displays the error message if it is not an empty string,
				// for empty error messages, the event is silently dropped
				if (this.error.length > 0)
				{
					this.graph.validationAlert(this.error);
				}
			}
			
			// Redraws the connect icons and resets the handler state
			this.destroyIcons(this.icons);
			mxEvent.consume(evt);
		}
		else if (this.isEnabled() &&
			this.graph.isEnabled())
		{
			this.graph.selectCellForEvent(cell, evt);
		}

		this.reset();
	};

	/**
	 * Function: reset
	 * 
	 * Resets the state of this handler.
	 */
	mxConnectionHandler.prototype.reset = function()
	{
		this.shape.node.style.display = 'none';
		this.marker.reset();
		
		this.selectedIcon = null;
		this.previous = null;
		this.error = null;
		this.start = null;
		this.icon = null;
	};
	
	/**
	 * Function: drawPreview
	 * 
	 * Redraws the preview edge using the color and width returned by
	 * <getEdgeColor> and <getEdgeWidth>.
	 */
	mxConnectionHandler.prototype.drawPreview = function()
	{
		var valid = this.error == null;
		var color = this.getEdgeColor(valid);
		
		if (this.shape.dialect == mxConstants.DIALECT_SVG)
		{
			this.shape.innerNode.setAttribute('stroke', color);
		}
		else
		{
			this.shape.node.setAttribute('strokecolor', color);
		}

		this.shape.strokewidth = this.getEdgeWidth(valid);
		this.shape.redraw();
	};
	
	/**
	 * Function: getEdgeColor
	 * 
	 * Returns the color used to draw the preview edge. This returns green if
	 * there is no edge validation error and red otherwise.
	 * 
	 * Parameters:
	 * 
	 * valid - Boolean indicating if the color for a valid edge should be
	 * returned.
	 */
	mxConnectionHandler.prototype.getEdgeColor = function(valid)
	{
		return (valid) ? mxConstants.VALID_COLOR : mxConstants.INVALID_COLOR;
	};
		
	/**
	 * Function: getEdgeWidth
	 * 
	 * Returns the width used to draw the preview edge. This returns 3 if
	 * there is no edge validation error and 1 otherwise.
	 * 
	 * Parameters:
	 * 
	 * valid - Boolean indicating if the width for a valid edge should be
	 * returned.
	 */
	mxConnectionHandler.prototype.getEdgeWidth = function(valid)
	{
		return (valid) ? 3 : 1;
	};
	
	/**
	 * Function: connect
	 * 
	 * Connects the given source and target using a new edge. This
	 * implementation uses <createEdge> to create the edge.
	 * 
	 * Parameters:
	 * 
	 * source - <mxCell> that represents the source terminal.
	 * target - <mxCell> that represents the target terminal.
	 * evt - Mousedown event of the connect gesture.
	 * dropTarget - <mxCell> that represents the cell under the mouse when it was
	 * released.
	 */
	mxConnectionHandler.prototype.connect = function(source, target, evt, dropTarget)
	{
		if (source != null &&
			(target != null ||
			this.createTarget ||
			this.graph.allowDanglingEdges))
		{
			// Uses the common parent of source and target or
			// the default parent to insert the edge
			var model = this.graph.getModel();
			var edge = null;

			model.beginUpdate();
			try
			{
				if (target == null &&
					this.createTarget)
				{
					target = this.createTargetVertex(evt, source);
					
					if (target != null)
					{
						dropTarget = this.graph.getDropTarget([target], evt, dropTarget);
						
						// Disables edges as drop targets if the target cell was created
						if (dropTarget == null ||
							!this.graph.getModel().isEdge(dropTarget))
						{
							var pstate = this.graph.getView().getState(dropTarget);
							
							if (pstate != null)
							{
								var tmp = model.getGeometry(target);
								tmp.x -= pstate.origin.x;
								tmp.y -= pstate.origin.y;
							}
						}
						else
						{
							dropTarget = this.graph.getDefaultParent();
						}
							
						this.graph.addCell(target, dropTarget);
					}
				}

				var parent = this.graph.getDefaultParent();
				
				if (model.getParent(source) ==
					model.getParent(target))
				{
					parent = model.getParent(source);
				}
				
				edge = this.insertEdge(parent, null, null, source, target);
				
				// Makes sure the edge has a non-null, relative geometry
				var geo = model.getGeometry(edge);

				if (geo == null)
				{
					geo = new mxGeometry();
					geo.relative = true;
					
					model.setGeometry(edge, geo);
				}
				
				if (target == null)
				{
					var pt = this.graph.getPointForEvent(evt);
					geo.setTerminalPoint(pt, false);
				}
			}
			finally
			{
				model.endUpdate();
			}
			
			if (this.select)
			{
				this.graph.setSelectionCell(edge);
			}
		}
	};

	/**
	 * Function: insertEdge
	 * 
	 * Creates, inserts and returns the new edge for the given parameters. This
	 * implementation does only use <createEdge> if <factoryMethod> is defined,
	 * otherwise <mxGraph.insertEdge> will be used.
	 */
	mxConnectionHandler.prototype.insertEdge = function(parent, id, value, source, target)
	{
		if (this.factoryMethod == null)
		{
			return this.graph.insertEdge(parent, id, value, source, target);
		}
		else
		{
			var edge = this.createEdge(source, target);
			edge = this.graph.addEdge(edge, parent, source, target);
			
			return edge;
		}
	};
	
	/**
	 * Function: createTargetVertex
	 * 
	 * Hook method for creating new vertices on the fly if no target was
	 * under the mouse. This is only called if <createTarget> is true and
	 * returns null.
	 * 
	 * Parameters:
	 * 
	 * evt - Mousedown event of the connect gesture.
	 * source - <mxCell> that represents the source terminal.
	 */
	mxConnectionHandler.prototype.createTargetVertex = function(evt, source)
	{
		var clone = this.graph.cloneCells([source])[0];
		var model = this.graph.getModel();
		var geo = model.getGeometry(clone);
		
		if (geo != null)
		{
			var point = this.graph.getPointForEvent(evt);
			geo.x = this.graph.snap(point.x - geo.width / 2);
			geo.y = this.graph.snap(point.y - geo.height / 2);
		}

		return clone;		
	};

	/**
	 * Function: createEdge
	 * 
	 * Creates and returns a new edge using <factoryMethod> if one exists. If
	 * no factory method is defined, then a new default edge is returned. The
	 * source and target arguments are informal, the actual connection is
	 * setup later by the caller of this function.
	 * 
	 * Parameters:
	 * 
	 * source - <mxCell> that represents the source terminal.
	 * target - <mxCell> that represents the target terminal.
	 */
	mxConnectionHandler.prototype.createEdge = function(source, target)
	{
		var edge = null;
		
		// Creates a new edge using the factoryMethod
		if (this.factoryMethod != null)
		{
			edge = this.factoryMethod(source, target);
		}
		else
		{
			edge = new mxCell('');
			edge.setEdge(true);
			
			var geo = new mxGeometry();
			geo.relative = true;
			edge.setGeometry(geo);
		}
		
		return edge;
	};
	
	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes. This should be
	 * called on all instances. It is called automatically for the built-in
	 * instance created for each <mxGraph>.
	 */
	mxConnectionHandler.prototype.destroy = function()
	{
		this.graph.removeGraphListener(this);
		this.shape.destroy();
		this.shape = null;
		this.marker.destroy();
		this.marker = null;
	};

}
