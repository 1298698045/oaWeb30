/**
 * $Id: mxCoordinateAssignment.js,v 1.13 2008/10/15 11:42:44 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCoordinateAssignment
 * 
 * Sets the horizontal locations of node and edge dummy nodes on each layer.
 * Uses median down and up weighings as well heuristic to straighten edges as
 * far as possible.
 */
{

	/**
	 * Constructor: mxCoordinateAssignment
	 *
	 * Creates a coordinate assignment.
	 * 
	 * Arguments:
	 * 
	 * intraCellSpacing - the minimum buffer between cells on the same rank
	 * interRankCellSpacing - the minimum distance between cells on adjacent ranks
	 * orientation - the position of the root node(s) relative to the graph
	 * initialX - the leftmost coordinate node placement starts at
	 */
	function mxCoordinateAssignment(layout, intraCellSpacing, interRankCellSpacing,
		orientation, initialX, parallelEdgeSpacing)
	{
		this.layout = layout;
		this.intraCellSpacing = intraCellSpacing;
		this.interRankCellSpacing = interRankCellSpacing;
		this.orientation = orientation;
		this.initialX = initialX;
		this.parallelEdgeSpacing = parallelEdgeSpacing;
	};

	/**
	 * Extends mxHierarchicalLayoutStage.
	 */
	mxCoordinateAssignment.prototype = new mxHierarchicalLayoutStage();
	mxCoordinateAssignment.prototype.constructor = mxCoordinateAssignment;

	/**
	 * Variable: layout
	 * 
	 * Reference to the enclosing <mxHierarchicalLayout>.
	 */
	mxCoordinateAssignment.prototype.layout = null;

	/**
	 * Variable: intraCellSpacing
	 * 
	 * The minimum buffer between cells on the same rank. Default is 30.
	 */
	mxCoordinateAssignment.prototype.intraCellSpacing = 30;

	/**
	 * Variable: interRankCellSpacing
	 * 
	 * The minimum distance between cells on adjacent ranks. Default is 10.
	 */
	mxCoordinateAssignment.prototype.interRankCellSpacing = 10;

	/**
	 * Variable: parallelEdgeSpacing
	 * 
	 * The distance between each parallel edge on each ranks for long edges.
	 * Default is 10.
	 */
	mxCoordinateAssignment.prototype.parallelEdgeSpacing = 10;

	/**
	 * Variable: maxIterations
	 * 
	 * The number of heuristic iterations to run. Default is 8.
	 */
	mxCoordinateAssignment.prototype.maxIterations = 8;

	/**
	 * Variable: orientation
	 * 
	 * The position of the root ( start ) node(s) relative to the rest of the
	 * laid out graph. Default is <mxConstants.DIRECTION_NORTH>.
	 */
	mxCoordinateAssignment.prototype.orientation = mxConstants.DIRECTION_NORTH;

	/**
	 * Variable: initialX
	 * 
	 * The minimum x position node placement starts at
	 */
	mxCoordinateAssignment.prototype.initialX = null;

	/**
	 * Variable: limitX
	 * 
	 * The maximum x value this positioning lays up to
	 */
	mxCoordinateAssignment.prototype.limitX = null;

	/**
	 * Variable: currentXDelta
	 * 
	 * The sum of x-displacements for the current iteration
	 */
	mxCoordinateAssignment.prototype.currentXDelta = null;

	/**
	 * Variable: widestRank
	 * 
	 * The rank that has the widest x position
	 */
	mxCoordinateAssignment.prototype.widestRank = null;

	/**
	 * Variable: widestRankValue
	 * 
	 * The X-coordinate of the edge of the widest rank
	 */
	mxCoordinateAssignment.prototype.widestRankValue = null;

	/**
	 * Variable: rankWidths
	 * 
	 * The width of all the ranks
	 */
	mxCoordinateAssignment.prototype.rankWidths = null;

	/**
	 * Variable: rankY
	 * 
	 * The Y-coordinate of all the ranks
	 */
	mxCoordinateAssignment.prototype.rankY = null;

	/**
	 * Variable: fineTuning
	 * 
	 * Whether or not to perform local optimisations and iterate multiple times
	 * through the algorithm. Default is true.
	 */
	mxCoordinateAssignment.prototype.fineTuning = true;

	/**
	 * Variable: disableEdgeStyle
	 * 
	 * Specifies if the STYLE_NOEDGESTYLE flag should be set on edges that are
	 * modified by the result. Default is true.
	 */
	mxCoordinateAssignment.prototype.disableEdgeStyle = true;
	
	/**
	 * Variable: nextLayerConnectedCache
	 * 
	 * A store of connections to the layer above for speed
	 */
	mxCoordinateAssignment.prototype.nextLayerConnectedCache = null;

	/**
	 * Variable: previousLayerConnectedCache
	 * 
	 * A store of connections to the layer below for speed
	 */
	mxCoordinateAssignment.prototype.previousLayerConnectedCache = null;

	/**
	 * Function: execute
	 * 
	 * A basic horizontal coordinate assignment algorithm
	 */
	mxCoordinateAssignment.prototype.execute = function(parent)
	{
		var model = this.layout.getModel();
		this.currentXDelta = 0.0;

		this.initialCoords(this.layout.getGraph(), model);
		
		if (this.fineTuning)
		{
			this.minNode(model);
		}
		
		var bestXDelta = 100000000.0;
		
		if (this.fineTuning)
		{
			for (var i = 0; i < this.maxIterations; i++)
			{
				// Median Heuristic
				if (i != 0)
				{
					this.medianPos(i, model);
					this.minNode(model);
				}
				
				// if the total offset is less for the current positioning,
				// there are less heavily angled edges and so the current
				// positioning is used
				if (this.currentXDelta < bestXDelta)
				{
					for (var j = 0; j < model.ranks.length; j++)
					{
						var rank = model.ranks[j];
						
						for (var k = 0; k < rank.length; k++)
						{
							var cell = rank[k];
							cell.setX(j, cell.getGeneralPurposeVariable(j));
						}
					}
					
					bestXDelta = this.currentXDelta;
				}
				else
				{
					// Restore the best positions
					for (var j = 0; j < model.ranks.length; j++)
					{
						var rank = model.ranks[j];
						
						for (var k = 0; k < rank.length; k++)
						{
							var cell = rank[k];
							cell.setGeneralPurposeVariable(j, cell.getX(j));
						}
					}
				}
				
				this.currentXDelta = 0;
			}
		}
		
		this.setCellLocations(this.layout.getGraph(), model);
	};

	/**
	 * Function: minNode
	 * 
	 * Performs one median positioning sweep in both directions
	 */
	mxCoordinateAssignment.prototype.minNode = function(model)
	{
		// Queue all nodes
		var nodeList = new Array();
		
		// Need to be able to map from cell to cellWrapper
		var map = new Array();
		var rank = new Array();
		
		for (var i = 0; i <= model.maxRank; i++)
		{
			rank[i] = model.ranks[i];
			
			for (var j = 0; j < rank[i].length; j++)
			{
				// Use the weight to store the rank and visited to store whether
				// or not the cell is in the list
				var node = rank[i][j];
				var nodeWrapper = new WeightedCellSorter(node, i);
				nodeWrapper.rankIndex = j;
				nodeWrapper.visited = true;
				nodeList.push(nodeWrapper);
				
				var cellId = mxCellPath.create(node.cell);
				map[cellId] = nodeWrapper;
			}
		}
		
		// Set a limit of the maximum number of times we will access the queue
		// in case a loop appears
		var maxTries = nodeList.length * 10;
		var count = 0;
		
		// Don't move cell within this value of their median
		var tolerance = 1;
		
		while (nodeList.length > 0 && count <= maxTries)
		{
			var cellWrapper = nodeList.shift();
			var cell = cellWrapper.cell;
			
			var rankValue = cellWrapper.weightedValue;
			var rankIndex = parseInt(cellWrapper.rankIndex);
			
			var nextLayerConnectedCells = cell.getNextLayerConnectedCells(rankValue);
			var previousLayerConnectedCells = cell.getPreviousLayerConnectedCells(rankValue);
			
			var numNextLayerConnected = nextLayerConnectedCells.length;
			var numPreviousLayerConnected = previousLayerConnectedCells.length;

			var medianNextLevel = this.medianXValue(nextLayerConnectedCells,
					rankValue + 1);
			var medianPreviousLevel = this.medianXValue(previousLayerConnectedCells,
					rankValue - 1);

			var numConnectedNeighbours = numNextLayerConnected
					+ numPreviousLayerConnected;
			var currentPosition = cell.getGeneralPurposeVariable(rankValue);
			var cellMedian = currentPosition;
			
			if (numConnectedNeighbours > 0)
			{
				cellMedian = (medianNextLevel * numNextLayerConnected + medianPreviousLevel
						* numPreviousLayerConnected)
						/ numConnectedNeighbours;
			}

			// Flag storing whether or not position has changed
			var positionChanged = false;
			
			if (cellMedian < currentPosition - tolerance)
			{
				if (rankIndex == 0)
				{
					cell.setGeneralPurposeVariable(rankValue, cellMedian);
					positionChanged = true;
				}
				else
				{
					var leftCell = rank[rankValue][rankIndex - 1];
					var leftLimit = leftCell
							.getGeneralPurposeVariable(rankValue);
					leftLimit = leftLimit + leftCell.width / 2
							+ this.intraCellSpacing + cell.width / 2;

					if (leftLimit < cellMedian)
					{
						cell.setGeneralPurposeVariable(rankValue, cellMedian);
						positionChanged = true;
					}
					else if (leftLimit < cell
							.getGeneralPurposeVariable(rankValue)
							- tolerance)
					{
						cell.setGeneralPurposeVariable(rankValue, leftLimit);
						positionChanged = true;
					}
				}
			}
			else if (cellMedian > currentPosition + tolerance)
			{
				var rankSize = rank[rankValue].length;
				
				if (rankIndex == rankSize - 1)
				{
					cell.setGeneralPurposeVariable(rankValue, cellMedian);
					positionChanged = true;
				}
				else
				{
					var rightCell = rank[rankValue][rankIndex + 1];
					var rightLimit = rightCell
							.getGeneralPurposeVariable(rankValue);
					rightLimit = rightLimit - rightCell.width / 2
							- this.intraCellSpacing - cell.width / 2;
					
					if (rightLimit > cellMedian)
					{
						cell.setGeneralPurposeVariable(rankValue, cellMedian);
						positionChanged = true;
					}
					else if (rightLimit > cell
							.getGeneralPurposeVariable(rankValue)
							+ tolerance)
					{
						cell.setGeneralPurposeVariable(rankValue, rightLimit);
						positionChanged = true;
					}
				}
			}
			
			if (positionChanged)
			{
				// Add connected nodes to map and list
				for (var i = 0; i < nextLayerConnectedCells.length; i++)
				{
					var connectedCell = nextLayerConnectedCells[i];
					var connectedCellId = mxCellPath.create(connectedCell.cell);
					var connectedCellWrapper = map[connectedCellId];
					
					if (connectedCellWrapper != null)
					{
						if (connectedCellWrapper.visited == false)
						{
							connectedCellWrapper.visited = true;
							nodeList.push(connectedCellWrapper);
						}
					}
				}

				// Add connected nodes to map and list
				for (var i = 0; i < previousLayerConnectedCells.length; i++)
				{
					var connectedCell = previousLayerConnectedCells[i];
					var connectedCellId = mxCellPath.create(connectedCell.cell);
					var connectedCellWrapper = map[connectedCellId];
					
					if (connectedCellWrapper != null)
					{
						if (connectedCellWrapper.visited == false)
						{
							connectedCellWrapper.visited = true;
							nodeList.push(connectedCellWrapper);
						}
					}
				}
			}
			
			cellWrapper.visited = false;
			count++;
		}
	};

	/**
	 * Function: medianPos
	 * 
	 * Performs one median positioning sweep in one direction
	 * 
	 * Parameters:
	 * 
	 * i - the iteration of the whole process
	 * model - an internal model of the hierarchical layout
	 */
	mxCoordinateAssignment.prototype.medianPos = function(i, model)
	{
		// Reverse sweep direction each time through this method
		var downwardSweep = (i % 2 == 0);
		
		if (downwardSweep)
		{
			for (var j = model.maxRank; j > 0; j--)
			{
				this.rankMedianPosition(j - 1, model, j);
			}
		}
		else
		{
			for (var j = 0; j < model.maxRank - 1; j++)
			{
				this.rankMedianPosition(j + 1, model, j);
			}
		}
	};

	/**
	 * Function: rankMedianPosition
	 * 
	 * Performs median minimisation over one rank.
	 * 
	 * Parameters:
	 * 
	 * rankValue - the layer number of this rank
	 * model - an internal model of the hierarchical layout
	 * nextRankValue - the layer number whose connected cels are to be laid out
	 * relative to
	 */
	mxCoordinateAssignment.prototype.rankMedianPosition = function(rankValue, model, nextRankValue)
	{
		var rank = model.ranks[rankValue];

		// Form an array of the order in which the cell are to be processed
		// , the order is given by the weighted sum of the in or out edges,
		// depending on whether we're travelling up or down the hierarchy.
		var weightedValues = new Array();
		var cellMap = new Array();

		for (var i = 0; i < rank.length; i++)
		{
			var currentCell = rank[i];
			weightedValues[i] = new WeightedCellSorter();
			weightedValues[i].cell = currentCell;
			weightedValues[i].rankIndex = i;
			var currentCellId = mxCellPath.create(currentCell.cell);
			cellMap[currentCellId] = weightedValues[i];
			var nextLayerConnectedCells = null;
			
			if (nextRankValue < rankValue)
			{
				nextLayerConnectedCells = currentCell
						.getPreviousLayerConnectedCells(rankValue);
			}
			else
			{
				nextLayerConnectedCells = currentCell
						.getNextLayerConnectedCells(rankValue);
			}

			// Calcuate the weighing based on this node type and those this
			// node is connected to on the next layer
			weightedValues[i].weightedValue = this.calculatedWeightedValue(
					currentCell, nextLayerConnectedCells);
		}

		weightedValues.sort(WeightedCellSorter.prototype.compare);

		// Set the new position of each node within the rank using
		// its temp variable
		
		for (var i = 0; i < weightedValues.length; i++)
		{
			var numConnectionsNextLevel = 0;
			var cell = weightedValues[i].cell;
			var nextLayerConnectedCells = null;
			var medianNextLevel = 0;

			if (nextRankValue < rankValue)
			{
				nextLayerConnectedCells = cell.getPreviousLayerConnectedCells(
						rankValue).slice();
			}
			else
			{
				nextLayerConnectedCells = cell.getNextLayerConnectedCells(
						rankValue).slice();
			}

			if (nextLayerConnectedCells != null)
			{
				numConnectionsNextLevel = nextLayerConnectedCells.length;
				
				if (numConnectionsNextLevel > 0)
				{
					medianNextLevel = this.medianXValue(nextLayerConnectedCells,
							nextRankValue);
				}
				else
				{
					// For case of no connections on the next level set the
					// median to be the current position and try to be
					// positioned there
					medianNextLevel = cell.getGeneralPurposeVariable(rankValue);
				}
			}

			var leftBuffer = 0.0;
			var leftLimit = -100000000.0;
			
			for (var j = weightedValues[i].rankIndex - 1; j >= 0;)
			{
				var rankId = mxCellPath.create(rank[j].cell);
				var weightedValue = cellMap[rankId];
				
				if (weightedValue != null)
				{
					var leftCell = weightedValue.cell;
					
					if (weightedValue.visited)
					{
						// The left limit is the right hand limit of that
						// cell plus any allowance for unallocated cells
						// in-between
						leftLimit = leftCell
								.getGeneralPurposeVariable(rankValue)
								+ leftCell.width
								/ 2.0
								+ this.intraCellSpacing
								+ leftBuffer + cell.width / 2.0;
						j = -1;
					}
					else
					{
						leftBuffer += leftCell.width + this.intraCellSpacing;
						j--;
					}
				}
			}

			var rightBuffer = 0.0;
			var rightLimit = 100000000.0;
			
			for (var j = weightedValues[i].rankIndex + 1; j < weightedValues.length;)
			{
				var rankId = mxCellPath.create(rank[j].cell);
				var weightedValue = cellMap[rankId];
				
				if (weightedValue != null)
				{
					var rightCell = weightedValue.cell;
					
					if (weightedValue.visited)
					{
						// The left limit is the right hand limit of that
						// cell plus any allowance for unallocated cells
						// in-between
						rightLimit = rightCell
								.getGeneralPurposeVariable(rankValue)
								- rightCell.width
								/ 2.0
								- this.intraCellSpacing
								- rightBuffer - cell.width / 2.0;
						j = weightedValues.length;
					}
					else
					{
						rightBuffer += rightCell.width + this.intraCellSpacing;
						j++;
					}
				}
			}
			
			if (medianNextLevel >= leftLimit && medianNextLevel <= rightLimit)
			{
				cell.setGeneralPurposeVariable(rankValue, medianNextLevel);
			}
			else if (medianNextLevel < leftLimit)
			{
				// Couldn't place at median value, place as close to that
				// value as possible
				cell.setGeneralPurposeVariable(rankValue, leftLimit);
				this.currentXDelta += leftLimit - medianNextLevel;
			}
			else if (medianNextLevel > rightLimit)
			{
				// Couldn't place at median value, place as close to that
				// value as possible
				cell.setGeneralPurposeVariable(rankValue, rightLimit);
				this.currentXDelta += medianNextLevel - rightLimit;
			}

			weightedValues[i].visited = true;
		}
	};

	/**
	 * Function: calculatedWeightedValue
	 * 
	 * Calculates the priority the specified cell has based on the type of its
	 * cell and the cells it is connected to on the next layer
	 * 
	 * Parameters:
	 * 
	 * currentCell - the cell whose weight is to be calculated
	 * collection - the cells the specified cell is connected to
	 */
	mxCoordinateAssignment.prototype.calculatedWeightedValue = function(currentCell, collection)
	{
		var totalWeight = 0;
		
		for (var i = 0; i < collection.length; i++)
		{
			var cell = collection[i];

			if (currentCell.isVertex() && cell.isVertex())
			{
				totalWeight++;
			}
			else if (currentCell.isEdge() && cell.isEdge())
			{
				totalWeight += 8;
			}
			else
			{
				totalWeight += 2;
			}
		}

		return totalWeight;
	};

	/**
	 * Function: medianXValue
	 * 
	 * Calculates the median position of the connected cell on the specified
	 * rank
	 * 
	 * Parameters:
	 * 
	 * connectedCells - the cells the candidate connects to on this level
	 * rankValue - the layer number of this rank
	 */
	mxCoordinateAssignment.prototype.medianXValue = function(connectedCells, rankValue)
	{
		if (connectedCells.length == 0)
		{
			return 0;
		}

		var medianValues = new Array();

		for (var i = 0; i < connectedCells.length; i++)
		{
			medianValues[i] = connectedCells[i].getGeneralPurposeVariable(rankValue);
		}

		medianValues.sort(MedianCellSorter.prototype.compare);
		
		if (connectedCells.length % 2 == 1)
		{
			// For odd numbers of adjacent vertices return the median
			return medianValues[connectedCells.length / 2];
		}
		else
		{
			var medianPoint = connectedCells.length / 2;
			var leftMedian = medianValues[medianPoint - 1];
			var rightMedian = medianValues[medianPoint];

			return ((leftMedian + rightMedian) / 2);
		}
	};

	/**
	 * Function: initialCoords
	 * 
	 * Sets up the layout in an initial positioning. The ranks are all centered
	 * as much as possible along the middle vertex in each rank. The other cells
	 * are then placed as close as possible on either side.
	 * 
	 * Parameters:
	 * 
	 * facade - the facade describing the input graph
	 * model - an internal model of the hierarchical layout
	 */
	mxCoordinateAssignment.prototype.initialCoords = function(facade, model)
	{
		this.calculateWidestRank(facade, model);
		
		// Sweep up and down from the widest rank
		for (var i = this.widestRank; i > 0; i--)
		{
			if (i < model.maxRank)
			{
				this.rankCoordinates(i, facade, model);
			}
		}

		for (var i = this.widestRank; i <= model.maxRank; i++)
		{
			if (i > 0)
			{
				this.rankCoordinates(i, facade, model);
			}
		}
	};

	/**
	 * Function: rankCoordinates
	 * 
	 * Sets up the layout in an initial positioning. All the first cells in each
	 * rank are moved to the left and the rest of the rank inserted as close
	 * together as their size and buffering permits. This method works on just
	 * the specified rank.
	 * 
	 * Parameters:
	 * 
	 * rankValue - the current rank being processed
	 * graph - the facade describing the input graph
	 * model - an internal model of the hierarchical layout
	 */
	mxCoordinateAssignment.prototype.rankCoordinates = function(rankValue, graph, model)
	{
		var rank = model.ranks[rankValue];
		var maxY = 0.0;
		var localX = this.initialX + (this.widestRankValue - this.rankWidths[rankValue])
				/ 2;

		// Store whether or not any of the cells' bounds were unavailable so
		// to only issue the warning once for all cells
		var boundsWarning = false;
		
		for (var i = 0; i < rank.length; i++)
		{
			var node = rank[i];
			
			if (node.isVertex())
			{
				var bounds = this.layout.getVertexBounds(node.cell);

				if (bounds != null)
				{
					if (this.orientation == mxConstants.DIRECTION_NORTH ||
						this.orientation == mxConstants.DIRECTION_SOUTH)
					{
						node.width = bounds.width;
						node.height = bounds.height;
					}
					else
					{
						node.width = bounds.height;
						node.height = bounds.width;
					}
				}
				else
				{
					boundsWarning = true;
				}

				maxY = Math.max(maxY, node.height);
			}
			else if (node.isEdge())
			{
				// The width is the number of additional parallel edges
				// time the parallel edge spacing
				var numEdges = 1;

				if (node.edges != null)
				{
					numEdges = node.edges.length;
				}
				else
				{
					mxLog.warn('edge.edges is null');
				}

				node.width = (numEdges - 1) * this.parallelEdgeSpacing;
			}

			// Set the initial x-value as being the best result so far
			localX += node.width / 2.0;
			node.setX(rankValue, localX);
			node.setGeneralPurposeVariable(rankValue, localX);
			localX += node.width / 2.0;
			localX += this.intraCellSpacing;
		}

		if (boundsWarning == true)
		{
			mxLog.warn('At least one cell has no bounds');
		}
	};

	/**
	 * Function: calculateWidestRank
	 * 
	 * Calculates the width rank in the hierarchy. Also set the y value of each
	 * rank whilst performing the calculation
	 * 
	 * Parameters:
	 * 
	 * graph - the facade describing the input graph
	 * model - an internal model of the hierarchical layout
	 */
	mxCoordinateAssignment.prototype.calculateWidestRank = function(graph, model)
	{
		// Starting y co-ordinate
		var y = -this.interRankCellSpacing;
		
		// Track the widest cell on the last rank since the y
		// difference depends on it
		var lastRankMaxCellHeight = 0.0;
		this.rankWidths = new Array();
		this.rankY = new Array();

		for (var rankValue = model.maxRank; rankValue >= 0; rankValue--)
		{
			// Keep track of the widest cell on this rank
			var maxCellHeight = 0.0;
			var rank = model.ranks[rankValue];
			var localX = this.initialX;

			// Store whether or not any of the cells' bounds were unavailable so
			// to only issue the warning once for all cells
			var boundsWarning = false;
			
			for (var i = 0; i < rank.length; i++)
			{
				var node = rank[i];

				if (node.isVertex())
				{
					var bounds = this.layout.getVertexBounds(node.cell);

					if (bounds != null)
					{
						if (this.orientation == mxConstants.DIRECTION_NORTH ||
							this.orientation == mxConstants.DIRECTION_SOUTH)
						{
							node.width = bounds.width;
							node.height = bounds.height;
						}
						else
						{
							node.width = bounds.height;
							node.height = bounds.width;
						}
					}
					else
					{
						boundsWarning = true;
					}

					maxCellHeight = Math.max(maxCellHeight, node.height);
				}
				else if (node.isEdge())
				{
					// The width is the number of additional parallel edges
					// time the parallel edge spacing
					var numEdges = 1;

					if (node.edges != null)
					{
						numEdges = node.edges.length;
					}
					else
					{
						mxLog.warn('edge.edges is null');
					}

					node.width = (numEdges - 1) * this.parallelEdgeSpacing;
				}

				// Set the initial x-value as being the best result so far
				localX += node.width / 2.0;
				node.setX(rankValue, localX);
				node.setGeneralPurposeVariable(rankValue, localX);
				localX += node.width / 2.0;
				localX += this.intraCellSpacing;

				if (localX > this.widestRankValue)
				{
					this.widestRankValue = localX;
					widestRank = rankValue;
				}

				this.rankWidths[rankValue] = localX;
			}

			if (boundsWarning == true)
			{
				mxLog.warn('At least one cell has no bounds');
			}

			this.rankY[rankValue] = y;
			var distanceToNextRank = maxCellHeight / 2.0
					+ lastRankMaxCellHeight / 2.0 + this.interRankCellSpacing;
			lastRankMaxCellHeight = maxCellHeight;

			if (this.orientation == mxConstants.DIRECTION_NORTH ||
				this.orientation == mxConstants.DIRECTION_WEST)
			{
				y += distanceToNextRank;
			}
			else
			{
				y -= distanceToNextRank;
			}

			for (var i = 0; i < rank.length; i++)
			{
				var cell = rank[i];
				cell.setY(rankValue, y);
			}
		}
	};

	/**
	 * Function: setCellLocations
	 * 
	 * Sets the cell locations in the facade to those stored after this layout
	 * processing step has completed.
	 * 
	 * Parameters:
	 *
	 * graph - the facade describing the input graph
	 * model - an internal model of the hierarchical layout
	 */
	mxCoordinateAssignment.prototype.setCellLocations = function(graph, model)
	{
		for (var i = 0; i < model.ranks.length; i++)
		{
			var rank = model.ranks[i];
			
			for (var h = 0; h < rank.length; h++)
			{
				var node = rank[h];
				
				if (node.isVertex())
				{
					var realCell = node.cell;
					var positionX = node.x[0] - node.width / 2;
					var positionY = node.y[0] - node.height / 2;

					if (this.orientation == mxConstants.DIRECTION_NORTH ||
						this.orientation == mxConstants.DIRECTION_SOUTH)
					{
						this.layout
								.setVertexLocation(realCell, positionX,
										positionY);
					}
					else
					{
						this.layout
								.setVertexLocation(realCell, positionY,
										positionX);
					}

					limitX = Math.max(this.limitX, positionX + node.width);
				}
				else if (node.isEdge())
				{
					// For parallel edges we need to seperate out the points a
					// little
					var offsetX = 0.0;

					// Only set the edge control points once
					if (node.temp[0] != 101207)
					{
						for (var j = 0; j < node.edges.length; j++)
						{
							var realEdge = node.edges[j];
							var newPoints = new Array();

							if (node.isReversed)
							{
								// Reversed edges need the points inserted in
								// reverse order
								for (var k = 0; k < node.x.length; k++)
								{
									var positionX = node.x[k] + offsetX;
									
									if (this.orientation == mxConstants.DIRECTION_NORTH ||
										this.orientation == mxConstants.DIRECTION_SOUTH)
									{
										newPoints.push(new mxPoint(positionX,
												node.y[k]));
									}
									else
									{
										newPoints.push(new mxPoint(node.y[k],
												positionX));
									}
									
									limitX = Math.max(limitX, positionX);
								}
								
								this.processReversedEdge(node, realEdge);
							}
							else
							{
								for (var k = node.x.length - 1; k >= 0; k--)
								{
									var positionX = node.x[k] + offsetX;
									
									if (this.orientation == mxConstants.DIRECTION_NORTH ||
										this.orientation == mxConstants.DIRECTION_SOUTH)
									{
										newPoints.push(new mxPoint(positionX,
												node.y[k]));
									}
									else
									{
										newPoints.push(new mxPoint(node.y[k],
												positionX));
									}
									
									limitX = Math.max(limitX, positionX);
								}
							}

							this.layout.setEdgePoints(realEdge, newPoints);
							
							if (this.disableEdgeStyle)
							{
								graph.setCellStyles(mxConstants.STYLE_NOEDGESTYLE,
										"1", [realEdge]);
							}
							
							// Increase offset so next edge is drawn next to
							// this one
							if (offsetX == 0.0)
							{
								offsetX = this.parallelEdgeSpacing;
							}
							else if (offsetX > 0)
							{
								offsetX = -offsetX;
							}
							else
							{
								offsetX = -offsetX + this.parallelEdgeSpacing;
							}
						}

						node.temp[0] = 101207;
					}
				}
			}
		}
	};
	
	/**
	 * Function: processReversedEdge
	 * 
	 * Hook to add additional processing
	 * 
	 * Parameters:
	 * 
	 * edge - the hierarchical model edge
	 * realEdge - the real edge in the graph
	 */
	mxCoordinateAssignment.prototype.processReversedEdge = function(graph, model)
	{
		// hook for subclassers
	};

	/**
	 * Class: WeightedCellSorter
	 * 
	 * A utility class used to track cells whilst sorting occurs on the weighted
	 * sum of their connected edges. Does not violate (x.compareTo(y)==0) ==
	 * (x.equals(y))
	 */
	{
		/* 
		 * Constructor: WeightedCellSorter
		 * 
		 * Constructs a new weighted cell sorted for the given cell and weight.
		 */
		function WeightedCellSorter(cell, weightedValue)
		{
			this.cell = cell;
			this.weightedValue = weightedValue;
		};
	
		/**
		 * Variable: weightedValue
		 * 
		 * The weighted value of the cell stored.
		 */
		WeightedCellSorter.prototype.weightedValue = 0;
	
		/**
		 * Variable: nudge
		 * 
		 * Whether or not to flip equal weight values.
		 */
		WeightedCellSorter.prototype.nudge = false;
	
		/**
		 * Variable: visited
		 * 
		 * Whether or not this cell has been visited in the current assignment.
		 */
		WeightedCellSorter.prototype.visited = false;
	
		/**
		 * Variable: rankIndex
		 * 
		 * The index this cell is in the model rank.
		 */
		WeightedCellSorter.prototype.rankIndex = null;
	
		/**
		 * Variable: cell
		 * 
		 * The cell whose median value is being calculated.
		 */
		WeightedCellSorter.prototype.cell = null;
	
		/**
		 * Function: compare
		 * 
		 * Compares two WeightedCellSorters.
		 */
		WeightedCellSorter.prototype.compare = function(a, b)
		{
			if (a != null && b != null)
			{
				if (b.weightedValue > a.weightedValue)
				{
					return -1;
				}
				else if (b.weightedValue < a.weightedValue)
				{
					return 1;
				}
				else
				{
					if (b.nudge)
					{
						return -1;
					}
					else
					{
						return 1;
					}
				}
			}
			else
			{
				return 0;
			}
		};

	}

}
