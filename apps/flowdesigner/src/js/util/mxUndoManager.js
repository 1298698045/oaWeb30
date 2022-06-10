/**
 * $Id: mxUndoManager.js,v 1.14 2008/07/10 15:35:37 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxUndoManager
 *
 * Implements a command history. When changing the graph model, an
 * <mxUndoableChange> object is created at the start of the transaction (when
 * model.beginUpdate is called). All atomic changes are then added to this
 * object until the last model.endUpdate call, at which point the
 * <mxUndoableEdit> is dispatched in an event, and added to the history inside
 * <mxUndoManager>. This is done by an event listener in
 * <mxEditor.installUndoHandler>.
 * 
 * Each atomic change of the model is represented by an object (eg.
 * <mxRootChange>, <mxChildChange>, <mxTerminalChange> etc) which contains the
 * complete undo information. The <mxUndoManager> also listens to the
 * <mxGraphView> and stores it's changes to the current root as insignificant
 * undoable changes, so that drilling (step into, step up) is undone.
 * 
 * This means when you execute an atomic change on the model, then change the
 * current root on the view and click undo, the change of the root will be
 * undone together with the change of the model so that the display represents
 * the state at which the model was changed. However, these changes are not
 * transmitted for sharing as they do not represent a state change.
 *
 * Example:
 * 
 * When adding an undo manager to a graph, make sure to add it
 * to the model and the view as well to maintain a consistent
 * display across multiple undo/redo steps.
 *
 * (code)
 * var undoManager = new mxUndoManager();
 * var listener = function(sender, edit)
 * {
 *   undoManager.undoableEditHappened(edit);
 * };
 * graph.getModel().addListener('undo', listener);
 * graph.getView().addListener('undo', listener);
 * (end)
 * 
 * The code creates a function that informs the undoManager
 * of an undoable edit and binds it to the undo event of
 * <mxGraphModel> and <mxGraphView> using
 * <mxEventSource.addListener>.
 * 
 * Event: add
 * 
 * Fires after a new undoable edit has been added to the histry. First argument
 * is the source <mxUndoManager>, second argument is the <mxUndoableEdit> that
 * has been added.
 * 
 * Event: undo
 * 
 * Fired after a significant edit has been undone. First argument is the source
 * <mxUndoManager>, second argument is the significant <mxUndoableEdit> that
 * has been undone. The event is only fired for significant events.
 * 
 * Event: redo
 * 
 * Same as above for redo operations.
 */
{

	/**
	 * Constructor: mxUndoManager
	 *
	 * Constructs a new undo manager with the given history size. If no history
	 * size is given, then a default size of 100 steps is used.
	 */
	function mxUndoManager(size)
	{
		this.size = size || 100;
		this.reset();
	};

	/**
	 * Extends mxEventSource.
	 */
	mxUndoManager.prototype = new mxEventSource();
	mxUndoManager.prototype.constructor = mxUndoManager;

	/**
	 * Variable: size
	 * 
	 * Maximum command history size. Default is 100.
	 */
	mxUndoManager.prototype.size = null;

	/**
	 * Variable: history
	 * 
	 * Array that contains the steps of the command history.
	 */
	mxUndoManager.prototype.history = null;

	/**
	 * Variable: indexOfNextAdd
	 * 
	 * Index of the element to be added next.
	 */
	mxUndoManager.prototype.indexOfNextAdd = 0;
	
	/**
	 * Function: reset
	 * 
	 * Resets the command history.
	 */
	mxUndoManager.prototype.reset = function()
	{
		this.history = new Array();
		this.indexOfNextAdd = 0;
	};

	/**
	 * Function: canUndo
	 * 
	 * Returns true if an undo is possible.
	 */
	mxUndoManager.prototype.canUndo = function()
	{
		return this.indexOfNextAdd > 0;
	};

	/**
	 * Function: undo
	 * 
	 * Undoes the last change.
	 */
	mxUndoManager.prototype.undo = function()
	{
        while (this.indexOfNextAdd > 0)
        {
            var edit = this.history[--this.indexOfNextAdd];
            edit.undo();

			if (edit.isSignificant())
            {
            	this.dispatchEvent('undo', this, edit);
                break;
            }
        }
	};

	/**
	 * Function: canRedo
	 * 
	 * Returns true if a redo is possible.
	 */
	mxUndoManager.prototype.canRedo = function()
	{
		return this.indexOfNextAdd < this.history.length;
	};

	/**
	 * Function: redo
	 * 
	 * Redoes the last change.
	 */
	mxUndoManager.prototype.redo = function()
	{
        var n = this.history.length;
        
        while (this.indexOfNextAdd < n)
        {
            var edit =  this.history[this.indexOfNextAdd++];
            edit.redo();
            
            if (edit.isSignificant())
            {
            	this.dispatchEvent('redo', this, edit);
                break;
            }
        }
	};
	
	/**
	 * Function: undoableEditHappened
	 * 
	 * Method to be called to add new undoable edits to the <history>.
	 */
	mxUndoManager.prototype.undoableEditHappened = function(undoableEdit)
	{
		this.trim();
		
		if (this.size == this.history.length)
		{
			this.history.shift();
		}
		
		this.history.push(undoableEdit);
		this.indexOfNextAdd = this.history.length;
		
    	this.dispatchEvent('add', this, undoableEdit);
	};

	/**
	 * Function: trim
	 * 
	 * Removes all pending steps after <indexOfNextAdd> from the history,
	 * invoking die on each edit. This is called from <undoableEditHappened>.
	 */
	mxUndoManager.prototype.trim = function()
	{
		if (this.history.length > this.indexOfNextAdd)
		{
			var edits = this.history.splice(this.indexOfNextAdd,
				this.history.length-this.indexOfNextAdd);
				
			for(var i = 0; i < edits.length; i++)
			{
				edits[i].die();
			}
		}
	};

}
