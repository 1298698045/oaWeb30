/**
 * $Id: mxOverlay.js,v 1.9 2008/03/03 17:46:19 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxOverlay
 *
 * Extends <mxEventSource> to implement a graph overlay, represented by an icon
 * and a tooltip. Overlays can handle and fire <click> events and are added to
 * the graph using <mxGraph.addOverlay>, and removed using
 * <mxGraph.removeOverlay>, or <mxGraph.removeOverlays> to remove all overlays.
 * The <mxGraph.getOverlays> function returns the array of overlays for a given
 * cell in a graph. If multiple overlays exist for the same cell, then
 * <getBounds> should be overridden in at least one of the overlays.
 * 
 * Overlays appear on top of all cells in a special layer. If this is not
 * desirable, then the image must be rendered as part of the shape or label of
 * the cell instead.
 *
 * Example:
 * 
 * The following adds a new overlays for a given vertex and selectes the cell
 * if the overlay is clicked.
 *
 * (code)
 * var overlay = new mxOverlay(img, html);
 * graph.addOverlay(vertex, overlay);
 * overlay.addListener('click', function(sender, evt, cell)
 * {
 *   graph.setSelectionCell(cell);
 * });
 * (end)
 *
 * Event: click
 *
 * Fires when the user clicks on the overlay. First argument is the source
 * <mxOverlay>, second argument is the mouse event and third argument is the
 * <mxCell> that is associated with the overlay.
 */
{

	/**
	 * Constructor: mxOverlay
	 *
	 * Constructs a new overlay using the given image and toltip.
	 * 
	 * Parameters:
	 * 
	 * image - <mxImage> that represents the icno to be displayed.
	 * tooltip - Optional string that specifies the tooltip.
	 * align - Optional horizontal alignment for the overlay. Possible
	 * values are <ALIGN_LEFT>, <ALIGN_CENTER> and <ALIGN_RIGHT>
	 * (default).
	 * verticalAlign - Vertical alignment for the overlay. Possible
	 * values are <ALIGN_TOP>, <ALIGN_MIDDLE> and <ALIGN_BOTTOM>
	 * (default).
	 */
	function mxOverlay(image, tooltip, align, verticalAlign)
	{
		this.image = image;
		this.tooltip = tooltip;
		this.align = align;
		this.verticalAlign = verticalAlign;
	};
	
	/**
	 * Extends mxEventSource.
	 */
	mxOverlay.prototype = new mxEventSource();
	mxOverlay.prototype.constructor = mxOverlay;

	/**
	 * Variable: image
	 *
	 * Holds the <mxImage> to be used as the icon.
	 */
	mxOverlay.prototype.image = null;

	/**
	 * Variable: tooltip
	 * 
	 * Holds the optional string to be used as the tooltip.
	 */
	mxOverlay.prototype.tooltip = null;

	/**
	 * Variable: align
	 * 
	 * Holds the horizontal alignment for the overlay.
	 * Default is ALIGN_RIGHT. For edges, the overlay
	 * always appears in the center of the edge.
	 */
	mxOverlay.prototype.align = null;

	/**
	 * Variable: verticalAlign
	 * 
	 * Holds the vertical alignment for the overlay.
	 * Default is bottom. For edges, the overlay
	 * always appears in the center of the edge.
	 */
	mxOverlay.prototype.verticalAlign = null;

	/**
	 * Variable: defaultOverlap
	 * 
	 * Defines the overlapping for the overlay, that is,
	 * the proportional distance from the origin to the
	 * point defined by the alignment. Default is 0.5.
	 */
	mxOverlay.prototype.defaultOverlap = 0.5;

	/**
	 * Function: getBounds
	 * 
	 * Returns the bounds of the overlay for the given <mxCellState> as an
	 * <mxRectangle>. This should be overridden when using multiple overlays
	 * per cell so that the overlays do not overlap.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> that represents the current state of the
	 * associated cell.
	 */
	mxOverlay.prototype.getBounds = function(state)
	{
		var isEdge = state.view.graph.getModel().isEdge(state.cell);
		var s = state.view.scale;
		var pt = null;

		var w = this.image.width;
		var h = this.image.height;
		
		if (isEdge)
		{
			var pts = state.absolutePoints;
			
			if (pts.length % 2 == 1)
			{
				pt = pts[pts.length / 2 + 1];
			}
			else
			{
				var idx = pts.length / 2;
				var p0 = pts[idx-1];
				var p1 = pts[idx];
				pt = new mxPoint(p0.x + (p1.x - p0.x) / 2,
					p0.y + (p1.y - p0.y) / 2);
			}
		}
		else
		{
			pt = new mxPoint();
			
			if (this.align == mxConstants.ALIGN_LEFT)
			{
				pt.x = state.x;
			}
			else if (this.align == mxConstants.ALIGN_CENTER)
			{
				pt.x = state.x + state.width / 2;
			}
			else
			{
				pt.x = state.x + state.width;
			}
			
			if (this.verticalAlign == mxConstants.ALIGN_TOP)
			{
				pt.y = state.y;
			}
			else if (this.verticalAlign == mxConstants.ALIGN_MIDDLE)
			{
				pt.y = state.y + state.height / 2;
			}
			else
			{
				pt.y = state.y + state.height;
			}
		}

		return new mxRectangle(pt.x - w * this.defaultOverlap * s,
			pt.y - h * this.defaultOverlap * s, w * s, h * s);
	};

	/**
	 * Function: toString
	 * 
	 * Returns the textual representation of the overlay to be used as the
	 * tooltip. This implementation returns <tooltip>.
	 */
	mxOverlay.prototype.toString = function()
	{
		return this.tooltip;
	};

}
