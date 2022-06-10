/**
 * $Id: mxCylinder.js,v 1.12 2008/06/25 11:12:07 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCylinder
 *
 * Extends <mxShape> to implement an cylinder shape. If a
 * custom shape with one filled area and an overlay path is
 * needed, then this shape's <redrawPath> should be overridden.
 * This shape is registered under <mxConstants.SHAPE_CYLINDER>
 * in <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxCylinder
	 *
	 * Constructs a new cylinder shape.
	 */
	function mxCylinder(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxCylinder.prototype = new mxShape();
	mxCylinder.prototype.constructor = mxCylinder;
		
	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxCylinder.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxCylinder.prototype.preferModeHtml = false;
		
	/**
	 * Variable: maxHeight
	 *
	 * Defines the maximum height of the top and bottom part
	 * of the cylinder shape.
	 */
	mxCylinder.prototype.maxHeight = 40;
	
	/**
	 * Function: create
	 *
	 * Overrides the method to make sure the <stroke> is never
	 * null. If it is null is will be assigned the <fill> color.
	 */
	mxCylinder.prototype.create = function(container)
	{
		if (this.stroke == null)
		{
			this.stroke = this.fill;
		}
		
		// Calls superclass implementation of create
		return mxShape.prototype.create.apply(this, arguments);
	};

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node to represent this shape.
	 */
	mxCylinder.prototype.createVml = function()
	{
		var node = document.createElement('v:group');

		// Draws the background
		this.background = document.createElement('v:shape');
		this.label = this.background;
		this.configureVmlShape(this.background);
		node.appendChild(this.background);
		
		// Ignores values that only apply to the background
		this.fill = null;
		this.isShadow = false;
		this.configureVmlShape(node);
		
		// Draws the foreground
		this.foreground = document.createElement('v:shape');
		this.configureVmlShape(this.foreground);
		node.appendChild(this.foreground);
		
		return node;
	};

	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxCylinder.prototype.redrawVml = function()
	{
		var x = Math.floor(this.bounds.x);
		var y = Math.floor(this.bounds.y);
		var w = Math.floor(this.bounds.width);
		var h = Math.floor(this.bounds.height);
		var s = this.strokewidth * this.scale;

		this.node.setAttribute('coordsize', w+','+h);
		this.background.setAttribute('coordsize', w+','+h);
		this.foreground.setAttribute('coordsize', w+','+h);

		this.updateVmlShape(this.node);
		
		this.updateVmlShape(this.background);
		this.background.style.top = '0px'; // relative
		this.background.style.left = '0px'; // relative
		this.background.style.rotation = null;

		this.updateVmlShape(this.foreground);
		this.foreground.style.top = '0px'; // relative
		this.foreground.style.left = '0px'; // relative
		this.foreground.style.rotation = null;

		this.background.setAttribute('strokeweight', s);
		this.foreground.setAttribute('strokeweight', s);
		
		var d = this.createPath(false);
		this.background.setAttribute('path', d);
		
		var d = this.createPath(true);
		this.foreground.setAttribute('path', d);
	};

	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxCylinder.prototype.createSvg = function()
	{
		var g = this.createSvgGroup('path');
		this.foreground = document.createElementNS(mxConstants.NS_SVG, 'path');
		
		if (this.stroke != null)
		{
			this.foreground.setAttribute('stroke', this.stroke);
		}
		else
		{
			this.foreground.setAttribute('stroke', 'none');
		}
		
		this.foreground.setAttribute('fill', 'none');
		g.appendChild(this.foreground);
		
		return g;
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxCylinder.prototype.redrawSvg = function()
	{
		var strokeWidth = Math.max(1, this.strokewidth*this.scale);
		this.innerNode.setAttribute('stroke-width', strokeWidth);

		// Paints background
		var d = this.createPath(false);
		this.innerNode.setAttribute('d', d);
		this.updateSvgTransform(this.innerNode, false);
		
		// Paints shadow
		if (this.shadowNode != null)
		{
			this.shadowNode.setAttribute('stroke-width', strokeWidth);
			this.shadowNode.setAttribute('d', d);
			this.updateSvgTransform(this.shadowNode, true);
		}

		// Paints foreground
		d = this.createPath(true);
		this.foreground.setAttribute('stroke-width', strokeWidth);
		this.foreground.setAttribute('d', d);
		this.updateSvgTransform(this.foreground, false);
	};

	/**
	 * Function: redrawPath
	 *
	 * Draws the path for this shape. This method uses the <mxPath>
	 * abstraction to paint the shape for VML and SVG.
	 */
	mxCylinder.prototype.redrawPath = function(path, x, y, w, h, isForeground)
	{
		var dy = Math.min(this.maxHeight, Math.floor(h/5));
		
		if (isForeground)
		{
			path.moveTo(0, dy);
			path.curveTo(0, 2*dy, w, 2*dy, w, dy);
		}
		else
		{
			path.moveTo(0, dy);
			path.curveTo(0, -dy/3, w, -dy/3, w, dy);
			path.lineTo(w, h-dy);
			path.curveTo(w, h+dy/3, 0, h+dy/3, 0, (h-dy));
			path.close();
		}
	};

}
