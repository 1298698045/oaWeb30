var commonUtils =
{
    IS_IE: (navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER' && !(navigator.userAgent.indexOf('MSIE 8') >= 0 || navigator.userAgent.indexOf('MSIE 9') >= 0)),
    IS_IE7: navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER' && navigator.userAgent.indexOf('MSIE 7') >= 0,
    IS_IE8: navigator.appName.toUpperCase() == 'MICROSOFT INTERNET EXPLORER' && navigator.userAgent.indexOf('MSIE 8') >= 0,
    IS_IE11: !!navigator.userAgent.match(/Trident\/7\./),
    IS_NS: navigator.appName == 'Netscape1',
    IS_FF2: navigator.userAgent.indexOf('Firefox/2') >= 0 || navigator.userAgent.indexOf('Iceweasel/2') >= 0,
    IS_FF3: navigator.userAgent.indexOf('Firefox/3') >= 0 || navigator.userAgent.indexOf('Iceweasel/3') >= 0 || navigator.userAgent.indexOf('Firefox') >= 0,
    IS_FF5: navigator.userAgent.indexOf('Mozilla') >= 0,
    IS_H5: navigator.userAgent.indexOf('Mozilla/5') >= 0,
    IS_Chrome: navigator.userAgent.indexOf('Chrome') >= 0,
    IS_GC: 0 <= navigator.userAgent.indexOf("Chrome/"),
    IS_AppleWebKit: navigator.userAgent.indexOf('AppleWebKit') >= 0,
    OS_WIN7: navigator.userAgent.indexOf('Windows NT 6') >= 0,
    OS_WIN10: navigator.userAgent.indexOf('Windows NT 10') >= 0,
    isBrowserSupported: function () {
        if(commonUtils.IS_IE8 || commonUtils.IS_IE7)
            return false;
        return commonUtils.IS_Chrome || commonUtils.IS_GC || commonUtils.IS_H5 || commonUtils.IS_FF5 || commonUtils.IS_IE11 || commonUtils.IS_AppleWebKit;
    }
}
function debuggerLog(d)
{
    console.log(d);
}
function isNumeric(input) {
    var RE = /^-{0,1}\d*\.{0,1}\d+$/;
    return (RE.test(input));
}
function isDate(input) {
    var str = input;
    if (str.length != 0) {
        var reg = /^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/;
        var r = str.match(reg);
        if (r == null)
            return false;//请将“日期”改成你需要验证的属性名称!
        else {
            var d = new Date(r[1], r[3] - 1, r[4]);
            return (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[4]);
        }
    }
    return true;
}
function openWindow(url,title)
{
    window.open(url, title, 'titlebar=yes,fullscreen=yes,top=0,left=0,resizable=yes,scrollbars=yes,menubar=yes');
}
function openWindowWithPost(url, data) {
    var form = document.createElement("form");
    form.target = "_blank";
    form.method = "POST";
    form.action = url;
    form.style.display = "none";

    for (var key in data) {
        var input = document.createElement("input");
        input.type = "hidden";
        input.name = key;
        input.value = data[key];
        form.appendChild(input);
    }

    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
}
var dialogs = {};
function showDialog(url, dialogName, dialogTitle, width, height) {
    var c = b = null;
    c = dialogName;// "notifyInstance";
    //debugger;
    b = url;
    var dialog = null;
    //var dialog = new CollaborationAccessibleDialog(c, '催办', b, 450, 530);

    if (!dialogs[c]) {

        dialog = new NonaccessibleDialog(c, dialogTitle, b, height, width); //CollaborationAccessibleDialog
        dialogs[c] = dialog;
    }
    else {
        dialog = dialogs[c];
        dialog.url = b;
    }

    dialog.display();
}
function closeLayerDialog(refreshParent) {
    if (window.opener) {
        window.opener.closeDialog(refreshParent);
    } else {
        window.parent.closeDialog(refreshParent);
    }
}
function getCookie(c_name) {
    //debugger;
    var i, x, y, ARRcookies = document.cookie.split(";");
    for (i = 0; i < ARRcookies.length; i++) {
        x = ARRcookies[i].substr(0, ARRcookies[i].indexOf("="));
        y = ARRcookies[i].substr(ARRcookies[i].indexOf("=") + 1);
        x = x.replace(/^\s+|\s+$/g, "");
        if (x == c_name) {
            //return unescape(y);
            return decodeURIComponent(y);
        }
    }
}
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = location.search.substr(1).match(reg);
    if (r != null) return unescape(decodeURI(r[2])); return "";
}

function getClientHeight() {
    var x = 0, y = 0;
    if (self.innerHeight) // all except Explorer
    {
        x = self.innerWidth;
        y = self.innerHeight;
    }
    else if (document.documentElement && document.documentElement.clientHeight) // Explorer 6 Strict Mode        
    {
        x = document.documentElement.clientWidth;
        y = document.documentElement.clientHeight;
    }
    else if (document.body) // other Explorers
    {
        x = document.body.clientWidth;
        y = document.body.clientHeight;
    }
    return y;
}
function getClientWidth() {
    var x = 0, y = 0;
    if (self.innerHeight) // all except Explorer
    {
        x = self.innerWidth;
        y = self.innerHeight;
    }
    else if (document.documentElement && document.documentElement.clientHeight) // Explorer 6 Strict Mode        
    {
        x = document.documentElement.clientWidth;
        y = document.documentElement.clientHeight;
    }
    else if (document.body) // other Explorers
    {
        x = document.body.clientWidth;
        y = document.body.clientHeight;
    }
    return x;
}
function getFilterCondition() {
    var b = "", c = "", g = "", h = "";

    jQuery("input[searchColumn^='true']").each(function (index, value) {
        var fullId = jQuery(this).attr("id");
        //debugger;
        //var fieldName = fullId.substr(7);
        c = jQuery(this).attr("datafield");//column name 
        g = jQuery(this).attr("dataope");//operator
        h = jQuery(this).val();          //value

        function encodeForSearch(a) {
            return window.encodeURIComponent ? encodeURIComponent(a) : escape(a);
        }

        "" != c && "" != g && (b = b + "\n" + encodeForSearch(c), b = b + "\t" + encodeForSearch(g), b = b + "\t" + h)
    });
    // debugger;
    jQuery("select[searchColumn^='true']").each(function (index, value) {
        //jQuery("select").each(function (index, value) {
        var fullId = jQuery(this).attr("id");

        //var fieldName = fullId.substr(7);
        c = jQuery(this).attr("datafield");//column name 
        //c = fullId;
        //g = jQuery(this).attr("dataope");//operator
        g = "eq";
        h = jQuery(this).val();          //value
        //alert(c+" "+g+" "+h);
        function encodeForSearch(a) {
            return window.encodeURIComponent ? encodeURIComponent(a) : escape(a);
        }

        "" != c && "" != g && (b = b + "\n" + encodeForSearch(c), b = b + "\t" + encodeForSearch(g), b = b + "\t" + h)
    });

    return b;
}
function initDatePicker() {
    var date = new Date();
    var curYear = date.getFullYear();
    var startYear = curYear - 10;
    var endYear = curYear + 10;
    var eleSelect = document.getElementById("calYearPicker");
    //debugger;
    for (var y = startYear; y <= endYear; y++) {
        var opt = new Option(y, y);
        if (y == curYear) {
            opt.selected = true;
        }
        if (eleSelect&&eleSelect.options) {
            eleSelect.options.add(opt);
        }
    }
}
$(document).ready(function () {
    initDatePicker()
})
var rootUrl = "/apps/CommandProcessor.ashx?c=1";
function ajaxMethodGetData(method, d, callback, errorcallback) {
    ajaxMethodGetAsyncData(method, d, true, callback, errorcallback);
}
function ajaxMethodGetAsyncData(method, d, async, callback, errorcallback) {
    var url = rootUrl + "&cmd=" + method;
    //url += queryString;
    jQuery.ajax({
        async: async, cache: false, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            if (errorcallback)
                errorcallback();
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            if (callback)
                callback(data);
        },
        type: "GET",
        url: url
    });
}
function ajaxData(method, d, callback, async, cache) {
    var url = rootUrl + "&cmd=" + method;

    if (!async) async = true;
    if (!cache) cache = true;
    //url += queryString;
    jQuery.ajax({
        async: false, cache: cache, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            // errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            //debugger;
            if (callback)
                callback(data);
        },
        type: "GET",
        url: url
    });
}
function ajaxMethodGetData(method, d, callback) {
    var url = rootUrl + "&cmd=" + method;
    //url += queryString;
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            if (callback)
                callback(data);
        },
        type: "GET",
        url: url
    });
}
function ajaxMethodGetData2(method, d, callback) {
    var url = rootUrl + "&cmd=" + method;
    //url += queryString;
    jQuery.ajax({
        async: false, cache: false, 
        data: d,
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            if (callback)
                callback(data);
        },
        type: "GET",
        url: url
    });
}
function ajaxMethodPostData(method, d, callback, errorcallback) {
    var url = rootUrl + "&cmd=" + method;
    //url += queryString;
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            if (errorcallback)
                errorcallback();
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {

            if (callback)
                callback(data);
        },
        type: "post",
        url: url
    });
}
function ajaxMethodPOSTData(method, d, callback) {
    var url = rootUrl + "&cmd=" + method;
    //url += queryString;
    jQuery.ajax({
        async: false, cache: false, dataType: "json",
        data: d,
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            if (callback)
                callback(data);
        },
        type: "post",
        url: url
    });
}
function renameDialog(objectTypeCode, id, name) {
    //debugger;
    showDialog("/alert/common/rename.aspx?objectTypeCode=" + objectTypeCode + "&id=" + id + "&name=" + encodeURIComponent(name), "reName", "修改名称", 500, 300);
}
function getInputCheckedValue(eleName) {
    return $("input[name='" + eleName + "']:checked");
}
function getChecklistValues(name)
{
    var valIds = "";
    jQuery("input[name='"+name+"']:checked").each(function (index, value) {
        if (index > 0)
        valIds += ",";
        var fullId = jQuery(this).val();
        valIds += fullId;
    });
    return valIds;
}

//获取单个星期名称
function getWeekSingleName(dd) {
    var week_day = new Array('日', '一', '二', '三', '四', '五', '六');
    var date = new Date(dd);
    var day = date.getDay();
    return week_day[day];
}

//获取星期几名称
function getWeekName(dd) {
    var week_day = new Array('星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六');
    var date = new Date(dd);
    var day = date.getDay();
    return week_day[day];
}

//日期格式化 yyyy-MM-dd
function dateFormat(dd) {
    var date = new Date(dd);
    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    var d = date.getDate();
    return y + '-' + (m < 10 ? ('0' + m) : m) + '-' + (d < 10 ? ('0' + d) : d);
}

//日期格式化 yyyy-MM-dd HH:mm:ss
function dateTimeFormat(date) {

    var y = date.getFullYear();
    var m = date.getMonth() + 1;
    m = m < 10 ? ('0' + m) : m;
    var d = date.getDate();
    d = d < 10 ? ('0' + d) : d;
    var h = date.getHours();
    h = h < 10 ? ('0' + h) : h;
    var minute = date.getMinutes();
    minute = minute < 10 ? ('0' + minute) : minute;
    var second = date.getSeconds();
    second = second < 10 ? ('0' + second) : second;
    return y + '-' + m + '-' + d + ' ' + h + ':' + minute + ':' + second;

}

function filterInjectSql(oField) {
    var re = /select|update|delete|exec|count|or|and|drop|truncate|&|<|>|'|"|=|;|>|<|%/i;
    if (re.test(oField.value)) {
        //alert("请您不要在参数中输入特殊字符和SQL关键字！"); //注意中文乱码
        oField.value = "";
        oField.className = "errInfo";
        oField.focus();
        return false;
    }
    return true;
}

function opencenterwindow(url, name, iWidth, iHeight) {
    // url 转向网页的地址
    // name 网页名称，可为空
    // iWidth 弹出窗口的宽度
    // iHeight 弹出窗口的高度
    //window.screen.height获得屏幕的高，window.screen.width获得屏幕的宽
    var iTop = (window.screen.height - 30 - iHeight) / 2; //获得窗口的垂直位置;
    var iLeft = (window.screen.width - 10 - iWidth) / 2; //获得窗口的水平位置;
    window.open(url, name, 'height=' + iHeight + ',,innerHeight=' + iHeight + ',width=' + iWidth + ',innerWidth=' + iWidth + ',top=' + iTop + ',left=' + iLeft + ',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');
}

function lookupFieldView(id, objtypecode) {
    $('.popup-mask').show()
    $('#iframe').show().attr('src', '/alert/entitydetail.html?id=' + id + '&objectTypeCode=' + objtypecode).height(640)
}
/*
layoutId - 主布局
template - 当前相关列表对象
masterEntityId - 主表记录ID(InstanceId实例)
processInstanceId - 主表记录ID(InstanceId实例)
ruleLogId - 步骤日志
foreigFieldName - 子表关联字段
*/
function openPopupAddChildItems(layoutId, templateId, masterEntityId, ruleLogId, foreigFieldName) {

    //apps/CommandProcessor.ashx?cmd=entity.relatedlistanddata.get&layoutid=14443351-5896-493e-b22d-e84ed0b0bb39&templateid=1523ed20-37c0-4796-ab8a-6c0d290501fb&masterEntityId=8508dd6c-079b-43cf-90c4-4e6dbc9fdc3c
    parent.$('.popup-mask').show();
    var url = '/alert/workflow/editItems.html?layoutid=' + layoutId + '&templateId=' + templateId + '&processInstanceId=' + masterEntityId + '&masterEntityId=' + masterEntityId + '&ruleLogId=' + ruleLogId + '&foreigFieldName=' + foreigFieldName;
    parent.$('#iframe').show().attr('src', url).height(640);
}
/*
打开相关明细明细审批表单
*/
function showLookupEntityWindow(objectTypeCode,entityId)
{
    parent.$('.popup-mask').show();
    parent.$('#iframe').show().attr('src', '/wfinstance/ProcessInstApprove.aspx?id=' + entityId  +'&objectTypeCode=' + objectTypeCode + '&view=3').height(700).width('80%').css('left', '10%');
}
function formatmessagesave(fields, objTypeCode, id) {
    var message = {
        params:
            {
                recordRep:
                  {
                      objTypeCode: objTypeCode,
                      fields: fields
                  }
            }
    }
    if (id) {
        message.params.recordRep.id = id
    }
    message = JSON.stringify(message)
    return message
}
function BindCostomDatagrid2(gridId, colUrl, colParams, dataUrl, dataParams, isEditCol, firstcol) {
    if (typeof (colUrl) == "undefined") {
        alert("请传入表头数据url");
    }
    if (typeof (dataUrl) == "undefined") {
        alert("请传入获取数据url");
    }
    if (typeof (gridId) == "undefined") {
        alert("请传入gridId");
    }
    if (typeof (isEditCol) == "undefined") {
        isEditCol = false;
    }

    if (typeof (colParams) == "undefined") {
        colParams = {};
    }
    if (typeof (dataParams) == "undefined") {
        dataParams = {};
    }
    var cols = GetTableColumns(colUrl, colParams, isEditCol, firstcol, gridId);
    console.log(cols);
    var url = rootUrl + "&cmd=" + dataUrl;
    $("#" + gridId).datagrid({
        url: url,
        method: 'POST',
        queryParams: dataParams,
        columns: cols,
        //frozenColumns: [fcols],
        idField: "EmployeeId",
        fit: true,
        autoWidth: true,
        //heckOnSelect: true,
        //striped: true,
        rownumbers: true,
        onLoadSuccess: function (data) {
            console.log(data);
            $("#" + gridId).datagrid('resize')
            if (data && data.rowsRule && data.rowsRule.length > 0) {
                data.rowsRule.forEach(function (item, index, array) {
                    for (var i = 0; i < item.RuleList.length; i++)
                        $("#" + gridId).datagrid('mergeCells', {
                            index: item.RuleList[i].Index,
                            field: item.FieldName,
                            rowspan: item.RuleList[i].RowSpan,
                            colspan: item.RuleList[i].ColSpan
                        });
                });
            }
        }
    });
}
function BindCostomDatagrid(gridId, colUrl, colParams, dataUrl, dataParams, isEditCol, firstcol) {
    if (typeof (colUrl) == "undefined") {
        alert("请传入表头数据url");
    }
    if (typeof (dataUrl) == "undefined") {
        alert("请传入获取数据url");
    }
    if (typeof (gridId) == "undefined") {
        alert("请传入gridId");
    }
    if (typeof (isEditCol) == "undefined") {
        isEditCol = false;
    }

    if (typeof (colParams) == "undefined") {
        colParams = {};
    }
    if (typeof (dataParams) == "undefined") {
        dataParams = {};
    }
    var cols = GetTableColumns(colUrl, colParams, isEditCol, firstcol, gridId);
    console.log(cols);
    var url = rootUrl + "&cmd=" + dataUrl;
    $("#" + gridId).datagrid({
        url: url,
        method: 'POST',
        queryParams: dataParams,
        columns: cols,
        //frozenColumns: [fcols],
        idField: "EmployeeId",
        fit: true,
        autoWidth: true,
        //heckOnSelect: true,
        //striped: true,
        pageNumber: 1,
        pagination: true,
        rownumbers: true,
        pageSize: 20,
        pageList: [10, 15, 20, 25, 30, 50, 100],
        onLoadSuccess: function (data) {
            console.log(data);
            $("#" + gridId).datagrid('resize')
            if (data && data.rowsRule && data.rowsRule.length > 0) {
                data.rowsRule.forEach(function (item, index, array) {
                    for (var i = 0; i < item.RuleList.length; i++)
                        $("#" + gridId).datagrid('mergeCells', {
                            index: item.RuleList[i].Index,
                            field: item.FieldName,
                            rowspan: item.RuleList[i].RowSpan,
                            colspan: item.RuleList[i].ColSpan
                        });
                });
            }
        }
    });
}
//列处理
function GetTableColumns(url, data, isEdit, firstcol, gridId) {
    if (typeof (isEdit) == "undefined") {
        isEdit = false;
    }
    var col = [];

    //同步获取动态列
    ajaxMethodPostData(url, data, function (data) {
        if (data && data.actions&&data.actions[0]) {
        var reg = data.actions[0];
        //console.log(reg,'123');
        if (reg.state == "SUCCESS") {
            col = GetColumnSrecursion(reg.returnValue, isEdit, gridId);
            //for (var i = 1; i <= reg.returnValue[0].RowSpan; i++) {
            //    var coli = [];
            //    recursionTableColumns(reg.returnValue, 1, i, coli, isEdit, gridId);

            //    col.push(coli);
            //}r
        }
        }
    });
    return col;
}
//列处理
function GetColumnSrecursion(data, isEdit, gridId) {
    var col = [];
    for (var i = 1; i <= data[0].RowSpan; i++) {
        var coli = [];
        recursionTableColumns(data, 1, i, coli, isEdit, gridId);
        col.push(coli);
    }
    return col;
}
//递归获取显示列
function recursionTableColumns(data, indexCurrRow, indexRow, col1, isEdit, gridId) {
    data.forEach(function (item, index, array) {
        if (item.IsRadio) //单选
        {
            if (typeof (gridId) != "undefined") {
                $("#" + gridId).datagrid({ singleSelect: true })
            }
            col1.push({
                field: item.FieldName, title: item.DisplayName, checkbox: true, "rowspan": item.RowSpan, "colspan": item.ColSpan, editor: (isEdit && item["IsEdit"]) ? 'text' : '', frozenColumns: item.FixColumn
            });
            return;
        }
        if (item.IsCheckBox) //多选
        {
            if (typeof (gridId) != "undefined") {
                $("#" + gridId).datagrid({ singleSelect: false })
            }
            col1.push({
                field: item.FieldName, title: item.DisplayName, checkbox: true, "rowspan": item.RowSpan, "colspan": item.ColSpan, editor: (isEdit && item["IsEdit"]) ? 'text' : '', frozenColumns: item.FixColumn
            });
            return;
        }
        if (!item.IsShow)
            return;
        if (indexCurrRow == indexRow) {
            console.log(item.FixColumn)

            col1.push({ field: item.FieldName, title: item.DisplayName, "rowspan": item.RowSpan, "colspan": item.ColSpan, editor: (isEdit && item["IsEdit"]) ? 'text' : '', frozenColumns: item.FixColumn });
        } else {

            if (item.ColSpan > 1) {
                var rowIndex = indexCurrRow + 1;
                recursionTableColumns(item.Items, rowIndex, indexRow, col1, isEdit);
            } else if (item.Items != null && item.Items.length > 0) {
                var rowIndex = indexCurrRow + 1;
                recursionTableColumns(item.Items, rowIndex, indexRow, col1, isEdit);
            }
        }
    });
}
function BindPublicDatagrid(gridId, filterQuery, entityCode) {
    var data = {
        filterQuery: filterQuery,
        entityType: entityCode,
        EntityCode: entityCode
    };
    var columns = GetTableColumns('entity.columns.get', data);//30024
    var url = "/apps/CommandProcessor.ashx?cmd=entitygrid.list";
    $("#" + gridId).datagrid({
        url: url,
        method: 'POST',
        queryParams: data,
        columns: columns,
        //frozenColumns: [fcols],
        idField: "ValueId",
        fit: true,
        autoWidth: true,
        //heckOnSelect: true,
        //striped: true,
        pageNumber: 1,
        pagination: true,
        rownumbers: true,
        pageSize: 20,
        pageList: [10, 15, 20, 25, 30, 50, 100],
        onLoadSuccess: function (data) {
            $("#" + gridId).datagrid('resize')
            if (data&&data.rowsRule && data.rowsRule.length > 0) {
                data.rowsRule.forEach(function (item, index, array) {
                    for (var i = 0; i < item.RuleList.length; i++)
                        $("#" + gridId).datagrid('mergeCells', {
                            index: item.RuleList[i].Index,
                            field: item.FieldName,
                            rowspan: item.RuleList[i].RowSpan,
                            colspan: item.RuleList[i].ColSpan
                        });
                });
            }
        }
    });
}

function compareDate(start, end) {
    //if (isDate(start) && isDate(end)) {
        var a = new Date(start.replace(/\-/g, "\/")).getTime()
        var b = new Date(end.replace(/\-/g, "\/")).getTime()
        if (a < b){
            return 1
        }
        else if (a > b) {
            return -1
        }
        else {
            return 0
        }
    //}
}
function isDate(dateString){
    if(dateString.trim()==""){
        return true;
    }
    var r= dateString.match(/^(\d{1,4})(-|\/)(\d{1,2})\2(\d{1,2})$/);
    if(r == null){

        alert("请输入格式正确的日期格式：yyyy-mm-dd 例如：2021-08-08");

        return false;

    }
    var d = new Date(r[1],r[3]-1,r[4]);
    var num = (d.getFullYear()==r[1]&&(d.getMonth()+1)==r[3]&&d.getDate()==r[4]);
    if(num == 0){
        alert("请输入格式正确的日期格式：yyyy-mm-dd 例如：2021-08-08");
        return false;
    }
    return (num != 0);
}

function openprints(ids, url) {
    var page = window.open()
    for (var i = 0; i < ids.length; i++) {
        page.document.write('<div><iframe frameborder="0" id="iframe' + ids[i] + '" style="width:100%;" src="' + url + ids[i] + '"></iframe></div>')
    }
    setTimeout(function () {
        page.document.onload(function () {
            for (var i = 0; i < ids.length; i++) {
                $(page.document.getElementById('iframe' + ids[i])).height(page[i].outerHeight)
                }
        })
        page.document.write('<script>window.print()</script>')
    }, 0)
}

