/**
 * $Id: mxGraphSelection.js,v 1.18 2009/01/25 10:23:13 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGraphSelection
 *
 * Represents the selection in a graph.
 *
 * Event: change
 *
 * Fired after cells have been selected or if the selection has been cleared.
 * First argument is the source <mxGraphSelection>, second argument is the
 * array of <mxCells> that have been added and the third argument is the
 * array of <mxCells> that have been removed.
 * 
 * Event: undo
 * 
 * Fired once after cells have been selected or deselected. For subsequent
 * undo/redo operations, this event does not fire. Note: You should not
 * normally add this to the command history. For dealing with selection
 * state in diagram editors you should add a listener to <mxUndoManager>
 * undo update the selection state according to the executed edits.
 */
{

	/**
	 * Constructor: mxGraphSelection
	 *
	 * Constructs a new graph selection model for the given <mxGraph>.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 */
	function mxGraphSelection(graph)
	{
		this.graph = graph;
		this.cells = new Array();
	};

	/**
	 * Extends mxEventSource.
	 */
	mxGraphSelection.prototype = new mxEventSource();
	mxGraphSelection.prototype.constructor = mxGraphSelection;

	/**
	 * Variable: doneResource
	 * 
	 * Specifies the resource key for the status message after a long operation.
	 * If the resource for this key does not exist then the value is used as
	 * the status message. Default is 'done'.
	 */
	mxGraphSelection.prototype.doneResource = (mxClient.language != 'none') ? 'done' : '';
	
	/**
	 * Variable: updatingSelectionResource
	 *
	 * Specifies the resource key for the status message while the selection is
	 * being updated. If the resource for this key does not exist then the
	 * value is used as the status message. Default is 'updatingSelection'.
	 */
	mxGraphSelection.prototype.updatingSelectionResource = (mxClient.language != 'none') ? 'updatingSelection' : '';

	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxGraphSelection.prototype.graph = null;

	/**
	 * Variable: singleSelection
	 *
	 * Specifies if only one selected item at a time is allowed.
	 * Default is false.
	 */
	mxGraphSelection.prototype.singleSelection = false;

	/**
	 * Function: isSingleSelection
	 *
	 * Returns <singleSelection> as a boolean.
	 */
	mxGraphSelection.prototype.isSingleSelection = function()
	{
		return this.singleSelection;
	};

	/**
	 * Function: setSingleSelection
	 *
	 * Sets the <singleSelection> flag.
	 * 
	 * Parameters:
	 * 
	 * singleSelection - Boolean that specifies the new value for
	 * <singleSelection>.
	 */
	mxGraphSelection.prototype.setSingleSelection = function(singleSelection)
	{
		this.singleSelection = singleSelection;
	};

	/**
	 * Function: isSelected
	 *
	 * Returns true if the given <mxCell> is selected.
	 */
	mxGraphSelection.prototype.isSelected = function(cell)
	{
		if (cell != null)
		{
			var state = this.graph.getView().getState(cell);
		
			return this.graph.hasHandler(state);
		}
		
		return false;
	};
	
	/**
	 * Function: clear
	 *
	 * Clears the selection and fires a <change> event if the selection was not
	 * empty.
	 */
	mxGraphSelection.prototype.clear = function()
	{
		this.changeSelection(null, this.cells);
	};

	/**
	 * Function: setCell
	 *
	 * Selects the specified <mxCell> using <setCells>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to be selected.
	 */
	mxGraphSelection.prototype.setCell = function(cell)
	{
		if (cell != null)
		{
			this.setCells([cell]);
		}
	};

	/**
	 * Function: setCells
	 *
	 * Selects the given array of <mxCells> and fires a <change> event.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be selected.
	 */
	mxGraphSelection.prototype.setCells = function(cells)
	{
		if (cells != null)
		{
			if (this.singleSelection)
			{
				cells = [this.getFirstSelectableCell(cells)];
			}
		
			var tmp = new Array();
			
			for (var i = 0; i < cells.length; i++)
			{
				if (this.graph.isSelectable(cells[i]))
				{
					tmp.push(cells[i]);
				}	
			}
	
			this.changeSelection(tmp, this.cells);
		}
	};

	/**
	 * Function: getFirstSelectableCell
	 *
	 * Returns the first selectable cell in the given array of cells.
	 */
	mxGraphSelection.prototype.getFirstSelectableCell = function(cells)
	{
		if (cells != null)
		{
			for (var i = 0; i < cells.length; i++)
			{
				if (this.graph.isSelectable(cells[i]))
				{
					return cells[i];
				}
			}
		}
		
		return null;
	};
	
	/**
	 * Function: addCell
	 * 
	 * Adds the given <mxCell> to the selection and fires a <select> event.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to add to the selection.
	 */
	mxGraphSelection.prototype.addCell = function(cell)
	{
		if (cell != null)
		{
			this.addCells([cell]);
		}
	};

	/**
	 * Function: addCells
	 * 
	 * Adds the given array of <mxCells> to the selection and fires a <select>
	 * event.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to add to the selection.
	 */
	mxGraphSelection.prototype.addCells = function(cells)
	{
		if (cells != null)
		{
			var remove = null;
			
			if (this.singleSelection)
			{
				remove = this.cells;
				cells = [this.getFirstSelectableCell(cells)];
			}
	
			var tmp = new Array();
			
			for (var i = 0; i < cells.length; i++)
			{
				if (!this.isSelected(cells[i]) &&
					this.graph.isSelectable(cells[i]))
				{
					tmp.push(cells[i]);
				}	
			}

			this.changeSelection(tmp, remove);
		}
	};

	/**
	 * Function: removeCell
	 *
	 * Removes the specified <mxCell> from the selection and fires a <select>
	 * event for the remaining cells.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to remove from the selection.
	 */
	mxGraphSelection.prototype.removeCell = function(cell)
	{
		if (cell != null)
		{
			this.removeCells([cell]);
		}
	};
	
	/**
	 * Function: removeCells
	 */
	mxGraphSelection.prototype.removeCells = function(cells)
	{
		if (cells != null)
		{
			var tmp = new Array();
			
			for (var i = 0; i < cells.length; i++)
			{
				if (this.isSelected(cells[i]))
				{
					tmp.push(cells[i]);
				}
			}
			
			this.changeSelection(null, tmp);	
		}
	};
	
	/**
	 * Function: changeSelection
	 *
	 * Inner callback to add the specified <mxCell> to the selection. No event
	 * is fired in this implementation.
	 * 
	 * Paramters:
	 * 
	 * cell - <mxCell> to add to the selection.
	 */
	mxGraphSelection.prototype.changeSelection = function(added, removed)
	{
		if ((added != null &&
			added.length > 0 &&
			added[0] != null) ||
			(removed != null &&
			removed.length > 0 &&
			removed[0] != null))
		{
			var change = new mxSelectionChange(this, added, removed);
			change.execute();
			
			var edit = new mxUndoableEdit(this, false);
			edit.add(change);
			
			this.dispatchEvent('undo', this, edit);
		}
	};

	/**
	 * Function: cellAdded
	 *
	 * Inner callback to add the specified <mxCell> to the selection. No event
	 * is fired in this implementation.
	 * 
	 * Paramters:
	 * 
	 * cell - <mxCell> to add to the selection.
	 */
	mxGraphSelection.prototype.cellAdded = function(cell)
	{
		if (cell != null)
		{
			var state = this.graph.getView().getState(cell);
			
			if (!this.graph.hasHandler(state))
			{
				this.graph.createHandler(state);
				this.cells.push(cell);
			}
		}
	};

	/**
	 * Function: cellRemoved
	 *
	 * Inner callback to remove the specified <mxCell> from the selection. No
	 * event is fired in this implementation.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to remove from the selection.
	 */
	mxGraphSelection.prototype.cellRemoved = function(cell)
	{
		if (cell != null)
		{
			var index = mxUtils.indexOf(this.cells, cell);
			
			if (index >= 0)
			{
				var state = this.graph.getView().getState(cell);
				this.graph.destroyHandler(state);
				this.cells.splice(index, 1);
			}
		}
	};
	
	/**
	 * Class: mxCurrentRootChange
	 *
	 * Action to change the current root in a view.
	 *
	 * Constructor: mxCurrentRootChange
	 *
	 * Constructs a change of the current root in the given view.
	 */
	function mxSelectionChange(selection, added, removed)
	{
		this.selection = selection;
		this.added = (added != null) ? added.slice() : null;
		this.removed = (removed != null) ? removed.slice() : null;
	};

	/**
	 * Function: execute
	 *
	 * Changes the current root of the view.
	 */
	mxSelectionChange.prototype.execute = function()
	{
		var t0 = mxLog.enter('mxSelectionChange.execute');
		window.status = mxResources.get(
			this.selection.updatingSelectionResource) ||
			this.selection.updatingSelectionResource;

		if (this.removed != null)
		{
			for (var i = 0; i < this.removed.length; i++)
			{
				this.selection.cellRemoved(this.removed[i]);
			}
		}

		if (this.added != null)
		{
			for (var i = 0; i < this.added.length; i++)
			{
				this.selection.cellAdded(this.added[i]);
			}
		}
		
		var tmp = this.added;
		this.added = this.removed;
		this.removed = tmp;

		window.status = mxResources.get(this.selection.doneResource) ||
			this.selection.doneResource;
		mxLog.leave('mxSelectionChange.execute', t0);
		
		this.selection.dispatchEvent('change', this, this.removed, this.added);
	};

}
