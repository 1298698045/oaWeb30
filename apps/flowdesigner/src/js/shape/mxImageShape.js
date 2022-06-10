/**
 * $Id: mxImageShape.js,v 1.4 2008/09/02 16:57:33 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxImageShape
 *
 * Extends <mxShape> to implement an image shape. This shape is registered
 * under <mxConstants.SHAPE_IMAGE> in <mxCellRenderer>.
 */
{

	/**
	 * Constructor: mxImageShape
	 * 
	 * Constructs a new image shape.
	 */
	function mxImageShape(bounds, image, fill, stroke, strokewidth)
	{
		this.bounds = bounds;
		this.image = image;
		this.fill = fill;
		this.stroke = stroke;
		this.strokewidth = strokewidth || 0;
		this.isShadow = false;
	};

	/**
	 * Extends mxShape.
	 */
	mxImageShape.prototype = new mxShape();
	mxImageShape.prototype.constructor = mxImageShape;

	/**
	 * Function: create
	 *
	 * Override to create HTML regardless of gradient and
	 * rounded property.
	 */
	mxImageShape.prototype.create = function()
	{
		var node = null;
		if (this.dialect == mxConstants.DIALECT_SVG)
		{
			// Workaround: To avoid control-click on images in Firefox to
			// open the image in a new window, this image needs to be placed
			// inside a group with a rectangle in the foreground which has a
			// fill property but no visibility and absorbs all events.
			// The image in turn must have all pointer-events disabled.
			node = this.createSvgGroup('rect');
			this.innerNode.setAttribute('fill', this.fill);
			this.innerNode.setAttribute('visibility', 'hidden');
			this.innerNode.setAttribute('pointer-events', 'fill');
			
			this.imageNode = document.createElementNS(mxConstants.NS_SVG, 'image');
			this.imageNode.setAttributeNS(mxConstants.NS_XLINK, 'href', this.image);
			this.imageNode.setAttribute('style', 'pointer-events:none');
			this.configureSvgShape(this.imageNode);
			
			node.insertBefore(this.imageNode, this.innerNode);
		}
		else
		{
			if (this.dialect == mxConstants.DIALECT_STRICTHTML ||
				this.dialect == mxConstants.DIALECT_PREFERHTML)
			{
				node = document.createElement('DIV');
				this.configureHtmlShape(node);
				
				// Special handling of PNG files in IE6 for transparency
		        var imgName = this.image.toUpperCase()
	    	    if (imgName.substring(imgName.length-3, imgName.length) == "PNG" &&
	    	    	mxClient.IS_IE && !mxClient.IS_IE7)
	    	    {
					node.style.filter = 'progid:DXImageTransform.Microsoft.AlphaImageLoader (src=\''+
						this.image+'\', sizingMethod=\'scale\')';
				}
				else
				{
					var img = document.createElement('img');
					img.setAttribute('src', this.image);
					img.style.width = '100%';
					img.style.height = '100%';
					img.setAttribute('border', '0');
					node.appendChild(img);
				}
			}
			else
			{
				node = document.createElement('v:image');
				node.setAttribute('src', this.image);
				this.configureVmlShape(node);
			}
		}
		return node;
	};

	/**
	 * Function: redrawSvg
	 *
	 * Updates the SVG node(s) to reflect the latest bounds and scale.
	 */
	mxImageShape.prototype.redrawSvg = function()
	{
		this.updateSvgShape(this.innerNode);
		this.updateSvgShape(this.imageNode);
	};

}
