/**
 * $Id: mxEllipse.js,v 1.8 2007/10/21 13:28:10 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxEllipse
 *
 * Extends <mxShape> to implement an ellipse shape.
 * This shape is registered under <mxConstants.SHAPE_ELLIPSE>
 * in <mxCellRenderer>.

 */
{

	/**
	 * Constructor: mxEllipse
	 *
	 * Constructs a new ellipse shape.
	 */
	function mxEllipse(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxEllipse.prototype = new mxShape();
	mxEllipse.prototype.constructor = mxEllipse;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxEllipse.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxEllipse.prototype.preferModeHtml = false;

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node to represent this shape.
	 */
	mxEllipse.prototype.createVml = function()
	{
		// Uses an arc not an oval to make sure the
		// textbox fills out the outer bounds of the
		// circle, not just the inner rectangle
		var node = document.createElement('v:arc');
		node.setAttribute('startangle', '0');
		node.setAttribute('endangle', '360');
		this.configureVmlShape(node);

		return node;
	};

	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxEllipse.prototype.createSvg = function()
	{
		return this.createSvgGroup('ellipse');
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxEllipse.prototype.redrawSvg = function()
	{
		this.updateSvgNode(this.innerNode);
		this.updateSvgNode(this.shadowNode);
	};

	/**
	 * Function: updateSvgNode
	 *
	 * Updates the given node to reflect the new <bounds> and <scale>.
	 */
	mxEllipse.prototype.updateSvgNode = function(node)
	{
		if (node != null)
		{
			var strokeWidth = Math.max(1, this.strokewidth*this.scale);
			node.setAttribute('stroke-width', strokeWidth);
			
			node.setAttribute('cx', this.bounds.x+this.bounds.width/2);
			node.setAttribute('cy', this.bounds.y+this.bounds.height/2);
			node.setAttribute('rx', this.bounds.width/2);
			node.setAttribute('ry', this.bounds.height/2);
		}
	};

}
