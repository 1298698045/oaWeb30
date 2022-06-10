﻿Sfdc.ns("SfdcApp.ChatterProfilePhotoSection");
SfdcApp.ChatterProfilePhotoSection = function () {
    return {
        showHideBadgeAndPhotoLinks: function (b) {
            var a = Sfdc.get("photoSection");
            b ? Sfdc.Dom.addClass(a, "hoverOrFocus") : Sfdc.Dom.removeClass(a, "hoverOrFocus")
        }
    }
} ();
(function () {
    Sfdc.provide("SfdcApp.Chatter.ProfileTabSet", function () {
        function l() {
            var b = new QueryString(window.location.hash.substr(1));
            if (!b.get(a.PARAM_TAB)) {
                var d = QueryString.createQueryString(window.location.href);
                b.replace(a.PARAM_TAB, d.get(a.PARAM_TAB))
            }
            return b
        }

        function C(a, e, c) {
            chatter.getToolbox().post({
                url: "/profile/tab/click",
                params: {
                    subjectid: d.subjectId,
                    initiatedtabload: c,
                    currenttabid: a.id,
                    currenttabtype: a.type,
                    clickedtabid: e.id,
                    clickedtabtype: e.type
                }
            });
            Sfdc.require("SfdcApp.Omni.Config",
                function (a) {
                    a.trackPartialPageLoad(e.id, v())
                })
        }

        function w(b) {
            var e = !1,
                c = d.tabs[b];
            b = d.tabContents[b];
            if (c.type == a.TYPE_STANDARD) q(c, b);
            else if (c.type == a.TYPE_FRAME) {
                var e = !1,
                    f = Sfdc.get(b.domId).children[0],
                    h = f.getAttribute(a.DATA_URL),
                    m = !1,
                    r = l(),
                    n = QueryString.createQueryString(window.location.href),
                    k = QueryString.createQueryString(h), g;
                for (g in n.getAllParams()) g.substring(0, a.PARAM_PAYLOAD_PREFIX.length + c.id.length) == a.PARAM_PAYLOAD_PREFIX + c.id && k.replace(g.substring(1 + a.PARAM_PAYLOAD_PREFIX.length + c.id.length), n.get(g));
                for (var p in r.getAllParams()) p.substring(0, a.PARAM_PAYLOAD_PREFIX.length + c.id.length) == a.PARAM_PAYLOAD_PREFIX + c.id && r.get(p) != n.get(p) && (m = !0, k.replace(p.substring(1 + a.PARAM_PAYLOAD_PREFIX.length + c.id.length), r.get(p)));
                f.setAttribute(a.DATA_URL, k.concatenateWithUrl(h));
                if (g = !m)
                    if (g = d.tabContentCurrent != b || null !== d.tabContentLoading) s(f) ? (g = f.contentWindow.location, g = x(g.pathname + g.search, h)) : (g = f.getAttribute("src"), g = x(g, h));
                g ? f.getAttribute(a.DATA_LOADED) == a.LOADED ? q(c, b) : t(c, b) : (e = !0, t(c), f.setAttribute(a.DATA_LOADED, a.NOT_LOADED), f.setAttribute(a.DATA_INIT, a.INITIALIZED), s(f) ? f.contentWindow.location.replace(h) : f.src = h)
            }
            d.hashPreviousId = c.id;
            d.tabCurrent = c;
            b = QueryString.createQueryString(window.location.href);
            history && "replaceState" in history && "pushState" in history ? (b.addAll(l()), b.replace(a.PARAM_TAB, c.id), b.refValue = null, b.hasRef = !1, c = b.toString(), "\x26" == c.substring(c.length - 1) && (c = c.substring(0, c.length - 1)), history.replaceState(null, null, c)) : (b = l(), b.replace(a.PARAM_TAB,
                c.id), c = window.location.href, 0 < c.indexOf("#") && (c = c.substring(0, c.indexOf("#"))), b = b.toString().substring(1), window.location.replace(c + "#" + b));
            return e
        }

        function u() {
            var b = d.tabs[l().get(a.PARAM_TAB)];
            b || (b = d.tabs[d.tabIdDefault]);
            SfdcCmp.init(Sfdc.get("profileTabSetHeader"));
            w(b.id);
            Sfdc.provide("SfdcApp.UserProfile.TabSwitch", {
                pageNameSuffix: b.id,
                options: v()
            })
        }

        function v() {
            var a = "self";
            if (!d.subjectId || !UserContext.userId || !(15 == d.subjectId.length || 18 == d.subjectId.length) || !((15 == UserContext.userId.length ||
                    18 == UserContext.userId.length) && ApiUtils.to15CharId(d.subjectId) === ApiUtils.to15CharId(UserContext.userId))) a = "other";
            return {
                properties: {
                    prop6: a
                }
            }
        }

        function y() {
            Sfdc.Dom.hideByDisplay(a.ID_LOADING_OVERLAY);
            for (var b in d.tabContents) Sfdc.Dom.removeClass(Sfdc.get(d.tabContents[b].domId), a.CSS_TAB_ACTIVE)
        }

        function t(b) {
            y();
            Sfdc.Dom.show(a.ID_LOADING_OVERLAY);
            d.tabLoading = b;
            z(b)
        }

        function q(b, e) {
            y();
            Sfdc.Dom.hideByVisibility(a.ID_LOADING_OVERLAY);
            z(b);
            d.tabLoading = null;
            d.tabContentCurrent = e
        }

        function D(b) {
            var e =d.tabs[b];
            b = d.tabContents[b];
            if (e && b) {
                var c = Sfdc.get(b.domId).children[0];
                if (c.getAttribute(a.DATA_INIT) != a.NOT_INITIALIZED) {
                    c.setAttribute(a.DATA_LOADED, a.LOADED);
                    var f = !1;
                    try {
                        f = s(c) && (c.src != "javascript" + a.FRAME_SRC_EMPTY || "about:blank" != c.contentWindow.location.href)
                    } catch (h) { }
                    if (f) {
                        f = c.contentDocument ? c.contentDocument : c.contentWindow.document;
                        if (!f) return;
                        var m = f.documentElement ? f.documentElement : f.body;
                        if (!m) return;
                        m.style.overflow = "hidden";
                        (f = c.getAttribute(a.DATA_INTERVAL_ID)) && clearInterval(f);
                        f = window.setInterval(function () {
                            var b = m.scrollHeight;
                            b != c.previousHeight && (c.style.height = b + "px", c.previousHeight = m.scrollHeight);
                            !c.getAttribute(a.DATA_REDIRECTING) && 0 <= c.contentDocument.location.href.search(a.URL_PROFILE) && (c.setAttribute(a.DATA_REDIRECTING, 1), t(e), window.location.href = c.contentDocument.location.href)
                        }, 300);
                        c.setAttribute(a.DATA_INTERVAL_ID, f)
                    }
                    d.tabLoading == e && q(e, b)
                }
            }
        }

        function s(b) {
            return "undefined" != typeof b.getAttribute(a.DATA_URL) && (document.location.origin && 0 === b.getAttribute(a.DATA_URL).search(document.location.origin) || "/" == b.getAttribute(a.DATA_URL).substr(0, 1))
        }

        function x(a, d) {
            var c = QueryString.createQueryString(a).concatenateWithUrl(a),
                f = QueryString.createQueryString(d).concatenateWithUrl(d);
            return c == f
        }

        function z(b) {
            for (var e in d.tabs) Sfdc.Dom.removeClass(Sfdc.get(d.tabs[e].domId).parentNode, a.CSS_TAB_ACTIVE), Sfdc.get(a.ID_TAB + "_" + e).setAttribute("aria-selected", "false"), Sfdc.get(a.ID_TAB_CONTENT + "_" + e).setAttribute("aria-hidden", "true");
            Sfdc.Dom.addClass(Sfdc.get(a.ID_TAB_CONTENT + "_" + b.id), a.CSS_TAB_ACTIVE);
            Sfdc.Dom.addClass(Sfdc.get(b.domId).parentNode, a.CSS_TAB_ACTIVE);
            Sfdc.get(a.ID_TAB + "_" + b.id).setAttribute("aria-selected", "true");
            Sfdc.get(a.ID_TAB_CONTENT + "_" + b.id).setAttribute("aria-hidden", "false");
            Sfdc.get(a.ID_MORE_TRIGGER_LABEL).innerHTML = a.LABEL_MORE;
            Sfdc.Dom.getParent(Sfdc.get(b.domId), a.SELECT_MORE) ? (Sfdc.Dom.addClass(Sfdc.get(a.ID_MORE_TRIGGER), a.CSS_TAB_ACTIVE), Sfdc.get(a.ID_MORE_TRIGGER_LABEL).innerHTML = Sfdc.get(b.domId).innerHTML) : Sfdc.Dom.removeClass(Sfdc.get(a.ID_MORE_TRIGGER), a.CSS_TAB_ACTIVE)
        }

        function A() {
            var b = QueryString.createQueryString(window.location.href),
                e = l(),
                c = e.get(a.PARAM_TAB),
                f;
            if (!(f = c != d.hashPreviousId))
                if (f = c == d.hashPreviousId) {
                    a: 
                    {
                        for (var h in e.getAllParams())
                            if (h.substring(0, a.PARAM_PAYLOAD_PREFIX.length + c.length) == a.PARAM_PAYLOAD_PREFIX + c && e.get(h) != b.get(h)) {
                                b = !1;
                                break a
                            }
                        b = !0
                    }
                    f = !b
                }
            f && (d.hashPreviousId = c, u())
        }

        function B() {
            var b = QueryString.createQueryString(window.location.href);
            2 > window.location.hash.length && b.get(a.PARAM_TAB) != d.hashPreviousId && (d.hashPreviousId = b.get(a.PARAM_TAB),u())
        }

        function E() {
            var b = function (a, b, d) {
                window.addEventListener ? window.addEventListener(a, b, d) : window.attachEvent(a, b)
            };
            if ("onhashchange" in window) b("hashchange", function (a) {
                A()
            }, !0);
            else {
                var e = l();
                d.hashPreviousId = e.get("tab");
                window.setInterval(function () {
                    A()
                }, a.INTERVAL_CHANGE_DETECTION_MS)
            }
            "onstatechange" in window ? b("statechange", function (a) {
                B()
            }, !0) : (e = QueryString.createQueryString(window.location.href), d.hashPreviousId = e.get("tab"), window.setInterval(function () {
                B()
            }, a.INTERVAL_CHANGE_DETECTION_MS));
            b("DOMFrameContentLoaded", function (b) {
                if (-1 != b.target.className.contains(a.CSS_MAIN_FRAME) && b.target.getAttribute(a.DATA_URL))
                    if (document.createEventObject) b.target.fireEvent("onload", document.createEventObject());
                    else {
                        var f = document.createEvent("HTMLEvents");
                        f.initEvent("load", !0, !0);
                        b.target.dispatchEvent(f)
                    }
            }, !0)
        }
        var a = {
            TAB: "tab",
            TAB_CONTENT: "tabContent",
            TYPE_STANDARD: "STANDARD",
            TYPE_FRAME: "FRAME",
            DATA_URL: "data-url",
            DATA_INIT: "data-initialized",
            DATA_LOADED: "data-loaded",
            DATA_INTERVAL_ID: "data-intervalId",
            DATA_ID: "data-id",
            DATA_TYPE: "data-type",
            DATA_REDIRECTING: "data-redirecting",
            DATA_WIDGET: "data-sfdc-widget",
            LOADED: "loaded",
            NOT_LOADED: "notLoaded",
            INITIALIZED: "initialized",
            NOT_INITIALIZED: "notInitialized",
            SELECT_TABS: "#profileTabSet\x3eli",
            SELECT_TAB_ANCHORS: "#profileTabSet\x3eli\x3ea",
            SELECT_TAB_CONTENTS: ".profileTabContent",
            SELECT_MORE: "#profileMore",
            FRAME_SRC_EMPTY: ":\x3chtml\x3e\x3c/html\x3e",
            PARAM_TAB: "tab",
            PARAM_PAYLOAD_PREFIX: "tab.",
            CSS_TAB_ACTIVE: "zen-current",
            CSS_HIDDEN: "hidden",
            CSS_MORE: "profileMore",
            CSS_MORE_LIST: "profileMoreList",
            CSS_MAIN_FRAME: "profileMainFrame",
            ID_MORE: "profileMore",
            ID_MORE_TRIGGER: "profileMoreTrigger",
            ID_MORE_TRIGGER_LABEL: "profileMoreTriggerLabel",
            ID_MORE_LIST: "profileMoreList",
            ID_TABSET: "profileTabSet",
            ID_TABSET_CONTAINER: "profileTabSetContainer",
            ID_TAB: "profileTab",
            ID_TAB_CONTENT: "profileTabContent",
            ID_LOADING_OVERLAY: "profileLoadingOverlay",
            LABEL_MORE: LC.getLabel("ProfilePlatformTabs", "More"),
            URL_PROFILE: "/_ui/core/userprofile/UserProfilePage",
            INTERVAL_CHANGE_DETECTION_MS: 100
        },
            d = {
                initialized: !1,
                subjectId: null,
                tabs: {},
                tabContents: {},
                tabCurrent: null,
                tabLoading: null,
                tabContentCurrent: null,
                tabIdDefault: null,
                hashPreviousId: null
            };
        return {
            initialize: function (b, e) {
                if (!d.initialized) {
                    Perf.mark("profileTabSetInit");
                    d.intialized = !0;
                    d.subjectId = b;
                    d.tabIdDefault = e;
                    var c = function () {
                        Sfdc.get(a.ID_TABSET_CONTAINER).style.display = "block";
                        Perf.mark("profileTabSetInitTabData");
                        for (var b = Sfdc.select(a.SELECT_TAB_ANCHORS), c = 0; c < b.length; c++) {
                            var e = b[c];
                            e.getAttribute(a.DATA_ID) && (d.tabs[e.getAttribute(a.DATA_ID)] = {
                                id: e.getAttribute(a.DATA_ID),
                                type: e.getAttribute(a.DATA_TYPE),
                                domId: e.id
                            })
                        }
                        b = Sfdc.select(a.SELECT_TAB_CONTENTS);
                        for (c = 0; c < b.length; c++) e = b[c], e.getAttribute(a.DATA_ID) && (d.tabContents[e.getAttribute(a.DATA_ID)] = {
                            id: e.getAttribute(a.DATA_ID),
                            domId: e.id
                        });
                        Perf.endMark("profileTabSetInitTabData");
                        Perf.mark("profileTabSetInitTabMore");
                        for (var b = Sfdc.select(a.SELECT_TABS), c = b[0], e = Sfdc.get(a.ID_MORE), l = Sfdc.get(a.ID_MORE_LIST), n = b.length - 1; 0 < n; n--) {
                            var k = b[n],
                                g = k.offsetTop,
                                p = e.offsetTop,
                                q = c.offsetTop;
                            if (k.id != a.ID_MORE && (g > q || p > q && 0 < l.getElementsByTagName("li").length)) Sfdc.Dom.removeClass(e, a.CSS_HIDDEN), k.offsetWidth > e.offsetWidth && (Sfdc.get(a.ID_MORE_TRIGGER_LABEL).innerHTML = k.firstChild.innerHTML), k.firstChild.setAttribute("role", "menuitem"), k.setAttribute(a.DATA_WIDGET, "SfdcCmp.Ui.Option"), Sfdc.get(a.ID_MORE_LIST).innerHTML = k.outerHTML + Sfdc.get(a.ID_MORE_LIST).innerHTML, k.parentNode.removeChild(k)
                        }
                        Perf.endMark("profileTabSetInitTabMore");
                        u();
                        b = Sfdc.get(a.ID_MORE);
                        0 < Sfdc.get(a.ID_MORE_LIST).getElementsByTagName("li").length && Sfdc.Dom.removeClass(b, a.CSS_HIDDEN);
                        E();
                        Perf.endMark("profileTabSetInit")
                    };
                    if (Sfdc.userAgent.isIE7) Sfdc.Dom.onReady(setTimeout(c, 100));
                    else c()
                }
            },
            handleTabChange: function (a, e) {
                var c = d.tabs[a],
                    f = d.tabCurrent,
                    h = w(a);
                C(f, c, h)
            },
            handleTabContentLoad: function (a) {
                D(a)
            }
        }
    } ())
})();
(function () {
    Sfdc.provide("SfdcApp.ChatterProfileSection", function () {
        var b = {};
        return {
            init: function (a, g, c, d, e, f) {
                if (!b[a]) {
                    c = UserContext.isAccessibleMode ? new CollaborationAccessibleDialog(a, c, d, e, f) : new NonaccessibleDialog(a, c, d, e, f);
                    b[a] = c;
                    var h = function () {
                        SfdcApp.ChatterProfileSection.showDialog(a)
                    };
                    Sfdc.each(Sfdc.select(g), function (a) {
                        Sfdc.on(a, "click", h)
                    })
                }
            },
            showDialog: function (a) {
                b[a] && (window.checkSessionTimeout && checkSessionTimeout(), b[a].display())
            }
        }
    } ())
})();

function UserProfile() {
    function f() {
        function e(a) {
            return function () {
                a.parent(".cxfeedfilter").addClass("cxselected")
            }
        }

        function f(a) {
            return function () {
                a.parent(".cxfeedfilter").addClass("cxselected")
            }
        }

        function g() {
            if (c) {
                var a = c.parent(".cxfeedfilter");
                a.removeClass("selected");
                a.removeClass("cxselected");
                c.set({
                    title: c.getAttribute("title").replace(h, "")
                });
                chatter.getToolbox().hide(a.child(".cxfeedfiltersubnav"));
                isIE7 && c.set({
                    hideFocus: !1
                });
                c = null
            }
        }

        function n() {
            g();
            chatter.getFeed().refresh({
                feedType: "USER"
            })
        }
        var b, k, h, c, d;
        this.initialize = function (a) {
            if (!b) {
                var m = chatter.getEventBus();
                b || (b = Ext.get(a));
                k = b.query("li\x3e.cxfeedfilterheader\x3ea.trigger");
                h = b.dom.getAttribute("selectedIndicator");
                d = b.select("a.showMore");
                overflowList = b.select("ul.overflow");
                d.on("click", function () {
                    overflowList.show(!0);
                    d.setVisibilityMode(Ext.Element.DISPLAY);
                    d.hide()
                });
                Sfdc.onReady(function () {
                    var a = Sfdc.clone(chatter.getFeed().getConfig());
                    chatter.getFeed().wireFeedSwitchAfterPost(a, function () {
                        return "USER" !== chatter.getFeed().config.feedType
                    });
                    m.addEventListener("chatter:feed", "onAfterNewPostFeedUpdate", function () {
                        g()
                    })
                });
                m.addEventListener("chatter:publisher", "onBeforeClearTopic", n);
                a = function () {
                    HelpBubble.hideBubble();
                    var a = this.parent(".cxfeedfilter");
                    if (this !== c) {
                        var b = chatter.getToolbox(),
                            d = Sfdc.userAgent.isIE7;
                        g();
                        a.addClass("selected");
                        this.set({
                            title: this.getAttribute("title") + h
                        });
                        b.show(a.child(".cxfeedfiltersubnav"));
                        d && this.set({
                            hideFocus: !0
                        });
                        a = this.parent(".cxfeedfilter");
                        b = {
                            feedType: "SEARCH",
                            isFullRefresh: !1
                        };
                        b.onSuccess = e(this);
                        b.onFailure = f(this);
                        b.params = {
                            str: a.dom.getAttribute("topic"),
                            createdById: a.dom.getAttribute("createdById"),
                            showFeedItemsOnly: !0
                        };
                        omnitureWrapper.trackEvent(chatter.getOmnitureEventMap().filterByTopic);
                        chatter.getFeed().refresh(b);
                        c = this
                    }
                };
                for (var p = k.length, l = 0; l < p; l++) Ext.get(k[l]).on("click", a)
            }
        }
    }
    var e;
    this.getFilterList = function () {
        e || (e = new f);
        return e
    }
}
chatter.extend("UserProfile", UserProfile, null);