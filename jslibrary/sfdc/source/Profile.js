﻿function ProfileEditClass(a) {
    this.crudDeleteWarningMsg = a;
    this.isPropagating = !1
}
var ProfileEdit;
ProfileEditClass.prototype.changeAndPropagate = function (a, d) {
    if (a) {
        var e = a.checked != d;
        e && (a.checked = d, 0 === a.id.indexOf("crud") ? ProfileEdit.handleCrudDependencyClick(a, e) : ProfileEdit.handlePermDependencyClick(a))
    }
};
ProfileEditClass.prototype.doDependencies = function (a, d, e) {
    if (a in d) {
        a = d[a];
        for (d = 0; d < a.length; d++) {
            var b = document.getElementById(a[d]);
            b && ProfileEdit.changeAndPropagate(b, e)
        }
    }
};
ProfileEditClass.prototype.handlePermDependencyClick = function (a) {
    a.checked ? ProfileEdit.doDependencies(a.id, permDependencies, !0) : ProfileEdit.doDependencies(a.id, permAntecedents, !1)
};
ProfileEditClass.prototype.handleCrudDependencyClick = function (a, d) {
    var e = 1 < arguments.length ? d : !0,   b;
    a.checked ? (ProfileEdit.doDependencies(a.id, permDependencies, !0), 0 === a.id.indexOf(ProfileEditConstants.CRUD_CREATE) ? (b = a.id.substring(ProfileEditConstants.CRUD_CREATE.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_READ + b), !0)) : 0 === a.id.indexOf(ProfileEditConstants.CRUD_UPDATE) ? (b = a.id.substring(ProfileEditConstants.CRUD_UPDATE.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_READ +
        b), !0)) : 0 === a.id.indexOf(ProfileEditConstants.CRUD_DELETE) ? (b = a.id.substring(ProfileEditConstants.CRUD_DELETE.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_UPDATE + b), !0), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_READ + b), !0)) : 0 === a.id.indexOf(ProfileEditConstants.CRUD_VIEW_ALL) ? (b = a.id.substring(ProfileEditConstants.CRUD_VIEW_ALL.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_READ +
        b), !0)) : 0 === a.id.indexOf(ProfileEditConstants.CRUD_MODIFY_ALL) && (b = a.id.substring(ProfileEditConstants.CRUD_MODIFY_ALL.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_VIEW_ALL + b), !0), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_UPDATE + b), !0), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_DELETE + b), !0), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_READ + b), !0))) : (0 === a.id.indexOf(ProfileEditConstants.CRUD_READ) ? (b = a.id.substring(ProfileEditConstants.CRUD_READ.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_CREATE + b), !1), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_UPDATE + b), !1), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_DELETE + b), !1), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_MODIFY_ALL + b), !1), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_VIEW_ALL +
        b), !1)) : 0 === a.id.indexOf(ProfileEditConstants.CRUD_UPDATE) ? (b = a.id.substring(ProfileEditConstants.CRUD_UPDATE.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_DELETE + b), !1), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_MODIFY_ALL + b), !1)) : 0 === a.id.indexOf(ProfileEditConstants.CRUD_DELETE) ? (b = a.id.substring(ProfileEditConstants.CRUD_DELETE.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_MODIFY_ALL +
        b), !1), b in childrenToParents && e && !this.isPropagating && 0 < childrenToParents[b].length && alert(this.crudDeleteWarningMsg)) : 0 === a.id.indexOf(ProfileEditConstants.CRUD_VIEW_ALL) && (b = a.id.substring(ProfileEditConstants.CRUD_VIEW_ALL.length), ProfileEdit.changeAndPropagate(document.getElementById(ProfileEditConstants.CRUD_MODIFY_ALL + b), !1)), this.isPropagating ? ProfileEdit.doDependencies(a.id, permAntecedents, !1) : (this.isPropagating = !0, ProfileEdit.doDependencies(a.id, permAntecedents, !1), this.isPropagating = !1))
};

function TabSetLimiter(a) {
    function d() {
        for (; c.length > e; ) {
            if (c[0].defaultC.checked) {
                var a = c[1];
                c[1] = c[0];
                c[0] = a
            } (a = c.shift()) || alert("Error: Inconsistent state.");
            a.visibleC.checked = !1
        }
    }
    if (TabSetLimiter.prototype.theTabSetLimiter) return TabSetLimiter.prototype.theTabSetLimiter;
    TabSetLimiter.prototype.theTabSetLimiter = this;
    var e = a,
        b = [],
        c = [];
    this.registerControl = function (a) {
        a && (1 == e && (a.visibleC.disabled = !0), b.push(a), a.visibleC.checked && c.push(a), d())
    };
    this.handleChange = function (a) {
        for (var e = !1, f = 0; f <
            b.length; f++)
            if (b[f] === a) {
                e = !0;
                break
            }
        if (e)
            if (a.visibleC.checked) {
                for (f = 0; f < c.length; f++)
                    if (c[f] === a) return;
                c.push(a);
                d()
            } else
                for (f = 0; f < c.length; f++)
                    if (c[f] === a) {
                        c.splice(f, 1);
                        break
                    }
    }
}

function TabSetControl(a, d, e, b) {
    var c = this;
    this.visibleC = document.getElementById(a);
    this.defaultC = document.getElementById(d);
    if (null === this.visibleC || null === this.defaultC) return !1;
    this.handleDefaultChange = function () {
        if (c.defaultC.checked) {
            c.visibleC.checked = !0;
            c.visibleC.disabled = !0;
            otherDefaults = document.getElementsByName(c.defaultC.name);
            if (!TabSetLimiter.prototype.theTabSetLimiter || 1 < TabSetLimiter.prototype.theTabSetLimiter.limit)
                for (var a = 0; a < otherDefaults.length; a++) otherDefaults[a] != c.defaultC &&
                    (otherDefaults[a].assocCheckbox.disabled = !1);
            TabSetLimiter.prototype.theTabSetLimiter && TabSetLimiter.prototype.theTabSetLimiter.handleChange(c)
        }
    };
    this.handleVisibleChange = function (a) {
        getEventTarget(getEvent(a));
        TabSetLimiter.prototype.theTabSetLimiter.handleChange(c)
    };
    addEvent(c.defaultC, "click", c.handleDefaultChange);
    c.defaultC.assocCheckbox = c.visibleC;
    if (c.defaultC.checked || b) c.visibleC.disabled = !0;
    if (Sfdc.isDefAndNotNull(TabSetLimiter.prototype.theTabSetLimiter) && (e || b)) TabSetLimiter.prototype.theTabSetLimiter.registerControl(c),
        addEvent(c.visibleC, "click", c.handleVisibleChange, !1)
};

function ProfileListFilterColumn(a) {
    ListFilterColumn.call(this, a);
    this.enablePermissionHtml = a[ProfileListInlineEditConstants.ENABLE_PERMISSION];
    this.disablePermissionHtml = a[ProfileListInlineEditConstants.DISABLE_PERMISSION]
}
ProfileListFilterColumn.prototype = new ListFilterColumn(null);

function ProfileListInlineEditData(b) {
    ListInlineEditData.call(this, b)
}
ProfileListInlineEditData.prototype = new ListInlineEditData(null);
ProfileListInlineEditData.prototype.createNewListFilterColumn = function (b) {
    return new ProfileListFilterColumn(b)
};
ProfileListInlineEditData.prototype.getNewDialog = function (b) {
    return new SimpleDialog(b, !0)
};
ProfileListInlineEditData.prototype.openColumn = function (b, c, e) {
    if ((c = this.columns[c]) && c.state == InlineEditState.EDIT) {
        this.currentColumn = c;
        this.currentRow = b;
        c = this.viewport.grid.getSelectionModel().getCount();
        b = this.isMassEditable && 1 < c;
        var a = [];
        a.push("\x3cdiv class\x3d'profileLeftAlignDivA'\x3e" + LC.getLabel("Profile", "ChangeSetting") + "\x3c/div\x3e");
        a.push("\x3cdiv class\x3d'profileFieldTableDiv'\x3e");
        a.push("\x3ctable\x3e\t\t\x3ctr class\x3d'profileFieldRow'\x3e          \x3ctd class\x3d'dataCol' align\x3d'right'\x3e\x3cdiv id\x3d'massEditFieldDiv' class\x3d'profileInlineEditDiv'\x3e\x3c/div\x3e\x3c/td\x3e\t\t   \x3ctd\x3e");
        a.push(this.currentColumn.label);
        a.push("\x3c/td\x3e       \x3c/tr\x3e");
        a.push(" \x3c/table\x3e\x3c/div\x3e");
        a.push("\x3cdiv id\x3d'permissionText'\x3e\x3c/div\x3e");
        b && (a.push("\x3cdiv class\x3d'profileLeftAlignDivB'\x3e" + LC.getLabel("MassListEdit", "EditLabel") + "\x3c/div\x3e"), a.push("\x3cdiv class\x3d'profileFieldTableDiv'\x3e"), a.push("\x3ctable class\x3d'fieldTable'\x3e\x3ctr class\x3d'selectionRow'\x3e"), a.push("\x3ctd class\x3d'dataCol'\x3e"), a.push("\x3cdiv class\x3d'radio'\x3e\x3cinput type\x3d'radio' name\x3d'massOrSingleEdit' id\x3d'singleEditRadio' checked\x3d'checked'\x3e\x3clabel for\x3d'singleEditRadio'\x3e"),
            a.push(LC.getLabel("MassListEdit", "SingleEdit")), a.push("\x3c/label\x3e\x3c/div\x3e\x3cdiv class\x3d'radio'\x3e\x3cinput type\x3d'radio' name\x3d'massOrSingleEdit' id\x3d'massEditRadio'\x3e\x3clabel for\x3d'massEditRadio'\x3e"), a.push(LC.getLabel("MassListEdit", "MultiEdit", c)), a.push("\x3c/label\x3e\x3c/div\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e\x3c/td\x3e\x3c/div\x3e"));
        a.push("\x3cdiv class\x3d'profileRightAlignDiv'\x3e");
        a.push("\x3cdiv class\x3d'inlineEditButtons'\x3e");
        a.push("\x3cinput class\x3d'btn' type\x3d'button' value\x3d'");
        a.push(LC.getLabel("Buttons", "save"));
        a.push("' id\x3d'saveButton'\x3e\x3cinput class\x3d'btn' type\x3d'button'value\x3d'");
        a.push(LC.getLabel("Buttons", "cancel"));
        a.push("' id\x3d'cancelButton'\x3e");
        a.push("\x3c/div\x3e\x3c/div\x3e");
        ListInlineEditData.dialog.setContentInnerHTML(a.join(""));
        ListInlineEditData.dialog.setTitle(LC.getLabel("List", "edit") + " " + this.currentColumn.label);
        ListInlineEditData.dialog.setWidth(580);
        c = document.getElementById("massEditFieldDiv");
        this.currentColumn.createEditElements(c,  b ? null : e);
        var d = this;
        document.getElementById("saveButton").onclick = function () {
            d.save()
        };
        document.getElementById("cancelButton").onclick = function () {
            d.closeColumn()
        };
        document.getElementById(this.currentColumn.columnName).onclick = function () {
            d.updateDialog()
        };
        this.updateDialog()
    }
};
ProfileListInlineEditData.prototype.updateDialog = function () {
    var b = document.getElementById(this.currentColumn.columnName).checked;
    b ? document.getElementById("permissionText").innerHTML = this.currentColumn.enablePermissionHtml : document.getElementById("permissionText").innerHTML = this.currentColumn.disablePermissionHtml;
    if ((b = document.getElementById("ProfileILEWarn" + this.currentColumn.columnName + (b ? "true" : "false"))) && UserContext.userPreferences.getBoolean("HideProfileILEWarn")) b.style.display = "none";
    ListInlineEditData.dialog.show();
    this.currentColumn.onDisplay()
};

function ProfileListViewport(a, b, c, d, e) {
    //debugger;
    ListViewport.call(this, a, b, e);
    this.url = UserContext.getUrl(c);
    this.editUrl = d
}
ProfileListViewport.prototype = new ListViewport;
ProfileListViewport.prototype.afterSave = function (a, b) {
    ListViewport.prototype.afterSave.call(this, a, b);
    this.refreshList()
};
ProfileListViewport.prototype.updatePage = function (a) {
    ListViewport.prototype.updatePage.call(this, a);
    var b = this.grid.getColumnModel();
    a = b.getIndexById(ListView.ACTION_COLUMN);
    this.grid.view.sizeColumnToContent(a);
    b = b.getColumnById(ListView.ACTION_COLUMN);
    this.grid.getColumnModel().setColumnWidth(a, 70);
    b.fixed = !1
};
ProfileListViewport.prototype.createNewListInlineEditData = function (a) {
    return new ProfileListInlineEditData(a)
};
ProfileListViewport.prototype.getNewLink = function () {
    return UserContext.getUrl(this.editUrl + "?FilterType\x3d{filterType}\x26retURL\x3d{retURL}")
};
ProfileListViewport.prototype.getEditLink = function () {
    return UserContext.getUrl(this.editUrl + "?id\x3d{filterId}\x26retURL\x3d{retURL}")
};