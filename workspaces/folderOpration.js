var renameDialog;
var moveDialog;
var extSrch
$(function () {
    InitRenameDialog();
    InitMoveDialog();
    
    DealWithZIndex();
});

$(window).resize(function () {
    DealWithZIndex();
});

function DealWithZIndex() {
    var header_height = $("#AppBodyHeader").height();
    var header_width = $("#AppBodyHeader").width();
    var footer = $("#SiteFooter1");
    var footer_height = footer.height();

    var contentWrapper = $("#contentWrapper");
    var wrapperStyle = contentWrapper.attr('style');
    contentWrapper.attr("style", wrapperStyle+";z-index:-2");

    var bodyDiv = $(".bodyDivs");
    var elementStyle = bodyDiv.attr('style');
    var newStyle = elementStyle + "position:absolute;left:0px; top:" + header_height + "px;z-index:-1;width:" + header_width + "px;";
    bodyDiv.attr("style", newStyle);

    var wrapper_height=$("#contentWrapper").height();
    
    footer.attr('style', 'position:absolute;left:0;top:' + (header_height * 1 + 1 * wrapper_height - 120) + 'px;' + 'width:' + header_width + 'px;');
}

function InitRenameDialog() {

    renameDialog = OverlayDialogElement.getDialog('nextstep_picker_');
    renameDialog.isModal = true;
    renameDialog.width = 450;// 762;
    renameDialog.hasButtonsBar = true;
    renameDialog.displayX = true;
    renameDialog.allowKeyboardEsc = true;
    renameDialog.extraClass = '';
    renameDialog.isAbsolutePositioned = false;
    renameDialog.refreshOnClose = false;
    renameDialog.isMovable = true;

    renameDialog.buttonContents = '\u003Cinput value=\" 重命名 \" style=\"height:25px;\" class=\"btn\" id=\"nextstep_picker_save_btn_Rename\" name=\"saveBtn\" onclick=\"renameItem();\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"nextstep_picker_cancel_btn_Rename\" name=\"cancelBtn\" onclick=\"renameDialog.cancel();\" title=\"取消 (Esc)\" type=\"button\" style=\"height:25px;\" /\u003E';
    renameDialog.setTitle('重命名');
    renameDialog.contents = '<div style="text-align:center;">名称：<input style="width:300px;height:22px;" id="newItemName" type="text"></textarea>'
    renameDialog.contents += '<div style="display:none;"><div id="Id_post"></div><div id="IsFolder_post"></div></div>';
    renameDialog.contents += '</div>';
}

function InitMoveDialog() {

    moveDialog = OverlayDialogElement.getDialog('move_file_');
    moveDialog.isModal = true;
    moveDialog.width = 450;// 762;
    moveDialog.hasButtonsBar = true;
    moveDialog.displayX = true;
    moveDialog.allowKeyboardEsc = true;
    moveDialog.extraClass = '';
    moveDialog.isAbsolutePositioned = false;
    moveDialog.refreshOnClose = false;
    moveDialog.isMovable = true;

    moveDialog.buttonContents = '\u003Cinput value=\" 移动 \" style=\"height:25px;\" class=\"btn\" id=\"nextstep_picker_save_btn_Rename\" name=\"saveBtn\" onclick=\"moveItem();\" type=\"button\" /\u003E\u003Cinput value=\" 取消 \"  class=\"btn\" id=\"nextstep_picker_cancel_btn_Rename\" name=\"cancelBtn\" onclick=\"moveDialog.cancel();\" title=\"取消 (Esc)\" type=\"button\" style=\"height:25px;\" /\u003E';
    moveDialog.setTitle('移动');
    moveDialog.contents = '<div class="zTreeDemoBackground left"><ul id="folderTreePanel" class="ztree"></ul>'
    moveDialog.contents += '<div style="display:none;"><div id="moveItemId"></div><div id="IsFolder"></div><div id="newParentId"></div></div>';
    moveDialog.contents += '</div>';
}

function showRenameDialog(itemId, oldName, isFolder) {
    $('#Id_post').html(itemId);
    $('#IsFolder_post').html(String(isFolder));
    $('#newItemName').val(oldName);

    renameDialog.show();
}

function showMoveDialog(itemId, isFolder) {

    $('#moveItemId').html(itemId);
    $('#IsFolder').html(String(isFolder));
    
    moveDialog.show();

    buildTree();
}

function buildTree() {

    $("#folderTreePanel").html('');

    var treeHeight = 0;
    //Ext.onReady(function () {
    jQuery(document).ready(function () {
        //treeHeight = getAutoHeight();
        //alert(treeHeight);
        treeHeight =200
        // jQuery("#folderTreePanel").height(treeHeight);
        //jQuery("#gridBody").height(treeHeight-111);
        //alert(treeHeight);
        // shorthand
        var Tree = Ext.tree;
        //debugger
        var tree = new Tree.TreePanel({
            rootVisible: !1, autoScroll: !0,
            /*
            useArrows: true,
            animate: false,
            enableDD: true,
            */
            //containerScroll: true,
            border: true,
            height: treeHeight,
            //auto create TreeLoader
            //FolderTreeServlet
            dataUrl: "/_ui/content/folder/archfoldertreeservlet?type=100100&checksecurity=1",
            root: {
                nodeType: 'async',
                text: '文档库',
                draggable: false,
                id: ''
            }
        });

        tree.getSelectionModel().on("selectionchange", treeSelectionChange, tree);
        // render the tree
        tree.render('folderTreePanel');
        tree.getRootNode().expand();

        jQuery("#ext-gen5").height('100%');

    });
}

function treeSelectionChange(a, b) {
    var nodeId = a.selNode.id;
    $("#newParentId").html(nodeId);
}

function deleteItem(itemId, isFolder) {
    var cfm=confirmDelete();
    if (cfm) {
        jQuery.ajax({
            url: "/apps/CommandProcessor.ashx?cmd=filefolder.delete",
            type: "GET",
            async: false,
            dataType: "json",
            data: {
                ItemId: itemId,
                IsFolder: isFolder
            },
            success: function (data) {
                //console.log(data);
                refreshGrid();
            }
        });
    }
}


function moveItem() {

    var newParentId = $('#newParentId').html();

    if (newParentId.length == 0) {
        moveDialog.hide();
        alert('请选择目标文件夹');
        return;
    }

    var itemId = $('#moveItemId').html();
    var isFolder = $('#IsFolder').html();

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=filefolder.move",
        type: "GET",
        async: false,
        dataType: "json",
        data: {
            ItemId: itemId,
            DestinationId: newParentId,
            IsFolder: isFolder
        },
        success: function (data) {
            //console.log(data);
            moveDialog.hide();
            refreshGrid();
        }
    });
}

function renameItem() {

    var newName = $('#newItemName').val();

    if (newName.length == 0) {
        renameDialog.hide();
        return;
    }

    //filefolder.rename
    var itemId = $('#Id_post').html();
    var isFolder = $('#IsFolder_post').html();

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=filefolder.rename",
        type: "GET",
        async: false,
        dataType: "json",
        data: {
            Id: itemId,
            NewName: newName,
            IsFolder: isFolder
        },
        success: function (data) {
            //console.log(data);
            renameDialog.hide();
            refreshGrid();
        }
    });
}

function refreshGrid() {
    var left_ID = $('.left_ID').html();
    var right_ID = $('.right_ID').html();

    if (left_ID.length == 0) {
        if (right_ID.length == 0)
            loadGrids(0);
        else
            loadFolderData(right_ID, 'latestuse');
    } else {
        switch (left_ID) {
            case '10010000-0000-0000-0000-000000000001':
                if(right_ID.length==0)
                    loadGrids(1);
                else
                    loadFolderData(right_ID, 'my');
                break;
            case '10010000-0000-0000-0000-000000000003':
                if (right_ID.length == 0)
                    loadGrids(2);
                else
                    loadFolderData(right_ID, 'share');
                break;
            case '10010000-0000-0000-0000-000000000002':
                if (right_ID.length == 0)
                    loadGrids(3);
                else
                    loadFolderData(right_ID, 'org');
                break;
            case '10010000-0000-0000-0000-000000000303':
                if (right_ID.length == 0)
                    loadGrids(4);
                else
                    loadFolderData(right_ID, 'archive');
                break;
        }
    }
}
$(document).ready(function () {
    $('.sort-icon').click(function () {
        reloaddata()
    })
})
function reloaddata() {
    var id = $('.file-nav span:last').attr('fileid')
    var searchType = '';
    var searchtype = $('.slds-is-actives').children('a').children('.type').html();
    if (searchtype == '最近使用') {
        searchType = 'latestuse';
    } else if (searchtype == '我的文件') {
        searchType = 'my';
    } else if (searchtype == '共享文件') {
        searchType = 'share';
    } else if (searchtype == '单位文件') {
        searchType = 'org';
    }
    else if (searchtype == '流程归档目录') {
        searchType = 'archive';
    }
    loadFolderData(id, searchType)

}
var layer
layui.use('layer', function () {
    layer = layui.layer;
});
var method = '';
var filterquery = {}
function loadGrids(extSrch) {
    var popup = layer.open({
        type: 3,
    });
    var pageSize = 20
    var pageNumber = $('.zxf_pagediv .current').length == 0 ? 1 : $('.zxf_pagediv .current').html()
    if ($('.sort-icon.up').length > 0) {
        var sort = $('.sort-icon.up').parents('th').attr('name')
        var order = 'desc'
    }
    if ($('.sort-icon.down').length > 0) {
        var sort = $('.sort-icon.down').parents('th').attr('name')
        var order = 'asc'
    }
    if (sort) {
        filterquery.sort = sort
        filterquery.order = order
    }
    $('.file-nav span').not($('.file-nav span').eq(0)).remove()
    if (extSrch == 0) {
        type = 'latestuse';
        method = 'file.latestuse.search';
    } else if (extSrch == 1) {
        type = 'my';
        method = 'file.files.search';
    } else if (extSrch == 2) {
        type = 'share';
        method = 'file.files.search';
    } else if (extSrch == 3) {
        type = 'org';
        method = 'file.files.search';
    } else if (extSrch == 4) {
        type = 'archive';
        method = 'file.files.search';
    }
    setTimeout(function () {
        jQuery.ajax({
            async: false, cache: false, dataType: "json",
            error: function (request, textStatus, errorThrown) {
                errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, "&gt;");
            },
            type: "GET",
            data: filterquery,
            url: "/apps/CommandProcessor.ashx?cmd=" + method + "&srchType=" + type + '&pageSize=20' + '&pageNumber=' + pageNumber,
            success: function (data, textStatus) {
                renderGrid(data);
                if (extSrch != 0) {
                    createpage(data.total, pageNumber)
                } else {
                    $(".zxf_pagediv").html('<div class="page-container"></div>')

                }
                setTimeout(function () {
                    layer.close(popup);
                }, 200)
            },
        });
    }, 0)
    
}

function renderGrid(data) {
    //console.log(data)
    var stml = "";

    if (data.folders != undefined){
        for (var i = 0; i < data.folders.length; i++) {
            var items = data.folders[i];
            if (items.privilege) {
                var canAdmin = items.privilege.canAdmin
                var canRead = items.privilege.canRead
                //var isDeletable = items.privilege.isDeletable
                //var canAddFile = items.privilege.canAddFile
                //var canShare = items.privilege.canShare
                var canDelete = items.privilege.canDelete
                var canDownload = items.privilege.canDownload
            }
            if (canRead){
            
            if ((i % 2) == 0)
                //onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\"
                stml += "<tr  canadmin='" + canAdmin + "'class=\" dataRow even\" id='" + items.id + "'>";
            else
                //onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\"
                stml += "<tr canadmin='" + canAdmin + "'class=\" dataRow odd\" id='" + items.id + "' >";
            stml += '<td class="slds-cell-edit slds-cell-error errorColumn cellContainer ">';
            stml += '<span class="slds-grid slds-grid--align-spread">';
            stml += '<div class="slds-cell-edit errorColumn slds-cell-error">';
            stml += '<div class="slds-m-horizontal--xx-small forceStatusIcon">';
            stml += '</div>';
            stml += '<span class="slds-row-number slds-text-body--small slds-text-color--weak"></span>';
            stml += '</div>';
            stml += '</span>';
            stml += '</td>';
            stml += '<td class="">';
            stml += '<div class="pretty circle info">';
            stml += '<input type="checkbox" name="checks">';
            stml += '<label>';
            stml += '<i class="mdi mdi-check"></i>';
            stml += '<span class="fullName"></span>';
            stml += '&nbsp;&nbsp;';
            stml += '<span class="Unit"></span><span></span>';
            stml += '</label>';
            stml += '</div>';
            stml += '</td>';
            stml += '<td class="selectionColumnHeader floder" id="' + items.id + '"><img style="width:32px;float:left;margin-right:8px;margin-top:8px;" src="/img/images/Folder.png" style="margin-right: 8px;" />' + items.name + "</td>";
            if (!items.sortNumber) {
                items.sortNumber = ''
            }
            stml += '<td class=\"dataCell\">' + items.sortNumber + '</td>';
            stml += '<td class="">&nbsp</td>';
            stml += '<td class=\"dataCell\">' + items.createdOn + '</td>';
            stml += '<td class=\"dataCell\">' + items.createdByName + '</td>';
            stml += ' <td class="slds-cell-edit cellContainer">';
            stml += '<span class="slds-grid slds-grid--align-spread">';
            stml += '<button canDelete="' + canDelete + '" canDownload="' + canDownload + '" canadmin="' + canAdmin + '" canread="' + canRead + '" isFolder="true" itemName="' + items.name + '" rowId=' + items.id + ' class="slds-button slds-button_neutral showActionsButton" style="padding-left: 0;">';
            stml += '<img style="width:10px;height:10px;" src="/img/cal/20.png">';
            stml += '</button>';
            stml += '</span>';
            stml += '</td>';
            stml += '</tr>';
            }
        }
    }
    
    
    var files = data.files;
    if (files == undefined) {
        files = data.listData;
    }

    if (files != undefined) {
        if (!stml) {
        var stml = ''
        }
       for (var i = 0; i < files.length; i++) {
           var item = files[i];
           if (item.privilege) {
               var canAdmin = item.privilege.canAdmin
               var canRead = item.privilege.canRead
               //var isDeletable = items.privilege.isDeletable
               //var canAddFile = items.privilege.canAddFile
               //var canShare = items.privilege.canShare
               var canDelete = item.privilege.canDelete
               var canDownload = item.privilege.canDownload
           }
           if (canRead){
           var FileExtension = item.fileExtension
           if (FileExtension == "xls" || FileExtension == "xlsx") {
               imgsrc = "/img/filetype/xls.png"
           }
           else if (FileExtension == "docx" || FileExtension == "doc") {
               imgsrc = "/img/filetype/doc.png"
           }
           else if (FileExtension == "zip") {
               imgsrc = "/img/filetype/rar.png"
           }
           else if (FileExtension == "png" || FileExtension == "jpg") {
               imgsrc = "/img/filetype/Image.png"
           }
           else if (FileExtension == "bmp" || FileExtension == "jpeg") {
               imgsrc = "/img/filetype/Image.png"
           } else if (FileExtension == "txt") {
               imgsrc = "/img/filetype/Folder.png"
           }
           else if (FileExtension == "pdf") {
               imgsrc = "/img/filetype/Pdf.png"
           } else {
               imgsrc = "/img/filetype/Folder.png"
           }
        if ((i % 2) == 0)
            //onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\"
            stml += "<tr class=\" dataRow even\"  id='" + item.id + "'>";
        else
            //onmouseover=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onblur=\"if (window.hiOff){hiOff(this);}\"
            stml += "<tr class=\" dataRow odd\"  id='" + item.id + "'>";

        stml += '<td class="slds-cell-edit slds-cell-error errorColumn cellContainer">';
        stml += '<span class="slds-grid slds-grid--align-spread">';
        stml += '<div class="slds-cell-edit errorColumn slds-cell-error">';
        stml += '<div class="slds-m-horizontal--xx-small forceStatusIcon">';
        stml += '</div>';
        stml += '<span class="slds-row-number slds-text-body--small slds-text-color--weak"></span>';
        stml += '</div>';
        stml += '</span>';
        stml += '</td>';
        stml += '<td class="">';
        stml += '<div class="pretty circle info">';
        stml += '<input type="checkbox" name="check">';
        stml += '<label>';
        stml += '<i class="mdi mdi-check"></i>';
        stml += '<span class="fullName"></span>';
        stml += '&nbsp;&nbsp;';
        stml += '<span class="Unit"></span><span></span>';
        stml += '</label>';
        stml += '</div>';
        stml += '</td>';
        var name = item.name
        if (name.indexOf(' ') != '-1') {
            name = name.split(' ')
            name = name.join('')
        }
        var openControlViewFilestr = '"' + item.viewLink + '","' + FileExtension + '","' + item.link + '","' + name + '"'
        stml += '<td class="selectionColumnHeader"><a style="display: inline-block;" onclick=openControlViewFile(' + openControlViewFilestr + ') ><img src="' + imgsrc + '" style="margin-right: 8px;width:20px;height:20px;" />' + item.name + "</a></td>";
        

        if (!item.sortNumber)
        {
            item.sortNumber = ''
        }

        stml += '<td class=\"dataCell\"><img onclick="filersort(\'' + item.id + '\',\'' + item.folderId + '\',\'up\',\'' + item.sortNumber + '\',\'' + files.length + '\')" class="sortimgbtn up" src="/img/images/Ascending2.png"><img onclick="filersort(\'' + item.id + '\',\'' + item.folderId + '\',\'down\',\'' + item.sortNumber + '\',\'' + files.length + '\')" class="sortimgbtn down" src="/img/images/Descending2.png"></td>';
        stml += '<td class="">' + item.fileSize + '</td>';
        stml += '<td class=\"dataCell\">' + item.createdOn + '</td>';
        if (item.createdByName == undefined) {
            stml += '<td class=\"dataCell\">&nbsp</td>';
        } else {
            stml += '<td class=\"dataCell\">' + item.createdByName + '</td>';
        }
        stml += ' <td class="slds-cell-edit cellContainer">';
        stml += '<span class="slds-grid slds-grid--align-spread">';
        stml += '<button canDelete="' + canDelete + '" canDownload="' + canDownload + '" canadmin="' + canAdmin + '" canread="' + canRead + '"  FileExtension="' + item.fileExtension + '" shareUrl="' + item.shareUrl + '" viewLink="' + item.viewLink + '" link="' + item.link + '" canadmin="' + item.canAdmin + '" fileExtension="' + item.fileExtension + '" isFolder="false" itemName="' + item.name + '" rowId=' + item.id + ' class="slds-button slds-button_neutral showActionsButton" style="padding-left: 0;">';
        stml += '<img style="width:10px;height:10px;" src="/img/cal/20.png">';
        stml += '</button>';
        stml += '</span>';
        stml += '</td>';
        stml += '</tr>';
           }
       }
    }
    
    jQuery("#chidItems").html(stml);
        //$('.pretty').click(function () {
        //    var name = $(this).parents('td').next().text()
        //    var id = $(this).parents('tr').attr('id')
        //    $('.file-nav').append('<span style="display:none" name="' + name + '" fileid="' + id + '"></span>')
        //})
    $('#chidItems').find('td').each(function () {
        var index = $(this).index()
        var width = $(this).parent().parent().prev().find('th').eq(index).width()
        $(this).css('max-width', width)
        $(this).css('width', width)
        $(this).css('min-width', width)
    })
    $('.showActionsButton').click(function (e) {
        $('.noSidebarCell').css('position', 'relative');
        var itemId = $(this).attr('rowId');
        var shareUrl = $(this).attr('shareUrl');
        var link = $(this).attr('link');
        var viewLink = $(this).attr('viewLink');
        var FileExtension = $(this).attr('FileExtension');
        var x = $(this).offset();
        var top = x.top - 92;
        var itemname = $(this).attr('itemname')
        if (itemname.indexOf(' ')!=-1) {
            itemname = itemname.split(' ').join()
        }
        $('.cencela').css('top', top);
        $('.cencela').toggle()
        $('.cencela').find('li').remove()
        
        if ($(this).attr('isfolder') == 'false') {
            var isfoldertype = 0
        } else {
            var isfoldertype = 1
        }
        if ($(this).attr('isfolder') == 'false') {
            var openControlViewFilestr = '"' + viewLink + '","' + FileExtension + '","' + link + '","' + itemname + '"'
            $('.cencela').append('<li ><a onclick=openControlViewFile(' + openControlViewFilestr + ') style="display: block;"  download="">查看</a></li>')
            $('.cencela').append('<li ><a style="display: block;" href="' + shareUrl + '.' + FileExtension + '  " download="">下载</a></li>')
            

            if ($(this).attr('canadmin') != 'false') {

                $('.cencela').append('<li onclick=changefilequanxian("' + itemId + '","' + itemname + '")><a style="display: block;" href="#">设置权限</a></li>'
                    +'<li onclick=ViewFile("' + itemId + '")><a style="display: block;" href="#">详情</a></li>'
                    + '<li onclick=removeclass("' + itemId + '","' + isfoldertype + '")><a style="display: block;" href="#">移动</a></li>'
                    + '<li onclick=changename("' + itemId + '","' + itemname + '","' + isfoldertype + '")><a style="display: block;" href="#">重命名</a></li>'
                    + '<li onclick=deletefile("' + itemId + '","' + isfoldertype + '","' + $(this).attr('canDelete') + '")><a style="display: block;" href="#">删除</a></li>')
            }
            } else {
            if ($(this).attr('canadmin') != 'false') {
                $('.cencela').append('<li onclick=editFolder("' + itemId + '")><a style="display: block;" href="#">编辑</a></li>'
                    + '<li onclick=changename("' + itemId + '","' + itemname + '","' + isfoldertype + '")><a style="display: block;" href="#">重命名</a></li>'
                    + '<li onclick=removeclass("' + itemId + '","' + isfoldertype + '")><a style="display: block;" href="#">移动</a></li>'
                    + '<li onclick=deletefile("' + itemId + '","' + isfoldertype + '","' + $(this).attr('canDelete') + '")><a style="display: block;" href="#">删除</a></li>')

            }
        }
        var height = $(window).height()
        //console.log(top + $('.cencela').height())
        //console.log(height - 111)
        if (top + $('.cencela').height() > height - 111) {
            $('.cencela').css('top', top - $('.cencela').height());

        }
        
                                
                                
                                
                                


        //bind action url 
        //if ($('.cencela').is(":visible")) {

        //    var itemId = $(this).attr('rowId');
        //    $('.move_id').html(itemId);
        //    var itemName = $(this).attr('itemName');
        //    var isFolder = $(this).attr('isFolder');
        //    var actions = $('.cencela li a');
        //    var fileExtension = $(this).attr('fileExtension');
        //    var canadmin = $(this).attr('canAdmin');

            //$(actions).each(function (index, q) {

            //    $(this).unbind("click");

            //    if ($(this).text() == '编辑') {
            //        if (canadmin == 'true' && isFolder == 'true') {
            //            $(this).parent().show();
            //            //show 编辑
            //            var url = '/workspaces/editFolder.aspx?t=069&id='
            //            url += itemId;
            //            url += '&retUrl=%2f069%2fo';
            //            $(this).attr('href', url);
            //        } else {
            //            //hide 编辑
            //            $(this).parent().hide();
            //        }
            //    }

            //    if ($(this).text() == '查看') {
                   
            //        if (fileExtension == ".xls" || fileExtension == "xls" ||
            //                                            fileExtension == ".xlsx" || fileExtension == "xlsx" ||
            //                                            fileExtension == ".docx" || fileExtension == "docx" ||
            //                                            fileExtension == ".doc" || fileExtension == "doc") {
            //            $(this).parent().show();
            //            $(this).attr('onclick', 'openControlViewFile("' + itemId + '")');

            //        }
            //        else if (fileExtension == ".pdf" || fileExtension == "pdf"
            //           || fileExtension == ".jpg" || fileExtension == "jpg"
            //            || fileExtension == ".png" || fileExtension == "png"
            //            || fileExtension == ".gif" || fileExtension == "gif"
            //            || fileExtension == ".bmp" || fileExtension == "bmp") {
            //            $(this).parent().show();
            //            $(this).attr('onclick', 'viewFile("' + itemId + '")');
            //        } else {
            //            $(this).parent().hide();
            //        }
            //    }

            //    if ($(this).text() == '删除') {

            //        if (canadmin == 'true') {
            //            $(this).attr('onclick', "deleteItem('" + itemId + "'," + isFolder + ")");
            //            $(this).parent().show();
            //        } else {
            //            $(this).parent().hide();
            //        }
            //    }

            //    if ($(this).text() == '重命名') {
            //        if (canadmin == 'true') {
            //            $(this).attr('onclick', "showRenameDialog('" + itemId + "','" + itemName + "'," + isFolder + ")");
            //            $(this).parent().show();
            //        } else {
            //            $(this).parent().hide();
            //        }
            //    }

            //    if ($(this).text() == '移动') {
            //        if (canadmin == 'true') {
            //            $(this).attr('onclick', "showMoveDialog('" + itemId + "'," + isFolder + ")");
            //            $(this).parent().show();
            //        } else {
            //            $(this).parent().hide();
            //        }
            //    }
            //});
            //var types = '';
            //var folder_html = '';
            //var left_id = $('.left_ID').html();
            //if (left_id == '10010000-0000-0000-0000-000000000001') {
            //    index = 0;
            //    tree(index);
            //    $('.move_item').removeClass('move_active')
            //    $('.move_item').eq(0).addClass('move_active')
            //} else if (left_id == '10010000-0000-0000-0000-000000000003') {
            //    index = 1;
            //    tree(index);
            //    $('.move_item').removeClass('move_active')
            //    $('.move_item').eq(1).addClass('move_active')
            //} else if (left_id == '10010000-0000-0000-0000-000000000002') {
            //    index = 2;
            //    tree(index);
            //    $('.move_item').removeClass('move_active')
            //    $('.move_item').eq(2).addClass('move_active')
            //}
           
            //function tree(i) {
            //    if (i == 0) {
            //        types = 'my';
            //    } else if (i == 1) {
            //        types = 'share';
            //    } else if (i == 2) {
            //        types = 'org';
            //    }
            //    jQuery.ajax({
            //        async: true, cache: false, dataType: "json",
            //        error: function (request, textStatus, errorThrown) {
            //            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, "&gt;");
            //        },
            //        type: "GET",
            //        url: "/apps/CommandProcessor.ashx?cmd=file.files.search&srchType=" + types,
            //        success: function (data, textStatus) {
            //            //console.log(data)
            //            folder_html = '';
            //            $('.move_right_ul').html('');
            //            var folder = data.folders;
            //            for (var i = 0; i < folder.length; i++) {
            //                if (itemId == folder[i].id) {
                                
            //                   // console.log(folder[i]);
            //                } else {
            //                    folder_html += '<li id="' + folder[i].id + '" class="move_right_item"><img src="/img/bumen.png" style="margin-right: 8px;" />';
            //                    folder_html += '<span>' + folder[i].name + '</span></li>';
            //                }
            //            }
            //            $('.move_right_ul').append(folder_html);
            //            $('.move_right_item').click(function () {

            //            })
            //        },
            //    });
            //}
            //}
       

        $('.move_item').click(function () {
            $('.move_item').removeClass('move_active');
            $(this).addClass('move_active');
            var moveId = $(this).attr('id');
            var i = $(this).index()
            tree(i);
        })

        window.event ? window.event.cancelBubble = true : e.stopPropagation();
    })

    $(document).click(function () {
        $('.cencela').hide();
    })

    $('.cencela li').click(function () {
        $('.cencela').hide();
    })

    $('.floder').click(function () {
        if ($(this).parent().attr('canadmin') == 'false') {
            $('.buttonbtn-group').hide()
            $('.advancedSearch').parent().show()
        } else {
            $('.buttonbtn-group').show()
            $('.advancedSearch').parent().show()
        }
        
        var id = $(this).attr('id');
        $('.right_ID').html(id);
        //console.log(id);
        var searchType = '';
        var searchtype = $('.slds-is-actives').children('a').children('.type').html();
        if (searchtype == '最近使用') {
            searchType = 'latestuse';
        } else if (searchtype == '我的文件') {
            searchType = 'my';
        } else if (searchtype == '共享文件') {
            searchType = 'share';
        } else if (searchtype == '单位文件') {
            searchType = 'org';
        } else if (searchtype == '流程归档目录') {
            searchType = 'archive';
        }
        if (searchtype == '最近使用') {
        } else {
            $('.editFolder').parent().show()
        }
        $('.file-nav').append('<span canadmin="' + $(this).parent().attr('canadmin') + '"iseditable="' + $(this).parent().attr('iseditable') + '"name="' + $(this).text() + '"fileid="' + id + '"onclick=loadFolderData("' + id + '","' + searchType + '")> / ' + $(this).text() + '</span>')
        $('.file-nav span:last').click(function () {
            $(this).nextAll().remove()
            if ($(this).attr('canadmin') == 'false') {
                $('.buttonbtn-group').hide()
                $('.advancedSearch').parent().show()
            } else {
                $('.buttonbtn-group').show()

                $('.advancedSearch').parent().show()
            }
        })
        loadFolderData(id, searchType);
        //jQuery.ajax({
        //    async: true, cache: false, dataType: "json",
        //    error: function (request, textStatus, errorThrown) {
        //        errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, "&gt;");
        //    },
        //    type: "GET",
        //    url: "/apps/CommandProcessor.ashx?cmd=file.files.search&folderid=" + id + '&srchType=' + searchType,
        //    success: function (data, textStatus) {
        //        console.log(data);
        //        renderGrid(data);
        //    }
        //})
    })
}

function loadFolderData(folderId, searchType) {
    var popup = layer.open({
        type: 3,
    });
    var pageSize = 20
    var pageNumber = $('.zxf_pagediv .current').length == 0 ? 1 : $('.zxf_pagediv .current').html()
    if ($('.sort-icon.up').length > 0) {
        var sort = $('.sort-icon.up').parents('th').attr('name')
        var order = 'desc'
    }
    if ($('.sort-icon.down').length > 0) {
        var sort = $('.sort-icon.down').parents('th').attr('name')
        var order = 'asc'
    }
    if (sort) {
        filterquery.sort = sort
        filterquery.order = order
    }
    setTimeout(function () {
        jQuery.ajax({
            async: true, cache: false, dataType: "json",
            error: function (request, textStatus, errorThrown) {
                errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "<").replace(/>/g, "&gt;");
            },
            data: filterquery,
            type: "GET",
            url: "/apps/CommandProcessor.ashx?cmd=file.files.search&folderid=" + folderId + '&srchType=' + searchType+ '&pageSize=20' + '&pageNumber=' + pageNumber,
            success: function (data, textStatus) {
                //console.log(data);
                renderGrid(data);
                if (extSrch != 0) {
                    createpage(data.total, pageNumber)
                } else {
                    $(".zxf_pagediv").html('<div class="page-container"></div>')
                }
                setTimeout(function () {
                    layer.close(popup);
                }, 200)
            }
        })
    }, 0)
    
}

var getExplorer = (function () {
    var explorer = window.navigator.userAgent,
        compare = function (s) { return (explorer.indexOf(s) >= 0); },
        ie11 = (function () { return ("ActiveXObject" in window) })();
    if (compare("MSIE") || ie11) { return 'ie'; }
    else if (compare("Firefox") && !ie11) { return 'Firefox'; }
    else if (compare("Chrome") && !ie11) {
        if (explorer.indexOf("Edge") > -1) {
            return 'Edge';
        } else {
            return 'Chrome';
        }
    }
    else if (compare("Opera") && !ie11) { return 'Opera'; }
    else if (compare("Safari") && !ie11) { return 'Safari'; }

})()
if (getExplorer == 'ie') {
    //alert('当前浏览器内核为IE内核，请使用非IE内核浏览器！');
    $('.SelectSearch').css('width', '99%');
    $('#contentWrapper').css('height', '100% ');
    $('.bodyDivs').css('height', '100% ');
    $('.uiOutputText').css('right', '-11px');
    $('#bodyTable').css('height', '100% ');
    $('.centerRegiona').css('height', '100% ');
}
if (getExplorer == 'Edge') {
    //alert('当前浏览器为Edge，请使用非IE内核浏览器！');
}

function uploadFile() {

    var folderId = document.getElementById("currentFolder").value;

    if (folderId == "") {

    }
    openPopup('/workspaces/Fileupload.aspx?pid=' + folderId + '&type=100100&objectTypeCode=100100&', 'file', 450, 450, 'width=450,height=450,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
}
function downloadFile(fileId) {
    window.open("/apps/files/FileDownload.aspx?objectTypeCode=100100&filesource=100100&id=" + fileId, "DownloadFile", null, true);
}
function viewFile(fileId) {
    //console.log(fileId)
    var url = "/apps/files/FileViewer.aspx?objectTypeCode=100100&filesource=100100&id=" + fileId;
    openPopupFocusEscapePounds(url, '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);
}

function getAutoHeight() {
    var x = 0, y = 0;
    if (self.innerHeight) // all except Explorer
    {
        x = self.innerWidth;
        y = self.innerHeight;
    }
    else if (document.documentElement && document.documentElement.clientHeight)
        // Explorer 6 Strict Mode
    {
        x = document.documentElement.clientWidth;
        y = document.documentElement.clientHeight;
    }
    else if (document.body) // other Explorers
    {
        x = document.body.clientWidth;
        y = document.body.clientHeight;
    }
    return y;
}

//文件权限
function changefilequanxian(id, filename) {
    $('.popup-mask').show()
    $('#iframe').show().attr('src', '/alert/folderquanxian_ie8.html?id=' + id + '&type=file&filename=' + filename).height(480).css('margin-top', '-240px')
}
function filersort(id, folderid, type, number, length) {
    if ($('.slds-is-actives').attr('id')) {
        number = Number(number)
        if (type == 'up') {
            if (number != 1) {
                ajaxMethodGetData('file.position.set', { Id: id, position: number, type:0 }, function (data) {
                    if (data.status == 1) {
                        refreshGrid()
                    } else {
                        layer.msg(data.msg);

                    }
                })
            } else {
                layer.msg('已经是第一个了');
            }
        } else if (type = 'down') {
            if (number != length) {
                ajaxMethodGetData('file.position.set', { Id: id, position: number, type: 1 }, function (data) {
                    if (data.status == 1) {
                        refreshGrid()
                    } else {
                        layer.msg(data.msg);
                    }
                })
            } else {
                layer.msg('已经是最后一个了');
            }
        }
        refreshGrid()
    } else {
        error('此文件夹无法排序')
    }
}
function choosepeople(name) {
    opencenterwindow('/_ui/common/data/UserLookResult.aspx?type=relatedchhoose&lknm=' + name, '', 1150, 600)
}
function choosePeople(name) {
    opencenterwindow('/_ui/common/data/UserLookResult.aspx?type=relatedchhoose&lknm=' + name, '', 1150, 600)
}
function chooselookup(objtypecode, name, title, search) {
    $('#iframe').show().attr('src', '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=' + title + '&search=' + search).height(640).css('margin-top', '-320px')
    $('.popup-mask').show()
}
function lookupPick(formName, controlName, controlName2, null1, valId, valName) {
    $('[name="' + controlName2 + '"]').attr('layvalue', valId)
    $('[name="' + controlName2 + '"]').attr('value', valId)
    $('[name="' + controlName2 + '"]').next().find('input').val(valName)

    //lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id)
}
function choosedept(name) {
    opencenterwindow('/alert/deptchose_form.html?type=relatedchhoose&lknm=' + name, '', 750, 520)
}
function chooseDept(name) {
    opencenterwindow('/alert/deptchose_form.html?type=relatedchhoose&lknm=' + name, '', 750, 520)
}
function lookupPickdept(id, label, name) {
    $('[name="' + name + '"]').attr('layvalue', id)
    $('[name="' + name + '"]').attr('value', id)
    $('[name="' + name + '"]').next().find('input').val(label)

    //lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id)
}