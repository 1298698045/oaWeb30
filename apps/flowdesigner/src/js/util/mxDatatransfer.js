/**
 * $Id: mxDatatransfer.js,v 1.5 2007/10/30 13:57:19 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxDatatransfer
 * 
 * Singleton that implements drag and drop between graphs. This class
 * provides a global function that is consumed in the graph event loop.
 */
var mxDatatransfer =
{
	/**
	 * Variable: sourceFunction
	 * 
	 * Holds the function to be executed in the graph event loop. The function
	 * signature is as follows:
	 * (code)
	 * function(mxGraph, MouseEvent, mxCell)
	 * (end)
	 */
	sourceFunction: null,

	/**
	 * Function: setSourceFunction
	 * 
	 * Sets the <sourceFunction> to the given function.
	 */
	setSourceFunction: function(funct)
	{
		mxDatatransfer.sourceFunction = funct;
	},
			
	/**
	 * Function: consumeSourceFunction
	 * 
	 * Executes <sourceFunction> using the given graph, event and cell as
	 * arguments.
	 * 
	 * Parameters:
	 * 
	 * graph - Target <mxGraph> for the function to work upon.
	 * evt - MouseEvent that triggered the invocation.
	 * cell - Optional <mxCell> under the mousepointer.
	 */
	consumeSourceFunction: function(graph, evt, cell)
	{
		if (mxDatatransfer.sourceFunction != null &&
			graph.isEnabled())
		{
			var funct = mxDatatransfer.sourceFunction;
			mxDatatransfer.sourceFunction = null;
			funct(graph, evt, cell);
		}
	}

};
