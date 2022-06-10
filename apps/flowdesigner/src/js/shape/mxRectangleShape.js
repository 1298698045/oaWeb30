/**
 * $Id: mxRectangleShape.js,v 1.5 2008/09/23 07:02:03 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxRectangleShape
 *
 * Extends <mxShape> to implement a rectangle shape.
 * This shape is registered under <mxConstants.SHAPE_RECTANGLE>
 * in <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxRectangleShape
	 *
	 * Constructs a new rectangle shape.
	 */
	function mxRectangleShape(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxRectangleShape.prototype = new mxShape();
	mxRectangleShape.prototype.constructor = mxRectangleShape;

	/**
	 * Function: createHtml
	 *
	 * Creates and returns the HTML node to represent this shape.
	 */
	mxRectangleShape.prototype.createHtml = function()
	{
		var node = document.createElement('DIV');
		this.configureHtmlShape(node);
		
		return node;
	};

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node to represent this shape.
	 */
	mxRectangleShape.prototype.createVml = function()
	{
		var name = (this.isRounded) ? 'v:roundrect' : 'v:rect';
		var node = document.createElement(name);
		this.configureVmlShape(node);
		
		return node;
	};

	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node to represent this shape.
	 */
	mxRectangleShape.prototype.createSvg = function()
	{
		var node = this.createSvgGroup('rect');
		
		// Avoids anti-aliasing for non-rounded rectangles with a strokewidth
		// of 1 or more pixels
		if (this.strokewidth * this.scale >= 1 && !this.isRounded)
		{
			this.innerNode.setAttribute('shape-rendering', 'optimizeSpeed');
		}
		
		return node;
	};

}
