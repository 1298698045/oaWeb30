<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="monitor.aspx.cs" Inherits="WebClient.apps.wf.monitor" %>


<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNavNoMain.ascx" TagName="TopNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程监控 - <%=InstanceName%></title>
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/elements.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/common.css">
    <!--<link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/SchemaBuilder.css">-->
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <link rel="stylesheet" href="css/wordpress.css" type="text/css" media="screen" />
    <!--<link rel="stylesheet" href="../src/css/common2.css" charset="ISO-8859-1" type="text/css">-->
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
     <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript">
        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-9-22 下午12:27",
            "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}],
            "userPreferences": [
            { "index": 112, "name": "HideInlineEditSplash", "value": false },
        { "index": 114, "name": "OverrideTaskSendNotification", "value": false },
        { "index": 115, "name": "DefaultTaskSendNotification", "value": false },
         { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false },
          { "index": 116, "name": "HideRPPWarning", "value": false },
          { "index": 87, "name": "HideInlineSchedulingSplash", "value": false },
          { "index": 88, "name": "HideCRUCNotification", "value": false },
          { "index": 89, "name": "HideNewPLESplash", "value": false },
           { "index": 90, "name": "HideNewPLEWarnIE6", "value": false },
            { "index": 122, "name": "HideOverrideSharingMessage", "value": false },
             { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false },
              { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false },
               { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false },
                { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false },
                 { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false },
                  { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false },
                   { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false },
                   { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false },
                    { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true },
                    { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false },
                    { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false },
                     { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false },
                     { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false },
                     { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false },
                      { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false },
                      { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false },
                       { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false },
                        { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false },
                         { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true },
                          { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false },
                           { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false },
                 { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false },
                 { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false },
                  { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false },
                   { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false },
                   { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false },
                   { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false },
                   { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false },
                    { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false },
                     { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false },
                      { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true },
                      { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false },
                       { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false },
                       { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false },
                        { "index": 346, "name": "HideS1Banner", "value": true}],
            "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": ""
        });
    </script>
    <style type="text/css" media="screen">
        /*#page { background: url("images/draw/drawbg.jpg") repeat-y top; border: none; }*/</style>
    <script type="text/javascript">
        mxBasePath = '../src/';
    </script>
    <script type="text/javascript" src="../src/js/mxClient.js"></script>
    <script type="text/javascript" src="js/mxApplication.js"></script>
    
    <script type="text/javascript">
        // Program starts here. The document.onLoad executes the
        // mxApplication constructor with a given configuration.
        // In the config file, the mxEditor.onInit method is
        // overridden to invoke this global function as the
        // last step in the editor constructor.
        var layoutEditor = null;
        function onInit(editor, isFirstTime) {
            // Defines an icon for creating new connections in the connection handler.
            // This will automatically disable the highlighting of the source vertex.
            mxConnectionHandler.prototype.connectImage = new mxImage('images/connector.gif', 16, 16);

            // Enables connections in the graph and disables
            // reset of zoom and translate on root change
            // (ie. switch between XML and graphical mode).
            editor.graph.connectionHandler.setEnabled(true);

            // Clones the source if new connection has no target
            editor.graph.connectionHandler.createTarget = true;

            // Displays information about the session
            // in the status bar
            editor.addListener('session', function (editor, session) {
                if (session.connected) {
                    var tstamp = new Date().toLocaleString();
                    editor.setStatus(tstamp + ':' +
						' ' + session.sent + ' bytes sent, ' +
						' ' + session.received + ' bytes received');
                }
                else {
                    editor.setStatus('Not connected');
                }
            });

            // Updates the title if the root changes

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
            //debugger;
            // Defines a new action to switch between
            // XML and graphical display
            var textNode = document.getElementById('xml');
            var graphNode = editor.graph.container;
            var sourceInput = document.getElementById('source');
            sourceInput.checked = false;
            layoutEditor = editor;

            //jack add
            loadFlowDesigner();

            var funct = function (editor) {
                if (sourceInput.checked) {
                    graphNode.style.display = 'none';
                    textNode.style.display = 'inline';

                    var enc = new mxCodec(mxUtils.createXmlDocument());
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
                        document.selection.empty();
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

            // Create select actions in page
            var node = document.getElementById('mainActions');
            var buttons = ['group', 'delete', 'undo', 'print'];

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

            var select = document.createElement('select');
            var option = document.createElement('option');
            mxUtils.writeln(option, 'More Actions...');
            select.appendChild(option);

            var items = ['redo', 'ungroup', 'cut', 'copy', 'paste', 'preview', 'exportImage'];

            for (var i = 0; i < items.length; i++) {
                var option = document.createElement('option');
                mxUtils.writeln(option, mxResources.get(items[i]));
                option.setAttribute('value', items[i]);
                select.appendChild(option);
            }

            mxEvent.addListener(select, 'change', function (evt) {
                var option = select.options[select.selectedIndex];
                select.selectedIndex = 0;

                if (option.value != null) {
                    editor.execute(option.value);
                }
            });

            node.appendChild(select);

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
        }
        function getFlowLayout() {
            var enc = new mxCodec(mxUtils.createXmlDocument());
            var node = enc.encode(layoutEditor.graph.getModel());

            var textNode = document.getElementById("xml")
            textNode.value = mxUtils.getPrettyXml(node);
            return textNode.value;
        }
        
        function loadFlowDesigner() {
            try {
                //debugger;
                var txtFlowLayout = document.getElementById("txtFlowLayout");
                if (txtFlowLayout == null)
                    return;
                var layout = txtFlowLayout.value;
                setLayout(layout);
            }
            catch (e) {

            }
        }
        function setLayout(layoutXml) {
            var textNode = document.getElementById("xml");
            textNode.value = layoutXml;
            var doc = mxUtils.parseXml(textNode.value);
            var dec = new mxCodec(doc);
            dec.decode(doc.documentElement, layoutEditor.graph.getModel());
            //document.body.appendChild(mxUtils.button('Update'));
           
            //var xml2 = '<process><update id="50000000048" state="Running"/></process>';
            var xml2 = document.getElementById("txtStateXml").value;
            update(layoutEditor.graph, xml2);

            ResizegraphContainer();

        }
        function ResizegraphContainer() {
            var graph = document.getElementById("graph");
            //debugger;
            //graph.style.height = document.documentElement.clientHeight - 100;
            //var iWFFormHeight = document.contentWindow.document.body.offsetHeight;
            graph.style.height = document.documentElement.clientHeight - document.body.offsetHeight - 30;
            

        }
    </script>
    
	<!-- Example code -->
	<script type="text/javascript">
	    // Program starts here. Creates a sample graph in the
	    // DOM node with the specified ID. This function is invoked
	    // from the onLoad event handler of the document (see below).
	    function main(container) {
	       
	        // Checks if the browser is supported
	        if (!mxClient.isBrowserSupported()) {
	            // Displays an error message if the browser is not supported.
	            mxUtils.error('Browser is not supported!', 200, false);
	        }
	        else {
	            mxConstants.SHADOWCOLOR = '#e0e0e0';
	            // Creates the graph inside the given container
	            var graph = createGraph(container);

	            // Creates a process display using the activity names as IDs to refer to the elements
                               
	            var xml = document.getElementById("txtFlowLayout").value;	           
	            var doc = mxUtils.parseXml(xml);
	            var codec = new mxCodec(doc);
	            codec.decode(doc.documentElement, graph.getModel());
                
	            //jack add
	            loadFlowDesigner();
	        }

	        // Creates a button to invoke the refresh function
	        document.body.appendChild(mxUtils.button('Update', function (evt) {
	            // XML is normally fetched from URL at server using mxUtils.get - this is a client-side
	            // string with randomized states to demonstrate the idea of the workflow monitor
	            var xml = '<process><update id="ApproveClaim" state="' + getState() + '"/><update id="AuthorizeClaim" state="' + getState() + '"/>' +
					'<update id="CheckAccountingData" state="' + getState() + '"/><update id="ReviewClaim" state="' + getState() + '"/>' +
					'<update id="ApproveReviewedClaim" state="' + getState() + '"/><update id="EnterAccountingData" state="' + getState() + '"/></process>';
	            update(graph, xml);
	        }));

	    };

	    /**
	    * Updates the display of the given graph using the XML data
	    */
	    function update(graph, xml) {
	        if (xml != null &&	xml.length > 0) {
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
	                                graph.removeOverlays(cell);
	                                //debugger;
	                                // Changes the cell color for the known states
	                                if (state == 'Running') {
	                                    graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#2DFF2C', [cell]);
	                                }
	                                else if (state == 'Waiting') {
	                                    graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#FFAF1B', [cell]);
	                                }
	                                else if (state == 'Completed') {
	                                    graph.setCellStyles(mxConstants.STYLE_FILLCOLOR, '#FFFF10', [cell]);
	                                    graph.addCellOverlay(cell, createOverlay(graph.checkImage, '状态: ' + state));
	                                }

	                                // Adds tooltip information using an overlay icon
	                                if (state != 'Init') {
	                                    // Sets the overlay for the cell in the graph
	                                    //graph.addOverlay(cell, createOverlay(graph.warningImage, '状态: ' + state));
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
	        var overlay = new mxOverlay(image, tooltip);

	        // Installs a handler for clicks on the overlay
	        overlay.addListener('click', function (sender, evt, cell) {
	            mxUtils.alert(tooltip + '\n' + 'Last update: ' + new Date());
	        });

	        return overlay;
	    };

	    /**
	    * Creates and returns an empty graph inside the given container.
	    */
	    function createGraph(container) {
	        var graph = new mxGraph(container);
	        graph.setTooltips(true);
	        graph.setEnabled(false);

	        // Disables folding
	        graph.isExpandable = function (cell) {
	            return false;
	        };

	        // Creates the stylesheet for the process display
	        var style = graph.getStylesheet().getDefaultVertexStyle();
	        style[mxConstants.STYLE_FONTSIZE] = '12';
	        style[mxConstants.STYLE_FONTCOLOR] = 'black';
	        style[mxConstants.STYLE_STROKECOLOR] = 'black';
	        style[mxConstants.STYLE_FILLCOLOR] = 'white';
	        style[mxConstants.STYLE_GRADIENTCOLOR] = 'white';
	        style[mxConstants.STYLE_GRADIENT_DIRECTION] = mxConstants.DIRECTION_EAST;
	        style[mxConstants.STYLE_ROUNDED] = true;
	        style[mxConstants.STYLE_SHADOW] = true;
	        style[mxConstants.STYLE_FONTSTYLE] = 1;

	        style = graph.getStylesheet().getDefaultEdgeStyle();
	        style[mxConstants.STYLE_EDGE] = mxEdgeStyle.ElbowConnector;
	        style[mxConstants.STYLE_STROKECOLOR] = 'black';
	        style[mxConstants.STYLE_ROUNDED] = true;

	        style = new Array();
	        style[mxConstants.STYLE_SHAPE] = mxConstants.SHAPE_SWIMLANE;
	        style[mxConstants.STYLE_PERIMETER] = mxPerimeter.RectanglePerimeter;
	        style[mxConstants.STYLE_STROKECOLOR] = 'gray';
	        style[mxConstants.STYLE_FONTCOLOR] = 'black';
	        style[mxConstants.STYLE_FILLCOLOR] = '#E0E0DF';
	        style[mxConstants.STYLE_GRADIENTCOLOR] = 'white';
	        style[mxConstants.STYLE_ALIGN] = mxConstants.ALIGN_CENTER;
	        style[mxConstants.STYLE_VERTICAL_ALIGN] = mxConstants.ALIGN_TOP;
	        style[mxConstants.STYLE_STARTSIZE] = 24;
	        style[mxConstants.STYLE_FONTSIZE] = '12';
	        style[mxConstants.STYLE_FONTSTYLE] = 1;
	        style[mxConstants.STYLE_HORIZONTAL] = false;
	        graph.getStylesheet().putCellStyle('swimlane', style);

	        style = new Array();
	        style[mxConstants.STYLE_SHAPE] = mxConstants.SHAPE_RHOMBUS;
	        style[mxConstants.STYLE_PERIMETER] = mxPerimeter.RhombusPerimeter;
	        style[mxConstants.STYLE_STROKECOLOR] = 'gray';
	        style[mxConstants.STYLE_FONTCOLOR] = 'gray';
	        style[mxConstants.STYLE_FILLCOLOR] = '#91BCC0';
	        style[mxConstants.STYLE_GRADIENTCOLOR] = 'white';
	        style[mxConstants.STYLE_ALIGN] = mxConstants.ALIGN_CENTER;
	        style[mxConstants.STYLE_VERTICAL_ALIGN] = mxConstants.ALIGN_MIDDLE;
	        style[mxConstants.STYLE_FONTSIZE] = '14';
	        graph.getStylesheet().putCellStyle('step', style);

	        style = new Array();
	        style[mxConstants.STYLE_SHAPE] = mxConstants.SHAPE_ELLIPSE;
	        style[mxConstants.STYLE_PERIMETER] = mxPerimeter.EllipsePerimeter;
	        style[mxConstants.STYLE_STROKECOLOR] = 'gray';
	        style[mxConstants.STYLE_FONTCOLOR] = 'gray';
	        style[mxConstants.STYLE_FILLCOLOR] = '#A0C88F';
	        style[mxConstants.STYLE_GRADIENTCOLOR] = 'white';
	        style[mxConstants.STYLE_ALIGN] = mxConstants.ALIGN_CENTER;
	        style[mxConstants.STYLE_VERTICAL_ALIGN] = mxConstants.ALIGN_MIDDLE;
	        style[mxConstants.STYLE_FONTSIZE] = '14';
	        graph.getStylesheet().putCellStyle('start', style);

	        style = mxUtils.clone(style);
	        style[mxConstants.STYLE_FILLCOLOR] = '#DACCBC';
	        style[mxConstants.STYLE_STROKECOLOR] = '#AF7F73';
	        style[mxConstants.STYLE_STROKEWIDTH] = 3;
	        graph.getStylesheet().putCellStyle('end', style);

	        return graph;
	    };

	    /**
	    * Returns a random state.
	    */
	    function getState() {
	        var state = 'Init';
	        var rnd = Math.random() * 4;

	        if (rnd > 3) {
	            state = 'Completed';
	        }
	        else if (rnd > 2) {
	            state = 'Running';
	        }
	        else if (rnd > 1) {
	            state = 'Waiting';
	        }

	        return state;
	    };
	</script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif setupTab  SchemaBuilderUi sfdcBody brandQuaternaryBgr miniHeaderBody"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();"
    onbeforeunload="javascript: event.returnValue = mxResources.get('changesLost');"
    class="hasMotif setupTab  sfdcBody brandQuaternaryBgr miniHeaderBody">
     <div role="complementary" id="schemaBuilderToolbar" class="toolbar" style="display:none">
            <!--schemaBuilderToolbar-->
            <ul>
                <li><a id="close-builder" class="toolbarButton" onclick="closeProcessSchemeDesigner()"
                    href="#">关闭</a></li></ul>            
        </div>
     <div class="main">
        <input type="hidden" id="retURL" name="retURL" value="<%=Request["retURL"] %>" />
        <div id="schemaBuilder" role="main" style="height: 100%; width: 100%;
            position: relative;">
            <div style="text-align: left; display: none">
                <div id="mainActions" style="width: 100%; padding-top: 8px; padding-left: 24px; padding-bottom: 8px;">
                </div>
                <div id="zoomActions" style="width: 100%; padding-left: 54px; padding-top: 4px;">
                </div>
            </div>
            <table border="0" width="100%">
                <tr>
                    <td valign="bottom" style="border-width: 1px; border-style: solid; border-color: black;
                        width: 100%">
                        <div id="graph" style="position: absolute; left: 0px; top: 0px; height: 630px; width: 100%;
                            background-color: white; overflow: scroll; overflow-x: yes; overflow-y: yes;
                            cursor: default;">
                            <!-- Graph Here
                                 background-image: url('/img/schemabuilder/grid.png');
                                 --><!--
                            <center id="splash" style="padding-top: 230px; width: 100%;">
                                <img src="images/loading.gif" alt="" />
                            </center>-->
                        </div>
                        <textarea id="xml" style="height: 480; width: 100%; display: none; border-style: none;"><%=SchemeXml%></textarea>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="hidden" id="txtflowId" name="txtflowId" value='<%=SchemeId%>' />
                        <input type="hidden" id="txtFlowLayout" name="txtFlowLayout" value='<%=SchemeXml%>' />                        
                        <input type="hidden" id="txtStateXml" name="txtStateXml" value='<%=StateXml%>' />
                        <br />
                        <span style="float: right; padding-right: 36px; display: block">
                            <input id="source" type="checkbox" />Source </span>
                        <div id="footer" style="display: none">
                            <p id="status">
                                Loading...
                            </p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>      
    </div>
    <!-- Body events -->
    <script type="text/javascript">
        function bodyOnLoad() {

            setFocusOnLoad();
            //if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
            //if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
            if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ;
            //if (this.loadChatFrameJs) loadChatFrameJs();
            //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
            //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
            //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
            //new GhostTextInputWrapperElement('quick-filter', '快速查找...', 'quickfindInput', 'quickfindInput ghostText', null, null, true);
            //if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "sZErotAiBTGkIqCMRZgPROngS.gZQ=="; };
            //loadFlowDesigner();
            //main(document.getElementById('graph'));
            new mxApplication('config/diagrameditor.xml');
            //main(document.getElementById('graph'));
            
        }
        function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
        function bodyOnFocus() { closePopupOnBodyFocus(); }
        function bodyOnUnload() { }
    </script>
</body>
</html>
