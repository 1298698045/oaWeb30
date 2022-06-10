<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeEdit.aspx.cs" Inherits="WebClient.apps.scontent.NoticeEdit" ValidateRequest="false" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <title>通知编辑 - <%=CTitle%>  ~ .com - Developer Edition</title>
    <script src="/static/111213/js/perf/stub.js" type="text/javascript"></script>
    <script src="/jslibrary/ajax4jsf.js?rel=1428092910000" type="text/javascript"></script>
    <script src="/jslibrary/1424969980000/sfdc/SfdcCore.js" type="text/javascript"></script>
    <script src="/static/111213/js/picklist.js" type="text/javascript"></script>
    <script src="/jslibrary/1424969980000/sfdc/VFState.js" type="text/javascript"></script>
    <script src="/ckeditor/ckeditor-4.x/rel/ckeditor.js?t=4.4.4.8" type="text/javascript"></script>
    <script src="/ckeditor/ckeditor-4.x/rel/sfdcVf/link_override.js" type="text/javascript"></script>
    <script src="/ckeditor/ckeditor-4.x/rel/sfdcVf/table_override.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main_source.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/1427926072000/zh_CN.js" type="text/javascript"></script>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css"
        rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/setup.css"
        rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)); w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script>        window.sfdcPage = new ApexDetailPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1421084164000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "HH:mm:ss", "today": "<%=DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss")%>", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true}], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": true }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true}], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-MM-dd HH:mm:ss", "dateFormat": "yyyy-MM-dd", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Idea';</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/Business.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.173', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2F003%2Fe%3FretURL%3D%252F003%252Fo');</script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/sfdc-config.js?t=4.4.4.5"></script>
    <link rel="stylesheet" type="text/css" href="/ckeditor/ckeditor-4.x/rel/skins/moono/editor_gecko.css?t=4.4.4.5">
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/lang/zh-cn.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/styles.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/language/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcImage/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcMediaEmbed/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcSmartLink/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcCodeBlock/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcTable/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcVfAjax4J/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/menubutton/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/iframedialog/plugin.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/language/lang/zh-cn.js?t=4.4.4.5"></script>
    <script type="text/javascript" src="/ckeditor/ckeditor-4.x/rel/plugins/sfdcImage/lang/zh-cn.js?t=4.4.4.5"></script>
    <style>
        #filelist ul, #filelist li {
            list-style: none;
            margin-left: 0;
            padding-left: 0;
        }

        #filelist li {
            margin-bottom: 10px;
        }

            #filelist li:hover {
                background-color: #f2f2f2;
            }

        #filelist ul {
            margin-top: 0;
        }

        #filelist img {
            width: 30px;
            height: 30px;
        }

        #filelist .file-name {
            margin-left: 15px;
            line-height: 30px;
        }

        #filelist .file-delete {
            margin-left: 25px;
            cursor: pointer;
            color: #108def;
            line-height: 30px;
            float: right;
            margin-right: 50px;
        }

        #addfile img {
            width: 16px;
            height: 16px;
            margin-right: 5px;
            float: left;
            margin-top: -1px;
        }

        #addfile {
            cursor: pointer;
            margin-top: 10px;
            line-height: 16px;
            width: 50px;
        }

        #addpeople {
            cursor: pointer;
            margin-top: 10px;
            line-height: 16px;
            width: 50px;
            position: relative;
            clear: both;
            margin: 15px;
        }

            #addpeople img {
                width: 16px;
                height: 16px;
                margin-right: 5px;
                float: left;
                margin-top: -1px;
            }

        .file-deleteimg {
            width: 14px;
            height: 14px;
            margin-top: 10px;
            cursor: pointer;
        }

        .peoplelist li, .peoplelist ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .peoplelist li {
            float: left;
            padding: 5px 20px 5px 10px;
            border: 1px solid #dedede;
            font-size: 12px;
            margin-left: 10px;
            margin-bottom: 10px;
            border-radius: 4px;
            position: relative;
        }

            .peoplelist li img {
                width: 12px;
                height: 12px;
                position: absolute;
                right: 2px;
                top: 7px;
                cursor: pointer;
            }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif caseTab  sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <table class="outer" width="100%" id="bodyTable" border="0" cellspacing="0" cellpadding="0">
                <!-- Start page content table -->
                <tr>
                    <td class=" sidebarCell sidebarCollapsible sidebarCollapsed " id="sidebarCell">
                        <cc1:LeftQuickMenu runat="server" ID="LeftQuickMenu1" />
                    </td>
                    <td id="bodyCell" class="oRight">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img width="1" height="1" title="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                alt="内容在此开始" src="/s.gif"></a><span id="thePage"></span>
                        <link type="text/css" rel="Stylesheet" media="screen" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/Idea.css">
                        <link type="text/css" rel="Stylesheet" media="screen" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/IdeaInternal.css">
                        <div class="bPageTitle">
                            <div class="ptBody secondaryPalette brandSecondaryBrd">
                                <div class="content">
                                    <img alt="通知" title="通知" class="pageTitleIcon" src="/s.gif"><h1 class="pageType">通知</h1>
                                    <span class="titleSeparatingColon">:</span><h2 class="pageDescription">张贴通知</h2>
                                    <div class="blank">
                                    </div>
                                </div>
                                <div class="links">
                                    <!--
                                    <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                        title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                            class="helpIcon" /></a>-->
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            function valiateForm()
                            {
                                //if (document.getElementById('cancelAction').value=='1')
                                //    return true;
                                var title = document.getElementById("title").value;
                                if (title=="")
                                {
                                    alert("标题必须输入");
                                    return false;
                                }
                                var folderId = document.getElementById("folderPicker").value;
                                if (folderId=="")
                                {
                                    alert("通知栏目必须选择");
                                    return false;
                                }
                                var keyWords1 = document.getElementById("KeyWords").value;
                                if (keyWords1=="")
                                {
                                    alert("标签必须选择");
                                    return false;
                                }
                                return true;
                            }
                        </script>
                        <form enctype="multipart/form-data" action="/apps/scontent/NoticeEdit.aspx" method="post"
                            name="editPage" id="editPage" onsubmit="if (!valiateForm()) { return false; } if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }">
                            <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
                            <div class="ideaPageBlock " id="thePage:mainLayout:formIdea:j_id3">
                                <div class="apexp">
                                    <div class="individualPalette">
                                        <div class="ideaBlock">
                                            <div class="bPageBlock brandSecondaryBrd apexDefaultPageBlock secondaryPalette" id="thePage:mainLayout:formIdea:pb">
                                                <div class="pbHeader">
                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="pbTitle">
                                                                    <h2 class="mainTitle">介绍您的通知</h2>
                                                                </td>
                                                                <td class="pbButton " id="thePage:mainLayout:formIdea:pb:pbb">
                                                                    <input value=" 保存发布 " class="btn" title="保存发布" name="save" type="submit"  id="save_top" />
                                                                    <input value=" 保存并提交审核 " class="btn" title="保存并提交审核" name="save_approve" id="save_approve_top" type="submit" /> 
                                                                     <%if (CanApprove)
                                                  {%>
                                                <!--<input value=" 审核并通知 " class="btn" title="审核并通知" name="approve_notify" type="submit" />-->
                                                <div class="menuButton" id="managedetail">
                                                    <div class="menuButtonButton" id="managedetailButton"><span class="menuButtonLabel" id="managedetailLabel" tabindex="0">审批</span></div>
                                                    <div class="menuButtonMenu" id="managedetailMenu"><a href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>',1);" class="menuButtonMenuLink firstMenuItem">审批发布</a><a href="#" onclick="javascript:return publishOfficeNotice('<%=EntityId%>','2'); " class="menuButtonMenuLink">审批不发布</a></div>
                                                </div>
                                                <script>    new MenuButton('managedetail', false);</script>
                                                <input value=" 预览内容 " class="btn" title="预览内容" name="preview" type="button" onclick="openPopupFocusEscapePounds('/apps/scontent/PreviewContent.aspx?id=<%=EntityId%>    &ispreview=1', 'Prev', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no', false, false);" />
                                                <%} %>
                                                                    <input type="submit" value="保存中..." disabled="true" class="btn ideaSavingBtn btnDisabled" />
                                                                    <input value=" 取消 " class="btn" title="取消" name="cancel" type="button" style="height: 25px;" onclick="navigateToUrl('/091/o','EditPage','cancel');" />
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                                <script type="text/javascript">
                                                    function enableTopDate(ele)
                                                    {
                                                        //alert(ele.checked);
                                                        if(ele.checked)
                                                        {
                                                            document.getElementById('endTopDate').disabled=false; 
                                                        }
                                                        else
                                                        {
                                                            document.getElementById('endTopDate').disabled=true; 
                                                            document.getElementById('endTopDate').value="";
                                                        }
                                                    }
                                                </script>
                                                <script type="text/javascript">
                                                    function twistSection(twisty, sectionId) {
                                                        var parentDiv = twisty;
                                                        while (parentDiv.tagName != 'DIV') { parentDiv = parentDiv.parentNode; }
                                                        var div = parentDiv.nextSibling; 
                                                        var elemWasOn = false; 
                                                        if (div.style.display != 'none') { 
                                                            div.style.display = 'none'; 
                                                            twisty.className ='showListButton';
                                                            twisty.alt = twisty.title = '显示部分 - '+twisty.name;
                                                            elemWasOn = true; 
                                                        } else {
                                                            div.style.display = 'block'; 
                                                            twisty.className = 'hideListButton';
                                                            twisty.alt = twisty.title = '隐藏部分 - '+twisty.name;
                                                        } 
                                                        return !elemWasOn;
                                                    }
                                                    var registeredSections = new Array();
                                                    function registerTwistableSection(headerId, mainTableId) {
                                                        var obj = new Object();
                                                        obj.headerId = headerId;
                                                        obj.mainTableId = mainTableId;
                                                        registeredSections[registeredSections.length] = obj;
                                                    }
                                                    function twistAllSections(on) {
                                                        for (var i = 0; i &lt; registeredSections.length; i++) {
                                                            var obj = registeredSections[i];
                                                            var img;
                                                            img = document.getElementById('img_' + obj.headerId);
                                                            if (on && 'showListButton' == img.className) {
                                                                twistSection(img, obj.headerId, obj.mainTableId);
                                                            } else if (!on && 'hideListButton' == img.className) {
                                                                twistSection(img, obj.headerId, obj.mainTableId);
                                                            }
                                                        }
                                                    }
                                                    function toggleSection(headerId, on){
                                                        var sectionHead = document.getElementById('head_'+headerId+'_thePage_mainLayout_formIdea_pb');
                                                        var body = sectionHead.nextSibling;
                                                        var disp = on ? 'block' : 'none';
                                                        sectionHead.style.display = disp;
                                                        body.style.display = disp;
                                                    }
                                                    function registerTwistableSections_thePage_mainLayout_formIdea_pb() {
                                                        registerTwistableSection('thePage_mainLayout_formIdea_pb_pbs', 'thePage_mainLayout_formIdea_pb');
                                                        registerTwistableSection('thePage_mainLayout_formIdea_pb_ideaCustomFields', 'thePage_mainLayout_formIdea_pb');
                                                    }
                                                    registerTwistableSections_thePage_mainLayout_formIdea_pb();

                                                   
                                                </script>
                                                <div class="pbBody">
                                                    <div id="thePage:mainLayout:formIdea:pb:pbs">
                                                        <div class="pbSubsection">
                                                            <table style="margin-left: 20px" class="topPadding">
                                                                <tbody>
                                                                    <tr>
                                                                        <td class="labelCol requiredInput">栏目
                                                                        </td>
                                                                        <td class=" dataCol commentDataCol">
                                                                            <div class="requiredInput">
                                                                                <div class="requiredBlock">
                                                                                </div>
                                                                                <!-- <select name="categories" id="categories">
                                                                                    <option value="">--无--</option>
                                                                                    <%=Folders%>
                                                                                </select>-->
                                                                                <cc1:FolderSelector runat="server" ID="folderPicker" />
                                                                            </div>
                                                                        </td>
                                                                        <td class="labelCol requiredInput">发布部门
                                                                        </td>
                                                                        <td class=" dataCol commentDataCol">
                                                                            <div class="requiredInput">
                                                                                <div class="requiredBlock">
                                                                                </div>
                                                                                <%=BusinessUnitIdControlHtml%>
                                                                            </div>
                                                                        </td>
                                                                    </tr>

                                                                    <tr>
                                                                        <td class="labelCol requiredInput">
                                                                            <label for="thePage:mainLayout:formIdea:pb:pbs:fieldTitle">
                                                                                标题</label>
                                                                        </td>
                                                                        <td class=" dataCol commentDataCol" cols="3">
                                                                            <span id="thePage:mainLayout:formIdea:pb:pbs:j_id16">
                                                                                <div class="fieldIdeaTitleContainer" id="thePage:mainLayout:formIdea:pb:pbs:j_id17">
                                                                                    <div class="requiredInput">
                                                                                        <div class="requiredBlock">
                                                                                        </div>
                                                                                        <input type="text" size="30" style="width: 500px;"
                                                                                            name="title" maxlength="255" id="title" class="fieldIdeaTitle" value="<%=CTitle%>" />
                                                                                    </div>
                                                                                </div>
                                                                            </span>
                                                                        </td>
                                                                        <td class="labelCol">
                                                                            <label for="cpn2">
                                                                                <span class="requiredMark">*</span>紧急程度</label>
                                                                        </td>
                                                                        <td class="dataCol col02">
                                                                            <select name="UrgentLevel" id="UrgentLevel">
                                                                                <%=UrgentLevelHtml%>
                                                                            </select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol">
                                                                            <label for="cpn2">
                                                                                <span class="requiredMark">*</span>置顶信息</label>
                                                                        </td>
                                                                        <td class="dataCol col02">
                                                                            <input id="chkIsTop" name="chkIsTop" tabindex="1" type="checkbox" onclick="enableTopDate(this)" <%=IsTopHTML%> />
                                                                        </td>
                                                                        <td class="labelCol">
                                                                            <label for="cpn2">
                                                                                <span class="requiredMark">*</span>重要信息</label>
                                                                        </td>
                                                                        <td class="dataCol col02">
                                                                            <input id="chkIsImportant" name="chkIsImportant" tabindex="1" type="checkbox" <%=IsImportantHTML%> />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>

                                                                        <td class="labelCol">置顶截止
                                                                        </td>
                                                                        <td class="dataCol col02">
                                                                            <input id="endTopDate" name="endTopDate" tabindex="6" size="10" type="text" value='<%=EndTopDate%>' onfocus="DatePicker.pickDate(false, 'endTopDate', false);" onblur="if(!isDate(this.value)) {{ this.value=''; }}" disabled="disabled" />
                                                                        </td>
                                                                        <td class="labelCol">附件权限
                                                                        </td>
                                                                        <td class="dataCol">
                                                                            <select name="attachRightCode" id="attachRightCode"><%=AttachRightCodeControlHTML%></select>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol"><span class="requiredMark">*</span>发布时间
                                                                        </td>
                                                                        <td class="dataCol col02">
                                                                            <input id="CreatedOn" name="CreatedOn" tabindex="6" size="24" style="width: 140px;" type="text" value='<%=CreatedOn%>' onfocus="DatePicker.pickDate(false, 'CreatedOn', true);" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol">过期日期
                                                                        </td>
                                                                        <td class="dataCol col02">
                                                                            <input id="ExpiresOn" name="ExpiresOn" tabindex="6" size="10" type="text" value='<%=ExpiresOn%>' onfocus="DatePicker.pickDate(false, 'ExpiresOn', false);" onblur="if(!isDate(this.value)) {{ this.value=''; }}" />
                                                                            有效截止日期：也就是下架日期，到期后自动隐藏，不可以查看到！
                                                                        </td>

                                                                    </tr>

                                                                    <tr>
                                                                        <td class="labelCol requiredInput">
                                                                            <label for="thePage:mainLayout:formIdea:pb:pbs:fieldBody">
                                                                                &#25551;&#36848;</label><div class="textCounterOuter">
                                                                                    <div class="textCounterMiddle">
                                                                                        <div class="textCounter" id="fieldBody_counter">
                                                                                            32000 剩余
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                        </td>
                                                                        <td class=" dataCol commentDataCol" colspan="3">
                                                                            <span id="thePage:mainLayout:formIdea:pb:pbs:j_id43" class="fieldIdeaBody">
                                                                                <textarea id="textAreaDelegate_body" name="textAreaDelegate_body"><%=Contents%></textarea><script
                                                                                    type="text/javascript">                                                                                                                                                                          CKEDITOR.timestamp = '4.4.4.8';
                                                                                                                                                                              var protocolAndHost = window.location.protocol + '//' + window.location.host;

                                                                                                                                                                              var editor = CKEDITOR.replace('textAreaDelegate_body', {
                                                                                                                                                                                  removePlugins: 'elementspath,maximize,image,tabletools,liststyle,contextmenu,resize',
                                                                                                                                                                                  baseHref: protocolAndHost + '/ckeditor/ckeditor-4.x/rel/',
                                                                                                                                                                                  customConfig: '/ckeditor/ckeditor-4.x/rel/sfdc-config.js',
                                                                                                                                                                                  height: '450',
                                                                                                                                                                                  bodyId: 'textAreaDelegate_body_rta_body',
                                                                                                                                                                                  toolbar: 'Knowledge',
                                                                                                                                                                                  sfdcLabels: { CkeMediaEmbed: { title: '嵌入多媒体内容', description: '使用 DailyMotion、Vimeo 和 Youtube 上的 &lt;iframe&gt; 代码。', subtitle: '将 &amp;lt;iframe&amp;gt; 代码粘贴至此：', exampleTitle: '示例：', example: '\n\n&lt;iframe width=\&quot;560\&quot; height=\&quot;315\&quot; src=\&quot;https://www.youtube.com/embed/KcOm0TNvKBA\&quot; frameborder=\&quot;0\&quot; allowfullscreen&gt;&lt;/iframe&gt;\n            \n        ', iframeMissing: '无效的 &lt;iframe&gt; 元素。请使用已批准站点上的有效代码。' }, sfdcSwitchToText: { sfdcSwitchToTextAlt: '使用纯文本' }, CkeImageDialog: { uploadTab: '上载图像', infoTab_url: 'URL', error: '错误：', uploadTab_desc_info: '为视觉缺陷用户输入图像说明', uploadTab_desc: '描述', infoTab_url_info: '示例：http://www.mysite.com/myimage.jpg', btn_insert: '插入', defaultImageDescription: '用户添加的图片', missingUrlError: '必须输入一个 URL', uploadTab_file: '选择图像', infoTab_desc: '描述', btn_upadte: '更新', wrongFileTypeError: '您只能插入 .gif、.jpeg 和 .png 文件。', btn_update_tooltip: '更新图像', infoTab: 'Web 地址', btn_insert_tooltip: '插入图像', title: '插入图像', infoTab_desc_info: '为视觉缺陷用户输入图像说明', imageUploadLimit_info: '超过最大上载图像数', uploadTab_file_info: '最大大小 1 MB。仅限 png、gif 或 jpeg', btn_update: '更新' }, CkeImagePaste: { CkeImagePasteWarning: '粘贴图像无法在 Firefox 中正常使用，请用 [复制图像位置] 替代。'} },
                                                                                                                                                                                  contentsCss: ['/ckeditor/ckeditor-4.x/rel/contents.css', '/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/CKEditor.css'],
                                                                                                                                                                                  disableNativeSpellChecker: true,
                                                                                                                                                                                  language: 'zh-cn',
                                                                                                                                                                                  allowIframe: false,
                                                                                                                                                                                  sharedSpaces: { top: 'cke_topSpace', bottom: ' cke_bottomSpace' },
                                                                                                                                                                                  filebrowserImageUploadUrl: '/apps/CommandProcessor.ashx?cmd=RtaImageUpload'
                                                                                                                                                                                  /*'/_ui/common/request/servlet/RtaImageUploadServlet'*/
                                                                                                                                                                              });

                                                                                </script></span>
                                                                        </td>
                                                                    </tr>


                                                                    <!--
                                                                    <tr>
                                                                        <td class="labelCol requiredInput">回执
                                                                        </td>
                                                                        <td class="data2Col" colspan="3">
                                                                            <textarea name="readDetectionValue" id="readDetectionValue" maxlength="15000" rows="7" cols="70" wrap="soft"
                                                                                ><%=ReadDetectionFlag%></textarea>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="labelCol empty">&nbsp;
                                                                        </td>
                                                                        <td class="data2Col" colspan="3">输入回执选项列表值，每个值单独占一行。
                                                                        </td>
                                                                    </tr>-->
                                                                </tbody>
                                                            </table>
                                                        </div>
                                                        <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_3_ep">
                                                            <h3>移动栏目分类<span class="titleSeparatingColon">:</span></h3>
                                                        </div>
                                                        <div class="pbSubsection">
                                                            <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="labelCol requiredInput">
                                                                        <label for="cpn8">
                                                                            <span class="requiredMark">*</span>标签</label>
                                                                    </td>
                                                                    <td class="dataCol col02" colspan="3">
                                                                        <div class="requiredInput">
                                                                            <div class="requiredBlock">
                                                                            </div>
                                                                            <%=TagHTML%>
                                                                        </div>
                                                                    </td>                                                                    
                                                                </tr>

                                                            </table>
                                                        </div>
                                                        <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_4_ep">
                                                            <h3>查看范围<span class="titleSeparatingColon">:</span></h3>
                                                        </div>
                                                        <div class="pbSubsection">
                                                            <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="labelCol empty">查看范围
                                                                    </td>
                                                                    <td class="data2Col" colspan="3">
                                                                        <input type="checkbox" id="Checkbox1" name="chkIsPublic" <%=this.PublicHTML%> />所有人可以查看
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="labelCol empty" style="vertical-align: middle;">选择人员
                                                                     <input type="hidden" id="readers" name="readers" value="<%=Readers%>" />
                                                                    </td>
                                                                    <td class="peoplelist">
                                                                        <ul>
                                                                            <%=ContentReadersListHtml%>
                                                                        </ul>
                                                                        <div id="addpeople">
                                                                            <img src="/img/images/Add.png" alt="添加" title="添加">添加
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_5_ep">
                                                            <h3>手机APP封面<span class="titleSeparatingColon">:</span></h3>
                                                        </div>
                                                        <div class="pbSubsection">
                                                            <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="labelCol">
                                                                        <label for="mainImg">
                                                                            封面</label>
                                                                    </td>
                                                                    <td class="dataCol col02">
                                                                        <%=CoverHTML%>
                                                                        <input id="mainImg" name="mainImg[]" size="40" type="file" multiple="multiple" />
                                                                    </td>
                                                                    <td class="labelCol empty">&nbsp;
                                                                    </td>
                                                                    <td class="dataCol empty">&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="labelCol">
                                                                        <label for="coverDisplay">
                                                                            封面图片显示</label>
                                                                    </td>
                                                                    <td class="dataCol col02">
                                                                        <select name="coverDisplay" id="CoverDisplay">
                                                                            <option value="">--选择--</option>
                                                                            <option value="LeftTitle">标题左边</option>
                                                                            <option value="RightTitle">标题右边</option>
                                                                            <option value="BelowTitleBigImg">标题下面大图</option>
                                                                            <option value="BelowGrid">标题下列表</option>
                                                                            <option value="Carousel">标题下轮播</option>
                                                                        </select>
                                                                    </td>
                                                                    <td class="labelCol last empty">&nbsp;
                                                                    </td>
                                                                    <td class="dataCol last empty">&nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div class="brandTertiaryBgr pbSubheader tertiaryPalette" id="head_6_ep">
                                                            <h3>附件<span class="titleSeparatingColon">:</span></h3>
                                                        </div>
                                                        <div class="pbSubsection">
                                                            <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td class="labelCol">
                                                                        <label for="mainImg">
                                                                            附件</label>
                                                                    </td>
                                                                    <td class="dataCol col02">
                                                                        <div id="filelist">
                                                                            <ul class="norellist"></ul>

                                                                        </div>
                                                                        <input id="attachFile" name="attachFile[]" size="40" type="file" multiple="multiple" />
                                                                        <div id="addfile">
                                                                            <img src="/img/images/Add.png" />添加
                                                                        </div>
                                                                    </td>
                                                                    <td class="labelCol empty">&nbsp;
                                                                    </td>
                                                                    <td class="dataCol empty">&nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="pbBottomButtons">
                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                        <tbody>
                                                            <tr>
                                                                <td class="pbTitle">&nbsp;
                                                                </td>
                                                                <td class="pbButtonb " id="thePage:mainLayout:formIdea:pb:pbb:bottom">
                                                                    <input value=" 保存发布 " class="btn" name="save" tabindex="14" title="保存发布" type="submit"   id="save_bottom" />
                                                                    <input value=" 保存并提交审核 " class="btn" title="保存并提交审核" name="save_approve" id="save_approve_bottom" type="submit" />   
                                                                    <input value=" 取消 " class="btn" title="取消" name="cancel" type="button" style="height: 25px;" onclick="navigateToUrl('/091/o','EditPage','cancel');" />
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
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                        <!-- <script type="text/javascript" src="/static/050311/ideas/idea.js"></script>
                        <script type="text/javascript" language="javascript">
                            document.title = "Internal Zone 意见 编辑：张贴意见";
                            if (sfdcPage) {
                                sfdcPage.updateDirtyState(false ? GenericSfdcPage.STATE_ERROR : GenericSfdcPage.STATE_DIRTY);
                            }
                        </script>
                        <script type="text/javascript" src="/jslibrary/1382156102000/ideas/IdeaAttachment.js"
                            rendered="false"></script>-->
                        <!-- <script type="text/javascript">                        
                            Sfdc.onReady(function () {
                                SfdcApp && SfdcApp.Visualforce && SfdcApp.Visualforce.VSManager && SfdcApp.Visualforce.VSManager.vfPrepareForms(["thePage:mainLayout:formIdea"]);
                            });</script>-->
                        <!-- Body events -->
                                <script type="text/javascript">
                                jQuery(document).ready(function () {
                                    jQuery("#folderPicker").change(function () {
                                        var id=$("#folderPicker").find("option:selected").val();
                                        onFolderChange(id);
                                    });
                               
                                });
                                function onFolderChange(id)
                                {
                                    ajaxMethodGetData('content.folder.approveright.check', {folderId:id},function(data){
                                        //console.log(data);
                                        if(data.status==1){
                                            if(data.needApprove==true)
                                            {
                                                //alert(124);
                                                document.getElementById("save_top").style.display="none";
                                                document.getElementById("save_approve_top").style.display="";

                                                document.getElementById("save_bottom").style.display="none";
                                                document.getElementById("save_approve_bottom").style.display="";
                                            }
                                            else
                                            {
                                                //alert(456);
                                                document.getElementById("save_approve_top").style.display="none";
                                                document.getElementById("save_top").style.display="";

                                                document.getElementById("save_approve_bottom").style.display="none";
                                                document.getElementById("save_bottom").style.display="";
                                            }
                                        }else{
                                            alert(data.meessage);
                                        }
                                    })
                                }
                        </script>
                        <script type="text/javascript">                            function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); }; Sfdc.Cookie.deleteCookie('setupopen'); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fideas%2FeditIdea.apexp%3Fc%3D'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; ; if (this.loadChatFrameJs) loadChatFrameJs(); handleTextAreaElementChangeWithByteCheck('thePage:mainLayout:formIdea:pb:pbs:fieldBody', 32000, 0, '剩余', '超出极限'); MultiSelectPicklist.loadMSP('thePage:mainLayout:formIdea:pb:pbs:Categories'); if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
                        <div class="datePicker" id="datePicker">
                            <div class="dateBar">
                                <img src="/s.gif" alt="上月" class="calLeft" onblur="this.className = 'calLeft';" onclick="DatePicker.datePicker.prevMonth();"
                                    onfocus="this.className = 'calLeftOn';" onmouseout="this.className = 'calLeft';"
                                    onmouseover="this.className = 'calLeftOn';" title="上月" /><select id="calMonthPicker"
                                        name="calMonthPicker" title="月"><option value="0">一月</option>
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
                                    </select><img src="/s.gif" alt="下月" class="calRight" onblur="this.className = 'calRight';"
                                        onclick="DatePicker.datePicker.nextMonth();" onfocus="this.className = 'calRightOn';"
                                        onmouseout="this.className = 'calRight';" onmouseover="this.className = 'calRightOn';"
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2013">2013</option>
                                            <option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                             <option value="2021">2021</option>
                                             <option value="2022">2022</option>
                                             <option value="2023">2023</option>
                                        </select>
                            </div>
                            <div class="calBody">
                                <table class="calDays" border="0" cellpadding="0" cellspacing="0" id="datePickerCalendar">
                                    <tr>
                                        <th class="dayOfWeek" scope="col">星期日
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期一
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期二
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期三
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期四
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期五
                                        </th>
                                        <th class="dayOfWeek" scope="col">星期六
                                        </th>
                                    </tr>
                                    <tr class="calRow" id="calRow1">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow2">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow3">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow4">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow5">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                    <tr class="calRow" id="calRow6">
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                        <td onblur="hiOff(this);" onclick="DatePicker.datePicker.selectDate(this);" onfocus="hiOn(this);"
                                            onmouseout="hiOff(this);" onmouseover="hiOn(this);">&nbsp;
                                        </td>
                                    </tr>
                                </table>
                                <div class="buttonBar">
                                    <a href="javascript:%20void%280%29%3B" class="calToday" onclick="DatePicker.datePicker.selectDate('today');return false;">今天</a>
                                </div>
                            </div>
                        </div>
                        <!-- End page content -->
                    </td>
                </tr>
            </table>
        </div>
        <cc1:PageFooter ID="PageFooter1" runat="server" />
    </div>
    <script type="text/javascript">
        ajaxMethodGetData('file.attachment.getlist', {id:getQueryString('id')},function(data){
            for (var i = 0; i < data.listData[0].length; i++) {
                var res = data.listData[0][i]
                var FileExtension = res.FileExtension
                var imgsrc = '/img/filetype/Folder.png'
                if (FileExtension == "xls" || FileExtension == "xlsx") {
                    imgsrc = "/img/filetype/xls.png"
                }
                else if (FileExtension == "docx" || FileExtension == "doc") {
                    imgsrc = "/img/filetype/doc.png"
                }
                else if (FileExtension == "zip") {
                    imgsrc = "/img/filetype/rar.png"
                }
                else if (FileExtension == "png" || FileExtension == "jpg") {
                    imgsrc = "/img/filetype/Image.png"
                }
                else if (FileExtension == "bmp" || FileExtension == "jpeg") {
                    imgsrc = "/img/filetype/Image.png"
                }else if (FileExtension == "txt") {
                    imgsrc = "/img/filetype/Folder.png"
                }
                else if (FileExtension == "pdf") {
                    imgsrc = "/img/filetype/Pdf.png"
                } else {
                    imgsrc = "/img/filetype/Folder.png"
                }
                //debugger
                $('.norellist').append('<li fileid="'+res.Id+'">'
                                       +'    <img src="'+imgsrc+'">'
                                       +'    <span class="file-name">'+res.Name+'</span>'
                                       +'    <span class="file-delete">删除</span>'
                                       +'</li>')
    
            }
            $('.file-delete').click(function(){
               // debugger
                var that = this
               // console.log($(that).parent().attr('fileid'))
                if(confirm('确定要删除吗？')){
                    ajaxMethodGetData('file.attachment.delete', {id:$(that).parent().attr('fileid')},function(data){
                        if(data.status==1){
                            $(that).parent().remove()
                        }else{
                            alert('删除失败')
                        }
                    })
                }
            })
        })
        $('#addfile').click(function(){
            $(this).before('<div><input style="margin-top:10px;" id="attachFile" name="attachFile[]" size="40" type="file" multiple="multiple"><img onclick="newfiledelete(this)" class="file-deleteimg" src="/img/cal/closegray.png"/></div>')
        })
        function newfiledelete(that){
            $(that).parent().remove()
        }
        $('#addpeople').click(function(){
            opencenterwindow('/_ui/common/data/invite_UserLookResult.html', '', 1150, 600)
        })
        function invitepeople(ids, names) {
            var oldids = []
            var oldnames = []
            $('.peoplelist ul li').each(function(){
                oldids.push($(this).attr('peopleid'))
                oldnames.push($(this).attr('peoplename'))
            })
            for (var i = 0; i < oldids.length; i++) {
                for (var j = 0; j < ids.length; j++) {
                    if(oldids[i]==ids[j]){
                        ids.splice(j,1)
                        names.splice(j,1)
                    }
                }
            }
            if(oldids.length>0){
                $('#readers').val(oldids.join(',')+','+ids.join(','))
            }else{
                $('#readers').val(ids.join(','))
            }
            
            for (var i = 0; i < ids.length; i++) {
                var id = ids[i]
                var name = names[i]
                $(".peoplelist ul").append('<li peoplename="'+name+'" class="people" peopleid="' + id + '"><div><img class="peopleimg" src="/img/images/430.png" /></div>' + name + '<img class="peopledeleteimg" src="/img/images/02.Close_.png"/></li>')
            }
            $(".people img").click(function(){
                $(this).parent().remove()
                var ids = [] 
                $('.people').each(function () {
                    ids.push($(this).attr('peopleid'))
                })
                $('#readers').val(ids.join(','))
            })
        }
        $(".people img").click(function(){
            $(this).parent().remove()
            var ids = [] 
            $('.people').each(function () {
                ids.push($(this).attr('peopleid'))
            })
            $('#readers').val(ids.join(','))
        })
    </script>
</body>
</html>
<!-- page generation time: 124ms -->
