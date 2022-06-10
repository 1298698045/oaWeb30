/**
 * $Id: mxPolyline.js,v 1.11 2008/08/27 07:28:43 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxPolyline
 *
 * Extends <mxShape> to implement a polyline (a line with
 * multiple points).
 * This shape is registered under <mxConstants.SHAPE_POLYLINE>
 * in <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxPolyline
	 *
	 * Constructs a new polyline shape.
	 */
	function mxPolyline(points, stroke, strokewidth)
	{
		this.points = points;
		this.stroke = stroke || 'black';
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxPolyline.prototype = new mxShape();
	mxPolyline.prototype.constructor = mxPolyline;
	
	/**
	 * Function: create
	 *
	 * Override to create HTML regardless of gradient and
	 * rounded property.
	 */
	mxPolyline.prototype.create = function()
	{
		var node = null;
		if (this.dialect == mxConstants.DIALECT_SVG)
		{
			node = this.createSvg();
		}
		else if (this.dialect == mxConstants.DIALECT_STRICTHTML ||
				(this.dialect == mxConstants.DIALECT_PREFERHTML &&
				this.points != null &&
				this.points.length > 0))
		{
			node = document.createElement('DIV');
			this.configureHtmlShape(node);
			node.style.borderStyle = 'none';
			node.style.background = '';
		}
		else
		{
			node = document.createElement('v:polyline');
			this.configureVmlShape(node);
			var strokeNode = document.createElement('v:stroke');
		
			if (this.opacity != null)
			{
				strokeNode.setAttribute('opacity', this.opacity+'%');
			}
			
			node.appendChild(strokeNode);
		}
		return node;
	};

	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxPolyline.prototype.createSvg = function()
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
	mxPolyline.prototype.redrawSvg = function()
	{
		this.updateSvgShape(this.innerNode);
		this.pipe.setAttribute('d', this.innerNode.getAttribute('d'));
		
		var strokeWidth = this.strokewidth*this.scale;
				
		if (mxConstants.SVG_CRISP_EDGES &&
			strokeWidth == Math.floor(strokeWidth) &&
			!this.isRounded)
		{
			this.innerNode.setAttribute('shape-rendering', 'optimizeSpeed');
		}
		else
		{
			this.innerNode.setAttribute('shape-rendering', 'default');
		}
		
		this.pipe.setAttribute('stroke-width', strokeWidth+
			mxShape.prototype.SVG_STROKE_TOLERANCE);
	};

}
