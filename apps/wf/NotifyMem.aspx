<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotifyMem.aspx.cs" Inherits="WebClient.apps.wf.NotifyMem" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<html style="" class="  ext-strict">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>流程事务催办</title>
    <meta content="NO-CACHE" http-equiv="PRAGMA">
    <script src="/EXT/ext-3.3.3/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1427302984000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-3-29 上午9:21", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
</script>
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/elements.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/common.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/chatterCore.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/chatterExtended.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/HelpBubble.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/userEditContactInfo.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css">
    <script type="text/javascript">
//<![CDATA[
try{(function(){var w=self,l,p,o;if(w&&top){for(;w!==top&&(p=w.parent)&&p!==w&&(o=p.location)&&o.protocol===(l=w.location).protocol&&(o.host===l.host||(p.document&&p.document.domain===w.document.domain));w=p);if(w!==top)throw "";}({f:function(){document.documentElement?document.documentElement.style.display="":(!this.a&&(this.a=10),this.a<1E5&&(window.sfdcRetryShowWindow=this)&&setTimeout("sfdcRetryShowWindow.f()",this.a),this.a*=2)}}.f())})();}catch(e){if(top!==self)top.location=location;else throw e;}//]]&gt;</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '124.202.191.4', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F_ui%2Fcore%2Fuserprofile%2FContactInfoEditPage%3Fu%3D0059000000390Wh%26focus%3Demail');</script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif userTab  ContactInfoEditPage  ext-gecko ext-gecko3"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
    <script>        //     chatter.getToolbox().setToken('m492d9Tx3qDlT8kp_w4YJdY7pXsTCm.PcNNESclFh92HIGrJP8HiNSG7d4odnDFM3Byti1G8hJS8StVRLxid_pKb4uyugqrpYyPTwJOLFoSJ1bX5MOrNasBS5DeWUHsRJyYRNFZ0pTQnnhcN_bZgT5TdQFE=');</script>
    <script>
        Sfdc.onload(function () {
            // Max length handler
            Sfdc.each(Sfdc.select('.input-max-length'), function (el) {
                var maxLength = el.getAttribute('data-maxLength');
                var errorText = el.getAttribute('data-errorMessage');
                Sfdc.on(el, 'keyup', function () {
                    chatter.getToolbox().validateTextFieldLength(el, {
                        maxlength: maxLength,
                        msg: errorText
                    });
                });
            });

            SfdcCmp.init(document.body);

            SfdcCmp.onBind(Sfdc.get("TabPanel"), function (event) {
                this.selectTab(Sfdc.get(aboutTab));
            });
        });

        function closeDialog(refreshParent) {
            if (window.opener) {
                window.opener.closeDialog(refreshParent);
            } else {
                window.parent.closeDialog(refreshParent);
            }
        }

        function resizeOverlay(height, width) {
            var handle = window.opener ? window.opener : window.parent;
            handle.resizeDialog(height, width);
        }

        function validateAndSave() {
            /*
            var newEmailValue = document.getElementById("email").value.toLowerCase();
            if (newEmailValue != "" && newEmailValue != "jackliu185@sina.com".toLowerCase()) {
            if (confirm('为确保系统安全，新电子邮件地址的所有人必须验证此更改。\n\n当单击\"确定\"时，将向指定地址发送一封电子邮件，其中包含确认此更改的指导。\n\n如果您不想进行此更改，则请单击\"取消\"。')) {
            trackActivityInOmniture('profile-info-edit');
            document.forms['formname'].submit();
            }
            } else {
            trackActivityInOmniture('profile-info-edit');
            document.forms['formname'].submit();
            }
            */
            var msg = document.getElementById("aboutMe").value;
            if (msg == "") {
                alert("请输入消息!");
                return false;
            }
            else {
                alert("催办消息发送成功!");
                document.forms['formname'].submit();
            }
        }

        function trackActivityInOmniture(activity) {
            Sfdc.require("SfdcApp.Omni.Config", function (OmniConfig) {
                OmniConfig.trackActivity(activity);
            });
        }

        function focusInput() {
            var element = document.getElementById('email');
            if (element && isTabPanelElementVisible(element)) {
                element.focus();
                return;
            }
            var elements = document.getElementsByTagName('input');
            for (var i = 0; (elements[i] != null); i++) {
                var elementType = elements[i].type;
                if (elementType && elementType.indexOf('hidden') == -1 && isTabPanelElementVisible(elements[i])) {
                    elements[i].focus();
                    return;
                }
            }
        }

        function isTabPanelElementVisible(el) {
            if (el.className.search("hidden") >= 0 || el.parentNode.tagName.toLowerCase() == 'body') {
                return false;
            }
            return el.className.search("zen-current") >= 0 || isTabPanelElementVisible(el.parentNode);
        }

        function changePref(id, value) {
            var checkbox = document.getElementById(id);
            if (checkbox) {
                checkbox.checked = value ? "checked" : "";
            }
        }

        function displayNoteBelowCompanyField(companyField) {
            if (companyField && companyField.value.length === 0) {
                var companyNoteDiv = document.getElementById('companyFieldEmptyNote');
                companyNoteDiv.style.display = "block";
            }
        }

        function hideNoteBelowCompanyField(companyField) {
            if (companyField && companyField.value.length !== 0) {
                //Using a timeout since there's a race condition with save button, resulting in having to click 'save' twice
                setTimeout(function () {
                    var companyNoteDiv = document.getElementById('companyFieldEmptyNote');
                    companyNoteDiv.style.display = "none";

                }, 100);
            }
        }
</script>
    <div class="zen">
        <div data-sfdc-widget="SfdcCmp.Ui.Tabs" id="TabPanel" class="zen-box zen-tabs zen-simpleTabs"
            data-uidsfdc="22">
            <div class="zen-inner">
                <div class="zen-header">
                    <ul role="tablist" class="zen-tabControl">
                        <li id="aboutTab" role="presentation" data-uidsfdc="20" class="zen-current"><a tabindex="0"
                            aria-selected="false" aria-controls="TabPanel:0:Body:1" role="tab" href="javascript:void(0);">
                            催办 </a></li><!--
                        <li id="contactTab" role="presentation" data-uidsfdc="21" class=""><a tabindex="-1"
                            aria-selected="false" aria-controls="TabPanel:0:Body:2" role="tab" href="javascript:void(0);">
                            知会 </a></li>-->
                    </ul>
                </div>
                <div class="zen-body">
                    <form method="post" action="/apps/wf/NotifyMem.aspx" name="formname" class="zen-form zen-labelMedium zen-skinnyForm">
                     <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                    <ul role="presentation" class="zen-tabBody">
                        <li id="TabPanel:0:Body:1" aria-expanded="false" role="tabpanel" class="zen-current">
                          <div class="zen-mtm zen-line">
                                <div class="field_communityNickname zen-lastUnit zen-unit">
                                    <div class="zen-line">
                                        <div class="zen-size3of5 zen-unit">
                                            <label for="communityNickname" class="zen-label">
                                                通知方式</label></div>
                                        <div class="zen-size2of5 optionContainer zen-unit">
                                        </div>
                                    </div>
                                    <div style="text-align:center; vertical-align:middle">
                                    <table style="text-align:left; font-size:13px; vertical-align:middle">
                                        <tr>
                                            <td style="text-align:center;  vertical-align:middle; height:20px;"><input type="checkbox"  name="chkSms"   id="chkSms" value="2"  />短信</td> <td><!--<input type="checkbox"  name="chkEmail"   id="chkEmail" value="1"  checked />邮件--></td>
                                            <td><input type="checkbox"  name="chkMessage"   id="chkMessage" value="3"  checked />即时消息</td>
                                        </tr>
                                    </table>                                   
                                   </div></div>
                            </div>
                            <div class="zen-mtm zen-line">
                                <div class="zen-lastUnit field_aboutMe zen-unit">
                                    <div class="zen-line">
                                        <div class="zen-size3of5 zen-unit">
                                            <label for="aboutMe" class="zen-label">
                                                催办消息</label></div>
                                        <div class="zen-size2of5 optionContainer zen-unit">
                                        </div>
                                    </div>
                                    <textarea type="text" rows="6" placeholder="输入催办信息，通过短信与邮件发送给办理人。" name="aboutMe"
                                        id="aboutMe" data-maxlength="1000" data-errormessage="您的“催办消息”信息不能超过 1000 个字符。"
                                        cols="75" class="input-max-length zen-inputFull aboutMeTextarea zen-input aboutMe"
                                        data-uidsfdc="18"><%=MsgTemplate%></textarea><div style="display: none;" class="errorMsg">
                                        </div>
                                </div>
                            </div>
                        </li>
                        <!--<li id="TabPanel:0:Body:2" aria-expanded="true" role="tabpanel" class=""></li>-->
                    </ul>
                    <div class="net-buttons zen-mtl">
                        <input type="button" value="发送催办" class="zen-btn zen-primaryBtn zen-pas" onclick="javascript: validateAndSave();">
                        <input type="button" value="取消" class="zen-btn zen-pas" onclick="javascript: closeDialog(false);"
                            id="editContactInfoCancelButton">
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script>
        // displayNoteBelowCompanyField(document.getElementById("companyName"));
        setTimeout("focusInput();", 10);
</script>
    <!-- Body events -->
    <script type="text/javascript">        function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "Zc3ZSU1G_5L1SDn.Ax7vmGtTwj.nKBA6dXAuZd_CEQupPe3P4fT_xZJCG8YoijzsAZ5Ewmq9IeAnlySYG3nTh01XbBgcRyFQHy6drrBOpBydJzpt82MhH5gl9Rz39jKs6OpDhfxp2gYGkjXqoDidMxq0sl_e2FZRSS_7TPTlSA.XeWNbUbRo5yqzMbx2n6AHduebTQ=="; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { closePopup(); focusInput(); } function bodyOnUnload() { closePopup(); focusInput(); }</script>
    <script src="/jslibrary/sfdc/ChatterDefer.js" defer="true"></script>
    <script src="/jslibrary/sfdc/Zen.js" defer="true"></script>
</body>
</html>
