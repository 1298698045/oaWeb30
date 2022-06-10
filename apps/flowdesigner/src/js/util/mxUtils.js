/**
 * $Id: mxUtils.js,v 1.139 2009/01/23 14:49:45 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxUtils
 * 
 * A singleton class that provides cross-browser helper methods.
 * This is a global functionality. To access the functions in this
 * class, use the global classname appended by the functionname.
 * 
 * For example, the following code displays an error message:
 * 
 * (code)
 * mxUtils.error('Browser is not supported!', 200, false);
 * (end)
 */
var mxUtils =
{
	
	/**
	 * Variable: errorResource
	 * 
	 * Specifies the resource key for the title of the error window. If the
	 * resource for this key does not exist then the value is used as
	 * the title. Default is 'error'.
	 */
	errorResource: (mxClient.language != 'none') ? 'error' : '',
	
	/**
	 * Variable: closeResource
	 * 
	 * Specifies the resource key for the label of the close button. If the
	 * resource for this key does not exist then the value is used as
	 * the label. Default is 'close'.
	 */
	closeResource: (mxClient.language != 'none') ? 'close' : '',

	/**
	 * Variable: errorImage
	 * 
	 * Defines the image used for error dialogs.
	 */
	errorImage: mxClient.imageBasePath+'error.gif',
		
	/**
	 * Function: release
	 * 
	 * Removes the known listeners from the given DOM node and its descendants.
	 * 
	 * Parameters:
	 * 
	 * element - DOM node to remove the listeners from.
	 */
	release: function(element)
	{
		if (element != null)
		{
			mxEvent.removeAllListeners(element);
			
			var children = element.childNodes;
			
			if (children != null)
			{
		        var childCount = children.length;
		        
		        for (var i = 0; i < childCount; i += 1)
		        {
		            mxUtils.release(children[i]);
		        }
		    }
		}
	},
			
	/**
	 * Function: removeCursors
	 * 
	 * Removes the cursors from the style of the given DOM node and its
	 * descendants.
	 * 
	 * Parameters:
	 * 
	 * element - DOM node to remove the cursor style from.
	 */
	removeCursors: function(element)
	{
		if (element.style != null)
		{
			element.style.cursor = null;
		}
		
		var children = element.childNodes;
		
		if (children != null)
		{
	        var childCount = children.length;
	        
	        for (var i = 0; i < childCount; i += 1)
	        {
	            mxUtils.removeCursors(children[i]);
	        }
	    }
	},
		
	/**
	 * Function: getCurrentStyle
	 * 
	 * Returns the current style of the specified element.
	 * 
	 * Parameters:
	 * 
	 * element - DOM node whose current style should be returned.
	 */
	getCurrentStyle: function()
	{
		if (mxClient.IS_IE)
		{
			return function(element)
			{
				return (element != null) ? element.currentStyle : null;
			}
		}
		else
		{
			return function(element)
			{
				return (element != null) ?
					window.getComputedStyle(element, '') :
					null;
			}
		}
	}(),

	/**
	 * Function: hasScrollbars
	 * 
	 * Returns true if the overflow CSS property of the given node is either
	 * scroll or auto.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node whose style should be checked for scrollbars.
	 */
	hasScrollbars: function(node)
	{
		var style = mxUtils.getCurrentStyle(node);

		return style != null &&
			(style.overflow == 'scroll' ||
			style.overflow == 'auto');
	},
	
	/**
	 * Function: eval
	 * 
	 * Evaluates the given expression using eval and returns the JavaScript
	 * object that represents the expression result. Supports evaluation of
	 * expressions that define functions and returns the function object for
	 * these expressions.
	 * 
	 * Parameters:
	 * 
	 * expr - A string that represents a JavaScript expression.
	 */
	eval: function(expr)
	{
		var result = null;
		
		if (expr.indexOf('function') >= 0 &&
			(mxClient.IS_IE ||
			mxClient.IS_SF ||
			mxClient.IS_FF3 ||
			mxClient.IS_OP))
		{
			try
			{
				eval('var _mxJavaScriptExpression='+expr);
				result = _mxJavaScriptExpression;
				delete _mxJavaScriptExpression;
			}
			catch (e)
			{
				mxLog.warn(e.message + ' while evaluating ' + expr);
			}
		}
		else
		{
			result = eval(expr);
		}
		
		return result;
	},
		
	/**
	 * Function: selectSingleNode
	 * 
	 * Evaluates the XPath expression and returns the first node of the result.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var expr = '//*[@label=\'Hello, World!\']';
	 * return mxUtils.selectSingleNode(doc, expr);
	 * (end)
	 * 
	 * Will find the first node with a label attribute that equals Hello,
	 * World!
	 * 
	 * Parameters:
	 * 
	 * doc - XML document that contains all nodes.
	 * expr - String that represents the XPath expression.
	 */
	selectSingleNode: function()
	{
		if (mxClient.IS_IE)
		{
			return function(doc, expr)
			{
				return doc.selectSingleNode(expr);
			}
		}
		else
		{
			return function(doc, expr)
			{
				var result = doc.evaluate(expr,
					doc, null, XPathResult.ANY_TYPE, null);
				return result.iterateNext();
			}
		}
	}(),

	/**
	 * Function: getFunctionName
	 * 
	 * Returns the name for the given function.
	 * 
	 * Parameters:
	 * 
	 * f - JavaScript object that represents a function.
	 */
	getFunctionName: function(f)
	{
		var str = null;

		if (f != null)
		{
			if (!mxClient.IS_SF &&
				mxClient.IS_NS)
			{
				str = f.name;
			}
			else
			{
				var tmp = f.toString();
				var idx1 = 9;
				
				while (tmp.charAt(idx1) == ' ')
				{
					idx1++;
				}
				
				var idx2 = tmp.indexOf('(', idx1);
				str = tmp.substring(idx1, idx2);
			}
		}
		
		return str;
	},

	/**
	 * Function: indexOf
	 * 
	 * Returns the index of obj in array or -1 if the array does not contains
	 * the given object.
	 * 
	 * Parameters:
	 * 
	 * array - Array to check for the given obj.
	 * obj - Object to find in the given array.
	 */
	indexOf: function(array, obj)
	{
		if (array != null &&
			obj != null)
		{
			for (var i = 0; i < array.length; i++)
			{
				if (array[i] == obj)
				{
					return i;
				}
			}
		}
		
		return -1;
	},

	/**
	 * Function: remove
	 * 
	 * Removes all occurrences of the given object in the given array or
	 * object. If there are multiple occurrences of the object, be they
	 * associative or as an array entry, all occurrences are removed from
	 * the array or deleted from the object. By removing the object from
	 * the array, all elements following the removed element are shifted
	 * by one step towards the beginning of the array.
	 * 
	 * The length of arrays is not modified inside this function.
	 * 
	 * Parameters:
	 * 
	 * obj - Object to find in the given array.
	 * array - Array to check for the given obj.
	 */
	remove: function(obj, array)
	{
		var result = null;
		
		if (typeof(array) == 'object')
		{
			var index = mxUtils.indexOf(array, obj);
			
			while (index >= 0)
			{
				array.splice(index, 1);
				result = obj;
				index = mxUtils.indexOf(array, obj);
			}
		}

		for (var key in array)
		{
			if (array[key] == obj)
			{
				delete array[key];
				result = obj;
			}
		}
		
		return result;
	},
	
	/**
	 * Function: isNode
	 * 
	 * Returns true if the given value is an XML node with the node name
	 * and if the optional attribute has the specified value.
	 * 
	 * This implementation assumes that the given value is a DOM node if the
	 * nodeType property is numeric, that is, if isNaN returns false for
	 * value.nodeType.
	 * 
	 * Parameters:
	 * 
	 * value - Object that should be examined as a node.
	 * nodeName - String that specifies the node name.
	 * attributeName - Optional attribute name to check.
	 * attributeValue - Optional attribute value to check.
	 */
	 isNode: function(value, nodeName, attributeName, attributeValue)
	 {
	 	if (value != null &&
	 		!isNaN(value.nodeType) &&
	 		(nodeName == null ||
	 		value.nodeName.toLowerCase() == nodeName.toLowerCase()))
 		{
 			return attributeName == null ||
 				value.getAttribute(attributeName) == attributeValue;
 		}
	 	
	 	return false;
	 },

	/**
	 * Function: getChildNodes
	 * 
	 * Returns an array of child nodes that are of the given node type.
	 * 
	 * Parameters:
	 * 
	 * node - Parent DOM node to return the children from.
	 * nodeType - Optional node type to return. Default is
	 * <mxConstants.NODETYPE_ELEMENT>.
	 */
	getChildNodes: function(node, nodeType)
	{
		nodeType = nodeType || mxConstants.NODETYPE_ELEMENT;
		
		var children = new Array();
		var tmp = node.firstChild;
		
		while (tmp != null)
		{
			if (tmp.nodeType == nodeType)
			{
				children.push(tmp);
			}
			
			tmp = tmp.nextSibling;
		}
		
		return children;
	},
		
	/**
	 * Function: createXmlDocument
	 * 
	 * Returns a new, empty XML document.
	 */
	createXmlDocument: function()
	{
		var doc = null;
		
		if (document.implementation && document.implementation.createDocument)
		{
			doc = document.implementation.createDocument("", "", null);
		}
		else if (window.ActiveXObject)
		{
			doc = new ActiveXObject("Microsoft.XMLDOM");
	 	}
	 	
	 	return doc;
	},

	/**
	 * Function: parseXml
	 * 
	 * Parses the specified XML string into a new XML document and returns the
	 * new document.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var doc = mxUtils.parseXml(
	 *   '<mxGraphModel><root><MyDiagram id="0"><mxCell/></MyDiagram>'+
	 *   '<MyLayer id="1"><mxCell parent="0" /></MyLayer><MyObject id="2">'+
	 *   '<mxCell style="strokeColor=blue;fillColor=red" parent="1" vertex="1">'+
	 *   '<mxGeometry x="10" y="10" width="80" height="30" as="geometry"/>'+
	 *   '</mxCell></MyObject></root></mxGraphModel>');
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * xml - String that contains the XML data.
	 */
	parseXml: function(xml)
	{
		if (mxClient.IS_IE)
		{
			return function(xml)
			{
				var result = mxUtils.createXmlDocument();
				
				result.async="false";
				result.loadXML(xml)
				
				return result;
			}
		}
		else
		{
			return function(xml)
			{
				var parser = new DOMParser();
				
				return parser.parseFromString(xml, "text/xml");
			}
		}
	}(),

	/**
	 * Function: createXmlElement
	 * 
	 * Creates a new XML element using <mxUtils.parseXml>.
	 */
	createXmlElement: function(nodeName)
	{
		return mxUtils.parseXml('<'+nodeName+'/>').documentElement;
	},

	/**
	 * Function: getPrettyXML
	 * 
	 * Returns a pretty printed string that represents the XML tree for the
	 * given node.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node to return the XML for.
	 * tab - Optional string that specifies the indentation for one level.
	 * Default is two spaces.
	 * indent - Optional string that represents the current indentation.
	 * Default is an empty string.
	 */
	getPrettyXml: function(node, tab, indent)
	{
		var result = new Array();
		
		if (node != null)
		{
			tab = tab || '  ';
			indent = indent || '';
			
			if (node.nodeType == mxConstants.NODETYPE_TEXT)
			{
				result.push(node.nodeValue);
			}
			else
			{
				result.push(indent + '<'+node.nodeName);
				
				// Creates the string with the node attributes
				// and converts all HTML entities in the values
				var attrs = node.attributes;
				
				if (attrs != null)
				{
					for (var i=0; i<attrs.length; i++)
					{
						var val = mxUtils.htmlEntities(attrs[i].nodeValue);
						result.push(' ' + attrs[i].nodeName +
							'="' + val + '"');
					}
				}

				// Recursively creates the XML string for each
				// child nodes and appends it here with an
				// indentation
				var tmp = node.firstChild;
				
				if (tmp != null)
				{
					result.push('>\n');
					
					while (tmp != null)
					{
						result.push(mxUtils.getPrettyXml(
							tmp, tab, indent + tab));
						tmp = tmp.nextSibling;
					}
					
					result.push(indent + '</'+node.nodeName+'>\n');
				}
				else
				{
					result.push('/>\n');
				}
			}
		}
		
		return result.join('');
	},
	
	/**
	 * Function: removeWhitespace
	 * 
	 * Removes the sibling text nodes for the given node that only consists
	 * of tabs, newlines and spaces.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node whose siblings should be removed.
	 * before - Optional boolean that specifies the direction of the traversal.
	 */
	removeWhitespace: function(node, before)
	{
		var tmp = (before) ? node.previousSibling : node.nextSibling;
		
		while (tmp != null &&
			tmp.nodeType == mxConstants.NODETYPE_TEXT)
		{
			var next = (before) ? tmp.previousSibling : tmp.nextSibling;
			
			var text = mxUtils.getTextContent(tmp).
				replace(/\t/g, '').
				replace(/\r\n/g, '').
				replace(/\n/g, '').
				replace(/^\s+/g, '').
				replace(/\s+$/g, '');
			
			if (text.length == 0)
			{
				tmp.parentNode.removeChild(tmp);
			}
			
			tmp = next;
		}
	},
	
	/**
	 * Function: htmlEntities
	 * 
	 * Replaces characters (less than, greater than, newlines and quotes) with
	 * their HTML entities in the given string and returns the result.
	 * 
	 * Parameters:
	 * 
	 * s - String that contains the characters to be converted.
	 * newline - If newlines should be replaced. Default is true.
	 */
	htmlEntities: function(s, newline)
	{
		s = s || '';
		
		s = s.replace(/&/g,'&amp;'); // 38 26
		s = s.replace(/"/g,'&quot;'); // 34 22
		s = s.replace(/\'/g,'&#39;'); // 39 27
		s = s.replace(/</g,'&lt;'); // 60 3C
		s = s.replace(/>/g,'&gt;'); // 62 3E

		if (newline == null ||
			newline)
		{
			s = s.replace(/\n/g, '&#xa;');
		}
		
		return s;
	},
	
	/**
	 * Function: isVml
	 * 
	 * Returns true if the given node is in the VML namespace.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node whose tag urn should be checked.
	 */
	isVml: function(node)
	{
		return node != null &&
			node.tagUrn == 'urn:schemas-microsoft-com:vml';
	},
	
	/**
	 * Function: getXml
	 * 
	 * Returns the XML content of the specified node. For Internet Explorer,
	 * all \r\n\t[\t]* are removed from the XML string and the remaining \r\n
	 * are replaced by \n. All \n are then replaced with linefeed, or &#xa; if
	 * no linefeed is defined.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node to return the XML for.
	 * linefeed - Optional string that linefeeds are converted into. Default is
	 * &#xa;
	 */
	getXml: function(node, linefeed)
	{
		var xml = '';
		if (node != null)
		{
			xml  = node.xml;
			if (xml == null)
			{
				if (mxClient.IS_IE)
				{
					xml = node.innerHTML;
				}
				else
				{
					var xmlSerializer = new XMLSerializer();
					xml = xmlSerializer.serializeToString(node);
				}
			}
			else
			{
				xml = xml.replace(/\r\n\t[\t]*/g, '').
					replace(/>\r\n/g, '>').
					replace(/\r\n/g, '\n');
			}
		}

		// Replaces linefeeds with HTML Entities.
		linefeed = linefeed || '&#xa;';
		xml = xml.replace(/\n/g, linefeed);
		
		return xml;
	},

	/**
	 * Function: getTextContent
	 * 
	 * Returns the text content of the specified node.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node to return the text content for.
	 */
	getTextContent: function(node)
	{
		var result = '';
		
		if (node != null)
		{
			if (node.firstChild != null)
			{
				node = node.firstChild;
			}
			
			result = node.nodeValue || '';
		}
		
		return result;
	},
	
	/**
	 * Function: getInnerHtml
	 * 
	 * Returns the inner HTML for the given node as a string or an empty string
	 * if no node was specified. The inner HTML is the text representing all
	 * children of the node, but not the node itself.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node to return the inner HTML for.
	 */
	getInnerHtml: function()
	{
		if (mxClient.IS_IE)
		{
			return function(node)
			{
				if (node != null)
				{
					return node.innerHTML;
				}
				return '';
			}
		}
		else
		{
			return function(node)
			{
				if (node != null)
				{
					var serializer = new XMLSerializer();
					return serializer.serializeToString(node);
				}
				return '';
			}
		}
	}(),

	/**
	 * Function: getOuterHtml
	 * 
	 * Returns the outer HTML for the given node as a string or an empty
	 * string if no node was specified. The outer HTML is the text representing
	 * all children of the node including the node itself.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node to return the outer HTML for.
	 */
	getOuterHtml: function()
	{
		if (mxClient.IS_IE)
		{
			return function(node)
			{
				if (node != null)
				{
					var tmp = new Array();
					tmp.push('<'+node.nodeName);
					
					var attrs = node.attributes;
					
					for (var i=0;i < attrs.length; i++)
					{
						var value = attrs[i].nodeValue;
						
						if (value != null && value.length > 0)
						{
							tmp.push(' ');
							tmp.push(attrs[i].nodeName);
							tmp.push('="');
							tmp.push(value);
							tmp.push('"');
						}
					}
					
					if (node.innerHTML.length == 0)
					{
						tmp.push('/>');
					}
					else
					{
						tmp.push('>');
						tmp.push(node.innerHTML);
						tmp.push('</'+node.nodeName+'>');
					}
					
					return tmp.join('');
				}
				return '';
			}
		}
		else
		{
			return function(node)
			{
				if (node != null)
				{
					var serializer = new XMLSerializer();
					return serializer.serializeToString(node);
				}
				return '';
			}
		}
	}(),
	
	/**
	 * Function: write
	 * 
	 * Creates a text node for the given string and appends it to the given
	 * parent. Returns the text node.
	 * 
	 * Parameters:
	 * 
	 * parent - DOM node to append the text node to.
	 * text - String representing the text to be added.
	 */
	write: function(parent, text)
	{
		var node = document.createTextNode(text);
		
		if (parent != null)
		{
			parent.appendChild(node);
		}
		
		return node;
	},
	
	/**
	 * Function: writeln
	 * 
	 * Creates a text node for the given string and appends it to the given
	 * parent with an additional linefeed. Returns the text node.
	 * 
	 * Parameters:
	 * 
	 * parent - DOM node to append the text node to.
	 * text - String representing the text to be added.
	 */
	writeln: function(parent, text)
	{
		var node = document.createTextNode(text);
		
		if (parent != null)
		{
			parent.appendChild(node);
			parent.appendChild(document.createElement('br'));
		}
		
		return node;
	},
	
	/**
	 * Function: br
	 * 
	 * Appends a linebreak to the given parent and returns the linebreak.
	 * 
	 * Parameters:
	 * 
	 * parent - DOM node to append the linebreak to.
	 */
	br: function(parent, count)
	{
		count = count || 1;
		
		var br;
		for (var i=0; i<count; i++)
		{
			br = document.createElement('br');
			
			if (parent != null)
			{
				parent.appendChild(br);
			}
		}
		
		return br;
	},
		
	/**
	 * Function: button
	 * 
	 * Returns a new button with the given level and function as an onclick
	 * event handler.
	 */
	button: function(label, funct)
	{
		var button = document.createElement('button');
		
		mxUtils.write(button, label);
		mxEvent.addListener(button, 'click', function(evt)
		{
			funct(evt);
		});
		
		return button;
	},
	
	/**
	 * Function: para
	 * 
	 * Appends a new paragraph with the given text to the specified parent and
	 * returns the paragraph.
	 * 
	 * Parameters:
	 * 
	 * parent - DOM node to append the text node to.
	 * text - String representing the text for the new paragraph.
	 */
	para: function(parent, text)
	{
		var p = document.createElement('p');
		
		mxUtils.write(p, text);
		if (parent != null)
		{
			parent.appendChild(p);
		}
		
		return p;
	},

	/**
	 * Function: linkAction
	 * 
	 * Adds a hyperlink to the specified parent that invokes action on the
	 * specified editor.
	 * 
	 * Parameters:
	 * 
	 * parent - DOM node to contain the new link.
	 * text - String that is used as the link label.
	 * editor - <mxEditor> that will execute the action.
	 * action - String that defines the name of the action to be executed.
	 * pad - Optional left-padding for the link. Default is 0.
	 */
	linkAction: function(parent, text, editor, action, pad)
	{
		var a = mxUtils.link(parent, text, function()
		{
			editor.execute(action)
		}, pad);
		
		return a;
	},

	/**
	 * Function: linkInvoke
	 * 
	 * Adds a hyperlink to the specified parent that invokes the specified
	 * function on the editor passing along the specified argument. The
	 * function name is the name of a function of the editor instance,
	 * not an action name.
	 * 
	 * Parameters:
	 * 
	 * parent - DOM node to contain the new link.
	 * text - String that is used as the link label.
	 * editor - <mxEditor> instance to execute the function on.
	 * functName - String that represents the name of the function.
	 * arg - Object that represents the argument to the function.
	 * pad - Optional left-padding for the link. Default is 0.
	 */
	linkInvoke: function(parent, text, editor, functName, arg, pad)
	{
		var a = mxUtils.link(parent, text, function()
		{
			editor[functName](arg)
		}, pad);
		
		return a;
	},
	
	/**
	 * Function: link
	 * 
	 * Adds a hyperlink to the specified parent and invokes the given function
	 * when the link is clicked.
	 * 
	 * Parameters:
	 * 
	 * parent - DOM node to contain the new link.
	 * text - String that is used as the link label.
	 * funct - Function to execute when the link is clicked.
	 * pad - Optional left-padding for the link. Default is 0.
	 */
	link: function(parent, text, funct, pad)
	{
		var a = document.createElement('span');
		
		a.style.color = 'blue';
		a.style.textDecoration = 'underline';
		a.style.cursor = 'pointer';
		
		if (pad != null)
		{
			a.style.paddingLeft = pad+'px';
		}
		mxEvent.addListener(a, 'click', funct);
		
		mxUtils.write(a, text);
		
		if (parent != null)
		{
			parent.appendChild(a);
		}
		
		return a;
	},

	/**
	 * Function: fit
	 * 
	 * Makes sure the given node is inside the visible area of the window.
	 */
	fit: function(node)
	{
		var left = node.offsetLeft;
		var width = node.offsetWidth;
			
		var b = document.body;
		var d = document.documentElement;
			
		var right = (b.scrollLeft || d.scrollLeft) +
			(b.clientWidth || d.clientWidth);
		
		if (left + width > right)
		{
			node.style.left = Math.max((b.scrollLeft || d.scrollLeft),
				right - width)+'px';
		}
		
		var top = parseInt(node.offsetTop);
		var height = parseInt(node.offsetHeight);
		
		var bottom = (b.scrollTop || d.scrollTop) +
			Math.max(b.clientHeight || 0, d.clientHeight);
		
		if (top + height > bottom)
		{
			node.style.top = Math.max((b.scrollTop || d.scrollTop),
				bottom - height)+'px';
		}
	},

	/**
	 * Function: open
	 * 
	 * Opens the specified file from the local filesystem and returns the
	 * contents of the file as a string. This implementation requires an
	 * ActiveX object in IE and special privileges in Firefox. Relative
	 * filenames are only supported in IE and will go onto the users'
	 * Desktop.
	 * 
	 * See known-issues before using this function.
	 * 
	 * Example:
	 * (code)
	 * var data = mxUtils.open('C:\\temp\\test.txt');
	 * mxUtils.alert('Data: '+data);
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * filename - String representing the local file name.
	 */
	open: function(filename)
	{
		// Requests required privileges in Firefox
		if (mxClient.IS_NS)
		{
			try
			{
				netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
			}
			catch (e)
			{
				mxUtils.alert('Permission to read file denied.');
				
				return '';
			}
			
			var file = Components.classes["@mozilla.org/file/local;1"].createInstance(Components.interfaces.nsILocalFile);
			file.initWithPath(filename);
			
			if (!file.exists())
			{
				mxUtils.alert('File not found.');
				return '';
			}
			
			var is = Components.classes["@mozilla.org/network/file-input-stream;1"].createInstance(Components.interfaces.nsIFileInputStream);
			is.init(file,0x01, 00004, null);
			
			var sis = Components.classes["@mozilla.org/scriptableinputstream;1"].createInstance(Components.interfaces.nsIScriptableInputStream);
			sis.init(is);
			
			var output = sis.read(sis.available());
			
			return output;
		}
		else
		{
			var activeXObject = new ActiveXObject("Scripting.FileSystemObject");
			
			var newStream = activeXObject.OpenTextFile(filename, 1);
			var text = newStream.readAll();
			newStream.close();
			
			return text;
		}
		return null;
	},
	
	/**
	 * Function: save
	 * 
	 * Saves the specified content in the given file on the local file system.
	 * This implementation requires an ActiveX object in IE and special
	 * privileges in Firefox. Relative filenames are only supported in IE and
	 * will be loaded from the users' Desktop.
	 * 
	 * See known-issues before using this function.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var data = 'Hello, World!';
	 * mxUtils.save('C:\\test.txt', data);
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * filename - String representing the local file name.
	 */
	save: function(filename, content)
	{
		if (mxClient.IS_NS)
		{
			try
			{
				netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
			}
		    catch (e)
		    {
		    	mxUtils.alert('Permission to write file denied.');
		    	return;
		    }
		    
			var file = Components.classes["@mozilla.org/file/local;1"].createInstance(Components.interfaces.nsILocalFile);
			file.initWithPath(filename);
			
			if (!file.exists())
			{
				file.create(0x00, 0644);
			}
			
			var outputStream = Components.classes["@mozilla.org/network/file-output-stream;1"].createInstance(Components.interfaces.nsIFileOutputStream);
			
			outputStream.init(file, 0x20 | 0x02,00004, null);
            outputStream.write(content, content.length);
            outputStream.flush();
            outputStream.close();
		}
		else
		{
			var fso = new ActiveXObject('Scripting.FileSystemObject');
			
			var file = fso.CreateTextFile(filename, true);
			file.Write(content);
			file.Close();
		}
	},
	
	/**
	 * Function: saveAs
	 * 
	 * Saves the specified content by displaying a dialog to save the content
	 * as a file on the local filesystem. This implementation does not use an
	 * ActiveX object in IE, however, it does require special privileges in
	 * Firefox.
	 * 
	 * See known-issues before using this function. It is not recommended using
	 * this function in production environment as access to the filesystem
	 * cannot be guaranteed in Firefox. The following code is used in
	 * Firefox to try and enable saving to the filesystem.
	 * 
	 * (code)
	 * netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
	 * (end)
	 * 
	 * Example:
	 * 
	 * (code)
	 * mxUtils.saveAs('Hello, World!');
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * content - String representing the file's content.
	 */
	saveAs: function(content)
	{
		var iframe = document.createElement('iframe');
		
		iframe.setAttribute('src', '');
		
		iframe.style.visibility = 'hidden';
		iframe.style.display = 'none';
		
		document.body.appendChild(iframe);
		
		try
		{
			if (mxClient.IS_NS)
			{
				var doc = iframe.contentDocument;
				
				doc.open();
				doc.write(content);
				doc.close();
				
				try
				{
					netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
					// TODO: File contains HTML markup
					iframe.focus();
					saveDocument(doc);
				}
			    catch (e)
			    {
			    	mxUtils.alert('Permission to save document denied.');
			    }
			}
			else
			{
				var doc = iframe.contentWindow.document;
				doc.write(content);
				doc.execCommand('SaveAs', false, document.location);
			}
		}
		finally
		{
			document.body.removeChild(iframe);
		}
	},
	
	/**
	 * Function: copy
	 * 
	 * Copies the specified content to the local clipboard. This implementation
	 * requires special privileges in Firefox.
	 * 
	 * Parameters:
	 * 
	 * content - String to be copied to the clipboard.
	 */
	copy: function(content)
	{
	 	if (window.clipboardData)
	 	{
			window.clipboardData.setData("Text", content);
		}
		else
		{
			netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');

			var clip = Components.classes['@mozilla.org/widget/clipboard;1']
				.createInstance(Components.interfaces.nsIClipboard);

			if (!clip)
			{
				return;
			}
		   
			var trans = Components.classes['@mozilla.org/widget/transferable;1']
		    	.createInstance(Components.interfaces.nsITransferable);

			if (!trans)
			{
				return;
			}
		   
			trans.addDataFlavor('text/unicode');
			var str = new Object();
			var len = new Object();
			var str = Components.classes["@mozilla.org/supports-string;1"]
				.createInstance(Components.interfaces.nsISupportsString);

			var copytext=content;
			str.data=copytext;
			trans.setTransferData("text/unicode",str,copytext.length*2);
			var clipid=Components.interfaces.nsIClipboard;
			
			clip.setData(trans,null,clipid.kGlobalClipboard);
		} 
	},

	/**
	 * Function: load
	 * 
	 * Loads the specified URL *synchronously* and returns the <mxXmlRequest>.
	 * Throws an exception if the file cannot be loaded. See <mxUtils.get> for
	 * an asynchronous implementation.
	 *
	 * Example:
	 * 
	 * (code)
	 * try
	 * {
	 *   var req = mxUtils.load(filename);
	 *   var root = req.getDocumentElement();
	 *   // Process XML DOM...
	 * }
	 * catch (ex)
	 * {
	 *   mxUtils.alert('Cannot load '+filename+': '+ex);
	 * }
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * url - URL to get the data from.
	 */
	load: function(url)
	{
		var req = new mxXmlRequest(url, null, 'GET', false);
		req.send();
		
		return req;
	},

	/**
	 * Function: get
	 * 
	 * Loads the specified URL *asynchronously* and invokes the given functions
	 * depending on the request status. Returns the <mxXmlRequest> in use. Both
	 * functions take the <mxXmlRequest> as the only parameter. See
	 * <mxUtils.load> for a synchronous implementation.
	 *
	 * Example:
	 * 
	 * (code)
	 * mxUtils.get(url, function(req)
	 * {
	 *    var root = req.getDocumentElement();
	 *    // Process XML DOM...
	 * });
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * url - URL to get the data from.
	 * onload - Optional function to execute for a successful response.
	 * onerror - Optional function to execute on error.
	 */
	get: function(url, onload, onerror)
	{
		return new mxXmlRequest(url, null, 'GET').send(onload, onerror);
	},
	
	/**
	 * Function: post
	 * 
	 * Posts the specified params to the given URL *asynchronously* and invokes
	 * the given functions depending on the request status. Returns the
	 * <mxXmlRequest> in use. Both functions take the <mxXmlRequest> as the
	 * only parameter.
	 *
	 * Example:
	 * 
	 * (code)
	 * mxUtils.post(url, 'key=value', function(req)
	 * {
	 * 	mxUtils.alert('Ready: '+req.isReady()+' Status: '+req.getStatus());
	 *  // Process req.getDocumentElement() using DOM API if OK...
	 * });
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * url - URL to get the data from.
	 * params - Parameters for the post request.
	 * onload - Optional function to execute for a successful response.
	 * onerror - Optional function to execute on error.
	 */
	post: function(url, params, onload, onerror)
	{
		return new mxXmlRequest(url, params).send(onload, onerror);
	},
	
	/**
	 * Function: submit
	 * 
	 * Submits the given parameters to the specified URL using
	 * <mxXmlRequest.simulate> and returns the <mxXmlRequest>.
	 * 
	 * Parameters:
	 * 
	 * url - URL to get the data from.
	 * params - Parameters for the form.
	 */
	submit: function(url, params, doc)
	{
		return new mxXmlRequest(url, params).simulate(doc);
	},
	
	/**
	 * Function: loadInto
	 * 
	 * Loads the specified URL *asynchronously* into the specified document,
	 * invoking onload after the document has been loaded. This implementation
	 * does not use <mxXmlRequest>, but the document.load method.
	 * 
	 * Parameters:
	 * 
	 * url - URL to get the data from.
	 * doc - The document to load the URL into.
	 * onload - Function to execute when the URL has been loaded.
	 */
	loadInto: function(url, doc, onload)
	{
		if (mxClient.IS_IE)
		{
			doc.onreadystatechange = function ()
			{
				if (doc.readyState == 4)
				{
					onload()
				}
			};
		}
		else
		{
			doc.addEventListener("load", onload, false);
		}
		
		doc.load(url);
	},
	
	/**
	 * Function: getValue
	 * 
	 * Returns the value for the given key in the given associative array or
	 * the given default value if the value is null.
	 * 
	 * Parameters:
	 * 
	 * array - Associative array that contains the value for the key.
	 * key - Key whose value should be returned.
	 * defaultValue - Value to be returned if the value for the given
	 * key is null.
	 */
	getValue: function(array, key, defaultValue)
	{
		var value = array[key];

		if (value == null)
		{
			value = defaultValue;			
		}
		
		return value;
	},

	/**
	 * Function: clone
	 * 
	 * Recursively clones the specified object ignoring all fieldnames in the
	 * given array of transient fields.
	 * 
	 * Parameters:
	 * 
	 * obj - Object to be cloned.
	 * transients - Optional array of string representing the fieldname to be
	 * ignored.
	 * shallow - Optional boolean argument to specify if a shallow clone should
	 * be created, that is, one where are object references are not cloned.
	 * Default is false.
	 */
	clone: function(obj, transients, shallow)
	{
		shallow = (shallow != null) ? shallow : false;
		var clone = null;
		
		if (obj != null &&
			typeof(obj.constructor) == 'function')
		{
			clone = new obj.constructor();
			
		    for (var i in obj)
		    {
		    	if (i != mxObjectIdentity.FIELD_NAME &&
		    		(transients == null ||
		    		mxUtils.indexOf(transients, i) < 0))
		    	{
			    	if (!shallow &&
			    		typeof(obj[i]) == 'object')
			    	{
			            clone[i] = mxUtils.clone(obj[i]);
			        }
			        else
			        {
			            clone[i] = obj[i];
			        }
				}
		    }
		}
		
	    return clone;
	},

	/**
	 * Function: equals
	 * 
	 * Compares two rectangles and returns true, if they are equal, that is, if x, y, width and
	 * height are equal or null in a.
	 * 
	 * Parameters:
	 * 
	 * a - <mxRectangle> to be compared.
	 * b - <mxRectangle> to be compared.
	 */
	equals: function(a, b)
	{
		return b != null &&
			   ((a.x == null || a.x == b.x) &&
			   (a.y == null || a.y == b.y) &&
			   (a.width == null || a.width == b.width) &&
			   (a.height == null || a.height == b.height));
	},

	/**
	 * Function: toString
	 * 
	 * Returns a textual representation of the specified object.
	 * 
	 * Parameters:
	 * 
	 * obj - Object to return the string representation for.
	 */
	toString: function(obj)
	{
	    var output = '';
	    
	    for (var i in obj)
	    {
	    	try
	    	{
			    if (obj[i] == null)
			    {
		            output += i + ' = [null]\n';
			    }
			    else if (typeof(obj[i]) == 'function')
			    {
		            output += i + ' => [Function]\n';
		        }
		        else if (typeof(obj[i]) == 'object')
		        {
		        	var ctor = mxUtils.getFunctionName(obj[i].constructor); 
		            output += i + ' => [' + ctor + ']\n';
		        }
		        else
		        {
		            output += i + ' = ' + obj[i] + '\n';
		        }
	    	}
	    	catch (e)
	    	{
	    		output += i + '=' + e.message;
	    	}
	    }
	    
	    return output;
	},

	/**
	 * Function: toRadians
	 * 
	 * Converts the given degree to radians.
	 */
	toRadians: function(deg)
	{
		return Math.PI * deg / 180;
	},

	/**
	 * Function: getBoundingBox
	 * 
	 * Returns the bounding box for the rotated rectangle.
	 */
	getBoundingBox: function(rect, rotation)
	{
        var result = null;

        if (rect != null &&
        	rotation != null &&
        	rotation != 0)
        {
            var rad = mxUtils.toRadians(rotation);
            var cos = Math.cos(rad);
            var sin = Math.sin(rad);

            var cx = new mxPoint(
            	rect.x + rect.width / 2,
            	rect.y  + rect.height / 2);

            var p1 = new mxPoint(rect.x, rect.y);
            var p2 = new mxPoint(rect.x + rect.width, rect.y);
            var p3 = new mxPoint(p2.x, rect.y + rect.height);
            var p4 = new mxPoint(rect.x, p3.y);

            p1 = mxUtils.getRotatedPoint(p1, cos, sin, cx);
            p2 = mxUtils.getRotatedPoint(p2, cos, sin, cx);
            p3 = mxUtils.getRotatedPoint(p3, cos, sin, cx);
            p4 = mxUtils.getRotatedPoint(p4, cos, sin, cx);

            result = new mxRectangle(p1.x, p1.y, 0, 0);
            result.add(new mxRectangle(p2.x, p2.y, 0, 0));
            result.add(new mxRectangle(p3.x, p3.y, 0, 0));
            result.add(new mxRectangle(p4.x, p4.Y, 0, 0));
        }

        return result;
	},

	/**
	 * Function: getRotatedPoint
	 * 
	 * Rotates the given point by the given cos and sin.
	 */
	getRotatedPoint: function(pt, cos, sin, cx)
	{
		cx = (cx != null) ? cx : new mxPoint();
		var x = pt.x - c.x;
		var y = pt.y - c.y;

		var x1 = x * cos - y * sin;
		var y1 = y * cos + x * sin;

		return new mxPoint(x1 + c.x, y1 + c.y);
	},

	/**
	 * Function: contains
	 * 
	 * Returns true if the specified point (x, y) is contained in the given rectangle.
	 * 
	 * Parameters:
	 * 
	 * bounds - <mxRectangle> that represents the area.
	 * x - X-coordinate of the point.
	 * y - Y-coordinate of the point.
	 */
	contains: function(bounds, x, y)
	{
		return (bounds.x <= x &&
				bounds.x + bounds.width >= x &&
				bounds.y <= y &&
				bounds.y + bounds.height >= y);
	},

	/**
	 * Function: intersects
	 * 
	 * Returns true if the two rectangles intersect.
	 * 
	 * Parameters:
	 * 
	 * a - <mxRectangle> to be checked for intersection.
	 * b - <mxRectangle> to be checked for intersection.
	 */
	intersects: function(a, b)
	{
		return mxUtils.contains(a, b.x, b.y) ||
			mxUtils.contains(a, b.x + b.width, b.y + b.height) ||
			mxUtils.contains(a, b.x + b.width, b.y) ||
			mxUtils.contains(a, b.x, b.y + b.height);
	},

	/**
	 * Function: getOffset
	 * 
	 * Returns the offset for the specified container as an <mxPoint>. The
	 * offset is the distance from the top left corner of the container to the
	 * top left corner of the document.
	 * 
	 * Parameters:
	 * 
	 * container - DOM node to return the offset for.
	 */
	getOffset: function(container)
	{
		// TODO: Take scrollbar into account
		var offsetLeft = 0;
		var offsetTop = 0;

		while (container.offsetParent)
		{
			offsetLeft += container.offsetLeft;
			offsetTop += container.offsetTop;
			
			container = container.offsetParent;
		}
		
		return new mxPoint(offsetLeft, offsetTop);
	},

	/**
	 * Function: getScrollOrigin
	 * 
	 * Returns the top, left corner of the viewrect as an <mxPoint>.
	 */
	getScrollOrigin: function(node)
	{
		var b = document.body;
		var d = document.documentElement;
		var sl = (b.scrollLeft || d.scrollLeft);
		var st = (b.scrollTop || d.scrollTop);
		
		var result = new mxPoint(sl, st);
		
		while (node != null &&
			node != b &&
			node != d)
		{
			result.x += node.scrollLeft;
			result.y += node.scrollTop;
			
			node = node.parentNode;
		}
		
		return result;
	},
	
	/**
	 * Function: convertPoint
	 * 
	 * Converts the specified point (x, y) using the offset of the specified
	 * container and returns a new <mxPoint> with the result.
	 * 
	 * Parameters:
	 * 
	 * container - DOM node to use for the offset.
	 * x - X-coordinate of the point to be converted.
	 * y - Y-coordinate of the point to be converted.
	 */
	convertPoint: function(container, x, y)
	{
		var origin = mxUtils.getScrollOrigin(container);
		var offset = mxUtils.getOffset(container);
		
		offset.x -= origin.x;
		offset.y -= origin.y;
		
		return new mxPoint(x-offset.x, y-offset.y);
	},
	
	/**
	 * Function: isNumeric
	 * 
	 * Returns true if the specified value is numeric, that is, if it is not
	 * null, not an empty string, not a HEX number and isNaN returns false.
	 * 
	 * Parameters:
	 * 
	 * str - String representing the possibly numeric value.
	 */
	isNumeric: function(str)
	{
		return str != null &&
				(str.length == null ||
				 (str.length > 0 &&
				 str.indexOf('0x') < 0) &&
				 str.indexOf('0X') < 0) &&
				!isNaN(str);
	},

	/**
	 * Function: intersection
	 * 
	 * Returns the intersection of two lines as an <mxPoint>.
	 * 
	 * Parameters:
	 * 
	 * x0 - X-coordinate of the first line's startpoint.
	 * y0 - X-coordinate of the first line's startpoint.
	 * x1 - X-coordinate of the first line's endpoint.
	 * y1 - Y-coordinate of the first line's endpoint.
	 * x2 - X-coordinate of the second line's startpoint.
	 * y2 - Y-coordinate of the second line's startpoint.
	 * x3 - X-coordinate of the second line's endpoint.
	 * y3 - Y-coordinate of the second line's endpoint.
	 */
	intersection: function (x0, y0, x1, y1, x2, y2, x3, y3)
	{
		var denom = ((y3 - y2)*(x1 - x0)) - ((x3 - x2)*(y1 - y0));
		var nume_a = ((x3 - x2)*(y0 - y2)) - ((y3 - y2)*(x0 - x2));
		var nume_b = ((x1 - x0)*(y0 - y2)) - ((y1 - y0)*(x0 - x2));

		var ua = nume_a / denom;
		var ub = nume_b / denom;
		
		if(ua >= 0.0 && ua <= 1.0 && ub >= 0.0 && ub <= 1.0)
		{
			// Get the intersection point
			var intersectionX = x0 + ua*(x1 - x0);
			var intersectionY = y0 + ua*(y1 - y0);
			
			return new mxPoint(intersectionX, intersectionY);
		}
		
		// No intersection
		return null;
	},
	
	/**
	 * Function: ptSeqDistSq
	 * 
	 * Returns the square distance between a segment and a point.
	 * 
	 * Parameters:
	 * 
	 * x1 - X-coordinate of the startpoint of the segment.
	 * y1 - Y-coordinate of the startpoint of the segment.
	 * x2 - X-coordinate of the endpoint of the segment.
	 * y2 - Y-coordinate of the endpoint of the segment.
	 * px - X-coordinate of the point.
	 * py - Y-coordinate of the point.
	 */
	ptSegDistSq: function(x1, y1, x2, y2, px, py)
    {
		x2 -= x1;
		y2 -= y1;

		px -= x1;
		py -= y1;

		var dotprod = px * x2 + py * y2;
		var projlenSq;

		if (dotprod <= 0.0)
		{
		    projlenSq = 0.0;
		}
		else
		{
		    px = x2 - px;
		    py = y2 - py;
		    dotprod = px * x2 + py * y2;

		    if (dotprod <= 0.0)
		    {
				projlenSq = 0.0;
		    }
		    else
		    {
				projlenSq = dotprod * dotprod / (x2 * x2 + y2 * y2);
		    }
		}

		var lenSq = px * px + py * py - projlenSq;
		
		if (lenSq < 0)
		{
		    lenSq = 0;
		}
		
		return lenSq;
    },
    	
	/**
	 * Function: relativeCcw
	 * 
	 * Returns 1 if the given point on the right side of the segment, 0 if its
	 * on the segment, and -1 if the point is on the left side of the segment.
	 * 
	 * Parameters:
	 * 
	 * x1 - X-coordinate of the startpoint of the segment.
	 * y1 - Y-coordinate of the startpoint of the segment.
	 * x2 - X-coordinate of the endpoint of the segment.
	 * y2 - Y-coordinate of the endpoint of the segment.
	 * px - X-coordinate of the point.
	 * py - Y-coordinate of the point.
	 */
	relativeCcw: function(x1, y1, x2, y2, px, py)
    {
		x2 -= x1;
		y2 -= y1;
		px -= x1;
		py -= y1;
		var ccw = px * y2 - py * x2;
		
		if (ccw == 0.0)
		{
		    ccw = px * x2 + py * y2;
		    
		    if (ccw > 0.0)
		    {
				px -= x2;
				py -= y2;
				ccw = px * x2 + py * y2;
				
				if (ccw < 0.0)
				{
				    ccw = 0.0;
				}
		    }
		}
		
		return (ccw < 0.0) ? -1 : ((ccw > 0.0) ? 1 : 0);
    },
    
	/**
	 * Function: animateChanges
	 * 
	 * Asynchronous animated move operation.
	 * 
	 * Example:
	 * (code)
	 * graph.model.addListener('change', function(sender, changes)
	 * {
	 *   if (changes.length < 10)
	 *   {
	 *     mxUtils.animateChanges(graph, changes);
	 *   }
	 * });
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> that received the changes.
	 * changes - Array of changes to be animated.
	 */
	animateChanges: function(graph, changes)
	{
		var self = graph; // closure

		var maxStep = 10;
		var step = 0;

		var animate = function() 
		{
			var isRequired = false;
			
			for (var i=0; i<changes.length; i++)
			{
				var change = changes[i];
				
				if (change.constructor == mxGeometryChange ||
					change.constructor == mxTerminalChange ||
					change.constructor == mxValueChange ||
					change.constructor == mxChildChange ||
					change.constructor == mxStyleChange)
				{
					var state = self.getView().getState(change.cell || change.child, false);
					
					if (state != null)
					{
						isRequired = true;
					
						if (change.constructor != mxGeometryChange || self.model.isEdge(change.cell))
						{
							mxUtils.setOpacity(state.shape.node, 100*step/maxStep);
						}
						else
						{
							var scale = graph.getView().scale;					

							var dx = (change.geometry.x - change.previous.x) * scale;
							var dy = (change.geometry.y - change.previous.y) * scale;
							
							var sx = (change.geometry.width - change.previous.width) * scale;
							var sy = (change.geometry.height - change.previous.height) * scale;
							
							if (step == 0)
							{
								state.x -= dx;
								state.y -= dy;
								state.width -= sx;
								state.height -= sy;
							}
							else
							{
								state.x += dx / maxStep;
								state.y += dy / maxStep;
								state.width += sx / maxStep;
								state.height += sy / maxStep;
							}
							
							self.cellRenderer.redraw(state);
							
							// Fades all connected edges and children
							mxUtils.cascadeOpacity(graph, change.cell, 100*step/maxStep);
						}
					}
				}
			}
			
			if (step < maxStep && isRequired)
			{
				step++;
				window.setTimeout(animate, delay);
			}
		}
		
		var delay = 30;
		animate();
	},
    
	/**
	 * Function: cascadeOpacity
	 * 
	 * Sets the opacity on the given cell and its descendants.
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> that contains the cells.
	 * cell - <mxCell> to set the opacity for.
	 * opacity - New value for the opacity in %.
	 */
    cascadeOpacity: function(graph, cell, opacity)
	{
		// Fades all children
		var childCount = graph.model.getChildCount(cell);
		
		for (var i=0; i<childCount; i++)
		{
			var child = graph.model.getChildAt(cell, i);
			var childState = graph.getView().getState(child);
			
			if (childState != null)
			{
				mxUtils.setOpacity(childState.shape.node, opacity);
				mxUtils.cascadeOpacity(graph, child, opacity);
			}
		}
		
		// Fades all connected edges
		var edges = graph.model.getEdges(cell);
		
		if (edges != null)
		{
			for (var i=0; i<edges.length; i++)
			{
				var edgeState = graph.getView().getState(edges[i]);
				
				if (edgeState != null)
				{
					mxUtils.setOpacity(edgeState.shape.node, opacity);
				}
			}
		}
	},
    
	/**
	 * Function: morph
	 * 
	 * Asynchronous animated move operation. The final step of the animation is
	 * to apply the move on the specified cells in the model using
	 * <mxGraph.move>.
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> to perform the move operation in.
	 * cells - Array of <mxCells> to be moved.
	 * dx - X-coordinate of the distance vector.
	 * dy - Y-coordinate of the distance vector.
	 * step - Optional integer specifying the step size in %. Default is 30.
	 * delay - Optional integer specifying the delay in ms. Default is 30.
	 */
	morph: function(graph, cells, dx, dy, step, delay)
	{
		step = step || 30;
		delay = delay || 30;
		
		var current = 0;
		
		var f = function()
		{
			var model = graph.getModel();
		    current = Math.min(100, current+step);
		    
		    for (var i=0; i<cells.length; i++)
		    {
		    	if (!model.isEdge(!cells[i]))
		    	{
					var state = graph.getCellBounds(cells[i]);
					
				    state.x += step * dx / 100;
				    state.y += step * dy / 100;
				    graph.cellRenderer.redraw(state);
				}
			}
			
			if (current < 100)
			{
				window.setTimeout(f, delay);
			}
			else
			{
				graph.move(cells, dx, dy);
			}
		};
		
		window.setTimeout(f, delay);
	},
	
	/**
	 * Function: fadeIn
	 * 
	 * Asynchronous fade-in operation.
	 */
	fadeIn: function(node, to, step, delay, isEnabled)
	{
		to = (to != null) ? to : 100;
		step = step || 40;
		delay = delay || 30;
		
		var opacity = 0;
		
		mxUtils.setOpacity(node, opacity);
		node.style.visibility = 'visible';
		
		if (isEnabled || isEnabled == null)
		{
			var f = function()
			{
			    opacity = Math.min(opacity+step, to);
				mxUtils.setOpacity(node, opacity);
				
				if (opacity < to)
				{
					window.setTimeout(f, delay);
				}
			};
			
			window.setTimeout(f, delay);
		}
		else
		{
			mxUtils.setOpacity(node, to);
		}
	},
	
	/**
	 * Function: fadeOut
	 * 
	 * Asynchronous fade-out operation.
	 */
	fadeOut: function(node, from, remove, step, delay, isEnabled)
	{
		step = step || 40;
		delay = delay || 30;
		
		var opacity = from || 100;
		
		mxUtils.setOpacity(node, opacity);
		
		if (isEnabled || isEnabled == null)
		{
			var f = function()
			{
			    opacity = Math.max(opacity-step, 0);
				mxUtils.setOpacity(node, opacity);
				
				if (opacity > 0)
				{
					window.setTimeout(f, delay);
				}
				else
				{
					node.style.visibility = 'hidden';
					
					if (remove && node.parentNode)
					{
						node.parentNode.removeChild(node);
					}
				}
			};
			window.setTimeout(f, delay);
		}
		else
		{
			node.style.visibility = 'hidden';
			
			if (remove && node.parentNode)
			{
				node.parentNode.removeChild(node);
			}
		}
	},
	
	/**
	 * Function: setOpacity
	 * 
	 * Sets the opacity of the specified DOM node to the given value in %.
	 * 
	 * Parameters:
	 * 
	 * node - DOM node to set the opacity for.
	 * value - Opacity in %. Possible values are between 0 and 100.
	 */
	setOpacity: function(node, value)
	{
		if (mxUtils.isVml(node))
		{
	    	if (value >= 100)
	    	{
	    		node.style.filter = null;
	    	}
	    	else
	    	{
	    		// TODO: Why is the division by 5 needed in VML?
			    node.style.filter = "alpha(opacity=" + (value/5) + ")";
	    	}
		}
		else if (mxClient.IS_IE)
	    {
	    	if (value >= 100)
	    	{
	    		node.style.filter = null;
	    	}
	    	else
	    	{
			    node.style.filter = "alpha(opacity=" + value + ")";
	    	}
		}
		else
		{
		    node.style.opacity = (value / 100);
		}
	},

	/**
	 * Function: createImage
	 * 
	 * Creates a DOM node (image or div) for cross-browser support of
	 * transparency in PNG images. This returns an image node with the src
	 * property set unless the image is a PNG and the client is IE < 7, in
	 * which case it returns a DIV with a special filter applied.
	 * 
	 * Parameters:
	 * 
	 * src - URL that points to the image to be displayed.
	 */
	createImage: function(src)
	{
        var imgName = src.toUpperCase()
        var imageNode = null;
        
   	    if (imgName.substring(imgName.length-3,
   	    	imgName.length).toUpperCase() == "PNG" &&
   	    	mxClient.IS_IE && !mxClient.IS_IE7)
   	    {
			imageNode = document.createElement('DIV');
			imageNode.style.filter = 'progid:DXImageTransform.Microsoft.AlphaImageLoader (src=\''+
				src+'\', sizingMethod=\'scale\')';
		}
		else
		{
			imageNode = document.createElement('image');
			imageNode.setAttribute('src', src);
		}
		
		return imageNode;
	},

	/**
	 * Function: getStylename
	 * 
	 * Returns the stylename in a style of the form [stylename;|key=value;] or an
	 * empty string if the given style does not contain a stylename.
	 * 
	 * Parameters:
	 * 
	 * style - String of the form [stylename;|key=value;].
	 */
	getStylename: function(style)
	{
		if (style != null)
		{
			var pairs = style.split(';');
			var stylename = pairs[0];
			
			if (stylename.indexOf('=') < 0)
			{
				return stylename;
			}
		}
				
		return '';
	},

	/**
	 * Function: getStylenames
	 * 
	 * Returns the stylenames in a style of the form [stylename;|key=value;] or an
	 * empty array if the given style does not contain any stylenames.
	 * 
	 * Parameters:
	 * 
	 * style - String of the form [stylename;|key=value;].
	 */
	getStylenames: function(style)
	{
		var result = new Array();
		
		if (style != null)
		{
			var pairs = style.split(';');
			
			for (var i = 0; i < pairs.length; i++)
			{
				if (pairs[i].indexOf('=') < 0)
				{
					result.push(pairs[i]);
				}
			}
		}
				
		return result;
	},
	
	/**
	 * Function: indexOfStylename
	 * 
	 * Returns the index of the given stylename in the given style. This
	 * returns -1 if the given stylename does not occur (as a stylename) in the
	 * given style, otherwise it returns the index of the first character.
	 */
	indexOfStylename: function(style, stylename)
	{
		if (style != null &&
			stylename != null)
		{
			var tokens = style.split(';');
			var pos = 0;
			
			for (var i = 0; i < tokens.length; i++)
			{
				if (tokens[i] == stylename)
				{
					return pos;
				}
				
				pos += tokens[i].length + 1;
			}
		}
		
		return -1;
	},
	
	/**
	 * Function: addStylename
	 * 
	 * Adds the specified stylename to the given style if it does not already
	 * contain the stylename.
	 */
	addStylename: function(style, stylename)
	{
		if (mxUtils.indexOfStylename(style, stylename) < 0)
		{
			if (style == null)
			{
				style = "";
			}
			else if (style.length > 0 &&
				style.charAt(style.length - 1) != ';')
			{
				style += ';';
			}
			
			style += stylename;
		}
		
		return style;
	},
	
	/**
	 * Function: removeStylename
	 * 
	 * Removes all occurrences of the specified stylename in the given style
	 * and returns the updated style. Trailing semicolons are not preserved.
	 */
	removeStylename: function(style, stylename)
	{
		var result = new Array();
		
		if (style != null)
		{
			var tokens = style.split(';');
			
			for (var i = 0; i < tokens.length; i++)
			{
				if (tokens[i] != stylename)
				{
					result.push(tokens[i]);
				}
			}
		}
		
		return result.join(';');
	},
	
	/**
	 * Function: removeAllStylenames
	 * 
	 * Removes all stylenames from the given style and returns the updated
	 * style.
	 */
	removeAllStylenames: function(style)
	{
		var result = new Array();
		
		if (style != null)
		{
			var tokens = style.split(';');
			
			for (var i = 0; i < tokens.length; i++)
			{
				// Keeps the key, value assignments
				if (tokens[i].indexOf('=') >= 0)
				{
					result.push(tokens[i]);
				}
			}
		}
		
		return result.join(';');
	},

	/**
	 * Function: setCellStyles
	 * 
	 * Assigns the value for the given key in the styles of the given cells, or
	 * removes the key from the styles if the value is null.
	 * 
	 * Parameters:
	 * 
	 * model - <mxGraphModel> to execute the transaction in.
	 * cells - Array of <mxCells> to be updated.
	 * key - Key of the style to be changed.
	 * value - New value for the given key.
	 */
	setCellStyles: function(model, cells, key, value)
	{
		if (cells != null &&
			cells.length > 0)
		{
			model.beginUpdate();
			try
			{
				for (var i=0; i<cells.length; i++)
				{
					if (cells[i] != null)
					{
						var style = mxUtils.setStyle(
							model.getStyle(cells[i]),
							key, value);
						model.setStyle(cells[i], style);
					}
				}
			}
			finally
			{
				model.endUpdate();
			}
		}
	},
	
	/**
	 * Function: setStyle
	 * 
	 * Adds or removes the given key, value pair to the style and returns the
	 * new style. If value is null or zero length then the key is removed from
	 * the style. This is for cell styles, not for CSS styles.
	 * 
	 * Parameters:
	 * 
	 * style - String of the form [stylename;|key=value;]
	 * key - Key of the style to be changed.
	 * value - New value for the given key.
	 */
	setStyle: function(style, key, value)
	{
		var isValue = value != null &&
			(typeof(value.length) == 'undefined' ||
			value.length > 0);
		
		if (style == null ||
			style.length == 0)
		{
			if (isValue)
			{
				style = key+'='+value;
			}
		}
		else
		{
			var index = style.indexOf(key+'=');
			
			if (index < 0)
			{
				if (isValue)
				{
					var sep = (style.charAt(style.length-1) == ';') ? '' : ';';
					style = style + sep + key+'='+value;
				}
			}
			else
			{
				var tmp = (isValue) ? key + '=' + value : '';
				var cont = style.indexOf(';', index);
				style = style.substring(0, index) + tmp +
					((cont >= 0) ? style.substring(cont) : '');
			}
		}
		
		return style;
	},

	/**
	 * Function: setCellStyleFlags
	 * 
	 * Sets or toggles the flag bit for the given key in the cell's styles.
	 * If value is null then the flag is toggled.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var cells = graph.getSelectionCells();
	 * mxUtils.setCellStyleFlags(graph.model,
	 * 			cells,
	 * 			mxConstants.STYLE_FONTSTYLE,
	 * 			mxConstants.FONT_BOLD);
	 * (end)
	 * 
	 * Toggles the bold font style.
	 * 
	 * Parameters:
	 * 
	 * model - <mxGraphModel> that contains the cells.
	 * cells - Array of <mxCells> to change the style for.
	 * key - Key of the style to be changed.
	 * flag - Integer for the bit to be changed.
	 * value - Optional boolean value for the flag.
	 */
	setCellStyleFlags: function(model, cells, key, flag, value)
	{
		if (cells != null && cells.length > 0)
		{
			model.beginUpdate();
			try
			{
				for (var i=0; i<cells.length; i++)
				{
					if (cells[i] != null)
					{
						var style = mxUtils.setStyleFlag(
							model.getStyle(cells[i]),
							key, flag, value);
						model.setStyle(cells[i], style);
					}
				}
			}
			finally
			{
				model.endUpdate();
			}
		}
	},
	
	/**
	 * Function: setStyleFlag
	 * 
	 * Sets or removes the given key from the specified style and returns the
	 * new style. If value is null then the flag is toggled.
	 * 
	 * Parameters:
	 * 
	 * style - String of the form [stylename;|key=value;].
	 * key - Key of the style to be changed.
	 * flag - Integer for the bit to be changed.
	 * value - Optional boolean value for the given flag.
	 */
	setStyleFlag: function(style, key, flag, value)
	{
		if (style == null || style.length == 0)
		{
			if (value || value == null)
			{
				style = key+'='+flag;
			}
			else
			{
				style = key+'=0';
			}
		}
		else
		{
			var index = style.indexOf(key+'=');
			
			if (index < 0)
			{
				var sep = (style.charAt(style.length-1) == ';') ? '' : ';';

				if (value || value == null)
				{
					style = style + sep + key + '=' + flag;
				}
				else
				{
					style = style + sep + key + '=0';
				}
			}
			else
			{
				var cont = style.indexOf(';', index);
				var tmp = '';
				
				if (cont < 0)
				{
					tmp  = style.substring(index+key.length+1);
				}
				else
				{
					tmp = style.substring(index+key.length+1, cont);
				}
				
				if (value == null)
				{
					tmp = parseInt(tmp) ^ flag;
				}
				else if (value)
				{
					tmp = parseInt(tmp) | flag;
				}
				else
				{
					tmp = parseInt(tmp) & ~flag;
				}
				
				style = style.substring(0, index) + key + '=' + tmp +
					((cont >= 0) ? style.substring(cont) : '');
			}
		}
		
		return style;
	},
	
	/**
	 * Function: getSizeForString
	 * 
	 * Returns an <mxRectangle> with the size (width and height in pixels) of
	 * the given string. The string may contain HTML markup. Newlines should be
	 * converted to <br> before calling this method.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var label = graph.getLabel(cell).replace(/\n/g, "<br>");
	 * var size = graph.getSizeForString(label);
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * text - String whose size should be returned.
	 * fontSize - Integer that specifies the font size in pixels. Default is
	 * <mxConstants.DEFAULT_FONTSIZE>.
	 * fontFamily - String that specifies the name of the font family. Default
	 * is <mxConstants.DEFAULT_FONTFAMILY>.
	 */
	getSizeForString: function(text, fontSize, fontFamily)
	{
		var div = document.createElement('div');
		
		// Sets the font size and family if non-default
		div.style.fontSize = fontSize || mxConstants.DEFAULT_FONTSIZE;
		div.style.fontFamily = fontFamily || mxConstants.DEFAULT_FONTFAMILY
		
		// Disables block layout and outside wrapping and hides the div
		div.style.position = 'absolute';
		div.style.display = 'inline';
		div.style.visibility = 'hidden';

		// Adds the text and inserts into DOM for updating of size
		div.innerHTML = text;
		document.body.appendChild(div);
		
		// Gets the size and removes from DOM
		var size = new mxRectangle(0, 0, div.offsetWidth, div.offsetHeight);
		document.body.removeChild(div);
		
		return size;
	},
	
	/**
	 * Function: show
	 * 
	 * Copies the styles and the markup from the graph's container into the
	 * given document and removes all cursor styles. The document is returned.
	 * 
	 * This function should be called from within the document with the graph.
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> to be copied.
	 * doc - Document where the new graph is created.
	 */
	show: function(graph, doc)
	{
		if (doc == null)
		{
			var wnd = window.open();
			doc = wnd.document;
		}
		else
		{
			doc.open();
		}
		
		doc.write('<html xmlns:v="urn:schemas-microsoft-com:vml">');
		doc.write('<head>');
		
		var base = document.getElementsByTagName('base');
		
		for (var i=0; i<base.length; i++)
		{
			doc.write(mxUtils.getOuterHtml(base[i]));
		}
		
		var links = document.getElementsByTagName('link');
		
		for (var i=0; i<links.length; i++)
		{
			doc.write(mxUtils.getOuterHtml(links[i]));
		}

		var styles = document.getElementsByTagName('style');
		
		for (var i=0; i<styles.length; i++)
		{
			doc.write(mxUtils.getOuterHtml(styles[i]));
		}

		doc.write('</head>');

		var bounds = graph.getBounds();
		var dx = Math.min(bounds.x, 0);
		var dy = Math.min(bounds.y, 0);

		if (mxClient.IS_IE)
		{
			doc.write('<body>');
			var tmp = mxUtils.getInnerHtml(graph.container);
		    doc.write(tmp);
		    
		    // Makes sure the inner container is on the top, left
		    var node = doc.body.getElementsByTagName('DIV')[0];
		    
		    if (node != null)
		    {
			    node.style.position = 'absolute';
			    node.style.left = -dx+'px';
			    node.style.top = -dy+'px';
		    }
		    
			doc.write('</body>');
			doc.write('</html>');
			doc.close();
		}
		else
		{
			doc.write('</html>');
			doc.close();
			
			// Workaround for FF2 which has no body element in a document where
			// the body has been added using document.write
			doc.documentElement.appendChild(doc.createElement('body'));
				
			var bounds = graph.getBounds();
			var node = graph.container.firstChild;
			
			while (node != null)
			{
				var clone = node.cloneNode(true);
				doc.body.appendChild(clone);
				node = node.nextSibling;
			}
		}

		mxUtils.removeCursors(doc.documentElement);

		// Shifts negative coordinates into visible space
		if (!mxClient.IS_IE)
		{
			var bounds = graph.getBounds();
			var node = doc.getElementsByTagName('g')[0];

			if (node != null)
			{
				node.setAttribute('transform', 'translate('+
		    		(-dx)+','+(-dy)+')');
		    	
		    	// Updates the size of the SVG container
		    	var root = node.ownerSVGElement;
				root.setAttribute('width',
					bounds.width+Math.max(bounds.x, 0)+3);
				root.setAttribute('height',
					bounds.height+Math.max(bounds.y, 0)+3);
				
			    root.style.position = 'absolute';
			    root.style.left = dx+'px';
			    root.style.top = dy+'0px';
			}
		}
		
		return doc;
	},
	
	/**
	 * Function: print
	 * 
	 * Prints the specified graph using a new window and the built-in print
	 * dialog.
	 * 
	 * This function should be called from within the document with the graph.
	 * 
	 * Parameters:
	 * 
	 * graph - <mxGraph> to be printed.
	 */
	print: function(graph)
	{
		var wnd = window.open();
		mxUtils.show(graph, wnd.document);
		wnd.print();
		wnd.close();
	},	
	
	/**
	 * Function: popup
	 * 
	 * Shows the specified text content in a new <mxWindow> or a new browser
	 * window if isInternalWindow is false.
	 * 
	 * Parameters:
	 * 
	 * content - String that specifies the text to be displayed.
	 * isInternalWindow - Optional boolean indicating if an mxWindow should be
	 * used instead of a new browser window. Default is false.
	 */
	popup: function(content, isInternalWindow)
	{
	   	if (isInternalWindow)
	   	{
			var div = document.createElement('div');
			
			div.style.overflow = 'scroll';
			div.style.width = '636px';
			div.style.height = '460px';
			
			var pre = document.createElement('pre');
		    pre.innerHTML = mxUtils.htmlEntities(content, false).
		    	replace(/\n/g,'<br>').replace(/ /g, '&nbsp;');
			
			div.appendChild(pre);
			
			var w = document.body.clientWidth;
			var h = (document.body.clientHeight || document.documentElement.clientHeight);
			var wnd = new mxWindow('Popup Window', div,
				w/2-320, h/2-240, 640, 480, false, true);

			wnd.setClosable(true);
			wnd.setVisible(true);
		}
		else
		{
			// Wraps up the XML content in a textarea
			if (mxClient.IS_NS)
			{
			    var wnd = window.open();
				wnd.document.write('<pre>'+mxUtils.htmlEntities(content)+'</pre');
			   	wnd.document.close();
			}
			else
			{
			    var wnd = window.open();
			    var pre = wnd.document.createElement('pre');
			    pre.innerHTML = mxUtils.htmlEntities(content, false).
			    	replace(/\n/g,'<br>').replace(/ /g, '&nbsp;');
			   	wnd.document.body.appendChild(pre);
			}
	   	}
	},
	
	/**
	 * Function: alert
	 * 
	 * Displayss the given alert in a new dialog. This implementation uses the
	 * built-in alert function. This is used to display validation errors when
	 * connections cannot be changed or created.
	 * 
	 * Parameters:
	 * 
	 * message - String specifying the message to be displayed.
	 */
	alert: function(message)
	{
		alert(message);
	},
	
	/**
	 * Function: prompt
	 * 
	 * Displays the given message in a prompt dialog. This implementation uses
	 * the built-in prompt function.
	 * 
	 * Parameters:
	 * 
	 * message - String specifying the message to be displayed.
	 * defaultValue - Optional string specifying the default value.
	 */
	prompt: function(message, defaultValue)
	{
		return prompt(message, defaultValue);
	},
	
	/**
	 * Function: confirm
	 * 
	 * Displays the given message in a confirm dialog. This implementation uses
	 * the built-in confirm function.
	 * 
	 * Parameters:
	 * 
	 * message - String specifying the message to be displayed.
	 */
	confirm: function(message)
	{
		return confirm(message);
	},

	/**
	 * Function: error
	 * 
	 * Displays the given error message in a new <mxWindow> of the given width.
	 * If close is true then an additional close button is added to the window.
	 * The optional icon specifies the icon to be used for the window. Default
	 * is <mxUtils.errorImage>.
	 * 
	 * Parameters:
	 * 
	 * message - String specifying the message to be displayed.
	 * width - Integer specifying the width of the window.
	 * close - Optional boolean indicating whether to add a close button.
	 * icon - Optional icon for the window decoration.
	 */
	error: function(message, width, close, icon)
	{
		var div = document.createElement('div');
		div.style.padding = '20px';

		var img = document.createElement('img');
		img.setAttribute('src', icon || mxUtils.errorImage);
		img.setAttribute('valign', 'bottom');
		img.style.verticalAlign = 'middle';
		div.appendChild(img);

		div.appendChild(document.createTextNode('\u00a0')); // &nbsp;
		div.appendChild(document.createTextNode('\u00a0')); // &nbsp;
		div.appendChild(document.createTextNode('\u00a0')); // &nbsp;
		mxUtils.write(div, message);

		var w = document.body.clientWidth;
		var h = (document.body.clientHeight || document.documentElement.clientHeight);
		var warn = new mxWindow(mxResources.get(mxUtils.errorResource) ||
			mxUtils.errorResource, div, (w-width)/2, h/4, width, null,
			false, true);

		if (close)
		{
			mxUtils.br(div);
			
			var tmp = document.createElement('p');
			var button = document.createElement('button');

			if (mxClient.IS_IE)
			{
				button.style.cssText = 'float:right';
			}
			else
			{
				button.setAttribute('style', 'float:right');
			}

			mxEvent.addListener(button, 'click', function(evt)
			{
				warn.destroy();
			});

			mxUtils.write(button, mxResources.get(mxUtils.closeResource) ||
				mxUtils.closeResource);
			
			tmp.appendChild(button);
			div.appendChild(tmp);
			
			mxUtils.br(div);
			
			warn.setClosable(true);
		}
		
		warn.setVisible(true);
		
		return warn;
	},

	/**
	 * Function: makeDraggable
	 * 
	 * Configures the given DOM element to act as a drag source for the
	 * specified graph.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var funct = function(graph, evt, cell)
	 * {
	 *   var pt = graph.getPointForEvent(evt);
	 *   var parent = graph.getDefaultParent();
	 *   var vertex = null;
	 *   graph.getModel().beginUpdate();
	 *   try
	 *   {
	 * 	   vertex = graph.insertVertex(parent, null, 'Hello', pt.x, pt.y, 80, 30);
	 *   }
	 *   finally
	 *   {
	 *     graph.getModel().endUpdate();
	 *   }
	 *
	 *   graph.setSelectionCell(vertex);
	 * }
	 * 
	 * var img = document.createElement('img');
	 * img.setAttribute('src', 'editors/images/rectangle.gif');
	 * img.style.position = 'absolute';
	 * img.style.left = '0px';
	 * img.style.top = '0px';
	 * img.style.width = '16px';
	 * img.style.height = '16px';
	 * 
	 * var dragImage = img.cloneNode(true);
	 * dragImage.style.width = '32px';
	 * dragImage.style.height = '32px';
	 * mxUtils.makeDraggable(img, graph, funct, dragImage);
	 * document.body.appendChild(img);
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * element - DOM element to make draggable.
	 * graph - <mxGraph> that acts as the drop target.
	 * funct - Function to execute on a successful drop.
	 * dragElement - Optional DOM node to be used for the drag preview.
	 * dx - Optional horizontal offset between the cursor and the drag
	 * preview.
	 * dy - Optional vertical offset between the cursor and the drag
	 * preview.
	 */
	makeDraggable: function(element, graph, funct, dragElement, dx, dy, autoscroll)
	{
		dx = (dx != null) ? dx : 0;
		dy = (dy != null) ? dy : mxConstants.TOOLTIP_VERTICAL_OFFSET;
		
		// Handles a drag gesture on the element
		mxEvent.addListener(element, 'mousedown', function(evt)
		{
			if (!mxEvent.isConsumed(evt))
			{
				// Uses the dragElement or transparent clone of the
				// source element as a drag icon for the gesture
				var sprite = (dragElement != null) ?
					dragElement.cloneNode(true) :
					element.cloneNode(true);
	
				// Sprite appears transparent on top of all windows
				sprite.style.zIndex = 3;
				sprite.style.position = 'absolute';
				mxUtils.setOpacity(sprite, 70);
				
				// Makes sure we do not have to rely on checking the
				// parentNode of the sprite to see if we have already
				// inserted it into the DOM. This is because in IE,
				// the parentNode is not null after cloning!
				var initialized = false;
				var startX = evt.clientX;
				var startY = evt.clientY;
	
				// Adds a temporary pair of listeners to intercept
				// the gesture event in the document
				var dragHandler = function(evt)
				{
					var origin = mxUtils.getScrollOrigin();
					sprite.style.left = (evt.clientX + origin.x + dx) + 'px';
					sprite.style.top = (evt.clientY + origin.y + dy) + 'px';
	
					if (!initialized)
					{
						initialized = true;
						document.body.appendChild(sprite);
					}
					else if (graph.autoScroll &&
							(autoscroll == null || autoscroll))
					{
						graph.scrollEventToVisible(evt, graph.autoExtend);
					}
					
					mxEvent.consume(evt);
				};
				
				var dropHandler = function(evt)
				{
					mxEvent.removeListener(document, 'mousemove', dragHandler);
					mxEvent.removeListener(document, 'mouseup', dropHandler);
	
					if (sprite.parentNode != null)
					{
						sprite.parentNode.removeChild(sprite);
					}
	
					try
					{
						// Dispatches the drop event to the graph which
						// consumes and executes the source function
						var pt = mxUtils.convertPoint(graph.container, evt.clientX,
							evt.clientY);
			
						// Checks if target point is inside graph and
						// the drag gesture was larger than 2*tolerance
						var tol = 2 * graph.tolerance;
						
						if (pt.x >= graph.container.scrollLeft &&
							pt.y >= graph.container.scrollTop &&
							pt.x <= graph.container.scrollLeft +
								graph.container.clientWidth &&
							pt.y <= graph.container.scrollTop +
								graph.container.clientHeight &&
							(Math.abs(evt.clientX - startX) > tol ||
							Math.abs(evt.clientY - startY) > tol))
						{
							var target = graph.getCellAt(pt.x, pt.y);
							funct(graph, evt, target);
						}
					}
					finally
					{
						mxEvent.consume(evt);
					}
				};
	
				mxEvent.addListener(document, 'mousemove', dragHandler);
				mxEvent.addListener(document, 'mouseup', dropHandler);
				
				mxEvent.consume(evt);
			}
		});
	}

};
