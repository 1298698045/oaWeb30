/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Ext.namespace("sfdc.analytics.framework");
sfdc.analytics.framework.EntityDeleter=function(b,a,d){this.url=UserContext.getUrl("/_ui/analytics/reporting/ui/home/DeleterServlet");this.id=b;this.csrf=a;this.onSuccess=d};
sfdc.analytics.framework.EntityDeleter.prototype={deleteEntity:function(){var b={id:this.id};b[CSRFConstants.CSRF_TOKEN]=this.csrf;Sfdc.Ajax.post(this.url,this._handleDeleteResponse.createDelegate(this),{data:b,escape:encodeURIComponent})},_handleDeleteResponse:function(b){var a;try{a=Util.evalAjaxServletOutput(b)}catch(d){window.location.reload()}if(a.success)this.onSuccess(a);else if(a.errors){var c=[];Ext.each(a.errors,function(a){c.push(a.msg);a.relatedItems&&c.push("\x3cbr/\x3e\x3cbr/\x3e"+a.relatedItems)});
sfdc.analytics.framework.WARNING(a.errorTitle,c.join(""),!0,600)}}};
Ext.override(Ext.form.ComboBox,{initList:function(){if(!this.list){this.list=new Ext.Layer({parentEl:this.getListParent(),shadow:this.shadow,cls:["x-combo-list",this.listClass].join(" "),constrain:!1});this.innerList=this.list.createChild({cls:"x-combo-list-inner"});this.mon(this.innerList,"mouseover",this.onViewOver,this);this.mon(this.innerList,"mousemove",this.onViewMove,this);this.pageSize&&(this.footer=this.list.createChild({cls:"x-combo-list-ft"}),this.pageTb=new Ext.PagingToolbar({store:this.store,
pageSize:this.pageSize,renderTo:this.footer}),this.assetHeight+=this.footer.getHeight());this.tpl||(this.tpl='\x3ctpl for\x3d"."\x3e\x3cdiv class\x3d"x-combo-list-item"\x3e{'+this.displayField+":htmlEncode}\x3c/div\x3e\x3c/tpl\x3e");this.view=new Ext.DataView({applyTo:this.innerList,tpl:this.tpl,singleSelect:!0,selectedClass:this.selectedClass,itemSelector:this.itemSelector||".x-combo-list-item",emptyText:this.listEmptyText});this.mon(this.view,"click",this.onViewClick,this);this.bindStore(this.store,
!0);var a;if(!Ext.isDefined(this.dontOverrideListWidth))if(Ext.isDefined(this.resizable)||"auto"===this.listWidth){if(a=this._setAutoWidth(),"auto"===this.listWidth&&this.store)this.store.on({scope:this,load:this._setAutoWidth})}else this.listWidth&&(a=this.listWidth||Math.max(this.wrap.getWidth(),this.minListWidth),this.list.setSize(a,0));this.list.swallowEvent("mousewheel");this.assetHeight=0;!1!==this.syncFont&&this.list.setStyle("font-size",this.el.getStyle("font-size"));this.title&&(this.header=
this.list.createChild({cls:"x-combo-list-hd",html:this.title}),this.assetHeight+=this.header.getHeight());this.innerList.setWidth(a-this.list.getFrameWidth("lr"));this.resizable&&(this.resizer=new Ext.Resizable(this.list,{pinned:!0,handles:"se"}),this.mon(this.resizer,"resize",function(a,c,d){this.maxHeight=d-this.handleHeight-this.list.getFrameWidth("tb")-this.assetHeight;this.listWidth=c;this.innerList.setWidth(c-this.list.getFrameWidth("lr"));this.restrictHeight()},this),this[this.pageSize?"footer":
"innerList"].setStyle("margin-bottom",this.handleHeight+"px"))}},_setAutoWidth:function(){Ext.fly(this.list.id).dom.style.width="";Ext.fly(this.innerList.id).dom.style.width="";var a=0;Ext.isIE?(this.innerList.addClass("list-auto-width-IE"),a=this.list.getBox(),this.innerList.removeClass("list-auto-width-IE")):a=this.list.getBox();a=Math.max(this.wrap.getWidth(),a.width)+(this.list.getHeight()>this.maxHeight?15:0);this.list.setSize(a,0);this.innerList.setWidth(a);return a},beforeBlur:function(){var a=
this.getRawValue(),b;this.valueField&&Ext.isDefined(this.value)&&(b=this.findRecord(this.valueField,this.value));if(!b||b.get(this.displayField)!=a)b=this.findRecord(this.displayField,a);if(!b&&this.forceSelection)0<a.length&&a!=this.emptyText?(this.el.dom.value=Ext.value(this.lastSelectionText,""),this.applyEmptyText()):this.clearValue();else{if(b&&this.valueField&&(a=b.get(this.valueField),this.value==a))return;this.setValue(a)}},onKeyUp:function(a){var b=a.getKey();if(!1!==this.editable&&!0!==
this.readOnly&&(b==a.BACKSPACE||b==a.DELETE||!a.isSpecialKey()))this.lastKey=b,this.dqTask.delay(this.queryDelay);Ext.form.ComboBox.superclass.onKeyUp.call(this,a)}});
Ext.override(Ext.form.Field,{markInvalid:function(a){a=LC.getLabel("AnalyticsDialog","error",a);if(this.rendered&&!this.preventMark){a=a||this.invalidText;var b=this.getMessageHandler();if(b)b.mark(this,a);else if(this.msgTarget&&(this.el.addClass(this.invalidClass),b=Ext.getDom(this.msgTarget)))b.innerHTML=a,b.style.display=this.msgDisplay;this.activeError=a;this.fireEvent("invalid",this,a)}}});
Ext.override(Ext.form.NumberField,{processValue:function(a){return Ext.form.NumberField.superclass.processValue.call(this,Ext.util.Format.htmlEncode(a))}});Ext.override(Ext.form.DateField,{onMenuHide:function(){this.focus();this.focus(!1,60);this.menuEvents("un")}});
Ext.override(Ext.menu.DateMenu,{initComponent:function(){this.on("beforeshow",this.onBeforeShow,this);if(this.strict=Ext.isIE7&&Ext.isStrict)this.on("show",this.onShow,this,{single:!0,delay:20});Ext.apply(this,{plain:!0,showSeparator:!1,items:this.picker=new Ext.DatePicker(Ext.apply({internalRender:this.strict||!Ext.isIE,ctCls:"x-menu-date-item"},this.initialConfig))});this.picker.purgeListeners();this.relayEvents(this.picker,["select"]);this.on("show",this.picker.focus,this.picker);Ext.menu.DateMenu.superclass.initComponent.call(this)}});
Ext.override(Ext.Component,{onShow:function(){this.getVisibilityEl().removeClass("x-hide-"+this.hideMode);Ext.isWebKit&&this.getVisibilityEl().show()}});
Ext.override(Ext.Element,{setOpacity:function(a,b){var c=this.dom.style;if(!b||!this.anim){var d="undefined"!=typeof document.createElement("div").style.opacity;if(Ext.isIE&&!d){var d=1>a?"alpha(opacity\x3d"+100*a+")":"",e=c.filter.replace(/alpha\(opacity=(.*)\)/i,"").replace(/^\s+|\s+$/g,"");c.zoom=1;c.filter=e+(0<e.length?" ":"")+d}else c.opacity=a}else this.anim({opacity:{to:a}},this.preanim(arguments,1),null,0.35,"easeIn");return this}});
Ext.dd.DragDropMgr.getLocation=function(a){if(!this.isTypeOfDD(a))return null;var b=a.getEl(),c,d,e;try{c=Ext.lib.Dom.getXY(b)}catch(f){}if(!c)return null;d=c[0];e=d+b.offsetWidth;c=c[1];return new Ext.lib.Region(c-a.padding[0],e+a.padding[1],c+b.offsetHeight+a.padding[2],d-a.padding[3])};
Ext.namespace("sfdc.analytics.framework");
sfdc.analytics.framework.CONFIRM=function(a,b,c,d,e){Ext.Msg.show({title:a,cls:"confirm_dialog",msg:b,buttons:{yes:LC.getLabel("Buttons","yes"),no:LC.getLabel("Buttons","no")},fn:function(a){"yes"==a?d():"no"==a&&Ext.isDefined(e)&&e()},modal:c,width:330});return this};sfdc.analytics.framework.WARNING=function(a,b,c,d){Ext.Msg.show({title:a,cls:"warning_dialog",msg:b,buttons:{yes:LC.getLabel("Buttons","ok")},modal:c,width:d||330});return this};
sfdc.analytics.framework.SAVE_AND_CLOSE=function(a,b,c,d){return Ext.Msg.show({title:a,cls:"save_and_close_dialog",msg:b,buttons:{yes:LC.getLabel("Buttons","save_and_close"),no:LC.getLabel("Buttons","close"),cancel:LC.getLabel("Buttons","cancel")},fn:function(a){"yes"==a?c():"no"==a&&d()},modal:!0,width:600})};
Ext.namespace("sfdc.analytics.framework");
sfdc.analytics.framework.initTreeSearchQuickfindInput=function(){sfdc.analytics.framework.TreeSearchQuickfindInput=Ext.extend(Sfdc.html.QuickfindInput,{constructor:function(a){a.searchFunction=this._delayedSearchFunction;a.clearFunction=this.clearSearchFilter;this._delayedSearchTask=new Ext.util.DelayedTask(this._performSearch,this);this._filterQuery=this._pendingQuery="";this._maxNodesAtLevel=a.maxNodesAtLevel;this._showMoreIncrement=a.showMoreIncrement||20;Ext.isNumber(this._maxNodesAtLevel)&&a.treeRoot.addListener("load",
this.clearSearchFilter,this);this._noMatchNode=new Ext.tree.TreeNode({text:LC.getLabel("analyticsHome","treeSearchNoMatch",a.pluralItemsText),leaf:!0,disabled:!0,cls:"noMatchNode"});sfdc.analytics.framework.TreeSearchQuickfindInput.superclass.constructor.call(this,a)},_delayedSearchFunction:function(a){this._pendingQuery=a.trim();this._delayedSearchTask.delay(200)},_performSearch:function(){if(this._pendingQuery!==this._filterQuery)if(""===this._pendingQuery)this.clearSearchFilter();else{this.clearNoMatch();
this._filterQuery=this._pendingQuery;var a=this._buildSearchRegex(this._pendingQuery);if(!this.filterByFunc(this.filterNode.createDelegate(this,[a],!0)))this.onNoMatch()}},onNoMatch:function(){this.treeRoot.contains(this._noMatchNode)||this.treeRoot.appendChild(this._noMatchNode);this._noMatchNode.getUI().show()},clearNoMatch:function(){this._noMatchNode.getUI().hide()},_buildSearchRegex:function(a){a=Ext.escapeRe(a.trim());return RegExp(a,"i")},filterNode:function(a,b){return a!=this._noMatchNode&&
-1!==a.attributes.text.search(b)},filterByFunc:function(a,b){b=b||this.treeRoot;var c=!1;if(b.isLeaf())return c=a.apply(a,[b]),this.setNodeVisibility(b,c),c;var k=0,h,f=0,d=this._maxNodesAtLevel,g;b.eachChild(function(b){b.isLeaf()||b.expand();Ext.isNumber(d)&&f<this._maxNodesAtLevel?((b=this.filterByFunc(a,b))&&f++,c=c||b):b.attributes.isMoreElementNode?h=b:(g=Ext.value(g,k),this.setNodeVisibility(b,!1));k++},this);Ext.isDefined(h)&&b.removeChild(h);if(Ext.isNumber(d)&&f===d){var e=this.showMore.createDelegate(this),
e=new Ext.tree.TreeNode({text:LC.getLabel("ReportBuilder","seeMoreResults"),isMoreElementNode:!0,fn:a,moreNodeIndex:g,leaf:!0,cls:"moreItemsNode",iconCls:"moreInfoIcon",listeners:{click:e}});b.appendChild(e);this.setNodeVisibility(e,!0)}b.isRoot||this.setNodeVisibility(b,c);return c},setNodeVisibility:function(a,b){b?a.getUI().show():a.getUI().hide()},clearSearchFilter:function(){this.clearNoMatch();this._delayedSearchTask.cancel();this._filterQuery="";this.filterByFunc(function(a){return a!=this._noMatchNode}.createDelegate(this));
this.treeRoot.collapse(!0,!1)},showMore:function(a){for(var b=a.parentNode.childNodes,c=b.length,k=a.attributes.moreNodeIndex,h=a.attributes.fn,f=this._showMoreIncrement,d=0,g,e=k;e<c;e++)if(g=b[e],h.apply(h,[g]))if(d<f)g.getUI().show(),d++;else{d++;break}d<=f?a.remove():a.attributes.moreNodeIndex=k+f;return!1}})};
Ext.namespace("Sfdc.analytics.home.accessibility");
Sfdc.analytics.home.accessibility.init=function(){Ext.onReady(function(){Sfdc.analytics.home.EventManager.addListener("switchFolder",function(a,b,d){var e=document.forms.listview_actionForm,c=new QueryString("");c.add("fcf",a);c.add("folderType",b);Ext.isEmpty(d)?c.add("sfk",null):c.add("sfk",d);a=c.concatenateWithUrl(e.action);e.action=a;Sfdc.analytics.home.accessibility.submitFilter()},this);Sfdc.analytics.home.accessibility.resize()})};
Sfdc.analytics.home.accessibility.setStartRow=function(a){var b=document.forms.listview_actionForm;0===a.indexOf("?")&&(a=a.substring(1));a=(new QueryString(a)).concatenateWithUrl(b.action);Sfdc.Forms.submitFormActionURL(b,a)};Sfdc.analytics.home.accessibility.submitFilter=function(){var a=document.forms.listview_actionForm,b=new QueryString("");b.add("lsr",0);b=b.concatenateWithUrl(a.action);Sfdc.Forms.submitFormActionURL(a,b)};
Sfdc.analytics.home.accessibility.resize=function(){var a=Ext.get("bodyTable").child(".homeContent"),b=a.child("#sidebar").getWidth(),d=a.child(".listview table.list").getWidth();a.setWidth(b+d+20)};
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.ActionColumnManager = function () {
    function g(b) {
        null !== c && a.removeClass(e + c);
        c = b;
        a.addClass(e + b)
    }

    function h(b) {
        if (!d) {
            var a = b.getStore().indexOfId(c); -1 < a && (b = b.getView(), Ext.fly(b.getRow(a)).removeClass(b.rowOverCls))
        }
        c = null;
        d = !1
    }

    function k(b) {
        a.removeClass(e + c);
        h.defer(100, this, [b])
    }
    var a = null,
        c = null,
        e = "actionMenu-",
        d = !1;
    return {
        get: function (b, c, e) {
            //debugger;
            var d = c.get(ListView.ID_COLUMN),
            //@@TODO jack removed
            //f = d.substr(0, 3),
                f = "00O";
            f = Sfdc.analytics.home.AnalyticsFilterDelegateRegistry.get(f);
            a ? a.removeAll() : a = new Ext.menu.Menu({
                cls: "actionMenu",
                defaultOffsets: [-1, 0],
                plain: !0,
                showSeparator: !1,
                listeners: {
                    hide: function (c) {
                        k(b);
                        b.removeListener("bodyscroll", a.hide, a)
                    }
                }
            });
            b.on("bodyscroll", a.hide, a, {
                scope: a,
                single: !0
            });
            a.add(f.getActionMenuItems(b.viewport, c, e));
            g(d);
            return a
        },
        getCurrentMenuId: function () {
            return c
        },
        dontRemoveNextHoverOverCls: function () {
            d = !0
        }
    }
} ();
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.AnalyticsFilterDelegateRegistry=function(){var b={};return{register:function(a,c){b[a]=c},get:function(a){return b[a]}}}();
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.AnalyticsHomeListViewport = function (a, b, c, d, e, g, f, h, k, l, m, getDataUrl) {
    ListViewport.call(this, b, c, d, a, !0, l, null, null, m);
    this.bottomBuffer = Sfdc.analytics.home.AnalyticsHome.BOTTOM_BUFFER_SIZE;
    this._defaultSearchText = k;
    this.updateSortStateHack = this.updateSortState;
    this.updateSortState = function () { };
    this.firstUpdateDone = !1;
    //this.url = UserContext.getUrl("/_ui/analytics/reporting/ui/home/AnalyticsHomeListServlet");
    this.url = getDataUrl;
    this._setHashState();
    //debugger;
    this.lastSearchTerm = this.lastSearchTerm || e || "";
    this._currentFolderId = this._currentFolderId || g;
    this._currentStandardFolderKey = this._currentStandardFolderKey || h;
    this._currentFolderType = this._currentFolderType || f;
    this._userFilterSelectionsOnAllFolders = { _currentScope: "recentlyViewed", _currentEntityType: "" };
    this._attachEventListeners(); this._setupFilters();
    Sfdc.userAgent.isIE7 || window.sfdcPage.appendToOnBeforeUnloadQueue(function () {
        var a = {};
        a[this.domId + "_pageState"] = this.pageState.value;
        this._setFilterState(a, {});
        Sfdc.History.update(a)
    } .createDelegate(this))
};
Sfdc.analytics.home.AnalyticsHomeListViewport.init = function () {
    Ext.extend(Sfdc.analytics.home.AnalyticsHomeListViewport, ListViewport, { getListDataPost: function (a) {
        var b = Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.getListDataPost.call(this, a);
        this._setFilterState(b, a); return b
    }, getReferences: function () {
        Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.getReferences.call(this);
        Ext.isEmpty(this._currentPage) || (this.pageState.value = this._currentPage, delete this._currentPage)
    }, initdd: function () {
        var a = this; this.drag = new Ext.dd.DragZone(this.grid.getEl(), { containerScroll: !0, scroll: !1, ddGroup: "GridToTree", rowId: "",
            getDragData: function (b) {
                if (b = b.getTarget("div.x-grid3-row")) {
                    b = Ext.get(b).select(".x-grid3-col-NAME", !0).elements[0];
                    var c = document.createElement("div"); c.className = "dragElement"; c.id = "analyticsHomeDnDProxy";
                    var d = a.drag.row.data.NAME; Sfdc.Dom.updateHTML(c, "object" == typeof d ? d[0] : d);
                    return { ddel: c, rowId: a.drag.row.id, repairXY: b.getXY() }
                }
            },
            getRepairXY: function () { return this.dragData.repairXY }
        });
        this.grid.on("rowmousedown", function (b, c, d) { a.drag.row = b.getStore().getAt(c) })
    },
        _setHashState: function () { var a = Sfdc.analytics.home.AnalyticsHome.HASH_STATE; a && (this.lastSearchTerm = a.search, this._currentFolderId = a.fcf, this._currentFolderType = a.folderType, this._currentStandardFolderKey = a.sfk, this._currentSort = a.sort, this._currentEntityType = a.entityType, this._currentScope = a.scope, this._currentPage = a[this.domId + "_pageState"]) },
        _setFilterState: function (a, b) {
            Ext.isEmpty(a.sort) || (this._currentSort = a.sort);
            a.sort = this._currentSort || ""; a.fcf = b.folderId || this._currentFolderId || "";
            a.folderType = b.folderType || this._currentFolderType || "";
            a.sfk = Ext.value(Ext.value(b.standardFolderKey, this._currentStandardFolderKey), "");
            a.entityType = b.entityType || this._currentEntityType || "";
            a.scope = b.scopeFilter || this._currentScope || "";
            a.search = b.search || this.lastSearchTerm || ""
        },
        getShowRefreshLink: function () { return !1 },
        getGridListeners: function () {
            var a = Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.getGridListeners.call(this), b = function (a, b, e, g) {
                if (this.hasActions) {
                    var f = g.getTarget("img.actionButtonArrow");
                    if (f) {
                        e = Sfdc.analytics.home.ActionColumnManager;
                        var h = e.getCurrentMenuId(); g = a.getStore().getAt(b);
                        var k = g.get(ListView.ID_COLUMN);
                        null === h ? (f = Ext.get(f), f.addClass("pressed"), b = e.get(a, g, this.currActions[b]), b.on("hide", function (a) { a.removeClass("pressed") } .createCallback(f)), b.show(f)) : k == h && (a = a.getView(), Ext.fly(a.getRow(b)).addClass(a.rowOverCls), e.dontRemoveNextHoverOverCls())
                    }
                }
            };
            a.cellclick ? a.cellclick.createSequence(b, this) : a.cellclick = { fn: b, scope: this };
            b = function (a) {
                var b = a.getView(), e = b.onRowOut;
                b.onRowOut = function (a, b, c, d) {
                    c = this.findRowIndex(b);
                    (d = d.getStore().getAt(c)) && d.get(ListView.ID_COLUMN) != Sfdc.analytics.home.ActionColumnManager.getCurrentMenuId() && e.call(this, a, b)
                } .createDelegate(b, [a], !0);
                a.getStore().on("remove", function (a, b, c) { this.hasActions && this.currActions.splice(c, 1) }, this)
            };
            a.beforerender ? a.beforerender.createSequence(b, this) : a.beforerender = { fn: b, scope: this };
            b = function (a) {
                if (a.enableColumnMove) {
                    var b = a.getView();
                    b.columnDrag.getDragData = b.columnDrag.getDragData.createInterceptor(function (a) { if (a.getTarget("." + b.hdCls + "-" + ListView.ACTION_COLUMN)) return !1 }, this);
                    b.columnDrop.onNodeDrop = b.columnDrop.onNodeDrop.createInterceptor(function (a, c, f, h) {
                        c = "." + b.hdCls + "-" + ListView.ACTION_COLUMN;
                        if (Ext.fly(a).child(c)) return !1
                    }, this)
                }
            };
            a.afterrender ? a.afterrender.createSequence(b, this) : a.afterrender = { fn: b, scope: this }; return a
        }, isInitialized: function () { return this.firstUpdateDone }, 
        updatePage: function (a) {
            Sfdc.analytics.home.EventManager.fireEvent("listDataUpdated", this, a);
            Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.updatePage.call(this, a);
            this._perRowValueArrays = { _folderIds: a.listData.ITEM_FOLDER_ID_KEY, _toVisibleFolderMovabilities: a.listData.ITEM_MOVE_TO_ANY_VISIBLE_FOLDER_KEY, itemEditabilities: a.listData.ITEM_EDIT_ACCESS_KEY, itemDashboardMoveToPersonalFolder: a.listData.ITEM_DASHBOARD_MOVE_TO_PERSONAL_FOLDER };
            this.hasActions && (this.currActions = a.listData.ACTION_ITEMS_COLUMN);
            this.sortState = a.sortState; this.firstUpdateDone || (Sfdc.analytics.home.EventManager.fireEvent("listViewInitialized"),this.firstUpdateDone = !0)
        },
        afterResize: function () { this.updateSortStateHack(this.sortState) },
        getDefaultColumnWidth: function (a) { var b = a.columnName; a = Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.getDefaultColumnWidth.call(this, a); "NAME" == b ? a = 315 : "FOLDER_NAME" == b ? a = 100 : "CREATED_BY_NAME" == b ? a = 100 : "CRON_TRIGGER_ID" == b ? a = 46 : "ENTITY_SUBSCRIPTION_ID" == b && (a = 46); return a },
        buildColumnConfig: function (a, b) {
            var c = Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.buildColumnConfig.apply(this, arguments);
            "CRON_TRIGGER_ID" == a.columnName && (c.tooltip = c.header, c.header = '\x3cimg src\x3d"/s.gif" class\x3d"scheduledIcon" ' + ((Ext.QuickTips.isEnabled ? "ext:qtip" : "title") + '\x3d"' + c.tooltip + '"') + "/\x3e"); return c
        },
        buildActionColumn: function (a, b) { var c = Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.buildActionColumn.call(this, a, b); c.tooltip = c.header; c.hidden = !1; c.resizable = !1; c.width = 60; return c },
        _setValueAndDisableIfNotDisabled: function (a, b, c) { a.disabled || this._setValueAndDisable(a, b, c) },
        _restoreValueAndEnable: function (a, b, c) { this._setValueAndEnable(a, b, void 0 !== this._userFilterSelectionsOnAllFolders[b] ? this._userFilterSelectionsOnAllFolders[b] : c) },
        _setStateAndComboboxValue: function (a, b, c) { this[b] = c; a.setValue(c) },
        _setValueAndDisable: function (a, b, c) { this._setStateAndComboboxValue(a, b, c); a.disable() },
        _setValueAndEnable: function (a, b, c) { this._setStateAndComboboxValue(a, b, c); a.enable() },
        _setStateAndComboBoxValueIfNotDisabled: function (a, b, c) { a.disabled || this._setStateAndComboboxValue(a, b, c) },
        _isAllFoldersNode: function (a, b, c) {
            return Ext.isEmpty(a) && Ext.isEmpty(b) && (void 0 === c || Ext.isNumber(c) && 0 > c)
        },
        _isOnAllFoldersNode: function () {
            //debugger;
            return this._isAllFoldersNode(this._currentFolderId, this._currentFolderType, this._currentStandardFolderKey)
        },
        _clearSearchBox: function () { this.lastSearchTerm = ""; this.searchBox.setValue(""); this.searchBox.trigger.hide() },
        _adjustEntityAndScopeFilters: function () {
            this._isOnAllFoldersNode() ? (this._entityTypeCombo && this._restoreValueAndEnable(this._entityTypeCombo, "_currentEntityType", ""),this._restoreValueAndEnable(this._scopeFilterCombo, "_currentScope", "noFilter")) :Ext.isNumber(this._currentStandardFolderKey) && 0 <= this._currentStandardFolderKey ? (this._entityTypeCombo && this._setValueAndDisableIfNotDisabled(this._entityTypeCombo, "_currentEntityType", "00O"), this._setValueAndDisableIfNotDisabled(this._scopeFilterCombo, "_currentScope", "noFilter")) : (this._entityTypeCombo && this._setValueAndEnable(this._entityTypeCombo, "_currentEntityType", ""), this._setValueAndEnable(this._scopeFilterCombo, "_currentScope", "noFilter"))
        },
        _attachEventListeners: function () {
            var a = Sfdc.analytics.home.EventManager;
            a.addListener("switchFolder", function (a, c, d) {
                this._currentFolderId = a; this._currentFolderType = c; this._currentStandardFolderKey = d; this._adjustEntityAndScopeFilters();
                this._clearSearchBox(); this.getListData()
            }, this);
            a.addListener("handleDnD", function (a, c, d, e) {
                var g = this.grid.getStore(), f = g.getById(c);
                c = g.indexOf(f);
                if (this._currentFolderId && d != this._currentFolderId) {
                    g.remove(f); a = this.paginator; a.totalRecords -= 1; a.draw(!1);
                    for (var h in this._perRowValueArrays) this._perRowValueArrays[h].splice(c, 1)
                }
                else f.set("FOLDER_NAME", a), f.commit(), this._perRowValueArrays._folderIds[c] = e
            }, this)
        }, getDefaultText: function () { var a = this._defaultSearchText; delete this._defaultSearchText; return a },
        search: function (a) {
            1 === a.length ? a = "" : (this._setStateAndComboBoxValueIfNotDisabled(this._scopeFilterCombo, "_currentScope", "noFilter"), this._entityTypeCombo && this._setStateAndComboBoxValueIfNotDisabled(this._entityTypeCombo, "_currentEntityType", ""));
            Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.search.call(this, a)
        },
        wireSearchBox: function () { Sfdc.analytics.home.AnalyticsHomeListViewport.superclass.wireSearchBox.call(this); this.searchBox && this.lastSearchTerm && (this.searchBox.setValue(this.lastSearchTerm), this.searchBox.trigger.show()) },
        _setupFilters: function () {
            Ext.onReady(function () {
                var a = Ext.get(this.domId + "_entityType"); a && (Ext.isEmpty(this._currentEntityType) || (a.dom.value = this._currentEntityType), this._entityTypeCombo = new Ext.form.ComboBox({ listClass: "entityFilterList", ctCls: "entityFilter", width: 160, listWidth: "auto",
                    transform: a, editable: !1, disabled: "disabled" === a.getAttribute("disabled") || -1 < this._currentStandardFolderKey, triggerAction: "all", listAlign: ["tr-br?", [18, 0]], listeners: { scope: this, beforeselect: function (a, c, d) { (c = a.getValue() != c.get(a.valueField)) || a.collapse(); return c },
                        select: function (a, c, d) {
                            this._currentEntityType = c.get(a.valueField); this._isOnAllFoldersNode() && (this._userFilterSelectionsOnAllFolders._currentEntityType = this._currentEntityType); this.getListData()
                        } 
                    }
                }), this._currentEntityType = this._entityTypeCombo.getValue(),this._isOnAllFoldersNode() && (this._userFilterSelectionsOnAllFolders._currentEntityType = this._currentEntityType));
                if (a = Ext.get(this.domId + "_scope")) Ext.isEmpty(this._currentScope) || (a.dom.value = this._currentScope), this._scopeFilterCombo = new Ext.form.ComboBox({ listClass: "scopeFilterList", ctCls: "scopeFilter", width: 160, listWidth: "auto", transform: a, editable: !1, disabled: "disabled" === a.getAttribute("disabled") || -1 < this._currentStandardFolderKey, triggerAction: "all", listAlign: ["tr-br?", [18, 0]], listeners: { scope: this,
                    beforeselect: function (a, c, d) { (c = a.getValue() != c.get(a.valueField)) || a.collapse(); return c },
                    select: function (a, c, d) { this._currentScope = c.get(a.valueField); this._isOnAllFoldersNode() && (this._userFilterSelectionsOnAllFolders._currentScope = this._currentScope); "recentlyViewed" === this._currentScope && (this._currentSort = ""); this.getListData() } 
                }
                }), this._currentScope = this._scopeFilterCombo.getValue(), this._isOnAllFoldersNode() && (this._userFilterSelectionsOnAllFolders._currentScope = this._currentScope)
            } .createDelegate(this))
        },
        _canMoveItemToFolder: function (a, b) {
            var c = a.type, d = b.substring(0, 3), e = this._getRowIndexOfItem(b), g = this._perRowValueArrays._folderIds[e], f = this._getCurrentRecord(b), h = this._perRowValueArrays.itemEditabilities[e], k = this._perRowValueArrays._toVisibleFolderMovabilities[e], e = this._perRowValueArrays.itemDashboardMoveToPersonalFolder[e];
            if ("01Z" === d && "005" === a.fid.substring(0, 3) && !e || f.isNotDraggable || g === a.fid || !("a" == c && ("00O" == d || "01Z" == d) || "b" == c && "01Z" == d || "r" == c && "00O" == d))
                return !1;
            c = a.sfk;
            return Ext.isNumber(c) && 0 <= c ? !1 : (a.canAddToFolder || k) && h ? !0 : !1
        },
        _getCurrentRecord: function (a) { return this.grid.getStore().getById(a) },
        _getRowIndexOfItem: function (a) { var b = this.grid.getStore(); a = b.getById(a); return b.indexOf(a) },
        _getRow: function (a) { a = this._getRowIndexOfItem(a); return this.grid.view.getRow(a) } 
    })
};
Ext.namespace("sfdc.analytics.home");
sfdc.analytics.home.EntityFolderUpdater = function (a, b, c) {
    this.url = UserContext.getUrl("/_ui/analytics/reporting/ui/home/EntityFolderUpdaterServlet");
    this.entities = a.dragData.rowId;
    this.fcf = b.node.attributes.fid;
    this.fName = b.node.attributes.text;
    this.fId = b.node.attributes.fid;
    this.rId = c.rowId
};
sfdc.analytics.home.EntityFolderUpdater.prototype = {
    updateEntity: function () {
        Sfdc.Ajax.post(this.url, this._handleUpdateResponse, {
            data: {
                entities: this.entities,
                fcf: this.fcf
            },
            context: this
        })
    },
    _handleUpdateResponse: function (a) {
        var b;
        try {
            b = Util.evalAjaxServletOutput(a)
        } catch (c) {
            window.location.reload()
        }
        if (a = Sfdc.analytics.home.AnalyticsHome.LV._getCurrentRecord(this.rId)) a.isNotDraggable = !1;
        a = Sfdc.analytics.home.AnalyticsHome.LV._getRow(this.rId);
        b.success ? (a && Ext.get(a).unmask(), Sfdc.analytics.home.EventManager.fireEvent("handleDnd",
            this.fName, this.rId, this.fId, this.fcf)) : (b = LC.getLabel("analyticsHome", "dndErrorText"), alert(b), a && Ext.get(a).unmask())
    }
};
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.EventManager=function(){var a=new Ext.util.Observable;a.addEvents("handleDnD","switchFolder","folderTreeLoaded","listDataUpdated","editSharingSettings","editFolder");return a}();
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.FolderActionRegistry = function () {
    var f = function (e, c) {
        var d = c.isSelected(),
            a = c.parentNode,
            b = c.attributes.folderTree;
        c.remove();
        a = a.firstChild;
        d && (null !== a ? b.switchFolder(a) : b.switchToFolder({
            fid: "",
            type: "",
            origText: LC.getLabel("news_mamager", "AllFoldersText")
        }));
        null === a && b.appendNoResultsNode(b.getRootNode())
    };
    return {
        getMenuItem: function (e, c) {
            var d = null,
                a = e.action,
                b = e.extraInfo,
                g = c.attributes;
            "EDIT" == a ? d = {
                text: b.label,
                href: b.url
            } : "DELETE" == a ? d = {
                text: b.label,
                handler: function (a) {
                    Modal.confirm(LC.getLabel("Global", "are_you_sure")) && (new sfdc.analytics.framework.EntityDeleter(g.fid, b.csrf, f.createDelegate(this, [a], !0))).deleteEntity()
                } .createCallback(c)
            } : "SHARE" == a ? d = {
                text: b.label,
                handler: function (a) {
                    Sfdc.analytics.home.EventManager.fireEvent("editSharingSettings", a.attributes.fid)
                   // Sfdc.analytics.home.EventManager.fireEvent("editSharingSettings", "editSharingSettings_1")
                } .createCallback(c)
            } : "PIN" == a ? d = {
                text: b.label,
                handler: function (a) {
                    Sfdc.analytics.home.FolderActionRegistry = function () {
                        var f = function (e, c) {
                            var d = c.isSelected(),a = c.parentNode,b = c.attributes.folderTree;
                            c.remove();
                            a = a.firstChild;
                            d && (null !== a ? b.switchFolder(a) : b.switchToFolder({
                                fid: "",
                                type: "",
                                origText: LC.getLabel("news_mamager", "AllFoldersText")
                            }));
                            null === a && b.appendNoResultsNode(b.getRootNode())
                        };
                        return {
                            getMenuItem: function (e, c) {
                                var d = null,                a = e.action,                b = e.extraInfo,                g = c.attributes;
                                "EDIT" == a ? d = {
                                    text: b.label,
                                    href: b.url
                                } : "DELETE" == a ? d = {
                                    text: b.label,
                                    handler: function (a) {
                                        Modal.confirm(LC.getLabel("Global","are_you_sure")) && (new sfdc.analytics.framework.EntityDeleter(g.fid, b.csrf, f.createDelegate(this, [a], !0))).deleteEntity()
                                    } .createCallback(c)
                                } : "SHARE" == a ? d = {
                                    text: b.label,
                                    handler: function (a) {
                                        Sfdc.analytics.home.EventManager.fireEvent("editSharingSettings", a.attributes.fid)
                                       // Sfdc.analytics.home.EventManager.fireEvent("editSharingSettings", "editSharingSettings_1")
                                    } .createCallback(c)
                                } : "PIN" == a ? d = {
                                    text: b.label,
                                    handler: function (a) {
                                        Sfdc.analytics.home.EventManager.fireEvent("pinFolder", a)
                                    } .createCallback(c)
                                } : "UNPIN" == a ? d = {
                                    text: b.label,
                                    handler: function (a) {
                                        Sfdc.analytics.home.EventManager.fireEvent("unpinFolder", a)
                                    } .createCallback(c)
                                } : "SEPARATOR" == a && (d = {
                                    xtype: "menuseparator"
                                });
                                return d
                            }
                        }
                    } ();
                    Sfdc.analytics.home.EventManager.fireEvent("pinFolder", a)
                } .createCallback(c)
            } : "UNPIN" == a ? d = {
                text: b.label,
                handler: function (a) {
                    Sfdc.analytics.home.EventManager.fireEvent("unpinFolder",
                        a)
                } .createCallback(c)
            } : "SEPARATOR" == a && (d = {
                xtype: "menuseparator"
            });
            return d
        }
    }
} ();
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.FolderTreeDropZone=function(a){Sfdc.analytics.home.FolderTreeDropZone.superclass.constructor.call(this,a.getTreeEl(),{ddGroup:"GridToTree"});this.tree=a};
Ext.extend(Sfdc.analytics.home.FolderTreeDropZone,Ext.dd.DropZone,{getTargetFromEvent:function(a){if(a=a.getTarget(".x-tree-node-el",10,!0)){var d=a.getAttribute("ext:tree-node-id"),b=this.tree.root.findChildBy(function(a){return a.id==d});if(b)return{node:b,ddel:a}}return null},onNodeOver:function(a,d,b,c){return Sfdc.analytics.home.AnalyticsHome.LV._canMoveItemToFolder(a.node.attributes,c.rowId)?this.dropAllowed:this.dropNotAllowed},onNodeDrop:function(a,d,b,c){c.rowId.substring(0,3);b=Sfdc.analytics.home.AnalyticsHome.LV._getCurrentRecord(c.rowId);
if(Sfdc.analytics.home.AnalyticsHome.LV._canMoveItemToFolder(a.node.attributes,c.rowId)){b.isNotDraggable=!0;if(b=Sfdc.analytics.home.AnalyticsHome.LV._getRow(c.rowId))waitMask=new Ext.LoadMask(b,{msgCls:"ext-el-mask-msg x-mask-loading dnd-loading-mask",msg:"moving..."}),waitMask.show();(new sfdc.analytics.home.EntityFolderUpdater(d,a,c)).updateEntity();return!0}return!1}});
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.FolderTreePanel=Ext.extend(Ext.tree.TreePanel,{initComponent:function(){this.eventModel=new Sfdc.analytics.home.FolderTreeEventModel(this);Sfdc.analytics.home.FolderTreePanel.superclass.initComponent.call(this)}});Ext.reg("foldertreepanel",Sfdc.analytics.home.FolderTreePanel);
Sfdc.analytics.home.FolderTreeEventModel=Ext.extend(Ext.tree.TreeEventModel,{getNodeTarget:function(b){var a=b.getTarget(".x-tree-node-icon",1);a||(a=b.getTarget(".x-tree-node-el",12));return a}});
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.getGuidedTour=function(a){return new Sfdc.GuidedTour({closeIntroLabel:LC.getLabel("GuidedTour","closeIntro"),closeOutroLabel:LC.getLabel("GuidedTour","closeOutro"),showLaterLabel:LC.getLabel("GuidedTour","showLater"),startTourLabel:LC.getLabel("GuidedTour","startTour"),continueLabel:LC.getLabel("GuidedTour","continue"),endTourLabel:LC.getLabel("GuidedTour","endTour"),previousLabel:LC.getLabel("GuidedTour","previous"),replayLabel:LC.getLabel("GuidedTour","replay"),shouldShowHandler:function(){return"1"!==
Ext.util.Cookies.get("analyticshomegt")},closeForeverHandlerIntercept:function(){Ext.util.Cookies.set("analyticshomegt","1");UserContext.userPreferences.setBoolean("HideAnalyticsHomeGuidedTour",!0)},showLaterHandlerIntercept:function(){Ext.util.Cookies.set("analyticshomegt","1")},steps:[{width:400,title:LC.getLabel("AnalyticsHomeTour","introTitle"),content:'\x3ctable style\x3d"width:100%;"\x3e\x3ctr\x3e\x3ctd style\x3d"vertical-align:top;"\x3e'+LC.getLabel("AnalyticsHomeTour","intro")+'\x3c/td\x3e\x3ctd style\x3d"vertical-align:top;"\x3e\x3cimg src\x3d"/s.gif" class\x3d"gtIntroImg"/\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e',
countStep:!1,toolbarItems:[{xtype:"button",labelType:"closeIntroLabel",action:"closeForeverHandler"},{xtype:"button",labelType:"showLaterLabel",action:"showLaterHandler"},{xtype:"tbfill"},{xtype:"button",labelType:"startTourLabel",action:"nextStepHandler"}]},{locator:"#report_Tab",position:"tl-b",useArrow:!0,offsets:[-20,0],arrowOffset:20,title:LC.getLabel("AnalyticsHomeTour","step1Title"),content:LC.getLabel("AnalyticsHomeTour","step1Text"),width:400,countStep:!0,toolbarItems:[{xtype:"label"},{xtype:"tbfill"},
{xtype:"button",labelType:"previousLabel",action:"prevStepHandler"},{xtype:"button",labelType:"continueLabel",action:"nextStepHandler"}]},{locator:".subNav .linkBar .quickfindContainer",position:"l-tr",useArrow:!0,offsets:[-10,10],arrowOffset:-20,width:480,title:LC.getLabel("AnalyticsHomeTour","step2Title"),content:LC.getLabel("AnalyticsHomeTour","step2Text"),countStep:!0,toolbarItems:[{xtype:"label"},{xtype:"tbfill"},{xtype:"button",labelType:"previousLabel",action:"prevStepHandler"},{xtype:"button",
labelType:"continueLabel",action:"nextStepHandler"}]},{locator:".listBody .x-grid3-hd-row .x-grid3-td-NAME",position:"t-br",offsets:[0,0],useArrow:!0,width:400,title:LC.getLabel("AnalyticsHomeTour","step3Title"),content:LC.getLabel("AnalyticsHomeTour","step3Text"),countStep:!0,toolbarItems:[{xtype:"label"},{xtype:"tbfill"},{xtype:"button",labelType:"previousLabel",action:"prevStepHandler"},{xtype:"button",labelType:"continueLabel",action:"nextStepHandler"}]},{locator:".folderTree",position:"l-tr",
offsets:[-25,200],useArrow:!0,width:400,title:LC.getLabel("AnalyticsHomeTour","step4Title"),content:'\x3ctable style\x3d"width:100%;"\x3e\x3ctr\x3e\x3ctd style\x3d"vertical-align:top;"\x3e'+LC.getLabel("AnalyticsHomeTour","step4Text")+'\x3c/td\x3e\x3ctd style\x3d"vertical-align:top;"\x3e\x3cimg src\x3d"/s.gif" class\x3d"gtDnDImg"/\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e',countStep:!0,toolbarItems:[{xtype:"label"},{xtype:"tbfill"},{xtype:"button",labelType:"previousLabel",action:"prevStepHandler"},
{xtype:"button",labelType:"continueLabel",action:"nextStepHandler"}]},{locator:".listBody .x-grid3-row-first .x-grid3-td-ACTION_COLUMN",position:"t-b",offsets:[-2,-5],useArrow:!0,width:400,title:LC.getLabel("AnalyticsHomeTour","step5Title"),content:LC.getLabel("AnalyticsHomeTour","step5Text"),countStep:!0,toolbarItems:[{xtype:"label"},{xtype:"tbfill"},{xtype:"button",labelType:"previousLabel",action:"prevStepHandler"},{xtype:"button",labelType:"endTourLabel",action:"nextStepHandler"}]},{width:450,
title:LC.getLabel("AnalyticsHomeTour","outroTitle"),content:LC.getLabel("AnalyticsHomeTour","outro",a),countStep:!1,toolbarItems:[{xtype:"tbfill"},{xtype:"button",labelType:"replayLabel",action:"jumpToStartHandler"},{xtype:"button",labelType:"closeOutroLabel",action:"closeForeverHandler"}]}]})};
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.ServerProxy=function(){Def=Ext.extend(Ext.util.Observable,{constructor:function(){Def.superclass.constructor.apply(this)},init:function(){this.addEvents(this.Events.RESPONSE)},COMMIT_ACTION:{ADD:"ADD",UPDATE:"UPDATE",REMOVE:"REMOVE"},Events:{RESPONSE:"response"},getAllShared:function(a,b,c){Ext.get("input").dom.value=Ext.util.JSON.encode({folderId:a,urog:b,search:c});getAllShared()},getSharedPerGroupType:function(a,b,c){Ext.get("input").dom.value=Ext.util.JSON.encode({folderId:a,
urog:b,search:c});getSharedPerGroupType()},getUnsharedPerGroupType:function(a,b,c){Ext.get("input").dom.value=Ext.util.JSON.encode({folderId:a,urog:b,search:c});getUnsharedPerGroupType()},commitShares:function(a,b,c){Ext.get("input").dom.value=Ext.util.JSON.encode({folderId:a,action:b,shareList:c});commitShares()},setPinnedFolders:function(a){Ext.get("input").dom.value=Ext.util.JSON.encode({folderId:a});setPinnedFolders()},unPinFolders:function(a){Ext.get("input").dom.value=Ext.util.JSON.encode({folderId:a});
unPinFolders()},updateResponse:function(a){this.fireEvent(Sfdc.analytics.home.ServerProxy.Events.RESPONSE,a)}});ret=new Def;ret.init();return ret}();
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.AnalyticsFilterDelegate = function (b) {
    this._entityType = b
};
Sfdc.analytics.home.AnalyticsFilterDelegate.prototype = {
    getEntityType: function () {
        return this._entityType
    },
    formatColumnValue: function (b, c) {
        var a = c;
        "ENTITY_TYPE" == b && (a = this.getEntityNameLabel(), a = '\x3cimg src\x3d"/s.gif" class\x3d"' + this.getEntityIconCls() + '" alt\x3d"' + a + '" title\x3d"' + a + '"/\x3e');
        return a
    },
    getEntityNameLabel: function () { },
    getEntityIconCls: function () { },
    getActionMenuItems: function (b, c, a) {
        var e = c.get(ListView.ID_COLUMN), d = [];
        Ext.each(a, function (a) {
            var f = a.action, g = a.extraInfo;
            //@@TODO added
            // debugger;
            //d.push(this._createBlankLink(a)); 
            ("PREVIEW" == f || "EDIT" == f) ? d.push({ text: g.label,
                handler: function (a) {
                    window.open(g.url);                   
                } .createDelegate(this)
            }) :
            //"PREVIEW" == f ? d.push(this._createBlankLink(a)) :           
            //"EDIT" == f ? d.push(this._createStandardLink(a)) :
             "DELETE" == f ? d.push({
                text: g.label,
                handler: function (a) {
                    a = function () {
                        (new sfdc.analytics.framework.EntityDeleter(e, g.csrf, this._handleDeleteEntityResponse.createDelegate(this, [b, c], !0))).deleteEntity()
                    } .createDelegate(this);
                    g.scheduled ? ScheduleReportOverlayUtil.warnScheduleReportDialogElement(e, a, function () { }) : Modal.confirm(LC.getLabel("Global", "are_you_sure")) && a()
                } .createDelegate(this)
            }) : "FOLLOW" == f ? d.push(this._createFollowItem(e, a)) : "EXPORT" == f && d.push(this._createStandardLink(a))
        }, this);
        return d
    },
    _createStandardLink: function (b) {
        b = b.extraInfo;
        return {
            text: b.label,
            href: b.url
        }
    },
    /*jack added*/
    _createBlankLink: function (b) {
        b = b.extraInfo;
        return {
            text: b.label,
            href: b.url,
            handler: function (a) {
                window.open(b.url);
            }.createDelegate(this)
        }
    },
    _createFollowItem: function (b, c) {
        return {
            text: c.extraInfo.follow ? LC.getLabel("Feeds", "Unfollow") : LC.getLabel("Feeds", "Follow"),
            handler: function (a) {
                var e = c.extraInfo,
                    d = e.follow,
                    h = chatter.getToolbox(),
                    f = "/subscriptions/" + b + (d ? ";delete" : ";new");
                a.disable();
                h.post({
                    url: f,
                    params: {
                        entityid: b
                    },
                    failure: function () {
                        a.enable()
                    },
                    success: function () {
                        a.enable();
                        var b = d ? LC.getLabel("Feeds", "Follow") : LC.getLabel("Feeds", "Unfollow");
                        a.setText(b);
                        e.follow = !d
                    }
                })
            }
        }
    },
    _handleDeleteEntityResponse: function (b, c, a) {
        a.store.remove(a);
        b = c.paginator;
        b.totalRecords -= 1;
        b.draw(!1)
    }
};
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.FolderTree = function (a) {
    function b(a) {
        var b = Ext.get(document.createElement("li"));
        b.addClass("itemLinkMover");
        Ext.fly(a.dom.parentElement).appendChild(b);
        b.setX(a.getX());
        b.setY(a.getY());
        b.setWidth(a.getWidth());
        b.setHeight(a.getHeight());
        Ext.each(a.dom.childNodes, function () {
            1 === this.nodeType && b.appendChild(this.cloneNode(!0))
        });
        return b
    }
    var e = Sfdc.analytics.home.AnalyticsHome.HASH_STATE;
    a.folderId = e && e.fcf || a.folderId;
    a.folderType = e && e.folderType || a.folderType;
    var c = this;
    this.pinningTimeout = 12E4;
    this.pinningAnimationTimeout = 500;
    this.minAnimationInterval = 50;
    this.dataUrl = UserContext.getUrl("/_ui/analytics/reporting/ui/home/FolderTreeServlet");
    if (a.dataUrl)
        this.dataUrl = a.dataUrl; //jackAdded
    this._canAddReportFolder = a.canAddReportFolder;
    this._canAddDashboardFolder = a.canAddDashboardFolder;
    this._canAddItemFolder = a.canAddItemFolder;
    this._newReportFolderUrl = a.newReportFolderUrl;
    this._newDashboardFolderUrl = a.newDashboardFolderUrl;
    this._newItemFolderUrl = a.newItemFolderUrl;
    this.lastFilterVal = "";
    this.folderTree = this.searchBox = this.xhr = null;
    this._canPinFolder = !1;
    this.panel = {
        xtype: "panel",
        id: "folderTreePanel",
        layout: "fit",
        border: !1,
        listeners: {
            render: c.resize.createDelegate(this)
        }
    };
    var e = { xtype: "container", cls: "folderText", html: LC.getLabel("udd_Folder", "Entities") }, l = new Ext.tree.AsyncTreeNode({  expanded: !1  });
    this.searchBox = new Sfdc.html.QuickfindInput({
        searchFunction: this.search,
        clearFunction: this.search.createDelegate(this, [""]),
        scope: this,
        emptyText: LC.getLabel("news_mamager", "folderSearch"),
        buffer: 300,
        region: "center",
        margins: {
            top: 3,
            left: 1
        }
    });
    var g = this._getFolderMenuItems(),d = [this.searchBox];
    0 < g.length && d.push({
        xtype: "button",
        cls: "addFolder",
        iconCls: "newFolder",
        region: "east",
        margins: {
            top: 3,
            right: 2
        },
        menu: {
            cls: "actionMenu",
            items: g
        }
    });
    g = new Ext.Toolbar({
        layout: "border",
        border: !0,
        items: d
    });
    d = new Ext.tree.DefaultSelectionModel;
    d.addListener("beforeselect", function (a, b) {
        var c = b.attributes,
            e = c.isRoot;
        return !Ext.isEmpty(c.fid) || e ? !0 : !1
    });
    lineSeparatorNode = new Ext.tree.TreeNode({
        allowDrag: !1,
        leaf: !0,
        cls: "nodeSeparator",
        isSeparator: !0
    });
    this.addNodeSeparator = function (a) {
        var b = !1;
        Ext.each(a.childNodes, function (c) {
            var e = c.attributes;
            if ("true" === e.isPinned) return b || (b = !0), !0;
            if (e.isSeparator) return !1;
            if ("false" === e.isPinned && b) return a.insertBefore(lineSeparatorNode, c), a.insertBefore(lineSeparatorNode, c), b = !1
        }, this)
    };
    Sfdc.analytics.home.EventManager.addListener("pinFolder", function (a) {
        function e(d) {
            var n = Ext.get(d), q = b(n);
            n.setVisibilityMode(Ext.Element.DISPLAY).hide();
            var h = d.previousSibling,
                k = c.folderTree.root;
            k.firstChild.ui.elNode.parentElement.scrollIntoView();
            var p = 0 === k.indexOf(a) ? c.minAnimationInterval : Math.min(c.pinningAnimationTimeout / k.indexOf(a), c.minAnimationInterval),
                f = function () {
                    if (h && 0 === Sfdc.select(".allFoldersNode", h).length) q.setY(Ext.fly(h).getY()), h = h.previousSibling, setTimeout(f, p);
                    else {
                        q.remove();
                        h ? k.insertBefore(a, c.folderTree.root.childNodes[1]) : k.insertBefore(a, c.folderTree.root.firstChild);
                        c.addNodeSeparator(k);
                        var b = n.dom.parentElement;
                        Ext.fly(Sfdc.select(".x-tree-ec-icon", n.dom)[0]).removeClass("x-tree-elbow-end").addClass("x-tree-elbow");
                        Ext.fly(Sfdc.select(".x-tree-ec-icon", b.lastChild)[0]).removeClass("x-tree-elbow").addClass("x-tree-elbow-end");
                        n.show()
                    }
                };
            setTimeout(f, p)
        }
        Ext.Ajax.request({
            url: a.attributes.folderTree.dataUrl,
            params: {
                action: "PIN",
                folderToPin: a.attributes.fid
            },
            method: "POST",
            timeout: c.pinningTimeout,
            success: function (b) {
                try {
                    //debugger;
                    var d = Util.evalAjaxServletOutput(b.responseText);
                    if (d && !0 === d.pinStatus) {
                        a.attributes.isPinned = "true";
                        c._canPinFolder = d.canPinFolder;
                        var g = a.ui.elNode.parentElement;
                        Ext.fly(Sfdc.select(".pinImage", g)[0]).removeClass("itemUnpinned").addClass("itemPinned");
                        e(g)
                    }
                } catch (h) { }
            },
            failure: function () { }
        })
    });
    Sfdc.analytics.home.EventManager.addListener("unpinFolder",
        function (a) {
            function e(b) {
                var c = a.attributes;
                b = b.attributes;
                return b.isSeparator || "true" === b.isPinned || b.defaultFolders ? !0 : "moreItemsNode" === b.cls ? !1 : !c.isStandardFolder && b.isStandardFolder ? !1 : c.isStandardFolder && !b.isStandardFolder ? !0 : c.isStandardFolder && b.isStandardFolder ? c.sfk > b.sfk : c.text.toUpperCase() === b.text.toUpperCase() ? c.fid > b.fid : c.text.toUpperCase() > b.text.toUpperCase()
            }

            function d() {
                var a = !1,
                    b = c.folderTree.root;
                Ext.each(b.childNodes, function (c) {
                    if ("true" === c.attributes.isPinned) return a ||
                        (a = !0), !0;
                    if (c.attributes.isSeparator && !a) return b.removeChild(c), !1
                }, this)
            }

            function g() {
                for (var a = c.folderTree.root, b = 0, d = a.childNodes.length - 1, f = 0; b < d; ) f = Math.floor((b + d) / 2), e(a.childNodes[f]) ? b = f + 1 : d = f - 1;
                return f
            }

            function l(h) {
                var k = Ext.get(h), p = b(k);
                k.setVisibilityMode(Ext.Element.DISPLAY).hide();
                var f = h.nextSibling,
                    m = a.nextSibling;
                h = g();
                var r = 0 === h ? c.minAnimationInterval : Math.min(c.pinningAnimationTimeout / h, c.minAnimationInterval),
                    s = function () {
                        if (f && m && e(m)) p.setY(Ext.fly(f).getY()), f = f.nextSibling,
                            m = m.nextSibling, setTimeout(s, r);
                        else {
                            var b = k.dom.parentElement;
                            p.remove();
                            m ? c.folderTree.root.insertBefore(a, m) : (Ext.fly(Sfdc.select(".x-tree-ec-icon", k.dom)[0]).removeClass("x-tree-elbow").addClass("x-tree-elbow-end"), Ext.fly(Sfdc.select(".x-tree-ec-icon", b.lastChild)[0]).removeClass("x-tree-elbow-end").addClass("x-tree-elbow"), c.folderTree.root.appendChild(a));
                            d();
                            k.show()
                        }
                    };
                setTimeout(s, r)
            }
            Ext.Ajax.request({
                url: a.attributes.folderTree.dataUrl,
                params: {
                    action: "UNPIN",
                    folderToUnPin: a.attributes.fid
                },
                method: "POST",
                timeout: c.pinningTimeout,
                success: function (b) {
                    try {
                        var e = Util.evalAjaxServletOutput(b.responseText);
                        if (e && !0 === e.unpinStatus) {
                            a.attributes.isPinned = "false";
                            c._canPinFolder = e.canPinFolder;
                            var d = a.ui.elNode.parentElement;
                            Ext.fly(Sfdc.select(".pinImage", d)[0]).removeClass("itemPinned").addClass("itemUnpinned");
                            l(d)
                        }
                    } catch (f) { }
                },
                failure: function () { }
            })
        });
    d.addListener("selectionchange", function (a, b) {  this.switchFolder(b) } .createDelegate(this));
    var t = new QueryString;
    this.folderTree = {
        xtype: "foldertreepanel",
        cls: "folderTree",
        tbar: g,
        border: !1,
        rootVisible: !1,
        autoScroll: !0,
        root: l,
        selModel: d,
        loader: new Ext.tree.TreeLoader({
            baseAttrs: {
                uiProvider: Sfdc.analytics.home.FolderTreeNodeUI,
                onloadSelectedFolder: a.folderId,
                onloadSelectedFolderType: a.folderType,
                listeners: {
                    beforeclick: function (a, b) {
                        var c = b.getTarget(".folderButton");
                        return Ext.isEmpty(c)
                    }
                },
                folderTree: this
            },
            baseParams: {
                action: "LIST",
                isdtp: t.get("isdtp")
            },
            paramsAsHash: !0,
            clearOnLoad: !0,
            directFn: this.loadTree.createDelegate(this, [this], !0),
            requestMethod: "POST",
            listeners: {
                load: function (a, b) {
                    // debugger;
                    Sfdc.analytics.home.EventManager.fireEvent("folderTreeLoaded", b.getOwnerTree())
                }
            }
        }),
        listeners: {
            beforeclick: function (a, b) {
                return !a.isSelected()
            },
            afterrender: function (a) {
                this.dropZone = new Sfdc.analytics.home.FolderTreeDropZone(this)
            }
        }
    };
    this.panel.items = [this.folderTree];
    this.panel = Ext.create(this.panel);
    this.folderContainer = {
        xtype: "container",
        items: [e, this.panel]
    };
    window.sfdcPage.appendToOnResizeQueue(function () {
        c.resize()
    })
};
Sfdc.analytics.home.FolderTree.prototype = {
    renderTo: function (a) {
        this.folderContainer.renderTo = a;
        Ext.create(this.folderContainer)
    },
    loadTree: function (a, b, e) {
        this.showLoading();
        this.xhr && (this.xhr.onreadystatechange = function () { }, this.xhr.abort());
        this.xhr = Sfdc.Ajax.post(e.dataUrl, this.handleLoadTreeResponse.createDelegate(this, [b], !0), {
            data: a,
            escape: encodeURIComponent
        })
    },
    showLoading: function () {
        this.loadingNode = new Ext.tree.TreeNode({
            disabled: !0,
            leaf: !0,
            allowDrag: !1,
            text: LC.getLabel("Global", "loading"),
            cls: "loadingNode"
        });
        this.folderTree.root.appendChild(this.loadingNode)
    },
    hideLoading: function () {
        this.loadingNode.remove(!0);
        this.loadingNode = void 0
    },
    handleLoadTreeResponse: function (a, b, e, c) {
        this.hideLoading();
        var l;
        try {
            l = Util.evalAjaxServletOutput(a)
        } catch (g) {
            window.location.reload()
        }
        c.call(this, l.list, b);
        this._canPinFolder = l.canPinFolder;
        a = this.folderTree.root;
        a.hasChildNodes() || this.appendNoResultsNode(a);
        this.addNodeSeparator(a);
        a.hasChildNodes() && a.lastChild.attributes.resultsTruncated && this.appendResultsTruncatedNode(a)
    },
    appendNoResultsNode: function (a) {
        var b = new Ext.tree.TreeNode({
            text: LC.getLabel("analyticsHome", "noResultText"),
            allowDrag: !1,
            leaf: !0,
            cls: "noMatchNode",
            iconCls: "moreInfoIcon",
            qtipCfg: {
                text: LC.getLabel("analyticsHome", "noResultQTip")
            }
        });
        a.appendChild(b)
    },
    appendResultsTruncatedNode: function (a) {
        var b = new Ext.tree.TreeNode({
            text: LC.getLabel("analyticsHome", "moreElementText"),
            allowDrag: !1,
            leaf: !0,
            cls: "moreItemsNode",
            iconCls: "moreInfoIcon",
            qtipCfg: {
                text: LC.getLabel("analyticsHome", "moreElementQTip")
            }
        });
        a.appendChild(b)
    },
    getRootNode: function () {
        return this.folderTree.root
    },
    search: function (a) {
        a != this.lastFilterVal && (this.lastFilterVal = a, this.folderTree.loader.baseParams.filterVal = a, this.folderTree.loader.load(this.folderTree.root, this.handleSearchResponse.createDelegate(this), this))
    },
    handleSearchResponse: function (a) {
        this.searchBox.focus()
    },
    switchFolder: function (a) {
        if (a) {
            a.isSelected() || a.select();
            var b = a.attributes;
            this.switchToFolder({
                fid: b.fid,
                type: b.type,
                sfk: b.sfk,
                origText: a.origText
            })
        }
    },
    switchToFolder: function (a) {
        this.folderTree.loader.baseAttrs.onloadSelectedFolder = a.fid;
        this.folderTree.loader.baseAttrs.onloadSelectedFolderType = a.type;
        Sfdc.analytics.home.EventManager.fireEvent("switchFolder", a.fid, a.type, a.sfk, a.origText)
    },
    _getFolderMenuItems: function () {
        var a = [];
        this._canAddItemFolder && a.push({
            text: LC.getLabel("news_mamager", "newItemFolder"),
            href: this._newItemFolderUrl
        });
        
        this._canAddReportFolder && a.push({
            text: LC.getLabel("analyticsHome", "newReportFolder"),
            href: this._newReportFolderUrl
        });
        /*
        this._canAddDashboardFolder && a.push({
            text: LC.getLabel("analyticsHome", "newDashboardFolder"),
            href: this._newDashboardFolderUrl
        });
        */
        return a;
    },
    resize: function () {
        var a = this.panel.body.getTop();
        this.panel.setHeight(document.documentElement.clientHeight - a - Sfdc.analytics.home.AnalyticsHome.BOTTOM_BUFFER_SIZE)
    }
};
Sfdc.analytics.home.FolderTreeNodeUI = Ext.extend(Ext.tree.TreeNodeUI, {
    constructor: function (a) {
        var b = a.attributes;
        a.origText = a.text;
        a.text = '\x3cdiv class\x3d"nodeText"\x3e' + escapeHTML(a.text) + "\x3c/div\x3e";
        a.text = a.text + '\x3cimg class\x3d" pinImage ' + ("true" === b.isPinned ? "itemPinned" : "itemUnpinned") + '" src\x3d"/s.gif" alt\x3d""/\x3e';
        b.cls = b.isRoot ? "allFoldersNode" : b.fid + "-" + b.type;
        b.iconCls = "r" === b.type ? "x-analytics-report-folder-icon" : "x-analytics-dashboard-folder-icon";
        Sfdc.analytics.home.FolderTreeNodeUI.superclass.constructor.call(this, a)
    },
    render: function () {
        Sfdc.analytics.home.FolderTreeNodeUI.superclass.render.apply(this, arguments);
        var a = Ext.fly(this.textNode).child("div.nodeText").dom;
        a.setAttributeNS ? a.setAttributeNS("ext", "qtip", escapeHTML(this.node.origText)) : a.setAttribute("ext:qtip", escapeHTML(this.node.origText));
        a.setAttribute("data-qtip", escapeHTML(this.node.origText));
        a = this.node.attributes;
        if (a.onloadSelectedFolder == a.fid && (Ext.isEmpty(a.onloadSelectedFolderType) || a.onloadSelectedFolderType == a.type)) this.node.getOwnerTree().getSelectionModel().suspendEvents(!1),
            this.node.select(), this.node.getOwnerTree().getSelectionModel().resumeEvents();
        delete a.onloadSelectedFolder;
        delete a.onloadSelectedFolderType
    },
    onOver: function (a) {
        Sfdc.analytics.home.FolderTreeNodeUI.superclass.onOver.call(this, a);
        a = this.node;
        var b = a.attributes;
        b.actions && 0 < b.actions.length && (a.folderMenuButton ? (a.folderMenuButton.menu.removeAll(), a.folderMenuButton.menu.add(this._createMenuItem(a)), a.folderMenuButton.menu.items && a.folderMenuButton.menu.items.items[0].text === LC.getLabel("analyticsHome",
            "pinToTop") ? (a.folderMenuButton.addClass("pinningOption"), a.folderMenuButton.iconCls = "") : (a.folderMenuButton.removeClass("pinningOption"), a.folderMenuButton.iconCls = "actionButtonArrow"), a.folderMenuButton.show()) : (b = this._createMenu(a), a.folderMenuButton = new Ext.Button({
                cls: "folderButton",
                iconCls: "actionButtonArrow",
                menu: b,
                listeners: {
                    menushow: function (a, b) {
                        this.body.on("scroll", b.hide, b, {
                            scope: b,
                            single: !0
                        })
                    } .createDelegate(a.getOwnerTree()),
                    menuhide: function (a, b) {
                        this.body.removeListener("scroll",
                        b.hide, b)
                    } .createDelegate(a.getOwnerTree())
                }
            }), a.folderMenuButton.menu.items && a.folderMenuButton.menu.items.items[0].text === LC.getLabel("analyticsHome", "pinToTop") && (a.folderMenuButton.addClass("pinningOption"), a.folderMenuButton.iconCls = ""), b = Ext.fly(this.textNode).child("div.nodeText").parent(), a.folderMenuButton.render(b)))
    },
    _createMenuItem: function (a) {
        var b = a.attributes, e = [],c, l = Sfdc.analytics.home.FolderActionRegistry,g = !0;
        Ext.each(b.actions, function (d) {
            if (c = l.getMenuItem(d, a))
                if ("PIN" === d.action && "false" === b.isPinned && !b.folderTree._canPinFolder) g = !1;
                else {
                    if ("UNPIN" === d.action && "false" === b.isPinned) return !0;
                    ("SEPARATOR" !== d.action || "SEPARATOR" === d.action && g) && e.push(c)
                }
        }, this);
        return e
    },
    _createMenu: function (a) {
        var b = a.attributes;
        a = this._createMenuItem(a);
        return {
            cls: "actionMenu " + b.cls,
            items: a,
            listeners: {
                hide: function (a) {
                    a.ownerCt && a.ownerCt.hide()
                }
            }
        }
    },
    onOut: function (a) {
        Sfdc.analytics.home.FolderTreeNodeUI.superclass.onOut.call(this, a);
        (a = this.node.folderMenuButton) && (a.menu.isVisible() || a.hide())
    }
});
Ext.namespace("Sfdc.analytics.home.sharing");
Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings = function () {
    return {
        init: function (a) {
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS = {
                ALL: LC.getLabel("analyticsSharing", "all"),
                AND: LC.getLabel("analyticsSharing", "and"),
                SEARCH_MORE: LC.getLabel("analyticsSharing", "tooManyRows"),
                VIEWER: LC.getLabel("analyticsSharing", "viewer"),
                MANAGER: LC.getLabel("analyticsSharing", "manager"),
                EDITOR: LC.getLabel("analyticsSharing", "editor"),
                CLOSE: LC.getLabel("analyticsSharing", "close"),
                SHARE: LC.getLabel("analyticsSharing", "share"),
                SHARING_SETTINGS: LC.getLabel("analyticsSharing", "sharingSetting"),
                SHARE_WITH: LC.getLabel("analyticsSharing", "shareWith"),
                SHARED_WITH: LC.getLabel("analyticsSharing", "sharedWith"),
                STOP_SHARING_HOVER_TEXT: LC.getLabel("analyticsSharing", "stopSharingHover"),
                ACCESS: LC.getLabel("analyticsSharing", "permissions"),
                ACCESS_HOVER_TEXT: LC.getLabel("analyticsSharing", "permissionsHoverText"),
                SHARED: LC.getLabel("analyticsSharing", "shared"),
                LOADING: LC.getLabel("analyticsSharing", "loading"),
                DONE: LC.getLabel("analyticsSharing", "done"),
                NO_SEARCH_RESULTS: LC.getLabel("analyticsSharing", "noSearchResults"),
                NO_RESULTS: function (a) {
                    return LC.getLabel("analyticsSharing", "noResults", a)
                },
                DEFAULT_SEARCH_TEXT: LC.getLabel("analyticsSharing", "defaultSearchText")
            };
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.DIALOG_HELP_URL = a;
            a = '\x3ca class\x3d"permissionCellText" id\x3d"permissionMenu_{ugId}"\x3e\x3ctpl if\x3d"shared !\x3d\x3d true"\x3e\x3c/tpl\x3e\x3ctpl if\x3d"shared \x3d\x3d true \x26\x26 shareLevel \x3d\x3d \'VIEW_\'"\x3e' +
                Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.VIEWER + "\x3c/tpl\x3e\x3ctpl if\x3d\"shared \x3d\x3d true \x26\x26 shareLevel \x3d\x3d'EDIT_ALL_CONTENTS'\"\x3e" + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.EDITOR + "\x3c/tpl\x3e\x3ctpl if\x3d\"shared \x3d\x3d true \x26\x26 shareLevel \x3d\x3d 'MANAGE'\"\x3e" + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.MANAGER + '\x3c/tpl\x3e\x3c/a\x3e\x3ctpl if\x3d"isPortal !\x3d\x3d true"\x3e\x3cimg class\x3d"accessMenuArrowIcon permissionCell" src\x3d"/s.gif"\x3e\x3c/tpl\x3e';
            var b = '\x3ctd\x3e\x3ca href\x3d"javascript:void(null);"\x3e\x3cimg class\x3d"deleteCell" title\x3d"' + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.STOP_SHARING_HOVER_TEXT + '" alt\x3d"' + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.STOP_SHARING_HOVER_TEXT + '" src\x3d"/s.gif" id\x3d"deleteRow_{ugId}"\x3e\x3c/a\x3e\x3c/td\x3e',
                d = '\x3ctd class\x3d"shareLabelCell" id\x3d"shareButtonOrLabel_{ugId}"\x3e\x3ctpl switch\x3d"shareLevel"\x3e\x3ctpl case\x3d\'VIEW_\' case\x3d\'EDIT_ALL_CONTENTS\' case\x3d\'MANAGE\'\x3e\x3clabel class\x3d"addedText"\x3e' +
                Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.SHARED + '\x3c/label\x3e\x3c/tpl\x3e\x3ctpl default\x3e\x3cbutton class\x3d"addButton" id\x3d"addButton_{ugId}"\x3e' + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.SHARE + "\x3c/button\x3e\x3c/tpl\x3e\x3c/tpl\x3e\x3c/td\x3e";
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.DIALOG = new Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog;
            var e = '\x3cimg id\x3d"sharingPermissionsHelpIcon" class\x3d"infoIcon" title\x3d"" alt\x3d"" src\x3d"/s.gif" onmouseover\x3d"addMouseOver(getElementById(\'sharingHelpTextMouseOverOuter\'), this, \'left\')"  onfocus\x3d"addMouseOver(getElementById(\'sharingHelpTextMouseOverOuter\'), this, \'left\')"\x3e\x3cdiv id\x3d"sharingHelpTextMouseOverOuter" class\x3d"mouseOverInfoOuter"\x3e\x3cdiv class\x3d"mouseOverInfo" style\x3d"display: none;"\x3e' +Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.ACCESS_HOVER_TEXT + "\x3c/div\x3e\x3c/div\x3e";
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.viewSharingHeader = ['\x3ctable class\x3d"sharingViewTable"\x3e\x3ctr class\x3d"listHeader"\x3e\x3cth class\x3d"dataCell"\x3e\x3c/th\x3e\x3cth class\x3d"sharedWithLabel labelColor"\x3e\x3cspan id\x3d"allCount"\x3e\x3c/span\x3e\x3c/th\x3e\x3cth class\x3d"accessCell labelColor"\x3e', e, Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.ACCESS,'\x3c/th\x3e\x3cth class\x3d"dummyCell"/\x3e\x3c/tr\x3e\x3c/table\x3e'].join("");
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.VIEW_TEMPLATE = new Ext.XTemplate('\x3ctable class\x3d"sharingViewTable"\x3e', '\x3ctpl for\x3d"."\x3e', '\x3ctr class\x3d"baseRow added {cls}" \x3e', '\x3ctd class\x3d"dataCell"\x3e{shareId:"{shareId}", ugId:"{ugId}", groupType:"{groupType}", shareLevel:"{shareLevel}", shared:{shared}, isPortal:{isPortal}}\x3c/td\x3e', '\x3ctd class\x3d"shareNameCell"\x3e\x3cdiv\x3e\x3cdiv class\x3d"nameText" title\x3d"{ugTitle}"\x3e{ugName}\x3c/div\x3e\x3cdiv class\x3d"groupTypeText"\x3e{groupTitle}\x3c/div\x3e\x3c/div\x3e\x3c/td\x3e','\x3ctd class\x3d"permissionCell"\x3e' + a + "\x3c/td\x3e", b, "\x3c/tr\x3e", "\x3c/tpl\x3e", "\x3c/table\x3e");
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.VIEW_TEMPLATE.compile();
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.addSharingHeader = ['\x3ctable class\x3d"sharingViewTable"\x3e\x3ctr class\x3d"listHeader"\x3e\x3cth class\x3d"dataCell"\x3e\x3c/th\x3e\x3cth class\x3d"sharedWithLabel"\x3e\x3cdiv id\x3d"addTab" class\x3d"active"\x3e\x3c/div\x3e\x26nbsp;|\x26nbsp;\x3cdiv id\x3d"addedTab"\x3e',
                Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.SHARED, '\x26nbsp;(\x3cspan id\x3d"addedCount"\x3e0\x3c/span\x3e)\x3c/div\x3e\x3c/th\x3e\x3cth class\x3d"dummyCell"\x3e\x3c/th\x3e\x3cth class\x3d"accessCell labelColor"\x3e', e, Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.ACCESS, "\x3c/th\x3e\x3cth\x3e\x3c/th\x3e\x3c/tr\x3e\x3c/table\x3e"
            ].join("");
            a = new Ext.XTemplate('\x3ctable class\x3d"sharingViewTable"\x3e', '\x3ctpl for\x3d"."\x3e', '\x3ctr class\x3d"baseRow {[(values.shared \x3d\x3d\x3d true)? "added" : "notAdded"]} {cls}"\x3e',
                '\x3ctd class\x3d"dataCell"\x3e{shareId:"{shareId}", ugId:"{ugId}", groupType:"{groupType}", shareLevel:"{shareLevel}", shared:{shared}, isPortal:{isPortal}}\x3c/td\x3e', '\x3ctd class\x3d"shareNameCell"\x3e\x3cdiv title\x3d"{ugTitle}"\x3e{ugName}\x3c/div\x3e\x3c/td\x3e', d, '\x3ctd class\x3d"permissionCell"\x3e' + a + "\x3c/td\x3e", b, "\x3c/tr\x3e", "\x3c/tpl\x3e", '\x3ctr class\x3d"message fake" id\x3d"messageRow"\x3e', "\x3ctd colspan\x3d4\x3e" + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.SEARCH_MORE +
                "\x3c/td\x3e", "\x3c/tr\x3e", '\x3ctr class\x3d"message fake" id\x3d"noSearchResultsRow"\x3e', "\x3ctd colspan\x3d4\x3e" + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.NO_SEARCH_RESULTS + "\x3c/td\x3e", "\x3c/tr\x3e", '\x3ctr class\x3d"message fake" id\x3d"noResultsRow"\x3e', '\x3ctd colspan\x3d4\x3e\x3cspan id\x3d"noResultRowsMessageHolder"\x3e0\x3c/span\x3e\x3c/td\x3e', "\x3c/tr\x3e", "\x3c/table\x3e");
            a.compile();
            Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.dialogTemplate = a;
            Sfdc.analytics.home.EventManager.addListener("editSharingSettings", function (a) {
                //debugger;
                Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.DIALOG.showDialog(a)
            })
        }
    }
} ();
Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog = Ext.extend(Ext.util.Observable, {
    constructor: function () {
        Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events = {
            RESPONSE: "response",
            ERROR: "error"
        };
        this.addEvents(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE);
        this.serverProxy = Sfdc.analytics.home.ServerProxy;
        this.serverProxy.addListener(Sfdc.analytics.home.ServerProxy.Events.RESPONSE, function (a) {
            !0 === a.success ? (this.fireEvent(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE,
                a.result), Ext.getCmp("folderShareErrorMessageBoxContainer").hide(), this._setSharingSettingsStickyHeader()) : (Ext.isDefined(Ext.getCmp("folderShareErrorMessageBox")) && (Ext.getCmp("folderShareErrorMessageBox").setText(a.errorMessage), Ext.getCmp("folderShareErrorMessageBoxContainer").show(), this._setSharingSettingsStickyHeader()), this._hideMask(), this.fireEvent(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.ERROR, a.result));
            this.purgeListeners()
        }, this, {
            scope: this
        });
        var a = this._getNewWindowConfig();
        this.cancelButton = a.buttons[0];
        this.window = new Ext.Window(a);
        this.window.render(Ext.getBody());
        this.windowMask = new Ext.util.DelayedTask(function () {
            this.window.getEl().mask(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.LOADING)
        }, this);
        this.sharedCount = 0
    },
    showDialog: function (a) {
        this.folderId = a;
        this._showSharingSettingsDialog()
    },
    _showMask: function () {
        Ext.isDefined(this.window.getEl()) && this.windowMask.delay(500)
    },
    _hideMask: function () {
        Ext.isDefined(this.window.getEl()) && (this.windowMask.cancel(),
            this.window.getEl().unmask())
    },
    _setSharingSettingsStickyHeader: function () {
        var a = Ext.get("sharingView"),
            b = Ext.get("stickyHeader"),
            d = a.select("table.sharingViewTable").first(),
            e = b.select("table.sharingViewTable").first(),
            f = Ext.get("folderShareErrorMessageBoxContainer");
        b.position("relative");
        var g = 270;
        Ext.isIE7 && a.setHeight(g);
        var h = d.getBorderWidth("t") + d.getBorderWidth("l");
        e.setStyle("margin-bottom", (-1 * h).toString() + "px");
        f.isVisible() && (h = f.getMargins(), f = h.top + h.bottom + f.getHeight(), g -= f);
        a.setHeight(g -            b.getHeight());
        a = document.getElementById("sharingView");
        b.setWidth(a.clientWidth);
        b = d.select("td.shareNameCell").first();
        e.select("th.sharedWithLabel").first().setWidth(b.getWidth())
    },
    _showSharingSettingsDialog: function () {
        this.window.purgeListeners();
        this._showMask();
        this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE, function (a) {
            this.title = a.title;
            this._hideMask();
            this.canManage = a.canManage;
            this.sharedCount = a.sharedCount;
            var b = [],                d = [],                e = {},                f = {};
            this.MAX_SHOWN_CATS =3;
            for (var g = a.groups.length > this.MAX_SHOWN_CATS, h = "", c = 0; c < (!0 === g ? this.MAX_SHOWN_CATS : a.groups.length); c++) h = c + 1 < a.groups.length ? LC.getLabel("analyticsSharing", "lineWithComma", a.groups[c].label) : a.groups[c].label, b.push({
                xtype: "container",
                id: a.groups[c].groupTag + "Link",
                cls: "dialogLink",
                arg: a.groups[c].groupTag,
                label: a.groups[c].label,
                items: [{
                    html: '\x3ca href\x3d"javascript:void(null);"\x3e' + h + "\x3c/a\x3e"
                }]
            });
            if (!0 === g) {
                e = {
                    cls: "and",
                    html: '\x3ca href\x3d"javascript:void(null);"\x3e' + Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.AND + "\x3c/a\x3e"
                };
                for (f = a.groups.length - this.MAX_SHOWN_CATS; c < a.groups.length; c++) d.push({
                    xtype: "menuitem",
                    id: a.groups[c].groupTag + "Link",
                    handler: this._showAddShareDialogFromMenu.createDelegate(this, [a.groups[c].groupTag, a.groups[c].label], !0),
                    text: a.groups[c].label
                });
                f = {
                    id: "extraLinkMenu",
                    xtype: "button",
                    text: LC.getLabel("analyticsSharing", "x_more", f),
                    cls: "menuButton",
                    menuAlign: "tr-br?",
                    menu: {
                        cls: "extraCategoryMenu",
                        items: d,
                        id: "extraCategoryId"
                    }
                }
            }
            d = [{
                xtype: "container",
                cls: "shareWithOuter " + (!0 === this.canManage ? "manage" : "view"),
                items: [{
                    xtype: "container",
                    layout: "hbox",
                    height: 20,
                    hidden: !this.canManage,
                    cls: "shareWith",
                    items: [{
                        xtype: "container",
                        html: '\x3cimg class\x3d"shareWithIcon" src\x3d"/s.gif"\x3e'
                    }, {
                        xtype: "label",
                        text: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.SHARE_WITH + ": "
                    }, b, e, f]
                }, {
                    id: "stickyHeader",
                    xtype: "container",
                    html: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.viewSharingHeader
                }, {
                    xtype: "dataview",
                    tpl: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.VIEW_TEMPLATE,
                    itemSelector: "tr.baseRow",
                    style: "overflow-x: hidden; overflow-y: auto;",
                    overClass: "over",
                    store: this._getDataStoreWithData(a.shares),
                    id: "sharingView",
                    height: 270
                }]
            }];
            this._showWindow(d);
            this.window.setTitle(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.SHARING_SETTINGS + ": " + a.title);
            Ext.get("allCount").dom.innerHTML = LC.getLabel("analyticsSharing", "all", this.sharedCount);
            this.cancelButton.setText(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.CLOSE);
            this.cancelButton.handler = function () {    this.window.hide()   };
            this._setUpActionMenuOnPermissionCell({
                conditional: function (a, c) {
                    return Ext.isDefined(Ext.get(a.target).findParent(".permissionCell")) && this.canManage
                },
                callBackOnMenuChoose: function (a, c, b, g, h) {
                    var d = Ext.get(a.findParent("tr"));
                    a = this._getSharesFromRowElement(d, b.api);
                    this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.ERROR, function () {
                        d.query(".permissionCellText")[0].innerHTML = h
                    }, this, {
                        single: !0,
                        scope: this
                    });
                    this.serverProxy.commitShares(this.folderId,Sfdc.analytics.home.ServerProxy.COMMIT_ACTION.UPDATE, a)
                },
                onDelete: function (a, c) {
                    var b = Ext.get(Ext.get(c).findParent("tr")),g = this._getSharesFromRowElement(b, "VIEW_");
                    this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE, function () {
                        Ext.get(b).remove();
                        this.sharedCount--;
                        Ext.get("allCount").dom.innerHTML = LC.getLabel("analyticsSharing", "all", this.sharedCount)
                    }, this, {
                        single: !0,
                        scope: this
                    });
                    this.serverProxy.commitShares(this.folderId, Sfdc.analytics.home.ServerProxy.COMMIT_ACTION.REMOVE,  g)
                }
            }, this);
            !0 === this.canManage && Ext.each(b, function (a, c) {
                Ext.get(a.id).on("click", function () {
                    this._showAddShareDialog(a.arg, a.label)
                }, this, {
                    single: !0,
                    scope: this
                })
            }, this);
            this._setSharingSettingsStickyHeader()
        }, this, {
            single: !0,
            scope: this
        });
        this.serverProxy.getAllShared(this.folderId)
    },
    _showAddShareDialogFromMenu: function (a, b, d, e) {
        this._showAddShareDialog(d, e, !1)
    },
    _showAddShareDialog: function (a, b, d) {
        this._showMask();
        this.window.purgeListeners();
        this.window.setTitle(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.SHARE_WITH + " " + b + ": " + this.title);
        this.cancelButton.setText(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.DONE);
        this.cancelButton.handler = function () {
            this._showSharingSettingsDialog()
        };
        this.window.on("beforehide", function () {
            this._showSharingSettingsDialog();
            return !1
        }, this, {
            single: !0,
            scope: this
        });
        this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE, function (e) {
            this._hideMask();
            var f = this._getDataStoreWithData(e.shares);
            this.sharedCount = e.sharedCount;
            this._showWindow([{
                xtype: "container",
                cls: "manage",
                items: [{
                    xtype: "container",
                    items: [{
                        xtype: "container",
                        layout: "hbox",
                        height: 25,
                        cls: "sharingSearchBoxContainer",
                        id: "sharingSearchBoxContainer"
                    }, {
                        id: "stickyHeader",
                        xtype: "container",
                        html: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.addSharingHeader
                    }, {
                        xtype: "dataview",
                        tpl: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.dialogTemplate,
                        store: f,
                        id: "sharingView",
                        itemSelector: "tr.baseRow",
                        overClass: "over",
                        style: "overflow-x: hidden; overflow-y: auto;",
                        trackOver: !0,
                        height: 270,
                        listeners: {
                            afterrender: function (a) {
                                Ext.get("noResultsRow").hasClass("fake") || Ext.get("noResultsRow").addClass("fake");
                                1 === a.getStore().getCount() && Ext.isDefined(a.getStore().getById("fakeRow")) && Ext.get("noResultsRow").removeClass("fake")
                            },
                            aftersearch: function (a, b) {
                                Ext.get("noSearchResultsRow").hasClass("fake") || Ext.get("noSearchResultsRow").addClass("fake");
                                1 === a.getStore().getCount() && Ext.isDefined(a.getStore().getById("fakeRow")) && Ext.get("noSearchResultsRow").removeClass("fake");
                                !0 === b && Ext.get("messageRow").removeClass("fake")
                            }
                        }
                    }]
                }]
            }]);
            Ext.get("addTab").dom.innerHTML = b;
            Ext.get("addedCount").dom.innerHTML = this.sharedCount;
            Ext.get("noResultRowsMessageHolder").dom.innerHTML = Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.NO_RESULTS(b);
            this._activeOnAddedTab(d);
            0 < this.sharedCount && Ext.get("addedTab").addClass("active");
            !0 !== d && !0 === e.hasMore && Ext.get("messageRow").removeClass("fake");
            this._setUpActionMenuOnPermissionCell({
                conditional: function (a, b) {
                    return Ext.isDefined(Ext.get(a.target).findParent(".permissionCell")) &&
                        Ext.get(Ext.get(b).findParent("tr")).hasClass("added")
                },
                callBackOnMenuChoose: function (a, b, c, d, e) {
                    var f = Ext.get(a.findParent("tr"));
                    a = this._getSharesFromRowElement(f, c.api);
                    this._showMask();
                    this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.ERROR, function () {
                        f.query(".permissionCellText")[0].innerHTML = e
                    }, this, {
                        single: !0,
                        scope: this
                    });
                    this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE, function () {
                        this._hideMask()
                    }, this, {
                        single: !0,
                        scope: this
                    });
                    this.serverProxy.commitShares(this.folderId, Sfdc.analytics.home.ServerProxy.COMMIT_ACTION.UPDATE, a)
                },
                onDelete: function (a, b) {
                    var c = Ext.get(Ext.get(b).findParent("tr")),
                        d = this._getSharesFromRowElement(c, "VIEW_");
                    this._showMask();
                    this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE, function () {
                        this._hideMask();
                        Ext.get(c).removeClass("added");
                        Ext.get(c).addClass("notAdded");
                        c.query(".permissionCellText")[0].innerHTML = "";
                        this.sharedCount--;
                        Ext.get("addedCount").dom.innerHTML = this.sharedCount;
                        0 === this.sharedCount && Ext.get("addedTab").removeClass("active")
                    }, this, {
                        single: !0,
                        scope: this
                    });
                    this.serverProxy.commitShares(this.folderId, Sfdc.analytics.home.ServerProxy.COMMIT_ACTION.REMOVE, d)
                }
            });
            e = function (d, e) {
                "addedTab" == d.target.id && Ext.get(d.target).hasClass("active") && this._showAddShareDialog(a, b, !0);
                "addTab" == d.target.id && this._showAddShareDialog(a, b, !1);
                if ("addButton" == d.target.className) {
                    var c = Ext.get(Ext.get(e).findParent("tr")),f = this._getSharesFromRowElement(c,"VIEW_");
                    this._showMask();
                    this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE, function (a) {
                        this._hideMask();
                        c.query(".permissionCellText")[0].innerHTML = Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.VIEWER;
                        c.addClass("added");
                        c.removeClass("notAdded");
                        this._setSharesToRowElement(c, a.shares[0]);
                        this.sharedCount++;
                        1 === this.sharedCount && Ext.get("addedTab").addClass("active");
                        Ext.get("addedCount").dom.innerHTML = this.sharedCount
                    }, this, {
                        single: !0,
                        scope: this
                    });
                    this.serverProxy.commitShares(this.folderId, Sfdc.analytics.home.ServerProxy.COMMIT_ACTION.ADD, f)
                }
            };
            Ext.get("sharingView").on("click", e, this);
            Ext.get("stickyHeader").on("click", e, this);
            e = function (d) {
                this._showMask();
                Ext.get("searchBox").removeClass("done");
                this.addListener(Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettingsDialog.Events.RESPONSE, function (a) {
                    this._hideMask();
                    dataview = Ext.getCmp("sharingView");
                    dataview.tpl = Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.dialogTemplate;
                    dataview.itemSelector = "tr.baseRow";
                    dataview.bindStore(this._getDataStoreWithData(a.shares));
                    dataview.fireEvent("aftersearch", dataview, a.hasMore);
                    this.sharedCount = a.sharedCount;
                    Ext.get("addTab").dom.innerHTML = b;
                    Ext.get("addedCount").dom.innerHTML = this.sharedCount;
                    0 < this.sharedCount && Ext.get("addedTab").addClass("active");
                    this._activeOnAddedTab(!1);
                    Ext.get("searchBox").addClass("done")
                }, this, {
                    single: !0,
                    scope: this
                });
                this.serverProxy.getUnsharedPerGroupType(this.folderId, a, d)
            };
            this.searchBox = new Sfdc.html.QuickfindInput({
                id: "searchBox",
                renderTo: "sharingSearchBoxContainer",
                searchFunction: e,
                clearFunction: e.createDelegate(this, [""]),
                scope: this,
                disabled: 1 === f.getCount() && f.getById("fakeRow"),
                emptyText: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.DEFAULT_SEARCH_TEXT,
                buffer: 300
            });
            this.searchBox.on("keydown", function (a, b) {
                b.getCharCode() == b.ENTER && b.stopEvent()
            });
            this._setSharingSettingsStickyHeader()
        }, this, {
            single: !0,
            scope: this
        });
        !0 !== d ? this.serverProxy.getUnsharedPerGroupType(this.folderId, a, "") : this.serverProxy.getSharedPerGroupType(this.folderId,a, "")
    },
    _getSharesFromRowElement: function (a, b) {
        var d = Ext.util.JSON.decode(a.query("td.dataCell")[0].innerHTML);
        d.shareLevel = b;
        return [d]
    },
    _setSharesToRowElement: function (a, b) {
        a.query("td.dataCell")[0].innerHTML = Ext.util.JSON.encode(b)
    },
    _activeOnAddedTab: function (a) {
        !0 === a ? (Ext.get("addedTab").addClass("bolded"), Ext.get("addedTab").removeClass("normal"), Ext.get("addTab").removeClass("bolded"), Ext.get("addTab").addClass("normal")) : (Ext.get("addTab").addClass("bolded"), Ext.get("addTab").removeClass("normal"),
            Ext.get("addedTab").addClass("normal"), Ext.get("addedTab").removeClass("bolded"))
    },
    _setUpActionMenuOnPermissionCell: function (a) {
        var b = a.conditional,
            d = a.callBackOnMenuChoose,
            e = a.onDelete;
        Ext.getBody().on("click", function (a, b) {
            Ext.isDefined(this.accessMenu) && this.accessMenu.isVisible() && null === Ext.get(b).findParent(".permissionCell") && null === Ext.get(b).findParent(".permissionMenu") && this.accessMenu.hide()
        }, this);
        Ext.get("sharingView").on("click", function (a, g) {
            if ("deleteCell" === a.target.className) return e.call(this, a, g), !1;
            var h = Ext.get(g);
            Ext.isDefined(this.accessMenu) && this.accessMenu.isVisible() && null === h.findParent("div.actionMenu") && this.accessMenu.hide();
            if (b.call(this, a, g)) {
                var c = h.findParent("tr.baseRow", 3);
                if (null !== c && (c = Ext.get(c), null !== c && !0 === Ext.util.JSON.decode(c.query("td.dataCell")[0].innerHTML).isPortal)) return !1;
                Ext.isDefined(this.accessMenu) || (this.accessMenu = new Ext.menu.Menu({
                    shadow: !1,
                    id: "permissionMenuId",
                    cls: "actionMenu permissionMenu",
                    items: [{
                        api: "VIEW_",
                        text: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.VIEWER
                    }, {
                        api: "EDIT_ALL_CONTENTS",
                        text: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.EDITOR
                    }, {
                        api: "MANAGE",
                        text: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.MANAGER
                    }],
                    setSelectedItem: function (a) {
                        for (i = 0; i < this.items.length; i++) this.items.get(i).text == a ? this.items.get(i).addClass("selectedActionMenuItem") : this.items.get(i).removeClass("selectedActionMenuItem")
                    }
                }, this), this.accessMenu.render(Ext.getBody()));
                c = h.findParent("td.permissionCell");
                if (c = Ext.get(c)) {
                    var k = Ext.get(c.query(".permissionCellText")[0]);
                    this.accessMenu.purgeListeners();
                    this.accessMenu.setSelectedItem(k.dom.innerHTML);
                    this.accessMenu.el.setXY([k.getX() - 8, k.getY() + 16]);
                    this.accessMenu.el.show();
                    this.accessMenu.on("click", function (a, b, c) {
                        if (k.dom.innerHTML != b.text) {
                            var e = k.dom.innerHTML;
                            k.dom.innerHTML = b.text;
                            Ext.isDefined(d) && d.call(this, h, a, b, c, e)
                        }
                    }, this)
                }
            }
        }, this)
    },
    _getDataStoreWithData: function (a) {
        var b = new Ext.data.JsonReader({
            root: "records",
            fields: "groupType photoElement shareId shareLevel ugId ugName groupTitle cls shared isPortal ugTitle".split(" ") }),
            b = new Ext.data.Store({
                reader: b
            });
        0 === a.length && a.push({
            cls: "fake",
            id: "fakeRow",
            shared: !1,
            isPortal: !1
        });
        b.loadData({
            records: a
        });
        return b
    },
    _showWindow: function (a) {
        a.splice(0, 0, {
            xtype: "container",
            layout: "fit",
            boxMaxHeight: 30,
            boxMaxWidth: 500,
            id: "folderShareErrorMessageBoxContainer",
            cls: "message",
            hidden: !0,
            items: [{
                xtype: "label",
                id: "folderShareErrorMessageBox"
            }]
        });
        this.window.removeAll();
        this.window.add(a);
        this.window.doLayout();
        this.window.show()
    },
    _getNewWindowConfig: function () {
        cancelButton = new Ext.Button({
            name: "cancel",
            text: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.LABELS.CLOSE,
            id: "CancelButton",
            scope: this
        });
        var a = {
            layout: "fit",
            plain: !0,
            resizable: !1,
            width: 600,
            height: 400,
            pageX: 0.2 * Ext.getBody().getViewSize().width,
            pageY: 0.2 * Ext.getBody().getViewSize().height,
            modal: !0,
            buttons: [cancelButton],
            buttonAlign: "center",
            autoHeight: !1,
            constrain: !0,
            draggable: !1,
            header: !0,
            closable: !0,
            shadow: !1,
            id: "sharingWindow",
            closeAction: "hide",
            bwrapStyle: "overflow: visible",
            items: [{
                xtype: "label",
                text: "Loading..."
            }]
        },
            b = LC.getLabel("Buttons","page_help"),
            d = b + " " + LC.getLabel("Global", "new_window");
        a.toolTemplate = new Ext.XTemplate("\x3ctpl if\x3d\"id\x3d\x3d'dialogHelp'\"\x3e", '\x3ca href\x3d"javascript:void(null)" onclick\x3d"{href}" class\x3d"helpLink" title\x3d"' + d + '"\x3e\x3cdiv style\x3d"display:inline;" class\x3d"dialogHelpText"\x3e' + b + "\x3c/div\x3e", '\x3cimg class\x3d"helpIcon" src\x3d"/s.gif"/\x3e\x3c/a\x3e', "\x3c/tpl\x3e", "\x3ctpl if\x3d\"id!\x3d\x3d'dialogHelp'\"\x3e", '\x3cdiv class\x3d"x-tool x-tool-{id}"\x3e\x26#160;\x3c/div\x3e',"\x3c/tpl\x3e");
        a.tools = [];
        a.tools.push({
            id: "dialogHelp",
            href: Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.DIALOG_HELP_URL
        });
        return a
    }
});
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.AnalyticsFilterDashboardDelegate=Ext.extend(Sfdc.analytics.home.AnalyticsFilterDelegate,{constructor:function(){Sfdc.analytics.home.AnalyticsFilterDashboardDelegate.superclass.constructor.call(this,Sfdc.analytics.home.AnalyticsFilterDashboardDelegate.ENTITY_TYPE)},getEntityNameLabel:function(){return LC.getLabel("udd_Dashboard","Entity")},getEntityIconCls:function(){return"dashboardIcon"}});
Sfdc.analytics.home.AnalyticsFilterDashboardDelegate.ENTITY_TYPE="01Z";Sfdc.analytics.home.AnalyticsFilterDelegateRegistry.register(Sfdc.analytics.home.AnalyticsFilterDashboardDelegate.ENTITY_TYPE,new Sfdc.analytics.home.AnalyticsFilterDashboardDelegate);
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.AnalyticsFilterReportDelegate = Ext.extend(Sfdc.analytics.home.AnalyticsFilterDelegate, { constructor: function () { Sfdc.analytics.home.AnalyticsFilterReportDelegate.superclass.constructor.call(this, Sfdc.analytics.home.AnalyticsFilterReportDelegate.ENTITY_TYPE) }, getEntityNameLabel: function () { return LC.getLabel("udd_Report", "Entity") }, getEntityIconCls: function () { return "reportIcon" } });
Sfdc.analytics.home.AnalyticsFilterReportDelegate.ENTITY_TYPE="00O";
Sfdc.analytics.home.AnalyticsFilterDelegateRegistry.register(Sfdc.analytics.home.AnalyticsFilterReportDelegate.ENTITY_TYPE,new Sfdc.analytics.home.AnalyticsFilterReportDelegate);
Ext.namespace("Sfdc.analytics.home.AnalyticsHome");
Sfdc.analytics.home.AnalyticsHome.init = function (b, c, d) {
    Ext.getBody().child(".bPageTitle .content").insertSibling(Ext.getBody().child(".addNewButtons"), "after");
    var e = function (a) {
        Ext.getBody().child(".homeContent span.listViewTitle").update(escapeHTML(a))
    };
    Sfdc.analytics.home.EventManager.addListener("folderTreeLoaded", function (a) {
        //debugger;
        a = a.getSelectionModel().getSelectedNode().origText;
        e(a)
    }, this, {
        scope: this,
        single: !0
    });
    Sfdc.analytics.home.EventManager.addListener("switchFolder", function (a, b, c, d) {
        e(d)
    });
    Sfdc.userAgent.isIE7 || (Sfdc.History.onChange(function (a) {
        if (!window.history || !window.history.pushState) Sfdc.analytics.home.AnalyticsHome.HASH_STATE = a
    }), Sfdc.History.init({
        usePushState: !0
    }));
    Sfdc.analytics.home.AnalyticsHome.USER_PERMS = c;
    Sfdc.analytics.home.AnalyticsHome.HAS_ENHANCED_SHARING = b;
    Sfdc.analytics.home.AnalyticsHome.ENHANCED_SHARING_DIALOG_HELP_URL = d
};
Sfdc.analytics.home.AnalyticsHome.HASH_STATE = null;
Sfdc.analytics.home.AnalyticsHome.initGuidedTour = function (b, c) {
    b || (Sfdc.analytics.home.AnalyticsHome.GUIDED_TOUR = Sfdc.analytics.home.getGuidedTour(c))
};
Sfdc.analytics.home.AnalyticsHome.startGuidedTour = function () {
    var b = Sfdc.analytics.home.AnalyticsHome.GUIDED_TOUR;
    b && (UserContext.userPreferences.getBoolean("HideAnalyticsHomeGuidedTour") || b.start())
};
Sfdc.analytics.home.AnalyticsHome.initAfterPageLoad = function () {
    Ext.onReady(function () {
        Ext.getBody().addClass("x-theme-aloha-esque");
        Sfdc.analytics.home.AnalyticsHome.startGuidedTour();
        Sfdc.analytics.home.AnalyticsHome.HAS_ENHANCED_SHARING && Sfdc.analytics.home.sharing.AnalyticsFolderSharingSettings.init(Sfdc.analytics.home.AnalyticsHome.ENHANCED_SHARING_DIALOG_HELP_URL)
    })
};
Sfdc.analytics.home.AnalyticsHome.GUIDED_TOUR = null;
Sfdc.analytics.home.AnalyticsHome.BOTTOM_BUFFER_SIZE = 75;
Ext.namespace("Sfdc.analytics.home");
Sfdc.analytics.home.HomePanel = Ext.extend(Ext.Container, {
    layout: "border",
    height: "100%",
    width: "100%",
    hideBorders: !0,
    cls: "homePanel",
    constructor: function (a) {
        this.elem = Sfdc.get(a.elementName);
        this.items = [{
            id: "sidebarCmp",
            contentEl: a.sidebarElem,
            region: "west",
            split: !0,
            collapsible: !0,
            collapseMode: "mini",
            animCollapse: !1,
            hideCollapseTool: !0,
            width: 240,
            maxSize: 500
        }, {
            contentEl: a.listviewElem,
            region: "center"
        }];
        Sfdc.analytics.home.HomePanel.superclass.constructor.call(this, a)
    },
    afterRender: function () {
        Sfdc.analytics.home.HomePanel.superclass.afterRender.apply(this, arguments);
        this.fitSize = function () {
            var a = Sfdc.Dom.getElementXY(this.elem),
                a = Sfdc.Dom.getHeight(document.documentElement) - a.y - Sfdc.analytics.home.AnalyticsHome.BOTTOM_BUFFER_SIZE + 1 + "px";
            Sfdc.Dom.setStyle(this.elem, "height", a);
            Sfdc.analytics.home.AnalyticsHome.LV.isInitialized() ? this.doLayout() : Sfdc.analytics.home.EventManager.addListener("listViewInitialized", function () {
                this.doLayout()
            }, this)
        };
        Ext.EventManager.onWindowResize(this.fitSize, this);
        var a = Ext.getCmp("sidebarCmp");
        a.on("resize", function (a,b, c, d, e) {
            this.layout.runLayout();
            (a = Ext.getCmp("folderTreePanel")) && a.layout.runLayout()
        });
        a.on("afterlayout", function (a) {
            Sfdc.analytics.home.AnalyticsHome.LV.wrapper && Sfdc.analytics.home.AnalyticsHome.LV.resize()
        });
        a.on("collapse", function (a) {
            Sfdc.analytics.home.AnalyticsHome.LV.resize()
        });
        var b = Sfdc.get("sidebarCmp-xsplit"),
            a = Sfdc.get(".x-splitbar-proxy"),
            c = !1,
            d = !1,
            e = !1,
            f = function () {
                Sfdc.Dom.setStyle(b, "opacity", 0);
                Sfdc.Dom.setStyle(b, "filter", "progid:DXImageTransform.Microsoft.Alpha(Opacity\x3d0)")
            },
            g = function () {
                Sfdc.Dom.setStyle(b, "opacity", 1);
                Sfdc.Dom.setStyle(b, "filter", "progid:DXImageTransform.Microsoft.Alpha(Opacity\x3d100)")
            };
        f();
        Sfdc.on(b, "mouseover", function () {
            d = !0;
            g()
        });
        Sfdc.on(b, "mouseout", function () {
            d = !1;
            c || f()
        });
        Sfdc.on(b, "mousedown", function () {
            c = !0
        });
        Sfdc.on(a, "mouseover", function () {
            e = !0;
            g()
        });
        Sfdc.on(a, "mouseout", function () {
            e = !1
        });
        Sfdc.on(document, "mouseup", function (a) {
            c = !1;
            !d && !e && f()
        })
    }
});
Ext.reg("homepanel", Sfdc.analytics.home.HomePanel);
//# sourceMappingURL=/javascript/1414614437000/sfdc/source/AnalyticsHome.js.map
