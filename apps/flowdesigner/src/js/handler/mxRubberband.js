/**
 * $Id: mxRubberband.js,v 1.21 2008/05/27 09:07:36 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxRubberband
 * 
 * Event handler that selects rectangular regions. This is not built-into
 * <mxGraph>. To enable rubberband selection in a graph, use the following
 * code.
 * 
 * Example:
 * 
 * (code)
 * var rubberband = new mxRubberband(graph);
 * (end)
 */
{

	/**
	 * Constructor: mxRubberband
	 * 
	 * Constructs an event handler that selects rectangular
	 * regions in the graph using rubberband selection.
	 */
	function mxRubberband(graph)
	{
		if (graph != null)
		{
			this.graph = graph;
			this.graph.addGraphListener(this);
			
			// Creates the DIV that represents the marquee (rubberband)
			this.div = document.createElement('div');
			this.div.className = 'mxRubberband';
			mxUtils.setOpacity(this.div, this.defaultOpacity);
			
			// If this line and mxCellEditor installation of listeners are
			// removed, then IE does not leak the div and textarea.
			mxEvent.redirectMouseEvents(this.div, this.graph);
			
			// Automatic deallocation of memory
			if (mxClient.IS_IE)
			{
				var self = this; // closure
				mxEvent.addListener(window, 'unload', function()
				{
					self.destroy();
				});
			}
		}
	};

	/**
	 * Variable: defaultOpacity
	 * 
	 * Specifies the default opacity to be used for the rubberband div.
	 * Default is 20.
	 */
	mxRubberband.prototype.defaultOpacity = 20;
	
	/**
	 * Variable: enabled
	 * 
	 * Specifies if events are handled. Default is true.
	 */
	mxRubberband.prototype.enabled = true;
	
	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation
	 * returns <enabled>.
	 */
	mxRubberband.prototype.isEnabled = function()
	{
		return this.enabled;
	};
			
	/**
	 * Function: setEnabled
	 * 
	 * Enables or disables event handling. This implementation
	 * updates <enabled>.
	 */
	mxRubberband.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};
	
	/**
	 * Function: mouseDown
	 * 
	 * Handles the event by initiating a rubberband selection. By consuming the
	 * event all subsequent events of the gesture are redirected to this
	 * handler.
	 */
	mxRubberband.prototype.mouseDown = function(evt, cell, index)
	{
		if (this.graph.isEnabled() &&
			this.isEnabled() &&
			cell == null &&
			index == null)
		{
			var offset = mxUtils.getOffset(this.graph.container);
			var origin = mxUtils.getScrollOrigin(this.graph.container);
			
			origin.x -= offset.x;
			origin.y -= offset.y;
			
			this.startX = evt.clientX + origin.x;
			this.startY = evt.clientY + origin.y;
			this.redraw(evt);
			
			// Returns state from fading out
			this.div.style.visibility = 'visible';
			this.graph.container.appendChild(this.div);
			
			this.active = true;
			mxEvent.consume(evt);
		}
		else
		{
			this.active = false;
		}
	};

	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by updating therubberband selection.
	 */
	mxRubberband.prototype.mouseMove = function(evt)
	{
		if (this.active)
		{
			this.redraw(evt);
			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by selecting the region of the rubberband using
	 * <mxGraph.selectRegion>.
	 */
	mxRubberband.prototype.mouseUp = function(evt)
	{
		if (this.active)
		{
			this.reset();
			
			var rect = new mxRectangle(
				this.x,
				this.y,
				this.width,
				this.height);

			if (rect.width > this.graph.tolerance ||
				rect.height > this.graph.tolerance)
			{
				this.graph.selectRegion(rect, evt);
				mxEvent.consume(evt);
			}
		}
	};

	/**
	 * Function: reset
	 * 
	 * Resets the state of the rubberband selection.
	 */
	mxRubberband.prototype.reset = function(evt)
	{
		if (mxClient.FADE_RUBBERBAND)
		{
			mxUtils.fadeOut(this.div, 30, true, 10, null,
				mxClient.FADE_RUBBERBAND);
		}
		else
		{
			this.div.parentNode.removeChild(this.div);
		}

		this.active = false;		
	};

	/**
	 * Function: redraw
	 * 
	 * Updates the DIV node used to display the
	 * marquee (aka rubberband) region.
	 */
	mxRubberband.prototype.redraw = function(evt)
	{
		var origin = mxUtils.getScrollOrigin(this.graph.container);
		var offset = mxUtils.getOffset(this.graph.container);
			
		origin.x -= offset.x;
		origin.y -= offset.y;
		
		var x = evt.clientX + origin.x;
		var y = evt.clientY + origin.y;
		
		this.x = Math.min(this.startX, x);
		this.y = Math.min(this.startY, y);
		this.width = Math.max(this.startX, x) - this.x;
		this.height =  Math.max(this.startY, y) - this.y;
		
		this.div.style.left = this.x+'px';
		this.div.style.top = this.y+'px';
		this.div.style.width = Math.max(1, this.width)+'px';
		this.div.style.height = Math.max(1, this.height)+'px';
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes. This does
	 * normally not need to be called, it is called automatically when the
	 * window unloads.
	 */
	mxRubberband.prototype.destroy = function()
	{
		if (!this.destroyed)
		{
			this.destroyed = true;

			this.graph.removeGraphListener(this);
			mxUtils.release(this.div);
			
			if (this.div.parentNode != null)
			{
				this.div.parentNode.removeChild(this.div);
			}
			
			this.div = null;
		}
	};

}
