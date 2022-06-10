/**
 * $Id: mxPopupMenu.js,v 1.2 2008/11/18 22:28:28 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxPanningHandler
 * 
 * Event handler that pans and creates popupmenus. To use the left
 * mousebutton for panning without interfering with cell moving and
 * resizing, use <isUseLeftButton> and <isIgnoreCell>. For grid size
 * steps while panning, use <useGrid>. This handler is built-into
 * <mxGraph.panningHandler> and enabled using <mxGraph.setPanning>.
 */
{

	/**
	 * Constructor: mxPopupMenu
	 * 
	 * Constructs an event handler that creates a popupmenu. The
	 * event handler is not installed anywhere in this ctor.
	 */
	function mxPopupMenu(factoryMethod)
	{
		this.factoryMethod = factoryMethod;
	};
	
	/**
	 * Variable: submenuImage
	 * 
	 * URL of the image to be used for the submenu icon.
	 */
	mxPopupMenu.prototype.submenuImage = mxClient.imageBasePath + 'submenu.gif';

	/**
	 * Variable: factoryMethod
	 * 
	 * Function that is used to create the popup menu. The function takes the
	 * current panning handler, the <mxCell> under the mouse and the mouse
	 * event that triggered the call as arguments.
	 */
	mxPopupMenu.prototype.factoryMethod = true;

	/**
	 * Variable: useShiftKey
	 * 
	 * Specifies if panning and popups should be actived using the left
	 * mousebutton if the shift key is being pressed. Default is true.
	 */
	mxPopupMenu.prototype.useShiftKey = true;

	/**
	 * Variable: useLeftButtonForPopup
	 * 
	 * Specifies if popupmenus should be activated by clicking the left mouse
	 * button. Default is false.
	 */
	mxPopupMenu.prototype.useLeftButtonForPopup = false;

	/**
	 * Variable: enabled
	 * 
	 * Specifies if events are handled. Default is true.
	 */
	mxPopupMenu.prototype.enabled = true;

	/**
	 * Variable: itemCount
	 * 
	 * Contains the number of times <addItem> has been called for a new menu.
	 */
	mxPopupMenu.prototype.itemCount = 0;

	/**
	 * Function: init
	 * 
	 * Initializes the shapes required for this vertex handler.
	 */
	mxPopupMenu.prototype.init = function()
	{
		// Adds the inner table
		this.table = document.createElement('table');
		this.table.className = 'mxPopupMenu';
		
		this.tbody = document.createElement('tbody');
		this.table.appendChild(this.tbody);
	
		// Adds the outer div
		this.div = document.createElement('div');
		this.div.className = 'mxPopupMenu';
		this.div.style.display = 'inline';
		this.div.appendChild(this.table);

		if (!mxClient.IS_IE &&
			mxClient.MENU_SHADOWS)
		{
			this.shadow = document.createElement('div');
			this.shadow.style.background = mxConstants.SVG_SHADOWCOLOR;
			mxUtils.setOpacity(this.shadow, 70);
									
			this.shadow.style.position = 'absolute';
			this.shadow.style.display = 'inline';
		}
		else if (mxClient.IS_IE &&
			!mxClient.MENU_SHADOWS)
		{
			this.div.style.filter = '';
		}

		// Disables the context menu on the outer div
		mxEvent.disableContextMenu(this.div);
	};
	
	/**
	 * Function: isEnabled
	 * 
	 * Returns true if events are handled. This implementation
	 * returns <enabled>.
	 */
	mxPopupMenu.prototype.isEnabled = function()
	{
		return this.enabled;
	};
		
	/**
	 * Function: setEnabled
	 * 
	 * Enables or disables event handling. This implementation
	 * updates <enabled>.
	 */
	mxPopupMenu.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};

	/**
	 * Function: isPopupTrigger
	 * 
	 * Returns true if the given event is a popupmenu trigger for the optional
	 * given cell.
	 */
	mxPopupMenu.prototype.isPopupTrigger = function(evt, cell)
	{
		return mxEvent.isPopupTrigger(evt) ||
			(this.useLeftButtonForPopup &&
			mxEvent.isLeftMouseButton(evt)) ||
			(this.useShiftKey && evt.shiftKey);
	};

	/**
	 * Function: addItem
	 * 
	 * Adds a new menuitem to the popupmenu being displayed. This is used as a
	 * callback by <factoryMethod> to insert the menuitems into a popupmenu.
	 */
	mxPopupMenu.prototype.addItem = function(title, image, funct, parent)
	{
		parent = parent || this;
		this.itemCount++;
		
		var tr = document.createElement('tr');
		tr.className = 'mxPopupMenuItem';
		var col1 = document.createElement('td');
		col1.className = 'mxPopupMenuIcon';
		
		// Adds the given image into the first column
		if (image != null)
		{
			var img = document.createElement('img');

			// Calls showShadow after all images have been loaded
			if (!mxClient.IS_IE)
			{
				if (this.loading == null)
				{
					this.loading = 0;
				}
				
				this.loading++;
				
				var self = this; // closure
				var loader = function()
				{
					mxEvent.removeListener(img, 'load', loader);
					self.loading--;
					
					if (self.loading == 0)
					{
						self.showShadow();
					}	
				};
				
				mxEvent.addListener(img, 'load', loader);
			}
			
			img.src = image;
			col1.appendChild(img);
		}
		
		tr.appendChild(col1);
		var col2 = document.createElement('td');
		col2.className = 'mxPopupMenuItem';
		mxUtils.write(col2, title);
		col2.align = 'left';
		tr.appendChild(col2);

		var col3 = document.createElement('td');
		col3.style.width = '10px';
		col3.style.paddingRight = '6px';
		tr.appendChild(col3);
		
		if (parent.div == null)
		{
			this.createSubmenu(parent);
		}
		
		parent.tbody.appendChild(tr);
	
		// Consumes the event on mouse down
		var self = this; // closure
		mxEvent.addListener(tr, 'mousedown', function(evt)
		{
			self.eventReceiver = tr;
			
			if (parent.activeRow != tr &&
				parent.activeRow != parent)
			{
				if (parent.activeRow != null &&
					parent.activeRow.div.parentNode != null)
				{
					self.hideSubmenu(parent);
				}
				
				if (tr.div != null)
				{
					self.showSubmenu(parent, tr);
					parent.activeRow = tr;
				}
			}
			
			mxEvent.consume(evt);
		});

		mxEvent.addListener(tr, 'mouseup', function(evt)
		{
			// EventReceiver avoids clicks on a submenu item
			// which has just been shown in the mousedown
			if (self.eventReceiver == tr)
			{
				if (parent.activeRow != tr)
				{
					self.hideMenu();
				}
				
				if (funct != null)
				{
					funct(evt);
				}
			}
			
			self.eventReceiver = null;
			mxEvent.consume(evt);
		});
		
		mxEvent.addListener(tr, 'mousemove', function(evt)
		{
			if (parent.activeRow != tr &&
				parent.activeRow != parent)
			{
				if (parent.activeRow != null &&
					parent.activeRow.div.parentNode != null)
				{
					self.hideSubmenu(parent);
				}
			}
			
			// Adds the mouse-over effect for Internet Explorer
			if (mxClient.IS_IE)
			{
				tr.style.backgroundColor = '#000066';
				tr.style.color = 'white';
			}
		});
		if (mxClient.IS_IE)
		{
			mxEvent.addListener(tr, 'mouseout', function(evt)
			{
				tr.style.backgroundColor = '';
				tr.style.color = '';
			});
		}
		
		return tr;
	};

	/**
	 * Function: addSeparator
	 * 
	 * Adds a horizontal separator to the menu.  This is used as a callback by
	 * <factoryMethod> to insert the menuitems into a popupmenu.
	 */
	mxPopupMenu.prototype.createSubmenu = function(parent)
	{
		parent.table = document.createElement('table');
		parent.table.className = 'mxPopupMenu';

		parent.tbody = document.createElement('tbody');
		parent.table.appendChild(parent.tbody);

		parent.div = document.createElement('div');
		parent.div.className = 'mxPopupMenu';
	
		parent.div.style.position = 'absolute';
		parent.div.style.display = 'inline';
		
		parent.div.appendChild(parent.table);
		
		var img = document.createElement('img');
		img.setAttribute('src', this.submenuImage);
		
		// Last column of the submenu item in the parent menu
		td = parent.firstChild.nextSibling.nextSibling;
		td.appendChild(img);
	};
	
	/**
	 * Function: addSeparator
	 * 
	 * Adds a horizontal separator to the menu.  This is used as a callback by
	 * <factoryMethod> to insert the menuitems into a popupmenu.
	 */
	mxPopupMenu.prototype.showSubmenu = function(parent, row)
	{
		if (row.div != null)
		{
			row.div.style.left = (parent.div.offsetLeft+
				row.offsetLeft+row.offsetWidth-1)+'px';
			row.div.style.top = (parent.div.offsetTop+row.offsetTop)+'px';
			document.body.appendChild(row.div);
			
			// Moves the submenu to the left side if there is no space
			var left = parseInt(row.div.offsetLeft);
			var width = parseInt(row.div.offsetWidth);
			
			var b = document.body;
			var d = document.documentElement;
			
			var right = (b.scrollLeft || d.scrollLeft) +
				(b.clientWidth || d.clientWidth);
			
			if (left + width > right)
			{
				row.div.style.left = (parent.div.offsetLeft - width +
					((mxClient.IS_IE) ? 6 : -6))+'px';
			}
			
			mxUtils.fit(row.div);
		}
	};
	
	/**
	 * Function: addSeparator
	 * 
	 * Adds a horizontal separator to the menu.  This is used as a callback by
	 * <factoryMethod> to insert the menuitems into a popupmenu.
	 */
	mxPopupMenu.prototype.addSeparator = function(parent)
	{
		parent = parent || this;
		var tr = document.createElement('tr');
		
		var col1 = document.createElement('td');
		col1.className = 'mxPopupMenuIcon';
		col1.style.padding = '0 0 0 0px';
		
		tr.appendChild(col1);
		
		var col2 = document.createElement('td');
		col2.style.padding = '0 0 0 0px';
		col2.setAttribute('colSpan', '2');

		var hr = document.createElement('hr');
		hr.setAttribute('size', '1');
		col2.appendChild(hr);
		
		tr.appendChild(col2);
		
		parent.tbody.appendChild(tr);
	};

	/**
	 * Function: popup
	 * 
	 * Shows the popup menu for the given event and cell.
	 * 
	 * Example:
	 * 
	 * (code)
	 * graph.panningHandler.popup = function(x, y, cell, evt)
	 * {
	 *   mxUtils.alert('Hello, World!');
	 * }
	 * (end)
	 */
	mxPopupMenu.prototype.popup = function(x, y, cell, evt)
	{
		if (this.div != null &&
			this.tbody != null &&
			this.factoryMethod != null)
		{
			this.div.style.left = x + 'px';
			this.div.style.top = y + 'px';
			
			// Removes all child nodes from the existing menu
			while (this.tbody.firstChild != null)
			{
				mxUtils.release(this.tbody.firstChild);
				this.tbody.removeChild(this.tbody.firstChild);
			}
			
			this.itemCount = 0;
			this.factoryMethod(this, cell, evt);
			
			if (this.itemCount > 0)
			{
				this.showMenu();
			}
		}
	};
	
	/**
	 * Function: isMenuShowing
	 * 
	 * Returns true if the popup menu is currently showing.
	 */
	mxPopupMenu.prototype.isMenuShowing = function()
	{
		return this.div.parentNode == document.body;
	};
	
	/**
	 * Function: showMenu
	 * 
	 * Shows the popupmenu by adding it into the DOM.
	 */
	mxPopupMenu.prototype.showMenu = function()
	{
		// Fits the div inside the viewport
		document.body.appendChild(this.div);
		mxUtils.fit(this.div);
		
		if (this.shadow != null)
		{
			if (!this.loading)
			{
				this.showShadow();
			}
		}
	};
	
	/**
	 * Function: showShadow
	 * 
	 * Adds the shadow of the popupmenu to the DOM.
	 */
	mxPopupMenu.prototype.showShadow = function()
	{
		if (this.shadow != null &&
			this.div.parentNode == document.body)
		{
			this.shadow.style.left = (parseInt(this.div.style.left) + 3)+'px';
			this.shadow.style.top = (parseInt(this.div.style.top) + 3)+'px';
			this.shadow.style.width = this.div.offsetWidth+'px';
			this.shadow.style.height = this.div.offsetHeight+'px';

			document.body.appendChild(this.shadow);
		}
	};
	
	/**
	 * Function: hideMenu
	 * 
	 * Hides the menu and all submenus by removing them from the DOM.
	 */
	mxPopupMenu.prototype.hideMenu = function()
	{
		if (this.div != null)
		{
			if (this.div.parentNode != null)
			{
				this.div.parentNode.removeChild(this.div);
			}
			
			if (this.shadow != null)
			{
				if (this.shadow.parentNode != null)
				{
					this.shadow.parentNode.removeChild(this.shadow);
				}
			}
			
			this.hideSubmenu(this);
		}
	};
	
	/**
	 * Function: hideSubmenu
	 * 
	 * Hides all submenus recursively by removing them from the DOM.
	 */
	mxPopupMenu.prototype.hideSubmenu = function(parent)
	{
		if (parent.activeRow != null)
		{
			this.hideSubmenu(parent.activeRow);
			
			if (parent.activeRow.div.parentNode != null)
			{
				parent.activeRow.div.parentNode.removeChild(parent.activeRow.div);
			}
			
			parent.activeRow = null;
		}
	};
	
	/**
	 * Function: destroy
	 * 
	 * Destroys the handler and all its resources and DOM nodes.
	 */
	mxPopupMenu.prototype.destroy = function()
	{
		if (this.div != null)
		{
			mxUtils.release(this.div);
			
			if (this.div.parentNode != null)
			{
				this.div.parentNode.removeChild(this.div);
			}
			
			this.div = null;
		}
		
		if (this.shadow != null)
		{
			mxUtils.release(this.shadow);
		
			if (this.shadow.parentNode != null)
			{
				this.shadow.parentNode.removeChild(this.shadow);
			}
			
			this.shadow = null;
		}
	};

}
