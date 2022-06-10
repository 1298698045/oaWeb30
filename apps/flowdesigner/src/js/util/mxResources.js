/**
 * $Id: mxResources.js,v 1.13 2008/06/27 11:52:55 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxResources
 * 
 * Implements internationalization. You can provide any number of 
 * resource files on the server using the following format for the 
 * filename: name[-en].properties. The en stands for any lowercase 
 * 2-character language shortcut (eg. de for german, fr for french).
 *
 * If the optional language extension is omitted, then the file is used as a 
 * default resource which is loaded in all cases. If a properties file for a 
 * specific language exists, then it is used to override the settings in the 
 * default resource. All entries in the file are of the form key=value. The
 * values may then be accessed in code via <get>. Lines without 
 * equal signs in the properties files are ignored.
 *
 * Resource files may either be added programmatically using
 * <add> or via a resource tag in the UI section of the 
 * editor configuration file, eg:
 * 
 * (code)
 * <mxEditor>
 *   <ui>
 *     <resource basename="examples/resources/mxWorkflow"/>
 * (end)
 * 
 * The above element will load examples/resources/mxWorkflow.properties as well
 * as the language specific file for the current language, if it exists.
 * 
 * Values may contain placeholders of the form {1}...{n} where each placeholder
 * is replaced with the value of the corresponding array element in the params
 * argument passed to <mxResources.get>. The placeholder {1} maps to the first
 * element in the array (at index 0).
 * 
 * See <mxClient.language> for more information on specifying the default
 * language or disabling all loading of resources.
 * 
 * Special characters
 * 
 * To use unicode characters use %u as a prefix, eg. %u20AC will display a
 * Euro sign. For normal hex encoded strings, use % as a prefix, eg. %F6 will
 * display a ö (&ouml;). 
 */
var mxResources =
{

	/**
	 * Variable: resources
	 * 
	 * Associative array that maps from keys to values.
	 */
	resources: new Array(),

	/**
	 * Function: add
	 * 
	 * Adds the default and current language properties
	 * file for the specified basename. Existing keys
	 * are overridden as new files are added.
	 *
	 * Example:
	 * 
	 * At application startup, additional resources may be 
	 * added using the following code:
	 * 
	 * (code)
	 * mxResources.add('js/resources/editor');
	 * (end)
	 */
	add: function(basename, lan)
	{
		lan = (lan != null) ? lan : mxClient.language;
		
		if (lan != 'none')
		{
			// Load the common language file (no extension)
			try
			{
		   		var req = mxUtils.load(basename+'.properties');
		   		
		   		if (req.isReady())
		   		{
		 	   		mxResources.parse(req.getText());
		   		}
		  	}
		  	catch (e)
		  	{
		  		// ignore
		  	}
	
			// Overlay the language specific file (_lan-extension)
			try
			{
		   		var req = mxUtils.load(basename+'_'+lan+'.properties');
		   		
		   		if (req.isReady())
		   		{
		 	   		mxResources.parse(req.getText());
		   		}
	   		}
	   		catch (e)
	   		{
	   			// ignore
		   	}
		}
	},

	/**
	 * Function: parse
	 * 
	 * Parses the key, value pairs in the specified
	 * text and stores them as local resources.
	 */
	parse: function(text)
	{
		var lines = text.split('\n');
		
		for (var i=0; i<lines.length; i++)
		{
			var index = lines[i].indexOf('=');
			
			if (index > 0)
			{
				var key = lines[i].substring(0, index);
				var idx = lines[i].length;
				
				if (lines[i].charCodeAt(idx-1) == 13)
				{
					idx--;
				}
				
				var value = lines[i].substring(index+1, idx);
				mxResources.resources[key] = unescape(value);
			}
		}
	},

	/**
	 * Function: get
	 * 
	 * Returns the value for the specified resource key.
	 *
	 * Example:
	 * To read the value for 'welomeMessage', use the following:
	 * (code)
	 * var result = mxResources.get('welcomeMessage') || '';
	 * (end)
	 *
	 * This would require an entry of the following form in
	 * one of the English language resource files:
	 * (code)
	 * welcomeMessage=Welcome to mxGraph!
	 * (end)
	 * 
	 * The part behind the || is the string value to be used if the given
	 * resource is not available.
	 * 
	 * Parameters:
	 * 
	 * key - String that represents the key of the resource to be returned.
	 * params - Array of the values for the placeholders of the form {1}...{n}
	 * to be replaced with in the resulting string.
	 * defaultValue - Optional string that specifies the default return value.
	 */
	get: function(key, params, defaultValue)
	{
		var value = mxResources.resources[key];
		
		// Applies the default value if no resource was found
		if (value == null)
		{
			value = defaultValue;
		}
		
		// Replaces the placeholders with the values in the array
		if (value != null &&
			params != null)
		{
			var result = new Array();
			var index = null;
			
			for (var i = 0; i < value.length; i++)
			{
				var c = value.charAt(i);

				if (c == '{')
				{
					index = '';
				}
				else if (index != null && 	c == '}')
				{
					index = parseInt(index)-1;
					
					if (index >= 0 && index < params.length)
					{
						result.push(params[index]);
					}
					
					index = null;
				}
				else if (index != null)
				{
					index += c;
				}
				else
				{
					result.push(c);
				}
			}
			
			value = result.join('');
		}
		
		return value;
	}

};
