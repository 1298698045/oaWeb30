/**
 * $Id: mxTerminalChangeCodec.js,v 1.2 2007/01/16 21:13:04 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxTerminalChangeCodec
 *
 * Codec for <mxTerminalChange>s. This class is created and registered
 * dynamically at load time and used implicitely via <mxCodec> and
 * the <mxCodecRegistry>.
 *
 * Transient Fields:
 *
 * - model
 * - previous
 *
 * Reference Fields:
 *
 * - cell
 * - terminal
 */
mxCodecRegistry.register(function()
{
	// Constructs the codec
	var codec = new mxObjectCodec(new mxTerminalChange(),
		['model', 'previous'],
		['cell', 'terminal']);

	/**
	 * Function: afterDecode
	 *
	 * Restores the state by assigning the previous value.
	 */
	codec.afterDecode = function(dec, node, obj)
	{
		obj.previous = obj.terminal;
		return obj;
	};

	// Returns the codec into the registry
	return codec;

}());
