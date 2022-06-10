

$('.objectManagerLeftNav').append('<div class="filterbox">'
    +'    <div class="filter-content">'
    +'        <div class="filter-content-head">'
    +'            <div class="filter-content-head-title">'
    +'                筛选器'
    +'            </div>'
    +'            <div class="filter-content-head-closebtn">'
    +'                <img src="/img/cal/closegray.png"/>'
    +'            </div>'
    +'        </div>'
    +'        <div class="filter-content-head-save">'
    +'            <div class="filter-quite">取消</div>'
    +'            <div class="filter-savedown">'
    +'                <img src="/img/cal/20.png"/>'
    +'            </div>'
    +'            <div class="filter-save">保存</div>'
    +'            <div class="filter-savedown-content">'
    +'                <ul>'
    + '                    <li id="exportOrgs">另存为</li>'
    +'                </ul>'
    +'            </div>'
    +'        </div>'
    +'        <div class="filter-content-body">'
    +'            <div class="filter-content-body-title">匹配所有这些筛选器</div>'
    +'            <div class="filter-content-body-list">'
    +'                <ul>'
    +'                    <li class="filter-item" onclick="editrows(this)">'
    +'                        <span class="filter-item-number">1.</span>'
    +'                        <div class="filter-item-main">'
    +'                            <div class="filter-item-name">收款类型</div>'
    +'                            <div class="filter-item-predicate">'
    +'                                <span class="filter-item-operator">大于</span>'
    +'                                <span class="filter-item-value">付款合同</span>'
    +'                            </div>'
    +'                            <div class="filter-item-delete">'
    +'                                <img src="/img/cal/closegray.png" onclick="deleteitem(this)" />'
    +'                            </div>'
    +'                        </div>'
    +'                    </li>'
    +'                </ul>'
    +'            </div>'
    +'        </div>'
    +'        <div class="filter-content-foot">'
    +'            <div class="addbtn">添加筛选器</div>'
    +'            <div class="deletebtn">全部删除</div>'
    +'        </div>'
    +'    </div>'
    +'    <div class="addfiltercontent">'
    +'        <form class="layui-form" action="">'
    +'            <div class="addfiltercontent-body">'
    +'                <div class="addfiltercontent-attributes">'
    +'                    <span class="form-title">字段</span>'
    +'                    <select lay-filter="attributeschook" lay-verify="required" id="attributeschook" name="city" lay-search>'
    +'                        <option value="">请选择</option>'
    +'                    </select>'
    +'                </div>'
    +'                <div class="addfiltercontent-operator">'
    +'                    <span class="form-title">运算符</span>'
    +'                    <select lay-filter="operatorchook" lay-verify="required" id="operatorchook" name="city" lay-search>'
    +'                        <option value="">请选择</option>'
    +'                    </select>'
    +'                </div>'
    +'                <div class="addfiltercontent-value">'
    +'                    <span class="form-title">值</span>'
    +'                    <div id="addfiltercontent-text">'
    +'                        <input type="text" name="title" required lay-verify="required" placeholder="请输入值" autocomplete="off" class="layui-input">'
    +'                    </div>'
    +'                    <div id="addfiltercontent-datetime">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time1">'
    +'                    </div>'
    +'                    <div id="addfiltercontent-date">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time2">'
    +'                    </div>'
    +'                    <div id="addfiltercontent-scopedatetime">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time3">'
    +'                    </div>'
    +'                    <div id="addfiltercontent-year">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time4">'
    +'                    </div>'
    +'                    <div id="addfiltercontent-month">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time5">'
    +'                    </div>'

    +'                    <div id="addfiltercontent-inday">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time6">'
    +'                    </div>'
    +'                    <div id="addfiltercontent-inmonth">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time7">'
    +'                    </div>'
    +'                    <div id="addfiltercontent-inmonthday">'
    +'                        <input type="text" class="layui-input" id="addfiltercontent-time8">'
    +'                    </div>'

    +'                    <div id="addfiltercontent-Picklist">'
    +'                        <div></div>'
    + '                    </div>'
    + '                    <div id="addfiltercontent-DroplistText">'
    + '                        <div id="DroplistTextvalue">'
    + '                            <span></span>'
    + '                            <img class="downimg" src="/img/images/02.1-1.Search_.png"/>'
    + '                        </div>'
    + '                        <div id="DroplistTextoptions">'
    + '                            <ul>'
    + '                            </ul>'
    + '                        </div>'
    + '                    </div>'
    + '                    <div id="addfiltercontent-searchDroplistText">'
    + '                        <div id="searchDroplistTextvalue">'
    + '                            <span></span>'
    + '                            <input></input>'
    + '                            <img class="downimg" src="/img/images/02.1-1.Search_.png"/>'
    + '                        </div>'
    + '                        <div id="searchDroplistTextoptions">'
    + '                            <ul>'
    + '                            </ul>'
    + '                        </div>'
    + '                    </div>'
    +'                     <div id="addfiltercontent-checkbox">'
    + '                        <div style="padding-left:10px;"><input lay-ignore type="checkbox"></div>'
    +'                    </div>'
    +'                </div>'
    +'            </div>'
    +'        </form>'
    +'        <div class="addfiltercontent-foot">'
    +'            <div class="addfiltercontent-foot-finish">完成</div>'
    +'        </div>'
    +'    </div>'
    +'</div>')




$(document).click(function () {
    $('.filter-savedown-content').hide()
    $('#DroplistTextoptions').hide()
    $('#searchDroplistTextoptions').hide()
    //$('.addfiltercontent').hide()
})
$('.filter-savedown').click(function () {
    $('.filter-savedown-content').show()
    return false
})
function deleteitem(that) {
    $(that).parents('.filter-item').remove()
    clearattributes()
    $('.addfiltercontent').hide()
    $('.filter-content-head').hide()
    $('.filter-content-head-save').show()
    window.event ? window.event.cancelBubble = true : e.stopPropagation();
}
$('.deletebtn').click(function () {
    $('.filter-item').remove()
    clearattributes()
    $('.addfiltercontent').hide()
    $('.filter-content-head').hide()
    $('.filter-content-head-save').show()
})

$('.filter-quite').click(function () {
    getfilter()
    $('.filter-content-head-save').hide()
    $('.filter-content-head').show()
})

$('.addbtn').click(function (e) {
    settop($(this))
    $('.addfiltercontent').show()
    if ($('.newfilter-item').length == 0) {
        $('.filter-content-body-list ul').append('<li onclick="editrows(this)" class="filter-item newfilter-item">'
                + '    <span class="filter-item-number">' + (Number($('.filter-content-body-list ul li').length) + 1) + '.</span>'
                + '    <div class="filter-item-main">'
                + '        <div class="filter-item-name">字段名</div>'
                + '        <div class="filter-item-predicate">'
                + '            <span class="filter-item-operator">运算符</span>'
                + '            <span class="filter-item-value">值</span>'
                + '        </div>'
                + '        <div class="filter-item-delete">'
                + '            <img src="/img/cal/closegray.png" onclick="deleteitem(this)">'
                + '        </div>'
                + '    </div>'
                + '</li>')
    }
    
    return false
})
$('#DroplistTextvalue').click(function () {
    $('#DroplistTextoptions').show()
    $('#DroplistTextoptions').css('top', -$('#DroplistTextoptions').height()-5+'px')
    return false

})
$('.addfiltercontent-foot-finish').click(function () {
    var namehtml = $('#attributeschook').next().find('input').val()
    var name = $('#attributeschook').val()
    var operatorhtml = $('#operatorchook').next().find('input').val()
    var operator = $('#operatorchook').val()
    var value = $('.valuecontnet').attr('value')
    var valuehtml = ''
    if ($('span.valuecontnet').length) {
        valuehtml = $('span.valuecontnet').html()
    } else if ($('.valuecontnet[type="checkbox"]').length > 0) {
        if ($('.valuecontnet::checked').length > 0) {
            valuehtml = '是'
            value='true'
        } else {
            valuehtml = '否'
            value = 'false'
        }
    } else {
        valuehtml = value
    }

    if ($('#searchDroplistTextvalue').find('.valuecontnet').length>0) {
        valuehtml = $('.valuecontnet').prev().attr('ename')
        value = $('.valuecontnet').prev().attr('name')
    }
    $('.addfiltercontent').hide()
    $('.newfilter-item .filter-item-name').html(namehtml)
    $('.newfilter-item .filter-item-name').attr('value', name)
    $('.newfilter-item .filter-item-operator').html(operatorhtml)
    $('.newfilter-item .filter-item-operator').attr('value', operator)
    $('.newfilter-item .filter-item-value').html(valuehtml)
    $('.newfilter-item .filter-item-value').attr('value', value)
    $('.newfilter-item').removeClass('newfilter-item')

    clearattributes()
    $('.filter-content-head').hide()
    $('.filter-content-head-save').show()
})


var gridFilter = {
    edattribute: [],
    checkedattribute: {},
    filter: []
}



var form = ''
layui.use(['form'], function () {
    form = layui.form

    layui.use('laydate', function () {
        var laydate = layui.laydate
        laydate.render({
            elem: '#addfiltercontent-time1',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm:ss',
            trigger: 'click'
        });
        laydate.render({
            elem: '#addfiltercontent-time2',
            type: 'date',
            format: 'yyyy-MM-dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#addfiltercontent-time3',
            type: 'datetime',
            format: 'yyyy-MM-dd HH:mm:ss',
            trigger: 'click',
            range: true,
            done: function (value) {
            }
        });
        laydate.render({
            elem: '#addfiltercontent-time4',
            type: 'year',
            format: 'yyyy',
            trigger: 'click'
        });
        laydate.render({
            elem: '#addfiltercontent-time5',
            type: 'month',
            format: 'yyyy-MM',
            trigger: 'click'
        });

        laydate.render({
            elem: '#addfiltercontent-time6',
            type: 'date',
            format: 'dd',
            trigger: 'click'
        });
        laydate.render({
            elem: '#addfiltercontent-time7',
            type: 'month',
            format: 'MM',
            trigger: 'click'
        });
        laydate.render({
            elem: '#addfiltercontent-time8',
            type: 'date',
            format: 'MM-dd',
            trigger: 'click'
        });

    });

    form.on('select(attributeschook)', function (data) {
        attributeschookchange(data)

    });

    form.on('select(operatorchook)', function (data) {
        operatorchookchange(data)
    });


});
function operatorchookchange(data) {
    $('.valuecontnet').removeClass('valuecontnet')
    $('.addfiltercontent-value>div').hide()
    if (gridFilter.checkedattribute.dType == 'Picklist' || gridFilter.checkedattribute.dType == 'DroplistText') {
        $('#DroplistTextoptions ul').html('')
        $('#addfiltercontent-DroplistText').show()
        $('#addfiltercontent-DroplistText').find('span').addClass('valuecontnet')
        for (var i = 0; i < gridFilter.checkedattribute.filterValues.length; i++) {
            $('#DroplistTextoptions ul').append('<li value="' + gridFilter.checkedattribute.filterValues[i].name + '"><span>' + gridFilter.checkedattribute.filterValues[i].label + '</span><img src="/img/cal/checked.png"/></li>')
        }
        choosevalue()
    } else if (gridFilter.checkedattribute.dType == 'DateTime') {
        $('#addfiltercontent-datetime').show()
        $('#addfiltercontent-datetime input').addClass('valuecontnet')
    } else if (gridFilter.checkedattribute.dType == 'Date') {
        $('#addfiltercontent-date').show()
        $('#addfiltercontent-date input').addClass('valuecontnet')
    } else if (gridFilter.checkedattribute.dType == 'Year') {
        $('#addfiltercontent-year').show()
        $('#addfiltercontent-year input').addClass('valuecontnet')
    } else if (gridFilter.checkedattribute.dType == 'Month') {
        $('#addfiltercontent-month').show()
        $('#addfiltercontent-month input').addClass('valuecontnet')
    } else if (gridFilter.checkedattribute.dType == 'CheckBox') {
        $('#addfiltercontent-checkbox').show()
        $('#addfiltercontent-checkbox input').addClass('valuecontnet')
    } else if (gridFilter.checkedattribute.dType == 'User' || gridFilter.checkedattribute.dType == 'BusinessUnit') {
        $('#addfiltercontent-searchDroplistText').show()
        $('#addfiltercontent-searchDroplistText input').addClass('valuecontnet').attr('Lktp', gridFilter.checkedattribute.referencedEntityObjectTypeCode).click(function () {
            $('#searchDroplistTextoptions').show()
            getlookup()
            return false;
        });
        $('#searchDroplistTextvalue .downimg').click(function () {
            //$('#searchDroplistTextoptions').show()
            //$('#addfiltercontent-searchDroplistText input').focus();
            getlookup()
            var lktp = $(this).prev().attr('lktp')
            if (lktp == 30020 || lktp == 8) {
                var url = '/_ui/common/data/invite_UserLookResult.html'
                opencenterwindow(url, '选择人员', 1200, 600)
            } else if (lktp == 10) {
                var url = '/alert/deptchose.html?type=opener'
                opencenterwindow(url, '选择部门', 1200, 600)
                //$('.popup-mask').show()
                //$('#iframe').show().height(520).css('margin-top','-260px').attr('src',url)
            }
            return false;
        })
        $('#searchDroplistTextvalue>input').keyup(function (e) {
            if (e.keyCode == '13') {
                getlookup()
            }
        })
    } else {
        $('#addfiltercontent-text').show()
        $('#addfiltercontent-text input').addClass('valuecontnet')
    }

    if (data.value == 'between' && (gridFilter.checkedattribute.dType == 'DateTime' || gridFilter.checkedattribute.dType == 'Date')) {
        $('.valuecontnet').removeClass('valuecontnet')

        $('.addfiltercontent-value>div').hide()
        $('#addfiltercontent-scopedatetime').show()
        $('#addfiltercontent-scopedatetime input').addClass('valuecontnet')
    }
    if (data.value == 'in_day') {
        $('.valuecontnet').removeClass('valuecontnet')

        $('.addfiltercontent-value>div').hide()
        $('#addfiltercontent-inday').show()
        $('#addfiltercontent-inday input').addClass('valuecontnet')
    }
    if (data.value == 'in_month') {
        $('.valuecontnet').removeClass('valuecontnet')

        $('.addfiltercontent-value>div').hide()
        $('#addfiltercontent-inmonth').show()
        $('#addfiltercontent-inmonth input').addClass('valuecontnet')
    }
    if (data.value == 'in_monthday') {
        $('.valuecontnet').removeClass('valuecontnet')

        $('.addfiltercontent-value>div').hide()
        $('#addfiltercontent-inmonthday').show()
        $('#addfiltercontent-inmonthday input').addClass('valuecontnet')
    }

}
function choosedept(ids, names) {
    filterchoselookup(ids, names)
}
function invitepeople(ids, names) {
    filterchoselookup(ids, names)
}
function filterchoselookup(ids, names) {
    console.log(ids, names)
    var checkedid = $('#searchDroplistTextvalue>span').attr('name')
    var checkedname = $('#searchDroplistTextvalue>span').attr('ename')
    if (checkedid) {
        for (var i = 0; i < ids.length; i++) {
            if (checkedid.indexOf(ids[i]) == -1) {
                if (checkedid.length > 0) {
                    checkedid += ',' + ids[i]
                    checkedname += ',' + names[i]
                } else {
                    checkedid = ids[i]
                    checkedname = names[i]
                }
            }
        }
    }
    else {
        for (var i = 0; i < ids.length; i++) {
                if (checkedid.length > 0) {
                    checkedid += ',' + ids[i]
                    checkedname += ',' + names[i]
                } else {
                    checkedid = ids[i]
                    checkedname = names[i]
                }
        }
    }
    $('#searchDroplistTextvalue>span').attr('name', checkedid)
    $('#searchDroplistTextvalue>span').attr('ename', checkedname)
    if (checkedname) {
        if (names.length > 1) {
            $('#searchDroplistTextvalue>span').html('已选择数量：' + checkedname.split(',').length)
        } else {
            $('#searchDroplistTextvalue>span').html(names.join(','))
        }
    }
    if (names.length > 0) {
        $('#searchDroplistTextvalue>input').width(150)
    }
}
function getlookup() {
    var lksrch = $('.valuecontnet').val()
    var Lktp = $('.valuecontnet').attr('Lktp')
    ajaxMethodGetData('ui.entity.lookup', {
        Lktp: Lktp,
        lksrch: lksrch
    }, function (data) {
        $('#searchDroplistTextoptions ul li').not('.active').remove()
        $('#searchDroplistTextoptions ul li').off()
        for (var i = 0; i < data.listData.length; i++) {
            var res = data.listData[i]
            if ($('#searchDroplistTextoptions ul li.active').length > 0) {
                for (var j = 0; j < $('#searchDroplistTextoptions ul li.active').length; j++) {
                    if ($('#searchDroplistTextoptions ul li.active').eq(j).attr('name') == res.ID) {
                        break
                    }
                    if (j == $('#searchDroplistTextoptions ul li.active').length - 1) {
                        $('#searchDroplistTextoptions ul').append('<li name="' + res.ID + '"><span>' + res.Name + '</span><img src="/img/cal/checked.png"></li>')
                    }
                }
            } else {
                $('#searchDroplistTextoptions ul').append('<li name="' + res.ID + '"><span>' + res.Name + '</span><img src="/img/cal/checked.png"></li>')
            }
        }
        $('#searchDroplistTextoptions').css('top', -$('#searchDroplistTextoptions').height()- 5 + 'px')
        chosesearchvalue()
    })
}
function attributeschookchange(data) {
    for (var i = 0; i < gridFilter.edattribute.length; i++) {
        if ($('#attributeschook').val() == gridFilter.edattribute[i].name) {
            gridFilter.checkedattribute = gridFilter.edattribute[i]
            setoperator()
            break
        }
    }
    $('#searchDroplistTextoptions ul').html('')
    $('#searchDroplistTextvalue span').html('')
    $('#searchDroplistTextvalue span').attr('name', '')
    $('#searchDroplistTextvalue span').attr('ename', '')
}
$(document).ready(function () {
    getfilter()

})

//获取筛选器
function getfilter() {
    if (grid) {
        ajaxMethodGetData('entity.filter.get', { id: grid.filterId }, function (data) {
            if (data&&data.entity) {
                gridFilter.edattribute = data.entity.attributes
                gridFilter.filter = data.filter
                $('#attributeschook').html('<option value="">请选择</option>')
                for (var i = 0; i < data.entity.attributes.length; i++) {
                    var res = data.entity.attributes[i]
                    $('#attributeschook').append('<option value="' + res.name + '">' + res.label + '</option>')
                }
            }
            
            if (form.render) {
                form.render();
            }
            $('.filter-item').remove()
            if (gridFilter.filter[0]) {
                var filter = gridFilter.filter[0].FilterExpression
                if (filter != '') {
                    filter = JSON.parse(filter)
                    for (var i = 0; i < filter.length; i++) {
                        var res = filter[i]
                        var label = res.label
                        var logical = res.logical
                        var value = res.value
                        var picklistValues = res.picklistValues
                        if (picklistValues.length > 0) {
                            value = picklistValues.join(',')
                        }
                        var attribute = res.attribute
                        var operator = res.operator
                        var operands = res.operands
                        $('.filter-content-body-list ul').append('<li class="filter-item" onclick="editrows(this)">'
                            + '<span class="filter-item-number">' + (i + 1) + '.</span>'
                            + '<div class="filter-item-main">'
                            + '<div class="filter-item-name" value="' + attribute + '">' + label + '</div>'
                            + '<div class="filter-item-predicate">'
                            + '<span class="filter-item-operator" value="' + operator + '">' + logical + '</span>&nbsp&nbsp'
                            + '<span class="filter-item-value"  value="' + operands + '">' + value + '</span>'
                            + '</div>'
                            + '<div class="filter-item-delete">'
                            + '<img src="/img/cal/closegray.png" onclick="deleteitem(this)">'
                            + '</div>'
                            + '</div>'
                            + '</li>')
                    }
                }
            }
        })
    }
    
}

function setoperator() {
    $('.addfiltercontent-value>div').hide()
    $('#addfiltercontent-text').show()
    $('.addfiltercontent-value input').val('')
    $('#DroplistTextvalue span').attr('value', '').html('')
    $('#operatorchook').html('<option value="">请选择</option>')
    for (var i = 0; i < gridFilter.checkedattribute.operator.length; i++) {
        var res = gridFilter.checkedattribute.operator[i]
        $('#operatorchook').append('<option value="' + res.operator + '">' + res.label + '</option>')
    }
    form.render();
}

function setvalue() {
    console.log(gridFilter)
}

function choosevalue() {
    $('#DroplistTextoptions li').click(function () {
        var that = this
        $(that).toggleClass('active')
        var items = $(that).parent().find('li.active')
        var names = []
        var values = []
        for (var i = 0; i < $(that).parent().find('li.active').length; i++) {
            values.push($(that).parent().find('li.active').eq(i).attr('value'))
            names.push($(that).parent().find('li.active').eq(i).find('span').html())
        }
        $('#DroplistTextvalue span').html()
        $('#DroplistTextvalue span').html(names.join(','))
        $('#DroplistTextvalue span').attr('value', values.join(','))
        return false;
    })
}

function chosesearchvalue() {
    $('#searchDroplistTextoptions li').click(function () {
        var that = this
        $(that).toggleClass('active')
        var items = $(that).parent().find('li.active')
        var names = []
        var values = []
        for (var i = 0; i < $(that).parent().find('li.active').length; i++) {
            values.push($(that).parent().find('li.active').eq(i).attr('name'))
            names.push($(that).parent().find('li.active').eq(i).find('span').html())
        }
        if (names.length > 1) {
            $('#searchDroplistTextvalue>span').html('已选择数量：' + names.length)
        } else {
            $('#searchDroplistTextvalue>span').html(names.join(','))
        }
        if (names.length > 0) {
            $('#searchDroplistTextvalue>input').width(150)
        }
        $('#searchDroplistTextvalue>span').attr('name', values.join(','))
        $('#searchDroplistTextvalue>span').attr('ename', names.join(','))
        return false;
    })
}

function clearattributes() {
    $('#attributeschook').val('')
    $('#attributeschook').next().find('input').val('')
    $('#operatorchook').val('')
    $('#operatorchook').html('')
    $('#operatorchook').next().find('input').val('')
    $('#operatorchook').next().find('dd').remove()
    $('.addfiltercontent-value>div').hide()
    $('#addfiltercontent-text').show().val('')
    $('.valuecontnet').val('')
}

function editrows(that) {
    settop($(that))
    $('.newfilter-item').removeClass('newfilter-item')
    $(that).addClass('newfilter-item')

    var namehtml = $(that).find('.filter-item-name').html()
    var name = $(that).find('.filter-item-name').attr('value')

    var operatorhtml = $(that).find('.filter-item-operator').html()
    var operator = $(that).find('.filter-item-operator').attr('value')

    var valuehtml = $(that).find('.filter-item-value').html()
    var value = $(that).find('.filter-item-value').attr('value')

    $('.addfiltercontent').show()
    $('#attributeschook').val(name)
    $('#attributeschook').next().find('input').val(namehtml)

    attributeschookchange()

    $('#operatorchook').val(operator)
    $('#operatorchook').next().find('input').val(operatorhtml)

    operatorchookchange({ value: operator })

    if ($('span.valuecontnet').length > 0) {
        $('.valuecontnet').attr('value', value)
        $('.valuecontnet').html(valuehtml)
        var value = value.split(',')
        for (var i = 0; i < value.length; i++) {
            $('#DroplistTextoptions li[value="' + value[i] + '"]').addClass('active')
        }
    } else {
        if (value == 'true') {
            $('.valuecontnet').attr('checked', 'checked')
        } else if (operator == 'between' && value.indexOf(':')!=-1) {
            $('.valuecontnet').val(value.split(',').join(' - '))
        }else{
            $('.valuecontnet').val(value)

        
        }
    }
    if ($('#searchDroplistTextvalue .valuecontnet').length > 0) {
        var length = valuehtml.split(',').length
        if (length > 1) {
            $('.valuecontnet').prev().attr('name', value)
            $('.valuecontnet').prev().html('已选择数量：' + length)
            $('.valuecontnet').prev().attr('ename', valuehtml)

            $('.valuecontnet').width(150)
            $('.valuecontnet').val('')
        } else {
            $('.valuecontnet').prev().attr('name', value)
            $('.valuecontnet').prev().attr('ename', valuehtml)
            $('.valuecontnet').prev().html(valuehtml)
            $('.valuecontnet').val('')
            $('.valuecontnet').width(150)
        }
        $('#searchDroplistTextoptions ul').html('')
        for (var i = 0; i < length; i++) {
            $('#searchDroplistTextoptions ul').append('<li class="active" name="' + value.split(',')[i] + '"><span>' + valuehtml.split(',')[i]+ '</span><img src="/img/cal/checked.png"></li>')
        }

    }


}

//设置弹层top
function settop(dom) {
    var top = $(dom).offset().top
    var margin = 0

    if (top > 150+186) {
        top = top - 150-186
    } else {
        top = 10
    }

    if (top + 350+186 > $(window).height()) {
        top = $(window).height() - 350-186
    }
    $('.addfiltercontent').css({
        "top": top
    })

}

//点击筛选器
var girdwidth = $('body').width()
if ($('#treePanel').length > 0) {
    girdwidth = girdwidth - 239 
}
$('.shaixuan').click(function () {
    if ($(this).hasClass('active')) {
        $(this).removeClass('active')
        $('.filterbox').hide()
        $(this).find('img').attr('src', '/img/cal/22.filterList_2(14x14).png')
        $('#gridContainer').width(girdwidth)
        $('#datagrid').datagrid('resize')
    } else {
        $(this).addClass('active')
        $('.filterbox').show()
        $(this).find('img').attr('src', '/img/cal/22.filterList_3(14x14).png')
        $('#gridContainer').width(girdwidth - 358)
        $('#datagrid').datagrid('resize')
    }
})

$('.filter-content-head-closebtn').click(function () {
    $('.shaixuan').removeClass('active')
    $('.shaixuan').find('img').attr('src', '/img/cal/22.filterList_2(14x14).png')
    $('.filterbox').hide()

    $('#gridContainer').width(girdwidth)
    $('#datagrid').datagrid('resize')
    
})

//获取列表视图
$('.header-left-title .selectinput').one('click', function () {
    getFilterList()  
})
//保存筛选器
function savefilter() {
    var filterExpression = []
    for (var i = 0; i < $('.filter-item').length; i++) {
        var attribute = $('.filter-item').eq(i).find('.filter-item-name').attr('value')
        var label = $('.filter-item').eq(i).find('.filter-item-name').html()

        var operator = $('.filter-item').eq(i).find('.filter-item-operator').attr('value')
        var logical = $('.filter-item').eq(i).find('.filter-item-operator').html()

        var picklistValues = $('.filter-item').eq(i).find('.filter-item-value').html()
        var operands = $('.filter-item').eq(i).find('.filter-item-value').attr('value')

        if (picklistValues.indexOf(',') != -1) {
            picklistValues = picklistValues.split(',')
        } else {
            picklistValues = [picklistValues]
        }

        if (operator == 'between' && operands.indexOf(' - ') != -1) {
            operands = [operands.split(' - ')[0], operands.split(' - ')[1]]
            picklistValues = operands
        }else if (operands.indexOf(',') != -1) {
            operands = operands.split(',')
        } else {
            operands = [operands]
        }

        filterExpression.push({
            sort: i,
            attribute: attribute,
            label: label,
            operator: operator,
            logical: logical,
            value: '',
            picklistValues: picklistValues,
            isEditable: true,
            column: attribute,
            operands: operands,
            id: i
        })

    }
    filterExpression = JSON.stringify(filterExpression)

    var filterId = webContext.defaultFilterId;

    var d = {
        id: filterId,
        ObjectTypeCode: webContext.objectTypeCode,
        filterExpression: filterExpression
    };

    $('.filter-content-head-save').hide()
    $('.filter-content-head').show()
    ajaxMethodPostData("entity.filter.expression.save", d, function (data) {
        getfilter()
        $('#datagrid').datagrid('reload')
    });
}
$('.filter-save').click(function () {
    savefilter()
})




//迁移旧版本

function showFilterDesinger() {
}
$('#gridContainer').width(girdwidth)


$('#delete').click(function () {
    $('.popup-mask').show()
    $('#changeDiv').show()
    $('#iframe').show().attr('src', '/alert/filter/delete_ie8.html').height(280).css('margin-top', '-140px');
})

$('#Show_zi').click(function () {
    $('.popup-mask').show()
    $('#changeDiv').show()
    $('#iframe').show().attr('src', '/alert/filter/show_ie8.html').height(560).width(840).css({
        'margin-top': '-280px',
        'margin-left': '-420px',
        'left':'50%'
    })
});
$('#menuitem').click(function(){
    $('.popup-mask').show()
    $('#changeDiv').show()
    $('#iframe').show().attr('src', '/alert/filter/new_ie8.html').height(610).css('margin-top', '-300px');
})
$('#exportOrgs').click(function () {
    $('#changeDiv').show()
    $('#iframe').attr('src', '/alert/filter/new_ie8.html?type=newfilter3').height(610).css('margin-top', '-300px');;
    $('#iframe').show();
    $('.popup-mask').show()
}); 
$('#New_name').click(function () {
    $('#changeDiv').show()
    $('.popup-mask').show()
    $('#iframe').show().attr('src', '/alert/filter/New_name_ie8.html').height(310).css('margin-top', '-150px');
})
$('#copy').click(function () {
    $('#changeDiv').show()
    $('.popup-mask').show()
    $('#iframe').show().attr('src', '/alert/filter/copy_ie8.html').height(610).css('margin-top', '-300px');
});
$('#share').click(function () {
    $('#changeDiv').show()
    $('.popup-mask').show()
    $('#iframe').show().attr('src', '/alert/filter/share_ie8.html').height(610).css('margin-top', '-300px');
});
$('#print').click(function () {
    var id = $('.header-left-title-listname.selectinput span').attr('filterid')
    var url = '/apps/CommandProcessor.ashx?cmd=filter.exportfile&id=' + id
    var search = $('#srchText').val()
    if (search && search != '') {
        url += '&search=' + search
    }
    //window.open(url)
    var data = {}
    var filterQuery = grid.filterQuery
    if (filterQuery) {
        data.filterQuery = filterQuery
    }
    openWindowWithPost(url, data)
})
$('.new-btn').click(function () {
    var entityName = webContext.entityApiName
    $('#changeDiv').show()
    $('.popup-mask').show()
    $('#iframe').attr('src', '/layouteditor/add_layout_ie8.html?entityName=' + entityName).show().height(620).css('margin-top', '-310px')

})
function edit(id) {
    var entityName = webContext.entityApiName
    $('#changeDiv').show()
    $('.popup-mask').show()
    $('#iframe').attr('src', '/layouteditor/add_layout_ie8.html?id=' + id + '&entityName=' + entityName).show().height(620).css('margin-top', '-310px')
}
$('body style').eq(0).append('.hightsearch-point{width:20px;height:20px;position:absolute;top:-5px;transform:rotate(45deg);border:1px solid #dedede;border:0 \9;background-color:white;background-color:transparent \9;}.layui-form::after{clear:both;content:"";display:block;}#hightsearch-content{padding:0 !important;padding-bottom:20px !important;}#hightsearch-content .layui-form{padding:20px 10px 0 10px;position:relative;z-index:2;background-color:white;width:900px;}#hightsearch-content{position:absolute;z-index:1000;right:20px;top:170px;background-color:white;box-shadow:0 0 2px #ccc;padding:20px 10px}#hightsearch-content .searchselect{margin-left:0}#hightsearch-content .layui-form-item{float:left;width:300px !important;clear:none}#hightsearch-content .searchselect{position:relative}#hightsearch-content .searchimg{position:absolute;top:10px;right:10px;width:14px;height:14px}#hightsearch-content .searchselect .layui-edge{display:none}#hightsearch-content .layui-form-selectup dl{top:42px;bottom:auto}#hightsearch-content .buttonbtn-group{float:right}')
$('.shaixuan').after('<div style="position: relative;" class="buttonbtn hightsearch" title="高级搜索"><img style="width:16px;height:16px;width: 14px;position: absolute;top: 8px;left: 8px;" src="/img/cal/7.PNG" alt=""></div>')
$('.shaixuand').after('<div style="position: relative;" class="buttonbtn hightsearch" title="高级搜索"><img style="width:16px;height:16px;width: 14px;position: absolute;top: 8px;left: 8px;" src="/img/cal/7.PNG" alt=""></div>')
$('.hightsearch').click(function () {
    var right = $(window).width() - $(this).offset().left - 20 - 16 - 10
    if ($('#hightsearch-content').length == 0) {
        $('body').append('<div id="hightsearch-content"><div style="right:' + right + 'px" class="hightsearch-point"></div><div class="layui-form"></div><div style="margin:0 5px"  class="buttonbtn-group"><div onclick="heightsearch()" class="buttonbtn"><a >搜索</a></div></div><div class="buttonbtn-group" onclick="clearsearch()"><div class="buttonbtn"><a>重置</a></div></div></div>')
        getlookupfilter()
    } else {
        $('#hightsearch-content').toggle()
    }
    return false;
})

function clearsearch() {
    $('#hightsearch-content .layui-input').val('')
    $('#hightsearch-content').find('input').val('')
    $('#hightsearch-content').find('select').val('')
}


function heightsearch() {
    var filterquery = ''
    for (var i = 0; i < $('#hightsearch-content .layui-form-item').length; i++) {
        if ($('#hightsearch-content .layui-form-item').eq(i).find('select').length > 0) {
            if ($('#hightsearch-content .layui-form-item').eq(i).find('select').val() != '') {
                var name = $('#hightsearch-content .layui-form-item').eq(i).find('select').attr('name')
                var value = $('#hightsearch-content .layui-form-item').eq(i).find('select').val()
                if (value == '自定义') {
                    value = $('#hightsearch-content .layui-form-item').eq(i).find('select').next().next().val()
                }
                var value1 = value.split(' - ')[0]
                var value2 = value.split(' - ')[1]
                
                if (value2) {
                    filterquery += '\n' + name + '\tge\t' + value1
                    filterquery += '\n' + name + '\tle\t' + value2
                }
                else {
                    filterquery += '\n' + name + '\teq\t' + value
                }
                
            }
        } else {
            if ($('#hightsearch-content .layui-form-item').eq(i).find('input').val() != '') {
                var name = $('#hightsearch-content .layui-form-item').eq(i).find('input').attr('name')
                var value = $('#hightsearch-content .layui-form-item').eq(i).find('input').val()
                var num = $('#hightsearch-content .layui-form-item').eq(i).find('input').attr('num')
                var value1 = value.split(' - ')[0]
                var value2 = value.split(' - ')[1]
                if (value2) {
                    filterquery += '\n' + name + '\tge\t' + value1
                    filterquery += '\n' + name + '\tle\t' + value2
                }
                else if (num == 'ge') {
                    filterquery += '\n' + name + '\tge\t' + value
                    filterquery += '\n' + name + '\tle\t' + $('#hightsearch-content .layui-form-item').eq(i).find('input').eq(1).val()
                }
                else {
                    filterquery += '\n' + name + '\tcontains\t' + value
                }
            }
        }
    }
    $('#hightsearch-content').hide()
    GridInstance.search(filterquery)
    
}
$(document).click(function (e) {
    if ($(e.target).parents('#hightsearch-content').length == 0) {
        if(!$(e.target).hasClass('layui-input')){

            $('#hightsearch-content').hide()
        }
    }
})



var timeoperator = [{
    label: '今天',
    value: 'today'
}, {
    label: '昨天',
    value: 'yesterday'
}, {
    label: '明天',
    value: 'tomorrow'
}, {
    label: '本周',
    value: 'this-week'
}, {
    label: '本月',
    value: 'this-month'
}, {
    label: '上月',
    value: 'last-month'
}, {
    label: '下月',
    value: 'next-month'
}, {
    label: '今年',
    value: 'this-year'
}, {
    label: '去年',
    value: 'last-year'
}, {
    label: '本月生日',
    value: 'birthday-this-month'
}, ]


var hightsearchdata = {
    select: {

    }
}
function getlookupfilter() {
    ajaxMethodGetAsyncData('entity.detail.get', { objtypecode: window.webContext.objectTypeCode }, false, function (data) {
        hightsearchdata.select = data.context.picklistValuesMap
    })
    ajaxMethodGetAsyncData('entity.lookupfilter.getlist', { objectTypeCode: window.webContext.objectTypeCode }, false, function (data) {
        var searchform = []
        for (var i = 0; i < data.returnValue.SearchFields.length; i++) {
            var item = data.returnValue.SearchFields[i]
            searchform.push({
                label: item.Label,
                name: item.Name,
                placeholder: "请填写内容",
                type: item.DataType,
                objtypecode: item.ReferencedEntityObjectTypeCode
            })
        }

        for (var i = 0; i < searchform.length; i++) {
            var res = searchform[i]
            var html = '<div class="layui-form-item">'
                        + '<label class="layui-form-label">' + res.label + '：</label>'
                        + '<div class="layui-input-block">'
            if (res.type == 'S') {
                html += '<input type="text" name="' + res.name + '" placeholder="' + res.placeholder + '" autocomplete="off" class="layui-input">'
            } else if (res.type == 'L' || res.type == 'LT' || res.type == 'DT') {
                html += '<select lay-search name="' + res.name + '" lay-verify="">'
                     + '<option value="">' + res.placeholder + '</option>'
                for (var j = 0; j < hightsearchdata.select[res.name].length; j++) {
                    var option = hightsearchdata.select[res.name][j]
                    html += '<option value="' + option.value + '">' + option.label + '</option>'
                }
                html += '</select>'
            } else if (res.type == 'Year') {
                html += '<input placeholder="请选择年份" datatype="Year" id="laydate' + item.name + i + '" class="laydate layui-input"  name="' + res.name + '" />'
            } else if (res.type == 'Month') {
                html += '<select  name="' + res.name + '" lay-verify="">'
                     + '<option value="">' + res.placeholder + '</option>'
                for (var j = 0; j < 12; j++) {
                    html += '<option value="' + (j+1) + '">' + (j+1)+ '月</option>'
                }
                html += '</select>'
            } else if (res.type == 'D' || res.type == 'F') {
                html += '<select lay-filter="timechook" name="' + res.name + '" lay-verify="">'
                     + '<option value="">' + res.placeholder + '</option>'
                for (var j = 0; j < timeoperator.length; j++) {
                    var option = timeoperator[j]
                    if (option) {
                        html += '<option value="' + option.value + '">' + option.label + '</option>'
                    } else {
                        html += '<option value=""></option>'
                    }
                }
                html += '<option value="自定义">自定义</option>'

                html += '</select>'
                html += '<input style="display:none" placeholder="请选择时间" datatype="' + res.type + '" id="laydate' + item.name + i + '" class="laydate layui-input"  name="' + res.name + '" />'
            } else if (res.type == 'O' || res.type == 'Y' || res.type == 'U' || res.type == 'Y_MD') {
                html += '<div Lktp="' + res.objtypecode + '" class="layui-input-block searchselect">'
                    + '<select id="select' + item.name + res.name + '" lay-search lay-verify="" name="' + res.name + '"><option value="">请选择</option></select>'
                html += ' <img title="' + res.label + '" class="searchimg" src="/img/images/02.1-1.Search_.png" />'
            } else if (res.type == 'ZD' || res.type == 'ZF') {
                html += '<input placeholder="请选择时间" datatype="' + res.type + '" id="laydate' + item.name + i + '" class="laydate layui-input" autocomplete="off"  name="' + res.name + '" />'
            } else if (res.type == 'N') {
                html += '<input style="width:80px;display:inline-block;" type="text" name="' + res.name + '" placeholder="请输入"  onkeyup="value=zhzs(this.value)" lay-verify="required|number"  class="layui-input" autocomplete="off" pattern="\d" maxlength="9" num="ge" />'
                html += '&nbsp;&nbsp;至&nbsp;&nbsp;<input style="width:80px;display:inline-block;" type="text" name="' + res.name + '" placeholder="请输入"  onkeyup="value=zhzs(this.value)" lay-verify="required|number"  class="layui-input" autocomplete="off" pattern="\d" maxlength="9" num="le" />'
            } else {
                html += '<input type="text" name="' + res.name + '" placeholder="' + res.placeholder + '" autocomplete="off" class="layui-input">'

            }
            html += '</div>'
                    + '</div>'
            $('#hightsearch-content .layui-form').append(html)
            $('.searchimg').off().click(function () {
                formcomponents.chooselookup($(this).parents('.searchselect').attr('Lktp'), $(this).parents('.searchselect').find('select').attr('id'), $(this).attr('title'))
            })
        }

        layui.use(['element', 'form', 'laydate'], function () {
            var laydate = layui.laydate
            layoutelement = layui.element;
            layoutform = layui.form;
            layoutform.on('select(timechook)', function (data) {
                if (data.value == '自定义') {
                    $(data.othis).next().show()
                } else {
                    $(data.othis).next().hide()

                }
            });

            $('.laydate').each(function () {
                var id = $(this).attr('id')
                var datatype = $(this).attr('datatype')
                if (datatype == 'D') {
                    laydate.render({
                        elem: '#' + id,
                        format: 'yyyy-MM-dd',
                        trigger: 'click',
                        range: true,
                        done: function (value) {
                        }
                    });
                } else if (datatype == 'ZD') {
                    laydate.render({
                        elem: '#' + id,
                        format: 'yyyy-MM-dd',
                        trigger: 'click',
                        range: true,
                        done: function (value) {
                        }
                    });
                } else if (datatype == 'F') {
                    laydate.render({
                        elem: '#' + id,
                        type: 'datetime',
                        format: 'yyyy-MM-dd HH:mm:ss',
                        trigger: 'click',
                        range: true,
                        done: function (value) {
                        }
                    });
                } else if (datatype == 'ZF') {
                    laydate.render({
                        elem: '#' + id,
                        type: 'datetime',
                        format: 'yyyy-MM-dd HH:mm:ss',
                        trigger: 'click',
                        range: true,
                        done: function (value) {
                        }
                    });
                } else if (datatype == 'Year') {
                    laydate.render({
                        elem: '#' + id,
                        type: 'year',
                        format: 'yyyy',
                        trigger: 'click',

                        done: function (value) {
                        }
                    });
                } else if (datatype == 'Month') {
                    laydate.render({
                        elem: '#' + id,
                        type: 'month',
                        format: 'yyyy-MM',
                        trigger: 'click',

                        done: function (value) {
                        }
                    });
                }
            })
            layoutform.render()

        });

        
        formcomponents.getlookup()
        
    })
}
function zhzs(value) {

    value = value.replace(/[^\d]/g, '');
    if ('' != value) {
        value = parseInt(value);
    }
    return value;
}
var formcomponents = {
    getlookup: function () {
        $('.searchselect').click(function () {
            var that = this
            d = {
                Lktp: $(that).attr('Lktp')
            }
            formcomponents.searchlookup(d, that)
            $(this).find('input').off()
            formcomponents.selectredner(that)
        })
    },
    selectredner: function (that) {
        var flag = true;
        $(that).find('input').on('compositionstart', function () {
            flag = false;
        })
        $(that).find('input').on('compositionend', function () {
            flag = true;
        })
        $(that).find('input').keyup(function (key) {
            if (key.keyCode == 13) {
                chooselookup($(that).attr('Lktp'), $(that).find('select').attr('id'), $(that).find('.searchimg').attr('title'), $(this).val())
            } else if ($(this).val() != '' && flag) {
                d = {
                    Lktp: $(that).attr('Lktp'),
                    Lksrch: $(this).val()
                }
                formcomponents.searchlookup(d, that)
            }
        })
    },
    searchlookup: function (d, that) {
        ajaxMethodGetData('ui.entity.lookup', d, function (data) {
            var selectvalue = $(that).find('select').val()
            var inputvalue = $(that).find('input').val()
            $(that).find('select').html('<option value="">请选择</option>')
            for (var i = 0; i < data.listData.length; i++) {
                $(that).find('select').append('<option value="' + data.listData[i].ID + '">' + data.listData[i].Name + '</option>')
            }
            //if (selectvalue != '') {
            //    $(that).find('select').find('option[value="' + selectvalue + '"]').remove()
            //    $(that).find('select').append('<option selected value="' + selectvalue + '">' + inputvalue + '</option>')
            //}
            layoutform.render()
            formcomponents.selectredner(that)
            if (d.Lksrch) {
                $(that).find('input').val(d.Lksrch).focus()
            } else {
                $(that).find('input').focus()
            }
            $(that).find('.layui-form-select').addClass('layui-form-selected').addClass('layui-form-selectup')
        })
    },
    chooselookup: function (objtypecode, name, title, search) {
        if (objtypecode == '8') {
            opencenterwindow('/_ui/common/data/UserLookResult.aspx?type=relatedchhoose&lknm=' + name, '', 1150, 600)
        } else if (objtypecode == '10') {
            opencenterwindow('/alert/deptchose_form.html?type=relatedchhoose&lknm=' + name, '', 750, 520)
        } else {
            if ($('#iframe').length == 0) {
                $('body').append('<iframe id="iframe" frameborder="0" src=""></iframe><div class="popup-mask"></div>')
                $('body style').eq(0).append('body #iframe{position:fixed;background-color:white;width:60%;left:20%;top:50%;margin-top:-300px;border-radius:7px;display:block;height:620px;border:0;overflow:hidden;z-index:9999;display:none}.popup-mask{display:none;position:fixed;background-color:transparent;width:100%;height:100%;top:0;z-index:999;left:0;position:fixed;background:url(/img/bgOverlayDialogBackground.png);background-color:transparent}')
            }
            $('#changeDiv').show()
            $('#iframe').show().attr('src', '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=' + title + '&search=' + search).height(640).css('margin-top', '-320px')
            $('.popup-mask').show()
        }
    },
    lookupPick: function (controlName, valId, valName) {
        setTimeout(function () {
            $('#' + controlName).find('option[value="' + valId + '"]').remove()
            $('#' + controlName).append('<option selected value="' + valId + '">' + valName + '</option>')
            $('#' + controlName).attr('layvalue', valId)
            $('#' + controlName).attr('value', valId)
            $('#' + controlName).next().find('input').val(valName)
        }, 300)
    },
    chooselookups: function (objtypecode, name, title, search) {
        if (objtypecode == '8') {
            opencenterwindow('/_ui/common/data/UserLookResult.aspx?type=relatedchhoose&lknm=' + name, '', 1150, 600)
        } else if (objtypecode == '10') {
            opencenterwindow('/alert/deptchose_form.html?type=relatedchhoose&lknm=' + name, '', 750, 520)
        } else {
            if ($('#iframe').length == 0) {
                $('body').append('<iframe id="iframe" frameborder="0" src=""></iframe><div class="popup-mask"></div>')
                $('body style').eq(0).append('body #iframe{position:fixed;background-color:white;width:60%;left:20%;top:50%;margin-top:-300px;border-radius:7px;display:block;height:620px;border:0;overflow:hidden;z-index:9999;display:none}.popup-mask{display:none;position:fixed;background-color:transparent;width:100%;height:100%;top:0;z-index:999;left:0;position:fixed;background:url(/img/bgOverlayDialogBackground.png);background-color:transparent}')
            }
            $('#changeDiv').show()
            $('#iframe').show().attr('src', '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=' + title + '&search=' + search).height(640).css('margin-top', '-320px')
            $('.popup-mask').show()
        }
    }
}