function shareIframeImg(i) {
    var img = $(i.contentWindow.document).find("img")
    img.width("100%")
    img.css("max-width","100%")  
}

function entityAttachment()
{
    this.category=true
}
entityAttachment.prototype.refresh = function ()
{
    //btnUploadfile
}
entityAttachment.prototype.load = function ()
{
    var pid = getQueryString("id");
    function callback(data){
        //console.log(data)
    }
    var d = { ObjectTypeCode: 1010};
    if(window.obj){
        d.ObjectTypeCode=window.obj.ObjectTypeCode
    }
    if (this.category) {
        $('#downfile-all').remove()
        $('#btnUploadfile').before('<img id="downfile-all" class="canDownload" style="cursor:pointer;margin-left:5px;height:18px;"  title="下载全部" src="/img/images/down.png"></img>')
        $('#downfile-all').click(function () {
            window.open('/apps/CommandProcessor.ashx?c=1&cmd=file.attachment.downloadall&parentId=' + pid)
        })
        $('body').append('<style>.canDownload{display:none;}</style>')
        ajaxMethodGetAsyncData("attachment.category.getlist", d, false, this.renderList2);
    } else {
        $('.missionright-file-type .buttonbtn.shituu.selectbuttonbtn').attr('style', 'pointer-events:none')
    }
    
    var d = { id: pid };
    ajaxMethodGetAsyncData("file.attachment.getlist", d,false, this.renderList);
}
entityAttachment.prototype.renderList2 = function (data){
    //console.log(data)
    $('.missionright-file-type li').not('.rellist').remove()
    $('.missionright-body3>ul').not('.norellist').remove()
    $('.norellist li').remove()
    for (var i = 0; i < data.returnValue.records.length; i++) {
        var res = data.returnValue.records[i]
        var name = res.Name
        var itemid = res.ItemId
        $('.missionright-file-type li.newfileclass').before('<li itemid="' + itemid + '">' + name + '<img class="deletefileclass" style="width:14px;height:14px;float:right;margin-top:8px;" src="/img/cal/23.111(18x18)_1.png"><img class="editfileclass" onclick=editfileclass("' + itemid + '","' + name + '") style="height:14px;width:14px;float:right;margin-top:8px;margin-right:15px;" src="/img/cal/12.edit_1(14x14).png" /></li>')
        $('.missionright-file-type').after('<ul pitemid="' + itemid + '"><div class="fileclass-head active"><span>' + name + '</span><img  style="width:16px;float:right;margin-top:8px;margin-right:10px;" src="/img/cal/add.png"></img></div></ul>')
    }
    $('.deletefileclass').click(function () {
        $('#changeDiv').show()
        $('.popup-mask').show()
        $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + $(this).parent().attr('itemid') + '&objTypeCode=附件分类').show().height(280).css('margin-top', '-200px')
        $('.selectlist.selectlistcheck').hide()
        stopPropagation()
        return false;
    })
    $('.fileclass-head img').click(function () {
        var pid = getQueryString("id");
        var CategoryName = $(this).prev().html()
        $('#CategoryName').val(CategoryName)
        var entityCode = "800";
        var type = "1010";
        //if (typeof FormData != 'undefined') {
        //    $('#fileinput').trigger('click')
        //} else {
        //    openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        //}
         openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);

        return false
    })
    $('.buttonbtn.shituu').click(function () {
        $(this).find('.selectlist.selectlistcheck').show()
        return false;
    })
    $(document).click(function () {
        $('.buttonbtn.shituu').find('.selectlist.selectlistcheck').hide()

    })
    $('.missionright-body3 .selectlistcheck li').not('.newfileclass').click(function(){
        $(this).parents('.selectbuttonbtn').find('span').html($(this).html())
        $(this).parents('.selectbuttonbtn').attr('itemid',$(this).attr('itemid'))
        $(this).parent().find('li').removeClass('active')
        $(this).addClass('active')
        $('.selectlist').hide()
        if($(this).hasClass('rellist')){
            $('.missionright-body3>ul').show()
        }else{
            $('.missionright-body3>ul').hide()
            $('.missionright-body3>ul[pitemid="'+$(this).attr('itemid')+'"]').show()
        }
        return false;
    })
}
entityAttachment.prototype.renderList = function (data){
    //console.log(data)
    //输出附件列表
    var datas = data && data.listData ? data.listData : [];
    //console.log(datas)
    //$(".missionright-body3 .missionright-head span").eq(1).html("(" + datas.length + ")")
    var filecount = datas.length ? datas.length : 0;
    $("#filecount").html("(" + filecount + ")")
    $(".missionright-body3 .missionright-head span").eq(1).html("(" + filecount + ")")
    $(".region-sidebar-right .right_top_title").eq(0).html("附件(" + (datas.length || 0) + ")")
    for (var i = 0; i < datas.length; i++) {
        var files = datas[i]
        var id = files.Id;
        var filesname = files.Name;
        var filescreatedon = files.CreatedOn;
        var filesize = files.FileSize;
        filesize = filesize / 1024;
        filesize+="";
        filesize = filesize.substring(0, 5);
        var chakan = "";
        var xiazai = "";
        var FileExtension = files.FileExtension;
        var imgsrc="";
        var ViewLinkUrl = files.ViewLinkUrl;
        var DownloadLinkUrl = files.DownloadLinkUrl;
        var EditLinkUrl = files.EditLinkUrl;
        var CategoryName = files.CategoryName;
        var canDelete = files.Privilege ? files.Privilege.canDelete : true;
        var canDownload = files.Privilege ? files.Privilege.canDownload : true;
        if (canDownload == true) {
            $('body').append('<style>.canDownload' + i + '{display:inline-block;}')
        } else {
            $('body').append('<style>.canDownload' + i + '{display:none;}')
        }
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
        }else if (FileExtension == "txt") {
            imgsrc = "/img/filetype/Folder.png"
        }
        else if (FileExtension == "pdf") {
            imgsrc = "/img/filetype/Pdf.png"
        } else {
            imgsrc = "/img/filetype/Folder.png"
        }
        if(CategoryName==''){
            $('.norellist').append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        +'<div class="sanjiao">'
                                        +'<img src="/img/cal/20.PNG" /></div>'
                                        +'<div class="div1">'
                                        + '<p class="name" onclick=filedetail("' + id + '")>'
                                        +'<span>'+filesname+'</span>'
                                        +'</p>'
                                        +'<p class="jieshao">'
                                        + '<span style="cursor:pointer;" class="name chakan" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '" >' + chakan + '查看&nbsp;&nbsp;</span>&nbsp;&nbsp;'
                                        + '<span class="canDownload' + i + '"><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        +'</p>'
                                        +'</div>'
                                        + '</li>')
        }else{
            $(".missionright-body3>ul").each(function(index){
                if(CategoryName==$(this).find('span').html()){
                    $(this).append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        +'<div class="sanjiao">'
                                        +'<img src="/img/cal/20.PNG" /></div>'
                                        +'<div class="div1">'
                                        + '<p class="name" onclick=filedetail("' + id + '")>'
                                        +'<span>'+filesname+'</span>'
                                        +'</p>'
                                        +'<p class="jieshao">'
                                        + '<span style="cursor:pointer;" class="name chakan" EditLinkUrl="' + EditLinkUrl + '" DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '" >' + chakan + '查看&nbsp;&nbsp;</span>&nbsp;&nbsp;'
                                        + '<span class="canDownload' + i + '"><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        +'</p>'
                                        +'</div>'
                                        + '</li>')
                }
                if(index==$(".missionright-body3>ul").length-1){
                    if($('#'+id).length==0){
                        $('.norellist').append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        +'<div class="sanjiao">'
                                        +'<img src="/img/cal/20.PNG" /></div>'
                                        +'<div class="div1">'
                                        + '<p class="name" onclick=filedetail("' + id + '")>'
                                        +'<span>'+filesname+'</span>'
                                        +'</p>'
                                        +'<p class="jieshao">'
                                        + '<span style="cursor:pointer;" class="name chakan" EditLinkUrl="' + EditLinkUrl + '" DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '" >' + chakan + '查看&nbsp;&nbsp;</span>&nbsp;&nbsp;'
                                        + '<span class="canDownload' + i + '"><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        +'<span>'+filescreatedon+'&nbsp;·</span>&nbsp;&nbsp;'
                                        +'<span>'+filesize+'k</span>'
                                        +'</p>'
                                        +'</div>'
                                        + '</li>')
                    }
                }
            })
        }
          
    }
    if (FileExtension != "zip") {
        $(".missionright-body3 p.name").click(function () {
            $(".edit-btn").hide()
            $(".file-preview").find("iframe").height("89%")
            $(".file-preview-edit").hide()
            $(".file-preview").show()
            $(".file-preview").find(".file-preview-name span").html($(this).find("span").html())
            $(".file-preview").find(".file-preview-download").attr("src", $(this).attr("DownloadLinkUrl"))
            $(".file-preview").find(".file-preview-edit").attr("src", $(this).attr("EditLinkUrl"))
            $(".file-preview").find(".file-preview-type img").prop("src", $(this).parent().prev().prev().prop("src"))
            $(".file-preview").find("iframe").prop("src", $(this).attr("ViewLinkUrl"))
            //$("body").css("overflow", "hidden")
            if ($(this).attr("EditLinkUrl") != 0 && $(this).attr("EditLinkUrl")) {
                $(".file-preview-edit").show()
            }
            return false
        })
        $(".missionright-body3 .chakan.name").click(function () {
            $(".edit-btn").hide()
            $(".file-preview").find("iframe").height("89%")
            $(".file-preview-edit").hide()
            $(".file-preview").show()
            $(".file-preview").find(".file-preview-name span").html($(this).parent().prev().find("span").html())
            $(".file-preview").find(".file-preview-download").attr("src", $(this).attr("DownloadLinkUrl"))
            $(".file-preview").find(".file-preview-edit").attr("src", $(this).attr("EditLinkUrl"))
            $(".file-preview").find(".file-preview-type img").prop("src", $(this).parent().parent().prev().prev().prop("src"))
            $(".file-preview").find("iframe").prop("src", $(this).attr("ViewLinkUrl"))
            //$("body").css("overflow", "hidden")
            if ($(this).attr("EditLinkUrl") != 0 && $(this).attr("EditLinkUrl")) {
                $(".file-preview-edit").show()
            }
            return false
        })
    }
    $('.fileclass-head').click(function(){
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
                if (canDelete=='true') {
                    $(this).append(
                    '<div class="miss-bianji miss-bianji2">'
                    + '<div class="miss-bianji1">详情</div>'
                    + '<div>删除</div>'
                    + '<div>标记分类</div>'
                    + '<div>重命名</div>'
                    + '</div>'
                )
                }
                else {
                    $(this).append(
                    '<div class="miss-bianji miss-bianji2">'
                    + '<div class="miss-bianji1">详情</div>'
                    + '<div>标记分类</div>'
                    + '<div>重命名</div>'
                    + '</div>'
                )
                }
                
                var id = $(this).parents("li").attr("id")
                $(".missionright-body3 .miss-bianji2 div").eq(0).click(function () {
                    window.open("/files/filedetail.aspx?id=" + id)
                })
                $(".missionright-body3 .miss-bianji2 div").eq(3).click(function () {
                    var id = $(this).parents("li").attr("id")
                    var name = $(this).parents("li").find('.name span').html()
                    $('#iframe').show().attr('src', "/alert/file/filechangename_ie8.html?id=" + id + '&name=' + name).show().height(280).css('margin-top', '-140px');
                    $('#changeDiv').show()
                    $('.popup-mask').show()
                })
                //附件删除
                $('.missionright-body3 .miss-bianji2 div').eq(1).click(function(){
                    var id = $(this).parents('li').attr('id')
                    var canDelete = $(this).parents('li').attr('canDelete')
                    if (canDelete != 'false') {
                        $('#iframe').show().attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=20392').show().height(280).css('margin-top', '-140px');
                        $('#changeDiv').show()
                        $('.popup-mask').show()
                    }
                    else {
                        error3('对不起，您没有删除权限！')
                    }
                })
                $('.missionright-body3 .miss-bianji2 div').eq(2).click(function(){
                    var ObjectTypeCode = obj.ObjectTypeCode
                    var id = $(this).parents('li').attr('id')
                    $('#iframe').show().attr('src', '/alert/fileclass_ie8.html?id=' + id + '&ObjectTypeCode=' + ObjectTypeCode).show().height(350).css('margin-top', '-250px');
                    $('#changeDiv').show()
                    $('.popup-mask').show()
                })

                var height = $(this).find('.miss-bianji').height()
                var top1 = $(this).find('.miss-bianji').offset().top
                var top2 = $(window).scrollTop();
                var top3 = top1 - top2
                if (top3 + height > $(window).height()) {
                    var top = -height - 15 + 'px'
                    $(this).find('.miss-bianji').css('margin-top', top)
                }
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
function stopPropagation(e) {
    e = e || window.event;
    if (e.stopPropagation) { //W3C阻止冒泡方法  
        e.stopPropagation();
    } else {
        e.cancelBubble = true; //IE阻止冒泡方法  
    }
}
function error3(type) {
    $("body").append('<div class="success red red3" style="left: 45%;width: auto; z-index:9999;"><span class="success_icon" style="background: #C23934;border: 1px solid #fff;"><i class="iconfont icon-cuohao" style="top: -7px;position: relative;left: 2px;font-size: 20px;"></i></span><div class="toastContent slds-notify__content" style="flex: 1;"><div class="slds-align-middle slds-hyphenate" style="font-size: 16px;"><span class="toastMessage slds-text-heading--small forceActionsText"></span></div></div></div>')
    if (type) {
        $(".toastMessage").html(type)
    }
    setTimeout(function () {
        $(".success").remove()
        parent.$('#changeDiv').hide()
    }, 3000)
}
var entityAttachmentList
jQuery(document).ready(function () {
    entityAttachmentList = new entityAttachment();
    entityAttachmentList.load();
    entityAttachmentList.relatedgetlist()
    $('body').append('<iframe id="iframe_display" name="iframe_display" style="display: none;"></iframe>  ')
    $("#btnUploadfile").after('<form enctype="multipart/form-data" target="iframe_display" method="post" action="/apps/CommandProcessor.ashx?cmd=file.attachment.upload" id="fileform"><input id="fileinput" value="123" onchange="filechange(this)" style="display:none" type="file" name="file" multiple="multiple" class="el-upload__input">'
        + '<input type="hidden" name="pid" id="pid"/><input type="hidden" name="CategoryName" id="CategoryName"/><input type="hidden" name="ObjTypeCode" id="ObjTypeCode"></form>')
    $("#btnUploadfile").click(function () {
        //setLastMousePosition(event);
        var pid = getQueryString("id");
        var entityCode = "800";
        var type = "1010";
        var CategoryName = $('.missionright-file-type .shituu span').html()
        if(CategoryName=='全部'){
            CategoryName=''
        }
        $('#CategoryName').val(CategoryName)
        //if (typeof FormData != 'undefined') {
        //    $(this).next().find('#fileinput').trigger('click')
        //} else {
        //    openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName="+CategoryName+"&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        //}      
        openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + pid + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 480, 'width=450,height=480,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
    });
});
function filechange(that) {
    //console.log(that)
    //var file = that.files[0]
    //setTimeout(function () {
    //    $('#iframe').contents().find('.file-name').html(file.name)
    //    $('#iframe').contents().find('.file-size').html((file.size / 1024 / 1024).toFixed(2) + 'M')
    //}, 100)
    var form = $('#fileform')
    console.log(form)
    $('#pid').val(getQueryString('id'))
    $('#ObjTypeCode').val(getQueryString('objectTypeCode'))
    //form.submit()

    if (typeof FormData != 'undefined') {
        if ($(that).val() != '') {
            $('.popup-mask').show()
            $('#iframe').show().attr('src', '/alert/fileupdata.html').css({
                height: 200,
                marginTop: '-100px'
            })
            var formdata = new FormData(form[0]);
            $.ajax({
                url: "/apps/CommandProcessor.ashx?cmd=file.attachment.upload",
                type: "post",
                data: formdata,
                contentType: false,
                processData: false,
                mimeType: "multipart/form-data",
                success: function (data) {
                    console.log(data)
                    return false;
                },
                error: function (error) {
                    console.log("error", error)
                },
                xhr: function () {
                    var xhr = $.ajaxSettings.xhr();
                    if (onprogress && xhr.upload) {
                        xhr.upload.addEventListener("progress", onprogress, false);
                        return xhr;
                    }
                },
            })
        }
    } else {
        form.submit()
    }
}
function onprogress(evt) {
    var loaded = evt.loaded;
    var tot = evt.total;
    var per = Math.floor(100 * loaded / tot);
    console.log(per)
    console.log(evt)
    $('#iframe').contents().find('.loadedsize').html((loaded / 1024 / 1024).toFixed(2) + 'M')
    $('#iframe').contents().find('.totsize').html((tot / 1024 / 1024).toFixed(2) + 'M')
    $('#iframe').contents().find('.progress-in').css('width', per + '%')
    if (per == 100) {
        $('.popup-mask').hide()
        $('#iframe').hide()
        success2('上传成功')
        entityAttachmentList.load();
    }
}


//请求列表

entityAttachment.prototype.relatedgetlist = function () {
    var ContractId="";
    function callback(data) {
        $(".related-item").not('.layoutrelated-item').remove()
        //console.log(data)
        var data = JSON.parse(data);
        //console.log(data)
        //debugger;
        for (var i = 0; i < data.relatedList.length; i++) {
            //输出表格
            var datas = data.relatedList[i];
            var label = datas.label;
            $(".missionleft-body .related").append('<div class="related-item">'
                                            +'<div class="related-item-head">'
                                                +'<div class="related-item-logo">'
                                                    +'<img src="/img/cal/hetongguanli.png" alt="" /></div>'
                                                +'<div class="related-item-name">'
                                                    +'<span>'+label+'</span>'
                                                    +'<span>('+datas.relatedList.listData.length+')</span></div></div>'
                                            +'<div class="related-item-body">'
                                                +'<ul><li class="related-list-head"></li></ul>'
                                                +'<div class="lookall">'
                                                    +'<span>查看全部</span></div></div></div>')
                var res = data.relatedList[i].relatedList
                var shownColumns = res.shownColumns
                for (var j = 0; j < shownColumns.length; j++) {
                    //输出头部
                    var shown = shownColumns[j]
                    var label = shown.label
                    $(".related-list-head").eq(i).append('<div>'+label+'</div>')
                }
                $(".related-list-head").each(function(){
                    //宽度调整
                        $(this).parent().width($(this).find("div").length*120+50)
                        if($(this).parent().width()<$(document).width()*0.6){
                            $(this).parent().width("100%")
                        }
                })
                var listData = res.listData
                if(listData.length==0){
                    $(".related .related-item-body").eq(i).hide()
                }
                var objtype = ''
                for (var l = 0; l < res.entityButtons.length; l++) {
                    //创建按钮
                    var entityButtons = res.entityButtons[l];
                    var title = entityButtons.title
                    var onClick = entityButtons.onClick.split("(")[0]
                    objtype = entityButtons.onClick.split(",")[1].split(")")[0]
                    var id = entityButtons.onClick.split("',")[0].split("'")[1]
                    $(".related-item-name").eq(i).after('<div class="related-item-pay" onclick='+onClick+'("'+id+'","'+objtype+'")>'
                                                    +'<span>'+title+'</span>'
                                                +'</div>')
                }
                for (var k = 0; k < listData.length; k++) {
                    //输出表体
                    $(".related-list-head").eq(i).parent().append('<li id ="'+listData[k].LIST_RECORD_ID+'"></li>')
                    var list = listData[k]
                    var index = k+1
                    for(var item in list){
                        for (var m = 0; m < shownColumns.length; m++) {
                            var shown = shownColumns[m]
                            var columnName = shown.columnName
                            if(columnName==item){
                                $(".related-list-head").eq(i).parent().find("li").eq(index).append('<div>'+list[item]+'</div>')
                            }
                        }
                    }
                    $(".related-list-head").eq(i).parent().find("li").eq(index).append('<div class="sanjiao"><img src="/img/cal/20.PNG">'
                        +'<div class="miss-bianji miss-bianji2"><div class="miss-bianji1">编辑</div><div>删除</div></div>'
                        +'</div>')
                }
                $(".related-item-body .sanjiao").click(function(){
                    $(".miss-bianji").hide()
                    $(this).find(".miss-bianji").show()
                        $(document).click(function(){
                            $(".miss-bianji").hide()
                        })
                     return false
                })
        }
    }
    var pid = getQueryString("id");
    var d = {
        id: pid,
        objTypeCode:1010
        };
    if (window.obj){
        d.objTypeCode = obj.ObjectTypeCode
    }
    if ($('#layout_related').length == 0) {
        ajaxMethodGetData2("entity.related.getlist", d, callback);

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
    //备注
function remarksdept(id,objtype){
    $('#iframe').attr('src','/alert/meeting/remarkAudience.html?Id='+id+'&objTypeCode='+objtype+'&parentId=').show()
    $('#changeDiv').show()
}
function addRelatedItem(id,objtype){
    if(objtype==1012){
        $(".popup-contplan").find(".save").off()
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
                        var Rate = $(".popup-contplan").find("li").eq(i+1).find("input").eq(1).val()
                        var Amount = $(".popup-contplan").find("li").eq(i+1).find("input").eq(2).val()
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
    var pid = getQueryString("id");
        var pname = $('.logo').next().next().html()
        $('#iframe').attr('src','/alert/cntrt/new_paymentlst.html?pid='+pid+'&pname='+pname).show()
        $('#changeDiv').show()
    }else if(objtype==20392){
        $('#iframe').attr('src','/alert/remarks.html?parentId='+id+'&objTypeCode='+objtype).show()
        $('#changeDiv').show()
    }else if(objtype==1011){
        var pid = getQueryString("id");
        var pname = $('.logo').next().next().html()
        $('#iframe').attr('src','/alert/cntrt/new_ContractDetail.html?pid='+pid+'&pname='+pname).show()
        $('#changeDiv').show()
    }
}

//附件分类
$(document).ready(function () {
    var userAgent = navigator.userAgent;
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1;
    $('.newfileclass').click(function () {
    //if (isIE) {
        $('.selectlist').hide()
        $('#iframe').attr('src', '/alert/new_fileclass_ie8.html').show().height(330);
        $('#changeDiv').show()
        $('.popup-mask').show()
        return false;
    //} else {
    //        $('.selectlist').hide()
    //        $('#iframe').attr('src', '/alert/cntrt/new_fileclass.html');
    //        $('#changeDiv').show();
    //        $('#iframe').show();
    //        return false
    //}
  })    
})

$('.shuaxin').click(function () {
    entityAttachmentList.load();
})
function editfileclass(id, name) {
    $('.selectlist').hide()
    $('#changeDiv').show()
    $('.popup-mask').show()
    $('#iframe').show().attr('src', '/alert/new_fileclass_ie8.html?id=' + id + '&Name=' + name).height(330)
    stopPropagation()
}
function filedetail(id) {
    window.open("/files/filedetail.aspx?id=" + id)
}