<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppWFInstance.aspx.cs" Inherits="WebClient.apps.wf.AppWFInstance" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="ext-strict">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程事务: 创建事务 ~ .com - Professional Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/base/dStandard.css">
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/dCustom0.css" rel="stylesheet"
        type="text/css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/extended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css">
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/GuidedTour.js"></script>
    <script>        window.sfdcPage = new OverviewPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1410887776000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-09-25 下午3:21", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-MM-dd ah:mm", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterCore.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/GuidedTour.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/HelpBubble.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/chatterExtended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/ChatterFiles.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/Campaign.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1407124618000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/1410689799000/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/js/Business.js"></script>
</head>
<body class="hasMotif Custom18Tab massAddCampaignMemberWiz MassAddCampaignMembersSelectCampaignStage sfdcBody brandQuaternaryBgr"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outerNoSidebar" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="noSidebarCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img title="联系人" class="pageTitleIcon" alt="联系人" src="/s.gif" /><h1 class="pageType noSecondHeader">事务管理：创建事务</h1>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links">
                                            <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds('', false, false);">
                                                <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif" /></a>
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <br />
                        <script type="text/javascript">
                            function refreshProcessPage(val) {
                                getAllWfProcess(fillCategory, val);
                            }
                            function selectProcess(ele) {
                                var name = jQuery(ele).attr("processname");
                                var curUser = jQuery("#curentUser").val();
                                jQuery("#instanceName").val(name + " " + curUser);
                            }
                            function fillCategory(data) {
                                var html = "";
                                for (var i = 0; i < data.length; i++) {
                                    var item = data[i];
                                    if ((i % 2) == 0)
                                        html += "<tr class=\" dataRow even\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";
                                    else
                                        html += "<tr class=\" dataRow odd\" onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\">";


                                    html += "<td class=\" dataCell  \" scope=\"row\">";
                                    html += " <a title=\"预览 （新窗口）\" class=\"actionLink\" href=\"javascript:openPopupFocus('/apps/flowdesigner/editors/monitor2.aspx?schemeId=" + item.id + "', 'monitor', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false)\">预览</a></td>";

                                    html += " <td class=\"dataCell\">";
                                    html += "<input name=\"pr_template_id\" id=\"pr_template_idc" + item.id + "\" type=\"radio\" checked=\"\" value=\"" + item.id + "\" processname=\"" + item.name + "\" onclick='selectProcess(this)'><label for=\"pr_template_id" + item.id + "\">";
                                    html += item.name + "</label></td>";

                                    //html += " <td class=\"dataCell\"></td>";
                                    html += " <td class=\"dataCell\"></td>";
                                    html += "</tr>";
                                }
                                jQuery("#bodyList").html(html);
                            }
                            var dialogs = {};
                            function showPopupDialog(url, dialogName, dialogTitle, height, width) {
                                var c = b = null;
                                c = dialogName;// "notifyInstance";
                                //debugger;
                                b = url;
                                var dialog = null;
                                //var dialog = new CollaborationAccessibleDialog(c, '催办', b, 450, 530);
                                if (!dialogs[c]) {
                                    dialog = new NonaccessibleDialog(c, dialogTitle, b, height, width); //CollaborationAccessibleDialog
                                    dialogs[c] = dialog;
                                }
                                else {
                                    dialog = dialogs[c];
                                    dialog.url = b;
                                }
                                dialog.display();
                            }
                        </script>
                        <script>
                            var dialog = OverlayDialogElement.getDialog('appinstance_popup_');
                            dialog.isModal = true;
                            dialog.width = 500;
                            dialog.hasButtonsBar = true;
                            dialog.displayX = true;
                            dialog.allowKeyboardEsc = true;
                            dialog.extraClass = '';
                            dialog.isAbsolutePositioned = false;
                            dialog.refreshOnClose = false;
                            dialog.isMovable = true;
                            dialog.buttonContents = '\u003Cinput value=\" 保存 \"  class=\"btn\" id=\"invitee_picker_save_btn\" name=\"saveBtn\" onclick=\"Sfdc.Activity.PeoplePicker.invitee.onPickerDone();\" title=\"保存 (Ctrl-Enter)\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"invitee_picker_cancel_btn\" name=\"cancelBtn\" onclick=\"closeDialog();\" title=\"取消 (Esc)\" type=\"button\" /\u003E';
                            dialog.setTitle('创建事务');
                            dialog.contents = '\u003Cdiv class=\"overlay_panel\"\u003E\u003Cdiv class=\"upper_section\" id=\"appinstance_popup_header_label\"\u003E\u003C/div\u003E <table><tr><td><label style=\"font-weight: bold; font-size: 13px;\">流程：</label></td><td></td></tr><tr><td><label style=\"font-weight: bold; font-size: 13px;\">标题：</label></td><td><input style=\"width: 300px; height:25px;\" id=\"instanceName\" name=\"instanceName\" /></td></tr><tr><td><label style=\"font-weight: bold; font-size: 13px;\">办理期限：</label></td><td><input style=\"width: 80px;height:25px;\" id=\"instanceDeadline" name=\"instanceDeadline\" value=\"3\" />天数</td></tr><tr><td><label style=\"font-weight: bold; font-size: 13px;\">部门：</label></td>             <td>                    <!--dept--></td>            </tr>            <tr><td>             <label style=\"font-weight: bold; font-size: 13px;\">描述：</label></td> <td>                    <textarea name=\"desc\" id=\"desc\" rows=\"4\" cols=\"10\" style=\"width: 300px;\"></textarea></td>            </tr>        </table> \u003C/div\u003E';
                        </script>
                        <script type="text/javascript">
                            function showCreateInstanceDialog(procId, name) {
                                document.getElementById("instanceName").value = name;
                                OverlayDialogElement.getDialog('appinstance_popup_').show();
                            }
                            function closeDialog2()
                            {
                                OverlayDialogElement.getDialog('appinstance_popup_').cancel();
                            }
                        </script>
                        <style>
                            .recentFilesPanel .entityId {
                                display: none;
                            }
                            .listBlock
                            {
                                width: 250px;
                                list-style: outside none none;
                                margin: 0;
                                padding: 0;
                            }

                            .listBlock .vfButtonBar
                            {
                                background-color: transparent;
                                border-bottom: 1px solid #d7dbde;
                                line-height: 20px;
                                margin: 0 0 7px;
                                position: relative;
                                font-size: 1.0em;
                            }

                            .listBlock .vfButtonBar a
                            {
                                color: #015ba7;
                                float: right;
                                font-size: 1.0em;
                                text-decoration: none;
                            }

                            .listBlock a
                            {
                                color: #015ba7;
                                text-decoration: none;
                                word-wrap: break-word;
                                
                            }

                            .fileTypeIcon
                            {
                                position: relative;
                            }

                            .fileTypeIcon .sprite-doctype_image_16
                            {
                                background-position: 0 -312px;
                            }

                            .fileTypeIcon img
                            {
                                /*background: transparent url("/sfc/images/docicons/doctype_16_sprite.png?v=188-1") no-repeat scroll 0 0;*/
                                background: transparent url("/img/arrow_right_yellow.png") no-repeat scroll 0 0;
                                height: 16px;
                                width: 16px;
                            }

                            .listBlock .recentFilesItem
                            {
                                display: inline-block;
                                overflow: hidden;
                                text-overflow: ellipsis;
                                white-space: nowrap;
                                width: 215px;
                                border-bottom: 1px dashed #f0f0f0;
                                height: 30px;
                                line-height: 30px;
                                font-size:14px;
                            }
                            .listBlock .recentFilesItem:hover
                            {
                                background-color: #f0f0f0;
                            }
                            .listBlock .recentFilesItem
                            {
                                background-color: rgb(255, 255, 255);
                            }
                            .listBlock .recentFilesItem a
                            {
                                text-decoration:none;
                            }
                            .itemImg
                            {
                                margin-top:6px;
                                vertical-align:middle;
                                /*height: 30px;
                                line-height: 30px;*/
                            }
                        </style>
                        <div style="margin-left:15px; margin-right:15px;">
                        <%=ProcessHTML%></div>
                        <!-- Body events -->
                        <script type="text/javascript">
                            function bodyOnLoad() {
                                setFocusOnLoad();
                                if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); };
                                // if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, true); };
                                if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };;
                                //if (this.loadChatFrameJs) loadChatFrameJs(); 
                                //SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet");
                                //new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100);
                                //new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm");
                                //SfdcApp.MruHovers.global_data.url = 'retURL=%2Fui%2Fmasest=1&amp;renderMode=RETRO&amp;nocache=1411636986890';
                                if (document.getElementById('sidebarDiv')) {
                                    Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, false, false);
                                };
                                // if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; };
                            }
                            function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; }
                            function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>

            </table>
        </div>
        <cc1:PageFooter ID="SiteFooter1" runat="server" />
    </div>
    <script type="text/javascript" src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script type="text/javascript" src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>


