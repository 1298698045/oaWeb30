/**
 * $Id: mxDictionary.js,v 1.2 2007/10/21 13:40:16 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxDictionary
 *
 * A wrapper class for an associative array with object keys. Note: This
 * implementation uses <mxObjectIdentitiy> to turn object keys into strings.
 */
{

	/**
	 * Constructor: mxEventSource
	 *
	 * Constructs a new dictionary which allows object to be used as keys.
	 */
	function mxDictionary()
	{
		this.clear();
	};

	/**
	 * Function: values
	 *
	 * Stores the values in this dictionary.
	 */
	mxDictionary.prototype.values = null;

	/**
	 * Function: clear
	 *
	 * Clears the dictionary.
	 */
	mxDictionary.prototype.clear = function()
	{
		this.values = new Array();
	};
	
	/**
	 * Function: get
	 *
	 * Returns the value for the given key.
	 */
	mxDictionary.prototype.get = function(key)
	{
		var id = mxObjectIdentity.get(key);
		
		return this.values[id];
	};

	/**
	 * Function: put
	 *
	 * Stores the value under the given key and returns the previous
	 * value for that key.
	 */
	mxDictionary.prototype.put = function(key, value)
	{
		var id = mxObjectIdentity.get(key);
		var previous = this.values[id];
		this.values[id] = value;
		
		return previous;
	};

	/**
	 * Function: remove
	 *
	 * Removes the value for the given key and returns the value that
	 * has been removed.
	 */
	mxDictionary.prototype.remove = function(key)
	{
		var id = mxObjectIdentity.get(key);
		var previous = this.values[id];
		delete this.values[id];
		
		return previous;
	};

}
