Ext.ns("Sfdc", "Sfdc.category");
Sfdc.category.PickerTree = function (a, b) {
    Ext.applyIf(a, {
        keys: [{
            key: Ext.EventObject.UP,
            handler: function (a, b) {
                b.stopEvent();
                b.preventDefault();
                this.getSelectionModel().selectPrevious()
            },
            scope: this
        }, {
            key: Ext.EventObject.DOWN,
            handler: function (a, b) {
                b.stopEvent();
                b.preventDefault();
                this.getSelectionModel().selectNext()
            },
            scope: this
        }, {
            key: Ext.EventObject.RIGHT,
            handler: function (a, b) {
                b.preventDefault();
                var d = this.getSelectionModel().selNode || this.lastSelNode;
                d.hasChildNodes() && !d.isExpanded() && d.expand()
            },
            scope: this
        }, {
            key: Ext.EventObject.LEFT,
            handler: function (a, b) {
                b.preventDefault();
                var d = this.getSelectionModel().selNode || this.lastSelNode;
                d.hasChildNodes() && d.isExpanded() && d.collapse()
            },
            scope: this
        }, {
            key: Ext.EventObject.ENTER,
            handler: function (a, f) {
                b.addCategory()
            },
            scope: this
        }],
        onLoad: function (a) {
            a.processed || (a.processed = !0, -1 != this.selectionsGrid.store.find("categoryId", a.attributes.categoryId, 0, !1, !0) && this.deactivate(a), a.parentNode && a.parentNode.attributes.deactivated && this.deactivate(a), a.getUI().onDblClick =
                function (a) {
                    b.addCategory()
                })
        },
        initComponent: function () {
            Sfdc.category.PickerTree.superclass.initComponent.call(this);
            this.getSelectionModel().onKeyDown = this.getSelectionModel().onKeyDown.createInterceptor(function (a) {
                return !1
            })
        },
        getShortPath: function (a, b) {
            for (var d = a.parentNode, g = 1, e = ""; d.parentNode && g < b; ) e = d.text + " \x3e " + e, d = d.parentNode, g++;
            d.parentNode && (e = LC.getLabel("Sidebar", "ellipses") + " \x3e " + e);
            return e
        },
        highlight: function (a, b) {
            Ext.fly(a.ui.getAnchor()) && (b ? Ext.fly(a.ui.getAnchor()).up("div.x-tree-node-el").addClass("highlight") :
                Ext.fly(a.ui.getAnchor()).up("div.x-tree-node-el").removeClass("highlight"))
        },
        greyout: function (a, b) {
            Ext.fly(a.ui.getAnchor()) && (b ? Ext.fly(a.ui.getAnchor()).addClass("deactivated") : Ext.fly(a.ui.getAnchor()).removeClass("deactivated"))
        }
    });
    Sfdc.category.PickerTree.superclass.constructor.call(this, a)
};
Ext.extend(Sfdc.category.PickerTree, Ext.tree.TreePanel);
Sfdc.category.Picker = function (a, b) {
    this.rightToolbar = new Ext.Toolbar({
        items: [{
            xtype: "tbfill"
        }, new Sfdc.category.ActionLink(LC.getLabel("DataCategoryUI", "expand"), function () {
            this.categoryTree.expandAll()
        }, this), {
            xtype: "tbseparator"
        }, new Sfdc.category.ActionLink(LC.getLabel("DataCategoryUI", "collapse"), function () {
            this.categoryTree.collapseAll()
        }, this)]
    });
    this.categoryTree = new Sfdc.category.PickerTree({
        pathSeparator: " \x3e ",
        cls: "categoryTree",
        id: "pickerTree",
        autoScroll: !0,
        title: LC.getLabel("CategoryPicker", "all_categories"),
        columnWidth: 0.425,
        height: a,
        readonly: !0,
        tbar: this.rightToolbar,
        root: new Ext.tree.TreeNode,
        rootVisible: !1,
        loader: new Sfdc.category.TreeLoader(this),
        listeners: {
            beforeexpandnode: function (a) {
                a.ui.beforeLoad()
            },
            expandnode: function (a) {
                a.ui.afterLoad()
            }
        }
    }, this);
    this.selectionsGrid = new Ext.grid.GridPanel({
        cls: "selectionsGrid",
        id: "pickerSelections",
        title: LC.getLabel("CategoryPicker", "selected_categories"),
        columnWidth: 0.425,
        height: a,
        viewConfig: {
            scrollOffset: 0,
            forceFit: !0
        },
        sm: new Ext.grid.RowSelectionModel({
            singleSelect: !0
        }),
        columns: [{
            header: "CategoryLabel",
            dataIndex: "fullLabel"
        }],
        keys: [{
            key: Ext.EventObject.ENTER,
            handler: function (a, b) {
                this.removeCategory()
            },
            scope: this
        }],
        listeners: {
            render: function (a) {
                a.getView().el.select(".x-grid3-header").setStyle("display", "none")
            }
        },
        store: new Ext.data.Store({
            reader: new Ext.data.JsonReader({}, ["fullLabel", "categoryId", "id"])
        })
    });
    b.inline || Ext.apply(b, {
        buttons: [{
            text: LC.getLabel("Buttons", "ok"),
            handler: function () {
                window.opener.pickerSelect && window.opener.pickerSelect(this.categoryGroupId,
                    this.getSelectionsById());
                window.close()
            },
            scope: this
        }, {
            text: LC.getLabel("Buttons", "cancel"),
            handler: function () {
                window.opener.pickerSelect && window.opener.pickerSelect(this.categoryGroupId, Ext.util.JSON.encode(this.origSelections));
                window.close()
            },
            scope: this
        }],
        buttonAlign: "center"
    });
    centerButtonsWidth = 0.14;
    Ext.apply(b, {
        layout: "column",
        border: !1,
        cls: "x-theme-aloha-esque pickerCt",
        origSelections: [],
        items: [{
            columnWidth: 0.425,
            items: this.categoryTree
        }, {
            cls: Ext.isIE7 && b.inline ? "buttonsCtIE7" : Ext.isIE6 && b.inline ?  "buttonsCtIE6" : "buttonsCt",
            border: !1,
            id: "pickerButtons",
            defaults: {
                xtype: "button"
            },
            items: [{
                text: LC.getLabel("DataCategoryUI", "add") + " \x3e",
                disabled: !0,
                id: "addCategory",
                handler: this.addCategory,
                scope: this
            }, {
                text: "\x3c " + LC.getLabel("Buttons", "remove"),
                disabled: !0,
                id: "removeCategory",
                handler: this.removeCategory,
                scope: this
            }],
            columnWidth: (Ext.isIE7 || Ext.isIE6) && b.inline ? 0.12 : centerButtonsWidth
        }, {
            columnWidth: 0.425,
            items: this.selectionsGrid
        }]
    });
    Sfdc.category.Picker.superclass.constructor.call(this, b);
    Ext.getCmp("addCategory").on("render",
        function (a) {
            this.addToolTip = new Ext.ToolTip({
                html: LC.getLabel("CategoryPicker", "max_category_hover", this.selectionLimit),
                target: Ext.getCmp("addCategory").getEl(),
                disabled: !0
            })
        }, this)
};
Ext.extend(Sfdc.category.Picker, Ext.Panel, {
    initComponent: function () {
        Sfdc.category.Picker.superclass.initComponent.call(this);
        this.categoryTree.addEvents("categorySelect");
        this.categoryTree.addEvents("categoryUnselect");
        this.categoryTree.getSelectionModel().on("beforeselect", function (a, b, c) {
            if (b.attributes.deactivated) return !1;
            if (null !== c)
                for (a = c.parentNode; null !== a; a = a.parentNode) a.ui.removeClass("lighterBlue");
            for (a = b.parentNode; null !== a; a = a.parentNode) a.ui.addClass("lighterBlue");
            this.selectionLimit && this.selectionsGrid.getStore().getCount() >= this.selectionLimit ? (Ext.getCmp("addCategory").disable(), this.addToolTip.enable()) : Ext.getCmp("addCategory").enable();
            Ext.fly(b.ui.getAnchor()).focus()
        }, this);
        this.categoryTree.on("categorySelect", function (a) {
            a.redundantSelections = [];
            this.deactivate(a);
            for (var b = 0; b < this.selectionsGrid.getStore().getCount(); b++) {
                var c = this.selectionsGrid.getStore().getAt(b);
                this.categoryTree.getNodeById(c.data.id).isAncestor(a) && a.redundantSelections.push({
                    index: b,
                    record: c
                })
            }
            for (b = a.parentNode; null !== b; b = b.parentNode) b.ui.removeClass("lighterBlue");
            for (b = 0; b < a.redundantSelections.length; b++) Ext.fly(this.selectionsGrid.view.getRow(a.redundantSelections[b].index)).ghost("t", {
                duration: 0.75,
                remove: !0,
                concurrent: !0
            });
            for (b = 0; b < a.redundantSelections.length; b++) this.selectionsGrid.store.remove(a.redundantSelections[b].record);
            a.redundantSelections = []
        }, this);
        this.categoryTree.on("categoryUnselect", function (a) {
            this.activate(a)
        }, this);
        this.selectionsGrid.store.on("add", function () {
            if (this.selectionLimit &&
                this.selectionsGrid.getStore().getCount() >= this.selectionLimit) {
                Ext.fly(this.errMsg).show();
                var a = Ext.getBody().getViewSize().height;
                this.setElementsHeight(a - 110)
            }
        }, this);
        this.selectionsGrid.store.on("remove", function () {
            if (Ext.fly(this.errMsg).isVisible()) {
                Ext.fly(this.errMsg).hide();
                var a = Ext.getBody().getViewSize().height;
                this.setHeight(a);
                this.setElementsHeight(a - 50)
            }
        }, this);
        this.selectionsGrid.getSelectionModel().on("rowselect", function (a, b, c) {
            Ext.getCmp("removeCategory").enable();
            a = this.categoryTree.getNodeById(c.data.id);
            this.categoryTree.highlight(a, !0)
        }, this);
        this.selectionsGrid.getSelectionModel().on("rowdeselect", function (a, b, c) {
            a.hasSelection() || Ext.getCmp("removeCategory").disable();
            a = this.categoryTree.getNodeById(c.data.id);
            this.categoryTree.highlight(a, !1)
        }, this);
        this.selectionsGrid.on("rowdblclick", function (a, b, c) {
            this.removeCategory()
        }, this)
    },
    deactivate: function (a) {
        a.attributes.deactivated = !0;
        this.categoryTree.greyout(a, !0);
        for (var b = 0; b < a.childNodes.length; b++) this.deactivate(a.childNodes[b])
    },
    activate: function (a) {
        a.attributes.deactivated = !1;
        this.categoryTree.greyout(a, !1);
        this.categoryTree.highlight(a, !1);
        for (var b = 0; b < a.childNodes.length; b++) this.activate(a.childNodes[b])
    },
    setElementsHeight: function (a) {
        this.selectionsGrid.setHeight(a);
        this.categoryTree.setHeight(a)
    },
    categoryRecord: Ext.data.Record.create([{
        name: "fullLabel"
    }, {
        name: "categoryId"
    }, {
        name: "id"
    }]),
    load: function (a) {
        
        var b = this.categoryTree.getRootNode();
        null !== b && b.destroy();
        this.categoryTree.getEl().child("li") && this.categoryTree.getEl().child("li").remove();
        b = new Ext.tree.AsyncTreeNode({
            text: a.text,
            categoryId: a.categoryId,
            children: a.children,
            expanded: !0,
            apiName: a.apiName,
            description: a.description
        });
        this.categoryTree.setRootNode(b);
        this.categoryTree.render();
        b.expandChildNodes()
    },
    loadSelections: function (a) {
        if (a) {
            for (var b = 0; b < a.length; b++) {
                var c = a[b],
                f = new this.categoryRecord({
                    fullLabel: "\x3cspan class\x3d'deactivated'\x3e" + c.shortPath + "\x3c/span\x3e" + c.label,
                    categoryId: c.categoryId,
                    id: c.id
                });
                this.selectionsGrid.store.add(f);
                this.origSelections.push(c.categoryId)
            }
        }
        loadCategoryGroup()
    },
    getSelectionsById: function () {
        for (var a = [], b = 0; b < this.selectionsGrid.store.getCount(); b++) a.push(this.selectionsGrid.store.getAt(b).data.categoryId);
        return Ext.util.JSON.encode(a)
    },
    addCategory: function () {
        var a = this.categoryTree.getSelectionModel().getSelectedNode();
        if (a && !(this.selectionLimit && this.selectionsGrid.getStore().getCount() >= this.selectionLimit)) {
            var b = new this.categoryRecord({
                fullLabel: "\x3cspan class\x3d'deactivated'\x3e" + this.categoryTree.getShortPath(a, 2) + "\x3c/span\x3e" + a.text,
                categoryId: a.attributes.categoryId,
                id: a.id
            });
            this.selectionsGrid.store.insert(0, [b]);
            a.unselect();
            this.categoryTree.fireEvent("categorySelect", a);
            Ext.getCmp("addCategory").disable()
        }
    },
    removeCategory: function () {
        this.addToolTip.disable();
        for (var a = this.selectionsGrid.getSelectionModel().getSelections(), b = 0; b < a.length; b++) {
            this.selectionsGrid.store.remove(a[b]);
            var c = this.categoryTree.getNodeById(a[b].data.id);
            this.categoryTree.fireEvent("categoryUnselect", c)
        }
        Ext.getCmp("removeCategory").disable()
    }
});