/**
 * $Id: mxSwimlane.js,v 1.18 2008/07/14 09:57:05 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxSwimlane
 *
 * Extends <mxShape> to implement a swimlane shape.
 * This shape is registered under <mxConstants.SHAPE_SWIMLANE>
 * in <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxSwimlane
	 *
	 * Constructs a new swimlane shape.
	 */
	function mxSwimlane(bounds, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxSwimlane.prototype = new mxShape();
	mxSwimlane.prototype.constructor = mxSwimlane;
	
	/**
	 * Variable: imageSize
	 *
	 * Default imagewidth and imageheight if an image but no imagewidth
	 * and imageheight are defined in the style. Value is 16.
	 */
	mxSwimlane.prototype.imageSize = 16;
	
	/**
	 * Variable: defaultStartSize
	 *
	 * Default start size if no startSize has been defined in the style.
	 * Value is 40.
	 */
	mxSwimlane.prototype.defaultStartSize = 40;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode. This is for better
	 * handling of event-transparency of the content area.
	 */
	mxSwimlane.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode. This is for better
	 * handling of event-transparency of the content area.
	 */
	mxRhombus.prototype.preferModeHtml = false;

	/**
	 * Function: createHtml
	 *
	 * Creates and returns the HTML node to represent this shape.
	 */
	mxSwimlane.prototype.createHtml = function()
	{
		var node = document.createElement('DIV');
		this.configureHtmlShape(node);
		node.style.background = '';
		node.style.backgroundColor = '';
		node.style.borderStyle = 'none';

		// Adds a node that will contain the text label
		this.label = document.createElement('DIV');
		this.configureHtmlShape(this.label);
		node.appendChild(this.label);

		// Adds a node for the content area of the swimlane
		this.content = document.createElement('DIV');
		var tmp = this.fill;
		this.configureHtmlShape(this.content);
		this.content.style.background = '';
		this.content.style.backgroundColor = '';
		
		// Sets border styles depending on orientation
		if (mxUtils.getValue(this.style, mxConstants.STYLE_HORIZONTAL, true))
		{
			this.content.style.borderTopStyle = 'none';			
		}
		else
		{
			this.content.style.borderLeftStyle = 'none';
		}
		
		this.content.style.cursor = 'default';
		node.appendChild(this.content);
		
		// Adds a node for the separator
		var color = this.style[mxConstants.STYLE_SEPARATORCOLOR];
		
		if (color != null)
		{
			this.separator = document.createElement('DIV');
			this.separator.style.borderColor = color;
			this.separator.style.borderLeftStyle = 'dashed';
			node.appendChild(this.separator);
		}
		
		// Adds a node for the image
		if (this.image != null)
		{
			this.imageNode = mxUtils.createImage(this.image);
			this.configureHtmlShape(this.imageNode);
			this.imageNode.style.borderStyle = 'none';
			node.appendChild(this.imageNode);
		}
		
		return node;
	};

	/**
	 * Function: redrawHtml
	 *
	 * Updates the HTML node(s) to reflect the latest bounds and scale.
	 */
	mxSwimlane.prototype.redrawHtml = function()
	{
		this.updateHtmlShape(this.node);
		this.startSize = parseInt(this.style[mxConstants.STYLE_STARTSIZE]) ||
			this.defaultStartSize;
		this.updateHtmlShape(this.label);
		this.label.style.top = '0px';
		this.label.style.left = '0px';
		
		if (mxUtils.getValue(this.style, mxConstants.STYLE_HORIZONTAL, true))
		{
			this.startSize = Math.min(this.startSize, this.bounds.height);
			this.label.style.height = (this.startSize * this.scale)+'px'; // relative
			this.updateHtmlShape(this.content);
			
			var h = this.startSize*this.scale;
			
			this.content.style.top = h+'px';
			this.content.style.left = '0px';
			this.content.style.height = Math.max(1, this.bounds.height - h)+'px';
			
			if (this.separator != null)
			{
				this.separator.style.left = Math.floor(this.bounds.width)+'px';
				this.separator.style.top = Math.floor(this.startSize*this.scale)+'px';
				this.separator.style.width = '1px';
				this.separator.style.height = Math.floor(this.bounds.height)+'px';
				this.separator.style.borderWidth = Math.floor(this.scale)+'px';
			}
			
			if (this.imageNode != null)
			{
				this.imageNode.style.left = (this.bounds.width-this.imageSize-4)+'px';
				this.imageNode.style.top = '0px';
				// TODO: Use imageWidth and height from style if available
				this.imageNode.style.width = Math.floor(this.imageSize*this.scale)+'px';
				this.imageNode.style.height = Math.floor(this.imageSize*this.scale)+'px';		
			}
		}
		else
		{
			this.startSize = Math.min(this.startSize, this.bounds.width);
			this.label.style.width = (this.startSize * this.scale)+'px'; // relative
			this.updateHtmlShape(this.content);
			
			var w = this.startSize*this.scale;
			
			this.content.style.top = '0px';
			this.content.style.left = w+'px';
			this.content.style.width = Math.max(0, this.bounds.width - w)+'px';
			
			if (this.separator != null)
			{
				this.separator.style.left = Math.floor(this.startSize*this.scale)+'px';
				this.separator.style.top = Math.floor(this.bounds.height)+'px';
				this.separator.style.width = Math.floor(this.bounds.width)+'px';
				this.separator.style.height = '1px';
			}
			
			if (this.imageNode != null)
			{
				this.imageNode.style.left = (this.bounds.width-this.imageSize-4)+'px';
				this.imageNode.style.top = '0px';
				this.imageNode.style.width = this.imageSize*this.scale+'px';
				this.imageNode.style.height = this.imageSize*this.scale+'px';		
			}
		}
	};

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node(s) to represent this shape.
	 */
	mxSwimlane.prototype.createVml = function()
	{
		var node = document.createElement('v:group');
		var name = (this.isRounded) ? 'v:roundrect' : 'v:rect';
		
		this.label = document.createElement(name);
		
		// First configure the label with all settings
		this.configureVmlShape(this.label);
		
		if (this.isRounded)
		{
			this.label.setAttribute('arcsize', '20%');
		}

		// Disables stuff and configures the rest
		this.isShadow = false;
		this.configureVmlShape(node);
		node.setAttribute('coordorigin', '0,0');
		
		node.appendChild(this.label);
		
		this.content = document.createElement(name);
		
		var tmp = this.fill;
		this.fill = null;
		
		this.configureVmlShape(this.content);
		
		if (this.isRounded)
		{
			this.content.setAttribute('arcsize', '4%');
		}
		
		this.fill = tmp;
		this.content.style.borderBottom = '0px';
		
		node.appendChild(this.content);
		
		var color = this.style[mxConstants.STYLE_SEPARATORCOLOR];
		
		if (color != null)
		{
			this.separator = document.createElement('v:polyline');
			this.separator.setAttribute('strokecolor', color);

			var strokeNode = document.createElement('v:stroke');
			strokeNode.setAttribute('dashstyle', '2 2');
			this.separator.appendChild(strokeNode);
			
			node.appendChild(this.separator);
		}
		
		if (this.image != null)
		{
			this.imageNode = document.createElement('v:image');
			this.imageNode.setAttribute('src', this.image);
			this.configureVmlShape(this.imageNode);
			
			node.appendChild(this.imageNode);
		}
		
		return node;
	};

	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxSwimlane.prototype.redrawVml = function()
	{
		var x = Math.floor(this.bounds.x);
		var y = Math.floor(this.bounds.y);
		var w = Math.floor(this.bounds.width);
		var h = Math.floor(this.bounds.height);
	
		this.updateVmlShape(this.node);
		this.node.setAttribute('coordsize', w+','+h);

		this.updateVmlShape(this.label);
		this.label.style.top = '0px';
		this.label.style.left = '0px';
		this.label.style.rotation = null;

		this.startSize = parseInt(this.style[mxConstants.STYLE_STARTSIZE]) ||
			this.defaultStartSize;
		var start = Math.floor(this.startSize * this.scale);
				
		if (mxUtils.getValue(this.style, mxConstants.STYLE_HORIZONTAL, true))
		{
			start = Math.min(start, this.bounds.height);
			this.label.style.height = start+'px'; // relative
			this.updateVmlShape(this.content);
			
			this.content.style.top = start+'px';
			this.content.style.left = '0px';
			this.content.style.height = Math.max(0, h - start)+'px';
			
			if (this.separator != null)
			{
				this.separator.points.value = w+','+start+' '+w+','+h;
			}
			
			if (this.imageNode != null)
			{
				var img = Math.floor(this.imageSize*this.scale);
				
				this.imageNode.style.left = (w-img-4)+'px';
				this.imageNode.style.top = '0px';
				this.imageNode.style.width = img+'px';
				this.imageNode.style.height = img+'px';
			}
		}
		else
		{
			start = Math.min(start, this.bounds.width);
			this.label.style.width = start+'px'; // relative
			this.updateVmlShape(this.content);
			
			this.content.style.top = '0px';
			this.content.style.left = start+'px';
			this.content.style.width = Math.max(0, w - start)+'px';
			
			if (this.separator != null)
			{
				this.separator.points.value = '0,'+h+' '+(w+start)+','+h;
			}
			
			if (this.imageNode != null)
			{
				var img = Math.floor(this.imageSize*this.scale);
				
				this.imageNode.style.left = (w-img-4)+'px';
				this.imageNode.style.top = '0px';
				this.imageNode.style.width = img+'px';
				this.imageNode.style.height = img+'px';		
			}
		}

		this.content.style.rotation = null;
	};
	
	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxSwimlane.prototype.createSvg = function()
	{
		var node = this.createSvgGroup('rect');

		if (this.strokewidth * this.scale >= 1 && !this.isRounded)
		{
			this.innerNode.setAttribute('shape-rendering', 'optimizeSpeed');
		}

		if (this.isRounded)
		{
			this.innerNode.setAttribute('rx', 10);
			this.innerNode.setAttribute('ry', 10);
		}

		this.content = document.createElementNS(mxConstants.NS_SVG, 'path');
		this.configureSvgShape(this.content);
		this.content.setAttribute('fill', 'none');

		if (this.strokewidth * this.scale >= 1 && !this.isRounded)
		{
			this.content.setAttribute('shape-rendering', 'optimizeSpeed');
		}

		if (this.isRounded)
		{
			this.content.setAttribute('rx', 10);
			this.content.setAttribute('ry', 10);
		}
		
		node.appendChild(this.content);
		var color = this.style[mxConstants.STYLE_SEPARATORCOLOR];
		
		if (color != null)
		{
			this.separator = document.createElementNS(mxConstants.NS_SVG, 'line');
			
			this.separator.setAttribute('stroke', color);
			this.separator.setAttribute('fill', 'none');
			this.separator.setAttribute('stroke-dasharray', '2, 2');
			this.separator.setAttribute('shape-rendering', 'optimizeSpeed');
			
			node.appendChild(this.separator);
		}
		
		if (this.image != null)
		{
			this.imageNode = document.createElementNS(mxConstants.NS_SVG, 'image');
			
			this.imageNode.setAttributeNS(mxConstants.NS_XLINK, 'href', this.image);
			this.configureSvgShape(this.imageNode);
			
			node.appendChild(this.imageNode);
		}
		
		return node;
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxSwimlane.prototype.redrawSvg = function() {
		var tmp = this.isRounded;
		this.isRounded = false;
		
		this.updateSvgShape(this.innerNode);
		this.updateSvgShape(this.content);
		
		if (this.shadowNode != null)
		{
			this.updateSvgShape(this.shadowNode);
			
			if (this.style[mxConstants.STYLE_HORIZONTAL])
			{
				this.shadowNode.setAttribute('width', this.startSize*this.scale);
			}
			else
			{
				this.shadowNode.setAttribute('height', this.startSize*this.scale);				
			}
		}
		
		this.isRounded = tmp;
		this.startSize = parseInt(this.style[mxConstants.STYLE_STARTSIZE]) ||
			this.defaultStartSize;
		
		if (mxUtils.getValue(this.style, mxConstants.STYLE_HORIZONTAL, true))
		{
			this.startSize = Math.min(this.startSize, this.bounds.height);
			this.innerNode.setAttribute('height', this.startSize*this.scale);
			var h = this.startSize*this.scale;
			var points = 'M ' + this.bounds.x + 
				' ' + (this.bounds.y + h) +
				' l 0 '+(this.bounds.height-h)+
				' l '+this.bounds.width+' 0'+
				' l 0 '+(-this.bounds.height+h);
				
			this.content.setAttribute('d', points);
			this.content.removeAttribute('x');
			this.content.removeAttribute('y');
			this.content.removeAttribute('width');
			this.content.removeAttribute('height');
		
			if (this.separator != null)
			{
				this.separator.setAttribute('x1', this.bounds.x+this.bounds.width);
				this.separator.setAttribute('y1', this.bounds.y+this.startSize*this.scale);
				this.separator.setAttribute('x2', this.bounds.x+this.bounds.width);
				this.separator.setAttribute('y2', this.bounds.y+this.bounds.height);
			}
			
			if (this.imageNode != null)
			{
				this.imageNode.setAttribute('x', this.bounds.x+this.bounds.width-this.imageSize-4);
				this.imageNode.setAttribute('y', this.bounds.y);
				this.imageNode.setAttribute('width', this.imageSize*this.scale+'px');
				this.imageNode.setAttribute('height', this.imageSize*this.scale+'px');
			}
		}
		else
		{
			this.startSize = Math.min(this.startSize, this.bounds.width);
			this.innerNode.setAttribute('width', this.startSize*this.scale);
			var w = this.startSize*this.scale;
			var points = 'M ' + (this.bounds.x + w) + 
				' ' + this.bounds.y +
				' l ' + (this.bounds.width - w) + ' 0' +
				' l 0 ' + this.bounds.height +
				' l ' + (-this.bounds.width + w) + ' 0';
				
			this.content.setAttribute('d', points);
			this.content.removeAttribute('x');
			this.content.removeAttribute('y');
			this.content.removeAttribute('width');
			this.content.removeAttribute('height');
			
			if (this.separator != null)
			{
				this.separator.setAttribute('x1', this.bounds.x+this.startSize*this.scale);
				this.separator.setAttribute('y1', this.bounds.y+this.bounds.height);
				this.separator.setAttribute('x2', this.bounds.x+this.bounds.width);
				this.separator.setAttribute('y2', this.bounds.y+this.bounds.height);
			}
			
			if (this.imageNode != null)
			{
				this.imageNode.setAttribute('x', this.bounds.x+this.bounds.width-this.imageSize-4);
				this.imageNode.setAttribute('y', this.bounds.y);
				this.imageNode.setAttribute('width', this.imageSize*this.scale+'px');
				this.imageNode.setAttribute('height', this.imageSize*this.scale+'px');
			}
		}
	};

}
