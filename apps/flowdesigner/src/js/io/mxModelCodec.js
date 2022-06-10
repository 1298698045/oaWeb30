/**
 * $Id: mxModelCodec.js,v 1.6 2008/01/24 15:03:10 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxModelCodec
 *
 * Codec for <mxGraphModel>s. This class is created and registered
 * dynamically at load time and used implicitely via <mxCodec>
 * and the <mxCodecRegistry>.
 */
mxCodecRegistry.register(function()
{
	// Constructs the codec
	var codec = new mxObjectCodec(new mxGraphModel());

	/**
	 * Function: encode
	 *
	 * Encode the given <mxGraphModel> by writing a (flat) XML sequence
	 * of cell nodes as produced by the <mxCellCodec>. The sequence is
	 * wrapped-up in a node with the name root.
	 */
	codec.encode = function(enc, obj)
	{
		var name = mxUtils.getFunctionName(obj.constructor);
		var node = enc.document.createElement(name);
		var rootNode = enc.document.createElement('root');
		
		enc.encodeCell(obj.getRoot(), rootNode);
		node.appendChild(rootNode);
		
	    return node;
	};

	/**
	 * Function: decodeChild
	 * 
	 * Overrides decode child to handle special child nodes.
	 */	
	codec.decodeChild = function(dec, child, obj)
	{
		if (child.nodeName == 'root')
		{
			this.decodeRoot(dec, child, obj);
		}
		else
		{
			mxObjectCodec.prototype.decodeChild.apply(this, arguments);
		}
	};

	/**
	 * Function: decodeRoot
	 *
	 * Reads the cells into the graph model. All cells
	 * are children of the root element in the node.
	 */
	codec.decodeRoot = function(dec, root, model)
	{
		var rootCell = null;
		var tmp = root.firstChild;
		
		while (tmp != null)
		{
			var cell = dec.decodeCell(tmp);
			
			if (cell != null && cell.getParent() == null)
			{
				rootCell = cell;
			}
			
			tmp = tmp.nextSibling;
		}

		// Sets the root on the model if one has been decoded
		if (rootCell != null)
		{
			model.setRoot(rootCell);
		}
	};

	// Returns the codec into the registry
	return codec;

}());
