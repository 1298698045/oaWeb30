/**
 * $Id: mxParallelEdgeLayout.js,v 1.13 2008/10/13 09:37:51 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxParallelEdgeLayout
 * 
 * Extends <mxGraphLayout> for arranging parallel edges. This layout works
 * on edges for all pairs of vertices where there is more than one edge
 * connecting the latter.
 * 
 * Example:
 * 
 * (code)
 * var layout = new mxParallelEdgeLayout(graph);
 * layout.execute(graph.getDefaultParent());
 * (end)
 */
{

	/**
	 * Constructor: mxCompactTreeLayout
	 * 
	 * Constructs a new fast organic layout for the specified graph.
	 */
	function mxParallelEdgeLayout(graph)
	{
		mxGraphLayout.call(this, graph);
	};
	
	/**
	 * Extends mxGraphLayout.
	 */
	mxParallelEdgeLayout.prototype = new mxGraphLayout();
	mxParallelEdgeLayout.prototype.constructor = mxParallelEdgeLayout;
	
	/**
	 * Variable: spacing
	 * 
	 * Defines the spacing between the parallels. Default is 20.
	 */
	mxParallelEdgeLayout.prototype.spacing = 20;

	/**
	 * Function: execute
	 * 
	 * Implements <mxGraphLayout.execute>.
	 */
	mxParallelEdgeLayout.prototype.execute = function(parent)
	{
		var lookup = this.findParallels(parent);
		
		this.graph.model.beginUpdate();	
		try
		{
			for (var i in lookup)
			{
				var parallels = lookup[i];

				if (parallels.length > 1)
				{
					this.layout(parallels);
				}
			}
		}
		finally
		{
			this.graph.model.endUpdate();
		}
	};
	
	/**
	 * Function: findParallels
	 * 
	 * Finds the parallel edges in the given parent.
	 */
	mxParallelEdgeLayout.prototype.findParallels = function(parent)
	{
		var view = this.graph.getView();
		var model = this.graph.getModel();
		var lookup = new Array();
		var childCount = model.getChildCount(parent);
		
		for (var i = 0; i < childCount; i++)
		{
			var child = model.getChildAt(parent, i);
			
			if (!this.isEdgeIgnored(child))
			{
				var src = view.getVisibleTerminal(child, true);
				var trg = view.getVisibleTerminal(child, false);
				
				if (src != null &&
					trg != null)
				{
					src = mxCellPath.create(src);
					trg = mxCellPath.create(trg);
					
					var id = (src > trg) ? trg+'-'+src : src+'-'+trg;
					
					if (lookup[id] == null)
					{
						lookup[id] = new Array();
					}
					
					lookup[id].push(child);
				}
			}
		}
		
		return lookup;
	};

	/**
	 * Function: layout
	 * 
	 * Lays out the parallel edges in the given array.
	 */
	mxParallelEdgeLayout.prototype.layout = function(parallels)
	{
		var edge = parallels[0];
		var view = this.graph.getView();
		var model = this.graph.getModel();
		
		var src = model.getGeometry(model.getTerminal(edge, true));
		var trg = model.getGeometry(model.getTerminal(edge, false));
		
		// Routes multiple loops
		if (src == trg)
		{
			var x0 = src.x + src.width + this.spacing;
			var y0 = src.y + src.height / 2;
	
			for (var i = 0; i < parallels.length; i++)
			{
				this.route(parallels[i], x0, y0);
				x0 += this.spacing;
			}
		}
		else if (src != null && trg != null)
		{
			// Routes parallel edges
			var scx = src.x + src.width / 2;
			var scy = src.y + src.height / 2;
			
			var tcx = trg.x + trg.width / 2;
			var tcy = trg.y + trg.height / 2;
			
			var dx = tcx - scx;
			var dy = tcy - scy;
	
			var len = Math.sqrt(dx*dx+dy*dy);
			
			var x0 = scx + dx / 2;
			var y0 = scy + dy / 2;
			
			var nx = dy * this.spacing / len;
			var ny = dx * this.spacing / len;
			
			x0 += nx * (parallels.length - 1) / 2;
			y0 -= ny * (parallels.length - 1) / 2;
	
			for (var i = 0; i < parallels.length; i++)
			{
				this.route(parallels[i], x0, y0);
				x0 -= nx;
				y0 += ny;
			}
		}
	};
	
	/**
	 * Function: route
	 * 
	 * Routes the given edge via the given point.
	 */
	mxParallelEdgeLayout.prototype.route = function(edge, x, y)
	{
		if (this.graph.isMovable(edge))
		{
			this.setEdgePoints(edge, [new mxPoint(x, y)]);
		}
	};

}
