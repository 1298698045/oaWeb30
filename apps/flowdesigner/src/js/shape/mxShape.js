/**
 * $Id: mxShape.js,v 1.57 2009/01/06 08:05:46 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxShape
 *
 * Base class for all shapes. A shape in mxGraph is a
 * separate implementation for SVG, VML and HTML. Which
 * implementation to use is controlled by the <dialect>
 * property which is assigned from within the <mxCellRenderer>
 * when the shape is created. The dialect must be assigned
 * for a shape, and it does normally depend on the browser and
 * the confiuration of the graph (see <mxGraph> rendering hint).
 *
 * For each supported shape in SVG and VML, a corresponding
 * shape exists in mxGraph, namely for text, image, rectangle,
 * rhombus, ellipse and polyline. The other shapes are a
 * combination of these shapes (eg. label and swimlane)
 * or they consist of one or more (filled) path objects
 * (eg. actor and cylinder). The HTML implementation is
 * optional but may be required for a HTML-only view of
 * the graph.
 *
 * Custom Shapes:
 *
 * To extend from this class, the basic code looks as follows.
 * In the special case where the custom shape consists only of
 * one filled region or one filled region and an additional stroke
 * the <mxActor> and <mxCylinder> should be subclassed,
 * respectively. These implement <redrawPath> in order to create
 * the path expression for VML and SVG via a unified API (see
 * <mxPath>). <mxCylinder.redrawPath> has an additional boolean
 * argument to draw the foreground and background separately.
 *
 * (code)
 * function CustomShape() { }
 * 
 * CustomShape.prototype = new mxShape();
 * CustomShape.prototype.constructor = CustomShape; 
 * (end)
 *
 * To register a custom shape in an existing graph instance,
 * one must register the shape under a new name in the graph's
 * cell renderer as follows:
 *
 * (code)
 * graph.cellRenderer.registerShape('customShape', CustomShape);
 * (end)
 *
 * The second argument is the name of the constructor.
 *
 * In order to use the shape you can refer to the given name above
 * in a stylesheet. For example, to change the shape for the default
 * vertex style, the following code is used:
 *
 * (code)
 * var style = graph.getStylesheet().getDefaultVertexStyle();
 * style[mxConstants.STYLE_SHAPE] = 'customShape';
 * (end) 
 */
{

	/**
	 * Constructor: mxShape
	 *
	 * Constructs a new shape.
	 */
	function mxShape() { };

	/**
	 * Variable: SVG_STROKE_TOLERANCE
	 *
	 * Event-tolerance for SVG strokes (in px). Default is 8.
	 */
	mxShape.prototype.SVG_STROKE_TOLERANCE = 8;

	/**
	 * Variable: scale
	 *
	 * Holds the scale in which the shape is being painted.
	 */
	mxShape.prototype.scale = 1;

	/**
	 * Variable: dialect
	 *
	 * Holds the dialect in which the shape is to be painted.
	 * This can be one of the DIALECT constants in <mxConstants>.
	 */
	mxShape.prototype.dialect = null;

	/**
	 * Variable: mixedModeHtml
	 *
	 * Specifies if <createHtml> should be used in mixed Html mode.
	 * Default is true.
	 */
	mxShape.prototype.mixedModeHtml = true;

	/**
	 * Variable: preferModeHtml
	 *
	 * Specifies if <createHtml> should be used in prefer Html mode.
	 * Default is true.
	 */
	mxShape.prototype.preferModeHtml = true;

	/**
	 * Variable: bounds
	 *
	 * Holds the <mxRectangle> that specifies the bounds of this shape.
	 */
	mxShape.prototype.bounds = null;

	/**
	 * Variable: points
	 *
	 * Holds the array of <mxPoints> that specify the points of this shape.
	 */
	mxShape.prototype.points = null;

	/**
	 * Variable: node
	 *
	 * Holds the outermost DOM node that represents this shape.
	 */
	mxShape.prototype.node = null;

	/**
	 * Variable: label
	 *
	 * Reference to the DOM node that should contain the label. This is null
	 * if the label should be placed inside <node> or <innerNode>.
	 */
	mxShape.prototype.label = null;

	/**
	 * Variable: innerNode
	 *
	 * Holds the DOM node that graphically represents this shape. This may be
	 * null if the outermost DOM <node> represents this shape.
	 */
	mxShape.prototype.innerNode = null;

	/**
	 * Variable: style
	 *
	 * Holds the style of the cell state that corresponds to this shape.
	 */
	mxShape.prototype.style = null;

	/**
	 * Variable: startOffset
	 *
	 * Specifies the offset in pixels from the first point in <points> and
	 * the actual start of the shape.
	 */
	mxShape.prototype.startOffset = null;

	/**
	 * Variable: endOffset
	 *
	 * Specifies the offset in pixels from the last point in <points> and
	 * the actual start of the shape.
	 */
	mxShape.prototype.endOffset = null;

	/**
	 * Function: init
	 *
	 * Initializes the shape by creaing the DOM node using <create>
	 * and adding it into the given container.
	 *
	 * Parameters:
	 *
	 * container - DOM node that will contain the shape.
	 */
	mxShape.prototype.init = function(container)
	{
		if (this.node == null)
		{
			this.node = this.create(container);
			
			if (container != null)
			{
				container.appendChild(this.node);
			}
		}
			
		this.redraw();
	};

	/**
	 * Function: isMixedModeHtml
	 * 
	 * Used to determine if a shape can be rendered using <createHtml> in mixed
	 * mode Html without compromising the display accuracy. The default 
	 * implementation will check if the shape is not rounded and has no 
	 * gradient, and will use a DIV if that is the case. It will also check if 
	 * <mxShape.mixedModeHtml> is true, which is the default settings.
	 * Subclassers can either override <mixedModeHtml> or this function if the 
	 * result depends on dynamic values. The graph's dialect is available via
	 * <dialect>.
	 */
	mxShape.prototype.isMixedModeHtml = function()
	{
		return this.mixedModeHtml &&
				!this.isRounded &&
				!this.isShadow &&
				this.gradient == null;
	};

	/**
	 * Function: create
	 *
	 * Creates and returns the DOM node(s) for the shape in
	 * the given container. This implementation invokes
	 * <createSvg>, <createHtml> or <createVml> depending
	 * on the <dialect> and style settings.
	 *
	 * Parameters:
	 *
	 * container - DOM node that will contain the shape.
	 */
	mxShape.prototype.create = function(container)
	{
		var node = null;
		
		if (this.dialect == mxConstants.DIALECT_SVG)
		{
			node = this.createSvg();
		}
		else if (this.dialect == mxConstants.DIALECT_STRICTHTML ||
				(this.preferModeHtml &&
				this.dialect == mxConstants.DIALECT_PREFERHTML) ||
				(this.isMixedModeHtml() && 
				this.dialect == mxConstants.DIALECT_MIXEDHTML))
		{
			node = this.createHtml();
		}
		else
		{
			node = this.createVml();
		}
		
		return node;
	};
		
	/**
	 * Function: createHtml
	 *
	 * Creates and returns the HTML DOM node(s) to represent
	 * this shape. This implementation falls back to <createVml>
	 * so that the HTML creation is optional.
	 */
	mxShape.prototype.createHtml = function()
	{
		var node = document.createElement('DIV');
		this.configureHtmlShape(node);
		
		return node;
	};
	
	/**
	 * Function: destroy
	 *
	 * Destroys the shape by removing it from the DOM
	 * and releasing the DOM node associated with the
	 * shape using <mxUtils.release>.
	 */
	mxShape.prototype.destroy = function()
	{
		if (this.node != null)
		{
			mxUtils.release(this.node);
			
			if (this.node.parentNode != null)
			{
				this.node.parentNode.removeChild(this.node);
			}
			
			this.node = null;
		}
	};

	/**
	 * Function: apply
	 *
	 * This keeps a reference to the style. If you need
	 * to keep a reference to the cell, you can override
	 * this method and store a local reference.
	 *
	 * Parameters:
	 *
	 * state - <mxCellState> of the corresponding cell.
	 */
	mxShape.prototype.apply = function(state)
	{
		var style = state.style;
		this.style = style;
		
		if (style != null)
		{
			this.fill = mxUtils.getValue(style, mxConstants.STYLE_FILLCOLOR, this.fill);
			this.gradient = mxUtils.getValue(style, mxConstants.STYLE_GRADIENTCOLOR, this.gradient);
			this.gradientDirection = mxUtils.getValue(style, mxConstants.STYLE_GRADIENT_DIRECTION, this.gradientDirection);
			this.opacity = mxUtils.getValue(style, mxConstants.STYLE_OPACITY, this.opacity);
			this.stroke = mxUtils.getValue(style, mxConstants.STYLE_STROKECOLOR, this.stroke);
			this.strokewidth = mxUtils.getValue(style, mxConstants.STYLE_STROKEWIDTH, this.strokewidth);
			this.isShadow = mxUtils.getValue(style, mxConstants.STYLE_SHADOW, this.isShadow);
			this.isDashed = mxUtils.getValue(style, mxConstants.STYLE_DASHED, this.isDashed);
			this.spacing = mxUtils.getValue(style, mxConstants.STYLE_SPACING, this.spacing);
			this.startSize = mxUtils.getValue(style, mxConstants.STYLE_STARTSIZE, this.startSize);
			this.endSize = mxUtils.getValue(style, mxConstants.STYLE_ENDSIZE, this.endSize);
			this.isRounded = mxUtils.getValue(style, mxConstants.STYLE_ROUNDED, this.isRounded);
			this.startArrow = mxUtils.getValue(style, mxConstants.STYLE_STARTARROW, this.startArrow);
			this.endArrow = mxUtils.getValue(style, mxConstants.STYLE_ENDARROW, this.endArrow);
			this.rotation = mxUtils.getValue(style, mxConstants.STYLE_ROTATION, this.rotation);
		}
	};

	/**
	 * Function: createSvgGroup
	 *
	 * Creates a SVG group element and adds the given shape as a child of the
	 * element. The child is stored in <innerNode> for later access.
	 */
	mxShape.prototype.createSvgGroup = function(shape)
	{
		var g = document.createElementNS(mxConstants.NS_SVG, 'g');
		
		// Creates the shape inside an svg group
		this.innerNode = document.createElementNS(mxConstants.NS_SVG, shape);
		this.configureSvgShape(this.innerNode);
		
		// Creates a shadow
		this.shadowNode = this.createSvgShadow(this.innerNode);
		
		if (this.shadowNode != null)
		{
			g.appendChild(this.shadowNode);				
		}
		
		// Appends the main shape after the shadow
		g.appendChild(this.innerNode);
		
		return g;
	};

	/**
	 * Function: createSvgShadow
	 *
	 * Creates a clone of the given node and configures the node's color
	 * to use <mxConstants.SVG_SHADOWCOLOR> with a <mxConstants.SVG_SHADOWTRANSFORM>.
	 */
	mxShape.prototype.createSvgShadow = function(node)
	{
		if (this.isShadow && this.fill != null)
		{
			var shadow = node.cloneNode(true);
			
			shadow.setAttribute('stroke', mxConstants.SVG_SHADOWCOLOR);
			shadow.setAttribute('fill', mxConstants.SVG_SHADOWCOLOR);
			shadow.setAttribute('transform', mxConstants.SVG_SHADOWTRANSFORM);
			
			return shadow;
		}
		
		return null;
	};

	/**
	 * Function: configureHtmlShape
	 *
	 * Configures the specified HTML node by applying the current color,
	 * bounds, shadow, opacity etc.
	 */
	mxShape.prototype.configureHtmlShape = function(node)
	{
		if (mxUtils.isVml(node))
		{
			this.configureVmlShape(node);
		}
		else
		{
			node.style.position = 'absolute';
			node.style.overflow = 'hidden';
			var color = this.stroke;
			
			if (color != null)
			{
				node.style.borderColor = color;
				
				if (this.isDashed)
				{
					node.style.borderStyle = 'dashed';
				}
				else if (this.strokewidth > 0)
				{
					node.style.borderStyle = 'solid';
				}
				
				node.style.borderWidth = this.strokewidth+'px';
			}
			
			color = this.fill;
			
			if (color != null)
			{
				node.style.backgroundColor = color;
			}
			else
			{
				node.style.background = 'url(\'' +
					mxClient.imageBasePath +
					'transparent.gif\')';
			}
			
			if (this.opacity != null)
			{
				mxUtils.setOpacity(node, this.opacity);
			}
		}
	};
	
	/**
	 * Function: configureVmlShape
	 *
	 * Configures the specified VML node by applying the current color,
	 * bounds, shadow, opacity etc.
	 */
	mxShape.prototype.configureVmlShape = function(node)
	{
		node.style.position = 'absolute';

		var color = this.stroke;

		if (color != null)
		{
			node.setAttribute('strokecolor', color);
		}
		else
		{
			node.setAttribute('stroked', 'false');
		}

		color = this.fill;

		if (color != null)
		{
			node.setAttribute('fillcolor', color);

			if (node.fillNode == null)
			{
				node.fillNode = document.createElement('v:fill');
				node.appendChild(node.fillNode);
			}
			
			node.fillNode.setAttribute('color', color);

			if (this.gradient != null)
			{
				node.fillNode.setAttribute('type', 'gradient');
				node.fillNode.setAttribute('color2', this.gradient);
				var angle = '180';
				
				if (this.gradientDirection == mxConstants.DIRECTION_EAST)
				{
					angle = '270';
				}
				else if (this.gradientDirection == mxConstants.DIRECTION_WEST)
				{
					angle = '90';
				}
				else if (this.gradientDirection == mxConstants.DIRECTION_NORTH)
				{
					angle = '0';
				}

				node.fillNode.setAttribute('angle', angle);
			}

			if (this.opacity != null)
			{
				node.fillNode.setAttribute('opacity', this.opacity+'%');
				
				if (this.gradient != null)
				{
					node.fillNode.setAttribute('o:opacity2', this.opacity+'%');
				}
			}
		}
		else
		{
			node.setAttribute('filled', 'false');
			
			if (node.fillNode != null)
			{
				mxUtils.release(node.fillNode);
				node.removeChild(node.fillNode);
				node.fillNode = null;
			}
		}

		if ((this.isDashed ||
			this.opacity != null) &&
			this.strokeNode == null)
		{
			this.strokeNode = document.createElement('v:stroke');
			node.appendChild(this.strokeNode);
		}
		
		if (this.strokeNode != null)
		{
			if (this.isDashed)
			{
				this.strokeNode.setAttribute('dashstyle', '2 2');
			}
			else
			{
				this.strokeNode.setAttribute('dashstyle', 'solid');
			}
			
			if (this.opacity != null)
			{
				this.strokeNode.setAttribute('opacity', this.opacity+'%');
			}
		}
		
		if (this.isShadow && this.fill != null)
		{
			// Adds a shadow only once per shape
			if (this.shadowNode == null)
			{
				this.shadowNode = document.createElement('v:shadow');
				this.shadowNode.setAttribute('on', 'true');
				node.appendChild(this.shadowNode);
			}
		}

		// Fixes possible hang in IE when arcsize is set on non-rects
		if (node.nodeName == 'v:rect' &&
			this.isRounded)
		{
			node.setAttribute('arcsize', '15%');
		}
	}

	/**
	 * Function: configureSvgShape
	 *
	 * Configures the specified SVG node by applying the current color,
	 * bounds, shadow, opacity etc.
	 */
	mxShape.prototype.configureSvgShape = function(node)
	{
		var color = this.stroke;
		
		if (color != null)
		{
			node.setAttribute('stroke', color);
		}
		else
		{
			node.setAttribute('stroke', 'none');
		}
		
		color = this.fill;
		
		if (color != null)
		{
			// Fetches a reference to a shared gradient
			if (this.gradient != null)
			{
				var id = this.getGradientId(color, this.gradient, this.opacity);
				
				if (this.gradientNode != null &&
					this.gradientNode.getAttribute('id') != id)
				{
					this.gradientNode = null;
					node.setAttribute('fill', '');
				}
				
				if (this.gradientNode == null)
				{
					this.gradientNode = this.createSvgGradient(
						id, color, this.gradient, this.opacity);
					node.setAttribute('fill', 'url(#'+id+')');
				}
			}
			else
			{
				// TODO: Remove gradient from document if no
				// longer referenced (shared)
				this.gradientNode = null;
				node.setAttribute('fill', color);
			}
		}
		else
		{
			node.setAttribute('fill', 'none');
		}
		
		if (this.isDashed)
		{
			node.setAttribute('stroke-dasharray', '3, 3');
		}
		
		if (this.opacity != null)
		{
			// Improves opacity performance in Firefox
			node.setAttribute('fill-opacity', this.opacity/100);
			node.setAttribute('stroke-opacity', this.opacity/100);
		}
	};

	/**
	 * Function: getGradientId
	 *
	 * Creates a unique ID for the gradient of this shape.
	 */
	mxShape.prototype.getGradientId = function(start, end, opacity)
	{
		var op = (opacity != null) ? opacity : 100;
		var dir = null;
		
		if (this.gradientDirection == null ||
			this.gradientDirection == mxConstants.DIRECTION_SOUTH)
		{
			dir = 'south';
		}
		else if (this.gradientDirection == mxConstants.DIRECTION_EAST)
		{
			dir = 'east';
		}
		else if (this.gradientDirection == mxConstants.DIRECTION_NORTH)
		{
			dir = 'north';
		}
		else if (this.gradientDirection == mxConstants.DIRECTION_WEST)
		{
			dir = 'west';
		}
		
		return 'mxGradient-'+start+'-'+end+'-'+op+'-'+dir;
	};
	
	/**
	 * Function: createSvgGradient
	 *
	 * Creates a gradient object for SVG using the specified startcolor,
	 * endcolor and opacity.
	 */
	mxShape.prototype.createSvgGradient = function(id, start, end, opacity)
	{
		var op = (opacity != null) ? opacity : 100;
		var gradient = document.getElementById(id);
		
		if (gradient == null)
		{
			var gradient = document.createElementNS(
				mxConstants.NS_SVG, 'linearGradient');
			gradient.setAttribute('id', id);
			gradient.setAttribute('x1', '0%');
			gradient.setAttribute('y1', '0%');
			gradient.setAttribute('x2', '0%');
			gradient.setAttribute('y2', '0%');
			
			if (this.gradientDirection == null ||
				this.gradientDirection == mxConstants.DIRECTION_SOUTH)
			{
				gradient.setAttribute('y2', '100%');
			}
			else if (this.gradientDirection == mxConstants.DIRECTION_EAST)
			{
				gradient.setAttribute('x2', '100%');
			}
			else if (this.gradientDirection == mxConstants.DIRECTION_NORTH)
			{
				gradient.setAttribute('y1', '100%');
			}
			else if (this.gradientDirection == mxConstants.DIRECTION_WEST)
			{
				gradient.setAttribute('x1', '100%');
			}
			
			var stop = document.createElementNS(mxConstants.NS_SVG, 'stop');
			stop.setAttribute('offset', '0%');
			stop.setAttribute('style', 'stop-color:'+start+
				';stop-opacity:'+(op/100));
			gradient.appendChild(stop);
			
			stop = document.createElementNS(mxConstants.NS_SVG, 'stop');
			stop.setAttribute('offset', '100%');
			stop.setAttribute('style', 'stop-color:'+end+
				';stop-opacity:'+(op/100));
			gradient.appendChild(stop);
			
			// TODO: Cannot always assume index 0, but in most cases
			// #1 is the overview, which should not draw gradients.
			// Solution: Use shape container's parent svg node.
			var svg = document.getElementsByTagName('svg')[0];
			svg.appendChild(gradient);
		}
		
		return gradient;
	};

	/**
	 * Function: createPoints
	 *
	 * Creates a path expression using the specified commands for this.points.
	 * If <isRounded> is true, then the path contains curves for the corners.
	 */
	mxShape.prototype.createPoints = function(moveCmd, lineCmd, curveCmd, isRelative)
	{
		var offsetX = (isRelative) ? this.bounds.x : 0;
		var offsetY = (isRelative) ? this.bounds.y : 0;

		var size = 20 * this.scale;
		var points = moveCmd+' '+Math.floor(this.points[0].x-offsetX)+' '+
						Math.floor(this.points[0].y-offsetY)+' ';
		
		for (var i = 1; i < this.points.length; i++)
		{
			var pt = this.points[i];
			var p0 = this.points[i-1];
			
			if (i == 1 &&
				this.startOffset != null)
			{
				p0 = p0.clone();
				p0.x += this.startOffset.x;
				p0.y += this.startOffset.y;
			}
			else if (i == this.points.length - 1 &&
				this.endOffset != null)
			{
				pt = pt.clone();
				pt.x += this.endOffset.x;
				pt.y += this.endOffset.y;
			}
			
			var dx = p0.x - pt.x;
			var dy = p0.y - pt.y;
			
			if ((this.isRounded &&
				i < this.points.length - 1) &&
				(dx != 0 ||
				dy != 0) &&
				this.scale > 0.3)
			{
				// Draws a line from the last point
				// to the current point with a spacing
				// of size off the current point into
				// direction of the last point
				var dist = Math.sqrt(dx * dx + dy * dy);
				var nx1 = dx * Math.min(size, dist / 2) / dist;
				var ny1 = dy * Math.min(size, dist / 2) / dist;
				points += lineCmd+' '+Math.floor(pt.x + nx1 - offsetX)+' '+
							Math.floor(pt.y + ny1 - offsetY)+' ';
	
				// Draws a curve from the last point
				// to the current point with a spacing
				// of size off the current point into
				// direction of the next point
				var pe = this.points[i+1];
				dx = pe.x - pt.x;
				dy = pe.y - pt.y;
				
				dist = Math.max(1, Math.sqrt(dx*dx+dy*dy));
				var nx2 = dx * Math.min(size, dist / 2) / dist;
				var ny2 = dy * Math.min(size, dist / 2) / dist;
				
				points += curveCmd+' '+Math.floor(pt.x-offsetX)+' '+
						Math.floor(pt.y-offsetY)+' '+Math.floor(pt.x-offsetX)+','+
						Math.floor(pt.y-offsetY)+' '+Math.floor(pt.x+nx2-offsetX)+' '+
							Math.floor(pt.y+ny2-offsetY)+' ';
			}
			else
			{
				points += lineCmd+' '+Math.floor(pt.x-offsetX)+' '+
							Math.floor(pt.y-offsetY)+' ';				
			}
		}
		
		return points;
	};

	/**
	 * Function: updateHtmlShape
	 *
	 * Updates the bounds or points of the specified HTML node and
	 * updates the inner childs to reflect the changes.
	 */
	mxShape.prototype.updateHtmlShape = function(node)
	{
		if (node != null)
		{
			if (mxUtils.isVml(node))
			{
				this.updateVmlShape(node);
			}
			else
			{
				node.style.borderWidth = Math.max(1,
					Math.floor(this.strokewidth*this.scale))+'px';
				
				if (this.bounds != null)
				{
					node.style.left = Math.floor(this.bounds.x)+'px';
					node.style.top = Math.floor(this.bounds.y)+'px';
					node.style.width = Math.floor(this.bounds.width)+'px';
					node.style.height = Math.floor(this.bounds.height)+'px';
				}
			}
			
			if (this.points != null &&
				this.bounds != null &&
				!mxUtils.isVml(node))
			{
				if (this.divContainer == null)
				{
					this.divContainer = document.createElement('div');
					node.appendChild(this.divContainer);
				}
				
				node.style.borderStyle = 'none';
				
				while (this.divContainer.firstChild != null)
				{
					mxUtils.release(this.divContainer.firstChild);
					this.divContainer.removeChild(this.divContainer.firstChild);
				}
				
				if (this.points.length == 2)
				{
					var p0 = this.points[0];
					var pe = this.points[1];
	
					var dx = pe.x - p0.x;
					var dy = pe.y - p0.y;
	
					if (dx == 0 || dy == 0)
					{
						node.style.borderStyle = 'solid';
					}
					else
					{
						node.style.width = Math.floor(this.bounds.width+1)+'px';
						node.style.height = Math.floor(this.bounds.height+1)+'px';
						
						var length = Math.sqrt(dx*dx+dy*dy);
						var dotCount = 1+(length/(20*this.scale));
						
						var nx = dx / dotCount;
						var ny = dy / dotCount;
						var x = p0.x - this.bounds.x;
						var y = p0.y - this.bounds.y;
						
						for (var i=0; i<dotCount; i++)
						{
							var tmp = document.createElement('DIV');
							
							tmp.style.position = 'absolute';
							tmp.style.overflow = 'hidden';
							
							tmp.style.left = Math.floor(x)+'px';
							tmp.style.top = Math.floor(y)+'px';
							tmp.style.width = Math.max(1, 2*this.scale)+'px';
							tmp.style.height = Math.max(1, 2*this.scale)+'px';
	
							tmp.style.backgroundColor = this.stroke;
							this.divContainer.appendChild(tmp);
							
							x += nx;
							y += ny;
						}
					}
				}
				else if (this.points.length == 3)
				{
					var mid = this.points[1];
					
					var n = '0';
					var s = '1';
					var w = '0';
					var e = '1';
					
					if (mid.x == this.bounds.x)
					{
						e = '0';
						w = '1';
					}
					
					if (mid.y == this.bounds.y)
					{
						n = '1';
						s = '0';
					}
					
					node.style.borderStyle = 'solid';
					node.style.borderWidth = n+' '+e+' '+s+' '+w+'px';
				}
				else
				{
					node.style.width = Math.floor(this.bounds.width+1)+'px';
					node.style.height = Math.floor(this.bounds.height+1)+'px';
					var last = this.points[0];
					
					for (var i = 1; i < this.points.length; i++)
					{
						var next = this.points[i];
						
						// TODO: Use one div for multiple lines
						var tmp = document.createElement('DIV');
	
						tmp.style.position = 'absolute';
						tmp.style.overflow = 'hidden';
	
						tmp.style.borderColor = this.stroke;
						tmp.style.borderStyle = 'solid';
						tmp.style.borderWidth = '1 0 0 1px';
						
						var x = Math.min(next.x, last.x)-this.bounds.x;
						var y = Math.min(next.y, last.y)-this.bounds.y;
						var w = Math.max(1, Math.abs(next.x-last.x));
						var h = Math.max(1, Math.abs(next.y-last.y));
						
						tmp.style.left = x+'px';
						tmp.style.top = y+'px';
						tmp.style.width = w+'px';
						tmp.style.height = h+'px';
						
						this.divContainer.appendChild(tmp);
						
						last = next;
					}
				}
			}
		}
	};

	/**
	 * Function: updateVmlShape
	 *
	 * Updates the bounds or points of the specified VML node and
	 * updates the inner childs to reflect the changes.
	 */
	mxShape.prototype.updateVmlShape = function(node)
	{
		node.setAttribute('strokeweight', this.strokewidth*this.scale);
		
		if (this.bounds != null)
		{
			node.style.left = Math.floor(this.bounds.x)+'px';
			node.style.top = Math.floor(this.bounds.y)+'px';
			node.style.width = Math.floor(this.bounds.width)+'px';
			node.style.height = Math.floor(this.bounds.height)+'px';

			if (this.points == null)
			{
				if (this.rotation != null && this.rotation != 0)
				{
					node.style.rotation = this.rotation;
				}
				else
				{
					node.style.rotation = null;
				}
			}
		}
		
		if (this.points != null)
		{
			if (node.nodeName == 'polyline' &&
				node.points != null)
			{
				var points = '';
				
				for (var i = 0; i < this.points.length; i++)
				{
					points += this.points[i].x + ',' + this.points[i].y + ' ';
				}
				
				node.points.value = points;
				
				node.style.left = null;
				node.style.top = null;
				node.style.width = null;
				node.style.height = null;
			}
			else if (this.bounds != null)
			{
				this.node.setAttribute('coordsize', Math.floor(this.bounds.width)+','+
											   Math.floor(this.bounds.height));
				var points = this.createPoints('m', 'l', 'c', true);

				// Smooth style for VML (experimental)
				//var pts = this.points;
				//var n = pts.length;
				
				//if (n > 3)
				{
					//var x0 = this.bounds.x;
					//var y0 = this.bounds.y;
					//points = 'm '+Math.floor(pts[0].x - x0)+' '+Math.floor(pts[0].y - y0)+' qb';
					
					//for (var i = 1; i < n - 1; i++)
					{
						//points += ' '+Math.floor(pts[i].x - x0) + ' ' +
							//Math.floor(pts[i].y - y0);
					}

					//points += ' nf l '+Math.floor(pts[n - 1].x - x0) + ' ' +
						//Math.floor(pts[n - 1].y - y0);
				}

				node.setAttribute('path', points + ' e');
			}
		}
	};

	/**
	 * Function: updateSvgShape
	 *
	 * Updates the bounds or points of the specified SVG node and
	 * updates the inner childs to reflect the changes.
	 */
	mxShape.prototype.updateSvgShape = function(node)
	{
		var strokeWidth = Math.max(1, this.strokewidth * this.scale);
		node.setAttribute('stroke-width', strokeWidth);

		if (this.points != null && this.points[0] != null)
		{
			node.setAttribute('d', this.createPoints('M', 'L', 'C', false));
		
			// Smooth style for SVG (experimental)
			//var pts = this.points;
			//var n = pts.length;
			
			//if (n > 3)
			{
				//var points = 'M '+pts[0].x+' '+pts[0].y+' ';
				//points += ' Q '+pts[1].x + ' ' + pts[1].y + ' ' +
					//' '+pts[2].x + ' ' + pts[2].y;
				
				//for (var i = 3; i < n; i++)
				{
					//points += ' T ' + pts[i].x + ' ' + pts[i].y;
				}

				//node.setAttribute('d', points);
			}

			node.removeAttribute('x');
			node.removeAttribute('y');
			node.removeAttribute('width');
			node.removeAttribute('height');
		}
		else if (this.bounds != null)
		{
			node.setAttribute('x', this.bounds.x);
			node.setAttribute('y', this.bounds.y);
			
			var w = this.bounds.width;
			var h = this.bounds.height;
			
			node.setAttribute('width', w);
			node.setAttribute('height', h);
			
			if (this.isRounded)
			{
				var r = Math.min(w/5, h/5);
				node.setAttribute('rx', r);
				node.setAttribute('ry', r);
			}

			this.updateSvgTransform(node, node == this.shadowNode);
		}
	};
	
	/**
	 * Function: updateSvgTransform
	 * 
	 * Updates the tranform of the given node.
	 */
	mxShape.prototype.updateSvgTransform = function(node, shadow)
	{
		if (this.rotation != null && this.rotation != 0)
		{
			var cx = this.bounds.x + this.bounds.width / 2;
			var cy = this.bounds.y + this.bounds.height / 2;
			
			if (shadow)
			{
				node.setAttribute('transform', 'rotate('+this.rotation+','+cx+','+cy+') '+mxConstants.SVG_SHADOWTRANSFORM);
			}
			else
			{
				node.setAttribute('transform', 'rotate('+this.rotation+','+cx+','+cy+')');
			}
		}
		else
		{
			if (shadow)
			{
				node.setAttribute('transform', mxConstants.SVG_SHADOWTRANSFORM);
			}
			else
			{
				node.removeAttribute('transform');
			}
		}
	};

	/**
	 * Function: reconfigure
	 *
	 * Reconfigures this shape. This will update the colors etc in
	 * addition to the bounds or points.
	 */
	mxShape.prototype.reconfigure = function()
	{
		if (this.dialect == mxConstants.DIALECT_SVG)
		{
			if (this.innerNode != null)
			{
				this.configureSvgShape(this.innerNode);
			}
			else
			{
				this.configureSvgShape(this.node);
			}
		}
		else if (mxUtils.isVml(this.node))
		{
			this.configureVmlShape(this.node);
		}
		else
		{
			this.configureHtmlShape(this.node);
		}
	};

	/**
	 * Function: redraw
	 *
	 * Invokes <redrawSvg>, <redrawVml> or <redrawHtml> depending on the
	 * dialect of the shape.
	 */
	mxShape.prototype.redraw = function()
	{
		if (this.dialect == mxConstants.DIALECT_SVG)
		{
			this.redrawSvg();
		}
		else if (mxUtils.isVml(this.node))
		{
			this.redrawVml();
		}
		else
		{
			this.redrawHtml();
		}
	};

	/**
	 * Function: redrawSvg
	 *
	 * Redraws this SVG shape by invoking <updateSvgShape> on this.node,
	 * this.innerNode and this.shadowNode.
	 */
	mxShape.prototype.redrawSvg = function()
	{
		if (this.innerNode != null)
		{
			this.updateSvgShape(this.innerNode);
			
			if (this.shadowNode != null)
			{
				this.updateSvgShape(this.shadowNode);
			}
		}
		else
		{
			this.updateSvgShape(this.node);
		}
	};

	/**
	 * Function: redrawVml
	 *
	 * Redraws this VML shape by invoking <updateVmlShape> on this.node.
	 */
	mxShape.prototype.redrawVml = function()
	{
		this.updateVmlShape(this.node);
	};

	/**
	 * Function: redrawHtml
	 *
	 * Redraws this HTML shape by invoking <updateHtmlShape> on this.node.
	 */
	mxShape.prototype.redrawHtml = function()
	{
		this.updateHtmlShape(this.node);
	};

	/**
	 * Function: createPath
	 *
	 * Creates a path for the specified format and origin.
	 * The path object is then passed to <redrawPath>.
	 */
	mxShape.prototype.createPath = function(arg)
	{
		var x = this.bounds.x;
		var y = this.bounds.y;
		var w = this.bounds.width;
		var h = this.bounds.height;
		
		var path = null;
		
		if (this.dialect == mxConstants.DIALECT_SVG)
		{
			path = new mxPath('svg');
			path.setTranslate(x, y);
		}
		else
		{
			path = new mxPath('vml');
		}
		
		this.redrawPath(path, x, y, w, h, arg);
		
		return path.getPath();
	};
	
	/**
	 * Function: redrawPath
	 *
	 * Draws the path for this shape. This implementation is empty. See
	 * <mxActor> and <mxCylinder> for implementations. 
	 */
	mxShape.prototype.redrawPath = function(path, x, y, w, h)
	{
		// do nothing
	};

}
