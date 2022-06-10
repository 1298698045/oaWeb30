﻿function CampaignManageMembersTab(a, b) {
    CampaignManageMembersTab.tab = a;
    CampaignManageMembersTab.hidden = b || !1;
    a == CampaignManageMembers.ADD_TAB ? (CampaignManageMembersTab.hideLabel = LC.getLabel("CampaignManageMembersTab", "hide_search"), CampaignManageMembersTab.showLabel = LC.getLabel("CampaignManageMembersTab", "show_search")) : (CampaignManageMembersTab.hideLabel = LC.getLabel("CampaignManageMembersTab", "hide_filters"), CampaignManageMembersTab.showLabel = LC.getLabel("CampaignManageMembersTab", "show_filters"));
    CampaignManageMembersTab.accountPrefix = LC.getLabel("ContactFilter", "AccountPrefix", "").replace(/\s+$/, "");
    window.sfdcPage.appendToOnloadQueue(function () {
        a == CampaignManageMembers.ADD_TAB && (document.getElementById("filterType" + CampaignManageMembers.LEAD_JS).checked = !0);
        (new QueryString).get("added") && CampaignManageMembersTab.toggleFilters(document.getElementById("toggler"));
        CampaignManageMembersTab.clearView();
        CampaignManageMembersTab.clearFilters();
        ManageMembersViewport.instance.forceColumnsReload = !1;
        a == CampaignManageMembers.ADD_TAB ? Ext.get("filterType" + CampaignManageMembers.LEAD_JS).focus() : Ext.get(CampaignManageMembers.CAMPAIGN_MEMBER_JS + "_" + CampaignManageMembers.pCOLUMN + "0").focus()
    })
}
CampaignManageMembersTab.filterCount = {};
CampaignManageMembersTab.filterCount[CampaignManageMembers.LEAD_JS] = 3;//  CampaignManageMembers.DEFAULT_FILTER_ROW_COUNT;
CampaignManageMembersTab.filterCount[CampaignManageMembers.CONTACT_JS] = 3;// CampaignManageMembers.DEFAULT_FILTER_ROW_COUNT;
CampaignManageMembersTab.filterCount[CampaignManageMembers.CAMPAIGN_MEMBER_JS] = 3;//  CampaignManageMembers.DEFAULT_FILTER_ROW_COUNT;
CampaignManageMembersTab.filterCount["w"] = 5;//workflow query
CampaignManageMembersTab.query = function (filterId, status) {
    var a = ManageMembersViewport.instance;
    a.loading.show();

    var b = this.getFilterType(), c = Udd.EMPTY_KEY;
    var f2 = this.getFilterType2();
    var prefixb = 'l';
   //debugger;
    //CampaignManageMembersTab.tab == CampaignManageMembers.ADD_TAB && (c = document.getElementById(b + "_fcf").value);
    for (var f = [], e = [], g = [], d = 0; d < this.filterCount[f2]; d++) {
        var h = document.getElementById(prefixb + "_" + CampaignManageMembers.pCOLUMN + d).value,k = document.getElementById(prefixb + "_" + CampaignManageMembers.pOPERATOR + d).value;
        if (document.getElementById(prefixb + "_" + CampaignManageMembers.pFILTER_VALUE + d + "_lkid") == undefined) {
            l = document.getElementById(prefixb + "_" + CampaignManageMembers.pFILTER_VALUE + d).value;
        }
        else {
            l = document.getElementById(prefixb + "_" + CampaignManageMembers.pFILTER_VALUE + d + "_lkid").value;
        }
        "" !== h && "" !== k && (f.push(h), e.push(k), g.push(l))
    }
    a.filterState = status;
    //@jack
    if (filterId) {
        a.listId = filterId;
        c = filterId;
    }
    else
        c = a.listId;
    a.newQuery(b, c, f, e, g)
};
CampaignManageMembersTab.getFilterType = function () {
    //debugger;
    //return CampaignManageMembersTab.tab == CampaignManageMembers.ADD_TAB ? document.getElementById("filterType" + CampaignManageMembers.LEAD_JS).checked ? CampaignManageMembers.LEAD_JS : CampaignManageMembers.CONTACT_JS : CampaignManageMembers.CAMPAIGN_MEMBER_JS;
    return document.getElementById("filterType").value;
    //return document.getElementById("filterType2").value;
};
CampaignManageMembersTab.getFilterType2 = function () {
    return document.getElementById("filterType2").value;
};
CampaignManageMembersTab.changeToFilter = function (a) {
    Ext.get(CampaignManageMembers.FILTER_ID_PREFIX + (a == CampaignManageMembers.LEAD_JS ? CampaignManageMembers.CONTACT_JS : CampaignManageMembers.LEAD_JS)).setDisplayed("none");
    Ext.get(CampaignManageMembers.FILTER_ID_PREFIX + a).setDisplayed("block");
    ManageMembersViewport.instance.forceColumnsReload = !0
};
CampaignManageMembersTab.addFilterRow = function () {
    var a = this.getFilterType();
    this.filterCount[a]++
};
CampaignManageMembersTab.removeFilterRow = function () {
    var a = this.getFilterType();
    this.filterCount[a]--
};
CampaignManageMembersTab.clearFilters = function () {
    //for (var a = this.getFilterType(), b = 0; b < this.filterCount[a]; b++) {
    var pr = this.getFilterType2();
    for (var a = 'l', b = 0; b < this.filterCount[pr]; b++) {
        document.getElementById(a + "_" + CampaignManageMembers.pCOLUMN + b).value = "", document.getElementById(a + "_" + CampaignManageMembers.pOPERATOR + b).value = "", document.getElementById(a + "_" + CampaignManageMembers.pFILTER_VALUE + b).value = "";
    }
    this.clearView();
    ManageMembersViewport.instance.forceColumnsReload = !0
};
CampaignManageMembersTab.clearView = function () {
    /*
    var a = this.getFilterType(),
        a = document.getElementById(a + "_fcf");
    null !== a && (a.selectedIndex = 0)
    */
};
CampaignManageMembersTab.selectViewHandler = function (a, b) {
    try {
        var c = this.getFilterType(),
            f = document.getElementById(c + "_fcf").selectedIndex,
            e = Util.evalAjaxServletOutput(a);
        CampaignManageMembersTab.clearFilters();
        var g = e.cols.length,
            d = document.getElementById("filterError_" + c);
        5 < g ? (g = 5, d.innerHTML = LC.getLabel("CampaignManageMembersTab", "error_too_many_filters"), d.style.display = "block") : (d.innerHTML = "", d.style.display = "none");
        for (d = 0; d < g; d++) document.getElementById(c + "_" + CampaignManageMembers.pCOLUMN +
            d).value = e.cols[d], document.getElementById(c + "_" + CampaignManageMembers.pOPERATOR + d).value = e.ops[d], document.getElementById(c + "_" + CampaignManageMembers.pFILTER_VALUE + d).value = e.vals[d];
        document.getElementById(c + "_fcf").selectedIndex = f;
        ManageMembersViewport.instance.newQuery(c, b, e.cols, e.ops, e.vals)
    } catch (h) {
        window.location.reload()
    }
};
CampaignManageMembersTab.selectView = function () {
    var a = this.getFilterType(),
        b = document.getElementById(a + "_fcf").value;
    "" !== b ? (Sfdc.Ajax.post(UserContext.getUrl("/_ui/marketing/campaign/ManageMembersGetViewServlet"), function (a) {
        CampaignManageMembersTab.selectViewHandler(a, b)
    }, {
        data: {
            filterId: b
        }
    }), ManageMembersViewport.instance.loading.show()) : ManageMembersViewport.instance.forceColumnsReload = !0
};
CampaignManageMembersTab.toggleFilters = function (a) {
    var b = Ext.get(Ext.query(".pbHeader")),
        c = Ext.get(Ext.query(".mmTwisty img"));
   // debugger;
    CampaignManageMembersTab.hidden ? (a.innerHTML = CampaignManageMembersTab.hideLabel, c.replaceClass("showTriangle", "hideTriangle"), CampaignManageMembersTab.hidden = !1) : (a.innerHTML = CampaignManageMembersTab.showLabel, c.replaceClass("hideTriangle", "showTriangle"), CampaignManageMembersTab.hidden = !0);
    b.setVisibilityMode(Ext.Element.DISPLAY);
    b.toggle();
    ManageMembersViewport.instance.resize()
};
CampaignManageMembersTab.filterChange = function (a) {
    if (null !== a) {
        //var b = this.getFilterType();
        var b = 'l';
        a = document.getElementById(b + "_" + CampaignManageMembers.pOPERATOR + a);
        "" === a.value && (a.value = "e")
    }
    CampaignManageMembersTab.clearView();
    ManageMembersViewport.instance.dirty = !0
};
CampaignManageMembersTab.openFilterLookupWindow = function (a, b, c) {
    filterLookupValueElem = c;
    b = document.getElementById(b);
    b = b.options[b.selectedIndex];
    c = 0 === b.value.indexOf("ACCOUNT") || 0 === b.text.indexOf(CampaignManageMembersTab.accountPrefix) ? CampaignManageMembers.ACCOUNT_JS : this.getFilterType();
    curPopupWindow.location.href = a + "?lookup\x3d" + b.value + "\x26ftype\x3d" + c
};
CampaignManageMembersTab.setError = function (a, b, c) {
    var f = Ext.get(CampaignManageMembers.NOTICE_DIV_ID);
    f && f.setDisplayed("none");
    if (0 < b || 0 < c) a += "\x3cbr /" > +LC.getLabel("CampaignManageMembersTab", "save_error_info", b, c);
    Ext.get(CampaignManageMembers.ERROR_TEXT_ID).update(a);
    Ext.get(CampaignManageMembers.ERROR_DIV_ID).setDisplayed("block");
    ManageMembersViewport.instance.resize()
};
CampaignManageMembersTab.clearNoticesErrors = function () {
    var a = Ext.get(CampaignManageMembers.NOTICE_DIV_ID);
    a && a.setDisplayed("none");
    Ext.get(CampaignManageMembers.ERROR_DIV_ID).setDisplayed("none");
    ManageMembersViewport.instance.resize()
};
/*
JackAdded:filterId,filterState
*/
function ManageMembersViewport(a, b, c, filterId,filterState) {
    //debugger;
    ListViewport.call(this, b, c, null, null, !1);
    this.campaignId = a;
    this.url = UserContext.getUrl("/_ui/workflow/wfinstance/ManageInstancesListServlet");
    this.type = c;
    this.filterVals = this.filterOps = this.filterCols = null;
    this.filterState = filterState;
    //this.listId = Udd.EMPTY_KEY;
    /*
    this.filterVals = "0";
    this.filterOps = "e";
    this.filterCols = "statecode";
    */
    this.wfStatus = null;
    this.listId = filterId 
    this.sort = null;
    this.forceColumnsReload = this.dirty = !1;
    this.columnWidths = null;
    LC.getLabel("ManageMembersViewport", "add");
    LC.getLabel("ManageMembersViewport", "update");
    LC.getLabel("ManageMembersViewport", "remove");
    ManageMembersViewport.instance = this;
}
var C = function () { };
C.prototype = ListViewport.prototype;
ManageMembersViewport.prototype = new C;
ManageMembersViewport.instance = null;
ManageMembersViewport.minHeight = 200;
ManageMembersViewport.prototype.init = function () {
    this.getReferences();
    this.initializeLinkTemplates();
    this.resize();
    this.getListData({
        listid: this.listId,
        action: "newfilter",
        doNotPreloadData: CampaignManageMembersTab.tab == CampaignManageMembers.ADD_TAB
    })
};
ManageMembersViewport.prototype.getListDataPost = function (a) {
    //debugger;
    var b = ListViewport.prototype.getListDataPost.call(this, a);
    b.filterId = this.listId;
    b.filterType = this.type;
    b.filterCols = this.filterCols;
    b.filterOps = this.filterOps;
    b.filterVals = this.filterVals;
    b.campaignId = this.campaignId;
    b.filterState = this.filterState; //jack added
    b.doNotLoad = null !== a.doNotPreloadData ? a.doNotPreloadData : !1;
    b.columns = this.forceColumnsReload ? null : this.getColumns();
    null === b.columns && (b.columns = "null");
    a.sort && (this.sort = a.sort);
    b.sort = this.sort;
    return b
};
ManageMembersViewport.prototype.updatePage = function (a) {
    //debugger;
    if (!a) return; //jack added
    null !== this.columnWidths && (a.columnWidths = this.columnWidths);
    ListViewport.prototype.updatePage.call(this, a);
    this.columnWidths = null;
    a.editColumns && Ext.get("editColumns").update(a.editColumns, !0);
    var b = document.getElementById("filterError_" + this.type);
    b && a.hasAdvancedOptions && (b.innerHTML && (b.innerHTML += "\x3cBR\x3e"), b.innerHTML += LC.getLabel("CampaignManageMembersTab", "error_advanced_view"), b.style.display = "block")
};
ManageMembersViewport.prototype.newQuery = function (a, b, c, d, e) {
    this.type = a;
    this.listId = b;
    this.filterCols = c;
    this.filterOps = d;
    this.filterVals = e;
    this.refreshQuery();
    this.dirty = !1
};
ManageMembersViewport.prototype.refreshQuery = function () {
    if (!this.forceColumnsReload) {
        var a = this.getFilterColumns();
        this.columnWidths = [];
        for (var b = 0; b < a.length; b++) this.columnWidths.push(a[b].width)
    }
    CampaignManageMembersTab.clearNoticesErrors();
    this.grid.id = "";
    this.grid.getSelectionModel().clearAllSelections();
    this.getListData({
        action: "newfilter"
    });
    this.forceColumnsReload = !1
};
ManageMembersViewport.prototype.updateFilterLinks = function () { };
ManageMembersViewport.prototype.selectedHandler = function (a, b) {
    try {
        var c = Util.evalAjaxServletOutput(a),
            d = c[CampaignManageMembers.ERROR_MSG],
            e = c[CampaignManageMembers.MEMBERS_ADDED],
            f = c[CampaignManageMembers.MEMBERS_UPDATED];
        this.loading.hide();
        d ? CampaignManageMembersTab.setError(d, e, f) : CampaignManageMembersTab.tab == CampaignManageMembers.ADD_TAB ? navigateToUrl(UserContext.getUrl("/ui/campaign/CampaignManageMembersExistingTab?campaignId\x3d" + this.campaignId + "\x26added\x3d" + e + "\x26updated\x3d" + f), "CAMPAIGN") :
            navigateToUrl(UserContext.getUrl("/ui/campaign/CampaignManageMembersExistingTab?campaignId\x3d" + this.campaignId + "\x26updated\x3d" + f), "CAMPAIGN")
    } catch (g) {
        window.location.reload()
    }
};
ManageMembersViewport.prototype.adjustSelected = function (a, b, c, d) {
    if (this.dirty) alert(LC.getLabel("ManageMembersViewport", "dirty_filters", LC.getLabel("ManageMembersViewport", d)));
    else if (d = [], 0 < this.grid.getSelectionModel().getCount()) {
        if ("remove_members" !== a || confirmDelete()) {
            this.loading.show();
            for (var e = this.grid.getSelectionModel().getSelections(), f = 0; f < e.length; f++) d.push(e[f].id);
            var g = this;
            Sfdc.Ajax.post(this.url, function (a) {
                c.call(g, a, e)
            }, {
                data: {
                    /*_CONFIRMATIONTOKEN: document.getElementById("_CONFIRMATIONTOKEN").value,*/
                    action: a,
                    campaignId: this.campaignId,
                    filterId: Udd.EMPTY_KEY,
                    status: b,
                    ids: d
                }
            })
        }
    } else alert(LC.getLabel("ManageMembersViewport", "no_selection"))
};
ManageMembersViewport.prototype.addSelectedWithStatus = function (a) {
    this.adjustSelected("add_members", a, this.selectedHandler, "add")
};
ManageMembersViewport.prototype.updateSelectedStatus = function (a) {
    this.adjustSelected("add_members", a, this.selectedHandler, "update")
};
ManageMembersViewport.prototype.removeHandler = function (a, b) {
    var c = Util.evalAjaxServletOutput(a),
        d = c[CampaignManageMembers.MEMBERS_REMOVED],
        c = c[CampaignManageMembers.ERROR_MSG];
    this.loading.hide();
    c ? CampaignManageMembersTab.setError(c, d) : this.refreshQuery();
    //c ? CampaignManageMembersTab.setError(c, d) : navigateToUrl(UserContext.getUrl("/ui/campaign/CampaignManageMembersExistingTab?campaignId\x3d" + this.campaignId + "\x26removed\x3d" + d), "CAMPAIGN")
};
ManageMembersViewport.prototype.removeSelected = function () {
    this.adjustSelected("remove_members", null, this.removeHandler, "remove")
};
/**/
ManageMembersViewport.prototype.tranDelegate = function () {
    //debugger;
    this.adjustSelected("tran_Delegate", null, this.removeHandler, "delegate")
};
/*end */
ManageMembersViewport.prototype.selectAll = function () { };
ManageMembersViewport.prototype.toggleEditColumns = function () {
    Ext.get("editColumns").toggle()
};
ManageMembersViewport.prototype.getColumns = function () {
    var a = [],
        b = Ext.get("columns_select_0"),
        c = Ext.get("columns_select_1");
    return null !== b && null !== c ? (DuelingListBoxesElement.saveAllSelected([b.dom, c.dom], [[], a], ",", "\\", "--None--"), a.value) : null
};
ManageMembersViewport.prototype.updateColumns = function () {
    CampaignManageMembersTab.clearView();
    this.listId = Udd.EMPTY_KEY;
    this.toggleEditColumns();
    this.refreshQuery()
};
ManageMembersViewport.prototype.getSelectionModel = function () {
    return new Sfdc.grid.CheckboxSelectionModel({
        maxSelections: 2E5,
        menuDisabled: !0
    })
};
ManageMembersViewport.prototype.resize = function () {
    ListViewport.prototype.resize.call(this, ManageMembersViewport.minHeight)
};
ManageMembersViewport.prototype.afterResize = function () {
    var a = Sfdc.get(".x-grid3-scroller", this.listViewport);
    a && (a.style.height = Sfdc.Dom.getActualHeight(Sfdc.get(".x-grid3", this.listViewport)) - Sfdc.Dom.getActualHeight(Sfdc.get(".x-grid3-header"), this.listViewport) + "px")
};
ManageMembersViewport.prototype.getNoResultsText = function () {
    return CampaignManageMembersTab.tab == CampaignManageMembers.ADD_TAB ? LC.getLabel("ManageMembersViewport", "no_results") : LC.getLabel("List", "none")
};
ManageMembersViewport.prototype.buildDataStore = function (a) {
    a = ListViewport.prototype.buildDataStore.call(this, a);
    /*this.hasActions = CampaignManageMembersTab.tab == CampaignManageMembers.EXISTING_TAB;*/
    return a
};