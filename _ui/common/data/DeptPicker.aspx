<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DeptPicker.aspx.cs" Inherits="WebClient._ui.common.data.DeptPicker" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>选择一个部门</title>
    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-6-4 下午4:41", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
  <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/Treenode.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link type="text/css" rel="stylesheet" href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" />
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script>        //   ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.161', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fui%2Fsetup%2Fuser%2FParentRolePickerPage%3Fcid%3D00E90000001HEEr%26nfn%3Dparent_name%26idfn%3Dparent%26id%3D00E90000001HEEb');</script>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class=" lookupTab ParentRolePickerPage" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form name="editPage" method="post" id="editPage">
    <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
    <input type="hidden" id="selectValue" />
    <input type="hidden" id="selectText" /><!--
    <div class="bPageTitle">
        <h1>
            </h1>
    </div>-->
    <!--
    <script>        var roleTreeNode = new RoleTreeNodeElement();</script>
    <a href="javascript:roleTreeNode.collapseAllRoles();">全部折叠</a>&nbsp;<a href="javascript:roleTreeNode.expandAllRoles();">全部展开</a>-->
    <div class="bFilter1">
        <div style="display: none" id="editPage_duel_errorMsg" class="errorMsg">
        </div>
        <div>
            <label for="sharing_search">                
            &nbsp;&nbsp; <label for="searchValue_sharing_search">
                搜索：</label>&nbsp;<input type="text" size="20" name="searchValue_sharing_search"
                    maxlength="80" id="searchValue_sharing_search" onkeydown="searchKeyDown()" style="height:25px;">&nbsp;<input type="button" title="查找"
                        onclick="searchDepts();" name="go_duel_select_0" id="go_duel_select_0Var"
                        class="btn" value=" 查找 " style="height:25px;"><input style="height:25px;" type="button" name="save" title="所有部门" class="primary btn" value=" 所有部门 " onclick="LoadDepts()" /><br />
            <div id="error_duel_select_0" class="errorMsg" style="visibility: hidden;">
            </div>
        </div>
        <div><!--
            部门：<select id="deptList" name="deptList" onchange="deptChange(this.value)">
            </select>-->           
        </div>
    </div>
    <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
        <div class="pbHeader">
             <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <td class="pbTitle">
                            <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                选择</h2>
                        </td>
                        <td id="topButtonRow" class="pbButton">
                            <input type="button" name="save" title="确定" class="primary btn" value=" 确定 " onclick="saveSelection()" style="height:25px;"/>
                            <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 " onclick="window.close();" style="height:25px;"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="pbBody">
            <div class='treeNode' id="treeRootNode" style="overflow-y:yes;height:320px;overflow:auto">
                </div><!--
            <div class="pbSubsection" style="overflow-y:yes;height:480px;overflow:auto">
                <br>
            </div>-->
        </div>
        <div class="pbBottomButtons">
            <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <td class="pbTitle">
                            <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif" />&nbsp;
                        </td>
                        <td id="bottomButtonRow" class="pbButtonb">
                            <input type="button" name="save" title="确定" class="primary btn" value=" 确定 " onclick="saveSelection();return false" style="height:25px;"/>
                            <input type="submit" name="cancel" title="取消" class="btn" value=" 取消 " onclick="window.close();" style="height:25px;"/>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="pbFooter secondaryPalette">
            <div class="bg">
            </div>
        </div>
    </div>
    </form>
    <script>        //  function initializeRoles() { roleTreeNode.init(false, '00E90000001HEEi:00E90000001HEEb'); }</script>
    <script type="text/javascript">
        function saveSelection() {
            var lknm = document.getElementById("lknm").value;
            var values = document.getElementById("selectValue").value;
            var names = document.getElementById("selectText").value;
            var formId = document.getElementById("lkfm").value;
            /*formId = 'editPage';*/
            window.opener.lookupPick(formId, lknm + '_lkid', lknm, '', values, names, 'null', '')
            //window.opener.lookupPick('editPage', lknm + '_lkid', lknm, '', values, names, 'null', '')
            // debugger;
            // top.window.opener.setParticipator('participantor', 'participantor_lkid', names, values);
            // top.window.opener.peopleLookupPick('participantor', 'participantor_lkid', names, values);
            window.close();
        }
        function LoadDepts()
        {
            jQuery("#treeRootNode").html();
            document.getElementById("treeRootNode").innerHTML = "";
            // shorthand
            var Tree = Ext.tree;
            //debugger
            var tree = new Tree.TreePanel({
                useArrows: true,
                autoScroll: true,
                animate: false,
                enableDD: true,
                containerScroll: true,
                border: false,
                // auto create TreeLoader
                dataUrl: '/apps/CommandProcessor.ashx?cmd=getdeptchildren',
                root: {
                    nodeType: 'async',
                    text: '组织',
                    draggable: false,
                    id: 'src'
                },

            });
            tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
            //tree.getSelectionModel().on("dblclick", doubleSelectDept, tree);
            // render the tree
            tree.render('treeRootNode');
            tree.getRootNode().expand();
        }
        /* [
        {
        "text": "ext-base-dom-more.js",
        "id": "src\/adapter\/ext-base-dom-more.js",
        "leaf": true,
        "cls": "file,folder"
        }]
        */
        //jQuery.on
        //Ext.onReady(function () {
        jQuery(document).ready(function () {
            LoadDepts();
        });
      
        function searchDepts()
        {
            jQuery("#treeRootNode").html();
            document.getElementById("treeRootNode").innerHTML = "";
            var srch = document.getElementById("searchValue_sharing_search").value;
            if (srch == "")
            {
                LoadDepts();
                return;
            }
            var url = '/SecurityProcessor.ashx?cmd=searchdepts&isDisabled=0&search=' + encodeURIComponent(srch);
            jQuery.ajax({
                async: false, cache: false, dataType: "json",
                error: function (request, textStatus, errorThrown) {
                    errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                    //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
                    // alert("0");
                    //debugger;
                },
                success: function (data, textStatus) {
                    var html = " <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" class='list'>";
                    for (var i = 0; i < data.length; i++)
                    {
                        var item = data[i];
                        html += "<tr><td><a href='#' onclick=\"selectDept('" + item.id + "','" + item.text + "')\">" + item.text + "</a></td></tr>";
                    }
                    html += "</table>";
                    jQuery("#treeRootNode").html(html);
                },
                type: "GET",
                url: url
            });
            /*
            var Tree = Ext.tree;
            //debugger
            var tree = new Tree.TreePanel({
                useArrows: true,
                autoScroll: true,
                animate: false,
                enableDD: true,
                containerScroll: true,
                border: false,
                autoLoad: false,
                // auto create TreeLoader
                dataUrl: '/SecurityProcessor.ashx?cmd=searchdepts&search='+encodeURIComponent(srch),
                root: {
                    nodeType: 'async',
                    text: '组织',
                    draggable: false,
                    id: 'src'
                },

            });
            tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
            tree.render('treeRootNode');
            tree.getRootNode().expand();
            */
        }
        function doubleSelectDept(a, b) {
            treeSelectionChange(a, b);
            saveSelection();
        }
        function selectDept(id, name)
        {
            //debugger;
            document.getElementById("selectValue").value = id;
            document.getElementById("selectText").value = name;
            saveSelection();
        }
        function treeSelectionChange(a, b) {
            var deptId = a.selNode.id;
            //alert(deptId);deptId
            //debugger;
            document.getElementById("selectValue").value = deptId;
            document.getElementById("selectText").value = a.selNode.text;
        }
        function searchKeyDown() {
            if (event.keyCode == 13) {
                event.returnValue = false;
                event.cancel = true;
                searchDepts();
            }
        }
    </script>
    <!-- Body events -->
    <script type="text/javascript">        function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "A9RUDB9MjkeedUUmjaHpekvU5eACpchbs8EQ7RXXSSkuxnyl.hJ4mpTEAYgS1WbGzvhsHCxTOeTfhY1yiVHu4QdU9R_nIdHRTygib8G.Utnja.YLknLwLjwE1HG6qOyOnY_VzW1OIEgGEd2Q2iSVFmIWDKV8n8lzONP0.0WL_YB94Hp6VzHuQchvOabpfDlC6D2Q1Q=="; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { } function bodyOnUnload() { }</script>
</body>
</html>
