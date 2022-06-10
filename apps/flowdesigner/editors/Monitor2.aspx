<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Monitor2.aspx.cs" Inherits="WebClient.apps.flowdesigner.editors.Monitor2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title>流程监控</title>
    <link rel="stylesheet" href="css/wordpress.css" type="text/css" media="screen" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <style type="text/css" media="screen">
        #page
        {
            /*background: url("images/draw/drawbg.jpg") repeat-y top;
            border: none;*/
        }
    </style>
    <script type="text/javascript">
        mxBasePath = '../src/';

        var urlParams = (function (url) {
            var result = new Object();
            var params = window.location.search.slice(1).split('&');

            for (var i = 0; i < params.length; i++) {
                idx = params[i].indexOf('=');

                if (idx > 0) {
                    result[params[i].substring(0, idx)] = params[i].substring(idx + 1);
                }
            }

            return result;
        })(window.location.href);

        var mxLanguage = urlParams['lang'];
    </script>
    <script type="text/javascript" src="../src/js/mxClient_IE9.js"></script>
    <script type="text/javascript" src="js/mxApplication.js"></script>
    <script type="text/javascript">
        // Program starts here. The document.onLoad executes the
        // mxApplication constructor with a given configuration.
        // In the config file, the mxEditor.onInit method is
        // overridden to invoke this global function as the
        // last step in the editor constructor.
        function onInit(editor) {
            // Enables rotation handle
            mxVertexHandler.prototype.rotationEnabled = true;

            // Enables guides
            mxGraphHandler.prototype.guidesEnabled = true;

            // Alt disables guides
            mxGuide.prototype.isEnabledForEvent = function (evt) {
                return !mxEvent.isAltDown(evt);
            };

            // Enables snapping waypoints to terminals
            mxEdgeHandler.prototype.snapToTerminals = true;

            // Defines an icon for creating new connections in the connection handler.
            // This will automatically disable the highlighting of the source vertex.
            mxConnectionHandler.prototype.connectImage = new mxImage('images/connector.gif', 16, 16);

            // Enables connections in the graph and disables
            // reset of zoom and translate on root change
            // (ie. switch between XML and graphical mode).
            //editor.graph.setConnectable(true);

            // Clones the source if new connection has no target
            editor.graph.connectionHandler.setCreateTarget(true);
            /*
            // Updates the title if the root changes
            var title = document.getElementById('title');

            if (title != null) {
                var f = function (sender) {
                    title.innerHTML = 'mxDraw - ' + sender.getTitle();
                };

                editor.addListener(mxEvent.ROOT, f);
                f(editor);
            }
            */
            // Changes the zoom on mouseWheel events
            mxEvent.addMouseWheelListener(function (evt, up) {
                if (!mxEvent.isConsumed(evt)) {
                    if (up) {
                        editor.execute('zoomIn');
                    }
                    else {
                        editor.execute('zoomOut');
                    }

                    mxEvent.consume(evt);
                }
            });

            // Defines a new action to switch between
            // XML and graphical display
            var textNode = document.getElementById('xml');
            var graphNode = editor.graph.container;
            var sourceInput = document.getElementById('source');
            sourceInput.checked = false;

            var funct = function (editor) {
                if (sourceInput.checked) {
                    graphNode.style.display = 'none';
                    textNode.style.display = 'inline';

                    var enc = new mxCodec();
                    var node = enc.encode(editor.graph.getModel());

                    textNode.value = mxUtils.getPrettyXml(node);
                    textNode.originalValue = textNode.value;
                    textNode.focus();
                }
                else {
                    graphNode.style.display = '';

                    if (textNode.value != textNode.originalValue) {
                        var doc = mxUtils.parseXml(textNode.value);
                        var dec = new mxCodec(doc);
                        dec.decode(doc.documentElement, editor.graph.getModel());
                    }

                    textNode.originalValue = null;

                    // Makes sure nothing is selected in IE
                    if (mxClient.IS_IE) {
                        mxUtils.clearSelection();
                    }

                    textNode.style.display = 'none';

                    // Moves the focus back to the graph
                    textNode.blur();
                    editor.graph.container.focus();
                }
            };

            editor.addAction('switchView', funct);

            // Defines a new action to switch between
            // XML and graphical display
            mxEvent.addListener(sourceInput, 'click', function () {
                editor.execute('switchView');
            });
            loadDesigner(graphNode, editor);
            ResizegraphContainer();
            /*
            // Create select actions in page
            var node = document.getElementById('mainActions');
            var buttons = ['group', 'ungroup', 'cut', 'copy', 'paste', 'delete', 'undo', 'redo', 'print', 'show'];

            // Only adds image and SVG export if backend is available
            // NOTE: The old image export in mxEditor is not used, the urlImage is used for the new export.
            if (editor.urlImage != null) {
                // Client-side code for image export
                var exportImage = function (editor) {
                    var graph = editor.graph;
                    var scale = graph.view.scale;
                    var bounds = graph.getGraphBounds();

                    // New image export
                    var xmlDoc = mxUtils.createXmlDocument();
                    var root = xmlDoc.createElement('output');
                    xmlDoc.appendChild(root);

                    // Renders graph. Offset will be multiplied with state's scale when painting state.
                    var xmlCanvas = new mxXmlCanvas2D(root);
                    xmlCanvas.translate(Math.floor(1 / scale - bounds.x), Math.floor(1 / scale - bounds.y));
                    xmlCanvas.scale(scale);

                    var imgExport = new mxImageExport();
                    imgExport.drawState(graph.getView().getState(graph.model.root), xmlCanvas);

                    // Puts request data together
                    var w = Math.ceil(bounds.width * scale + 2);
                    var h = Math.ceil(bounds.height * scale + 2);
                    var xml = mxUtils.getXml(root);

                    // Requests image if request is valid
                    if (w > 0 && h > 0) {
                        var name = 'export.png';
                        var format = 'png';
                        var bg = '&bg=#FFFFFF';

                        new mxXmlRequest(editor.urlImage, 'filename=' + name + '&format=' + format +
		        			bg + '&w=' + w + '&h=' + h + '&xml=' + encodeURIComponent(xml)).
		        			simulate(document, '_blank');
                    }
                };

                editor.addAction('exportImage', exportImage);

                // Client-side code for SVG export
                var exportSvg = function (editor) {
                    var graph = editor.graph;
                    var scale = graph.view.scale;
                    var bounds = graph.getGraphBounds();

                    // Prepares SVG document that holds the output
                    var svgDoc = mxUtils.createXmlDocument();
                    var root = (svgDoc.createElementNS != null) ?
				    	svgDoc.createElementNS(mxConstants.NS_SVG, 'svg') : svgDoc.createElement('svg');

                    if (root.style != null) {
                        root.style.backgroundColor = '#FFFFFF';
                    }
                    else {
                        root.setAttribute('style', 'background-color:#FFFFFF');
                    }

                    if (svgDoc.createElementNS == null) {
                        root.setAttribute('xmlns', mxConstants.NS_SVG);
                    }

                    root.setAttribute('width', Math.ceil(bounds.width * scale + 2) + 'px');
                    root.setAttribute('height', Math.ceil(bounds.height * scale + 2) + 'px');
                    root.setAttribute('xmlns:xlink', mxConstants.NS_XLINK);
                    root.setAttribute('version', '1.1');

                    // Adds group for anti-aliasing via transform
                    var group = (svgDoc.createElementNS != null) ?
					    	svgDoc.createElementNS(mxConstants.NS_SVG, 'g') : svgDoc.createElement('g');
                    group.setAttribute('transform', 'translate(0.5,0.5)');
                    root.appendChild(group);
                    svgDoc.appendChild(root);

                    // Renders graph. Offset will be multiplied with state's scale when painting state.
                    var svgCanvas = new mxSvgCanvas2D(group);
                    svgCanvas.translate(Math.floor(1 / scale - bounds.x), Math.floor(1 / scale - bounds.y));
                    svgCanvas.scale(scale);

                    var imgExport = new mxImageExport();
                    imgExport.drawState(graph.getView().getState(graph.model.root), svgCanvas);

                    var name = 'export.svg';
                    var xml = encodeURIComponent(mxUtils.getXml(root));

                    new mxXmlRequest(editor.urlEcho, 'filename=' + name + '&format=svg' + '&xml=' + xml).simulate(document, "_blank");
                };

                editor.addAction('exportSvg', exportSvg);

                buttons.push('exportImage');
                buttons.push('exportSvg');
            };

            for (var i = 0; i < buttons.length; i++) {
                var button = document.createElement('button');
                mxUtils.write(button, mxResources.get(buttons[i]));

                var factory = function (name) {
                    return function () {
                        editor.execute(name);
                    };
                };

                mxEvent.addListener(button, 'click', factory(buttons[i]));
                node.appendChild(button);
            }
           
            // Create select actions in page
            var node = document.getElementById('selectActions');
            mxUtils.write(node, 'Select: ');
            mxUtils.linkAction(node, 'All', editor, 'selectAll');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'None', editor, 'selectNone');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Vertices', editor, 'selectVertices');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Edges', editor, 'selectEdges');

            // Create select actions in page
            var node = document.getElementById('zoomActions');
            mxUtils.write(node, 'Zoom: ');
            mxUtils.linkAction(node, 'In', editor, 'zoomIn');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Out', editor, 'zoomOut');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Actual', editor, 'actualSize');
            mxUtils.write(node, ', ');
            mxUtils.linkAction(node, 'Fit', editor, 'fit');
            */
        }

        //window.onbeforeunload = function () { return mxResources.get('changesLost'); };
        function loadDesigner(graphNode, editor) {
            //debugger;
            //graphNode.style.display = '';
            var textNode = document.getElementById("txtFlowLayout");
            //if (textNode.value != textNode.originalValue) {
            var doc = mxUtils.parseXml(textNode.value);
            var dec = new mxCodec(doc);
            dec.decode(doc.documentElement, editor.graph.getModel());
            //}

            textNode.originalValue = null;
            // Makes sure nothing is selected in IE
            if (mxClient.IS_IE) {
                mxUtils.clearSelection();
            }

            textNode.style.display = 'none';

            // Moves the focus back to the graph
            //textNode.blur();
            editor.graph.container.focus();

            var xml2 = document.getElementById("txtStateXml").value;
            update(editor.graph, xml2);
        }
        /**
	    * Updates the display of the given graph using the XML data
	    */
        /**
		 * Updates the display of the given graph using the XML data
		 */
        function update(graph, xml) {
            if (xml != null &&
				xml.length > 0) {
                var doc = mxUtils.parseXml(xml);

                if (doc != null &&
					doc.documentElement != null) {
                    var model = graph.getModel();
                    var nodes = doc.documentElement.getElementsByTagName('update');

                    if (nodes != null &&
						nodes.length > 0) {

                        model.beginUpdate();
                        try {
                            for (var i = 0; i < nodes.length; i++) {
                                // Processes the activity nodes inside the process node
                                var id = nodes[i].getAttribute('id');
                                var state = nodes[i].getAttribute('state');

                                // Gets the cell for the given activity name from the model
                                var cell = model.getCell(id);
                                //debugger;
                                // Updates the cell color and adds some tooltip information
                                if (cell != null) {
                                    // Resets the fillcolor and the overlay
                                    graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, 'white', [cell]);
                                    graph.removeCellOverlays(cell);
                                    var stateName = "";
                                    // Changes the cell color for the known states
                                    if (state == 'Running') {
                                        graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#2DFF2C', [cell]);
                                        stateName = "执行中";
                                        graph.addCellOverlay(cell, createOverlay(graph.waitImage, '状态: ' + stateName));
                                    }
                                    else if (state == 'Waiting') {
                                        graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#FFAF1B', [cell]);
                                        stateName = "等待";
                                    }
                                    else if (state == 'Completed') {
                                        graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#FFFF10', [cell]);
                                        stateName = "已完成";
                                        graph.addCellOverlay(cell, createOverlay(graph.checkImage, '状态: ' + stateName));
                                    }

                                    // Adds tooltip information using an overlay icon
                                    if (state != 'Init') {
                                        // Sets the overlay for the cell in the graph
                                       // graph.addCellOverlay(cell, createOverlay(graph.warningImage, '状态: ' + stateName));
                                    }
                                }
                            } // for
                        }
                        finally {
                            model.endUpdate();
                        }
                    }
                }
            }
        };

        function update1(graph, xml) {
            if (xml != null && xml.length > 0) {
                var doc = mxUtils.parseXml(xml);

                if (doc != null && doc.documentElement != null) {
                    var model = graph.getModel();
                    var nodes = doc.documentElement.getElementsByTagName('update');

                    if (nodes != null && nodes.length > 0) {
                        model.beginUpdate();
                        try {
                            for (var i = 0; i < nodes.length; i++) {
                                // Processes the activity nodes inside the process node
                                var id = nodes[i].getAttribute('id');
                                var state = nodes[i].getAttribute('state');

                                // Gets the cell for the given activity name from the model
                                var cell = model.getCell(id);

                                // Updates the cell color and adds some tooltip information
                                if (cell != null) {
                                    // Resets the fillcolor and the overlay
                                    graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, 'white', [cell]);
                                    graph.removeCellOverlays(cell);
                                    
                                    // Changes the cell color for the known states
                                    if (state == 'Running') {
                                        graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#2DFF2C', [cell]);
                                        graph.addCellOverlay(cell, createOverlay(graph.warningImage, '状态:流转中'));
                                    }
                                    else if (state == 'Waiting') {
                                        graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#FFAF1B', [cell]);
                                    }
                                    else if (state == 'Completed') {
                                        graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#FFFF10', [cell]);
                                       
                                    }

                                    // Adds tooltip information using an overlay icon
                                    if (state != 'Init') {
                                        // Sets the overlay for the cell in the graph
                                        graph.addOverlay(cell, createOverlay(graph.warningImage, '状态: ' + state));
                                       

                                    }
                                }
                            } // for
                        }
                        finally {
                            model.endUpdate();
                        }
                    }
                }
            }
        };
        /**
		 * Creates an overlay object using the given tooltip and text for the alert window
		 * which is being displayed on click.
		 */
        function createOverlay(image, tooltip) {
            var overlay = new mxCellOverlay(image, tooltip);

            // Installs a handler for clicks on the overlay
            overlay.addListener(mxEvent.CLICK, function (sender, evt) {
                mxUtils.alert(tooltip + '\n最近更新: ' + new Date());
            });

            return overlay;
        };

    </script>
    <script type="text/javascript">
        function ResizegraphContainer() {
            var graph = document.getElementById("graph");
            //debugger;
            //graph.style.height = document.documentElement.clientHeight - 100;
            //var iWFFormHeight = document.contentWindow.document.body.offsetHeight;
            var h = document.documentElement.clientHeight - document.body.offsetHeight - 30;
            if (h <= 0)
                h = 300;
            graph.style.height = h;
        }

    </script>
</head>
<body onload="new mxApplication('config/diagrameditor.xml');">
    <div id="page1">
        <%--<div id="mainActions"       style="width: 100%; padding-top: 8px; padding-left: 24px; padding-bottom: 8px;">
        </div>
        <div id="selectActions" style="width: 100%; padding-left: 54px; padding-bottom: 4px;">
        </div>--%>
        <table border="0" width="100%">
            <tr>
                <td id="schemaBuilderToolbar" style="width: 16px; padding-left: 20px; display:none" valign="top">
                    <!-- Toolbar Here -->
                </td>
                <td valign="top" style="">
                    <div id="graph" style="position: relative; height: 630px; width:100%; overflow:auto; overflow-x:auto; overflow-y:auto; cursor: default;">
                        <!-- Graph Here -->
                        <center id="splash" style="padding-top: 230px;">
                            <img src="images/loading.gif">
                        </center>
                    </div>
                    <textarea id="xml" style="height: 480px; width: 684px; display: none; border-style: none;"><%=SchemeXml%></textarea>
                </td>
            </tr>
        </table>
        <span style="float: right; padding-right: 36px; display:none">
            <input id="source" type="checkbox" />Source
        </span><!--
        <div id="zoomActions" style="width: 100%; padding-left: 54px; padding-top: 4px;">
        </div>--->
        <input type="hidden" id="txtflowId" name="txtflowId" value='<%=SchemeId%>' />
        <input type="hidden" id="txtFlowLayout" name="txtFlowLayout" value='<%=SchemeXml%>' />
        <input type="hidden" id="txtStateXml" name="txtStateXml" value='<%=StateXml%>' />
        <div id="footer" style=" display: none">
            <p id="status">
                <!-- Status Here -->
                Loading...
            </p>
            <br />
        </div>
    </div>
</body>
</html>

