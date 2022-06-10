/**
 * $Id: mxGraphLayout.js,v 1.25 2008/09/17 11:23:28 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGraphLayout
 * 
 * Base class for all layout algorithms in mxGraph. Main public functions are
 * <move> for handling a moved cell within a layouted parent, and <execute> for
 * running the layout on a given parent cell.
 *
 * Known Subclasses:
 *
 * <mxCircleLayout>, <mxCompactTreeLayout>, <mxCompositeLayout>,
 * <mxFastOrganicLayout>, <mxParallelEdgeLayout>, <mxPartitionLayout>,
 * <mxStackLayout>
 */
{

	/**
	 * Constructor: mxGraphLayout
	 *
	 * Constructs a new layout using the given layouts.
	 *
	 * Arguments:
	 * 
	 * graph - Enclosing 
	 */
	function mxGraphLayout(graph)
	{
		this.graph = graph;
	};

	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxGraphLayout.prototype.graph = null;

	/**
	 * Variable: useBoundingBox
	 *
	 * Boolean indicating if the bounding box of the label should be used if
	 * its available. Default is true.
	 */
	mxGraphLayout.prototype.useBoundingBox = true;

	/**
	 * Function: move
	 * 
	 * Notified when a cell is being moved in a parent that has automatic
	 * layout to update the cell state (eg. index) so that the outcome of the
	 * layout will position the vertex as close to the point (x, y) as
	 * possible.
	 * 
	 * Not yet implemented.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> which has been moved.
	 * x - X-coordinate of the new cell location.
	 * y - Y-coordinate of the new cell location.
	 */
	mxGraphLayout.prototype.move = function(cell, x, y) { };
	
	/**
	 * Function: execute
	 * 
	 * Executes the layout algorithm for the children of the given parent.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> whose children should be layed out.
	 */
	mxGraphLayout.prototype.execute = function(parent) { };

	/**
	 * Function: getGraph
	 * 
	 * Returns the graph that this layout operates on.
	 */
	mxGraphLayout.prototype.getGraph = function()
	{
		return this.graph;
	};

	/**
	 * Function: isCellMovable
	 * 
	 * Returns a boolean indicating if the given <mxCell> is movable or
	 * bendable by the algorithm. This implementation returns true if the given
	 * cell is movable in the graph.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose movable state should be returned.
	 */
	mxGraphLayout.prototype.isVertexMovable = function(cell)
	{
		return this.graph.isMovable(cell);
	};

	/**
	 * Function: isVertexIgnored
	 * 
	 * Returns a boolean indicating if the given <mxCell> should be ignored by
	 * the algorithm. This implementation returns false for all vertices.
	 * 
	 * Parameters:
	 * 
	 * vertex - <mxCell> whose ignored state should be returned.
	 */
	mxGraphLayout.prototype.isVertexIgnored = function(vertex)
	{
		return !this.graph.getModel().isVertex(vertex) ||
			!this.graph.isCellVisible(vertex);
	};

	/**
	 * Function: isEdgeIgnored
	 * 
	 * Returns a boolean indicating if the given <mxCell> should be ignored by
	 * the algorithm. This implementation returns false for all vertices.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose ignored state should be returned.
	 */
	mxGraphLayout.prototype.isEdgeIgnored = function(edge)
	{
		var model = this.graph.getModel();
		
		return !model.isEdge(edge) ||
			!this.graph.isCellVisible(edge) ||
			model.getTerminal(edge, true) == null ||
			model.getTerminal(edge, false) == null;
	};
	
	/**
	 * Function: setCellLocation
	 * 
	 * Sets the new position of the given cell taking into account the size of
	 * the bounding box if <useBoundingBox> is true. The change is only carried
	 * out if the new location is not equal to the existing location, otherwise
	 * the geometry is not replaced with an updated instance. The new or old
	 * bounds are returned (including overlapping labels).
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose geometry is to be set.
	 * x - Integer that defines the x-coordinate of the new location.
	 * y - Integer that defines the y-coordinate of the new location.
	 */
	mxGraphLayout.prototype.setVertexLocation = function(cell, x, y)
	{
		var model = this.graph.getModel();
		var geometry = model.getGeometry(cell);
		var result = null;
		
		if (geometry != null)
		{
			result = new mxRectangle(x, y,
				geometry.width, geometry.height);
			
			// Checks for oversize labels and shifts the result
			if (this.useBoundingBox)
			{
				var state = this.graph.getView().getState(cell);
				
				if (state != null && state.text != null &&
					state.text.boundingBox != null &&
					state.text.boundingBox.x < state.x)
				{
					var scale = this.graph.getView().scale;
					var box = state.text.boundingBox;
					x += (state.x - box.x) / scale;
					result.width = box.width;
				}
			}
	
			if (geometry.x != x ||
				geometry.y != y)
			{
				geometry = geometry.clone();
				geometry.x = x;
				geometry.y = y;
				
				model.setGeometry(cell, geometry);
			}
		}
		
		return result;
	};
	
	/**
	 * Function: setEdgePoints
	 * 
	 * Replaces the array of mxPoints in the geometry of the given edge
	 * with the given array of mxPoints.
	 */
	mxGraphLayout.prototype.setEdgePoints = function(edge, points)
	{
		if (edge != null)
		{
			var model = this.graph.model;
			var geometry = model.getGeometry(edge);

			if (geometry == null)
			{
				geometry = new mxGeometry();
				geometry.setRelative(true);
			}
			else
			{
				geometry = geometry.clone();
			}

			geometry.points = points;
			model.setGeometry(edge, geometry);
		}
	};
	
	/**
	 * Function: getCellBounds
	 * 
	 * Returns an <mxRectangle> that defines the bounds of the given cell or
	 * the bounding box if <useBoundingBox> is true.
	 */
	mxGraphLayout.prototype.getVertexBounds = function(cell)
	{
		var geo = this.graph.getModel().getGeometry(cell);

		// Checks for oversize label bounding box and corrects
		// the return value accordingly
		if (this.useBoundingBox)
		{
			var state = this.graph.getView().getState(cell);

			if (state != null && state.text != null &&
				state.text.boundingBox != null)
			{
				var scale = this.graph.getView().scale;
				var tmp = state.text.boundingBox;

				var dx0 = (tmp.x - state.x) / scale;
				var dy0 = (tmp.y - state.y) / scale;
				var dx1 = (tmp.x + tmp.width - state.x - state.width) / scale;
				var dy1 = (tmp.y + tmp.height - state.y - state.height) / scale;

				geo = new mxRectangle(geo.x + dx0, geo.y + dy0,
					geo.width - dx0 + dx1, geo.height - dy0 + dy1);
			}
		}

		return new mxRectangle(geo.x, geo.y, geo.width, geo.height);
	};

}
