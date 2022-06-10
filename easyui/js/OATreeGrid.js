
var editingId;

function insert(treeGridId, targetRowId, parendId, insertaction) {

    var newId = generateUUID();
    /*
    $('#' + treeGridId + '').treegrid('append', {
        parent: targetRowId,
        data: [{
            id: newId,
            text: '新建项目'
        }]
    }).treegrid('beginEdit', newId);
    */

    var newId = generateUUID();
    $('#' + treeGridId + '').treegrid('insert', {
        after: targetRowId,
        data: {
            id: newId,
            text: '新建项目'
        }
    });//.treegrid('refresh', newId).treegrid('beginEdit', newId);

    edit(treeGridId, newId);

    editingId = newId;

    InsertAction(newId, '新建项目', parendId, insertaction)
}

function insertSun(treeGridId, targetRowId,insertaction) {
    var newId = generateUUID();
    $('#' + treeGridId + '').treegrid('append', {
        parent: targetRowId,
        data: [{
            id: newId,
            text: '新建项目'
        }]
    });//.treegrid('beginEdit', newId);


    edit(treeGridId, newId);

    editingId = newId;

   InsertAction(newId, '新建项目', targetRowId, insertaction)
}

function append(treeGridId) {

    var newId = generateUUID();

    var node = $('#' + treeGridId + '').treegrid('getSelected');
    $('#' + treeGridId + '').treegrid('endEdit', editingId).treegrid('append', {
        parent: node.id,
        data: [{
            id: newId,
            text: '新建项目'
        }]
    }).treegrid('beginEdit', newId);
    editingId = newId;
}

function edit(treeGridId, targetRowId) {

    var row = $('#' + treeGridId + '').treegrid('getSelected');
    //cancel old edit row
    if (row && row.editing) {
        row.editing = false;
        $('#' + treeGridId + '').treegrid('refresh', targetRowId);
        $('#' + treeGridId + '').treegrid('endEdit', editingRowId);
        editingRowId = undefined;
        editingId = row.id;
    }

    //set select
    $('#' + treeGridId + '').treegrid('select', targetRowId);
    row = $('#' + treeGridId + '').treegrid('getSelected');

    row.editing = true;
    $('#' + treeGridId + '').treegrid('refresh', targetRowId);
    $('#' + treeGridId + '').treegrid('beginEdit', targetRowId);
    editingId = targetRowId;
}

function save(treeGridId, rowId, updateaction) {
    if (editingId != undefined) {

        var eidtor = $('#' + treeGridId + '').treegrid('getEditor', { index: editingId, field: "text" });
        var newValue=eidtor.target.val();

        $('#' + treeGridId + '').treegrid('update', {
            id: rowId,
            row: {
                text: newValue,
            }
        });
        UpdateAction(rowId, newValue, updateaction);

        $('#' + treeGridId + '').treegrid('select', editingId);
        var row = $('#' + treeGridId + '').treegrid('getSelected');
        row.editing = false;
        $('#' + treeGridId + '').treegrid('refresh', editingId);

        $('#' + treeGridId + '').treegrid('endEdit', editingId);

        editingId = undefined;
    }
}

function tgRowClick(treeGridId, rowId) {
    if (editingId != undefined) {

        //set editingId to select
        if (rowId != editingId) {
            $('#' + treeGridId + '').treegrid('select', editingId);
            var row = $('#' + treeGridId + '').treegrid('getSelected');
            row.editing = false;
            $('#' + treeGridId + '').treegrid('refresh', editingId);
            $('#' + treeGridId + '').treegrid('endEdit', editingId);
            editingId = undefined;
        }
        //set 
        $('#' + treeGridId + '').treegrid('select', rowId);
    }
}

function cancel(treeGridId) {
    if (editingId != undefined) {
        $('#' + treeGridId + '').treegrid('select', editingId);
        var row = $('#' + treeGridId + '').treegrid('getSelected');
        row.editing = false;
        $('#' + treeGridId + '').treegrid('refresh', editingId);

        $('#' + treeGridId + '').treegrid('cancelEdit', editingId);
        editingId = undefined;
    }
}

function remove(treeGridId, rowId, deleteaction) {

    $('#' + treeGridId + '').treegrid('remove', rowId);
    DeleteAction(rowId, deleteaction);
}

function generateUUID() {
    var d = new Date().getTime();
    if (typeof performance !== 'undefined' && typeof performance.now === 'function') {
        d += performance.now();
    }
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
}

function DeleteAction(id, deleteaction) {
    //tree.delete
    if (confirm("确定要删除吗")) {

        jQuery.ajax({
            url: "/apps/CommandProcessor.ashx?cmd=tree.delete",
            type: "GET",
            async: false,
            dataType: "json",
            data: {
                id: id,
                entityaction: deleteaction
            },
            success: function (data) {

            }
        });
    }
}

function UpdateAction(id, text, updateaction) {

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=tree.save",
        type: "GET",
        async: false,
        dataType: "json",
        data: {
            id: id,
            text: text,
            entityaction: updateaction
        },
        success: function (data) {

            bindLeftTree();
        }
    });
}

function InsertAction(id, text,pid, insertaction) {
    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=tree.add",
        type: "GET",
        async: false,
        dataType: "json",
        data: {
            id: id,
            text: text,
            pid:pid,
            entityaction: insertaction
        },
        success: function (data) {
            //bindLeftTree();
        }
    });
}