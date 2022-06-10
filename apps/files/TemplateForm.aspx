<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TemplateForm.aspx.cs" Inherits="WebClient.apps.files.TemplateForm" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模板套红</title>
    <script type="text/javascript">
        function CheckValue(theForm) {
            var mObject =parent.window.dialogArguments;
            mObject.Template = theForm.WordList.value;
            window.close();
            return;
        }
    </script>
</head>
<body>
    <form id="iForm" name="iForm" runat="server">
        <table border="0" cellspacing='0' cellpadding='0' width="100%" height="100%" align="center">
            <tr>
                <td align="center">
                    <table border="0" cellspacing='0' cellpadding='0' style="font: '宋体'; font-size: 12px">
                        <tr>
                            <td height="35" nowrap>请选择需要套红的模版名称：</td>
                        </tr>
                        <tr>
                            <td height="35" align="center" nowrap>
                                <select id="WordList" name="WordList" style="height: 25px;">
                                    <option value="">--选择模板--</option>
                                    <%=TemplateOptions%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td height="35" style="color: #FF0000" nowrap></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    <input type="button" id="btnloadtemp" class="btn_shuaxin" onclick="CheckValue(iForm);"
                        value="应用模板" /><input type="button" value="取消" onclick="window.close()" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>