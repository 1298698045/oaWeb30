<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProcRuleCondition.aspx.cs" Inherits="WebClient.apps.wf.ProcRuleCondition" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title><%=EntityTitle%>: 流转条件 ~  - 流程管理 - 高效协同</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/FilterEdit.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-5-22 上午9:13", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Case';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
        <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <style>
        body
        {
            /*font-size: 100% !important;*/
            font-family: Arial,Helvetica,sans-serif,'宋体';
        }

            body.sfdcBody
            {
                background: none;
            }

        #contentWrapper
        {
            min-width: inherit !important;
        }
        .btn
        {
            height:25px;
        }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab filterEdit FilterEditPage sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <div id="contentWrapper">
        <!-- Start page content -->
        <!--saveAllSelected([ document.editPage.duel_select_0, document.editPage.duel_select_1 ], [ document.editPage.duel0, document.editPage.duel1 ], ',', '\\', '--无--');saveAllSelected([ document.editPage.colselector_select_0, document.editPage.colselector_select_1 ], [ document.editPage.colselector0, document.editPage.colselector1 ], ',', '\\', '--无--');-->
        <div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette">
            <form action="/apps/wf/ProcRuleCondition.aspx" id="editPage" method="post" name="editPage"
                onsubmit="javascript:if (window.ffInAlert) { return false; }">
                <input type="hidden" name="colselector0" id="colselector0" value="" />
                <input type="hidden" name="colselector1" id="colselector1" value="" />
                <input type="hidden" name="duel0" id="duel0" value="" />
                <input type="hidden" name="duel1" id="duel1" value="" />
                <input type="hidden" name="f_standalone" id="f_standalone" value="0" />
                <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                <div class="pbHeader">
                    <table>
                        <tr>
                            <td class="pbTitle">&nbsp;
                            </td>
                            <td class="pbButtonb">
                                <input value=" 保存 " class="primary btn" name="save" title="保存" type="submit"  /><input
                                    value=" 取消 " class="btn" name="cancel" title="取消" type="button" onclick="closeDialog(false)"/>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="pbBody">
                    <div class="pbSubblock"><!--
                        <div class="pbSubheader brandTertiaryBgr first tertiaryPalette">
                            <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                    class="requiredText"> = 必填信息</span></span></span><h3>步骤 1。输入视图名称</h3>
                        </div>-->
                        <div class="pbSubbody">
                            <table>
                                <tr>
                                    <td class="labelCol requiredInput">
                                        <label for="fname">
                                            <span class="requiredMark">*</span>名称:</label>
                                    </td>
                                    <td class="dataCol">
                                        <div class="requiredInput">
                                            <div class="requiredBlock">
                                            </div>
                                            <input id="fname" maxlength="40" name="fname" onblur="DeveloperNameInputElement.setName(this, document.getElementById(&#39;devname&#39;), &#39;View&#39;);"
                                                size="40" type="text" value="<%=QueryName%>" />
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="labelCol requiredInput">
                                        <label for="fname">
                                            <span class="requiredMark">*</span>执行顺序:</label>
                                    </td>
                                     <td class="dataCol">
                                        <div class="requiredInput">
                                            <div class="requiredBlock">
                                            </div>
                                            <input id="orderOfEvaluation" maxlength="2" name="orderOfEvaluation" 
                                                size="10" type="text" value="<%=OrderOfEvaluation%>" />
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                    <div class="pbSubblock">
                        <div class="pbSubheader brandTertiaryBgr tertiaryPalette">
                            <h3>设置转移条件</h3>
                        </div>
                        <div class="pbSubbody">
                            <table class="declarativeFilterTable">
                                <tr>
                                    <th scope="col">&nbsp;
                                    </th>
                                    <th scope="col">逻辑
                                    </th>
                                    <th scope="col">字段
                                    </th>
                                    <th scope="col">运算符
                                    </th>
                                    <th scope="col">值
                                    </th>
                                </tr>
                                <%=FilterConditionHTML%>
                            </table>
                            <input type="hidden" id="lookup" name="lookup" value="" /><span class="addRemoveControl"
                                id="frowButtons" style="display: none"><a href="javascript:addRow%28%29%3B" id="fAddRowLink">添加行</a><span
                                    class="greyedLink" id="fAddRowLinkGreyed">添加行</span>&nbsp;<a href="javascript:removeRow%28%29%3B"
                                        id="fRemoveRowLink">删除行</a><span class="greyedLink" id="fRemoveRowLinkGreyed">删除行</span></span><div
                                            class="addRemoveControl booleanFilterTopMargin">
                                            <script>                                                            var lastRow = 4; greyLink('fRemoveRowLink'); unGreyLink('fAddRowLink'); function onLoadBooleanFilter() { if (document.getElementById('bool_filter').value && document.getElementById('bool_filter_span').style.display == 'none') { toggleBooleanFilter(); } } function greyLink(linkId) { if (document.getElementById(linkId)) { document.getElementById(linkId).style.display = 'none'; document.getElementById(linkId + 'Greyed').style.display = ''; } } function unGreyLink(linkId) { if (document.getElementById(linkId)) { document.getElementById(linkId).style.display = ''; document.getElementById(linkId + 'Greyed').style.display = 'none'; } } function addRow() {
                                                                if (lastRow < 9) { toggleRow(++lastRow, true); } document.getElementById('fAddRowLink').blur();
                                                            } function removeRow() { if (lastRow > 4) { toggleRow(lastRow--, false); } document.getElementById('fRemoveRowLink').blur(); } function toggleRow(row, showing) { 
                                                                var displayRow = showing ? '' : 'none'; var x = row + 1; document.getElementById('frow' + x).style.display = displayRow; var op = document.getElementById('fop' + x); op.style.width = document.getElementById('fop' + 1).style.width; if (!showing) { document.getElementById('fcol' + x).selectedIndex = 0; document.getElementById('fop' + x).selectedIndex = 0; document.getElementById('fval' + x).value = ''; document.getElementById('flkp' + x).style.display = 'none'; } if (lastRow > 4) { unGreyLink('fRemoveRowLink'); } else greyLink('fRemoveRowLink'); if (lastRow < 9) { unGreyLink('fAddRowLink'); } else greyLink('fAddRowLink'); } function toggleBooleanFilter() { if (document.getElementById('fcol1').disabled) return; var bool_filter = document.getElementById('bool_filter_span'); var showing = (bool_filter.style.display == 'none'); var display = showing ? '' : 'none'; var displayRow = showing ? (isIE ? 'block' : 'table-row') : 'none'; if (document.getElementById('frowButtons')) { document.getElementById('frowButtons').style.display = displayRow; } bool_filter.style.display = display; document.getElementById('bool_filter_toggle').innerHTML = showing ? '清除高级选项' : '添加筛选逻辑'; if (!showing) { document.getElementById('bool_filter').value = ''; lastRow = 4; } else if (!document.getElementById('bool_filter').value || (document.getElementById('bool_filter').value == '')) { var initialBoolFilter = ''; for (var i = 0; i < 10; i++) { var x = i + 1; var colEle = document.getElementById('fcol' + x); if (typeof colEle.selectedIndex == 'number' ? colEle.selectedIndex != 0 : colEle.value.length > 0) { if (initialBoolFilter.length > 0) initialBoolFilter += ' AND '; initialBoolFilter += (i + 1); } } document.getElementById('bool_filter').value = initialBoolFilter; } var andVisibility = showing ? 'hidden' : 'visible'; for (var i = 0; i < 10; i++) { if (i >= 5 && !showing) toggleRow(i, showing); var x = i + 1; document.getElementById('f' + x).style.display = display; if (i < 4) document.getElementById('and' + x).style.visibility = andVisibility; } }</script>
                                            <a href="javascript:toggleBooleanFilter%28%29" id="bool_filter_toggle">添加筛选逻辑</a><br />
                                            <span id="bool_filter_span" style="display: none">
                                                <label for="bool_filter">
                                                    筛选器逻辑：</label><br />
                                                <input id="bool_filter" maxlength="120" name="bool_filter" size="80" type="text" />&nbsp;
                                                <a
                                                    href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                    class="tipsLink" title="提示 （新窗口）"><span class="helpLink brandTertiaryFgr">提示</span><img
                                                        src="/s.gif" alt="帮助" class="helpIcon" title="帮助" /></a><br />
                                                <img src="/img/zh/report_boolean_filter.gif" alt="使用过滤器打开以上提示链接，寻求帮助" width="533"
                                                    height="211" title="使用过滤器打开以上提示链接，寻求帮助" /><br />
                                            </span>
                                        </div>
                        </div>
                    </div>

                    <a autocomplete="off" name="searchAnchor"></a>
                </div>
                <div class="pbBottomButtons">
                    <table>
                        <tr>
                            <td class="pbTitle">&nbsp;
                            </td>
                            <td class="pbButtonb">
                                <input value=" 保存 " class="primary btn" name="save" title="保存" type="submit" /><input
                                    value=" 取消 " class="btn" name="cancel" title="取消" type="button" onclick="closeDialog(false)" />
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
            <div class="pbFooter secondaryPalette">
                <div class="bg">
                </div>
            </div>
        </div>
         <script type="text/javascript">
             function closeDialog(refreshParent) {
                 if (window.opener) {
                     window.opener.closeDialog(refreshParent);
                 } else {
                     window.parent.closeDialog(refreshParent);
                 }
             }
             </script>
        <script type="text/javascript">
            /*
            var type2ops = new Array();
            type2ops['Text'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
            type2ops['MultiLineText'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
            type2ops['HtmlMultiLineText'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
            type2ops['SimpleNamespace'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];
            type2ops['Phone'] = ['e', 'n', 'l', 'g', 'm', 'h', 'c', 'k', 's', 'i'];           
            var value2ops = new Array();
            value2ops['Topics'] = ['u', 'x'];
            var val2type = new Array(); val2type['CASES.CASE_NUMBER'] = 'AutoNumber'; val2type['ACCOUNT.NAME'] = 'Switchable_PersonName'; val2type['ACCOUNT.SITE'] = 'Text'; val2type['NAME'] = 'PersonName'; val2type['CONTACT.FIRST_NAME'] = 'Text'; val2type['CONTACT.LAST_NAME'] = 'Text'; val2type['CONTACT.ACCOUNT'] = 'Switchable_PersonName'; val2type['CASES.SUBJECT'] = 'Text'; val2type['CASES.STATUS'] = 'DynamicEnum'; val2type['CASES.PRIORITY'] = 'DynamicEnum'; val2type['CASES.TYPE'] = 'DynamicEnum'; val2type['CASES.ORIGIN'] = 'DynamicEnum'; val2type['CASES.NAME'] = 'Text'; val2type['CASES.EMAIL'] = 'Email'; val2type['CASES.COMPANY'] = 'Text'; val2type['CASES.REASON'] = 'DynamicEnum'; val2type['PARENT.CASE_NUMBER'] = 'AutoNumber'; val2type['CASES.CLOSED'] = 'Boolean'; val2type['CASES.ESCALATION_STATE'] = 'Boolean'; val2type['CASES.CREATED_DATE'] = 'DateTime'; val2type['CASES.CREATED_DATE_DATE_ONLY'] = 'DateTime'; val2type['CASES.LAST_UPDATE'] = 'DateTime'; val2type['CASES.LAST_UPDATE_DATE_ONLY'] = 'DateTime'; val2type['CASES.CLOSED_DATE'] = 'DateTime'; val2type['CORE.USERS.FIRST_NAME'] = 'Text'; val2type['CORE.USERS.LAST_NAME'] = 'Text'; val2type['CORE.USERS.ALIAS'] = 'Text'; val2type['OWNER_NAME'] = 'PersonName'; val2type['CREATEDBY_USER.ALIAS'] = 'Text'; val2type['UPDATEDBY_USER.ALIAS'] = 'Text'; val2type['CASES.CSS_EDITED'] = 'Boolean'; val2type['CASES.NEW_DATA'] = 'Boolean'; val2type['00N9000000CFoa1'] = 'Text'; val2type['00N9000000CFoa2'] = 'DynamicEnum'; val2type['00N9000000CFoa3'] = 'DynamicEnum'; val2type['00N9000000CFoa4'] = 'DynamicEnum'; val2type['ASSET.NAME'] = 'Text'; val2type['ASSET.SERIAL_NUMBER'] = 'Text'; val2type['ASSET.INSTALL_DATE'] = 'DateOnly'; val2type['Topics'] = 'Text';
            */
            //var oppLabels = new Array(); oppLabels['e'] = '等于'; oppLabels['n'] = '不等于'; oppLabels['s'] = '起始字符'; oppLabels['c'] = '包含'; oppLabels['k'] = '不包含'; oppLabels['l'] = '小于'; oppLabels['g'] = '大于'; oppLabels['m'] = '小于或等于'; oppLabels['h'] = '大于或等于'; oppLabels['u'] = '包括'; oppLabels['x'] = '不包括'; oppLabels['w'] = '在范围内'; var allOperators = ['e', 'n', 's', 'c', 'k', 'l', 'g', 'm', 'h', 'u', 'x', 'w'];
            var oppLabels = new Array(); oppLabels['eq'] = '等于'; oppLabels['neq'] = '不等于'; oppLabels['lt'] = '小于'; oppLabels['gt'] = '大于'; oppLabels['le'] = '小于或等于'; oppLabels['ge'] = '大于或等于'; oppLabels['beginswith'] = '起始字符'; oppLabels['contains'] = '包含'; oppLabels['not-like'] = '不包含'; /* oppLabels['u'] = '包括'; oppLabels['x'] = '不包括'; oppLabels['w'] = '在范围内';*/
            oppLabels['in'] = '范围'; oppLabels['not-in'] = '排除范围';
            var allOperators = ['eq', 'neq', 'lt', 'gt', 'le', 'ge', 'contains', 'not-like', 'beginswith', 'in'];

            var noneLabel;
            function updateOperator(sel, opSelName, lookupName)
            {
                var selObj = document.getElementById(opSelName);
                if (selObj.offsetWidth > 0) { selObj.style.width = selObj.offsetWidth + 'px'; }
                if (noneLabel == null && selObj.options[0].value.length == 0) noneLabel = selObj.options[0].text;
                var ops = null; var val = sel.options[sel.selectedIndex];
                if (val) ops = type2ops[val2type[val.value]];
                if (val.value in value2ops) ops = value2ops[val.value];
                if (ops == null) ops = allOperators;
                var currSelected = selObj.options[selObj.selectedIndex]; selObj.length = 0; var off = 0;
                if (noneLabel != null) {
                    off = 1; selObj.options[0] = new Option(noneLabel, '');
                    if (currSelected.value == '') { selObj.options[0].selected = true; }
                }
                for (var i = 0; i < ops.length; i++) {
                    var label = oppLabels[ops[i]]; if (label == null) continue;
                    var option = new Option(oppLabels[ops[i]], ops[i]); selObj.options[i + off] = option;
                    if (currSelected != null && currSelected.value == option.value) { option.selected = true; }
                }
                var idx = opSelName.substr(opSelName.length - 1, 1);
                var valControlName = 'fval' + idx;
                if (val2type[sel.value] == 'Date' || val2type[sel.value] == 'DateTime') {
                    //
                    //PricebookEntryfval0                                                                                   
                    jQuery("#" + valControlName).attr("onfocus", "DatePicker.pickDate(false, '" + valControlName + "', false);");
                    //alert(idx);
                }
                else {
                    jQuery("#" + valControlName).removeAttr("onfocus");
                }
                if (lookupName) {
                    console.log(val2type)
                    var valename = 'fval' + lookupName.split('flkp')[1]
                    $('#' + valename + '_lkid').remove()
                    //debugger;
                    if (val.value == 'Case.BusinessHours'
                        || val.value != 'MEMBER_STATUS' && val.value != 'CAMPAIGN_MEMBER.STATUS' && val.value != 'Lead.CampaignMemberStatus' && val2type[val.value] == 'StaticEnum'
                        || val2type[val.value] == 'DynamicEnum'
                        || val2type[val.value] == 'EnumOrId'
                        || val2type[val.value] == 'Division'
                        || val2type[val.value] == 'RecordType'
                        || val2type[val.value] == 'Boolean'){
                        document.getElementById(lookupName).style.display = '';
                        $('#' + lookupName).find('a').attr('href', 'javascript:openPopupFocus%28%27%27%2C%20%27filter_lookup%27%2C%20620%2C%20430%2C%20%27width%3D620%2Cheight%3D430%2Cresizable%3Dyes%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cscrollbars%3Dyes%2Cmenubar%3Dno%2Cdirectories%3Dno%2Clocation%3Dno%2Cdependant%3Dno%27%2C%20false%2C%20true%29%3BopenFilterLookupWindow%28%27editPage%27%2C%20%27%2Fui%2Flist%2FFilterLookupPage%27%2C%20%27fcol1%27%2C%20%27fval1%27%29%3B')
                        
                    }
                    else if (val.value == 'SystemUser.BusinessUnitId') {
                        var valename = 'fval' + lookupName.split('flkp')[1]
                        var name = 'WorkFlowFolderLookup'
                        $('#' + lookupName).find('a').attr('href', 
                            "javascript:openPopupFocus('', 'filter_lookup', 620, 430, 'width=620,height=430,resizable=yes,toolbar=no,status=no,scrollbars=yes,menubar=no,directories=no,location=no,dependant=no', false, true);"
                        + "openFilterLookupWindow('editPage', '/_ui/common/data/LookupPage?lkfm=editPage&lknm=" + valename + "&lktp=" + name + "&lksrch=', 'fcol1', 'fval1');")
                        document.getElementById(lookupName).style.display = '';
                        $('#' + valename).after('<input type="hidden" name="' + valename + '_lkid" id="' + valename + '_lkid" />')
                    }else{
                        document.getElementById(lookupName).style.display = 'none';
                       
                    }
                }
            }
            function selectNotNone(opSelName) { var selObj = document.getElementById(opSelName); if (selObj.selectedIndex == 0) selObj.selectedIndex = 1; }
            function initializeOperator(selName, colName, lookupName) {
                var obj = document.getElementById(colName);
                if (obj) {
                    obj = document.getElementById(selName);
                    if (obj != null) {
                        updateOperator(obj, colName, lookupName);
                    }
                }
            }
            function onLoadCriteria() {
                initializeOperator('fcol1', 'fop1', 'flkp1');
                initializeOperator('fcol2', 'fop2', 'flkp2');
                initializeOperator('fcol3', 'fop3', 'flkp3');
                initializeOperator('fcol4', 'fop4', 'flkp4');
                initializeOperator('fcol5', 'fop5', 'flkp5');
                initializeOperator('fcol6', 'fop6', 'flkp6');
                initializeOperator('fcol7', 'fop7', 'flkp7');
                initializeOperator('fcol8', 'fop8', 'flkp8');
                initializeOperator('fcol9', 'fop9', 'flkp9');
                initializeOperator('fcol10', 'fop10', 'flkp10');
            }
        </script>
        <!-- Body events -->
        <script type="text/javascript">                            function bodyOnLoad() { onLoadCriteria(); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
        <!-- End page content -->
    </div>
</body>
</html>
<!-- page generation time: 137ms -->
