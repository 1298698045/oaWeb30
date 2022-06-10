<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sendtxt.aspx.cs" Inherits="Supermore.apps.mobile.Sendtxt" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>短信发送编辑: 新建短信 ~ - Developer Edition</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/DedupeCSS.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/1427405532000/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/1412954762000/canvas/CanvasRendering.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/Chatter.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DedupeJS.js"></script>
    <script src="/jslibrary/1424969980000/sfdc/DevContextMenu.js"></script>
    <script>        window.sfdcPage = new EditPage(null);
        UserContext.initialize({ "networkId": "", "labelLastModified": "1430352550000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-5-13", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script type="text/javascript">
        var MOTIF_KEY = 'Custom28';</script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/DedupeCSS.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1431481013000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/33.0/sprites/1428958786000/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/1424969980000/sfdc/Security.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/Business.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '000000390Wh0000000yvHG', '123.125.1.168', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo');</script>
    <style  type="text/css">
.calendarTable th.timeCol  { padding-right:.3em;}
    .calendarOn
    {
        BACKGROUND:white;min-height:29px;width:92%;border:1px solid #aaaaaa;border-radius:3px;margin:3px;line-height:30px;cursor:pointer;
    }
    .calendarOff
    {
        BACKGROUND:#6ce26c;min-height:29px;width:92%;border:1px solid #aaaaaa;border-radius:3px;margin:3px;line-height:30px;cursor:pointer;
    }
    .day 
    {
         BACKGROUND:white;color:black;
    }
    .night 
    {
        BACKGROUND:black;color:white;
    }
    .groupopen
    {
        /*color:blue;*/
        /*background: #f0f0f0 url(/img/alohaSkin/calHeader_bg.png) top left repeat-x;
        border:1px solid #aaaaaa;*/
        font-size:14px;
        font-weight:bold;
        line-height: 20px;
        margin:3px;
        padding-left:5px;
        cursor:pointer;
        padding: 0px 2px 0px 6px;
        white-space: nowrap;
    }
    .groupopen .lm_ca .lm_ico {
        background: url(/img/email/compose207c92.png) no-repeat 0 -384px;
        width: 14px;
        height: 12px;
        border: 0;
        padding: 0;
        margin: 2px 1px 0 2px;
        vertical-align: middle;
    }
    .groupOn
    {
        color:#000;
    }
    .groupOff
    {
        color:#aaaaaa;
    }
    .groupText
    {
        display:inline-block;
    }    
    .groupMember
    {
        color:#494949;
        font-size:14px;
        cursor:pointer;
        /*border:1px solid #aaaaaa;*/
        margin:3px;
        line-height: 20px;
        padding-left:10px;
        margin-left:10px;
        width:120px;
        /*float:right;*/
    }
    .groupMember:hover
    {
        background: #FFEEC2;
    }
    .off
    {
        display:none;
    }
    .on
    {
        display:block;
    }
</style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif Custom28Tab  editPage  ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr"
    onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
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
                    <td class="oRight" id="bodyCell">
                        <!-- Start page content -->
                        <a name="skiplink">
                            <img src="/s.gif" height='1' width='1' alt="内容在此开始" class="skiplink skipLinkTargetInner zen-skipLinkTarget"
                                title="内容在此开始" /></a><div class="bPageTitle">
                                    <div class="ptBody">
                                        <div class="content">
                                            <img src="/s.gif" alt="短信发送" class="pageTitleIcon" title="短信发送" /><h1 class="pageType">短信编辑<span class="titleSeparatingColon">:</span></h1>
                                            <h2 class="pageDescription">短信发送</h2>
                                            <div class="blank">
                                                &nbsp;
                                            </div>
                                        </div>
                                        <div class="links">
                                            <a href="javascript:openPopupFocusEscapePounds(%27%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);"
                                                title="此页面的帮助 （新窗口）"><span class="helpLink">此页面的帮助</span><img src="/s.gif" alt=""
                                                    class="helpIcon" /></a>
                                        </div>
                                    </div>
                                    <div class="ptBreadcrumb">
                                    </div>
                                </div>
                        <script language="javascript" type="text/javascript">
                            function limitText(limitField, limitNum) {
                                /*
                                if (limitField.value.length > limitNum) {
                                limitField.value = limitField.value.substring(0, limitNum);
                                } else {

                                }*/
                                //var remain = limitNum - limitField.value.length;
                                //jq("#countCharaters").html(remain);
                                var inputLen = limitField.value.length;
                                if (inputLen > 70)
                                    limitNum = 67;
                                else
                                    limitNum = 70;

                                var remain = limitNum - limitField.value.length;
                                var c = countMultiples(inputLen, limitNum);
                                //jq("#countCharaters").html("条数:" + c + ",已经输入" + inputLen + "字，还剩" + remain + "字");
                                jQuery("#countCharaters").html("已经输入<span style='color:#3300FF;'>" + inputLen + "</span>字，当前计费: <span style='color:#3300FF;'><strong>" + c + "</strong></span>条数");
                            }
                            function countMultiples(total, limit) {
                                var count = Math.ceil(total / limit);
                                return count;
                            }

                        </script>
                        <script type="text/javascript">
                            function ShowTime(t) {
                                if (t == 0) {
                                    jQuery("#trsendtime").hide();
                                    jQuery("#scheduledate").val("");
                                }
                                else {
                                    jQuery("#trsendtime").show();
                                    var today = new Date();
                                    var dd = today.getDate();
                                    var mm = today.getMonth() + 1; //January is 0!
                                    var yyyy = today.getFullYear();
                                    if (mm < 10)
                                        mm = "0" + mm;

                                    if (dd < 10)
                                        dd = "0" + dd;

                                    var date = yyyy + "-" + mm + "-" + dd;

                                    jQuery("#scheduledate").val(date);
                                }
                            }
                            function sentTestSms2() {
                                var mobile = jQuery("#testmobile").val();
                                var msg = jQuery("#smsContent").val();
                                if (mobile == "") {
                                    alert("测试号码必须输入！");
                                    return false;
                                }
                                if (msg == "")
                                    alert("短信内容必须输入！");
                                sentTestSms(mobile, msg, 0);
                            }
                            function lookupPick(a, b, c, d, e, f, g, k) {
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
                                //else
                                //    ids = f;
                                document.getElementById(b).value = names;
                                document.getElementById(c).value = ids;

                                //document.getElementById(b).value = e;
                                //document.getElementById(c).value = f;
                                // debugger;
                            }
                            function validateForm() {

                                var msg = jQuery("#smsContent").val();

                                if (msg == "") {
                                    alert("短信内容必须输入！");
                                    return false;
                                }
                                /*
                                var mobile1 = jQuery("#p24_lkid").val();
                                var mobile2 = jQuery("#manualNums").val();
                                if (mobile1 == "" && mobile2=="") {
                                    alert("接收人必须输入！");
                                    return false;
                                }
                                */
                                return true;
                            }
                            function clearLookupFieldValue(b, c) {
                                document.getElementById(b).value = "";
                                document.getElementById(c).value = "";
                            }
                        </script>
                             <script type="text/javascript">

                                // getGroupAndMembers(fillList, 0);
                                 function fillList(data) {
                                     var rows = data.listData;
                                     var html = "";
                                     for (var i = 0; i < rows.length; i++) {
                                         var item = rows[i];
                                         html += "<div  class='groupopen'><span class=\"lm_ico\"></span><input type='checkbox' value=\"" + item.groupId + "\" onclick=\"selectGroup(this.value,this.checked)\" /><div class='groupText groupOff' onclick=\"toggleGroup('" + item.groupId + "')\" id=\"" + item.groupId + "\" on=\"off\">" + item.name + '(' + item.Quantity + ")</div></div>";
                                         html += "<div class='groupMember1 off' id=\"groupchild_" + item.groupId + "\"  on=\"off\">";
                                         for (var j = 0; j < item.peoples.length; j++) {
                                             var peop = item.peoples[j];
                                             var onchange = " setCurrentEmp('" + peop.systemUserId + "', '" + peop.fullName + "', '" + peop.systemUserId + "') ";
                                             html += "<div style='padding-left:15px;' class='groupMember'><div style='width:5px;'></div><input type='checkbox' style='cursor:pointer;'  onclick=\"" + onchange + "\"  value=\"" + peop.systemUserId + "\" name=\"contactid\" id=\"" + peop.systemUserId + "\"  groupid=\"" + item.groupId + "\" fullName=\"" + peop.fullName + "\"/>" + peop.fullName + "</div>";
                                         }
                                         html += "</div>";
                                     }
                                     document.getElementById("memberList").innerHTML = html;
                                 }
                                 function toggleGroup(groupid, checked) {
                                     var on1 = jQuery("#groupchild_" + groupid).attr("on");
                                     if (on1 == "on") {
                                         document.getElementById("groupchild_" + groupid).style.display = "none";
                                         jQuery("#groupchild_" + groupid).removeAttr("on");
                                         jQuery("#groupchild_" + groupid).attr("on", "off");
                                         //jQuery("#groupchild_" + groupid).hide();

                                         $("#groupchild_" + groupid).removeClass("on");
                                         $("#groupchild_" + groupid).addClass("class", "off");

                                         $("#" + groupid).removeClass("groupOn");
                                         $("#" + groupid).addClass("class", "groupOff");
                                     }
                                     else {
                                         document.getElementById("groupchild_" + groupid).style.display = "block";
                                         jQuery("#groupchild_" + groupid).removeAttr("on");
                                         jQuery("#groupchild_" + groupid).attr("on", "on");

                                         $("#groupchild_" + groupid).removeClass("off");
                                         $("#groupchild_" + groupid).addClass("class", "on");
                                         //document.getElementById("groupchild_" + groupid).style.display = "none;";

                                         $("#" + groupid).removeClass("groupOff");
                                         $("#" + groupid).addClass("class", "groupOn");

                                     }
                                     if (checked) {

                                     }
                                     else {

                                     }
                                 }
                                 function selectGroup(grId, checked) {
                                     //debugger;
                                     //if (checked)
                                     toggleGroup(grId);
                                     jQuery("input:checkbox").each(function (index, ele) {
                                         // debugger                                  
                                         var groupId = jQuery(ele).attr("groupid");
                                         if (groupId) {

                                             if (grId == groupId) {
                                                 if (checked)
                                                     jQuery(ele).attr("checked", checked)
                                                 else
                                                     jQuery(ele).removeAttr("checked")
                                             }

                                         }

                                     });
                                     setCurrentEmp();
                                 }
                                 //var c = 0;
                                 function setCurrentEmp(empid, name, chckId) {
                                     var values = "";
                                     var names = "";
                                     var i = 0;
                                     //debugger;
                                     jQuery("input:checked").each(function (index, ele) {
                                         //debugger;
                                         //var eleId = ele.id.substr(7);
                                         var checked = jQuery(ele).attr("checked");
                                         var groupId = jQuery(ele).attr("groupid");
                                         if (checked && groupId) {
                                             if (i > 0) {
                                                 names += ",";
                                                 values += ",";
                                             }
                                             var fullName = jQuery(ele).attr("fullName");
                                             var id = jQuery(ele).attr("value");
                                             names += fullName;
                                             values += id;

                                             i++;
                                         }

                                     });
                                     //alert(names);
                                     //alert(values);
                                     var eleId = document.getElementById("p24_lkid");
                                     var eleName = document.getElementById("p24");
                                     eleId.value = values;
                                     eleName.value = names;
                                     /*
                                     //debugger;
                                     var isChecked = document.getElementById(chckId).checked;

                                     var eleId = document.getElementById("p24_lkid");
                                     var eleName = document.getElementById("p24");
                                     if (isChecked) {

                                         var orgValue = eleId.value;
                                         if (orgValue == "") {
                                             eleId.value = empid;
                                         }
                                         else
                                             eleId.value = orgValue + "," + empid;

                                         orgValue = eleName.value;
                                         //alert(orgValue)
                                         if (orgValue == "") {
                                             eleName.value = name;
                                         }
                                         else
                                             eleName.value = orgValue + "," + name;
                                     }
                                     else {
                                         var orgValue = eleId.value;
                                         orgValue = orgValue.replace("/" + orgValue + "/", "");
                                         eleId.value = orgValue;
                                     }
                                     */
                                 }

                        </script>
                        
                        <form action="/apps/mobile/Sendtxt.aspx" id="editPage" method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; } if (!validateForm()) { return false; } if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }">
                            <input type="hidden" name="cancelURL" id="cancelURL" value="/705/o" /><input type="hidden"
                                name="retURL" id="retURL" value="/apps/mobile/Sendtxt.aspx" /><input type="hidden" name="save_new_url"
                                    id="save_new_url" value="/apps/mobile/Sendtxt.aspx?retURL=%2F705%2Fo" /><div class="bPageBlock brandSecondaryBrd bEditBlock secondaryPalette"
                                        id="ep">
                                        <div class="pbHeader">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="12" height="1" class="minWidth" title="" style="margin-right: 0.25em; margin-right: 0.25em;" /><h2 class="mainTitle">短信发送编辑</h2>
                                                    </td>
                                                    <td class="pbButton" id="topButtonRow">
                                                        <input value=" 保存并发送 " class="btn" title="保存并发送" name="save" type="submit" />
                                                        <!--<input value=" 保存并发送 " class="btn" title="保存并发送" name="save_send" type="submit" />-->
                                                        <input value=" 取消 " class="btn" title="取消" name="cancel" type="submit" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbBody">
                                            <div class="pbError" id="errorDiv_ep" style="display: none">
                                                错误：无效数据。<br />
                                                请查看下列所有错误消息以纠正数据。
                                            </div>
                                            <div class="pbSubheader brandTertiaryBgr first tertiaryPalette" id="head_1_ep">
                                                <span class="pbSubExtra"><span class="requiredLegend brandTertiaryFgr"><span class="requiredExampleOuter">
                                                    <span class="requiredExample">&nbsp;</span></span><span class="requiredMark">*</span><span
                                                        class="requiredText"> = 必填信息</span></span></span><h3>信息<span class="titleSeparatingColon">:</span></h3>
                                            </div>
                                            <div class="pbSubsection">
                                                <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                                    <td>
                                                        <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td class="labelCol requiredInput">
                                                                    <label for="Name">
                                                                        <span class="requiredMark">*</span>发送名称</label>
                                                                </td>
                                                                <td class="dataCol col02">
                                                                    <div class="requiredInput">
                                                                        <div class="requiredBlock">
                                                                        </div>
                                                                        <input id="Name" maxlength="120" name="Name" size="40" tabindex="1" type="text"  value="<%=Name%>" />
                                                                    </div>
                                                                </td>
                                                                <td class="labelCol">
                                                                    <label>
                                                                        <%--所有人--%></label>
                                                                </td>
                                                                <td class="dataCol">
                                                                   
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol requiredInput">
                                                                    <label for="00N9000000DpRrQ">
                                                                        短信内容</label><div class="textCounterOuter">
                                                                            <div class="textCounterMiddle">
                                                                                <div class="textCounter" id="smsContent_counter">
                                                                                    500 剩余
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                </td>
                                                                <td class="dataCol col02">
                                                                    <div class="requiredInput">
                                                                        <div class="requiredBlock">
                                                                        </div>
                                                                        <textarea cols="82" id="smsContent" maxlength="500" name="smsContent" onkeyup="limitText(this,69);"
                                                                            onkeydown="limitText(this,69);" onchange="handleTextAreaElementChangeWithByteCheck('smsContent', 500, 0, '剩余', '超出极限');"
                                                                            onclick="handleTextAreaElementChangeWithByteCheck('smsContent', 500, 0, '剩余', '超出极限');"
                                                                            onmousedown="handleTextAreaElementChangeWithByteCheck('smsContent', 500, 0, '剩余', '超出极限');"
                                                                            rows="10" tabindex="2" type="text" wrap="soft"><%=Message%></textarea>
                                                                        <div style="background-color: #FDFBDB; border: 1px dashed gray; padding: 5px 5px 5px 5px; width: 295px;">
                                                                            <span id="countCharaters" style="color: gray;">还可以输入70个字</span>
                                                                        </div>
                                                                        注意：单条短信70个字，多条短信67字一条，最多可以输入500个字。
                                                                    </div>
                                                                </td>
                                                                <td class="labelCol empty">&nbsp;
                                                                </td>
                                                                <td class="dataCol empty">&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol">
                                                                    <label for="Name">
                                                                        短信内容后缀</label>
                                                                </td>
                                                                <td class="dataCol col02" colspan="3">
                                                                    <input type="text" style="width: 445px"  name="postFix" id="postFix" value="<%=Postfix%>">
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol">
                                                                    <label for="Name">
                                                                        测试号码</label>
                                                                </td>
                                                                <td class="dataCol col02" colspan="3">
                                                                    <input type="text" style="width: 445px" name="testmobile" id="testmobile" value="<%=TestMobile%>"><input
                                                                        class="btn-small" type="button" value="测试发送" title="测试发送" onclick="sentTestSms2()" />
                                                                    <br />
                                                                    (手机号之间用半角逗号（,)隔开 但最多10个手机号)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 5px"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="labelCol">
                                                                    <label for="00N9000000DpRrQ">
                                                                        录入号码</label>
                                                                    <div class="textCounterOuter">
                                                                        <div class="textCounterMiddle">
                                                                            <div class="textCounter" id="Div2">
                                                                                500 剩余
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </td>
                                                                <td> <div class="requiredInput">
                                                                        <div class="requiredBlock">
                                                                        </div>
                                                                    <textarea wrap="soft" cols="83" id="manualNums" name="manualNums" rows="15" title="发送到"></textarea></div>
                                                                    <br />
                                                                    一行一个号码，例如<br />
                                                                    13911700000<br />
                                                                    13911800000<br />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <th valign="top" nowrap="nowrap" class="labelCol">发送时间
                                                                </th>
                                                                <td class="dataCol col02">
                                                                    <input type="radio" value="1" name="radiotime" id="radio1" onclick="ShowTime(0)"
                                                                        checked="checked" />
                                                                    立即发送
                                                        <input type="radio" value="2" name="radiotime" id="radio2" onclick="ShowTime(1)" />
                                                                    定时发送
                                                                </td>
                                                                <td class="empty labelCol">&nbsp;
                                                                </td>
                                                                <td class="empty dataCol">&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr id="trsendtime" style="display: none;">
                                                                <td class="last labelCol">
                                                                    <label for="00N9000000DpRrV">
                                                                        定时发送</label>
                                                                </td>
                                                                <td class="dataCol col02">
                                                                    <div style="background-color: #FFFFE1; padding: 5px; width: 300px; border: 1px solid #CDE6FF;">
                                                                        <span class="dateInput">
                                                                            <input id="scheduledate" name="scheduledate" onfocus="DatePicker.pickDate(false, 'scheduledate', true);"
                                                                                size="20" tabindex="3" type="text" /><select id="hour" name="hour"><option value="00">00</option>
                                                                                    <option value="01">01</option>
                                                                                    <option value="02">02</option>
                                                                                    <option value="03">03</option>
                                                                                    <option value="04">04</option>
                                                                                    <option value="05">05</option>
                                                                                    <option value="06">06</option>
                                                                                    <option value="07">07</option>
                                                                                    <option value="08">08</option>
                                                                                    <option value="09">09</option>
                                                                                    <option value="10">10</option>
                                                                                    <option value="11">11</option>
                                                                                    <option value="12">12</option>
                                                                                    <option value="13">13</option>
                                                                                    <option value="14">14</option>
                                                                                    <option value="15">15</option>
                                                                                    <option value="16">16</option>
                                                                                    <option value="17">17</option>
                                                                                    <option value="18">18</option>
                                                                                    <option value="19">19</option>
                                                                                    <option value="20">20</option>
                                                                                    <option value="21">21</option>
                                                                                    <option value="22">22</option>
                                                                                    <option value="23">23</option>
                                                                                </select>
                                                                            <select id="minute" name="minute">
                                                                                <option value="00">00</option>
                                                                                <option value="01">01</option>
                                                                                <option value="02">02</option>
                                                                                <option value="03">03</option>
                                                                                <option value="04">04</option>
                                                                                <option value="05">05</option>
                                                                                <option value="06">06</option>
                                                                                <option value="07">07</option>
                                                                                <option value="08">08</option>
                                                                                <option value="09">09</option>
                                                                                <option value="10">10</option>
                                                                                <option value="11">11</option>
                                                                                <option value="12">12</option>
                                                                                <option value="13">13</option>
                                                                                <option value="14">14</option>
                                                                                <option value="15">15</option>
                                                                                <option value="16">16</option>
                                                                                <option value="17">17</option>
                                                                                <option value="18">18</option>
                                                                                <option value="19">19</option>
                                                                                <option value="20">20</option>
                                                                                <option value="21">21</option>
                                                                                <option value="22">22</option>
                                                                                <option value="23">23</option>
                                                                                <option value="24">24</option>
                                                                                <option value="25">25</option>
                                                                                <option value="26">26</option>
                                                                                <option value="27">27</option>
                                                                                <option value="28">28</option>
                                                                                <option value="29">29</option>
                                                                                <option value="30">30</option>
                                                                                <option value="31">31</option>
                                                                                <option value="32">32</option>
                                                                                <option value="33">33</option>
                                                                                <option value="34">34</option>
                                                                                <option value="35">35</option>
                                                                                <option value="36">36</option>
                                                                                <option value="37">37</option>
                                                                                <option value="38">38</option>
                                                                                <option value="39">39</option>
                                                                                <option value="40">40</option>
                                                                                <option value="41">41</option>
                                                                                <option value="42">42</option>
                                                                                <option value="43">43</option>
                                                                                <option value="44">44</option>
                                                                                <option value="45">45</option>
                                                                                <option value="46">46</option>
                                                                                <option value="47">47</option>
                                                                                <option value="48">48</option>
                                                                                <option value="49">49</option>
                                                                                <option value="50">50</option>
                                                                                <option value="51">51</option>
                                                                                <option value="52">52</option>
                                                                                <option value="53">53</option>
                                                                                <option value="54">54</option>
                                                                                <option value="55">55</option>
                                                                                <option value="56">56</option>
                                                                                <option value="57">57</option>
                                                                                <option value="58">58</option>
                                                                                <option value="59">59</option>
                                                                            </select><!--<span class="dateFormat">[&nbsp;<a href="javascript:void(DatePicker.insertDate('2015-5-13 上午9:40', '00N9000000DpRrV', true));"
                                                                            tabindex="3">2015-5-13 上午9:40</a>&nbsp;]</span>-->
                                                                        </span>
                                                                    </div>
                                                                </td>
                                                                <td class="empty labelCol">&nbsp;
                                                                </td>
                                                                <td class="empty dataCol">&nbsp;
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </td><!--
                                                    <td width="20%">
                                                        <div id="memberList" style="margin-left: 5px; height: 661px; overflow-y: auto; border: 1px solid #ccc;"></div>
                                                    </td>-->
                                                </table>

                                            </div>
                                        </div>
                                        <div class="pbBottomButtons">
                                            <table border="0" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td class="pbTitle">
                                                        <img src="/s.gif" alt="" width="12" height="1" class="minWidth" title="" style="margin-right: 0.25em; margin-right: 0.25em;" />&nbsp;
                                                    </td>
                                                    <td class="pbButtonb" id="bottomButtonRow">
                                                        <input value=" 保存并发送 " class="btn" title="保存并发送" name="save" type="submit" />
                                                        <!--<input value=" 保存并发送 " class="btn" title="保存并发送" name="save_send" type="submit" />-->
                                                        <input value=" 取消 " class="btn" name="cancel" tabindex="6" title="取消" type="submit" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div class="pbFooter secondaryPalette">
                                            <div class="bg">
                                            </div>
                                        </div>
                                    </div>
                            <script>                            if (window.sfdcPage && window.sfdcPage.initButtons) { window.sfdcPage.initButtons(["save", "save_send", "save_new", "cancel"]); }</script>
                        </form>
                        <script>    window.sfdcPage.appendToOnloadQueue(function () {
        // DevSlide.addTools([{ "title": "查看字段", "hoverText": "查看和管理此对象的字段", "newLinkHover": "将字段添加到此对象", "url": "/01I900000021z4c?setupid=CustomObjects#01I900000021z4c_CustomFieldRelatedList_target", "newUrl": "/p/setup/field/NewCustomFieldStageManager?entity=01I900000021z4c&retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo&setupid=CustomObjects", "newWindow": true, "newInNewWindow": true, "section": 0 }, { "title": "查看对象", "hoverText": "查看和管理此对象的详细信息", "newLinkHover": "创建对象", "url": "/01I900000021z4c?setupid=CustomObjects", "newUrl": "/01I/e?retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo&setupid=CustomObjects", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看验证规则", "hoverText": "查看和管理此对象的验证规则", "newLinkHover": "为此对象添加验证规则", "url": "/01I900000021z4c?setupid=CustomObjects#ValidationFormulaList_target", "newUrl": "/03d/e?retURL=%2Fa0C%2Fo&TableEnumOrId=01I900000021z4c&Active=1&setupid=CustomObjects", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "查看批准", "hoverText": "查看和管理此对象的批准过程", "newLinkHover": "使用跳转向导为此对象添加批准过程", "url": "/p/process/ProcessDefinitionSetup?TableEnumOrId=01I900000021z4c&setupid=ApprovalProcesses", "newUrl": "/04a/e?TableEnumOrId=01I900000021z4c&et=QUICK_CREATE&retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo&setupid=ApprovalProcesses", "newWindow": true, "newInNewWindow": false, "section": 0 }, { "title": "编辑应用程序", "hoverText": "自定义此应用程序的选项卡列表、简档分配和其他详细信息", "url": "/02u900000017n3L/e?retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo&setupid=TabSet", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑选项卡", "hoverText": "自定义此选项卡的图标、颜色和其他详细信息", "url": "/01r90000000xmSX/e?retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo&setupid=CustomTabs", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "编辑布局", "hoverText": "自定义此页面布局", "url": "/layouteditor/layoutEditor.apexp?type=01I900000021z4c&lid=00h9000000YnYmi&retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo&setupid=CustomObjects", "newWindow": false, "newInNewWindow": false, "section": 1 }, { "title": "导入数据", "hoverText": "将数据导入此对象中", "url": "/ui/setup/imp/ImportWizardWelcomePage", "newWindow": true, "newInNewWindow": false, "section": 2}]);
        // new DevSlide("\u003Cimg src=\"/s.gif\" alt=\"Force.com 快速访问菜单\"  class=\"menuArrow\" onblur=\"this.className = 'menuArrow';\" onfocus=\"this.className = 'menuArrowOn';\" onmouseout=\"this.className = 'menuArrow';\" onmouseover=\"this.className = 'menuArrowOn';\" title=\"Force.com 快速访问菜单\"/\u003E", "\u003Cimg src=\"/s.gif\" alt=\"转到“设置”\"  class=\"forceLogo\" onblur=\"this.className = 'forceLogo';\" onfocus=\"this.className = 'forceLogoOn';\" onmouseout=\"this.className = 'forceLogo';\" onmouseover=\"this.className = 'forceLogoOn';\" title=\"转到“设置”\"/\u003E", "\u003Ca href=\"javascript:openPopupFocusEscapePounds(%27https://login.salesforce.com/services/auth/sso/00D30000000XsfGEAS/HTAuthProvider?startURL=%252Fapex%252Fhtdoor%253Fsection%253DDev_Tools%2526target%253Ddev_quick_access_menu.htm%2526loc%253Dhelp%2526language%253Dzh_CN%2526release%253D194.20%2526instance%253DAP1&amp;site=https%3A%2F%2Fhelp.salesforce.com%27, %27Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);\" class=\"helpLink\" title=\"帮助\"\u003E\u003Cimg src=\"/s.gif\" alt=\"帮助\"  class=\"helpIcon\" title=\"帮助\"/\u003E\u003C/a\u003E", "/setup/forcecomHomepage.apexp?setupid=ForceCom&retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo");
    });</script>
                        <!-- Body events -->
                        <script type="text/javascript">                            function bodyOnLoad() { handleTextAreaElementChangeWithByteCheck('00N9000000DpRrQ', 32768, 0, '剩余', '超出极限'); setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (typeof (ActivityReminder) != 'undefined') { ActivityReminder.initialize([], false, false, ''); }; if ((window.sfdcPage) && (sfdcPage.executeOnloadQueue)) { sfdcPage.executeOnloadQueue(); };; if (this.loadChatFrameJs) loadChatFrameJs(); SearchClickLoggingUtil.setClickLoggingServletPath("/_ui/search/logging/SearchClickLoggingServlet"); new UnifiedSearchAutoCompleteElement("phSearchInput", "/_ui/common/search/client/ui/UnifiedSearchAutoCompleteServlet", 1, {}, false, null, "phSearchForm", ["div", "searchOwner", "asPhrase", "sen"], {}, true, 3, 100); new UnifiedSearchButton("searchButtonContainer", "phSearchButton", "headerSearchRightRoundedCornerMouseOver", "phSearchForm"); SfdcApp.MruHovers.global_data.url = 'retURL=%2Fa0C%2Fe%3FretURL%3D%252Fa0C%252Fo&isAjaxRequest=1&renderMode=RETRO&nocache=1431481205122'; if (document.getElementById('sidebarDiv')) { Sidebar.prototype.theSidebar = new Sidebar(document.getElementById('sidebarDiv'), true, true, false); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = ""; }; } function bodyOnBeforeUnload() { if ((window.sfdcPage) && (sfdcPage.executeOnBeforeUnloadQueue)) { sfdcPage.executeOnBeforeUnloadQueue(); }; } function bodyOnFocus() { closePopupOnBodyFocus(); } function bodyOnUnload() { }</script>
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
                                        title="下月" /><select id="calYearPicker" name="calYearPicker" title="年"><option value="2014">2014</option>
                                            <option value="2015">2015</option>
                                            <option value="2016">2016</option>
                                            <option value="2017">2017</option>
                                            <option value="2018">2018</option>
                                            <option value="2019">2019</option>
                                            <option value="2020">2020</option>
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
    <!--
    <script>        var SFDCSessionVars = { "uid": "0059000000390Wh", "exp": 1431488107000, "host": "", "oid": "00D90000000yvHG", "server": "", "act": "u" };</script>
    <script>        var SFDCMktUrl = 'https://login..com/17181/logo180.png';</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1424969980000/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>
    <script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/1425578748000/sfdc/MarketingSurveyResponse.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
</body>
</html>
<!-- page generation time: 231ms -->

