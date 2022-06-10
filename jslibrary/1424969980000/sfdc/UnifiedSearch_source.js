/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Sfdc.provide("SfdcApp.Search.PinnedContextActions", function (e) {
    return {
        items: [],
        selected: -1,
        link: null,
        linkId: null,
        popup: null,
        hasFocus: !1,
        stopIfNav: function (a, b) {
            var c = a.getKey();
            (c >= e.Event.keyCode.ARROW_L && c <= e.Event.keyCode.ARROW_D || c === KEY_TAB) && a.stopEvent()
        },
        resetMenu: function () {
            var a = SfdcApp.Search.PinnedContextActions; -1 !== a.selected && Ext.get(a.items.elements[a.selected]).first().removeClass("searchMenuSelectedRow");
            a.selected = -1;
            a.hasFocus = !1
        },
        navUp: function () {
            var a, b = SfdcApp.Search.PinnedContextActions;
            if (0 < b.selected) {
                var c = b.selected;
                b.selected -= 1;
                a = b.items.elements[b.selected];
                Ext.fly(a).isVisible() ? (Ext.get(b.items.elements[c]).first().removeClass("searchMenuSelectedRow"), a = Ext.fly(a).first(), a.focus(), a.addClass("searchMenuSelectedRow")) : b.navUp()
            } else b.resetMenu(), Ext.fly(b.linkId).focus()
        },
        navDown: function () {
            var a, b = SfdcApp.Search.PinnedContextActions;
            if (b.selected < b.items.getCount() - 1) {
                var c = b.selected;
                b.selected += 1;
                a = b.items.elements[b.selected];
                Ext.fly(a).isVisible() ? (-1 !== c && Ext.get(b.items.elements[c]).first().removeClass("searchMenuSelectedRow"),
                    a = Ext.fly(a).first(), a.focus(), a.addClass("searchMenuSelectedRow")) : b.navDown()
            }
        },
        onNav: function (a, b) {
            var c = a.getKey(),
                d = SfdcApp.Search.PinnedContextActions;
            switch (c) {
                case KEY_ARROW_D:
                    d.navDown();
                    break;
                case KEY_ARROW_U:
                    d.navUp();
                    break;
                case KEY_ESC:
                    d.closePopup();
                    Ext.fly(d.linkId).focus();
                    break;
                case KEY_TAB:
                    a.shiftKey ? d.navUp() : d.navDown()
            }
            d.stopIfNav(a, b)
        },
        menuItemClicked: function (a, b) {
            var c = SfdcApp.Search.PinnedContextActions;
            a.stopEvent();
            if (c.params.menuItemClickedCallBack) {
                var d = b.parentNode.getAttribute("data-menuCommand");
                c.params.menuItemClickedCallBack(d)
            }
        },
        setFocused: function () {
            var a = SfdcApp.Search.PinnedContextActions;
            a.hasFocus || (a.hasFocus = !0)
        },
        menuItemFocused: function (a, b) {
            var c = SfdcApp.Search.PinnedContextActions;
            c.focusedMenuItem = this;
            c.hasFocus || (c.hasFocus = !0, c.navDown())
        },
        htmlBodyClicked: function (a, b) {
            var c = SfdcApp.Search.PinnedContextActions;
            c.popup.isVisible() && !a.within(SfdcApp.Search.Page.PINNED_ACTION_MENU) && c.closePopup()
        },
        isVisible: function () {
            var a = SfdcApp.Search.PinnedContextActions;
            return a.popup &&
                a.popup.isVisible()
        },
        bindEvents: function (a) {
            var b = this,
                c = a ? "on" : "un";
            Ext.isGecko ? (b.popup[c]("keypress", b.onNav), b.popup[c]("keydown", b.stopIfNav)) : (b.popup[c]("keydown", b.onNav), Ext.EventManager[c](window, "keydown", b.stopIfNav));
            b.popup[c]("keyup", b.stopIfNav);
            b.items.each(function (a, e) {
                e = a.first();
                e[c]("click", b.menuItemClicked);
                e[c]("focus", b.menuItemFocused)
            });
            Ext.getBody()[c]("click", b.htmlBodyClicked)
        },
        openPopup: function (a) {
            e.assert(!e.isEmpty(a), "params cannot be empty");
            var b = a.linkId;
            this.hasFocus = !1;
            this.params = a;
            this.popup = Ext.get(SfdcApp.Search.Page.PINNED_ACTION_MENU);
            this.link = Ext.get(b);
            a = this.link.parent();
            var c = this.popup.getWidth();
            this.popup.appendTo(a);
            this.popup.setWidth(c);
            this.items = this.popup.select(".searchActionMenuItem", !0);
            for (c = 0; c < this.items.getCount(); c++) Ext.get(this.items.elements[c]).first().removeClass("searchMenuSelectedRow");
            this.linkId = b;
            this.selected = -1;
            this.bindEvents(!0);
            b = this.link.getXY();
            c = a.getXY();
            LC.isRtlPage() ? (a = c[0] + a.getWidth() - (b[0] + this.link.getWidth()),
                this.popup.setRight(a)) : this.popup.setLeft(b[0] - c[0]);
            a = b[1] - c[1] + this.link.getHeight();
            this.popup.setTop(a);
            this.link.addClass("itemActionMenuOpened");
            Ext.isIE7 && this.link.parent().addClass("itemLinkMenuOpened");
            this.popup.setVisibilityMode(Ext.Element.VISIBILITY).setVisible(!0)
        },
        closePopup: function (a) {
            var b = Ext.get(SfdcApp.Search.Page.PINNED_ACTION_MENU);
            b.isVisible() && (this.focusedMenuItem && Ext.get(this.focusedMenuItem).blur(), b.setVisibilityMode(Ext.Element.VISIBILITY).setVisible(!1), this.link.removeClass("itemActionMenuOpened"),
                this.link.parent().removeClass("itemLinkMenuOpened"), b.appendTo(Ext.get("searchPageHolderDiv")));
            SfdcApp.Search.PinnedContextActions.bindEvents(!1);
            Ext.isDefined(a) && a.closePopupCallBack ? a.closePopupCallBack() : this.params.closePopupCallBack && this.params.closePopupCallBack()
        }
    }
} (Sfdc));
SearchRequestInfo = function (a) {
    this.json = a;
    this.params = "string" === typeof this.json ? Sfdc.JSON.parse(this.json) : this.json;
    this.params.str = this.params.str || ""
};
SearchRequestInfo.prototype.clobberEntitySelection = function () {
    this.params.sen && delete this.params.sen
};
SearchRequestInfo.prototype.createShallowCopy = function () {
    return new SearchRequestInfo(Sfdc.clone(this.params))
};
Sfdc.provide("SfdcApp.Search.Sidetabs", function () {
    var b = function () { };
    b.FEED_TOGGLE_ID = "feedToggle";
    b.RECORD_TOGGLE_ID = "recordToggle";
    b.prototype.animationStatus = {};
    b.prototype.onReady = function () {
        Ext.each(["slideToggleLesslink", "slideToggleMorelink"], function (a) {
            if (a = Ext.get(a)) a.on("click", this.slideToggle, this)
        }, this)
    };
    b.prototype.objLinkClicked = function (a) {
        this.deselectToggles();
        this.deselectLastSelectedItemLink();
        if (a = Ext.get(a)) a.addClass("subtoggleon"), this.lastLinkClicked = a, (a = a.child("a.notsearched")) &&
            a.removeClass("notsearched")
    };
    b.prototype.isAnimationFinished = function (a) {
        return !1 !== this.animationStatus[a]
    };
    b.prototype.recordToggleClicked = function () {
        this.selectToggle(b.RECORD_TOGGLE_ID);
        var a = Ext.get("records"),
            d = this;
        Sfdc.Dom.isVisible(a.dom) || (this.animationStatus.recordToggleSlideIn = !1, a.slideIn("t", {
            easing: "easeOut",
            duration: 0.25,
            callback: function () {
                d.animationStatus.recordToggleSlideIn = !0;
                d.collapsed = !1
            }
        }))
    };
    b.prototype.feedToggleClicked = function () {
        this.selectToggle(b.FEED_TOGGLE_ID);
        var a =
            Ext.get("records");
        Sfdc.Dom.isVisible(a.dom) && Ext.get("records").slideOut("t", {
            easing: "easeOut",
            duration: 0.5,
            remove: !1,
            useDisplay: !0
        })
    };
    b.prototype.deselectToggles = function () {
        Ext.get(b.FEED_TOGGLE_ID).removeClass("toggleon").addClass("toggleoff");
        Ext.get(b.RECORD_TOGGLE_ID).removeClass("toggleon").addClass("toggleoff")
    };
    b.prototype.selectToggle = function (a) {
        this.deselectLastSelectedItemLink();
        b.FEED_TOGGLE_ID == a ? (Ext.get(b.RECORD_TOGGLE_ID).removeClass("toggleon").addClass("toggleoff"), Ext.get(b.FEED_TOGGLE_ID).removeClass("toggleoff").addClass("toggleon")) :
            (Ext.get(b.FEED_TOGGLE_ID).removeClass("toggleon").addClass("toggleoff"), Ext.get(b.RECORD_TOGGLE_ID).removeClass("toggleoff").addClass("toggleon"))
    };
    b.getSidetabLinkDivItemId = function (a) {
        return SfdcApp.Search.Page.SIDETABS_ITEM_ID_PREFIX + SfdcApp.Search.Page.ENTITY_ID_DELIM + a
    };
    b.getKeyPrefixFromId = function (a) {
        return !a ? null : a.split(SfdcApp.Search.Page.ENTITY_ID_DELIM)[1]
    };
    b.prototype.updateRowCount = function (a, d) {
        var c = Ext.get(b.getSidetabLinkDivItemId(a));
        c && ("" === d ? c.child(".resultCount").update("") :
            c.child(".resultCount").update(String.format("\x26nbsp;({0})", d)), c = c.child("a"), "" === d || "0" === d ? c.addClass("noresults") : c.removeClass("noresults"), c.removeClass("searchPageLoading"))
    };
    b.prototype.startLoading = function (a) {
        if (a = Ext.get(b.getSidetabLinkDivItemId(a))) a.child("a").removeClass("searchPageNotLoaded"), a.child("a").addClass("searchPageLoading")
    };
    b.prototype.collapseOthers = function (a, d) {
        var c = Ext.get(b.getSidetabLinkDivItemId(a)),
            e = Ext.get(UnifiedSearchUI.SIDETABS_SELECTED_DRILLDOWN_ID),
            g =
            e.first(".itemLink");
        if (c && g) {
            Ext.select(".summaryPlaceholder").removeClass("summaryPlaceholder");
            c.parent().addClass("summaryPlaceholder");
            c.appendTo(g);
            e.setVisibilityMode(Ext.Element.DISPLAY);
            e.show(!1);
            var f = this;
            f.animationStatus.leftNavWrapperSlideOut = !1;
            Ext.get(UnifiedSearchUI.SIDETABS_LEFT_NAV_WRAPPER_ID).slideOut("t", {
                easing: "easeOut",
                duration: 0.5,
                remove: !1,
                callback: function () {
                    f.animationStatus.leftNavWrapperSlideOut = !0;
                    f.collapsed = !0;
                    f.updateRowCount(a, d)
                },
                useDisplay: !0
            })
        }
    };
    b.prototype.expandObjLinks =
        function (a, d) {
            Ext.get(b.getSidetabLinkDivItemId(a)).appendTo(Ext.select(".summaryPlaceholder"));
            var c = this;
            c.animationStatus.leftNavWrapperSlideOut = !1;
            Ext.get(UnifiedSearchUI.SIDETABS_LEFT_NAV_WRAPPER_ID).slideIn("t", {
                easing: "easeOut",
                duration: 0.5,
                remove: !1,
                callback: function () {
                    c.animationStatus.leftNavWrapperSlideOut = !0;
                    c.collapsed = !1;
                    c.objLinkClicked(b.getSidetabLinkDivItemId(a));
                    c.updateRowCount(a, d)
                },
                useDisplay: !0
            })
        };
    b.prototype.slideToggle = function () {
        var a = Ext.get("searchmoreobjectsslide"),
            b =
            Ext.get("slideToggleMorelink"),
            c = Ext.get("slideToggleLesslink");
        b.setVisibilityMode(Ext.Element.DISPLAY);
        c.setVisibilityMode(Ext.Element.DISPLAY);
        var e = this;
        Sfdc.Dom.isVisible(a.dom) ? (e.animationStatus.searchMoreListSlideOut = !1, a.slideOut("t", {
            easing: "easeOut",
            duration: 1,
            remove: !1,
            callback: function () {
                e.animationStatus.searchMoreListSlideOut = !0;
                b.focus(0.5)
            },
            useDisplay: !0
        }), b.show(!1), c.hide(!1)) : (e.animationStatus.searchMoreListSlideIn = !1, a.slideIn("t", {
            easing: "easeOut",
            callback: function () {
                a.removeClass("searchPageHidden");
                e.animationStatus.searchMoreListSlideIn = !0;
                a.select("li.itemLink a").item(0).focus(0.5)
            },
            duration: 1
        }), b.hide(!1), c.show(!1))
    };
    b.prototype.deselectLastSelectedItemLink = function () {
        this.lastLinkClicked && this.lastLinkClicked.removeClass("subtoggleon")
    };
    return b
} ());
Sfdc.provide("SfdcApp.Search.Page", function () {
    var b = function () {
        this.sidetabs = new SfdcApp.Search.Sidetabs;
        this.searchCount = 1;
        this.cache = {};
        this.skipCache = !1;
        this.keyPrefixToEntityName = {};
        this.pinningConfirmTimeout = 4E3;
        this.pinningAnimationTimeout = 1E3;
        this.shouldDisplayConfirmation = !0;
        this.actionArguments = {};
        this.historyEnabled = this.ajaxActionComplete = !1;
        this.initialState = {};
        this.lastState = {};
        this.currentState = {};
        this.partialKeyPrefixes = {};
        this.partialRequests = {}
    };
    b.ENTITY_ID_DELIM = "-";
    b.SCOPE_TEXT_DELIM = ", ";
    b.SINGLE_ENTITY_CMP = "singleEntitySearchResult";
    b.SUMMARY_CMP = "summarySearchResult";
    b.FEEDS_CMP = "feedsSearchResult";
    b.SIDETABS_CMP = "sidetabAJAX";
    b.SUMMARY_PARTIAL_CMP = "summaryPartialResult";
    b.SIDETABS_ITEM_ID_PREFIX = "sidetabLink";
    b.CSS_ID_SEARCHINGMESSAGE = "searchingMessage";
    b.CSS_ID_SEARCHINGMASK = "searchingMask";
    b.SEARCH_BODY_ID = "searchBody";
    b.HISTORY_KEY_SEARCH_STATE = "searchStates";
    b.COOKIE_FILTER_FORMS_STATE = "DISPLAY_SEARCH_FILTER_FORMS";
    b.SEARCH_ALL = "searchAll";
    b.SEARCH_MORE_OPTIONS_OVERLAY = "searchMoreOptionsOverlay";
    b.SEARCH_MORE_OPTIONS_LINK = "searchMoreOptionsLink";
    b.SEARCH_MORE_OPTIONS_TEXT = "searchMoreOptionsText";
    b.AS_PHRASE = "asPhrase";
    b.SEARCH_OWNER = "searchOwner";
    b.FOCUSED_ENTITY = "fen";
    b.INITIAL_VIEW_MODE = "initialViewMode";
    b.SELECTED_ENTITY = "sen";
    b.SORTED = "sorted";
    b.SEARCH_STR = "str";
    b.DIVISION = "div";
    b.SAVE_OPTIONS = "saveOptions";
    b.SEARCH_MORE_OBJECTS_HEADING_SEPARATOR = "searchMoreObjectsHeadingSeparator";
    b.PINNED_ACTION_MENU = "pinnedActionMenu";
    b.MOVE_HELPER_ID = "searchMoveHelper";
    b.DATA_RELATEDLIST_DOM_ID = "data_relatedListDomId";
    b.SMART_SEARCH_CALL_OUT = "smartSearchCallOut";
    b.LIMIT_ITEM_I_OWN = "limit_item_i_own";
    b.ITEM_UNPINNED_HOVER = "itemUnpinnedHover";
    b.ITEM_UNPINNED = "itemUnpinned";
    b.ITEM_PINNED_HOVER = "itemPinnedHover";
    b.ITEM_PINNED = "itemPinned";
    b.ITEM_PINNED_FOCUS = "itemPinnedFocus";
    b.ITEM_UNPINNED_FOCUS = "itemUnpinnedFocus";
    b.ITEM_LINK_HIGHLIGHT = "itemLinkHighlight";
    b.DUMMY_SUMMARY_KEYPREFIX = "_summary";
    b.DUMMY_SUMMARY_SEARCH_ALL_KEYPREFIX = "_summaryAll";
    b.DUMMY_FEEDS_KEYPREFIX = "_feeds";
    b.REQUEST_TIMEOUT_MILLIS = 12E4;
    b.ACTIVITY_KEYPREFIXES = {
        "00U": "007",
        "00T": "007"
    };
    b.ACTIVITY_KEY_PREFIX = "007";
    b.TASK_KEY_PREFIX = "00T";
    b.EVENT_KEY_PREFIX = "00U";
    b.INHERITED_PARAMS = ["sen", "asPhrase", "searchOwner", "str", "div"];
    b.VERSION_V2 = "V2";
    b.VERSION_V3 = "V3";
    b.PARTIAL_KEYPREFIX_ATTR = "data-search-partial-keyprefix";
    b.PARTIAL_STATUS_ATTR = "data-search-partial-status";
    b.prototype = new SearchPage;
    this.retrievedPartialResultCount = 0;
    b.prototype.wrapDhtmlWaitingRequest = function (a, b, d, e, f, g, h) {
        this.isViewingDrilldown() ||
            "0t0" === this.relatedDomIdToKeyPrefix[f] ? SearchPage.prototype.wrapDhtmlWaitingRequest.apply(this, arguments) : (this.actionArguments = arguments, this.updateDrilldown({
                fen: this.relatedDomIdToKeyPrefix[f],
                sorted: "true"
            }))
    };
    b.prototype.setSearchRequestInfo = function (a) {
        this.searchRequestInfo = new SearchRequestInfo(a);
        this.initialState = this.searchRequestInfo.params;
        this.currentState = this.lastState = Sfdc.clone(this.initialState, !0)
    };
    b.prototype.cloneAndApplyInitialParams = function (a) {
        if (!a) return a;
        a = Sfdc.clone(a, !0);
        var c = this;
        Ext.each(b.INHERITED_PARAMS, function (b) {
            a.hasOwnProperty(b) || (a[b] = c.initialState[b])
        });
        return a
    };
    b.prototype.getLastState = function () {
        return this.cloneAndApplyInitialParams(this.lastState)
    };
    b.prototype.getState = function () {
        return this.cloneAndApplyInitialParams(this.currentState)
    };
    b.prototype.getParam = function (a) {
        return this.getState()[a]
    };
    b.prototype.setSearchParameters = function (a) {
        Sfdc.apply(this, a, !0)
    };
    b.prototype.isViewingSummary = function () {
        return this.getParam(b.INITIAL_VIEW_MODE) ===  UnifiedSearchUI.INITIAL_VIEW_MODE_SUMMARY
    };
    b.prototype.isViewingDrilldown = function () {
        return this.getParam(b.INITIAL_VIEW_MODE) === UnifiedSearchUI.INITIAL_VIEW_MODE_DETAIL
    };
    b.prototype.isViewingFeeds = function () {
        return this.getParam(b.INITIAL_VIEW_MODE) === UnifiedSearchUI.INITIAL_VIEW_MODE_FEEDS
    };
    b.prototype.initLabels = function () {
        this.searchAgainText = LC.getLabel("Page_SearchResult", "searchAgain");
        this.searchChatterUpdates = LC.getLabel("Page_UnifiedSearch", "feedsToggleLabel")
    };
    b.prototype.getInitialViewModeForRefreshPage = function () {
        return this.isViewingFeeds() ? UnifiedSearchUI.INITIAL_VIEW_MODE_FEEDS : UnifiedSearchUI.INITIAL_VIEW_MODE_SUMMARY
    };
    b.prototype.onLoadUpdateState = function () {
        this.initLabels();
        this.addSidetabClickHandlers();
        this.addClickHandlersForSummaryView();
        this.sidetabs.onReady();
        this.initSecondarySearchBox();
        this.clearHeader();
        this.cacheCurrentView();
        this.initSearchMoreOptions();
        if (this.initialState.fen) {
            this.components = b.SINGLE_ENTITY_CMP;
            var a = this.getItemLinkDivNode(this.getParam(b.FOCUSED_ENTITY));
            this.sidetabs.objLinkClicked(a.dom.id);
            this.updateLastSidetabQuery()
        } else this.isViewingFeeds() ? this.initialState.cmp = [b.FEEDS_CMP] : (this.updateLastSidetabQuery(), this.components = [b.SUMMARY_CMP, b.SIDETABS_CMP]);
        Ext.get(b.SEARCH_BODY_ID).setVisibilityMode(Ext.Element.DISPLAY);
        Ext.get(b.CSS_ID_SEARCHINGMASK).setVisibilityMode(Ext.Element.DISPLAY);
        Ext.get(b.CSS_ID_SEARCHINGMESSAGE).setVisibilityMode(Ext.Element.DISPLAY);
        this.initPartialResults();
        this.initHistory();
        this.redirectToDrilldownForSingleEntity();
        this.initGuidedTour()
    };
    b.prototype.initPartialResults = function () {
        this.retrievedPartialResultCount = 0;
        this.getPartialResultsElem().each(function (a) {
            this.retrievedPartialResultCount++;
            var c = a.getAttribute(b.PARTIAL_STATUS_ATTR);
            a = a.getAttribute(b.PARTIAL_KEYPREFIX_ATTR);
            this.partialKeyPrefixes[a] = !0;
            "loading" === c && this.loadPartialResults(a)
        }, this);
        0 < this.retrievedPartialResultCount && (null !== Ext.get("searchResultsWarningMessageBox") && Ext.get("searchResultsWarningMessageBox").setVisible(!1), null !== Ext.select(".searchResultsTipsContainer") &&
            Ext.select(".searchResultsTipsContainer").setVisible(!1))
    };
    b.prototype.redirectToDrilldownForSingleEntity = function () {
        if (this.isViewingSummary() && this.initialState.sen && 1 === this.initialState.sen.length && !this.initialState.fen) {
            var a = this.initialState.sen[0],
                a = b.ACTIVITY_KEYPREFIXES[a] || a,
                a = SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(a);
            this.selectEntityInSidebar(a)
        }
    };
    b.prototype.initHistory = function () {
        Sfdc.History.onChange(Sfdc.Function.bind(this.parseAndHandleState, this));
        if (Sfdc.History.isInit()) {
            var a =  window.location.href.split("#")[1];
            a && this.parseAndHandleState(Sfdc.Url.getUrlParameters(a.slice(2)))
        } else Sfdc.History.init({
            usePushState: !1
        })
    };
    b.prototype.retriggerGuidedTour = function () {
        SfdcApp.Search.GuidedTour ? this.startNewGuidedTour() : Sfdc.Url.navigateTo(this.getRefreshPageURL())
    };
    b.prototype.cleanUserPrefIfNeededAndRetriggerGuidedTour = function () {
        var a = this;
        UserContext.userPreferences.getBoolean(a.guidedTourUserPrefName) ? UserContext.userPreferences.setBoolean(a.guidedTourUserPrefName, !1, function () {
            a.retriggerGuidedTour()
        }) :
            a.retriggerGuidedTour()
    };
    b.prototype.getRefreshPageURL = function (a) {
        a = a || {};
        var c = QueryString.createQueryString(window.location.href, !0);
        c.replace(UnifiedSearchUI.INITIAL_VIEW_MODE, this.getInitialViewModeForRefreshPage());
        c.replace(UnifiedSearchUI.SELECTED_ENTITY, this.getParam(UnifiedSearchUI.SELECTED_ENTITY));
        a.str ? c.replace(SearchRelatedList.pSEARCH_STR, a.str) : c.replace(SearchRelatedList.pSEARCH_STR, this.getSearchStr());
        this.getParam(b.SEARCH_ALL) && c.remove(b.SELECTED_ENTITY);
        a.asPhrase && c.replace(b.AS_PHRASE, a.asPhrase);
        a.searchOwner && c.replace(b.SEARCH_OWNER, a.searchOwner);
        a.div && c.replace(b.DIVISION, a.div);
        a.saveOptions && c.replace(b.SAVE_OPTIONS, a.saveOptions);
        a.sorted && c.replace(b.SORTED, a.sorted);
        return this.relatedListServletUrl + c.toString()
    };
    b.prototype.startNewGuidedTour = function () {
        this.closeGuidedTour();
        this.guidedTourInst = SfdcApp.Search.GuidedTour.getGuidedTour(this.helpTopic, this.videoTutorial, this.unifiedSearchPageVersion, this.guidedTourUserPrefName);
        this.guidedTourInst.start()
    };
    b.prototype.closeGuidedTour = function () {
        this.guidedTourInst && Sfdc.isFunction(this.guidedTourInst.hideStep) && this.guidedTourInst.hideStep()
    };
    b.prototype.initGuidedTour = function () {
        var a = this, c = Ext.get(UnifiedSearchUI.GUIDED_TOUR_LINK_ID);
        if (c) c.on("click", function () {
            Sfdc.Cookie.deleteCookie("unifiedsearchgt");
            HelpBubble.isBubblePresent(b.SMART_SEARCH_CALL_OUT) ? HelpBubble.closeBubble(b.SMART_SEARCH_CALL_OUT, function () {
                a.cleanUserPrefIfNeededAndRetriggerGuidedTour()
            }) : a.cleanUserPrefIfNeededAndRetriggerGuidedTour()
        });
        this.startGuidedTour ?
            this.startNewGuidedTour() : this.startCallOut && HelpBubble.showSmartSearchBubble(this.helpTopic)
    };
    b.prototype.setComponents = function () {
        this.isViewingSummary() ? this.components = [b.SUMMARY_CMP, b.SIDETABS_CMP] : this.isViewingDrilldown() ? this.partialKeyPrefixes[this.getParam(b.FOCUSED_ENTITY)] ? this.components = [b.SUMMARY_PARTIAL_CMP] : this.components = [b.SINGLE_ENTITY_CMP] : this.isViewingFeeds() && (this.components = [b.FEEDS_CMP])
    };
    b.prototype.parseAndHandleState = function (a, c) {
        if (!Sfdc.isEmpty(a) || !Sfdc.isEmpty(c)) Sfdc.isEmpty(a) ?
            (this.currentState = Sfdc.clone(this.initialState, !0), this.isViewingSummary() ? (this.components = [b.SUMMARY_CMP, b.SIDETABS_CMP], delete this.currentState.fen) : this.isViewingDrilldown() ? this.components = [b.SINGLE_ENTITY_CMP, b.SIDETABS_CMP] : this.isViewingFeeds() && (this.components = [b.FEEDS_CMP], delete this.currentState.fen)) : (this.currentState = this.parseStateString(a), this.setComponents()), this.lastState = this.parseStateString(c) || Sfdc.clone(this.initialState, !0), this.handleStateChange()
    };
    b.prototype.parseStateString = function (a) {
        if (!a) return null;
        a.hasOwnProperty(b.SEARCH_ALL) && (a.searchAll = "true" === a.searchAll);
        return a
    };
    b.prototype.handleStateChange = function () {
        var a, c = this;
        this.commitUiEventLog();
        this.isViewingSummary() ? a = function () {
            c.successCallBackSummary()
        } : this.isViewingDrilldown() ? a = function (a) {
            c.successCallBackDrilldown(a);
            c.getParam(b.SORTED) && (a = "\x26" + b.FOCUSED_ENTITY + "\x3d" + c.getParam(b.FOCUSED_ENTITY) + "\x26" + b.INITIAL_VIEW_MODE + "\x3d" + c.getParam(b.INITIAL_VIEW_MODE), c.actionArguments[2] += a, c.wrapDhtmlWaitingRequest.apply(c,
                c.actionArguments))
        } : this.isViewingFeeds() && (a = function () {
            c.successCallBackFeeds();
            chatter && chatter.getEventBus().fireEvent("unifiedSearchPage:feedSearchResults", "onAfterResultsShown", {})
        });
        this.loadFromServletOrCache(a)
    };
    b.prototype.cacheCurrentView = function () {
        var a = {};
        this.isViewingFeeds() ? (a[b.FEEDS_CMP] = Ext.get(b.SEARCH_BODY_ID).dom.innerHTML, this.updateCache(this.getState(), a)) : this.isViewingSummary() && (a[b.SUMMARY_CMP] = Ext.get(b.SEARCH_BODY_ID).dom.innerHTML, a[b.SIDETABS_CMP] = Ext.get(UnifiedSearchUI.SIDETABS_ID).dom.innerHTML, this.updateCache(this.getState(), a))
    };
    b.prototype.clearHeader = function () {
        var a = Ext.get(UnifiedSearchUI.GLOBAL_SEARCH_INPUT_ID);
        a && (a.dom.value = "", (a = Ext.get(UnifiedSearchUI.GLOBAL_SEARCH_CLEAR_BUTTON_ID)) && a.setVisible(!1))
    };
    b.prototype.initSecondarySearchBox = function () {
        var a = Ext.get(UnifiedSearchUI.SECOND_SEARCH_TEXT_ID);
        a && (a.dom.value = this.getSearchStr(), Ext.get(UnifiedSearchUI.SECOND_SEARCH_FORM_ID).on("submit", this.secondarySearch, this));
        this.isViewingFeeds() ? this.updateSecondSearchBoxTitleAndScope(this.searchChatterUpdates,
            this.searchChatterUpdates) : this.isViewingSummary() ? this.updateSecondSearchBoxTitleAndScope(this.getSecondSearchBoxInputTitleByScope(), this.searchAgainText) : this.isViewingDrilldown() ? this.updateSecondSearchBoxWithScope() : Sfdc.error("The unified search page initial view mode is invalid.")
    };
    b.prototype.storeOverlayOptionValues = function () {
        this.overlayOptions = {};
        this.overlayOptions.searchOwner = Ext.get("moreOptionsLimitToItemsIOwn").dom.checked;
        this.overlayOptions.asPhrase = Ext.get("moreOptionsExactPhrase").dom.checked;
        var a = Ext.get("moreOptionsDivisions");
        a && (this.overlayOptions.div = a.getValue())
    };
    b.prototype.restoreOverlayOptionValues = function () {
        Ext.get("moreOptionsLimitToItemsIOwn").dom.checked = this.overlayOptions.searchOwner;
        Ext.get("moreOptionsExactPhrase").dom.checked = this.overlayOptions.asPhrase;
        var a = Ext.get("moreOptionsDivisions");
        a && (a.dom.value = this.overlayOptions.div)
    };
    b.prototype.closeSearchMoreOptionOverlay = function (a) {
        a.setVisible(!1);
        this.showHideSearchMoreOptions(!0);
        this.restoreOverlayOptionValues();
        Ext.get("searchMoreOptionsLink").focus()
    };
    b.prototype.initSearchMoreOptions = function () {
        var a = this,
            c = Ext.get(b.SEARCH_MORE_OPTIONS_OVERLAY);
        if (c) {
            a.showHideSearchMoreOptions(!a.isViewingFeeds());
            var d = Ext.get(UnifiedSearchUI.SECOND_SEARCH_BUTTON_ID),
                e = 2;
            Sfdc.resolve("Sfdc.servicedeskview") && (e = 17);
            c.setTop(d.getHeight() - c.getHeight() + e);
            var f = Ext.get(b.SEARCH_MORE_OPTIONS_LINK);
            f.on("click", function () {
                "undefined" !== typeof HelpBubble && HelpBubble.hideBubble(b.SMART_SEARCH_CALL_OUT);
                c.setVisible(!0);
                a.showHideSearchMoreOptions(!1);
                a.storeOverlayOptionValues()
            });
            Ext.getBody().on("click", function (d, e) {
                c.isVisible() && (!d.within(b.SEARCH_MORE_OPTIONS_OVERLAY) && e != f.dom) && a.closeSearchMoreOptionOverlay(c)
            });
            Ext.get("moreOptionsSearchBtn").on("click", function () {
                a.saveOptionsAndSearch()
            });
            Ext.get("searchMoreOptionsOverlayX").on("click", function (b, d) {
                Sfdc.Event.preventDefault(b);
                a.closeSearchMoreOptionOverlay(c)
            });
            if (Ext.isIE7 && (d = Ext.get("moreOptionsDivisions"))) {
                d = d.dom.options;
                for (e = 0; e < d.length; e++) d[e].title = d[e].text
            }
        }
    };
    b.prototype.addSidetabClickHandlers = function () {
        var a = this;
        Ext.select(String.format("#selectedObjects .linkSelector, #{0} .linkSelector, #searchmoreobjectsslide .linkSelector", UnifiedSearchUI.SEARCH_MORE_OBJECTS_ID)).on("click", function () {
            a.selectEntityInSidebar(this.parentNode.id)
        });
        Ext.get(UnifiedSearchUI.SIDETABS_RECORD_RESULTS_ID).on("click", function () {
            a.selectRecords()
        });
        Ext.get(UnifiedSearchUI.SIDETABS_FEED_RESULTS_ID).on("click", function () {
            a.selectFeeds()
        });
        var b = Ext.get(UnifiedSearchUI.SEARCH_ALL_ID);
        if (b) b.on("click", function () {
            a.searchAll(UnifiedSearchComponents.SUB_COMPONENT_FROM_SIDETABS)
        });
        if (b = Ext.get(UnifiedSearchUI.SEARCH_ALL_SUMMARY_VIEW_ID)) b.on("click", function () {
            a.searchAll(UnifiedSearchComponents.SUB_COMPONENT_FROM_SUMMARY_VIEW)
        });
        this.addPinningClickHandlers()
    };
    b.prototype.addPinningClickHandlers = function () {
        var a = Ext.select(".searchEntityList .itemActionBtn");
        if (!(null === a || 0 === a.getCount())) {
            var c = this;
            a.on("click", function (a) {
                a && a.stopEvent();
                a = Ext.get(this);
                c.clickItemActionBtn(a);
                a.focus()
            });
            if (Ext.isGecko) a.on("keypress", c.keyNavItemActionBtn), a.on("keydown", c.stopIfNeededItemActionBtn);
            else a.on("keydown", c.keyNavItemActionBtn);
            a.on("keyup", c.stopIfNeededItemActionBtn);
            a.on("focus", function (a) {
                c.focusItemActionBtn(a, Ext.get(this))
            });
            a.on("blur", function (a) {
                c.blurItemActionBtn(a, Ext.get(this))
            });
            a = Ext.select(".selectedObjects .searchEntityList .itemLink").add(Ext.select(".searchMoreObjects .searchEntityList .itemLink"));
            a.on("mouseover", function () {
                c.mouseOverItemLink(this)
            });
            a.on("mouseout", function () {
                c.mouseOutItemLink(this)
            });
            this.relatedDomIdToKeyPrefix = {};
            this.keyPrefixToRelatedDomId = {};
            this.keyPrefixToLimitItemIOwn = {};
            a.each(function (a, e) {
                var f = Ext.get(a).first("div"),
                    g = f.dom.getAttribute(b.DATA_RELATEDLIST_DOM_ID),
                    h = SfdcApp.Search.Sidetabs.getKeyPrefixFromId(f.dom.getAttribute("id")),
                    f = f.dom.getAttribute(b.LIMIT_ITEM_I_OWN);
                c.relatedDomIdToKeyPrefix[g] = h;
                c.keyPrefixToRelatedDomId[h] = g;
                c.keyPrefixToLimitItemIOwn[h] = f
            });
            (a = Ext.get(b.SEARCH_MORE_OBJECTS_HEADING_SEPARATOR)) &&
            a.setVisibilityMode(Ext.Element.DISPLAY)
        }
    };
    b.prototype.closeItemActionMenu = function (a) {
        SfdcApp.Search.PinnedContextActions.closePopup({
            closePopupCallBack: function () {
                var c = Ext.get(SfdcApp.Search.PinnedContextActions.linkId);
                a.id !== SfdcApp.Search.PinnedContextActions.linkId && (c.removeClass(b.ITEM_UNPINNED_HOVER), c.removeClass(b.ITEM_PINNED_HOVER));
                c.addClass(b.ITEM_PINNED)
            }
        })
    };
    b.prototype.focusItemActionBtn = function (a, c) {
        var d = c.id.split(SfdcApp.Search.Page.ENTITY_ID_DELIM)[1];
        Ext.isDefined(this.pinnedMap[d]) ?
            c.addClass(b.ITEM_PINNED_FOCUS) : c.addClass(b.ITEM_UNPINNED_FOCUS)
    };
    b.prototype.blurItemActionBtn = function (a, c) {
        var d = c.id.split(SfdcApp.Search.Page.ENTITY_ID_DELIM)[1];
        Ext.isDefined(this.pinnedMap[d]) ? c.removeClass(b.ITEM_PINNED_FOCUS) : c.removeClass(b.ITEM_UNPINNED_FOCUS)
    };
    b.prototype.stopIfNeededItemActionBtn = function (a, b) {
        if (SfdcApp.Search.PinnedContextActions.isVisible()) {
            var d = a.getKey();
            (d >= Sfdc.Event.keyCode.ARROW_L && d <= Sfdc.Event.keyCode.ARROW_D || d === KEY_TAB) && a.stopEvent()
        }
    };
    b.prototype.keyNavItemActionBtn =
        function (a, b) {
            var d = a.getKey(),
                e = SfdcApp.Search.PinnedContextActions,
                f = !1;
            switch (d) {
                case KEY_ARROW_D:
                    e.isVisible() && (e.setFocused(), e.navDown(), f = !0);
                    break;
                case KEY_ESC:
                    e.closePopup();
                    Ext.fly(e.linkId).focus();
                    f = !0;
                    break;
                case KEY_TAB:
                    e.isVisible() && (e.setFocused(), a.shiftKey ? e.navUp() : e.navDown(), f = !0)
            }
            f && a.stopEvent()
        };
    b.prototype.clickItemActionBtn = function (a) {
        var c = this,
            d = SfdcApp.Search.PinnedContextActions,
            e = a.id,
            f = e.split(SfdcApp.Search.Page.ENTITY_ID_DELIM)[1];
        if (Ext.get(SfdcApp.Search.Page.PINNED_ACTION_MENU).isVisible()) {
            var g = d.linkId;
            this.closeItemActionMenu(a);
            if (g === e) return
        }
        this.pinnedMap[f] ? d.openPopup({
            linkId: a.id,
            closePopupCallBack: function () {
                a.removeClass(b.ITEM_PINNED_HOVER);
                a.addClass(b.ITEM_PINNED)
            },
            menuItemClickedCallBack: function (d) {
                SfdcApp.Search.PinnedContextActions.closePopup();
                "pin" === d ? (a.removeClass(b.ITEM_UNPINNED_HOVER), a.removeClass(b.ITEM_UNPINNED), a.addClass(b.ITEM_PINNED), c.pinningEntity(a, f)) : (a.removeClass(b.ITEM_PINNED_HOVER), a.removeClass(b.ITEM_PINNED), a.addClass(b.ITEM_UNPINNED), c.unpinningEntity(a,
                    f))
            }
        }) : this.pinningEntity(a, f)
    };
    b.prototype.isInSearchMoreObjects = function (a) {
        return (a = Ext.select(String.format("#{0} #{1}", UnifiedSearchUI.SEARCH_MORE_OBJECTS_ID, SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(a)))) && 1 === a.getCount() ? !0 : !1
    };
    b.prototype.clearAllSummaryCache = function () {
        this.clearAllAjaxCacheBySecondKey(b.DUMMY_SUMMARY_KEYPREFIX);
        this.clearAllAjaxCacheBySecondKey(b.DUMMY_SUMMARY_SEARCH_ALL_KEYPREFIX)
    };
    b.prototype.removeAttribue = function (a, b, d) {
        a.removeAttribute(b);
        var e = this;
        d && Ext.each(a.childNodes,
            function () {
                1 === this.nodeType && e.removeAttribue(this, b, d)
            })
    };
    b.prototype.createMoveHelper = function (a) {
        var c = Ext.get(b.MOVE_HELPER_ID),
            d = Ext.get(UnifiedSearchUI.SIDETABS_LEFT_NAV_WRAPPER_ID),
            e = !1;
        c ? c.update("") : (c = Ext.get(document.createElement("div")), c.addClass("itemLinkMover"), d.appendChild(c), e = !0);
        a = Ext.get(a);
        c.setLeft(a.getLeft() - d.getLeft());
        c.setTop(a.getTop() - d.getTop());
        e && (c.setWidth(a.getWidth()), c.setHeight(a.getHeight()));
        Ext.each(a.dom.childNodes, function () {
            1 === this.nodeType && c.appendChild(this.cloneNode(!0))
        });
        this.removeAttribue(c.dom, "id", !0);
        c.set({
            id: b.MOVE_HELPER_ID
        });
        d = c.first(".itemActionBtn");
        d.removeClass(b.ITEM_PINNED_HOVER);
        d.removeClass(b.ITEM_UNPINNED_HOVER);
        d.removeClass(b.ITEM_UNPINNED);
        d.addClass(b.ITEM_PINNED);
        return c
    };
    b.prototype.moveHelperOverTarget = function (a, b, d, e) {
        a.setLeft(d.getLeft() - b.getLeft());
        a.setTop(d.getTop() - b.getTop());
        e && this.scrollSearchBodyIntoViewPort()
    };
    b.prototype.moveToTopInRelatedList = function (a) {
        a = this.getItemLinkDivNode(a).getAttribute(b.DATA_RELATEDLIST_DOM_ID);
        var c = Ext.get(a);
        c && (a = Ext.get(UnifiedSearchUI.SEARCHRESULT_HOLDER_DIV_ID).first("div"), c = c.parent(), a.first("div").id !== c.first("div").id && c.insertBefore(a))
    };
    b.prototype.removeRelatedListElementFromSummaryView = function (a) {
        (a = Ext.get(this.keyPrefixToRelatedDomId[a])) && a.parent().remove()
    };
    b.prototype.moveToOrigInRelatedList = function (a) {
        var b = Ext.get(UnifiedSearchUI.SEARCHRESULT_HOLDER_DIV_ID),
            d = this,
            e = Ext.get(this.keyPrefixToRelatedDomId[a]);
        if (e) {
            var b = b.select("div.bRelatedList"),
                f = b.getCount();
            if (!(b && 1 >= f)) {
                var g = d.rankMap[a],
                    h = d.labelOrderMap[a],
                    l, k;
                Ext.each(b.elements, function (b, c) {
                    var e = Ext.get(b),
                        m = d.relatedDomIdToKeyPrefix[b.id];
                    if (m === a) return !0;
                    if (Ext.isNumber(d.pinnedMap[m])) return l = "insertAfter", k = e, !0;
                    if (Ext.isNumber(g)) {
                        if (m = d.rankMap[m], !Ext.isNumber(m) || m > g) return l = "insertBefore", k = e, !1
                    } else {
                        m = d.labelOrderMap[m];
                        if (Ext.isNumber(m) && m < h) return l = "insertBefore", k = e, !1;
                        l = "insertAfter";
                        k = e;
                        return !0
                    }
                    c === f - 1 && (l = "insertAfter", k = e)
                });
                "insertBefore" === l ? e.parent().insertBefore(k.parent()) :
                    "insertAfter" === l && e.parent().insertAfter(k.parent())
            }
        }
    };
    b.prototype.createHiddenInput = function (a, b, d, e) {
        var f = document.createElement("input");
        f.setAttribute("type", "hidden");
        f.setAttribute("id", b);
        f.setAttribute("name", d);
        f.setAttribute("value", e);
        a && a.appendChild(f);
        return f
    };
    b.prototype.generateIfSenEleExistsMapAndNextSeq = function (a) {
        for (var c = {}, d = 1, e = 0; e < a.elements.length; e++) {
            var f = a.elements[e];
            if (f.name === b.SELECTED_ENTITY) {
                c[f.value] = f;
                try {
                    var g = parseInt(f.id.substring(3), 10);
                    g >= d && (d = g +
                        1)
                } catch (h) { }
            }
        }
        return {
            senEleMap: c,
            nextSeq: d
        }
    };
    b.prototype.addEntityToScopeIfNeeded = function (a) {
        if (!this.isDefaultToSearchAll) {
            var c = null,
                c = Sfdc.resolve("Sfdc.servicedeskview") ? top.document.getElementById("phSearchForm") : document.getElementById("phSearchForm"),
                d = [];
            a === b.ACTIVITY_KEY_PREFIX ? (d.push(b.TASK_KEY_PREFIX), d.push(b.EVENT_KEY_PREFIX)) : d.push(a);
            var e = this.generateIfSenEleExistsMapAndNextSeq(c);
            a = e.senEleMap;
            for (var e = e.nextSeq, f = [], g = 0; g < d.length; g++) a[d[g]] || (this.createHiddenInput(c, "sen" +
                e, "sen", d[g]), f.push(d[g]));
            for (var h in a) a.hasOwnProperty(h) && f.push(h);
            this.initialState.sen = f
        }
    };
    b.prototype.isEntityInSmartScope = function (a) {
        return !Sfdc.isEmpty(this.rankMap) && a in this.rankMap
    };
    b.prototype.removeEntityFromScope = function (a) {
        if (!this.isDefaultToSearchAll && !this.isEntityInSmartScope(a)) {
            var b = null,
                b = Sfdc.resolve("Sfdc.servicedeskview") ? top.document.getElementById("phSearchForm") : document.getElementById("phSearchForm"),
                b = this.generateIfSenEleExistsMapAndNextSeq(b).senEleMap,
                d = b[a];
            d && Ext.get(d).remove();
            var d = [],
                e;
            for (e in b) b.hasOwnProperty(e) && e !== a && d.push(e);
            this.initialState.sen = d
        }
    };
    b.prototype.pinningEntity = function (a, b) {
        var d = this;
        this.addEntityToScopeIfNeeded(b);
        this.pinnedMap[b] = (new Date).getTime();
        this.clearAllSummaryCache();
        this.executeCommand({
            cmdType: "pin",
            ent: b
        }, function (a) {
            d.moveToTopBySteps(b);
            Sfdc.Aria.notify(LC.getLabel("Page_UnifiedSearch", "pinningSucceeded"))
        }, function (a) {
            Sfdc.Aria.notify(LC.getLabel("Page_UnifiedSearch", "pinningFailed"))
        })
    };
    b.prototype.getKeyPrefixForItemLink = function (a) {
        return a ? a.first("div").id.split(SfdcApp.Search.Page.ENTITY_ID_DELIM)[1] : null
    };
    b.prototype.getItemLinkByKeyPrefix = function (a) {
        return (a = Ext.get(SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(a))) ? a.parent() : null
    };
    b.prototype.unpinningEntity = function (a, b) {
        var d = this;
        this.removeEntityFromScope(b);
        delete this.pinnedMap[b];
        this.clearAllSummaryCache();
        this.executeCommand({
            cmdType: "unpin",
            ent: b
        }, function (a) {
            d.moveToOriginalBySteps(b);
            Sfdc.Aria.notify(LC.getLabel("Page_UnifiedSearch", "pinningSucceeded"))
        },
            function (a) {
                Sfdc.Aria.notify(LC.getLabel("Page_UnifiedSearch", "pinningFailed"))
            })
    };
    b.prototype.hideSearchMoreObjsHeadingSeparator = function () {
        var a = Ext.get(b.SEARCH_MORE_OBJECTS_HEADING_SEPARATOR);
        a && !Sfdc.isEmpty(this.rankMap) && a.setVisibilityMode(Ext.Element.DISPLAY).hide(!1)
    };
    b.prototype.showSearchMoreObjsHeadingSeparator = function () {
        var a = Ext.get(b.SEARCH_MORE_OBJECTS_HEADING_SEPARATOR);
        a && !Sfdc.isEmpty(this.rankMap) && (a.removeClass("searchPageHidden"), a.setVisibilityMode(Ext.Element.DISPLAY).show(!1))
    };
    b.prototype.findStepsForMoveToTop = function (a) {
        var b = this,
            d = [],
            e, f = !1;
        if (b.isInSearchMoreObjects(a)) {
            var g = Ext.select(".searchMoreObjects .searchEntityList .itemLink");
            e = g.getCount();
            var h = function (e) {
                e = Ext.get(e);
                e = b.getKeyPrefixForItemLink(e);
                !f && e === a ? (f = !0, d.push({
                    oper: "moveOver",
                    target: e
                })) : f && d.push({
                    oper: "insertBefore",
                    target: e
                })
            };
            for (e -= 1; 0 <= e; e--) h(g.item(e))
        }
        g = Ext.select(".selectedObjects .searchEntityList .itemLink");
        e = g.getCount();
        if (0 === e) d.push({
            oper: "appendTo",
            target: Ext.select(String.format("#{0} ul.searchEntityList",
                UnifiedSearchUI.SELECTED_OBJECTS_ID)).item(0)
        });
        else {
            h = function (e) {
                e = Ext.get(e);
                e = b.getKeyPrefixForItemLink(e);
                !f && e === a ? (f = !0, d.push({
                    oper: "moveOver",
                    target: e
                })) : f && d.push({
                    oper: "insertBefore",
                    target: e
                })
            };
            for (e -= 1; 0 <= e; e--) h(g.item(e))
        }
        return d
    };
    b.prototype.findStepsForMoveToOriginal = function (a, b) {
        var d = Ext.select(".selectedObjects .searchEntityList .itemLink"),
            e = Ext.select(".searchMoreObjects .searchEntityList .itemLink"),
            f = this,
            g = [],
            h = !1;
        b ? (Ext.each(d.elements, function (b, c) {
            var d = Ext.get(b),
                d =
                f.getKeyPrefixForItemLink(d);
            if (!h && d === a) return h = !0, g.push({
                oper: "moveOver",
                target: d
            }), !0;
            h && g.push({
                oper: "insertAfter",
                target: d
            })
        }), d = Ext.select(String.format("#{0} ul.searchEntityList", UnifiedSearchUI.SEARCH_MORE_OBJECTS_ID)).item(0), !d || !d.isVisible() ? g.push({
            oper: "remove"
        }) : 0 < e.getCount() ? Ext.each(e.elements, function (b, c) {
            var d = Ext.get(b),
                d = f.getKeyPrefixForItemLink(d);
            if (f.labelOrderMap[d] > f.labelOrderMap[a]) return g.push({
                oper: "insertAfter",
                target: d
            }), !0;
            0 === c && g.push({
                oper: "insertBefore",
                target: d
            });
            return !1
        }) : g.push({
            oper: "appendTo",
            target: d
        })) : Ext.each(d.elements, function (b, c) {
            var d = Ext.get(b),
                d = f.getKeyPrefixForItemLink(d);
            if (!h && d === a) return h = !0, g.push({
                oper: "moveOver",
                target: d
            }), !0;
            if (h) return Ext.isNumber(f.pinnedMap[d]) || f.rankMap[d] < f.rankMap[a] ? (g.push({
                oper: "insertAfter",
                target: d
            }), !0) : !1
        });
        return g
    };
    b.prototype.clearItemLinkHighlight = function (a, c, d, e) {
        var f = this;
        setTimeout(function () {
            var e;
            a ? e = f.getItemLinkByKeyPrefix(a) : c && (e = Ext.get(Ext.select(c).item(0)));
            e && e.removeClass(b.ITEM_LINK_HIGHLIGHT);
            d && HelpBubble.hideBubble("searchPinnedHelpBubble")
        }, e)
    };
    b.prototype.displayPinningConfirmation = function (a) {
        var b = this,
            d = Sfdc.get(HelpBubble.HELP_BUBBLE);
        d && Sfdc.Dom.isVisible(d) ? b.clearItemLinkHighlight(a, null, !1, b.pinningConfirmTimeout) : HelpBubble.display({
            parentDiv: "recordToggle",
            pointerDirection: HelpBubble.BOTTOM,
            contentText: LC.getLabel("Page_UnifiedSearch", "pinningSucceededMessage"),
            hideCloseX: !0,
            additionalClass: "searchPinnedHelpBubble",
            fadeInCallBackFn: function () {
                b.clearItemLinkHighlight(a, null, !0, b.pinningConfirmTimeout)
            }
        })
    };
    b.prototype.completeTheMove = function (a) {
        var c = a.keyPrefix,
            d = a.helper,
            e = a.step;
        a = a.toTop;
        null !== d && d.setVisibilityMode(Ext.Element.DISPLAY).hide(!1);
        if (null !== e) {
            var d = Ext.get(SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(c)).parent(),
                f = null;
            "insertBefore" === e.oper ? (f = Ext.get(SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(e.target)).parent(), d.insertBefore(f)) : "insertAfter" === e.oper ? (f = Ext.get(SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(e.target)).parent(), d.insertAfter(f)) :
                "appendTo" === e.oper ? d.appendTo(e.target) : "remove" === e.oper && (d.remove(), d = null);
            null !== d ? (d.setVisibilityMode(Ext.Element.DISPLAY).show(!1), e = d.first(".itemActionBtn"), e.blur(), a ? (d.addClass(b.ITEM_LINK_HIGHLIGHT), e.removeClass(b.ITEM_UNPINNED_HOVER), e.removeClass(b.ITEM_UNPINNED), e.removeClass(b.ITEM_UNPINNED_FOCUS), e.addClass(b.ITEM_PINNED), this.shouldDisplayConfirmation ? (this.shouldDisplayConfirmation = !1, this.displayPinningConfirmation(c)) : this.clearItemLinkHighlight(c, null, !1, this.pinningConfirmTimeout),
                this.moveToTopInRelatedList(c), e.set({
                    title: e.getAttribute("data_pinnedtitle")
                })) : (e.removeClass(b.ITEM_UNPINNED_HOVER), e.removeClass(b.ITEM_PINNED_HOVER), e.removeClass(b.ITEM_PINNED_FOCUS), e.addClass(b.ITEM_UNPINNED), this.moveToOrigInRelatedList(c), d.addClass(b.ITEM_LINK_HIGHLIGHT), this.clearItemLinkHighlight(c, null, !0, this.pinningConfirmTimeout), e.set({
                    title: e.getAttribute("data_unpinnedtitle")
                }))) : (this.removeRelatedListElementFromSummaryView(c), Ext.get(UnifiedSearchUI.SEARCH_ALL_ID).addClass(b.ITEM_LINK_HIGHLIGHT),
                this.clearItemLinkHighlight(null, "#" + UnifiedSearchUI.SEARCH_ALL_ID, !1, this.pinningConfirmTimeout));
            this.elementReorderingDone = !0;
            Ext.get(UnifiedSearchUI.SIDETABS_RECORD_RESULTS_ID).first(".recordToggleLink").first("a").focus()
        }
        this.showOrHideSearchMoreObjsHeadingSeparator()
    };
    b.prototype.showOrHideSearchMoreObjsHeadingSeparator = function () {
        if (!this.isDefaultToSearchAll) {
            var a = Ext.select(".selectedObjects .searchEntityList .itemLink"),
                b = Ext.select(".searchMoreObjects .searchEntityList .itemLink");
            0 === a.getCount() || 0 === b.getCount() ? this.hideSearchMoreObjsHeadingSeparator() : this.showSearchMoreObjsHeadingSeparator()
        }
    };
    b.prototype.moveByTheSteps = function (a, c, d) {
        var e = Ext.get(b.CSS_ID_SEARCHINGMASK);
        e.setVisible("block");
        var f = this,
            g = Ext.get(UnifiedSearchUI.SIDETABS_LEFT_NAV_WRAPPER_ID),
            h = Math.min(this.pinningAnimationTimeout / c.length, 100),
            l = 0;
        this.elementReorderingDone = !1;
        var k = c[l++],
            p = Ext.get(SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(k.target)).parent(),
            n = f.createMoveHelper(p.dom);
        p.setVisibilityMode(Ext.Element.DISPLAY).hide(!1);
        n.setVisibilityMode(Ext.Element.DISPLAY).show(!1);
        var q = function () {
            if (l === c.length) f.completeTheMove({
                keyPrefix: a,
                helper: n,
                step: k,
                toTop: d
            }), e.setVisible("none");
            else {
                k = c[l++];
                if ("appendTo" !== k.oper && "remove" !== k.oper && 1 < l) {
                    var b = k.target;
                    Ext.isString(b) && (b = Ext.get(SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(k.target)).parent());
                    f.moveHelperOverTarget(n, g, b, d)
                }
                setTimeout(q, h)
            }
        };
        setTimeout(q, h)
    };
    b.prototype.moveToTopBySteps = function (a) {
        var b = this.findStepsForMoveToTop(a);
        this.log("moveToTopBySteps steps calculated: " +   b.length);
        this.moveByTheSteps(a, b, !0)
    };
    b.prototype.moveToOriginalBySteps = function (a) {
        var b = !1;
        Ext.isNumber(this.rankMap[a]) || (b = !0);
        b = this.findStepsForMoveToOriginal(a, b);
        this.log("moveToOriginalBySteps steps calculated: " + b.length);
        this.moveByTheSteps(a, b, !1)
    };
    b.prototype.mouseOverItemLink = function (a) {
        var c = Ext.get(a);
        a = c.select(".itemActionBtn").item(0);
        c = this.getKeyPrefixForItemLink(c);
        this.pinnedMap[c] ? (a.removeClass(b.ITEM_PINNED), a.addClass(b.ITEM_PINNED_HOVER)) : (a.removeClass(b.ITEM_UNPINNED), a.addClass(b.ITEM_UNPINNED_HOVER))
    };
    b.prototype.mouseOutItemLink = function (a) {
        var c = Ext.get(a);
        a = c.select(".itemActionBtn").item(0);
        a.id === SfdcApp.Search.PinnedContextActions.linkId && Ext.get(b.PINNED_ACTION_MENU).isVisible() || (c = this.getKeyPrefixForItemLink(c), this.pinnedMap[c] ? (a.removeClass(b.ITEM_PINNED_HOVER), a.addClass(b.ITEM_PINNED)) : (a.removeClass(b.ITEM_UNPINNED_HOVER), a.addClass(b.ITEM_UNPINNED)))
    };
    b.prototype.addClickHandlersForSummaryView = function () {
        var a = this;
        Ext.select("." + UnifiedSearchUI.CSS_CLASS_SUMMARY_VIEW_SHOW_MORE_LINK).on("click",
            function () {
                var b = SfdcApp.Search.Sidetabs.getKeyPrefixFromId(this.getAttribute("id"));
                a.selectEntityInSummaryListView(b)
            });
        var c = Ext.select(".filterFields");
        if (c) c.on("click", function () {
            var c = this.getAttribute("id").split(b.ENTITY_ID_DELIM),
                e = c[1],
                c = c[2];
            a.keyPrefixToEntityName[c] || (a.keyPrefixToEntityName[c] = e);
            a.setShowFiltersCookieFormState(e, b.COOKIE_FILTER_FORMS_STATE);
            a.selectEntityInSummaryListView(c)
        })
    };
    b.prototype.secondarySearch = function (a) {
        a && Sfdc.Event.preventDefault(a);
        this.firstPageQueryIdOverride &&
            delete this.firstPageQueryIdOverride;
        if (a = Ext.get(UnifiedSearchUI.SECOND_SEARCH_TEXT_ID).dom.value) {
            var c;
            this.isViewingDrilldown() && (c = this.getParam(b.FOCUSED_ENTITY));
            this.searchCount++;
            this.logUiEvent(UnifiedSearchComponents.COMPONENT_TRACKING_SECONDARY_SEARCH, c);
            a === this.getSearchStr() && (this.skipCache = !0);
            this.isViewingFeeds() ? this.updateFeedsView({
                str: a
            }) : this.isViewingDrilldown() ? this.updateDrilldown({
                str: a
            }) : this.updateSummaryView({
                str: a
            })
        }
    };
    b.prototype.saveOptionsAndSearch = function () {
        this.showHideSearchMoreOptions(!1);
        var a = Ext.get("moreOptionsLimitToItemsIOwn").dom.checked ? "1" : "0",
            c = Ext.get("moreOptionsExactPhrase").dom.checked ? "1" : "0",
            a = {
                saveOptions: "1",
                searchOwner: a,
                asPhrase: c
            };
        if (c = Ext.get("moreOptionsDivisions")) a.div = c.getValue();
        a.str = Ext.get("secondSearchText").getValue();
        Ext.get(b.SEARCH_MORE_OPTIONS_OVERLAY).setVisibilityMode(Ext.Element.DISPLAY).hide(!1);
        this.restoreOverlayOptionValues();
        a = this.getRefreshPageURL(a);
        Sfdc.Url.navigateTo(a)
    };
    b.prototype.log = function (a) {
        "undefined" != typeof console && "undefined" !=  typeof console.info && console.info(a)
    };
    b.prototype.executeCommand = function (a, c, d) {
        var e = this, f = a || {};
        debugger;
        f[CSRFConstants.CSRF_TOKEN] = this.ajaxServletCSRFToken;
        Ext.Ajax.request({
            url: e.ajaxServletUrl,
            params: f,
            method: "POST",
            timeout: b.REQUEST_TIMEOUT_MILLIS,
            success: function (a) {
                try {
                    debugger;
                    var b = Util.evalAjaxServletOutput(a.responseText);
                    b && (e.log(String.format("Unified search AJAX command {0} succeeded", f.cmdType)), c && c(b))
                } catch (d) {
                    e.isInvalidSession(a.responseText) && Sfdc.Url.navigateTo(e.getRefreshPageURL())
                }
            },
            failure: function () {
                debugger;
                e.log(String.format("Unified search AJAX command {0} failed", f.cmdType));
                d && d()
            }
        })
    };
    b.prototype.updateLastSidetabQuery = function () {
        this.lastSidetabQuery = this.normalize(this.getSearchStr())
    };
    b.prototype.getSearchStr = function () {
        return this.getParam(b.SEARCH_STR)
    };
    b.prototype.updateSummaryView = function (a) {
        a = a || {};
        a.initialViewMode = UnifiedSearchUI.INITIAL_VIEW_MODE_SUMMARY;
        this.updateHistoryState(a)
    };
    b.prototype.successCallBackSummary = function () {
        this.showHideSearchMoreOptions(!0);
        if (this.getParam(b.SEARCH_ALL)) {
            var a =  LC.getLabel("Global_Search", "all");
            this.updateSecondSearchBoxTitleAndScope(a, a)
        } else this.updateSecondSearchBoxTitleAndScope(this.getSecondSearchBoxInputTitleByScope(), this.searchAgainText);
        this.sidetabs.onReady();
        this.addSidetabClickHandlers();
        this.sidetabs.recordToggleClicked();
        this.addClickHandlersForSummaryView();
        this.initPartialResults();
        this.updateLastSidetabQuery()
    };
    b.prototype.updateFeedsView = function (a) {
        a = a || {};
        a.initialViewMode = UnifiedSearchUI.INITIAL_VIEW_MODE_FEEDS;
        this.updateHistoryState(a)
    };
    b.prototype.successCallBackFeeds = function () {
        this.updateSecondSearchBoxTitleAndScope(this.searchChatterUpdates, this.searchChatterUpdates);
        this.showHideSearchMoreOptions(!1);
        this.sidetabs.feedToggleClicked()
    };
    b.prototype.showHideSearchMoreOptions = function (a) {
        var b = Ext.get("searchMoreOptions");
        b && b.setVisible(a)
    };
    b.prototype.getSecondSearchBoxInputTitleByScope = function () {
        var a = Ext.get(UnifiedSearchUI.GLOBAL_SEARCH_INPUT_ID);
        a || (a = Ext.get(UnifiedSearchUI.SECOND_SEARCH_TEXT_ID));
        return a ? a.dom.getAttribute("title") : "Search box title is not found"
    };
    b.prototype.getItemLinkDivNode = function (a) {
        return Ext.get(SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(a))
    };
    b.prototype.getRelatedListTitle = function (a) {
        a = this.getItemLinkDivNode(a).select("a .truncate").item(0).dom;
        return a.textContent ? a.textContent : a.innerText
    };
    b.prototype.updateSecondSearchBoxWithScope = function () {
        var a = this.getRelatedListTitle(this.getParam(b.FOCUSED_ENTITY)),
            a = LC.getLabel("Page_SearchResult", "secondSearchBoxContextualScope", a),
            c = this.getContextualInfoForAdditionalScopeOptions();
        this.updateSecondSearchBoxTitleAndScope(Sfdc.isEmpty(c) ? a : a + c, a)
    };
    b.prototype.getContextualInfoForAdditionalScopeOptions = function () {
        var a = this.getState(),            c = "";
        a.div && (c += b.SCOPE_TEXT_DELIM + this.divisionName);
        a.searchOwner && (c += b.SCOPE_TEXT_DELIM + Sfdc.String.trim(LC.getLabel("Page_AdvancedSearch", "SearchMine")));
        a.asPhrase && (c += b.SCOPE_TEXT_DELIM + Sfdc.String.trim(LC.getLabel("Page_AdvancedSearch", "SearchAsPhrase")));
        return c
    };
    b.prototype.updateSecondSearchBoxTitleAndScope = function (a, b) {
        Ext.get(UnifiedSearchUI.SECOND_SEARCH_TEXT_ID).dom.setAttribute("title", a);
        Ext.get(UnifiedSearchUI.SECOND_SEARCH_BUTTON_ID).dom.setAttribute("value", b)
    };
    b.prototype.getShowFilterPrefCookieAsQueryString = function (a) {
        return (a = getCookie(a)) ? new QueryString(a) : new QueryString("")
    };
    b.prototype.setShowFiltersCookieFormState = function (a, b) {
        var d = this.getShowFilterPrefCookieAsQueryString(b);
        d.add(a, "1");
        var e = new Date;
        e.setTime(e.getTime() + 72E5);
        d = d.toString();
        setCookie(b, d.substring(1, d.length), e, null)
    };
    b.prototype.shouldOpenFieldsFilterForm = function (a, b) {
        return "1" === this.getShowFilterPrefCookieAsQueryString(b).get(this.keyPrefixToEntityName[a])
    };
    b.prototype.updateDrilldown = function (a) {
        var c = a || {};
        c.initialViewMode = UnifiedSearchUI.INITIAL_VIEW_MODE_DETAIL;
        c.hasOwnProperty(b.FOCUSED_ENTITY) || (c.fen = this.getParam(b.FOCUSED_ENTITY));
        a = a.str || this.getParam(b.SEARCH_STR);
        a = this.normalize(a) !== this.lastSidetabQuery;
        if (Ext.get(UnifiedSearchUI.SIDETABS_SELECTED_DRILLDOWN_ID).isVisible() || a || this.sidetabs.collapsed) c.collapse = "1";
        this.updateHistoryState(c)
    };
    b.prototype.restoreOverlayOptionsSelectRecords = function () {
        var a = Ext.get("moreOptionsLimitToItemsIOwn");
        a && (a.dom.disabled = !1, this.getState().searchOwner && (a.dom.checked = !0));
        this.updateSearchMoreOptionsText(!1)
    };
    b.prototype.showHideLimitToItemIOwnWhenDrillDown = function (a) {
        var b = Ext.get("moreOptionsLimitToItemsIOwn");
        a = this.keyPrefixToLimitItemIOwn[a];
        b && (this.getState().searchOwner && (b.dom.checked = "disabled" != a), b.dom.disabled = "disabled" == a);
        this.updateSearchMoreOptionsText("disabled" == a)
    };
    b.prototype.updateSearchMoreOptionsText = function (a) {
        var c = this.getState(),
            d = Ext.get(b.SEARCH_MORE_OPTIONS_TEXT),
            e = Sfdc.String.trim(LC.getLabel("Page_AdvancedSearch", "SearchMine")),
            f = Sfdc.String.trim(LC.getLabel("Page_AdvancedSearch", "SearchAsPhrase"));
        if (c.searchOwner) {
            var g = d.dom.innerHTML;
            a ? c.asPhrase ? (g = g.replace(e, ""), g = g.replace(b.SCOPE_TEXT_DELIM, ""), d.dom.innerHTML = g) : d.dom.innerHTML = "" : -1 == g.indexOf(e) && (c.asPhrase ? (a = g.indexOf(f), g = g.slice(0, a) + e + b.SCOPE_TEXT_DELIM + g.slice(a), d.dom.innerHTML = g) : d.dom.innerHTML = "\x3cstrong\x3e" + LC.getLabel("Page_UnifiedSearch", "searchOptions") + ": \x3c/strong\x3e" + e)
        }
    };
    b.prototype.successCallBackDrilldown = function (a) {
        a = a[b.SINGLE_ENTITY_CMP] || a[b.SUMMARY_PARTIAL_CMP];
        this.showHideSearchMoreOptions(!0);
        this.updateSecondSearchBoxWithScope();
        this.showHideLimitToItemIOwnWhenDrillDown(a.keyPrefix);
        this.sidetabs.recordToggleClicked();
        this.sidetabs.updateRowCount(a.keyPrefix, a.rowCount);
        var c = SfdcApp.Search.Sidetabs.getSidetabLinkDivItemId(a.keyPrefix);
        this.sidetabs.objLinkClicked(c);
        var c = this.normalize(this.getSearchStr()) !== this.lastSidetabQuery, d = this.getParam("collapse");
        c && d ? this.sidetabs.collapseOthers(a.keyPrefix, a.rowCount) : this.sidetabs.collapsed && !d && this.sidetabs.expandObjLinks(a.keyPrefix, a.rowCount);
        c = Ext.select(".searchFilterFieldsHolder");
        if (this.shouldOpenFieldsFilterForm(a.keyPrefix, b.COOKIE_FILTER_FORMS_STATE) && (c && 1 === c.getCount()) && (c.item(0).setStyle("display", "block"), a = this.keyPrefixToEntityName[a.keyPrefix])) Ext.get(SearchRelatedList.SHOW_FILTERS_ID + a).setStyle("display", "none"), Ext.get(SearchRelatedList.HIDE_FILTERS_ID + a).setStyle("display", "inline");
        this.scrollSearchBodyIntoViewPort()
    };
    b.prototype.updateHistoryState = function (a) {
        this.ajaxActionComplete = !1;
        this.skipCache && (a.cache = (new Date).getTime());
        !a.hasOwnProperty(b.SEARCH_ALL) && this.getParam(b.SEARCH_ALL) && (a.searchAll = this.getParam(b.SEARCH_ALL));
        a.hasOwnProperty(b.SEARCH_STR) || (a.str = this.getParam(b.SEARCH_STR));
        this.closeGuidedTour();
        Sfdc.History.isBrowserSupported() ? Sfdc.History.replace(a) : (this.lastState = this.currentState || Sfdc.clone(this.initialState, !0), this.currentState = a, this.setComponents(), this.handleStateChange())
    };
    b.prototype.getPartialResultsElem = function (a) {
        return a ? Ext.select(String.format('#{0} .partialSearchResult[{1}\x3d"{2}"]', b.SEARCH_BODY_ID, b.PARTIAL_KEYPREFIX_ATTR, a)).item(0) : Ext.select(String.format("#{0} .partialSearchResult", b.SEARCH_BODY_ID))
    };
    b.prototype.notifyFailure = function (a) {
        var b = Sfdc.isDebug ? " Status code: " + a.status : "";
        0 !== a.status && (a.isTimeout ? alert(LC.getLabel("Page_UnifiedSearch", "timeoutError") + b) : alert(LC.getLabel("Feeds", "GenericFailureNoGack") + b))
    };
    b.prototype.loadPartialResults = function (a) {
       
        if (a) {
            var c = this,
                d = this.buildParams();
            d.cmp = [b.SUMMARY_PARTIAL_CMP];
            d.fen = a;
            this.sidetabs.startLoading(a);
            (d = Ext.Ajax.request({
                url: c.ajaxServletUrl,
                params: d,
                method: "GET",
                timeout: b.REQUEST_TIMEOUT_MILLIS,
                success: function (d) {
                    try {
                        debugger;
                        c.partialRequests[a] = null;
                        var f = Util.evalAjaxServletOutput(d.responseText)[b.SUMMARY_PARTIAL_CMP],
                            g = c.getPartialResultsElem(a);
                        if (f && g) {
                            c.updateInnerHTML(g, f.html);
                            ("" === f.rowCount || "0" === f.rowCount) && c.retrievedPartialResultCount--;
                            0 >= c.retrievedPartialResultCount && (null !== Ext.get("searchResultsWarningMessageBox") && Ext.get("searchResultsWarningMessageBox").setVisible(!0), null !== Ext.select(".searchResultsTipsContainer") && Ext.select(".searchResultsTipsContainer").setVisible(!0));
                            Ext.fly(g).select("." + UnifiedSearchUI.CSS_CLASS_SUMMARY_VIEW_SHOW_MORE_LINK).on("click", function () {
                                var a = SfdcApp.Search.Sidetabs.getKeyPrefixFromId(this.getAttribute("id"));
                                c.selectEntityInSummaryListView(a)
                            });
                            var h = {};
                            h[b.PARTIAL_STATUS_ATTR] = "" === f.rowCount ?
                                "failed" : "loaded";
                            g.set(h);
                            c.sidetabs.updateRowCount(a, String(f.rowCount));
                            c.cacheCurrentView()
                        }
                    } catch (l) {
                        c.isInvalidSession(d.responseText) && Sfdc.Url.navigateTo(c.getRefreshPageURL())
                    }
                },
                failure: function (d) {
                    debugger;
                    c.partialRequests[a] = null;
                    c.notifyFailure(d);
                    if (d = c.getPartialResultsElem(a)) {
                        var f = {};
                        f[b.PARTIAL_STATUS_ATTR] = "failed";
                        d.set(f);
                        d.update("");
                        c.sidetabs.updateRowCount(a, "")
                    }
                }
            })) && (this.partialRequests[a] = d)
        }
    };
    b.prototype.abortPartialRequests = function () {
        for (var a in this.partialRequests)
            if (this.partialRequests.hasOwnProperty(a)) {
                var b =
                    this.partialRequests[a];
                b && (Ext.Ajax.abort(b), this.sidetabs.updateRowCount(a, ""))
            }
        this.partialRequests = {}
    };
    b.prototype.loadFromServletOrCache = function (a, c) {
       
        var d = this.buildParams();
        this.abortPartialRequests();
        var e = this.getFromCache(d);
        if (e) this.handleResponse(e, a), e[UnifiedSearchUI.FIRST_PAGE_QUERY_ID_OVERRIDE] && (this.firstPageQueryIdOverride = e[UnifiedSearchUI.FIRST_PAGE_QUERY_ID_OVERRIDE]);
        else {
            var f = this;
            this.displaySearchingAnimation();
            Sfdc.Aria.notify(LC.getLabel("Page_UnifiedSearch", "searching"));
            Ext.Ajax.request({
                url: f.ajaxServletUrl,
                params: d,
                method: "GET",
                timeout: b.REQUEST_TIMEOUT_MILLIS,
                success: function (b) {
                    //debugger;
                    f.hideSearchingAnimation();
                    try {
                        var c = Util.evalAjaxServletOutput(b.responseText);
                        c && (f.updateCache(d, c), f.handleResponse(c, a))
                    } catch (e) {
                        f.isInvalidSession(b.responseText) && Sfdc.Url.navigateTo(f.getRefreshPageURL())
                    }
                    Sfdc.Aria.notify(LC.getLabel("Page_UnifiedSearch", "searchingCompleted"))
                },
                failure: function (a) {
                    //debugger;
                    f.hideSearchingAnimation();
                    f.notifyFailure(a);
                    c && c();
                    Sfdc.Aria.notify(LC.getLabel("Page_UnifiedSearch", "searchingFailed"))
                }
            })
        }
    };
    b.prototype.isInvalidSession = function (a) {
        return a.match("ec\x3d302")
    };
    b.prototype.buildParams = function () {
        var a = {},
            b = this.getState();
        a.searchCount = this.searchCount;
        a.cmdType = "cmp";
        a.cmp = this.components;
        b.fen && (a.fen = b.fen, this.partialKeyPrefixes[b.fen] && (a.drilldown = 1));
        a.str = b.str;
        a.initialViewMode = b.initialViewMode;
        b.searchAll || (a.sen = b.sen);
        b.asPhrase && (a.asPhrase = b.asPhrase);
        b.searchOwner && (a.searchOwner = b.searchOwner);
        this.firstPageQueryIdOverride && (a.fpg = this.firstPageQueryIdOverride);
        Sfdc.resolve("Sfdc.servicedeskview") && (a.isdtp = "vw");
        return a
    };
    b.prototype.getCacheKey = function () {
        return this.getParam(b.FOCUSED_ENTITY) ? this.getParam(b.FOCUSED_ENTITY) : this.isViewingFeeds() ? b.DUMMY_FEEDS_KEYPREFIX : this.getParam(b.SEARCH_ALL) ? b.DUMMY_SUMMARY_SEARCH_ALL_KEYPREFIX : b.DUMMY_SUMMARY_KEYPREFIX
    };
    b.prototype.normalize = function (a) {
        return !a ? "" : Sfdc.String.trim(a.toLowerCase())
    };
    b.prototype.getFromCache = function (a) {
        if (this.skipCache) return this.skipCache = !1, null;
        a = this.normalize(a.str);
        if (a =  this.cache[a]) {
            var b = this.getCacheKey(),
                d = a[b];
            if (this.isFresh(d)) return d.resp;
            delete a[b]
        }
        return null
    };
    b.prototype.updateCache = function (a, b) {
        if (a && b) {
            var d = this.normalize(a.str),e = this.cache[d];
            e || (e = {}, this.cache[d] = e);
            var d = this.getCacheKey(), f = e[d];
            f || (f = {}, e[d] = f);
            f.time = (new Date).getTime();
            f.resp = b
        }
    };
    b.prototype.isFresh = function (a) {
        var b = (new Date).getTime();
        return a && a.time && b - a.time < UnifiedSearchUI.CACHE_TIMEOUT_MILLIS
    };
    b.prototype.clearAjaxCache = function () {
        var a = this.cache[this.normalize(this.getSearchStr())];
        a && delete a[this.getCacheKey()]
    };
    b.prototype.clearAllAjaxCacheBySecondKey = function (a) {
        for (var b in this.cache)
            if (this.cache.hasOwnProperty(b)) {
                var d = this.cache[b];
                d && a && delete d[a]
            }
    };
    b.prototype.handleResponse = function (a, c) {
        this.updateComponents(a);
        c && c(a);
        this.updateSecondSearchBox(this.getParam(b.SEARCH_STR));
        var d = Ext.get("searchmoreobjectsslide");
        this.sidetabs.animationStatus.searchMoreListSlideIn && !d.isVisible() && this.sidetabs.slideToggle();
        this.ajaxActionComplete = !0
    };
    b.prototype.updateComponents = function (a) {
        Ext.isEmpty(this.components) || Ext.each(this.components, function (c) {
            var d = a[c];
            d && (c === b.SINGLE_ENTITY_CMP || c === b.SUMMARY_PARTIAL_CMP ? this.updateInnerHTML(Ext.get(b.SEARCH_BODY_ID), d.html) : c === b.SUMMARY_CMP || c === b.FEEDS_CMP ? this.updateInnerHTML(Ext.get(b.SEARCH_BODY_ID), d) : c === b.SIDETABS_CMP && this.updateInnerHTML(Ext.get(UnifiedSearchUI.SIDETABS_ID), d))
        }, this)
    };
    b.prototype.updateSecondSearchBox = function (a) {
        Ext.get(UnifiedSearchUI.SECOND_SEARCH_TEXT_ID).dom.value != a && (Ext.get(UnifiedSearchUI.SECOND_SEARCH_TEXT_ID).dom.value = a)
    };
    b.prototype.displaySearchingAnimation = function () {
        Ext.get(b.SEARCH_BODY_ID).setVisible("none");
        Ext.get(b.CSS_ID_SEARCHINGMASK).setVisible("block");
        Ext.get(b.CSS_ID_SEARCHINGMESSAGE).setVisible("block")
    };
    b.prototype.hideSearchingAnimation = function () {
        Ext.get(b.SEARCH_BODY_ID).setVisible("block");
        Ext.get(b.CSS_ID_SEARCHINGMESSAGE).setVisible("none");
        Ext.get(b.CSS_ID_SEARCHINGMASK).setVisible("none")
    };
    b.prototype.updateInnerHTML = function (a, c) {
        if (!a || !a.dom) return a;
        var d = ["UnifiedSearchPage.updateInnerHTML start:",this.getParam(b.INITIAL_VIEW_MODE), a.id].join(" ");
        Perf.mark(d);
        var e = a.dom;
        e.innerHTML = c || "";
        Util.evalScriptsUnderElement(e);
        ["UnifiedSearchPage.updateInnerHTML end:", this.getParam(b.INITIAL_VIEW_MODE), a.id].join(" ");
        Perf.endMark(d);
        return a
    };
    b.prototype.selectEntityInSidebar = function (a) {
        var b = SfdcApp.Search.Sidetabs.getKeyPrefixFromId(a);
        this.logUiEvent(UnifiedSearchComponents.COMPONENT_TRACKING_DRILL_DOWN_SIDETAB, b);
        this.sidetabs.objLinkClicked(a);
        this.selectEntity(b)
    };
    b.prototype.selectEntityInSummaryListView = function (a) {
        this.logUiEvent(UnifiedSearchComponents.COMPONENT_TRACKING_DRILL_DOWN_SUMMARY, a);
        this.selectEntity(a)
    };
    b.isElementInViewport = function (a) {
        if (!a) return !0;
        for (var b = a.offsetTop, d = a.offsetLeft, e = a.offsetWidth, f = a.offsetHeight; a.offsetParent; ) a = a.offsetParent, b += a.offsetTop, d += a.offsetLeft;
        a = Ext.get(document.body).getScroll();
        return b >= a.top && d >= a.left && b + f <= a.top + Ext.lib.Dom.getViewHeight(!0) && d + e <= a.left + Ext.lib.Dom.getViewWidth(!0)
    };
    b.prototype.scrollSearchBodyIntoViewPort = function () {
        var a =  Ext.get(b.SEARCH_BODY_ID);
        b.isElementInViewport(a.dom) || (LC.isRtlPage() ? window.scrollTo(Ext.lib.Dom.getViewWidth(!0), 0) : window.scrollTo(0, 0))
    };
    b.prototype.selectEntity = function (a) {
        this.updateDrilldown({
            fen: a
        })
    };
    b.prototype.selectRecords = function () {
        this.isViewingSummary() || (this.logUiEvent(UnifiedSearchComponents.COMPONENT_TRACKING_RECORDS_TOGGLE), this.displayRecordsView(), this.restoreOverlayOptionsSelectRecords())
    };
    b.prototype.displayRecordsView = function (a) {
        this.updateSummaryView(a)
    };
    b.prototype.selectFeeds = function () {
        this.logUiEvent(UnifiedSearchComponents.COMPONENT_TRACKING_FEEDS_TOGGLE);
        this.updateFeedsView()
    };
    b.prototype.searchAll = function (a) {
        this.logUiEvent(UnifiedSearchComponents.COMPONENT_TRACKING_SEARCH_ALL, a);
        this.displayRecordsView({
            searchAll: !0
        })
    };
    b.prototype.logUiEvent = function (a, b) {
        this.uiEventLog || (this.uiEventLog = []);
        this.uiEventLog.push([a, b])
    };
    b.prototype.commitUiEventLog = function () {
        if (this.uiEventLog) {
            var a = new SearchRequestInfo(this.getState()),
                b = this;
            Ext.each(this.uiEventLog, function (d) {
                SfdcApp.Search.Logger.logSeuit(d[0],
                    d[1], a, b.unifiedSearchPageVersion)
            })
        }
        this.uiEventLog = null
    };
    return b
} ());
//# sourceMappingURL=/javascript/1431595920000/sfdc/source/UnifiedSearch.js.map
