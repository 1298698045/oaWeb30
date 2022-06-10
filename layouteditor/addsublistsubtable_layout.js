//表格数据的模拟数据（后续从接口请求）
var data = [{ username: '名称1', ContractType: '1',people:'' }]







//所有表格配置
var sublistsubtabletemplate = {
    text1: {
        cols: [{field: 'id', title: 'ID', width: 40, type:'checkbox'},
            {field: 'id', title: '序号', width: 50,type:'numbers' },
            {
                field: 'username',
                title: '名称',
                width: 80,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'text')
                }
            },
            {
                field: 'ContractType',
                title: '类型',
                width: 120,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'select', 'text1', 'ContractType')
                }
            },
            {
                field: 'date',
                title: '时间',
                width: 120,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'date', 'text1', 'date')
                }
            },
            {
                field: 'people',
                title: '人员',
                width: 220,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'lookup', 'text1', 'people','8')
                }
            }
        ]
    }, text2: {
        cols: [{ field: 'id', title: 'ID', width: 40,  type: 'checkbox' },
            { field: 'id', title: '序号', width: 50,  type: 'numbers' },
            {
                field: 'username',
                title: '名称',
                width: 80,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'text')
                }
            },
            {
                field: 'ContractType',
                title: '类型',
                width: 120,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'select', 'text1', 'ContractType')
                }
            },
            {
                field: 'date',
                title: '时间',
                width: 120,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'date', 'text1', 'date')
                }
            },
            {
                field: 'people',
                title: '人员',
                width: 220,
                templet: function (d) {
                    return sublistsubtableformatOper(d, 'lookup', 'text1', 'people', '8')
                }
            }
        ]
    }
}


//本页所展现的表格
var sublistsubtabledata = [{
    name: 'text1',
    objtypecode: '1010'
},{
    name: 'text2',
    objtypecode: '1010'
}]
$(document).ready(function () {
    if (window.edititem != 'edititem') {
        getrelatedlistinfos()
        getrelatedrecords()
    }
    if ($('.sublistsubtable').length == 0) {
        $('.body-left').append('<div class="sublistsubtable"></div>')
    }
    for (var i = 0; i < sublistsubtabledata.length; i++) {
        var html = '<table style="clear:both" objectTypeCode="' + sublistsubtabledata[i].objectTypeCode + '" id="' + sublistsubtabledata[i].relatedSObject + '" lay-filter="' + sublistsubtabledata[i].label + '"></table>'
                           + '    <div style="clear:both;">'
                           + '    </div>'
                           + '</div></div>'
        if (typeof canedit == 'undefined') {
            html = '<div class="body-item section-body"><div class="body-item-head">'
           + sublistsubtabledata[i].label
           + '</div><div class="item divs">'
           + '<div class="tablebtn">'
           + '<span title="添加行" class="layui-icon layui-icon-addition"></span>'
           + '<span title="删除行" class="layui-icon layui-icon-subtraction"></span>'
           + '<span title="复制行" class="layui-icon layui-icon-templeate-1"></span>'
           + '</div>'
            +html
        } else {
            html ='<div class="body-item section-body"><div class="body-item-head">'
           + sublistsubtabledata[i].label
           + '</div>'
           + html
        }
        $('.sublistsubtable').append(html)


        if (window.edititem != 'edititem') {
            ajaxMethodGetAsyncData('entity.detail.get', { objtypecode: sublistsubtabledata[i].objectTypeCode }, false, function (data) {
                sublistsubtabletemplate[sublistsubtabledata[i].relatedSObject].selectdata = data.context.picklistValuesMap
            })
        }
        

        $('.layui-icon-addition:last').click(function () {
            var dom = $(this).parents('.item').find('.layui-table-body tbody').eq(0)
            dom.append(dom.find('tr:last').clone(true))
            dom.find('tr:last').find('td[data-field="Id"]').find('div').html('')
            dom.find('tr:last').find('td').each(function () {
                $(this).find('input').val('')
                $(this).find('select').val('')
                $(this).find('option').removeAttr('selected')
                $(this).find('.laytable-cell-numbers')
            })
            rendecellrnumbers(dom)
            var dom1 = $(this).parents('.item').find('.layui-table-fixed tbody').eq(0)
            dom1.append(dom1.find('tr:last').clone(true))
            dom1.find('tr:last').find('td[data-field="Id"]').find('div').html('')
            rendecellrnumbers(dom1)
            
        })
        $('.layui-icon-subtraction:last').click(function () {
            var dom = $(this).parents('.item').find('.layui-table-body tbody').eq(0)
            dom.find('.laytable-cell-checkbox .layui-form-checked').each(function () {
                if ($(this).parents('tr').index() == '0' && $(this).parents('tr').parent().find('tr').length == 1) {
                    $(this).parents('tr').find('input').val('')
                    $(this).parents('tr').find('select').val('')
                } else {
                    $(this).parents('tr').remove()
                }
            })
            rendecellrnumbers(dom)
        })

        $('.layui-icon-templeate-1:last').click(function () {

            var dom = $(this).parents('.item').find('.layui-table-body tbody').eq(0)
            dom.find('select').each(function () {
                if ($(this).val() != '') {
                    $(this).find('option[value="' + $(this).val() + '"]').attr('selected', 'selected')
                }
            })
            dom.find('.laytable-cell-checkbox .layui-form-checked').each(function () {
                dom.append($(this).parents('tr').clone(true))
                dom.find('.laytable-cell-checkbox input:last').prop('checked', '')
            })
            rendecellrnumbers(dom)
        })
    }
    createdtable()

})

function getrelatedlistinfos() {
    ajaxMethodGetAsyncData('entity.relatedlistinfos.get', { objectTypeCode: getQueryString('objectTypeCode') }, false, function (data) {
        sublistsubtabledata = data.actions[0].returnValue.relatedLists
        if (typeof pagetype !='undefined') {
            if (pagetype == 'tabs') {
                createdtabspage(data.actions[0].returnValue.relatedLists)
            }
        }
    })
}
function getrelatedrecords() {
    ajaxMethodGetAsyncData('entity.relatedrecords.get', { objectTypeCode: getQueryString('objectTypeCode'), id: getQueryString('id') }, false, function (data) {
        var listItems = data.actions[0].returnValue.listItems
        var recordIds = data.actions[0].returnValue.recordIds
        var records = data.actions[0].returnValue.records
        for (item in listItems) {
            var cols =[{ field: '0', title: '序号', width: 50, type: 'numbers' }]
            if (typeof canedit == 'undefined') {
                cols.unshift({ field: '0', title: 'ID', width: 40, type: 'checkbox' })
                cols.unshift({ field: 'id', title: 'ID', width: 40, hide:'true' })
            }
            sublistsubtabletemplate[item] = {
                cols: cols,
                data:[]
            }
            for (var i = 0; i < listItems[item].length; i++) {
                var field = listItems[item][i].field
                sublistsubtabletemplate[item].cols.push({
                    field: field,
                    title: listItems[item][i].title,
                    name: item,
                    objtypecode: listItems[item][i].sobjectType,
                    type: listItems[item][i].dType,
                    templet: function (d) {
                        return sublistsubtableformatOper(d)
                    }
                })
            }
            for (var i = 0; i < recordIds[item].recordIds.length; i++) {
                var key = recordIds[item].recordIds[i]
                var row = {
                    id:key
                }
                for (var field in records[key][item].record.fields) {
                    row[field] = records[key][item].record.fields[field]
                }
                sublistsubtabletemplate[item].data.push(row)
            }
        }
    })
}



function rendecellrnumbers(dom) {
    formcomponents.layoutform.render()
    $(dom).find('.laytable-cell-numbers').each(function () {
        $(this).html($(this).parents('tr').index() + 1)
        $(this).parents('tr').attr('data-index', $(this).parents('tr').index())
    })

    //$(".layui-table-body .layui-unselect.layui-form-checkbox").off('click')
    //$(".layui-table-body .layui-unselect.layui-form-checkbox").click(function () {
    //    $(this).toggleClass('layui-form-checked');
    //    var checkednum = $(".layui-table-fixed .layui-table-body").find(".layui-form-checked").length;
    //    var sum = $(".layui-table-fixed .layui-table-body").find("tr").length;
    //    console.log(checkednum, sum);
    //    if (checkednum == sum) {
    //        $(".layui-table-header .layui-unselect.layui-form-checkbox").removeClass('layui-form-checked');
    //        $(".layui-table-header .layui-unselect.layui-form-checkbox").addClass('layui-form-checked');
    //    }
    //    else {
    //        $(".layui-table-header .layui-unselect.layui-form-checkbox").removeClass('layui-form-checked');
    //    }
    //    var checkednum1 = $(".layui-table-body").eq(0).find(".layui-form-checked").length;
    //    var sum1 = $(".layui-table-body").eq(0).find("tr").length;
    //    console.log(checkednum1, sum1);
    //    if (checkednum1 == sum1) {
    //        $(".layui-table-header .layui-unselect.layui-form-checkbox").removeClass('layui-form-checked');
    //        $(".layui-table-header .layui-unselect.layui-form-checkbox").addClass('layui-form-checked');
    //    }
    //    else {
    //        $(".layui-table-header .layui-unselect.layui-form-checkbox").removeClass('layui-form-checked');
    //    }
    //})

}

//格式化单元格
function sublistsubtableformatOper(d, val) {
    if (typeof canedit == 'undefined') {
        var field = d.LAY_COL.field
        var name = d.LAY_COL.name
        var type = d.LAY_COL.type
        var objtypecode = d.LAY_COL.objtypecode
        var value = d[d.LAY_COL.field].displayValue
        var valueid = d[d.LAY_COL.field].value

        var disabled = 'nodisabled'
        var idstring = name + '_' + field + '_' + d.LAY_INDEX
        var classname = ''
        var verify = d.LAY_COL.required ? 'required' : ''
        var html = ''
        if (type == 'S') {
            html += '<input value="' + value + '" id="' + idstring + '" ' + disabled + '="disabled" type="text" name="' + idstring + '"  autocomplete="off" class="tableinput layui-input ' + classname + '">'
        } else if (type == 'N') {
            html += '<input type="number" value="' + value + '" id="' + idstring + '" ' + disabled + '="disabled" type="text" name="' + idstring + '"  autocomplete="off" class="tableinput layui-input ' + classname + '">'
        } else if (type == 'z') {
            html += ' <textarea value="' + value + '"id="' + idstring + '" class="ckeditcontent" ' + disabled + '="disabled"id="' + idstring + '" name="' + idstring + '" class="tableinput layui-textarea ' + classname + '"></textarea>'
        } else if (type == 'X' || type == 'J') {
            html += ' <textarea value="' + value + '"id="' + idstring + '" ' + disabled + '="disabled" name="' + idstring + '" class="tableinput layui-textarea ' + classname + '"></textarea>'
        } else if (type == 'D') {
            html += '<input value="' + value + '"id="' + idstring + '" ' + disabled + '="disabled" datatype="D" id="laydate_' + idstring + '" class="tableinput laydate ' + classname + '" name="' + idstring + '" lay-verify="' + verify + '" />'
        } else if (type == 'Year') {
            html += '<input value="' + value + '"id="' + idstring + '" ' + disabled + '="disabled" datatype="Year" id="laydate_' + idstring + '" class="tableinput laydate ' + classname + '" name="' + idstring + '" lay-verify="' + verify + '" />'
        } else if (type == 'Month') {
            html += '<input value="' + value + '"id="' + idstring + '" ' + disabled + '="disabled" datatype="Month" id="laydate_' + idstring + '" class="tableinput laydate ' + classname + '" name="' + idstring + '" lay-verify="' + verify + '" />'
        } else if (type == 'F') {
            html += '<input value="' + value + '"id="' + idstring + '" ' + disabled + '="disabled" datatype="F" id="laydate_' + idstring + '" class="tableinput laydate ' + classname + '" name="' + idstring + '" lay-verify="' + verify + '" />'
        } else if (type == 'L' || type == 'DT' || type == 'LT') {
            var selecthtml = ''
           // console.log(name);
            //console.log(field);
            var options = sublistsubtabletemplate[name].selectdata[field];            
            if (options) {
                for (var i = 0; i < options.length; i++) {
                    var selected = ''
                    if (options[i].value == valueid) {
                        selected = 'selected'
                    }
                    selecthtml += '<option ' + selected + ' value="' + options[i].value + '">' + options[i].label + '</option>'
                }
            }
            html += '<select value="' + value + '"class="tableinput"  lay-verify="' + verify + '"><option value="">请选择</option>' + selecthtml + '</select>'
        } else if (type == 'O' || type == 'Y_MD' || type == 'Y' || type == 'U') {
            html += '<div Lktp="' + objtypecode + '" class="layui-input-block searchselect">'
            html += '<select value="' + valueid + '"id="select_' + name + '_' + field + '_' + d.LAY_INDEX + '" lay-search lay-verify="' + verify + '" name="' + idstring + '"><option value="">请选择</option>'
            if (valueid != '') {
                html += '<option selected  value="' + valueid + '">' + value + '</option>'
            }
            html += '</select>'
            html += ' <img class="searchimg" src="/img/images/02.1-1.Search_.png" />'
            html += '</div>'
        }
        else if (type == 'MC' || type == 'B') {
            html += '<div class="tableinput layui-input-block"><input value="' + value + '"id="' + idstring + '" ' + disabled + '="disabled" type="checkbox" name="' + idstring + '" lay-skin="primary"></div>'
        } else {
            html += '<input value="' + value + '"id="' + idstring + '" ' + disabled + '="disabled"  name="' + idstring + '"  class="tableinput ' + classname + '">'
        }
        return html
    } else {
        return d[d.LAY_COL.field].displayValue
    }  
}



var layuitable = []
function createdtable() {
    layui.use(['form', 'table'], function () {
        form = layui.form
        for (var i = 0; i < sublistsubtabledata.length; i++) {
            layuitable[i] = layui.table;
            var cols = sublistsubtabletemplate[sublistsubtabledata[i].relatedSObject] && sublistsubtabletemplate[sublistsubtabledata[i].relatedSObject].cols ? sublistsubtabletemplate[sublistsubtabledata[i].relatedSObject].cols : []
            var data = sublistsubtabletemplate[sublistsubtabledata[i].relatedSObject] && sublistsubtabletemplate[sublistsubtabledata[i].relatedSObject].data ? sublistsubtabletemplate[sublistsubtabledata[i].relatedSObject].data : []
            if (data.length == 0) {
                data[0] = {
                }
                for (var j = 0; j < cols.length; j++) {
                    if (cols[j].field != '') {
                        data[0][cols[j].field] = {
                            displayValue: '',
                            value: ''
                        }
                    }
                    
                }
                data[0].id=''
            }
            //执行渲染
            layuitable[i].render({
                elem: '#' + sublistsubtabledata[i].relatedSObject
                , data: data
                , cols: [cols],
            });
        }

        form.render()
        formcomponents.layoutform = form
        formcomponents.formcomponents = formcomponents
        formcomponents.getlookup(formcomponents)
        
        $('.searchimg').click(function () {
            formcomponents.chooselookups($(this).parents('.searchselect').attr('Lktp'), $(this).parents('.searchselect').find('select').attr('id'), $(this).attr('title'))
        })
        
        $('.laydate').each(function () {
            var id = $(this).attr('id')
            var datatype = $(this).attr('datatype')
            if (datatype == 'D') {
                laydate.render({
                    elem: '#' + id,
                    format: 'yyyy-MM-dd',
                    trigger: 'click'

                });
            } else if (datatype == 'F') {
                laydate.render({
                    elem: '#' + id,
                    type: 'datetime',
                    format: 'yyyy-MM-dd HH:mm',
                    trigger: 'click'
                });
            } else if (datatype == 'Year') {
                laydate.render({
                    elem: '#' + id,
                    type: 'year',
                    format: 'yyyy',
                    trigger: 'click'
                });
            } else if (datatype == 'Month') {
                laydate.render({
                    elem: '#' + id,
                    type: 'month',
                    format: 'yyyy-MM',
                    trigger:'click'
                });
            }

        })

    });
}
function lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id) {
    var lookupAttributeName2 = lookupAttributeName
    if (lookupAttributeName.indexOf('select_') != '-1') {
        lookupAttributeName2 = lookupAttributeName.split('_')[2]
    }
    ajaxMethodGetData('entity.attributelookup.inputrequest', {
        lookupObjectTypeCode: lookupObjectTypeCode,
        ObjectTypeCode: ObjectTypeCode,
        lookupAttributeName: lookupAttributeName2,
        id: id
    }, function (data) {
        var item = 'asdasdsad'
        var res = data.actions[0].returnValue.changeValues
        for (item in res) {
            var name = item
            if (lookupAttributeName.indexOf('select_') != '-1') {
                name = lookupAttributeName.replace(lookupAttributeName2, item)
            }
            if (res[item] != null) {
                if (res[item].Id) {
                    $('#' + name).val(res[item].Id)
                    $('#' + name).next().find('input').val(res[item].Name)
                } else {
                    $('#' + name).val(res[item])
                }
            } else {
                $('#' + name).val('')
                $('#' + name).next().find('input').val('')
            }

        }
    })
}

function createdtabspage(data) {
    for (var i = 0; i < data.length; i++) {
        $('.tab-title').not('.tab-title1').append('<li class="relatedlistinfos save-checking">' + data[i].label + '</li>')
    }

    $('.tab-title li').not('.relatedlistinfos').click(function () {
        var that = this
        setTimeout(function () {
            if ($('.save-status').length == 0) {
                $('.tab-title li').removeClass('layui-this')
                $('.tab-title li').eq($(that).index()).addClass('layui-this')
                $('.layui-tab-content>.section').hide()
                $('.layui-tab-content>.section').eq($(that).index()).show()
            }
        },0)
    })
    $('.tab-title li.relatedlistinfos').click(function () {
        var that = this
        setTimeout(function () {
            if ($('.save-status').length == 0) {
                $('.tab-title li').removeClass('layui-this')
                $('.tab-title li').eq($(that).index()).addClass('layui-this')
            $('.layui-tab-content>.section').hide().removeClass('layui-this')
            $('.sublistsubtable>.section-body').hide()
            $('.layui-tab-content>.section').eq(2).show().addClass('layui-this')
            $('.sublistsubtable>.section-body').eq($(that).index() - 2).show()
            layuitable[$(that).index() - 2].resize($('.sublistsubtable>.section-body').eq($(that).index() - 2).find('table').attr('id'))
        }
        },0)
    })




    $(".save-checking").click(function () {
        $(".save-checking-input").each(function () {
            if ($(this).val() == '') {
                if ($(this).find("input").length > 0 && $(this).find("input").val().length != 0) {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(this).removeClass("disstatus");
                    $(this).find("input").removeClass("disstatus");
                    $(".save-status").remove();
                    $(this).next().find('input').removeClass("disstatus")

                    $(".save-checking").addClass("active");
                } else if ($(this).find("textarea").length > 0 && $(this).find("textarea").val().length != 0) {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(this).removeClass("disstatus");
                    $(this).find("input").removeClass("disstatus");
                    $(this).next().find('input').removeClass("disstatus")

                    $(".save-status").remove();
                    $(".save-checking").addClass("active");
                } else {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(".save-status").remove();
                    $(this).parents(".item-left").append('<div class="save-status">请输入此字段</div>');
                    $(this).next().find('input').addClass("disstatus")
                    $(this).addClass("disstatus");
                    $(this).find("input").addClass("disstatus");
                    $(".modal-header").append("        <div class=\"form-error\">\u68C0\u67E5\u6B64\u9875\u9762\u4E0A\u7684\u9519\u8BEF</div>\n                <div class=\"form-error2\">\u5FC5\u987B\u586B\u5199\u8FD9\u4E9B\u5FC5\u586B\u5B57\u6BB5\n                <span></span>\n                </div>");
                    $(".form-error2 span").html($(this).prev().html());
                    $(".save-checking").removeClass("active");
                    return false;
                }
            } else {
                $(".form-error").remove();
                $(".form-error2").remove();
                $(this).removeClass("disstatus");
                $(this).next().find('input').removeClass("disstatus")
                $(this).find("input").removeClass("disstatus");
                $(".save-status").remove();
                $(".save-checking").addClass("active");
            }
        });
        if ($(".save-checking").hasClass("active")) {
            $(".save-checking-inputgroup").each(function () {
                var save = 0
                $(this).find('input').each(function () {
                    if ($(this).val() != '') {
                        save = 1
                    }
                })
                if (save == 0) {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(".save-status").remove();
                    $(this).parents(".divs").append('<div class="save-status">请输入此字段</div>');
                    $(this).addClass("disstatus");
                    $(this).find("input").addClass("disstatus");
                    $(".modal-header").append("        <div class=\"form-error\">\u68C0\u67E5\u6B64\u9875\u9762\u4E0A\u7684\u9519\u8BEF</div>\n                <div class=\"form-error2\">\u5FC5\u987B\u586B\u5199\u8FD9\u4E9B\u5FC5\u586B\u5B57\u6BB5\n                <span></span>\n                </div>");
                    $(".save-checking").removeClass("active");
                    return false;
                } else {
                    $(".form-error").remove();
                    $(".form-error2").remove();
                    $(this).removeClass("disstatus");
                    $(".save-status").remove();
                    $(".save-checking").addClass("active");
                }
            })
        }
    });
}
//行操作

//保存

//保存主表
function savedata(type,callback) {
    var objectTypeCode = window.objectTypeCode
    setTimeout(function () {
        var save = document.querySelectorAll('.save-checking.active');
        if (save.length > 0 || $('.save-checking-input').length == 0) {
            var id = getQueryString('id')
            var d = {}
            for (var i = 0; i < $('input[name]').length; i++) {
                var key = $('input[name]').eq(i).attr('name')
                d[key] = $('input[name]').eq(i).val()
                if ($('input[name]').eq(i).attr('type') == 'checkbox') {
                    if ($('input[name]').eq(i).attr('checked') == 'checked') {
                        d[key] = true
                    } else {
                        d[key] = false
                    }
                }
            }
            for (var i = 0; i < $('.selectcontent').length; i++) {
                var key = $('.selectcontent').eq(i).attr('name')
                d[key] = $('.selectcontent').eq(i).val()
            }
            for (var i = 0; i < $('textarea').length; i++) {
                var key = $('textarea').eq(i).attr('name')
                d[key] = $('textarea').eq(i).val()
            }
            for (var i = 0; i < $('.searchselect').length; i++) {
                var key = $('.searchselect select[name]').eq(i).attr('name')
                var Name = $('.searchselect select[name]').eq(i).next().find('input').val()
                var Id = $('.searchselect select[name]').eq(i).val()
                d[key] = {}
                d[key].Name = Name
                d[key].Id = Id
                if (Id == null && $('.searchselect select[name]').eq(i).attr('layvalue') && $('.searchselect select[name]').eq(i).attr('layvalue') != '') {
                    d[key].Id = $('.searchselect select[name]').eq(i).attr('layvalue')
                }
            }
            for (var i = 0; i < $('.openinpt').length; i++) {
                var key = $('.openinpt').eq(i).attr('name')
                var Name = $('.openinpt').eq(i).attr('layvalue')
                var Id = $('.openinpt').eq(i).val()
                d[key] = {}
                d[key].Name = Name
                d[key].Id = Id
            }
            var messages = {
                params: {
                    recordRep: {
                        objTypeCode: objectTypeCode,
                        fields: d
                    }
                }
            }
            if (id != null) {
                messages.params.recordRep.id = id
            }

            messages = JSON.stringify(messages)
            var data = { message: messages };
            layerload = layer.load(1,{ shade: [0.3, '#000'] })
            ajaxMethodPostData('entity.saverecord', data, function (data) {
                if (data) {
                    var valueid = data.data.ValueId
                    saveother(valueid)
                } else {
                    layer.close(layerload)
                }
            })
        }
    }, 500)
}
var layerload
//保存子表
function saverelated(valueid,callback) {
    if ($('.save-status').length == 0) {
        var row = $('.layui-table-body').find('tr')
        if (row.length == 0) {
            callback()
        }
        for (var i = 0; i < row.length; i++) {
            var objectTypeCode = row.eq(i).parents('.layui-table-box').parent().prev().attr('objectTypeCode')

            var d = {

            }
         
            var number = 0
            for (var j = 0; j < row.eq(i).find('td').length; j++) {
                var value = row.eq(i).find('td').eq(j).find('input').val()
                if (row.eq(i).find('td').eq(j).find('select').length > 0) {
                    value = row.eq(i).find('td').eq(j).find('select').val()
                    if (row.eq(i).find('td').eq(j).find('.searchselect').length > 0) {
                        value = {
                            Id: row.eq(i).find('td').eq(j).find('select').val(),
                            Name: row.eq(i).find('td').eq(j).find('input').val()
                        }
                        if (row.eq(i).find('td').eq(j).find('select').val() == '') {
                            number++
                        }
                    }
                }
                if (row.eq(i).find('td').eq(j).attr('data-field') && row.eq(i).find('td').eq(j).attr('data-field') != '' && row.eq(i).find('td').eq(j).attr('data-field') != '0') {
                    d[row.eq(i).find('td').eq(j).attr('data-field')] = value
                }
                if (value == '') {
                    number++
                }
            }
            if (number >= row.eq(i).find('td').length - 3) {
                if (i == row.length - 1) {
                    layer.close(layerload)
                    callback()
                    break
                } else {
                    continue
                }
            }
            var rowid = ''
            if (row.eq(i).find('td[data-field="id"]').length > 0) {
                rowid = row.eq(i).find('td[data-field="id"]').find('div').html()
            }
            
            d[parentobjIdName] = { Id: valueid }
            var messages = {
                params: {
                    recordRep: {
                        objTypeCode: objectTypeCode,
                        fields: d,
                        id: rowid
                    }
                }
            }
            messages = JSON.stringify(messages)
            console.log('aaa')
            if (i == row.length - 1) {
                ajaxMethodPostData('entity.saverecord', { message: messages },callback)
            } else {
                ajaxMethodPostData('entity.saverecord', { message: messages })
            }
        }
    } else {
        layer.msg('请填写所有必填项');
    }
}
