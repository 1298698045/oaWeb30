/**
 * $Id: mxHierarchicalLayout.js,v 1.10 2008/10/02 14:27:54 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxHierarchicalLayout
 * 
 * A hierarchical layout algorithm.
 */
{

	/**
	 * Constructor: mxHierarchicalLayout
	 *
	 * Constructs a new hierarchical layout algorithm.
	 *
	 * Arguments:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 * deterministic - Optional boolean that specifies if this layout should be
	 * deterministic. Default is true.
	 */
	function mxHierarchicalLayout(graph, deterministic)
	{
		mxGraphLayout.call(this, graph);
		this.deterministic = (deterministic != null) ? deterministic : true;
	};
	
	/**
	 * Extends mxGraphLayout.
	 */
	mxHierarchicalLayout.prototype = new mxGraphLayout();
	mxHierarchicalLayout.prototype.constructor = mxHierarchicalLayout;

	/**
	 * Variable: INITIAL_X_POSITION
	 * 
	 * Default is 100.
	 */
	mxHierarchicalLayout.prototype.INITIAL_X_POSITION = 100;

	/**
	 * Variable: roots
	 * 
	 * Holds the array of <mxGraphLayouts> that this layout contains.
	 */
	mxHierarchicalLayout.prototype.roots = null;

	/**
	 * Variable: intraCellSpacing
	 * 
	 * The spacing buffer added between cells on the same layer. Default is 30.
	 */
	mxHierarchicalLayout.prototype.intraCellSpacing = 30;

	/**
	 * Variable: interRankCellSpacing
	 * 
	 * The spacing buffer added between cell on adjacent layers. Default is 50.
	 */
	mxHierarchicalLayout.prototype.interRankCellSpacing = 50;

	/**
	 * Variable: interHierarchySpacing
	 * 
	 * The spacing buffer between unconnected hierarchies. Default is 60.
	 */
	mxHierarchicalLayout.prototype.interHierarchySpacing = 60;

	/**
	 * Variable: parallelEdgeSpacing
	 * 
	 * The distance between each parallel edge on each ranks for long edges
	 */
	mxHierarchicalLayout.prototype.parallelEdgeSpacing = 10;

	/**
	 * Variable: orientation
	 * 
	 * The position of the root node(s) relative to the laid out graph in.
	 * Default is <mxConstants.DIRECTION_NORTH>.
	 */
	mxHierarchicalLayout.prototype.orientation = mxConstants.DIRECTION_NORTH;

	/**
	 * Variable: fineTuning
	 * 
	 * Whether or not to perform local optimisations and iterate multiple times
	 * through the algorithm. Default is true.
	 */
	mxHierarchicalLayout.prototype.fineTuning = true;

	/**
	 * Variable: deterministic
	 * 
	 * Whether or not cells are ordered according to the order in the graph
	 * model. Defaults to false since sorting usually produces quadratic
	 * performance. Note that since mxGraph returns edges in a deterministic
	 * order, it might be that this layout is always deterministic using that
	 * JGraph regardless of this flag setting (i.e. leave it false in that
	 * case). Default is true.
	 */
	mxHierarchicalLayout.prototype.deterministic;

	/**
	 * Variable: fixRoots
	 * 
	 * Whether or not to fix the position of the root cells. Keep in mind to
	 * turn off features such as move to origin when fixing the roots, move
	 * to origin usually overrides this flag (in JGraph it does). Default is
	 * false.
	 */
	mxHierarchicalLayout.prototype.fixRoots = false;

	/**
	 * Variable: model
	 * 
	 * The internal <mxGraphHierarchyModel> formed of the layout.
	 */
	mxHierarchicalLayout.prototype.model = null;

	/**
	 * Function: getModel
	 * 
	 * Returns the internal <mxGraphHierarchyModel> for this layout algorithm.
	 */
	mxHierarchicalLayout.prototype.getModel = function()
	{
		return this.model;
	};

	/**
	 * Function: execute
	 * 
	 * Executes the layout for the children of the specified parent.
	 * 
	 * Parameters:
	 * 
	 * parent - Parent <mxCell> that contains the children to be laid out.
	 * roots - Optional starting roots of the layout.
	 */
	mxHierarchicalLayout.prototype.execute = function(parent, roots)
	{
		if (roots == null)
		{
			roots = this.graph.findTreeRoots(parent);
		}
		
		this.roots = roots;
		
		if (this.roots != null)
		{
			var model = this.graph.getModel();
	
			model.beginUpdate();
			try
			{
				this.run(parent);
			}
			finally
			{
				model.endUpdate();
			}
		}
	};

	/**
	 * Function: run
	 * 
	 * The API method used to exercise the layout upon the graph description
	 * and produce a separate description of the vertex position and edge
	 * routing changes made. It runs each stage of the layout that has been
	 * created.
	 */
	mxHierarchicalLayout.prototype.run = function(parent)
	{
		// Separate out unconnected hierarchies
		var hierarchyVertices = new Array();
		
		// Keep track of one root in each hierarchy in case it's fixed position
		var fixedRoots = null;
		var rootLocations = null;
		var affectedEdges = null;

		if (this.fixRoots)
		{
			fixedRoots = new Array();
			rootLocations = new Array();
			affectedEdges = new Array();
		}

		for (var i = 0; i < this.roots.length; i++)
		{
			// First check if this root appears in any of the previous vertex
			// sets
			var newHierarchy = true;
			
			for (var j = 0; newHierarchy && j < hierarchyVertices.length; j++)
			{
				var rootId = mxCellPath.create(this.roots[i]);
				
				if (hierarchyVertices[j][rootId] != null)
				{
					newHierarchy = false;
				}
			}

			if (newHierarchy)
			{
				// Obtains set of vertices connected to this root
				var cellsStack = new Array();
				cellsStack.push(this.roots[i]);
				var edgeSet = null;

				if (this.fixRoots)
				{
					fixedRoots.push(this.roots[i]);
					var location = this.getVertexBounds(this.roots[i]).getPoint();
					rootLocations.push(location);
					edgeSet = new Array();
				}

				var vertexSet = new Object();

				while (cellsStack.length > 0)
				{
					var cell = cellsStack.shift();
					var cellId = mxCellPath.create(cell);

					if (vertexSet[cellId] == null)
					{
						vertexSet[cellId] = cell;

						if (this.fixRoots)
						{
							var tmp = this.graph.getIncomingEdges(cell, parent);
							
							for (var k = 0; k < tmp.length; k++)
							{
								edgeSet.push(tmp[k]);
							}
						}

						var conns = this.graph.getConnections(cell, parent);
						var cells = this.graph.getOpposites(conns, cell);

						for (var k = 0; k < cells.length; k++)
						{
							var tmpId = mxCellPath.create(cells[k]);
							
							if (vertexSet[tmpId] == null)
							{
								cellsStack.push(cells[k]);
							}
						}
					}
				}

				hierarchyVertices.push(vertexSet);

				if (this.fixRoots)
				{
					affectedEdges.push(edgeSet);
				}
			}
		}

		// Perform a layout for each seperate hierarchy
		// Track initial coordinate x-positioning
		var initialX = this.INITIAL_X_POSITION;

		for (var i = 0; i < hierarchyVertices.length; i++)
		{
			var vertexSet = hierarchyVertices[i];
			var tmp = new Array();
			
			for (var key in vertexSet)
			{
				tmp.push(vertexSet[key]);
			}
			
			this.model = new mxGraphHierarchyModel(this, tmp, this.roots,
				parent, false, this.deterministic);

			this.cycleStage(parent);
			this.layeringStage();
			
			this.crossingStage(parent);
			initialX = this.placementStage(initialX, parent);
			
			if (this.fixRoots)
			{
				// Reposition roots and their hierarchies using their bounds
				// stored earlier
				var root = fixedRoots[i];
				var oldLocation = rootLocations[i];
				var newLocation = this.getVertexBounds(root).getPoint();

				var diffX = oldLocation.x - newLocation.x;
				var diffY = oldLocation.y - newLocation.y;
				this.graph.move(vertexSet, diffX, diffY);

				// Also translate connected edges
				var connectedEdges = affectedEdges[i+1];
				this.graph.move(connectedEdges, diffX, diffY);
			}
		}
	};

	/**
	 * Function: cycleStage
	 * 
	 * Executes the cycle stage using mxMinimumCycleRemover.
	 */
	mxHierarchicalLayout.prototype.cycleStage = function(parent)
	{
		var cycleStage = new mxMinimumCycleRemover(this);
		cycleStage.execute(parent);
	};

	/**
	 * Function: layeringStage
	 * 
	 * Implements first stage of a Sugiyama layout.
	 */
	mxHierarchicalLayout.prototype.layeringStage = function()
	{
		this.model.initialRank(true);
		this.model.fixRanks();
	};
	
	/**
	 * Function: crossingStage
	 * 
	 * Executes the crossing stage using mxMedianHybridCrossingReduction.
	 */
	mxHierarchicalLayout.prototype.crossingStage = function(parent)
	{
		var crossingStage = new mxMedianHybridCrossingReduction(this);
		crossingStage.execute(parent);
	};
	
	/**
	 * Function: placementStage
	 * 
	 * Executes the placement stage using mxCoordinateAssignment.
	 */
	mxHierarchicalLayout.prototype.placementStage = function(initialX, parent)
	{
		var placementStage = new mxCoordinateAssignment(this, this.intraCellSpacing,
				this.interRankCellSpacing, this.orientation, initialX,
				this.parallelEdgeSpacing);
		placementStage.fineTuning = this.fineTuning;
		placementStage.execute(parent);
		
		return placementStage.limitX + this.interHierarchySpacing;
	};

}
