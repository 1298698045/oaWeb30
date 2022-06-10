function CalFunctions() { }
CalFunctions.listviewComponentId = null;
CalFunctions.setListviewComponentId = function (a) {
    CalFunctions.listviewComponentId = a
};
CalFunctions.isListviewPage = function () {
    return null !== CalFunctions.listviewComponentId && 0 !== CalFunctions.listviewComponentId.length
};
CalFunctions.returnUrlProvider = function () {
    if (CalFunctions.isListviewPage()) {
        var a = ListViewport.instances[CalFunctions.listviewComponentId].retURL;
        if (null !== a && void 0 !== a) return encodeURIComponent(a)
    }
    return window.sfdcPage.getHrefAsRetURL()
};
CalFunctions.fixAddItemLink = function (a) {
    CalFunctions.isListviewPage() && (a.href = CalFunctions.mungeRetUrl(a.href))
};
CalFunctions.fixReturnUrl = function (a) {
    return CalFunctions.isListviewPage() ? CalFunctions.mungeRetUrl(a) : a
};
CalFunctions.fixReturnUrlAndNavigateToUrl = function (a) {
    var c = a;
    CalFunctions.isListviewPage() && (c = CalFunctions.mungeRetUrl(a));
    this.isConsoleContext() && this.isActionUrl(c) ? srcSelf(c) : window.navigateToUrl(c)
};
CalFunctions.isConsoleContext = function () {
    return Sfdc.resolve("Sfdc.servicedeskview")
};
CalFunctions.isActionUrl = function (a) {
    return -1 < a.indexOf("/deleteredirect.aspx") ? !0 : !1
};
CalFunctions.mungeRetUrl = function (a) {
    var c = CalFunctions.returnUrlProvider(),
        d = QueryString.getURI(a);
    a = QueryString.createQueryString(a);
    var b = a.get(EditPageConstants.pSAVE_NEW_URL);
    if (null !== b && void 0 !== b) {
        var e = QueryString.getURI(b),
            b = QueryString.createQueryString(b);
        b.remove(UiData.pRET_URL);
        b.add(UiData.pRET_URL, decodeURIComponent(c));
        a.remove(EditPageConstants.pSAVE_NEW_URL);
        a.add(EditPageConstants.pSAVE_NEW_URL, e + b.toString())
    }
    a.remove(UiData.pRET_URL);
    a.add(UiData.pRET_URL, decodeURIComponent(c));
    return d + a.toString()
};
CalFunctions.onCompleteRerender = function () {
    void 0 !== InlineScheduler.scheduler && null !== InlineScheduler.scheduler && InlineScheduler.scheduler.postRefreshCalendar();
    Hover.clearHovers()
};
CalFunctions.onBeforeDOMUpdate = function () {
    Hover.clearHovers()
};
CalFunctions.safe_html = function (a) {
    return a.replace(/&/g, "\x26amp;").replace(/</g, "\x26lt;").replace(/>/g, "\x26gt;").replace(/'/g, "\x26#39;").replace(/"/g, "\x26quot;")
};
var HomeCalendar = window.parent.HomeCalendar || {
    showCalendarDiv: function (a, b, c) {
        a = Util.evalAjaxServletOutput(a);
        b = document.getElementById(HomeCalendarAjaxServlet.HOME_CALENDAR_ID);
        Sfdc.Dom.updateHTML(b, a[HomeCalendarAjaxServlet.HTML_PAYLOAD_PARAM]);
        document.getElementById(a[HomeCalendarAjaxServlet.ACTIVE_TAB_ID]).focus()
    },
    getRegularEvents: function () {
        HomeCalendar.getCalendarDiv(!1)
    },
    getProposedEvents: function () {
        HomeCalendar.getCalendarDiv(!0)
    },
    getCalendarDiv: function (a) {
        var b = {};
        b[HomeCalendarAjaxServlet.PROPOSED_EVENT_TAB_PARAM] =
            a;
        a = UrlMap.convertClassNameToUrl(HomeCalendarAjaxServlet.SERVLET_NAME, null);
        Sfdc.resolve("privateapi.console") && Sfdc.resolve("DesktopContext.preserveDesktopPageUrl") && (a = DesktopContext.preserveDesktopPageUrl(a, Desktop.VIEW));
        Sfdc.Ajax.request(a, {
            success: HomeCalendar.showCalendarDiv,
            data: b
        })
    }
};
Ext.ns("Sfdc.Scheduling.Controls");
Sfdc.Scheduling.Controls.MultiEntityItemDisplay = function (a) {
    a = a || {};
    Ext.applyIf(a, this.initialConfig);
    Ext.apply(this, a)
};
Sfdc.Scheduling.Controls.MultiEntityItemDisplay.ChangeStatesEnum = {
    ADD: "ADD",
    REMOVE: "REMOVE",
    ADDREMOVE: "ADDREMOVE",
    UNCHANGED: "UNCHANGED"
};
Sfdc.Scheduling.Controls.MultiEntityItemDisplay.prototype = {
    cont: null,
    list: null,
    initialConfig: {
        container: Ext.DomHelper.createTemplate('\x3cdiv class\x3d"sfdc-meid-list-cont"\x3e\x3cul id\x3d"list-{0}" class\x3d"sfdc-meid-list"\x3e\x3c/ul\x3e\x3c/div\x3e'),
        itemsFormat: Ext.DomHelper.createTemplate('\x3cli class\x3d"type-{type} {moreCls}" itemType\x3d"{type}" itemId\x3d"{id}" id\x3d"{listId}-item-{id}" title\x3d"{name:htmlEncode}"\x3e\x3cspan\x3e{name:htmlEncode}\x3c/span\x3e\x3ca class\x3d"sfdc-meid-close-btn"\x3e\x3c/a\x3e\x3c/li\x3e')
    },
    isRendered: !1,
    isReadOnly: !1,
    $mandatory: [],
    $initialData: [],
    $hidden: null,
    onChange: null,
    render: function (a) {
        this.isRendered || (this.cont = this.container.overwrite(a, [this.id], !1), this.list = this.cont.childNodes[0], this.isRendered = !0, Ext.get(this.cont).setSize(this.width, this.height).setStyle("overflow-y", "auto").setStyle("overflow-x", "hidden"), a = Ext.get(a), this.$loadInitialData(a))
    },
    add: function (a) {
        if (!this.isRendered || !a) return !1;
        void 0 === a.length && (a = [a]);
        for (var c = [], b = 0, d; b < a.length; b++) d = a[b], d.listId =
            this.id, d.moreCls = -1 !== this.$mandatory.indexOf(d.id) ? "meid-ismandatory" : "", this.isReadOnly && (d.moreCls += " meid-isreadonly"), d = this.itemsFormat.append(this.list, d, !0), d.on("mouseenter", this.$itemMouseEnter).on("mouseleave", this.$itemMouseLeave), d.child("a").on("click", this.$closeBtnClick, this), c.push(a[b].id);
        this.$constrainWidth();
        this.$syncIdsWithHidden();
        this.$fireEvent("onChange", Sfdc.Scheduling.Controls.MultiEntityItemDisplay.ChangeStatesEnum.ADD, c)
    },
    removeById: function (a) {
        Ext.isArray(a) || (a = [a]);
        for (var c = 0, b; c < a.length; c++) (b = Ext.get(String.format("{0}-item-{1}", this.id, a[c]))) && !b.hasClass("meid-ismandatory") && Ext.removeNode(b.dom);
        this.$syncIdsWithHidden();
        this.$fireEvent("onChange", Sfdc.Scheduling.Controls.MultiEntityItemDisplay.ChangeStatesEnum.REMOVE, a)
    },
    remove: function (a) {
        a && (a = Ext.get(a), a.hasClass("meid-ismandatory") || (Ext.removeNode(a.dom), this.$syncIdsWithHidden(), this.$fireEvent("onChange", Sfdc.Scheduling.Controls.MultiEntityItemDisplay.ChangeStatesEnum.REMOVE, [a.getAttribute("itemId")])))
    },
    get: function (a, c) {
        var b = Ext.get(String.format("{0}-item-{1}", this.id, a));
        return !b ? null : c ? b : b.dom
    },
    setMandatory: function (a) {
        if (!this.isRendered) return this.$mandatory = Ext.value(a, []);
        Ext.select(".meid-ismandatory", this.list).removeClass("meid-ismandatory");
        this.$mandatory = Ext.value(a, []);
        a = 0;
        for (var c; a < this.$mandatory.length; a++) (c = Ext.get(String.format("{0}-item-{1}", this.id, this.$mandatory[a]))) && c.addClass("meid-ismandatory")
    },
    getIds: function (a) {
        for (var c = [], b = this.list.childNodes, d = 0; d < b.length; d++) a &&
            b[d].getAttribute("itemType") !== a || c.push(b[d].getAttribute("itemId"));
        return c
    },
    getItemCount: function () {
        return this.list.childNodes.length
    },
    hasChanged: function () {
        for (var a = {}, c = {}, b = this.$initialData, d = this.list.childNodes, e = Sfdc.Scheduling.Controls.MultiEntityItemDisplay.ChangeStatesEnum, f = 0, g = b.length; f < g; f++) a[b[f].id] = !0;
        b = 0;
        for (f = d.length; b < f; b++) g = d[b].getAttribute("itemId"), a[g] ? a[g] = !1 : c[e.ADD] = !0;
        for (var h in a)
            if (a[h]) {
                c[e.REMOVE] = !0;
                break
            }
        return c[e.ADD] || c[e.REMOVE] ? !c[e.ADD] ? e.REMOVE :
            !c[e.REMOVE] ? e.ADD : e.ADDREMOVE : e.UNCHANGED
    },
    $itemMouseEnter: function (a) {
        Ext.get(a.getTarget()).addClass("hover")
    },
    $itemMouseLeave: function (a) {
        Ext.get(a.getTarget()).removeClass("hover")
    },
    $closeBtnClick: function (a) {
        this.remove(Ext.get(a.getTarget()).up("li"))
    },
    $constrainWidth: function (a) {
        for (var c = Ext.get(this.list).getWidth(!0), b = Ext.get(this.list).query("li"), d = 0; d < b.length; d++) a = Ext.get(b[d]), a.getWidth() > c && a.setWidth(c)
    },
    $loadInitialData: function (a) {
        if (a) {
            var c = a.getAttribute("initialData"),
                b =
                a.getAttribute("initialMandatory"),
                d = a.getAttribute("outputFieldId");
            this.isReadOnly = (a = a.getAttribute("isReadOnly")) && "true" === a;
            if (d && (this.$hidden = document.getElementById(d))) this.$hidden.value = "";
            c && this.add(this.$initialData = Ext.util.JSON.decode(c));
            b && this.setMandatory(Ext.util.JSON.decode(b))
        }
    },
    $syncIdsWithHidden: function () {
        this.$hidden && (this.$hidden.value = this.getIds().join(","))
    },
    $fireEvent: function (a) {
        Ext.isFunction(this[a]) && this[a].apply(this, Array.prototype.slice.call(arguments, 1))
    }
};
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MILLIS_PER_MINUTE = 6E4;
Scheduling.MeetingAssistant.MILLIS_PER_HOUR = 60 * Scheduling.MeetingAssistant.MILLIS_PER_MINUTE;
Scheduling.MeetingAssistant.MILLIS_PER_DAY = 24 * Scheduling.MeetingAssistant.MILLIS_PER_HOUR;
Scheduling.MeetingAssistant.HOURS_PER_DAY = 24;
Scheduling.MeetingAssistant.HALF_HOURS_PER_DAY = 2 * Scheduling.MeetingAssistant.HOURS_PER_DAY;
Scheduling.MeetingAssistant.MINUTES_PER_HALF_HOUR = 30;
Scheduling.MeetingAssistant.DAYS_PER_WEEK = 7;
Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID = 5;
Scheduling.MeetingAssistant.FIRST_DAY_OF_WEEK = 1;
Scheduling.MeetingAssistant.DEFAULT_MEETING_DURATION_IN_MINUTES = 60;
Scheduling.MeetingAssistant.MAX_NUM_PROPOSED_TIME = SuggestedTimeProvider.TARGET_SUGGESTION_NUMBER;
Scheduling.MeetingAssistant.VERTICAL_SCROLLBAR_WIDTH = 20;
Scheduling.MeetingAssistant.TOP_HEADER_HEIGHT = 29;
Scheduling.MeetingAssistant.DAY_NAME_HEIGHT = 22;
Scheduling.MeetingAssistant.HOURS_SIDEBAR_WIDTH = 67;
Scheduling.MeetingAssistant.HOURS_SIDEBAR_CELL_PADDING = 0;
Scheduling.MeetingAssistant.HOURS_SIDEBAR_CELL_WIDTH = Scheduling.MeetingAssistant.HOURS_SIDEBAR_WIDTH - Scheduling.MeetingAssistant.HOURS_SIDEBAR_CELL_PADDING;
Scheduling.MeetingAssistant.GRID_DAY_COLUMN_WIDTH = 91;
Scheduling.MeetingAssistant.HALF_HOUR_TIME_BLOCK_HEIGHT = 16;
Scheduling.MeetingAssistant.GRID_DAY_AND_TIMES_TABLE_WIDTH = Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID * Scheduling.MeetingAssistant.GRID_DAY_COLUMN_WIDTH;
Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_WIDTH = Scheduling.MeetingAssistant.HOURS_SIDEBAR_WIDTH + Scheduling.MeetingAssistant.GRID_DAY_AND_TIMES_TABLE_WIDTH + Scheduling.MeetingAssistant.VERTICAL_SCROLLBAR_WIDTH;
Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_HEIGHT = 400;
Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_WIDTH = 300;
Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_HEADER_HEIGHT = 22;
Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_CELL_HEIGHT = 45;
Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_HEIGHT = Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_HEADER_HEIGHT + Scheduling.MeetingAssistant.MAX_NUM_PROPOSED_TIME * Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_CELL_HEIGHT;
Scheduling.MeetingAssistant.INTER_COLUMN_PADDING = 11;
Scheduling.MeetingAssistant.LEFT_COLUMN_WIDTH = Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_WIDTH + Scheduling.MeetingAssistant.INTER_COLUMN_PADDING;
Scheduling.MeetingAssistant.RIGHT_COLUMN_WIDTH = Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_WIDTH;
Scheduling.MeetingAssistant.MEETING_CHOOSER_PANEL_WIDTH = Scheduling.MeetingAssistant.LEFT_COLUMN_WIDTH + Scheduling.MeetingAssistant.RIGHT_COLUMN_WIDTH;
Scheduling.MeetingAssistant.MEETING_CHOOSER_PANEL_HEIGHT = Scheduling.MeetingAssistant.TOP_HEADER_HEIGHT + Scheduling.MeetingAssistant.DAY_NAME_HEIGHT + Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_HEIGHT;
Scheduling.MeetingAssistant.PORTION_OF_DAY_COLUMN_WIDTH_OCCUPIED_BY_PROPOSED_MEETING_BLOCK = 0.8;
Scheduling.MeetingAssistant.JSON_DATE_FORMAT = "Y-m-d\\TH:i:s";
Scheduling.MeetingAssistant.config = {
    dayNames: "Sun Mon Tue Wed Thu Fri Sat".split(" "),
    hourNames: [],
    shortDateFormat: "j",
    dateFormat: "n/j/Y",
    timeFormat: "g:i A",
    organizerId: "",
    organizerTimeZone: "",
    organizerTimeZoneAlternate: "",
    organizerTimeZoneId: "",
    durationOptions: [],
    retrieveHeatMapData: !0,
    applyConfig: function (b) {
        for (var a in b) a in this && (this[a] = b[a])
    },
    makeHourNames: function () {
        for (var b = (new Date).clearTime(), a = 0; a < Scheduling.MeetingAssistant.HOURS_PER_DAY; a++) b.setHours(a), this.hourNames[a] = DateUtil.getTimeStringFromUserLocale(b)
    }
};
Ext.ns("Scheduling.MeetingAssistant.HeatMapBlock");
Scheduling.MeetingAssistant.HeatMapBlock = Ext.extend(Ext.BoxComponent, {
    constructor: function (a) {
        a = a || {};
        var c = Scheduling.MeetingAssistant.Utils.DimensionsUtil,
            b = c.getPositionAndHeightForTimes(a.start, a.end);
        a = Ext.applyIf(a, {
            width: c.getDayColumnWidth(),
            height: b.height,
            x: b.left,
            y: b.top,
            cls: "heatMapBlock",
            style: {
                opacity: 0
            },
            id: Scheduling.MeetingAssistant.HeatMapBlock.generateId(a.start, a.end, a.userId),
            listeners: {
                render: function (a) {
                    Ext.fly(a.getEl()).setOpacity(0.3, {
                        duration: 0.5
                    })
                }
            }
        });
        Scheduling.MeetingAssistant.HeatMapBlock.superclass.constructor.call(this,
            a)
    }
});
Scheduling.MeetingAssistant.HeatMapBlock.generateId = function (a, c, b) {
    return ["hmb", a.format("w_H_i"), c.format("w_H_i"), b].join("-")
};
Ext.ns("Scheduling.MeetingAssistant.DataStore");
Scheduling.MeetingAssistant.DataStore.HeatMapStore = Ext.extend(Ext.data.Store, {
    constructor: function (a) {
        a = Ext.apply(a || {}, {
            autoDestroy: !0,
            storeId: "storeHeatMapData",
            url: UrlMap.convertClassNameToUrl(BusyTimesAjaxServlet.SERVLET_NAME, null),
            root: "busyblocks",
            fields: [{
                name: "userid",
                type: "string"
            }, {
                name: "userbusyblocks",
                type: "auto"
            }]
        });
        a.reader = new Scheduling.MeetingAssistant.DataStore.CSRFSaveJsonReader(a);
        Scheduling.MeetingAssistant.DataStore.HeatMapStore.superclass.constructor.call(this, a)
    }
});
Scheduling.MeetingAssistant.DataStore.CSRFSaveJsonReader = Ext.extend(Ext.data.JsonReader, {
    constructor: function (a) {
        a = a || {};
        Scheduling.MeetingAssistant.DataStore.CSRFSaveJsonReader.superclass.constructor.call(this, Ext.apply(a, {}))
    },
    read: function (a) {
        a = Sfdc.JSON.parseWithCSRF(a.responseText);
        if (!a) throw {
            message: "JsonReader.read: Json object not found"
        };
        return this.readRecords(a)
    }
});
Ext.ns("Scheduling.MeetingAssistant.MeetingChooserCellTime");
Scheduling.MeetingAssistant.MeetingChooserCellTime = function (a, b, c) {
    this.dayNum = a;
    this.hour = b;
    this.halfHour = c
};
Scheduling.MeetingAssistant.MeetingChooserCellTime.prototype.toDate = function () {
    return Scheduling.MeetingAssistant.MeetingChooserController.getFirstDateTimeInWeek().add(Date.DAY, this.dayNum - 1).add(Date.HOUR, this.hour).add(Date.MINUTE, 30 * this.halfHour)
};
Scheduling.MeetingAssistant.MeetingChooserCellTime.prototype.toString = function () {
    return Scheduling.MeetingAssistant.MeetingChooserCellTime.generateId(this.dayNum, this.hour, 30 * this.halfHour)
};
Scheduling.MeetingAssistant.MeetingChooserCellTime.generateIdFromDate = function (a) {
    var b = 30 * Math.floor(a.getMinutes() / 30);
    return Scheduling.MeetingAssistant.MeetingChooserCellTime.generateId(a.getDay(), a.format("G"), b)
};
Scheduling.MeetingAssistant.MeetingChooserCellTime.generateId = function (a, b, c) {
    return ["mcct", a, b, c].join("-")
};
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserController = {
    currentDuration: Scheduling.MeetingAssistant.DEFAULT_MEETING_DURATION_IN_MINUTES,
    setCurrentTime: function (a) {
        "string" == typeof a && (a = Date.parseDate(a, Scheduling.MeetingAssistant.JSON_DATE_FORMAT));
        var b = 60 * a.getMinutes() + a.getSeconds();
        0 < b && 1800 > b ? (a.setMinutes(30), a.setSeconds(0)) : 1800 < b && (a.setMinutes(0), a.setSeconds(0), a.setHours(a.getHours() + 1));
        a.setMilliseconds(0);
        a.getDay() >= Scheduling.MeetingAssistant.FIRST_DAY_OF_WEEK + Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID &&
            (a = a.clearTime(!0).add(Date.DAY, 1));
        this.currentTime = a;
        this.currentTimezoneOffset = this.getTimezoneOffset(this.currentTime);
        this.setWeek(this.currentTime)
    },
    getCurrentTime: function () {
        return this.currentTime
    },
    getDisplayWeekTimezone: function () {
        return this.displayWeekTimezone
    },
    setWeek: function (a) {
        this.firstDateTimeInWeek = a.clearTime(!0).add(Date.DAY, Scheduling.MeetingAssistant.FIRST_DAY_OF_WEEK - a.getDay());
        this.lastDateTimeInWeek = this.firstDateTimeInWeek.add(Date.DAY, Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID).clearTime(!0).add(Date.SECOND, -1);
        this.displayWeekTimezone = 0 === this.getTimezoneOffset(this.firstDateTimeInWeek) - this.currentTimezoneOffset ? Scheduling.MeetingAssistant.config.organizerTimeZone : Scheduling.MeetingAssistant.config.organizerTimeZoneAlternate
    },
    getFirstDateTimeInWeek: function () {
        return this.firstDateTimeInWeek
    },
    getLastDateTimeInWeek: function () {
        return this.lastDateTimeInWeek
    },
    getMeetingDuration: function () {
        return this.currentDuration
    },
    setMeetingDuration: function (a) {
        this.currentDuration = a
    },
    getTimezoneOffset: function (a) {
        Perf.mark("start of getTimezoneOffset with: " +
            a);
        var b = DateUtil.getTimezones(a);
        Perf.endMark("start of getTimezoneOffset with: " + a);
        a = 0;
        for (var c in b)
            if (b.hasOwnProperty(c)) {
                a = b[c];
                break
            }
        return a
    }
};
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserDaysHeader = Ext.extend(Ext.Panel, {
    layout: "hbox",
    region: "north",
    border: !1,
    bodyBorder: !1,
    width: Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_WIDTH,
    height: Scheduling.MeetingAssistant.DAY_NAME_HEIGHT,
    cls: "daysOfWeekHeader",
    initComponent: function () {
        Scheduling.MeetingAssistant.MeetingChooserDaysHeader.superclass.initComponent.call(this);
        var a = new Ext.BoxComponent({
            width: Scheduling.MeetingAssistant.HOURS_SIDEBAR_WIDTH,
            cls: "emptyDayCell",
            ctCls: "dayNamesContainer"
        });
        this.add(a);
        a = this.getDayLabelsForWeek(Scheduling.MeetingAssistant.MeetingChooserController.getFirstDateTimeInWeek());
        this.dayLabelCells = [];
        for (var b = 0; b < Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID; b++) {
            var c = new Ext.BoxComponent({
                width: Scheduling.MeetingAssistant.GRID_DAY_COLUMN_WIDTH,
                cls: "dayName",
                autoEl: {
                    html: a[b]
                }
            });
            this.add(c);
            this.dayLabelCells[b] = c
        }
        Perf.endMark("start of meetingAssistantWizard")
    },
    setDayLabelsForWeek: function (a) {
        a = this.getDayLabelsForWeek(a);
        for (var b = 0; b < this.dayLabelCells.length; b++) this.dayLabelCells[b].getEl().update(a[b])
    },
    getDayLabelsForWeek: function (a) {
        a = a.clone();
        for (var b = [], c = 0; c < Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID; c++) {
            var d = this.getDayLabel(a);
            b.push(d);
            a = a.add(Date.DAY, 1)
        }
        return b
    },
    getDayLabel: function (a) {
        return Scheduling.MeetingAssistant.config.dayNames[a.getDay()] + " " + a.format(Scheduling.MeetingAssistant.config.shortDateFormat)
    }
});
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserDurationDropdown = Ext.extend(Ext.Panel, {
    dropdownWidth: 140,
    constructor: function (a) {
        a = a || {};
        a = Ext.applyIf(a, {
            height: 60,
            cls: "durationDropdown",
            layout: {
                type: "hbox",
                align: "middle"
            }
        });
        this.dropdownWidth = a.dropdownWidth || this.dropdownWidth;
        Ext.BLANK_IMAGE_URL = Ext.isIE6 || Ext.isIE7 ? "/img/s.gif" : Ext.BLANK_IMAGE_URL;
        Scheduling.MeetingAssistant.MeetingChooserDurationDropdown.superclass.constructor.call(this, a)
    },
    initComponent: function () {
        Scheduling.MeetingAssistant.MeetingChooserDurationDropdown.superclass.initComponent.call(this);
        this.dropdown =
            new Ext.form.ComboBox({
                editable: !1,
                triggerAction: "all",
                store: Scheduling.MeetingAssistant.config.durationOptions,
                listeners: {
                    select: function (a, b, c) {
                        Scheduling.MeetingAssistant.MeetingChooserPanel.getInstance().setProposedMeetingDuration(a.getValue())
                    }
                },
                cls: "manual-mode-duration-selector",
                listClass: "manual-mode-duration-selector-options",
                triggerClass: "manual-mode-duration-selector-trigger",
                width: this.dropdownWidth
            });
        this.add(new Ext.BoxComponent({
            cls: "durationDropdownLabel",
            autoEl: {
                html: LC.getLabel("ProposedEvent",
                    "labelDuration")
            }
        }));
        this.add(this.dropdown)
    },
    setMeetingDuration: function (a) {
        this.dropdown.setValue(a)
    }
});
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserGrid = Ext.extend(Ext.Panel, {
    layout: "table",
    layoutConfig: {
        columns: Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID + 1
    },
    region: "center",
    border: !1,
    bodyBorder: !1,
    width: Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_WIDTH,
    height: Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_HEIGHT - 1,
    cls: "meetingChooserGrid",
    autoScroll: !0,
    listeners: {
        render: function (a) {
            a.getEl().on("click", a.handleClick, a).on("mousedown", a.handleMouseDown, a)
        }
    },
    initComponent: function () {
        Perf.mark("start of meetingChooserGrid init");
        var a = Scheduling.MeetingAssistant;
        this.addEvents("createProposedMeeting");
        this.enableBubble("createProposedMeeting");
        a.MeetingChooserGrid.superclass.initComponent.call(this);
        this.dateFormat = "Y-m-d\\TH:i:s";
        this.heatMapBlocks = [];
        this.absolutelyPositionedComponentsAnchorRow = new Ext.Container({
            id: "positioningRow",
            height: 0,
            colspan: a.NUM_DAYS_SHOWN_IN_GRID + 1
        });
        var b = Scheduling.MeetingAssistant.MeetingChooserPanel.getInstance().currentTimeLine;
        this.absolutelyPositionedComponentsAnchorRow.add(b);
        this.add(this.absolutelyPositionedComponentsAnchorRow);
        this.calendarCells = [];
        this.calendarCells.length = a.HALF_HOURS_PER_DAY * a.NUM_DAYS_SHOWN_IN_GRID;
        var b = 0,
            d = new Date;
        d.setMinutes(0);
        for (var e = {
            width: a.GRID_DAY_COLUMN_WIDTH - 1,
            height: a.HALF_HOUR_TIME_BLOCK_HEIGHT - 1
        }, c, f = 0; f < a.HOURS_PER_DAY; f++) {
            d.setHours(f);
            c = new Ext.BoxComponent({
                rowspan: 2,
                width: a.HOURS_SIDEBAR_CELL_WIDTH - 1,
                cellCls: "hourLabel",
                autoEl: {
                    html: a.config.hourNames[f]
                }
            });
            this.add(c);
            for (var g = 0; 2 > g; g++)
                for (var h = 0; h < a.NUM_DAYS_SHOWN_IN_GRID; h++) e.cellTime = new a.MeetingChooserCellTime(h + 1,
                    f, g), c = new a.WeekViewCell(e), this.add(c), this.calendarCells[b++] = c
            }
            Perf.endMark("start of meetingChooserGrid init")
        },
        handleMouseDown: function (a) {
            this.$mouseDownEl = a.getTarget()
        },
        handleClick: function (a) {
            var b = a.xy[0],
            d = a.xy[1],
            e = Ext.fly(this.$mouseDownEl);
            if (!a.getTarget(".proposedMeetingBlock") && (null === e || !e.parent(".proposedMeetingBlock"))) (a = this.calendarCellForPosition(b, d)) && this.fireEvent("createProposedMeeting", a.cellTime.toDate(), a)
        },
        calendarCellForPosition: function (a, b) {
            var d = Ext.get(Scheduling.MeetingAssistant.WeekViewCell.generateIdFromWeekInfo(1,
                0, 0)).getOffsetsTo(this.body),
            e = a - this.body.getLeft(!1),
            c = b - this.body.getTop(!1) + this.body.getScroll().top,
            c = Math.floor(c / (this.body.dom.scrollHeight / Scheduling.MeetingAssistant.HALF_HOURS_PER_DAY)),
            d = Math.min(Math.floor((e - d[0]) / Scheduling.MeetingAssistant.GRID_DAY_COLUMN_WIDTH), Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID - 1);
            return 0 <= d && 0 <= c ? this.calendarCells[Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID * c + d] : null
        },
        createProposedMeetingBlock: function (a) {
            var b = new Scheduling.MeetingAssistant.ProposedMeetingTime({
                startDateTime: a
            });
            a = Scheduling.MeetingAssistant.Utils.DimensionsUtil.getPositionOfTimeBlock(a);
            b.setPosition(a.left, a.top);
            this.absolutelyPositionedComponentsAnchorRow.add(b);
            this.absolutelyPositionedComponentsAnchorRow.doLayout()
        },
        deleteProposedMeetingBlock: function (a) {
            if (a = Ext.getCmp(Scheduling.MeetingAssistant.ProposedMeetingTime.generateId(a))) a.hide(), a.destroy()
        },
        updateDisplayedWeek: function (a) {
            for (var b = Scheduling.MeetingAssistant.MeetingChooserController.getCurrentTime().getTime(), d = this.calendarCells.length,
                e = 0; e < d; e++) {
                var c = this.calendarCells[e];
                b > c.cellTime.toDate() ? c.getEl().parent().addClass("pastHalfHourCell") : c.getEl().parent().removeClass("pastHalfHourCell")
            }
            a.each(function (a) {
                a = a.get("date");
                (a = Ext.getCmp(Scheduling.MeetingAssistant.ProposedMeetingTime.generateId(a))) && a.hide()
            });
            a = a.getProposedMeetingsForCurrentWeekView();
            Ext.each(a, function (a) {
                if (a = Ext.getCmp(Scheduling.MeetingAssistant.ProposedMeetingTime.generateId(a))) a.show(), a.setDuration(Scheduling.MeetingAssistant.MeetingChooserPanel.getInstance().getProposedMeetingDuration())
            })
        },
        saveScrollbarPosition: function () {
            this.scrollPosition = this.body.dom.scrollTop
        },
        restoreScrollbarPosition: function () {
            this.body.dom.scrollTop = this.scrollPosition
        },
        updateHeatMapBlocks: function (a) {
            for (; 0 < this.heatMapBlocks.length; ) {
                var b = this.heatMapBlocks.pop();
                this.absolutelyPositionedComponentsAnchorRow.remove(b, !0)
            }
            a.each(function (a) {
                var b = a.get("userid");
                a = a.get("userbusyblocks");
                for (var c = 0; c < a.length; c++) {
                    var f = a[c],
                    g = Date.parseDate(f.starttime, this.dateFormat),
                    f = Date.parseDate(f.endtime, this.dateFormat),
                    g = new Scheduling.MeetingAssistant.HeatMapBlock({
                        start: g,
                        end: f,
                        userId: b
                    });
                    this.absolutelyPositionedComponentsAnchorRow.add(g);
                    this.heatMapBlocks.push(g)
                }
            }, this);
            this.absolutelyPositionedComponentsAnchorRow.doLayout()
        }
});
Scheduling.MeetingAssistant.WeekViewCell = Ext.extend(Ext.BoxComponent, {
    constructor: function (a) {
        var b = "calendarCell " + (a.cellTime.halfHour ? "evenHalfHourCell" : "oddHalfHourCell") + (Scheduling.MeetingAssistant.MeetingChooserController.getCurrentTime().getTime() > a.cellTime.toDate() ? " pastHalfHourCell" : "");
        a = Ext.apply({
            id: Scheduling.MeetingAssistant.WeekViewCell.generateComponentId(a.cellTime.toDate()),
            cellId: a.cellTime.toString(),
            cellCls: b
        }, a);
        Scheduling.MeetingAssistant.WeekViewCell.superclass.constructor.call(this,
        a);
        this.cellTime = a.cellTime
    }
});
Scheduling.MeetingAssistant.WeekViewCell.generateComponentId = function (a) {
    return ["wvc", a.getDay(), a.getHours(), a.getMinutes()].join("-")
};
Scheduling.MeetingAssistant.WeekViewCell.generateIdFromWeekInfo = function (a, b, d) {
    return ["wvc", a, b, d].join("-")
};
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserPanel = function (a) {
var b = Scheduling.MeetingAssistant;
a = a || {};
b.config.applyConfig(a);
b.config.makeHourNames();
Ext.applyIf(a, b.config);
b.MeetingChooserController.setCurrentTime(a.currentTime || new Date);
b.MeetingChooserPanel.superclass.constructor.call(this, a);
this.inviteeUserIdsString && (this.inviteeUserIds = this.inviteeUserIdsString.split(","));
this.proposedMeetings = new b.DataStore.ProposedTimesStore;
this.heatMap = new b.DataStore.HeatMapStore;
this.proposedTimesInputId =
a.proposedTimesInputId;
this.meetingDurationInputId = a.meetingDurationInputId;
a.retrieveHeatMapData && this.getHeatMapData()
};
Scheduling.MeetingAssistant.MeetingChooserPanel.getInstance = function () {
return this.$instance
};
Ext.extend(Scheduling.MeetingAssistant.MeetingChooserPanel, Ext.Panel, {
layout: "border",
border: !1,
bodyCssClass: "meetingChooser",
width: Scheduling.MeetingAssistant.MEETING_CHOOSER_PANEL_WIDTH,
height: Scheduling.MeetingAssistant.MEETING_CHOOSER_PANEL_HEIGHT,
initComponent: function () {
    var a = Scheduling.MeetingAssistant;
    a.MeetingChooserPanel.superclass.initComponent.call(this);
    a.MeetingChooserPanel.$instance = this;
    this.topHeader = new a.MeetingChooserTopHeader;
    this.daysHeader = new a.MeetingChooserDaysHeader;
    this.currentTimeLine =
    new a.MeetingChooserTimeLine;
    this.weekViewGrid = new a.MeetingChooserGrid;
    this.durationSlider = new a.MeetingChooserDurationDropdown;
    this.proposedTimesList = new a.MeetingChooserProposedTimesList({
        items: [this.durationSlider]
    });
    this.add([new Ext.Panel({
        region: "west",
        unstyled: !0,
        bodyCssClass: "meetingAssistantGroupingPanel",
        width: Scheduling.MeetingAssistant.LEFT_COLUMN_WIDTH,
        items: [this.topHeader, this.daysHeader, this.weekViewGrid]
    }), new Ext.Panel({
        region: "center",
        unstyled: !0,
        bodyCssClass: "meetingAssistantGroupingPanel",
        width: Scheduling.MeetingAssistant.RIGHT_COLUMN_WIDTH,
        items: [this.proposedTimesList]
    })]);
    this.addEvents("prevWeek", "nextWeek", "createProposedMeeting", "deleteProposedMeeting");
    this.relayEvents(this.topHeader, ["prevWeek", "nextWeek"]);
    this.on("prevWeek", this.goToPrevWeek, this);
    this.on("nextWeek", this.goToNextWeek, this);
    this.on("createProposedMeeting", this.createProposedMeeting, this);
    this.on("deleteProposedMeeting", this.deleteProposedMeeting, this)
},
listeners: {
    afterrender: function (a) {
        this.currentTimeLine.refresh()
    }
},
goToPrevWeek: function () {
    var a = Scheduling.MeetingAssistant;
    a.MeetingChooserController.setWeek(a.MeetingChooserController.getFirstDateTimeInWeek().add(Date.DAY, -a.DAYS_PER_WEEK));
    this.doDisplayedWeekUpdates()
},
goToNextWeek: function () {
    var a = Scheduling.MeetingAssistant;
    a.MeetingChooserController.setWeek(a.MeetingChooserController.getFirstDateTimeInWeek().add(Date.DAY, a.DAYS_PER_WEEK));
    this.doDisplayedWeekUpdates()
},
doDisplayedWeekUpdates: function () {
    this.currentTimeLine.refresh();
    this.topHeader.updateDisplayedWeek();
    this.daysHeader.setDayLabelsForWeek(Scheduling.MeetingAssistant.MeetingChooserController.getFirstDateTimeInWeek());
    this.weekViewGrid.updateDisplayedWeek(this.proposedMeetings);
    this.getHeatMapData()
},
setProposedMeetingDuration: function (a) {
    Scheduling.MeetingAssistant.MeetingChooserController.setMeetingDuration(a);
    this.proposedMeetings.each(function (b) {
        b = b.get("date");
        Scheduling.MeetingAssistant.Utils.DateSpanUtils.isDateInCurrentWeekSpan(b) && (b = Scheduling.MeetingAssistant.ProposedMeetingTime.generateId(b), (b = Ext.getCmp(b)) && b.setDuration(a))
    });
    this.proposedTimesList.updateDisplayedTimes(this.proposedMeetings);
    this.durationSlider.setMeetingDuration(a);
    Ext.get(this.meetingDurationInputId) && (Ext.getDom(this.meetingDurationInputId).value = a)
},
getProposedMeetingDuration: function () {
    return Scheduling.MeetingAssistant.MeetingChooserController.getMeetingDuration()
},
setHeatMapData: function (a) {
    this.heatMap.loadData(a);
    this.weekViewGrid.updateHeatMapBlocks(this.heatMap)
},
setInviteeUserIdsAndRenderHeatMap: function (a) {
    this.inviteeUserIds =
    a;
    this.getHeatMapData()
},
getHeatMapData: function () {
    Perf.mark("start of getHeatMapData");
    var a = [this.organizerId];
    this.inviteeUserIds && Ext.isArray(this.inviteeUserIds) && (a = a.concat(this.inviteeUserIds));
    var b = {};
    b[BusyTimesAjaxServlet.USER_ID_PARAM] = a;
    b[BusyTimesAjaxServlet.TIME_ZONE_PARAM] = this.organizerTimeZoneId;
    b[BusyTimesAjaxServlet.DATE_OF_THE_WEEK_PARAM] = Scheduling.MeetingAssistant.MeetingChooserController.getFirstDateTimeInWeek().format("Y-m-d\\TH:i:s");
    this.heatMap.load({
        params: b,
        callback: this.finishHeatMapUpdate,
        scope: this,
        add: !1
    })
},
finishHeatMapUpdate: function (a, b, c) {
    c && this.weekViewGrid.updateHeatMapBlocks(this.heatMap);
    Perf.endMark("start of getHeatMapData")
},
createProposedMeeting: function (a, b) {
    if (!(Scheduling.MeetingAssistant.MeetingChooserController.getCurrentTime().getTime() > a.getTime()))
        if (this.proposedMeetings.getCount() === Scheduling.MeetingAssistant.MAX_NUM_PROPOSED_TIME) alert(LC.getLabel("ProposedMeeting", "tooManyProposedTimes"));
        else if (!this.proposedMeetings.recordExistsForDate(a)) {
            var c = new Scheduling.MeetingAssistant.ProposedMeetingRecord({
                date: a,
                timezone: Scheduling.MeetingAssistant.MeetingChooserController.getDisplayWeekTimezone()
            });
            this.weekViewGrid.createProposedMeetingBlock(a);
            this.proposedMeetings.add(c);
            this.proposedTimesList.updateDisplayedTimes(this.proposedMeetings)
        }
},
deleteProposedMeeting: function (a) {
    var b = this.proposedMeetings.getRecordForDate(a);
    null !== b && (this.weekViewGrid.deleteProposedMeetingBlock(a), this.proposedMeetings.remove(b), this.proposedTimesList.updateDisplayedTimes(this.proposedMeetings))
},
updateProposedTimesInput: function () {
    if (Ext.getDom(this.proposedTimesInputId)) {
        var a = [];
        this.proposedMeetings.each(function (b) {
            a.push(b.get("date").format(Scheduling.MeetingAssistant.JSON_DATE_FORMAT))
        });
        Ext.getDom(this.proposedTimesInputId).value = "[" + a.join(",") + "]"
    }
},
removeFromWizardBody: function (a) {
    this.weekViewGrid.saveScrollbarPosition();
    this.reparentPanelElement(a);
    this.getEl().setVisibilityMode(Ext.Element.DISPLAY);
    this.getEl().hide()
},
restoreToWizardBody: function (a) {
    this.reparentPanelElement(a);
    this.getEl().show();
    this.weekViewGrid.restoreScrollbarPosition();
    Scheduling.MeetingAssistant.MeetingChooserPanel.getInstance().currentTimeLine.show();
    this.getHeatMapData()
},
reparentPanelElement: function (a) {
    var b = this.getEl();
    b.parent().dom.removeChild(b.dom);
    Ext.get(a).appendChild(b)
},
validate: function () {
    return 1 > this.proposedMeetings.getCount() ? (alert(LC.getLabel("ProposedMeeting", "needAtLeastOneProposedTime")), !1) : !0
}
});
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserProposedTimesList = Ext.extend(Ext.Panel, {
constructor: function (b) {
    b = Ext.applyIf(b || {}, {
        headerCfg: {
            cls: "proposed-time-list-header",
            html: ['\x3cdiv class\x3d"tab-left"\x3e\x3cdiv class\x3d"tab-right"\x3e\x3cdiv class\x3d"tab-middle"\x3e', LC.getLabel("ProposedEvent", "proposedMeetingTimes"), "\x3c/div\x3e\x3c/div\x3e\x3c/div\x3e"].join("")
        },
        width: Scheduling.MeetingAssistant.PROPOSED_TIMES_LIST_WIDTH,
        cls: "proposedTimesList",
        items: []
    });
    for (var a = 0; a < Scheduling.MeetingAssistant.MAX_NUM_PROPOSED_TIME; a++) b.items.push(new Ext.Container({}));
    a = ['\x3cdiv class\x3d"scheduling-auto-mode-preview-text"\x3e', LC.getLabel("ProposedEvent", "autoModeInviteePreview", UserContext.siteUrlPrefix + "/scheduling/sampleInvitation.apexp?mode\x3dmanual"), "\x3c/div\x3e"].join("");
    b.items.push(new Ext.BoxComponent({
        autoEl: {
            html: a
        }
    }));
    Scheduling.MeetingAssistant.MeetingChooserProposedTimesList.superclass.constructor.call(this, b)
},
initComponent: function () {
    Scheduling.MeetingAssistant.MeetingChooserProposedTimesList.superclass.initComponent.call(this);
    this.addEvents("deleteProposedMeeting");
    this.enableBubble("deleteProposedMeeting")
},
updateDisplayedTimes: function (b) {
    for (var a = 0; a < Scheduling.MeetingAssistant.MAX_NUM_PROPOSED_TIME; a++) {
        var c = this.items.get(a + 1);
        c.removeAll();
        if (a < b.getCount()) {
            var d = b.getAt(a).get("date"),
            e = b.getAt(a).get("timezone");
            this.showProposedTimeInCell(c, d, e);
            c.removeClass("proposedTimesListCellEmpty")
        } else c.addClass("proposedTimesListCellEmpty"), c.removeClass("proposedTimesListCell")
    }
},
showProposedTimeInCell: function (b, a, c) {
    var d = a.add(Date.MINUTE, Scheduling.MeetingAssistant.MeetingChooserController.getMeetingDuration());
    b.add(new Ext.Container({
        ctCls: "proposedTimesListCell",
        cls: "proposedTimesListPopulatedCell",
        overCls: "proposedTimesListCellHoverOver",
        items: [new Ext.BoxComponent({
            cls: "proposedTimeListItem",
            autoEl: {
                html: this.formatProposedTimeStr(a, d, c)
            }
        }), new Ext.Button({
            handler: function () {
                this.fireEvent("deleteProposedMeeting", a)
            },
            cls: "closeButton",
            hideLabel: !0,
            scale: "small",
            scope: this,
            template: new Ext.Template('\x3cdiv class\x3d"x-btn {3}"\x3e', '\x3cem class\x3d"{5}" unselectable\x3d"on"\x3e\x3cbutton class\x3d"x-btn-text {2}" type\x3d"{1}"\x3e{0}\x3c/button\x3e\x3c/em\x3e',
            "\x3c/div\x3e")
        })]
    }));
    b.doLayout()
},
formatProposedTimeStr: function (b, a, c) {
    var d = Scheduling.MeetingAssistant.config.dayNames[b.getDay()],
    e = DateUtil.getDateStringFromUserLocale(b);
    b = DateUtil.getTimeStringFromUserLocale(b);
    a = DateUtil.getTimeStringFromUserLocale(a);
    return d + ", " + e + ", " + b + " - " + a + " " + c
}
});
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserTimeLine = Ext.extend(Ext.BoxComponent, {
colspan: Scheduling.MeetingAssistant.NUM_DAYS_SHOWN_IN_GRID,
width: Scheduling.MeetingAssistant.GRID_DAY_COLUMN_WIDTH - 1,
cls: "meetingChooserTimeLine",
style: {
    position: "absolute"
},
initComponent: function () {
    Scheduling.MeetingAssistant.MeetingChooserTimeLine.superclass.initComponent.call(this)
},
refresh: function () {
    var a = Scheduling.MeetingAssistant.Utils.DimensionsUtil.getPositionAndHeightForTimes(Scheduling.MeetingAssistant.MeetingChooserController.currentTime);
    this.setPosition(a.left,
    a.top)
}
});
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.MeetingChooserTopHeader = Ext.extend(Ext.Panel, {
layout: "hbox",
region: "north",
width: Scheduling.MeetingAssistant.MEETING_CHOOSER_GRID_WIDTH,
height: Scheduling.MeetingAssistant.TOP_HEADER_HEIGHT,
cls: "topHeader",
initComponent: function () {
    Scheduling.MeetingAssistant.MeetingChooserTopHeader.superclass.initComponent.call(this);
    this.addEvents("prevWeek", "nextWeek");
    this.displayedWeek = new Ext.BoxComponent({
        height: Scheduling.MeetingAssistant.TOP_HEADER_HEIGHT,
        listeners: {
            render: {
                fn: this.updateDisplayedWeek,
                scope: this
            }
        },
        cls: "displayedWeek",
        ctCls: "displayedWeekContainer"
    });
    var a = new Ext.BoxComponent({
        cls: "busyLegendLeft",
        autoEl: {
            html: LC.getLabel("ProposedEvent", "free")
        }
    }),
    b = new Ext.BoxComponent({
        cls: "busyLegendRight",
        autoEl: {
            html: LC.getLabel("ProposedEvent", "busy")
        }
    });
    this.add([new Ext.Button({
        handler: function () {
            this.fireEvent("prevWeek")
        },
        scope: this,
        cls: "prevWeekButton",
        hideLabel: !0,
        scale: "medium",
        tooltip: LC.getLabel("Page_Schedule", "prevWeek"),
        tooltipType: "title",
        margins: {
            top: 0,
            right: 0,
            bottom: 0,
            left: 10
        },
        template: new Ext.Template('\x3cdiv class\x3d"{3}"\x3e', '\x3cem class\x3d"{5}" unselectable\x3d"on"\x3e\x3cbutton class\x3d"x-btn-text {2}" type\x3d"{1}"\x3e{0}\x3c/button\x3e\x3c/em\x3e', "\x3c/div\x3e")
    }), new Ext.Button({
        handler: function () {
            this.fireEvent("nextWeek")
        },
        scope: this,
        cls: "nextWeekButton",
        hideLabel: !0,
        scale: "medium",
        tooltip: LC.getLabel("Page_Schedule", "nextWeek"),
        tooltipType: "title",
        template: new Ext.Template('\x3cdiv class\x3d"{3}"\x3e', '\x3cem class\x3d"{5}" unselectable\x3d"on"\x3e\x3cbutton class\x3d"x-btn-text {2}" type\x3d"{1}"\x3e{0}\x3c/button\x3e\x3c/em\x3e',
        "\x3c/div\x3e")
    }), this.displayedWeek, b, a])
},
updateDisplayedWeek: function () {
    this.displayedWeek.getEl().update(this.formatWeek())
},
formatWeek: function () {
    return DateUtil.getDateStringFromUserLocale(Scheduling.MeetingAssistant.MeetingChooserController.getFirstDateTimeInWeek()) + " - " + DateUtil.getDateStringFromUserLocale(Scheduling.MeetingAssistant.MeetingChooserController.getLastDateTimeInWeek())
}
});
var OrganizerResponseController = {
hiddenInputId: "",
checkedRadioButtonId: null,
updateTimeOption: function () {
    var a = this.findSelectedOption(),
    a = a ? a.value : "",
    b = Ext.get(this.hiddenInputId);
    b && (b.dom.value = a);
    return !0
},
updateButtonLabel: function () {
    var a = Ext.query(".scheduling-organizer-next-btn"),
    b = this.findSelectedOption();
    0 < a.length && (a[0].value = b ? LC.getLabel("ProposedEvent", "confirm") : LC.getLabel("ProposedEvent", "nextButtonText"))
},
uncheckRadioButtonIfCheckedWhenClicked: function (a) {
    this.checkedRadioButtonId &&
    this.checkedRadioButtonId == a.id ? (a.checked = !1, this.checkedRadioButtonId = null) : this.checkedRadioButtonId = a.id
},
highlightSelectedOption: function (a, b) {
    if (void 0 === a) {
        var d = Ext.query("input[name\x3d'ptoselection']:checked")[0];
        a = void 0 !== d ? d.value : "";
        b = !0
    }
    Ext.select(".selected-time-highlight").removeClass("selected-time-highlight");
    b && Ext.select("*[proposedeventtimeid\x3d'" + a + "']").addClass("selected-time-highlight")
},
onRenderComplete: function () {
    var a = "",
    b = Ext.get(this.hiddenInputId);
    b && (a = b.dom.value);
    for (var b = !1, d = document.getElementsByName("ptoselection"), c = d.length - 1; 0 <= c; c--) d[c].value === a && (b = d[c].checked = !0);
    b && (this.updateButtonLabel(), this.highlightSelectedOption())
},
onTimeRadioButtonClick: function (a) {
    this.uncheckRadioButtonIfCheckedWhenClicked(a);
    this.updateButtonLabel();
    this.highlightSelectedOption(a.value, a.checked)
},
findSelectedOption: function () {
    for (var a = document.getElementsByName("ptoselection"), b = a.length - 1; 0 <= b; b--)
        if (a[b].checked) return a[b]
    },
    goToFullEditPageHandler: function (a,
b) {
        var d = document.getElementById(a),
    c = document.createElement("input");
        c.setAttribute("type", "hidden");
        c.setAttribute("name", EditPageConstants.pSAVE);
        c.setAttribute("value", "1");
        d.appendChild(c);
        c = document.createElement("input");
        c.setAttribute("type", "hidden");
        c.setAttribute("name", EventUi.EVENT_CONVERT);
        c.setAttribute("value", "true");
        d.appendChild(c);
        c = document.createElement("input");
        c.setAttribute("type", "hidden");
        c.setAttribute("name", UiData.pRET_URL);
        c.setAttribute("value", OrganizerController.getParentWindowRef().location.pathname);
        d.appendChild(c);
        d.setAttribute("action", b);
        d.setAttribute("target", "_parent");
        d.submit()
    }
};
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.ProposedMeetingRecord = Ext.data.Record.create([{
    name: "date",
    type: "date"
}, {
    name: "timezone",
    type: "string"
}]);
Ext.ns("Scheduling.MeetingAssistant");
Scheduling.MeetingAssistant.ProposedMeetingTime = Ext.extend(Ext.Panel, {
    constructor: function (a) {
        a = a || {};
        var b = Scheduling.MeetingAssistant,
    c = new Ext.BoxComponent({
        cls: "x-tool",
        height: 15,
        width: 15,
        listeners: {
            render: function (a) {
                a.getEl().on("click", function () {
                    var b = a.ownerCt;
                    b.fireEvent("deleteProposedMeeting", b.startDateTime)
                }, a, {
                    stopEvent: !0
                })
            }
        }
    });
        a = Ext.applyIf(a, {
            cls: "proposedMeetingBlock",
            overCls: "proposedMeetingBlockHover",
            id: b.ProposedMeetingTime.generateId(a.startDateTime),
            items: [c],
            x: 0,
            y: 0,
            duration: b.MeetingChooserController.getMeetingDuration()
        });
        a.height = Scheduling.MeetingAssistant.Utils.DimensionsUtil.getBlockHeightFromDuration(a.startDateTime, a.duration);
        Scheduling.MeetingAssistant.ProposedMeetingTime.superclass.constructor.call(this, a)
    },
    initComponent: function (a) {
        Scheduling.MeetingAssistant.ProposedMeetingTime.superclass.initComponent.call(this, a);
        this.addEvents("deleteProposedMeeting");
        this.enableBubble("deleteProposedMeeting")
    },
    setDuration: function (a) {
        a = Scheduling.MeetingAssistant.Utils.DimensionsUtil.getBlockHeightFromDuration(this.startDateTime,
    a);
        this.setHeight(a)
    }
});
Scheduling.MeetingAssistant.ProposedMeetingTime.generateId = function (a) {
    return ["pmt", a.getFullYear(), a.getMonth(), a.getDate(), a.getHours(), a.getMinutes(), a.getDay()].join("-") + ":"
};
Ext.ns("Scheduling.MeetingAssistant.DataStore");
Scheduling.MeetingAssistant.DataStore.ProposedTimesStore = Ext.extend(Ext.data.Store, {
    getRecordIdxForDate: function (a) {
        return this.findBy(function (b) {
            return b.get("date").getTime() == a.getTime()
        })
    },
    getRecordForDate: function (a) {
        a = this.getRecordIdxForDate(a);
        return -1 !== a ? this.getAt(a) : null
    },
    recordExistsForDate: function (a) {
        return -1 != this.getRecordIdxForDate(a)
    },
    getProposedMeetingsForCurrentWeekView: function () {
        Scheduling.MeetingAssistant.MeetingChooserController.getFirstDateTimeInWeek();
        Scheduling.MeetingAssistant.MeetingChooserController.getLastDateTimeInWeek();
        var a = [];
        this.each(function (b) {
            b = b.get("date");
            Scheduling.MeetingAssistant.Utils.DateSpanUtils.isDateInCurrentWeekSpan(b) && a.push(b)
        });
        return a
    }
});
Ext.ns("Scheduling.MeetingAssistant.Utils");
Scheduling.MeetingAssistant.Utils.DimensionsUtil = {
    getDayColumnWidth: function () {
        return Scheduling.MeetingAssistant.GRID_DAY_COLUMN_WIDTH
    },
    getProposedMeetingDayWidth: function () {
        return this.getDayColumnWidth() * Scheduling.MeetingAssistant.PORTION_OF_DAY_COLUMN_WIDTH_OCCUPIED_BY_PROPOSED_MEETING_BLOCK
    },
    getPositionAndHeightForTimes: function (a, b) {
        var c = Scheduling.MeetingAssistant,
    d = 0;
        if (c.Utils.DateSpanUtils.isDateInCurrentWeekSpan(a)) {
            var e = c.Utils.DimensionsUtil.getPositionOfTimeBlock(a, void 0 === b);
            b &&
        (d = c.Utils.DimensionsUtil.getBusyBlockHeightFromStartEnd(a, b));
            return {
                top: e.top,
                left: e.left,
                height: d
            }
        }
        return {
            top: -1E3,
            left: -1E3,
            height: 0
        }
    },
    getPositionOfTimeBlock: function (a, b) {
        var c = Ext.get(Scheduling.MeetingAssistant.MeetingChooserCellTime.generateIdFromDate(a)),
    d = c.getOffsetsTo(c.parent("table")),
    e = d[1],
    f = a.getMinutes() % 30;
        b && f && (e += c.getHeight() / 30 * f);
        return {
            top: e,
            left: d[0]
        }
    },
    getBusyBlockHeightFromStartEnd: function (a, b) {
        var c = Scheduling.MeetingAssistant.MeetingChooserCellTime,
    d = Ext.get(c.generateIdFromDate(a)),
    c = Ext.get(c.generateIdFromDate(b)),
    e = b.getMinutes() % 30;
        return !d && !c ? 0 : a.getDay() !== b.getDay() ? this.getDistanceBetweenTimeAndEndOfDay(a) : e ? c.getOffsetsTo(d)[1] + c.getHeight() : c.getOffsetsTo(d)[1]
    },
    getDistanceBetweenTimeAndEndOfDay: function (a) {
        a = Ext.get(Scheduling.MeetingAssistant.MeetingChooserCellTime.generateIdFromDate(a));
        var b = a.parent("table");
        return b.getHeight() - a.getOffsetsTo(b)[1]
    },
    getBlockHeightFromDuration: function (a, b) {
        var c = Scheduling.MeetingAssistant,
    d = a.add(Date.MINUTE, b);
        return a.getDay() !==
    d.getDay() ? this.getDistanceBetweenTimeAndEndOfDay(a) : b * (c.HALF_HOUR_TIME_BLOCK_HEIGHT / 30)
    }
};
Scheduling.MeetingAssistant.Utils.DateSpanUtils = {
    isDateInCurrentWeekSpan: function (a) {
        return a.between(Scheduling.MeetingAssistant.MeetingChooserController.firstDateTimeInWeek, Scheduling.MeetingAssistant.MeetingChooserController.lastDateTimeInWeek)
    },
    isDateOnWeekend: function (a) {
        if (!a) return !1;
        a = a.getDay();
        var b = Scheduling.MeetingAssistant;
        return a >= b.FIRST_DAY_OF_WEEK + b.NUM_DAYS_SHOWN_IN_GRID || a < b.FIRST_DAY_OF_WEEK
    }
};
Ext.ns("Sfdc.Scheduling");

function ValidationData(a, b) {
    this.elementToValidate = a;
    this.elementToDisplayError = b
}
var OrganizerController = Sfdc.Scheduling.OrganizerController = {
    message_input_max_length: 1E3,
    inviteeList: [],
    organizerId: null,
    primaryInviteeName: null,
    autoMode: null,
    inviteeListControl: null,
    lastPopup: 0,
    buffer: 1E3,
    isOnHomePage: !1,
    isRequestedMeetingsTabShown: !1,
    init: function () {
        this.HideLoadingIndicator();
        var a = document.getElementById("serverErrors");
        if (a && 0 < a.innerHTML.length) {
           // debugger;
            if (alert(a.innerHTML), window == top && a.innerHTML == LC.getLabel("ProposedEvent", "errorWithFeature"))
                for (; document.firstChild; ) document.removeChild(document.firstChild);
            else this.CloseDialog(), this.getParentWindowRef().OrganizerController || this.refreshParentWindow();
        }
        else {
            Ext.select(".scheduling-select-attendees").on("click", this.selectAttendees, this);
            if (a = Ext.fly("meeting_invitee")) a.on("click", this.selectAttendees, this), a.on("keydown", this.selectAttendees, this, {
                stopEvent: !0
            });
            document.getElementById("inviteeList") && (this.inviteeListControl = new Sfdc.Scheduling.Controls.MultiEntityItemDisplay({
                id: "invitee-meid",
                height: 61,
                width: 739
            }), this.inviteeListControl.render("inviteeList"),
        this.inviteeListControl.onChange = function (a, c) {
            var d = document.getElementById("otherInviteeInfoForEmailPreview");
            if (null !== d) {
                var e = OrganizerController,
                    f = e.inviteeListControl.getIds().length;
                e.primaryInviteeName && (f -= 1);
                d.innerHTML = 0 === f ? "" : e.primaryInviteeName ? 1 == f ? LC.getLabel("ProposedEvent", "labelWhoOneElse") : LC.getLabel("ProposedEvent", "labelWhoManyElse", f) : 1 == f ? LC.getLabel("ProposedEvent", "labelNoWhoOneInvitee") : LC.getLabel("ProposedEvent", "labelNoWhoManyInvitees", f);
                !0 === e.autoMode && (document.getElementById("meetingEmailWhenText").innerHTML =
                    0 === f ? LC.getLabel("ProposedEvent", "defaultWhen", e.primaryInviteeName) : LC.getLabel("ProposedEvent", "labelWhenGroup"))
            }
            a === Sfdc.Scheduling.Controls.MultiEntityItemDisplay.ChangeStatesEnum.REMOVE && (d = ApiUtils.to18CharId(c[0]), (d = Ext.get("response_row_" + d)) && d.fadeOut({
                duration: 0.8,
                callback: function (a) {
                    a.remove()
                }
            }), 0 === this.getItemCount() && OrganizerController.showInviteeInput());
            for (d = 0; d < c.length; d++)
                if ("005" === c[d].substring(0, 3)) {
                    d = this.getIds("user");
                    (e = Scheduling.MeetingAssistant.MeetingChooserPanel.getInstance()) &&
                    e.setInviteeUserIdsAndRenderHeatMap(d);
                    break
                }
            OrganizerController.togglePreviewButtons()
        })
        }
    },
    setInitialFocus: function (a) {
        if (!a) return setFocus();
        a.createTextRange ? (a = a.createTextRange(), a.collapse(!0), a.moveEnd("character", 0), a.moveStart("character", 0), a.select()) : (a.selectionStart && (a.selectionStart = a.selectionEnd = 0), a.focus())
    },
    getParentWindowRef: function () {
        for (var a = window.parent, b = 0; 10 > b++ && void 0 === a.sfdcPage; ) a = a.parent;
        return a
    },
    refreshParentWindow: function () {
        var a = this.getParentWindowRef().location.href,
    b = QueryString.createQueryString(a);
        null !== b.get(SchedulingUtils.SCHEDULING_URL_KEY) ? (b.remove(SchedulingUtils.SCHEDULING_URL_KEY), this.getParentWindowRef().location = QueryString.getURI(a) + b.toString()) : this.isOnHomePage ? (this.getParentWindowRef().focus(), this.isRequestedMeetingsTabShown ? HomeCalendar.getProposedEvents() : HomeCalendar.getRegularEvents()) : this.getParentWindowRef().location.reload(!0)
    },
    saveAndSend: function () {
        var a = document.getElementById("meetingMsgErrorText");
        a.innerHTML = LC.getLabel("ProposedEvent",
    "messageRequired");
        this.disableButtons(!0);
        var b = [],
    c = Sfdc.select("input.meeting_invitee_ids")[0],
    d = Sfdc.select("input.scheduling-email-invitees")[0];
        c && d && b.push(new ValidationData(c, d));
        (c = Sfdc.select("input.scheduling-email-subject")[0]) && b.push(new ValidationData(c, c));
        (c = Sfdc.select("textarea.scheduling-email-message")[0]) && b.push(new ValidationData(c, c));
        (b = this.validateFields(b)) ? c.value.length > this.message_input_max_length && (addStyleClass(c.parentNode, "error"), a.innerHTML = LC.getLabel("ProposedMeeting",
    "errorMaxCommentLength"), this.disableButtons(!1), b = !1) : this.disableButtons(!1);
        return b
    },
    navigate: function () {
        var a = Sfdc.select("input.scheduling-email-subject")[0];
        delStyleClass(a.parentNode, "error")
    },
    validateFields: function (a) {
        for (var b = !0, c = 0; c < a.length; c++) "" === a[c].elementToValidate.value ? (addStyleClass(a[c].elementToDisplayError.parentNode, "error"), b = !1) : delStyleClass(a[c].elementToDisplayError.parentNode, "error");
        return b
    },
    CheckServerError: function (a, b) {
        a && (document.getElementById("serverErrors").innerHTML =
    a, alert(a));
        a && b && (this.CloseDialog(), this.refreshParentWindow())
    },
    onSaveComplete: function (a, b) {
        a ? (document.getElementById("serverErrors").innerHTML = a, alert(a), b ? (this.CloseDialog(), this.refreshParentWindow()) : this.disableButtons(!1)) : (this.CloseDialog(), this.refreshParentWindow())
    },
    Cancel: function () {
        return this.CloseDialog()
    },
    CloseDialog: function () {
        var a = this.getParentWindowRef().sfdcPage;
        a && a.getDialogById("Organizer_Dialog") && a.getDialogById("Organizer_Dialog").hide();
        return !1
    },
    disableButtons: function (a) {
        var b =
    Ext.query(".scheduling-organizer input.btn, .meeting-assistant-wizard input.btn");
        if (0 !== b.length)
            for (var c = 0; c < b.length; c++) (b[c].disabled = a) ? addStyleClass(b[c], "btnDisabled") : delStyleClass(b[c], "btnDisabled")
    },
    disableEnter: function (a) {
        var b;
        window.event ? b = window.event.keyCode : a && (b = a.which);
        return 13 != b
    },
    hideInviteeInput: function () {
        Ext.fly("inviteeFakeInput").setDisplayed("none");
        Ext.fly("inviteeList").setDisplayed("block")
    },
    showInviteeInput: function () {
        Ext.fly("inviteeList").setDisplayed("none");
        Ext.fly("inviteeFakeInput").setDisplayed("block")
    },
    HideLoadingIndicator: function () {
        var a = this.getParentWindowRef().SchedulingProposeMeeting;
        a && a.HideLoading()
    },
    EnforceTextAreaMaxLength: function (a, b) {
        function c() {
            handleTextAreaElementChange(d, b, LC.getLabel("Edit", "CharactersRemaining"), LC.getLabel("Edit", "CharactersOver"))
        }
        if (!(null === a || null === b)) {
            var d = a.id;
            if (!document.getElementById(d + "_counter")) {
                var e = document.createElement("SPAN");
                e.id = d + "_counter";
                var f = document.createElement("DIV");
                f.appendChild(e);
                document.getElementById("lblMsg").appendChild(f)
            }
            e = isIE ? ["propertychange"] : ["keydown", "keyup", "change", "click", "mousedown"];
            for (f = 0; f < e.length; f++) attachEventToElement(a, e[f], c);
            c()
        }
    },
    validateStep: function (a, b) {
        return 1 == a && b == OrganizerPage.PROPOSE_TIME_MODE_MANUAL ? Scheduling.MeetingAssistant.MeetingChooserPanel.getInstance().validate() : !0
    },
    headerInputOnchange: function (a, b) {
        var c = Ext.get(b);
        if (c) {
            var d = CalFunctions.safe_html(a.value);
            d || (d = "\x26nbsp;");
            c.dom.innerHTML = d
        }
    },
    selectAttendees: function (a, b) {
        a.stopEvent();
        var c = (new Date).getTime();
        if (!(this.lastPopup + this.buffer > c)) {
            this.lastPopup = c;
            c = this.inviteeListControl.getIds();
            c.push(this.organizerId);
            var d = new QueryString("", !0);
            d.add("invtdids", c.join(","));
            d.add(InviterLookup.HIDE_SEARCH_TYPES, "023");
            d.add(InviterLookup.RETURN_INVITEE_DATA, "1");
            d.add(InviterLookup.EMAIL_ADDRESS_REQUIRED, "1");
            d.add(InviterLookup.MAX_TOTAL_ATTENDEES, OrganizerPage.MAX_TOTAL_ATTENDEES);
            c = UserContext.getUrl("/email/inviter.aspx") + d.toString();
            setLastMousePosition(a && a.browserEvent);
            openPopupFocus(c, "_blank", 670, 400, "width\x3d670,height\x3d400,resizable\x3dyes,toolbar\x3dno,status\x3dno,scrollbars\x3dyes,menubar\x3dno,directories\x3dno,location\x3dno,dependant\x3dyes", !0, !0);
            window.updateOpener = function (a, b, c) {
                OrganizerController.addInvitees(c)
            };
            return !1
        }
    },
    addInvitees: function (a) {
        OrganizerController.inviteeListControl.add(a);
        OrganizerController.hideInviteeInput()
    },
    syncHiddenToRadio: function (a, b) {
        for (var c = document.getElementById(a).value, d = document.getElementsByName(b),
        e = 0; e < d.length; e++) d[e].value == c && (d[e].checked = !0)
    },
    radioSelectValueToHidden: function (a, b) {
        for (var c = document.getElementsByName(a), d = 0; d < c.length; d++) c[d].checked && (document.getElementById(b).value = c[d].value)
    },
    initPreview: function () {
        this.togglePreviewButtons();
        var a = Sfdc.select("TEXTAREA.scheduling-email-message");
        if (0 !== a.length) {
            this.setInitialFocus(a[0]);
            for (var b = 0; b < a.length; b++) this.EnforceTextAreaMaxLength(a[b], this.message_input_max_length)
        }
    },
    togglePreviewButtons: function () {
        var a = Ext.select(".scheduling-organizer-sendtoupdated-btn"),
    b = Ext.select(".scheduling-organizer-send-btn");
        0 === a.getCount() || this.inviteeListControl.hasChanged() === Sfdc.Scheduling.Controls.MultiEntityItemDisplay.ChangeStatesEnum.UNCHANGED ? (a.setVisibilityMode(Ext.Element.DISPLAY).hide(), b.set({
            value: LC.getLabel("Buttons", "send")
        })) : (a.show(), b.set({
            value: LC.getLabel("ProposedEvent", "saveAndUpdateAll")
        }))
    }
};

function addLoadEvent(a) {
    var b = window.onload;
    window.onload = "function" != typeof window.onload ? a : function () {
        b();
        a()
    }
}
addLoadEvent(function () {
    setTimeout(function () {
        OrganizerController.init()
    }, 0)
});