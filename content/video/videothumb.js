$(document).ready(function () {

    var pageSize = 6;

    LoadChannel(pageSize);

    //morechannel.
    $('.openBtn').click(function () {
        $(this).hide();
        $(this).parent('div').addClass('mod_sear_list_open');
    })

    $('.close-mod_btn').click(function () {
        $('.openBtn').show();
        $(this).parent('ul').parent('div').removeClass('mod_sear_list_open');
    })

    $(".pindao li").click(function () {
        $('.sousuo').val('')
        $(this).addClass("selected").siblings().removeClass("selected");

        if ($(this).hasClass("select-all")) {
            $("#selectA").remove();
        } else {
            var copyThisA = $(this).clone();

            if ($("#selectA").length > 0) {
                $("#selectA a").html($(this).children('a').text());
            } else {
                $(".select-result dl").append(copyThisA.attr("id", "selectA"));
            }

            GetVideo($(this).attr('id'), pageSize)
        }
    });
   
    $(".year li").click(function () {
        $('.sousuo').val('')
        $(this).addClass("selected").siblings().removeClass("selected");
        if ($(this).hasClass("select-all")) {
            $("#selectF").remove();
        } else {
            var copyThisC = $(this).clone();
            if ($("#selectF").length > 0) {
                $("#selectF a").html($(this).text());
            } else {
                $(".select-result dl").append(copyThisC.attr("id", "selectF"));
            }
        }
    });

    //搜索
    $('.btnd').click(function () {
        var stml = '';
        var val = $('.sousuo').val();
        var timestamp = (new Date()).valueOf();

        jQuery.ajax({
            url: "/apps/CommandProcessor.ashx?t="+timestamp+"&cmd=video.video.search&pageNumber=1&pageSize=" + pageSize,
            type: "GET",
            async: false,
            dataType: "json",
            data: {
                key: val
            },
            success: function (data) {
                //render data pager.

                RenderVideoFile(data);

                CreatePager(data.totalCount, pageSize);
            }
        })
    })

    $("#selectA").live("click", function () {
        $(this).remove();
        $(".pindao .select-all").addClass("selected").siblings().removeClass("selected");
    });

    $("#selectB").live("click", function () {
        $(this).remove();
        $(".money .select-all").addClass("selected").siblings().removeClass("selected");
    });

    $("#selectC").live("click", function () {
        $(this).remove();
        $(".arae .select-all").addClass("selected").siblings().removeClass("selected");
    });
    $("#selectD").live("click", function () {
        $(this).remove();
        $(".what .select-all").addClass("selected").siblings().removeClass("selected");
    });

    $("#selectE").live("click", function () {
        $(this).remove();
        $(".any .select-all").addClass("selected").siblings().removeClass("selected");
    });

    $("#selectF").live("click", function () {
        $(this).remove();
        $(".year .select-all").addClass("selected").siblings().removeClass("selected");
    });

    $(".mod_sear_list li").live("click", function () {
        if ($(".select-result li").length > 0) {
            $(".select-no").hide();
        } else {
            $(".select-no").show();
        }
    });
});

function LoadChannel(pageSize) {
    var timestamp = (new Date()).valueOf();
    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?t="+timestamp+"&cmd=video.subfolder.list",
        type: "GET",
        async: false,
        dataType: "json",
        data: {
            ParentId: ''
        },
        success: function (data) {
            html = '';
            for (var i = 0; i < data.length; i++) {
                html += '  <li id=' + data[i].id + '>';
                html += '  <a href="#">' + data[i].text + '</a>';
                html += ' </li>';
            }
            if (data.length > 13) {
                html += ' <div class="close-mod_btn">';
                html += '  <a href="javascript:;">';
                html += '      <span class="vm-inline">收起</span>';
                html += '       <i class="iconfont icon-shangjiantou"></i>';
                html += '  </a>';
                html += '  </div>';
                $('.openBtn').show();
            } else {
                $('.openBtn').hide();
            }

            $('.pindao').append(html);
            $('.pindao li').eq(0).addClass('selected');

            var ParentId = $('.selected').attr('id');

            GetVideo(ParentId, pageSize);
        }
    });
}

function GetVideo(ParentId, pageSize) {
    var timestamp = (new Date()).valueOf();
    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?t="+timestamp+"&cmd=video.video.getvideo&pageNumber=1&pageSize=" + pageSize,
        type: "GET",
        async: false,
        dataType: "json",
        data: {
            ParentId: ParentId
        },
        success: function (data) {

            RenderVideoFile(data);

            CreatePager(data.totalCount, pageSize);
        }
    })
}

function RenderVideoFile(data) {
    var html = '';

    $('.pageSize').html(data.totalCount);

    for (var i = 0; i < data.Data.length; i++) {
        if (data.Data[i].thumbnail == null)
            data.Data[i].thumbnail = "#";
        var videoid = data.Data[i].id
        html += '<li videoid="' + videoid + '">';
        html += '<div class="site-piclist_pic">';
        html += '<a href="#" class="site-piclist_pic_link">';
        html += '<img width="180" height="236" rseat="dsjp7" alt="' + data.Data[i].text + '" title="' + data.Data[i].text + '" src="' + data.Data[i].thumbnail + '">';
        html += '<div class="wrapper-listTitle">';
        html += '<div class="mod-listTitle">';
        html += '<p class="viedo_rb">';
        //var time = data.Data[i].modifiedon.split('t')[1]
        //html += '<span class="icon-vInfo">' + time + '</span>';
        html += '</p>';
        html += '</div>';
        html += '</div>';
        html += '</a>';
        html += '</div>';
        html += '<div class="site-piclist_info">';
        html += '<div class="mod-listTitle_left">';
        html += '<p class="site-piclist_info_title  movie-tit ">';
        html += '<a title="' + data.Data[i].text + '" href="#" path="' + data.Data[i].virtualpath + '">' + data.Data[i].text + '</a>';
        html += '</p>';
        html += '</div>';
        html += '</div>';
        html += '</li>';
    }
    $('.video_list').html(html);

    $('ul.video_list li').each(function () {
        var src = $(this).children('.site-piclist_pic').children('a').children('img').attr('src');
        var name = $(this).children('.site-piclist_info').children('div').children('p').children('a').attr('path');

        var alink = $(this).find('a.site-piclist_pic_link');
        var id = $(this).attr('videoid')
        alink.attr('href', "/content/video/video.html?id="+id);
        alink.attr('target', '_blank');
    });
}

function CreatePager(totalPage, pageSize) {
    var timestamp = (new Date()).valueOf();
    //翻页
    $(".zxf_pagediv").createPage({
        pageNum: totalPage,
        current: 1,
        backfun: function (e) {
            var num = $('.current').html();
            jQuery.ajax({
                url: "/apps/CommandProcessor.ashx?t="+timestamp+"&cmd=video.video.getvideo&pageNumber=" + num + "&pageSize=" + pageSize,
                type: "GET",
                async: false,
                dataType: "json",
                data: {
                    ParentId: $('.selected').attr('id')
                },
                success: function (data) {
                    RenderVideoFile(data);
                }
            })
        }
    });
}