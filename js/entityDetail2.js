function shareIframeImg(i) {
    var img = $(i.contentWindow.document).find("img")
    img.width("100%")
    img.css("max-width", "100%")
}

function entityAttachment() {

}
entityAttachment.prototype.refresh = function () {
    //btnUploadfile
}
entityAttachment.prototype.load = function () {
    var pid = getQueryString("id");
    var objTypeCode = getQueryString('objectTypeCode')
    var d = { ObjectTypeCode: objTypeCode };
    ajaxMethodGetData("attachment.category.getlist", d, this.renderList2);
   
    var d = { id: pid };
    ajaxMethodGetData("file.attachment.getlist", d, this.renderList);
    $('#downfile-all').remove()
    $('#btnUploadfile').prev().append('<img id="downfile-all" style="cursor:pointer;margin-left:5px;height:18px;line-height:2.25;margin-top:8px;"  title="下载全部" src="/img/images/down.png"></img>')

}
function deletefileclass(id){
    $('.selectlist.selectlistcheck').hide()
    $('#changeDiv').show()
    $('#iframe').show().attr('src', '/alert/delete.html?id=' + id + '&type=fileclass')
}
entityAttachment.prototype.renderList2 = function (data) {
    
    $('.missionright-file-type li').not('.rellist').remove();
    $('.missionright-body3>ul').not('.norellist').remove();
    $('.norellist li').remove();
    if(data.returnValue)
    {
        for (var i = 0; i < data.returnValue.records.length; i++) {
            var res = data.returnValue.records[i]
            var name = res.Name
            var itemid = res.ItemId
            $('.missionright-file-type li.newfileclass').before('<li style="position:relative" itemid="' + itemid + '">' + name + '<img onclick=deletefileclass("'+itemid+'") style="height:14px;width:14px;position:absolute;cursor:pointer;right:15px;" src="/img/cal/delete.png" /></li>')
            $('.missionright-body3').append('<ul pitemid="' + itemid + '"><div class="fileclass-head active"><span>' + name + '</span><img src="/img/cal/add1.png" class="btnUploadfile"/></div></ul>')
        }
    }
    $('.buttonbtn.shituu').click(function () {
        $(this).find('.selectlist.selectlistcheck').show()
        return false;
    })
    $(document).click(function () {
        $('.selectlist').hide()

    })
    $('.missionright-body3 .selectlistcheck li img').click(function () {
        return false;
    })
    $('.missionright-body3 .selectlistcheck li').not('.newfileclass').click(function () {
        $(this).parents('.selectbuttonbtn').find('span').html($(this).text())
        $(this).parents('.selectbuttonbtn').attr('itemid', $(this).attr('itemid'))
        $(this).parent().find('li').removeClass('active')
        $(this).addClass('active')
        $('.selectlist').hide()
        if ($(this).hasClass('rellist')) {
            $('.missionright-body3>ul').show()
        } else {
            $('.missionright-body3>ul').hide()
            $('.missionright-body3>ul[pitemid="' + $(this).attr('itemid') + '"]').show()

        }
        return false;
    })
    $(".btnUploadfile").click(function () {
        //setLastMousePosition(event);
        var pid = getQueryString("id");
        var entityCode = "800";
        var type = "1010";
        var CategoryName = $(this).prev().html()
        if (CategoryName == '其他') {
            CategoryName = ''
        }
        openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
    });
}
entityAttachment.prototype.renderList = function (data) {
    console.log(data)
    //输出附件列表
    var datas = data&&data.listData&&data.listData[0]?data.listData[0]:[]
    //console.log(datas)
    $(".region-sidebar-right .right_top_title").eq(0).html("附件(" + datas.length + ")")

    for (var i = 0; i < datas.length; i++) {
        var files = datas[i]
        var id = files.Id;
        var filesname = files.Name;
        var filescreatedon = files.CreatedOn;
        var filesize = files.FileSize;
        filesize = filesize / 1024;
        filesize += "";
        filesize = filesize.substring(0, 5);
        var chakan = "";
        var xiazai = "";
        var FileExtension = files.FileExtension;
        var imgsrc = "";
        var ViewLinkUrl = files.ViewLinkUrl;
        var DownloadLinkUrl = files.DownloadLinkUrl;
        var EditLinkUrl = files.EditLinkUrl;
        var CategoryName = files.CategoryName;
        var canDelete = files.Privilege ? files.Privilege.canDelete : true;
        var canDownload = files.Privilege ? files.Privilege.canDownload : true;
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
        if (CategoryName == '') {
            $('.norellist').append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        + '<div class="sanjiao">'
                                        + '<img src="/img/cal/20.PNG" /></div>'
                                        + '<div class="div1">'
                                        + '<p class="name" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">'
                                        + '<span>' + filesname + '</span>'
                                        + '</p>'
                                        + '<p class="jieshao">'
                                        + '<span class="chakan">' + chakan + '查看&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        + '</p>'
                                        + '</div>'
                                        + '</li>')
        } else {
            $(".missionright-body3>ul").each(function (index) {
                if (CategoryName == $(this).find('span').html()) {
                    $(this).append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        + '<div class="sanjiao">'
                                        + '<img src="/img/cal/20.PNG" /></div>'
                                        + '<div class="div1">'
                                        + '<p class="name" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">'
                                        + '<span>' + filesname + '</span>'
                                        + '</p>'
                                        + '<p class="jieshao">'
                                        + '<span class="chakan">' + chakan + '查看&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        + '</p>'
                                        + '</div>'
                                        + '</li>')
                }
                if (index == $(".missionright-body3>ul").length - 1) {
                    if ($('#' + id).length == 0) {
                        $('.norellist').append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        + '<div class="sanjiao">'
                                        + '<img src="/img/cal/20.PNG" /></div>'
                                        + '<div class="div1">'
                                        + '<p class="name" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">'
                                        + '<span>' + filesname + '</span>'
                                        + '</p>'
                                        + '<p class="jieshao">'
                                        + '<span class="chakan">' + chakan + '查看&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        + '</p>'
                                        + '</div>'
                                        + '</li>')
                    }

                }
            })
        }
        if (FileExtension != "zip") {
            $(".missionright-body3 .name").eq(i).click(function () {
                $(".edit-btn").hide()
                $(".file-preview").find("iframe").height("89%")
                $(".file-preview-edit").hide()
                $(".file-preview").show()
                $(".file-preview").find(".file-preview-name span").html($(this).find("span").html())
                $(".file-preview").find(".file-preview-download").attr("src", $(this).attr("DownloadLinkUrl"))
                $(".file-preview").find(".file-preview-edit").attr("src", $(this).attr("EditLinkUrl"))
                $(".file-preview").find(".file-preview-type img").prop("src", $(this).parent().prev().prev().prop("src"))
                $(".file-preview").find("iframe").prop("src", $(this).attr("ViewLinkUrl"))
                $("body").css("overflow", "hidden")
                if ($(this).attr("EditLinkUrl") != 0 && $(this).attr("EditLinkUrl")) {
                    $(".file-preview-edit").show()
                }
                return false
            })
        }
    }
    $('.fileclass-head').click(function () {
        $(this).toggleClass('active')
        $(this).parent().find('li').toggle()
    })
    $(".file-preview-head-right").click(function () {
        $(".file-preview").hide()
        $("body").css("overflow", "visible")
    })
    //文件下载
    $(".file-preview-download").click(function () {
        var url = $(this).attr("src")
        window.open(url);
    })
    $(".missionright-body3 .sanjiao").each(function () {
        $(this).click(function () {
            if ($(".missionright-body3 .miss-bianji").length != 0) {
                $(".missionright-body3 .miss-bianji").remove()
            } else {
                var canDelete = $(this).parents("li").attr("canDelete")
                if (canDelete == 'true') {
                    $(this).append(
                     '<div class="miss-bianji miss-bianji2">'
                     + '<div class="miss-bianji1">详情</div>'
                     + '<div>删除</div>'
                     + '<div>标记分类</div>'
                     + '</div>'
                 )
                }
                else {
                    $(this).append(
                    '<div class="miss-bianji miss-bianji2">'
                    + '<div class="miss-bianji1">详情</div>'
                    + '<div>标记分类</div>'
                    + '</div>'
                )
                }
                
                var id = $(this).parents("li").attr("id")
                $(".missionright-body3 .miss-bianji2 div").eq(0).click(function () {
                    window.location = "/files/filedetail.aspx?id=" + id
                })
                //附件删除
                $('.missionright-body3 .miss-bianji2 div').eq(1).click(function () {
                    var id = $(this).parents('li').attr('id')
                    $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&type=filedelete').show()
                    $('#changeDiv').show()
                })
                $('.missionright-body3 .miss-bianji2 div').eq(2).click(function () {
                    var objTypeCode = $("#related-objTypeCode").val()
                    if (!objTypeCode) {
                        objTypeCode = getQueryString('objectTypeCode')
                    }
                    var id = $(this).parents('li').attr('id')
                    $('#iframe').attr('src', '/alert/fileclass.html?id=' + id + '&ObjectTypeCode=' + objTypeCode).show()
                    $('#changeDiv').show()
                })
            }
            $(document).mouseup(function (e) {
                if ($(e.target).parents(".sanjiao").length == 0) {
                    $(".missionright-body3 .miss-bianji").remove();
                }
            })
            return false
        })
    })
}
function processDetail(data)
{

}
function renovate() {
    var entityAttachmentList = new entityAttachment();
    entityAttachmentList.load();
}
jQuery(document).ready(function () {
    var entityId = getQueryString("id");
    var entityCode = "800";
    try
    {
        // debugger;
        var t = document.getElementById("entityType");
        if(t)
        { 
            entityType = t.value;
            entityCode = entityType;
        }
        else
        {    t="";
        }

        ajaxMethodGetData2("entity.detail.get", {id:entityId,entityType:entityType}, processDetail);
    }
    catch(e)
    {
    
    }
   
});
//上传文件
var url = parent.window.location.href;
if (url.indexOf("id=") != -1) {
    var id = url.split("id=")[1]
    if (id.indexOf("&") != -1) {
        id = id.split("&")[0];
    }
    $("#pid").val(id);
}
$(".send input[type='file']").each(function () {
    $(this).change(function (e) {
        //console.log(111)
        $('#iframe').attr('src', '/alert/uploadfile.html');
        $('#changeDiv').show();
        var that = this
        setTimeout(function () {
            btnUploadFile(e);
        },500)
    })
})
function btnUploadFile(e) {
    function callback(data) {
        //console.log(data)
    }
    var url = rootUrl + "&cmd=" + "attachment.upload";
    var file = e.target.files[0];
    var formData = new FormData();
    var pid = getQueryString("id");
    formData.append('file', file);
    formData.append('pid', pid);
    $.ajax({
        url: url,
        type: 'POST',
        xhr: function () {
            var xhr = new XMLHttpRequest();
            xhr.upload.onprogress = progressHandlingFunction
            return xhr;
        },
        cache: false,
        data: formData,
        processData: false,
        contentType: false,
        dataType: "json",
        success: function (res) {
            //console.log(res)
        },
        error: function (err) {
            //console.log(err)
        }
    })
}
function progressHandlingFunction(e) {
    if (e.lengthComputable) {
        console.log(e)
        var percent = e.loaded / e.total * 100;
        $('#iframe').contents().find(".schedule-inside").width(percent + "%")
        if (percent == 100) {            
            $('#iframe').contents().find(".uoloadfile-file-right-sign").css("background", 'url("/img/images/04.0.Tick_1.png") no-repeat center').css("background-size","16px")
        }
    }
}
function ajaxMethodGetData2(method, d, callback) {
    var url = rootUrl + "&cmd=" + method;
    //url += queryString;
    jQuery.ajax({
        async: false, cache: false,
        data: d,
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            if (callback)
                callback(data);
        },
        type: "GET",
        url: url
    });
}
//请求列表
function newrelated(){
    entityAttachment.prototype.relatedgetlist()
}

entityAttachment.prototype.relatedgetlist = function () {
    var ContractId="";
    function callback(data) {
        if ($('#RelatedListBlock').length > 0) {
            $(".related-item").remove()
            $("#RelatedListBlock .slds-tabs_card").remove()
            //console.log(data)
            var data = JSON.parse(data);
            //console.log(data)
            //debugger;
            if (!data.relatedList) return;
            for (var i = 0; i < data.relatedList.length; i++) {
                //输出表格
                var datas = data.relatedList[i];
                var label = datas.label;
                var listlabel = datas.label;
                //$("#RelatedListBlock").append(`<div class="related-item">

                //                                <div class="related-item-body">
                //                                    <ul>
                //                                        <li class="related-list-head"></li>
                //                                    </ul>
                //                                </div>
                //                            </div>`)
                $("#RelatedListBlock").append(`<div class="slds-tabs_card" style="padding: 0;">
                                                                            <div class="right_top">
                                                                                <div class="slds-media__figure" data-aura-rendered-by="1213:0">
                                                                                    <div class="extraSmall forceEntityIcon" style="background-color: #b19f7e">
                                                                                        <span  class="uiImage">
                                                                                            <img  src="/css/themes/lightning/images/file_120.png">
                                                                                        </span>
                                                                                    </div>
                                                                                </div>
                                                                                <h2 class="right_top_title">`+ label + `(` + datas.relatedList.listData.length + `)</h2>
                                                                            </div>
                                                                            <div class="right_select">
                                                                                <div class="centerRegiona" style="height: calc(100% - 0px); overflow: hidden;">
                                                                                    <div class="centerRegionab">
                                                                                        <div class="detailsOuter allow-horizontal-form runtime_sales_activitiesTaskDetails inlineEditEnabled">
                                                                                            <div class="details" style="margin: 0;">
                                                                                                <div style="height: 100%;" id="processList">
                                                                                                    <div class="slds-grid listDisplays safari-workaround-anchor">
                                                                                                        <div class="slds-grid listViewContainer" style="width: 100%;">
                                                                                                            <div class="slds-col slds-no-space forceListViewManagerPrimaryDisplayManager">
                                                                                                                <div class="forceListViewManagerGrid">
                                                                                                                    <div class="listViewContent slds-table--header-fixed_container">
                                                                                                                        <div class="uiScroller scroller-wrapper scroll-bidirectional native">
                                                                                                                            <div class="scroller actionBarPlugin" style="min-width: 100%; height: 100%;">
                                                                                                                                <div class="slds-table--edit_container slds-is-relative  inlineEdit--enabled keyboardMode--inactive inlineEditGrid forceInlineEditGrid" style="position: static;">
                                                                                                                                    <table class="slds-table forceRecordLayout slds-table--header-fixed slds-table--edit slds-table--bordered resizable-cols slds-table--resizable-cols uiVirtualDataTable slds-no-cell-focus">
                                                                                                                                       <thead>
                                                                                                                                          <tr></tr>
                                                                                                                                       </thead>
                                                                                                                                    <tbody>
                                                                                                                                    </tbody>
                                                                                                                                    </table>
                                                                                                                                </div>
                                                                                                                            </div>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                </div>
                                                                                                            </div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>

                                                                                </div>
                                                                                <div class="clear"></div>
                                                                            </div>
                                                                            <div class="second_bottom">
                                                                                <a href="/apps/LineItemslst.aspx">查看全部</a>
                                                                            </div>
                                                                        </div>`)

                var res = data.relatedList[i].relatedList
                var shownColumns = res.shownColumns
                var listData = res.listData
                $(".second_bottom").eq(i).hide()
                if (listData.length > 0) {
                    $(".second_bottom").eq(i).show()
                    for (var j = 0; j < shownColumns.length; j++) {
                        //输出头部
                        var shown = shownColumns[j]
                        var label = shown.label
                        $("#RelatedListBlock").find("thead").eq(i).find("tr").append(`
                        <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable" style="width: 50%;">
                            <div class="slds-cell-fixed">
                                <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                    <span class="slds-truncate" style="color: rgb(81, 79, 77);">`+ label + `</span>
                                    <i class="iconfont icon-jiantou1" style="display: none;"></i>
                                </a>
                            </div>
                        </th>`)
                    }
                    $("#RelatedListBlock").find("thead").eq(i).find("tr").append(`
                    <th class="initialSortAsc sortable  slds-is-sortable  slds-is-resizable" style="width: 50%;">
                            <div class="slds-cell-fixed">
                                <a href="javascript:;" class="toggle slds-th__action slds-text-link--reset ">
                                    <span class="slds-truncate" style="color: rgb(81, 79, 77);">操作</span>
                                    <i class="iconfont icon-jiantou1" style="display: none;"></i>
                                </a>
                            </div>
                        </th>`)
                }

                //$(".related-list-head").each(function(){
                //    //宽度调整
                //    $(this).parent().width($(this).find("div").length*120+20)
                //    if($(this).parent().width()<$(document).width()*0.7){
                //        $(this).parent().width("100%")
                //    }
                //})


                for (var k = 0; k < listData.length; k++) {
                    //输出表体
                    var list = listData[k]

                    $("#RelatedListBlock").find("tbody").eq(i).append(`<tr objtype=` + listlabel + ` class="dataRow even" id="` + list.LIST_RECORD_ID + `"></tr>`)
                    for (var item in list) {
                        if (item != 'LIST_RECORD_ID') {
                            $("#RelatedListBlock").find("tbody").eq(i).find("tr").eq(k).append(`
                        <td class="dataCell">`+ list[item] + `</td>`)
                        }
                    }
                    $("#RelatedListBlock").find("tbody").eq(i).find("tr").eq(k).append(`
                         <td class="dataCell"><div class="sanjiao">
                         <img src="/img/cal/20.PNG">

                         </div></td>`)
                         }
                var id = ''
                var objtype = ''
                var that
                $('#RelatedListBlock .sanjiao').off()
                $('#RelatedListBlock .sanjiao').click(function () {
                    that = this
                    id = $(this).parents('tr').attr('id')
                    objtype = $(this).parents('tr').attr('objtype')
                    var top = $(this).offset().top + 25
                    var left = $(this).offset().left - 78
                    $('.miss-bianji3').show()
                    $('.miss-bianji3').css({
                        top: top,
                        left: left
                    })
                    $('body>.miss-bianji3 .miss-bianji1').off()
                    $('body>.miss-bianji3 .miss-bianji1').click(function () {
                        editiem(id, objtype)
                        return false
                    })
                    $('body>.miss-bianji3 .file-delete').off()
                    $('body>.miss-bianji3 .file-delete').click(function () {
                        deleteitem(id, objtype)
                        return false
                    })
                    return false
                })

                $(document).click(function () {
                    $('.miss-bianji').hide()
                })
                for (var l = 0; l < res.entityButtons.length; l++) {
                    //创建按钮
                    var entityButtons = res.entityButtons[l];
                    var title = entityButtons.title
                    var onClick = entityButtons.onClick.split("(")[0]
                    var objtype = entityButtons.onClick.split(",")[1].split(")")[0]
                    var id = entityButtons.onClick.split("',")[0].split("'")[1]
                    $("#RelatedListBlock .right_top_title").eq(i).after(`<li onclick=` + entityButtons.onClick + ` class="btns newbtns btn-default Btn hove peoples  slds-button slds-button--neutral " style="border-radius: .25rem;float:right;">
                                                                                    <a href="javascript:;">
                                                                                        <div class="slds-truncate">
                                                                                            `+ title + `
                                                                                        </div>
                                                                                    </a>
                                                                                </li>`)
                }
            }
        }
        
    }
    $('body').append(`<div class="miss-bianji miss-bianji3" style='display:none'><div class="miss-bianji1" >编辑</div><div class="file-delete">删除</div></div>`)
    
    var pid = getQueryString("id");
    var objTypeCode = $("#related-objTypeCode").val()
    var d = {
                id: pid,
                objTypeCode:objTypeCode
            };
    ajaxMethodGetData2("entity.related.getlist", d, callback);
    }
function editiem(id, obj) {
    $('.miss-bianji').hide()
    $('#changeDiv').show()
    if (obj == '人员规则') {
        var evaluationId = getQueryString("id");
        $('#iframe').attr('src', '/alert/evaluation/eval_EmployeeRule.html?evaluationId=' + evaluationId + '&id=' + id)
    } else if (obj == '备注') {
        $('#iframe').attr('src', '/alert/editnotes.html?id=' + id)
    }else if (obj == '岗位职责') {
        var parentid = getQueryString('id')
        $('#iframe').attr('src', '/alert/gangweizhize.html?parentid='+parentid+'&id=' + id)
    }else if (obj == '奖励情况') {
        var parentid = getQueryString('id')
        $('#iframe').attr('src', '/alert/emp/reward_edit.html?id=' + id)
    }else if (obj == '考评结果规则') {
       var id = getQueryString('id')
       var weidu = $('tr[objtype="考评维度"]')
        if(weidu.length==0){
            error('请先添加考评纬度')
        }else{
            var weiduname = []
            for (var i = 0; i < weidu.length; i++) {
                 weiduname.push($(weidu[i]).find('td a').eq(0).attr('title'))
            }
            weiduname = weiduname.join(',')
            $('#changeDiv').show()
            var id = getQueryString('id')
            $('#iframe').attr('src', '/alert/evaluation/eval_addresultule2.html?EvaluationId='+ id+'&weidu='+weiduname)
        }
    }else if (obj == '考评维度') {
        var id = getQueryString('id')
        $('#iframe').attr('src', '/alert/evaluation/Dimension_eval_edit.html?id='+ id)
    }
    }
function deleteitem(id, obj) {
    $('.miss-bianji').hide()
    $('#changeDiv').show()
    if (obj == '人员规则') {
        var objtype = "确定要删除该规则吗？"
        $('#iframe').attr('src', '/alert/new-delete.html?objtype=' + objtype + '&id=' + id)
    } else if (obj == '备注') {
        $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&type=20392')
    } else if (obj == '考评维度') {
                $('#iframe').attr('src', '/alert/evaluation/Dimension_eval_edit.html?id='+ id)
    }else if (obj == '岗位职责') {
        $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&type=30013')
    }else if (obj == '考评结果规则') {
        var id = getQueryString('id')
        $('#iframe').attr('src', '/alert/evaluation/eval_addresultule2.html?EvaluationId='+ id)
    }
    }
function addRelatedItem(id, objtype) {
    if (objtype == 30240) {
        $('#changeDiv').show()
        $('#iframe').attr('src', '/alert/evaluation/eval_EmployeeRule.html')
    } else if (objtype == 20392) {
        $('#changeDiv').show()
        $('#iframe').attr('src', '/alert/editnotes.html')
    }else if (objtype == 30028) {
        $('#changeDiv').show()
        $('#iframe').attr('src', '/alert/emp/reward_edit.html')
    }
    else if (objtype == 30244) {
        var weidu = $('tr[objtype="考评维度"]')
        if(weidu.length==0){
            error('请先添加考评纬度')
        }else{
            var weiduname = []
            for (var i = 0; i < weidu.length; i++) {
                 weiduname.push($(weidu[i]).find('td a').eq(0).attr('title'))
            }
            weiduname = weiduname.join(',')
            $('#changeDiv').show()
            var id = getQueryString('id')
            $('#iframe').attr('src', '/alert/evaluation/eval_addresultule2.html?EvaluationId='+ id+'&weidu='+weiduname)
        }
        
    }
    else if (objtype == 30246) {
        $('#changeDiv').show()
        $('#iframe').attr('src', '/alert/evaluation/Dimension_eval_edit.html?id='+id)
    }
    else if(objtype==1012){
        $(".popup-contplan").show()
        $(".popup-mask").show()
        $('input[type="date"]').parent().css("width","150px")
        $(".popup-contplan").find(".save").click(function(){
            for (var i = 0; i < $(".popup-contplan").find(".related-list-head").siblings().length; i++) {
                $(".popup-contplan").find(".red").each(function(){
                    if($(this).next().val().length==0){
                        $(this).next().css("border-color","red")
                        $(".popup-contplan").find(".save").removeClass("active")
                        return false
                    }else{
                        $(this).next().css("border-color","#e6e6e6")
                        $(".popup-contplan").find(".save").addClass("active")
                    }
                })
                    if($(this).hasClass("active")){
                        var Name =  $(".popup-contplan").find("li").eq(i+1).find("input").eq(0).val()
                var Amount = $(".popup-contplan").find("li").eq(i+1).find("input").eq(1).val()
                var Rate = $(".popup-contplan").find("li").eq(i+1).find("input").eq(2).val()
                var PlayPayOn = $(".popup-contplan").find("li").eq(i+1).find("input").eq(3).val()
                var d = {
                                objTypeCode:objtype,
                                ContractId:id,
                                Name:Name,
                                Amount:Amount,
                                Rate:Rate,
                                PlayPayOn:PlayPayOn
                            }
                function callback(data){
                    // console.log(data)                    
                }
                ajaxMethodPostData("ui.form.save", d, callback);   
                    }
            }
                $(".popup-contplan").find("input").val("")
                $(".popup-contplan").hide()
                $(".popup-mask").hide()
                entityAttachment.prototype.relatedgetlist()
        })
    }else if(objtype==10182){
        $(".popup-contpay").show()
        $(".popup-mask").show()
    }else if(objtype==30013){
        
    $('#changeDiv').show()
    $('#iframe').attr('src', '/alert/gangweizhize.html?parentid='+id)
    }
    }



$("#remarksalert").click(function(){
    $('#iframe').attr('src', '/alert/editnotes.html');
    $('#changeDiv').show();
    })
$("#morebtn").click(function(){
    $(".remarkList").show();
    return false
    })
$(document).click(function(){
    $(".remarkList").hide();
    
})
$(".iconfont.icon-arrow_down_full").click(function(){
    $(".remarkList").show();
    return false
    })
$("#list").click(function(){
    $(".remarkList").show();
    return false
})

    jQuery(document).ready(function () {
        $('.newfileclass').click(function () {
            $('.selectlist').hide()
            $('#iframe').attr('src', '/alert/new_fileclass.html');
            $('#changeDiv').show();
            $('#iframe').show();
            return false
        })
        entityAttachmentList = new entityAttachment();
        entityAttachmentList.load();
        entityAttachmentList.relatedgetlist()
        $("#btnUploadfile").click(function () {
            //setLastMousePosition(event);
            var pid = getQueryString("id");
            var entityCode = "800";
            var type = "1010";
            var CategoryName = $('.missionright-file-type .shituu span').html()
            if (CategoryName == '全部') {
                CategoryName = ''
            }
            openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        });
    });
        var id = getQueryString("id");
        $('.second_bottom a').eq(0).click(function () {
            var name = $('.navItem.slds-context-bar__item.slds-shrink-none.slds-is-active').find('span').html()
            var id = getQueryString("id");
            var objTypeCode = $(this).attr('objTypeCode')
            window.location = '/apps/LineItemslst.aspx?id=' + id + '&objTypeCode=' + objTypeCode+'&name='+name

        })
        $('.missionright-file-type').click(function () {
            entityAttachmentList.load()
        })
