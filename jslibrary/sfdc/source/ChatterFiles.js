/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Sfdc.ns("Sfdc.AccessibleCurrentlyEditingListDialog");
Sfdc.AccessibleCurrentlyEditingListDialog = function (a) {
    Sfdc.BaseAccessibleFileListDialog.call(this, a);
    this.id = a.id;
    this.title = unescape(a.title);
    this.dataLoadUrl = a.dataLoadUrl;
    this.docId = a.docId;
    this.height = a.height
};
Ext.extend(Sfdc.AccessibleCurrentlyEditingListDialog, Sfdc.BaseAccessibleFileListDialog);
Sfdc.AccessibleCurrentlyEditingListDialog.ID = "chatterCurrentlyEditingListDialog";
Sfdc.AccessibleCurrentlyEditingListDialog.showDialog = function (a, d) {
    Perf.mark(OverlayDialog.LOAD_MARK);
    var e = Sfdc.ChatterNotes.onlineUsers(),
        c = Sfdc.AccessibleCurrentlyEditingListDialog.ID,
        b = sfdcPage.getDialogById(c);
    b || (b = new Sfdc.AccessibleCurrentlyEditingListDialog({
        id: c,
        title: a,
        dataLoadUrl: "/note/currentlyediting/",
        docId: d,
        height: 500
    }), b.width = 500, b.register());
    b.open({
        userIds: JSON.stringify(e)
    })
};
Sfdc.ns("Sfdc.AccessibleEditFileDialog");
Sfdc.AccessibleEditFileDialog = function (a, b, c) {
    Sfdc.BaseAccessibleFileDialog.call(this, {
        id: a
    });
    this.id = a;
    this.title = b;
    this.docId = c;
    this.content = "";
    this.height = 400;
    this.width = 490;
    this.fileDescription = this.fileName = "";
    this.hasBeenEdit = !1;
    this.useCSS = !0;
    this.focusOnShow = !1
};
Ext.extend(Sfdc.AccessibleEditFileDialog, Sfdc.BaseAccessibleFileDialog);
Sfdc.AccessibleEditFileDialog.prototype.getContent = function () {
    return this.content
};
Sfdc.AccessibleEditFileDialog.prototype.toggleEditButton = function (a) {
    var b = Sfdc.get("editFilesButton");
    !1 === a ? chatter.getToolbox().disableButton(b) : chatter.getToolbox().enableButton(b)
};
Sfdc.AccessibleEditFileDialog.EDIT_FILE_DIALOG_ID = "chatterFilesEditDialog";
Sfdc.AccessibleEditFileDialog.editFileDialog = null;
Sfdc.AccessibleEditFileDialog.FILE_NAME_FIELD_ID = "fileName_edit";
Sfdc.AccessibleEditFileDialog.FILE_DESCRIPTION_FIELD_ID = "desc_edit";
Sfdc.AccessibleEditFileDialog.FILE_TITLE_MAX_WIDTH = "598";
Sfdc.AccessibleEditFileDialog.open = function (a) {
    var b = sfdcPage.getDialogById(Sfdc.AccessibleEditFileDialog.EDIT_FILE_DIALOG_ID);
    if (!b) {
        var b = new Sfdc.AccessibleEditFileDialog(Sfdc.AccessibleEditFileDialog.EDIT_FILE_DIALOG_ID, "", a[ChatterFilesConstants.FILE_CONFIG_KEY_DOCID]),
            c = Sfdc.get("chatterFilesEditPanelHolder").innerHTML;
        Sfdc.Dom.removeChild(Sfdc.get("chatterFilesEditPanelHolder"));
        b.content = '\x3cdiv id\x3d"contentPublisherSlideDown" class\x3d"contentPublisherSlideDown"\x3e' + c + "\x3c/div\x3e";
        b.created = !0;
        b.register()
    } (c = a[ChatterFilesConstants.EDIT_FILE_CONFIG_KEY_TYPE] == ChatterFilesConstants.EDIT_FILE_CONFIG_KEY_TYPE_DESCRIPTION) ? (Sfdc.get("chatterFilesEditDialogTitle").innerHTML = LC.getLabel("ChatterFileDetailPage", "editFileDescTitle"), this.showFileNameField(!1)) : (Sfdc.get("chatterFilesEditDialogTitle").innerHTML = LC.getLabel("ChatterFileDetailPage", "editFileDetailsTitle"), this.showFileNameField(!0));
    b.show();
    var e = Ext.get(Sfdc.AccessibleEditFileDialog.FILE_NAME_FIELD_ID),
        d = Ext.get(Sfdc.AccessibleEditFileDialog.FILE_DESCRIPTION_FIELD_ID);
    b.hasBeenEdit ? (e.dom.value = b.fileName, d.dom.value = b.fileDescription) : (e.dom.value = a[ChatterFilesConstants.FILE_CONFIG_KEY_FILENAME], d.dom.value = a[ChatterFilesConstants.FILE_CONFIG_KEY_DESC] || "");
    chatter.getFileUploader().initValidation(b.toggleEditButton, e, d);
    c && d.focus()
};
Sfdc.AccessibleEditFileDialog.close = function () {
    sfdcPage.getDialogById(Sfdc.AccessibleEditFileDialog.EDIT_FILE_DIALOG_ID).cancel()
};
Sfdc.AccessibleEditFileDialog.showFileNameField = function (a) {
    var b = Sfdc.get(".requiredLegendContainer", Sfdc.get("chatterFileForm_edit")),
        c = Sfdc.Dom.getParent(Sfdc.get("fileName_edit"), "tr"),
        e = Sfdc.Dom.getParent(Sfdc.get("fileName_edit"), "div"),
        d = Sfdc.get("desc_edit"),
        f = Sfdc.select("th", Sfdc.Dom.getParent(d, "tr"))[0];
    !0 === a ? (Sfdc.Dom.setStyle(b, "display", ""), Sfdc.Dom.removeClass(c, "hidden"), Sfdc.Dom.setStyle(c, "display", ""), Sfdc.Dom.addClass(e, "requiredInput"), Sfdc.Dom.setStyle(f, "display", ""), Sfdc.Dom.removeClass(d,
        "textAreaFullSize"), d.className = "textAreaNormalSize") : (Sfdc.Dom.hideByDisplay(b), Sfdc.Dom.removeClass(e, "requiredInput"), Sfdc.Dom.hideByDisplay(c), Sfdc.Dom.hideByDisplay(f), Sfdc.Dom.removeClass(d, "textAreaNormalSize"), d.className = "textAreaFullSize")
};
Sfdc.AccessibleEditFileDialog.edit = function () {
    var a = sfdcPage.getDialogById(Sfdc.AccessibleEditFileDialog.EDIT_FILE_DIALOG_ID);
    a.toggleEditButton(!1);
    if (a) {
        var b = Sfdc.get(Sfdc.AccessibleEditFileDialog.FILE_NAME_FIELD_ID).value,
            c = Sfdc.get(Sfdc.AccessibleEditFileDialog.FILE_DESCRIPTION_FIELD_ID).value,
            e = Sfdc.get("fileTitle"),
            d = Sfdc.get("addDescriptionId"),
            f = Sfdc.get("fileDescriptionText"),
            h = {};
        h.fileName = b;
        h.desc = c;
        chatter.getToolbox().post({
            url: "/chatterfile/" + a.docId + ";edit",
            id: a.docId,
            params: h,
            success: function (b,
                c) {
                a.hasBeenEdit = !0;
                var g = c.title;
                a.fileName = g;
                e.innerHTML = escapeHTML(g);
                document.title = LC.getLabel("ChatterFileDetailPage", "file") + ": " + trim(g) + document.title.substring(document.title.lastIndexOf(" ~ "));
                Sfdc.get(ChatterFilesConstants.FILE_TITLE_ID).title = g;
                c.description ? (a.fileDescription = c.description, Sfdc.Dom.hideByDisplay(d), f.innerHTML = escapeHTML(c.description).replace(/\n/g, "\x3cbr\x3e")) : (Sfdc.Dom.show(d), Sfdc.Dom.setText(f, ""), a.fileDescription = "");
                a.cancel()
            },
            failure: function (b, c) {
                a.cancel();
                c && !c.errormessage && alert(LC.getLabel("ChatterFilesTabPage", "genericErrorMessage"))
            }
        })
    }
};
Sfdc.AccessibleEditFileDialog.prototype.enter = function () {
    Sfdc.AccessibleEditFileDialog.edit()
};
Sfdc.ns("Sfdc.AccessibleFilePublicLinksDialog");
Sfdc.AccessibleFilePublicLinksDialog = function (a) {
    Sfdc.BaseAccessibleFileListDialog.call(this, a);
    this.id = a.id;
    this.title = unescape(a.title);
    this.docId = a.docId;
    this.fileTitle = a.fileTitle;
    this.versionId = a.versionId;
    this.height = a.height;
    this.width = 525
};
Sfdc.AccessibleFilePublicLinksDialog.prototype = new Sfdc.BaseAccessibleFileListDialog({});
Sfdc.AccessibleFilePublicLinksDialog.ID = "chatterFilePublicLinkDialog";
Sfdc.AccessibleFilePublicLinksDialog.DATA_LOAD_URL = "/file/publiclinks/";
Sfdc.AccessibleFilePublicLinksDialog.showDialog = function (a, b, c, d) {
    c = Sfdc.AccessibleFileSharedWithListDialog.getFileTitle(c);
    var e = Sfdc.isDefAndNotNull(c) ? LC.getLabel("ChatterFilePublicLink", "createPublicLinkWithFileTitle", c) : LC.getLabel("ChatterFilePublicLink", "createPublicLink");
    d && (e = LC.getLabel("ChatterFileSharing", "shareInScope", e, d));
    Perf.mark(OverlayDialog.LOAD_MARK);
    chatter.getEventBus().addEventListener("chatter:files", "onAfterPublicLinkDialogOpen", Sfdc.AccessibleFilePublicLinksDialog.highLightLink);
    sfdcPage.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID) && Sfdc.Dom.hideByDisplay(Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.ID));
    var f = Sfdc.AccessibleFilePublicLinksDialog.ID;
    d = sfdcPage.getDialogById(f);
    a = {
        id: f,
        title: chatter.getToolbox().htmlEncode(e),
        docId: a,
        versionId: b,
        fileTitle: c
    };
    d || (d = new Sfdc.AccessibleFilePublicLinksDialog(a), d.register());
    d.open(a)
};
Sfdc.AccessibleFilePublicLinksDialog.highLightLink = function () {
    setTimeout(function () {
        var a = Sfdc.get("overrideInput");
        a && (a.focus(), a.select())
    }, 100)
};
Sfdc.AccessibleFilePublicLinksDialog.hideShowLinkDetail = function () {
    var a = Sfdc.get("linkSettingDetailDiv"),
        b = Sfdc.get("linkSettingHeader_icon");
    Sfdc.Dom.isVisible(a) ? (Sfdc.Dom.addClass(a, "hidden"), Sfdc.Dom.removeClass(b, "publicLinkSetupImageExpand"), Sfdc.Dom.addClass(b, "publicLinkSetupImageCollapse")) : (Sfdc.Dom.removeClass(a, "hidden"), Sfdc.Dom.removeClass(b, "publicLinkSetupImageCollapse"), Sfdc.Dom.addClass(b, "publicLinkSetupImageExpand"))
};
Sfdc.AccessibleFilePublicLinksDialog.needRefresh = !1;
Sfdc.AccessibleFilePublicLinksDialog.copyLinkForIE = function () {
    var a = Sfdc.get("overrideInput").value;
    window.clipboardData.setData("text", a)
};
Sfdc.AccessibleFilePublicLinksDialog.prototype.clickShareBtn = function (a) {
    this.hide();
    Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList(this.fileTitle, this.docId);
    Sfdc.AccessibleFileSharedWithListDialog.updateTitle(this.docId, !1);
    var b = Sfdc.BaseAccessibleFileDialog.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID);
    a || (Sfdc.AccessibleFilePublicLinksDialog.needRefresh = !0);
    b && Sfdc.AccessibleFilePublicLinksDialog.needRefresh && (b.syncUpMainPage = !0)
};
Sfdc.AccessibleFilePublicLinksDialog.prototype.open = function (a) {
    var b = Sfdc.AccessibleFilePublicLinksDialog.DATA_LOAD_URL + a.docId,        c = this;
    Sfdc.apply(this, a, !0);
    chatter.getToolbox().post({
        url: b,
        params: {
            versionId: c.versionId
        },
        success: function (a, e) {
            c.updateContent(e);
            c.hasExistingLink = "true" === e.hasExistingLink ? !0 : !1;
            c.callback && c.callback(b)
        }
    })
};
Sfdc.AccessibleFilePublicLinksDialog.prototype.cancel = function () {
    this.clickShareBtn(this.hasExistingLink)
};
Sfdc.AccessibleFilePublicLinksDialog.prototype.show = function () {
    Sfdc.BaseAccessibleFileDialog.prototype.show.call(this);
    chatter.getEventBus().fireEvent("chatter:files", "onAfterPublicLinkDialogOpen")
};
Sfdc.ns("Sfdc.AccessibleFileVersionListDialog");
Sfdc.AccessibleFileVersionListDialog = function (a) {
    Sfdc.BaseAccessibleFileListDialog.call(this, a);
    this.id = a.id;
    this.title = unescape(a.title);
    this.dataLoadUrl = a.dataLoadUrl;
    this.docId = a.docId;
    this.height = a.height
};
Ext.extend(Sfdc.AccessibleFileVersionListDialog, Sfdc.BaseAccessibleFileListDialog);
Sfdc.AccessibleFileVersionListDialog.ID = "chatterFileVersionListDialog";
Sfdc.AccessibleFileVersionListDialog.showDialog = function (a, d) {
    Perf.mark(OverlayDialog.LOAD_MARK);
    var c = Sfdc.AccessibleFileVersionListDialog.ID,
        b = sfdcPage.getDialogById(c);
    b || (b = new Sfdc.AccessibleFileVersionListDialog({
        id: c,
        title: a,
        dataLoadUrl: "/file/versionlist/",
        docId: d,
        height: 500
    }), b.width = 500, b.register());
    b.open()
};
Sfdc.AccessibleFileVersionListDialog.closeDialog = function () {
    var a = sfdcPage.getDialogById(Sfdc.AccessibleFileVersionListDialog.ID);
    a && a.closeDialog()
};
Sfdc.ns("Sfdc.AccessibleShareWithDropDownPanel");
Sfdc.AccessibleShareWithDropDownPanel = function () { };
Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_DROPDOWN_ID = "sideBarShareWithOption";
Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_PEOPLE_ID = "withPeopleID";
Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_GROUP_ID = "withGroupID";
Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_COMPANY_ID = "withCompanyID";
Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_LINK_ID = "withLinkID";
Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_SETTING_ID = "shareSettingsID";
Sfdc.FileSharedWithActionDropdown = function (a, b) {
    Sfdc.DropdownPanel.call(this, a);
    this.docId = b.docId;
    this.versionId = b.versionId;
    this.fileOwnerID = b.fileOwnerID;
    this.sharedWithWizardDataLoadUrl = b.sharedWithWizardDataLoadUrl;
    this.showPeopleAndGroupOptions = b.showPeopleAndGroupOptions;
    this.showLinkOption = b.showLinkOption;
    this.sharingScope = b.sharingScope
};
Ext.extend(Sfdc.FileSharedWithActionDropdown, Sfdc.DropdownPanel);
Sfdc.FileSharedWithActionDropdown.prototype.getXY = function () {
    return {
        x: getObjX(this.anchorElem) - 1,
        y: getObjY(this.anchorElem) + this.anchorElem.offsetHeight + 1
    }
};
Sfdc.FileSharedWithActionDropdown.prototype.getSize = function () {
    return {
        width: this.anchorElem.offsetWidth + 30
    }
};
Sfdc.FileSharedWithActionDropdown.prototype.getContent = function (a) {
    a = [];
    this.showPeopleAndGroupOptions && (a.push('\x3cdiv class\x3d"contentActionMenuItem" onmouseover\x3d"Sfdc.FileSharedWithActionDropdown.mouseOverActionMenu(this);" onmouseout\x3d"Sfdc.FileSharedWithActionDropdown.mouseOutActionMenu(this);"\x3e\x3cul class\x3d"actionBarShareWithUl"\x3e\x3cli class\x3d"sharedWithOptionLi"\x3e\x3ca id\x3d"' + Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_PEOPLE_ID + '" onclick\x3d"Sfdc.AccessibleShareWithDropDownPanel.selectShareOption(this, \'' +
        this.sharingScope + '\');return false;"  href\x3d"javascript:void(0);"\x3e' + LC.getLabel("ChatterFilesTabPage", "sharePeople") + "\x3c/a\x3e\x3c/li\x3e\x3c/ul\x3e\x3c/div\x3e"), a.push('\x3cdiv class\x3d"contentActionMenuItem" onmouseover\x3d"Sfdc.FileSharedWithActionDropdown.mouseOverActionMenu(this);" onmouseout\x3d"Sfdc.FileSharedWithActionDropdown.mouseOutActionMenu(this);"\x3e\x3cul class\x3d"actionBarShareWithUl"\x3e\x3cli class\x3d"sharedWithOptionLi"\x3e\x3ca id\x3d"' + Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_GROUP_ID +
        '" onclick\x3d"Sfdc.AccessibleShareWithDropDownPanel.selectShareOption(this, \'' + this.sharingScope + '\');return false;"  href\x3d"javascript:void(0);"\x3e' + LC.getLabel("ChatterFilesTabPage", "shareGroups") + "\x3c/a\x3e\x3c/li\x3e\x3c/ul\x3e\x3c/div\x3e"));
    this.showLinkOption && a.push('\x3cdiv class\x3d"contentActionMenuItem" onmouseover\x3d"Sfdc.FileSharedWithActionDropdown.mouseOverActionMenu(this);" onmouseout\x3d"Sfdc.FileSharedWithActionDropdown.mouseOutActionMenu(this);"\x3e\x3cul class\x3d"actionBarShareWithUl"\x3e\x3cli class\x3d"sharedWithOptionLi"\x3e\x3ca id\x3d"' +
        Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_LINK_ID + '" onclick\x3d"Sfdc.AccessibleShareWithDropDownPanel.selectShareOption(this, \'' + this.sharingScope + '\');return false;"  href\x3d"javascript:void(0);"\x3e' + LC.getLabel("ChatterFilesTabPage", "shareLink") + "\x3c/a\x3e\x3c/li\x3e\x3c/ul\x3e\x3c/div\x3e");
    a.push('\x3cdiv style\x3d"height: 2px;"\x3e\x3cul class\x3d"actionBarShareWithUlWithTopBorder"\x3e \x3c/ul\x3e\x3c/div\x3e');
    a.push('\x3cdiv class\x3d"contentActionMenuItem" onmouseover\x3d"Sfdc.FileSharedWithActionDropdown.mouseOverActionMenu(this);" onmouseout\x3d"Sfdc.FileSharedWithActionDropdown.mouseOutActionMenu(this);"\x3e\x3cul class\x3d"actionBarShareWithUl"\x3e\x3cli class\x3d"sharedWithOptionLi"\x3e\x3ca id\x3d"' +
        Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_SETTING_ID + '" onclick\x3d"Sfdc.AccessibleShareWithDropDownPanel.selectShareOption(this, \'' + this.sharingScope + '\');return false;"  href\x3d"javascript:void(0);"\x3e' + LC.getLabel("ChatterFilesTabPage", "shareSettings") + "\x3c/a\x3e\x3c/li\x3e\x3c/ul\x3e\x3c/div\x3e");
    return a.join("")
};
Sfdc.FileSharedWithActionDropdown.mouseOverActionMenu = function (a) {
    Sfdc.Dom.addClass(a, "hover")
};
Sfdc.FileSharedWithActionDropdown.mouseOutActionMenu = function (a) {
    Sfdc.Dom.removeClass(a, "hover")
};
Sfdc.AccessibleShareWithDropDownPanel.getShareOptionDropdown = function (a) {
    var b = Sfdc.DropdownPanel.getPanel(Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_DROPDOWN_ID);
    b || (b = new Sfdc.FileSharedWithActionDropdown(Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_DROPDOWN_ID, a));
    return b
};
Sfdc.AccessibleShareWithDropDownPanel.showHideShareOptionDropdown = function (a, b) {
    var c = Sfdc.AccessibleShareWithDropDownPanel.getShareOptionDropdown(b);
    if (c) {
        var d = Sfdc.get(Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_DROPDOWN_ID);
        d && Sfdc.Dom.isVisible(d) ? c.close() : c.show(a)
    }
};
Sfdc.AccessibleShareWithDropDownPanel.selectShareOption = function (a, b) {
    var c = Sfdc.AccessibleShareWithDropDownPanel.getShareOptionDropdown();
    switch (a.id) {
        case Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_PEOPLE_ID:
            Sfdc.AccessibleFileSharedWithListDialog.showSharedWithPeople(c.docId, null, c.fileOwnerID, c.sharedWithWizardDataLoadUrl, "", b);
            break;
        case Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_GROUP_ID:
            Sfdc.AccessibleFileSharedWithListDialog.showSharedWithGroups(c.docId, null, c.fileOwnerID,
                c.sharedWithWizardDataLoadUrl, "", b);
            break;
        case Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_COMPANY_ID:
            Sfdc.AccessibleFileSharedWithListDialog.showSharedWithCompany(c.docId, null, c.fileOwnerID, c.sharedWithWizardDataLoadUrl, "", b);
            break;
        case Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_LINK_ID:
            Sfdc.AccessibleFilePublicLinksDialog.showDialog(c.docId, c.versionId, null, b);
            break;
        case Sfdc.AccessibleShareWithDropDownPanel.SHARE_OPTION_SETTING_ID:
            Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList(null,
                c.docId)
    }
    c.close()
};
Perf.mark("Sfdc.ChatterFiles:Start");

function ChatterFilePreviewPoller(c) {
    function e() {
        d++;
        chatter.getToolbox().get({
            url: "/chatterfile/" + c,
            success: function (a, b) {
                Sfdc.Dom.updateHTML(Sfdc.get("centerContent"), b.html, !0)
            }
        })
    }
    var a = this,d = 0;
    this.startPoll = function () {
        a.timeoutid = setTimeout(e, 1E3 * Math.pow(2, d))
    }
}
var chatterFilePreview = function () {
    var c;
    return {
        getPreviewPoller: function (e) {
            c || (c = new ChatterFilePreviewPoller(e));
            return c
        }
    }
} ();
(function () {
    function c(a, d, c, b) {
        b = b ? LC.getLabel("ChatterFilesTabPage", "deleteExternalFileConfirmation", b) : LC.getLabel("ChatterFilesTabPage", "deleteConfirmation");
        return confirm(b) ? (chatter.getToolbox().post({
            url: "/chatterfile/" + a + ";delete",
            id: a,
            success: function () {
                d ? d.call(this) : navigateToUrl(UserContext.getUrl(e), null, Desktop.CLOSETAB_ACTION)
            },
            failure: function (a, b) {
                c && c.call(this, a, b)
            }
        }), !0) : !1
    }
    var e = "/_ui/core/chatter/files/FileTabPage";
    Sfdc.apply(Sfdc.ChatterFiles, {
        deleteFile: function (a, d, h) {
            var b =
                document.body || document.documentElement,
                f = new LoadingScreen(b, LC.getLabel("ChatterFileDetailPage", "deleteFileMsg")),
                k = d ? d : UserContext.getUrl(e),
                g = function () {
                    navigateToUrl(k, null, "closeTab")
                };
            c(a, g, function (a, b) {
                f.hide();
                g()
            }, h) && (f.show(), a = Sfdc.get(".waitingSearchDiv", b), Sfdc.Dom.addClass(a, "progressOverlay"), b = Sfdc.get(".waitingHolder", b), Sfdc.Dom.addClass(b, "progressMessage"))
        },
        showEntityNotViewableDialog: function (a) {
            a = this.ENTITY_NOT_VIEWABLE_COMMAND_URL + a;
            chatter.getToolbox().get({
                url: a,
                success: function (a,
                    c) {
                    Dialogs.createDialog({
                        id: Dialogs.getNextId(),
                        title: LC.getLabel("ChatterFileSharing", "sharedEntityNotViewableOverlayTitle"),
                        message: c.html,
                        backgroundClass: Dialogs.types.WARN.backgroundClass,
                        contentClass: Dialogs.types.WARN.contentClass,
                        iconClass: Dialogs.types.WARN.iconClass,
                        iconAlt: Dialogs.types.WARN.getIconAlt(),
                        actions: [null],
                        actionLabels: [LC.getLabel("Buttons", "ok")]
                    }, !0).show()
                }
            })
        },
        setTitleWidthForContentFile: function () {
            var a = Sfdc.select(".chatterBreadcrumbs")[0];
            a && Sfdc.Dom.setStyles(a, {
                width: "600px"
            });
            Sfdc.userAgent.isIE && (a = Sfdc.select(".fileTailNode")[0]) && Sfdc.Dom.setStyles(a, {
                width: "600px"
            })
        }
    })
})();
Perf.endMark("Sfdc.ChatterFiles:Start");
Sfdc.ns("Sfdc.MultiFileUploaderFile");
Sfdc.MultiFileUploaderFile = function (a) {
    this.name = "undefined" != typeof a.fileName ? a.fileName : a.name;
    this.size = "undefined" != typeof a.fileSize ? a.fileSize : a.size;
    this.type = a.type;
    a = this.name;
    var b = a.lastIndexOf("."); -1 != b && (a = a.substr(0, b));
    this.shortName = a;
    this.docId = null
};
Sfdc.ns("Sfdc.MultiFileUploaderUi");
Sfdc.MultiFileUploaderUi = {
    showSingleFileModeUploadList: function () {
        var a = Sfdc.get("multifile-upload-list").childNodes.item(0);
        Sfdc.Dom.removeClass(a, "multi-item");
        Sfdc.Dom.addClass(a, "single-item")
    },
    showOverallProgressBar: function () {
        var a = Sfdc.get("overallProgress");
        Sfdc.Dom.setStyle(a, "display", "inline-block");
        a = Sfdc.get("uploadingStatusInfo");
        Sfdc.Dom.hasClass(a, "canceledAllStatusInfo") && (Sfdc.Dom.removeClass(a, "canceledAllStatusInfo"), Sfdc.Dom.addClass(a, "uploadingStatusInfo"))
    },
    hideOverallProgressBar: function () {
        var a = Sfdc.get("overallProgress");
        Sfdc.Dom.hideByDisplay(a)
    },
    showListTableHeader: function () {
        var a = Sfdc.get("multiUploadListTableHeader");
        Sfdc.Dom.hasClass(a, "canceledAllBackGround") && (Sfdc.Dom.removeClass(a, "canceledAllBackGround"), Sfdc.Dom.addClass(a, "ongoingBackGround"));
        Sfdc.Dom.show(a)
    },
    hideListTableHeader: function () {
        Sfdc.Dom.hideByDisplay("multiUploadListTableHeader")
    },
    showCancelRemainingUploadsButton: function () {
        //debugger;
        Sfdc.Dom.show(Sfdc.get("multiUploadCancelRemainingBtn"))
    },
    hideCancelRemainingUploadsButton: function () {
        Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadCancelRemainingBtn"))
    },
    showCloseButton: function () {
        Sfdc.Dom.show(Sfdc.get("multiUploadCloseBtn"))
    },
    hideCloseButton: function () {
        Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadCloseBtn"))
    },
    showSharingSettingsBtn: function (a, b) {
        Sfdc.Dom.setStyle(Sfdc.get("multiUploadSharingSettingsBtn"), "display", "inline-block");
        Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadCancelRemainingBtn"));
        Sfdc.Dom.show(Sfdc.get("multiUploadCloseBtn"));
        addEvent(Sfdc.get("multiUploadSharingSettingsBtn"), "click", function () {
            navigateToUrl(a + "/" + b + "?so\x3dlst")
        })
    },
    hideSharingSettingBtn: function () {
        Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadSharingSettingsBtn"))
    },
    updateUploadingStatusInfoWithSuccessMessage: function (a) {
        1 < a ? Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "uploadSucessfulStatusHeaderMsg", a.toString()) : Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "singleUploadSucessfulStatusHeaderMsg")
    },
    updateUploadingStatusInfoWithInProgressMessage: function (a, b) {
        var c = Sfdc.get("overallProgress");
        1 < b ? (Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "uploadingInProgressHeaderMsg", (a + 1).toString(), b.toString()), Sfdc.Dom.setStyle(c, "display", "inline-block")) : (Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "singleUploadingInProgressHeaderMsg"), Sfdc.Dom.hideByDisplay(c))
    },
    updateUploadingStatusInfoWithAllCanceledMessage: function (a) {
        1 < a ? Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "uploadCanceledAllStatusHeaderMsg",
            a) : Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "singleUploadCanceledAllStatusHeaderMsg");
        a = Sfdc.get("multiUploadListTableHeader");
        Sfdc.Dom.removeClass(a, "ongoingBackGround");
        Sfdc.Dom.addClass(a, "canceledAllBackGround");
        a = Sfdc.get("uploadingStatusInfo");
        Sfdc.Dom.removeClass(a, "uploadingStatusInfo");
        Sfdc.Dom.addClass(a, "canceledAllStatusInfo")
    }
};
Sfdc.ns("Sfdc.MultiFileUploaderUtil");
Sfdc.MultiFileUploaderUtil.extend = function (a, b) {
    for (var c in b) c && (a[c] = b[c])
};
Sfdc.MultiFileUploaderUtil.isFileAPISupported = function () {
    return "undefined" != typeof File && "undefined" != typeof FormData && "undefined" != typeof (new XMLHttpRequest).upload
};
Sfdc.MultiFileUploaderUtil.isMultiFileUploadSupported = function () {
    var a = document.createElement("input");
    a.type = "file";
    return "multiple" in a && Sfdc.MultiFileUploaderUtil.isFileAPISupported()
};
Sfdc.MultiFileUploaderUtil.isIE9AndBelow = function () {
    return Sfdc.userAgent.isIE && !Sfdc.userAgent.isIE10 && !Sfdc.userAgent.isIE11
};
Sfdc.MultiFileUploaderUtil.getBrowserName = function () {
    var a = "unknown";
    Sfdc.userAgent.isIE ? a = "IE" + Sfdc.userAgent.ieVersion : Sfdc.userAgent.isChrome ? a = "Chrome" : Sfdc.userAgent.isSafari ? a = "Safari" : Sfdc.userAgent.isFirefox ? a = "Firefox" : Sfdc.userAgent.isOpera ? a = "Opera" : Sfdc.userAgent.isNetscape && (a = "Netscape");
    return a
};
Sfdc.MultiFileUploaderUtil.parseResponseResult = function (a) {
    a = a.replace(/\r/g, "\n");
    0 === a.indexOf("\x3cpre") && (a = a.replace(/^<pre[^>]*>/, "").replace(/<\/pre>$/, ""));
    var b = a.indexOf(AjaxServlet.CSRF_PROTECT);
    if (-1 === b) return null;
    0 < b && (a = AjaxServlet.CSRF_PROTECT + a.replace(AjaxServlet.CSRF_PROTECT, ""));
    0 < a.indexOf("\x3ctextarea") && (a = a.replace(/<textarea[^>]*>/, "").replace(/<\/textarea>$/, ""));
    return chatter.getToolbox().evalJson(a)
};
Sfdc.MultiFileUploaderUtil.getActionUrl = function () {
    var a = chatter.getToolbox();
    return a.sitePrefix() + a.apiurl()
};
Sfdc.MultiFileUploaderUtil.formatFileSize = function (a) {
    var b = ["KB", "MB", "GB"];
    if (0 < a) {
        var c = -1;
        do a /= 1024, c++; while (1023 < a);
        return Math.max(a, 0.1).toFixed(1) + " " + b[c]
    }
    return "0 " + b[0]
};
Sfdc.MultiFileUploaderUtil.formatFileTypeCSS = function (a, b) {
    b = b || "16";
    return /^image\/|^.png$|^.jpg$|^.bmp$|^.gif$/.test(a) ? "sprite-doctype-image-" + b : /^video\/|^.mov$|^.avi$|^.mp4$|^.mpeg$|^.wmv$|^.rmvb$/.test(a) ? "sprite-doctype-video-" + b : /^audio\/|^.mp3$|^.wma$|^.wav$|^.midi$/.test(a) ? "sprite-doctype-audio-" + b : /^text\/plain|^.txt$/.test(a) ? "sprite-doctype-txt-" + b : /^text\/xml|^.xml$/.test(a) ? "sprite-doctype-xml-" + b : /^text\/html|^.html$|^.xhtml$|^.htm$/.test(a) ? "sprite-doctype-html-" + b : /^text\/richtext|^.rtf$/.test(a) ?
        "sprite-doctype-rtf-" + b : /^application\/.*word|^.doc$|^.docx$/.test(a) ? "sprite-doctype-word-" + b : /^application\/.*(excel|sheet)|^.xls$|^.xlsx$/.test(a) ? "sprite-doctype-excel-" + b : /^application\/.*powerpoint|^application\/.*presentation|^.ppt$|^.pptx$/.test(a) ? "sprite-doctype-ppt-" + b : /^application\/.*visio|^.vsd$/.test(a) ? "sprite-doctype-visio-" + b : /^application\/.*pdf|^.pdf$/.test(a) ? "sprite-doctype-pdf-" + b : /^application\/.*flash|^.swf$/.test(a) ? "sprite-doctype-flash-" + b : /^application\/.*zip|^.zip$/.test(a) ?
        "sprite-doctype-zip-" + b : /^application\/.*postscript|^.eps$/.test(a) ? "sprite-doctype-eps-" + b : /^application\/.*msdownload|^.exe$/.test(a) ? "sprite-doctype-exe-" + b : "sprite-doctype-unknown-" + b
};
Sfdc.MultiFileUploaderUtil.checkFileSyncOption = function () {
    if (!Sfdc.ChatterFileUploader.isFileSync) {
        var a = Sfdc.get("chatterboxFilesBrowseItem");
        a && Sfdc.Dom.hasClass(a, "selectedLinkItem") && (Sfdc.ChatterFileUploader.isFileSync = !0)
    }
};
Sfdc.MultiFileUploaderUtil.createElementFromHTML = function () {
    var a = document.createElement("div");
    return function (b) {
        a.innerHTML = b;
        b = a.firstChild;
        a.removeChild(b);
        return b
    }
} ();
Sfdc.MultiFileUploaderUtil.processDirectoriesInFileList = function (a) {
    var b, c, d = [];
    if (a.items)
        for (b = 0; b < a.items.length; b++) {
            if (c = a.items[b]) {
                var e = null;
                c.webkitGetAsEntry && (e = c.webkitGetAsEntry());
                e && (e.isDirectory ? d.push({
                    name: e.name,
                    size: 0,
                    type: ""
                }) : e.isFile && d.push(a.files[b]))
            }
        } else {
        d = a.files;
        a = [];
        for (b = 0; b < d.length; b++) c = d[b], 0 === c.size ? a.push({
            name: c.name,
            size: 0,
            type: ""
        }) : a.push(c);
        d = a
    }
    return d
};
Sfdc.ns("Sfdc.MultiFileUploaderUiComponents.ProgressBar");
Sfdc.MultiFileUploaderUiComponents.ProgressBar = function (a, b) {
    this.element = a;
    this.totalPixelSize = b;
    this.element.childNodes.item(0).style.width = "0px"
};
Sfdc.MultiFileUploaderUiComponents.ProgressBar.prototype.update = function (a) {
    this.element.childNodes.item(0).style.width = a * this.totalPixelSize + "px"
};
Ext.ns("Ninja.Flex");
Ninja.Flex.FlexCoverflow = {
    getApp: function () {
        return getFlexRoot("Coverflow")
    },
    showPreview: function (c) {
        debugger;
        if (Sfdc.ChatterFiles || "undefined" == typeof Shepherd) {
            var b = ChatterFilesConstants.OVERLAY_ID,
                g = ChatterFilesConstants.DOC_VIEWER_OVERLAY_CLASS,
                h = ChatterFilesConstants.DOC_VIEWER_CONTAINER_PARENT_CLASS,
                e = ChatterFilesConstants.DOC_VIEWER_CONTAINER_PARENT_CLASS,
                f = ChatterFilesConstants.CONTAINER_ID,
                k = ChatterFilesConstants.CONTAINER_ID,
                d = Sfdc.Window.getWindowWidth(),
                a = Sfdc.Window.getWindowHeight(),
                d = d - 40,
                a = a - 20 - 48;
            width = 730 < d ? d : 730;
            height = 480 < a ? a : 480;
            null === Ext.get(b) ? (a = new AccessiblePreviewContentDialog(b), a.extraClass = g, a.content = "\x3cdiv id\x3d'" + e + "' class\x3d'" + h + "'\x3e\x3cdiv id\x3d'" + f + "' class\x3d'" + k + "'\x3e\x3c/div\x3e\x3c/div\x3e", a.created = !0, a.register(), Ext.get(e).setHeight(height), Ext.get(b).setWidth(width), a.show(), Ext.get(b).setStyle("left", "10px")) : (a = OverlayDialogElement.getDialog(b), a.setTitle(""), Ext.get(e).setHeight(height), Ext.get(b).setWidth(width), Ext.getBody().setStyle("overflow", "auto"), a.show());
            b = chatter && chatter.getToolbox() ? chatter.getToolbox().sitePrefix() : "";            
            insertFlexComponent(Ninja.Flex.ContentStaticResourcesBase + "/flex/DocViewer", "shepherd_prefix\x3d" + b + Ninja.Flex.ShepherdController + "\x26v\x3d" + c + "\x26mode\x3dbubble\x26in_tests\x3dfalse", "100%", "100%", "#f3f3f3", f, "renditionLarge", !1, {
                adobeFlashVersionLbl: LC.getLabel("ContentFlashPlayer", "adobeFlashVersion"),
                downloadAdobeLbl: LC.getLabel("ContentFlashPlayer", "downloadAdobe"),
                downloadAdobeLinkLbl: LC.getLabel("ContentFlashPlayer", "downloadAdobeLink"),
                closeDialogLbl: LC.getLabel("ContentFlashPlayer", "closeDialog")
            })
        } else Shepherd.run("document", "viewRenditionLarge", {
            selectedVersionId: c
        })
    },
    showDetails: function (c) {
        Sfdc.ChatterFiles || "undefined" == typeof Shepherd ? navigateToUrl(UserContext.getUrl("/" + c)) : Shepherd.run("document", "view", {
            selectedDocumentId: c
        })
    }
};
Ninja.Flex.ContentStaticResourcesBase = "/sfc";
Ninja.Flex.ShepherdController = "/sfc/servlet.shepherd";
Sfdc.ns("Sfdc.ChatterFileUploadHandler");
Sfdc.ChatterFileUploadHandler = function (a) {
    this.config = Sfdc.apply(a, {
        uploadActionUrl: "",
        onProgressCallback: function (a, d, b, e) { },
        onCompleteCallback: function (a, d, b) { },
        onCancelCallback: function (a, d) { },
        onErrorCallback: function (a, d, b) { }
    });
    this.uploadActionUrl = this.config.uploadActionUrl;
    this.fileUploadWaitingQueue = [];
    this.uploadParams = [];
    this.inProgressXhrs = new Map;
    this.filesToUpload = []
};
Sfdc.MultiFileUploaderUtil.extend(Sfdc.ChatterFileUploadHandler.prototype, {
    addToUploadList: function (a) {
        !a instanceof File && !a.name && alert("Not File object in Sfdc.ChatterFileUploadHandler!");
        var c = new Sfdc.MultiFileUploaderFile(a);
        this.filesToUpload.push({
            fileObject: a,
            fileInfo: c,
            canceled: !1
        });
        return this.filesToUpload.length - 1
    },
    scheduleUpload: function (a, c) {
        1 == this.addToWaitingQueue(a, c) && this.uploadFileToServer(a)
    },
    uploadNextIfExists: function () {
        0 < this.fileUploadWaitingQueue.length && this.uploadFileToServer(this.fileUploadWaitingQueue[0])
    },
    uploadNextIfNoneInProgress: function () {
        0 === this.inProgressXhrs.getSize() && this.uploadNextIfExists()
    },
    cancelCurrentUpload: function (a) {
        this.cancelUploadFileToServer(a);
        this.removeFromWaitingQueue(a);
        this.config.onCancelCallback(a, this.filesToUpload[a].fileObject)
    },
    cancelRemainingUploads: function () {
        this.cancelInProgressUploads();
        this.cancelWaitingUploads()
    },
    removeFromWaitingQueue: function (a) {
        a = Sfdc.Array.indexOf(this.fileUploadWaitingQueue, a);
        this.fileUploadWaitingQueue.splice(a, 1)
    },
    addToWaitingQueue: function (a,        c) {
        var d = this.fileUploadWaitingQueue.push(a);
        this.uploadParams[a] = c || {};
        return d
    },
    removeFromWaitingQueueAndUploadNext: function (a) {
        this.removeFromWaitingQueue(a);
        this.uploadNextIfExists()
    },
    constructFormData: function (a, c, d) {
        var b = new FormData;
        b.append("token", chatter.getToolbox().token());
        b.append("fileName_upload", c);
        b.append("fileName", c);
        b.append("desc_upload", "");
        b.append("desc", "");
        b.append("hiddenFileName", c);
        b.append("shareOption_upload", "pvt");
        b.append("mfu", "1");
        b.append("file", a);
        d.fileSync && b.append("fileSync", !0);
        d.filterParentId && b.append("fpid", d.filterParentId);
        d.fldr && b.append("fldr", d.fldr);
        if (d.params)
            for (var e in d.params) e && d.params[e] && b.append(e, d.params[e]);
        return b
    },
    uploadFileToServer: function (a) {
        var c = this.constructFormData(this.filesToUpload[a].fileObject, this.filesToUpload[a].fileInfo.shortName, this.uploadParams[a]);
        this.submitXhr(a, c)
    },
    cancelUploadFileToServer: function (a) {
        this.filesToUpload[a].canceled = !0;
        var c = this.inProgressXhrs.get(a.toString());
        c && (c.abort(), this.inProgressXhrs.remove(a.toString()))
    },
    submitXhr: function (a, c) {
        var d = this,
            b = new XMLHttpRequest,
            e = this.filesToUpload[a].fileInfo.name;
        b.upload.onprogress = function (b) {
            if (b.lengthComputable) d.config.onProgressCallback(a, e, b.loaded, b.total)
        };
        b.onreadystatechange = function () {
            if (this.readyState == XMLHttpRequest.DONE && !(200 !== this.status && Sfdc.userAgent.isChrome)) d.onXhrDone(a, this)
        };
        this.inProgressXhrs.put(a.toString(), b);
        b.open("POST", this.config.uploadActionUrl, !0);
        b.send(c)
    },
    parseAndDecodeResponse: function (a) {
        if (a = Sfdc.MultiFileUploaderUtil.parseResponseResult(a)) a.html &&
            (a.html = chatter.getFileUploader().getBase64Decoder().decode(a.html)), a.errormessage && (a.errormessage = chatter.getFileUploader().getBase64Decoder().decode(a.errormessage));
        return a
    },
    runCustomHandlers: function (a, c, d) {
        var b = this.config.customHandlers;
        b && ("Failure" === a && b.failureHandler ? b.failureHandler(d.response, c) : "Error" === a && b.errorHandler ? b.errorHandler(d.response, c) : "Success" == a && b.successHandler && b.successHandler(d.response, c))
    },
    onXhrDone: function (a, c) {
        if (!0 !== this.filesToUpload[a].canceled) {
            var d =                this.filesToUpload[a].fileObject,                b = this.filesToUpload[a].fileInfo.size;
            this.config.onProgressCallback(a, this.filesToUpload[a].fileInfo.name, b, b);
            if (200 == c.status) {
                b = this.parseAndDecodeResponse(c.responseText);
                if (null === b) return;
                if ("Failure" === b.message || "Error" === b.message) {
                    this.config.onErrorCallback(a, d, b.html);
                    "true" === b.ignoreIt ? (this.cancelCurrentUpload(a), this.uploadNextIfExists()) : this.cancelRemainingUploads();
                    this.runCustomHandlers(b.message, b, c);
                    return
                }
                if (b.errormessage) this.config.onErrorCallback(a,
                    d, b.errormessage);
                else this.config.onCompleteCallback(a, d, b), this.runCustomHandlers("Success", b, c)
            } else this.config.onCompleteCallback(a, d, {});
            this.inProgressXhrs.remove(a.toString());
            this.removeFromWaitingQueueAndUploadNext(a)
        }
    },
    cancelInProgressUploads: function () {
        var a = this;
        this.inProgressXhrs.each(function (c) {
            c = parseInt(c, 10);
            a.cancelCurrentUpload(c)
        });
        this.inProgressXhrs = new Map
    },
    cancelWaitingUploads: function () {
        for (; 0 < this.fileUploadWaitingQueue.length; ) {
            var a = this.fileUploadWaitingQueue[0];
            a && this.cancelCurrentUpload(a)
        }
        this.fileUploadWaitingQueue = []
    }
});
Sfdc.ns("Sfdc.MultiFileUploaderUsageStats");
Sfdc.MultiFileUploaderUsageStats = function (a) {
    this.filterParentId = a.filterParentId;
    this.origin = a.origin;
    this.uploadMethod = a.uploadMethod;
    this.statsActionUrl = a.statsActionUrl;
    this.uploadStats = []
};
Sfdc.MultiFileUploaderUsageStats.prototype.start = function (a) {
    var b = (new Date).getTime();
    this.uploadStats[a.name] = {
        fileType: a.type,
        fileSize: a.size,
        startTime: b
    }
};
Sfdc.MultiFileUploaderUsageStats.prototype.finish = function (a) {
    var b = (new Date).getTime();
    this.uploadStats[a.name].endTime = b
};
Sfdc.MultiFileUploaderUsageStats.prototype.sendUsageStats = function (a) {
    var b = Sfdc.MultiFileUploaderUtil.getBrowserName(),
        c = "",
        e;
    for (e in this.uploadStats)
        if (this.uploadStats.hasOwnProperty(e)) {
            var d = this.uploadStats[e],
                f = 0;
            d.endTime && (f = d.endTime - d.startTime);
            c += d.fileType + ",";
            c += d.fileSize + ",";
            c += f + ",";
            c += ";"
        }
    b = {
        mfu: "1",
        stats: c,
        browser: b,
        method: this.uploadMethod,
        count: a,
        origin: this.origin
    };
    this.filterParentId && (this.origin === Sfdc.ChatterFileUploader.PROFILE_PAGE && this.filterParentId != UserContext.userId) &&
        (b.fcnt = a, b.fpid = this.filterParentId);
    chatter.getToolbox().post({
        url: this.statsActionUrl,
        params: b,
        failure: function (a, b) { },
        success: function (a, b) { }
    })
};
Sfdc.ns("Sfdc.UploadButton");
Sfdc.UploadButton = function (b) {
    this.config = {
        uploadBtnAnchor: null,
        name: "file",
        onChange: function (a) { }
    };
    Sfdc.MultiFileUploaderUtil.extend(this.config, b);
    this.uploadBtnAnchor = this.config.uploadBtnAnchor;
    this.uploadBtnAnchor.style.position = "relative";
    this.uploadBtnAnchor.style.overflow = "hidden";
    this.uploadBtnAnchor.style.direction = "ltr";
    this.inputElem = this.createInputBtn()
};
Sfdc.UploadButton.HIDDEN_MULTI_INPUT_ID = "multiFileInput";
Sfdc.UploadButton.HIDDEN_SINGLE_INPUT_ID = "singleFileInput";
Sfdc.UploadButton.prototype = {
    getInput: function () {
        return this.inputElem
    },
    reset: function () {
        Sfdc.Dom.removeChild(this.inputElem);
        this.inputElem = this.createInputBtn()
    },
    createFocusInputBtn: function () {
        var b = document.createElement("input");
        b.setAttribute("type", "button");
        b.setAttribute("class", "btnImportant");
        b.id = "multiUploadBtn";
        b.value = LC.getLabel("ChatterFilesTabPage", "uploadMultiFilesLinkText");
        return b
    },
    createHiddenInputBtn: function (b) {
       
        var a = document.createElement("input");
        a.setAttribute("type", "file");
        a.setAttribute("name", "chatterFile_upload");
        a.setAttribute("title", LC.getLabel("ChatterFilesTabPage", "uploadMultiFilesLinkText"));
        !0 === b ? (a.setAttribute("multiple", "multiple"), a.setAttribute("class", "multifile-upload-input-button"), a.id = Sfdc.UploadButton.HIDDEN_MULTI_INPUT_ID) : (a.setAttribute("class", "singlefile-upload-input-button"), a.id = Sfdc.UploadButton.HIDDEN_SINGLE_INPUT_ID);
        this.uploadBtnAnchor.appendChild(a);
        var c = this;
        addEvent(a, "change", function () {
            //debugger;
            c.config.onChange(a)
        });
        return a
    },
    createInputBtn: function () {
        var b = this.createHiddenInputBtn(!0), a = this.createFocusInputBtn();
        this.uploadBtnAnchor.appendChild(a);
        Sfdc.on(this.uploadBtnAnchor, "click", function (a) {
            document.getElementById(Sfdc.UploadButton.HIDDEN_MULTI_INPUT_ID).click()
        });
        Sfdc.on(document.getElementById(Sfdc.UploadButton.HIDDEN_MULTI_INPUT_ID), "click", function (a) {
            Sfdc.Event.stopPropagation(a)
        });
        return b
    }
};
Sfdc.ns("Sfdc.UploadFileDragDropZone");
Sfdc.UploadFileDragDropZone = function (a) {
    this.DRAG_AND_DROP_TARGET_OVERLAY_ID = "dragAndDropTargetOverlay";
    this.config = {
        onEnterCallback: function () { },
        onLeaveCallback: function () { },
        onDropCallback: function (a) { }
    };
    Sfdc.MultiFileUploaderUtil.extend(this.config, a);
    this.dragFromOS = !0;
    this.isEntered = !1;
    this.errorDialog = null;
    this.attachDragDropEvents()
};
Sfdc.UploadFileDragDropZone.prototype = {
    attachDragDropEvents: function () {
        var a = this;
        addEvent(document, "dragstart", function (b) {
            a.dragFromOS = !1
        });
        addEvent(document, "dragend", function (b) {
            a.dragFromOS = !0
        });
        addEvent(document, "dragover", function (b) {
            b.stopPropagation();
            b.preventDefault();
            if (a.isValidFileDrag(b)) {
                var c = Sfdc.userAgent.isIE10 || Sfdc.userAgent.isIE11 ? "move" : b.dataTransfer.effectAllowed;
                b.dataTransfer.dropEffect = "move" == c || "linkMove" == c ? "move" : "copy"
            }
        });
        addEvent(document, "dragenter", function (b) {
            b.stopPropagation();
            b.preventDefault();
            if ((!a.errorDialog || !a.errorDialog.isOpen) && !a.isDragAndDropInProgress() && a.isValidFileDrag(b)) a.config.onEnterCallback()
        });
        addEvent(document, "dragleave", function (b) {
            b.stopPropagation();
            b.preventDefault();
            if (a.isDragAndDropInProgress() && a.isEventFromDragAndDropOverlay(b)) a.config.onLeaveCallback()
        });
        addEvent(document, "drop", function (b) {
            b.stopPropagation();
            b.preventDefault();
            if (a.isDragAndDropInProgress() && a.isValidFileDrag(b)) a.config.onDropCallback(b)
        })
    },
    createDragAndDropOverlay: function () {
        var a =            document.createElement("div");
        a.id = this.DRAG_AND_DROP_TARGET_OVERLAY_ID;
        document.body.appendChild(a)
    },
    destroyDragAndDropOverlay: function () {
        var a = document.getElementById(this.DRAG_AND_DROP_TARGET_OVERLAY_ID);
        a.parentNode.removeChild(a)
    },
    isEventFromDragAndDropOverlay: function (a) {
        return a.target.id === this.DRAG_AND_DROP_TARGET_OVERLAY_ID
    },
    isValidFileDrag: function (a) {
        a = a.dataTransfer;
        return Sfdc.get(".multifile-upload-draganddrop-indicactor") && this.dragFromOS && (Sfdc.userAgent.isIE10 || Sfdc.userAgent.isIE11 ||
            a && "none" != a.effectAllowed && (a.files || !Sfdc.userAgent.isWebkit && a.types.contains && a.types.contains("Files")))
    },
    isDragAndDropInProgress: function () {
        return this.isEntered
    }
};
Sfdc.ns("Sfdc.MultiFileUploaderUiComponents.FileUploadBadge");
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge = function (a, b, c, g, d) {
    d = Sfdc.MultiFileUploaderUiComponents.FileUploadBadge;
    var e = d.makeFileTypeIcon(b.type),
        h = b.name,
        k = b.name,
        f = Sfdc.MultiFileUploaderUtil.formatFileSize(b.size),
        f = LC.getLabel("ChatterFileMultiUpload", "valueInParentheses", f);
    d = Sfdc.String.format(d.HTML_TEMPLATE, {
        type: e,
        name: h,
        title: k,
        size: f
    });
    this.dom = d = Sfdc.MultiFileUploaderUtil.createElementFromHTML(d);
    e = LC.getLabel("ChatterFileMultiUpload", "waiting");
    Sfdc.get(".multifile-upload-status",this.dom).innerHTML = e;
    this.fileDoesNotMeetLimits = !1;
    this.progressBar = new Sfdc.MultiFileUploaderUiComponents.ProgressBar(Sfdc.get(".singleProgress", this.dom), g);
    b.size ? c && b.size > c && (this.displayWarningMessage(LC.getLabel("ChatterFileMultiUpload", "fileLargerThanMaxLimit", Sfdc.ChatterFileUploader.maxFileSizeLabel)), this.fileDoesNotMeetLimits = !0) : (this.displayWarningMessage(LC.getLabel("ChatterFileMultiUpload", "fileIsEmpty")), this.fileDoesNotMeetLimits = !0);
    d.mfuFileId = a
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.HTML_TEMPLATE = '\x3cli class\x3d"multi-item"\x3e\x3cspan class\x3d"multifile-upload-file"\x3e\x3cspan class\x3d"multifile-upload-type"\x3e{type}\x3c/span\x3e\x3cspan class\x3d"multifile-upload-name" title\x3d"{title}"\x3e{name}\x3c/span\x3e\x3cspan class\x3d"multifile-upload-size"\x3e{size}\x3c/span\x3e\x3c/span\x3e\x3cspan class\x3d"singleProgress"\x3e\x3cspan\x3e\x3c/span\x3e\x3c/span\x3e\x3cspan class\x3d"warningMessage hidden"\x3e\x3cspan class\x3d"warningMessageSpan"\x3e\x3c/span\x3e\x3c/span\x3e\x3cspan class\x3d"multifile-upload-status"\x3e\x3c/span\x3e\x3ca class\x3d"multifile-upload-cancel" href\x3d"javascript:void(0);"\x3e\x3cimg title\x3d"" alt\x3d"" src\x3d"/s.gif" class\x3d"deleteIconClass"/\x3e\x3c/a\x3e\x3cimg title\x3d"" alt\x3d"" src\x3d"/s.gif" class\x3d"uploadDoneIconClass hidden"/\x3e\x3cimg title\x3d"" alt\x3d"" src\x3d"/s.gif" class\x3d"uploadWarningIconClass hidden"/\x3e\x3c/li\x3e';
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.CSS = {
    successClass: "successClass",
    failClass: ""
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.makeFileTypeIcon = function (a) {
    return '\x3cimg height\x3d"16" width\x3d"16" src\x3d"/s.gif"  class\x3d"' + Sfdc.MultiFileUploaderUtil.formatFileTypeCSS(a, "16") + '" /\x3e'
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.prototype.updateProgressBar = function (a) {
    this.progressBar.update(a)
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.prototype.updateFileProgressPercentage = function (a) {
    Sfdc.get(".multifile-upload-status", this.dom).innerHTML = a + "%"
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.prototype.displayWarningMessage = function (a) {
    Sfdc.Dom.addClass(this.dom, "warningBackGround");
    Sfdc.Dom.hideByDisplay(Sfdc.get(".singleProgress", this.dom));
    Sfdc.Dom.show(Sfdc.get(".warningMessage", this.dom));
    var b = Sfdc.get(".warningMessageSpan", this.dom);
    Sfdc.Dom.setText(b, a);
    Sfdc.Dom.addClass(b, "warningLabelInRed");
    Sfdc.Dom.addClass(Sfdc.get(".multifile-upload-cancel", this.dom), "hidden");
    Sfdc.Dom.removeClass(Sfdc.get(".uploadWarningIconClass", this.dom),        "hidden");
    Sfdc.Dom.hideByVisibility(Sfdc.get(".multifile-upload-status", this.dom))
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.prototype.displayAsCanceled = function () {
    var a = this.dom;
    Sfdc.Dom.addClass(a, "warningBackGround");
    a && (a.isAbort = !0);
    Sfdc.Dom.hideByVisibility(Sfdc.get(".singleProgress", a));
    Sfdc.Dom.hideByVisibility(Sfdc.get(".multifile-upload-cancel", a));
    a = Sfdc.get(".multifile-upload-status", a);
    Sfdc.Dom.setText(a, LC.getLabel("ChatterFileMultiUpload", "cancelled"));
    Sfdc.Dom.hasClass(a, "doneLabelInGreen") && Sfdc.Dom.removeClass(a, "doneLabelInGreen");
    Sfdc.Dom.addClass(a,        "warningLabelInRed")
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.prototype.displayAsCompleted = function (a) {
    var b = this.dom;
    if (b) {
        var c = Sfdc.get(".multifile-upload-status", b);
        Sfdc.Dom.addClass(c, "doneLabelInGreen");
        Sfdc.Dom.hideByVisibility(Sfdc.get(".singleProgress", b));
        c.innerHTML = LC.getLabel("ChatterFileMultiUpload", "done");
        Sfdc.Dom.hasClass(c, "warningLabelInRed") && Sfdc.Dom.removeClass(c, "warningLabelInRed");
        Sfdc.Dom.addClass(Sfdc.get(".multifile-upload-cancel", b), "hidden");
        Sfdc.Dom.removeClass(Sfdc.get(".uploadDoneIconClass", b),
            "hidden")
    }
    a && "Success" === a.message ? Sfdc.Dom.addClass(b, Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.CSS.successClass) : Sfdc.Dom.addClass(b, Sfdc.MultiFileUploaderUiComponents.FileUploadBadge.CSS.failClass)
};
Sfdc.ns("Sfdc.MultiFileUploaderBase");
Sfdc.MultiFileUploaderBase = function (b) {
    this.config = {
        uploadActionUrl: "",
        statsActionUrl: "",
        params: {},
        uploadBtnAnchor: null,
        maxFileSize: 0,
        progressBarWidth: 150,
        overallProgressBarWidth: 250,
        onStartCallback: function (a, b) { },
        onProgressCallback: function (a, b, d, e) { },
        onCompleteCallback: function (a, b, d) { },
        onCancelCallback: function (a, b) { },
        onErrorCallback: function (a, b, d) { },
        errMsg: {
            leavePage: LC.getLabel("ChatterFileMultiUpload", "leavingUploadWarningMsg")
        }
    };
    Sfdc.MultiFileUploaderUtil.extend(this.config, b);
    this.totalNumberOfFilesSelected = this.completedSize = this.selectedSize = this.filesInProgress = this.filesCompleted = this.filesSelected = 0;
    this.uploadHandler = this.createUploadHandler();
    this.config.uploadBtnAnchor && (this.uploadButton = this.hookupUploadButton(this.config.uploadBtnAnchor));
    this.uploadToFolderId = this.config.fldr;
    this.preventLeaveInProgress()
};
Sfdc.MultiFileUploaderBase.prototype = {
    uploadFiles: function (b) {
        if (b) {
            for (var a = 0; a < b.length; a++) this.scheduleFileUpload(b[a]);
            this.afterAllFileUploadsScheduled()
        }
    },
    onStartHandler: function (b, a) {
        this.filesInProgress++;
        this.filesSelected++;
        a && (this.selectedSize += a.size)
    },
    onProgressHandler: function (b, a, c, d) { },
    onCompleteHandler: function (b, a, c) {
        this.filesInProgress--;
        this.filesCompleted++;
        a && (this.completedSize += a.size)
    },
    onCancelHandler: function (b, a) {
        this.filesInProgress--;
        this.filesSelected--;
        a && (this.selectedSize -= a.size)
    },
    onErrorHandler: function (b, a, c) { },
    afterAllFileUploadsScheduled: function () { },
    scheduleFileUpload: function (b) {
        this.totalNumberOfFilesSelected++;
        var a = this.uploadHandler.addToUploadList(b);
        !1 !== this.config.onStartCallback(a, b) && this.onStartHandler(a, b) && (Sfdc.MultiFileUploaderUtil.checkFileSyncOption(), this.uploadHandler.scheduleUpload(a, {
            fileSync: Sfdc.ChatterFileUploader.isFileSync,
            filterParentId: this.filterParentId,
            fldr: this.uploadToFolderId,
            params: this.config.params
        }))
    },
    hookupUploadButton: function (b) {
        var a = this;
        return new Sfdc.UploadButton({
            uploadBtnAnchor: b,
            onChange: function (b) {
                a.uploadFiles(b.files)
            }
        })
    },
    createUploadHandler: function () {
        var b = this;
        return new Sfdc.ChatterFileUploadHandler({
            uploadActionUrl: this.config.uploadActionUrl,
            uploader: this,
            onProgressCallback: function (a, c, d, e) {
                b.onProgressHandler(a, c, d, e);
                b.config.onProgressCallback(a, c, d, e)
            },
            onCompleteCallback: function (a, c, d) {
                b.onCompleteHandler(a, c, d);
                b.config.onCompleteCallback(a, c, d)
            },
            onCancelCallback: function (a, c) {
                b.onCancelHandler(a, c);
                b.config.onCancelCallback(a,
                    c)
            },
            onErrorCallback: function (a, c, d) {
                b.onErrorHandler(a, c, d);
                b.config.onErrorCallback(a, c, d)
            },
            customHandlers: this.config.customHandlers
        })
    },
    preventLeaveInProgress: function () {
        var b = this,            a = this.config.errMsg.leavePage;
        Sfdc.on(window, "beforeunload", function (c) {
            if (b.filesSelected !== b.filesCompleted) return c = c || window.event, c.returnValue = a
        })
    }
};
Sfdc.ns("Sfdc.SWFUploadButton");
Sfdc.SWFUploadButton = function (a) {
    this.swfUrlPrefix = a.swfUrlPrefix;
    this.uploadDlgConfig = a.uploadDlgConfig;
    Sfdc.UploadButton.apply(this, arguments)
};
Sfdc.MultiFileUploaderUtil.extend(Sfdc.SWFUploadButton.prototype, Sfdc.UploadButton.prototype);
Sfdc.SWFUploadButton.SWF_BUTTON_ID = "multiFileUploaderSwfBtn";
Sfdc.SWFUploadButton.SUPPORTED_FLASH_VERSION = 11;
Sfdc.MultiFileUploaderUtil.extend(Sfdc.SWFUploadButton.prototype, {
    createInputBtn: function () {
        Sfdc.get("uploadFileButtonLink").innerHTML = LC.getLabel("ChatterFilesTabPage", "uploadMultiFilesLinkText");
        var a = this.swfUrlPrefix + "/flex/MultiFileUploader.swf",b = Sfdc.MultiFileUploaderUtil.createElementFromHTML('\x3cdiv class\x3d"swfbtn-panel"\x3e\x3cdiv id\x3d"' + Sfdc.SWFUploadButton.SWF_BUTTON_ID + '"\x3e\x26nbsp;\x3c/div\x3e\x3c/div\x3e');
        this.uploadBtnAnchor.appendChild(b);
        swfobject.embedSWF(a, Sfdc.SWFUploadButton.SWF_BUTTON_ID,"100%", "100%", Sfdc.SWFUploadButton.SUPPORTED_FLASH_VERSION.toString(), "", {}, {
                codebase: "http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab",
                src: a,
                quality: "high",
                play: "true",
                loop: "false",
                pluginspage: "http://www.adobe.com/go/getflashplayer",
                name: Sfdc.SWFUploadButton.SWF_BUTTON_ID,
                allowScriptAccess: "sameDomain",
                movie: a,
                type: "application/x-shockwave-flash",
                wmode: "transparent"
            });
        return b
    }
});
Sfdc.ns("Sfdc.SingleUploadButton");
Sfdc.SingleUploadButton = function (a) {
    Sfdc.UploadButton.apply(this, arguments)
};
Sfdc.MultiFileUploaderUtil.extend(Sfdc.SingleUploadButton.prototype, Sfdc.UploadButton.prototype);
Sfdc.MultiFileUploaderUtil.extend(Sfdc.SingleUploadButton.prototype, {
    createInputBtn: function () {
        var a = this.createHiddenInputBtn();
        addEvent(a, "mouseover", function () {
            var b = a.parentNode.firstChild;
            b && Sfdc.Dom.addClass(b, "ahover")
        });
        addEvent(a, "mouseout", function () {
            var b = a.parentNode.firstChild;
            b && Sfdc.Dom.removeClass(b, "ahover")
        });
        return a
    }
});
Sfdc.ns("Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList");
Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList = function (a) {
    this.fileUploadListContainerId = a.fileUploadListContainerId;
    this.fileUploadListContainerElem = document.getElementById(this.fileUploadListContainerId);
    this.fileUploadListContainerElem.innerHTML = Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList.HTML_TEMPLATE;
    this.fileUploadListElem = a.fileUploadListElem || Sfdc.get("multifile-upload-list", this.fileUploadListContainerElem);
    this.cancelFileUploadCallback = a.cancelFileUploadCallback;
    this.idToFileUploadBadge = {};
    this.setupCancelAction()
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList.HTML_TEMPLATE = '\x3cul id\x3d"multifile-upload-list" class\x3d"multifile-upload-list"\x3e\x3c/ul\x3e';
Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList.prototype.setupCancelAction = function () {
    var a = this;
    addEvent(this.fileUploadListElem, "click", function (b) {
        b = b || window.event;
        var c = b.target || b.srcElement;
        Sfdc.Dom.hasClass(c, "deleteIconClass") && (a.preventDefault(b), a.cancelFileUploadCallback(c.parentNode.parentNode))
    })
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList.prototype.preventDefault = function (a) {
    a.preventDefault ? a.preventDefault() : a.returnValue = !1
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList.prototype.add = function (a) {
    this.idToFileUploadBadge[a.dom.mfuFileId] = a;
    this.fileUploadListElem.appendChild(a.dom);
    a = Ext.fly(this.fileUploadListContainerId);
    var b = a.parent(".overlayDialog ").dom,
        c = b.id,
        b = b.offsetTop + b.offsetHeight,
        d = Sfdc.Window.getWindowHeight();
    b > d && (b -= d, d = a.getHeight(), d > b && a.setHeight(d - b), a.setStyle("overflow-y", "auto"), c && (a = sfdcPage.getDialogById(c)) && a.position())
};
Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList.prototype.get = function (a) {
    return this.idToFileUploadBadge[a]
};
window.Perf && Perf.enabled && Perf.mark("MultiFileUploader:Start");
Sfdc.ns("Sfdc.ChatterFileUploader");
Sfdc.ChatterFileUploader = function (a) {
    Sfdc.MultiFileUploaderBase.apply(this, arguments);
    Sfdc.MultiFileUploaderUtil.extend(this.config, {
        progressBarWidth: 200,
        overallProgressBarWidth: 330,
        fileUploadListContainerId: null,
        fileUploadListElem: null
    });
    Sfdc.MultiFileUploaderUtil.extend(this.config, a);
    this.ui = Sfdc.MultiFileUploaderUi;
    this.overallProgressBar = new Sfdc.MultiFileUploaderUiComponents.ProgressBar(Sfdc.get("overallProgress"), this.config.overallProgressBarWidth);
    var c = this, b = this.uploadHandler;
    this.fileUploadBadgeList =  new Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList({
            fileUploadListContainerId: this.config.fileUploadListContainerId,
            fileUploadListElem: this.config.fileUploadListElem,
            cancelFileUploadCallback: function (a) {
                if (Sfdc.MultiFileUploaderUtil.isIE9AndBelow()) {
                    Sfdc.ChatterFileSWFUploader.cancelCurrentUpload(a.mfuFileId);
                    var d = Sfdc.ChatterFileSWFUploader.getFileObj(a.mfuFileId);
                    c.onCancelHandler(a.mfuFileId, d);
                    c.config.onCancelCallback(a.mfuFileId, d)
                } else b.cancelCurrentUpload(a.mfuFileId), b.uploadNextIfNoneInProgress()
            }
        });
    this.filterParentId = this.config.filterParentId;
    this.uploadedDocId = null;
    var d = this.config.fileInput ? 1 : 2,
        e = Sfdc.ChatterFileUploader.getOriginOfMultiUpload(this.filterParentId);
    this.usageStats = new Sfdc.MultiFileUploaderUsageStats({
        filterParentId: this.config.filterParentId,
        origin: e,
        uploadMethod: d,
        statsActionUrl: this.config.statsActionUrl
    })
};
Sfdc.MultiFileUploaderUtil.extend(Sfdc.ChatterFileUploader.prototype, Sfdc.MultiFileUploaderBase.prototype);
Sfdc.MultiFileUploaderUtil.extend(Sfdc.ChatterFileUploader.prototype, {
    setUploadedDocId: function (a) {
        a && (this.uploadedDocId = a)
    },
    afterUploadFinished: function () {
        var a = this.filesCompleted,
            c = this.filesSelected;
        a < c ? this.ui.updateUploadingStatusInfoWithInProgressMessage(a, c) : this.afterAllUploadsFinished()
    },
    afterAllUploadsFinished: function () {
        var a = this.filesSelected;
        0 < this.filesCompleted ? this.ui.updateUploadingStatusInfoWithSuccessMessage(a) : this.ui.updateUploadingStatusInfoWithAllCanceledMessage(this.totalNumberOfFilesSelected);
        this.ui.hideOverallProgressBar();
        this.ui.hideCancelRemainingUploadsButton();
        this.ui.showCloseButton();
        this.shouldShowSharingSettingsButton() ? this.ui.showSharingSettingsBtn(Sfdc.AccessibleUploadFileDialog.getBaseUrl(), this.uploadedDocId) : this.ui.hideSharingSettingBtn();
        this.usageStats.sendUsageStats(this.filesSelected)
    },
    shouldShowSharingSettingsButton: function () {
        if (this.isSingleFileMode && this.uploadedDocId) {
            var a = Sfdc.ChatterFileUploader.getOriginOfMultiUpload(this.config.filterParentId);
            if (a != Sfdc.ChatterFileUploader.GROUP_PAGE &&
                a != Sfdc.ChatterFileUploader.PROFILE_PAGE) return !0
        }
        return !1
    },
    constructFileUploadBadge: function (a, c) {
        var b = new Sfdc.MultiFileUploaderUiComponents.FileUploadBadge(a, c, this.config.maxFileSize, this.config.progressBarWidth, this.isSingleFileMode);
        this.fileUploadBadgeList.add(b);
        return b
    },
    onStartHandler: function (a, c) {
        var b = new Sfdc.MultiFileUploaderFile(c);
        this.usageStats.start(b);
        b = this.constructFileUploadBadge(a, b);
        if (b.fileDoesNotMeetLimits) return !1;
        Sfdc.MultiFileUploaderBase.prototype.onStartHandler.apply(this,arguments);
        b.dom.isAbort = !1;
        return !0
    },
    onProgressHandler: function (a, c, b, d) {
        Sfdc.MultiFileUploaderBase.prototype.onProgressHandler.apply(this, arguments);
        var e = this.fileUploadBadgeList.get(a),
            h = e.dom;
        if (!h || !(h.isAbort && !0 === h.isAbort)) {
            e.updateProgressBar(b / d);
            if (b != d) {
                var l = Math.round(100 * (b / d));
                100 > l ? e.updateFileProgressPercentage(l) : (Sfdc.get(".multifile-upload-status", h).innerHTML = LC.getLabel("ChatterFileMultiUpload", "processing"), Sfdc.Dom.addClass(Sfdc.get(".multifile-upload-cancel", h), "hidden"))
            }
            this.filesCompleted < this.filesSelected && this.ui.updateUploadingStatusInfoWithInProgressMessage(this.filesCompleted, this.filesSelected);
            this.overallProgressBar.update((b + this.completedSize) / this.selectedSize)
        }
    },
    onCancelHandler: function (a, c) {
        Sfdc.MultiFileUploaderBase.prototype.onCancelHandler.apply(this, arguments);
        this.fileUploadBadgeList.get(a).displayAsCanceled();
        this.afterUploadFinished()
    },
    onErrorHandler: function (a, c, b) {
        a = Sfdc.MultiUploadErrorHandlingDialog.open(b);
        Sfdc.ChatterFileUploader.dragAndDropZone.errorDialog =  a;
        Sfdc.ChatterFileUploader.dragAndDropZone.isEntered = !1;
        Sfdc.AccessibleMultiUploadFilesDialog.isOpened() && Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon(!1)
    },
    onCompleteHandler: function (a, c, b) {
        var d = new Sfdc.MultiFileUploaderFile(c);
        this.usageStats.finish(d);
        Sfdc.MultiFileUploaderBase.prototype.onCompleteHandler.apply(this, arguments);
        this.fileUploadBadgeList.get(a).displayAsCompleted(b);
        this.setUploadedDocId(b.docid);
        this.afterUploadFinished()
    },
    cancelRemainingUploads: function () {
        Sfdc.MultiFileUploaderUtil.isIE9AndBelow() ?
            Sfdc.ChatterFileSWFUploader.cancelRemainingUploads() : this.uploadHandler.cancelRemainingUploads()
    },
    afterAllFileUploadsScheduled: function () {
        (this.isSingleFileMode = 1 === this.totalNumberOfFilesSelected) ? (this.ui.hideOverallProgressBar(), this.ui.hideListTableHeader(), this.ui.showSingleFileModeUploadList()) : (this.ui.showOverallProgressBar(), this.ui.showListTableHeader(), this.ui.hideSharingSettingBtn());
        0 < this.filesInProgress ? (this.ui.hideCloseButton(), this.ui.showCancelRemainingUploadsButton()) : this.afterAllUploadsFinished()
    }
});
Sfdc.ChatterFileUploader.GROUP_ENTITY_PREFIX = "0F9";
Sfdc.ChatterFileUploader.PROFILE_ENTITY_PREFIX = "005";
Sfdc.ChatterFileUploader.ORG_ENTITY_PREFIX = "00D";
Sfdc.ChatterFileUploader.GROUP_PAGE = "GROUP_PAGE";
Sfdc.ChatterFileUploader.PROFILE_PAGE = "PROFILE_PAGE";
Sfdc.ChatterFileUploader.CHATTER_FILE_PAGE = "CHATTER_PAGE";
Sfdc.ChatterFileUploader.FILE_TAB_PAGE = "FILE_TAB_PAGE";
Sfdc.ChatterFileUploader.PUBLISHER = "PUBLISHER";
Sfdc.ChatterFileUploader.maxFileSize = 0;
Sfdc.ChatterFileUploader.maxFileSizeLabel = "";
Sfdc.ChatterFileUploader.ACTION_URL = "/chatterfile/";
Sfdc.ChatterFileUploader.createInstance = function (a, c) {    
    var b = a.fileInput,
        d = {
            fileUploadListContainerId: "multiUploadListPanel",
            fileInput: b,
            maxFileSize: Sfdc.ChatterFileUploader.maxFileSize,
            filterParentId: c,
            uploadActionUrl: Sfdc.MultiFileUploaderUtil.getActionUrl() + Sfdc.ChatterFileUploader.ACTION_URL,
            statsActionUrl: Sfdc.ChatterFileUploader.ACTION_URL
        };
    Sfdc.MultiFileUploaderUtil.extend(d, a);
    d = new Sfdc.ChatterFileUploader(d);
    //debugger;
    b && d.uploadFiles(b.files);
    return d
};
Sfdc.ChatterFileUploader.dragAndDropZone = null;
Sfdc.ChatterFileUploader.setupPageDragDropZone = function (a) {
    Sfdc.ChatterFileUploader.setupDropZoneSavedConfig = a;
    if (!Sfdc.ChatterFileUploader.dragAndDropZone) {
        var c = new Sfdc.UploadFileDragDropZone({
            onEnterCallback: function () {
                c.isEntered = !0;
                c.createDragAndDropOverlay();
                if (Sfdc.AccessibleMultiUploadFilesDialog.isOpened()) Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon(!0);
                else {
                    var a = Sfdc.ChatterFileUploader.setupDropZoneSavedConfig;
                    a.fileInput = null;
                    a.displayDDTargetIcon = !0;
                    Sfdc.AccessibleMultiUploadFilesDialog.open(a)
                }
            },
            onDropCallback: function (a) {
                c.isEntered = !1;
                c.destroyDragAndDropOverlay();
                a = Sfdc.MultiFileUploaderUtil.processDirectoriesInFileList(a.dataTransfer);
                var d = Sfdc.AccessibleMultiUploadFilesDialog.uploader;
                0 < a.length && d ? (Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon(!1), d.uploadFiles(a)) : Sfdc.AccessibleMultiUploadFilesDialog.closeIt(!0)
            },
            onLeaveCallback: function () {
                c.isEntered = !1;
                c.destroyDragAndDropOverlay();
                var a = Sfdc.AccessibleMultiUploadFilesDialog.uploader;
                a && 0 === a.filesCompleted +
                    a.filesInProgress ? Sfdc.AccessibleMultiUploadFilesDialog.closeIt() : Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon(!1)
            }
        });
        Sfdc.ChatterFileUploader.dragAndDropZone = c
    }
};
Sfdc.ChatterFileUploader.getOriginOfMultiUpload = function (a) {
    return a && a.substr(0, 3) === Sfdc.ChatterFileUploader.GROUP_ENTITY_PREFIX && 0 < window.location.href.indexOf("GroupFileListPage") ? Sfdc.ChatterFileUploader.GROUP_PAGE : a && a.substr(0, 3) === Sfdc.ChatterFileUploader.PROFILE_ENTITY_PREFIX && 0 < window.location.href.indexOf("UserFileListPage") ? Sfdc.ChatterFileUploader.PROFILE_PAGE : 0 < window.location.href.indexOf("ChatterPage") ? Sfdc.ChatterFileUploader.CHATTER_FILE_PAGE : Sfdc.ChatterFileUploader.FILE_TAB_PAGE
};
Sfdc.ChatterFileUploader.isMultiFileUpload = !1;
Sfdc.ChatterFileUploader.isIEMultiFileUpload = !1;
Sfdc.ChatterFileUploader.isFileSync = !1;
Sfdc.ChatterFileUploader.createAndAttachUploadButton = function (a, c) {
   //debugger;
    new Sfdc.UploadButton({
        uploadBtnAnchor: a,
        onChange: function (a) {
            c.fileInput = a;
            c.displayDDTargetIcon = !1;
            Sfdc.AccessibleMultiUploadFilesDialog.open(c)
        }
    })
};
Sfdc.ChatterFileUploader.hideUploadFileButtonLink = function () {
    Sfdc.Dom.hideByDisplay("uploadFileButtonLink")
};
Sfdc.ChatterFileUploader.addDragDropZoneButtonStyle = function (a) {
    Sfdc.Dom.addClass(a, "dragDropZoneButton")
};
Sfdc.ChatterFileUploader.addDragDropZoneDashedBorder = function (a) {
    Sfdc.Dom.addClass(a, "dragDropZoneDiv")
};
Sfdc.ChatterFileUploader.addIndicatorTextStringNonIE = function (a) {
    var c = document.createElement("div");
    c.setAttribute("class", "multifile-upload-draganddrop-indicactor");
    var b = document.createElement("span");
    b.appendChild(document.createTextNode(LC.getLabel("ChatterFileMultiUpload", "dragAndDropIndicatorNoIE")));
    c.appendChild(b);
    a.appendChild(c)
};
Sfdc.ChatterFileUploader.adjustParentStyling = function (a) {
    (a = Sfdc.Dom.getParent(a)) && Sfdc.Dom.addClass(a, "multiUploadControl")
};
Sfdc.ChatterFileUploader.hookupInputForMultiFileUpload = function (a) {
    var c = a.btnDivId,
        b = a.enableMultiFileUploading,
        d = a.enableMultiFileUploadingForIE,
        e = a.filterParentId,
        h = a.parentEntityName,
        l = a.maxFileSize,
        p = a.maxFileSizeLabel,
        q = a.swfUrlPrefix,
        f = a.multiUploadHelpUrl;
    a = a.fldr;
    var g = Sfdc.ChatterFileUploader.getOriginOfMultiUpload(e),
        k = {
            fileInput: null,
            displayDDTargetIcon: !1,
            filterParentId: e,
            parentEntityName: h,
            uploaderOrigin: g
        };
    a && (k.fldr = a);
    Sfdc.ChatterFileUploader.maxFileSize = l;
    Sfdc.ChatterFileUploader.maxFileSizeLabel = p.replace(/&nbsp;/gi, " ");
    var e = document.getElementById("fileUploaderDiv"),
        m = document.getElementById(c);
    if (m)
        if (c = Ext.isWindows && Sfdc.userAgent.isSafari, b && Sfdc.MultiFileUploaderUtil.isMultiFileUploadSupported() && !c) Sfdc.ChatterFileUploader.isMultiFileUpload = !0, Sfdc.ChatterFileUploader.hideUploadFileButtonLink(), Sfdc.ChatterFileUploader.createAndAttachUploadButton(m, k), Sfdc.ChatterFileUploader.setupPageDragDropZone(k), Sfdc.ChatterFileUploader.addDragDropZoneButtonStyle(m), Sfdc.ChatterFileUploader.addDragDropZoneDashedBorder(e),
            Sfdc.ChatterFileUploader.addIndicatorTextStringNonIE(e), Sfdc.ChatterFileUploader.adjustParentStyling(e);
        else if (c = swfobject.getFlashPlayerVersion().major, b && d && Sfdc.userAgent.isIE && c >= Sfdc.SWFUploadButton.SUPPORTED_FLASH_VERSION) Sfdc.ChatterFileUploader.isMultiFileUpload = !0, Sfdc.ChatterFileUploader.isIEMultiFileUpload = !0, Sfdc.AccessibleMultiUploadFilesDialog.loadForm(k, function () {
            Sfdc.ChatterFileSWFUploader.setSwfUploadButton(new Sfdc.SWFUploadButton({
                uploadBtnAnchor: m,
                swfUrlPrefix: q,
                uploadDlgConfig: k,
                openUploadDialog: function () {
                    k.fileInput = null;
                    k.displayDDTargetIcon = !1;
                    Sfdc.AccessibleMultiUploadFilesDialog.open(k)
                }
            }))
        }), Sfdc.Dom.addClass(e, "dragDropZoneDivNoBorder"), Sfdc.ChatterFileUploader.addDragDropZoneButtonStyle(m), b = document.createElement("div"), Sfdc.Dom.addClass(b, "multifile-upload-draganddrop-indicactor"), d = document.createElement("span"), Sfdc.Dom.addClass(d, "multifile-upload-draganddrop-indicactor-tip"), d.appendChild(document.createTextNode(LC.getLabel("ChatterFileMultiUpload", "tip"))),
        b.appendChild(d), d = document.createElement("span"), d.appendChild(document.createTextNode(LC.getLabel("ChatterFileMultiUpload", "dragAndDropIndicatorIE"))), b.appendChild(d), d = document.createElement("a"), Sfdc.Dom.addClass(d, "multifile-upload-draganddrop-indicactor-help"), d.setAttribute("href", f), d.appendChild(document.createTextNode(LC.getLabel("ChatterFilePublishOverlay", "learnMoreLinkText"))), b.appendChild(d), e.appendChild(b), Sfdc.ChatterFileUploader.adjustParentStyling(e);
        else {
            Sfdc.userAgent.isChrome && (f = Sfdc.get(".uploadArrow", Sfdc.get("fileUploadBtnDiv")), Sfdc.Dom.addClass(f, "uploadArrowWithMorePadding"));
            var n = {
                title: LC.getLabel("ChatterFilesTabPage", "uploadFileDialogTitle")
            };
            a && (n.fldr = a);
            addEvent(m, "click", function () {
                Sfdc.AccessibleUploadFileDialog.open(n)
            })
        }
    Sfdc.ChatterFileUploader.config = k;
    Sfdc.Dom.show(e)
};
Sfdc.ChatterFileUploader.hookupInputForSingleFileUpload = function (a, c, b) {
    Sfdc.ChatterFileUploader.maxFileSize = c;
    Sfdc.ChatterFileUploader.maxFileSizeLabel = b.replace(/&nbsp;/gi, " ");
    if ((a = document.getElementById(a)) && Sfdc.MultiFileUploaderUtil.isFileAPISupported() && (Sfdc.userAgent.isSafari || Sfdc.userAgent.isChromium)) Sfdc.ChatterFileUploader.isMultiFileUpload = !1, new Sfdc.SingleUploadButton({
        uploadBtnAnchor: a,
        onChange: function (a) {
            chatter.getPublisher().getHandler("ContentPost").fileNewInfoUpdate(a)
        }
    })
};
Sfdc.ChatterFileUploader.setVisible = function (a) {
    var c = document.getElementById("fileUploaderDiv");
    c && (!1 === a ? Sfdc.Dom.hideByDisplay(c) : Sfdc.Dom.show(c))
};
Sfdc.ns("Sfdc.ChatterFileSWFUploader");
Sfdc.ChatterFileSWFUploader = function () {
    var a = null,
        c = null,
        b = {},
        d = 0,
        e = null,
        h = null,
        l = function () {
            c.each(function (a) {
                a = c.get(a);
                var b = a.index;
                b >= d && (Sfdc.ChatterFileSWFUploader.cancelCurrentUpload(parseInt(b, 10), !0), e.onCancelHandler(parseInt(b, 10), a), e.config.onCancelCallback(parseInt(b, 10), a))
            });
            e.afterAllUploadsFinished()
        };
    return {
        setSwfUploadButton: function (c) {
            a = c
        },
        startSelectFileCallback: function () {
            a.config.openUploadDialog();
            c = new Map;
            e = Sfdc.AccessibleMultiUploadFilesDialog.uploader;
            e.totalNumberOfFilesSelected =
                0;
            e.filesCompleted = 0;
            e.filesSelected = 0;
            var b = Sfdc.SWFUploadButton.SWF_BUTTON_ID;
            h = Sfdc.userAgent.isIE ? document.getElementById(b) : document[b]
        },
        selectFileCallback: function (a, d, f, g) {
            f = {
                index: a,
                name: d,
                size: f,
                type: g
            };
            c.put(d, f);
            b[a] = f;
            e.totalNumberOfFilesSelected++;
            e.onStartHandler(a, f);
            Sfdc.userAgent.isIE7 && Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadCancelRemainingBtn"));
            e.afterAllFileUploadsScheduled()
        },
        uploadProgressCallback: function (a, b, d) {
            a = c.get(a);
            e.onProgressHandler(a.index, a, b, d);
            e.config.onProgressCallback(a.index,
                a, b, d)
        },
        uploadCompleteCallback: function (a) { },
        uploadCompleteDataCallback: function (a, b) {
            var f = c.get(a);
            d = f.index;
            var g = Sfdc.MultiFileUploaderUtil.parseResponseResult(b);
            if ("Failure" === g.message) return g.html = g.html && chatter.getFileUploader().getBase64Decoder().decode(g.html), Sfdc.MultiUploadErrorHandlingDialog.open(g.html), "true" === g.ignoreIt ? (Sfdc.ChatterFileSWFUploader.cancelCurrentUpload(parseInt(d, 10)), e.onCancelHandler(parseInt(d, 10), f), e.config.onCancelCallback(parseInt(d, 10), f)) : l(), g.ignoreIt;
            e.onCompleteHandler(f.index, f, g);
            e.config.onCompleteCallback(f.index, f, g);
            e.setUploadedDocId(g.docid);
            0 === e.filesSelected ? e.overallProgressBar.update(0) : e.afterUploadFinished();
            d++;
            return "true"
        },
        ioErrorCallback: function (a) { },
        getRequestToken: function () {
            return chatter.getToolbox().token()
        },
        getActionRequestUrl: function () {
            return Sfdc.MultiFileUploaderUtil.getActionUrl() + Sfdc.ChatterFileUploader.ACTION_URL
        },
        getFilterParentId: function () {
            return e.filterParentId
        },
        getFolderId: function () {
            return e.config.fldr
        },
        getIsFileSync: function () {
            Sfdc.MultiFileUploaderUtil.checkFileSyncOption();
            return Sfdc.ChatterFileUploader.isFileSync ? "true" : "false"
        },
        cancelCurrentUpload: function (a, b) {
            !0 !== b && (b = !1);
            h.cancelUpload(a, b)
        },
        cancelRemainingUploads: function () {
            l()
        },
        getFileObj: function (a) {
            return b[a]
        }
    }
} ();
window.Perf && Perf.enabled && Perf.endMark("MultiFileUploader:Start");
//# sourceMappingURL=/javascript/1410512610000/sfdc/source/ChatterFiles.js.map
