/**
 * $Id: mxConnector.js,v 1.32 2008/10/24 08:10:52 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxConnector
 * 
 * Extends <mxShape> to implement a connector shape. The connector
 * shape allows for arrow heads on either side.
 * 
 * This shape is registered under <mxConstants.SHAPE_CONNECTOR> in
 * <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxConnector
	 * 
	 * Constructs a new connector shape.
	 */
	function mxConnector(points, stroke, strokewidth)
	{
		this.points = points;
		this.stroke = stroke || 'black';
		this.strokewidth = strokewidth || 1;
	};

	/**
	 * Extends mxShape.
	 */
	mxConnector.prototype = new mxShape();
	mxConnector.prototype.constructor = mxConnector;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw in VML in mixed Html mode.
	 */
	mxConnector.prototype.mixedModeHtml = false;

	/**
	 * Variable: preferModeHtml
	 *
	 * Overrides the parent value with false, meaning it will
	 * draw as VML in prefer Html mode.
	 */
	mxConnector.prototype.preferModeHtml = false;

	/**
	 * Function: createHtml
	 *
	 * Creates and returns the HTML node to represent this shape.
	 */
	mxConnector.prototype.createHtml = function()
	{
		var node = document.createElement('DIV');
		this.configureHtmlShape(node);
		node.style.borderStyle = 'none';
		node.style.background = '';
		
		return node;
	};

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node to represent this shape.
	 */
	mxConnector.prototype.createVml = function()
	{
		var node = document.createElement('v:shape');
		this.strokeNode = document.createElement('v:stroke');

		this.configureVmlShape(node);
		this.strokeNode.setAttribute('endarrow', this.endArrow);
		this.strokeNode.setAttribute('startarrow', this.startArrow);
		
		if (this.opacity != null)
		{
			this.strokeNode.setAttribute('opacity', this.opacity+'%');
		}
		
		node.appendChild(this.strokeNode);

		return node;
	};

	/**
	 * Function: redrawVml
	 *
	 * Redraws this VML shape by invoking <updateVmlShape> on this.node.
	 */
	mxConnector.prototype.redrawVml = function()
	{
		if (this.node != null &&
			this.strokeNode != null)
		{
			var startSize = mxUtils.getValue(this.style, mxConstants.STYLE_STARTSIZE,
					mxConstants.DEFAULT_MARKERSIZE) * this.scale;
			var endSize = mxUtils.getValue(this.style, mxConstants.STYLE_ENDSIZE,
					mxConstants.DEFAULT_MARKERSIZE) * this.scale;
			
			var startWidth = 'medium';
			var startLength = 'medium';
			var endWidth = 'medium';
			var endLength = 'medium';
			
			if (startSize < 6)
			{
				startWidth = 'narrow';
				startLength = 'short';
			}
			else if (startSize > 10)
			{
				startWidth = 'wide';
				startLength = 'long';
			}
			
			if (endSize < 6)
			{
				endWidth = 'narrow';
				endLength = 'short';
			}
			else if (endSize > 10)
			{
				endWidth = 'wide';
				endLength = 'long';
			}
			
			// Updates the size of the arrowheads using keywords in VML
			this.strokeNode.setAttribute('startarrowwidth', startWidth);
			this.strokeNode.setAttribute('startarrowlength', startLength);
			this.strokeNode.setAttribute('endarrowwidth', endWidth);
			this.strokeNode.setAttribute('endarrowlength', endLength);
			this.updateVmlShape(this.node);
		}		
	};
	
	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node to represent this shape.
	 */
	mxConnector.prototype.createSvg = function()
	{
		var g = this.createSvgGroup('path');
		var color = this.innerNode.getAttribute('stroke');
		
		// Creates the start arrow as an additional child path		
		if (this.startArrow != null)
		{
			this.start = document.createElementNS(mxConstants.NS_SVG, 'path');
			g.appendChild(this.start);
		}

		// Creates the end arrows as an additional child path
		if (this.endArrow != null)
		{
			this.end = document.createElementNS(mxConstants.NS_SVG, 'path');
			g.appendChild(this.end);
		}
		
		// Creates an invisible shape around the path for easier
		// selection with the mouse. Note: Firefox does not ignore
		// the value of the stroke attribute for pointer-events: stroke,
		// it does, however, ignore the visibility attribute.
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
	mxConnector.prototype.redrawSvg = function()
	{
		mxShape.prototype.redrawSvg.apply(this, arguments);
		var strokeWidth = this.strokewidth * this.scale;	
		var color = this.innerNode.getAttribute('stroke');
		
		if (mxConstants.SVG_CRISP_EDGES &&
			strokeWidth == Math.floor(strokeWidth) &&
			!this.isRounded)
		{
			this.node.setAttribute('shape-rendering', 'optimizeSpeed');
		}
		else
		{
			this.node.setAttribute('shape-rendering', 'default');
		}

		// Computes the markers first which modifies the coordinates
		// of the endpoints to not overlap with the painted marker
		// then updates the actual shape for the edge to take the
		// modified endpoints into account.
		if (this.points != null &&
			this.points[0] != null)
		{
			// Draws the start marker
			if (this.start != null)
			{
				var p0 = this.points[1];
				var pe = this.points[0];
				
				var size = mxUtils.getValue(this.style, mxConstants.STYLE_STARTSIZE,
						mxConstants.DEFAULT_MARKERSIZE);
				this.startOffset = this.redrawSvgMarker(this.start,
					this.startArrow, p0, pe, color, size);
			}
			
			// Draws the end marker
			if (this.end != null)
			{
				var n = this.points.length;
				
				var p0 = this.points[n - 2];
				var pe = this.points[n - 1];

				var size = mxUtils.getValue(this.style, mxConstants.STYLE_ENDSIZE,
						mxConstants.DEFAULT_MARKERSIZE);
				this.endOffset = this.redrawSvgMarker(this.end,
					this.endArrow, p0, pe, color, size);
			}
		}

		this.updateSvgShape(this.innerNode);
		this.pipe.setAttribute('d', this.innerNode.getAttribute('d'));
		this.pipe.setAttribute('stroke-width', strokeWidth+
			mxShape.prototype.SVG_STROKE_TOLERANCE);
		
		// Connector should never be filled
		this.innerNode.setAttribute('fill', 'none');
	};

	/**
	 * Function: redrawSvgMarker
	 *
	 * Creates and returns the string used to draw the marker in SVG.
	 */
	mxConnector.prototype.redrawSvgMarker = function(node, type, p0, pe, color, size)
	{
		var offset = null;

		// Computes the norm and the inverse norm
		var dx = pe.x - p0.x;
		var dy = pe.y - p0.y;

		var dist = Math.max(1, Math.sqrt(dx*dx+dy*dy));
		var absSize = size * this.scale;
		var nx = dx * absSize / dist;
		var ny = dy * absSize / dist;
		
		pe = pe.clone();
		pe.x -= nx * this.strokewidth / (2 * size);
		pe.y -= ny * this.strokewidth / (2 * size);

		nx *= 0.5 + this.strokewidth / 2;
		ny *= 0.5 + this.strokewidth / 2;

		if (type == 'classic' ||
			type == 'block')
		{
			var d = 'M ' + pe.x + ' ' + pe.y +
				' L ' + (pe.x - nx - ny / 2) + ' ' + (pe.y - ny + nx / 2) +
				((type != 'classic') ? '' :
				' L ' + (pe.x - nx * 3 / 4) + ' ' + (pe.y - ny * 3 / 4)) +
				' L ' + (pe.x + ny / 2 - nx) + ' ' + (pe.y - ny - nx / 2) +
				' z';

			node.setAttribute('d', d);
			offset = new mxPoint(-nx * 3 / 4, -ny * 3 / 4);
		}
		else if (type == 'open')
		{
			nx *= 1.2;
			ny *= 1.2;

			var d = 'M ' + (pe.x - nx - ny / 2) + ' ' + (pe.y - ny + nx / 2) +
				' L ' + (pe.x - nx / 6) + ' ' + (pe.y - ny / 6) +
				' L ' + (pe.x + ny / 2 - nx) + ' ' + (pe.y - ny - nx / 2) +
				' M ' + pe.x + ' ' + pe.y;

			node.setAttribute('d', d);
			node.setAttribute('fill', 'none');
			node.setAttribute('stroke-width', this.scale * this.strokewidth);
			
			offset = new mxPoint(-nx / 4, -ny / 4);
		}
		else if (type == 'oval')
		{
			nx *= 1.2;
			ny *= 1.2;
			absSize *= 1.2;

			var d = 'M ' + (pe.x - ny / 2) + ' ' + (pe.y + nx / 2) +
				' a ' + (absSize/2) + ' ' + (absSize/2) +
				' 0  1,1 ' + (nx / 8) +
				' ' + (ny / 8) + ' z';
		
			node.setAttribute('d', d);
		}
		else if (type == 'diamond')
		{
			var d = 'M ' + (pe.x + nx / 2) + ' ' + (pe.y + ny / 2) +
				' L ' + (pe.x - ny / 2) + ' ' + (pe.y + nx / 2) +
				' L ' + (pe.x - nx / 2) + ' ' + (pe.y - ny / 2) +
				' L ' + (pe.x + ny / 2) + ' ' + (pe.y - nx / 2) +
				' z';

			node.setAttribute('d', d);
		}
		
		// Updates the color
		node.setAttribute('stroke', color);
		
		if (type != 'open')
		{
			node.setAttribute('fill', color);
		}
		else
		{
			node.setAttribute('stroke-linecap', 'round');
		}
		
		if (this.opacity != null)
		{
			node.setAttribute('fill-opacity', this.opacity/100);
			node.setAttribute('stroke-opacity', this.opacity/100);
		}
		
		return offset;
	};

}
