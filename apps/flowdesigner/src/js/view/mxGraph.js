/**
 * $Id: mxGraph.js,v 1.394 2009/02/04 14:47:05 gaudenz Exp $
 * Copyright (c) 2006, Gaudenz Alder
 *
 * Class: mxGraph
 *
 * Extends <mxEventSource> to implement a graph component for
 * the browser. This is the main class of the package. To activate
 * panning and connections use <setPanning> and <setConnectable>.
 * For rubberband selection you must create a new instance of
 * <mxRubberband>.
 *
 * Background Images:
 * 
 * To display a background image, set the image, image width and
 * image height using <setBackgroundImage>. If one of the
 * above values has changed then the <view>'s <mxGraphView.validate>
 * should be invoked.
 * 
 * Cell Images:
 * 
 * To use images in cells, a shape must be specified in the default
 * vertex style (or any named style). Possible shapes are
 * <mxConstants.SHAPE_IMAGE> and <mxConstants.SHAPE_LABEL>.
 * The code to change the shape used in the default vertex style,
 * the following code is used:
 * 
 * (code)
 * var style = graph.getStylesheet().getDefaultVertexStyle();
 * style[mxConstants.STYLE_SHAPE] = mxConstants.SHAPE_IMAGE;
 * (end)
 * 
 * For the default vertex style, the image to be displayed can be
 * specified in a cell's style using the <mxConstants.STYLE_IMAGE>
 * key and the image URL as a value, for example:
 * 
 * (code)
 * image=http://www.example.com/image.gif
 * (end)
 * 
 * For a named style, the the stylename must be the first element
 * of the cell style:
 * 
 * (code)
 * stylename;image=http://www.example.com/image.gif
 * (end)
 * 
 * A cell style can have any number of key=value pairs added, divided
 * by a semicolon as follows:
 * 
 * (code)
 * [stylename;|key=value;]
 * (end)
 *
 * Labels:
 * 
 * The cell labels are defined by <getLabel> which uses <convertValueToString>
 * if <labelsVisible> is true. If a label must be rendered as HTML markup, then
 * <isHtmlLabel> should return true for the respective cell. If all labels
 * contain HTML markup, <htmlLabels> can be set to true.
 * 
 * If wrapping is needed for a label, then <isHtmlLabel> and <isWrapping> must
 * return true for the cell whose label should be wrapped. See <isWrapping> for
 * an example.
 * 
 * If clipping is needed to keep the rendering of a HTML label inside the
 * bounds of its vertex, then <isClipping> should return true for the
 * respective cell.
 * 
 * By default, edge labels are movable and vertex labels are fixed. This can be
 * changed by setting <edgeLabelsMovable> and <vertexLabelsMovable>, or by
 * overriding <isLabelMovable>.
 *
 * In-place Editing:
 * 
 * In-place editing is started with a doubleclick or by typing F2.
 * Programmatically, <edit> is used to check if the cell is editable
 * (<isEditable>) and call <startEditingAtCell>, which invokes
 * <mxCellEditor.startEditing>. The editor uses the value returned
 * by <getEditingValue> as the editing value.
 * 
 * After in-place editing, <labelChanged> is called, which invokes
 * <mxGraphModel.setValue>, which in turn calls
 * <mxGraphModel.valueForCellChanged> via <mxValueChange>.
 * 
 * The event that triggers in-place editing is passed through to the
 * <cellEditor>, which may take special actions depending on the type of the
 * event or mouse location, and is also passed to <getEditingValue>. The event
 * is then passed back to the event processing functions which can perform
 * specific actions based on the trigger event.
 * 
 * Tooltips:
 * 
 * Tooltips are implemented by <getTooltip>, which calls <getTooltipForCell>
 * if a cell is under the mousepointer. The default implementation checks if
 * the cell has a getTooltip function and calls it if it exists. Hence, in order
 * to provide custom tooltips, the cell must provide a getTooltip function, or 
 * one of the two above functions must be overridden.
 * 
 * Typically, for custom cell tooltips, the latter function is overridden as
 * follows:
 * 
 * (code)
 * graph.getTooltipForCell = function(cell)
 * {
 *   var label = this.convertValueToString(cell);
 *   return 'Tooltip for '+label;
 * }
 * (end)
 * 
 * When using a config file, the function is overridden in the mxGraph section
 * using the following entry:
 * 
 * (code)
 * <add as="getTooltipForCell"><![CDATA[
 *   function(cell)
 *   {
 *     var label = this.convertValueToString(cell);
 *     return 'Tooltip for '+label;
 *   }
 * ]]></add>
 * (end)
 * 
 * "this" refers to the graph in the implementation, so for example to check if 
 * a cell is an edge, you use this.getModel().isEdge(cell)
 *
 * For replacing the default implementation of <getTooltipForCell> (rather than 
 * replacing the function on a specific instance), the following code should be 
 * used after loading the JavaScript files, but before creating a new mxGraph 
 * instance using <mxGraph>:
 * 
 * (code)
 * mxGraph.prototype.getTooltipForCell = function(cell)
 * {
 *   var label = this.convertValueToString(cell);
 *   return 'Tooltip for '+label;
 * }
 * (end)
 * 
 * Shapes & Styles:
 * 
 * The implementation of new shapes is demonstrated in the examples. We'll assume
 * that we have implemented a custom shape with the name BoxShape which we want
 * to use for drawing vertices. To use this shape, it must first be registered in
 * the cell renderer as follows:
 * 
 * (code)
 * graph.cellRenderer.registerShape('box', BoxShape);
 * (end)
 * 
 * The code registers the BoxShape constructor under the name box in the cell
 * renderer of the graph. The shape can now be referenced using the shape-key in
 * a style definition. (The cell renderer contains a set of additional shapes,
 * namely one for each constant with a SHAPE-prefix in <mxConstants>.)
 *
 * Styles are a collection of key, value pairs and a stylesheet is a collection
 * of named styles. The names are referenced by the cellstyle, which is stored
 * in <mxCell.style> with the following format: [stylename;|key=value;]. The
 * string is resolved to a collection of key, value pairs, where the keys are
 * overridden with the values in the string.
 *
 * When introducing a new shape, the name under which the shape is registered
 * must be used in the stylesheet. There are three ways of doing this:
 * 
 *   - By changing the default style, so that all vertices will use the new
 * 		shape
 *   - By defining a new style, so that only vertices with the respective
 * 		cellstyle will use the new shape
 *   - By using shape=box in the cellstyle's optional list of key, value pairs
 * 		to be overridden
 *
 * In the first case, the code to fetch and modify the default style for
 * vertices is as follows:
 * 
 * (code)
 * var style = graph.getStylesheet().getDefaultVertexStyle();
 * style[mxConstants.STYLE_SHAPE] = 'box';
 * (end)
 * 
 * The code takes the default vertex style, which is used for all vertices that
 * do not have a specific cellstyle, and modifies the value for the shape-key
 * in-place to use the new BoxShape for drawing vertices. This is done by
 * assigning the box value in the second line, which refers to the name of the
 * BoxShape in the cell renderer.
 * 
 * In the second case, a collection of key, value pairs is created and then
 * added to the stylesheet under a new name. In order to distinguish the
 * shapename and the stylename we'll use boxstyle for the stylename:
 * 
 * (code)
 * var style = new Object();
 * style[mxConstants.STYLE_SHAPE] = 'box';
 * style[mxConstants.STYLE_STROKECOLOR] = '#000000';
 * style[mxConstants.STYLE_FONTCOLOR] = '#000000';
 * graph.getStylesheet().putCellStyle('boxstyle', style);
 * (end)
 * 
 * The code adds a new style with the name boxstyle to the stylesheet. To use
 * this style with a cell, it must be referenced from the cellstyle as follows:
 * 
 * (code)
 * var vertex = graph.insertVertex(parent, null, 'Hello, World!', 20, 20, 80, 20,
 * 				'boxstyle');
 * (end)
 * 
 * <mxGraphModel.addVertex> is a helper method that adds a new vertex with the
 * given id, value, geometry and cellstyle to the specified parent. The
 * cellstyle can also be set via the <mxCell> constructor as follows:
 * 
 * (code)
 * var vertex = new mxCell(value, geometry, style);
 * (end)
 * 
 * To summarize, each new shape must be registered in the <mxCellRenderer> with
 * a unique name. That name is then used as the value of the shape-key in a
 * default or custom style. If there are multiple custom shapes, then there
 * should be a separate style for each shape.
 * 
 * Inheriting Styles:
 * 
 * For fill-, stroke-, gradient- and indicatorColors special keywords can be
 * used. The inherit keyword for one of these colors will inherit the color
 * for the same key from the parent cell. The swimlane keyword does the same,
 * but inherits from the nearest swimlane in the ancestor hierarchy. Finally,
 * the indicated keyword will use the color of the indicator as the color for
 * the given key.
 * 
 * Scrollbars:
 * 
 * The <containers> overflow CSS property defines if scrollbars are used to
 * display the graph. For values of 'auto' or 'scroll', the scrollbars will
 * be shown. Note that the <resizeContainer> flag is normally not used
 * together with scrollbars, as it will resize the container to match the
 * size of the graph after each change.
 * 
 * Multiplicities and Validation:
 * 
 * To control the possible connections in mxGraph, <getEdgeValidationError> is
 * used. The default implementation of the function uses <multiplicities>,
 * which is an array of <mxMultiplicity>. Using this class allows to establish
 * simple multiplicities, which are enforced by the graph.
 * 
 * The <mxMultiplicity> uses <mxCell.is> to determine for which terminals it
 * applies. The default implementation of <mxCell.is> works with DOM nodes (XML
 * nodes) and checks if the given type parameter matches the nodeName of the
 * node (case insensitive). Optionally, an attributename and value can be
 * specified which are also checked.
 * 
 * <getEdgeValidationError> is called whenever the connectivity of an edge
 * changes. It returns an empty string or an error message if the edge is
 * invalid or null if the edge is valid. If the returned string is not empty
 * then it is displayed as an error message.
 * 
 * <mxMultiplicity> allows to specify the multiplicity between a terminal and
 * its possible neighbors. For example, if any rectangle may only be connected
 * to, say, a maximum of two circles you can add the following rule to
 * <multiplicities>:
 * 
 * (code)
 * graph.multiplicities.push(new mxMultiplicity(
 *   true, 'rectangle', null, null, 0, 2, ['circle'],
 *   'Only 2 targets allowed',
 *   'Only shape targets allowed'));
 * (end)
 * 
 * This will display the first error message whenever a rectangle is connected
 * to more than two circles and the second error message if a rectangle is
 * connected to anything but a circle.
 * 
 * For certain multiplicities, such as a minimum of 1 connection, which cannot
 * be enforced at cell creation time (unless the cell is created together with
 * the connection), mxGraph offers <validate> which checks all multiplicities
 * for all cells and displays the respective error messages in an overlay icon
 * on the cells.
 * 
 * If a cell is collapsed and contains validation errors, a respective warning
 * icon is attached to the collapsed cell.
 * 
 * Auto-Layout:
 * 
 * For automatic layout, the <getLayout> hook is provided. It can be overridden
 * to return a layout algorithm for the children of a given cell. Automatic
 * layout is disabled by default and may be enabled by setting <autoLayout> to
 * true or by overriding <isAutoLayout>. The <layout> function carries out all
 * required layouts and takes care of the "bubbling", that is, the invocation
 * of the layouts of all ancestors in the correct order if <isBubbleLayout>
 * returns true, which is the default case.
 * 
 * Unconnected edges:
 * 
 * The default values for all switches are designed to meet the requirements of
 * general diagram drawing applications. A very typical set of settings to
 * avoid edges that are not connected is the following:
 * 
 * (code)
 * graph.allowDanglingEdges = false;
 * graph.disconnectOnMove = false;
 * (end)
 * 
 * Setting the <cloneInvalidEdges> switch to true is optional. This switch
 * controls if edges are inserted after a copy, paste or clone-drag if they are
 * invalid. For example, edges are invalid if copied or control-dragged without 
 * having selected the corresponding terminals and allowDanglingEdges is
 * false, in which case the edges will not be cloned if the switch is false.
 * 
 * Output:
 * 
 * To produce an XML representation for a diagram, the following code can be
 * used.
 * 
 * (code)
 * var enc = new mxCodec(mxUtils.createXmlDocument());
 * var node = enc.encode(graph.getModel());
 * (end)
 * 
 * This will produce an XML node than can be handled using the DOM API or
 * turned into a string representation using the following code:
 * 
 * (code)
 * var xml = mxUtils.getXml(node);
 * (end)
 * 
 * To obtain a formatted string, mxUtils.getPrettyXml can be used instead.
 * 
 * This string can now be stored in a local persistent storage (for example
 * using Google Gears) or it can be passed to a backend using mxUtils.post as
 * follows. The url variable is the URL of the Java servlet, PHP page or HTTP
 * handler, depending on the server.
 * 
 * (code)
 * var xmlString = encodeURIComponent(mxUtils.getXml(node));
 * mxUtils.post(url, 'xml='+xmlString, function(req)
 * {
 *   // Process server response using req of type mxXmlRequest
 * });
 * (end)
 * 
 * Input:
 * 
 * To load an XML representation of a diagram into an existing graph object
 * mxUtils.load can be used as follows. The url variable is the URL of the Java
 * servlet, PHP page or HTTP handler that produces the XML string.
 * 
 * (code)
 * var xmlDoc = mxUtils.load(url).getXml();
 * var node = xmlDoc.documentElement;
 * var dec = new mxCodec(node.ownerDocument);
 * dec.decode(node, graph.getModel());
 * (end)
 * 
 * For creating a page that loads the client and a diagram using a single
 * request please refer to the deployment examples in the backends.
 * 
 * Resources:
 *
 * - js/resources/graph
 *
 * Group: Events
 *
 * For overriding the default behaviour for click and double click,
 * it is recommended to override the click and dblClick hooks
 * (see <click>, <dblClick> for an example).
 * 
 * Event: refresh
 * 
 * Refresh was invoked and the display has been revalidated. The first
 * argument points to the source <mxGraph>.
 *
 * Event: click
 *
 * Mouse was clicked on the graph. The first argument points to the
 * source <mxGraph>, the second argument contains the mouse event,
 * and the third second argument points to the <mxCell> under the mouse.
 * The third argument may be null if the user clicks on the background.
 *
 * Event: dblclick
 *
 * Mouse was double clicked on the graph. The first argument is the source
 * <mxGraph>. The second argument points to the mouse event and the third
 * argument is the <mxCell> under the mouse.
 * The third argument may be null if the user clicks on the background.
 *
 * Event: flip
 *
 * Mouse was double clicked on the adjustment point of an edge. First
 * argument is the source <mxGraph>, second argument is the <mxCell> that
 * represents the edge. This event fires whilte the change is in progress
 * and after the edge's style has been to <alternateEdgeStyle> or to null,
 * respectively.
 *
 * Event: size
 *
 * Size of the graph has changed. The first argument is the source <mxGraph>
 * and the second argument points to the new bounds (graph.getBounds()).
 *
 * Event: startEditing
 *
 * In-place editor was started. First argument is the source <mxGraph> and
 * the second argument points to the cell which is being edited.
 *
 * Event: beforeLabelChanged
 *
 * Fires before the transaction is started in <labelChanged>. First argument
 * is the source <mxGraph>, second argument is the <mxCell> being edited, third
 * and firth arguments are the old and new values, respectively and last
 * argument is the optional event that triggered the edit.
 * 
 * Event: labelChanged
 *
 * Fires when the label of a cell has been changed. First argument is the
 * source <mxGraph>, second argument is the <mxCell> being edited, third
 * and firth arguments are the old and new values, respectively.
 * This event fires while the change is in progress.
 *
 * Event: afterLabelChanged
 *
 * Fires after the transaction has been ended in <labelChanged>. First argument
 * is the source <mxGraph>, second argument is the <mxCell> being edited, third
 * and firth arguments are the old and new values, respectively and last
 * argument is the optional event that triggered the edit.
 * 
 * Event: indexChanged
 *
 * Fires when cells have been moved to back or to front. First argument
 * is the source <mxGraph>, second argument is the array of <mxCells> being
 * modified and third argument is the index. This event fires while the change
 * is in progress.
 *  
 * Event: beforeConnect
 *
 * Fires before the transaction is started in <connect>. First argument is the
 * source <mxGraph>, second argument is the edge (<mxCell>) being connected,
 * and third and fourth argument contains the terminal (<mxCell>) and boolean
 * indicating if the terminal is the new source or target of the edge.
 * 
 * Event: connect
 *
 * Fires if <connect> has established a new connection. First argument is the
 * source <mxGraph>, second argument is the edge (<mxCell>) being connected and
 * third and fourth argument contains the terminal (<mxCell>) and boolean
 * indicating if the terminal is the new source or target of the edge. This
 * event fires while the change is in progress.
 *  
 * Event: afterConnect
 *
 * Fires after the transaction is ended in <connect>. First argument is the
 * source <mxGraph>, second argument is the edge (<mxCell>) being connected,
 * and third and fourth argument contains the terminal (<mxCell>) and boolean
 * indicating if the terminal is the new source or target of the edge.
 *  
 * Event: beforeDisconnect
 *
 * Fires before the transaction is started in <disconnect>. First argument is
 * the source <mxGraph> and second argument is the array of <mxCells> that
 * contains the edges to be disconnected.
 * 
 * Event: disconnect
 *
 * Fires if <disconnect> has removed connections. First argument is the source
 * <mxGraph> and second argument is the array of <mxCells> that contains the
 * disconnected edges. This event fires while the transaction is in progress.
 *  
 * Event: afterDisconnect
 *
 * Fires after the transaction was ended in <disconnect>. First argument is
 * the source <mxGraph> and second argument is the array of <mxCells> that
 * contains the disconnected edges.
 * 
 * Event: beforeResize
 *
 * Fires before cells are resized. First argument is the source <mxGraph>.
 * Second and third arugments is the array of <mxCells> being resized and the
 * new bounds as an arrays of <mxRectangles>. This event fires before the
 * transaction is started.
 * 
 * Event: resize
 *
 * Fires after cells have been resized. First argument is the source <mxGraph>.
 * Second and third arugments is the array of <mxCells> being resized and the
 * new and old bounds of the cells in two separate arrays of <mxRectangles> and
 * <mxGeometries>, respectively. This event fires while the transaction is in
 * progress.
 * 
 * Event: afterResize
 *
 * Fires after cells have been resized. First argument is the source <mxGraph>.
 * Second arugment is the array of <mxCells> that have been resized. This event
 * fires after the transaction has been closed.
 *
 * Event: beforeUpdateSize, updateSize
 * 
 * Fires before <updateSize> starts a transaction to resize the cell to its
 * preferred size using <resize>. First argument is the source <mxGraph>,
 * second argument is the <cell> whose size is going to be changed, third
 * argument is the new preferred size of the cell.
 * 
 * Event: afterUpdateSize
 * 
 * Fires after <updateSize> ends the transaction to resize the cell to its
 * preferred size using <resize>. First argument is the source <mxGraph>,
 * second argument is the <cell> whose size has been changed.
 * 
 * Event: beforeMove
 *
 * Fires before cells are moved using a <move> call. First argument is
 * the source <mxGraph>, second argument is the array of <mxCells> that have
 * been moved. This event fires before the transaction is started.
 *
 * Event: clone
 *
 * Fires after cells are being control-dragged (moved) and cloned and the
 * target location using <move>. First argument is the source <mxGraph>,
 * second argument is the array of cloned <mxCells> and third argument is the
 * array of original cells. This event fires while the transaction is in
 * progress. Other events for adding cells are add and paste.
 *
 * Event: move
 *
 * Fires after cells have been moved using a move call. First argument is
 * the source <mxGraph>, second argument is the array of <mxCell>s being moved,
 * third argument is the set of parent <mxCells> and the fourth argument is the
 * optional target <mxCell> where the cells were added. This event fires while
 * the transaction is in progress.
 *
 * Event: afterMove
 *
 * Fires after cells have been moved using a <move> call. First argument is
 * the source <mxGraph>, second argument is the input array of <mxCells>, third
 * argument is the array of <mxCells> that have been moved. Further arguments
 * are dx (int), dy (int), clone (boolean), target (mxCell), evt (MouseEvent)
 * or location (Point for Java) as explained in <move>.
 * 
 *  This event fires
 * after the transaction has been ended.
 * 
 * Event: beforeAdd
 *
 * Fires before cells are being added to the graph. First argument is the
 * source <mxGraph>, second argument is the array of <mxCells> that have
 * been added, third argument is the future parent <mxCell>, fourth argument
 * is the index to be used for the new children, fifth and sixth arguments
 * are the optional source and target <mxCells>.
 * 
 * Event: add
 *
 * Cells are being added to the graph (via functions of <mxGraph>, not directly
 * via the model). First argument is the source <mxGraph> and second argument
 * is the array of <mxCell>s that are being added. This event fires
 * while the transaction is in progress. Other events when cells are being
 * added are paste and clone.
 *
 * Event: afterAdd
 *
 * Fires after cells have been added to the graph via functions of <mxGraph>,
 * not directly via the model. First argument is the source <mxGraph> and
 * second argument is the array of <mxCell>s that have been added. This event
 * fires after the display has been updated. Other events when cells have been
 * added are pasted and cloned.
 *
 * Event: beforeCut
 * 
 * <mxClipboard> fires this event via the graph instance before cells are cut
 * from the graph. First argument is the source <mxGraph>, second argument is
 * the array of <mxCells> to be cut.
 * 
 * Event: afterCut
 * 
 * <mxClipboard> fires this event via the graph instance after cells have been
 * cut from a graph. First argument is the source <mxGraph>, second argument is
 * the array of <mxCells> that have been cut.
 * 
 * Event: beforeCopy
 * 
 * <mxClipboard> fires this event via the graph instance when cells are about
 * to be copied to the clipboard. First argument is the source <mxGraph>,
 * second argument is the array of <mxCells> to be copied.
 * 
 * Event: afterCopy
 * 
 * <mxClipboard> fires this event via the graph instance after cells have been
 * copied to the clipboard. First argument is the source <mxGraph>, second
 * argument is the array of <mxCells> in the clipboard, third argument is the
 * array of original <mxCells> that have been copied to the clipboard.
 * 
 * Event: beforePaste
 *
 * Fires before cells are pasted to the graph via functions of <mxClipboard>,
 * not directly via the model. First argument is the source <mxGraph> and
 * second argument is the array of <mxCell>s that will be added, the third
 * argument is the array of parents that the cells had when they were added
 * to the clipboard, and the third argument is the current default parent
 * of the graph.
 * 
 * Event: paste
 *
 * Cells are being added to the graph (via pasting in the clipboard, not directly
 * via the model). First argument is the source <mxGraph> and second argument
 * is the array of <mxCell>s that are being added. This event fires
 * while the transaction is in progress. Other events for new cells are <add>
 * and <clone>.
 *
 * Event: afterPaste
 *
 * Fires after cells have been pasted to the graph via functions of <mxClipboard>,
 * not directly via the model. First argument is the source <mxGraph> and
 * second argument is the array of <mxCell>s that have been added. This event
 * fires after the display has been updated. Other events when cells have been
 * added are added and cloned.
 *
 * Event: remove
 *
 * Cells are being removed from the graph (via functions of <mxGraph>, not
 * directly via the model). First argument is the source <mxGraph>, second
 * argument is the array of <mxCells> being removed, and third argument is
 * the set of the old parent <mxCells>. This event fires while the
 * transaction is in progress.
 *
 * Event: afterRemove
 *
 * Fires after cells have been removed from the graph using functions of
 * <mxGraph>, not directly via the model. First argument is the source
 * <mxGraph> and second argument is the array of cells that have been
 * removed. This event fires after the display has been updated.
 *
 * Event: hide
 *
 * Cells are being made invisible (via functions of <mxGraph>, not
 * directly via the model). First argument is the source <mxGraph> and
 * second argument is the array of cells being hidden. This event fires
 * while the transaction is in progress.
 *
 * Event: afterHide
 *
 * Fires after cells have been made invisible from the graph using functions
 * of <mxGraph>, not directly via the model. First argument is the source
 * <mxGraph> and second argument is the array of cells that have been
 * removed. This event fires after the display has been updated.
 *
 * Event: show
 *
 * Cells are being made visible (via functions of <mxGraph>, not
 * directly via the model). First argument is the source <mxGraph> and
 * second argument is the array of cells being shown. This event fires
 * while the transaction is in progress.
 * 
 * Event: afterShow
 *
 * Fires after cells have been made visible from the graph using functions
 * of <mxGraph>, not directly via the model. First argument is the source
 * <mxGraph> and second argument is the array of cells that have been
 * removed. This event fires after the display has been updated.
 *
 * Event: beforeCollapse
 *
 * Fires before <setCollapsedState> starts the transaction to collapse cells.
 * First argument is the source <mxGraph>, second argument is the array of
 * <mxCells> that are going to be collapsed.
 * 
 * Event: collapse
 *
 * Cells are being collapsed (via functions of <mxGraph>, not
 * directly via the model). First argument is the source <mxGraph> and
 * second argument is the array of cells being collapsed. This event fires
 * while the transaction is in progress.
 *
 * Event: afterCollapse
 *
 * Fires after <setCollapsedState> ends the transaction to collapse cells.
 * First argument is the source <mxGraph>, second argument is the array of
 * <mxCells> that have been collapsed.
 * 
 * Event: beforeExpand
 *
 * Fires before <setCollapsedState> starts the transaction to expand cells.
 * First argument is the source <mxGraph>, second argument is the array of
 * <mxCells> that are going to be expanded.
 * 
 * Event: expand
 *
 * Cells are being expanded (via functions of <mxGraph>, not
 * directly via the model). First argument is the source <mxGraph> and
 * second argument is the array of cells being expanded. This event fires
 * while the transaction is in progress.
 *
 * Event: afterExpand
 *
 * Fires after <setCollapsedState> ends the transaction to expand cells.
 * First argument is the source <mxGraph>, second argument is the array of
 * <mxCells> that have been expanded.
 * 
 * Event: beforeLayout
 *
 * Fires before one or more layouts is executed. First argument is the sender
 * <mxGraph>, second argument is the array of <mxCells> whose children have
 * been modified. This event fires while the transaction is in progress.
 *
 * Event: layout
 *
 * Same as above but fired after the layout has been executed. This event
 * fires while the transaction is in progress.
 *
 * Event: afterLayout
 *
 * Same as above but fired after the transaction is closed.
 *
 * Event: addoverlay
 *
 * Overlay has been added for a cell. First argument is the source
 * <mxGraph>, second and third arguments are the <mxCell> and the
 * <mxOverlay>, respectively.
 *
 * Event: removeoverlay
 *
 * Overlay has been removed for a cell. First argument is the source
 * <mxGraph>, second and third arguments are the <mxCell> and the
 * <mxOverlay>, respectively.
 *
 * Event: root
 *
 * Model's root has changed. First argument is the source <mxGraph>.
 *
 */
{
	
	/**
	 * Group: Constructors
	 *
	 * Constructor: mxGraph
	 * 
	 * Constructs a new mxGraph in the specified container. Model is an optional
	 * mxGraphModel. If no model is provided, a new mxGraphModel instance is 
	 * used as the model. The container must have a valid owner document prior 
	 * to calling this function in Internet Explorer. RenderHint is a string to
	 * affect the display performance and rendering in IE, but not in SVG-based 
	 * browsers. The parameter is mapped to <dialect>, which may 
	 * be one of <mxConstants.DIALECT_SVG> for SVG-based browsers, 
	 * <mxConstants.DIALECT_STRICTHTML> for fastest display mode,
	 * <mxConstants.DIALECT_PREFERHTML> for faster display mode,
	 * <mxConstants.DIALECT_MIXEDHTML> for fast and <mxConstants.DIALECT_VML> 
	 * for exact display mode (slowest). The dialects are defined in mxConstants.
	 * The default values are DIALECT_SVG for SVG-based browsers and
	 * DIALECT_MIXED for IE.
	 *
	 * The possible values for the renderingHint parameter are explained below:
	 * 
	 * fast - The parameter is based on the fact that the display performance is 
	 * highly improved in IE if the VML is not contained within a VML group 
	 * element. The lack of a group element only slightly affects the display while 
	 * panning, but improves the performance by almost a factor of 2, while keeping 
	 * the display sufficiently accurate. This also allows to render certain shapes as HTML 
	 * if the display accuracy is not affected, which is implemented by 
	 * <mxShape.isMixedModeHtml>. This is the default setting and is mapped to
	 * DIALECT_MIXEDHTML.
	 * faster - Same as fast, but more expensive shapes are avoided. This is 
	 * controlled by <mxShape.preferModeHtml>. The default implementation will 
	 * avoid gradients and rounded rectangles, but more significant shapes, such 
	 * as rhombus, ellipse, actor and cylinder will be rendered accurately. This 
	 * setting is mapped to DIALECT_PREFERHTML.
	 * fastest - Almost anything will be rendered in Html. This allows for 
	 * rectangles, labels and images. This setting is mapped to
	 * DIALECT_STRICTHTML.
	 * exact - If accurate panning is required and if the diagram is small (up
	 * to 100 cells), then this value should be used. In this mode, a group is 
	 * created that contains the VML. This allows for accurate panning and is 
	 * mapped to DIALECT_VML.
	 *
	 * Example:
	 * 
	 * To create a graph inside a DOM node with an id of graph:
	 * (code)
	 * var container = document.getElementById('graph');
	 * var graph = new mxGraph(container);
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * container - Optional DOM node that acts as a container for the graph.
	 * If this is null then the container can be initialized later using
	 * <init>.
	 * model - Optional <mxGraphModel> that constitutes the graph data.
	 * renderHint - Optional string that specifies the display accuracy and
	 * performance. 
	 */
	function mxGraph(container, model, renderHint)
	{
		// Converts the renderHint into a dialect
		this.renderHint = renderHint;
		
		if (mxClient.IS_SVG)
		{
			this.dialect = mxConstants.DIALECT_SVG;
		}
		else if (renderHint == 'exact' && mxClient.IS_VML)
		{
			this.dialect = mxConstants.DIALECT_VML;
		}
		else if (renderHint == 'fastest')
		{
			this.dialect = mxConstants.DIALECT_STRICTHTML;
		}
		else if (renderHint == 'faster')
		{
			this.dialect = mxConstants.DIALECT_PREFERHTML;
		}
		else // default for VML
		{
			this.dialect = mxConstants.DIALECT_MIXEDHTML;
		}

		// Initializes the main members that do not require a container
		this.model = (model != null) ? model : new mxGraphModel();
		this.multiplicities = new Array();
		this.cellRenderer = this.createCellRenderer();
		this.selection = this.createSelectionModel();
		this.stylesheet = this.createStylesheet();
		this.view = this.createGraphView();
		
		// Adds a graph model listener to update the view
		var self = this; // closure
		this.model.addListener('change', function(sender, changes)
		{
			self.graphModelChanged(changes);
		});

		// Installs basic event handlers with disabled default settings
		this.tooltipHandler = new mxTooltipHandler(this);
		this.tooltipHandler.setEnabled(false);
		this.panningHandler = new mxPanningHandler(this);
		this.panningHandler.panningEnabled = false;
		this.connectionHandler = new mxConnectionHandler(this);
		this.connectionHandler.setEnabled(false);
		this.graphHandler = new mxGraphHandler(this);

		// Initializes the display if a container was specified
		if (container != null)
		{
			this.init(container);
		}
		
		this.view.revalidate();
	};

	/**
	 * Installs the required language resources at class
	 * loading time.
	 */
	mxResources.add(mxClient.basePath+'js/resources/graph');
	
	/**
	 * Extends mxEventSource.
	 */
	mxGraph.prototype = new mxEventSource();
	mxGraph.prototype.constructor = mxGraph;
	
	/**
	 * Variable: EMPTY_ARRAY
	 *
	 * Immutable empty array instance.
	 */
	mxGraph.prototype.EMPTY_ARRAY = new Array();
	
	/**
	 * Group: Variables
	 */
	
	/**
	 * Variable: graphListeners
	 * 
	 * Holds the graph event listeners. See <dispatchGraphEvent>.
	 */
	mxGraph.prototype.graphListeners = null;
	
	/**
	 * Variable: model
	 * 
	 * Holds the <mxGraphModel> that contains the cells to be displayed.
	 */
	mxGraph.prototype.model = null;

	/**
	 * Variable: view
	 * 
	 * Holds the <mxGraphView> that caches the <mxCellStates> for the cells.
	 */
	mxGraph.prototype.view = null;

	/**
	 * Variable: stylesheet
	 * 
	 * Holds the <mxStylesheet> that defines the appearance of the cells.
	 * 
	 * 
	 * Example:
	 * 
	 * Use the following code to read a stylesheet into an existing graph.
	 * 
	 * (code)
	 * var req = mxUtils.load('stylesheet.xml');
	 * var root = req.getDocumentElement();
	 * var dec = new mxCodec(root.ownerDocument);
	 * dec.decode(root, graph.stylesheet);
	 * (end)
	 */
	mxGraph.prototype.stylesheet = null;
		
	/**
	 * Variable: selection
	 * 
	 * Holds the <mxGraphSelection> that models the current selection.
	 */
	mxGraph.prototype.selection = null;
	
	/**
	 * Variable: editor
	 * 
	 * Holds the <mxCellEditor> that is used as the in-place editing.
	 */
	mxGraph.prototype.editor = null;
	
	/**
	 * Variable: cellRenderer
	 * 
	 * Holds the <mxCellRenderer> for rendering the cells in the graph.
	 */
	mxGraph.prototype.cellRenderer = null;
	
	/**
	 * Variable: multiplicities
	 * 
	 * An array of <mxMultiplicities> describing the allowed
	 * connections in a graph.
	 */
	mxGraph.prototype.multiplicities = null;
	
	/**
	 * Variable: renderHint
	 * 
	 * RenderHint as it was passed to the constructor.
	 */
	mxGraph.prototype.renderHint = null;
	
	/**
	 * Variable: dialect
	 * 
	 * Dialect to be used for drawing the graph. Possible values are all
	 * constants in <mxConstants> with a DIALECT-prefix.
	 */
	mxGraph.prototype.dialect = null;
	
	/**
	 * Variable: gridSize
	 * 
	 * Specifies the grid size. Default is 10.
	 */
	mxGraph.prototype.gridSize = 10;
		
	/**
	 * Variable: gridEnabled
	 * 
	 * Specifies if the grid is enabled. This is used in <snap>. Default is
	 * true.
	 */
	mxGraph.prototype.gridEnabled = true;

	/**
	 * Variable: tolerance
	 * 
	 * Tolerance for a move to be handled as a single click.
	 * Default is 4 pixels.
	 */
	mxGraph.prototype.tolerance = 4;
	
	/**
	 * Variable: defaultOverlap
	 * 
	 * Value returned by <getOverlap> if <isAllowOverlapParent> returns
	 * true for the given cell. <getOverlap> is used in <keepInside> if
	 * <isKeepInsideParentOnMove> returns true. The value specifies the
	 * portion of the child which is allowed to overlap the parent.
	 */
	mxGraph.prototype.defaultOverlap = 0.5;

	/**
	 * Variable: defaultParent
	 * 
	 * Specifies the default parent to be used to insert new cells.
	 * This is used in <getDefaultParent>. Default is null.
	 */
	mxGraph.prototype.defaultParent = null;
	
	/**
	 * Variable: alternateEdgeStyle
	 * 
	 * Specifies the alternate edge style to be used if the main control point
	 * on an edge is being doubleclicked. Default is null.
	 */
	mxGraph.prototype.alternateEdgeStyle = null;
	
	/**
	 * Variable: backgroundImage
	 *
	 * Specifies the <mxImage> to be returned by <getBackgroundImage>. Default
	 * is null.
	 * 
	 * Example:
	 *
	 * (code)
	 * var img = new mxImage('http://www.example.com/maps/examplemap.jpg', 1024, 768);
	 * graph.setBackgroundImage(img);
	 * graph.validate();
	 * (end)
	 */
	mxGraph.prototype.backgroundImage = null;
	
	/**
	 * Variable: enabled
	 * 
	 * Specifies the return value for <isEnabled>. Default is true.
	 */
	mxGraph.prototype.enabled = true;
	
	/**
	 * Variable: escapeEnabled
	 * 
	 * Specifies if the escape key should be handled in <escape>. Default is
	 * true.
	 */
	mxGraph.prototype.escapeEnabled = true;
	
	/**
	 * Variable: locked
	 * 
	 * Specifies the return value for <isLocked>. Default is false.
	 */
	mxGraph.prototype.locked = false;

	/**
	 * Variable: cloneable
	 * 
	 * Specifies the return value for <isCloneable>. Default is true.
	 */
	mxGraph.prototype.cloneable = true;
	
	/**
	 * Variable: exportEnabled
	 * 
	 * Specifies the return value for <canExport>. Default is true.
	 */
	mxGraph.prototype.exportEnabled = true;
	
	/**
	 * Variable: importEnabled
	 * 
	 * Specifies the return value for <canImport>. Default is true.
	 */
	mxGraph.prototype.importEnabled = true;
		
	/**
	 * Variable: foldingEnabled
	 * 
	 * Specifies if folding (collapse and expand via an image icon in the graph
	 * should be enabled). Default is true.
	 */
	mxGraph.prototype.foldingEnabled = true;
	
	/**
	 * Variable: editable
	 * 
	 * Specifies the return value for <isEditable>. Default is true.
	 */
	mxGraph.prototype.editable = true;
			
	/**
	 * Variable: deletable
	 * 
	 * Specifies the return value for <isDeletable>. Default is true.
	 */
	mxGraph.prototype.deletable = true;

	/**
	 * Variable: movable
	 * 
	 * Specifies the return value for <isMovable>. Default is true.
	 */
	mxGraph.prototype.movable = true;
		
	/**
	 * Variable: edgeLabelsMovable
	 * 
	 * Specifies the return value for edges in <isLabelMovable>. Default is true.
	 */
	mxGraph.prototype.edgeLabelsMovable = true;
		
	/**
	 * Variable: vertexLabelsMovable
	 * 
	 * Specifies the return value for vertices in <isLabelMovable>. Default is false.
	 */
	mxGraph.prototype.vertexLabelsMovable = false;
	
	/**
	 * Variable: dropEnabled
	 * 
	 * Specifies the return value for <isDropEnabled>. Default is false.
	 */
	mxGraph.prototype.dropEnabled = false;
	
	/**
	 * Variable: sizable
	 * 
	 * Specifies the return value for <isSizable>. Default is true.
	 */
	mxGraph.prototype.sizable = true;
	
	/**
	 * Variable: bendable
	 * 
	 * Specifies the return value for <isBendable>. Default is true.
	 */
	mxGraph.prototype.bendable = true;
	
	/**
	 * Variable: disconnectable
	 * 
	 * Specifies the return value for <isDisconntable>. Default is true.
	 */
	mxGraph.prototype.disconnectable = true;

	/**
	 * Variable: selectable
	 * 
	 * Specifies the return value for <isSelectable>. Default is true.
	 */
	mxGraph.prototype.selectable = true;
	
	/**
	 * Variable: autoSize
	 * 
	 * Specifies if the graph should automatically update the cell size
	 * after an edit. This is used in <isUpdateSize>. Default is false.
	 */
	mxGraph.prototype.autoSize = false;
	
	/**
	 * Variable: autoScroll
	 * 
	 * Specifies if the graph should automatically scroll if the mouse
	 * goes near the container edge while dragging. This is only taken
	 * into account if the container has scrollbars. Default is true.
	 */
	mxGraph.prototype.autoScroll = true;
	
	/**
	 * Variable: autoExtend
	 * 
	 * Specifies if the size of the graph should be automatically extended
	 * if the mouse goes near the container edge while dragging. This is
	 * only taken into account if the container has scrollbars. Default
	 * is true.
	 */
	mxGraph.prototype.autoExtend = true;
	
	/**
	 * Variable: autoLayout
	 * 
	 * Specifies if automatic layout should be carried out if a non-null value
	 * is returned from <getLayout>. Default is true.
	 */
	mxGraph.prototype.autoLayout = true;
	
	/**
	 * Variable: bubbleLayout
	 * 
	 * Specifies if parent layouts should be executed when children have been
	 * layouted. Default is true.
	 */
	mxGraph.prototype.bubbleLayout = true;

	/**
	 * Variable: maximumGraphBounds
	 * 
	 * <mxRectangle> that specifies the area in which all cells in the
	 * diagram should be placed. Uses in <getMaximumGraphBounds>. Use a width
	 * or height of 0 if you only want to give a upper, left corner.
	 */
	mxGraph.prototype.maximumGraphBounds = null;

	/**
	 * Variable: minimumGraphSize
	 * 
	 * <mxRectangle> that specifies the minimum size of the graph. This is
	 * ignored if the graph container has no scrollbars. Default is null.
	 */
	mxGraph.prototype.minimumGraphSize = null;

	/**
	 * Variable: minimumContainerSize
	 * 
	 * <mxRectangle> that specifies the minimum size of the <container>
	 * if <resizeContainer> is true.
	 */
	mxGraph.prototype.minimumContainerSize = null;
			
	/**
	 * Variable: maximumContainerSize
	 * 
	 * <mxRectangle> that specifies the maximum size of the container if
	 * <resizeContainer> is true.
	 */
	mxGraph.prototype.maximumContainerSize = null;
		
	/**
	 * Variable: border
	 * 
	 * Border to be added to the bottom and right side when the container is
	 * being resized after the graph has been changed. Default is 0.
	 */
	mxGraph.prototype.border = 0;
		
	/**
	 * Variable: ordered
	 * 
	 * Specifies if the display should reflect the order of the cells in
	 * the model. Default is true. This has precendence over
	 * <keepEdgesInBackground> and <keepEdgesInForeground>.
	 */
	mxGraph.prototype.ordered = true;
				
	/**
	 * Variable: keepEdgesInForeground
	 * 
	 * Specifies if edges should appear in the foreground regardless of their
	 * order in the model. This has precendence over <keepEdgeInBackground>,
	 * but not over <ordered>. Default is false.
	 */
	mxGraph.prototype.keepEdgesInForeground = false;
	
	/**
	 * Variable: keepEdgesInBackground
	 * 
	 * Specifies if edges should appear in the background regardless of their
	 * order in the model. <ordered> and <keepEdgesInForeground> have
	 * precedence over this setting. Default is true.
	 */
	mxGraph.prototype.keepEdgesInBackground = true;
	
	/**
	 * Variable: keepInsideParentOnMove
	 * 
	 * Specifies the return value for <isKeepInsideParentOnMove>. Default is
	 * true.
	 */
	mxGraph.prototype.keepInsideParentOnMove = true;

	/**
	 * Variable: extendParentOnResize
	 * 
	 * Specifies if a parent should contain the child bounds after a resize of
	 * the child. Default is true.
	 */
	mxGraph.prototype.extendParentOnResize = true;
	
	/**
	 * Variable: shiftDownwards
	 * 
	 * Specifies if the cells below a resized cell should be shifted downwards.
	 * Default is false.
	 */
	mxGraph.prototype.shiftDownwards = false;
	
	/**
	 * Variable: shiftRightwards
	 * 
	 * Specifies if the cells to the right of a resized cell should be shifted
	 * rightwards. Default is false.
	 */
	mxGraph.prototype.shiftRightwards = false;
		
	/**
	 * Variable: collapseToPreferredSize
	 * 
	 * Specifies if the cell size should be changed to the preferred size when
	 * a cell is first collapsed. Default is true.
	 */
	mxGraph.prototype.collapseToPreferredSize = true;
	
	/**
	 * Variable: zoomFactor
	 * 
	 * Specifies the factor used for <zoomIn> and <zoomOut>. Default is 1.2
	 * (120%).
	 */
	mxGraph.prototype.zoomFactor = 1.2;
	
	/**
	 * Variable: keepSelectionVisibleOnZoom
	 * 
	 * Specifies if the viewport should automatically contain
	 * the selection cells after a zoom operation. Default
	 * is false.
	 */
	mxGraph.prototype.keepSelectionVisibleOnZoom = false;
	
	/**
	 * Variable: centerZoom
	 * 
	 * Specifies if the zoom operations should go into the center
	 * of the actual diagram rather than going from top, left.
	 * Default is true.
	 */
	mxGraph.prototype.centerZoom = true;
	
	/**
	 * Variable: resetViewOnRootChange
	 * 
	 * Specifies if the scale and translate should be reset if
	 * the root changes in the model. Default is true.
	 */
	mxGraph.prototype.resetViewOnRootChange = true;
	
	/**
	 * Variable: resetEdgesOnResize
	 * 
	 * Specifies if edge control points should be reset after
	 * the resize of a connected cell. Default is false.
	 */
	mxGraph.prototype.resetEdgesOnResize = false;
	
	/**
	 * Variable: resetEdgesOnMove
	 * 
	 * Specifies if edge control points should be reset after
	 * the move of a connected cell. Default is false.
	 */
	mxGraph.prototype.resetEdgesOnMove = false;
	
	/**
	 * Variable: allowLoops
	 * 
	 * Specifies if loops (aka self-references) are allowed.
	 * Default is false.
	 */
	mxGraph.prototype.allowLoops = false;
		
	/**
	 * Variable: defaultLoopStyle
	 * 
	 * <mxEdgeStyle> to be used for loops. This is a fallback for
	 * loops if the <mxConstants.STYLE_LOOP> is undefined. Default is
	 * <mxEdgeStyle.Loop>.
	 */
	mxGraph.prototype.defaultLoopStyle = mxEdgeStyle.Loop;
	
	/**
	 * Variable: multigraph
	 * 
	 * Specifies if multiple edges in the same direction between
	 * the same pair of vertices are allowed. Default is true.
	 */
	mxGraph.prototype.multigraph = true;
	
	/**
	 * Variable: connectableEdges
	 * 
	 * Specifies if edges are connectable. Default is false.
	 * This overrides the connectable field in edges.
	 */
	mxGraph.prototype.connectableEdges = false;
	
	/**
	 * Variable: allowDanglingEdges
	 * 
	 * Specifies if edges with disconnected terminals are
	 * allowed in the graph. Default is true.
	 */
	mxGraph.prototype.allowDanglingEdges = true;
	
	/**
	 * Variable: cloneInvalidEdges
	 * 
	 * Specifies if edges that are cloned should be validated and only inserted
	 * if they are valid. Default is true.
	 */
	mxGraph.prototype.cloneInvalidEdges = false;
	
	/**
	 * Variable: disconnectOnMove
	 * 
	 * Specifies if edges should be disconnected from their terminals when they
	 * are moved. Default is true.
	 */
	mxGraph.prototype.disconnectOnMove = true;
	
	/**
	 * Variable: labelsVisible
	 * 
	 * Specifies if labels should be visible. This is used in
	 * <getLabel>. Default is true.
	 */
	mxGraph.prototype.labelsVisible = true;
		
	/**
	 * Variable: htmlLabels
	 * 
	 * Specifies the return value for <isHtmlLabel>. Default is false.
	 */
	mxGraph.prototype.htmlLabels = false;

	/**
	 * Variable: swimlaneSelectionEnabled
	 * 
	 * Specifies if swimlanes should be selectable via the content are if the
	 * mouse is released. Default is true.
	 */
	mxGraph.prototype.swimlaneSelectionEnabled = true;
	
	/**
	 * Variable: swimlaneNesting
	 * 
	 * Specifies if nesting of swimlanes is allowed. Default is true.
	 */
	mxGraph.prototype.swimlaneNesting = true;
		
	/**
	 * Variable: swimlaneIndicatorColorAttribute
	 * 
	 * The attribute used to find the color for the indicator if the indicator
	 * color is set to 'swimlane'. Default is <mxConstants.STYLE_FILLCOLOR>.
	 */
	mxGraph.prototype.swimlaneIndicatorColorAttribute = mxConstants.STYLE_FILLCOLOR;
	
	/**
	 * Variable: collapsedImage
	 * 
	 * Specifies the <mxImage> to indicate a collapsed state.
	 * Default value is mxClient.imageBasePath+'collapsed.gif'
	 */
	mxGraph.prototype.collapsedImage = new mxImage(mxClient.imageBasePath+'collapsed.gif', 9, 9);
	
	/**
	 * Variable: expandedImage
	 * 
	 * Specifies the <mxImage> to indicate a expanded state.
	 * Default value is mxClient.imageBasePath+'expanded.gif'
	 */
	mxGraph.prototype.expandedImage = new mxImage(mxClient.imageBasePath+'expanded.gif', 9, 9);
	
	/**
	 * Variable: warningImage
	 * 
	 * Specifies the <mxImage> for the image to be used to
	 * display a warning overlay. See <setWarning>. Default value is
	 * mxClient.imageBasePath+'warning'
	 */
	mxGraph.prototype.warningImage = new mxImage(mxClient.imageBasePath+'warning'+
		((mxClient.IS_MAC) ? '.png' : '.gif'), 16, 16);
	
	/**
	 * Variable: alreadyConnectedResource
	 * 
	 * Specifies the resource key for the error message to be displayed in
	 * non-multigraphs when two vertices are already connected. If the resource
	 * for this key does not exist then the value is used as the error message.
	 * Default is 'alreadyConnected'.
	 */
	mxGraph.prototype.alreadyConnectedResource = (mxClient.language != 'none') ? 'alreadyConnected' : '';
	
	/**
	 * Variable: containsValidationErrorsResource
	 * 
	 * Specifies the resource key for the warning message to be displayed when
	 * a collapsed cell contains validation errors. If the resource for this
	 * key does not exist then the value is used as the warning message.
	 * Default is 'containsValidationErrors'.
	 */
	mxGraph.prototype.containsValidationErrorsResource = (mxClient.language != 'none') ? 'containsValidationErrors' : '';

	/**
	 * Variable: resizeContainer
	 * 
	 * Specifies if the container should be resized to the graph size when
	 * the graph size has changed. Default is false.
	 */
	mxGraph.prototype.resizeContainer = false;

	/**
	 * Function: init
	 * 
	 * Initializes the <container> and creates the respective datastructures.
	 * 
	 * Parameters:
	 * 
	 * container - DOM node that will contain the graph display.
	 */
	 mxGraph.prototype.init = function(container)
	 {
		this.container = container;
		
		// Initializes the in-place editor
 		this.editor = new mxCellEditor(this);	

		// Initializes the container using the view
		this.view.init();
		
		// Initializes the handlers
		this.tooltipHandler.init();
		this.panningHandler.init();
		this.connectionHandler.init();
		
		// Updates the size of the container for the current graph
		this.sizeDidChange();
		
		// Listens to escape keystrokes
		

		// Automatic deallocation of memory
		if (mxClient.IS_IE)
		{
			var self = this; // closure
			mxEvent.addListener(window, 'unload', function()
			{
				self.destroy();
			});
		}
		else
		{
			// Automatic tracking of the focused element for better focus handling
			// in dispatchGraphevent
			var self = this; // closure
			this.focusHandler = function(evt)
			{
				self.activeElement = mxEvent.getSource(evt);
			};

			this.blurHandler = function(evt)
			{
				self.activeElement = null;
			}

			mxEvent.addListener(document.body, 'focus', this.focusHandler);
			mxEvent.addListener(document.body, 'blur', this.blurHandler);
		}
	 };
	 
	/**
	 * Function: createGraphView
	 * 
	 * Creates a new <mxGraphView> to be used in this graph.
	 */
	mxGraph.prototype.createGraphView = function()
	{
		return new mxGraphView(this);
	};
	 
	/**
	 * Function: createCellRenderer
	 * 
	 * Creates a new <mxCellRenderer> to be used in this graph.
	 */
	mxGraph.prototype.createCellRenderer = function()
	{
		return new mxCellRenderer();
	};
	 
	/**
	 * Function: createSelectionModel
	 * 
	 * Creates a new <mxGraphSelection> to be used in this graph.
	 */
	mxGraph.prototype.createSelectionModel = function()
	{
		return new mxGraphSelection(this);
	};
	 
	/**
	 * Function: createStylesheet
	 * 
	 * Creates a new <mxGraphSelection> to be used in this graph.
	 */
	mxGraph.prototype.createStylesheet = function()
	{
		return new mxStylesheet();
	};

	/**
	 * Function: getModel
	 * 
	 * Returns the <mxGraphModel> that contains the cells.
	 */
	mxGraph.prototype.getModel = function()
	{
		return this.model;
	};

	/**
	 * Function: getView
	 * 
	 * Returns the <mxGraphView> that contains the <mxCellStates>.
	 */
	mxGraph.prototype.getView = function()
	{
		return this.view;
	};

	/**
	 * Function: getStylesheet
	 * 
	 * Returns the <mxStylesheet> that defines the style.
	 */
	mxGraph.prototype.getStylesheet = function()
	{
		return this.stylesheet;
	};

	/**
	 * Function: setStylesheet
	 * 
	 * Sets the <mxStylesheet> that defines the style.
	 */
	mxGraph.prototype.setStylesheet = function(stylesheet)
	{
		this.stylesheet = stylesheet;
	};

	/**
	 * Group: Overlays
	 */
	
	/**
	 * Function: addOverlay
	 * 
	 * Adds an <mxOverlay> for the specified cell. This method fires an
	 * <addoverlay> event and returns the new <mxOverlay>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to add the overlay for.
	 * overlay - <mxOverlay> to be added for the cell.
	 */
	mxGraph.prototype.addOverlay = function(cell, overlay)
	{
		if (cell.overlays == null)
		{
			cell.overlays = new Array();
		}
		
		cell.overlays.push(overlay);

		var state = this.view.getState(cell);

		// Immediately updates the cell display if the state exists
		if (state != null)
		{
			this.cellRenderer.redraw(state);
		}
		
		this.dispatchEvent('addoverlay', this, cell, overlay);
		
		return overlay;
	};
	
	/**
	 * Function: getOverlays
	 * 
	 * Returns the array of <mxOverlays> for the given cell or null, if
	 * no overlays are defined.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose overlays should be returned.
	 */
	mxGraph.prototype.getOverlays = function(cell)
	{
		return cell.overlays;
	};
	
	/**
	 * Function: removeOverlay
	 * 
	 * Removes and returns the given <mxOverlay> from the given cell. This
	 * method fires a <removeoverlay> event. If no overlay is given, then all
	 * overlays are removed using <removeOverlays>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose overlay should be removed.
	 * overlay - Optional <mxOverlay> to be removed.
	 */
	mxGraph.prototype.removeOverlay = function(cell, overlay)
	{
		if (overlay == null)
		{
			this.removeOverlays(cell);
		}
		else
		{
			var index = mxUtils.indexOf(cell.overlays, overlay);
			
			if (index >= 0)
			{
				cell.overlays.splice(index, 1);
				
				if (cell.overlays.length == 0)
				{
					cell.overlays = null;
				}
				
				// Immediately updates the cell display if the state exists
				var state = this.view.getState(cell);
				
				if (state != null)
				{
					this.cellRenderer.redraw(state);
				}
				
				this.dispatchEvent('removeoverlay', this, cell, overlay);	
			}
			else
			{
				overlay = null;
			}
		}
		
		return overlay;
	};
	
	/**
	 * Function: removeOverlays
	 * 
	 * Removes all <mxOverlays> from the given cell. This method
	 * fires a <removeoverlay> event for each <mxOverlay> and returns
	 * the array of <mxOverlays> that was removed from the cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose overlays should be removed
	 */
	mxGraph.prototype.removeOverlays = function(cell)
	{
		var overlays = cell.overlays;
		
		if (overlays != null)
		{
			cell.overlays = null;
			
			// Immediately updates the cell display if the state exists
			var state = this.view.getState(cell);
			
			if (state != null)
			{
				this.cellRenderer.redraw(state);
			}
			
			for (var i=0; i<overlays.length; i++)
			{
				this.dispatchEvent('removeoverlay', this, cell, overlays[i]);
			}
		}
		
		return overlays;
	};
	
	/**
	 * Function: clearOverlays
	 * 
	 * Removes all <mxOverlays> in the graph for the given cell and all its
	 * descendants. If no cell is specified then all overlays are removed from
	 * the graph. This implementation uses <removeOverlays> to remove the
	 * overlays from the individual cells.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> that represents the root of the subtree to
	 * remove the overlays from. Default is the root in the model.
	 */
	mxGraph.prototype.clearOverlays = function(cell)
	{
		cell = (cell != null) ? cell : this.model.getRoot();
		this.removeOverlays(cell);
		
		// Recursively removes all overlays from the children
		var childCount = this.model.getChildCount(cell);
		
		for (var i = 0; i < childCount; i++)
		{
			var child = this.model.getChildAt(cell, i);
			this.clearOverlays(child); // recurse
		}
	};
	
	/**
	 * Function: setWarning
	 * 
	 * Creates an overlay for the given cell using the warning and image or
	 * <warningImage> and returns the new <mxOverlay>. The warning is
	 * displayed as a tooltip in a red font and may contain HTML markup. If
	 * the warning is null or a zero length string, then all overlays are
	 * removed from the cell.
	 * 
	 * Example:
	 * 
	 * (code)
	 * graph.setWarning(cell, '<b>Warning:</b>: Hello, World!');
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose warning should be set.
	 * warning - String that represents the warning to be displayed.
	 * img - Optional <mxImage> to be used for the overlay. Default is
	 * <warningImageBasename>.
	 * isSelect - Optional boolean indicating if a click on the overlay
	 * should select the corresponding cell. Default is false.
	 */
	mxGraph.prototype.setWarning = function(cell, warning, img, isSelect)
	{
		if (warning != null &&
			warning.length > 0)	
		{
			img = (img != null) ? img : this.warningImage;
			
			// Creates the overlay with the image and warning
			var overlay = new mxOverlay(img,
				'<font color=red>'+warning+'</font>');
			
			// Adds a handler for single mouseclicks to select the cell
			if (isSelect)
			{
				var self = this; // closure
				overlay.addListener('click', function(sender, evt)
				{
					self.setSelectionCell(cell);
				});
			}
			
			// Sets and returns the overlay in the graph
			return this.addOverlay(cell, overlay);
		}
		else
		{
			this.removeOverlays(cell);
		}
		
		return null;
	};
	
	/**
	 * Group: In-place editing
	 */
		
	/**
	 * Function: edit
	 * 
	 * Calls <startEditingAtCell> using the given cell or the first selection
	 * cell.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> to be edited. Default is the selection cell.
	 * trigger - Optional mouse event that triggered the edit.
	 */
	mxGraph.prototype.edit = function(cell, trigger)
	{
		cell = cell || this.getSelectionCell();
		
		if (cell != null &&
			this.isEditable(cell))
		{
			this.startEditingAtCell(cell, trigger);
		}
	};
	
	/**
	 * Function: startEditingAtCell
	 * 
	 * Fires a <startEditing> event and invokes <mxCellEditor.startEditing>
	 * on <editor>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to start the in-place editor for.
	 * trigger - Optional mouse event that triggered the edit.
	 */
	mxGraph.prototype.startEditingAtCell = function(cell, trigger)
	{
		this.dispatchEvent('startEditing', this, cell, trigger);
		this.editor.startEditing(cell, trigger);
	};
			
	/**
	 * Function: getEditingValue
	 * 
	 * Returns the initial value for in-place editing. This implementation
	 * returns <convertValueToString> for the given cell. If this function is
	 * overridden, then <mxGraphModel.valueForCellChanged> should take care
	 * of correctly storing the actual new value inside the user object.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the initial editing value should be returned.
	 * trigger - Optional mouse event that triggered the editor.
	 */
	mxGraph.prototype.getEditingValue = function(cell, trigger)
	{
		return this.convertValueToString(cell);
	};

	/**
	 * Function: labelChanged
	 * 
	 * Called when the label of a cell has been changed. This implementation
	 * calls <mxGraphModel.setValue> and <updateSize> if <isUpdateSize> returns
	 * true for the given cell. Finally, a <labelChanged> event is fired before
	 * calling endUpdate on the model.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the label has been changed.
	 * newValue - String that represents the new label.
	 * trigger - Optional mouse event that triggered the editor.
	 */
	mxGraph.prototype.labelChanged = function(cell, newValue, trigger)
	{
		var oldValue = this.model.getValue(cell);
		this.dispatchEvent('beforeLabelChanged', this, cell, oldValue, newValue, trigger);
		
		this.model.beginUpdate();
		try
		{
			this.setLabelForCell(cell, newValue);
			
			if (this.isUpdateSize(cell))
			{
				this.updateSize(cell);
			}
			
			this.dispatchEvent('labelChanged', this, cell, oldValue, newValue, trigger);
		}
		finally
		{
			this.model.endUpdate();
		}

		this.dispatchEvent('afterLabelChanged', this, cell, oldValue, newValue, trigger);
	};

	/**
	 * Function: setLabelForCell
	 * 
	 * Sets the new label for a cell.
	 */
	mxGraph.prototype.setLabelForCell = function(cell, newValue)
	{
		this.model.setValue(cell, newValue);
	};

	/**
	 * Group: Event processing
	 */
	
	/**
	 * Function: escape
	 * 
	 * Processes an escape keystroke.
	 * 
	 * Parameters:
	 * 
	 * evt - Mouseevent that represents the keystroke.
	 */
	mxGraph.prototype.escape = function(evt)
	{
		if (this.escapeEnabled)
		{
			this.editor.stopEditing(true);
			this.connectionHandler.reset();
			this.graphHandler.reset();
			
			// Cancels all cell-based editing
			var cells = this.getSelectionCells();
			
			for (var i = 0; i < cells.length; i++)
			{
				var state = this.view.getState(cells[i]);
				
				if (state != null &&
					state.handler != null)
				{
					state.handler.reset();
				}
			}
		}
	};
	
	/**
	 * Function: click
	 * 
	 * Processes a singleclick on an optional cell and fires a <click> event.
	 * The click event is fired initially. If the graph is enabled and the
	 * event has not been consumed, then the cell is selected using
	 * <selectCellForEvent> or the selection is cleared using
	 * <mxGraphSelection.clear>.
	 * 
	 * Parameters:
	 * 
	 * evt - Mouseevent that represents the singleclick.
	 * cell - Optional <mxCell> under the mousepointer.
	 */
	mxGraph.prototype.click = function(evt, cell)
	{
		this.dispatchEvent('click', this, evt, cell);
		
		// Handles the event if it has not been consumed
		if (this.isEnabled() &&
			!mxEvent.isConsumed(evt))
		{
			if (cell != null)
			{
				this.selectCellForEvent(cell, evt);
			}
			else
			{
				var swimlane = null;
				
				if (this.swimlaneSelectionEnabled)
				{
					// Translates the event location relative
					// to the graph container bounds
					var pt = mxUtils.convertPoint(this.container, evt.clientX,
								evt.clientY);
						
					// Gets the swimlane at the location (includes
					// content area of swimlanes)
					swimlane = this.getSwimlaneAt(pt.x, pt.y);
				}
					
				// Selects the swimlane and consumes the event
				if (swimlane != null)
				{
					this.selectCellForEvent(swimlane, evt);
				}
				
				// Ignores the event if the control key is pressed
				else if (!mxEvent.isToggleEvent(evt))
				{
					this.clearSelection();
				}
			}
		}
	};
	
	/**
	 * Function: dblClick
	 * 
	 * Processes a doubleclick on an optional cell and fires a <dblclick>
	 * event. The event is fired initially. If the graph is enabled and the
	 * event has not been consumed, then <edit> is called with the given
	 * cell or the event is ignored if no cell was specified.
	 *
	 * Example:
	 *
	 * (code)
	 * graph.dblClick = function(evt, cell)
	 * {
	 *   this.dispatchEvent('dblclick', this, evt, cell);
	 *   mxUtils.alert('Hello, World!');
	 * }
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * evt - Mouseevent that represents the doubleclick.
	 * cell - Optional <mxCell> under the mousepointer.
	 */
	mxGraph.prototype.dblClick = function(evt, cell)
	{
		this.dispatchEvent('dblclick', this, evt, cell);
		
		// Handles the event if it has not been consumed
		if (this.isEnabled() &&
			!mxEvent.isConsumed(evt) &&
			cell != null)
		{
			this.edit(cell, evt);
		}
	};

	/**
	 * Function: graphModelChanged
	 * 
	 * Called when the graph model changes. Invokes <processChange> on each
	 * item of the given array to update the view accordingly.
	 * 
	 * Parameters:
	 * 
	 * changes - Array that contains the individual changes.
	 */
	mxGraph.prototype.graphModelChanged = function(changes)
	{
		for (var i = 0; i < changes.length; i++)
		{
			this.processChange(changes[i]);
		}
		
		this.view.validate();
		this.sizeDidChange();
	};
		
	/**
	 * Function: processChange
	 * 
	 * Processes the given change and invalidates the respective cached data
	 * in <view>. This fires a <root> event if the root has changed in the
	 * model.
	 * 
	 * Parameters:
	 * 
	 * change - Object that represents the change on the model.
	 */
	mxGraph.prototype.processChange = function(change)
	{
		// Resets the view settings, removes all cells and clears
		// the selection if the root changes.
		if (change.constructor == mxRootChange)
		{
			if (this.resetViewOnRootChange)
			{
				this.view.scale = 1;
				this.view.translate.x = 0;
				this.view.translate.y = 0;
			}
			
			this.cellRemoved(change.previous, false);
			this.clearSelection();
			this.dispatchEvent('root', this);
		}
		
		// Adds or removes a child to the view by online invaliding
		// the minimal required portions of the cache, namely, the
		// old and new parent and the child.
		else if (change.constructor == mxChildChange)
		{
			if (change.isAdded)
			{
				this.view.clear(change.child);
			}
			else
			{
				this.cellRemoved(change.child, true);
			}

			var newParent = this.model.getParent(change.child);
			
			if (newParent != change.previous)
			{
				// Refreshes the collapse/expand icons on the parents
				if (newParent != null)
				{
					this.view.clear(newParent, null, false);
				}
				
				if (change.previous != null)
				{
					this.view.clear(change.previous, null, false);
				}
			}
		}

		// Handles two special cases where the shape does not need to be
		// recreated from scratch, it only need to be invalidated.
		else if (change.constructor == mxTerminalChange ||
				change.constructor == mxGeometryChange)
		{
			this.view.invalidate(change.cell);
		}

		// Handles two special cases where only the shape, but no
		// descendants need to be recreated
		else if (change.constructor == mxValueChange ||
				change.constructor == mxStyleChange)
		{
			this.view.clear(change.cell, null, false);
		}
		
		// Removes the state from the cache by default
		else if (change.cell != null && 
				change.cell.constructor == mxCell)
		{
			this.cellRemoved(change.cell,
				change.constructor == mxVisibleChange);
		}
	};
	
	/**
	 * Function: cellRemoved
	 * 
	 * Removes all cached information for the given cell and its descendants
	 * and clears the cells selection state is isClearSelection is true. This
	 * is called when a cell has been removed from the model.
	 * 
	 * Paramters:
	 * 
	 * cell - <mxCell> that has been removed from the model.
	 * clearSelection - Boolean indicating if the cell should be removed from
	 * the selection.
	 */
	mxGraph.prototype.cellRemoved = function(cell, clearSelection)
	{
		if (cell != null)
		{
			if (clearSelection &&
				this.isCellSelected(cell))
			{
				this.selection.removeCell(cell);
			}
			
			var childCount = this.model.getChildCount(cell);
			
			for (var i = 0; i < childCount; i++)
			{
				this.cellRemoved(this.model.getChildAt(cell, i),
					clearSelection);
			}

			this.view.removeState(cell);
		}
	};

	/**
	 * Function: scrollEventToVisible
	 * 
	 * Scrolls the graph to the given event location, extending the graph
	 * container size if required.
	 */
	mxGraph.prototype.scrollEventToVisible = function(evt, extend, border)
	{
		if (mxUtils.hasScrollbars(this.container))
		{
			var c = this.container;
			border = (border != null) ? border : 20;
			var pt = mxUtils.convertPoint(c, evt.clientX, evt.clientY);
			
			if (pt.x >= c.scrollLeft &&
				pt.y >= c.scrollTop &&
				pt.x <= c.scrollLeft + c.clientWidth &&
				pt.y <= c.scrollTop + c.clientHeight)
			{
				var dx = c.scrollLeft + c.clientWidth - pt.x;
				
				if (dx < border)
				{
					var old = c.scrollLeft;
					c.scrollLeft += border - dx;

					// Automatically extends the canvas size to the bottom, right
					// if the event is outside of the canvas and the edge of the
					// canvas has been reached. Notes: Needs fix for IE.
					if (extend && old == c.scrollLeft)
					{
						if (this.dialect == mxConstants.DIALECT_SVG)
						{
							var root = this.view.getDrawPane().ownerSVGElement;
							var width = parseInt(root.getAttribute('width')) + border - dx;
							
							// Updates the clipping region. This is an expensive
							// operation that should not be executed too often.
							root.setAttribute('width', width);
						}
						else
						{
							var canvas = this.view.getDrawPane();
							var width = parseInt(canvas.clientWidth) + border;
							
							// FIXME: The following line doesn't extend the canvas in IE
							// canvas.style.width = width + 'px';
						}
						
						c.scrollLeft += border - dx;
					}
				}
				else
				{
					dx = pt.x - c.scrollLeft;
					
					if (dx < border)
					{
						c.scrollLeft -= border - dx;
					}
				}
				
				var dy = c.scrollTop + c.clientHeight - pt.y;
				
				if (dy < border)
				{
					var old = c.scrollTop;
					c.scrollTop += border - dy;
					
					if (old == c.scrollTop && extend)
					{
						if (this.dialect == mxConstants.DIALECT_SVG)
						{
							var root = this.view.getDrawPane().ownerSVGElement;
							var height = parseInt(root.getAttribute('height')) + border - dy;
							
							// Updates the clipping region. This is an expensive
							// operation that should not be executed too often.
							root.setAttribute('height', height);
						}
						else
						{
							var canvas = this.view.getDrawPane();
							var height = parseInt(canvas.style.height) + border - dy;
							
							// FIXME: In IE, this doesn't affect the display
							//canvas.style.height = height + 'px';
						}
						
						c.scrollTop += border - dy;
					}
				}
				else
				{
					dy = pt.y - c.scrollTop;
					
					if (dy < border)
					{
						c.scrollTop -= border - dy;
					}
				}
			}
		}
	}
	
	/**
	 * Function: sizeDidChange
	 * 
	 * Called when the size of the graph has changed. This implementation fires
	 * a <size> event after updating the clipping region of the SVG element in
	 * SVG-bases browsers.
	 */
	mxGraph.prototype.sizeDidChange = function()
	{
		var bounds = this.getBounds();

		if (this.container != null)
		{
			var border = this.getBorder();
			
			var width = bounds.x + bounds.width + 1 + border;
			var height = bounds.y + bounds.height + 1 + border;
			
			if (this.minimumContainerSize != null)
			{
				width = Math.max(width, this.minimumContainerSize.width);
				height = Math.max(height, this.minimumContainerSize.height);
			}

			if (this.resizeContainer)
			{
				var w = width;
				var h = height;
				
				if (this.maximumContainerSize != null)
				{
					w = Math.min(this.maximumContainerSize.width, w);
					h = Math.min(this.maximumContainerSize.height, h);
				}

				this.container.style.width = w + 'px';
				this.container.style.height = h + 'px';
			}

			width = Math.max(width, this.container.offsetWidth);
			height = Math.max(height, this.container.offsetHeight);	
			
			if (this.minimumGraphSize != null)
			{
				width = Math.max(width, this.minimumGraphSize.width * this.view.scale);
				height = Math.max(height, this.minimumGraphSize.height * this.view.scale);
			}
			
			if (this.dialect == mxConstants.DIALECT_SVG)
			{
				var root = this.view.getDrawPane().ownerSVGElement;

				// Updates the clipping region. This is an expensive
				// operation that should not be executed too often.
				root.setAttribute('width', width);
				root.setAttribute('height', height);
			}
			else
			{
				var canvas = this.view.getDrawPane();
				
				canvas.style.width = width + 'px';
				canvas.style.height = height + 'px';
			}
		}
		
		this.dispatchEvent('size', this, bounds);
	};

	/**
	 * Group: Cell styles
	 */

	/**
	 * Function: getCellStyle
	 * 
	 * Returns an array of key, value pairs representing the cell style for the
	 * given cell. If no string is defined in the model that specifies the
	 * style, then the default style for the cell is returned or <EMPTY_ARRAY>,
	 * if not style can be found.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose style should be returned as an array.
	 */
	mxGraph.prototype.getCellStyle = function(cell)
	{
		var stylename = this.model.getStyle(cell);
		var style = null;
		
		// Gets the default style for the cell
		if (this.model.isEdge(cell))
		{
			style = this.stylesheet.getDefaultEdgeStyle();
		}
		else
		{
			style = this.stylesheet.getDefaultVertexStyle();
		}
		
		// Resolves the stylename using the above as the default
		if (stylename != null)
		{
			style = this.stylesheet.getCellStyle(stylename, style);
		}
		
		// Returns a non-null value if no style can be found
		if (style == null)
		{
			style = mxGraph.prototype.EMPTY_ARRAY;
		}
		
		return style;
	};

	/**
	 * Function: setCellStyle
	 * 
	 * Sets the style of the specified cells. If no cells are given, then the
	 * selection cells are changed.
	 * 
	 * Parameters:
	 * 
	 * style - String representing the new style of the cells.
	 * cells - Optional array of <mxCells> to set the style for. Default is the
	 * selection cells.
	 */
	mxGraph.prototype.setCellStyle = function(style, cells)
	{
		cells = cells || this.getSelectionCells();
		
		if (cells != null)
		{
			this.model.beginUpdate();
			try
			{
				for (var i = 0; i < cells.length; i++)
				{
					this.model.setStyle(cells[i], style);
				}
			}
			finally
			{
				this.model.endUpdate();
			}
		}
	};
	
	/**
	 * Function: toggleCellStyle
	 * 
	 * Toggles the boolean value for the given key in the style of the
	 * given cell. If no cell is specified then the selection cell is
	 * used.
	 * 
	 * Parameter:
	 * 
	 * key - String representing the key for the boolean value to be toggled.
	 * defaultValue - Optional boolean default value if no value is defined.
	 * Default is false.
	 * cell - Optional <mxCell> whose style should be modified. Default is
	 * the selection cell.
	 */
	mxGraph.prototype.toggleCellStyle = function(key, defaultValue, cell)
	{
		cell = cell || this.getSelectionCell();
		
		this.toggleCellStyles(key, defaultValue, [cell]);
	};
	
	/**
	 * Function: toggleCellStyles
	 * 
	 * Toggles the boolean value for the given key in the style of the given
	 * cells. If no cells are specified, then the selection cells are used. For
	 * example, this can be used to toggle <mxConstants.STYLE_ROUNDED> or any
	 * other style with a boolean value.
	 * 
	 * Parameter:
	 * 
	 * key - String representing the key for the boolean value to be toggled.
	 * defaultValue - Optional boolean default value if no value is defined.
	 * Default is false.
	 * cells - Optional array of <mxCells> whose styles should be modified.
	 * Default is the selection cells.
	 */
	mxGraph.prototype.toggleCellStyles = function(key, defaultValue, cells)
	{
		defaultValue = (defaultValue != null) ? defaultValue : false;
		cells = cells || this.getSelectionCells();
		
		if (cells != null && cells.length > 0)
		{
			var state = this.view.getState(cells[0]);
			var style = (state != null) ? state.style : this.getCellStyle(cells[0]);
			
			if (style != null)
			{
				var val = (mxUtils.getValue(style, key, defaultValue)) ? 0 : 1;
				this.setCellStyles(key, val, cells);
			}
		}
	}

	/**
	 * Function: setCellStyles
	 * 
	 * Sets the key to value in the styles of the given cells. This will modify
	 * the existing cell styles in-place and override any existing assignment
	 * for the given key. If no cells are specified, then the selection cells
	 * are changed. If no value is specified, then the respective key is
	 * removed from the styles.
	 * 
	 * Parameters:
	 * 
	 * key - String representing the key to be assigned.
	 * value - String representing the new value for the key.
	 * cells - Optional array of <mxCells> to change the style for. Default is
	 * the selection cells.
	 */
	mxGraph.prototype.setCellStyles = function(key, value, cells)
	{
		cells = cells || this.getSelectionCells();
		mxUtils.setCellStyles(this.model, cells, key, value);
	};
	
	/**
	 * Function: toggleCellStyleFlags
	 * 
	 * Toggles the given bit for the given key in the styles of the specified
	 * cells.
	 * 
	 * Parameters:
	 * 
	 * key - String representing the key to toggle the flag in.
	 * flag - Integer that represents the bit to be toggled.
	 * cells - Optional array of <mxCells> to change the style for. Default is
	 * the selection cells.
	 */
	mxGraph.prototype.toggleCellStyleFlags = function(key, flag, cells)
	{
		this.setCellStyleFlags(key, flag, null, cells);
	};
	
	/**
	 * Function: setCellStyleFlags
	 * 
	 * Sets or toggles the given bit for the given key in the styles of the
	 * specified cells.
	 * 
	 * Parameters:
	 * 
	 * key - String representing the key to toggle the flag in.
	 * flag - Integer that represents the bit to be toggled.
	 * value - Boolean value to be used or null if the value should be toggled.
	 * cells - Optional array of <mxCells> to change the style for. Default is
	 * the selection cells.
	 */
	mxGraph.prototype.setCellStyleFlags = function(key, flag, value, cells)
	{
		cells = cells || this.getSelectionCells();
		
		if (cells != null && cells.length > 0)
		{
			if (value == null)
			{
				var state = this.view.getState(cells[0]);
				var style = (state != null) ? state.style : this.getCellStyle(cells[0]);
				
				if (style != null)
				{
					var current = parseInt(style[key] || 0);
					value = !((current & flag) == flag);
				}
			}

			mxUtils.setCellStyleFlags(this.model, cells, key, flag, value);
		}
	};
	
	/**
	 * Group: Cell alignment and orientation
	 */
	
	/**
	 * Function: alignCells
	 * 
	 * Aligns the given cells vertically or horizontally according to the given
	 * alignment using the optional parameter as the coordinate.
	 * 
	 * Parameters:
	 * 
	 * align - Specifies the alignment. Possible values are all constants in
	 * mxConstants with an ALIGN prefix.
	 * cells - Array of <mxCells> to be aligned.
	 * param - Optional coordinate for the alignment.
	 */
	mxGraph.prototype.alignCells = function(align, cells, param)
	{
		cells = cells || this.getSelectionCells();
		
		if (cells != null && cells.length > 1)
		{
			// Finds the required coordinate for the alignment
			if (param == null)
			{
				for (var i = 0; i < cells.length; i++)
				{
					var g = this.getCellGeometry(cells[i]);
					
					if (g != null && !this.model.isEdge(cells[i]))
					{
						if (param == null)
						{
							if (align == mxConstants.ALIGN_CENTER)
							{
								param = g.x + g.width / 2;
								break;
							}
							else if (align == mxConstants.ALIGN_RIGHT)
							{
								param = g.x + g.width;
							}
							else if (align == mxConstants.ALIGN_TOP)
							{
								param = g.y;
							}
							else if (align == mxConstants.ALIGN_MIDDLE)
							{
								param = g.y + g.height / 2;
								break;
							}
							else if (align == mxConstants.ALIGN_BOTTOM)
							{
								param = g.y + g.height;
							}
							else
							{
								param = g.x;
							}
						}
						else
						{
							if (align == mxConstants.ALIGN_RIGHT)
							{
								param = Math.max(param, g.x + g.width);
							}
							else if (align == mxConstants.ALIGN_TOP)
							{
								param = Math.min(param, g.y);
							}
							else if (align == mxConstants.ALIGN_BOTTOM)
							{
								param = Math.max(param, g.y + g.height);
							}
							else
							{
								param = Math.min(param, g.x);
							}
						}
					}
				}
			}
			
			// Aligns the cells to the coordinate
			this.model.beginUpdate();
			try
			{
				for (var i = 0; i < cells.length; i++)
				{
					var g = this.getCellGeometry(cells[i]);
					
					if (g != null && !this.model.isEdge(cells[i]))
					{
						g = g.clone();
						
						if (align == mxConstants.ALIGN_CENTER)
						{
							g.x = param - g.width / 2;
						}
						else if (align == mxConstants.ALIGN_RIGHT)
						{
							g.x = param - g.width;
						}
						else if (align == mxConstants.ALIGN_TOP)
						{
							g.y = param;
						}
						else if (align == mxConstants.ALIGN_MIDDLE)
						{
							g.y = param - g.height / 2;
						}
						else if (align == mxConstants.ALIGN_BOTTOM)
						{
							g.y = param - g.height;
						}
						else
						{
							g.x = param;
						}
						
						this.model.setGeometry(cells[i], g);
					}
				}
			}
			finally
			{
				this.model.endUpdate();
			}
		}
	};
 	
	/**
	 * Function: flip
	 * 
	 * Called when the main control point of the edge is doubleclicked. This
	 * implementation switches between null (default) and <alternateEdgeStyle>
	 * and resets the edges control points. Finally, a <flip> event is fired
	 * before endUpdate is called on the model.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> for which the style should be changed.
	 */
	mxGraph.prototype.flip = function(edge)
	{
		if (edge != null)
		{
			this.model.beginUpdate();
			try
			{
				if (this.alternateEdgeStyle != null)
				{
					var style = this.model.getStyle(edge);
					
					if (style == null ||
						style.length == 0)
					{
						this.model.setStyle(edge, this.alternateEdgeStyle);
					}
					else
					{
						this.model.setStyle(edge, null);
					}
					
					// Removes all existing control points
					var geo = this.model.getGeometry(edge);
					
					if (geo != null)
					{
						geo = geo.clone();
						geo.points = new Array();
						
						this.model.setGeometry(edge, geo);
					}
				}
				
				this.dispatchEvent('flip', this, edge);
			}
			finally
			{
				this.model.endUpdate();
			}
		}
		
		return edge;
	};
		
	/**
	 * Group: Layers
	 */
	
	/**
	 * Function: toBack
	 * 
	 * Moves the given cells to the background. If no cells are given, then the
	 * selection cells are used.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to move to the background.
	 */
	 mxGraph.prototype.toBack = function(cells)
	 {
	 	this.setIndexForCells(cells, 0);
	 };
	 	
	/**
	 * Function: toFront
	 * 
	 * Brings the given cells to the front. If no cells are given, then the
	 * selection cells are used.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to bring to front.
	 */
	 mxGraph.prototype.toFront = function(cells)
	 {
	 	this.setIndexForCells(cells);
	 };
	 	
	/**
	 * Function: setIndexForCells
	 * 
	 * Reinserts the given cells into their parent at the given index. If the
	 * given index is null then the cells are appended.
	 * 
	 * Parameters:
	 * 
	 * cells - Optional array of <mxCells> to be reinserted. Default is the
	 * selection cells.
	 * index - Integer that specifies the new index or null to append.
	 */
	 mxGraph.prototype.setIndexForCells = function(cells, index)
	 {
	 	cells = cells || this.getSelectionCells();
	 	
	 	if (cells != null)
	 	{
			this.model.beginUpdate();
			try
			{
		 		for (var i = 0; i < cells.length; i++)
		 		{
			 		var parent = this.model.getParent(cells[i]);
			 		this.model.add(parent, cells[i], index);
		 		}
		 		
		 		this.dispatchEvent('indexChanged', this, cells, index);
			}
			finally
			{
				this.model.endUpdate();
			}
	 	}
	 };

	/**
	 * Group: Cell cloning and insertion
	 */

	/**
	 * Function: cloneCells
	 * 
	 * Returns the clones for the given cells. If the terminal of an edge is
	 * not in the given array, then the respective end is assigned a terminal
	 * point and the terminal is removed.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be cloned.
	 */
	mxGraph.prototype.cloneCells = function(cells)
	{
		// Finds the cloneable cells
		var tmp = null;
		
		if (cells != null)
		{
			// Creates a hashtable for cell lookups
			var hash = new Array();
			tmp = new Array();
			
			for (var i = 0; i < cells.length; i++)
			{
				if (this.isCellCloneable(cells[i]))
				{
					var id = mxCellPath.create(cells[i]);
					hash[id] = cells[i];
					tmp.push(cells[i]);
				}	
			}
			
			if (tmp.length > 0)
			{
				var scale = this.view.scale;
				var trans = this.view.translate;
				
				cells = tmp;
				var clones = this.model.cloneCells(cells, true);
			
				for (var i = 0; i < cells.length; i++)
				{
					var g = this.model.getGeometry(clones[i]);
					
					if (g != null)
					{
						var state = this.view.getState(cells[i]);
						var pstate = this.view.getState(
							this.model.getParent(cells[i]));
						
						if (state != null &&
							pstate != null)
						{
							var dx = pstate.origin.x;
							var dy = pstate.origin.y;
							
							if (this.model.isEdge(clones[i]))
							{
								var pts = state.absolutePoints;
								
								// Checks if the source is cloned or sets the terminal point
								var src = this.model.getTerminal(cells[i], true);
								var srcId = mxCellPath.create(src);
								
								while (src != null &&
										hash[srcId] == null)
								{
									src = this.model.getParent(src);
									srcId = mxCellPath.create(src);
								}
								
								if (src == null)
								{
									g.setTerminalPoint(
										new mxPoint(pts[0].x / scale - trans.x,
											pts[0].y / scale - trans.y), true);
								}
								
								// Checks if the target is cloned or sets the terminal point
								var trg = this.model.getTerminal(cells[i], false);
								var trgId = mxCellPath.create(trg);
								
								while (trg != null &&
										hash[trgId] == null)
								{
									trg = this.model.getParent(trg);
									trgId = mxCellPath.create(trg);
								}
								
								if (trg == null)
								{
									var n = pts.length - 1;
									g.setTerminalPoint(
										new mxPoint(pts[n].x / scale - trans.x,
											pts[n].y / scale - trans.y), false);
								}
								
								// Translates the control points
								var points = g.points;
								
								if (points != null)
								{
									for (var j = 0; j < points.length; j++)
									{
										points[j].x += dx;
										points[j].y += dy;
									}
								}
							}
							else
							{
								g.x += dx;
								g.y += dy;
							}
						}
					}
				}
				
				return clones;
			}
		}
		
		return tmp;
	};

	/**
	 * Function: insertVertex
	 * 
	 * Adds a new vertex into the given parent <mxCell> using value as the user
	 * object and the given coordinates as the <mxGeometry> of the new vertex.
	 * The id and style are used for the respective properties of the new
	 * <mxCell>, which is returned.
	 *
	 * When adding new vertices from a mouse event, one should take into
	 * account the offset of the graph container and the scale and translation
	 * of the view in order to find the correct unscaled, untranslated
	 * coordinates using <mxGraph.getPointForEvent> as follows:
	 * 
	 * (code)
	 * var pt = graph.getPointForEvent(evt);
	 * var parent = graph.getDefaultParent();
	 * graph.insertVertex(parent, null,
	 * 			'Hello, World!', x, y, 220, 30);
	 * (end)
	 * 
	 * For adding image cells, the style parameter can be assigned as
	 * 
	 * (code)
	 * stylename;image=imageUrl
	 * (end)
	 * 
	 * See <mxGraph> for more information on using images.
	 *
	 * Parameters:
	 * 
	 * parent - <mxCell> that specifies the parent of the new vertex.
	 * id - Optional string that defines the Id of the new vertex.
	 * value - Object to be used as the user object.
	 * x - Integer that defines the x coordinate of the vertex.
	 * y - Integer that defines the y coordinate of the vertex.
	 * width - Integer that defines the width of the vertex.
	 * height - Integer that defines the height of the vertex.
	 * style - Optional string that defines the cell style.
	 */
	mxGraph.prototype.insertVertex = function(parent, id, value,
		x, y, width, height, style)
	{
		var vertex = this.createVertex(parent, id, value, x, y, width, height, style);
		
		return this.addCell(vertex, parent);
	};
	
	/**
	 * Function: createVertex
	 * 
	 * Hook method that creates the new vertex for <insertVertex>.
	 */
	mxGraph.prototype.createVertex = function(parent, id, value,
			x, y, width, height, style)
	{
		// Creates the geometry for the vertex
		var geometry = new mxGeometry(x, y, width, height);
		
		// Creates the vertex
		var vertex = new mxCell(value, geometry, style);
		vertex.setId(id);
		vertex.setVertex(true);
		vertex.setConnectable(true);
		
		return vertex;
	};
		
	/**
	 * Function: insertEdge
	 * 
	 * Adds a new edge into the given parent <mxCell> using value as the user
	 * object and the given source and target as the terminals of the new edge.
	 * The id and style are used for the respective properties of the new
	 * <mxCell>, which is returned.
	 *
	 * Parameters:
	 * 
	 * parent - <mxCell> that specifies the parent of the new edge.
	 * id - Optional string that defines the Id of the new edge.
	 * value - JavaScript object to be used as the user object.
	 * source - <mxCell> that defines the source of the edge.
	 * target - <mxCell> that defines the target of the edge.
	 * style - Optional string that defines the cell style.
	 */
	mxGraph.prototype.insertEdge = function(parent, id, value, source, target, style)
	{
		// Creates the edge
		var edge = this.createEdge(parent, id, value, source, target, style);
		
		return this.addEdge(edge, parent, source, target);
	};
	
	/**
	 * Function: createEdge
	 * 
	 * Hook method that creates the new edge for <insertEdge>.
	 */
	mxGraph.prototype.createEdge = function(parent, id, value, source, target, style)
	{
		// Creates the edge
		var edge = new mxCell(value, new mxGeometry(), style);
		edge.setId(id);
		edge.setEdge(true);
		edge.geometry.relative = true;
		
		return edge;
	};

	/**
	 * Function: addCells
	 * 
	 * Adds the given cells to the children of the given parent starting at the
	 * given index and fires an <add> event. The automatic layout is called
	 * using <layoutAfterAdd>. After the display has been updated an
	 * <afterAddd> event is fired for the new cells.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be inserted.
	 * parent - Optional <mxCell> that represents the new parent. Defaul is
	 * the <defaultParent>.
	 * index - Optional index to insert the cells at. Default is to append.
	 */
	mxGraph.prototype.addCells = function(cells, parent, index)
	{
		parent = parent || this.getDefaultParent();
		index = (index != null) ? index : this.model.getChildCount(parent);
		this.dispatchEvent('beforeAdd', this, cells, parent, index);
		
		this.model.beginUpdate();
		try
		{
			for (var i = 0; i < cells.length; i++)
			{
				this.model.add(parent, cells[i], index + i);
			}
			
			this.dispatchEvent('add', this, cells);
			this.layoutAfterAdd(parent, cells);
		}
		finally
		{
			this.model.endUpdate();
		}

		this.dispatchEvent('afterAdd', this, cells);

		return cells;
	};
			
	/**
	 * Function: addEdge
	 * 
	 * Adds the given edge to the children of the given parent at the given
	 * index. If source and target are specified, then they will be used as the
	 * new source and target terminals and <connect> events will be fired for
	 * each end. Finally, a <add> event is fired for the inserted edge and
	 * the inserted edge is returned.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> to be inserted into the given parent.
	 * parent - <mxCell> that represents the new parent. Default is
	 * <defaultParent>.
	 * source - Optional <mxCell> that represents the source terminal.
	 * target - Optional <mxCell> that represents the target terminal.
	 * index - Optional index to insert the cells at. Default is to append.
	 */
	mxGraph.prototype.addEdge = function(edge, parent, source, target, index)
	{
		return this.addCell(edge, parent, index, source, target);
	};
	
	/**
	 * Function: addCell
	 * 
	 * Adds the given cell to the children of the given parent at the given
	 * index. If source and target are specified, then they will be used as the
	 * new source and target terminals and <connect> events will be fired for
	 * each end. Finally, a <add> event is fired for the inserted cell and
	 * <layoutAfterAdd> is called. After the display has been updated an
	 * <afterAdd> event is fired for the new cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to be inserted into the given parent.
	 * parent - <mxCell> that represents the new parent. Default is
	 * <defaultParent>.
	 * index - Optional index to insert the cells at. Default is to append.
	 * source - Optional <mxCell> that represents the source terminal.
	 * target - Optional <mxCell> that represents the target terminal.
	 */
	mxGraph.prototype.addCell = function(cell, parent, index, source, target)
	{
		parent = parent || this.getDefaultParent();
		index = (index != null) ? index : this.model.getChildCount(parent);
		this.dispatchEvent('beforeAdd', this, [cell], parent, index, source, target);

		this.model.beginUpdate();
		try
		{
			cell = this.model.add(parent, cell, index);
			
			if (cell != null)
			{
				// Sets the source terminal
				if (source != null)
				{
					this.model.setTerminal(cell, source, true);
					this.dispatchEvent('connect', this, cell, source, true);
				}
				
				// Sets the target terminal
				if (target != null)
				{
					this.model.setTerminal(cell, target, false);
					this.dispatchEvent('connect', this, cell, target, false);
				}

				this.dispatchEvent('add', this, [cell]);
				this.layoutAfterAdd(parent, [cell]);
			}
		}
		finally
		{
			this.model.endUpdate();
		}
		
		if (cell != null)
		{
			this.dispatchEvent('afterAdd', this, [cell]);
		}
		
		return cell;
	};

	/**
	 * Function: layoutAfterAdd
	 * 
	 * Called from <add> and <addCell> with the parent and the new child cells.
	 * This invokes <layout> on the parent cell.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> that represents the parent of the new cells.
	 * cells - Array of <mxCells> that have been added.
	 */
	mxGraph.prototype.layoutAfterAdd = function(parent, cells)
	{
		return this.layout([parent]);
	};

	/**
	 * Function: splitEdge
	 * 
	 * Splits the given edge by adding a newEdge between the previous source
	 * and the given cell and reconnecting the source of the given edge to the
	 * given cell. Fires the respective <connect> and <add> events and invokes
	 * <layoutAfterSplit> to carry out the automatic layout. After the display
	 * has been updated an <afterAdd> event is fired for the new edge.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge to be splitted.
	 * cell - <mxCell> that represents the cell to insert into the edge.
	 * newEdge - <mxCell> that represents the edge to be inserted.
	 */
	mxGraph.prototype.splitEdge = function(edge, cell, newEdge)
	{
		newEdge = newEdge || this.cloneCells([edge])[0];
		var parent = this.model.getParent(edge);
		var index = this.model.getChildCount(parent);
		var source = this.model.getTerminal(edge, true);
		
		this.dispatchEvent('beforeAdd', this, [newEdge], parent, index, source, cell);

		this.model.beginUpdate();
		try
		{
			this.model.add(parent, newEdge, index);
			this.model.setTerminals(newEdge, source, cell);
			
			this.dispatchEvent('connect', this, newEdge, source, true);
			this.dispatchEvent('connect', this, newEdge, cell, false);
			
			this.model.setTerminal(edge, cell, true);
			
			this.dispatchEvent('connect', this, edge, cell, true);
			this.dispatchEvent('add', this, [newEdge]);
			
			this.layoutAfterSplit(parent, edge, cell, newEdge);
		}
		finally
		{
			this.model.endUpdate();
		}
		
		this.dispatchEvent('afterAdd', this, [newEdge]);
		
		return newEdge;
	};

	/**
	 * Function: layoutAfterSplit
	 * 
	 * Called from <splitEdge> with the parent, the old edge, cell and new
	 * edge. This invokes <layout> on the parent cell.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> that represents the parent of the new edge.
	 * edge - <mxCell> that represents the edge that has been split.
	 * cell - <mxCell> that represents the old source of the edge.
	 * newEdge - <mxCell> that represents the inserted edge.
	 */
	mxGraph.prototype.layoutAfterSplit = function(parent, edge, cell, newEdge)
	{
		return this.layout([parent]);
	};
	
	/**
	 * Group: Cell removal/hiding
	 */
	
	/**
	 * Function: hide
	 * 
	 * Hides the given cells including all connected edges if hideEdges is true
	 * and fires a <hide> event.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be hidden.
	 * hideEdges - Boolean indicating if all connected edges should be hidden.
	 */
	mxGraph.prototype.hide = function(cells, hideEdges)
	{
		this.remove(cells, hideEdges, true, false);
	};
	
	/**
	 * Function: show
	 * 
	 * Shows the given cells including all connected edges if showEdges is true
	 * and fires a <show> event.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be shown.
	 * showEdges - Boolean indicating if all connected edges should be shown.
	 */
	mxGraph.prototype.show = function(cells, showEdges)
	{
		this.remove(cells, showEdges, false, true);
	};
	
	/**
	 * Function: remove
	 * 
	 * Removes, shows or hides the given cells including the connected edges if
	 * includeEdges is true. If isShow is true, then the cells are shown, else
	 * if isHide is true, then the cells are hidden. Otherwise, the cells are
	 * removed. Fires a <show>, <hide> or <remove> event depending on the
	 * action that has been carried out.  After the display has been updated,
	 * a <shown>, <hidden> or <removed> event is fired for the affected cells.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be removed.
	 * includeEdges - Optional boolean indicating if all connected edges should
	 * be removed. Default is true.
	 * isHide - Boolean indicating if all cells should be hidden.
	 * isShow - Boolean indicating if all cells should be shown.
	 */
	mxGraph.prototype.remove = function(cells, includeEdges, isHide, isShow)
	{
		cells = cells || this.getSelectionCells();
		includeEdges = (includeEdges != null) ? includeEdges : true;
		isHide = (isHide != null) ? isHide : false;
		isShow = (isShow != null) ? isShow : false;

		if (cells.length > 0)
		{
			var evtName = (isShow) ? 'Show' : ((isHide) ? 'Hide' : 'Remove');
			this.dispatchEvent('before'+evtName, this, tmp);
			
			var scale = this.view.scale;
			var tr = this.view.translate;
			var tmp = new Array();
			
			this.model.beginUpdate();
			try
			{
				var parents = this.getParents(cells);
			
				for (var i = 0; i < cells.length; i++)
				{
					if (isHide || isShow)
					{
						if (includeEdges)
						{
							this.removeEdges(cells[i], true, isHide, isShow);
						}
						
						this.model.setVisible(cells[i], isShow);
						tmp.push(cells[i]);
					}
					else if (this.isDeletable(cells[i]))
					{
						if (includeEdges)
						{
							this.removeEdges(cells[i], true);
						}
						else
						{
							// Disconnects edges which are not in cells
							var edges = this.getConnections(cells[i]);
							
							for (var j = 0; j < edges.length; j++)
							{
								// FIXME: Use hash for faster lookups
								if (mxUtils.indexOf(cells, edges[j]) < 0)
								{
									var g = this.model.getGeometry(edges[j]);

									if (g != null)
									{
										var state = this.view.getState(edges[j]);
												
										if (state != null)
										{
											g = g.clone();
											var source = this.view.getVisibleTerminal(edges[j], true)
												== cells[i];
											var pts = state.absolutePoints;
											var n = (source) ? 0 : pts.length - 1;

											g.setTerminalPoint(
													new mxPoint(pts[n].x / scale - tr.x,
														pts[n].y / scale - tr.y), source);
											this.model.setTerminal(edges[j], null, source);
											this.model.setGeometry(edges[j], g);
										}
									}
								}
							}
						}

						this.model.remove(cells[i]);
						tmp.push(cells[i]);
					}
				}

				// Dispatches the event while the transaction is in progress and
				// invokes the hook for automatic layout
				this.dispatchEvent(evtName.toLowerCase(), this, tmp, parents);
				this.layoutAfterRemove(parents, tmp, isHide, isShow);
			}
			finally
			{
				this.model.endUpdate();
			}
			
			// Dispatches the event after the display has been updated
			this.dispatchEvent('after'+evtName, this, tmp);
		}
	};

	/**
	 * Function: layoutAfterRemove
	 * 
	 * Called from <remove> with the previous parents of the removed, hidden or
	 * shown cells and the cells. This invokes <layout> on the parent cells.
	 * 
	 * Parameters:
	 * 
	 * parents - Array of <mxCells> representing the old parents.
	 * cells - Array of <mxCells> that have been removed.
	 * isHide - Boolean indicating if the cells were hidden.
	 * isShow - Boolean indicating if the cells were shown.
	 */
	mxGraph.prototype.layoutAfterRemove = function(parents, cells, isHide, isShow)
	{
		return this.layout(parents);
	};
	
	/**
	 * Function: hideEdges
	 * 
	 * Hides the edges that are connected to the specified <mxCell>.
	 */
	mxGraph.prototype.hideEdges = function(cell, recurse)
	{
		this.removeEdges(cell, recurse, true);
	};
	
	/**
	 * Function: showEdges
	 * 
	 * Shows the edges that are connected to the specified <mxCell>.
	 */
	mxGraph.prototype.showEdges = function(cell, recurse)
	{
		this.removeEdges(cell, recurse, false, true);
	};

	/**
	 * Function: removeEdges
	 * 
	 * Removes, shows or hides the edges connected to the given cell
	 * recursively. If isShow is true, then the edges are shown, else if isHide
	 * is true, then the edges are hidden. Otherwise, the edges are removed.
	 * Fires a <show>, <hide> or <remove> event depending on the action that
	 * has been carried out. After the display has been updated, a <shown>,
	 * <hidden> or <removed> event is fired for the affected cells.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose connected edges should be modified.
	 * recurse - Boolean indicating if the edges of the children should be
	 * modified.
	 * isHide - Boolean indicating if all cells should be hidden.
	 * isShow - Boolean indicating if all cells should be shown.
	 */
	mxGraph.prototype.removeEdges = function(cell, recurse, isHide, isShow)
	{
		recurse = (recurse != null) ? recurse : true;
		isHide = (isHide != null) ? isHide : false;
		isShow = (isShow != null) ? isShow : false;
		
		if (cell != null)
		{
			var tmp = new Array();
			
			this.model.beginUpdate();
			try
			{
				var edges = this.model.getEdges(cell);
				
				if (edges != null && edges.length > 0)
				{
					// Dispatches before-event
					if (isShow)
					{
						this.dispatchEvent('beforeShow', this, tmp);
					}
					else if (isHide)
					{
						this.dispatchEvent('beforeHide', this, tmp);
					}
					else
					{
						this.dispatchEvent('beforeRemove', this, tmp);
					}
					
					// Shows or hides the edges
					if (isShow || isHide)
					{
						for (var i = 0; i < edges.length; i++)
						{
							this.model.setVisible(edges[i], isShow);
							tmp.push(edges[i]);
						}
					}
					
					// Removes the edges
					else
					{
						for (var i = 0; i < edges.length; i++)
						{
							if (this.isDeletable(edges[i]))
							{
								this.model.remove(edges[i]);
								tmp.push(edges[i]);
							}
						}
					}
					
					// Dispatches the event while the transaction is in progress
					if (isShow)
					{
						this.dispatchEvent('show', this, tmp);
					}
					else if (isHide)
					{
						this.dispatchEvent('hide', this, tmp);
					}
					else
					{
						this.dispatchEvent('remove', this, tmp);
					}
				}
				
				// Recurse
				if (recurse)
				{
					var children = this.model.getChildren(cell);
					
					if (children != null)
					{
						for (var i = 0; i < children.length; i++)
						{
							this.removeEdges(children[i], true, isHide, isShow);
						}
					}
				}
			}
			finally
			{
				this.model.endUpdate();
			}
			
			// Dispatches the event after the display has been updated
			if (tmp.length > 0)
			{
				if (isShow)
				{
					this.dispatchEvent('afterShow', this, tmp);
				}
				else if (isHide)
				{
					this.dispatchEvent('afterHide', this, tmp);
				}
				else
				{
					this.dispatchEvent('afterRemove', this, tmp);
				}
			}
		}
	};

	/**
	 * Group: Cell sizing
	 */
	
	/**
	 * Function: updateSize
	 * 
	 * Updates the size of the given cell in the model using
	 * <getPreferredSizeForCell> to get the new size. This function
	 * fires <beforeUpdateSize> and <afterUpdateSize> events.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the size should be changed.
	 */
	mxGraph.prototype.updateSize = function(cell)
	{
		if (cell != null)
		{
			var size = this.getPreferredSizeForCell(cell);
			var geo = this.model.getGeometry(cell);
			
			if (size != null &&
				geo != null)
			{
				this.dispatchEvent('beforeUpdateSize', this, cell, size);

				this.model.beginUpdate();				
				try
				{
					var geometry = geo.clone();
	
					if (this.isSwimlane(cell))
					{
						geometry = this.updateSwimlaneSize(cell, geometry, size);
					}
					else
					{
						geometry.width = size.width;
						geometry.height = size.height;
					}
						
					if (geo.width != geometry.width ||
						geo.height != geometry.height)
					{
						this.resize(cell, geometry);
					}
					
					this.dispatchEvent('updateSize', this, cell, geometry);
				}
				finally
				{
					this.model.endUpdate();
				}
				
				this.dispatchEvent('afterUpdateSize', this, cell);
			}
		}
		
		return cell;
	};

	/**
	 * Function: updateSwimlaneSize
	 * 
	 * Updates the size of the given swimlane and returns the updated geometry
	 * to be used in the model.
	 * 
	 * Parameters:
	 * 
	 * swimlane - <mxCell> that represents the swimlane to be udpated.
	 */
	mxGraph.prototype.updateSwimlaneSize = function(swimlane, geometry, pSize)
	{
		if (swimlane != null &&
			geometry != null &&
			pSize != null)
		{
			this.model.beginUpdate();
			try
			{
				var collapsed = this.isCellCollapsed(swimlane);
				var style = this.getCellStyle(swimlane);
				var cellStyle = this.model.getStyle(swimlane) || '';
				
				if (mxUtils.getValue(style, mxConstants.STYLE_HORIZONTAL, true))
				{
					cellStyle = mxUtils.setStyle(cellStyle, mxConstants.STYLE_STARTSIZE, pSize.height);
					
					if (collapsed)
					{
						geometry.height = pSize.height;
					}
					
					geometry.width = pSize.width;
				}
				else
				{
					cellStyle = mxUtils.setStyle(cellStyle, mxConstants.STYLE_STARTSIZE, pSize.width);
					
					if (collapsed)
					{
						geometry.width = pSize.width;
					}
					
					geometry.height = pSize.height;
				}
	
				this.model.setStyle(swimlane, cellStyle);
				
				if (!collapsed)
				{
					var cBounds = this.view.getBounds(this.model.getChildren(swimlane));
					
					if (cBounds != null)
					{
						var t = this.view.translate;
						var s = this.view.scale;
						
						var width = (cBounds.x + cBounds.width) / s - geometry.x - t.x;
						var height = (cBounds.y + cBounds.height) / s - geometry.y - t.y;
						
						geometry.width = Math.max(geometry.width, width);
						geometry.height = Math.max(geometry.height, height);
					}
				}
			}
			finally
			{
				this.model.endUpdate();
			}
		}
		
		return geometry;
	};
	
	/**
	 * Function: getPreferredSizeForCell
	 * 
	 * Returns the preferred width and height of the given <mxCell> as an
	 * <mxRectangle>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the preferred size should be returned.
	 */
	mxGraph.prototype.getPreferredSizeForCell = function(cell)
	{
		var result = null;
		
		if (cell != null)
		{
			var state = this.view.getState(cell);
			var style = (state != null) ?
				state.style : this.getCellStyle(cell);

			if (style != null &&
				!this.model.isEdge(cell))
			{
				var fontSize = style[mxConstants.STYLE_FONTSIZE] || 10;
				var dx = 0;
				var dy = 0;
				
				// Adds dimension of image if shape is a label
				if (this.getImage(state) != null ||
					style[mxConstants.STYLE_IMAGE] != null)
				{
					if (style[mxConstants.STYLE_SHAPE] == mxConstants.SHAPE_LABEL)
					{
						if (style[mxConstants.STYLE_VERTICAL_ALIGN] == mxConstants.ALIGN_MIDDLE)
						{
							dx += style[mxConstants.STYLE_IMAGE_WIDTH] || mxLabel.prototype.imageSize;
						}
						
						if (style[mxConstants.STYLE_ALIGN] != mxConstants.ALIGN_CENTER)
						{
							dy += style[mxConstants.STYLE_IMAGE_HEIGHT] || mxLabel.prototype.imageSize;
						}
					}
				}

				// Adds spacings
				dx += 2 * (style[mxConstants.STYLE_SPACING] || 0);
				dx += style[mxConstants.STYLE_SPACING_LEFT] || 0;
				dx += style[mxConstants.STYLE_SPACING_RIGHT] || 0;

				dy += 2 * (style[mxConstants.STYLE_SPACING] || 0);
				dy += style[mxConstants.STYLE_SPACING_TOP] || 0;
				dy += style[mxConstants.STYLE_SPACING_BOTTOM] || 0;
				
				// Add spacing for collapse/expand icon
				// LATER: Check alignment and use constants
				// for image spacing
				var image = this.getFoldingImage(state);
				
				if (image != null)
				{
					dx += image.width + 8;
				}

				// Adds space for label
				var value = this.getLabel(cell);
				
				if (value != null &&
					value.length > 0)
				{
					if (!this.isHtmlLabel(cell))
					{
						value = value.replace(/\n/g, '<br>');
					}
					
					var size = mxUtils.getSizeForString(value,
						fontSize, style[mxConstants.STYLE_FONTFAMILY]);
					var width = size.width + dx;
					var height = size.height + dy;
					
					if (style[mxConstants.STYLE_HORIZONTAL] == false)
					{
						var tmp = height;
						
						height = width;
						width = tmp;
					}
				
					if (this.gridEnabled)
					{
						width = this.snap(width + this.gridSize / 2);
						height = this.snap(height + this.gridSize / 2);
					}

					result = new mxRectangle(0, 0, width, height);
				}
				else
				{
					var gs2 = 4 * this.gridSize;
					result = new mxRectangle(0, 0, gs2, gs2);
				}
			}
		}
		
		return result;
	};

	/**
	 * Function: resize
	 * 
	 * Sets the bounds of the given cell using <resizeCells>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose bounds should be changed.
	 * bounds - <mxRectangle> that represents the new bounds.
	 */
	mxGraph.prototype.resize = function(cell, bounds)
	{
		this.resizeCells([cell], [bounds]);
	};
	
	/**
	 * Function: resizeCells
	 * 
	 * Sets the bounds of the given cells, cascades the resize using
	 * <cascadeResize> and fires a <resize> event. If <extendParentOnResize>
	 * is true, then the parent is extended if a child size is changed so that
	 * it overlaps with the parent. This invokes <layoutAfterResize> before
	 * the transaction is closed.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> whose bounds should be changed.
	 * boundsArray - Array of <mxRectangles> that represents the new bounds.
	 */
	mxGraph.prototype.resizeCells = function(cells, boundsArray)
	{
		if (cells != null &&
			boundsArray != null)
		{
			this.dispatchEvent('beforeResize', this, cells, boundsArray);
			
			var tmp = new Array();
			var layout = new Array();
			var tmpBounds = new Array();
			var oldBounds = new Array();
			
			this.model.beginUpdate();
			try
			{
				
				for (var i = 0; i < cells.length; i++)
				{
					var cell = cells[i];
					var bounds = boundsArray[i];
					var g = this.model.getGeometry(cell);
					
					if (g.x != bounds.x ||
						g.y != bounds.y ||
						g.width != bounds.width ||
						g.height != bounds.height)
					{
						tmp.push(cell);
						tmpBounds.push(bounds);
						oldBounds.push(g);
						
						g = g.clone();
			
						if (g.relative)
						{
							if (g.offset != null)
							{
								g.offset.x += bounds.x - g.x;
								g.offset.y += bounds.y - g.y;
							}
						}
						else
						{
							g.x = bounds.x;
							g.y = bounds.y;
						}
			
						g.width = bounds.width;
						g.height = bounds.height;
		
						this.model.setGeometry(cell, g);
						
						if (this.isExtendParentOnResize(cell))
						{
							this.extendParent(cell);
						}
						
						if (!this.isCellCollapsed(cell))
						{
							layout.push(cell);
						}
					}
				}
				
				if (tmp.length > 0)
				{
					this.dispatchEvent('resize', this, tmp, tmpBounds, oldBounds);
	
					if (this.resetEdgesOnResize)
					{
						this.resetEdges(tmp);
					}
	
					if (this.layoutAfterResize(this.getParents(tmp), layout).length == 0)
					{
						this.cascadeResize(tmp[0]);
					}
				}
			}
			finally
			{
				this.model.endUpdate();
			}
			
			this.dispatchEvent('afterResize', this, tmp);
		}
	};

	/**
	 * Function: layoutAfterResize
	 * 
	 * Called from <resize> with the cells have been resized. This invokes
	 * <layout> on the child and parent cells and returns the result of
	 * the call to <layout>.
	 * 
	 * Parameters:
	 * 
	 * parents - Array of <mxCells> representing the parents of the cells.
	 * cells - Array of <mxCells> that have been resized and are not collapsed.
	 */
	mxGraph.prototype.layoutAfterResize = function(parents, cells)
	{
		return this.layout(cells.concat(parents));
	};
	
	/**
	 * Function: cascadeResize
	 * 
	 * Shifts the cells returned by <getCellsToShift> after the resize of the
	 * given cell. This implementation uses the fact that the cell state in the
	 * view still contains the previous bounds when this function is called.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that has been resized.
	 */
	mxGraph.prototype.cascadeResize = function(cell)
	{
		if (cell != null)
		{
			var state = this.view.getState(cell);
			var pstate = this.view.getState(
				this.model.getParent(cell));
	
			if (state != null &&
				pstate != null)
			{
				var cells = this.getCellsToShift(state);
				
				if (cells != null)
				{
					var scale = this.view.scale;
					
					var x0 = state.x - pstate.origin.x -
						this.view.translate.x * scale;
					var y0 = state.y - pstate.origin.y -
						this.view.translate.y * scale;
					var right = state.x + state.width;
					var bottom = state.y + state.height;
					
					var geo = this.model.getGeometry(cell);
					
					var dx = state.width - geo.width * scale +
						x0 - geo.x * scale;
					var dy = state.height - geo.height * scale +
						y0 - geo.y * scale;
						
					var fx = 1 - geo.width * scale / state.width;
					var fy = 1 - geo.height * scale / state.height;
					
					this.model.beginUpdate();
					try
					{
						for (var i = 0; i < cells.length; i++)
						{
							var g = this.model.getGeometry(cells[i]);
							state = this.view.getState(cells[i]);
							
							if (state != null &&
								cells[i] != cell &&
								this.isShiftable(cells[i]))
							{
								if (this.shiftRightwards)
								{
									if (state.x >= right)
									{
										g = g.translate(-dx, 0);
									}
									else
									{
										var tmpDx = Math.max(0, state.x - x0);
										g = g.translate(-fx * tmpDx, 0);
									}
								}
								
								if (this.shiftDownwards)
								{
									if (state.y >= bottom)
									{
										g = g.translate(0, -dy);
									}
									else
									{
										var tmpDy = Math.max(0, state.y - y0);
										g = g.translate(0, -fy * tmpDy);
									}
									
									if (g != this.model.getGeometry(cells[i]))
									{
										this.model.setGeometry(cells[i], g);
										
										if (this.isExtendParentOnResize(cells[i]))
										{
											this.extendParent(cells[i]);
										}
									}
								}
							}
						}
					}
					finally
					{
						this.model.endUpdate();
					}
				}
			}
		}
	};
	
	/**
	 * Function: isExtendParentOnResize
	 * 
	 * Returns true if the parent of the given cell should be extended if the
	 * child has been resized so that it overlaps the parent. This
	 * implementation returns <extendParentOnResize>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that has been resized.
	 */
	mxGraph.prototype.isExtendParentOnResize = function(cell)
	{
		return this.extendParentOnResize;
	};

	/**
	 * Function: extendParent
	 * 
	 * Resizes the parents recursively so that they contain the complete area
	 * of the resized child cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that has been resized.
	 */
	mxGraph.prototype.extendParent = function(cell)
	{
		if (cell != null)
		{
			var parent = this.model.getParent(cell);
			var p = this.model.getGeometry(parent);
			
			if (parent != null &&
				p != null &&
				!this.isCellCollapsed(parent))
			{
				var g = this.model.getGeometry(cell);
				
				if (g != null &&
					(p.width < g.x + g.width ||
					p.height < g.y + g.height))
				{
					p = p.clone();
					
					p.width = Math.max(p.width, g.x + g.width);
					p.height = Math.max(p.height, g.y + g.height);
					
					this.resize(parent, p);
				}
			}
		}
	};
	
	/**
	 * Function: getCellsToShift
	 * 
	 * Returns the cells to shift after a resize of the
	 * specified <mxCellState>.
	 */
	mxGraph.prototype.getCellsToShift = function(state)
	{
		return this.getCellsBeyond(
			state.x +
			((this.shiftDownwards) ? 0 : state.width),
			state.y +
			((this.shiftDownwards && this.shiftRightwards) ? 0 : state.height),
			this.model.getParent(state.cell),
			this.shiftRightwards,
			this.shiftDownwards);
	};
	
	/**
	 * Group: Cell moving
	 */

	/**
	 * Function: move
	 * 
	 * Moves the given cells by the given vector (dx, dy) and clones the cells
	 * if clone is true. If a target is given, then the cells are appended as
	 * children in the given target. If cells are cloned then a <clone> event
	 * is fired while the transaction is in progress and a <afterMove> event is
	 * fired after the display has been updated.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be moved.
	 * dx - Integer that specifies the x-coordinate of the move.
	 * dy - Integer that specifies the y-coordinate of the move.
	 * clone - Boolean indicating if the cells should be cloned.
	 * target - <mxCell> that represents the new parents of the cells.
	 * evt - Mouseevent that triggered the invocation.
	 */
	mxGraph.prototype.move = function(cells, dx, dy, clone, target, evt)
	{
		var clones = cells;
		
		//  Makes sure the translation is non-null
		dx = dx || 0;
		dy = dy || 0;
		
		if (clones != null &&
			(dx != 0 ||
			dy != 0 ||
			clone ||
			target != null))
		{
			this.dispatchEvent('beforeMove', this, cells, dx, dy, clone, target, evt);
			
			this.model.beginUpdate();
			try
			{
				if (clone)
				{
					clones = this.cloneCells(cells);

					// Removes invalid edges if cloneInvalidEdges is false
					for (var i = 0; i < clones.length; i++)
					{
						if (this.cloneInvalidEdges ||
							!this.model.isEdge(clones[i]) ||
							this.getEdgeValidationError(clones[i],
								this.model.getTerminal(clones[i], true),
								this.model.getTerminal(clones[i], false)) == null)
						{
							// Adds the cloned cell to the default parent
							var parent = this.getDefaultParent();
							this.model.add(parent, clones[i]);
							
							var pstate = this.view.getState(parent);
							var geo = this.model.getGeometry(clones[i]);
							
							if (pstate != null && geo != null)
							{
								this.model.setGeometry(clones[i],
									geo.translate(-pstate.origin.x,
										-pstate.origin.y));
							}
						}
						else
						{
							clones[i] = null;
						}
					}
				
					// Dispatches a clone event if cells were cloned
					this.dispatchEvent('clone', this, clones, cells);
				}
				else if (this.disconnectOnMove &&
					this.allowDanglingEdges)
				{
					this.disconnect(cells);
				}

				for (var i = 0; i < clones.length; i++)
				{
					var g = this.model.getGeometry(clones[i]);

					if (g != null &&
						this.isMovable(clones[i]))
					{
						g = g.translate(dx, dy);
						
						if (g.relative &&
							!this.model.isEdge(clones[i]))
						{
							if (g.offset == null)
							{
								g.offset = new mxPoint(dx, dy);
							}
							else
							{
								g.offset.x += dx;
								g.offset.y += dy;
							}
						}

						this.model.setGeometry(clones[i], g);
					}
				}
				
				// Moves into group and dispatches move event
				this.moveInto(clones, target, evt);
			}
			finally
			{
				this.model.endUpdate();
			}
			
			// Dispatches a cloned event after cells were cloned
			this.dispatchEvent('afterMove', this, cells, clones, dx, dy,
					clone, target, evt);
		}
		
		return clones;
	};

	/**
	 * Function: getMaximumGraphBounds
	 * 
	 * Returns the bounds inside which the diagram should be kept as an
	 * <mxRectangle>.
	 */
	mxGraph.prototype.getMaximumGraphBounds = function()
	{
		return this.maximumGraphBounds;
	};

	/**
	 * Function: getContentArea
	 * 
	 * Returns the <mxRectangle> inside which a cell is to be kept.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the area should be returned.
	 */
	mxGraph.prototype.getContentArea = function(cell)
	{
		if (cell != null &&
			!this.model.isEdge(cell))
		{
			var parent = this.model.getParent(cell);
			
			if (parent == this.getDefaultParent() ||
				parent == this.getCurrentRoot())
			{
				return this.getMaximumGraphBounds();
			}
			else (parent != null &&
				parent != this.getDefaultParent())	
			{
				var g = this.model.getGeometry(parent);
				
				if (g != null)
				{
					var x = 0;
					var y = 0;
					var w = g.width;
					var h = g.height;
					
					if (this.isSwimlane(parent))
					{
						var size = this.getStartSize(parent);
						
						x = size.width;
						w -= size.width;
						y = size.height;
						h -= size.height;
					}
					
					return new mxRectangle(x, y, w, h);
				}
			}
		}
		
		return null;
	};
	
	/**
	 * Function: removeFromParent
	 * 
	 * Removes the specified cells from their parents and adds them to the
	 * default parent returned by <getDefaultParent>.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be removed from their parents.
	 */
	mxGraph.prototype.removeFromParent = function(cells)
	{
		cells = cells || this.getSelectionCells();
		
		if (cells != null)
		{
			var parent = this.getDefaultParent();
			
			// Removes the cells whose parent is different
			// from the default parent
			var model = this.getModel();
			var tmp = new Array();
			
			for (var i = 0; i < cells.length; i++)
			{
				if (model.getParent(cells[i]) != parent)
				{
					tmp.push(cells[i]);
				}
			}
			
			if (tmp.length > 0)
			{
				this.moveInto(tmp, parent);
			}
		}
	};

	/**
	 * Function: moveInto
	 * 
	 * Appends the given cells to the children of the given target and fires a
	 * <move> event.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be moved inside the target.
	 * target - <mxCell> that represents the new parent.
	 */
	mxGraph.prototype.moveInto = function(cells, target, evt)
	{
		if (cells != null &&
			cells.length > 0)
		{
			var parents = null;

			this.model.beginUpdate();
			try
			{
				if (target != null)
				{
					parents = [target];
					var cell = cells[0];
					
					// Splits if a connectable cell is dropped onto an edge
					if (this.model.isEdge(target) &&
						this.model.isConnectable(cell))
					{
						if (this.getEdgeValidationError(target,
							this.model.getTerminal(target, true), cell) == null)
						{
							this.splitEdge(target, cell);
						}
					}
					else
					{
						// Move cells to reflect the change of the parent. The
						// adding is done below to avoid interference with the
						// maintining of the edge parents in the graph model.
						var hash = new Array();
						
						for (var i = 0; i < cells.length; i++)
						{
							if (cells[i] != target)
							{
								var parent = this.model.getParent(cells[i]);
								var id = mxCellPath.create(parent);
								
								if (hash[id] == null)
								{
									hash[id] = parent;
									parents.push(parent);
								}
	
								if (target != parent)
								{
									var state = this.view.getState(target);
									var pstate = this.view.getState(parent);
									var g = this.model.getGeometry(cells[i]);
									
									// Keeps the cell at its old location
									if (g != null &&
										state != null &&
										pstate != null)
									{
										g = g.translate(
											pstate.origin.x - state.origin.x,
											pstate.origin.y - state.origin.y);
										this.model.setGeometry(cells[i], g);
									}
								}
								
								this.model.add(target, cells[i]);
							}
						}
					}
				}
				else
				{
					parents = this.getParents(cells);
				}
				
				// Moves cells inside the parent layout
				this.cellsMoved(cells, evt);
				
				// Keeps the cells inside their parents
				this.keepInside(cells);
				
				// Resets connected edges of moved cells
				if (this.resetEdgesOnMove)
				{
					this.resetEdges(cells);
				}
	
				this.dispatchEvent('move', this, cells, parents, target);
				this.layoutAfterMove(parents, cells, target);
			}
			finally
			{
				this.model.endUpdate();
			}
		}
	};

	/**
	 * Function: cellsMoved
	 * 
	 * Called from <moveInto> to invoke the <move> hook in the automatic
	 * layout of each modified cell's parent. The event is used to
	 * define the x- and y-coordinates passed to the move function.
	 * 
	 * Parameters:
	 * 
	 * cell - Array of <mxCells> that have been moved.
	 * evt - Mouse event that represents the mousedown.
	 */
	mxGraph.prototype.cellsMoved = function(cells, evt)
	{
		if (cells != null &&
			evt != null)
		{
			var point = mxUtils.convertPoint(this.container,
				evt.clientX, evt.clientY);

			// Checks if a layout exists to take care of the moving
			for (var i = 0; i < cells.length; i++)
			{
				var layout = this.getLayout(
					this.model.getParent(cells[i]));

				if (layout != null &&
					layout.move != null)
				{
					layout.move(cells[i], point.x, point.y);
				}
			}
		}
	};

	/**
	 * Function: keepInside
	 * 
	 * Keeps the given cells inside the bounds returned by <getContentArea> for
	 * their respective parents, according to the rules defined by
	 * <getOverlap> and if <isKeepInsideParentOnMove> returns true.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> which should be kept inside their parents.
	 */
	mxGraph.prototype.keepInside = function(cells)
	{
		if (cells != null)
		{
			this.model.beginUpdate();
			try
			{
				for (var i = 0; i < cells.length; i++)
				{
					var cell = cells[i];
					var c = (this.isKeepInsideParentOnMove(cell) ?
						this.getContentArea(cell) :
						this.getMaximumGraphBounds());
	
					if (c != null)
					{
						var g = this.model.getGeometry(cell);
						
						// Keeps child within the content area of the parent
						if (!g.relative &&
							(g.x < c.x ||
							g.y < c.y ||
							c.width < g.x + g.width ||
							c.height < g.y + g.height))
						{
							var overlap = this.getOverlap(cell);
							
							if (c.width > 0)
							{
								g.x = Math.min(g.x,
									c.x + c.width - (1 - overlap) * g.width);
							}
							
							if (c.height > 0)
							{
								g.y = Math.min(g.y,
									c.y + c.height - (1 - overlap) * g.height);
							}
							
							g.x = Math.max(g.x, c.x - g.width * overlap);
							g.y = Math.max(g.y, c.y - g.height * overlap);
						}
					}
				}
			}
			finally
			{
				this.model.endUpdate();
			}
		}
	};

	/**
	 * Function: resetEdges
	 * 
	 * Resets the control points of the edges that are connected to the given
	 * cells if not both ends of the edge are in the given cells array.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> for which the connected edges should be
	 * reset.
	 */
	mxGraph.prototype.resetEdges = function(cells)
	{
		if (cells != null)
		{
			// Prepares a hashtable for faster cell lookups
			var hash = new Array();
			
			for (var i = 0; i < cells.length; i++)
			{
				var id = mxCellPath.create(cells[i]);
				hash[id] = cells[i];
			}
			
			this.model.beginUpdate();
			try
			{
				for (var i = 0; i < cells.length; i++)
				{
					var edges = this.model.getEdges(cells[i]);
					
					if (edges != null)
					{
						for (var j = 0; j < edges.length; j++)
						{
							var source = this.view.getVisibleTerminal(edges[j], true);
							var sourceId = mxCellPath.create(source);
							
							var target = this.view.getVisibleTerminal(edges[j], false);
							var targetId = mxCellPath.create(target);
							
							// Checks if one of the terminals is not in the given array
							if (hash[sourceId] == null ||
								hash[targetId] == null)
							{
								var geo = this.model.getGeometry(edges[j]);
								
								// Resets the control points
								if (geo != null &&
									geo.points != null &&
									geo.points.length > 0)
								{
									geo = geo.clone();
									geo.points = new Array();
									this.model.setGeometry(edges[j], geo);
								}
							}
						}
					}
					
					this.resetEdges(this.model.getChildren(cells[i]));
				}
			}
			finally
			{
				this.model.endUpdate();
			}
		}
	};

	/**
	 * Function: layoutAfterMove
	 * 
	 * Called from <moveInto> with the old and new parents and the cells that
	 * have been moved. This invokes <layout> on the modified parents.
	 * 
	 * Parameters:
	 * 
	 * parents - Array of <mxCells> representing the parents of the cells
	 * including the new parent.
	 * cells - Array of <mxCells> that have been moved.
	 * target - <mxCell> representing the new parent.
	 */
	mxGraph.prototype.layoutAfterMove = function(parents, cells, target)
	{
		return this.layout(parents);
	};
	
	/**
	 * Group: Cell connecting
	 */
	
	/**
	 * Function: connect
	 * 
	 * Assigns the given edge the new source or target terminal depending on
	 * isSource and fires a <connect> event.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge to be connected.
	 * terminal - <mxCell> that represents the new terminal of the edge.
	 * isSource - Boolean indicating if the new terminal is the source or
	 * target terminal.
	 */
	mxGraph.prototype.connect = function(edge, terminal, isSource)
	{
		if (edge != null)
		{
			this.dispatchEvent('beforeConnect', this, edge, terminal, isSource);
			
			this.model.beginUpdate();
			try
			{
				this.model.setTerminal(edge, terminal, isSource);
				var geo = this.model.getGeometry(edge);
				
				// Resets the control points on the modified edge
				if (geo != null &&
					geo.points != null)
				{
					geo = geo.clone();
	
					geo.points = new Array();
					this.model.setGeometry(edge, geo);
				}
	
				this.dispatchEvent('connect', this, edge, terminal, isSource);
				this.layoutAfterConnect(edge, terminal, isSource);
			}
			finally
			{
				this.model.endUpdate();
			}
			
			this.dispatchEvent('afterConnect', this, edge, terminal, isSource);
		}
	};

	/**
	 * Function: layoutAfterConnect
	 * 
	 * Called from <connect> with the edge and terminal that have been
	 * connected. This invokes <layout> on the parent of the terminal.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> representing the edge that has been connected.
	 * terminal - <mxCell> representing the new terminal.
	 * source - Boolean indicating if the new temrinal is a source.
	 */
	mxGraph.prototype.layoutAfterConnect = function(edge, terminal, isSource)
	{
		var parent = this.model.getParent(terminal);

		if (parent != null)
		{
			return this.layout([parent]);
		}
		
		return false;
	};
	
	/**
	 * Function: disconnect
	 * 
	 * Disconnects the given edges from the terminals which are not in the
	 * given array.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be disconnected.
	 */
	mxGraph.prototype.disconnect = function(cells)
	{
		if (cells != null)
		{
			this.dispatchEvent('beforeDisconnect', this, cells);
			
			this.model.beginUpdate();
			try
			{							
				var scale = this.view.scale;
				var tr = this.view.translate;
				
				// Prepares a hashtable for faster cell lookups
				var hash = new Array();
				
				for (var i = 0; i < cells.length; i++)
				{
					var id = mxCellPath.create(cells[i]);
					hash[id] = cells[i];
				}
	
				for (var i = 0; i < cells.length; i++)
				{
					if (this.model.isEdge(cells[i]))
					{
						var g = this.model.getGeometry(cells[i]);
						
						if (g != null)
						{
							var state = this.view.getState(cells[i]);
							var pstate = this.view.getState(
								this.model.getParent(cells[i]));
							
							if (state != null &&
								pstate != null)
							{
								g = g.clone();
								var dx = -pstate.origin.x;
								var dy = -pstate.origin.y;
								var pts = state.absolutePoints;

								var src = this.model.getTerminal(cells[i], true);
								
								if (src != null &&
									this.isDisconnectable(cells[i], src, true))
								{
									var srcId = mxCellPath.create(src);
									
									while (src != null &&
											hash[srcId] == null)
									{
										src = this.model.getParent(src);
										srcId = mxCellPath.create(src);
									}
									
									if (src == null)
									{
										g.setTerminalPoint(
											new mxPoint(pts[0].x / scale - tr.x + dx,
												pts[0].y / scale - tr.y + dy), true);
										this.model.setTerminal(cells[i], null, true);
									}
								}
								
								var trg = this.model.getTerminal(cells[i], false);
								
								if (trg != null &&
									this.isDisconnectable(cells[i], trg, false))
								{
									var trgId = mxCellPath.create(trg);
									
									while (trg != null &&
											hash[trgId] == null)
									{
										trg = this.model.getParent(trg);
										trgId = mxCellPath.create(trg);
									}
									
									if (trg == null)
									{
										var n = pts.length - 1;
										g.setTerminalPoint(
											new mxPoint(pts[n].x / scale - tr.x + dx,
												pts[n].y / scale - tr.y + dy), false);
										this.model.setTerminal(cells[i], null, false);
									}
								}

								this.model.setGeometry(cells[i], g);
							}
						}
					}
				}
				
				this.dispatchEvent('disconnect', this, cells);
			}
			finally
			{
				this.model.endUpdate();
			}
			
			this.dispatchEvent('afterDisconnect', this, cells);
		}
	};
	
	/**
	 * Group: Graph display
	 */
	 
	/**
  	 * Function: getBounds
  	 * 
  	 * Returns the bounds of the visible graph. Shortcut to
  	 * <mxGraphView.bounds>.
  	 */
  	 mxGraph.prototype.getBounds = function()
  	 {
  	 	return this.view.bounds;
  	 }
	
	/**
	 * Function: getCellBounds
	 * 
	 * Returns the scaled, translated bounds for the given cell. See
	 * <mxGraphView.getBounds> for arrays.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose bounds should be returned.
	 * includeEdge - Optional boolean that specifies if the bounds of
	 * the connected edges should be included. Default is false.
	 * includeDescendants - Optional boolean that specifies if the bounds
	 * of all descendants should be included. Default is false.
	 */
	mxGraph.prototype.getCellBounds = function(cell, includeEdges, includeDescendants)
	{
		var cells = [cell];
		
		// Includes all connected edges
		if (includeEdges)
		{
			cells = cells.concat(this.model.getEdges(cell));
		}
		
		var result = this.view.getBounds(cells);
		
		// Recursively includes the bounds of the children
		if (includeDescendants)
		{
			var childCount = this.model.getChildCount(cell);
			
			for (var i = 0; i < childCount; i++)
			{
				var tmp = this.getCellBounds(this.model.getChildAt(cell, i),
					includeEdges, true);

				if (result != null)
				{
					result.add(tmp);
				}
				else
				{
					result = tmp;
				}
			}
		}
	};
	
	/**
	 * Function: refresh
	 * 
	 * Clears all cell states or the states for the hierarchy starting at the
	 * given cell and validates the graph. This fires a refresh event as the
	 * last step.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> for which the cell states should be cleared.
	 */
	mxGraph.prototype.refresh = function(cell)
	{
		this.view.clear(cell, cell==null);
		this.view.validate();
		
		this.sizeDidChange();
		this.dispatchEvent('refresh', this);
	};

	/**
	 * Function: snap
	 * 
	 * Snaps the given numeric value to the grid if <gridEnabled> is true.
	 * 
	 * Parameters:
	 * 
	 * value - Numeric value to be snapped to the grid.
	 */
	mxGraph.prototype.snap = function(value)
	{
		if (this.gridEnabled)
		{
			value = Math.round(value / this.gridSize ) * this.gridSize;
		}
		
		return value;
	};
	
	/**
	 * Function: shift
	 * 
	 * Shifts the graph display by the given amount. This is used to preview
	 * panning operations, use <mxGraphView.setTranslate> to set a persistent
	 * translation of the view.
	 * 
	 * Parameters:
	 * 
	 * dx - Amount to shift the graph along the x-axis.
	 * dy - Amount to shift the graph along the y-axis.
	 */
	mxGraph.prototype.shift = function(dx, dy)
	{
		var style = mxUtils.getCurrentStyle(this.container);
		
		if (mxUtils.hasScrollbars(this.container))
		{
			this.container.scrollLeft = -dx;
			this.container.scrollTop = -dy;
		}
		else
		{
			var canvas = this.view.getCanvas();
			
			if (this.dialect == mxConstants.DIALECT_SVG)
			{
				canvas.setAttribute('transform', 'translate('+dx+','+dy+')');
				
				if (dx == 0 &&
					dy == 0)
				{
					if (this.shiftPreview != null)
					{
						this.shiftPreview.parentNode.removeChild(this.shiftPreview);
						this.shiftPreview = null;
						
						var child = this.container.firstChild;
						
						while (child != null)
						{
							if (child != canvas.parentNode)
							{
								if (child.style != null)
								{
									child.style.visibility = 'visible';
								}
							}
							child = child.nextSibling;
						}
					}
				}
				else
				{
					if (this.shiftPreview == null)
					{
						this.shiftPreview = document.createElement('div');
						var tmp = new Array();
						
						var child = this.container.firstChild;
						
						while (child != null)
						{
							if (child != canvas.parentNode)
							{
								tmp.push(mxUtils.getInnerHtml(child));
								
								if (child.style != null)
								{
									child.style.visibility = 'hidden';
								}
							}
							
							child = child.nextSibling;
						}
						
			  			this.shiftPreview.innerHTML = tmp.join('');
			  			
						this.shiftPreview.style.position = 'absolute';
						this.shiftPreview.style.overflow = 'visible';
	
						var pt = mxUtils.getOffset(this.container);
						
						this.shiftPreview.style.left = pt.x+'px';
						this.shiftPreview.style.top = pt.y+'px';
						
						this.container.appendChild(this.shiftPreview);
					}
					
					this.shiftPreview.style.left = dx+'px';
					this.shiftPreview.style.top = dy+'px';
				}
			}
			else if (this.dialect == mxConstants.DIALECT_VML)
			{
				canvas.setAttribute('coordorigin', (-dx)+','+(-dy));
			}
			else
			{
				if (dx == 0 &&
					dy == 0)
				{
					if (this.shiftPreview != null)
					{
						this.shiftPreview.parentNode.removeChild(this.shiftPreview);
						canvas.style.visibility = 'visible';
						this.shiftPreview = null;
					}
				}
				else
				{
					if (this.shiftPreview == null)
					{
						this.shiftPreview = this.view.getDrawPane().cloneNode(false);
						var tmp = mxUtils.getInnerHtml(this.view.getBackgroundPane());
						tmp += mxUtils.getInnerHtml(this.view.getDrawPane());
			  			this.shiftPreview.innerHTML = tmp;

						var pt = mxUtils.getOffset(this.container);
						this.shiftPreview.style.position = 'absolute';
						this.shiftPreview.style.left = pt.x+'px';
						this.shiftPreview.style.top = pt.y+'px';
						
						canvas.style.visibility = 'hidden';
						this.container.appendChild(this.shiftPreview);
					}
					
					this.shiftPreview.style.left = dx+'px';
					this.shiftPreview.style.top = dy+'px';
				}
			}
		}
	};
	
	/**
	 * Function: zoomIn
	 * 
	 * Zooms into the graph by <zoomFactor>.
	 */
	mxGraph.prototype.zoomIn = function()
	{
		var scale = this.view.scale * this.zoomFactor;
		var state = this.view.getState(this.getSelectionCell());
		
		if (this.keepSelectionVisibleOnZoom && state != null)
		{
			var rect = new mxRectangle(
				state.x * this.zoomFactor,
				state.y * this.zoomFactor,
				state.width * this.zoomFactor,
				state.height * this.zoomFactor);
			
			// Refreshes the display only once if a
			// scroll is carried out
			this.view.scale = scale;
			
			if (!this.scrollRectToVisible(rect))
			{
				this.view.setScale(scale);
			}
		}
		else if (this.centerZoom &&
			!mxUtils.hasScrollbars(this.container))
		{
			var w = this.container.offsetWidth;
			var h = this.container.offsetHeight;
			var f = (this.zoomFactor - 1) / (scale * 2);

			this.view.scaleAndTranslate(scale,
				this.view.translate.x - w * f,
				this.view.translate.y - h * f);
		}
		else
		{
			this.view.setScale(scale);
		}
	};
	
	/**
	 * Function: zoomOut
	 * 
	 * Zooms out of the graph by <zoomFactor>.
	 */
	mxGraph.prototype.zoomOut = function()
	{
		var scale = this.view.scale / this.zoomFactor;
		var state = this.view.getState(this.getSelectionCell());
		
		if (this.keepSelectionVisibleOnZoom && state != null)
		{
			var rect = new mxRectangle(
				state.x / this.zoomFactor,
				state.y / this.zoomFactor,
				state.width / this.zoomFactor,
				state.height / this.zoomFactor);
			
			// Refreshes the display only once if a
			// scroll is carried out
			this.view.scale = scale;
			
			if (!this.scrollRectToVisible(rect))
			{
				this.view.setScale(scale);
			}
		}
		else if (this.centerZoom &&
			!mxUtils.hasScrollbars(this.container))
		{
			var w = this.container.offsetWidth;
			var h = this.container.offsetHeight;
			var f = (this.zoomFactor - 1) / (this.view.scale * 2);
			
			this.view.scaleAndTranslate(scale,
				this.view.translate.x + w * f,
				this.view.translate.y + h * f);
		}
		else
		{
			this.view.setScale(scale);
		}
	};

	/**
	 * Function: zoomActual
	 * 
	 * Resets the zoom and panning in the view.
	 */
	mxGraph.prototype.zoomActual = function()
	{
		this.view.translate.x = 0;
		this.view.translate.y = 0;
		this.view.setScale(1);
	};

	/**
	 * Function: fit
	 *
	 * Scales the graph such that the complete diagram fits into <container>.
	 */
	mxGraph.prototype.fit = function()
	{
		var border = 10;
		
		var w1 = this.container.offsetWidth-30-2*border;
		var h1 = this.container.offsetHeight-30-2*border;

		var bounds = this.view.bounds;
		
		var w2 = bounds.width/this.view.scale;
		var h2 = bounds.height/this.view.scale;
		var s = Math.min(w1 / w2, h1 / h2);
		
		if (s > 0.1 && s < 8)
		{
			this.view.translate.x = (bounds.x != null) ?
				this.view.translate.x - bounds.x / this.view.scale + border :
				border;
			this.view.translate.y = (bounds.y != null) ?
				this.view.translate.y - bounds.y / this.view.scale + border :
				border;

			this.view.setScale(s);
		}
	};

	/**
	 * Function: scrollCellToVisible
	 * 
	 * Pans the graph so that it shows the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to be made visible.
	 */
	mxGraph.prototype.scrollCellToVisible = function(cell)
	{
		var x = -this.view.translate.x;
		var y = -this.view.translate.y;
		
		var state = this.view.getState(cell);
		
		if (state != null)
		{
			var bounds = new mxRectangle(x + state.x, y + state.y, state.width,
				state.height);
	
			if (this.scrollRectToVisible(bounds))
			{
				// Triggers an update via the view's event source
				this.view.setTranslate(this.view.translate.x,
					this.view.translate.y);
			}
		}
	};

	/**
	 * Function: scrollRectToVisible
	 * 
	 * Pans the graph so that it shows the given rectangle.
	 * 
	 * Parameters:
	 * 
	 * rect - <mxRectangle> to be made visible.
	 */
	mxGraph.prototype.scrollRectToVisible = function(rect)
	{
		if (rect != null)
		{
			var isChanged = false;
			
			if (mxUtils.hasScrollbars(this.container))
			{
				var c = this.container;
				
				var dx = c.scrollLeft - rect.x;
				
				if (dx > 0)
				{
					c.scrollLeft -= dx + 2;
				}
				else
				{
					dx = rect.x + rect.width - c.scrollLeft - c.clientWidth;
					
					if (dx > 0)
					{
						c.scrollLeft += dx + 2;
					}
				}
				
				var dy = c.scrollTop - rect.y;
				
				if (dy > 0)
				{
					c.scrollTop -= dy + 2;
				}
				else
				{
					dy = rect.y + rect.height - c.scrollTop - c.clientHeight;
				
					if (dy > 0)
					{
						c.scrollTop += dy + 2;
					}
				}
			}
			else
			{
				var x = -this.view.translate.x;
				var y = -this.view.translate.y;

				var w = this.container.offsetWidth;
				var h = this.container.offsetHeight;

				var s = this.view.scale;
				
				if (rect.x + rect.width > x + w)
				{
					this.view.translate.x -= (rect.x + rect.width - w - x) / s;
					isChanged = true;
				}
				
				if (rect.y + rect.height > y + h)
				{
					this.view.translate.y -= (rect.y + rect.height - h - y) / s;
					isChanged = true;
				}
				
				if (rect.x < x)
				{
					this.view.translate.x += (x - rect.x) / s;
					isChanged = true;
				}
				
				if (rect.y  < y)
				{
					this.view.translate.y += (y - rect.y) / s;
					isChanged = true;
				}
				
				if (isChanged)
				{
					this.view.refresh();
				}
			}
		}
		
		return isChanged;
	};

	/**
	 * Function: isCellVisible
	 * 
	 * Returns true if the given cell is visible in this graph. This
	 * implementation uses <mxGraphModel.isVisible>. Subclassers can override
	 * this to implement specific visibility for cells in only one graph, that
	 * is, without affecting the visible state of the cell.
	 * 
	 * When using dynamic filter expressions for cell visibility, then the
	 * graph should be revalidated after the filter expression has changed.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose visible state should be returned.
	 */
	mxGraph.prototype.isCellVisible = function(cell)
	{
		return this.model.isVisible(cell);
	};

	/**
	 * Function: isCellCollapsed
	 * 
	 * Returns true if the given cell is collapsed in this graph. This
	 * implementation uses <mxGraphModel.isCollapsed>. Subclassers can override
	 * this to implement specific collapsed states for cells in only one graph,
	 * that is, without affecting the collapsed state of the cell.
	 * 
	 * When using dynamic filter expressions for the collapsed state, then the
	 * graph should be revalidated after the filter expression has changed.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose collapsed state should be returned.
	 */
	mxGraph.prototype.isCellCollapsed = function(cell)
	{
		return this.model.isCollapsed(cell);
	};

	/**
	 * Function: isOrthogonal
	 * 
	 * Returns true if perimeter points should be computed such that the
	 * resulting edge has only horizontal or vertical segments.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCellState> that represents the edge.
	 * vertex - <mxCellState> that represents the vertex.
	 */
	mxGraph.prototype.isOrthogonal = function(edge, vertex)
	{
		var tmp = this.view.getEdgeStyle(edge);
		
		return tmp == mxEdgeStyle.ElbowConnector ||
			tmp == mxEdgeStyle.SideToSide ||
			tmp == mxEdgeStyle.TopToBottom ||
			tmp == mxEdgeStyle.EntityRelation;
	};

	/**
	 * Function: isLoop
	 * 
	 * Returns true if the given cell state is a loop.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> that represents a potential loop.
	 */
	mxGraph.prototype.isLoop = function(state)
	{
		var src = this.view.getVisibleTerminal(state.cell, true);
		var trg = this.view.getVisibleTerminal(state.cell, false);
		
		return (src != null && src == trg);
	};

	/**
	 * Group: Folding
	 */

	/**
	 * Function: collapse
	 * 
	 * Collapses the given cells or the selection cells if no cells are
	 * specified and fires a <collapse> event.
	 * 
	 * Parameters:
	 * 
	 * cells - Optional array of <mxCells> to be collapsed. Default is the
	 * selection cells.
	 * recurse - Optional boolean indicating if the collapsed state of all
	 * descendants should be set. Default is false.
	 */
	mxGraph.prototype.collapse = function(cells, recurse)
	{
		this.setCollapsedState(cells, true, recurse);
	};

	/**
	 * Function: expand
	 * 
	 * Expands the given cells or the selection cells if no cells are
	 * specified and fires an <expand> event.
	 * 
	 * Parameters:
	 * 
	 * cells - Optional array of <mxCells> to be expanded. Default is the
	 * selection cells.
	 * recurse - Optional boolean indicating if the collapsed state of all
	 * descendants should be set. Default is false.
	 */
	mxGraph.prototype.expand = function(cells, recurse)
	{
		this.setCollapsedState(cells, false, recurse);
	};

	/**
	 * Function: setCollapsedState
	 * 
	 * Sets the collapsed state of the given cells or the selection cells if no
	 * cells are specified and fires a <beforeCollapse>, <collapse> and
	 * <afterCollapse> or <beforeExpand>, <expand> and <afterExpand> event.
	 * 
	 * Parameters:
	 * 
	 * cells - Optional array of <mxCells> whose collapsed state should be set.
	 * Default is the selection cells.
	 * collapsed - Boolean indicating the collapsed state to be assigned.
	 * recurse - Optional boolean indicating if the collapsed state of all
	 * descendants should be set. Default is false.
	 */
	mxGraph.prototype.setCollapsedState = function(cells, collapsed, recurse)
	{
		cells = cells || this.getSelectionCells();
		recurse = (recurse != null) ? recurse : false;
		
		if (cells != null &&
			cells.length > 0)
		{
			this.editor.stopEditing(false);
	
			var evtName = (collapsed) ? 'Collapse' : 'Expand';
			this.dispatchEvent('before'+evtName, this, cells);
			
			this.model.beginUpdate();
			try
			{
				for (var i = 0; i < cells.length; i++)
				{
					if ((collapsed &&
						this.isCollapsable(cells[i]) &&
						!this.isCellCollapsed(cells[i])) ||
						(!collapsed &&
						this.isExpandable(cells[i]) &&
						this.isCellCollapsed(cells[i])))
					{
						this.model.setCollapsed(cells[i], collapsed);
						this.swapBounds(cells[i], collapsed);
						
						if (this.isExtendParentOnResize(cells[i]))
						{
							this.extendParent(cells[i]);
						}
						
						this.cascadeResize(cells[i]);
						
						if (recurse)
						{
							var children = this.model.getChildren(cells[i]);
							this.setCollapsedState(children, collapsed, true);
						}
					}
				}
	
				// Fires the collapse or expand event
				this.dispatchEvent(evtName.toLowerCase(), this, cells);
				this.layoutAfterCollapsedState(cells, collapsed);
			}
			finally
			{
				this.model.endUpdate();
			}
	
			this.dispatchEvent('after'+evtName, this, cells);
		}
	};

	/**
	 * Function: layoutAfterCollapsedState
	 * 
	 * Called from <setCollapsedState> with the cells and the new collapsed
	 * state. This invokes <layout> on the parents of the cells.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCell> that have been collapsed or expanded.
	 * collapsed - Boolean indicating if the cells have been collapsed.
	 */
	mxGraph.prototype.layoutAfterCollapsedState = function(cells, collapsed)
	{
		return this.layout(this.getParents(cells));
	};

	/**
	 * Function: swapBounds
	 * 
	 * Swaps the alternate and the actual bounds in the geometry of the given
	 * cell invoking <updateAlternateBounds> before carrying out the swap.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the bounds should be swapped.
	 * willCollapse - Boolean indicating if the cell is going to be collapsed.
	 */
	mxGraph.prototype.swapBounds = function(cell, willCollapse)
	{
		if (cell != null)
		{
			var g = this.model.getGeometry(cell);
			
			if (g != null)
			{
				g = g.clone();
				
				this.updateAlternateBounds(cell, g, willCollapse);
				g.swap();
				
				this.model.setGeometry(cell, g);
			}
		}
	};

	/**
	 * Function: updateAlternateBounds
	 * 
	 * Updates or sets the alternate bounds in the given geometry for the given
	 * cell depending on whether the cell is going to be collapsed. If no
	 * alternate bounds are defined in the geometry and
	 * <collapseToPreferredSize> is true, then the preferred size is used for
	 * the alternate bounds. The top, left corner is always kept at the same
	 * location.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the geometry is being udpated.
	 * g - <mxGeometry> for which the alternate bounds should be updated.
	 * willCollapse - Boolean indicating if the cell is going to be collapsed.
	 */
	mxGraph.prototype.updateAlternateBounds = function(cell, g, willCollapse)
	{
		if (cell != null &&
			g != null)
		{
			if (g.alternateBounds == null)
			{
				var bounds = g;
				
				if (this.collapseToPreferredSize)
				{
					var tmp = this.getPreferredSizeForCell(cell);
					
					if (tmp != null)
					{
						bounds = tmp;
						var state = this.view.getState(cell);
						var style = (state != null) ?
							state.style :
							this.getCellStyle(cell);
	
						var startSize = mxUtils.getValue(style, mxConstants.STYLE_STARTSIZE);
	
						if (startSize > 0)
						{
							bounds.height = Math.max(bounds.height, startSize);
						}
					}
				}
				
				g.alternateBounds = new mxRectangle(
					g.x, g.y, bounds.width, bounds.height);
			}
			else
			{
				g.alternateBounds.x = g.x;
				g.alternateBounds.y = g.y;
			}
		}
	};

	/**
	 * Group: Drilldown
	 */

	/**
	 * Function: getCellGeometry
	 * 
	 * Returns the <mxGeometry> for the given cell. This implementation uses
	 * <mxGraphModel.getGeometry>. Subclassers can override this to implement
	 * specific geometries for cells in only one graph, that is, it can return
	 * geometries that depend on the current state of the view.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose geometry should be returned.
	 */
	mxGraph.prototype.getCellGeometry = function(cell)
	{
		return this.model.getGeometry(cell);
	};

	/**
	 * Function: getCurrentRoot
	 * 
	 * Returns the current root of the displayed cell hierarchy. This is a
	 * shortcut to <mxGraphView.currentRoot> in <view>.
	 */
	mxGraph.prototype.getCurrentRoot = function()
	{
		return this.view.currentRoot;
	};
 
	/**
	 * Function: getTranslateForRoot
	 * 
	 * Returns the translation to be used if the given cell is the root cell as
	 * an <mxPoint>. This implementation returns null.
	 * 
	 * Example:
	 * 
	 * To keep the children at their absolute position while drilling, this function
	 * can be overridden as follows.
	 * 
	 * (code)
	 * var offset = new mxPoint(0, 0);
	 * 
	 * while (cell != null)
	 * {
	 *   var geo = this.model.getGeometry(cell);
	 * 
	 *   if (geo != null)
	 *   {
	 *     offset.x -= geo.x;
	 *     offset.y -= geo.y;
	 *   }
	 * 
	 *   cell = this.model.getParent(cell);
	 * }
	 * 
	 * return offset;
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the root.
	 */
	mxGraph.prototype.getTranslateForRoot = function(cell)
	{
		return null;
	};

	/**
	 * Function: getChildOffsetForCell
	 * 
	 * Returns the offset to be used for the cells inside the given cell. The
	 * root and layer cells may be identified using <mxGraphModel.isRoot> and
	 * <mxGraphModel.isLayer>. For all other current roots, the
	 * <mxGraphView.currentRoot> field points to the respective cell, so that
	 * the following holds: cell == this.view.currentRoot. This implementation
	 * returns null.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose offset should be returned.
	 */
	mxGraph.prototype.getChildOffsetForCell = function(cell)
	{
		return null;
	};

	/**
	 * Function: enterGroup
	 * 
	 * Uses the given cell as the root of the displayed cell hierarchy. If no
	 * cell is specified then the selection cell is used. The cell is only used
	 * if <isValidRoot> returns true.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> to be used as the new root. Default is the
	 * selection cell.
	 */
	mxGraph.prototype.enterGroup = function(cell)
	{
		cell = cell || this.getSelectionCell();
		
		if (cell != null &&
			this.isValidRoot(cell))
		{
			this.view.setCurrentRoot(cell);
			this.clearSelection();
		}
	};

	/**
	 * Function: exitGroup
	 * 
	 * Changes the current root to the next valid root in the displayed cell
	 * hierarchy.
	 */
	mxGraph.prototype.exitGroup = function()
	{
		var root = this.model.getRoot();
		var current = this.getCurrentRoot();
		
		if (current != null)
		{
			var next = this.model.getParent(current);
			
			// Finds the next valid root in the hierarchy
			while (next != root &&
					!this.isValidRoot(next) &&
					this.model.getParent(next) != root)
			{
				next = this.model.getParent(next);
			}
			
			// Clears the current root if the new root is
			// the model's root or one of the layers.
			if (next == root ||
				this.model.getParent(next) == root)
			{
				this.view.setCurrentRoot(null);
			}
			else
			{
				this.view.setCurrentRoot(next);
			}
			
			var state = this.view.getState(current);
			
			// Selects the previous root in the graph
			if (state != null)
			{
				this.setSelectionCell(current);
			}
		}
	};

	/**
	 * Function: home
	 * 
	 * Uses the root of the model as the root of the displayed cell hierarchy
	 * and selects the previous root.
	 */
	mxGraph.prototype.home = function()
	{
		var current = this.getCurrentRoot();
		
		if (current != null)
		{
			this.view.setCurrentRoot(null);
			var state = this.view.getState(current);
			
			if (state != null)
			{
				this.setSelectionCell(current);
			}
		}
	};
	
	/**
	 * Function: isValidRoot
	 * 
	 * Returns true if the given cell is a valid root for the cell display
	 * hierarchy. This implementation returns true for all non-null values.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> which should be checked as a possible root.
	 */
	mxGraph.prototype.isValidRoot = function(cell)
	{
		return (cell != null);
	};
	
	/**
	 * Group: Grouping
	 */
	
	/**
	 * Function: group
	 * 
	 * Puts the selection cells into the given group using border around the
	 * children and the group bounds. Only the selection cells that have the
	 * same parent as the first selection cell are added to the group. If no
	 * group is specified then a new vertex <mxCell> is created with an empty
	 * string user object. Finally, the group is selected and returned.
	 * 
	 * Parameters:
	 * 
	 * group - <mxCell> that represents the target group.
	 * border - Optional integer that specifies the border between the child
	 * area and the group bounds.
	 * tmp - Optional array of cells to be grouped.
	 */
	mxGraph.prototype.group = function(group, border, tmp)
	{
		tmp = tmp || this.getSelectionCells();
		
		// Checks if more than one cell is selected
		if (tmp != null &&
			tmp.length > 1)
		{
			var parent = this.model.getParent(tmp[0]);
			var cells = new Array();
			cells.push(tmp[0]);
			
			// Filters selection cells with the same parent
			for (var i = 1; i < tmp.length; i++)
			{
				if (this.model.getParent(tmp[i]) == parent)
				{
					cells.push(tmp[i]);
				}
			}
			
			// Checks if more than 1 selection cells have the same parent
			if (cells.length > 1)
			{
				group = group || this.createGroupCell(cells);
				group = this.addGroup(group, cells, border);
				
				// Selects the group cell
				if (group != null)
				{
					this.setSelectionCell(group);
				}
			}
		}
		
		return group;
	};
	
	/**
	 * Function: createGroupCell
	 * 
	 * Hook for creating the group cell to hold the given array of <mxCells> if
	 * no group cell was given to the <group> function.
	 */
	mxGraph.prototype.createGroupCell = function(cells)
	{
		var group = new mxCell('');
		group.setVertex(true);
		group.setConnectable(false);
		
		return group;
	};

	/**
	 * Function: ungroup
	 * 
	 * Ungroups the given group cells and selects the children.
	 * 
	 * Parameters:
	 * 
	 * cells - Optional array of <mxCells> to be ungrouped. Default is the
	 * selection cells.
	 */
	mxGraph.prototype.ungroup = function(cells)
	{
		cells = cells || this.getSelectionCells();
		
		if (cells != null)
		{
			this.clearSelection();
			
			this.model.beginUpdate();
			try
			{
				for (var i = 0; i < cells.length; i++)
				{
					var children = this.model.getChildren(cells[i]);
					
					if (children != null &&
						children.length > 0)
					{
						children = children.slice();
						this.moveInto(children,
							this.model.getParent(cells[i]));
						this.selection.addCells(children);
						this.remove([cells[i]]);
					}
				}
			}
			finally
			{
				this.model.endUpdate();
			}
		}
	};

	/**
	 * Function: addGroup
	 * 
	 * Sets the bounds of the given group to cover the area of the given cells
	 * and adds the given border around the area. If the group is a swimlane,
	 * then the title area is also taken into account. Returns the given group
	 * if the area of the children is not null.
	 * 
	 * Parameters:
	 * 
	 * group - <mxCell> that represents the new parent group.
	 * cells - Array of <mxCells> to be added into the group.
	 * border - Optional border for the group area in pixels. Default is 0.
	 */
	mxGraph.prototype.addGroup = function(group, cells, border)
	{
		border = (border != null) ? border : 0;
		
		var parent = this.model.getParent(cells[0]);
		var pstate = this.view.getState(parent);
		var bounds = this.view.getBounds(cells);
		
		if (bounds != null)
		{
			var scale = this.view.scale;
			var translate = this.view.translate;
			
			var x = bounds.x - pstate.origin.x * scale;
			var y = bounds.y - pstate.origin.y * scale;
			var width = bounds.width;
			var height = bounds.height;
			
			// Adds the startsize to the dimension
			if (this.isSwimlane(group))
			{
				var size = this.getStartSize(group);
				
				x -= size.width;
				width += size.width;
				y -= size.height;
				height += size.height;
			}
			
			var geo = new mxGeometry(
				x / scale - border - translate.x,
				y / scale - border - translate.y,
				width/scale + 2 * border,
				height/scale + 2 * border);
		
			this.model.beginUpdate();
			try
			{
				group = this.groupCells(parent, group, cells, -geo.x, -geo.y);
				
				if (group != null)
				{
					this.model.setGeometry(group, geo);
				}
			}
			finally
			{
				this.model.endUpdate();
			}
			
			return group;
		}
		
		return null;
	};

	/**
	 * Function: groupCells
	 * 
	 * Adds the group into the given parent and the given cells into the group.
	 * The cells are translated by (dx, dy) before being added into the group.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> that represents the parent of the group.
	 * group - <mxCell> that represents the group to be added.
	 * cells - Array of <mxCells> to be translated and added into the group.
	 * dx - X-coordinate of the translation to be applied.
	 * dy - Y-coordinate of the translation to be applied.
	 */
	mxGraph.prototype.groupCells = function(parent, group, cells, dx, dy)
	{
		this.model.beginUpdate();
		try
		{
			var index = this.model.getChildCount(parent);
			group = this.model.add(parent, group, index);
			
			if (group != null)
			{
				for (var i = 0; i < cells.length; i++)
				{
					if (this.model.getParent(cells[i]) != group)
					{
						index = this.model.getChildCount(group);
						this.model.add(group, cells[i], index);
					}
					
					var geometry = this.model.getGeometry(cells[i]);
					
					if (geometry != null)
					{
						geometry = geometry.translate(dx, dy);
						this.model.setGeometry(cells[i], geometry);
					}
				}
			}
		}
		finally
		{
			this.model.endUpdate();
		}
		
		return group;
	};

	/**
	 * Group: Automatic layout
	 */
	
	/**
	 * Function: getLayout
	 * 
	 * Returns the layout to be used to arrange the children of the given cell.
	 * The default implementation of this function is empty. It may be
	 * overridden to specify a layout to be executed for the children of the
	 * given cell after a child has been added, removed, collapsed, expanded,
	 * moved or (dis)connected, or after the parent has been resized. The
	 * layout is only executed if <isAutoLayout> returns true for a given cell.
	 * 
	 * Example:
	 * 
	 * (code)
	 * var layout = new mxFastOrganicLayout(graph);
	 * graph.getLayout = function(cell)
	 * {
	 *   return layout;
	 * };
	 * (end)
	 * 
	 * Note that you must also set <autoLayout> to true for the above to work.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose children are to be arranged.
	 */
	mxGraph.prototype.getLayout = function(cell)
	{
		return null;
	};

	/**
	 * Function: isBubbleLayout
	 * 
	 * Returns true if a layout should bubble, that is, if the parent layout
	 * should be executed whenever a cell layout (layout of the children of
	 * a cell) has been executed. This implementation returns <bubbeLayout>.
	 */
	mxGraph.prototype.isBubbleLayout = function()
	{
		return this.bubbleLayout;
	};

	/**
	 * Function: isBubbleLayout
	 * 
	 * Returns true if a layout should bubble, that is, if the parent layout
	 * should be executed whenever a cell layout (layout of the children of
	 * a cell) has been executed. This implementation returns <bubbeLayout>.
	 */
	mxGraph.prototype.setBubbleLayout = function(bubbleLayout)
	{
		this.bubbleLayout = bubbleLayout;
	};

	/**
	 * Function: isAutoLayout
	 * 
	 * Returns true if the associated layout for the given cell should be
	 * executed automatically whenever a child was changed.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the layout should be executed automatically.
	 */
	mxGraph.prototype.isAutoLayout = function(cell)
	{
		return this.autoLayout;
	};

	/**
	 * Function: getParents
	 * 
	 * Returns an array that represents the set (no duplicates) of all parents
	 * for the given array of <mxCells>.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> whose parents should be returned.
	 */
	mxGraph.prototype.getParents = function(cells)
	{
		var parents = new Array();
		
		if (cells != null)
		{
			var hash = new Array();
			
			for (var i = 0; i < cells.length; i++)
			{
				var parent = this.model.getParent(cells[i]);
				
				if (parent != null)
				{
					var id = mxCellPath.create(parent);
					
					if (hash[id] == null)
					{
						hash[id] = parent;
						parents.push(parent);
					}
				}
			}
		}
		
		return parents;
	};

	/**
	 * Function: layout
	 * 
	 * Executes the layout returned by <getLayout> if <isAutoLayout> for each
	 * of the cells in the given array. Fires <beforeLayout>, <layout> and
	 * <afterLayout> events if any layouts are executed.
	 * 
	 * This function is called from <addCells>, <addCell>, <splitEdge>,
	 * <remove>, <resize>, <moveInto> (<move>) and <connect> and
	 * <setCollapsedState> for the parents of the modified cells. The
	 * invocation from resize also contains the modified cells themselfes.
	 * 
	 * Returns the array of <mxCells> for which a layout has been executed.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> for which the layout should be executed.
	 */
	mxGraph.prototype.layout = function(cells)
	{
		var result = new Array();
		
		if (cells != null &&
			cells.length > 0)
		{
			this.dispatchEvent('beforeLayout', this, cells);
	
			// Includes all ancestors in the set of cells
			if (this.isBubbleLayout())
			{
				var tmp = cells;
				
				while (tmp.length > 0)
				{
					cells = cells.concat(tmp);
					tmp = this.getParents(tmp);
				}				
			}
	
			// Sorts the array of cells according to the cell hierarchy
			var comparator = function(a, b)
			{
				var acp = mxCellPath.create(a);
				var bcp = mxCellPath.create(b);
				
				return (acp == bcp) ? 0 : ((acp < bcp) ? 1 : -1);
			};
	
			cells.sort(comparator);
			
			// Invokes the layouts on all cells and removes duplicates
			var last = null;

			this.model.beginUpdate();
			try 
			{
				for (var i = 0; i < cells.length; i++)
				{
					var cell = cells[i];
					
					if (cell != null &&
						cell != last &&
						this.isAutoLayout(cell))
					{
						var layout = this.getLayout(cell);
	
						if (layout != null)
						{
							layout.execute(cell);
							result.push(cell);
						}
					}
					
					last = cell;
				}
				
				this.dispatchEvent('layout', this, result);
			}
			finally
			{
				this.model.endUpdate();
			}
	
			this.dispatchEvent('afterLayout', this, result);
		}
		
		return result;
	};

	/**
	 * Group: Validation
	 */
	
	/**
	 * Function: validationAlert
	 * 
	 * Displays the given validation error in a dialog. This implementation uses
	 * mxUtils.alert.
	 */
	mxGraph.prototype.validationAlert = function(message)
	{
		mxUtils.alert(message);
	};

	/**
	 * Function: isEdgeValid
	 * 
	 * Checks if the return value of <getEdgeValidationError> for the given
	 * arguments is null.
	 *  
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge to validate.
	 * source - <mxCell> that represents the source terminal.
	 * target - <mxCell> that represents the target terminal.
	 */
	mxGraph.prototype.isEdgeValid = function(edge, source, target)
	{
		return this.getEdgeValidationError(edge, source, target) == null;
	};

	/**
	 * Function: getEdgeValidationError
	 * 
	 * Returns the validation error message to be displayed when inserting or
	 * changing an edges' connectivity. A return value of null means the edge
	 * is valid, a return value of '' means it's not valid, but do not display
	 * an error message. Any other (non-empty) string returned from this method
	 * is displayed as an error message when trying to connect an edge to a
	 * source and target. This implementation uses the <multiplicities>, as
	 * well as <multigraph> and <allowDanglingEdges> to generate validation
	 * errors.
	 * 
	 * For extending this method with specific checks for source/target cells,
	 * the method can be extended as follows. Returning an empty string means
	 * the edge is invalid with no error message, a non-null string specifies
	 * the error message, and null means the edge is valid.
	 * 
	 * (code)
	 * graph.getEdgeValidationError = function(edge, source, target)
	 * {
	 *   if (source != null && target != null &&
	 *     this.model.getValue(source) != null &&
	 *     this.model.getValue(target) != null)
	 *   {
	 *     if (target is not valid for source)
	 *     {
	 *       return 'Invalid Target';
	 *     }
	 *   }
	 *   
	 *   // "Supercall"
	 *   return mxGraph.prototype.getEdgeValidationError.apply(this, arguments);
	 * }
	 * (end)
	 *  
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge to validate.
	 * source - <mxCell> that represents the source terminal.
	 * target - <mxCell> that represents the target terminal.
	 */
	mxGraph.prototype.getEdgeValidationError = function(edge, source, target)
	{
		if (edge != null &&
			this.model.getTerminal(edge, true) == null &&
			this.model.getTerminal(edge, false) == null)	
		{
			return null;
		}
		
		// Checks if we're dealing with a loop
		if (!this.allowLoops &&
			source == target &&
			source != null)
		{
			return '';
		}
		
		// Checks if the connection is generally allowed
		if (!this.isValidConnection(source, target))
		{
			return '';
		}

		if (source != null &&
			target != null)
		{
			var error = '';

			// Checks if the cells are already connected
			// and adds an error message if required			
			if (!this.multigraph)
			{
				var tmp = this.model.getEdgesBetween(source, target, true);
				
				// Checks if the source and target are not connected by another edge
				if (tmp.length > 1 || (tmp.length == 1 && tmp[0] != edge))
				{
					error += (mxResources.get(this.alreadyConnectedResource) ||
						this.alreadyConnectedResource)+'\n';
				}
			}

			// Gets the number of outgoing edges from the source
			// and the number of incoming edges from the target
			// without counting the edge being currently changed.
			var sourceOut = this.model.getDirectedEdgeCount(source, true, edge);
			var targetIn = this.model.getDirectedEdgeCount(target, false, edge);

			// Checks the change against each multiplicity rule
			for (var i = 0; i < this.multiplicities.length; i++)
			{
				var err = this.multiplicities[i].check(this, edge, source,
					target, sourceOut, targetIn);
				
				if (err != null)
				{
					error += err;
				}
			}

			// Validates the source and target terminals independently
			var err = this.validateEdge(edge, source, target);
			
			if (err != null)
			{
				error += err;
			}
			
			return (error.length > 0) ? error : null;
		}
		
		return (this.allowDanglingEdges) ? null : '';
	};

	/**
	 * Function: validateEdge
	 * 
	 * Hook method for subclassers to return an error message for the given
	 * edge and terminals. This implementation returns null.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge to validate.
	 * source - <mxCell> that represents the source terminal.
	 * target - <mxCell> that represents the target terminal.
	 */
	mxGraph.prototype.validateEdge = function(edge, source, target)
	{
		return null;
	};

	/**
	 * Function: validate
	 * 
	 * Validates the graph by validating each descendant of the given cell or
	 * the root of the model. Context is an object that contains the validation
	 * state for the complete validation run. The validation errors are
	 * attached to their cells using <setWarning>. This function returns true
	 * if no validation errors exist in the graph.
	 * 
	 * Paramters:
	 * 
	 * cell - <mxCell> to start the validation recursion.
	 * context - Object that represents the global validation state.
	 */
	mxGraph.prototype.validate = function(cell, context)
	{
		cell = (cell != null) ? cell : this.model.getRoot();
		context = (context != null) ? context : new Object();
		
		var isValid = true;
		var childCount = this.model.getChildCount(cell);
		
		for (var i = 0; i < childCount; i++)
		{
			var tmp = this.model.getChildAt(cell, i);
			var ctx = context;
			
			if (this.isValidRoot(tmp))
			{
				ctx = new Object();
			}
			
			var warn = this.validate(tmp, ctx);
			
			if (warn != null)
			{
				var html = warn.replace(/\n/g, '<br>');
				var len = html.length;
				this.setWarning(tmp,
				html.substring(0, Math.max(0, len-4)));
			}
			else
			{
				this.setWarning(tmp, null);
			}
			
			isValid = isValid && warn == null;
		}
		
		var warning = '';
		
		// Adds error for invalid children if collapsed (children invisible)
		if (this.isCellCollapsed(cell) && !isValid)
		{
			warning += (mxResources.get(this.containsValidationErrorsResource) ||
				this.containsValidationErrorsResource)+'\n';
		}
		
		// Checks edges and cells using the defined multiplicities
		if (this.model.isEdge(cell))
		{
			warning += this.getEdgeValidationError(cell,
			this.model.getTerminal(cell, true),
			this.model.getTerminal(cell, false)) || '';
		}
		else
		{
			warning += this.getCellValidationError(cell) || '';
		}
		
		// Checks custom validation rules
		var err = this.validateCell(cell, context);
		
		if (err != null)
		{
			warning += err;
		}
		
		// Updates the display with the warning icons
		// before any potential alerts are displayed.
		// TODO: Move this into addOverlay. redraw
		// should check if overlay was added or removed.
		if (this.model.getParent(cell) == null)
		{
			this.view.validate();
		}
		
		return (warning.length > 0 || !isValid) ? warning : null;
	};

	/**
	 * Function: getCellValidationError
	 * 
	 * Checks all <multiplicities> that cannot be enforced while the graph is
	 * being modified, namely, all multiplicities that require a minimum of
	 * 1 edge.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the multiplicities should be checked.
	 */
	mxGraph.prototype.getCellValidationError = function(cell)
	{
		var outCount = this.model.getDirectedEdgeCount(cell, true);
		var inCount = this.model.getDirectedEdgeCount(cell, false);
		var value = this.model.getValue(cell);
		var error = '';

		for (var i = 0; i < this.multiplicities.length; i++)
		{
			var rule = this.multiplicities[i];
			
			if (rule.source && mxUtils.isNode(value, rule.type,
				rule.attr, rule.value) &&
				((rule.max == 0 && outCount > 0) ||
				(rule.min == 1 && outCount == 0) ||
				(rule.max == 1 && outCount > 1)))
			{
				error += rule.countError + '\n';
			}
			else if (!rule.source && mxUtils.isNode(cell, type,
					rule.attr, rule.value) &&
					((rule.max == 0 && inCount > 0) ||
					(rule.min == 1 && inCount == 0) ||
					(rule.max == 1 && inCount > 1)))	
			{
				error += rule.countError + '\n';
			}
		}
		
		return (error.length > 0) ? error : null;
	};

	/**
	 * Function: validateEdge
	 * 
	 * Hook method for subclassers to return an error message for the given
	 * cell and validation context. This implementation returns null.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the cell to validate.
	 * context - Object that represents the global validation state.
	 */
	mxGraph.prototype.validateCell = function(cell, context)
	{
		return null;
	};

	/**
	 * Group: Graph appearance
	 */

	/**
	 * Function: getBackgroundImage
	 * 
	 * Returns the <backgroundImage> as an <mxImage>.
	 */
	mxGraph.prototype.getBackgroundImage = function()
	{
		return this.backgroundImage;
	};

	/**
	 * Function: setBackgroundImage
	 * 
	 * Sets the new <backgroundImage>.
	 * 
	 * Parameters:
	 * 
	 * image - New <mxImage> to be used for the background.
	 */
	mxGraph.prototype.setBackgroundImage = function(image)
	{
		this.backgroundImage = image;
	};

	/**
	 * Function: getFoldingImage
	 * 
	 * Returns the <mxImage> used to display the collapsed state of
	 * the specified cell state.
	 */
	mxGraph.prototype.getFoldingImage = function(state)
	{
		if (state != null)
		{
			var tmp = this.isCellCollapsed(state.cell);
			
			if ((tmp && this.isExpandable(state.cell)) ||
				(!tmp && this.isCollapsable(state.cell)))
			{
				return (tmp) ? this.collapsedImage : this.expandedImage;
			}
		}
		
		return null;
	};

	/**
	 * Function: convertValueToString
	 * 
	 * Returns the textual representation for the given cell. This
	 * implementation returns the nodename or string-representation of the user
	 * object.
	 *
	 * Example:
	 * 
	 * The following returns the label attribute from the cells user
	 * object if it is an XML node.
	 * 
	 * (code)
	 * graph.convertValueToString = function(cell)
	 * {
	 * 	return cell.getAttribute('label');
	 * }
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose textual representation should be returned.
	 */
	mxGraph.prototype.convertValueToString = function(cell)
	{
		var value = this.model.getValue(cell);
		
		if (value != null)
		{
			if (mxUtils.isNode(value))
			{
				return value.nodeName;
			}
			else if (typeof(value.toString) == 'function')
			{
				return value.toString();
			}
		}
		
		return '';
	};

	/**
	 * Function: getLabel
	 * 
	 * Returns a string or DOM node that represents the label for the given
	 * cell. This implementation uses <convertValueToString> if <labelsVisible>
	 * is true. Otherwise it returns an empty string.
	 * 
	 * To truncate label to match the size of the cell, the following code
	 * can be used.
	 * 
	 * (code)
	 * graph.getLabel = function(cell)
	 * {
	 *   var label = mxGraph.prototype.getLabel.apply(this, arguments);
	 * 
	 *   if (label != null && this.model.isVertex(cell))
	 *   {
	 *     var geo = this.getCellGeometry(cell);
	 * 
	 *     if (geo != null)
	 *     {
	 *       var max = parseInt(geo.width / 8);
	 * 
	 *       if (label.length > max)
	 *       {
	 *         label = label.substring(0, max)+'...';
	 *       }
	 *     }
	 *   } 
	 *   return mxUtils.htmlEntities(label);
	 * }
	 * (end)
	 * 
	 * A resize listener is needed in the graph to force a repaint of the label
	 * after a resize.
	 * 
	 * (code)
	 * graph.addListener('resize', function(sender, cells)
	 * {
	 *   for (var i=0; i<cells.length; i++)
	 *   {
	 *     this.view.removeState(cells[i]);
	 *   }
	 * });
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose label should be returned.
	 */
	mxGraph.prototype.getLabel = function(cell)
	{
		var result = '';
		var style = this.getCellStyle(cell);
		
		if (cell != null &&
			this.labelsVisible &&
			!mxUtils.getValue(style, mxConstants.STYLE_NOLABEL, false))
		{
			result = this.convertValueToString(cell);
		}
		
		return result;
	};

	/**
	 * Function isHtmlLabel
	 * 
	 * Returns true if the label must be rendered as HTML markup. The default
	 * implementation returns <htmlLabels>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose label should be displayed as HTML markup.
	 */
	 mxGraph.prototype.isHtmlLabel = function(cell)
	 {
	 	return this.htmlLabels;
	 };

	/**
	 * Function: isWrapping
	 * 
	 * Returns true if no white-space CSS style directive should be used for
	 * displaying the given cells label. This implementation always returns
	 * false.
	 * 
	 * This is used as a workaround for IE ignoring the white-space directive
	 * of child elements if the directive appears in a parent element. It
	 * should be overridden to return true if a white-space directive is used
	 * in the HTML markup that represents the given cells label. In order for
	 * HTML markup to work in labels, <isHtmlLabel> must also return true
	 * for the given cell.
	 * 
	 * Example:
	 * 
	 * (code)
	 * graph.getLabel = function(cell)
	 * {
	 *   var tmp = mxGraph.prototype.getLabel.apply(this, arguments); // "supercall"
	 *   if (this.model.isEdge(cell))
	 *   {
	 *     tmp = '<div style="width: 150px; white-space:normal;">'+tmp+'</div>';
	 *   }
	 *   return tmp;
	 * }
	 * 
	 * graph.isWrapping = function(cell)
	 * {
	 * 	 return this.model.isEdge(cell);
	 * }
	 * (end)
	 * 
	 * Makes sure no edge label is wider than 150 pixels, otherwise the content
	 * is wrapped. Note: No width must be specified for wrapped vertex label as
	 * the vertex defines the width in its geometry.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose label should be wrapped.
	 */
	 mxGraph.prototype.isWrapping = function(cell)
	 {
	 	return false;
	 };

	/**
	 * Function: isClipping
	 * 
	 * Returns true if the overflow portion of HTML labels should be hidden.
	 * If this is true then the HTML labels will be clipped to the size of the
	 * vertices.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose label should be clipped.
	 */
	 mxGraph.prototype.isClipping = function(cell)
	 {
	 	return false;
	 };
	 
	/**
	 * Function: getTooltip
	 * 
	 * Returns the string or DOM node that represents the tooltip for the given
	 * cell and index. The tooltip for the index is returned first. If no index
	 * is specified, then the tooltip for the given cell is returned using
	 * <getTooltipForCell>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose tooltip should be returned.
	 * index - Optional object under the mouse pointer.
	 */
	mxGraph.prototype.getTooltip = function(cell, index)
	{
		var tip = null;
		
		if (index != null)
		{
			if (parseInt(index) != index)
			{
				tip = index.toString();
			}
		}
		else
		{
			tip = this.getTooltipForCell(cell);
		}
		
		return tip;
	};

	/**
	 * Function: getTooltipForCell
	 * 
	 * Returns the string or DOM node to be used as the tooltip for the given
	 * cell. This implementation uses the cells getTooltip function if it
	 * exists, or else it returns <convertValueToString> for the cell.
	 * 
	 * Example:
	 * 
	 * (code)
	 * graph.getTooltipForCell = function(cell)
	 * {
	 *   return 'Hello, World!';
	 * }
	 * (end)
	 * 
	 * Replaces all tooltips with the string Hello, World!
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose tooltip should be returned.
	 */
	mxGraph.prototype.getTooltipForCell = function(cell)
	{
		var tip = null;
		
		if (cell.getTooltip != null)
		{
			tip = cell.getTooltip();
		}
		else
		{
			tip = this.convertValueToString(cell);
		}
		
		return tip;
	};

	/**
	 * Function: getCursorForCell
	 * 
	 * Returns the cursor value to be used for the CSS of the shape for the
	 * given cell. This implementation returns null.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose cursor should be returned.
	 */
	mxGraph.prototype.getCursorForCell = function(cell)
	{
		return null;
	};

	/**
	 * Function: getStartSize
	 * 
	 * Returns the start size of the given swimlane, that is, the width or
	 * height of the part that contains the title, depending on the
	 * horizontal style. The return value is an <mxRectangle> with either
	 * width or height set as appropriate.
	 * 
	 * Parameters:
	 * 
	 * swimlane - <mxCell> whose start size should be returned.
	 */
	mxGraph.prototype.getStartSize = function(swimlane)
	{
		var result = new mxRectangle();
		var style = this.getCellStyle(swimlane);
		
		if (style != null)
		{
			var size = parseInt(style[mxConstants.STYLE_STARTSIZE]) || 0;
			
			if (mxUtils.getValue(style, mxConstants.STYLE_HORIZONTAL, true))
			{
				result.height = size;
			}
			else
			{
				result.width = size;
			}
		}
		
		return result;
	};

	/**
	 * Function: getImage
	 * 
	 * Returns the image URL for the given cell state. This implementation
	 * returns the value stored under <mxConstants.STYLE_IMAGE> in the cell
	 * style.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose image URL should be returned.
	 */
	mxGraph.prototype.getImage = function(state)
	{
		return (state != null && state.style != null) ?
			state.style[mxConstants.STYLE_IMAGE] : null;
	};

	/**
	 * Function: getVerticalAlign
	 * 
	 * Returns the vertical alignment for the given cell state. This
	 * implementation returns the value stored under
	 * <mxConstants.STYLE_VERTICAL_ALIGN> in the cell style.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose vertical alignment should be
	 * returned.
	 */
	mxGraph.prototype.getVerticalAlign = function(state)
	{
		return (state != null && state.style != null) ?
			state.style[mxConstants.STYLE_VERTICAL_ALIGN] :
			null;
	};

	/**
	 * Function: getIndicatorColor
	 * 
	 * Returns the indicator color for the given cell state. This
	 * implementation returns the value stored under
	 * <mxConstants.STYLE_INDICATOR_COLOR> in the cell style.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose indicator color should be
	 * returned.
	 */
	mxGraph.prototype.getIndicatorColor = function(state)
	{
		return (state != null && state.style != null) ?
			state.style[mxConstants.STYLE_INDICATOR_COLOR] : null;
	};

	/**
	 * Function: getIndicatorGradientColor
	 * 
	 * Returns the indicator gradient color for the given cell state. This
	 * implementation returns the value stored under
	 * <mxConstants.STYLE_INDICATOR_GRADIENTCOLOR> in the cell style.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose indicator gradient color should be
	 * returned.
	 */
	mxGraph.prototype.getIndicatorGradientColor = function(state)
	{
		return (state != null && state.style != null) ?
			state.style[mxConstants.STYLE_INDICATOR_GRADIENTCOLOR] : null;
	};

	/**
	 * Function: getIndicatorShape
	 * 
	 * Returns the indicator shape for the given cell state. This
	 * implementation returns the value stored under
	 * <mxConstants.STYLE_INDICATOR_SHAPE> in the cell style.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose indicator shape should be returned.
	 */
	mxGraph.prototype.getIndicatorShape = function(state)
	{
		return (state != null && state.style != null) ?
			state.style[mxConstants.STYLE_INDICATOR_SHAPE] : null;
	};

	/**
	 * Function: getIndicatorImage
	 * 
	 * Returns the indicator image for the given cell state. This
	 * implementation returns the value stored under
	 * <mxConstants.STYLE_INDICATOR_IMAGE> in the cell style.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> whose indicator image should be returned.
	 */
	mxGraph.prototype.getIndicatorImage = function(state)
	{
		return (state != null && state.style != null) ?
			state.style[mxConstants.STYLE_INDICATOR_IMAGE] : null;
	};

	/**
	 * Function: getBorder
	 * 
	 * Returns the value of <border>.
	 */
	mxGraph.prototype.getBorder = function()
	{
		return this.border;
	};

	/**
	 * Function: setBorder
	 * 
	 * Sets the value of <border>.
	 * 
	 * Parameters:
	 * 
	 * border - Positive integer that represents the border to be used.
	 */
	mxGraph.prototype.setBorder = function(border)
	{
		this.border = border;
	};

	/**
	 * Function: isSwimlane
	 * 
	 * Returns true if the given cell is a swimlane in the graph. A swimlane is
	 * a container cell with some specific behaviour. This implementation
	 * checks if the shape associated with the given cell is a <mxSwimlane>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to be checked.
	 */
	mxGraph.prototype.isSwimlane = function (cell)
	{
		if (cell != null)
		{
			if (this.model.getParent(cell) !=
				this.model.getRoot())
			{
				var state = this.view.getState(cell);
				var style = (state != null) ?
					state.style : this.getCellStyle(cell);
	
				if (style != null &&
					!this.model.isEdge(cell))
				{
					return style[mxConstants.STYLE_SHAPE] ==
						mxConstants.SHAPE_SWIMLANE;
				}
			}
		}
		
		return false;
	};

	/**
	 * Group: Graph behaviour
	 */

	/**
	 * Function: isResizeContainer
	 * 
	 * Returns <resizeContainer>.
	 */
	mxGraph.prototype.isResizeContainer = function()
	{
		return this.resizeContainer;
	};

	/**
	 * Function: setResizeContainer
	 * 
	 * Sets <resizeContainer>.
	 * 
	 * Parameters:
	 * 
	 * resizeContainer - Boolean indicating if the container should be resized.
	 */
	mxGraph.prototype.setResizeContainer = function(resizeContainer)
	{
		this.resizeContainer = resizeContainer;
	};

	/**
	 * Function: isEnabled
	 * 
	 * Returns true if the graph is <enabled>.
	 */
	mxGraph.prototype.isEnabled = function()
	{
		return this.enabled;
	};

	/**
	 * Function: setEnabled
	 * 
	 * Specifies if the graph should allow any interactions. This
	 * implementation updates <enabled>.
	 * 
	 * Parameters:
	 * 
	 * enabled - Boolean indicating if the graph should be enabled.
	 */
	mxGraph.prototype.setEnabled = function(enabled)
	{
		this.enabled = enabled;
	};

	/**
	 * Function: isLocked
	 * 
	 * Returns true if the given cell may not be moved, sized, bended,
	 * disconnected, edited or selected. This implementation returns true for
	 * all vertices with a relative geometry if <locked> is false.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose locked state should be returned.
	 */
	mxGraph.prototype.isLocked = function(cell)
	{
		var geometry = this.model.getGeometry(cell);
		
		return this.locked ||
				(geometry != null &&
				this.model.isVertex(cell) &&
				geometry.relative);
	};
	
	/**
	 * Function: setLocked
	 * 
	 * Sets if any cell may be moved, sized, bended, disconnected, edited or
	 * selected.
	 * 
	 * Parameters:
	 * 
	 * locked - Boolean that defines the new value for <locked>.
	 */
	mxGraph.prototype.setLocked = function(locked)
	{
		this.locked = locked;
	};

	/**
	 * Function: isCellCloneable
	 * 
	 * Returns true if the given cell is cloneable. This implementation returns
	 * <isCloneable> for all cells.
	 * 
	 * Parameters:
	 * 
	 * cell - Optional <mxCell> whose cloneable state should be returned.
	 */
	mxGraph.prototype.isCellCloneable = function(cell)
	{
		return this.isCloneable();
	};

	/**
	 * Function: isCloneable
	 * 
	 * Returns true if the graph is <cloneable>, that is, if it allows cloning
	 * of cells by using control-drag.
	 */
	mxGraph.prototype.isCloneable = function()
	{
		return this.cloneable;
	}

	/**
	 * Function: setCloneable
	 * 
	 * Specifies if the graph should allow cloning of cells by holding down the
	 * control key while cells are being moved. This implementation updates
	 * <cloneable>.
	 * 
	 * Parameters:
	 * 
	 * cloneable - Boolean indicating if the graph should be cloneable.
	 */
	mxGraph.prototype.setCloneable = function(cloneable)
	{
		this.cloneable = cloneable;
	};

	/**
	 * Function: canExport
	 * 
	 * Returns true if the given cell may be exported to the clipboard. If copy
	 * is true then the cell was copied, otherwise it was cut from the graph. This
	 * implementation returns <exportEnabled>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the cell to be exported.
	 */
	mxGraph.prototype.canExport = function(cell)
	{
		return this.exportEnabled;
	};
	
	/**
	 * Function: canImport
	 * 
	 * Returns true if the given cell may be imported from the clipboard.
	 * This implementation returns <importEnabled>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the cell to be imported.
	 */
	mxGraph.prototype.canImport = function(cell)
	{
		return this.importEnabled;
	};

	/**
	 * Function: isSelectable
	 *
	 * Returns true if the given cell is selectable. This implementation
	 * returns <selectable>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose selectable state should be returned.
	 */
	mxGraph.prototype.isSelectable = function(cell)
	{
		return (cell != null) ? this.selectable : false;
	};
		
	/**
	 * Function: isDeletable
	 *
	 * Returns true if the given cell is moveable. This returns <deletable> for
	 * all given cells.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose deletable state should be returned.
	 */
	mxGraph.prototype.isDeletable = function(cell)
	{
		return this.deletable;
	};
		
	/**
	 * Function: setDeletable
	 * 
	 * Specifies if the graph should allow deleting of cells. This implementation
	 * updates <deletable>.
	 * 
	 * Parameters:
	 * 
	 * deletable - Boolean indicating if the graph should allow deletion of cells.
	 */
	mxGraph.prototype.setDeletable = function(deletable)
	{
		this.deletable = deletable;
	};
		
	/**
	 * Function: isLabelMovable
	 *
	 * Returns true if the given edges's label is moveable. This returns
	 * <movable> for all given cells if <isLocked> does not return true
	 * for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose label should be moved.
	 */
	mxGraph.prototype.isLabelMovable = function(cell)
	{
		return !this.isLocked(cell) &&
			((this.model.isEdge(cell) && this.edgeLabelsMovable) ||
			(this.model.isVertex(cell) && this.vertexLabelsMovable));
	};
		
	/**
	 * Function: isMovable
	 *
	 * Returns true if the given cell is moveable. This returns <movable> for
	 * all given cells if <isLocked> does not return true for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose movable state should be returned.
	 */
	mxGraph.prototype.isMovable = function(cell)
	{
		return this.movable && !this.isLocked(cell);
	};
		
	/**
	 * Function: setMovable
	 * 
	 * Specifies if the graph should allow moving of cells. This implementation
	 * updates <movable>.
	 * 
	 * Parameters:
	 * 
	 * movable - Boolean indicating if the graph should allow moving of cells.
	 */
	mxGraph.prototype.setMovable = function(movable)
	{
		this.movable = movable;
	};

	/**
	 * Function: isGridEnabled
	 *
	 * Returns <dropEnabled> as a boolean.
	 */
	mxGraph.prototype.isGridEnabled = function()
	{
		return this.gridEnabled;
	};

	/**
	 * Function: setGridEnabled
	 * 
	 * Specifies if the grid should be enabled.
	 * 
	 * Parameters:
	 * 
	 * gridEnabled - Boolean indicating if the grid shoudl be enabled.
	 */
	mxGraph.prototype.setGridEnabled = function(gridEnabled)
	{
		this.gridEnabled = gridEnabled;
	};
	
	/**
	 * Function: isSwimlaneNesting
	 *
	 * Returns <swimlaneNesting> as a boolean.
	 */
	mxGraph.prototype.isSwimlaneNesting = function()
	{
		return this.swimlaneNesting;
	};

	/**
	 * Function: setSwimlaneNesting
	 * 
	 * Specifies if swimlanes can be nested by drag and drop. This is only
	 * taken into account if dropEnabled is true.
	 * 
	 * Parameters:
	 * 
	 * swimlaneNesting - Boolean indicating if swimlanes can be nested.
	 */
	mxGraph.prototype.setSwimlaneNesting = function(swimlaneNesting)
	{
		this.swimlaneNesting = swimlaneNesting;
	};
	
	/**
	 * Function: isSwimlaneSelectionEnabled
	 *
	 * Returns <swimlaneSelectionEnabled> as a boolean.
	 */
	mxGraph.prototype.isSwimlaneSelectionEnabled = function()
	{
		return this.swimlaneSelectionEnabled;
	};

	/**
	 * Function: setSwimlaneSelectionEnabled
	 * 
	 * Specifies if swimlanes should be selected if the mouse is released
	 * over their content area.
	 * 
	 * Parameters:
	 * 
	 * swimlaneSelectionEnabled - Boolean indicating if swimlanes content areas
	 * should be selected when the mouse is released over them.
	 */
	mxGraph.prototype.setSwimlaneSelectionEnabled = function(swimlaneSelectionEnabled)
	{
		this.swimlaneSelectionEnabled = swimlaneSelectionEnabled;
	};
	
	/**
	 * Function: isMultigraph
	 *
	 * Returns <multigraph> as a boolean.
	 */
	mxGraph.prototype.isMultigraph = function()
	{
		return this.multigraph;
	};

	/**
	 * Function: setMultigraph
	 * 
	 * Specifies if the graph should allow multiple connections between the
	 * same pair of vertices.
	 * 
	 * Parameters:
	 * 
	 * multigraph - Boolean indicating if the graph allows multiple connections
	 * between the same pair of vertices.
	 */
	mxGraph.prototype.setMultigraph = function(multigraph)
	{
		this.multigraph = multigraph;
	};
	
	/**
	 * Function: isAllowLoops
	 *
	 * Returns <allowLoops> as a boolean.
	 */
	mxGraph.prototype.isAllowLoops = function()
	{
		return this.allowLoops;
	};

	/**
	 * Function: setAllowDanglingEdges
	 * 
	 * Specifies if dangling edges are allowed, that is, if edges are allowed
	 * that do not have a source and/or target terminal defined.
	 * 
	 * Parameters:
	 * 
	 * allowDanglingEdges - Boolean indicating if dangling edges are allowed.
	 */
	mxGraph.prototype.setAllowDanglingEdges = function(allowDanglingEdges)
	{
		this.allowDanglingEdges = allowDanglingEdges;
	};
	
	/**
	 * Function: isAllowDanglingEdges
	 *
	 * Returns <allowDanglingEdges> as a boolean.
	 */
	mxGraph.prototype.isAllowDanglingEdges = function()
	{
		return this.allowDanglingEdges;
	};

	/**
	 * Function: setConnectableEdges
	 * 
	 * Specifies if edges should be connectable.
	 * 
	 * Parameters:
	 * 
	 * connectableEdges - Boolean indicating if edges should be connectable.
	 */
	mxGraph.prototype.setConnectableEdges = function(connectableEdges)
	{
		this.connectableEdges = connectableEdges;
	};
	
	/**
	 * Function: isConnectableEdges
	 *
	 * Returns <connectableEdges> as a boolean.
	 */
	mxGraph.prototype.isConnectableEdges = function()
	{
		return this.connectableEdges;
	};

	/**
	 * Function: setCloneInvalidEdges
	 * 
	 * Specifies if edges should be inserted when cloned but not valid wrt.
	 * <getEdgeValidationError>. If false such edges will be silently ignored.
	 * 
	 * Parameters:
	 * 
	 * cloneInvalidEdges - Boolean indicating if cloned invalid edges should be
	 * inserted into the graph or ignored.
	 */
	mxGraph.prototype.setCloneInvalidEdges = function(cloneInvalidEdges)
	{
		this.cloneInvalidEdges = cloneInvalidEdges;
	};
	
	/**
	 * Function: isCloneInvalidEdges
	 *
	 * Returns <cloneInvalidEdges> as a boolean.
	 */
	mxGraph.prototype.isCloneInvalidEdges = function()
	{
		return this.cloneInvalidEdges;
	};

	/**
	 * Function: setAllowLoops
	 * 
	 * Specifies if loops are allowed.
	 * 
	 * Parameters:
	 * 
	 * allowLoops - Boolean indicating if loops are allowed.
	 */
	mxGraph.prototype.setAllowLoops = function(allowLoops)
	{
		this.allowLoops = allowLoops;
	};

	/**
	 * Function: isDisconnectOnMove
	 *
	 * Returns <disconnectOnMove> as a boolean.
	 */
	mxGraph.prototype.isDisconnectOnMove = function()
	{
		return this.disconnectOnMove;
	};

	/**
	 * Function: setDisconnectOnMove
	 * 
	 * Specifies if edges should be disconnected when moved. (Note: Cloned
	 * edges are always disconnected.)
	 * 
	 * Parameters:
	 * 
	 * disconnectOnMove - Boolean indicating if edges should be disconnected
	 * when moved.
	 */
	mxGraph.prototype.setDisconnectOnMove = function(disconnectOnMove)
	{
		this.disconnectOnMove = disconnectOnMove;
	};

	/**
	 * Function: isDropEnabled
	 *
	 * Returns <dropEnabled> as a boolean.
	 */
	mxGraph.prototype.isDropEnabled = function()
	{
		return this.dropEnabled;
	};

	/**
	 * Function: setDropEnabled
	 * 
	 * Specifies if the graph should allow dropping of cells onto or into other
	 * cells.
	 * 
	 * Parameters:
	 * 
	 * dropEnabled - Boolean indicating if the graph should allow dropping
	 * of cells into other cells.
	 */
	mxGraph.prototype.setDropEnabled = function(dropEnabled)
	{
		this.dropEnabled = dropEnabled;
	};
	
	/**
	 * Function: isSizable
	 *
	 * Returns true if the given cell is sizeable. This returns <sizable> for
	 * all given cells if <isLocked> does not return true for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose sizable state should be returned.
	 */
	mxGraph.prototype.isSizable = function(cell)
	{
		return this.sizable && !this.isLocked(cell);
	};

	/**
	 * Function: setSizable
	 * 
	 * Specifies if the graph should allow resizing of cells. This
	 * implementation updates <sizable>.
	 * 
	 * Parameters:
	 * 
	 * sizable - Boolean indicating if the graph should allow resizing of
	 * cells.
	 */
	mxGraph.prototype.setSizable = function(sizable)
	{
		this.sizable = sizable;
	};
	
	/**
	 * Function: isBendable
	 *
	 * Returns true if the given cell is bendable. This returns <bendable> for
	 * all given cells if <isLocked> does not return true for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose bendable state should be returned.
	 */
	mxGraph.prototype.isBendable = function(cell)
	{
		return this.bendable && !this.isLocked(cell);
	}
	
	/**
	 * Function: setBendable
	 * 
	 * Specifies if the graph should allow bending of edges. This
	 * implementation updates <bendable>.
	 * 
	 * Parameters:
	 * 
	 * bendable - Boolean indicating if the graph should allow bending of
	 * edges.
	 */
	mxGraph.prototype.setBendable = function(bendable)
	{
		this.bendable = bendable;
	};
	
	/**
	 * Function: isDisconnectable
	 *
	 * Returns true if the given cell is disconnectable from the source or
	 * target terminal. This returns <disconnectable> for all given cells if
	 * <isLocked> does not return true for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose disconnectable state should be returned.
	 * terminal - <mxCell> that represents the source or target terminal.
	 * source - Boolean indicating if the source or target terminal is to be
	 * disconnected.
	 */
	mxGraph.prototype.isDisconnectable = function(cell, terminal, source)
	{
		return this.disconnectable && !this.isLocked(cell);
	}
	
	/**
	 * Function: setBendable
	 * 
	 * Specifies if the graph should allow disconnecting of edges. This
	 * implementation updates <disconnectable>.
	 * 
	 * Parameters:
	 * 
	 * disconnectable - Boolean indicating if the graph should allow disconnecting of
	 * edges.
	 */
	mxGraph.prototype.setDisconnectable = function(disconnectable)
	{
		this.disconnectable = disconnectable;
	};
	
	/**
	 * Function: isEditable
	 *
	 * Returns true if the given cell is editable. This returns <editable> for
	 * all given cells if <isLocked> does not return true for the given cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose editable state should be returned.
	 */
	mxGraph.prototype.isEditable = function(cell)
	{
		return this.editable && !this.isLocked(cell);
	};
	
	/**
	 * Function: setEditable
	 * 
	 * Specifies if the graph should allow in-place editing for cell labels.
	 * This implementation updates <editable>.
	 * 
	 * Parameters:
	 * 
	 * editable - Boolean indicating if the graph should allow in-place
	 * editing.
	 */
	mxGraph.prototype.setEditable = function(editable)
	{
		this.editable = editable;
	};
		
	/**
	 * Function: isValidSource
	 * 
	 * Returns true if the given cell is a valid source for new connections.
	 * This implementation returns true for all non-null values and is
	 * called by is called by <isValidConnection>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents a possible source or null.
	 */
	mxGraph.prototype.isValidSource = function(cell)
	{
		return (cell == null &&
			this.allowDanglingEdges) ||
			(cell != null &&
			(!this.model.isEdge(cell) ||
			this.connectableEdges) &&
			this.model.isConnectable(cell));
	};
		
	/**
	 * Function: isValidTarget
	 * 
	 * Returns <isValidSource> for the given cell. This is called by
	 * <isValidConnection>.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents a possible target or null.
	 */
	mxGraph.prototype.isValidTarget = function(cell)
	{
		return this.isValidSource(cell);
	};

	/**
	 * Function: isValidConnection
	 * 
	 * Returns true if the given target cell is a valid target for source.
	 * This is a boolean implementation for not allowing connections between
	 * certain pairs of vertices and is called by <getEdgeValidationError>.
	 * This implementation returns true if <isValidSource> returns true for
	 * the source and <isValidTarget> returns true for the target.
	 * 
	 * Parameters:
	 * 
	 * source - <mxCell> that represents the source cell.
	 * target - <mxCell> that represents the target cell.
	 */
	mxGraph.prototype.isValidConnection = function(source, target)
	{
		return this.isValidSource(source) &&
			this.isValidTarget(target);
	};
	
	/**
	 * Function: setConnectable
	 * 
	 * Specifies if the graph should allow new connections. This implementation
	 * updates <mxConnectionHandler.enabled> in <connectionHandler>.
	 * 
	 * Parameters:
	 * 
	 * connectable - Boolean indicating if new connections should be allowed.
	 */
	mxGraph.prototype.setConnectable = function(connectable)
	{
		this.connectionHandler.setEnabled(connectable);
	};
		
	/**
	 * Function: isConnectable
	 * 
	 * Returns true if the <connectionHandler> is enabled.
	 */
	mxGraph.prototype.isConnectable = function(connectable)
	{
		return this.connectionHandler.isEnabled();
	};
	
	/**
	 * Function: setTooltips
	 * 
	 * Specifies if tooltips should be enabled. This implementation updates
	 * <mxTooltipHandler.enabled> in <tooltipHandler>.
	 * 
	 * Parameters:
	 * 
	 * enabled - Boolean indicating if tooltips should be enabled.
	 */
	mxGraph.prototype.setTooltips = function (enabled)
	{
		this.tooltipHandler.setEnabled(enabled);
	};
	
	/**
	 * Function: setPanning
	 * 
	 * Specifies if panning should be enabled. This implementation updates
	 * <mxPanningHandler.panningEnabled> in <panningHandler>.
	 * 
	 * Parameters:
	 * 
	 * enabled - Boolean indicating if panning should be enabled.
	 */
	mxGraph.prototype.setPanning = function(enabled)
	{
		this.panningHandler.panningEnabled = enabled;
	};

	/**
	 * Function: isEditing
	 * 
	 * Returns true if the given cell is currently being edited.
	 *
	 * Parameters:
	 * 
	 * cell - <mxCell> that should be checked.
	 */
	mxGraph.prototype.isEditing = function(cell)
	{
		return this.editor != null && this.editor.isEditing(cell);
	};
		
	/**
	 * Function: setUpdateSize
	 * 
	 * Specifies if cell sizes should be automatically updated after a label
	 * change. This implementation sets <autoSize> to the given parameter.
	 * 
	 * Parameters:
	 * 
	 * updateSize - Boolean indicating if cells should be resized
	 * automatically.
	 */
	mxGraph.prototype.setUpdateSize = function(updateSize)
	{
		this.autoSize = updateSize;
	};
	
	/**
	 * Function: isUpdateSize
	 * 
	 * Returns true if the size of the given cell should automatically be
	 * updated after a change of the label. This implementation returns
	 * <autoSize> for all given cells.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that should be resized.
	 */
	mxGraph.prototype.isUpdateSize = function(cell)
	{
		return this.autoSize;
	};
	
	/**
	 * Function: isKeepInsideParentOnMove
	 * 
	 * Returns true if the given cell should be kept inside the bounds of its
	 * parent according to the rules defined by <getOverlap> and
	 * <isAllowOverlapParent>. This implementation returns
	 * <keepInsideParentOnMove> for all given cells.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that should be kept inside its parents bounds.
	 */
	mxGraph.prototype.isKeepInsideParentOnMove = function(cell)
	{
		return this.keepInsideParentOnMove;
	};

	/**
	 * Function: getOverlap
	 * 
	 * Returns a decimal number representing the amount of the width and height
	 * of the given cell that is allowed to overlap its parent. A value of 0
	 * means all children must stay inside the parent, 1 means the child is
	 * allowed to be placed outside of the parent such that it touches one of
	 * the parents sides. If <isAllowOverlapParent> returns false for the given
	 * cell, then this method returns 0.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the overlap ratio should be returned.
	 */
	mxGraph.prototype.getOverlap = function(cell)
	{
		return (this.isAllowOverlapParent(cell)) ? this.defaultOverlap : 0;
	};
		
	/**
	 * Function: isAllowOverlapParent
	 * 
	 * Returns true if the given cell is allowed to be placed outside of the
	 * parents area.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the child to be checked.
	 */
	mxGraph.prototype.isAllowOverlapParent = function(cell)
	{
		return false;
	};
	
	/**
	 * Function: isShiftable
	 * 
	 * Returns true if the cell requires shifting of all cells beyond the top
	 * right corner after a resize.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to be checked for shifting of neighbors.
	 */
	mxGraph.prototype.isShiftable = function(cell)
	{
		return !this.model.isEdge(cell);
	};
	
	/**
	 * Function: isExpandable
	 * 
	 * Returns true if the given cell is expandable. This implementation
	 * returns true if the cell has at least one child and <foldingEnabled>
	 * is true.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose expandable state should be returned.
	 */
	mxGraph.prototype.isExpandable = function(cell)
	{
		return this.model.getChildCount(cell) > 0;
	};
	
	/**
	 * Function: isCollapsable
	 * 
	 * Returns true if the given cell is collapsable. This implementation calls
	 * <isExpandable> for the given cell and returns the value.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose collapsable state should be returned.
	 */
	mxGraph.prototype.isCollapsable = function(cell)
	{
		return this.isExpandable(cell);
	};
	
	/**
	 * Function: isValidDropTarget
	 *
	 * Returns true if the given cell is a valid drop target for the specified
	 * cells. If the given cell is an edge, then <isSplitDropTarget> is used,
	 * else <isParentDropTarget> is used to compute the return value.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> that represents the possible drop target.
	 * cell - <mxCell> that represents the new terminal.
	 * evt - Mouseevent that triggered the invocation.
	 */
	mxGraph.prototype.isValidDropTarget = function(cell, cells, evt)
	{
		if (this.model.isEdge(cell))
		{
			return cells != null && cells.length == 1 &&
				this.isSplitDropTarget(cell, cells[0], evt);
		}
		else
		{
			return this.isParentDropTarget(cell, cells, evt);
		}
	};

	/**
	 * Function: isSplitDropTarget
	 *
	 * Returns true if the given edge may be splitted into two edges with the
	 * given cell as a new terminal between the two.
	 * 
	 * Parameters:
	 * 
	 * edge - <mxCell> that represents the edge to be splitted.
	 * cell - <mxCell> that represents the new terminal.
	 * evt - Mouseevent that triggered the invocation.
	 */
	mxGraph.prototype.isSplitDropTarget = function(edge, cell, evt)
	{
		if (edge != null)
		{
			var src = this.model.getTerminal(edge, true);
			var trg = this.model.getTerminal(edge, false);
			
			return (!this.model.isAncestor(cell, src) &&
				!this.model.isAncestor(cell, trg));
		}
		
		return false;
	};
	
	/**
	 * Function: isParentDropTarget
	 *
	 * Returns true if the given target is a valid parent for the specified
	 * cells.
	 * 
	 * Parameters:
	 * 
	 * target - <mxCell> that represents the target cell.
	 * cell - <mxCell> that represents the new terminal.
	 * evt - Mouseevent that triggered the invocation.
	 */
	mxGraph.prototype.isParentDropTarget = function(target, cells, evt)
	{
		if (target != null)
		{
			return this.isSwimlane(target) ||
				(this.model.getChildCount(target) > 0 &&
				!this.isCellCollapsed(target));
		}
		
		return false;
	};

	/**
	 * Function: getDropTarget
	 * 
	 * Returns the given cell if it is a drop target for the given cells or the
	 * nearest ancestor that may be used as a drop target for the given cells.
	 * If the given array contains a swimlane and <swimlaneNesting> is false
	 * then this always returns null. If no cell is given, then the bottommost
	 * swimlane at the location of the given event is returned.
	 * 
	 * This function should only be used if <isDropEnabled> returns true.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> which are to be dropped onto the target.
	 * evt - Mouseevent for the drag and drop.
	 * cell - <mxCell> that is under the mousepointer.
	 */
	mxGraph.prototype.getDropTarget = function(cells, evt, cell)
	{
		if (!this.swimlaneNesting)
		{
			for (var i = 0; i < cells.length; i++)
			{
				if (this.isSwimlane(cells[i]))
				{
					return null;
				}
			}
		}

		var pt = mxUtils.convertPoint(this.container,
			evt.clientX, evt.clientY);
		var swimlane = this.getSwimlaneAt(pt.x, pt.y);
		
		if (cell == null)
		{
			cell = swimlane;
		}
		else if (swimlane != null)
		{
			// Checks if the cell is an ancestor of the swimlane
			// under the mouse and uses the swimlane in that case
			var tmp = this.model.getParent(swimlane);
			
			while (tmp != null &&
				this.isSwimlane(tmp) &&
				tmp != cell)
			{
				tmp = this.model.getParent(tmp);
			}
			
			if (tmp == cell)
			{
				cell = swimlane;
			}
		}
		
		while (cell != null &&
			!this.isValidDropTarget(cell, cells, evt) &&
			!this.model.isLayer(cell))
		{
			cell = this.model.getParent(cell);
		}
		
		return (!this.model.isLayer(cell)) ? cell : null;
	};

	/**
	 * Group: Cell retrieval
	 */

	/**
	 * Function: getDefaultParent
	 * 
	 * Returns <defaultParent> or <mxGraphView.currentRoot> or the first child
	 * child of <mxGraphModel.root> if both are null. The value returned by
	 * this function should be used as the parent for new cells (aka default
	 * layer).
	 */
	mxGraph.prototype.getDefaultParent = function()
	{
		var parent = this.defaultParent;
		
		if (parent == null)
		{
			parent = this.getCurrentRoot();
			
			if (parent == null)
			{
				var root = this.model.getRoot();
				parent = this.model.getChildAt(root, 0);
			}
		}
		
		return parent;
	};

	/**
	 * Function: getSwimlane
	 * 
	 * Returns the nearest ancestor of the given cell which is a swimlane, or
	 * the given cell, if it is itself a swimlane.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the ancestor swimlane should be returned.
	 */
	mxGraph.prototype.getSwimlane = function(cell)
	{
		while (cell != null &&
				!this.isSwimlane(cell))
		{
			cell = this.model.getParent(cell);
		}
		
		return cell;
	};
	
	/**
	 * Function: getSwimlaneAt
	 * 
	 * Returns the bottom-most swimlane that intersects the given point (x, y)
	 * in the cell hierarchy that starts at the given parent.
	 * 
	 * Parameters:
	 * 
	 * x - X-coordinate of the location to be checked.
	 * y - Y-coordinate of the location to be checked.
	 * parent - <mxCell> that should be used as the root of the recursion.
	 * Default is <defaultParent>.
	 */
	mxGraph.prototype.getSwimlaneAt = function (x, y, parent)
	{
		parent = parent || this.getDefaultParent();
		
		if (parent != null)
		{
			var childCount = this.model.getChildCount(parent);
			
			for (var i=0; i<childCount; i++)
			{
				var child = this.model.getChildAt(parent, i);
				var result = this.getSwimlaneAt(x, y, child);
				
				if (result != null)
				{
					return result;
				}
				else if (this.isSwimlane(child))
				{
					var state = this.view.getState(child);
					
					if (this.isCellVisible(child) &&
						this.intersects(state, x, y))
					{
						return child;
					}
				}
			}
		}
		
		return null;
	};
	
	/**
	 * Function: getCellAt
	 * 
	 * Returns the bottom-most cell that intersects the given point (x, y) in
	 * the cell hierarchy starting at the given parent. This will also return
	 * swimlanes if the given location intersects the content area of the
	 * swimlane. If this is not desired, then the <hitsSwimlaneContent> may be
	 * used if the returned cell is a swimlane to determine if the location
	 * is inside the content area or on the actual title of the swimlane.
	 * 
	 * Parameters:
	 * 
	 * x - X-coordinate of the location to be checked.
	 * y - Y-coordinate of the location to be checked.
	 * parent - <mxCell> that should be used as the root of the recursion.
	 * Default is <defaultParent>.
	 * vertices - Optional boolean indicating if vertices should be returned.
	 * Default is true.
	 * edges - Optional boolean indicating if edges should be returned. Default
	 * is true.
	 */
	mxGraph.prototype.getCellAt = function(x, y, parent, vertices, edges)
	{
		vertices = vertices || true;
		edges = edges || true;
		parent = parent || this.getDefaultParent();

		if (parent != null)
		{
			var childCount = this.model.getChildCount(parent);
			
			for (var i = 0; i < childCount; i++)
			{
				var cell = this.model.getChildAt(parent, i);
				var result = this.getCellAt(x, y, cell, vertices, edges);
				
				if (result != null)
				{
					return result;
				}
				else
				{
					if (this.isCellVisible(cell) &&
						(edges && this.model.isEdge(cell) ||
						vertices && this.model.isVertex(cell)))
					{
						var state = this.view.getState(cell);
						
						if (this.intersects(state, x, y))
						{
							return cell;
						}
					}
				}
			}
		}
		
		return null;
	};
	
	/**
	 * Function: intersects
	 * 
	 * Returns the bottom-most cell that intersects the given point (x, y) in
	 * the cell hierarchy that starts at the given parent.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> that represents the cell state.
	 * x - X-coordinate of the location to be checked.
	 * y - Y-coordinate of the location to be checked.
	 */
	mxGraph.prototype.intersects = function(state, x, y)
	{
		if (state != null)
		{
			var pts = state.absolutePoints;

			if (pts != null)
			{
				var t2 = this.tolerance * this.tolerance;

				var pt = pts[0];
				
				for (var i = 1; i<pts.length; i++)
				{
					var next = pts[i];
					var dist = mxUtils.	ptSegDistSq(
						pt.x, pt.y, next.x, next.y, x, y);
					
					if (dist <= t2)
					{
						return true;
					}
					
					pt = next;
				}
			}
			else if (mxUtils.contains(state, x, y))
			{
				return true;
			}
		}
		
		return false;
	};
	
	/**
	 * Function: hitsSwimlaneContent
	 * 
	 * Returns true if the given coordinate pair is inside the content
	 * are of the given swimlane.
	 * 
	 * Parameters:
	 * 
	 * swimlane - <mxCell> that specifies the swimlane.
	 * x - X-coordinate of the mouse event.
	 * y - Y-coordinate of the mouse event.
	 */
	mxGraph.prototype.hitsSwimlaneContent = function(swimlane, x, y)
	{
		var state = this.getView().getState(swimlane);
		var size = this.getStartSize(swimlane);
		
		if (state != null)
		{
			var scale = this.getView().getScale();
			x -= state.x;
			y -= state.y;
			
			if (size.width > 0 &&
				x > 0 &&
				x > size.width * scale)
			{
				return true;
			}
			else if (size.height > 0 &&
					y > 0 &&
					y > size.height * scale)
			{
				return true;
			}
		}
		
		return false;
	};
	
	/**
	 * Function: getChildVertices
	 * 
	 * Returns the visible child vertices of the given parent.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> whose children should be returned.
	 */
	mxGraph.prototype.getChildVertices = function(parent)
	{
		return this.getChildCells(parent, true, false);
	}
		
	/**
	 * Function: getChildEdges
	 * 
	 * Returns the visible child edges of the given parent.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> whose child vertices should be returned.
	 */
	mxGraph.prototype.getChildEdges = function(parent)
	{
		return this.getChildCells(parent, false, true);
	}

	/**
	 * Function: getChildCells
	 * 
	 * Returns the visible child vertices or edges in the given parent. If
	 * vertices and edges is false, then all children are returned.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> whose children should be returned.
	 * vertices - Optional boolean that specifies if child vertices should
	 * be returned. Default is false.
	 * edges - Optional boolean that specifies if child edges should
	 * be returned. Default is false.
	 */
	mxGraph.prototype.getChildCells = function(parent, vertices, edges)
	{
		parent = (parent != null) ? parent : this.getDefaultParent();
		vertices = (vertices != null) ? vertices : false;
		edges = (edges != null) ? edges : false;

		var cells = this.model.getChildCells(parent, vertices, edges);
		var result = new Array();

		// Filters out the non-visible child cells
		for (var i = 0; i < cells.length; i++)
		{
			if (this.isCellVisible(cells[i]))
			{
				result.push(cells[i]);
			}
		}

		return result;
	}
		
	/**
	 * Function: getConnections
	 * 
	 * Returns all visible edges connected to the given cell without loops.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose connections should be returned.
	 * parent - Optional parent of the opposite end for a connection to be
	 * returned.
	 */
	mxGraph.prototype.getConnections = function(cell, parent)
	{
		return this.getEdges(cell, parent, true, true, false);
	}
		
	/**
	 * Function: getIncomingEdges
	 * 
	 * Returns the visible incoming edges for the given cell. If the optional
	 * parent argument is specified, then only child edges of the given parent
	 * are returned.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose incoming edges should be returned.
	 * parent - Optional parent of the opposite end for an edge to be
	 * returned.
	 */
	mxGraph.prototype.getIncomingEdges = function(cell, parent)
	{
		return this.getEdges(cell, parent, true, false, false);
	}
		
	/**
	 * Function: getOutgoingEdges
	 * 
	 * Returns the visible outgoing edges for the given cell. If the optional
	 * parent argument is specified, then only child edges of the given parent
	 * are returned.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose outgoing edges should be returned.
	 * parent - Optional parent of the opposite end for an edge to be
	 * returned.
	 */
	mxGraph.prototype.getOutgoingEdges = function(cell, parent)
	{
		return this.getEdges(cell, parent, false, true, false);
	}
		
	/**
	 * Function: getEdges
	 * 
	 * Returns the incoming and/or outgoing edges for the given cell.
	 * If the optional parent argument is specified, then only edges are returned
	 * where the opposite is in the given parent cell. If at least one of incoming
	 * or outgoing is true, then loops are ignored, if both are false, then all
	 * edges connected to the given cell are returned including loops.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> whose edges should be returned.
	 * parent - Optional parent of the opposite end for an edge to be
	 * returned.
	 * incoming - Optional boolean that specifies if incoming edges should
	 * be included in the result. Default is true.
	 * outgoing - Optional boolean that specifies if outgoing edges should
	 * be included in the result. Default is true.
	 * includeLoops - Optional boolean that specifies if loops should be
	 * included in the result. Default is true.
	 */
	mxGraph.prototype.getEdges = function(cell, parent, incoming, outgoing, includeLoops)
	{
		incoming = (incoming != null) ? incoming : true;
		outgoing = (outgoing != null) ? outgoing : true;
		includeLoops = (includeLoops != null) ? includeLoops : true;
		
		var edges = new Array();
		var isCollapsed = this.isCellCollapsed(cell);
		var childCount = this.model.getChildCount(cell);

		for (var i = 0; i < childCount; i++)
		{
			var child = this.model.getChildAt(cell, i);

			if (isCollapsed || !this.isCellVisible(child))
			{
				edges = edges.concat(this.model.getEdges(child, incoming, outgoing));
			}
		}

		edges = edges.concat(this.model.getEdges(cell, incoming, outgoing));
		var result = new Array();
		
		for (var i = 0; i < edges.length; i++)
		{
			var source = this.view.getVisibleTerminal(edges[i], true);
			var target = this.view.getVisibleTerminal(edges[i], false);

			if (includeLoops ||
				((source != target) &&
				(incoming &&
				target == cell &&
				(parent == null ||
				this.model.getParent(source) == parent)) ||
				(outgoing &&
				source == cell &&
				(parent == null ||
				this.model.getParent(target) == parent))))
			{
				result.push(edges[i]);
			}
		}

		return result;
	}

	/**
	 * Function: getOpposites
	 * 
	 * Returns all distinct visible opposite cells for the specified terminal
	 * on the given edges.
	 * 
	 * Parameters:
	 * 
	 * edges - Array of <mxCells> that contains the edges whose opposite
	 * terminals should be returned.
	 * terminal - Terminal that specifies the end whose opposite should be
	 * returned.
	 * source - Optional boolean that specifies if source terminals should be
	 * included in the result. Default is true.
	 * targets - Optional boolean that specifies if targer terminals should be
	 * included in the result. Default is true.
	 */
	mxGraph.prototype.getOpposites = function(edges, terminal, sources, targets)
	{
		sources = (sources != null) ? sources : true;
		targets = (targets != null) ? targets : true;
		
		var terminals = new Array();
		
		// Implements set semantic on the terminals array using a string
		// representation of each cell in an associative array lookup
		var hash = new Object();
		
		if (edges != null)
		{
			for (var i = 0; i < edges.length; i++)
			{
				var source = this.view.getVisibleTerminal(edges[i], true);
				var target = this.view.getVisibleTerminal(edges[i], false);
				
				// Checks if the terminal is the source of
				// the edge and if the target should be
				// stored in the result
				if (source == terminal &&
					target != null &&
					target != terminal &&
					targets)
				{
					var id = mxCellPath.create(target);
					
					if (hash[id] == null)
					{
						hash[id] = target;
						terminals.push(target);
					}
				}
				
				// Checks if the terminal is the taget of
				// the edge and if the source should be
				// stored in the result
				else if (target == terminal &&
						source != null &&
						source != terminal &&
						sources)
				{
					var id = mxCellPath.create(source);
					
					if (hash[id] == null)
					{
						hash[id] = source;
						terminals.push(source);
					}
				}
			}
		}
		
		return terminals;
	}

	/**
	 * Function: getEdgesBetween
	 * 
	 * Returns the edges between the given source and target. This takes into
	 * account collapsed and invisible cells and returns the connected edges
	 * as displayed on the screen.
	 * 
	 * Parameters:
	 * 
	 * source -
	 * target -
	 * directed -
	 */
	mxGraph.prototype.getEdgesBetween = function(source, target, directed)
	{
		var edges = this.getEdges(source);
		var result = new Array();

		// Checks if the edge is connected to the correct
		// cell and returns the first match
		for (var i = 0; i < edges.length; i++)
		{
			var src = this.view.getVisibleTerminal(edges[i], true);
			var trg = this.view.getVisibleTerminal(edges[i], false);

			if (trg == target || (!directed && src == target))
			{
				result.push(edges[i]);
			}
		}

		return result;
	}
	
	/**
	 * Function: getPointForEvent
	 * 
	 * Returns an <mxPoint> representing the given event in the unscaled,
	 * non-translated coordinate space of <container> and applies the grid.
	 * 
	 * Parameters:
	 * 
	 * evt - Mousevent that contains the mouse pointer location.
	 */
	 mxGraph.prototype.getPointForEvent = function(evt)
	 {
		var p = mxUtils.convertPoint(this.container, evt.clientX, evt.clientY);
		
		var s = this.view.scale;
		var tr = this.view.translate;
		
		p.x = this.snap(p.x / s - tr.x - this.gridSize / 2);
		p.y = this.snap(p.y / s - tr.y - this.gridSize / 2);
		
		return p;
	 };
	
	/**
	 * Function: getCells
	 * 
	 * Returns the children of the given parent that are contained in the given
	 * rectangle (x, y, width, height). The result is added to the optional
	 * result array, which is returned from the function. If no result array
	 * is specified then a new array is created and returned.
	 * 
	 * Parameters:
	 * 
	 * x - X-coordinate of the rectangle.
	 * y - Y-coordinate of the rectangle.
	 * width - Width of the rectangle.
	 * height - Height of the rectangle.
	 * parent - <mxCell> whose children should be checked. Default is
	 * <defaultParent>.
	 * result - Optional array to store the result in.
	 */
	mxGraph.prototype.getCells = function(x, y, width, height, parent, result)
	{
		var result = result || new Array();
		
		if (width > 0 ||
			height > 0)
		{
			var right = x+width;
			var bottom = y+height;
			
			parent = parent || this.getDefaultParent();
			
			if (parent != null)
			{
				var childCount = this.model.getChildCount(parent);
				
				for (var i = 0; i < childCount; i++)
				{
					var cell = this.model.getChildAt(parent, i);
					var state = this.view.getState(cell);
					
					if (this.isCellVisible(cell) &&
						state != null)
					{
						if (state.x >= x && state.y >= y &&
							state.x+state.width <= right &&
							state.y+state.height <= bottom)
						{
							result.push(cell);
						}
						else
						{
							this.getCells(x, y, width, height, cell, result);
						}
					}
				}
			}
		}
		return result;
	};
	
	/**
	 * Function: getCellsBeyond
	 * 
	 * Returns the children of the given parent that are contained in the
	 * halfpane from the given point (x0, y0) rightwards and downwards
	 * depending on rightHalfpane and bottomHalfpane.
	 * 
	 * Parameters:
	 * 
	 * x0 - X-coordinate of the origin.
	 * y0 - Y-coordinate of the origin.
	 * parent - Optional <mxCell> whose children should be checked. Default is
	 * <defaultParent>.
	 * rightHalfpane - Boolean indicating if the cells in the right halfpane
	 * from the origin should be returned.
	 * bottomHalfpane - Boolean indicating if the cells in the bottom halfpane
	 * from the origin should be returned.
	 */
	mxGraph.prototype.getCellsBeyond = function(x0, y0, parent, rightHalfpane, bottomHalfpane)
	{
		var result = new Array();
		
		if (rightHalfpane ||
			bottomHalfpane)
		{
			if (parent == null)
			{
				parent = this.getDefaultParent();
			}
			
			if (parent != null)
			{
				var childCount = this.model.getChildCount(parent);
				
				for (var i = 0; i < childCount; i++)
				{
					var child = this.model.getChildAt(parent, i);
					var state = this.view.getState(child);
					
					if (this.isCellVisible(child) &&
						state != null)
					{
						if ((!rightHalfpane ||
							state.x >= x0) &&
							(!bottomHalfpane ||
							state.y >= y0))
						{
							result.push(child);
						}
					}
				}
			}
		}
		
		return result;
	};

	/**
	 * Function: findTreeRoots
	 * 
	 * Returns all children in the given parent which do not have incoming
	 * edges. If the result is empty then the with the greatest difference
	 * between incoming and outgoing edges is returned.
	 * 
	 * Parameters:
	 * 
	 * parent - <mxCell> whose children should be checked.
	 * isolate - Optional boolean that specifies if edges should be ignored if
	 * the opposite end is not a child of the given parent cell. Default is
	 * false.
	 * invert - Optional boolean that specifies if outgoing or incoming edges
	 * should be counted for a tree root. If false then outgoing edges will be
	 * counted. Default is false.
	 */
	mxGraph.prototype.findTreeRoots = function(parent, isolate, invert)
	{
		isolate = (isolate != null) ? isolate : false;
		invert = (invert != null) ? invert : false;
		var roots = new Array();
		
		if (parent != null)
		{
			var model = this.getModel();
			var childCount = model.getChildCount(parent);
			var best = null;
			var maxDiff = 0;
			
			for (var i=0; i<childCount; i++)
			{
				var cell = model.getChildAt(parent, i);
				
				if (this.model.isVertex(cell) &&
					this.isCellVisible(cell))
				{
					var conns = this.getConnections(cell, (isolate) ? parent : null);
					var fanOut = 0;
					var fanIn = 0;
					
					for (var j = 0; j < conns.length; j++)
					{
						var src = this.view.getVisibleTerminal(conns[j], true);

                        if (src == cell)
                        {
                            fanOut++;
                        }
                        else
                        {
                            fanIn++;
                        }
					}
					
					if ((invert &&
						fanOut == 0 &&
						fanIn > 0) ||
						(!invert &&
						fanIn == 0 &&
						fanOut > 0))
					{
						roots.push(cell);
					}
					
					var diff = (invert) ? fanIn - fanOut : fanOut - fanIn;
					
					if (diff > maxDiff)
					{
						maxDiff = diff;
						best = cell;
					}
				}
			}
			
			if (roots.length == 0 &&
				best != null)
			{
				roots.push(best);
			}
		}
		
		return roots;
	};
	
	/**
	 * Function: traverse
	 * 
	 * Traverses the (directed) graph invoking the given function for each
	 * visited vertex and edge. The function is invoked with the current vertex
	 * and the incoming edge as a parameter. This implementation makes sure
	 * each vertex is only visited once. The function may return false if the
	 * traversal should stop at the given vertex.
	 * 
	 * Example:
	 * 
	 * (code)
	 * mxLog.show();
	 * var cell = graph.getSelectionCell();
	 * graph.traverse(cell, false, function(vertex, edge)
	 * {
	 *   mxLog.debug(graph.getLabel(vertex));
	 * });
	 * (end)
	 * 
	 * Parameters:
	 * 
	 * vertex - <mxCell> that represents the vertex where the traversal starts.
	 * directed - Optional boolean indicating if edges should only be traversed
	 * from source to target. Default is true.
	 * func - Visitor function that takes the current vertex and the incoming
	 * edge as arguments. The traversal stops if the function returns false.
	 * edge - Optional <mxCell> that represents the incoming edge. This is
	 * null for the first step of the traversal.
	 * visited - Optional array of cell paths for the visited cells.
	 */
	mxGraph.prototype.traverse = function(vertex, directed, func, edge, visited)
	{
		if (func != null && vertex != null)
		{
			directed = (directed != null) ? directed : true;
			visited = visited || new Array();
			var id = mxCellPath.create(vertex);
			
			if (visited[id] == null)
			{
				visited[id] = vertex;
				var result = func(vertex, edge);
				
				if (result == null || result)
				{
					var edgeCount = this.model.getEdgeCount(vertex);
					
					if (edgeCount > 0)
					{
						for (var i = 0; i < edgeCount; i++)
						{
							var e = this.model.getEdgeAt(vertex, i);
							var isSource = this.model.getTerminal(e, true) == vertex;
													
							if (!directed || isSource)
							{
								var next = this.model.getTerminal(e, !isSource);
								this.traverse(next, directed, func, e, visited);
							}
						}
					}
				}
			}
		}
	};

	/**
	 * Group: Selection
	 */
	
	/**
	 * Function: isCellSelected
	 * 
	 * Returns true if the given cell is selected.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> for which the selection state should be returned.
	 */
	mxGraph.prototype.isCellSelected = function(cell)
	{
		return this.selection.isSelected(cell);
	};

	/**
	 * Function: isSelectionEmpty
	 * 
	 * Returns true if the selection is empty.
	 */
	mxGraph.prototype.isSelectionEmpty = function()
	{
		return this.selection.cells.length == 0;
	};

	/**
	 * Function: clearSelection
	 * 
	 * Clears the selection using <mxGraphSelection.clear>.
	 */
	mxGraph.prototype.clearSelection = function()
	{
		return this.selection.clear();
	};

	/**
	 * Function: getSelectionCount
	 * 
	 * Returns the number of selected cells.
	 */
	mxGraph.prototype.getSelectionCount = function()
	{
		return this.selection.cells.length;
	};
		
	/**
	 * Function: getSelectionCell
	 * 
	 * Returns the first cell from the array of selected <mxCells>.
	 */
	mxGraph.prototype.getSelectionCell = function()
	{
		return this.selection.cells[0];
	};
	
	/**
	 * Function: getSelectionCells
	 * 
	 * Returns the array of selected <mxCells>.
	 */
	mxGraph.prototype.getSelectionCells = function()
	{
		return this.selection.cells.slice();
	};
	
	/**
	 * Function: setSelectionCell
	 * 
	 * Sets the selection cell.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to be selected.
	 */
	mxGraph.prototype.setSelectionCell = function(cell)
	{
		this.selection.setCell(cell);
	};
	
	/**
	 * Function: setSelectionCells
	 * 
	 * Sets the selection cell.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be selected.
	 */
	mxGraph.prototype.setSelectionCells = function(cells)
	{
		this.selection.setCells(cells);
	};

	/**
	 * Function: selectRegion
	 * 
	 * Selects and returns the cells inside the given rectangle for the
	 * specified event.
	 * 
	 * Parameters:
	 * 
	 * rect - <mxRectangle> that represents the region to be selected.
	 * evt - Mouseevent that triggered the selection.
	 */
	mxGraph.prototype.selectRegion = function(rect, evt)
	{
		var cells = this.getCells(rect.x, rect.y, rect.width, rect.height);
		this.selectCellsForEvent(cells, evt);
		
		return cells;
	};
	
	/**
	 * Function: selectNext
	 * 
	 * Selects the next cell.
	 */
	mxGraph.prototype.selectNext = function()
	{
		this.select(true);
	}

	/**
	 * Function: selectPrevious
	 * 
	 * Selects the previous cell.
	 */
	mxGraph.prototype.selectPrevious = function()
	{
		this.select();
	}
	
	/**
	 * Function: selectParent
	 * 
	 * Selects the parent cell.
	 */
	mxGraph.prototype.selectParent = function()
	{
		this.select(false, true);
	}
	
	/**
	 * Function: selectChild
	 * 
	 * Selects the first child cell.
	 */
	mxGraph.prototype.selectChild = function()
	{
		this.select(false, false, true);
	}

	/**
	 * Function: select
	 * 
	 * Selects the next, parent, first child or previous cell, if all arguments
	 * are false.
	 * 
	 * Parameters:
	 * 
	 * isNext - Boolean indicating if the next cell should be selected.
	 * isParent - Boolean indicating if the parent cell should be selected.
	 * isChild - Boolean indicating if the first child cell should be selected.
	 */
	mxGraph.prototype.select = function(isNext, isParent, isChild)
	{
		var sel = this.selection;
		var cell = (sel.cells.length > 0) ? sel.cells[0] : null;
		
		if (sel.cells.length > 1)
		{
			sel.clear();
		}
		
		var parent = (cell != null) ?
			this.model.getParent(cell) :
			this.getDefaultParent();
		
		var childCount = this.model.getChildCount(parent);
		
		if (cell == null &&
			childCount > 0)
		{
			var child = this.model.getChildAt(parent, 0);
			this.setSelectionCell(child);
		}
		else if ((cell == null ||
			isParent) &&
			this.view.getState(parent) != null &&
			this.model.getGeometry(parent) != null)
		{
			if (this.getCurrentRoot() != parent)
			{
				this.setSelectionCell(parent);
			}
		}
		else if (cell != null &&
			isChild)
		{
			var tmp = this.model.getChildCount(cell);
			
			if (tmp > 0)
			{
				var child = this.model.getChildAt(cell, 0);
				this.setSelectionCell(child);
			}
		}
		else if (childCount > 0)
		{
			var i = parent.getIndex(cell);
			
			if (isNext)
			{
				i++;
				var child = this.model.getChildAt(parent, i % childCount);
				this.setSelectionCell(child);
			}
			else
			{
				i--;
				var index =  (i < 0) ? childCount - 1 : i;
				var child = this.model.getChildAt(parent, index);
				this.setSelectionCell(child);
			}
		}
	};
	
	/**
	 * Function: selectAll
	 * 
	 * Selects all children of the given parent cell or the children of the
	 * default parent if no parent is specified. To select leaf vertices and/or
	 * edges use <selectCells>.
	 * 
	 * Parameters:
	 * 
	 * parent - Optional <mxCell> whose children should be selected.
	 * Default is <defaultParent>.
	 */
	mxGraph.prototype.selectAll = function(parent)
	{
		parent = parent || this.getDefaultParent();
		
		var children = this.model.getChildren(parent);
		
		if (children != null)
		{
			this.setSelectionCells(children);
		}
	};
	
	/**
	 * Function: selectVertices
	 * 
	 * Select all vertices inside the given parent or the default parent.
	 */
	mxGraph.prototype.selectVertices = function(parent)
	{
		this.selectCells(true, false, parent);
	};
	
	/**
	 * Function: selectVertices
	 * 
	 * Select all vertices inside the given parent or the default parent.
	 */
	mxGraph.prototype.selectEdges = function(parent)
	{
		this.selectCells(false, true, parent);
	};

	/**
	 * Function: selectCells
	 * 
	 * Selects all vertices and/or edges depending on the given boolean
	 * arguments recursively, starting at the given parent or the default
	 * parent if no parent is specified. Use <selectAll> to select all cells.
	 * 
	 * Parameters:
	 * 
	 * vertices - Boolean indicating if vertices should be selected.
	 * edges - Boolean indicating if edges should be selected.
	 * parent - Optional <mxCell> that acts as the root of the recursion.
	 * Default is <defaultParent>.
	 */
	mxGraph.prototype.selectCells = function(vertices, edges, parent)
	{
		parent = parent || this.getDefaultParent();
		
		var self = this;
		var filter = function(cell)
		{
			return self.view.getState(cell) != null &&
				self.model.getChildCount(cell) == 0 &&
				((self.model.isVertex(cell) && vertices) ||
				(self.model.isEdge(cell) && edges));
		}
		
		var cells = this.model.getCells(filter, parent);
		this.setSelectionCells(cells);
	};

	/**
	 * Function: selectCellForEvent
	 * 
	 * Selects the given cell by either adding it to the selection or
	 * replacing the selection depending on whether the given mouse event is a
	 * toggle event.
	 * 
	 * Parameters:
	 * 
	 * cell - <mxCell> to be selected.
	 * evt - Optional mouseevent that triggered the selection.
	 */
	mxGraph.prototype.selectCellForEvent = function(cell, evt)
	{
		var isSelected = this.isCellSelected(cell);
		
		if (mxEvent.isToggleEvent(evt))
		{
			if (isSelected)
			{
				this.selection.removeCell(cell);
			}
			else
			{
				this.selection.addCell(cell);
			}
		}
		else if (!isSelected ||
				this.getSelectionCount() != 1)
		{
			this.setSelectionCell(cell);
		}
	};

	/**
	 * Function: selectCellsForEvent
	 * 
	 * Selects the given cells by either adding them to the selection or
	 * replacing the selection depending on whether the given mouse event is a
	 * toggle event.
	 * 
	 * Parameters:
	 * 
	 * cells - Array of <mxCells> to be selected.
	 * evt - Optional mouseevent that triggered the selection.
	 */
	mxGraph.prototype.selectCellsForEvent = function(cells, evt)
	{
		if (mxEvent.isToggleEvent(evt))
		{
			this.selection.addCells(cells);
		}
		else
		{
			this.setSelectionCells(cells);
		}
	};

	/**
	 * Function: selectCellsForEdit
	 * 
	 * Selects the cells that are associated with this edit, which in turn contains
	 * an array of changes.
	 */
	mxGraph.prototype.selectCellsForEdit = function(edit)
	{
		if (edit != null &&
			edit.changes != null)
		{
			var changes = edit.changes;
			var cells = new Array();
			
			for (var i = 0; i < changes.length; i++)
			{
				var change = changes[i];
				
				if (change.constructor != mxRootChange)
				{
					var cell = null;
					
					if (change.constructor == mxChildChange &&
						change.isAdded)
					{
						cell = change.child;
					}
					else if (change.cell != null &&
						change.cell.constructor == mxCell)
					{
						cell = change.cell;
					}
					
					if (cell != null &&
						mxUtils.indexOf(cells, cell) < 0)
					{
						cells.push(cell);
					}
				}
			}

			// Finds the topmost cells and selects them
			var tmp = this.getModel().getTopmostCells(cells);
			this.setSelectionCells(tmp);
		}
	};
	
	/**
	 * Group: Selection state
	 */
	
	/**
	 * Function: createHandler
	 * 
	 * Creates a new handler for the given cell state. This implementation
	 * returns a new <mxEdgeHandler> of the corresponding cell is an edge,
	 * otherwise it returns an <mxVertexHandler>. The returned handler is
	 * stored in the state's handler field.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which a handler should be created.
	 */
	mxGraph.prototype.createHandler = function(state)
	{
		if (this.model.isEdge(state.cell))
		{
			var style = this.view.getEdgeStyle(state, null, null);
			
			if (this.isLoop(state) ||
				style == mxEdgeStyle.ElbowConnector ||
				style == mxEdgeStyle.SideToSide ||
				style == mxEdgeStyle.TopToBottom)
			{
				state.handler = new mxElbowEdgeHandler(state);
			}
			else
			{
				state.handler = new mxEdgeHandler(state);
			}
		}
		else
		{
			state.handler = new mxVertexHandler(state);
		}
	};
	
	/**
	 * Function: redrawHandler
	 * 
	 * Redraws the handler for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the handler should be redrawn.
	 */
	mxGraph.prototype.redrawHandler = function(state)
	{
		if (state != null && state.handler != null)
		{
			state.handler.redraw();
		}
	};
	
	/**
	 * Function: hasHandler
	 * 
	 * Returns true if the given cell state has a handler in the graph. This is
	 * true if the corresponding cell is selected.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> that should be checked for a handler.
	 */
	mxGraph.prototype.hasHandler = function(state)
	{
		return state != null && state.handler != null;
	};
	
	/**
	 * Function: destroyHandler
	 * 
	 * Destroys the handler for the given cell state.
	 * 
	 * Parameters:
	 * 
	 * state - <mxCellState> for which the handler should be destroyed.
	 */
	mxGraph.prototype.destroyHandler = function(state)
	{
		if (state != null && state.handler != null)
		{
			state.handler.destroy();
			state.handler = null;
		}
	};
	
	/**
	 * Group: Graph events
	 */
	
	/**
	 * Function: addGraphListener
	 * 
	 * Adds a listener to the graph event dispatch loop. The listener
	 * must implement the mouseDown, mouseMove and mouseUp methods
	 * with the following parameters:
	 *
	 *   evt - The mouse event that triggered this event
	 *   cell - The cell under the mousepointer
	 *   index - The index of the handle or overlay under the mousepointer
	 * 
	 * Parameters:
	 * 
	 * listener - Listener to be added to the graph event listeners.
	 */
	mxGraph.prototype.addGraphListener = function(listener)
	{
		if (this.graphListeners == null)
		{
			this.graphListeners = new Array();
		}
		this.graphListeners.push(listener);
	};

	/**
	 * Function: removeGraphListener
	 * 
	 * Removes the specified graph listener.
	 * 
	 * Parameters:
	 * 
	 * listener - Listener to be removed from the graph event listeners.
	 */
	mxGraph.prototype.removeGraphListener = function(listener)
	{
		if (this.graphListeners != null)
		{
			for (var i=0; i<this.graphListeners.length; i++)
			{
				if (this.graphListeners[i] == listener)
				{
					this.graphListeners.splice(i, 1);
					break;
				}
			}
		}
	};

	/**
	 * Function: dispatchGraphEvent
	 * 
	 * Dispatches the given event in the graph event dispatch loop. Possible
	 * eventnames are mousedown, mousemove and mouseup. If a listener consumes
	 * the mousedown event, then it will be invoked for the subsequent
	 * mousemoves and mouseup (ie. gesture).
	 * 
	 * Parameters:
	 * 
	 * evtName - String that specifies the type of event to be dispatched.
	 * evt - MouseEvent that triggered this event.
	 * cell - Optional <mxCell> under the mousepointer.
	 * index - Optional object that represents the item under the mousepointer.
	 */
	mxGraph.prototype.dispatchGraphEvent = function(evtName, evt, cell, index)
	{
		// Workaround for single click to focus the graph container. This
		// workaround installs a listener to keep track of the active element
		// in non-IE browsers, and blurs the active element when the mousedown
		// event is processed. This would be done automatically by the default
		// action of the event, but mxEvent.consume invokes preventDefault
		// in order to avoid unwanted effects for the event processing. By
		// blurring the focus, the key listener is able to process events.
		if (!mxClient.IS_IE &&
			evtName == 'mousedown' &&
			this.activeElement != null)
		{
			this.activeElement.blur();
		}
		
		// Consume source function for datatransfer if exists
		if (typeof(mxDatatransfer) != 'undefined')
		{
			mxDatatransfer.consumeSourceFunction(this, evt, cell);
		}

		// Makes sure we have a uniform event-sequence across all
		// browsers for a double click. Since evt.detail == 2 is only
		// available on Firefox we use the fact that each mousedown
		// must be followed by a mouseup, all out-of-sync downs
		// will be dropped silently.
		if (evtName == 'mousedown')
		{
			this.isMouseDown = true;
		}
		
		if ((evtName != 'mouseup' ||
			this.isMouseDown) &&
			evt.detail != 2)
		{
			if (evtName == 'mouseup')
			{
				this.isMouseDown = false;
			}

			if (!this.isEditing() &&
				(mxClient.IS_OP ||
				mxClient.IS_SF ||
				mxClient.IS_GC ||
				evt.target != this.container))
			{
				if (this.gestureHandler != null)
				{
					// Continuation of an unfinished gesture. Normally, this
					// happens if the mouse is released on an HTML element
					// which overlaps the graph.
					if (evtName == 'mousedown')
					{
						this.gestureHandler.mouseDown(evt, cell, index);
					}
					else if (evtName == 'mousemove')
					{
						if (this.autoScroll)
						{
							this.scrollEventToVisible(evt, this.autoExtend);
						}

						this.gestureHandler.mouseMove(evt, cell, index);
					}
					else if (evtName == 'mouseup')
					{
						this.gestureHandler.mouseUp(evt, cell, index);
						this.gestureHandler = null;
					}
	
					// Keeps the DOM selection empty in IE during a handled
					// gesture
					if (mxClient.IS_IE &&
						document.selection.type != 'None' &&
						evtName != 'mousedown')
					{
						try
						{
							document.selection.empty();
						}
						catch (e)
						{
							// ignore
						}
					}
				}
				else if (this.graphListeners != null)
				{
					// Does not change returnValue in Opera
					evt.returnValue = true;
					
					for (var i = 0; i < this.graphListeners.length && !mxEvent.isConsumed(evt); i++)
					{
						if (evtName == 'mousedown')
						{
							this.graphListeners[i].mouseDown(evt, cell, index);
							
							if (mxEvent.isConsumed(evt))
							{
								this.gestureHandler = this.graphListeners[i];
								break; // TODO: Remove for consistent event processing
							}
						}
						else if (evtName == 'mousemove')
						{
							this.graphListeners[i].mouseMove(evt, cell, index);
						}
						else if (evtName == 'mouseup')
						{
							this.graphListeners[i].mouseUp(evt, cell, index);
						}
					}
				}
				
				if (evtName == 'mouseup')
				{
					this.click(evt, cell);
				}
			}
		}
	};

	/**
	 * Function: destroy
	 * 
	 * Destroys the graph and all its resources.
	 */
	mxGraph.prototype.destroy = function()
	{
		if (!this.destroyed)
		{
			this.destroyed = true;
			
			if (this.tooltipHandler != null)
			{
				this.tooltipHandler.destroy();
			}
			
			if (this.panningHandler != null)
			{
				this.panningHandler.destroy();
			}
			
			if (this.connectionHandler != null)
			{
				this.connectionHandler.destroy();
			}
			
			if (this.graphHandler != null)
			{
				this.graphHandler.destroy();
			}
			
			if (this.editor != null)
			{
				this.editor.destroy();
			}
			
			if (this.view != null)
			{
				this.view.destroy();
			}
			
			if (this.focusHandler != null)
			{
				mxEvent.removeListener(document.body, 'focus', this.focusHandler);
				this.focusHandler = null;
			}
			
			if (this.blurHandler != null)
			{
				mxEvent.removeListener(document.body, 'blur', this.blurHandler);
				this.blurHandler = null;
			}

			this.activeElement = null;
			this.container = null;
		}
	};

}
