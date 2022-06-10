<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>加签</title>
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
    <link href="/sCSS/33.0/sprites/1424976646000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main_source.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/Chatter.js"></script>
    <script src="/jslibrary/sfdc/DevContextMenu.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/apps/flowdesigner/editors/js/workflow.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <link href="/layui/layui/css/layui.css" rel="stylesheet" />

    <style>
        .layui-input-block{
            margin-left:0;
            width:300px;
        }
        .layui-form-select .layui-input{
            height:32px;
            line-height:32px;
        }
        .label.active {
            background-color: #f2f2f2;
            color: #0094ff !important;
        }

        .checkboxlabel.active {
            background-color: #f2f2f2;
            color: #0094ff !important;
        }

        .checkbox-group-label {
            width: 14% !important;
            float: left !important;
        }

        #addpeople {
            width: 15px;
            cursor: pointer;
            float: left;
            margin-right: 5px;
            margin-left: 5px;
            margin-top: 8px;
        }

        .morepeople {
            font-size: 12px;
        }

        .addpeople {
            float: left;
            font-size: 12px;
            margin-left: 5px;
            cursor: pointer;
            margin-left: 0px;
        }

        .addpeople > span {
            margin-top: 5px;
            float: left;
            position: relative;
            top: 2px;
        }

        .checkbox-group {
            float: left;
            border: 1px solid #dedede;
            padding: 5px;
            height: 200px;
            overflow-y: auto;
            width: 80%;
            margin-left: 0px;
            float: left;
            margin-bottom: 10px;
        }

        .checkboxlabel input {
            margin-right: 5px;
        }

        #nextActivityContainer {
            width: 350px;
        }

            #nextActivityContainer > div {
                float: left;
            }

        .checkbox-group > div:hover {
            background-color: #f2f2f2;
        }

        .search-input {
            float: left;
            border: 1px solid #dedede;
            height: 28px;
        }

        .search-input input {
            border: 0;
            outline: none;
            height: 26px;
            text-indent: 5px;
        }
        .periodElementGroup {
            display:inline-block;
            vertical-align: middle;
        }
        .zen .zen-skinnyForm .label {
            display:inline-block;
            
        }
        .layui-form-radio{
            padding-right:0;
            margin-right:10px;
        }
        .detailList{
            width:100%;
        }
        .detailList td{
            min-width: 100px;
            max-width: 300px;
        }
        .pbBody{
            padding: 0 20px;
        }
        .addpeople{
            margin-bottom:5px;
        }
        .dataCol.col02 .layui-form{
            position: relative;
            top: 5px;
        }
        .layui-form-radio>i{
            font-size:16px;
            margin-right: 4px;
        }
        .layui-form-radio{
            margin-top:0;
        }
        .layui-select-disabled{
            display:none;
        }
        #jumpActivity{
            position: relative;
            top: -4px;
            word-break: break-all;
        }
    </style>
</head>
<body>
    <form id="editPage" onsubmit="return false;">
        <input id="fromStepId" type="hidden" name="fromStepId" />
        <input id="duel_reports0" type="hidden" value="" name="duel_reports0" />
        <input id="duel_reports1" type="hidden" value="" name="duel_reports1" />
        <center>
        <div >
            <div class="pbBody">
                <table class="detailList" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td class="labelCol requiredInput">
                            <label for="cpn1"><b>需要加签节点：</b></label>
                        </td>
                        <td class="dataCol col02">
                            <div class="layui-form">
                                 <span id="jumpActivity"></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelCol requiredInput">
                            <label for="cpn1"><b>加签类型：</b></label>
                        </td>
                        <td class="dataCol col02">
                            <div class="layui-form">
                                <div class="layui-input-block">
                                 <input type="radio" value="51" name="insertType" id="insertType1" checked="checked" title="仅签字不流转" />                                     
                                 <input type="radio" value="52" name="insertType" id="insertType2" title="需要流转"/>
                            </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="labelCol">
                            <label for="cpn11">
                                <b>办理人员：</b></label>
                        </td>
                        <td nowrap="nowrap" style="text-align:left;">
                        <div style="float: left;">
                            <div class="addpeople">
                                <div class="search-input">
                                    <input type="text" value="" placeholder="请输入搜索字符" id="srchPeople" name="srchPeople" onblur="searchInnerPeople(this.value)" />
                                </div>
                                <img id="addpeople" src="/img/cal/add.png" alt="添加办理人员" />
                                <span>添加人员</span>
                            </div>
                            <div style="clear:both;margin-bottom:5px;">
                                <label style="display:inline-block;margin-right:10px;"><input id="allchecky" type="checkbox"/> 全选</label>
                                <label style="display:inline-block"><input id="allcheckn" type="checkbox"/> 反选</label>
                            </div>
                            <div class="checkbox-group" id="participatorContainer">
                               
                            </div>
                        </div>
                    </td>
                    </tr>
                    <tr>
                        <td class="labelCol requiredInput">
                            <label for="cpn1">
                                <span class="requiredMark">*</span><b>留言：</b></label>
                        </td>
                        <td colspan="3" class="data2Col">
                            <textarea name="memo" id="memo" cols="50" rows="2"></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <br />
            <table cellspacing="0" cellpadding="0" border="0" style="text-align:center;">
                <tbody>
                    <tr>
                        <td>
                            <input type="button" name="save" title="确定" class="primary btn" value=" 确定 " style="height: 25px;margin-right:10px;"  onclick="insertApprove(false);" />
                            <input type="button" name="cancel" title="取消" class="btn" value=" 取消 " onclick="closeDialog(false);" style="height: 25px;" />
                        </td>
                    </tr>
                </tbody>
            </table>
        </div></center>
        <script src="/layui/layui/layui.js"></script>
    <script src="/js/CommonUtils.js"></script>
        <script type="text/javascript">
            function closeDialog(refreshParent) {
                if (window.opener) {
                    window.opener.closeDialog(refreshParent);
                } else {
                    window.parent.closeDialog(refreshParent);
                }
            }
            function peopleLookupPick(a, b, c, d, e, f, g, k) {
                if (b == "zhihuiMember_lkid") {

                    document.getElementById(b).value = e;//id
                    document.getElementById(c).value = f;//name
                }
                else {
                    // debugger;
                    var ids = e.split(',');
                    var names = f.split(',');
                    // var sC = document.getElementById("duel_reports_select_1").options.length;
                    for (var c1 = 0; c1 < ids.length; c1++) {
                        var userId = ids[c1].substring(2);
                        document.getElementById("duel_reports_select_1").options.add(new Option(names[c1], userId));
                        //sC++;                                                                                       
                    }
                }//
            }
            function insertApprove()
            {
                //saveAllSelected([document.editPage.duel_reports_select_0, document.editPage.duel_reports_select_1], [document.editPage.duel_reports0, document.editPage.duel_reports1], ',', '\\', '--无--');
                //if (window.ffInAlert) { return false; } if (window.sfdcPage && window.sfdcPage.disableSaveButtons) { return window.sfdcPage.disableSaveButtons(); }
                var toStepIds = getQueryString('StepId');
                if (toStepIds == "")
                {
                    alert("请选择加签节点！");
                    return;
                }
                var toUserIds = [];

                for (var i = 0; i < $('#participatorContainer input::checked').length; i++) {
                    toUserIds.push($('#participatorContainer input::checked').eq(i).val())
                }
                if (toUserIds.length==0) {
                    alert("请选择加签节点的办理人员！");
                    return;
                } else {
                    toUserIds = toUserIds.join(',')
                }
                var d = {
                    processInstanceId: getQueryString('InstanceId') || '',
                    processId: getQueryString('ProcessId') || '',
                    toActivityId: getQueryString('StepId'),
                    toUserIds: toUserIds,
                    participators: toUserIds,
                    insertType: $('input[name="insertType"]::checked').val(),
                    remark: encodeURIComponent(document.getElementById("memo").value)
                }
                ajaxMethodPostData("process.instance.insertapprove", d, function (data) {
                    closeDialog(false);
                    if (data && data.msg) {
                        window.parent.success2(data.msg);
                    }
                });
            }
        </script>
        <script  type="text/javascript">
            var form
            layui.use(['form'], function () {
                form = layui.form
                form.render();
                jQuery("#jumpActivity").html(getQueryString('currentStepName') || '');
                ajaxMethodGetAsyncData('process.step.participator.getlist', {
                    processId: getQueryString('ProcessId')||'',
                    stepId: getQueryString('StepId')
                }, false, function (data) {
                    var html = ''
                    if (data.participators && data.participators.length) {
                        for (var i = 0; i < data.participators.length; i++) {
                            var item = data.participators[i]
                            if (item.selected) {
                                html += "<div class=\"checkboxlabel\"><label><input name=\"participator\" type=\"checkbox\" value='" + item.userId + "' checked='checked' >" + item.userName + ' / ' + item.BusinessUnitIdName + "</label></div>";
                            }
                            else {
                                html += "<div class=\"checkboxlabel\"><label><input name=\"participator\" type=\"checkbox\" value='" + item.userId + "'  >" + item.userName + ' / ' + item.BusinessUnitIdName + "</label></div>";
                            }
                        }
                    }
                    jQuery("#participatorContainer").html(html);
                })
            })
            
            //选择的人员id
            var ids = '';
            function getcheckedpeople(ids) {
                //console.log(ids)
                for (var i = 0; i < ids.length; i++) {
                    $('.checkbox-group').append('<div class="checkboxlabel"><label><input name="participator" type="checkbox" checked="checked" value="' + ids[i].valueId + '">' + ids[i].name + " (" + ids[i].EmployeeId + ") " + ids[i].BusinessUnitIdName + '</label></div>')
                }
            }
            function searchInnerPeople(search) {
                $('.checkbox-group>div').hide();
                $('.checkbox-group>div').each(function () {
                    var label = $(this).find('label').text();
                    if (label.indexOf(search) != -1) {
                        $(this).show();
                    }
                })
            }
            $('.search-input input').keyup(function () {
                if (event.keyCode == 13) {
                    var search = $(this).val()
                    $('.checkbox-group>div').hide();
                    $('.checkbox-group>div').each(function () {
                        var label = $(this).find('label').text()
                        if (label.indexOf(search) != -1) {
                            $(this).show();
                        }
                    })
                }
                if ($(this).val().length == 0) {
                    $('.checkbox-group>div').show();
                }
            })

            $('#allchecky').click(function () {
                if ($(this).prop('checked') == true) {
                    $('#participatorContainer input[type="checkbox"]').prop('checked', 'checked')
                } else {
                    $('#participatorContainer input[type="checkbox"]').prop('checked', '')
                }
            })
            $('#allcheckn').click(function () {
                $('#participatorContainer input[type="checkbox"]').each(function () {
                    if ($(this).prop('checked') == true) {
                        $(this).prop('checked', '')
                    } else {
                        $(this).prop('checked', 'checked')
                    }
                })

            })
        $('.checkboxlabel input').click(function () {
            $(this).parent().parent().toggleClass('active');
        })
        $('#addpeople').click(function () {
            var iWidth = '1000'
            var iHeight = '500'
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
            window.open('/alert/addpeople/addpeople.html', 'newwindow', 'height=' + iHeight + 'px, width=' + iWidth + 'px, top=' + iTop + ', left=' + iLeft + ', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')
        })
        $('#addpeople').next().click(function () {
            var iWidth = '1000';
            var iHeight = '500';
            var iTop = (window.screen.availHeight - 30 - iHeight) / 2;
            var iLeft = (window.screen.availWidth - 10 - iWidth) / 2;
            window.open('/alert/addpeople/addpeople.html', 'newwindow', 'height=' + iHeight + 'px, width=' + iWidth + 'px, top=' + iTop + ', left=' + iLeft + ', toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no')
        })
        //选择的人员id
        var ids = '';
        function getcheckedpeople(ids) {
            //console.log(ids)
            for (var i = 0; i < ids.length; i++) {
                $('.checkbox-group').append('<div class="checkboxlabel"><label><input name="participator" type="checkbox" checked="checked" value="' + ids[i].valueId + '">' + ids[i].name + " (" + ids[i].EmployeeId + ") " + ids[i].BusinessUnitIdName + '</label></div>')
            }
        }
        function searchInnerPeople(search)
        {
            $('.checkbox-group>div').hide();
            $('.checkbox-group>div').each(function () {
                var label = $(this).find('label').text();
                if (label.indexOf(search) != -1) {
                    $(this).show();
                }
            })
        }
        $('.search-input input').keyup(function () {
            if (event.keyCode == 13) {
                var search = $(this).val()
                $('.checkbox-group>div').hide();
                $('.checkbox-group>div').each(function () {
                    var label = $(this).find('label').text()
                    if (label.indexOf(search) != -1) {
                        $(this).show();
                    }
                })
            }
            if ($(this).val().length == 0) {
                $('.checkbox-group>div').show();
            }
        })
        function validateAndSave() {

        }
    </script>
    </form>
</body>
</html>


