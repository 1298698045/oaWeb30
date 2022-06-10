
var entityType = "";
var filterList = null;
var defaultFilterId = "";
var objectTypeCode = 0;
var filterId = ''

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
function listViewManager() {
}
listViewManager.prototype.getMetadataInitialLoad = function (entityType) {
    var self = this;
    var url = "/apps/CommandProcessor.ashx?cmd=listviewmanager.getmetadata.initialload";
    var data = {
        entityType: entityType,
        _: Math.ceil(Math.random() * 1000)
    }
    if (typeof treeEntityType !='undefined') {
        data.objecttypecode = treeEntityType
    }
    jQuery.ajax({
        url: url,
        async: false,
        cache: true,
        dataType: "json",
        data: data,
        error: function error(request, textStatus, errorThrown) {
            // errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function success(data, textStatus) {//console.log(data)
            if (data) {
                self.bindlistViewPage(data);
                
            }
        }
    });
}
listViewManager.prototype.bindlistViewPage = function (data) {
    var filterId = '';
    $('.header-left-title-name').html(data.returnValue.breadCrumbList[0].label)
    if (data.returnValue.listViewId) {
        filterId = data.returnValue.listViewId;
        var listViewLabel = data.returnValue.listViewLabel;
        listGrid.prototype.filterId = filterId
        $('.header-left-title-listname span').attr('filterid', filterId)
        $('.header-left-title-listname span').html(listViewLabel)
        window.filterId = filterId;
        webContext.defaultFilterId = filterId;
        $('.viewlist  .limits-li a').attr('aria-disabled', '')
        $('.viewlist  .limits-li').removeClass('limits-li')
        $('.shaixuan').removeClass('ban').attr('title', '删选器')
    } else {
        filterId = ''
    }
    try {
        if (filterId) {
            listGrid.prototype.filterId = filterId
            window.filterId = filterId;
            webContext.defaultFilterId = filterId;
        }
        if (data.returnValue.recordThemeInfo) {
            webContext.entityApiName = data.returnValue.recordThemeInfo.entityApiName;
        }
        if (data.returnValue.prefixes) {
            webContext.entityType = data.returnValue.prefixes[0]

}
    }

    catch (e) {

    }
    showFilterDesinger();

    
}

function FilterListpin(pinned) {
    var url = "/apps/CommandProcessor.ashx?cmd=entity.filter.pin&pinned=" + pinned + "&id=" + webContext.defaultFilterId; // console.log(webContext.objectTypeCode)
    //console.log(webContext.defaultFilterId)

    jQuery.ajax({
        url: url,
        async: true,
        cache: true,
        dataType: "json",
        //data: d,
        error: function error(request, textStatus, errorThrown) {
            errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
        },
        success: function success(data, textStatus) {//console.log(data)
            window.success('固定成功')
        }
    });
}
/*
查询过滤器
*/
$(document).ready(function () {
    $('.header-left-title-listname').append("<div class=\"fixed-list Pinned\">\n     <img src=\"/img/images/unpin.png\" width=\"14px\" height=\"14px\">\n     <div class=\"slds-popover slds-popover_tooltip slds-nubbin_top-left slds-is-absolute slds-m-top_x-small\" style=\"opacity: 1; z-index: 1000;\">\n          <div class=\"slds-popover__body\">\n               \u8981\u53D6\u6D88\u56FA\u5B9A\uFF0C\u8BF7\u56FA\u5B9A\u5176\u4ED6\u5217\u8868\n             </div>\n         </div>\n     </div>");
    $('.header-left-title-listname').append("<div class=\"fixed-list noPinned\" style=\"display:none;\" title=\"\u56FA\u5B9A\u6B64\u5217\u8868\u89C6\u56FE\">\n   <img src=\"/img/images/pin.png\" width=\"14px\" height=\"14px\">\n   </div>"); //禁用选项
    $('.fixed-list').click(function () {
        return false;
    })
    $('.header-left-title .selectlist ul').before('<div class="search-list">'
               + '<i class="iconfont icon-sousuo" style="position: absolute; top: 23px; left: 20px;"></i>'
                   + '<input class="slds_section__content_div_col_element_label_input" value=""autocomplete="off" id="ContractNumber">'
                + '</div>')
    $('.search-list').click(function () {
        return false;
    })
    $('.search-list').keyup(function () {
        var search = $(this).find('input').val()
        getFilterList(search)
    })
    $('.noPinned').click(function () {
        FilterListpin(1);
        $(this).hide();
        $('.Pinned').show();
    });
})

function getFilterList(search) {
    //console.log(search)
    //debugger;
    var url = "/apps/CommandProcessor.ashx?cmd=entity.filter.getlist&entityType=" + entityType;
    if (typeof treeEntityType != 'undefined') {
        url += '&objecttypecode=' + treeEntityType
    }
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
                $('.header-left-title li').each(function () {
                    if ($(this).attr('filterid') == window.filterId) {
                        $(this).addClass('active')
                    }
                })
                $('.header-left-title .selectlist li').click(function () {
                    $(this).addClass('active').siblings().removeClass('active')
                    $(this).parent().parent().prev().find('span').html($(this).find('span').html()).attr('FilterId', $(this).attr('FilterId'))
                })
                
                $('.header-left-title .selectlist li').click(function () {
                    var filterid = $(this).attr('filterid');
                    showfilterdata(filterid,this)
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
function showfilterdata(filterid,that) {
        $('.shaixuan').removeClass('ban')
        $('.shaixuan').attr('title', '显示筛选')
        $('.viewlist .limits-li').removeClass('limits-li')
        if ($(that).attr('IsPinned') != 'False' && $(that).attr('IsPinned') != '') {
            $('.Pinned').show()
            $('.noPinned').hide()
        } else {
            $('.noPinned').show()
            $('.Pinned').hide()
        }
    //$('.slds-dropdown__items').removeClass('active')
       webContext.defaultFilterId = filterid;
       GridInstance.swithFilter(webContext.defaultFilterId);
        //更新数据
       showFilterDesinger();
}

function formatOper(val, row, index, entityType) {
    var rowId = row["LIST_RECORD_ID"]; //return '<a style=\"color:#015ba7;font-size:13px;\" href="e?id=' + rowId + '">修改</a>&nbsp;|&nbsp;<a style=\"color:#015ba7;font-size:13px;\" href=\"/setup/own/deleteRedirect.aspx?objectType=&delID=' + rowId + '&retURL=\">删除</a>';

    return '<a style=\"color:#015ba7;font-size:13px;\" href="/' + entityType + '/detail?objectTypeCode=' + webContext.objectTypeCode + '&id=' + rowId + '">查看</a>&nbsp;';
}


function deleteConfirm(id, objTypeCode) {
    $('.popup-mask').show()
    var url = '/alert/delete_ie8.html?objtypecode=' + objTypeCode + '&id=' + id;
    $('#iframe').show().attr('src', url).height(280).css({ "left": "20%", "background-color": "white", "width": "60%", "max-height": "280px" })
}

/*列表*/


function listGrid(a, b, c, d, e, f) {
    this.a = a; //elementId

    this.b = b; //entity

    this.c = c; //option

    this.d = d; //

    this.url = "";
    this.filterQuery = "";
    if (f) this.filterId = f;
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
    if (typeof getfilter != 'undefined') {
        getfilter()
    }
   // getfilter();
    var toolBar = [];
    var columnsArray = [];
    var col = {
        field: 'ids',
        checkbox: true
    };
    columnsArray.push(col);
    var self = this;
    var random = Math.ceil(Math.random() * 10000);
    var data = {
        gd: this.b,
        entityType: this.entityType, filterId: this.filterId
    }
    if (typeof treeEntityType != 'undefined') {
        data.objecttypecode = treeEntityType
    }
    ajaxData("entitygrid.config.get&_=" + random, data, function fn(data) {
        if (data) {
            //if (self.entityType == '')
            //{
            //    //self.entityType = data
            //}
            if (window.windowtitle) {
                $('title').html(data.Title)
            }
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
            for (var i = 0; i < tb.length; i++) {
                var c = tb[i];
                var col = { text: c.Title, iconCls: 'icon-edit', name: c.Name, handler: function () { evalFun(c.OnClick) } };
                toolBar.push(col);
            }
            self.toolbar = toolBar;
            */
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
            if ($("#gridContainer div").length < 1) {
                $("#gridContainer").append(tHTML);

            }
            var treeHeight = getClientHeight();
            treeHeight = treeHeight - 111 - 37 - 75;
            if ($(".treePanel-iframe").length > 0) {
                treeHeight = getClientHeight() - 57
            }
            jQuery("#gridContainer").height(treeHeight);
        }
        
    }, false, true);
};
/*
*/
listGrid.prototype.ajaxData = function () {
    var url = "/apps/CommandProcessor.ashx?cmd=entitygrid.list&entityType=" + this.entityType;
    if (typeof treeEntityType != 'undefined') {
        url += '&objecttypecode=' +treeEntityType
    }
    //if (this.filterId)
    //    url += "&filterId=" + this.filterId;
    this.url = url;
    this.initGrid(this.columns);
};
/*查询*/
listGrid.prototype.search = function (search, filterQuery) {
    var url = "/apps/CommandProcessor.ashx?cmd=entitygrid.list&entityType=" + this.entityType;
    if (typeof treeEntityType != 'undefined') {
        url += '&objecttypecode=' + treeEntityType
    }
    //if (search) url += "&search=" + search; //if (filterQuery)
    //    url += "&filterQuery=" + filterQuery;
    this.url = url;
    this.initGrid(this.columns, filterQuery, search);
};
/*切换筛选器*/
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

listGrid.prototype.initGrid = function (columnsArray, filterQuery, search) {
    this.filterQuery = filterQuery

    var self = this; //debugger;
    if (this.filterId) 
        filterId = this.filterId;
    if (!filterQuery) filterQuery = "";
    if (getQueryString('relatedObjectAttributeName')&&getQueryString('pid')) {
        filterQuery += '\n' + getQueryString('relatedObjectAttributeName') + '\teq\t' + getQueryString('pid')
    }
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
        url: this.url,
        striped: false,
        // 隔行变色特性
        pageSize: 15,
        pageList: [10, 15, 20, 25, 30, 50, 100],
        queryParams: {
            filterId: filterId,
            search:search,
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
        },
        onLoadSuccess: function () {
            if (typeof datagridsuccess == 'function') {
                datagridsuccess()
            }
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

listGrid.prototype.export1 = function () { };

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
    search: function search(queryPara, filterId) {
        var srch = $("#srchText").val();
        var filterQuery = ""; //debugger;
        if (filterId) {
            grid.filterId = filterId;
        }
        if (queryPara) {
            filterQuery = queryPara;
        }
        else {
            filterQuery = getFilterCondition();
        }
        if (grid&&grid.search) {
            grid.search(srch, filterQuery);
        }
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
$(document).ready(function () {
    $('#srchText').keyup(function (e) {
        if (e.keyCode == '13') {
            GridInstance.search()
        }
    })
})
function formatOperstatecode(value, row, index) {
    console.log(value)
    var color = ''
    if (value == '执行中' || value == '未付款' || value == '履约中' || value == '履行中' || value == '流转中' || value == '运行中') {
        color = '#5AAAFF'
    } else if (value == '已付款' || value == '已完成') {
        color = '#31BA6A'
    } else if (value == '已开票') {
        color = 'orange'
    } else if (value == '已取消' || value == '已退票取消') {
        color = '#555'
    } else if (value == '已过期' || value == '已废止') {
        color = '#aaa'
    }
    else if (value == '内容变更' || value == '变更') {
        color = '#F3C774'
    }
    else if (value == '合同终止' || value == '终止') {
        color = '#F9A6AB'
    }
    else if (value == '合同暂停' || value == '暂停') {
        color = '#8DAAFF'
    }
    else if (value == '合同解除' || value == '解约') {
        color = '#555'
    }
    else if (value == '草稿') {
        color = '#bbb'
    }
    else if (value == '已撤销' || value == '已退回' || value == '退回') {
        color = '#FF5722'
    }
    return '<div class="tag-format layui-badge" style="display: block;margin:0 auto;width:69px;line-height:24px;color:#fff;background: ' + color + '">' + value + '</div>'
}
function formatOperprogeress(value, row, index) {
    return '<div class="layui-progress"><div class="layui-progress-bar layui-bg-blue" lay-percent="' + (value < 1 ? value * 100 : value / 100) + '%"></div></div><span class="layui-progress-text">' + (value < 1 ? value * 100 : value / 100).toFixed(2) + '%</span>'
}