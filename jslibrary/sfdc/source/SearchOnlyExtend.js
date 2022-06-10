function CommonLineItemSearchPage() { }
CommonLineItemSearchPage.prototype = new ProductSearchPage;
/*
extSrch --jack added,
*/
CommonLineItemSearchPage.prototype.filterResults = function (d, b, a, c, e, f, extSrch) {
    if (window.sfdcPage.hook_shouldProceedWithAction()) {
        c = document.getElementsByName(SearchRelatedList.pSEARCH);
        b = d = "";
        for (a = 0; a < c.length; a++)
            if (c[a].id == SearchRelatedList.pSEARCH) {
                d = c[a].value;
                break
            }
        if (null !== d && (a = d.replace(/[\"*()?]/g, ""), a = a.replace(/^\s\s*/, "").replace(/\s\s*$/, ""), 0 < d.length && 2 > a.length)) {
            alert(LC.getLabel("Page_Product2_Overview", "invalid_search_term"));
            return
        }
        for (a = 0; a < f; a++) {
            var g = e + FilterSelectionElement.pOPERATOR + a, h = e + FilterSelectionElement.pFILTER_VALUE + a;
            c = document.getElementById(e + FilterSelectionElement.pCOLUMN + a).value;
            g = document.getElementById(g).value;
            h = document.getElementById(h).value;
            "" != c && "" != g && (b = b + "\n" + this.encodeForSearch(c), b = b + "\t" + this.encodeForSearch(g), b = b + "\t" + h)
        }
        if (extSrch)
            b = b + "\n" + extSrch;
        this.getNewList(d, b, f)
    }
};
CommonLineItemSearchPage.prototype.getNewList = function (d, b, a, c) {
    var e = ListViewport.instances.lineItemView;
    !0 !== c && e.grid.getSelectionModel().clearAllSelections();
    c = {};
    c.search = d;
    c.filterQuery = b;
    if ("" == b)
        for (d = 0; d < a; d++) {
            b = "PricebookEntry" + FilterSelectionElement.pOPERATOR + d;
            var f = "PricebookEntry" + FilterSelectionElement.pFILTER_VALUE + d;
            document.getElementById("PricebookEntry" + FilterSelectionElement.pCOLUMN + d).selectedIndex = 0;
            document.getElementById(b).selectedIndex = 0;
            document.getElementById(f).value = ""
        }
    e.getListData(c)
};
CommonLineItemSearchPage.prototype.hook_shouldProceedWithAction = function () {
    return 0 < Paginator.instances.lineItemView_paginator.selectCount ? window.confirm(LC.getLabel("List", "checkboxWarning")) : !0
};
CommonLineItemSearchPage.prototype.verifyChecked = function (d, b, a, c) {
    b = ListViewport.instances.lineItemView.grid.selModel.selections.items;
    if (0 == b.length) alert(a);
    else if (50 < b.length) alert(c);
    else {
        a = [];
        for (i = 0; i < b.length; i++) c = document.createElement("input"), c.setAttribute("name", "ids"), c.setAttribute("id", b[i].id), c.setAttribute("value", b[i].id), a[i] = c;
        d.innerhtml = "" + a;
        d.submit();
    }
};
CommonLineItemSearchPage.prototype.resize = function () {
    ListViewport.prototype.resize.call(this, 200)
};
CommonLineItemSearchPage.prototype.afterResize = function () {
    var a = Sfdc.get(".x-grid3-scroller", this.listViewport);
    a && (a.style.height = Sfdc.Dom.getActualHeight(Sfdc.get(".x-grid3", this.listViewport)) - Sfdc.Dom.getActualHeight(Sfdc.get(".x-grid3-header"), this.listViewport) + "px")
};