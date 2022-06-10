var listPageSize = 15;

$(function () {

    //save folder id: first from querystring. if no from first item.
    //var folderId = tools.q("folderId");
    var folderId = 'unread';
    if (folderId == undefined)
        folderId = tools.q("parentid");
    $('#folderId').html(folderId);

    GetContentCategory();

    GetListData(1, listPageSize,true);
});

function GetListData(pageNumber, pageSize, newCreatePage) {

    var folderId=$('#folderId').html();
    var objectTypeCode = getQueryString('objectTypeCode');
    var contentTypeCode = 1;
    if (objectTypeCode) {
        if (objectTypeCode == '100202')
            contentTypeCode = '2';
    }
    var data={
        contentTypeCode:contentTypeCode,
        FolderId: folderId,
        pageNumber: pageNumber,
        pageSize: pageSize
    }
    var url = "/apps/CommandProcessor.ashx?cmd=content.news.list.get";
    if (folderId=='unread') {
        data = {
            search: '',
            FolderId: '',
            PageNumber: pageNumber,
            rowsPerPage: pageSize
        }
        url = '/apps/CommandProcessor.ashx?cmd=content.unread.search'
    }
    if (folderId == 'all') {
        data = {
            contentTypeCode: contentTypeCode,
            FolderId: '',
            pageNumber: pageNumber,
            pageSize: pageSize
        }
    }
    jQuery.ajax({
        url: url,
        type: "GET",
        async: true,
        dataType: "json",
        data: data,
        success: function (data) {
            $("#totalCount").html(data.totalCount || data.total);
            $("#totalPages").html(data.totalPages || Math.ceil(data.total / 15));
            $(".numbers").html(data.totalCount || data.total);

            BuildListHTML(data.listData || data.rows);
            //翻页
            if (newCreatePage) {
                var timeStamp = Math.floor(Date.now());

                $(".zxf_pagediv").html('<div id="' + timeStamp + '">');
                $("#" + timeStamp + "").createPage({
                    pageNum: data.totalPages || Math.ceil(data.total / 15),
                    current: pageNumber,
                    backfun: function (e) {
                        var pagenum = $('.current').html();
                        GetListData(pagenum, pageSize, false)
                    }
                });
            }
        }

    });
}

function GetContentCategory() {
    //debugger;
    var objectTypeCode=getQueryString('objectTypeCode');
    //if (objectTypeCode == undefined)
    //    objectTypeCode = '';
    var contentTypeCode = "1";
    if (objectTypeCode) {
        if (objectTypeCode == '100202')
            contentTypeCode = '2';
    }
    else {
        objectTypeCode = '100201';
        contentTypeCode = '1';
    }

    jQuery.ajax({
        url: "/apps/CommandProcessor.ashx?cmd=content.item.tree",
        type: "GET",
        async: true,
        dataType: "json",
        data: {
            objectTypeCode: objectTypeCode
        },
        success: function (data) {
            console.log(data)
            //var categories = convert(data.listData);
            var categories = data.data;
            BuildCategoryHTML(categories);

            SetLeftMenuActive();

            //if ($('#folderId').html().length < 1 && categories.length>0)
            //    $('#folderId').html(categories[0].itemid);
        }
    });
}

function BuildCategoryHTML(categories) {

    var folderId = $('#folderId').html();

    var html = '';
    html += '<li id="unread" class="result_left_ul_item">';
    html += '<a href="javascript:void(0);" class="result_left_ul_item_a result_left_ul_item_active">';
    html += '<span class="result_left_ul_item_a_img">';
    html += '<img src="/img/announcement.png" alt="未读通知" />';
    html += '</span>';
    html += '<span class="result_left_ul_item_a_span">';
    html += '未读通知';
    html += '</span>';
    html += '</a>';
    html += '</li>';

    html += '<li id="all" class="result_left_ul_item">';
    html += '<a href="javascript:void(0);" class="result_left_ul_item_a">';
    html += '<span class="result_left_ul_item_a_img">';
    html += '<img src="/img/announcement.png" alt="全部" />';
    html += '</span>';
    html += '<span class="result_left_ul_item_a_span">';
    html += '全部';
    html += '</span>';
    html += '</a>';
    html += '</li>';

    for (var i = 0; i < categories.length; i++) {

        html += '<li id="' + categories[i].Id + '" class="result_left_ul_item">';

        if (categories[i].Children.length > 0) {
            html += '<a href="#" class="result_left_ul_item_a a">';
        } else {
            html += '<a href="javascript:void(0);" class="result_left_ul_item_a">';
        }

        html += '<span class="result_left_ul_item_a_img">';
        html += '<img src="/img/' + GetIconByName(categories[i].Name) + '.png" alt="Alternate Text" />';
        html += '</span>';
        html += '<span class="result_left_ul_item_a_span">';
        html += categories[i].Name;
        html += '</span>';
        html += '</a>';
        if (categories[i].Children.length > 0) {
            html += '<ul class="result_left_ul_item_ul">';
            for (var j = 0; j < categories[i].Children.length; j++) {
                html += '<li id="' + categories[i].Children[j].Id + '" class="result_left_ul_item_ul_item">';
                if (categories[i].Children[j].Children.length > 0) {
                    html += '<a href="#" class="result_left_ul_item_a a">';
                } else {
                    html += '<a href="javascript:void(0);" class="result_left_ul_item_a">';
                }

                html += '<span class="result_left_ul_item_a_img">';
                html += '<img src="/img/' + GetIconByName(categories[i].Children[j].Name) + '.png" alt="Alternate Text" />';
                html += '</span>';
                html += '<span class="result_left_ul_item_a_span">';
                html += categories[i].Children[j].Name;
                html += '</span>';
                html += '</a>';
                if (categories[i].Children[j].Children.length > 0) {
                    html += '<ul class="result_left_ul_item_ul_item_ul">';
                    for (var m = 0; m < categories[i].Children[j].Children.length; m++) {
                        html += '<li id="' + categories[i].Children[j].Children[m].Id + '" class="result_left_ul_item_ul_item_ul_item">';
                        if (categories[i].Children[j].Children[m].Children.length > 0) {
                            html += '<a href="#" class="result_left_ul_item_a a">';
                        } else {
                            html += '<a href="javascript:void(0);" class="result_left_ul_item_a">';
                        }

                        html += '<span class="result_left_ul_item_a_img">';
                        html += '<img src="/img/' + GetIconByName(categories[i].Children[j].Children[m].Name) + '.png" alt="Alternate Text" />';
                        html += '</span>';
                        html += '<span class="result_left_ul_item_a_span">';
                        html += categories[i].Children[j].Children[m].Name;
                        html += '</span>';
                        html += '</a>';
                        html += '</li>';
                    }
                    html += '</ul>';
                }
                html += '</li>';

                
            }
            html += '</ul>';
        }
        html += '</li>';
    }
    $('.result_left_ul').html(html);


    $('a.result_left_ul_item_a').click(function (e) {
        if ($(this).is('.a')) {
            $(this).toggleClass('left_downs');
            $(this).siblings('ul').toggle();
        }
    })

    $('li.result_left_ul_item').click(function (e) {//first
        $(this).siblings().children('a').removeClass('result_left_ul_item_active');
        $('li.result_left_ul_item_ul_item').children('a').removeClass('result_left_ul_item_active');
        $('li.result_left_ul_item_ul_item_ul_item').children('a').removeClass('result_left_ul_item_active');
        $(this).children('a').addClass('result_left_ul_item_active');

        $('#folderId').html($(this).attr('id'));
        GetListData(1, listPageSize,true);
    })

    $('li.result_left_ul_item_ul_item').click(function (e) {//second
        $(this).siblings().children('a').removeClass('result_left_ul_item_active');
        $('li.result_left_ul_item').children('a').removeClass('result_left_ul_item_active');
        $('li.result_left_ul_item_ul_item_ul_item').children('a').removeClass('result_left_ul_item_active');
        $(this).children('a').addClass('result_left_ul_item_active');
        stopBubble(e);
        $('#folderId').html($(this).attr('id'));
        GetListData(1, listPageSize,true);
    });
    $('li.result_left_ul_item_ul_item_ul_item').click(function (e) {//third
        $(this).siblings().children('a').removeClass('result_left_ul_item_active');
        $('li.result_left_ul_item').children('a').removeClass('result_left_ul_item_active');
        $('li.result_left_ul_item_ul_item').children('a').removeClass('result_left_ul_item_active');
        $(this).children('a').addClass('result_left_ul_item_active');

        stopBubble(e);
        $('#folderId').html($(this).attr('id'));
        GetListData(1, listPageSize, true);
    });
}

function SetLeftMenuActive() {
    var folderId = $('#folderId').html().toLowerCase();
    var shouldActive = $('li.result_left_ul_item[id="' + folderId + '"]');
    if (folderId!='unread') {
        shouldActive.siblings().children('a').removeClass('result_left_ul_item_active left_downs');
        $('li.result_left_ul_item').removeClass('result_left_ul_item_active left_downs');
        shouldActive.children('a').addClass('result_left_ul_item_active left_downs');

        $('li.result_left_ul_item[id="' + folderId + '"] .result_left_ul_item_ul').show();
        $('li.result_left_ul_item[id="' + folderId + '"] .result_left_ul_item_ul .result_left_ul_item_ul_item_ul').hide();
    }
    
}

function BuildListHTML(listData) {

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

        var classname = ''
        if (listData[i].ReadStatus == 0) {
            classname = 'active'
        }
        if (listData[i].IsImportant == 'True') {
            classname += 'is-important'
        }
        html += '<tr>';
        html += '<td class="view_tbody_title">';//<span class="te">特</span>
        
        //html += '<a target="_blank" href="/apps/scontent/PreviewContent.aspx?id=' + listData[i].ContentId + '">';
        html += '<a class="' + classname + '" target="_blank" href="/portal/viewArticle.aspx?id=' + listData[i].ContentId + '&location1name='+(listData[i].CategoryName|| listData[i].FolderIdName)+'">';
        
        html += listData[i].Title; 
        html += '</a>';
        html += '</td>';
        html += '<td>';
        html += listData[i].CreatedOn;
        html += '</td>';
        html += '<td>';
        html += listData[i].CategoryName ? listData[i].CategoryName : (listData[i].FolderIdName?listData[i].FolderIdName:'');
        html += '</td>';
        html += '<td>';
        html += listData[i].DeptName ? listData[i].DeptName:(listData[i].BusinessUnitIdName?listData[i].BusinessUnitIdName:'');
        html += '</td>';
        html += '<td>';
        html += listData[i].FullName ? listData[i].FullName:(listData[i].CreatedByName?listData[i].CreatedByName:'');
        html += '</td>';

        html += '</tr>';
    }
    $('.view_tbody').html(html);
}

function GetIconByName(name) {
    switch (name) {
        case '新闻动态':
            return 'new_dynamic';
            break;
        case '通知公告':
            return 'announcement';
            break;
        case '文件制度':
            return 'Document_system';
            break;
        case '院务公开':
            return 'Open_government';
            break;
        case '党务公开':
            return 'Open_party';
            break;
        case '院刊专线':
            return 'Academic';
            break;
        case '下载中心':
            return 'Download';
            break;
        case '学习园地':
            return 'Learning';
            break;
        default:
            return 'Document_system';
    }
}

function convert(array) {
    var map = {};
    for (var i = 0; i < array.length; i++) {

        var obj = array[i];
        obj.items = [];

        map[obj.itemid] = obj;

        var parent = obj.parentid || '-';
        if (!map[parent]) {
            map[parent] = {
                items: []
            };
        }
        map[parent].items.push(obj);
    }

    return map['-'].items;

}

function FilterListData(pageNumber, pageSize, newCreatePage) {

    var title_filter = $('#title_filter').val();
    var srch_StartDate = $('#srch_StartDate').val();
    var srch_EndDate = $('#srch_EndDate').val();
    var auto_filter = $('#auto_filter').val();
    var businessUnit_lkid = $('#businessUnit_lkid').val();
    var contentTypeCode = $('#contentTypeCode').val();
    var data={
        title_filter: title_filter,
        srch_StartDate: srch_StartDate,
        srch_EndDate:srch_EndDate,
        auto_filter: auto_filter,
        contentTypeCode:contentTypeCode,
        businessUnit_lkid: businessUnit_lkid,
        pageNumber: pageNumber,            
        pageSize: pageSize
    }
    var folderId = $('#folderId').html();
    var url = "/apps/CommandProcessor.ashx?cmd=content.news.list.filter";
    if (folderId == 'unread') {
        data = {
            ReadStatus:0,
            title_filter: title_filter,
            srch_StartDate: srch_StartDate,
            srch_EndDate: srch_EndDate,
            auto_filter: auto_filter,
            contentTypeCode: contentTypeCode,
            businessUnit_lkid: businessUnit_lkid,
            PageNumber: pageNumber,
            rowsPerPage: pageSize
        }
        url = '/apps/CommandProcessor.ashx?cmd=content.unread.search'
    }
    jQuery.ajax({
        url: url,
        type: "GET",
        async: true,
        dataType: "json",
        data: data,
        success: function (data) {
            $("#totalCount").html(data.totalCount || data.total);
            $("#totalPages").html(data.totalPages || Math.ceil(data.total / 15));
            $(".numbers").html(data.totalCount || data.total);

            BuildListHTML(data.listData || data.rows);
            if (newCreatePage) {
                var timeStamp = Math.floor(Date.now());

                $(".zxf_pagediv").html('<div id="' + timeStamp + '">');
                $("#" + timeStamp + "").createPage({
                    pageNum: data.totalPages || Math.ceil(data.total / 15),
                    current: pageNumber,
                    backfun: function (e) {
                        var pagenum = $('.current').html();
                        FilterListData(pagenum, pageSize, false)
                    }
                });
            }
        }
    });
}

function CreatePager() {

}

function ResetFilter() {
    var title_filter = $('#title_filter').val('');
    var auto_filter = $('#auto_filter').val('');
    var businessUnit_lkid = $('#businessUnit_lkid').val('');
    $('#srch_StartDate').val('');
    $('#srch_EndDate').val('');
    $('#businessUnit_lkold').val('');
    $('#businessUnit').val('');
    
}

function stopBubble(e) {
    //如果提供了事件对象，则这是一个非IE浏览器 
    if (e && e.stopPropagation)
        //因此它支持W3C的stopPropagation()方法 
        e.stopPropagation();
    else
        //否则，我们需要使用IE的方式来取消事件冒泡 
        window.event.cancelBubble = true;
}

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = location.search.substr(1).match(reg);
    if (r != null) return unescape(decodeURI(r[2])); return null;
}