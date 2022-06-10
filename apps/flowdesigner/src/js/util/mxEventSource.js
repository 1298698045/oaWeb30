/**
 * $Id: mxEventSource.js,v 1.12 2008/07/04 07:37:00 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxEventSource
 *
 * Base class for objects that dispatch named events. To create a subclass that
 * inherits from mxEventSource, the following code is used.
 *
 * (code)
 * function MyClass() { };
 *
 * MyClass.prototype = new mxEventSource();
 * MyClass.prototype.constructor = MyClass;
 * (end)
 *
 * Known Subclasses:
 *
 * <mxGraphModel>, <mxGraph>, <mxGraphView>, <mxEditor>, <mxOverlay>,
 * <mxToolbar>, <mxWindow>
 */
{

	/**
	 * Constructor: mxEventSource
	 *
	 * Constructs a new event source.
	 */
	function mxEventSource() { };

	/**
	 * Variable: eventListeners
	 *
	 * Holds the event names and associated listeners in an array. The array
	 * contains the event name followed by the respective listener for each
	 * registered listener.
	 */
	mxEventSource.prototype.eventListeners = null;
	
	/**
	 * Variable: eventsEnabled
	 *
	 * Specifies if events can be fired. Default is true.
	 */
	mxEventSource.prototype.eventsEnabled = true;
	
	/**
	 * Function: addListener
	 *
	 * Binds the specified function to the given event name. If no event name
	 * is given, then the listener is registered for all events.
	 *
	 * Example:
	 *
	 * (code)
	 * eventSource.addListener('valueChanged',
	 *   function(sender, oldValue, newValue)
	 *   {
	 *     mxLog.show();
	 *     mxLog.debug(oldValue+' changed to '+newValue);
	 *   }
	 * );
	 * (end)
	 *
	 * The code binds the function with its argument to the
	 * valueChanged event in the eventSource.
	 */
	mxEventSource.prototype.addListener = function(name, funct)
	{
		if (this.eventListeners == null)
		{
			this.eventListeners = new Array();
		}
		
		this.eventListeners.push(name);
		this.eventListeners.push(funct);
	};
	
	/**
	 * Function: removeListener
	 *
	 * Removes the given listener from the list of listeners.
	 */
	mxEventSource.prototype.removeListener = function(funct)
	{
		if (this.eventListeners != null)
		{
			var i = 0;
			
			while (i < this.eventListeners.length)
			{
				if (this.eventListeners[i+1] == funct)
				{
					this.eventListeners.splice(i, 2);
				}
				else
				{
					i += 2;
				}
			}
		}
	};
	
	/**
	 * Function: dispatchEvent
	 *
	 * Dispatches the given event name, passing all arguments after the given
	 * name to the registered listeners (functions) for the event.
	 *
	 * Example:
	 *
	 * (code)
	 * this.dispatchEvent('valueChanged', this, oldValue, newValue);
	 * (end)
	 */
	mxEventSource.prototype.dispatchEvent = function(name)
	{
		if (this.eventListeners != null &&
			this.eventsEnabled)
		{
			var args = null;
			
			for (var i = 0; i < this.eventListeners.length; i += 2)
			{
				var listen = this.eventListeners[i];
				
				if (listen == null ||
					listen == name)
				{
					// Lazyly creates the args array. NOTE: Slice function
					// is not available on the global arguments array
					if (args == null)
					{
						args = new Array();
						var argCount = arguments.length;
						
						for (var j = 1; j < argCount; j++)
						{
							args.push(arguments[j]);
						}
					}
					
					this.eventListeners[i+1].apply(this, args);
				}
			}
		}
	};

}
