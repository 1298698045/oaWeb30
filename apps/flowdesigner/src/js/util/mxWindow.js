/**
 * $Id: mxWindow.js,v 1.39 2007/10/30 15:15:34 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxWindow
 * 
 * Basic window inside a document. The global <mxClient.IS_WINDOW_SHADOWS>
 * switch specifies if windows shoudl have shadows.
 * 
 * Examples:
 * 
 * Creating a simple window.
 *
 * (code)
 * var tb = document.createElement('div');
 * var wnd = new mxWindow('Title', tb, 100, 100, 200, 200, true, true);
 * wnd.setVisible(true); 
 * (end)
 *
 * Creating a window that contains an iframe. 
 * 
 * (code)
 * var frame = document.createElement('iframe');
 * frame.setAttribute('width', '192px');
 * frame.setAttribute('height', '172px');
 * frame.setAttribute('src', 'http://www.example.com/');
 * frame.style.backgroundColor = 'white';
 * 
 * var w = document.body.clientWidth;
 * var h = (document.body.clientHeight || document.documentElement.clientHeight);
 * var wnd = new mxWindow('Title', frame, (w-200)/2, (h-200)/3, 200, 200);
 * wnd.setVisible(true);
 * (end);
 *
 * Event: movestart
 *
 * Fires when the window starts being moved. First argument is the source
 * <mxWindow>, second argument is the mousedown event.
 *
 * Event: move
 *
 * Fires while the window is being moved. First argument is the source
 * <mxWindow>, second argument is the mousemove event.
 *
 * Event: moveend
 *
 * Fires after the window has been moved. First argument is the source
 * <mxWindow>, second argument is the mouseup event.
 *
 * Event: resizestart
 *
 * Fires when the window starts being resized. First argument is the source
 * <mxWindow>, second argument is the mousedown event.
 *
 * Event: resize
 *
 * Fires while the window is being resized. First argument is the source
 * <mxWindow>, second argument is the mousemove event.
 *
 * Event: resizeend
 *
 * Fires after the window has been resized. First argument is the source
 * <mxWindow>, second argument is the mouseup event.
 * 
 * Event: show
 * 
 * Fires after the window has been shown.
 * 
 * Event: activate
 * 
 * Fires after the window has been activated. First argument is the source
 * <mxWindow>, second argument is the previously active <mxWindow>.
 * 
 * Event: maximize
 * 
 * Fires after the window has been maximized. First argument is the source
 * <mxWindow>.
 * 
 * Event: minimize
 * 
 * Fires after the window has been minimized. First argument is the source
 * <mxWindow>.
 * 
 * Event: normalize
 * 
 * Fires after the window has been normalized, that is, it returned from
 * maximized or minimized state.
 * 
 * Event: hide
 * 
 * Fires after the window has been hidden. First argument is the source
 * <mxWindow>.
 * 
 * Event: close
 * 
 * Fires before the window will be closed. First argument is the source
 * <mxWindow>.
 * 
 * Event: destroy
 * 
 * Fires before the window will be destroyed. First argument is the source
 * <mxWindow>.
 */
{

	/**
	 * Constructor: mxWindow
	 * 
	 * Constructs a new window with the given dimension and title to display
	 * the specified content. The window elements use the given style as a
	 * prefix for the classnames of the respective window elements, namely,
	 * the window title and window pane. The respective postfixes are appended
	 * to the given stylename as follows:
	 * 
	 *   style - Base style for the window.
	 *   style+Title - Style for the window title.
	 *   style+Pane - Style for the window pane.
	 * 
	 * The default value for style is mxWindow, resulting in the following
	 * classnames for the window elements: mxWindow, mxWindowTitle and
	 * mxWindowPane.
	 * 
	 * If replaceNode is given then the window replaces the given DOM node in
	 * the document.
	 * 
	 * Parameters:
	 * 
	 * title - String that represents the title of the new window.
	 * content - DOM node that is used as the window content.
	 * x - X-coordinate of the window location.
	 * y - Y-coordinate of the window location.
	 * width - Width of the window.
	 * height - Optional height of the window. Default is to match the height
	 * of the content at the specified width.
	 * minimizable - Optional boolean indicating if the window is minimizable.
	 * Default is true.
	 * movable - Optional boolean indicating if the window is movable. Default
	 * is true.
	 * replaceNode - Optional DOM node that the window should replace.
	 * style - Optional base classname for the window elements. Default is
	 * mxWindow.
	 */
	function mxWindow(title, content, x, y, width, height, minimizable, movable, replaceNode, style)
	{
		if (content != null)
		{
			minimizable = (minimizable != null) ? minimizable : true;
			this.content = content;
			this.init(x, y, width, height, style);
			
			this.installMaximizeHandler();
			this.installMinimizeHandler();
			this.installCloseHandler();
			this.setMinimizable(minimizable);
	
			// Writes the title after adding the minimize icon
			mxUtils.write(this.title, title || '');
			
			if (movable == null || movable)
			{
				this.installMoveHandler();
			}
	
			if (replaceNode != null &&
				replaceNode.parentNode != null)
			{
				replaceNode.parentNode.replaceChild(this.div, replaceNode);
			}
			else
			{
				document.body.appendChild(this.div);
			}
		}
	};
	
	/**
	 * Extends mxEventSource.
	 */
	mxWindow.prototype = new mxEventSource();
	mxWindow.prototype.constructor = mxWindow;
	
	/**
	 * Variable: closeImage
	 * 
	 * URL of the image to be used for the close icon in the titlebar.
	 */
	mxWindow.prototype.closeImage = mxClient.imageBasePath+'close.gif';

	/**
	 * Variable: minimizeImage
	 * 
	 * URL of the image to be used for the minimize icon in the titlebar.
	 */
	mxWindow.prototype.minimizeImage = mxClient.imageBasePath+'minimize.gif';
		
	/**
	 * Variable: normalizeImage
	 * 
	 * URL of the image to be used for the normalize icon in the titlebar.
	 */
	mxWindow.prototype.normalizeImage = mxClient.imageBasePath+'normalize.gif';
		
	/**
	 * Variable: maximizeImage
	 * 
	 * URL of the image to be used for the maximize icon in the titlebar.
	 */
	mxWindow.prototype.maximizeImage = mxClient.imageBasePath+'maximize.gif';

	/**
	 * Variable: normalizeImage
	 * 
	 * URL of the image to be used for the resize icon.
	 */
	mxWindow.prototype.resizeImage = mxClient.imageBasePath+'resize.gif';
	
	/**
	 * Variable: visible
	 * 
	 * Boolean flag that represents the visible state of the window.
	 */
	mxWindow.prototype.visible = false;
		
	/**
	 * Variable: content
	 * 
	 * Reference to the DOM node that represents the window content.
	 */
	mxWindow.prototype.content = false;
		
	/**
	 * Variable: minimumSize
	 * 
	 * <mxRectangle> that specifies the minimum width and height of the window.
	 * Default is (50, 40).
	 */
	mxWindow.prototype.minimumSize = new mxRectangle(0, 0, 50, 40);
		
	/**
	 * Variable: content
	 * 
	 * Reference to the DOM node that represents the window content.
	 */
	mxWindow.prototype.content = false;
	
	/**
	 * Variable: destroyOnClose
	 * 
	 * Specifies if the window should be destroyed when it is closed. If this
	 * is false then the window is hidden using <setVisible>. Default is true.
	 */
	mxWindow.prototype.destroyOnClose = true;
	
	/**
	 * Function: init
	 * 
	 * Initializes the DOM tree that represents the window.
	 */
	mxWindow.prototype.init = function(x, y, width, height, style)
	{
		style = (style != null) ? style : 'mxWindow';
		
		this.div = document.createElement('div');
		this.div.className = style; 
		this.div.style.left = x+'px';
		this.div.style.top = y+'px';

		if (!mxClient.IS_IE &&
			mxClient.WINDOW_SHADOWS)
		{
			this.shadow = document.createElement('div');
			this.shadow.style.background = mxConstants.SVG_SHADOWCOLOR;
			mxUtils.setOpacity(this.shadow, 70);
									
			this.shadow.style.position = 'absolute';
			this.shadow.style.display = 'inline';
		}
		else if (mxClient.IS_IE &&
			!mxClient.WINDOW_SHADOWS)
		{
			this.div.style.filter = '';
		}
		
		this.table = document.createElement('table');
		this.table.className = style;
		
		// Workaround for table size problems in FF
		if (width != null)
		{
			if (!mxClient.IS_IE)
			{
				this.div.style.width = width+'px'; 
			}
			
			this.table.style.width =width+'px';
		} 
		
		if (height != null)
		{
			if (!mxClient.IS_IE)
			{
				this.div.style.height = height+'px';
			}
			
			this.table.style.height = height+'px';
		}		
		
		// Creates title row
		var tbody = document.createElement('tbody');
		var tr = document.createElement('tr');
		
		this.title = document.createElement('td');
		this.title.className = style+'Title';
		tr.appendChild(this.title);
		tbody.appendChild(tr);
		
		// Creates content row and table cell
		tr = document.createElement('tr');
		this.td = document.createElement('td');
		this.td.className = style+'Pane';

		this.contentWrapper = document.createElement('div');
		this.contentWrapper.className = style+'Pane';
		this.contentWrapper.style.width = '100%';
		this.contentWrapper.appendChild(this.content);

		// Workaround for div around div restricts height
		// of inner div if outerdiv has hidden overflow
		if (mxClient.IS_IE ||
			this.content.nodeName.toUpperCase() != 'DIV')
		{
			this.contentWrapper.style.height = '100%';
		}

		// Puts all content into the DOM
		this.td.appendChild(this.contentWrapper);
		tr.appendChild(this.td);
		tbody.appendChild(tr);
		this.table.appendChild(tbody);
		this.div.appendChild(this.table);
		
		// Puts the window on top of other windows when clicked
		var self = this; // closure
		var activator = function(evt)
		{
			self.activate();
		};
		
		mxEvent.addListener(this.title, 'mousedown', activator);
		mxEvent.addListener(this.table, 'mousedown', activator);

		// Keeps the shadow in sync with the window contents
		if (this.shadow != null)
		{
			mxEvent.addListener(this.div, 'DOMNodeInserted', function(evt)
			{
				var node = mxEvent.getSource(evt);
				var loadHandler = function(evt)
				{
					mxEvent.removeListener(node, 'load', loadHandler);
					self.updateShadow();
				};
				
				mxEvent.addListener(node, 'load', loadHandler);
				self.updateShadow();
			});
		}

		this.hide();
	};
	
	/**
	 * Function: setScrollable
	 * 
	 * Sets if the window contents should be scrollable.
	 */
	mxWindow.prototype.setScrollable = function(scrollable)
	{
		if (scrollable)
		{
			this.contentWrapper.style.overflow = 'auto'
		}
		else
		{
			this.contentWrapper.style.overflow = 'hidden'
		}
	};
	
	/**
	 * Function: updateShadow
	 * 
	 * Updates the shadow node in the DOM if one exists.
	 */
	mxWindow.prototype.updateShadow = function()
	{
		if (this.shadow != null)
		{
			this.shadow.style.display = this.div.style.display;
			this.shadow.style.left = (parseInt(this.div.style.left) + 3)+'px';
			this.shadow.style.top = (parseInt(this.div.style.top) + 3)+'px';
			this.shadow.style.width = this.div.offsetWidth+'px';
			this.shadow.style.height = this.div.offsetHeight+'px';

			if (this.shadow.parentNode != this.div.parentNode)
			{
				this.div.parentNode.appendChild(this.shadow);
			}
		}
	};
	
	/**
	 * Function: activate
	 * 
	 * Puts the window on top of all other windows.
	 */
	mxWindow.prototype.activate = function()
	{
		if (mxWindow.activeWindow != this)
		{
			var style = mxUtils.getCurrentStyle(this.getElement());
			var index = (style != null) ? style.zIndex : 3;

			if (mxWindow.activeWindow)
			{
				var elt = mxWindow.activeWindow.getElement();
				
				if (elt != null &&
					elt.style != null)
				{
					elt.style.zIndex = index;
				}
			}
			
			var oldWindow = mxWindow.activeWindow;
			this.getElement().style.zIndex = index + 1;
			mxWindow.activeWindow = this;
			
			this.dispatchEvent('activate', this, oldWindow);
		}
	};
	
	/**
	 * Function: getElement
	 * 
	 * Returuns the outermost DOM node that makes up the window.
	 */
	mxWindow.prototype.getElement = function()
	{
		return this.div;
	};
	
	/**
	 * Function: fit
	 * 
	 * Makes sure the window is inside the client area of the window.
	 */
	mxWindow.prototype.fit = function()
	{
		mxUtils.fit(this.div);
	};
	
	/**
	 * Function: isSizable
	 * 
	 * Returns true if the window is sizable.
	 */
	mxWindow.prototype.isSizable = function(sizable)
	{
		if (this.resize != null)
		{
			return this.resize.style.display != 'none';
		}
		
		return false;
	};

	/**
	 * Function: setSizable
	 * 
	 * Sets if the window should be sizable.w.
	 */
	mxWindow.prototype.setSizable = function(sizable)
	{
		if (sizable)
		{
			if (this.resize == null)
			{
				this.resize = document.createElement('img');
				this.resize.style.position = 'absolute';
				this.resize.style.bottom = '2px';
				this.resize.style.right = '2px';

				this.resize.setAttribute('src', mxClient.imageBasePath+'resize.gif');
				this.resize.style.cursor = 'nw-resize';

				var self = this; // closure
				mxEvent.addListener(this.resize, 'mousedown', function(evt)
				{
					self.activate();
					var startX = evt.clientX;
					var startY = evt.clientY;
					var width = self.div.offsetWidth;
					var height = self.div.offsetHeight;


					// Adds a temporary pair of listeners to intercept
					// the gesture event in the document
					var dragHandler = function(evt)
					{
						var dx = evt.clientX - startX;
						var dy = evt.clientY - startY;
						
						self.setSize(width + dx, height + dy);
						self.updateShadow();
		
						self.dispatchEvent('resize', self, evt);
						mxEvent.consume(evt);
					};
					
					var dropHandler = function(evt)
					{
						mxEvent.removeListener(document, 'mousemove', dragHandler);
						mxEvent.removeListener(document, 'mouseup', dropHandler);
		
						self.dispatchEvent('resizeend', self, evt);
						mxEvent.consume(evt);
					};
		
					mxEvent.addListener(document, 'mousemove', dragHandler);
					mxEvent.addListener(document, 'mouseup', dropHandler);
		
					self.dispatchEvent('resizestart', self, evt);
					mxEvent.consume(evt);
				});

				this.div.appendChild(this.resize);
			}
			else 
			{
				this.resize.style.display = 'inline';
			}
		}
		else if (this.resize != null)
		{
			this.resize.style.display = 'none';
		}
	};
		
	/**
	 * Function: setSize
	 * 
	 * Sets the size of the window.
	 */
	mxWindow.prototype.setSize = function(width, height)
	{
		width = Math.max(this.minimumSize.width, width);
		height = Math.max(this.minimumSize.height, height);

		// Workaround for table size problems in FF
		if (!mxClient.IS_IE)
		{
			this.div.style.width =  width + 'px';
			this.div.style.height = height + 'px';
		}
		
		this.table.style.width =  width + 'px';
		this.table.style.height = height + 'px';

		if (!mxClient.IS_IE)
		{
			this.contentWrapper.style.height =
				(this.div.offsetHeight - this.title.offsetHeight - 2)+'px';
		}
	};
		
	/**
	 * Function: setMinimizable
	 * 
	 * Sets if the window is minimizable.
	 */
	mxWindow.prototype.setMinimizable = function(minimizable)
	{
		this.minimize.style.display = (minimizable) ? '' : 'none';
	};
	
	/**
	 * Function: installMinimizeHandler
	 * 
	 * Installs the event listeners required for minimizing the window.
	 */
	mxWindow.prototype.installMinimizeHandler = function()
	{
		this.minimize = document.createElement('img');
		
		this.minimize.setAttribute('src', this.minimizeImage);
		this.minimize.setAttribute('align', 'right');
		this.minimize.setAttribute('title', 'Minimize');
		this.minimize.style.cursor = 'pointer';
		this.minimize.style.marginRight = '1px';
		this.minimize.style.display = 'none';
		
		this.title.appendChild(this.minimize);
		
		var minimized = false;
		var maxDisplay = null;
		var height = null;
		
		var self = this; // closure
		var funct = function(evt)
		{
			self.activate();
			
			if (!minimized)
			{
				minimized = true;
				
				self.minimize.setAttribute('src', self.normalizeImage);
				self.minimize.setAttribute('title', 'Normalize');
				self.contentWrapper.style.display = 'none';
				maxDisplay = self.maximize.style.display;
				
				self.maximize.style.display = 'none';
				height = self.table.style.height;

				if (!mxClient.IS_IE)
				{
					self.div.style.height = self.title.offsetHeight+'px';
				}
				
				self.table.style.height = self.title.offsetHeight+'px';
				
				if (self.resize != null)
				{
					self.resize.style.visibility = 'hidden';
				}
				
				self.updateShadow();
				self.dispatchEvent('minimize', self, evt);
			}
			else
			{
				minimized = false;
				
				self.minimize.setAttribute('src', self.minimizeImage);
				self.minimize.setAttribute('title', 'Minimize');
				self.contentWrapper.style.display = ''; // default
				self.maximize.style.display = maxDisplay;
				
				if (!mxClient.IS_IE)
				{
					self.div.style.height = height;
				}
				
				self.table.style.height = height;

				if (self.resize != null)
				{
					self.resize.style.visibility = 'visible';
				}
				
				self.updateShadow();
				self.dispatchEvent('normalize', self, evt);
			}
			
			mxEvent.consume(evt);
		};
		
		mxEvent.addListener(self.minimize, 'mousedown', funct);
	};
		
	/**
	 * Function: setMaximizable
	 * 
	 * Sets if the window is maximizable.
	 */
	mxWindow.prototype.setMaximizable = function(maximizable)
	{
		this.maximize.style.display = (maximizable) ? '' : 'none';
	};

	/**
	 * Function: installMaximizeHandler
	 * 
	 * Installs the event listeners required for maximizing the window.
	 */
	mxWindow.prototype.installMaximizeHandler = function()
	{
		this.maximize = document.createElement('img');
		
		this.maximize.setAttribute('src', this.maximizeImage);
		this.maximize.setAttribute('align', 'right');
		this.maximize.setAttribute('title', 'Maximize');
		this.maximize.style.cursor = 'default';
		this.maximize.style.marginLeft = '1px';
		this.maximize.style.cursor = 'pointer';
		this.maximize.style.display = 'none';
		
		this.title.appendChild(this.maximize);
		
		var maximized = false;
		var x = null;
		var y = null;
		var height = null;
		var width = null;
		
		var self = this; // closure
		var funct = function(evt)
		{
			self.activate();
			
			if (self.maximize.style.display != 'none')
			{
				if (!maximized)
				{
					maximized = true;
					
					self.maximize.setAttribute('src', self.normalizeImage);
					self.maximize.setAttribute('title', 'Normalize');
					self.contentWrapper.style.display = '';
					self.minimize.style.visibility = 'hidden';
					
					// Saves window state
					x = parseInt(self.div.style.left);
					y = parseInt(self.div.style.top);
					height = self.table.style.height;
					width = self.table.style.width;
	
					self.div.style.left = '0px';
					self.div.style.top = '0px';
	
					if (!mxClient.IS_IE)
					{
						self.div.style.height = (document.body.clientHeight-2)+'px';
						self.div.style.width = (document.body.clientWidth-2)+'px';
					}
	
					self.table.style.width = (document.body.clientWidth-2)+'px';
					self.table.style.height = (document.body.clientHeight-2)+'px';
					
					if (self.resize != null)
					{
						self.resize.style.visibility = 'hidden';
					}
	
					if (self.shadow != null)
					{
						self.shadow.style.display = 'none';
					}
	
					if (!mxClient.IS_IE)
					{
						var style = mxUtils.getCurrentStyle(self.contentWrapper);
			
						if (style.overflow == 'auto' ||
							self.resize != null)
						{
							self.contentWrapper.style.height =
								(self.div.offsetHeight - self.title.offsetHeight - 2)+'px';
						}
					}

					self.dispatchEvent('maximize', self, evt);
				}
				else
				{
					maximized = false;
					
					self.maximize.setAttribute('src', self.maximizeImage);
					self.maximize.setAttribute('title', 'Maximize');
					self.contentWrapper.style.display = '';
					self.minimize.style.visibility = '';
	
					// Restores window state
					self.div.style.left = x+'px';
					self.div.style.top = y+'px';
					
					if (!mxClient.IS_IE)
					{
						self.div.style.height = height;
						self.div.style.width = width;
	
						var style = mxUtils.getCurrentStyle(self.contentWrapper);
			
						if (style.overflow == 'auto' ||
							self.resize != null)
						{
							self.contentWrapper.style.height =
								(self.div.offsetHeight - self.title.offsetHeight - 2)+'px';
						}
					}
					
					self.table.style.height = height;
					self.table.style.width = width;
	
					if (self.resize != null)
					{
						self.resize.style.visibility = 'visible';
					}
					
					self.updateShadow();
					self.dispatchEvent('normalize', self, evt);
				}
				
				mxEvent.consume(evt);
			}
		};
		
		mxEvent.addListener(this.maximize, 'mousedown', funct);
		mxEvent.addListener(this.title, 'dblclick', funct);
	};
		
	/**
	 * Function: installMoveHandler
	 * 
	 * Installs the event listeners required for moving the window.
	 */
	mxWindow.prototype.installMoveHandler = function()
	{
		this.title.style.cursor = 'move';
		
		var self = this; // closure		
		mxEvent.addListener(this.title, 'mousedown', function(evt)
		{
			var startX = evt.clientX;
			var startY = evt.clientY;
			var x = self.getX();
			var y = self.getY();
						
			// Adds a temporary pair of listeners to intercept
			// the gesture event in the document
			var dragHandler = function(evt)
			{
				var dx = evt.clientX - startX;
				var dy = evt.clientY - startY;
				self.setLocation(x + dx, y + dy);
				self.dispatchEvent('move', self, evt);
				mxEvent.consume(evt);
			};
			
			var dropHandler = function(evt)
			{
				mxEvent.removeListener(document, 'mousemove', dragHandler);
				mxEvent.removeListener(document, 'mouseup', dropHandler);

				self.dispatchEvent('moveend', self, evt);
				mxEvent.consume(evt);
			};

			mxEvent.addListener(document, 'mousemove', dragHandler);
			mxEvent.addListener(document, 'mouseup', dropHandler);
			
			self.dispatchEvent('movestart', self, evt);
			mxEvent.consume(evt);
		});
	};
	
	/**
	 * Function: setLocation
	 * 
	 * Sets the upper, left corner of the window.
	 */
	 mxWindow.prototype.setLocation = function(x, y)
	 {
		this.div.style.left = x + 'px';
		this.div.style.top = y + 'px';
		this.updateShadow();
	 };

	/**
	 * Function: getX
	 *
	 * Returns the current position on the x-axis.
	 */
	mxWindow.prototype.getX = function()
	{
		return parseInt(this.div.style.left);
	};

	/**
	 * Function: getY
	 *
	 * Returns the current position on the y-axis.
	 */
	mxWindow.prototype.getY = function()
	{
		return parseInt(this.div.style.top);
	};

	/**
	 * Function: installCloseHandler
	 *
	 * Adds the <closeImage> as a new image node in <closeImg> and installs the
	 * <close> event.
	 */
	mxWindow.prototype.installCloseHandler = function()
	{
		this.closeImg = document.createElement('img');
		
		this.closeImg.setAttribute('src', this.closeImage);
		this.closeImg.setAttribute('align', 'right');
		this.closeImg.setAttribute('title', 'Close');
		this.closeImg.style.marginLeft = '2px';
		this.closeImg.style.cursor = 'pointer';
		this.closeImg.style.display = 'none';
		
		this.title.insertBefore(this.closeImg, this.title.firstChild);
		
		var self = this; // closure
		mxEvent.addListener(this.closeImg, 'mousedown', function(evt)
		{
			self.dispatchEvent('close', self, evt);
			
			if (self.destroyOnClose)
			{
				self.destroy();
			}
			else
			{
				self.setVisible(false);
			}
			
			mxEvent.consume(evt);
		});
	};

	/**
	 * Function: setImage
	 * 
	 * Sets the image associated with the window.
	 * 
	 * Parameters:
	 * 
	 * image - URL of the image to be used.
	 */
	mxWindow.prototype.setImage = function(image)
	{
		this.image = document.createElement('img');
		this.image.setAttribute('src', image);
		this.image.setAttribute('align', 'left');
		this.image.style.marginRight = '4px';
		this.image.style.marginLeft = '0px';
		this.image.style.marginTop = '-2px';
		
		this.title.insertBefore(this.image, this.title.firstChild);
	};

	/**
	 * Function: setClosable
	 * 
	 * Sets the image associated with the window.
	 * 
	 * Parameters:
	 * 
	 * closable - Boolean specifying if the window should be closable.
	 */
	mxWindow.prototype.setClosable = function(closable)
	{
		this.closeImg.style.display = (closable) ? '' : 'none';
	};

	/**
	 * Function: isVisible
	 * 
	 * Returns true if the window is visible.
	 */
	mxWindow.prototype.isVisible = function()
	{
		if (this.div != null)
		{
			return this.div.style.display != 'none';
		}
		
		return false;
	};

	/**
	 * Function: setVisible
	 *
	 * Shows or hides the window depending on the given flag.
	 * 
	 * Parameters:
	 * 
	 * visible - Boolean indicating if the window should be made visible.
	 */
	mxWindow.prototype.setVisible = function(visible)
	{
		if (this.div != null &&
			this.isVisible() != visible)
		{
			if (visible)
			{
				this.show();
			}
			else
			{
				this.hide();
			}
		}
		
		this.updateShadow();
	};

	/**
	 * Function: show
	 *
	 * Shows the window.
	 */
	mxWindow.prototype.show = function()
	{
		this.div.style.display = ''; // default
		this.activate();
		
		var style = mxUtils.getCurrentStyle(this.contentWrapper);
		
		if (!mxClient.IS_IE &&
			(style.overflow == 'auto' ||
			this.resize != null))
		{
			this.contentWrapper.style.height =
				(this.div.offsetHeight - this.title.offsetHeight - 2)+'px';
		}
		
		this.dispatchEvent('show', this);
	};
	
	/**
	 * Function: hide
	 *
	 * Hides the window.
	 */
	mxWindow.prototype.hide = function()
	{
		this.div.style.display = 'none';
		this.dispatchEvent('hide', this);
	};
	
	/**
	 * Function: destroy
	 *
	 * Destroys the window and removes all associated resources. Fires a
	 * <destroy> event prior to destroying the window.
	 */
	mxWindow.prototype.destroy = function()
	{
		this.dispatchEvent('destroy', this);
		
		if (this.div != null)
		{
			mxUtils.release(this.div);
			this.div.parentNode.removeChild(this.div);
			this.div = null;
		}
		
		if (this.shadow != null)
		{
			this.shadow.parentNode.removeChild(this.shadow);
			this.shadow = null;
		}
		
		this.title = null;
		this.content = null;
		this.contentWrapper = null;
	};

}
