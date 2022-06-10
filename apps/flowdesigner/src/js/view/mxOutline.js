/**
 * $Id: mxOutline.js,v 1.21 2008/08/23 11:57:58 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxOutline
 *
 * Implements an outline (aka overview) for a graph.
 * 
 * Example:
 * 
 * (code)
 * var outline = new mxOutline(graph, div);
 * (end)
 * 
 * If the selection border in the outline appears behind the contents of the
 * graph, then you can use the following code. (This may happen when using a
 * transparent container for the outline in IE.)
 * 
 * (code)
 * mxOutline.prototype.graphRenderHint = 'exact';
 * (end)
 */
{

	/**
	 * Constructor: mxOutline
	 *
	 * Constructs a new outline for the specified graph inside the given
	 * container.
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> to create the outline for.
	 * container - DOM node that will contain the outline.
	 */
	function mxOutline(graph, container)
	{
		this.source = graph;
		this.graph = new mxGraph(container, graph.getModel(), this.graphRenderHint);

		// Enables faster painting in SVG
		if (mxClient.IS_SVG)
		{
			var node = this.graph.getView().getCanvas().parentNode;
			node.setAttribute('shape-rendering', 'optimizeSpeed');
			node.setAttribute('image-rendering', 'optimizeSpeed');
		}
		
		// Hides cursors and labels, uses same stylesheet
		this.graph.setStylesheet(graph.getStylesheet());
		this.graph.setEnabled(false);
		this.graph.labelsVisible = false;
		
		// Updates the scale of the outline after a change of the main graph
		var self = this; // closure
		graph.getModel().addListener('change', function(sender, changes)
		{
			self.update();
		});

		this.graph.addGraphListener(this);
		
		// Adds listeners to keep the outline in sync with the source graph
		var self = this; // closure
		var funct = function(sender)
		{
			self.update();
		};
		
		this.source.getModel().addListener('change', funct);
		
		var view = this.source.getView();
		view.addListener('scale', funct);
		view.addListener('translate', funct);
		view.addListener('scaleAndTranslate', funct);
		view.addListener('scale', funct);
		view.addListener('down', funct);
		view.addListener('up', funct);
		
		// Refreshes the graph in the outline after a refresh of the main graph
		graph.addListener('refresh', function(sender)
		{
			self.graph.setStylesheet(graph.getStylesheet());
			self.graph.refresh();
		});

		// Creates the blue rectangle for the viewport
		this.bounds = new mxRectangle(0, 0, 0, 0);
		this.selectionBorder = new mxRectangleShape(this.bounds, null,
			mxConstants.OUTLINE_COLOR, mxConstants.OUTLINE_STROKEWIDTH);
		
		// Makes sure to use either VML or SVG shapes in
		// order to provide event-transparency for the
		// background area of the rectangle.
		this.selectionBorder.dialect =
			(this.graph.dialect != mxConstants.DIALECT_SVG) ?
			mxConstants.DIALECT_VML : mxConstants.DIALECT_SVG;
		this.selectionBorder.init(this.graph.getView().getOverlayPane());
		
		// Creates a little blue rectangle for sizing (sizer handle)
		var s = 3;
		this.sizer = new mxRectangleShape(this.bounds,
			mxConstants.OUTLINE_HANDLE_FILLCOLOR,
			mxConstants.OUTLINE_HANDLE_STROKECOLOR);
		this.sizer.dialect = this.graph.dialect;
		this.sizer.init(this.graph.getView().getOverlayPane());
		
		if (this.enabled)
		{
			this.sizer.node.style.cursor = 'pointer';
		}

		// Redirects all events from the sizerhandle to the outline
		mxEvent.addListener(this.sizer.node, 'mousedown', function (evt)
		{
			self.graph.dispatchGraphEvent('mousedown', evt, null, 0);
		});
		
		this.selectionBorder.node.style.display = (this.showViewport) ? '' : 'none';
		this.sizer.node.style.display = this.selectionBorder.node.style.display; 

		this.refresh();
	};
	
	/**
	 * Function: graphRenderHint
	 * 
	 * Renderhint to be used for the outline graph. Default is faster.
	 */
	mxOutline.prototype.graphRenderHint = 'faster';

	/**
	 * Variable: enabled
	 * 
	 * Specifies if events are handled. Default is true.
	 */
	mxOutline.prototype.enabled = true;

	/**
	 * Variable: showViewport
	 * 
	 * Specifies a viewport rectangle should be shown. Default is true.
	 */
	mxOutline.prototype.showViewport = true;

	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation
	 * returns <enabled>.
	 */
	mxOutline.prototype.isEnabled = function()
	{
		return this.enabled;
	};
		
	/**
	 * Function: setEnabled
	 * 
	 * Enables or disables event handling. This implementation
	 * updates <enabled>.
	 * 
	 * Parameters:
	 * 
	 * enabled - Boolean that specifies the new enabled state.
	 */
	mxOutline.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};

	/**
	 * Function: refresh
	 * 
	 * Refreshes the outline.
	 */
	mxOutline.prototype.refresh = function(revalidate)
	{
		this.update();
		this.graph.refresh();
	};
	
	/**
	 * Function: refresh
	 * 
	 * Refreshes the outline.
	 */
	mxOutline.prototype.update = function(revalidate)
	{
		var bounds = this.source.getBounds();
		var mw = parseInt(this.source.container.clientWidth);
		var mh = parseInt(this.source.container.clientHeight);
		var c = this.graph.container;
		var cw = parseInt(c.clientWidth);
		var ch = parseInt(c.clientHeight);
		
		if (cw > 0 || ch > 0)
		{
			var w = Math.max(mw, bounds.width + Math.abs(bounds.x)) + cw * 0.1;
			var h = Math.max(mh, bounds.height + Math.abs(bounds.y)) + ch * 0.1;
			var scale = Math.min(cw/w, ch/h);

			if (this.graph.getView().scale != scale)
			{
				this.graph.getView().scale = scale
				revalidate = true;
			}
		}

		var navView = this.graph.getView();
		
		if (navView.currentRoot != this.source.getView().currentRoot)
		{
			navView.setCurrentRoot(this.source.getView().currentRoot);
		}
		
		var t = this.source.view.translate;
		var tx = Math.max(0, t.x);
		var ty = Math.max(0, t.y);
		
		if (navView.translate.x != tx ||
				navView.translate.y != ty)
		{
			navView.translate.x = tx;
			navView.translate.y = ty;
			revalidate = true;
		}

		// Prepares local variables for computations
		var t2 = navView.translate;
		var scale = this.source.getView().scale;
		var scale2 = scale / navView.scale;
		var scale3 = 1.0 / navView.scale;
		var container = this.source.container;
		
		// Updates the bounds of the viewrect in the navigation
		this.bounds = new mxRectangle(
			(t2.x-t.x)/scale3,
			(t2.y-t.y)/scale3,
			(container.clientWidth/scale2),
			((container.clientHeight)/scale2));
		this.selectionBorder.bounds = this.bounds;
		this.selectionBorder.redraw();
		
		// Updates the bounds of the zoom handle at the bottom right
		var s = 3;
		this.sizer.bounds = new mxRectangle(this.bounds.x+this.bounds.width-s,
			this.bounds.y+this.bounds.height-s, 2*s, 2*s);
		this.sizer.redraw();
		
		if (revalidate)
		{
			this.graph.view.revalidate();
		}
	};

	/**
	 * Function: mouseDown
	 * 
	 * Handles the event by starting a translation or zoom.
	 */
	mxOutline.prototype.mouseDown = function(evt, cell, index)
	{
		if (this.enabled && this.showViewport)
		{
			this.index = index;
			this.startX = evt.clientX;
			this.startY = evt.clientY;
			this.active = true;
		}
		
		mxEvent.consume(evt);
	};

	/**
	 * Function: mouseMove
	 * 
	 * Handles the event by previewing the viewrect in <graph> and updating the
	 * rectangle that represents the viewrect in the outline.
	 */
	mxOutline.prototype.mouseMove = function(evt, cell)
	{
		if (this.active)
		{
			this.selectionBorder.node.style.display = (this.showViewport) ? '' : 'none';
			this.sizer.node.style.display = this.selectionBorder.node.style.display; 

			var dx = evt.clientX - this.startX;
			var dy = evt.clientY - this.startY;
			var bounds = null;
			
			if (this.index == null)
			{
				// Previews the panning on the source graph
				var scale = this.graph.getView().scale;
				bounds = new mxRectangle(this.bounds.x + dx,
					this.bounds.y + dy, this.bounds.width, this.bounds.height);
				this.selectionBorder.bounds = bounds;
				this.selectionBorder.redraw();
				dx /= scale;
				dx *= this.source.getView().scale;
				dy /= scale;
				dy *= this.source.getView().scale;
				this.source.shift(-dx, -dy);
			}
			else
			{
				// Does *not* preview zooming on the source graph
				var container = this.source.container;
				var viewRatio = container.clientWidth / container.clientHeight;
				dy = dx/viewRatio;
				bounds = new mxRectangle(this.bounds.x,
					this.bounds.y, this.bounds.width+dx, this.bounds.height+dy);
				this.selectionBorder.bounds = bounds;
				this.selectionBorder.redraw();
			}
			
			// Updates the zoom handle
			var s = 3;
			this.sizer.bounds = new mxRectangle(
				bounds.x+bounds.width-s,
				bounds.y+bounds.height-s, 2*s, 2*s);
			this.sizer.redraw();
			
			mxEvent.consume(evt);
		}
	};

	/**
	 * Function: mouseUp
	 * 
	 * Handles the event by applying the translation or zoom to <graph>.
	 */
	mxOutline.prototype.mouseUp = function(evt, cell)
	{
		if (this.active)
		{
			var dx = evt.clientX - this.startX;
			var dy = evt.clientY - this.startY;
			
			if (Math.abs(dx) > 0 || Math.abs(dy) > 0)
			{
				if (this.index == null)
				{
					// Applies the new translation
					this.source.shift(0, 0);
					dx /= this.graph.getView().scale;
					dy /= this.graph.getView().scale;
					var t = this.source.getView().translate;
					this.source.getView().setTranslate(t.x - dx, t.y - dy);
				}
				else
				{
					// Applies the new zoom
					var w = this.selectionBorder.bounds.width;
					var h = this.selectionBorder.bounds.height;
					var scale = this.source.getView().scale;
					this.source.getView().setScale(scale - (dx*scale)/w);
				}

				this.update();
				mxEvent.consume(evt);
			}
				
			// Resets the state of the handler
			this.index = null;
			this.active = false;
		}
	};

}
