/**
 * $Id: mxHexagon.js,v 1.1 2008/04/10 09:28:10 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxHexagon
 * 
 * Implementation of the hexagon shape.
 */
{

	/**
	 * Constructor: mxHexagon
	 *
	 * Constructs a new hexagon shape.
	 */
	function mxHexagon() { };
	
	/**
	 * Extends <mxActor>.
	 */
	mxHexagon.prototype = new mxActor();
	mxHexagon.prototype.constructor = mxHexagon;

	/**
	 * Function: redrawPath
	 *
	 * Draws the path for this shape. This method uses the <mxPath>
	 * abstraction to paint the shape for VML and SVG.
	 */
	mxHexagon.prototype.redrawPath = function(path, x, y, w, h)
	{
		var dir = this.style[mxConstants.STYLE_DIRECTION];
		
		if (dir == mxConstants.DIRECTION_NORTH ||
			dir == mxConstants.DIRECTION_SOUTH)
		{
			path.moveTo(0.5 * w, 0);
			path.lineTo(w, 0.25 * h);
			path.lineTo(w, 0.75 * h);
			path.lineTo(0.5 * w, h);
			path.lineTo(0, 0.75 * h);
			path.lineTo(0, 0.25 * h);
		}
		else
		{
			path.moveTo(0.25 * w, 0);
			path.lineTo(0.75 * w, 0);
			path.lineTo(w, 0.5 * h);
			path.lineTo(0.75 * w, h);
			path.lineTo(0.25 * w, h);
			path.lineTo(0, 0.5 * h);
		}
		
		path.close();
	};

}
