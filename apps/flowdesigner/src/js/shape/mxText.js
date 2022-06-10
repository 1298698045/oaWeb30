/**
 * $Id: mxText.js,v 1.76 2008/12/31 11:58:29 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxText
 *
 * Extends <mxShape> to implement a text shape.
 */
{

	/**
	 * Constructor: mxText
	 *
	 * Constructs a new text shape.
	 */
	function mxText(value, bounds, align, valign, color,
		family,	size, fontStyle, spacing, spacingTop, spacingRight,
		spacingBottom, spacingLeft, isRotate, background, border,
		useTableBounds, isAbsolute, isWrapping, isClipping)
	{
		this.value = value;
		this.bounds = bounds;
		this.color = color || 'black';
		this.align = align || 0;
		this.valign = valign || 0;
		this.family = family || mxConstants.DEFAULT_FONTFAMILY;
		this.size = size || mxConstants.DEFAULT_FONTSIZE;
		this.fontStyle = fontStyle || 0;
		this.spacing = parseInt(spacing || 2);
		this.spacingTop = this.spacing + parseInt(spacingTop || 0);
		this.spacingRight = this.spacing + parseInt(spacingRight || 0);
		this.spacingBottom = this.spacing + parseInt(spacingBottom || 0);
		this.spacingLeft = this.spacing + parseInt(spacingLeft || 0);
		this.isRotate = isRotate || false;
		this.background = background;
		this.border = border;
		this.useTableBounds = (useTableBounds != null) ? useTableBounds : true;
		this.isAbsolute = (isAbsolute != null) ? isAbsolute : false;
		this.isWrapping = (isWrapping != null) ? isWrapping : false;
		this.isClipping = (isClipping != null) ? isClipping : false;
	};

	/**
	 * Extends mxShape.
	 */
	mxText.prototype = new mxShape();
	mxText.prototype.constructor = mxText;

	/**
	 * Variable: ENABLE_FOREIGNOBJECT
	 *
	 * If the foreignObject tag should be used in Firefox 3 to render text.
	 * Default is false.
	 */
	mxText.prototype.ENABLE_FOREIGNOBJECT = false;

	/**
	 * Function: isStyleSet
	 *
	 * Returns true if the given font style (bold, italic etc)
	 * is true in this shape's fontStyle.
	 *
	 * Parameters:
	 *
	 * style - Fontstyle constant from <mxConstants>.
	 */
	mxText.prototype.isStyleSet = function(style)
	{
		return (this.fontStyle & style) == style;
	}

	/**
	 * Function: create
	 *
	 * Override to create HTML regardless of gradient and
	 * rounded property.
	 */
	mxText.prototype.create = function(container)
	{
		var node = null;
		
		if (this.dialect == mxConstants.DIALECT_SVG &&
			(!mxClient.IS_FF3 || !this.ENABLE_FOREIGNOBJECT))
		{
			node = this.createSvg();
		}
		else if (this.dialect == mxConstants.DIALECT_STRICTHTML ||
				this.dialect == mxConstants.DIALECT_PREFERHTML ||
				!mxUtils.isVml(container))
		{
			if (this.dialect == mxConstants.DIALECT_SVG)
			{
				node = this.createForeignObject();
			}
			else
			{
				container.style.overflow = 'visible';
				node = this.createHtml();				
			}
		}
		else
		{
			node = this.createVml();
		}
		
		return node;
	};

	/**
	 * Function: createForeignObject
	 *
	 * Creates and returns the foreignObject node to represent this shape.
	 */
	mxText.prototype.createForeignObject = function()
	{
		var node = document.createElementNS(mxConstants.NS_SVG, 'foreignObject');
		node.style.cursor = 'default';
		
		return node;
	};

	/**
	 * Function: createHtml
	 *
	 * Creates and returns the HTML node to represent this shape.
	 */
	mxText.prototype.createHtml = function()
	{
		var node = document.createElement('DIV');
		node.style.cursor = 'default';
			
		return node;
	};

	/**
	 * Function: createVml
	 *
	 * Creates and returns the VML node(s) to represent this shape.
	 */
	mxText.prototype.createVml = function()
	{
		var node = document.createElement('v:textbox');
		node.inset = '0px,0px,0px,0px';
		
		return node;
	};

	/**
	 * Function: redrawHtml
	 *
	 * Updates the HTML node(s) to reflect the latest bounds and scale.
	 */
	mxText.prototype.redrawHtml = function()
	{
		this.redrawVml();
	};
	
	/**
	 * Function: redrawVml
	 *
	 * Updates the VML node(s) to reflect the latest bounds and scale.
	 */
	mxText.prototype.redrawVml = function()
	{
		if (this.value != null)
		{
			var scale = (mxClient.IS_IE) ? 1 : this.scale;

			// Workaround for ignored vertical-alignment is to use table
			var table = document.createElement('table');
			table.style.borderCollapse = 'collapse';
			
			var tbody = document.createElement('tbody');
			var row = document.createElement('tr');
			var td = document.createElement('td');

			// Resets all possible insets for oversize labels
			this.node.style.overflow =
				(this.isClipping) ? 'hidden' : 'visible';
					
			if (!mxUtils.isVml(this.node))
			{
				this.node.style.marginLeft = '0px';
				this.node.style.marginTop = '0px';
			}
			else
			{
				this.node.inset = '0px,0px,0px,0px';
			}

			if (this.isAbsolute || (this.bounds.width == 0 && this.bounds.height == 0))
			{
				if (mxUtils.isVml(this.node))
				{
					var x0 = parseInt(this.node.parentNode.style.left);
					var y0 = parseInt(this.node.parentNode.style.top);
					this.node.inset = (this.bounds.x-x0)+'px,'+
						(this.bounds.y-y0)+'px,0px,0px';
				}
				else
				{
					this.node.style.position = 'absolute';
					this.node.style.left = this.bounds.x+'px';
					this.node.style.top = this.bounds.y+'px';
					
					// HTML inside node is relative to node top left corner
					if (mxUtils.isVml(this.node.parentNode) ||
						mxClient.IS_IE)
					{
						this.node.style.left = (this.bounds.x -
							parseInt(this.node.parentNode.style.left) || 0)+'px';
						this.node.style.top = (this.bounds.y -
							parseInt(this.node.parentNode.style.top) || 0)+'px';
					}
					
					if (this.bounds.width > 0 ||
						this.bounds.height > 0)
					{
						this.node.style.width = this.bounds.width+'px';
						this.node.style.height = this.bounds.height+'px';
						
						table.setAttribute('height', '100%');
						table.setAttribute('width', '100%');
					}
				}
			}
			else
			{
				if (!mxUtils.isVml(this.node))
				{
					this.node.style.width = this.bounds.width+'px';
					this.node.style.height = this.bounds.height+'px';
				}

				table.setAttribute('height', '100%');
				table.setAttribute('width', '100%');
			}

			td.style.textAlign =
				(this.align == mxConstants.ALIGN_RIGHT) ? 'right' :
				((this.align == mxConstants.ALIGN_CENTER) ? 'center' :
				'left');
			td.style.verticalAlign =
				(this.valign == mxConstants.ALIGN_BOTTOM) ? 'bottom' :
				((this.valign == mxConstants.ALIGN_MIDDLE) ? 'middle' :
				'top');

			var container = td;
			
			// Creates a table of the size of the actual label
			// to paint the background and border with a different
			// size than the enclosing vertex (not used for edges)
			if (!this.useTableBounds &&
				(this.background != null ||
				this.border != null))
			{
				var tbl = document.createElement('table');
				tbl.style.borderCollapse = 'collapse';

				var tb = document.createElement('tbody');
				var tr = document.createElement('tr');
				container = document.createElement('td');
				
				container.style.textAlign = td.style.textAlign;
				container.style.verticalAlign = td.style.verticalAlign;
				
				tr.appendChild(container);
				tb.appendChild(tr);
				tbl.appendChild(tb);
				td.appendChild(tbl);

				// Workaround for ignored outer cell align on Mac
				if (mxClient.IS_MAC)
				{
					tbl.setAttribute('align', td.style.textAlign);
				}
			}
			
			container.style.zoom = this.scale; // IE only
			container.style.color = this.color;
			container.style.fontSize = (this.size * scale) + 'px';
			container.style.fontFamily = this.family;

			if (this.isRotate)
			{
				// Inverts the alignment of the outer td to match the rotation
				if (container != td)
				{
					td.style.verticalAlign =
						(this.align == mxConstants.ALIGN_RIGHT) ? 'top' :
						((this.align == mxConstants.ALIGN_CENTER) ? 'middle' :
						'bottom');
					td.style.textAlign =
						(this.valign == mxConstants.ALIGN_BOTTOM) ? 'right' :
						((this.valign == mxConstants.ALIGN_MIDDLE) ? 'center' :
						'left');
				}
				
				container.style.writingMode = 'tb-rl'; // IE only
				container.style.filter = 'flipv fliph'; // IE only
				
				// IE zooms the spacing while other do not support zoom
				var f = (mxClient.IS_IE) ? 1 : this.scale;
				
				td.style.paddingTop = (this.spacingRight * f) + 'px';
				td.style.paddingRight = (this.spacingBottom * f) + 'px';
				td.style.paddingBottom = (this.spacingLeft * f) + 'px';
				td.style.paddingLeft = (this.spacingTop * f) + 'px';
			}
			else
			{
				var f = (mxClient.IS_IE) ? 1 : this.scale;
				
				td.style.paddingTop = (this.spacingTop * f) + 'px';
				td.style.paddingRight = (this.spacingRight * f) + 'px';
				td.style.paddingBottom = (this.spacingBottom * f) + 'px';
				td.style.paddingLeft = (this.spacingLeft * f) + 'px';
			}
						
			if (this.isStyleSet(mxConstants.FONT_BOLD))
			{
				container.style.fontWeight = 'bold';
			}
			else
			{
				container.style.fontWeight = 'normal';
			}
			
			if (this.isStyleSet(mxConstants.FONT_ITALIC))
			{
				container.style.fontStyle = 'italic';
			}
			
			if (this.isStyleSet(mxConstants.FONT_UNDERLINE))
			{
				container.style.textDecoration = 'underline';
			}
			
			if (!this.isWrapping)
			{
				container.style.whiteSpace = 'nowrap';
			}
			
			if (this.background != null)
			{
				container.style.background = this.background;
			}
			
			if (this.border != null)
			{
				container.style.borderColor = this.border;
				container.style.borderWidth = '1px';
				container.style.borderStyle = 'solid';
			}

			if (!mxUtils.isNode(this.value))
			{
				var value = this.value.replace(/\n/g, '<br/>');
						
				if (mxClient.IS_IE &&
					this.isStyleSet(mxConstants.FONT_SHADOW))
				{
					value = '<p style=\"height:1em;filter:Shadow(Color=#666666,'+
						'Direction=135,Strength=%);\">'+ value + '</p>';
				}

				container.innerHTML = value;
			}
			else
			{
				container.appendChild(this.value);
			}
			
			row.appendChild(td);
			tbody.appendChild(row);
			table.appendChild(tbody);
			
			if (this.node.nodeName == 'foreignObject')
			{
				// Workaround for the table not being displayed if the respective
				// child is replaced in the DOM. Instead, we carefully modify
				// the existing DOM inside the foreignObject
				if (this.node.firstChild != null)
				{
					// Redirect table to old table DOM node
					table = this.node.firstChild.firstChild;

					var oldTd = table.firstChild.firstChild.firstChild;
					oldTd.style.cssText = td.getAttribute('style');
				}
				else
				{
					var body = document.createElementNS(mxConstants.NS_XHTML, 'body');
					body.style.overflow = this.node.style.overflow;

					table.setAttribute('width', '100%');
					table.setAttribute('height', '100%');
					
					body.appendChild(table);
					this.node.appendChild(body);
					
					//console.debug(table.offsetWidth); // always 0
				}
			}
			else
			{
				this.node.innerHTML = '';
				this.node.appendChild(table);
			}
			
			var xdiff = 0;
			var ydiff = 0;
			var tmpalign = (this.isRotate) ? this.valign : this.align;
			var tmpvalign = (this.isRotate) ? this.align : this.valign;
			
			// Shifts label to match alignment wrt vertex
			if (this.node.style.overflow != 'hidden')
			{
				if (this.bounds.width > 0 ||
					this.useTableBounds)
				{
					xdiff = Math.floor(Math.max(0, table.offsetWidth - this.bounds.width));
					
					if (tmpalign == mxConstants.ALIGN_CENTER ||
						tmpalign == mxConstants.ALIGN_MIDDLE)
					{
						xdiff = Math.floor(xdiff / 2);
					}
					else if (tmpalign != mxConstants.ALIGN_RIGHT &&
						tmpalign != mxConstants.ALIGN_BOTTOM)
					{
						xdiff = 0;
					}
				}
	
				if (this.bounds.height > 0 ||
					this.useTableBounds)
				{
					ydiff = Math.floor(Math.max(0, table.offsetHeight - this.bounds.height));
					
					if (tmpvalign == mxConstants.ALIGN_MIDDLE ||
						tmpvalign == mxConstants.ALIGN_CENTER)
					{
						ydiff = Math.floor(ydiff / 2);
					}
					else if ((!this.isRotate &&
						tmpvalign != mxConstants.ALIGN_BOTTOM) ||
						(this.isRotate &&
						tmpvalign != mxConstants.ALIGN_LEFT))
					{
						ydiff = 0;
					}
				}
	
				if (xdiff > 0 ||
					ydiff > 0)
				{
					if (!mxUtils.isVml(this.node))
					{
						this.node.style.marginLeft = -xdiff+'px';
						this.node.style.marginTop = -ydiff+'px';
					}
					else
					{
						// KNOWN: Offset when used second time - only in exact mode
						var x0 = parseInt(this.node.parentNode.style.left) || 0;
						var y0 = parseInt(this.node.parentNode.style.top) || 0;

						xdiff -= this.bounds.x - x0;
						ydiff -= this.bounds.y - y0;

						this.node.inset = (-xdiff)+'px,'+(-ydiff)+'px,0px,0px';
					}
				}
				else if (mxUtils.isVml(this.node))
				{
					// KNOWN: Offset when used second time - only in exact mode
					var x0 = parseInt(this.node.parentNode.style.left);
					var y0 = parseInt(this.node.parentNode.style.top);

					this.node.inset = (this.bounds.x-x0)+'px,'+
						(this.bounds.y-y0)+'px,'+
						(y0-this.bounds.y)+'px,'+
						(x0-this.bounds.x)+'px';
				}
			}
			
			// Sets the opacity of the text
			if (this.opacity != null)
			{
				mxUtils.setOpacity(this.node, this.opacity);
			}

			// Computes the actual bounding box of the shape
			var x = this.bounds.x - xdiff;
			var y = this.bounds.y - ydiff;
			
			var width = Math.max(this.bounds.width, table.offsetWidth || 0);
			var height = Math.max(this.bounds.height, table.offsetHeight || 0);

			this.boundingBox = new mxRectangle(x, y, width, height);
		}
		else
		{
			this.node.innerHTML = '<div style=\'width:100%;height:100%;\'></div>';
			this.boundingBox = this.bounds.clone();
			
			// Catches events on empty labels
			if (!mxUtils.isVml(this.node))
			{
				this.node.style.position = 'absolute';
				this.node.style.left = this.bounds.x+'px';
				this.node.style.top = this.bounds.y+'px';
				this.node.style.width = this.bounds.width+'px';
				this.node.style.height = this.bounds.height+'px';
			}
		}

		// FIXME: Currently no workaround for delayed upate of offsetWidth and height
		// for table node inside foreignObject, which means overlapping labels cannot
		// be handled correctly as we need the DOM to compute the markup size for us
		if (this.node.nodeName == 'foreignObject')
		{
			this.node.setAttribute('x', parseInt(this.node.style.left) + parseInt(this.node.style.marginLeft));
			this.node.setAttribute('y', parseInt(this.node.style.top) + parseInt(this.node.style.marginTop));
			
			var w = parseInt(this.node.style.width);
			
			if (!isNaN(w))
			{
				this.node.setAttribute('width', w);
			}
			
			var h = parseInt(this.node.style.height); 
			
			if (!isNaN(h))
			{
				this.node.setAttribute('height', h);	
			}
			
			//console.debug(this.node);
		}
	};

	/**
	 * Function: createSvg
	 *
	 * Creates and returns the SVG node(s) to represent this shape.
	 */
	mxText.prototype.createSvg = function()
	{
		// Creates a group so that shapes inside are rendered properly, if this is
		// a text node then the background rectangle is not rendered in Webkit.
		var node = document.createElementNS(mxConstants.NS_SVG, 'g');

		var uline = this.isStyleSet(mxConstants.FONT_UNDERLINE) ? 'underline' : 'none';
		var weight = this.isStyleSet(mxConstants.FONT_BOLD) ? 'bold' : 'normal';
		var s = this.isStyleSet(mxConstants.FONT_ITALIC) ? 'italic' : null;
		var align = (this.align == mxConstants.ALIGN_RIGHT) ? 'end' :
						(this.align == mxConstants.ALIGN_CENTER) ? 'middle' :
						'start';

		// Underline is not implemented in FF, see
		// https://bugzilla.mozilla.org/show_bug.cgi?id=317196
		node.setAttribute('text-decoration', uline);
		node.setAttribute('text-anchor', align);
		node.setAttribute('font-family', this.family);
		node.setAttribute('font-weight', weight);
		node.setAttribute('font-size', Math.floor(this.size*this.scale)+'px');
		node.setAttribute('fill', this.color);
		
		if (s != null)
		{
			node.setAttribute('font-style', s);
		}


		// Adds a rectangle for the background color
		if (this.background != null ||
			this.border != null)
		{
			this.backgroundNode = document.createElementNS(mxConstants.NS_SVG, 'rect');
			this.backgroundNode.setAttribute('shape-rendering', 'optimizeSpeed');
			
			if (this.background != null)
			{
				this.backgroundNode.setAttribute('fill', this.background);
			}
			else
			{
				this.backgroundNode.setAttribute('fill', 'none');
			}
			
			if (this.border != null)
			{
				this.backgroundNode.setAttribute('stroke', this.border);
			}
			else
			{
				this.backgroundNode.setAttribute('stroke', 'none');
			}
		}
		
		this.updateSvgValue(node);
		
		return node;
	};
	
	/**
	 * Updates the text represented by the SVG DOM nodes.
	 */
	mxText.prototype.updateSvgValue = function(node)
	{
		if (this.currentValue != this.value)
		{
			// Removes all existing children
			while (node.firstChild != null)
			{
				node.removeChild(node.firstChild);
			}
			
			if (this.value != null)
			{
				// Adds tspan elements for the lines
				var lines = this.value.split('\n');
				
			 	for (var i = 0; i < lines.length; i++)
			 	{
			 		var tspan = this.createSvgSpan(lines[i]);
					node.appendChild(tspan);
				}
			}
			
			this.currentValue = this.value;
		}
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxText.prototype.redrawSvg = function()
	{
		if (this.node.nodeName == 'foreignObject')
		{
			this.redrawHtml()
			return;
		}
		
		this.updateSvgValue(this.node);
		this.node.setAttribute('font-size', Math.floor(this.size*this.scale)+'px');

		if (this.opacity != null)
		{
			// Improves opacity performance in Firefox
			this.node.setAttribute('fill-opacity', this.opacity/100);
			this.node.setAttribute('stroke-opacity', this.opacity/100);
		}
		
		var dy = this.size * 1.3 * this.scale;
		var childCount = this.node.childNodes.length;
		
		if (this.backgroundNode != null)
		{
			childCount--;
		}
		
		var x = this.bounds.x;
		var y = this.bounds.y;
		
		x += (this.align == mxConstants.ALIGN_RIGHT) ?
				((this.isRotate) ? this.bounds.height : this.bounds.width)-
				this.spacingRight*this.scale :
				(this.align == mxConstants.ALIGN_CENTER) ?
					this.spacingLeft +
					(((this.isRotate) ? this.bounds.height : this.bounds.width) -
					this.spacingLeft - this.spacingRight) / 2 :
					this.spacingLeft*this.scale;
		
		// Makes sure the alignment is like in VML and HTML
		var y0 = (this.valign == mxConstants.ALIGN_BOTTOM) ?
					((this.isRotate) ? this.bounds.width : this.bounds.height)-
					(childCount-1)*dy -	this.spacingBottom*this.scale - 3 :
					(this.valign == mxConstants.ALIGN_MIDDLE) ?
						(this.spacingTop*this.scale+
						((this.isRotate) ? this.bounds.width : this.bounds.height)-
						this.spacingBottom*this.scale-
						(childCount-1.5)*dy)/2+1 :
						this.spacingTop*this.scale+dy-2;

		y += y0;

		this.node.setAttribute('x', x);
		this.node.setAttribute('y', y);
		
		if (this.isRotate)
		{
			var cx = this.bounds.x + this.bounds.width / 2;
			var cy = this.bounds.y + this.bounds.height / 2;
			
			var offsetX = (this.bounds.width - this.bounds.height) / 2;
			var offsetY = (this.bounds.height - this.bounds.width) / 2;
			
			this.node.setAttribute('transform',
				'rotate(-90 '+cx+' '+cy+') '+
				'translate('+-offsetY+' '+(-offsetX)+')');
		}
		
		// Removes the backgroundNode while computing the bbox
		if (this.backgroundNode != null &&
			this.backgroundNode.parentNode == this.node)
		{
			this.node.removeChild(this.backgroundNode);
		}
				
		// TODO: Font-shadow / foreignobject in FF 3.0
		for (var i=0; i<childCount; i++)
		{
			var node = this.node.childNodes[i];
			node.setAttribute('x', x);
			node.setAttribute('y', y);
			y += dy;

			// Triggers an update in Firefox 1.5.0.x (don't add a semicolon!)
			node.setAttribute('style', 'pointer-events: all');
		}

		// Default bounding box is the outer bounds of the enclosing shape
		this.boundingBox = this.bounds.clone();

		// Adds the bounding box for overlapping labels
		if (this.value != null &&
			this.value.length > 0)
		{
			try
			{
				var box = this.node.getBBox();
				this.boundingBox = new mxRectangle(
					Math.min(this.bounds.x, box.x - 4 * this.scale || 0),
					Math.min(this.bounds.y, box.y - 4 * this.scale || 0),
					Math.max(this.bounds.width, box.width + 8 * this.scale || 0),
					Math.max(this.bounds.height, box.height + 10 * this.scale || 0));
		
				if (this.backgroundNode != null &&
					this.node.firstChild != null)
				{
					this.node.insertBefore(this.backgroundNode, this.node.firstChild);
					
					this.backgroundNode.setAttribute('x', box.x - 4 * this.scale || 0);
					this.backgroundNode.setAttribute('y', box.y - 4 * this.scale || 0);
					this.backgroundNode.setAttribute('width', box.width + 8 * this.scale || 0);
					this.backgroundNode.setAttribute('height', box.height + 8 * this.scale || 0);
	
					var strokeWidth = Math.floor(Math.max(1, this.scale));
					this.backgroundNode.setAttribute('stroke-width', strokeWidth);
				}
			}
			catch (ex)
			{
				// ignore				
			}
		}
	};

	/**
	 *  Function: createSvgSpan
	 *
	 * Creats an SVG tspan node for the given text.
	 */
	mxText.prototype.createSvgSpan = function(text)
	{
		// Creates a text node since there is no enclosing text element but
		// rather a group, which is required to render the background rectangle
		// in Webkit. This can be changed to tspan if the enclosing node is
		// a text but this leads to an hidden background in Webkit.
		var node = document.createElementNS(mxConstants.NS_SVG, 'text');
		mxUtils.write(node, text);
		
		return node;
	};

}
