function shareIframeImg(i) {
    var img = $(i.contentWindow.document).find("img")
    img.width("100%")
    img.css("max-width", "100%")
}
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = location.search.substr(1).match(reg);
    if (r != null) return unescape(decodeURI(r[2])); return null;
}

$(".missionright-head .sanjiao").click(function () {
    $(".genggai-div3").toggle()
    $(".genggai-div4").hide()

    $(document).click(function (event) {
        $(".genggai-div3").hide()
    })
    return false;
})
$(".select").click(function () {
    $(".genggai-div4").toggle()
    $(".genggai-div3").hide()

    $(document).click(function (event) {
        $(".genggai-div4").hide()
    })
    return false;
})
$(".missionleft-head ul li").each(function () {
    $(this).click(function () {
        $(".missionleft-head ul li").removeClass("active")
        $(this).addClass("active")
        $(".missionleft-body>div").hide()
        $(".missionleft-body>div").eq($(this).index()).show()
    })
})
var DownloadLinkUrl
var Id 
function call(data) {
    console.log(data)
    var datas = data.listData[0][0]
    var CreatedOn = datas.CreatedOn
    DownloadLinkUrl = datas.DownloadLinkUrl
    Id = datas.Id
    var FileExtension = datas.FileExtension
    var FileSize = datas.FileSize
    var CreatedByName = datas.CreatedByName
    FileSize = FileSize / 1024 +""
    FileSize = FileSize.slice(0, 5)
    var ViewLinkUrl = datas.viewLink

    $("#iframe2").prop("src", ViewLinkUrl)
    var Name = datas.Name;
    //console.log(Name)
    $(".logo").next().next().html(Name)
    $(".file-preview").find(".file-preview-download").attr("src", DownloadLinkUrl)
    $(".missionmession-body .main span").eq(0).html(Name)
    $(".missionmession-body .main span").eq(1).html(CreatedByName)
    $(".missionmession-body .main span").eq(2).html(FileSize+"kb")
    $(".missionmession-body .main span").eq(3).html(FileExtension)
    $(".missionmession-body .main span").eq(5).html(CreatedByName)
    $(".missionmession-body .main span").eq(6).html(CreatedOn)
    $(".missionmession-body .main span").eq(7).html(CreatedByName)
    $(".missionmession-body .main span").eq(8).html(CreatedOn)
    if (FileExtension == "xls" || FileExtension == "xlsx") {
        imgsrc = "/img/filetype/xls.png"
    }
    else if (FileExtension == "docx" || FileExtension == "doc") {
        imgsrc = "/img/filetype/doc.png"
    }
    else if (FileExtension == "zip") {
        imgsrc = "/img/filetype/rar.png"
        $('.file-preview-edit').hide()
    }
    else if (FileExtension == "png" || FileExtension == "jpg") {
        imgsrc = "/img/filetype/Image.png"
        $('.file-preview-edit').hide()

    }
    else if (FileExtension == "bmp" || FileExtension == "jpeg") {
        imgsrc = "/img/filetype/Image.png"
        $('.file-preview-edit').hide()

    } else if (FileExtension == "txt") {
        imgsrc = "/img/filetype/Folder.png"
    }
    else if (FileExtension == "pdf") {
        imgsrc = "/img/filetype/Pdf.png"
        $('.file-preview-edit').hide()

    } else {
        imgsrc = "/img/filetype/Folder.png"
        $('.file-preview-edit').hide()

    }
    $("#iframe3").prop("src", ViewLinkUrl)
    $(".logo img").prop("src", imgsrc)
    $('.file-preview-type img').prop("src", imgsrc)
    $(".file-preview-name span").html(Name)

    $(".contract-message li").eq(3).html(FileSize + "kb")
    $(".contract-message li").eq(4).html(FileExtension)
    $(".contract-message li").eq(5).html(CreatedByName)
}
var id = getQueryString('id')
var d = { id: id }
var ObjectType = getQueryString('ObjectType')
if (ObjectType && ObjectType != '') {
    d.ObjectType = ObjectType
}
ajaxMethodGetData("file.attachment.get", d, call)
$(".caozuo>p").eq(0).click(function () {
    window.open(DownloadLinkUrl)
})
$(".caozuo>p").eq(3).click(function () {
    $("body").css("overflow", "hidden")
    $(".delete-shur").show()
    $(".delete-mask").show()
    $(".delete-shur-head").html("删除附件")
    $(".delete-shur-body").html("是否确定要删除此附件？")
    $(".delete-shur-foot div").click(function () {
        $(".delete-shur").hide()
        $(".delete-mask").hide()
        $("body").css("overflow", "visible")
    })
    $(".delete-shur-foot div").eq(0).click(function () {
        function call(data) {
           // console.log(data)
        }
        var ids = { id: Id }
        ajaxMethodGetData("file.attachment.delete", ids, call);
    })
    $(".popup-exit").click(function () {
        $(".delete-shur").hide()
        $(".delete-mask").hide()
        $("body").css("overflow", "visible")

    })
        
})
$(".preview img").click(function () {
    $("body").css("overflow", "hidden")
    $(".file-preview").show()
    $(".file-preview-head-right").click(function () {
        $(".file-preview").hide()
        $("body").css("overflow", "visible")
    })
})
$('.editfile').click(function () {
    $('#iframe').attr('src', '/layouteditor/add_layout_ie8.html?id=' + getQueryString('id') + '&entityName=File').show()
    $('.popup-mask').show()
})