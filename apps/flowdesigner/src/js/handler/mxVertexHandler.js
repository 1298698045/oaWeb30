/**
 * $Id: mxVertexHandler.js,v 1.38 2009/01/23 14:49:45 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxVertexHandler
 * 
 * Event handler for resizing cells. This handler is automatically created in
 * <mxGraph.createHandler>.
 */
{

	/**
	 * Constructor: mxVertexHandler
	 * 
	 * Constructs an event handler that allows to resize vertices
	 * and groups.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> of the cell to be resized.
	 */
	function mxVertexHandler(state)
	{
		if (state != null)
		{
			this.state = state;
			this.graph = state.view.graph;
			this.graph.addGraphListener(this);
			this.init();
			this.redraw();
		}
	};
	
	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxVertexHandler.prototype.graph = null;
		
	/**
	 * Variable: state
	 * 
	 * Reference to the <mxCellState> being modified.
	 */
	mxVertexHandler.prototype.state = null;
	
	/**
	 * Variable: LABEL_INDEX
	 * 
	 * Index for for specifying that the label handle is active.
	 * Default is -1. This value should not be changed.
	 */
	mxVertexHandler.prototype.LABEL_INDEX = -1;
	
	/**
	 * Variable: singleSizer
	 * 
	 * Specifies if only one sizer handle at the bottom, right corner should be
	 * used. Default is false.
	 */
	mxVertexHandler.prototype.singleSizer = false;

	/**
	 * Function: init
	 * 
	 * Initializes the shapes required for this vertex handler.
	 */
	mxVertexHandler.prototype.init = function()
	{
		this.bounds = new mxRectangle(
				this.state.x,
				this.state.y,
				this.state.width,
				this.state.height);

		this.selectionBorder = new mxRectangleShape(this.bounds, null, mxConstants.SELECTION_COLOR);
		this.selectionBorder.strokewidth = mxConstants.SELECTION_STROKEWIDTH;
		this.selectionBorder.isDashed =  mxConstants.SELECTION_DASHED;
		
		// Makes sure to use either VML or SVG shapes in
		// order to provide event-transparency for the
		// background area of the rectangle.
		this.selectionBorder.dialect =
			(this.graph.dialect != mxConstants.DIALECT_SVG) ?
			mxConstants.DIALECT_VML : mxConstants.DIALECT_SVG;
		this.selectionBorder.init(this.graph.getView().getOverlayPane());			
		
		// Event-transparency
		if (this.graph.dialect != mxConstants.DIALECT_SVG)
		{
			if (this.graph.isMovable(this.state.cell))
			{
				this.selectionBorder.node.style.cursor = 'move';
			}
			
			mxEvent.redirectMouseEvents(this.selectionBorder.node,
				this.graph, this.state.cell, null, true);
		}
		else
		{
			this.selectionBorder.node.setAttribute('style', 'pointer-events:none;');
		}

		// Adds the sizer handles
		if (mxGraphHandler.prototype.maxCells <= 0 ||
			this.graph.getSelectionCount() < mxGraphHandler.prototype.maxCells)
		{
			this.sizers = new Array();

			if (this.graph.isSizable(this.state.cell))
			{
				var i = 0;
				
				if (!this.singleSizer)
				{
					this.sizers.push(this.createSizer('nw-resize', i++));
					this.sizers.push(this.createSizer('n-resize', i++));
					this.sizers.push(this.createSizer('ne-resize', i++));
					this.sizers.push(this.createSizer('w-resize', i++));
					this.sizers.push(this.createSizer('e-resize', i++));
					this.sizers.push(this.createSizer('sw-resize', i++));
					this.sizers.push(this.createSizer('s-resize', i++));
				}
				
				this.sizers.push(this.createSizer('se-resize', i++));
				
				var geo = this.graph.model.getGeometry(this.state.cell);
				
				if (!geo.relative &&
					!this.graph.isSwimlane(this.state.cell) &&
					this.graph.isLabelMovable(this.state.cell))
				{
					this.sizers.push(this.createSizer('default', this.LABEL_INDEX,
						(this.graph.dialect == mxConstants.DIALECT_SVG) ? 4 : 6,
						mxConstants.LABEL_HANDLE_FILLCOLOR));
				}
			}
			else if (this.graph.isMovable(this.state.cell) &&
				!this.graph.isSizable(this.state.cell) &&
				this.state.width < 2 &&
				this.state.height < 2)
			{
				this.sizers.push(this.createSizer('move', null,
					null, mxConstants.LABEL_HANDLE_FILLCOLOR));
			}
		}
	};

	/**
	 * Function: createSizer
	 * 
	 * Creates a sizer handle for the specified cursor and index and returns
	 * the new <mxRectangleShape> that represents the handle.
	 */
	mxVertexHandler.prototype.createSizer = function(cursor, index, size, color)
	{
		size = size || ((this.graph.dialect == mxConstants.DIALECT_SVG) ? 5 : 7);
		
		var bounds = new mxRectangle(0, 0, size, size);
		var sizer = new mxRectangleShape(bounds,
				color || mxConstants.HANDLE_FILLCOLOR,
				mxConstants.HANDLE_STROKECOLOR);
		
		if (this.graph.dialect == mxConstants.DIALECT_SVG)
		{
			sizer.dialect = mxConstants.DIALECT_PREFERHTML;
			sizer.init(this.graph.container);
		}
		else
		{
			sizer.dialect = this.graph.dialect;
			sizer.init(this.graph.getView().getOverlayPane());
		}
		
		sizer.node.style.cursor = cursor;
		
		mxEvent.redirectMouseEvents(sizer.node,	this.graph, this.state.cell,
			index);
		
		// Edits on double click
		var self = this; // closure
		mxEvent.addListener(sizer.node, 'dblclick', function (evt)
		{
			self.graph.dblClick(evt, self.state.cell);
			mxEvent.consume(evt);
		});
		
		return sizer;
	};
	
	/**
	 * Function: createBounds
	 * 
	 * Helper method to create an <mxRectangle> around the given centerpoint
	 * with a width and height of 2*s or 6, if no s is given.
	 */
	mxVertexHandler.prototype.moveSizerTo = function(shape, x, y)
	{
		if (shape != null)
		{
			shape.bounds.x = x - shape.bounds.width / 2;
			shape.bounds.y = y - shape.bounds.height / 2;
			shape.redraw();
		}
	};

	/**
	 * Function: mouseDown
	 * 
	 * Handles the event if a handle has been clicked. By consuming the
	 * event all subsequent events of the gesture are redirected to this
	 * handler.
	 */
	mxVertexHandler.prototype.mouseDown = function(evt, cell, index)
	{
		if (this.graph.isEnabled() &&
			this.state.cell == cell &&
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
	mxVertexHandler.prototype.start = function(evt, cell, index)
	{
		this.index = index;
		var point = mxUtils.convertPoint(this.graph.container,
				evt.clientX, evt.clientY);
		this.startX = point.x;
		this.startY = point.y;
	};
	
	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by updating the preview.
	 */
	mxVertexHandler.prototype.mouseMove = function(evt)
	{
		var point = mxUtils.convertPoint(this.graph.container,
				evt.clientX, evt.clientY);

		if (this.index == this.LABEL_INDEX)
		{
			var offset = mxUtils.getOffset(this.graph.container);
			var origin = mxUtils.getScrollOrigin(this.graph.container);
			
			origin.x -= offset.x;
			origin.y -= offset.y;
			
			var x = point.x + origin.x;
			var y = point.y + origin.y;
			
			if (mxEvent.isGridEnabledEvent(evt))
			{
				x = this.graph.snap(x);
				y = this.graph.snap(y);
			}
			
			this.moveSizerTo(this.sizers[8], x, y);
			mxEvent.consume(evt);
		}
		else if (this.index != null)
		{
			var scale = this.graph.getView().scale;
			var dx = point.x - this.startX;
			var dy = point.y - this.startY;
			
			if (mxEvent.isGridEnabledEvent(evt))
			{
				dx = this.graph.snap(dx / scale) * scale;
				dy = this.graph.snap(dy / scale) * scale;
			}

			this.bounds = this.union(this.state, dx, dy, this.index);
			this.drawPreview();
			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by applying the changes to the geometry.
	 */
	mxVertexHandler.prototype.mouseUp = function(evt)
	{
		if (this.index != null &&
			this.state != null)
		{
			var point = mxUtils.convertPoint(this.graph.container,
					evt.clientX, evt.clientY);
			var scale = this.graph.getView().scale;

			var dx = (point.x - this.startX) / scale;
			var dy = (point.y - this.startY) / scale;
			
			if (mxEvent.isGridEnabledEvent(evt))
			{
				dx = this.graph.snap(dx);
				dy = this.graph.snap(dy);
			}
			
			this.resize(this.state.cell, dx, dy, this.index);
			this.reset();
			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: reset
	 * 
	 * Resets the state of this handler.
	 */
	mxVertexHandler.prototype.reset = function()
	{
		this.index = null;
		this.bounds = new mxRectangle(
				this.state.x,
				this.state.y,
				this.state.width,
				this.state.height);
		this.drawPreview();
	};

	/**
	 * Function: resize
	 * 
	 * Uses the given vector to change the bounds of the given cell
	 * in the graph using <mxGraph.resize>.
	 */
	mxVertexHandler.prototype.resize = function(cell, dx, dy, index)
	{
		var geo = this.graph.model.getGeometry(cell);
		
		if (index == this.LABEL_INDEX)
		{
			geo = geo.clone();
			
			if (geo.offset == null)
			{
				geo.offset = new mxPoint(dx, dy);
			}
			else
			{
				geo.offset.x += dx;
				geo.offset.y += dy;
			}
			
			this.graph.model.setGeometry(cell, geo);
		}
		else
		{
			var bounds = this.union(geo, dx, dy, index);
			this.graph.resize(cell, bounds);	
		}
	};
	
	/**
	 * Function: union
	 * 
	 * Returns the union of the given bounds and location for the specified
	 * handle index.
	 */
	mxVertexHandler.prototype.union = function(bounds, dx, dy, index)
	{
		if (this.singleSizer)
		{
			return new mxRectangle(
				bounds.x, bounds.y,
				Math.max(0, bounds.width + dx),
				Math.max(0, bounds.height + dy));
		}
		else
		{
			var left = bounds.x;
			var right = left + bounds.width;
			var top = bounds.y;
			var bottom = top + bounds.height;
			
			if (index > 4 /* Bottom Row */)
			{
				bottom = bottom + dy;
			}
			else if (index < 3 /* Top Row */)
			{
				top = top + dy;
			}
			
			if (index == 0 || index == 3 || index == 5 /* Left */)
			{
				left += dx;
			}
			else if (index == 2 || index == 4 || index == 7 /* Right */)
			{
				right += dx;
			}
			
			var width = right - left;
			var height = bottom - top;
			
			// Flips over left side
			if (width < 0)
			{
				left += width;
				width = Math.abs(width);
			}
			
			// Flips over top side
			if (height < 0)
			{
				top += height;
				height = Math.abs(height);
			}
			
			return new mxRectangle(left, top, width, height);
		}
	};

	/**
	 * Function: redraw
	 * 
	 * Redraws the handles and the preview.
	 */
	mxVertexHandler.prototype.redraw = function()
	{
		this.bounds = new mxRectangle(
			this.state.x, this.state.y,
			this.state.width, this.state.height);

		if (this.sizers != null)
		{
			var s = this.state;
			var r = s.x+s.width;
			var b = s.y+s.height;
			
			if (this.singleSizer)
			{
				this.moveSizerTo(this.sizers[0], r, b);
			}
			else
			{
				var cx = s.x+s.width/2;
				var cy = s.y+s.height/2;
				this.moveSizerTo(this.sizers[0], s.x, s.y);
				
				if (this.sizers.length > 1)
				{
					this.moveSizerTo(this.sizers[1], cx, s.y);
					this.moveSizerTo(this.sizers[2], r, s.y);
					this.moveSizerTo(this.sizers[3], s.x, cy);
					this.moveSizerTo(this.sizers[4], r, cy);
					this.moveSizerTo(this.sizers[5], s.x, b);
					this.moveSizerTo(this.sizers[6], cx, b);
					this.moveSizerTo(this.sizers[7], r, b);
					this.moveSizerTo(this.sizers[8],
						cx + s.absoluteOffset.x,
						cy + s.absoluteOffset.y);
				}
			}
		}

		this.drawPreview();
	};

	/**
	 * Function: drawPreview
	 * 
	 * Redraws the preview.
	 */
	mxVertexHandler.prototype.drawPreview = function()
	{
		this.selectionBorder.bounds = this.bounds;
		this.selectionBorder.redraw();
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes.
	 */
	mxVertexHandler.prototype.destroy = function()
	{
		this.graph.removeGraphListener(this);
		this.selectionBorder.destroy();
		this.selectionBorder = null;
		
		if (this.sizers != null)
		{
			for (var i=0; i<this.sizers.length; i++)
			{
				this.sizers[i].destroy();
				this.sizers[i] = null;
			}
		}
	};

}
