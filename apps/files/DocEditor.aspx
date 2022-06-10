<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DocEditor.aspx.cs" Inherits="WebClient.apps.files.DocEditor" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="height:100%">
<head>
    <title>�ĵ��༭ -    <%=PageTitle%></title>
    <link href="test.css" type="text/css" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <script language="javascript" for="WebOffice" event="OnMenuClick(vIndex,vCaption)">
  if (vIndex==1){  
    WebOpenLocal();     //�򿪱����ļ�
  }
  if (vIndex==2){  
       WebSaveLocal();     //���汾���ļ�
     // alert("��Ȩ����");
  }
  if (vIndex==3){
    SaveDocument();     //�������ĵ��������ϣ����˳���
  }
  if (vIndex==5){  
    WebOpenSignature(); //ǩ��ӡ��
  }
  if (vIndex==6){  
    WebShowSignature(); //��֤ǩ��
  }
  if (vIndex==8){  
    WebSaveVersion();   //����汾
  }
  if (vIndex==9){  
    WebOpenVersion();   //�򿪰汾
  }
  if (vIndex==11){
    SaveDocument();     //�������ĵ���������
    webform.submit();   //Ȼ���˳�
  }
  if (vIndex==13){  
    WebOpenPrint();     //��ӡ�ĵ�
  }
    </script>
    <script language="javascript" for="WebOffice" event="OnToolsClick(vIndex,vCaption)">
  //��Ӧ�������¼�
  if (vIndex==11){
    webform.WebOffice.VisibleTools('��д��ע',false);       //���ػ���ʾiWebOffice������ true��ʾ  false����
  } 
  if (vIndex==12){
    webform.WebOffice.VisibleTools('��д��ע',true);        //���ػ���ʾiWebOffice������ true��ʾ  false����
  }  
  //if (vIndex==-1){webform.WebOffice.Alert(vCaption);}     //�������Ӧ��������ӦiWebOffice��׼�����������ť�¼�����"��д��ע",vCaption="��д��ע"
    </script>
     <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
  <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <script language="javascript" type="text/javascript">
        /*
        form������:webform
        iWebOffice����:WebOffice
        WebObject�ĵ�����ӿڣ��൱�ڣ�
        �����Word  �ļ���WebObject ��Word  VBA��ActiveDocument����
        �����Excel �ļ���WebObject ��Excel VBA��ActiveSheet����

        �磺webform.WebOffice.WebObject
        */
       

        //���ã���ʾ����״̬
        function StatusMsg(mString) {
            webform.StatusBar.value = mString;
        }

        //���ã�����iWebOffice
        function Load() {
            try {
                disableButtons();
                if (document.getElementById("fullscreen").value == "1") {
                    jQuery("#btnFullScreen").hide();
                    jQuery("#btnClose").hide();
                }
                //debugger;
                //�������Ա������ã�ʵʼ��iWebOffice
                webform.WebOffice.WebUrl = "<%=mServerUrl%>";             //WebUrl:ϵͳ������·������������ļ������������籣�桢���ĵ�����Ҫ�ļ�
                webform.WebOffice.RecordID = "<%=mRecordID%>";            //RecordID:���ĵ���¼���
                webform.WebOffice.Template = "<%=mTemplate%>";            //Template:ģ����
                webform.WebOffice.FileName = "<%=mFileName%>";            //FileName:�ĵ�����
                webform.WebOffice.FileType = "<%=mFileType%>";            //FileType:�ĵ�����  .doc  .xls  .wps
                webform.WebOffice.UserName = "<%=mUserName%>";            //UserName:�����û������ۼ�������Ҫ
                webform.WebOffice.EditType = "<%=mEditType%>";            //EditType:�༭����  ��ʽһ����ʽ��  <�ο������ĵ�>
                //��һλ����Ϊ0,1,2,3 ����:0���ɱ༭;1���Ա༭,�޺ۼ�;2���Ա༭,�кۼ�,�����޶�;3���Ա༭,�кۼ�,���޶���
                //�ڶ�λ����Ϊ0,1 ����:0������ע,1������ע�����Բο�iWebOffice2009��EditType���ԣ���ϸ�ο�������Ƥ��
                webform.WebOffice.MaxFileSize = 4 * 1024;               //�����ĵ���С���ƣ�Ĭ����8M���������ó�4M��
                webform.WebOffice.Language = "CH";                        //Language:������֧����ʾѡ��   CH���� TW���� ENӢ��
                //webform.WebOffice.ShowWindow = true;                  //������ʾ�򿪻򱣴��ĵ��Ľ��ȴ��ڣ�Ĭ�ϲ���ʾ
                webform.WebOffice.PenColor = "#FF0000";                   //PenColor:Ĭ����ע��ɫ
                webform.WebOffice.PenWidth = "1";                         //PenWidth:Ĭ����ע�ʿ�
                webform.WebOffice.Print = "1";                            //Print:Ĭ���Ƿ���Դ�ӡ:1���Դ�ӡ��ע,0�����Դ�ӡ��ע
                webform.WebOffice.ShowToolBar = "0";                      //ShowToolBar:�Ƿ���ʾ������:1��ʾ,0����ʾ
                
                //����Ϊ�Զ��幤������ť�� ����һ:Index��ť���,������:Caption��ť��ʾ����,������:Iconͼ������
                ///webform.WebOffice.AppendTools("11", "������д��ע", 11);  //��OnToolsClick�е� vIndex=11 ,vCaption="������д��ע";
                ///webform.WebOffice.AppendTools("12", "��ʾ��д��ע", 12);  //��OnToolsClick�е� vIndex=12 ,vCaption="��ʾ��д��ע";
                ///webform.WebOffice.AppendTools("13", "-", 0);
                //����Ϊ�Զ��幤������ť��

                webform.WebOffice.ShowMenu = "1";                         //��������˵���ʾ
                //����Ϊ�Զ���˵���
                webform.WebOffice.AppendMenu("1", "�򿪱����ļ�(&L)");
                webform.WebOffice.AppendMenu("2", "���汾���ļ�(&S)");
                webform.WebOffice.AppendMenu("3", "����Զ���ļ�(&U)");
                webform.WebOffice.AppendMenu("4", "-");
                ///webform.WebOffice.AppendMenu("5", "ǩ��ӡ��(&Q)");
                /// webform.WebOffice.AppendMenu("6", "��֤ǩ��(&Y)");
                ///webform.WebOffice.AppendMenu("7", "-");
                ///webform.WebOffice.AppendMenu("8", "����汾(&B)");
                ///webform.WebOffice.AppendMenu("9", "�򿪰汾(&D)");
                ///webform.WebOffice.AppendMenu("10", "-");
                ///webform.WebOffice.AppendMenu("11", "���沢�˳�(&E)");
                ///webform.WebOffice.AppendMenu("12", "-");
                webform.WebOffice.AppendMenu("13", "��ӡ�ĵ�(&P)");
                //����Ϊ�Զ���˵���
                ///webform.WebOffice.DisableMenu("��(&M);ѡ��(&O)...");    //��ֹĳ����Щ���˵���
                webform.WebOffice.ShowType = "<%=mShowType%>";              //�ĵ���ʾ��ʽ  1:��ʾ������ע  2:��ʾ��д��ע  0:��ʾ�ĵ��˸�
                //WebSetRibbonUIXML();                                  //����OFFICE2007��ѡ���ʾ
                webform.WebOffice.WebOpen();                            //�򿪸��ĵ�    ����OfficeServer  �����ĵ�OPTION="LOADFILE"    ����ģ��OPTION="LOADTEMPLATE"     <�ο������ĵ�>

                StatusMsg(webform.WebOffice.Status);                    //״̬��Ϣ
            } catch (e) {
                //debugger;
                //alert(e.description);                                   //��ʾ��������Ϣ
            }
        }

        //���ã��˳�iWebOffice
        function UnLoad() {
            try {
                if (!webform.WebOffice.WebClose()) {
                    StatusMsg(webform.WebOffice.Status);
                } else {
                    StatusMsg("�ر��ĵ�...");
                }
            } catch (e) {
                //alert(e.description);
            }
        }
        function WebTABALL() {
            //debugger;
            if (WebCreateHTML()) {  //�����������HTML�ĺ���
                webform.WebOffice.WebInsertFile(); //�ÿؼ��Ľӿڣ������ɵ��ļ����뵽��ǰ�ĵ���
            }
            else {
                alert("ʧ��");
            }
        }
        //����HTML
        function WebCreateHTML() {
            webform.WebOffice.WebSetMsgByName("COMMAND", "CREATEHTML");
            webform.WebOffice.WebSetMsgByName("FIELDNAME", "����");
            webform.WebOffice.WebSetMsgByName("FIELDID", "FullName");
            if (webform.WebOffice.WebSendMessage()) {
                // alert("OK��");
            }
            else {
                alert("����HTML��������Ϣ����ʧ��");
            }
            return true;
        }
        //���ã����ĵ�
        function LoadDocument() {
            StatusMsg("���ڴ��ĵ�...");
            if (!webform.WebOffice.WebOpen()) {  	//�򿪸��ĵ�    ����OfficeServer��OPTION="LOADFILE"
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }

        //���ã������ĵ�
        function SaveDocument() {
            //webform.WebOffice.WebSetMsgByName("MyDefine1","�Զ������ֵ1");  //���ñ���MyDefine1="�Զ������ֵ1"�������������ö��  ��WebSave()ʱ��һ���ύ��OfficeServer��
            //�Զ������
            //filesource
            webform.WebOffice.WebSetMsgByName("objectTypeCode", document.getElementById("objectTypeCode").value);
            webform.WebOffice.WebSetMsgByName("fileSource", document.getElementById("filesource").value);
            if (!webform.WebOffice.WebSave()) {    //����OfficeServer��OPTION="SAVEFILE"  ע��WebSave()�Ǳ��渴�ϸ�ʽ�ļ�������OFFICE���ݺ���д��ע�ĵ�����ֻ�����OFFICE�ĵ���ʽ����ô����WebSave(true)
                StatusMsg(webform.WebOffice.Status);
                return false;
            } else {
                StatusMsg(webform.WebOffice.Status);
                return true;
            }
        }


        //���ã���ʾ�����غۼ�[���غۼ�ʱ�޸��ĵ�û�кۼ�����]  true��ʾ���غۼ�  false��ʾ��ʾ�ۼ�
        function ShowRevision(mValue) {
            if (mValue) {
                webform.WebOffice.WebShow(true);
                StatusMsg("��ʾ�ۼ�...");
            } else {
                webform.WebOffice.WebShow(false);
                StatusMsg("���غۼ�...");
            }
        }


        //���ã���ʾ�����غۼ�[���غۼ�ʱ�޸��ĵ��кۼ�����]  true��ʾ���غۼ�  false��ʾ��ʾ�ۼ�
        function ShowRevision2(mValue) {
            if (mValue) {
                webform.WebOffice.WebObject.ShowRevisions = true;   //��ʾ�ۼ�
            } else {
                webform.WebOffice.WebObject.ShowRevisions = false;  //���غۼ�
            }
        }


        //���ã���ȡ�ۼ�
        function WebGetRevisions() {
            var Rev = webform.WebOffice.WebObject.Revisions; 	//��ȡ�ۼ�����
            var Text = "";

            for (i = 1; i <= Rev.Count; i++) {
                Text = Text + "��" + Rev.Item(i).Author + "��";
                if (Rev.Item(i).Type == "1") {
                    Text = Text + '���в��룺' + Rev.Item(i).Range.Text + "\r\n";
                } else if (Rev.Item(i).Type == "2") {
                    Text = Text + '����ɾ����' + Rev.Item(i).Range.Text + "\r\n";
                }
                else {
                    Text = Text + '���������������������ݣ���' + Rev.Item(i).Range.Text + '������������' + Rev.Item(i).FormatDescription + "����\r\n";
                }
            }
            alert("�ۼ����ݣ�\r\n\r\n" + Text);
        }

        //���ã�ˢ���ĵ�
        function WebReFresh() {
            webform.WebOffice.WebReFresh();
            StatusMsg("�ĵ���ˢ��...");
        }
        
        //���ã��򿪰汾
        function WebOpenVersion() {
            webform.WebOffice.WebOpenVersion();  	//����OfficeServer  �г��汾OPTION="LISTVERSION"     �����汾OPTION="LOADVERSION"   <�ο������ĵ�>
            StatusMsg(webform.WebOffice.Status);
        }

        //���ã�����汾
        function WebSaveVersion() {
            webform.WebOffice.WebSaveVersion();  	//����OfficeServer��OPTION="SAVEVERSION"
            StatusMsg(webform.WebOffice.Status);

        }

        //���ã����浱ǰ�汾
        function WebSaveVersionByFileID() {
            var mText = window.prompt("������汾˵��:", "�汾��:V");
            if (mText == null) {
                mText = "���޸İ汾.";
            }
            webform.WebOffice.WebSaveVersionByFileID(mText);  	//����OfficeServer��OPTION="SAVEVERSION"  ͬʱ��FileIDֵ   <�ο������ĵ�>
            StatusMsg(webform.WebOffice.Status);
        }


        //���ã����ģ��
        function LoadBookmarks() {
            StatusMsg("�������ģ��...");
            if (!webform.WebOffice.WebLoadBookmarks()) {  	//����OfficeServer��OPTION="LOADBOOKMARKS"
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }

        //���ã���ǩ����
        function WebOpenBookMarks() {
            try {
                webform.WebOffice.WebOpenBookmarks();  	//����OfficeServer��OPTION="LISTBOOKMARKS"
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }

        //���ã�������ǩֵ  vbmName:��ǩ���ƣ�vbmValue:��ǩֵ   ��ǩ����ע���Сд
        function SetBookmarks(vbmName, vbmValue) {
            //debugger;
            //LoadBookmarks();
            vbmName = 'Field', vbmValue = 'fields';
            if (!webform.WebOffice.WebSetBookmarks(vbmName, vbmValue)) {
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }

        //���ã����ݱ�ǩ���ƻ�ȡ��ǩֵ  vbmName:��ǩ����
        function GetBookmarks(vbmName) {
            var vbmValue;
            vbmValue = webform.WebOffice.WebGetBookmarks(vbmName);
            return vbmValue;
        }

        //���ã���ӡ�ĵ�
        function WebOpenPrint() {
            try {
                webform.WebOffice.WebOpenPrint();
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }


        //���ã�ҳ������
        function WebOpenPageSetup() {
            try {
                if (webform.WebOffice.FileType == ".doc") {
                    webform.WebOffice.WebObject.Application.Dialogs(178).Show();
                }
                if (webform.WebOffice.FileType == ".xls") {
                    webform.WebOffice.WebObject.Application.Dialogs(7).Show();
                }
            } catch (e) { alert(e.description); }
        }

        //���ã�����ͼƬ
        function WebOpenPicture() {
            try {
                webform.WebOffice.WebOpenPicture();
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }

        //���ã�ǩ��ӡ��
        function WebOpenSignature() {
            //alert("�����Ҫ����ȫǩ��,������ý��iSignature����ǩ���������ǩ��:\r\n���ص�ַhttp://www.goldgrid.cn/iSignature/Download.asp\r\n\r\n�������֧���ĵ������Ա�����CA֤�������ǩ��������,\r\n��ͨ����<���ҹ������͹��ұ��ܾ�>˫����֤�İ�ȫ����ǩ�²�Ʒ!");
            try {
                webform.WebOffice.WebOpenSignature();  	//����OfficeServer�� Aǩ���б�OPTION="LOADMARKLIST"    Bǩ�µ���OPTION="LOADMARKIMAGE"    Cȷ��ǩ��OPTION="SAVESIGNATURE"    <�ο������ĵ�>
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }

        //���ã���֤ӡ��A
        function WebShowSignature() {
            try {
                webform.WebOffice.WebShowSignature();  	//����OfficeServer��OPTION="LOADSIGNATURE"
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }

        //���ã���֤ӡ��B
        function WebCheckSignature() {
            try {
                var i = webform.WebOffice.WebCheckSignature();  	//����OfficeServer��OPTION="LOADSIGNATURE"
                alert("�������" + i + "\r\n ע��: (=-1 �зǷ�ӡ��) (=0 û���κ�ӡ��) (>=1 �ж���Ϸ�ӡ��)");
                StatusMsg(i);
            } catch (e) { alert(e.description); }
        }

        //���ã���Ϊ�����ļ�
        function WebSaveLocal() {
            try {
                webform.WebOffice.WebSaveLocal();
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }

        //���ã��򿪱����ļ�
        function WebOpenLocal() {
            try {
                webform.WebOffice.WebOpenLocal();
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }

        //���ã�����ΪHTML�ĵ�
        function WebSaveAsHtml() {
            try {
                if (webform.WebOffice.WebSaveAsHtml())  	//����OfficeServer��OPTION="SAVEASHTML"
                {
                    webform.HTMLPath.value = "HTML/<%=mRecordID%>.htm";
                    window.open("<%=mHttpUrl%>" + webform.HTMLPath.value);
                }
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }


        //���ã�����Ϊ�ĵ�ͼƬ
        function WebSaveAsPage() {
            try {
                if (webform.WebOffice.WebSaveImage())  	//����OfficeServer��OPTION="SAVEIMAGE"
                {
                    webform.HTMLPath.value = "HTMLIMAGE/<%=mRecordID%>.htm";
                    window.open("<%=mHttpUrl%>" + webform.HTMLPath.value);
                }
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }


        //���ã��رջ���ʾ���� ����1��ʾ����������  ����2Ϊfalseʱ����ʾ�ر�  �����ƾ��ɲ���VBA������
        //����2Ϊtrueʱ����ʾ��ʾ
        function WebToolsVisible(ToolName, Visible) {
            try {
                webform.WebOffice.WebToolsVisible(ToolName, Visible);
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }


        //���ã���ֹ�����ù��� ����1��ʾ����������  ����2��ʾ�������ť�ı��  �����ƺͱ�ž��ɲ���VBA������
        //����3Ϊfalseʱ����ʾ��ֹ  ����3Ϊtrueʱ����ʾ����
        function WebToolsEnable(ToolName, ToolIndex, Enable) {
            try {
                webform.WebOffice.WebToolsEnable(ToolName, ToolIndex, Enable);
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }

        //���ã���������  ����1Ϊtrue��ʾ�����ĵ�  false��ʾ�������
        function WebProtect(value) {
            try {
                webform.WebOffice.WebSetProtect(value, "");  //""��ʾ����Ϊ��
            } catch (e) { alert(e.description); }
        }

        //���ã��������ֹ��������  ����1Ϊtrue��ʾ������  false��ʾ��ֹ����
        function WebEnableCopy(value) {
            try {
                webform.WebOffice.CopyType = value;
            } catch (e) { alert(e.description); }
        }


        //���ã�����Զ�̷�����ͼƬ
        function WebInsertImage() {
            try {
                webform.WebOffice.WebInsertImage('Image', 'GoldgridLogo.jpg', true, 4);   //����OfficeServer��OPTION="INSERTIMAGE"  ����1��ʾ��ǩ����  ����2��ʾͼƬ�ļ���  ����3Ϊtrue͸��  false��ʾ��͸��  ����4Ϊ4��ʾ���������Ϸ�  5��ʾ���������·�
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
        }


        //���ã����ط������ļ�������
        function WebGetFile() {
            if (webform.WebOffice.WebGetFile("c:\\WebGetFile.doc", "DownLoad.doc")) {   //����OfficeServer��OPTION="GETFILE"  ����1��ʾ����·��  ����2��ʾ�������ļ�����
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
            alert(webform.WebOffice.Status + "\r\n" + "�ļ�����c:\\WebGetFile.doc");
        }


        //���ã��ϴ������ļ���������
        function WebPutFile() {
            var mLocalFile = webform.WebOffice.WebOpenLocalDialog();
            if (mLocalFile != "") {
                alert(mLocalFile);
                if (webform.WebOffice.WebPutFile(mLocalFile, "Test.doc")) {   //����OfficeServer��OPTION="PUTFILE"  ����1��ʾ����·���������κθ�ʽ�ļ�  ����2��ʾ�������ļ�����
                    StatusMsg(webform.WebOffice.Status);
                } else {
                    StatusMsg(webform.WebOffice.Status);
                }
                alert(webform.WebOffice.Status);
            }
        }


        //���ã���Զ���ļ�
        function WebDownLoadFile() {
            mResult = webform.WebOffice.WebDownLoadFile("http://www.goldgrid.com/Images/abc.doc", "c:\\abc.doc");
            if (mResult) {
                webform.WebOffice.WebOpenLocalFile("c:\\abc.doc");
                alert("�ɹ�");
            } else {
                alert("ʧ��");
            }
        }

        //���ã�ȡ�÷�������ʱ�䣬���ñ���ʱ��  [V6.0.1.5����֧��]
        function WebDateTime() {
            mResult = webform.WebOffice.WebDateTime(true);   //����OfficeServer��OPTION="DATETIME"   true��ʾ���ز����ñ���ʱ��Ϊ������ʱ�䣻false��ʾ�����ط�����ʱ��
            alert("��ʾ���Ѿ����ñ���ʱ��Ϊ " + mResult);    //�ù�����Ҫ�����ںۼ�����ʱ��ȡ������ʱ��
        }


        //���ã�������ɼ����
        function WebSetWordTable() {
            var mText = "", mName = "", iColumns, iCells, iTable;
            //����COMMANDΪWORDTABLE
            webform.WebOffice.WebSetMsgByName("COMMAND", "WORDTABLE");   //���ñ���COMMAND="WORDTABLE"����WebSendMessage()ʱ��һ���ύ��OfficeServer��
            //���͵���������
            //���û�д���
            if (webform.WebOffice.WebSendMessage()) {                //����OfficeServer��OPTION="SENDMESSAGE"
                iColumns = webform.WebOffice.WebGetMsgByName("COLUMNS");  //ȡ����
                iCells = webform.WebOffice.WebGetMsgByName("CELLS");      //ȡ����
                iTable = webform.WebOffice.WebObject.Tables.Add(webform.WebOffice.WebObject.Application.Selection.Range, iCells, iColumns);   //���ɱ��
                for (var i = 1; i <= iColumns; i++) {
                    for (var j = 1; j <= iCells; j++) {
                        mName = i.toString() + j.toString();
                        mText = webform.WebOffice.WebGetMsgByName(mName);  //ȡ��OfficeServer�еı������
                        iTable.Columns(i).Cells(j).Range.Text = mText;   	//��䵥Ԫֵ
                    }
                }
            }
            StatusMsg(webform.WebOffice.Status);
        }


        //���ã���ȡ�ĵ�Txt����
        function WebGetWordContent() {
            try {
                alert(webform.WebOffice.WebObject.Content.Text);
            } catch (e) { alert(e.description); }
        }

        //���ã�дWord����
        function WebSetWordContent() {
            var mText = window.prompt("����������:", "��������");
            if (mText == null) {
                return (false);
            }
            else {
                //����Ϊ��ʾѡ�е��ı�
                //alert(webform.WebOffice.WebObject.Application.Selection.Range.Text);
                //����Ϊ�ڵ�ǰ���������ı�
                webform.WebOffice.WebObject.Application.Selection.Range.Text = mText + "\n";
                //����Ϊ�ڵ�һ�κ�����ı�
                //webform.WebOffice.WebObject.Application.ActiveDocument.Range(1).Text=(mText);
            }
        }
        function WebCreateHTMLField() {

            webform.WebOffice.WebSetMsgByName("COMMAND", "CREATEHTML");
            //webform.WebOffice.WebSetMsgByName("FIELDNAME", "FullName");
            //webform.WebOffice.WebSetMsgByName("FIELDID", "FullName1");
            //if (webform.WebOffice.WebSendMessage()) {
            //   webform.WebOffice.WebInsertFile();
            //}

            sPath = "apps/files/";
            // webform.WebOffice.WebObject.Application.ChangeFileOpenDirectory(sPath);
            webform.WebOffice.WebObject.Application.Selection.InsertFile("E:\\Work\\f2\\OA\\CloudOA\\apps\\files\\Field.htm", "", false, false, false);
            // webform.WebOffice.WebObject.Application.Selection.InsertFile("field.htm", "", false, false, false);
            //WebSetWordContent();

        }

        //���ã���ӡ�ڰ��ĵ�
        function WebWordPrintBlackAndWhile() {
            var i, n;

            //ͼƬ��ڰ�
            i = 0;
            n = webform.WebOffice.WebObject.Shapes.Count;
            for (var i = 1; i <= n; i++) {
                webform.WebOffice.WebObject.Shapes.Item(i).PictureFormat.ColorType = 3;
            }
            i = 0;
            n = webform.WebOffice.WebObject.InlineShapes.Count;
            for (var i = 1; i <= n; i++) {
                webform.WebOffice.WebObject.InlineShapes.Item(i).PictureFormat.ColorType = 3;
            }

            //���ֱ�ڰ�
            webform.WebOffice.WebObject.Application.Selection.WholeStory();
            webform.WebOffice.WebObject.Application.Selection.Range.Font.Color = 0;
        }

        //���ã���Excel���
        function WebGetExcelContent() {
            webform.WebOffice.WebObject.Application.Sheets(1).Select;
            webform.WebOffice.WebObject.Application.Range("C5").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "126";
            webform.WebOffice.WebObject.Application.Range("C6").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "446";
            webform.WebOffice.WebObject.Application.Range("C7").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "556";
            webform.WebOffice.WebObject.Application.Range("C5:C8").Select;
            webform.WebOffice.WebObject.Application.Range("C8").Activate;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "=SUM(R[-3]C:R[-1]C)";
            webform.WebOffice.WebObject.Application.Range("D8").Select;
            alert(webform.WebOffice.WebObject.Application.Range("C8").Text);
        }


        //���ã�����������Ԫ
        function WebSheetsLock() {
            webform.WebOffice.WebObject.Application.Sheets(1).Select;

            webform.WebOffice.WebObject.Application.Range("A1").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "��Ʒ";
            webform.WebOffice.WebObject.Application.Range("B1").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "�۸�";
            webform.WebOffice.WebObject.Application.Range("C1").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "��ϸ˵��";
            webform.WebOffice.WebObject.Application.Range("D1").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "���";
            webform.WebOffice.WebObject.Application.Range("A2").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "��ǩ";
            webform.WebOffice.WebObject.Application.Range("A3").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "ë��";
            webform.WebOffice.WebObject.Application.Range("A4").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "�ֱ�";
            webform.WebOffice.WebObject.Application.Range("A5").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "����";

            webform.WebOffice.WebObject.Application.Range("B2").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "0.5";
            webform.WebOffice.WebObject.Application.Range("C2").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "ӣ��";
            webform.WebOffice.WebObject.Application.Range("D2").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "300";

            webform.WebOffice.WebObject.Application.Range("B3").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "2";
            webform.WebOffice.WebObject.Application.Range("C3").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "�Ǻ�";
            webform.WebOffice.WebObject.Application.Range("D3").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "50";

            webform.WebOffice.WebObject.Application.Range("B4").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "3";
            webform.WebOffice.WebObject.Application.Range("C4").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "��ɫ";
            webform.WebOffice.WebObject.Application.Range("D4").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "90";

            webform.WebOffice.WebObject.Application.Range("B5").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "1";
            webform.WebOffice.WebObject.Application.Range("C5").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "20cm";
            webform.WebOffice.WebObject.Application.Range("D5").Select;
            webform.WebOffice.WebObject.Application.ActiveCell.FormulaR1C1 = "40";

            //����������
            webform.WebOffice.WebObject.Application.Range("B2:D5").Select;
            webform.WebOffice.WebObject.Application.Selection.Locked = false;
            webform.WebOffice.WebObject.Application.Selection.FormulaHidden = false;
            webform.WebOffice.WebObject.Application.ActiveSheet.Protect(true, true, true);

            alert("�Ѿ�����������ֻ��B2-D5��Ԫ������޸ġ�");
        }

        //���ã�VBA�׺�
        function WebInsertVBA() {

            //����
            var object = webform.WebOffice.WebObject;
            var myl = object.Shapes.AddLine(100, 60, 305, 60)
            myl.Line.ForeColor = 255;
            myl.Line.Weight = 2;
            var myl1 = object.Shapes.AddLine(326, 60, 520, 60)
            myl1.Line.ForeColor = 255;
            myl1.Line.Weight = 2;

            //object.Shapes.AddLine(200,200,450,200).Line.ForeColor=6;
            var myRange = webform.WebOffice.WebObject.Range(0, 0);
            myRange.Select();

            var mtext = "��";
            webform.WebOffice.WebObject.Application.Selection.Range.InsertAfter(mtext + "\n");
            var myRange = webform.WebOffice.WebObject.Paragraphs(1).Range;
            myRange.ParagraphFormat.LineSpacingRule = 1.5;
            myRange.font.ColorIndex = 6;
            myRange.ParagraphFormat.Alignment = 1;
            myRange = webform.WebOffice.WebObject.Range(0, 0);
            myRange.Select();
            mtext = "���[��������]��������";
            webform.WebOffice.WebObject.Application.Selection.Range.InsertAfter(mtext + "\n");
            myRange = webform.WebOffice.WebObject.Paragraphs(1).Range;
            myRange.ParagraphFormat.LineSpacingRule = 1.5;
            myRange.ParagraphFormat.Alignment = 1;
            myRange.font.ColorIndex = 1;

            mtext = "�����������ļ�";
            webform.WebOffice.WebObject.Application.Selection.Range.InsertAfter(mtext + "\n");
            myRange = webform.WebOffice.WebObject.Paragraphs(1).Range;
            myRange.ParagraphFormat.LineSpacingRule = 1.5;

            //myRange.Select();
            myRange.Font.ColorIndex = 6;
            myRange.Font.Name = "����_GB2312";
            myRange.font.Bold = true;
            myRange.Font.Size = 50;
            myRange.ParagraphFormat.Alignment = 1;

            //myRange=myRange=webform.WebOffice.WebObject.Paragraphs(1).Range;
            webform.WebOffice.WebObject.PageSetup.LeftMargin = 70;
            webform.WebOffice.WebObject.PageSetup.RightMargin = 70;
            webform.WebOffice.WebObject.PageSetup.TopMargin = 70;
            webform.WebOffice.WebObject.PageSetup.BottomMargin = 70;
        }

        //���ã�ģ���׺칦��
        function WebUseTemplate() {
            var mDialogUrl = "Template/TemplateForm.htm";
            var mObject = new Object();
            mObject.Template = "";
            window.showModalDialog(mDialogUrl, mObject, "dialogHeight:200px; dialogWidth:360px;center:yes;scroll:no;status:no;");

            //�ж��û��Ƿ�ѡ��ģ��
            if (mObject.Template == "") {
                StatusMsg("ȡ������ģ��");
                return false;
            } else {
                if (WebAcceptAllRevisions() == false) {                         //������ĺۼ���Ŀ����Ϊ�˱���ۼ�״̬�³��������쳣���⡣
                    StatusMsg("������ĺۼ�ʧ�ܣ��׺���ֹ");
                    return false;
                }
                SaveDocument();                                             //���浱ǰ�༭���ĵ�
                webform.WebOffice.WebSetMsgByName("COMMAND", "INSERTFILE");  //���ñ���COMMAND="INSERTFILE"����WebLoadTemplate()ʱ��һ���ύ��OfficeServer��     <�ο������ĵ�>
                webform.WebOffice.Template = mObject.Template;                //ȫ�ֱ���Template��ֵ����ʾ����ȡ������Ŀ¼��ģ�壬���ȡ���ݿ���ģ�壬TemplateֵΪ���ݿ��е�ģ���ţ����Ͼ���벻��Ҫ����Template="1050560363767"��ģ������Ϊ��Word����ģ�塱��ע��ģ������Ҫ��ǩContent�����ִ�Сд�����������޸�
                webform.WebOffice.EditType = "1";                             //����Ϊ�������ۼ���״̬
                if (webform.WebOffice.WebLoadTemplate()) {                   //����OfficeServer��OPTION="LOADTEMPLATE"
                    //SetBookmarks("Title","�����м���з���������֪ͨ");     //���ģ������������Ϣ������⣬����ʣ��ĺţ����ͻ��ص�
                    if (webform.WebOffice.WebInsertFile()) {                   //��乫������   ����OfficeServer��OPTION="INSERTFILE"
                        StatusMsg("ģ���׺�ɹ�");
                        return true;
                    } else {
                        StatusMsg(webform.WebOffice.Status);
                        return false;
                    }
                } else {
                    StatusMsg(webform.WebOffice.Status);
                    return false;
                }
            }
        }

        //���ã����涨���ļ�
        function WebUpdateFile() {
            if (webform.WebOffice.WebUpdateFile()) {                //����OfficeServer��OPTION="UPDATEFILE"������WebSave()��WebSaveVersion()����
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }



        //��ӡ��������
        function WebCopysCtrlPrint() {
            var mCopies, objPrint;
            objPrint = webform.WebOffice.WebObject.Application.Dialogs(88);     //��ӡ���öԻ���
            if (objPrint.Display == -1) {
                mCopies = objPrint.NumCopies;    //ȡ����Ҫ��ӡ����
                webform.WebOffice.WebSetMsgByName("COMMAND", "COPIES");
                webform.WebOffice.WebSetMsgByName("OFFICEPRINTS", mCopies.toString());   //���ñ���OFFICEPRINTS��ֵ����WebSendMessage()ʱ��һ���ύ��OfficeServer��
                webform.WebOffice.WebSendMessage();                               //����OfficeServer��OPTION="SENDMESSAGE"       
                if (webform.WebOffice.Status == "1") {
                    alert("���������ӡ��ע����ʵ���������ĵ���ӡ����2��");
                    objPrint.Execute;
                } else {
                    alert("�ѳ�������Ĵ�ӡ����");
                    return false;
                }
            }
        }


        //���ã�����Text
        function WebInportText() {
            var mText;
            webform.WebOffice.WebSetMsgByName("COMMAND", "INPORTTEXT");  //���ñ���COMMAND="INPORTTEXT"����WebSendMessage()ʱ��һ���ύ��OfficeServer��
            if (webform.WebOffice.WebSendMessage()) {                    //����OfficeServer��OPTION="SENDMESSAGE"
                mText = webform.WebOffice.WebGetMsgByName("CONTENT");       //ȡ��OfficeServer���ݵı���CONTENTֵ
                webform.WebOffice.WebObject.Application.Selection.Range.Text = mText;
                alert("�����ı��ɹ�");
            }
            StatusMsg(webform.WebOffice.Status);
        }


        //���ã�����Text
        function WebExportText() {
            var mText = webform.WebOffice.WebObject.Content.Text;
            webform.WebOffice.WebSetMsgByName("COMMAND", "EXPORTTEXT");  //���ñ���COMMAND="EXPORTTEXT"����WebSendMessage()ʱ��һ���ύ��OfficeServer��
            webform.WebOffice.WebSetMsgByName("CONTENT", mText);         //���ñ���CONTENT="mText"����WebSendMessage()ʱ��һ���ύ��OfficeServer�У�������ʵ��ȫ�ļ������ܣ���WORD��TEXT���ݽ��м���
            if (webform.WebOffice.WebSendMessage()) {                    //����OfficeServer��OPTION="SENDMESSAGE"
                alert("�����ı��ɹ�");
            }
            StatusMsg(webform.WebOffice.Status);
        }


        //���ã���ȡ�ĵ�ҳ��
        function WebDocumentPageCount() {
            var intPageTotal = webform.WebOffice.WebObject.Application.ActiveDocument.BuiltInDocumentProperties(14);
            alert("�ĵ�ҳ������" + intPageTotal);
        }

        //���ã�ǩ�������ļ�����
        function WebSignatureAtReadonly() {
            webform.WebOffice.WebSetProtect(false, "");                  //����ĵ�����
            webform.WebOffice.WebSetRevision(false, false, false, false);  //�����ĵ��ۼ�������״̬  ����1:����ʾ�ۼ�  ����2:�������ۼ�  ����3:����ӡʱ�кۼ�  ����4:���Ժۼ�������
            try {
                webform.WebOffice.WebOpenSignature();                     //����OfficeServer�� Aǩ���б�OPTION="LOADMARKLIST"    Bǩ�µ���OPTION="LOADMARKIMAGE"    Cȷ��ǩ��OPTION="SAVESIGNATURE"    <�ο������ĵ�>    �ĵ���Ҫ�����ǩManager�����������޸ı�ǩ����
                StatusMsg(webform.WebOffice.Status);
            } catch (e) { alert(e.description); }
            webform.WebOffice.WebSetProtect(true, "");                   //�����ĵ�
        }

        //���ã��ͻ��˺ͷ���������Ϣ��Ϣ����
        function WebSendInformation() {
            var info = window.prompt("������Ҫ��������������ҳ���ϵ�����:", "��������");
            if (info == null) { return false }

            webform.WebOffice.WebSetMsgByName("COMMAND", "SELFINFO"); 	//���ñ���COMMAND="SELFINFO"�������ڷ����������жϣ��Խ��봦���Զ���������ݵĴ��롣
            webform.WebOffice.WebSetMsgByName("TESTINFO", info); 		//�Զ����һ������"TESTINFO"����info��������Ϣ���õ���Ϣ���У��Ա㴫����̨��
            if (webform.WebOffice.WebSendMessage()) {						//���̨����Ϣ��������OfficeServer��OPTION="SENDMESSAGE"��
                info = webform.WebOffice.WebGetMsgByName("RETURNINFO"); 	//��������ɹ������ܷ������˷��ص���Ϣ��
                alert(info);
            }
            else {
                StatusMsg(webform.WebOffice.Status);
            }
        }

        //�жϱ༭��
        function GetEditer() {
            if (webform.WebOffice.WebApplication(".doc")) {     //WORD
                alert("����WORD�༭��");
            }
            if (webform.WebOffice.WebApplication(".xls")) {     //EXCEL
                alert("����EXCEL�༭��");
            }
            if (webform.WebOffice.WebApplication(".wps")) {     //��ɽWPS
                alert("����WPS�༭��");
            }
            if (webform.WebOffice.WebApplication(".et")) {      //��ɽ���
                alert("����ET�༭��");
            }
            //������������".ppt"��".vso"......
        }

        //����OFFICE2007��ѡ���ʾ
        function WebSetRibbonUIXML() {
            webform.WebOffice.RibbonUIXML = '' +
  '<customUI xmlns="http://schemas.microsoft.com/office/2006/01/customui">' +
  '  <ribbon startFromScratch="false">' +                    //����ʾ����ѡ����� false��ʾѡ���true����ʾѡ�
  '    <tabs>' +
  '      <tab idMso="TabReviewWord" visible="false">' +     //�ر���ͼ������
  '      </tab>' +
  '      <tab idMso="TabInsert" visible="false">' +         //�رղ��빤����
  '      </tab>' +
  '      <tab idMso="TabHome" visible="false">' +           //�رտ�ʼ������
  '      </tab>' +
  '    </tabs>' +
  '  </ribbon>' +
  '</customUI>';

            /*
            ��õ�����ѡ�����
            ѡ�����      idMso��Excel��      idMso��Word��       idMso��Access��
            ��ʼ            TabHome             TabHome             TabHomeAccess
            ����            TabInsert           TabInsert           ��none��
            ҳ�沼��        TabPageLayoutExcel  TabPageLayoutWord   ��none��
            ��ʽ            TabFormulas         ��none��            ��none��
            ����            TabData             ��none��            ��none��
            ��ͼ            TabReview           TabReviewWord       ��none��
            ����            ��none��            ��none��            TabCreate
            �ⲿ����        ��none��            ��none��            TabExternalData
            ���ݿ⹤��      ��none��            ��none��            TabDatabaseTools
            */

            /*
            iWebOffice�ؼ���RibbonUIXML���ԣ��ǻ���OFFICE2007��RibbonX��Ӧ�á�����RibbonX��������ϣ���Ҫ�Լ����в�ѯ��
            */
        }

        //��ȡע���ʮ���ƣ�
        function WebReadRegString() {
            try {
                webform.WebOffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //��ע���
                var Content = webform.WebOffice.WebReadString('AddNewString');                                          //��ȡע���
                webform.WebOffice.WebCloseKey();                                                                        //�ر�ע���
                alert(Content);
            }
            catch (e) {
                alert(e.description);
                webform.WebOffice.WebCloseKey();
            }
        }

        //д��ע���ʮ���ƣ�
        function WebWriteRegString() {
            try {
                webform.WebOffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //��ע���
                var result = webform.WebOffice.WebWriteString('AddNewString', '1234');                                   //д��ע���
                webform.WebOffice.WebCloseKey();                                                                        //�ر�ע���
                if (result) {
                    alert("д��ע���ɹ���");
                } else {
                    alert("д��ע���ʧ�ܣ�");
                }
            }
            catch (e) {
                alert("д��ע���ʧ�ܣ�ԭ��" + e.description);
                webform.WebOffice.WebCloseKey();
            }
        }

        //��ȡע���ʮ�����ƣ�
        function WebReadRegInteger() {
            try {
                webform.WebOffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //��ע���
                var Content = webform.WebOffice.WebReadInteger('AddNewInteger');                                        //��ȡע���
                webform.WebOffice.WebCloseKey();                                                                        //�ر�ע���
                alert(Content);
            }
            catch (e) {
                alert(e.description);
                webform.WebOffice.WebCloseKey();
            }
        }

        //д��ע���ʮ�����ƣ�
        function WebWriteRegInteger() {
            try {
                webform.WebOffice.WebOpenKey('HKEY_CURRENT_USER', 'Software\\Microsoft\\Office\\12.0\\Common\\Toolbars');    //��ע���
                var result = webform.WebOffice.WebWriteInteger('AddNewInteger', 5678);                                   //д��ע���
                webform.WebOffice.WebCloseKey();                                                                        //�ر�ע���
                if (result) {
                    alert("д��ע���ɹ���");
                } else {
                    alert("д��ע���ʧ�ܣ�");
                }
            }
            catch (e) {
                alert(e.description);
                webform.WebOffice.WebCloseKey();
            }
        }

        //�����ĵ���ȫ���ۼ�
        function WebAcceptAllRevisions() {
            webform.WebOffice.WebObject.Application.ActiveDocument.AcceptAllRevisions();
            var mCount = webform.WebOffice.WebObject.Application.ActiveDocument.Revisions.Count;
            if (mCount > 0) {
                return false;
            } else {
                return true;
            }
        }

        //�򿪵ķ������ϵ��ĵ����޸�
        function WebOpenAndRepair() {
            webform.WebOffice.WebRepairMode = true;   //���޸�ģʽ
            webform.WebOffice.WebOpen();              //�ص��ղŴ򿪵ķ������ϵ��ĵ�
            StatusMsg(webform.WebOffice.Status);
            webform.WebOffice.WebRepairMode = false;  //�ر��޸�ģʽ
        }

        //�򿪱����ϵ��ĵ����޸�
        function WebOpenLocalAndRepair() {
            webform.WebOffice.WebRepairMode = true;   //���޸�ģʽ
            webform.WebOffice.WebOpenLocal();         //�򿪱����ϵ��ĵ�
            StatusMsg(webform.WebOffice.Status);
            webform.WebOffice.WebRepairMode = false;  //�ر��޸�ģʽ
        }

    </script>
    <script type="text/javascript">
        function LoadTemplate() {
            if (document.getElementById("DropDownTemplate").value == "") {
                alert("��ѡ��һ������ģ��");
                document.getElementById("DropDownTemplate").focus();
                return false;
            }
            StatusMsg("����Ӧ��ģ������...");
            webform.WebOffice.Template = document.getElementById("DropDownTemplate").value;
            if (!webform.WebOffice.WebLoadTemplate()) {
                StatusMsg(webform.WebOffice.Status);
            } else {
                StatusMsg(webform.WebOffice.Status);
            }
        }
        function CallSave() {
            if (!webform.WebOffice.WebSave()) {
                StatusMsg(webform.WebOffice.Status);
                alert("��������ʧ�ܣ�");
                return false;
            } else {
                alert("�������ĳɹ���");
                StatusMsg(webform.WebOffice.Status);
            }
        }
        function disableButtons() {
           var r =document.getElementById("readOnly").value;
           if (r == "1") {
               jQuery("#btnloadtemp").attr("disabled", "disabled");
               jQuery("#btnsavedb").attr("disabled", "disabled");
               jQuery("#DropDownTemplate").attr("disabled", "disabled");
               WebEnableCopy(true);
           }
           var editorHeight = jQuery("#WebOffice").height();
           if (editorHeight <= 700) {
             //  jQuery("#WebOffice").attr("height", "800px;");
           }
           //alert(editorHeight);
        }
    </script>

    <script type="text/javascript">
        /*��ע*/
        function WebInsertPostil() {
            try {
                webform.WebOffice.WebObject.Application.Selection.Comments.Add(webform.WebOffice.WebObject.Application.Selection.Range);
            } catch (e) { }
        }
        //���������޶�
        function WebAcceptEdit() {
            var mFlag = window.confirm("��ȷ��Ҫ���ܶ����������������޶������ȷ���������޶���ȫ����Ч���޸ĺۼ������ٱ�����");
            if (mFlag) {
                //Form1��ʾ�������滻��webform  --��Ң�޸�
                //Form1.WebOffice.WebObject.Application.WordBasic.AcceptAllChangesInDoc;
                webform.WebOffice.WebObject.Application.WordBasic.AcceptAllChangesInDoc;
            }
        }

        //�ܾ������޶�
        function WebRefuseEdit() {
            var mFlag = window.confirm("��ȷ��Ҫ�ܾ������������������޶������ȷ�������е��޶���ȫ����Ч��");
            if (mFlag) {
                //Form1��ʾ�������滻��webform  --��Ң�޸�
                //Form1.WebOffice.WebObject.Application.WordBasic.RejectAllChangesInDoc;
                webform.WebOffice.WebObject.Application.WordBasic.RejectAllChangesInDoc;
            }
        }
        /*
        �ĵ��л�
        */
        function linkDisabled(isindex) {
            var fileType = $("#dropOpenType").val();
            if (fileType == "3") {
                //$("#iframePDF").show();
                //$("#iframeUpload").show();
                //loadPdf("565b8b40-d8cb-444c-a853-2a482d12dcdf");
                //$(".showflag").hide();
                
            } else {
                //$(".showflag").show();                
                //$("#iframePDF").hide();
                //$("#iframeUpload").hide();
                if (isindex == 0) {
                    var sourceTypeId = $("input[name='FileType']").val();
                    if (fileType == "0" || fileType == null) {
                        $("input[name='FileType']").val(".doc");
                        webform.WebOffice.FileType = ".doc";
                    } else if (fileType == "1") {
                        $("input[name='FileType']").val(".xls");
                        webform.WebOffice.FileType = ".xls";
                    } else {
                        $("input[name='FileType']").val(".ppt");
                        webform.WebOffice.FileType = ".ppt";
                    }
                    if (sourceTypeId != $("input[name='FileType']").val()) {
                        webform.WebOffice.CreateFile();
                    }
                }
            }
        }
    </script>
</head>
<body bgcolor="#ffffff" onload="Load()" onunload="UnLoad()">
    <!--�������˳�iWebOffice-->
    <form name="webform" id="webform" method="post" action="/apps/files/DocumentSave.aspx" onsubmit="return SaveDocument();">
    <!--����iWebOffice���ύ����Ϣ-->
     <input type="hidden" id="fullscreen" name="fullscreen" value="<%=Request["fullscreen"]%>" />
    <input type="hidden" name="readOnly" id="readOnly" value="<%=Request["readonly"]%>" />
    <input type="hidden" name="RecordID" value="<%=mRecordID%>" />
    <input type="hidden" name="OrganizationId" value="<%=Request["OrganizationId"]%>" />
    <input type="hidden" name="FileType" value="<%=mFileType%>" />
    <input type="hidden" name="EditType" value="<%=mEditType%>" />
    <input type="hidden" name="objectTypeCode" id="objectTypeCode" value="<%=Request["objectTypeCode"]%>" />
    <input type="hidden" name="filesource" id="filesource" value="<%=Request["filesource"]%>" />
    <input type="hidden" name="HTMLPath" id="HTMLPath" value="<%=mHTMLPath%>" /><!--
    <table border="0" cellspacing='0' cellpadding='0' width='100%' height="100%" align="center">
        <tr>
            <td style="width: 100%; padding: 5px;">
                <input type="submit" value="�����ĵ�" />&nbsp;
                <input type="button" value="����HTML" onclick="WebSaveAsHtml()" />&nbsp;
                <input type="button" value="����HTML" onclick="WebCreateHTMLField()" />&nbsp;
                <input type="button" value="����Զ��HTML" onclick="WebTABALL()" />&nbsp;
                <input type="button" value="�����ǩ" onclick="SetBookmarks('Field','�����ǩ')" />&nbsp;
            </td>
        </tr>
    </table>-->
    <table width="100%" height="100%" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
        <tr>
            <td align="right" valign="middle" height="30" width="100%" style="padding-right: 11px"
                colspan="6">
                <select name="dropOpenType" id="dropOpenType" onchange="linkDisabled(0)" style="height:25px;">
	                <option selected="selected" value="0">Word�ĵ�</option>
	                <option value="1">Excel�ĵ�</option>
	                <!--<option value="3">PDF�ĵ�</option>-->
                </select>
                <select id="DropDownTemplate" name="DropDownTemplate" style="height:25px;">
                    <option value="">--ѡ��ģ��--</option>
                    <%=TemplateOptions%>
                </select>&nbsp;<input type="button" id="btnloadtemp" class="btn_shuaxin" onclick="javascript:LoadTemplate();return false;"
                    value="Ӧ��ģ��" />
                <input type="button" class="btn_sjbd" onclick="javascript: WebOpenSignature(); return false;"
                    value="����ǩ��" />
                <!--WebShowSignature
                <input type="button" class="btn_sjbd" onclick="javascript:WebDesign();return false;"
                    value="��Ʊ�" />&nbsp;-->
                <input type="button" class="btn_shuaxin" onclick="javascript:WebReFresh();return false;"
                    value="ˢ��" />&nbsp;
                <input type="button" class="btn_cxzr" onclick="javascript:LoadDocument();return false;"
                    value="��������" />&nbsp;
                <input type="button" class="btn_print" onclick="javascript: WebOpenPrint();" value="��ӡ" />&nbsp;
                <input type="button" class="btn_cwbd" onclick="javascript: WebSaveLocal();" value="���Ϊ����" />&nbsp;
                <!--<input type="button" class="btn_ylbd" onclick="javascript:PreViewHtml();" value="Ԥ����" />&nbsp;
                <input type="button" class="btn_open" onclick="javascript:WebOpenLocal();" value="�򿪱���" />&nbsp;                
                <input type="button" class="btn_delete" onclick="javascript:CallDelete();" value="ɾ��" />&nbsp;-->
                <input type="button" class="btn_delete" value="������ע" onclick='webform.WebOffice.ShowType = 1;' />
                <input type=button class="btn_revision" value="��ʾ�ۼ�" <%=mDisabled%>  onClick="ShowRevision(true)">
                <input type=button class="btn_revision" value="���غۼ�" <%=mDisabled%> onClick="ShowRevision(false)">
                <input type=button class="btn_revision" value="��ȡ�ۼ�" <%=mDisabled%>  onClick="WebGetRevisions()">
                <!--<input type=button class="btn_revision" value="����ۼ�" <%=mDisabled%>  onClick="WebAcceptAllRevisions()">-->

                <input type="button" class="" value="�����޶�" onclick="WebAcceptEdit()" />
                <input type="button" id="btnsavedb" class="btn_preserve" onclick="javascript:CallSave();" value="  ���� " />
                <input type="button" id="btnFullScreen" class="btn_preserve" style="display:none" onclick="javascript:window.open(window.location);" value="ȫ��" />
                <input type="button" id="btnClose" class="btn_close"  style="display:none"  onclick="javascript:window.close();"  value="�رշ�����һҳ" />
            </td>
        </tr>
        <tr>
            <td bgcolor="#eeeeee" height="20" width="70%" colspan="5">
                <input type="hidden" id="StatusBar" name="StatusBar" />
                <span id="statusText" name="statusText"  style="padding-left: 10px; float: left;"></span>
            </td>
            <td width="30%" bgcolor="#eeeeee" align="right" style="padding-top: 5px; padding-right: 5px;">
            </td>
        </tr>
        <tr style="width: 100%">
            <td height="100%" colspan="6" rowspan="12" align="right" valign="top">
                <table border="0" cellspacing="0" cellpadding="0" width="100%" style="min-height:800px;height:100%;">
                    <tr>
                        <td bgcolor="menu" height="98%" valign="top">
                            <!--����iWebPicture��ע��汾�ţ�����������-->
                            <!--<script src="iWebOffice2009.js" type="text/javascript"></script>-->
                            <%if(IsIE()) { %>
                             <object id="WebOffice" width="100%" height="100%" classid="clsid:23739A7E-5741-4D1C-88D5-D50B18F7C347"  style="min-height:800px;"
                                            codebase="iWebOffice2003.ocx#version=1,0,0,0">
                                        </object>
                            <%} else {  %>
                            <object progid="iWebOffice2003.iWebOffice" id='WebOffice' type="application/iwebplugin"  width="100%" style="height:800px;"
                                OnExecuteScripted="OnExecuteScripted" 
                                OnMenuClick="OnMenuClick" OnToolsClick="OnToolsClick"
                                 copyright="����������ͿƼ����޹�˾[�����ڲ�Ա��ר��];V5.0S0xGAAEAAAAAAAAAEAAAAG4BAABwAQAALAAAAG3/SgWVriClLdTh82zuqGVG3qrk0zLB/0biBGtL4odBZZCs7T/FVfKBRFjl/BZDSF/nCYOsGcDsrabWiS0Unr4t8Fp04nx0f+FnOcq6a1L1tcnsa/0GJTSCdoOLoYECxVKoTBIU0AyINsTfnjZKjOdOnwAGz1VFukwU9WyVLzp8JnF75uCEIFfGSvVdOKIL841qBnBjVkSAlKnUrcUrnK10tuvgrW2R5aA8aLV2VXqBRlS2u2+i/Y0nF1xZphyUFriWBm9QLKYOuttjPb2LTQPBINnSUPKr1v4p6VH6T6Hdgd5azQn7AzVAfR+7XuWYxOkHM8p49h4H24pOXmZnO7G8de/U62B/KLJ8L0s2A2DFbJJFqGY2w3AVM51iZ5B+kDwuembFC5WrNjdxS2STP6WbZfJXQL8LASXwoL+Qd446u4YF6VcQEvLVdUh7467ms3zaMAtFhwFc4WZuXBRjljNAACHWSIgYBuxGSMxusaCQx7Ougz9PhtyTQnjIc5dJyg=="></object>
                            <%} %>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <%--
      <tr width="100">
        <td align="center" valign=top class="TDTitleStyle" width="100" height="5%">
          
          <input type=button class=SideButton value="��д��ע" onclick='webform.WebOffice.ShowType=2;'>
          <input type=button class=SideButton value="�ĵ��˸�" onclick='webform.WebOffice.ShowType=0;'>
          <input type=button class=SideButton value="�½��ļ�" onclick='webform.WebOffice.CreateFile();'>
          <input type=button class=SideButton value="������ע" onclick='webform.WebOffice.ReWrite();'>
          <input type=button class=SideButton value="ȫ����ʾ" onclick='webform.WebOffice.FullSize();'>
          <input type=button class=SideButton value="�رչ�����" onClick="webform.WebOffice.ShowToolBar=0">
          <input type=button class=SideButton value="�򿪹�����" onClick="webform.WebOffice.ShowToolBar=1">
          <input type=button class=SideButton value="��ֹ���ļ�" onClick="webform.WebOffice.DisableTools('���ļ�',true)">  <!--true��ֹ,false����-->
          <input type=button class=SideButton value="�����½��ļ�" onClick="webform.WebOffice.VisibleTools('�½��ļ�',false)"> <!--true��ʾ,false����-->
          <input type=button class=SideButton value="����ȫ��" onClick="webform.WebOffice.VisibleTools('ȫ��',false)"> <!--true��ʾ,false����-->
          <input type=button class=SideButton value="��ʾȫ��" onClick="webform.WebOffice.VisibleTools('ȫ��',true)"> <!--true��ʾ,false����-->
          <input type=button class=SideButton value="��ʾ�汾" onClick="alert('��ǰ�ؼ��汾Ϊ��'+webform.WebOffice.VersionEx()+webform.WebOffice.Version());">
	    </td>
      </tr>--%>
        <!-- <tr width="100">
        <td align="center" class="TDTitleMiddleStyle" height="28">
          <font color="#FF0000"><b>����ͨ���ܡ�</b></font>
	    </td>
      </tr>
      <tr width="100">
        <td align="center" valign=top class="TDTitleStyle" width="100">
          <input type=button class=SideButton value="��ʾ�ۼ�" <%=mDisabled%> <%=mWord%> onClick="ShowRevision(true)">
          <input type=button class=SideButton value="���غۼ�" <%=mDisabled%> <%=mWord%> onClick="ShowRevision(false)">
          <input type=button class=SideButton value="��ȡ�ۼ�" <%=mDisabled%> <%=mWord%> onClick="WebGetRevisions()">
          <input type=button class=SideButton value="����ۼ�" <%=mDisabled%> <%=mWord%> onClick="WebAcceptAllRevisions()">
          <input type=button class=SideButton value="�����ĵ�" <%=mDisabled%> onClick="WebProtect(true)">
          <input type=button class=SideButton value="�������" <%=mDisabled%> onClick="WebProtect(false)">
          <input type=button class=SideButton value="������" <%=mDisabled%> onClick="WebEnableCopy(true)">
          <input type=button class=SideButton value="��ֹ����" <%=mDisabled%> onClick="WebEnableCopy(false)">
          <input type=button class=SideButton value="ҳ������" <%=mDisabled%> <%=mWord%> onClick="WebOpenPageSetup()">--%>
          <input type=button class=SideButton value="��ӡ�ĵ�" <%=mDisabled%> <%=mWord%> onClick="WebOpenPrint()">
          <input type=button class=SideButton value="����ͼƬ" <%=mDisabled%> <%=mWord%> onClick="WebOpenPicture()">
          <input type=button class=SideButton value="�ص��ĵ�" <%=mDisabled%> <%=mWord%> onClick="LoadDocument()">
          <input type=button class=SideButton value="ˢ���ĵ�" <%=mDisabled%> <%=mWord%> onClick="WebReFresh()">
          <input type=button class=SideButton value="�򿪱����ļ�" <%=mDisabled%> onClick="WebOpenLocal()">
          <input type=button class=SideButton value="��Ϊ�����ļ�" <%=mDisabled%> onClick="WebSaveLocal()">
          <input type=button class=SideButton value="�жϱ༭��" onClick="GetEditer()">
          <input type=button class=SideButton value="д��ע���" onClick="WebWriteRegString()">
          <input type=button class=SideButton value="��ȡע���" onClick="WebReadRegString()">
          <input type=button class=SideButton value="д��ע���16" onClick="WebWriteRegInteger()">
          <input type=button class=SideButton value="��ȡע���16" onClick="WebReadRegInteger()">
	    </td>
      </tr>
      <tr width="100">
        <td align="center" class="TDTitleMiddleStyle" height="28">
          <font color="#FF0000"><b>���������ܡ�</b></font>
	    </td>
      </tr>
      <tr width="100">
        <td align="center" valign=top class="TDTitleStyle" width="100">
          <input type=button class=SideButton value="ǩ��ӡ��" <%=mDisabled%> onClick="WebOpenSignature()">
          <input type=button class=SideButton value="ǩ�������ļ�" <%=mDisabled%>  onclick="WebSignatureAtReadonly();">
          <input type=button class=SideButton value="��֤ǩ��[A]" <%=mDisabled%>  onclick="WebShowSignature()">
          <input type=button class=SideButton value="��֤ǩ��[B]" <%=mDisabled%>  onclick="WebCheckSignature()">
          <input type=button class=SideButton value="ӡ�²�ɫ" onClick="webform.WebOffice.SignatureColor(true);">
          <input type=button class=SideButton value="ӡ�ºڰ�" onClick="webform.WebOffice.SignatureColor(false);">
          <input type=button class=SideButton value="�򿪱�ǩ" <%=mDisabled%>  <%=mWord%>  onclick="WebOpenBookMarks()">
          <input type=button class=SideButton value="���ģ���ǩ" <%=mDisabled%>  <%=mWord%>  onclick="LoadBookmarks()">
          <input type=button class=SideButton value="����汾" <%=mDisabled%>  onclick="WebSaveVersion()">
          <input type=button class=SideButton value="�򿪰汾" <%=mDisabled%>  onclick="WebOpenVersion()">
          <input type=button class=SideButton value="���浱ǰ�汾" <%=mDisabled%>  onclick="WebSaveVersionByFileID()">
          <input type=button class=SideButton value="���涨��汾" <%=mDisabled%>  onclick="WebUpdateFile()">
          <input type=button class=SideButton value="��ΪHTML" <%=mDisabled%>  onclick="WebSaveAsHtml()">
          <input type=button class=SideButton value="��ΪHTMLͼƬ" <%=mDisabled%>  <%=mWord%>  onclick="WebSaveAsPage()">
          <input type=button class=SideButton value="ģ���׺�" <%=mDisabled%>  <%=mWord%> onClick="WebUseTemplate()">
          <input type=button class=SideButton value="VBA�׺춨��" <%=mDisabled%>  <%=mWord%>  onclick="WebInsertVBA();">
          <input type=button class=SideButton value="��ӡ���ƹ���" <%=mDisabled%> <%=mWord%>  onClick="WebCopysCtrlPrint()">
          <input type=button class=SideButton value="������������" <%=mDisabled%>  <%=mWord%>  onclick="WebInportText();">
          <input type=button class=SideButton value="�����ĵ�����" <%=mDisabled%>  <%=mWord%>  onclick="WebExportText();">
          <input type=button class=SideButton value="����Զ�̱��" <%=mDisabled%>  <%=mWord%>  onclick="WebSetWordTable()">
          <input type=button class=SideButton value="����Զ��ͼƬ" <%=mDisabled%>  <%=mWord%>  onclick="WebInsertImage()">
          <input type=button class=SideButton value="���ط������ļ�" <%=mDisabled%> <%=mWord%> onClick="WebGetFile()">
          <input type=button class=SideButton value="�ϴ��ļ���������" <%=mDisabled%> <%=mWord%> onClick="WebPutFile()">
          <input type=button class=SideButton value="��Զ���ļ�"  <%=mDisabled%> <%=mWord%>  onclick="WebDownLoadFile()">
          <input type=button class=SideButton value="���ñ���ʱ��"  <%=mDisabled%>  onclick="WebDateTime()">
          <input type=button class=SideButton value="��Ϣ����"  <%=mDisabled%>  onclick="WebSendInformation()">
    	</td>
      </tr>
      <tr width="100">
        <td align="center" class="TDTitleMiddleStyle" height="28">
          <font color="#FF0000"><b>��VBA���á�</b></font>
    	</td>
      </tr>-->
        <%--<tr width="100">
        <td align="center" valign=top class="TDTitleStyle" width="100">
          <input type=button class=SideButton value="ȡWord����" <%=mDisabled%>  <%=mWord%>  onclick="WebGetWordContent()">
          <input type=button class=SideButton value="дWord����" <%=mDisabled%>  <%=mWord%>  onclick="WebSetWordContent()">
          <input type=button class=SideButton value="WORD��ֹ�϶�" <%=mDisabled%> <%=mWord%> onClick="webform.WebOffice.WebObject.Application.Options.AllowDragAndDrop=false;">  <!--false��ֹ�϶�  true�����϶�-->
          <input type=button class=SideButton value="��ӡ�ڰ�" <%=mDisabled%> <%=mWord%> onClick="WebWordPrintBlackAndWhile();">
          <input type=button class=SideButton value="����ҳü" <%=mDisabled%> <%=mWord%> onClick="webform.WebOffice.WebObject.ActiveWindow.ActivePane.View.SeekView=9;">
          <input type=button class=SideButton value="����ҳ��" <%=mDisabled%> <%=mWord%> onClick="webform.WebOffice.WebObject.Application.Dialogs(294).Show();">
          <input type=button class=SideButton value="��Excel���" <%=mDisabled%>  <%=mExcel%> onClick="WebGetExcelContent()">
          <input type=button class=SideButton value="����������" <%=mDisabled%>   <%=mExcel%> onClick="WebSheetsLock()">
          <input type=button class=SideButton value="EXCEL��ֹ�϶�" <%=mDisabled%> <%=mExcel%> onClick="webform.WebOffice.WebObject.Application.CellDragAndDrop=false;">  <!--false��ֹ�϶�  true�����϶�-->
          <input type=button class=SideButton value="�ĵ�ҳ��" <%=mDisabled%>  <%=mWord%>  onclick="WebDocumentPageCount()">
      </tr>--%>
        <!--
      <tr width="100">
        <td align="center" class="TDTitleMiddleStyle" height="28">
          <font color="#FF0000"><b>�����������ơ�</b></font>
	    </td>
      </tr>
      <tr width="100">
        <td align="center" valign=top class="TDTitleStyle" width="100">      
          <input type=button class=SideButton value="�رճ��ù���" <%=mDisabled%>  onclick="WebToolsVisible('Standard',false)">
          <input type=button class=SideButton value="�򿪳��ù���" <%=mDisabled%>  onclick="WebToolsVisible('Standard',true)">
          <input type=button class=SideButton value="�رո�ʽ����" <%=mDisabled%>  onclick="WebToolsVisible('Formatting',false)">
          <input type=button class=SideButton value="�򿪸�ʽ����" <%=mDisabled%>  onclick="WebToolsVisible('Formatting',true)">
          <input type=button class=SideButton value="�رմ�ӡ��ť" <%=mDisabled%>  onclick="WebToolsEnable('Standard',2521,false);">
          <input type=button class=SideButton value="�򿪴�ӡ��ť" <%=mDisabled%>  onclick="WebToolsEnable('Standard',2521,true);">
          <input type=button class=SideButton value="�ر��ĵ�" <%=mDisabled%>  onclick="webform.WebOffice.WebClose();">
      </tr>
      <tr width="100">
        <td align="center" class="TDTitleMiddleStyle" height="28">
          <font color="#FF0000"><b>���������á�</b></font>
	    </td>
      </tr>
      <tr width="100">
        <td align="center" valign=top class="TDTitleStyle" width="100">      
          <input type=button class=SideButton value="�޸�Զ���ĵ�" onclick="WebOpenAndRepair();">
          <input type=button class=SideButton value="�޸������ĵ�" onclick="WebOpenLocalAndRepair();">
        </td>
      </tr>-->
    </table>
    </form>
      <script>
          var height = $(window).height() - 54
          $('#table').height(height)
          $('#table table').height(height)
          $('#WebOffice').css('height', height)
          $(window).resize(function () {
              var height = $(window).height() - 54
              $('#table').height(height)
              $('#table table').height(height)
              $('#WebOffice').css('height', height)
          })

          $(document).ready(function () {
              var EditType = getQueryString('EditType');
              //0,0 ֻ��
              //1,1 ��д(������)  
              //2,1 ��д����
              if (EditType == "1,1") {
                  $(".btn_revision").hide();
              }
              else if (EditType == "2,1") {
                  ShowRevision(true);
              }
              else {
                  $("#tb_edit").hide();
                  webform.WebOffice.ShowToolBar = "0";
                  webform.WebOffice.ShowMenu = "0";
              }

          })

    </script>
</body>
</html>
