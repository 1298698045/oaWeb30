<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WFlowDesigner.aspx.cs"
    Inherits="WebClient.apps.flowdesigner.editors.WFlowDesigner" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNavNoMain.ascx" TagName="TopNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程设计 - <%=ProcessName%></title>
     <cc1:StyleAdapter runat="server" id="StyleAdapter" />
     <meta content="IE=5.0000" http-equiv="X-UA-Compatible">
     <link type="text/css" rel="stylesheet" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/WfDesignerTool.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
  <!-- <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">-->
    <link rel="stylesheet" href="css/wordpress.css" type="text/css" media="screen" />
    <!--<meta http-equiv="X-UA-Compatible" content="IE=5,IE=9" />-->
   <link rel="stylesheet" href="../src/css/common.css" charset="ISO-8859-1" type="text/css">
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]>
    </script>
     <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
     <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/SchemaBuilder.js"></script>
    
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
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/apps/flowdesigner/editors/js/workflow.js"></script>
    <script type="text/javascript" src="../src/js/mxClient_IE9.js"></script>    
    <script type="text/javascript" src="js/mxApplication.js"></script>
    <script src="/jslibrary/sfdc/Security.js"></script>
        <style>
        .popup-mask {
            position: fixed;
            background: url(/img/bgOverlayDialogBackground.png);
            background-color: transparent;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            display: none;
            z-index: 100;
        }
        body #iframe {
            position: fixed;
            z-index: 101;
            background-color: white;
            width: 80%;
            left: 10%;
            top: 50%;
            margin-top: -310px;
            border-radius: 7px;
            display: none;
            height: 620px;
            border: 0;
        }
    </style>
    <link href="/template/css/indexStyle.css" rel="stylesheet" type="text/css" />
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
            //debugger
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
            /*
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
        function getFlowLayout() {
            var enc = new mxCodec(mxUtils.createXmlDocument());
            var node = enc.encode(layoutEditor.graph.getModel());

            var textNode = document.getElementById("xml")
            textNode.value = mxUtils.getPrettyXml(node);
            return textNode.value;
        }
        function setLayout(layoutXml) {
            var textNode = document.getElementById("xml");
            textNode.value = layoutXml;
            var doc = mxUtils.parseXml(textNode.value);
            var dec = new mxCodec(doc);
            dec.decode(doc.documentElement, layoutEditor.graph.getModel());
            ResizegraphContainer();

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
        function ResizegraphContainer() {
            var graph = document.getElementById("graph");

            graph.style.height = document.documentElement.clientHeight - document.body.offsetHeight - 30;
            //graph.style.height = document.documentElement.clientHeight - 100;

        }
    </script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            // shorthand
           // debugger;
            var treeHeight = getAutoHeight();
            treeHeight = treeHeight - 100-35;
            jQuery("#schemaBuilder").height(treeHeight);
            jQuery("#graph").height(treeHeight - 10);
            jQuery("#graph").width(clientWidth - 10);
            
        });
        var clientWidth;
        function getAutoHeight() {
            var x = 0, y = 0;
            if (self.innerHeight) // all except Explorer
            {
                x = self.innerWidth;
                y = self.innerHeight;
            }
            else if (document.documentElement && document.documentElement.clientHeight)
                // Explorer 6 Strict Mode
            {
                x = document.documentElement.clientWidth;
                y = document.documentElement.clientHeight;
            }
            else if (document.body) // other Explorers
            {
                x = document.body.clientWidth;
                y = document.body.clientHeight;
            }
            clientWidth = x;
            return y;
        }
    </script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif setupTab  SchemaBuilderUi sfdcBody brandQuaternaryBgr miniHeaderBody"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();new mxApplication('config/diagrameditor.xml');"
    onbeforeunload="javascript: event.returnValue = mxResources.get('changesLost');"
    class="hasMotif setupTab  SchemaBuilderUi sfdcBody brandQuaternaryBgr miniHeaderBody" style="overflow:hidden;">
    <!--<script src="/js/raphael/raphael-min.js"></script>-->
    <div id="schemaBuilderWrapper" class="chatterChatEnabled sbWrapper">
        <div role="complementary" id="schemaBuilderToolbar" class="toolbar">
            <!--schemaBuilderToolbar-->
            <ul>
                <li><a id="close-builder" class="toolbarButton" onclick="closeProcessSchemeDesigner()"
                    href="#">关闭</a></li></ul>
            <ul>
                <li><a id="autoSave" class="toolbarButton" data-uidsfdc="22" onclick="saveProcessScheme()">
                    保存</a></li><!--<li class="dropdown-menu" id="viewOptions" data-uidsfdc="20"><a class="toolbarButton"
                        data-uidsfdc="18">查看选项<img src="/img/admin_show_more_arrow.gif"></a><ul class="dropdown-child-menu dropdown-child-menu-hidden"
                            data-uidsfdc="19" aria-hidden="true">
                            <li><a id="nameOption" class="viewOption">显示元素名称</a></li><li><a id="lineOption" class="viewOption">
                                显示关系</a></li><li><a id="legendOption" class="viewOption">隐藏图例</a></li></ul>
                    </li>-->
            </ul>
        </div>
        <div class="main">
            <input type="hidden" id="retURL" name="retURL" value="<%=Request["retURL"] %>" />
            <input type="hidden" id="processCode" name="processCode" value="<%=ProcessCode%>" />
            <input type="hidden" id="nextStepCode" name="nextStepCode" value="<%=NextStepCode%>" />
            <input type="hidden" id="nextRuleCode" name="nextRuleCode" value="<%=NextRuleCode%>" />
            <!--left:243px;-->
            <div id="schemaBuilder" role="main" style="height: 600px;position: relative;">
                <div style="text-align: left; display: none">
                    <div id="mainActions" style="width: 100%; padding-top: 8px; padding-left: 24px; padding-bottom: 8px;">
                    </div>
                    <div id="zoomActions" style="width: 100%; padding-left: 54px; padding-top: 4px;">
                    </div>
                </div>
                <table border="0" style="width:100%;">
                    <tr>
                        <td valign="bottom" style="border-width: 0px; border-style: solid; border-color: black;">
                            <div id="graph" style="left: 0px; top: 0px; height: 600px; overflow:auto;overflow-x: yes; overflow-y: yes;
                                background-color: white;  background-image: url('/img/schemabuilder/grid.png');
                                cursor: default;-ms-touch-action: none;">
                                <!-- Graph Here
                                 background-image: url('/img/schemabuilder/grid.png');
                                 -->
                                <center id="splash" style="padding-top: 230px;">
                                    <img src="images/loading.gif" alt="" />
                                </center>
                            </div>
                            <textarea id="xml" style="height: 480px;display: none; border-style: none;" cols="100"></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="hidden" id="txtFlowLayout" name="txtFlowLayout" value='<%=SchemeXml%>' />
                            <input type="hidden" id="txtflowId" name="txtflowId" value='<%=SchemeId%>' />
                            <br />
                            <span style="float: right; padding-right: 36px; display: none">
                                <input id="source" type="checkbox" />Source </span>
                            <div id="footer" style="display: none">
                                <p id="status">
                                    Loading...
                                </p>
                            </div>
                        </td>
                    </tr>
                </table>
            </div><!--
            <div role="complementary" id="schemaBuilderSidebar" class="sidebar">
                <div onmouseover="Sfdc.Dom.addClass(this,'indicator-hover')" onmouseout="Sfdc.Dom.removeClass(this,'indicator-hover')"
                    onfocus="Sfdc.Dom.addClass(this,'indicator-hover')" onblur="Sfdc.Dom.removeClass(this,'indicator-hover')"
                    id="sidebar:indicator" class="indicator" data-uidsfdc="9">
                </div>
                <div id="sidebarcontent" class="sidebarContent">
                    <ul class="sidebarHeader">
                        <li><a id="SchemaElementHeader" class="SideBarHeaderLink selectedTab" href="sidebarSchemaElements"
                            data-uidsfdc="16">元素</a></li><li><a id="ObjectHeader" class="SideBarHeaderLink" href="sidebarObject"
                                data-uidsfdc="17">对象</a></li></ul>
                    <div id="sidebarSchemaElements" class="sidebarTabContent" data-uidsfdc="6" style="height: 220px;">
                        <span class="infotext"><span class="SchemaElementInstruction">将新自定义对象和字段拖放至方案中。</span></span><div
                            id="objectSection" class="objectSection">
                            <h3>
                                对象</h3>
                            <ul class="objectElementList">
                                <li id="objectElement" class="schemaElement objectElement">
                                    <div class="customobject SideBarIcon">
                                    </div>
                                    <div title="自定义对象为数据库表格，用于在 Salesforce.com 中存储组织特有的数据。您可以使用自定义对象扩展 Salesforce.com 功能或构建新应用程序功能。">
                                        对象</div>
                                </li>
                            </ul>
                        </div>
                        <div id="fieldSection" class="fieldSection">
                            <h3>
                                字段</h3>
                            <ul class="fieldElementList">
                                <li id="AUTONUMBER" class="schemaElement fieldElement">
                                    <div class="AUTONUMBER SideBarIcon">
                                    </div>
                                    <div title="系统使用您定义的显示格式生成的序列编号。该编号对于每条新记录会自动递增。" class="AUTONUMBER SideBarLabel">
                                        自动编号</div>
                                </li>
                                <li id="FORMULA" class="schemaElement fieldElement">
                                    <div class="FORMULA SideBarIcon">
                                    </div>
                                    <div title="根据您定义的公式表达式派生其值的只读字段。任何来源字段有所更改，该公式字段均将更新。" class="FORMULA SideBarLabel">
                                        公式</div>
                                </li>
                                <li id="SUMMARY" class="schemaElement fieldElement">
                                    <div class="SUMMARY SideBarIcon">
                                    </div>
                                    <div title="在相关列表中显示字段的汇总值、最小值或最大值的只读字段，或在相关列表中列出的所有记录的记录数。" class="SUMMARY SideBarLabel">
                                        累计汇总</div>
                                </li>
                            </ul>
                            <ul class="fieldElementList">
                                <li id="LOOKUP" class="schemaElement fieldElement">
                                    <div class="LOOKUP SideBarIcon">
                                    </div>
                                    <div title="创建一个将此对象链接到另一对象的关系。关系字段允许用户单击查找图标，以从弹出列表中选择值。另一对象是列表中值的源。" class="LOOKUP SideBarLabel">
                                        查找</div>
                                </li>
                                <li id="HIERARCHY" class="schemaElement fieldElement">
                                    <div class="HIERARCHY SideBarIcon">
                                    </div>
                                    <div title="允许用户单击查找图标并从下拉列表中选择另一个对象。" class="HIERARCHY SideBarLabel">
                                        层次结构</div>
                                </li>
                                <li id="MASTERDETAIL" class="schemaElement fieldElement">
                                    <div class="MASTERDETAIL SideBarIcon">
                                    </div>
                                    <div title="创建一个此对象（子级或&quot;详细信息&quot;）与另一对象（父级或&quot;主&quot;）之间的父子关系。页面布局上需要本字段。删除父级对象将删除本子级记录。"
                                        class="MASTERDETAIL SideBarLabel">
                                        主-详细信息</div>
                                </li>
                            </ul>
                            <ul class="fieldElementList">
                                <li id="CHECKBOX" class="schemaElement fieldElement">
                                    <div class="CHECKBOX SideBarIcon">
                                    </div>
                                    <div title="允许用户选择&quot;真&quot;（选取）或&quot;假&quot;（不选取）值。" class="CHECKBOX SideBarLabel">
                                        复选框</div>
                                </li>
                                <li id="CURRENCY" class="schemaElement fieldElement">
                                    <div class="CURRENCY SideBarIcon">
                                    </div>
                                    <div title="允许用户输入美元或其他币种金额，并将字段自动转换为币种金额格式。此功能在将数据导出到 Excel 或其它电子表格时非常有用。" class="CURRENCY SideBarLabel">
                                        币种</div>
                                </li>
                                <li id="DATE" class="schemaElement fieldElement">
                                    <div class="DATE SideBarIcon">
                                    </div>
                                    <div title="允许用户输入日期或从弹出式日历中选择日期。" class="DATE SideBarLabel">
                                        日期</div>
                                </li>
                                <li id="DATETIME" class="schemaElement fieldElement">
                                    <div class="DATETIME SideBarIcon">
                                    </div>
                                    <div title="允许用户输入日期和时间，或从弹出式日历中选择日期。当用户单击弹出式日历中的某个日期后，该日期和当前时间将输入到&quot;日期/时间&quot;字段。"
                                        class="DATETIME SideBarLabel">
                                        日期/时间</div>
                                </li>
                                <li id="EMAIL" class="schemaElement fieldElement">
                                    <div class="EMAIL SideBarIcon">
                                    </div>
                                    <div title="允许用户输入电子邮件地址，对其进行验证以确保格式正确。如果对于一个联系人和潜在客户指定了此字段，则用户单击“发送电子邮件”时可以选择地址。注意，自定义电子邮件地址无法用于批量电子邮件。"
                                        class="EMAIL SideBarLabel">
                                        电子邮件</div>
                                </li>
                                <li id="NUMBER" class="schemaElement fieldElement">
                                    <div class="NUMBER SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何数字。将删除前置零。" class="NUMBER SideBarLabel">
                                        数字</div>
                                </li>
                                <li id="PERCENT" class="schemaElement fieldElement">
                                    <div class="PERCENT SideBarIcon">
                                    </div>
                                    <div title="允许用户输入百分比数字（例如，&quot;10&quot;），并自动向数字添加百分号。" class="PERCENT SideBarLabel">
                                        百分比</div>
                                </li>
                                <li id="PHONE" class="schemaElement fieldElement">
                                    <div class="PHONE SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何电话号码。自动将其转换为电话号码格式。" class="PHONE SideBarLabel">
                                        电话</div>
                                </li>
                                <li id="PICKLIST" class="schemaElement fieldElement">
                                    <div class="PICKLIST SideBarIcon">
                                    </div>
                                    <div title="允许用户从定义的列表中选择值。" class="PICKLIST SideBarLabel">
                                        选项列表</div>
                                </li>
                                <li id="MULTIPICKLIST" class="schemaElement fieldElement">
                                    <div class="MULTIPICKLIST SideBarIcon">
                                    </div>
                                    <div title="允许用户从定义的列表中选择多个值。" class="MULTIPICKLIST SideBarLabel">
                                        选项列表（多项选择）</div>
                                </li>
                                <li id="TEXT" class="schemaElement fieldElement">
                                    <div class="TEXT SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何字母和数字组合。" class="TEXT SideBarLabel">
                                        文本</div>
                                </li>
                                <li id="ENCRYPTED" class="schemaElement fieldElement">
                                    <div class="ENCRYPTED SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何字母和数字组合，并将它们以加密格式存储。" class="ENCRYPTED SideBarLabel">
                                        加密文本</div>
                                </li>
                                <li id="TEXTAREA" class="schemaElement fieldElement">
                                    <div class="TEXTAREA SideBarIcon">
                                    </div>
                                    <div title="允许用户输入多行文本，最多可输入 255 个字符。" class="TEXTAREA SideBarLabel">
                                        文本区</div>
                                </li>
                                <li id="LTA" class="schemaElement fieldElement">
                                    <div class="LTA SideBarIcon">
                                    </div>
                                    <div title="允许用户输入多行文本，最多可输入 131,072 个字符。" class="LTA SideBarLabel">
                                        长文本区</div>
                                </li>
                                <li id="RTA" class="schemaElement fieldElement">
                                    <div class="RTA SideBarIcon">
                                    </div>
                                    <div title="允许用户输入格式化文本、添加图片和链接。最多有 131,072 个字符在分开行上。" class="RTA SideBarLabel">
                                        富文本区域</div>
                                </li>
                                <li id="URL" class="schemaElement fieldElement">
                                    <div class="URL SideBarIcon">
                                    </div>
                                    <div title="允许用户输入任何有效的网址。当用户单击该字段时，该 URL 将在单独的浏览器窗口中打开。" class="URL SideBarLabel">
                                        URL</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div id="sidebarObject" class="sidebarTabContent tabHidden">
                        <div id="sideBarObjectHeader" class="sideBarObjectHeader">
                            <h2 class="offscreen">
                                可用对象</h2>
                            <span class="infotext">选择要在生成器上显示的对象。</span><ul class="filter-list">
                                <li>
                                    <h3 class="offscreen">
                                        对象筛选器</h3>
                                    <label for="group-filter">
                                        从下面选择</label><select name="group-filter" id="group-filter" data-uidsfdc="139"><option
                                            selected="selected" value="all">所有对象</option>
                                            <option value="sel">所选对象</option>
                                            <option value="std">标准对象</option>
                                            <option value="cus">自定义对象</option>
                                            <option value="sys">系统对象</option>
                                        </select></li><li>
                                            <div class="quickfindContainer">
                                                <input type="text" size="20" name="quick-filter" maxlength="80" id="quick-filter"
                                                    data-uidsfdc="140" class="quickfindInput ghostText"></div>
                                        </li>
                            </ul>
                        </div>
                        <div id="ObjectList" class="sidebarObjectList">
                            <div id="object-listpane" class="object-listpane" style="height: 220px;">
                                <h3 class="offscreen">
                                    对象</h3>
                                <p class="pipelist">
                                    <a id="selectAll" href="#" data-uidsfdc="141">选择全部</a> | <a id="clearAll" href="#"
                                        data-uidsfdc="142">清除所有</a></p>
                                <ul id="object-list" class="object-list clear" data-uidsfdc="143">
                                    <li class="sel cus" id="01I90000001SlVR:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001SlVR:objListItemCb"><label for="01I90000001SlVR:objListItemCb">报销单</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Product2:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Product2:objListItemCb"><label for="Product2:objListItemCb">产品</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Order:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Order:objListItemCb"><label for="Order:objListItemCb">订单</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="OrderItem:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="OrderItem:objListItemCb"><label for="OrderItem:objListItemCb">订单产品</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkFeedback:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkFeedback:objListItemCb"><label for="WorkFeedback:objListItemCb">反馈</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkFeedbackRequest:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkFeedbackRequest:objListItemCb"><label for="WorkFeedbackRequest:objListItemCb">反馈请求</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkFeedbackQuestion:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkFeedbackQuestion:objListItemCb"><label for="WorkFeedbackQuestion:objListItemCb">反馈问题</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkFeedbackQuestionSet:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkFeedbackQuestionSet:objListItemCb"><label for="WorkFeedbackQuestionSet:objListItemCb">反馈问题集</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkCoaching:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkCoaching:objListItemCb"><label for="WorkCoaching:objListItemCb">辅导</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Case:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Case:objListItemCb"><label for="Case:objListItemCb">个案</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Contract:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Contract:objListItemCb"><label for="Contract:objListItemCb">合同</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="Activity:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Activity:objListItemCb"><label for="Activity:objListItemCb">活动</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkPerformanceCycle:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkPerformanceCycle:objListItemCb"><label for="WorkPerformanceCycle:objListItemCb">绩效循环</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Pricebook2:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Pricebook2:objListItemCb"><label for="Pricebook2:objListItemCb">价格手册</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="PricebookEntry:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="PricebookEntry:objListItemCb"><label for="PricebookEntry:objListItemCb">价格手册条目</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Solution:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Solution:objListItemCb"><label for="Solution:objListItemCb">解决方案</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Account:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Account:objListItemCb"><label for="Account:objListItemCb">客户</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Contact:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Contact:objListItemCb"><label for="Contact:objListItemCb">联系人</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkGoal:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkGoal:objListItemCb"><label for="WorkGoal:objListItemCb">目标</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkGoalLink:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkGoalLink:objListItemCb"><label for="WorkGoalLink:objListItemCb">目标链接</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="WorkGoalCollaborator:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="WorkGoalCollaborator:objListItemCb"><label for="WorkGoalCollaborator:objListItemCb">目标协作者</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="ContentVersion:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="ContentVersion:objListItemCb"><label for="ContentVersion:objListItemCb">内容</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Lead:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Lead:objListItemCb"><label for="Lead:objListItemCb">潜在客户</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="Territory2:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Territory2:objListItemCb"><label for="Territory2:objListItemCb">区域</label><br
                                                class="clear">
                                    </li>
                                    <li class="std" id="Territory2Model:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Territory2Model:objListItemCb"><label for="Territory2Model:objListItemCb">区域模式</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="Task:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Task:objListItemCb"><label for="Task:objListItemCb">任务</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Campaign:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Campaign:objListItemCb"><label for="Campaign:objListItemCb">市场活动</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="CampaignMember:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="CampaignMember:objListItemCb"><label for="CampaignMember:objListItemCb">市场活动成员</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="Event:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="Event:objListItemCb"><label for="Event:objListItemCb">事件</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Opportunity:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Opportunity:objListItemCb"><label for="Opportunity:objListItemCb">业务机会</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="OpportunityLineItem:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="OpportunityLineItem:objListItemCb"><label for="OpportunityLineItem:objListItemCb">业务机会产品</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Idea:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Idea:objListItemCb"><label for="Idea:objListItemCb">意见</label><br
                                                class="clear">
                                    </li>
                                    <li class="std sys" id="User:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="User:objListItemCb"><label for="User:objListItemCb">用户</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel std" id="Asset:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="Asset:objListItemCb"><label for="Asset:objListItemCb">资产</label><br
                                                class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNk:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNk:objListItemCb"><label for="01I90000001TSNk:objListItemCb">Case
                                                Swarm Rule</label><br class="clear">
                                    </li>
                                    <li class="sel std" id="DandBCompany:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="DandBCompany:objListItemCb"><label for="DandBCompany:objListItemCb">D&amp;B
                                                公司</label><br class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNa:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNa:objListItemCb"><label for="01I90000001TSNa:objListItemCb">Expense</label><br
                                                class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNl:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNl:objListItemCb"><label for="01I90000001TSNl:objListItemCb">Feed
                                                Post Swarm Rule</label><br class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNm:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNm:objListItemCb"><label for="01I90000001TSNm:objListItemCb">Lead
                                                Swarm Rule</label><br class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNb:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNb:objListItemCb"><label for="01I90000001TSNb:objListItemCb">Log</label><br
                                                class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfr:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfr:objListItemCb"><label for="01I90000001Snfr:objListItemCb">MC
                                                Campaign</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfq:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfq:objListItemCb"><label for="01I90000001Snfq:objListItemCb">MC
                                                Campaign Hourly Stats</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfs:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfs:objListItemCb"><label for="01I90000001Snfs:objListItemCb">MC
                                                Interest Group</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snft:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snft:objListItemCb"><label for="01I90000001Snft:objListItemCb">MC
                                                Interest Grouping</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfu:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfu:objListItemCb"><label for="01I90000001Snfu:objListItemCb">MC
                                                List</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfv:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfv:objListItemCb"><label for="01I90000001Snfv:objListItemCb">MC
                                                Merge Variable</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfx:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfx:objListItemCb"><label for="01I90000001Snfx:objListItemCb">MC
                                                Query</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfw:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfw:objListItemCb"><label for="01I90000001Snfw:objListItemCb">MC
                                                Query Filter</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfy:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfy:objListItemCb"><label for="01I90000001Snfy:objListItemCb">MC
                                                Static Segment</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Sng0:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Sng0:objListItemCb"><label for="01I90000001Sng0:objListItemCb">MC
                                                Subscriber</label><br class="clear">
                                    </li>
                                    <li class="sel cus" id="01I90000001Snfz:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" checked="" id="01I90000001Snfz:objListItemCb"><label for="01I90000001Snfz:objListItemCb">MC
                                                Subscriber Activity</label><br class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNc:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNc:objListItemCb"><label for="01I90000001TSNc:objListItemCb">Milestone</label><br
                                                class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNn:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNn:objListItemCb"><label for="01I90000001TSNn:objListItemCb">Opportunity
                                                Swarm Rule</label><br class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNd:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNd:objListItemCb"><label for="01I90000001TSNd:objListItemCb">Project</label><br
                                                class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNh:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNh:objListItemCb"><label for="01I90000001TSNh:objListItemCb">Project
                                                Snapshot</label><br class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNf:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNf:objListItemCb"><label for="01I90000001TSNf:objListItemCb">Task</label><br
                                                class="clear">
                                    </li>
                                    <li class="cus" id="01I90000001TSNg:objListItem">
                                        <img src="/img/func_icons/util/search16.png" class="sidebarObjectAction" title="查找对象"><input
                                            type="checkbox" id="01I90000001TSNg:objListItemCb"><label for="01I90000001TSNg:objListItemCb">Time</label><br
                                                class="clear">
                                    </li>
                                </ul>
                                <span id="object-list-nomatches">找不到匹配目标。</span></div>
                        </div>
                    </div>
                </div>
            </div>-->
        </div>
    </div>
    <script src="/js/alert.js"></script>
    <!-- Body events -->
    <script type="text/javascript">
        function bodyOnLoad() {
            
            setFocusOnLoad();
            if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
            if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); };
            if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; ;
            //if (this.loadChatFrameJs) loadChatFrameJs();
            //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
            //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
            //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
            //new GhostTextInputWrapperElement('quick-filter', '快速查找...', 'quickfindInput', 'quickfindInput ghostText', null, null, true);
            //if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "sZErotAiBTGkIqCMRZgPROngS.gZQ=="; };

            loadFlowDesigner();

            //var iFrameID = document.getElementById('graph');
            //if (iFrameID.clientHeight
            //iFrameID.height = iFrameID.clientHeight + "px";
        }
        function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
        function bodyOnFocus() { closePopupOnBodyFocus(); }
        function bodyOnUnload() { }
    </script>
    <div class="popup-mask"></div>
    <iframe id="iframe" frameborder="0"></iframe>
</body>
</html>
