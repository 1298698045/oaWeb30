/**
 * $Id: mxHighlight.js,v 1.16 2008/05/28 11:44:46 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxHighlight
 * 
 * Event handler that highlights cells. Inherits from <mxCellMarker>.
 * 
 * Example:
 * 
 * (code)
 * new mxHighlight(graph, '#00FF00');
 * (end)
 */
{

	/**
	 * Constructor: mxHighlight
	 * 
	 * Constructs an event handler that highlights cells.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 * color - Color of the highlight. Default is blue.
	 * funct - Optional JavaScript function that is used to override
	 * <mxCellMarker.getCell>.
	 */
	function mxHighlight(graph, color, funct)
	{
		mxCellMarker.call(this, graph, color);

		this.graph.addGraphListener(this);
		
		if (funct != null)
		{
			this.getCell = funct;
		}
		
		// Automatic deallocation of memory
		if (mxClient.IS_IE)
		{
			var self = this; // closure
			mxEvent.addListener(window, 'unload', function()
			{
				self.destroy();
			});
		}
	};
	
	/**
	 * Extends mxCellMarker.
	 */
	mxHighlight.prototype = new mxCellMarker();
	mxHighlight.prototype.constructor = mxHighlight;

	/**
	 * Function: mouseDown
	 * 
	 * Ignores the event. The event is not consumed.
	 */
	mxHighlight.prototype.mouseDown = function(evt, cell) { };

	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by highlighting the cell under the mousepointer if it
	 * is over the hotspot region of the cell.
	 */
	mxHighlight.prototype.mouseMove = function(evt, cell)
	{
		if (this.isEnabled())
		{
			this.process(evt, cell);
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by reseting the highlight.
	 */
	mxHighlight.prototype.mouseUp = function(evt, cell)
	{
		this.reset();
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the object and all its resources and DOM nodes. This doesn't
	 * normally need to be called. It is called automatically when the window
	 * unloads.
	 */
	mxHighlight.prototype.destroy = function()
	{
		if (!this.destroyed)
		{
			this.destroyed = true;

			this.graph.removeGraphListener(this);
			mxCellMarker.prototype.destroy.apply(this);
		}
	};

}
