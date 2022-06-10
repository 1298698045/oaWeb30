/**
 * $Id: mxKeyHandler.js,v 1.27 2008/07/29 09:16:06 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxKeyHandler
 *
 * Event handler that listens to keystroke events. This is not a singleton,
 * however, it is normally only required once if the target is the document
 * element (default).
 * 
 * This handler installs a key event listener in the topmost DOM node and
 * processes all events that originate from descandants of <mxGraph.container>
 * or from the topmost DOM node. The latter means that all unhandled keystrokes
 * are handled by this object regardless of the focused state of the <graph>.
 * 
 * Example:
 * 
 * (code)
 * var keyHandler = new mxKeyHandler(graph);
 * keyHandler.bindKey(46, function(evt)
 * {
 *   if (graph.isEnabled())
 *   {
 *     graph.remove();
 *   }
 * });
 * (end)
 * 
 * Keycodes:
 * 
 * See http://tinyurl.com/yp8jgl or http://tinyurl.com/229yqw for a list of
 * keycodes or install a key event listener into the document element and print
 * the key codes of the respective events to the console.
 */
{

	/**
	 * Constructor: mxKeyHandler
	 *
	 * Constructs an event handler that executes functions bound to specific
	 * keystrokes.
	 * 
	 * Parameters:
	 * 
	 * graph - Reference to the associated <mxGraph>.
	 * target - Optional reference to the event target. If null, the document
	 * element is used as the event target, that is, the object where the key
	 * event listener is installed.
	 */
	function mxKeyHandler(graph, target)
	{
		if (graph != null)
		{
			this.graph = graph;
			this.target = target || document.documentElement;
			
			// Creates the arrays to map from keycodes to functions
			this.normalKeys = new Array();
			this.controlKeys = new Array();
	
			// Installs the keystroke listener in the target
			var self = this; // closure
			mxEvent.addListener(this.target, "keydown", function (evt)
			{
				self.keyDown(evt);
			});
			
			// Automatically deallocates memory in IE
			if (mxClient.IS_IE)
			{
				mxEvent.addListener(window, 'unload', function()
				{
					self.destroy();
				});
			}
		}
	};
	
	/**
	 * Variable: graph
	 * 
	 * Reference to the <mxGraph> associated with this handler.
	 */
	mxKeyHandler.prototype.graph = null;

	/**
	 * Variable: target
	 * 
	 * Reference to the target DOM, that is, the DOM node where the key event
	 * listeners are installed.
	 */
	mxKeyHandler.prototype.target = null;

	/**
	 * Variable: normalKeys
	 * 
	 * Maps from keycodes to functions for non-pressed control keys.
	 */
	mxKeyHandler.prototype.normalKeys = null;

	/**
	 * Variable: controlKeys
	 * 
	 * Maps from keycodes to functions for pressed control keys.
	 */
	mxKeyHandler.prototype.controlKeys = null;

	/**
	 * Variable: enabled
	 * 
	 * Specifies if events are handled. Default is true.
	 */
	mxKeyHandler.prototype.enabled = true;
	
	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation returns
	 * <enabled>.
	 */
	mxKeyHandler.prototype.isEnabled = function()
	{
		return this.enabled;
	};

	/**
	 * Function: setEnabled
	 * 
	 * Enables or disables event handling by updating <enabled>.
	 * 
	 * Parameters:
	 * 
	 * enabled - Boolean that specifies the new enabled state.
	 */
	mxKeyHandler.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};
	
	/**
	 * Function: bindKey
	 * 
	 * Binds the specified keycode to the given function. This binding is used
	 * if the control key is not pressed.
	 * 
	 * Parameters:
	 *
	 * code - Integer that specifies the keycode.
	 * funct - JavaScript function that takes the key event as an argument.
	 */
	mxKeyHandler.prototype.bindKey = function(code, funct)
	{
		this.normalKeys[code] = funct;
	};
	
	/**
	 * Function: bindKey
	 * 
	 * Binds the specified keycode to the given function. This binding is used
	 * if the control key is pressed.
	 * 
	 * Parameters:
	 *
	 * code - Integer that specifies the keycode.
	 * funct - JavaScript function that takes the key event as an argument.
	 */
	mxKeyHandler.prototype.bindControlKey = function(code, funct)
	{
		this.controlKeys[code] = funct;
	};
		
	/**
	 * Function: getFunction
	 * 
	 * Returns the function associated with the given key event or null if no
	 * function is associated with the given event.
	 * 
	 * Parameters:
	 * 
	 * evt - Key event whose associated function should be returned.
	 */
	mxKeyHandler.prototype.getFunction = function(evt)
	{
		if (evt != null)
		{
			return (evt.ctrlKey) ?
				this.controlKeys[evt.keyCode] :
				this.normalKeys[evt.keyCode];
		}
		
		return null;
	};
		
	/**
	 * Function: isGraphEvent
	 * 
	 * Returns true if the event should be processed by this handler, that is,
	 * if the event source is either the target, one of its direct children, a
	 * descendant of the <mxGraph.container>, or the <mxGraph.editor> of the
	 * <graph>.
	 * 
	 * Parameters:
	 * 
	 * evt - Key event that represents the keystroke.
	 */
	mxKeyHandler.prototype.isGraphEvent = function(evt)
	{
		var source = mxEvent.getSource(evt);
		
		// Accepts events from the target object or
		// in-place editing inside graph
		if ((source == this.target ||
			source.parentNode == this.target) ||
			(this.graph.editor != null &&
			source == this.graph.editor.textarea))
		{
			return true;
		}
		
		// Accepts events from inside the container
		var elt = source;
		
		while (elt != null)
		{
			if (elt == this.graph.container)
			{
				return true;
			}
			
			elt = elt.parentNode;
		}
		
		return false;
	};

	/**
	 * Function: keyDown
	 * 
	 * Handles the event by invoking the function bound to the respective
	 * keystroke if <mxGraph.isEnabled>, <isEnabled> and <isGraphEvent> all
	 * return true for the given event and <mxGraph.isEditing> returns false.
	 * If the graph is editing only the <enter> and <escape> cases are handled
	 * by calling the respective hooks.
	 * 
	 * Parameters:
	 * 
	 * evt - Key event that represents the keystroke.
	 */
	mxKeyHandler.prototype.keyDown = function(evt)
	{
		if (this.graph.isEnabled() &&
			this.isGraphEvent(evt) &&
			this.isEnabled())
		{
			// Applies the editing if enter or F2 is pressed
			if (this.graph.isEditing() &&
				((evt.keyCode == 13 /* Enter */ &&
				!evt.ctrlKey &&
				!evt.shiftKey) ||
				(evt.keyCode == 113 /* F2 */)))
			{
				this.enter(evt);
			}

			// Cancels the editing if escape is pressed
			else if (evt.keyCode == 27 /* Escape */)
			{
				this.escape(evt);
			}
			
			// Invokes the function for the keystroke
			else if (!this.graph.isEditing())
			{
				var boundFunction = this.getFunction(evt);
				
				if (boundFunction != null)
				{
					boundFunction(evt);
					mxEvent.consume(evt);
				}
			}
		}
	};

	/**
	 * Function: enter
	 * 
	 * Hook to process ENTER and F2 keystrokes while a value is being edited.
	 * This implementation invokes <mxGraph.stopEditing> to apply the current
	 * editing value.
	 * 
	 * Parameters:
	 * 
	 * evt - Key event that represents the keystroke. Possible keycodes in this
	 * case are 13 (ENTER) or 113 (F2).
	 */
	mxKeyHandler.prototype.enter = function(evt)
	{
		this.graph.editor.stopEditing(false);
	};

	/**
	 * Function: escape
	 * 
	 * Hook to process ESCAPE keystrokes. This implementation invokes
	 * <mxGraph.stopEditing> to cancel the current editing, connecting
	 * and/or other ongoing modifications.
	 * 
	 * Parameters:
	 * 
	 * evt - Key event that represents the keystroke. Possible keycode in this
	 * case is 27 (ESCAPE).
	 */
	mxKeyHandler.prototype.escape = function(evt)
	{
		this.graph.escape(evt);
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its references into the DOM. This does
	 * normally not need to be called, it is called automatically when the
	 * window unloads (in IE).
	 */
	mxKeyHandler.prototype.destroy = function()
	{
		this.target = null;
	};

}
