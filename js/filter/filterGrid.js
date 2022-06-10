
function newfilter() {
    $('#Save').click(function () {
        if ($(this).hasClass('active')) {
            save();
        }
    }); //新建保存

    function save() {
        var name = $('#Name').val();
        var ObjecttypeCode = parent.webContext.objectTypeCode;
        var ListApiName = $('#ListApiName').val();
        var visibility = $('input[type="radio"]:checked').val();
        var access = '';
        $('.pillContainerListItem').each(function () {
            if (access == '') {
                access = $(this).attr('id');
            } else {
                access += ',' + $(this).attr('id');
            }
        });
        var d = {
            name: name,
            ObjecttypeCode: ObjecttypeCode,
            ListApiName: ListApiName,
            visibility: visibility,
            access: access
        };
        function callback(data) {
            console.log(data)
            parent.$('#changeDiv').hide();
            success('新建列表视图成功');
            parent.getFilterList()
            //更新数据
            var name = data.recordRep.name
            var id = data.recordRep.id
            parent.$('.header-left-title-listname span').html(name).attr('id', id)
            var filterid = id
            parent.showfilterdata(filterid)
            parent.$('.shaixuan').toggleClass('active');
            parent.$('.shaixuans').toggle();
            parent.$('.objectManagerLeftNav').toggleClass('active');
            parent.$('#datagrid').datagrid('resize');
        }
        ajaxMethodGetData('entity.filter.create', d, callback);
    }
}
function newfilter3() {
    $('#Save').click(function () {
        if ($(this).hasClass('active')) {
            save();
        }
    }); //新建保存

    function save() {
        var name = $('#Name').val();
        var ObjecttypeCode = parent.webContext.objectTypeCode;
        var ListApiName = $('#ListApiName').val();
        var visibility = $('input[type="radio"]:checked').val();
        var access = '';
        $('.pillContainerListItem').each(function () {
            if (access == '') {
                access = $(this).attr('id');
            } else {
                access += ',' + $(this).attr('id');
            }
        });
        var d = {
            name: name,
            ObjecttypeCode: ObjecttypeCode,
            ListApiName: ListApiName,
            visibility: visibility,
            access: access
        };
        function callback(data) {
            console.log(data)
            parent.webContext.defaultFilterId = data.recordRep.id
            parent.gridFilter.saveDB();
            parent.$('#changeDiv').hide();
            success('新建列表视图成功');
            parent.getFilterList()
            //更新数据
            var name = data.recordRep.name
            var id = data.recordRep.id
            parent.$('.header-left-title-listname span').html(name).attr('id', id)
            var filterid = id
            parent.showfilterdata(filterid)
            
        }
        ajaxMethodGetData('entity.filter.create', d, callback);
    }
}
function newfilter2() {
    $('#Save').click(function () {
        if ($(this).hasClass('active')) {
            save();
        }
    }); //新建保存

    function save() {
        var name = $('#Name').val();
        var ObjecttypeCode = parent.webContext.objectTypeCode;
        var ListApiName = $('#ListApiName').val();
        var visibility = $('input[type="radio"]:checked').val();
        var access = '';
        $('.pillContainerListItem').each(function () {
            if (access == '') {
                access = $(this).attr('id');
            } else {
                access += ',' + $(this).attr('id');
            }
        });
        var d = {
            name: name,
            ObjecttypeCode: ObjecttypeCode,
            ListApiName: ListApiName,
            visibility: visibility,
            access: access
        };

        function callback(data) {
            console.log(data)
            parent.$('#changeDiv').hide();
            parent.webContext.defaultFilterId = data.recordRep.id
            parent.gridFilter.saveDB();
        }

        ajaxMethodGetData('entity.filter.create', d, callback);
    }
}

var name = parent.$('.header-left-title-listname.selectinput span').html();
var filterid = parent.$('.header-left-title-listname.selectinput span').attr('filterid');

function copy() {
    $('#Name').val(name + ' 的副本');
    $('#Save').click(function () {
        if ($(this).hasClass('active')) {
            save();
        }
    }); //复制保存

    function save(filterid) {
        var name = $('#Name').val();
        var ObjecttypeCode = parent.webContext.objectTypeCode;
        var ListApiName = $('#ListApiName').val();
        var visibility = $('input[type="radio"]:checked').val();
        var access = '';
        $('.pillContainerListItem').each(function () {
            if (access == '') {
                access = $(this).attr('id');
            } else {
                access += ',' + $(this).attr('id');
            }
        });
        var d = {
            cloneId: filterid,
            name: name,
            ObjectTypeCode: ObjecttypeCode,
            ListApiName: ListApiName,
            visibility: visibility,
            access: access
        };

        function callback(data) {
            console.log(data);
            parent.$('#changeDiv').hide();
            success('复制列表视图成功');
        }

        ajaxMethodPostData('entity.filter.clone', d, callback);
    }
} //重命名


function Rename() {
    var name = parent.$('.header-left-title-listname.selectinput span').html();
    var filterid = parent.$('.header-left-title-listname.selectinput span').attr('filterid');
    $('#Name').val(name);
    $('#Save').click(function () {
        if ($(this).hasClass('active')) {
            save(filterid);
        }
    }); //重命名保存

    function save(filterid) {
        var name = $('#Name').val();
        var ObjecttypeCode = parent.webContext.objectTypeCode
        //var ListApiName = $('#ListApiName').val()
        //var visibility = $('input[type="radio"]:checked').val()

        var d = {
            id: filterid,
            name: name,
            ObjectTypeCode: ObjecttypeCode,
            ObjTypeCode: ObjecttypeCode //ListApiName: ListApiName,
            //visibility: visibility

        };

        function callback(data) {
            // console.log(data)
            parent.$('#changeDiv').hide();
            success('重命名列表视图成功');
        }

        ajaxMethodPostData('entity.filter.rename', d, callback);
    }
} //共享设置


function enjoy() {
    var name = parent.$('.header-left-title-listname.selectinput span').html();
    var filterid = parent.$('.header-left-title-listname.selectinput span').attr('filterid');
    $('#Name').val(name);
    $('#Save').click(function () {
        save(filterid);
    });

    function save(filterid) {
        var access = "";
        var visibility = $('input[type="radio"]:checked').val();
        $('.pillContainerListItem').each(function () {
            if (access == '') {
                access = $(this).attr('id');
            } else {
                access += ',' + $(this).attr('id');
            }
        });
        var d = {
            id: filterid,
            filterid: filterid,
            visibility: visibility,
            access: access
        };

        function callback(data) {
            //console.log(data)
            parent.$('#changeDiv').hide();
            success('共享设置成功');
        }

        ajaxMethodPostData('entity.filter.share', d, callback);
    }
} //删除


function deletedilter() {
    var name = parent.$('.header-left-title-listname.selectinput span').html();
    var filterid = parent.$('.header-left-title-listname.selectinput span').attr('filterid');
    $('#Name').val(name);
    $('#Save').click(function () {
        save(filterid);
    });

    function save(filterid) {
        var visibility = $('input[type="radio"]:checked').val();
        var d = {
            id: filterid,
            visibility: visibility
        };

        function callback(data) {
            console.log(data);
            parent.$('#changeDiv').hide();
            success('删除成功');
        }
        ajaxMethodPostData('entity.filter.delete', d, callback);
    }
}

$('.slds-form-element__control label').click(function () {
    $('.slds_section__content_div_col_element').hide();
    $('.radiocheck').val('checked');
});
$('.slds-form-element__control label').eq(2).click(function () {
    $('.slds_section__content_div_col_element').show();
});
$('.contentWrapper').click(function () {
    $('.people_show').show();
    return false;
});
$('.orderedList').click(function () {
    $('.people_hidden').show();
});
$(document).click(function () {
    if ($('.people_show li').length > 0) {
        $('.people_hidden').hide();
    }
});
$(".form-element").each(function () {
    var that = this;
    $("li").click(function () {
        return false;
    });
    $("ul").click(function () {
        return false;
    });
    $(this).click(function () {
        $(".form-element").removeClass("element-active");
        $(".lookup").hide();
        $(this).addClass("element-active");
        $(this).find(".lookup").show();
        $(document).click(function (e) {
            if ($(e.target).parents(".form-element").length == 0) {
                $(that).removeClass("element-active");
                $(".lookup").hide();
            }
        });
        return false;
    });
});
$(document).click(function (e) {
    if ($(e.target).parents(".form-element").length == 0) {
        $(".element-tree").hide();
    }

    $('.toop_second').hide();
});
$('.entiyMenu').click(function () {
    $('.toop_second').show();
});
$('.slds-dropdown__item').click(function () {
    if ($(this).attr('object-a')) {
        $('#employeeId').attr('data-object-a', $(this).attr('object-a'));
    }
    $('#employeeId').attr('data-object', $(this).attr('object'));
    $('#employeeIdName').attr('placeholder', '搜索' + $(this).find('.slds-truncate span').eq(1).html());
    $(this).parent().parent().hide();
});
$(".form-element").each(function () {
    var that = this;
    $("li").click(function () {
        return false;
    });
    $("ul").click(function () {
        return false;
    });
    $(this).find("img").click(function () {
        $(this).parents(".form-element").parent().attr("status", "");
        $(that).find("input[type=text]").show();
        $(that).find("input[type=text]").prop("value", "");
        $(this).prop("src", "/img/images/lookup.png");
        $(that).removeClass("active");
        $(this).next().find("li").remove();
        return false;
    });
    $(this).click(function () {
        $(".form-element").removeClass("element-active");
        $(".lookup").hide();
        $(this).addClass("element-active");
        $(this).find(".lookup").show();

        function callback(data) {
            $(that).find(".lookup li").remove();
            console.log(data);

            for (var i = 0; i < data.listData.length; i++) {
                var datas = data.listData[i];
                var id = datas.ID;
                var name = datas.Name;
                $(that).find(".lookup ul").append('<li id="' + id + '">' + name + '</li>');
                $('.pillContainerListItem').each(function () {
                    if ($(this).attr('id') == data.listData[i].ID) {
                        $(that).find(".lookup ul").find("#" + id).remove();
                    }
                });
            }

            $(that).find(".lookup li").each(function () {
                $(this).click(function () {
                    if ($('#employeeId').attr('data-object-a')) {
                        $('.orderedList').append("<li class=\"pillContainerListItem\" id=\"" + $('#employeeId').attr('data-object-a') + ":" + $(this).attr('id') + "\">\n                             <a class=\"pill uiPill--default uiPill\" href=\"#\">\n                                 <span class=\"pillIcon\" style=\"background-color: #65CAE4\">\n                                     <span class=\"uiImage\">\n                                         <img src=\"/img/user_120.png\" alt=\"\u7528\u6237\">\n                                     </span>\n                                 </span>\n                                 <span class=\"pillText\">" + $(this).html() + "</span>\n                                 <span class=\"pilldelete\">\xD7</span>\n                             </a>\n                         </li>");

                    } else {
                        $('.orderedList').append("<li class=\"pillContainerListItem\" id=\"" + $('#employeeId').attr('data-object') + ":" + $(this).attr('id') + "\">\n                             <a class=\"pill uiPill--default uiPill\" href=\"#\">\n                                 <span class=\"pillIcon\" style=\"background-color: #65CAE4\">\n                                     <span class=\"uiImage\">\n                                         <img src=\"/img/user_120.png\" alt=\"\u7528\u6237\">\n                                     </span>\n                                 </span>\n                                 <span class=\"pillText\">" + $(this).html() + "</span>\n                                 <span class=\"pilldelete\">\xD7</span>\n                             </a>\n                         </li>");

                    }
                    $('.lookup').hide();
                    $('.pilldelete').click(function () {
                        $(this).parents('li').remove();
                        if ($('.addpeople').length != 0) {
                            if ($('.pillContainerListItem').length != 0) {
                                $('.addpeople').addClass('active')
                            } else {
                                $('.addpeople').removeClass('active')
                            }
                        }
                    });
                    if ($('.addpeople').length != 0) {
                        if ($('.pillContainerListItem').length != 0) {
                            $('.addpeople').addClass('active')
                        } else {
                            $('.addpeople').removeClass('active')
                        }
                    }
                    return false;
                });
            });
        }

        var Lktp = $(this).find("input[type=hidden]").attr("data-object");
        var lksrch;
        var d = {
            Lktp: Lktp
        };
        $(that).find("input[type=text]").keyup(function (event) {
            if (event.keyCode == '13') {
                lksrch = $(this).val();
                d = {
                    Lktp: Lktp,
                    lksrch: lksrch
                };
                if (lksrch.length>1) {
                    ajaxMethodGetData("ui.entity.lookup", d, callback);
                }
            }
        });
        //ajaxMethodGetData("ui.entity.lookup", d, callback);
        $(document).click(function (e) {
            if ($(e.target).parents(".form-element").length == 0) {
                $(that).removeClass("element-active");
                $(".lookup").hide();
            }
        });
        return false;
    });
});
$('#employeeIdName').click(function () {
    $('.people_show').show();
}); //保存成功

function success(type) {
    parent.$("body").append("<div class=\"success green\">\n            <span class=\"success_icon\">\n            <i class=\"iconfont icon-duihao\"><img src='/img/images/00.3.Check.png'></img></i>\n            </span>\n            <div class=\"toastContent slds-notify__content\" style=\"flex: 1;\">\n            <div class=\"slds-align-middle slds-hyphenate\" style=\"font-size: 16px;\">\n            <span class=\"toastMessage slds-text-heading--small forceActionsText\">" + type + "</span>\n    </div>\n    </div>\n    <button class=\"button\">\n    <i class=\"iconfont icon-cuohao\"></i>\n    </button>\n    </div>");
    setTimeout(function () {
        parent.$(".success").remove();
    }, 3000);
} //获取图表字段


function Selectcheck() {
    $('.Select').click(function () {
        $('.scrollable_ul').hide();
        $(this).next('.scrollable_ul').show();
        $('.option').click(function () {
            $(this).parent('ul').prev('a').html($(this).children('a').html());
            $(this).parent('ul').prev('a').attr('name', $(this).children('a').attr('name'));
            $('.scrollable_ul').hide();
            return false;
        });
        return false;
    });
}

function filterChart() {
    var url = "/apps/CommandProcessor.ashx?cmd=entity.filter.get&id=" + parent.webContext.filterId;
    var self = this;
    jQuery.ajax({
        async: false,
        cache: true,
        dataType: "json",
        //data: d,
        error: function error(request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function success(data, textStatus) {
            if (data) {
                console.log(data);
                var datas = data.entity.attributes;

                for (var i = 0; i < datas.length; i++) {
                    var res = datas[i];
                    var name = res.name;
                    var label = res.label;
                    $('.scrollable_ul').eq(2).append("<li class=\" uiRadioMenuItem option\">\n                                        <a href=\"javascript:void(0);\" name=\"" + name + "\">" + label + "</a>\n                                    </li>");
                    $('.scrollable_ul').eq(3).append("<li class=\" uiRadioMenuItem option\">\n                                        <a href=\"javascript:void(0);\" name=\"" + name + "\">" + label + "</a>\n                                    </li>");
                }

                Selectcheck();
            }
        },
        type: "POST",
        url: url
    });
}

;

function savefilterChart() {
    function callback(data) {
        console.log(data);
    }

    var name = $('.divs_input').val();
    var ChartType = $('.Select').eq(0).attr('name');
    var AggregateType = $('.Select').eq(1).attr('name');
    var AggregateField = $('.Select').eq(2).attr('name');
    var GroupingField = $('.Select').eq(3).attr('name');
    var d = {
        objTypeCode: 1040,
        name: name,
        GroupingField: GroupingField,
        AggregateField: AggregateField,
        ChartType: ChartType,
        AggregateType: AggregateType,
        EntityType: parent.webContext.entityType,
        ObjectTypeCode: parent.webContext.objectTypeCode
    };
    ajaxMethodPostData('ui.form.save', d, callback);
}