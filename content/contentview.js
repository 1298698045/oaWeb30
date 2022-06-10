var pageNumberOfNewsComment = 1;
var pageNumberOfNewsReader = 1;
var pageSize = 10;

$(function () {
    var id = tools.q("id");

    GetNewsContent(id);
    GetCommentList();
    GetReaderList();
    GetLatestNews();

    $('.cate_contentComment_btn').bind("click", AddComment);
    $('.look_morecomment').bind("click", GetMoreComment);
    $('.look_moreReader').bind("click", GetMoreReader);

    $('.comment_list_ul_item').click(function () {

        $('.comment_list_ul_item').removeClass('comment_list_ul_item_active');
        $(this).addClass('comment_list_ul_item_active');

        $('.comment_list_cont').hide();
        $('.comment_list_cont').eq($(this).index()).show();
    });
});

function GetNewsContent(newsId) {

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.news.content.get",
        type: "GET",
        async: true,
        dataType: "json",
        data: {
            NewsId:newsId
        },
        success: function (data) {
            RendContent(data.data);
            GetRelatedNews(data.data.keywords);
        }
    });
}

function RendContent(data) {
    $(document).attr("title", data.Title);
    $(".catelist_title").html(data.Title);
    $(".contentTitle").html(data.Category);
    $(".contentAutor").html(data.Author);
    $(".contentDepatName").html(data.DeptName);

    $(".contentCommentCount").html(data.CommentCount);
    $(".contentReadCount").html(data.ReadCount);

    $(".contentDate").html(data.CreatedOn);
    $(".cate_content").html(data.ContentBody);

    var lbs = [];
    if (data.KeyWords) {
        if (data.KeyWords != "") {
            lbs = data.KeyWords.split(",")
        }
    }
    var lbshtm = '';
    for (var i = 0; i < lbs.length; i++) {
        lbshtm += '<span class="cate_content_label">'+lbs[i]+'</span>';
    }
    $(".cate_content_labels").html(lbshtm);

    var attachmentHtml = '';
    if (data.Attachments == undefined || data.Attachments.length == 0) {
        $(".attachmentsContainor").hide();
    }
    else {
        var fileName = '';
        var fileExtension = '';
        var attachrightcode = "0";
        if (data.AttachRightCode)
            attachrightcode = data.AttachRightCode;
        for (var i = 0; i < data.Attachments.length; i++) {
            //debugger
            //console.log(data.attachments[i]);
            var item = data.Attachments[i];

            fileExtension = getFileExtension(item.Name);
            fileName = item.Name.replace('.' + fileExtension, '');
          
            attachmentHtml += '<div class="cate_content_annex_item">';

            attachmentHtml += '<a href="' + item.ViewURL + '" style="" target="_blank" class="iconfont icon-lianjiewenjian">';
            attachmentHtml += '<span>';
            attachmentHtml += fileName;
            attachmentHtml += '</span></a>';

            attachmentHtml += " | <a target=\"_blank\" class=\"actionLink\" href=\"" + item.ViewURL + "\">查看</a>";

            if (attachrightcode == 0 || attachrightcode == '8')
                attachmentHtml += " | <a target=\"_blank\" class=\"actionLink\" href=\"" + item.DownloadURL + "\">下载</a>";

            attachmentHtml += '</div>';
        }
        $("#attachments").html(attachmentHtml);
    }

    //likeCount dislikeCount
    if (data.likecount * 1 > 0) {
        $(".likeCount").html(data.likecount);
    } else {
        $(".likeCount").html('点赞');
    }

    if (data.dislikeqty * 1 > 0) {
        $(".dislikeCount").html(data.dislikeqty);
    } else {
        $(".dislikeCount").html('不喜欢');
    }

    $(".cate_content_annex_like").click(function (e) {
        LikeOrDisLike(data.contentid, 0,'');
        $(this).siblings().removeClass('reds')
        $(this).toggleClass('reds')
    })
    $(".cate_content_annex_dislike").click(function (e) {
        LikeOrDisLike(data.contentid, 2, '');
        $(this).siblings().removeClass('reds')
        $(this).toggleClass('reds')
    })
    if (data.commentcount > 0) {
        $(".comment_list_ul_item_num").html('(' + data.commentcount + ')');
    }
    if (data.readcount > 0) {
        $(".read_list_ul_item_num").html('(' + data.readcount + ')');
    }
}

function LikeComment() {
    
    LikeOrDisLike($(this).attr('contentId'), 0, $(this).attr('id'));
}

function LikeOrDisLike(newsId, likeType, parentId) {

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.news.likeordislike.set",
        type: "GET",
        async: true,
        dataType: "json",
        data: {
            NewsId: newsId,
            LikeType: likeType,
            ParentId: parentId
        },
        success: function (data) {

            if (data.data > 0 && parentId.length == 0) {
                if (likeType == 0)
                    $(".likeCount").html(data.data);
                else
                    $(".dislikeCount").html(data.data);
            }
            else {
                $('#' + parentId).siblings('.comment_list_cont_ul_item_text_cancel_zan_num').html(data.data);
                //comment_list_cont_ul_item_text_cancel_zan_num
            }
            //console.log(data);
        }
    });
}

function AddComment() {

    var id = tools.q("id");
    var comment = $('.cate_contentComment_input').val();
    if (comment.length == 0)
        return;

    $('.cate_contentComment_btn').unbind("click", AddComment);

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.news.comment.add",
        type: "GET",
        async: false,
        dataType: "json",
        data: {
            NewsId: id,
            Comment: comment
        },
        success: function (data) {
            $('.cate_contentComment_input').val('');
            pageNumberOfNewsComment = 1;
            GetCommentList();
            //totalcount+1；
            var oldCount = $(".contentCommentCount").html();
            if (oldCount.length == 0) {
                $(".contentCommentCount").html('1');
                $(".comment_list_ul_item_num").html('(1)');
            }
            else {
                $(".contentCommentCount").html(Number(oldCount) + 1);
                $(".comment_list_ul_item_num").html("("+(Number(oldCount) + 1)+")");
            }
        }
    });

    $('.cate_contentComment_btn').bind("click", AddComment);
}

function GetCommentList() {
    var id = tools.q("id");
    var comment = $('.cate_contentComment_input').val();
   
    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.news.comment.list",
        type: "GET",
        async: true,
        dataType: "json",
        data: {
            pageNumber: pageNumberOfNewsComment,
            pageSize: pageSize,
            NewsId: id
        },
        success: function (data) {

            if (!data.listData) return;

            RendComment(data.listData, pageNumberOfNewsComment);

            if (data.listData.length > 0 && data.listData.length == pageSize) {
                pageNumberOfNewsComment++;
            }
            else//no more data
            {
                $('.look_morecomment').html('没有更多数据');
                $('.look_morecomment').unbind("click", GetMoreComment);
            }
            //console.log(data);
        }
    });
}

function GetReaderList() {
    
    var id = tools.q("id");

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.news.reader.list",
        type: "GET",
        async: true,
        dataType: "json",
        data: {
            pageNumber: pageNumberOfNewsReader,
            pageSize: pageSize,
            NewsId: id
        },
        success: function (data) {

            RendReader(data.listData, pageNumberOfNewsReader);

            if (data.listData.length > 0 && data.listData.length == pageSize) {
                pageNumberOfNewsReader++;
            }
            else//no more data
            {
                $('.look_moreReader').html('没有更多数据');
                $('.look_moreReader').unbind("click", GetMoreReader);
            }
        }
    });
}

function GetMoreComment() {
    GetCommentList();
}

function GetMoreReader() {
    GetReaderList();
}

function RendComment(data, pageNumber) {
    if (!data) return;
    var html = '';
    for (var i = 0; i < data.length; i++) {

        if (data[i].DeptName == null)
            data[i].DeptName = '';

        html += '<li class="comment_list_cont_ul_item">';

        html += '<div class="comment_list_cont_ul_item_img">';
        html += '<img src="/img/Avatar.png" alt="Alternate Text" />';
        html += '</div>';

        html += '<div class="comment_list_cont_ul_item_text">';

        html += '<p class="comment_list_cont_ul_item_text_title">';
        html += '<span class="comment_list_cont_ul_item_text_title_people">' + data[i].CreatedByName + '</span>';
        html += '<span class="comment_list_cont_ul_item_text_cancel_zan">';
        html += '<span class="comment_list_cont_ul_item_text_cancel_zan_num">' + data[i].LikeQty + '</span><i contentId="' + data[i].ContentId + '" id="' + data[i].CommentId + '" class="iconfont likeComment icon-zan"></i></span>';
        html += '</p>';

        html += '<p class="comment_list_cont_ul_item_text_test">' + data[i].Comment + '</p>';
        html += '<p class="comment_list_cont_ul_item_text_cancel"><span class="comment_list_cont_ul_item_text_cancel_txt">' + data[i].DeptName + '</span>';
        html += '<span class="comment_list_cont_ul_item_text_title_date">' + data[i].CreatedOn + '</span><span class="clear"></span></p>';

        html += '</div>';
        html += '<div class="clear"></div>';
        html += '</li>';
    }

    if (pageNumber == 1) {
        $('.comment_list_cont_ul').html(html);
    } else {
        var old = $('.comment_list_cont_ul').html();
        $('.comment_list_cont_ul').html(old+html);
    }

    $('.likeComment').bind("click", LikeComment);
}

function RendReader(data, pageNumber) {
   
    if (!data) return;
    var html = '';
    for (var i = 0; i < data.length; i++) {
        if (data[i].DeptName == null)
            data[i].DeptName = '';

        html += '<li class="comment_list_cont_ul_item">';

        html += '<div class="comment_list_cont_ul_item_img">';
        html += '<img src="/img/Avatar.png" alt="Alternate Text" />';
        html += '</div>';

        html += '<div class="comment_list_cont_ul_item_text">';

        html += '<p class="comment_list_cont_ul_item_text_title">';
        html += '<span class="comment_list_cont_ul_item_text_title_people">' + data[i].ReaderName + '</span>';
      
        html += '</p>';

        html += '<p class="comment_list_cont_ul_item_text_test"></p>';
        html += '<p class="comment_list_cont_ul_item_text_cancel"><span class="comment_list_cont_ul_item_text_cancel_txt">' + data[i].DeptName + '</span>';
        html += '<span class="comment_list_cont_ul_item_text_title_date">' + data[i].CreatedOn + '</span><span class="clear"></span></p>';

        html += '</div>';
        html += '<div class="clear"></div>';
        html += '</li>';
    }

    if (pageNumber == 1) {
        $('.read_list_cont_ul').html(html);
    } else {
        var old = $('.comment_list_cont_ul').html();
        $('.read_list_cont_ul').html(old + html);
    }
}

function GetLatestNews() {
    var objectTypeCode = getQueryString('objectTypeCode');
    var contentTypeCode = 1;

    if (objectTypeCode != undefined && objectTypeCode == '100202')
        contentTypeCode = '2';

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.news.list.get",
        type: "GET",
        async: true,
        dataType: "json",
        data: {
            contentTypeCode:contentTypeCode,
            FolderId: '',
            pageNumber: 1,
            pageSize: 5
        },
        success: function (data) {

            BuildRightListHTML(data.listData, 'catelists_ul_latest');
        }
    });
}

function BuildRightListHTML(listData,containorClass) {
    var html = '';
    for (var i = 0; i < listData.length; i++) {
        if (listData[i].Title == null)
            listData[i].Title = '';
        if (listData[i].CreatedOn == null)
            listData[i].CreatedOn = '';
        if (listData[i].CategoryName == null)
            listData[i].CategoryName = '';
        if (listData[i].DeptName == null)
            listData[i].DeptName = '';
        if (listData[i].FullName == null)
            listData[i].FullName = '';

        html += '<li class="catelists_item">';

        html += '<a class="catelists_item_title" target="_blank" href="/content/contentview.aspx?id=' + listData[i].ContentId + '">';
        html += listData[i].Title;
        html += '</a>';

        html += '<p>';
        html += '<span class="catelist_label">';
        html += listData[i].CategoryName;
        html += '</span>';
        html += '<span class="catelist_img"><img alt="" src="/img/Avatar.png" /></span>';
        html += '<span class="catalist_people">';
        html += listData[i].FullName;
        html += '</span>';
        html += '<span>·</span><span class="catalist_department">';
        html += listData[i].DeptName;
        html += '</span>';
        html += '</p>';

        html += '<p>';
        html += '<span class="catalist_comment">';
        html += listData[i].CommentCount;
        html += '</span><span>评论</span><span>·</span>';
        html += '<span class="catalist_read">';
        html += listData[i].ReadCount;
        html += '</span>';
        html += '<span>阅读</span><span>·</span>';
        html += '<span class="catalist_date">';
        html += listData[i].CreatedOn;
        html += '</span></p></li>';
       
        html += listData[i].FullName;

    }
    $('.' + containorClass).html(html);
}

function GetRelatedNews(keywords) {
    
    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.news.related.list",
        type: "GET",
        async: true,
        dataType: "json",
        data: {
            KeyWords: keywords,
            pageNumber: 1,
            pageSize: 5
        },
        success: function (data) {

            BuildRightListHTML(data.listData, 'catelists_ul_related');
        }
    });
}

function getFileExtension(filename) {
    var ext = /^.+\.([^.]+)$/.exec(filename);
    return ext == null ? "" : ext[1];
}