function GetFirstRow(data) {
    if (data == null) return;
    var newdata = [];
    var rows = data.rows;
    for (var i = 0; i < rows.length; i++) {
        if (rows[i].pid == "") {
            var item = rows[i];
            //var childrenitem = [];
            //for (var j = 0; j < data.length; j++) {
            //    if (data[i].id == data[j].pid) {
            //        childrenitem.push(data[j]);
            //    }
            //}
            item.children = FormartData(rows, rows[i].id);
            if (item.children.length > 0) {
                item.state = "closed";
            }
            newdata.push(item);
        }
    }
    newdata.unshift({
        pid: '',
        id: '',
        children: [],
        text:'全部'
    })
    return newdata;
}

function FormartData(data, pid) {
    var childrenitem = [];
    for (var j = 0; j < data.length; j++) {
        if (pid == data[j].pid) {
            var item = data[j];
            item.children = FormartData(data, data[j].id);
            if (item.children.length > 0) {
                item.state = "closed";
            }
            childrenitem.push(item);
        }
    }
    return childrenitem;
}

function treeLoader(a, b, c, d, e, f) {
    this.a = a; //elementId
    this.b = b; //entity
    this.onNodeClick = c; // onClick
    this.d = d; // onDbClick
}

treeLoader.prototype.init = function () {
    this.loadData();
}

treeLoader.prototype.loadData = function () {
    this.ajax("tree.get", this.b, "", this.bindData);
}

treeLoader.prototype.ajax = function (method, entity, srch, callbak) {
    var self = this;
    var url = "/apps/CommandProcessor.ashx?cmd=" + method + "&entity=" + entity;
    jQuery.ajax({
        async: false, cache: true, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            //alert("0");
        },
        success: function (data, textStatus) {
            if (callbak)
                callbak(self, data);
        },
        type: "GET",
        url: url
    });
}

/*点击node item 加载*/
treeLoader.prototype.loadNodeItems = function (method, para, callbak) {
    var self = this;
    var url = "/apps/CommandProcessor.ashx?cmd=" + method;//+ "&entity=" + entity;
    if (para)
        url += '&' + para;
    jQuery.ajax({
        async: true, cache: false, dataType: "json",
        error: function (request, textStatus, errorThrown) {
            //errorThrown = String(errorThrown).replace(/&/g, "&amp;").replace(/"/g, "&quot;").replace(/'/g, "&#39;").replace(/</g, "&lt;").replace(/>/g, "&gt;");
            //messageOptions_handleAjaxErrors([errorThrown ? errorThrown : textStatus]);
            //alert("0");
        },
        success: function (data, textStatus) {
            if (callbak)
                callbak(self, data);
        },
        type: "GET",
        url: url
    });
}

treeLoader.prototype.bindData = function (self, data) {
    //build tree
    //debugger;
    var datas = GetFirstRow(data);
    $("#" + self.a).tree({
        data: datas,
        onDblClick: function (node) {
            //$(this).tree('beginEdit', node.target);
            //editTreeNode(node.id);
            self.dblClickNode(node);
        },
        onClick: function (node) {
            //GetStringCode(node.id, node.text)
            self.onNodeClick(node);
            //alert(node.id);
            self.clickNode(node);
        },
        onLoadSuccess: function (node, data) {
            //if (data) {
            //    if (data.length > 0) {
            //        var node = $("#" + self.a).tree('find', data[0].id);
            //        $("#" + self.a).tree('select', node.target);
            //    }
            //}
        },
        onSelect: function (node) {
            self.selectNode(node);
        },
        onContextMenu: function (e, node) {
            self.onContextMenu(e, node)
        }
    });
}

treeLoader.prototype.selectNode = function (node) {

}

treeLoader.prototype.onContextMenu = function (node) {

}

treeLoader.prototype.dblClickNode = function (node) {

}

treeLoader.prototype.clickNode = function (node) {

}

treeLoader.prototype.getchildrendata = function (data) {
    var ids = []
    getchildrendata(data)
    function getchildrendata(data) {
        ids.push(data.id)
        if (data.children.length > 0) {
            for (var i = 0; i < data.children.length; i++) {
                getchildrendata(data.children[i])
            }
        }
    }
    ids = ids.join(',')
    return ids
}
