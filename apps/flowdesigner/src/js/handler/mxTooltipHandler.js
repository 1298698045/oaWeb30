/**
 * $Id: mxTooltipHandler.js,v 1.36 2008/07/11 12:22:45 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxTooltipHandler
 * 
 * Graph event handler that displays tooltips. <mxGraph.getTooltip> is used to
 * get the tooltip for a cell or handle. This handler is built-into
 * <mxGraph.tooltipHandler> and enabled using <mxGraph.setTooltips>.
 *
 * Example:
 * 
 * (code>
 * new mxTooltipHandler(graph);
 * (end)
 */
{

	/**
	 * Constructor: mxTooltipHandler
	 * 
	 * Constructs an event handler that displays tooltips with the specified
	 * delay (in milliseconds). If no delay is specified then a default delay
	 * of 500 ms (0.5 sec) is used.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 * delay - Optional delay in milliseconds.
	 */
	function mxTooltipHandler(graph, delay)
	{
		if (graph != null)
		{
			this.graph = graph;
			this.delay = delay || 500;
			
			if (document.body != null)
			{
				this.graph.addGraphListener(this);
			}
		}
	};

	/**
	 * Variable: zIndex
	 * 
	 * Specifies the zIndex for the tooltip and its shadow. Default is 10005.
	 */
	mxTooltipHandler.prototype.zIndex = 10005;
	
	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxTooltipHandler.prototype.graph = null;
	
	/**
	 * Variable: delay
	 * 
	 * Delay to show the tooltip in milliseconds. Default is 500.
	 */
	mxTooltipHandler.prototype.delay = null;
	
	/**
	 * Variable: hideOnHover
	 * 
	 * Specifies if the tooltip should be hidden if the mouse is moved over the
	 * current cell. Default is false.
	 */
	mxTooltipHandler.prototype.hideOnHover = false;
	
	/**
	 * Variable: enabled
	 * 
	 * Specifies if events are handled. Default is true.
	 */
	mxTooltipHandler.prototype.enabled = true;
	
	/**
	 * Function: init
	 * 
	 * Initializes the DOM nodes required for this tooltip handler.
	 */
	mxTooltipHandler.prototype.init = function()
	{
		if (document.body != null)
		{
			this.div = document.createElement('div');
			
			this.div.className = 'mxTooltip';
			this.div.style.position = 'absolute';
			this.div.style.visibility = 'hidden';
			this.div.style.zIndex = this.zIndex;
			
			if (!mxClient.IS_IE &&
				mxClient.TOOLTIP_SHADOWS)
			{
				this.shadow = document.createElement('div');
				this.shadow.style.position = 'absolute';
				this.shadow.style.visibility = 'hidden';
				this.shadow.style.background = mxConstants.SVG_SHADOWCOLOR;
				this.shadow.style.zIndex = this.zIndex;
				mxUtils.setOpacity(this.shadow, 70);
				document.body.appendChild(this.shadow);
			}
			else if (mxClient.IS_IE &&
				!mxClient.TOOLTIP_SHADOWS)
			{
				this.div.style.filter = '';
			}
			
			document.body.appendChild(this.div);
			
			var self = this; // closure
			mxEvent.addListener(this.div, 'mousedown', function(evt)
			{
				self.hide();
			});
		}
	};

	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation
	 * returns <enabled>.
	 */
	mxTooltipHandler.prototype.isEnabled = function()
	{
		return this.enabled;
	};

	/**
	 * Function: setEnabled
	 * 
	 * Enables or disables event handling. This implementation
	 * updates <enabled>.
	 */
	mxTooltipHandler.prototype.setEnabled = function(enabled)
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
	mxTooltipHandler.prototype.mouseDown = function(evt, cell, index)
	{
		this.reset(evt, cell, index, false);
		this.hide();
	};

	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by updating the rubberband selection.
	 */
	mxTooltipHandler.prototype.mouseMove = function(evt, cell, index)
	{
		if (evt.clientX != this.lastX ||
			evt.clientY != this.lastY)
		{
			this.reset(evt, cell, index, true);
			
			if (this.hideOnHover ||
				cell != this.cell ||
				index != this.index)
			{
				this.hide();
			}
		}
		this.lastX = evt.clientX;
		this.lastY = evt.clientY;
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by resetting the tooltip timer or hiding the existing
	 * tooltip.
	 */
	mxTooltipHandler.prototype.mouseUp = function(evt, cell, index)
	{
		this.reset(evt, cell, index, true);
		this.hide();
	};

	/**
	 * Function: reset
	 * 
	 * Resets and/or restarts the timer to trigger the display of the tooltip.
	 */
	mxTooltipHandler.prototype.reset = function(evt, cell, index, restart)
	{
		if (this.thread != null)
		{
			window.clearTimeout(this.thread);
			this.thread = null;
		}
		
		if (restart &&
			this.isEnabled() &&
			cell != null && 
			this.div.style.visibility == 'hidden')
		{
			var x = evt.clientX;
			var y = evt.clientY;
			
			var self = this; // closure
			this.thread = window.setTimeout(function()
			{
				if (!self.graph.isEditing() &&
					!self.graph.panningHandler.isMenuShowing())
				{
					var tip = self.graph.getTooltip(cell,index);
					self.show(tip, x, y);
					self.cell = cell;
					self.index = index;
				}
			}, this.delay);
		}
	};

	/**
	 * Function: hide
	 * 
	 * Hides the tooltip.
	 */
	mxTooltipHandler.prototype.hide = function()
	{
		if (this.shadow != null)
		{
			this.shadow.style.visibility = 'hidden';
		}

		if (this.div != null)
		{
			this.div.style.visibility = 'hidden';
		}
	};

	/**
	 * Function: show
	 * 
	 * Shows the tooltip for the specified cell and optional index at the
	 * specified location (with a vertical offset of 10 pixels).
	 */
	mxTooltipHandler.prototype.show = function(tip, x, y)
	{
		if (tip != null && tip.length > 0)
		{
			var origin = mxUtils.getScrollOrigin();
			
			this.div.style.left = (x + origin.x) + 'px';
			this.div.style.top = (y + mxConstants.TOOLTIP_VERTICAL_OFFSET +
				origin.y) + 'px';

			if (!mxUtils.isNode(tip))
			{	
				this.div.innerHTML = tip.replace(/\n/g, '<br>');
			}
			else
			{
				this.div.innerHTML = '';
				this.div.appendChild(tip);
			}
			
			this.div.style.visibility = '';
			mxUtils.fit(this.div);

			if (this.shadow != null)
			{
				this.shadow.style.width = this.div.offsetWidth+'px';
				this.shadow.style.height = this.div.offsetHeight+'px';
				
				this.shadow.style.left = (parseInt(this.div.style.left) + 3)+'px';
				this.shadow.style.top = (parseInt(this.div.style.top) + 3)+'px';
				
				this.shadow.style.visibility = '';
			}
		}
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes.
	 */
	mxTooltipHandler.prototype.destroy = function()
	{
		this.graph.removeGraphListener(this);
		mxUtils.release(this.div);
		
		if (this.div.parentNode != null)
		{
			this.div.parentNode.removeChild(this.div);
		}
		
		this.div = null;
		
		if (this.shadow != null)
		{
			mxUtils.release(this.shadow);
		
			if (this.shadow.parentNode != null)
			{
				this.shadow.parentNode.removeChild(this.shadow);
			}
			
			this.shadow = null;
		}
	};

}
