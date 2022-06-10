<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanceNotifyRead.aspx.cs" Inherits="WebClient.apps.wf.InstanceNotifyRead" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>传阅</title>
   <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <style>
    </style>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/apps/flowdesigner/editors/js/workflow.js"></script>
    <script type="text/javascript">
        function lookupPickActivity(a, b, c, d, e, f) {
            //document.getElementById('jumpActivity_lkid').value = val;
            //document.getElementById('jumpActivity').value = text;
            // debugger;
            //stepChange(val);

            var ids = e.split(',');
            //var names = f.split(',');
            var userIds = "";
            for (var c1 = 0; c1 < ids.length; c1++) {
                if (c1 > 0)
                    userIds += ",";
                var userId = ids[c1].substring(2);
                userIds += userId;
            }
            document.getElementById(b).value = userIds;//id
            document.getElementById(c).value = f;//name
        }
        function closeDialog(refreshParent) {
            if (window.opener) {
                window.opener.closeDialog(refreshParent);
            } else {
                window.parent.closeDialog(refreshParent);
            }
        }
        function stepChange(stepId) {
            var procId = jQuery("#processId").val();
            //var stepId = "";
            //debugger;
            var elSel = document.getElementById('duel_reports_select_0');
            removeSelectOption(elSel);
            elSel = document.getElementById('duel_reports_select_1');
            removeSelectOption(elSel);

            getStepPossibleParticipantors(procId, stepId, fillUsers);
        }
        var dule111 = document.getElementById("duel_reports_select_0");
        function fillUsers(data) {
            var sC = 0;
            var aC = 0;
            //document.getElementById("duel_reports_select_0").options.clear();
            //document.getElementById("duel_reports_select_1").options.clear();
            for (var c = 0; c < data.length; c++) {
                var item = data[c];
                //duel_reports_select_0
                //dule111.options[c] = new Option(item.userName, item.userId);
                if (item.selected) {
                    document.getElementById("duel_reports_select_1").options[sC] = new Option(item.userName, item.userId);
                    sC++;
                }
                else {
                    document.getElementById("duel_reports_select_0").options[aC] = new Option(item.userName, item.userId);
                    aC++;
                }
            }
        }
        function removeSelectOption(elSel) {
            //var elSel = document.getElementById('selectX');
            var i;
            for (i = elSel.length - 1; i >= 0; i--) {
                elSel.remove(i);

            }
        }
        function _wfNotifyRead()
        {
            var procInstanceId, members, msg, bySms, bySysMsg;
            procInstanceId = jQuery("#InstanceId").val();
            members = jQuery("#zhihuiMember_lkid").val();
            msg = jQuery("#zhihuiInfo").val();
            bySms = jQuery("#zhihuiChannel1").val();
            bySysMsg = jQuery("#zhihuiChannel2").val();

            wfNotifyRead(procInstanceId, members, msg, bySms, bySysMsg);
            closeDialog(false);
        }
        //        jQuery(document).ready(function () {
        //            jQuery("#jumpActivity_lkid").change(function (a) {
        //                //alert("Handler for .change() called.");
        //                var procId = jQuery("#processId").val();
        //                var stepId = "";
        //                //debugger;
        //                //getStepPossibleParticipantors(procId, stepId, fillUsers);
        //            });
        //        });
    </script>
</head>
<body class="hasMotif userTab  ContactInfoEditPage  ext-gecko ext-gecko3" >
      <div class="zen">
            <div class="zen-body" style="padding:0">
    <form id="editPage" method="post" name="editPage" action="InstanceNotifyRead.aspx"
        onsubmit="if (window.ffInAlert) { return false; }if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }">
        <input id="processId" type="hidden" value="<%=ProcessId%>" name="processId" />
        <input id="InstanceId" type="hidden" value="<%=ProcessInstanceId%>" name="InstanceId" />
        <input id="fromStepId" type="hidden" name="fromStepId" />
        <input id="duel_reports0" type="hidden" value="" name="duel_reports0" />
        <input id="duel_reports1" type="hidden" value="" name="duel_reports1" />
        <div>
            <div class="pbBody">
                <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                    <tr>
                        <td class="labelCol" nowrap="nowrap">
                            <label>
                                传阅方式：</label>
                        </td>
                        <td class="data2Col">
                            <input type="checkbox" id="zhihuiChannel" name="zhihuiChannel1" value="1" checked />系统消息
                            <input type="checkbox" id="zhihuiChannel2" name="zhihuiChannel2" value="2" checked />手机短信
                        </td>
                    </tr>
                    <tr>
                        <td style="height:5px;"></td>
                    </tr>
                    <tr>
                        <td class="labelCol" nowrap="nowrap">
                            <label>
                                传阅人员：
                            </label>
                        </td>
                        <!--<td class="data2Col"><textarea wrap="soft" type="text" title="抄送到" rows="6" name="zhihuiMember" maxlength="2000" id="zhihuiMember" cols="70"></textarea>&nbsp;<a title="抄送到 查找（新窗口）" onclick="setLastMousePosition(event)" id="p24_lkwgt" href="javascript:%20openPopup%28%27%2F_ui%2Fcore%2Femail%2Fauthor%2FEmailCCBccLookup%27%2C%20%27CCBCCLookup%27%2C%20420%2C%20490%2C%20%27width%3D420%2Cheight%3D490%2Ctoolbar%3Dno%2Cstatus%3Dno%2Cdirectories%3Dno%2Cmenubar%3Dno%2Cresizable%3Dyes%2Cscrollable%3Dno%27%2C%20true%29%3B"><img title="抄送到 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="抄送到 查找（新窗口）" src="/s.gif"></a></td>-->
                        <td class="data2Col">
                            <input type="hidden" id="zhihuiMember_lkid" name="zhihuiMember_lkid" />
                            <input type="hidden" value="" id="zhihuiMember_lktp" name="zhihuiMember_lktp" />
                            <input type="hidden" value="" id="zhihuiMember_lkold" name="zhihuiMember_lkold" />
                            <input type="hidden" value="1" id="zhihuiMember_lspf" name="zhihuiMember_lspf" />
                            <input type="hidden" value="0" id="zhihuiMember_lspfsub" name="zhihuiMember_lspfsub" />
                            <input type="hidden" value="0" id="zhihuiMember_mod" name="zhihuiMember_mod" />
                            <span class="lookupInput">
                                <input type="text" style="width: 380px;height:25px;" id="zhihuiMember" name="zhihuiMember" />
                                <a href="javascript:openLookup('/_ui/common/data/UserLookResult.aspx?lkfm=editPage&amp;lknm=zhihuiMember&amp;lktp='+getElementByIdCS('zhihuiMember_lktp').value,900,'1')"
                                    tabindex="3" title="查找（知会人员） （新窗口）">
                                    <img src="/s.gif" alt="查找（知会人员） （新窗口）" class="lookupIcon" onblur="this.className = 'lookupIcon';"
                                        onfocus="this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';"
                                        onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                        title="查找（知会人员） （新窗口）" /></a> </span>
                        </td>
                    </tr>
                  <tr>
                        <td style="height:5px;"></td>
                    </tr>   <tr>
                        <td class="labelCol">
                            <label>
                                提醒信息：</label>
                        </td>
                        <td class="data2Col">
                            <textarea cols="60" id="zhihuiInfo" maxlength="32000" name="zhihuiInfo" onchange="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                onclick="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                onkeydown="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                onkeyup="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                onmousedown="handleTextAreaElementChangeWithByteCheck('memo', 32000, 0, '剩余', '超出极限');"
                                rows="6" tabindex="8" type="text" wrap="soft"><%=NotifyReadMessage%></textarea>
                        </td>
                    </tr>
                </table>
            </div>
             <div class="net-buttons zen-mtl">
                <table cellspacing="0" cellpadding="0" border="0" width="100%">
                    <tbody>
                        <tr>
                            <td class="pbTitle">
                                <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif" />&nbsp;
                            </td>
                            <td id="bottomButtonRow" class="pbButtonb">
                                <input type="button" name="save" title="确定" class="primary btn" style="height:25px;" value=" 确定 " onclick="_wfNotifyRead(); " />
                                <input type="button" name="cancel" title="取消" class="btn" style="height:25px;" value=" 取消 " onclick="closeDialog(false);" />
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
    </form>
   </div> </div>
</body>
</html>
