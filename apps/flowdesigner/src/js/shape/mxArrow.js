/**
 * $Id: mxArrow.js,v 1.12 2008/06/25 12:11:06 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxArrow
 *
 * Extends <mxShape> to implement an arrow shape. (The shape
 * is used to represent edges, not vertices.)
 * This shape is registered under <mxConstants.SHAPE_ARROW>
 * in <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxArrow
	 *
	 * Constructs a new arrow shape.
	 */
	function mxArrow(points, fill, stroke, strokewidth, arrowWidth, spacing, endSize)
	{
		this.points = points;
		this.fill = fill;
		this.stroke = stroke; // || 'blue';
		this.strokewidth = strokewidth || 1;
		this.arrowWidth = arrowWidth || mxConstants.ARROW_WIDTH;
		this.spacing = spacing || mxConstants.ARROW_SPACING;
		this.endSize = endSize || mxConstants.ARROW_SIZE;
	};

	/**
	 * Extends mxEventSource.
	 */
	mxArrow.prototype = new mxShape();
	mxArrow.prototype.constructor = mxArrow;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxArrow.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxArrow.prototype.preferModeHtml = false;

	/**
	 * Variable: DEG_PER_RAD
	 * 
	 * Defines the number of degrees per radiant.
	 * Default is 57.2957795.
	 */
	mxArrow.prototype.DEG_PER_RAD = 57.2957795;

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node to represent this shape.
	 */
	mxArrow.prototype.createVml = function()
	{
		var node = document.createElement('v:polyline');
		this.configureVmlShape(node);
		
		return node;
	};

	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxArrow.prototype.redrawVml = function()
	{
		this.node.setAttribute('strokeweight', this.strokewidth*this.scale);
		
		if (this.points != null)
		{
			// Geometry of arrow
			var spacing = this.spacing * this.scale;
			var width = this.arrowWidth * this.scale;
			var arrow = this.endSize * this.scale;

			// Base vector (between end points)
			var p0 = this.points[0];
			var pe = this.points[this.points.length - 1];
			var dx = pe.x - p0.x;
			var dy = pe.y - p0.y;
			var dist = Math.sqrt(dx*dx+dy*dy);
			var length = dist-2*spacing-arrow;
			
			// Computes the norm and the inverse norm
			var nx = dx/dist;
			var ny = dy/dist;
			var basex = length*nx;
			var basey = length*ny;
			var floorx = width*ny/3;
			var floory = -width*nx/3;
			
			// Computes points
			var p0x = p0.x - floorx / 2 + spacing * nx;
			var p0y = p0.y - floory / 2 + spacing * ny;
			var p1x = p0x + floorx;
			var p1y = p0y + floory;
			var p2x = p1x + basex;
			var p2y = p1y + basey;
			var p3x = p2x + floorx;
			var p3y = p2y + floory;
			// p4 not necessary
			var p5x = p3x - 3*floorx;
			var p5y = p3y - 3*floory;
			
			this.node.points.value = p0x+','+p0y+','+
						 p1x+','+p1y+','+p2x+','+p2y+','+
						 p3x+','+p3y+','+
						 (pe.x - spacing * nx)+','+
						 (pe.y - spacing * ny)+','+
						 p5x+','+p5y+','+
						 (p5x + floorx)+','+
						 (p5y + floory)+','+
						 p0x+','+p0y;
		}
	};

	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxArrow.prototype.createSvg = function()
	{
		var node = document.createElementNS(mxConstants.NS_SVG, 'polygon');
		this.configureSvgShape(node);
		
		return node;
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxArrow.prototype.redrawSvg = function()
	{
		if (this.points != null)
		{
			var strokeWidth = Math.max(1, this.strokewidth * this.scale);
			this.node.setAttribute('stroke-width', strokeWidth);
			
			var p0 = this.points[0];
			var pe = this.points[this.points.length - 1];
			var tdx = pe.x - p0.x;
			var tdy = pe.y - p0.y;
			var dist = Math.sqrt(tdx * tdx + tdy * tdy);
			var offset = this.spacing * this.scale;
			
			var h = Math.min(25, Math.max(20, dist/5)) * this.scale;
			var w = dist-2 * offset;
			var x = p0.x + offset;
			var y = p0.y - h/2;
			var dx = h;
			var dy = h * 0.3;
			var right = x + w;
			var bottom = y + h;
			
			var points = x+','+(y+dy)+' '+(right-dx)+','+(y+dy)+
			        ' '+(right-dx)+','+y+' '+right+','+(y+h/2)+
			        ' '+(right-dx)+','+bottom+' '+(right-dx)+','+(bottom-dy)+
			        ' '+x+','+(bottom-dy);
			this.node.setAttribute('points', points);
			
			var dx = pe.x - p0.x;
			var dy = pe.y - p0.y;
			var theta = Math.atan(dy/dx) * this.DEG_PER_RAD;
			
			if (dx < 0)
			{
				theta -= 180;
			}
			
			this.node.setAttribute('transform',
				'rotate('+theta+','+p0.x+','+p0.y+')');
		}
	};

}
