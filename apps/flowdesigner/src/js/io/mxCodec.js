/**
 * $Id: mxCodec.js,v 1.27 2008/07/14 14:58:14 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCodec
 *
 * XML codec for JavaScript object graphs. See <mxObjectCodec> for a
 * description of the general encoding/decoding scheme. This class uses the
 * codecs registered in <mxCodecRegistry> for encoding/decoding each object.
 * 
 * References:
 * 
 * In order to resolve references, especially forward references, the mxCodec
 * constructor must be given the document that contains the referenced
 * elements.
 *
 * Examples:
 *
 * The following code is used to encode a graph model.
 *
 * (code)
 * var encoder = new mxCodec();
 * var result = encoder.encode(graph.getModel());
 * var xml = mxUtils.getXml(result);
 * (end)
 * 
 * Example:
 * 
 * Using the following code, the selection cells of a graph are encoded and the
 * output is displayed in a dialog box.
 * 
 * (code
 * var enc = new mxCodec();
 * var cells = graph.getSelectionCells();
 * mxUtils.alert(mxUtils.getPrettyXml(enc.encode(cells)));
 * (end)
 * 
 * Newlines in the XML can be coverted to <br>, in which case a '<br>' argument
 * must be passed to <mxUtils.getXml> as the second argument.
 * 
 * Example:
 * 
 * Using the code below, an XML document is decodec into an existing model. The
 * document may be obtained using one of the functions in mxUtils for loading
 * an XML file, eg. <mxUtils.get>, or using <mxUtils.parseXml> for parsing an
 * XML string.
 * 
 * (code)
 * var decoder = new mxCodec(doc)
 * decoder.decode(doc.documentElement, graph.getModel());
 * (end)
 */
{

	/**
	 * Constructor: mxCodec
	 *
	 * Constructs an XML encoder/decoder for the specified
	 * owner document.
	 *
	 * Parameters:
	 *
	 * document - Optional XML document that contains the data.
	 * If no document is specified then a new document is created
	 * using <mxUtils.createXmlDocument>.
	 */
	function mxCodec(document)
	{
		this.document = document || mxUtils.createXmlDocument();
		this.objects = new Array();
	};

	/**
	 * Variable: document
	 *
	 * The owner document of the codec.
	 */
	mxCodec.prototype.document = null;

	/**
	 * Variable: objects
	 *
	 * Maps from IDs to objects.
	 */
	mxCodec.prototype.objects = null;

	/**
	 * Variable: encodeDefaults
	 *
	 * Specifies if default values should be encoded.
	 * Default is false.
	 */
	mxCodec.prototype.encodeDefaults = false;


	/**
	 * Function: putObject
	 * 
	 * Assoiates the given object with the given ID and
	 * returns the given object.
	 * 
	 * Parameters
	 * 
	 * id - ID for the object to be associated with.
	 * obj - Object to be associated with the ID.
	 */
	mxCodec.prototype.putObject = function(id, obj)
	{
		this.objects[id] = obj;
		
		return obj;
	};

	/**
	 * Function: getObject
	 *
	 * Returns the decoded object for the element with the specified ID in
	 * <document>. If the object is not known then <lookup> is used to find an
	 * object. If no object is found, then the element with the respective ID
	 * from the document is parsed using <decode>.
	 */
	mxCodec.prototype.getObject = function(id)
	{
		var obj = null;
		
		if (id != null)
		{
			obj = this.objects[id];
			
			if (obj == null)
			{
				obj = this.lookup(id);
				
				if (obj == null)
				{
					var node = this.getElementById(id);
					
					if (node != null)
					{
						obj = this.decode(node);
					}
				}
			}
		}
		
		return obj;
	};

	/**
	 * Function: lookup
	 *
	 * Hook for subclassers to implement a custom lookup
	 * mechanism for cell IDs. This implementation always
	 * returns null.
	 *
	 * Example:
	 *
	 * (code)
	 * var codec = new mxCodec();
	 * codec.lookup = function(id)
	 * {
	 *   return model.getCell(id);
	 * };
	 * (end)
	 *
	 * Parameters:
	 *
	 * id - ID of the object to be returned.
	 */
	mxCodec.prototype.lookup = function(id)
	{
		return null;
	}
	
	/**
	 * Function: getElementById
	 *
	 * Returns the element with the given ID from
	 * <document>. The optional attr argument specifies
	 * the name of the ID attribute. Default is "id".
	 * The XPath expression used to find the element is
	 * //*[@attr='arg'] where attr is the name of the
	 * ID attribute and arg is the given id.
	 *
	 * Parameters:
	 *
	 * id - String that contains the ID.
	 * attr - Optional string for the attributename.
	 * Default is "id".
	 */
	mxCodec.prototype.getElementById = function(id, attr)
	{
		attr = attr || 'id';
		var expr = '//*[@' + attr + '=\'' + id + '\']';
		
		return mxUtils.selectSingleNode(this.document, expr);
	};

	/**
	 * Function: getId
	 *
	 * Returns the ID of the specified object. This implementation
	 * calls <reference> first and if that returns null handles
	 * the object as an <mxCell> by returning their IDs using
	 * <mxCell.getId>. If no ID exists for the given cell, then
	 * an on-the-fly ID is generated using <mxCellPath.create>.
	 *
	 * Parameters:
	 *
	 * obj - Object to return the ID for.
	 */
	mxCodec.prototype.getId = function(obj)
	{
		var id = null;
		
		if (obj != null)
		{
			id = this.reference(obj);
			
			if (id == null && obj.constructor == mxCell)
			{
				id = obj.getId();
				
				if (id == null)
				{
					// Uses an on-the-fly Id
					id = mxCellPath.create(obj);
					
					if (id.length == 0)
					{
						id = 'root';
					}
				}
			}
		}
		
		return id;
	};

	/**
	 * Function: reference
	 *
	 * Hook for subclassers to implement a custom method
	 * for retrieving IDs from objects. This implementation
	 * always returns null.
	 *
	 * Example:
	 *
	 * (code)
	 * var codec = new mxCodec();
	 * codec.reference = function(obj)
	 * {
	 *   return obj.getCustomId();
	 * };
	 * (end)
	 *
	 * Parameters:
	 *
	 * obj - Object whose ID should be returned.
	 */
	mxCodec.prototype.reference = function(obj)
	{
		return null;
	};
	
	/**
	 * Function: encode
	 *
	 * Encodes the specified object and returns the resulting
	 * XML node.
	 *
	 * Parameters:
	 *
	 * obj - Object to be encoded. 
	 */
	mxCodec.prototype.encode = function(obj)
	{
		var node = null;
		
		if (obj != null && obj.constructor != null)
		{
			var enc = mxCodecRegistry.getCodec(obj.constructor);
			
			if (enc != null)
			{
				node = enc.encode(this, obj);
			}
			else
			{
				if (isNode(obj))
				{
					node = (mxClient.IS_IE) ?
						obj.value.cloneNode(true) :
						this.document.importNode(obj.value, true);
				}
				else
				{
		    		mxLog.warn('mxCodec.encode: No codec for '+
		    			mxUtils.getFunctionName(obj.constructor));
				}
			}
		}
		
		return node;
	};

	/**
	 * Function: decode
	 *
	 * Decodes the given XML node. The optional "into"
	 * argument specifies an existing object to be
	 * used. If no object is given, then a new instance
	 * is created using the constructor from the codec.
	 *
	 * The function returns the passed in object or
	 * the new instance if no object was given.
	 *
	 * Parameters:
	 *
	 * node - XML node to be decoded.
	 * into - Optional object to be decodec into.
	 */
	mxCodec.prototype.decode = function(node, into)
	{
		var obj = null;
		
		if (node != null &&
			node.nodeType == mxConstants.NODETYPE_ELEMENT)
		{
			var ctor = null;
			
			try
			{
				var ctor = eval(node.nodeName);
			}
			catch (err)
			{
				// ignore
			}
			
			try
			{
				var dec = mxCodecRegistry.getCodec(ctor);
				
				if (dec != null)
				{
					obj = dec.decode(this, node, into);
				}
				else
				{
					obj = node.cloneNode(true);
					obj.removeAttribute('as');
				}
			}
			catch (err)
			{
				mxLog.debug('Cannot decode '+node.nodeName+': '+err.message);
				throw err;
			}
		}
		
		return obj;
	};

	/**
	 * Function: encodeCell
	 *
	 * Encoding of cell hierarchies is built-into the core, but
	 * is a higher-level function that needs to be explicitely
	 * used by the respective object encoders (eg. <mxModelCodec>,
	 * <mxChildChangeCodec> and <mxRootChangeCodec>). This
	 * implementation writes the given cell and its children as a
	 * (flat) sequence into the given node. The children are not
	 * encoded if the optional isIncludeChildren is false. The
	 * function is in charge of adding the result into the
	 * given node and has no return value.
	 *
	 * Parameters:
	 *
	 * cell - <mxCell> to be encoded.
	 * node - Parent XML node to add the encoded cell into.
	 * isIncludeChildren - Optional boolean indicating if the
	 * function should include all descendents. Default is true. 
	 */
	mxCodec.prototype.encodeCell = function(cell, node, isIncludeChildren)
	{
		node.appendChild(this.encode(cell));
		
		if (isIncludeChildren == null || isIncludeChildren)
		{
			var childCount = cell.getChildCount();
			
			for (var i=0; i<childCount; i++)
			{
				this.encodeCell(cell.getChildAt(i), node);
			}
		}
	};

	/**
	 * Function: decodeCell
	 *
	 * Decodes cells that have been encoded using inversion, ie.
	 * where the user object is the enclosing node in the XML,
	 * and restores the group and graph structure in the cells.
	 * Returns a new <mxCell> instance that represents the
	 * given node.
	 *
	 * Parameters:
	 *
	 * node - XML node that contains the cell data.
	 * isRestoreStructures - Optional boolean indicating whether
	 * the graph structure should be restored by calling insert
	 * and insertEdge on the parent and terminals, respectively.
	 * Default is true.
	 */
	mxCodec.prototype.decodeCell = function(node, isRestoreStructures)
	{
		var cell = null;
		
		if (node != null &&
			node.nodeType == mxConstants.NODETYPE_ELEMENT)
		{
			// Hardcodes the decoder because the name of the
			// node is not mxCell, but the name of the user
			// object inside the cell (inversion).
			var decoder = mxCodecRegistry.getCodec(mxCell);
			cell = decoder.decode(this, node);
			
			if (isRestoreStructures == null ||
				isRestoreStructures)
			{
				var parent = cell.getParent();
				
				if (parent != null)
				{
					parent.insert(cell);
				}
				
				var source = cell.getTerminal(true);
	
				if (source != null)
				{
					source.insertEdge(cell, true);
				}
				
				var target = cell.getTerminal(false);
	
				if (target != null)
				{
					target.insertEdge(cell, false);
				}
			}
		}
		
		return cell;
	};

	/**
	 * Function: setAttribute
	 *
	 * Sets the attribute on the specified node to value. This is a
	 * helper method that makes sure the attribute and value arguments
	 * are not null.
	 *
	 * Parameters:
	 *
	 * node - XML node to set the attribute for.
	 * attributes - Attributename to be set.
	 * value - New value of the attribute.
	 */
	mxCodec.prototype.setAttribute = function(node, attribute, value)
	{
		if (attribute != null && value != null)
		{
			node.setAttribute(attribute, value);
		}
	};

}
