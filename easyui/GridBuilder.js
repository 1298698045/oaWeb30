/*列表*/
function listGrid(a, b, c, d, e, f) {
    this.a = a; //elementId
    this.b = b; //entity
    this.c = c; //option
    this.d = d; //
    this.url = "";
    this.filterQuery = "";
    this.method = "";
    this.entityType = b;
    this.columns = [];
    this.toolbar = [];
    this.selectIDs = [];
}
listGrid.prototype.init = function () {
     
    this.initConfig();
   // debugger;
    this.ajaxData();
}
listGrid.prototype.initConfig = function () {
       
    var toolBar = [];
    var columnsArray = [];
    var col = { field: 'ids', checkbox: true };
    columnsArray.push(col);
    var self = this;
    ajaxData("grid.config.get", { gd: this.b }, function fn(data) {
        // debugger;
        $("#pageDescription").html(data.Title);
        var cols = data.DataSet.Columns;
        for (var i = 0; i < cols.length; i++) {
            var c = cols[i];
            var col = { field: c.Name, title: c.Title };
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
        var tHTML = "";
        //debugger;
        
        tHTML += "<div id='tb' style=\"padding: 2px 5px;\">";
        for (var i = 0; i < data.Toolbar.length; i++) {
            var c = data.Toolbar[i];
            tHTML += " <a href=\"#\" class=\"easyui-linkbutton\" iconCls=\"icon-edit\" plain=\"true\" name=\"" + c.Name + "\" onclick=\"" + c.OnClick + "\">" + c.Title + "</a>";
        }
        tHTML += "</div>";
        
        tHTML += "<table id=\"datagrid\" title=\"\" class=\"easyui-datagrid\" style=\"height: 100%;\"></table>";
        $("#gridContainer").append(tHTML);

        var treeHeight = getClientHeight();
        treeHeight = treeHeight - 111 - 37-75;
        jQuery("#gridContainer").height(treeHeight);

    }, false, true);
    
}
listGrid.prototype.ajaxData = function () {
    var url = "/apps/CommandProcessor.ashx?cmd=grid.data.load&entityType=" + this.entityType;
    this.url = url;
    this.initGrid(this.columns);
}
listGrid.prototype.initGrid = function (columnsArray) {
    var self = this;
    //debugger;
    $('#datagrid').datagrid({
        columns: [columnsArray],
        /*toolbar: [this.toolbar],*/
        toolbar:this.toolbar,
        fitCloumns: true,
        idField: "LIST_RECORD_ID",
        singleSelect: false,
        checkOnSelect: true,
        method: 'get',
        pagination: true,
        rownumbers: true,
        url: this.url,
        onDblClickRow: function (index, row) {
            //debugger;
            //editDialog(row.LIST_RECORD_ID, self.entityType);
        }
    });
}
listGrid.prototype.refresh = function (data) {
    //debugger;
    //grid.refresh();
    //var self = this;
    var url1 = this.url + "&_refeshid=" + Math.random();
    //window.location.reload();
    $('#datagrid').datagrid({
        url: url1
    });
}
listGrid.prototype.getSelectIDs = function ()
{
    var ids = [];
    var rows = $('#datagrid').datagrid('getSelections');
    for (var i = 0; i < rows.length; i++) {
        ids.push(rows[i].LIST_RECORD_ID);
    }
    var str = ids.join(',');
    //alert(str);
    this.selectIDs = ids;
    return str;
}
listGrid.prototype.export = function ()
{

}
var grid = null;

var GridInstance = 
{
    init: function (eleId,gd)
    {
        grid = new listGrid(eleId,gd);
        grid.init();
    },
    getSelectIDs: function ()
    {
        var ids = grid.getSelectIDs();
    },
    doAction: function (mn)
    {
        //debugger;
        var str = grid.getSelectIDs();
        if (mn == "employee.deptchange.active") {
            //弹出框
            commandAction(mn);
        }
        else if (mn == "employee.deptchange.deactive") {
            //弹出框
            commandAction(mn);
        }
        else  {
            // ajaxPostData(mn, { ids: str }, GridInstance.refesh);
            if (str == "")
            {
                alert("请先选中行。");
                return;
            }
            commandAction(mn, str);
        }
    },
    exportGrid:function()
    {
       // debugger;
        var d = {
            entityType: grid.entityType,
            gridId: grid.entityType
        }
        //ajaxPostData("grid.export", d);
        window.open("/apps/ExportDownload.aspx?cmd=grid.export&gridId=" + grid.entityType, "导出");
    },
    refesh:function(data)
    {
        grid.refresh(data);
    }
}

function commandAction(actionName,ids)
{
    //debugger;
   // alert(actionName);
    if (actionName == "employee.deptchange.active") {
        //弹出框
        commandAction(mn);
    }
    else if (actionName == "employee.deptchange.deactive") {
        //弹出框
        showDialog("/cntr/renewEdit.aspx?ids=" + ids, "renewcontract", "", 480, 500);
    }
    else if (actionName == "contract.renew" || actionName == "contract.terminate") {
        //弹出框
        showDialog("/cntr/renewEdit.aspx?type=" + actionName + "&ids=" + ids, "renewcontract", "续签合同", 580, 480);
    }
    else if (actionName == "employee.salarypost.set") {
        //设置岗位
        showDialog("/emp/chgfrm/SalaryPostChange.aspx?id=" + ids, "SalaryPostChange", "", 680, 500);
    }
}

function evalFun(act)
{
    //debugger;
    //alert(act);
    eval(act);
}