/**
 * $Id: mxGraphCodec.js,v 1.2 2007/10/09 15:35:13 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGraphCodec
 *
 * Codec for <mxGraph>s. This class is created and registered
 * dynamically at load time and used implicitely via <mxCodec>
 * and the <mxCodecRegistry>.
 *
 * Transient Fields:
 *
 * - graphListeners
 * - eventListeners
 * - view
 * - container
 * - cellRenderer
 * - editor
 * - selection
 * - gestureHandler
 * - selection
 */
mxCodecRegistry.register(function()
{
	// Constructs and returns the codec
	return new mxObjectCodec(new mxGraph(),
		['graphListeners', 'eventListeners', 'view', 'container',
		'cellRenderer', 'editor', 'selection', 'gestureHandler',
		'selection', 'activeElement', 'focusHandler', 'blurHandler']);

}());
