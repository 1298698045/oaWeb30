<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createInstancePop.aspx.cs" Inherits="WebClient.apps.wf.createInstancePop" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script src="/static/111213/js/perf/stub.js" type="text/javascript"></script>
    <script src="/static/111213/js/functions.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/main.js" type="text/javascript"></script>
    <script src="/jslibrary/jslabels/zh_CN.js" type="text/javascript"></script>
    <script src="/static/111213/desktop/desktopAjax.js" type="text/javascript"></script>
    <script src="/static/111213/js/picklist.js" type="text/javascript"></script>
    <script src="/jslibrary/sfdc/VFState.js" type="text/javascript"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/zen-componentsCompatible.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/elements.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/common.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/setup.css" rel="stylesheet" type="text/css" />
    <link class="user" href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/photoupload.css" rel="stylesheet" type="text/css" />
    <title>发起流程</title>
</head>
<body>
    <script>
        window.onLoad = new function () {
            var handle = window.opener ? window.opener : window.parent;
            //This resize has to be here (even though the AccessibleDialog is created with the correct width).
            //We resize the dialog for the upload.  However, we don't destroy and create a new one.  Therefore, if you
            //upload two photos without reloading the page, you'll have a dialog that is very wrong.
            // handle.resizeDialog(400, 500);
        }
    </script>
    <div class="inProgressOverlay" id="inProgress" style="display: none">
        <div align="center" class="contents">
            <img class="spinny" src="/img/loading32.gif" /><span style="font-weight: bold; font-family: Arial; font-size: 110%">&#27491;&#22312;&#19978;&#36733;&#29031;&#29255;...</span>
        </div>
    </div>
    <form id="createInstancePop" name="createInstancePop" method="post" action="createInstancePop.aspx" onsubmit="if (!checkForm()) {return false;} ">
        <input type="hidden" name="pr_template_id" id="pr_template_id" value='<%=Request["processId"]%>' />
        <input type="hidden" name="processName" id="processName" value='<%=Request["name"]%>' />
        输入流程事务标题，建立事务<p></p>
        <table class="">
            <tr>
                <td>
                    <label style="font-weight: bold; font-size: 13px;">流程：</label></td>
                <td><a href="#" style="font-weight: bold; font-size: 13px; color: #015ba7; text-decoration: none; text-decoration-line: none;"><%=ProcessName%></a></td>
            </tr>
            <tr>
                <td style="height: 3px"></td>
            </tr>
           
            <tr>
                <td nowrap="nowrap">
                    <label style="font-weight: bold; font-size: 13px;">发起部门：</label></td>
                <td>
                    <%=BusinessUnitIdControlHtml%></td>
            </tr> 
             <tr>
                <td style="height: 3px"></td>
            </tr> 
            <tr>
                <td>
                    <label style="font-weight: bold; font-size: 13px;color:red;">标题*：</label></td>
                <td>
                    <input style="width: 330px; height: 25px;" id="instanceName" name="instanceName" value='<%=InstanceName%>' /></td>
            </tr>
            <tr>
                <td style="height: 3px"></td>
                <td style="color:red;">默认标题是 流程名称 部门名称，为了查询方便，请输入流程真实标题。<br />如收文 关于XX来文 XX科室 XX人。</td>
            </tr>
            <tr style="display:none;">
                <td>
                    <label for="cell" class="zen-label" style="font-weight: bold; font-size: 13px;">办理期限：</label></td>
                <td>
                    <input style="width: 80px; height: 25px;" id="instanceDeadline" name="instanceDeadline" value="3" />天数</td>
            </tr>            
            <tr>
                <td style="height: 3px"></td>
            </tr>
            <tr>
                 <td nowrap="nowrap">
                    <label style="font-weight: bold; font-size: 13px;">紧急程度：</label> 
                </td>
                <td class="data2Col">
                    <div class="requiredInput">
                        <div class="requiredBlock">
                        </div>
                        <select name="priority" id="priority">
                            <option value="0">普通</option>
                            <!--<option value="1">中等</option>-->
                            <option value="2">紧急</option>
                        </select>
                    </div>
                </td>
            </tr>  
            <tr>
                <td style="height: 3px"></td>
            </tr>          
            <tr>
                <td>
                    <label style="font-weight: bold; font-size: 13px;">备注：</label></td>
                <td>
                    <textarea name="desc" id="desc" rows="5" cols="10" style="width: 320px;"></textarea></td>
            </tr>
            <tr>
                <td style="height: 5px"></td>
            </tr>
        </table>
        <div class="uploadButtonPanel">
            <script> if (!window.sfdcPage) { window.sfdcPage = new ApexPage(); } UserContext.initialize({ "ampm": ["上午", "下午"], "isAccessibleMode": false, "uiSkin": "Theme3",  "dateFormat": "yyyy-M-d", "isS1Desktop": false, "language": "zh_CN", "locale": "zh_CN", "userName": "jackliu185@sina.com", "userId": "0059000000390Wh", "isCurrentlySysAdminSU": false, "renderMode": "RETRO", "startOfWeek": "1", "dateTimeFormat": "yyyy-M-d ah:mm", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }, { "index": 113, "name": "GroupTasks", "value": true }], "siteUrlPrefix": "", "isDefaultNetwork": true, "labelLastModified": "1449795208000", "today": "2015-12-19 上午11:23", "timeFormat": "ah:mm", "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": true }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": true }, { "index": 183, "name": "HideAssociationQueueCallout", "value": true }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": true }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": true }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": true }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": true }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": true }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": true }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": true }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": true }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": true }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": true }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": false }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": true }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": true }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": true }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": false }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": true }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": true }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }, { "index": 358, "name": "HideEmailVerificationAlert", "value": false }, { "index": 354, "name": "HideLearningPathModal", "value": false }, { "index": 359, "name": "HideAtMentionsHelpBubble", "value": true }, { "index": 368, "name": "LightningExperiencePreferred", "value": false }], "networkId": "" });
            </script>
            <input id="j_id0:save" type="submit" style="width: 80px; height: 25px;" name="save" value="保存" class="btn saveButton" /><input id="j_id0:uploadFileForm:uploadBtn" type="submit" name="j_id0:uploadFileForm:uploadBtn" value="保存" style="display: none;" class="btn saveButton" />
            <input class="btn" onclick="closeDialog()" style="width: 80px; height: 25px;" type="button" value="取消" />
        </div>
        <script>
            $(function(){
                var selt = $('#businessUnit_lkid').find("option:selected").text();
                $('#businessUnit_lkid').change(function(){
                    var selected = $('#businessUnit_lkid').find("option:selected").text();
                    var a = $('#instanceName').val();
                    a = a.replace(selt, selected);
                    instanceName.value = a;
                    selt = selected;
                    BusinessUnitName.value = selected;
                });
            });

            var clientSideErrorMessageDiv = document.getElementById('j_id0:uploadFileForm:clientSideErrorMessage');
            var clientSideErrorMessageText = document.getElementById('j_id0:uploadFileForm:clientSideErrorMessageText');
            var serverSideErrorMessageDiv = document.getElementById('j_id0:uploadFileForm:serverSideErrorMessage');

            var filenameInputElement;
            var arrInputs = document.getElementsByTagName("input");
            for (var i = 0; i < arrInputs.length; i++) {
                var inputElement = arrInputs[i];
                if (inputElement && inputElement.type === "file" && inputElement.id.indexOf("uploadInputFile") >= 0) {
                    filenameInputElement = inputElement;
                    break;
                }
            }



            function setErrorMessage(msg) {
                hideInProgress();
                clientSideErrorMessageText.innerHTML = msg;
                clientSideErrorMessageDiv.style.display = "block";
                if (serverSideErrorMessageDiv) {
                    serverSideErrorMessageDiv.style.display = "none";
                }
            }

            function clearErrorMessage() {
                clientSideErrorMessageDiv.style.display = "none";
                if (serverSideErrorMessageDiv) {
                    serverSideErrorMessageDiv.style.display = "none";
                }
            }

            function closeDialog() {
                window.close();
                if (window.opener) {
                    window.opener.closeDialog(false);
                } else {
                    window.parent.closeDialog(false);
                }
            }

            function showInProgress() {
                // IE6 compatible
                var height = typeof window.innerHeight != "undefined" ?
                                    window.innerHeight : document.documentElement.clientHeight;

                var inProgress = document.getElementById("inProgress");
                inProgress.style.display = "block";
                inProgress.style.height = height + "px";
                inProgress.style.width = "100%";
            }

            function hideInProgress() {
                var inProgress = document.getElementById("inProgress");
                inProgress.style.display = "none";
            }

            function clickUploadButton() {
                document.getElementById('j_id0:uploadFileForm:uploadBtn').click();
            }

            function uploadInputFileKeyPress(event) {
                if (false && event.keyCode == 13) {
                    clickUploadButton();
                    return false;
                }
                return true;
            }

            function uploadInputFileChange() {
                if (false) {
                    clickUploadButton();
                }
                else {
                    document.getElementById('j_id0:uploadFileForm:save').style.display = "none";
                    document.getElementById('j_id0:uploadFileForm:uploadBtn').style.display = "";
                }
            }
            function checkForm() {
                var temp = document.getElementById("instanceName").value;
                if (temp == null || temp.length == 0) {
                    setErrorMessage('请输入标题。');
                    return false;
                }
                return true;
            }
            function onSubmitForm() {
                var validFileName = true;

                validFileName = checkForm();
                /*
                if (validFileName) {
                    // send tracking info to omniture before submitting the form.
                    // (script is available only if tracking is enabled)
                    Sfdc.require("SfdcApp.Omni.Config", function (OmniConfig) {
                        OmniConfig.trackActivity('profile-photo-upload');
                    });
                }
                */
                if (true) {
                    if (!validFileName) {
                        closeDialog();
                    }
                }
                else {
                    return validFileName;
                }
            }
        </script>
    </form>
</body>
</html>
