/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Sfdc.provide("Sfdc.Activity.ManyWhoFunction", {
     isWhoSelectedFromMru: !1,
     isWhoSelectedFromPicker: !1,
     setRefVarsForManyWho: function (a, b, c, d) {
         c && (d = document.getElementById(d + EditElement.pID_SUFFIX), this.hasMultiOwnerDisplay = 0 < d.value.indexOf(TaskUi.ASSIGNEE_SEPARATOR) || d.value != Udd.EMPTY_KEY && "005" != d.value.substring(0, 3), this.changeOwnerButtonId = c);
         this.recurrenceElementId = b;
         this.hasRecurrence = !1;
         if (b = document.getElementById(b)) this.hasRecurrence = b.checked;
         if (b = document.getElementById(ActivityPage.DISABLED_RECURRENCE_MSG_DIV)) this.recurringElementGroupTaskWarningMessage =
             b.innerHTML, this.recurringElementMultipleContactsWarningMessage = a ? LC.getLabel("Page_Event", "ManyWhoRecurringSeriesWarning") : LC.getLabel("Page_Task", "ManyWhoRecurringSeriesWarning");
         this.selectedManyWhoCount = -1;
         this.selectedItems = {
             left: {},
             right: {}
         };
         this.elementToDataMapping = {}
     },
     launchWhoPicker: function () {
         Sfdc.Activity.PeoplePicker.who || (Sfdc.Activity.PeoplePicker.who = new Sfdc.Activity.PeoplePicker(MWPicker.MW_PICKER_ID));
         Sfdc.Activity.PeoplePicker.who.toggleOverlayPanel()
     },
     setLookupInfo: function (a,
         b, c) {
         this.whoFieldBaseName = a;
         this.isEvent = b;
         this.privateCheckboxId = c;
         this.manyWhoAllowed = !0;
         a = parseInt(document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_ACCESS_BIT_SUFFIX).value, "10");
         if (1 === a || 2 === a) b = document.getElementById(this.whoFieldBaseName), a = document.createElement("textarea"), a.setAttribute("id", this.whoFieldBaseName + ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX), a.setAttribute("class", "manyWhoContactFieldEmpty"), a.setAttribute("readOnly", "readonly"), a.setAttribute("cols",
                 "30"), a.setAttribute("rows", "1"), a.setAttribute("onclick", "setLastMousePosition(event); Sfdc.Activity.ManyWhoFunction.launchWhoPicker();"), a.setAttribute("title", b.title), a.setAttribute("tabIndex", b.tabIndex), b.parentNode && "lookupInput" === b.parentNode.className ? b.parentNode.insertBefore(a, b) : this.isWhoAmbiguous() && (b = document.getElementById(this.whoFieldBaseName + EditElement.pID_SUFFIX), b.parentNode.insertBefore(a, b)), a = !this.hasRecurrence, this.hasMultiOwnerDisplay && (a = a && !this.hasMultiOwnerDisplay),
             this.manyWhoAllowed = a, this.flipManyWhoContactField(), this.populateWhoFieldForExistingTask()
     },
     updateManyWhoFieldStyles: function () {
         var a = document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX);
         a && (this.isNullOrEmpty(a.value) ? a.setAttribute("class", "manyWhoContactFieldEmpty") : (a.setAttribute("class", "manyWhoContactFieldPopulated"), a.clientHeight < a.scrollHeight && (a.style.height = a.scrollHeight + "px", a.clientHeight < a.scrollHeight && (a.style.height = 2 * a.scrollHeight - a.clientHeight +
             "px"))))
     },
     setManyWhoContactValues: function (a, b, c) {
         if (a && b) {
             a.value = b.join(LC.getLabel("Global", "listDelimiter"));
             this.selectedManyWhoCount = b.length;
             this.onContactsSelected(b.length);
             a = this.getSingleWhoElements();
             if (0 < this.selectedManyWhoCount) {
                 a.swModFlagField.value = "1";
                 a.swWhoTypeField.value = "003";
                 a.swNameField.value = b[0];
                 if (this.isWhoAmbiguous()) {
                     var d = this.getAmbiguousWhoSelectOptionIndex(c[0]); -1 === d ? (a.swIdField.appendChild(new Option(b[0], c[0])), a.swIdField.childNodes[a.swIdField.childNodes.length -
                         1].selected = "selected") : a.swIdField.childNodes[d].selected = "selected"
                 } else a.swIdField.value = c[0];
                 a.swWhoField.value = b[0]
             }
             0 === this.selectedManyWhoCount && (a.swModFlagField.value = "1", a.swWhoTypeField.value = "003", a.swNameField.value = "", a.swIdField.value = "", a.swWhoField.value = "");
             this.updateManyWhoFieldStyles()
         }
     },
     getAmbiguousWhoSelectOptionIndex: function (a) {
         for (var b = this.getSingleWhoElements().swIdField.childNodes, c = 0; c < b.length; c++)
             if (b[c].value === a) return c;
         return -1
     },
     getWhosInfo: function (a) {
         var b =
             this.getManyWhoElements(),
             c = b.mwIdField.value;
         if (c && 0 < c.length) {
             var d = [],
                 c = c.split(",");
             if (c[0] && 0 < c[0].length)
                 for (var e = Sfdc.JSON.parse(b.mwNameField.value), g = Sfdc.JSON.parse(b.mwTitleField.value), h = Sfdc.JSON.parse(b.mwCompanyField.value), b = Sfdc.JSON.parse(b.mwOwnerField.value), f = 0; f < c.length; f++) d.push({
                     id: c[f],
                     name: a.escapeHTMLValue(e[f]),
                     title: a.escapeHTMLValue(g[f]),
                     company: a.escapeHTMLValue(h[f]),
                     owner: a.escapeHTMLValue(b[f])
                 });
             return d
         }
         return null
     },
     flipManyWhoContactField: function () {
         if (!1 === this.manyWhoAllowed) this.adjustVisibilityOfManyWhoField(!1);
         else {
             var a = parseInt(document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_ACCESS_BIT_SUFFIX).value, "10"),
                 b = document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_ID_ELEMENT_SUFFIX).value.split(",").length;
             1 === a ? this.isWhoAContact() ? (this.adjustVisibilityOfManyWhoField(1 >= b ? !1 : !0), this.isEvent && ActivityFunction.adjustPrivate(this.privateCheckboxId), this.onContactsSelected(this.selectedManyWhoCount)) : (this.adjustVisibilityOfManyWhoField(!1),
                 this.onContactsSelected(0)) : 2 === a && (this.adjustVisibilityOfManyWhoField(1 >= b ? !1 : !0), this.onContactsSelected(this.selectedManyWhoCount))
         }
     },
     adjustVisibilityOfManyWhoField: function (a) {
         var b = document.getElementById(this.whoFieldBaseName),
             c = document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX);
         !0 === a ? (c.style.display = "inline", c.style.visibility = "visible", b.style.display = "none", b.style.visibility = "hidden", this.updateManyWhoFieldStyles(), this.isWhoAmbiguous() && this.toggleAmbiguousWhoElem(!1)) :
             (c.style.display = "none", c.style.visibility = "hidden", b.style.display = "inline", b.style.visibility = "visible", this.isWhoAmbiguous() && this.toggleAmbiguousWhoElem(!0))
     },
     isWhoAmbiguous: function () {
         var a = document.getElementById(this.whoFieldBaseName + EditElement.pID_SUFFIX);
         return a && "SELECT" === a.tagName && a.parentNode && "lookupInput" === a.parentNode.className
     },
     toggleAmbiguousWhoElem: function (a) {
         var b = document.getElementById(this.whoFieldBaseName + EditElement.pID_SUFFIX),
             c = this.getWhoErrorMsgElem();
         a ? (b.style.display = "inline", b.style.visibility = "visible", c.style.display = "block", c.style.visibility = "visible") : (b.style.display = "none", b.style.visibility = "hidden", c.style.display = "none", c.style.visibility = "hidden")
     },
     getWhoErrorMsgElem: function () {
         for (var a = document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX).parentNode.parentNode.childNodes, b = 0; b < a.length; b++)
             if ("errorMsg" === a[b].className) return a[b]
     },
     onRecurrenceChange: function () {
         var a = document.getElementById(this.recurrenceElementId);
         a && (this.manyWhoAllowed = !a.checked)
     },
     onContactsSelected: function (a) {
         var b = document.getElementById(this.recurrenceElementId),
             c = document.getElementById(ActivityPage.DISABLED_RECURRENCE_MSG_DIV);
         1 < a ? (b && (b.checked = !1, b.disabled = !0, c && (c.innerHTML = this.recurringElementMultipleContactsWarningMessage, c.style.visibility = "visible")), this.changeOwnerButtonId && TaskEditPage.allowGroupTasks(!0, this.changeOwnerButtonId)) : 0 <= a && (b && (b.disabled = !1, c && (c.innerHTML = this.recurringElementGroupTaskWarningMessage, c.style.visibility =
             "hidden")), this.changeOwnerButtonId && TaskEditPage.allowGroupTasks(!1, this.changeOwnerButtonId))
     },
     populateWhoFieldForExistingTask: function () {
         var a = this.getManyWhoElements(),
             b = document.getElementById(this.whoFieldBaseName + EditElement.pID_SUFFIX).value,
             c = document.getElementById(this.whoFieldBaseName + EditElement.pOLD_NAME_SUFFIX).value,
             d = a.mwNameField.value,
             e = a.mwIdField.value,
             g = parseInt(a.mwAccessBitField.value, "10"),
             h = document.getElementById(this.whoFieldBaseName),
             f = a.mwContactField,
             e = e.split(","),
             k = [];
         e[0] && 0 < e[0].length && (k = Sfdc.JSON.parse(d));
         this.isWhoAContact() && (1 === g || 2 === g) && 0 < k.length && !0 === this.manyWhoAllowed ? (this.setManyWhoContactValues(f, k, e), h.value = k[0]) : (b && (b !== Udd.EMPTY_KEY && !this.isNullOrEmpty(c)) && (h.value = c), f.value = a.mwNameField ? a.mwNameField.value : "")
     },
     isNullOrEmpty: function (a) {
         return void 0 === a || "" === a || null === a || "null" === a
     },
     addManyWhos: function (a) {
         if (null !== this.whoFieldBaseName) {
             for (var b = this.getManyWhoElements(), c = [], d = [], e = [], g = [], h = [], f = 0, k; f < a.length; f++) k = a[f],
                 c.push(k.id), d.push(k.name), e.push(k.title), g.push(k.company), h.push(k.owner);
             b.mwIdField.value = c.join(",");
             b.mwNameField.value = Sfdc.JSON.stringify(d);
             b.mwTitleField.value = Sfdc.JSON.stringify(e);
             b.mwCompanyField.value = Sfdc.JSON.stringify(g);
             b.mwOwnerField.value = Sfdc.JSON.stringify(h);
             this.setManyWhoContactValues(b.mwContactField, d, c);
             this.isEvent && ActivityFunction.adjustPrivate(this.privateCheckboxId)
         }
     },
     clearManyWhoHtmlFields: function () {
         var a = this.getManyWhoElements();
         a.mwIdField.value = "";
         a.mwNameField.value = "";
         a.mwTitleField.value = "";
         a.mwCompanyField.value = "";
         a.mwOwnerField.value = "";
         this.selectedManyWhoCount = 0
     },
     launchSingleOrManyWhoPicker: function (a) {
         if (!0 === this.manyWhoAllowed && this.isWhoAContact()) Sfdc.Activity.ManyWhoFunction.launchWhoPicker(), 0 === document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_ID_ELEMENT_SUFFIX).value.length && (a = document.getElementById(this.whoFieldBaseName), 0 < a.value.length && Sfdc.Activity.PeoplePicker.who.performSearchFromWhoInput(a.value));
         else return a = a.split("'")[1].replace(/&amp;/g,
             "\x26"), openLookup(a + getElementByIdCS(this.whoFieldBaseName + EditElement.pTYPE_SUFFIX).value, 670, "1", "\x26" + LookupUi.pSEARCH_VALUE + "\x3d" + encodeURIComponent(getElementByIdCS(this.whoFieldBaseName).value.substring(0, 80)))
     },
     getManyWhoElements: function () {
         return {
             mwIdField: document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_ID_ELEMENT_SUFFIX),
             mwNameField: document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_NAME_ELEMENT_SUFFIX),
             mwTitleField: document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_TITLE_ELEMENT_SUFFIX),
             mwCompanyField: document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_COMPANY_ELEMENT_SUFFIX),
             mwOwnerField: document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_OWNER_ELEMENT_SUFFIX),
             mwContactField: document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX),
             mwAccessBitField: document.getElementById(this.whoFieldBaseName + ActivityUi.MANY_WHO_ACCESS_BIT_SUFFIX)
         }
     },
     getSingleWhoElements: function () {
         return {
             swIdField: document.getElementById(this.whoFieldBaseName +   EditElement.pID_SUFFIX),
             swNameField: document.getElementById(this.whoFieldBaseName + EditElement.pOLD_NAME_SUFFIX),
             swWhoTypeField: document.getElementById(this.whoFieldBaseName + EditElement.pTYPE_SUFFIX),
             swModFlagField: document.getElementById(this.whoFieldBaseName + EditElement.pMOD_SUFFIX),
             swWhoField: document.getElementById(this.whoFieldBaseName)
         }
     },
     toggleWhoTipElem: function (a) {
         var b = Sfdc.get(ActivityUi.WHO_TIP_DIV_ID);
         a ? (Sfdc.Activity.ManyWhoFunction.isWhoTypeSelectorVisible() || (b.style.marginLeft = "0px"),
             b.style.display = "block") : b.style.display = "none"
     },
     isWhoTypeSelectorVisible: function () {
         var a = Sfdc.get(this.whoFieldBaseName + MultiLookupInputElement.MULTI_LOOKUP_SELECT_SUFFIX);
         return null !== a && void 0 !== a
     },
     whoInputState: {
         WHO_SELECTED_FROM_MRU: "whoSelectedFromMru",
         WHO_SELECTED_FROM_PICKER: "whoSelectedFromPicker",
         MRU_HAS_SUGGESTIONS: "mruHasSuggestions",
         MRU_HAS_NO_SUGGESTION: "mruHasNoSuggestion",
         MRU_IS_DISABLED_OR_WHO_IS_EMPTY: "mruIsDisabledOrWhoIsEmpty"
     },
     detectAndToggleWhoTipElem: function (a) {
         if (!UserContext.userPreferences.getBoolean("HideManyWhoInlineEditTip")) {
             var b = Sfdc.get(this.whoFieldBaseName);
             if (a === Sfdc.Activity.ManyWhoFunction.whoInputState.WHO_SELECTED_FROM_MRU) Sfdc.Activity.ManyWhoFunction.isWhoSelectedFromMru = !0, Sfdc.Activity.ManyWhoFunction.toggleWhoTipElem(!1);
             else if (a === Sfdc.Activity.ManyWhoFunction.whoInputState.WHO_SELECTED_FROM_PICKER) Sfdc.Activity.ManyWhoFunction.isWhoSelectedFromPicker = !0, Sfdc.Activity.ManyWhoFunction.toggleWhoTipElem(!1);
             else if (a === Sfdc.Activity.ManyWhoFunction.whoInputState.MRU_HAS_SUGGESTIONS) Sfdc.Activity.ManyWhoFunction.toggleWhoTipElem(!1);
             else if (a === Sfdc.Activity.ManyWhoFunction.whoInputState.MRU_HAS_NO_SUGGESTION || a === Sfdc.Activity.ManyWhoFunction.whoInputState.MRU_IS_DISABLED_OR_WHO_IS_EMPTY) b && (0 === b.value.length || this.isWhoSelectedFromMru || this.isWhoSelectedFromPicker || !this.isWhoAContact() ? this.toggleWhoTipElem(!1) : 1 < b.value.length && this.toggleWhoTipElem(!0))
         }
     },
     isWhoAContact: function () {
         var a = document.getElementById(this.whoFieldBaseName + EditElement.pTYPE_SUFFIX);
         return a && "003" === a.value
     },
     detectAndToggleWhoTipElemKeyupHandler: function (a) {
         a = Sfdc.Event.getEvent(a);
         a = a.which || a.keyCode;
         if (a == Sfdc.Event.keyCode.BACKSPACE || 40 < a) this.isWhoSelectedFromMru || this.isWhoSelectedFromPicker ? this.isWhoSelectedFromPicker = this.isWhoSelectedFromMru = !1 : this.shouldLetMruAutoCompleteToggleWhoTipElem() || this.detectAndToggleWhoTipElem(Sfdc.Activity.ManyWhoFunction.whoInputState.MRU_IS_DISABLED_OR_WHO_IS_EMPTY)
     },
     shouldLetMruAutoCompleteToggleWhoTipElem: function () {
         var a = Sfdc.get(this.whoFieldBaseName),
             b = ForeignKeyInputElement.allElements[this.whoFieldBaseName];
         if (a && 0 < a.value.length && b.mruServletURI) return !0
     },
     dismissWhoTipElem: function () {
         UserContext.userPreferences.setBoolean("HideManyWhoInlineEditTip", !0, function () {
             Sfdc.Activity.ManyWhoFunction.toggleWhoTipElem(!1)
         })
     }
 });
Sfdc.Activity.ManyWhoAutoCompleteElement = function (a, b, c, d, e) {
    AutoCompleteInputElement.apply(this, [a, b, c, d, e]);
    this.requestingServeletResult = !1
};
Sfdc.Activity.ManyWhoAutoCompleteElement.prototype = new AutoCompleteInputElement;
Sfdc.Activity.ManyWhoAutoCompleteElement.prototype.retrieveFromServlet = function (a) {
    this.requestingServeletResult = !0;
    AutoCompleteInputElement.prototype.retrieveFromServlet.apply(this, [a])
};
Sfdc.Activity.ManyWhoAutoCompleteElement.prototype.hook_onFinishRetrievingServletResult = function () {
    this.requestingServeletResult = !1
};
Sfdc.Activity.ManyWhoAutoCompleteElement.prototype.complete = function () {
    var a = AutoCompleteInputElement.prototype.complete.apply(this);
    a && Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElem(Sfdc.Activity.ManyWhoFunction.whoInputState.WHO_SELECTED_FROM_MRU);
    return a
};
Sfdc.Activity.ManyWhoAutoCompleteElement.prototype.updateACBox = function (a, b) {
    AutoCompleteInputElement.prototype.updateACBox.apply(this, [a, b]);
    this.requestingServeletResult || (this.isACBoxVisible() ? Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElem(Sfdc.Activity.ManyWhoFunction.whoInputState.MRU_HAS_SUGGESTIONS) : Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElem(Sfdc.Activity.ManyWhoFunction.whoInputState.MRU_HAS_NO_SUGGESTION))
};
Sfdc.Activity.ManyWhoLookupAutoCompleteElement = function (a, b, c, d, e, g, h) {
    LookupAutoCompleteInputElement.apply(this, [a, b, c, d, e, g, h])
};
Sfdc.Activity.ManyWhoLookupAutoCompleteElement.prototype = new LookupAutoCompleteInputElement;
Sfdc.Activity.ManyWhoLookupAutoCompleteElement.prototype.createAutoCompleteInputElement = function (a, b, c, d, e, g, h, f) {
    return new Sfdc.Activity.ManyWhoAutoCompleteElement(a, b, c, d, e, g, h, f)
};
Sfdc.Activity.ManyWhoForeignKeyInputElement = function (a, b, c, d, e) {
    ForeignKeyInputElement.apply(this, [a, b, c, d, e])
};
Sfdc.Activity.ManyWhoForeignKeyInputElement.prototype = new ForeignKeyInputElement;
Sfdc.Activity.ManyWhoForeignKeyInputElement.prototype.createAutoCompleteInputElement = function (a, b, c, d, e, g, h) {
    return new Sfdc.Activity.ManyWhoLookupAutoCompleteElement(a, b, c, d, e, g, h)
};
Sfdc.provide("Sfdc.Activity.PeoplePicker", function (l) {
    this.selectedItems = {
        left: {},
        right: {}
    };
    this.elementToDataMapping = {};
    this.id = l;
    var c = this;
    this.toggleOverlayPanel = function () {
        void 0 === c.dialog ? (c.dialog = OverlayDialogElement.getDialog(c.id), c.dialog.createContent()) : c.clearPickerState();
        c.dialog.positioned = !1;
        c.dialog.show();
        c.setFocus(c.id + MWPicker.SEARCH_INPUT, 500);
        c.selectedItems && (c.selectedItems.right = {}, c.clearListArea(document.getElementById(c.id + MWPicker.SELECTED_LIST)));
        var a = null, a = this.id === MWPicker.MW_PICKER_ID ? Sfdc.Activity.ManyWhoFunction.getWhosInfo(this) : ActivityFunction.getInviteesInfo(this);
        null !== a ? (c.openIdsInEditMode(a), c.launchedWithExistingIDs = !0, c.setDoneButtonEnabled(!0)) : (c.launchedWithExistingIDs = !1, c.setDoneButtonEnabled(!1));
        c.setFocus(c.id + MWPicker.SEARCH_INPUT, 0);
        c.shiftupCount = 1;
        c.shiftdownCount = 1;
        c.id === MWPicker.INVITEE_PICKER_ID && (document.getElementById(c.id + MWPicker.HEADER_LABEL_ID).innerHTML = LC.getLabel("MWPicker", "InviteePickerLabel", c.getMaxItemToAddLimit()))
    };
    this.onMouseOver = function (a) {
        this.setStyleClass(a, "mouseover_item")
    };
    this.onMouseOut = function (a) {
        this.isItemSelected(a) ? this.setStyleClass(a, "mouseclick_item") : (this.setStyleClass(a, "mouseout_item"), a.childNodes[0].setAttribute("aria-selected", !1))
    };
    this.ensureFocusInIE = function (a) {
        isIE && (this.isItemOnLeftList(a) ? this.setFocus(c.id + MWPicker.FOUND_LIST, 0) : this.setFocus(c.id + MWPicker.SELECTED_LIST, 0))
    };
    this.onMouseClick = function (a, b) {
        this.isItemSelected(a) && c.isCtrlPressed(b) ? (this.unselectItem(a),
            this.ensureFocusInIE(a)) : (this.selectItem(a, b, "mouseclick_item"), a.childNodes[0].setAttribute("aria-selected", !0))
    };
    this.selectItem = function (a, b, d) {
        this.setStyleClass(a, d);
        this.ensureFocusInIE(a);
        !1 === b.shiftKey && (this.selectedItems.shiftKeyItem = a);
        this.isItemOnLeftList(a) ? (this.selectedItems.left[a.id] = a, this.clearSelection(!1), d = this.selectedItems.left) : (this.selectedItems.right[a.id] = a, this.clearSelection(!0), d = this.selectedItems.right);
        if (c.isCtrlPressed(b) && !1 === b.shiftKey) Sfdc.Event.stop(b);
        else {
            if (!0 === b.shiftKey) {
                var e = -1,
                    h = -1;
                this.clearSelection(!0);
                this.clearSelection(!1);
                var k;
                if (this.isItemOnLeftList(a) && this.isItemOnLeftList(this.selectedItems.shiftKeyItem)) k = document.getElementById(c.id + MWPicker.FOUND_LIST);
                else if (!this.isItemOnLeftList(a) && !this.isItemOnLeftList(this.selectedItems.shiftKeyItem)) k = document.getElementById(c.id + MWPicker.SELECTED_LIST);
                else {
                    c.onMouseClick(a, {
                        shiftKey: !1,
                        ctrlKey: !1
                    });
                    return
                }
                for (var f = 0; f < k.childNodes.length; f++) this.selectedItems.shiftKeyItem.id ===
                    k.childNodes[f].id ? e = f : a.id === k.childNodes[f].id && (h = f);
                if (-1 === e || -1 === h) return;
                e > h && (f = e, e = h, h = f);
                for (; e <= h; e++) c.onMouseClick(k.childNodes[e], {
                    shiftKey: !1,
                    ctrlKey: !0
                });
                Sfdc.Event.stop(b)
            }
            for (var g in d) a.id !== g && (b = d[g], delete d[g], this.onMouseOut(b))
        }
    };
    this.clearSelection = function (a) {
        var b;
        b = a ? this.selectedItems.left : this.selectedItems.right;
        for (var c in b) c && (this.setStyleClass(b[c], "mouseout_item"), b[c].childNodes[0].setAttribute("aria-selected", !1));
        a ? this.selectedItems.left = {} : this.selectedItems.right = {}
    };
    this.isItemOnLeftList = function (a) {
        return -1 !== a.parentNode.id.indexOf("found") ? !0 : !1
    };
    this.isItemSelected = function (a) {
        return this.selectedItems.left[a.id] || this.selectedItems.right[a.id] ? !0 : !1
    };
    this.setStyleClass = function (a, b) {
        a.setAttribute("class", b);
        a.setAttribute("className", b)
    };
    this.onAdd = function () {
        var a = document.getElementById(c.id + MWPicker.SELECTED_LIST);
        this.clearSelection(!1);
        for (var b in this.selectedItems.left)
            if (b) {
                var d = this.selectedItems.left[b];
                this.selectedItems.right[b] = d;
                d.parentNode.removeChild(d);
                a.appendChild(d);
                d.childNodes[0].setAttribute("aria-labelledby", c.id + MWPicker.SELECTED_LABEL)
            }
        this.selectedItems.left = {};
        this.setLabels();
        this.ensurePrimary(!0);
        this.focusOnList(a)
    };
    this.ensurePrimary = function (a) {
        if (c.id !== MWPicker.INVITEE_PICKER_ID) {
            var b;
            b = a ? document.getElementById(c.id + MWPicker.SELECTED_LIST) : document.getElementById(c.id + MWPicker.FOUND_LIST);
            for (var d = 0; d < b.childNodes.length; d++) this.stylePrimary(b.childNodes[d], 0 === d && a)
        }
    };
    this.onRemove = function () {
        var a = document.getElementById(c.id + MWPicker.FOUND_LIST);
        this.clearSelection(!0);
        for (var b in this.selectedItems.right)
            if (b) {
                var d = this.selectedItems.right[b];
                this.selectedItems.left[b] = d;
                d.parentNode.removeChild(d);
                a.appendChild(d);
                d.childNodes[0].setAttribute("aria-labelledby", c.id + MWPicker.FOUND_LABEL)
            }
        this.selectedItems.right = {};
        this.setLabels();
        this.ensurePrimary(!1);
        this.ensurePrimary(!0);
        this.focusOnList(a)
    };
    this.filterSelected = function (a) {
        var b = document.getElementById(c.id + MWPicker.SELECTED_LIST);
        if (0 === b.childNodes.length) return a;
        for (var d = {}, e = 0; e < b.childNodes.length; e++) d[b.childNodes[e].id] = !0;
        b = [];
        for (e = 0; e < a.length; e++) d[c.id + MWPicker.LIST_ITEM_PREFIX + a[e].id] || b.push(a[e]);
        return b
    };
    this.clearPickerState = function () {
        this.selectedItems && (this.selectedItems = {
            left: {},
            right: {}
        });
        this.clearListArea(document.getElementById(c.id + MWPicker.FOUND_LIST));
        this.clearListArea(document.getElementById(c.id + MWPicker.SELECTED_LIST));
        document.getElementById(c.id + MWPicker.SEARCH_INPUT).value = "";
        this.setLabels();
        document.getElementById(c.id + MWPicker.SEARCH_CLEAR_TEXT_BUTTON).style.display = "none"
    };
    this.onPickerCancel = function () {
        this.clearPickerState();
        this.dialog.cancel()
    };
    this.unescapeHTMLValue = function (a) {
        return a && 0 < Sfdc.String.trim(a).length ? Sfdc.String.unescapeHtml(a, !1) : ""
    };
    this.escapeHTMLValue = function (a) {
        return a && 0 < Sfdc.String.trim(a).length ? Sfdc.String.escapeToHtml(a, !1) : ""
    };
    this.onPickerDone = function () {
        var a = document.getElementById(c.id + MWPicker.SELECTED_LIST);
        if (this.id === MWPicker.MW_PICKER_ID) {
            idsInfo = [];
            for (var b = 0; b < a.childNodes.length; b++) {
                var d = this.elementToDataMapping[a.childNodes[b].id];
                idsInfo.push({
                    id: d.id,
                    name: this.unescapeHTMLValue(d.name),
                    title: this.unescapeHTMLValue(d.title),
                    company: this.unescapeHTMLValue(d.company),
                    owner: this.unescapeHTMLValue(d.owner)
                })
            }
            1 === a.childNodes.length && Sfdc.Activity.ManyWhoFunction.detectAndToggleWhoTipElem(Sfdc.Activity.ManyWhoFunction.whoInputState.WHO_SELECTED_FROM_PICKER);
            Sfdc.Activity.ManyWhoFunction.addManyWhos(idsInfo)
        } else {
            for (var b = [], e = 0; e < a.childNodes.length; e++) d = this.elementToDataMapping[a.childNodes[e].id].id, b.push(d);
            updateOpener(b.join(), EditEventMultiUserCalendarElementConstants.ADD_AND_REMOVE_INVITEE)
        }
        Sfdc.Activity.ManyWhoFunction.flipManyWhoContactField();
        this.onPickerCancel()
    };
    this.makePrimary = function () {
        var a = 0,            b;
        for (b in this.selectedItems.right) b && a++;
        1 == a && (a = this.selectedItems.right[b], b = a.parentNode, 1 < b.childNodes.length && (b.removeChild(a), b.insertBefore(a, b.childNodes[0])), this.ensurePrimary(!0))
    };
    this.stylePrimary = function (a, b) {
        b ? (a.childNodes[0].style.color = "green", this.selectedItems.currenPrimary = a) : a.childNodes[0].style.color = "black"
    };
    this.openIdsInEditMode = function (a) {
        this.setListData(a, !1);
        a = {
            shiftKey: !1,
            ctrlKey: !0
        };
        for (var b = document.getElementById(c.id + MWPicker.FOUND_LIST), d = 0; d < b.childNodes.length; d++) this.onMouseClick(b.childNodes[d], a);
        this.onAdd()
    };
    this.setFocus = function (a, b) {
        var c = document.getElementById(a);
        c && null !== c && setTimeout(function () {
            c.focus()
        }, b)
    };
    this.getMaxItemToAddLimit = function () {
        if (c.id === MWPicker.MW_PICKER_ID) return MWPicker.WHO_COUNT_MAX;
        var a = document.getElementById(Sfdc.Activity.ManyWhoFunction.recurrenceElementId);
        return ActivityFunction.isRecurrence || ActivityFunction.isOccurrence || a && a.checked ? MWPicker.MAX_RECURRING_EVENT_INVITEES : MWPicker.MAX_EVENT_INVITEES
    };
    this.setLabels = function () {
        var a = document.getElementById(c.id + MWPicker.FOUND_LIST),
            b = document.getElementById(c.id + MWPicker.SELECTED_LIST),
            d = document.getElementById(c.id + MWPicker.SELECTED_LABEL),
            e = document.getElementById(c.id + MWPicker.FOUND_LABEL);
        d.innerHTML = LC.getLabel("MWPicker", "SelectedLabelWithCount", b.childNodes.length);
        e.innerHTML = LC.getLabel("MWPicker", "AvailableLabelWithCount", a.childNodes.length);
        d = document.getElementById(c.id + MWPicker.INNER_SELECTED_DIV);
        e = document.getElementById(c.id + MWPicker.LIMIT_EXCEEDED_MESSAGE);
        e.innerHTML = LC.getLabel("MWPicker", "LimitExceededMessage", c.getMaxItemToAddLimit());
        b.childNodes.length > c.getMaxItemToAddLimit() ? (d.style.border = "2px solid #F00", e.style.display = "block") : (d.style.border = "none", e.style.display = "none");
        this.dialog.position();
        this.launchedWithExistingIDs ? this.setDoneButtonEnabled(b.childNodes.length <= c.getMaxItemToAddLimit()) : this.setDoneButtonEnabled(0 < b.childNodes.length && b.childNodes.length <= c.getMaxItemToAddLimit());
        0 < a.childNodes.length && a.setAttribute("tabIndex", 0);
        0 < b.childNodes.length && b.setAttribute("tabIndex", 0)
    };
    this.setListData = function (a, b) {
        this.elementToDataMapping || (this.elementToDataMapping = {});
        this.selectedItems || (this.selectedItems = {
            left: {},
            right: {}
        });
        var d = document.getElementById(c.id + MWPicker.FOUND_LIST);
        document.getElementById(c.id + MWPicker.FOUND_LABEL);
        this.displayOverlimitMessage(b);
        if (a && 0 < a.length) {
            this.clearListArea(d);
            for (var e = 0; e < a.length; e++) {
                var h = this.createListItem(e, a[e]);
                d.appendChild(h)
            }
        } else this.clearListArea(d);
        this.setLabels()
    };
    this.handleListFocus = function (a) {
        Sfdc.Event.add(a.srcElement || a.target, "keydown", this.handleKeyboardEvent)
    };
    this.handleListFocusOut = function (a) {
        this.resetKeyboardCounters();
        Sfdc.Event.remove(a.srcElement || a.target, "keydown", this.handleKeyboardEvent)
    };
    this.getCssClass = function (a) {
        return isIE ? a.getAttribute("className") : a.getAttribute("class")
    };
    this.unselectItem = function (a) {
        this.isItemOnLeftList(a) ? delete this.selectedItems.left[a.id] : delete this.selectedItems.right[a.id];
        this.onMouseOut(a, null)
    };
    this.resetKeyboardCounters = function () {
        this.currentKeyboardItemIndex = 0;
        this.shiftdownCount = this.shiftupCount = 1
    };
    this.handleKeyboardEvent = function (a) {
        var b = a.srcElement || a.target;
        if (Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.KEY_A) && c.isCtrlPressed(a)) {
            for (var d = 0; d < b.childNodes.length; d++) c.selectItem(b.childNodes[d], {
                ctrlKey: !0,
                shiftKey: !1
            }, "mouseclick_item");
            Sfdc.Event.stop(a)
        } else if (Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.ENTER)) {
            if (c.isCtrlPressed(a)) c.onPickerDone();
            else b.id === c.id + MWPicker.FOUND_LIST ? (c.onAdd(), c.setFocus(c.id + MWPicker.SELECTED_LIST, 0)) : (c.onRemove(), c.setFocus(c.id + MWPicker.FOUND_LIST, 0));
            Sfdc.Event.stop(a)
        } else Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.KEY_P) && !0 === a.shiftKey && b.id === c.id + MWPicker.SELECTED_LIST ? (c.makePrimary(), c.setFocus(c.id + MWPicker.SELECTED_LIST, 0), Sfdc.Event.stop(a)) : Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.ARROW_D) ?
            (!1 === a.shiftKey ? (this.currentKeyboardItemIndex = 1 < this.shiftdownCount ? c.findSelectedIndex(b, !1) : c.findSelectedIndex(b, !0), this.shiftupCount = this.shiftdownCount = 1, this.currentKeyboardItemIndex < b.childNodes.length - 1 && (this.currentKeyboardItemIndex++, c.selectItem(b.childNodes[this.currentKeyboardItemIndex], {
                ctrlKey: !1,
                shiftKey: !1
            }, "mouseclick_item"))) : 1 < this.shiftupCount ? (this.currentKeyboardItemIndex = c.findSelectedIndex(b, !0), c.unselectItem(b.childNodes[this.currentKeyboardItemIndex]), this.shiftupCount--) :
                (d = c.findSelectedIndex(b, !1), -1 !== d && (this.currentKeyboardItemIndex = d), this.currentKeyboardItemIndex++, this.currentKeyboardItemIndex <= b.childNodes.length - 1 && (c.onMouseClick(b.childNodes[this.currentKeyboardItemIndex], {
                    ctrlKey: !0,
                    shiftKey: !1
                }), this.shiftdownCount++)), c.scrollToSelectedItem(this.currentKeyboardItemIndex, b, !1), Sfdc.Event.stop(a)) : Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.ARROW_U) ? (!1 === a.shiftKey ? (this.currentKeyboardItemIndex = 1 < this.shiftupCount ? c.findSelectedIndex(b, !0) : c.findSelectedIndex(b, !1), this.shiftdownCount = this.shiftupCount = 1, 0 < this.currentKeyboardItemIndex && (this.currentKeyboardItemIndex--, c.selectItem(b.childNodes[this.currentKeyboardItemIndex], {
                    ctrlKey: !1,
                    shiftKey: !1
                }, "mouseclick_item"))) : 1 < this.shiftdownCount ? (this.currentKeyboardItemIndex = c.findSelectedIndex(b, !1), c.unselectItem(b.childNodes[this.currentKeyboardItemIndex]), this.shiftdownCount--) : (d = c.findSelectedIndex(b, !0), -1 !== d && (this.currentKeyboardItemIndex = d), this.currentKeyboardItemIndex--, 0 <= this.currentKeyboardItemIndex &&
                (c.onMouseClick(b.childNodes[this.currentKeyboardItemIndex], {
                    ctrlKey: !0,
                    shiftKey: !1
                }), this.shiftupCount++)), c.scrollToSelectedItem(this.currentKeyboardItemIndex, b, !0), Sfdc.Event.stop(a)) : Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.ARROW_R) ? (c.focusOnList(document.getElementById(c.id + MWPicker.SELECTED_LIST)), Sfdc.Event.stop(a)) : Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.ARROW_L) && (c.focusOnList(document.getElementById(c.id + MWPicker.FOUND_LIST)), Sfdc.Event.stop(a))
    };
    this.findSelectedIndex = function (a,        b) {
        var c = 0;
        if (b)
            for (c = 0; c < a.childNodes.length; c++) {
                if (this.isItemSelected(a.childNodes[c])) return c
            } else
            for (c = a.childNodes.length - 1; 0 <= c; c--)
                if (this.isItemSelected(a.childNodes[c])) return c;
        return -1
    };
    this.focusOnList = function (a) {
        0 < a.childNodes.length && this.setFocus(a.id, 0)
    };
    this.scrollToSelectedItem = function (a, b, c) {
        if (null !== b && 0 < b.childNodes.length) {
            var e = b.childNodes[0].offsetHeight;
            a *= e;
            if (a < b.scrollTop || a > b.scrollTop + b.offsetHeight - e) b.scrollTop = c ? a : a + e - b.offsetHeight
        }
    };
    this.getListItemCss = function (a) {
        var b =            "";
        switch (a.substring(0, 3)) {
            case "003":
                b = "contactIcon";
                break;
            case "00Q":
                b = "leadIcon";
                break;
            case "005":
                b = "userIcon";
                break;
            default:
                b = "resourceIcon"
        }
        return b
    };
    this.getItemHoverEntityType = function (a) {
        var b = null;
        switch (a.substring(0, 3)) {
            case "003":
                b = LC.getLabel("MWPicker", "ListItemContactHoverPart1");
                break;
            case "00Q":
                b = LC.getLabel("MWPicker", "ListItemLeadHoverPart1");
                break;
            case "005":
                b = LC.getLabel("MWPicker", "ListItemUserHoverPart1");
                break;
            default:
                b = LC.getLabel("MWPicker", "ListItemResourceHoverPart1")
        }
        return b
    };
    this.getItemHoverOwner = function (a, b) {
        var c = null;
        switch (a.substring(0, 3)) {
            case "003":
                c = LC.getLabel("MWPicker", "ListItemContactHoverPart2", b);
                break;
            case "00Q":
                c = LC.getLabel("MWPicker", "ListItemLeadHoverPart2", b)
        }
        return c
    };
    this.getIconAlt = function (a) {
        var b = null;
        switch (a.substring(0, 3)) {
            case "003":
                b = LC.getLabel("Global", "Contact");
                break;
            case "00Q":
                b = LC.getLabel("Global", "Lead");
                break;
            case "005":
                b = LC.getLabel("Global", "User");
                break;
            default:
                b = LC.getLabel("EmailInviter", "Resource")
        }
        return b
    };
    this.createListItem =  function (a, b) {
            var d = document.createElement("li");
            d.id = c.id + MWPicker.LIST_ITEM_PREFIX + b.id;
            this.elementToDataMapping[d.id] = b;
            var e = document.createElement("span"),
                h = document.createElement("span"),
                k = document.createElement("span"),
                f = document.createElement("img");
            f.setAttribute("src", "/s.gif");
            this.setStyleClass(f, c.getListItemCss(b.id));
            this.setStyleClass(k, "span_item");
            h.innerHTML = "\x26nbsp;" + b.name;
            var g = c.getItemHoverEntityType(b.id) + b.name;
            b.title && (g += ", " + b.title);
            b.company && (k.innerHTML = "\x26nbsp;" +
                b.company, g += ", " + b.company);
            b.owner && (g += c.getItemHoverOwner(b.id, b.owner));
            g = this.unescapeHTMLValue(g);
            d.title = g;
            f.setAttribute("alt", c.getIconAlt(b.id));
            this.setStyleClass(e, "list_item");
            this.setStyleClass(d, "mouseout_item");
            d.setAttribute("role", "presentation");
            e.setAttribute("role", "option");
            e.setAttribute("aria-labelledby", c.id + MWPicker.FOUND_LABEL);
            Sfdc.Event.add(d, "click", function (a) {
                c.onMouseClick(d, a)
            });
            Sfdc.Event.add(d, "mouseover", function (a) {
                c.onMouseOver(d, a)
            });
            Sfdc.Event.add(d, "mouseout", function (a) {
                    c.onMouseOut(d, a)
            });
            e.appendChild(f);
            e.appendChild(h);
            e.appendChild(k);
            d.appendChild(e);
            e.setAttribute("unselectable", "on");
            f.setAttribute("unselectable", "on");
            h.setAttribute("unselectable", "on");
            d.setAttribute("unselectable", "on");
            return d
        };
    this.clearListArea = function (a) {
        if (a.hasChildNodes())
            for (; 1 <= a.childNodes.length;) a.removeChild(a.firstChild)
    };
    this.onSearch = function () {
        var a = document.getElementById(c.id + MWPicker.SEARCH_INPUT).value;
        this.toggleLoading(!0);
        var b = document.getElementById(c.id + MWPicker.SEARCH_TYPES),
            a = {
                srtp: b ? b.value : "003",
                go: "1",
                srch: a
            },
            b = UrlMap.convertClassNameToUrl(MWPicker.SERVLET_NAME);
        Sfdc.Ajax.post(b, function (a) {
            a = Util.evalAjaxServletOutput(a);
            a.contacts = c.filterSelected(a.contacts);
            c.setListData(a.contacts, "1" === a.reachMaxRows);
            c.toggleLoading(!1);
            c.clearSelection(!0)
        }, {
            async: !0,
            data: a
        })
    };
    this.performSearchFromWhoInput = function (a) {
        document.getElementById(c.id + MWPicker.SEARCH_INPUT).value = a;
        this.onSearch()
    };
    this.toggleLoading = function (a) {
        var b = document.getElementById(c.id +
                MWPicker.FOUND_LIST),
            d = document.getElementById(c.id + MWPicker.LOADING_ICON_DIV);
        a ? (b.style.display = "none", d.style.display = "block") : (b.style.display = "block", d.style.display = "none")
    };
    this.displayOverlimitMessage = function (a) {
        document.getElementById(c.id + MWPicker.OVER_LIMIT_MESSAGE).style.display = a ? "block" : "none";
        this.dialog.position()
    };
    this.setDoneButtonEnabled = function (a) {
        var b = document.getElementById(c.id + MWPicker.DONE_BUTTON);
        a ? (b.disabled = null, b.className = "btn") : (b.disabled = "disabled", b.className =
            "btnDisabled")
    };
    this.onSearchKeyDown = function (a) {
        if (Sfdc.Event.isKeyAction(a, Sfdc.Event.keyCode.ENTER)) this.onSearch()
    };
    this.onSearchKeyUp = function (a) {
        a = document.getElementById(c.id + MWPicker.SEARCH_INPUT);
        document.getElementById(c.id + MWPicker.SEARCH_CLEAR_TEXT_BUTTON).style.display = "" === a.value ? "none" : "inline-block"
    };
    this.onSearchClearButtonKeyPress = function (a) {
        Sfdc.Event.isKeyAction(a, [Sfdc.Event.keyCode.ENTER, Sfdc.Event.keyCode.SPACE]) && (this.onSearchClearButtonClick(), Sfdc.Event.stop(event))
    };
    this.onSearchClearButtonClick = function (a) {
        a = document.getElementById(c.id + MWPicker.SEARCH_INPUT);
        document.getElementById(c.id + MWPicker.SEARCH_CLEAR_TEXT_BUTTON).style.display = "none";
        a.value = "";
        this.setFocus(c.id + MWPicker.SEARCH_INPUT, 0)
    };
    this.isCtrlPressed = function (a) {
        return !0 === a.ctrlKey ? !0 : "undefined" != typeof a.metaKey && !0 === a.metaKey ? !0 : !1
    }
});
//# sourceMappingURL=/javascript/1415910311000/sfdc/source/ManyWhoActivity.js.map
