﻿function EntityCustomSearchPage() { }
EntityCustomSearchPage.prototype = new ProductSearchPage;

EntityCustomSearchPage.prototype.filterResults = function (d, b, a, c, e, f,filterQuery) {
   // debugger;
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
        //jQuery("input[id^='srccol_']").each(function (index, value) {
        jQuery("input[searchColumn^='true']").each(function (index, value) {
            var fullId = jQuery(this).attr("id");
            //debugger;
            //var fieldName = fullId.substr(7);
            c = jQuery(this).attr("datafield");//column name 
            g = jQuery(this).attr("dataope");//operator
            h = jQuery(this).val();          //value

            function encodeForSearch(a)
            {
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
        /*
        for (a = 0; a < f; a++) {
            var g = e + FilterSelectionElement.pOPERATOR + a, h = e + FilterSelectionElement.pFILTER_VALUE + a;
            c = document.getElementById(e + FilterSelectionElement.pCOLUMN + a).value;
            g = document.getElementById(g).value;
            h = document.getElementById(h).value;
            "" != c && "" != g && (b = b + "\n" + this.encodeForSearch(c), b = b + "\t" + this.encodeForSearch(g), b = b + "\t" + h)
        }
        */
        if (filterQuery)
        {
            if (filterQuery != "" && b != "")
                b =b+ "\n" + filterQuery;
            else if (filterQuery != "" && b == "")
                b = filterQuery;
        }
        this.getNewList(d, b, f);
        //this.resize();
        //ListViewport.prototype.resize.call(this, 200)
    }
};
EntityCustomSearchPage.prototype.encodeForSearch = function (a) {
    return window.encodeURIComponent ? encodeURIComponent(a) : escape(a)
};
EntityCustomSearchPage.prototype.getNewList = function (d, b, a, c) {
    var e = ListViewport.instances.lineItemView;
    !0 !== c && e.grid.getSelectionModel().clearAllSelections();
    c = {};
    c.search = d;
    c.filterQuery = b;
    if ("" == b)
        for (d = 0; d < a; d++) {
            /*
            b = "PricebookEntry" + FilterSelectionElement.pOPERATOR + d;
            var f = "PricebookEntry" + FilterSelectionElement.pFILTER_VALUE + d;
            document.getElementById("PricebookEntry" + FilterSelectionElement.pCOLUMN + d).selectedIndex = 0;
            document.getElementById(b).selectedIndex = 0;
            document.getElementById(f).value = ""
            */
        }
    e.getListData(c);
};
EntityCustomSearchPage.prototype.hook_shouldProceedWithAction = function () {
    return 0 < Paginator.instances.lineItemView_paginator.selectCount ? window.confirm(LC.getLabel("List", "checkboxWarning")) : !0
};
EntityCustomSearchPage.prototype.verifyChecked = function (d, b, a, c) {
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
EntityCustomSearchPage.prototype.resize = function () {
    ListViewport.prototype.resize.call(this, 288)
};