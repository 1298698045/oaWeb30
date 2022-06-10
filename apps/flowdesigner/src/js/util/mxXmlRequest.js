/**
 * $Id: mxXmlRequest.js,v 1.16 2008/07/14 14:58:14 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxXmlRequest
 * 
 * XML HTTP request wrapper. See also: <mxUtils.get>, <mxUtils.post> and
 * <mxUtils.load>. This class provides a cross-browser abstraction for Ajax
 * requests.
 * 
 * Encoding:
 * 
 * For encoding international characters you should use the built-in
 * encodeURIComponent function on the post data (except for when using
 * <simulate> or <mxUtils.submit> in which case the conversion is
 * implicit). For automatic encoding of post data in <mxEditor> the
 * <mxEditor.escapePostData> switch can be set to true. The encoding
 * will be carried out using the conte type of the page. That is,
 * the page containing the editor should contain a meta
 * tag in the header, eg. 
 * <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 * 
 * Example:
 * 
 * (code)
 * var onload = function(req)
 * {
 *   mxUtils.alert(req.getDocumentElement());
 * }
 * 
 * var onerror = function(req)
 * {
 *   mxUtils.alert(req.getStatus());
 * }
 * new mxXmlRequest(url, 'key=value').send(onload, onerror);
 * (end)
 * 
 * Sends an asynchronous POST request to the specified URL.
 * 
 * Example:
 * 
 * (code)
 * var req = new mxXmlRequest(url, 'key=value', 'POST', false);
 * req.send();
 * mxUtils.alert(req.getDocumentElement());
 * (end)
 * 
 * Sends a synchronous POST request to the specified URL.
 */
{

	/**
	 * Constructor: mxXmlRequest
	 * 
	 * Constructs an XML HTTP request.
	 * 
	 * Parameters:
	 * 
	 * url - Target URL of the request.
	 * params - Form encoded parameters to send with a POST request.
	 * method - String that specifies the request method. Possible values are
	 * POST and GET. Default is POST.
	 * async - Boolean specifying if an asynchronous request should be used.
	 * Default is true.
	 * username - String specifying the username to be used for the request.
	 * password - String specifying the password to be used for the request.
	 */
	function mxXmlRequest(url, params, method, async, username, password)
	{
		this.url = url;
		this.params = params;
		this.method = method || 'POST';
		this.async = (async != null) ? async : true;
		this.username = username;
		this.password = password;
	};

	/**
	 * Variable: url
	 * 
	 * Holds the target URL of the request.
	 */
	mxXmlRequest.prototype.url = null;

	/**
	 * Variable: params
	 * 
	 * Holds the form encoded data for the POST request.
	 */
	mxXmlRequest.prototype.params = null;

	/**
	 * Variable: method
	 * 
	 * Specifies the request method. Possible values are POST and GET. Default
	 * is POST.
	 */
	mxXmlRequest.prototype.method = null;

	/**
	 * Variable: async
	 * 
	 * Boolean indicating if the request is asynchronous.
	 */
	mxXmlRequest.prototype.async = null;

	/**
	 * Variable: username
	 * 
	 * Specifies the username to be used for authentication.
	 */
	mxXmlRequest.prototype.username = null;

	/**
	 * Variable: password
	 * 
	 * Specifies the password to be used for authentication.
	 */
	mxXmlRequest.prototype.password = null;
	
	/**
	 * Variable: request
	 * 
	 * Holds the inner, browser-specific request object.
	 */
	mxXmlRequest.prototype.request = null;
	
	/**
	 * Function: isReady
	 * 
	 * Returns true if the response is ready.
	 */
	mxXmlRequest.prototype.isReady = function()
	{
		return this.request.readyState == 4;
	}

	/**
	 * Function: getDocumentElement
	 * 
	 * Returns the document element of the response XML document.
	 */
	mxXmlRequest.prototype.getDocumentElement = function()
	{
		var doc = this.getXml();
		
		if (doc != null)
		{
			return doc.documentElement;
		}
		
		return null;
	};
	
	/**
	 * Function: getXml
	 * 
	 * Returns the response as an XML document. Use <getDocumentElement> to get
	 * the document element of the XML document.
	 */
	mxXmlRequest.prototype.getXml = function()
	{
		var xml = this.request.responseXML;
		
		// Handles missing response headers in IE
		if (xml == null || xml.documentElement == null)
		{
			xml = mxUtils.parseXml(this.request.responseText);
		}
		
		return xml;
	};

	/**
	 * Function: getText
	 * 
	 * Returns the response as a string.
	 */
	mxXmlRequest.prototype.getText = function()
	{
		return this.request.responseText;
	};

	/**
	 * Function: getStatus
	 * 
	 * Returns the status as a number, eg. 404 for "Not found" or 200 for "OK".
	 * Note: The NS_ERROR_NOT_AVAILABLE for invalid responses cannot be cought.
	 */
	mxXmlRequest.prototype.getStatus = function()
	{
		return this.request.status;
	};

	/**
	 * Function: create
	 * 
	 * Creates and returns the inner <request> object.
	 */
	mxXmlRequest.prototype.create = function()
	{
		if (window.XMLHttpRequest)
		{
			return function()
			{
				return new XMLHttpRequest();
			};
		}
		else if (typeof(ActiveXObject) != "undefined")
		{
			return function()
			{
				return new ActiveXObject("Microsoft.XMLHTTP");
			};
		}
	}();

	/**
	 * Function: send
	 * 
	 * Send the <request> to the target URL using the specified functions to
	 * process the response asychronously.
	 * 
	 * Parameters:
	 * 
	 * onload - Function to be invoked if a successful response was received.
	 * onerror - Function to be called on any error.
	 */
	mxXmlRequest.prototype.send = function(onload, onerror)
	{
		this.request = this.create();
		
		if (this.request != null)
		{
			var self = this; // closure
			this.request.onreadystatechange = function()
			{
				if (self.isReady())
				{
					if (onload != null)
					{
						onload(self);
					}
				}
			}

			this.request.open(this.method, this.url, this.async,
				this.username, this.password);
			this.setRequestHeaders(this.request, this.params);
			this.request.send(this.params);
		}
	};

	/**
	 * Function: setRequestHeaders
	 * 
	 * Sets the headers for the given request and parameters. This sets the
	 * content-type to application/x-www-form-urlencoded if any params exist.
	 * 
	 * Example:
	 * 
	 * (code)
	 * request.setRequestHeaders = function(request, params)
	 * {
	 *   if (params != null)
	 *   {
	 *     request.setRequestHeader('Content-Type',
     *             'multipart/form-data');
     *     request.setRequestHeader('Content-Length',
     *             params.length);
     *   }
     * };
     * (end)
     * 
     * Use the code above before calling <send> if you require a
     * multipart/form-data request.   
	 */
	mxXmlRequest.prototype.setRequestHeaders = function(request, params)
	{
		if (params != null)
		{
			request.setRequestHeader('Content-Type',
				'application/x-www-form-urlencoded');
		}
	};
	
	/**
	 * Function: simulate
	 * 
	 * Creates and posts a request to the given target URL using a dynamically
	 * created form inside the given document.
	 * 
	 * Parameters:
	 * 
	 * docs - Document that contains the form element.
	 * target - Target URL to send the form to.
	 */
	mxXmlRequest.prototype.simulate = function(doc, target)
	{
		doc = doc || document;
		var old = null;

		if (doc == document)
		{
			old = window.onbeforeunload;		
			window.onbeforeunload = null;
		}
				
		var form = doc.createElement('form');
		form.setAttribute('method', this.method);
		form.setAttribute('action', this.url);

		if (target != null)
		{
			form.setAttribute('target', target);
		}

		form.style.display = 'none';
		form.style.visibility = 'hidden';

		var pars = (this.params.indexOf('&') > 0) ?
			this.params.split('&') :
			this.params.split();

		// Adds the parameters as textareas to the form
		for (var i=0; i<pars.length; i++)
		{
			var pos = pars[i].indexOf('=');
			if (pos > 0)
			{
				var name = pars[i].substring(0, pos);
				var value = pars[i].substring(pos+1);
				
				var textarea = doc.createElement('textarea');
				textarea.setAttribute('name', name);
				value = value.replace(/\n/g, '&#xa;');
				
				var content = doc.createTextNode(value);
				textarea.appendChild(content);
				form.appendChild(textarea);
			}
		}
		
		doc.body.appendChild(form);
		form.submit();
		doc.body.removeChild(form);

		if (old != null)
		{		
			window.onbeforeunload = old;
		}
	};

}
