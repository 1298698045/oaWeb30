/**
 * $Id: mxSession.js,v 1.22 2008/02/09 15:59:30 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxSession
 *
 * Session for sharing an <mxGraphModel> with other parties
 * via a backend that acts as a multicaster for all changes.
 * 
 * Diagram Sharing:
 * 
 * The diagram sharing is a mechanism where each atomic change of the model is
 * encoded into XML using <mxCodec> and then transmitted to the server by the
 * <mxSession> object. On the server, the XML data is dispatched to each
 * listener on the same diagram (except the sender), and the XML is decoded
 * back into atomic changes on the client side, which are then executed on the
 * model and stored in the command history.
 * 
 * The <mxSession.significantRemoteChanges> specifies how these changes are
 * treated with respect to undo: The default value (true) will undo the last
 * change regardless of whether it was a remote or a local change. If the
 * switch is false, then an undo will go back until the last local change,
 * silently undoing all remote changes up to that point. Note that these
 * changes will be added as new remote changes to the history of the other
 * clients.
 * 
 * Event: connect
 *
 * Fires when the session has been started, that is, after
 * the response for the initial request has been received
 * and the session goes into polling mode. First argument
 * is the source <mxSession>.
 *
 * Event: suspend
 *
 * Fires when <suspend> has been called an the session was
 * not in suspended state. First argument is the source
 * <mxSession>.
 *
 * Event: resume
 *
 * Fires when the session has been resumed. First argument
 * is the source <mxSession>.
 *
 * Event: disconnect
 *
 * Fires when the session has been disconnected. First
 * argument is the source <mxSession>. Second argument
 * is a string containing any possible error messages.
 *
 * Event: notify
 *
 * Fires when a notification is being sent. First argument
 * is the source <mxSession>. Second argument contains the
 * URL being posted to and the third argument contains the
 * payload of the request (normally an XML string).
 *
 * Event: get
 *
 * Fires when the response of a get request is being received.
 * First argument is the source <mxSession>, second argument
 * is the URL get data originated from and the third argument
 * is the <mxXmlRequest> that contains the response data.
 *
 * Event: dispatched
 * 
 * Fires after the response of a request has been received
 * and dispatched via the model. First argument is the
 * source <mxSession>, second argument is the array of
 * changes.
 * 
 * Event: receive
 *
 * This event fires when the result of a request is being parsed.
 * First argument is the source <mxEvent>, second argument is
 * the XML node being processed. 
 */
{

	/**
	 * Constructor: mxSession
	 * 
	 * Constructs a new session using the given <mxGraphModel> and URLs to
	 * communicate with the backend.
	 * 
	 * Parameters:
	 * 
	 * model - <mxGraphModel> that contains the data.
	 * urlInit - URL to be used for initializing the session.
	 * urlPoll - URL to be used for polling the backend.
	 * urlNotify - URL to be used for sending changes to the backend.
	 */
	function mxSession(model, urlInit, urlPoll, urlNotify)
	{
		this.model = model;
		this.urlInit = urlInit;
		this.urlPoll = urlPoll;
		this.urlNotify = urlNotify;

		// Resolves cells by id using the model
		if (model != null)
		{
			this.codec = new mxCodec();
			
			this.codec.lookup = function(id)
			{
				return model.getCell(id);
			};
		}
		
		// Adds the listener for notifying the backend of any
		// changes in the model
		var self = this; // closure
		model.addListener('notify', function(sender, changes)
		{
			if (changes != null &&
				self.debug ||
				(self.connected &&
				!self.suspended))
			{
				self.notify(self.encodeChanges(changes));
			}
		});
	};

	/**
	 * Extends mxEventSource.
	 */
	mxSession.prototype = new mxEventSource();
	mxSession.prototype.constructor = mxSession;

	/**
	 * Variable: model
	 * 
	 * Reference to the enclosing <mxGraphModel>.
	 */
	mxSession.prototype.model = null;

	/**
	 * Variable: urlInit
	 * 
	 * URL to initialize the session.
	 */
	mxSession.prototype.urlInit = null;

	/**
	 * Variable: urlPoll
	 * 
	 * URL for polling the backend.
	 */
	mxSession.prototype.urlPoll = null;

	/**
	 * Variable: urlNotify
	 * 
	 * URL to send changes to the backend.
	 */
	mxSession.prototype.urlNotify = null;

	/**
	 * Variable: codec
	 * 
	 * Reference to the <mxCodec> used to encoding and decoding changes.
	 */
	mxSession.prototype.codec = null;

	/**
	 * Variable: linefeed
	 * 
	 * Used for encoding linefeeds. Default is \n.
	 */
	mxSession.prototype.linefeed = '\n';

	/**
	 * Variable: significantRemoteChanges
	 * 
	 * Whether remote changes should be significant in the
	 * local command history. Default is true.
	 */
	mxSession.prototype.significantRemoteChanges = true;

	/**
	 * Variable: sent
	 * 
	 * Total number of sent bytes.
	 */
	mxSession.prototype.sent = 0;

	/**
	 * Variable: received
	 * 
	 * Total number of received bytes.
	 */
	mxSession.prototype.received = 0;

	/**
	 * Variable: debug
	 * 
	 * Specifies if the session should run in debug mode. In this mode, no
	 * connection is established. The data is written to the console instead.
	 * Default is false.
	 */
	mxSession.prototype.debug = false;

	/**
	 * Variable: connected
	 */
	mxSession.prototype.connected = false;
		
	/**
	 * Variable: send
	 */
	mxSession.prototype.suspended = false;
		
	/**
	 * Variable: polling
	 */
	mxSession.prototype.polling = false;
	
	/**
	 * Function: start
	 */
	mxSession.prototype.start = function()
	{
		if (this.debug)
		{
			this.connected = true;
			this.dispatchEvent('connect', this);
		}
		else if (!this.connected)
		{
			var self = this; // closure
			this.get(this.urlInit, function(req)
			{
				self.connected = true;
				self.dispatchEvent('connect', self);
				self.poll();
			});
		}
	};

	/**
	 * Function: suspend
	 * 
	 * Suspends the polling. Use <resume> to reactive the session. Fires a
	 * suspend event.
	 */
	mxSession.prototype.suspend = function()
	{
		if (this.connected && !this.suspended)
		{
			this.suspended = true;
			this.dispatchEvent('suspend', this);
		}
	};
		
	/**
	 * Function: resume
	 * 
	 * Resumes the session if it has been suspended. Fires a resume-event
	 * before starting the polling.
	 */
	mxSession.prototype.resume = function(type, attr, value)
	{
		if (this.connected &&
			this.suspended)
		{
			this.suspended = false;
			this.dispatchEvent('resume', this);
			
			if (!this.polling)
			{
				this.poll();
			}
		}
	};
			
	/**
	 * Function: stop
	 * 
	 * Stops the session and fires a disconnect event. The given reason is
	 * passed to the disconnect event listener as the second argument.
	 */
	mxSession.prototype.stop = function(reason)
	{
		if (this.connected)
		{
			this.connected = false;
		}
		
		this.dispatchEvent('disconnect', this, reason);
	};

	/**
	 * Function: poll
	 * 
	 * Sends an asynchronous GET request to <urlPoll>.
	 */
	mxSession.prototype.poll = function()
	{
		if (this.connected &&
			!this.suspended &&
			this.urlPoll != null)
		{
			this.polling = true;
			
			var self = this; // closure
			this.get(this.urlPoll, function()
			{
				self.poll()
			});
		}
		else
		{
			this.polling = false;
		}
	};
	
	/**
	 * Function: notify
	 * 
	 * Sends out the specified XML to <urlNotify> and fires a <notify> event.
	 */
	mxSession.prototype.notify = function(xml, onLoad, onError)
	{
		if (xml != null &&
			xml.length > 0)
		{
			if (this.urlNotify != null)
			{
				if (this.debug)
				{
					mxLog.show();
					mxLog.debug('mxSession.notify: '+this.urlNotify+' xml='+xml);			
				}
				else
				{
					mxUtils.post(this.urlNotify, 'xml='+xml, onLoad, onError);
				}
			}
			
			this.sent += xml.length;
			this.dispatchEvent('notify', this, this.urlNotify, xml);
		}
	};

	/**
	 * Function: get
	 * 
	 * Sends an asynchronous get request to the given URL, fires a <get> event
	 * and invokes the given onLoad function when a response is received.
	 */
	mxSession.prototype.get = function(url, onLoad, onError)
	{
		// Response after browser refresh has no global scope
		// defined. This response is ignored and the session
		// stops implicitely.
		if (typeof(mxUtils) != 'undefined')
		{
			var self = this; // closure
			var onErrorWrapper = function(ex)
			{
				if (onError != null)
				{
					onError(ex);
				}
				else
				{
					self.stop(ex);
				}
			};

    		// Handles a successful response for
    		// the above request.
			var req = mxUtils.get(url,
				function(req)
				{
					if (typeof(mxUtils) != 'undefined')
					{
						try
						{
			    			if (req.isReady() &&
			    				req.getStatus() != 404)
			    			{
			    				self.received += req.getText().length;
								self.dispatchEvent('get', self, url, req);

								if (self.isValidResponse(req))
								{
					    			if (req.getText().length > 0)
					    			{
										var node = req.getDocumentElement();
										if (node == null)
										{
											onErrorWrapper('Invalid response: '+req.getText());
										}
										else
										{
											self.receive(node);
										}
									}
					    			if (onLoad != null)
					    			{
										onLoad(req);
									}
								}
							}
							else
							{
								onErrorWrapper('Response not ready');
							}
						}
						catch (ex)
						{
							onErrorWrapper(ex);
							throw ex; // debugging
						}
					}
				},
				
				// Handles a transmission error for the
				// above request
				function(req)
				{
					onErrorWrapper('Transmission error');
				}
			);
		}
	};

	/**
	 * Function: isValidResponse
	 * 
	 * Returns true if the response data in the given <mxXmlRequest> is valid.
	 */
	mxSession.prototype.isValidResponse = function(req)
	{
		// TODO: Find condition to check if response
		// contains valid XML (not eg. the PHP code).
		return req.getText().indexOf('<?php') < 0;
	};
	
	/**
	 * Function: encodeChanges
	 * 
	 * Returns the XML representation for the given array of changes.
	 */
	mxSession.prototype.encodeChanges = function(changes)
	{
		var xml = '';
		
		for (var i=0; i<changes.length; i++)
		{
			// Newlines must be kept, they will be converted
			// to &#xa; when the server sends data to the
			// client
			var node = this.codec.encode(changes[i]);
			xml += mxUtils.getXml(node, this.linefeed);
		}
		
		return xml;
	};

	/**
	 * Function: receive
	 * 
	 * Processes the given node by applying the changes to the model. If the nodename
	 * is state, then the namespace is used as a prefix for creating Ids in the model,
	 * and the child nodes are visited recursively. If the nodename is delta, then the
	 * changes encoded in the child nodes are applied to the model. Each call to the
	 * receive function fires a <receive> event with the given node as the second argument
	 * after processing. If changes are processed, then the function additionally fires
	 * a <dispatched> event before the <receive> event.
	 */
	mxSession.prototype.receive = function(node)
	{
		if (node != null &&
			node.nodeType == mxConstants.NODETYPE_ELEMENT)
		{
			var name = node.nodeName.toLowerCase();
			
			if (name == 'state')
			{
				// Receives child nodes
				var tmp = node.firstChild;
				
				while (tmp != null)
				{
					this.receive(tmp);
					tmp = tmp.nextSibling;
				}
				
				// Uses the namespace as a prefix
				// for ids created in the model.
				var sid = node.getAttribute('namespace');
				this.model.prefix = sid + '-';
			}
			else if (name == 'delta')
			{
				// Receives changes
				var changes = this.decodeChanges(node);
				
				if (changes.length > 0)
				{
					var edit = this.createUndoableEdit(changes);
					
					this.model.dispatchEvent('undo', this.model, edit);
					this.model.dispatchEvent('change', this.model, changes);
					this.dispatchEvent('dispatched', this, changes);
				}
			}
			
			// Dispatches receive event
			this.dispatchEvent('receive', this, node);
		}
	};

	/**
	 * Function: createUndoableEdit
	 * 
	 * Creates a new <mxUndoableEdit> that implements the
	 * notify function to fire a <change> and <notify> event
	 * via the model.
	 */
	mxSession.prototype.createUndoableEdit = function(changes)
	{
		var edit = new mxUndoableEdit(this.model, this.significantRemoteChanges);
		edit.changes = changes;
		
		edit.notify = function()
		{
			edit.source.dispatchEvent('change', edit.source, edit.changes);
			edit.source.dispatchEvent('notify', edit.source, edit.changes);
		}
		
		return edit;
	};
	
	/**
	 * Function: decodeChanges
	 * 
	 * Decodes and executes the changes represented by the children in the
	 * given node. Returns an array that contains all changes.
	 */
	mxSession.prototype.decodeChanges = function(node)
	{
		// Updates the document in the existing codec
		this.codec.document = node.ownerDocument;

		// Parses and executes the changes on the model
		var changes = new Array();
		node = node.firstChild;
		
		while (node != null)
		{
			if (node.nodeType == mxConstants.NODETYPE_ELEMENT)
			{
				// Handles the special case were no ids should be
				// resolved in the existing model. This change will
				// replace all registered ids and cells from the
				// model and insert a new cell hierarchy instead.
				var change = null;
				
				if (node.nodeName == 'mxRootChange')
				{
					var codec = new mxCodec(node.ownerDocument);
					change = codec.decode(node);
				}
				else
				{
					change = this.codec.decode(node);
				}
				
				if (change != null)
				{
					change.model = this.model;
					change.execute();
					changes.push(change);
				}
			}
			
			node = node.nextSibling;
		}
		
		return changes;
	};

}
