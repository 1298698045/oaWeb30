/**
 * $Id: mxStackLayout.js,v 1.32 2008/09/22 12:43:31 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxStackLayout
 * 
 * Extends <mxGraphLayout> to create a horizontal or vertical stack of the
 * child vertices. The children do not need to be connected for this layout
 * to work.
 * 
 * Example:
 * 
 * (code)
 * var layout = new mxStackLayout(graph, true, 0, 0, 0);
 * layout.execute(graph.getDefaultParent());
 * (end)
 */
{

	/**
	 * Constructor: mxStackLayout
	 * 
	 * Constructs a new stack layout layout for the specified graph,
	 * spacing, orientation and offset.
	 */
	function mxStackLayout(graph, horizontal, spacing, x0, y0)
	{
		mxGraphLayout.call(this, graph);
		this.horizontal = (horizontal != null) ? horizontal : true;
		this.spacing = (spacing != null) ? spacing : graph.gridSize;
		this.x0 = (x0 != null) ? x0 : this.spacing;
		this.y0 = (y0 != null) ? y0 : this.spacing;
	};
	
	/**
	 * Extends mxGraphLayout.
	 */
	mxStackLayout.prototype = new mxGraphLayout();
	mxStackLayout.prototype.constructor = mxStackLayout;
	
	/**
	 * Variable: horizontal
	 *
	 * Specifies the orientation of the layout. Default is true.
	 */
	mxStackLayout.prototype.horizontal = null;
	
	/**
	 * Variable: spacing
	 *
	 * Specifies the spacing between the cells. Default is gridSize.
	 */
	mxStackLayout.prototype.spacing = null;
	
	/**
	 * Variable: x0
	 *
	 * Specifies the horizontal origin of the layout. Default is spacing.
	 */
	mxStackLayout.prototype.x0 = null;
	
	/**
	 * Variable: y0
	 *
	 * Specifies the vertical origin of the layout. Default is spacing.
	 */
	mxStackLayout.prototype.y0 = null;

	/**
	 * Variable: fill
	 * 
	 * Boolean indicating if dimension should be changed to fill out the parent
	 * cell. Default is false.
	 */
	mxStackLayout.prototype.fill = false;
		
	/**
	 * Variable: resizeParent
	 * 
	 * If the parent should be resized to match the width/height of the
	 * stack. Default is false.
	 */
	mxStackLayout.prototype.resizeParent = false;
	
	/**
	 * Variable: wrap
	 * 
	 * Value at which a new column or row should be created. Default is null.
	 */
	mxStackLayout.prototype.wrap = null;

	/**
	 * Function: move
	 * 
	 * Implements <mxGraphLayout.move>.
	 */
	mxStackLayout.prototype.move = function(cell, x, y)
	{
		var model = this.graph.getModel();
		var parent = model.getParent(cell);
		
		if (cell != null &&
			parent != null)
		{
			var i = 0;
			var last = 0;
			var childCount = model.getChildCount(parent);
			var value = (this.horizontal) ? x : y;
			var pstate = this.graph.getView().getState(parent);

			if (pstate != null)
			{
				value -= (this.horizontal) ? pstate.x : pstate.y;
			}
			
			for (i = 0; i < childCount; i++)
			{
				var child = model.getChildAt(parent, i);
				
				if (child != cell)
				{
					var bounds = model.getGeometry(child);
					
					if (bounds != null)
					{
						var tmp = (this.horizontal) ?
							bounds.x + bounds.width / 2 :
							bounds.y + bounds.height / 2;
						
						if (last < value &&
							tmp > value)
						{
							break;
						}
						
						last = tmp;
					}
				}
			}

			// Changes child order in parent
			var idx = parent.getIndex(cell);
			idx = Math.max(0, i - ((i > idx) ? 1 : 0));

			model.add(parent, cell, idx);
		}
	};

	/**
	 * Function: execute
	 * 
	 * Implements <mxGraphLayout.execute>.
	 * 
	 * Only children where <isVertexIgnored> returns false are taken into
	 * account.
	 */
	mxStackLayout.prototype.execute = function(parent)
	{
		if (parent != null)
		{
			var x0 = this.x0 + 1;
			var y0 = this.y0;
			
			var model = this.graph.getModel();			
			var pgeo = model.getGeometry(parent);
			
			// Handles special case where the parent is either a layer with no
			// geometry or the current root of the view in which case the size
			// of the graph's container will be used.
			if (this.graph.container != null &&
				((pgeo == null &&
				model.isLayer(parent)) ||
				parent == this.graph.getView().currentRoot))
			{
				var width = this.graph.container.offsetWidth;
				var height = this.graph.container.offsetHeight;
				pgeo = new mxRectangle(0, 0, width, height);
			}
						
			var fillValue = 0;
			
			if (pgeo != null)
			{
				fillValue = (this.horizontal) ? pgeo.height : pgeo.width;
			}
			
			fillValue -= 2 * this.spacing;

			// Handles swimlane start size
			var size = this.graph.getStartSize(parent);
			
			fillValue -= (this.horizontal) ? size.height : size.width;
			x0 = this.x0 + size.width;
			y0 = this.y0 + size.height;

			model.beginUpdate();
			try
			{
				var tmp = 0;
				var last = null;
				var childCount = model.getChildCount(parent);
				
				for (var i = 0; i < childCount; i++)
				{
					var child = model.getChildAt(parent, i);
					
					if (!this.isVertexIgnored(child) &&
						this.isVertexMovable(child))
					{
						var geo = model.getGeometry(child);
						
						if (geo != null)
						{
							geo = geo.clone();
							
							if (this.wrap != null &&
								last != null)
							{
								
								if ((this.horizontal && last.x + last.width +
									geo.width + 2 * this.spacing > this.wrap) ||
									(!this.horizontal && last.y + last.height +
									geo.height + 2 * this.spacing > this.wrap))
								{
									last = null;
									
									if (this.horizontal)
									{
										y0 += tmp + this.spacing;
									}
									else
									{
										x0 += tmp + this.spacing;
									}
									
									tmp = 0;
								}	
							}
							
							tmp = Math.max(tmp, (this.horizontal) ? geo.height : geo.width);
							
							if (last != null)
							{
								if (this.horizontal)
								{
									geo.x = last.x + last.width + this.spacing;
								}
								else
								{
									geo.y = last.y + last.height + this.spacing;
								}
							}
							else
							{
								if (this.horizontal)
								{
									geo.x = x0;
								}
								else
								{
									geo.y = y0;
								}
							}
							
							if (this.horizontal)
							{
								geo.y = y0;
							}
							else
							{
								geo.x = x0;
							}
							
							if (this.fill &&
								fillValue > 0)
							{
								if (this.horizontal)
								{
									geo.height = fillValue;
								}
								else
								{
									geo.width = fillValue;									
								}								
							}
							
							model.setGeometry(child, geo);
							last = geo;
						}
					}
				}
				
				if (this.resizeParent &&
					pgeo != null &&
					last != null &&
					!this.graph.isCellCollapsed(parent))
				{
					pgeo = pgeo.clone();
					
					if (this.horizontal)
					{
						pgeo.width = last.x + last.width + this.spacing;
					}
					else
					{
						pgeo.height = last.y + last.height + this.spacing;
					}

					model.setGeometry(parent, pgeo);					
				}
			}
			finally
			{
				model.endUpdate();
			}
		}
	};

}
