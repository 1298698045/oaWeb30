/**
 * $Id: mxCloud.js,v 1.5 2007/10/21 13:28:10 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCloud
 *
 * Extends <mxActor> to implement a cloud shape.
 * 
 * This shape is registered under <mxConstants.SHAPE_CLOUD> in
 * <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxCloud
	 *
	 * Constructs a new cloud shape.
	 */
	function mxCloud(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxActor.
	 */
	mxCloud.prototype = new mxActor();
	mxCloud.prototype.constructor = mxActor;
	
	/**
	 * Function: redrawPath
	 *
	 * Draws the path for this shape. This method uses the <mxPath>
	 * abstraction to paint the shape for VML and SVG.
	 */
	mxCloud.prototype.redrawPath = function(path, x, y, w, h)
	{
		path.moveTo(0.25 * w, 0.25 * h);
		path.curveTo(0.05 * w, 0.25 * h, 0, 0.5 * h, 0.16 * w, 0.55 * h);
		path.curveTo(0, 0.66 * h, 0.18 * w, 0.9 * h, 0.31 * w, 0.8 * h);
		path.curveTo(0.4 * w, h, 0.7 * w, h, 0.8 * w, 0.8 * h);
		path.curveTo(w, 0.8 * h, w, 0.6 * h, 0.875 * w, 0.5 * h);
		path.curveTo(w, 0.3 * h, 0.8 * w, 0.1 * h, 0.625 * w, 0.2 * h);
		path.curveTo(0.5 * w, 0.05 * h, 0.3 * w, 0.05 * h, 0.25 * w, 0.25 * h);
		path.close();
	};

}
