/**
 * $Id: mxEdgeStyle.js,v 1.36 2009/02/04 14:56:58 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxEdgeStyle
 * 
 * Provides various edge styles to be used as the values for
 * <mxConstants.STYLE_EDGE> in a cell style.
 *
 * Example:
 * 
 * (code)
 * var style = stylesheet.getDefaultEdgeStyle();
 * style[mxConstants.STYLE_EDGE] = mxEdgeStyle.ElbowConnector;
 * (end)
 * 
 * Sets the default edge style to <ElbowConnector>.
 * 
 * Custom edge style:
 * 
 * To write a custom edge style, a function must be added to the mxEdgeStyle
 * object as follows:
 * 
 * (code)
 * mxEdgeStyle.MyStyle = function(state, source, target, points, result)
 * {
 *   if (source != null && target != null)
 *   {
 *     var pt = new mxPoint(target.getCenterX(), source.getCenterY());
 * 
 *     if (mxUtils.contains(source, pt.x, pt.y))
 *     {
 *       pt.y = source.y + source.height;
 *     }
 * 
 *     result.push(pt);
 *   }
 * };
 * (end)
 * 
 * In the above example, a right angle is created using a point on the
 * horizontal center of the target vertex and the vertical center of the source
 * vertex. The code checks if that point intersects the source vertex and makes
 * the edge straight if it does. The point is then added into the result array,
 * which acts as the return value of the function.
 * 
 * The custom edge style above can be used in a specific edge as follows:
 * 
 * (code)
 * model.setStyle(edge, 'edgeStyle=mxEdgeStyle.MyStyle');
 * (end)
 * 
 * Or it can be used for all edges in the graph as follows:
 * 
 * (code)
 * var style = graph.getStylesheet().getDefaultEdgeStyle();
 * style[mxConstants.STYLE_EDGE] = mxEdgeStyle.MyStyle;
 * (end)
 */
var mxEdgeStyle =
{

	/**
	 * Function: EntityRelation
	 * 
	 * Implements an entity relation style for edges (as used in database
	 * schema diagrams). At the time the function is called, the result
	 * array contains a placeholder (null) for the first absolute point,
	 * that is, the point where the edge and source terminal are connected.
	 * The implementation of the style then adds all intermediate waypoints
	 * except for the last point, that is, the connection point between the
	 * edge and the target terminal. The first ant the last point in the
	 * result array are then replaced with mxPoints that take into account
	 * the terminal's perimeter and next point on the edge.
	 *
	 * Parameters:
	 * 
	 * state - <mxCellState> that represents the edge to be updated.
	 * source - <mxCellState> that represents the source terminal.
	 * target - <mxCellState> that represents the target terminal.
	 * points - List of relative control points.
	 * result - Array of <mxPoints> that represent the actual points of the
	 * edge.
	 */
	 EntityRelation: function (state, source, target, points, result)
	 {
		var view = state.view;
	 	var graph = view.graph;
	 	
	 	var segment = mxUtils.getValue(state.style,
	 			mxConstants.STYLE_STARTSIZE, mxConstants.ENTITY_SEGMENT) *
	 			state.view.scale;
	 	var isSourceLeft = false;

		if (source != null)
		{	 	
		 	var sourceGeometry = graph.getCellGeometry(source.cell);
	
		 	if (sourceGeometry.relative)
		 	{
		 		isSourceLeft = sourceGeometry.x <= 0.5;
		 	}
		 	else if (target != null)
		 	{
		 		isSourceLeft = target.x + target.width < source.x;
		 	}
		}
		else
		{
			var tmp = state.absolutePoints[0];
			
			if (tmp == null)
			{
				return;
			}
			
			source = new mxCellState();
			source.x = tmp.x;
			source.y = tmp.y;
		}
	 	
	 	var isTargetLeft = true;
	 	
	 	if (target != null)
	 	{
		 	var targetGeometry = graph.getCellGeometry(target.cell);

		 	if (targetGeometry.relative)
		 	{
		 		isTargetLeft = targetGeometry.x <= 0.5;
		 	}
		 	else if (source != null)
		 	{
		 		isTargetLeft = source.x + source.width < target.x;
		 	}
	 	}
	 	else
		{
			var pts = state.absolutePoints;
			var tmp = pts[pts.length-1];
						
			if (tmp == null)
			{
				return;
			}
			
			target = new mxCellState();
			target.x = tmp.x;
			target.y = tmp.y;
		}
	 	
		var x0 = (isSourceLeft) ? source.x : source.x + source.width;
		var y0 = view.getRoutingCenterY(source);
		
		var xe = (isTargetLeft) ? target.x : target.x + target.width;
		var ye = view.getRoutingCenterY(target);

		var seg = segment;

		var dx = (isSourceLeft) ? -seg : seg;
		var dep = new mxPoint(x0 + dx, y0);
		//result.push(dep);
				
		dx = (isTargetLeft) ? -seg : seg;
		var arr = new mxPoint(xe + dx, ye);

		// Adds intermediate points if both go out on same side
		if (isSourceLeft == isTargetLeft)
		{
			var x = (isSourceLeft) ?
				Math.min(x0, xe)-segment :
				Math.max(x0, xe)+segment;

			result.push(new mxPoint(x, y0));
			result.push(new mxPoint(x, ye));
		}
		else if ((dep.x < arr.x) == isSourceLeft)
		{
			var midY = y0 + (ye - y0) / 2;

			result.push(dep);
			result.push(new mxPoint(dep.x, midY));
			result.push(new mxPoint(arr.x, midY));
			result.push(arr);
		}
		else
		{
			result.push(dep);
			result.push(arr);
		}
	 },

	/**
	 * Function: Loop
	 * 
	 * Implements a self-reference, aka. loop.
	 */
	Loop: function (state, source, target, points, result)
	{
		var view = state.view;
		var graph = view.graph;
		var pt = (points != null) ? points[0] : null;
				
		var s = view.scale;
		
		if (pt != null)
		{
			pt = new mxPoint(
				s * (view.translate.x + pt.x + state.origin.x),
				s * (view.translate.y + pt.y + state.origin.y));
				
			if (mxUtils.contains(source, pt.x, pt.y))
			{
				pt = null;
			}
		}

		var x = 0;
		var dx = 0;
		var y = view.getRoutingCenterY(source);
		var dy = s * graph.gridSize;
		
		if (pt == null ||
			pt.x < source.x ||
			pt.x > source.x + source.width)
		{
			if (pt != null)
			{
				x = pt.x;
				dy = Math.max(Math.abs(y - pt.y), dy);
			}
			else
			{
				x = source.x + source.width + 2 * dy;
			}
		}
		else if (pt != null)
		{
			x = view.getRoutingCenterX(source);
			dx = Math.max(Math.abs(x - pt.x), dy);
			y = pt.y;
			dy = 0;
		}
		
		result.push(new mxPoint(x - dx, y - dy));
		result.push(new mxPoint(x + dx, y + dy));
	},
	
	/**
	 * Function: ElbowConnector
	 * 
	 * Uses either <SideToSide> or <TopToBottom> depending on the horizontal
	 * flag in the cell style. <SideToSide> is used if horizontal is true or
	 * unspecified. See <EntityRelation> for a description of the
	 * parameters.
	 */
	ElbowConnector: function (state, source, target, points, result)
	{
		var pt = (points != null) ? points[0] : null;

		var vertical = false;
		var horizontal = false;
		
		if (source != null && target != null)
		{
			if (pt != null)
			{
				var left = Math.min(source.x, target.x);
				var right = Math.max(source.x + source.width,
					target.x + target.width);
	
				var top = Math.min(source.y, target.y);
				var bottom = Math.max(source.y + source.height,
					target.y + target.height);
	
				var view = state.view;
				pt = new mxPoint(
					view.scale * (view.translate.x + pt.x + state.origin.x),
					view.scale * (view.translate.y + pt.y + state.origin.y));
					
				vertical = pt.y < top || pt.y > bottom;
				horizontal = pt.x < left || pt.x > right;
			}
			else
			{
				var left = Math.max(source.x, target.x);
				var right = Math.min(source.x + source.width,
					target.x + target.width);
					
				vertical = left == right;
				
				if (!vertical)
				{
					var top = Math.max(source.y, target.y);
					var bottom = Math.min(source.y + source.height,
						target.y + target.height);
						
					horizontal = top == bottom;
				}
			}
		}

		if (!horizontal && (vertical ||
			state.style[mxConstants.STYLE_ELBOW] == mxConstants.ELBOW_VERTICAL))
		{
			mxEdgeStyle.TopToBottom(state, source, target, points, result);
		}
		else
		{
			mxEdgeStyle.SideToSide(state, source, target, points, result);
		}
	},

	/**
	 * Function: SideToSide
	 * 
	 * Implements a vertical elbow edge. See <EntityRelation> for a description
	 * of the parameters.
	 */
	SideToSide: function (state, source, target, points, result)
	{
		var view = state.view;
		var pt = (points != null) ? points[0] : null;
		
		if (pt != null)
		{
			pt = new mxPoint(
				view.scale * (view.translate.x + pt.x + state.origin.x),
				view.scale * (view.translate.y + pt.y + state.origin.y));
		}
		
		if (source == null)
		{
			var tmp = state.absolutePoints[0];
			
			if (tmp == null)
			{
				return;
			}
			
			source = new mxCellState();
			source.x = tmp.x;
			source.y = tmp.y;
		}
		
		if (target == null)
		{
			var pts = state.absolutePoints;
			var tmp = pts[pts.length-1];
			
			if (tmp == null)
			{
				return;
			}
			
			target = new mxCellState();
			target.x = tmp.x;
			target.y = tmp.y;
		}
		
		var l = Math.max(source.x, target.x);
		var r = Math.min(source.x + source.width,
						 target.x + target.width);

		var x = (pt != null) ? pt.x : r + (l-r)/2;
		
		var y1 = view.getRoutingCenterY(source);
		var y2 = view.getRoutingCenterY(target);
		
		if (pt != null)
		{
			if (pt.y >= source.y &&
				pt.y <= source.y + source.height)
			{
				y1 = pt.y;
			}
			
			if (pt.y >= target.y &&
				pt.y <= target.y + target.height)
			{
				y2 = pt.y;
			}
		}
		
		if (!mxUtils.contains(target, x, y1) &&
			!mxUtils.contains(source, x, y1))
		{
			result.push(new mxPoint(x,  y1));
		}

		if (!mxUtils.contains(target, x, y2) &&
			!mxUtils.contains(source, x, y2))
		{
			result.push(new mxPoint(x, y2));
		}

		if (result.length == 1)
		{
			if (pt != null)
			{
				if (!mxUtils.contains(target, x, pt.y) &&
					!mxUtils.contains(source, x, pt.y))
				{
					result.push(new mxPoint(x, pt.y));
				}
			}
			else
			{	
				var t = Math.max(source.y, target.y);
				var b = Math.min(source.y + source.height,
						 target.y + target.height);
					 
				result.push(new mxPoint(x, t + (b - t) / 2));
			}
		}
	},

	/**
	 * Function: TopToBottom
	 * 
	 * Implements a horizontal elbow edge. See <EntityRelation> for a
	 * description of the parameters.
	 */
	TopToBottom: function(state, source, target, points, result)
	{
		var view = state.view;
		var pt = (points != null) ? points[0] : null;

		if (pt != null)
		{
			pt = new mxPoint(
				view.scale * (view.translate.x + pt.x + state.origin.x),
				view.scale * (view.translate.y + pt.y + state.origin.y));
		}
		
		if (source == null)
		{
			var tmp = state.absolutePoints[0];
			
			if (tmp == null)
			{
				return;
			}
			
			source = new mxCellState();
			source.x = tmp.x;
			source.y = tmp.y;
		}
		
		if (target == null)
		{
			var pts = state.absolutePoints;
			var tmp = pts[pts.length-1];
			
			if (tmp == null)
			{
				return;
			}
			
			target = new mxCellState();
			target.x = tmp.x;
			target.y = tmp.y;
		}

		var t = Math.max(source.y, target.y);
		var b = Math.min(source.y + source.height,
						 target.y + target.height);

		var x = view.getRoutingCenterX(source);
		
		if (pt != null &&
			pt.x >= source.x &&
			pt.x <= source.x + source.width)
		{
			x = pt.x;
		}
		
		var y = (pt != null) ? pt.y : b + (t-b)/2;
		
		if (!mxUtils.contains(target, x, y) &&
			!mxUtils.contains(source, x, y))
		{
			result.push(new mxPoint(x, y));						
		}
		
		if (pt != null &&
			pt.x >= target.x &&
			pt.x <= target.x + target.width)
		{
			x = pt.x;
		}
		else
		{
			x = view.getRoutingCenterX(target);
		}
		
		if (!mxUtils.contains(target, x, y) &&
			!mxUtils.contains(source, x, y))
		{
			result.push(new mxPoint(x, y));						
		}
		
		if (result.length == 1)
		{
			if (pt != null && result.length == 1)
			{
				if (!mxUtils.contains(target, pt.x, y) &&
					!mxUtils.contains(source, pt.x, y))
				{
					result.push(new mxPoint(pt.x, y));
				}
			}
			else
			{
				var l = Math.max(source.x, target.x);
				var r = Math.min(source.x + source.width,
						 target.x + target.width);
					 
				result.push(new mxPoint(l + (r - l) / 2, y));
			}
		}
	}

};
