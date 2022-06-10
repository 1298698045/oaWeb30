/**
 * $Id: mxCircleLayout.js,v 1.14 2008/03/07 17:54:33 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCircleLayout
 * 
 * Extends <mxGraphLayout> to implement a circluar layout for a given radius.
 * The vertices do not need to be connected for this layout to work and all
 * connections between vertices are not taken into account.
 * 
 * Example:
 * 
 * (code)
 * var layout = new mxCircleLayout(graph);
 * layout.execute(graph.getDefaultParent());
 * (end)
 */
{

	/**
	 * Constructor: mxCircleLayout
	 *
	 * Constructs a new circular layout for the specified radius.
	 *
	 * Arguments:
	 * 
	 * graph - <mxGraph> that contains the cells.
	 * radius - Optional radius as an int. Default is 100.
	 */
	function mxCircleLayout(graph, radius)
	{
		mxGraphLayout.call(this, graph);
		this.radius = (radius != null) ? radius : 100;
	};
	
	/**
	 * Extends mxGraphLayout.
	 */
	mxCircleLayout.prototype = new mxGraphLayout();
	mxCircleLayout.prototype.constructor = mxCircleLayout;
	
	/**
	 * Variable: radius
	 * 
	 * Integer specifying the size of the radius. Default is 100.
	 */
	mxCircleLayout.prototype.radius = null;
	
	/**
	 * Function: execute
	 * 
	 * Implements <mxGraphLayout.execute>.
	 */
	mxCircleLayout.prototype.execute = function(parent)
	{
		var model = this.graph.getModel();
		
		// Gets all vertices inside the parent and finds
		// the maximum dimension of the largest vertex
		var max = 0;
		var vertices = new Array();
		var childCount = model.getChildCount(parent);
		
		for (var i=0; i<childCount; i++)
		{
			var cell = model.getChildAt(parent, i);
			
			if (!this.isVertexIgnored(cell))
			{
				vertices.push(cell);
				var bounds = this.getVertexBounds(cell);
				
				max = Math.max(max, Math.max(bounds.width, bounds.height));
			}
		}
		
		var vertexCount = vertices.length;
		var r = Math.max(vertexCount * max / Math.PI, this.radius);
		
		this.circle(vertices, r);
	};
	
	/**
	 * Function: circle
	 * 
	 * Executes the circular layout for the specified array
	 * of vertices and the given radius. This is called from
	 * <execute>.
	 */
	mxCircleLayout.prototype.circle = function(vertices, r)
	{
		var model = this.graph.getModel();

		// Moves the vertices to build a circle. Makes sure the
		// radius is large enough for the vertices to not
		// overlap
		model.beginUpdate();
		try
		{
			var vertexCount = vertices.length;
			var phi = 2 * Math.PI / vertexCount;
			
			for (var i = 0; i < vertexCount; i++)
			{
				if (this.isVertexMovable(vertices[i]))
				{
					this.setVertexLocation(vertices[i],
						r + r * Math.sin(i*phi),
						r + r * Math.cos(i*phi));
				}
			}
		}
		finally
		{
			model.endUpdate();
		}
	};

}
