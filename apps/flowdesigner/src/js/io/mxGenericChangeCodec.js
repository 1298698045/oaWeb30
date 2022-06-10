/**
 * $Id: mxGenericChangeCodec.js,v 1.2 2007/02/19 14:03:44 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGenericChangeCodec
 *
 * Codec for <mxValueChange>s, <mxStyleChange>s, <mxGeometryChange>s,
 * <mxCollapseChange>s and <mxVisibleChange>s. This class is created
 * and registered dynamically at load time and used implicitely
 * via <mxCodec> and the <mxCodecRegistry>.
 *
 * Transient Fields:
 *
 * - model
 * - previous
 *
 * Reference Fields:
 *
 * - cell
 */
{

	/**
	 * Constructor: mxGenericChangeCodec
	 *
	 * Factory function that creates a <mxObjectCodec> for
	 * the specified change and fieldname.
	 *
	 * Parameters:
	 *
	 * obj - An instance of the change object.
	 * variable - The fieldname for the change data.
	 */
	var mxGenericChangeCodec = function(obj, variable)
	{
		var codec = new mxObjectCodec(obj, 
			['model', 'previous'],
			['cell']);

		/**
		 * Function: afterDecode
		 *
		 * Restores the state by assigning the previous value.
		 */
		codec.afterDecode = function(dec, node, obj)
		{
			if (obj.previous == null)
			{
				obj.previous = obj[variable];
			}
			return obj;
		}
		
		return codec;
	};

	// Registers the codecs
	mxCodecRegistry.register(
		mxGenericChangeCodec(new mxValueChange(), 'value'));
	mxCodecRegistry.register(
		mxGenericChangeCodec(new mxStyleChange(), 'style'));
	mxCodecRegistry.register(
		mxGenericChangeCodec(new mxGeometryChange(), 'geometry'));
	mxCodecRegistry.register(
		mxGenericChangeCodec(new mxCollapseChange(), 'collapsed'));
	mxCodecRegistry.register(
		mxGenericChangeCodec(new mxVisibleChange(), 'visible'));
	mxCodecRegistry.register(
		mxGenericChangeCodec(new mxCellAttributeChange(), 'value'));

}
