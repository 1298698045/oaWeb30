/**
 * $Id: mxLine.js,v 1.15 2008/08/27 07:28:43 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxLine
 *
 * Extends <mxShape> to implement a horizontal line shape.
 * This shape is registered under <mxConstants.SHAPE_LINE> in
 * <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxLine
	 *
	 * Constructs a new line shape.
	 */
	function mxLine(bounds, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.stroke = stroke || 'black';
		this.strokewidth = strokewidth || '1';
	};

	/**
	 * Extends mxShape.
	 */
	mxLine.prototype = new mxShape();
	mxLine.prototype.constructor = mxLine;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxLine.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxLine.prototype.preferModeHtml = false;

	/**
	 * Function: clone
	 *
	 * Overrides the clone method to add special fields.
	 */
	mxLine.prototype.clone = function()
	{
		var clone = new mxLine(this.bounds,
			this.stroke, this.strokewidth);
		clone.isDashed = this.isDashed;
		
		return clone;
	};

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node to represent this shape.
	 */
	mxLine.prototype.createVml = function()
	{
		var node = document.createElement('v:group');
		node.setAttribute('coordorigin', '0,0');
		node.style.position = 'absolute';
		node.style.overflow = 'visible';
		
		// Represents the text label container
		this.label = document.createElement('v:rect');
		this.configureVmlShape(this.label);
		this.label.setAttribute('stroked', 'false');
		this.label.setAttribute('filled', 'false');
		node.appendChild(this.label);
		
		// Represents the straight line shape
		this.innerNode = document.createElement('v:polyline');
		this.configureVmlShape(this.innerNode);
		node.appendChild(this.innerNode);
		
		return node;
	};

	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxLine.prototype.redrawVml = function()
	{
		var x = Math.floor(this.bounds.x);
		var y = Math.floor(this.bounds.y);
		var w = Math.floor(this.bounds.width);
		var h = Math.floor(this.bounds.height);
		
		this.updateVmlShape(this.node);
		this.node.setAttribute('coordsize', w+','+h);
				
		this.updateVmlShape(this.label);
		this.label.style.left = '0px';
		this.label.style.top = '0px';

		this.innerNode.setAttribute('strokeweight',
			this.strokewidth * this.scale);
		var direction = this.style[mxConstants.STYLE_DIRECTION];
		
		if (direction == mxConstants.DIRECTION_NORTH ||
			direction == mxConstants.DIRECTION_SOUTH)
		{
			this.innerNode.points.value = (w/2)+',0 '+(w/2)+','+(h);
		}
		else
		{
			this.innerNode.points.value = '0,'+(h/2)+' '+(w)+','+(h/2);
		}
	};
		
	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxLine.prototype.createSvg = function()
	{
		var g = this.createSvgGroup('path');

		// Creates an invisible shape around the path for easier
		// selection with the mouse. Note: Firefox does not ignore
		// the value of the stroke attribute for pointer-events: stroke.
		// It does, however, ignore the visibility attribute.
		var color = this.innerNode.getAttribute('stroke');
		this.pipe = document.createElementNS(mxConstants.NS_SVG, 'path');
		this.pipe.setAttribute('stroke', color);
		this.pipe.setAttribute('visibility', 'hidden');
		this.pipe.setAttribute('pointer-events', 'stroke');
		g.appendChild(this.pipe);
		
		return g;
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxLine.prototype.redrawSvg = function()
	{
		var strokeWidth = Math.max(1, this.strokewidth*this.scale);
		this.innerNode.setAttribute('stroke-width', strokeWidth);
		
		if (this.bounds != null)
		{
			var x = this.bounds.x;
			var y = this.bounds.y;
			var w = this.bounds.width;
			var h = this.bounds.height;
			
			var d = null;
			var direction = this.style[mxConstants.STYLE_DIRECTION];
			
			if (direction == mxConstants.DIRECTION_NORTH ||
				direction == mxConstants.DIRECTION_SOUTH)
			{
				d = 'M '+(x+w/2)+' '+y+' L '+(x+w/2)+' '+(y+h);
			}
			else
			{
				d = 'M '+x+' '+(y+h/2)+' L '+(x+w)+' '+(y+h/2);
			}
			
			this.innerNode.setAttribute('d', d);
			this.pipe.setAttribute('d', d);
			this.pipe.setAttribute('stroke-width', this.strokewidth*this.scale+
				mxShape.prototype.SVG_STROKE_TOLERANCE);
			
			this.updateSvgTransform(this.innerNode, false);
			this.updateSvgTransform(this.pipe, false);			
		}
	};

}
