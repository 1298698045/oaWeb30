/**
 * $Id: mxStyleRegistry.js,v 1.1 2009/01/21 16:37:20 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxStyleRegistry
 *
 * Singleton class that acts as a global converter from string to object values
 * in a style. This is currently only used to perimeters and edge styles.
 */
var mxStyleRegistry =
{

	/**
	 * Variable: values
	 *
	 * Maps from strings to objects.
	 */
	values: new Array(),

	/**
	 * Function: put
	 *
	 * Puts the given object into the registry under the given name.
	 */
	put: function(name, obj)
	{
		mxStyleRegistry.values[name] = obj;
	},

	/**
	 * Function: get
	 *
	 * Returns the value associated with the given name.
	 */
	get: function(name)
	{
		return mxStyleRegistry.values[name];
	},
	
	/**
	 * Function: getName
	 * 
	 * Returns the name for the given value.
	 */
	getName: function(value)
	{
		for (var key in mxStyleRegistry.values)
		{
			if (mxStyleRegistry.values[key] == value)
			{
				return key;
			}
		}
		
		return null;
	}

};

mxStyleRegistry.put(mxConstants.EDGESTYLE_ELBOW, mxEdgeStyle.ElbowConnector);
mxStyleRegistry.put(mxConstants.EDGESTYLE_ENTITY_RELATION, mxEdgeStyle.EntityRelation);
mxStyleRegistry.put(mxConstants.EDGESTYLE_LOOP, mxEdgeStyle.Loop);
mxStyleRegistry.put(mxConstants.EDGESTYLE_SIDETOSIDE, mxEdgeStyle.SideToSide);
mxStyleRegistry.put(mxConstants.EDGESTYLE_TOPTOBOTTOM, mxEdgeStyle.TopToBottom);

mxStyleRegistry.put(mxConstants.PERIMETER_ELLIPSE, mxPerimeter.EllipsePerimeter);
mxStyleRegistry.put(mxConstants.PERIMETER_RECTANGLE, mxPerimeter.RectanglePerimeter);
mxStyleRegistry.put(mxConstants.PERIMETER_RHOMBUS, mxPerimeter.RhombusPerimeter);
mxStyleRegistry.put(mxConstants.PERIMETER_TRIANGLE, mxPerimeter.TrianglePerimeter);
