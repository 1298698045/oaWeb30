Ext.ns("Sfdc", "Sfdc.layout", "Sfdc.lib");
Sfdc.layout.getConstructorByName = function(a) {
    a = a.split(".");
    for (var c = window, b = 0; b < a.length; b++) c = c[a[b]];
    return c
};
Sfdc.layout.getCanvas = function(a, c) {
    return new(Sfdc.layout.getConstructorByName(VFEditor.specialCanvasType || "Sfdc.layout.Canvas"))(a, c)
};
Sfdc.layout.buildCategoryStore = function(a, c) {
    var b = new Ext.data.JsonStore({
        data: c,
        fields: "name label labelSingular showBlank showNewSection showTableSection showRTAField".split(" "),
        id: "name",
        storeId: "categories"
    });
    if (VFEditor.removeEmptyCategories) {
        var f = [];
        b.each(function(b) {
            window.analyticsTroughData && "Analytics" === b.id || 0 > a.find("displayCategory", b.id) && f.push(b)
        });
        f.each(function(a) {
            b.remove(a)
        })
    }
    return b
};
Sfdc.layout.messageHTML = function(a, c) {
    return ['\x3cdiv class\x3d"message-container message-type-', c, '"\x3e', '   \x3cdiv class\x3d"message-body"\x3e', '        \x3cdiv class\x3d"message-icon"\x3e\x3c/div\x3e', '        \x3cdiv class\x3d"message-text"\x3e', a, "\x3c/div\x3e", "\x3c/div\x3e\x3c/div\x3e"]
};
Sfdc.layout.buildItemStore = function() {
    var a = Ext.data.Record.create("id label type typeArgs sampleData name category displayCategory state btnOrder length scale alwaysDisplayed alwaysRequired alwaysReadonly alwaysNotRequired alwaysNotReadonly removable controllerIds controllerNames dependentIds dependentNames defaultColumns customizedColumns sortColumn sortDesc selectableColumns isSortCustomizable nameColumn listCustomizable stdListButtons customListButtons applyToOtherLayoutsData applyToOtherLayoutsInitData chartType contextFilterableFields atReportFilterLimit hidden targetRecordType isMobileEnabled targetEntityLabel actionType folderName".split(" ")),
        c =
        new Sfdc.JsonStore({
            data: window.analyticsTroughData ? troughData.concat(analyticsTroughData) : troughData,
            fields: a,
            id: "id",
            storeId: "items"
        });
    c.each(function(a) {
        var b = function(a) {
            var b = c.getById(a);
            return b ? b.data.name : a
        };
        a.data.controllerIds && a.set("controllerNames", a.data.controllerIds.collect(b));
        a.data.dependentIds && a.set("dependentNames", a.data.dependentIds.collect(b))
    });
    var b = [];
    VFEditor.showTableSection && b.push(new a({
        id: Sfdc.quoteTemplate.QuoteTemplateCanvas.TABLESECTION,
        label: LC.getLabel("QuoteTemplateEditor", "TableBlock"),
        type: "tablesection",
        category: Sfdc.quoteTemplate.QuoteTemplateCanvas.TABLESECTION,
        state: "special"
    }, Sfdc.quoteTemplate.QuoteTemplateCanvas.TABLESECTION));
    b.push(new a({
        id: Sfdc.layout.Trough.SECTION_ID,
        label: VFEditor.labelMap.newSectionItemLabel,
        type: "section",
        category: "__SECTION",
        state: "special"
    }, Sfdc.layout.Trough.SECTION_ID));
    VFEditor.showRTAField && b.push(new a({
        id: Sfdc.quoteTemplate.QuoteTemplateCanvas.RTA_FIELD,
        label: LC.getLabel("QuoteTemplateEditor", "TextImageField"),
        type: "rta",
        category: Sfdc.quoteTemplate.QuoteTemplateCanvas.RTA_FIELD,
        state: "special"
    }, Sfdc.quoteTemplate.QuoteTemplateCanvas.RTA_FIELD));
    VFEditor.allowBlankSpace && b.push(new a({
        id: NewLayoutEditor.BLANK_ID,
        label: LC.getLabel("LayoutDND", "BlankSpace"),
        type: "blank",
        category: "EmptySpace",
        state: "special"
    }, NewLayoutEditor.BLANK_ID));
    c.insert(0, b);
    return c
};
Sfdc.layout.buildPreviewButton = function() {
    var a = {};
    if (VFEditor.showPreviewAs) {
        var c = new Ext.ux.ScrollMenu({
            cls: "simpleMenu",
            MaxHeight: 360
        });
        profileData.each(function(a) {
            c.add(new Sfdc.layout.PreviewMenuItem(a))
        });
        a.menu = c;
        a.text = LC.getLabel("LayoutDND", "PreviewAs")
    } else a.text = VFEditor.labelMap.previewButtonLabel, a.handler = VFEditor.showPreview.curry(null);
    return new Ext.Button(a)
};
Ext.onReady(function() {
        Sfdc.Perf.endMark("start onReady");
        if (!window.troughData) throw "troughData is not defined. layoutData defined \x3d" + (layoutData && null !== layoutData) + "\n";
        Ext.MessageBox.buttonText = {
            ok: LC.getLabel("Buttons", "ok"),
            cancel: LC.getLabel("Buttons", "cancel"),
            yes: LC.getLabel("Buttons", "yes"),
            no: LC.getLabel("Buttons", "no")
        };      
        for (var a = 0; a < troughData.length; a++) troughData[a].state = "unused";
        if (window.analyticsTroughData)
            for (a = 0; a < analyticsTroughData.length; a++) analyticsTroughData[a].state ="unused";
        Sfdc.Perf.mark("itemStore");
        var c = Sfdc.layout.buildItemStore();
        Sfdc.Perf.endMark("itemStore");
        sampleByType[ColumnType.BOOLEAN.datatypeLetter] = '\x3cimg alt\x3d"' + LC.getLabel("LayoutDND", "Checked") + '" src\x3d"/img/checkbox_checked.gif"\x3e\x3c/img\x3e';
        var b = null;
        layoutData.isDetailMode || (b = new Sfdc.MessageHandler, VFEditor.handler = b);
        Ext.QuickTips.init(!1);
        var f;
        VFEditor.showPreviewButton && (f = Sfdc.layout.buildPreviewButton());
        a = null;
        VFEditor.specialLayoutType && (a = Sfdc.layout.getConstructorByName(VFEditor.specialLayoutType));
       
        var k = Sfdc.layout.getCanvas(b, {
                data: layoutData,
                baseCls: "target",
                id: "targetPanel",
                store: c,
                layoutConstructor: a
            }),
            r = function(a) {
                return Math.max(Math.min(Ext.fly("outerTarget").getComputedWidth(), Ext.getBody().getViewSize().width - a - (Ext.isIE ? 5 : 20)), 550)
            };
        if (!layoutData.isDetailMode) {
            new Ext.KeyMap(Ext.get(document), [{
                key: "z",
                ctrl: !0,
                stopEvent: !0,
                fn: function() {
                    b.undoLast()
                }
            }, {
                key: "y",
                ctrl: !0,
                stopEvent: !0,
                fn: b.redo,
                scope: b
            }, {
                key: "s",
                ctrl: !0,
                stopEvent: !0,
                fn: VFEditor.getCommand("quickSave")
            }]);
            Sfdc.Perf.mark("categoryStore");
            var n = Sfdc.layout.buildCategoryStore(c, categoryData);
            Sfdc.Perf.endMark("categoryStore");
            var e = new Sfdc.layout.Trough({
                itemSelector: ".item",
                id: "fieldTrough",
                store: c,
                categoryStore: n,
                handler: b
            });
            Sfdc.Perf.mark("Selector");
            var p = "";
            n.each(function(a) {
                a.data.label.length > p.length && (p = a.data.label)
            });
            var l = Math.max(150, Ext.util.TextMetrics.measure("selectorTest", Ext.util.Format.htmlEncode(p)).width + 15),
                m = new Ext.DataView({
                    store: n,
                    tpl: (new Ext.XTemplate('\x3cul\x3e\x3ctpl for\x3d"."\x3e\x3cli\x3e\x3cdiv class\x3d"selectorItem" id\x3d"troughCategory__{name}"\x3e{label:htmlEncode}\x3c/div\x3e\x3c/li\x3e\x3c/tpl\x3e\x3c/ul\x3e')).compile(),
                    singleSelect: !0,
                    id: "troughSelector",
                    selectedClass: "selected",
                    overClass: "hover",
                    trackOver: !0,
                    itemSelector: "li",
                    region: "west",
                    hidden: !VFEditor.showTroughSelector,
                    width: l,
                    autoScroll: !0,
                    listeners: {
                        selectionchange: e.onCategoryChange,
                        containerclick: function(a, b) {
                            return !1
                        },
                        scope: e
                    }
                }),
                s = new Ext.Panel({
                    id: "troughSelectorWrapper",
                    baseCls: "selector",
                    border: !1,
                    region: "west",
                    items: [m],
                    layout: "fit",
                    width: l
                });
            Sfdc.Perf.endMark("Selector");
            var q = {
                text: LC.getLabel("Buttons", "save"),
                id: "saveBtn",
                handler: VFEditor.getCommand("save")
            };
            VFEditor.allowSaveAs && (q.xtype = "tbsplit", q.menu = new Ext.menu.Menu({
                cls: "simpleMenu",
                items: [{
                    text: LC.getLabel("LayoutDND", "SaveAs"),
                    handler: function() {
                        Ext.getCmp("targetPanel").saveAs()
                    }
                }]
            }));
            var g = [q, {
                text: LC.getLabel("Buttons", "quick_save"),
                id: "quickSaveBtn",
                handler: VFEditor.getCommand("quickSave")
            }];
            f && g.push(f);
            g = g.concat({
                text: LC.getLabel("Buttons", "cancel"),
                id: "cancelBtn",
                handler: VFEditor.getCommand("cancel")
            }, "-", {
                text: LC.getLabel("LayoutDND", "Undo"),
                id: "undoBtn",
                iconCls: "undo-btn-icon",
                disabled: !0,
                handler: function() {
                    b.undoLast()
                }
            }, {
                text: LC.getLabel("LayoutDND", "Redo"),
                id: "redoBtn",
                iconCls: "redo-btn-icon",
                disabled: !0,
                handler: b.redo,
                scope: b
            });
            VFEditor.showLayoutPropertiesButton && (g = g.concat("-", {
                text: VFEditor.labelMap.propertiesButtonLabel,
                id: "pageProps",
                iconCls: "pagePropsBtn"
            }));
            var x = new Ext.Toolbar({
                    cls: "subbtn",
                    items: g
                }),
                d, c = function(a) {
                    a = a.ownerCt.getEl().getHeight();
                    var b = Ext.get(VFEditor.HEADER_BAR_ID);
                    Ext.isIE && (a += b.getHeight());
                    Ext.getDom("outerTarget").style.marginTop = a + "px";
                    d && d.layer &&
                        d.layer.sync(!0)
                };
            Sfdc.Perf.mark("panel");
            d = new Ext.Panel({
                baseCls: "trough",
                cls: "x-theme-aloha-esque",
                region: "north",
                border: !1,
                tbar: x,
                id: "troughPanel",
                items: [{
                    collapsible: !0,
                    hideCollapseTool: !0,
                    collapseDefaults: {
                        duration: 0.5,
                        easing: "easeOut"
                    },
                    expandDefaults: {
                        duration: 0.5,
                        easing: "easeOut"
                    },
                    layout: "border",
                    id: "collapser",
                    height: 142,
                    border: !1,
                    items: [s, {
                        region: "center",
                        baseCls: "nonce",
                        id: "troughRightPane",
                        border: !1,
                        layout: "border",
                        margins: "0 5 15 10",
                        items: [{
                            border: !1,
                            baseCls: "tools",
                            region: "north",
                            layout: "fit",
                            height: 30,
                            items: [new Sfdc.layout.Quickfind]
                        }, {
                            baseCls: "draggables",
                            region: "center",
                            layout: "fit",
                            items: [e]
                        }]
                    }],
                    listeners: {
                        beforecollapse: function() {
                            d.layer && d.layer.beforeAction()
                        },
                        beforeexpand: function() {
                            m.setWidth(l);
                            s.setWidth(l);
                            d.layer && d.layer.beforeAction()
                        },
                        collapse: c,
                        expand: c
                    }
                }, {
                    id: "collapserControl",
                    height: 8,
                    border: !1,
                    cls: "collapseTarget",
                    listeners: {
                        render: function(a) {
                            a.getEl().on("click", function(a) {
                                a = Ext.getCmp("collapser");
                                var b = Ext.getCmp("collapserControl");
                                a.collapsed ? (a.expand(!Ext.isIE6),
                                    b.removeClass("collapseTargetCollapsed")) : (a.collapse(!Ext.isIE6), b.addClass("collapseTargetCollapsed"))
                            });
                            a.getEl().addClassOnOver("hover")
                        }
                    }
                }],
                refreshOrigPosition: function() {
                    Ext.get(this.getEl().dom.parentNode);
                    if (Ext.fly("outerTarget")) {
                        var a = Ext.fly("outerTarget").getTop() - Ext.fly("outerTarget").getMargins().top,
                            b = Ext.get(VFEditor.HEADER_BAR_ID);
                        Ext.isIE && (a += b.getHeight());
                        this.origPosition.y = a;
                        this.isFixed || this.layer.moveTo(this.origPosition.x, this.origPosition.y);
                        b.setY(a - b.getHeight())
                    }
                },
                onRender: function() {
                    Sfdc.Perf.mark("troughOnRender");
                    Ext.Panel.prototype.onRender.apply(this, arguments);
                    Sfdc.Perf.endMark("troughOnRender");
                    var a = Ext.get(this.getEl().dom.parentNode),
                        b = a.getBox();
                    this.layer = (new Ext.Layer({
                        shadow: !Ext.isIE6,
                        zindex: 3,
                        constrain: !1
                    }, a.dom)).moveTo(b.x, b.y).show();
                    this.troughPageY = this.layer.getY();
                    this.layer.setWidth(b.width);
                    this.origPosition = b;
                    Ext.EventManager.on(window, "scroll", this.onScrollWindow, this, {
                        buffer: 50
                    });
                    Ext.EventManager.onWindowResize(function() {
                        this.layer.beforeAction();
                        var a = r(this.origPosition.x);
                        Ext.fly(VFEditor.HEADER_BAR_ID).setWidth(a);
                        this.setWidth(a);
                        this.doLayout();
                        this.layer.setWidth(a);
                        this.layer.sync(!0);
                        e.refresh()
                    }, this);
                    Sfdc.Perf.endMark("troughOnRender")

                },
                onScrollWindow: function(a) {
                    a = Ext.getBody().getScroll();
                    this.isFixed && !Ext.isIE6 && (delete Ext.dd.DragDropMgr.locationCache[e.dropTarget.id], delete Ext.dd.DragDropMgr.locationCache[e.dragZone.id]);
                    a.top <= this.origPosition.y && 0 < a.left ? (this.isFixed || (Ext.isIE6 ? (this.layer.position("absolute", 3, this.origPosition.x +
                            a.left, this.origPosition.y), this.layer.dom.style.marginTop = -1 * this.troughPageY, this.layer.getShim().dom.style.marginTop = -1 * this.troughPageY) : (this.layer.setStyle("position", "fixed"), this.layer.setLeft(this.origPosition.x)), this.layer.sync(!0), this.isFixed = !0, Ext.dd.DragDropMgr.registerFloating(e.dropTarget), Ext.dd.DragDropMgr.margins.top = this.layer.getHeight()), Ext.isIE6 ? this.layer.setXY([this.origPosition.x + a.left, this.origPosition.y]) : this.layer.setTop(this.origPosition.y - a.top)) : a.top > this.origPosition.y ||
                        0 < a.left ? (this.isFixed || (Ext.isIE6 ? (this.layer.position("absolute", 3, this.origPosition.x + a.left, a.top), this.layer.dom.style.marginTop = -1 * this.troughPageY, this.layer.getShim().dom.style.marginTop = -1 * this.troughPageY) : (this.layer.setStyle("position", "fixed"), this.layer.setLeft(this.origPosition.x), this.layer.setTop(0)), this.layer.sync(!0), this.isFixed = !0, Ext.dd.DragDropMgr.registerFloating(e.dropTarget), Ext.dd.DragDropMgr.margins.top = this.layer.getHeight()), Ext.isIE6 ? this.layer.setXY([this.origPosition.x +
                            a.left, a.top
                        ]) : 0 < this.layer.getTop() && this.layer.setTop(0)) : this.isFixed && (Ext.isIE6 && (this.layer.dom.style.marginTop = "", this.layer.getShim().dom.style.marginTop = ""), Ext.dd.DragDropMgr.unregisterFloating(e.dropTarget), Ext.dd.DragDropMgr.margins.top = 0, this.layer.position("absolute", 3, this.origPosition.x, this.origPosition.y), this.layer.sync(!0), this.isFixed = !1)
                }
            });
            Sfdc.Perf.endMark("panel");
            d.render("trough");
            if (Ext.isIE7 || Ext.isIE8) e.getEl().dom.style.height = "";
            c(d.get(0));
            Sfdc.Perf.endMark("panel");
            m.select(0);
            var h = Ext.get(VFEditor.HEADER_BAR_ID),
                t = h.getX(),
                u = h.dom.cloneNode(!1);
            h.position("absolute", 2, t, h.getY());
            u.id = Ext.id();
            h.insertSibling(u, "before").setVisibilityMode(Element.VISIBILITY).setVisible(!1);
            h.setWidth(r(t))
        }
        Ext.fly("outerTarget").update("");
        k.render("outerTarget");
        if (!layoutData.isDetailMode) {
            m.on("selectionchange", k.onCategoryChange, k);
            var v = Ext.getCmp("pageProps");
            v && v.setHandler(k.showLayoutProps, k);
            d.layer.sync()
        }
        Ext.dd.ScrollManager.vthresh = 35;
        Ext.dd.ScrollManager.hthresh =
            35;
        Ext.dd.ScrollManager.animDuration = 0.2;
        Ext.dd.ScrollManager.frequency = 250;
        Ext.dd.ScrollManager.increment = 75;
        Ext.state.Manager.setProvider(new Ext.state.CookieProvider({
            path: VFEditor.cookiePath,
            expires: null,
            secure: Ext.isSecure
        }));
        Ext.isGecko2 && !layoutData.isDetailMode && Ext.Msg.show({
            title: LC.getLabel("Icon", "WARNING"),
            msg: Ext.util.Format.htmlDecode(LC.getLabel("LayoutDND", "FF2Message", VFEditor.uiPrefsUrl)),
            buttons: Ext.Msg.OK,
            fn: VFEditor.getCommand("cancel"),
            icon: Ext.Msg.WARNING
        });
        Ext.override(Ext.form.TextField, {
            blankText: LC.getLabel("Edit", "Required")
        });
        VFEditor.loadingDone();
        Sfdc.Perf.endMark("end OnReady")

       if (Sfdc.sendGack("VFEditor", w, {
               userAgent: navigator.userAgent
       }), VFEditor.gack(), !VFEditor.hideGack) throw w;

});
Ext.ns("Sfdc", "Sfdc.dd");
Sfdc.dd.DelegatingDropTarget = Ext.extend(Ext.dd.DropTarget, {
    getTarget: Ext.emptyFn,
    notifyDrop: function(b, a, c) {
        this.lastOverNode && (this.lastOverNode.notifyOut(b, a, c), this.lastOverNode = null);
        var d = this.getTarget(b, a, c);
        return d ? d.notifyDrop(b, a, c) : !1
    },
    notifyEnter: function(b, a, c) {
        return ""
    },
    notifyOut: function(b, a, c) {
        this.lastOverNode && (this.lastOverNode.notifyOut(b, a, c), this.lastOverNode = null)
    },
    notifyOver: function(b, a, c) {
        var d = this.getTarget(b, a, c);
        !d && this.lastOverNode && (this.lastOverNode.notifyOut(b, a,
            c), this.lastOverNode = null);
        this.lastOverNode != d && (this.lastOverNode && this.lastOverNode.notifyOut(b, a, c), d.notifyEnter(b, a, c), this.lastOverNode = d);
        return d ? d.notifyOver(b, a, c) : null
    }
});
Sfdc.dd.DelegatedDropZone = function() {};
Sfdc.dd.DelegatedDropZone.prototype = {
    dropAllowed: "x-dd-drop-ok",
    dropNotAllowed: "x-dd-drop-nodrop",
    _getTarget: function(b, a) {
        if (!this.lastTarget || !(b in this.lastTarget && this.lastTarget[b] === a)) {
            var c = {};
            c[b] = a;
            this.lastTarget = c
        }
        return this.lastTarget
    },
    getTargetFromEvent: Ext.emptyFn,
    onNodeEnter: Ext.emptyFn,
    onNodeOver: function(b, a, c, d) {
        return this.dropAllowed
    },
    onNodeOut: Ext.emptyFn,
    onNodeDrop: function(b, a, c, d) {
        return !1
    },
    onContainerOver: function(b, a, c) {
        return this.dropNotAllowed
    },
    onContainerDrop: function(b,
        a, c) {
        return !1
    },
    notifyEnter: function(b, a, c) {
        return this.dropNotAllowed
    },
    notifyOver: function(b, a, c) {
        var d = this.getTargetFromEvent(a);
        if (!d) return this.lastOverNode && (this.onNodeOut(this.lastOverNode, b, a, c), this.lastOverNode = null), this.onContainerOver(b, a, c);
        if (this.lastOverNode != d) {
            if (this.lastOverNode) this.onNodeOut(this.lastOverNode, b, a, c);
            this.onNodeEnter(d, b, a, c);
            this.lastOverNode = d
        }
        return this.onNodeOver(d, b, a, c)
    },
    notifyOut: function(b, a, c) {
        this.lastOverNode && (this.onNodeOut(this.lastOverNode, b,
            a, c), this.lastOverNode = null)
    },
    notifyDrop: function(b, a, c) {
        this.lastOverNode && (this.onNodeOut(this.lastOverNode, b, a, c), this.lastOverNode = null);
        var d = this.getTargetFromEvent(a);
        return d ? this.onNodeDrop(d, b, a, c) : this.onContainerDrop(b, a, c)
    }
};
Sfdc.scrollWindowTo = function(a, b, c) {
    c ? (c = "boolean" == typeof c ? {
        easing: "easeOutStrong"
    } : c, Ext.getBody().anim({
        scroll: {
            to: [a, b]
        }
    }, c, "scrollwindow")) : window.scrollTo(a, b)
};
Sfdc.scrollWindowY = function(a, b) {
    Sfdc.scrollWindowTo(Ext.getBody().dom.scrollLeft, a, b)
};
Sfdc.lib.ScrollWindow = Ext.extend(Ext.lib.Scroll, {
    getAttr: function(a) {
        return "scroll" == a ? (a = Ext.getBody().getScroll(), [a.left, a.top]) : Sfdc.lib.ScrollWindow.superclass.getAttr.call(this, a)
    },
    setAttr: function(a, b, c) {
        "scroll" == a ? window.scrollTo(b[0], b[1]) : Sfdc.lib.ScrollWindow.superclass.getAttr.call(this, a, b, c)
    }
});
Ext.lib.Anim.scrollwindow = function(a, b, c, d, e, f) {
    return this.run(a, b, c, d, e, f, Sfdc.lib.ScrollWindow)
};
Sfdc.lib.BodyScrollEl = function() {
    this.bodyEl = Ext.getBody();
    this.dom = this.bodyEl.dom;
    this.id = this.dom.id
};
Ext.extend(Sfdc.lib.BodyScrollEl, Ext.Element, {
    scrollTo: function(a, b, c) {
        Sfdc.scrollWindowTo(a, b, c)
    },
    isScrollable: function() {
        return !0
    },
    scroll: function(a, b, c) {
        var d = this.bodyEl.getScroll(),
            e = this.getViewSize(),
            f = d.left,
            d = d.top,
            g = document.documentElement.scrollWidth,
            h = document.documentElement.scrollHeight,
            l = e.width,
            e = e.height,
            m = this.preanim(arguments, 2),
            k = !1;
        switch (a) {
            case "l":
            case "left":
                g - f > l && (f = Math.min(f + b, g - l), k = !0);
                break;
            case "r":
            case "right":
                0 < f && (f = Math.max(f - b, 0), k = !0);
                break;
            case "t":
            case "top":
            case "up":
                0 <
                    d && (d = Math.max(d - b, 0), k = !0);
                break;
            case "b":
            case "bottom":
            case "down":
                h - d > e && (d = Math.min(d + b, h - e), k = !0)
        }
        if (k) {
            var n = m.callback,
                p = m.scope;
            m.callback = function() {
                Ext.callback(n, p);
                this.refreshRegion()
            };
            m.scope = this;
            Sfdc.scrollWindowTo(f, d, m)
        }
        return k
    },
    refreshRegion: function() {
        this._region && (this._region = this.getRegion())
    },
    getRegion: function() {
        var a = Ext.getBody().getScroll(),
            b = this.getViewSize(),
            c = Ext.dd.DragDropMgr.margins;
        return new Ext.lib.Region(a.top + c.top, a.left + b.width - c.right, a.top + b.height - c.bottom,
            a.left + c.left)
    }
});
Sfdc.ItemSelector = Ext.extend(Ext.form.Field, {
    imagePath: "/img/ple/directionals/",
    msWidth: 200,
    msHeight: 300,
    hideNavIcons: !1,
    iconUp: "up.gif",
    iconDown: "down.gif",
    iconLeft: "left.gif",
    iconRight: "right.gif",
    iconTop: "top.gif",
    iconBottom: "bottom.gif",
    textUp: "",
    textDown: "",
    textLeft: "",
    textRight: "",
    textTop: "",
    textBottom: "",
    drawUpIcon: !0,
    drawDownIcon: !0,
    drawLeftIcon: !0,
    drawRightIcon: !0,
    drawTopIcon: !1,
    drawBotIcon: !1,
    store: null,
    data: null,
    displayField: 0,
    valueField: 1,
    focusClass: void 0,
    readOnly: !1,
    toLegend: null,
    fromLegend: null,
    sortFrom: !0,
    sortFromDir: "ASC",
    toTBar: null,
    fromTBar: null,
    bodyStyle: null,
    border: !1,
    defaultAutoCreate: {
        tag: "div"
    },
    selectedValues: null,
    initComponent: function() {
        Sfdc.ItemSelector.superclass.initComponent.apply(this, arguments);
        this.addEvents({
            rowdblclick: !0,
            change: !0,
            beforemove: !0,
            move: !0,
            beforeselect: !0,
            select: !0,
            beforedeselect: !0,
            deselect: !0,
            reset: !0
        });
        this.fromStore = new Ext.data.SimpleStore({
            id: 0,
            fields: ["value", "label"],
            data: this.data
        });
        this.toStore = new Ext.data.SimpleStore({
            fields: ["value", "label"],
            id: 0
        });
        Ext.isArray(this.selectedValues) && this.setSelectedValues(this.selectedValues)
    },
    onRender: function(a, b) {
        Sfdc.ItemSelector.superclass.onRender.apply(this, arguments);
        this.sortFrom && (this.fromStore.sort("label", this.sortFromDir), this.fromStore.on("add", function(a, b, c) {
            a.sort("label", this.sortFromDir)
        }, this));
        this.fromMultiselect = new Ext.ux.Multiselect({
            legend: this.fromLegend,
            delimiter: this.delimiter,
            allowDup: !1,
            copy: !1,
            allowTrash: !1,
            width: this.msWidth,
            height: this.msHeight,
            dataFields: this.dataFields,
            displayField: "label",
            valueField: "value",
            store: this.fromStore,
            isFormField: !1,
            tbar: this.fromTBar,
            appendOnly: !0,
            sortField: this.sortFrom ? "label" : null,
            sortDir: this.sortFromDir,
            escapeLabels: !0
        });
        this.fromMultiselect.on({
            dblclick: this.onRowDblClick,
            drop: this.fromDrop,
            scope: this
        });
        this.toMultiselect = new Ext.ux.Multiselect({
            legend: this.toLegend,
            delimiter: this.delimiter,
            allowDup: !1,
            width: this.msWidth,
            height: this.msHeight,
            displayField: "label",
            valueField: "value",
            store: this.toStore,
            isFormField: !1,
            tbar: this.toTBar,
            escapeLabels: !0
        });
        this.toMultiselect.on({
            dblclick: this.onRowDblClick,
            drop: this.toDrop,
            scope: this
        });
        var c = new Ext.Panel({
            bodyStyle: this.bodyStyle,
            border: this.border,
            layout: "table",
            layoutConfig: {
                columns: 4
            }
        });
        c.add(this.fromMultiselect);
        var d = new Ext.Panel({
            header: !1,
            width: "50px",
            cls: "multiselectControls"
        });
        c.add(d);
        c.add(this.toMultiselect);
        var e = new Ext.Panel({
            header: !1,
            width: "36px",
            cls: "multiselectControls"
        });
        c.add(e);
        c.render(this.el);
        d.el.down("." + d.bwrapCls).remove();
        e.el.down("." + e.bwrapCls).remove();
        "" !== this.imagePath && "/" !== this.imagePath.charAt(this.imagePath.length - 1) && (this.imagePath += "/");
        this.iconUp = this.imagePath + (this.iconUp || "up.gif");
        this.iconDown = this.imagePath + (this.iconDown || "down.gif");
        this.iconLeft = this.imagePath + (this.iconLeft || "left.gif");
        this.iconRight = this.imagePath + (this.iconRight || "right.gif");
        this.iconTop = this.imagePath + (this.iconTop || "top.gif");
        this.iconBottom = this.imagePath + (this.iconBottom || "bottom.gif");
        var d = d.getEl(),
            e = e.getEl(),
            f = this.id + (this.switchToFrom ? "_iconLeft" :
                "_iconRight"),
            g = this.id + (this.switchToFrom ? "_iconRight" : "_iconLeft"),
            h = this.id + "_iconUp",
            l = this.id + "_iconDown",
            m = this.id + "_iconTop",
            k = this.id + "_iconBottom";
        this.drawRightIcon && d.createChild({
            tag: "div",
            html: this.textRight
        });
        this.addIcon = d.createChild({
            tag: "img",
            src: this.switchToFrom ? this.iconLeft : this.iconRight,
            id: f,
            style: {
                cursor: "pointer",
                margin: "2px"
            }
        });
        this.drawRightIcon && d.createChild({
            tag: "br"
        });
        this.removeIcon = d.createChild({
            tag: "img",
            src: this.switchToFrom ? this.iconRight : this.iconLeft,
            id: g,
            style: {
                cursor: "pointer",
                margin: "2px"
            }
        });
        this.drawLeftIcon && d.createChild({
            tag: "div",
            html: this.textLeft
        });
        this.drawTopIcon && e.createChild({
            tag: "div",
            html: this.textTop
        });
        this.toTopIcon = e.createChild({
            tag: "img",
            src: this.iconTop,
            id: m,
            style: {
                cursor: "pointer",
                margin: "2px"
            }
        });
        this.drawTopIcon && e.createChild({
            tag: "br"
        });
        this.drawUpIcon && e.createChild({
            tag: "div",
            html: this.textUp
        });
        this.upIcon = e.createChild({
            tag: "img",
            src: this.iconUp,
            id: h,
            style: {
                cursor: "pointer",
                margin: "2px"
            }
        });
        this.drawUpIcon && e.createChild({
            tag: "br"
        });
        this.downIcon =
            e.createChild({
                tag: "img",
                src: this.iconDown,
                id: l,
                style: {
                    cursor: "pointer",
                    margin: "2px"
                }
            });
        this.drawDownIcon && e.createChild({
            tag: "div",
            html: this.textDown
        });
        this.drawBottomIcon && e.createChild({
            tag: "br"
        });
        this.toBottomIcon = e.createChild({
            tag: "img",
            src: this.iconBottom,
            id: k,
            style: {
                cursor: "pointer",
                margin: "2px"
            }
        });
        this.drawBottomIcon && e.createChild({
            tag: "div",
            html: this.textBottom
        });
        this.readOnly || (this.toTopIcon.on("click", this.toTop, this), this.upIcon.on("click", this.up, this), this.downIcon.on("click", this.down,
            this), this.toBottomIcon.on("click", this.toBottom, this), this.addIcon.on("click", this.fromTo, this), this.removeIcon.on("click", this.toFrom, this));
        if (!this.drawUpIcon || this.hideNavIcons) this.upIcon.dom.style.display = "none";
        if (!this.drawDownIcon || this.hideNavIcons) this.downIcon.dom.style.display = "none";
        if (!this.drawLeftIcon || this.hideNavIcons) this.addIcon.dom.style.display = "none";
        if (!this.drawRightIcon || this.hideNavIcons) this.removeIcon.dom.style.display = "none";
        if (!this.drawTopIcon || this.hideNavIcons) this.toTopIcon.dom.style.display =
            "none";
        if (!this.drawBotIcon || this.hideNavIcons) this.toBottomIcon.dom.style.display = "none";
        c.body.first();
        this.el.setWidth(c.body.first().getWidth());
        c.body.removeClass();
        this.hiddenName = this.name;
        this.hiddenField = this.el.createChild({
            tag: "input",
            type: "hidden",
            value: "",
            name: this.name
        })
    },
    initValue: Ext.emptyFn,
    setValue: function(a) {
        a = a.split(this.delimiter);
        this.setSelectedValues(a)
    },
    getValue: function() {
        return this.getSelectedValues().join(this.delimiter)
    },
    setSelectedValues: function (a) {
        this.fromStore.add(this.toStore.getRange());
        a.each(function (a) {
            a = this.fromStore.getById(a);
            if (a) {

                this.fromStore.remove(a);
                this.toStore.add(a)
            }
            
        }, this);
        this.fireEvent("change", this, this.getSelectedValues())
    },
    getSelectedValues: function() {
        return this.toStore.collect("value")
    },
    select: function(a, b) {
        var c = this.fromStore.getById(a);
        c && this.fireEvent("beforeselect", this, [c], b) && (this.fromStore.remove(c), Ext.isEmpty(b) ? this.toStore.add(c) : this.toStore.insert(b, c), this.fireEvent("select", this, c, b), this.toMultiselect.view.refresh(), this.fromMultiselect.view.refresh())
    },
    deselect: function(a) {
        if ((a = this.toStore.getById(a)) && this.fireEvent("beforedeselect", this, [a])) this.toStore.remove(a), this.fromStore.add(a), this.fireEvent("deselect", this, a), this.toMultiselect.view.refresh(), this.fromMultiselect.view.refresh()
    },
    move: function(a, b, c) {
        var d = this.toStore.getAt(a);
        if (!(0 > b || b > this.toStore.getCount() || 0 > a || a > this.toStore.getCount()) && d && this.fireEvent("beforemove", this, d, a, b)) this.toStore.remove(d), this.toStore.insert(b, d), this.fireEvent("move", this, d, a, b), c && this.toMultiselect.view.refresh()
    },
    fromTo: function() {
        var a = this.fromMultiselect.view.getSelectedIndexes();
        a.collect(function(a) {
            return this.fromStore.getAt(a).id
        }, this).each(function(a) {
            this.select(a)
        }, this);
        var b = this.toStore.getCount();
        for (i = 0; i < a.length; i++) a[i] = b - i - 1;
        this.toMultiselect.view.select(a)
    },
    toFrom: function() {
        var a = this.toMultiselect.view.getSelectedIndexes(),
            b = a.collect(function(a) {
                return this.toStore.getAt(a).id
            }, this);
        b.each(this.deselect, this);
        for (i = 0; i < b.length; i++) a[i] = this.fromStore.indexOfId(b[i]);
        this.fromMultiselect.view.select(a)
    },
    up: function() {
        var a = this.toMultiselect.view.getSelectedIndexes();
        a.sort();
        a.each(function(a) {
            this.move(a, a - 1, !1)
        }, this);
        this.toMultiselect.view.refresh();
        if (this.topSelectionFixed && (1 >= a[0] || 1 == a[1]))
            if (2 < a.length || 1 < a[1])
                for (; 1 >= a[0];) a.shift();
            else a.length = 0;
        for (i = 0; i < a.length; i++) a[i]--;
        this.toMultiselect.view.select(a)
    },
    down: function() {
        var a = this.toMultiselect.view.getSelectedIndexes();
        a.sort();
        a.reverse();
        a.each(function(a) {
            this.move(a, a + 1, !1)
        }, this);
        this.toMultiselect.view.refresh();
        this.topSelectionFixed &&
            0 === a[a.length - 1] && a.pop();
        for (i = 0; i < a.length; i++) a[i]++;
        this.toMultiselect.view.select(a)
    },
    toTop: function() {
        var a = this.toMultiselect.view.getSelectedIndexes();
        a.sort();
        a.each(function(a, c) {
            this.move(a, c, !1)
        }, this);
        this.toMultiselect.view.refresh()
    },
    toBottom: function() {
        var a = this.toMultiselect.view.getSelectedIndexes();
        a.sort();
        a.reverse();
        var b = this.toStore.getCount();
        a.each(function(a, d) {
            this.move(a, b, !1)
        }, this);
        this.toMultiselect.view.refresh()
    },
    onRowDblClick: function(a, b, c, d) {
        return this.fireEvent("rowdblclick",
            a, b, c, d)
    },
    toDrop: function(a, b, c, d, e) {
        c = a.getDropPoint(d, b, c);
        var f = a.appendOnly || b == a.el.dom ? a.store.getCount() : b.viewIndex;
        "below" == c && f++;
        if (e.sourceView == a) {
            var g = a.store.indexOf(e.records[0]);
            f > g && f--;
            return e.records.all(function(a) {
                return this.fireEvent("beforemove", this, a, g, f, e.records)
            }, this)
        }
        return e.sourceView == this.fromMultiselect.view ? this.fireEvent("beforeselect", this, e.records, f) : !1
    },
    fromDrop: function(a, b, c, d, e) {
        if (e.sourceView == a && this.sortFrom) return !1;
        if (e.sourceView == this.toMultiselect.view) return this.fireEvent("beforedeselect",
            this, e.records)
    },
    reset: function() {
        var a = this.toStore.getRange();
        this.toStore.removeAll();
        this.fromStore.add(a);
        this.fireEvent("reset", this);
        this.fromMultiselect.view.refresh()
    }
});
Sfdc.scrollIntoView = function(a, b, c) {
    var d = Ext.get(a);
    b = Ext.get(b);
    c || (c = 0);
    a = b.getOffsetsTo(a)[1] + d.dom.scrollTop;
    var e = a + b.dom.offsetHeight,
        f = d.dom.clientHeight,
        g = parseInt(d.dom.scrollTop, 10),
        h = g + f;
    b.dom.offsetHeight > f || a < g ? d.scrollTo("top", Math.max(a - c, 0), {
        easing: "easeOutStrong",
        duration: 0.3
    }) : e > h && (c = Math.min(e - f + c, d.dom.scrollHeight), d.scrollTo("top", c, {
        easing: "easeOutStrong",
        duration: 0.3
    }))
};
Ext.ux.ScrollMenu = Ext.extend(Ext.menu.Menu, {
    MaxHeight: void 0,
    SaveState: !0,
    scrollRepeatInterval: 100,
    TopAndBottomSpace: 24,
    scrollRunner: new Ext.util.TaskRunner,
    scrollTask: void 0,
    clientHeight: void 0,
    render: function() {
        Ext.ux.ScrollMenu.superclass.render.apply(this, arguments);
        this.ul.addClass("x-scrollmenu-list")
    },
    autoWidth: function() {
        var a = this.el,
            b = this.ul;
        if (a) {
            var c = this.width;
            c ? a.setWidth(c) : Ext.isIE && (b = b.getWidth() + a.getFrameWidth("lr"), a.setWidth(b < this.minWidth ? this.minWidth : b))
        }
    },
    fnScrollTop: function() {
        for (var a =
                this.ul.dom.childNodes, b = 0, c = 0; c < this.lastChild - 1; c++) b += Ext.get(a[c]).getHeight();
        0 !== this.lastChild && (this.lastChild--, this.nextChild--);
        this.ul.scrollTo("top", b, !0)
    },
    fnScrollBottom: function() {
        var a = this.ul.dom.childNodes;
        if (this.nextChild >= a.length) return !1;
        for (var b = 0, c = 0; c < this.nextChild + 1; c++) b += Ext.get(a[c]).getHeight();
        b -= this.ul.getHeight();
        this.nextChild < a.length && (this.nextChild++, this.lastChild++);
        this.ul.scrollTo("top", b, !0);
        return !0
    },
    onWheel: function(a) {
        w = a.getWheelDelta();
        1 == w ? this.fnScrollTop() :
            -1 == w && this.fnScrollBottom();
        a.preventDefault()
    },
    startScrollBottom: function() {
        this.scrollTask = {
            run: this.fnScrollBottom,
            interval: 200,
            scope: this
        };
        this.scrollRunner.start(this.scrollTask)
    },
    startScrollTop: function() {
        this.scrollTask = {
            run: this.fnScrollTop,
            interval: 200,
            scope: this
        };
        this.scrollRunner.start(this.scrollTask)
    },
    stopScrolling: function() {
        Ext.isEmpty(this.scrollTask) || this.scrollRunner.stop(this.scrollTask);
        scrolTask = void 0
    },
    showAt: function(a, b, c) {
        this.parentMenu = b;
        this.el || this.render();
        !1 !== c &&
            (this.fireEvent("beforeshow", this), a = this.el.adjustForConstraints(a));
        this.clientHeight = Ext.lib.Dom.getViewHeight();
        b = void 0 === this.MaxHeight ? this.clientHeight - a[1] - this.TopAndBottomSpace : this.MaxHeight - this.TopAndBottomSpace;
        c = this.ul.getHeight();
        var d = this.ul.dom.childNodes;
        if ((c > b || !0 === this.addedScrolling) && 1 < d.length) {
            var e = 0;
            if (this.SaveState)
                for (var f = 0; f < this.lastChild; f++) e += Ext.get(d[f]).getHeight();
            var g = 0,
                f = 0;
            for (len = d.length; 0 <= f && f < len; f++) {
                var h = Ext.get(d[f]),
                    g = g + h.getHeight();
                if (g >
                    b + e) {
                    this.ul.setHeight(g - h.getHeight());
                    this.nextChild = f;
                    break
                }
            }
            this.SaveState || (this.ul.scrollTo("top", 0), this.lastChild = 0)
        }
        c > b && !0 !== this.addedScrolling && 1 < d.length && (b = this.el.createChild({
                tag: "div",
                cls: "menu-scroll-bottom"
            }), b.addClassOnOver("x-menu-item-active menu-scroll-over"), b.on({
                mouseover: {
                    fn: this.startScrollBottom,
                    scope: this,
                    options: {
                        delay: this.scrollRepeatInterval,
                        scope: this
                    }
                },
                mouseout: {
                    fn: this.stopScrolling,
                    scope: this,
                    options: {
                        scope: this
                    }
                }
            }), c = this.el.insertFirst({
                tag: "div",
                cls: "menu-scroll-top"
            }),
            c.addClassOnOver("x-menu-item-active menu-scroll-over"), c.on({
                mouseover: {
                    fn: this.startScrollTop,
                    scope: this,
                    options: {
                        delay: this.scrollRepeatInterval,
                        scope: this
                    }
                },
                mouseout: {
                    fn: this.stopScrolling,
                    scope: this,
                    options: {
                        scope: this
                    }
                }
            }), this.ul.on("mousewheel", this.onWheel, this), this.scrollBottom = b, this.scrollTop = c, this.addedScrolling = !0, this.lastChild = 0);
        this.el.setXY(a);
        this.el.show();
        this.hidden = !1;
        this.focus();
        this.fireEvent("show", this)
    }
});
Sfdc.scrollIntoViewWindow = function(a, b, c) {
    var d = Ext.getBody();
    a = Ext.get(a);
    b || (b = 0);
    c || (c = {});
    Ext.applyIf(c, {
        top: 0,
        left: 0,
        bottom: 0,
        right: 0
    });
    var e = a.getBox(),
        f = e.y,
        e = f + e.height,
        g = d.getScroll().top,
        h = d.getViewSize().height,
        l = g + c.top,
        g = g + h - c.bottom;
    a.dom.offsetHeight > g - l || f < l ? Sfdc.scrollWindowY(Math.max(f - (b + c.top), 0), {
        easing: "easeOutStrong",
        duration: 0.3
    }) : e > g && (b = Math.min(e + b + c.bottom - h, d.getHeight()), Sfdc.scrollWindowY(b, {
        easing: "easeOutStrong",
        duration: 0.3
    }))
};
Sfdc.JsonStore = Ext.extend(Ext.data.JsonStore, {
    filterBy: function(a, b, c) {
        this.snapshot = this.snapshot || this.data;
        this.data = this.queryBy(a, b || this);
        c || this.fireEvent("datachanged", this)
    },
    getItems: function (a) {
        if (!Ext.isArray(a)) {
            var b = this.getById(a);
            this.isFiltered() && !b && (this.clearFilter(!0), b = this.getById(a), this.filterBy(this.filterFn, null, !0));
            return [b]
        }
        b = a.collect(function(a) {
            return this.getById(a)
        }, this);
        this.isFiltered() && !b.all() && (this.clearFilter(!0), b = a.collect(function(a) {
                return this.getById(a)
            },
            this), this.filterBy(this.filterFn, null, !0));
        return b
    }
});
Sfdc.dd.ContainerDropZone = Ext.extend(Sfdc.dd.DelegatedDropZone, {
    getTargetFromItem: function(a, b) {
        var c = this.getContainer().items.findIndex("id", a, 0, !1, !0),
            d = this.getContainer().getComponent(c);
        if (d) {
            var e = d.getBox();
            return b < e.y + e.height / 2 ? 1 < c ? this._getTarget("below", this.getContainer().getComponent(c - 1)) : this._getTarget("columnHead", !0) : this._getTarget("below", d)
        }
    },
    getContainer: function() {}
});
Sfdc.GrayingDragZone = Ext.extend(Ext.dd.DragZone, {
    clearOnSuccessfulDrop: !1,
    scroll: !1,
    onStartDrag: function(a, b) {
        this.setDelta(-5, -5);
        this.dragData.sourceEl && (this.shouldGray_cache = this.shouldGray(this.dragData)) && this.dragData.sourceEl.setOpacity(0.4)
    },
    onBeforeDrag: function(a, b) {
        Ext.isGecko && (a.ddel.firstChild.innerHTML += "\x26nbsp;");
        return Sfdc.GrayingDragZone.superclass.onBeforeDrag.apply(this, arguments)
    },
    afterDragDrop: function(a, b, c) {
        this.clearOnSuccessfulDrop && this.shouldGray_cache && (delete this.shouldGray_cache,
            this.dragData.sourceEl.clearOpacity())
    },
    afterRepair: function() {
        Sfdc.GrayingDragZone.superclass.afterRepair.call(this);
        this.dragData.sourceEl && this.shouldGray_cache && (delete this.shouldGray_cache, this.dragData.sourceEl.clearOpacity())
    },
    shouldGray: function(a) {
        return !0
    }
});
Sfdc.PageBlock = Ext.extend(Ext.Container, {
    baseCls: "bPageBlock",
    headerAsText: !0,
    buttonAlign: "right",
    autoEl: !1,
    onRender: function(a, b) {
        Sfdc.PageBlock.superclass.onRender.call(this, a, b);
        var c = a;
        this.paletteClass && (this.el = a.createChild({
            tag: "div",
            id: this.id,
            cls: "individualPalette"
        }), c = this.el.createChild({
            tag: "div",
            cls: this.paletteClass
        }));
        c = c.createChild({
            tag: "div",
            cls: "bPageBlock secondaryPalette"
        }, b);
        this.el || (this.el = c, c.id = this.id);
        this.cls && this.el.addClass(this.cls);
        this.headerBlock = c.createChild({
            tag: "div",
            cls: "pbHeader"
        });
        Sfdc.PageBlock.headerTpl.append(this.headerBlock, this);
        this.body = c.createChild({
            tag: "div",
            cls: "pbBody"
        });
        c.createChild({
            tag: "div",
            cls: "pbFooter secondaryPalette",
            children: [{
                tag: "div",
                cls: "bg"
            }]
        })
    },
    getLayoutTarget: function() {
        return this.body
    },
    setTitle: function(a) {
        this.title = a;
        this.rendered && this.headerBlock.child("h3").update(this.title)
    },
    setButtons: function(a) {
        this.buttons = a;
        this.rendered && Sfdc.PageBlock.headerTpl.overwrite(this.headerBlock, this)
    }
});
Sfdc.PageBlock.headerTpl = (new Ext.XTemplate("\x3ctable\x3e", '\x3ctr\x3e\x3ctd class\x3d"pbTitle"\x3e\x3ch3\x3e{title}\x3c/h3\x3e\x3c/td\x3e', '\x3ctd class\x3d"pbButtons"\x3e{[this.renderButtons(values.buttons)]}\x3c/td\x3e', "\x3c/tr\x3e\x3c/table\x3e", {
    renderButtons: function(a) {
        if (a) {
            if ("string" == typeof a) return a;
            if ("object" == typeof a) return Ext.DomHelper.markup(a)
        } else return ""
    }
})).compile();
Ext.reg("pageBlock", Sfdc.PageBlock);
Sfdc.SimpleButton = Ext.extend(Ext.Component, {
    disabled: !1,
    autoEl: !1,
    initComponent: function() {
        Sfdc.SimpleButton.superclass.initComponent.call(this);
        this.addEvents("click", "mouseover", "mouseout")
    },
    onRender: function(a, b) {
        this.template || (Sfdc.SimpleButton.buttonTemplate || (Sfdc.SimpleButton.buttonTemplate = new Ext.Template('\x3cdiv id\x3d"{2}" class\x3d"simpleButton{1}"\x3e{0}\x3c/div\x3e')), this.template = Sfdc.SimpleButton.buttonTemplate);
        var c = [this.text || "\x26#160;", this.cls ? " " + this.cls : "", this.id || Ext.id()];
        this.el = b ? this.template.insertBefore(b, c, !0) : this.template.append(a, c, !0);
        this.disabled && this.el.addClass(this.disabledClass);
        this.el.on({
            click: this.onClick,
            mouseover: this.onMouseOver,
            mouseout: this.onMouseOut,
            scope: this
        })
    },
    onDisable: function() {
        this.el.addClass(this.disabledClass);
        this.disabled = !0
    },
    onEnable: function() {
        this.el.removeClass(this.disabledClass);
        this.disabled = !1
    },
    onClick: function(a) {
        this.disabled || (this.fireEvent("click", this, a), this.handler && this.handler.call(this.scope || this, this, a))
    },
    onMouseOver: function(a) {
        a.within(this.el, !0) || (this.fireEvent("mouseover", this, a), this.overCls && this.el.addClass(this.overCls))
    },
    onMouseOut: function(a) {
        a.within(this.el, !0) || (this.fireEvent("mouseout", this, a), this.overCls && this.el.removeClass(this.overCls))
    },
    setHandler: function(a, b) {
        this.handler = a;
        this.scope = b
    }
});
Ext.reg("simplebutton", Sfdc.SimpleButton);
Sfdc.MockField = Ext.extend(Ext.form.Field, {
    defaultAutoCreate: {
        name: ""
    },
    disabled: !0,
    disabledClass: "",
    initValue: Ext.emptyFn,
    getAutoCreate: function() {
        var a = Sfdc.MockField.superclass.getAutoCreate.apply(this, arguments);
        a.html = this.html;
        return a
    }
});
Ext.reg("mockfield", Sfdc.MockField);
Sfdc.layout.CanvasDropTarget = function(a, b) {
    var c = Ext.fly(a.getEl());
    Sfdc.layout.CanvasDropTarget.superclass.constructor.call(this, c, b);
    this.canvas = a;
    this.canvas.dropZone = new(b && b.dropZoneConstructor ? b.dropZoneConstructor : Sfdc.layout.CanvasDropZone)(this.canvas)
};
Ext.extend(Sfdc.layout.CanvasDropTarget, Sfdc.dd.DelegatingDropTarget, {
    getTarget: function(a, b, c) {
        if (!Ext.dd.DragDropMgr.isInFloating(b.getPoint())) return Ext.isIE && !b.getTarget() && b.setEvent(b.browserEvent), this.getDropZone(c, b)
    },
    getDropZone: function(a, b) {
        switch (this.getType(a)) {
            case "section":
                return this.getLayoutDropZone(b);
            case "list":
                return this.canvas.dropZone;
            case "relatedContentItem":
                var c = this.getDropZoneSection(b, this.canvas.relatedContentWrapper);
                c || (c = this.getDropZoneSection(b, this.canvas.layoutSection));
                if (c) return c.dropZone;
                break;
            default:
                if (b.within(this.canvas.layoutSection.buttonSection.getEl())) return this.canvas.layoutSection.buttonSection.dropZone;
                if (b.within(this.canvas.layoutSection.quickActionSection.getEl())) return this.canvas.layoutSection.quickActionSection.dropZone;
                if (c = VFEditor.showRelatedContentSection && b.within(this.canvas.relatedContentWrapper.relatedContentSection.getEl()) ? this.getDropZoneSection(b, this.canvas.relatedContentWrapper) : this.getDropZoneSection(b, this.canvas.layoutSection)) return c.dropZone
        }
    },
    getLayoutDropZone: function(a) {
        return this.canvas.layoutSection.dropZone
    },
    getDropZoneSection: function(a, b) {
        var c = b.findBy(function(b) {
            return a.within(b.getEl())
        });
        return 0 < c.length ? c[0] : null
    },
    getType: function(a) {
        return "layout" == a.source || "trough" == a.source && a.itemIds[0] == Sfdc.layout.Trough.SECTION_ID ? "section" : "canvas" == a.source || "trough" == a.source && 0 < a.categories.length && 0 <= a.categories[0].indexOf("RelatedList") ? "list" : "relatedContent" == a.source || "trough" == a.source && 0 < a.categories.length && 0 <= a.categories[0].indexOf("RelatedLookup") ?
            "relatedContentItem" : "field"
    }
});

function initializeCanvasDragZone(a) {
    a.dragZone = new Sfdc.GrayingDragZone(a.bodyPanel.body, {
        getDragData: function(b) {
            if (b = b.getTarget(".handle"))
                if (b = Ext.fly(b).parent(".relatedList")) {
                    var c = a.bodyPanel.getComponent(Sfdc.layout.Section.getItemId(b.id)),
                        d = document.createElement("DIV");
                    d.appendChild(document.createTextNode(Ext.util.Format.htmlDecode(c.body.title)));
                    d.id = Ext.id();
                    var e = document.createElement("DIV");
                    e.className = "marker";
                    e.appendChild(d);
                    return {
                        source: "canvas",
                        sourceEl: b,
                        repairXY: b.getXY(),
                        ddel: e,
                        itemIds: [c.id]
                    }
                }
        },
        getRepairXY: function() {
            return this.dragData.repairXY
        },
        onDrag: function(a) {
            Sfdc.layout.Trough.highlightDropSection("StandardRelatedList")
        },
        afterDragDrop: function(a, c, d) {
            Sfdc.layout.Trough.clearDropSection()
        }
    })
}
Sfdc.layout.CanvasDropZone = function(a) {
    this.canvas = a
};
Ext.extend(Sfdc.layout.CanvasDropZone, Sfdc.dd.ContainerDropZone, {
    getTargetFromEvent: function(a) {
        var b = a.getTarget(".relatedList"),
            c = Ext.lib.Event.getPageY(a);
        if (b) return this.getTargetFromItem(Sfdc.layout.Section.getItemId(b.id), c);
        if (a.getTarget("#targetPanel")) {
            var d = 0;
            a = this.canvas.bodyPanel.items.find(function(a) {
                d++;
                return a.getEl().getBottom() >= c
            });
            d < this.canvas.getRLHeaderIndex() && (a = this.canvas.bodyPanel.getComponent(this.canvas.getRLHeaderIndex() + 1));
            return a ? (a = this.canvas.bodyPanel.items.indexOf(a),
                1 < a ? this._getTarget("below", this.canvas.bodyPanel.getComponent(a - 1)) : this._getTarget("columnHead", !0)) : 1 >= this.canvas.bodyPanel.items.getCount() ? this._getTarget("columnHead", !0) : this._getTarget("below", this.canvas.bodyPanel.items.last())
        }
    },
    getContainer: function() {
        return this.canvas.bodyPanel
    },
    mark: function(a) {
        a.below ? a.below.addClass("marked") : Ext.isEmpty(a.columnHead) || (1 < this.canvas.bodyPanel.items.getCount() ? this.canvas.bodyPanel.getComponent(1).addClass("markedAbove") : this.canvas.bodyPanel.getComponent(0).addClass("marked"))
    },
    unmark: function(a) {
        a.below ? a.below.removeClass("marked") : Ext.isEmpty(a.columnHead) || (1 < this.canvas.bodyPanel.items.getCount() ? this.canvas.bodyPanel.getComponent(1).removeClass("markedAbove") : this.canvas.bodyPanel.getComponent(0).removeClass("marked"))
    },
    onNodeEnter: function(a, b, c, d) {
        this.mark(a)
    },
    onNodeOut: function(a, b, c, d) {
        this.unmark(a)
    },
    onNodeOver: function(a, b, c, d) {
        return a.below ? this.canvas.bodyPanel.items.findIndex("id", a.below.id, 0, !1, !0) < this.canvas.getRLHeaderIndex() ? !1 : this.dropAllowed : !1
    },
    onNodeDrop: function(a, b, c, d) {
        b = {
            itemIds: d.itemIds
        };
        if ("trough" == d.source) b.type = "Add";
        else if ("canvas" == d.source) b.type = "Move";
        else return !1;
        a.below ? this.canvas.addCanvasData(b, a.below.id) : a.columnHead && this.canvas.addCanvasData(b, !1);
        return this.canvas.handler.perform(b)
    }
});
Sfdc.layout.Canvas = function(a, b) {
    if (!b.store) throw "Programmer error, no store provided to Canvas";
    this.store = b.store;
    this.handler = a;
    this.fillerRl = {
        xtype: "fieldset",
        cls: "rlDrop",
        id: "fillerRl",
        defaults: {
            xtype: "textfield"
        }
    };
    this.handler && a.addObserver(this);
    Sfdc.layout.Canvas.superclass.constructor.call(this, b);
    this.bodyPanel = new Ext.Panel({
        baseCls: "canvasBodyPanel",
        getSectionComponent: function(a) {
            var b = null;
            this.items.each(function(e) {
                if (!b && e && e.getSectionComponent) b = e.getSectionComponent(a);
                else if (b) return !1
            });
            return b
        }
    });
    this.add(this.bodyPanel);
    this.layoutConstructor = b.layoutConstructor || Sfdc.layout.Layout;
    this.dropTargetConstructor = b.dropTargetConstructor || Sfdc.layout.CanvasDropTarget;
    b.data ? this.load(b.data) : (Sfdc.Perf.mark("layoutdone").mark("layoutadded"), this.layoutSection = new this.layoutConstructor(this.handler, {
        store: this.store
    }), Sfdc.Perf.endMark("layoutdone"), this.bodyPanel.add(this.layoutSection), Sfdc.Perf.endMark("layoutadded"));
    this.isRLDirty = !1;
    this.winScontrolProps = new Sfdc.layout.ScontrolPropertiesWindow({
        handler: this.handler,
        store: this.store
    });
    Ext.reg("canvas", Sfdc.layout.Canvas)
};
Ext.extend(Sfdc.layout.Canvas, Ext.Panel, {
    xtype: "canvas",
    deferHeight: !1,
    topMargin: 170,
    initEvents: function() {
        Sfdc.layout.Canvas.superclass.initEvents.apply(this, arguments);
        if (this.handler) this.body.on({
            dblclick: this.onDblClick,
            scope: this
        })
    },
    saveAs: function() {
        this.isSaveAs = !0;
        this.showLayoutProps(null, null, !0);
        var a = function(a) {
            VFEditor.getCommand("saveAs")();
            this.isSaveAs = !1
        };
        this.winLayoutProps.on({
            ok: a,
            hide: function(b) {
                b.un("ok", a);
                this.isSaveAs = !1
            }
        })
    },
    showLayoutProps: function(a, b, c) {
        this.winLayoutProps ||
            (this.winLayoutProps = new Sfdc.layout.LayoutPropertiesWindow({
                store: this.store,
                handler: this.handler,
                showTagging: !Ext.isEmpty(this.layoutSection.taggingInfo),
                showPublicTagging: !Ext.isEmpty(this.layoutSection.taggingInfo) && this.layoutSection.taggingInfo.publicAllowed,
                specialOptions: this.layoutSection.specialOptions,
                layoutNameEditable: this.layoutSection.layoutNameEditable,
                namespacePrefix: this.layoutSection.namespacePrefix,
                layoutPackageLink: this.layoutSection.layoutPackageLink
            }));
        this.winLayoutProps.setIsSaveAs(c);
        this.winLayoutProps.show();
        a = this.layoutSection.taggingInfo;
        var d = {
            name: c ? LC.getLabel("LayoutDND", "SaveAsDefaultName", this.layoutSection.name) : this.layoutSection.name
        };
        this.layoutSection.showClearUserLists && (d.clearUserLists = this.layoutSection.clearUserLists);
        a && (d.publicTags = a.hasPublic && a.publicAllowed, d.privateTags = a.hasPrivate && a.privateAllowed);
        this.layoutSection.specialOptions && this.layoutSection.specialOptions.each(function(a) {
            d[a.id] = a.value
        });
        this.winLayoutProps.loadData(d, a)
    },
    onCategoryChange: function(a,
        b) {
        var c = this.topMargin + 30;
        switch (a.getRecord(b[0]).data.name) {
            case "RelatedList":
                Ext.getBody().getScroll().top < this.layoutSection.getEl().getBottom() - c && Sfdc.scrollWindowY(this.relatedListHeader.getEl().getTop() - c, !0);
                break;
            case "Button":
            case "QuickAction":
                Ext.getBody().getScroll().top > this.layoutSection.getEl().getTop() - c && Sfdc.scrollWindowY(this.layoutSection.getEl().getTop() - c, !0);
                break;
            case "CustomLink":
                c = this.layoutSection.items.find(function(a) {
                    return "CustomLink" in a.categoriesAllowed
                });
                Sfdc.scrollIntoViewWindow(c.getEl(),
                    15, {
                        top: this.topMargin
                    });
                break;
            case "RelatedLookup":
            case "Aura":
                Sfdc.scrollWindowY(this.relatedContentWrapper.getEl().getTop() - c, !0);
                break;
            case "Field":
            case "Analytics":
            case "Page":
            case "Canvas":
                Ext.getBody().getScroll().top > this.layoutSection.getEl().getTop() - c && Sfdc.scrollWindowY(this.layoutSection.getEl().getTop() - c, !0);
                break;
            default:
                Ext.getBody().getScroll().top > this.getComponent(1).getEl().getBottom() - (c + 1) && Sfdc.scrollWindowY(0, !0)
        }
    },
    onDblClick: Ext.emptyFn,
    showRelatedListPropertiesWindow: function(a) {
        this._getStoreItems(a)[0].data.listCustomizable &&
            (this.rlPropsWindow = new Sfdc.layout.RelatedListPropertiesWindow({
                relatedList: Ext.getCmp(a),
                handler: this.handler,
                listeners: {
                    render: function() {
                        Ext.dd.ScrollManager.unregister(this.bodyScroll)
                    },
                    close: function() {
                        Ext.dd.ScrollManager.register(this.bodyScroll)
                    },
                    scope: this
                }
            }), this.rlPropsWindow.show())
    },
    setPaletteClass: function(a) {
        a && (this.paletteClass = a);
        this.rendered && (this.getEl().addClass("individualPalette"), this.body.addClass(this.paletteClass))
    },
    onRender: function() {
        Sfdc.layout.Canvas.superclass.onRender.apply(this,
            arguments);
        this.paletteClass && this.setPaletteClass();
        this.handler && (this.dropTarget = new this.dropTargetConstructor(this), this.bodyPanel.on("render", initializeCanvasDragZone.curry(this)));
        this.bodyScroll = new Sfdc.lib.BodyScrollEl;
        Ext.dd.ScrollManager.register(this.bodyScroll);
        this.headerSection = new Ext.BoxComponent({
            title: this.title,
            taggingInfo: this.taggingInfo,
            handler: this.handler,
            autoEl: !1,
            tpl: (new Ext.XTemplate('\x3ctpl if\x3d"values.title"\x3e', '\x3cdiv class\x3d"secondaryPalette"\x3e', '\x3ch1 class\x3d"title"\x3e{[this.getTitle(values)]}\x3c/h1\x3e',
                "\x3c/div\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"privateTags || publicTags"\x3e', '\x3cdiv class\x3d"metadata"\x3e\x3cdiv class\x3d"tagHeader"\x3e', '\x3cimg width\x3d"16" height\x3d"16" alt\x3d"" src\x3d"/img/icon/tagEdit16.gif"/\x3e', '\x3cspan class\x3d"editTags"\x3e', LC.getLabel("BrowseTags", "pageTitle"), "\x3c/span\x3e", '\x3cspan class\x3d"tagHeaderLists x-unselectable"\x3e', '\x3ctpl if\x3d"privateTags"\x3e\x3cspan\x3e', '\x3cimg class\x3d"tagHeaderImg" width\x3d"16" height\x3d"16" src\x3d"/img/icon/personal_tag16.gif"/\x3e',
                '\x3cspan class\x3d"myTags"\x3e', LC.getLabel("Global", "labelWithColon", LC.getLabel("TagHeader", "personal")), " \x3c/span\x3e", '\x3cspan class\x3d"tagList"\x3e', LC.getLabel("LayoutDND", "sampleTag"), "\x3c/span\x3e", "\x3c/span\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"publicTags"\x3e\x3cspan\x3e', '\x3cspan class\x3d"myTags"\x3e\x26emsp;\x3c/span\x3e', '\x3cspan class\x3d"myTags"\x3e', LC.getLabel("Global", "labelWithColon", LC.getLabel("TagHeader", "public")), " \x3c/span\x3e", '\x3cspan class\x3d"tagList"\x3e', LC.getLabel("LayoutDND",
                    "sampleTag"), "\x3c/span\x3e", "\x3c/span\x3e\x3c/tpl\x3e\x3c/span\x3e", "\x3c/div\x3e\x3c/div\x3e\x3c/tpl\x3e", {
                    getTitle: function(a) {
                        return a.title ? Ext.util.Format.htmlEncode(a.title) : "\x26nbsp;"
                    }
                })).compile(),
            initComponent: function() {
                this.addEvents(["tagDblClick"])
            },
            onRender: function(a, b) {
                Ext.BoxComponent.prototype.onRender.apply(this, arguments);
                this.el = a.createChild({
                    tag: "div",
                    cls: "bPageTitle headerSection",
                    id: this.id
                });
                this._update()
            },
            _update: function() {
                this.tpl.overwrite(this.el, {
                    title: this.title,
                    publicTags: this.taggingInfo && this.taggingInfo.hasPublic,
                    privateTags: this.taggingInfo && this.taggingInfo.hasPrivate
                });
                if (this.handler) {
                    var a = this.el.child(".tagHeaderLists");
                    a && (Ext.QuickTips.register({
                        target: a,
                        text: LC.getLabel("LayoutDND", "TagInfo")
                    }), Ext.fly(a).addClassOnOver("tagHover"), Ext.fly(a).on("dblclick", function(a) {
                        this.fireEvent("tagDblClick")
                    }, this), Ext.fly(a).on("selectstart", function(a) {
                        a.stopEvent()
                    }, this))
                }
            },
            setTitle: function(a) {
                this.title = a;
                this.rendered && this._update()
            },
            setTaggingInfo: function(a) {
                this.taggingInfo =
                    a;
                this.rendered && this._update()
            }
        });
        this.insert(0, this.headerSection);
        this.headerSection.on("tagDblClick", this.onTagDblClick, this)
    },
    onTagDblClick: function(a) {
        this.showLayoutProps(null, null, !1)
    },
    onDestroy: function() {
        Ext.dd.ScrollManager.unregister(this.bodyScroll);
        this.handler && (Ext.destroy(this.dragZone, this.dropZone), this.handler.removeObserver(this));
        Sfdc.layout.Canvas.superclass.onDestroy.apply(this, arguments)
    },
    onWindowResize: function(a, b) {
        this.setHeight(b - (this.getEl().getY() + 20))
    },
    _getStoreItems: function(a) {
        return this.store.getItems(a)
    },
    addCanvasData: function(a, b) {
        a.canvasData = {};
        a.canvasData.insertAt = !1 !== b ? this.bodyPanel.items.findIndex("id", b, 0, !1, !0) : 0;
        a.canvasData.insertAt < this.getRLHeaderIndex() && (a.canvasData.insertAt = this.getRLHeaderIndex());
        window.dragDropMap && window.dragDropMap.StandardRelatedList && (a.canvasData.className = window.dragDropMap.StandardRelatedList)
    },
    acceptMessage: function(a) {
        return "SetRelatedListProperties" == a.type || !Ext.isEmpty(a.canvasData)
    },
    action_doAdd: function(a, b) {
        if (b) {
            for (var c = 0; c < a.itemIds.length; c++) {
                var d =
                    this.bodyPanel.getComponent(a.canvasData.insertAt + 1);
                this.bodyPanel.remove(d)
            }
            a.canvasData.madeDirty && (this.isRLDirty = !1);
            this.doLayout()
        } else {
            var e = [];
            this._getStoreItems(a.itemIds).each(function(b, c) {
                var d = new Sfdc.layout.RelatedList({
                    handler: this.handler,
                    store: this.store,
                    id: b.id,
                    item: b,
                    cls: b.className ? b.className : a.canvasData.className
                });
                d.load();
                this.bodyPanel.insert(a.canvasData.insertAt + 1 + c, d);
                e.push(d)
            }, this);
            this.bodyPanel.doLayout();
            e.each(function(a) {
                a.getEl().fadeIn()
            });
            this.isRLDirty ||
                (this.isRLDirty = a.canvasData.madeDirty = !0);
            (c = this.bodyPanel.findById("fillerRl")) && this.bodyPanel.remove(c)
        }
    },
    action_doRemove: function(a, b) {
        if (b) {
            var c = Sfdc.layout.RelatedList.newAndLoad(this.handler, this.store, a.listData.old);
            this.bodyPanel.insert(a.canvasData.old.insertAt, c);
            this.bodyPanel.doLayout()
        } else c = this.findById(a.itemIds[0]), a.listData || (a.listData = {}), a.listData.old = c.save(), a.canvasData || (a.canvasData = {}), a.canvasData.old = {
                insertAt: this.bodyPanel.items.findIndex("id", c.id, 0, !1, !0)
            },
            c.getEl().fadeOut({
                remove: !0
            }), this.bodyPanel.remove(c, !1), 1 === Ext.query(".rlDrop").length && (this.bodyPanel.add(this.fillerRl), this.bodyPanel.doLayout())
    },
    action_doMove: function(a, b) {
        if (b) {
            var c = a.canvasData.insertAt;
            c < a.canvasData.old.insertAt && c++;
            a.canvasData.madeDirty && (this.isRLDirty = !1);
            e = this.bodyPanel.getComponent(c);
            c = e.save();
            this.bodyPanel.remove(e);
            this.bodyPanel.insert(a.canvasData.old.insertAt, Sfdc.layout.RelatedList.newAndLoad(this.handler, this.store, c))
        } else {
            var d = this.bodyPanel.items.findIndex("id",
                a.itemIds[0], 0, !1, !0);
            if (a.canvasData.insertAt == d || a.canvasData.insertAt == d - 1) return !0;
            var e = this.bodyPanel.getComponent(d);
            a.canvasData.old = {
                insertAt: d
            };
            this.isRLDirty || (this.isRLDirty = a.canvasData.madeDirty = !0);
            c = e.save();
            this.bodyPanel.remove(e);
            e = a.canvasData.insertAt;
            e < d && e++;
            d = this.getRLHeaderIndex();
            d >= e && (e = d + 1);
            c.className = window.dragDropMap.StandardRelatedList;
            this.bodyPanel.insert(e, Sfdc.layout.RelatedList.newAndLoad(this.handler, this.store, c))
        }
        this.bodyPanel.doLayout()
    },
    action_doSetRelatedListProperties: function(a,
        b) {
        var c = "customizedColumns sortColumn sortDesc customListButtonsAdded stdListButtonsRevoked applyToOtherLayoutsData".split(" ");
        if (b) d = this._getStoreItems(a.itemId)[0], c.each(function(b) {
            d.data[b] = a.old[b]
        });
        else {
            var d = this._getStoreItems(a.itemId)[0];
            a.old = [];
            c.each(function(b) {
                a.old[b] = d.data[b];
                d.data[b] = a[b]
            })
        }
        this._refreshList(a.itemId, d)
    },
    _refreshList: function(a, b) {
        var c = this.bodyPanel.items.findIndex("id", a, 0, !1, !0);
        this.bodyPanel.remove(this.bodyPanel.getComponent(c));
        var d = new Sfdc.layout.RelatedList({
            handler: this.handler,
            store: this.store,
            id: b.id,
            item: b
        });
        d.load();
        this.bodyPanel.insert(c, d);
        this.bodyPanel.doLayout()
    },
    preSave: function (a, b, c) {
        alert(123)
        var d = a.bind(b);
        if (this.layoutSection.showClearUserLists && !this.isSaveAs && this.isRLDirty) var e = ['\x3cdiv class\x3d"alertText"\x3e', LC.getLabel("LayoutDND", "OverwriteRLCustInfo"), '\x3c/div\x3e\x3cdiv class\x3d"alertText"\x3e', LC.getLabel("LayoutDND", "OverwriteRLCustQuestion"), "\x3c/div\x3e"].join(""),
            d = function() {
                Ext.Msg.show({
                    title: LC.getLabel("LayoutDND", "OverwriteRLCustTitle"),
                    msg: e,
                    buttons: Ext.Msg.YESNOCANCEL,
                    fn: function(d) {
                        "yes" == d ? (this.layoutSection.clearUserLists = !0, a.call(b), this.layoutSection.clearUserLists = !1) : "no" == d ? a.call(b) : c && this.handler.undoLast(!0)
                    }.bind(this),
                    animEl: "elId",
                    icon: Ext.Msg.QUESTION,
                    width: 400
                })
            }.bind(this);
        var g = this.layoutSection.findControllersAndDependents(),
            f = g.dependentItems.collect(function(a) {
                return a.controllerIds.reject(function(a) {
                    return a in g.controllerIds
                })
            }).flatten();
        0 < f.length ? (f = this.store.getItems(f).reject(function(a) {
                return !a
            }).pluck("data").pluck("label").join(", "),
            Ext.Msg.confirm(LC.getLabel("Icon", "WARNING"), LC.getLabel("LayoutDND", "missingControllers", f), function(a) {
                "yes" == a ? d() : c && this.handler.undoLast(!0)
            }, this)) : d()
    },
    save: function (a) {
        this.isRLDirty = !1;
        var b;
        this.summaryLayout && (b = this.summaryLayout.save());
        a = this.layoutSection.save();
        a.summaryLayout = b;
        VFEditor.showRelatedContentSection && (a.relatedContent = this.relatedContentWrapper.save());
        a.quickActions = this.layoutSection.saveQuickActions();
        a.relatedLists = [];
        for (b = 1; b < this.bodyPanel.items.length; b++) {
            var c =this.bodyPanel.getComponent(b);
            0 <= c.id.indexOf(window.NewLayoutEditor.RL_ID_PREFIX) && a.relatedLists.push(c.save());
        }
        return a

    },
    setTitle: function(a) {
        this.title = a;
        this.rendered && this.headerSection.setTitle(a)
    },
    updateTags: function(a, b) {
        this.taggingInfo = b;
        this.rendered && this.headerSection.setTaggingInfo(b)
    },
    getClearUserLists: function() {
        return this.layoutSection.clearUserLists
    },
    load: function(a) {
        this.setPaletteClass(a.paletteClass);
        
        Sfdc.Perf.mark("layoutdone").mark("layoutadded");
        if (a.summaryLayout) {
            var b =
                new Sfdc.PageBlock({
                    cls: "hpPageBlock"
                });
            b.setTitle(LC.getLabel("LayoutDND", "HighlightsPanel"));
            this.insert(0, b);
            this.summaryLayout = "CaseInteraction" === a.summaryLayout.style ? new Sfdc.layout.CaseInteractionSummaryLayoutSection(this.handler, this.store, a.summaryLayout, a.layoutName) : new Sfdc.layout.SummaryLayoutSection(this.handler, this.store, a.summaryLayout, a.layoutName);
            this.insert(1, this.summaryLayout)
        }
        //debugger;
        this.layoutSection = new this.layoutConstructor(this.handler, {
            data: a,
            store: this.store,
            listeners: {
                updatetags: this.updateTags,
                scope: this
            }
        });
        Sfdc.Perf.endMark("layoutdone");
        this.bodyPanel.add(this.layoutSection);
        VFEditor.showRelatedContentSection && a.relatedContent && (this.relatedContentWrapper = new Sfdc.layout.RelatedContentWrapper(this.handler, {
            data: a.relatedContent,
            store: this.store,
            listeners: {
                updatetags: this.updateTags,
                scope: this
            }
        }), this.bodyPanel.add(this.relatedContentWrapper));
        Sfdc.Perf.endMark("layoutadded");
        var c = !1;

        window.categoryData && (b = Sfdc.layout.buildItemStore(),b = Sfdc.layout.buildCategoryStore(b, categoryData),
        Ext.each(b.data.items, function(a, b) {
            if ((VFEditor.showTroughSelector || 0 === b) && "RelatedList" == a.id) return c = !0, !1
        }));

        c && (Sfdc.Perf.mark("rldone")),
        this.relatedListHeader = new Ext.Component({
            cls: "pbTitle relatedList",
            autoEl: {
                tag: "div",
                html: "\x3ch3\x3e" + LC.getLabel("LayoutDND", "CategoryRelatedList") + "\x3c/h3\x3e"
            }
        }),
        this.bodyPanel.add(this.relatedListHeader),console.log(a),
        !a.relatedLists || 0 === a.relatedLists.length ? this.bodyPanel.add(this.fillerRl) : (listItems = this.store.query("category", /StandardRelatedList|CustomRelatedList/),
        a.relatedLists.each(function (a, b) {
            if (listItems.get(a.id)) {
                listItems.get(a.id).data.state = "used";
            } else {
                alert('relatedLists错误id='+a.id)
            }
           var c = new Sfdc.layout.RelatedList({
               handler: this.handler,
               store: this.store,
               id: a.id,
               cls: a.className
           });
           c.load(a);
           this.bodyPanel.add(c)
        },
        this)),
        Sfdc.Perf.endMark("rldone");
        this.setTitle(a.title);
        this.updateTags(null, a.taggingInfo);
        this.store.fireEvent("dataChanged")
      
        
    },
    getRLHeaderIndex: function() {
        var a = this.relatedListHeader.id;
        return this.bodyPanel.items.findIndexBy(function(b) {
            return b.id === a
        })
    }
});
Sfdc.layout.PropertiesWindow = function(a) {
    Ext.applyIf(a, {
        keys: {
            key: Ext.EventObject.ENTER,
            handler: this.saveChanges,
            scope: this
        },
        buttonAlign: "center",
        buttons: [{
            text: LC.getLabel("Buttons", "ok"),
            id: a.idPrefix ? a.idPrefix + "_propWindowOkBtn" : void 0,
            handler: this.saveChanges,
            scope: this
        }, {
            text: LC.getLabel("Buttons", "cancel"),
            id: a.idPrefix ? a.idPrefix + "_propWindowCancelBtn" : void 0,
            handler: this.cancel,
            scope: this
        }]
    });
    Sfdc.layout.PropertiesWindow.superclass.constructor.apply(this, arguments);
    this.addListener({
        show: function(a) {
            a.data &&
                a.loadData.call(a, a.data);
            a.getEl().center();
            Ext.EventManager.on(window, "scroll", this.onWindowScroll, this);
            (a = this.getFocusComponent()) && a.focus("", 10)
        },
        hide: function(a) {
            Ext.EventManager.un(window, "scroll", this.onWindowScroll, this)
        },
        scope: this
    });
    this.store = a.store
};
Ext.extend(Sfdc.layout.PropertiesWindow, Ext.Window, {
    constrain: !0,
    layout: "fit",
    width: 350,
    closeAction: "hide",
    modal: !0,
    onRender: function() {
        Sfdc.layout.PropertiesWindow.superclass.onRender.apply(this, arguments);
        this.getEl().addClass("propsWindow")
    },
    onWindowScroll: function(a) {
        this.doConstrain()
    },
    saveChanges: Ext.emptyFn,
    loadData: Ext.emptyFn,
    getFocusComponent: Ext.emptyFn,
    cancel: function() {
        this.hide()
    }
});
Sfdc.layout.FieldPropertiesWindow = function(a) {
    Ext.applyIf(a, {
        title: LC.getLabel("LayoutDND", "FieldProperties"),
        idPrefix: "field"
    });
    Sfdc.layout.FieldPropertiesWindow.superclass.constructor.apply(this, arguments)
};
Ext.extend(Sfdc.layout.FieldPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    cls: "fieldProperties",
    autoScroll: !0,
    rowTemplate: (new Ext.XTemplate('\x3ctable cellpadding\x3d"0" cellspacing\x3d"0" class\x3d"bodyTable"\x3e\x3ctbody\x3e\x3ctr\x3e', '\x3ctd\x3e\x26nbsp;\x3c/td\x3e\x3cth scope\x3d"col"\x3e{[LC.getLabel("LayoutDND", "Readonly")]}\x3c/th\x3e\x3cth scope\x3d"row"\x3e{[LC.getLabel("LayoutDND", "Required")]}\x3c/th\x3e\x3c/tr\x3e', '\x3ctpl if\x3d"values.length \x26gt; 1"\x3e', '\x3ctr class\x3d"selectAll"\x3e\x3cth scope\x3d"row"\x3e{[LC.getLabel("LayoutField", "SelectAll")]}\x3c/th\x3e\x3ctd\x3e\x3cinput type\x3d"checkbox" name\x3d"field_ro_all" id\x3d"field_ro_all" title\x3d"{[LC.getLabel("LayoutDND", "MarkAllRO")]}"/\x3e',
        '\x3c/td\x3e\x3ctd\x3e\x3cinput type\x3d"checkbox" name\x3d"field_req_all" id\x3d"field_req_all" title\x3d"{[LC.getLabel("LayoutDND", "MarkAllReq")]}"/\x3e\x3c/td\x3e\x3c/tr\x3e', "\x3c/tpl\x3e", '\x3ctpl for\x3d"."\x3e', '\x3ctr\x3e\x3cth scope\x3d"row"\x3e{[Ext.util.Format.htmlEncode(values.staticData["label"])]}\x3c/th\x3e', '\x3ctd\x3e\x3cinput type\x3d"checkbox" name\x3d"ro_{id}" id\x3d"ro_{id}"  {[this.checked(values, "readonly")]}\x3e\x3c/td\x3e', '\x3ctd\x3e\x3cinput type\x3d"checkbox" name\x3d"req_{id}" id\x3d"req_{id}" {[this.checked(values, "required")]}\x3e\x3c/td\x3e',
        "\x3c/tr\x3e", "\x3c/tpl\x3e", "\x3c/tbody\x3e\x3c/table\x3e", {
            checked: function(a, b) {
                var c = "",
                    d = b.substring(0, 1).toUpperCase() + b.substring(1);
                if (a[b] || a.staticData["always" + d]) c += 'checked\x3d"checked" ';
                if (a.staticData["always" + d] || a.staticData["alwaysNot" + d]) c += 'disabled\x3d"disabled"';
                return c
            }
        })).compile(),
    onRender: function() {
        Sfdc.layout.FieldPropertiesWindow.superclass.onRender.apply(this, arguments);
        this.data && (this.rowTemplate.overwrite(this.body, this.data), this._gatherCheckboxes());
        this.getEl().on("click",
            this.validateRequired, this);
        this.on("show", this.onShow, this)
    },
    onShow: function() {
        this.data && this.setSize(460, Math.min(20 * (this.data.length + 1) + 110, 450))
    },
    _gatherCheckboxes: function() {
        this.data && (this.allReq = [], this.allRo = [], this.data.each(function(a) {
            this.allReq.push(Ext.getDom("req_" + a.id));
            this.allRo.push(Ext.getDom("ro_" + a.id))
        }, this))
    },
    setFields: function(a) {
        this.rendered && (this.rowTemplate.overwrite(this.body, a), this.setSize(350, Math.min(20 * a.length + 100, 400)));
        this.data = a;
        this.rendered && this._gatherCheckboxes()
    },
    selectBox: function(a, b) {
        var c = Ext.getDom((b ? "ro_" : "req_") + a);
        if (c.checked) {
            if (c.disabled) return !1;
            c.checked = !1;
            this.unselectBox(a, !b)
        }
        c = b ? this.allReq : this.allRo;
        1 < this.data.length && 0 === c.reject(function(a) {
            return a.checked || a.disabled
        }).length && (Ext.getDom(b ? "field_req_all" : "field_ro_all").checked = !0);
        return !0
    },
    unselectBox: function(a, b) {
        1 < this.data.length && (Ext.getDom(b ? "field_req_all" : "field_ro_all").checked = !1);
        return !0
    },
    handleSelectAll: function(a) {
        var b, c, d;
        if ("field_req_all" == a.id) b = this.allReq,
            c = 4, d = !0;
        else if ("field_ro_all" == a.id) b = this.allRo, c = 3, d = !1;
        else return !1;
        a.checked ? b.each(function(a) {
            !a.disabled && this.selectBox(a.id.substring(c), d) && (a.checked = !0)
        }, this) : b.each(function(a) {
            a.disabled || (a.checked = !1)
        }, this);
        return !0
    },
    validateRequired: function(a) {
        if ((a = a.getTarget("input")) && !this.handleSelectAll(a)) {
            var b = 0 === a.id.indexOf("req_"),
                c = b ? a.id.substring(4) : a.id.substring(3);
            return a.checked ? this.selectBox(c, b) : this.unselectBox(c, b)
        }
    },
    saveChanges: function() {
        var a = {
            type: "SetFieldProperties",
            fieldData: []
        };
        this.data.each(function(b) {
            b = {
                id: b.id,
                required: Ext.getDom("req_" + b.id).checked,
                readonly: Ext.getDom("ro_" + b.id).checked
            };
            a.fieldData.push(b)
        });
        this.hide();
        return this.handler.perform(a)
    }
});
Sfdc.layout.ScontrolPropertiesWindow = function(a) {
    Ext.applyIf(a, {
        title: LC.getLabel("LayoutDND", "SControlProperties"),
        cls: "scontrolProps",
        idPrefix: "sControlVf",
        items: {
            xtype: "form",
            labelSeparator: "",
            labelWidth: 150,
            items: [{
                fieldLabel: LC.getLabel("LayoutPages", "Width"),
                id: "scontrolWidth",
                name: "width",
                xtype: "textfield",
                validator: function(a) {
                    a = Sfdc.layout.FieldSection.encodeScontrolWidth(a);
                    return !1 === a ? LC.getLabel("LayoutPages", "InvalidWidth") : -100 > a ? LC.getLabel("LayoutPages", "WidthTooLarge") : !0
                }
            }, {
                fieldLabel: LC.getLabel("LayoutPages",
                    "Height"),
                id: "scontrolHeight",
                name: "height",
                xtype: "numberfield",
                maxLength: 10
            }, {
                fieldLabel: LC.getLabel("LayoutPages", "ShowScrollbars"),
                id: "scontrolShowScrollbars",
                name: "showScrollbars",
                xtype: "checkbox"
            }, {
                fieldLabel: LC.getLabel("LayoutPages", "ShowLabel"),
                id: "scontrolShowLabel",
                name: "showLabel",
                xtype: "checkbox"
            }]
        }
    });
    Sfdc.layout.ScontrolPropertiesWindow.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.layout.ScontrolPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    height: 200,
    width: 400,
    setFields: function(a) {
        if (1 < a.length) throw "Tried to edit more than one Page/Scontrol";
        a = a[0];
        this.rendered && this.loadData(a);
        this.data = a
    },
    loadData: function(a) {
        Ext.getCmp("scontrolHeight").setValue(a.height);
        Ext.getCmp("scontrolShowScrollbars").setValue(a.showScrollbars);
        Ext.getCmp("scontrolWidth").setValue(Sfdc.layout.FieldSection.decodeScontrolWidth(a.width));
        Ext.getCmp("scontrolShowLabel").setValue(a.showLabel)
    },
    saveChanges: function() {
        if (!this.getComponent(0).form.isValid()) return !1;
        var a = Ext.getCmp("scontrolHeight").getValue(),
            a = {
                type: "SetFieldProperties",
                fieldData: [{
                    id: this.data.id,
                    width: Sfdc.layout.FieldSection.encodeScontrolWidth(Ext.getCmp("scontrolWidth").getValue()),
                    height: "" === a ? a : parseInt(a, 10),
                    showScrollbars: Ext.getCmp("scontrolShowScrollbars").getValue(),
                    showLabel: Ext.getCmp("scontrolShowLabel").getValue()
                }]
            };
        this.hide();
        return this.handler.perform(a)
    }
});
Sfdc.layout.ControlPropertiesWindow = function(a) {
    Ext.applyIf(a, {
        title: LC.getLabel("LayoutDND", "ControlProperties"),
        cls: "scontrolProps",
        idPrefix: "controlVf",
        items: {
            xtype: "form",
            labelSeparator: "",
            labelWidth: 150,
            items: [{
                fieldLabel: LC.getLabel("LayoutPages", "ShowLabel"),
                id: "controlShowLabel",
                name: "showLabel",
                xtype: "checkbox"
            }]
        }
    });
    Sfdc.layout.ControlPropertiesWindow.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.layout.ControlPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    setFields: function(a) {
        if (1 < a.length) throw "Tried to edit more than one Control";
        a = a[0];
        this.rendered && this.loadData(a);
        this.data = a
    },
    loadData: function(a) {
        Ext.getCmp("controlShowLabel").setValue(a.showLabel)
    },
    saveChanges: function() {
        if (!this.getComponent(0).form.isValid()) return !1;
        var a = {
            type: "SetFieldProperties",
            fieldData: [{
                id: this.data.id,
                showLabel: Ext.getCmp("controlShowLabel").getValue()
            }]
        };
        this.hide();
        return this.handler.perform(a)
    }
});
Sfdc.layout.AnalyticsPropertiesWindow = function(a) {
    Ext.applyIf(a, {
        title: LC.getLabel("LayoutDND", "AnalyticsProperties"),
        cls: "analyticsProps",
        idPrefix: "analytic",
        layout: "auto",
        items: {
            xtype: "form",
            labelSeparator: "",
            labelWidth: 150,
            items: [{
                id: "analyticsFilterLimitWarning",
                html: Sfdc.layout.messageHTML(LC.getLabel("LayoutDND", "FilterLimitWarning"), "warning")
            }, {
                id: "analyticsFLSWarning",
                html: Sfdc.layout.messageHTML(LC.getLabel("LayoutDND", "FieldFLSWarning"), "warning")
            }, {
                html: '\x3ca href\x3d"' + VFEditor.analyticsChartPropertiesHelpUrl +
                    '"\x3e\x3cimg id\x3d"analyticsChartPropertiesHelpIcon" class\x3d"helpIcon" src\x3d"/s.gif" /\x3e\x3c/a\x3e'
            }, {
                layout: "column",
                border: !1,
                defaults: {
                    columnWidth: ".5",
                    border: !1
                },
                items: [{
                    xtype: "radiogroup",
                    columns: 1,
                    id: "analyticSize",
                    items: [{
                        xtype: "label",
                        text: LC.getLabel("LayoutDND", "ChartSize"),
                        cls: "x-form-item-label label-header"
                    }, {
                        boxLabel: LC.getLabel("LayoutDND", "small"),
                        name: "chartSize",
                        inputValue: "small"
                    }, {
                        boxLabel: LC.getLabel("LayoutDND", "medium"),
                        name: "chartSize",
                        inputValue: "medium"
                    }, {
                        boxLabel: LC.getLabel("LayoutDND",
                            "large"),
                        name: "chartSize",
                        inputValue: "large"
                    }]
                }, {
                    columns: 1,
                    items: [{
                        xtype: "label",
                        text: LC.getLabel("LayoutDND", "Display"),
                        cls: "x-form-item-label label-header"
                    }, {
                        xtype: "checkbox",
                        id: "analyticTitle",
                        boxLabel: LC.getLabel("LayoutDND", "ChartTitle")
                    }, {
                        xtype: "checkbox",
                        id: "analyticHideOnError",
                        boxLabel: LC.getLabel("LayoutDND", "HideOnError")
                    }]
                }]
            }, {
                xtype: "label",
                text: LC.getLabel("LayoutDND", "AddContext"),
                cls: "x-form-item-label label-header"
            }, {
                layout: "hbox",
                id: "analyticIncludeContextContainer",
                items: [{
                    xtype: "checkbox",
                    id: "includeContext",
                    boxLabel: LC.getLabel("LayoutDND", "FilteredBy"),
                    handler: this.includeContextCheck
                }, {
                    html: '\x3cimg class\x3d"infoIcon" src\x3d"/s.gif" ' + (Ext.QuickTips.isEnabled ? 'ext:qtip\x3d"' : 'title\x3d"') + LC.getLabel("LayoutDND", "AddContextTooltip") + '"/\x3e'
                }, {
                    tag: "div",
                    id: "analyticIncludContextVariableContainer",
                    items: [{
                        xtype: "button",
                        id: "analyticIncludeContext",
                        cls: "linkButton",
                        overCls: "hover",
                        menu: {
                            cls: "simpleMenu",
                            items: []
                        }
                    }, {
                        id: "loadingContextFilterable",
                        hideMode: "display",
                        xtype: "label",
                        text: LC.getLabel("LayoutDND", "Checking"),
                        cls: "x-form-item-label label-faded"
                    }, {
                        id: "includeContextOptUnavail",
                        hideMode: "display",
                        xtype: "label",
                        text: LC.getLabel("LayoutDND", "ContextNotAvailable"),
                        cls: "x-form-item-label label-faded"
                    }, {
                        id: "loadingContextFilterableIcon",
                        hideMode: "display",
                        cls: "loading-icon"
                    }]
                }]
            }, {
                layout: "hbox",
                id: "analyticCachedContainer",
                items: [{
                    xtype: "checkbox",
                    id: "analyticCached",
                    boxLabel: LC.getLabel("LayoutDND", "DisableCaching")
                }, {
                    html: '\x3cimg id\x3d"analyticAddContextTooltipIcon" class\x3d"infoIcon" src\x3d"/s.gif" /\x3e',
                    listeners: {
                        afterrender: function() {
                            if (!Ext.get("analyticAddContextTooltip")) {
                                var a = new Ext.Template('{text} \x3ca href\x3d"{href}"\x3e{linkText}\x3c/a\x3e');
                                Ext.create({
                                    xtype: "tooltip",
                                    id: "analyticAddContextTooltip",
                                    target: "analyticAddContextTooltipIcon",
                                    html: a.apply({
                                        text: LC.getLabel("LayoutDND", "DisableCachingInfo"),
                                        href: VFEditor.analyticsDisableCachingHelpUrl,
                                        linkText: LC.getLabel("LayoutDND", "LearnMoreText")
                                    }),
                                    hideDelay: 3E3
                                })
                            }
                        }
                    }
                }]
            }]
        }
    });
    Sfdc.layout.ControlPropertiesWindow.superclass.constructor.call(this,
        a)
};
Ext.extend(Sfdc.layout.AnalyticsPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    setFields: function(a) {
        if (1 < a.length) throw "Tried to edit more than one Control";
        this.data = a[0]
    },
    loadData: function(a) {
        var b = this;
        Ext.getCmp("analyticSize").setValue(Sfdc.layout.FieldSection.analyticSizeLabelFromWidth(a.width));
        Ext.getCmp("analyticTitle").setValue(a.showTitle);
        Ext.getCmp("analyticCached").setValue(!a.cacheData);
        Ext.getCmp("analyticHideOnError").setValue(a.hideOnError);
        Ext.getCmp("includeContext").setValue(a.includeContext);
        Ext.getCmp("analyticIncludeContext").setDisabled(!a.includeContext);
        Ext.getCmp("analyticsFLSWarning").setVisible(!1);
        if (a.staticData.contextFilterableFields) {
            var c = a.staticData.contextFilterableFields.length || a.filterColumn;
            Ext.getCmp("includeContext").setDisabled(!c);
            Ext.getCmp("loadingContextFilterable").setVisible(!1);
            Ext.getCmp("loadingContextFilterableIcon").setVisible(!1);
            Ext.getCmp("analyticIncludeContext").setVisible(c);
            Ext.getCmp("includeContextOptUnavail").setVisible(!c);
            Ext.getCmp("analyticsFilterLimitWarning").setVisible(a.staticData.atReportFilterLimit &&
                c);
            this.loadContextFieldOptions(a.staticData.contextFilterableFields)
        } else Ext.getCmp("loadingContextFilterable").setVisible(!0), Ext.getCmp("loadingContextFilterableIcon").setVisible(!0), Ext.getCmp("includeContextOptUnavail").setVisible(!1), Ext.getCmp("analyticIncludeContext").setVisible(!1), Ext.getCmp("includeContext").setDisabled(!0), Ext.getCmp("analyticsFilterLimitWarning").setVisible(!1), VFEditor.registerCallback("checkReportContextFilterable" + a.id, function(c, e) {
            Ext.getCmp("includeContext").setDisabled(!a.includeContext);
            Ext.getCmp("includeContext").setValue(a.includeContext);
            Ext.getCmp("loadingContextFilterable").setVisible(!1);
            Ext.getCmp("loadingContextFilterableIcon").setVisible(!1);
            Ext.getCmp("analyticIncludeContext").setVisible(c.length);
            Ext.getCmp("includeContextOptUnavail").setVisible(!c.length);
            Ext.getCmp("analyticsFilterLimitWarning").setVisible(e && c.length);
            b.loadContextFieldOptions(a.staticData.contextFilterableFields)
        }, !0)
    },
    includeContextCheck: function() {
        Ext.getCmp("analyticIncludeContext").setDisabled(!Ext.getCmp("includeContext").getValue())
    },
    selectMenuItemFn: function(a, b, c, d) {
        return function() {
            var e = Ext.getCmp("analyticIncludeContext");
            e.menu.items.items[this.selectedFilterIndex].enable();
            this.selectedFilterIndex = a;
            e.menu.items.items[a].disable();
            e.setText(Ext.util.Format.htmlEncode(c));
            d ? (Ext.getCmp("analyticsFLSWarning").setVisible(!0), e.addClass("fls")) : (Ext.getCmp("analyticsFLSWarning").setVisible(!1), e.removeClass("fls"));
            this.filterField = b
        }
    },
    selectedFilterIndex: 0,
    loadContextFieldOptions: function(a) {
        if (this.data.filterColumn || a.length) {
            var b =
                this,
                c = Ext.getCmp("analyticIncludeContext"),
                d = this.selectMenuItemFn;
            this.data.includeContext && a.length ? (this.selectedFilterIndex = this.data.filterColumn ? a.pluck("name").indexOf(this.data.filterColumn) : 0, -1 === this.selectedFilterIndex && (this.selectedFilterIndex = a.length)) : this.selectedFilterIndex = 0;
            c.menu = new Ext.menu.Menu({
                cls: "simpleMenu linkButtonMenu",
                items: a.map(function(a, c) {
                    return {
                        text: Ext.util.Format.htmlEncode(a.label),
                        scope: b,
                        handler: d(c, a.name, a.label)
                    }
                }).concat(this.selectedFilterIndex ===
                    a.length ? {
                        text: Ext.util.Format.htmlEncode(this.data.filterColumn),
                        scope: this,
                        cls: "fls",
                        handler: d(a.length, this.data.filterColumn, this.data.filterColumn, !0)
                    } : [])
            });
            c.menu.items.items[this.selectedFilterIndex].handler.call(this)
        }
    },
    saveChanges: function() {
        if (!this.getComponent(0).form.isValid()) return !1;
        var a = Sfdc.layout.FieldSection.analyticSizeMap[Ext.getCmp("analyticSize").getValue().inputValue],
            a = {
                type: "SetFieldProperties",
                fieldData: [{
                    id: this.data.id,
                    width: a.width,
                    height: a.height,
                    showTitle: Ext.getCmp("analyticTitle").getValue(),
                    includeContext: Ext.getCmp("includeContext").getValue(),
                    hideOnError: Ext.getCmp("analyticHideOnError").getValue(),
                    cacheData: !Ext.getCmp("analyticCached").getValue(),
                    filterColumn: this.filterField
                }]
            };
        this.hide();
        return this.handler.perform(a)
    }
});
Sfdc.layout.SectionPropertiesWindow = function(a, b, c) {
    a = a || {};
    Ext.applyIf(a, {
        title: LC.getLabel("LayoutDND", "SectionProperties"),
        idPrefix: "section",
        minWidth: 480,
        width: 500,
        autoScroll: !1,
        cls: "sectionPropsWindow"
    });
    this.saveFn = b;
    this.saveFnScope = c;
    Sfdc.layout.SectionPropertiesWindow.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.layout.SectionPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    onRender: function() {
        Sfdc.layout.SectionPropertiesWindow.superclass.onRender.apply(this, arguments);
        var a = new Ext.form.FormPanel({
            cls: "sectionProps",
            labelWidth: 175,
            autoHeight: !0,
            layoutConfig: {
                labelSeparator: ""
            },
            items: [{
                fieldLabel: LC.getLabel("LayoutDND", "SectionName"),
                xtype: "textfield",
                maxLength: VFEditor.MAX_SECTION_TITLE_LENGTH,
                id: "sectionName",
                name: "sectionName",
                allowBlank: !1
            }]
        });
        VFEditor.canModifyHeadersInSections && (a.add({
            fieldLabel: LC.getLabel("LayoutDND",
                "DisplayHeader"),
            boxLabel: LC.getLabel("LayoutDND", "DetailPage"),
            xtype: "checkbox",
            id: "section_show_detail",
            name: "section_show_detail"
        }), a.add({
            fieldLabel: "",
            boxLabel: LC.getLabel("LayoutDND", "EditPage"),
            xtype: "checkbox",
            id: "section_show_edit",
            name: "section_show_edit"
        }));
        this.add(a);
        a = ['\x3ctable class\x3d"sectionProps"\x3e\x3ctbody\x3e\x3ctr id\x3d"columnsRO"\x3e\x3ctd class\x3d"titleRO"\x3e', LC.getLabel("LayoutDND", "LayoutColumnsHeader"), '\x3c/td\x3e\x3ctd class\x3d"info"\x3e', LC.getLabel("LayoutDND",
                "LayoutColumnsNumber", "3"), '\x3c/td\x3e\x3c/tr\x3e\x3c/tbody\x3e\x3c/table\x3e\x3ctable id\x3d"columnSection" class\x3d"sectionProps"\x3e\x3ctbody\x3e\x3ctr\x3e\x3ctd\x3e\x3cdiv class\x3d"options" id\x3d"columnsSet"\x3e\x3cdiv class\x3d"title"\x3e', LC.getLabel("LayoutDND", "LayoutColumnsHeader"), '\x3c/div\x3e\x3ctable\x3e\x3ctr\x3e\x3ctd\x3e\x3cdiv class\x3d"image"\x3e\x3cimg src\x3d"/img/col_thumb/1col.gif"\x3e\x3c/img\x3e\x3c/div\x3e\x3c/td\x3e\x3ctd\x3e\x3cdiv class\x3d"image"\x3e\x3cimg src\x3d"/img/col_thumb/2col.gif"\x3e\x3c/img\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3ctr\x3e\x3ctd\x3e\x3ctable\x3e\x3ctr\x3e\x3ctd\x3e\x3cdiv class\x3d"optionEntry"\x3e\x3cinput type\x3d"radio" name\x3d"column" id\x3d"column_1" value\x3d"1"/\x3e\x3c/td\x3e\x3ctd\x3e\x3clabel for\x3d"column_1" class\x3d"info"\x3e',
            LC.getLabel("LayoutDND", "LayoutColumnsNumber", "1"), '\x3c/label\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e\x3c/td\x3e\x3ctd\x3e\x3ctable\x3e\x3ctr\x3e\x3ctd\x3e\x3cdiv class\x3d"optionEntry"\x3e\x3cinput type\x3d"radio" name\x3d"column" id\x3d"column_2" value\x3d"2"/\x3e\x3c/td\x3e\x3ctd\x3e\x3clabel for\x3d"column_2" class\x3d"info"\x3e', LC.getLabel("LayoutDND", "LayoutColumnsNumber", "2"), '\x3c/label\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e\x3c/div\x3e\x3c/td\x3e\x3ctd\x3e\x3cdiv class\x3d"options" id\x3d"sortOrderSet"\x3e\x3cdiv class\x3d"title"\x3e',
            LC.getLabel("LayoutDND", "LayoutTabHeader"), '\x3c/div\x3e\x3ctable\x3e\x3ctr\x3e\x3ctd\x3e\x3cdiv class\x3d"image"\x3e\x3cimg src\x3d"/img/col_thumb/left_to_right.gif"\x3e\x3c/img\x3e\x3c/div\x3e\x3c/td\x3e\x3ctd\x3e\x3cdiv class\x3d"image"\x3e\x3cimg src\x3d"/img/col_thumb/top_to_bottom.gif"\x3e\x3c/img\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3ctr\x3e\x3ctd\x3e\x3ctable\x3e\x3ctr\x3e\x3ctd\x3e\x3cdiv class\x3d"optionEntry"\x3e\x3cinput type\x3d"radio" name\x3d"sortOrder" id\x3d"sortOrder_h" value\x3d"h"/\x3e\x3c/td\x3e\x3ctd\x3e\x3clabel for\x3d"sortOrder_h" class\x3d"info"\x3e',
            LC.getLabel("LayoutSection", "LeftRight"), '\x3c/label\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e\x3c/td\x3e\x3ctd\x3e\x3ctable\x3e\x3ctr\x3e\x3ctd\x3e\x3cdiv class\x3d"optionEntry"\x3e\x3cinput type\x3d"radio" name\x3d"sortOrder" id\x3d"sortOrder_v" value\x3d"v"/\x3e\x3c/td\x3e\x3ctd\x3e\x3clabel for\x3d"sortOrder_v" class\x3d"info"\x3e', LC.getLabel("LayoutSection", "TopDown"), "\x3c/label\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/tbody\x3e\x3c/table\x3e"
        ].join("");
        VFEditor.canModifyColumnsInSections && this.add({
            html: a
        });
        this.render()
    },
    afterRender: function() {
        Sfdc.layout.SectionPropertiesWindow.superclass.afterRender.apply(this, arguments);
        Ext.select(Ext.query("input[name\x3dcolumn]", Ext.getDom("columnsSet"))).on("click", this.columnChange, this)
    },
    columnChange: function(a) {
        "column_1" == a.getTarget().id ? Ext.fly("sortOrderSet").hide() : (Ext.fly("sortOrderSet").show(), !Ext.getDom("sortOrder_v").checked && !Ext.getDom("sortOrder_h").checked && (Ext.getDom("sortOrder_v").checked = !0))
    },
    loadData: function(a) {
        this.data = a;
        Ext.getCmp("sectionName").setValue(a.name);
        Ext.getCmp("sectionName").setDisabled(a.nameReadonly);
        VFEditor.canModifyHeadersInSections && (Ext.getCmp("section_show_detail").setValue(a.showDetailHeader), Ext.getCmp("section_show_edit").setValue(a.showEditHeader), Ext.getCmp("section_show_edit").setDisabled(a.notVisibleOnEdit));
        if (VFEditor.canModifyColumnsInSections)
            if (a.editColumns) {
                Ext.fly("columnsRO").setVisibilityMode(Ext.Element.DISPLAY).setVisible(!1);
                Ext.fly("columnSection").setVisibilityMode(Ext.Element.DISPLAY).setVisible(!0);
                Ext.fly("columnsSet").show();
                var b = 1 == a.columns;
                Ext.getDom("column_1").checked = b;
                Ext.getDom("column_2").checked = !b;
                1 < a.columns ? (Ext.fly("sortOrderSet").show(), a = "v" == a.sortOrder, Ext.getDom("sortOrder_h").checked = !a, Ext.getDom("sortOrder_v").checked = a) : Ext.fly("sortOrderSet").hide()
            } else Ext.fly("columnSection").setVisibilityMode(Ext.Element.DISPLAY).setVisible(!1), Ext.fly("columnsRO").show(), Ext.fly("columnsRO").child(".info").dom.innerHTML = LC.getLabel("LayoutDND", "LayoutColumnsNumber", a.columns);
        this.getEl().sync()
    },
    saveChanges: function() {
        if (!this.getComponent(0).getForm().isValid()) return !1;
        this.saveFn.call(this.saveFnScope)
    },
    getFocusComponent: function() {
        return Ext.getCmp("sectionName")
    },
    getData: function() {
        var a = {};
        this.data.nameReadonly || (a.name = Ext.getCmp("sectionName").getValue());
        VFEditor.canModifyHeadersInSections ? (a.showDetailHeader = Ext.getCmp("section_show_detail").getValue(), a.showEditHeader = Ext.getCmp("section_show_edit").getValue()) : (a.showDetailHeader = this.data.showDetailHeader,
            a.showEditHeader = this.data.showEditHeader);
        this.data.editColumns && VFEditor.canModifyColumnsInSections ? (a.columns = Ext.getDom("column_1").checked ? 1 : 2, 1 < a.columns && (a.sortOrder = Ext.getDom("sortOrder_h").checked ? "h" : "v")) : a.columns = this.data.columns;
        return a
    }
});
Sfdc.layout.LayoutPropertiesWindow = function(a) {
    var b = [{
        fieldLabel: LC.getLabel("LayoutDND", "LayoutName"),
        id: "propsLayoutName",
        name: "name",
        xtype: "textfield",
        labelSeparator: "",
        allowBlank: !1,
        maxLength: 80
    }];
    a.namespacePrefix && (b.push({
        fieldLabel: VFEditor.labelMap.namespacePrefixLabel,
        html: a.namespacePrefix,
        xtype: "mockfield"
    }), b.push({
        fieldLabel: VFEditor.labelMap.layoutPackageLinkLabel,
        html: a.layoutPackageLink,
        xtype: "mockfield"
    }));
    a.showTagging && (b.push({
        fieldLabel: LC.getLabel("LayoutDND", "PagePropsTag"),
        labelSeparator: "",
        boxLabel: LC.getLabel("LayoutDND", "PagePropsEnablePublicTags"),
        id: "propsPublicTags",
        name: "publicTags",
        xtype: "checkbox"
    }), b.push({
        fieldLabel: a.showPublicTagging ? "" : LC.getLabel("LayoutDND", "PagePropsTag"),
        labelSeparator: "",
        boxLabel: LC.getLabel("LayoutDND", "PagePropsEnablePersonalTags"),
        id: "propsPrivateTags",
        name: "privateTags",
        xtype: "checkbox"
    }));
    a.specialOptions && 0 < a.specialOptions.length ? a.specialOptions.each(function(a) {
        b.push({
            fieldLabel: a.dependsOn ? "" : a.label,
            boxLabel: a.dependsOn ?
                a.label : a.instr,
            ctCls: a.isRadio ? "pagePropRadio" : a.dependsOn ? "pagePropDepends" : "",
            labelSeparator: "",
            id: "props" + a.id,
            name: a.id,
            xtype: a.isRadio ? "radio" : "checkbox"
        })
    }) : b.push({
        xtype: "panel",
        height: 50
    });
    this.layoutNameEditable = a.layoutNameEditable;
    Ext.apply(a, {
        title: LC.getLabel("LayoutDND", "LayoutProperties"),
        idPrefix: "layout",
        items: {
            xtype: "form",
            labelWidth: 180,
            labelAlign: "right",
            labelPad: 15,
            cls: "pageProps",
            bodyBorder: !1,
            border: !1,
            autoScroll: !0,
            autoHeight: !0,
            items: b
        }
    });
    Sfdc.layout.LayoutPropertiesWindow.superclass.constructor.call(this,
        a)
};
Ext.extend(Sfdc.layout.LayoutPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    width: 460,
    getFocusComponent: function() {
        return Ext.getCmp("propsLayoutName")
    },
    initComponent: function() {
        Sfdc.layout.LayoutPropertiesWindow.superclass.initComponent.apply(this, arguments);
        this.addEvents({
            ok: !0
        })
    },
    setIsSaveAs: function(a) {
        (this.isSaveAs = a) ? (this.setTitle(LC.getLabel("Buttons", "saveAs")), this.buttons[0].setText(LC.getLabel("Buttons", "save"))) : (this.setTitle(LC.getLabel("LayoutDND", "LayoutProperties")), this.buttons[0].setText(LC.getLabel("Buttons", "ok")))
    },
    loadData: function(a, b) {
        this.origName = a.name;
        Ext.getCmp("propsLayoutName").setDisabled(!this.layoutNameEditable && !this.isSaveAs);
        this.getComponent(0).getForm().setValues(a);
        b && (b.publicAllowed || Ext.fly(Ext.getCmp("propsPublicTags").getEl().findParent("div.x-form-item")).setVisibilityMode(Ext.Element.DISPLAY).hide(), b.privateAllowed || Ext.fly(Ext.getCmp("propsPrivateTags").getEl().findParent("div.x-form-item")).setVisibilityMode(Ext.Element.DISPLAY).hide());
        this.getEl().sync()
    },
    saveChanges: function() {
        if (!this.getComponent(0).getForm().isValid()) return !1;
        var a = Ext.getCmp("propsLayoutName").getValue();
        this.isSaveAs || a !== this.origName ? (VFEditor.registerCallback("checkName", this.saveChanges_inner.bind(this)), vfeditor_checkName(a)) : this.saveChanges_inner(!0)
    },
    saveChanges_inner: function(a) {
        VFEditor.unregisterCallback("checkName");
        if (a) {
            a = {
                type: "SetLayoutProperties"
            };
            var b = this.getComponent(0).getForm().getValues();
            a.name = b.name;
            for (var c in b) b.hasOwnProperty(c) && "name" !== c && (a[c] = !Ext.isEmpty(b[c]));
            this.handler.perform(a);
            this.fireEvent("ok", this);
            this.hide()
        } else Ext.getCmp("propsLayoutName").markInvalid(LC.getLabel("LayoutDND",
            "duplicateName"))
    },
    _getHandleChangeAntFn: function(a) {
        return function(b, c) {
            c && Ext.getCmp("props" + a).setValue(!0)
        }
    },
    _getHandleChangeDepFn: function(a) {
        return function(b, c) {
            c || Ext.getCmp("props" + a).setValue(!1)
        }
    },
    _getHandleChangeRadioAntFn: function(a) {
        return function(b, c) {
            c && (Ext.getCmp("props" + a).suspendEvents(!1), Ext.getCmp("props" + a).setValue(!0), Ext.getCmp("props" + a).resumeEvents())
        }
    },
    _getHandleChangeRadioDepFn: function(a) {
        return function(b, c) {
            c ? (Ext.getCmp("props" + a).setValue(!0), Ext.getCmp("props" +
                a).removeClass("greyed")) : (Ext.getCmp("props" + a).suspendEvents(!1), Ext.getCmp("props" + a).setValue(!1), Ext.getCmp("props" + a).addClass("greyed"), Ext.getCmp("props" + a).resumeEvents())
        }
    },
    _getHandleChangeRadioFn: function(a) {
        return function(b, c) {
            b.removeClass("greyed");
            c ? (Ext.getCmp("props" + a).suspendEvents(!1), Ext.getCmp("props" + a).setValue(!1), Ext.getCmp("props" + a).removeClass("greyed"), Ext.getCmp("props" + a).resumeEvents()) : b.setValue(!0)
        }
    },
    onRender: function() {
        this.on("afterLayout", this.afterLayout, this);
        Sfdc.layout.LayoutPropertiesWindow.superclass.onRender.apply(this, arguments)
    },
    afterLayout: function () {
        
        this.initialConfig.specialOptions.each(function(a) {
            if (a.isRadio) {
                if (a.dependedOn)
                    for (var b = 0; b < a.dependedOn.length; b++) Ext.getCmp("props" + a.id).on("check", this._getHandleChangeRadioFn(a.dependedOn[b]));
                if (a.dependsOn)
                    for (b = 0; b < a.dependsOn.length; b++) Ext.getCmp("props" + a.id).on("check", this._getHandleChangeRadioAntFn(a.dependsOn[b])), Ext.getCmp("props" + a.dependsOn[b]).on("check", this._getHandleChangeRadioDepFn(a.id))
            } else {
                if (a.dependsOn)
                    for (b =
                        0; b < a.dependsOn.length; b++) Ext.getCmp("props" + a.id).on("check", this._getHandleChangeAntFn(a.dependsOn[b]));
                if (a.dependedOn)
                    for (b = 0; b < a.dependedOn.length; b++) Ext.getCmp("props" + a.id).on("check", this._getHandleChangeDepFn(a.dependedOn[b]))
            }
        }, this)
    }
});
Sfdc.layout.RelatedListPropertiesWindow = function(a) {
    this.rl = a.relatedList;
    Ext.apply(a, {
        title: LC.getLabel("LayoutItemColumn", "relatedListProperties", Ext.util.Format.htmlEncode(this.rl._getStoreItem().data.label)),
        buttons: [{
            text: LC.getLabel("Buttons", "ok"),
            id: "rlPropOkBtn",
            handler: this.validateAndSaveChanges,
            scope: this
        }, {
            text: LC.getLabel("Buttons", "cancel"),
            id: "rlPropCancelBtn",
            handler: this.cancel,
            scope: this
        }, {
            text: LC.getLabel("LayoutItemColumn", "Revert"),
            id: "rlPropRevertBtn",
            handler: this.revertToDefault,
            scope: this
        }],
        layout: "accordion"
    });
    Sfdc.layout.RelatedListPropertiesWindow.superclass.constructor.call(this, a)
};
Sfdc.layout.RelatedListPropertiesWindow.SORT_DEFAULT_VALUE = "__NONE__";
Ext.extend(Sfdc.layout.RelatedListPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    resizable: !0,
    closeAction: "close",
    width: 600,
    height: 450,
    autoScroll: !0,
    cls: "relListProp",
    afterRender: function() {
        Sfdc.layout.RelatedListPropertiesWindow.superclass.afterRender.apply(this, arguments);
        this._getListData().columnsLoaded ? this.finishRender() : (this.loadColumns(), this.body.mask(LC.getLabel("Global", "loading")))
    },
    loadColumns: function() {
        var a = this._getListData(),
            b = {};
        b[AjaxLoadRelatedListItem.pRELATED_LIST_ID] = a.id;
        b.id = a.relatedListId;
        b.type = VFEditor.layoutType;
        Ext.Ajax.request({
            url: VFEditor.loadRelatedListServletUrl,
            params: b,
            success: function(b, d) {
                var e = JSON.parse(b.responseText)
                //var e = { "item": { "selectableColumns": [{ "label": "名称", "isSortable": true, "filterColumn": "Name", "name": "Name", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "所有人", "isSortable": true, "filterColumn": "OwningUser", "name": "OwningUser", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "创建人", "isSortable": true, "filterColumn": "CreatedBy", "name": "CreatedBy", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "创建时间", "isSortable": true, "filterColumn": "CreatedOn", "name": "CreatedOn", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "上次修改人", "isSortable": true, "filterColumn": "ModifiedBy", "name": "ModifiedBy", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "上次修改时间", "isSortable": true, "filterColumn": "ModifiedOn", "name": "ModifiedOn", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "姓名", "isSortable": true, "filterColumn": "EmployeeId", "name": "EmployeeId", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "开始日期", "isSortable": true, "filterColumn": "JobStart", "name": "JobStart", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "结束日期", "isSortable": true, "filterColumn": "JobEnd", "name": "JobEnd", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "备注", "isSortable": true, "filterColumn": "Description", "name": "Description", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }, { "label": "职员姓名", "isSortable": true, "filterColumn": "EmployeeIdName", "name": "EmployeeIdName", "type": null, "referencedEntityObjectTypeCode": 0, "sObjectType": 0 }], "displayCategory": "RelatedList", "label": "党内职务", "columnsLoaded": false, "stdListButtons": [], "isSortCustomizable": true, "listCustomizable": true, "defaultColumns": [], "nameColumn": "Name", "customListButtons": [], "id": "RL__HREmployeePartyJobTitleList", "relatedListId": "c4dee0a7-b7e7-4cf8-8d20-2b34fc9e9ea1", "category": "StandardRelatedList", "sortField": "Name", "sortDir": "DESC" } }
                    //Sfdc.JSON.parseWithCSRF();
                a.selectableColumns = e.item.selectableColumns;
                a.columnsLoaded = !0;
                this.rl.columnStore.loadData(a.selectableColumns);
                this.body.unmask();
                this.finishRender()
            },
            failure: function (a, b) {
                VFEditor.gack()
            },
            scope: this
        })
    },
    validateAndSaveChanges: function() {
        var a = this._getListData(),
            b = this.multiSelect.getSelectedValues(),
            c = {};
        c[AjaxValidateSpanningFormulasInRelatedList.pRELATED_LIST_ID] =
            a.relatedListId;
        c[AjaxValidateSpanningFormulasInRelatedList.pSELECTED_COLUMNS] = b;
        c.type = VFEditor.layoutType;
        Ext.Ajax.request({
            url: VFEditor.validateSpansInRelatedListServletUrl,
            params: c,
            success: function (a, b) {
                //var c = Sfdc.JSON.parseWithCSRF(a.responseText);
                var c = Sfdc.JSON.parse(a.responseText);

                c.success ? this.saveChanges() : this.multiSelect.showError(c.error)
            },
            failure: function (a, b) {
                VFEditor.gack()
            },
            scope: this
        })
    },
    finishRender: function () {
        var a = new Ext.form.FormPanel({
                bodyBorder: !1,
                border: !1,
                autoScroll: !0,
                title: LC.getLabel("LayoutItemColumn", "Columns"),
                listeners: {
                    render: function(a) {
                        a.header.addClassOnOver("accordion-header-hover")
                    }
                }
            }),
            b = this._getListData(),
            c = b.customizedColumns || b.defaultColumns,
            d = b.selectableColumns.collect(function(a) {
                return [a.filterColumn, a.label]
            }),
            e = b.nameColumn,
            g = Ext.isEmpty(e) ? void 0 : this.rl.columnStore.getById(e).data.label;
        this.multiSelect = new Sfdc.ItemSelector({
            fieldLabel: LC.getLabel("LayoutItemColumn", "Columns"),
            hideLabel: !0,
            id: "rlPropFields",
            fromSortField: "label",
            fromLegend: LC.getLabel("LayoutItemColumn", "availableFields"),
            toLegend: LC.getLabel("LayoutItemColumn", "selectedFields"),
            data: d,
            selectedValues: c,
            msWidth: 200,
            msHeight: 160,
            valueField: "filterColumn",
            displayField: "label",
            topSelectionFixed: !Ext.isEmpty(e),
            textUp: LC.getLabel("DuelingListBoxesElement", "up"),
            textDown: LC.getLabel("DuelingListBoxesElement", "down"),
            textLeft: LC.getLabel("DuelingListBoxesElement", "remove"),
            textRight: LC.getLabel("DuelingListBoxesElement", "add"),
            cls: "rlContent columns",
            showError: function(a) {
                this.errorCt.update(LC.getLabel("Global", "labelWithColon",
                    LC.getLabel("Global", "error")) + " " + a);
                this.errorCt.stopFx().show(!1).pause(5).fadeOut({
                    duration: 1,
                    useDisplay: !0
                })
            },
            listeners: {
                select: this.selectFields,
                deselect: this.deselectFields,
                render: function(a) {
                    a.errorCt = a.el.insertFirst({
                        tag: "div",
                        cls: "errorMsg",
                        style: {
                            display: "hidden"
                        }
                    })
                },
                reset: function() {
                    var a = this.sortByStore.getAt(0);
                    this.sortByStore.removeAll();
                    this.sortByStore.insert(0, a)
                },
                beforeselect: function(a, b, c) {
                    if (0 === c && e) return a.showError(LC.getLabel("LayoutItemColumn", "CantMoveNameColumn", g)),
                        !1;
                    if (a.toStore.getCount() + b.length > VFEditor.MAX_RELATED_LIST_COLUMNS) return a.showError(LC.getLabel("LayoutItemColumn", "TooManyColumns", VFEditor.MAX_RELATED_LIST_COLUMNS)), !1
                },
                beforedeselect: function(a, b) {
                    b.length == a.toStore.getCount() && a.showError(LC.getLabel("Page_ListLayoutEdit", "EmptyListLayout"));
                    if (e && b.any(function(a) {
                            return e == a.id
                        })) return a.showError(LC.getLabel("LayoutItemColumn", "CantMoveNameColumn", g)), !1
                },
                beforemove: function(a, b, c, d) {
                    if (e && (b.id == e && 0 < d || b.id != e && 0 === d)) return a.showError(LC.getLabel("LayoutItemColumn",
                        "CantMoveNameColumn", g)), !1
                },
                scope: this
            }
        });
        this.sortByStore = new Sfdc.JsonStore({
            data: [{
                filterColumn: Sfdc.layout.RelatedListPropertiesWindow.SORT_DEFAULT_VALUE,
                label: LC.getLabel("LayoutItemColumn", "Default"),
                isSortable: !0
            }],
            fields: Sfdc.layout.RelatedList.ColumnRecord,
            id: "filterColumn",
            sortInfo: {
                field: "label",
                direction: "DESC"
            }
        });
        c.each(function (a) {
            
            a = this.rl.columnStore.getById(a);
            if (a) {
                a.data.isSortable && this.sortByStore.add(a)

            }
        }, this);
        Ext.DomHelper.insertBefore(this.body, {
            tag: "div",
            cls: "helpDiv",
            cn: {
                tag: "a",
                href: VFEditor.relatedListHelpUrl,
                cls: "helpLink",
                title: VFEditor.helpTitle,
                html: '\x3cspan class\x3d"text"\x3e' + LC.getLabel("Buttons", "help") + "\x3c/span\x3e" + VFEditor.helpIconHtml
            }
        });
        d = new Ext.Template('\x3cdiv class\x3d"rlBtnInstr"\x3e{text}\x3c/div\x3e');
        c = new Ext.Template('\x3cdiv class\x3d"rlBtnSubtitle"\x3e\x3ch3\x3e{text}\x3c/h3\x3e\x3c/div\x3e');
        a.add({
            html: d.apply({
                text: LC.getLabel("LayoutDND", "RLColumnInstr")
            })
        });
        a.add(this.multiSelect);
        b.isSortCustomizable && (a.add({
            fieldLabel: LC.getLabel("LayoutItemColumn",
                "sortBy"),
            xtype: "combo",
            name: "sortBy",
            id: "rlProps_sortBy",
            itemCls: "rlContentSortBy",
            store: this.sortByStore,
            displayField: "label",
            tpl: '\x3ctpl for\x3d"."\x3e\x3cdiv class\x3d"x-combo-list-item"\x3e{label:htmlEncode}\x3c/div\x3e\x3c/tpl\x3e',
            forceSelection: !0,
            typeAhead: !1,
            mode: "local",
            triggerAction: "all",
            value: b.sortColumn ? b.sortColumn : Sfdc.layout.RelatedListPropertiesWindow.SORT_DEFAULT_VALUE,
            valueField: "filterColumn",
            editable: !1
        }), a.add({
            fieldLabel: LC.getLabel("LayoutItemColumn", "ascending"),
            hideLabel: !0,
            labelSeparator: "",
            boxLabel: LC.getLabel("LayoutItemColumn", "ascending"),
            xtype: "radio",
            itemCls: "rlContentAscDsc",
            name: "columnSort",
            id: "rlProps_columnSort_asc",
            value: "asc",
            checked: !b.sortDesc
        }), a.add({
            xtype: "radio",
            itemCls: "rlContentAscDsc",
            fieldLabel: LC.getLabel("LayoutItemColumn", "descending"),
            hideLabel: !0,
            labelSeparator: "",
            boxLabel: LC.getLabel("LayoutItemColumn", "descending"),
            name: "columnSort",
            id: "rlProps_columnSort_desc",
            value: "desc",
            checked: b.sortDesc
        }));
        var f = this.getApplyToOtherLayoutsData(b);
        if (f) {
            a.add({
                html: c.apply({
                    text: LC.getLabel("LayoutDND", "RLApplyToOtherLayouts")
                })
            });
            var h = !0,
                k;
            for (k in f)
                if (f.hasOwnProperty(k) && !f[k]) {
                    h = !1;
                    break
                } a.add(new Ext.form.Checkbox({
                fieldLabel: LC.getLabel("LayoutField", "SelectAll"),
                hideLabel: !0,
                boxLabel: LC.getLabel("LayoutField", "SelectAll"),
                itemCls: "rlContent",
                name: "selectAllLayouts",
                id: "all_layouts",
                checked: h,
                listeners: {
                    check: function(a, b) {
                        for (var c in f)
                            if (f.hasOwnProperty(c)) {
                                var d = Ext.getCmp("rlProps_otherLayouts_" + c);
                                d.suspendEvents();
                                d.setValue(b);
                                d.resumeEvents()
                            }
                    }
                }
            }));
            a.add({
                cls: "selectAll",
                html: "\x26nbsp;"
            });
            otherLayoutIdNames.findAll(function(a) {
                return a[0] in f
            }).each(function(b) {
                var c = b[0];
                a.add({
                    fieldLabel: Ext.util.Format.htmlEncode(b[1]),
                    hideLabel: !0,
                    boxLabel: Ext.util.Format.htmlEncode(b[1]),
                    xtype: "checkbox",
                    itemCls: "rlContent",
                    name: "otherLayouts_" + c,
                    id: "rlProps_otherLayouts_" + c,
                    checked: f[c],
                    listeners: {
                        check: function(a, b) {
                            var c = Ext.getCmp("all_layouts");
                            c.suspendEvents();
                            if (b) {
                                var d = !0,
                                    e;
                                for (e in f)
                                    if (f.hasOwnProperty(e) && (d = d && Ext.getCmp("rlProps_otherLayouts_" +
                                            e).getValue(), !d)) break;
                                d && c.setValue(!0)
                            } else c.setValue(!1);
                            c.resumeEvents()
                        }
                    }
                })
            })
        }
        this.add(a);
        k = b.stdListButtons && 0 < b.stdListButtons.length;
        h = b.customListButtons && 0 < b.customListButtons.length;
        if (k || h) {
            var l = new Ext.form.FormPanel({
                bodyBorder: !1,
                border: !1,
                autoScroll: !0,
                title: LC.getLabel("LayoutDND", "CategoryButton"),
                listeners: {
                    render: function(a) {
                        a.header.addClassOnOver("accordion-header-hover")
                    }
                }
            });
            k && (l.add({
                    html: c.apply({
                        text: LC.getLabel("Global", "labelWithColon", LC.getLabel("LayoutButtons", "StandardButtons"))
                    })
                }),
                l.add({
                    html: d.apply({
                        text: LC.getLabel("LayoutDND", "RLStandardButtonInstr")
                    })
                }), b.stdListButtons.each(function(a) {
                    var c = Ext.isEmpty(b.stdListButtonsRevoked) || !(a.id in b.stdListButtonsRevoked);
                    a.isDefaultOff && (c = !c);
                    l.add({
                        boxLabel: a.label,
                        labelSeparator: "",
                        fieldLabel: a.label,
                        hideLabel: !0,
                        xtype: "checkbox",
                        itemCls: "rlContent",
                        name: "btn_" + a.id,
                        id: "rlProps_btn_" + a.id,
                        checked: c
                    })
                }));
            h && (l.add({
                html: c.apply({
                    text: LC.getLabel("Global", "labelWithColon", LC.getLabel("LayoutButtons", "CustomButtons"))
                })
            }), l.add({
                html: d.apply({
                    text: LC.getLabel("LayoutDND",
                        "RLCustomButtonInstr")
                })
            }), c = b.customListButtonsAdded || [], d = b.customListButtons.collect(function(a) {
                return [a.id, a.label]
            }), e = b.nameColumn, this.customBtnMultiSelect = new Sfdc.ItemSelector({
                fieldLabel: LC.getLabel("LayoutButtons", "CustomButtons"),
                hideLabel: !0,
                id: "rlPropButtons",
                data: d,
                cls: "rlContent customButtons",
                fromLegend: LC.getLabel("LayoutItemColumn", "availableButtons"),
                toLegend: LC.getLabel("LayoutItemColumn", "selectedButtons"),
                selectedValues: c,
                textUp: LC.getLabel("DuelingListBoxesElement", "up"),
                textDown: LC.getLabel("DuelingListBoxesElement", "down"),
                textLeft: LC.getLabel("DuelingListBoxesElement", "remove"),
                textRight: LC.getLabel("DuelingListBoxesElement", "add"),
                textTop: LC.getLabel("DuelingListBoxesElement", "top"),
                textBottom: LC.getLabel("DuelingListBoxesElement", "bottom"),
                msWidth: 200,
                msHeight: 150,
                width: "auto",
                valueField: "id",
                displayField: "label"
            }), l.add(this.customBtnMultiSelect));
            this.add(l)
        }
        "object" == typeof this.layout && this.doLayout()
        
    },
    revertToDefault: function() {
        var a = this._getListData();
        this.multiSelect.reset();
        a.defaultColumns.each(function(a) {
            this.multiSelect.select(a)
        }, this);
        a.stdListButtons && a.stdListButtons.each(function(a) {
            Ext.getCmp("rlProps_btn_" + a.id).setValue(!a.isDefaultOff)
        });
        this.customBtnMultiSelect && this.customBtnMultiSelect.reset();
        Ext.getCmp("rlProps_sortBy").setValue(Sfdc.layout.RelatedListPropertiesWindow.SORT_DEFAULT_VALUE);
        Ext.getCmp("rlProps_columnSort_asc").setValue(!0);
        Ext.getCmp("rlProps_columnSort_desc").setValue(!1)
    },
    cancel: function() {
        this.close()
    },
    selectFields: function(a,
        b) {
        if (!this.sortByStore.getById(b.data.filterColumn)) {
            var c = this.rl.columnStore.getById(b.id);
            c.data.isSortable && this.sortByStore.add(c)
        }
    },
    deselectFields: function(a, b) {
        var c = Ext.getCmp("rlProps_sortBy");
        if (c) {
            var d = c.getValue();
            b.id == d && c.setValue(Sfdc.layout.RelatedListPropertiesWindow.SORT_DEFAULT_VALUE);
            this.sortByStore.remove(this.sortByStore.getById(b.id))
        }
    },
    _getListData: function() {
        return this.rl._getStoreItem().data
    },
    getApplyToOtherLayoutsData: function(a) {
        return a.applyToOtherLayoutsData || a.applyToOtherLayoutsInitData
    },
    saveChanges: function() {
        var a = this.multiSelect.getSelectedValues();
        if (!a || 1 > a.length) return this.multiSelect.showError(LC.getLabel("Page_ListLayoutEdit", "EmptyListLayout")), !1;
        var b = this._getListData(),
            c, d, e = Ext.getCmp("rlProps_sortBy");
        e && (c = e.getValue(), d = Ext.getCmp("rlProps_columnSort_desc").getValue(), c == Sfdc.layout.RelatedListPropertiesWindow.SORT_DEFAULT_VALUE && (c = null));
        if (null === c && b.defaultColumns.length == a.length) {
            for (var e = !0, g = 0; g < a.length; g++)
                if (a[g] != b.defaultColumns[g]) {
                    e = !1;
                    break
                } e &&
                (d = a = null)
        }
        var f = {};
        b.stdListButtons && b.stdListButtons.each(function(a) {
            var b = !1;
            Ext.getCmp("rlProps_btn_" + a.id).checked || (b = !0);
            a.isDefaultOff && (b = !b);
            b && (f[a.id] = !0)
        });
        var h;
        this.customBtnMultiSelect && (h = this.customBtnMultiSelect.getSelectedValues());
        var k;
        if (b = this.getApplyToOtherLayoutsData(b)) {
            k = {};
            for (var l in b) b.hasOwnProperty(l) && (k[l] = Ext.getCmp("rlProps_otherLayouts_" + l).checked)
        }
        a = {
            type: "SetRelatedListProperties",
            itemId: this.rl._getStoreItem().data.id,
            customizedColumns: a,
            sortColumn: c,
            sortDesc: d,
            stdListButtonsRevoked: f,
            customListButtonsAdded: h,
            applyToOtherLayoutsData: k
        };
        this.close();
        return this.handler.perform(a)
    }
});
Sfdc.layout.SummaryLayoutPropertiesWindow = function(a) {
    var b = [{
        xtype: "box",
        id: "slPropsHeader",
        autoEl: {
            tag: "div",
            cls: "helpDiv",
            cn: {
                tag: "a",
                href: VFEditor.summaryLayoutHelpUrl,
                cls: "helpLink",
                title: VFEditor.helpTitle,
                html: '\x3cspan class\x3d"text"\x3e' + LC.getLabel("Buttons", "help") + "\x3c/span\x3e" + VFEditor.helpIconHtml
            }
        }
    }];
    a.isFixedColumns || b.push({
        xtype: "panel",
        id: "slPropsUtils",
        items: [{
            xtype: "button",
            id: "slPropsAddColButton",
            cls: "slPropsButton slPropsUtils",
            disabledClass: "btnDisabled",
            tooltip: LC.getLabel("SummaryLayoutProps",
                "addColumnTooltip"),
            tooltipType: "title",
            text: LC.getLabel("SummaryLayoutProps", "addColumn"),
            handler: this.addColumn,
            scope: this
        }]
    });
    b.push({
        xtype: "box",
        autoEl: {
            tag: "div",
            html: LC.getLabel("SummaryLayoutProps", "clickColToEdit")
        }
    }, {
        xtype: "box",
        autoEl: {
            tag: "div",
            id: "slFieldsHint",
            html: LC.getLabel("SummaryLayoutProps", "fieldsHint")
        }
    }, {
        xtype: "panel",
        id: "slPropsFieldColumns",
        layout: "column",
        border: !1,
        width: "auto",
        cls: "slPropsColsPreview"
    }, {
        xtype: "panel",
        id: "slPropsFieldLists",
        layout: "column"
    });
    Ext.apply(a, {
        title: LC.getLabel("SummaryLayoutProps", "title", Ext.util.Format.htmlEncode(a.layoutName)),
        buttons: [{
            text: LC.getLabel("Buttons", "ok"),
            id: "slPropsOKBtn",
            handler: this.saveChanges,
            scope: this
        }, {
            text: LC.getLabel("Buttons", "cancel"),
            id: "slPropsCancelBtn",
            handler: this.cancel,
            scope: this
        }],
        layout: "card",
        activeItem: 0,
        items: [{
            id: "slPropsChooseFields",
            layout: "anchor",
            items: b
        }],
        listeners: {
            show: this.onShow,
            resize: this.onPropsWindowResize,
            scope: this
        }
    });
    Sfdc.layout.SummaryLayoutPropertiesWindow.superclass.constructor.call(this,
        a)
};
Sfdc.layout.SummaryLayoutPropertiesWindow.itemTPL = (new Ext.XTemplate('\x3cdiv class\x3d"slItemWrap"\x3e', '\x3cdiv class\x3d"slItemWrapBackground"\x3e', '\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 1"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3cdiv class\x3d"label"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    "\x3c/div\x3e\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e\x3c/div\x3e\x3c/div\x3e",
    '\x3cdiv class\x3d"slPropsDeleteButton"/\x3e')).compile();
Ext.extend(Sfdc.layout.SummaryLayoutPropertiesWindow, Sfdc.layout.PropertiesWindow, {
    id: "slPropertiesWindow",
    resizable: !0,
    closeAction: "hide",
    width: 800,
    height: 450,
    cls: "slProp",
    initComponent: function() {
        Sfdc.layout.SummaryLayoutPropertiesWindow.superclass.initComponent.apply(this, arguments);
        this.itemStore = new Ext.data.Store({
            recordType: this.store.recordType,
            id: "slPropsItemsStore",
            storeId: "slPropsStore"
        })
    },
    populateStore: function(a) {
        this.itemStore.add(new this.store.recordType({
            id: null,
            label: LC.getLabel("SelectElement",
                "Required"),
            usedHPRecord: !1
        }));
        this.store.clearFilter(!0);
        this.store.filterBy(this.acceptItems, null, !0);
        this.store.each(function(a) {
            "used" === a.get("state") && (a = a.copy(), a.set("usedHPRecord", !1), this.itemStore.add(a))
        }, this);
        this.store.filterFn && this.store.filterBy(this.store.filterFn, null, !0)
    },
    onShow: function(a) {
        this.loadFieldLists();
        this.renderSLColumns();
        this.isFixedColumns || (a = Ext.getCmp("slPropsAddColButton"), this.fieldIDs.length === SummaryLayoutEditor.SUMMARY_LAYOUT_MAX_COL ? (a.disable(), a.el.child("button").dom.title =
            LC.getLabel("SummaryLayoutProps", "addColumnDisabledTooltip")) : (a.enable(), a.el.child("button").dom.title = LC.getLabel("SummaryLayoutProps", "addColumnTooltip")))
    },
    onPropsWindowResize: function() {
        if (Ext.getCmp("slPropsFieldColumns").items) {
            var a = Ext.getCmp("bubblePanel").colSiblingIndex;
            this.alignListsPanel(a)
        }
    },
    renderSLColumns: function(a) {
        var b = Ext.getCmp("slPropsChooseFields").items.indexOfKey("slPropsFieldColumns");
        Ext.getCmp("slPropsChooseFields").remove("slPropsFieldColumns", !0);
        var c = new Ext.Panel({
            id: "slPropsFieldColumns",
            layout: "column",
            border: !1,
            width: "auto",
            cls: "slPropsColsPreview",
            autoDestroy: !0
        });
        Ext.getCmp("slPropsChooseFields").insert(b, c);
        Ext.getCmp("slPropsChooseFields").doLayout();
        this.buildPanels(c, this.createOutData());
        c.doLayout();
        this.alignListsPanel(a ? a : 0)
    },
    createOutData: function() {
        var a = [];
        this.itemStore.clearFilter();
        for (var b = 0; b < this.fieldIDs.length; b++) {
            for (var c = [], d = 0; d < this.fieldIDs[b].length; d++) {
                var e = this.itemStore.getById(this.fieldIDs[b][d]);
                e ? c.push(e.data) : c.push({
                    blank: !0
                })
            }
            a.push(c)
        }
        return a
    },
    focusPanel: function(a) {
        this.alignListsPanel(a.colIndex)
    },
    buildPanels: function(a, b) {
        for (var c = 0 !== b.length ? 1 / b.length : 0, d = 0; d < b.length; d++) {
            var e = new Sfdc.layout.SummaryLayoutRemovableColumnPanel({
                columnWidth: c,
                cls: "slPropsColItem",
                removable: b.length !== SummaryLayoutEditor.SUMMARY_LAYOUT_MIN_COL,
                colIndex: d,
                fields: b[d],
                listeners: {
                    panelFocus: this.focusPanel,
                    closePanel: this.deleteColumn,
                    scope: this
                }
            });
            0 === d && e.addClass("slPropsColItemFirst");
            a.add(e)
        }
    },
    loadFieldLists: function() {
        var a = Ext.getCmp("slPropsFieldLists");
        if (0 === a.items.getCount()) {
            for (var b = [], c = function(a) {
                    delete a.combo.lastQuery
                }, d = function(a) {
                    this.itemStore.getById(a.getValue()) && this.itemStore.getById(a.getValue()).set("usedHPRecord", !1)
                }, e = function(a, b, c) {
                    if (!0 === b.get("usedHPRecord")) return !1
                }, g = function(a) {
                    this.itemStore.clearFilter();
                    this.itemStore.getById(a.getValue()) && this.itemStore.getById(a.getValue()).set("usedHPRecord", !0)
                }, f = 0; 2 > f; f++) {
                var h = "slFieldListPrimary";
                0 === f ? b.push(new Ext.BoxComponent({
                    autoEl: {
                        tag: "div",
                        html: LC.getLabel("SummaryLayoutProps",
                            "topField"),
                        cls: "labelText"
                    }
                })) : (h = "slFieldListSecondary", b.push(new Ext.BoxComponent({
                    autoEl: {
                        tag: "div",
                        html: LC.getLabel("SummaryLayoutProps", "bottomField"),
                        style: "padding-top: 10px",
                        cls: "labelText"
                    }
                })));
                b.push(new Ext.form.ComboBox({
                    id: h,
                    store: this.itemStore,
                    cls: "slPropsFieldsList",
                    listClass: "slPropsFieldsListInner",
                    valueField: "id",
                    displayField: "label",
                    typeAhead: !0,
                    forceSelection: !0,
                    selectOnFocus: !0,
                    triggerAction: "all",
                    mode: "local",
                    validationEvent: !1,
                    validateOnBlur: !1,
                    listeners: {
                        blur: this.comboOnBlur,
                        select: this.comboOnSelect,
                        beforequery: c,
                        beforeselect: e,
                        expand: d,
                        collapse: g,
                        scope: this
                    },
                    plugins: Sfdc.layout.ComboBoxPlugin
                }))
            }
            b = new Ext.Panel({
                id: "bubblePanel",
                colSiblingIndex: 0,
                items: [new Ext.BoxComponent({
                    id: "slPropsListsRoofDiv",
                    autoEl: {
                        tag: "div",
                        cls: "slPropsListsRoof"
                    }
                }), {
                    xtype: "panel",
                    id: "slPropsListsDiv",
                    cls: "slPropsLists",
                    layout: "anchor",
                    items: b
                }]
            });
            a.add(b);
            a.doLayout();
            Ext.getCmp("slPropsListsRoofDiv").el.alignTo(Ext.getCmp("slPropsListsRoofDiv").el.parent(), "t", [-15, 0])
        }
    },
    comboOnBlur: function(a) {
        if (Ext.isEmpty(a.getRawValue())) a.setValue(null);
        else {
            var b = a.store.find("label", a.getRawValue(), 0, !1, !0);
            !(a.store.getById(a.getValue()) && a.getRawValue() === a.store.getById(a.getValue()).get("label")) && -1 !== b && (!1 === a.store.getAt(b).get("usedHPRecord") ? (b = a.store.getAt(b).get("id"), a.setValue(b), this.comboOnSelect(a, b)) : a.collapse())
        }
    },
    comboOnSelect: function(a, b, c) {
        b = a.ownerCt.ownerCt.colSiblingIndex;
        c = "slFieldListPrimary" === a.id ? 0 : 1;
        this.disableStoreItem(a.getValue(), b, c);
        this.fieldIDs[b][c] = a.getValue();
        a = Ext.getCmp("slPropsFieldColumns");
        c = [];
        this.itemStore.clearFilter();
        c[0] = this.itemStore.getById(Ext.getCmp("slFieldListPrimary").getValue()) ? this.itemStore.getById(Ext.getCmp("slFieldListPrimary").getValue()).data : {
            blank: !0
        };
        c[1] = this.itemStore.getById(Ext.getCmp("slFieldListSecondary").getValue()) ? this.itemStore.getById(Ext.getCmp("slFieldListSecondary").getValue()).data : {
            blank: !0
        };
        a.items.get(b).updateDisplay(c);
        this.alignListsPanel(b)
    },
    disableStoreItem: function(a, b, c) {
        this.itemStore.clearFilter();
        this.itemStore.getById(this.fieldIDs[b][c]) &&
            this.itemStore.getById(this.fieldIDs[b][c]).set("usedHPRecord", !1);
        this.itemStore.getById(a) && null !== a && this.itemStore.getById(a).set("usedHPRecord", !0)
    },
    alignListsPanel: function(a) {
        this.itemStore.clearFilter();
        for (var b = Ext.getCmp("bubblePanel"), c = Ext.getCmp("slPropsListsRoofDiv"), d = Ext.getCmp("slPropsFieldColumns"), e = d.items.get(a), g = 14, f = 0; f < d.items.length; f++) var h = d.items.get(f).el.child(".slItemWrap"),
            g = Math.max(g, h.getHeight());
        for (f = 0; f < d.items.length; f++) h = d.items.get(f), h.el.child(".slItemWrap").setHeight(g);
        g = g - e.el.getHeight() + 30;
        e.el.getWidth() < b.el.getWidth() && 0 === a ? (c.el.alignTo(c.el.parent(), "tl", [Math.floor(e.el.getWidth() / 2) - Math.floor(c.el.getWidth() / 2), 0]), b.el.alignTo(e.el, "bl", [0, g])) : e.el.getWidth() < b.el.getWidth() && a === d.items.getCount() - 1 ? (c.el.alignTo(c.el.parent(), "tr", [Math.floor(e.el.getWidth() / -2) - Math.floor(c.el.getWidth() / 2), 0]), b.el.alignTo(e.el, "br", [-1 * b.el.getWidth(), g])) : (c.el.alignTo(c.el.parent(), "t", [Math.floor(c.el.getWidth() / -2), 0]), c = Math.floor(b.el.getWidth() / -2), b.el.alignTo(e.el,
            "b", [c, g]));
        b.colSiblingIndex = 0 + a;
        this.setFieldsValue(b)
    },
    setFieldsValue: function(a) {
        Ext.getCmp("slFieldListPrimary").setValue(this.fieldIDs[a.colSiblingIndex][0]);
        Ext.getCmp("slFieldListSecondary").setValue(this.fieldIDs[a.colSiblingIndex][1])
    },
    acceptItems: function(a) {
        var b = a.data;
        a = b.type;
        if (a == ColumnType.HTMLSTRINGPLUSCLOB.datatypeLetter) return !1;
        b = b.category;
        return "StandardField" == b ? !0 : "CustomField" == b ? a == ColumnType.STRINGPLUSCLOB.datatypeLetter ? !1 : !0 : !1
    },
    load: function(a, b) {
        this.fieldIDs = [];
        this.columnHeader =
            b || "";
        this.itemStore.removeAll();
        this.populateStore(a);
        this.itemStore.each(function(a) {
            a.set("usedHPRecord", !1)
        }, this);
        for (var c = 0; c < a.length; c++) {
            this.fieldIDs[c] = a[c].clone();
            for (var d = 0; d < this.fieldIDs[c].length; d++) this.itemStore.getById(this.fieldIDs[c][d]) || (this.fieldIDs[c][d] = null), this.disableStoreItem(this.fieldIDs[c][d], c, d)
        }
    },
    saveChanges: function(a, b) {
        if (b.getTarget() === Ext.get("slPropsOKBtn").dom || b.within(Ext.get("slPropsOKBtn").dom)) this.handler.perform({
            type: "SetSummaryLayoutProperties",
            columns: this.fieldIDs,
            columnHeader: this.columnHeader
        }), this.hide()
    },
    addColumn: function() {
        this.fieldIDs.length < SummaryLayoutEditor.SUMMARY_LAYOUT_MAX_COL && (this.fieldIDs.splice(this.fieldIDs.length, 0, [null, null]), this.renderSLColumns(Ext.getCmp("bubblePanel").colSiblingIndex));
        if (this.fieldIDs.length === SummaryLayoutEditor.SUMMARY_LAYOUT_MAX_COL) {
            var a = Ext.getCmp("slPropsAddColButton");
            a.disable();
            a.el.child("button").dom.title = LC.getLabel("SummaryLayoutProps", "addColumnDisabledTooltip")
        }
        a = Ext.getCmp("slPropsFieldColumns").items;
        a.get(a.getCount() - 1).el.select(".slItemWrap").highlight();
        this.alignListsPanel(this.fieldIDs.length - 1)
    },
    deleteColumn: function(a) {
        if (this.fieldIDs.length !== SummaryLayoutEditor.SUMMARY_LAYOUT_MIN_COL) {
            if (1 < this.fieldIDs.length) {
                for (var b = this.fieldIDs[a.colIndex], c = 0; c < b.length; c++) null !== b[c] && this.itemStore.getById(b[c]).set("usedHPRecord", !1);
                this.fieldIDs.splice(a.colIndex, 1);
                b = Ext.getCmp("bubblePanel").colSiblingIndex;
                b > a.colIndex ? b-- : b === a.colIndex && (b = 0);
                this.renderSLColumns(b)
            }
            this.fieldIDs.length <
                SummaryLayoutEditor.SUMMARY_LAYOUT_MAX_COL && (a = Ext.getCmp("slPropsAddColButton"), a.enable(), a.el.child("button").dom.title = LC.getLabel("SummaryLayoutProps", "addColumnTooltip"));
            this.fieldIDs.length === SummaryLayoutEditor.SUMMARY_LAYOUT_MIN_COL && Ext.getCmp("slPropsFieldColumns").items.get(0).setRemovable(!1)
        }
    }
});
Sfdc.layout.ComboBoxPlugin = {
    init: function(a) {
        a.tpl = '\x3ctpl for\x3d"."\x3e\x3cdiv class\x3d"x-combo-list-item {[values.usedHPRecord ? "slPropsUsedStoreItem" : "" ]}" {[values.usedHPRecord ? "title\x3d\'"+LC.getLabel("SummaryLayoutProps", "selectedFieldTooltip")+"\'" : "" ]}\x3e{label:htmlEncode}\x3c/div\x3e\x3c/tpl\x3e';
        a.initList = a.initList.createSequence(function() {
            a.store.clearFilter();
            this.innerList.setWidth("auto");
            this.list.setWidth("auto");
            this.innerList.setWidth(this.innerList.getWidth() +
                Sfdc.layout.DisplayAttributes.getScrollbarWidth())
        });
        a.onTypeAhead = function() {
            if (0 < this.store.getCount()) {
                var a = this.store.getAt(0);
                if (!1 === a.get("usedHPRecord") && null !== a.get("id")) {
                    var a = a.data[this.displayField],
                        c = a.length,
                        d = this.getRawValue().length;
                    d != c && (this.setRawValue(a), this.selectText(d, a.length))
                }
            }
        }
    }
};
Sfdc.layout.SummaryLayoutRemovableColumnPanel = function(a) {
    Sfdc.layout.SummaryLayoutRemovableColumnPanel.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.layout.SummaryLayoutRemovableColumnPanel, Ext.Panel, {
    initComponent: function() {
        Sfdc.layout.SummaryLayoutRemovableColumnPanel.superclass.initComponent.apply(this, arguments);
        this.addEvents({
            panelFocus: !0
        }, {
            closePanel: !0
        })
    },
    onRender: function() {
        Sfdc.layout.SummaryLayoutRemovableColumnPanel.superclass.onRender.apply(this, arguments);
        this.updateDisplay(this.fields)
    },
    updateDisplay: function(a) {
        1 == a.length && a.push({
            blank: !0
        });
        this.overwrite(this.el, a);
        this.setupEvents()
    },
    overwrite: function(a,
        b) {
        Sfdc.layout.SummaryLayoutPropertiesWindow.itemTPL.overwrite(a, b);
        var c = this.removable ? LC.getLabel("SummaryLayoutProps", "removeColTootip") : LC.getLabel("SummaryLayoutProps", "cannotRemoveColTootip");
        this.el.down(".slPropsDeleteButton").set({
            title: c
        })
    },
    setupEvents: function() {
        this.mons = [];
        this.mon(this.el, "mouseover", this.highlightColumn.createDelegate(this, [!0]));
        this.mon(this.el, "mouseout", this.highlightColumn.createDelegate(this, [!1]));
        this.mon(this.el, "click", this.onClick, this);
        this.setupDeleteEvents()
    },
    setupDeleteEvents: function() {
        this.mon(this.el.down(".slPropsDeleteButton"), "mouseover", function() {
            this.removable && this.el.down(".slPropsDeleteButton").addClass("slPropsDeleteButtonHover")
        }, this);
        this.mon(this.el.down(".slPropsDeleteButton"), "mouseout", function() {
            this.removable && this.el.down(".slPropsDeleteButton").removeClass("slPropsDeleteButtonHover")
        }, this);
        this.mon(this.el.down(".slPropsDeleteButton"), "click", this.onClose, this)
    },
    onClick: function() {
        this.fireEvent("panelFocus", {
            colIndex: this.colIndex
        })
    },
    onClose: function() {
        this.fireEvent("closePanel", {
            colIndex: this.colIndex
        })
    },
    highlightColumn: function(a) {
        a ? this.el.child(".slItemWrap").addClass("highlightBorder") : this.el.child(".slItemWrap").removeClass("highlightBorder");
        this.highlightDeleteButton(a)
    },
    highlightDeleteButton: function(a) {
        var b = this.removable ? "slPropsDeleteButtonShow" : "slPropsDeleteButtonShowDisabled";
        a ? (this.el.down(".slPropsDeleteButton").alignTo(this.el.down(".slItemWrap"), "tr", [-12, -5]), this.el.child(".slPropsDeleteButton").addClass(b)) :
            this.el.child(".slPropsDeleteButton").removeClass(b)
    },
    setRemovable: function(a) {
        this.removable = a
    }
});
Sfdc.layout.CaseInteractionSummaryLayoutColumnPanel = function(a) {
    Sfdc.layout.CaseInteractionSummaryLayoutColumnPanel.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.layout.CaseInteractionSummaryLayoutColumnPanel, Sfdc.layout.SummaryLayoutRemovableColumnPanel, {
    overwrite: function(a, b) {
        0 === this.colIndex ? Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.item0TPL.overwrite(a, b) : 1 === this.colIndex ? Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.item1TPL.overwrite(a, b) : Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.item2TPL.overwrite(a, b)
    },
    highlightDeleteButton: function(a) {},
    setupDeleteEvents: function() {}
});
Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow = function(a) {
    Ext.apply(a, {
        isFixedColumns: !0
    });
    Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.superclass.constructor.call(this, a)
};
Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.item0TPL = (new Ext.XTemplate('\x3cdiv class\x3d"slItemWrap"\x3e', '\x3cdiv class\x3d"slItemWrapBackground"\x3e', '\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 1"\x3e', '\x3ctpl if\x3d"values.label"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3cdiv class\x3d"label"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpTop"\x3e',
    '\x3cdiv class\x3d"label"\x3eCustomer\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e\x3c/tpl\x3e\x3c/tpl\x3e",
    '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 3"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 4"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e',
    "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 5"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e',
    '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/div\x3e\x3c/div\x3e")).compile();
Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.item1TPL = (new Ext.XTemplate('\x3cdiv class\x3d"slItemWrap"\x3e', '\x3cdiv class\x3d"slItemWrapBackground"\x3e', '\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', "\x3cdiv\x3e", '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"label sideLabel"\x3eCase\x3c/div\x3e\x3cdiv class\x3d"sideValue"\x3eGEN-2004-001234\x3c/div\x3e', "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"label sideLabel"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e\x3cdiv class\x3d"sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    "\x3c/tpl\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 3"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"label sideLabel"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e\x3cdiv class\x3d"sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/tpl\x3e", '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"label sideLabel"\x3eCreated Date\x3c/div\x3e\x3cdiv\x3e8/9/2011\x3c/div\x3e', "\x3c/tpl\x3e", '\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e',
    "\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 4"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 5"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/div\x3e\x3c/div\x3e")).compile();
Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.item2TPL = (new Ext.XTemplate('\x3cdiv class\x3d"slItemWrap"\x3e', '\x3cdiv class\x3d"slItemWrapBackground"\x3e', '\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e',
    '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', '\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e\x3c/tpl\x3e\x3c/tpl\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 3"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    '\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e', "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 4"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    '\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e', "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 5"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.blank \x3d\x3d\x3d true"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/div\x3e\x3c/div\x3e")).compile();
Ext.extend(Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow, Sfdc.layout.SummaryLayoutPropertiesWindow, {
    width: 1200,
    height: 650,
    loadFieldLists: function() {
        var a = Ext.getCmp("slPropsFieldLists");
        if (0 === a.items.getCount()) {
            var b = [],
                c = function(a) {
                    delete a.combo.lastQuery
                },
                d = function(a) {
                    1 === a.ownerCt.ownerCt.colSiblingIndex && this.itemStore.filterBy(this.textItems, null, !0);
                    this.itemStore.getById(a.getValue()) && this.itemStore.getById(a.getValue()).set("usedHPRecord", !1)
                },
                e = function(a, b, c) {
                    if (!0 === b.get("usedHPRecord")) return !1
                },
                g = function(a) {
                    this.itemStore.clearFilter();
                    this.itemStore.getById(a.getValue()) && this.itemStore.getById(a.getValue()).set("usedHPRecord", !0)
                },
                f = {};
            f[0] = LC.getLabel("CISummaryLayoutProps", "field0");
            f[1] = LC.getLabel("CISummaryLayoutProps", "field1");
            f[2] = LC.getLabel("CISummaryLayoutProps", "field2");
            f[3] = LC.getLabel("CISummaryLayoutProps", "field3");
            b.push(new Ext.Panel({
                id: "slFixedFields",
                hidden: !0,
                width: 360,
                items: [new Ext.BoxComponent({
                    id: "slFixedFields0",
                    cls: "slFixedFieldsLeft",
                    width: 180,
                    autoEl: {
                        tag: "div",
                        html: '\x3cdiv class\x3d"labelText labelBox"\x3e' + f[0] + "\x3c/div\x3e" + this.itemStore.getById(this.fieldIDs[1][0]).data.label
                    }
                }), new Ext.BoxComponent({
                    id: "slFixedFields1",
                    cls: "slFixedFieldsRight",
                    autoEl: {
                        tag: "div",
                        html: '\x3cdiv class\x3d"labelText labelBox"\x3e' + f[1] + "\x3c/div\x3e" + this.itemStore.getById(this.fieldIDs[1][1]).data.label
                    }
                })]
            }));
            b.push(new Ext.BoxComponent({
                id: "slLabelInputLabel",
                autoEl: {
                    tag: "div",
                    html: "Label",
                    cls: "labelText"
                }
            }));
            b.push(new Ext.form.TextField({
                id: "slLabelInput",
                maxLength: 80,
                enableKeyEvents: !0,
                listeners: {
                    keyup: {
                        fn: this.textFieldOnKeyUp,
                        buffer: 1E3
                    },
                    scope: this
                }
            }));
            for (var h = 0; 4 > h; h++) {
                var k = "slFieldList" + h;
                b.push(new Ext.BoxComponent({
                    id: "slFieldLabel" + h,
                    autoEl: {
                        tag: "div",
                        html: f[h],
                        style: "padding-top: 10px",
                        cls: "labelText"
                    }
                }));
                b.push(new Ext.form.ComboBox({
                    id: k,
                    store: this.itemStore,
                    cls: "slPropsFieldsList",
                    listClass: "slPropsFieldsListInner",
                    valueField: "id",
                    displayField: "label",
                    typeAhead: !0,
                    forceSelection: !0,
                    selectOnFocus: !0,
                    triggerAction: "all",
                    mode: "local",
                    validationEvent: !1,
                    validateOnBlur: !1,
                    listeners: {
                        blur: this.comboOnBlur,
                        select: this.comboOnSelect,
                        beforequery: c,
                        beforeselect: e,
                        expand: d,
                        collapse: g,
                        scope: this
                    },
                    plugins: Sfdc.layout.ComboBoxPlugin
                }))
            }
            b = new Ext.Panel({
                id: "bubblePanel",
                colSiblingIndex: 0,
                items: [new Ext.BoxComponent({
                    id: "slPropsListsRoofDiv",
                    autoEl: {
                        tag: "div",
                        cls: "slPropsListsRoof"
                    }
                }), {
                    xtype: "panel",
                    id: "slPropsListsDiv",
                    cls: "slPropsLists",
                    layout: "anchor",
                    items: b
                }]
            });
            a.add(b);
            a.doLayout();
            Ext.getCmp("slPropsListsRoofDiv").el.alignTo(Ext.getCmp("slPropsListsRoofDiv").el.parent(),
                "t", [-15, 0])
        }
    },
    setFieldsValue: function(a) {
        0 === a.colSiblingIndex && Ext.getCmp("slLabelInput").setValue(this.columnHeader);
        Ext.getCmp("slFieldList0").setValue(this.fieldIDs[a.colSiblingIndex][0]);
        Ext.getCmp("slFieldList1").setValue(this.fieldIDs[a.colSiblingIndex][1]);
        Ext.getCmp("slFieldList2").setValue(this.fieldIDs[a.colSiblingIndex][2]);
        Ext.getCmp("slFieldList3").setValue(this.fieldIDs[a.colSiblingIndex][3])
    },
    getFieldIndex: function(a) {
        return parseInt(a.substring(11), 10)
    },
    comboOnSelect: function(a,
        b, c) {
        b = a.ownerCt.ownerCt.colSiblingIndex;
        c = this.getFieldIndex(a.id);
        this.disableStoreItem(a.getValue(), b, c);
        this.fieldIDs[b][c] = a.getValue();
        this.updateHPTemplate(b)
    },
    textFieldOnKeyUp: function(a, b) {
        var c = a.ownerCt.ownerCt.colSiblingIndex;
        this.columnHeader = Ext.getCmp("slLabelInput").getValue() || "";
        this.updateHPTemplate(c)
    },
    updateHPTemplate: function(a) {
        var b = Ext.getCmp("slPropsFieldColumns");
        this.itemStore.clearFilter();
        var c = [];
        c[0] = Ext.getCmp("slLabelInput").getValue() ? {
            label: Ext.getCmp("slLabelInput").getValue()
        } : {
            blank: !0
        };
        c[1] = this.itemStore.getById(Ext.getCmp("slFieldList0").getValue()) ? this.itemStore.getById(Ext.getCmp("slFieldList0").getValue()).data : {
            blank: !0
        };
        c[2] = this.itemStore.getById(Ext.getCmp("slFieldList1").getValue()) ? this.itemStore.getById(Ext.getCmp("slFieldList1").getValue()).data : {
            blank: !0
        };
        c[3] = this.itemStore.getById(Ext.getCmp("slFieldList2").getValue()) ? this.itemStore.getById(Ext.getCmp("slFieldList2").getValue()).data : {
            blank: !0
        };
        c[4] = this.itemStore.getById(Ext.getCmp("slFieldList3").getValue()) ?
            this.itemStore.getById(Ext.getCmp("slFieldList3").getValue()).data : {
                blank: !0
            };
        b.items.get(a).updateDisplay(c);
        this.alignListsPanel(a)
    },
    textItems: function(a) {
        a = a.data;
        var b = a.type;
        return a.isNoneItem || b == ColumnType.TEXT.datatypeLetter || b == ColumnType.MULTILINETEXT.datatypeLetter || b == ColumnType.STRINGPLUSCLOB.datatypeLetter && "StandardField" == a.category
    },
    alignListsPanel: function(a) {
        0 !== a ? (Ext.getCmp("slLabelInputLabel").hide(), Ext.getCmp("slLabelInput").hide()) : (Ext.getCmp("slLabelInputLabel").show(),
            Ext.getCmp("slLabelInput").show());
        1 == a ? (Ext.getCmp("slFieldLabel0").hide(), Ext.getCmp("slFieldList0").hide(), Ext.getCmp("slFieldLabel1").hide(), Ext.getCmp("slFieldList1").hide(), Ext.getCmp("slFixedFields").show()) : (Ext.getCmp("slFieldLabel0").show(), Ext.getCmp("slFieldList0").show(), Ext.getCmp("slFieldLabel1").show(), Ext.getCmp("slFieldList1").show(), Ext.getCmp("slFixedFields").hide());
        Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow.superclass.alignListsPanel.call(this, a)
    },
    createOutData: function() {
        var a = [];
        this.itemStore.clearFilter();
        for (var b = 0; b < this.fieldIDs.length; b++) {
            var c = [];
            0 === b && this.columnHeader ? c.push({
                label: this.columnHeader
            }) : c.push({
                blank: !0
            });
            for (var d = 0; d < this.fieldIDs[b].length; d++) {
                var e = this.itemStore.getById(this.fieldIDs[b][d]);
                e ? c.push(e.data) : c.push({
                    blank: !0
                })
            }
            a.push(c)
        }
        return a
    },
    buildPanels: function(a, b) {
        for (var c = 0; c < b.length; c++) {
            var d = new Sfdc.layout.CaseInteractionSummaryLayoutColumnPanel({
                columnWidth: 1 !== c ? 0.25 : 0.5,
                cls: "slPropsColItem",
                removable: !1,
                colIndex: c,
                fields: b[c],
                listeners: {
                    panelFocus: this.focusPanel,
                    closePanel: this.deleteColumn,
                    scope: this
                }
            });
            0 === c && d.addClass("slPropsColItemFirst");
            a.add(d)
        }
    },
    populateStore: function(a) {
        this.itemStore.add(new this.store.recordType({
            id: null,
            label: LC.getLabel("SelectElement", "Required"),
            usedHPRecord: !1,
            isNoneItem: !0
        }));
        this.store.clearFilter(!0);
        this.store.filterBy(this.acceptItems, null, !0);
        this.store.each(function(b) {
            if ("used" === b.get("state") || b.get("id") === a[1][0] || b.get("id") === a[1][1]) b = b.copy(), b.set("usedHPRecord", !1),
                this.itemStore.add(b)
        }, this);
        var b = this.itemStore.getById("CreatedDate");
        b && b.set("label", LC.getLabel("CaseInteraction", "CreatedDate"));
        this.store.filterFn && this.store.filterBy(this.store.filterFn, null, !0)
    },
    onWindowScroll: function(a) {}
});
Sfdc.layout.RelatedList = function(a) {
    Sfdc.layout.RelatedList.superclass.constructor.call(this, a);
    if (!a.store) throw "Programmer error, RelatedList not provided with store";
    this.store = a.store;
    this.body = new Sfdc.PageBlock
};
Sfdc.layout.RelatedList.ColumnRecord = Ext.data.Record.create(["filterColumn", "label", "isSortable", "type", "sampleData"]);
Sfdc.layout.RelatedList.columnTpl = (new Ext.XTemplate('\x3ctable class\x3d"list" cellspacing\x3d"0" cellpadding\x3d"0" border\x3d"0"\x3e\x3ctbody\x3e\x3ctr class\x3d"headerRow"\x3e', '\x3ctpl for\x3d"columns"\x3e', '\x3cth scope\x3d"col"\x3e{label:htmlEncode}', '\x3ctpl if\x3d"parent.sortColumn \x3d\x3d filterColumn"\x3e', '\x3ctpl if\x3d"!parent.sortDesc"\x3e \x3cimg class\x3d"sortIcon asc" src\x3d"/img/ple/doublearrowup.gif" alt\x3d"{[LC.getLabel("LayoutDND", "sortAsc")]}"\x3e\x3c/img\x3e\x3c/tpl\x3e',
    '\x3ctpl if\x3d"parent.sortDesc"\x3e \x3cimg class\x3d"sortIcon desc" src\x3d"/img/ple/doublearrowdown.gif" alt\x3d"{[LC.getLabel("LayoutDND", "sortDesc")]}"\x3e\x3c/img\x3e\x3c/tpl\x3e', "\x3c/tpl\x3e", "\x3c/th\x3e", "\x3c/tpl\x3e", "\x3c/tr\x3e", '\x3ctr class\x3d"dataRow even last first"\x3e', '\x3ctpl for\x3d"columns"\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d 1"\x3e\x3cth scope\x3d"row"\x3c/tpl\x3e\x3ctpl if\x3d"xindex \x26gt; 1"\x3e\x3ctd\x3c/tpl\x3e', ' class\x3d"dataCell"\x3e{[Sfdc.layout.FieldSection.makeSample(values)]}',
    '\x3ctpl if\x3d"xindex \x3d\x3d 1"\x3e\x3c/th\x3e\x3c/tpl\x3e\x3ctpl if\x3d"xindex \x26gt; 1"\x3e\x3c/td\x3e\x3c/tpl\x3e', "\x3c/tpl\x3e", "\x3c/tr\x3e\x3c/tbody\x3e\x3c/table\x3e")).compile();
Sfdc.layout.RelatedList.handleTpl = (new Ext.XTemplate('\x3cdiv class\x3d"widget"\x3e', '\x3ctpl if\x3d"listCustomizable"\x3e\x3cdiv class\x3d"properties"\x3e\x26nbsp;\x3c/div\x3e\x3c/tpl\x3e', '\x3cdiv class\x3d"remove"\x3e\x26nbsp;\x3c/div\x3e\x3c/div\x3e', '\x3cimg alt\x3d"" src\x3d"/img/func_icons/dragaffordance.gif" class\x3d"dragHandle"\x3e\x3c/img\x3e\x26nbsp;')).compile();
Ext.extend(Sfdc.layout.RelatedList, Ext.BoxComponent, {
    baseCls: "relatedList",
    autoEl: !1,
    _getStoreItem: function () {
        return this.store.getItems(this.id)[0]
    },
    onRender: function(a, c) {
        Sfdc.layout.RelatedList.superclass.onRender.apply(this, arguments);
        var b = [];
        this.handler && b.push({
            tag: "div",
            cls: "handle"
        });
        b.push({
            tag: "div",
            cls: "rlBody"
        });
        this.el = a.createChild({
            tag: "div",
            id: Sfdc.layout.Section.makeElementId(this.id),
            cls: "relatedList",
            children: b
        }, c);
        var d = this._getStoreItem().data;
        if (this.handler) {
            this.handle =
                this.el.child(".handle");
            Sfdc.layout.RelatedList.handleTpl.overwrite(this.handle, d);
            b = this.handle.child(".remove");
            b.addClassOnOver("hover");
            b.on("click", this.removeClick, this);
            Ext.QuickTips.register({
                target: b,
                text: LC.getLabel("LayoutDND", "RemoveRelatedList")
            });
            if (b = this.handle.child(".properties")) b.addClassOnOver("hover"), b.on("click", this.propertiesClick, this), Ext.QuickTips.register({
                target: b,
                text: LC.getLabel("LayoutDND", "RelatedListProperties")
            });
            this.handle.on({
                mouseover: this.handleMouseOver,
                mouseout: this.handleMouseOut,
                dblclick: this.propertiesClick,
                scope: this
            })
        }
        b = this.el.child(".rlBody");
        this.body.render(b);
        if (!1 === d.listCustomizable) this.body.body.createChild(LC.getLabel("LayoutDND", "ListNotCustomizable"));
        else {
            b = this.columnStore.getItems(d.customizedColumns || d.defaultColumns).pluck("data");
            Sfdc.layout.RelatedList.columnTpl.overwrite(this.body.body, {
                sortColumn: d.sortColumn,
                sortDesc: d.sortDesc,
                columns: b
            });
            var e = [];
            d.stdListButtons && d.stdListButtons.each(function(a) {
                var b = !d.stdListButtonsRevoked ||
                    !(a.id in d.stdListButtonsRevoked);
                a.isDefaultOff && (b = !b);
                b && e.push({
                    tag: "div",
                    cls: "btnDisabled",
                    id: this.id + "_" + a.id,
                    html: Ext.util.Format.htmlEncode(a.label)
                })
            }, this);
            d.customListButtonsAdded && (d.customListButtonsAdded = d.customListButtonsAdded.select(function(a) {
                var b = d.customListButtons.find(function(b) {
                    return b.id == a
                });
                return b ? (e.push({
                    tag: "div",
                    cls: "rlButton",
                    id: this.id + "_" + b.id,
                    html: Ext.util.Format.htmlEncode(b.label)
                }), !0) : !1
            }, this));
            this.setButtons(e)
        }
    },
    handleMouseOver: function(a) {
        Ext.dd.DragDropMgr.dragCurrent ||
            this.handle.addClass("hover")
    },
    handleMouseOut: function(a) {
        a = a.getRelatedTarget();
        this.handle.contains(a) || this.handle.removeClass("hover")
    },
    onDestroy: function() {
        if (this.handle) {
            var a = this.handle.child(".remove");
            a && Ext.QuickTips.unregister(a);
            (a = this.handle.child(".properties")) && Ext.QuickTips.unregister(a)
        }
        Sfdc.layout.RelatedList.superclass.onDestroy.apply(this, arguments)
    },
    removeClick: function(a) {
        this.handler.perform({
            type: "Remove",
            itemIds: [this.id],
            canvasData: {}
        })
    },
    propertiesClick: function(a) {
        this.ownerCt.ownerCt.showRelatedListPropertiesWindow(this.id)
    },
    setTitle: function(a) {
        this.body.setTitle(Ext.util.Format.htmlEncode(a))
    },
    setButtons: function(a) {
        this.body.setButtons(a)
    },
    save: function() {
        var a = this._getStoreItem().data,
            c = {
                id: this.id,
                customListButtonsAdded: a.customListButtonsAdded,
                stdListButtonsRevoked: a.stdListButtonsRevoked
            };
        "customizedColumns" in a && (c.customizedColumns = a.customizedColumns);
        "sortColumn" in a && (c.sortColumn = a.sortColumn, c.sortDesc = a.sortDesc);
        "applyToOtherLayoutsData" in a && (c.applyToOtherLayoutsData = a.applyToOtherLayoutsData);
        return c
    },
    load: function (a) {
        var c = this._getStoreItem();
        if (a) {
            c.data.relatedListId = a.relatedListId

        }
        this.setTitle(c.data.label);
        a && ("customizedColumns customListButtonsAdded stdListButtonsRevoked sortColumn applyToOtherLayoutsData applyToOtherLayoutsInitData".split(" ").each(function (b) {
            a[b] && (c.data[b] = a[b], "sortColumn" == b && (c.data.sortDesc = a.sortDesc))
        }), "selectableColumns" in a && (c.data.selectableColumns = a.selectableColumns, c.data.columnsLoaded = a.columnsLoaded));
        c.data.listCustomizable && (this.columnStore = new Sfdc.JsonStore({
            data: c.data.selectableColumns,
            fields: Sfdc.layout.RelatedList.ColumnRecord,
            id: "filterColumn"
        }))
        
    }
});
Sfdc.layout.RelatedList.newAndLoad = function(a, c, b) {
    a = new Sfdc.layout.RelatedList({
        handler: a,
        store: c,
        id: b.item ? b.item.id : b.id,
        item: b.item,
        cls: b.className
    });
    a.load(b);
    return a
};
Ext.ns("Sfdc.layout.ControlElement");
Sfdc.layout.ControlElement.DEFAULT_WIDTH = -100;
Sfdc.layout.ControlElement.DEFAULT_HEIGHT = 50;
Sfdc.layout.AbstractSectionDragZone = function(a) {
    Ext.apply(this, a);
    Sfdc.layout.AbstractSectionDragZone.superclass.constructor.call(this, this.section.getEl(), a)
};
Ext.extend(Sfdc.layout.AbstractSectionDragZone, Sfdc.GrayingDragZone, {
    getSingleInnerDragElement: function(a, b) {
        return Ext.fly(a).child(".labelText") ? Ext.fly(a).child(".labelText").dom : a
    },
    getDragData: function(a) {
        a = this.getEntry(a);
        var b = this.getItemIds(a),
            c;
        if (!a) return !1;
        if (1 < b.length) {
            var d = document.createElement("DIV");
            d.id = Ext.id();
            d.innerHTML = LC.getLabel("LayoutDND", "MultipleDragProxy", b.length);
            c = document.createElement("DIV");
            c.className = "marker multiple";
            c.appendChild(d)
        } else c = document.createElement("DIV"),
            c.className = "marker", d = a.cloneNode(!0), d.id = Ext.id(), c.appendChild(this.getSingleInnerDragElement(d, b[0]));
        a = {
            source: this.source,
            sourceEl: this.getSourceEl(b),
            repairXY: Ext.fly(a).getXY(),
            ddel: c,
            selection: {},
            itemIds: b,
            noDelete: this.removable(b),
            className: this.section.className
        };
        this.afterDragData(a);
        a.noDelete && (a.noDeleteMsg = this.getNoDeleteMsg());
        return a
    },
    getSelection: function(a) {
        return this.section.ownerCt.getSelection()
    },
    getRepairXY: function() {
        return this.dragData.repairXY
    },
    getEntry: function(a) {
        return null
    },
    getItemIds: function(a) {
        return []
    },
    getSourceEl: function(a) {
        return Ext.select(a.collect(function(a) {
            return Ext.getDom(Sfdc.layout.Section.makeElementId(a))
        }))
    },
    afterDragData: Ext.emptyFn,
    removable: function(a) {
        a = this.getSelection(a);
        var b = [],
            c;
        for (c in a) a.hasOwnProperty(c) && (b = b.concat(Ext.getCmp(c).getItemDatas(a[c])));
        return b.all(this.noRemoveFn)
    },
    noRemoveFn: function(a) {
        return !0
    },
    getNoDeleteMsg: Ext.emptyFn,
    onBeforeDrag: function(a, b) {
        var c = null;
        if (a.itemIds && a.itemIds[0] && 0 <= a.itemIds[0].indexOf(window.NewLayoutEditor.BLANK_ID)) c =
            "EmptySpace";
        else if (a.itemIds && a.itemIds[0] && 0 <= a.itemIds[0].indexOf(window.NewLayoutEditor.PAGE_ID_PREFIX)) c = "RelatedLookup StandardField";
        else if (this.source === Sfdc.layout.RelatedContentSection.source) c = "RelatedLookup";
        else if (window.dragDropMap) {
            var d = this.el.dom.className.split(" ");
            Ext.each(window.dragDropMap.CustomLink, function(a) {
                0 <= d.indexOf(a) && (c = "CustomLink")
            });
            c || Ext.each(window.dragDropMap.StandardField, function(a) {
                0 <= d.indexOf(a) && (c = "StandardField")
            })
        }
        this.targetByItemType = c
    },
    onDrag: function(a) {
        this.targetByItemType &&
            Sfdc.layout.Trough.highlightDropSection(this.targetByItemType)
    },
    afterDragDrop: function(a, b, c) {
        Sfdc.layout.Trough.clearDropSection()
    }
});
Sfdc.layout.SectionDragZone = function(a) {
    Sfdc.layout.SectionDragZone.superclass.constructor.call(this, {
        source: a instanceof Sfdc.layout.RelatedContentSection ? Sfdc.layout.RelatedContentSection.source : "entry",
        section: a
    })
};
Ext.extend(Sfdc.layout.SectionDragZone, Sfdc.layout.AbstractSectionDragZone, {
    clearOnSuccessfulDrop: !0,
    getEntry: function(a) {
        a = a.getTarget("td.entryCell");
        return !a ? null : (a = Ext.fly(a).child("div.entry")) ? a.dom : null
    },
    getItemIds: function(a) {
        a = this.getSelection();
        var b = [],
            c;
        for (c in a) a.hasOwnProperty(c) && (b = b.concat(a[c]));
        return b
    },
    createFrame: Ext.emptyFn,
    afterDragData: function(a) {
        a.selection = this.getSelection()
    },
    noRemoveFn: function(a) {
        return a ? !Sfdc.layout.FieldSection.mayRemoveItem(a) : !1
    },
    getNoDeleteMsg: function() {
        return LC.getLabel("LayoutDND",
            "alertAlwaysDisplayedFieldVerbose")
    }
});
Sfdc.layout.SectionDropZone = function(a, b) {
    this.section = b
};
Ext.extend(Sfdc.layout.SectionDropZone, Sfdc.dd.DelegatedDropZone, {
    getTargetFromEvent: function(a) {
        var b = a.getTarget("td.entryCell"),
            c = b ? Ext.fly(b).child("div.entry") : null;
        if (c) return c = c.dom, b = this.section.getItemByElement(c), a = Ext.lib.Event.getPageY(a), c = (Ext.fly(c).getY() + Ext.fly(c).getBottom()) / 2, a <= c ? b.previous ? this._getTarget("below", b.previous) : this._getTarget("columnHead", b.column) : this._getTarget("below", b);
        c = Ext.lib.Event.getPageX(a);
        b = Ext.fly(this.section.table).getBox();
        c = (c - b.x) / b.width;
        if (0 > c || 1 < c) return !1;
        c = Math.floor(c * this.section.getNumColumns());
        if (this.section.isEmpty(c)) return this._getTarget("columnHead", c);
        if (Ext.lib.Event.getPageY(a) > b.y) {
            for (b = this.section.getColumnHead(c); b.next;) b = b.next;
            return this._getTarget("below", b)
        }
        return this._getTarget("columnHead", c)
    },
    onNodeEnter: function(a, b, c, d) {
        delete this.wasAllowed;
        (this.allowed = this.section.itemsAllowed(d.itemIds)) && this.mark(a)
    },
    onNodeOut: function(a, b, c, d) {
        this.allowed && (this.unmark(a), this.wasAllowed = !0);
        delete this.allowed
    },
    unmark: function(a) {
        if (a.below) Ext.fly(a.below.entry).parent("td").removeClass("marked");
        else if (!Ext.isEmpty(a.columnHead))
            if (this.section.isEmpty(a.columnHead)) {
                for (var b = Ext.fly(this.section.table).child("tr").down("td"), c = 0; c < a.columnHead; c++) b = b.next();
                b.removeClass("markedAbove")
            } else a = this.section.getColumnHead(a.columnHead), Ext.fly(a.entry).parent("td").removeClass("markedAbove")
    },
    mark: function(a) {
        if (a.below) Ext.fly(a.below.entry).parent("td").addClass("marked");
        else if (!Ext.isEmpty(a.columnHead))
            if (this.section.isEmpty(a.columnHead)) {
                for (var b =
                        Ext.fly(this.section.table).child("tr").down("td"), c = 0; c < a.columnHead; c++) b = b.next();
                b.addClass("markedAbove")
            } else a = this.section.getColumnHead(a.columnHead), Ext.fly(a.entry).parent("td").addClass("markedAbove")
    },
    onNodeOver: function(a, b, c, d) {
        if (this.allowed) return this.dropAllowed
    },
    onNodeDrop: function(a, b, c, d) {
        if (!this.wasAllowed) return !1;
        delete this.wasAllowed;
        b = {
            itemIds: d.itemIds
        };
        if ("trough" == d.source) b.type = "Add";
        else if ("entry" == d.source || d.source == Sfdc.layout.RelatedContentSection.source) b.type =
            "Move";
        else return !1;
        a.below ? this.section.addSectionData(b, d.selection, a.below.data.id) : Ext.isEmpty(a.columnHead) || this.section.addSectionData(b, d.selection, a.columnHead, !0);
        return this.section.performNodeDropAction(b)
    }
});
Sfdc.layout.Section = function(a) {
    Sfdc.layout.Section.superclass.constructor.call(this, a);
    this.handler && this.handler.addObserver(this);
    if (!a.store) throw "Programmer Error: Section must have a store";
    this.store = a.store;
    this.selection = [];
    this.itemsAllowed_memo = {};
    this.addEvents(["entryMouseDown", "entryMouseUp", "entryDoubleClick", "containerMouseDown", "countChanged"])
};
Ext.apply(Sfdc.layout.Section, {
    newSectionId: 0,
    ITEM_PREFIX: "item_"
});
Ext.apply(Sfdc.layout.Section, {
    makeElementId: function(a) {
        return Sfdc.layout.Section.ITEM_PREFIX + a
    },
    getItemId: function(a) {
        return a.substring(Sfdc.layout.Section.ITEM_PREFIX.length)
    }
});
Ext.extend(Sfdc.layout.Section, Ext.Panel, {
    selectItem: Ext.emptyFn,
    deselectItem: Ext.emptyFn,
    clearAllSelected: Ext.emptyFn,
    initEvents: function() {
        Sfdc.layout.Section.superclass.initEvents.apply(this, arguments);
        if (this.handler && (this.body.on({
                mousedown: this.onMouseDown,
                mouseup: this.onMouseUp,
                dblclick: this.onDblClick,
                scope: this
            }), Ext.isIE)) Ext.getBody().on("selectstart", function(a) {
            a.shiftKey && a.stopEvent()
        });
        if (this.header) this.header.on("mousedown", this.onHeaderMouseDown, this)
    },
    onDestroy: function() {
        this.handler.removeObserver(this);
        this.dragZone && Ext.destroy(this.dragZone);
        this.dropZone && Ext.destroy(this.dropZone);
        Sfdc.layout.Section.superclass.onDestroy.call(this)
    },
    onHeaderMouseDown: function(a) {
        this.fireEvent("containerMouseDown", this, a)
    },
    _getEntryFromEvent: function(a) {
        a = a.getTarget("td");
        var b;
        a && (b = Ext.fly(a).child("div.entry", !0));
        return b
    },
    onMouseDown: function(a) {
        var b = this._getEntryFromEvent(a);
        b ? (a.removeClick = a.getTarget(".remove", 2) ? !0 : !1, a.propertiesClick = a.getTarget(".properties", 2) ? !0 : !1, this.fireEvent("entryMouseDown",
            this, b, a)) : this.fireEvent("containerMouseDown", this, a)
    },
    onMouseUp: function(a) {
        var b = this._getEntryFromEvent(a);
        b && (a.removeClick = a.getTarget(".remove", 2) ? !0 : !1, a.propertiesClick = a.getTarget(".properties", 2) ? !0 : !1, this.fireEvent("entryMouseUp", this, b, a))
    },
    onDblClick: function(a) {
        var b = this._getEntryFromEvent(a);
        this.fireDblClickEvent(b) && (a.removeClick = a.getTarget(".remove", 2) ? !0 : !1, a.propertiesClick = a.getTarget(".properties", 2) ? !0 : !1, this.fireEvent("entryDoubleClick", this, b, a))
    },
    fireDblClickEvent: function(a) {
        return a &&
            VFEditor.itemsHaveProperties
    },
    select: function(a) {
        this.selectItem(a);
        this.isSelected(a) || this.selection.push(a)
    },
    deselect: function(a) {
        var b = this.selection.indexOf(a);
        0 <= b && (this.selection.splice(b, 1), this.deselectItem(a))
    },
    clearSelection: function() {
        0 < this.selection.length && (this.clearAllSelected(), this.selection = [], delete this.firstShift, delete this.lastShift)
    },
    isSelected: function(a) {
        return 0 <= this.selection.indexOf(a)
    },
    getSelection: function() {
        return this.selection
    },
    itemsAllowed: function(a) {
        if (!this.categoriesAllowed) return !0;
        for (var b = [], c = 0; c < a.length; c++)
            if (a[c] in this.itemsAllowed_memo) {
                if (!this.itemsAllowed_memo[a[c]]) return !1
            } else b.push(a[c]);
        if (0 === b.length) return !0;
        a = this._getStoreItems(b);
        for (var d = !0, c = 0; c < a.length; c++) this.isItemAllowed(b[c], a[c]) ? this.itemsAllowed_memo[b[c]] = !0 : d = this.itemsAllowed_memo[b[c]] = !1;
        return d
    },
    isItemAllowed: function(a, b) {
        return Sfdc.layout.Trough.isBlankId(a) || b.data.category in this.categoriesAllowed
    },
    isFixedSection: function() {
        return this.fixedSection
    },
    _getStoreItems: function(a) {
        return this.store.getItems(a)
    },
    getItemDatas: function(a) {
        return this._getStoreItems(a).pluck("data")
    },
    getItemsOfCategory: function(a) {
        return []
    },
    getItemCount: function() {
        return 0
    }
});
Sfdc.layout.UserPlaceholderSection = function(a) {
    Ext.applyIf(a, {
        allowRemove: !1,
        categoriesAllowed: {},
        canChangeColumns: !1,
        canDeleteSection: !1,
        fixedSection: !0
    });
    Sfdc.layout.UserPlaceholderSection.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.layout.UserPlaceholderSection, Sfdc.layout.Section, {
    height: 150,
    cls: "section userSection",
    header: !1,
    onRender: function() {
        Sfdc.layout.UserPlaceholderSection.superclass.onRender.apply(this, arguments);
        this.html = ['\x3cspan class\x3d"label"\x3e', Ext.util.Format.htmlEncode(this.title), '\x3c/span\x3e\x3cspan class\x3d"info"\x3e', Ext.util.Format.htmlEncode(this.info), "\x3c/span\x3e"].join("")
    }
});
Sfdc.layout.PlaceholderSection = function(a) {
    Ext.applyIf(a, {
        fixedSection: !0,
        allowRemove: !1,
        canChangeColumns: !1,
        canDeleteSection: !1,
        baseCls: "emptySection",
        store: {}
    });
    Sfdc.layout.PlaceholderSection.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.layout.PlaceholderSection, Sfdc.layout.Section, {
    header: !1,
    onRender: function() {
        Sfdc.layout.PlaceholderSection.superclass.onRender.apply(this, arguments)
    },
    acceptMessage: function() {
        return !1
    }
});
Sfdc.layout.FieldSection = function(a, b) {
    Ext.applyIf(b, {
        baseCls: "section",
        allowRemove: !0,
        categoriesAllowed: {
            CustomField: !0,
            StandardField: !0,
            Control: !0,
            CustomSControl: !0,
            Page: !0,
            Analytics: !0,
            EmptySpace: !0
        },
        canChangeColumns: !0,
        canDeleteSection: !0,
        fixedSection: !1,
        handler: a
    });
    a && Ext.applyIf(b, {
        tools: [{
            id: "remove",
            qtip: LC.getLabel("LayoutDND", "RemoveSection"),
            handler: function(a, b, c) {
                c.handler.perform({
                    type: "RemoveSection",
                    sectionId: c.id
                })
            }
        }, {
            id: "gear",
            qtip: LC.getLabel("LayoutDND", "SectionProperties"),
            handler: this.showSectionProps,
            scope: this
        }]
    });
    Sfdc.layout.FieldSection.superclass.constructor.call(this, b);
    this.sectionItems = [];
    this.itemsById = {};
    for (var c = 0; c < b.columns; c++) this.sectionItems.push(Sfdc.layout.FieldSection.EMPTY_COLUMN);
    this.dragZoneConstructor = b.dragZoneConstructor || Sfdc.layout.SectionDragZone
};
Sfdc.layout.FieldSection.makeSample = function(a, b) {
    if (a.sampleData) return a.sampleData;
    var c = b || a.type,
        d = a.typeArgs,
        f = a.label;
    if (!c) return "\x26nbsp;";
    var e = "";
    d && 0 < d.length && (e = d[0]);
    (c = sampleByType[c]) ? (c = c.replace(/%%/g, "%"), c = c.replace(/%f/g, Ext.util.Format.htmlEncode(f)), c = c.replace(/%l/g, Ext.util.Format.htmlEncode(e)), 0 <= c.indexOf("%n") && (f = Math.random(), d && 2 <= d.length && (f = Math.floor(f * Math.pow(10, Math.min(d[0], 5))) / Math.pow(10, d[1])), c = c.replace(/%n/g, f))) : c = LC.getLabel("Sample", "SampleText",
        Ext.util.Format.htmlEncode(f));
    return c
};
Sfdc.layout.FieldSection.EMPTY_COLUMN = {};
Sfdc.layout.Section.itemTemplate_preamble = '\x3cdiv id\x3d"' + Sfdc.layout.Section.ITEM_PREFIX + '{id}" class\x3d"entry\x3ctpl if\x3d"this.isAlwaysDisplayed(values)"\x3e alwaysDisplayed\x3c/tpl\x3e"\x3e\x3cdiv class\x3d"widget"\x3e\x3ctpl if\x3d"this.hasProperties(values)"\x3e\x3cdiv class\x3d"properties"\x3e\x26#160;\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"!this.isAlwaysDisplayed(values)"\x3e\x3cdiv class\x3d"remove"\x3e\x26#160;\x3c/div\x3e\x3c/tpl\x3e\x3c/div\x3e\x3cimg alt\x3d"" src\x3d"/img/func_icons/dragaffordance.gif" class\x3d"dragHandle"\x3e\x3c/img\x3e';
Sfdc.layout.Section.itemTemplate_genIcons = function(a) {
    return '\x3cspan class\x3d"labelIcons"\x3e\x3ctpl if\x3d"this.isRequired(values)"\x3e\x3cimg height\x3d"12" width\x3d"12" src\x3d"/img/ple/required12.gif" class\x3d"Required"\x3e\x3c/img\x3e' + (a ? "\x26nbsp;\x26nbsp;" : "") + '\x3c/tpl\x3e\x3ctpl if\x3d"this.isReadonly(values)"\x3e\x3cimg height\x3d"12" width\x3d"12" src\x3d"/img/ple/lock12.gif" class\x3d"Readonly"\x3e\x3c/img\x3e' + (a ? "\x26nbsp;\x26nbsp;" : "") + '\x3c/tpl\x3e\x3ctpl if\x3d"this.isAlwaysDisplayed(values)"\x3e\x3cimg height\x3d"12" width\x3d"12" src\x3d"/img/ple/alwaysdisplay12.png" class\x3d"AlwaysOnLayout"\x3e\x3c/img\x3e' +
        (a ? "\x26nbsp;\x26nbsp;" : "") + '\x3c/tpl\x3e\x3ctpl if\x3d"this.isController(values)"\x3e\x3cimg src\x3d"/img/ple/controller.gif" class\x3d"controller"\x3e\x3c/img\x3e' + (a ? "\x26nbsp;\x26nbsp;" : "") + '\x3c/tpl\x3e\x3ctpl if\x3d"this.isDependent(values)"\x3e\x3cimg src\x3d"/img/ple/dependent.gif" class\x3d"dependent"\x3e\x3c/img\x3e' + (a ? "\x26nbsp;\x26nbsp;" : "") + "\x3c/tpl\x3e\x3c/span\x3e"
};
Sfdc.layout.Section.itemTemplate_itemLabel_open = '\x3cdiv class\x3d"itemLabel"\x3e';
Sfdc.layout.Section.itemTemplate_itemLabel_text = '\x3cspan class\x3d"labelText"\x3e{[Ext.util.Format.htmlEncode(values.staticData["label"])]}\x3c/span\x3e';
Sfdc.layout.Section.itemTemplate_itemLabel_close = "\x3c/div\x3e";
Sfdc.layout.Section.itemTemplate_sampleData = '\x3cdiv class\x3d"sampleData"\x3e{[Sfdc.layout.FieldSection.makeSample(values.staticData)]}\x3c/div\x3e';
Sfdc.layout.Section.itemTemplate_close = "\x3c/div\x3e";
Sfdc.layout.Section.itemTemplate_fullText = Sfdc.layout.Section.itemTemplate_itemLabel_open + Sfdc.layout.Section.itemTemplate_genIcons(!0) + Sfdc.layout.Section.itemTemplate_itemLabel_text + Sfdc.layout.Section.itemTemplate_itemLabel_close + Sfdc.layout.Section.itemTemplate_sampleData;
Sfdc.layout.Section.genTemplate = function (a) {
        return (new Ext.XTemplate(Sfdc.layout.Section.itemTemplate_preamble + a + Sfdc.layout.Section.itemTemplate_close, {
        isRequired: function(a) {
            return a.required || a.staticData.alwaysRequired
        },
        isReadonly: function(a) {
            return a.readonly || a.staticData.alwaysReadonly
        },
        isAlwaysDisplayed: function(a) {
            return !Sfdc.layout.FieldSection.mayRemoveItem(a.staticData)
        },
        hasProperties: function (a) {
            if (a.staticData) {
                return VFEditor.itemsHaveProperties ? "CustomLink" == a.staticData.category || "AuraComponent" ==
                a.staticData.category ? !1 : !0 : !1
            }
            
        },
        isDependent: function(a) {
            return !Ext.isEmpty(a.staticData.controllerIds)
        },
        isController: function(a) {
            return !Ext.isEmpty(a.staticData.dependentIds)
        }
    })).compile()
    
};
Ext.apply(Sfdc.layout.FieldSection, {
    newAndLoad: function(a, b, c) {
        c.placeHolder ? a = new Sfdc.layout.UserPlaceholderSection({
            store: b,
            id: Ext.id(),
            title: c.sectionName,
            info: c.sectionInfo
        }) : (a = new Sfdc.layout.FieldSection(a, Sfdc.layout.FieldSection.getNewFieldSectionLoadConfig(b, c)), a.load(c));
        return a
    },
    getNewFieldSectionLoadConfig: function(a, b) {
        return {
            store: a,
            id: b.sectionId,
            title: b.sectionName,
            columns: b.columns ? b.columns.length : b.numColumns,
            cls: b.className ? b.className : b.layoutData && b.layoutData.className ?
                b.layoutData.className[0] : ""
        }
    },
    itemTemplate: Sfdc.layout.Section.genTemplate(Sfdc.layout.Section.itemTemplate_fullText),
    scontrolItemTemplate: (new Ext.XTemplate('\x3ctpl if\x3d"this.hasInfoText(values)"\x3e', "\x3cdiv\x3e", '\x3cdiv class\x3d"analyticsInfoBox"\x3e', '\x3cspan class\x3d"analyticInfoIcon {[this.getInfoIcon(values)]}"\x3e\x3c/span\x3e', '\x3cspan class\x3d"labelText"\x3e{[this.getInfoText(values)]}\x3c/span\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3cdiv id\x3d"' + Sfdc.layout.Section.ITEM_PREFIX +
        '{id}" class\x3d"entry blockEntry\x3ctpl if\x3d"values.showLabel"\x3e showLabel\x3c/tpl\x3e"\x3e', '\x3cdiv class\x3d"widget"\x3e', '\x3ctpl if\x3d"this.hasProperties(values)"\x3e\x3cdiv class\x3d"properties"\x3e\x26#160;\x3c/div\x3e\x3c/tpl\x3e', '\x3cdiv class\x3d"remove"\x3e\x26#160;\x3c/div\x3e', "\x3c/div\x3e", '\x3cimg alt\x3d"" src\x3d"/img/func_icons/dragaffordance.gif" class\x3d"dragHandle"\x3e\x3c/img\x3e', '\x3ctpl if\x3d"values.showLabel \x26\x26 values.staticData"\x3e\x3cdiv class\x3d"itemLabel"\x3e{[Ext.util.Format.htmlEncode(values.staticData["label"])]}\x3c/div\x3e\x3c/tpl\x3e',
        '\x3cdiv class\x3d"blockOuter" \x3ctpl if\x3d"this.getHeight(values)"\x3e style\x3d"height:{[this.getHeight(values)]}px"\x3c/tpl\x3e\x3e', '\x3cdiv class\x3d"block{[this.getCls(values)]}" ', 'style\x3d"\x3ctpl if\x3d"values.width \x26lt; 0"\x3ewidth:{[values.width * -1]}%;\x3c/tpl\x3e\x3ctpl if\x3d"values.width \x26gt; 0"\x3ewidth:{[values.width]}px;\x3c/tpl\x3e"\x3e', '\x3ctpl if\x3d"!values.errorMsg"\x3e', '\x3cdiv class\x3d"pageLabel"\x3e', '{[this.getItemLabelIcon(values)]} \x3cspan class\x3d"labelText"\x3e{[Ext.util.Format.htmlEncode(values.staticData["label"])]}\x3c/span\x3e',
        '\x3ctpl if\x3d"this.showScrollbars(values)"\x3e {[LC.getLabel("LayoutSControl", "ScrollbarShown")]}\x3c/tpl\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.errorMsg"\x3e', "{[this.getMessage(values)]}", "\x3c/tpl\x3e", "\x3c/div\x3e", "\x3c/div\x3e", "\x3c/div\x3e", '\x3ctpl if\x3d"this.hasInfoText(values)"\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e", {
            getMessage: function(a) {
                return "Analytics" === a.category ? "".concat.apply("", Sfdc.layout.messageHTML(a.errorMsg, "error")) : ""
            },
            getCls: function(a) {
                return a.staticData &&
                    "Page" === a.staticData.category && !0 === a.staticData.isMobileEnabled ? " mobileEnabled" : ""
            },
            hasInfoText: function(a) {
                return !a.errorMsg && "Analytics" === a.staticData.category
            },
            getInfoIcon: function(a) {
                return "Analytics" === a.staticData.category ? a.staticData.contextFilterableFields ? a.staticData.contextFilterableFields.length ? a.includeContext ? "info" : "warning" : "warning" : "loadingInfo" : ""
            },
            getInfoText: function(a) {
                if ("Analytics" === a.staticData.category) {
                    if (a.staticData.contextFilterableFields) {
                        if (a.staticData.contextFilterableFields.length) {
                            if (a.includeContext) {
                                if (a.filterColumn) {
                                    var b =
                                        a.staticData.contextFilterableFields.pluck("name").indexOf(a.filterColumn);
                                    a = -1 !== b ? a.staticData.contextFilterableFields[b].label : a.filterColumn
                                } else a = a.staticData.contextFilterableFields[0].label;
                                return LC.getLabel("LayoutDND", "ContextIncludedInfo", Ext.util.Format.htmlEncode(a), '\x3ca href\x3d"javascript:void(0);" class\x3d"properties analyticsPropLink"\x3e', "\x3c/a\x3e")
                            }
                            return LC.getLabel("LayoutDND", "ContextNotIncludedInfo", '\x3ca href\x3d"javascript:void(0);"  class\x3d"properties analyticsPropLink"\x3e',
                                "\x3c/a\x3e")
                        }
                        return LC.getLabel("LayoutDND", "ContextNotAvailableInfo")
                    }
                    return LC.getLabel("LayoutDND", "LoadingAnalyticInfo")
                }
                return ""
            },
            getItemLabelIcon: function(a) {
                switch (a.staticData.category) {
                    case "CustomSControl":
                        return '\x3cimg alt\x3d"' + LC.getLabel("LayoutDND", "customSControl") + '" src\x3d"/img/ple/scontrol12.gif"\x3e\x3c/img\x3e';
                    case "Page":
                        return '\x3cimg alt\x3d"' + LC.getLabel("LayoutDND", "VisualforcePage") + '" src\x3d"/img/ple/vfpages16.png"\x3e\x3c/img\x3e';
                    case "Canvas":
                        return '\x3cimg alt\x3d"' +
                            LC.getLabel("LayoutDND", "Canvas") + '" src\x3d"/img/canvas_action.png"\x3e\x3c/img\x3e';
                    case "Analytics":
                        return '\x3cspan class\x3d"chartIcon ' + a.staticData.chartType + '"\x3e\x3c/span\x3e';
                    case "RelatedLookup":
                        return '\x3cimg alt\x3d"' + LC.getLabel("LayoutDND", "RelatedLookup") + '" src\x3d"/img/ple/el_icon.png"\x3e\x3c/img\x3e';
                    case "AuraComponent":
                        return "";
                    default:
                        return ""
                }
            },
            hasProperties: function(a) {
                return a.staticData ? !("RelatedLookup" === a.staticData.category || "AuraComponent" === a.staticData.category) :
                    !1
            },
            getHeight: function(a) {
                return a.staticData && ("RelatedLookup" === a.staticData.category || "AuraComponent" == a.staticData.category) ? Sfdc.layout.RelatedContentSection.RELATED_LOOKUP_DEFAULT_HEIGHT : a.height
            },
            showScrollbars: function(a) {
                return a.showScrollbars
            }
        })).compile(),
    blankTemplate: (new Ext.XTemplate('\x3cdiv id\x3d"' + Sfdc.layout.Section.ITEM_PREFIX + '{id}" class\x3d"entry blank"\x3e', '\x3cdiv class\x3d"widget"\x3e\x3cdiv class\x3d"remove"\x3e\x26#160;\x3c/div\x3e\x3c/div\x3e', '\x3cimg alt\x3d"" src\x3d"/img/func_icons/dragaffordance.gif" class\x3d"dragHandle"\x3e\x3c/img\x3e',
        '\x3cspan class\x3d"labelText"\x3e{[LC.getLabel("LayoutDND", "BlankSpace")]}\x3c/span\x3e \x3c/div\x3e')).compile(),
    analyticSizeMap: {
        small: {
            width: 280,
            height: 210
        },
        medium: {
            width: 480,
            height: 384
        },
        large: {
            width: 800,
            height: 640
        }
    },
    analyticSizeLabelFromWidth: function(a) {
        switch (a) {
            case 280:
                return "small";
            case 800:
                return "large";
            default:
                return "medium"
        }
    },
    decodeScontrolWidth: function(a) {
        return 0 > a ? -a + "%" : a + "px"
    },
    _pixelOrPercentRE: /^(\d+)\s*(%|px)?$/,
    encodePixelOrPercent: function(a) {
        if (a = this._pixelOrPercentRE.exec(a)) {
            if (!a[2] ||
                "px" == a[2]) return parseInt(a[1], 10);
            if ("%" == a[2]) return -1 * parseInt(a[1], 10)
        } else return !1
    },
    encodeScontrolWidth: function(a) {
        return this.encodePixelOrPercent(a)
    },
    getQueryIds: function(a) {
        return a.collect(function(a) {
            return Sfdc.layout.Trough.isBlankId(a) ? NewLayoutEditor.BLANK_ID : a
        })
    },
    getColumnCount: function(a) {
        var b = 0;
        if (a === Sfdc.layout.FieldSection.EMPTY_COLUMN) return 0;
        do b += 1, a = a.next; while (a);
        return b
    },
    mayRemoveItem: function(a) {
        return VFEditor.allowRemoveOfAlwaysDisplayed || !a || !a.alwaysDisplayed
    }
});
Sfdc.layout.FieldSectionBase = Ext.extend(Sfdc.layout.Section, {
    headerMouseOver: function(a) {
        Ext.dd.DragDropMgr.dragCurrent || this.header.addClass("hover")
    },
    headerMouseOut: function(a) {
        a = a.getRelatedTarget();
        this.header.contains(a) || this.header.removeClass("hover")
    }
});
Ext.extend(Sfdc.layout.FieldSection, Sfdc.layout.FieldSectionBase, {
    onRender: function() {
        var a = "section " + this.getId();
        Sfdc.Perf.mark(a);
        Sfdc.layout.FieldSection.superclass.onRender.apply(this, arguments);
        Sfdc.Perf.endMark(a);
        this.handler && (this.dragZone = new this.dragZoneConstructor(this));
        this.header && this.header.addClass("tertiaryPalette");
        var b = this.sectionItems.collect(Sfdc.layout.FieldSection.getColumnCount).max();
        Sfdc.Perf.endMark(a);
        this.table = this.makeTable(0 === b ? 1 : b);
        Sfdc.Perf.endMark(a);
        if (0 <
            b)
            for (var c = this.sectionItems.clone(), d = Ext.fly(this.table).child("tr"), f = 0; f < b; f++) {
                for (var e = d.child("td", !0), g = 0; g < c.length; g++) c[g] && !this.isEmpty(g) && (this.setEntry(e, c[g].entry), c[g] = c[g].next), e = Ext.fly(e).next();
                d = d.next()
            }
        Sfdc.Perf.endMark(a);
        if (this.handler) {
            if (this.header) this.header.on({
                dblclick: this.showSectionProps,
                mouseover: this.headerMouseOver,
                mouseout: this.headerMouseOut,
                scope: this
            });
            Ext.fly(this.table).on({
                mouseover: this.tableMouseOver,
                mouseout: this.tableMouseOut,
                scope: this
            });
            this.dropZone =
                new Sfdc.layout.SectionDropZone(this.getEl(), this);
            !this.mayRemove() && this.tools.remove && this.tools.remove.hide()
        }
        Sfdc.Perf.endMark(a)
    },
    afterRender: function() {
        Sfdc.layout.FieldSection.superclass.afterRender.apply(this, arguments);
        this._refreshHeader()
    },
    showSectionProps: function() {
        this.ownerCt.showSectionProps(this.id)
    },
    performNodeDropAction: function(a) {
        return this.handler.perform(a)
    },
    tableMouseOver: function(a) {
        if (!Ext.dd.DragDropMgr.dragCurrent) {
            var b = a.getTarget("td", 8);
            b && (!a.within(b, !0) && Ext.fly(b).down("div")) &&
                Ext.fly(b).addClass("hover")
        }
    },
    tableMouseOut: function(a) {
        var b = a.getTarget(".hover", 8);
        b && !a.within(b, !0) && Ext.fly(b).removeClass("hover")
    },
    selectItem: function(a) {
        Ext.fly(this.getItem(a).entry).parent("td").addClass("selected")
    },
    deselectItem: function(a) {
        (a = this.getItem(a)) && Ext.fly(a.entry).parent("td").removeClass("selected")
    },
    selectRect: function(a) {
        this.firstShift || (this.firstShift = a);
        var b;
        b = this.firstShift == a ? [a] : this.calcRect(this.firstShift, a);
        this.lastShift && this.calcRect(this.firstShift, this.lastShift).reject(function(a) {
            return b.any(function(b) {
                return b ==
                    a
            })
        }).each(this.deselect, this);
        b.each(this.select, this);
        this.lastShift = a
    },
    calcRow: function(a) {
        for (var b = 0; a.previous;) b++, a = a.previous;
        return b
    },
    calcRect: function(a, b) {
        if (a == b) return [a];
        for (var c = this.getItem(a), d = this.getItem(b), f = this.calcRow(c), e = this.calcRow(d), g = c.column == d.column ? f < e : c.column < d.column, h = Math.min(f, e), f = Math.max(f, e), e = [], l = g ? c.column : d.column; l <= (g ? d.column : c.column); l++)
            if (!this.isEmpty(l)) {
                for (var k = this.getColumnHead(l), m = 0; m < h && k;) k = k.next, m++;
                for (; m <= f && k;) e.push(k.data.id),
                    k = k.next, m++
            } return e
    },
    clearAllSelected: function() {
        Ext.select(this.getSelection().collect(this.getItem, this).findAll(function(a) {
            return a
        }).pluck("entry").collect(function(a) {
            return Ext.fly(a).parent("td", !0)
        })).removeClass("selected")
    },
    setAllowRemove: function(a) {
        this.allowRemove = a;
        this.rendered && (a ? this.canDeleteSection && this.tools.remove.show() : this.tools.remove.hide())
    },
    mayRemove: function() {
        return this.allowRemove && this.canDeleteSection
    },
    appendRowHtml: function(a) {
        a.push("\x3ctr\x3e");
        for (var b =
                0; b < this.getNumColumns(); b++) a.push('\x3ctd class\x3d"entryCell col'), a.push(this.sectionItems.length), a.push('"\x3e\x26nbsp;\x3c/td\x3e');
        a.push("\x3c/tr\x3e")
    },
    makeTable: function(a) {
        var b = ['\x3ctable cellspacing\x3d"0" cellpadding\x3d"0"\x3e\x3ctbody\x3e'];
        if (0 < a)
            for (var c = 0; c < a; c++) this.appendRowHtml(b);
        b.push("\x3c/tbody\x3e\x3c/table\x3e");
        return Ext.DomHelper.append(this.body, b.join(""))
    },
    extendTable: function() {
        var a = [];
        this.appendRowHtml(a);
        return Ext.DomHelper.append(Ext.fly(this.table).child("tbody",
            !0), a.join(""))
    },
    unextendTable: function() {
        var a = this.table.firstChild;
        a.firstChild != a.lastChild && a.removeChild(a.lastChild)
    },
    setEntry: function (a,b) {
        Ext.fly(a).dom.innerHTML = "";
        if (b) {
            Ext.fly(a).appendChild(b)
        }
    },
    verifyCategory: function(a) {
        return a.staticData.category in this.categoriesAllowed
    },
    _refreshHeader: function() {
        if (this.rendered && this.header) {
            this.header.removeClass(["notVisible", "editOnly", "detailOnly"]);
            var a;
            !this.showEditHeader && !this.showDetailHeader ? (this.header.addClass("notVisible"), a = VFEditor.labelMap.notVisibleOnSectionLabel) :
                !this.showEditHeader && this.showDetailHeader ? (this.header.addClass("detailOnly"), a = LC.getLabel("LayoutDND", "visibleOnDetail")) : this.showEditHeader && !this.showDetailHeader && (this.header.addClass("editOnly"), a = LC.getLabel("LayoutDND", "visibleOnEdit"));
            a ? this.headerExtraInfo = '\x3cspan class\x3d"headerInfo"\x3e' + a + "\x3c/span\x3e" : delete this.headerExtraInfo;
            a = this.allowHtmlInSectionTitle ? this.getTitle() : Sfdc.String.escapeToHtml(this.getTitle());
            this.headerExtraInfo && (a += this.headerExtraInfo);
            Sfdc.layout.FieldSection.superclass.setTitle.call(this,
                a)
        }
    },
    setTitle: function(a) {
        this.realTitle = a
    },
    getTitle: function() {
        return this.realTitle
    },
    acceptMessage: function(a) {
        switch (a.type) {
            case "Move":
            case "Remove":
                return !1;
            case "Add":
                return a.sectionData && a.sectionData.sectionId == this.id;
            case "SetSectionProperties":
                return a.sectionId == this.getId();
            case "SetFieldProperties":
                return !0
        }
    },
    filterForRemove: function(a) {
        return a.collect(this.getItem, this).select(function(a) {
            return Sfdc.layout.FieldSection.mayRemoveItem(a.data.staticData)
        }).collect(function(a) {
            return a.data.id
        })
    },
    getItemCount: function() {
        return this.sectionItems.inject(0, function(a, b) {
            return Sfdc.layout.FieldSection.getColumnCount(b) + a
        })
    },
    undoRemove: function(a) {
        a.sectionData.old[this.getId()].reverse().each(function(a) {
            var c = this.makeEntries([a.data]);
            this.put([a.data], a, c)
        }, this);
        this.fireEvent("countChanged", this, this.getItemCount());
        a.sectionData.old[this.getId()].pluck("data").pluck("id").each(this.select, this)
    },
    action_beforeDoAdd: function(a) {
        a = this._getStoreItems(Sfdc.layout.FieldSection.getQueryIds(a.itemIds));
        var b = null;
        this.verifyMaxCount(a, "CustomSControl") ? this.verifyMaxCount(a, "Page") ? this.verifyMaxCount(a, "Analytics") ? this.verifyMaxCount(a, "RelatedLookup") || (b = LC.getLabel("LayoutDND", "alertTooManyExpandedLookups")) : b = LC.getLabel("LayoutDND", "LayoutCharLimitReached") : b = LC.getLabel("LayoutDND", "alertTooManyPages") : b = LC.getLabel("LayoutDND", "alertTooManyScontrols");
        if (b) return Ext.Msg.alert(LC.getLabel("Global", "error"), b), !0
    },
    action_doAdd: function(a, b) {
        if (b) this.ownerCt.clearSelection(), this.removeItems(a.itemIds);
        else {
            a.itemIds = a.itemIds.collect(function(a) {
                return a == NewLayoutEditor.BLANK_ID ? Sfdc.layout.Trough.getNextBlankId() : a
            });
            var c = this.makeItemDatas(a.itemIds),
                c = c.select(this.verifyCategory, this);
            if (0 === c.length) return !0;
            var d = this;
            c.each(function(a) {
                var b = "checkReportContextFilterable" + a.id;
                "Analytics" === a.staticData.category && ("" === a.staticData.contextFilterableFields && !VFEditor.callbacks[b]) && (vfeditor_checkReportContextFilterable(a.id), VFEditor.registerCallback(b, function(b, c) {
                    var f = d.getItem(a.id);
                    a.staticData.contextFilterableFields = b;
                    a.staticData.atReportFilterLimit = c;
                    a.includeContext = !!b.length;
                    a.filterColumn = b.length ? b[0].name : null;
                    d.fillEntry(f.entry, a, !0)
                }))
            });
            this.ownerCt.clearSelection();
            var f = this.makeEntries(c);
            this.put(c, a.sectionData, f);
            a.itemIds.each(this.select, this)
        }
        this.fireEvent("countChanged", this, this.getItemCount())
    },
    checkForSelfMove: function(a) {
        return a.sectionData.putAfterId && a.itemIds[0] == a.sectionData.putAfterId || this.getItem(a.sectionData.putAfterId) && this.getItem(a.sectionData.putAfterId).next &&
            a.itemIds[0] == this.getItem(a.sectionData.putAfterId).next.data.id || !Ext.isEmpty(a.sectionData.columnHead) && !this.isEmpty(a.sectionData.columnHead) && this.getColumnHead(a.sectionData.columnHead).data.id == a.itemIds[0]
    },
    action_doSetSectionProperties: function(a, b) {
        if (b) d = !1, a.old.sectionName && this.setTitle(a.old.sectionName), Ext.isEmpty(a.old.numColumns) || this.setNumColumns(a.old.numColumns, a, !0), Ext.isEmpty(a.old.showDetailHeader) || (d = !0, this.showDetailHeader = a.old.showDetailHeader), Ext.isEmpty(a.old.showEditHeader) ||
            (d = !0, this.showEditHeader = a.old.showEditHeader), Ext.isEmpty(a.old.sortOrder) || (this.sortOrder = a.old.sortOrder);
        else {
            a.old || (a.old = {});
            var c = !1,
                d = !1;
            !this.nameReadonly && (a.sectionName && a.sectionName != this.getTitle()) && (c = d = !0, a.old.sectionName = this.getTitle(), this.setTitle(a.sectionName));
            a.numColumns && a.numColumns != this.getNumColumns() && (c = !0, a.old.numColumns = this.getNumColumns(), this.setNumColumns(a.numColumns, a));
            !Ext.isEmpty(a.showDetailHeader) && a.showDetailHeader != this.showDetailHeader && (d = c = !0, a.old.showDetailHeader = this.showDetailHeader, this.showDetailHeader = a.showDetailHeader);
            !Ext.isEmpty(a.showEditHeader) && a.showEditHeader != this.showEditHeader && (d = c = !0, a.old.showEditHeader = this.showEditHeader, this.showEditHeader = a.showEditHeader);
            !Ext.isEmpty(a.sortOrder) && a.sortOrder != this.sortOrder && (c = !0, a.old.sortOrder = this.sortOrder, this.sortOrder = a.sortOrder);
            if (!c) return !0
        }
        d && this._refreshHeader()
    },
    setProperties: function(a, b, c, d) {
        for (var f = !1, e = 0; e < c.length; e++) {
            var g = c[e],
                f = f || a[g] != b[g];
            if (!d || "undefined" !== typeof a[g]) b[g] = a[g]
        }
        return f
    },
    action_doSetFieldProperties: function(a, b) {
        if (b) a.old.fieldData.each(function (a) {

            var b = this.getItem(a.id);
            b && (this._setItemProps(a, b), this.fillEntry(b.entry, b.data, !0))
        }, this);
        else {
            a.old || (a.old = {});
            a.old.fieldData || (a.old.fieldData = []);
            var c = !1,
                d = !1,
                f = !1;
            a.fieldData.each(function(b) {
                var g = this.getItem(b.id);
                if (g) {
                    f = !0;
                    var h = Object.clone(g.data);
                    delete h.staticData;
                    a.old.fieldData.push(h);
                    this._setItemProps(b, g, a.additive) && (d = !0, this.fillEntry(g.entry,
                        g.data, !0))
                } else c = !0
            }, this);
            if (f && !c && !d) return !0
        }
    },
    _setItemProps: function(a, b, c) {
        switch (b.data.staticData.category) {
            case "CustomField":
            case "StandardField":
                return this.setProperties(a, b.data, ["required", "readonly"], c);
            case "Control":
                return this.setProperties(a, b.data, ["showLabel"], c);
            case "Analytics":
                return this.setProperties(a, b.data, "width height showTitle hideOnError cacheData includeContext filterColumn".split(" "), c);
            case "CustomSControl":
            case "Page":
            case "Canvas":
                return this.setProperties(a,
                    b.data, ["height", "width", "showScrollbars", "showLabel"], c);
            default:
                return !1
        }
    },
    removeItems: function(a) {
        return a.collect(function(a) {
            a = this.getItem(a);
            return this.removeItem(a)
        }, this)
    },
    makeItemDatas: function(a) {
        for (var b = this._getStoreItems(Sfdc.layout.FieldSection.getQueryIds(a)), c = 0; c < a.length; c++) Sfdc.layout.Trough.isBlankId(a[c]) && (b[c] = b[c].copy(), b[c].data.id = b[c].id = a[c]);
        return b.collect(function(a) {
            var b = {
                id: a.id,
                staticData: a.data
            };
            switch (a.data.category) {
                case "CustomField":
                case "StandardField":
                    b.required =
                        a.data.alwaysRequired ? !0 : !1;
                    b.readonly = a.data.alwaysReadonly ? !0 : !1;
                    break;
                case "Analytics":
                    b.showTitle = !1;
                    b.hideOnError = !1;
                    b.cacheData = !0;
                    b.includeContext = !0;
                    b.filterColumn = null;
                    b.width = Sfdc.layout.FieldSection.analyticSizeMap.small.width;
                    b.height = Sfdc.layout.FieldSection.analyticSizeMap.small.height;
                    break;
                case "Control":
                    b.showLabel = !1;
                    b.width = Sfdc.layout.ControlElement.DEFAULT_WIDTH;
                    b.height = Sfdc.layout.ControlElement.DEFAULT_HEIGHT;
                    break;
                case "CustomSControl":
                case "Page":
                case "Canvas":
                    b.width = InlineScontrolElement.DEFAULT_WIDTH,
                        b.height = InlineScontrolElement.DEFAULT_HEIGHT, b.showLabel = !1, b.showScrollbars = !1
            }
            return b
        })
    },
    makeEntries: function (a) {
        for (var b = [], c = 0; c < a.length; c++) {
            if (a[c].id == '') {
            }
            if (a[c].staticData && a[c].id != '') {
                var d = a[c],
                f = document.createElement("DIV");
                this.fillEntry(f, d);
                b.push(f)
            } else {
                console.log('stop')
                //return false
            }
            
        }
        return b
    },
    getTemplate: function (a) {
        return Sfdc.layout.Trough.isBlankId(a.id) ? Sfdc.layout.FieldSection.blankTemplate : "Analytics" === a.category || a.staticData && ("Analytics" === a.staticData.category || "Page" == a.staticData.category || "CustomSControl" == a.staticData.category || "Control" == a.staticData.category ||
            "RelatedLookup" == a.staticData.category || "AuraComponent" == a.staticData.category || "Canvas" == a.staticData.category) ? Sfdc.layout.FieldSection.scontrolItemTemplate : Sfdc.layout.FieldSection.itemTemplate
    },
    fillEntry: function (a, b, c) {
        var d = Ext.get(this.getTemplate(b).call(c ? "overwrite" : "append", a, b));
        ["Required", "Readonly", "AlwaysOnLayout"].each(function(a) {
            var b = d.child("." + a);
            b && Ext.QuickTips.register({
                target: b,
                text: LC.getLabel("LayoutDND", a)
            })
        });
        a = d.down(".widget") || d.down(".entry").down(".widget");
        if (c =
            a.down(".properties")) Ext.QuickTips.register({
            target: c,
            text: LC.getLabel("LayoutDND", "Properties")
        }), c.addClassOnOver("hover");
        if (a = a.down(".remove")) c = b.staticData && !Sfdc.layout.FieldSection.mayRemoveItem(b.staticData) ? LC.getLabel("LayoutDND", "AlwaysOnLayout") : LC.getLabel("Buttons", "remove"), Ext.QuickTips.register({
            target: a,
            text: c
        }), Sfdc.layout.FieldSection.mayRemoveItem(b.staticData) && a.addClassOnOver("hover");
        b.staticData && b.staticData.controllerIds && (a = d.child(".dependent"), Ext.QuickTips.register({
            target: a,
            text: LC.getLabel("LayoutDND", "controlField") + Ext.util.Format.htmlEncode(b.staticData.controllerNames.join(", "))
        }));
        b.staticData && b.staticData.dependentIds && (a = d.child(".controller"), Ext.QuickTips.register({
            target: a,
            text: LC.getLabel("LayoutDND", "dependent") + Ext.util.Format.htmlEncode(b.staticData.dependentNames.join(", "))
        }))
    },
    addSectionData: function(a, b, c, d) {
        if (!a.sectionData)
            if (a.sectionData = {
                    sectionId: this.id,
                    sectionType: this.className
                }, b && (a.sectionData.selection = b), d) a.sectionData.column = c, a.sectionData.columnHead = !0;
            else {
                c = this.getItem(c);
                d = !1;
                if (b && (b = b[this.id])) {
                    for (var f = c.column; c && 0 <= b.indexOf(c.data.id);) c = c.previous;
                    c || (a.sectionData.column = f, d = a.sectionData.columnHead = !0)
                }
                d || (a.sectionData.column = c.column, a.sectionData.putAfterId = c.data.id)
            }
    },
    saveOldPositionAndRemove: function(a, b, c) {
        var d = [];
        b.each(function(a) {
            a = this.getItem(a);
            var b = {
                data: a.data,
                column: a.column
            };
            a.previous ? b.putAfterId = a.previous.data.id : b.columnHead = !0;
            c && (b.entry = a.entry);
            d.push(b);
            this.removeItem(a)
        }, this);
        this.fireEvent("countChanged",
            this, this.getItemCount());
        a.sectionData.old || (a.sectionData.old = {});
        a.sectionData.old[this.getId()] = d
    },
    isEmpty: function(a) {
        return Ext.isEmpty(this.sectionItems[a]) || this.sectionItems[a] === Sfdc.layout.FieldSection.EMPTY_COLUMN
    },
    setTitleFromPrompt: function(a, b) {
        this.handler.perform({
            type: "SetSectionProperties",
            sectionId: this.sectionId,
            title: b
        })
    },
    getTopCell: function(a) {
        for (var b = Ext.fly(this.table).child("tr").down("td"), c = 0; c < a; c++) b = b.next();
        return b
    },
    getColumnHead: function(a) {
        return this.sectionItems[a]
    },
    getItem: function(a) {
        return this.itemsById[a]
    },
    getItemDatas: function(a) {
        return Ext.isArray(a) ? a.collect(this.getItem, this).pluck("data").pluck("staticData") : this.getItem(a).data.staticData
    },
    getItemByElement: function(a) {
        return this.itemsById[Sfdc.layout.Section.getItemId(a.id)]
    },
    getNumColumns: function() {
        return this.sectionItems.length
    },
    lastItem: function(a) {
        if ("number" == typeof a && (a = this.sectionItems[a], a === Sfdc.layout.FieldSection.EMPTY_COLUMN)) return null;
        for (; a.next;) a = a.next;
        return a
    },
    moveColumnDown: function(a) {
        var b = !1,
            c = this.lastItem(a);
        Ext.fly(c.entry).parent("tr").next() || (this.extendTable(), b = !0);
        for (var d = Ext.fly(c.entry).parent("td"), f = d.up("tr").next().down("td"), e = 0; e < a.column; e++) f = f.next();
        do c.entry.parentNode && (d = Ext.fly(c.entry).parent("td")), this.setEntry(f, c.entry), c = c.previous, f = d; while (c && c != a);
        return b
    },
    setNumColumns: function(a, b, c) {
        var d = this.getNumColumns();
        if (a != d)
            if (a > d) {
                Ext.select(".col" + d, !1, this.table).replaceClass("col" + d, "col" + a);
                for (var f = Ext.select("tr", !1, this.table), e = d; e < a; e++) f.createChild({
                    tag: "td",
                    cls: "entryCell col" + a,
                    html: "\x26nbsp;"
                }), this.sectionItems.push(Sfdc.layout.FieldSection.EMPTY_COLUMN);
                if (c) {
                    for (e = a - 1; e >= d; e--)
                        if (c = [], f = b.old.columnHeadIds[e]) {
                            var g = this.getItem(f);
                            do c.push([g.data, g.entry]), f = g.next, g.previous ? g.previous.next = null : this.sectionItems[g.column] = Sfdc.layout.FieldSection.EMPTY_COLUMN, g.previous = null, g.next = null, g = f; while (g);
                            this.putAtColumnHead(c, e)
                        } c = this.sectionItems.max(function(a) {
                        if (a === Sfdc.layout.FieldSection.EMPTY_COLUMN) return 0;
                        var b = 0;
                        do b++, a = a.next; while (a);
                        return b
                    });
                    b = Ext.fly(this.table).child("tr");
                    for (e = 0; e < c; e++) b = b.next();
                    for (; b;) f = b.next(), b.remove(), b = f
                }
            } else {
                if (!c) {
                    c = [];
                    b.old.columnHeadIds = [];
                    for (e = a; e < d; e++)
                        if (g = this.sectionItems[e], g === Sfdc.layout.FieldSection.EMPTY_COLUMN) b.old.columnHeadIds[e] = null;
                        else {
                            b.old.columnHeadIds[e] = g.data.id;
                            do c.push([g.data, g.entry]), g = g.next; while (g)
                        } this.isEmpty(a - 1) ? this.putAtColumnHead(c, a - 1) : this.putEntryAfter(c, this.lastItem(a - 1).data.id)
                }
                this.sectionItems.splice(a, d - a);
                Ext.select("tr", !1, this.table).each(function(b) {
                    b =
                        b.down("td");
                    for (var c = 0; c < a; c++) b.replaceClass("col" + d, "col" + a), b = b.next();
                    do c = b.next(), b.remove(), b = c; while (b)
                })
            }
    },
    put: function(a, b, c, d) {
        a.any(function(a) {
            return !Sfdc.layout.FieldSection.mayRemoveItem(a.staticData)
        }) && this.setAllowRemove(!1);
        a = a.zip(c);
        b.putAfterId ? this.putEntryAfter(a, b.putAfterId) : b.columnHead && this.putAtColumnHead(a, b.column);
        Ext.isIE7 || Ext.select(c).fadeIn()
    },
    putAtColumnHead: function(a, b) {
        for (var c = a.length - 1; 0 <= c; c--) {
            var d = a[c][0],
                f = a[c][1],
                e = {
                    data: d,
                    sectionId: this.sectionId,
                    entry: f,
                    column: b,
                    previous: null
                },
                g = this.sectionItems[b];
            this.isEmpty(b) ? e.next = null : (e.next = g, g.previous = e, this.rendered && this.moveColumnDown(e));
            this.rendered && (g = this.getTopCell(b), this.setEntry(g, f));
            this.sectionItems[b] = e;
            this.itemsById[d.id] = e
        }
    },
    putEntryAfter: function(a, b) {
        for (var c = a.length - 1; 0 <= c; c--) {
            var d = a[c][0],
                f = a[c][1],
                e = {
                    data: d,
                    sectionId: this.sectionId,
                    entry: f
                },
                g = this.itemsById[b];
            e.column = g.column;
            e.previous = g;
            e.next = g.next;
            g.next = e;
            e.next && (e.next.previous = e, this.rendered && this.moveColumnDown(e));
            if (this.rendered) {
                (g = Ext.fly(e.previous.entry).parent("tr").next()) || (g = this.extendTable());
                for (var g = Ext.fly(g).down("td"), h = 0; h < e.column; h++) g = g.next();
                this.setEntry(g, f)
            }
            this.itemsById[d.id] = e
        }
    },
    removeItem: function(a) {
        var b = Ext.fly(a.entry).parent("td"),
            c = Ext.fly(a.entry).createProxy("removeProxy", this.ownerCt.body, !0);
        c.position("absolute", 10, b.getX(), b.getY());
        c.ghost("t", {
            duration: 0.75,
            remove: !0
        });
        Ext.fly(a.entry).remove();
        for (c = a; this.rendered && c.next;) {
            var d = Ext.fly(c.next.entry).parent("td");
            Ext.fly(b).appendChild(c.next.entry);
            b = d;
            c = c.next
        }
        b.dom.innerHTML = "\x26nbsp;";
        var f = [];
        Ext.each(this.sectionItems, function(b) {
            b === Sfdc.layout.FieldSection.EMPTY_COLUMN || b.column == a.column || f.push(b)
        });
        for (b = function(a) {
                return a && a.next ? a.next : null
            }; c && f.any();) f = f.map(b), c = c.previous;
        this.rendered && c && this.unextendTable();
        a.previous && (a.previous.next = a.next);
        a.next && (a.next.previous = a.previous);
        this.sectionItems[a.column] === a && (this.sectionItems[a.column] = a.next ? a.next : Sfdc.layout.FieldSection.EMPTY_COLUMN);
        delete this.itemsById[a.data.id];
        if (!Sfdc.layout.FieldSection.mayRemoveItem(a.data.staticData)) {
            var b = !1,
                e;
            for (e in this.itemsById)
                if (this.itemsById.hasOwnProperty(e) && !Sfdc.layout.FieldSection.mayRemoveItem(this.itemsById[e].data.staticData)) {
                    b = !0;
                    break
                } b || this.setAllowRemove(!0)
        }
        return a
    },
    getItemsOfCategory: function(a) {
        var b = [],
            c, d;
        for (d in this.itemsById) this.itemsById.hasOwnProperty(d) && (c = this.itemsById[d].data, (c.category || c.staticData.category) === a && b.push(d));
        return b
    },
    verifyMaxCount: function(a,
        b) {
        var c = a.select(function(a) {
            return a.data.category == b
        });
        return 0 < c.length && this.ownerCt.getNumItemsOfCategory(b) + c.length > VFEditor.maxByCategory[b] ? !1 : !0
    },
    findControllersAndDependents: function(a) {
        for (var b in this.itemsById) this.itemsById.hasOwnProperty(b) && (itemData = this.itemsById[b].data, itemData.staticData && (itemData.staticData.controllerIds && a.dependentItems.push(itemData.staticData), itemData.staticData.dependentIds && (a.controllerIds[b] = !0)))
    },
    save: function(a) {
        for (var b = {
                sectionId: this.id,
                sectionName: this.getTitle(),
                labelKey: this.labelKey,
                showEditHeader: this.showEditHeader,
                showDetailHeader: this.showDetailHeader,
                columns: [],
                sortOrder: this.sortOrder,
                className: this.className,
                canChangeColumns: this.canChangeColumns,
                nameReadonly: this.nameReadonly,
                categoriesAllowed: this.categoriesAllowed,
                canDeleteSection: this.canDeleteSection
            }, c = [], d = 0; d < this.sectionItems.length; d++) {
            var f = this.sectionItems[d];
            b.columns.push([]);
            if (f !== Sfdc.layout.FieldSection.EMPTY_COLUMN) {
                do b.columns[d].push(f.data), a && c.push(f.data.id), f = f.next;
                while (f)
            }
        }
        a && (Sfdc.layout.Trough.markItems(this.store, c, "unused"), this.store.fireEvent("datachanged"));
        return b
    },
    getLoadItemData: function(a, b, c) {
        Sfdc.layout.Trough.isBlankId(a.id) ? (Sfdc.layout.Trough.getNextBlankId(), a.staticData = {
            category: "EmptySpace"
        }) : c[b] && (a.staticData = c[b].data);
        return a
    },
    load: function(a) {
        this.allowHtmlInSectionTitle = a.allowHtmlInSectionTitle;
        this.setTitle(a.sectionName);
        this.labelKey = a.labelKey;
        this.canChangeColumns = a.canChangeColumns;
        this.showDetailHeader = a.showDetailHeader;
        this.showEditHeader = a.showEditHeader;
        this.canDeleteSection = a.canDeleteSection;
        this.nameReadonly = a.nameReadonly;
        a.categoriesAllowed && (this.categoriesAllowed = a.categoriesAllowed);
        this.className = this.cls;
        this._refreshHeader();
        this.sortOrder = a.sortOrder;
        if (a.columns) {
            for (var b = [], c = 0; c < a.columns.length; c++) {
                for (var d = a.columns[c], f = d.pluck("id"), b = b.concat(f), f = this._getStoreItems(f), e = 0, g = d.length; e < g; e++) {
                    var h = this.getLoadItemData(d[e], e, f);
                    Sfdc.layout.FieldSection.mayRemoveItem(h.staticData) || this.setAllowRemove(!1)
                }
                this.putAtColumnHead(a.columns[c].zip(this.makeEntries(a.columns[c])),
                    c)
            }
            Sfdc.layout.Trough.markItems(this.store, b, "used")
        }
    }
});
Ext.reg("fieldsectionxtype", Sfdc.layout.FieldSection);
Sfdc.layout.SummaryLayoutSection = function(a, b, c, d) {
    a && (this.handler = a, this.layoutName = d, a.addObserver(this));
    if (!b) throw "Programmer error, must provide SummaryLayout with a store";
    this.store = b;
    this.load(c);
    Sfdc.layout.SummaryLayoutSection.superclass.constructor.call(this, {
        cls: "summaryLayout"
    })
};
Sfdc.layout.SummaryLayoutSection.makeSample = function(a) {
    return a.type == ColumnType.ADDRESS.datatypeLetter ? Sfdc.layout.FieldSection.makeSample(a, ColumnType.TEXT.datatypeLetter) : Sfdc.layout.FieldSection.makeSample(a)
};
Sfdc.layout.SummaryLayoutSection.tpl = (new Ext.XTemplate('\x3ctable id\x3d"summaryItemsTable" cellspacing\x3d"10" style\x3d"width:100%; table-layout:fixed;"\x3e\x3ctr\x3e\x3ctpl for\x3d"."\x3e', '\x3ctd style\x3d"width:{[100/xcount]}%"\x3e\x3cdiv class\x3d"slItemWrapBackground"\x3e\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 1"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e',
    "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"label"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/tpl\x3e\x3c/div\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tpl\x3e\x3c/tr\x3e\x3c/table\x3e", '\x3cdiv id\x3d"slHoverGearDiv" class\x3d"summaryHoverGear"\x3e\x3c/div\x3e\x3cdiv id\x3d"slHoverDiv" class\x3d"summaryHover"\x3e\x3c/div\x3e')).compile();
Ext.extend(Sfdc.layout.SummaryLayoutSection, Ext.Panel, {
    border: !1,
    width: "auto",
    _toggleEvents: function(a) {
        if (this.handler) {
            var b = {
                    dblclick: this.openPropsWindow,
                    mouseover: this.onMouseOver,
                    mouseout: this.onMouseOut,
                    scope: this
                },
                c = {
                    click: this.openPropsWindow,
                    mouseover: this.onGearOver,
                    mouseout: this.onGearOut,
                    scope: this
                };
            a ? (this.body.on(b), Ext.get("slHoverGearDiv").on(c)) : (this.body.un(b), Ext.get("slHoverGearDiv").un(c))
        }
    },
    initEvents: function() {
        Sfdc.layout.SummaryLayoutSection.superclass.initEvents.apply(this,
            arguments);
        this._toggleEvents(!0);
        Ext.EventManager.onWindowResize(function() {
            this.updateBodyAndEvents()
        }, this)
    },
    _getItems: function(a) {
        return this.store.getItems(a)
    },
    onRender: function() {
        Sfdc.layout.SummaryLayoutSection.superclass.onRender.apply(this, arguments);
        this.body.unselectable();
        this.updateBody()
    },
    updateBodyAndEvents: function() {
        this._toggleEvents(!1);
        this.updateBody();
        this._toggleEvents(!0)
    },
    updateBody: function() {
        var a = !0;
        out = [];
        for (var b = 0; b < this.columns.length; b++) {
            for (var c = [], d = 0; d < this.columns[b].length; d++) {
                var f =
                    this.columns[b][d];
                f ? (f = this._getItems([f])) && f[0] ? (f = f[0].data, a = !1) : f = {
                    blank: !0
                } : f = {
                    blank: !0
                };
                c.push(f)
            }
            out.push(c)
        }
        a && (out = [
            []
        ]);
        Sfdc.layout.SummaryLayoutSection.tpl.overwrite(this.body, out);
        a && (a = Ext.get("summaryItemsTable"), a.setHeight(40), a.child(".slItemWrapBackground").createChild({
            html: LC.getLabel("LayoutDND", "CustomizeHighlightsPanel"),
            cls: "slEmptyText"
        }));
        Ext.QuickTips.register({
            target: "slHoverGearDiv",
            cls: "wrenchTips",
            text: LC.getLabel("LayoutDND", "HighlightsPanelProperties")
        });
        this.adjustAllDimensions()
    },
    adjustAllDimensions: function(a) {
        a = Ext.get("slHoverDiv");
        var b = Ext.get("slHoverGearDiv"),
            c = Ext.get("summaryItemsTable"),
            d = c.getSize().height;
        a.setHeight(d);
        a.setWidth(c.getSize().width);
        a.alignTo(this.el, "tl");
        b.alignTo(c, "tr", [-38, 0]);
        this.setHeight(d)
    },
    createPropsWindow: function() {
        this.propsWindow = new Sfdc.layout.SummaryLayoutPropertiesWindow({
            handler: this.handler,
            layoutName: this.layoutName,
            store: this.store
        })
    },
    openPropsWindow: function(a) {
        this.propsWindow || this.createPropsWindow();
        this.propsWindow.load(this.columns,
            this.columnHeader);
        this.propsWindow.show()
    },
    onMouseOver: function() {
        Ext.get("slHoverDiv").addClass("showSummaryHover");
        Ext.get("slHoverGearDiv").addClass("summaryHoverGearShow")
    },
    onMouseOut: function() {
        Ext.get("slHoverDiv").removeClass("showSummaryHover");
        Ext.get("slHoverGearDiv").removeClass("summaryHoverGearShow")
    },
    onGearOver: function() {
        Ext.get("slHoverGearDiv").addClass("summaryHoverGearOver")
    },
    onGearOut: function() {
        Ext.get("slHoverGearDiv").removeClass("summaryHoverGearOver")
    },
    load: function(a) {
        this.columns =
            a.columns;
        this.summaryStyle = a.style;
        this.columnHeader = a.columnHeader
    },
    save: function() {
        return {
            columns: this.columns,
            style: this.summaryStyle,
            columnHeader: this.columnHeader
        }
    },
    acceptMessage: function(a) {
        switch (a.type) {
            case "SetSummaryLayoutProperties":
            case "SetLayoutProperties":
                return !0;
            case "Remove":
                return a.sectionData && a.sectionData.selection && !(Sfdc.layout.ButtonSection.SECTION_ID in a.sectionData.selection);
            default:
                return !1
        }
    },
    action_doSetLayoutProperties: function(a, b) {
        this.layoutName = b ? a.old.name :
            a.name;
        this.propsWindow && this.propsWindow.setTitle(LC.getLabel("SummaryLayoutProps", "title", this.layoutName))
    },
    action_doSetSummaryLayoutProperties: function(a, b) {
        b ? (this.columns = a.old.columns, this.columnHeader = a.old.columnHeader) : (a.old = {
            columns: this.columns,
            columnHeader: this.columnHeader
        }, this.columns = a.columns, this.columnHeader = a.columnHeader);
        this.updateBodyAndEvents()
    },
    confirmRemoveSummaryLayoutField: function(a) {
        for (var b = 0, c = "", d = "", f = 0; f < this.columns.size(); ++f)
            for (var e = 0; e < this.columns[f].size(); ++e)
                for (var g =
                        0; g < a.size(); ++g) this.columns[f][e] === a[g] && (b++, c = 1 < b ? c + ", " : c, c += this.store.getById(this.columns[f][e]).get("label"), d = this.store.getById(this.columns[f][e]).get("label"));
        return 0 < b ? (1 < b && (a = 2 !== b ? c.indexOf(d) : c.indexOf(","), c = 2 !== b ? c.substring(0, a) + LC.getLabel("Global", "and") + c.substring(a) + " " : c.substring(0, a) + " " + LC.getLabel("Global", "and") + c.substring(a + 2)), b = (1 < b ? LC.getLabel("LayoutDND", "confirmDeleteFieldOnSummaryLayoutPlural", c) : LC.getLabel("LayoutDND", "confirmDeleteFieldOnSummaryLayoutSingle",
            c)) + "\n\n" + LC.getLabel("Global", "are_you_sure"), !confirm(b)) : !1
    },
    action_beforeDoRemove: function(a, b) {
        if (!b) return this.confirmRemoveSummaryLayoutField(a.itemIds)
    },
    action_doRemove: function(a, b) {
        var c = !1;
        if (b) {
            var d = a.sectionData.old.summaryLayout;
            if (d)
                for (e = 0; e < d.size(); ++e) c = d[e], this.columns[c.x][c.y] = c.id, c = !0
        } else {
            for (var d = a.itemIds, f = [], e = 0; e < this.columns.size(); ++e)
                for (var g = 0; g < this.columns[e].size(); ++g)
                    for (var h = 0; h < d.size(); ++h) this.columns[e][g] === d[h] && (f.push({
                            x: e,
                            y: g,
                            id: d[h]
                        }), this.columns[e][g] =
                        null, c = !0);
            a.sectionData.old || (a.sectionData.old = {});
            a.sectionData.old.summaryLayout = f
        }
        c && this.updateBodyAndEvents()
    }
});
Sfdc.layout.CaseInteractionSummaryLayoutSection = function(a, b, c, d) {
    Sfdc.layout.CaseInteractionSummaryLayoutSection.superclass.constructor.call(this, a, b, c, d)
};
Sfdc.layout.CaseInteractionSummaryLayoutSection.tpl = (new Ext.XTemplate('\x3ctable id\x3d"summaryItemsTable" cellspacing\x3d"10" style\x3d"width:100%; table-layout:fixed;"\x3e\x3ctr\x3e\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 1"\x3e', '\x3ctd style\x3d"width:25%"\x3e\x3cdiv class\x3d"slItemWrapBackground"\x3e\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 1"\x3e', '\x3ctpl if\x3d"values.label"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3cdiv class\x3d"label"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e',
    "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/tpl\x3e\x3c/div\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 3"\x3e', '\x3ctpl if\x3d"values.id"\x3e',
    '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 4"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 5"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e',
    '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/div\x3e\x3c/td\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3ctd style\x3d"width:50%"\x3e\x3cdiv class\x3d"slItemWrapBackground"\x3e\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 1"\x3e', "\x3cdiv\x3e", '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e',
    "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"label sideLabel"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e\x3cdiv class\x3d"sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"label sideLabel"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e\x3cdiv class\x3d"sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    '\x3c/tpl\x3e\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e\x3c/tpl\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 3"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 4"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"value"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/div\x3e\x3c/td\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 3"\x3e', '\x3ctd style\x3d"width:25%"\x3e\x3cdiv class\x3d"slItemWrapBackground"\x3e\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 1"\x3e', '\x3cdiv class\x3d"hpTop"\x3e', '\x3ctpl if\x3d"!values.id"\x3e', '\x3cdiv class\x3d"label"\x3e\x26nbsp\x3c/div\x3e\x3cdiv class\x3d"value"\x3e\x26nbsp\x3c/div\x3e', "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e',
    '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', '\x3c/tpl\x3e\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e\x3c/tpl\x3e', '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 2"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e',
    '\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 3"\x3e', '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', '\x3c/div\x3e\x3cdiv class\x3d"newRow"\x3e\x3c/div\x3e', "\x3c/tpl\x3e\x3c/tpl\x3e", '\x3ctpl if\x3d"xindex \x3d\x3d\x3d 4"\x3e',
    '\x3ctpl if\x3d"values.id"\x3e', '\x3cdiv class\x3d"hpBottom"\x3e', '\x3cdiv class\x3d"label sideLabel textRight"\x3e{[Ext.util.Format.htmlEncode(values["label"])]}\x3c/div\x3e', '\x3cdiv class\x3d"value sideValue"\x3e{[Sfdc.layout.SummaryLayoutSection.makeSample(values)]}\x3c/div\x3e', "\x3c/div\x3e", "\x3c/tpl\x3e\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/div\x3e\x3c/td\x3e", "\x3c/tpl\x3e", "\x3c/tpl\x3e\x3c/tr\x3e\x3c/table\x3e", '\x3cdiv id\x3d"slHoverGearDiv" class\x3d"summaryHoverGear"\x3e\x3c/div\x3e\x3cdiv id\x3d"slHoverDiv" class\x3d"summaryHover"\x3e\x3c/div\x3e')).compile();
Ext.extend(Sfdc.layout.CaseInteractionSummaryLayoutSection, Sfdc.layout.SummaryLayoutSection, {
    createPropsWindow: function() {
        this.propsWindow = new Sfdc.layout.CaseInteractionSummaryLayoutPropertiesWindow({
            handler: this.handler,
            layoutName: this.layoutName,
            store: this.store
        })
    },
    updateBody: function() {
        var a = !0;
        out = [];
        for (var b = 0; b < this.columns.length; b++) {
            var c = [];
            0 === b && c.push({
                label: this.columnHeader || "Customer"
            });
            for (var d = 0; d < this.columns[b].length; d++) {
                var f = this.columns[b][d],
                    e;
                if (f) {
                    var g = this._getItems([f]);
                    g && g[0] ? (e = g[0].data, a = !1, 1 == b && (1 == d && "CreatedDate" === f) && (f = g[0].copy(), f.set("label", LC.getLabel("CaseInteraction", "CreatedDate")), e = f.data)) : e = {
                        blank: !0
                    }
                } else e = {
                    blank: !0
                };
                c.push(e)
            }
            out.push(c)
        }
        a && (out = [
            []
        ]);
        Sfdc.layout.CaseInteractionSummaryLayoutSection.tpl.overwrite(this.body, out);
        a && (a = Ext.get("summaryItemsTable"), a.setHeight(40), a.child(".slItemWrapBackground").createChild({
            html: LC.getLabel("LayoutDND", "CustomizeHighlightsPanel"),
            cls: "slEmptyText"
        }));
        Ext.QuickTips.register({
            target: "slHoverGearDiv",
            cls: "wrenchTips",
            text: LC.getLabel("LayoutDND", "HighlightsPanelProperties")
        });
        this.adjustAllDimensions()
    },
    action_doRemove: function(a, b) {
        var c = !1;
        if (b) {
            var d = a.sectionData.old.summaryLayout;
            if (d)
                for (e = 0; e < d.size(); ++e) c = d[e], this.columns[c.x][c.y] = c.id, c = !0
        } else {
            for (var d = a.itemIds, f = [], e = 0; e < this.columns.size(); ++e)
                for (var g = 0; g < this.columns[e].size(); ++g)
                    if (1 !== e || 0 !== g && 1 !== g)
                        for (var h = 0; h < d.size(); ++h) this.columns[e][g] === d[h] && (f.push({
                            x: e,
                            y: g,
                            id: d[h]
                        }), this.columns[e][g] = null, c = !0);
            a.sectionData.old ||
                (a.sectionData.old = {});
            a.sectionData.old.summaryLayout = f
        }
        c && this.updateBodyAndEvents()
    },
    confirmRemoveSummaryLayoutField: function(a) {
        for (var b = 0, c = "", d = "", f = 0; f < this.columns.size(); ++f)
            for (var e = 0; e < this.columns[f].size(); ++e)
                if (1 !== f || 0 !== e && 1 !== e)
                    for (var g = 0; g < a.size(); ++g) this.columns[f][e] === a[g] && (b++, c = 1 < b ? c + ", " : c, c += this.store.getById(this.columns[f][e]).get("label"), d = this.store.getById(this.columns[f][e]).get("label"));
        return 0 < b ? (1 < b && (a = 2 !== b ? c.indexOf(d) : c.indexOf(","), c = 2 !== b ? c.substring(0,
            a) + LC.getLabel("Global", "and") + c.substring(a) + " " : c.substring(0, a) + " " + LC.getLabel("Global", "and") + c.substring(a + 2)), b = (1 < b ? LC.getLabel("LayoutDND", "confirmDeleteFieldOnSummaryLayoutPlural", c) : LC.getLabel("LayoutDND", "confirmDeleteFieldOnSummaryLayoutSingle", c)) + "\n\n" + LC.getLabel("Global", "are_you_sure"), !confirm(b)) : !1
    }
});
Sfdc.layout.SectionWrapper = function(a, b) {
    Sfdc.layout.SectionWrapper.superclass.constructor.call(this, b);
    if (a) {
        (this.handler = a) && this.handler.addObserver(this);
        if (!b.store) throw "Programmer Error: Layout must be provided with a store";
        this.store = b.store;
        this.layoutDropZoneConstructor = b.layoutDropZone || Sfdc.layout.LayoutDropZone
    }
    b.data && this.load(b.data)
};
Ext.apply(Sfdc.layout.SectionWrapper, {
    newSectionId: 0,
    nameTplNoButton: (new Ext.Template("\x3ch1\x3e{name:htmlEncode}\x3c/h1\x3e")).compile(),
    LAYOUT_NAME_MAX: 40,
    getLayoutNameForDisplay: function(a) {
        return Ext.util.Format.htmlEncode(Ext.util.Format.ellipsis(a, this.LAYOUT_NAME_MAX))
    },
    initializeLayoutDragZone: function(a) {
        a.dragZone = new Sfdc.GrayingDragZone(a.getEl(), {
            getDragData: function(b) {
                if (b = b.getTarget("div.section-header")) {
                    b = Ext.fly(b).parent(".section");
                    var c = a.getComponent(b.id);
                    if (c) {
                        var d = document.createElement("DIV");
                        d.appendChild(document.createTextNode(c.getTitle()));
                        d.id = Ext.id();
                        var e = document.createElement("DIV");
                        e.className = "marker";
                        e.appendChild(d);
                        return {
                            source: "layout",
                            sourceEl: b,
                            repairXY: Ext.fly(b).getXY(),
                            ddel: e,
                            sectionId: c.id,
                            noDelete: !c.mayRemove(),
                            noDeleteMsg: c.canDeleteSection ? LC.getLabel("LayoutDND", "alertCannotDeleteSectionVerbose") : LC.getLabel("LayoutDND", "alertUnremovableSection")
                        }
                    }
                }
            },
            getRepairXY: function() {
                return this.dragData.repairXY
            },
            onDrag: function(a) {
                Sfdc.layout.Trough.highlightDropSection(Sfdc.layout.Trough.SECTION_ID)
            },
            afterDragDrop: function(a, c, d) {
                Sfdc.layout.Trough.clearDropSection()
            }
        })
    }
});
Ext.extend(Sfdc.layout.SectionWrapper, Sfdc.PageBlock, {
    delayClearSelection: new Ext.util.DelayedTask,
    onRender: function() {
        Sfdc.layout.SectionWrapper.superclass.onRender.apply(this, arguments);
        this.handler && this.canDragAndDrop() && (this.dropZone = new this.layoutDropZoneConstructor(this), Sfdc.layout.SectionWrapper.initializeLayoutDragZone(this))
    },
    onDestroy: function() {
        this.handler.removeObserver(this);
        Sfdc.layout.SectionWrapper.superclass.onDestroy.call(this)
    },
    getSelection: function() {
        var a = {};
        this.items.each(function(b) {
            var c =
                b.getSelection();
            0 < c.length && (a[b.id] = c.clone())
        });
        return a
    },
    onSectionAdd: function(a, b, c) {
        b.on({
            entryMouseDown: a.onSectionEntryMouseDown,
            entryMouseUp: a.onSectionEntryMouseUp,
            entryDoubleClick: a.onSectionEntryDoubleClick,
            containerMouseDown: a.onSectionMouseDown,
            scope: a
        })
    },
    onSectionRemove: function(a, b) {
        b.un("entryMouseDown", a.onSectionEntryMouseDown, a);
        b.un("entryMouseUp", a.onSectionEntryMouseUp, a);
        b.un("entryDoubleClick", a.onSectionEntryDoubleClick, a);
        b.un("containerMouseDown", a.onSectionMouseDown, a)
    },
    getSectionPosition: function(a) {
        return this.items.findIndex("id", a, 0, !1, !0)
    },
    onSectionEntryMouseDown: function(a, b, c) {
        var d = Sfdc.layout.Section.getItemId(b.id);
        if (c.ctrlKey)
            if (a.isSelected(d)) a.deselect(d);
            else if (this.verifySelectionAllowed(a)) a.select(d);
        else return !1;
        else if (c.shiftKey) a.firstShift ? a.selectRect(d) : a.isSelected(d) ? (a.firstShift = d, a.select(d)) : this.verifySelectionAllowed(a) && (a.firstShift = d, a.select(d));
        else if (a.isSelected(d)) {
            var e = 0;
            this.items.each(function(a) {
                if (1 < e) return !1;
                e +=
                    a.getSelection().length
            });
            1 >= e && this.delayClearSelection.delay(150, function() {
                a.deselect(d)
            })
        } else this.clearSelection(), a.firstShift = d, a.select(d)
    },
    onSectionEntryMouseUp: function(a, b, c) {
        var d = Sfdc.layout.Section.getItemId(b.id),
            e = 0;
        this.items.each(function(a) {
            e += a.getSelection().length;
            if (1 < e) return !1
        });
        if (c.propertiesClick) this.showPropertiesForSelection();
        else if (c.removeClick) {
            b = this.getSelection();
            c = [];
            for (var g in b) b.hasOwnProperty(g) && (c = c.concat(b[g]));
            this.handler.perform({
                type: "Remove",
                itemIds: c,
                sectionData: {
                    selection: b,
                    sectionType: a.className
                }
            })
        } else !c.ctrlKey && !c.shiftKey && (a.isSelected(d) && 1 < e) && this.delayClearSelection.delay(200, function() {
            this.clearSelection();
            a.firstShift = d;
            a.select(d)
        }, this)
    },
    onSectionEntryDoubleClick: function(a, b, c) {
        this.delayClearSelection.cancel();
        this.showPropertiesForSelection()
    },
    showSectionProps: function(a, b) {
        b || (b = {
            type: "SetSectionProperties",
            sectionId: a
        });
        var c = this.getComponent(a),
            d = {};
        c ? (d.name = c.getTitle(), d.nameReadonly = c.nameReadonly, d.columns =
            c.getNumColumns(), d.editColumns = 3 > d.columns, d.notVisibleOnEdit = "CustomLink" in c.categoriesAllowed, d.showEditHeader = c.showEditHeader, d.showDetailHeader = c.showDetailHeader, d.sortOrder = c.sortOrder) : (d.name = LC.getLabel("LayoutDND", "NewSectionDefaultName"), d.nameReadonly = !1, d.columns = VFEditor.defaultNumColumnsInSections, d.editColumns = !0, d.notVisibleOnEdit = !1, d.showEditHeader = !0, d.showDetailHeader = !0, d.sortOrder = "h");
        this.sectionEditMsg = b;
        this.winSectionProps.show();
        this.winSectionProps.loadData(d)
    },
    sectionPropsOK: function() {
        if (this.sectionEditMsg) {
            var a =
                this.sectionEditMsg,
                b = this.getComponent(a.sectionId),
                c = this.winSectionProps.getData();
            if (!b || !b.nameReadonly) a.sectionName = c.name;
            a.numColumns = c.columns;
            a.showEditHeader = c.showEditHeader || !1;
            a.showDetailHeader = c.showDetailHeader || !1;
            a.sortOrder = c.sortOrder;
            this.handler.perform(a);
            delete this.sectionEditMsg;
            this.winSectionProps.hide()
        }
    },
    showPropertiesForSelection: function() {
        var a = [],
            b = this.getSelection(),
            c = !1,
            d = !1,
            e = !1,
            g = !1,
            k = !1,
            h = !1;
        $H(b).each(function(b) {
            var f = this.getComponent(b.key);
            b.value.each(function(b) {
                b =
                    f.getItem(b);
                switch (b.data.staticData.category) {
                    case "StandardField":
                    case "CustomField":
                        a.push(b.data);
                        g = !0;
                        break;
                    case "Control":
                        a.push(b.data);
                        c = !0;
                        break;
                    case "CustomSControl":
                        a.push(b.data);
                        d = !0;
                        break;
                    case "Page":
                        a.push(b.data);
                        e = !0;
                        break;
                    case "Canvas":
                        a.push(b.data);
                        h = !0;
                        break;
                    case "Analytics":
                        a.push(b.data), k = !0
                }
            })
        }, this);
        var f;
        if (d || e || c || h) {
            if (g) {
                Ext.Msg.alert(LC.getLabel("Global", "error"), LC.getLabel("LayoutDND", "alertFunctionForFieldsHomogeneous"));
                return
            }
            if (1 < a.length) {
                Ext.Msg.alert(LC.getLabel("Global",
                    "error"), LC.getLabel("LayoutDND", "alertFunctionForFieldsSControlPageSingleSelectionOnly"));
                return
            }
            c ? f = this.ownerCt.ownerCt.winControlProps : (f = this.ownerCt.ownerCt.winScontrolProps, d ? f.setTitle(LC.getLabel("LayoutDND", "SControlProperties")) : h ? f.setTitle(LC.getLabel("LayoutDND", "CanvasProperties")) : f.setTitle(LC.getLabel("LayoutDND", "VFPageProperties")))
        } else g ? f = this.winFieldProps : k && (f = this.winAnalyticsProps);
        f && (f.setFields(a), f.show())
    },
    getNumItemsOfCategory: function(a) {
        var b = 0;
        this.items.each(function(c) {
            b +=
                c.getItemsOfCategory(a).length
        });
        return b
    },
    getItemCountAllSections: function() {
        var a = 0;
        this.items.each(function(b) {
            a += b.getItemCount()
        });
        return a
    },
    getItemCountForLimit: function() {
        return this.quickActionSection ? this.quickActionSection.getItemCount() : 0
    },
    onCountChanged: function(a, b) {
        return !0
    },
    verifySelectionAllowed: function(a) {
        var b = this.items.find(function(a) {
            return 0 < a.getSelection().length
        });
        if (!b) return !0;
        if (a.categoriesAllowed) {
            if (!b.categoriesAllowed) return !1;
            for (var c in a.categoriesAllowed)
                if (a.categoriesAllowed.hasOwnProperty(c) &&
                    !(c in b.categoriesAllowed)) return !1;
            return !0
        }
        return !b.categoriesAllowed
    },
    onSectionMouseDown: function(a, b) {
        this.clearSelection()
    },
    getNewAndLoadSectionConstructor: function (a) {
        //debugger;
        return Sfdc.layout.FieldSection.newAndLoad;
    },
    setName: function(a) {
        this.name = a;
        var b = Ext.getCmp("otherLayoutsBtn");
        b ? b.setText(Sfdc.layout.SectionWrapper.getLayoutNameForDisplay(a)) : Sfdc.layout.SectionWrapper.nameTplNoButton.overwrite("layoutName", {
            name: a
        })
    },
    isButtonSectionId: function(a) {
        return a == Sfdc.layout.ButtonSection.SECTION_ID ||
            a == Sfdc.layout.QuickActionSection.SECTION_ID
    },
    acceptMessage: Ext.emptyFn,
    action_doAddSection: function(a, b) {
        if (b) {
            var c = this.getComponent(a.layoutData.insertAt);
            this.remove(c)
        } else {
            if (0 === a.layoutData.insertAt && this.getComponent(0).isFixedSection()) return !0;
            if (!a.sectionId) {
                do c = "section" + Sfdc.layout.SectionWrapper.newSectionId, Sfdc.layout.SectionWrapper.newSectionId += 1; while (this.getComponent(c));
                a.sectionId = c
            }
            a.canChangeColumns = !0;
            a.canDeleteSection = !0;
            c = this.getNewAndLoadSectionConstructor(a)(this.handler,
                this.store, a);
            this.insert(a.layoutData.insertAt, c)
        }
        this.doLayout()
    },
    action_doClearSelection: function(a, b) {
        this.items.each(function(a) {
            a.clearSelection()
        });
        return !0
    },
    clearSelection: function() {
        this.handler.perform({
            type: "ClearSelection"
        })
    },
    getSectionComponent: function(a) {
        return this.getComponent(a)
    },
    findControllersAndDependents: function() {
        var a = {
            controllerIds: {},
            dependentItems: []
        };
        this.items.each(function(b) {
            b.findControllersAndDependents && b.findControllersAndDependents(a)
        });
        return a
    }
});
Ext.ns("Sfdc", "Sfdc.layout");

function initializeTroughZones(a) {
    a.dragZone = new Sfdc.GrayingDragZone(a.getEl(), {
        clearOnSuccessfulDrop: !0,
        getDragData: function(b) {
            if (1 < a.getSelectionCount()) {
                b = b.getTarget(a.itemSelector, 10);
                var c, d;
                if (b) {
                    c = b.cloneNode(!0);
                    c.id = Ext.id();
                    c.innerHTML = LC.getLabel("LayoutDND", "MultipleDragProxy", a.getSelectionCount());
                    d = document.createElement("DIV");
                    d.className = "marker multiple";
                    d.appendChild(c);
                    var f = [],
                        e = [];
                    a.getSelectedRecords().each(function(a) {
                        f.push(a.data.id);
                        e.push(a.data.category)
                    });
                    return {
                        source: "trough",
                        sourceEl: Ext.select(a.getSelectedNodes()),
                        repairXY: Ext.fly(b).getXY(),
                        ddel: d,
                        itemIds: f,
                        categories: e
                    }
                }
            } else if (b = b.getTarget(a.itemSelector, 10)) {
                var g = a.getRecord(b);
                if ("used" == g.data.state) return !1;
                c = Ext.fly(b.cloneNode(!0)).down("span:not(.chartIcon)").dom;
                c.id = Ext.id();
                d = document.createElement("DIV");
                d.className = "marker";
                if ("StandardButton" == g.data.category || "CustomButton" == g.data.category) Ext.fly(c).dom.innerHTML = Sfdc.layout.AbstractButtonSection.buttonTypeLabelTpl.apply({
                    type: LC.getLabel("Global",
                        "labelWithColonNSpace", LC.getLabel("LayoutDND", g.data.category))
                }) + Ext.fly(c).dom.innerHTML;
                Ext.fly(d).appendChild(c);
                return {
                    source: "trough",
                    sourceEl: Ext.get(b),
                    repairXY: Ext.fly(b).getXY(),
                    ddel: d,
                    itemIds: [g.data.id],
                    categories: [g.data.category]
                }
            }
        },
        onBeforeDrag: function(a, c) {
            this.tempTarget = a.categories[0]
        },
        onDrag: function(a) {
            Sfdc.layout.Trough.highlightDropSection(this.tempTarget)
        },
        afterDragDrop: function(b, c, d) {
            Sfdc.GrayingDragZone.prototype.afterDragDrop.apply(this, arguments);
            a.clearSelections()
        },
        endDrag: function(a) {
            Sfdc.layout.Trough.clearDropSection()
        },
        getRepairXY: function() {
            return this.dragData.repairXY
        },
        shouldGray: function(a) {
            return !0
        }
    });
    a.dropTarget = new Ext.dd.DropTarget(Ext.getCmp("troughRightPane").getEl(), {
        notifyDrop: function(b, c, d) {
            d.noDelete && d.noDeleteMsg && Ext.Msg.alert(LC.getLabel("Global", "error"), d.noDeleteMsg);
            if (!d.source || d.noDelete) return !1;
            switch (d.source) {
                case "entry":
                case "button":
                case "quickaction":
                case "relatedContent":
                    b = {
                        type: "Remove",
                        itemIds: d.itemIds,
                        sectionData: {
                            selection: d.selection,
                            sectionType: d.className
                        }
                    };
                    break;
                case "layout":
                    b = {
                        type: "RemoveSection",
                        sectionId: d.sectionId
                    };
                    break;
                case "canvas":
                    b = {
                        type: "Remove",
                        itemIds: d.itemIds,
                        canvasData: {}
                    };
                    break;
                default:
                    return !1
            }
            return a.handler.perform(b)
        },
        notifyOver: function(a, c, d) {
            if (d.source && "trough" != d.source && !d.noDelete) return this.dropAllowed
        }
    })
}
Sfdc.layout.Trough = function(a) {
    Ext.applyIf(a, {
        multiSelect: !0,
        tpl: (new Ext.XTemplate('\x3ctpl if\x3d"this.showItemTable(values)"\x3e', '\x3ctable class\x3d"troughItems {[this.getTroughCls(values)]}"\x3e\x3ctr\x3e', '\x3ctpl for\x3d"."\x3e', '\x3ctpl if\x3d"!values.hidden"\x3e', '\x3ctpl if\x3d"this.newCell()"\x3e', '\x3ctpl if\x3d"this.numItemsRendered \x26gt; 1"\x3e\x3c/td\x3e\x3c/tpl\x3e', "\x3ctd\x3e", "\x3c/tpl\x3e", '\x3cdiv\x3e\x3cdiv class\x3d"item {state} {[this.getCls(values)]}" id\x3d"{id}"\x3e',
            "{[this.getImg(values)]}", '\x3cspan class\x3d"label"\x3e{[this.getLabel(values)]}\x3c/span\x3e', "\x3c/div\x3e\x3c/div\x3e", "\x3c/tpl\x3e", '\x3ctpl if\x3d"values.hidden"\x3e\x3cdiv class\x3d"item" style\x3d"display:none"\x3e\x3c/div\x3e\x3c/tpl\x3e', "\x3c/tpl\x3e", "\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e", "\x3c/tpl\x3e", "{[this.getMessageHTML(values)]}", {
                showItemTable: function(a) {
                    this.numItemsRendered = 0;
                    return !("Analytics" === this.category && 1 === a.length && 0 === Ext.getCmp("quickfind").getValue().length)
                },
                getMessageHTML: function(a) {
                    return !this.showItemTable(a) ? "".concat.apply("", Sfdc.layout.messageHTML(LC.getLabel("LayoutDND", "NoReportsWarning"), "warning")) : ""
                },
                newCell: function() {
                    return 0 === this.numItemsRendered++ % 4
                },
                getLabel: function(a) {
                    return Ext.util.Format.htmlEncode(Ext.util.Format.ellipsis(a.label, "Analytics" === a.category ? 40 : 20))
                },
                getCls: function(a) {
                    return "Analytics" === a.category ? "chart" : "Page" === a.category && !0 === a.isMobileEnabled ? "mobileEnabled" : ""
                },
                getTroughCls: function(a) {
                    return a.length &&
                        "Analytics" === a[a.length - 1].category ? "chartTrough" : ""
                },
                getImg: function(a) {
                    return "EmptySpace" == a.category ? '\x3cimg src\x3d"/img/ple/blankSpace.gif" class\x3d"icon" alt\x3d""\x3e\x3c/img\x3e' : "__SECTION" == a.category ? VFEditor.showQuoteFieldBlockIcon ? '\x3cimg src\x3d"/img/sales/quotes/fieldblock_ico.png" class\x3d"icon" alt\x3d""\x3e\x3c/img\x3e' : '\x3cimg src\x3d"/img/ple/newSection.gif" class\x3d"icon" alt\x3d""\x3e\x3c/img\x3e' : VFEditor.showTableSection && a.category == Sfdc.quoteTemplate.QuoteTemplateCanvas.TABLESECTION ?
                        '\x3cimg src\x3d"/img/sales/quotes/tableblock_ico.png" class\x3d"icon" alt\x3d""\x3e\x3c/img\x3e' : VFEditor.showRTAField && a.category == Sfdc.quoteTemplate.QuoteTemplateCanvas.RTA_FIELD ? '\x3cimg src\x3d"/img/sales/quotes/textimageblock_ico.png" class\x3d"icon" alt\x3d""\x3e\x3c/img\x3e' : "Analytics" === a.category ? '\x3cspan class\x3d"chartIcon ' + a.chartType + '"\x3e\x3c/span\x3e' : ""
                }
            })).compile(),
        listeners: {
            render: initializeTroughZones,
            beforeSelect: this.onBeforeSelect
        },
        selectedClass: "troughSelected",
        overClass: "hover"
    });
    Sfdc.layout.Trough.superclass.constructor.call(this, a);
    a.handler.addObserver(this);
    if (!a.store) throw "Programmer error: Trough must have a store";
    this.store = a.store;
    this.categoryStore = a.categoryStore;
    this.delayShowHover = new Ext.util.DelayedTask;
    this.propertiesTpl = (new Ext.XTemplate('\x3cdiv class\x3d"data"\x3e\x3ctpl if\x3d"category \x3d\x3d \'StandardButton\'"\x3e\x3cdiv class\x3d"dataItem"\x3e{[LC.getLabel("LayoutDND", "StandardButton")]}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"category \x3d\x3d \'CustomButton\'"\x3e\x3cdiv class\x3d"dataItem"\x3e{[LC.getLabel("LayoutDND", "CustomButton")]}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"category !\x3d \'Analytics\'"\x3e\x3cdiv class\x3d"dataItem"\x3e{[this.colon(LC.getLabel("LayoutDND", "Label"))]} {label:htmlEncode}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"category \x3d\x3d \'Analytics\'"\x3e\x3cdiv class\x3d"dataItem"\x3e{[this.colon(LC.getLabel("Global", "name"))]} {label:htmlEncode}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"name \x26\x26 category !\x3d \'StandardField\' \x26\x26 category !\x3d \'Analytics\'"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("Global", "name"))]}\x3c/span\x3e {name}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"name \x26\x26 category \x3d\x3d \'Analytics\'"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("LayoutDND", "Folder"))]}\x3c/span\x3e {folderName}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"type"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("Global", "type"))]}\x3c/span\x3e {[datatypeNames[values.type]]}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"length"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[LC.getLabel("LayoutDND", "moLength")]}\x3c/span\x3e {length}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"typeof scale \x3d\x3d \'number\'"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[LC.getLabel("LayoutDND", "moScale")]}\x3c/span\x3e {scale}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"controllerIds"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[LC.getLabel("LayoutDND", "controlField")]}\x3c/span\x3e \x3ctpl for\x3d"controllerNames"\x3e{.}\x3ctpl if\x3d"xindex \x26lt; xcount"\x3e, \x3c/tpl\x3e\x3c/tpl\x3e\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"dependentIds"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[LC.getLabel("LayoutDND", "dependent")]}\x3c/span\x3e \x3ctpl for\x3d"dependentNames"\x3e{.}\x3ctpl if\x3d"xindex \x26lt; xcount"\x3e, \x3c/tpl\x3e\x3c/tpl\x3e\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"isMobileEnabled\x3d\x3d\x3dfalse \x26\x26 category \x3d\x3d \'Page\'"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("LayoutDND", "pageAvailableForMobile"))]}\x3c/span\x3e{[LC.getLabel("LayoutDND", "pageAvailableNo")]}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"isMobileEnabled\x3d\x3d\x3dtrue \x26\x26 category \x3d\x3d \'Page\'"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("LayoutDND", "pageAvailableForMobile"))]}\x3c/span\x3e{[LC.getLabel("LayoutDND", "pageAvailableYes")]}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"actionType"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("LayoutDND", "actionType"))]}\x3c/span\x3e {actionType}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"targetEntityLabel"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("LayoutDND", "targetEntity"))]}\x3c/span\x3e {targetEntityLabel:htmlEncode}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"targetRecordType"\x3e\x3cdiv class\x3d"dataItem"\x3e\x3cspan class\x3d"label"\x3e{[this.colon(LC.getLabel("LayoutDND", "targetRecordType"))]}\x3c/span\x3e {targetRecordType:htmlEncode}\x3c/div\x3e\x3c/tpl\x3e\x3ctpl if\x3d"state \x3d\x3d \'used\'"\x3e\x3cdiv class\x3d"inUse"\x3e{[LC.getLabel("LayoutDND", "inUse")]}\x3c/div\x3e\x3c/tpl\x3e\x3c/div\x3e', {
        colon: function(a) {
            return LC.getLabel("Global", "labelWithColon", a)
        }
    })).compile()
};
Sfdc.layout.Trough.SECTION_ID = "__SECTION";
Sfdc.layout.Trough.blankCounter = 0;
Sfdc.layout.Trough.getNextBlankId = function() {
    var a = Sfdc.layout.Trough.blankCounter;
    Sfdc.layout.Trough.blankCounter += 1;
    return NewLayoutEditor.BLANK_ID + a
};
Sfdc.layout.Trough.isBlankId = function(a) {
    return 0 === a.indexOf(NewLayoutEditor.BLANK_ID)
};
Sfdc.layout.Trough.markItems = function(a, b, c) {
    Ext.isArray(b) || (b = [b]);
    dataChanged = filterCleared = !1;
    a.suspendEvents();
    for (var d = 0; d < b.length; d++) {
        var f = b[d];
        if (!Sfdc.layout.Trough.isBlankId(f) && (!VFEditor.showRTAField || !Sfdc.quoteTemplate.QuoteTemplateCanvas.isRTAField(f))) {
            var e = a.getById(f);
            !filterCleared && !e && (a.clearFilter(!0), filterCleared = !0, e = a.getById(f));
            e && ("unused" === c && "used" === e.get("state") ? e.set("state", "previouslyUsed") : e.set("state", c), dataChanged = dataChanged || e.dirty)
        } else VFEditor.showRTAField &&
            Sfdc.quoteTemplate.QuoteTemplateCanvas.isRTAField(f) && Sfdc.quoteTemplate.QuoteTemplateCanvas.trackRTANumChange(f, c)
    }
    filterCleared && a.filterFn && a.filterBy(a.filterFn, null, !0);
    a.resumeEvents();
    dataChanged && a.fireEvent("datachanged")
};
Sfdc.layout.Trough.highlightDropSection = function(a) {
    a.split(" ").each(function(a) {
        window.dragDropMap && window.dragDropMap.hasOwnProperty(a) && window.dragDropMap[a].each(function(a) {
            Ext.each(Ext.DomQuery.select("." + a), function(a) {
                Ext.get(a).addClass("dropTarget")
            })
        })
    })
};
Sfdc.layout.Trough.clearDropSection = function() {
    Ext.each(Ext.DomQuery.select(".dropTarget"), function(a) {
        Ext.get(a).removeClass("dropTarget")
    })
};
Ext.extend(Sfdc.layout.Trough, Ext.DataView, {
    onRender: function() {
        Sfdc.layout.Trough.superclass.onRender.apply(this, arguments);
        this.troughProperties = Ext.get("troughProperties");
        this.troughProperties || (this.troughProperties = Ext.get(Ext.getBody().createChild({
            tag: "div",
            id: "troughProperties",
            style: {
                visibility: "hidden"
            }
        })), this.troughProperties.position("absolute", 10), Ext.isIE6 && (this.troughProperties.fadeIn = this.troughProperties.setVisible.curry(!0), this.troughProperties.fadeOut = this.troughProperties.setVisible.curry(!1)));
        this.getEl().on("mouseover", this.onMouseOver, this, {
            buffer: 300
        });
        this.getEl().on("mouseout", this.onMouseOut, this);
        this.on("click", this.locateItem, this)
    },
    onDestroy: function() {
        this.handler.removeObserver(this);
        Sfdc.layout.Trough.superclass.onDestory.call(this)
    },
    action_doAdd: function(a, b) {
        b ? Sfdc.layout.Trough.markItems(this.store, a.itemIds, "unused") : Sfdc.layout.Trough.markItems(this.store, a.itemIds, "used")
    },
    action_doRemove: function(a, b) {
        if (b) Sfdc.layout.Trough.markItems(this.store, a.itemIds, "used");
        else {
            var c =
                Sfdc.layout.FieldSection.getQueryIds(a.itemIds),
                c = this.store.getItems(c).select(function(a) {
                    return !a ? !1 : "StandardButton" == a.data.category ? a.data.removable : Sfdc.layout.FieldSection.mayRemoveItem(a.data)
                }).pluck("id");
            if (!c || 0 === c.length) return !0;
            Sfdc.layout.Trough.markItems(this.store, c, "unused")
        }
    },
    refresh: function() {
        this.tpl.category = this.categoryFilter;
        Sfdc.layout.Trough.superclass.refresh.call(this);
        var a = this.el.dom.firstChild;
        a && "TABLE" === a.nodeName ? this.el.setWidth(Ext.fly(a).getWidth()) : this.el.setWidth()
    },
    onMouseOver: function(a) {
        if (!Ext.dd.DragDropMgr.dragCurrent) {
            var b = a.getTarget(this.itemSelector, this.getEl());
            b ? (this.lastItem !== b && (Ext.fly(b).addClass(this.overClass), this.lastItem = b), this.delayShowHover.delay(300, this.showHover, this, [a, b])) : (this.delayShowHover.cancel(), this.troughProperties.isVisible() && this.troughProperties.stopFx().fadeOut())
        }
    },
    showHover: function(a, b) {
        var c = this.getRecord(b);
        "special" == c.data.state ? (this.troughProperties.isVisible() && this.troughProperties.stopFx().fadeOut(),
            delete this.lastHoverItem) : this.lastHoverItem != b && (this.propertiesTpl.overwrite(this.troughProperties, c.data), this.troughProperties.stopFx(), this.troughProperties.moveTo(a.getPageX() + 10, a.getPageY() + 10), this.lastHoverItem || this.troughProperties.fadeIn(), Ext.getDoc().on("mouseover", this.monitorMouseOver, this), this.lastHoverItem = b)
    },
    monitorMouseOver: Ext.Button.prototype.monitorMouseOver,
    onMouseOut: function(a) {
        this.lastItem && !a.within(this.lastItem, !0) && (Ext.fly(this.lastItem).removeClass(this.overClass),
            delete this.lastItem);
        if (!a.within(this.getEl()) || a.getTarget(this.itemSelector, this.getEl()) != this.lastHoverItem) this.delayShowHover.cancel(), delete this.lastHoverItem, this.troughProperties.isVisible() && this.troughProperties.stopFx().fadeOut()
    },
    onBeforeSelect: function(a, b, c) {
        b = a.getRecord(b);
        if ("special" == b.data.state) return 0 === c.length;
        if ("used" == b.data.state || 0 < c.length && c.any(function(b) {
                return "special" == a.getRecord(b).data.state
            })) return !1
    },
    needAnalyticServerSideSearch: function() {
        return "Analytics" ===
            this.categoryFilter && 200 <= analyticsTroughData.length
    },
    onQuickfindChange: function(a, b) {
        var c = Ext.getCmp("quickfind");
        c.un("keydown", c.preFocus, c);
        c = a.getValue();
        0 < c.length ? this.needAnalyticServerSideSearch() ? this.filterAnalyticItemsByQuickFind(c) : this.filterItemsByQuickfind(c) : this.clearQuickfind()
    },
    _getCategoryFilterFn: function(a) {
        var b = this.categoryStore.getById(a);
        return function(c, d) {
            return d == Sfdc.layout.Trough.SECTION_ID ? b.data.showNewSection : d == NewLayoutEditor.BLANK_ID ? b.data.showBlank : VFEditor.showTableSection &&
                d == Sfdc.quoteTemplate.QuoteTemplateCanvas.TABLESECTION ? b.data.showTableSection : VFEditor.showRTAField && d == Sfdc.quoteTemplate.QuoteTemplateCanvas.RTA_FIELD ? b.data.showRTAField : c.data.displayCategory == a
        }
    },
    onCategoryChange: function(a, b) {
        this.delayShowHover.cancel();
        delete this.lastHoverItem;
        delete this.lastItem;
        var c = a.getRecord(b[0]),
            d = Ext.getCmp("quickfind");
        d.emptyText = VFEditor.labelMap.quickFindLabel.replace(RegExp("\\{0\\}", "g"), c.data.labelSingular);
        d.reset();
        "Analytics" === this.categoryFilter &&
            this.clearQuickfind();
        this.filterItemsByCategory(c.data.name)
    },
    filterItemsByCategory: function(a) {
        this.categoryFilter = a;
        this.store.filterFn = this._getCategoryFilterFn(a);
        this.store.filterBy(this.store.filterFn)
    },
    filterItemsByQuickfind: function(a) {
        var b = Sfdc.escapeForRegexp(a),
            c = a.charAt(0).match(/^\w/) ? RegExp("\\b" + b, "i") : RegExp(b, "i"),
            d = this._getCategoryFilterFn(this.categoryFilter);
        this.store.filterFn = function(a, b) {
            return 0 === a.data.id.indexOf("__") ? d(a, b) : !d(a, b) ? !1 : c.test(a.data.label)
        };
        this.store.filterBy(this.store.filterFn)
    },
    reloadAnalyticTroughData: function(a, b) {
        a.suspendEvents();
        a.remove(a.query("category", "Analytics").items.filter(function(a) {
            return a.data.hidden || "used" === a.data.state || "previouslyUsed" === a.data.state ? (a.data.hidden = !0, !1) : !0
        }));
        a.loadData(b.map(function(b) {
            var d = a.getById(b.id);
            if (d) return d.data.hidden = !1, a.remove(d), d.data;
            b.state = "unused";
            return b
        }), !0);
        a.resumeEvents();
        a.fireEvent("datachanged")
    },
    nextAnalyticSearchId: 0,
    filterAnalyticItemsByQuickFind: function(a) {
        var b = "analyticsSearch" + this.nextAnalyticSearchId,
            c = this;
        vfeditor_analyticsSearch(a, this.nextAnalyticSearchId);
        this.nextAnalyticSearchId++;
        VFEditor.registerCallback(b, function(a) {
            "Analytics" === c.categoryFilter && c.reloadAnalyticTroughData(c.store, a)
        })
    },
    clearQuickfind: function() {
        var a = Ext.getCmp("quickfind");
        a.reset();
        a.on("keydown", a.preFocus, a);
        this.needAnalyticServerSideSearch() ? this.reloadAnalyticTroughData(this.store, analyticsTroughData) : (this.store.filterFn = this._getCategoryFilterFn(this.categoryFilter), this.store.filterBy(this.store.filterFn))
    },
    locateItem: function(a, b, c, d) {
        a = a.getRecord(c);
        if ("used" == a.data.state) {
            switch (a.data.displayCategory) {
                case "RelatedList":
                    b = Ext.getCmp(a.id);
                    a = b.getEl();
                    b = [b.body.body];
                    break;
                case "Button":
                case "QuickAction":
                    a = Ext.get(getElementByIdCS(Sfdc.layout.Section.makeElementId(a.id)));
                    b = [a];
                    break;
                case "Control":
                case "Analytics":
                case "SControl":
                case "Page":
                case "Canvas":
                    a = Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(a.id))).parent("td");
                    b = [a, a.child(".block")];
                    break;
                default:
                    a = Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(a.id))).parent("td"),
                        b = [a]
            }
            a && (Sfdc.scrollIntoViewWindow(a, 15, {
                top: Ext.getCmp("troughPanel").getEl().getHeight()
            }), Ext.select(b).highlight())
        }
    }
});
Sfdc.layout.Quickfind = Ext.extend(Ext.Component, {
    autoEl: !1,
    onRender: function(a) {
        a = a.createChild({
            tag: "div",
            cls: "toolsInner"
        });
        var c = Ext.getCmp("fieldTrough");
        Ext.DomHelper.append(a, {
            tag: "img",
            src: "/img/ple/search20.gif",
            width: 20,
            height: 20,
            alt: ""
        });
        new Ext.form.Label({
            forId: "quickfind",
            text: LC.getLabel("LayoutDND", "QuickFind"),
            renderTo: a
        });
        var b = new Ext.form.TextField({
            name: "quickfind",
            id: "quickfind",
            enableKeyEvents: !0,
            emptyText: " ",
            listeners: {
                keyup: c.onQuickfindChange,
                scope: c
            },
            renderTo: a
        });
        new Sfdc.SimpleButton({
            name: "quickfind_clear",
            id: "quickfind_clear",
            overCls: "hover",
            handler: c.clearQuickfind,
            style: {
                left: b.getEl().getOffsetsTo(a)[0] + b.getEl().getWidth() + 3 + "px"
            },
            scope: c,
            renderTo: a
        });
        this.el = Ext.get(a)
    },
    setSize: Ext.emptyFn
});
Sfdc.layout.OtherLayoutMenuItem = function(a, c) {
    var b = {
        text: Ext.util.Format.htmlEncode(a.name)
    };
    c ? (b.canActivate = !1, b.cls = "thisLayout") : (b.handler = this.goToLayout, b.scope = this);
    this.layoutInfo = a;
    Sfdc.layout.OtherLayoutMenuItem.superclass.constructor.call(this, b)
};
Sfdc.layout.OtherLayoutMenuItem.urlTpl = new Ext.Template("");
Ext.extend(Sfdc.layout.OtherLayoutMenuItem, Ext.menu.Item, {
    goToLayout: function() {
        var a = Sfdc.layout.OtherLayoutMenuItem.urlTpl.apply(this.layoutInfo);
        VFEditor.confirmLeave(a, !0)
    }
});
Sfdc.layout.PreviewMenuItem = function(a) {
    var c = {
        text: Ext.util.Format.htmlEncode(a.label),
        handler: this.previewAs,
        scope: this
    };
    this.profileId = a.id;
    Sfdc.layout.PreviewMenuItem.superclass.constructor.call(this, c)
};
Ext.extend(Sfdc.layout.PreviewMenuItem, Ext.menu.Item, {
    previewAs: function() {
        VFEditor.showPreview(this.profileId)
    }
});
Sfdc.layout.TutorialSplashWindow = function() {
    Sfdc.layout.TutorialSplashWindow.superclass.constructor.call(this, {
        title: LC.getLabel("LayoutDNDSplash", "title"),
        id: "tutorialSplashWindow",
        width: 470,
        height: 390,
        modal: !0,
        constrain: !0,
        cls: "tutorialWindow",
        buttons: [new Ext.Button({
            text: LC.getLabel("LayoutDNDSplash", "closeBtn"),
            handler: function() {
                Ext.getCmp("tutorialSplashWindow").close()
            }
        })],
        buttonAlign: "center",
        listeners: {
            close: function() {
                Ext.getDom("closeAndNeverShow").checked && UserContext.userPreferences.setBoolean("HideNewPLESplash",
                    !0)
            }
        }
    })
};
Ext.extend(Sfdc.layout.TutorialSplashWindow, Ext.Window, {
    getTpl: function() {
        return new Ext.Template("\x3cp\x3e", LC.getLabel("LayoutDNDSplash", "topText"), "\x3c/p\x3e", '\x3cdiv class\x3d"play"\x3e\x3ca href\x3d"#" id\x3d"tutorial_playLink"\x3e\x3cimg class\x3d"playVideoBtn" src\x3d"/s.gif"\x3e', "\x3cbr/\x3e", '\x3cspan class\x3d"playBtnLabel"\x3e', LC.getLabel("LayoutDNDSplash", "playVideo"), "\x3c/span\x3e", "\x3c/a\x3e\x3c/div\x3e", "\x3cbr/\x3e", '\x3cul class\x3d"bottomTextInfo"\x3e\x3cli\x3e', LC.getLabel("LayoutDNDSplash",
            "bottomText"), "\x3c/li\x3e\x3c/ul\x3e", "\x3cp\x3e", '\x3cimg class\x3d"videoThumb" src\x3d"/img/ple/video_thumb.png"\x3e\x3c/p\x3e', '\x3cbr/\x3e\x3cp class\x3d" closeCheckbox"\x3e', '\x3cinput type\x3d"checkbox" id\x3d"closeAndNeverShow"\x3e', LC.getLabel("LayoutDNDSplash", "closeAndNeverShow"), "\x3c/p\x3e")
    },
    onRender: function() {
        Sfdc.layout.TutorialSplashWindow.superclass.onRender.apply(this, arguments);
        this.getTpl().overwrite(this.body, {});
        this.body.child("img.playVideoBtn").addClassOnOver("hover");
        Ext.fly("tutorial_playLink").on("click",
            this.showVideo, this)
    },
    showVideo: function() {
        VFEditor.showTutorial();
        this.close()
    }
});
Sfdc.layout.TutorialWindow = function() {
    Sfdc.layout.TutorialWindow.superclass.constructor.call(this, {
        title: LC.getLabel("LayoutDNDSplash", "videoTitle"),
        width: 795,
        height: UserContext && UserContext.uiSkin == UiSkin.ALOHA.apiValue ? 545 : 524,
        modal: !0,
        constrainHeader: !0
    })
};
Ext.extend(Sfdc.layout.TutorialWindow, Ext.Window, {
    onRender: function() {
        Sfdc.layout.TutorialWindow.superclass.onRender.apply(this, arguments);
        this.body.update("\x3ciframe src\x3d'" + VFEditor.tutorialUrl + "' height\x3d'480' width\x3d'769' scrolling\x3d'no' frameborder\x3d'0' marginheight\x3d'0' marginwidth\x3d'0'/\x3e")
    }
});
Sfdc.layout.DisplayAttributes = function() {
    return {
        getScrollbarWidth: function() {
            var a = new Ext.Element(document.createElement("div"));
            document.body.appendChild(a.dom);
            a.position("absolute");
            a.setLeftTop(-1E3, -1E3);
            a.setSize(100, 50);
            a.setStyle("overflow", "hidden");
            a.hide();
            innerDiv = new Ext.Element(document.createElement("div"));
            innerDiv.setHeight(100);
            a.appendChild(innerDiv);
            var c = innerDiv.getWidth();
            a.setStyle("overflow", "auto");
            for (var b = innerDiv.getWidth(); Ext.isIE && c === b;) b = innerDiv.getWidth();
            a.remove();
            return c - b
        }
    }
}();
Sfdc._escapeForRegexpRE = RegExp("([\\/.*+?|()[\\]{}\\\\^$])", "g");
Sfdc.escapeForRegexp = function(a) {
    return a.replace(Sfdc._escapeForRegexpRE, "\\$1")
};
Ext.override(Ext.form.Field, {
    msgTarget: "under"
});
Ext.dd.DragDropMgr.margins = {
    top: 0,
    left: 0,
    bottom: 0,
    right: 0
};
Ext.dd.DragDropMgr.getLocation = function (a) {

    if (!this.isTypeOfDD(a)) return null;
    var b = a.getEl(),
        c, d, e;
    try {
        c = Ext.lib.Dom.getXY(b)
    } catch (f) {
    }
    if (!c) return null;
    d = c[0];
    e = d + b.offsetWidth;
    c = c[1];
    b = new Ext.lib.Region(c - a.padding[0], e + a.padding[1], c + b.offsetHeight + a.padding[2], d - a.padding[3]);
    if (!b) return null;
    if (a.getEl().getBoundingClientRect) return b;
    a = a.getEl();
    d = Ext.getBody().dom;
    for (e = !1; a && a != d;) {
        if ("fixed" == Ext.fly(a).getStyle("position")) {
            e = !0;
            break
        }
        a = a.parentNode
    }
    e && (d = Ext.getBody().getScroll(), a =
        Ext.fly(a).getXY(), b.adjust(d.top - a[1], d.left, d.top - a[1], d.left));
    return b
};
Ext.dd.DragDropMgr.handleMouseUp = function() {
    var a = Ext.dd.DragDropMgr.handleMouseUp;
    return Ext.isIE6 ? function(b) {
        return "resize" == b.type ? !1 : a.call(this, b)
    } : a
}();
Ext.dd.DragDropMgr.floatingObjs = {};
Ext.dd.DragDropMgr.registerFloating = function(a) {
    this.floatingObjs[a.id] = a
};
Ext.dd.DragDropMgr.unregisterFloating = function(a) {
    delete this.floatingObjs[a.id]
};
Ext.dd.DragDropMgr.unregAll = function() {
    var a = Ext.dd.DragDropMgr.unregAll;
    return function() {
        Ext.dd.DragDropMgr.floatingObjs = {};
        a.apply(this, arguments)
    }
}();
Ext.dd.DragDropMgr.removeDDFromGroup = function() {
    oldFn = Ext.dd.DragDropMgr.removeDDFromGroup;
    return function(a, b) {
        oldFn.apply(this, arguments);
        this.unregisterFloating(a)
    }
}();
Ext.dd.DragDropMgr.isInFloating = function(a) {
    for (var b in this.floatingObjs)
        if (this.floatingObjs.hasOwnProperty(b) && this.getLocation(this.floatingObjs[b]).contains(a)) return !0;
    return !1
};
Ext.Shadow.prototype.show = function() {
    var a = Ext.Shadow.prototype.show;
    return Ext.isIE6 ? Ext.emptyFn : function(b) {
        this.refreshPosition(b);
        a.call(this, b)
    }
}();
Ext.Shadow.prototype.refreshPosition = function(a) {
    this.el && ("fixed" == Ext.fly(a).getStyle("position") ? this.el.setStyle("position", "fixed") : this.el.setStyle("position", "absolute"))
};
Ext.dd.StatusProxy.prototype.reset = function() {
    var a = Ext.dd.StatusProxy.prototype.reset;
    return function(b) {
        a.apply(this, arguments);
        this.el.child(".multiple") && this.el.addClass("multiple");
        this.el.addClass("proxy")
    }
}();
Ext.dd.StatusProxy.prototype.update = function() {
    var a = Ext.dd.StatusProxy.prototype.update;
    return function(b) {
        a.apply(this, arguments);
        this.el.child(".multiple") && this.el.addClass("multiple")
    }
}();
Ext.isIE6 ? Ext.extend(Ext.Layer, Ext.Layer, {
        sync: function(a) {
            var b = this.shadow;
            if (!this.updating && this.isVisible() && (b || this.useShim)) {
                var c = this.getShim(),
                    d = this.getWidth(),
                    e = this.getHeight(),
                    f = this.getLeft(!0),
                    g = this.getTop(!0);
                b && !this.shadowDisabled ? (a && !b.isVisible() ? b.show(this) : b.realign(f, g, d, e), c && (a && c.show(), b.el && (a = b.el.getXY(), c = c.dom.style, b = b.el.getSize(), c.left = a[0] + "px", c.top = a[1] + "px", c.width = b.width + "px", c.height = b.height + "px"))) : c && (a && c.show(), c.setSize(d, e), c.setLeftTop(f, g))
            }
        }
    }) :
    Ext.Layer.prototype.sync = Ext.Layer.prototype.sync.createSequence(function(a) {
        this.shadow && (!this.updating && this.isVisible()) && this.shadow.refreshPosition(this)
    });
Sfdc.layout.AbstractButtonDragZone = function(a, b) {
    Sfdc.layout.AbstractButtonDragZone.superclass.constructor.call(this, {
        source: b,
        section: a
    })
};
Ext.extend(Sfdc.layout.AbstractButtonDragZone, Sfdc.layout.AbstractSectionDragZone, {
    getEntry: function(a) {
        return a.getTarget("div.btn")
    },
    getItemIds: function(a) {
        return a ? [Sfdc.layout.Section.getItemId(a.id)] : []
    },
    afterDragData: function(a) {
        a.categories = this.getCategories(a.itemIds);
        a.selection = this.getSelection(a.itemIds)
    },
    getCategories: Ext.emptyFn,
    getSelection: function(a) {
        var b = {};
        b[this.section.sectionId] = a.clone();
        return b
    },
    getNoDeleteMsg: function() {
        return LC.getLabel("LayoutDND", "alertAlwaysDisplayedButton")
    },
    shouldGray: function(a) {
        return !Ext.isIE
    },
    onBeforeDrag: function(a, b) {
        this.tempTarget = a.categories ? a.categories[0] : null
    },
    onDrag: function(a) {
        this.tempTarget && Sfdc.layout.Trough.highlightDropSection(this.tempTarget)
    },
    afterDragDrop: function(a, b, c) {
        Sfdc.layout.Trough.clearDropSection()
    }
});
Sfdc.layout.ButtonDragZone = function(a) {
    Sfdc.layout.ButtonDragZone.superclass.constructor.call(this, a, "button")
};
Ext.extend(Sfdc.layout.ButtonDragZone, Sfdc.layout.AbstractButtonDragZone, {
    getCategories: function(a) {
        return a.collect(function(a) {
            return Sfdc.layout.ButtonSection.isStdButtonId(a) ? "StandardButton" : "CustomButton"
        })
    },
    afterDragData: function(a) {
        Sfdc.layout.ButtonDragZone.superclass.afterDragData.apply(this, arguments);
        var b = Ext.fly(a.ddel).down("div", !0);
        b.innerHTML = Sfdc.layout.AbstractButtonSection.buttonTypeLabelTpl.apply({
                type: LC.getLabel("Global", "labelWithColonNSpace", LC.getLabel("LayoutDND", a.categories))
            }) +
            b.innerHTML
    },
    noRemoveFn: function(a) {
        return a ? !a.removable : !1
    }
});
Sfdc.layout.QuickActionDragZone = function(a) {
    Sfdc.layout.QuickActionDragZone.superclass.constructor.call(this, a, "quickaction")
};
Ext.extend(Sfdc.layout.QuickActionDragZone, Sfdc.layout.AbstractButtonDragZone, {
    getCategories: function(a) {
        return a.collect(function() {
            return "QuickAction"
        })
    },
    noRemoveFn: function() {
        return !1
    }
});
Sfdc.layout.ButtonDropZone = function(a, b, c) {
    this.section = a;
    this.sourceStr = b;
    this.categoriesAllowed = c;
    this.animation = !Ext.isIE
};
Ext.extend(Sfdc.layout.ButtonDropZone, Sfdc.dd.DelegatedDropZone, {
    _getTarget: function(a) {
        this.lastTarget && this.lastTarget.at === a || (this.lastTarget = {
            at: a
        });
        return this.lastTarget
    },
    getTargetFromEvent: function(a) {
        var b = a.getTarget("div.customButton");
        if (b) {
            var c = this.section.buttons.indexOf(Sfdc.layout.Section.getItemId(b.id));
            a = Ext.lib.Event.getPageX(a);
            b = (Ext.fly(b).getX() + Ext.fly(b).getRight()) / 2;
            return a <= b ? this._getTarget(c) : this._getTarget(c + 1)
        }
        a = Ext.lib.Event.getPageX(a);
        c = Ext.fly(this.section.buttonContainer).getBox();
        return a < c.x || 0 === this.section.buttons.length ? this._getTarget(0) : this._getTarget(this.section.buttons.length)
    },
    onNodeEnter: function(a, b, c, d) {
        delete this.wasAllowed;
        this.allowed = !1;
        d.categories && (this.allowed = d.categories.all(function(a) {
            return a in this.categoriesAllowed
        }, this));
        this.allowed && this.mark(a, d)
    },
    onNodeOut: function(a, b, c, d) {
        this.allowed && (this.unmark(a, d), this.wasAllowed = !0);
        delete this.allowed
    },
    unmark: function(a, b) {
        for (var c = 0; c < b.itemIds.length; c++)
            if ("StandardButton" == b.categories[c]) {
                var d =
                    Ext.get(getElementByIdCS(Sfdc.layout.Section.makeElementId(b.itemIds[c])));
                d.removeClass("marked");
                b.itemIds[c] in this.section.stdButtonsRevoked && (d.setVisibilityMode(Ext.Element.DISPLAY), d.hide())
            } else 0 === a.at ? 0 === this.section.buttons.length ? Ext.fly(this.section.buttonContainer).removeClass("marked") : Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(this.section.buttons[0]))).removeClass("markedAbove") : Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(this.section.buttons[a.at -
                1]))).removeClass("marked")
    },
    mark: function(a, b) {
        for (var c = 0; c < b.itemIds.length; c++)
            if ("StandardButton" == b.categories[c]) {
                var d = Ext.get(getElementByIdCS(Sfdc.layout.Section.makeElementId(b.itemIds[c])));
                d.addClass("marked");
                d.show()
            } else 0 === a.at ? 0 === this.section.buttons.length ? Ext.fly(this.section.buttonContainer).addClass("marked") : Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(this.section.buttons[0]))).addClass("markedAbove") : Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(this.section.buttons[a.at -
                1]))).addClass("marked")
    },
    onNodeOver: function(a, b, c, d) {
        if (this.allowed) return this.dropAllowed
    },
    onNodeDrop: function(a, b, c, d) {
        if (!this.wasAllowed) return !1;
        delete this.wasAllowed;
        b = {
            itemIds: d.itemIds
        };
        if ("trough" === d.source) b.type = "Add";
        else if (d.source === this.sourceStr) b.type = "Move";
        else return !1;
        this.section.addSectionData(b, d.itemIds, d.categories, a.at);
        return this.section.handler.perform(b)
    }
});
Sfdc.layout.AbstractButtonSection = function(a, b) {
    Ext.applyIf(b, {
        fixedSection: !0,
        baseCls: "buttonBar",
        handler: a,
        buttonClass: "customButton",
        sectionId: "__A_BUTTONS",
        titleLabel: LC.getLabel("LayoutButtons", "CustomButtons")
    });
    Sfdc.layout.AbstractButtonSection.superclass.constructor.call(this, b);
    this.buttons = []
};
Ext.apply(Sfdc.layout.AbstractButtonSection, {
    buttonTpl: (new Ext.XTemplate('\x3cdiv id\x3d"', Sfdc.layout.Section.ITEM_PREFIX, '{id}" class\x3d"btn customButton"\x3e{label:htmlEncode}\x3c/div\x3e\x3cspan\x3e\x26ensp;\x3c/span\x3e')).compile(),
    buttonBarTpl: (new Ext.XTemplate('\x3cfieldset class\x3d"{cls}"\x3e\x3clegend\x3e{title}\x3c/legend\x3e', '\x3cdiv class\x3d"firstSpace"\x3e\x3c/div\x3e\x3c/fieldset\x3e')).compile(),
    buttonTypeLabelTpl: (new Ext.XTemplate('\x3cspan class\x3d"markerType"\x3e{type}\x3c/span\x3e')).compile()
});
Ext.extend(Sfdc.layout.AbstractButtonSection, Sfdc.layout.Section, {
    getEmptyButtonConfig: function() {
        return {
            tag: "span",
            html: "\x26nbsp;"
        }
    },
    appendEmptyButtonConfig: function(a) {
        return a.createChild(this.getEmptyButtonConfig())
    },
    acceptMessage: function(a) {
        return "Add" == a.type ? a.sectionData && this.sectionId == a.sectionData.sectionId : a.sectionData && this.sectionId in a.sectionData.selection
    },
    action_doAdd: function(a, b) {
        b ? a.itemIds.each(this.removeButton, this) : a.itemIds.each(this.addButton.curry(a.sectionData.pos),
            this);
        this.fireEvent("countChanged", this, this.getItemCount())
    },
    action_doMove: function(a, b) {
        if (b) a.itemIds.each(this.removeButton, this), a.itemIds.each(function(b, c) {
            this.addButton(a.sectionData.old.pos[c], b)
        }, this);
        else {
            if (this.buttons[a.sectionData.pos] === a.itemIds[0]) return !0;
            this.saveOldPosition(a);
            a.itemIds.each(this.removeButton, this);
            var c = a.sectionData.pos;
            a.sectionData.pos > a.sectionData.old.pos && c--;
            a.itemIds.each(this.addButton.curry(c), this)
        }
    },
    action_doRemove: function(a, b) {
        b ? a.itemIds.each(function(b,
            d) {
            this.addButton(a.sectionData.old.pos[d], b)
        }, this) : (this.saveOldPosition(a), a.itemIds.each(this.removeButton, this));
        this.fireEvent("countChanged", this, this.getItemCount())
    },
    onRender: function() {
        Sfdc.layout.AbstractButtonSection.superclass.onRender.apply(this, arguments);
        this.handler && (this.dragZone = new this.dragZoneCtor(this), this.dropZone = this.getDropZone());
        this.renderButtonContainer();
        if (this.handler) this.body.on({
            mouseover: this.sectionMouseOver,
            mouseout: this.sectionMouseOut,
            scope: this
        })
    },
    getDropZone: Ext.emptyFn,
    renderButtonContainer: function() {
        this.buttonContainer = Sfdc.layout.AbstractButtonSection.buttonBarTpl.append(this.body, {
            cls: "customButtons " + window.dragDropMap.CustomButton,
            title: this.titleLabel
        });
        var a = this._getStoreItems(this.buttons);
        0 < a.length ? a.each(function(a) {
            Sfdc.layout.AbstractButtonSection.buttonTpl.append(this.buttonContainer, a.data)
        }, this) : this.appendEmptyButtonConfig(Ext.get(this.buttonContainer).first("div"))
    },
    getButtonPos: function(a) {
        return this.buttons.indexOf(a)
    },
    saveOldPosition: function(a) {
        a.sectionData ||
            (a.sectionData = {});
        a.sectionData.old = {
            pos: []
        };
        a.itemIds.each(function(b) {
            a.sectionData.old.pos.push(this.getButtonPos(b))
        }, this)
    },
    selectItem: function(a) {
        Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(btnId))).addClass("selected")
    },
    deselectItem: function(a) {
        Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(btnId))).removeClass("selected")
    },
    clearAllSelected: function() {
        Ext.select(this.getSelection().collect(Sfdc.layout.Section.makeElementId)).removeClass("selected")
    },
    sectionMouseOver: function(a) {
        if (!Ext.dd.DragDropMgr.dragCurrent &&
            this.handler) {
            var b = a.getTarget(".btn", 4);
            b && !a.within(b, !0) && Ext.fly(b).addClass("hoverButton")
        }
    },
    sectionMouseOut: function(a) {
        if (this.handler) {
            var b = a.getTarget(".hoverButton", 4);
            b && !a.within(b, !0) && Ext.fly(b).removeClass("hoverButton")
        }
    },
    addSectionData: function(a, b, c, d) {
        a.sectionData = {
            sectionId: this.sectionId,
            selection: {},
            pos: d
        };
        a.sectionData.selection[this.sectionId] = b
    },
    addButton: function(a, b) {
        if (this.rendered) {
            var c = this._getStoreItems([b])[0];
            if (0 < a) {
                var d = Ext.fly(getElementByIdCS(Sfdc.layout.Section.makeElementId(this.buttons[a -
                    1]))).dom.nextSibling;
                Sfdc.layout.AbstractButtonSection.buttonTpl.insertAfter(d, c.data)
            } else 0 === this.buttons.length ? Sfdc.layout.AbstractButtonSection.buttonTpl.overwrite(Ext.fly(this.buttonContainer).first("div"), c.data) : Sfdc.layout.AbstractButtonSection.buttonTpl.insertBefore(Ext.get(getElementByIdCS(Sfdc.layout.Section.makeElementId(this.buttons[0]))), c.data)
        }
        this.buttons.splice(a, 0, b)
    },
    removeButton: function(a) {
        var b = this.buttons.indexOf(a);
        this.rendered && (a = Ext.get(getElementByIdCS(Sfdc.layout.Section.makeElementId(a))),
            a.dom.parentNode.removeChild(a.dom.nextSibling), a.remove());
        this.buttons.splice(b, 1);
        0 === this.buttons.length && this.appendEmptyButtonConfig(Ext.get(this.buttonContainer).first("div"));
        return b
    },
    getItemCount: function() {
        return this.buttons.length
    },
    save: function() {
        return {
            buttonsAdded: this.buttons
        }
    }
});
Sfdc.layout.QuickActionButtonDropZone = Ext.extend(Sfdc.layout.ButtonDropZone, {
    onNodeEnter: function(a, b, c, d) {
        delete this.wasAllowed;
        this.allowed = !1;
        this.section.overriding && d.categories && (this.allowed = d.categories.all(function(a) {
            return a in this.categoriesAllowed
        }, this));
        this.allowed && this.mark(a, d)
    }
});
Sfdc.layout.QuickActionSection = function(a, b) {
    Ext.applyIf(b, {
        handler: a,
        sectionId: Sfdc.layout.QuickActionSection.SECTION_ID,
        titleLabel: "",
        dragZoneCtor: Sfdc.layout.QuickActionDragZone,
        cls: "quickActionBar"
    });
    Sfdc.layout.QuickActionSection.superclass.constructor.apply(this, arguments)
};
Ext.apply(Sfdc.layout.QuickActionSection, {
    SECTION_ID: "__QUICK_ACTION",
    overriding: !1
});
Ext.extend(Sfdc.layout.QuickActionSection, Sfdc.layout.AbstractButtonSection, {
    getDropZone: function() {
        return new Sfdc.layout.QuickActionButtonDropZone(this, "quickaction", {
            QuickAction: !0
        })
    },
    load: function(a) {
        if (a) {
            this.overriding = !0;
            a = a.pluck("id");
            for (var b = 0; b < a.length; b++) this.addButton(b, a[b]);
            Sfdc.layout.Trough.markItems(this.store, a, "used")
        } else this.overriding = !1
    },
    addDefaultButtonsToEmpty: function() {
        for (var a = VFEditor.quickActionsDefaults.pluck("id"), b = 0; b < a.length; b++) this.addButton(b, a[b]);
        Sfdc.layout.Trough.markItems(this.store,
            a, "used")
    },
    showRevertOverride: function() {
        if (!VFEditor.isGlobalLayout) {
            var a = this.getEl().query(".revertQuickActionIcon")[0];
            a ? Ext.fly(a).show() : (a = this.getEl().query("fieldset")[0], null !== a && (a = Ext.fly(a).createChild({
                tag: "div",
                cls: "revertQuickActionIconContainer",
                children: [{
                    tag: "div",
                    cls: "revertQuickActionIcon"
                }]
            }), a.dom.title = LC.getLabel("PublisherActionsButtons", "resetOverride"), a.on({
                click: this.revertOverridAskConfirm,
                scope: this
            }), a.addClassOnOver("revertQuickActionIconOver")))
        }
    },
    hideRevertOverride: function() {
        Ext.fly(this.getEl().query(".revertQuickActionIcon")[0]).hide()
    },
    acceptMessage: function(a) {
        return "RevertOverride" == a.type || "OverrideContent" == a.type ? !0 : Sfdc.layout.QuickActionSection.superclass.acceptMessage.apply(this, arguments)
    },
    revertOverridAskConfirm: function() {
        var a = this;
        Ext.Msg.show({
            title: LC.getLabel("PublisherActionsButtons", "resetOverrideAlertTitle"),
            msg: LC.getLabel("PublisherActionsButtons", "resetOverrideAlert"),
            buttons: Ext.Msg.OKCANCEL,
            cls: "publisherActionsRevert",
            fn: function(b) {
                "ok" == b && a.revertOverride()
            },
            width: 550
        })
    },
    revertOverride: function() {
        this.handler.perform({
            type: "RevertOverride"
        })
    },
    action_doRevertOverride: function(a, b) {
        if (b) {
            this.overriding = a.old.overriding;
            this.showRevertOverride();
            if (0 === a.old.actionIds.length) {
                var c = Ext.get(this.buttonContainer).first("div"),
                    d = c.dom.childNodes;
                0 < d.length && c.dom.removeChild(d[0]);
                this.appendEmptyButtonConfig(c)
            }
            for (c = 0; c < a.old.actionIds.length; c++) this.addButton(c, a.old.actionIds[c]);
            Sfdc.layout.Trough.markItems(this.store, a.old.actionIds, "used");
            c = this.getEl().query(".inheritSettings");
            0 < c.length && Ext.fly(c[0]).removeClass("inheritSettings")
        } else {
            void 0 ===
                a.notFirstCall && (a.notFirstCall = !0, a.old = {}, a.old.actionIds = this.buttons.clone(), a.old.overriding = this.overriding);
            this.overriding = !1;
            this.hideRevertOverride();
            for (c = 0; c < a.old.actionIds.length; c++) this.removeButton(a.old.actionIds[c]);
            Sfdc.layout.Trough.markItems(this.store, a.old.actionIds, "unused");
            0 === a.old.actionIds.length && (c = Ext.get(this.buttonContainer).first("div"), c.dom.removeChild(c.dom.childNodes[0]), this.appendEmptyButtonConfig(c))
        }
        this.fireEvent("countChanged", this, this.getItemCount())
    },
    removeAllButtons: function() {
        if (0 === this.buttons.length) {
            var a = Ext.get(this.buttonContainer).first("div");
            a.dom.removeChild(a.dom.childNodes[0]);
            this.appendEmptyButtonConfig(a)
        }
        for (Sfdc.layout.Trough.markItems(this.store, this.buttons, "unused"); 0 !== this.buttons.length;) this.removeButton(this.buttons[0])
    },
    overrideContent: function() {
        this.handler.perform({
            type: "OverrideContent"
        })
    },
    action_doOverrideContent: function(a, b) {
        var c;
        b ? (this.overriding = !1, this.hideRevertOverride(), this.removeAllButtons()) : (this.overriding = !0, c = this.getEl().query(".inheritSettings"), 0 < c.length && Ext.fly(c[0]).removeClass("inheritSettings"), this.addDefaultButtonsToEmpty(), this.showRevertOverride());
        this.fireEvent("countChanged", this, this.getItemCount())
    },
    getEmptyButtonConfig: function() {
        return this.handler ? {
            tag: "div",
            cls: "inheritSettingsText",
            html: LC.getLabel("PublisherActionsButtons", "inheritSettingsText") + '\x3cdiv class\x3d"summaryHoverGear" title\x3d"' + LC.getLabel("PublisherActionsButtons", "overrideButton") + '"\x3e\x3c/div\x3e'
        } : {
            tag: "div",
            cls: "inheritSettingsText",
            html: LC.getLabel("PublisherActionsButtons", "inheritSettingsTextReadOnly")
        }
    },
    appendEmptyButtonConfig: function(a) {
        if (this.overriding) return a.createChild({
            tag: "div",
            html: LC.getLabel("PublisherActionsButtons", "emptyActionListText")
        });
        var b = a.createChild(this.getEmptyButtonConfig());
        if (this.handler) {
            var c = b.query(".summaryHoverGear")[0];
            Ext.fly(c).on({
                click: this.overrideContent,
                mouseover: function() {
                    Ext.fly(c).addClass("summaryHoverGearOver")
                },
                mouseout: function() {
                    Ext.fly(c).removeClass("summaryHoverGearOver")
                },
                scope: this
            });
            var d = b.query("A")[0];
            Ext.fly(d).on({
                click: this.overrideContent,
                scope: this
            })
        }
        a.parent().addClass("inheritSettings");
        return b
    },
    renderButtonContainer: function() {
        var a = this.getEl(),
            a = a.createChild({
                tag: "div",
                cls: "pbTitle"
            }, a.first());
        a.createChild({
            tag: "h3",
            html: LC.getLabel("PublisherActionsButtons", "PublisherActionsSectionTitle")
        });
        if (!VFEditor.isGlobalLayout) {
            var a = a.createChild({
                    tag: "div",
                    cls: "mouseOverInfoOuter",
                    onmouseover: "addMouseOver(this)",
                    onfocus: "addMouseOver(this)",
                    html: '\x3cimg id\x3d"publisherActionsInfoIcon" src\x3d"/s.gif" class\x3d"infoIcon"/\x3e'
                }),
                b;
            b = VFEditor.isChatterEnabled ? VFEditor.isMDPEnabled ? VFEditor.isFeedTrackingEnabled ? LC.getLabel("PublisherActionsButtons", "PublisherActionsHelpChatterEnabledMDPEnabledFeedTrackingEnabled") : LC.getLabel("PublisherActionsButtons", "PublisherActionsHelpChatterEnabledMDPEnabledFeedTrackingDisabled") : LC.getLabel("PublisherActionsButtons", "PublisherActionsHelpChatterEnabledMDPDisabled") : LC.getLabel("PublisherActionsButtons", "PublisherActionsHelpChatterDisabled");
            a.createChild({
                id: "publisherActionsInfo",
                tag: "div",
                cls: "mouseOverInfo",
                html: b
            })
        }
        Sfdc.layout.QuickActionSection.superclass.renderButtonContainer.apply(this, arguments);
        this.handler && (a = this.getEl().query("fieldset")[0], null !== a && Ext.fly(a).addClassOnOver("hover"), layoutData.quickActions && this.showRevertOverride(), Ext.fly(a).replaceClass(window.dragDropMap.CustomButton, window.dragDropMap.QuickAction))
    },
    getItemCount: function() {
        return this.overriding ? Sfdc.layout.QuickActionSection.superclass.getItemCount.call(this) : 0
    },
    save: function() {
        return Ext.apply(Sfdc.layout.QuickActionSection.superclass.save.apply(this,
            arguments), {
            overriding: this.overriding
        })
    }
});
Sfdc.layout.ButtonSection = function(a, b) {
    Ext.applyIf(b, {
        stdButtons: [],
        handler: a,
        sectionId: Sfdc.layout.ButtonSection.SECTION_ID,
        dragZoneCtor: Sfdc.layout.ButtonDragZone
    });
    Sfdc.layout.ButtonSection.superclass.constructor.apply(this, arguments);
    this.stdButtons = b.stdButtons;
    this.stdButtonsRevoked = {}
};
Ext.apply(Sfdc.layout.ButtonSection, {
    SECTION_ID: "__BUTTON",
    isStdButtonId: function(a) {
        return 0 === a.indexOf(NewLayoutEditor.STD_BTN_PREFIX)
    },
    stdButtonTpl: (new Ext.XTemplate('\x3cdiv id\x3d"', Sfdc.layout.Section.ITEM_PREFIX, '{id}" class\x3d"btn stdButton"\x3e{label}\x3c/div\x3e\x26ensp;')).compile()
});
Ext.extend(Sfdc.layout.ButtonSection, Sfdc.layout.AbstractButtonSection, {
    action_doMove: function(a, b) {
        if (!b && Sfdc.layout.ButtonSection.isStdButtonId(a.itemIds[0])) return !0;
        Sfdc.layout.ButtonSection.superclass.action_doMove.apply(this, arguments)
    },
    getDropZone: function() {
        return new Sfdc.layout.ButtonDropZone(this, "button", {
            CustomButton: !0,
            StandardButton: !0
        })
    },
    renderButtonContainer: function() {
        this.stdButtonContainer = Sfdc.layout.AbstractButtonSection.buttonBarTpl.append(this.body, {
            cls: "stdButtons " + window.dragDropMap.StandardButton,
            title: LC.getLabel("LayoutButtons", "StandardButtons")
        });
        var a = !0;
        this._getStoreItems(this.stdButtons).each(function(b) {
            Sfdc.layout.ButtonSection.stdButtonTpl.append(this.stdButtonContainer, b.data);
            b.data.id in this.stdButtonsRevoked ? this._hideStdButton(b.data.id, !1, !1) : a = !1
        }, this);
        a && this.appendEmptyButtonConfig(Ext.get(this.stdButtonContainer));
        Sfdc.layout.ButtonSection.superclass.renderButtonContainer.apply(this, arguments)
    },
    getButtonPos: function(a) {
        return Sfdc.layout.ButtonSection.isStdButtonId(a) ?
            null : Sfdc.layout.ButtonSection.superclass.getButtonPos.apply(this, arguments)
    },
    addButton: function(a, b) {
        if (Sfdc.layout.ButtonSection.isStdButtonId(b)) {
            if (this.rendered) {
                var c = Ext.get(getElementByIdCS(Sfdc.layout.Section.makeElementId(b)));
                this.stdButtons.all(function(a) {
                    return a in this.stdButtonsRevoked
                }, this) && Ext.fly(this.stdButtonContainer).first("span").remove();
                c.show(this.dropZone.animation);
                c.dom.parentNode.insertBefore(document.createTextNode("\u2002"), c.dom.nextSibling)
            }
            delete this.stdButtonsRevoked[b]
        } else Sfdc.layout.ButtonSection.superclass.addButton.apply(this,
            arguments)
    },
    removeButton: function(a) {
        if (Sfdc.layout.ButtonSection.isStdButtonId(a)) return this.stdButtonsRevoked[a] = !0, this.rendered && this._hideStdButton(a, this.dropZone.animation, this.stdButtons.all(function(a) {
            return a in this.stdButtonsRevoked
        }, this)), !1;
        Sfdc.layout.ButtonSection.superclass.removeButton.apply(this, arguments)
    },
    getItemCount: function() {
        for (var a = 0, b = 0; b < this.stdButtons.length; b++) this.stdButtons[b] in this.stdButtonsRevoked || a++;
        return Sfdc.layout.ButtonSection.superclass.getItemCount.call(this) +
            a
    },
    _hideStdButton: function(a, b, c) {
        var d = Ext.get(getElementByIdCS(Sfdc.layout.Section.makeElementId(a)));
        a = function() {
            d.dom.parentNode.removeChild(d.dom.nextSibling)
        };
        var e = b ? {
            callback: a
        } : !1;
        d.setVisibilityMode(Ext.Element.DISPLAY).hide(e);
        b || a();
        c && this.appendEmptyButtonConfig(Ext.get(this.stdButtonContainer))
    },
    save: function() {
        var a = [],
            b;
        for (b in this.stdButtonsRevoked) this.stdButtonsRevoked.hasOwnProperty(b) && a.push(b);
        b = Sfdc.layout.ButtonSection.superclass.save.apply(this, arguments);
        Ext.apply(b, {
            buttonsRevoked: a
        });
        return b
    }
});
Sfdc.layout.LayoutDropZone = function(a) {
    this.layout = a
};
Ext.extend(Sfdc.layout.LayoutDropZone, Sfdc.dd.ContainerDropZone, {
    getTargetFromEvent: function(a) {
        var b = a.getTarget(".section");
        if (b) return this.getTargetFromItem(b.id, Ext.lib.Event.getPageY(a))
    },
    getContainer: function() {
        return this.layout
    },
    mark: function(a) {
        a.below ? a.below.addClass("marked") : Ext.isEmpty(a.columnHead) || this.layout.getComponent(0).addClass("markedAbove")
    },
    unmark: function(a) {
        a.below ? a.below.removeClass("marked") : Ext.isEmpty(a.columnHead) || this.layout.getComponent(0).removeClass("markedAbove")
    },
    onNodeEnter: function(a, b, c, d) {
        this.mark(a)
    },
    onNodeOut: function(a, b, c, d) {
        this.unmark(a)
    },
    onNodeOver: function(a, b, c, d) {
        return this.dropAllowed
    },
    onNodeDrop: function(a, b, c, d) {
        b = {
            sectionId: d.sectionId
        };
        if ("trough" == d.source) b.type = "AddSection";
        else if ("layout" == d.source) b.type = "MoveSection";
        else return !1;
        a.below ? this.layout.addLayoutData(b, a.below.id) : a.columnHead && this.layout.addLayoutData(b, !1);
        return "AddSection" == b.type ? (this.layout.showSectionProps(null, b), !0) : this.layout.handler.perform(b)
    }
});
Sfdc.layout.Layout = function(a, b) {
    Ext.applyIf(b, {
        baseCls: "layout"
    });
    Sfdc.layout.Layout.superclass.constructor.call(this, a, b);
    this.winSectionProps = new(b.winSectionPropsWindow || Sfdc.layout.SectionPropertiesWindow)({
        store: this.store
    }, this.sectionPropsOK, this);
    this.winControlProps = new Sfdc.layout.ControlPropertiesWindow({
        store: this.store,
        handler: this.handler
    });
    this.winFieldProps = new Sfdc.layout.FieldPropertiesWindow({
        store: this.store,
        handler: this.handler
    });
    this.winAnalyticsProps = new Sfdc.layout.AnalyticsPropertiesWindow({
        store: this.store,
        handler: this.handler
    })
};
Ext.apply(Sfdc.layout.Layout, {
    isLayoutNameTooLong: function(a) {
        return a.length > this.LAYOUT_NAME_MAX
    },
    moveFieldInLayout: function(a, b, c, d) {
        if (!window.dragDropMap || !(0 > window.dragDropMap.StandardField.indexOf(a.sectionData.sectionType) && 0 > window.dragDropMap.CustomLink.indexOf(a.sectionData.sectionType)))
            if (b)
                for (h in c || (d.clearSelection(), b = d.getSectionComponent(a.sectionData.sectionId), b.removeItems(a.itemIds)), a = a.sectionData.old, a) {
                    if (a.hasOwnProperty(h)) {
                        var f = a[h];
                        c = f.pluck("data");
                        b = "canvas" ===
                            d.xtype ? d : d.findParentByType("canvas");
                        b = b.bodyPanel.getSectionComponent(h);
                        for (var e = b.makeEntries(c), g = c.length - 1; 0 <= g; g--) b.put([c[g]], f[g], [e[g]]);
                        c.pluck("id").each(b.select, b)
                    }
                } else {
                    if (1 == a.itemIds.length && a.sectionData.sectionId in a.sectionData.selection && d.getSectionComponent(a.sectionData.sectionId).checkForSelfMove(a)) return !0;
                    d.clearSelection();
                    a.sectionData.old || (a.sectionData.old = {});
                    c = [];
                    var h, e = a.sectionData.selection;
                    for (h in e) e.hasOwnProperty(h) && (b = "canvas" === d.xtype ? d : d.findParentByType("canvas"),
                        b = b.bodyPanel.getSectionComponent(h), b.saveOldPositionAndRemove(a, e[h]), c = c.concat(a.sectionData.old[h]));
                    c = c.pluck("data");
                    b = d.getSectionComponent(a.sectionData.sectionId);
                    c = c.select(b.verifyCategory, b);
                    if (0 === c.length) return d.action_doMove(a, !0, !0), !0;
                    var e = b.makeEntries(c);
                    b.put(c, a.sectionData, e);
                    c.pluck("id").each(b.select, b)
                }
    },
    removeFieldInLayout: function(a, b, c) {
        if (!window.dragDropMap || !(0 > window.dragDropMap.StandardField.indexOf(a.sectionData.sectionType) && 0 > window.dragDropMap.CustomLink.indexOf(a.sectionData.sectionType)))
            if (b)
                for (e in c.clearSelection(),
                    b = a.sectionData.old, b) b.hasOwnProperty(e) && "summaryLayout" != e && c.getSectionComponent(e).undoRemove(a);
            else {
                b = {};
                var d = 0,
                    f = a.sectionData.selection,
                    e;
                for (e in f)
                    if (f.hasOwnProperty(e)) {
                        var g = c.getSectionComponent(e).filterForRemove(f[e]);
                        0 < g.length && (b[e] = g, d += g.length)
                    } if (0 === d) return !0;
                c.clearSelection();
                for (e in b) b.hasOwnProperty(e) && c.getSectionComponent(e).saveOldPositionAndRemove(a, b[e])
            }
    }
});
Ext.extend(Sfdc.layout.Layout, Sfdc.layout.SectionWrapper, {
    initComponent: function() {
        Sfdc.layout.SectionWrapper.superclass.initComponent.apply(this, arguments);
        this.addEvents({
            updatetags: !0
        });
        this.on({
            add: this.onSectionAdd,
            remove: this.onSectionRemove,
            scope: this
        })
    },
    onRender: function() {
        Sfdc.layout.Layout.superclass.onRender.apply(this, arguments);
        this.handler && this.canDragAndDrop() && (this.dropZone = new this.layoutDropZoneConstructor(this), Sfdc.layout.SectionWrapper.initializeLayoutDragZone(this), window.dragDropMap &&
            (window.dragDropMap[Sfdc.layout.Trough.SECTION_ID] = ["canvasDrop"], this.dropZone.layout.body.addClass("canvasDrop")));
        this.renderButtonSections()
    },
    renderButtonSections: function() {
        this.quickActionSection && this.quickActionSection.render(this.getEl(), 0);
        var a = Ext.get(this.headerBlock).child(".pbButtons");
        this.buttonSection && this.buttonSection.render(a)
    },
    canDragAndDrop: function() {
        return !0
    },
    action_doRemove: function(a, b) {
        return Sfdc.layout.Layout.removeFieldInLayout(a, b, this)
    },
    action_doMove: function(a, b,
        c) {
        return Sfdc.layout.Layout.moveFieldInLayout(a, b, c, this)
    },
    addLayoutData: function(a, b) {
        a.layoutData || (a.layoutData = {}, a.layoutData.insertAt = !1 !== b ? this.getSectionPosition(b) + 1 : 0, window.dragDropMap && window.dragDropMap.StandardField && (a.layoutData.className = window.dragDropMap.StandardField))
    },
    save: function() {
        var a = {
            sections: [],
            layoutName: this.name,
            taggingInfo: this.taggingInfo,
            specialOptions: {}
        };
        this.specialOptions.each(function(b) {
            a.specialOptions[b.id] = b.value
        });
        this.items.each(function(b) {
            b.save &&
                a.sections.push(b.save())
        }, this);
        this.buttonSection.save && Ext.apply(a, this.buttonSection.save());
        return a
    },
    saveQuickActions: function() {
        return this.quickActionSection && this.quickActionSection.save ? this.quickActionSection.save() : null
    },
    load: function(a) {
        if ("Outlook" === VFEditor.layoutType)
            for (var b = a.quickActions.length - 1; 0 <= b; b--) a.quickActions[b].actionType && a.quickActions.splice(b, 1);
        b = this.store.query("category", "StandardButton");
        b.sort("ASC", function(a, b) {
            return a.data.btnOrder - b.data.btnOrder
        });
        var c = [];
        b.eachKey(function(a, b) {
            c.push(a)
        });
        this.buttonSection = a.isUserLayout || !VFEditor.showButtonsSection ? new Sfdc.layout.PlaceholderSection({
            id: Ext.id()
        }) : new Sfdc.layout.ButtonSection(this.handler, {
            store: this.store,
            stdButtons: c,
            id: Sfdc.layout.ButtonSection.SECTION_ID
        });
        VFEditor.showQuickActionSection ? (this.quickActionSection = new Sfdc.layout.QuickActionSection(this.handler, {
            store: this.store,
            id: Sfdc.layout.QuickActionSection.SECTION_ID
        }), this.quickActionSection.load(a.quickActions), this.quickActionSection.on("countChanged",
            this.onCountChanged, this)) : this.quickActionSection = new Sfdc.layout.PlaceholderSection({
            id: Ext.id()
        });
        if (a.buttonsAdded) {
            for (var d = this.store.getItems(a.buttonsAdded), f = [], e = 0; e < a.buttonsAdded.length; e++) d[e] && f.push(a.buttonsAdded[e]);
            Sfdc.layout.Trough.markItems(this.store, f, "used");
            for (e = 0; e < f.length; e++) this.buttonSection.addButton(e, f[e])
        }
        if (a.buttonsRevoked)
            for (e = 0; e < a.buttonsRevoked.length; e++) b.removeKey(a.buttonsRevoked[e]), this.buttonSection.removeButton(a.buttonsRevoked[e]);
        this.store.suspendEvents();
        b.each(function(a, b, c) {
            a.data.state = "used"
        });
        this.store.resumeEvents();
        this.store.fireEvent("datachanged");
        this.taggingInfo = a.taggingInfo;
        this.specialOptions = a.specialOptions || [];
        this.showClearUserLists = a.showClearUserLists;
        this.clearUserLists = !1;
        this.namespacePrefix = a.namespacePrefix;
        this.layoutPackageLink = a.layoutPackageLink;
        this.rendered && this.renderButtonsSections();
        this.loadSections(a);
        a.otherLayoutUrlTpl && (Sfdc.layout.OtherLayoutMenuItem.urlTpl = (new Ext.Template(a.otherLayoutUrlTpl)).compile());
        b = a.otherLayouts && 1 < a.otherLayouts.length;
        !b && Sfdc.layout.Layout.isLayoutNameTooLong(a.layoutName) && (a.otherLayouts = [this], b = !0, a.otherLayouts[0].name = a.layoutName);
        if (this.handler && (b || VFEditor.showBackToListLink)) {
            var g = new Ext.ux.ScrollMenu({
                cls: "simpleMenu otherLayoutsMenu",
                MaxHeight: 360
            });
            b && (a.otherLayouts.each(function(a) {
                g.add(new Sfdc.layout.OtherLayoutMenuItem(a, a.id == VFEditor.layoutId))
            }), g.addSeparator());
            VFEditor.showBackToListLink && g.add(new Ext.menu.Item({
                text: VFEditor.labelMap.backToLayoutLabel,
                handler: VFEditor.confirmLeave.curry("layoutList", !1)
            }));
            b = new Ext.Button({
                text: Sfdc.layout.SectionWrapper.getLayoutNameForDisplay(a.layoutName),
                menu: g,
                id: "otherLayoutsBtn"
            });
            b.autoWidth = function() {
                if (this.el) {
                    this.el.setWidth("auto");
                    if (Ext.isIE7 && Ext.isStrict) {
                        var a = this.el.child(this.buttonSelector);
                        a && 20 < a.getWidth() && a.setWidth(a.getWidth())
                    }
                    this.minWidth && this.el.getWidth() < this.minWidth && this.el.setWidth(this.minWidth)
                }
            };
            Ext.fly("layoutName").update("");
            b.render("layoutName");
            this.layoutNameEditable =
                a.layoutNameEditable
        }
        this.setTitle(a.layoutTitle);
        this.setName(a.layoutName)
    },
    getNewSection: function(a) {
        return this.getNewAndLoadSectionConstructor(null)(this.handler, this.store, a)
    },
    loadSections: function (a) {
        a.sections.each(function(a) {
            this.add(this.getNewSection(a))
        }, this)
    },
    acceptMessage: function(a) {
        switch (a.type) {
            case "AddSection":
            case "MoveSection":
            case "RemoveSection":
            case "SetLayoutProperties":
            case "ClearSelection":
                return !0;
            case "Move":
                return a.sectionData && !this.isButtonSectionId(a.sectionData.sectionId);
            case "Remove":
                return a.sectionData && a.sectionData.selection && !(Sfdc.layout.ButtonSection.SECTION_ID in a.sectionData.selection || Sfdc.layout.QuickActionSection.SECTION_ID in a.sectionData.selection);
            default:
                return !1
        }
    },
    action_doAddSection: function(a, b) {
        if (b) {
            var c = this.getComponent(a.layoutData.insertAt);
            this.remove(c)
        } else {
            if (0 === a.layoutData.insertAt && this.getComponent(0).isFixedSection()) return !0;
            if (!a.sectionId) {
                do c = "section" + Sfdc.layout.SectionWrapper.newSectionId, Sfdc.layout.SectionWrapper.newSectionId +=
                    1; while (this.getComponent(c));
                a.sectionId = c
            }
            a.canChangeColumns = !0;
            a.canDeleteSection = !0;
            c = this.getNewAndLoadSectionConstructor(a)(this.handler, this.store, a);
            c.addClass(a.layoutData.className);
            this.insert(a.layoutData.insertAt, c)
        }
        this.doLayout()
    },
    action_doMoveSection: function(a, b) {
        if (b) {
            var c = a.layoutData.insertAt;
            c > a.layoutData.old.insertAt && c--;
            d = this.getComponent(c);
            f = d.save();
            this.remove(d);
            this.insert(a.layoutData.old.insertAt, this.getNewAndLoadSectionConstructor(a)(this.handler, this.store, f))
        } else {
            c =
                this.getSectionPosition(a.sectionId);
            if (a.layoutData.insertAt == c || a.layoutData.insertAt == c + 1) return !0;
            var d = this.getComponent(c);
            if (d.isFixedSection() || 0 === a.layoutData.insertAt && this.getComponent(0).isFixedSection()) return !0;
            a.layoutData.old = {
                insertAt: c
            };
            var f = d.save();
            this.remove(d);
            d = a.layoutData.insertAt;
            d > c && d--;
            this.insert(d, this.getNewAndLoadSectionConstructor(a)(this.handler, this.store, f))
        }
        this.doLayout()
    },
    action_doRemoveSection: function(a, b) {
        if (b) {
            var c = this.getNewAndLoadSectionConstructor(a)(this.handler,
                this.store, a.sectionData.old);
            this.insert(a.layoutData.old.insertAt, c);
            this.data.summaryLayout && (d = Ext.getCmp(Ext.DomQuery.selectNode("div.summaryLayout").id), d.action_doRemove(a, b));
            this.doLayout()
        } else {
            if (1 == this.items.getCount()) return !0;
            c = this.findById(a.sectionId);
            if (!c.mayRemove() || c.nameReadonly && !confirm(LC.getLabel("LayoutDND", "confirmDeleteOriginalSectionPrompt1") + "\n" + LC.getLabel("LayoutDND", "confirmDeleteOriginalSectionPrompt2") + "\n\n" + LC.getLabel("LayoutDND", "confirmDeleteOriginalSectionPrompt3") +
                    "\n" + LC.getLabel("LayoutDND", "confirmDeleteOriginalSectionPrompt4") + "\n\n" + LC.getLabel("Global", "are_you_sure"))) return !0;
            a.sectionData || (a.sectionData = {});
            var d = null,
                f = [];
            if (this.data.summaryLayout) {
                var d = Ext.getCmp(Ext.DomQuery.selectNode("div.summaryLayout").id),
                    e;
                for (e in c.itemsById) c.itemsById.hasOwnProperty(e) && f.push(e);
                if (d.confirmRemoveSummaryLayoutField(f)) return !0
            }
            a.sectionData.old = c.save(!0);
            a.layoutData || (a.layoutData = {});
            a.layoutData.old = {
                insertAt: this.getSectionPosition(a.sectionId)
            };
            null !== d && (a.itemIds = f, d.action_doRemove(a, b));
            c.getEl().fadeOut({
                remove: !0,
                callback: c.destroy,
                scope: c
            });
            this.remove(c, !1)
        }
    },
    action_doSetLayoutProperties: function(a, b) {
        if (b) a.old.name && this.setName(a.old.name), this.taggingInfo && (d = !1, Ext.isEmpty(a.old.privateTags) || (d = !0, this.taggingInfo.hasPrivate = a.old.privateTags), Ext.isEmpty(a.old.publicTags) || (d = !0, this.taggingInfo.hasPublic = a.old.publicTags), d && this.fireEvent("updatetags", this, this.taggingInfo)), this.specialOptions && this.specialOptions.each(function(b) {
            Ext.isEmpty(a.old[b.id]) ||
                (b.value = a.old[b.id])
        });
        else {
            var c = !1;
            a.old = {};
            !Ext.isEmpty(a.name) && a.name != this.name && (c = !0, a.old.name = this.name, this.setName(a.name));
            if (this.taggingInfo) {
                var d = !1;
                Boolean(a.publicTags) != Boolean(this.taggingInfo.hasPublic) && (d = c = !0, a.old.publicTags = !!this.taggingInfo.hasPublic, this.taggingInfo.hasPublic = !!a.publicTags);
                Boolean(a.privateTags) != Boolean(this.taggingInfo.hasPrivate) && (d = c = !0, a.old.privateTags = !!this.taggingInfo.hasPrivate, this.taggingInfo.hasPrivate = !!a.privateTags);
                d && this.fireEvent("updatetags",
                    this, this.taggingInfo)
            }
            this.specialOptions && this.specialOptions.each(function(b) {
                Boolean(a[b.id]) != b.value && (c = !0, a.old[b.id] = b.value, b.value = Boolean(a[b.id]))
            });
            if (!c) return !0
        }
    }
});
Sfdc.layout.RelatedContentWrapper = function(a, b) {
    Sfdc.layout.RelatedContentWrapper.superclass.constructor.call(this, a, b)
};
Ext.apply(Sfdc.layout.RelatedContentWrapper, {
    moveFieldInLayout: function(a, b, c, e) {
        if (!(window.dragDropMap && 0 > a.sectionData.sectionType.indexOf(window.dragDropMap.RelatedLookup)))
            if (b)
                for (f in c || (e.clearSelection(), b = e.getSectionComponent(a.sectionData.sectionId), b.removeItems(a.itemIds)), a = a.sectionData.old, a) {
                    if (a.hasOwnProperty(f)) {
                        var h = a[f];
                        c = h.pluck("data");
                        b = e.findParentByType("canvas").bodyPanel.getSectionComponent(f);
                        for (var d = b.makeEntries(c), g = c.length - 1; 0 <= g; g--) b.put([c[g]], h[g], [d[g]]);
                        c.pluck("id").each(b.select, b)
                    }
                } else {
                    if (1 == a.itemIds.length && a.sectionData.sectionId in a.sectionData.selection && e.getSectionComponent(a.sectionData.sectionId).checkForSelfMove(a)) return !0;
                    e.clearSelection();
                    a.sectionData.old || (a.sectionData.old = {});
                    c = [];
                    var f, d = a.sectionData.selection;
                    for (f in d) d.hasOwnProperty(f) && (b = e.findParentByType("canvas").bodyPanel.getSectionComponent(f), b.saveOldPositionAndRemove(a, d[f]), c = c.concat(a.sectionData.old[f]));
                    c = c.pluck("data");
                    b = e.getSectionComponent(a.sectionData.sectionId);
                    c = c.select(b.verifyCategory, b);
                    if (0 === c.length) return e.action_doMove(a, !0, !0), !0;
                    var d = b.makeEntries(c);
                    b.put(c, a.sectionData, d);
                    c.pluck("id").each(b.select, b)
                }
    },
    removeFieldInLayout: function(a, b, c) {
        if (!(window.dragDropMap && 0 > a.sectionData.sectionType.indexOf(window.dragDropMap.RelatedLookup)))
            if (b)
                for (d in c.clearSelection(), b = a.sectionData.old, b) b.hasOwnProperty(d) && "summaryLayout" != d && c.getSectionComponent(d).undoRemove(a);
            else {
                b = {};
                var e = 0,
                    h = a.sectionData.selection,
                    d;
                for (d in h)
                    if (h.hasOwnProperty(d)) {
                        var g =
                            c.getSectionComponent(d).filterForRemove(h[d]);
                        0 < g.length && (b[d] = g, e += g.length)
                    } if (0 === e) return !0;
                c.clearSelection();
                for (d in b) b.hasOwnProperty(d) && c.getSectionComponent(d).saveOldPositionAndRemove(a, b[d])
            }
    }
});
Ext.extend(Sfdc.layout.RelatedContentWrapper, Sfdc.layout.SectionWrapper, {
    initComponent: function() {
        Sfdc.layout.RelatedContentWrapper.superclass.initComponent.apply(this, arguments);
        this.addEvents({
            updatetags: !0
        });
        this.on({
            add: this.onSectionAdd,
            remove: this.onSectionRemove,
            scope: this
        })
    },
    canDragAndDrop: function() {
        return !1
    },
    action_doRemove: function(a, b) {
        return Sfdc.layout.RelatedContentWrapper.removeFieldInLayout(a, b, this)
    },
    action_doMove: function(a, b, c) {
        return Sfdc.layout.RelatedContentWrapper.moveFieldInLayout(a,
            b, c, this)
    },
    save: function() {
        if (this.relatedContentSection && this.relatedContentSection.save) return this.relatedContentSection.save()
    },
    load: function(a) {
        this.relatedContentSection = new Sfdc.layout.RelatedContentSection(this.handler, Sfdc.layout.RelatedContentSection.getNewConfig(this.store, a));
        this.relatedContentSection.load(a);
        this.add(this.relatedContentSection);
        a = '\x3cdiv class\x3d"mouseOverInfoOuter" onfocus\x3d"addMouseOver(this)"onmouseover\x3d"addMouseOver(this)" tabindex\x3d"0"\x3e\x3cimg src\x3d"/s.gif" alt\x3d"" class\x3d"infoIcon"title\x3d""\x3e\x3cdiv class\x3d"mouseOverInfo" style\x3d"display: none;;left: -23px;"\x3e' +
            LC.getLabel("LayoutSection", "RelatedContentMouseOverInfo") + "\x3c/div\x3e\x3c/div\x3e";
        this.setTitle(LC.getLabel("LayoutSection", "RelatedContent") + " " + LC.getLabel("LayoutSection", "RelatedContentParen") + " " + a);
        this.addClass("relatedContentWrapper")
    },
    acceptMessage: function(a) {
        switch (a.type) {
            case "ClearSelection":
                return !0;
            case "Move":
                return a.sectionData && !this.isButtonSectionId(a.sectionData.sectionId);
            case "Remove":
                return a.sectionData && a.sectionData.selection && !(Sfdc.layout.ButtonSection.SECTION_ID in
                    a.sectionData.selection || Sfdc.layout.QuickActionSection.SECTION_ID in a.sectionData.selection);
            default:
                return !1
        }
    },
    onSectionEntryMouseDown: function(a, b, c) {
        this.items && 0 === this.items.length || Sfdc.layout.RelatedContentWrapper.superclass.onSectionEntryMouseDown.apply(this, arguments)
    }
});
Sfdc.layout.RelatedContentSection = function(a, b) {
    Ext.applyIf(b, {
        handler: a,
        sectionId: Sfdc.layout.RelatedContentSection.SECTION_ID,
        titleLabel: LC.getLabel("LayoutSection", "RelatedContent"),
        cls: "section relatedContent " + window.dragDropMap.RelatedLookup
    });
    Sfdc.layout.RelatedContentSection.superclass.constructor.call(this, a, b)
};
Ext.apply(Sfdc.layout.RelatedContentSection, {
    SECTION_ID: "__RELATED_CONTENT",
    RELATED_LOOKUP_DEFAULT_HEIGHT: 30,
    idPrefix: "RLo__",
    source: "relatedContent",
    getNewConfig: function(a, b) {
        return {
            store: a,
            id: b.sectionId,
            columns: b.columns ? b.columns.length : b.numColumns,
            cls: b.className,
            categoriesAllowed: b.categoriesAllowed
        }
    }
});
Ext.extend(Sfdc.layout.RelatedContentSection, Sfdc.layout.FieldSection, {
    header: !1,
    onRender: function() {
        Sfdc.layout.RelatedContentSection.superclass.onRender.apply(this, arguments);
        this.relatedContentInfoDiv = '\x3cdiv id\x3d"relatedContentInfo" class\x3d"relatedContentInfo"\x3e' + LC.getLabel("LayoutDND", "relatedContentInfo") + "\x3c/div\x3e";
        this.onRCCountChanged(this, this.getItemCount())
    },
    onRCCountChanged: function(a, b) {
        if (0 === b) {
            this.body.addClass("empty");
            var c = Ext.get(this.table).select("td");
            c.removeClass("hover");
            Ext.DomHelper.overwrite(c.el, this.relatedContentInfoDiv)
        } else this.body.removeClass("empty")
    },
    load: function(a) {
        Ext.applyIf(a, {
            className: window.dragDropMap.RelatedLookup[0]
        });
        Sfdc.layout.RelatedContentSection.superclass.load.apply(this, arguments)
    },
    headerMouseOver: Ext.emptyFn,
    headerMouseOut: Ext.emptyFn,
    removeItem: function(a) {
        Sfdc.layout.RelatedContentSection.superclass.removeItem.apply(this, arguments);
        this.onRCCountChanged(this, this.getItemCount())
    },
    put: function(a, b, c, e) {
        Sfdc.layout.RelatedContentSection.superclass.put.apply(this,
            arguments);
        this.onRCCountChanged(this, this.getItemCount())
    },
    isItemAllowed: function(a, b) {
        return b.data.category in this.categoriesAllowed
    }
});

