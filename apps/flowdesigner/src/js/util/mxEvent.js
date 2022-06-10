/**
 * $Id: mxEvent.js,v 1.27 2008/11/18 09:11:15 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxEvent
 * 
 * Cross-browser DOM event support. For internal event handling,
 * <mxEventSource> and the graph event dispatch loop in <mxGraph> are used.
 * 
 * Memory Leaks:
 * 
 * Use this class for adding and removing listeners to/from DOM nodes. The
 * <removeAllListeners> function is provided to remove all listeners that
 * have been added using <addListener>. The function should be invoked when
 * the last reference is removed in the JavaScript code, typically when the
 * referenced DOM node is removed from the DOM, and helps to reduce memory
 * leaks in IE6.
 */
var mxEvent =
{

	/**
	 * Function: addListener
	 *
	 * Binds the function to the specified event on the given element.
	 */
	addListener: function()
	{
		var updateListenerList = function(element, eventName, funct)
		{
			if (element.mxListenerList == null)
			{
				element.mxListenerList = new Array();
			}
			
			var entry = {name: eventName, f: funct};
			element.mxListenerList.push(entry);
		}
		
		if (mxClient.IS_IE)
		{
			return function(element, eventName, funct)
			{
				element.attachEvent("on" + eventName, funct);
				updateListenerList(element, eventName, funct);				
			}
		}
		else
		{
			return function(element, eventName, funct)
			{
				element.addEventListener(eventName, funct, false);
				updateListenerList(element, eventName, funct);
			}
		}
	}(),
	
	/**
	 * Function: redirectMouseEvents
	 *
	 * Redirects the mouse events from the given element to the graph dispatch
	 * loop using the event and given cell and index as parameters.
	 */
	redirectMouseEvents: function(element, graph, cell, index, transparent)
	{
		// Workaround for selection border overlapping cells on top of the given
		// (selection) cell, in which case those cells are ignored if the given
		// cell is used without checking if there is another cell
		var checkCell = function(evt)
		{
			if (transparent &&
				mxClient.IS_IE)
			{
				var pt = mxUtils.convertPoint(graph.container,
						evt.clientX, evt.clientY);
				var tmp = graph.getCellAt(pt.x, pt.y);
				
				if (cell != tmp &&
					(!graph.isSwimlane(cell) ||
					!graph.hitsSwimlaneContent(cell, pt.x, pt.y)))
				{
					return tmp;
				}
			}
			
			return cell;
		};
		
		mxEvent.addListener(element, 'mousedown', function (evt)
		{
			graph.dispatchGraphEvent('mousedown', evt, checkCell(evt), index);
		});
		
		mxEvent.addListener(element, 'mousemove', function (evt)
		{
			graph.dispatchGraphEvent('mousemove', evt, checkCell(evt), index);
		});
		
		mxEvent.addListener(element, 'mouseup', function (evt)
		{
			graph.dispatchGraphEvent('mouseup', evt, checkCell(evt), index);
		});
	},
	
	/**
	 * Function: removeListener
	 *
	 * Removes the specified listener from the given element.
	 */
	removeListener: function()
	{
		var updateListener = function(element, eventName, funct)
		{
			if (element.mxListenerList != null)
			{
				var listenerCount = element.mxListenerList.length;
				
				for (var i=0; i<listenerCount; i++)
				{
					var entry = element.mxListenerList[i];
					
					if (entry.f == funct)
					{
						element.mxListenerList.splice(i, 1);
						break;
					}
				}
				
				if (element.mxListenerList.length == 0)
				{
					element.mxListenerList = null;
				}
			}
		}
		
		if (mxClient.IS_IE)
		{
			return function(element, eventName, funct)
			{
				element.detachEvent("on" + eventName, funct);
				updateListener(element, eventName, funct);
			}
		}
		else
		{
			return function(element, eventName, funct)
			{
				element.removeEventListener(eventName, funct, false);
				updateListener(element, eventName, funct);
			}
		}
	}(),
	
	/**
	 * Function: removeAllListeners
	 * 
	 * Removes all listeners from the given element.
	 */
	removeAllListeners: function(element)
	{
		var list = element.mxListenerList;

		if (list != null)
		{
			while (list.length > 0)
			{
				var entry = list[0];
				mxEvent.removeListener(element, entry.name, entry.f);
			}
		}
	},
	
	/**
	 * Function: addMouseWheelListener
	 * 
	 * Installs the given function as a handler for mouse wheel events. The
	 * function has two arguments: the mouse event and a boolean that specifies
	 * if the wheel was moved up or down.
	 * 
	 * This has been tested with IE 6 and 7, Firefox (all versions), Opera and
	 * Safari. It does currently not work on Safari for Mac.
	 * 
	 * Example:
	 * 
	 * (code)
	 * mxEvent.addMouseWheelListener(function (evt, up)
	 * {
	 *   mxLog.show();
	 *   mxLog.debug('mouseWheel: up='+up);
	 * });
	 *(end)
	 * 
	 * Parameters:
	 * 
	 * function - Handler function that takes the event argument and a boolean
	 * up argument for the mousewheel direction.
	 */
	addMouseWheelListener: function(funct)
	{
		if (funct != null)
		{
			var wheelHandler = function(evt)
			{
				// IE does not give an event object but the
				// global event object is the mousewheel event
				// at this point in time.
				if (evt == null)
				{
					evt = window.event;
				}
			
				var delta = 0;
				
				if (mxClient.IS_NS &&
					!mxClient.IS_SF &&
					!mxClient.IS_GC)
				{
					delta = -evt.detail/2;
				}
				else
				{
					delta = evt.wheelDelta/120;
				}
				
				// Handles the event using the given function
				if (delta != 0)
				{
					funct(evt, delta > 0);
				}
			};
	
			// Webkit has NS event API, but IE event name and details 
			if (mxClient.IS_NS)
			{
				var eventName = (mxClient.IS_SF || 	mxClient.IS_GC) ?
						'mousewheel' : 'DOMMouseScroll';
				mxEvent.addListener(window, eventName, wheelHandler);
			}
			else
			{
				// TODO: Does not work with Safari and Chrome but it should be
				// working as tested in etc/markup/wheel.html
				mxEvent.addListener(document, 'mousewheel', wheelHandler);
			}
		}
	},
	
	/**
	 * Function: disableContextMenu
	 *
	 * Disables the context menu for the given element.
	 */
	disableContextMenu: function()
	{
		if (mxClient.IS_IE)
		{
			return function(element)
			{
				mxEvent.addListener(element, 'contextmenu', function()
				{
					return false;
				});
			}
		}
		else
		{
			return function(element)
			{
				element.setAttribute('oncontextmenu', 'return false;');
			}			
		}
	}(),
	
	/**
	 * Function: getSource
	 * 
	 * Returns true if the event was consumed.
	 */
	getSource: function(evt)
	{
		return (evt.srcElement != null) ? evt.srcElement : evt.target;
	},

	/**
	 * Function: isConsumed
	 * 
	 * Returns true if the event has been consumed using <consume>.
	 */
	isConsumed: function(evt)
	{
		return evt.isConsumed != null &&
			evt.isConsumed; // Opera
	},

	/**
	 * Function: isLeftMouseButton
	 * 
	 * Returns true if the left mouse button is pressed for the given event.
	 */
	isLeftMouseButton: function(evt)
	{
		return evt.button == ((mxClient.IS_IE) ? 1 : 0);
	},
	
	/**
	 * Function: isPopupTrigger
	 * 
	 * Returns true if the event is a popup trigger. This implementation
	 * returns true if the right mouse button was pressed.
	 */
	isPopupTrigger: function(evt)
	{
		return evt.button == 2;
	},
	
	/**
	 * Function: isCloneEvent
	 * 
	 * Returns true if the given mouse event is a clone event.
	 */
	isCloneEvent: function(evt)
	{
		return (evt != null) ? evt.ctrlKey : false;
	},
	
	/**
	 * Function: isGridEnabledEvent
	 * 
	 * Returns true if the given mouse event can be aligned to the grid.
	 */
	isGridEnabledEvent: function(evt)
	{
		return (evt != null) ? !evt.altKey : false;
	},

	/**
	 * Function: isToggleEvent
	 * 
	 * Returns true if the given event is a toggle event. This implementation
	 * returns true if control is pressed.
	 */
	isToggleEvent: function(evt)
	{
		return evt.ctrlKey;
	},
	
	/**
	 * Function: isForceMarqueeEvent
	 * 
	 * Returns true if the given event forces marquee selection. This implementation
	 * returns true if alt or meta is pressed.
	 */
	isForceMarqueeEvent: function(evt)
	{
		return evt.altKey || evt.metaKey;
	},
	
	/**
	 * Function: consume
	 * 
	 * Consumes the given event.
	 */
	consume: function(evt, preventDefault)
	{
		if (preventDefault == null ||
			preventDefault)
		{
			if (evt.preventDefault)
			{
				evt.stopPropagation();
				evt.preventDefault();
			}
			else
			{
				evt.cancelBubble = true;
			}
		}

		// Opera
		evt.isConsumed = true;

		// Other browsers
		evt.returnValue = false;
	}

};
