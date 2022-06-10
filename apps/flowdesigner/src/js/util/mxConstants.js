/**
 * $Id: mxConstants.js,v 1.61 2009/01/21 16:37:21 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxConstants
 * 
 * Defines various global constants.
 */
 var mxConstants =
 {
	/**
	 * Variable: DEFAULT_HOTSPOT
	 * 
	 * Defines the portion of the cell which is to be used as a connectable
	 * region. Default is 0.5.
	 */
	DEFAULT_HOTSPOT: 0.5,

	/**
	 * Variable: MIN_HOTSPOT_SIZE
	 * 
	 * Defines the minimum size in pixels of the portion of the cell which is
	 * to be used as a connectable region. Default is 8.
	 */
	MIN_HOTSPOT_SIZE: 8,

	/**
	 * Variable: MAX_HOTSPOT_SIZE
	 * 
	 * Defines the maximum size in pixels of the portion of the cell which is
	 * to be used as a connectable region. Use 0 for no maximum. Default is 0.
	 */
	MAX_HOTSPOT_SIZE: 0,

	/**
	 * Variable: DIALECT_SVG
	 * 
	 * Defines the SVG display dialect name.
	 */
	DIALECT_SVG: 'svg',

	/**
	 * Variable: DIALECT_VML
	 * 
	 * Defines the VML display dialect name.
	 */
	DIALECT_VML: 'vml',

	/**
	 * Variable: DIALECT_MIXEDHTML
	 * 
	 * Defines the mixed HTML display dialect name.
	 */
	DIALECT_MIXEDHTML: 'mixedHtml',

	/**
	 * Variable: DIALECT_PREFERHTML
	 * 
	 * Defines the preferred HTML display dialect name.
	 */
	DIALECT_PREFERHTML: 'preferHtml',

	/**
	 * Variable: DIALECT_STRICTHTML
	 * 
	 * Defines the strict HTML display dialect.
	 */
	DIALECT_STRICTHTML: 'strictHtml',

	/**
	 * Variable: NS_SVG
	 * 
	 * Defines the SVG namespace.
	 */
	NS_SVG: 'http://www.w3.org/2000/svg',

	/**
	 * Variable: NS_XHTML
	 * 
	 * Defines the XHTML namespace.
	 */
	NS_XHTML: 'http://www.w3.org/1999/xhtml',

	/**
	 * Variable: NS_XLINK
	 * 
	 * Defines the XLink namespace.
	 */
	NS_XLINK: 'http://www.w3.org/1999/xlink',

	/**
	 * Variable: SVG_SHADOWCOLOR
	 * 
	 * Defines the color to be used to draw
	 * shadows in SVG.
	 */
	SVG_SHADOWCOLOR: 'gray',

	/**
	 * Variable: SVG_CRISP_EDGES
	 * 
	 * Defines if SVG should draw edges in optimized speed rendering quality.
	 * Default is false.
	 */
	SVG_CRISP_EDGES: false,

	/**
	 * Variable: SVG_TRANSFORM
	 * 
	 * Defines the transformation used to draw
	 * shadows in SVG. Default is translate(2 3)
	 */
	SVG_SHADOWTRANSFORM: 'translate(2 3)',

	/**
	 * Variable: NODETYPE_ELEMENT
	 * 
	 * DOM node of type ELEMENT.
	 */
	NODETYPE_ELEMENT: 1,

	/**
	 * Variable: NODETYPE_ATTRIBUTE
	 * 
	 * DOM node of type ATTRIBUTE.
	 */
	NODETYPE_ATTRIBUTE: 2,

	/**
	 * Variable: NODETYPE_TEXT
	 * 
	 * DOM node of type TEXT.
	 */
	NODETYPE_TEXT: 3,

	/**
	 * Variable: NODETYPE_CDATA
	 * 
	 * DOM node of type CDATA.
	 */
	NODETYPE_CDATA: 4,
	
	/**
	 * Variable: NODETYPE_ENTITY_REFERENCE
	 * 
	 * DOM node of type ENTITY_REFERENCE.
	 */
	NODETYPE_ENTITY_REFERENCE: 5,

	/**
	 * Variable: NODETYPE_ENTITY
	 * 
	 * DOM node of type ENTITY.
	 */
	NODETYPE_ENTITY: 6,

	/**
	 * Variable: NODETYPE_PROCESSING_INSTRUCTION
	 * 
	 * DOM node of type PROCESSING_INSTRUCTION.
	 */
	NODETYPE_PROCESSING_INSTRUCTION: 7,

	/**
	 * Variable: NODETYPE_COMMENT
	 * 
	 * DOM node of type COMMENT.
	 */
	NODETYPE_COMMENT: 8,
		
	/**
	 * Variable: NODETYPE_DOCUMENT
	 * 
	 * DOM node of type DOCUMENT.
	 */
	NODETYPE_DOCUMENT: 9,

	/**
	 * Variable: NODETYPE_DOCUMENTTYPE
	 * 
	 * DOM node of type DOCUMENTTYPE.
	 */
	NODETYPE_DOCUMENTTYPE: 10,

	/**
	 * Variable: NODETYPE_DOCUMENT_FRAGMENT
	 * 
	 * DOM node of type DOCUMENT_FRAGMENT.
	 */
	NODETYPE_DOCUMENT_FRAGMENT: 11,

	/**
	 * Variable: NODETYPE_NOTATION
	 * 
	 * DOM node of type NOTATION.
	 */
	NODETYPE_NOTATION: 12,
	
	/**
	 * Variable: TOOLTIP_VERTICAL_OFFSET
	 * 
	 * Defines the vertical offset for the tooltip.
	 * Default is 16.
	 */
	TOOLTIP_VERTICAL_OFFSET: 16,

	/**
	 * Variable: DEFAULT_VALID_COLOR
	 * 
	 * Specifies the default valid colorr. Default is #0000FF.
	 */
	DEFAULT_VALID_COLOR: '#00FF00',

	/**
	 * Variable: DEFAULT_INVALID_COLOR
	 * 
	 * Specifies the default invalid color. Default is #FF0000.
	 */
	DEFAULT_INVALID_COLOR: '#FF0000',

	/**
	 * Variable: HIGHLIGHT_STROKEWIDTH
	 * 
	 * Defines the strokewidth to be used for the highlights.
	 * Default is 3.
	 */
	HIGHLIGHT_STROKEWIDTH: 3,

	/**
	 * Variable: HIGHLIGHT_COLOR
	 * 
	 * Defines the color to be used for the cell highlighting.
	 * Use 'none' for no color. Default is #00FF00.
	 */
	HIGHLIGHT_COLOR: '#00FF00',

	/**
	 * Variable: TARGET_HIGHLIGHT_COLOR
	 * 
	 * Defines the color to be used for highlighting a target cell for a new
	 * or changed connection. Note that this may be either a source or
	 * target terminal in the graph. Use 'none' for no color.
	 * Default is #0000FF.
	 */
	CONNECT_TARGET_COLOR: '#0000FF',

	/**
	 * Variable: INVALID_CONNECT_TARGET_COLOR
	 * 
	 * Defines the color to be used for highlighting a invalid target cells
	 * for a new or changed connections. Note that this may be either a source
	 * or target terminal in the graph. Use 'none' for no color. Default is
	 * #FF0000.
	 */
	INVALID_CONNECT_TARGET_COLOR: '#FF0000',

	/**
	 * Variable: DROP_TARGET_COLOR
	 * 
	 * Defines the color to be used for the highlighting target parent cells
	 * (for drag and drop). Use 'none' for no color. Default is #0000FF.
	 */
	DROP_TARGET_COLOR: '#0000FF',

	/**
	 * Variable: VALID_COLOR
	 * 
	 * Defines the color to be used for the coloring valid connection
	 * previews. Use 'none' for no color. Default is #FF0000.
	 */
	VALID_COLOR: '#00FF00',

	/**
	 * Variable: INVALID_COLOR
	 * 
	 * Defines the color to be used for the coloring invalid connection
	 * previews. Use 'none' for no color. Default is #FF0000.
	 */
	INVALID_COLOR: '#FF0000',

	/**
	 * Variable: SELECTION_COLOR
	 * 
	 * Defines the color to be used for the selection
	 * border.  Use 'none' for no color. Default is #00FF00.
	 */
	SELECTION_COLOR: '#00FF00',

	/**
	 * Variable: SELECTION_STROKEWIDTH
	 * 
	 * Defines the strokewidth to be used for the selections.
	 * Default is 1.
	 */
	SELECTION_STROKEWIDTH: 1,

	/**
	 * Variable: SELECTION_DASHED
	 * 
	 * Defines the dashed state to be used for the selection
	 * border. Default is true.
	 */
	SELECTION_DASHED: true,

	/**
	 * Variable: OUTLINE_COLOR
	 * 
	 * Defines the color to be used for the outline rectangle
	 * border.  Use 'none' for no color. Default is #0099FF.
	 */
	OUTLINE_COLOR: '#0099FF',

	/**
	 * Variable: OUTLINE_STROKEWIDTH
	 * 
	 * Defines the strokewidth to be used for the outline rectangle
	 * stroke width. Default is 3.
	 */
	OUTLINE_STROKEWIDTH: (mxClient.IS_IE) ? 2 : 3,

	/**
	 * Variable: HANDLE_FILLCOLOR
	 * 
	 * Defines the color to be used for the handle fill color.
	 * Use 'none' for no color. Default is #00FF00 (green).
	 */
	HANDLE_FILLCOLOR: '#00FF00',

	/**
	 * Variable: HANDLE_STROKECOLOR
	 * 
	 * Defines the color to be used for the handle stroke color.
	 * Use 'none' for no color. Default is black.
	 */
	HANDLE_STROKECOLOR: 'black',

	/**
	 * Variable: LABEL_HANDLE_FILLCOLOR
	 * 
	 * Defines the color to be used for the label handle fill color.
	 * Use 'none' for no color. Default is yellow.
	 */
	LABEL_HANDLE_FILLCOLOR: 'yellow',

	/**
	 * Variable: CONNECT_HANDLE_FILLCOLOR
	 * 
	 * Defines the color to be used for the connect handle fill color.
	 * Use 'none' for no color. Default is #0000FF (blue).
	 */
	CONNECT_HANDLE_FILLCOLOR: '#0000FF',

	/**
	 * Variable: LOCKED_HANDLE_FILLCOLOR
	 * 
	 * Defines the color to be used for the locked handle fill color.
	 * Use 'none' for no color. Default is #FF0000 (red).
	 */
	LOCKED_HANDLE_FILLCOLOR: '#0000FF',

	/**
	 * Variable: OUTLINE_HANDLE_FILLCOLOR
	 * 
	 * Defines the color to be used for the outline sizer fill color.
	 * Use 'none' for no color. Default is #00FFFF.
	 */
	OUTLINE_HANDLE_FILLCOLOR: '#00FFFF',

	/**
	 * Variable: OUTLINE_HANDLE_BORDERCOLOR
	 * 
	 * Defines the color to be used for the outline sizer stroke color.
	 * Use 'none' for no color. Default is #0033FF.
	 */
	OUTLINE_HANDLE_STROKECOLOR: '#0033FF',

	/**
	 * Variable: DEFAULT_FONTFAMILY
	 * 
	 * Defines the default family for all fonts in points. Default is
	 * Arial,Helvetica.
	 */
	DEFAULT_FONTFAMILY: 'Arial,Helvetica',

	/**
	 * Variable: DEFAULT_FONTSIZE
	 * 
	 * Defines the default size for all fonts in points. Default is 11.
	 */
	DEFAULT_FONTSIZE: 11,

	/**
	 * Variable: DEFAULT_MARKERSIZE
	 * 
	 * Defines the default size for all markers. Default is 6.
	 */
	DEFAULT_MARKERSIZE: 6,

	/**
	 * Variable: DEFAULT_IMAGESIZE
	 * 
	 * Defines the default width and height for images used in the
	 * label shape. Default is 24.
	 */
	DEFAULT_IMAGESIZE: 24,

	/**
	 * Variable: ENTITY_SEGMENT
	 * 
	 * Defines the length of the horizontal segment of an Entity Relation.
	 * This can be overridden using <mxConstants.STYLE_STARTSIZE> style.
	 * Default is 30.
	 */
	ENTITY_SEGMENT: 30,

	/**
	 * Variable: ARROW_SPACING
	 * 
	 * Defines the spacing between the arrow shape and its terminals. Default
	 * is 10.
	 */
	ARROW_SPACING: 10,

	/**
	 * Variable: ARROW_WIDTH
	 * 
	 * Defines the width of the arrow shape. Default is 30.
	 */
	ARROW_WIDTH: 30,

	/**
	 * Variable: ARROW_SIZE
	 * 
	 * Defines the size of the arrowhead in the arrow shape. Default is 30.
	 */
	ARROW_SIZE: 30,

	/**
	 * Variable: NONE
	 * 
	 * Defines the value for none. Default is "none".
	 */
	NONE: 'none',

	/**
	 * Variable: STYLE_PERIMETER
	 * 
	 * Defines the key for the perimeter.
	 * Possible values are the functions defined
	 * in <mxPerimeter>.
	 */
	STYLE_PERIMETER: 'perimeter',

	/**
	 * Variable: STYLE_OPACITY
	 * 
	 * Defines the key for the opacity.
	 * Possible values range from 0 to 100 (%).
	 */
	STYLE_OPACITY: 'opacity',

	/**
	 * Variable: STYLE_TEXT_OPACITY
	 * 
	 * Defines the key for the text opacity.
	 * Possible values range from 0 to 100 (%).
	 */
	STYLE_TEXT_OPACITY: 'textOpacity',

	/**
	 * Variable: STYLE_ROTATION
	 * 
	 * Defines the key for the rotation.
	 * Possible values range from 0 to 360 (degree).
	 */
	STYLE_ROTATION: 'rotation',

	/**
	 * Variable: STYLE_FILLCOLOR
	 * 
	 * Defines the key for the fill color. Possible values are all color codes
	 * or 'swimlane, 'inherit' or 'indicated' to use the color code of a
	 * related cell or the indicator shape.
	 */
	STYLE_FILLCOLOR: 'fillColor',

	/**
	 * Variable: STYLE_GRADIENTCOLOR
	 * 
	 * Defines the key for the gradient color. Possible values are all color
	 * codes or 'swimlane, 'inherit' or 'indicated' to use the color code of
	 * a related cell or the indicator shape. This is ignored if no
	 * <STYLE_FILLCOLOR> is defined.
	 */
	STYLE_GRADIENTCOLOR: 'gradientColor',

	/**
	 * Variable: STYLE_GRADIENT_DIRECTION
	 * 
	 * Defines the key for the gradient direction. Possible values
	 * Possible values are <DIRECTION_EAST> (default), <DIRECTION_WEST>,
	 * <DIRECTION_NORTH> and <DIRECTION_SOUTH>. Default is <DIRECTION_SOUTH>.
	 */
	STYLE_GRADIENT_DIRECTION: 'gradientDirection',

	/**
	 * Variable: STYLE_STROKECOLOR
	 * 
	 * Defines the key for the stroke color. Possible values are all color
	 * codes or 'swimlane, 'inherit' or 'indicated' to use the color code of
	 * a related cell or the indicator shape. This is ignored if no
	 * <STYLE_FILLCOLOR> is defined.
	 */
	STYLE_STROKECOLOR: 'strokeColor',

	/**
	 * Variable: STYLE_SEPARATORCOLOR
	 * 
	 * Defines the key for the separator color.
	 * Possible values are all color codes. This is
	 * only used in <mxSwimlane>.
	 */
	STYLE_SEPARATORCOLOR: 'separatorColor',

	/**
	 * Variable: STYLE_STROKEWIDTH
	 * 
	 * Defines the key for the stroke width.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_STROKEWIDTH: 'strokeWidth',

	/**
	 * Variable: STYLE_ALIGN
	 * 
	 * Defines the key for the horizontal label alignment.
	 * Possible values are <ALIGN_LEFT>, <ALIGN_CENTER> and <ALIGN_RIGHT>.
	 */
	STYLE_ALIGN: 'align',

	/**
	 * Variable: STYLE_VERTICAL_ALIGN
	 * 
	 * Defines the key for the vertical label alignment.
	 * Possible values are <ALIGN_TOP>, <ALIGN_MIDDLE> and <ALIGN_BOTTOM>.
	 */
	STYLE_VERTICAL_ALIGN: 'verticalAlign',

	/**
	 * Variable: STYLE_LABEL_POSITION
	 * 
	 * Defines the key for the horizontal label position of vertices.
	 * Possible values are <ALIGN_LEFT>, <ALIGN_CENTER> and <ALIGN_RIGHT>.
	 * Default is <ALIGN_CENTER>. If left or right are used, then the
	 * text alignment should be the opposite value of this.
	 */
	STYLE_LABEL_POSITION: 'labelPosition',

	/**
	 * Variable: STYLE_VERTICAL_LABEL_POSITION
	 * 
	 * Defines the key for the vertical label position of vertices.
	 * Possible values are <ALIGN_TOP>, <ALIGN_MIDDLE> and <ALIGN_BOTTOM>.
	 * Default is <ALIGN_MIDDLE>. If top or bottom are used, then the
	 * vertical text alignment should be the opposite value of this.
	 */
	STYLE_VERTICAL_LABEL_POSITION: 'verticalLabelPosition',
	
	/**
	 * Variable: STYLE_IMAGE_ALIGN
	 * 
	 * Defines the key for the horizontal image alignment in <mxLabel>.
	 * Possible values are <ALIGN_LEFT>, <ALIGN_CENTER> and <ALIGN_RIGHT>.
	 */
	STYLE_IMAGE_ALIGN: 'imageAlign',

	/**
	 * Variable: STYLE_IMAGE_VERTICAL_ALIGN
	 * 
	 * Defines the key for the vertical image alignment in <mxLabel>.
	 * Possible values are <ALIGN_TOP>, <ALIGN_MIDDLE> and <ALIGN_BOTTOM>.
	 */
	STYLE_IMAGE_VERTICAL_ALIGN: 'imageVerticalAlign',

	/**
	 * Variable: STYLE_IMAGE
	 * 
	 * Defines the key for the image. Possible values are all image URLs.
	 */
	STYLE_IMAGE: 'image',

	/**
	 * Variable: STYLE_IMAGE_WIDTH
	 * 
	 * Defines the key for the image width. Possible values start at 0 (in
	 * pixels).
	 */
	STYLE_IMAGE_WIDTH: 'imageWidth',

	/**
	 * Variable: STYLE_IMAGE_HEIGHT
	 * 
	 * Defines the key for the image height. Possible values start at 0 (in
	 * pixels).
	 */
	STYLE_IMAGE_HEIGHT: 'imageHeight',

	/**
	 * Variable: STYLE_NOLABEL
	 * 
	 * Defines the key for the noLabel style. If this is
	 * true then no label is visible for a given cell.
	 * Possible values are true or false (1 or 0).
	 * Default is false.
	 */
	STYLE_NOLABEL: 'noLabel',

	/**
	 * Variable: STYLE_NOEDGESTYLE
	 * 
	 * Defines the key for the noEdgeStyle style. If this is
	 * true then no edge style is applied for a given edge.
	 * Possible values are true or false (1 or 0).
	 * Default is false.
	 */
	STYLE_NOEDGESTYLE: 'noEdgeStyle',

	/**
	 * Variable: STYLE_LABEL_BACKGROUNDCOLOR
	 * 
	 * Defines the key for the label background color.
	 * Possible values are all color codes.
	 */
	STYLE_LABEL_BACKGROUNDCOLOR: 'labelBackgroundColor',

	/**
	 * Variable: STYLE_LABEL_BORDERCOLOR
	 * 
	 * Defines the key for the label border color.
	 * Possible values are all color codes.
	 */
	STYLE_LABEL_BORDERCOLOR: 'labelBorderColor',

	/**
	 * Variable: STYLE_INDICATOR_SHAPE
	 * 
	 * Defines the key for the indicator shape used within an <mxLabel>.
	 * Possible values are all SHAPE_* constants or the names of any new
	 * shapes.
	 */
	STYLE_INDICATOR_SHAPE: 'indicatorShape',

	/**
	 * Variable: STYLE_INDICATOR_IMAGE
	 * 
	 * Defines the key for the indicator image used within an <mxLabel>.
	 * Possible values are all image URLs.
	 */
	STYLE_INDICATOR_IMAGE: 'indicatorImage',

	/**
	 * Variable: STYLE_INDICATOR_COLOR
	 * 
	 * Defines the key for the indicator color.
	 * Possible values are all color codes and 'swimlane' to refer to the color
	 * of the parent swimlane if one exists.
	 */
	STYLE_INDICATOR_COLOR: 'indicatorColor',

	/**
	 * Variable: STYLE_INDICATOR_STROKECOLOR
	 * 
	 * Defines the key for the indicator stroke color in <mxLabel>.
	 * Possible values are all color codes.
	 */
	STYLE_INDICATOR_STROKECOLOR: 'indicatorStrokeColor',

	/**
	 * Variable: STYLE_INDICATOR_GRADIENTCOLOR
	 * 
	 * Defines the key for the indicator gradient color in <mxLabel>.
	 * Possible values are all color codes.
	 */
	STYLE_INDICATOR_GRADIENTCOLOR: 'indicatorGradientColor',

	/**
	 * Variable: STYLE_INDICATOR_SPACING
	 * 
	 * The defines the key for the spacing between the label and the
	 * indicator in <mxLabel>. Possible values are in pixels.
	 */
	STYLE_INDICATOR_SPACING: 'indicatorSpacing',

	/**
	 * Variable: STYLE_INDICATOR_WIDTH
	 * 
	 * Defines the key for the indicator width.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_INDICATOR_WIDTH: 'indicatorWidth',

	/**
	 * Variable: STYLE_INDICATOR_HEIGHT
	 * 
	 * Defines the key for the indicator height.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_INDICATOR_HEIGHT: 'indicatorHeight',

	/**
	 * Variable: STYLE_SHADOW
	 * 
	 * Defines the key for the shadow.
	 * Possible values are true and false.
	 */
	STYLE_SHADOW: 'shadow',

	/**
	 * Variable: STYLE_ENDARROW
	 *
	 * Defines the key for the end arrow marker.
	 * Possible values are all constants with an ARROW-prefix.
	 * This is only used in <mxConnector>.
	 *
	 * Example:
	 * (code)
	 * style[mxConstants.STYLE_ENDARROW] = mxConstants.ARROW_CLASSIC;
	 * (end)
	 */
	STYLE_ENDARROW: 'endArrow',

	/**
	 * Variable: STYLE_STARTARROW
	 * 
	 * Defines the key for the start arrow marker.
	 * Possible values are all constants with an ARROW-prefix.
	 * This is only used in <mxConnector>.
	 * See <STYLE_ENDARROW>.
	 */
	STYLE_STARTARROW: 'startArrow',

	/**
	 * Variable: STYLE_ENDSIZE
	 * 
	 * Defines the key for the end arrow size.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_ENDSIZE: 'endSize',

	/**
	 * Variable: STYLE_STARTSIZE
	 * 
	 * Defines the key for the start arrow size.
	 * Possible values start at 0 (in pixels).
	 * Default is <DEFAULT_MARKERSIZE>.
	 */
	STYLE_STARTSIZE: 'startSize',

	/**
	 * Variable: STYLE_DASHED
	 * 
	 * Defines the key for dashes strokes.
	 * Possible values are true and false.
	 */
	STYLE_DASHED: 'dashed',

	/**
	 * Variable: STYLE_ROUNDED
	 * 
	 * Defines the key for the rounded corners on edges and vertices.
	 * Possible values are true and false.
	 */
	STYLE_ROUNDED: 'rounded',

	/**
	 * Variable: STYLE_SOURCE_PERIMETER_SPACING
	 * 
	 * Defines the key for the source perimeter spacing (in px).
	 * This is the distance between the source connection point of an edge and
	 * the the perimeter of the source vertex.
	 */
	STYLE_SOURCE_PERIMETER_SPACING: 'sourcePerimeterSpacing',

	/**
	 * Variable: STYLE_TARGET_PERIMETER_SPACING
	 * 
	 * Defines the key for the source perimeter spacing (in px).
	 * This is the distance between the target connection point of an edge and
	 * the the perimeter of the target vertex.
	 */
	STYLE_TARGET_PERIMETER_SPACING: 'targetPerimeterSpacing',

	/**
	 * Variable: STYLE_PERIMETER_SPACING
	 * 
	 * Defines the key for the spacing of the perimeter, that is, the distance
	 * between the connection point and the perimeter.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_PERIMETER_SPACING: 'perimeterSpacing',

	/**
	 * Variable: STYLE_SPACING
	 * 
	 * Defines the key for the spacing, that is, the distance between the cell's
	 * border and the contents (label and image) on all sides.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_SPACING: 'spacing',

	/**
	 * Variable: STYLE_SPACING_TOP
	 * 
	 * Defines the key for the top spacing of the label.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_SPACING_TOP: 'spacingTop',

	/**
	 * Variable: STYLE_SPACING_LEFT
	 * 
	 * Defines the key for the left spacing of the label.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_SPACING_LEFT: 'spacingLeft',

	/**
	 * Variable: STYLE_SPACING_BOTTOM
	 * 
	 * Defines the key for the bottom spacing of the label.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_SPACING_BOTTOM: 'spacingBottom',

	/**
	 * Variable: STYLE_SPACING_RIGHT
	 * 
	 * Defines the key for the right spacing of the label.
	 * Possible values start at 0 (in pixels).
	 */
	STYLE_SPACING_RIGHT: 'spacingRight',

	/**
	 * Variable: STYLE_HORIZONTAL
	 * 
	 * Defines the key for the horizontal style. The horizontal style is used
	 * to specify the orientation of the cell label.
	 * Possible values are true and false. Default is true.
	 */
	STYLE_HORIZONTAL: 'horizontal',

	/**
	 * Variable: STYLE_DIRECTION
	 * 
	 * Defines the key for the direction style. The direction style is used
	 * to specify the direction of certain shapes (eg. <mxTriangle>).
	 * Possible values are <DIRECTION_EAST> (default), <DIRECTION_WEST>,
	 * <DIRECTION_NORTH> and <DIRECTION_SOUTH>.
	 */
	STYLE_DIRECTION: 'direction',

	/**
	 * Variable: STYLE_ELBOW
	 * 
	 * Defines the key for the elbow style.
	 * Possible values are 'horizontal' and 'vertical'.
	 * Default is 'horizontal'.
	 */
	STYLE_ELBOW: 'elbow',

	/**
	 * Variable: STYLE_FONTCOLOR
	 * 
	 * Defines the key for the font color.
	 * Possible values are all color codes.
	 */
	STYLE_FONTCOLOR: 'fontColor',

	/**
	 * Variable: STYLE_FONTFAMILY
	 * 
	 * Defines the key for the font family.
	 * Possible values are font families, eg. Arial,
	 * Dialog, Verdana, Times New Roman.
	 */
	STYLE_FONTFAMILY: 'fontFamily',

	/**
	 * Variable: STYLE_FONTSIZE
	 * 
	 * Defines the key for the font size. Possible values start at 0 (in
	 * points). A value of <= 0 will make the label invisible.
	 */
	STYLE_FONTSIZE: 'fontSize',

	/**
	 * Variable: STYLE_FONTSTYLE
	 * 
	 * Defines the key for the font style. Possible values are logical AND
	 * (sum) of <FONT_BOLD>, <FONT_ITALIC>, <FONT_UNDERLINE> and <FONT_SHADOW>.
	 */
	STYLE_FONTSTYLE: 'fontStyle',

	/**
	 * Variable: STYLE_SHAPE
	 * 
	 * Defines the key for the shape. Possible values are all constants
	 * with a SHAPE-prefix or any newly defined shape names.
	 */
	STYLE_SHAPE: 'shape',

	/**
	 * Variable: STYLE_EDGE
	 * 
	 * Defines the key for the edge style. Possible values are the functions
	 * defined in <mxEdgeStyle>.
	 */
	STYLE_EDGE: 'edgeStyle',

	/**
	 * Variable: STYLE_LOOP
	 * 
	 * Defines the key for the loop style. Possible values are the functions
	 * defined in <mxEdgeStyle>.
	 */
	STYLE_LOOP: 'loopStyle',

	/**
	 * Variable: STYLE_ROUTING_CENTER_X
	 * 
	 * Defines the key for the horizontal routing center. Possible values are
	 * between -0.5 and 0.5. This is the relative offset from the center used
	 * for connecting edges.
	 */
	STYLE_ROUTING_CENTER_X: 'routingCenterX',

	/**
	 * Variable: STYLE_ROUTING_CENTER_Y
	 * 
	 * Defines the key for the vertical routing center. Possible values are
	 * between -0.5 and 0.5. This is the relative offset from the center used
	 * for connecting edges.
	 */
	STYLE_ROUTING_CENTER_Y: 'routingCenterY',

	/**
	 * Variable: FONT_BOLD
	 * 
	 * Constant for bold fonts. Default is 1.
	 */
	FONT_BOLD: 1,

	/**
	 * Variable: FONT_ITALIC
	 * 
	 * Constant for italic fonts. Default is 2.
	 */
	FONT_ITALIC: 2,

	/**
	 * Variable: FONT_UNDERLINE
	 * 
	 * Constant for underlined fonts. Default is 4.
	 */
	FONT_UNDERLINE: 4,

	/**
	 * Variable: FONT_SHADOW
	 * 
	 * Constant for fonts with a shadow. Default is 8.
	 */
	FONT_SHADOW: 8,

	/**
	 * Variable: SHAPE_RECTANGLE
	 * 
	 * Name under which <mxRectangleShape> is registered
	 * in <mxCellRenderer>. Default is rectangle.
	 */
	SHAPE_RECTANGLE: 'rectangle',

	/**
	 * Variable: SHAPE_ELLIPSE
	 * 
	 * Name under which <mxEllipse> is registered
	 * in <mxCellRenderer>. Default is ellipse.
	 */
	SHAPE_ELLIPSE: 'ellipse',

	/**
	 * Variable: SHAPE_DOUBLE_ELLIPSE
	 * 
	 * Name under which <mxDoubleEllipse> is registered
	 * in <mxCellRenderer>. Default is doubleEllipse.
	 */
	SHAPE_DOUBLE_ELLIPSE: 'doubleEllipse',

	/**
	 * Variable: SHAPE_RHOMBUS
	 * 
	 * Name under which <mxRhombus> is registered
	 * in <mxCellRenderer>. Default is rhombus.
	 */
	SHAPE_RHOMBUS: 'rhombus',

	/**
	 * Variable: SHAPE_LINE
	 * 
	 * Name under which <mxLine> is registered
	 * in <mxCellRenderer>. Default is line.
	 */
	SHAPE_LINE: 'line',

	/**
	 * Variable: SHAPE_IMAGE
	 * 
	 * Name under which <mxImageShape> is registered
	 * in <mxCellRenderer>. Default is image.
	 */
	SHAPE_IMAGE: 'image',
	
	/**
	 * Variable: SHAPE_ARROW
	 * 
	 * Name under which <mxArrow> is registered
	 * in <mxCellRenderer>. Default is arrow.
	 */
	SHAPE_ARROW: 'arrow',
	
	/**
	 * Variable: SHAPE_LABEL
	 * 
	 * Name under which <mxLabel> is registered
	 * in <mxCellRenderer>. Default is label.
	 */
	SHAPE_LABEL: 'label',
	
	/**
	 * Variable: SHAPE_CYLINDER
	 * 
	 * Name under which <mxCylinder> is registered
	 * in <mxCellRenderer>. Default is cylinder.
	 */
	SHAPE_CYLINDER: 'cylinder',
	
	/**
	 * Variable: SHAPE_SWIMLANE
	 * 
	 * Name under which <mxSwimlane> is registered
	 * in <mxCellRenderer>. Default is swimlane.
	 */
	SHAPE_SWIMLANE: 'swimlane',
		
	/**
	 * Variable: SHAPE_CONNECTOR
	 * 
	 * Name under which <mxConnector> is registered
	 * in <mxCellRenderer>. Default is connector.
	 */
	SHAPE_CONNECTOR: 'connector',
		
	/**
	 * Variable: SHAPE_ACTOR
	 * 
	 * Name under which <mxActor> is registered
	 * in <mxCellRenderer>. Default is actor.
	 */
	SHAPE_ACTOR: 'actor',
		
	/**
	 * Variable: SHAPE_CLOUD
	 * 
	 * Name under which <mxCloud> is registered
	 * in <mxCellRenderer>. Default is cloud.
	 */
	SHAPE_CLOUD: 'cloud',
		
	/**
	 * Variable: SHAPE_TRIANGLE
	 * 
	 * Name under which <mxTriangle> is registered
	 * in <mxCellRenderer>. Default is triangle.
	 */
	SHAPE_TRIANGLE: 'triangle',
		
	/**
	 * Variable: SHAPE_HEXAGON
	 * 
	 * Name under which <mxHexagon> is registered
	 * in <mxCellRenderer>. Default is hexagon.
	 */
	SHAPE_HEXAGON: 'hexagon',

	/**
	 * Variable: ARROW_CLASSIC
	 * 
	 * Constant for classic arrow markers.
	 */
	ARROW_CLASSIC: 'classic',

	/**
	 * Variable: ARROW_BLOCK
	 * 
	 * Constant for block arrow markers.
	 */
	ARROW_BLOCK: 'block',

	/**
	 * Variable: ARROW_OPEN
	 * 
	 * Constant for open arrow markers.
	 */
	ARROW_OPEN: 'open',

	/**
	 * Variable: ARROW_OVAL
	 * 
	 * Constant for oval arrow markers.
	 */
	ARROW_OVAL: 'oval',

	/**
	 * Variable: ARROW_DIAMOND
	 * 
	 * Constant for diamond arrow markers.
	 */
	ARROW_DIAMOND: 'diamond',

	/**
	 * Variable: ALIGN_LEFT
	 * 
	 * Constant for left horizontal alignment. Default is left.
	 */
	ALIGN_LEFT: 'left',

	/**
	 * Variable: ALIGN_CENTER
	 * 
	 * Constant for center horizontal alignment. Default is center.
	 */
	ALIGN_CENTER: 'center',

	/**
	 * Variable: ALIGN_RIGHT
	 * 
	 * Constant for right horizontal alignment. Default is right.
	 */
	ALIGN_RIGHT: 'right',

	/**
	 * Variable: ALIGN_TOP
	 * 
	 * Constant for top vertical alignment. Default is top.
	 */
	ALIGN_TOP: 'top',

	/**
	 * Variable: ALIGN_MIDDLE
	 * 
	 * Constant for middle vertical alignment. Default is middle.
	 */
	ALIGN_MIDDLE: 'middle',

	/**
	 * Variable: ALIGN_BOTTOM
	 * 
	 * Constant for bottom vertical alignment. Default is bottom.
	 */
	ALIGN_BOTTOM: 'bottom',

	/**
	 * Variable: DIRECTION_NORTH
	 * 
	 * Constant for direction north. Default is north.
	 */
	DIRECTION_NORTH: 'north',

	/**
	 * Variable: DIRECTION_SOUTH
	 * 
	 * Constant for direction south. Default is south.
	 */
	DIRECTION_SOUTH: 'south',

	/**
	 * Variable: DIRECTION_EAST
	 * 
	 * Constant for direction east. Default is east.
	 */
	DIRECTION_EAST: 'east',

	/**
	 * Variable: DIRECTION_WEST
	 * 
	 * Constant for direction west. Default is west.
	 */
	DIRECTION_WEST: 'west',

	/**
	 * Variable: ELBOW_VERTICAL
	 * 
	 * Constant for elbow vertical. Default is horizontal.
	 */
	ELBOW_VERTICAL: 'vertical',

	/**
	 * Variable: ELBOW_HORIZONTAL
	 * 
	 * Constant for elbow horizontal. Default is horizontal.
	 */
	ELBOW_HORIZONTAL: 'horizontal',

	/**
	 * Variable: EDGESTYLE_ELBOW
	 * 
	 * Name of the elbow edge style. Can be used as a string value
	 * for the STYLE_EDGE style.
	 */
	EDGESTYLE_ELBOW: 'elbowEdgeStyle',

	/**
	 * Variable: EDGESTYLE_ENTITY_RELATION
	 * 
	 * Name of the entity relation edge style. Can be used as a string value
	 * for the STYLE_EDGE style.
	 */
	EDGESTYLE_ENTITY_RELATION: 'entityRelationEdgeStyle',

	/**
	 * Variable: EDGESTYLE_LOOP
	 * 
	 * Name of the loop edge style. Can be used as a string value
	 * for the STYLE_EDGE style.
	 */
	EDGESTYLE_LOOP: 'loopEdgeStyle',

	/**
	 * Variable: EDGESTYLE_SIDETOSIDE
	 * 
	 * Name of the side to side edge style. Can be used as a string value
	 * for the STYLE_EDGE style.
	 */
	EDGESTYLE_SIDETOSIDE: 'sideToSideEdgeStyle',

	/**
	 * Variable: EDGESTYLE_TOPTOBOTTOM
	 * 
	 * Name of the top to bottom edge style. Can be used as a string value
	 * for the STYLE_EDGE style.
	 */
	EDGESTYLE_TOPTOBOTTOM: 'topToBottomEdgeStyle',

	/**
	 * Variable: PERIMETER_ELLIPSE
	 * 
	 * Name of the ellipse perimeter. Can be used as a string value
	 * for the STYLE_PERIMETER style.
	 */
	PERIMETER_ELLIPSE: 'ellipsePerimeter',

	/**
	 * Variable: PERIMETER_RECTANGLE
	 *
	 * Name of the rectangle perimeter. Can be used as a string value
	 * for the STYLE_PERIMETER style.
	 */
	PERIMETER_RECTANGLE: 'rectanglePerimeter',

	/**
	 * Variable: PERIMETER_RHOMBUS
	 * 
	 * Name of the rhombus perimeter. Can be used as a string value
	 * for the STYLE_PERIMETER style.
	 */
	PERIMETER_RHOMBUS: 'rhombusPerimeter',

	/**
	 * Variable: PERIMETER_TRIANGLE
	 * 
	 * Name of the triangle perimeter. Can be used as a string value
	 * for the STYLE_PERIMETER style.
	 */
	PERIMETER_TRIANGLE: 'trianglePerimeter'

};
