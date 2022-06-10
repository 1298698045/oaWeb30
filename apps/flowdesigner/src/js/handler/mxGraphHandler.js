/**
 * $Id: mxGraphHandler.js,v 1.46 2009/01/23 14:49:45 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGraphHandler
 * 
 * Graph event handler that handles selection. Individual cells are handled
 * separately using <mxVertexHandler> or one of the edge handlers. These
 * subhandlers are created using <mxGraph.createHandler> in
 * <mxGraphSelection.cellAdded>.
 */
{

	/**
	 * Constructor: mxGraphHandler
	 * 
	 * Constructs an event handler that creates handles for the
	 * selection cells.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 */
	function mxGraphHandler(graph)
	{
		this.graph = graph;
		
		if (document.body != null)
		{
			this.graph.addGraphListener(this);
		}
	};
	
	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxGraphHandler.prototype.graph = null;
	
	/**
	 * Variable: maxCells
	 * 
	 * Defines the maximum number of cells to paint subhandles
	 * for. Default is 50 for Firefox and 20 for IE. Set this
	 * to 0 if you want an unlimited number of handles to be
	 * displayed. This is only recommended if the number of
	 * cells in the graph is limited to a small number, eg.
	 * 500.
	 */
	mxGraphHandler.prototype.maxCells = (mxClient.IS_IE) ? 20 : 50;

	/**
	 * Variable: enabled
	 * 
	 * Specifies if events are handled. Default is true.
	 */
	mxGraphHandler.prototype.enabled = true;

	/**
	 * Variable: cloneEnabled
	 * 
	 * Specifies if cloning by control-drag is enabled. Default is true.
	 */
	mxGraphHandler.prototype.cloneEnabled = true;

	/**
	 * Variable: minimumSize
	 * 
	 * Specifies the minimum number of pixels for the width and height of a
	 * selection border. Default is 6.
	 */
	mxGraphHandler.prototype.minimumSize = 6;

	/**
	 * Variable: connectOnDrop
	 * 
	 * Specifies if drop events are interpreted as new connections if no other
	 * drop action is defined. Default is false.
	 */
	mxGraphHandler.prototype.connectOnDrop = false;

	/**
	 * Variable: scrollOnMove
	 * 
	 * Specifies if the view should be scrolled so that a moved cell is
	 * visible. Default is true.
	 */
	mxGraphHandler.prototype.scrollOnMove = true;
	
	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation
	 * returns <enabled>.
	 */
	mxGraphHandler.prototype.isEnabled = function()
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
	mxGraphHandler.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};
	
	/**
	 * Function: mouseDown
	 * 
	 * Handles the event by selecing the given cell and creating a handle for
	 * it. By consuming the event all subsequent events of the gesture are
	 * redirected to this handler.
	 */
	mxGraphHandler.prototype.mouseDown = function(evt, cell, index)
	{
		if (this.isEnabled() &&
			this.graph.isEnabled() &&
			!mxEvent.isForceMarqueeEvent(evt) &&
			index == null &&
			cell != null)
		{
			this.cell = null;
			this.delayedSelection = this.graph.isCellSelected(cell);
			
			if (!this.delayedSelection)
			{
				this.graph.selectCellForEvent(cell, evt);
			}
			
			var model = this.graph.model;
			var geo = model.getGeometry(cell);
			
			if (this.graph.isMovable(cell) &&
				((!model.isEdge(cell) ||
				this.graph.getSelectionCount() > 1 ||
				(geo.points != null && geo.points.length > 0) ||
				model.getTerminal(cell, true) == null ||
				model.getTerminal(cell, false) == null) ||
				this.graph.allowDanglingEdges ||
				(mxEvent.isCloneEvent(evt) &&
				this.graph.isCloneable())))
			{
				this.start(evt, cell, index);
			}
			
			this.cellWasClicked = true;
			mxEvent.consume(evt);
		}
	};
	
	/**
	 * Function: start
	 * 
	 * Starts the handling of the mouse gesture.
	 */
	mxGraphHandler.prototype.start = function(evt, cell, index)
	{
		var point = mxUtils.convertPoint(this.graph.container,
				evt.clientX, evt.clientY);
		
		this.startX = point.x;
		this.startY = point.y;
		
		var tmp = this.graph.getSelectionCells();
		this.cells = new Array();
		
		for (var i=0; i<tmp.length; i++)
		{
			if (this.graph.isMovable(tmp[i]))
			{
				this.cells.push(tmp[i]);
			}
		}
		
		this.bounds = this.graph.getView().getBounds(this.cells);
		
		if (this.bounds != null)
		{
			if (this.bounds.width < this.minimumSize)
			{
				var dx = this.minimumSize - this.bounds.width;
				this.bounds.x -= dx / 2;
				this.bounds.width = this.minimumSize;
			}
			
			if (this.bounds.height < this.minimumSize)
			{
				var dy = this.minimumSize - this.bounds.height;
				this.bounds.y -= dy / 2;
				this.bounds.height = this.minimumSize;
			}
			
			this.shape = new mxRectangleShape(this.bounds, null, 'black');

			// Makes sure to use either VML or SVG shapes in
			// order to provide event-transparency for the
			// background area of the rectangle.
			// FIXME: In Webkit the repaint of the dirty rectangle does not
			// include the topmost horizontal line of the shape. This is a
			// known bug in Webkit.
			this.shape.dialect = (this.graph.dialect != mxConstants.DIALECT_SVG) ?
				mxConstants.DIALECT_VML : mxConstants.DIALECT_SVG;
			this.shape.isDashed = true;
			this.shape.init(this.graph.getView().getOverlayPane());

			// Event-transparency
			if (this.graph.dialect != mxConstants.DIALECT_SVG)
			{
				var self = this;
				// Graph will direct subsequent gesture events here
				mxEvent.addListener(this.shape.node, 'mousemove', function (evt)
				{
					self.graph.dispatchGraphEvent('mousemove', evt, self.target || self.cell);
				});
			}
			else
			{
				this.shape.node.setAttribute('style', 'pointer-events:none;');
			}
			
			this.shape.node.style.visibility = 'hidden';

			this.highlight = new mxRectangleShape(new mxRectangle(0, 0, 0, 0), null,
				mxConstants.DROP_TARGET_COLOR, '3');
			this.highlight.dialect = this.shape.dialect;
			this.highlight.init(this.graph.getView().getOverlayPane());

			// Event-transparency
			if (this.graph.dialect != mxConstants.DIALECT_SVG)
			{
				var self = this;
				mxEvent.addListener(this.highlight.node, 'mousemove', function (evt)
				{
					// Graph will direct subsequent gesture events here
					self.graph.dispatchGraphEvent('mousemove', evt, self.target);
				});
			}
			else
			{
				this.highlight.node.setAttribute('style', 'pointer-events:none;');
			}
		
			this.cell = cell;
			this.highlight.node.style.visibility = 'hidden';
		}
	};

	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by highlighting possible drop targets and updating the
	 * preview.
	 */
	mxGraphHandler.prototype.mouseMove = function(evt, cell)
	{
		var graph = this.graph;
		
		if (this.cell != null)
		{
			if (this.shape != null &&
				this.shape.node != null)
			{
				var point = mxUtils.convertPoint(this.graph.container,
						evt.clientX, evt.clientY);
				var dx = point.x - this.startX;
				var dy = point.y - this.startY;
				var tol = graph.tolerance;

				if (this.shape.node.style.visibility == 'visible' ||
					Math.abs(dx) > tol || Math.abs(dy) > tol)
				{
					var trx = graph.getView().translate;
					var scale = graph.getView().scale;
					
					// Moves cells that are off-grid back to the grid on move
					if (mxEvent.isGridEnabledEvent(evt))
					{
						var tx = this.bounds.x - (this.graph.snap(this.bounds.x / scale - trx.x) + trx.x) * scale;
						var ty = this.bounds.y - (this.graph.snap(this.bounds.y / scale - trx.y) + trx.y) * scale;
					
						dx = this.graph.snap(dx / scale) * scale - tx;
						dy = this.graph.snap(dy / scale) * scale - ty;
					}
									
					// Constrained movement if shift key is pressed
					if (evt.shiftKey)
					{
						if (Math.abs(dx) > Math.abs(dy))
						{
							dy = 0;
						}
						else
						{
							dx = 0;
						}
					}
					
					var bounds = new mxRectangle(
						this.bounds.x+dx,
						this.bounds.y+dy,
						this.bounds.width,
						this.bounds.height);
					
					this.shape.bounds = bounds;
					this.shape.node.style.visibility = 'visible';
					this.shape.redraw();
					
					var target = (graph.isDropEnabled()) ?
						graph.getDropTarget(this.cells, evt, cell) : null;
					var parent = target;
					var model = graph.getModel();
					
					while (parent != null && parent != this.cell)
					{
						parent = model.getParent(parent);
					}
					
					var clone = mxEvent.isCloneEvent(evt) &&
						graph.isCloneable() &&
						this.cloneEnabled;
					var state = graph.getView().getState(target);
					
					if (!graph.isCellSelected(target) &&
					    state != null && parent == null &&
					    (model.getParent(this.cell) != target ||
					    clone))
					{
					    if (this.target != target)
					    {
						    this.target = target;
						    
						    this.setHighlightColor(mxConstants.DROP_TARGET_COLOR);
							this.highlight.bounds = state;
							this.highlight.node.style.visibility = 'visible';
							this.highlight.redraw();
						}
					}
					else
					{
						this.target = null;
						
						if (this.connectOnDrop &&
							cell != null &&
							this.cells.length == 1 &&
							graph.getModel().isVertex(cell) &&
							graph.getModel().isConnectable(cell))
						{
							var state = graph.getView().getState(cell);
							
							if (state != null)
							{
								var error = graph.getEdgeValidationError(null, this.cell, cell);
								var color = (error == null) ?
									mxConstants.VALID_COLOR :
									mxConstants.INVALID_CONNECT_TARGET_COLOR;
								this.setHighlightColor(color);
								
								this.highlight.bounds = state;
								this.highlight.node.style.visibility = 'visible';
								this.highlight.redraw();
							}
							else
							{
								this.highlight.node.style.visibility = 'hidden';
							}
						}
						else
						{
							this.highlight.node.style.visibility = 'hidden';
						}
					}
				}
			}
			
			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: setHighlightColor
	 * 
	 * Sets the color of the rectangle used to highlight drop targets.
	 * 
	 * Parameters:
	 * 
	 * color - String that represents the new highlight color.
	 */
	mxGraphHandler.prototype.setHighlightColor = function(color)
	{
		if (this.highlight.dialect == mxConstants.DIALECT_SVG)
		{
			this.highlight.innerNode.setAttribute('stroke', color);
		}
		else
		{
			this.highlight.node.setAttribute('strokecolor', color);
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by applying the changes to the selection cells.
	 */
	mxGraphHandler.prototype.mouseUp = function(evt, cell)
	{
		var graph = this.graph;
		
		if (this.cell != null &&
			this.shape != null &&
			this.shape.node.style.visibility == 'visible')
		{
			var point = mxUtils.convertPoint(this.graph.container,
					evt.clientX, evt.clientY);
			
			var trx = graph.getView().translate;
			var scale = graph.getView().scale;
			var clone = mxEvent.isCloneEvent(evt) && graph.isCloneable() && this.cloneEnabled;
			
			var dx = (point.x - this.startX) / scale;
			var dy = (point.y - this.startY) / scale;
			
			// Moves cells that are off-grid back to the grid on move
			if (mxEvent.isGridEnabledEvent(evt))
			{
				var tx = this.bounds.x - (this.graph.snap(this.bounds.x / scale - trx.x) + trx.x) * scale;
				var ty = this.bounds.y - (this.graph.snap(this.bounds.y / scale - trx.y) + trx.y) * scale;
			
				dx = graph.snap(dx) - tx / scale;
				dy = graph.snap(dy) - ty / scale;
			}
			
			// Constrained movement if shift key is pressed
			if (evt.shiftKey)
			{
				if (Math.abs(dx) > Math.abs(dy))
				{
					dy = 0;
				}
				else
				{
					dx = 0;
				}
			}
			
			if (this.connectOnDrop &&
				this.target == null &&
				cell != null &&
				graph.getModel().isVertex(cell) &&
				graph.getModel().isConnectable(cell) &&
				graph.isEdgeValid(null, this.cell, cell))
			{
				this.graph.connectionHandler.connect(this.cell, cell, evt);
			}
			else
			{
				this.move(this.graph.getSelectionCells(),
					dx, dy, clone, this.target, evt);
			}
		}
		else if (this.delayedSelection && this.cell != null)
		{
			this.graph.selectCellForEvent(this.cell, evt);
		}

		// Consumes the event if a cell was initially clicked
		if (this.cellWasClicked)
		{
			mxEvent.consume(evt);
		}

		this.reset();
	};

	/**
	 * Function: reset
	 * 
	 * Resets the state of this handler.
	 */
	mxGraphHandler.prototype.reset = function()
	{
		// Destroys the preview dashed rectangle
		if (this.shape != null)
		{
			this.shape.destroy();
			this.shape = null;
		}
		
		// Destroys the drop target highlight
		if (this.highlight != null)
		{
			this.highlight.destroy();
			this.highlight = null;
		}
		
		this.cellWasClicked = false;
		this.delayedSelection = false;
		this.cell = null;
		this.target = null;
	};

	/**
	 * Function: move
	 * 
	 * Moves the given cells by the specified amount.
	 */
	mxGraphHandler.prototype.move = function(cells, dx, dy, clone, target, evt)
	{
		// Passes all selected cells in order to correctly clone or move into
		// the target cell. The method checks for each cell if its movable.
		var cells = this.graph.move(cells, dx, dy, clone, target, evt);
		
		if (this.scrollOnMove)
		{
			this.graph.scrollCellToVisible(cells[0]);
		}
				
		// Selects the new cells if cells have been cloned
		if (clone)
		{
			this.graph.setSelectionCells(cells);
		}
	};
	
	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes.
	 */
	mxGraphHandler.prototype.destroy = function()
	{
		this.graph.removeGraphListener(this);
		if (this.shape != null)
		{
			this.shape.destroy();
			this.shape = null;
		}
		
		if (this.highlight != null)
		{
			this.highlight.destroy();
			this.highlight = null;
		}
	};

}
