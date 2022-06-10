<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MutiContactPicker.aspx.cs" Inherits="WebClient._ui.common.data.MutiContactPicker" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>人员选择（同事、公用、我的通讯录）: </title>
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/zen-componentsCompatible.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/elements.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/common.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1425766202000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/setupV2.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/Business.js"></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = true;
        }
    </script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1425766243000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-3-9 上午10:26", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766202000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766202000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1425766177000/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }
    </script>
    <!--<script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf'); ; });</script>-->
    <script type="text/javascript">
        function saveSelection() {
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
            //alert(values);
            //alert(names);
            //names = "sss";
            var lknm = document.getElementById("lknm").value;

            window.opener.lookupPick('editPage', lknm + '_lkid', lknm, '', values, names, 'null', '')
            //top.window.opener.lookupPick('editPage', '{0}_lkid', '{0}', '', '{1}', '{2}', 'null', '')
            //debugger;
            //top.window.opener.setParticipator('participantor', 'participantor_lkid', names, values);
            window.close();
        }
    </script>
    <script src="/jslibrary/sfdc/Security.js"></script>
</head>
<body class="hasMotif homeTab popup popupTab brandNoBgrImg EmailCCBccLookup">
    <form onsubmit="javascript:saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');if (window.ffInAlert) { return false; }"
    name="editPage" method="post" id="editPage">
    <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
    <input type="hidden" value="" id="duel0" name="duel0" />
    <input type="hidden" value="" id="duel1" name="duel1" />
    <input type="hidden" value="" id="duel1_name" name="duel1_name" />
    <input type="hidden" value="" id="parentId" name="parentId" />
    <script>        sfdcPage.updateDirtyState(GenericSfdcPage.STATE_DIRTY);</script>
    <div class="bPageTitle">
        <div class="ptBody secondaryPalette">
            <div class="content">
                <img title="主页" class="pageTitleIcon" alt="主页" src="/s.gif"><h1>
                    查找各种类型下的联系人</h1>
            </div>
        </div>
    </div>
    <div class="bDescription">
        选择类型，查询出对应的类型列表。</div>
    <div class="bFilter">
        类型：&nbsp;<select title="小组类型" onchange="filterType(this.value)" name="sharing_search"
                id="sharing_search">
                <option value="P">我的通讯录</option>
                <option value="O">局同事</option>                
                <!--<option value="U">用户</option>-->
                <option value="S">公用通讯录</option>
                <!-- <option value="A">角色</option>
               
                                                <option value="D">角色、内部和入口网站下属</option>
                                                <option value="I">角色和内部下属</option>-->
            </select>&nbsp;&nbsp;<label for="searchValue_sharing_search">包含：</label>&nbsp;
        <select id="type_List" name="type_List" onchange="typeChange(this.value)">
        </select>
        <br />
        <div id="error_duel_select_0" class="errorMsg" style="visibility: hidden;">
        </div>
    </div>
    <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock bLayoutBlock secondaryPalette">
        <div class="pbHeader">
            <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <td class="pbTitle">
                            <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                选择</h2>
                        </td>
                        <td id="topButtonRow" class="pbButton">
                            <input type="button" name="save" title="确定" class="primary btn" value=" 确定 " onclick="saveSelection()" />
                            <!--<input type="submit" name="cancel" title="取消" class="btn" value=" 取消 " />-->
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="pbBody">
            <div style="display: none" id="errorDiv_ep" class="pbError">
                错误：无效数据。<br />
                请查看下列所有错误消息以纠正数据。</div>           
            <div class="pbSubsection">
                <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                    <tbody>                       
                        <tr class="detailRow">
                            <td colspan="4">                                
                                <div id="duel" class="duelingListBox">
                                    <div style="display: none" id="editPage_duel_errorMsg" class="errorMsg">
                                    </div>
                                    <div>
                                    </div>
                                    <div>
                                        &nbsp;&nbsp;<label for="searchValue_sharing_search">搜索：</label>
                                        <input type="text" size="20" onpropertychange="duel_select_0Var.handlePropertyChange();"
                                            onkeydown="return duel_select_0Var.handleKeyDown(event);" name="searchValue_sharing_search"
                                            maxlength="80" id="searchValue_sharing_search" />&nbsp;<input type="button" title="查找"
                                                onclick="duel_select_0Var.doSearch();" name="go_duel_select_0" id="go_duel_select_0Var"
                                                class="btn" value=" 查找 " />
                                    </div>
                                    <table class="layout">
                                        <tbody>
                                            <tr>
                                                <td class="selectCell">
                                                    <div class="selectTitle">
                                                        <label for="duel_select_0">
                                                            可用</label></div>
                                                    <select size="12" name="duel_select_0" multiple="multiple" id="duel_select_0">
                                                    </select>
                                                </td>
                                                <td class="zen-phs buttonCell">
                                                    <div class="text">
                                                        添加</div>
                                                    <div class="zen-mbs text">
                                                        <a id="duel_select_0_right" href="javascript:if (!document.getElementById('duel_select_0').disabled&amp;&amp; !document.getElementById('duel_select_1').disabled) {duel_select_0Var.beforeMoveRight();;window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_0, document.editPage.duel_select_1,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');}">
                                                            <img title="添加" class="rightArrowIcon" alt="添加" src="/s.gif" /></a></div>
                                                    <div class="text">
                                                        <a id="duel_select_0_left" href="javascript:if (!document.getElementById('duel_select_0').disabled&amp;&amp; !document.getElementById('duel_select_1').disabled) {window.editPage_DLBEInstance.instMoveOption(document.editPage.duel_select_1, document.editPage.duel_select_0,'--无--', [], null,'--无--',false,null,'editPage_duel_errorMsg');duel_select_0Var.moveLeft();}">
                                                            <img title="删除" class="leftArrowIcon" alt="删除" src="/s.gif" /></a></div>
                                                    <div class="duelingText">
                                                        删除</div>
                                                </td>
                                                <td class="selectCell">
                                                    <div class="selectTitle">
                                                        <label for="duel_select_1">
                                                            已选者：</label></div>
                                                    <select size="12" name="duel_select_1" multiple="multiple" id="duel_select_1">
                                                    </select>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <script>                                        window.editPage_DLBEInstance = new DuelingListBoxesElement(['duel_select_0', 'duel_select_1'], 'editPage_duel_errorMsg');</script>
                                </div>
                            </td>
                        </tr>
                        <tr class="last detailRow"><td colspan="4"><div class="pbBottomButtons"> <input type="button" name="save" title="确定" class="primary btn" value=" 确定 " onclick="saveSelection();return false" />
                            <input type="button" name="cancel" title="取消" class="btn" value=" 取消 " onclick="window.close();" ></div></td></tr>
                    </tbody>
                </table>
            </div>
        </div>       
        <div class="pbFooter secondaryPalette">
            <div class="bg">
            </div>
        </div>
    </div>
    <script>        if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "cancel"]); }</script>
    <script type="text/javascript">

        var duel_select_0Var = new SelectFilterElement("sharing_search", "S", "duel_select_0", "", "duel_select_1", 100, true, null);

        var existingSelduel_select_0 = document.getElementById('duel_select_1');
        //duel_select_0Var.addOptions(false, [['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, ''], ['R', '小组：开发一组组', 'R:00G90000001c3rI', '开发一组组', existingSelduel_select_0, ''], ['R', '所有内部用户', 'R:00G90000002JvmL', '所有内部用户', existingSelduel_select_0, ''], ['R', '所有客户入口网站用户', 'R:00G90000001dC8o', '所有客户入口网站用户', existingSelduel_select_0, ''], ['U', '用户：liu jack', 'U:0059000000390Wh', 'liu jack', existingSelduel_select_0, ''], ['U', '用户：liu lan', 'U:005900000039oIN', 'liu lan', existingSelduel_select_0, ''], ['U', '用户：站点来宾用户 公司网站', 'U:005900000039Sll', '站点来宾用户 公司网站', existingSelduel_select_0, ''], ['A', '角色：CEO', 'A:00G90000002JvmM', 'ceo', existingSelduel_select_0, ''], ['A', '角色：CFO', 'A:00G90000002Jvma', 'cfo', existingSelduel_select_0, ''], ['A', '角色：COO', 'A:00G90000002Jvmu', 'coo', existingSelduel_select_0, ''], ['A', '角色：Channel Sales Team', 'A:00G90000002Jvmg', 'channel sales team', existingSelduel_select_0, ''], ['A', '角色：Customer Support, International', 'A:00G90000002Jvmo', 'customer support, international', existingSelduel_select_0, ''], ['A', '角色：Customer Support, North America', 'A:00G90000002Jvme', 'customer support, north america', existingSelduel_select_0, ''], ['A', '角色：Director, Channel Sales', 'A:00G90000002JvmY', 'director, channel sales', existingSelduel_select_0, ''], ['A', '角色：Director, Direct Sales', 'A:00G90000002JvmS', 'director, direct sales', existingSelduel_select_0, ''], ['A', '角色：Eastern Sales Team', 'A:00G90000002Jvmm', 'eastern sales team', existingSelduel_select_0, ''], ['A', '角色：Installation &amp; Repair Services', 'A:00G90000002Jvmk', 'installation &amp; repair services', existingSelduel_select_0, ''], ['A', '角色：Marketing Team', 'A:00G90000002Jvmi', 'marketing team', existingSelduel_select_0, ''], ['A', '角色：SVP, Customer Service &amp; Support', 'A:00G90000002JvmW', 'svp, customer service &amp; support', existingSelduel_select_0, ''], ['A', '角色：SVP, Human Resources', 'A:00G90000002Jvms', 'svp, human resources', existingSelduel_select_0, ''], ['A', '角色：SVP, Sales &amp; Marketing', 'A:00G90000002JvmO', 'svp, sales &amp; marketing', existingSelduel_select_0, ''], ['A', '角色：VP, International Sales', 'A:00G90000002Jvmq', 'vp, international sales', existingSelduel_select_0, ''], ['A', '角色：VP, Marketing', 'A:00G90000002JvmU', 'vp, marketing', existingSelduel_select_0, ''], ['A', '角色：VP, North American Sales', 'A:00G90000002JvmQ', 'vp, north american sales', existingSelduel_select_0, ''], ['A', '角色：Western Sales Team', 'A:00G90000002Jvmc', 'western sales team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：CEO', 'D:00G90000002JvmN', 'ceo', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：CFO', 'D:00G90000002Jvmb', 'cfo', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：COO', 'D:00G90000002Jvmv', 'coo', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Channel Sales Team', 'D:00G90000002Jvmh', 'channel sales team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Customer Support, International', 'D:00G90000002Jvmp', 'customer support, international', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Customer Support, North America', 'D:00G90000002Jvmf', 'customer support, north america', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Director, Channel Sales', 'D:00G90000002JvmZ', 'director, channel sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Director, Direct Sales', 'D:00G90000002JvmT', 'director, direct sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Eastern Sales Team', 'D:00G90000002Jvmn', 'eastern sales team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Installation &amp; Repair Services', 'D:00G90000002Jvml', 'installation &amp; repair services', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Marketing Team', 'D:00G90000002Jvmj', 'marketing team', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Customer Service &amp; Support', 'D:00G90000002JvmX', 'svp, customer service &amp; support', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Human Resources', 'D:00G90000002Jvmt', 'svp, human resources', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：SVP, Sales &amp; Marketing', 'D:00G90000002JvmP', 'svp, sales &amp; marketing', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：VP, International Sales', 'D:00G90000002Jvmr', 'vp, international sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：VP, Marketing', 'D:00G90000002JvmV', 'vp, marketing', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：VP, North American Sales', 'D:00G90000002JvmR', 'vp, north american sales', existingSelduel_select_0, ''], ['D', '角色、内部和入口网站下属：Western Sales Team', 'D:00G90000002Jvmd', 'western sales team', existingSelduel_select_0, ''], ['I', '角色和内部下属：CEO', 'I:00G90000001dC8z', 'ceo', existingSelduel_select_0, ''], ['I', '角色和内部下属：CFO', 'I:00G90000001dC96', 'cfo', existingSelduel_select_0, ''], ['I', '角色和内部下属：COO', 'I:00G90000001dC8s', 'coo', existingSelduel_select_0, ''], ['I', '角色和内部下属：Channel Sales Team', 'I:00G90000001dC93', 'channel sales team', existingSelduel_select_0, ''], ['I', '角色和内部下属：Customer Support, International', 'I:00G90000001dC8v', 'customer support, international', existingSelduel_select_0, ''], ['I', '角色和内部下属：Customer Support, North America', 'I:00G90000001dC8r', 'customer support, north america', existingSelduel_select_0, ''], ['I', '角色和内部下属：Director, Channel Sales', 'I:00G90000001dC8y', 'director, channel sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：Director, Direct Sales', 'I:00G90000001dC92', 'director, direct sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：Eastern Sales Team', 'I:00G90000001dC95', 'eastern sales team', existingSelduel_select_0, ''], ['I', '角色和内部下属：Installation &amp; Repair Services', 'I:00G90000001dC8u', 'installation &amp; repair services', existingSelduel_select_0, ''], ['I', '角色和内部下属：Marketing Team', 'I:00G90000001dC8w', 'marketing team', existingSelduel_select_0, ''], ['I', '角色和内部下属：SVP, Customer Service &amp; Support', 'I:00G90000001dC90', 'svp, customer service &amp; support', existingSelduel_select_0, ''], ['I', '角色和内部下属：SVP, Human Resources', 'I:00G90000001dC8t', 'svp, human resources', existingSelduel_select_0, ''], ['I', '角色和内部下属：SVP, Sales &amp; Marketing', 'I:00G90000001dC94', 'svp, sales &amp; marketing', existingSelduel_select_0, ''], ['I', '角色和内部下属：VP, International Sales', 'I:00G90000001dC8x', 'vp, international sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：VP, Marketing', 'I:00G90000001dC8q', 'vp, marketing', existingSelduel_select_0, ''], ['I', '角色和内部下属：VP, North American Sales', 'I:00G90000001dC8p', 'vp, north american sales', existingSelduel_select_0, ''], ['I', '角色和内部下属：Western Sales Team', 'I:00G90000001dC91', 'western sales team', existingSelduel_select_0, '']]); 
        //duel_select_0Var.addOptions(false, []);
        if (existingSelduel_select_0.options.length == 0) {
            existingSelduel_select_0.options[0] = new Option('--无--', '');
        }

    </script>
    <script type="text/javascript">
        var loadO = false;
        var loadP = false;
        var loadS = false;
        function filterType(t) {
            var typeList = document.getElementById("type_List");
            jQuery('#type_List').find('option').remove()
            typeList.add(new Option("--请选择--", ""));
            //debugger;
            if (t == "O") { //同事
                getDepartments(fillList);
                getAddressLists(fillUserList, t, "", "");
                
            }
            if (t == "P") {//我的通讯录
                getAddressLists(fillUserList, t, "", "");
                
            }
            if (t == "S") { //公用
                getAddressLists(fillUserList, t, "", "");
                
            }

        }
        function fillList(data) {
            //debugger;
            var typeList = document.getElementById("type_List");
            if (data) {
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    typeList.add(new Option(item.name, item.id));
                }
            }
        }
        
        function typeChange(val) {
            var t = jQuery("#sharing_search").val();
            //alert(val);
            if (t == "O") { //同事
                //getAddressLists(fillUserList, t, "", "");
                //debugger
                getAddressLists(fillUserList, t, val, "");
            }
            /*
            if (t == "P") {//我的通讯录
            getAddressLists(fillUserList, t,"", "");
            }
            if (t == "S") { //公用
            getAddressLists(fillUserList, t, "", "");
            }
            */
        }
        function fillUserList(data) {
            var sele = document.getElementById("duel_select_0");
            jQuery('#duel_select_0').find('option').remove();
            var type = jQuery('#sharing_search').val();
            var arrData = new Array();
            var allowAdded = false;

            if (type == "S" && !loadS) {
                allowAdded = true;
                loadS = true;
            }
            if (type == "O" && !loadO) {
                allowAdded = true;
                loadO = true;
            }
            if (type == "P" && !loadP) {
                allowAdded = true;
                loadP = true;
            }
            
            if (data) {
                //debugger;
                for (var i = 0; i < data.length; i++) {
                    var item = data[i];
                    sele.add(new Option(item.name, item.id));

                    //['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, '']
                    if (allowAdded) {
                        var data2 = [type, item.name, type + ':' + item.id, item.name, existingSelduel_select_0, ''];
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
    </form>
</body>
</html>
