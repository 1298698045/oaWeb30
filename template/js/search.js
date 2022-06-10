
var seachdata = []
function searchcont(that) {
    seachdata = []
    $(that).parents('.search-cont').find('.search-group').each(function () {
        var name = $(this).attr('name')
        var search = $(this).attr('search')
        if (search == undefined) {
            search = ''
        }
        if ($(this).attr('type') == 'text') {
            search = $(this).find('input').val()
        }
        var data = {}
        data[name] = search
        seachdata.push(data)
    })
}


function creatsearchdom() {
    $('.search-group').each(function () {
        if ($(this).attr('type') == 'text') {
            $(this).append('<div class="search-name">' + $(this).attr('text') + ':</div>'
                + '<div class="search-input">'
                    + '<input type="text" placeholder="请输入搜索字符"/>'
                + '</div>')
        }
        else if ($(this).attr('type') == 'select') {
        }
        else if ($(this).attr('type') == 'search') {
            $(this).append('<div class="search-name">' + $(this).attr('text') + ':</div>'
                + '<div class="search-input">'
                    + '<input type="hidden" />'
                    + '<input data-object="' + $(this).attr('data-object') + '" class="search-text" type="text" placeholder="请输入搜索字符"/>'
                    + '<img src="/img/images/02.1-1.Search_.png"/>'
                    + '<div class="search-lookup"><ul></ul></div>'
                + '</div>')
        }
        else if ($(this).attr('type') == 'time') {
            var index = $(this).index()
            $(this).append('<div class="search-name">' + $(this).attr('text') + ':</div>'
                + '<div class="search-input">'
                    + '<input class="time-chook' + index + '" type="text" placeholder="请选择时间"/>'
                + '</div>')
            laydate.render({
                elem: '.time-chook' + index,
                done: function (value) {
                    $('.time-chook' + index).parents('.search-group').attr('value', value)
                    searchcont()
                }
            });
        }
    })
}

$('.search-group').each(function () {
    if ($(this).attr('type') == 'text') {
        $(this).append('<div class="search-name">'+$(this).attr('text')+':</div>'
            +'<div class="search-input">'
                +'<input type="text" placeholder="请输入搜索字符"/>'
            +'</div>')
    }
    else if ($(this).attr('type') == 'select') {
    }
    else if ($(this).attr('type') == 'search') {
        $(this).append('<div class="search-name">' + $(this).attr('text') + ':</div>'
            + '<div class="search-input">'
                + '<input type="hidden" />'
                + '<input data-object="' + $(this).attr('data-object') + '" class="search-text" type="text" placeholder="请输入搜索字符"/>'
                + '<img src="/img/images/02.1-1.Search_.png"/>'
                + '<div class="search-lookup"><ul></ul></div>'
            + '</div>')
    }
    else if ($(this).attr('type') == 'time') {
        var index = $(this).index()
        $(this).append('<div class="search-name">'+$(this).attr('text')+':</div>'
            +'<div class="search-input">'
                + '<input class="time-chook' + index + '" type="text" placeholder="请选择时间"/>'
            + '</div>')
        laydate.render({
            elem: '.time-chook' + index,
            done: function (value) {
                $('.time-chook' + index).parents('.search-group').attr('value', value)
                searchcont()
            }
        });
    }
})