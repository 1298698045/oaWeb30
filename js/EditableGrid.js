
function EditableGrid(a) {
    /*this.url = UserContext.getUrl("/_ui/common/list/ListServlet")*/
    a && (this.domId = a)
    this.url = "";
    this.xhr = null;
};
EditableGrid.DEFAULT_COLUMN_WIDTH = 125;
EditableGrid.prototype.init = function () {

};
EditableGrid.prototype.refreshList = function () {

};
EditableGrid.prototype.search = function (a) {

};
EditableGrid.prototype.getListDataPost = function (a) {

};
EditableGrid.prototype.getListData = function (a) {
    this.xhr = Sfdc.Ajax.request(this.url, {
        method: "POST",
        context: this,
        data: a,
        escape: encodeURIComponent,
        success: function (a) {
            //debugger;        
            //this.xhrHandler(a)
        },
        failure: function (a) {
            //this.xhrErrorHandler(a)
        }
    })
};
EditableGrid.prototype.xhrHandler = function (a) {
    this.waitingForXhr = !1;
    var b;
    try {
        // b = Util.evalAjaxServletOutput(a)
    } catch (c) {
        //  window.location.reload()
    }
    //this.updatePage(b)
};
EditableGrid.prototype.xhrErrorHandler = function (a) {
    this.waitingForXhr = !1;
    var b;
    try {
        // b = Util.evalAjaxServletOutput(a)
    } catch (c) {
        //window.location.reload()
    }
    //this.updatePage(b)
};
EditableGrid.prototype.createNewListInlineEditData = function (a) {
    // return new ListInlineEditData(a)
};
EditableGrid.prototype.updatePage = function (a) {

};
EditableGrid.prototype.drawListData = function (a, b, c, d) {
    this.drawListDataWithActionWidth(a, b, c, 1, !1);
    d || this.resize()
};
EditableGrid.prototype.drawListDataWithActionWidth = function (a, b, c, d, e, f) {

};
EditableGrid.prototype.resize = function (a) {

};
EditableGrid.instances = {};
EditableGrid.addListViewport = function (a) {
    EditableGrid.instances[a.domId] = a
};