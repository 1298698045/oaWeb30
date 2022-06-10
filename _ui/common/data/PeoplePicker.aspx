<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PeoplePicker.aspx.cs" Inherits="WebClient._ui.common.data.PeoplePicker" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>人员选择（用户、角色、个人小组、公共小组）: </title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1425766202000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/setupV2.css" rel="stylesheet"
        type="text/css" />
    <link type="text/css" rel="stylesheet" href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/Business.js"></script>
    <script type="text/javascript">

        //SetupTreeNode.prototype.initializeSetup = function () {
        //    var openNodes = '';
        //    if (openNodes != null) {
        //        SetupTreeNode.prototype.openListSetup = openNodes.split(':');
        //    }
        //    SetupTreeNode.prototype.personalSetupV2 = true;
        //}
    </script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1425766243000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm", "today": "2015-3-9 上午10:26", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-MM-dd HH:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766202000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766202000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <!--<script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>-->
    <script type="text/javascript">
        function saveSelection() {
            var t = document.getElementById("sharing_search").value;

            if (t == "Q") { //如果是按条件设置人员
                saveCondition();
                return;
            }
            saveAllSelected([document.editPage.duel_select_0, document.editPage.duel_select_1], [document.editPage.duel0, document.editPage.duel1], ',', '\\', '--无--');
            var a = document.editPage.duel_select_1;

            var selectNames = "";
            for (var d = 0; d < a.length; d++) {
                if (d > 0)
                    selectNames += ",";
                selectNames += a.options[d].text;
            }

            document.getElementById("duel1_name").value = selectNames;
            //if (window.ffInAlert) { return false; }
            var values = document.getElementById("duel1").value;
            var names = document.getElementById("duel1_name").value;
            var lknm = document.getElementById("lknm").value;
            //alert(values);
            //alert(names);
            //names = "sss";
            //debugger;
            //window.opener.peopleLookupPick('editPage', 'participantor_lkid', 'participantor', '', values, names, 'null', '')
            window.opener.peopleLookupPick('editPage', lknm + '_lkid', lknm, '', values, names, 'null', '')
            //window.opener.lookupPick('editPage', lknm + '_lkid', lknm, '', values, names, 'null', '')
           
            // top.window.opener.setParticipator('participantor', 'participantor_lkid', names, values);
            // top.window.opener.peopleLookupPick('participantor', 'participantor_lkid', names, values);
            window.close();
        }
        function saveCondition() {
            var postIds = "";
            var titleLevelIds = "";
            var titles = "";
            var sort = 0;
            var values = "";
            var names = "";
            //部门
            names += "科室：";
            names += document.getElementById("businessUnitId").value;
            names += " 并且 岗位：";
            //岗位
            jQuery("input[name='PostId']").each(function (index, value) {
                var isSelect = jQuery(this).attr("checked");
                if (isSelect) {
                    var postValue = jQuery(this).val();
                    if (postValue != "") {
                        if (sort > 0) {
                            postIds += " ";
                            names += ",";
                        }
                        postIds += postValue;
                        names += jQuery(this).attr("title");
                        sort++;
                    }
                }
            });
            sort = 0;
            names += " 并且 职级：";
            //职级
            jQuery("input[name='TitleLevel']").each(function (index, value) {
                var isSelect = jQuery(this).attr("checked");
                if (isSelect) {
                    var v = jQuery(this).val();
                    if (v != "") {
                        if (sort > 0) {
                            titleLevelIds += " ";
                            names += ",";
                        }
                        titleLevelIds += v;
                        names += jQuery(this).attr("title");
                        sort++;
                    }
                }
            });
            sort = 0;
            names += " 并且 职务：";
            //职务
            jQuery("input[name='Title']").each(function (index, value) {
                var isSelect = jQuery(this).attr("checked");
                if (isSelect) {
                    var v = jQuery(this).val();
                    if (v != "") {
                        if (sort > 0) {                             
                            titles += ",";
                            names += ",";
                        }
                        titles += v;
                        names += jQuery(this).attr("title");
                        sort++;
                    }
                }
            });

            var deptIds = document.getElementById("businessUnitId_lkid").value;
            //if (depts != "") {
            values = "Q:";//条件查询

            if(document.getElementById("deptType_1").checked) //发起人本部门人员
                values += "BusinessUnitId$" + document.getElementById("deptType_1").value;
            else
                values += "BusinessUnitId$" + deptIds;
            //}
            //if (postIds != "") {
            values += "|PostId$" + postIds;
            //}
            //if (titleLevelIds != "") {
            values += "|TitleLevel$" + titleLevelIds;
            //}
            values += "|Title$" + titles;
            //alert(values);
            return;

            var lknm = document.getElementById("lknm").value;
            window.opener.peopleLookupPick('editPage', lknm + '_lkid', lknm, '', values, names, 'null', '');
            window.close();
        }
        function peopleLookupPick(a, b, c, d, e, f, g, k) {
            var orgNames = document.getElementById(b).value;
            var orgIds = document.getElementById(c).value
            var names = e;
            var ids = f;
            if (orgNames != "")
                names = orgNames + "," + e;
            // else
            //   names = e;
            if (orgIds != "")
                ids = orgIds + "," + f;

            document.getElementById(b).value = names;
            document.getElementById(c).value = ids;

            //jQuery("#" + b).val(e);
            //jQuery("#" + c).val(f);
        }
        function clearLookupFieldValue(b, c) {
            document.getElementById(b).value = "";
            document.getElementById(c).value = "";
        }
        function SearchKeyDown() {
            if (event.keyCode == 13) {
                event.returnValue = false;
                event.cancel = true;
                searchUsers();
            }
        }
    </script>
    <!--<script src="/jslibrary/sfdc/Security.js"></script>-->
</head>
<body class="hasMotif homeTab popup popupTab brandNoBgrImg EmailCCBccLookup" onload="if(this.bodyOnLoad)bodyOnLoad();">
    <form onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }"
        name="editPage" method="post" id="editPage">
        <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
        <input type="hidden" value="" id="duel0" name="duel0" />
        <input type="hidden" value="" id="duel1" name="duel1" />
        <input type="hidden" value="" id="duel1_name" name="duel1_name" />
        <input type="hidden" value="" id="parentId" name="parentId" />
        <div class="bPageTitle">
            <div class="ptBody secondaryPalette">
                <div class="content">
                    <img title="主页" class="pageTitleIcon" alt="主页" src="/s.gif"><h1>选择数据</h1>
                </div>
            </div>
        </div>
        <script type="text/javascript">
            function switchType(sel) {
                if (sel.value == "U") {
                    //deptChange(
                    //getDepartments(fillDeptList, 2);
                    jQuery("#roleContainer").show();
                    jQuery("#deptContainer").show();
                    jQuery("#qConditionContainer").hide();
                }
                else if (sel.value == "Q") { //表达式
                    jQuery("#roleContainer").hide();
                    jQuery("#qConditionContainer").show();
                }
                else {
                    duel_select_0Var.filter();
                    jQuery("#roleContainer").show();
                    jQuery("#deptContainer").hide();
                    jQuery("#qConditionContainer").hide();
                }
            }
            function fillDeptList(data) {
                //debugger;
                jQuery("#deptList").append(data);
                /*
                var typeList = document.getElementById("deptList");
                if (data) {
                for (var i = 0; i < data.length; i++) {
                var item = data[i];
                typeList.add(new Option(item.name, item.id));
                }
                }
                */
            }
            function searchUsers() {
                // debugger;
                var sel = document.getElementById("sharing_search");
                if (sel.value == "U") {
                    var srchText = jQuery("#searchValue_sharing_search").val();
                    searchAllUsers(fillUserList, srchText);
                }
                else {
                    duel_select_0Var.doSearch();
                }
            }
            function deptChange(d) {
                var t = document.getElementById("sharing_search");
                if (t.value == "U") {
                    getDepartmentUsers(fillUserList, d)
                }
            }
            function fillUserList(data) {
                var arrData = new Array();
                var allowAdded = true;
                var sele = document.getElementById("duel_select_0");
                jQuery('#duel_select_0').find('option').remove();
                var type = jQuery('#sharing_search').val();

                if (data) {
                    //debugger;
                    for (var i = 0; i < data.length; i++) {
                        var item = data[i];
                        sele.add(new Option('用户：' + item.name, type + ':' + item.id));
                        //['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, '']
                        if (allowAdded) {
                            var data2 = [type, '用户：' + item.name, type + ':' + item.id, item.name, existingSelduel_select_0, ''];
                            arrData[i] = data2;
                        }
                    }
                    //arrData += "]";
                    if (allowAdded) {
                        duel_select_0Var.addOptions(false, arrData);
                    }
                }
            }
        </script>
        <div class="bFilter">
            <div style="display: none" id="editPage_duel_errorMsg" class="errorMsg">
            </div>
            <div>
                <label for="sharing_search">
                    搜索：</label>&nbsp;<select title="小组类型" onchange="switchType(this)" name="sharing_search"
                        id="sharing_search">
                        <option value="U">用户</option>
                        <option value="A" selected="">角色</option>
                        <option value="F">流程变量</option>
                        <optgroup label="表达式">
                            <option value="Q">条件查询</option>
                        </optgroup>
                        <optgroup label="分组">
                            <option value="P">个人小组</option>
                            <option value="R">公用小组</option>
                        </optgroup>
                        <!--
                                                <option value="D">角色、内部和入口网站下属</option>
                                                <option value="I">角色和内部下属</option>-->
                    </select>
                &nbsp;&nbsp;
                <label for="searchValue_sharing_search">
                    属于：</label>&nbsp;<input type="text" size="20" onkeydown="SearchKeyDown()" name="searchValue_sharing_search" tabindex="2"
                        maxlength="80" id="searchValue_sharing_search">&nbsp;<input type="button" title="查找"
                            onclick="searchUsers();" name="go_duel_select_0" id="go_duel_select_0Var"
                            class="btn" value=" 查找 " tabindex="3"><br />
                <!--onpropertychange="duel_select_0Var.handlePropertyChange();"
                    onkeydown="return duel_select_0Var.handleKeyDown(event);" -->
                <div id="error_duel_select_0" class="errorMsg" style="visibility: hidden;">
                </div>
            </div>
        </div>
        <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
            <div class="pbBottomButtons">
                <table cellspacing="0" cellpadding="0" border="0">
                    <tbody>
                        <tr>
                            <td class="pbTitle">
                                <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif">&nbsp;
                            </td>
                            <td id="bottomButtonRow" class="pbButtonb">
                                <input type="button" name="save" title="确定" class="primary btn" value=" 确定 " onclick="saveSelection(); return false" />
                                <!--<input type="submit" name="cancel" title="取消" class="btn" value=" 取消 ">-->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="pbBody">
                <div style="display: none" id="errorDiv_ep" class="pbError">
                    错误：无效数据。<br />
                    请查看下列所有错误消息以纠正数据。
                </div>
                <div id="head_1_ep" class="pbSubheader brandTertiaryBgr first tertiaryPalette">
                    <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                        <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                            class="requiredText"> = 必填信息</span></span></span><h3>选择<span class="titleSeparatingColon">:</span></h3>
                </div>
                <div class="pbSubsection">
                    <table cellspacing="0" cellpadding="0" border="0" class="detailList" id="roleContainer">
                        <tbody>
                            <tr class="detailRow">
                                <td>
                                    <div id="deptContainer" class="pbSubsection" style="overflow-y: yes; width: 200; height: 400px; overflow: auto; display: none">
                                        <br />
                                        <div class='treeNode' id="treeRootNode">
                                        </div>
                                    </div>
                                    <script type="text/javascript">
                                        jQuery(document).ready(function () {
                                            // shorthand
                                            var Tree = Ext.tree;
                                            //debugger
                                            var tree = new Tree.TreePanel({
                                                rootVisible: !1,
                                                useArrows: true,
                                                autoScroll: true,
                                                animate: false,
                                                enableDD: true,
                                                containerScroll: true,
                                                border: false,
                                                // auto create TreeLoader
                                                dataUrl: '/apps/CommandProcessor.ashx?cmd=sys.organization.treepicker',
                                                root: {
                                                    nodeType: 'async',
                                                    text: '组织',
                                                    draggable: false,
                                                    id: 'src'
                                                }
                                            });
                                            tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
                                            // render the tree
                                            tree.render('treeRootNode');
                                            tree.getRootNode().expand();
                                        });
                                        function treeSelectionChange(a, b) {
                                            var deptId = a.selNode.id;
                                            deptChange(deptId);
                                        }
                                    </script>
                                </td>
                                <td colspan="4">
                                    <div id="duel" class="duelingListBox">
                                        <table class="layout">
                                            <tbody>
                                                <tr>
                                                    <td class="selectCell">
                                                        <div class="selectTitle">
                                                            <label for="duel_select_0">
                                                                可用</label>
                                                        </div>
                                                        <div><select size="16" style="width:300px;" name="duel_select_0" multiple="multiple" id="duel_select_0" ondblclick="selectItems()" tabindex="4"></select></div>
                                                        <script>
                                                            function selectItems() {
                                                                if (!document.getElementById('duel_select_0').disabled && !document.getElementById('duel_select_1').disabled) {
                                                                    duel_select_0Var.beforeMoveRight();;
                                                                    window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1, '--无--', [], null, '--无--', false, null, 'editPage_duel_errorMsg');
                                                                }
                                                            }
                                                            function removeItems() {
                                                                if (!document.getElementById('duel_select_0').disabled && !document.getElementById('duel_select_1').disabled) { window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0, '--无--', [], null, '--无--', false, null, 'editPage_duel_errorMsg'); duel_select_0Var.moveLeft(); }
                                                            }
                                                        </script>
                                                    </td>
                                                    <td class="zen-phs buttonCell">
                                                        <div class="text">
                                                            添加
                                                        </div>
                                                        <div class="zen-mbs text">
                                                            <a id="duel_select_0_right" href="javascript:if (!document.getElementById('duel_select_0').disabled&amp;&amp; !document.getElementById('duel_select_1').disabled) {duel_select_0Var.beforeMoveRight();;window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');}">
                                                                <img title="添加" class="rightArrowIcon" alt="添加" src="/s.gif" /></a>
                                                        </div>
                                                        <div class="text">
                                                            <a id="duel_select_0_left" href="javascript:if (!document.getElementById('duel_select_0').disabled&amp;&amp; !document.getElementById('duel_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');duel_select_0Var.moveLeft();}">
                                                                <img title="删除" class="leftArrowIcon" alt="删除" src="/s.gif" /></a>
                                                        </div>
                                                        <div class="duelingText">
                                                            删除
                                                        </div>
                                                    </td>
                                                    <td class="selectCell">
                                                        <div class="selectTitle">
                                                            <label for="duel_select_1">
                                                                已选者：</label>
                                                        </div>
                                                        <div><select size="16" style="width:300px;" name="duel_select_1" multiple="multiple" id="duel_select_1" ondblclick="removeItems()" tabindex="4"><%=SelectedOptions%></select></div>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                        <script>                                        window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_select_0', 'duel_select_1'], 'editPage_duel_errorMsg');</script>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <form id="editPage2" method="GET" name="editPage" onsubmit="if (window.ffInAlert) { return false; }">
                        <script type="text/javascript">
                            function showSelectDept(show)
                            {
                                if(show==1)
                                    jQuery("#selDeptContainer").show();
                                else
                                    jQuery("#selDeptContainer").hide();
                            }
                        </script>
                        <table cellspacing="0" cellpadding="0" border="0" class="detailList" id="qConditionContainer" style="display: none">
                            <tbody>
                                 <tr>
                                    <td class="requiredInput" style="width: 60px !important; font-weight:bold;">部门：</td>
                                    <td>
                                        <table>
                                             <tr class="detailRow">                                     
                                                <td colspan="2"><input type="radio" name="deptType" id="deptType" value="0" onclick="showSelectDept(1)" checked  />选部门</td>
                                
                                            </tr>
                                             <tr id="selDeptContainer">
                                                <td></td>
                                                <td>
                                                     <input type="hidden" id="businessUnitId_lkid" name="businessUnitId_lkid" value="<%=DeptIds%>" />
                                        <input type="hidden" value="10" id="businessUnitId_lktp" name="businessUnitId_lktp" />
                                        <input type="hidden" value="" id="businessUnitId_lkold" name="businessUnitId_lkold" />
                                        <input type="hidden" value="1" id="businessUnitId_lspf" name="businessUnitId_lspf" />
                                        <input type="hidden" value="0" id="businessUnitId_lspfsub" name="businessUnitId_lspfsub" />
                                        <input type="hidden" value="0" id="businessUnitId_mod" name="businessUnitId_mod" /><span class="lookupInput">
                                            <textarea wrap="soft" type="text" title="部门" rows="5" name="businessUnitId" maxlength="2000"
                                                id="businessUnitId" cols="70" readonly="readonly"><%=DeptNames%></textarea>
                                            <a href="javascript:openLookup('/_ui/common/data/LookupMutiPicker.aspx?lkfm=editPage&lknm=businessUnitId&lktp=' + getElementByIdCS('businessUnitId_lktp').value,760,'1','&lksrch=' + escapeUTF(getElementByIdCS('businessUnitId').value.substring(0, 80)))"
                                                tabindex="3" title="查找（部门） （新窗口）">
                                                <img src="/s.gif" alt="查找（部门） （新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                                    onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                                    onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                                    title="查找（部门） （新窗口）" /></a> </span><a href="javascript:clearLookupFieldValue('businessUnitId','businessUnitId_lkid')" title="清除已选项">
                                                        <img src="/img/ico_cancel_clear.png" /></a>
                                                </td>
                                            </tr>
                                             <tr class="detailRow">
                                    
                                    <td colspan="2"><input type="radio" name="deptType" id="deptType_1" value="@MyBusinessUnitId" onclick="showSelectDept(0)"/>发起人本部门</td>
                                </tr>
                                        </table>
                                       
                                    </td>
                                </tr>
                                <tr class="detailRow">
                                    <td colspan="2">&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td class="requiredInput" style="width: 60px !important; font-weight:bold;">岗位：</td>
                                    <td><%=PostHTML%></td>
                                </tr>
                               <tr class="detailRow">
                                    <td colspan="2">&nbsp;
                                    </td>
                                </tr>                              
                               
                                <tr>
                                    <td class="requiredInput" style="width: 60px !important; font-weight:bold;">级别：</td>
                                    <td><%=TitleLevelHTML%></td>
                                </tr>
                                 <tr class="detailRow">
                                    <td colspan="2">&nbsp;
                                    </td>
                                </tr>
                                  <tr>
                                    <td class="requiredInput" style="width: 60px !important; font-weight:bold;">职务：</td>
                                    <td><%=TitleHTML%></td>
                                </tr>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
            <div class="pbFooter secondaryPalette">
                <div class="bg">
                </div>
            </div>
        </div>
        <script>   //     if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "cancel"]); }</script>
        <script type="text/javascript">
            var duel_select_0Var = new SelectFilterElement("sharing_search", "A", "duel_select_0", "", "duel_select_1", 100, true, null);
            var existingSelduel_select_0 = document.getElementById('duel_select_1');
            //debugger;
            duel_select_0Var.addOptions(false, [<%=AvailableSelectOptions%>]);
            if (existingSelduel_select_0.options.length == 0) {
                existingSelduel_select_0.options[0] = new Option('--无--', '');
            }
            duel_select_0Var.filter();//默认选角色
        </script>
         <!-- Body events -->
         <script type="text/javascript">function bodyOnLoad() { if ((typeof duel_select_0Var != 'undefined') && (typeof duel_select_0Var.init != 'undefined')) { duel_select_0Var.init(); }; }  </script>
    </form>
</body>
</html>