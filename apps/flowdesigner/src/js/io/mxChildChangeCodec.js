/**
 * $Id: mxChildChangeCodec.js,v 1.3 2008/01/04 12:50:40 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxChildChangeCodec
 *
 * Codec for <mxChildChange>s. This class is created and registered
 * dynamically at load time and used implicitely via <mxCodec> and
 * the <mxCodecRegistry>.
 *
 * Transient Fields:
 *
 * - model
 * - previous
 * - previousIndex
 * - child
 *
 * Reference Fields:
 *
 * - parent
 */
mxCodecRegistry.register(function()
{
	// Constructs the codec
	var codec = new mxObjectCodec(new mxChildChange(),
		['model', 'previous', 'previousIndex', 'child'],
		['parent']);

	/**
	 * Function: isReference
	 *
	 * Returns true for the child attribute if the child
	 * cell had a previous parent or if we're reading the
	 * child as an attribute rather than a child node, in
	 * which case it's always a reference.
	 */
	codec.isReference = function(obj, attr, value, isWrite)
	{
		if (attr == 'child' &&
			(obj.previous != null ||
			!isWrite))
		{
			return true;
		}
		
		return mxUtils.indexOf(this.idrefs, attr) >= 0;
	};

	/**
	 * Function: afterEncode
	 *
	 * Encodes the child recusively and adds the result
	 * to the given node.
	 */
	codec.afterEncode = function(enc, obj, node)
	{
		if (this.isReference(obj, 'child',  obj.child, true))
		{
			// Encodes as reference (id)
			node.setAttribute('child', enc.getId(obj.child));
		}
		else
		{
			// At this point, the encoder is no longer able
			// to know which cells are new, so we have to
			// encode the complete cell hierarchy and ignore
			// the ones that are already there at decoding
			// time. Note: This can only be resolved by
			// moving the notify event into the execute
			// of the edit.
			enc.encodeCell(obj.child, node);
		}
		
		return node;
	};

	/**
	 * Function: beforeDecode
	 *
	 * Decodes the any child nodes as using the respective
	 * codec from the registry.
	 */
	codec.beforeDecode = function(dec, node, obj)
	{
		if (node.firstChild != null &&
			node.firstChild.nodeType == mxConstants.NODETYPE_ELEMENT)
		{
			var tmp = node.firstChild;
			obj.child = dec.decodeCell(tmp, false);
			
			// Makes sure the change will actually change
			// the state of the cell. The cell was
			// encoded after the change was carried out,
			// so this wrongly points to the future parent
			// insteaf of just null.
			obj.child.setParent(null);
			var tmp2 = tmp.nextSibling;
			tmp.parentNode.removeChild(tmp);
			tmp = tmp2;
			
			while (tmp != null)
			{
				var tmp2 = tmp.nextSibling;
				
				if (tmp.nodeType == mxConstants.NODETYPE_ELEMENT)
				{
					
					// Ignores all existing cells because those
					// do not need to be re-inserted into the model.
					// Since the encoded version of these cells
					// contains the new parent, this would leave
					// to an inconsistent state on the model
					// (ie. a parent change without a call to
					// parentForCellChanged).
					var id = tmp.getAttribute('id');
					
					if (dec.lookup(id) == null)
					{
						dec.decodeCell(tmp);
					}
				}
				
				tmp.parentNode.removeChild(tmp);
				tmp = tmp2;
			}
		}
		else
		{
			var childRef = node.getAttribute('child');
			obj.child = dec.getObject(childRef);
		}
		
		return node;
	};
	
	/**
	 * Function: afterDecode
	 *
	 * Restores object state in the child change.
	 */
	codec.afterDecode = function(dec, node, obj)
	{
		obj.previous = obj.parent;
		obj.previousIndex = obj.index;
		
		return obj;
	};

	// Returns the codec into the registry
	return codec;

}());
