var cannotedit = ''
if (getQueryString('view') == 3) {
    $('.writecomment').addClass('cannotedit')
    cannotedit = 'cannotedit'
}
$('#writecomment #comment-btn').click(function () {
    var id = parent.getQueryString('id') ? parent.getQueryString('id') : getQueryString('id')
    if (typeof id=='undefined'||id=='') {
        id = getQueryString('id')
    }
    var val = $('#writecomment textarea').val()
    if (val.length > 0) {
        function callback(data) {
            success('保存成功')
            getchatter()
            $('#writecomment textarea').val('')
        }
        //ajaxMethodPostData('chatter.post', { title: val, ObjectId:id}, callback)
        ajaxMethodPostData('content.comment.post', { contentId: id, comment: val, objectTypeCode: 100201 }, callback)
    } else {
        alert('请输入内容')
    }
})

//$('.newtaolun').click(function () {
//            var id = getQueryString('id')
            
//            $('#changeDiv').show()
//            $('#iframe').attr('src', '/alert/meeting/add_taolun.html?msgid=' + id).show()
//        })
//获取讨论
getchatter()
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = location.search.substr(1).match(reg);
    if (r != null) return unescape(decodeURI(r[2])); return null;
}
function getchatter() {
    var id = parent.getQueryString('id') ? parent.getQueryString('id') : getQueryString('id')
    if (typeof id == 'undefined' || id == '') {
        id = getQueryString('id')
    }
    var d = {
        //meetingid: metid,
        contentId: id
    }
    //ajaxMethodPostData('chatter.search', d, function (data) {
    ajaxMethodPostData('content.comment.search', d, function (data) {
        $('.comment ul li').remove();
        if (data.rows == undefined) return;
        for (var i = 0; i < data.rows.length; i++) {
            var res = data.rows[i]
            if (res.OwningBusinessUnit) {
                var OwningBusinessUnit = res.OwningBusinessUnit
            } else {
                var OwningBusinessUnit = ''
            }
            var src = '/img/cal/like_grey.png'
            if (res.IsLike==0) {
                src = '/img/cal/like.png'
            }
            $('.comment ul').append('<li class="comment-main"><div class="deleteup">'
                                            + '<div class="deleteup-delete" onclick=deletechatter("' + res.CommentId + '")><span>删除</span></div></div>'
                                        + '<p class="name">' + res.CreatedBy + '</p><p class="miaoshu" style="display:inline-block;margin-left:10px;">' + OwningBusinessUnit + '<span></span>'
                                            + '<span>' + res.CreatedOn + '</span></p><p class="">' + res.Comment + '</p>'
                                            + '<div class="comment-foot">'
                                            + '<div onclick=showchattercomment("' + res.CommentId + '","' + i + '")><span>回复</span>&nbsp&nbsp<span></span></div>'
                                            + '<div onclick=likechatter("' + res.CommentId + '","' + res.IsLike + '") class="deleteup-up"> '
                                                 + '<img src="' + src + '" /><span> ' + res.Likecount + '</span></div></div></li>')
        }

    })
}
//获取评论

//getcomment('')
function showchattercomment(id, index, shows) {
    var d = {
        chatterId: id,
    }
    if ($('.comment ul>li').eq(index).find('.comment-comment').length > 0 && shows != 1) {
        $('.comment ul>li').eq(index).find('.comment-comment').remove()
        $('.comment ul>li').eq(index).find('.writecomment').remove()

    } else {

        ajaxMethodGetData('chatter.comment.search', d, function (data) {
            $('.comment ul>li').eq(index).find('.comment-foot span').eq(1).html(data.rows.length)
            $('.comment ul>li').eq(index).find('.comment-comment').remove()
            $('.comment ul>li').eq(index).find('.writecomment').remove()
            $('.comment ul>li').eq(index).append('<div style="margin-top: -10px; height: 66px;" class="writecomment ' + cannotedit + '">'
                                                      + '<div class="textarea" style="height: 44px; width: 80%;">'
                                                      + '<textarea id="' + id + '" commentid="' + id + '" style="height: 30px; width: 90%;"></textarea>'
                                                      + '</div>'
                                                      + '<p id="comment-btn" onclick=writecomment("' + id + '","' + index + '") style="display: block;">评论</p>'
                                                   + '</div>')
            for (var i = 0; i < data.rows.length; i++) {
                var row = data.rows[i]
                if (row.ParentId == '') {
                    var src = '/img/cal/like_grey.png'
                    if (row.IsLike == true) {
                        src = '/img/cal/like.png'
                    }
                    $('.comment ul>li').eq(index).append('<div commentid="' + row.CommentId + '" class="comment-comment">'
                                                + '<div class="deleteup ' + cannotedit + '">'
                                                + '<div onclick=commentComment("' + row.ChatterId + '","' + row.CommentId + '","' + index + '") class="deleteup-delete ' + cannotedit + '">'
                                                     + '<span>回复</span>'
                                                     + '<span class="border"></span>'
                                                + '</div>'
                                                + '<div onclick=deletecomment("' + row.ChatterId + '","' + row.CommentId + '","' + index + '") class="deleteup-delete ' + cannotedit + '">'
                                                     + '<span>删除</span>'
                                                     + '<span class="border"></span>'
                                                + '</div>'
                                                    + '<div onclick=commentlike("' + row.ChatterId + '","' + row.CommentId + '","' + index + '","' + row.IsLike + '") class="deleteup-up ' + cannotedit + '"> '
                                                     + '<span>' + row.LikeQty + '</span>'
                                                     + '<img src="' + src + '" />'
                                               + '</div>'
                                            + '</div>'
                                            + '<p class="name">' + row.CreatedBy + '</p>'
                                            + '<p class="">&nbsp&nbsp&nbsp&nbsp' + row.Comment + ' </p>'
                                            + '<p class="miaoshu"><span></span>'
                                                + '<span>' + row.CreatedOn + '</span>'
                                            + '</p>'
                                            + '</div>')
                }
            }
            for (var i = 0; i < data.rows.length; i++) {
                var row = data.rows[i]
                if (row.ParentId != '') {
                    $('div[commentid="' + row.ParentId + '"]').append('<div class="comment-comment">'
                                                + '<div class="deleteup ' + cannotedit + '">'
                                                + '<div onclick=commentComment("' + row.ChatterId + '","' + row.ParentId + '","' + index + '") class="deleteup-delete">'
                                                     + '<span>回复</span>'
                                                     + '<span class="border"></span>'
                                                + '</div>'
                                                + '<div onclick=deletecomment("' + row.ChatterId + '","' + row.CommentId + '","' + index + '") class="deleteup-delete">'
                                                     + '<span>删除</span>'
                                                + '</div>'
                                            + '</div>'
                                            + '<p class="name">' + row.CreatedBy + '</p>'
                                            + '<p class="">&nbsp&nbsp&nbsp&nbsp' + row.Comment + ' </p>'
                                            + '</div>')
                }
            }
        })
    }
}
//评论搜索
$('.commentsearch').keyup(function (event) {
    if (event.keyCode == "13") {
        var search = $(this).find('input').val()
        getcomment(search)
    }
})
//添加评论
function writecomment(id, index) {
    var comment = $('textarea[commentid="' + id + '"]').val()
    var d = {
        chatterId: id,
        comment: comment,
    }
    if (comment.length > 0) {
        ajaxMethodGetData('chatter.comment.post', d, function (data) {
            $('textarea[commentid="' + id + '"]').val('')
            success('保存成功')
            showchattercomment(id, index, 1)
        })
    } else {
        alert('请输入内容')
    }
}
function commentComment(chatterId, id, index) {
    if ($('div[commentid="' + id + '"]').find('#' + id).length == 0) {
        $('div[commentid="' + id + '"]').append('<div id="' + id + '" style="margin-top: -10px; height: 66px;" class="writecomment">'
            + '<div class="textarea" style="height: 44px; width: 80%;">'
            + '<textarea commentid="' + id + '" style="height: 30px; width: 90%;"></textarea></div>'
            + '<p id="comment-btn" onclick=writecommentComent("' + chatterId + '","' + id + '","' + index + '") style="display: block;">回复</p></div>')
    } else {
        $('#' + id).remove()
    }
}
function writecommentComent(chatterId, id, index) {
    var comment = $('textarea[commentid="' + id + '"]').val()
    var d = {
        chatterId: chatterId,
        parentId: id,
        comment: comment,
    }
    if (comment.length > 0) {
        ajaxMethodGetData('chatter.comment.post', d, function (data) {
            $('#' + id).remove()
            success('保存成功')
            showchattercomment(chatterId, index, 1)
        })
    } else {
        alert('请输入内容')
    }
}
//删除评论
function deletecomment(chatterId, id, index) {
    var objectTypeCode = getQueryString('objectTypeCode')
    if (objectTypeCode == '5000' || objectTypeCode == '130') {
        var id = getQueryString('id')
        $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&chatterId=' + chatterId + '&index=' + index + '&objTypeCode=chattercomment').show().height(280).css('margin-top', '-140px')
        $('.popup-mask').show()
    } else {
        $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&chatterId=' + chatterId + '&index=' + index + '&objTypeCode=chattercomment').show()
        $('#changeDiv').show()
    }
}
function deletechatter(id) {
    var objectTypeCode = getQueryString('objectTypeCode')
    if (objectTypeCode == '5000' || objectTypeCode == '130') {
        var id = getQueryString('id')
        $('#iframe').attr('src', '/alert/delete_ie8.html?id=' + id + '&objTypeCode=chatter').show().height(280).css('margin-top', '-140px')
        $('.popup-mask').show()
    }else{
        $('#iframe').attr('src', '/alert/delete.html?id=' + id + '&objTypeCode=chatter').show()
        $('#changeDiv').show()
    }
    
}
//点赞
function commentlike(chatterId, CommentId, index, IsLike) {
    var id = $(this).parents('li').attr('CommentId')
    if (IsLike == 'true') {
        var likeType = 0
    } else {
        var likeType = 1
    }
    var d = {
        chatterId: chatterId,
        CommentId: CommentId,
        likeType: likeType,
    }
    ajaxMethodGetData('chatter.like.post', d, function (data) {
        success(data.msg)

        showchattercomment(chatterId, index, 1)

    })
}
function likechatter(id, IsLike) {
    if (IsLike == 'true') {
        var likeType = 0
    } else {
        var likeType = 1
    }
    var d = {
        chatterId: id,
        likeType: likeType,
    }
    ajaxMethodGetData('chatter.like.post', d, function (data) {
        success(data.msg)
        getchatter()
    })
}