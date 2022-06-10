/**
 * $Id: mxCellRenderer.js,v 1.84 2009/01/27 13:24:13 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxCellRenderer
 * 
 * Renders cells into a document object model. The <defaultShapes> is a global
 * map of shapename, constructor pairs that is used in all instances. You can
 * get a list of all available shape names using the following code.
 * 
 * In general the cell renderer is in charge of creating, redrawing and
 * destroying the shape and label associated with a cell state, as well as
 * some other graphical objects, namely controls and overlays. The shape
 * hieararchy in the display (ie. the hierarchy in which the DOM nodes
 * appear in the document) does not reflect the cell hierarchy. The shapes
 * are a (flat) sequence of shapes and labels inside the draw pane of the
 * graph view, with some exceptions, namely the HTML labels being placed
 * directly inside the graph container for certain browsers.
 * 
 * (code)
 * mxLog.show();
 * for (var i in mxCellRenderer.prototype.defaultShapes)
 * {
 *   mxLog.debug(i);
 * }
 * (end)
 */
{

	/**
	 * Constructor: mxCellRenderer
	 * 
	 * Constructs a new cell renderer with the following built-in shapes:
	 * arrow, rectangle, ellipse, rhombus, image, line, label, cylinder,
	 * swimlane, connector, actor and cloud.
	 */
	function mxCellRenderer()
	{
		this.shapes = mxUtils.clone(this.defaultShapes);
	};
	
	/**
	 * Variable: collapseExpandResource
	 * 
	 * Specifies the resource key for the tooltip on the collapse/expand icon.
	 * If the resource for this key does not exist then the value is used as
	 * the tooltip. Default is 'collapse-expand'.
	 */
	mxCellRenderer.prototype.collapseExpandResource = (mxClient.language != 'none') ? 'collapse-expand' : '';

	/**
	 * Variable: shapes
	 * 
	 * Array that maps from shape names to shape constructors. All entries
	 * in <defaultShapes> are added to this array.
	 */
	mxCellRenderer.prototype.shapes = null;

	/**
	 * Variable: checkStyleChanged
	 * 
	 * Specifies if the cell renderer should check if the style has changed
	 * by comparing each key, value pair of the previous and the current style.
	 * Default is true.
	 */
	mxCellRenderer.prototype.checkStyleChanged = true;

	/**
	 * Variable: defaultEdgeShape
	 * 
	 * Defines the default shape for edges.
	 */
	mxCellRenderer.prototype.defaultEdgeShape = mxPolyline;

	/**
	 * Variable: defaultVertexShape
	 * 
	 * Defines the default shape for vertices.
	 */
	mxCellRenderer.prototype.defaultVertexShape = mxRectangleShape;

	/**
	 * Variable: defaultShapes
	 * 
	 * Static array that contains the globally registered shapes which are
	 * known to all instances of this class. For adding instance-specific
	 * shapes you should use <registerShape> on the instance. For adding
	 * a shape to this array you can use the following code:
	 * 
	 * (code)
	 * mxCellRenderer.prototype.defaultShapes['myshape'] = myShape;
	 * (end)
	 * 
	 * Where 'myshape' is the key under which the shape is to be registered
	 * and myShape is the name of the constructor function.
	 */
	mxCellRenderer.prototype.defaultShapes = new Object();
	
	// Adds default shapes into the default shapes array
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_ARROW] = mxArrow;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_RECTANGLE] = mxRectangleShape;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_ELLIPSE] = mxEllipse;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_DOUBLE_ELLIPSE] = mxDoubleEllipse;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_RHOMBUS] = mxRhombus;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_IMAGE] = mxImageShape;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_LINE] = mxLine;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_LABEL] = mxLabel;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_CYLINDER] = mxCylinder;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_SWIMLANE] = mxSwimlane;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_CONNECTOR] = mxConnector;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_ACTOR] = mxActor;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_CLOUD] = mxCloud;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_TRIANGLE] = mxTriangle;
	mxCellRenderer.prototype.defaultShapes[mxConstants.SHAPE_HEXAGON] = mxHexagon;

	/**
	 * Function: registerShape
	 * 
	 * Registers the given constructor under the specified key in this instance
	 * of the renderer.
	 * 
	 * Example:
	 * 
	 * (code)
	 * this.registerShape(mxConstants.SHAPE_RECTANGLE, mxRectangleShape);
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * key - String representing the shape name.
	 * shape - Constructor of the <mxShape> subclass.
	 */
	mxCellRenderer.prototype.registerShape = function(key, shape)
	{
		this.shapes[key] = shape;	
	};

	/**
	 * Function: initialize
	 * 
	 * Initializes the display for the given cell state. This is required once
	 * after the cell state has been created. This is invoked in
	 * mxGraphView.createShape.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the display should be initialized.
	 */
	mxCellRenderer.prototype.initialize = function(state)
	{
		var model = state.view.graph.getModel();
		
		if (state.view.graph.container != null &&
			state.shape == null &&
			state.cell != state.view.currentRoot &&
			(model.isVertex(state.cell) ||
			model.isEdge(state.cell)))
		{
			this.createShape(state);
			
			if (state.shape != null)
			{
				this.initializeShape(state);
				
				// Maintains the model order in the DOM
				if (state.view.graph.ordered)
				{
					this.order(state);
				}
				else if (model.isEdge(state.cell))
				{
					this.orderEdge(state);
				}
				else if (state.view.graph.keepEdgesInForeground
					&& this.firstEdge != null)
				{
					if (this.firstEdge.parentNode ==
						state.shape.node.parentNode)
					{
						state.shape.node.parentNode.insertBefore(
							state.shape.node, this.firstEdge);
					}
					else
					{
						this.firstEdge = null;
					}
				}
				
				state.shape.scale = state.view.scale;
				
				this.createLabel(state);
				this.createOverlay(state);
				this.createControl(state);
				this.installListeners(state);
			}
			
			// Sets a flag to recreate the handler in redraw
			// if the cell is selected at creation time.
			var cells = state.view.graph.getSelectionCells();
			
			if (mxUtils.indexOf(cells, state.cell) >= 0)
			{
				state.doCreateHandler = true;
			}
		}
	};

	/**
	 * Function: initializeShape
	 * 
	 * Initializes the shape in the given state by calling its init method with
	 * the correct container.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the shape should be initialized.
	 */
	mxCellRenderer.prototype.initializeShape = function(state)
	{
		state.shape.init(state.view.getDrawPane());
	}
	
	/**
	 * Function: order
	 * 
	 * Orders the DOM node of the shape for the given state according to the
	 * position of the corresponding cell in the graph model.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose shape's DOM node should be ordered.
	 */
	mxCellRenderer.prototype.order = function(state)
	{
		// TODO: Refactor this function for better readability. Performance could be
		// improved by adding previousState pointers to the cell states.
		var view = state.view;
		var model = view.graph.getModel();
		
		var previous = model.getParent(state.cell);
		var index = previous.getIndex(state.cell);
		
		var previousState = null;
		
		// Finds the previous sibling that is visible
		while (index > 0)
		{
			previous = model.getChildAt(previous, index-1);
			previousState = view.getState(previous);
			
			if (previousState != null)
			{
				break;
			}
			
			index--;
		}
		
		// Finds the last descendant of the previous cell
		if (previousState != null)
		{
			var childCount = model.getChildCount(previous);
			
			while (childCount > 0)
			{
				previousState = null;
				var tmp = model.getChildAt(previous, childCount-1);
				var tmpState = view.getState(tmp);
				
				if (tmpState == null)
				{
					break;
				}
				else
				{
					previousState = tmpState;
				}
				
				previous = tmp;
				childCount = model.getChildCount(previous);
			}
		}
		
		// Uses the parent state if no sibling was found
		if (previousState == null)
		{
			previousState = view.getState(previous);
		}
		
		// Uses the draw pane if no parent or sibling state exists
		var node = null;

		if (previousState != null &&
			previousState.shape != null)
		{
			if (previousState.text != null)
			{
				node = previousState.text.node;
			}
			
			// Uses the shape node if the label is inside the shape, does
			// not exist or is in the graph container (HTML in SVG)
			if (node == null ||
				node.parentNode == previousState.shape.node ||
				node.parentNode != previousState.shape.node.parentNode)
			{
				node = previousState.shape.node;
			}
			
			// Inserts before the next sibling
			if (node != null)
			{
				node = node.nextSibling;
			}
		}
		else
		{
			node = state.shape.node.parentNode.firstChild;
		}

		if (node != null)
		{
			node.parentNode.insertBefore(state.shape.node, node);
		}
	};

	/**
	 * Function: orderEdge
	 * 
	 * Orders the DOM node of the shape for the given edge's state according to
	 * the <mxGraph.keepEdgesInBackground> and <mxGraph.keepEdgesInBackground>
	 * rules. 
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose shape's DOM node should be ordered.
	 */
	mxCellRenderer.prototype.orderEdge = function(state)
	{
		var view = state.view;
		var model = view.graph.getModel();
		
		// Moves edges to the foreground/background
		if (view.graph.keepEdgesInForeground)
		{
			var node = state.shape.node;

			if (this.firstEdge == null ||
				this.firstEdge.parentNode == null ||
			  	this.firstEdge.parentNode != state.shape.node.parentNode)
			{
				this.firstEdge = state.shape.node;
			}
		}
		else if (view.graph.keepEdgesInBackground)
		{
			var node = state.shape.node;
			var parent = node.parentNode;
			
			// Keeps the DOM node in front of its parent
			var pcell = model.getParent(state.cell);
			var pstate = view.getState(pcell);

			if (pstate != null &&
				pstate.shape != null &&
				pstate.shape.node != null)
			{
				var child = pstate.shape.node.nextSibling;
				if (child != null && child != node)
				{
					parent.insertBefore(node, child);
				}
			}
			else
			{
				var child = parent.firstChild;
				
				if (child != null && child != node)
				{
					parent.insertBefore(node, child);
				}
			}
		}
	};
	
	/**
	 * Function: createShape
	 * 
	 * Creates the shape for the given cell state. The shape is configured
	 * using <configureShape>.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the shape should be created.
	 */
	mxCellRenderer.prototype.createShape = function(state)
	{
		if (state.style != null)
		{
			var graph = state.view.graph;
			var isEdge = graph.getModel().isEdge(state.cell);
			
			var key = state.style[mxConstants.STYLE_SHAPE];
			var ctor = (key != null) ? this.shapes[key] : null;
			
			if (ctor == null)
			{
				cor = (isEdge) ? this.defaultEdgeShape : this.defaultVertexShape;
			}
			
			// Invokes the constructor to create a new instance
			state.shape = new ctor();
			
			if (isEdge)
			{
				state.shape.points = state.absolutePoints;
			}
			else
			{
				state.shape.bounds = new mxRectangle(
					state.x, state.y, state.width, state.height);
			}
			
			state.shape.dialect = state.view.graph.dialect;
			this.configureShape(state);
		}
	};
	
	/**
	 * Function: postConfigureShape
	 * 
	 * Replaces any reserved words used for attributes, eg. inherit,
	 * indicated or swimlane for colors in the shape for the given state.
	 * This implementation resolves these keywords on the fill, stroke
	 * and gradient color keys.
	 */
	mxCellRenderer.prototype.postConfigureShape = function(state)
	{
		if (state.shape != null)
		{
			this.resolveColor(state, 'indicatorColor',
				mxConstants.STYLE_FILLCOLOR);
			this.resolveColor(state, 'indicatorGradientColor',
				mxConstants.STYLE_GRADIENTCOLOR);
			this.resolveColor(state, 'fill',
				mxConstants.STYLE_FILLCOLOR);
			this.resolveColor(state, 'stroke',
				mxConstants.STYLE_STROKECOLOR);
			this.resolveColor(state, 'gradient',
				mxConstants.STYLE_GRADIENTCOLOR);
		}
	};
	
	/**
	 * Function: resolveColor
	 * 
	 * Resolves special keywords 'inherit', 'indicated' and 'swimlane' and sets
	 * the respective color on the shape.
	 */
	mxCellRenderer.prototype.resolveColor = function(state, field, key)
	{
		var value = state.shape[field];
		var graph = state.view.graph;
		var referenced = null;
		
		if (value == 'inherit')
		{
			referenced = graph.model.getParent(state.cell);
		}
		else if (value == 'swimlane')
		{
			if (graph.model.getTerminal(state.cell, false) != null)
			{
				referenced = graph.model.getTerminal(state.cell, false);
			}
			else
			{
				referenced = state.cell;
			}
			
			referenced = graph.getSwimlane(referenced);
			key = graph.swimlaneIndicatorColorAttribute;
		}
		else if (value == 'indicated')
		{
			state.shape[field] = state.shape.indicatorColor;
		}
		
		if (referenced != null)
		{
			var rstate = graph.getView().getState(referenced);
			state.shape[field] = null;

			if (rstate != null)
			{
				if (rstate.shape != null &&
					field != 'indicatorColor')
				{
					state.shape[field] = rstate.shape[field];
				}
				else
				{
					state.shape[field] = rstate.style[key];
				}
			}
		}
	};

	/**
	 * Function: configureShape
	 * 
	 * Configures the shape for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the shape should be configured.
	 */
	mxCellRenderer.prototype.configureShape = function(state)
	{
		state.shape.apply(state);
		var image = state.view.graph.getImage(state);
		
		if (image != null)
		{
			state.shape.image = image;
		}
		
		var indicator = state.view.graph.getIndicatorColor(state);
		var key = state.view.graph.getIndicatorShape(state);
		var ctor = (key != null) ? this.shapes[key] : null;
		
		// Configures the indicator shape or image
		if (indicator != null)
		{
			state.shape.indicatorShape = ctor;
			state.shape.indicatorColor = indicator;
			state.shape.indicatorGradientColor =
				state.view.graph.getIndicatorGradientColor(state);
		}
		else
		{
			var indicator = state.view.graph.getIndicatorImage(state);
			
			if (indicator != null)
			{
				state.shape.indicatorImage = indicator;
			}
		}
		
		this.postConfigureShape(state);
	};
	
	/**
	 * Function: getLabelValue
	 * 
	 * Returns the value to be used for the label.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the label should be created.
	 */
	mxCellRenderer.prototype.getLabelValue = function(state)
	{
		var graph = state.view.graph;
		var value = graph.getLabel(state.cell);

		if (!graph.isHtmlLabel(state.cell) &&
			(value != null &&
			!mxUtils.isNode(value)) &&
			mxClient.IS_IE)
		{
			value = mxUtils.htmlEntities(value, false);
		}
		
		return value;
	};
	
	/**
	 * Function: createLabel
	 * 
	 * Creates the label for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the label should be created.
	 */
	mxCellRenderer.prototype.createLabel = function(state)
	{
		var graph = state.view.graph;
		var isEdge = graph.getModel().isEdge(state.cell);
		
		if (state.style[mxConstants.STYLE_FONTSIZE] > 0 ||
			state.style[mxConstants.STYLE_FONTSIZE] == null)
		{
			var value = this.getLabelValue(state);
			
			// Avoids using DOM node for empty edge labels
			if (isEdge &&
				(value == null ||
				value.length == 0))
			{
				return;
			}

			var isForceHtml = (graph.isHtmlLabel(state.cell) ||
				(value != null && mxUtils.isNode(value))) &&
				graph.dialect == mxConstants.DIALECT_SVG;
			var isRotate = state.style[mxConstants.STYLE_HORIZONTAL] == false;

			state.text = new mxText(value, new mxRectangle(),
					state.style[mxConstants.STYLE_ALIGN],
					graph.getVerticalAlign(state),
					state.style[mxConstants.STYLE_FONTCOLOR],
					state.style[mxConstants.STYLE_FONTFAMILY],
					state.style[mxConstants.STYLE_FONTSIZE],
					state.style[mxConstants.STYLE_FONTSTYLE],
					state.style[mxConstants.STYLE_SPACING],
					state.style[mxConstants.STYLE_SPACING_TOP],
					state.style[mxConstants.STYLE_SPACING_RIGHT],
					state.style[mxConstants.STYLE_SPACING_BOTTOM],
					state.style[mxConstants.STYLE_SPACING_LEFT],
					isRotate,
					state.style[mxConstants.STYLE_LABEL_BACKGROUNDCOLOR],
					state.style[mxConstants.STYLE_LABEL_BORDERCOLOR],
					isEdge, isEdge || isForceHtml,
					graph.isWrapping(state.cell),
					graph.isClipping(state.cell));
			state.text.opacity = state.style[mxConstants.STYLE_TEXT_OPACITY];

			state.text.dialect = (isForceHtml) ?
				mxConstants.DIALECT_STRICTHTML :
				state.view.graph.dialect;
			this.initializeLabel(state);
		}
	};
	
	/**
	 * Function: initializeLabel
	 * 
	 * Initiailzes the label with a suitable container.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose label should be initialized.
	 */
	mxCellRenderer.prototype.initializeLabel = function(state)
	{
		var graph = state.view.graph;
		
		if (state.text.dialect != mxConstants.DIALECT_SVG)
		{
			if (graph.dialect == mxConstants.DIALECT_SVG)
			{
				// Note: Adding the text to the container is a hack.
				// In the process of creating the text, the parent's
				// overflow style is set to visible, so this must
				// be restored.
				var node = graph.container;
				var overflow = node.style.overflow;
				state.text.isAbsolute = true;
				state.text.init(node);
				node.style.overflow = overflow;
				
				return;
			}
			else if (mxUtils.isVml(state.view.getDrawPane()))
			{
				if (state.shape.label != null)
				{
					state.text.init(state.shape.label);
				}
				else 
				{
					state.text.init(state.shape.node);
				}
				
				return;
			}
		}

		state.text.init(state.view.getDrawPane());
		state.text.isAbsolute = true;
		
		if (state.shape != null &&
			state.text != null)
		{
			state.shape.node.parentNode.insertBefore(
				state.text.node, state.shape.node.nextSibling);
		}
	};

	/**
	 * Function: createOverlay
	 * 
	 * Creates the overlay for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the overlay should be created.
	 */
	mxCellRenderer.prototype.createOverlay = function(state)
	{
		var graph = state.view.graph;
		var overlays = graph.getOverlays(state.cell);
		
		if (overlays != null)
		{
			state.overlays = new Array();
			
			for (var i=0; i<overlays.length; i++)
			{
				var tmp = new mxImageShape(new mxRectangle(),
					overlays[i].image.src);
				tmp.dialect = state.view.graph.dialect;
				tmp.init(state.view.getOverlayPane());
				tmp.node.style.cursor = 'help';
				this.installOverlayListeners(state, overlays[i], tmp);
				state.overlays.push(tmp);
			}
		}
	};

	/**
	 * Function: installOverlayListeners
	 * 
	 * Installs the listeners for the given <mxCellState>, <mxOverlay> and
	 * <mxShape> that represents the overlay.
	 */
	mxCellRenderer.prototype.installOverlayListeners = function(state, overlay, shape)
	{
		mxEvent.addListener(shape.node, 'click', function (evt)
		{
			overlay.dispatchEvent('click', overlay, evt, state.cell);
		});
		
		mxEvent.addListener(shape.node, 'mousedown', function (evt)
		{
			mxEvent.consume(evt);
		});
		
		mxEvent.addListener(shape.node, 'mousemove', function (evt)
		{
			state.view.graph.dispatchGraphEvent('mousemove', evt, state.cell, overlay);
		});
	};
	
	/**
	 * Function: createControl
	 * 
	 * Creates the control for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the control should be created.
	 */
	mxCellRenderer.prototype.createControl = function(state)
	{
		var graph = state.view.graph;
		var image = graph.getFoldingImage(state);
		
		if (graph.foldingEnabled && image != null)
		{
			var b = new mxRectangle(0, 0, image.width, image.height);
			state.control = new mxImageShape(b, image.src);
			state.control.dialect = state.view.graph.dialect;
			
			// In the special case where the label is in HTML
			// and the display is SVG the image should go into
			// the graph container directly in order to be
			// clickable. Otherwise it is obscured by the
			// HTML label that overlaps the cell.
			var isForceHtml = graph.isHtmlLabel(state.cell) &&
				state.view.graph.dialect == mxConstants.DIALECT_SVG;

			if (isForceHtml)
			{
				state.control.dialect = mxConstants.DIALECT_PREFERHTML;
				state.control.init(graph.container);
				state.control.node.style.zIndex = 1;
			}
			else
			{
				state.control.init(state.view.getOverlayPane());
			}
			
			var node = state.control.innerNode || state.control.node;
			
			if (graph.isEnabled())
			{
				node.style.cursor = 'pointer';
			}
			
			mxEvent.addListener(node, 'click', function (evt)
			{
				if (graph.isEnabled())
				{
					var cells = new Array();
					cells[0] = state.cell;
					
					if (graph.isCellCollapsed(state.cell))
					{
						graph.expand(cells);
					}
					else
					{
						graph.collapse(cells);
					}
					
					mxEvent.consume(evt);
				}
			});
			mxEvent.addListener(node, 'mousedown', function (evt)
			{
				graph.dispatchGraphEvent('mousedown', evt, state.cell);
				mxEvent.consume(evt);
			});
			
			var self = this; // closure
			mxEvent.addListener(node, 'mousemove', function (evt)
			{
				graph.dispatchGraphEvent('mousemove', evt, state.cell,
					mxResources.get(self.collapseExpandResource) ||
					self.collapseExpandResource);
			});
		}
	};

	/**
	 * Function: installListeners
	 * 
	 * Installs the event listeners for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the event listeners should be isntalled.
	 */
	mxCellRenderer.prototype.installListeners = function(state)
	{
		var graph = state.view.graph;
		
		// Receives events from transparent backgrounds
		if (graph.dialect == mxConstants.DIALECT_SVG)
		{
			var events = 'all';

			// Disabled fill-events on non-filled edges
			if (graph.getModel().isEdge(state.cell) &&
				state.shape.stroke != null &&
				state.shape.fill == null)
			{
				events = 'visibleStroke';
			}
			
			// Specifies the event-processing on the shape
			if (state.shape.innerNode != null)
			{
				state.shape.innerNode.setAttribute('pointer-events', events);
			}
			else
			{
				state.shape.node.setAttribute('pointer-events', events);
			}
		}
		
		var cursor = graph.getCursorForCell(state.cell);
		
		if (cursor != null ||
			graph.isEnabled())
		{
			if (cursor == null)
			{
				if (graph.getModel().isEdge(state.cell))
				{
					cursor = 'pointer';
				}
				else if (graph.isMovable(state.cell))
				{
					cursor = 'move';
				} 
			}
			if (state.shape.innerNode != null &&
				!graph.getModel().isEdge(state.cell))
			{
				state.shape.innerNode.style.cursor = cursor;
			}
			else
			{
				state.shape.node.style.cursor = cursor;
			}
		}

		mxEvent.addListener(state.shape.node, 'mousedown', function (evt)
		{
			// Redirects events from the "event-transparent" region of
			// a swimlane to the graph. This is only required in HTML,
			// SVG and VML do not fire mouse events on transparent
			// backgrounds.
			//if (graph.isSwimlane(state.cell))
			if (state.shape != null &&
				mxEvent.getSource(evt) == state.shape.content)
			{
				graph.dispatchGraphEvent('mousedown', evt);				
			}
			else
			{
				graph.dispatchGraphEvent('mousedown', evt, state.cell);
			}
		});
		
		mxEvent.addListener(state.shape.node, 'mousemove', function (evt)
		{
			if (state.shape != null &&
				mxEvent.getSource(evt) == state.shape.content)
			{
				graph.dispatchGraphEvent('mousemove', evt);
			}
			else
			{
				graph.dispatchGraphEvent('mousemove', evt, state.cell);
			}
		});
		
		mxEvent.addListener(state.shape.node, 'mouseup', function (evt)
		{
			if (state.shape != null &&
				mxEvent.getSource(evt) == state.shape.content)
			{
				graph.dispatchGraphEvent('mouseup', evt);
			}
			else
			{
				graph.dispatchGraphEvent('mouseup', evt, state.cell);
			}
		});
		
		mxEvent.addListener(state.shape.node, 'dblclick', function (evt)
		{
			if (state.shape != null &&
				mxEvent.getSource(evt) == state.shape.content)
			{
				graph.dblClick(evt);
			}
			else
			{
				graph.dblClick(evt, state.cell);
			}
			mxEvent.consume(evt);
		});
		
		if (state.text != null)
		{
			var cursor = graph.getCursorForCell(state.cell);
			
			if (cursor != null ||
				(graph.isEnabled() &&
				graph.isMovable(state.cell)))
			{
				state.text.node.style.cursor = cursor || 'move';
			}
			
			mxEvent.addListener(state.text.node, 'mousedown', function (evt)
			{
				// Note: Cannot initiate a drag of the label if the cell
				// is not selected, because the handle does not exist
				if (graph.getModel().isEdge(state.cell) && graph.isCellSelected(state.cell))
				{
					graph.dispatchGraphEvent('mousedown', evt, state.cell,
						mxEdgeHandler.prototype.LABEL_INDEX);
				}
				else
				{
					graph.dispatchGraphEvent('mousedown', evt, state.cell);
				}
			});
			
			mxEvent.addListener(state.text.node, 'mousemove', function (evt)
			{
				graph.dispatchGraphEvent('mousemove', evt, state.cell);
			});
			
			mxEvent.addListener(state.text.node, 'mouseup', function (evt)
			{
				graph.dispatchGraphEvent('mouseup', evt, state.cell);
			});
			
			mxEvent.addListener(state.text.node, 'dblclick', function (evt)
			{
				graph.dblClick(evt, state.cell);
				mxEvent.consume(evt);
			});
		}
	};

	/**
	 * Function: redrawLabel
	 * 
	 * Redraws the label for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose label should be redrawn.
	 */
	mxCellRenderer.prototype.redrawLabel = function(state)
	{
		if (state.text != null)
		{
			var graph = state.view.graph;
			var wrapping = graph.isWrapping(state.cell);
			var clipping = graph.isClipping(state.cell);
			var value = this.getLabelValue(state);
			var bounds = this.getLabelBounds(state);

			if (state.text.value != value ||
				state.text.isWrapping != wrapping ||
				state.text.isClipping != clipping ||
				state.text.scale != state.view.scale ||
				!mxUtils.equals(bounds, state.text.bounds))
			{
				state.text.value = value;
				state.text.bounds = bounds;
				state.text.scale = state.view.scale;
				state.text.isWrapping = wrapping;
				state.text.isClipping = clipping;
				state.text.redraw();
			}
		}
	};

	/**
	 * Function: getLabelBounds
	 * 
	 * Returns the bounds to be used to draw the label of the given state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose label bounds should be returned.
	 */
	mxCellRenderer.prototype.getLabelBounds = function(state)
	{
		var graph = state.view.graph;
		var isEdge = graph.getModel().isEdge(state.cell);
		var bounds = new mxRectangle(
				state.absoluteOffset.x,
				state.absoluteOffset.y);
			
		if (!isEdge)
		{
			bounds.x += state.shape.bounds.x;
			bounds.y += state.shape.bounds.y;
			
			// Minimum of 1 fixes alignment bug in HTML labels
			bounds.width = Math.max(1, state.shape.bounds.width);
			bounds.height = Math.max(1, state.shape.bounds.height);
			var isRotate = state.style[mxConstants.STYLE_HORIZONTAL] == false;
			
			if (graph.isSwimlane(state.cell))
			{
				var scale = graph.view.scale;
				var height = (parseInt(state.style[mxConstants.STYLE_STARTSIZE]) || 0) * scale;
				
				if (isRotate)
				{
					bounds.width = height;
				}
				else
				{
					bounds.height = height;
				}
			}
		}
		
		return bounds;
	};

	/**
	 * Function: redrawOverlays
	 * 
	 * Redraws the overlays for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose overlays should be redrawn.
	 */
	mxCellRenderer.prototype.redrawOverlays = function(state)
	{
		var overlays = state.view.graph.getOverlays(state.cell);
		var oldCount = (state.overlays != null) ? state.overlays.length : 0;
		var newCount = (overlays != null) ? overlays.length : 0;
		
		if (oldCount != newCount)
		{
			if (oldCount > 0)
			{
				for (var i=0; i<state.overlays.length; i++)
				{
					state.overlays[i].destroy();
				}
				
				state.overlays = null;
			}
			
			if (newCount > 0)
			{
				this.createOverlay(state);
			}	
		}
		
		if (state.overlays != null)
		{
			for (var i = 0; i < overlays.length; i++)
			{
				var bounds = overlays[i].getBounds(state);
				
				// TODO: Check if bounds or scale changed
				if (bounds != null)
				{
					state.overlays[i].bounds = bounds;
					state.overlays[i].scale = state.view.scale;
					state.overlays[i].redraw();
				}
			}
		}
	};

	/**
	 * Function: redrawControl
	 * 
	 * Redraws the control for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose control should be redrawn.
	 */
	mxCellRenderer.prototype.redrawControl = function(state)
	{
		if (state.control != null)
		{
			var isEdge = state.view.graph.getModel().isEdge(state.cell);
			var s = state.view.scale;

			var bounds = (isEdge) ? 
				new mxRectangle(
					state.x + state.width / 2 - 4 * s,
					state.y + state.height / 2 - 4 * s,
					9 * s, 9 * s)
				: new mxRectangle(
					state.x + 4 * s,
					state.y + 4 * s,
					9 * s, 9 * s);

			state.control.bounds = bounds;
			state.control.scale = s;
			state.control.redraw();
		}
	};

	/**
	 * Function: redraw
	 * 
	 * Updates the bounds or points and scale of the shapes for the given cell
	 * state. This is called in mxGraphView.validatePoints as the last step of
	 * updating all cells.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the shapes should be updated.
	 */
	mxCellRenderer.prototype.redraw = function(state)
	{
		var isEdge = state.view.graph.getModel().isEdge(state.cell);
		
		if (state.shape != null)
		{
			// Checks if the style has changed
			if (this.checkStyleChanged)
			{
				var style = state.view.graph.getCellStyle(state.cell);
				var styleChanged = false;
				
				if (style.length == state.style.length)
				{
					for (var key in style)
					{
						if (style[key] != state.style[key])
						{
							styleChanged = true;
							break;
						}
					}
				}
				else
				{
					styleChanged = true;
				}
				
				// Reconfigures the shape in-place if the style has changed
				if (styleChanged)
				{
					state.style = style;
					state.shape.apply(state);
					state.shape.reconfigure();
				}
			}
			
			var s = state.view.scale;
			
			// LATER: Check if points have actually changed for edges
			if (!mxUtils.equals(state, state.shape.bounds) ||
				state.shape.scale != s ||
				isEdge)
			{
				// FIXME: Move indicator color update into shape.redraw
//				var indicator = state.view.graph.getIndicatorColor(state);
//				if (indicator != null)
//				{
//					state.shape.indicatorColor = indicator;
//				}

				if (isEdge)
				{
					state.shape.points = state.absolutePoints;	
					state.shape.bounds = new mxRectangle(
						state.x, state.y, state.width, state.height);
				}
				else
				{
					state.shape.bounds = new mxRectangle(
						state.x, state.y, state.width, state.height);
				}
								
				state.shape.scale = s;
				state.shape.redraw();
			}
			
			// Updates the text label, overlays and control
			this.redrawLabel(state);
			this.redrawOverlays(state);
			this.redrawControl(state);
		}

		if (state.doCreateHandler)
		{
			delete state.doCreateHandler;
			state.view.graph.createHandler(state);
		}
		
		if (state.view.graph.hasHandler(state))
		{
			state.view.graph.redrawHandler(state);
		}
	};
	
	/**
	 * Function: destroy
	 * 
	 * Destroys the shapes associated with the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the shapes should be destroyed.
	 */
	mxCellRenderer.prototype.destroy = function(state)
	{
		if (state.shape != null)
		{
			if (state.text != null)
			{		
				state.text.destroy();
				state.text = null;
			}
			
			if (state.overlays != null)
			{
				for (var i=0; i<state.overlays.length; i++)
				{
					state.overlays[i].destroy();
				}
				
				state.overlays = null;
			}
			
			if (state.control != null)
			{
				state.control.destroy();
				state.control = null;
			}
			
			state.shape.destroy();
			state.shape = null;
		}
	};

}
