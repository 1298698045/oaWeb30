/**
 * $Id: mxElbowEdgeHandler.js,v 1.19 2008/09/30 06:51:26 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxEdgeHandler
 *
 * Graph event handler that reconnects edges and modifies control points and
 * the edge label location. Uses <mxTerminalMarker> for finding and
 * highlighting new source and target vertices. This handler is automatically
 * created in <mxGraph.createHandler>. It extends <mxEdgeHandler>.
 */
{

	/**
	 * Constructor: mxEdgeHandler
	 *
	 * Constructs an edge handler for the specified <mxCellState>.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> of the cell to be modified.
	 */
	function mxElbowEdgeHandler(state)
	{
		if (state != null)
		{
			this.state = state;
			this.graph = this.state.view.graph;
			this.graph.addGraphListener(this);
			this.marker = this.createMarker();
			this.init();
		}
	};

	/**
	 * Extends mxEdgeHandler.
	 */
	mxElbowEdgeHandler.prototype = new mxEdgeHandler();
	mxElbowEdgeHandler.prototype.constructor = mxElbowEdgeHandler;
		
	/**
	 * Variable: doubleClickOrientationResource
	 * 
	 * Specifies the resource key for the tooltip to be displayed on the single
	 * control point for routed edges. If the resource for this key does not
	 * exist then the value is used as the error message. Default is
	 * 'doubleClickOrientation'.
	 */
	mxElbowEdgeHandler.prototype.doubleClickOrientationResource =
		(mxClient.language != 'none') ? 'doubleClickOrientation' : '';
	
	/**
	 * Function: createBends
	 * 
	 * Overrides <mxEdgeHandler.createBends> to create custom bends.
	 */
	 mxElbowEdgeHandler.prototype.createBends = function()
	 {
		var bends = new Array();
		
		// Source
		var bend = new mxRectangleShape(new mxRectangle(),
				mxConstants.HANDLE_FILLCOLOR,
				mxConstants.HANDLE_STROKECOLOR);

		this.initBend(bend);
		bend.node.style.cursor = 'all-scroll';

		this.installListeners(bend.node, bends.length);
		bends.push(bend);

		// Virtual
		bends.push(this.createVirtualBend());
		this.points.push(new mxPoint(0,0));

		// Target
		bend = new mxRectangleShape(new mxRectangle(),
				mxConstants.HANDLE_FILLCOLOR,
				mxConstants.HANDLE_STROKECOLOR);

		this.initBend(bend);
		bend.node.style.cursor = 'all-scroll';

		this.installListeners(bend.node, bends.length);
		bends.push(bend);

		return bends;
	 };
	
	/**
	 * Function: createVirtualBend
	 * 
	 * Creates a virtual bend that supports double clicking and calls
	 * <mxGraph.flip>.
	 */
	mxElbowEdgeHandler.prototype.createVirtualBend = function()
	{
		var bend = new mxRectangleShape(new mxRectangle(0, 0, 1, 1),
				mxConstants.HANDLE_FILLCOLOR,
				mxConstants.HANDLE_STROKECOLOR);
		this.initBend(bend);

		var crs = this.getCursorForBend();
		bend.node.style.cursor = crs;
		
		if (this.graph.isBendable(this.state.cell))
		{
			this.installListeners(bend.node, 1);
		}
		else
		{
			bend.node.style.visibility = 'hidden';
		}
		
		// Double-click changes edge style
		var self = this; // closure
		mxEvent.addListener(bend.node, 'dblclick', function (evt)
		{
			self.graph.flip(self.state.cell, evt);
			mxEvent.consume(evt);
		});
		
		// Shows a tooltip on this bend
		mxEvent.addListener(bend.node, 'mousemove', function (evt)
		{
			self.graph.dispatchGraphEvent('mousemove', evt, self.state.cell,
				mxResources.get(self.doubleClickOrientationResource) ||
				self.doubleClickOrientationResource);
		});

		return bend;
	};
	
	/**
	 * Function: getCursorForBend
	 * 
	 * Returns the cursor to be used for the bend.
	 */
	mxElbowEdgeHandler.prototype.getCursorForBend = function()
	{
		return (this.state.style[mxConstants.STYLE_EDGE] == mxEdgeStyle.TopToBottom ||
			(this.state.style[mxConstants.STYLE_EDGE] == mxEdgeStyle.ElbowConnector &&
			this.state.style[mxConstants.STYLE_ELBOW] == mxConstants.ELBOW_VERTICAL)) ? 
			'row-resize' : 'col-resize';
	};

	/**
	 * Function: convertPoint
	 * 
	 * Converts the given point in-place from screen to unscaled, untranslated
	 * graph coordinates and applies the grid.
	 * 
	 * Parameters:
	 * 
	 * point - <mxPoint> to be converted.
	 */
	mxElbowEdgeHandler.prototype.convertPoint = function(point)
	{
		var scale = this.graph.view.scale;

		point.x = this.graph.snap(point.x) / scale -
			this.graph.getView().translate.x - this.state.origin.x;
		point.y = this.graph.snap(point.y) / scale -
			this.graph.getView().translate.y - this.state.origin.y;
	};
		
	/**
	 * Function: redrawInnerBends
	 * 
	 * Updates and redraws the inner bends.
	 * 
	 * Parameters:
	 * 
	 * p0 - <mxPoint> that represents the location of the first point.
	 * pe - <mxPoint> that represents the location of the last point.
	 */
	mxElbowEdgeHandler.prototype.redrawInnerBends = function(p0, pe)
	{
		var s = (this.graph.dialect == mxConstants.DIALECT_SVG) ? 3 : 4;

		var g = this.graph.getModel().getGeometry(this.state.cell);
		var pts = g.points;

		var pt = (pts != null) ? pts[0] : null;
		
		if (pt == null)
		{
			pt = new mxPoint(p0.x+(pe.x-p0.x)/2, p0.y+(pe.y-p0.y)/2);
		}
		else
		{
			pt = new mxPoint(this.graph.getView().scale*(pt.x +
					 this.graph.getView().translate.x + this.state.origin.x),
					 this.graph.getView().scale*(pt.y + this.graph.getView().translate.y +
									 this.state.origin.y));
		}

		this.bends[1].bounds = new mxRectangle(pt.x-s, pt.y-s, 2*s, 2*s);
		this.bends[1].reconfigure();
		this.bends[1].redraw();
	};

}
