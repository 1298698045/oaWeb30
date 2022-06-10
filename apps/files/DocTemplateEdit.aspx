<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocTemplateEdit.aspx.cs"
    Inherits="WebClient.apps.files.DocTemplateEdit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>模板编辑 -      <%=PageTitle%></title>
    <style>
        .table2{
            display:none;
        }
        .tablenav{
            margin-top:10px;
        }
        .item-head>div{
            float:left;
        }
        .clear{
            float:none !important;
            clear:both;
            width:0;
        }
        .tablenav>div{
            float:left;
            padding:5px;
            margin-right:15px;
            cursor:pointer;
        }
        .tablenav>div.active{
            border-bottom:3px solid #0094ff;
        }
        .tablenav>div:hover{
            border-bottom:3px solid #0094ff;
            color:#0094ff;
        }
        input{
            border:1px solid #dedede;
            border-radius:4px;
        }
        input[type='text']{
            height:30px;
            text-indent:5px;
            width:300px !important;
        }
        .item-head>div:first-child{
            margin-top:5px;
        }
        input[type='button'],input[type='submit']{
            background-color:white;
            padding:5px 10px;
            cursor:pointer;
        }
        input[type='button']:hover,input[type='submit']:hover{
            background-color:#0094ff;
            color:white;
        }
    </style>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
      <script language="javascript" for="WebOffice" event="OnToolsClick(vIndex,vCaption)">
   if (vIndex==1){  //打开本地文件
      WebOpenLocal();
   }
   if (vIndex==2){  //保存本地文件
      WebSaveLocal();
   }
   if (vIndex==4){  //保存并退出
     SaveDocument();    //保存正文
     webform.submit();  //提交表单
   }
   if (vIndex==6){  //打印文档
      WebOpenPrint();
   }
    </script>
    <script language="javascript">

        //作用：显示操作状态
        function StatusMsg(mString) {
            StatusBar.innerText = mString;
        }

        //作用：载入iWebOffice
        function Load() {
            try {
                //debugger;
                //disableButtons();
                //if (document.getElementById("fullscreen").value == "1") {
                //    jQuery("#btnFullScreen").hide();
                //    jQuery("#btnClose").hide();
                //}
                //debugger;
                //以下属性必须设置，实始化iWebOffice
                webform.WebOffice.WebUrl = "<%=mServerUrl%>";             //WebUrl:系统服务器路径，与服务器文件交互操作，如保存、打开文档，重要文件
                webform.WebOffice.RecordID = "<%=mRecordID%>";            //RecordID:本文档记录编号
                webform.WebOffice.Template = "<%=mRecordID%>";            //Template:模板编号
                webform.WebOffice.FileName = "<%=mFileName%>";            //FileName:文档名称
                webform.WebOffice.FileType = "<%=mFileType%>";            //FileType:文档类型  .doc  .xls  .wps
                webform.WebOffice.UserName = "<%=mUserName%>";            //UserName:操作用户名，痕迹保留需要
                webform.WebOffice.EditType = "<%=mEditType%>";            //EditType:编辑类型  方式一、方式二  <参考技术文档>
                //第一位可以为0,1,2,3 其中:0不可编辑;1可以编辑,无痕迹;2可以编辑,有痕迹,不能修订;3可以编辑,有痕迹,能修订；
                //第二位可以为0,1 其中:0不可批注,1可以批注。可以参考iWebOffice2009的EditType属性，详细参考技术白皮书
                webform.WebOffice.MaxFileSize = 4 * 1024;               //最大的文档大小控制，默认是8M，现在设置成4M。
                webform.WebOffice.Language = "CH";                        //Language:多语言支持显示选择   CH简体 TW繁体 EN英文
                //webform.WebOffice.ShowWindow = true;                  //控制显示打开或保存文档的进度窗口，默认不显示
                webform.WebOffice.PenColor = "#FF0000";                   //PenColor:默认批注颜色
                webform.WebOffice.PenWidth = "1";                         //PenWidth:默认批注笔宽
                webform.WebOffice.Print = "1";                            //Print:默认是否可以打印:1可以打印批注,0不可以打印批注
                webform.WebOffice.ShowToolBar = "0";                      //ShowToolBar:是否显示工具栏:1显示,0不显示

                //以下为自定义工具栏按钮↓ 参数一:Index按钮编号,参数二:Caption按钮显示内容,参数三:Icon图标名称
                ///webform.WebOffice.AppendTools("11", "隐藏手写批注", 11);  //在OnToolsClick中的 vIndex=11 ,vCaption="隐藏手写批注";
                ///webform.WebOffice.AppendTools("12", "显示手写批注", 12);  //在OnToolsClick中的 vIndex=12 ,vCaption="显示手写批注";
                ///webform.WebOffice.AppendTools("13", "-", 0);
                //以上为自定义工具栏按钮↑

                webform.WebOffice.ShowMenu = "1";                         //控制整体菜单显示
                //以下为自定义菜单↓
                webform.WebOffice.AppendMenu("1", "打开本地文件(&L)");
                webform.WebOffice.AppendMenu("2", "保存本地文件(&S)");
                webform.WebOffice.AppendMenu("3", "保存远程文件(&U)");
                webform.WebOffice.AppendMenu("4", "-");
                ///webform.WebOffice.AppendMenu("5", "签名印章(&Q)");
                /// webform.WebOffice.AppendMenu("6", "验证签章(&Y)");
                ///webform.WebOffice.AppendMenu("7", "-");
                ///webform.WebOffice.AppendMenu("8", "保存版本(&B)");
                ///webform.WebOffice.AppendMenu("9", "打开版本(&D)");
                ///webform.WebOffice.AppendMenu("10", "-");
                ///webform.WebOffice.AppendMenu("11", "保存并退出(&E)");
                ///webform.WebOffice.AppendMenu("12", "-");
                ///webform.WebOffice.AppendMenu("13", "打印文档(&P)");
                //以上为自定义菜单↑
                ///webform.WebOffice.DisableMenu("宏(&M);选项(&O)...");    //禁止某个（些）菜单项
                webform.WebOffice.ShowType = "1";              //文档显示方式  1:表示文字批注  2:表示手写批注  0:表示文档核稿
                //WebSetRibbonUIXML();                                  //控制OFFICE2007的选项卡显示
                webform.WebOffice.WebOpen();                            //打开该文档    交互OfficeServer  调出文档OPTION="LOADFILE"    调出模板OPTION="LOADTEMPLATE"     <参考技术文档>

                StatusMsg(webform.WebOffice.Status);                    //状态信息
            } catch (e) {
                //debugger;
                alert(e.description);                                   //显示出错误信息
            }
        }

        //作用：退出iWebOffice
        function UnLoad() {
            try {
                if (!webform.WebOffice.WebClose()) {
                    StatusMsg(webform.WebOffice.Status);
                } else {
                    StatusMsg("关闭文档...");
                }
            } catch (e) { }
        }


        //作用：打开文档
        function LoadDocument() {
            StatusMsg("正在打开文档...");
            if (!webform.WebOffice.WebLoadTemplate()) {  //交互OfficeServer的OPTION="LOADTEMPLATE"
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }


        //作用：刷新文档
        function WebReFresh() {
            webform.WebOffice.WebReFresh();
            StatusMsg("文档已刷新...");
        }


        //作用：保存文档
        function SaveDocument() {
            var fileName = document.getElementById("FileName").value;
            if (fileName == "") {
                alert("模板名称必须输入！");
                return false;
            }
            webform.WebOffice.WebClearMessage();            //清空iWebOffice变量
            if (".doc" == ".doc") {
                if (!webform.WebOffice.WebSaveBookMarks()) {    //交互OfficeServer的OPTION="SAVEBOOKMARKS"
                    StatusMsg(webform.WebOffice.Status);
                    return false;
                }
            }
            //webform.WebOffice.WebSetMsgByName("MyDefine1","自定义变量值1");  //设置变量MyDefine1="自定义变量值1"，变量可以设置多个  在WebSaveTemplate()时，一起提交到OfficeServer中
            if (!webform.WebOffice.WebSaveTemplate(true)) {    //交互OfficeServer的OPTION="SAVETEMPLATE"，参数true表示保存OFFICE文档
                StatusMsg(webform.WebOffice.Status);
                return false;
            } else {
                StatusMsg(webform.WebOffice.Status);
                return true;
            }
        }

        //作用：填充模板
        function LoadBookmarks() {
            StatusMsg("正在填充模扳...");
            if (!webform.WebOffice.WebLoadBookmarks()) {    //交互OfficeServer的OPTION="LOADBOOKMARKS"
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }

        //作用：设置书签值  vbmName:标签名称，vbmValue:标签值   标签名称注意大小写
        function SetBookmarks(vbmName, vbmValue) {
            if (!webform.WebOffice.WebSetBookmarks(vbmName, vbmValue)) {
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }

        //作用：根据标签名称获取标签值  vbmName:标签名称
        function GetBookmarks(vbmName) {
            var vbmValue;
            vbmValue = webform.WebOffice.WebGetBookmarks(vbmName);
            return vbmValue;
        }

        //作用：打印文档
        function WebOpenPrint() {
            try {
                webform.WebOffice.WebOpenPrint();
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { }
        }

        //作用：页面设置
        function WebOpenPageSetup() {
            try {
                if (webform.WebOffice.FileType == ".doc") {
                    webform.WebOffice.WebObject.Application.Dialogs(178).Show();
                }
                if (webform.WebOffice.FileType == ".xls") {
                    webform.WebOffice.WebObject.Application.Dialogs(7).Show();
                }
            } catch (e) {

            }
        }

        //作用：标签管理
        function WebOpenBookMarks() {
            try {
                webform.WebOffice.WebOpenBookmarks();    //交互OfficeServer的OPTION="LISTBOOKMARKS"
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { }
        }

        //作用：存为本地文件
        function WebSaveLocal() {
            try {
                webform.WebOffice.WebSaveLocal();
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { }
        }

        //作用：打开本地文件
        function WebOpenLocal() {
            try {
                webform.WebOffice.WebOpenLocal();
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { }
        }
    </script>
    <script type="text/javascript">
        function CallSave() {
            return SaveDocument();
            /*
            if (!webform.WebOffice.WebSave()) {
            StatusMsg(webform.WebOffice.Status);
            alert("保存正文失败！");
            return false;
            } else {
            alert("保存正文成功！");
            StatusMsg(webform.WebOffice.Status);
            }
            */
        }
    </script>
</head>
<body bgcolor="#ffffff" onload="Load()" onunload="UnLoad()">
    <!--引导和退出iWebOffice-->
    <form name="webform" id="webform" method="post" action="DocumentSave.aspx" onsubmit="return SaveDocument();">
    <!--保存iWebOffice后提交表单信息-->
    <input type="hidden" id="fullscreen" name="fullscreen" value="<%=Request["fullscreen"]%>" />
    <input type="hidden" name="RecordID" value="<%=mRecordID%>" />
    <input type="hidden" name="Template" value="<%=mTemplate%>" />
    <input type="hidden" name="FileType" value="<%=mFileType%>" />
    <input type="hidden" name="EditType" value="<%=mEditType%>" />
    <input type="hidden" name="isTemplate" value="1" />
    <input type="hidden" name="retURL" id="retURL" value="<%=Request["retURL"]%>" />
    <table width="100%" height="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
        <tr>
            <td width="40%">
                    <div class="item-head">
                        <div>模板名称：
                        </div>
                        <div>  <input type="text" name="FileName" id="FileName" value="<%=mFileName%>" style="width: 200px;" /><br />
                        </div>
                        <div class="clear"></div>
                    </div>
                    <div class="tablenav"><div class="active">正文</div><div>基本信息</div>
                        <div class="clear"></div>
                    </div>               
            </td>
            <td align="right" valign="middle" height="30" width="60%" style="padding-right: 11px"
                >
                <!--
                <input type="button" class="btn_sjbd" onclick="javascript:WebDesign();return false;"
                    value="设计表单" />&nbsp;
                <input type="button" class="btn_shuaxin" onclick="javascript:WebReFresh();return false;"
                    value="刷新" />&nbsp;
                <input type="button" class="btn_cxzr" onclick="javascript:LoadDocument();return false;"
                    value="重新载入" />&nbsp;-->
                <input type="button" class="btn_open" onclick="javascript: WebOpenLocal();" value="打开本地" />&nbsp;
                <!--<input type="button" class="btn_ylbd" onclick="javascript:PreViewHtml();" value="预览表单" />&nbsp;
                <input type="button" class="btn_print" onclick="javascript:WebOpenPrint();" value="打印" />&nbsp;                
                <input type="button" class="btn_cwbd" onclick="javascript:WebSaveLocal();" value="存本地" />&nbsp;
                <input type="button" class="btn_delete" onclick="javascript:CallDelete();" value="删除" />&nbsp;-->
                <input type="submit" class="btn_save" value="保存到数据库" />
                <input type="button" id="btnFullScreen" class="btn_preserve" style="display: none"
                    onclick="javascript:window.open(window.location);" value="全屏" />
                <input type="button" id="btnClose" class="btn_close" style="display:block" onclick="javascript:window.close();"  value="关闭" />
            </td>
        </tr>
        <tr class="table1">
            <td bgcolor="#eeeeee" height="20" width="70%" colspan="5">
                <input type="hidden" id="statusBarText" name="statusBarText" />
                <span id="StatusBar" name="StatusBar" style="padding-left: 10px; float: left;"></span>
            </td>
            <td width="30%" bgcolor="#eeeeee" align="right" style="padding-top: 5px; padding-right: 5px;">
            </td>
        </tr>
        <tr class="table1" style="width: 100%">
            <td colspan="6" rowspan="12" align="right" valign="top">
                <table border="0" cellspacing="0" cellpadding="0" width="100%">
                    <tr>
                        <td bgcolor="menu" valign="top">
                            <!--调用iWebPicture，注意版本号，可用于升级-->
                            <!--<script src="iWebOffice2009.js" type="text/javascript"></script>-->
                              <%if(IsIE()) { %>
                             <object id="WebOffice" width="100%" height="100%" classid="clsid:23739A7E-5741-4D1C-88D5-D50B18F7C347" 
                                            codebase="iWebOffice2003.ocx#version=1,0,0,0">
                                        </object>
                            <%} else {  %>
                            <object progid="iWebOffice2003.iWebOffice" id='Object1' type="application/iwebplugin"  width="100%" 
                                OnExecuteScripted="OnExecuteScripted" 
                                OnMenuClick="OnMenuClick" OnToolsClick="OnToolsClick"
                                 copyright="北京凤凰世纪科技有限公司[仅限内部员工专用];V5.0S0xGAAEAAAAAAAAAEAAAAG4BAABwAQAALAAAAG3/SgWVriClLdTh82zuqGVG3qrk0zLB/0biBGtL4odBZZCs7T/FVfKBRFjl/BZDSF/nCYOsGcDsrabWiS0Unr4t8Fp04nx0f+FnOcq6a1L1tcnsa/0GJTSCdoOLoYECxVKoTBIU0AyINsTfnjZKjOdOnwAGz1VFukwU9WyVLzp8JnF75uCEIFfGSvVdOKIL841qBnBjVkSAlKnUrcUrnK10tuvgrW2R5aA8aLV2VXqBRlS2u2+i/Y0nF1xZphyUFriWBm9QLKYOuttjPb2LTQPBINnSUPKr1v4p6VH6T6Hdgd5azQn7AzVAfR+7XuWYxOkHM8p49h4H24pOXmZnO7G8de/U62B/KLJ8L0s2A2DFbJJFqGY2w3AVM51iZ5B+kDwuembFC5WrNjdxS2STP6WbZfJXQL8LASXwoL+Qd446u4YF6VcQEvLVdUh7467ms3zaMAtFhwFc4WZuXBRjljNAACHWSIgYBuxGSMxusaCQx7Ougz9PhtyTQnjIc5dJyg=="></object>
                            <%} %>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr class="table2">
            <td><div style="float:left;margin-top:15px;">描述：</div>
                <div style="float:left;"><textarea cols="40" rows="3" name="Descript" id="Descript"><%=mDescript%></textarea></div>
                
            </td>
        </tr>
        <tr class="table2">
            <td><div style="float:left;margin-top:15px;">公开：</div>
                <div style="float:left;margin-top:15px;"><input id="IsPublic" name="IsPublic" type="checkbox" style="width:17px;height:17px;" /></div>
                
            </td>
        </tr>
    </table>
    </form>
    <script>
        $('.tablenav>div').click(function () {
            $('.tablenav>div').removeClass('active')
            $(this).addClass('active')
            var index = $(this).index() + 1
            $('.table1').hide()
            $('.table2').hide()
            $('.table' + index).show()
        })
        $(document).ready(function () {
            var height = $(window).height() - 125;
            $('td[bgcolor="menu"]').height(height);
            $('#Object1').height(height);
        })
    </script>
</body>
</html>
