<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="rptPersonStat.aspx.cs" Inherits="WebClient.apps.wf.rptPersonStat" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html style="" class="" >
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>即办监督报表 ~  - Developer Edition</title>
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zen-componentsCompatible.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/elements.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/common.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/Reports.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css">
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css">
    <script type="text/javascript">
//<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/jslibrary/sfdc/Reports.js"></script>
    <script src="/jslibrary/sfdc/SfdcCmpAll.js"></script>
    <script>        window.sfdcPage = new Reports();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1435077876000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-6-30 下午3:17", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false}], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
</script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Report';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/Reports.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434999194000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1434061166000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link href="https://ap1.com/favicon.ico" rel="shortcut icon">
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //  ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '111.161.17.17', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F00O');</script>
</head>
<body onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" class="hasMotif reportTab  reportRunPage sfdcBody brandQuaternaryBgr"
    onunload="if(this.bodyOnUnload)bodyOnUnload();" onload="if(this.bodyOnLoad)bodyOnLoad();">
    <!-- Main Body Starts Here -->
    <cc1:sesstiontimeout id="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div id="AppBodyHeader" class="bPageHeader">
            <uc1:topright id="TopRight1" runat="server" />
            <uc1:mainnav id="MainNav1" runat="server" />
        </div>
        <div id="noTableContainer" class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="outerNoSidebar">
                <a name="skiplink">
                    <img height="1" width="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                        alt="内容在此开始" src="/s.gif"></a><div class="bPageTitle">
                            <div class="ptBody">
                                <div class="content">
                                    <img title="报表" class="pageTitleIcon" alt="报表" src="/s.gif"><h1 class="pageType noSecondHeader">
                                        即办监督报表</h1>
                                    <div class="blank">
                                        &nbsp;</div>
                                </div>
                                <div class="links">
                                    <a title="此页面的帮助 （新窗口）" href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);">
                                        <span class="helpLink">此页面的帮助</span><img class="helpIcon" alt="" src="/s.gif"></a></div>
                            </div>
                            <div class="ptBreadcrumb">
                            </div>
                        </div>
                <script>
                    var editorParamNames = [];
                    function getContainerName(parameterName) {
                        return 'container_' + parameterName;
                    }
                    function getIframeName(parameterName) {
                        return 'iframe_' + parameterName;
                    }

                    function edit_single_on(parameterName) {
                        if (!document.getElementById(parameterName)) {
                            return;
                        }
                        var container = document.getElementById(getContainerName(parameterName));
                        if (!container) {
                            return;
                        }

                        var iframeName = getIframeName(parameterName);
                        container.innerHTML = '<iframe title="HTML 正文" src="/email/wysiwyg/richtextbody.jsp" id="' + iframeName + '" width="100%" height="100%" frameborder="0" marginwidth="2" marginheight="2"></iframe>';

                        timedEditorOpen(parameterName, iframeName);

                        editorParamNames[editorParamNames.length] = parameterName;
                        modes[parameterName] = 'html';
                    }

                    //this was added because Safari 3 for Windows needs time to build the iframe
                    function timedEditorOpen(parameterName, iframeName) {
                        var editorDoc;
                        if (!isIE)
                            editorDoc = document.getElementById(iframeName).contentDocument;
                        else
                            editorDoc = document.getElementById(iframeName).contentWindow.document;

                        if (!editorDoc) {
                            setTimeout(function () { timedEditorOpen(parameterName, iframeName) }, 10);
                            return;
                        }

                        if (!isIE && !isSafari) {
                            editorDoc.designMode = 'on';
                        }
                        editorDoc.open();
                        editorDoc.write('<!DOCTYPE html><html><style>p{margin-top:0px; margin-bottom:0px;}</style><body bgcolor="#FFFFFF" marginwidth="2" marginheight="2" style="font-family:Arial;font-size:10pt;color:000000">');
                        editorDoc.write(document.getElementById(parameterName).value);
                        editorDoc.write('</body></html>');
                        editorDoc.close();
                        editorDoc.body.contentEditable = 'true';

                        if (isIE) {
                            // Bug: W-1443163
                            // In IE8 and IE9 it is not possible to click anywhere in the rich text editor and get
                            // the cursor for starting to input text. The problem is the body is not being defaulted
                            // to the same height as the iframe window. Defaulting the height to be larger so clicking
                            // anywhere in the rich text editor will get the cursor. NOTE: the table height is 220px. 
                            // Defaulting to less than 220 so that the scroll bar is not initially displayed. 216px
                            // looks to be the largest amount where the scroll bar is not displayed when the page loads.
                            editorDoc.body.style.height = '216px';
                        }

                        //see note on resetEditorEditable for why this is here
                        if (isFirefox && window.sfdcPage && UserContext && UserContext.uiSkin == UiSkin.ALOHA.apiValue) {
                            window.sfdcPage.appendToOnloadQueue(function () {
                                resetEditorEditable(editorDoc);
                            });
                        }
                    }

                    //This is for the Aloha skin. edit_single_on() runs before the genericSfdcPage onload queue (and the Aloha sizing js)
                    //The sizing js changes the display of contentWrapper to inline-block. There is a bug in firefox where execCommand()
                    // doesn't work if the display of a parent element is changed to inline-block after design mode was turned on.
                    //https://gus.soma.salesforce.com/a0790000000D3U2
                    function resetEditorEditable(editorDoc) {
                        if (editorDoc) {
                            if (!isIE && !isSafari) {
                                editorDoc.designMode = 'off';
                            }
                            editorDoc.body.contentEditable = 'false';

                            if (!isIE && !isSafari) {
                                editorDoc.designMode = 'on';
                            }
                            editorDoc.body.contentEditable = 'true';
                        }
                    }

                    function getRichTextValues() {
                        for (var i = 0; i < editorParamNames.length; i++) {
                            var parameterName = editorParamNames[i];
                            var theParameter = document.getElementById(parameterName);
                            if (theParameter) {
                                setCurrentParamName(parameterName);
                                if (!isModeHtml()) {
                                    switchMode();
                                }
                                var iframeName = getIframeName(parameterName);
                                var theIframe = document.getElementById(iframeName);
                                if (theIframe) {
                                    var innerVal = theIframe.contentWindow.document.body.innerHTML;
                                    theParameter.value = innerVal;
                                }
                            }
                        }
                    }


                    function getInnerHTMLContainer(parameterName) {
                        var theParameter = document.getElementById(parameterName);
                        if (theParameter) {
                            var iframeName = getIframeName(parameterName);
                            var theIframe = document.getElementById(iframeName);
                            if (theIframe) {
                                return theIframe.contentWindow.document.body;
                            }
                        }
                        return null;
                    }





                    var imageURL = '/widg/filepicker_fs.jsp?lktp=015&amp;otype=1&amp;fpimg=1&amp;maxImgSize=102400';
                    var secureImageURL = '/widg/filepicker_fs.jsp?lktp=015&amp;otype=1&amp;maxImgSize=102400';

                    /* For email template editing */
                    var editFrameName = null;
                    function registerEditFrameName(name) {
                        editFrameName = name;
                    }

                    var tableFrame = null;
                    function registerTableFrame(obj) {
                        tableFrame = obj;
                    }
                    var controlForm = null;
                    function registerControlForm(f) {
                        controlForm = f;
                    }

                    var currentParamName = null;
                    function setCurrentParamName(paramName) {
                        currentParamName = paramName;
                    }

                    function getDoc() {
                        var currentContentWindow = getContentWindow();
                        return ((currentContentWindow) ? currentContentWindow.document : null);
                    }

                    var contentWindow = null;

                    function getContentWindow() {
                        if (!currentParamName && !contentWindow) return null;

                        if (contentWindow)
                            return contentWindow;
                        else
                            return document.getElementById(getIframeName(currentParamName)).contentWindow;
                    }

                    function setContentWindow(newContentWindow) {
                        contentWindow = newContentWindow;
                    }

                    function isEditable() {
                        return getDoc() != null;
                    }

                    var modes = new Array();
                    function isModeHtml() {
                        return ((contentWindow != null) || (modes[currentParamName] == 'html'));
                    }

                    function setMode(m) {
                        modes[currentParamName] = m;
                    }

                    function switchMode() {
                        if (!isEditable()) return;

                        if (isModeHtml()) {
                            if (isIE) {
                                var iHTML = getDoc().body.innerHTML;
                                getDoc().body.innerText = iHTML;
                            } else {
                                var html = document.createTextNode(getDoc().body.innerHTML);
                                getDoc().body.innerHTML = "";
                                getDoc().body.appendChild(html);
                            }
                            document.getElementById(currentParamName + '_controls').style.display = 'none';
                            setMode('text');

                        } else {
                            if (isIE) {
                                var docBody = getDoc().body;
                                iText = docBody.innerText;
                                // When setting innerHTML with a string, IE strips the string of NoScope elements that aren't preceded by scoped elements,
                                // so we have to prepend a scoped element, set the innerHTML, then remove that element in order to preserve NoScope elements
                                docBody.innerHTML = "<div>*</div>" + iText;
                                docBody.removeChild(docBody.firstChild);
                            } else {
                                var html = getDoc().body.ownerDocument.createRange();
                                html.selectNodeContents(getDoc().body);
                                getDoc().body.innerHTML = html.toString();
                            }
                            setMode('html');
                            var displayHtmlBox = document.getElementById('displayHTML_' + currentParamName);
                            if (displayHtmlBox != null) {
                                displayHtmlBox.checked = false;
                            }
                            if (isIE) {
                                document.getElementById(currentParamName + '_controls').style.display = 'block';
                            } else {
                                document.getElementById(currentParamName + '_controls').style.display = 'table-row';
                            }
                        }
                    }

                    var notEditablePrompt = null;
                    function registerNotEditablePrompt(text) {
                        notEditablePrompt = text;
                    }

                    function format(strCommand, strOption) {
                        if (!isEditable()) {
                            if (notEditablePrompt) alert(notEditablePrompt);
                            return;
                        }
                        setSelectionRange();
                        if (!isModeHtml()) return;
                        if (strOption == 'removeFormat') {
                            strCommand = strOption;
                            strOption = null;
                        }
                        if (strCommand == 'BackColor' && !isIE) {
                            strCommand = 'hilitecolor';
                        }
                        getDoc().execCommand(strCommand, '', strOption);
                        resetSelectionRange();
                        getContentWindow().focus();
                    }

                    var selectLinkTextPrompt = "请选择要转换为链接的文本。";

                    function createLink(question, prefix) {
                        if (!isEditable()) {
                            if (notEditablePrompt) alert(notEditablePrompt);
                            return;
                        }
                        if (!isModeHtml()) return;
                        setSelectionRange();
                        if (isIE) {
                            if (currentRange.htmlText) {
                                var h = currentRange.htmlText.toLowerCase();
                                var s = h.indexOf('<a href="');
                                var e = h.indexOf('">');
                                if (s > -1 && e > -1 && e > s) {
                                    prefix = currentRange.htmlText.substring(s + 9, e);
                                }
                            }
                        }

                        if (currentSelection == 0 || (isIE && currentRange.boundingWidth == 0)) {
                            alert(selectLinkTextPrompt);
                            return;
                        }

                        var strLink = prompt(question, prefix);
                        if ((strLink != null) && (strLink != "http://")) {
                            format("CreateLink", strLink);
                        }
                        resetSelectionRange();
                        getContentWindow().focus();
                    }

                    var currentSelection = null;
                    var currentRange = null;
                    function setSelectionRange() {
                        if (isIE) {
                            getContentWindow().focus();
                            currentSelection = getDoc().selection;

                            if (currentSelection.type != 'Text' && currentSelection.type != 'None') return;

                            currentRange = currentSelection.createRange();

                            if (currentRange.parentElement() == window.document.body) {
                                getContentWindow().focus();
                                currentSelection = getDoc().selection;
                                currentRange = currentSelection.createRange();
                            }

                        } else {
                            currentSelection = getContentWindow().getSelection();

                            if (currentSelection.rangeCount > 0) {
                                currentRange = currentSelection.getRangeAt(0);
                            } else { //Safari doesn't give an empty selection a range
                                currentRange = getContentWindow().document.createRange();
                                currentRange.setStart(getContentWindow().document.body, currentSelection.anchorOffset);
                                currentRange.setEnd(getContentWindow().document.body, currentSelection.focusOffset);
                                currentSelection.addRange(currentRange);
                            }
                        }
                    }

                    function initSelectionRange() {
                        setSelectionRange();
                    }

                    function resetSelectionRange() {
                        currentSelection = null;
                        currentRange = null;
                    }

                    function frameVisible() {
                        var color = document.getElementById('colorPicker') != null && document.getElementById('colorPicker').style.visibility == 'visible';
                        var table = tableFrame != null && tableFrame.style.visibility == 'visible';
                        return (color || table);
                    }

                    var command = '';
                    function askForColor(buttonObj, commandIdent) {
                        if (!isEditable()) {
                            if (notEditablePrompt) alert(notEditablePrompt);
                            return;
                        }
                        if (!isModeHtml()) return;
                        if (frameVisible()) return;
                        setSelectionRange();

                        document.getElementById('colorPicker').style.left = getObjX(buttonObj) + "px";
                        document.getElementById('colorPicker').style.top = (getObjY(buttonObj) - 150) + "px";

                        document.getElementById('colorPicker').style.visibility = "visible";

                        command = commandIdent;
                    }

                    function formatColor(color) {
                        if (!isEditable()) return;
                        hideFrame(document.getElementById('colorPicker'));
                        getContentWindow().focus();
                        if (isIE) currentRange.select();
                        format(command, color);
                        resetSelectionRange();
                    }


                    function isInsertableImage() {
                        return !document.getElementById('imageURL');
                    }

                    function askForImageSecure(buttonObj, e) {
                        askForImage(buttonObj, e, true);
                    }

                    function askForImage(buttonObj, e, secure) {

                        if (!isEditable() && isInsertableImage()) {
                            if (notEditablePrompt) alert(notEditablePrompt);
                            return;
                        }
                        if (!isModeHtml()) return;
                        if (frameVisible()) return;

                        if (isInsertableImage()) setSelectionRange();

                        setLastMousePosition(e);
                        openPopup(secure ? secureImageURL : imageURL, 'attach', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', true);
                    }

                    function createImage(childForm) {
                        if (!isEditable()) return;
                        if (!isModeHtml()) return;
                        if (frameVisible()) return;

                        if (!childForm) {
                            resetSelectionRange();
                            return;
                        }

                        if (isInsertableImage()) {
                            img = getDoc().createElement("img");
                            img.setAttribute("src", childForm.isrc.value);
                            img.setAttribute("border", childForm.iborder.value);
                            img.setAttribute("align", "left");
                            img.setAttribute("alt", "");
                            insertNodeAtSelection(img);
                            resetSelectionRange();
                        } else {
                            document.getElementById('imageURL').value = '<img alt="" src="' + childForm.isrc.value + '" border=' + childForm.iborder.value + ' align=left>';
                        }
                    }

                    function createMergeField(mf) {
                        insertTextAtSelection(mf);
                    }

                    function insertTextAtSelection(text) {
                        if (!isEditable()) {
                            if (notEditablePrompt) alert(notEditablePrompt);
                            return;
                        }

                        if (!isModeHtml()) return;

                        getContentWindow().focus();
                        var textNode = document.createTextNode(text);
                        insertNodeAtSelection(textNode);
                    }

                    function askForTable(buttonObj) {
                        if (!isEditable()) return;
                        if (!isModeHtml()) return;
                        if (frameVisible()) return;
                        setSelectionRange();
                        tableFrame.style.visibility = "visible";
                        tableFrame.style.left = getObjX(buttonObj) + "px";
                        tableFrame.style.top = (getObjY(buttonObj) + buttonObj.scrollHeight) + "px";
                    }

                    function createTable(childForm) {
                        if (!childForm) {
                            tableFrame.style.visibility = "hidden";
                            resetSelectionRange();
                            return;
                        }
                        if (!isEditable()) return;
                        if (!isModeHtml()) return;
                        table = getDoc().createElement("table");
                        table.setAttribute("border", childForm.tborder.value);
                        table.setAttribute("cellpadding", childForm.tcellpadding.value);
                        table.setAttribute("cellspacing", childForm.tcellspacing.value);
                        table.setAttribute("bgcolor", childForm.tbgcolor.value);
                        table.setAttribute("width", childForm.twidth.value);
                        var rows = childForm.trows.value;
                        var cols = childForm.tcols.value;

                        for (var i = 0; i < rows; i++) {
                            tr = getDoc().createElement("tr");
                            for (var j = 0; j < cols; j++) {
                                td = getDoc().createElement("td");
                                br = getDoc().createElement("br");
                                td.appendChild(br);
                                tr.appendChild(td);
                            }
                            table.appendChild(tr);
                        }


                        getContentWindow().focus();
                        insertNodeAtSelection(table);
                        tableFrame.style.visibility = "hidden";
                        resetSelectionRange();

                    }

                    function insertNodeAtSelection(insertNode) {
                        if (!isEditable()) return;
                        if (isIE) {
                            insertNodeAtSelectionIE(insertNode);
                        } else {
                            insertNodeAtSelectionMozilla(insertNode);
                        }
                    }

                    function insertNodeAtSelectionIE(insertNode) {
                        function nodeToHTML(node) {
                            var html = "";
                            if (node.nodeType == 3) {
                                html = node.data;
                                html = html.replace(/&amp;/ig, "&amp;amp;");
                                html = html.replace(/</ig, "&amp;lt;");
                                html = html.replace(/>/ig, "&amp;gt;");
                                html = html.replace(/\"/ig, "&amp;quot;");
                            } else if (node.nodeType == 1 && node.tagName.toLowerCase() == 'img') {
                                var tagName = node.tagName.toLowerCase();
                                html = '<img alt="" src="' + node.getAttribute('src') + '" ';
                                html += ' border="' + node.getAttribute('border') + '" ';
                                html += ' align="' + node.getAttribute('align') + '">';
                            } else if (node.nodeType == 1 || node.nodeType == 11) {
                                var tagName = node.tagName.toLowerCase();
                                var separateCloseTagRequired = tagName == "script" || tagName == "style" || tagName == "div" || tagName == "span";
                                var closeTagOnStart = !node.hasChildNodes() && !separateCloseTagRequired;

                                html = "<" + tagName;

                                // Go thru all the attributes
                                for (var i = 0; i < node.attributes.length; ++i) {
                                    var attribute = node.attributes.item(i);
                                    if (!attribute.specified) { continue; }
                                    if (attribute.name) {
                                        var name = attribute.name.toLowerCase();
                                        var value = attribute.value;
                                        if (name == "style") { value = node.style.cssText.toLowerCase(); }
                                        html += " " + name + '="' + value + '"';
                                    }
                                }
                                if (closeTagOnStart) {
                                    html += " />";
                                } else {
                                    html += ">";
                                    for (var i = node.firstChild; i; i = i.nextSibling) { html += nodeToHTML(i); }
                                    html += "</" + tagName + ">";
                                }
                            }
                            return html;
                        }

                        if (!isIE) { return; }

                        var sel = getDoc().selection;
                        var range = sel.createRange();
                        if (currentRange && currentSelection) {
                            currentRange.pasteHTML(nodeToHTML(insertNode));
                            currentRange.select();
                            currentRange.collapse(false);
                        } else {
                            range.pasteHTML(nodeToHTML(insertNode));
                            range.select();
                            range.collapse(false);
                        }
                    }


                    function insertNodeAtSelectionMozilla(insertNode) {
                        if (isIE) { return; }
                        var sel = null;
                        var range = null;
                        if (!(currentRange && currentSelection))
                            setSelectionRange();

                        sel = currentSelection;
                        range = currentRange;

                        sel.removeAllRanges();
                        range.deleteContents();

                        var container = range.startContainer;
                        var pos = range.startOffset;
                        if (container.tagName && container.tagName.toUpperCase() == "HTML") {
                            for (var i = container.childNodes.length - 1; i >= 0; i--) {
                                if (container.childNodes[i].tagName.toUpperCase() == "BODY") {
                                    container = container.childNodes[i];
                                    break;
                                }
                            }
                        }

                        range = document.createRange();

                        if (container.nodeType == 3 && insertNode.nodeType == 3) {
                            // if we insert text in a textnode, do optimized insertion
                            container.insertData(pos, insertNode.nodeValue);

                            // put cursor after inserted text
                            range.setEnd(container, pos + insertNode.length);
                            range.setStart(container, pos + insertNode.length);
                        } else {
                            var afterNode;
                            if (container.nodeType == 3) {

                                // when inserting into a textnode
                                // we create 2 new textnodes
                                // and put the insertNode in between

                                var textNode = container;
                                container = textNode.parentNode;
                                var text = textNode.nodeValue;

                                // text before the split
                                var textBefore = text.substr(0, pos);
                                // text after the split
                                var textAfter = text.substr(pos);

                                var beforeNode = document.createTextNode(textBefore);
                                var afterNode = document.createTextNode(textAfter);

                                // insert the 3 new nodes before the old one
                                container.insertBefore(afterNode, textNode);
                                container.insertBefore(insertNode, afterNode);
                                container.insertBefore(beforeNode, insertNode);

                                // remove the old node
                                container.removeChild(textNode);

                            } else {
                                // else simply insert the node
                                afterNode = container.childNodes[pos];
                                container.insertBefore(insertNode, afterNode);
                            }

                            range.collapse(false);
                        }
                    };

                    function hideFrame(obj) {
                        obj.style.visibility = 'hidden';
                    }

                    function modifyMergeFieldSelect(cause, effect, stdOpts, custOpts) {
                        var isBrowserIE = navigator.appName.indexOf("Microsoft") != -1;

                        var selected = cause.options[cause.selectedIndex].value;
                        var s = stdOpts[cause.selectedIndex];
                        var c = custOpts[cause.selectedIndex];

                        effect.innerHTML = '';

                        var blankOption = new Option('', '');
                        if (isBrowserIE) {
                            effect.add(blankOption);
                        } else {
                            effect.add(blankOption, null);
                        }

                        if (c > 0) {
                            var optg = document.createElement('optgroup');
                            optg.label = '标准字段';
                            effect.appendChild(optg);

                            for (var j = 0; j < s; j++) {
                                var opt = document.createElement('option');
                                opt.text = s[j].text;
                                opt.innerHTML = s[j].text;
                                opt.value = s[j].value;
                                optg.appendChild(opt);
                            }

                            optg = document.createElement('optgroup');
                            optg.label = '自定义字段';
                            effect.appendChild(optg);

                            for (var j = 0; j < c; j++) {
                                var opt = document.createElement('option');
                                opt.text = c[j].text;
                                opt.innerHTML = c[j].text;
                                opt.value = c[j].value;
                                optg.appendChild(opt);
                            }
                        } else {
                            for (var j = 0; j < s; j++) {
                                var opt = document.createElement('option');
                                opt.text = s[j].text;
                                opt.innerHTML = s[j].text;
                                opt.value = s[j].value;
                                if (isBrowserIE) {
                                    effect.add(s[j]);
                                } else {
                                    effect.add(s[j], null);
                                }
                            }
                        }

                    }

                    // For the image picker
                    function submitFormNoSave() {
                    }


                    function getCursorPosition(field) {
                        if (document.selection) {
                            // The current selection
                            var range = document.selection.createRange();

                            // We'll use this as a 'dummy'
                            var stored_range = range.duplicate();

                            // Select all text
                            stored_range.moveToElementText(field);

                            // Now move 'dummy' end point to end point of original range
                            stored_range.setEndPoint('EndToEnd', range);

                            // Now we can calculate start and end points
                            var selectionStart = stored_range.text.length - range.text.length;
                            var selectionEnd = selectionStart + range.text.length;

                            return { start: selectionStart, end: selectionEnd };
                        } else {
                            return null;
                        }
                    }

                    function setCursorPosition(field, pos) {
                        if (field.createTextRange) {
                            var range = field.createTextRange();
                            range.move('textedit', -1);

                            if (pos.end != pos.start) {
                                range.moveStart('character', pos.start);
                                range.moveEnd('character', pos.end);
                            } else {
                                range.move('character', pos.start);
                            }

                            range.select();
                        }
                    }


                    function saveSelection(textArea) {
                        textArea.previousSelection = getCursorPosition(textArea);
                    }

                    function restoreSelection(textArea) {
                        if (textArea && textArea.previousSelection) {
                            textArea.focus();
                            setCursorPosition(textArea, textArea.previousSelection);
                        }
                    }

                    function getTextAreaSelection(textArea) {
                        textArea.focus();

                        var bits = ['', textArea.value, '', ''];

                        if (document.selection) {
                            if (textArea.previousSelection) {
                                var pos = textArea.previousSelection;
                                bits[1] = textArea.value.substring(0, pos.start);
                                bits[2] = textArea.value.substring(pos.start, pos.end);
                                bits[3] = textArea.value.substring(pos.end)
                            }
                        } else {
                            bits = (new RegExp('([\\s\\S]{' + textArea.selectionStart + '})([\\s\\S]{' +
                (textArea.selectionEnd - textArea.selectionStart) + '})([\\s\\S]*)')).exec(textArea.value);
                        }

                        return bits;
                    }


                    function insertTextAtSelectionInEditor(textAreaName, value) {
                        var textArea = document.getElementById(textAreaName);

                        bits = getTextAreaSelection(textArea);

                        if (bits) {
                            textArea.value = bits[1] + value + bits[3];

                            // Update the current cursor location to be just after the value
                            var endOfInsertion = (bits[1].length + value.length);
                            if (document.selection) {
                                var tr = textArea.createTextRange();
                                tr.move('textedit', -1);
                                tr.collapse();
                                tr.move('character', endOfInsertion);
                                tr.select();

                                saveSelection(textArea);
                            } else {
                                textArea.selectionStart = endOfInsertion;
                                textArea.selectionEnd = textArea.selectionStart;
                            }

                            textArea.focus();
                        }
                    }


                    function setSelectionInEditor(textAreaName, selectionBegin, selectionEnd) {
                        if (selectionBegin == -1 || selectionEnd == -1)
                            return;

                        //This prevents focus (and therefore selection) from being reassigned
                        if (window.markFocused) markFocused();

                        var textArea = document.getElementById(textAreaName);

                        textArea.focus();

                        // Update the current cursor location
                        if (document.selection) {
                            var tr = textArea.createTextRange();
                            tr.move('textedit', -1);
                            tr.move('character', selectionBegin);
                            var length = Math.max(selectionEnd - selectionBegin, 1);
                            tr.moveEnd('character', length);
                            tr.select();
                        } else {
                            textArea.selectionStart = selectionBegin;
                            textArea.selectionEnd = selectionEnd;
                        }

                        textArea.focus();
                    }


                    function findDelimiters(textAreaName, findLeft, findRight) {
                        var textArea = document.getElementById(textAreaName);

                        bits = getTextAreaSelection(textArea);
                        if (bits) {
                            var left = bits[1];
                            var right = bits[3];

                            var leftStartDelimPos = left.lastIndexOf(findLeft);
                            var leftEndDelimPos = left.lastIndexOf(findRight);

                            // Check to insure that if there is a right delim to our left that it is before the closest left delim
                            if (leftEndDelimPos >= 0 && leftEndDelimPos > leftStartDelimPos) {
                                return false;
                            }

                            var rightStartDelimPos = right.indexOf(findLeft);
                            var rightEndDelimPos = right.indexOf(findRight);

                            // Check to insure that if there is a left delim to our right that it is after the closest left delim
                            if (rightStartDelimPos >= 0 && rightStartDelimPos < rightEndDelimPos) {
                                return false;
                            }

                            return ((leftStartDelimPos >= 0) && (rightEndDelimPos >= 0));
                        } else {
                            return false;
                        }
                    }

</script>
                <script>                    var displayDeleteScheduleReportOverlay = true;</script>
                <div class="progressIndicator">
                    <h2>
                        报表生成状态：</h2>
                    <div id="status">
                        完成</div>
                    <div class="clearingBox">
                        &nbsp;</div>
                </div>
                <form onsubmit="Reports.runReportPageOnSubmit('report', 'format', 1); if (window.ffInAlert) { return false; }"
                name="report" method="POST" id="report" action="/apps/wf/rptPersonStat.aspx">
                <input type="hidden" value="47" id="rt" name="rt"><input type="hidden" value="" name="last_modified_user_id"
                    id="last_modified_user_id"><input type="hidden" value="" name="last_modified_by"
                        id="last_modified_by"><input type="hidden" value="" name="last_modified_date" id="last_modified_date"><div
                            class="bFilterReport">
                            <h2>
                                报表选项：</h2>
                            <div class="reportParameters">
                                <div class="row">
                                    <table cellspacing="0" cellpadding="0" border="0">
                                        <tbody>
                                            <tr>
                                                <td>
                                                    <label for="subtotalBy0">
                                                        汇总信息依据：</label><select name="break0" id="subtotalBy0"><optgroup label=""><option
                                                            value="">--无--</option>
                                                        </optgroup>
                                                            <optgroup label="用户信息">
                                                                <option value="DeptName" >部门</option>                                                              
                                                            </optgroup>
                                                        </select>
                                                </td>
                                                <td>
                                                    <label for="name_op">
                                                        运算符</label><select name="fullname_op" id="fullname_op">
                                                            <option selected="selected" value="sw">起始字符</option>
                                                            <option value="eq">等于</option>
                                                            <option value="contains">包含</option>
                                                        </select>
                                                </td>
                                                <td>
                                                    <label for="name">
                                                        姓名筛选器</label><input type="text" value="" size="20" name="fullname" maxlength="15" id="fullname" />
                                                </td>                                               
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="reportActions">
                                <div id="runMutton" class="menuButton">
                                    <div id="runMuttonButton" class="menuButtonButton hasDefault"><span tabindex="0" id="runMuttonLabel" class="menuButtonLabel">运行报表</span></div>
                                    <div id="runMuttonMenu" class="menuButtonMenu"><a class="menuButtonMenuLink firstMenuItem" href="javascript:document.report.nav.value%3D%27run%27%3Bdocument.report.runPageAction.value%20%3D%20%27SUBMITRUNREPORT%27%3Bdocument.report.onsubmit%28%29%3B%20document.report.submit%28%29%3B">立即运行报表</a><!--<a class="menuButtonMenuLink" href="javascript:document.report.saveAndSched.value%3D%271%27%3B%20document.report.nav.value%3D%27memorize%27%3B%20document.report.onsubmit%28%29%3B%20document.report.submit%28%29%3B">计划未来运行...</a>--></div>
                                </div>
                                <script>                                    new MenuButton('runMutton', true);</script>
                                <input type="submit" title="" style="height: 0px; width: 0px; padding: 0px; margin: 0px;
                                    border: none; font-size: 0px;" name="dummyRun" class="btn" value="  "><!--<input type="submit"
                                        title="隐藏详细信息" name="hidedetails" class="btn" value="隐藏详细信息"><input type="submit"
                                            title="自定义" onclick="document.report.action='/00O/e?eirb=1'; document.report.submit(); "
                                            name="eirb" class="btn" value=" 自定义 "><input type="submit" title="另存为" name="memorizenew"
                                                class="btn" value=" 另存为 "><input type="submit" title="可打印视图" name="excel" class="btn"
                                                    value=" 可打印视图 "><input type="submit" title="导出详细信息" name="csvsetup" class="btn" value="导出详细信息">--></div>
                        </div>
                            <input type="hidden" value="t" name="format" id="format" />
                            <input type="hidden" value="false" name="sideBySide" id="sideBySide" />
                            <input type="hidden" value="FULL_NAME" name="break0"  id="break0" />
                            <input type="hidden" value="up" name="brkord0" id="brkord0" />
                            <input type="hidden" value="0" name="brkdat0" id="brkdat0" />
                            <input type="hidden" value="FULLNAME" name="sortColumn0" id="sortColumn0" />
                            <input type="hidden" value="" name="saveAndSched" id="saveAndSched" />
                            <input type="hidden" value="" name="runPageAction" id="runPageAction" />
                            
                            <div  class="bGeneratedReport">
                                    <div class="bPageBlock brandSecondaryBrd">
                                        <!-- /acc/rptacctall.jsp -->
                                        <div class="pbHeader">
                                        </div>
                                        <div class="pbBody">
                                            <div class="pbSubblock">
                                                <div class="pbSubbody">
                                                    <div class="reportHeader">
                                                        <input type="hidden" value="" name="nav" id="nav"><div class="zen sortHeader" id="groupBreadcrumbs">
                                                            <div class="groupTitle">
                                                                分组依据：<div class="sortTitle">
                                                                    排序方式：</div>
                                                            </div><span id="breadcrumbButtons"></span>
                                                            <div style="clear: both;">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="reportOutput">
                                                        <!-- Start report output -->
                                                        <div class="floatingHeader" id="floatingHeader" style="position: fixed; display: inline;
                                                            left: 20px;">
                                                            <div id="fhtable" data-uidsfdc="17" style="display: none;">
                                                                <table cellspacing="0" cellpadding="0" border="0" class="floatingTable" id="floatingTable">
                                                                    <tbody>
                                                                        <tr id="fHeaderRow1">
                                                                            <th>
                                                                                <div style="width: 24px">
                                                                                    &nbsp;</div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 79.33332824707031px">
                                                                                    <a title="客户所有人别名 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ALIAS%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>客户所有人别名</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 123px">
                                                                                    <a title="客户所有人：电子邮件 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27EMAIL%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>客户所有人：电子邮件</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 56.66667175292969px">
                                                                                    <a title="所有人角色 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ROLLUP_DESCRIPTION%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>所有人角色</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 202px">
                                                                                    <a title="客户名 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ACCOUNT_NAME%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>客户名</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 45.33332824707031px">
                                                                                    <a title="客户站点 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ACCOUNT_SITE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>客户站点</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 62px">
                                                                                    <a title="创建日期 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27CREATED_DATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>创建日期</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 68px">
                                                                                    <a title="上次修改日期 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27LAST_UPDATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>上次修改日期</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 102px">
                                                                                    <a title="客户 ID - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ACCOUNT_ID%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>客户 ID</strong></a></div>
                                                                            </th>
                                                                            <th align="left" scope="col">
                                                                                <div style="width: 90.66667175292969px">
                                                                                    <a title="客户入口网站客户 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27IS_CUSTOMERSUCCESS%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                        <strong>客户入口网站客户</strong></a></div>
                                                                            </th>
                                                                        </tr>
                                                                        <tr bgcolor="ccccee">
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td colspan="9">
                                                                                <strong>客户所有人: </strong><a href="/0059000000390Wh">liu jack</a> <strong>(13 个记录)</strong>
                                                                            </td>
                                                                        </tr>
                                                                        <tr bgcolor="ccccee" class="summaryValues">
                                                                            <td>
                                                                                &nbsp;
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                            <td align="right">
                                                                            </td>
                                                                        </tr>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                        <div class="floatingHeaderButtons" id="floatingHeaderButtons" style="top: 0px; left: 480px;
                                                            display: none;">
                                                            <div class="buttons">
                                                                <img title="" class="upArrow" alt="" src="/s.gif" data-uidsfdc="16" style="display: none;"><img
                                                                    title="" class="downArrow" alt="" src="/s.gif" data-uidsfdc="18"></div>
                                                        </div>
                                                        <div id="fchArea">
                                                            <%=HTMLReportResult%>
                                                            <!--
                                                            <table cellspacing="0" cellpadding="0" border="0" class="reportTable tabularReportTable">
                                                                <tbody>
                                                                    <tr bgcolor="#aaaaff" class="headerRow" id="headerRow_0">
                                                                        <td rowspan="1">
                                                                            &nbsp;
                                                                        </td>
                                                                        <th align="left" scope="col">
                                                                            <a title="客户所有人别名 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ALIAS%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>客户所有人别名</strong></a>
                                                                        </th>
                                                                        <th align="left" scope="col">
                                                                            <a title="客户所有人：电子邮件 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27EMAIL%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>客户所有人：电子邮件</strong></a>
                                                                        </th>
                                                                        <th align="left" scope="col">
                                                                            <a title="所有人角色 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ROLLUP_DESCRIPTION%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>所有人角色</strong></a>
                                                                        </th>
                                                                        <th align="left" scope="col">
                                                                            <a title="客户名 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ACCOUNT_NAME%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>客户名</strong></a>
                                                                        </th>
                                                                        <th align="left" scope="col">
                                                                            <a title="客户站点 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ACCOUNT_SITE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>客户站点</strong></a>
                                                                        </th>
                                                                        <th align="right" scope="col">
                                                                            <a title="创建日期 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27CREATED_DATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>创建日期</strong></a>
                                                                        </th>
                                                                        <th align="right" scope="col">
                                                                            <a title="上次修改日期 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27LAST_UPDATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>上次修改日期</strong></a>
                                                                        </th>
                                                                        <th align="left" scope="col">
                                                                            <a title="客户 ID - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27ACCOUNT_ID%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>客户 ID</strong></a>
                                                                        </th>
                                                                        <th align="left" scope="col">
                                                                            <a title="客户入口网站客户 - 单击此处按升序排序" href="javascript:document.report.sort.value%3D%27IS_CUSTOMERSUCCESS%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B">
                                                                                <strong>客户入口网站客户</strong></a>
                                                                        </th>
                                                                    </tr>
                                                                    <tr bgcolor="#ccccee" class="breakRowClass0 breakRowClass0Top">
                                                                        <td class="drilldown">
                                                                            <input type="checkbox" value="liu jack" title="分层细节" name="drillval">
                                                                        </td>
                                                                        <td colspan="9">
                                                                            <strong>客户所有人: </strong><span class="groupvalue"><a href="/0059000000390Wh">liu jack</a></span><strong><span
                                                                                class="recordcount"> (13 个记录)</span></strong>
                                                                        </td>
                                                                    </tr>
                                                                 
                                                                    <tr valign="top" class="even">
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <a href="/0059000000390Wh">liu</a>
                                                                        </td>
                                                                        <td>
                                                                            <a href="mailto:jackliu185@sina.com">jackliu185@sina.com</a>
                                                                        </td>
                                                                        <td>
                                                                            CEO
                                                                        </td>
                                                                        <td>
                                                                            <a href="/00190000015a7I7">Grand Hotels &amp; Resorts Ltd</a>
                                                                        </td>
                                                                        <td>
                                                                            -
                                                                        </td>
                                                                        <td align="right">
                                                                            2014-10-8
                                                                        </td>
                                                                        <td align="right">
                                                                            2014-10-8
                                                                        </td>
                                                                        <td>
                                                                            00190000015a7I7
                                                                        </td>
                                                                        <td>
                                                                            <img height="16" width="16" title="未选取的" class="checkImg" alt="未选取的" src="/img/analytics/runpage/checkbox_off.png">
                                                                        </td>
                                                                    </tr>                                                               
                                                                    <tr valign="top" class="even">
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td>
                                                                            <a href="/0059000000390Wh">liu</a>
                                                                        </td>
                                                                        <td>
                                                                            <a href="mailto:jackliu185@sina.com">jackliu185@sina.com</a>
                                                                        </td>
                                                                        <td>
                                                                            CEO
                                                                        </td>
                                                                        <td>
                                                                            <a href="/00190000015a7IB">sForce</a>
                                                                        </td>
                                                                        <td>
                                                                            -
                                                                        </td>
                                                                        <td align="right">
                                                                            2014-10-8
                                                                        </td>
                                                                        <td align="right">
                                                                            2014-10-8
                                                                        </td>
                                                                        <td>
                                                                            00190000015a7IB
                                                                        </td>
                                                                        <td>
                                                                            <img height="16" width="16" title="未选取的" class="checkImg" alt="未选取的" src="/img/analytics/runpage/checkbox_off.png">
                                                                        </td>
                                                                    </tr>
                                                                    <tr bgcolor="#aaaacc" class="grandTotal grandTotalTop">
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td colspan="9">
                                                                            <strong>总计 (13 个记录)</strong>
                                                                        </td>
                                                                    </tr>
                                                                    <tr valign="top" bgcolor="#aaaacc" class="grandTotal">
                                                                        <td>
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                        <td align="right" class="nowrapCell">
                                                                            &nbsp;
                                                                        </td>
                                                                    </tr>
                                                                </tbody>
                                                            </table>
                                                            -->
                                                        </div>
                                                        <script>       document.getElementById('status').innerHTML = '完成';</script>
                                                        <br><!--
                                                        &nbsp;<label for="drillbreak">选取上面的行以筛选出所需行，然后依据以下条件继续搜索分层细节：</label>&nbsp;&nbsp;<select
                                                            name="drillbreak" id="drillbreak"><optgroup label=""><option value="">--无--</option>
                                                            </optgroup>
                                                            <optgroup label="客户信息">
                                                                <option value="CREATED_DATE">创建日期</option>
                                                                <option value="ACCOUNT_ID">客户 ID</option>
                                                                <option value="ACCOUNT_NAME">客户名</option>
                                                                <option value="IS_CUSTOMERSUCCESS">客户入口网站客户</option>
                                                                <option value="FULL_NAME">客户所有人</option>
                                                                <option value="EMAIL">客户所有人：电子邮件</option>
                                                                <option value="ALIAS">客户所有人别名</option>
                                                                <option value="ACCOUNT_SITE">客户站点</option>
                                                                <option value="LAST_UPDATE">上次修改日期</option>
                                                                <option value="ROLLUP_DESCRIPTION">所有人角色</option>
                                                            </optgroup>
                                                        </select>&nbsp;&nbsp;<input type="submit" title="分层细节" name="drilldown" class="btn"
                                                            value=" 分层细节 ">--><input type="hidden" value="FULLNAME" name="drillcol" id="drillcol"></div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                </form>
                <div class="confidential">
                    保密信息 - 请勿散布</div>
                <!-- Body events -->
                <script type="text/javascript">                    function bodyOnLoad() {
                        if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, true, 'VmpFPSxNakF4TlMwd055MHlPRlF3TnpveE56bzBOeTQ0TWpGYSwzX3JuLFpXTmhaVEU1'); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); ; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); Reports.saveOldSummaryValueIfExists();
                        sfdcPage.initGroupingBreadcrumbs({ "renderTo": "breadcrumbButtons", "breadcrumbs": [{ "icon": "sortAsc", "selected": "FULLNAME", "title": "姓名", "hoverText": "姓名 - 按升序排序", "displayName": "姓名", "menuItems": [{ "title": "姓名", "sortCol": "FULLNAME" }, { "title": "待办事务数", "sortCol": "NotStartedWfTasks"}]}] });
                       // sfdcPage.initFloatingHeader({ "drilldown": true, "numDisplayedColumns": 9, "reportType": "Summary", "renderTo": "floatingHeader", "breaks": [{ "heading": "姓名"}], "showDetails": false, "columns": [{ "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27ALIAS%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户所有人别名 - 单击此处按升序排序\"><strong>客户所有人别名<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27EMAIL%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户所有人：电子邮件 - 单击此处按升序排序\"><strong>客户所有人：电子邮件<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27ROLLUP_DESCRIPTION%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"所有人角色 - 单击此处按升序排序\"><strong>所有人角色<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27ACCOUNT_NAME%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户名 - 单击此处按升序排序\"><strong>客户名<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27ACCOUNT_SITE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户站点 - 单击此处按升序排序\"><strong>客户站点<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "right", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27CREATED_DATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"创建日期 - 单击此处按升序排序\"><strong>创建日期<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "right", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27LAST_UPDATE%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"上次修改日期 - 单击此处按升序排序\"><strong>上次修改日期<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27ACCOUNT_ID%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户 ID - 单击此处按升序排序\"><strong>客户 ID<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false }, { "alignValue": "left", "columnLabel": "<a href=\"javascript:document.report.sort.value%3D%27IS_CUSTOMERSUCCESS%27%3Bdocument.report.sortdir.value%3D%27up%27%3Bdocument.report.runPageAction.value%3D%27SORTDETAIL%27%3Bdocument.report.submit%28%29%3B\" title=\"客户入口网站客户 - 单击此处按升序排序\"><strong>客户入口网站客户<\/strong><\/a>", "colSpan": 1, "rowSpan": 1, "setClass": "", "needSubHeader": false}], "downDisplay": "hidden", "numActiveBreaks": 1, "colHistTrendRow": [], "needSubHeader": false }); 
                        if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd055MHlPRlF3TnpveE56bzBOeTQ1TURWYSxpeU1lLE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { if (closeOnParentUnloadWindow) closeOnParentUnloadWindow.close(); if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                <div id="datePicker" class="datePicker">
                    <div class="dateBar">
                        <img title="上月" onmouseover="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                            onfocus="this.className = 'calLeftOn';" onclick="DatePicker.datePicker.prevMonth();"
                            onblur="this.className = 'calLeft';" class="calLeft" alt="上月" src="/s.gif"><select
                                title="月" name="calMonthPicker" id="calMonthPicker"><option value="0">一月</option>
                                <option value="1">二月</option>
                                <option value="2">三月</option>
                                <option value="3">四月</option>
                                <option value="4">五月</option>
                                <option value="5">六月</option>
                                <option value="6">七月</option>
                                <option value="7">八月</option>
                                <option value="8">九月</option>
                                <option value="9">十月</option>
                                <option value="10">十一月</option>
                                <option value="11">十二月</option>
                            </select><img title="下月" onmouseover="this.className = 'calRightOn';" onmouseout="this.className = 'calRight';"
                                onfocus="this.className = 'calRightOn';" onclick="DatePicker.datePicker.nextMonth();"
                                onblur="this.className = 'calRight';" class="calRight" alt="下月" src="/s.gif"><select
                                    title="年" name="calYearPicker" id="calYearPicker"><option value="2014">2014</option>
                                    <option value="2015">2015</option>
                                    <option value="2016">2016</option>
                                    <option value="2017">2017</option>
                                    <option value="2018">2018</option>
                                    <option value="2019">2019</option>
                                    <option value="2020">2020</option>
                                </select></div>
                    <div class="calBody">
                        <table cellspacing="0" cellpadding="0" border="0" id="datePickerCalendar" class="calDays">
                            <tbody>
                                <tr>
                                    <th scope="col" class="dayOfWeek">
                                        星期日
                                    </th>
                                    <th scope="col" class="dayOfWeek">
                                        星期一
                                    </th>
                                    <th scope="col" class="dayOfWeek">
                                        星期二
                                    </th>
                                    <th scope="col" class="dayOfWeek">
                                        星期三
                                    </th>
                                    <th scope="col" class="dayOfWeek">
                                        星期四
                                    </th>
                                    <th scope="col" class="dayOfWeek">
                                        星期五
                                    </th>
                                    <th scope="col" class="dayOfWeek">
                                        星期六
                                    </th>
                                </tr>
                                <tr id="calRow1" class="calRow">
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="calRow2" class="calRow">
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="calRow3" class="calRow">
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="calRow4" class="calRow">
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="calRow5" class="calRow">
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr id="calRow6" class="calRow">
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                    <td onmouseover="hiOn(this);" onmouseout="hiOff(this);" onfocus="hiOn(this);" onclick="DatePicker.datePicker.selectDate(this);"
                                        onblur="hiOff(this);">
                                        &nbsp;
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="buttonBar">
                            <a onclick="DatePicker.datePicker.selectDate('today');return false;" class="calToday"
                                href="javascript:%20void%280%29%3B">今天</a></div>
                    </div>
                </div>
            </div>
        </div>
        <cc1:pagefooter id="PageFooter1" runat="server" />
    </div>
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1435655628000, "host": "login..com", "oid": "00D90000000yvHG", "server": "https://login..com/login/sessionserver190.html", "act": "u" };</script>
    <script>        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script async="" defer="" src="/jslibrary/sfdc/SfdcSessionBase190.js"></script>
    <script>        (function () { var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s); })();</script>
    <script async="" defer="" src="/jslibrary/sfdc/MarketingSurveyResponse.js"></script>
</body>
</html>

