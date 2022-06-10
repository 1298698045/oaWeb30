<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActivityAttach.aspx.cs"
    Inherits="WebClient.attach.ActivityAttach" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="display: none !important;">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>上传文件</title>
    <meta http-equiv="PRAGMA" content="NO-CACHE" />
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script>window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1439334362000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2015-8-20 下午5:54", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": false }], "startOfWeek": "1", "isAccessibleMode": false, "isCurrentlySysAdminSU": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "0059000000390Wh", "dateTimeFormat": "yyyy-M-d ah:mm", "isS1Desktop": false, "userName": "jackliu185@sina.com", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/elements.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/common.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
     <script src="/jslibrary/sfdc/Security.js"></script>   
      <script src="/js/jquery/1.7.1/jquery.min.js"></script>
     <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <style>
        .deleteinput{
            font-size:20px;
            color:#000;
            visibility:hidden;
            cursor:pointer;
            position:relative;
            top:3px;
        }
        
        .inputitem:hover .deleteinput{
            visibility:initial;
        }
        .inputitem{
            height:36px;
        }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();" class="hasMotif homeTab  ActivityAttach" onfocus="if(this.bodyOnFocus)bodyOnFocus();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <form action="/p/attach/ActivityAttach" enctype="multipart/form-data" id="editPage" method="post" name="editPage" onsubmit="if (window.ffInAlert) { return false; }">
          <input  type="hidden" name="isUpload" id="isUpload" value="0" />
          <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
        <div class="genericPageBlockTable">
            <table>
                <tr>
                    <td><strong>1.</strong></td>
                    <td><strong>选择文件</strong></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>输入文件路径或单击“浏览”按钮查找文件。</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <div id="uploadinput">
                        <div class="inputitem"><input id="file" name="file[]"  size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" multiple="multiple"  onchange="getFileSizeandName(this);"/><span class="deleteinput" onclick="deleteinput(this)">×</span></div>
                        <%--2.<input id="file1" name="file1" name="file[]" size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" multiple="multiple"  onchange="getFileSizeandName(this);" /><br/><br/>
                        3.<input id="file2" name="file2"name="file[]"  size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" multiple="multiple"  onchange="getFileSizeandName(this);" /><br/><br/>
                        4.<input id="file3" name="file3"name="file[]"  size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" multiple="multiple"  onchange="getFileSizeandName(this);" /><br/><br/>
                        5.<input id="file4" name="file4"name="file[]"  size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" multiple="multiple"  onchange="getFileSizeandName(this);" /><br/>--%>
                        </div>
                        
                          <br />
                        <div id="fileListContainer">
                            <div><input value="增加选择控件" style="height:25px;position: relative;top:-12px;left:-1px;width:86px;" class="btn" name="Attach" onclick="addinput()" type="button" /></div>
                            已选文件：<br />
                            <ul id="fileList">

                            </ul>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td><strong>2.</strong></td>
                    <td><strong>文件权限：</strong><select id="AccessRight" name="AccessRight">
                        <option value="0" selected="selected">可在线查看、下载</option>
                         <option value="2">仅在线查看</option>
                         <!--<option value="4">全部权限</option>-->
                         <option value="8">可下载</option>
                        </select></td>
                </tr>
                <tr>
                    <td><strong>3.</strong></td>
                    <td><strong>单击“上传文件”按钮。</strong></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>重复步骤 1 和步骤 2 的操作，附加多个文件。
                        <br />
                        <span style="color:red;">注意：扩展名exe,asp,aspx,js,jsp,php,dll不能上传。</span>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                         <br />
                        （上载完毕后，文档信息将显示在下方。)</td>
                </tr>
                <tr><td><strong>4.</strong></td>
                    <td> <input type="checkbox" name="autounzip" id="autounzip" value="1" checked="checked" /><strong>自动解压ZIP文件格式，生成多个文件附件。</strong></td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <input value=" 上传文件 " style="height:25px;" class="btn" name="Attach" onclick="javascript: document.getElementById('isUpload').value = '1'; setLastMousePosition(event); window.openPopup('/widg/uploadwaitingnotify.aspx', 'uploadWaiting', 400, 130, 'width=400,height=130,resizable=no,toolbar=no,status=no,scrollbars=no,menubar=no,directories=no,location=no,dependant=no', true);" title="附加文件 （新窗口）" type="submit" /></td>
                </tr>
            </table>
        </div>
    </form>
    <form id="editPage_1" name="editPage" enctype="multipart/form-data" action="/msg/EmailAttach.aspx" method="post" onsubmit="if (window.ffInAlert) { return false; }">
        <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl2" />
        <table class="fileUploadTableBottom" style="display:none">
            <tr>
                <td><strong>3.</strong></td>
                <td><strong>单击&quot;完成&quot;按钮返回上一页。</strong></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>（这将取消正在进行的上载过程。 )</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <input value=" 完成 " class="btn" name="cancel" onclick="window.close();" title="完成" type="submit" /></td>
            </tr>
        </table>
    </form>
    &nbsp;
                  <script type="text/javascript">
                      var totalsizeOfUploadFiles = 0;
                      function getFileSizeandName(input) {
                          var select = jQuery('#fileList');
                          var html = "";
                          for (var i = 0; i < input.files.length; i++) {
                              var filesizeInBytes = input.files[i].size;
                              var filesizeInMB = (filesizeInBytes / (1024 * 1024)).toFixed(2);
                              var filename = input.files[i].name;
                              //alert("File name is : "+filename+" || size : "+filesizeInMB+" MB || size : "+filesizeInBytes+" Bytes");
                              html += "<li>文件名：<a style='color:blue;'>" + filename + "</a> 大小：" + filesizeInMB + "M</li>";

                          }
                          select.html(html);
                      }

                      function CloseAndRefresh() {
                          window.opener.refreshAttachFrame();
                          self.close();
                          window.closePopup();
                          opener.location.reload(true);
                      }
                      function addinput() {
                          $('#uploadinput').append('<div class="inputitem"><input id="file" name="file[]"  size="20" title="输入文件路径或单击“浏览”按钮查找文件。" type="file" multiple="multiple"  onchange="getFileSizeandName(this);"/><span class="deleteinput" onclick="deleteinput(this)">×</span></div>')
                      }
                      
                      function deleteinput(that){
                          $(that).parent('.inputitem').remove();
                      }
</script>

    <!-- Body events -->
    <script type="text/javascript">function bodyOnLoad() { setFocusOnLoad(); if (typeof (startSessionTimer) != 'undefined') { startSessionTimer(); }; if (window.PreferenceBits) { window.PreferenceBits.prototype.csrfToken = "VmpFPSxNakF4TlMwd09TMHhOMVF3T1RvMU5EbzBNaTR3TlROYSxUaDY5LE1HVXdaalF3"; }; } function bodyOnBeforeUnload() { } function bodyOnFocus() { }
    
        function bodyOnUnload() {

            if (document.getElementById("isUpload").value == "1") {
                if (typeof window.opener.refreshAttachFrame != 'undefined') {
                   window.opener.refreshAttachFrame();
                }
                else {
                    if (opener.$('#relatedfilelist').length > 0) {
                        opener.entityAttachmentList.load();
                    }
                    if (typeof opener.entityAttachmentList != 'undefined') {
                        opener.entityAttachmentList.load();
                    }
                    else {
                       window.opener.location.reload();
                    }
                }
            }
            //opener.location.reload()
            //window.opener.success2("上传成功");
            window.closePopup()
        }
    </script>
</body>
</html>
