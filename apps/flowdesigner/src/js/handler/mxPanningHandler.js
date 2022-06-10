/**
 * $Id: mxPanningHandler.js,v 1.51 2008/11/18 22:28:28 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxPanningHandler
 * 
 * Event handler that pans and creates popupmenus. To use the left
 * mousebutton for panning without interfering with cell moving and
 * resizing, use <isUseLeftButton> and <isIgnoreCell>. For grid size
 * steps while panning, use <useGrid>. This handler is built-into
 * <mxGraph.panningHandler> and enabled using <mxGraph.setPanning>.
 */
{

	/**
	 * Constructor: mxPanningHandler
	 * 
	 * Constructs an event handler that creates a <mxPopupMenu>
	 * and pans the graph.
	 */
	function mxPanningHandler(graph, factoryMethod)
	{
		if (graph != null &&
			document.body != null)
		{
			this.graph = graph;
			this.factoryMethod = factoryMethod;
			this.graph.addGraphListener(this);
		}
	};
	
	/**
	 * Extends mxPopupMenu.
	 */
	mxPanningHandler.prototype = new mxPopupMenu();
	mxPanningHandler.prototype.constructor = mxPanningHandler;

	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxPanningHandler.prototype.graph = null;

	/**
	 * Variable: usePopupTrigger
	 * 
	 * Specifies if the <isPopupTrigger> should also be used for panning. To
	 * avoid conflicts, the panning is only activated if the mouse was moved
	 * more than <mxGraph.tolerance>, otherwise, a single click is assumed
	 * and the popupmenu is displayed. Default is true.
	 */
	mxPanningHandler.prototype.usePopupTrigger = true;
	
	/**
	 * Variable: useLeftButtonForPanning
	 * 
	 * Specifies if panning should be active for the left mouse button.
	 * Setting this to true may conflict with <mxRubberband>. Default is false.
	 */
	mxPanningHandler.prototype.useLeftButtonForPanning = false;

	/**
	 * Variable: selectOnPopup
	 * 
	 * Specifies if cells should be selected if a popupmenu is displayed for
	 * them. Default is true.
	 */
	mxPanningHandler.prototype.selectOnPopup = true;

	/**
	 * Variable: clearSelectionOnBackground
	 * 
	 * Specifies if cells should be deselected if a popupmenu is displayed for
	 * the diagram background. Default is true.
	 */
	mxPanningHandler.prototype.clearSelectionOnBackground = true;

	/**
	 * Variable: ignoreCell
	 * 
	 * Specifies if panning should be active even if there is a cell under the
	 * mousepointer. Default is false.
	 */
	mxPanningHandler.prototype.ignoreCell = false;
	
	/**
	 * Variable: useGrid
	 * 
	 * Specifies if the panning steps should be aligned to the grid size.
	 * Default is false.
	 */
	mxPanningHandler.prototype.useGrid = false;
	
	/**
	 * Variable: panningEnabled
	 * 
	 * Specifies if panning should be enabled. Default is true.
	 */
	mxPanningHandler.prototype.panningEnabled = true;

	/**
	 * Function: init
	 * 
	 * Initializes the shapes required for this vertex handler.
	 */
	mxPanningHandler.prototype.init = function()
	{
		// Supercall
		mxPopupMenu.prototype.init.apply(this);

		// Hides the tooltip if the mouse is over
		// the context menu
		var self = this; // closure
		mxEvent.addListener(this.div, 'mousemove', function(evt)
		{
			self.graph.tooltipHandler.hide();
		});
	};
	
	/**
	 * Function: isPanningTrigger
	 * 
	 * Returns true if the given event is a panning trigger for the optional
	 * given cell.
	 */
	mxPanningHandler.prototype.isPanningTrigger = function(evt, cell)
	{
		return (this.useLeftButtonForPanning &&
				(this.ignoreCell ||
				(cell == null)) &&
				mxEvent.isLeftMouseButton(evt)) ||
			   (this.useShiftKey &&
			   	evt.shiftKey) ||
			   (this.usePopupTrigger &&
			   	mxEvent.isPopupTrigger(evt));
	};

	/**
	 * Function: mouseDown
	 * 
	 * Handles the event by initiating the panning. By consuming the event all
	 * subsequent events of the gesture are redirected to this handler.
	 */
	mxPanningHandler.prototype.mouseDown = function(evt, cell)
	{
		if (this.isEnabled())
		{
			// Hides the popupmenu if is is being displayed
			this.hideMenu();

			this.dx0 = -this.graph.container.scrollLeft;
			this.dy0 = -this.graph.container.scrollTop;
			
			// Checks the event triggers to panning and popupmenu
			this.popupTrigger = this.isPopupTrigger(evt, cell);
			this.panningTrigger = this.panningEnabled &&
				this.isPanningTrigger(evt, cell);
	
			// Stores the location of the trigger event
			this.startX = evt.clientX;
			this.startY = evt.clientY;
			
			// Consumed the event to receive all subsequent events
			// for this gesture
			if ((this.panningEnabled &&
				this.panningTrigger) ||
				this.popupTrigger)
			{
				mxEvent.consume(evt);
			}
		}
	};

	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by updating the panning on the graph.
	 */
	mxPanningHandler.prototype.mouseMove = function(evt, cell)
	{
		var dx = evt.clientX - this.startX;
		var dy = evt.clientY - this.startY;
		
		if (this.active)
		{
			// Applies the grid to the panning steps
			if (this.useGrid)
			{
				dx = this.graph.snap(dx);
				dy = this.graph.snap(dy);
			}
			
			this.graph.shift(dx+this.dx0, dy+this.dy0);
			mxEvent.consume(evt);
		}
		else if (this.panningTrigger)
		{
			// Panning is activated only if the mouse is moved
			// beyond the graph tolerance
			this.active = Math.abs(dx) > this.graph.tolerance ||
				Math.abs(dy) > this.graph.tolerance;
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by setting the translation on the view or showing the
	 * popupmenu.
	 */
	mxPanningHandler.prototype.mouseUp = function(evt, cell)
	{
		// Shows popup menu if mouse was not moved
		var dx = Math.abs(evt.clientX - this.startX);
		var dy = Math.abs(evt.clientY - this.startY);

		if (this.active)
		{
			var style = mxUtils.getCurrentStyle(this.graph.container);
			
			if (!mxUtils.hasScrollbars(this.graph.container))
			{
				this.graph.shift(0, 0);
				
				var dx = evt.clientX - this.startX;
				var dy = evt.clientY - this.startY;
				
				var scale = this.graph.getView().scale;
				var t = this.graph.getView().translate;
				
				this.pan(t.x + dx/scale, t.y + dy/scale);
			}
						
			mxEvent.consume(evt);
		}
		else if (this.popupTrigger)
		{
			if (dx < this.graph.tolerance &&
				dy < this.graph.tolerance)
			{
				// Selects the cell for which the context menu is being displayed
				if (this.graph.isEnabled() &&
					this.selectOnPopup &&
					cell != null &&
					!this.graph.isCellSelected(cell))
				{
					this.graph.setSelectionCell(cell);
				}
				
				if (this.clearSelectionOnBackground &&
					!this.graph.isCellSelected(cell))
				{
					this.graph.clearSelection();
				}
				
				// Hides the tooltip if there is one
				this.graph.tooltipHandler.hide();
				var origin = mxUtils.getScrollOrigin();
				var point = new mxPoint(
					evt.clientX + origin.x,
					evt.clientY + origin.y);
				this.popup(point.x, point.y, cell, evt);
			}
			
			mxEvent.consume(evt);
		}
		
		this.panningTrigger = false;
		this.popupTrigger = false;
		this.active = false;
	};

	/**
	 * Function: pan
	 * 
	 * Pans <graph> by the given amount.
	 */
	mxPanningHandler.prototype.pan = function(dx, dy)
	{
		this.graph.getView().setTranslate(dx, dy);
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes.
	 */
	mxPanningHandler.prototype.destroy = function()
	{
		this.graph.removeGraphListener(this);
		
		// Supercall
		mxPopupMenu.prototype.destroy.apply(this);
	};

}
