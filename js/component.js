var cannotedit = ''
if (getQueryString('view') == 3) {
    cannotedit = 'cannotedit'
}

function shareIframeImg(i) {
    var img = $(i.contentWindow.document).find("img")
    img.width("100%")
    img.css("max-width", "100%")
}

function entityAttachment() {
    this.category = true
}
entityAttachment.prototype.refresh = function () {
    //btnUploadfile
}
entityAttachment.prototype.load = function () {
    $('body').append('<div class="file-preview" style="display:none;"><div class="file-preview-mask"></div><div class="file-preview-head"><div class="file-preview-head-left"><div class="file-preview-type"><img src="/img/filetype/doc.png" /></div><div class="file-preview-name"><span></span></div></div><div class="file-preview-head-middle"><div class="file-preview-download"><img src="/img/cal/679 (2).png" style="width:18px;height:18px;" /><span>下载</span></div></div><div class="file-preview-head-right"><img src="/img/cal/4.closeIcon(24x24).png" style="width:20px;height:20px;" /></div></div><iframe frameborder="0" src="" onload="shareIframeImg(this)"></iframe></div>')
    //$('body').append('<style>.missionright-file-type.shituu{width:150px !important;}.missionright-body{border-top:1px solid #dedede;}.missionright-head{padding-bottom:10px !important;}.missionright-head>span,.missionright-head>p{margin-top:3px;display:inline-block;}#btnUploadfile{margin-top:0;}.missionright-head:after{display:block;content:"";clear:both;}#downfile-all{margin-top:0 !important;margin-left:10px !important;}.shuaxin{background:none;}.sanjiao{width:20px !important;height:20px !important;padding:0 !important;margin-top:5px;overflow:visible !important;position:static;float:right;border:1px solid #e4e8eb;border-radius:4px;}.missionright-body li.div1{float:left;margin-top:5px;margin-left:10px;}.missionright-body li{padding:10px 5px;}.selectlist{width:100%;left:0;}.file-preview-head-right{float:right !important;}.file-preview-type img{margin-top:0;}.file-preview-head-right img{margin-top:0;}.section{display:none;background-color:white;}.clear{clear:both;}.section.active{display:block;}#ef_taolun1{width:100%;height:500px;}.layui-table-view{background-color:white;}.head-right a{color:white;}.editbox a{cursor:pointer;}.missionright-body3 ul li .div1{width:70%;}.missionright-body3 ul li .name{overflow:hidden;text-overflow:ellipsis;white-space:nowrap}.missionright-body3 ul li > img{width:40px;height:40px;float:left;}.missionright-body3 ul li{background:none;}.missionright-body li .div1{margin-left:50px;float:none;}.file-preview{position:fixed;top:0;left:0;width:100%;height:100%;display:none;z-index:300;}.file-preview-mask{position:fixed;top:0;left:0;width:100%;height:100%;background-color:#000;opacity:0.8;}.file-preview-type img{height:32px;width:32px;margin-left:10px;margin-top:12px;}.file-preview-name{margin-left:15px;}.file-preview-head{position:relative;z-index:301;height:60px;background-color:#000;color:white;line-height:60px;}.file-preview-head>div{float:left;}.file-preview-head.file-preview-head-right{float:right;}.file-preview-head-right img{margin-top:20px;margin-right:20px;cursor:pointer;}.file-preview-head-left>div{float:left;}.file-preview-head-middle{margin-left:25%;}.file-preview-head-middle > div{float:left;overflow:hidden;height:36px;width:80px;margin-top:12px;line-height:36px;border-radius:4px;cursor:pointer;}.file-preview-head-middle > div:hover{background-color:#383838;}.file-preview-head-middle img{margin-top:8px;float:left;margin-left:15px;margin-right:5px;}.file-preview iframe{height:92% !important;background-color:#ffffff;width:98%;position:absolute;z-index:10;left:1%;bottom:0;border:0;}.popup #newmission.missmessage-body .title>span{width:100px;}.popup #newmission.missmessage-body .email>span{width:100px;}.popup #newmission.pinput1{margin-left:0px;}.miss-bianji2{height:100px}.morefile{display:block;float:right;font-size:12px;color:#015ba7;border:1px solid #dddbda;padding:0 10px 0 10px;height:24px;line-height:26px;text-align:center;border-radius:4px;cursor:pointer;}.missionright-head{border-bottom:1px solid #e4e8eb;padding-bottom:10px;}.missionright-body3 .sanjiao img{margin-left:4px;margin-top:4px;width:12px;height:12px;}.missionright-file-type{height:30px;padding:10px;}.missionright-file-type > div{float:left;}.missionright-file-type .img2{width:12px;height:12px;float:right;}.file-type-title{line-height:30px;}.missionright-file-type .shituu{width:70% !important;margin-left:10px;color:#333;line-height:20px;margin-right:10px;position:relative;}.missionright-file-type .shuaxin{float:right;}.missionright-body3 .div1{float:left;margin-top:3px;}.selectlist{margin-top:5px;width:100%;margin-left:-1px;}.selectlist li{border:0;}.fileclass-head{cursor:pointer;height:32px;line-height:32px;font-weight:700;color:#333;padding-left:30px;border-radius:4px;margin:5px 10px;background:url("/img/images/rightArrow.png") no-repeat left 10px center;background-size:12px;background-color:#f3f2f2;}.fileclass-head.active{background:url("/img/images/Open.png") no-repeat left 10px center;background-size:12px;background-color:#f3f2f2;}.sanjiao{position:static;cursor:pointer;}.related-item-body .sanjiao{float:right !important;margin-right:15px;}.related-item-body .sanjiao img{margin-left:3px;margin-top:3px;}.miss-bianji2{left:auto;top:auto;right:55px;margin-top:-15px;height:auto;}.mission-left{overflow-y:visible;}.missionright-file-type span>.deletefileclass{display:none;}.buttonbtn{border:1px solid #dddbda;border-radius:4px;background-color:white;padding:0 15px;line-height:30px;height:32px;font-size:12px;cursor:pointer;box-sizing:border-box;}.missionright-body3 ul li.div1{width:70%;}.missionright-body li.div1{margin-left:20px;}.mission.div1{float:left;margin-top:5px;}.missionright-head .headicon{background-color:#a0522d;display:inline-block;position: relative;top: 4px;width:20px;height:20px;float:left;margin-right:10px;}.morefile{display:block;float:right;font-size:12px;color:#015ba7;border:1px solid #dddbda;padding:0 10px 0 10px;height:24px;line-height:26px;text-align:center;border-radius:4px;cursor:pointer;}.missionright-body ul{margin-top:5px;}.missionright-body.div1.name span{color:#108af9;cursor:pointer;}.missionright-body3{padding-bottom:8px;}.missionright-body{border:1px solid #5050501a;border-top:3px solid #b0adab;border-radius:2px;}.missionright-body li{height:40px;font-size:14px;padding:10px 0 10px 0;margin:0px 10px 0px 10px;background:url(/img/cal/10.png) no-repeat left center;background-size:40px;border-bottom:1px solid #5050501a;}.missionright-body li.div1{margin-left:60px;}.mission.div1{float:left;margin-top:5px;}.mission.delete{width:30px;height:30px;margin-top:5px;border:1px solid #5050501a;float:right;background:url(/img/cal/13.PNG) no-repeat center center;background-size:17px;border-radius:4px;}.mission.upfile{display:none;width:160px;height:32px;line-height:32px;color:#108af9;border-radius:4px;font-size:12px;text-align:center;margin:auto;cursor:pointer;}.missionright-head{padding-bottom:10px;border-bottom:1px solid #e4e8eb;margin-top:10px;color:#333333;padding-left:10px;padding-right:10px;}.shituu .img2{width:10px;height:10px;margin-left:5px;margin-top:5px;}.shituu{padding:5px 7px;}.miss-bianji div:hover{background-color:#f5f5f5;cursor:pointer;}.miss-bianji div{padding-left:20px;height:42px;line-height:42px;margin-top:5px;color:#108af9;}.miss-bianji{width:100px;background-color:white;box-shadow:0px 0px 10px 2px rgb(56 56 56 / 20%);border-radius:4px;overflow:hidden;position:absolute;z-index:10;border:1px solid #dedede;}.selectlist.selectlistcheck li{position:relative;}.missionright-body3 ul li{background:none;}.selectlistcheck li{padding-left:40px;}.selectlist li{padding-left:15px;padding-right:20px;}.selectlist li{border:0;}.selectlist li{padding:0 30px 0 40px !important;height:32px;line-height:32px;font-size:14px;color:#333 !important;width:auto;margin:0;}</style>')
    //$('#filecontent').html('<div class="missionright-body missionright-body3 missionright-body4"><div class="missionright-head"><span class="title">附件</span>&nbsp;<span id="filecount">(0)</span><span class="morefile ' + cannotedit + ' btnText btnTextPrimary" id="btnUploadfile">上传文件</span></div><div class="missionright-file-type"><div class="shituu selectbuttonbtn"><span>全部</span><i class="iconfont icon-xiala"></i><div class="selectlist selectlistcheck"><ul><li class="rellist">全部</li><li class="newfileclass rellist ' + cannotedit + '">新建分类</li></ul></div></div></div><ul class="norellist"></ul></div>')
    $('#filecontent').html(`
            <div class ="missionright-body missionright-body3 missionright-body4">
               <div class ="missionright-head"><span class ="title">附件</span> <span id="filecount">(0)</span><span class ="morefile ' + cannotedit + ' btnText btnTextPrimary" id="btnUploadfile">上传文件</span>
               </div>
               <div class ="missionright-file-type">
                    <div class ="shituu selectbuttonbtn"><span>全部</span><i class="iconfont icon-xiala"></i>
                        <div class ="selectlist selectlistcheck">
                            <ul>
                                <li class ="rellist">全部</li>
                                <li class ="newfileclass rellist ' + cannotedit + '">新建分类</li>
                            </ul>
                        </div>
                    </div>
                    <div class ="btnText margin10Right">
                        <i class ="iconfont icon-jichushezhi"></i>
                    </div>
                    <div class ="btnText">
                        <i class ="iconfont icon-jichushezhi"></i>
                    </div>
                </div>
                <ul class ="norellist"></ul>
            </div>
        `)
    $('body').append('<iframe id="iframe_display" name="iframe_display" style="display: none;"></iframe>')
    $("#btnUploadfile").after('<form enctype="multipart/form-data" target="iframe_display" method="post" action="/apps/CommandProcessor.ashx?cmd=file.attachment.upload" id="fileform"><input id="fileinput" value="123" onchange="filechange(this)" style="display:none" type="file" name="file" multiple="multiple" class="el-upload__input">'
        + '<input type="hidden" name="pid" id="pid"/><input type="hidden" name="CategoryName" id="CategoryName"/><input type="hidden" name="ObjTypeCode" id="ObjTypeCode"></form>')
    $("#btnUploadfile").click(function () {
        //setLastMousePosition(event);
        //var pid = getQueryString("id");
        var instId = document.getElementById("instanceId").value;
        var entityCode = "800";
        var type = "1010";
        var CategoryName = $('.missionright-file-type .shituu span').html()
        if (CategoryName == '全部') {
            CategoryName = ''
        }
        $('#CategoryName').val(CategoryName)
        if (typeof FormData != 'undefined') {
            //$(this).next().find('#fileinput').trigger('click')
            openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + instId + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 580, 'width=450,height=580,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        } else {
            openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + instId + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 580, 'width=450,height=580,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        }
    });
    $('.selectbuttonbtn').click(function () {
        $(this).toggleClass('active').find('.selectlist').toggle();
        return false;
    })
    //var pid = getQueryString("id");
    var instId = document.getElementById("instanceId").value;
    function callback(data) {
        //console.log(data)
    }
    var d = { ObjectTypeCode: 1010 };
    if (window.obj) {
        d.ObjectTypeCode = window.obj.ObjectTypeCode
    }
    if (this.category) {
        $('#downfile-all').remove()
        $('#btnUploadfile').before('<img id="downfile-all" class="canDownload" style="cursor:pointer;margin-left:5px;height:18px;"  title="下载全部" src="/img/images/down.png"></img>')
        $('#downfile-all').click(function () {
            window.open('/apps/CommandProcessor.ashx?c=1&cmd=file.attachment.downloadall&parentId=' + instId)
        })
        $('body').append('<style>.canDownload{display:none;}</style>')
        ajaxMethodGetAsyncData("attachment.category.getlist", d, false, this.renderList2);
    } else {
        $('.missionright-file-type .buttonbtn.shituu.selectbuttonbtn').attr('style', 'pointer-events:none')
    }

    var d = { id: instId };
    ajaxMethodGetAsyncData(this.getfileurl, this.getfiledata, false, this.renderList);
}
entityAttachment.prototype.renderList2 = function (data) {
    //console.log(data)
    $('.missionright-file-type li').not('.rellist').remove()
    $('.missionright-body4>ul').not('.norellist').remove()
    $('.norellist li').remove()
    for (var i = 0; i < data.returnValue.records.length; i++) {
        var res = data.returnValue.records[i]
        var name = res.Name
        var itemid = res.ItemId
        $('.missionright-file-type li.newfileclass').before('<li itemid="' + itemid + '">' + name + '<img class="deletefileclass ' + cannotedit + '" style="width:14px;height:14px;float:right;margin-top:8px;" src="/img/cal/23.111(18x18)_1.png"></li>')
        $('.missionright-file-type').after('<ul pitemid="' + itemid + '"><div class="fileclass-head active"><span class="span1">' + name + '</span><img class="' + cannotedit + '" style="width:16px;float:right;margin-top:8px;margin-right:10px;" src="/img/cal/add.png"></img></div></ul>')
    }
    $('.deletefileclass').click(function () {
        $('.popup-mask').show()
        $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + $(this).parent().attr('itemid') + '&objTypeCode=附件分类').show().height(280).css('margin-top', '-200px')
        $('.selectlist.selectlistcheck').hide()
        return false;
    })
    $('.missionright-file-type li.newfileclass').click(function () {
        var ObjectTypeCode = obj.ObjectTypeCode
        $('#iframe').attr('src', '/alert/new_fileclass_ie8.html?ObjectTypeCode=' + ObjectTypeCode).show().height(328).css('margin-top', '-250px');
        $('#changeDiv').show()
        $('.popup-mask').show()
    })
    $('.fileclass-head img').click(function () {
        //var pid = getQueryString("id");
        var instId = document.getElementById("instanceId").value;
        var CategoryName = $(this).prev().html()
        $('#CategoryName').val(CategoryName)
        var entityCode = "800";
        var type = "1010";
        if (typeof FormData != 'undefined') {
            //$('#fileinput').trigger('click')
            openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + instId + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 580, 'width=450,height=580,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        } else {
            openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + instId + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 580, 'width=450,height=580,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);
        }
        // openPopup("/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=" + instId + "&CategoryName=" + CategoryName + "&type=" + type + "&retURL=/" + entityCode + "/detail?id=" + entityCode + "&retURL=%2f" + entityCode + "%2fo", 'RelatedActivityAttachmentList', 450, 580, 'width=450,height=580,scrollbars=yes,toolbar=no,status=no,directories=no,menubar=no,resizable=1', false);

        return false
    })
    $('.missionright-body3 .selectlistcheck li').not('.newfileclass').click(function () {
        $(this).parents('.selectbuttonbtn').find('span').html($(this).html())
        $(this).parents('.selectbuttonbtn').attr('itemid', $(this).attr('itemid'))
        $(this).parent().find('li').removeClass('active')
        $(this).addClass('active')
        $('.selectlist').parents('.shituu').removeClass('active');
        $('.selectlist').hide()
        if ($(this).hasClass('rellist')) {
            $('.missionright-body4>ul').show()
        } else {
            $('.missionright-body4>ul').hide()
            $('.missionright-body4>ul[pitemid="' + $(this).attr('itemid') + '"]').show()
        }
        return false;
    })
}
entityAttachment.prototype.renderList = function (data) {
    if (data.canCreate == true || data.canCreate == 'true') {
        $('#btnUploadfile').show();
    }
    else {
        $('#btnUploadfile').hide();
    }
    //console.log(data)
    //输出附件列表
    var filecount = 0;
    for (var j = 0; j < data.CategoryFiles.length; j++) {
        var datas = data.CategoryFiles[j].Files;
        filecount = filecount + datas.length;
        $("#filecount").html("(" + filecount + ")")
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
        var canDelete = files.Privilege.canDelete;
        var canDownload = files.Privilege.canDownload;
        if(canDownload==true){
            $('body').append('<style>.canDownload' + j + 's' + i + '{display:inline-block;}')
        } else {
            $('body').append('<style>.canDownload' + j + 's' + i + '{display:none;}')
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
                                        + '<div class="sanjiao cannotedit btnText">'
                                        + '<i class="iconfont icon-xiala"></i>'
                                        + '</div>'
                                        + '<div class="div1">'
                                        + '<p class="name" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">'
                                        + '<span>' + filesname + '</span>'
                                        + '</p>'
                                        + '<p class="jieshao">'
                                        + '<span style="cursor:pointer;color:#165dff;" class="name chakan" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">' + chakan + '查看&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span class="canDownload' + j + 's' + i + '"><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank" style="color:#165dff;font-size:14px;">' + xiazai + '下载&nbsp;</a></span>&nbsp;&nbsp;'
                                        + '</p>'
                                        + '<p class="timer">'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        + '</p>'
                                        + '</div>'
                                        + '</li>')
        } else {
            $(".missionright-body4>ul").each(function (index) {
                if ($(this).find('.span1').html()==CategoryName) {
                    $(this).append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        + '<div class="sanjiao cannotedit">'
                                        + '<img src="/img/cal/20.PNG" /></div>'
                                        + '<div class="div1">'
                                        + '<p class="name" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">'
                                        + '<span>' + filesname + '</span>'
                                        + '</p>'
                                        + '<p class="jieshao">'
                                        + '<span style="cursor:pointer;color:#015ba7;" class="name chakan" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">' + chakan + '查看&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span class="canDownload' + j + 's' + i + '"><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank" style="color:#015ba7;">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        + '</p>'
                                        + '</div>'
                                        + '</li>')
                }
                if (index == $(".missionright-body4>ul").length - 1) {
                    if ($('#' + id).length == 0) {
                        $('.norellist').append('<li id="' + id + '" canDelete="' + canDelete + '" canDownload="' + canDownload + '">'
                                        + '<img src="' + imgsrc + '" />'
                                        + '<div class="sanjiao cannotedit">'
                                        + '<img src="/img/cal/20.PNG" /></div>'
                                        + '<div class="div1">'
                                        + '<p class="name" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">'
                                        + '<span>' + filesname + '</span>'
                                        + '</p>'
                                        + '<p class="jieshao">'
                                        + '<span style="cursor:pointer;color:#015ba7;" class="name chakan" EditLinkUrl="' + EditLinkUrl + '"DownloadLinkUrl="' + '/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" ViewLinkUrl="' + ViewLinkUrl + '">' + chakan + '查看&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span class="canDownload' + j + 's' + i + '"><a href="/apps/files/fileDownload.aspx?isAttach=1&id=' + id + '" target="_blank" style="color:#015ba7;">' + xiazai + '下载&nbsp;</a>·</span>&nbsp;&nbsp;'
                                        + '<span>' + filescreatedon + '&nbsp;·</span>&nbsp;&nbsp;'
                                        + '<span>' + filesize + 'k</span>'
                                        + '</p>'
                                        + '</div>'
                                        + '</li>')
                    }
                }
            })
        }

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
            $("body").css("overflow", "hidden")
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
            $("body").css("overflow", "hidden")
            if ($(this).attr("EditLinkUrl") != 0 && $(this).attr("EditLinkUrl")) {
                $(".file-preview-edit").show()
            }
            return false
        })
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
                    //+ '<div class="miss-bianji1">详情</div>'
                    + '<div>删除</div>'
                    + '<div>标记分类</div>'
                    + '<div>重命名</div>'
                    + '</div>'
                )
                }
                else {
                    $(this).append(
                   '<div class="miss-bianji miss-bianji2">'
                   //+ '<div class="miss-bianji1">详情</div>'
                   + '<div>标记分类</div>'
                   + '<div>重命名</div>'
                   + '</div>'
               )
                }
               
                var id = $(this).parents("li").attr("id")
                //$(".missionright-body3 .miss-bianji2 div").eq(0).click(function () {
                //    window.location = "/files/filedetail.aspx?id=" + id
                //})
                $(".missionright-body3 .miss-bianji2 div").eq(2).click(function () {
                    var id = $(this).parents("li").attr("id")
                    var name = $(this).parents("li").find('.name span').html()
                    $('#iframe').attr('src', "/alert/file/filechangename_ie8.html?id=" + id + '&name=' + name).show().height(280).css('margin-top', '-140px');
                    $('#changeDiv').show()
                    $('.popup-mask').show()
                })
                //附件删除
                $('.missionright-body3 .miss-bianji2 div').eq(0).click(function () {
                    var id = $(this).parents('li').attr('id')
                    var canDelete = $(this).parents('li').attr('canDelete')
                    if (canDelete!='false'){
                        $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=20392').show().height(280).css('margin-top', '-140px');
                        $('.popup-mask').show()
                    }
                    else {
                        error3('对不起，您没有删除权限！')
                    }
                })
                $('.missionright-body3 .miss-bianji2 div').eq(1).click(function () {
                    var ObjectTypeCode = obj.ObjectTypeCode
                    var id = $(this).parents('li').attr('id')
                    $('#iframe').attr('src', '/alert/fileclass_ie8.html?id=' + id + '&ObjectTypeCode=' + ObjectTypeCode).show().height(348).css('margin-top', '-250px');
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
function filechange(that) {
    //console.log(that)
    //var file = that.files[0]
    //setTimeout(function () {
    //    $('#iframe').contents().find('.file-name').html(file.name)
    //    $('#iframe').contents().find('.file-size').html((file.size / 1024 / 1024).toFixed(2) + 'M')
    //}, 100)
    var form = $('#fileform')
    console.log(form)
    var instId = document.getElementById("instanceId").value;
    $('#pid').val(instId)
    $('#ObjTypeCode').val(30022)
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
        //form.submit()
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
        parent.entityFile.load();
    }
}


//附件分类
$(document).ready(function () {
    var userAgent = navigator.userAgent;
    var isIE = userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1;
    $('.newfileclass').click(function () {
        $('.selectlist').hide()
        $('#iframe').attr('src', '/alert/new_fileclass_ie8.html').show().height(280).css('margin-top', '-200px');
        $('.popup-mask').show()
        return false;
    })
})
$(document).click(function () {
    $('.selectlist').parent('.shituu').removeClass('active')
    $('.selectlist').hide()
})