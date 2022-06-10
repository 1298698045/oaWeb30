﻿/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Ext.namespace("Sfdc", "Sfdc.reportbuilder");
Sfdc.reportbuilder.ColumnMenu = function (a) {
    this.initView(a)
};
Sfdc.reportbuilder.ColumnMenu.prototype = {
    initView: function (a) {
        this.triggerBaseCls = a && a.triggerBaseCls ? a.triggerBaseCls : "header-menu-trigger";
        this.triggerOverCls = a && a.triggerOverCls ? a.triggerOverCls : "header-menu-trigger-over";
        this.overTrigger = this.triggerVisible = !1;
        this.curAnchorDom = null;
        this.trigger = Ext.getBody().createChild({
            tag: "div",
            cls: this.triggerBaseCls
        });
        this.trigger.setStyle("position", "absolute");
        this.triggerWidth = this.trigger.getWidth();
        this.trigger.on({
            mouseover: this.onTriggerOver,
            mouseout: this.onTriggerOut,
            click: this.onTriggerClick,
            scope: this
        });
        this.menuVisible = !1;
        this.menu = new Ext.menu.Menu({
            id: "columnMenu",
            items: a.items
        });
        this.menu.on({
            hide: this.onMenuHide,
            scope: this
        })
    },
    getMenuItemById: function (a) {
        return this.menu.getComponent(a)
    },
    onMenuHide: function () {
        this.menuVisible = !1
    },
    isMenuVisible: function () {
        return this.menuVisible
    },
    onTriggerClick: function () {
        this.menuVisible || (this.menuVisible = !0, this.menu.show(this.trigger, "bl"))
    },
    onTriggerOver: function () {
        this.overTrigger = !0;
        this.trigger.addClass(this.triggerOverCls)
    },
    onTriggerOut: function () {
        this.overTrigger = !1;
        this.trigger.removeClass(this.triggerOverCls)
    },
    positionTrigger: function (a) {
        this.trigger.setXY([a.getRight() - this.triggerWidth, a.getTop() + 1]);
        this.trigger.setHeight(a.getHeight() - 2)
    },
    showTrigger: function (a) {
        if (!this.menuVisible) {
            if (null === this.curAnchorDom || this.curAnchorDom !== a.dom) this.curAnchorDom = a.dom, this.positionTrigger(a);
            this.triggerVisible = !0;
            this.trigger.show();
            return !0
        }
        return !1
    },
    hideTrigger: function (a) {
        if (a || !this.overTrigger && !this.menuVisible) this.triggerVisible = !1, this.trigger.hide()
    },
    isTriggerVisible: function () {
        return this.triggerVisible
    },
    destroy: function () {
        this.trigger.removeAllListeners();
        Ext.destroy(this.trigger);
        this.menu.destroy()
    }
};
Ext.namespace("Sfdc", "Sfdc.reportbuilder");
Sfdc.reportbuilder.ElementEventType = {
    MOUSE_DOWN: "mousedown",
    MOUSE_UP: "mouseup",
    MOUSE_OVER: "mouseover",
    MOUSE_OUT: "mouseout",
    CLICK: "click",
    KEY_DOWN: "keydown",
    KEY_UP: "keyup",
    KEY_PRESS: "keypress",
    FOCUS: "focus",
    BLUR: "blur"
};
Ext.namespace("Sfdc", "Sfdc.reportbuilder");
Sfdc.reportbuilder.ExtendedMask = Ext.extend(Ext.LoadMask, {
    visible: !1,
    show: function () {
        Sfdc.reportbuilder.ExtendedMask.superclass.show.call(this);
        this.visible = !0
    },
    hide: function () {
        Sfdc.reportbuilder.ExtendedMask.superclass.hide.call(this);
        this.visible = !1
    },
    isVisible: function () {
        return this.visible
    }
});
Ext.namespace("Sfdc", "Sfdc.reportbuilder");
Sfdc.reportbuilder.InlineTextField = function (a) {
    this.init(a)
};
Sfdc.reportbuilder.InlineTextField.prototype = {
    init: function (a) {
        this.callbackScope = a.scope;
        this.canEdit = a.canEdit;
        this.validate = a.validate;
        this.blur = a.blur;
        this.inputClass = a.inputClass;
        this.inputErrorClass = a.inputErrorClass;
        this.inputErrorMsgClass = a.inputErrorMsgClass;
        this.maxInputLength = a.maxInputLength;
        this.editing = !1;
        this.errorMsgEl = this.inputEl = this.repositionTimer = null;
        this.divEl = Ext.get(a.div);
        this.divEl.on({
            click: this.onDivClick,
            scope: this
        })
    },
    isEditing: function () {
        return this.editing
    },
    hasError: function () {
        return null !==
            this.errorMsgEl
    },
    onDivClick: function (a, b) {
        if (!this.editing) {
            var c = !0;
            this.canEdit && (c = this.callbackScope ? this.canEdit.call(this.callbackScope, this.divEl) : this.canEdit(value));
            c && (c = Ext.util.Format.htmlDecode(this.divEl.dom.textContent || this.divEl.dom.innerText), this.divEl.update(""), this.inputEl = this.divEl.createChild({
                tag: "input",
                type: "text",
                maxlength: this.maxInputLength,
                cls: this.inputClass
            }), this.inputEl.dom.value = c, this.inputEl.setWidth(this.divEl.getWidth(!0)), this.inputEl.on({
                blur: this.onInputBlur,
                keyup: this.onInputKeyUp,
                scope: this
            }), this.inputEl.focus(), this.editing = !0)
        }
    },
    onInputBlur: function (a) {
        this.blurInput()
    },
    onInputKeyUp: function (a) {
        a.getKey() === Ext.EventObject.ENTER ? this.blurInput() : this.validateValue()
    },
    validateValue: function () {
        var a = this.inputEl.getValue().trim(),
            b = !0;
        this.validate && (b = this.callbackScope ? this.validate.call(this.callbackScope, a, this.divEl) : this.validate(a));
        if (!0 === b) return this.errorMsgEl && (Ext.destroy(this.errorMsgEl), this.errorMsgEl = null), this.repositionTimer && (clearTimeout(this.repositionTimer),
            this.repositionTimer = null), !0;
        this.inputEl.addClass(this.inputErrorClass);
        this.errorMsgEl ? this.errorMsgEl.update(b) : (this.errorMsgEl = Ext.getBody().createChild({
            tag: "div",
            cls: this.inputErrorMsgClass,
            html: b
        }), this.repositionErrorMessage());
        return !1
    },
    blurInput: function () {
        if (this.validateValue()) {
            var a = this.inputEl.getValue().trim();
            this.inputEl.removeAllListeners();
            Ext.destroy(this.inputEl);
            this.inputEl = null;
            this.divEl.update(Ext.util.Format.htmlEncode(a));
            this.editing = !1;
            this.blur && (result = this.callbackScope ?
                this.blur.call(this.callbackScope, a, this.divEl) : this.blur(a, this.divEl))
        }
    },
    repositionErrorMessage: function () {
        if (this.errorMsgEl) {
            this.errorMsgEl.anchorTo(this.inputEl, "bl");
            var a = this;
            this.repositionTimer = setTimeout(function () {
                a.repositionErrorMessage()
            }, 100)
        } else clearTimeout(this.repositionTimer), this.repositionTimer = null
    },
    destroy: function () {
        this.inputEl && (this.inputEl.removeAllListeners(), Ext.destroy(this.inputEl));
        this.divEl && (this.divEl.removeAllListeners(), Ext.destroy(this.divEl));
        this.errorMsgEl &&
            Ext.destroy(this.errorMsgEl);
        this.repositionTimer && clearTimeout(this.repositionTimer)
    }
};
Ext.namespace("Sfdc", "Sfdc.reportbuilder");
Sfdc.reportbuilder.RBColumnHeaderGroup = Ext.extend(Ext.util.Observable, {
    constructor: function (a) {
        this.config = a
    },
    init: function (a) {
        Ext.applyIf(a.colModel, this.config);
        Ext.apply(a.getView(), this.viewConfig)
    },
    viewConfig: {
        initTemplates: function () {
            this.constructor.prototype.initTemplates.apply(this, arguments);
            var a = this.templates || {};
            a.gcell || (a.gcell = new Ext.XTemplate('\x3ctd id\x3d"colHeader-{id}" colspan\x3d"{colspan}" class\x3d"x-grid3-hd x-grid3-gcell x-grid3-td-{id} ux-grid-hd-group-row-{row} {cls}" style\x3d"{style}"\x3e', '\x3cdiv {tooltip} class\x3d"x-grid3-hd-inner x-grid3-hd-{id}" unselectable\x3d"on" style\x3d"{istyle}"\x3e',
                this.grid.enableHdMenu ? '\x3ca class\x3d"x-grid3-hd-btn" href\x3d"#"\x3e\x3c/a\x3e' : "", "{value}\x3c/div\x3e\x3c/td\x3e"));
            this.templates = a;
            this.hrowRe = /ux-grid-hd-group-row-(\d+)/
        },
        renderHeaders: function () {
            for (var a = this.constructor.prototype.renderHeaders.apply(this, arguments), b = this.templates, c = [], e = this.cm, d = e.rows, g = "width:" + this.getTotalWidth() + ";", f = 0, l = d.length; f < l; f++) {
                for (var q = d[f], n = [], p = 0, m = 0, k = q.length; p < k; p++) {
                    var h = q[p];
                    h.colspan = h.colspan || 1;
                    var s = this.getColumnId(h.dataIndex ? e.findColumnIndex(h.dataIndex) :
                            m),
                        r = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getGroupStyle.call(this, h, m);
                    n[p] = b.gcell.apply({
                        cls: "ux-grid-hd-group-cell",
                        id: s,
                        row: f,
                        colspan: 1,
                        style: "width:" + r.width + ";" + (r.hidden ? "display:none;" : "") + (h.align ? "text-align:" + h.align + ";" : ""),
                        tooltip: h.tooltip ? (Ext.QuickTips.isEnabled() ? "ext:qtip" : "title") + '\x3d"' + h.tooltip + '"' : "",
                        istyle: "right" == h.align ? "padding-right:16px" : "",
                        btn: this.grid.enableHdMenu && h.header,
                        value: h.header || "\x26nbsp;"
                    });
                    m += h.colspan
                }
                c[f] = b.header.apply({
                    tstyle: g,
                    cells: n.join("")
                })
            }
            c.push(a);
            return c.join("")
        },
        onColumnWidthUpdated: function () {
            this.constructor.prototype.onColumnWidthUpdated.apply(this, arguments);
            Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.updateGroupStyles.call(this)
        },
        onAllColumnWidthsUpdated: function () {
            this.constructor.prototype.onAllColumnWidthsUpdated.apply(this, arguments);
            Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.updateGroupStyles.call(this)
        },
        onColumnHiddenUpdated: function () {
            this.constructor.prototype.onColumnHiddenUpdated.apply(this, arguments);
            Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.updateGroupStyles.call(this)
        },
        getHeaderCell: function (a) {
            return this.mainHd.query(this.cellSelector)[a]
        },
        getBaseHeaderCell: function (a) {
            return this.mainHd.query("td.x-grid3-gcell")[a]
        },
        findHeaderCell: function (a) {
            return a ? this.fly(a).findParent("td.x-grid3-hd", this.cellSelectorDepth) : !1
        },
        findHeaderIndex: function (a) {
            return (a = this.findHeaderCell(a)) ? this.getCellIndex(a) : !1
        },
        findCell: function (a) {
            if (!a) return !1;
            var b = this.fly(a).findParent(this.cellSelector, this.cellSelectorDepth);
            b || (b = this.fly(a).findParent("td.x-grid3-gcell", this.cellSelectorDepth));
            return b
        },
        handleHdMove: function (a, b) {
            var c = this.findHeaderCell(this.activeHdRef);
            if (c && !this.headersDisabled && !Ext.fly(c).hasClass("ux-grid-hd-group-cell")) {
                var e = this.splitHandleWidth || 5,
                    d = this.activeHdRegion,
                    g = a.getPageX(),
                    c = c.style,
                    f = "";
                if (!1 !== this.grid.enableColumnResize)
                    if (g - d.left <= e && this.cm.isResizable(this.activeHdIndex - 1)) f = Ext.isAir ? "move" : Ext.isWebKit ? "e-resize" : "col-resize";
                    else if (d.right - g <= (!this.activeHdBtn ? e : 2) && this.cm.isResizable(this.activeHdIndex)) f = Ext.isAir ? "move" : Ext.isWebKit ?
                    "w-resize" : "col-resize";
                c.cursor = f
            }
        },
        handleHdOut: function (a, b) {
            var c = this.findHeaderCell(b);
            if (c && (!Ext.isIE || !a.within(c, !0))) this.activeHdRef = null, this.fly(c).removeClass("x-grid3-hd-over"), c.style.cursor = ""
        },
        beforeColMenuShow: function () {
            var a = this.cm,
                b = this.cm.rows;
            this.colMenu.removeAll();
            for (var c = 0, e = a.getColumnCount() ; c < e; c++) {
                var d = this.colMenu,
                    g = a.getColumnHeader(c),
                    f = [];
                if (!0 !== a.config[c].fixed && !1 !== a.config[c].hideable) {
                    for (var l = 0, q = b.length; l < q; l++) {
                        for (var n = b[l], p, m = 0, k = 0, h = n.length; k <
                            h; k++) {
                            p = n[k];
                            if (c >= m && c < m + p.colspan) break;
                            m += p.colspan
                        }
                        if (p && p.header)
                            if (a.hierarchicalColMenu) {
                                n = "group-" + l + "-" + m;
                                k = (k = d.items ? d.getComponent(n) : null) ? k.menu : null;
                                if (!k) {
                                    k = new Ext.menu.Menu({
                                        itemId: n
                                    });
                                    k.on("itemclick", this.handleHdMenuClick, this);
                                    for (var h = !1, s = !0, r = m, m = m + p.colspan; r < m; r++) a.isHidden(r) || (h = !0), !1 !== a.config[r].hideable && (s = !1);
                                    d.add({
                                        itemId: n,
                                        text: p.header,
                                        menu: k,
                                        hideOnClick: !1,
                                        checked: h,
                                        disabled: s
                                    })
                                }
                                d = k
                            } else f.push(p.header)
                    }
                    f.push(g);
                    d.add(new Ext.menu.CheckItem({
                        itemId: "col-" +
                            a.getColumnId(c),
                        text: f.join(" "),
                        checked: !a.isHidden(c),
                        hideOnClick: !1,
                        disabled: !1 === a.config[c].hideable
                    }))
                }
            }
        },
        afterRenderUI: function () {
            this.constructor.prototype.afterRenderUI.apply(this, arguments);
            Ext.apply(this.columnDrop, Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.columnDropConfig);
            Ext.apply(this.splitZone, Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.splitZoneConfig)
        }
    },
    splitZoneConfig: {
        allowHeaderDrag: function (a) {
            return !a.getTarget(null, null, !0).hasClass("ux-grid-hd-group-cell")
        }
    },
    columnDropConfig: {
        getTargetFromEvent: function (a) {
            a = Ext.lib.Event.getTarget(a);
            return this.view.findHeaderCell(a)
        },
        positionIndicator: function (a, b, c) {
            a = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getDragDropData.call(this, a, b, c);
            if (!1 === a) return !1;
            b = a.px + this.proxyOffsets[0];
            this.proxyTop.setLeftTop(b, a.r.top + this.proxyOffsets[1]);
            this.proxyTop.show();
            this.proxyBottom.setLeftTop(b, a.r.bottom);
            this.proxyBottom.show();
            return a.pt
        },
        onNodeDrop: function (a, b, c, e) {
            b = e.header;
            if (b != a) {
                a = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getDragDropData.call(this,
                    b, a, c);
                if (!1 === a) return !1;
                c = this.grid.colModel;
                b = a.oldIndex < a.newIndex;
                e = c.rows;
                for (var d = a.row, g = e.length; d < g; d++) {
                    for (var f = e[d], l = f.length, q = 0, n = 1, p = l, m = 0, k = 0; m < l; m++) {
                        var h = f[m];
                        a.oldIndex >= k && a.oldIndex < k + h.colspan && (q = m);
                        a.oldIndex + a.colspan - 1 >= k && a.oldIndex + a.colspan - 1 < k + h.colspan && (n = m - q + 1);
                        a.newIndex >= k && a.newIndex < k + h.colspan && (p = m);
                        k += h.colspan
                    }
                    l = f.splice(q, n);
                    e[d] = f.splice(0, p - (b ? n : 0)).concat(l).concat(f)
                }
                for (e = 0; e < a.colspan; e++) d = a.oldIndex + (b ? 0 : e), g = a.newIndex + (b ? -1 : e), c.moveColumn(d,
                    g), this.grid.fireEvent("columnmove", d, g);
                return !0
            }
            return !1
        }
    },
    getGroupStyle: function (a, b) {
        for (var c = 0, e = !0, d = b, g = b + a.colspan; d < g; d++) this.cm.isHidden(d) || (e = this.cm.getColumnWidth(d), "number" == typeof e && (c += e), e = !1);
        return {
            width: (Ext.isBorderBox || Ext.isWebKit && !Ext.isSafari2 ? c : Math.max(c - this.borderWidth, 0)) + "px",
            hidden: e
        }
    },
    updateGroupStyles: function (a) {
        for (var b = this.mainHd.query(".x-grid3-header-offset \x3e table"), c = this.getTotalWidth(), e = this.cm.rows, d = 0; d < b.length; d++)
            if (b[d].style.width = c, d <
                e.length)
                for (var g = b[d].firstChild.firstChild.childNodes, f = 0, l = 0; f < g.length; f++) {
                    var q = e[d][f];
                    if ("number" != typeof a || a >= l && a < l + q.colspan) {
                        var n = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getGroupStyle.call(this, q, l);
                        g[f].style.width = n.width;
                        g[f].style.display = n.hidden ? "none" : ""
                    }
                    l += q.colspan
                }
    },
    getGroupRowIndex: function (a) {
        return a && (a = a.className.match(this.hrowRe)) && a[1] ? parseInt(a[1], 10) : this.cm.rows.length
    },
    getGroupSpan: function (a, b) {
        if (0 > a) return {
            col: 0,
            colspan: this.cm.getColumnCount()
        };
        var c = this.cm.rows[a];
        if (c) {
            for (var e = 0, d = 0, g = c.length; e < g; e++) {
                var f = c[e];
                if (b >= d && b < d + f.colspan) return {
                    col: d,
                    colspan: f.colspan
                };
                d += f.colspan
            }
            return {
                col: d,
                colspan: 0
            }
        }
        return {
            col: b,
            colspan: 1
        }
    },
    getDragDropData: function (a, b, c) {
        if (a.parentNode != b.parentNode) return !1;
        var e = this.grid.colModel,
            d = Ext.lib.Event.getPageX(c);
        c = Ext.lib.Dom.getRegion(b.firstChild);
        var g;
        c.right - d <= (c.right - c.left) / 2 ? (d = c.right + this.view.borderWidth, g = "after") : (d = c.left, g = "before");
        var f = this.view.getCellIndex(a);
        b = this.view.getCellIndex(b);
        if (e.isFixed(b)) return !1;
        a = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getGroupRowIndex.call(this.view, a);
        e = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getGroupSpan.call(this.view, a, f);
        b = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getGroupSpan.call(this.view, a, b);
        f = e.col;
        b = b.col + ("after" == g ? b.colspan : 0);
        if (b >= e.col && b <= e.col + e.colspan) return !1;
        var l = Sfdc.reportbuilder.RBColumnHeaderGroup.prototype.getGroupSpan.call(this.view, a - 1, f);
        return b < l.col || b > l.col + l.colspan ? !1 : {
            r: c,
            px: d,
            pt: g,
            row: a,
            oldIndex: f,
            newIndex: b,
            colspan: e.colspan
        }
    }
});
Ext.namespace("Sfdc.reportbuilder.visibility");
Sfdc.reportbuilder.visibility.ServerProxy = function () {
    Def = Ext.extend(Ext.util.Observable, {
        constructor: function () {
            Def.superclass.constructor.apply(this)
        },
        Events: {
            RESPONSE: "response"
        },
        setInput: function (a) {
            this.input = a
        },
        init: function () {
            this.addEvents(this.Events.RESPONSE)
        },
        setReportTypeVisibility: function (a, b) {
            Ext.get(this.input).dom.value = Ext.util.JSON.encode({
                templateKey: a,
                hidden: b
            });
            setReportTypeVisibility()
        },
        onComplete: function (a) {
            this.fireEvent(Sfdc.reportbuilder.visibility.ServerProxy.Events.RESPONSE, a)
        }
    });
    ret = new Def;
    ret.init();
    return ret
}();
Ext.ns("Sfdc.reportbuilder");
Sfdc.reportbuilder.ReportTypePanel = Ext.extend(Ext.Panel, {
    constructor: function (a) {
        var b = new Sfdc.html.QuickfindInput({
            id: "quickFindInput",
            searchFunction: this.delayedReportTypeSearch,
            clearFunction: this.clearSearchFilter,
            scope: this,
            emptyText: LC.getLabel("ReportBuilder", "quickFindDefaultText"),
            listeners: {
                keyup: this.enterKeyListener.createSequence(this.selectFirstNode).createDelegate(this),
                keypress: this.enterKeyListener,
                keydown: this.enterKeyListener
            }
        }),
            c = new Ext.Toolbar({
                layout: "fit",
                items: [b]
            });
        this.quickFind = b;
        this.reportTypeTree = new Ext.tree.TreePanel({
            id: "reportTypeTree",
            rootVisible: !1,
            autoScroll: !0,
            width: a.treeWidth,
            height: a.treeHeight,
            root: new Ext.tree.AsyncTreeNode({
                expanded: !0,
                children: a.categories
            }),
            keys: [{
                key: Ext.EventObject.ENTER,
                fn: this.treeEnterListener,
                scope: this
            }]
        });
        this.configReportTypeSelectListener = a.reportTypeSelectListener;
        this.reportTypeTree.getSelectionModel().on("selectionchange", this.selectionChangeListener, this);
        b = {
            html: LC.getLabel("ReportBuilder", "noReportTypeMatch"),
            ref: "noMatchText",
            cls: "noMatchText",
            hidden: !0,
            height: a.treeHeight
        };
        Ext.apply(a, {
            items: [c, this.reportTypeTree, b]
        });
        Sfdc.reportbuilder.ReportTypePanel.superclass.constructor.call(this, a);
        this.isInEditMode = !1;
        Ext.get("reportTypeVisibilityErrorMessage").hide();
        a.canEdit && this.initReportTypeVisibility(a);
        this.categories = a.categories;
        this.searchIndexes = [];
        this.delayedSearchTask = new Ext.util.DelayedTask(this.filterReportTypeBySearch, this);
        this.clearSearchFilter();
        this.selectDefaultReportType()
    },
    initReportTypeVisibility: function (a) {
        var b = Ext.get("rtEditMode");
        b.dom.className = "editMode";
        b.first().on("click", this.setReportTypeTreeVisibilityIcons, this);
        this.serverProxy = Sfdc.reportbuilder.visibility.ServerProxy;
        this.serverProxy.setInput(a.changeVisibilityFields.rptVisibilityParam);
        this.serverProxy.addListener(Sfdc.reportbuilder.visibility.ServerProxy.Events.RESPONSE, function (a) {
            !0 === a.success ? Ext.get("reportTypeVisibilityErrorMessage").hide() : (Ext.get("reportTypeVisibilityErrorMessage").child("label").dom.innerHTML = a.errorMessage, Ext.get("reportTypeVisibilityErrorMessage").show())
        });
        Ext.get("rtVisibilityHelpTextMouseOverOuter").child("div").dom.innerHTML = LC.getLabel("ReportTypeVisibility", "EditReportTypeVisibilityTooltip");
        this.changeVisibilityFields = a.changeVisibilityFields;
        this.setReportTypeDataIndexes(a.categories)
    },
    setReportTypeDataIndexes: function (a) {
        for (var b = 0; b < a.length; b++)
            for (var c = a[b], d = 0; d < c.children.length; d++) {
                var e = c.children[d];
                e.cIndex = b;
                e.rIndex = d
            }
    },
    setReportTypeTreeVisibilityIcons: function (a, b) {
        this.isInEditMode = Ext.get("rtEditMode").first().dom.checked;
        Ext.get("reportTypeVisibilityErrorMessage").hide();
        this.disableClickListeners();
        this.isInEditMode ? (this.reportTypeTree.on("click", this.reportTypeVisibilityClickListener, this), Ext.get(this.changeVisibilityFields.createButton).setDisplayed("none"), Ext.get(this.changeVisibilityFields.cancelButton).setDisplayed("none")) : (this.reportTypeTree.getSelectionModel().on("selectionchange", this.selectionChangeListener, this), Ext.get(this.changeVisibilityFields.createButton).setDisplayed(!0), Ext.get(this.changeVisibilityFields.cancelButton).setDisplayed(!0));
        0 <
            this.pendingQuery.length ? (this.filterQuery = "", this.filterReportTypeBySearch()) : this.clearSearchFilter()
    },
    disableClickListeners: function () {
        this.reportTypeTree.un("click", this.reportTypeVisibilityClickListener, this);
        this.reportTypeTree.getSelectionModel().un("selectionchange", this.selectionChangeListener, this)
    },
    selectionChangeListener: function (a, b) {
        this.configReportTypeSelectListener(b)
    },
    reportTypeVisibilityClickListener: function (a) {
        if (this.isInEditMode && a.isLeaf()) {
            var b = a.attributes;
            "true" === b.isHidden ?
                (b.isHidden = "false", a.setIconCls("x-tree-node-visible-icon")) : "false" === b.isHidden && (b.isHidden = "true", a.setIconCls("x-tree-node-hidden-icon"));
            this.serverProxy.setReportTypeVisibility(b.value, b.isHidden);
            this.categories[b.cIndex].children[b.rIndex].isHidden = b.isHidden
        }
    },
    selectDefaultReportType: function () {
        var a = this.reportTypeTree.getRootNode().firstChild;
        a && (a.expand(!1, !1), a.firstChild && a.firstChild.select(), a.collapse(!1, !1))
    },
    selectFirstNode: function (a, b) {
        if (b.keyCode === b.ENTER)
            for (var c = this.reportTypeTree.getRootNode().childNodes,
                    d = 0; d < c.length; d++)
                if (!c[d].hidden) {
                    c[d].expanded || c[d].expand();
                    c[d].firstChild.select();
                    c[d].ui.anchor.focus();
                    break
                }
    },
    enterKeyListener: function (a, b) {
        b.getKey() === b.ENTER && b.stopEvent()
    },
    treeEnterListener: function (a, b) {
        var c = this.reportTypeTree.getSelectionModel().getSelectedNode();
        if (!Ext.isEmpty(c))
            if (c.isLeaf()) {
                if (this.onReportTypeEnterKey) this.onReportTypeEnterKey()
            } else c.isExpanded() ? c.collapse() : (c.expand(), c.firstChild.select()), c.ui.anchor.focus()
    },
    delayedReportTypeSearch: function (a) {
        this.pendingQuery = a.trim();
        this.delayedSearchTask.delay(500)
    },
    filterReportTypeBySearch: function () {
        if (this.pendingQuery !== this.filterQuery)
            if ("" === this.pendingQuery) this.clearSearchFilter();
            else {
                this.clearNoMatch();
                this.filterQuery = this.pendingQuery;
                var a = this.buildSearchRegex(this.pendingQuery);
                if (!this.filterByFunc(this.filterReportType.createDelegate(this, [a], !0))) this.onNoMatch()
            }
    },
    onNoMatch: function () {
        this.reportTypeTree.hide();
        this.noMatchText.show();
        if (this.onSearchNoMatch) this.onSearchNoMatch()
    },
    clearNoMatch: function () {
        this.reportTypeTree.show();
        this.noMatchText.hide()
    },
    buildSearchRegex: function (a) {
        a = Ext.escapeRe(a.trim());
        return RegExp(a, "i")
    },
    filterReportType: function (a, b) {
        return -1 !== a.search(b)
    },
    filterByFunc: function (a) {
        this.reportTypeTree.root.getLoader().load(this.reportTypeTree.root);
        for (var b = !1, c = this.reportTypeTree.root.childNodes, d = this.showMore.createDelegate(this, [a], !0), e = 0; e < c.length; e++) {
            var g = c[e],
                h = this.categories[e],
                f = 0;
            g.loaded = !0;
            for (var l = 0; l < h.children.length; l++) {
                var k = h.children[l];
                if (a.apply(a, [k.text])) {
                    k = g.getLoader().createNode(this.getNodeConfig(k));
                    if (this.isInEditMode)
                        if ("true" === k.attributes.isDeployed) this.setNodeIconInEditMode(k);
                        else continue;
                    else if ("true" === k.attributes.isHidden) continue;
                    f++;
                    if (f > Sfdc.reportbuilder.ReportTypePanel.RESULT_SIZE_LIMIT) {
                        h = new Ext.tree.AsyncTreeNode({
                            text: LC.getLabel("ReportBuilder", "seeMoreResults"),
                            leaf: !0,
                            id: Sfdc.reportbuilder.ReportTypePanel.MORE_NODE_ID_PREFIX + e,
                            iconCls: "moreInfoIcon",
                            listeners: {
                                click: d
                            }
                        });
                        g.appendChild(h);
                        break
                    }
                    g.appendChild(k)
                }
            }
            this.searchIndexes[e] = l;
            this.setNodeVisibility(g, 0 < f);
            0 < f && (g.expand(!1, !1), b = !0)
        }
        return b
    },
    showMore: function (a, b, c) {
        b = parseInt(a.id.substring(Sfdc.reportbuilder.ReportTypePanel.MORE_NODE_ID_PREFIX.length), 10);
        for (var d = this.reportTypeTree.root.childNodes[b], e = this.categories[b], g = 0, h = this.searchIndexes[b]; h < e.children.length; h++) {
            var f = e.children[h];
            if (c.apply(c, [f.text])) {
                f = d.getLoader().createNode(this.getNodeConfig(f));
                if (this.isInEditMode)
                    if ("true" === f.attributes.isDeployed) this.setNodeIconInEditMode(f);
                    else continue;
                else if ("true" === f.attributes.isHidden) continue;
                g++;
                if (g > Sfdc.reportbuilder.ReportTypePanel.RESULT_SIZE_LIMIT) break;
                d.insertBefore(f, a)
            }
        }
        g <= Sfdc.reportbuilder.ReportTypePanel.RESULT_SIZE_LIMIT && a.remove();
        this.searchIndexes[b] = h;
        return !1
    },
    getNodeConfig: function (a) {
        a.escapedText || (a.escapedText = escapeHTML(a.text));
        return Ext.applyIf({
            text: a.escapedText
        }, a)
    },
    setNodeIconInEditMode: function (a) {
        "true" === a.attributes.isHidden ? a.setIconCls("x-tree-node-hidden-icon") : "false" === a.attributes.isHidden && a.setIconCls("x-tree-node-visible-icon")
    },
    setNodeVisibility: function (a, b) {
        b ? a.getUI().show() : a.getUI().hide()
    },
    clearSearchFilter: function () {
        this.clearNoMatch();
        this.delayedSearchTask.cancel();
        this.pendingQuery = this.filterQuery = "";
        this.filterByFunc(function (a) {
            return !0
        });
        if (this.onClearSearch) this.onClearSearch();
        this.reportTypeTree.collapseAll()
    }
});
Ext.reg("reportTypePanel", Sfdc.reportbuilder.ReportTypePanel);
Sfdc.reportbuilder.ReportTypePanel.RESULT_SIZE_LIMIT = 20;
Sfdc.reportbuilder.ReportTypePanel.MORE_NODE_ID_PREFIX = "more_";
Ext.ns("Sfdc.reportbuilder");
Sfdc.reportbuilder.changeVisibility = function (a) {
    var b = a.report_img,
        c = a.report_desc,
        h = a.customReportTypeKeyPrefix,
        k = a.customObjectKeyPrefix,
        l = a.myEntityKeyPrefix,
        g = a.rptParams,
        f = a.defaultText,
        d = a.createButton;
    if (a.reportType) {
        var e = a.reportType.value;
        a = a.reportType.rtImg;
        e.substr(0, 3) === h ? (document.getElementById(b).src = "/s.gif", document.getElementById(c).innerHTML = a, document.getElementById(f).innerHTML = LC.getLabel("ReportTypeStep", "reportDescription")) : (e.substr(0, 3) === k || e.substr(0, 3) === l ? (document.getElementById(b).src =
            "/s.gif", document.getElementById(c).innerHTML = LC.getLabel("ReportTypeStep", "noPreview")) : (document.getElementById(c).innerHTML = "", document.getElementById(b).src = a), document.getElementById(f).innerHTML = LC.getLabel("ReportTypeStep", "preview"));
        document.getElementById(g).value = e;
        document.getElementById(d).disabled = "";
        document.getElementById(d).setAttribute("class", "btn")
    } else document.getElementById(b).src = "/s.gif", document.getElementById(c).innerHTML = "", document.getElementById(f).innerHTML = "", document.getElementById(g).value =
        "", document.getElementById(d).disabled = "disabled", document.getElementById(d).setAttribute("class", "btnDisabled")
};
Ext.namespace("Sfdc", "Sfdc.reportbuilder");
Sfdc.reportbuilder.ElementEventFilter = function (a) {
    this.init(a)
};
Sfdc.reportbuilder.ElementEventFilter.prototype = {
    init: function (a) {
        this.eventTypes = a
    },
    getSupportedEventTypes: function () {
        return this.eventTypes
    },
    createCheckResult: function (a, b) {
        return {
            process: a,
            stop: b
        }
    },
    checkElement: function (a) { },
    processEvent: function (a) { },
    destroy: function () { }
};
Ext.namespace("Sfdc", "Sfdc.reportbuilder");
Sfdc.reportbuilder.ElementEventManager = function (a) {
    this.init(a)
};
Sfdc.reportbuilder.ElementEventManager.prototype = {
    init: function (a) {
        this.element = a;
        this.filterMap = {};
        this.filterList = [];
        a = Sfdc.reportbuilder.ElementEventType;
        for (var b in a) 0 !== b.indexOf("_") && this.element.addListener(a[b], this.handleEvent, this)
    },
    addFilterToMap: function (a, b) {
        var c = this.filterMap[a];
        Ext.isEmpty(c) ? this.filterMap[a] = [b] : c.push(b)
    },
    registerFilter: function (a) {
        this.filterList.push(a);
        for (var b = a.getSupportedEventTypes(), c = 0; c < b.length; c++) this.addFilterToMap(b[c], a)
    },
    handleEvent: function (a) {
        var b =            this.filterMap[a.type];
        if (!Ext.isEmpty(b))
            for (var c = 0; c < b.length; c++) {
                var d = b[c],
                    e = d.checkElement(a.target);
                if (e.process && (d.processEvent(a), e.stop)) break
            }
    },
    destroy: function () {
        for (var a = 0; a < this.filterList.length; a++) this.filterList[a].destroy();
        this.filterMap = this.filterList = null;
        var a = Sfdc.reportbuilder.ElementEventType,
            b;
        for (b in a) 0 !== b.indexOf("_") && this.element.removeListener(a[b], this.handleEvent, this)
    }
};

//# sourceMappingURL=/javascript/1410512610000/analytics-reporting-impl/source/ReportBuilderTypeStep.js.map