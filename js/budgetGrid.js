/*
预算布局
*/
function budgetGrid() {
    this.html = "";
    this.totalRows = 0;
}
budgetGrid.prototype.initGrid = function () {

    this.html = "<table id='itemGrid'><tr> <th class=\"radioCol\">序号</th><th class=\"radioCol\">科目名称</th><th class=\"radioCol\">金额</th><th class=\"radioCol\">备注</th><tr>";
    for (var i = 0; i < 20; i++)
    {
        this.html += "<tr><td>" + (i + 1) + "、</td><td><input class=\"data\" type='text' name='name_" + i + "' id='name_" + i + "' style='width:100' /></td><td><input onblur=\"if(!isNumeric(this.value)) { this.value='';}\" class=\"data\" type='text' name='amount_" + i + "' id='amount_" + i + "' style='width:120px;' /><td><input  class=\"data\" type='text' name='desc_" + i + "' id='desc_" + i + "' style='width:180px;' /></td></tr>";
    }
    this.html += "</table>";
    //this.html += "<input>";
    this.totalRows = 20;
}
budgetGrid.prototype.addRow = function () {

    var i = this.totalRows;
    this.html += "<tr><td>" + (i + 1) + "、</td><td><input class=\"data\" type='text' name='name_" + i + "' id='name_" + i + "' style='width:100' /></td><td><input onblur=\"if(!isNumeric(this.value)) { this.value='';}\" class=\"data\" type='text' name='amount_" + i + "' id='amount_" + i + "' style='width:120px;' /><td><input  class=\"data\" type='text' name='desc_" + i + "' id='desc_" + i + "' style='width:180px;' /></td></tr>";
    jQuery("#itemGrid").appendHTML(html);

    this.totalRows++;
}
budgetGrid.prototype.renderGrid = function () {

}