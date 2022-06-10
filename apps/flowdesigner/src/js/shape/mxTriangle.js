/**
 * $Id: mxTriangle.js,v 1.3 2007/10/30 15:15:34 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxTriangle
 * 
 * Implementation of the triangle shape.
 */
{

	/**
	 * Constructor: mxTriangle
	 *
	 * Constructs a new triangle shape.
	 */
	function mxTriangle() { };
	
	/**
	 * Extends <mxActor>.
	 */
	mxTriangle.prototype = new mxActor();
	mxTriangle.prototype.constructor = mxTriangle;

	/**
	 * Function: redrawPath
	 *
	 * Draws the path for this shape. This method uses the <mxPath>
	 * abstraction to paint the shape for VML and SVG.
	 */
	mxTriangle.prototype.redrawPath = function(path, x, y, w, h)
	{
		var dir = this.style[mxConstants.STYLE_DIRECTION];
		
		if (dir == mxConstants.DIRECTION_NORTH)
		{
			path.moveTo(0, h);
			path.lineTo(0.5 * w, 0);
			path.lineTo(w, h);
		}
		else if (dir == mxConstants.DIRECTION_SOUTH)
		{
			path.moveTo(0, 0);
			path.lineTo(0.5 * w, h);
			path.lineTo(w, 0);
		}
		else if (dir == mxConstants.DIRECTION_WEST)
		{
			path.moveTo(w, 0);
			path.lineTo(0, 0.5 * h);
			path.lineTo(w, h);
		}
		else // east is default
		{
			path.moveTo(0, 0);
			path.lineTo(w, 0.5 * h);
			path.lineTo(0, h);
		}
		
		path.close();
	};

}
