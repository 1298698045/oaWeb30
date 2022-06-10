var formcomponents = {
    getlookup: function (thisself) {
        $('.searchselect').click(function () {
            var that = this
            d = {
                Lktp: $(that).attr('Lktp'),
            }
            thisself.formcomponents.searchlookup(d, that, thisself)
            $(this).find('input').off()
            thisself.formcomponents.selectredner(that, thisself)
        })
    },
    selectredner: function (that, thisself) {
        var flag = true;
        $(that).find('input').on('compositionstart',function(){
            flag = false;
        })
        $(that).find('input').on('compositionend', function () {
            flag = true;
        })
        $(that).find('input').keyup(function (key) {
            if (key.keyCode == 13) {
                thisself.chooselookup($(that).attr('Lktp'), $(that).find('select').attr('id'), $(that).find('.searchimg').attr('title'),$(this).val())
            } else if ($(this).val() != '' && flag) {
                d = {
                    Lktp: $(that).attr('Lktp'),
                    Lksrch: $(this).val()
                }
                thisself.formcomponents.searchlookup(d, that, thisself)
            }
        })
    },
    searchlookup: function (d, that, thisself) {
        ajaxMethodGetData('ui.entity.lookup', d, function (data) {
            var selectvalue = $(that).find('select').val()
            var inputvalue = $(that).find('input').val()
            $(that).find('select').html('<option value="">请选择</option>')
            $('select[lay-filter]').attr('lay-filter', '')
            $(that).find('select').attr('lay-filter', 'filterselect')
            for (var i = 0; i < data.listData.length; i++) {
                $(that).find('select').append('<option value="' + data.listData[i].ID + '">' + data.listData[i].Name + '</option>')
            }
            //if (selectvalue != '') {
            //    $(that).find('select').find('option[value="' + selectvalue + '"]').remove()
            //    $(that).find('select').append('<option selected value="' + selectvalue + '">' + inputvalue + '</option>')
            //}
            thisself.layoutform.render()
            thisself.formcomponents.selectredner(that, thisself)
            if (d.Lksrch) {
                $(that).find('input').val(d.Lksrch).focus()
            } else {
                $(that).find('input').focus()
            }
            $(that).find('.layui-form-select').addClass('layui-form-selected').addClass('layui-form-selectup')
            if (typeof form != 'undefined') {
                form.on('select(filterselect)', function (data) {
                    //console.log(data);
                    var lookupObjectTypeCode = $(data.elem).parents('.searchselect').attr('lktp')
                    var ObjectTypeCode = window.objectTypeCode
                    if ($(data.elem).parents('.layui-table-view').length > 0) {
                        if ($(data.elem).parents('.layui-table-view').prev().attr('objecttypecode')) {
                            ObjectTypeCode = $(data.elem).parents('.layui-table-view').prev().attr('objecttypecode')
                        }
                    }
                    var lookupAttributeName = $(data.elem).attr('id')
                    var id = data.value
                    lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id)
                });
            }
        })
    },
    chooselookup: function (objtypecode, name, title, search, filterquery, readonly) {
        var ishighsearch = getQueryString('ishighsearch')
        if (ishighsearch == '1' || $('#iframe2').length) {
            $('#iframe2').show().attr('src', '/alert/lookupiframe3.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=' + title + '&search=' + search).height(640).css('margin-top', '-320px')
            $('.popup-mask').show()
            return
        }
        if (objtypecode == '8') {
            opencenterwindow('/_ui/common/data/UserLookResult.aspx?type=relatedchhoose&lknm=' + name, '', 1150, 600)
        } else if (objtypecode == '10') {
            opencenterwindow('/alert/deptchose_form.html?type=relatedchhoose&lknm=' + name, '', 750, 520)
        } else {
            if (typeof isiframe != undefined) {
                var iframename = getQueryString('iframename')
                if (parent.$('#iframe').length == 0) {
                    parent.$('body').append('<iframe id="iframe" frameborder="0" src=""></iframe><div class="popup-mask"></div>')
                    parent.$('body style').append('body #iframe{position:fixed;background-color:white;width:60%;left:20%;top:50%;margin-top:-300px;border-radius:7px;display:block;height:620px;border:0;overflow:hidden;z-index:9999;display:none}.popup-mask{display:none;position:fixed;background-color:transparent;width:100%;height:100%;top:0;z-index:999;left:0;position:fixed;background:url(/img/bgOverlayDialogBackground.png);background-color:transparent}')
                }
                parent.$('#iframe').show().attr('src', '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=' + title + '&search=' + search + '&readonly=' + readonly + '&filterquery=' + filterquery + '&iframename=' + iframename).height(640).css('margin-top', '-320px')
                parent.$('.popup-mask').show()
            } else {
                if ($('#iframe').length == 0) {
                    $('body').append('<iframe id="iframe" frameborder="0" src=""></iframe><div class="popup-mask"></div>')
                    $('body style').append('body #iframe{position:fixed;background-color:white;width:60%;left:20%;top:50%;margin-top:-300px;border-radius:7px;display:block;height:620px;border:0;overflow:hidden;z-index:9999;display:none}.popup-mask{display:none;position:fixed;background-color:transparent;width:100%;height:100%;top:0;z-index:999;left:0;position:fixed;background:url(/img/bgOverlayDialogBackground.png);background-color:transparent}')
                }
                $('#iframe').show().attr('src', '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=' + title + '&search=' + search + '&readonly=' + readonly + '&filterquery=' + filterquery).height(640).css('margin-top', '-320px')
                $('.popup-mask').show()
            }
           
        }
    },
    lookupPick: function (controlName, valId, valName) {
        setTimeout(function () {
            $('#' + controlName).find('option[value="' + valId + '"]').remove()
            $('#' + controlName).append('<option selected value="' + valId + '">' + valName + '</option>')
            $('#' + controlName).attr('layvalue', valId)
            $('#' + controlName).attr('value', valId)
            $('#' + controlName).next().find('input').val(valName)

            var lookupObjectTypeCode = $('#' + controlName).parents('.searchselect').attr('lktp')
            
            var ObjectTypeCode = window.objectTypeCode
            var lookupAttributeName = controlName
            var id = valId
            if (typeof lookupchange != 'undefined') {
                lookupchange(lookupObjectTypeCode, ObjectTypeCode, lookupAttributeName, id)
            }
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
                $('body style').append('body #iframe{position:fixed;background-color:white;width:60%;left:20%;top:50%;margin-top:-300px;border-radius:7px;display:block;height:620px;border:0;overflow:hidden;z-index:9999;display:none}.popup-mask{display:none;position:fixed;background-color:transparent;width:100%;height:100%;top:0;z-index:999;left:0;position:fixed;background:url(/img/bgOverlayDialogBackground.png);background-color:transparent}')
            }
            $('#iframe').show().attr('src', '/alert/lookupiframe.html?objtypecode=' + objtypecode + '&lknm=' + name + '&title=' + title + '&search=' + search).height(640).css('margin-top', '-320px')
            $('.popup-mask').show()
        }
    },
}