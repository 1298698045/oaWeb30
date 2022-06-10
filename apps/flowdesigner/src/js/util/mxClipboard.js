/**
 * $Id: mxClipboard.js,v 1.18 2008/07/10 09:23:34 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxClipboard
 * 
 * Singleton that implements a clipboard for graph cells.
 *
 * Example:
 * 
 * (code)
 * mxClipboard.copy(graph);
 * mxClipboard.paste(graph2);
 * (end)
 *
 * This copies the selection cells from the graph to the
 * clipboard and pastes them into graph2.
 * 
 * For fine-grained control of the clipboard data the <mxGraph.canExport>
 * and <mxGraph.canImport> functions can be overridden.
 */
var mxClipboard =
{
	/**
	 * Variable: STEPSIZE
	 * 
	 * Defines the step size to offset the cells
	 * after each paste operation. Default is 10.
	 */
	STEPSIZE: 10,

	/**
	 * Variable: insertCount
	 * 
	 * Counts the number of times the clipboard data has been inserted.
	 */
	insertCount: 1,

	/**
	 * Variable: cells
	 * 
	 * Holds the array of <mxCells> currently in the clipboard.
	 */
	cells: null,
	
	/**
	 * Function: isEmpty
	 * 
	 * Returns true if the clipboard currently has not data stored.
	 */
	isEmpty: function()
	{
		return mxClipboard.cells == null;
	},

	/**
	 * Function: cut
	 * 
	 * Cuts the given array of <mxCells> from the specified graph.
	 * If cells is null then the selection cells of the graph will
	 * be used. Returns the cells that have been cut from the graph.
	 *
	 * Parameters:
	 * 
	 * graph - <mxGraph> that contains the cells to be cut.
	 * cells - Optional array of <mxCells> to be cut.
	 */
	cut: function(graph, cells)
	{
		cells = mxClipboard.copy(graph, cells);
		mxClipboard.insertCount = 0;
		graph.dispatchEvent('beforeCut', graph, cells);
		graph.remove(cells);
		graph.dispatchEvent('afterCut', graph, cells);
		
		return cells;
	},

	/**
	 * Function: copy
	 * 
	 * Copies the given array of <mxCells> from the specified
	 * graph to <cells>.Returns the original array of cells that has
	 * been cloned.
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> that contains the cells to be copied.
	 * cells - Optional array of <mxCells> to be copied.
	 */
	copy: function(graph, cells)
	{
		cells = cells || graph.getSelectionCells();
		var result = new Array();
		graph.dispatchEvent('beforeCopy', graph, cells);
		
		// Filters the cells that can be exported
		for (var i = 0; i < cells.length; i++)
		{
			var cell = cells[i];

			if (cells[i] != null &&
				graph.canExport(cells[i]))
			{
				result.push(cell);
			}
		}
		
		mxClipboard.insertCount = 1;
		mxClipboard.cells = graph.cloneCells(result);
		graph.dispatchEvent('afterCopy', graph, mxClipboard.cells, result);

		return result;
	},

	/**
	 * Function: paste
	 * 
	 * Pastes the <cells> into the specified graph restoring
	 * the relation to <parents>, if possible. If the parents
	 * are no longer in the graph or invisible then the
	 * cells are added to the graph's default or into the
	 * swimlane under the cell's new location if one exists.
	 * While the cells are being added a <mxGraph.paste> event
	 * is fired. After the display has been updated, a
	 * <mxGraph.pasted> event is fired for the inserted cells.
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> to paste the <cells> into.
	 */
	paste: function(graph)
	{
		if (mxClipboard.cells != null)
		{
			graph.dispatchEvent('beforePaste', graph, mxClipboard.cells);
			var cells = new Array();

			// Filters the cells that can be imported
			for (var i = 0; i < mxClipboard.cells.length; i++)
			{
				if (graph.canImport(mxClipboard.cells[i]))
				{
					cells.push(mxClipboard.cells[i]);
				}
			}
			
			cells = graph.move(cells, mxClipboard.insertCount * mxClipboard.STEPSIZE,
				mxClipboard.insertCount * mxClipboard.STEPSIZE, true);
			graph.dispatchEvent('paste', graph, cells);
			
			// Increments the counter and selects the inserted cells
			mxClipboard.insertCount++;
			graph.setSelectionCells(cells);
			graph.dispatchEvent('afterPaste', graph, cells);
		}
	}

};
