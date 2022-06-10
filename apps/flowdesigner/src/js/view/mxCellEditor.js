/**
 * $Id: mxCellEditor.js,v 1.28 2008/07/28 07:53:25 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCellEditor
 *
 * In-place editor for the graph.
 *
 * Example:
 * 
 * To only allow numeric input in the in-place editor, use the following code.
 *
 * (code)
 * var text = graph.editor.textarea;
 * 
 * mxEvent.addListener(text, 'keydown', function (evt)
 * {
 *   if (!(evt.keyCode >= 48 && evt.keyCode <= 57) &&
 *       !(evt.keyCode >= 96 && evt.keyCode <= 105))
 *   {
 *     mxEvent.consume(evt);
 *   }
 * }); 
 * (end) 
 */
{

	/**
	 * Constructor: mxCellEditor
	 *
	 * Constructs a new in-place editor for the specified graph.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the enclosing <mxGraph>.
	 */
	function mxCellEditor(graph)
	{
		this.graph = graph;

		this.textarea = document.createElement('textarea');

		this.textarea.className = 'mxCellEditor';
		this.textarea.style.position = 'absolute';
		this.textarea.style.overflow = 'visible';
		
		this.textarea.setAttribute('cols', '20');
		this.textarea.setAttribute('rows', '4');

		// If this line and the redirection in mxRubberband are
		// removed, then IE does not leak the div and textarea.
		this.init();
	};
		
	/**
	 * Variable: graph
	 * 
	 * Reference to the enclosing <mxGraph>.
	 */
	mxCellEditor.prototype.graph = null;
		
	/**
	 * Variable: textarea
	 *
	 * Holds the input textarea.
	 */
	mxCellEditor.prototype.textarea = null;
			
	/**
	 * Variable: cell
	 * 
	 * Reference to the <mxCell> that is currently being edited.
	 */
	mxCellEditor.prototype.cell = null;
				
	/**
	 * Variable: emptyLabelText
	 * 
	 * Text to be displayed for empty labels. Default is ''. This can be set
	 * to eg. "[Type Here]" to easier visualize editing of empty labels. The
	 * value is only displayed before the first keystroke and is never used
	 * as the actual editin value.
	 */
	mxCellEditor.prototype.emptyLabelText = '';

	/**
	 * Function: init
	 *
	 * Installs the event listeners into the textarea.
	 */
	mxCellEditor.prototype.init = function ()
	{
		var self = this; // closure
		mxEvent.addListener(this.textarea, 'blur', function (evt)
		{
			self.stopEditing(false);
		});
		
		mxEvent.addListener(this.textarea, 'keydown', function (evt)
		{
			// Clears the initial empty label on the first keystroke
			if (self.clearOnChange)
			{
				self.clearOnChange = false;
				self.textarea.value = '';
			}
			
			// Updates the modified flag for storing the value
			self.modified = true;
		});
	};

	/**
	 * Function: startEditing
	 *
	 * Starts the editor for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to start editing.
	 * trigger - Optional mouse event that triggered the editor.
	 */
	mxCellEditor.prototype.startEditing = function (cell, trigger)
	{
		this.stopEditing(true);
		
		var state = this.graph.getView().getState(cell);
		
		if (state != null)
		{
			this.cell = cell;
			this.trigger = trigger;
			this.textNode = null;
					
			if (state.text != null)
			{
				if (this.isHideLabel(state))
				{
					this.textNode = state.text.node;
					this.textNode.style.visibility = 'hidden';
				}
				
				var scale = this.graph.getView().scale;
				this.textarea.style.fontSize = state.text.size * scale;
				this.textarea.style.fontFamily = state.text.family;
				this.textarea.style.color = state.text.color;
				
				// Replace white with something dark to keep it visible
				if (this.textarea.style.color == 'white')
				{
					this.textarea.style.color = 'black';
				}
	
				this.textarea.style.textAlign = (this.graph.model.isEdge(state.cell)) ?
					'left' : (state.text.align || 'left');
				this.textarea.style.fontWeight =
					state.text.isStyleSet(mxConstants.FONT_BOLD) ?
						'bold' : 'normal';
			}
			
			var bounds = this.getEditorBounds(state);
	
			this.textarea.style.left = bounds.x+'px';
			this.textarea.style.top = bounds.y+'px';
			this.textarea.style.width = bounds.width+'px';
			this.textarea.style.height = bounds.height+'px';
			this.textarea.style.zIndex = 5;
	
			var value = this.graph.getEditingValue(cell, trigger);
	
			// Uses an optional text value for empty labels which is cleared
			// when the first keystroke appears. This makes it easier to see
			// that a label is being edited even if the label is empty.
			if (value == null ||
				value.length == 0)
			{
				value = this.getEmptyLabelText();
				this.clearOnChange = true;
			}
			else
			{
				this.clearOnChange = false;
			}
			
			this.modified = false;		
			this.textarea.value = value;
			this.graph.container.appendChild(this.textarea);
			
			this.textarea.focus();
			this.textarea.select();
		}
	};
	
	/**
	 * Function: isHideLabel
	 * 
	 * Returns true if the label should be hidden while the cell is being
	 * edited.
	 */
	 mxCellEditor.prototype.isHideLabel = function(state)
	 {
	 	return true;
	 };
	
	/**
	 * Function: getEditorBounds
	 * 
	 * Returns the <mxRectangle> that defines the bounds of the editor.
	 */
	 mxCellEditor.prototype.getEditorBounds = function(state)
	 {
		var scale = this.graph.getView().scale;
	 	var minHeight = (state.text == null) ? 30 :  state.text.size * scale + 20;
		var minWidth = (this.textarea.style.textAlign == 'left') ? 120 : 40;
		
		var spacing = parseInt(state.style[mxConstants.STYLE_SPACING] || 2) * scale;
		var spacingTop = (parseInt(state.style[mxConstants.STYLE_SPACING_TOP] ||
			0)) * scale + spacing;
		var spacingRight = (parseInt(state.style[mxConstants.STYLE_SPACING_RIGHT] ||
			0)) * scale + spacing;
		var spacingBottom = (parseInt(state.style[mxConstants.STYLE_SPACING_BOTTOM] ||
			0)) * scale + spacing;
		var spacingLeft = (parseInt(state.style[mxConstants.STYLE_SPACING_LEFT] ||
			0)) * scale + spacing;

	 	var result = new mxRectangle(state.x, state.y,
	 		 Math.max(minWidth, state.width - spacingLeft - spacingRight),
	 		 Math.max(minHeight, state.height - spacingTop - spacingBottom));

		if (this.graph.getModel().isEdge(state.cell))
		{
			result.x = state.absoluteOffset.x;
			result.y = state.absoluteOffset.y;

			if (state.text != null &&
				state.text.boundingBox != null)
			{
				result.x = state.text.boundingBox.x;
				result.y = state.text.boundingBox.y;
			}
		}
		else if (state.text != null &&
			state.text.boundingBox != null)
		{
			result.x = Math.min(result.x, state.text.boundingBox.x);
			result.y = Math.min(result.y, state.text.boundingBox.y);
		}

		result.x += spacingLeft;
		result.y += spacingTop;

		if (state.text != null &&
			state.text.boundingBox != null)
		{
			result.width = Math.max(result.width, state.text.boundingBox.width);
			result.height = Math.max(result.height, state.text.boundingBox.height);
		}
		
		return result;
	};

	/**
	 * Function: getEmptyLabelText
	 *
	 * Returns the initial label value to be used of the label of the given
	 * cell is empty. This label is displayed and cleared on the first keystroke.
	 * This implementation returns <emptyLabelText>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which a text for an empty editing box should be
	 * returned.
	 */
	mxCellEditor.prototype.getEmptyLabelText = function (cell)
	{
		return this.emptyLabelText;
	};

	/**
	 * Function: isEditing
	 *
	 * Returns true if the given cell is currently being edited. If no cell is
	 * given, then it returns true if any cell is currently being edited.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> to check if it's being edited.
	 */
	mxCellEditor.prototype.isEditing = function (cell)
	{
		return (cell == null) ? this.cell != null : this.cell == cell;
	};

	/**
	 * Function: stopEditing
	 *
	 * Stops the editor and applies the value if cancel is false.
	 */
	mxCellEditor.prototype.stopEditing = function (cancel)
	{
		cancel = cancel || false;
		
		if (this.cell != null)
		{
			if (this.textNode != null)
			{
				this.textNode.style.visibility = 'visible';
				this.textNode = null;
			}
			
			if (!cancel && this.modified)
			{
				this.graph.labelChanged(this.cell,
					this.textarea.value.replace(/\r/g, ''),
					this.trigger);
			}
			
			this.cell = null;
			this.trigger = null;
			this.textarea.blur();
			this.textarea.parentNode.removeChild(this.textarea);
		}
	};

	/**
	 * Function: destroy
	 *
	 * Destroys the editor and removes all associated resources.
	 */
	mxCellEditor.prototype.destroy = function ()
	{
		mxUtils.release(this.textarea);
		
		if (this.textarea.parentNode != null)
		{
			this.textarea.parentNode.removeChild(this.textarea);
		}
		
		this.textarea = null;
	};

}
