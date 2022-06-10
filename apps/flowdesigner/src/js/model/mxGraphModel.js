/**
 * $Id: mxGraphModel.js,v 1.73 2008/11/14 12:18:20 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGraphModel
 * 
 * Extends <mxEventSource> to implement a graph model. The graph model acts as
 * a wrapper around the cells which are in charge of storing the actual graph
 * datastructure. The model acts as a transactional wrapper with event
 * notification for all changes, whereas the cells contain the atomic
 * operations for updating the actual datastructure.
 * 
 * Layers:
 * 
 * The cell hierarchy in the model must have a top-level root cell which
 * contains the layers (typically one default layer), which in turn contain the
 * top-level cells of the layers. This means each cell is contained in a layer.
 * If no layers are required, then all new cells should be added to the default
 * layer.
 * 
 * Layers are useful for hiding and showing groups of cells, or for placing
 * groups of cells on top of other cells in the display. To identify a layer,
 * the <isLayer> function is used. It returns true if the parent of the given
 * cell is the root of the model.
 * 
 * Encoding and decoding changes:
 * 
 * For the encoding of changes, a graph model listener is required that encodes
 * each change from the given array of changes.
 * 
 * (code)
 * model.addListener('change', function(sender, changes)
 * {
 *   var nodes = new Array();
 *   var codec = new mxCodec();
 *   for (var i=0; i<changes.length; i++)
 *   {
 *     nodes.push(codec.encode(changes[i]));
 *   }
 *   // do something with the nodes
 * });
 * (end)
 * 
 * For the decoding and execution of changes, the codec needs a lookup function
 * that allows it to resolve cell IDs as follows:
 * 
 * (code)
 * var codec = new mxCodec();
 * codec.lookup = function(id)
 * {
 *   return model.getCell(id);
 * }
 * (end)
 * 
 * For each encoded change (represented by a node), the following code can be
 * used to carry out the decoding and create a change object.
 * 
 * (code)
 * var changes = new Array();
 * var change = codec.decode(node);
 * change.model = model;
 * change.execute();
 * changes.push(change);
 * (end)
 * 
 * The changes can then be dispatched using the model as follows.
 * 
 * (code)
 * var edit = new mxUndoableEdit(model, false);
 * edit.changes = changes;
 * 
 * edit.notify = function()
 * {
 *   edit.source.dispatchEvent('change', edit.source, edit.changes);
 *   edit.source.dispatchEvent('notify', edit.source, edit.changes);
 * }
 * 
 * model.dispatchEvent('undo', model, edit);
 * model.dispatchEvent('change', model, changes);
 * (end)
 *  
 * Event: beforeexecute
 * 
 * Fires before an atomic change is executed in <execute>. First argument is
 * the source <mxGraphModel>, second argument is the atomic change whose
 * execute function is about to be called.
 *  
 * Event: execute
 * 
 * Fires after an atomic change is executed in <execute>. First argument is
 * the source <mxGraphModel>, second argument is the atomic change whose
 * execute function was called.
 *  
 * Event: afterExecute
 * 
 * Fires after an atomic change is executed in <execute> and added to the
 * current edit. First argument is the source <mxGraphModel>, seoncd argument
 * is the atomic change whose execute function was called.
 * 
 * Event: beforeUndo
 * 
 * Fires before the notify function is called on <currentEdit> and a new
 * current edit is created. First argument is the source <mxGraphModel>, second
 * argument is the <currentEdit> that is going to be dispatched.
 * 
 * Event: undo
 *
 * Fires when an undoable change happened. This event fires
 * only once per undoable change, it does not fire again when
 * the change is undone and redone. First argument is the
 * source <mxGraphModel>. Second argument is the <mxUndoableEdit>
 * that contains the changes.
 *
 * Event: change
 *
 * Fires when the model has been changed. First argument
 * is the source <mxGraphModel>. Second argument is an
 * array of changes of type <mxRootChange>,
 * <mxChildChange>, <mxTerminalChange>, <mxStyleChange>
 * etc. This event fires whenever the graph has been
 * changed, namely also for undone and redone changes.
 * 
 * Example:
 * 
 * For intercepting addition of new cells after the display has been
 * updated, the following code can be used.
 * 
 * (code)
 * graph.model.addListener('change', function(sender, changes)
 * {
 *   for (var i=0; i<changes.length; i++)
 *   {
 *     var change = changes[i];
 *     if (change.constructor == mxChildChange &&
 *       change.isAdded)
 *     {
 *       graph.edit(change.child);
 *     }
 *   }
 * });
 * (end)
 *
 * Event: notify
 *
 * Same as above, but can be omitted if the edit has been executed to mirror
 * the changes on a master model, in which case only the change event should
 * be fired. Use this event if you need to redirect events to other listeners
 * and fire a change event if you need to perform an update of the model
 * without redirecting the change information (eg. when redirected events are
 * being processed locally).
 * 
 * Event: beginUpdate
 *
 * Fires after the <updateLevel> has been changed in <beginUpdate>.
 * 
 * Event: endUpdate
 * 
 * Fires after the <updateLevel> has been changed but before any other events
 * are fired in <endUpdate>.
 */
{

	/**
	 * Constructor: mxGraphModel
	 * 
	 * Constructs a new graph model. If no root is specified then a new root
	 * <mxCell> with a default layer is created.
	 * 
	 * Parameters:
	 * 
	 * root - <mxCell> that represents the root cell.
	 */
	function mxGraphModel(root)
	{
		this.currentEdit = this.createUndoableEdit();
		
		if (root == null)
		{
			root = this.createRoot();
		}
		
		this.setRoot(root);
	};

	/**
	 * Extends mxEventSource.
	 */
	mxGraphModel.prototype = new mxEventSource();
	mxGraphModel.prototype.constructor = mxGraphModel;

	/**
	 * Variable: root
	 * 
	 * Holds the root cell, which in turn contains the cells that represent the
	 * layers of the diagram as child cells. That is, the actual elements of the
	 * diagram are supposed to live in the third generation of cells and below.
	 */
	mxGraphModel.prototype.root = null;

	/**
	 * Variable: cells
	 * 
	 * Maps from Ids to cells.
	 */
	mxGraphModel.prototype.cells = null;
	
	/**
	 * Variable: maintainEdgeParent
	 * 
	 * Specifies if edges should automatically be moved into the nearest common
	 * ancestor of their terminals. Default is true.
	 */
	mxGraphModel.prototype.maintainEdgeParent = true;

	/**
	 * Variable: createIds
	 * 
	 * Specifies if the model should automatically create Ids for new cells.
	 * Default is true.
	 */
	mxGraphModel.prototype.createIds = true;

	/**
	 * Variable: prefix
	 * 
	 * Defines the prefix of new Ids. Default is an empty string.
	 */
	mxGraphModel.prototype.prefix = '';

	/**
	 * Variable: postfix
	 * 
	 * Defines the postfix of new Ids. Default is an empty string.
	 */
	mxGraphModel.prototype.postfix = '';

	/**
	 * Variable: nextId
	 * 
	 * Specifies the next Id to be created. Initial value is 0.
	 */
	mxGraphModel.prototype.nextId = 0;

	/**
	 * Variable: currentEdit
	 * 
	 * Holds the changes for the current transaction. If the transaction is
	 * closed then a new object is created for this variable using
	 * <createUndoableEdit>.
	 */
	mxGraphModel.prototype.currentEdit = null;

	/**
	 * Variable: updateLevel
	 * 
	 * Counter for the depth of nested transactions. Each call to <beginUpdate>
	 * will increment this number and each call to <endUpdate> will decrement
	 * it. When the counter reaches 0, the transaction is closed and the
	 * respective events are fired. Initial value is 0.
	 */
	mxGraphModel.prototype.updateLevel = 0;

	/**
	 * Function: createRoot
	 *
	 * Creates a new root cell with a default layer (child 0).
	 */
	mxGraphModel.prototype.createRoot = function()
	{
		var cell = new mxCell();
		cell.insert(new mxCell());
		
		return cell;
	};
	
	/**
	 * Function: getCell
	 *
	 * Returns the <mxCell> for the specified Id or null if no cell can be
	 * found for the given Id.
	 *
	 * Parameters:
	 * 
	 * id - A string representing the Id of the cell.
	 */
	mxGraphModel.prototype.getCell = function(id)
	{
		return (this.cells != null) ? this.cells[id] : null;
	};
	
	/**
	 * Function: getCells
	 * 
	 * Visits all cells recursively and applies the specified filter function
	 * to each cell. If the function returns true then the cell is added
	 * to the resulting array. The parent and result paramters are optional.
	 * If parent is not specified then the recursion starts at <root>.
	 * 
	 * Example:
	 * The following example extracts all vertices from a given model:
	 * (code)
	 * var filter = function(cell)
	 * {
	 * 	return model.isVertex(cell);
	 * }
	 * var vertices = model.getCells(filter);
	 * (code)
	 * 
	 * Parameters:
	 * 
	 * filter - JavaScript function that takes an <mxCell> as an argument
	 * and returns a boolean.
	 * parent - Optional <mxCell> that is used as the root of the recursion.
	 * result - Optional array that contains the result vector.
	 */
	mxGraphModel.prototype.getCells = function(filter, parent, result)
	{
		// Creates a new array for storing the result
		result = result || new Array();
		
		if (typeof(filter) == 'function')
		{
			// Recursion starts at the root of the model
			parent = parent || this.getRoot();
			
			// Checks if the filter returns true for the cell
			// and adds it to the result array
			if (filter(parent))
			{
				result.push(parent);
			}
			
			// Visits the children of the cell
			var childCount = this.getChildCount(parent);
			
			for (var i=0; i<childCount; i++)
			{
				var child = this.getChildAt(parent, i);
				this.getCells(filter, child, result);
			}
		}
		
		return result;
	};

	/**
	 * Function: getRoot
	 * 
	 * Returns the root of the model or the topmost parent of the given cell.
	 *
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> that specifies the child.
	 */
	mxGraphModel.prototype.getRoot = function(cell)
	{
		var root = cell || this.root;
		
		if (cell != null)
		{
			while (cell != null)
			{
				root = cell;
				cell = this.getParent(cell);
			}
		}
		
		return root;
	};
	
	/**
	 * Function: setRoot
	 * 
	 * Sets the <root> of the model using <mxRootChange> and adds the change to
	 * the current transaction. This resets all datastructures in the model and
	 * is the preferred way of clearing an existing model. Returns the new
	 * root.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var root = new mxCell();
	 * root.insert(new mxCell());
	 * model.setRoot(root);
	 * (end)
	 *
	 * Parameters:
	 * 
	 * root - <mxCell> that specifies the new root.
	 */
	mxGraphModel.prototype.setRoot = function(root)
	{
		this.execute(new mxRootChange(this, root));
		
		return root;
	};
	
	/**
	 * Function: rootChanged
	 * 
	 * Inner callback to change the root of the model and update the internal
	 * datastructures, such as <cells> and <nextId>. Returns the previous root.
	 *
	 * Parameters:
	 * 
	 * root - <mxCell> that specifies the new root.
	 */
	mxGraphModel.prototype.rootChanged = function(root)
	{
		var oldRoot = this.root;
		this.root = root;
		
		// Resets counters and datastructures
		this.nextId = 0;
		this.cells = null;
		this.cellAdded(root);
		
		return oldRoot;
	};

	/**
	 * Function: isRoot
	 * 
	 * Returns true if the given cell is the root of the model and a non-null
	 * value.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the possible root.
	 */
	mxGraphModel.prototype.isRoot = function(cell)
	{
		return cell != null && this.root == cell;
	};
	
	/**
	 * Function: isLayer
	 * 
	 * Returns true if <isRoot> returns true for the parent of the given cell.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the possible layer.
	 */
	mxGraphModel.prototype.isLayer = function(cell)
	{
		return this.isRoot(this.getParent(cell));
	};
	
	/**
	 * Function: isAncestor
	 * 
	 * Returns true if the given parent is an ancestor of the given child.
	 *
	 * Parameters:
	 * 
	 * parent - <mxCell> that specifies the parent.
	 * child - <mxCell> that specifies the child.
	 */
	mxGraphModel.prototype.isAncestor = function(parent, child)
	{
		while (child != null && child != parent)
		{
			child = this.getParent(child);
		}
		
		return child == parent;
	};

	/**
	 * Function: contains
	 * 
	 * Returns true if the model contains the given <mxCell>.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the cell.
	 */
	mxGraphModel.prototype.contains = function(cell)
	{
		return this.isAncestor(this.root, cell);
	};

	/**
	 * Function: getParent
	 * 
	 * Returns the parent of the given cell.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose parent should be returned.
	 */
	mxGraphModel.prototype.getParent = function(cell)
	{
		return (cell != null) ? cell.getParent() : null;
	};

	/**
	 * Function: add
	 * 
	 * Adds the specified child to the parent at the given index using
	 * <mxChildChange> and adds the change to the current transaction. If no
	 * index is specified then the child is appended to the parent's array of
	 * children. Returns the inserted child.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> that specifies the parent to contain the child.
	 * child - <mxCell> that specifies the child to be inserted.
	 * index - Optional integer that specifies the index of the child.
	 */
	mxGraphModel.prototype.add = function(parent, child, index)
	{
		if (parent != null && child != null)
		{	
			// Appends the child if no index was specified
			if (index == null)
			{
				index = this.getChildCount(parent);
			}
			
			var parentChanged = parent != this.getParent(child);
			this.execute(new mxChildChange(this, parent, child, index));

			// Maintains the edges parents by moving the edges
			// into the nearest common ancestor of its
			// terminals
			if (this.maintainEdgeParent && parentChanged)
			{
				this.updateEdgeParents(child);
			}
		}
		
		return child;
	};

	/**
	 * Function: cellAdded
	 * 
	 * Inner callback to update <cells> when a cell has been added. This
	 * implementation resolves collisions by creating new Ids.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the cell that has been added.
	 */
	mxGraphModel.prototype.cellAdded = function(cell)
	{
		if (cell != null)
		{
			// Creates an Id for the cell if not Id exists
			if (cell.getId() == null && this.createIds)
			{
				cell.setId(this.createId(cell));
			}
			
			if (cell.getId() != null)
			{
				var collision = this.getCell(cell.getId());
				
				if (collision != cell)
				{	
					// Creates new Id for the cell
					// as long as there is a collision
					while (collision != null)
					{
						cell.setId(this.createId(cell));
						collision = this.getCell(cell.getId());
					}
					
					// Lazily creates the cells dictionary
					if (this.cells == null)
					{
						this.cells = new Object();
					}
					
					this.cells[cell.getId()] = cell;
				}
			}
			
			// Makes sure IDs of deleted cells are not reused
			if (mxUtils.isNumeric(cell.getId()))
			{
				this.nextId = Math.max(this.nextId, cell.getId());
			}
			
			// Recursively processes child cells
			var childCount = this.getChildCount(cell);
			
			for (var i=0; i<childCount; i++)
			{
				this.cellAdded(this.getChildAt(cell, i));
			}
		}
	};

	/**
	 * Function: createId
	 * 
	 * Hook method to create an Id for the specified cell. This implementation
	 * concatenates <prefix>, id and <postfix> to create the Id and increments
	 * <nextId>. The cell is ignored by this implementation, but can be used in
	 * overridden methods to prefix the Ids with eg. the cell type.
	 *
	 * Parameters:
	 *
	 * cell - <mxCell> to create the Id for.
	 */
	mxGraphModel.prototype.createId = function(cell)
	{
		var id = this.nextId;
		this.nextId++;
		
		return this.prefix + id + this.postfix;
	};

	/**
	 * Function: updateEdgeParents
	 * 
	 * Updates the parent for all edges that are connected to cell or one of
	 * its descendants using <updateEdgeParent>.
	 */
	mxGraphModel.prototype.updateEdgeParents = function(cell, root)
	{
		// Gets the topmost node of the hierarchy
		root = root || this.getRoot(cell);
		
		// Updates edges on children first
		var childCount = this.getChildCount(cell);
		
		for (var i=0; i<childCount; i++)
		{
			var child = this.getChildAt(cell, i);
			this.updateEdgeParents(child, root);
		}
		
		// Updates the parents of all connected edges
		var edgeCount = this.getEdgeCount(cell);
		
		for (var i=0; i<edgeCount; i++)
		{
			var edge = this.getEdgeAt(cell, i);

			// Updates edge parent if edge and child have
			// a common root node (does not need to be the
			// model root node)
			if (this.isAncestor(root, edge))
			{
				this.updateEdgeParent(edge);
			}
		}
		
		// Updates the parent of the edge itself (if it's an edge)
		if (this.isEdge(cell))
		{
			this.updateEdgeParent(cell);
		}
	};
	
	/**
	 * Function: updateEdgeParent
	 *
	 * Inner callback to update the parent of the specified <mxCell> to the
	 * nearest-common-ancestor of its two terminals.
	 *
	 * Parameters:
	 * 
	 * edge - <mxCell> that specifies the edge.
	 */
	mxGraphModel.prototype.updateEdgeParent = function(edge)
	{
		var source = this.getTerminal(edge, true);
		var target = this.getTerminal(edge, false);
		
		var cell = null;
		
		if (source == target)
		{
			cell = this.getParent(source);
		}
		else
		{
			cell = this.getNearestCommonAncestor(source, target);
		}

		if (cell != null &&
			this.getParent(cell) != this.root &&
			this.getParent(edge) != cell)
		{
			var geo = this.getGeometry(edge);
			
			if (geo != null)
			{
				var origin1 = this.getOrigin(this.getParent(edge));
				var origin2 = this.getOrigin(cell);
				
				var dx = origin2.x - origin1.x;
				var dy = origin2.y - origin1.y;
				
				geo = geo.translate(-dx, -dy);
				this.setGeometry(edge, geo);
			}
			
			this.add(cell, edge, this.getChildCount(cell));
		}
	};
	
	/**
	 * Function: getOrigin
	 * 
	 * Returns the absolute, cummulated origin for the children inside the
	 * given parent as an <mxPoint>.
	 */
	mxGraphModel.prototype.getOrigin = function(cell)
	{
		var result = null;
		
		if (cell != null)
		{
			result = this.getOrigin(this.getParent(cell));
			
			if (!this.isEdge(cell))
			{
				var geo = this.getGeometry(cell);
				
				if (geo != null)
				{
					result.x += geo.x;
					result.y += geo.y;
				}
			}
		}
		else
		{
			result = new mxPoint();
		}
		
		return result;
	};

	/**
	 * Function: getNearestCommonAncestor
	 * 
	 * Returns the nearest common ancestor for the specified cells.
	 *
	 * Parameters:
	 * 
	 * cell1 - <mxCell> that specifies the first cell in the tree.
	 * cell2 - <mxCell> that specifies the second cell in the tree.
	 */
	mxGraphModel.prototype.getNearestCommonAncestor = function(cell1, cell2)
	{
		if (cell1 != null && cell2 != null)
		{		
			// Creates the cell path for the second cell
			var path = mxCellPath.create(cell2);

			if (path != null && path.length > 0)
			{
				// Bubbles through the ancestors of the first
				// cell to find the nearest common ancestor.
				var cell = cell1;
				var current = mxCellPath.create(cell) +
					mxCellPath.PATH_SEPARATOR;
				
				while (cell != null)
				{
					var parent = this.getParent(cell);

					// Checks if the cell path is equal to the beginning
					// of the given cell path
					if (path.indexOf(current) == 0 &&
						parent != null)
					{
						return cell;
					}
					
					current = mxCellPath.getParentPath(current) +
						mxCellPath.PATH_SEPARATOR;
					cell = parent;
				}
			}
		}
		
		return null;
	};

	/**
	 * Function: remove
	 * 
	 * Removes the specified cell from the model using <mxChildChange> and adds
	 * the change to the current transaction. This operation will remove the
	 * cell and all of its children from the model. Returns the removed cell.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that should be removed.
	 */
	mxGraphModel.prototype.remove = function(cell)
	{
		if (cell == this.root)
		{
			this.setRoot(null);
		}
		else if (this.getParent(cell) != null)
		{
			this.execute(new mxChildChange(this, null, cell));
		}
		
		return cell;
	};

	/**
	 * Function: cellRemoved
	 * 
	 * Inner callback to update <cells> when a cell has been removed.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the cell that has been removed.
	 */
	mxGraphModel.prototype.cellRemoved = function(cell)
	{
		if (cell != null && this.cells != null)
		{
			// Recursively processes child cells
			var childCount = this.getChildCount(cell);
			
			for (var i=childCount-1; i>=0; i--)
			{
				this.cellRemoved(this.getChildAt(cell, i));
			}
			
			// Removes the dictionary entry for the cell
			if (this.cells != null && cell.getId() != null)
			{
				delete this.cells[cell.getId()];
			}
		}
	};

	/**
	 * Function: parentForCellChanged
	 * 
	 * Inner callback to update the parent of a cell using <mxCell.insert>
	 * on the parent and return the previous parent.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> to update the parent for.
	 * parent - <mxCell> that specifies the new parent of the cell.
	 * index - Optional integer that defines the index of the child
	 * in the parent's child array.
	 */
	mxGraphModel.prototype.parentForCellChanged = function(cell, parent, index)
	{
		var previous = this.getParent(cell);
		
		if (parent != null)
		{
			if (parent != previous ||
				previous.getIndex(cell) != index)
			{
				parent.insert(cell, index);
			}
		}
		else if (previous != null)
		{
			var oldIndex = previous.getIndex(cell);
			previous.remove(oldIndex);
		}
		
		// Checks if the previous parent was already in the
		// model and avoids calling cellAdded if it was.
		if (!this.contains(previous) &&
			parent != null)
		{
			this.cellAdded(cell);
		}
		else if (parent == null)
		{
			this.cellRemoved(cell);
		}
		
		return previous;
	};

	/**
	 * Function: getChildCount
	 *
	 * Returns the number of children in the given cell.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose number of children should be returned.
	 */
	mxGraphModel.prototype.getChildCount = function(cell)
	{
		return (cell != null) ? cell.getChildCount() : 0;
	};

	/**
	 * Function: getChildAt
	 *
	 * Returns the child of the given <mxCell> at the given index.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the parent.
	 * index - Integer that specifies the index of the child to be returned.
	 */
	mxGraphModel.prototype.getChildAt = function(cell, index)
	{
		return (cell != null) ? cell.getChildAt(index) : null;
	};

	/**
	 * Function: getChildren
	 * 
	 * Returns all children of the given <mxCell> as an array of <mxCells>. The
	 * return value should be only be read.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> the represents the parent.
	 */
	mxGraphModel.prototype.getChildren = function(cell)
	{
		return (cell != null) ? cell.children : null;
	};
		
	/**
	 * Function: getChildVertices
	 * 
	 * Returns the child vertices of the given parent.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose child vertices should be returned.
	 */
	mxGraphModel.prototype.getChildVertices = function(parent)
	{
		return this.getChildCells(parent, true, false);
	};
			
	/**
	 * Function: getChildEdges
	 * 
	 * Returns the child edges of the given parent.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose child edges should be returned.
	 */
	mxGraphModel.prototype.getChildEdges = function(parent)
	{
		return this.getChildCells(parent, false, true);
	};
	
	/**
	 * Function: getChildCells
	 * 
	 * Returns the children of the given cell that are vertices and/or edges
	 * depending on the arguments.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> the represents the parent.
	 * vertices - Boolean indicating if child vertices should be returned.
	 * Default is false.
	 * edges - Boolean indicating if child edges should be returned.
	 * Default is false.
	 */
	mxGraphModel.prototype.getChildCells = function(parent, vertices, edges)
	{
		vertices = (vertices != null) ? vertices : false;
		edges = (edges != null) ? edges : false;
		
		var childCount = this.getChildCount(parent);
		var result = new Array();

		for (var i = 0; i < childCount; i++)
		{
			var child = this.getChildAt(parent, i);

			if ((!edges && !vertices) ||
				(edges && this.isEdge(child)) ||
				(vertices && this.isVertex(child)))
			{
				result.push(child);
			}
		}

		return result;
	};
			
	/**
	 * Function: getTerminal
	 * 
	 * Returns the source or target <mxCell> of the given edge depending on the
	 * value of the boolean parameter.
	 *
	 * Parameters:
	 * 
	 * edge - <mxCell> that specifies the edge.
	 * isSource - Boolean indicating which end of the edge should be returned.
	 */
	mxGraphModel.prototype.getTerminal = function(edge, isSource)
	{
		return edge.getTerminal(isSource);
	};

	/**
	 * Function: setTerminal
	 * 
	 * Sets the source or target terminal of the given <mxCell> using
	 * <mxTerminalChange> and adds the change to the current transaction.
	 * This implementation updates the parent of the edge using <updateEdgeParent>
	 * if required.
	 *
	 * Parameters:
	 * 
	 * edge - <mxCell> that specifies the edge.
	 * terminal - <mxCell> that specifies the new terminal.
	 * isSource - Boolean indicating if the terminal is the new source or
	 * target terminal of the edge.
	 */
	mxGraphModel.prototype.setTerminal = function(edge, terminal, isSource)
	{
		if (terminal != this.getTerminal(edge, isSource))
		{
			this.execute(new mxTerminalChange(this, edge, terminal, isSource));
			
			if (this.maintainEdgeParent)
			{
				this.updateEdgeParent(edge);
			}
		}
		
		return terminal;
	};
		
	/**
	 * Function: setTerminals
	 * 
	 * Sets the source and target <mxCell> of the given <mxCell> in a single
	 * transaction using <setTerminal> for each end of the edge.
	 *
	 * Parameters:
	 * 
	 * edge - <mxCell> that specifies the edge.
	 * source - <mxCell> that specifies the new source terminal.
	 * target - <mxCell> that specifies the new target terminal.
	 */
	mxGraphModel.prototype.setTerminals = function(edge, source, target)
	{
		this.beginUpdate();
		try
		{
			this.setTerminal(edge, source, true);
			this.setTerminal(edge, target, false);
		}
		finally
		{
			this.endUpdate();
		}
	};
	
	/**
	 * Function: terminalForCellChanged
	 * 
	 * Inner helper function to update the terminal of the edge using
	 * <mxCell.insertEdge> and return the previous terminal.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> that specifies the edge to be updated.
	 * terminal - <mxCell> that specifies the new terminal.
	 * isSource - Boolean indicating if the terminal is the new source or
	 * target terminal of the edge.
	 */
	mxGraphModel.prototype.terminalForCellChanged = function(edge, terminal, isSource)
	{
		var previous = this.getTerminal(edge, isSource);
		
		if (terminal != null)
		{
			terminal.insertEdge(edge, isSource);
		}
		else if (previous != null)
		{
			previous.removeEdge(edge, isSource);
		}
		
		return previous;
	};
	
	/**
	 * Function: getEdgeCount
	 * 
	 * Returns the number of distinct edges connected to the given cell.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the vertex.
	 */
	mxGraphModel.prototype.getEdgeCount = function(cell)
	{
		return (cell != null) ? cell.getEdgeCount() : 0;
	};

	/**
	 * Function: getEdgeAt
	 * 
	 * Returns the edge of cell at the given index.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the vertex.
	 * index - Integer that specifies the index of the edge
	 * to return.
	 */
	mxGraphModel.prototype.getEdgeAt = function(cell, index)
	{
		return (cell != null) ? cell.getEdgeAt(index) : null;
	};
		
	/**
	 * Function: getDirectedEdgeCount
	 * 
	 * Returns the number of incoming or outgoing edges, ignoring the given
	 * edge.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose edge count should be returned.
	 * outgoing - Boolean that specifies if the number of outgoing or
	 * incoming edges should be returned.
	 * ignoredEdge - <mxCell> that represents an edge to be ignored.
	 */
	mxGraphModel.prototype.getDirectedEdgeCount = function(cell, outgoing, ignoredEdge)
	{
		var count = 0;
		var edgeCount = this.getEdgeCount(cell);

		for (var i = 0; i < edgeCount; i++)
		{
			var edge = this.getEdgeAt(cell, i);

			if (edge != ignoredEdge
					&& this.getTerminal(edge, outgoing) == cell)
			{
				count++;
			}
		}

		return count;
	};

	/**
	 * Function: getConnections
	 * 
	 * Returns all edges of the given cell without loops.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose edges should be returned.
	 * 
	 */
	mxGraphModel.prototype.getConnections = function(cell)
	{
		return this.getEdges(cell, true, true, false);
	};
	
	/**
	 * Function: getIncomingEdges
	 * 
	 * Returns the incoming edges of the given cell without loops.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose incoming edges should be returned.
	 * 
	 */
	mxGraphModel.prototype.getIncomingEdges = function(cell)
	{
		return this.getEdges(cell, true, false, false);
	};
	
	/**
	 * Function: getIncomingEdges
	 * 
	 * Returns the incoming edges of the given cell without loops.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose incoming edges should be returned.
	 * 
	 */
	mxGraphModel.prototype.getOutgoingEdges = function(cell)
	{
		return this.getEdges(cell, false, true, false);
	};

	/**
	 * Function: getEdges
	 * 
	 * Returns all distinct edges connected to this cell as a new array of
	 * <mxCells>. If at least one of incoming or outgoing is true, then loops
	 * are ignored, otherwise if both are false, then all edges connected to
	 * the given cell are returned including loops.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the cell.
	 * incoming - Optional boolean that specifies if incoming edges shoulld be
	 * returned. Default is true.
	 * outgoing - Optional boolean that specifies if outgoing edges should be
	 * returned. Default is true.
	 * includeLoops - Optional boolean that specifies if loops should be returned.
	 * Default is true. 
	 */
	mxGraphModel.prototype.getEdges = function(cell, incoming, outgoing, includeLoops)
	{
		incoming = (incoming != null) ? incoming : true;
		outgoing = (outgoing != null) ? outgoing : true;
		includeLoops = (includeLoops != null) ? includeLoops : true;
		
		var edgeCount = this.getEdgeCount(cell);
		var result = new Array();

		for (var i = 0; i < edgeCount; i++)
		{
			var edge = this.getEdgeAt(cell, i);
			var source = this.getTerminal(edge, true);
			var target = this.getTerminal(edge, false);

			if (includeLoops || ((source != target) &&
				((incoming && target == cell) ||
				(outgoing && source == cell))))
			{
				result.push(edge);
			}
		}

		return result;
	};
	
	/**
	 * Function: getEdgesBetween
	 * 
	 * Returns all edges between the given source and target pair. If directed
	 * is true, then only edges from the source to the target are returned,
	 * otherwise, all edges between the two cells are returned.
	 * 
	 * Parameters:
	 * 
	 * source - <mxCell> that defines the source terminal of the edge to be
	 * returned.
	 * target - <mxCell> that defines the target terminal of the edge to be
	 * returned.
	 * directed - Optional boolean that specifies if the direction of the
	 * edge should be taken into account. Default is false.
	 */
	mxGraphModel.prototype.getEdgesBetween = function(source, target, directed)
	{
		directed = (directed != null) ? directed : false;
		
		var tmp1 = this.getEdgeCount(source);
		var tmp2 = this.getEdgeCount(target);
		
		// Assumes the source has less connected edges
		var terminal = source;
		var edgeCount = tmp1;
		
		// Uses the smaller array of connected edges
		// for searching the edge
		if (tmp2 < tmp1)
		{
			edgeCount = tmp2;
			terminal = target;
		}
		
		var result = new Array();
		
		// Checks if the edge is connected to the correct
		// cell and returns the first match
		for (var i = 0; i < edgeCount; i++)
		{
			var edge = this.getEdgeAt(terminal, i);
			var src = this.getTerminal(edge, true);
			var trg = this.getTerminal(edge, false);
			var isSource = src == source;
			
			if (isSource && trg == target ||
				(!directed &&
				this.getTerminal(edge, !isSource) == target))
			{
				result.push(edge);
			}
		}
		
		return result;
	};

	/**
	 * Function: getOpposites
	 * 
	 * Returns all opposite vertices wrt terminal for the given edges, only
	 * returning sources and/or targets as specified. The result is returned
	 * as an array of <mxCells>.
	 * 
	 * Parameters:
	 * 
	 * edges - Array of <mxCells> that contain the edges to be examined.
	 * terminal - <mxCell> that specifies the known end of the edges.
	 * sources - Boolean that specifies if source terminals should be contained
	 * in the result. Default is true.
	 * targets - Boolean that specifies if target terminals should be contained
	 * in the result. Default is true.
	 */
	mxGraphModel.prototype.getOpposites = function(edges, terminal, sources, targets)
	{
		sources = (sources != null) ? sources : true;
		targets = (targets != null) ? targets : true;
		
		var terminals = new Array();
		
		if (edges != null)
		{
			for (var i = 0; i < edges.length; i++)
			{
				var source = this.getTerminal(edges[i], true);
				var target = this.getTerminal(edges[i], false);
				
				// Checks if the terminal is the source of
				// the edge and if the target should be
				// stored in the result
				if (source == terminal &&
					target != null &&
					target != terminal &&
					targets)
				{
					terminals.push(target);
				}
				
				// Checks if the terminal is the taget of
				// the edge and if the source should be
				// stored in the result
				else if (target == terminal &&
						source != null &&
						source != terminal &&
						sources)
				{
					terminals.push(source);
				}
			}
		}
		
		return terminals;
	};
	
	/**
	 * Function: getTopmostCells
	 * 
	 * Returns the topmost cells of the hierarchy in an array that contains no
	 * desceandants for each <mxCell> that it contains. Duplicates should be
	 * removed in the cells array to improve performance.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> whose topmost ancestors should be returned.
	 */
	mxGraphModel.prototype.getTopmostCells = function(cells)
	{
		var tmp = new Array();
		
		for (var i = 0; i < cells.length; i++)
		{
			var cell = cells[i];
			var topmost = true;
			var parent = this.getParent(cell);
			
			while (parent != null)
			{
				if (mxUtils.indexOf(cells, parent) >= 0)
				{
					topmost = false;
					break;
				}
				
				parent = this.getParent(parent);
			}
			
			if (topmost)
			{
				tmp.push(cell);
			}
		}
		
		return tmp;
	};
	
	/**
	 * Function: isVertex
	 * 
	 * Returns true if the given cell is a vertex.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the possible vertex.
	 */
	mxGraphModel.prototype.isVertex = function(cell)
	{
		return cell.isVertex();
	};

	/**
	 * Function: isEdge
	 * 
	 * Returns true if the given cell is an edge.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the possible edge.
	 */
	mxGraphModel.prototype.isEdge = function(cell)
	{
		return cell.isEdge();
	};
	
	/**
	 * Function: isConnectable
	 * 
	 * Returns true if the given <mxCell> is connectable. If <edgesConnectable>
	 * is false, then this function returns false for all edges else it returns
	 * the return value of <mxCell.isConnectable>.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose connectable state should be returned.
	 */
	mxGraphModel.prototype.isConnectable = function(cell)
	{
		return cell.isConnectable();
	};

	/**
	 * Function: getValue
	 * 
	 * Returns the user object of the given <mxCell> using <mxCell.getValue>.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose user object should be returned.
	 */
	mxGraphModel.prototype.getValue = function(cell)
	{
		return (cell != null) ? cell.getValue() : null;
	};
	
	/**
	 * Function: setValue
	 * 
	 * Sets the user object of then given <mxCell> using <mxValueChange>
	 * and adds the change to the current transaction.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose user object should be changed.
	 * value - Object that defines the new user object.
	 */
	mxGraphModel.prototype.setValue = function(cell, value)
	{
		this.execute(new mxValueChange(this, cell, value));
		
		return value;
	};
	
	/**
	 * Function: valueForCellChanged
	 * 
	 * Inner callback to update the user object of the given <mxCell>
	 * using <mxCell.valueChanged> and return the previous value,
	 * that is, the return value of <mxCell.valueChanged>.
	 */
	mxGraphModel.prototype.valueForCellChanged = function(cell, value)
	{
		return cell.valueChanged(value);
	};

	/**
	 * Function: getGeometry
	 * 
	 * Returns the <mxGeometry> of the given <mxCell>.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose geometry should be returned.
	 */
	mxGraphModel.prototype.getGeometry = function(cell, geometry)
	{
		return (cell != null) ? cell.getGeometry() : null;
	};
	
	/**
	 * Function: setGeometry
	 * 
	 * Sets the <mxGeometry> of the given <mxCell>. The actual update
	 * of the cell is carried out in <geometryForCellChanged>. The
	 * <mxGeometryChange> action is used to encapsulate the change.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose geometry should be changed.
	 * geometry - <mxGeometry> that defines the new geometry.
	 */
	mxGraphModel.prototype.setGeometry = function(cell, geometry)
	{
		if (geometry != this.getGeometry(cell))
		{
			this.execute(new mxGeometryChange(this, cell, geometry));
		}
		
		return geometry;
	};

	/**
	 * Function: geometryForCellChanged
	 * 
	 * Inner callback to update the <mxGeometry> of the given <mxCell> using
	 * <mxCell.setGeometry> and return the previous <mxGeometry>.
	 */
	mxGraphModel.prototype.geometryForCellChanged = function(cell, geometry)
	{
		var previous = this.getGeometry(cell);
		cell.setGeometry(geometry);
		
		return previous;
	};

	/**
	 * Function: getStyle
	 * 
	 * Returns the style of the given <mxCell>.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose style should be returned.
	 */
	mxGraphModel.prototype.getStyle = function(cell)
	{
		return cell.getStyle();
	};
	
	/**
	 * Function: setStyle
	 * 
	 * Sets the style of the given <mxCell> using <mxStyleChange> and
	 * adds the change to the current transaction.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose style should be changed.
	 * style - String of the form [stylename;|key=value;] to specify
	 * the new cell style.
	 */
	mxGraphModel.prototype.setStyle = function(cell, style)
	{
		if (style != this.getStyle(cell))
		{
			this.execute(new mxStyleChange(this, cell, style));
		}
		
		return style;
	};

	/**
	 * Function: styleForCellChanged
	 * 
	 * Inner callback to update the style of the given <mxCell>
	 * using <mxCell.setStyle> and return the previous style.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the cell to be updated.
	 * style - String of the form [stylename;|key=value;] to specify
	 * the new cell style.
	 */
	mxGraphModel.prototype.styleForCellChanged = function(cell, style)
	{
		var previous = this.getStyle(cell);
		cell.setStyle(style);
		
		return previous;
	};

	/**
	 * Function: isCollapsed
	 * 
	 * Returns true if the given <mxCell> is collapsed.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose collapsed state should be returned.
	 */
	mxGraphModel.prototype.isCollapsed = function(cell)
	{
		return cell.isCollapsed();
	};

	/**
	 * Function: setCollapsed
	 * 
	 * Sets the collapsed state of the given <mxCell> using <mxCollapseChange>
	 * and adds the change to the current transaction.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose collapsed state should be changed.
	 * collapsed - Boolean that specifies the new collpased state.
	 */
	mxGraphModel.prototype.setCollapsed = function(cell, collapsed)
	{
		if (collapsed != this.isCollapsed(cell))
		{
			this.execute(new mxCollapseChange(this, cell, collapsed));
		}
		
		return collapsed;
	};
		
	/**
	 * Function: collapsedStateForCellChanged
	 *
	 * Inner callback to update the collapsed state of the
	 * given <mxCell> using <mxCell.setCollapsed> and return
	 * the previous collapsed state.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the cell to be updated.
	 * collapsed - Boolean that specifies the new collpased state.
	 */
	mxGraphModel.prototype.collapsedStateForCellChanged = function(cell, collapsed)
	{
		var previous = this.isCollapsed(cell);
		cell.setCollapsed(collapsed);
		
		return previous;
	};
	
	/**
	 * Function: isVisible
	 * 
	 * Returns true if the given <mxCell> is visible.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose visible state should be returned.
	 */
	mxGraphModel.prototype.isVisible = function(cell)
	{
		return cell.isVisible();
	};

	/**
	 * Function: setVisible
	 * 
	 * Sets the visible state of the given <mxCell> using <mxVisibleChange> and
	 * adds the change to the current transaction.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> whose visible state should be changed.
	 * visible - Boolean that specifies the new visible state.
	 */
	mxGraphModel.prototype.setVisible = function(cell, visible)
	{
		if (visible != this.isVisible(cell))
		{
			this.execute(new mxVisibleChange(this, cell, visible));
		}
		
		return visible;
	};
		
	/**
	 * Function: visibleStateForCellChanged
	 *
	 * Inner callback to update the visible state of the
	 * given <mxCell> using <mxCell.setCollapsed> and return
	 * the previous visible state.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that specifies the cell to be updated.
	 * visible - Boolean that specifies the new visible state.
	 */
	mxGraphModel.prototype.visibleStateForCellChanged = function(cell, visible)
	{
		var previous = this.isVisible(cell);
		cell.setVisible(visible);
		
		return previous;
	};
	
	/**
	 * Function: execute
	 * 
	 * Executes the given edit and fires events if required. The edit object
	 * requires an execute function which is invoked. The edit is added to the
	 * <currentEdit> between <beginUpdate> and <endUpdate> calls, so that
	 * events will be fired if this execute is an individual transaction, that
	 * is, if no previous <beginUpdate> calls have been made without calling
	 * <endUpdate>. This implementation fires an <execute> event before
	 * executing the given change.
	 * 
	 * Parameters:
	 * 
	 * change - Object that described the change.
	 */
	mxGraphModel.prototype.execute = function(change)
	{
		this.dispatchEvent('beforeExecute', this, change);
		change.execute();
		this.dispatchEvent('execute', this, change);
		this.beginUpdate();
		this.currentEdit.add(change);
		this.endUpdate();
		this.dispatchEvent('afterExecute', this, change);
	};

	/**
	 * Function: beginUpdate
	 * 
	 * Increments the <updateLevel> by one. The event notification
	 * is queued until <updateLevel> reaches 0 by use of
	 * <endUpdate>.
	 *
	 * All changes on <mxGraphModel> are transactional,
	 * that is, they are executed in a single undoable change
	 * on the model (without transaction isolation).
	 * Therefore, if you want to combine any
	 * number of changes into a single undoable change,
	 * you should group any two or more API calls that
	 * modify the graph model between <beginUpdate>
	 * and <endUpdate> calls as shown here:
	 * 
	 * (code)
	 * var model = graph.getModel();
	 * var parent = graph.getDefaultParent();
	 * var index = model.getChildCount(parent);
	 * model.beginUpdate();
	 * try
	 * {
	 *   model.add(parent, v1, index);
	 *   model.add(parent, v2, index+1);
	 * }
	 * finally
	 * {
	 *   model.endUpdate();
	 * }
	 * (end)
	 * 
	 * Of course there is a shortcut for appending a
	 * sequence of cells into the default parent:
	 * 
	 * (code)
	 * graph.addCells([v1, v2]).
	 * (end)
	 */
	mxGraphModel.prototype.beginUpdate = function()
	{
		this.updateLevel++;
		this.dispatchEvent('beginUpdate', this);
	};

	/**
	 * Function: endUpdate
	 * 
	 * Decrements the <updateLevel> by one and fires an <undo>
	 * event if the <updateLevel> reaches 0. This function
	 * indirectly fires a <change> event by invoking the notify
	 * function on the <currentEdit> und then creates a new
	 * <currentEdit> using <createUndoableEdit>.
	 *
	 * The <undo> event is fired only once per edit, whereas
	 * the <change> event is fired whenever the notify
	 * function is invoked, that is, on undo and redo of
	 * the edit.
	 */
	mxGraphModel.prototype.endUpdate = function()
	{
		this.updateLevel--;
		this.dispatchEvent('endUpdate', this);
				
		if (this.updateLevel == 0)
		{
			if (!this.currentEdit.isEmpty())
			{
				var tmp = this.currentEdit;
				
				this.dispatchEvent('beforeUndo', this, tmp);
				this.currentEdit = this.createUndoableEdit();

				tmp.notify();
				this.dispatchEvent('undo', this, tmp);
			}
		}
	};

	/**
	 * Function: createUndoableEdit
	 * 
	 * Creates a new <mxUndoableEdit> that implements the
	 * notify function to fire a <change> and <notify> event
	 * through the <mxUndoableEdit>'s source.
	 */
	mxGraphModel.prototype.createUndoableEdit = function()
	{
		var edit = new mxUndoableEdit(this, true);
		
		edit.notify = function()
		{
			edit.source.dispatchEvent('change', edit.source, edit.changes);
			edit.source.dispatchEvent('notify', edit.source, edit.changes);
		}
		
		return edit;
	};

	/**
	 * Function: mergeChildren
	 * 
	 * Merges the children of the given cell into the given target cell inside
	 * this model. All cells are cloned unless there is a corresponding cell in
	 * the model with the same id, in which case the source cell is ignored and
	 * all edges are connected to the corresponding cell in this model. Edges
	 * are considered to have no identity and are always cloned unless the
	 * cloneAllEdges flag is set to false, in which case edges with the same
	 * id in the target model are reconnected to reflect the terminals of the
	 * source edges.
	 */
	mxGraphModel.prototype.mergeChildren = function(from, to, cloneAllEdges)
	{
		cloneAllEdges = (cloneAllEdges != null) ? cloneAllEdges : true;
		
		this.beginUpdate();
		try
		{
			var mapping = new Object();
			this.mergeChildrenImpl(from, to, cloneAllEdges, mapping);
			
			// Post-processes all edges in the mapping and
			// reconnects the terminals to the corresponding
			// cells in the target model
			for (var key in mapping)
			{
				var cell = mapping[key];
				var terminal = this.getTerminal(cell, true);
				
				if (terminal != null)
				{
					terminal = mapping[mxCellPath.create(terminal)];
					this.setTerminal(cell, terminal, true);
				}
				
				terminal = this.getTerminal(cell, false);
				
				if (terminal != null)
				{
					terminal = mapping[mxCellPath.create(terminal)];
					this.setTerminal(cell, terminal, false);
				}
			}
		}
		finally
		{
			this.endUpdate();
		}
	};

	/**
	 * Function: mergeChildren
	 * 
	 * Clones the children of the source cell into the given target cell in
	 * this model and adds an entry to the mapping that maps from the source
	 * cell to the target cell with the same id or the clone of the source cell
	 * that was inserted into this model.
	 */
	mxGraphModel.prototype.mergeChildrenImpl = function(from, to, cloneAllEdges, mapping)
	{
		this.beginUpdate();
		try
		{
			var childCount = from.getChildCount();
			
			for (var i = 0; i < childCount; i++)
			{
				var cell = from.getChildAt(i);
				
				if (typeof(cell.getId) == 'function')
				{
					var id = cell.getId();
					var target = (id != null && (!this.isEdge(cell) || !cloneAllEdges)) ?
							this.getCell(id) : null;
					
					// Clones and adds the child if no cell exists for the id
					if (target == null)
					{
						var clone = cell.clone();
						clone.setId(id);
						
						// Sets the terminals from the original cell to the clone
						// because the lookup uses strings not cells in JS
						clone.setTerminal(cell.getTerminal(true), true);
						clone.setTerminal(cell.getTerminal(false), false);
						
						target = this.add(to, clone, this.getChildCount(to));
					}
					
					// Stores the mapping for later reconnecting edges
					mapping[mxCellPath.create(cell)] = target;
					
					// Recurses
					this.mergeChildrenImpl(cell, target, cloneAllEdges, mapping);
				}
			}
		}
		finally
		{
			this.endUpdate();
		}
	};

	//
	// Cell Cloning
	//

	/**
	 * Function: cloneCell
	 * 
	 * Returns a deep clone of the given <mxCell> (including
	 * the children) which is created using <cloneCells>.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> to be cloned.
	 */
	mxGraphModel.prototype.cloneCell = function(cell)
	{
		if (cell != null)
		{
			return this.cloneCells([cell], true)[0];
		}
		
		return null;
	};

	/**
	 * Function: cloneCells
	 * 
	 * Returns an array of clones for the given array of <mxCells>.
	 * Depending on the value of includeChildren, a deep clone is created for
	 * each cell. Connections are restored based if the corresponding
	 * cell is contained in the passed in array.
	 *
	 * Parameters:
	 * 
	 * cells - Array of <mxCell> to be cloned.
	 * includeChildren - Boolean indicating if the cells should be cloned
	 * with all descendants.
	 */
	mxGraphModel.prototype.cloneCells = function(cells, includeChildren)
	{
		var mapping = new Object();
		var clones = new Array();
		
		for (var i = 0; i < cells.length; i++)
		{
			if (cells[i] != null)
			{
				clones.push(this.cloneCellImpl(cells[i], mapping, includeChildren));
			}
			else
			{
				clones.push(null);
			}
		}
		
		for (var i = 0; i < clones.length; i++)
		{
			if (clones[i] != null)
			{
				this.restoreClone(clones[i], cells[i], mapping);
			}
		}
		
		return clones;
	};
				
	/**
	 * Function: cloneCellImpl
	 * 
	 * Inner helper method for cloning cells recursively.
	 */
	mxGraphModel.prototype.cloneCellImpl = function(cell, mapping, includeChildren)
	{
		var clone = this.cellCloned(cell);
		
		// Stores the clone in the lookup under the
		// cell path for the original cell
		mapping[mxObjectIdentity.get(cell)] = clone;
		
		if (includeChildren)
		{
			var childCount = this.getChildCount(cell);
			
			for (var i = 0; i < childCount; i++)
			{
				var cloneChild = this.cloneCellImpl(
					this.getChildAt(cell, i), mapping, true);
				clone.insert(cloneChild);
			}
		}
		
		return clone;
	};

	/**
	 * Function: cellCloned
	 * 
	 * Hook for cloning the cell. This returns cell.clone() or
	 * any possible exceptions.
	 */
	mxGraphModel.prototype.cellCloned = function(cell)
	{
		return cell.clone();
	};
	
	/**
	 * Function: restoreClone
	 * 
	 * Inner helper method for restoring the connections in
	 * a network of cloned cells.
	 */
	mxGraphModel.prototype.restoreClone = function(clone, cell, mapping)
	{
		var source = this.getTerminal(cell, true);
		
		if (source != null)
		{
			var tmp = mapping[mxObjectIdentity.get(source)];
			
			if (tmp != null)
			{
				tmp.insertEdge(clone, true);
			}
		}
		
		var target = this.getTerminal(cell, false);
		
		if (target != null)
		{
			var tmp = mapping[mxObjectIdentity.get(target)];
			
			if (tmp != null)
			{	
				tmp.insertEdge(clone, false);
			}
		}
		
		var childCount = this.getChildCount(clone);
		
		for (var i = 0; i < childCount; i++)
		{
			this.restoreClone(this.getChildAt(clone, i),
				this.getChildAt(cell, i), mapping);
		}
	};

	//
	// Atomic changes
	//

	/**
	 * Class: mxRootChange
	 * 
	 * Action to change the root in a model.
	 *
	 * Constructor: mxRootChange
	 * 
	 * Constructs a change of the root in the
	 * specified model.
	 */
	function mxRootChange(model, root)
	{
		this.model = model;
		this.root = root;
		this.previous = root;
	};

	/**
	 * Function: execute
	 * 
	 * Carries out a change of the root using
	 * <mxGraphModel.rootChanged>.
	 */
	mxRootChange.prototype.execute = function()
	{
		this.root = this.previous;
		this.previous = this.model.rootChanged(this.previous);
	};
	
	/**
	 * Class: mxChildChange
	 * 
	 * Action to add or remove a child in a model.
	 *
	 * Constructor: mxChildChange
	 * 
	 * Constructs a change of a child in the
	 * specified model.
	 */
	function mxChildChange(model, parent, child, index)
	{
		this.model = model;
		this.parent = parent;
		this.previous = parent;
		this.child = child;
		this.index = index;
		this.previousIndex = index;
		this.isAdded = (parent == null);
	};

	/**
	 * Function: execute
	 * 
	 * Changes the parent of <child> using
	 * <mxGraphModel.parentForCellChanged> and
	 * removes or restores the cell's
	 * connections.
	 */
	mxChildChange.prototype.execute = function()
	{
		var tmp = this.model.getParent(this.child);
		var tmp2 = (tmp != null) ? tmp.getIndex(this.child) : 0;
		
		if (this.previous == null)
		{
			this.connect(this.child, false);
		}
		
		tmp = this.model.parentForCellChanged(
			this.child, this.previous, this.previousIndex);
			
		if (this.previous != null)
		{
			this.connect(this.child, true);
		}
		
		this.parent = this.previous;
		this.previous = tmp;
		this.index = this.previousIndex;
		this.previousIndex = tmp2;
		this.isAdded = !this.isAdded;
	};

	/**
	 * Function: disconnect
	 * 
	 * Disconnects the given cell recursively from its
	 * terminals and stores the previous terminal in the
	 * cell's terminals.
	 */
	mxChildChange.prototype.connect = function(cell, isConnect)
	{
		isConnect = (isConnect != null) ? isConnect : true;
		
		var source = cell.getTerminal(true);
		var target = cell.getTerminal(false);
		
		if (source != null)
		{
			if (isConnect)
			{
				this.model.terminalForCellChanged(cell, source, true);
			}
			else
			{
				this.model.terminalForCellChanged(cell, null, true);
			}
		}
		
		if (target != null)
		{
			if (isConnect)
			{
				this.model.terminalForCellChanged(cell, target, false);
			}
			else
			{
				this.model.terminalForCellChanged(cell, null, false);
			}
		}
		
		cell.setTerminal(source, true);
		cell.setTerminal(target, false);
		
		var childCount = this.model.getChildCount(cell);
		
		for (var i=0; i<childCount; i++)
		{
			this.connect(this.model.getChildAt(cell, i), isConnect);
		}
	};
	
	/**
	 * Class: mxTerminalChange
	 * 
	 * Action to change a terminal in a model.
	 *
	 * Constructor: mxTerminalChange
	 * 
	 * Constructs a change of a terminal in the 
	 * specified model.
	 */
	function mxTerminalChange(model, cell, terminal, isSource)
	{
		this.model = model;
		this.cell = cell;
		this.terminal = terminal;
		this.previous = terminal;
		this.isSource = isSource;
	};

	/**
	 * Function: execute
	 * 
	 * Changes the terminal of <cell> to <previous> using
	 * <mxGraphModel.terminalForCellChanged>.
	 */
	mxTerminalChange.prototype.execute = function()
	{
		this.terminal = this.previous;
		this.previous = this.model.terminalForCellChanged(
			this.cell, this.previous, this.isSource);
	};
	
	/**
	 * Class: mxValueChange
	 * 
	 * Action to change a user object in a model.
	 *
	 * Constructor: mxValueChange
	 * 
	 * Constructs a change of a user object in the 
	 * specified model.
	 */
	function mxValueChange(model, cell, value)
	{
		this.model = model;
		this.cell = cell;
		this.value = value;
		this.previous = value;
	};

	/**
	 * Function: execute
	 * 
	 * Changes the value of <cell> to <previous> using
	 * <mxGraphModel.valueForCellChanged>.
	 */
	mxValueChange.prototype.execute = function()
	{
		this.value = this.previous;
		this.previous = this.model.valueForCellChanged(
			this.cell, this.previous);
	};
	
	/**
	 * Class: mxStyleChange
	 * 
	 * Action to change a cell's style in a model.
	 *
	 * Constructor: mxStyleChange
	 * 
	 * Constructs a change of a style in the
	 * specified model.
	 */
	function mxStyleChange(model, cell, style)
	{
		this.model = model;
		this.cell = cell;
		this.style = style;
		this.previous = style;
	};

	/**
	 * Function: execute
	 * 
	 * Changes the style of <cell> to <previous> using
	 * <mxGraphModel.styleForCellChanged>.
	 */
	mxStyleChange.prototype.execute = function()
	{
		this.style = this.previous;
		this.previous = this.model.styleForCellChanged(
			this.cell, this.previous);
	};
	
	/**
	 * Class: mxGeometryChange
	 * 
	 * Action to change a cell's geometry in a model.
	 *
	 * Constructor: mxGeometryChange
	 * 
	 * Constructs a change of a geometry in the
	 * specified model.
	 */
	function mxGeometryChange(model, cell, geometry)
	{
		this.model = model;
		this.cell = cell;
		this.geometry = geometry;
		this.previous = geometry;
	};

	/**
	 * Function: execute
	 * 
	 * Changes the geometry of <cell> ro <previous> using
	 * <mxGraphModel.geometryForCellChanged>.
	 */
	mxGeometryChange.prototype.execute = function()
	{
		this.geometry = this.previous;
		this.previous = this.model.geometryForCellChanged(
			this.cell, this.previous);
	};
	
	/**
	 * Class: mxCollapseChange
	 * 
	 * Action to change a cell's collapsed state in a model.
	 *
	 * Constructor: mxCollapseChange
	 * 
	 * Constructs a change of a collapsed state in the
	 * specified model.
	 */
	function mxCollapseChange(model, cell, collapsed)
	{
		this.model = model;
		this.cell = cell;
		this.collapsed = collapsed;
		this.previous = collapsed;
	};

	/**
	 * Function: execute
	 * 
	 * Changes the collapsed state of <cell> to <previous> using
	 * <mxGraphModel.collapsedStateForCellChanged>.
	 */
	mxCollapseChange.prototype.execute = function()
	{
		this.collapsed = this.previous;
		this.previous = this.model.collapsedStateForCellChanged(
			this.cell, this.previous);
	};
	
	/**
	 * Class: mxVisibleChange
	 * 
	 * Action to change a cell's visible state in a model.
	 *
	 * Constructor: mxVisibleChange
	 * 
	 * Constructs a change of a visible state in the
	 * specified model.
	 */
	function mxVisibleChange(model, cell, visible)
	{
		this.model = model;
		this.cell = cell;
		this.visible = visible;
		this.previous = visible;
	};

	/**
	 * Function: execute
	 * 
	 * Changes the visible state of <cell> to <previous> using
	 * <mxGraphModel.visibleStateForCellChanged>.
	 */
	mxVisibleChange.prototype.execute = function()
	{
		this.visible = this.previous;
		this.previous = this.model.visibleStateForCellChanged(
			this.cell, this.previous);
	};

	/**
	 * Class: mxCellAttributeChange
	 * 
	 * Action to change the attribute of a cell's user object.
	 * There is no method on the graph model that uses this
	 * action. To use the action, you can use the code shown
	 * in the example below.
	 * 
	 * Example:
	 * 
	 * To change the attributeName in the cell's user object
	 * to attributeValue, use the following code:
	 * 
	 * (code)
	 * model.beginUpdate();
	 * try
	 * {
	 *   var edit = new mxCellAttributeChange(
	 *     cell, attributeName, attributeValue);
	 *   model.execute(edit);
	 * }
	 * finally
	 * {
	 *   model.endUpdate();
	 * } 
     * (end)
	 *
	 * Constructor: mxCellAttributeChange
	 * 
	 * Constructs a change of a attribute of the DOM node
	 * stored as the value of the given <mxCell>.
	 */
	function mxCellAttributeChange(cell, attribute, value)
	{
		this.cell = cell;
		this.attribute = attribute;
		this.value = value;
		this.previous = value;
	};

	/**
	 * Function: execute
	 * 
	 * Changes the attribute of the cell's user object by
	 * using <mxCell.setAttribute>.
	 */
	mxCellAttributeChange.prototype.execute = function()
	{
		var tmp = this.cell.getAttribute(this.attribute);
		if (this.previous == null)
		{
			this.cell.value.removeAttribute(this.attribute);
		}
		else
		{
			this.cell.setAttribute(this.attribute, this.previous);
		}
		this.previous = tmp;
	};

}
