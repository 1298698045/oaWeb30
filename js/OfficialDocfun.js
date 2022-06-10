function archiveDialog(id,type) {

    //var rows = $('#datagrid').datagrid('getSelections')
    //if (rows.length == 0) {
    //    alert("请选择记录！");
    //    return
    //}

    //var Ids = [];
    ////var IsSynchronized ="";
    //for (var i = 0; i < rows.length; i++) {
    //    Ids.push(rows[i].LIST_RECORD_ID);
    //    IsSynchronized = rows[i].IsSynchronized;
    //    //if (IsSynchronized == "同步成功")
    //    //{
    //    //    alert("归档成功,不允许重复归档");
    //    //    return;
    //    //}
    //}
    //Ids = Ids.join(',');
    //console.log(Ids);
    var Ids = id;
    var ObjectTypeCode = type;
    var Url = "/wfinstance/archive2.aspx?Ids=" + Ids + "&ObjectTypeCode=" + ObjectTypeCode;
    showDialog(Url, "archiveDialog", "归档", 500, 200);
    return false;
}

function showRecDetail(t, id) {
    //var Url = "/wfinstance/UserLogin.aspx?t=" + t + "&id=" + id;
    //showDialog(Url, "UserLogin", "用户登录", 500, 200);
    var url = "/apps/RecDetail.aspx?t=A09&attachRight=16&id=" + id;
    window.open(url);
}

function renameDialog(Id, Name,type) {
    var ObjectTypeCode = type;
    var Url = "/wfinstance/rename.aspx?Id=" + Id + "&Name=" + Name + "&ObjectTypeCode=" + ObjectTypeCode
    showDialog(Url, "archiveDialog", "重命名", 500, 200);
    return false;
}

function cancelArchive(id,type) {
    //var rows = $('#datagrid').datagrid('getSelections')
    //if (rows.length == 0) {
    //    alert("请选择记录！");
    //    return
    //}

    //var Ids = [];
    //for (var i = 0; i < rows.length; i++) {
    //    Ids.push(rows[i].LIST_RECORD_ID)
    //}
    //Ids = Ids.join(',');
    //console.log(Ids);
    var ObjectTypeCode = type;
    if (confirm('您是否确认取消归档?')) {
        var data = {
            Ids: id,
            ObjectTypeCode: ObjectTypeCode
        }
        ajaxMethodGetData('workflow.archive.cancel', data, function (data) {
            doSearch();
        })
    }
    //if (Ids.length > 0) {
    //    if (confirm('您是否确认取消归档?')) {
    //        var data = {
    //            Ids: Ids,
    //            ObjectTypeCode: ObjectTypeCode
    //        }
    //        ajaxMethodGetData('workflow.archive.cancel', data, function (data) {
    //            doSearch();
    //        })
    //    }
    //} else {
    //    alert('请先选中行!')
    //}
}
function openWindow(url, title) {
    window.open(url, title, 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
}



function formatOper1(val, row, index, entityType) {
    var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
    var urlApprove = "/a0M/e?id=" + rowId;
    var name = row["Name"];
    name = name.substring(name.indexOf('>') + 1, name.lastIndexOf('<'));

    var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/' + entityType + '/detail?id=' + rowId + '">发文单</a>&nbsp;';
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"showRecDetail('A09','" + rowId + "')\"  >修改</a>&nbsp;";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"renameDialog('" + rowId + "','" + name + "',100109)\" >重命名</a>&nbsp;";
    //var downloadDoc = "/apps/files/dowloadDoc.aspx?Id=" + rowId + "&fullscreen=1&EditType=1,1&filesource=2";
    var downloadDoc = "/files/dowloadDoc.aspx?Id=" + rowId + "&fullscreen=1&EditType=1,1&filesource=2";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=" + downloadDoc + " >下载正文</a>";
    //var editDoc = "/apps/files/DocEditor.aspx?Id=" + rowId + "&fullscreen=1&EditType=3,1&filesource=2";
    var editDoc = "/jgfiles/samples/OpenAndSave_Word.aspx?Id=" + rowId + "&fullscreen=1&EditType=1&filesource=2";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href=" + editDoc + " >查看正文</a>";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:publish('" + rowId + "')\" >发布</a>&nbsp;";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:archiveDialog('" + rowId + "',100109)\" >归档</a>&nbsp;";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:cancelArchive('" + rowId + "',100109)\" >取消归档</a>&nbsp;";
    //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?type=1010&delID=" + rowId + "&retURL=\">删除</a>";
    //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/" + entityType + "/e?id=" + rowId + "&retURL=\" >修改</a>&nbsp;";
    return html;
}
function publish(id) {
    $('#changeDiv').show()
    $('#iframe').attr('src', '/alert/wf/publishToContent.html?id=' + id).show()
}
function formatOper2(val, row, index, entityType) {
    var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';
    var urlApprove = "/a0M/e?id=" + rowId;
    var name = row["Name"];
    name = name.substring(name.indexOf('>') + 1, name.lastIndexOf('<'));
    console.log(rowId);
    console.log(row);
    var html = '<a style=\"color:#015ba7;font-size:13px;\" target=\"_blank\" href="/' + entityType + '/detail?id=' + rowId + '">查看</a>&nbsp;';
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"showRecDetail('A08','" + rowId + "')\" >修改</a>&nbsp;";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"javascript:void(0)\" onclick=\"renameDialog('" + rowId + "','" + name + "',100108)\" >重命名</a>&nbsp;";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:publish('" + rowId + "')\" >发布</a>&nbsp;";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:archiveDialog('" + rowId + "',100108)\" >归档</a>&nbsp;";
    html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" onclick=\"javascript:cancelArchive('" + rowId + "',100108)\" >取消归档</a>&nbsp;";
    //html += "&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?type=1010&delID=" + rowId + "&retURL=\">删除</a>";
    return html;
}