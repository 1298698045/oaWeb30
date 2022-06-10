if ($('#layoutview').length > 0) {
    getlayout()
}
if ($('#layout_related').length > 0) {
    getrelated()
}
if ($('#auditfeedbacks').length > 0) {
    getfeedback()
}
function getlayout() {
    var objectTypeCode = getQueryString('objectTypeCode')
    if (!objectTypeCode) {
        objectTypeCode = window.objectTypeCode
    }
    var id = getQueryString('id')
    ajaxMethodGetData('entity.recordandlayout.get', {
        objectTypeCode: objectTypeCode,
        id: id
    }, function (data) {
        if (data) {
            $('#header-title').html(data.actions[0].returnValue.entityLabel)
            createdheadhtml(data.context.compactLayoutFields,data.actions[0].returnValue.record)
            createdviewhtml(data.context.componentDefs[0].lt)
            createdviewdata(data.actions[0].returnValue.record)
            gerenjianlibuju(data)
        }

    })
}

function gerenjianlibuju(data) {
    $('.FullName').html(data.actions[0].returnValue.record.FullName)
    $('.DeptIdName').html(data.actions[0].returnValue.record.DeptIdName)
    $('.EmployeeNo').html(data.actions[0].returnValue.record.EmployeeNo)
    $('.EmployeeNo').html(data.actions[0].returnValue.record.EmployeeNo)
    
}

//简要布局
function createdheadhtml(html, data) {
    //console.log(html)
   // console.log(data)
    $('.contract-message li').remove()
    for (var i = 0; i < html.length; i++) {
        $('.contract-message-head').append('<li>' + html[i].label + '</li>')
        if (data[html[i].name]) {
            if (data[html[i].name].Id || data[html[i].name].Id == '') {
                $('.contract-message ul').eq(1).append('<li>' + data[html[i].name].Name + '</li>')
            } else if (data[html[i].name] == true || data[html[i].name] == false) {
                var text = data[html[i].name] ? '是' : '否'
                $('.contract-message ul').eq(1).append('<li>' + text + '</li>')
            }else{
                $('.contract-message ul').eq(1).append('<li>' + data[html[i].name] + '</li>')
            }
        } else {
            $('.contract-message ul').eq(1).append('<li></li>')
        }
    }
}



//生成详细信息 html
function createdviewhtml(data) {
    var html = ''
    for (var i = 0; i < data.sections.length; i++) {
        var res = data.sections[i]
        html += '<div class="viewlayout-section">'
        html += '<div class="viewlayout-section-head"><span>' + res.title + '</span></div>'
        html += '<div class="viewlayout-section-body">'
        for (var j = 0; j < res.rows.length; j++) {
            var row = res.rows[j]
            html += '<div class="viewlayout-section-row">'
            for (var k = 0; k < row.attributes.length; k++) {
                var attribute = row.attributes[k]
                html += '<div class="viewlayout-section-item">'
                     + '<div class="section-item-name">' + attribute.label + '</div>'
                     + '<div class="section-item-value" id="layoutitem_' + attribute.localId + '"></div>'
                     + '</div>'
            }
            html += '</div>'
        }
        html += '</div>'
        html += '</div>'
    }
    $('#layoutview').append(html)
}
//填充数据
function createdviewdata(data) {
    for (var item in data) {
        if (typeof data[item] == 'object' && data[item] != null) {
            if (data[item].Name) {
                $('#layoutitem_' + item).html(data[item].Name)
            }
            else {
                $('#layoutitem_' + item).html('')
            }
        } else if (data[item] === true || data[item] === false) {
            var text = data[item] ? '是' : '否'
            $('#layoutitem_' + item).html(text)
        } else if (data[item] === null || data[item] === 'undefined') {
            $('#layoutitem_' + item).html('')
        } else {
            $('#layoutitem_' + item).html(data[item])
        }
    }
}
//相关列表
function getrelated() {
    $('#layout_related').html('')
    var objectTypeCode = getQueryString('objectTypeCode')
    if (!objectTypeCode) {
        objectTypeCode = window.objectTypeCode
    }
    var id = getQueryString('id')
    ajaxMethodGetData('entity.relatedlistinfos.get', {
        objectTypeCode: objectTypeCode,
    }, function (data) {
        createdrelatedlist(data.actions[0].returnValue.relatedLists)
        createdrelatedlistdata()
        for (var i = 0; i < data.actions[0].returnValue.relatedLists.length; i++) {
            var res = data.actions[0].returnValue.relatedLists[i]
            $('#leftnav ul').append('<li><a href="#relatedlist_' + res.relatedSObject + '">' + res.label + '</a></li>')
    
        }
    })
}
function createdrelatedlist(data) {
    var html = ''
    for (var i = 0; i < data.length; i++) {
        var res = data[i]
        html += '<div relatedObjectAttributeName="' + res.relatedObjectAttributeName + '" entityType="' + res.entityKeyPrefix + '" class="related-item layoutrelated-item" objectTypeCode="' + res.objectTypeCode + '" id="relatedlist_' + res.relatedSObject + '">'
                +'    <div class="related-item-head">'
                +'        <div class="related-item-logo">'
                +'            <img src="/img/cal/hetongguanli.png" alt="" />'
                +'        </div>'
                +'        <div class="related-item-name">'
                +'            <span>' + res.label + '</span>'
                +'            <span>(0)</span>'
                + '        </div>'
        //if (typeof cannotedit != 'undefined' && cannotedit != 'cannotedit') {
            html+= '        <div class="related-item-pay" onclick=addRelatedItem("' + res.relatedSObject + '","' + res.relatedObjectAttributeName + '")>'
                + '            <span>新建</span>'
                + '        </div>'
        //}
                

               html +='    </div>'
                
                +'</div>'
    }
    $('#layout_related').append(html)
}
function createdrelatedlistdata() {
    var objectTypeCode = getQueryString('objectTypeCode')
    var id = getQueryString('id')
    ajaxMethodGetData('entity.relatedrecords.get', {
        objectTypeCode: objectTypeCode,
        id:id
    }, function (data) {
        if (data) {
            var res = data.actions[0].returnValue
            var listItems = res.listItems
            var recordIds = res.recordIds
            var records = res.records
            var pid = getQueryString('id')
            for (var item in listItems) {
                if (recordIds[item].recordIds.length > 0) {
                    var width = listItems[item].length * 120 + 80
                    $('#relatedlist_' + item).find('.related-item-name span').eq(1).html('(' + recordIds[item].recordIds.length + ')')
                    $('#relatedlist_' + item).append('<div class="related-item-body">'
                    + '        <ul style="width:'+width+'px;min-width:100%;"><li class="related-list-head"></li></ul>'
                    + '        <div class="lookall"><span><a class="lookall" href="/apps/lineitems.aspx?entityType=' + $('#relatedlist_' + item).attr('entityType') + '&pid=' + pid + '&relatedObjectAttributeName=' + $('#relatedlist_' + item).attr('relatedObjectAttributeName') + '" target="view_window">查看全部</a></span></div>'
                    + '    </div>')
                    for (var i = 0; i < recordIds[item].recordIds.length; i++) {
                        $('#relatedlist_' + item).find('ul').append('<li id="' + recordIds[item].recordIds[i] + '"></li>')
                    }
                    for (var i = 0; i < listItems[item].length; i++) {
                        $('#relatedlist_' + item).find('.related-list-head').append('<div name="' + listItems[item][i].field + '">' + listItems[item][i].title + '</div>')
                        for (var j = 0; j < recordIds[item].recordIds.length; j++) {
                            $('#' + recordIds[item].recordIds[j]).append('<div title="'+records[recordIds[item].recordIds[j]][item].record.fields[listItems[item][i].field].displayValue+'">' + records[recordIds[item].recordIds[j]][item].record.fields[listItems[item][i].field].displayValue + '</div>')
                        }
                    }
                    //if (typeof cannotedit !='undefined' && cannotedit != 'cannotedit') {

                    for (var j = 0; j < recordIds[item].recordIds.length; j++) {
                        $('#' + recordIds[item].recordIds[j]).append('<div class="sanjiao" onclick=rowedit("' + recordIds[item].recordIds[j] + '","' + item + '")><img src="/img/cal/20.PNG"><div class="miss-bianji miss-bianji2" style="display: none;">'
                            + '<div onclick=editrow("' + recordIds[item].recordIds[j] + '","' + item + '") class="miss-bianji1">编辑</div>'
                            + '<div onclick=removerow("' + recordIds[item].recordIds[j] + '","' + item + '")>删除</div>'
                            + '<div onclick=filerow(this,"' + recordIds[item].recordIds[j] + '","' + item + '")>附件</div></div></div>')
                    }
                    //}

                }
            }
        }
    })
}
//审计反馈
function getfeedback() {
    $('#auditfeedback').html('')
    var objectTypeCode = getQueryString('objectTypeCode')
    if (!objectTypeCode) {
        objectTypeCode = window.objectTypeCode
    }
    //var id = getQueryString('id')
    ajaxMethodPostData('contract.audit.getlist&objecttypecode=10185&type=', {
        filterquery: '\nContractId\teq\t' + getQueryString('id')
    }, function (data) {
        if (data && data.rows && data.rows.length) {
            ajaxMethodGetData('entity.recordandlayout.get', {
                objectTypeCode: 10185,
                id: data.rows[0].ValueId
            }, function (data) {
                createfeedback(data)
            })
        }
    })
    
}
function createfeedback(data) {
    //var html = ''
    //html += '<div class="viewlayout-section">'
    //html += '<div class="viewlayout-section-head"><span>审计反馈</span></div>'
    //html += '<div class="viewlayout-section-body">'
    //html += '<div class="viewlayout-section-row">'
    //html += '<div class="viewlayout-section-item">'
    //             + '<div class="section-item-name">审计状态</div>'
    //             + '<div class="section-item-value">' + data.StatusCode + '</div>'
    //             + '</div>'
    //html += '</div>'
    //html += '</div>'
    //html += '</div>'
    createfeedbackview(data.context.componentDefs[0].lt)
    createfeedbackdata(data.actions[0].returnValue.record)
}
function createfeedbackview(data) {
    var html = ''
    for (var i = 0; i < data.sections.length; i++) {
        var res = data.sections[i]
        html += '<div class="viewlayout-section">'
        html += '<div class="viewlayout-section-head"><span>' + res.title + '</span></div>'
        html += '<div class="viewlayout-section-body">'
        for (var j = 0; j < res.rows.length; j++) {
            var row = res.rows[j]
            html += '<div class="viewlayout-section-row">'
            for (var k = 0; k < row.attributes.length; k++) {
                var attribute = row.attributes[k]
                html += '<div class="viewlayout-section-item">'
                     + '<div class="section-item-name">' + attribute.label + '</div>'
                     + '<div class="section-item-value" id="audititem_' + attribute.localId + '"></div>'
                     + '</div>'
            }
            html += '</div>'
        }
        html += '</div>'
        html += '</div>'
    }
    $('#auditfeedbacks').append(html)
}
function createfeedbackdata(data) {
    for (var item in data) {
        if (typeof data[item] == 'object' && data[item] != null) {
            if (data[item].Name) {
                $('#audititem_' + item).html(data[item].Name)
            }
            else {
                $('#audititem_' + item).html('')
            }
        } else if (data[item] === true || data[item] === false) {
            var text = data[item] ? '是' : '否'
            $('#audititem_' + item).html(text)
        } else if (data[item] === null || data[item] === 'undefined') {
            $('#audititem_' + item).html('')
        } else {
            $('#audititem_' + item).html(data[item])
        }
    }
}
function addRelatedItem(entityName, relatedObjectAttributeName) {
    $('.popup-mask').show()
    $('#iframe').attr('src', '/layouteditor/add_layout_ie8.html?entityName=' + entityName + '&relatedObjectAttributeName=' + relatedObjectAttributeName + '&type=related').show().height(620).css('margin-top','-310px')
}
function rowedit(id, entityName) {
    $('.miss-bianji.miss-bianji2').hide()
    $('#' + id).find('.miss-bianji.miss-bianji2').show()
    window.event ? window.event.cancelBubble = true : e.stopPropagation();
}
function editrow(id, entityName) {
    $('.miss-bianji.miss-bianji2').hide()
    $('.popup-mask').show()
    $('#iframe').attr('src', '/layouteditor/add_layout_ie8.html?id=' + id + '&entityName=' + entityName + '&type=related').show().height(620).css('margin-top', '-310px')
}
function removerow(id, entityName) {
    $('.miss-bianji.miss-bianji2').hide()
    $('.popup-mask').show()
    var objectTypeCode = $('#' + id).parents('.related-item').attr('objectTypeCode')
    $('#iframe').attr('src', '/alert/layout_delete_ie8.html?id=' + id + '&objectTypeCode=' + objectTypeCode).show().height(280).css('margin-top', '-140px')
}
function filerow(that, id, entityName) {
    $('#relatedfilelist').attr('relatedfilelistid', id)

    var objectTypeCode = $('#' + id).parents('.related-item').attr('objectTypeCode')
    $('#relatedfilelist').attr('objectTypeCode', objectTypeCode)

    $('#relatedfilelist').show()
    $('#relatedfilelist').css({
        'top':$(that).offset().top,
        'left':$(that).offset().left
    })
    ajaxMethodGetData('file.attachment.getlist', {
        id:id
    }, function (data) {
        $('#relatedfilelist li').remove()
        for (var i = 0; i < data.listData.length; i++) {
            var row = data.listData[i];
            $('#relatedfilelist ul').append('<li fileid="' + row.Id + '">'
                + '<span class="filename" onclick=filedown("' + row.DownloadLinkUrl + '")>' + row.Name + '</span>'
                + '<img style="width:14px;height:14px;cursor:pointer;margin-top:12px;" src="/img/cal/13.PNG" class="filedelete el-icon-delete" onclick=filedelete("' + row.Id + '") style="line-height:40px;"></img>'
                +'</li>')
        }
    })
    return false;
}
function filedown(url) {
    window.open(url)
}
$(document).click(function () {
    $('#relatedfilelist').hide()
})
function filedown(url) {
    window.open(url)
}
function filedelete(id) {
    ajaxMethodPostData('file.attachment.delete', { id: id }, function (data) {
        $('#relatedfilelist').hide()
        success2('删除成功')
    })
}
function addrelatedfilebtn() {
    var id = $('#relatedfilelist').attr('relatedfilelistid')
    var objectTypeCode = $('#relatedfilelist').attr('objectTypeCode')
    opencenterwindow('/attach/ActivityAttach.aspx?relatedListId=RelatedActivityAttachmentList&pid=' + id + '&type=' + objectTypeCode,'1',500,600)
}
$(document).click(function () {
    $('.miss-bianji.miss-bianji2').hide()
})
//$('style').eq(0).append('#relatedfilelist{display:none;z-index:999;padding:15px;position:absolute;width:300px;border:1px solid #dedede;border-radius:4px;background-color:white;}#relatedfilelist li{margin-left:0;height:40px;line-height:40px;padding:0 15px}#relatedfilelist li:hover{background-color:#f2f2f2}.filename{color:#108def;cursor:pointer}.filedelete{float:right;margin-right:15px;cursor:pointer}.el-icon-delete:hover{color:#108def}')

//$('body').append('<div id="relatedfilelist">'
//    + '<ul>'
//    +'</ul>'
//    +'<div class="addfilecontent">'
//    + '<span style="margin-top:5px;" onclick=addrelatedfilebtn() class="morefile addrelatedfilebtn" id="btnUploadfile">上传文件</span>'
//    +'</div>'
//    + '</div>')
//生成相关列表 html