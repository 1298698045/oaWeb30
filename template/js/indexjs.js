
selectbuttonbtn()
function selectbuttonbtn() {
    $('.selectbuttonbtn').click(function () {
        $('.selectlist').hide()
        $(this).find('.selectlist').show()
        return false;
    })
    $('.selectlist li').not('.newfileclass').click(function () {
        $(this).parent().find('li').removeClass('active')
        $(this).addClass('active')
        $('.selectlist').hide()
        return false;
    })
}

$(document).click(function () {
    $('.selectlist').hide()
    $('.search-lookup').hide()
})
$('.selectinput').click(function () {
    $('.selectlist').hide()
    $(this).next('.selectlist').show()
    return false;
})
$('.selectinput').next('.selectlist').find('li').click(function () {
    $(this).parent().parent().prev().find('span').html($(this).find('span').html())
    $(this).parents('.search-group').attr('search', $(this).attr('search'))
    searchcont()

})
$('.search-input input[type="text"]').keyup(function () {
    $(this).parents('.search-group').attr('search', $(this).val())
    searchcont()

})
$('.search-text').click(function () {
    var that = this
    function callback(data) {
        console.log(data)
        var res = data.listData

        $(that).parent().find('.search-lookup li').remove()
        for (var i = 0; i < res.length; i++) {
            $(that).parent().find('.search-lookup').append('<li id="' + data.listData[i].ID + '">' + data.listData[i].Name + '</li>')
        }
        
        $(that).parent().find('.search-lookup li').click(function () {
            $(that).val($(this).html())
            $(that).prev().val($(this).attr('id'))
            $(that).parents('.search-group').attr('search', $(this).attr('id'))

            searchcont()

        })
    }
    $('.search-lookup').hide()
    $(this).parent().find('.search-lookup').show()

    var Lktp = $(this).attr("data-object");
    var d = {
        Lktp: Lktp
    };
    ajaxMethodGetData("ui.entity.lookup", d, callback);
    return false;
})
$('.search-text').keyup(function () {
    var that =this
    function callback(data) {
        var res = data.listData
        $(that).parent().find('.search-lookup li').remove()
        for (var i = 0; i < res.length; i++) {
            $(that).parent().find('.search-lookup').append('<li id="' + data.listData[i].ID + '">' + data.listData[i].Name + '</li>')      
        }
        $(that).parent().find('.search-lookup li').click(function () {
            $(that).val($(this).html())
            $(that).prev().val($(this).attr('id'))
            $(that).parents('.search-group').attr('value', $(this).attr('id'))
            $(that).parents('.search-group').attr('search', $(this).attr('id'))
            searchcont()

        })
    }
    lksrch = $(this).val();
    var Lktp = $(this).attr("data-object");

    d = {
        Lktp: Lktp,
        lksrch: lksrch
    };
    ajaxMethodGetData("ui.entity.lookup", d, callback);
});

function success(type) {
    parent.$("body").append("<div class=\"success green\">\n            <span class=\"success_icon\">\n            <i class=\"iconfont icon-duihao\"><img src='/img/images/00.3.Check.png'></img></i>\n            </span>\n            <div class=\"toastContent slds-notify__content\" style=\"flex: 1;\">\n            <div class=\"slds-align-middle slds-hyphenate\" style=\"font-size: 16px;\">\n            <span class=\"toastMessage slds-text-heading--small forceActionsText\">" + type + "</span>\n    </div>\n    </div>\n    <button class=\"button\">\n    <i class=\"iconfont icon-cuohao\"></i>\n    </button>\n    </div>");
    setTimeout(function () {
        parent.$(".success").remove();
    }, 3000);
}
$('.addallpeople').click(function () {
    if (confirm('确定要邀请所有人吗？')) {
        ajaxMethodPostData('object.user.inviteall', {
            objectId: getQueryString('id'),
            objectTypeCode: getQueryString('objectTypeCode')
        }, function (data) {

        })
    }
})
if ($('.bodyDiv #bodyCell .table-body #gridContainer').length > 0) {
    setTimeout(function () {
        if ($('.objectManagerLeftNav').length > 0) {
            var girdwidth = $('.objectManagerLeftNav').width()
        } else {
            var girdwidth = $('body').width()
        }
        if ($('#treePanel').length > 0 || $('.lefttr').length>0) {
            girdwidth = girdwidth - 240
        }
        //$('#gridContainer').width(girdwidth)
        //$("#gridContainer").css("cssText", "width:" + girdwidth + "px !important")
        $("#gridContainer").css("cssText", "calc(100% - 240px) !important")
    }, 0)
}