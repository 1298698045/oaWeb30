/**
 * $Id: mxActor.js,v 1.13 2008/06/25 11:12:07 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxActor
 *
 * Extends <mxShape> to implement an actor shape. If a custom shape with one
 * filled area is needed, then this shape's <redrawPath> should be overridden.
 * 
 * Example:
 * 
 * (code)
 * function SampleShape() { }
 * 
 * SampleShape.prototype = new mxActor();
 * SampleShape.prototype.constructor = vsAseShape;
 * 
 * mxCellRenderer.prototype.defaultShapes['sample'] = SampleShape;
 * SampleShape.prototype.redrawPath = function(path, x, y, w, h)
 * {
 *   path.moveTo(0, 0);
 *   path.lineTo(w, h);
 *   // ...
 *   path.close();
 * }
 * (end)
 * 
 * This shape is registered under <mxConstants.SHAPE_ACTOR> in
 * <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxActor
	 *
	 * Constructs a new actor shape.
	 */
	function mxActor(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxActor.prototype = new mxShape();
	mxActor.prototype.constructor = mxActor;
		
	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxActor.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxActor.prototype.preferModeHtml = false;
	
	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node(s) to represent this shape.
	 */
	mxActor.prototype.createVml = function()
	{
		var node = document.createElement('v:shape');
		this.configureVmlShape(node);
		return node;
	};

	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxActor.prototype.redrawVml = function()
	{
		this.updateVmlShape(this.node);
		var w = Math.floor(this.bounds.width);
		var h = Math.floor(this.bounds.height);
		var s = this.strokewidth*this.scale;
		
		this.node.setAttribute('coordsize', w+','+h);
		this.node.setAttribute('strokeweight', s);
		
		var d = this.createPath();
		this.node.setAttribute('path', d);
	};
	
	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxActor.prototype.createSvg = function()
	{
		return this.createSvgGroup('path');
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxActor.prototype.redrawSvg = function()
	{
		var strokeWidth = Math.max(1, this.strokewidth*this.scale);
		this.innerNode.setAttribute('stroke-width', strokeWidth);

		var d = this.createPath();
		this.innerNode.setAttribute('d', d);
		this.updateSvgTransform(this.innerNode, false);

		if (this.shadowNode != null)
		{
			this.shadowNode.setAttribute('stroke-width', strokeWidth);
			this.shadowNode.setAttribute('d', d);
			this.updateSvgTransform(this.shadowNode, true);
		}
	};

	/**
	 * Function: redrawPath
	 *
	 * Draws the path for this shape. This method uses the <mxPath>
	 * abstraction to paint the shape for VML and SVG.
	 */
	mxActor.prototype.redrawPath = function(path, x, y, w, h)
	{
		var width = w/3;
		path.moveTo(0, h);
		path.curveTo(0, 3 * h / 5, 0, 2 * h / 5, w / 2, 2 * h / 5);
		path.curveTo(w / 2 - width, 2 * h / 5, w / 2 - width, 0, w / 2, 0);
		path.curveTo(w / 2 + width, 0, w / 2 + width, 2 * h / 5, w / 2, 2 * h / 5);
		path.curveTo(w, 2 * h / 5, w, 3 * h / 5, w, h);
		path.close();
	};

}
