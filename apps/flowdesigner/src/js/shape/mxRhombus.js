/**
 * $Id: mxRhombus.js,v 1.9 2008/06/25 11:12:07 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxRhombus
 *
 * Extends <mxShape> to implement a rhombus (aka diamond) shape.
 * This shape is registered under <mxConstants.SHAPE_RHOMBUS>
 * in <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxRhombus
	 *
	 * Constructs a new rhombus shape.
	 */
	function mxRhombus(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxRhombus.prototype = new mxShape();
	mxRhombus.prototype.constructor = mxRhombus;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxRhombus.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxRhombus.prototype.preferModeHtml = false;

	/**
	 * Function: createHtml
	 *
	 * Creates and returns the HTML node to represent this shape.
	 */
	mxRhombus.prototype.createHtml = function()
	{
		var node = null;
		
		if (mxClient.IS_CANVAS)
		{
			node = document.createElement('CANVAS');
			this.configureHtmlShape(node);
			node.style.borderStyle = 'none';				
		}
		else
		{
			node = document.createElement('DIV');
			this.configureHtmlShape(node);
		}
		
		return node;
	};

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node(s) to represent this shape.
	 */
	mxRhombus.prototype.createVml = function()
	{
		var node = document.createElement('v:shape');
		this.configureVmlShape(node);
		
		return node;
	};

	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxRhombus.prototype.createSvg = function()
	{
		return this.createSvgGroup('path');
	}

	// TODO: When used as an indicator, this.node.points is null
	// so we use a path object for building general diamonds.
	/**
	 *
	 *
	mxRhombus.prototype.redraw = function() {
		this.node.setAttribute('strokeweight', this.strokewidth*this.scale);
		var x = this.bounds.x;
		var y = this.bounds.y;
		var w = this.bounds.width;
		var h = this.bounds.height;
		this.node.points.value = (x+w/2)+','+y+' '+(x+w)+','+(y+h/2)+
			' '+(x+w/2)+','+(y+h)+' '+x+','+(y+h/2)+' '+
			(x+w/2)+','+y;
	}*/

	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxRhombus.prototype.redrawVml = function()
	{
		this.node.setAttribute('strokeweight', this.strokewidth*this.scale);
		this.updateVmlShape(this.node);
		var x = 0;
		var y = 0;
		var w = Math.floor(this.bounds.width);
		var h = Math.floor(this.bounds.height);
		
		this.node.setAttribute('coordsize', w+','+h);
		var points = 'm '+Math.floor(x+w/2)+' '+y+' l '+
			(x+w)+' '+Math.floor(y+h/2)+' l '+Math.floor(x+w/2)+' '+
			(y+h)+' l '+x+' '+Math.floor(y+h/2);
		this.node.setAttribute('path', points+' x e');
	};

	/**
	 * Function: redrawHtml
	 *
	 * Updates the HTML node(s) to reflect the latest bounds and scale.
	 * Or repaints the canvas using <redrawCanvas> depending on what
	 * was created in <createHtml>.
	 */
	mxRhombus.prototype.redrawHtml = function()
	{
		if (this.node.nodeName == 'CANVAS')
		{
			this.redrawCanvas();
		}
		else
		{
			this.updateHtmlShape(this.node);
		}
	};
	
	/**
	 * Function: redrawCanvas
	 *
	 * Updates the Canvas to reflect the latest bounds and scale.
	 */
	mxRhombus.prototype.redrawCanvas = function()
	{
		this.updateHtmlShape(this.node);
		var x = 0;
		var y = 0;
		var w = this.bounds.width;
		var h = this.bounds.height;
		
		this.node.setAttribute('width', w);
		this.node.setAttribute('height', h);
		
		if (!this.isRepaintNeeded)
		{
			var ctx = this.node.getContext('2d');
			
			ctx.clearRect(0, 0, w, h);
			ctx.beginPath();
			ctx.moveTo(x+w/2, y);
			ctx.lineTo(x+w, y+h/2);
			ctx.lineTo(x+w/2, y+h);
			ctx.lineTo(x, y+h/2);
			ctx.lineTo(x+w/2, y);

			if (this.node.style.backgroundColor != 'transparent')
			{
				ctx.fillStyle = this.node.style.backgroundColor;
				ctx.fill();
			}

			if (this.node.style.borderColor != null)
			{
				ctx.strokeStyle = this.node.style.borderColor;
				ctx.stroke();
			}
			this.isRepaintNeeded = false;
		}
	};
		
	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxRhombus.prototype.redrawSvg = function()
	{
		this.updateSvgNode(this.innerNode);
		
		if (this.shadowNode != null)
		{
			this.updateSvgNode(this.shadowNode);
		}
	};
	
	/**
	 * Function: createSvgSpan
	 *
	 * Updates the path for the given SVG node.
	 */
	mxRhombus.prototype.updateSvgNode = function(node)
	{
		var strokeWidth = Math.max(1, this.strokewidth*this.scale);
		node.setAttribute('stroke-width', strokeWidth);
		var x = this.bounds.x;
		var y = this.bounds.y;
		var w = this.bounds.width;
		var h = this.bounds.height;
		var d = 'M '+(x+w/2)+' '+y+' L '+(x+w)+' '+(y+h/2)+
			' L '+(x+w/2)+' '+(y+h)+' L '+x+' '+(y+h/2)+
			' Z ';
		node.setAttribute('d', d);
		this.updateSvgTransform(node, node == this.shadowNode);
	};

}
