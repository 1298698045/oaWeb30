var indexlayer = null;
function opensuggestion(name, that) {
    var left = $(that).offset().left
    var top = $(that).offset().top-330
    if ($('#suggestionboxstyle').length == 0) {
        $('body').append('<style id="suggestionboxstyle">.deletesuggestion{cursor:pointer;line-height:34px;float:right;font-size:12px;color:#108def;}#suggestionbox .bgrow{background-color:#f2f2f2} #suggestionbox ul div{cursor:pointer;padding:5px 10px;}#suggestionbox ul{max-height:200px;overflow:auto;}#suggestionbox ul div:hover{background-color:#f2f2f2;}#suggestionbox .suggestionboxaddbtn{margin:20px 10px 0 10px;}.layui-layer-content{padding:0 !important;}.suggestionboxaddinputbox{padding:20px 10px 0 10px;display:none;}</style>')
    }
    //获取数据
    var suggestionitem = getsuggestion(name)
    indexlayer = layer.open({
        offset:[top,left],
        shade: 0,
        title: '选择意见',
        btn: [],
        content: '<div id="suggestionbox"><ul>'
                         + suggestionitem
                         + '</ul><div onclick="startadd()" class ="suggestionboxaddbtn layui-btn layui-btn-sm layui-btn-normal">创建意见</div><div class ="suggestionboxaddinputbox"><input onkeyup="finishaddsuggestion(event,\''+name+'\')" id="suggestionboxaddinput" type="text" name="title" required lay-verify="required" placeholder="回车完成创建,Esc取消创建" autocomplete="off" class ="layui-input"></div></div>'
    });
    $(document).keyup(function(e) {
        if (e.keyCode == 27) {
            $('.suggestionboxaddbtn').show()
            $('.suggestionboxaddinputbox').hide()
        }
    })
}
function getsuggestion(name) {
    var html = ''
    ajaxMethodGetAsyncData('workflow.suggestion.mine.getlist',null, false, function (data) {
        $('#suggestionbox ul').html('')
        for (var i = 0; i < data.rows.length; i++) {
            // var item = window['cb_' + name]
            var item = data.rows[i].Name;
            var itemid = data.rows[i].LIST_RECORD_ID;
            var seq = (i + 1);
            var className = ''
            if (i % 2 == 0) {
                className = 'bgrow'
            }
            var type = data.rows[i].SuggestionType
            html += '<div class="' + className + '" onclick="chosesuggestion(\'' + name + '\',\'' + item + '\')"><span class="number">' + seq + '.</span>' + item
            if (type == 0) {
                html += '<span onclick=deletesuggestion(event,\'' + itemid + '\',this) class="deletesuggestion">删除</span>'
            }
            html += '</div>'
        }
    })
    return html

}
function deletesuggestion(event,id,that) {
    ajaxMethodGetData('entity.delete', { id: id, objTypeCode: 130 }, function (data) {
        $(that).parent().remove()
        $('#suggestionbox ul>div').each(function () {
            $(this).find('.number').html(($(this).index()+1)+'.')
        })
    })
    event.stopPropagation()
}
function finishaddsuggestion(e, name) {
    if (e.keyCode == 13) {
        $('.suggestionboxaddbtn').show()
        $('.suggestionboxaddinputbox').hide()
        var value = $('#suggestionboxaddinput').val()
        var messages = {
            params: {
                recordRep: {
                    objTypeCode: 130,
                    fields: {
                        Name: value,
                        SuggestionType:0
                    }
                }
            }
        }
        messages = JSON.stringify(messages)
        ajaxMethodGetData('entity.saverecord', { messages: messages }, function (data) {
            var suggestionitem = getsuggestion(name)
            $('#suggestionbox ul').html(suggestionitem)
        })
    }
}
function startadd() {
    $('.suggestionboxaddbtn').hide()
    $('.suggestionboxaddinputbox').show()
}
function chosesuggestion(name, value) {
    //$('textarea[name=' + name + ']').value(value);
    document.getElementById(name).value = document.getElementById(name).value + value;
    layer.close(indexlayer)
}