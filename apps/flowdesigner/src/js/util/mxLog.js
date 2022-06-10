/**
 * $Id: mxLog.js,v 1.14 2008/07/14 14:58:14 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxLog
 * 
 * A singleton class that implements a simple console.
 */
var mxLog =
{
	
	/**
	 * Variable: consoleResource
	 * 
	 * Specifies the resource key for the title of the console window. If the
	 * resource for this key does not exist then the value is used as
	 * the title. Default is 'console'.
	 */
	consoleResource: (mxClient.language != 'none') ? 'console' : '',
	
	/**
	 * Variable: TRACE
	 * 
	 * Specified if the output for <enter> and <leave> should be visible in the
	 * console. Default is false.
	 */
	TRACE: false,

	/**
	 * Variable: DEBUG
	 * 
	 * Specifies if the output for <debug> should be visible in the console.
	 * Default is true.
	 */
	DEBUG: true,

	/**
	 * Variable: WARN
	 * 
	 * Specifies if the output for <warn> should be visible in the console.
	 * Default is true.
	 */
	WARN: true,

	/**
	 * Variable: buffer
	 * 
	 * Buffer for pre-initialized content.
	 */
	buffer: '',
	
	/**
	 * Function: init
	 *
	 * Initializes the DOM node for the console. This requires document.body to
	 * point to a non-null value. This is called from within <setVisible> if the
	 * log has not yet been initialized.
	 */
	init: function()
	{
		if (mxLog.window == null &&
			document.body != null)
		{
			var title = (mxResources.get(mxLog.consoleResource) ||
				mxLog.consoleResource) + ' - mxGraph ' + mxClient.VERSION;

			// Creates a table that maintains the layout
			var table = document.createElement('table');
			table.setAttribute('width', '100%');
			table.setAttribute('height', '100%');

			var tbody = document.createElement('tbody');
			var tr = document.createElement('tr');
			var td = document.createElement('td');
			td.style.verticalAlign = 'top';
				
			// Adds the actual console as a textarea
			mxLog.textarea = document.createElement('textarea');
			mxLog.textarea.setAttribute('readOnly', 'true');
			mxLog.textarea.style.width = "100%";
			mxLog.textarea.style.height = "100%";
			mxLog.textarea.value = mxLog.buffer;

			td.appendChild(mxLog.textarea);
			tr.appendChild(td);
			tbody.appendChild(tr);

			// Creates the container div
			tr = document.createElement('tr');
			mxLog.td = document.createElement('td');
			mxLog.td.style.verticalAlign = 'top';
			mxLog.td.setAttribute('height', '30px');
			
			tr.appendChild(mxLog.td);
			tbody.appendChild(tr);
			table.appendChild(tbody);

			// Adds various debugging buttons
			mxLog.addButton('Info', function (evt)
			{
				mxLog.writeln(mxUtils.toString(navigator));
			});
		
			mxLog.addButton('DOM', function (evt)
			{
				var content = mxUtils.getInnerHtml(document.body);
				mxLog.debug(content);
			});
	
			mxLog.addButton('Trace', function (evt)
			{
				mxLog.TRACE = !mxLog.TRACE;
				if (mxLog.TRACE)
				{
					mxLog.debug('Tracing enabled');
				}
				else
				{
					mxLog.debug('Tracing disabled');
				}
			});	

			mxLog.addButton('Copy', function (evt)
			{
				try
				{
					mxUtils.copy(mxLog.textarea.value);
				}
				catch (err)
				{
					mxUtils.alert(err);
				}
			});			

			mxLog.addButton('Show', function (evt)
			{
				try
				{
					mxUtils.popup(mxLog.textarea.value);
				}
				catch (err)
				{
					mxUtils.alert(err);
				}
			});	
			
			mxLog.addButton('Clear', function (evt)
			{
				mxLog.textarea.value = '';
			});

			var w = document.body.clientWidth;
			
			// Workaround for clientHeight in body = 0 if doctype in FF
			var h = (document.body.clientHeight || document.documentElement.clientHeight);
					
			mxLog.window = new mxWindow(title, table, w-320, h-210, 300, 160);
			mxLog.window.setMaximizable(true);
			mxLog.window.setScrollable(true);
			mxLog.window.setSizable(true);
			mxLog.window.setClosable(true);
			mxLog.window.destroyOnClose = false;
			
			// Workaround for ignored textarea height in non-quirks mode FF
			if (mxClient.IS_NS &&
				document.compatMode != 'BackCompat')
			{
				var resizeHandler = function(sender, evt)
				{
					var elt = mxLog.window.getElement();
					mxLog.textarea.style.height = (elt.offsetHeight - 78)+'px';
				}; 
				
				mxLog.window.addListener('resize', resizeHandler);
				mxLog.window.addListener('maximize', resizeHandler);
				mxLog.window.addListener('normalize', resizeHandler);

				var elt = mxLog.window.getElement();
				mxLog.textarea.style.height = '96px';
			}
		}
	},
			
	/**
	 * Function: addButton
	 * 
	 * Adds a button to the console using the given label and function.
	 */
	addButton: function(lab, funct)
	{
		var button = document.createElement('button');
		mxUtils.write(button, lab);
		mxEvent.addListener(button, 'click', funct);
		mxLog.td.appendChild(button);
	},
				
	/**
	 * Function: isVisible
	 * 
	 * Returns true if the console is visible.
	 */
	isVisible: function()
	{
		if (mxLog.window != null)
		{
			return mxLog.window.isVisible();
		}
		return false;
	},
	

	/**
	 * Function: show
	 * 
	 * Shows the console.
	 */
	show: function()
	{
		mxLog.setVisible(true);
	},

	/**
	 * Function: setVisible
	 * 
	 * Shows or hides the console.
	 */
	setVisible: function(visible)
	{
		if (mxLog.window == null)
		{
			mxLog.init();
		}
		if (mxLog.window != null)
		{
			mxLog.window.setVisible(visible);
		}
	},

	/**
	 * Function: enter
	 * 
	 * Writes the specified string to the console
	 * if <TRACE> is true and returns the current 
	 * time in milliseconds.
	 *
	 * Example:
	 * 
	 * (code)
	 * mxLog.show();
	 * var t0 = mxLog.enter('Hello');
	 * // Do something
	 * mxLog.leave('World!', t0);
	 * (end)
	 */
	enter: function(string)
	{
		if (mxLog.TRACE)
		{
			mxLog.writeln('Entering '+string);
			
			return new Date().getTime();
		}
	},

	/**
	 * Function: leave
	 * 
	 * Writes the specified string to the console
	 * if <TRACE> is true and computes the difference
	 * between the current time and t0 in milliseconds.
	 * See <enter> for an example.
	 */
	leave: function(string, t0)
	{
		if (mxLog.TRACE)
		{
			var dt = (t0 != 0) ? ' ('+(new Date().getTime() - t0)+' ms)' : '';
			mxLog.writeln('Leaving '+string+dt);
		}
	},
	
	/**
	 * Function: debug
	 * 
	 * Adds the specified string to the console if
	 * <DEBUG> is enabled.
	 *
	 * Example:
	 * 
	 * (code)
	 * mxLog.show();
	 * mxLog.debug('Hello, World!');
	 * (end)
	 */
	debug: function(string)
	{
		if (mxLog.DEBUG)
		{
			mxLog.writeln(string);
		}
	},
	
	/**
	 * Function: warn
	 * 
	 * Adds the specified string to the console if
	 * <WARN> is enabled.
	 *
	 * Example:
	 * 
	 * (code)
	 * mxLog.show();
	 * mxLog.warn('Hello, World!');
	 * (end)
	 */
	warn: function(string)
	{
		if (mxLog.WARN)
		{
			mxLog.writeln(string);
		}
	},

	/**
	 * Function: write
	 * 
	 * Adds the specified string to the console.
	 */
	write: function(string)
	{
		if (mxLog.textarea != null)
		{
			mxLog.textarea.value = mxLog.textarea.value + string;
			mxLog.textarea.scrollTop = mxLog.textarea.scrollHeight;
		}
		else
		{
			mxLog.buffer += string;
		}
	},
	
	/**
	 * Function: writeln
	 * 
	 * Adds the specified string to the console, appending alinefeed at the end
	 * of the string.
	 */
	writeln: function(string)
	{
		mxLog.write(string+'\n');
	}
	
};
