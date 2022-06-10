<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstanceTranAgent.aspx.cs"
    Inherits="WebClient.apps.wf.InstanceTranAgent" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>转代理</title>
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/zen-componentsCompatible.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/elements.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/common.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/33.0/sprites/1426180668000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <%--<link href="/sCSS/33.0/sprites/1431919649000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />--%>
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/apps/flowdesigner/editors/js/workflow.js"></script>
    <script  type="text/javascript">
        function closeDialog(refreshParent) {
            if (window.opener) {
                window.opener.closeDialog(refreshParent);
            } else {
                window.parent.closeDialog(refreshParent);
            }
        }
        function validateAndSave() {
            var agentId = document.getElementById("agentname_lkid").value;
            //alert(agentId);
            if (agentId == "" || agentId == "00000000-0000-0000-0000-000000000000")
            {
                alert("代理人员必须输入！");
                return false;
            }
            //alert("转代理成功！");
            return true;
        }
        function saveData()
        {
            var agentId = document.getElementById("agentname_lkid").value;
            if (agentId == "")
            {
                alert("请选代理人！");
                return;
            }

            var id = jQuery("#editPage").val();
            var url = "/WFPageProcessor.ashx?cmd=wftranagent";
            var form = jQuery(document.forms.editPage);
            jQuery.ajax({
                async: true, cache: false, data: form.serialize(), dataType: "json",
                error: function (request, textStatus, errorThrown) {
                    
                },
                success: function (data, textStatus) {
                    closeDialog(true);
                },
                type: "POST",
                url: url
            });
        }
    </script>
</head>
<body>
    <form id="editPage" method="post" name="editPage" action="InstanceTranAgent.aspx" onsubmit="if (!validateAndSave()) { return false; }">
         <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
    <table class="detailList" border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td colspan="2">
                <div class="pbError" id="errorDiv_ep" style="display: none">
                                                错误：无效数据。<br />
                                                请查看下列所有错误消息以纠正数据。</div>
            </td>
        </tr>
        <tr>
            <td class="labelCol requiredInput">
                <label for="cpn1">
                    <span class="requiredMark">*</span><b>当前节点名称：</b></label>
            </td>
            <td class="dataCol col02">
                <%=FromStepName%>
            </td>
        </tr>
        <tr>
            <td style="height: 10px">
            </td>
        </tr>
        <tr>
            <td class="labelCol requiredInput">
                <label for="cpn1">
                    <span class="requiredMark">*</span><b>代理人：</b></label>
            </td>
            <td class="dataCol col02">
                <input id="agentname_lkid" type="hidden" name="agentname_lkid" value="<%=AgentUserId%>" />
                <input id="agentname_lkold" type="hidden" value="null" name="agentname_lkold"   />
                <input id="agentname_lktp" type="hidden" value="8" name="agentname_lktp" />
                <input id="agentname_lspf" type="hidden" value="0" name="agentname_lspf" />
                <input id="agentname_lspfsub" type="hidden" value="0" name="agentname_lspfsub" />
                <input id="agentname_mod" type="hidden" value="0" name="agentname_mod" />
                <span class="lookupInput">
                    <input type="text" tabindex="2" size="20" name="agentname" maxlength="255" id="agentname"
                         value="<%=AgentUserName%>" /><a title="代理人 查找（新窗口）" tabindex="2" onclick="setLastMousePosition(event)"
                            id="agentname_lkwgt" href="javascript:openLookup('/_ui/common/data/LookupPage?lktp=8&lknm=agentname&lkfm=editPage&lksrch=')"><img
                                title="代理人 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';"
                                onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';"
                                onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="代理人 查找（新窗口）"
                                src="/s.gif"></a></span>
            </td>
        </tr>
        <tr>
            <td style="height: 10px">
            </td>
        </tr>
        <tr>
            <td class="labelCol requiredInput">
                <label for="cpn1">
                    <span class="requiredMark">*</span><b>通知代理人：</b></label>
            </td>
            <td class="data2Col">
                <textarea name="notifyMsg" id="notifyMsg" cols="55" rows="5"><%=NotifyMessage%></textarea>
            </td>
        </tr>
    </table>
    <br />
    <div>
        <div class="net-buttons zen-mtl">
            <input type="button" value="确定" class="zen-btn zen-primaryBtn zen-pas"  name="save" style="cursor:pointer; height:25px;" onclick="saveData()" />
            <input type="button" value="取消" class="zen-btn zen-pas" onclick="javascript: closeDialog(false);" id="editContactInfoCancelButton" style="cursor:pointer; height:25px;" />
        </div>
    </div>
    </form>
</body>
</html>
