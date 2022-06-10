<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="meetingDetail.aspx.cs" Inherits="WebClient.apps.meetings.meetingDetail" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议 ：  ~  - Developer Edition</title>
     <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/rlHovers.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/DedupeCSS.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <!--<link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setupV2.css" rel="stylesheet" type="text/css" />-->
     <link href="/CSS/leftmenu.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/User.js"></script>
    <script type="text/javascript">

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = true;
        }
    </script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 window.sfdcPage = new DetailPage("0059000000390Wh");
        UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3", "dateFormat": "yyyy-M-d", "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "vfDomainPattern": "(?:[^.]+)*.ap1.visual.force.com", "auraDomain": "ap1.lightning.force.com", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1468018452000", "today": "2016-7-11 下午3:53", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
    </script>
    <script>             try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466024068000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466024068000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466024068000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466024068000/Theme3/zh/base/rlHovers.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466024068000/Theme3/zh/base/DedupeCSS.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466033002000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466033002000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466024068000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/37.0/sprites/1466024068000/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>             Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf');; });</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1466812160000/sfdc/Security.js"></script>
    <script>//ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '106.37.236.223', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F0059000000390Wh%3Fnoredirect%3D1%26isUserEntityOverride%3D1%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DPersonalInfo%26setupid%3DAdvancedUserDetails');</script>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif setupTab  detailPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <!-- Main Body Starts Here -->
     <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" /><div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
             <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv_setup">
            <table class="outer setupV2" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td class="oLeft">
                      <cc1:TabLeftMenu ID="SetupNavTree1" MenuName="meeting" runat="server" />
                    </td>
                    <td class="oRight" id="bodyCell"><a name="skiplink">
                        <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget" title="内容在此开始" /></a><div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img src="/s.gif" alt="" class="pageTitleIcon" title="" /><h1 class="noSecondHeader pageType">会议详细信息</h1>
                                    <div class="blank">&nbsp;</div>
                                </div>
                                <div class="links"><a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);" title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt="" class="helpIcon" /></a></div>
                            </div>
                            <div class="ptBreadcrumb"></div>
                        </div>
                        <script type="text/javascript">if (window.picklist) { picklist.initAll(); }</script>
                        <script type="text/javascript">
                        </script>
                        <div class="RLPanelShadow" id="RLPanelShadow">                            <div class="rls_top">                                <div class="rls_tl"></div><div class="rls_tr"></div></div>                           <div class="rls_l"></div>                            <div class="rls_r"></div>                            <div class="RLPanel" id="RLPanel" onblur="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onfocus="sfdcPage.getRelatedListPanel('RLPanel').showRL()" onmouseout="var toElement = (event.relatedTarget || event.toElement); if (toElement != null) sfdcPage.getRelatedListPanel('RLPanel').hideRLDelayed(null, 100)" onmouseover="sfdcPage.getRelatedListPanel('RLPanel').showRL()">                                <iframe frameborder="0" id="RLPanelFrame" name="RLPanelFrame" src="/emptyHtmlDoc.html" title="隐藏框架 - 忽略"></iframe>                            </div>                            <div class="rls_bottom">                                <div class="rls_bl"></div>                                <div class="rls_br"></div>                            </div>                        </div>                        <div class="listHoverLinks"><span class="invisibleMinHeight">|</span></div>
                        <script>try { sfdcPage.registerRelatedListPanel('RLPanel', false); } catch (e) { }</script>
                        <div class="bPageBlock brandSecondaryBrd bDetailBlock secondaryPalette" id="ep">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><h2 class="mainTitle">会议详细信息</h2>
                                        </td>
                                        <td class="pbButton" id="topButtonRow">
                                            <input value=" 编辑 " class="btn primary" name="edit" title="编辑" type="button" onclick=" navigateToUrl('/00V/e?id=<%=Request["id"]%>&retURL=', 'DETAIL', 'edit');" />
                                           <input value=" 邀请参会人 " class="btn" name="invite" title="邀请参会人" type="button" onclick="navigateToUrl('/meeting/mem/SelectSearch?addTo=<%=Request["id"]%>') " /> </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <div class="pbError" id="errorDiv_ep" style="display: none">错误：无效数据。<br />
                                    请查看下列所有错误消息以纠正数据。</div>
                                <div class="pbSubsection">                                    
                                    <%=FormHTML%>
                                </div>
                            </div>
                            <div class="pbBottomButtons">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" />&nbsp;</td>
                                        <td class="pbButtonb" id="bottomButtonRow">
                                            <input value=" 编辑 " class="btn primary" name="edit" title="编辑" type="button" onclick=" navigateToUrl('/00V/e?id=<%=Request["id"]%>&retURL=', 'DETAIL', 'edit');"  />
                                             <input value=" 邀请参会人 " class="btn" name="invite" title="邀请参会人" type="button" onclick="navigateToUrl('/meeting/mem/SelectSearch?addTo=<%=Request["id"]%>') " />
                                         </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg"></div>
                            </div>
                        </div>
                           <!-- Begin RelatedListElement -->
                        <div id="00U9000000z2Kju_RelatedEventAttendeeAccept" class="bRelatedList first">
                            <a name="00U9000000z2Kju_RelatedEventAttendeeAccept_target"></a>
                            <!-- Begin ListElement -->
                            <!-- motif: Event -->
                            <!-- WrappingClass -->
                            <div class="noStandardTab">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="12" height="1" title="" style="margin-right: 0.25em; margin-right: 0.25em; margin-right: 0.25em;" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3 id="00U9000000z2Kju_RelatedEventAttendeeAccept_title">已接受会议邀请</h3>
                                                    </td>
                                                    <td class="pbButton"><!--<a href="mailto:69839499@qq.com%3B?subject=test1">发送电子邮件</a>--></td>
                                                    <td class="pbHelp">&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="00U9000000z2Kju_RelatedEventAttendeeAccept_body" class="pbBody">
                                        <table cellspacing="0" cellpadding="0" border="0" class="list">
                                            <tbody>
                                                <tr class="headerRow">
                                                    <th class=" zen-deemphasize" scope="col">姓名</th>
                                                    <th class=" zen-deemphasize" scope="col">类型</th>
                                                    <th class=" zen-deemphasize" scope="col">留言</th>
                                                </tr> <!--                                             
                                                <tr onmouseover="if (window.hiOn){hiOn(this);}" onmouseout="if (window.hiOff){hiOff(this);}" onfocus="if (window.hiOn){hiOn(this);}" onblur="if (window.hiOff){hiOff(this);}" class="dataRow even last first">
                                                    <th class=" dataCell  " scope="row"><a href="/005900000039oIN">liu lan</a></th>
                                                    <td class=" dataCell  ">用户</td>
                                                    <td class=" dataCell  ">ok11</td>
                                                </tr>-->
                                            </tbody>
                                            <%=AttendeeAcceptHTML%>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <script>try { sfdcPage.registerRelatedList('00U9000000z2Kju_RelatedEventAttendeeAccept', '1', '已接受', false, '/00U9000000z2Kju', 'relatedListId=RelatedEventAttendeeAccept&amp;hideDL=1&amp;noh=1&amp;keepPref=1',false,false, true, 'RelatedEventAttendeeAccept');} catch(e) {}</script>
                            <!-- End ListElement -->
                        </div>
                        <div id="00U9000000z2Kju_RelatedEventAttendeeNotDecided" class="bRelatedList">
                            <a name="00U9000000z2Kju_RelatedEventAttendeeNotDecided_target"></a>
                            <!-- Begin ListElement -->

                            <!-- motif: Event -->

                            <!-- WrappingClass -->
                            <div class="noStandardTab">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="12" height="1" title="" style="margin-right: 0.25em; margin-right: 0.25em; margin-right: 0.25em;" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3 id="00U9000000z2Kju_RelatedEventAttendeeNotDecided_title">尚未响应</h3>
                                                    </td>
                                                    <td class="pbButton">&nbsp;</td>
                                                    <td class="pbHelp">&nbsp;</td>
                                                </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="00U9000000z2Kju_RelatedEventAttendeeNotDecided_body" class="pbBody">
                                        <table cellspacing="0" cellpadding="0" border="0" class="list">
                                           <tbody>
                                                <tr class="headerRow">
                                                    <th class=" zen-deemphasize" scope="col">姓名</th>
                                                    <th class=" zen-deemphasize" scope="col">类型</th>
                                                    <th class=" zen-deemphasize" scope="col">留言</th>
                                                </tr><!--
                                                <tr class="headerRow">
                                                    <th class="noRowsHeader" scope="col">所有出席者均已回复</th>
                                                </tr>-->
                                                <%=AttendeeNotDecidedHTML%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <script>try { sfdcPage.registerRelatedList('00U9000000z2Kju_RelatedEventAttendeeNotDecided', '0', '尚未响应', false, '/00U9000000z2Kju', 'relatedListId=RelatedEventAttendeeNotDecided&amp;hideDL=1&amp;noh=1&amp;keepPref=1',false,false, true, 'RelatedEventAttendeeNotDecided');} catch(e) {}</script>
                            <!-- End ListElement -->
                        </div>
                        <div id="00U9000000z2Kju_RelatedEventAttendeeDecline" class="bRelatedList">
                            <a name="00U9000000z2Kju_RelatedEventAttendeeDecline_target"></a>
                            <!-- Begin ListElement -->

                            <!-- motif: Event -->

                            <!-- WrappingClass -->
                            <div class="noStandardTab">
                                <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                                    <div class="pbHeader">
                                        <table cellspacing="0" cellpadding="0" border="0">
                                            <tbody>
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img width="12" height="1" title="" style="margin-right: 0.25em; margin-right: 0.25em; margin-right: 0.25em;" class="minWidth" alt="" src="/s.gif"><img title="" class="relatedListIcon" alt="" src="/s.gif"><h3 id="00U9000000z2Kju_RelatedEventAttendeeDecline_title">已拒绝</h3>
                                                    </td>
                                                    <td class="pbButton">&nbsp;</td>
                                                    <td class="pbHelp">&nbsp;</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="00U9000000z2Kju_RelatedEventAttendeeDecline_body" class="pbBody">
                                        <table cellspacing="0" cellpadding="0" border="0" class="list">
                                             <tbody>
                                                <tr class="headerRow">
                                                    <th class=" zen-deemphasize" scope="col">姓名</th>
                                                    <th class=" zen-deemphasize" scope="col">类型</th>
                                                    <th class=" zen-deemphasize" scope="col">留言</th>
                                                </tr><!--
                                                <tr class="headerRow">
                                                    <th class="noRowsHeader" scope="col">没有出席者拒绝</th>
                                                </tr>-->
                                                   <%=AttendeeDeclineHTML%>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="pbFooter secondaryPalette">
                                        <div class="bg"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="listElementBottomNav"></div>
                            <script>try { sfdcPage.registerRelatedList('00U9000000z2Kju_RelatedEventAttendeeDecline', '0', '已拒绝', false, '/00U9000000z2Kju', 'relatedListId=RelatedEventAttendeeDecline&amp;hideDL=1&amp;noh=1&amp;keepPref=1',false,false, true, 'RelatedEventAttendeeDecline');} catch(e) {}</script>
                            <!-- End ListElement -->
                        </div>
                        <%=RelatedListHTML%>
                           <!--
                        <div class="fewerMore">
                            <div class="backToTop"><a href="#skiplink" title="返回顶部">
                                <img src="/img/upToTop_caret.gif" alt="返回顶部" width="8" height="8" title="返回顶部" />返回顶部</a></div>
                            每一相关列表总是显示<a href="/0059000000390Wh?isUserEntityOverride=1&amp;noredirect=1&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo&amp;setupid=AdvancedUserDetails&amp;rowsperlist=10">更少<img src="/s.gif" alt="显示较少信息" class="fewerArrow" title="显示较少信息" /></a> /  <a href="/0059000000390Wh?isUserEntityOverride=1&amp;noredirect=1&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalInfo&amp;setupid=AdvancedUserDetails&amp;rowsperlist=20">
                                <img src="/s.gif" alt="显示更多信息" class="moreArrow" title="显示更多信息" />更多</a>  项记录</div>-->
                        <!-- Body events -->
                        <script type="text/javascript">function bodyOnLoad() { if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false); }; SetupTreeNode.prototype.initializeSetup(); if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); new GhostTextInputWrapperElement('setupSearch', '快速查找', 'quickfindInput', 'quickfindInput ghostText', null, null, true); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4Tmkwd055MHhORlF3TnpvMU16b3pNeTQyTWpOYSxzYmZreUY1UTRsdEZJcGVSdmtzZ2dJLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
       <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script>var SFDCSessionVars = { "uid": "0059000000390Wh", "server": "https://login..com/login/sessionserver202.html", "act": "u", "host": "", "oid": "00D90000000yvHG", "exp": 1468230719000 };</script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           var SFDCMktUrl = 'https://login.salesforce.com/17181/logo180.png';</script>
    <script defer="true" src="/jslibrary/1466812160000/sfdc/Setup.js"></script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1466812160000/sfdc/SfdcSessionBase202.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1466812160000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
</body>
</html>
<!-- page generation time: 236ms -->
