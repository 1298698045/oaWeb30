
var _operators;
var displayColumnApiNames = []
var displayColumnApiNamestitle = []
webContext.objectTypeCode = getQueryString('objTypeCode')
if (!webContext.objectTypeCode) {
    webContext.objectTypeCode = window.objTypeCode
}
var messages = ''
function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

$('.slds-combobox__form-element').eq(0).removeClass('slds-combobox__form-element')
//控制视图按钮
$('#menuitem').off();
$('#copy').off();
$('#New_name').off();
$('#share').off();
$('#Show_zi').off();
$('#Show_zi').off();
$('#delete').off();
$('.viewlist li').click(function () {
    console.log(111);
    $(this).parent().parent().hide();
    return false;
});
$('#menuitem').click(function () {
    $('#iframe').attr('src', '/alert/filter/new.html');
    $('#changeDiv').show();
    $('#iframe').show();
});
$('#copy').click(function () {
    $('#iframe').attr('src', '/alert/filter/copy.html');
    $('#changeDiv').show();
    $('#iframe').show();
});
$('#New_name').click(function () {
    $('#iframe').attr('src', '/alert/filter/New_name.html');
    $('#changeDiv').show();
    $('#iframe').show();
});
$('#share').click(function () {
    $('#iframe').attr('src', '/alert/filter/share.html');
    $('#changeDiv').show();
    $('#iframe').show();
});
$('#Show_zi').click(function () {
    $('#iframe').attr('src', '/alert/filter/show.html');
    $('#changeDiv').show();
    $('#iframe').show();
});
$('#delete').click(function () {
    $('#iframe').attr('src', '/alert/filter/delete.html');
    $('#changeDiv').show();
    $('#iframe').show();
});
$('.select').click(function () {
    $(this).next().show();
    return false;
});
$(document).click(function () {
    $('.slds-dropdown').hide();
    $('.listViewPickerPanel').hide();
});
$('.listViewPickerPanel li').remove();
$(".forceListViewPicker").addClass('nofinish');
$(".forceListViewPicker").click(function (e) {
    $(".listViewPickerPanel").show();
    $(".toop_first").css('display', 'none');
    $(".toop_second").css('display', 'none');

    if ($(this).hasClass('nofinish')) {
        getFilterList();
    }

    $(this).removeClass('nofinish');
    window.event ? window.event.cancelBubble = true : e.stopPropagation();
});
$('.Pinned').remove();
$('.noPinned').remove(); //$('.forceListViewPicker').after(`<div class="fixed-list Pinned">
//     <img src="/img/images/18.pinned(14x14).png" width="14px" height="14px">
//     <div class="slds-popover slds-popover_tooltip slds-nubbin_top-left slds-is-absolute slds-m-top_x-small" style="opacity: 1; z-index: 1000;">
//          <div class="slds-popover__body">
//               要取消固定，请固定其他列表
//             </div>
//         </div>
//     </div>`)
//$('.forceListViewPicker').after(`<div class="fixed-list noPinned" style="display:none;" title="固定此列表视图">
//   <img src="/img/images/18.pin_3(14x14).png" width="14px" height="14px">
//   </div>`)
//禁用选项

$('.viewlist li').not('.viewlist li:first').addClass('limits-li');
$('.slds-dropdown__item.listViewSettingsMenuNew:first').after("<li class=\"slds-dropdown__item listViewSettingsMenuNew\" id=\"print\">\n                                                                 <a href=\"javascript:;\" aria-disabled=\"\">\n                                                                     <span class=\"slds-truncate\">\u5BFC\u51FA</span>\n                                                                 </a>\n                                                             </li>"); //页面中添加筛选器

$('.shaixuan').off();
$('.tubiao').off();
$('.shaixuan').off();
$('.shaixuan').attr('title', '此筛选器不可用');
$('.shaixuan').click(function () {
    if (!$(this).hasClass('ban')) {
        $(this).toggleClass('active');
        $('.shaixuans').toggle();
        $('.objectManagerLeftNav').toggleClass('active');
        $('#datagrid').datagrid('resize');
    }
})

$('#shaixuan').click(function () {
    if (!$(this).hasClass('ban')) {
        $(this).toggleClass('active');
        $('.shaixuans').toggle();
        $('.objectManagerLeftNav').toggleClass('active');
        $('#datagrid').datagrid('resize');
    }
})

; //$('.tubiao').click(function () {
//    $('.shaixuan').css('background', '#fff');
//    $('.shaixuan').children('i').css('color', 'rgb(112, 110, 107)');
//    $('.tubiao').css('pointer-event', 'none');
//    $(this).css('background', 'rgb(27, 82, 151)');
//    $('.tubiao').children('i').css('color', '#fff');
//    $('.tubiaos').css('right', '0px');
//    $('.shaixuans').css('right', '-400px');
//    $('.scroller').css('width', 'calc(100% - 360px)');
//})

$('.shaixuans').remove();
$('.objectManagerLeftNav').after("\n    <div class=\"shaixuans\">\n<div class=\"portal-positioned ignore-click-Sysxk8YhagN ignore-react-onclickoutside\" id=\"chose\" style=\"position: absolute; top: 88px; left: -325px; display: none;\">\n    <div class=\"slds-popovers slds-nubbin--left filter-popover\" style=\"outline: currentcolor none 0px;\">\n        <div class=\"slds-popovers-point\"></div>\n        <div class=\"closeedit slds-button slds-button--icon slds-button slds-button--icon-small slds-float--right slds-popover__close slds-button--icon\"  style=\"float: right;position:relative;z-index:2\" id=\"close\">\n            <i class=\"iconfont icon-cuohao\">\n                      \n            </i><img src=\"/img/cal/closeblue.png\" style=\"height:14px;width:14px;\"></img>\n  <span class=\"slds-assistive-text\">Close\ndialog</span></div>\n    <div class=\"slds-popover__body\">\n        <div class=\"filter-widget slds-form--stacked\">\n            <div class=\"slds-form-element picklist-container date-field-picklist\">\n                <div class=\"slds-form-element\">\n                    <label class=\"slds-form-element__label\" for=\"ryz8MyRxN\">\n                        \u5B57\u6BB5\n                    </label>\n                    <div class=\"slds-form-element__control\">\n                        <div class=\"slds-combobox_container\">\n                            <div class=\"slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ignore-react-onclickoutside picklist-trigger\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"combobox\">\n                                <div class=\"slds-combobox__form-element slds-input-has-icon slds-input-has-icon_right\">\n                                    <input autocomplete=\u201Doff\u201D type=\"text\" style=\"padding-left: 10px;\" class=\"slds-input slds-combobox__input focuss_input\" id=\"ryz8MyRxN\" placeholder=\"\u8BF7\u8F93\u5165\u5B57\u6BB5\u540D\">\n                                    <span class=\"slds-icon_container slds-input__icons slds-input__icon_right\" style=\"right: 8px;\">\n                                        <i class=\"iconfont icon-f11\" style=\"font-size: 15px;\"></i>\n                                    </span>\n                                </div>\n                                <div class=\"focuss\" style=\"width: 98%;\">\n                                    <ul>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n        <div class=\"slds-form-element picklist-container custom-range-picklist\">\n            <div class=\"slds-form-element\">\n                <label class=\"slds-form-element__label\" for=\"ryz8MyRxN\">\n                    \u8FD0\u7B97\u7B26</label>\n                <div class=\"slds-form-element__control\">\n                    <div class=\"slds-combobox_container\">\n                        <div class=\"slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ignore-react-onclickoutside picklist-trigger\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"combobox\">\n                            <div class=\"slds-combobox__form-element slds-input-has-icon slds-input-has-icon_right\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"none\">\n                                <input autocomplete=\u201Doff\u201D type=\"text\" style=\"padding-left: 10px;\" class=\"slds-input slds-combobox__input focuss_input\" id=\"Text1\" value=\"\">\n                                <span class=\"slds-icon_container slds-input__icons slds-input__icon_right\" style=\"right: 8px;\">\n                                    <i class=\"iconfont icon-f11\" style=\"font-size: 15px;\"></i></span>\n                            </div>\n                            <div class=\"focuss\" style=\"width: 98%;\">\n                                <ul>\n                                                                                                   \n                                </ul>\n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n        <div class=\"valuediv\"> "
    + "<div class=\"filter-widget slds-form--stacked value\">\n            <div class=\"slds-form-element picklist-container date-field-picklist\">\n                <div class=\"slds-form-element\">\n                    <label class=\"slds-form-element__label\" for=\"ryz8MyRxN\">\n                        \u503C\n                    </label>\n                    <div class=\"slds-form-element__control\">\n                        <div class=\"slds-combobox_container\">\n                            <div class=\"slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ignore-react-onclickoutside picklist-trigger\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"combobox\">\n                                <div class=\"slds-combobox__form-element slds-input-has-icon slds-input-has-icon_right\">\n                                    <input autocomplete=\u201Doff\u201D type=\"text\" style=\"padding-left: 10px;\" class=\"slds-input slds-combobox__input focuss_input\" id=\"Text2\" placeholder=\"\u8BF7\u8F93\u5165\u503C\">\n                                                               \n                                </div>\n                                                                                            \n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n        <div class=\"filter-widget slds-form--stacked checkboxdiv\">\n            <div class=\"slds-form-element picklist-container date-field-picklist\">\n                <div class=\"slds-form-element\">\n                    <label class=\"slds-form-element__label\" for=\"ryz8MyRxN\">\n                        \n                    </label>\n                    <div class=\"slds-form-element__control\">\n                        <div class=\"slds-combobox_container\">\n                            <div class=\"slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ignore-react-onclickoutside picklist-trigger\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"combobox\">\n                                <div class=\"slds-combobox__form-element slds-input-has-icon slds-input-has-icon_right\">\n                                    <input autocomplete=\"off\" type=\"button\" style=\"border-radius:4px 0 0 4px;border-right:0\" class=\"buttoncheck slds-input slds-combobox__input focuss_input\" id=\"Text2\" value='\u662F' name='1'>\n                                    <input autocomplete=\"off\" type=\"button\" style=\"border-radius: 0 4px 4px 0\" class=\"buttoncheck slds-input slds-combobox__input focuss_input\" id=\"Text2\"  value='\u5426' name='0'>\n                                                               \n                                </div>\n                                                                                            \n                            </div>\n                        </div>\n                    </div>\n                </div>\n            </div>\n        </div>\n        <div id=\"vueapp\">\n        <div class=\"timechook slds-form-element picklist-container custom-range-picklist date\" style=\"display: none;\">\n            <div class=\"slds-form-element\" style=\"width: 100%; float: left;\">\n                <label class=\"slds-form-element__label\">\u5F00\u59CB\u65E5\u671F</label>\n                <div class=\"slds-form-element__control\">\n                    <div class=\"slds-combobox_container\">\n                        <div class=\"slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ignore-react-onclickoutside picklist-trigger\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"combobox\">\n                            <div class=\"slds-combobox__form-element slds-input-has-icon slds-input-has-icon_right\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"none\">\n                              <el-date-picker\nv-model=\"time\"\ntype=\"date\"\nplaceholder=\"\u9009\u62E9\u65E5\u671F\">\n</el-date-picker>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"starttimechook slds-form-element picklist-container custom-range-picklist date\" style=\"display: none;\">\n<div class=\"slds-form-element\" style=\"width: 50%; float: left;\">\n<label class=\"slds-form-element__label\">\u5F00\u59CB\u65E5\u671F</label>\n<div class=\"slds-form-element__control\">\n<div class=\"slds-combobox_container\">\n    <div class=\"slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ignore-react-onclickoutside picklist-trigger\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"combobox\">\n        <div class=\"slds-combobox__form-element slds-input-has-icon slds-input-has-icon_right\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"none\">\n                <el-date-picker\nv-model=\"starttime\"\ntype=\"date\"\nplaceholder=\"\u9009\u62E9\u65E5\u671F\">\n</el-date-picker>\n</div>\n</div>\n</div>\n</div>\n</div>\n<div class=\"slds-form-element\" style=\"width: 50%; float: left;\">\n<label class=\"slds-form-element__label\">\u7ED3\u675F\u65E5\u671F</label>\n<div class=\"slds-form-element__control\">\n<div class=\"slds-combobox_container\">\n<div class=\"slds-combobox slds-dropdown-trigger slds-dropdown-trigger_click ignore-react-onclickoutside picklist-trigger\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"combobox\">\n    <div class=\"slds-combobox__form-element slds-input-has-icon slds-input-has-icon_right\" aria-expanded=\"false\" aria-haspopup=\"listbox\" role=\"none\">\n        <el-date-picker\nv-model=\"endtime\"\ntype=\"date\"\nplaceholder=\"\u9009\u62E9\u65E5\u671F\">\n</el-date-picker>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>\n</div>"
    + '<div class=\"elementselect\" style="position:relative;">'
+ '<el-select'
+ ' @change=lookupchange collapse-tags="true"'
+ '              v-model="value"'
+ '              multiple'
+ '               filterable'
+ '               remote'
+ '               @visible-change="getlookup"'
+ '               :remote-method="searchlookup"'
+ '               placeholder="请选择">'
+ '        <el-option v-for="item in search"'
+ '                   :key="item.ID"'
+ '                   :label="item.Name"'
+ '                   :value="item.ID">'
+ '        </el-option>'
+ '    </el-select>'
+ ' <div style="color:#333;z-index:999;top:15px;" @click="openslookup" class="lookresultbtn"><i class="el-icon-search"></i></div>'
    + "</div>"
    + "</div>\n<footer class=\"slds-m-top--small slds-text-align--right\" style=\"text-align: right;\">\n<div class=\"filter-button-group\">\n<button class=\"filteredit-finish slds-button slds-button--neutral filter-cancel\" type=\"button\" style=\"margin-top: 1rem;\">\n\u5B8C\u6210</button>\n</div>\n</footer>\n\n</div>\n</div>\n</div>\n<div class=\"slds-show slds-tabs--default__content\" style=\"display: block;\">\n<div class=\"sectionable-table filters-panel\">\n<div class=\"sectionable-table-section\" data-section-name=\"\">\n<div class=\"sectionable-table-section-title\">\n    <div class=\"sectionable-table-section-title-label\" data-tooltip=\"\u7B5B\u9009\u5668\" data-tooltip-on-truncation=\"true\">\n        <span>\u7B5B\u9009\u5668</span>\n        <span class=\"closed\">x</span>\n    </div>\n                                                                            \n    <div class=\"sectionable-table-section-actions\">\n        <div class=\"slds-dropdown-trigger slds-dropdown-trigger--click\" id=\"S16MmeHqeN\">\n        </div>\n    </div>\n</div>\n<div class=\"sectionable-table-section-title-head\"style=\"display:none;\">\n        <button class=\"slds-button slds-button--neutral slds-truncate \" id=\"save-more\" style=\"padding: 0 3px!important; border: 1px solid rgb(221, 219, 218); border-radius: 0 .25rem .25rem 0!important; background: #fff!important;\">\n            <i class=\"iconfont icon-f11\" style=\"font-size: 20px;\"><img src='/img/cal/20.png'></img></i>\n        </button>\n   </li> <li class=\"slds-button slds-button--neutral slds-truncate\" style=\"border-radius: 0.25rem;float:right;margin-right:0;\" id=\"saveDb\">\n            <a href=\"javascript:;\">\n            <div class=\"slds-truncate\">\u4FDD\u5B58</div>\n            </a>\n        </li>\n     <li class=\"slds-button slds-button--neutral slds-truncate\" style=\"border-radius: .25rem;margin-right:15px;\" id=\"Show_zi\">\n <a href=\"javascript:;\">\n<div class=\"slds-truncate\" style=\"color: rgba(27, 82, 151, 1.0);\">显示列</div>\n </a>\n </li><li class=\"slds-button slds-button--neutral slds-truncate\" style=\"border-radius: .25rem;margin-right:15px;\" id=\"print\">\n <a href=\"javascript:;\">\n<div class=\"slds-truncate\" style=\"color: rgba(27, 82, 151, 1.0);\">导出</div>\n </a>\n </li>   <li class=\"slds-button slds-button--neutral slds-truncate\" style=\"border-radius: .25rem;margin-right:15px;\" id=\"retuenDb\">\n            <a href=\"javascript:;\">\n            <div class=\"slds-truncate\" style=\"color: rgba(27, 82, 151, 1.0);\">搜索</div>\n            </a>\n        </li>\n\n    </div>\n<ul class=\"remarkList\" id=\"Ul1\">\n    <li id=\"exportOrgs\"><a>\u53E6\u5B58\u4E3A</a></li>\n</ul>\n\n<div class=\"sectionable-table-section-content\">\n    <div class=\"sectionable-table-group\">\n        <div class=\"sectionable-table-group-content\">\n                <li style='display:none' class=\"sectionable-table-row \" role=\"presentation\" draggable=\"false\">\n                    <div class=\"sectionable-table-row-containers\">\n                        <div class=\"sectionable-table-row-actions\" style=\"width: 100%;\">\n                            <div class=\"sectionable-table-row-content\" style=\"width: 100%;\">\n                                <div class=\"filterContainer STANDARDDATE\" style=\"width: 100%;\">\n                                    <div class=\"slds-filters__item slds-grid slds-grid--vertical-align-center\">\n                                        <div class=\"slds-grow\" style=\"display: inline;\">\n                                            <button class=\"slds-button--reset slds-grow slds-has-blur-focus\" id=\"Button2\" tabindex=\"0\" style=\"text-align: left; width: 100%; padding: .5rem;\">\n                                                <span class=\"slds-assistive-text\">\u7F16\u8F91\u7B5B\u9009\u5668</span>\n                                                <p class=\"slds-text-body--small\">\u5411\u6211\u663E\u793A</p>\n                                                <p>\n                                                    <span class=\"filterPredicate\">\u6211\u7684\u5C0F\u7EC4\u7684\u4E1A\u52A1\u673A\u4F1A</span>\n                                                </p>\n                                            </button>\n\n                                        </div>\n                                    </div>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n                </li>\n            <span class=\"sectionable-table-row-other\">\u5339\u914D\u6240\u6709\u8FD9\u4E9B\u7B5B\u9009\u5668</span>\n\n            <ul class=\"section-table-rows-container slds-list--vertical slds-list--vertical-space\" role=\"listbox\" aria-orientation=\"vertical\" id=\"gridFilter\">\n                                                             \n                                                             \n                                                                       \n            </ul>\n            <div class=\"addFilterRemoveAll\">\n                <a class=\"addFilter uiOutputURL\" href=\"javascript:void(0);\">\u6DFB\u52A0\u7B5B\u9009\u5668</a>\n                <a class=\"removeAll\" href=\"javascript:void(0);\">\u5168\u90E8\u5220\u9664</a>\n            </div>\n        </div>\n    </div>\n    <div class=\"add-logic\">\n        <span>\u6DFB\u52A0\u7B5B\u9009\u903B\u8F91</span>\n    </div>\n</div>\n</div>\n</div>\n</div>\n<script>\n\n$('.buttoncheck').click(function(){\n       $('.buttoncheck').removeClass('active')\n       $(this).addClass('active')\n                    })\n                        $('.sectionable-table-row').click(function () {\n                            $('#chose').show()\n                        })\n$('.slds-popover__close').click(function () {\n    $('#chose').hide()\n})\n    </script>\n    </div>");
var vum = new Vue({
    el: '#vueapp',
    data: {
        time: '',
        starttime: '',
        endtime: ''
    }
});
function choosedept(id, name) {
    for (var i = 0; i < id.length; i++) {
        if (activeelementselect.value.indexOf(id[i]) == -1) {
            activeelementselect.value.push(id[i])
            activeelementselect.checked.push({
                ID: id[i],
                Name: name[i]
            })
            activeelementselect.search.push({
                ID: id[i],
                Name: name[i]
            })
        }
    }
}

function invitepeople(id, name) {
    for (var i = 0; i < id.length; i++) {
        if (activeelementselect.value.indexOf(id[i]) == -1) {
            activeelementselect.value.push(id[i])
            activeelementselect.checked.push({
                ID: id[i],
                Name: name[i]
            })
            activeelementselect.search.push({
                ID: id[i],
                Name: name[i]
            })
        }
    }
}
var activeelementselect = ''
var elementselect = new Vue({
    el: '.elementselect',
    data: {
        Lktp: '8',
        value: [],
        search: [],
        checked: []
    },
    methods: {
        openslookup: function (name, objtypecode) {
            activeelementselect = this
            var objtypecode = this.Lktp
            var name = 'value'
            //$('#changeDiv').show().css('zIndex', 10000000)
            if (objtypecode == 30020 || objtypecode == 8) {
                opencenterwindow('/_ui/common/data/invite_UserLookResult.html?name=' + name + '&f=filterchosrlookup','',1200,600)
                //$('#iframe').attr('src', '/_ui/common/data/invite_UserLookResult.html?name=' + name + '&f=filterchosrlookup')
            } else if (objtypecode == 10) {
                opencenterwindow('/alert/deptchose.html?name=' + name + '&type=opener', '', 1200, 600)
                //$('#iframe').attr('src', '/alert/deptchose.html?name=' + name + '&f=filterchosrlookup')
            }
        },
        lookupchange: function (val) {
            var newarr = []
            for (var i = 0; i < val.length; i++) {
                for (var j = 0; j < this.search.length; j++) {
                    if (val[i] == this.search[j].ID) {
                        newarr.push(this.search[j])
                    }
                }
            }
            this.checked = newarr
        },
        searchlookup: function (query) {
            var that = this
            var d = {}
            d = {
                Lktp: this.Lktp,
                Lksrch: query
            }
            ajaxMethodGetData('ui.entity.lookup', d, callback)
            function callback(data) {
                that.search = data.listData
                for (var i = 0; i < that.checked.length; i++) {
                    if (JSON.stringify(that.search).indexOf(JSON.stringify(that.checked[i].ID)) == -1) {
                        that.search.push(that.checked[i])
                    }
                }
            }
        },
        getlookup: function () {
            this.searchlookup('')
        },
    }
});
$('.noPinned').click(function () {
    FilterListpin();
    $(this).hide();
    $('.Pinned').show();
});
$('.closed').click(function () {
    $('.shaixuans').hide();
    $('.shaixuan').removeClass('active');
    $('.objectManagerLeftNav').removeClass('active');
    $('#datagrid').datagrid('resize');
});
var operators = (_operators = {
    "eq": "等于"
}, _defineProperty(_operators, "eq", "不等于"), _defineProperty(_operators, "lt", "小于"), _defineProperty(_operators, "gt", "大于"), _defineProperty(_operators, "le", "小于或等于"), _defineProperty(_operators, "ge", "大于或等于"), _defineProperty(_operators, "like", "包含"), _defineProperty(_operators, "contains", "包含"), _defineProperty(_operators, "not-like", "不包含"), _defineProperty(_operators, "null", "空"), _defineProperty(_operators, "not-null", "不为空"), _defineProperty(_operators, "today", "今天"), _defineProperty(_operators, "tomorrow", "明天"), _defineProperty(_operators, "yesterday", "昨天"), _defineProperty(_operators, "last-week", "上一周"), _defineProperty(_operators, "this-month", "本月"), _defineProperty(_operators, "this-year", "今年"), _defineProperty(_operators, "birthday-today", "今天生日"), _operators);
var dataTypeOperators = {
    DataTime: [{
        "label": "等于",
        "operator": "eq"
    }, {
        "label": "不等于",
        "operator": "neq"
    }, {
        "label": "大于",
        "operator": "gt"
    }, {
        "label": "大于或等于",
        "operator": "ge"
    }, {
        "label": "小于",
        "operator": "lt"
    }, {
        "label": "小于或等于",
        "operator": "le"
    }, {
        "label": "自定义",
        "operator": "between"
    }],
    Text: [{
        "label": "等于",
        "operator": "eq"
    }, {
        "label": "包含",
        "operator": "contains"
    }, {
        "label": "不等于",
        "operator": "neq"
    }],
    Picklist: [{
        "label": "等于",
        "operator": "eq"
    }, {
        "label": "包含",
        "operator": "contains"
    }, {
        "label": "不等于",
        "operator": "neq"
    }, {
        "label": "范围",
        "operator": "in"
    }]
}; //condition.prototype.filter = null;

condition.prototype.type = "AND";
condition.prototype.conditions = null;
/*字段*/

function entityAttribute() { } //this.sort = 1;
//this.attribute = "";
//this.label = "";
//this.operator = "eq";
//this.logical = "AND";
//this.value = "";
// operators.["eq"]

/*
字段名称
*/


entityAttribute.prototype.name = null;
/*
字段标签
*/

entityAttribute.prototype.label = null;
/*
数据类型
*/

entityAttribute.prototype.dataType = null;
/*选项*/

entityAttribute.prototype.filterValues = null;
/*
过滤条件
{
   "column": "IsClosed",
   "label": "关闭",
   "operator": "EQUALS",
   "operands": ["0"],
   "dataType": "boolean",
   "picklistValues": [{
                    "value": "High",
                    "label": "High"
                }, {
                    "value": "Normal",
                    "label": "Normal"
                }, {
                    "value": "Low",
                    "label": "Low"
                }],
   "supportedOperators": ["EQUALS", "NOT_EQUAL"],
    "id": 0,
    "isEditable": true
}
*/

function condition() {
    this.sort = 1;
    this.attribute = "";
    this.label = "";
    this.operator = "eq";
    this.logical = "AND";
    this.value = "";
    this.picklistValues = [];
    this.isEditable = true;
}

condition.prototype.id = null;
/*排序*/

condition.prototype.sort = null;
/*
field name
*/

condition.prototype.attribute = null;
condition.prototype.column = null;
/*
字段标签
*/

condition.prototype.label = null;
/*
运算符合
*/

condition.prototype.operator = null;
/*logical*/

condition.prototype.logical = null;
/*
值    
*/

condition.prototype.value = null;
/*
数据类型
*/

condition.prototype.dataType = null;
/*
值文本
*/

condition.prototype.valueText = null;
/*
操作符文本
*/
//condition.prototype.operatorText = null;

/*
存值
*/

condition.prototype.operands = [];
/*可供选项值*/

condition.prototype.picklistValues = [];
/*是否可编辑*/

condition.prototype.isEditable = true;
/*
翻译
*/

condition.prototype.tranlsate = function () {
    if (this.operator) {
        if (this.operator != "") {
            this.operatorText = this.operators[this.operator];
        }
    }

    if (this.value) {
        if (this.value != "") {//this.valueText =this.operators[this.value];
        }
    }
};
/*过滤器*/


function filterExpression() {
    this.conditions = new Array();
}
/*条件*/


filterExpression.prototype.conditions = null;
/*默认*/

filterExpression.prototype.isDefault = false;
/*是否可以修改*/

filterExpression.prototype.isCustomizable = false;
/*
值    
*/

filterExpression.prototype.jsonString = null;
/*添加条件*/

/*
filterExpression.prototype.addCondition = function (attribute, operator, value, label,logical, sort) {
    var cond = new condition();
    cond.attribute = attribute;
    cond.operator = operator;
    cond.value = value;
    cond.label = label;
    cond.logical = logical;
    cond.sort = sort;
    this.conditions.push(cond);
}
*/

/*添加条件*/

filterExpression.prototype.add = function (column, label, operator, operands, logical, id, picklistValues) {
    var cond = new condition();
    cond.attribute = column;
    cond.column = column;
    cond.label = label;
    cond.operator = operator; //cond.value = value;

    cond.operands = operands;
    cond.picklistValues = picklistValues;
    cond.logical = logical;
    cond.isEditable = true;
    cond.sort = id;
    cond.id = id;
    this.conditions.push(cond);
};

filterExpression.prototype.toJson = function () {
    this.jsonString = JSON.stringify(this.conditions);
};

filterExpression.prototype.parseJson = function (json) {
    if (!json || json == "") return;
    this.conditions = JSON.parse(json);
};
/*列表查询器*/


function gridFilterDesinger(container, entityType, filterId) {
    this.url = "";
    this.filterExpression = new filterExpression();
    this.container = container;
    this.entityType = entityType;
    if (filterId) filterId = webContext.defaultFilterId;
    this.filterId = filterId;




    this.init(container);
} //继承


gridFilterDesinger.prototype.container = null;
gridFilterDesinger.prototype.node = null;
gridFilterDesinger.prototype.url = null;
gridFilterDesinger.prototype.entityType = "";
gridFilterDesinger.prototype.entityAttributes = new Array();
gridFilterDesinger.prototype.entity = null;
gridFilterDesinger.prototype.filterId = "";
gridFilterDesinger.prototype.filterExpression = null;
gridFilterDesinger.prototype.number = 0;

gridFilterDesinger.prototype.init = function (container) {
    if (this.node == null) {
        this.node = this.create();

        if (container != null) {
            container.appendChild(this.node);
        }


    }
    this.redraw();
};

gridFilterDesinger.prototype.create = function () {
    var ele = this.createHtml();
    return ele;
};

gridFilterDesinger.prototype.createHtml = function () {
    var node = document.createElement('DIV');
    this.configureHtml(node);
    return node;
};

gridFilterDesinger.prototype.configureHtml = function (node) { };
/*
添加条件
*/


gridFilterDesinger.prototype.edit = function () {
    var cond = this.entity.attributes;
    var that = this;
    $('.sectionable-table-row').off();
    $('.sectionable-table-row').click(function () {
        $('#chose').show();
        $(this).find('.sectionable-table-row-containers').addClass('sectionable-table-row-containers-new');
        var top = $(this).offset().top - 185;
        var height = $(window).height() - $('.portal-positioned').height() - 60;
        $('.portal-positioned').css('top', top);

        if (top > height) {
            $('.portal-positioned').css('top', height);
            $('.slds-popovers-point').css('margin-top', top - height);
        } else {
            $('.portal-positioned').css('top', top);
            $('.slds-popovers-point').css('margin-top', '0');
        }

        $('#chose .focuss ul').eq(0).find('li').remove();
        if (cond) {
            for (var i = 0; i < cond.length; i++) {
                var res = cond[i];
                var name = res.fieldName;
                var label = res.label;
                var dType = res.dType;
                $('#chose .focuss ul').eq(0).append("<li referencedEntityObjectTypeCode=\"" + res.referencedEntityObjectTypeCode + "\" class=\"slds-listbox__item\" name=\"" + name + "\"dType=\"" + dType + "\">\n                                                 <div class=\"focus_title\">\n                                                 <i class=\"iconfont icon-duihao\" style=\"opacity: 0\"></i>\n                                                     <span class=\"slds-media__body\">" + label + "</span>\n                                                 </div>\n                                              </li>");

                if (cond[i].name == $(this).find('.sectionable-table-row-containers').attr('attribute')) {
                    $('#chose .focuss ul').eq(0).find('.slds-listbox__item').eq(i).addClass('active');
                    var res = cond[i];
                    $('#ryz8MyRxN').val(res.label);
                    $('#ryz8MyRxN').attr('name', res.attribute);
                    $('.slds-combobox__form-element').eq(1).next('.focuss').find('ul li').remove();
                    var between = '';

                    for (var j = 0; j < res.operator.length; j++) {
                        var ress = res.operator[j];
                        var name = ress.operator;
                        var label = ress.label;
                        var operatorType = ress.operatorType

                        $('.slds-combobox__form-element').eq(1).next('.focuss').find('ul').append("<li class=\"slds-listbox__item\" name=\"" + name + "\"operatorType=\"" + operatorType + "\">\n                                                         <div class=\"focus_title\">\n                                                         <i class=\"iconfont icon-duihao\" style=\"opacity: 0\"></i>\n                                                             <span class=\"slds-media__body\">" + label + "</span>\n                                                         </div>\n                                                      </li>");

                        if (name == $(this).find('.sectionable-table-row-containers').attr('operator')) {
                            between = name;
                            $('#Text1').val(label);
                            $('.slds-combobox__form-element').eq(1).next('.focuss').find('ul').find('.slds-listbox__item').eq(j).addClass('active');
                        }
                    }
                    if (dType == 'Text') {
                        $('.value').show();
                        $('.timechook').hide();
                        $('.starttimechook').hide();
                        $('.checkboxdiv').hide()
                        $('.elementselect').hide()


                    } else if (dType == 'Picklist' || dType == 'DroplistText') {
                        $('.value').show();
                        $('.timechook').hide();
                        $('.starttimechook').hide();
                        $('.checkboxdiv').hide()
                        $('.elementselect').hide()


                    } else if (dType == 'DateTime' || dType == 'Date') {
                        $('.value').hide();
                        $('.timechook').show();
                        $('.checkboxdiv').hide()
                        $('.elementselect').hide()

                        if (between == 'between') {
                            $('.starttimechook').hide();
                            $('.timechook').show();
                        } else {
                            $('.starttimechook').hide();
                            $('.timechook').show();
                        }
                        $('.slds-listbox__item').click(function () {
                            if ($(this).attr('name') == 'between') {
                                $('.timechook').hide();
                                $('.starttimechook').show();
                            } else {
                                $('.starttimechook').hide();
                                $('.timechook').show();
                            }
                        })
                    } else if (dType == 'CheckBox') {
                        $('.value').hide();
                        $('.timechook').hide();
                        $('.starttimechook').hide();
                        $('.checkboxdiv').show();
                        $('.elementselect').hide()

                        if ($(that).find('.sectionable-table-row-containers').attr('picklistvalues') == '是') {
                            $('.buttoncheck').eq(0).addClass('active');
                        } else {
                            $('.buttoncheck').eq(1).addClass('active');
                        }
                    } else if (dType == 'User' || dType == 'BusinessUnit') {
                        $('.value').hide();
                        $('.timechook').hide();
                        $('.starttimechook').hide();
                        $('.checkboxdiv').hide();
                        $('.elementselect').show()
                        elementselect.Lktp = cond[i].referencedEntityObjectTypeCode
                        var elementselectvalue = $(this).find('.sectionable-table-row-containers').attr('value').split(',')
                        var elementselectname = $(this).find('.sectionable-table-row-containers').attr('picklistvalues').split(',')
                        elementselect.value = elementselectvalue
                        elementselect.search = []
                        elementselect.checked = []
                        for (var m = 0; m < elementselectvalue.length; m++) {
                            elementselect.search.push({
                                ID: elementselectvalue[m],
                                Name: elementselectname[m],
                            })
                            elementselect.checked.push({
                                ID: elementselectvalue[m],
                                Name: elementselectname[m],
                            })
                        }
                    } else {
                        $('.value').show();
                        $('.timechook').hide();
                        $('.starttimechook').hide();
                        $('.elementselect').hide()

                        $('.slds-combobox__form-element').eq(2).html("<input autocomplete=\"off\" type=\"text\" style=\"padding-left: 10px;\" class=\"slds-input slds-combobox__input focuss_input\" id=\"Text2\" placeholder=\"\u8BF7\u8F93\u5165\u503C\">");
                    }
                }
            }
        }


        $('.slds-listbox__item').click(function () {
            $(this).parent().find('.slds-listbox__item').removeClass('active');
            $(this).addClass('active');
            $(this).parents('.focuss').prev().find('input').val($(this).find('span').html());
            $(this).parents('.focuss').prev().find('input').attr('name', $(this).attr('name'));
            $('.focuss').hide();

            if ($(this).attr('operatortype') == '0') {
                $('.valuediv').hide();
            } else {
                $('.valuediv').show();
            }
            return false;
        });
        $('.slds-listbox__item[dtype]').click(function () {
            $('.slds-form-element.picklist-container.custom-range-picklist').find('.focuss_input').val('');
        });
        $(document).click(function () {
            $('.focuss').hide();
        });
        $('.slds-combobox__form-element').click(function () {
            $('.focuss').hide();
            $(this).next('.focuss').show();
            return false;
        });
        //console.log(that)
        that.addrowCondition(cond);
    });
};

gridFilterDesinger.prototype.addCondition = function (cond) {
    this.number++;
    sort = this.number; //console.log(this.entityType)
    //console.log(cond);

    var attribute = "";
    var label = "";
    var logical = "";
    var operator = "";
    var value = "";
    var dType = "";
    var picklistvalues = '';

    if (cond) {
        //console.log(cond)
        attribute = cond.attribute;
        operator = cond.operator;

        if (value) {
            value = cond.operands.join(',');
        } //dType = cond.dataType;








        label = cond.label;
        logical = cond.logical;

        if (cond.picklistValues) {
            if (cond.picklistValues.length > 0) {
                picklistvalues = cond.picklistValues.join(',');
            }
        }
        if (this.entity.attributes) {
            var entityAttribute = this.entity.attributes[attribute];

        }

        if (entityAttribute) {
            dType = entityAttribute.dataType;
            console.log(dType);
        }

        $('#gridFilter').append("<span>1.</span><li class=\"sectionable-table-row\" role=\"presentation\" draggable=\"false\">\n           <div class=\"sectionable-table-row-containers\" attribute=\"" + attribute + "\" operator=\"" + operator + "\" value=\"" + value + "\"picklistvalues=\"" + picklistvalues + "\"logical=\"" + logical + "\">\n               <div class=\"sectionable-table-row-actions\" style=\"width: 100%;\">\n                   <div class=\"sectionable-table-row-content\" style=\"width: 100%;\">\n                       <div class=\"filterContainer STANDARDDATE\" style=\"width: 100%;\">\n                           <div class=\"slds-filters__item slds-grid slds-grid--vertical-align-center\">\n                               <div class=\"slds-grow\" style=\"display: inline;\">\n                                   <button class=\"slds-button--reset slds-grow slds-has-blur-focus\" id=\"r1Wez7eB5l4\" tabindex=\"0\" style=\"text-align: left; width: 100%; padding: .5rem;\">\n                                       <span class=\"slds-assistive-text\">\u7F16\u8F91\u7B5B\u9009\u5668</span>\n                                       <p class=\"slds-text-body--small\">" + label + "</p>\n                                       <p>\n                                           <span class=\"filterPredicate\">" + logical + " " + picklistvalues + "</span>\n                                       </p>\n\n                                   </button>\n                               </div>\n                           </div>\n                       </div>\n                   </div>\n               </div>\n           </div>\n           <span class='delete-filterPredicate'>\xD7</span>\n\n        </li>");
        $('.delete-filterPredicate').click(function () {
            $('.sectionable-table-section-title').hide();
            $('.sectionable-table-section-title-head').show();
        });
    }

    $('#gridFilter .sectionable-table-row').each(function (index) {
        $(this).prev('span').html(index + 1 + '.');
    });
    var that = this;
    $('.addFilter').off();
    $('.addFilter').click(function () {
        that.showConditionDialog(top);
    }); //完成

    $('.filteredit-finish').click(function () {
        var attribute = $('.slds-popover__body>div').eq(0).find('input').attr('name');
        var operator = $('.slds-popover__body>div').eq(1).find('input').attr('name');
        var value = '';

        if ($('.value').css('display') != 'none') {
            if ($('.slds-popover__body>div').eq(2).find('input').attr('name')) {
                value = $('.slds-popover__body>div').eq(2).find('input').attr('name');
            } else {
                value = $('.slds-popover__body>div').eq(2).find('input').val();
            }
        }

        if ($('.timechook').css('display') != 'none') {
            value = $('.timechook input').val();
        } else if ($('.starttimechook').css('display') != 'none') {
            value = $('.starttimechook input').eq(0).val() + ',' + $('.starttimechook input').eq(1).val();
        }

        var valehtml = $('.slds-popover__body>div').eq(1).find('input').val();
        var picklistValues = '';

        if ($('.value').css('display') != 'none') {
            valehtml += ' ' + $('.slds-popover__body>div').eq(2).find('input').val();
            picklistValues = $('.slds-popover__body>div').eq(2).find('input').val();

        }

        else if ($('.timechook').css('display') != 'none') {
            valehtml += ' ' + $('.timechook input').val();
            picklistValues = $('.timechook input').val();

        } else if ($('.starttimechook').css('display') != 'none') {
            valehtml += ' ' + $('.starttimechook input').eq(0).val() + ',' + $('.starttimechook input').eq(1).val();
            picklistValues = $('.starttimechook input').eq(0).val() + ',' + $('.starttimechook input').eq(1).val();

        } else if ($('.checkboxdiv').css('display') != 'none') {
            valehtml += $('.buttoncheck.active').val();
            picklistValues = $('.buttoncheck.active').val();
            value = $('.buttoncheck.active').attr('name');
        }
        if ($('.valuediv').css('display') == 'none') {
            valehtml = $('.slds-popover__body>div').eq(1).find('input').val();
            value = valehtml
        }
        console.log('valehtml', valehtml)
        if ($('.elementselect').css('display') != 'none') {
            var arr1 = []
            var arr2 = []
            for (var i = 0; i < elementselect.checked.length; i++) {
                arr1.push(elementselect.checked[i].ID)
                arr2.push(elementselect.checked[i].Name)
            }
            value = arr1.join(',')
            valehtml = valehtml + arr2.join(',')
            picklistValues = arr2.join(',')
        }
        console.log(value)
        console.log(valehtml)
        console.log(picklistValues)
        var logical = $('.slds-popover__body>div').eq(1).find('input').val();
        if (value.indexOf(',') != -1) {
            var value1 = value.split(',')[0]
            var value2 = value.split(',')[1]
            if (value1 == '' || value2 == '') {
                value = ''
            }
        }
        if (logical == '') {
            $('#Text1').css('border', '1px solid red')
        } else {
            $('#Text1').css('border', '1px solid rgb(221, 219, 218)')
        }
        if (value != '' && logical != '') {
            $('.sectionable-table-row-containers-new').find('.slds-text-body--small').html($('.slds-popover__body>div').eq(0).find('input').val());
            $('.sectionable-table-row-containers-new').find('.filterPredicate').html(valehtml);
            $('.sectionable-table-row-containers-new').attr('attribute', attribute);
            $('.sectionable-table-row-containers-new').attr('operator', operator);
            $('.sectionable-table-row-containers-new').attr('value', value);
            $('.sectionable-table-row-containers-new').attr('picklistValues', picklistValues);
            $('.sectionable-table-row-containers-new').attr('logical', logical);
            $('#chose').hide();
            $('.sectionable-table-section-title-head').show();
            $('.sectionable-table-section-title').hide();
            $('.sectionable-table-row-containers-new').removeClass('sectionable-table-row-containers-new');
            $('#Text2').css('border', '1px solid rgb(221, 219, 218)')
            $('.el-input__inner').css('border', '1px solid rgb(221, 219, 218)')
        } else {
            $('#Text2').css('border', '1px solid red')
            $('.el-input__inner').css('border', '1px solid red')
        }
    });
    $('.delete-filterPredicate').click(function () {
        $(this).parents('.sectionable-table-row').prev('span').remove();
        $(this).parents('.sectionable-table-row').remove();
    });
    this.edit();
};

gridFilterDesinger.prototype.addrowCondition = function (data) {
    $('.slds-combobox__form-element').eq(0).next().find('li').click(function () {
        console.log(data);
        $('.slds-combobox__form-element').eq(1).next('.focuss').find('ul li').remove();
        elementselect.value = []
        elementselect.search = []
        elementselect.checked = []
        elementselect.Lktp = $(this).attr('referencedEntityObjectTypeCode')
        for (var i = 0; i < data[$(this).index()].operator.length; i++) {
            var res = data[$(this).index()].operator[i];
            var name = res.operator;
            var label = res.label;
            var operatorType = res.operatorType
            $('.slds-combobox__form-element').eq(1).next('.focuss').find('ul').append("<li class=\"slds-listbox__item\" name=\"" + name + "\"operatorType=\"" + operatorType + "\">\n                                                 <div class=\"focus_title\">\n                                                 <i class=\"iconfont icon-duihao\" style=\"opacity: 0\"></i>\n                                                     <span class=\"slds-media__body\">" + label + "</span>\n                                                 </div>\n                                              </li>");

        }

        if ($(this).attr('dType') == 'Picklist2') {
            $('.value').show();
            $('.timechook').hide();
            $('.starttimechook').hide();
            $('.checkboxdiv').hide();
            $('.elementselect').hide()

            $('.slds-combobox__form-element').eq(2).find('.slds-icon_container').remove();
            $('.slds-combobox__form-element').eq(2).append("\n                <span class=\"slds-icon_container slds-input__icons slds-input__icon_right\" style=\"right: 8px;\">\n                      <i class=\"iconfont icon-f11\" style=\"font-size: 15px;\"></i>\n                </span>");
            $('.slds-combobox__form-element').eq(2).next('.focuss').remove();
            $('.slds-combobox__form-element').eq(2).after("<div class=\"focuss\" style=\"width: 98%; display: block;\"><ul></ul></div>");

            for (var i = 0; i < data[$(this).index()].filterValues.length; i++) {
                var res = data[$(this).index()].filterValues[i];
                var name = res.name;
                var label = res.label;
                $('.slds-combobox__form-element').eq(2).next('.focuss').find('ul').append("\n                                             <li class=\"slds-listbox__item\" name=\"" + name + "\">\n                                                <div class=\"focus_title\">\n                                                <i class=\"iconfont icon-duihao\" style=\"opacity: 0\"></i>\n                                                    <span class=\"slds-media__body\">" + label + "</span>\n                                                </div>\n                                             </li>");
            }
        } else if ($(this).attr('dType') == 'Picklist' || $(this).attr('dType') == 'DroplistText') {
            $('.value').show();
            $('.timechook').hide();
            $('.starttimechook').hide();
            $('.checkboxdiv').hide();
            $('.elementselect').hide()

            $('.slds-combobox__form-element').eq(2).find('.slds-icon_container').remove();
            $('.slds-combobox__form-element').eq(2).append("\n                <span class=\"slds-icon_container slds-input__icons slds-input__icon_right\" style=\"right: 8px;\">\n                      <i class=\"iconfont icon-f11\" style=\"font-size: 15px;\"></i>\n                </span>");
            $('.slds-combobox__form-element').eq(2).next('.focuss').remove();
            $('.slds-combobox__form-element').eq(2).after("<div class=\"focuss\" style=\"width: 98%; display: block;\"><ul></ul></div>");

            for (var i = 0; i < data[$(this).index()].filterValues.length; i++) {
                var res = data[$(this).index()].filterValues[i];
                var name = res.name;
                var label = res.label;
                $('.slds-combobox__form-element').eq(2).next('.focuss').find('ul').append("\n                                             <li class=\"slds-listbox__item picklist\" name=\"" + name + "\">\n                                                <div class=\"focus_title\">\n                                                <i class=\"iconfont icon-duihao\" style=\"opacity: 0\"></i>\n                                                    <span class=\"slds-media__body\">" + label + "</span>\n                                                    \n                                                </div>\n                                             </li>");
            }
        } else if ($(this).attr('dType') == 'DateTime' || $(this).attr('dType') == 'Date') {
            $('.value').hide();
            $('.timechook').show();
            $('.checkboxdiv').hide();
            $('.elementselect').hide()

            $('.slds-listbox__item[operatortype]').click(function () {
                if ($(this).attr('name') == 'between') {
                    $('.timechook').hide();
                    $('.starttimechook').show();
                } else {
                    $('.starttimechook').hide();
                    $('.timechook').show();
                }
            });
        } else if ($(this).attr('dType') == 'CheckBox') {
            $('.value').hide();
            $('.timechook').hide();
            $('.starttimechook').hide();
            $('.checkboxdiv').show();
            $('.elementselect').hide()

        } else if ($(this).attr('dType') == 'User' || $(this).attr('dType') == 'BusinessUnit') {
            $('.value').hide();
            $('.timechook').hide();
            $('.starttimechook').hide();
            $('.checkboxdiv').hide();
            $('.elementselect').show()
        } else {
            $('.slds-combobox__form-element').eq(2).next('.focuss').remove();
            $('.elementselect').hide()

            $('.value').show();
            $('.checkboxdiv').hide();
            $('.timechook').hide();
            $('.starttimechook').hide();
            $('.slds-combobox__form-element').eq(2).html("<input autocomplete=\"off\" type=\"text\" style=\"padding-left: 10px;\" class=\"slds-input slds-combobox__input focuss_input\" id=\"Text2\" placeholder=\"\u8BF7\u8F93\u5165\u503C\">");
        }

        $('.slds-listbox__item').click(function () {
            $(this).parent().find('.slds-listbox__item').removeClass('active');
            $(this).addClass('active');
            $(this).parents('.focuss').prev().find('input').val($(this).find('span').html());
            $(this).parents('.focuss').prev().find('input').attr('name', $(this).attr('name'));
            $('.focuss').hide();
            if ($(this).attr('operatortype') == '0') {
                $('.valuediv').hide();
            } else {
                $('.valuediv').show();
            }
            return false;
        });
        $('.slds-listbox__item[dtype]').click(function () {
            $('.slds-form-element.picklist-container.custom-range-picklist').find('.focuss_input').val('');
        });
        $('.picklist').off();
        var html = [];
        var name = [];
        $('.slds-combobox__form-element').eq(2).next('.focuss').find('ul').find('.slds-listbox__item').click(function () {
            $(this).toggleClass('active');

            if ($(this).hasClass('active')) {
                html.push($(this).find('span').html());
                name.push($(this).attr('name'));
            } else {
                html.splice(html.indexOf($(this).children('a').html()), 1);
                name.splice(name.indexOf($(this).attr('name')), 1);
            } // console.log(html)
            // console.log(name)


            $(this).parents('.focuss').prev().find('input').val(html.join(','));
            $(this).parents('.focuss').prev().find('input').attr('name', name.join(',')); //$('.scrollable_ul').hide();

            return false;
        });
        $('.slds-combobox__form-element').click(function () {
            $(this).next().show();
            return false;
        });
        $(document).click(function () {
            $('.focuss').hide();
        });
    });
};

gridFilterDesinger.prototype.showConditionDialog = function () {
    $('#chose').show(); //console.log(this.entity.attributes)

    $('#chose .focuss ul').eq(0).find('li').remove();
    var data = this.entity.attributes;
    if (data) {
        for (var i = 0; i < data.length; i++) {
            var res = data[i];
            var name = res.fieldName;
            var label = res.label;
            var dType = res.dType;
            $('#chose .focuss ul').eq(0).append("<li  referencedEntityObjectTypeCode=\"" + res.referencedEntityObjectTypeCode + "\" class=\"slds-listbox__item\" name=\"" + name + "\"dType=\"" + dType + "\">\n                                             <div class=\"focus_title\">\n                                             <i class=\"iconfont icon-duihao\" style=\"opacity: 0\"></i>\n                                                 <span class=\"slds-media__body\">" + label + "</span>\n                                             </div>\n                                          </li>");
        }
    }


    $('.slds-combobox__form-element').click(function () {
        $('.focuss').hide();
        $(this).next('.focuss').show();
    });
    this.addrowCondition(data);
    $('.slds-listbox__item').click(function () {
        $(this).parent().find('.slds-listbox__item').removeClass('active');
        $(this).addClass('active');
        $(this).parents('.focuss').prev().find('input').val($(this).find('span').html());
        $(this).parents('.focuss').prev().find('input').attr('name', $(this).attr('name'));
        $('.focuss').hide();
    });
    $('#gridFilter').append("<span></span><li class=\"sectionable-table-row\" role=\"presentation\" draggable=\"false\">\n   <div class=\"sectionable-table-row-containers sectionable-table-row-containers-new\">\n       <div class=\"sectionable-table-row-actions\" style=\"width: 100%;\">\n           <div class=\"sectionable-table-row-content\" style=\"width: 100%;\">\n               <div class=\"filterContainer STANDARDDATE\" style=\"width: 100%;\">\n                   <div class=\"slds-filters__item slds-grid slds-grid--vertical-align-center\">\n                       <div class=\"slds-grow\" style=\"display: inline;\">\n                           <button class=\"slds-button--reset slds-grow slds-has-blur-focus\" id=\"r1Wez7eB5l4\" tabindex=\"0\" style=\"text-align: left; width: 100%; padding: .5rem;\">\n                               <span class=\"slds-assistive-text\">\u7F16\u8F91\u7B5B\u9009\u5668</span>\n                               <p class=\"slds-text-body--small\">\u65B0\u5EFA\u7B5B\u9009\u5668</p>\n                               <p>\n                                   <span class=\"filterPredicate\">&nbsp</span>\n                               </p>\n                               \n                           </button>\n                       </div>\n                   </div>\n               </div>\n           </div>\n       </div>\n   </div>\n    <span class='delete-filterPredicate'>\xD7</span>\n</li>");
    var top = $('#gridFilter .sectionable-table-row:last').offset().top - 185;
    var height = $(window).height() - $('.portal-positioned').height() - 60;
    $('.portal-positioned').css('top', top);

    if (top > height) {
        //console.log(top);
        $('.portal-positioned').css('top', height);
        $('.slds-popovers-point').css('margin-top', top - height);
    } else {
        $('.portal-positioned').css('top', top);
        $('.slds-popovers-point').css('margin-top', '0');
    }

    $('#gridFilter .sectionable-table-row').each(function (index) {
        $(this).prev('span').html(index + 1 + '.');
    });
    $('.delete-filterPredicate').click(function () {
        $(this).parents('.sectionable-table-row').prev('span').remove();
        $(this).parents('.sectionable-table-row').remove();
    });
    this.edit();
};
/*
删除条件
*/


gridFilterDesinger.prototype.removeCondition = function () { };
/*
获取条件数据
*/


gridFilterDesinger.prototype.getFilterExpression = function () {
    var objTypeCode = getQueryString('objTypeCode')
    if (!objTypeCode) {
        objTypeCode = getQueryString('ObjectTypeCode')
    }
    if (!objTypeCode) {
        objTypeCode = window.objTypeCode
    }
    var url = "/apps/CommandProcessor.ashx?cmd=entity.attribute.getlist"
    var self = this;
    var d = {
        objTypeCode: objTypeCode
    }
    jQuery.ajax({
        async: false,
        cache: true,
        dataType: "json",
        data: d,
        error: function error(request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function success(data, textStatus) {
            if (data) {
                $('.slds-breadcrumb__item span').html(data.label)
                console.log(data); //self.entityAttributes = data.attributes;
                //self.processAttributes(data.attributes);
                self.entity = {}
                self.entity.attributes = data.attributes;
                var filter = ''
                if (filter.length > 0) {
                    //debugger;
                    var filterExp = filter[0];

                    if (filterExp.FilterExpression != "") {
                        self.filterExpression.conditions = JSON.parse(filterExp.FilterExpression);
                    }
                } //self.processAttributes();

            }
        },
        type: "POST",
        url: url
    });
};

gridFilterDesinger.prototype.ajaxEntityAttributes = function () {
    var url = "/apps/CommandProcessor.ashx?cmd=entity.attribute.getlist&entityCode=" + this.entityType;
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
            //if (callback)
            //    callback(data);
            //debugger;
            if (data) {
                //console.log(data)
                self.entityAttributes = data.attributes;
                self.processAttributes(data.attributes);
            }
        },
        type: "POST",
        url: url
    });
};

gridFilterDesinger.prototype.processAttributes = function (entityAttributes) { };
/*根据xml,json加载Designer*/


gridFilterDesinger.prototype.redraw = function () {
    //if (this.dialect == mxConstants.DIALECT_SVG) {
    //    this.redrawSvg();
    //}
    //else if (mxUtils.isVml(this.node)) {
    //    this.redrawVml();
    //}
    //else {
    this.redrawHtml(); //}
};
/**
 * Function: redrawHtml
 *
 * Redraws this HTML shape by invoking <updateHtmlShape> on this.node.
 */


gridFilterDesinger.prototype.redrawHtml = function () {
    this.updateHtmlShape(this.node);

};
/*保存*/
gridFilterDesinger.prototype.getconfig = function () {
    ajaxMethodGetData('entitygrid.config.get', {
        objecttypecode: webContext.objectTypeCode
    }, function (data) {
        for (var i = 0; i < data.DataSet.Columns.length; i++) {
            var res = data.DataSet.Columns[i]
            displayColumnApiNames.push(res.Name)
            displayColumnApiNamestitle.push(res.Title)
        }
        addColumn()
    })
};
gridFilterDesinger.prototype.updateHtmlShape = function (ele) {

    //this.ajaxEntityAttributes();
    this.getFilterExpression()
    this.getconfig()
    var html = "";

    if (this.filterExpression.conditions.length == 0) {
        $('.sectionable-table-row').remove();
        $('.section-table-rows-container.slds-list--vertical.slds-list--vertical-space span').remove(); //加载数据

        html += this.addCondition(null, 0); //加空行
    } else {
        for (var i = 0; i < this.filterExpression.conditions.length; i++) {
            var cond = this.filterExpression.conditions[i];
            html += this.addCondition(cond, i);
        }
    } //this.saveDB()

};
/*保存*/


gridFilterDesinger.prototype.clear = function () {
    this.saveDB()
}
gridFilterDesinger.prototype.saveDB = function () {
    //debugger;
    this.getFilter();
    var that = this;

    function callback(data) {
        // console.log(data);
        window.success("筛选器保存成功");
        $('.sectionable-table-section-title-head').hide();
        $('.sectionable-table-section-title').show();
    }

    var strConditions = JSON.stringify(this.filterExpression.conditions);
    var filterId = webContext.defaultFilterId; //var EvaluationFormId = '';

    var d = {
        id: filterId,
        ObjectTypeCode: webContext.objectTypeCode,
        filterExpression: strConditions
    };
    ajaxMethodPostData("entity.filter.expression.save", d, callback);
    var displayCols = displayColumnApiNames.join(',')
    var d = {
        id: filterId,
        ObjectTypeCode: webContext.objectTypeCode,
        displayCols: displayCols
    }
    ajaxMethodPostData('entity.filter.column.save', d, null);

};
gridFilterDesinger.prototype.search = function () {
    this.getFilter();
    var strConditions = this.filterExpression.conditions
    //debugger;
    var entityType = 800
    var objTypeCode = 1010

    if (getQueryString('entityType')) {
        entityType = getQueryString('entityType')
    }
    if (getQueryString('ObjectTypeCode')) {
        objTypeCode = getQueryString('ObjectTypeCode')
    }
    if (!objTypeCode) {
        objTypeCode = window.objTypeCode
    }
    var message = {
        params: {
            entityKeyPrefixOrApiName: 'Contract',
            listViewIdOrName: '',
            entityType: entityType,
            objTypeCode: objTypeCode,
            label: null,
            visibility: null,
            displayColumnApiNames: displayColumnApiNames,
            listViewFieldCriteria: strConditions
        }
    }
    message = JSON.stringify(message)
    var d = {
        message: message
    }
    messages = message
    if (displayColumnApiNames == '') {
        error('请选择显示列')
    } else {
        $('.table-body').hide()
        var grid = new listGrid('', '800')
        grid.init()
        $('#gridContainer').show()
        $('#datagrid').datagrid('resize');
    }
}

gridFilterDesinger.prototype.printxls = function () {
    //debugger;
    this.getFilter();
    var strConditions = this.filterExpression.conditions

    var entityType = 800
    var objTypeCode = 1010

    if (getQueryString('entityType')) {
        entityType = getQueryString('entityType')
    }
    if (getQueryString('ObjectTypeCode')) {
        objTypeCode = getQueryString('ObjectTypeCode')
    }
    if (!objTypeCode) {
        objTypeCode = window.objTypeCode
    }
    var message = {
        params: {
            entityKeyPrefixOrApiName: 'Contract',
            listViewIdOrName: '',
            entityType: entityType,
            objTypeCode: objTypeCode,
            label: null,
            visibility: null,
            displayColumnApiNames: displayColumnApiNames,
            listViewFieldCriteria: strConditions,
            outFormat: 'xls'
        }
    }
    message = JSON.stringify(message)
    var d = {
        message: message
    }
    messages = message
    if (displayColumnApiNames == '') {
        error('请选择显示列')
    } else {
        var queryParams = {
            message: window.messages
        }
        openWindowWithPost('/apps/CommandProcessor.ashx?cmd=entity.advance.search', queryParams)
    }
}
$('.selectlist li').eq(1).click(function () {

    gridFilter.printxls()
})
/*
获取条件数据
*/

gridFilterDesinger.prototype.getFilter = function () {
    var that = this; //var cond = new condition();
    var label = "";
    var operator = "";
    var attribute = "";
    var value = "";
    var logical = "";
    var sort = 1;
    var valuehtml = '';
    that.filterExpression.conditions = new Array();
    $('ul.section-table-rows-container .sectionable-table-row').each(function () {
        attribute = $(this).find('.sectionable-table-row-containers').attr('attribute');
        operator = $(this).find('.sectionable-table-row-containers').attr('operator');
        value = $(this).find('.sectionable-table-row-containers').attr('value');
        label = $(this).find('.slds-text-body--small').html();
        picklistValue = $(this).find('.sectionable-table-row-containers').attr('picklistvalues');

        //var sort = $(this).index()
        //that.filterExpression.addCondition(attribute,operator,value,label,logical,sort);

        picklistValues = picklistValue.split(',');
        var operands = null;

        if (value) {
            operands = value.split(',');
        } else {
            operands = $(this).find('.sectionable-table-row-containers').attr('logical');
        }

        that.filterExpression.add(attribute, label, operator, operands, logical, sort, picklistValues);
        sort++;
    });
};

var gridFilter = null;

function showFilterDesinger() {
    console.log(111)
    if (webContext.defaultFilterId) {
        if (webContext.defaultFilterId != "") {
            //debugger;
            var container = document.getElementById("gridFilter");
            gridFilter = new gridFilterDesinger(container, webContext.entityType, webContext.defaultFilterId); // 
            // gridFilter.init(container);
        }
    }
}

jQuery(document).ready(function () {
    //getFilterList();
    $('#saveDb').off();
    $('#saveDb').click(function () {
        //gridFilter.saveDB();
        $('#iframe').attr('src', '/alert/filter/new.html?type=newfilter2');
        $('#changeDiv').show();
        $('#iframe').show();
    });
    $('.removeAll').click(function () {
        $('#gridFilter').children().remove();
        $('.sectionable-table-section-title-head').show();
        $('.sectionable-table-section-title').hide();
    })
    $('#retuenDb').off();
    $('#retuenDb').click(function () {
        $('#gridContainer>div').remove()

        gridFilter.search()

    });
    $('#save-more').off();
    $('#save-more').click(function () {
        $('.remarkList').show();
        return false;
    });
    $(document).click(function () {
        $('.remarkList').hide();
    });
});
$('.header-left-title .selectinput').one('click', function () {
    getFilterList()
})
function success(type) {
    $("body").append("<div class=\"success green\">\n            <span class=\"success_icon\">\n            <i class=\"iconfont icon-duihao\"><img src='/img/images/00.3.Check.png'></img></i>\n            </span>\n            <div class=\"toastContent slds-notify__content\" style=\"flex: 1;\">\n            <div class=\"slds-align-middle slds-hyphenate\" style=\"font-size: 16px;\">\n            <span class=\"toastMessage slds-text-heading--small forceActionsText\">" + type + "</span>\n    </div>\n    </div>\n    <button class=\"button\">\n    <i class=\"iconfont icon-cuohao\"></i>\n    </button>\n    </div>");
    setTimeout(function () {
        $(".success").remove();
    }, 3000);
}
function error(type) {
    $("body").append("<div class=\"success red\">\n            <span class=\"success_icon\">\n            <i class=\"iconfont icon-duihao\"><img src='/img/cal/16.close_2(14x14).png'></img></i>\n            </span>\n            <div class=\"toastContent slds-notify__content\" style=\"flex: 1;\">\n            <div class=\"slds-align-middle slds-hyphenate\" style=\"font-size: 16px;\">\n            <span class=\"toastMessage slds-text-heading--small forceActionsText\">" + type + "</span>\n    </div>\n    </div>\n    <button class=\"button\">\n    <i class=\"iconfont icon-cuohao\"></i>\n    </button>\n    </div>");
    setTimeout(function () {
        $(".success").remove();
    }, 3000);
}

//获取图表字段
$('.neww').click(function () {
    window.location.reload()
})



listGrid.prototype.initConfig = function () {
    var toolBar = [];
    var columnsArray = [];
    var col = {
        field: 'ids',
        checkbox: true
    };
    columnsArray.push(col);
    var self = this;
    ajaxData("entitygrid.config.get", {
        gd: this.b,
        entityType: this.entityType,
        filterId: this.filterId
    }, function fn(data) {
        webContext.objectTypeCode = data.ObjectTypeCode;
        webContext.entityType = data.EntityType;
        var col = {
            field: "Action",
            title: "操作",
            formatter: function formatter(value, row, index) {
                return formatOper(value, row, index, self.entityType);
            }
        };
        columnsArray.push(col);

        var cols = window.displayColumnApiNames
        for (var i = 0; i < cols.length; i++) {
            var c = cols[i];
            var col = {
                field: c,
                title: displayColumnApiNamestitle[i],
                sortable: true
            };
            columnsArray.push(col);
        }

        self.columns = columnsArray;
        var tb = data.Toolbar;
        var tHTML = ""; //debugger;

        tHTML += "<div style='height:12px;'></div>";
        tHTML += "<table id=\"datagrid\" title=\"\" class=\"easyui-datagrid\" style=\"height: 100%;\"></table>";
        $("#gridContainer").append(tHTML);
        var treeHeight = getClientHeight();
        treeHeight = treeHeight - 111 - 37 - 75;
        jQuery("#gridContainer").height(treeHeight);
        console.log(columnsArray)
    }, false, true);
};
listGrid.prototype.initGrid = function (columnsArray, message) {
    var self = this; //debugger;
    if (!message) message = "";
    $('#datagrid').datagrid({
        columns: [columnsArray],
        /*toolbar: [this.toolbar],
        toolbar: this.toolbar,*/
        fitCloumns: true,
        idField: "LIST_RECORD_ID",
        singleSelect: false,
        checkOnSelect: true,
        method: 'POST',
        pagination: true,
        rownumbers: true,
        url: "/apps/CommandProcessor.ashx?cmd=entity.advance.search",
        striped: false,
        // 隔行变色特性
        pageSize: 10,
        pageList: [10, 15, 20, 25, 30, 50, 100],
        queryParams: {
            message: window.messages
        },
        onLoadSuccess: function (data) {
            $('.slds-form-element__static.slds-truncate span').html(data.total)
        },
        /*
        frozenColumns : [ [ 
        {
            field : 'ids',
            width : 30,
            checkbox : true
        } ] ],
        */
        onDblClickRow: function onDblClickRow(index, row) {//debugger;
            //editDialog(row.LIST_RECORD_ID, self.entityType);
        }
    });
};