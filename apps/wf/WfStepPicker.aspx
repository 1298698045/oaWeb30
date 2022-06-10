<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WfStepPicker.aspx.cs" Inherits="WebClient.apps.wf.WfStepPicker" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>流程节点选中</title>
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/zen-componentsCompatible.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/elements.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/common.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1418663684000/Theme3/base/dStandard.css" rel="stylesheet"
        type="text/css" />
    <link href="/sCSS/32.0/sprites/1425766202000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css"
        rel="stylesheet" type="text/css" />
    <link href="/sCSS/32.0/sprites/1420068168000/Theme3/zh/base/extended.css" rel="stylesheet"
        type="text/css" />
    <link type="text/css" rel="stylesheet" href="/EXT/ext-3.3.3/resources/css/ext-all-notheme.css" />
    <link type="text/css" rel="stylesheet" href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/ExtCSS-SFDC.css" />
    <script src="/EXT/ext-3.3.3/ext.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
</head>
<body class="hasMotif homeTab popup popupTab brandNoBgrImg EmailCCBccLookup">
    <form name="editPage" method="post" id="editPage">
    <input type="hidden" id="lookupId" name="lookupId" />
    <input type="hidden" id="lknm" name="lknm" value="<%=Request["lknm"]%>" />
    <input type="hidden" id="lookupName" name="lookupName" />
    <input type="hidden" id="processId" name="processId" value="<%=Request["processid"]%>" />
    <input type="hidden" id="currentactivity" name="currentactivity" value="<%=Request["currentactivity"]%>" />
    <div class="bPageTitle">
        <div class="ptBody secondaryPalette">
            <div class="content">
                <img title="主页" class="pageTitleIcon" alt="主页" src="/s.gif"><h1>
                    选中以下某一个节点，点击确定</h1>
            </div>
        </div>
    </div>
    <div class="bDescription">
        选择类型，查询出对应的类型列表。</div>
    <div id="ep" class="bPageBlock brandSecondaryBrd bEditBlock bLayoutBlock secondaryPalette">
        <div class="pbHeader">
            <table cellspacing="0" cellpadding="0" border="0">
                <tbody>
                    <tr>
                        <td class="pbTitle">
                            <img width="1" height="1" title="" class="minWidth" alt="" src="/s.gif"><h2 class="mainTitle">
                                选择</h2>
                        </td>
                        <td id="topButtonRow" class="pbButton">
                            <input type="button" style="height:25px;"  id="okButton" onclick="pickSelect()" class="primary btn" value="确定" />
                            <input type="button" style="height:25px;"  id="cBtn" onclick="window.close()" class="btn" value="取消" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="pbBody">
            <div style="display: none" id="errorDiv_ep" class="pbError">
                错误：无效数据。<br />
                请查看下列所有错误消息以纠正数据。</div>
            <div class="pbSubsection">
                <table cellspacing="0" cellpadding="0" border="0" class="detailList">
                    <tr class="detailRow">
                        <td>
                            <div id="processSteps">
                            </div>
                        </td>
                    </tr>
                    <tr class="last detailRow">
                        <td>
                            <div class="pbBottomButtons">
                                <input type="button" style="height:25px;" name="save" title="确定" class="primary btn" value=" 确定 " onclick="pickSelect();" />
                                <input type="button" style="height:25px;"  name="cancel" title="取消" class="btn" value=" 取消 " onclick="window.close();"></div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="pbFooter secondaryPalette">
            <div class="bg">
            </div>
        </div>
    </div>
    <script type="text/javascript">
        /* [
        {
        "text": "ext-base-dom-more.js",
        "id": "src\/adapter\/ext-base-dom-more.js",
        "leaf": true,
        "cls": "file,folder"
        }]
        */
        //jQuery.on
        //Ext.onReady(function () {
        jQuery(document).ready(function () {
            // shorthand
            var Tree = Ext.tree;
            var rootId = document.getElementById("currentactivity").value;
            var type = document.getElementById("lknm").value;
            var url = "";
            var rootName = "当前节点";
            if (type == "backActivity")
            {
                url = '/WFPageProcessor.ashx?cmd=getpresteps&processid=' + document.getElementById("processId").value + '&currentactivity=' + rootId;
                rootId = document.getElementById("processId").value;
                rootName = '流程';
            }
            else if (type == "jumpActivity")
            {
                /*
                url = '/WFPageProcessor.ashx?cmd=getinitstep&processid=' + document.getElementById("processId").value;
                rootId = "";
                rootName = '流程';
                */
                url = '/WFPageProcessor.ashx?cmd=getinitstep&processid=' + document.getElementById("processId").value + '&currentactivity=' + rootId;
                rootId = document.getElementById("processId").value;
                rootName = '流程';
            }
            else
            {
                url = '/WFPageProcessor.ashx?cmd=GetPossibleTransitions&processid=' + document.getElementById("processId").value + '&currentactivity=' + rootId;
            }
            var tree = new Tree.TreePanel({
                useArrows: true,
                autoScroll: true,
                animate: false,
                enableDD: true,
                containerScroll: true,
                border: false,
                // auto create TreeLoader
                dataUrl: url,
                root: {
                    nodeType: 'async',
                    text: rootName,
                    draggable: false,
                    id: rootId
                }
            });
            tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
            // render the tree
            tree.render('processSteps');
            tree.getRootNode().expand();
        });
        function treeSelectionChange(a, b) {
            var deptId = a.selNode.id;
            // alert(deptId);
            document.getElementById("lookupId").value = deptId;
            document.getElementById("lookupName").value = a.selNode.text;
            //debugger;
        }
        function pickSelect() {
            var values = document.getElementById("lookupId").value;
            var names = document.getElementById("lookupName").value
            if (values == "") {
                alert("请选择流程节点。");
                return;
            }
            var rootId = document.getElementById("currentactivity").value;
            if (values == rootId) {
                alert("你选择的是当前执行或者运行节点，确定吗？");
                //return;
            }
            var processId = document.getElementById("processId").value;
            if (values == processId) {
                alert("请正确选择节点。");
                return;
            }
            var lknm = document.getElementById("lknm").value;
            window.opener.lookupPickActivity('editPage', lknm + '_lkid', lknm, '', values, names, 'null', '')
            //top.window.opener.lookupPick('editPage', '{0}_lkid', '{0}', '', '{1}', '{2}', 'null', '')
            //debugger;
            //top.window.opener.setParticipator('participantor', 'participantor_lkid', names, values);
            window.close();
        }
        // Ext.onReady(function() {
        //                                                                        var store = Ext.create('Ext.data.TreeStore', {
        //                                                                            root: {
        //                                                                                expanded: true,
        //                                                                                text: "",
        //                                                                                user: "",
        //                                                                                status: "",
        //                                                                                children: [
        //                                                                                { text: "detention", leaf: true },
        //                                                                                { text: "homework", expanded: true,
        //                                                                                    children: [
        //                                                                                        { text: "book report", leaf: true },
        //                                                                                        { text: "alegrbra", leaf: true }
        //                                                                                    ]
        //                                                                                },
        //                                                                                { text: "buy lottery tickets", leaf: true }
        //                                                                            ]
        //                                                                            }
        //                                                                        });

        //                                                                        Ext.create('Ext.tree.Panel', {
        //                                                                            title: 'Simple Tree',
        //                                                                            width: 200,
        //                                                                            height: 150,
        //                                                                            store: store,
        //                                                                            rootVisible: false,
        //                                                                            renderTo: Ext.getBody()
        //                                                                        });

        // }):
    </script>
    </form>
</body>
</html>
