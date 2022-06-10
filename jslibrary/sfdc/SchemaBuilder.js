/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Sfdc.ns("SfdcApp.CustomSchemaObjectController");
SfdcApp.CustomSchemaObjectController.clobFieldConfig = null;
SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap = null;
SfdcApp.CustomSchemaObjectController.masterLabelChangeWarn = function (b, a) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b[CustomSchemaObjectDefinitionUiModel.IS_NEW] || a.generalAlert(LC.getLabel("CustomField", "LabelChangeWarning"))
};
SfdcApp.CustomSchemaObjectController.developerNameChangeWarn = function (b, a) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b[CustomSchemaObjectDefinitionUiModel.IS_NEW] || a.generalAlert(LC.getLabel("CustomField", "NameChangeWarning"))
};
SfdcApp.CustomSchemaObjectController.uniqueChanged = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b[CustomSchemaObjectDefinitionUiModel.EDITABLE_PROPERTIES].textCaseSensitivity && a.enableRadiosFor("textCaseSensitivity", a.isChecked(c));
    SfdcApp.CustomSchemaObjectController.adjustIndex(b, a, c)
};
SfdcApp.CustomSchemaObjectController.adjustIndex = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    var d = b[CustomSchemaObjectDefinitionUiModel.TYPE_INDEPENDENT_NAME_TO_UNIQUE_NAME].isIndexed;
    d && (b[CustomSchemaObjectDefinitionUiModel.EDITABLE_PROPERTIES][d] && a.isChecked(c)) && a.setChecked(d, !0)
};
SfdcApp.CustomSchemaObjectController.adjustTrueIndexed = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    a.isChecked(c) || a.setChecked("checkboxIsTrueIndexed", !1)
};
SfdcApp.CustomSchemaObjectController.customEntityDataTypeChanged = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    c = "true" == Sfdc.get(c).value;
    b[CustomSchemaObjectDefinitionUiModel.EDITABLE_PROPERTIES].CustomEntityNameAutoNumberMask && a.enableRadiosFor("CustomEntityNameAutoNumberMask", c);
    b[CustomSchemaObjectDefinitionUiModel.EDITABLE_PROPERTIES].CustomEntityStartingNumber && a.enableRadiosFor("CustomEntityStartingNumber", c && (b[CustomSchemaObjectDefinitionUiModel.IS_NEW] || !b.propertyValues.CustomEntityDataType))
};
SfdcApp.CustomSchemaObjectController.adjustAllowActivities = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b[CustomSchemaObjectDefinitionUiModel.IS_NEW] || a.isChecked(c) && a.generalAlert(LC.getLabel("Page_CustomEntityDefinition_Edit", "AddActivityWarning"))
};
SfdcApp.CustomSchemaObjectController.clobLengthOnChange = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b[CustomSchemaObjectDefinitionUiModel.IS_NEW] || (b = b[CustomSchemaObjectDefinitionUiModel.CLOB_LENGTH_CONFIG], b.view = a, b.currentClobLength = a.getValue(c), a = {}, a[AjaxInNumericRange.pLOW] = b.minimumClobLength, a[AjaxInNumericRange.pTO_TEST] = b.currentClobLength, a[AjaxInNumericRange.pHIGH] = b.originalClobLength, SfdcApp.CustomSchemaObjectController.clobFieldConfig = b, Sfdc.Ajax.request(b.compareServletUrl, {
        success: SfdcApp.CustomSchemaObjectController.clobLengthCompareReponse,
        context: SfdcApp.CustomSchemaObjectController,
        data: a,
        method: "POST"
    }))
};
SfdcApp.CustomSchemaObjectController.clobLengthCompareReponse = function (b) {
    if (!0 === Util.evalAjaxServletOutput(b)[AjaxInNumericRange.pRESULT]) {
        b = SfdcApp.CustomSchemaObjectController.clobFieldConfig;
        var a = {};
        a.title = LC.getLabel("Page_CustFieldEdit", "ScanDialogTitle");
        a.msg = b.isMaxLengthScannable ? LC.getLabel("Page_CustFieldEdit", "warning_scan_clob_shrinkage") : LC.getLabel("Page_CustFieldEdit", "warning_no_scan_clob_shrinkage");
        a.type = b.isMaxLengthScannable ? "info" : "warn";
        a.buttons = b.isMaxLengthScannable ? [LC.getLabel("Page_CustFieldEdit", "ScanLabel"), LC.getLabel("Buttons", "cancel")] : [LC.getLabel("Buttons", "ok")];
        a.fn = SfdcApp.CustomSchemaObjectController.clobLengthBtnClick;
        a.cancel = SfdcApp.CustomSchemaObjectController.clobFieldConfig.view.dialogClose;
        a.backgroundClass = "RTAOverlayDialog1BG";
        b.view.generalDialog(a)
    } else SfdcApp.CustomSchemaObjectController.clobFieldConfig.view.dialogClose()
};
SfdcApp.CustomSchemaObjectController.clobLengthBtnClick = function (b) {
    b = SfdcApp.CustomSchemaObjectController.clobFieldConfig;
    var a = {};
    a[AjaxScanFieldsForShrinkage.pFIELD_ID] = b.fieldId;
    a[AjaxScanFieldsForShrinkage.pENTITY_NAME] = b.entityEnumOrId;
    a[AjaxScanFieldsForShrinkage.pLENGTH_SPECIFIED] = b.currentClobLength;
    Sfdc.Ajax.request(b.scanServletUrl, {
        success: SfdcApp.CustomSchemaObjectController.clobLengthScanResponse,
        context: this,
        data: a,
        method: "POST"
    })
};
SfdcApp.CustomSchemaObjectController.clobLengthScanResponse = function (b) {
    b = Util.evalAjaxServletOutput(b);
    var a = b.scanResultMsg,
        c = {};
    c.title = LC.getLabel("Page_CustFieldEdit", "ScanResultsDialogTitle");
    c.msg = a;
    c.type = "WARNING" == b.scanResultWarnLevel ? "warn" : "info";
    c.buttons = [LC.getLabel("Buttons", "ok")];
    c.fn = SfdcApp.CustomSchemaObjectController.clobFieldConfig.view.dialogClose;
    c.cancel = SfdcApp.CustomSchemaObjectController.clobFieldConfig.view.dialogClose;
    SfdcApp.CustomSchemaObjectController.clobFieldConfig.view.generalDialog(c)
};
SfdcApp.CustomSchemaObjectController.resetCustomHelpContentName = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    a.setValue("CustomEntityContentNameVisualforce", "");
    c = a.getValue(c);
    if (b[CustomSchemaObjectDefinitionUiModel.EDITABLE_PROPERTIES].CustomEntityContentNameSControl) switch (a.setValue("CustomEntityContentNameSControl", ""), c) {
        case "STANDARD_HELP":
            a.enableRadiosFor("CustomEntityContentNameVisualforce", !1);
            a.enableRadiosFor("CustomEntityContentNameSControl", !1);
            break;
        case "CUSTOM_HELP_VISUALFORCE":
            a.enableRadiosFor("CustomEntityContentNameVisualforce", !0);
            a.enableRadiosFor("CustomEntityContentNameSControl", !1);
            break;
        case "CUSTOM_HELP_SCONTROL":
            a.enableRadiosFor("CustomEntityContentNameVisualforce", !1), a.enableRadiosFor("CustomEntityContentNameSControl", !0)
    } else switch (c) {
        case "STANDARD_HELP":
            a.enableRadiosFor("CustomEntityContentNameVisualforce", !1);
            break;
        case "CUSTOM_HELP_VISUALFORCE":
            a.enableRadiosFor("CustomEntityContentNameVisualforce", !0)
    }
};
SfdcApp.CustomSchemaObjectController.hideFormulaDecimalPicklist = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b = a.getValue(c);
    "C" == b || "N" == b || "P" == b ? a.enableRadiosFor("formulaDecimalPlaces", !0) : a.enableRadiosFor("formulaDecimalPlaces", !1)
};
SfdcApp.CustomSchemaObjectController.warnAboutPotentialDataLoss = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    if (!b[CustomSchemaObjectDefinitionUiModel.IS_NEW]) {
        var d = a.getUniqueName(c),
            e = b[CustomSchemaObjectDefinitionUiModel.PROPERTY_VALUES][d];
        parseInt(a.getValue(d), 10) < parseInt(e, 10) && (d = {}, d.title = LC.getLabel("Page_CustFieldEdit", "potentialDataLossHeader"), d.msg = LC.getLabel("Page_CustFieldEdit", "potentialDataLossText"), d.type = "warn", d.buttons = [LC.getLabel("Buttons", "confirm"),
            LC.getLabel("Buttons", "cancel")
        ], d.fn = function () { }, d.cancel = function () {
            SfdcApp.CustomSchemaObjectController.restoreOriginalValue(b, a, c)
        }, a.generalDialog(d))
    }
};
SfdcApp.CustomSchemaObjectController.restoreOriginalValue = function (b, a, c) {
    c = a.getUniqueName(c);
    a.setValue(c, b[CustomSchemaObjectDefinitionUiModel.PROPERTY_VALUES][c])
};
SfdcApp.CustomSchemaObjectController.checkEncryptedDefaultValue = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b[CustomSchemaObjectDefinitionUiModel.EDITABLE_PROPERTIES].encryptedDefaultValue && (a.isChecked(c) || a.setValue("encryptedDefaultValue", ""), a.enableRadiosFor("encryptedDefaultValue", a.isChecked(c)))
};
SfdcApp.CustomSchemaObjectController.writeOrClearEncryptedExample = function (b, a) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    var c = a.getValue("encryptedMaskType"),
        d = a.getValue("encryptedMaskChar");
    c && d ? a.setAuxLabel("encryptedMaskChar", b[CustomSchemaObjectDefinitionUiModel.ENCRYPTED_EXAMPLE_CONFIG][c].replace(/X/g, d)) : a.setAuxLabel("encryptedMaskChar", "")
};
SfdcApp.CustomSchemaObjectController.fillRelationshipNameAndLabel = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    if (b[CustomSchemaObjectDefinitionUiModel.IS_NEW]) {
        var d = b[CustomSchemaObjectDefinitionUiModel.DOMAIN_ENUM_OR_ID_CONFIG];
        d.view = a;
        d.relationshipLabel = b[CustomSchemaObjectDefinitionUiModel.TYPE_INDEPENDENT_NAME_TO_UNIQUE_NAME].relationshipLabel;
        d.aggregateRelationshipName = b[CustomSchemaObjectDefinitionUiModel.TYPE_INDEPENDENT_NAME_TO_UNIQUE_NAME].aggregateRelationshipName;
        SfdcApp.CustomSchemaObjectController.autofillCfg = d;
        b = {};
        b[GenerateRelationshipDefaults.pENTITY_NAME] = d.entityName;
        b[GenerateRelationshipDefaults.pTARGET_ENTITY_NAME] = a.getValue(c);
        b[GenerateRelationshipDefaults.pMASTER_LABEL] = a.getValue("masterLabel");
        Sfdc.Ajax.request(d.autofillServletUrl, {
            success: SfdcApp.CustomSchemaObjectController.fillNameAndLabelResponse,
            context: this,
            data: b,
            method: "POST"
        })
    }
};
SfdcApp.CustomSchemaObjectController.fillNameAndLabelResponse = function (b) {
    b = Util.evalAjaxServletOutput(b);
    var a = SfdcApp.CustomSchemaObjectController.autofillCfg;
    a.view.setValue(a.aggregateRelationshipName, b.aggregateName);
    b.relatedListLabel && a.view.setValue(a.relationshipLabel, b.relatedListLabel)
};
SfdcApp.CustomSchemaObjectController.onSummarizedObjectChanged = function (b, a) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    SfdcApp.CustomSchemaObjectController.showSummaryOptions(b, a);
    SfdcApp.CustomSchemaObjectController.updateFieldToAggregate(b, a)
};
SfdcApp.CustomSchemaObjectController.onSummarizedObjectLoaded = function (b, a) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap = {}
};
SfdcApp.CustomSchemaObjectController.showSummaryOptions = function (b, a) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    b[CustomSchemaObjectDefinitionUiModel.IS_NEW] && a.enableRadiosFor("summaryOperation", !0)
};
SfdcApp.CustomSchemaObjectController.updateFieldToAggregate = function (b, a) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap || (SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap = {});
    SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap.view = a;
    var c = "",
        c = b[CustomSchemaObjectDefinitionUiModel.IS_NEW] ? CustomSummaryFieldAttributes.prototype.getEntityValue(a.getValue("summarySummarizedObject")) : CustomSummaryFieldAttributes.prototype.getEntityValue(b[CustomSchemaObjectDefinitionUiModel.PROPERTY_VALUES].summarySummarizedObject);
    null === c ? (a.enableRadiosFor("summaryOperation", !1), a.enableRadiosFor("summarySummarizedField", !1)) : SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap[c] ? refreshSummFieldPicklist(c) : getFieldsToAggregate(b, a, c)
};
getFieldsToAggregate = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    a = {};
    a[b[CustomSchemaObjectDefinitionUiModel.SUMMARY_FIELD_CONFIG].summaryFk] = c;
    a[AjaxLoadFieldsForEntity.pPARENT_ENTITY_NAME] = b[CustomSchemaObjectDefinitionUiModel.SUMMARY_FIELD_CONFIG].entityName;
    Sfdc.Ajax.post(b[CustomSchemaObjectDefinitionUiModel.SUMMARY_FIELD_CONFIG].ajaxUrl, cacheFieldsFromResponse, {
        data: a
    })
};
cacheFieldsFromResponse = function (b) {
    b = Util.evalAjaxServletOutput(b);
    SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap[b[AjaxLoadFieldsForEntity.pENTITY_NAME]] = b[AjaxLoadFieldsForEntity.pFIELD_LIST];
    refreshSummFieldPicklist(b[AjaxLoadFieldsForEntity.pENTITY_NAME])
};
refreshSummFieldPicklist = function (b) {
    view = SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap.view;
    var a = view.getValue("summaryOperation"),
        a = CustomSummaryFieldAttributes.getShownFields(a),
        c = [];
    if (a) {
        c.push([LC.getLabel("SelectElement", "Required"), ""]);
        var d = view.getValue("summarySummarizedField");
        b = SfdcApp.CustomSchemaObjectController.entityToFieldsCachedMap[b];
        for (var e = 0; e < b.length; e++) b[e].columnType in a && c.push([b[e].label, b[e].name]);
        view.refreshPicklist("summarySummarizedField", c,
            d);
        view.enableRadiosFor("summarySummarizedField", !0)
    } else c.push([LC.getLabel("SelectElement", "Required"), ""]), view.refreshPicklist("summarySummarizedField", c, ""), view.enableRadiosFor("summarySummarizedField", !1)
};
SfdcApp.CustomSchemaObjectController.addWhatsThisLinkToFormatMask = function (b, a, c) {
    SfdcApp.CustomSchemaObjectController.checkInterface(a);
    c = a.getUniqueName(c);
    a.setAuxLabel(c, b[CustomSchemaObjectDefinitionUiModel.VALID_PROPERTIES][c].auxLabel + " " + b[CustomSchemaObjectDefinitionUiModel.AUTONUMBER_HELP_HTML])
};
SfdcApp.CustomSchemaObjectController.checkInterface = function (b) {
    Sfdc.assert(b.generalAlert, "View parameter does not implement generalAlert(msg)");
    Sfdc.assert(b.enableRadiosFor, "View parameter does not implement enableRadiosFor(uniqueName, editable)");
    Sfdc.assert(b.isChecked, "View parameter does not implement isChecked(component)");
    Sfdc.assert(b.setChecked, "View parameter does not implement setChecked(component, checked)");
    Sfdc.assert(b.generalDialog, "View paramter does not implement generalDialog(config)");
    Sfdc.assert(b.getValue, "View parameter does not implement getValue(component)");
    Sfdc.assert(b.setValue, "View parameter does not implement setValue(uniqueName, valueToSet)");
    Sfdc.assert(b.getUniqueName, "View parameter does not implement setValue(uniqueName, valueToSet)");
    Sfdc.assert(b.refreshPicklist, "View parameter does not implement refreshPicklist(uniqueName, enums, selectedOption)");
    Sfdc.assert(b.setAuxLabel, "View parameter does not implement setAuxLabel(uniqueName, newVal)")
};
Sfdc.ns("SfdcApp.SchemaBuilder");
SfdcApp.SchemaBuilder = function (b) {
    function h() {
        Sfdc.Perf.mark("schemaBuilderInit");
        _this.chatterChatEnabled = Sfdc.Dom.hasClass(Sfdc.get("schemaBuilderWrapper"), "chatterChatEnabled");
        _this.canvas = new SfdcApp.SchemaBuilder.Canvas(_this);
        _this.printMode || (_this.sidebar = new SfdcApp.SchemaBuilder.Sidebar(_this), _this.toolbar = new SfdcApp.SchemaBuilder.Toolbar(_this));
        _this.schema = new SfdcApp.SchemaBuilder.Schema(_this);
        _this.printMode || (_this.zoomTool = new SfdcApp.SchemaBuilder.ZoomTool(_this), _this.miniNav =
            new SfdcApp.SchemaBuilder.MiniNav(_this), _this.legendWidget = new SfdcApp.SchemaBuilder.LegendWidget(_this));
        _this.lines = new SfdcApp.SchemaBuilder.Lines(_this);
        _this.printMode || (_this.fieldEditorOverlay = new SfdcApp.SchemaBuilder.FieldEditorOverlay(_this), _this.formBuilder = new SfdcApp.SchemaBuilder.FormBuilder(_this));
        _this.schema.loadInitial();
        var a = Sfdc.get("tsid");
        a && (a.style.zIndex = 100003);
        if (a = Sfdc.get("userNav")) a.style.zIndex = 100003;
        Sfdc.Perf.endMark("schemaBuilderInit")
    }
    _this = this;
    this.startTimer =  (new Date).getTime();
    this.lineZIndex = 0;
    this.objectZIndex = 100;
    this.uiZIndex = 1E5;
    this.errorDialog = Dialogs.createSimpleError(LC.getLabel("Exception", "UnhandledException"), LC.getLabel("Exception", "UnhandledException_desc"));
    this.csrf = b[CSRFConstants.CSRF_TOKEN];
    this.supportedDatatypes = b[SchemaBuilder.pDATATYPE];
    this.layoutInfo = b[SchemaBuilder.pSBLAYOUT];
    this.editProfile = b.epf;
    this.printMode = b.printMode;
    var f = 0, e = void 0;
    this.pPAGE_LAYOUT_URL = "plu";
    this.getSaveFlag = function () {
        return b ? "undefined" === typeof b.saveFlag ?
            !0 : b.saveFlag : !0
    };
    this.getRetUrl = function () {
        if (b) return b.retUrl
    };
    this.getEntityNameOrLabelForJS = function (a) {
        return this.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_LABELS_FLAG] ? this.getEntityLabelForJS(a) : this.getEntityName(a)
    };
    this.getEntityNameOrLabel = function (a) {
        return this.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_LABELS_FLAG] ? this.getEntityLabel(a) : this.getEntityName(a)
    };
    this.getEntityLabelForJS = function (a) {
        return a[SchemaBuilder.pIS_CUSTOM] ? escape(a[SchemaBuilder.pLABEL]) : a[SchemaBuilder.pLABEL]
    };
    this.getEntityLabel = function (a) {
        return a[SchemaBuilder.pIS_CUSTOM] ? escapeHTML(a[SchemaBuilder.pLABEL]) : a[SchemaBuilder.pLABEL]
    };
    this.getEntityName = function (a) {
        return a[SchemaBuilder.pNAME]
    };
    this.getFieldNameOrLabel = function (a, c) {
        return this.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_LABELS_FLAG] ? a[SchemaBuilder.pIS_CUSTOM] || c[SchemaBuilder.pIS_CUSTOM] ? escapeHTML(a[SchemaBuilder.pLABEL]) : a[SchemaBuilder.pLABEL] : a[SchemaBuilder.pNAME]
    };
    this.hideEditorOverlay = function () {
        "block" == Sfdc.get("fieldEditorOverlay").style.display &&
            this.formBuilder.doCancel()
    };
    this.hideMask = function () {
        var a = Sfdc.get("spinnerMask");
        a && (a.style.display = "none")
    };
    this.showMask = function () {
        var a = Sfdc.get("spinnerMask");
        a && (a.style.display = "")
    };
    this.getSchemaCoord = function () {
        return this.schema ? this.schema.getSchemaCoord() : null
    };
    this.getObjectSchemaData = function (a) {
        return this.schema.getObjectSchemaData(a)
    };
    this.getObjectsData = function () {
        return this.schema.getObjectsData()
    };
    this.getSchemaBuilderLayout = function () {
        return this.layoutInfo
    };
    this.getPositionBasedOnZoom = function (a) {
            return this.zoomTool ? this.zoomTool.getPositionBasedOnZoom({
                top: a.top,
                left: a.left
            }) : a
        };
    this.getNormalPositionBasedOnZoom = function (a) {
        return this.zoomTool ? this.zoomTool.getNormalPositionBasedOnZoom({
            top: a.top,
            left: a.left
        }) : a
    };
    this.getCurrentZoomCoeff = function () {
        return this.zoomTool.getCurrentZoomCoeff()
    };
    this.moveViewTo = function (a, c) {
        return this.canvas.moveViewTo(a, c)
    };
    this.resetView = function (a) {
        return this.canvas.resetView(a)
    };
    this.getViewDimensions = function () {
        return this.canvas.getDimensions()
    };
    this.resize = function () {
        return this.canvas.doResize()
    };
    this.isFieldVisible = function (a, c) {
        return this.schema.isFieldVisible(a, c)
    };
    this.isObjectScrollable = function (a) {
        return this.schema.isObjectScrollable(a)
    };
    this.doRequest = function (a, c) {
        var d = {
            timeStamp: (new Date).getTime()
        };
        d[SchemaBuilder.pLAYOUTID] = this.schema.getSchemaBuilderLayoutId();
        d = Sfdc.Url.generateUrl(a, d);
        c.data[CSRFConstants.CSRF_TOKEN] = this.csrf;
        c.data.retURL = "/_ui/platform/schema/ui/schemabuilder/SchemaBuilderUi";
        Sfdc.Ajax.request(d, {
            method: c.method ? c.method : "GET",
            data: c.data,
            success: function (a) {
                _this.handleSuccess(a, c.success, c.failure)
            },
            failure: function (a) {
                _this.handleFailure(a, c.failure)
            }
        })
    };
    this.handleSuccess = function (a, c, d) {
        var b;
        try {
            b = Util.evalAjaxServletOutput(a)
        } catch (e) {
            a = [], a[AjaxServlet.SESSION_TIMEOUT] = !0, this.handleFailure(a, d)
        }
        b.exTitle && b.exDesc ? (this.hideMask(), d && d(b), this.errorDialog.setTitle(b.exTitle), this.errorDialog.message = b.exDesc, this.errorDialog.createContent(), this.errorDialog.show()) : c(b)
    };
    this.handleFailure =
        function (a, c) {
            this.hideMask();
            this.hideEditorOverlay();
            if (a && a[AjaxServlet.SESSION_TIMEOUT]) Dialogs.createSimpleErrorWithAction("", LC.getLabel("Forecasting_SetupPage", "csrf_error_msg"), function () {
                document.location = document.location
            }).show();
            else {
                if (c) try {
                    c(Util.evalAjaxServletOutput(a))
                } catch (b) { }
                "" === a ? (this.errorDialog.setTitle(""), this.errorDialog.message = LC.getLabel("SchemaBuilderUi", "ServletHttpError", "")) : (this.errorDialog.setTitle(LC.getLabel("Exception", "UnhandledException")), this.errorDialog.message =
                    a ? LC.getLabel("Exception", "UnhandledException_desc") : LC.getLabel("SchemaBuilderUi", "ServletHttpError", ""));
                this.errorDialog.createContent();
                this.errorDialog.show()
            }
        };
    this.getThrottleInterval = function () {
        var a = Sfdc.userAgent;
        return a.isIE10 || a.isIE9 ? 20 : a.isIE8 ? 100 : a.isIE7 ? 200 : 0
    };
    this.throttler = function (a, c, b) {
        a = Sfdc.clone(Sfdc.Event.getEvent(a));
        0 === b && c(a);
        var g = (new Date).getTime();
        g - f > b ? (f = g, c(a)) : (e && clearTimeout(e), e = setTimeout(function () {
            timeOutId = void 0;
            c(a)
        }, b))
    };
    (!b || !b.noInit) && h();
    return this
};
SfdcApp.SchemaBuilder.ErrorCodes = {
    NoCode: 0,
    ObjectDeleted: 1
};
Sfdc.ns("SfdcApp.SchemaBuilder.Canvas");
SfdcApp.SchemaBuilder.Canvas = function (L) {
    function M(a) {
        A = Sfdc.Event.getMouseX(a);
        B = Sfdc.Event.getMouseY(a);
        v = !0;
        h.getViewport().style.cursor = "move"
    }

    function N(a) {
        var b = h.getCanvasPosition(),
            d = A - Sfdc.Event.getMouseX(a) + b.x,
            b = B - Sfdc.Event.getMouseY(a) + b.y;
        h.moveViewTo(d, b);
        A = Sfdc.Event.getMouseX(a);
        B = Sfdc.Event.getMouseY(a)
    }

    function O() {
        var a = g.getSchemaCoord(),
            b = 2 * h.schemaPadding,
            d = a.right - a.left + b,
            b = a.bottom - a.top + b;
        e.style.height = b + "px";
        e.style.width = d + "px";
        var c = document.createElement("div");
        c.className =            "infoDiv";
        c.title = LC.getLabel("SchemaBuilderUi", "removeInfoDiv");
        a = document.createElement("div");
        a.innerHTML = d + "X" + b + "px";
        d = document.createElement("div");
        d.innerHTML = "X";
        d.className = "delete";
        Sfdc.on(c, "click", function () {
            Sfdc.Dom.removeChild(c)
        });
        c.appendChild(d);
        c.appendChild(a);
        e.appendChild(c)
    }

    function F() {
        if (g.printMode && g.getSchemaCoord()) O();
        else {
            var a = Sfdc.Window.getWindowHeight() - Sfdc.Dom.getElementXY(e).y;
            0 > a && (a = 0);
            e.style.height = a + "px";
            var a = Sfdc.Window.getWindowWidth(),
                b = w ? w.offsetWidth :
                0;
            e.style.width = a - b + "px";
            e.style.left = b + "px"
        }
    }

    function G(a) {
        if (1 === a.button && null !== window.event || 0 === a.button) {
            Sfdc.on(document, "mousemove", H);
            var b = Sfdc.Event.getEventTarget(a, "li.schemaElement"),
                d = Sfdc.Event.getEventTarget(a, "div.object");
            if (d || b) {
                Sfdc.Event.stop(a);
                if (d) {
                    var q = Sfdc.Event.getEventTarget(a);
                    if (Sfdc.Dom.hasClass(q, "scrollMe")) return;
                    Sfdc.Event.fireEvent(h.getCanvas(), "schemabuilder:objectSelected", {
                        data: d
                    });
                    c = d
                }
                b && (c = b, r = !0);
                l = Sfdc.Event.getMouseX(a);
                m = Sfdc.Event.getMouseY(a);
                c.style.left ?
                    (C = parseFloat(c.style.left), D = parseFloat(c.style.top)) : (C = parseFloat(c.offsetLeft), D = parseFloat(c.offsetTop) - Sfdc.get("sidebarSchemaElements").scrollTop)
            } else Sfdc.Event.getEventTarget(a, "div.viewport") === n && (Sfdc.Event.stop(a), M(a), d || (d = Sfdc.Event.getEventTarget(a)), d.ondragstart = function () {
                return !1
            }, Sfdc.userAgent.isIE && n.setCapture && n.setCapture());
            Sfdc.userAgent.isIE && (document.body.focus(), document.onselectstart = function () {
                return !1
            })
        }
    }

    function H(a) {
        g.throttler(a, P, g.getThrottleInterval())
    }

    function P(a) {
        if (c) {
            s = !0;
            r && !x && Q();
            var b = Sfdc.Event.getMouseX(a);
            a = Sfdc.Event.getMouseY(a);
            c.style.left = C + b - l + "px";
            c.style.top = D + a - m + "px";
            r || (I(), null === y ? (y = l, E = m, t = l - b, u = m - a) : (t = y - b, u = E - a), p || (p = setInterval(function () {
                if (c) {
                    var a = c.style,
                        b = parseFloat(a.top),
                        a = parseFloat(a.left),
                        f = h.getCanvasPosition(),
                        g = h.getDimensions(),
                        e = !1;
                    a <= f.x && 0 < t ? (f.x -= 99, l += 99, e = !0) : a + c.offsetWidth >= f.x + g.w && 0 > t && (f.x += 99, l -= 99, e = !0);
                    b <= f.y && 0 < u ? (f.y -= 99, m += 99, e = !0) : b + Math.min(c.offsetHeight, 150) >= f.y + g.h && 0 > u && (f.y += 99, m -= 99, e = !0);
                    e && h.moveViewTo(f.x,
                        f.y)
                } else clearInterval(p), p = null
            }, 300)))
        } else v && (s = !0, N(a))
    }

    function I(a) {
        Sfdc.Event.fireEvent(k, "schemabuilder:objectDragging", {
            data: c
        })
    }

    function Q(a) {
        a = c.cloneNode(!0);
        Sfdc.Dom.addClass(a, "dragging");
        c.parentNode.appendChild(a);
        c = a;
        x = !0;
        Sfdc.Dom.hasClass(c, "objectElement") ? Sfdc.Dom.addClass(Sfdc.get("schemaBuilder"), "objectDragging") : Sfdc.Dom.addClass(Sfdc.get("schemaBuilder"), "fieldDragging")
    }

    function R(a) {
        Sfdc.un(document, "mousemove", H);
        n.releaseCapture && n.releaseCapture();
        if (c) {
            if (s)
                if (r) {
                    Sfdc.Dom.hasClass(c,
                        "objectElement") ? Sfdc.Dom.removeClass(Sfdc.get("schemaBuilder"), "objectDragging") : Sfdc.Dom.removeClass(Sfdc.get("schemaBuilder"), "fieldDragging");
                    var b = null;
                    if (x) {
                        if (J(n, a))
                            if (Sfdc.Dom.hasClass(c, "objectElement")) {
                                g.fieldEditorOverlay.setTitle(LC.getLabel("SchemaBuilderUi", "createEntityTitle"));
                                var d = h.getCanvasPosition(),
                                    b = d.x + Sfdc.Event.getMouseX(a) - e.offsetLeft;
                                a = d.y + Sfdc.Event.getMouseY(a) - (e.offsetTop + Sfdc.get("schemaBuilderWrapper").offsetTop + Sfdc.get("schemaBuilderToolbar").offsetHeight);
                                a =
                                    g.zoomTool.getNormalPositionBasedOnZoom({
                                        top: a,
                                        left: b
                                    });
                                g.fieldEditorOverlay.show({
                                    eventLeft: a.left,
                                    eventTop: a.top
                                }, "CreateEntity")
                            } else if (Sfdc.Dom.hasClass(c, "fieldElement")) {
                                var d = !1,
                                q = g.getObjectsData(),
                                f;
                                for (f in q)
                                    if (q.hasOwnProperty(f)) {
                                        var l = q[f];
                                        if (!l[SchemaBuilder.pHIDDEN] && (!b || b.element.style.zIndex <= l.element.style.zIndex) && J(l.element, a)) d = !0, b = l
                                    }
                                d && (a = Sfdc.get(".SideBarLabel", c), d = b[SchemaBuilder.pID], g.fieldEditorOverlay.setTitle(LC.getLabel("SchemaBuilderUi", "createFieldTitle", a.innerHTML,
                                g.getEntityNameOrLabel(b))), g.fieldEditorOverlay.show({
                                    fieldtype: c.id,
                                    entityId: d
                                }, "CreateField"), Sfdc.Event.fireEvent(k, "schemabuilder:objectSelected", {
                                    data: b.element
                                }))
                            }
                        c.parentNode.removeChild(c);
                        x = !1
                    }
                } else p && (clearInterval(p), p = null), u = t = E = y = null, Sfdc.Event.fireEvent(k, "schemabuilder:objectRepositioned", {
                    data: c
                });
            document.onselectstart = null;
            c && (c = c.ondragstart = null);
            r = !1
        } else v && (s && (h.getViewport().style.cursor = "default", Sfdc.Event.fireEvent(k, "schemabuilder:finishPanning")), v = !1);
        s = !1
    }

    function J(a,
        b) {
        var d;
        d = a;
        var c = 0,
            f = 0;
        if (d.offsetParent) {
            do c += d.offsetLeft, f += d.offsetTop, d = d.offsetParent; while (d)
        }
        d = c;
        var c = d + a.offsetWidth,
            e = f + a.offsetHeight,
            g = Sfdc.Event.getMouseX(b),
            h = Sfdc.Event.getMouseY(b);
        return d < g && c > g && f < h && e > h
    }

    function S(a, b) {
        var c = b.coeff,
            e = h.getCanvasCenter(),
            f = h.getDimensions();
        h.moveViewTo(e.x * c - 0.5 * f.w, e.y * c - 0.5 * f.h)
    }
    var h = this,
        e = Sfdc.get("schemaBuilder"),
        z, n = Sfdc.get("viewport"),
        k = Sfdc.get("schemaBuilderCanvas"),
        w = Sfdc.get("schemaBuilderSidebar"),
        K = Sfdc.get("sidebarSchemaElements"),
        v = !1,
        A, B, g = L,
        l = 0,
        m = 0,
        C = 0,
        D = 0,
        c = null,
        r = !1,
        s = !1,
        x = !1,
        p = null,
        y = null,
        E = null,
        t = null,
        u = null;
    this.schemaPadding = 40;
    this.addResizeListener = function (a) {
        z.push(a)
    };
    this.appendChild = function (a) {
        e.appendChild(a)
    };
    this.removeChild = function (a) {
        e.removeChild(a)
    };
    this.insertFirstChild = function (a) {
        e.insertBefore(a, e.firstChild)
    };
    this.getCanvas = function () {
        return k
    };
    this.getViewport = function () {
        return n
    };
    this.getCanvasPosition = function () {
        return {
            x: -parseFloat(k.style.left),
            y: -parseFloat(k.style.top)
        }
    };
    this.getDimensions =
        function () {
            var a = e.offsetWidth,
                b = w ? w.offsetWidth : 0;
            a > Sfdc.Window.getWindowWidth() - b && (a = document.body.offsetWidth - b);
            return {
                w: a,
                h: e.offsetHeight
            }
        };
    this.getCanvasCenter = function () {
        var a = h.getDimensions(),
            b = h.getCanvasPosition();
        return {
            x: a.w / 2 + b.x,
            y: a.h / 2 + b.y
        }
    };
    this.getPosition = function () {
        return Sfdc.Dom.getElementXY(e)
    };
    this.moveViewTo = function (a, b) {
        if (0 > a || 0 > b) {
            var d, e;
            0 > a ? (d = -a, a = 0) : d = 0;
            0 > b ? (e = -b, b = 0) : e = 0;
            Sfdc.Event.fireEvent(k, "schemabuilder:offsetSchema", {
                data: {
                    offsetX: d,
                    offsetY: e
                }
            })
        }
        c && (d = c.style,d.left = parseFloat(d.left) + parseFloat(k.style.left) + a + "px", d.top = parseFloat(d.top) + parseFloat(k.style.top) + b + "px", I());
        k.style.left = -a + "px";
        k.style.top = -b + "px";
        Sfdc.Event.fireEvent(k, "schemabuilder:viewMoved")
    };
    this.resetView = function (a) {
        void 0 === a && (a = this.schemaPadding);
        var b = g.getSchemaCoord();
        void 0 !== b.left && void 0 !== b.top && h.moveViewTo(b.left - a, b.top - a)
    };
    this.doResize = function () {
        for (var a = 0, b = z.length; a < b; a++) z[a]()
    };
    (function () {
        F();
        z = [F];
        if (!g.printMode) {
            Sfdc.on(window, "resize", function (a) {
                g.throttler(a,
                    h.doResize, g.getThrottleInterval())
            });
            Sfdc.on(k, "schemabuilder:resize", h.doResize);
            Sfdc.on(n, "mousedown", G);
            if (K) Sfdc.on(K, "mousedown", G);
            Sfdc.on(document, "mouseup", R);
            Sfdc.on(k, "schemabuilder:objectsZoomed", S)
        }
    })();
    return this
};
Sfdc.ns("SfdcApp.SchemaBuilder.FieldEditorOverlay");
SfdcApp.SchemaBuilder.FieldEditorOverlay = function (a) {
    OverlayDialog.call(this);
    this.extraClass = this.id = "fieldEditorOverlay";
    this.container = a;
    this.register();
    this.canvas = this.container.canvas.getCanvas();
    this.eventTop = this.eventLeft = 0;
    return this
};
Util.extend(SfdcApp.SchemaBuilder.FieldEditorOverlay, OverlayDialog);
SfdcApp.SchemaBuilder.FieldEditorOverlay.prototype.show = function (a, c) {
    this.container.showMask();
    var b = this;
    this.eventLeft = a.eventLeft;
    this.eventTop = a.eventTop;
    var d = b.container.getObjectsData()[a.entityId];
    "FORMULA" == a.fieldtype || !a.fieldtype && d && d[SchemaBuilder.pFIELDS][a.id][SchemaBuilder.pDATATYPE] == SchemaBuilder.pDATATYPE_FORMULA ? this.setWidth(850) : this.setWidth(550);
    this.container.doRequest("/_ui/platform/schema/ui/schemabuilder/SchemaBuilderServlet", {
        data: {
            action: c,
            id: a.id,
            eid: a.entityId,
            t: a.fieldtype,
            sblid: this.container.schema.getSchemaBuilderLayoutId()
        },
        success: function (a) {
            b.updateContent(b, a)
        }
    })
};
SfdcApp.SchemaBuilder.FieldEditorOverlay.prototype.hide = function () {
    OverlayDialog.prototype.hide.call(this);
    Sfdc.get(this.getContentId()).innerHTML = ""
};
SfdcApp.SchemaBuilder.FieldEditorOverlay.prototype.updateContent = function (a, c) {
    var b = Sfdc.get(this.getContentId());
    Sfdc.Event.fireEvent(this.canvas, "schemabuilder:formDisplay", {
        data: {
            form: c.form,
            content: b,
            eventLeft: this.eventLeft,
            eventTop: this.eventTop
        }
    });
    this.container.hideMask();
    OverlayDialog.prototype.show.call(a);
    Sfdc.Event.fireEvent(this.canvas, "schemabuilder:formResize");
    Sfdc.Event.fireEvent(this.canvas, "schemabuilder:formLoad")
};
Sfdc.ns("SfdcApp.SchemaBuilder.FormBuilder");
SfdcApp.SchemaBuilder.FormBuilder = function (M) {
    function ca(a, c) {
        var b = document.createElement("tr");
        b.className = "flsRowHeader";
        var d = document.createElement("th");
        d.className = "flsRowHeadLabel";
        d.innerHTML = LC.getLabel("SchemaBuilderUi", "profileHeader");
        var e = document.createElement("th");
        e.innerHTML = '\x3cinput id\x3d"' + v + '" type\x3d"checkbox" onClick \x3d "SfdcApp.schemaBuilder.formBuilder.onChangeCall(\'' + v + "','" + v + "');\"" + a + "\x3e" + LC.getLabel("SchemaBuilderUi", "visible");
        var h = document.createElement("th");
        h.innerHTML = '\x3cinput id\x3d"' + z + '" type\x3d"checkbox" onClick \x3d "SfdcApp.schemaBuilder.formBuilder.onChangeCall(\'' + z + "','" + z + "');\"" + c + " \x3e" + LC.getLabel("SchemaBuilderUi", "readonly");
        b.appendChild(d);
        b.appendChild(e);
        b.appendChild(h);
        return b
    }

    function I(a) {
        var c = parseFloat(Sfdc.get("schemaBuilder").style.height),
            b = Sfdc.get("fieldEditorScrollableArea");
        b && (b.offsetHeight > 0.95 * c - b.offsetTop ? b.style.height = 0.95 * c - b.offsetTop + "px" : a && (b.style.height = ""))
    }

    function U() {
        var a = Sfdc.get(J);
        if (0 < Sfdc.Dom.getText(a).length) return !0;
        var a = Sfdc.select(".validationError", Sfdc.get("fieldEditorOverlayContent")),
            c;
        for (c in a)
            if (a.hasOwnProperty(c)) {
                var b = Sfdc.Dom.getText(a[c]);
                if (b && 0 < b.length) return !0
            }
        return !1
    }

    function N(a, c) {
        c = escapeHTML(c);
        if (!a || a == SchemaBuilder.NON_SPECIFIC_ERROR) {
            var b = Sfdc.get(J);
            Sfdc.Dom.setText(b, c)
        } else b = Sfdc.get(a + ":error"), b || (b = document.createElement("div"), b.className = "error validationError", b.id = a + ":error", b = Sfdc.get(a).parentNode.appendChild(b)), U() || Sfdc.get(a).focus(), b.innerHTML = c
    }

    function O(a,
        c) {
        if ("BOOLEAN" == a.datatype && !a.isSelect)
            if (a.isRadio) {
                var b = a.radios,
                    d;
                for (d in b)
                    if (b.hasOwnProperty(d) && (c = Sfdc.get(d)) && c.checked) return "true" == c.value;
                a.required && N(a.uniqueName, LC.getLabel("Edit", "Required"))
            } else return c.checked;
        else if (a.required && 0 === c.value.length && !Sfdc.Dom.hasClass(c, "hidden")) N(a.uniqueName, LC.getLabel("Edit", "Required"));
        else return c.value;
        return null
    }

    function da(a) {
        var c = Sfdc.get("FieldSaveBtn");
        c && (c.innerHTML = LC.getLabel("Buttons", "saving"), Sfdc.Dom.addClass(c,
            "btnDisabled"), c.disabled = "disabled");
        K && (m.showMask(), m.doRequest(ea, {
            method: "POST",
            data: {
                action: P,
                id: A.id,
                eid: A.entityId,
                t: A.fieldType,
                to: V,
                le: W,
                data: encodeURIComponent(Sfdc.JSON.stringify({
                    formData: a
                }))
            },
            success: function (a) {
                if (a.saveErrors) {
                    for (var d in a.saveErrors)
                        if (a.saveErrors.hasOwnProperty(d)) {
                            var e = a.saveErrors[d];
                            d && N(d, e)
                        }
                    I();
                    m.hideMask();
                    c && (c.innerHTML = LC.getLabel("Buttons", "save"), Sfdc.Dom.removeClass(c, "btnDisabled"), c.disabled = !1)
                } else X.doCancel(), fa(), Sfdc.Event.fireEvent(E, "schemabuilder:updateSchema", {
                    data: a
                })
            }
        }))
    }

    function fa() {
        var a = document.createElement("div");
        a.className = "saveSuccess";
        a.innerHTML = "SaveField" == P ? LC.getLabel("SchemaBuilderUi", "fieldSaved") : LC.getLabel("SchemaBuilderUi", "objectSaved");
        m.canvas.appendChild(a);
        Sfdc.Animation.opacity(a, 1, 0, {
            duration: 3E3,
            delay: 300,
            onComplete: function () {
                m.canvas.removeChild(a)
            }
        })
    }

    function ga() {
        var a = document.createElement("div");
        u = document.createElement("button");
        w = document.createElement("button");
        a.className = "fieldEditButtons";
        u.id = "FieldSaveBtn";
        u.className = "fieldEditButton";
        u.innerHTML = LC.getLabel("Buttons", "save");
        Sfdc.on(u, "click", Y);
        w.id = "FieldCancelBtn";
        w.className = "fieldEditButton";
        w.innerHTML = LC.getLabel("Buttons", "cancel");
        Sfdc.on(w, "click", X.doCancel);
        a.appendChild(u);
        a.appendChild(w);
        return a
    }

    function Y(a) {
        Sfdc.Event.stop(a);
        Sfdc.Event.fireEvent(Sfdc.get("schemaBuilderCanvas"), "schemabuilder:formRead")
    }

    function ha(a, c) {
        var b, d, e = document.createElement("tr");
        e.className = "flsRow";
        var h = document.createElement("td"),
            p = document.createElement("td"),
            g = document.createElement("td");
        null === c || void 0 === c ? d = b = !1 : !0 === c ? (b = !0, d = !1) : !1 === c && (d = b = !0);
        !0 === l[CustomFieldDefinitionUiModel.DEFAULT_READONLY_TO_TRUE] && (d = !0);
        e.id = a.uniqueName + ":row";
        g.className = "label";
        g.innerHTML = Q(a);
        var n = a.inputAttributes.id;
        a.inputAttributes.id = n + B;
        a.isFLSVisible = !0;
        a.onChangeCall = B;
        h.innerHTML = R(a, b);
        a.inputAttributes.id = n + F;
        a.isFLSVisible = !1;
        a.isFLSReadOnly = !0;
        a.onChangeCall = F;
        !0 === l[CustomFieldDefinitionUiModel.READONLY_CHECKBOX_DISABLED] && (r[a.uniqueName] = !1);
        p.innerHTML =
            R(a, d);
        a.inputAttributes.id = n;
        e.appendChild(g);
        e.appendChild(h);
        e.appendChild(p);
        return e
    }

    function Z(a, c) {
        var b = [];
        b.push("\x3cinput");
        b.push(C(a));
        c = void 0 === c ? "" : escapeHTML(c).replace(/"/g, "\x26quot;");
        b.push(' value\x3d"' + c + '"/\x3e');
        b.push(G(a, !0));
        return b.join("")
    }

    function $(a, c) {
        var b = [];
        b.push("\x3cselect");
        b.push(C(a));
        b.push("\x3e");
        var d = a.enums,
            e;
        for (e in d)
            if (d.hasOwnProperty(e)) {
                var h = d[e];
                b.push("\x3coption");
                b.push(C(h));
                h.inputAttributes.value == c && b.push(' selected\x3d"selected"');
                b.push("\x3e" + h.label + "\x3c/option\x3e")
            }
        b.push("\x3c/select\x3e");
        b.push(G(a, !0));
        return b.join("")
    }

    function R(a, c) {
        var b = [];
        b.push("\x3cinput");
        b.push(C(a));
        c && b.push(' checked\x3d"checked"');
        b.push("/\x3e");
        b.push(G(a, !1));
        return b.join("")
    }

    function Q(a) {
        var c = [];
        a.label && (c.push('\x3clabel for\x3d"' + a.inputAttributes.id + '"\x3e'), a.required && !0 === r[a.uniqueName] && c.push('\x3cspan class\x3d"requiredMark"\x3e*\x3c/span\x3e'), c.push(escapeHTML(a.label) + "\x3c/label\x3e"));
        return c.join("")
    }

    function C(a) {
        var c = [],
            b = a.inputAttributes,
            d;
        for (d in b) b.hasOwnProperty(d) && c.push(" " + d + '\x3d"' + b[d] + '"');
        a.onChangeCall && ("BOOLEAN" == a.datatype && (Sfdc.userAgent.isIE8 || Sfdc.userAgent.isIE7) ? c.push(" onClick") : c.push(" onChange"), c.push("\x3d\"SfdcApp.schemaBuilder.formBuilder.onChangeCall('" + a.onChangeCall + "','" + a.uniqueName + "')\""));
        a.onLoadCall && (H[a.uniqueName] = a.onLoadCall);
        b = [];
        a.uniqueName && !0 !== r[a.uniqueName] && (c.push(' disabled\x3d"disabled"'), ("TEXT" == a.datatype || "TEXTAREA" == a.datatype) && b.push("disabled"));
        a.required && !0 === r[a.uniqueName] && b.push("required");
        S(a) || b.push("hidden");
        a.isNumber && b.push("number");
        a.isFLSVisible && b.push("flsVisible");
        a.isFLSReadOnly && b.push("flsReadOnly");
        (b = b.join(" ")) && c.push(' class\x3d"' + b + '"');
        return c.join("")
    }

    function G(a, c) {
        var b = [];
        a.auxLabel || (a.auxLabel = "");
        b.push(c ? '\x3cdiv class\x3d"info" id\x3d"' + a.uniqueName + '_aux"\x3e' + a.auxLabel + "\x3c/div\x3e" : '\x3cspan id\x3d"' + a.uniqueName + '_aux"\x3e' + a.auxLabel + "\x3c/span\x3e");
        return b.join("")
    }

    function S(a) {
        if (a = a.enablementField) {
            a =
                a.split(".");
            for (var c = l, b = 0; b < a.length; b++) c = c[a[b]];
            if (!c) return !1
        }
        return !0
    }

    function aa() {
        var a = Sfdc.get("FieldSaveBtn");
        a && (a.innerHTML = LC.getLabel("Buttons", "save"), Sfdc.Dom.removeClass(a, "btnDisabled"), a.disabled = !1);
        K = !0
    }

    function ia() {
        aa();
        this.hide()
    }
    var X = this,
        m = M,
        s = null,
        r = null,
        t = null,
        ba = null,
        T = "",
        l = null,
        A = {},
        u, w, ea = "/_ui/platform/schema/ui/schemabuilder/SchemaBuilderServlet",
        E = m.canvas.getCanvas(),
        P = null,
        J = "nonSpecificErrors",
        W = 0,
        V = 0,
        L = null,
        K = !0,
        B = "_visible",
        F = "_readonly",
        v = "toggleAllVisible",
        z = "toggleAllReadOnly",
        H = [];
    this.doCancel = function (a) {
        a && Sfdc.Event.stop(a);
        Sfdc.Dom.cleanListeners(Sfdc.get("fieldEditButtons"));
        sfdcPage.getDialogById("fieldEditorOverlay").cancel()
    };
    this.generalAlert = function (a) {
        alert(a)
    };
    this.generalDialog = function (a) {
        var c;
        !a.type || "info" == a.type ? c = Dialogs.types.INFO : "warn" == a.type && (c = Dialogs.types.WARN);
        var b = [],
            d = [];
        a.fn ? (b = [a.fn, a.cancel], d = a.buttons || [LC.getLabel("Buttons", "ok"), LC.getLabel("Buttons", "cancel")]) : d = a.buttons || [LC.getLabel("Buttons", "ok")];
        var e = Sfdc.get("SBInfoDialog");
        e && e.parentNode.removeChild(e);
        e = Dialogs.createDialog({
            id: "SBInfoDialog",
            title: a.title,
            message: a.msg,
            backgroundClass: null,
            contentClass: c.contentClass,
            iconClass: c.iconClass,
            iconAlt: c.getIconAlt(),
            actions: b,
            actionLabels: d,
            useCSS: !0
        }, !0);
        e.show();
        e.cancel = ia;
        Sfdc.Dom.addClass(e.background, "RTAOverlayDialog1BG");
        K = a.canSave
    };
    this.dialogClose = function () {
        aa()
    };
    this.enableRadiosFor = function (a, c) {
        var b = Sfdc.get(a);
        if (c) Sfdc.Dom.removeClass(b, "hidden"), Sfdc.Dom.removeClass(Sfdc.get(a +
            ":row"), "hidden");
        else {
            Sfdc.Dom.addClass(b, "hidden");
            Sfdc.Dom.addClass(Sfdc.get(a + ":row"), "hidden");
            var d = Sfdc.get(a + ":error");
            d && b.parentNode.removeChild(d)
        }
        var b = s[a].radios,
            e;
        for (e in b)
            if (b.hasOwnProperty(e) && (d = Sfdc.get(e))) d.disabled = !c
        };
        this.isChecked = function (a) {
            return (a = Sfdc.get(a)) ? a.checked : !1
        };
        this.setChecked = function (a, c) {
            var b = Sfdc.get(a);
            b && (b.checked = c)
        };
        this.getValue = function (a) {
            if ("undefined" !== typeof s) {
                var c = s[a];
                if (c.isRadio) {
                    a = c.radios;
                    for (var b in a)
                        if (a.hasOwnProperty(b) &&
                        (input = Sfdc.get(b)) && input.checked) return input.value
                    } else return Sfdc.get(a).value
                }
            };
            this.setValue = function (a, c) {
                var b = Sfdc.get(a);
                b && (b.value = c)
            };
            this.onChangeCall = function (a, c) {
                if (t && t[c]) {
                    var b, d, e = Sfdc.get(c + a);
                    B && e && !1 === e.checked && !1 === l[CustomFieldDefinitionUiModel.READONLY_CHECKBOX_DISABLED] ? (b = F, d = !1) : F && (e && !0 === e.checked) && (b = B, d = !0);
                    b && (Sfdc.get(c + b).checked = d)
                } else if (a == v || a == z) {
                    var h = [];
                    d = [];
                    var p, g, n, q, f, h = Sfdc.get(a);
                    d = Sfdc.get("fieldEditorOverlay");
                    b = 0;
                    if (h) {
                        n = h.checked;
                        a == v ? (e =
                    z, p = ".flsVisible", !1 === n && !1 === l[CustomFieldDefinitionUiModel.READONLY_CHECKBOX_DISABLED] && (g = ".flsReadOnly", f = !0, q = !1)) : a == z && (e = v, p = ".flsReadOnly", !0 === n && (g = ".flsVisible", q = f = !0));
                        if (p) {
                            h = Sfdc.select(p, d);
                            for (b = h.length; 0 < b--; ) h[b].checked = n
                        }
                        if (f) {
                            d = Sfdc.select(g, d);
                            for (b = d.length; 0 < b--; ) d[b].checked = q;
                            Sfdc.get(e).checked = q
                        }
                    }
                } else SfdcApp.CustomSchemaObjectController[a](l, this, c), "masterLabel" == c && DeveloperNameInputElement.setName(Sfdc.get("masterLabel"), Sfdc.get("developerName"), T), "CustomEntityLabel" ==
            c && (DeveloperNameInputElement.setName(Sfdc.get("CustomEntityLabel"), Sfdc.get("CustomEntityDeveloperName"), T), CustomEntityDefinition.setNameLabel(Sfdc.get("CustomEntityLabel"), Sfdc.get("CustomEntityRecordName"))), K = !("rtaLength" == c || "ltaLength" == c) || l[CustomSchemaObjectDefinitionUiModel.IS_NEW]
            };
            this.getUniqueName = function (a) {
                return a
            };
            this.refreshPicklist = function (a, c, b) {
                for (var d = [], e = 0; e < c.length; e++) d.push('\x3coption value\x3d"'), d.push(c[e][1]), d.push('" id\x3d"'), d.push(a + c[e][1]), c[e][1] ==
            b && d.push('" selected\x3d"selected'), d.push('" \x3e'), d.push(c[e][0]), d.push("\x3c/option\x3e");
                Sfdc.get(a).innerHTML = d.join("")
            };
            this.setAuxLabel = function (a, c) {
                Sfdc.get(a + "_aux").innerHTML = c
            };
            m.canvas.addResizeListener(I);
            Sfdc.on(E, "schemabuilder:formDisplay", function (a, c) {
                var b = c.content;
                W = c.eventLeft;
                V = c.eventTop;
                r = s = t = L = null;
                var d = c.form;
                l = d.uiModel;
                var e = l.validProperties,
            h = l.propertyValues,
            p = document.createElement("div");
                p.id = "fieldEditorScrollableArea";
                var g = document.createElement("table"),
            n = document.createElement("tbody");
                g.appendChild(n);
                p.appendChild(g);
                g = document.createElement("form");
                Sfdc.on(g, "submit", Y);
                g.appendChild(p);
                g.appendChild(ga());
                b.appendChild(g);
                s = e;
                r = l.editableProperties;
                A.entityId = d.entityId;
                A.id = d.id;
                A.fieldType = d.fieldType;
                P = d.saveAction;
                T = d.defaultDeveloperName;
                b = document.createElement("tr");
                d = document.createElement("td");
                d.className = "error nonspecific";
                d.setAttribute("colspan", "2");
                d.id = J;
                b.appendChild(d);
                n.appendChild(b);
                for (var q in s)
                    if (s.hasOwnProperty(q)) {
                        b =
                    e[q];
                        !L && (b.uniqueName && !0 === r[b.uniqueName]) && (L = b.uniqueName, M.fieldEditorOverlay.focusPointId = L);
                        var f = b,
                    k = h[b.uniqueName],
                    d = n,
                    m = f.datatype,
                    b = document.createElement("tr");
                        b.id = f.uniqueName + ":row";
                        d.appendChild(b);
                        (!S(f) || !0 !== r[f.uniqueName] && void 0 === k) && Sfdc.Dom.addClass(b, "hidden");
                        d = document.createElement("td");
                        g = document.createElement("td");
                        g.className = "label";
                        g.innerHTML = Q(f);
                        switch (m) {
                            case "TEXT":
                            case "NUMBER":
                                d.innerHTML = Z(f, k);
                                break;
                            case "FORMULATEXT":
                                f.FORMULAHTML && !0 === r[f.uniqueName] ?
                            (b.appendChild(g), b.appendChild(d), Sfdc.Dom.updateHTML(d, f.FORMULAHTML, !0), toggleInlineDisplay(f.uniqueName), (g = Sfdc.get(".showHideLink", d)) && Sfdc.Dom.removeChild(g), (g = Sfdc.get(f.uniqueName + "_validate", d)) && Sfdc.Dom.removeChild(g), k && (Sfdc.get(f.uniqueName).value = k), f.required && Sfdc.Dom.addClass(Sfdc.get(f.uniqueName), "required"), g = void 0) : d.innerHTML = Z(f, k);
                                break;
                            case "TEXTAREA":
                                var m = d,
                            x = [];
                                x.push("\x3ctextarea");
                                x.push(C(f));
                                k = void 0 === k ? "" : k;
                                x.push("\x3e" + escapeHTML(k) + "\x3c/textarea\x3e");
                                x.push(G(f, !0));
                                k = x.join("");
                                m.innerHTML = k;
                                break;
                            case "BOOLEAN":
                            case "ENUM":
                                m = d;
                                if (f.isRadio) {
                                    var y = f,
                                f = [],
                                x = y.radios,
                                v = !S(y),
                                z = !0 === r[y.uniqueName];
                                    f.push(G(y, !0));
                                    f.push('\x3cdiv id\x3d"' + y.uniqueName + '"');
                                    v && f.push(' class\x3d"hidden"');
                                    f.push("\x3e");
                                    y = void 0;
                                    for (y in x)
                                        if (x.hasOwnProperty(y)) {
                                            var u = x[y],
                                        w = u.inputAttributes.value;
                                            f.push("\x3cp\x3e\x3cinput ");
                                            f.push(C(u));
                                            (v || !z) && f.push(' disabled\x3d"disabled"');
                                            (w == k || void 0 === k && !w) && f.push(' checked\x3d"checked"');
                                            f.push("/\x3e");
                                            f.push(Q(u));
                                            f.push("\x3c/p\x3e")
                                        }
                                    f.push("\x3c/div\x3e");
                                    k = f.join("")
                                } else k = f.isSelect ? $(f, k) : R(f, k);
                                m.innerHTML = k;
                                break;
                            case "FOREIGNKEY":
                                d.innerHTML = $(f, k)
                        }
                        g && (b.appendChild(g), b.appendChild(d))
                    }
                if (l.flsProperties) {
                    e = [];
                    h = !1;
                    q = b = ' checked \x3d "true" ';
                    t = l.flsProperties;
                    ba = l.flsValues;
                    for (var D in t) t.hasOwnProperty(D) && (d = t[D], g = ba[d.uniqueName], void 0 === g || null === g ? b = q = "" : !0 === g && (b = ""), h || (h = !0, M.fieldEditorOverlay.focusPointId = d.uniqueName + B), e.push(ha(d, g)));
                    !0 === l[CustomFieldDefinitionUiModel.DEFAULT_READONLY_TO_TRUE] && (b = ' checked \x3d "true" ');
                    !0 === l[CustomFieldDefinitionUiModel.READONLY_CHECKBOX_DISABLED] && (b += ' disabled\x3d"disabled"');
                    !0 === l[CustomFieldDefinitionUiModel.VISIBLE_CHECKBOX_DISABLED] && (q += ' disabled\x3d"disabled"');
                    n.appendChild(ca(q, b));
                    for (D = 0; D < e.length; D++) n.appendChild(e[D])
                }
                p.style.height = "auto"
            });
            Sfdc.on(E, "schemabuilder:formRead", function () {
                var a = {},
            c = Sfdc.get(J);
                Sfdc.Dom.setText(c, "");
                var c = Sfdc.select(".validationError", Sfdc.get("fieldEditorOverlayContent")),
            b;
                for (b in c) c.hasOwnProperty(b) && Sfdc.Dom.setText(c[b],
            "");
                if (s)
                    for (var d in s) s.hasOwnProperty(d) && (b = s[d], !0 === r[b.uniqueName] && (c = Sfdc.get(b.uniqueName), c = O(b, c), void 0 !== c && (a[b.uniqueName] = c)));
                if (t)
                    for (var e in t)
                        if (t.hasOwnProperty(e)) {
                            d = t[e];
                            Sfdc.get(d.uniqueName);
                            b = O(d, Sfdc.get(d.uniqueName + B));
                            var c = O(d, Sfdc.get(d.uniqueName + F)),
                        h = null;
                            b && c ? h = !1 : b && (h = !0);
                            a[d.uniqueName] = h
                        }
                U() ? I() : da(a)
            });
            Sfdc.on(E, "schemabuilder:formResize", I);
            Sfdc.on(E, "schemabuilder:formLoad", function () {
                for (var a in H)
                    if (H.hasOwnProperty(a)) SfdcApp.CustomSchemaObjectController[H[a]](l,
                m.formBuilder, a);
                H = []
            });
            return this
        };
        Sfdc.ns("SfdcApp.SchemaBuilder.LegendWidget");
        SfdcApp.SchemaBuilder.LegendWidget = function (e) {
            function k(a) {
                if (a = Sfdc.Event.getEventTarget(a, "button.closeLegend")) Sfdc.Dom.getParent(a, "DIV").style.display = "none", Sfdc.Event.fireEvent(g.getCanvas(), "schemabuilder:legendClosed"), Sfdc.Event.fireEvent(g.getCanvas(), "schemabuilder:updateZoomTool", {
                    data: !1
                })
            }

            function l(a, f) {
                b.style.display = f ? "" : "none"
            }
            var g = e.canvas,
        m = e.getSchemaBuilderLayout()[SchemaBuilder.pHIDE_LEGEND_FLAG],
        b;
            (function () {
                Sfdc.Perf.mark("legendInit");
                b = document.createElement("div");
                b.id = "schemaBuilderLegend";
                b.className = "legendWidget";
                var a = document.createElement("button"),
            f = document.createElement("h4");
                f.innerHTML = LC.getLabel("SchemaBuilderUi", "legendTitle");
                a.className = "iconButton closeLegend";
                f.appendChild(a);
                var a = document.createElement("ul"),
            h = document.createElement("li"),
            c = document.createElement("img");
                c.src = "/img/schemabuilder/legend-lookup.png";
                h.appendChild(c);
                h.innerHTML += LC.getLabel("Page_CustFieldEdit", "Y");
                var c = document.createElement("li"),
            d = document.createElement("img");
                d.src = "/img/schemabuilder/legend-md.png";
                c.appendChild(d);
                c.innerHTML += LC.getLabel("Page_CustFieldEdit", "Y_MD");
                var d = document.createElement("li"),
            e = document.createElement("img");
                e.src = "/img/schemabuilder/required.png";
                d.appendChild(e);
                d.innerHTML += LC.getLabel("SchemaBuilderUi", "requiredField");
                b.appendChild(f);
                a.appendChild(h);
                a.appendChild(c);
                a.appendChild(d);
                b.appendChild(a);
                g.appendChild(b);
                m || (b.style.display = "none");
                Sfdc.on(b, "click", k);
                Sfdc.on(g.getCanvas(), "schemabuilder:toggleLegend", l);
                Sfdc.Perf.endMark("legendInit")
            })();
            return this
        };
        Sfdc.ns("SfdcApp.SchemaBuilder.Lines");
        SfdcApp.SchemaBuilder.Lines = function (x) {
            function N() {
                D();
                B()
            }

            function D() {
                var c = p.getSchemaCoord();
                void 0 !== c.right && void 0 !== c.bottom && s.setSize(c.right + 2 * O, c.bottom)
            }

            function P(c, a) {
                m && (Sfdc.Perf.mark("initAllLines"), D(), h && (Sfdc.Perf.mark("createAllLines"), E(0)), Sfdc.Perf.endMark("initAllLines"))
            }

            function Q(c, a) {
                if (m) {
                    var b = a[SchemaBuilder.pREL_FIELDS];
                    g[a.element.id] = [];
                    for (var d in b)
                        if (b.hasOwnProperty(d)) {
                            var e = R(b[d], a);
                            e && (h = h.concat(e))
                        }
                }
            }

            function R(c, a) {
                var b = [],
            d, e, k;
                e = c[SchemaBuilder.pDOMAIN];
                k = c[SchemaBuilder.pRELATIONSHIP];
                if (k == SchemaBuilder.LOOKUP)
                    for (k = e.length; k--; ) {
                        if (d = p.getObjectSchemaData(e[k])) d = {
                            sourceObject: a,
                            field: c,
                            targetObject: d,
                            lineType: y
                        }, b.push(d)
                    } else if (d = p.getObjectSchemaData(e[0])) d = {
                        sourceObject: a,
                        field: c,
                        targetObject: d,
                        lineType: k == SchemaBuilder.HIERARCHY ? da : ea
                    }, b.push(d);
                return b
            }

            function E(c) {
                setTimeout(function () {
                    for (var a = c + u, b = h.length, a = a < b ? a : b, d = c; d < a; d++) S(h[d]);
                    c += u;
                    c < b ? E(c) : (h = [], Sfdc.Perf.endMark("createAllLines"))
                }, 0)
            }

            function S(c) {
                var a = c.sourceObject,
            b = c.targetObject,
            d = a.element,
            e = Sfdc.get(c.field[SchemaBuilder.pENTITYID] + ":" + c.field[SchemaBuilder.pID], d),
            k = b.element,
            v = Sfdc.get(".title", k);
                e && v && fa(e, v, d, k, c.lineType, p.getEntityNameOrLabel(a), p.getEntityNameOrLabel(b))
            }

            function fa(c, a, b, d, e, k, v) {
                for (var f = g[b.id], n = f.length; n--; )
                    if (f[n].fromEl.id == c.id && f[n].toEl.id == a.id) return;
                var l, z, F, m, h, f = c.id + "-" + a.id,
            n = p.getObjectSchemaData(b[SchemaBuilder.pID])[SchemaBuilder.pHIDDEN] || p.getObjectSchemaData(d[SchemaBuilder.pID])[SchemaBuilder.pHIDDEN];
                m = T(b, d);
                z = Sfdc.Dom.hasClass(b, "selected") || Sfdc.Dom.hasClass(d, "selected");
                k = LC.getLabel("SchemaBuilderUi", e, "\x3ca onClick\x3d\"SfdcApp.schemaBuilder.lines.centerOnObject('" + b[SchemaBuilder.pID] + "');\"\x3e" + k + "\x3c/a\x3e", "\x3ca onClick\x3d\"SfdcApp.schemaBuilder.lines.centerOnObject('" + d[SchemaBuilder.pID] + "');\"\x3e" + v + "\x3c/a\x3e");
                z ? (z = e == y ? U : V, F = 2 * A[t]) : (z = e == y ? W : X, F = A[t]);
                n || !m ? v = "M0,0" : (h = Y(c, a, b, d), v = h.path, h = h.circleCoords);
                l = {
                    path: s.path(v).toBack(),
                    fromEl: c,
                    toEl: a,
                    fromObj: b,
                    toObj: d,
                    objectOfLineHidden: n,
                    visible: m,
                    selected: !1,
                    type: e,
                    hover: k,
                    circle: s.circle(0, 0, 0).attr({
                        fill: "#fff"
                    })
                };
                h && l.circle.attr({
                    cx: h.x,
                    cy: h.y,
                    r: h.r
                });
                l.path.node.id = f;
                l.circle.node.id = f + "-circle";
                l.set = s.set().push(l.path, l.circle);
                l.set.attr({
                    stroke: z,
                    "stroke-width": F
                });
                r.push(l);
                g[b.id].push(l);
                b != d && g[d.id].push(l);
                l.path.mouseover(function (a) {
                    clearTimeout(this.timeoutId);
                    var b = Sfdc.Event.getMouseX(a);
                    a = Sfdc.Event.getMouseY(a);
                    Sfdc.Dom.updateHTML(q, l.hover);
                    var c = Sfdc.Dom.getElementXY(q.parentNode);
                    q.style.left = b - c.x - 15 + "px";
                    q.style.top = a - c.y - 15 + "px";
                    Sfdc.Dom.removeClass(q, "hidden")
                });
                l.path.mouseout(function (a) {
                    a = Sfdc.clone(Sfdc.Event.getEvent(a));
                    this.timeoutId = Sfdc.Function.delay(Z, 100, this, [a]).timeoutId
                })
            }

            function B() {
                m && $(0)
            }

            function $(c) {
                setTimeout(function () {
                    for (var a = c + u, b = r.length, a = a < b ? a : b, d = c; d < a; d++) {
                        var e = r[d];
                        e.objectOfLineHidden || C(e)
                    }
                    c += u;
                    c < b && $(c)
                }, 0)
            }

            function G(c, a) {
                if (g) {
                    var b = g[a.id];
                    if (b)
                        for (var d = b.length; d--; ) {
                            var e = b[d];
                            e.objectOfLineHidden || C(e)
                        }
                }
            }

            function aa(c) {
                setTimeout(function () {
                    for (var a =
                c + u, b = r.length, a = a < b ? a : b, d = c; d < a; d++) {
                        var e = r[d],
                    k = A[t];
                        e.set.attr("stroke-width", e.selected ? 2 * k : k);
                        e.objectOfLineHidden || C(e)
                    }
                    c += u;
                    c < b && aa(c)
                }, 0)
            }

            function ba() {
                m && (H && clearTimeout(H), H = I(r, 0))
            }

            function I(c, a) {
                return setTimeout(function () {
                    for (var b = a + u, d = c.length, e, k = b < d ? b : d, f = a; f < k; f++) e = c[f], !e.visible && !e.objectOfLineHidden && C(e);
                    b < d && I(c, b)
                }, 0)
            }

            function C(c) {
                var a = c.fromObj,
            b = c.toObj,
            d = T(a, b);
                c.visible = d;
                !d || c.objectOfLineHidden ? c.set.hide() : (a = Y(c.fromEl, c.toEl, a, b), c.path.attr({
                    path: a.path
                }),
            a = a.circleCoords, c.circle.attr({
                cx: a.x,
                cy: a.y,
                r: a.r
            }), c.set.show())
            }

            function T(c, a) {
                if (c.style.top && c.style.left && a.style.top && a.style.top) {
                    var b = ca(c),
                d = ca(a);
                    return !(b[J] && d[J] || b[K] && d[K] || b[L] && d[L] || b[M] && d[M])
                }
                return !1
            }

            function ca(c) {
                var a = {};
                a[J] = w.offsetTop > c.offsetTop + c.offsetHeight + f.offsetTop;
                a[K] = w.offsetHeight + w.offsetTop < c.offsetTop + f.offsetTop;
                a[L] = w.offsetLeft > c.offsetLeft + c.offsetWidth + f.offsetLeft;
                a[M] = w.offsetLeft + w.offsetWidth < c.offsetLeft + f.offsetLeft;
                return a
            }

            function Y(c, a,
        b, d) {
                var e, k;
                e = 0;
                var f = Sfdc.get(".scrollMe", b);
                Sfdc.Dom.hasClass(c, "field") && (e = f.scrollTop);
                var g = parseFloat(b.style.left) + 2,
            n = parseFloat(d.style.left) + 2,
            l = b.offsetWidth - 4,
            h = d.offsetWidth - 4;
                e = c.offsetTop + parseFloat(b.style.top) - e;
                d = a.offsetTop + parseFloat(d.style.top);
                k = c.offsetHeight / 2;
                a = a.offsetHeight / 2;
                c.offsetParent !== b && (e += f.offsetTop + 8);
                p.isFieldVisible(b.id, c.id) || (e = parseFloat(b.style.top) + b.offsetHeight - k - 8);
                a = [{
                    x: g - 1,
                    y: e + k
                }, {
                    x: g + l + 1,
                    y: e + k
                }, {
                    x: n - 1,
                    y: d + a
                }, {
                    x: n + h + 1,
                    y: d + a
                }];
                l = a[0].x + l / 2;
                a[1].x <
            a[2].x ? (e = 1, k = 2) : a[0].x > a[3].x ? (e = 0, k = 3) : a[2].x > l && a[2].x <= a[1].x || a[2].x > a[0].x && a[2].x <= l ? (e = 1, k = 3) : (e = 0, k = 2);
                g = ga[t];
                f = ha[t];
                l = 0.75 * f;
                c = a[e].x;
                b = a[e].y;
                g = 0 === e ? a[e].x - g : a[e].x + g;
                n = a[e].y;
                h = a[k].x;
                a = a[k].y;
                var m = Math.max(Math.abs(g - h) / 2, O);
                Math.max(Math.abs(n - a) / 2, 10);
                e = [g - m, g + m][e].toFixed(3);
                d = n.toFixed(3);
                k = [0, 0, h - m, h + m][k].toFixed(3);
                var m = a.toFixed(3),
            q = (b - f).toFixed(3),
            f = (b + f).toFixed(3);
                c = c.toFixed(3);
                g = g.toFixed(3);
                b = b.toFixed(3);
                n = n.toFixed(3);
                return {
                    path: ["M", c, q, "L", g, b, "L", c, f, "M", c,
                b, "L", g, n, "C", e, d, k, m, h.toFixed(3), a.toFixed(3)
            ].join(),
                    circleCoords: {
                        x: g,
                        y: n,
                        r: l
                    }
                }
            }

            function Z(c) {
                Sfdc.Event.mouseExited(c, q) && Sfdc.Dom.addClass(q, "hidden")
            }
            var p = x;
            x = x.canvas;
            var f, w, s, r, g, m, h, q, y = "lookup",
        W = "#9bc4d0",
        U = "#2573b4",
        ea = "masterDetail",
        X = "#9a3252",
        V = "#7a0026",
        da = "hierarchy",
        O = 30,
        u = 300,
        L = "l",
        M = "r",
        J = "t",
        K = "b",
        A = [1.25, 1.25, 1.2, 1.15, 1.1, 1.05],
        ga = [15, 15, 14.4, 13.8, 13.32, 12.6],
        ha = [5.5, 5.5, 5.05, 4.85, 4.6, 4.4],
        t, H = null;
            this.centerOnObject = function (c) {
                Sfdc.Event.fireEvent(f, "schemabuilder:centerOnObject", {
                    data: Sfdc.get(c)
                });
                Sfdc.Dom.addClass(q, "hidden")
            };
            Sfdc.Perf.mark("linesInit");
            w = Sfdc.get("viewport");
            f = x.getCanvas();
            s = new Raphael(f, 1, 1);
            s.canvas.id = "lines";
            t = 1;
            q = document.createElement("div");
            q.id = "schemaBuilderLineInfo";
            q.className = "lineInfo hidden";
            x.appendChild(q);
            s.safari();
            h = [];
            r = [];
            (m = p.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_RELATIONSHIP_FLAG]) && (g = {});
            Sfdc.on(q, "mouseout", Z);
            Sfdc.on(f, "schemabuilder:objectsLoaded", P);
            Sfdc.on(f, "schemabuilder:objectUpdated", Q);
            Sfdc.on(f, "schemabuilder:objectAdded",
        function (c, a) {
            E(0)
        });
            Sfdc.on(f, "schemabuilder:objectsRepositioned", B);
            Sfdc.on(f, "schemabuilder:finishPanning", B);
            Sfdc.on(f, "schemabuilder:objectDragging", G);
            Sfdc.on(f, "schemabuilder:objectScrolled", G);
            Sfdc.on(f, "schemabuilder:fieldAdded", G);
            Sfdc.on(f, "schemabuilder:relationshipFieldAdded", function (c, a) {
                if (g) {
                    h = [];
                    for (var b = R(a.field, a.object), d = b.length; d--; ) S(b[d])
                }
            });
            Sfdc.on(f, "schemabuilder:objectFieldsLoaded", ba);
            Sfdc.on(f, "schemabuilder:selectionChanged", function (c, a) {
                var b;
                if (m) {
                    if (a.deselected) {
                        var d =
                    g[a.deselected.id];
                        if (d)
                            for (var e = d.length; e--; ) b = d[e], b.selected = !1, b.set.attr("stroke", b.type == y ? W : X), b.set.attr({
                                "stroke-width": A[t]
                            })
                    }
                    if (d = g[a.selected.id])
                        for (e = d.length; e--; ) b = d[e], b.selected || (b.selected = !0, b.set.attr("stroke", b.type == y ? U : V), b.set.attr({
                            "stroke-width": 2 * A[t]
                        }), b.set.toFront())
                }
            });
            Sfdc.on(f, "schemabuilder:beforeZoom", function (c, a) {
                for (var b = r.length; b--; ) r[b].set.hide()
            });
            Sfdc.on(f, "schemabuilder:objectsZoomed", function (c, a) {
                t = a.newLevel;
                D();
                m && aa(0)
            });
            Sfdc.on(f, "schemabuilder:viewMoved",
        ba);
            Sfdc.on(f, "schemabuilder:toggleNamesLabels", function (c) {
                for (c = r.length; c--; ) {
                    var a = r[c],
                b = a.fromObj[SchemaBuilder.pID],
                d = a.toObj[SchemaBuilder.pID],
                e = p.getObjectSchemaData(b),
                f = p.getObjectSchemaData(d);
                    a.hover = LC.getLabel("SchemaBuilderUi", a.type, "\x3ca onClick\x3d\"SfdcApp.schemaBuilder.lines.centerOnObject('" + b + "');\"\x3e" + p.getEntityNameOrLabel(e) + "\x3c/a\x3e", "\x3ca onClick\x3d\"SfdcApp.schemaBuilder.lines.centerOnObject('" + d + "');\"\x3e" + p.getEntityNameOrLabel(f) + "\x3c/a\x3e")
                }
            });
            Sfdc.on(f,
        "schemabuilder:afterOffsetSchema", N);
            Sfdc.on(f, "schemabuilder:schemaSizeChanged", N);
            Sfdc.on(f, "schemabuilder:objectWasDeleted", function (c, a) {
                if (g) {
                    var b = g[a];
                    if (b) {
                        for (var d = b.length; d--; ) {
                            var e = b[d];
                            e.objectOfLineHidden = !0;
                            e.set.hide()
                        }
                        g[a] = void 0;
                        delete g[a]
                    }
                }
            });
            Sfdc.on(f, "schemabuilder:fieldWasDeleted", function (c, a) {
                if (g) {
                    var b = a[SchemaBuilder.pENTITYID],
                d = b + ":" + a[SchemaBuilder.pID];
                    if (b = g[b])
                        for (var e = b.length; e--; ) {
                            var f = b[e];
                            f.fromEl.id == d && (f.objectOfLineHidden = !0, f.set.hide(), b.splice(e, 1))
                        }
                }
            });
            Sfdc.on(f, "schemabuilder:toggleObjectDisplay", function (c, a) {
                if (g) {
                    for (var b = [], d = a.ids, e, f, h, m, n, l = SchemaBuilder.pID, q = d.length; 0 < q--; )
                        if (e = d[q], f = g[e])
                            for (n = f.length; n--; ) h = f[n], (m = h.fromObj[l] == e ? p.getObjectSchemaData(h.toObj[l]) : p.getObjectSchemaData(h.fromObj[l])) && !a.hidden && !m[SchemaBuilder.pHIDDEN] ? (h.objectOfLineHidden = !1, b[b.length] = h) : (h.set.hide(), h.objectOfLineHidden = !0);
                    I(b, 0)
                }
            });
            Sfdc.on(f, "schemabuilder:toggleLines", function (c, a) {
                if (m = a)
                    if (g) s.canvas.style.display = "", B();
                    else {
                        p.showMask();
                        g = {};
                        var b = p.schema.getObjectsData(),
                    d;
                        for (d in b)
                            if (b.hasOwnProperty(d)) {
                                var e = b[d];
                                e.id && Q(null, e)
                            }
                        m = !0;
                        Sfdc.Perf.mark("createAllLines");
                        P(null, b);
                        p.hideMask()
                    } else s.canvas.style.display = "none"
            });
            Sfdc.Perf.endMark("linesInit");
            return this
        };
        Sfdc.ns("SfdcApp.SchemaBuilder.MiniNav");
        SfdcApp.SchemaBuilder.MiniNav = function (w) {
            var x, y;

            function z(a, c) {
                var b = c.style,
            b = g.translatePositionFromCanvasToMiniNav(parseFloat(b.left), parseFloat(b.top)),
            d = Sfdc.get(g.getDomIdForObjId(c.id));
                d && void 0 !== b.x && (d = d.style, d.top = b.y + "px", d.left = b.x + "px")
            }

            function H(a, c) {
                var b = n.getObjectsData();
                h = g.getAspectRatio().ratio;
                var d, e, A, p, f;
                for (f in b)
                    if (b.hasOwnProperty(f) && (d = b[f].element, e = d.style, void 0 !== e.left && "" !== e.left && (e = g.translatePositionFromCanvasToMiniNav(parseFloat(e.left), parseFloat(e.top)), (mbObj = Sfdc.get(g.getDomIdForObjId(d.id))) && void 0 !== e.y))) A = d.offsetWidth, p = d.offsetHeight, d = mbObj.style, d.top = e.y + "px", d.left = e.x + "px", d.width = A * h + "px", d.height = p * h + "px";
                r()
            }

            function q(a, c) {
                Sfdc.Perf.mark("mininavDrawBoxes");
                if (h = g.getAspectRatio().ratio) {
                    var b, d, e, f, p, k, l = [],
                q;
                    for (q in c) c.hasOwnProperty(q) && (b = c[q], b[SchemaBuilder.pHIDDEN] || (e = g.translatePositionFromCanvasToMiniNav(b[SchemaBuilder.pLEFT], b[SchemaBuilder.pTOP]), d = e.y + "px", e = e.x + "px", f = b[SchemaBuilder.pID], p = b.element, k = p.offsetHeight *
                h + "px", p = p.offsetWidth * h + "px", l[l.length] = "\x3cdiv class\x3d'mininavBox' id\x3d'" + g.getDomIdForObjId(f) + "' title\x3d'" + n.getEntityNameOrLabel(b) + "' style\x3d'height:" + k + ";width:" + p + ";left:" + e + ";top:" + d + ";'\x3e\x3c/div\x3e"));
                    m.innerHTML = l.join("");
                    Sfdc.Perf.endMark("mininavDrawBoxes");
                    r()
                }
            }

            function I() {
                1 == n.getCurrentZoomCoeff() ? r() : B()
            }

            function B() {
                var a = m.cloneNode(!0),
            c = a.children,
            b, d, e;
                h = g.getAspectRatio().ratio;
                for (var f = 0, k = c.length; f < k; f++) b = c[f], d = Sfdc.get(g.getObjIdForDomId(b.id)), e = d.style,
            void 0 !== e.left && "" !== e.left && (e = g.translatePositionFromCanvasToMiniNav(parseFloat(e.left), parseFloat(e.top)), void 0 !== e.y && (b = b.style, b.top = e.y + "px", b.left = e.x + "px", b.width = d.offsetWidth * h + "px", b.height = d.offsetHeight * h + "px"));
                c = m.parentNode;
                c.removeChild(m);
                c.appendChild(a);
                m = a;
                r()
            }

            function J(a, c) {
                for (var b, d, e, f, h, k = c.ids, l = k.length; 0 < l--; )
                    if (e = k[l], d = n.schema.getObjectsData()[e]) f = Sfdc.get(g.getDomIdForObjId(e)), c.hidden ? Sfdc.Dom.addClass(f, "hidden") : (b = d.element, f ? Sfdc.Dom.removeClass(f, "hidden") :
                (f = C(d, e), h = e), D(f, b));
                h && h == e && g.select({
                    id: e
                })
            }

            function K(a) {
                a = m.children;
                for (var c, b = n.schema.getObjectsData(), d = 0, e = a.length; d < e; d++)
                    if (aBox = a[d], c = b[g.getObjIdForDomId(aBox.id)]) aBox.title = n.getEntityNameOrLabelForJS(c)
            }

            function C(a, c) {
                var b = document.createElement("div");
                b.className = "mininavBox";
                b.id = g.getDomIdForObjId(c);
                b.title = n.getEntityNameOrLabelForJS(a);
                var d = g.translatePositionFromCanvasToMiniNav(a[SchemaBuilder.pLEFT], a[SchemaBuilder.pTOP]),
            e = b.style;
                e.left = d.x + "px";
                e.top = d.y + "px";
                m.appendChild(b);
                return b
            }

            function D(a, c) {
                var b = g.getAspectRatio().ratio;
                a.style.height = c.offsetHeight * b + "px";
                a.style.width = c.offsetWidth * b + "px"
            }

            function L(a, c) {
                for (var b in c)
                    if (c.hasOwnProperty(b)) {
                        var d = c[b],
                    e = C(d, d[SchemaBuilder.pID]);
                        D(e, d.element)
                    }
            }

            function M(a) {
                if (!(20 > (new Date).getTime() - E)) {
                    var c = s(a),
                b = k.getDimensions(),
                d = g.translatePositionFromMininavToCanvas(c.x, c.y);
                    if (void 0 !== d.x) {
                        var e = d.x,
                    d = d.y,
                    e = e - b.w / 2,
                    d = d - b.h / 2;
                        k.moveViewTo(e, d);
                        e = l.style;
                        b = c.x - parseFloat(e.width) / 2;
                        c = c.y - parseFloat(e.height) /
                    2;
                        g.updateLocatorPosition(b, c);
                        a = Sfdc.Event.getEventTarget(a);
                        Sfdc.Dom.hasClass(a, "mininavBox") && !Sfdc.Dom.hasClass(a, "selected") && Sfdc.Event.fireEvent(k.getCanvas(), "schemabuilder:objectSelected", {
                            data: Sfdc.get(g.getObjIdForDomId(a.id))
                        })
                    }
                }
            }

            function s(a) {
                var c, b = k.getPosition(),
            d = k.getDimensions(),
            e = n.chatterChatEnabled ? 35 : 15;
                c = Sfdc.Event.getMouseX(a) - d.w - b.x + t + 15;
                a = Sfdc.Event.getMouseY(a) - d.h - b.y + u + e;
                return {
                    x: c,
                    y: a
                }
            }

            function N(a) {
                Sfdc.on(f, "mousemove", F);
                var c = s(a);
                x = c.x - l.style.left.replace("px",
            "");
                y = c.y - l.style.top.replace("px", "");
                Sfdc.Event.stop(a)
            }

            function F(a) {
                var c = s(a);
                a = c.x - x;
                var c = c.y - y,
            b = g.translatePositionFromMininavToCanvas(a, c);
                void 0 !== b.x && (v = !0, g.updateLocatorPosition(a, c), k.moveViewTo(b.x, b.y))
            }

            function O(a) {
                Sfdc.un(f, "mousemove", F);
                v && (v = !1, E = (new Date).getTime())
            }

            function G() {
                var a = k.getCanvasPosition(),
            a = g.translatePositionFromCanvasToMiniNav(a.x, a.y);
                g.updateLocatorPosition(a.x, a.y)
            }

            function P(a, c) {
                var b = document.getElementById(g.getDomIdForObjId(c));
                b && Sfdc.Dom.removeChild(b)
            }
            var g = this,
        n = w,
        k = w.canvas,
        t = 150,
        u = 150,
        f, m, l, h, v = !1,
        E;
            this.updateLocatorPosition = function (a, c) {
                if (void 0 !== a) {
                    var b = l.style;
                    b.left = a + "px";
                    b.top = c + "px"
                }
            };
            this.translatePositionFromMininavToCanvas = function (a, c) {
                var b = n.getSchemaCoord();
                return void 0 === b.bottom ? {
                    x: void 0,
                    y: void 0
                } : {
                    x: a / h + b.left,
                    y: c / h + b.top
                }
            };
            this.translatePositionFromCanvasToMiniNav = function (a, c) {
                var b = n.getSchemaCoord();
                if (void 0 === b.bottom) return {
                    x: void 0,
                    y: void 0
                };
                void 0 === h && (h = g.getAspectRatio().ratio);
                return {
                    x: (a - b.left) * h,
                    y: (c -
                b.top) * h
                }
            };
            this.getAspectRatio = function () {
                var a = n.getSchemaCoord();
                if (void 0 === a.bottom) return {
                    ratio: void 0
                };
                var c = u / (a.bottom - a.top),
            a = t / (a.right - a.left);
                return {
                    ratio: c > a ? a : c
                }
            };
            var r = function () {
                if (void 0 !== h) {
                    var a = k.getDimensions(),
                c = l.style;
                    c.width = a.w * h + "px";
                    c.height = a.h * h + "px";
                    a = k.getCanvasPosition();
                    a = g.translatePositionFromCanvasToMiniNav(a.x, a.y);
                    g.updateLocatorPosition(a.x, a.y)
                }
            };
            this.getDomIdForObjId = function (a) {
                return "mn_" + a
            };
            this.getObjIdForDomId = function (a) {
                return a.substr(3, a.length)
            };
            this.select = function (a) {
                if ((a = Sfdc.get(this.getDomIdForObjId(a.id), m)) && !Sfdc.Dom.hasClass(a, "selected")) {
                    for (var c = Sfdc.select(".mininavBox.selected", m), b = 0, d = c.length; b < d; b++) Sfdc.Dom.removeClass(c[b], "selected");
                    Sfdc.Dom.addClass(a, "selected")
                }
            };
            (function () {
                Sfdc.Perf.mark("mininavInit");
                f = document.createElement("div");
                f.id = "schemaBuilderMiniNav";
                f.setAttribute("role", "navigation");
                f.className = "mininav";
                f.style.height = u + "px";
                f.style.width = t + "px";
                var a = document.createElement("h2");
                a.className = "offscreen";
                a.innerHTML = LC.getLabel("SchemaBuilderUi", "navigationWindowTitle");
                m = document.createElement("div");
                m.className = "mininavBoxHolder";
                l = document.createElement("div");
                l.id = "schemaBuilderLocator";
                l.className = "locator";
                l.innerHTML = "\x3cdiv class\x3d'locatorbg'\x3e\x3c/div\x3e";
                f.appendChild(a);
                f.appendChild(m);
                f.appendChild(l);
                k.appendChild(f);
                Sfdc.on(f, "click", M);
                k.addResizeListener(r);
                a = k.getCanvas();
                Sfdc.on(a, "schemabuilder:objectsLoaded", q);
                Sfdc.on(a, "schemabuilder:objectsReloaded", q);
                Sfdc.on(a, "schemabuilder:updateForZoom",
            I);
                Sfdc.on(a, "schemabuilder:itemCreated", q);
                Sfdc.on(a, "schemabuilder:objectSelected", function (a, b) {
                    g.select(b)
                });
                Sfdc.on(a, "schemabuilder:objectRepositioned", z);
                Sfdc.on(a, "schemabuilder:objectDragging", z);
                Sfdc.on(a, "schemabuilder:objectsZoomed", B);
                Sfdc.on(a, "schemabuilder:toggleObjectDisplay", J);
                Sfdc.on(a, "schemabuilder:finishPanning", G);
                Sfdc.on(a, "schemabuilder:viewMoved", G);
                Sfdc.on(a, "schemabuilder:schemaSizeChanged", H);
                Sfdc.on(a, "schemabuilder:objectAdded", L);
                Sfdc.on(a, "schemabuilder:objectWasDeleted",
            P);
                Sfdc.on(a, "schemabuilder:toggleNamesLabels", K);
                Sfdc.on(l, "mousedown", N);
                Sfdc.on(document, "mouseup", O);
                Sfdc.Perf.endMark("mininavInit")
            })();
            return this
        };
        Sfdc.ns("SfdcApp.SchemaBuilder.Schema");
        SfdcApp.SchemaBuilder.Schema = function (H) {
            function P(a, b) {
                var c = k.data[b];
                k.data[b] = void 0;
                delete k.data[b];
                Sfdc.Dom.removeChild(c.element)
            }

            function Q(a, b) {
                var c = k.data[b[SchemaBuilder.pENTITYID]],
            e = c[SchemaBuilder.pFIELDS][b[SchemaBuilder.pID]];
                c[SchemaBuilder.pFIELDS][b[SchemaBuilder.pID]] = void 0;
                Sfdc.Dom.removeChild(e.element)
            }

            function z() {
                var a = !1,
            b = h.canvas.getCanvasPosition(),
            c = b.x,
            e = b.y,
            d = {
                top: 0,
                left: 0,
                bottom: 0,
                right: 0
            },
            n, l, g = {},
            m, p = k.data,
            q;
                for (q in p)
                    if (p.hasOwnProperty(q) && (n = p[q], !n[SchemaBuilder.pHIDDEN])) {
                        m =
                    n.element;
                        n = parseFloat(m.style.left);
                        l = parseFloat(m.style.top);
                        if (void 0 === g.top || g.top > l) g.top = l;
                        if (void 0 === g.left || g.left > n) g.left = n;
                        if (void 0 === g.bottom || g.bottom < l + m.offsetHeight) g.bottom = l + m.offsetHeight;
                        if (void 0 === g.right || g.right < n + m.offsetWidth) g.right = n + m.offsetWidth
                    }
                if (void 0 === f.top || f.top != g.top) d.top = void 0 === f.top ? g.top : f.top - g.top, f.top = g.top, a = !0, 0 > g.top && (e = top);
                if (void 0 === f.left || f.left != g.left) d.left = void 0 === f.left ? g.left : f.left - g.left, f.left = g.left, a = !0, 0 > g.left && (c = left);
                if (void 0 === f.bottom || f.bottom != g.bottom) d.bottom = void 0 === f.bottom ? g.bottom : f.bottom - g.bottom, f.bottom = g.bottom, a = !0;
                if (void 0 === f.right || f.right != g.right) d.right = void 0 === f.right ? g.right : f.right - g.right, f.right = g.right, a = !0;
                a && ((c !== b.x || e !== b.y) && h.canvas.moveViewTo(c, e), Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:schemaSizeChanged", {
                    data: d
                }), v = !0)
            }

            function R(a, b) {
                var c = b.style,
            e = parseFloat(c.top),
            c = parseFloat(c.left),
            e = h.getNormalPositionBasedOnZoom({
                top: e,
                left: c
            }),
            c = k.data[b.id];
                w && !v && (e.top -= p.y, e.left -= p.x);
                c[SchemaBuilder.pTOP] = e.top;
                c[SchemaBuilder.pLEFT] = e.left;
                if (v && w) {
                    for (var d in k.data) k.data.hasOwnProperty(d) && (e = k.data[d], c = e.element.style, c.top && c.left ? (c = {
                        top: parseFloat(c.top),
                        left: parseFloat(c.left)
                    }, c = h.getNormalPositionBasedOnZoom(c), e[SchemaBuilder.pTOP] = c.top + s, e[SchemaBuilder.pLEFT] = c.left + s) : e[SchemaBuilder.pTOP] && e[SchemaBuilder.pLEFT] && (e[SchemaBuilder.pTOP] = e[SchemaBuilder.pTOP] + p.y + s, e[SchemaBuilder.pLEFT] = e[SchemaBuilder.pLEFT] + p.x + s), A(e));
                    I({
                        objs: k.data
                    }, !1);
                    B();
                    d = h.canvas.getCanvas().style;
                    e = h.getPositionBasedOnZoom({
                        top: s,
                        left: s
                    });
                    h.canvas.moveViewTo(-parseFloat(d.left) + e.left, -parseFloat(d.top) + e.top);
                    w = v = !1;
                    p = {
                        x: 0,
                        y: 0
                    }
                } else A(c), B()
            }

            function A(a) {
                var b = {};
                b[SchemaBuilder.pID] = a[SchemaBuilder.pID];
                b[SchemaBuilder.pLAYOUT_ITEM_ID] = a[SchemaBuilder.pLAYOUT_ITEM_ID];
                b[SchemaBuilder.pTOP] = a[SchemaBuilder.pTOP];
                b[SchemaBuilder.pLEFT] = a[SchemaBuilder.pLEFT];
                b[SchemaBuilder.pHIDDEN] = a[SchemaBuilder.pHIDDEN];
                q[a[SchemaBuilder.pLAYOUT_ITEM_ID]] = b
            }

            function S(a) {
                C();
                D();
                var b = Sfdc.Event.getEventTarget(a, "button.menuButton");
                if (b) {
                    var c = Sfdc.Dom.getParent(b, "DIV"),
                c = k.data[c.id];
                    if (!c.menu) {
                        var e = document.createElement("ul");
                        e.className = "action-menu";
                        e.id = c[SchemaBuilder.pID] + ":objMenu";
                        var d = [];
                        c[SchemaBuilder.pIS_CUSTOM] ? d.push('\x3cli class\x3d"action"\x3e') : d.push('\x3cli class\x3d"action-separator"\x3e');
                        d.push('\x3ca href\x3d"" onclick\x3d"SfdcApp.schemaBuilder.schema.hideObject(\'' + c[SchemaBuilder.pID] + '\');return false;" class\x3d"hideObjLink"\x3e');
                        d.push(LC.getLabel("SchemaBuilderUi",
                    "hideObjectLink") + "\x3c/a\x3e\x3c/li\x3e");
                        c[SchemaBuilder.pIS_CUSTOM] && (d.push('\x3cli\x3e\x3ca href\x3d"" onclick\x3d"SfdcApp.schemaBuilder.schema.editObject(\'' + c[SchemaBuilder.pID] + '\');return false;" class\x3d"editObjLink"\x3e'), d.push(LC.getLabel("SchemaBuilderUi", "editObjectProps") + "\x3c/a\x3e\x3c/li\x3e"), c[SchemaBuilder.pMANAGED_STATE] || (d.push('\x3cli\x3e\x3ca href\x3d"" onclick\x3d"SfdcApp.schemaBuilder.schema.deleteObject(\'' + c[SchemaBuilder.pID] + '\');return false;" class\x3d"deleteObjLink"\x3e'),
                    d.push(LC.getLabel("SchemaBuilderUi", "deleteObject") + "\x3c/a\x3e\x3c/li\x3e"), d.push('\x3cli class\x3d"action-separator"\x3e')));
                        d.push('\x3cli class\x3d"help-text"\x3e');
                        d.push(LC.getLabel("SchemaBuilderUi", "menuNote"));
                        d.push('\x3cli class\x3d"action"\x3e');
                        d.push('\x3ca href\x3d"' + c[SchemaBuilder.pURL] + '" id\x3d"' + c[SchemaBuilder.pID] + '_obj" target\x3d"_blank"\x3e');
                        d.push(LC.getLabel("SchemaBuilderUi", "viewObjectLink") + "\x3c/a\x3e\x3c/li\x3e");
                        c[h.pPAGE_LAYOUT_URL] && (d.push('\x3cli class\x3d"action"\x3e'),
                    d.push('\x3ca href\x3d"' + c[h.pPAGE_LAYOUT_URL] + '" id\x3d"' + c[SchemaBuilder.pID] + '_obj" target\x3d"_blank" class\x3d"viewPageLayoutLink"\x3e'), d.push(LC.getLabel("SchemaBuilderUi", "viewPageLayoutsLink") + "\x3c/a\x3e\x3c/li\x3e"));
                        e.innerHTML = d.join("");
                        h.canvas.getCanvas().appendChild(e);
                        c.menu = e
                    }
                    e = Sfdc.Dom.getLocalOffsetXY(c.element);
                    d = Sfdc.Dom.getLocalOffsetXY(b);
                    c.menu.style.top = e.y + d.y + b.offsetHeight + "px";
                    c.menu.style.left = e.x + d.x + "px";
                    Sfdc.Dom.addClass(c.menu, "open")
                }
                if (b = Sfdc.Event.getEventTarget(a,
            "li.field")) x(b.id), Sfdc.Dom.addClass(b, "field-selected");
                Sfdc.Event.stopPropagation(a)
            }

            function E(a) {
                return a[SchemaBuilder.pIS_CUSTOM] && T[a[SchemaBuilder.pDATATYPE]]
            }

            function C() {
                var a = Sfdc.select(".open", h.canvas.getCanvas())[0];
                a && Sfdc.Dom.removeClass(a, "open")
            }

            function D() {
                var a = Sfdc.select(".field-selected", h.canvas.getCanvas())[0];
                a && Sfdc.Dom.removeClass(a, "field-selected")
            }

            function U(a) {
                C();
                D();
                var b = Sfdc.Event.getEventTarget(a, "li.field");
                if (b) {
                    Sfdc.Dom.addClass(b, "field-selected");
                    b = x(b.id);
                    if (!b.menu) {
                        var c = document.createElement("ul");
                        c.className = "action-menu";
                        var e = b[SchemaBuilder.pENTITYID] + ":" + b[SchemaBuilder.pID];
                        c.id = e + ":fldMenu";
                        var d = [];
                        0 < b[SchemaBuilder.pURL].length && (E(b) ? d.push('\x3cli class\x3d"action-separator"\x3e') : d.push('\x3cli class\x3d"action"\x3e'), d.push('\x3ca href\x3d"' + b[SchemaBuilder.pURL] + '" id\x3d"' + e + '_fldLink" target\x3d"_blank"\x3e'), d.push(LC.getLabel("SchemaBuilderUi", "viewFieldLink") + "\x3c/a\x3e\x3c/li\x3e"));
                        E(b) && (d.push('\x3cli class\x3d"action"\x3e'),
                    d.push('\x3ca href\x3d"" onclick\x3d"SfdcApp.schemaBuilder.schema.editField(\'' + e + "','LoadField','editFieldTitle');return false;\" class\x3d\"editFieldLink\"\x3e"), d.push(LC.getLabel("SchemaBuilderUi", "editFieldProps") + "\x3c/a\x3e\x3c/li\x3e"), h.editProfile && (d.push('\x3cli class\x3d"action"\x3e'), d.push('\x3ca href\x3d"" onclick\x3d"SfdcApp.schemaBuilder.schema.editField(\'' + e + "','LoadFLS','editFLS');return false;\" class\x3d\"loadFLSLink\"\x3e"), d.push(LC.getLabel("SchemaBuilderUi", "editFLS") + "\x3c/a\x3e\x3c/li\x3e")),
                    b[SchemaBuilder.pMANAGED_STATE] || (d.push('\x3cli class\x3d"action"\x3e'), d.push('\x3ca href\x3d"" onclick\x3d"SfdcApp.schemaBuilder.schema.deleteField( \'' + e + '\');return false;" class\x3d"deleteFieldLink"\x3e'), d.push(LC.getLabel("SchemaBuilderUi", "deleteField") + "\x3c/a\x3e\x3c/li\x3e")));
                        c.innerHTML = d.join("");
                        h.canvas.getCanvas().appendChild(c);
                        b.menu = c
                    }
                    c = Sfdc.Dom.getElementXY(h.canvas.getViewport());
                    e = h.canvas.getCanvasPosition();
                    b.menu.style.top = e.y + Sfdc.Event.getMouseY(a) - c.y + "px";
                    b.menu.style.left =
                e.x + Sfdc.Event.getMouseX(a) - c.x + "px";
                    Sfdc.Dom.addClass(b.menu, "open");
                    Sfdc.Event.stop(a)
                }
            }

            function V(a) {
                (a = Sfdc.Event.getEventTarget(a, "li.field")) && a.id && k.editField(a.id, "LoadField", "editFieldTitle")
            }

            function W(a, b) {
                var c = b.newLevelValue,
            e = h.canvas.getCanvas();
                h.canvas.getCanvasCenter();
                h.canvas.getCanvasPosition();
                var d = k.data,
            n, l, g;
                f = {
                    top: void 0,
                    left: void 0,
                    bottom: void 0,
                    right: void 0
                };
                for (var m in d)
                    if (d.hasOwnProperty(m) && (n = d[m], !n[SchemaBuilder.pHIDDEN])) {
                        g = n.element;
                        l = parseFloat(n[SchemaBuilder.pLEFT]) *
                    c;
                        n = parseFloat(n[SchemaBuilder.pTOP]) * c;
                        if (void 0 === f.top || f.top > n) f.top = n;
                        if (void 0 === f.left || f.left > l) f.left = l;
                        if (void 0 === f.bottom || f.bottom < n + g.offsetHeight) f.bottom = n + g.offsetHeight;
                        if (void 0 === f.right || f.right < l + g.offsetWidth) f.right = l + g.offsetWidth;
                        g = g.style;
                        g.left = l + "px";
                        g.top = n + "px"
                    }
                Sfdc.Event.fireEvent(e, "schemabuilder:objectsZoomed", {
                    data: {
                        coeff: b.newLevelValue / b.prevLevelValue,
                        newLevel: b.newLevel
                    }
                })
            }

            function X(a, b) {
                var c = b.offsetX,
            e = b.offsetY,
            d = k.data,
            n, l, g;
                for (g in d) d.hasOwnProperty(g) &&
            (l = d[g].element.style, void 0 !== l.left && "" !== l.left && (n = parseFloat(l.top), l.left = parseFloat(l.left) + c + "px", l.top = n + e + "px"));
                f.left && (f.top && f.right && f.bottom) && (f.left += c, f.top += e, f.right += c, f.bottom += e);
                w = !0;
                p.x += c;
                p.y += e;
                Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:afterOffsetSchema", {
                    data: b
                })
            }

            function J(a, b) {
                var c = {};
                c[SchemaBuilder.pLAYOUTID] = k.schemaBuilderLayoutId;
                c[SchemaBuilder.pHIDE_LEGEND_FLAG] = k.schemaBuilderLayout[SchemaBuilder.pHIDE_LEGEND_FLAG];
                F(c)
            }

            function Y(a, b) {
                var c = {};
                c[SchemaBuilder.pLAYOUTID] = k.schemaBuilderLayoutId;
                c[SchemaBuilder.pSHOW_RELATIONSHIP_FLAG] = k.schemaBuilderLayout[SchemaBuilder.pSHOW_RELATIONSHIP_FLAG];
                F(c)
            }

            function Z(a, b) {
                var c = h.canvas.getCanvas(),
            e = h.canvas.getViewport(),
            d, f = 0,
            l, g = b.ids,
            e = Sfdc.select("div.object", e).length - Sfdc.select("div.object.hidden", e).length,
            m = h.canvas.getCanvasPosition();
                d = h.getNormalPositionBasedOnZoom({
                    top: m.y,
                    left: m.x
                });
                for (var m = d.left + 100, p = d.top + 100, q = g.length; 0 < q--; ) {
                    d = k.data[g[q]];
                    if (d[SchemaBuilder.pHIDDEN] =
                b.hidden) Sfdc.Dom.addClass(d.element, "hidden");
                    else {
                        objDomStyle = d.element.style;
                        if (!d[SchemaBuilder.pTOP] || !d[SchemaBuilder.pLEFT]) l = 30 * f, d[SchemaBuilder.pLEFT] = m + l, d[SchemaBuilder.pTOP] = p + l, f++;
                        l = h.getPositionBasedOnZoom({
                            top: d[SchemaBuilder.pTOP],
                            left: d[SchemaBuilder.pLEFT]
                        });
                        objDomStyle.left = l.left + "px";
                        objDomStyle.top = l.top + "px";
                        Sfdc.Dom.removeClass(d.element, "hidden");
                        h.objectZIndex++;
                        objDomStyle.zIndex = h.objectZIndex;
                        l = d.element
                    }
                    A(d)
                }
                z();
                b.hidden || (Sfdc.Event.fireEvent(c, "schemabuilder:objectsReloaded", {
                    data: k.data
                }), 1 < g.length && 0 === e && h.resetView(), Sfdc.Event.fireEvent(c, "schemabuilder:updateForZoom"));
                l && Sfdc.Event.fireEvent(c, "schemabuilder:objectSelected", {
                    data: l
                });
                B()
            }

            function $(a) {
                a = k.data;
                var b, c, e, d, f;
                for (f in a)
                    if (a.hasOwnProperty(f)) {
                        var l = a[f];
                        f = l[SchemaBuilder.pNAME];
                        K(l);
                        flds = l[SchemaBuilder.pFIELDS];
                        for (var g in flds)
                            if (flds.hasOwnProperty(g)) {
                                var m = flds[g];
                                b = m[SchemaBuilder.pID];
                                c = m[SchemaBuilder.pNAME];
                                e = m[SchemaBuilder.pLABEL];
                                d = m[SchemaBuilder.pENTITYID];
                                b = Sfdc.get(d + ":" + b);
                                b =
                            Sfdc.select("a", b)[0];
                                b.innerHTML = h.getFieldNameOrLabel(m, l);
                                m.element && ((h.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_LABELS_FLAG] ? e.length : c.length) + m[SchemaBuilder.pTYPE].length > L ? Sfdc.Dom.addClass(m.element, "wrap") : Sfdc.Dom.removeClass(m.element, "wrap"))
                            }
                    }
                f = {};
                f[SchemaBuilder.pLAYOUTID] = k.schemaBuilderLayoutId;
                f[SchemaBuilder.pSHOW_LABELS_FLAG] = k.schemaBuilderLayout[SchemaBuilder.pSHOW_LABELS_FLAG];
                F(f)
            }

            function K(a) {
                Sfdc.get(".title", a.element).innerHTML = h.getEntityNameOrLabel(a)
            }

            function y(a,
        b) {
                var c = document.createElement("li");
                c.id = a[SchemaBuilder.pENTITYID] + ":" + a[SchemaBuilder.pID];
                var e = h.getFieldNameOrLabel(a, b);
                c.className = e.length + a[SchemaBuilder.pTYPE].length > L ? "field wrap" : "field";
                a[SchemaBuilder.pMANAGED_STATE] && (c.innerHTML = a[SchemaBuilder.pMANAGED_STATE]);
                var d = document.createElement("div");
                d.className = a[SchemaBuilder.pREQUIRED] ? "field-detail required" : "field-detail";
                var f = [];
                f.push('\x3ca class\x3d"field-name" href\x3d"" onclick\x3d"return false;"\x3e' + e + "\x3c/a\x3e");
                f.push('\x3cspan class\x3d"field-type"\x3e' +
            a[SchemaBuilder.pTYPE] + "\x3c/span\x3e");
                f.push('\x3cdiv class\x3d"clear"\x3e\x3c/div\x3e');
                d.innerHTML = f.join("");
                c.appendChild(d);
                return c
            }

            function M(a, b, c, e, d) {
                h.doRequest(r, {
                    method: "POST",
                    data: {
                        action: a,
                        eid: c,
                        id: e
                    },
                    success: function (a) {
                        a = a.deleteConfirmForm;
                        k.deleteId = c;
                        a = Dialogs.createCheckboxWarningDialog(d, aa(a), a[SchemaBuilder.pCHECKBOXLABEL], LC.getLabel("Buttons", "delete"), LC.getLabel("Buttons", "cancel"), function () {
                            ba(b, c, e)
                        });
                        a.setWidth(550);
                        a.show()
                    }
                })
            }

            function aa(a) {
                var b = [];
                b.push(G(a[SchemaBuilder.pMESSAGETOP]));
                b.push(ca(a[SchemaBuilder.pLISTELEMENTLABELS]));
                b.push(G(a[SchemaBuilder.pDATAEXPORTMESSAGE]));
                a = a[SchemaBuilder.pSOFTDELETEINFOMESSAGE];
                for (var c in a) a.hasOwnProperty(c) && b.push(G(a[c]));
                return b.join("")
            }

            function G(a) {
                return '\x3cdiv class\x3d"confirmDeleteDivContent"\x3e' + a + "\x3c/div\x3e"
            }

            function ca(a) {
                var b = [];
                b.push('\x3cul class\x3d"confirmDeleteULContent"\x3e');
                for (var c in a) a.hasOwnProperty(c) && b.push('\x3cli class\x3d"confirmDeleteULContentItem"\x3e' + a[c] + "\x3c/li\x3e");
                b.push("\x3c/ul\x3e");
                return b.join("")
            }

            function ba(a, b, c) {
                h.doRequest(r, {
                    method: "POST",
                    data: {
                        action: a,
                        eid: b,
                        id: c
                    },
                    success: function (e) {
                        e = e.deleteResult;
                        e.wasDeleted ? "DeleteEntity" == a ? Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:objectWasDeleted", {
                            data: b
                        }) : "DeleteField" == a && Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:fieldWasDeleted", {
                            data: {
                                id: c,
                                eid: b
                            }
                        }) : Dialogs.showSimpleError(LC.getLabel("SchemaBuilderUi", "deletionProblem"), e[SchemaBuilder.pDELETEMSG] + e[SchemaBuilder.pRELATEDELEMENT]);
                        k.deleteId =
                    null
                    }
                })
            }

            function u(a) {
                a = a.split(":");
                return k.data[a[0]]
            }

            function x(a) {
                var b = a.split(":");
                return u(a)[SchemaBuilder.pFIELDS][b[1]]
            }
            var k = this,
        h = H,
        T = H.supportedDatatypes,
        t = null,
        f = {
            top: void 0,
            left: void 0,
            bottom: void 0,
            right: void 0
        },
        r = "/_ui/platform/schema/ui/schemabuilder/SchemaBuilderServlet",
        q = {},
        v = !1,
        s = 1E4,
        L = 36,
        w = !1,
        p = {
            x: 0,
            y: 0
        };
            this.doAutoLayout = function () {
                Sfdc.Perf.mark("doAutoLayoutStart");
                var a = [],
            b;
                for (b in k.data)
                    if (k.data.hasOwnProperty(b)) {
                        var c = k.data[b];
                        c[SchemaBuilder.pLAYOUT_ITEM_ID] &&
                    !1 === c[SchemaBuilder.pHIDDEN] && a.push(c[SchemaBuilder.pLAYOUT_ITEM_ID])
                    }
                h.doRequest(r, {
                    data: {
                        action: "AutoLayout",
                        data: Sfdc.JSON.stringify({
                            Objects: a
                        })
                    },
                    success: function (a) {
                        Sfdc.Perf.endMark("doAutoLayoutStart");
                        I(a, !0)
                    }
                })
            };
            this.loadInitial = function () {
                k.schemaBuilderLayout = h.getSchemaBuilderLayout();
                k.schemaBuilderLayoutId = k.schemaBuilderLayout[SchemaBuilder.pLAYOUTID];
                k.initialDisplayLabelFlagValue = k.schemaBuilderLayout[SchemaBuilder.pSHOW_LABELS_FLAG];
                da()
            };
            this.getSchemaBuilderLayoutId = function () {
                return k.schemaBuilderLayoutId
            };
            this.getSchemaBuilderLayout = function () {
                return k.schemaBuilderLayout
            };
            var da = function () {
                Sfdc.Perf.mark("retrieveSchemaStart");
                h.doRequest(r, {
                    data: {
                        action: "LoadInitial"
                    },
                    success: function (a) {
                        Sfdc.Perf.endMark("retrieveSchemaStart");
                        N(a)
                    }
                })
            },
        B = function () {
            !1 !== h.getSaveFlag() && h.doRequest(r, {
                method: "POST",
                data: {
                    action: "SaveObjects",
                    data: Sfdc.JSON.stringify({
                        Objects: q
                    })
                },
                success: function (a) {
                    q = {}
                },
                failure: function (a) {
                    if (a.exCode == SfdcApp.SchemaBuilder.ErrorCodes.ObjectDeleted) {
                        a = null;
                        for (var b in q) q.hasOwnProperty(b) &&
                            (a = q[b].id);
                        a && Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:objectWasDeleted", {
                            data: a
                        })
                    }
                    q = {}
                }
            })
        },
        F = function (a) {
            h.doRequest(r, {
                method: "POST",
                data: {
                    action: "SaveLayout",
                    data: Sfdc.JSON.stringify({
                        sbl: a
                    })
                },
                success: function (a) { }
            })
        };
            this.isFieldVisible = function (a, b) {
                var c = Sfdc.get(a),
            e = Sfdc.get(".scrollMe", c),
            c = Sfdc.get(".object-fields", c),
            c = Sfdc.get(b, e).offsetTop - c.offsetTop - e.scrollTop;
                return c < e.offsetHeight - 4 - 5 && -5 < c ? !0 : !1
            };
            this.isObjectScrollable = function (a) {
                var b = Sfdc.get(".scrollMe",
            a);
                a = Sfdc.get(".object-fields", a);
                return b.offsetHeight < a.offsetHeight ? !0 : !1
            };
            this.selectObject = function (a) {
                var b = this.data[a.id];
                !1 === b[SchemaBuilder.pALL_FLDS_LOADED] || !b.fieldManageabilityLoaded ? h.doRequest(r, {
                    data: {
                        action: "LoadAllFields",
                        id: a.id,
                        slf: k.initialDisplayLabelFlagValue
                    },
                    success: function (c) {
                        b[SchemaBuilder.pFIELDS] = c[SchemaBuilder.pFIELDS];
                        c = Sfdc.get(".scrollMe", b.element);
                        var e = Sfdc.get(".object-fields", c),
                    d = document.createElement("ol");
                        d.className = "object-fields";
                        var f = b[SchemaBuilder.pFIELDS],
                    l;
                        for (l in f)
                            if (f.hasOwnProperty(l)) {
                                var g = f[l],
                            m = Sfdc.get(g[SchemaBuilder.pENTITYID] + ":" + g[SchemaBuilder.pID], e);
                                m ? (e.removeChild(m), g[SchemaBuilder.pMANAGED_STATE] && (m.innerHTML = g[SchemaBuilder.pMANAGED_STATE] + m.innerHTML)) : m = y(g, b);
                                d.appendChild(m);
                                g.element = m
                            }
                        c.removeChild(e);
                        c.appendChild(d);
                        b[SchemaBuilder.pALL_FLDS_LOADED] = !0;
                        b.fieldManageabilityLoaded = !0;
                        k.changeObjectSelected(a);
                        Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:objectFieldsLoaded", {
                            data: b
                        })
                    }
                }) : this.changeObjectSelected(a)
            };
            this.changeObjectSelected = function (a) {
                var b = h.canvas.getCanvas();
                t && Sfdc.Dom.removeClass(t, "selected");
                h.objectZIndex += 1;
                a.style.zIndex = h.objectZIndex;
                Sfdc.Dom.addClass(a, "selected");
                var c = t == a ? null : t;
                t = a;
                Sfdc.Event.fireEvent(b, "schemabuilder:selectionChanged", {
                    data: {
                        deselected: c,
                        selected: t
                    }
                })
            };
            var I = function (a, b) {
                Sfdc.Perf.mark("updateObjectPositionsStart");
                var c = a.objs,
            e = h.canvas.getCanvas(),
            d;
                f = {
                    top: void 0,
                    left: void 0,
                    bottom: void 0,
                    right: void 0
                };
                for (var n in c)
                    if (c.hasOwnProperty(n) && (object = c[n],
                object.id)) {
                        d = k.data[object.id];
                        d[SchemaBuilder.pLEFT] = object[SchemaBuilder.pLEFT];
                        d[SchemaBuilder.pTOP] = object[SchemaBuilder.pTOP];
                        domElement = d.element;
                        var l = h.getPositionBasedOnZoom({
                            top: object[SchemaBuilder.pTOP],
                            left: object[SchemaBuilder.pLEFT]
                        });
                        if (void 0 === f.top || f.top > l.top) f.top = l.top;
                        if (void 0 === f.left || f.left > l.left) f.left = l.left;
                        if (void 0 === f.bottom || f.bottom < l.top + domElement.offsetHeight) f.bottom = l.top + domElement.offsetHeight;
                        if (void 0 === f.right || f.right < l.left + domElement.offsetWidth) f.right =
                    l.left + domElement.offsetWidth;
                        d = k.data[object.id].element.style;
                        d.left = l.left + "px";
                        d.top = l.top + "px";
                        d = object.id
                    }
                Sfdc.Event.fireEvent(e, "schemabuilder:schemaSizeChanged", {
                    data: {
                        top: f.top,
                        left: f.left
                    }
                });
                Sfdc.Event.fireEvent(e, "schemabuilder:objectsReloaded", {
                    data: k.data
                });
                b && h.resetView();
                d && Sfdc.Event.fireEvent(e, "schemabuilder:objectSelected", {
                    data: k.data[d].element
                });
                Sfdc.Event.fireEvent(e, "schemabuilder:objectsRepositioned", {
                    data: k.data
                });
                Sfdc.Event.fireEvent(e, "schemabuilder:updateForZoom");
                h.hideMask();
                Sfdc.Perf.endMark("updateObjectPositionsStart")
            };
            this.getObjectsData = function () {
                return k.data
            };
            var N = function (a) {
                Sfdc.Perf.mark("updateObjectsStart");
                var b = h.canvas.getCanvas();
                k.data = a.objs;
                for (var c in k.data) k.data.hasOwnProperty(c) && (a = k.data[c], a.id && (O(a, !0), Sfdc.Event.fireEvent(b, "schemabuilder:objectUpdated", {
                    data: a
                })));
                h.resetView();
                h.hideMask();
                h.printMode && h.resize();
                Sfdc.Perf.endMark("updateObjectsStart");
                Sfdc.Event.fireEvent(b, "schemabuilder:objectsLoaded", {
                    data: k.data
                });
                Sfdc.Perf.endMark("updateObjectsStart").endMark("PageStart")
            },
        ea = function (a, b) {
            if (b.newFieldInfo) {
                var c = h.canvas.getCanvas(),
                    e = b.newFieldInfo,
                    d = e.fieldValuesMap,
                    f = k.data[e[SchemaBuilder.pENTITYID]],
                    l = f.element;
                f[SchemaBuilder.pFIELDS][d[SchemaBuilder.pID]] = d;
                var g = Sfdc.get(".scrollMe", l),
                    g = Sfdc.get(".object-fields", g);
                D();
                if (e.isInsert) e = y(d, f), g.insertBefore(e, g.firstChild);
                else {
                    var m = Sfdc.get(d[SchemaBuilder.pENTITYID] + ":" + d[SchemaBuilder.pID], g),
                        e = y(d, f);
                    g.insertBefore(e, m);
                    g.removeChild(m)
                }
                d[SchemaBuilder.pRELATIONSHIP] && (f[SchemaBuilder.pREL_FIELDS][d[SchemaBuilder.pID]] =
                    d, Sfdc.Event.fireEvent(c, "schemabuilder:relationshipFieldAdded", {
                        data: {
                            object: f,
                            field: d
                        }
                    }));
                d.element = e;
                Sfdc.Dom.addClass(e, "field-selected");
                Sfdc.Event.fireEvent(c, "schemabuilder:fieldAdded", {
                    data: l
                })
            } else if (b[SchemaBuilder.pOBJECTS]) {
                c = b.objs;
                d = h.canvas.getCanvas();
                f = !1;
                for (l in c) c.hasOwnProperty(l) && (g = c[l], g.id && (k.data[g.id] ? (f = !0, objElem = k.data[g.id].element, k.data[g.id] = g, g.element = objElem, K(g)) : (k.data[g.id] = g, O(g, !1), Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:objectUpdated", {
                    data: g
                }), lastobj = g)));
                f ? Sfdc.Event.fireEvent(d, "schemabuilder:objectDataStoreUpdated", {
                    data: c
                }) : (Sfdc.Event.fireEvent(d, "schemabuilder:objectAdded", {
                    data: c
                }), Sfdc.Event.fireEvent(d, "schemabuilder:objectSelected", {
                    data: g.element
                }));
                z();
                k.selectObject(g.element)
            }
            h.hideMask()
        },
        O = function (a, b) {
            var c = h.canvas.getCanvas(),
                e = document.createElement("div");
            if (a[SchemaBuilder.pHIDDEN]) e.className = "object hidden";
            else {
                e.className = "object";
                var d = h.getPositionBasedOnZoom({
                    left: a[SchemaBuilder.pLEFT],
                    top: a[SchemaBuilder.pTOP]
                });
                e.style.left = d.left + "px";
                e.style.top = d.top + "px"
            }
            e.id = a[SchemaBuilder.pID];
            var d = h.getEntityNameOrLabel(a),
                k = "";
            a[SchemaBuilder.pMANAGED_STATE] && (k = a[SchemaBuilder.pMANAGED_STATE]);
            e.innerHTML = ['\x3ch3 class\x3d"clearfix"\x3e', k, '\x3ca href\x3d"" onclick\x3d"javascript:return false;" id\x3d"' + a[SchemaBuilder.pID] + '_title" class\x3d"title" target\x3d"_blank"\x3e' + d + "\x3c/a\x3e", '\x3cul class\x3d"options"\x3e\x3cli\x3e\x3cbutton class\x3d"iconButton menuButton" onMouseOver\x3d"Sfdc.Dom.addClass(this, \'menuButton-hover\');" onMouseOut\x3d"Sfdc.Dom.removeClass(this, \'menuButton-hover\');"\x3e\x3c/button\x3e\x3c/li\x3e\x3c/ul\x3e\x3c/h3\x3e\x3cdiv class\x3d"scrollMe"\x3e\x3col class\x3d"object-fields"\x3e\x3c/ol\x3e\x3c/div\x3e'].join("");
            c.appendChild(e);
            a.element = e;
            a.element.style.zIndex = h.objectZIndex;
            var c = Sfdc.get(".scrollMe", e),
                d = Sfdc.get(".object-fields", c),
                k = a[SchemaBuilder.pFIELDS],
                l = 0,
                g;
            for (g in k)
                if (k.hasOwnProperty(g)) {
                    var m = k[g];
                    if (l < SchemaBuilderConfig.MAX_FIELDS || m[SchemaBuilder.pRELATIONSHIP]) {
                        var p = y(m, a);
                        d.appendChild(p);
                        m.element = p;
                        l++
                    }
                }
            if (c.offsetHeight < d.offsetHeight || !1 === a[SchemaBuilder.pALL_FLDS_LOADED]) g = document.createElement("div"), g.className = "showMoreFields", g.innerHTML = LC.getLabel("SchemaBuilderUi", "showMoreFields"),
                d = document.createElement("div"), d.className = "moreFieldsShown", d.innerHTML = "\x26nbsp", e.appendChild(g), e.appendChild(d);
            Sfdc.on(c, "scroll", fa);
            if (!a[SchemaBuilder.pHIDDEN] && b) {
                if (void 0 === f.top || f.top > a[SchemaBuilder.pTOP]) f.top = a[SchemaBuilder.pTOP];
                if (void 0 === f.left || f.left > a[SchemaBuilder.pLEFT]) f.left = a[SchemaBuilder.pLEFT];
                if (void 0 === f.bottom || f.bottom < a[SchemaBuilder.pTOP] + e.offsetHeight) f.bottom = a[SchemaBuilder.pTOP] + e.offsetHeight;
                if (void 0 === f.right || f.right < a[SchemaBuilder.pLEFT] + e.offsetWidth) f.right =
                    a[SchemaBuilder.pLEFT] + e.offsetWidth
            }
        },
        fa = function (a) {
            a = Sfdc.Event.getEventTarget(a, "div.object");
            Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:objectScrolled", {
                data: k.data[a.id].element
            })
        };
            this.getSchemaCoord = function () {
                return f
            };
            this.getObjectSchemaData = function (a) {
                return this.data[a]
            };
            this.hideObject = function (a) {
                var b = h.canvas.getCanvas();
                Sfdc.Event.fireEvent(b, "schemabuilder:toggleObjectDisplay", {
                    data: {
                        ids: [a],
                        hidden: !0
                    }
                })
            };
            this.editField = function (a, b, c) {
                var e = u(a);
                a = x(a);
                E(a) && (h.fieldEditorOverlay.setTitle(LC.getLabel("SchemaBuilderUi",
            c, h.getFieldNameOrLabel(a, e), h.getEntityNameOrLabel(e))), h.fieldEditorOverlay.show({
                id: a[SchemaBuilder.pID],
                entityId: e[SchemaBuilder.pID]
            }, b))
            };
            this.editObject = function (a) {
                var b = u(a);
                b[SchemaBuilder.pIS_CUSTOM] && (h.fieldEditorOverlay.setTitle(LC.getLabel("SchemaBuilderUi", "editEntityTitle", b[SchemaBuilder.pNAME])), h.fieldEditorOverlay.show({
                    id: a
                }, "LoadEntity"))
            };
            this.deleteObject = function (a) {
                var b = u(a);
                b && b[SchemaBuilder.pIS_CUSTOM] && M("FetchEntityDeleteMessage", "DeleteEntity", a, null, LC.getLabel("SchemaBuilderUi",
            "deleteObjectTitle", h.getEntityNameOrLabel(b)))
            };
            this.deleteField = function (a) {
                var b = u(a),
            c = x(a);
                if (b && c && c[SchemaBuilder.pIS_CUSTOM]) {
                    var e = b[SchemaBuilder.pID];
                    a = c[SchemaBuilder.pID];
                    b = LC.getLabel("SchemaBuilderUi", "deleteFieldTitle", h.getFieldNameOrLabel(c), h.getEntityNameOrLabel(b));
                    M("FetchFieldDeleteMessage", "DeleteField", e, a, b)
                }
            };
            (function () {
                var a = h.canvas.getCanvas(),
            b = h.canvas.getViewport();
                h.printMode || (Sfdc.on(document.body, "click", C), Sfdc.on(a, "click", S), Sfdc.on(b, "dblclick", V), Sfdc.on(a,
            "contextmenu", U), Sfdc.on(a, "schemabuilder:zoom", W), Sfdc.on(a, "schemabuilder:objectSelected", function (a, b) {
                k.selectObject(b)
            }), Sfdc.on(a, "schemabuilder:objectsAdded", function (a, b) {
                N(b)
            }), Sfdc.on(a, "schemabuilder:offsetSchema", X), Sfdc.on(a, "schemabuilder:objectDragging", z), Sfdc.on(a, "schemabuilder:objectWasDeleted", P), Sfdc.on(a, "schemabuilder:fieldWasDeleted", Q), Sfdc.on(a, "schemabuilder:objectRepositioned", R), Sfdc.on(a, "schemabuilder:toggleNamesLabels", $), Sfdc.on(a, "schemabuilder:toggleObjectDisplay",
            Z), Sfdc.on(a, "schemabuilder:doAutoLayout", k.doAutoLayout), Sfdc.on(a, "schemabuilder:updateSchema", ea), Sfdc.on(a, "schemabuilder:toggleLegend", J), Sfdc.on(a, "schemabuilder:legendClosed", J), Sfdc.on(a, "schemabuilder:toggleLines", Y))
            })();
            return this
        };
        Sfdc.ns("SfdcApp.SchemaBuilder.Sidebar");
        SfdcApp.SchemaBuilder.Sidebar = function (y) {
            function z(a) {
                Sfdc.Event.preventDefault(a);
                Sfdc.Event.stopPropagation(a);
                q(Sfdc.Event.getEventTarget(a));
                m()
            }

            function q(a) {
                var b = a.getAttribute("href", 2),
            c;
                for (c in d.tabMap) d.tabMap.hasOwnProperty(c) && (d.tabMap[c] === a && !Sfdc.Dom.hasClass(a, "selected") ? Sfdc.Dom.addClass(d.tabMap[c], "selectedTab") : Sfdc.Dom.hasClass(d.tabMap[c], "selectedTab") && Sfdc.Dom.removeClass(d.tabMap[c], "selectedTab"));
                for (var e in d.tabContentMap) d.tabContentMap.hasOwnProperty(e) && e ===
            b ? Sfdc.Dom.hasClass(d.tabContentMap[e], "tabHidden") && Sfdc.Dom.removeClass(d.tabContentMap[e], "tabHidden") : Sfdc.Dom.addClass(d.tabContentMap[e], "tabHidden")
            }

            function A() {
                Sfdc.Dom.hasClass(l, "collapsed") ? Sfdc.Dom.removeClass(l, "collapsed") : Sfdc.Dom.addClass(l, "collapsed");
                Sfdc.Event.fireEvent(f, "schemabuilder:resize")
            }

            function m() {
                var a = parseFloat(Sfdc.get("schemaBuilder").style.height),b = parseFloat(Sfdc.select(".sidebarHeader", Sfdc.get("schemaBuilderSidebar"))[0].offsetHeight),
            c = Sfdc.get("sideBarObjectHeader").offsetHeight, a = a - b;
                B.style.height = a - c + "px";
                Sfdc.get("sidebarHeader");
                p.style.height = a + "px"
            }

            function C(a, b) {
                Sfdc.Perf.mark("sidebarInitObject");
                m();
                r(b);
                Sfdc.on(Sfdc.get("group-filter"), "change", D);
                Sfdc.on(Sfdc.get("quick-filter"), "keyup", E);
                Sfdc.on(Sfdc.get("selectAll"), "click", F);
                Sfdc.on(Sfdc.get("clearAll"), "click", G);
                Sfdc.on(g, "click", H);
                Sfdc.on(f, "schemabuilder:toggleNamesLabels", function () {
                    Sfdc.Dom.updateHTML(g, "");
                    r(b)
                });
                Sfdc.Perf.endMark("sidebarInitObject")
            }

            function r(a) {
                var b = [],
            c;
                for (c in a) a.hasOwnProperty(c) &&
            b.push(a[c]);
                var e;
                e = h.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_LABELS_FLAG] ? SchemaBuilder.pLABEL : SchemaBuilder.pNAME;
                b.sort(function (a, b) {
                    var c = a[e];
                    void 0 === c && (c = a[SchemaBuilder.pNAME]);
                    var c = c.toUpperCase(),
                d = b[e];
                    void 0 === d && (d = b[SchemaBuilder.pNAME]);
                    d = d.toUpperCase();
                    return c.localeCompare(d)
                });
                a = 0;
                for (c = b.length; a < c; a++) g.appendChild(s(b[a]))
            }

            function I(a, b) {
                for (var c in b) b.hasOwnProperty(c) && g.insertBefore(s(b[c]), g.firstChild)
            }

            function J(a, b) {
                for (var c in b)
                    if (b.hasOwnProperty(c)) {
                        var e =
                    b[c],
                    d = Sfdc.get(k(e[SchemaBuilder.pID]));
                        Sfdc.select("label", d)[0].innerHTML = h.getEntityNameOrLabel(e)
                    }
            }

            function H(a) {
                var b = Sfdc.Event.getEventTarget(a, "input[type\x3dcheckbox]");
                b ? t([b.id.split(":")[0]], b.checked) : Sfdc.Event.getEventTarget(a, "img.sidebarObjectAction") && (a = Sfdc.Event.getEventTarget(a, "li").id, a = Sfdc.get(a.substr(0, a.length - 12)), u(a))
            }

            function u(a) {
                var b = a.style,
            c = h.getViewDimensions().w;
                h.moveViewTo(parseFloat(b.left) - (c - a.offsetWidth) / 2, parseFloat(b.top) - 200);
                Sfdc.Event.fireEvent(h.canvas.getCanvas(),
            "schemabuilder:objectSelected", {
                data: a
            });
                Sfdc.Event.fireEvent(h.canvas.getCanvas(), "schemabuilder:finishPanning")
            }

            function t(a, b) {
                Sfdc.Event.fireEvent(f, "schemabuilder:toggleObjectDisplay", {
                    data: {
                        ids: a,
                        hidden: !b
                    }
                })
            }

            function K(a, b) {
                for (var c = b.ids, e, d = SchemaBuilder.FILTER_SELECTED, g = c.length; 0 < g--; ) e = c[g], b.hidden ? (Sfdc.Dom.removeClass(Sfdc.get(k(e)), d), Sfdc.get(e + ":objListItemCb").checked = !1) : (Sfdc.Dom.addClass(Sfdc.get(k(e)), d), Sfdc.get(e + ":objListItemCb").checked = !0)
            }

            function D(a) {
                a = Sfdc.Event.getEventTarget(a).value;
                for (var b = Sfdc.select("li", g), c, d = b.length; 0 < d--; ) c = b[d], a == SchemaBuilder.FILTER_ALL || Sfdc.Dom.hasClass(c, a) ? Sfdc.Dom.removeClass(c, SchemaBuilder.pHIDDEN) : Sfdc.Dom.addClass(c, SchemaBuilder.pHIDDEN);
                v()
            }

            function E(a) {
                a = Sfdc.Event.getEventTarget(a).value;
                for (var b = a.replace(RegExp("([\\/.*+?|()[\\]{}\\\\^$])", "g"), "\\$1"), b = a.charAt(0).match(/^\w/) ? RegExp("\\b" + b, "i") : RegExp(b, "i"), c, d = Sfdc.select("li", g), f = d.length; 0 < f--; ) c = d[f], 0 === a.length || b.test(Sfdc.Dom.getText(c)) ? Sfdc.Dom.removeClass(c, n) : Sfdc.Dom.addClass(c,
            n);
                v()
            }

            function v() {
                var a = Sfdc.select("li", g);
                Sfdc.select("li." + SchemaBuilder.pHIDDEN + ",li." + n, g).length == a.length ? Sfdc.Dom.addClass(w, "show") : Sfdc.Dom.removeClass(w, "show")
            }

            function F(a) {
                x(!0);
                Sfdc.Event.preventDefault(a)
            }

            function G(a) {
                x(!1);
                Sfdc.Event.preventDefault(a)
            }

            function x(a) {
                for (var b = Sfdc.select("li", g), c = [], d, f, h = 0, k, m = SchemaBuilder.pHIDDEN, l = b.length; 0 < l--; ) k = b[l], d = k.id.split(":")[0], f = Sfdc.get(d + ":objListItemCb"), f.checked !== a && (!Sfdc.Dom.hasClass(k, m) && !Sfdc.Dom.hasClass(k, n)) && (f.checked =
            a, c[h++] = d);
                0 < c.length && t(c, a)
            }

            function k(a) {
                return a + ":objListItem"
            }

            function L(a, b) {
                var c = document.getElementById(k(b));
                c && Sfdc.Dom.removeChild(c)
            }

            function s(a) {
                var b = document.createElement("li");
                b.className = a[SchemaBuilder.pFILTER_OPTIONS].join(" ");
                b.id = k(a[SchemaBuilder.pID]);
                var c = document.createElement("input");
                !1 === a[SchemaBuilder.pHIDDEN] && (c.defaultChecked = !0);
                c.type = "checkbox";
                c.id = a[SchemaBuilder.pID] + ":objListItemCb";
                var d = document.createElement("label");
                d.htmlFor = c.id;
                d.innerHTML = h.getEntityNameOrLabel(a);
                a = document.createElement("img");
                a.src = "/img/func_icons/util/search16.png";
                a.className = "sidebarObjectAction";
                a.title = LC.getLabel("SchemaBuilderUi", "findObject");
                b.onmouseover = function () {
                    Sfdc.Dom.addClass(this, "over")
                };
                b.onmouseout = function () {
                    Sfdc.Dom.removeClass(this, "over")
                };
                b.appendChild(a);
                b.appendChild(c);
                b.appendChild(d);
                c = document.createElement("br");
                c.className = "clear";
                b.appendChild(c);
                return b
            }

            function M(a) {
                (a = Sfdc.Event.getEventTarget(a, "li.schemaElement")) && Sfdc.Dom.addClass(a, "schemaElement-hover")
            }

            function N(a) {
                (a = Sfdc.Event.getEventTarget(a, "li.schemaElement")) && Sfdc.Dom.removeClass(a, "schemaElement-hover")
            }
            var d = this,
        l = Sfdc.get("schemaBuilderSidebar"),
        B = Sfdc.get("object-listpane"),
        g = Sfdc.get("object-list"),
        p = Sfdc.get("sidebarSchemaElements"),
        w = Sfdc.get("object-list-nomatches"),
        h = y,
        f = h.canvas.getCanvas(),
        n = "qfh";
            d.tabMap = {};
            d.tabContentMap = {};
            this.getSidebar = function () {
                return l
            };
            (function () {
                m();
                h.canvas.addResizeListener(m);
                Sfdc.on(Sfdc.get("sidebar:indicator"), "click", A);
                Sfdc.on(f, "schemabuilder:objectsLoaded",
            C);
                Sfdc.on(f, "schemabuilder:toggleObjectDisplay", K);
                Sfdc.on(f, "schemabuilder:centerOnObject", function (a, b) {
                    u(b)
                });
                Sfdc.on(f, "schemabuilder:objectAdded", I);
                Sfdc.on(f, "schemabuilder:objectDataStoreUpdated", J);
                Sfdc.on(f, "schemabuilder:objectWasDeleted", L);
                Sfdc.on(p, "mouseover", M);
                Sfdc.on(p, "mouseout", N);
                d.tabMap = {
                    SchemaElementHeader: Sfdc.get("SchemaElementHeader"),
                    ObjectHeader: Sfdc.get("ObjectHeader")
                };
                for (var a in d.tabMap)
                    if (d.tabMap.hasOwnProperty(a)) {
                        Sfdc.on(d.tabMap[a], "click", z);
                        var b = d.tabMap[a].getAttribute("href",
                    2);
                        d.tabContentMap[b] = Sfdc.get(b)
                    }
                for (var c in d.tabContentMap) d.tabContentMap.hasOwnProperty(c) && Sfdc.Dom.addClass(d.tabContentMap[c], "tabHidden");
                q(Sfdc.get("ObjectHeader"))
            })();
            return this
        };
        Sfdc.ns("SfdcApp.SchemaBuilder.Toolbar");
        SfdcApp.SchemaBuilder.Toolbar = function (f) {
            function q(a, b) {
                var d = document.createElement("li"),
            c = document.createElement("a");
                c.id = a;
                c.className = "viewOption";
                c.innerHTML = b;
                h.appendChild(d);
                d.appendChild(c);
                return c
            }

            function D(a) {
                l.showMask();
                Sfdc.Event.fireEvent(r.getCanvas(), "schemabuilder:doAutoLayout")
            }

            function E(a) {
                Sfdc.Event.mouseExited(a, b) && z()
            }

            function z() {
                var a = Sfdc.get(".dropdown-trigger-focus", b);
                a && Sfdc.Dom.removeClass(a, "dropdown-trigger-focus");
                if (a = Sfdc.get(".dropdown-child-menu", b)) Sfdc.Dom.addClass(a,
            "dropdown-child-menu-hidden"), a.setAttribute("aria-hidden", "true")
            }

            function F(a) {
                if (a = Sfdc.Event.getEventTarget(a, "a.toolbarButton")) Sfdc.Dom.addClass(a, "dropdown-trigger-focus"), a = Sfdc.Dom.getParent(a, "li"), a = Sfdc.select("ul", a)[0], Sfdc.Dom.removeClass(a, "dropdown-child-menu-hidden"), a.setAttribute("aria-hidden", "false")
            }

            function G(a) {
                a = Sfdc.Event.getEventTarget(a, "a.viewOption");
                var b = r.getCanvas();
                a && a.id && (a.id == A.id ? (k = !k, l.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_LABELS_FLAG] = k, Sfdc.Event.fireEvent(b,
            "schemabuilder:toggleNamesLabels"), Sfdc.get(a).innerHTML = k ? s : t) : a.id == B.id ? (g = !g, l.getSchemaBuilderLayout()[SchemaBuilder.pSHOW_RELATIONSHIP_FLAG] = g, Sfdc.Event.fireEvent(b, "schemabuilder:toggleLines", {
                data: g
            }), Sfdc.get(a).innerHTML = g ? u : v) : a.id == w.id && (d = !d, l.getSchemaBuilderLayout()[SchemaBuilder.pHIDE_LEGEND_FLAG] = d, Sfdc.Event.fireEvent(b, "schemabuilder:toggleLegend", {
                data: d
            }), Sfdc.Event.fireEvent(b, "schemabuilder:updateZoomTool", {
                data: d
            }), Sfdc.get(a).innerHTML = d ? m : n))
            }

            function H() {
                d = !1;
                Sfdc.get(w).innerHTML =
            d ? m : n
            }
            var p = this;
            p.layoutInfo = f.getSchemaBuilderLayout();
            var x, l = f,
        r = f.canvas,
        g, d, k, u, v, s, t, n, m, A, B, w, b, h;
            (function () {
                x = Sfdc.get("schemaBuilderToolbar");
                g = p.layoutInfo[SchemaBuilder.pSHOW_RELATIONSHIP_FLAG];
                d = p.layoutInfo[SchemaBuilder.pHIDE_LEGEND_FLAG];
                k = p.layoutInfo[SchemaBuilder.pSHOW_LABELS_FLAG];
                s = LC.getLabel("SchemaBuilderToolbar", "displayNames");
                t = LC.getLabel("SchemaBuilderToolbar", "displayLabels");
                v = LC.getLabel("SchemaBuilderToolbar", "showLines");
                u = LC.getLabel("SchemaBuilderToolbar", "hideLines");
                n = LC.getLabel("SchemaBuilderToolbar", "showLegend");
                m = LC.getLabel("SchemaBuilderToolbar", "hideLegend");
                var a = document.createElement("ul"),
            f = document.createElement("ul"),
            y = document.createElement("li"),
            c = document.createElement("a");
                c.id = "close-builder";
                c.innerHTML = LC.getLabel("SchemaBuilderToolbar", "closeBuilder");
                c.className = "toolbarButton";
                c.href = l.getRetUrl();
                y.appendChild(c);
                var c = document.createElement("li"),
            e = document.createElement("a");
                e.id = "auto-layout";
                e.className = "toolbarButton";
                e.innerHTML =
            LC.getLabel("SchemaBuilderToolbar", "autoLayout");
                c.appendChild(e);
                b = document.createElement("li");
                b.className = "dropdown-menu";
                b.id = "viewOptions";
                var e = document.createElement("a"),
            C = document.createElement("img");
                C.src = "/img/admin_show_more_arrow.gif";
                e.className = "toolbarButton";
                e.innerHTML = LC.getLabel("SchemaBuilderToolbar", "viewOptions");
                h = document.createElement("ul");
                h.className = "dropdown-child-menu dropdown-child-menu-hidden";
                A = q("nameOption", k ? s : t);
                B = q("lineOption", g ? u : v);
                w = q("legendOption", d ? m :
            n);
                x.appendChild(a);
                a.appendChild(y);
                x.appendChild(f);
                f.appendChild(c);
                f.appendChild(b);
                b.appendChild(e);
                e.appendChild(C);
                b.appendChild(h);
                Sfdc.on(e, "click", F);
                Sfdc.on(h, "click", G);
                Sfdc.on(h, "click", z);
                Sfdc.on(b, "mouseout", E);
                Sfdc.on(r.getCanvas(), "schemabuilder:legendClosed", H);
                Sfdc.on(Sfdc.get("auto-layout"), "click", D)
            })();
            return this
        };
        Sfdc.ns("SfdcApp.SchemaBuilder.ZoomTool");
        SfdcApp.SchemaBuilder.ZoomTool = function (p) {
            function s(a, c) {
                e.style.top = c ? "150px" : "15px"
            }

            function t() {
                var a = f.getDimensions();
                e.style.left = a.w - e.offsetWidth - 15 + "px"
            }

            function u() {
                var a = d.zoomLevel;
                d.zoomLevel < x && (d.zoomLevel++, q(d.zoomLevel, a))
            }

            function v() {
                var a = d.zoomLevel;
                d.zoomLevel > y && (d.zoomLevel--, q(d.zoomLevel, a))
            }

            function g(a, c) {
                Sfdc.Event.preventDefault(a);
                Sfdc.Event.stopPropagation(a);
                if (d.zoomLevel != c) {
                    var b = d.zoomLevel;
                    d.zoomLevel = c;
                    q(c, b)
                }
            }

            function w(a) {
                var c = Sfdc.Event.getEventTarget(a,
            "div.object");
                if (!c || !Sfdc.Dom.hasClass(c, "selected") || !p.isObjectScrollable(c)) {
                    var b;
                    a.wheelDelta ? b = a.wheelDelta : a.detail && (b = -1 * a.detail);
                    0 < b ? v() : u()
                }
            }

            function q(a, c) {
                Sfdc.Event.fireEvent(f.getCanvas(), "schemabuilder:beforeZoom");
                Sfdc.get("zoomIndicatorImg");
                zoomIndicatorImg.src = "/img/schemabuilder/zoom" + a + ".png";
                Sfdc.Dom.removeClass(Sfdc.get("schemaBuilder"), r + c);
                Sfdc.Dom.addClass(Sfdc.get("schemaBuilder"), r + a);
                Sfdc.Event.fireEvent(f.getCanvas(), "schemabuilder:zoom", {
                    data: {
                        newLevel: a,
                        newLevelValue: d.getZoomCoeff(a),
                        prevLevel: c,
                        prevLevelValue: d.getZoomCoeff(c)
                    }
                })
            }
            var d = this,
        f = p.canvas,
        z = p.getSchemaBuilderLayout()[SchemaBuilder.pHIDE_LEGEND_FLAG],
        e, x = 5,
        y = 1,
        r = "schemabuilderZoom";
            this.getZoomCoeff = function (a) {
                a = SfdcApp.SchemaBuilder.ZoomTool.ZoomCoeffMap[a];
                return !a ? 1 : a
            };
            this.getZoomLevel = function () {
                return d.zoomLevel
            };
            this.getCurrentZoomCoeff = function () {
                var a = SfdcApp.SchemaBuilder.ZoomTool.ZoomCoeffMap[d.zoomLevel];
                return !a ? 1 : a
            };
            this.getPositionBasedOnZoom = function (a) {
                var c = a.left;
                a = a.top;
                var b = d.getCurrentZoomCoeff();
                return {
                    left: c * b,
                    top: a * b
                }
            };
            this.getNormalPositionBasedOnZoom = function (a) {
                var c = a.left;
                a = a.top;
                var b = d.getCurrentZoomCoeff();
                return {
                    left: c / b,
                    top: a / b
                }
            };
            (function () {
                e = document.createElement("fieldset");
                e.id = "ZoomTool";
                e.className = "zoomTool";
                var a = document.createElement("a");
                a.id = "ZoomInBtn";
                a.className = "zoomInBtn iconButton";
                var c = document.createElement("div");
                c.className = "zoomLevelIndicator";
                zoomIndicatorImg = document.createElement("img");
                zoomIndicatorImg.className = "zoomLevelIndicatorImg";
                zoomIndicatorImg.src = "/img/schemabuilder/zoom1.png";
                zoomIndicatorImg.useMap = "#zoomIndicatorMap";
                c.appendChild(zoomIndicatorImg);
                var b = document.createElement("map");
                b.name = "zoomIndicatorMap";
                b.id = "zoomIndicatorMap";
                var h = document.createElement("area");
                h.coords = "0,0,25,10";
                h.shape = "RECT";
                h.href = "";
                var k = document.createElement("area");
                k.coords = "0,10,25,19";
                k.shape = "RECT";
                k.href = "";
                var l = document.createElement("area");
                l.coords = "0,19,25,28";
                l.shape = "RECT";
                l.href = "";
                var m = document.createElement("area");
                m.coords = "0,28,25,37";
                m.shape = "RECT";
                m.href = "";
                var n = document.createElement("area");
                n.coords = "0,37,25,47";
                n.shape = "RECT";
                n.href = "";
                b.appendChild(h);
                b.appendChild(k);
                b.appendChild(l);
                b.appendChild(m);
                b.appendChild(n);
                c.appendChild(b);
                b = document.createElement("a");
                b.id = "ZoomOutBtn";
                b.className = "zoomOutBtn iconButton";
                e.appendChild(a);
                e.appendChild(c);
                e.appendChild(b);
                s(null, z);
                f.insertFirstChild(e);
                t();
                d.zoomLevel = 1;
                Sfdc.Dom.addClass(Sfdc.get("schemaBuilder"), r + d.zoomLevel);
                originalCanvasPosition = f.getCanvasPosition();
                Sfdc.on(a,            "click", v);
                Sfdc.on(b, "click", u);
                Sfdc.on(f.getCanvas(), "schemabuilder:updateZoomTool", s);
                Sfdc.on(h, "click", function (a) {
                    g(a, 1)
                });
                Sfdc.on(k, "click", function (a) {
                    g(a, 2)
                });
                Sfdc.on(l, "click", function (a) {
                    g(a, 3)
                });
                Sfdc.on(m, "click", function (a) {
                    g(a, 4)
                });
                Sfdc.on(n, "click", function (a) {
                    g(a, 5)
                });
                f.addResizeListener(t);
                if (Sfdc.userAgent.isFirefox) Sfdc.on(f.getViewport(), "DOMMouseScroll", w);
                else Sfdc.on(f.getViewport(), "mousewheel", w)
            })();
            return this
        };
        SfdcApp.SchemaBuilder.ZoomTool.ZoomCoeffMap = [1, 1, 0.85, 0.7, 0.55, 0.4];

//# sourceMappingURL=/javascript/1410512610000/sfdc/source/SchemaBuilder.js.map
