
var entityType = "";
var filterList = null;
var defaultFilterId = "";
var objectTypeCode = 0;

function appContext() { }
/*排序*/


appContext.prototype.defaultFilterId = null;
/*
field name
*/

appContext.prototype.objectTypeCode = null;
/*
字段标签
*/

appContext.prototype.entityType = null;
var webContext = new appContext();
/*
查询过滤器
*/

function getFilterList(search) {
    //console.log(search)
    //debugger;
    var url = "/apps/CommandProcessor.ashx?cmd=entity.filter.getlist&entityType=" + entityType;
    var self = this;
    var d = {
        search:search
    }
    jQuery.ajax({
        async: true, cache: true, dataType: "json",
        //data: d,
        data:d,
        error: function (request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function (data, textStatus) {
            //if (callback)
            //    callback(data);
            //debugger;
            if (data) {
                filterList = data.listData;
                //console.log(data)
                $('.slds-dropdown__items').remove()
                $('.header-left-title .selectlist li').remove()
                for (var i = 0; i < data.listData.length; i++) {
                    var res = data.listData[i]
                    var FilterId = res.FilterId
                    var Name = res.Name
                    var IsPinned = res.IsPinned
                    $('.header-left-title .selectlist ul').append('<li FilterId="' + FilterId + '"IsPinned="' + IsPinned + '"><img src="/img/cal/checkedgrey.png" /><span>' + Name + '</span></li>')
                }
                $('.header-left-title .selectlist li').click(function () {
                    $(this).addClass('active').siblings().removeClass('active')
                    $(this).parent().parent().prev().find('span').html($(this).find('span').html()).attr('FilterId', $(this).attr('FilterId'))
                })
                
                $('.header-left-title .selectlist li').click(function () {
                    var filterid = $(this).attr('filterid');
                    showfilterdata(filterid)
                })
                
                $('.fen .slds-dropdown__items').click(function () {
                    switchListMode($(this).attr('filterid'))
                })
                
            }
        },
        type: "POST",
        url: url
    });
}
function showfilterdata(filterid) {
        $('.shaixuan').removeClass('ban')
        $('.shaixuan').attr('title', '显示筛选')
        $('.viewlist .limits-li').removeClass('limits-li')
        //if($(this).attr('IsPinned')=='False'){
        //    $('.noPinned').show()
        //    $('.Pinned').hide()
        //}else{
        //    $('.Pinned').show()
        //    $('.noPinned').hide()
        //}
    //$('.slds-dropdown__items').removeClass('active')
       webContext.defaultFilterId = filterid;
        
        GridInstance.swithFilter(webContext.defaultFilterId);
        //更新数据
        showFilterDesinger();
}

function formatOper(val, row, index, entityType) {
    var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';

    return '<a style=\"color:#015ba7;font-size:13px;\" href="/' + entityType + '/detail?id=' + rowId + '">查看</a>&nbsp;';
}
/*列表*/


function listGrid(a, b, c, d, e, f) {
    this.a = a; //elementId

    this.b = b; //entity

    this.c = c; //option

    this.d = d; //

    this.url = "";
    this.filterQuery = "";
    if (f) this.filterId = f; else this.filterId = "";
    this.method = "";
    this.entityType = b;
    this.columns = [];
    this.toolbar = [];
    this.selectIDs = [];
}

listGrid.prototype.init = function () {
    this.initConfig(); // debugger;

    this.ajaxData();
};

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
        entityType: this.entityType, filterId: this.filterId
    }, function fn(data) {
        // debugger;
        //$("#pageDescription").html(data.Title);
        webContext.objectTypeCode = data.ObjectTypeCode;
        webContext.entityType = data.EntityType;
        var cols = data.DataSet.Columns;
        var col = {
            field: "Action",
            title: "操作",
            formatter: function formatter(value, row, index) {
                return formatOper(value, row, index, self.entityType);
            }
        };
        columnsArray.push(col);

        for (var i = 0; i < cols.length; i++) {
            var c = cols[i];
            var col = {
                field: c.Name,
                title: c.Title,
                sortable: true
            };
            columnsArray.push(col);
        }

        self.columns = columnsArray;
        var tb = data.Toolbar;
        /*
        debugger;
         */
        for (var i = 0; i < tb.length; i++) {
            var c = tb[i];
            var col = { text: c.Title, iconCls: 'icon-edit', name: c.Name, handler: function () { evalFun(c.OnClick) } };
            toolBar.push(col);
        }
        self.toolbar = toolBar;
       

        var tHTML = ""; //debugger;

        /*
        tHTML += "<div id='tb' style=\"padding: 2px 5px;\">";
        for (var i = 0; i < data.Toolbar.length; i++) {
            var c = data.Toolbar[i];
            tHTML += " <a href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-edit\" plain=\"true\" name=\"" + c.Name + "\" onclick=\"" + c.OnClick + "\">" + c.Title + "</a>";
        }
        tHTML += "</div>";
        */

        tHTML += "<div style='height:12px;'></div>";
        tHTML += "<table id=\"datagrid\" title=\"\" class=\"easyui-datagrid\" style=\"height: 100%;\"></table>";
        $("#gridContainer").append(tHTML);
        var treeHeight = getClientHeight();
        treeHeight = treeHeight - 111 - 37 - 75-12;
        jQuery("#gridContainer").height(treeHeight);
    }, false, true);
};
/*
*/
listGrid.prototype.ajaxData = function () {
    var url = "/apps/CommandProcessor.ashx?cmd=entitygrid.list&entityType=" + this.entityType;
    url += "&filterId=" + this.filterId;
    this.url = url;
    this.initGrid(this.columns);
};
/*查询*/


listGrid.prototype.search = function (search, filterQuery) {
    var url = "/apps/CommandProcessor.ashx?cmd=entitygrid.list&entityType=" + this.entityType;
    if (search) url += "&search=" + search; //if (filterQuery)
    //    url += "&filterQuery=" + filterQuery;

    this.url = url;
    this.initGrid(this.columns, filterQuery);
};
/*查询*/
listGrid.prototype.swithFilter = function (filterId) {
    this.filterId = filterId;
    /*
    var url = "/apps/CommandProcessor.ashx?cmd=entitygrid.list&entityType=" + this.entityType;
    
    if (filterId)
        url += "&filterId=" + filterId;
    this.url = url;
    this.initGrid(this.columns, "");
    */
    this.init();
}

listGrid.prototype.initGrid = function (columnsArray, filterQuery) {
    var self = this; //debugger;

    if (!filterQuery) filterQuery = "";
    $('#datagrid').datagrid({
        columns: [columnsArray],

        toolbar: [this.toolbar],
        /*toolbar: this.toolbar,*/
        fitCloumns: true,
        idField: "LIST_RECORD_ID",
        singleSelect: false,
        checkOnSelect: true,
        method: 'POST',
        pagination: true,
        rownumbers: true,
        url: this.url,
        striped: false,
        // 隔行变色特性
        pageSize: 15,
        pageList: [10, 15, 20, 25, 30, 50, 100],
        queryParams: {
            filterQuery: filterQuery
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

listGrid.prototype.refresh = function (data) {
    //debugger;
    //grid.refresh();
    //var self = this;
    var url1 = this.url + "&_refeshid=" + Math.random(); //window.location.reload();

    $('#datagrid').datagrid({
        url: url1
    });
};

listGrid.prototype.getSelectIDs = function () {
    var ids = [];
    var rows = $('#datagrid').datagrid('getSelections');

    for (var i = 0; i < rows.length; i++) {
        ids.push(rows[i].LIST_RECORD_ID);
    }

    var str = ids.join(','); //alert(str);

    this.selectIDs = ids;
    return str;
};
listGrid.prototype.getSelectedRows = function () {
    var ids = [];
    var rows = $('#datagrid').datagrid('getSelections');

    return rows;
};
listGrid.prototype.export = function () { };

var grid = null;
var GridInstance = {
    init: function init(eleId, gd, filterId) {
        //debugger;
        grid = new listGrid(eleId, gd, null, null, null, filterId);
        grid.init();
        entityType = gd;
    },
    getSelectIDs: function getSelectIDs() {
        var ids = grid.getSelectIDs();
        return ids;
    },
    getSelectedRows: function getSelectedRows() {
        var rows = grid.getSelectedRows;
        return rows;
    },
    doAction: function doAction(mn) {
        //debugger;
        var str = grid.getSelectIDs();

        if (mn == "employee.deptchange.active") {
            //弹出框
            commandAction(mn);
        } else if (mn == "employee.deptchange.deactive") {
            //弹出框
            commandAction(mn);
        } else {
            // ajaxPostData(mn, { ids: str }, GridInstance.refesh);
            if (str == "") {
                alert("请先选中行。");
                return;
            }

            commandAction(mn, str);
        }
    },
    search: function search(queryPara) {
        var srch = $("#srchText").val();
        var filterQuery = ""; //debugger;

        if (queryPara) {
            filterQuery = queryPara;
        } else filterQuery = getFilterCondition();

        grid.search(srch, filterQuery);
    },
    swithFilter: function (filter) {
        grid.swithFilter(filter);
    },
    exportGrid: function exportGrid() {
        // debugger;
        var d = {
            entityType: grid.entityType,
            gridId: grid.entityType 
        }; //ajaxPostData("grid.export", d);

        window.open("/apps/ExportDownload.aspx?cmd=grid.export&gridId=" + grid.entityType, "导出");
    },
    refesh: function refesh(data) {
        grid.refresh(data);
    }
};
var listViewInstance = null;
function switchListMode(listId, search, callback) {
    var searchText = "";
    //debugger;
    if (search) {
        searchText = search;
    }
    if (!listViewInstance) {
        listViewInstance = new listView("leftGridContainer", webContext.entityType, null, null, null, listId);
        listViewInstance.searchText = searchText;
        listViewInstance.init();
    }
    else {
        if (listId)
            listViewInstance.filterId = listId;
        listViewInstance.searchText = searchText;
        listViewInstance.search(searchText);
    }


    //debugger;
    //listViewInstance = gd;
}