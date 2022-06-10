/**
 * $Id: mxDoubleEllipse.js,v 1.2 2007/10/21 13:28:10 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxDoubleEllipse
 *
 * Extends <mxShape> to implement a double ellipse shape.
 * This shape is registered under <mxConstants.SHAPE_DOUBLE_ELLIPSE>
 * in <mxCellRenderer>.

 */
{

	/**
	 * Constructor: mxDoubleEllipse
	 *
	 * Constructs a new ellipse shape.
	 */
	function mxDoubleEllipse(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxDoubleEllipse.prototype = new mxShape();
	mxDoubleEllipse.prototype.constructor = mxDoubleEllipse;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxDoubleEllipse.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxDoubleEllipse.prototype.preferModeHtml = false;

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node to represent this shape.
	 */
	mxDoubleEllipse.prototype.createVml = function()
	{
		var node = document.createElement('v:group');

		// Draws the background
		this.background = document.createElement('v:arc');
		this.background.setAttribute('startangle', '0');
		this.background.setAttribute('endangle', '360');
		this.configureVmlShape(this.background);

		node.appendChild(this.background);
		
		// Ignores values that only apply to the background
		this.label = this.background;
		this.isShadow = false;
		this.fill = null;

		// Draws the foreground
		this.foreground = document.createElement('v:oval');
		this.configureVmlShape(this.foreground);
		
		node.appendChild(this.foreground);
		
		this.stroke = null;
		this.configureVmlShape(node);
		
		return node;
	};

	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxDoubleEllipse.prototype.redrawVml = function()
	{
		var x = Math.floor(this.bounds.x);
		var y = Math.floor(this.bounds.y);
		var w = Math.floor(this.bounds.width);
		var h = Math.floor(this.bounds.height);
		var s = this.strokewidth * this.scale;

		this.updateVmlShape(this.node);
		this.node.setAttribute('coordsize', w+','+h);

		this.updateVmlShape(this.background);
		this.background.setAttribute('strokeweight', s);
		this.background.style.top = '0px'; // relative
		this.background.style.left = '0px'; // relative

		this.updateVmlShape(this.foreground);
		this.foreground.setAttribute('strokeweight', s);
		
		var inset = 3+s;
		
		this.foreground.style.top = inset+'px'; // relative
		this.foreground.style.left = inset+'px'; // relative
		this.foreground.style.width = Math.max(0, w-2*inset)+'px';
		this.foreground.style.height = Math.max(0, h-2*inset)+'px';
	};
	
	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxDoubleEllipse.prototype.createSvg = function()
	{
		var g = this.createSvgGroup('ellipse');
		this.foreground = document.createElementNS(mxConstants.NS_SVG, 'ellipse');
		
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
	mxDoubleEllipse.prototype.redrawSvg = function()
	{
		var s = this.strokewidth * this.scale;
		
		this.updateSvgNode(this.innerNode);
		this.updateSvgNode(this.shadowNode);
		this.updateSvgNode(this.foreground, 3 * this.scale + s);
	};

	/**
	 * Function: updateSvgNode
	 *
	 * Updates the given node to reflect the new <bounds> and <scale>.
	 */
	mxDoubleEllipse.prototype.updateSvgNode = function(node, inset)
	{
		inset = (inset != null) ? inset : 0;
		
		if (node != null)
		{
			var strokeWidth = Math.max(1, this.strokewidth*this.scale);
			node.setAttribute('stroke-width', strokeWidth);
			
			node.setAttribute('cx', this.bounds.x+this.bounds.width/2);
			node.setAttribute('cy', this.bounds.y+this.bounds.height/2);
			node.setAttribute('rx', this.bounds.width/2-inset);
			node.setAttribute('ry', this.bounds.height/2-inset);
		}
	};

}
