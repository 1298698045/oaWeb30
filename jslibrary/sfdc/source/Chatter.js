(function (h) {
    if (!h.Sfdc || !h.Sfdc.canvas || !h.Sfdc.canvas.module) {
        var s = {};
        if (h.Sfdc && h.Sfdc.canvas)
            for (var p in h.Sfdc.canvas) h.Sfdc.canvas.hasOwnProperty(p) && (s[p] = h.Sfdc.canvas[p]);
        var t = Object.prototype,
            l = Array.prototype,
            q = h.document,
            e = {
                hasOwn: function (a, b) {
                    return t.hasOwnProperty.call(a, b)
                },
                isUndefined: function (a) {
                    return void 0 === a
                },
                isNil: function (a) {
                    return e.isUndefined(a) || null === a || "" === a
                },
                isNumber: function (a) {
                    return !!(0 === a || a && a.toExponential && a.toFixed)
                },
                isFunction: function (a) {
                    return !(!a ||
                        !a.constructor || !a.call || !a.apply)
                },
                isArray: Array.isArray || function (a) {
                    return "[object Array]" === t.toString.call(a)
                },
                isArguments: function (a) {
                    return !(!a || !e.hasOwn(a, "callee"))
                },
                isObject: function (a) {
                    return null !== a && "object" === typeof a
                },
                isString: function (a) {
                    return null !== a && "string" == typeof a
                },
                appearsJson: function (a) {
                    return /^\{.*\}$/.test(a)
                },
                nop: function () { },
                invoker: function (a) {
                    e.isFunction(a) && a()
                },
                identity: function (a) {
                    return a
                },
                each: function (a, b, c) {
                    if (!e.isNil(a)) {
                        var d = l.forEach, f = 0, g, m;
                        g = a.length;
                        c = c || a;
                        if (d && d === a.forEach) a.forEach(b, c);
                        else if (e.isNumber(g))
                            for (; f < g && !1 !== b.call(c, a[f], f, a); ) f += 1;
                        else
                            for (m in a)
                                if (e.hasOwn(a, m) && !1 === b.call(c, a[m], m, a)) break
                    }
                },
                startsWithHttp: function (a, b) {
                    return !e.isString(a) ? a : "http" === a.substring(0, 4) ? a : b
                },
                map: function (a, b, c) {
                    var d = [], f = l.map;
                    if (e.isNil(a)) return d;
                    if (f && a.map === f) return a.map(b, c);
                    c = c || a;
                    e.each(a, function (a, e, f) {
                        d.push(b.call(c, a, e, f))
                    });
                    return d
                },
                values: function (a) {
                    return e.map(a, e.identity)
                },
                slice: function (a, b, c) {
                    return l.slice.call(a, e.isUndefined(b) ? 0 : b, e.isUndefined(c) ? a.length : c)
                },
                toArray: function (a) {
                    return !a ? [] : a.toArray ? a.toArray : e.isArray(a) ? a : e.isArguments(a) ? e.slice(a) : e.values(a)
                },
                size: function (a) {
                    return e.toArray(a).length
                },
                indexOf: function (a, b) {
                    var c = l.indexOf, d;
                    if (!a) return -1;
                    if (c && a.indexOf === c) return a.indexOf(b);
                    c = 0;
                    for (d = a.length; c < d; c += 1)
                        if (a[c] === b) return c;
                    return -1
                },
                isEmpty: function (a) {
                    if (null === a) return !0;
                    if (e.isArray(a) || e.isString(a)) return 0 === a.length;
                    for (var b in a)
                        if (e.hasOwn(a, b)) return !1;
                    return !0
                },
                remove: function (a, b) {
                    var c = e.indexOf(a, b);
                    0 <= c && a.splice(c, 1)
                },
                param: function (a, b) {
                    function c(a, f) {
                        e.isNil(f) || (f = e.isFunction(f) ? f() : f, e.isArray(f) ? e.each(f, function (b, d) {
                            c(a, b)
                        }) : d[d.length] = b ? encodeURIComponent(a) + "\x3d" + encodeURIComponent(f) : a + "\x3d" + f)
                    }
                    var d = [];
                    b = b || !1;
                    if (e.isArray(a)) e.each(a, function (a, b) {
                        c(b, a)
                    });
                    else
                        for (var f in a) e.hasOwn(a, f) && c(f, a[f]);
                    return d.join("\x26").replace(/%20/g, "+")
                },
                objectify: function (a) {
                    var b = {}, c, d, f, g;
                    if (e.isNil(a)) return b;
                    "?" == a.substring(0, 1) && (a = a.substring(1));
                    a = a.split("\x26");
                    for (c = 0; c < a.length; c += 1) d = a[c].split("\x3d"), f = d[0], d = d[1], g = b[f], e.isNil(g) ? b[f] = d : e.isArray(g) ? g[g.length] = d : (b[f] = [], b[f][0] = g, b[f][1] = d);
                    return b
                },
                stripUrl: function (a) {
                    return e.isNil(a) ? null : a.replace(/([^:]+:\/\/[^\/\?#]+).*/, "$1")
                },
                query: function (a, b) {
                    if (e.isNil(b)) return a;
                    a = a.replace(/#.*$/, "");
                    return a += /^\#/.test(b) ? b : (/\?/.test(a) ? "\x26" : "?") + b
                },
                extend: function (a) {
                    e.each(e.slice(arguments, 1), function (b, c) {
                        e.each(b, function (b, c) {
                            a[c] = b
                        })
                    });
                    return a
                },
                endsWith: function (a, b) {
                    return -1 !== a.indexOf(b, a.length - b.length)
                },
                capitalize: function (a) {
                    return a.charAt(0).toUpperCase() + a.slice(1)
                },
                uncapitalize: function (a) {
                    return a.charAt(0).toLowerCase() + a.slice(1)
                },
                decode: function (a) {
                    var b = [],
                        c, d, f = "",
                        g, h = "",
                        k = 0;
                    a = a.replace(/[^A-Za-z0-9\+\/\=]/g, "");
                    do c = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)), d = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)), g = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)),
                        h = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)), c = c << 2 | d >> 4, d = (d & 15) << 4 | g >> 2, f = (g & 3) << 6 | h, b.push(String.fromCharCode(c)), 64 !== g && b.push(String.fromCharCode(d)), 64 !== h && b.push(String.fromCharCode(f)); while (k < a.length);
                    return e.escapeToUTF8(b.join(""))
                },
                escapeToUTF8: function (a) {
                    for (var b = "", c = 0; c < a.length; ) {
                        var d = a.charCodeAt(c++), f;
                        if (128 > d) b += String.fromCharCode(d);
                        else if (191 < d && 224 > d) f = a.charCodeAt(c++), b += String.fromCharCode((d & 31) << 6 | f & 63);
                        else {
                            f = a.charCodeAt(c++);
                            var e = a.charCodeAt(c++), b = b + String.fromCharCode((d & 15) << 12 | (f & 63) << 6 | e & 63)
                        }
                    }
                    return b
                },
                validEventName: function (a, b) {
                    var c, d = a.split(/\./),
                        f = /^[$A-Z_][0-9A-Z_$]*$/i,
                        g = {
                            sfdc: !0,
                            canvas: !0,
                            force: !0,
                            salesforce: !0,
                            chatter: !0
                        };
                    e.each(e.isArray(b) ? b : [b], function (a) {
                        g[a] = !1
                    });
                    return 2 < d.length ? 1 : 2 === d.length && (c = d[0].toLowerCase(), g[c]) ? 2 : !f.test(d[0]) || !f.test(d[1]) ? 3 : 0
                },
                prototypeOf: function (a) {
                    var b = Object.getPrototypeOf;
                    return e.isFunction(b) ? b.call(Object, a) : "object" === typeof {}.__proto__ ? a.__proto__ : a.constructor.prototype
                },
                module: function (a, b) {
                    var c = a.split("."), d = h.Sfdc.canvas, f, g;
                    "canvas" === c[1] && (c = c.slice(2));
                    g = c.length;
                    for (f = 0; f < g; f += 1) e.isUndefined(d[c[f]]) && (d[c[f]] = {}), d = d[c[f]];
                    e.isFunction(b) && (b = b());
                    return e.extend(d, b)
                },
                document: function () {
                    return q
                },
                byId: function (a) {
                    return q.getElementById(a)
                },
                byClass: function (a) {
                    return q.getElementsByClassName(a)
                },
                attr: function (a, b) {
                    var c = a.attributes, d;
                    for (d = 0; d < c.length; d += 1)
                        if (b === c[d].name) return c[d].value
                    },
                    onReady: function (a) {
                        e.isFunction(a) && n.push(a)
                    },
                    console: function () {
                        function a() {
                            try {
                                return "sessionStorage" in window && null !== window.sessionStorage
                            } catch (a) {
                                return !1
                            }
                        }

                        function b() { }

                        function c() { }

                        function d() {
                            Function.prototype.bind ? (b = Function.prototype.bind.call(console.log, console), c = Function.prototype.bind.call(console.error, console)) : (b = function () {
                                Function.prototype.apply.call(console.log, console, arguments)
                            }, c = function () {
                                Function.prototype.apply.call(console.error, console, arguments)
                            })
                        }

                        function f() {
                            b = function () { };
                            c = function () { }
                        }
                        var e = !1;
                        window && !window.console && (window.console = {});
                        window && !window.console.log && (window.console.log = function () { });
                        window && !window.console.error && (window.console.error = function () { });
                        (e = a() && "true" === sessionStorage.getItem("canvas_console")) ? d() : f();
                        return {
                            enable: function () {
                                e = !0;
                                a() && sessionStorage.setItem("canvas_console", "true");
                                d()
                            },
                            disable: function () {
                                e = !1;
                                a() && sessionStorage.setItem("canvas_console", "false");
                                f()
                            },
                            log: b,
                            error: c
                        }
                    } ()
                },
            n = [],
            r = function (a) {
                e.isFunction(a) && n.push(a)
            };
        (function () {
            function a() {
                c || (c = !0, a = e.nop, e.each(n, e.invoker), n = [])
            }

            function b() {
                if (!c) try {
                    document.documentElement.doScroll("left"), a()
                } catch (d) {
                    setTimeout(b, 30)
                }
            }
            var c = !1,                d, f;
            if (document.addEventListener) document.addEventListener("DOMContentLoaded", a, !1);
            else if (document.attachEvent) {
                try {
                    d = self !== top
                } catch (g) { }
                document.documentElement.doScroll && !d && b();
                document.attachEvent("onreadystatechange", function () {
                    "complete" === document.readyState && a()
                })
            }
            window.addEventListener ? window.addEventListener("load", a, !1) : window.attachEvent ? window.attachEvent("onload", a) : (f = window.onload, window.onload = function () {
                    f && f();
                    a()
                })
        })();
        e.each(e, function (a, b) {
            r[b] = a
        });
        e.each(s, function (a, b) {
            r[b] = a
        });
        (function () {
            for (var a, b = function () { }, c = "assert clear count debug dir dirxml error exception group groupCollapsed groupEnd info log markTimeline profile profileEnd table time timeEnd timeStamp trace warn".split(" "), d = c.length, e = "undefined" !== typeof window && window.console ? window.console : {}; d--; ) a = c[d], e[a] || (e[a] = b)
        })();
        h.Sfdc || (h.Sfdc = {});
        h.Sfdc.canvas = r
    }
})(this);
(function (b, a) {
    var g = function () {
        var e;
        return {
            post: function (f, d, c) {
                var h = Sfdc.JSON || JSON;
                if (b.isNil(d)) throw "ERROR: target_url was not supplied on postMessage";
                d = b.stripUrl(d);
                c = c || parent;
                a.postMessage && (b.isObject(f) && (f.targetModule = "Canvas"), f = h.stringify(f), b.console.log("Sending Post Message ", f), c.postMessage(f, d))
            }, 
            receive: function (f, d) {
                a.postMessage && (f && (e = function (c) {
                    var a, e, g = Sfdc.JSON || JSON;
                    b.console.log("Post Message Got callback", c);
                    if (!b.isNil(c)) {
                        if ("string" === typeof d && c.origin !== d) return b.console.log("source origin's don't match", c.origin, d), !1;
                        if (b.isFunction(d) && (e = d(c.origin, c.data), !1 === e)) return b.console.log("source origin's function returning false", c.origin, c.data), !1;
                        if (b.appearsJson(c.data)) {
                            try {
                                a = g.parse(c.data)
                            } catch (k) { }
                            if (!b.isNil(a) && (b.isNil(a.targetModule) || "Canvas" === a.targetModule)) b.console.log("Invoking callback"), f(a, e)
                        }
                    }
                }), a.addEventListener ? a.addEventListener("message", e, !1) : a.attachEvent("onmessage", e))
            },
            remove: function () {
                a.postMessage && (a.removeEventListener ? a.removeEventListener("message", e, !1) : a.detachEvent("onmessage", e))
            }
        }
    } ();
    b.module("Sfdc.canvas.xd", g)
})(Sfdc.canvas, this);
(function (k) {
    var p = function () {
        function l(d, a, e, g, b) {
            m(d, a, a, function (a, c, d) {
                a.appendChild(document.createTextNode(e));
                c.appendChild(document.createTextNode(g));
                d.appendChild(document.createTextNode(b))
            })
        }

        function m(d, a, e, g) {
            if (!k.isNil(d)) {
                var b, f, c, h;
                b = k.byId("canvas-notify-styles");
                k.isNil(b) && (b = document.createElement("style"), b.setAttribute("name", "canvas-notify-styles"), b.setAttribute("id", "canvas-notify-styles"), b.type = "text/css", window.attachEvent && !window.opera ? b.styleSheet.cssText = n : (f = document.createTextNode(n),
                    b.appendChild(f)), document.getElementsByTagName("head")[0].appendChild(b));
                b = document.createElement("div");
                b.setAttribute("class", "canvas-notify-block");
                f = document.createElement("div");
                f.setAttribute("class", "top-line");
                c = document.createElement("img");
                c.setAttribute("src", a);
                c.setAttribute("width", "16");
                c.setAttribute("height", "16");
                c.setAttribute("class", "title-image");
                a = document.createElement("div");
                a.setAttribute("class", "title-text");
                f.appendChild(c);
                f.appendChild(a);
                b.appendChild(f);
                f = document.createElement("div");
                f.setAttribute("class", "content");
                c = document.createElement("div");
                c.setAttribute("class", "contentIcon");
                h = document.createElement("img");
                h.setAttribute("src", e);
                h.setAttribute("width", "32");
                h.setAttribute("height", "32");
                c.appendChild(h);
                f.appendChild(c);
                e = document.createElement("div");
                e.setAttribute("class", "notify-message");
                c = document.createElement("div");
                c.setAttribute("class", "subject-text");
                h = document.createElement("div");
                h.setAttribute("class", "body-text");
                k.isFunction(g) && g(a, c, h);
                e.appendChild(c);
                e.appendChild(h);
                f.appendChild(e);
                for (b.appendChild(f); d.firstChild; ) d.removeChild(d.firstChild);
                d.appendChild(b)
            }
        }
        var n = "#canvas-notify-block {background: none repeat scroll 0 0 #FFFFFF;border-radius: 5px 5px 5px 5px;margin-bottom: 20px;overflow: hidden;position: relative;top: 1px;color: #222222;font-family: Arial,Helvetica,sans-serif;padding-left: 10px;}.canvas-notify-block .top-line{background-color: #DEDEDE;border: 1px solid #CCCCCC;border-radius: 5px 5px 0 0;padding-bottom: 15px;color: #222222;font-size: 10px;font-weight: bold;margin-bottom: 0px;margin-top: 0px;padding-left: 5px;padding-top: 0px;height: 10px;}.canvas-notify-block .top-line .title-image{float:left;padding-top:5px;}.canvas-notify-block .top-line .title-text{padding-left:20px;margin-top:8px;display:block;}.canvas-notify-block .content{border-bottom: 1px solid #CCCCCC;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;border-left: 1px solid #CCCCCC;border-right: 1px solid #CCCCCC;font-size: 15px;padding-right: 4px;}.canvas-notify-block .content .contentIcon{float: left;height: 40px;margin-bottom: 3px;margin-left: 20px;margin-top: 6px;padding-top: 6px;width: 40px;}.canvas-notify-block .content .notify-message .subject-text{font-weight: bold;}.canvas-notify-block .content .notify-message .body-text{padding-top: 10px;}.canvas-notify-block .content .notify-message{padding-left:80px;padding-top:20px;padding-bottom:20px;font-size: 11px;}";
        return {
            warning: function (d, a, e, g) {
                l(d, "/img/msg_icons/warning32.png", a, e, g)
            },
            error: function (d, a, e, g) {
                l(d, "/img/msg_icons/error32.png", a, e, g)
            },
            info: function (d, a, e, g) {
                l(d, "/img/msg_icons/info32.png", a, e, g)
            },
            show: l,
            custom: m
        }
    } ();
    k.module("Sfdc.canvas.notify", p)
})(Sfdc.canvas);
(function (c) {
    var M = function () {
        var G, m;

        function v(a, d, b, e) {
            var g = LC.getLabel("CanvasParentJs", "defaultNotifyTitle", b);
            b = LC.getLabel("CanvasParentJs", "defaultRenderSummary", b);
            var h = w(1, f[a]);
            c.isNil(h) ? c.notify.show(d, t("/img/msg_icons/error32.png"), g, b, e) : h({
                title: g,
                summary: b,
                detail: e
            });
            c.isNil(f[a]) || (H({
                name: "render",
                type: "ERROR",
                namespace: f[a].app.namespace,
                canvas: f[a].app.developerName,
                referenceId: f[a].app.referenceId,
                startTime: f[a].startTime,
                authType: f[a].app.authenticationType,
                payload: {
                    canvasUrl: f[a].url,
                    localizedMessage: c.isObject(e) ? q.stringify(e) : e
                },
                cversion: f[a].cversion
            }), A(a));
            if (!c.isNil(f[a]) && c.isFunction(f[a].options.onCanvasAppError)) f[a].options.onCanvasAppError()
        }

        function M(a, d, b, e, g, h) {
            var k = t("/img/msg_icons/info32.png"),
                l = LC.getLabel("CanvasParentJs", "defaultNotifyTitle", b),
                p = LC.getLabel("CanvasParentJs", "defaultRenderSummary", b);
            b = w(2, f[a]);
            c.isNil(b) ? c.notify.custom(d, k, k, function (a, b, d) {
                a.appendChild(document.createTextNode(l));
                b.appendChild(document.createTextNode(p));
                d.appendChild(document.createTextNode(e));
                c.isNil(h) || (a = document.createElement("a"), a.setAttribute("href", t(h)), a.setAttribute("title", g), a.appendChild(document.createTextNode(g)), d.appendChild(document.createElement("p")), d.appendChild(a))
            }) : b({
                title: l,
                summary: p,
                detail: e
            });
            if (!c.isNil(f[a])) {
                H({
                    name: "render",
                    type: "ERROR",
                    namespace: f[a].app.namespace,
                    canvas: f[a].app.developerName,
                    referenceId: f[a].app.referenceId,
                    startTime: f[a].startTime,
                    authType: f[a].app.authenticationType,
                    payload: {
                        canvasUrl: f[a].url,
                        localizedMessage: e
                    },
                    cversion: f[a].cversion
                });
                if (c.isFunction(f[a].options.onCanvasAppError)) f[a].options.onCanvasAppError();
                A(a)
            }
        }

        function w(a, d) {
            var b = Z[a];
            return !c.isNil(d) && (d.options && !c.isNil(d.options.customCanvasRenderer) && !c.isNil(d.options.customCanvasRenderer[b])) && c.isFunction(d.options.customCanvasRenderer[b]) ? d.options.customCanvasRenderer[b] : null
        }

        function N(a, d) {
            var b = f[a],
                e;
            e = w(0, b);
            var g = c.isNil(b.app.name) ? "" : b.app.name,
                g = LC.getLabel("CanvasParentJs", "loadingStatus", g);
            b.options && b.options.showLoadingStatus && (c.isNil(e) ? (A(a),e = c.byId("loading-" + a), c.isNil(e) ? (e = document.createElement("div"), e.setAttribute("id", "loading-" + a), e.setAttribute("style", "position:relative;width:25%;height:30px;margin-top:20px;margin-bottom:30px;"), e.style.display = "block", d.appendChild(e)) : e.style.display = "block", b.loadingScreen = new LoadingScreen(e, Sfdc.String.escapeToHtml(g)), b.loadingScreen.show()) : e(!0, g))
        }

        function A(a) {
            var d = f[a],
                b = w(0, d);
            c.isNil(b) ? (c.isNil(d.loadingScreen) || (d.loadingScreen.hide(), d.loadingScreen = null), a = c.byId("loading-" + a), c.isNil(a) || (a.style.display = "none", O(a))) : b(!1)
        }

        function O(a) {
            if (!c.isNil(a))
                for (; a.firstChild; ) a.removeChild(a.firstChild)
        }

        function P(a) {
            var d = {},
                b, e;
            if (!c.isNil(a.record) && !c.isNil(a.record.Id) && (d.Id = a.record.Id, !c.isNil(a.record.fields))) {
                a = a.record.fields.split(",");
                for (b = 0; b < a.length; b += 1) e = a[b].trim(), c.isUndefined(d[e]) && (d[e] = null)
            }
            return d
        }

        function D(a, c) {
            var b, e, f, h = c ? c + a : a;
            f = window.document.getElementsByTagName("iframe");
            e = f.length;
            for (b = 0; b < e; b += 1) try {
                if (f[b].name === h) return f[b].contentWindow
            } catch (k) { }
            return frames[h]
        }

        function t(a, d) {
            var b = null,
                e = a;
            c.isNil(I) ? c.isNil(J) || (e = J + e) : (b = I + a, e = location.protocol + "//" + location.hostname + ":" + location.port + "/services/proxy", d.headers["SalesforceProxy-Endpoint"] = b);
            UserContext && UserContext.getUrl && (e = UserContext.getUrl(e), UserContext.isDefaultNetwork || (e = Sfdc.Url.generateUrl(e)));
            return e
        }

        function $(a, d) {
            var b = d.id;
            if (c.isNil(b)) throw c.console.error(LC.getLabel("CanvasParentJs", "missingIdInContext")), LC.getLabel("CanvasParentJs", "missingIdInContext");
            if (a && a.body) {
                var e =
                    a.body.type,
                    g = a.seq,
                    h = f[b];
                h && (h.cversion = a.clientVersion, h.oauthToken = a.body.config.client.oauthToken);
                c.console.log("xdCallback type [%s] seq [%d] id [%s]", e, g, b);
                "ctx" === e ? n.services(g, b).ctx(a, h) : "ajax" === e ? n.services(g, b).ajax(a) : "resize" === e ? n.frame.childResize(a, h) : "subscribe" === e ? n.events.subscribe(a.body.subscriptions, h) : "unsubscribe" === e ? n.events.unsubscribe(a.body.subscriptions, h) : "publish" === e ? n.events.publishClient(a.body.event, h) : "refresh" === e ? n.services(g, b).refresh(a, h) : "repost" === e && n.services(g, b).repost(a, h)
            }
        }

        function Q() {
            K && c.xd.remove();
            c.xd.receive($, function (a, d) {
                if (c.appearsJson(d)) {
                    d = q.parse(d);
                    if (c.isNil(d.body) || c.isNil(d.body.config) || c.isNil(d.body.config.client)) return c.console.error("JSON from postMessage invalid", d), !1;
                    if (d.body.config.client.isVF) return c.console.log("can't find canvas, instanceId [%s] assuming from VF page", d.body.config.client.instanceId), {
                        id: d.body.config.client.instanceId
                    };
                    var b = f[d.body.config.client.instanceId];
                    if (!c.isNil(b)) return c.console.log("post url: c.url " +
                        b.url), c.console.log("actual canvas url, c.app.canvasUrl" + b.app.canvasUrl), "refresh" === d.body.config.type && c.stripUrl(b.app.canvasUrl) !== a ? (c.console.error("Source origin and canvas url are from different domains", b.app.canvasUrl, a), !1) : {
                            id: d.body.config.client.instanceId
                        }
                }
                return !1
            });
            K = !0
        }

        function R(a, d, b, e) {
            var g = f[a].app.namespace,
                h = f[a].app.developerName,
                k = f[a].app.referenceId,
                l = P(d),
                g = "/services/data/v" + r + "/platformconnect/signedrequest?" + (!c.isNil(k) ? "referenceId\x3d" + k : "canvas\x3d" + h + (!c.isNil(g) ? "\x26namespace\x3d" + g : ""));
            a = {
                success: b,
                failure: e,
                headers: {
                    Authorization: "OAuth " + C,
                    Accept: "application/json"
                },
                contentType: "application/json",
                method: "PUT",
                data: q.stringify({
                    canvasRequest: {
                        context: {
                            environment: {
                                dimensions: {
                                    height: d.height.value,
                                    width: d.width.value,
                                    maxHeight: d.height.max,
                                    maxWidth: d.width.max,
                                    clientWidth: d.clientWidth,
                                    clientHeight: d.clientHeight
                                },
                                parameters: d.parameters,
                                displayLocation: d.displayLocation,
                                sublocation: d.sublocation,
                                record: l
                            }
                        },
                        client: {
                            targetOrigin: document.location.protocol +"//" + document.location.host,
                            instanceId: a
                        }
                    }
                })
            };
            g = t(g, a);
            Sfdc.Ajax.request(g, a)
        }

        function H(a) {
            var d = c.isNil(a.type) ? null : a.type.toUpperCase();
            if (c.isNil(d) || -1 === c.indexOf(["FINISH", "ERROR"], d)) throw LC.getLabel("CanvasParentJs", "invalidTraceEventType");
            if (c.isNil(a.name)) throw LC.getLabel("CanvasParentJs", "invalidTraceEventName");
            if (c.isNil(a.canvas) && c.isNil(a.referenceId)) throw LC.getLabel("CanvasParentJs", "invalidTraceCanvasAppNameOrId");
            var b = "/services/data/v" + r + "/platformconnect/traceevent";
            a = {
                headers: {
                    Authorization: "OAuth " + C,
                    Accept: "application/json"
                },
                contentType: "application/json",
                data: q.stringify({
                    eventName: a.name,
                    eventType: d,
                    namespace: a.namespace,
                    canvas: a.canvas,
                    referenceId: a.referenceId,
                    payload: a.payload,
                    authType: a.authType,
                    startTime: a.startTime,
                    endTime: (new Date).getTime(),
                    parentVersion: r,
                    clientVersion: a.cversion
                })
            };
            b = t(b, a);
            Sfdc.Ajax.post(b, function () { }, a)
        }

        function x(a, d, b) {
            f[a].startTime && (H({
                name: "render",
                type: "FINISH",
                namespace: f[a].app.namespace,
                canvas: f[a].app.developerName,
                referenceId: f[a].app.referenceId,
                startTime: f[a].startTime,
                authType: f[a].app.authType,
                payload: {
                    canvasUrl: f[a].url
                },
                cversion: f[a].cversion
            }), f[a].startTime = null, A(a), d.style.display = "inline");
            if (c.isFunction(b.onCanvasAppLoad)) b.onCanvasAppLoad()
        }

        function aa(a, d, b, e, g) {
            var h, k, l;
            h = document.createElement("form");
            h.setAttribute("name", "canvas-hidden-form-" + a);
            h.setAttribute("style", "display:none");
            h.setAttribute("action", f[a].url);
            h.setAttribute("target", y + a);
            h.setAttribute("method", "post");
            k = document.createElement("input");
            k.setAttribute("type", "hidden");
            k.setAttribute("name", "signed_request");
            k.value = d;
            d = document.createElement("input");
            d.setAttribute("type", "submit");
            d.setAttribute("post", "post");
            h.appendChild(k);
            h.appendChild(d);
            b.appendChild(h);
            e = S(a, e, g);
            f[a].frameElement = e;
            b.appendChild(e);
            e.addEventListener ? e.onload = function () {
                x(a, this, g);
                this.onload = null
            } : e.attachEvent && (l = function () {
                var b = event.srcElement;
                c.isNil(b) || (x(a, b, g), b.detachEvent("onload", l))
            }, e.attachEvent("onload", l));
            c.isNil(document.forms["canvas-hidden-form-" +
                a]) || document.forms["canvas-hidden-form-" + a].submit()
        }

        function S(a, c, b) {
            var e = document.createElement("iframe");
            e.setAttribute("id", c);
            e.setAttribute("name", y + a);
            e.setAttribute("title", LC.getLabel("CanvasParentJs", "iframeTitle", f[a].app.name));
            e.style.display = "none";
            e.frameBorder = b.frameborder;
            e.width = b.width.value;
            e.height = b.height.value;
            e.scrolling = b.scrolling;
            return e
        }

        function ba(a, d, b, e) {
            var g, h;
            b = S(a, b, e);
            f[a].frameElement = b;
            d = d.appendChild(b);
            b.addEventListener ? b.onload = function () {
                x(a, this, e);
                this.onload = null
            } : b.attachEvent && (h = function () {
                var b = event.srcElement;
                c.isNil(b) || (x(a, b, e), b.detachEvent("onload", h))
            }, b.attachEvent("onload", h));
            d.contentDocument ? g = d.contentDocument : d.contentWindow && (g = d.contentWindow.document);
            g.location.replace(f[a].url)
        }

        function T(a, d, b) {
            var e = y + a,
                g, h = f[a].sr.split(".");
            g = {};
            if (2 !== h.length) throw LC.getLabel("CanvasParentJs", "invalidSignedRequestFormat");
            h = q.parse(c.decode(h[1]));
            if (c.isNil(h) || c.isNil(h.context.application)) throw LC.getLabel("CanvasParentJs",
                "unableToParseApp");
            f[a].app = h.context.application;
            f[a].loginUrl = h.context.links.loginUrl;
            "OAUTH" != f[a].app.authType && c.isNil(h.client.oauthToken) && (g._sfdc_canvas_auth = "user_approval_required");
            f[a].authStatus = g;
            N(a, d);
            !c.isNil(f[a].aux) && !c.isNil(f[a].aux.idpInitiatedUrl) ? (c.console.log("IdpInitiated Request..."), g = f[a].aux.idpInitiatedUrl) : g = decodeURIComponent(f[a].app.canvasUrl);
            h = document.location.protocol + "//" + document.location.host;
            if ("OAUTH" === f[a].app.authType || !c.isEmpty(f[a].authStatus)) {
                var k = c.param(f[a].authStatus);
                !c.isNil(f[a].loginUrl) && "http://login..com" !== f[a].loginUrl && (k += (0 < k.length ? "\x26" : "") + c.param({
                    loginUrl: encodeURIComponent(f[a].loginUrl)
                }));
                k += "#target_origin\x3d" + encodeURIComponent(h) + "\x26instance_id\x3d" + a;
                f[a].url = c.query(g, k);
                ba(a, d, e, b)
            } else f[a].url = g, aa(a, f[a].sr, d, e, b)
        }

        function U(a, d, b) {
            c.isNil(f[a].sr) ? (V(d, b), R(a, b, function (c) {
                c = q.parse(c);
                f[a].sr = c.response;
                f[a].aux = c.auxiliary;
                T(a, d, b)
            }, function (b) {
                var g = q.parse(b);
                b = f[a].app.name || f[a].app.developerName ||
                    f[a].app.referenceId || "undefined";
                if (!c.isNil(g) && 1 <= g.length) switch (g = g[0], g.errorCode) {
                    case "APP_NOT_FOUND":
                    case "NO_ACCESS":
                    case "UNSUPPORTED_LOCATION":
                    case "ACCESS_TOKEN_RETRIEVAL_ERROR":
                    case "APEX_CONFIGURATION_EXCEPTION":
                    case "ADMIN_AUTH_REQUIRED":
                        v(a, d, b, g.message);
                        break;
                    case "INVALID_SESSION_ID":
                        v(a, d, b, LC.getLabel("CanvasParentJs", "sessionInvalid"));
                        break;
                    case "NO_ACCESS_SETUP_ALLOWED":
                    case "UNSUPPORTED_LOCATION_SETUP_ALLOWED":
                    case "ADMIN_AUTH_REQUIRED_SETUP_ALLOWED":
                        g = g.message.split("#");
                        M(a, d, b, g[0], LC.getLabel("CanvasParentJs", "configureLabel"), 1 < g.length ? g[1] : null);
                        break;
                    default:
                        v(a, d, b, LC.getLabel("CanvasParentJs", "signedRequestRetrievalError", g.errorCode + ":" + g.message))
                } else v(a, d, b, LC.getLabel("CanvasParentJs", "signedRequestRetrievalError", ""))
            })) : T(a, d, b)
        }

        function V(a, d) {
            var b, e, f;
            c.isNil(a) || (c.isNil(d.clientWidth) && (b = a.clientWidth, 0 === b && (e = a.offsetParent, c.isNil(e) || (b = e.clientWidth)), d.clientWidth = b + "px"), c.isNil(d.clientHeight) && (b = a.clientHeight, 0 === b && (e = a.offsetParent,
                f = a.offsetTop, c.isNil(e) || (b = e.clientHeight - f), 0 > b && (b = 0)), d.clientHeight = b + "px"))
        }

        function L(a, d) {
            return (!c.isNil(a.developerName) ? (c.isNil(a.namespace) ? "_" : a.namespace) + ":" + a.developerName : a.referenceId) + (c.isNil(d) ? ":" : ":" + d)
        }

        function W(a, d, b) {
            var e = {
                frameborder: "0",
                width: {
                    value: "800px",
                    max: "1000px"
                },
                height: {
                    value: "900px",
                    max: "2000px"
                },
                scrolling: "no",
                displayLocation: "NONE",
                showLoadingStatus: !0
            };
            b && (!c.isObject(b.width) && !c.isNil(b.width) && (b.width = c.extend(e.width, {
                value: b.width
            })), !c.isObject(b.height) && !c.isNil(b.height) && (b.height = c.extend(e.height, {
                    value: b.height
                })), b.width = c.extend(e.width, b.width || {}), b.height = c.extend(e.height, b.height || {}));
            b = c.extend(e, b || {});
            b.height.value = n.frame.minPixels(b.height.value, b.height.max);
            b.width.value = n.frame.minPixels(b.width.value, b.width.max);
            e = c.isObject(d) ? d : c.byId(d);
            if (c.isNil(e)) window.alert(LC.getLabel("CanvasParentJs", "containerElementNotFound", d));
            else {
                d = L(a.app, b.canvasId);
                try {
                    if (c.isNil(a) || c.isNil(a.sr) && (c.isNil(a.app) || c.isNil(a.app.developerName) &&
                            c.isNil(a.app.referenceId))) throw LC.getLabel("CanvasParentJs", "insufficientAppContainerInfo");
                    if (c.isNil(a.version)) throw LC.getLabel("CanvasParentJs", "missingParentVersionInfo");
                    C = a.sid || C;
                    if (c.isNil(C)) throw LC.getLabel("CanvasParentJs", "missingSid");
                    if (!c.isNil(Sfdc.userAgent) && (Sfdc.userAgent.isIE6 || Sfdc.userAgent.isIE7 || Sfdc.userAgent.isOpera || Sfdc.userAgent.isNetscape)) throw LC.getLabel("CanvasParentJs", "unsupportedBrowser");
                    u(e, d);
                    f[d] = {
                        instanceId: d,
                        app: a.app,
                        sr: a.sr,
                        cversion: null,
                        options: b,
                        startTime: (new Date).getTime(),
                        onCanvasSubscribed: b.onCanvasSubscribed,
                        parentElem: e
                    };
                    r = a.version;
                    I = b.salesforceBaseUrl;
                    J = b.customPathPrefix;
                    N(d, e);
                    U(d, e, b);
                    Q()
                } catch (g) {
                    a = !c.isNil(a.app) ? a.app.developerName || a.app.referenceId || "undefined" : "undefined", v(d, e, a, g)
                }
            }
        }

        function u(a, d, b) {
            n.events.unsubscribeAll(f[d]);
            a = c.isObject(a) ? a : c.byId(a);
            O(a);
            c.isNil(b) && delete f[d]
        }
        var K = !1;
        G = "canvas.scroll";
        m = "sfdc.streamingapi";
        var Z = ["toggleLoadingScreen", "renderError", "renderInfo", "renderCanvas"],
            f = {},
            r, C, I,
            J, y = "canvas-frame-",
            q = Sfdc.JSON || JSON,
            n = function () {
                var a = function () {
                    function b(a, b) {
                        var d, e = a.name;
                        c.isNil(b) || (e === m ? !c.isNil(b.handlers) && !c.isNil(b.handlers[e]) && (d = b.handlers[e][a.params.topic]) : !c.isNil(b.handlers) && !c.isNil(b.handlers[e]) && (d = b.handlers[e]));
                        return d
                    }

                    function d(a) {
                        var e = !1;
                        c.each(f, function (d) {
                            c.isNil(b(a, d)) || (e = !0)
                        });
                        return e
                    }

                    function g(a, d) {
                        var e;
                        if (c.isNil(a.target) && c.isNil(d)) c.console.log("Targeting all canvas apps"), c.each(f, function (d, h) {
                            e = b(a, d);
                            c.isNil(e) || (c.isFunction(e) ?
                                    e(a.payload) : c.xd.post({
                                        parentVersion: r,
                                        clientVersion: d.cversion,
                                        payload: a,
                                        type: "event"
                                    }, c.stripUrl(d.url), D(h, y)))
                        });
                        else if (!c.isNil(a.target) && !c.isNil(a.target.canvas) && "parent" === a.target.canvas) e = b(a, f.parent), c.isFunction(e) && e(a.payload);
                        else if (c.isNil(d))
                            if (c.isNil(a.target.iframe)) c.isNil(a.target.canvas) ? c.console.error("Nothing to target") : (c.console.log("Targeting single canvas ", a.target.canvas), c.each(f, function (d, h) {
                                var f = h.split(":");
                                f[f.length - 1] === a.target.canvas && (c.console.log("Found targeted canvas app"),
                                        e = b(a, d), c.isNil(e) ? c.console.log("Canvas app has no handler") : c.xd.post({
                                            parentVersion: r,
                                            clientVersion: d.cversion,
                                            payload: a,
                                            type: "event"
                                        }, c.stripUrl(d.url), D(h, y)))
                            }));
                            else {
                                c.console.log("Targeting single iframe");
                                var h = D(a.target.iframe);
                                c.isNil(h) || c.xd.post({
                                    parentVersion: r,
                                    clientVersion: r,
                                    payload: a,
                                    type: "event"
                                }, "*", h)
                            } else c.console.log("Targeting canvas object"), e = b(a, d), (!c.isNil(e) || a.name === m) && c.xd.post({
                                parentVersion: r,
                                clientVersion: d.cversion,
                                payload: a,
                                type: "event"
                            }, c.stripUrl(d.url),
                                D(d.instanceId, y))
                    }

                    function h(a, c, b, d) {
                        a = "/services/data/v" + a.cversion;
                        c = {
                            success: b,
                            failure: d,
                            headers: c,
                            method: "HEAD"
                        };
                        a = t(a, c);
                        Sfdc.Ajax.request(a, c)
                    }

                    function k() {
                        var a;
                        s.current === s.ninitd && (s.current = s.initd, a = "/cometd/" + r + "/", Sfdc.cometd.init({
                            url: location.protocol + "//" + location.hostname + ":" + location.port + a,
                            requestHeaders: {
                                Authorization: "OAuth " + C
                            },
                            appendMessageTypeToURL: !1
                        }), z = Sfdc.cometd, c.isNil(u) && (s.current = s.hs, u = z.addListener("/meta/handshake", function (a) {
                            a.successful ? (!x && X() && z.batch(function () {
                                var a,b = c.toArray(f),d, e, h, k;
                                for (h = 0; h < b.length; h += 1) {
                                    a = e = b[h];
                                    d = [];
                                    k = m;
                                    !c.isNil(a.handlers) && !c.isNil(a.handlers[k]) && (d = a.handlers[k], d = c.toArray(d));
                                    a = d;
                                    for (k = 0; k < a.length; k += 1) d = a[k][0], Y(d, e)
                                }
                            }), x = !1, s.current = s.hsdone, B()) : s.current = s.hs
                        })))
                    }

                    function l(a, c) {
                        var b = v(a[m]);
                        if (b) p(b, c);
                        else throw "[" + m + "] Streaming subscription has no params or topic";
                    }

                    function p(a, b) {
                        var d, e = m;
                        b.handlers = b.handlers || {};
                        d = b.handlers;
                        c.isNil(d[e]) && (d[e] = {});
                        c.isNil(d[e][a]) && h(b, {
                            Authorization: "OAuth " + b.oauthToken
                        },
                                function () {
                                    n(a, b)
                                },
                                function (c, d) {
                                    var h;
                                    h = 401 === d.status ? LC.getLabel("CanvasParentJs", "subscribeRequiresAPI", e) : LC.getLabel("CanvasParentJs", "subscribeGenericError", d.status, e);
                                    g({
                                        name: e,
                                        params: {
                                            topic: a
                                        },
                                        method: "onComplete",
                                        payload: {
                                            success: !1,
                                            errorMessage: h
                                        }
                                    }, b)
                                })
                    }

                    function n(a, c) {
                        var b, d, e = m,h;
                        k();
                        h = function () {
                            b = z.subscribe(a, function (b) {
                                g({
                                    name: e,
                                    params: {
                                        topic: a
                                    },
                                    method: "onData",
                                    payload: b
                                }, c)
                            });
                            d = {
                                success: !0,
                                handle: b
                            };
                            b && (c.handlers[e][a] = b, g({
                                name: e,
                                params: {
                                    topic: a
                                },
                                method: "onComplete",
                                payload: d
                            },
                                    c))
                        };
                        s.current === s.hsdone ? h() : E.push(h)
                    }

                    function B() {
                        var a;
                        for (a = 0; a < E.length; a += 1)
                            if (c.isFunction(E[a])) E[a]();
                        E = []
                    }

                    function Y(a, c) {
                        var b, d = m;
                        (b = z.subscribe(a, function (b) {
                            g({
                                name: d,
                                params: {
                                    topic: a
                                },
                                method: "onData",
                                payload: b
                            }, c)
                        })) && (c.handlers[d][a] = b)
                    }

                    function q(a) {
                        z.unsubscribe(a);
                        X() || (z.removeListener(u), u = null, x = !0, s.current = s.ninitd, z.disconnect())
                    }

                    function X() {
                        var a = !1;
                        c.each(f, function (b) {
                            return !c.isNil(b.handlers) && !c.isNil(b.handlers[m]) ? (a = !0, !1) : !0
                        });
                        return a
                    }

                    function v(a) {
                        return !c.isNil(a.params) &&
                                !c.isNil(a.params.topic) ? a.params.topic : null
                    }

                    function w(a, b) {
                        var d, e = c.validEventName(a, b);
                        if (0 !== e) throw d = {
                            1: LC.getLabel("CanvasParentJs", "eventMultipleNamespaces"),
                            2: LC.getLabel("CanvasParentJs", "eventNamespaceReserved"),
                            3: LC.getLabel("CanvasParentJs", "eventInvalidCharacters")
                        }, d[e];
                    }

                    function A(a) {
                        var b, h = m,                                f, k, g;
                        c.isNil(a) || (b = a.handlers, c.isNil(b) || (k = b[h], c.each(k, function (a, d) {
                            f = b[h][d];
                            delete b[h][d];
                            0 >= c.size(b[h]) && delete b[h];
                            q(f)
                        }), a.handlers = {}, c.each(b, function (a, b) {
                            g = F[b];
                            !c.isNil(g) && !d(b) && g.unsubscribe()
                        })))
                    }
                    var z, x = !0,
                            s = {
                                ninitd: "notInitialized",
                                initd: "initialized",
                                hs: "handshake",
                                hsdone: "handshakeDone",
                                current: "notInitialized"
                            },
                            u, E = [],
                            F = [];
                    F[G] = function () {
                        function a() {
                            g({
                                name: G,
                                method: "onData",
                                payload: {
                                    heights: {
                                        contentHeight: document.documentElement.scrollHeight,
                                        pageHeight: document.documentElement.clientHeight,
                                        scrollTop: document.documentElement && document.documentElement.scrollTop || document.body.scrollTop
                                    },
                                    widths: {
                                        contentWidth: document.documentElement.scrollWidth,
                                        pageWidth: document.documentElement.clientWidth,
                                        scrollLeft: document.documentElement && document.documentElement.scrollLeft || document.body.scrollLeft
                                    }
                                }
                            })
                        }
                        var c = !1;
                        return {
                            subscribe: function (b) {
                                !0 !== c && (c = !0, window.addEventListener ? window.addEventListener("scroll", a, !1) : window.attachEvent && window.attachEvent("onscroll", a))
                            },
                            unsubscribe: function () {
                                !1 !== c && (window.removeEventListener ? window.removeEventListener("scroll", a, !1) : window.detachEvent && window.detachEvent("onscroll", a), c = !1)
                            }
                        }
                    } ();
                    F["canvas.orientation"] = function () {
                        var a = !1,
                                b;
                        return {
                            subscribe: function (d) {
                                !0 !==
                                        a && (a = !0, b = function () {
                                            var a = {},
                                                b;
                                            c.isNil(d.parentElem) || V(d.parentElem, a);
                                            b = {
                                                orientation: window.orientation
                                            };
                                            c.isNil(a.clientHeight) || (b.clientHeight = a.clientHeight);
                                            c.isNil(a.clientWidth) || (b.clientWidth = a.clientWidth);
                                            g({
                                                name: "canvas.orientation",
                                                method: "onData",
                                                payload: b
                                            })
                                        }, window.addEventListener ? window.addEventListener("orientationchange", b, !1) : window.attachEvent && window.attachEvent("orientationchange", b, !1))
                            },
                            unsubscribe: function () {
                                !1 !== a && (window.removeEventListener ? window.removeEventListener("orientationchange",
                                        b, !1) : window.detachEvent && window.detachEvent("orientationchange", b), a = !1, b = null)
                            }
                        }
                    } ();
                    return {
                        subscribe: function (a, b) {
                            var d = b.handlers || {},
                                    e, h;
                            c.console.log("Subscribing ", b);
                            if (c.isNil(a[m])) {
                                if (c.each(a, function (a, e) {
                                    c.isNil(e) || (d[e] = a, h = F[e], c.isNil(h) || h.subscribe(b))
                                }), b.handlers = d, c.isFunction(b.onCanvasSubscribed)) b.onCanvasSubscribed()
                            } else c.isNil(Sfdc.CometD) ? (e = t("/jslibrary/SfdcExtended.js"), Sfdc.Resource.addJavaScript(e, function () {
                                l(a, b)
                            })) : l(a, b)
                        },
                        unsubscribe: function (a, h) {
                            var f, k;
                            if (c.isNil(a[m])) {
                                if (!c.isNil(h))
                                    for (f in a) a.hasOwnProperty(f) &&
                                            !c.isNil(h.handlers[f]) && (delete h.handlers[f], k = F[f], !c.isNil(k) && !d(f) && k.unsubscribe())
                            } else {
                                var g;
                                k = m;
                                var l;
                                if (f = v(a[k])) g = {
                                    name: k,
                                    params: {
                                        topic: f
                                    }
                                }, g = b(g, h), c.isNil(g) || (g = h.handlers, l = g[k][f], delete g[k][f], 0 >= c.size(g[k]) && delete g[k], q(l));
                                else throw "[" + m + "] unsubscribe has no params or topic";
                            }
                        },
                        unsubscribeAll: function (a) {
                            A(a)
                        },
                        parentSubscribe: function (b) {
                            var d, e = {};
                            K || Q();
                            c.isNil(f.parent) && (f.parent = {});
                            d = f.parent;
                            c.each(c.isArray(b) ? b : [b], function (a) {
                                c.isNil(a.name) || (w(a.name, "canvas"),
                                        e[a.name] = a.onData)
                            });
                            c.console.log("Parent subscribing");
                            a.subscribe(e, d)
                        },
                        parentUnsubscribe: function (b) {
                            var d, e = {};
                            c.isNil(f.parent) && (f.parent = {});
                            d = f.parent;
                            c.each(c.isArray(b) ? b : [b], function (a) {
                                c.isNil(a.name) || (w(a.name), e[a.name] = a.onData)
                            });
                            a.unsubscribe(e, d)
                        },
                        publish: function (a, b) {
                            g({
                                name: a.name,
                                method: "onData",
                                payload: a.payload,
                                target: a.target
                            }, b)
                        },
                        publishClient: function (b) {
                            !c.isNil(b.target) && !c.isNil(b.target.iframe) && (b.target.iframe = null);
                            a.publish(b)
                        },
                        parentPublish: function (b) {
                            w(b.name);
                            a.publish(b)
                        }
                    }
                } (),
                    d = function () {
                        function a(b, d) {
                            return c.isNil(b) || c.isNil(d) || "final" === d ? !1 : !0
                        }

                        function d(a, b) {
                            if (c.endsWith(a, "%") || "infinite" === b || "final" === b) return c.endsWith(a, "%") || c.endsWith(a, "px") ? a : a + "px";
                            a = Number(a.split("px")[0]);
                            b = Number(b.split("px")[0]);
                            return (a < b ? a : b) + "px"
                        }

                        function g(h, f) {
                            var g, p;
                            !c.isNil(f) && !c.isNil(f.frameElement) && (a(h.height, f.options.height.max) && (p = d(h.height, f.options.height.max), f.frameElement.height = p), a(h.width, f.options.width.max) && (g = d(h.width, f.options.width.max),
                                f.frameElement.width = g));
                            return {
                                height: p,
                                width: g
                            }
                        }
                        return {
                            minPixels: d,
                            childResize: function (f, k) {
                                var l, p = f.body.config.client.instanceId;
                                c.console.log("Child asking to be resized, id: [%s]", p);
                                if (c.isNil(k)) {
                                    l = f.body.size;
                                    var m, B, q, r, t;
                                    c.console.log("Resizing VF [%s] to ", p, l);
                                    m = c.byId(p);
                                    B = m.getAttribute("data-max-canvas-width") || "final";
                                    q = m.getAttribute("data-max-canvas-height") || "infinite";
                                    c.console.log("Max Width [%s] Max Height [%s]", B, q);
                                    a(l.height, q) && (t = d(l.height, q), m.style.height = t);
                                    a(l.width,
                                        B) && (r = d(l.width, B), m.style.width = r);
                                    l = {
                                        height: t,
                                        width: r
                                    };
                                    n.events.publish({
                                        name: "sfdc.resize",
                                        payload: l,
                                        target: {
                                            iframe: p
                                        }
                                    });
                                    n.events.publish({
                                        name: "sfdc.resize",
                                        payload: l,
                                        target: {
                                            canvas: "parent"
                                        }
                                    })
                                } else l = g(f.body.size, k), n.events.publish({
                                    name: "canvas.resize",
                                    payload: l
                                }, k), n.events.publish({
                                    name: "canvas.resize",
                                    payload: l,
                                    target: {
                                        canvas: "parent"
                                    }
                                })
                            },
                            parentResize: function (a, b) {
                                c.isNil(b) ? (c.each(f, function (b) {
                                    c.isNil(b.instanceId) || (g(a, b), n.events.publish({
                                        name: "canvas.resize",
                                        payload: a
                                    }, b))
                                }), n.events.publish({
                                    name: "canvas.resize",
                                    payload: a,
                                    target: {
                                        canvas: "parent"
                                    }
                                })) : c.isNil(b.canvas) || c.each(f, function (c, d) {
                                    var e = d.split(":");
                                    e[e.length - 1] === b.canvas && (g(a, c), n.events.publish({
                                        name: "canvas.resize",
                                        payload: a,
                                        target: b
                                    }), n.events.publish({
                                        name: "canvas.resize",
                                        payload: a,
                                        target: {
                                            canvas: "parent"
                                        }
                                    }))
                                })
                            }
                        }
                    } ();
                return {
                    events: a,
                    services: function (a, d) {
                        function g(h, g) {
                            var l = g.getResponseHeader("Content-Type"),
                                p = {};
                            p.seq = a;
                            p.parentVersion = r;
                            p.clientVersion = f[d].cversion;
                            p.payload = l && h && 0 <= l.indexOf("application/json") ? q.parse(h) : h;
                            p.status =
                                g.status;
                            p.statusText = g.statusText;
                            p.responseHeaders = g.getAllResponseHeaders();
                            p.type = "callback";
                            c.xd.post(p, c.stripUrl(f[d].app.canvasUrl), D(d, y))
                        }
                        return {
                            ctx: function (a, b) {
                                var f = b.app.namespace,
                                    p = b.app.developerName,
                                    n = b.app.referenceId,
                                    m = c.byId(y + d),
                                    u = c.isNil(b.cversion) ? r : b.cversion,
                                    v = P(b.options),
                                    f = "/services/data/v" + u + "/platformconnect/canvascontext?" + (!c.isNil(n) ? "referenceId\x3d" + n : "canvas\x3d" + p + (!c.isNil(f) ? "\x26namespace\x3d" + f : "")),
                                    m = {
                                        success: g,
                                        failure: g,
                                        headers: {
                                            Authorization: "OAuth " +
                                                a.body.accessToken,
                                            Accept: "application/json"
                                        },
                                        contentType: "application/json",
                                        method: "PUT",
                                        data: q.stringify({
                                            environment: {
                                                dimensions: {
                                                    height: m && m.height || null,
                                                    width: m && m.width || null
                                                },
                                                parameters: b.options.parameters,
                                                displayLocation: b.options.displayLocation,
                                                sublocation: b.options.sublocation,
                                                record: v
                                            }
                                        })
                                    },
                                    f = t(f, m);
                                Sfdc.Ajax.request(f, m)
                            },
                            ajax: function (a) {
                                var b;
                                a.body.config.success = g;
                                a.body.config.failure = g;
                                b = a.body.url;
                                a = a.body.config;
                                b = t(b, a);
                                Sfdc.Ajax.request(b, a)
                            },
                            refresh: function (a, b) {
                                var d, e, f;
                                if ("OAUTH" === b.app.authType) throw LC.getLabel("CanvasParentJs", "authTypeMismatch");
                                R(b.instanceId, b.options, function (a, b) {
                                    200 == b.status ? (d = q.parse(a), f = d.response.split("."), e = q.parse(c.decode(f[1])), c.isNil(e.client.oauthToken) ? g("{}", {
                                        status: 403,
                                        statusText: LC.getLabel("CanvasParentJs", "userApprovalRequired"),
                                        getAllResponseHeaders: function () {
                                            return b.getAllResponseHeaders()
                                        },
                                        getResponseHeader: function (a) {
                                            return b.getResponseHeader(a)
                                        }
                                    }) : g(a, b)) : g(a, b)
                                }, g)
                            },
                            repost: function (a, b) {
                                var c = a.body.refresh ||
                                    !1;
                                if ("OAUTH" === b.app.authType) throw LC.getLabel("CanvasParentJs", "authTypeMismatch");
                                c && (b.sr = null);
                                u(b.parentElem, b.instanceId, !1);
                                b.options.showLoadingStatus = null;
                                b.startTime = (new Date).getTime();
                                U(b.instanceId, b.parentElem, b.options)
                            }
                        }
                    },
                    frame: d
                }
            } ();
        return {
            render: W,
            feed: function (a, d, b) {
                var e = c.byId(d),                    g = c.byId("canvas-icon-" + b.canvasId),                    h;
                h = L(a.app, b.canvasId);
                e && "block" === e.style.display ? (e.style.display = "none", g.style.display = "block", u(d, h)) : c.isNil(f[h]) && (b.onCanvasAppLoad = function () {
                    e.style.display = "block";
                    g.style.display = "none"
                }, b.onCanvasAppError = b.onCanvasAppLoad, b.parameters = q.parse(b.parameters), W(a, e, b))
            },
            subscribe: n.events.parentSubscribe,
            unsubscribe: n.events.parentUnsubscribe,
            publish: n.events.parentPublish,
            resize: n.frame.parentResize,
            close: function (a, c, b) {
                a = L(a, b);
                u(c, a)
            }
        }
    } ();
    c.module("Sfdc.canvas.parent", M)
})(Sfdc.canvas);
AccessiblePreviewContentDialog = function (a, b) {
    this.id = a;
    this.title = b;
    this.content = "";
    this.height = 550;
    this.width = 730
};
AccessiblePreviewContentDialog.prototype = new AccessibleDialog({});
AccessiblePreviewContentDialog.prototype.getContent = function () {
    return this.content
};
Sfdc.ns("Sfdc.BaseAccessibleFileDialog");
Sfdc.BaseAccessibleFileDialog = function (a) {
    AccessibleDialog.call(this, a)
};
Sfdc.BaseAccessibleFileDialog.prototype = new AccessibleDialog({});
Sfdc.BaseAccessibleFileDialog.prototype.isInAccessibilityMode = function () {
    return !1
};
Sfdc.BaseAccessibleFileDialog.prototype.display = function () {
    this.isInAccessibilityMode() || this.createContent();
    this.show()
};
Sfdc.BaseAccessibleFileDialog.prototype.show = function () {
    var a = this.isOpen;
    this.isInAccessibilityMode() ? (this.height || (this.height = 300), this.createAccessiblePopupWindow(), this.popupWindow && (this.popupWindow.focus(), this.popupWindow.confirmOnCloseLabel = LC.getLabel("Global", "dialogCloseConfirm"), curPopupWindow = this.popupWindow)) : OverlayDialog.prototype.show.call(this);
    !0 === a && chatter.getEventBus().fireEvent("chatter:files", "onAfterDialogOpen");
    document.body.style.overflow = "hidden"
};
Sfdc.BaseAccessibleFileDialog.prototype.createDialog = function () {
    this.isInAccessibilityMode() || OverlayDialog.prototype.createDialog.call(this)
};
Sfdc.BaseAccessibleFileDialog.prototype.hide = function () {
    if (this.isInAccessibilityMode()) {
        if (this.popupWindow) {
            try {
                this.popupWindow.confirmOnClose = !1, this.popupWindow.close()
            } catch (a) { }
            this.popupWindow = null
        }
    } else OverlayDialog.prototype.hide.call(this);
    document.body.style.overflow = "visible"
};
Sfdc.BaseAccessibleFileDialog.prototype.cancel = function () {
    var a = Sfdc.BaseAccessibleFileDialog.getDialogById(this.id);
    a && a.hide();
    this.hook_cancel()
};
Sfdc.BaseAccessibleFileDialog.prototype.hook_cancel = function () { };
Sfdc.BaseAccessibleFileDialog.getDialogById = function (a) {
    var c, b;
    b = Sfdc.BaseAccessibleFileDialog.prototype.isInAccessibilityMode() ? window.opener ? window.opener : window.parent : window;
    b.sfdcPage && (c = b.sfdcPage.getDialogById(a));
    return c
};
BaseAutoCompleteElement = function (a) {
    if (a && !AutoCompleteInputElement.getInstance(a.id) && (this.id = a.elementId, a.inDialog && BaseAutoCompleteElement.removeExistingInstance(this.id), this.element = document.getElementById(this.id), this.id && this.element)) {
        if (this.valElementId = a.valElementId) this.valElement = document.getElementById(this.valElementId);
        this.matchBlanks = !0;
        AutoCompleteInputElement.instanceRefs[this.id] = this;
        this.servletURI = a.servletURI ? a.servletURI : "/chatter/handlers/file/shareAutoComplete";
        this.minSuggestLen = a.minSuggestLen && 0 <= a.minSuggestLen ? a.minSuggestLen : 0;
        this.cache = {};
        this.triedQueries = {};
        this.selected = -1;
        this.requestParams = {};
        this.lastInput = null;
        this.enabled = !0;
        this.disableOnEsc = !1;
        this.displayHeader = this.shouldCaptureKeyStroke = !0;
        var b = this;
        addEvent(this.element, "keyup", function (a) {
            b.handleInput(a)
        });
        addEvent(this.element, "keydown", function (a) {
            b.handleNav(a)
        });
        this.allowHideAC = !0;
        this.handleBlur = a.handleBlur ? a.handleBlur : function () {
            b.clearSuggestions()
        };
        a.handleFocusExtra && (this.handleFocusExtra = a.handleFocusExtra);
        addEvent(this.element, "blur", function () {
            b.focused = !1;
            b.allowHideAC && b.handleBlur()
        });
        addEvent(this.element, "focus", function () {
            b.focused = !0;
            b.clearGhostText();
            b.displaySuggestions();
            b.handleFocusExtra && b.handleFocusExtra()
        });
        a.inDialog && (this.inDialog = a.inDialog);
        this.zIndex = a.zIndex ? a.zIndex : 8E4;
        a.disableGhostText || this.displayGhostText();
        this.handleSelect = a.handleSelect ? a.handleSelect : BaseAutoCompleteElement.defaultClickInternal;
        a.getMinimumWidth && (this.getMinimumWidth = a.getMinimumWidth);
        a.getACXPosition && (this.getACXPosition = a.getACXPosition);
        a.getACYPosition && (this.getACYPosition = a.getACYPosition)
    }
};
Ext.extend(BaseAutoCompleteElement, AutoCompleteInputElement);
BaseAutoCompleteElement.prototype.getBoxCssClass = function () {
    return AutoCompleteInputElement.BOX_CSS_CLASS + " ugAC_box"
};
BaseAutoCompleteElement.prototype.getListOlCssClass = function () {
    return "ugAC_list"
};
BaseAutoCompleteElement.prototype.getRowCssClass = function () {
    return AutoCompleteInputElement.ROW_CSS_CLASS + " ugAC_row"
};
BaseAutoCompleteElement.prototype.getRowSelectedCssClass = function () {
    return AutoCompleteInputElement.ROW_CSS_CLASS_SELECTED + " ugAC_rowSelected"
};
BaseAutoCompleteElement.prototype.getRowMouseOverCssClass = function () {
    return this.getRowCssClass() + " ugAC_row_hover"
};
BaseAutoCompleteElement.prototype.getHintRowCssClass = function () {
    return this.getRowCssClass() + " ugAC_hintRow"
};
BaseAutoCompleteElement.prototype.getInputBoxGhostTextCssClass = function () {
    return "ghostText"
};
BaseAutoCompleteElement.prototype.getMoveSelectionUp = function () {
    return "UP"
};
BaseAutoCompleteElement.prototype.getMoveSelectionDown = function () {
    return "DOWN"
};
BaseAutoCompleteElement.prototype.displayGhostText = function () {
    var a = Sfdc.get(this.id);
    a.blur();
    Sfdc.Dom.addClass(a, this.getInputBoxGhostTextCssClass());
    a.value = this.getGhostText()
};
BaseAutoCompleteElement.prototype.getGhostText = function () {
    return ""
};
BaseAutoCompleteElement.prototype.clearGhostText = function () {
    var a = Sfdc.get(this.id);
    this.inGhostMode() && (Sfdc.Dom.removeClass(a, this.getInputBoxGhostTextCssClass()), a.value = "")
};
BaseAutoCompleteElement.prototype.inGhostMode = function () {
    var a = Sfdc.get(this.id);
    return Sfdc.Dom.hasClass(a, this.getInputBoxGhostTextCssClass()) ? !0 : !1
};
BaseAutoCompleteElement.prototype.handleEnter = function (a) {
    var b = this.getRow(this.selected);
    b && b.onmousedown ? (b.onmousedown(), BaseAutoCompleteElement.needDefer() || AutoCompleteInputElement.captureKeystroke(a)) : AutoCompleteInputElement.captureKeystroke(a)
};
BaseAutoCompleteElement.prototype.getCacheKey = function (a) {
    return a
};
BaseAutoCompleteElement.prototype.retrieveFromServlet = function (a) { };
BaseAutoCompleteElement.prototype.positionACBox = function (a) {
    if (this.element && this.acBox && (!a || this.isACBoxVisible())) {
        a = this.getACXPosition(this.element) + 1;
        var b = this.getACYPosition(this.element),
            c = this.getMinimumWidth();
        Sfdc.userAgent.isIE8 && (a -= 1);
        this.acBox.setStyle("left", a + "px");
        this.acBox.setStyle("top", b + "px");
        this.acBox.setStyle("width", c + "px");
        this.acBox.setStyle("zIndex", this.zIndex);
        this.inDialog && this.acBox.setStyle("position", "absolute")
    }
};
BaseAutoCompleteElement.prototype.getMinimumWidth = function () {
    return this.element.clientWidth + 2
};
BaseAutoCompleteElement.prototype.displaySuggestions = function (a) {
    if (this.element) {
        var b = trim(this.element.value);
        if (a || b != this.lastInput || !this.isACBoxVisible()) this.setAppliedFlag(!1), this.lastInput = b, a = null, this.hasValidSelection() && (a = this.curSuggestions[this.selected]), this.curSuggestions = this.getSuggestions(b), this.updateACBox(this.curSuggestions, a)
    }
};
BaseAutoCompleteElement.prototype.getValidSuggestions = function (a, b) {
    for (var c = {
        AllItems: []
    }, d = c.AllItems, f = this.extractCurrentEntitySuggestions(b), e = 0, h = f.length; e < h; e++) {
        var g = f[e];
        this.isValidSuggestion(a, g) && d.push(g)
    }
    c.length = d.length;
    return c
};
BaseAutoCompleteElement.prototype.isValidSuggestion = function (a, b) {
    var c = this.getRegexForInput(a);
    return b.ItemName.match(c)
};
BaseAutoCompleteElement.prototype.updateACBox = function (a, b) {
    Sfdc.get(this.id);
    !a || 0 === a.length ? (this.displayACBox(a, b), this.scrollDiv(), this.updateWidth()) : BaseAutoCompleteElement.superclass.updateACBox.call(this, a, b)
};
BaseAutoCompleteElement.prototype.initACBox = function () {
    if (this.element) {
        this.acBox = document.createElement("div");
        this.acBox.id = this.id + AutoCompleteInputElement.BOX_ID;
        this.acBox.className = this.getBoxCssClass();
        this.addACBoxToPage(this.acBox);
        this.acBox = new iframeShim(this.acBox);
        this.acBox.setStyle("width", this.getMinimumWidth() + "px");
        var a = document.getElementById(this.id + AutoCompleteInputElement.BOX_ID);
        if (a) {
            var b = this;
            Sfdc.userAgent.isIE ? (addEvent(a, "mouseenter", function (a) {
                b.allowHideAC = !1
            }),
                addEvent(a, "mouseleave", function (a) {
                    b.allowHideAC = !0
                })) : (addEvent(a, "mouseover", function (a) {
                    b.allowHideAC = !1
                }), addEvent(a, "mouseout", function (a) {
                    b.allowHideAC = !0
                }))
        }
    }
};
BaseAutoCompleteElement.prototype.constructACBox = function (a, b) {
    var c = ["\x3col class\x3d'" + this.getListOlCssClass() + "'\x3e"],
        d = this.extractCurrentEntitySuggestions(a);
    this.addSuggestions(c, d, b, 0);
    this.addHintMessage(c, d);
    c.push("\x3c/ol\x3e");
    return c
};
BaseAutoCompleteElement.prototype.addHintMessage = function (a, b) {
    b && b.length > BaseAutoCompleteElement.MATCH_DISPLAY_LIMIT && a.push('\x3cli\x3e\x3cdiv class\x3d"' + this.getHintRowCssClass() + '"\x3e' + LC.getLabel("ChatterFileSharing", "tooManyMatchMessage") + "\x3c/div\x3e\x3c/li\x3e")
};
BaseAutoCompleteElement.prototype.extractCurrentEntitySuggestions = function (a) {
    return a.AllItems
};
BaseAutoCompleteElement.prototype.setACBoxHeight = function (a) {
    4 < a ? (this.acBox.setStyle("height", "144px"), this.scrolling = !0) : (this.acBox.setStyle("height", "auto"), this.scrolling = !1)
};
BaseAutoCompleteElement.prototype.select = function (a) {
    if (this.selected != a) {
        if (0 <= this.selected) {
            var b = this.getRow(this.selected);
            b && (b.className = this.getRowCssClass())
        }
        this.selected = a;
        if (b = this.getRow(a)) b.className = this.getRowSelectedCssClass()
    }
};
BaseAutoCompleteElement.prototype.addSuggestions = function (a, b, c, d) { };
BaseAutoCompleteElement.prototype.getSuggestionHtml = function (a) {
    var b = escapeHTML(this.lastInput);
    a = BaseAutoCompleteElement.htmlEncode(a.ItemName);
    var c = this.getRegexForInput(b);
    return ["\x3cspan class\x3d'name'\x3e", "" === b ? a : a.replace(c, '$1\x3cstrong class\x3d"autocompleteMatch"\x3e$2\x3c/strong\x3e'), "\x3c/span\x3e"].join("")
};
BaseAutoCompleteElement.prototype.compareSuggestions = function (a, b) {
    return a && b && a.ItemId && b.ItemId && b.ItemId == a.ItemId
};
BaseAutoCompleteElement.prototype.scrollDiv = function () {
    if (this.hasValidSelection() && this.scrolling)
        if (this.selectionMoveDirection === this.getMoveSelectionUp()) {
            var a = this.acBox.div.scrollHeight * ((this.selected + 1) / this.curSuggestions.length) - 34;
            this.acBox.div.scrollTop > a && (this.acBox.div.scrollTop = a)
        } else this.acBox.div.scrollTop = this.acBox.div.scrollHeight * ((this.selected + 1) / this.curSuggestions.length) - this.acBox.div.clientHeight
};
BaseAutoCompleteElement.prototype.handleNav = function (a) {
    AutoCompleteInputElement.isNav(a) && a.keyCode == KEY_TAB ? (this.handleEnter(a), this.resizeTextArea()) : (AutoCompleteInputElement.isNav(a) && a.keyCode == KEY_ARROW_U ? (this.selectionMoveDirection = this.getMoveSelectionUp(), (Sfdc.userAgent.isSafari || Sfdc.userAgent.isChrome) && AutoCompleteInputElement.captureKeystroke(a)) : AutoCompleteInputElement.isNav(a) && a.keyCode == KEY_ARROW_D && (this.selectionMoveDirection = this.getMoveSelectionDown()), BaseAutoCompleteElement.superclass.handleNav.call(this,a))
};
BaseAutoCompleteElement.prototype.saveToCache = function (a, b) {
    !a || "" === a ? this.emptyInputCache = b : this.cache[this.getCacheKey(a)] = b
};
BaseAutoCompleteElement.prototype.clearCache = function () {
    this.cache = {};
    this.triedQueries = {};
    this.emptyInputCache = {}
};
BaseAutoCompleteElement.prototype.checkCacheOrRetrieve = function (a) {
    var b = this.getCacheKey(a);
    (!a || "" === a ? this.emptyInputCache : this.cache[b]) || this.retrieveFromServlet(a);
    return !a || "" === a ? this.emptyInputCache : this.cache[b]
};
BaseAutoCompleteElement.mouseOver = function (a, b) {
    var c = AutoCompleteInputElement.getInstance(a);
    c && b != c.selected && (document.getElementById(AutoCompleteInputElement.getRowIdStatic(a, b)).className = c.getRowMouseOverCssClass())
};
BaseAutoCompleteElement.mouseOut = function (a, b) {
    var c = AutoCompleteInputElement.getInstance(a);
    c && b != c.selected && (document.getElementById(AutoCompleteInputElement.getRowIdStatic(a, b)).className = c.getRowCssClass())
};
BaseAutoCompleteElement.click = function (a, b, c, d, f, e, h, g, l) {
    var k = AutoCompleteInputElement.getInstance(b);
    k && (AutoCompleteInputElement.captureKeystroke(a), k.handleSelect(b, c, d, f, e, h, g, l))
};
BaseAutoCompleteElement.defaultClickInternal = function (a, b, c, d, f, e) {
    this.element.value = d;
    this.valElement && (this.valElement.value = c);
    this.select(b);
    this.complete()
};
BaseAutoCompleteElement.makeACBoxID = function (a) {
    return a + AutoCompleteInputElement.BOX_ID
};
BaseAutoCompleteElement.removeExistingInstance = function (a) {
    a = BaseAutoCompleteElement.makeACBoxID(a);
    (a = Sfdc.get(a)) && Sfdc.Dom.removeChild(a)
};
BaseAutoCompleteElement.needDefer = function () {
    return Sfdc.userAgent.isIE && !Sfdc.userAgent.isIE6 && !Sfdc.userAgent.isIE9 ? !0 : !1
};
BaseAutoCompleteElement.htmlEncode = function (a) {
    return !a ? a : String(a).replace(/&/g, "\x26amp;").replace(/>/g, "\x26gt;").replace(/</g, "\x26lt;").replace(/"/g, "\x26quot;").replace(/'/g, "\x26#39;")
};
BaseAutoCompleteElement.htmlEncodeForJS = function (a) {
    return !a ? a : String(a).replace(/>/g, "\x26gt;").replace(/</g, "\x26lt;").replace(/"/g, "\x26quot;").replace(/'/g, "\x26#39;").replace(/&/g, "\x26amp;")
};
Sfdc.ns("Sfdc.ChatterFiles");
Sfdc.ChatterFiles = {
ENTITY_NOT_VIEWABLE_COMMAND_URL: "/file/entitynotviewable/",
hideFileSyncBanner: function () {
    Sfdc.Dom.hideByDisplay(Sfdc.get("fileSyncOnBoardBanner"));
    UserContext.userPreferences.setBoolean("HideFileSyncBannerMsg", !0)
},
redirectToOwnerProfileUrl: function (a) {
    a = this.ENTITY_NOT_VIEWABLE_COMMAND_URL + a + "?p\x3dtrue";
    chatter.getToolbox().get({
        url: a,
        success: function (a, c) {
            navigateToUrl(c.ownerUrl)
        }
    })
},
toggleSyncUnsyncFileLinks: function (a, b) {
    var c = chatter.getToolbox(),
    d = Sfdc.Dom.getParent(a),
    e = {};
    e.style = b.style ? b.style : "Detail";
    var f = Ext.get(a);
    c.mask(f);
    c.post({
        url: "/file/filesyncsubscription/" + b.docId + ";" + b.action,
        id: b.docId,
        params: e,
        success: function (a, b) {
            if (d)
                if ("ListView" === e.style) {
                    var c = Chatter.Files.ContentListViewport.INSTANCE;
                    c.isFileSyncFilter() ? c.refresh() : d.innerHTML = b.html
                } else d.innerHTML = b.html
            },
            failure: function (a, b) {
                c.unmask(f)
            }
        })
    }
};
Sfdc.ChatterFileFeedActions = {
    items: [],
    selected: -1,
    link: null,
    linkId: null,
    popupLink: null,
    popup: null,
    onHover: function () {
        function b(a) {
            var c, b;
            a = Ext.get(a);
            a.setWidth(a.getWidth()).setHeight(a.getHeight());
            c = a.down(".previewHover");
            b = a.down("img");
            c || (c = a.createChild({
                tag: "div",
                cls: "previewHover",
                title: b.getAttribute("title")
            }), c.setStyle({
                width: b.getWidth() - b.getBorderWidth("lr") + "px",
                height: b.getHeight() - b.getBorderWidth("tb") + "px"
            }), c.setY(b.getY()), c.setVisibilityMode(Ext.Element.DISPLAY));
            c.show()
        }
        return function (a) {
            a = Ext.get(a);
            a.set({
                onmouseover: null,
                onfocus: null
            });
            b(a);
            a.hover(function (a, d) {
                (d = a.getTarget() ? a.getTarget(".contentThumbnail-a") : null) && b(d)
            }, function (a, b) {
                (b = a.getTarget() ? a.getTarget(".contentThumbnail-a") : null) && Ext.fly(b).child(".previewHover").hide()
            })
        }
    } (),
    stopIfNav: function (b, a) {
        var c = b.getKey();
        (37 <= c && 40 >= c || c === KEY_TAB) && b.stopEvent()
    },
    onNav: function (b, a) {
        function c() {
            var a;
            0 < e.selected ? (e.selected -= 1, a = e.items.elements[e.selected], Ext.fly(a).isVisible() ? Ext.fly(a).first().hasClass("chatterFollowUnfollow") ?
        (Ext.fly(a).first().first().isVisible() ? Ext.fly(a).first().first().first().focus() : Ext.fly(a).first().last().last().focus(), Sfdc.Event.fireEvent(Ext.fly(a).first().dom, "mouseover")) : Ext.fly(a).first().focus() : c()) : 0 === e.selected && (e.selected -= 1, e.popupLink.focus())
        }

        function d() {
            var a;
            e.selected < e.items.getCount() - 1 && (e.selected += 1, a = e.items.elements[e.selected], Ext.fly(a).isVisible() ? Ext.fly(a).first().hasClass("chatterFollowUnfollow") ? (Ext.fly(a).first().first().isVisible() ? Ext.fly(a).first().first().first().focus() :
        Ext.fly(a).first().last().last().focus(), Sfdc.Event.fireEvent(Ext.fly(a).first().dom, "mouseover")) : Ext.fly(a).first().focus() : d())
        }
        var f = b.getKey(), e = Sfdc.ChatterFileFeedActions;
        switch (f) {
            case KEY_ARROW_D:
                d();
                break;
            case KEY_ARROW_U:
                c();
                break;
            case KEY_ESC:
                e.closePopup();
                Ext.fly(e.linkId).focus();
                break;
            case KEY_TAB:
                b.shiftKey ? c() : d()
        }
        e.stopIfNav(b, a)
    },
    hoverHandler: function (b) {
        var a = this;
        return function (c, d) {
            var f;
            if (d = c.getTarget(".contentActionMenuItem")) d = Ext.get(d), b ? (a.items.removeClass("hover"),
        Ext.isIE7 && (f = d.parent(".contentActionMenu"), f.setWidth(f.getWidth())), d.addClass("hover")) : d.removeClass("hover")
        }
    },
    bindEvents: function (b) {
        var a = this,    c = b ? "on" : "un";
        a.items[c]("mouseover", a.hoverHandler(!0));
        a.items[c]("mouseout", a.hoverHandler(!1));
        a.items.each(function (b, f) {
            if (f = b.first()) f[c]("focus", a.hoverHandler(!0)), f[c]("blur", a.hoverHandler(!1))
        });
        Ext.isGecko ? (a.popup[c]("keypress", a.onNav), a.popup[c]("keydown", a.stopIfNav)) : (a.popup[c]("keydown", a.onNav), Ext.EventManager[c](window, "keydown",    a.stopIfNav));
        a.popup[c]("keyup", a.stopIfNav);
        Ext.getBody()[c]("click", a.closePopup)
    },
    openPopup: function (b) {
        var a = this,    c = Ext.get("contentActionMenu" + b);
        if (c.child(".more-file-actions") || Ext.isIE7 && "1" === c.getAttribute("loaded")) a.openPopupCallback(b);
        else {
            var d = c.getAttribute("docId"),
        f = {
            rendition: c.getAttribute("rendition"),
            subscribed: c.getAttribute("subscribed"),
            sharing: c.getAttribute("sharing")
        };
            chatter.getToolbox().get({
                url: "/chatterfileactionmenu/" + d,
                params: f,
                success: function (d, f) {
                    c.update(f.html, !0);
                    a.openPopupCallback(b)
                }
            })
        }
    },
    openPopupCallback: function (b) {
        var a;
        this.popup = Ext.get("contentActionMenu" + b);
        this.link = Ext.get(b);
        this.items = this.popup.select(".contentActionMenuItem", !0);
        this.linkId = b;
        this.selected = -1;
        Ext.isIE7 && !this.popup.hasClass("feedcontainer") && (this.popup.insertAfter(Ext.getBody().last()), this.popup.addClass("feedcontainer"));
        this.bindEvents(!0);
        this.popup.setVisible(!0);
        this.popupLink = this.popup.child(".more-file-actions");
        b = this.popup.getX() - this.popupLink.getX() + (Ext.isIE7 ? 2 : 0);
        a = this.popup.getY() - this.popupLink.getY() - (Ext.isIE7 ? 1 : 0);
        this.popup.parent(".chatterFileListBlock") ? a -= Ext.isIE8 && 0 < !Ext.query("body.ChatterPage").length ? 14 : 3 : Ext.isIE7 && 0 < Ext.getBody().query("div.chatterFileListBlock").length && (a = 16, b = 1, this.popup.dom.setAttribute("loaded", "1"));
        this.popup.position("absolute", null, this.link.getX() + b, this.link.getY() + a);
        Ext.isIE7 && 0 < Ext.getBody().query("div.chatterFileListBlock").length && (b = this.link.getY(), a = this.link.getX(), Ext.query("body.FileTabPage") && 0 === Ext.query("body.FileTabPage").length && (b += 5, a += 4), this.popup.first().position("absolute", null, a, b));
        this.checkUploadPerms();
        this.popupLink.focus()
    },
    closePopup: function (b) {
        for (var a = Sfdc.select("div.contentActionMenu"), c = null, d = 0; d < a.length; d++) c = a[d], Sfdc.Dom.isVisible(c) && Sfdc.Dom.hideByDisplay(c);
        Sfdc.ChatterFileFeedActions.bindEvents(!1);
        "string" === typeof b && document.getElementById(this.linkId).focus()
    },
    checkUploadPerms: function () {
        var b, a, c, d;
        c = Ext.query("div.contentActionMenu .unchecked");
        if (0 !== c.length) {
            a = "";
            for (b = 0; b < c.length; b++) d = c[b], d = Ext.get(d), a = a + d.child("span").dom.innerHTML + ",", d.removeClass("unchecked"), d.addClass("inverification");
            b = chatter.getToolbox();
            b.get({
                url: "/file/permissionCheck",
                params: {
                    docIds: a
                },
                success: function (a, b) {
                    var c, d, h, g, k = Ext.query("div.contentActionMenu .inverification"),
                l = Ext.toArray(b.Permissions);
                    for (d = 0; d < k.length; d++) g = Ext.get(k[d]), c = g.child("span").dom.innerHTML, -1 !== l.indexOf(c) ? (h = g.child("a"), h.set({
                        href: Sfdc.ChatterFileFeedActions.uploadUrl(c)
                    })) :
                g.addClass("disabled"), g.removeClass("inverification")
                }
            })
        }
    },
    resetDocUpload: function (b) {
        var a, c, d = Ext.query("div.contentActionMenu div.upload span.docid");
        if (0 < d.length)
            for (a = 0; a < d.length; a++) docidSpan = d[a], c = docidSpan.innerHTML, -1 !== c.indexOf(b) && Ext.fly(docidSpan).up(".upload", 5).addClass("unchecked");
        this.checkUploadPerms()
    },
    uploadUrl: function (b) {
        return UserContext.getUrl("/" + b + "?fa\x3dnv")
    },
    adjustLinkElemWidthForThumbnail: function (b) {
        b = Ext.get(b);
        var a = b.parent();
        a && (a.hasClass("contentThumbnail-a") && a.parent(".cxfeedcomment")) && a.setStyle({
        width: b.getWidth() + "px",
        height: b.getHeight() + "px"
        })
    }
};
Sfdc.ns("Sfdc.ContentMenuActionOverlayDialog");
Sfdc.ContentMenuActionOverlayDialog = function () { };
Ext.extend(Sfdc.ContentMenuActionOverlayDialog, NonaccessibleDialog);
Sfdc.ContentMenuActionOverlayDialog.DIALOG_ID = "ContentMenuActionOverlayDialog";
Sfdc.ContentMenuActionOverlayDialog.open = function (a) {
    var b = sfdcPage.getDialogById(Sfdc.ContentMenuActionOverlayDialog.DIALOG_ID);
    b ? (b.url = a.url, b.title = a.title) : b = new NonaccessibleDialog(Sfdc.ContentMenuActionOverlayDialog.DIALOG_ID, a.title, a.url, a.width, a.height);
    b.display()
};
Sfdc.ContentMenuActionOverlayDialog.prototype.hide = function () {
    NonaccessibleDialog.superclass.hide.call(this)
};
Sfdc.ns("Sfdc.DropdownPanel");
Sfdc.DropdownPanel = function (a, b) {
    this.id = a;
    this.clazz = b || "dropdownPanel";
    this.domObj = null;
    Sfdc.DropdownPanel.registerPanel(this)
};
Sfdc.DropdownPanel.list = {};
Sfdc.DropdownPanel.getPanel = function (a) {
    return Sfdc.DropdownPanel.list[a]
};
Sfdc.DropdownPanel.registerPanel = function (a) {
    Sfdc.DropdownPanel.list[a.id] = a
};
Sfdc.DropdownPanel.prototype.resizeEventHandler = function (a) {
    return function () {
        a.close()
    }
};
Sfdc.DropdownPanel.prototype.scrollEventHandler = function (a) {
return function () {
    a.close()
}
};
Sfdc.DropdownPanel.prototype.clickEventHandler = function (a, b) {
return function () {
    !a.hasFocus && Sfdc.Dom.isVisible(b) && a.close();
    a.hasFocus = !1
}
};
Sfdc.DropdownPanel.prototype.keydownEventHandler = function (a) {
return function (b) {
    getEvent(b).keyCode == KEY_ESC && a.close()
}
};
Sfdc.DropdownPanel.prototype.init = function () {
    if (!this.domObj) {
        var a = document.createElement("div");
        a.id = this.id;
        a.className = this.clazz;
        document.body.appendChild(a);
        var b = this;
        addEvent(a, "mouseover", function () {
            b.hasFocus = !0
        });
        addEvent(a, "mouseout", function () {
            b.hasFocus = !1
        });
        addEvent(window, "resize", b.resizeEventHandler(b));
        addEvent(window, "scroll", b.scrollEventHandler(b));
        addEvent(document.body, "click", b.clickEventHandler(b, a));
        addEvent(document.body, "keydown", b.keydownEventHandler(b), !1);
        this.initCustomEvents();
        this.domObj = a
    }
    return this.domObj
};
Sfdc.DropdownPanel.prototype.initCustomEvents = function () { };
Sfdc.DropdownPanel.prototype.getXY = function (a) {
    var b = 0, c = 0;
    a && a.x && (b = a.x);
    a && a.y && (c = a.y);
    return {
        x: b,
        y: c
    }
};
Sfdc.DropdownPanel.prototype.getSize = function () {
    return null
};
Sfdc.DropdownPanel.prototype.getContent = function (a) {
    return ""
};
Sfdc.DropdownPanel.prototype.hasFocusInitially = function () {
    return !0
};
Sfdc.DropdownPanel.prototype.show = function (a, b) {
    var c = this.init();
    if (c) {
        this.hasFocus = this.hasFocusInitially();
        this.anchorElem = a;
        Sfdc.Dom.show(c);
        var d = this.getXY(b);
        c.style.left = d.x + "px";
        c.style.top = d.y + "px";
        if (d = this.getSize()) d.width && (c.style.width = d.width + "px"), d.height && (c.style.height = d.height + "px");
        if (d = this.getContent(b)) c.innerHTML = d
    }
};
Sfdc.DropdownPanel.prototype.close = function () {
    this.domObj && (Sfdc.Dom.hideByDisplay(this.domObj), this.hasFocus = !1)
};
Sfdc.ns("Sfdc.FileSyncOnboardSetup");
Sfdc.FileSyncOnboardSetup.platform_switch = function (a) {
    var b = document.getElementById("chatterbox_onboarding_download_container"),c = "chatterbox_onboarding_download chatterbox_onboarding_download_bkground";
    Sfdc.FileSyncOnboardSetup.forSetupNode && (c = "chatterbox_onboarding_download");
    switch (a) {
        case "win":
            b.className = c + " chatterbox_onboarding_download_os_win";
            Sfdc.FileSyncOnboardSetup.current_platform = "win";
            break;
        case "mac":
            b.className = c + " chatterbox_onboarding_download_os_mac", Sfdc.FileSyncOnboardSetup.current_platform =  "mac"
    }
};
Sfdc.FileSyncOnboardSetup.download_installer = function () {
    var a = "https://" + Sfdc.FileSyncOnboardSetup.config.umpsUrl,a = "mac" === Sfdc.FileSyncOnboardSetup.current_platform ? a + Sfdc.FileSyncOnboardSetup.config.macDownloadPath : a + Sfdc.FileSyncOnboardSetup.config.windowsDownloadPath;
    location.href = a
};
Sfdc.FileSyncOnboardSetup.download_1_init = function (a) {
    document.getElementById("chatterbox_onboarding_download_2").className = "hidden";
    document.getElementById("chatterbox_onboarding_download_1").className = "chatterbox_onboarding_download_1";
    Sfdc.FileSyncOnboardSetup.platform_switch(a)
};
Sfdc.FileSyncOnboardSetup.download_2_init = function () {
    document.getElementById("chatterbox_onboarding_download_1").className = "hidden";
    document.getElementById("chatterbox_onboarding_download_2").className = "chatterbox_onboarding_download_2";
    Sfdc.FileSyncOnboardSetup.download_installer()
};
Sfdc.FileSyncOnboardSetup.forSetupNode = !1;
Sfdc.FileSyncOnboardSetup.config = {};
Sfdc.FileSyncOnboardSetup.current_platform = "";
Sfdc.FileSyncOnboardSetup.fileSyncOnboardSetupInit = function (a, b) {
    a && (Sfdc.FileSyncOnboardSetup.forSetupNode = !0);
    Sfdc.FileSyncOnboardSetup.config = b; -1 != navigator.appVersion.indexOf("Mac") ? Sfdc.FileSyncOnboardSetup.download_1_init("mac") : Sfdc.FileSyncOnboardSetup.download_1_init("win")
};
Sfdc.ns("Sfdc.MultiUploadConfirmDialog");
Sfdc.MultiUploadConfirmDialog = function (a) {
    OverlayDialogElement.call(this, a.id);
    this.width = 500;
    this.isModal = !1;
    this.setTitle(a.dialogTitle);
    this.warningMsg = a.warningMsg;
    this.yesButtonValue = a.yesButtonValue;
    this.noButtonValue = a.noButtonValue;
    this.extraClass = "multiUploadConfirmDialog";
    this.initContent()
};
Ext.extend(Sfdc.MultiUploadConfirmDialog, OverlayDialogElement);
Sfdc.MultiUploadConfirmDialog.DIALOG_ID = "multiUploadConfirmationDialog";
Sfdc.MultiUploadConfirmDialog.multiUploadConfirmationDialog = null;
Sfdc.MultiUploadConfirmDialog.open = function (a) {
    a = sfdcPage.getDialogById(a.id);
    a || (a = {
        id: Sfdc.MultiUploadConfirmDialog.DIALOG_ID
    }, a = new Sfdc.MultiUploadCancelSingleFileConfirmDialog(a), a.created = !0, a.register());
    a.show()
};
Sfdc.MultiUploadConfirmDialog.prototype.show = function () {
    OverlayDialogElement.prototype.show.call(this);
    Sfdc.get("chatterFilesMultiUploadDialog").style.zIndex = 50100
};
Sfdc.MultiUploadConfirmDialog.prototype.initContent = function () {
    var a = [];
    a.push('\x3cdiv class\x3d"message chatterDeprecationMessage multiUploadWarningMessage"\x3e\x3ctable\x3e\x3ctr\x3e');
    a.push('\x3ctd\x3e\x3cimg src\x3d"/s.gif" alt\x3d"' + LC.getLabel("Icon", "WARNING") + '" class\x3d"msgIcon" title\x3d"' + LC.getLabel("Icon", "WARNING") + '"\x3e\x3c/td\x3e');
    a.push('\x3ctd class\x3d"messageCell"\x3e\x3cdiv class\x3d"messageText"\x3e' + this.warningMsg + "\x3c/div\x3e\x3c/td\x3e");
    a.push("\x3c/tr\x3e\x3c/table\x3e\x3c/div\x3e");
    this.contents = a.join("");
    a = [];
    a.push('\x3cinput type\x3d"button" class\x3d"btn" onclick\x3d"sfdcPage.getDialogById(\'' + this.id + '\').yesButtonClicked();" value\x3d"' + this.yesButtonValue + '"/\x3e');
    this.noButtonValue && a.push('\x3cinput type\x3d"button" class\x3d"btn" onclick\x3d"sfdcPage.getDialogById(\'' + this.id + '\').noButtonClicked();" value\x3d"' + this.noButtonValue + '"/\x3e');
    this.buttonContents = a.join("")
};
Sfdc.MultiUploadConfirmDialog.prototype.yesButtonClicked = function () {
    this.cancel()
};
Sfdc.MultiUploadConfirmDialog.prototype.noButtonClicked = function () {
    this.cancel()
};
Sfdc.MultiUploadConfirmDialog.prototype.cancel = function () {
    Sfdc.get("chatterFilesMultiUploadDialog").style.zIndex = 50101;
    OverlayDialogElement.prototype.cancel.call(this)
};
Sfdc.ns("Sfdc.MultiUploadCancelRemainingConfirmDialog");
Sfdc.MultiUploadCancelRemainingConfirmDialog = function (a) {
    Sfdc.MultiUploadConfirmDialog.call(this, a)
};
Ext.extend(Sfdc.MultiUploadCancelRemainingConfirmDialog, Sfdc.MultiUploadConfirmDialog);
Sfdc.MultiUploadCancelRemainingConfirmDialog.DIALOG_ID = "MultiUploadCancelRemainingConfirmDialog";
Sfdc.MultiUploadCancelRemainingConfirmDialog.open = function () {
    var a = sfdcPage.getDialogById(Sfdc.MultiUploadCancelRemainingConfirmDialog.DIALOG_ID);
    a || (a = {
        id: Sfdc.MultiUploadCancelRemainingConfirmDialog.DIALOG_ID,
        dialogTitle: LC.getLabel("ChatterFileMultiUpload", "cancelRemainingUploadsTitle"),
        warningMsg: LC.getLabel("ChatterFileMultiUpload", "cancelRemainingUploadsMsg"),
        yesButtonValue: LC.getLabel("ChatterFileMultiUpload", "yesButtonCancelRemainingPanel"),
        noButtonValue: LC.getLabel("ChatterFileMultiUpload",    "noButtonCancelRemainingPanel")
    }, a = new Sfdc.MultiUploadCancelRemainingConfirmDialog(a), a.created = !0, a.register());
    a.show()
};
Sfdc.MultiUploadCancelRemainingConfirmDialog.prototype.yesButtonClicked = function () {
    Sfdc.MultiUploadConfirmDialog.prototype.yesButtonClicked.call(this);
    Sfdc.AccessibleMultiUploadFilesDialog.uploader.cancelRemainingUploads()
};
Sfdc.ns("Sfdc.MultiUploadStoppedConfirmDialog");
Sfdc.MultiUploadStoppedConfirmDialog = function (a) {
    Sfdc.MultiUploadConfirmDialog.call(this, a)
};
Ext.extend(Sfdc.MultiUploadStoppedConfirmDialog, Sfdc.MultiUploadConfirmDialog);
Sfdc.MultiUploadStoppedConfirmDialog.DIALOG_ID = "MultiUploadStoppedConfirmDialog";
Sfdc.MultiUploadStoppedConfirmDialog.open = function () {
    var a = sfdcPage.getDialogById(Sfdc.MultiUploadStoppedConfirmDialog.DIALOG_ID);
    a || (a = {
        id: Sfdc.MultiUploadStoppedConfirmDialog.DIALOG_ID,
        dialogTitle: LC.getLabel("ChatterFileMultiUpload", "uploadStoppedTitle"),
        warningMsg: LC.getLabel("ChatterFileMultiUpload", "uploadStoppedMsg"),
        yesButtonValue: LC.getLabel("ChatterFileMultiUpload", "yesButtonStopPanel"),
        noButtonValue: LC.getLabel("ChatterFileMultiUpload", "noButtonStopPanel")
    }, a = new Sfdc.MultiUploadStoppedConfirmDialog(a),a.created = !0, a.register());
    a.show()
};
Sfdc.ns("Sfdc.MultiUploadResumeConfirmDialog");
Sfdc.MultiUploadResumeConfirmDialog = function (a) {
    Sfdc.MultiUploadConfirmDialog.call(this, a)
};
Ext.extend(Sfdc.MultiUploadResumeConfirmDialog, Sfdc.MultiUploadConfirmDialog);
Sfdc.MultiUploadResumeConfirmDialog.DIALOG_ID = "MultiUploadResumeConfirmDialog";
Sfdc.MultiUploadResumeConfirmDialog.open = function () {
    var a = sfdcPage.getDialogById(Sfdc.MultiUploadResumeConfirmDialog.DIALOG_ID);
    a || (a = {
        id: Sfdc.MultiUploadResumeConfirmDialog.DIALOG_ID,
        dialogTitle: LC.getLabel("ChatterFileMultiUpload", "resumeUploadTitle"),
        warningMsg: LC.getLabel("ChatterFileMultiUpload", "resumeUploadMsg"),
        yesButtonValue: LC.getLabel("ChatterFileMultiUpload", "yesButtonResumePanel"),
        noButtonValue: LC.getLabel("ChatterFileMultiUpload", "noButtonResumePanel")
    }, a = new Sfdc.MultiUploadResumeConfirmDialog(a),a.created = !0, a.register());
    a.show()
};
Sfdc.ns("Sfdc.MultiUploadErrorHandlingDialog");
Sfdc.MultiUploadErrorHandlingDialog = function (a) {
    Sfdc.MultiUploadConfirmDialog.call(this, a)
};
Ext.extend(Sfdc.MultiUploadErrorHandlingDialog, Sfdc.MultiUploadConfirmDialog);
Sfdc.MultiUploadErrorHandlingDialog.DIALOG_ID = "MultiUploadErrorHandlingDialog";
Sfdc.MultiUploadErrorHandlingDialog.open = function (a) {
    var b = sfdcPage.getDialogById(Sfdc.MultiUploadErrorHandlingDialog.DIALOG_ID);
    b ? (b.warningMsg = a, b.initContent()) : (a = {
        id: Sfdc.MultiUploadErrorHandlingDialog.DIALOG_ID,
        dialogTitle: LC.getLabel("Global", "error"),
        warningMsg: a,
        yesButtonValue: LC.getLabel("Global", "close")
    }, b = new Sfdc.MultiUploadErrorHandlingDialog(a), b.created = !0, b.register());
    b.show();
    return b
};
Sfdc.MultiUploadErrorHandlingDialog.prototype.yesButtonClicked = function () {
    Sfdc.MultiUploadConfirmDialog.prototype.yesButtonClicked.call(this)
};
UserAndGroupAutoCompleteInputElement = function (a) {
    if (a && !AutoCompleteInputElement.getInstance(a.id) && (this.id = a.elementId, a.inDialog && UserAndGroupAutoCompleteInputElement.removeExistingInstance(this.id), this.element = document.getElementById(this.id), this.id && this.element)) {
        this.entityType = a.entityType ? a.entityType : UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER;
        if (this.valElementId = a.valElementId) this.valElement = document.getElementById(this.valElementId);
        this.matchBlanks = !0;
        AutoCompleteInputElement.instanceRefs[this.id] = this;
        this.servletURI = a.servletURI ? a.servletURI : "/chatter/handlers/file/shareAutoComplete";
        this.minSuggestLen = a.minSuggestLen && 0 <= minSuggestLen ? a.minSuggestLen : this.entityType === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP ? 0 : 1;
        this.cache = {};
        this.triedQueries = {};
        this.selected = -1;
        this.requestParams = {};
        this.lastInput = null;
        this.enabled = !0;
        this.disableOnEsc = !1;
        this.displayHeader = this.shouldCaptureKeyStroke = !0;
        var b = this;
        addEvent(this.element, "keyup", function (a) {
            b.handleInput(a)
        });
        addEvent(this.element, "keydown",            function (a) {
            b.handleNav(a)
        });
        this.allowHideAC = !0;
        this.handleBlur = a.handleBlur ? a.handleBlur : function () {
            b.clearSuggestions()
        };
        a.handleFocusExtra && (this.handleFocusExtra = a.handleFocusExtra);
        addEvent(this.element, "blur", function () {
            b.focused = !1;
            b.allowHideAC && b.handleBlur()
        });
        addEvent(this.element, "focus", function () {
            b.focused = !0;
            b.clearGhostText();
            b.displaySuggestions();
            b.handleFocusExtra && b.handleFocusExtra()
        });
        a.inDialog && (this.inDialog = a.inDialog);
        this.zIndex = a.zIndex ? a.zIndex : 200;
        a.ghostText && (this.ghostText = a.ghostText);
        a.disableGhostText || this.displayGhostText();
        this.handleSelect = a.handleSelect ? a.handleSelect : UserAndGroupAutoCompleteInputElement.defaultClickInternal;
        a.getMinimumWidth && (this.getMinimumWidth = a.getMinimumWidth);
        a.getACXPosition && (this.getACXPosition = a.getACXPosition);
        a.getACYPosition && (this.getACYPosition = a.getACYPosition);
        this.suggestions = []
    }
};
UserAndGroupAutoCompleteInputElement.prototype = new AutoCompleteInputElement;
UserAndGroupAutoCompleteInputElement.BOX_CSS_CLASS = AutoCompleteInputElement.BOX_CSS_CLASS + " ugAC_box";
UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS = AutoCompleteInputElement.ROW_CSS_CLASS + " ugAC_row";
UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS_SELECTED = AutoCompleteInputElement.ROW_CSS_CLASS_SELECTED + " ugAC_rowSelected";
UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS_MOUSE_OVER = UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS + " ugAC_row_hover";
UserAndGroupAutoCompleteInputElement.HINT_ROW_CSS_CLASS = UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS + " ugAC_hintRow";
UserAndGroupAutoCompleteInputElement.INPUTBOX_GHOSTTEXT_CSS_CLASS = "ghostText";
UserAndGroupAutoCompleteInputElement.MATCH_DISPLAY_LIMIT = 25;
UserAndGroupAutoCompleteInputElement.MOVE_SELECTION_UP = "UP";
UserAndGroupAutoCompleteInputElement.MOVE_SELECTION_DOWN = "DOWN";
UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER = "u";
UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP = "g";
UserAndGroupAutoCompleteInputElement.prototype.displayGhostText = function () {
    var a = Sfdc.get(this.id);
    a.blur();
    Sfdc.Dom.addClass(a, UserAndGroupAutoCompleteInputElement.INPUTBOX_GHOSTTEXT_CSS_CLASS);
    a.value = "";
    a.value = this.ghostText ? this.ghostText : this.entityType && this.entityType === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP ? LC.getLabel("ChatterFileSharing", "sharedWithGroupGhostText") : LC.getLabel("ChatterFileSharing", "sharedWithUserGhostText")
};
UserAndGroupAutoCompleteInputElement.prototype.clearGhostText = function () {
    var a = Sfdc.get(this.id);
    this.inGhostMode() && (Sfdc.Dom.removeClass(a, UserAndGroupAutoCompleteInputElement.INPUTBOX_GHOSTTEXT_CSS_CLASS), a.value = "")
};
UserAndGroupAutoCompleteInputElement.prototype.inGhostMode = function () {
    var a = Sfdc.get(this.id);
    return Sfdc.Dom.hasClass(a, UserAndGroupAutoCompleteInputElement.INPUTBOX_GHOSTTEXT_CSS_CLASS)
};
UserAndGroupAutoCompleteInputElement.prototype.handleEnter = function (a) {
    var b = this.getRow(this.selected);
    b && b.onmousedown && (b.onmousedown(), UserAndGroupAutoCompleteInputElement.needDefer() || AutoCompleteInputElement.captureKeystroke(a))
};
UserAndGroupAutoCompleteInputElement.prototype.getCacheKey = function (a) {
    return a
};
UserAndGroupAutoCompleteInputElement.prototype.retrieveFromServlet = function (a) {
    if (!this.inGhostMode()) {
        if (!this.isInputOk(a)) return !1;
        this.requestParams.str = a;
        this.entityType && this.entityType === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP && (this.requestParams.etype = UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP);
        var b = this;
        this.ajaxState = "initialized";
        var c = this.servletURI;
        "/chatter/handlers" == c.substr(0, 17) && (c = c.substring(17));
        chatter.getToolbox().get({
            url: c,
            params: this.requestParams,
            success: function (c, d) {
                b.ajaxState = "finished";
                b.saveToCache(a, d);
                b.displaySuggestions(!0)
            }
        });
        return !0
    }
};
UserAndGroupAutoCompleteInputElement.prototype.positionACBox = function (a) {
    if (this.element && this.acBox && (!a || this.isACBoxVisible())) {
        a = this.getACXPosition(this.element) + 1;
        var b = this.getACYPosition(this.element),    c = this.getMinimumWidth();
        Sfdc.userAgent.isIE8 && (a -= 1);
        this.acBox.setStyle("left", a + "px");
        this.acBox.setStyle("top", b + "px");
        this.acBox.setStyle("width", c + "px");
        this.acBox.setStyle("zIndex", this.zIndex);
        this.inDialog && this.acBox.setStyle("position", "absolute")
    }
};
UserAndGroupAutoCompleteInputElement.prototype.getMinimumWidth = function () {
    return this.element.clientWidth + 2
};
UserAndGroupAutoCompleteInputElement.prototype.displaySuggestions = function (a) {
    if (this.element && this.focused) {
        var b = trim(this.element.value);
        if (a || b != this.lastInput || !this.isACBoxVisible()) this.setAppliedFlag(!1), this.lastInput = b, a = null, this.isInputOk(b) ? (this.hasValidSelection() && (a = this.curSuggestions[this.selected]), this.curSuggestions = this.getSuggestions(b), this.updateACBox(this.curSuggestions, a)) : this.handleEmptyInput()
    }
};
UserAndGroupAutoCompleteInputElement.prototype.isInputOk = function (a) {
    return this.entityType === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER && (!a || "" === a || 2 > a.length && !/^[\u4E00-\u9FAF]+$/.test(a)) ? !1 : !0
};
UserAndGroupAutoCompleteInputElement.prototype.getValidSuggestions = function (a, b) {
    var c = {},    e = UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER === this.entityType ? "AllUsers" : "AllGroups";
    c[e] = [];
    for (var e = c[e], d = this.extraCurrentEntitySuggestions(b), f = 0, g = d.length; f < g; f++) {
        var h = d[f];
        this.isValidSuggestion(a, h) && e.push(h)
    }
    c.length = e.length;
    return c
};
UserAndGroupAutoCompleteInputElement.prototype.isValidSuggestion = function (a, b) {
    return !0
};
UserAndGroupAutoCompleteInputElement.prototype.updateACBox = function (a, b) {
    var c = Sfdc.get(this.id).value;
    this.isInputOk(c) && (!a || 0 === a.length ? (this.displayACBox(a, b), this.scrollDiv(), this.updateWidth()) : this.constructor.prototype.updateACBox.call(this, a, b))
};
UserAndGroupAutoCompleteInputElement.prototype.initACBox = function () {
    if (this.element) {
        this.acBox = document.createElement("div");
        this.acBox.id = this.id + AutoCompleteInputElement.BOX_ID;
        this.acBox.className = AutoCompleteInputElement.BOX_CSS_CLASS + " ugAC_box";
        this.addACBoxToPage(this.acBox);
        this.acBox = new iframeShim(this.acBox);
        this.acBox.setStyle("width", this.getMinimumWidth() + "px");
        var a = document.getElementById(this.id + AutoCompleteInputElement.BOX_ID);
        if (a) {
            var b = this;
            Sfdc.userAgent.isIE ? (addEvent(a, "mouseenter",
        function (a) {
            b.allowHideAC = !1
        }), addEvent(a, "mouseleave", function (a) {
            b.allowHideAC = !0
        })) : (addEvent(a, "mouseover", function (a) {
            b.allowHideAC = !1
        }), addEvent(a, "mouseout", function (a) {
            b.allowHideAC = !0
        }))
        }
    }
};
UserAndGroupAutoCompleteInputElement.prototype.constructACBox = function (a, b) {
    var c = ["\x3col class\x3d'ugAC_list'\x3e"],        e = this.extraCurrentEntitySuggestions(a);
    this.addSuggestions(c, e, b, 0);
    this.addHintMessage(c, e);
    c.push("\x3c/ol\x3e");
    return c
};
UserAndGroupAutoCompleteInputElement.prototype.addHintMessage = function (a, b) {
    b && b.length > UserAndGroupAutoCompleteInputElement.MATCH_DISPLAY_LIMIT && a.push('\x3cli\x3e\x3cdiv class\x3d"' + UserAndGroupAutoCompleteInputElement.HINT_ROW_CSS_CLASS + '" onmousedown\x3d\'UserAndGroupAutoCompleteInputElement.hideACBox("' + this.id + "\")'\x3e" + LC.getLabel("ChatterFileSharing", "tooManyMatchMessage") + "\x3c/div\x3e\x3c/li\x3e")
};
UserAndGroupAutoCompleteInputElement.prototype.extraCurrentEntitySuggestions = function (a) {
    return a[UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER === this.entityType ? "AllUsers" : "AllGroups"]
};
UserAndGroupAutoCompleteInputElement.prototype.setACBoxHeight = function (a) {
    4 < a ? (this.acBox.setStyle("height", "144px"), this.scrolling = !0) : (this.acBox.setStyle("height", "auto"), this.scrolling = !1)
};
UserAndGroupAutoCompleteInputElement.prototype.select = function (a) {
    if (this.selected != a) {
        if (0 <= this.selected) {
            var b = this.getRow(this.selected);
            b && (b.className = UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS)
        }
        this.selected = a;
        if (b = this.getRow(a)) b.className = UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS_SELECTED
    }
};
UserAndGroupAutoCompleteInputElement.prototype.addSuggestions = function (a, b, c, e) {
    if (b)
        if (0 === b.length) b = "\x3cb\x3e\x26quot;" + Sfdc.String.escapeToHtml(Sfdc.get(this.id).value) + "\x26quot;\x3c/b\x3e", a.push('\x3cli\x3e\x3cdiv class\x3d"ugAC_noMatch"\x3e'), this.entityType && this.entityType === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP ? "" === Sfdc.get(this.id).value ? (c = UserContext.getUrl("/_ui/core/chatter/groups/GroupListPage"), b = UserContext.getUrl("/_ui/core/chatter/groups/GroupCreatePage"), c =
'\x3ca href\x3d"' + c + '"\x3e' + LC.getLabel("FeedFilter", "GroupEmptyFeedJoinLink") + "\x3c/a\x3e", b = '\x3ca href\x3d"' + b + '"\x3e' + LC.getLabel("FeedFilter", "GroupEmptyFeedCreateLink") + "\x3c/a\x3e", a.push(LC.getLabel("ChatterFileSharing", "doesNotBelongToAnyGroup", c, b))) : a.push(LC.getLabel("ChatterFileSharing", "noMatchGroupText", b)) : a.push(LC.getLabel("ChatterFileSharing", "noMatchText", b)), a.push("\x3c/div\x3e\x3c/li\x3e");
        else {
            e = b.length < UserAndGroupAutoCompleteInputElement.MATCH_DISPLAY_LIMIT ? b.length : UserAndGroupAutoCompleteInputElement.MATCH_DISPLAY_LIMIT;
            for (var d = 0; d < e; d++) {
                var f = b[d];
                if (f && (f.ItemName || f.value)) {
                    var g = this.id;
                    this.suggestions[d] = {
                        id: g,
                        rowIndex: d,
                        itemId: b[d].ItemId,
                        itemName: Sfdc.String.escapeToHtml(b[d].ItemName),
                        itemTitle: Sfdc.String.escapeToHtml(b[d].Title),
                        imageLink: b[d].ImageLink,
                        badgeHtml: b[d].BadgeHtml,
                        imageHtml: b[d].ImageHtml || null,
                        itemPrivacy: b[d].ItemPrivacy || null,
                        isExternalUserOrGroup: !b[d].InternalUserOrGroup
                    };
                    a.push("\x3cli\x3e");
                    a.push("\x3cdiv ");
                    a.push("onmouseover\x3d'UserAndGroupAutoCompleteInputElement.mouseOver(" +        d + ', "' + g + "\")' ");
                    a.push("onmouseout\x3d'UserAndGroupAutoCompleteInputElement.mouseOut(" + d + ', "' + g + "\")' ");
                    a.push("onmousedown\x3d'UserAndGroupAutoCompleteInputElement.click(event, " + d + ', "' + g + "\")' ");
                    c && this.compareSuggestions(c, f) || !c && 0 === d ? (a.push("class\x3d'" + UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS_SELECTED + "' "), this.selected = d, this.select(d)) : a.push("class\x3d'" + UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS + "' ");
                    a.push("title\x3d'" + Sfdc.String.escapeToHtml(b[d].ItemName) +        "' ");
                    a.push("id\x3d'" + AutoCompleteInputElement.getRowIdStatic(g, d) + "'\x3e");
                    a.push(this.getSuggestionHtml(f));
                    a.push("\x3c/div\x3e");
                    a.push("\x3c/li\x3e")
                }
            }
        }
};
UserAndGroupAutoCompleteInputElement.prototype.getSuggestionHtml = function (a) {
    var b = escapeHTML(this.lastInput),c = Sfdc.String.escapeToHtml(a.ItemName),e = Sfdc.String.escapeToHtml(a.Title),d = this.getRegexForInput(b),b = "" === b ? c : c.replace(d, '$1\x3cstrong class\x3d"autocompleteMatch"\x3e$2\x3c/strong\x3e');
    return ["\x3cdiv class\x3d'ugAC_entityImgDiv'\x3e", a.ImageHtml, "\x3c/div\x3e\x3cspan class\x3d'name'\x3e", b, a.BadgeHtml, "\x3c/span\x3e \x3cdiv class\x3d'ugAC_userRole'\x3e", e, "\x3c/div\x3e"].join("")
};
UserAndGroupAutoCompleteInputElement.prototype.compareSuggestions = function (a, b) {
    return a && b && a.ItemId && b.ItemId && b.ItemId == a.ItemId
};
UserAndGroupAutoCompleteInputElement.prototype.scrollDiv = function () {
    if (this.hasValidSelection() && this.scrolling)
        if (this.selectionMoveDirection === UserAndGroupAutoCompleteInputElement.MOVE_SELECTION_UP) {
            var a = this.acBox.div.scrollHeight * ((this.selected + 1) / this.curSuggestions.length) - 34;
            this.acBox.div.scrollTop > a && (this.acBox.div.scrollTop = a)
        } else this.acBox.div.scrollTop = this.acBox.div.scrollHeight * ((this.selected + 1) / this.curSuggestions.length) - this.acBox.div.clientHeight
};
UserAndGroupAutoCompleteInputElement.prototype.handleNav = function (a) {
    AutoCompleteInputElement.isNav(a) && a.keyCode == KEY_TAB ? (this.handleEnter(a), this.resizeTextArea()) : (AutoCompleteInputElement.isNav(a) && a.keyCode == KEY_ARROW_U ? (this.selectionMoveDirection = UserAndGroupAutoCompleteInputElement.MOVE_SELECTION_UP, (Sfdc.userAgent.isSafari || Sfdc.userAgent.isChrome) && AutoCompleteInputElement.captureKeystroke(a)) : AutoCompleteInputElement.isNav(a) && a.keyCode == KEY_ARROW_D && (this.selectionMoveDirection = UserAndGroupAutoCompleteInputElement.MOVE_SELECTION_DOWN),this.constructor.prototype.handleNav.call(this, a))
};
UserAndGroupAutoCompleteInputElement.prototype.saveToCache = function (a, b) {
    !a || "" === a ? this.emptyInputCache = b : this.cache[this.getCacheKey(a)] = b
};
UserAndGroupAutoCompleteInputElement.prototype.clearCache = function () {
    this.cache = {};
    this.triedQueries = {};
    this.emptyInputCache = {}
};
UserAndGroupAutoCompleteInputElement.prototype.checkCacheOrRetrieve = function (a) {
    var b = this.getCacheKey(a);
    (!a || "" === a ? this.emptyInputCache : this.cache[b]) || this.retrieveFromServlet(a);
    return !a || "" === a ? this.emptyInputCache : this.cache[b]
};
UserAndGroupAutoCompleteInputElement.mouseOver = function (a, b) {
    var c = AutoCompleteInputElement.getInstance(b);
    c && a != c.selected && (document.getElementById(AutoCompleteInputElement.getRowIdStatic(b, a)).className = UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS_MOUSE_OVER)
};
UserAndGroupAutoCompleteInputElement.mouseOut = function (a, b) {
    var c = AutoCompleteInputElement.getInstance(b);
    c && a != c.selected && (document.getElementById(AutoCompleteInputElement.getRowIdStatic(b, a)).className = UserAndGroupAutoCompleteInputElement.ROW_CSS_CLASS)
};
UserAndGroupAutoCompleteInputElement.click = function (a, b, c) {
    if (c = AutoCompleteInputElement.getInstance(c)) AutoCompleteInputElement.captureKeystroke(a), c.handleSelect(c.suggestions[b])
};
UserAndGroupAutoCompleteInputElement.hideACBox = function (a) {
    (a = AutoCompleteInputElement.getInstance(a)) && a.handleBlur()
};
UserAndGroupAutoCompleteInputElement.defaultClickInternal = function (a) {
    this.element.value = Sfdc.String.unescapeHtml(a.itemName);
    this.valElement && (this.valElement.value = a.itemId);
    this.select(a.rowIndex);
    this.complete()
};
UserAndGroupAutoCompleteInputElement.makeACBoxID = function (a) {
    return a + AutoCompleteInputElement.BOX_ID
};
UserAndGroupAutoCompleteInputElement.removeExistingInstance = function (a) {
    a = UserAndGroupAutoCompleteInputElement.makeACBoxID(a);
    (a = Sfdc.get(a)) && Sfdc.Dom.removeChild(a)
};
UserAndGroupAutoCompleteInputElement.needDefer = function () {
    return Sfdc.userAgent.isIE7 || Sfdc.userAgent.isIE8 ? !0 : !1
};
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
        1 < a ? Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "uploadCanceledAllStatusHeaderMsg", a) : Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "singleUploadCanceledAllStatusHeaderMsg");
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
var isIE = -1 != navigator.appVersion.indexOf("MSIE") ? !0 : !1,
isWin = -1 != navigator.appVersion.toLowerCase().indexOf("win") ? !0 : !1,
isOpera = -1 != navigator.userAgent.indexOf("Opera") ? !0 : !1,
isIPad = -1 != navigator.userAgent.indexOf("iPad") ? !0 : !1,
isIPhone = -1 != navigator.userAgent.indexOf("iPhone") ? !0 : !1;

function controlVersion() {
    var a, c;
    try {
        c = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7"), a = c.GetVariable("$version")
    } catch (g) { }
    if (!a) try {
        c = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6"), a = "WIN 6,0,21,0", c.AllowScriptAccess = "always", a = c.GetVariable("$version")
    } catch (d) { }
    if (!a) try {
        c = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3"), a = c.GetVariable("$version")
    } catch (b) { }
    if (!a) try {
        new ActiveXObject("ShockwaveFlash.ShockwaveFlash.3"), a = "WIN 3,0,18,0"
    } catch (e) { }
    if (!a) try {
        new ActiveXObject("ShockwaveFlash.ShockwaveFlash"), a = "WIN 2,0,0,11"
    } catch (f) {
        a = -1
    }
    return a
}

function getSwfVer() {
    var a = -1;
    if (null !== navigator.plugins && 0 < navigator.plugins.length) {
        if (navigator.plugins["Shockwave Flash 2.0"] || navigator.plugins["Shockwave Flash"]) {
            var a = navigator.plugins["Shockwave Flash" + (navigator.plugins["Shockwave Flash 2.0"] ? " 2.0" : "")].description.split(" "),
    c = a[2].split("."),
    g = c[0],
    c = c[1],
    d = a[3];
            "" === d && (d = a[4]);
            "d" == d[0] ? d = d.substring(1) : "r" == d[0] && (d = d.substring(1), 0 < d.indexOf("d") && (d = d.substring(0, d.indexOf("d"))));
            a = g + "." + c + "." + d
        }
    } else-1 != navigator.userAgent.toLowerCase().indexOf("webtv/2.6") ? a = 4 : -1 != navigator.userAgent.toLowerCase().indexOf("webtv/2.5") ? a = 3 : -1 != navigator.userAgent.toLowerCase().indexOf("webtv") ? a = 2 : isIE && (isWin && !isOpera) && (a = controlVersion());
    return a
}

function detectFlashVer(a, c, g) {
    versionStr = getSwfVer();
    if (-1 == versionStr) return !1;
    if (0 !== versionStr) {
        isIE && isWin && !isOpera ? (tempArray = versionStr.split(" "), tempString = tempArray[1], versionArray = tempString.split(",")) : versionArray = versionStr.split(".");
        var d = versionArray[0], b = versionArray[1], e = versionArray[2];
        return d > parseFloat(a) || d == parseFloat(a) && (b > parseFloat(c) || b == parseFloat(c) && e >= parseFloat(g)) ? !0 : !1
    }
}

function ac_AddExtension(a, c) {
    return -1 != a.indexOf("?") ? a.replace(/\?/, c + "?") : a + c
}

function ac_Generateobj(a, c, g, d) {
    var b = "", e;
    if (isIE && isWin && !isOpera) {
        b += "\x3cobject ";
        for (e in c) "parent" != e && (b += e + '\x3d"' + c[e] + '" ');
        b += "\x3e";
        for (e in g) g.hasOwnProperty(e) && (b += '\x3cparam name\x3d"' + e + '" value\x3d"' + g[e] + '" /\x3e ');
        b += "\x3cp\x3e" + LC.getLabel("ContentFlashPlayer", "flashFilePreview") + "\x3c/p\x3e\x3c/object\x3e"
    } else {
        b += "\x3cembed ";
        for (e in d) d.hasOwnProperty(e) && "function" != typeof d[e] && (b += e + '\x3d"' + d[e] + '" ');
        b += "\x3e\x3cnoembed\x3e\x3cp\x3e" + LC.getLabel("ContentFlashPlayer", "flashFilePreview") + "\x3c/p\x3e\x3c/noembed\x3e\x3c/embed\x3e"
    }
    a.innerHTML = b
}

function ac_GetArgs(a, c, g, d, b) {
    for (var e = {
        embedAttrs: {},
        params: {},
        objAttrs: {}
    }, f = 0; f < a.length; f += 2) switch (a[f].toLowerCase()) {
        case "parent":
            e.parent = a[f + 1];
            break;
        case "classid":
            break;
        case "pluginspage":
            e.embedAttrs[a[f]] = a[f + 1];
            break;
        case "src":
        case "movie":
            a[f + 1] = ac_AddExtension(a[f + 1], c);
            e.embedAttrs.src = a[f + 1];
            e.params[g] = a[f + 1];
            break;
        case "onafterupdate":
        case "onbeforeupdate":
        case "onblur":
        case "oncellchange":
        case "onclick":
        case "ondblClick":
        case "ondrag":
        case "ondragend":
        case "ondragenter":
        case "ondragleave":
        case "ondragover":
        case "ondrop":
        case "onfinish":
        case "onfocus":
        case "onhelp":
        case "onmousedown":
        case "onmouseup":
        case "onmouseover":
        case "onmousemove":
        case "onmouseout":
        case "onkeypress":
        case "onkeydown":
        case "onkeyup":
        case "onload":
        case "onlosecapture":
        case "onpropertychange":
        case "onreadystatechange":
        case "onrowsdelete":
        case "onrowenter":
        case "onrowexit":
        case "onrowsinserted":
        case "onstart":
        case "onscroll":
        case "onbeforeeditfocus":
        case "onactivate":
        case "onbeforedeactivate":
        case "ondeactivate":
        case "type":
        case "codebase":
            e.objAttrs[a[f]] = a[f + 1];
            break;
        case "id":
        case "width":
        case "height":
        case "align":
        case "vspace":
        case "hspace":
        case "class":
        case "title":
        case "accesskey":
        case "name":
        case "tabindex":
            e.embedAttrs[a[f]] = e.objAttrs[a[f]] = a[f + 1];
            break;
        default:
            e.embedAttrs[a[f]] = e.params[a[f]] = a[f + 1]
    }
    e.objAttrs.classid = d;
    b && (e.embedAttrs.type = b);
    return e
}

function ac_FL_RunContent() {
    var a = ac_GetArgs(arguments, ".swf", "movie", "clsid:d27cdb6e-ae6d-11cf-96b8-444553540000", "application/x-shockwave-flash");
    ac_Generateobj(a.parent, a.objAttrs, a.params, a.embedAttrs)
}

function getFlexRoot(a) {
    return -1 != navigator.appName.indexOf("Microsoft") ? window[a] : document[a]
}

function sizeImagePreview(a, c, g, d) {
    var b = document.getElementById(a), e = b.height / b.width, f = "0px";
    b.width >= c && e <= g / c ? (b.width = c, b.height = b.width * e) : b.height >= g && (b.height = g, b.width = b.height / e);
    b.height < g && (f = 0.45 * (g - b.height) + "px");
    b.style.marginTop = f;
    d ? Ext.fly(a).removeClass(d) : Ext.fly(a).dom.style.display = "block"
}

function onPreviewSuccess(a, c, g, d) {
    sizeImagePreview(a, c, g, d);
    if (a = Ext.fly("fullPreviewNotSupported")) a.dom.style.display = "block"
}

function showPreviewError(a) {
    a = Ext.fly(a).parent("div");
    if ("chatterFileViewerPanel" == a.dom.id) a.dom.innerHTML = previewErrorHtml, a.child("div").dom.style.display = "block";
    else {
        var c = LC.getLabel("ChatterFileListPage", "noPreviewOnDevice");
        a.dom.innerHTML = '\x3ctable style\x3d"font-size:1.2em;font-weight:bold;width:100%;height:100%"\x3e\x3ctr\x3e\x3ctd style\x3d"text-align:center;vertical-align:middle;"\x3e\x3c/td\x3e\x3c/tr\x3e\x3c/table\x3e';
        a.child("td").dom.innerHTML = c
    }
    if (a = Ext.fly("fullPreviewNotSupported")) a.dom.style.display = "none"
}

function doIPadIPhonePreview(a, c, g, d, b, e, f, l, m, n, h) {
    var k;
    d = g.split("\x26");
    for (b = 0; b < d.length; b++) 0 === d[b].indexOf("v\x3d") && (k = d[b].substring(2));
    c = UserContext.getUrl("/sfc/servlet.shepherd/version/download/" + k + "?asPdf\x3dtrue");
    k = UserContext.getUrl("/sfc/servlet.shepherd/version/renditionDownload?rendition\x3dTHUMB720BY480\x26versionId\x3d" + k);
    d = a.clientWidth;
    b = a.clientHeight - 30;
    previewErrorHtml = a.innerHTML;
    k = '\x3cdiv style\x3d"' + ("width:" + d + "px; height:" + b + "px;") + '"\x3e\x3ca href\x3d"' + c + '"\x3e\x3cimg onerror\x3d"showPreviewError(this)" onload\x3d"onPreviewSuccess(\'imageRendition\', \'' + d + "', '" + b + '\')" id\x3d"imageRendition" style\x3d"display:none;margin:auto;" src\x3d"' + k + '"/\x3e\x3c/a\x3e\x3c/div\x3e';
    d = null;
    b = !1;
    h && h.fileType && (d = h.fileType, b = h.isImage);
    h = "";
    b || (b = null, null !== d && (b = escapeHTML(LC.getLabel("ContentDownloadLinkElement", "downloadFeedPost", " " + d))), h = '\x3cdiv id\x3d"fullPreviewNotSupported" style\x3d"display:none"\x3e\x3ctable cellpadding\x3d"0" cellspacing\x3d"0" class\x3d"fullPreviewNotSupported"\x3e\x3ctr\x3e\x3ctd class\x3d"iconCell"\x3e\x3cimg class\x3d"warningIcon" width\x3d"1" height\x3d"1" alt\x3d"" src\x3d"/img/s.gif"/\x3e\x3c/td\x3e\x3ctd class\x3d"textCell"\x3e' +
escapeHTML(LC.getLabel("ChatterFileListPage", "fullPreviewNotSupported")) + "\x3c/td\x3e", null !== b && (h += ' \x3ctd\x3e\x3cdiv class\x3d"download"\x3e\x3ca class\x3d"actionLink" href\x3d"' + c + '"\x3e\x3cimg width\x3d"1" height\x3d"1" title\x3d"' + b + '" class\x3d"downloadIcon" alt\x3d"" src\x3d"/img/s.gif"/\x3e\x3cspan class\x3d"actionLabel"\x3e' + b + "\x3c/span\x3e\x3c/a\x3e\x3c/div\x3e\x3c/td\x3e"), h += "\x3c/tr\x3e\x3c/table\x3e\x3c/div\x3e");
    a.innerHTML = k + h
}

function showDownloadLink(a, c) {
    if ("undefined" != typeof Ext && "undefined" != typeof Shepherd) {
        var g = new Ext.Element(Ext.getDom("container_bubble"));
        g.setSize(500, 100);
        g.center();
        Shepherd.getHelper("bubble").getBubble().wrapper.style.top = Position.realOffset($("body_content"))[1] + 50;
        new Ext.Panel({
            id: "noFlashPanel",
            border: !1,
            buttonAlign: "center",
            renderTo: a,
            frame: !1,
            bodyStyle: "text-align:center;margin-bottom:20px;",
            html: c.adobeFlashVersionLbl,
            buttons: [new Ext.Button({
                text: c.downloadAdobeLbl,
                handler: function () {
                    window.open("http://www.adobe.com/go/getflashplayer")
                }
            }),
    new Ext.Button({
        text: c.closeDialogLbl,
        hidden: !Ext.fly(a).up("div#container_bubble"),
        handler: function () {
            Shepherd.run("bubble", "hide")
        }
    })
]
        })
    } else a.innerHTML = "\x3cfont style\x3d'text-align:center' color\x3d'#000'\x3e" + c.adobeFlashVersionLbl + " " + c.downloadAdobeLinkLbl + "\x3cbr/\x3e\x3ca href\x3d'http://www.adobe.com/go/getflashplayer' target\x3d'_blank'\x3ehttp://www.adobe.com/go/getflashplayer\x3c/a\x3e\x3c/font\x3e"
}

function insertFlexComponent(a, c, g, d, b, e, f, l, m, n) {
    var h = "string" == typeof e ? document.getElementById(e) : e;
    isIPad || isIPhone ? doIPadIPhonePreview(h, a, c, g, d, b, e, f, l, m, n) : (e = detectFlashVer(6, 0, 65), l = detectFlashVer(9, 0, 115), e && !l ? showDownloadLink(h, m) : l ? ac_FL_RunContent("src", a, "FlashVars", c, "width", g, "height", d, "align", "middle", "id", f, "quality", "high", "bgcolor", b, "name", f, "allowScriptAccess", "sameDomain", "allowFullScreen", "true", "type", "application/x-shockwave-flash", "pluginspage", "http://www.adobe.com/go/getflashplayer", "wmode", "opaque", "parent", h) : showDownloadLink(h, m))
}

function closeContentPreviewDialog() {
    if (window.dialog && "docViewerOverlay" === window.dialog.id) window.dialog.hide();
    else if (sfdcPage) {
        var a = sfdcPage.getDialogById("docViewerOverlay");
        a && a.hide()
    }
};
Ext.ns("Ninja.Flex");
Ninja.Flex.FlexCoverflow = {
    getApp: function () {
        return getFlexRoot("Coverflow")
    },
    showPreview: function (c) {
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
            null === Ext.get(b) ? (a = new AccessiblePreviewContentDialog(b), a.extraClass = g, a.content = "\x3cdiv id\x3d'" + e + "' class\x3d'" + h + "'\x3e\x3cdiv id\x3d'" + f + "' class\x3d'" + k + "'\x3e\x3c/div\x3e\x3c/div\x3e", a.created = !0, a.register(), Ext.get(e).setHeight(height), Ext.get(b).setWidth(width), a.show(), Ext.get(b).setStyle("left", "10px")) : (a = OverlayDialogElement.getDialog(b), a.setTitle(""), Ext.get(e).setHeight(height), Ext.get(b).setWidth(width), Ext.getBody().setStyle("overflow",    "auto"), a.show());
            b = chatter && chatter.getToolbox() ? chatter.getToolbox().sitePrefix() : "";
            insertFlexComponent(Ninja.Flex.ContentStaticResourcesBase + "/flex/DocViewer", "shepherd_prefix\x3d" + b + Ninja.Flex.ShepherdController + "\x26v\x3d" + c + "\x26mode\x3dbubble\x26in_tests\x3dfalse", "100%", "100%", "#f3f3f3", f, "renditionLarge", !1, {
                adobeFlashVersionLbl: LC.getLabel("ContentFlashPlayer", "adobeFlashVersion"),
                downloadAdobeLbl: LC.getLabel("ContentFlashPlayer", "downloadAdobe"),
                downloadAdobeLinkLbl: LC.getLabel("ContentFlashPlayer",        "downloadAdobeLink"),
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

function ActionProgressDialog(b, a, d, c) {
this.id = b;
this.url = a;
this.escapeParams = d;
this.parentId = c;
this.isModal = !0;
this.width = 480;
this.progressMsgText = this.progressMsgTitleTooltip = this.progressMsgTitle = "";
this.displayX = !1;
this.addEvents();
this.helpUrl = null
}
ActionProgressDialog.prototype = new OverlayDialog;
ActionProgressDialog.prototype.hide = function () {
OverlayDialog.prototype.hide.apply(this, []);
this.createContent()
};
ActionProgressDialog.prototype.createContent = function () {
var b = document.getElementById(this.getContentId()), a = [];
a.push("\x3cdiv id\x3d'actionProgressPanel' class\x3d'actionProgressPanel'\x3e");
if (this.helpUrl) {
var d = LC.getLabel("ChatterFileMultiUpload", "helpWithUploading"), c = LC.getLabel("ChatterFileMultiUpload", "helpWithUploading") + "\x26nbsp;" + LC.getLabel("Global", "new_window");
a.push('\x3cdiv class\x3d"pageHelpIconPanel"\x3e');
a.push('\x3ca class\x3d"helpLinkElement" id\x3d"uploadHelpLinkElement" href\x3d"' + this.helpUrl + '"\x3e');
a.push('\x3cspan class\x3d"helpLink"\x3e' + d + "\x3c/span\x3e");
a.push('\x3cimg src\x3d"/s.gif" class\x3d"helpIcon" alt\x3d"' + c + '" title\x3d"' + c + '"\x3e');
a.push("\x3c/a\x3e");
a.push("\x3c/div\x3e")
}
a.push("\x3cdiv id\x3d'contentContainer'\x3e");
a.push("\x3cdiv id\x3d'progressIcon'\x3e\x3c/div\x3e");
a.push("\x3cdiv id\x3d'progressMsgContainer'\x3e");
a.push("\x3cp id\x3d'progressMsgTitle' title\x3d\"" + this.progressMsgTitleTooltip + '"\x3e' + this.progressMsgTitle + " ");
a.push("\x3c/p\x3e");
a.push("\x3cp id\x3d'progressMsgText'\x3e" + this.progressMsgText + "\x3c/p\x3e");
a.push("\x3c/div\x3e\x3cdiv class\x3d'clear'\x3e\x3c/div\x3e");
a.push("\x3c/div\x3e\x3c/div\x3e");
this.createButtons(a);
b.innerHTML = a.join("");
this.clearButtons();
this.addButtonBar()
};
ActionProgressDialog.prototype.addButtonBar = function () { };
ActionProgressDialog.prototype.setProgressMsgTitle = function (b, a) {
this.progressMsgTitle = b;
this.progressMsgTitleTooltip = a
};
ActionProgressDialog.prototype.setProgressMsgText = function (b) {
this.progressMsgText = b
};
ActionProgressDialog.prototype.setHelpUrl = function (b) {
this.helpUrl = b
};
PublisherAutoComplete = function () { };
PublisherAutoComplete.prototype.getInputWithEncodedAtMentions = function () {
return ""
};
Sfdc.provide("Sfdc.RechatComposer", {
RechatToFollowersHelper: function () { },
RechatToGroupHelper: function () { },
RechatTargetSelector: function () { }
});
(function () {
Sfdc.provide("SfdcApp.Chatter.FormHandler", {
errorCount: 0,
hideErrors: function (b) {
Sfdc.each(Sfdc.select(".errorMsg", b), function (a) {
    Sfdc.Dom.hideByDisplay(a)
})
},
addErrors: function (b, a) {
chatter.getToolbox();
a && Sfdc.each(Object.keys(a), function (c) {
    var d = Sfdc.get("." + c, b);
    Sfdc.Dom.updateHTML(d, a[c]);
    Sfdc.Dom.show(d)
})
},
disableButtons: function (b) {
Sfdc.each(Sfdc.select("input.btn", b), function (a) {
    chatter.getToolbox().disableButton(a)
})
},
disableSubmit: function (b) {
this.errorCount++;
0 < this.errorCount &&Sfdc.each(Sfdc.select("input.saveBtn", b), function (a) {
    chatter.getToolbox().disableButton(a)
})
},
enableButtons: function (b) {
Sfdc.each(Sfdc.select("input.btn", b), function (a) {
    Sfdc.Dom.hasClass(a, "btnNoEnable") || chatter.getToolbox().enableButton(a)
})
},
enableSubmit: function (b) {
this.errorCount--;
0 >= this.errorCount && (this.errorCount = 0, Sfdc.each(Sfdc.select("input.saveBtn", b), function (a) {
    chatter.getToolbox().enableButton(a)
}))
},
submit: function (b, a, c) {
this.disableButtons(b);
this.hideErrors(b);
var d = sfdcPage.dirtyState !==GenericSfdcPage.STATE_CLEAN,e = this;
chatter.getToolbox().post({
    url: a,
    params: c,
    failure: function (a, f) {
        e.enableButtons(b);
        e.addErrors(b, f.errors);
        c.failure && c.failure(a, f);
        d && sfdcPage.updateDirtyState(GenericSfdcPage.STATE_ERROR)
    },
    success: function (a, b) {
        chatter.getToolbox().navigateTo(b.url)
    }
})
},
getCheckedValue: function (b) {
for (var a = 0; a < b.length; a++)
    if (b[a].checked) return b[a].value
}
})
})();
Sfdc.provide("SfdcApp.Chatter.SubscribeButton", {
onHover: function () { },
onKeyUp: function () { },
onClick: function () {
return !1
}
});

function getOpenDialog() {
for (var a in sfdcPage.dialogs)
if (sfdcPage.dialogs.hasOwnProperty(a)) {
    var b = sfdcPage.dialogs[a];
    if (b.isOpen) return b
}
}

function closeDialog(a) {
var b = getOpenDialog();
b && b.close();
a && (Sfdc.userAgent.isSafari3 ? window.location.href = window.location.href : window.location.reload())
}

function resizeDialog(a, b) {
var d = getOpenDialog();
d && d.resize(a, b)
}

function CollaborationAccessibleDialogHelper() { }
CollaborationAccessibleDialogHelper.addUrlObserver = function (a) {
CollaborationAccessibleDialogHelper.urlObservers.push(a)
};
CollaborationAccessibleDialogHelper.urlObservers = [];
CollaborationAccessibleDialogHelper.transformUrl = function (a) {
for (var b = 0; b < CollaborationAccessibleDialogHelper.urlObservers.length; b++) a = CollaborationAccessibleDialogHelper.urlObservers[b](a);
return a
};

function CollaborationAccessibleDialog(a, b, d, e, c) {
    this.id = a;
    this.contentId = a + "ContentId";
    this.height = e;
    this.url = d;
    "" !== c && void 0 !== c && (this.width = parseInt(c, 10));
    this.register();
    Ext.fly(window).on("focus", function() {
        closeDialog()
    })
}
CollaborationAccessibleDialog.prototype = new SimpleDialog;
CollaborationAccessibleDialog.prototype.display = function() {
    for (var a in sfdcPage.dialogs)
        if (sfdcPage.dialogs.hasOwnProperty(a)) {
            var b = sfdcPage.dialogs[a];
            b.isOpen && b.popupWindow.close()
        }
    this.popupWindow = window.open(CollaborationAccessibleDialogHelper.transformUrl(this.url), this.id, "height\x3d" + this.height + ",width\x3d" + this.width + ",location\x3d0,status\x3d0");
    this.popupWindow.focus();
    this.isOpen = !0
};
CollaborationAccessibleDialog.prototype.resize = function(a, b) {
    this.popupWindow.resizeTo(b, a + 100)
};
CollaborationAccessibleDialog.prototype.close = function() {
    this.popupWindow.close()
};

function NonaccessibleDialog(a, b, d, e, c) {
    this.id = a;
    this.contentId = a + "ContentId";
    this.displayX = this.isMovable = !0;
    this.height = e;
    this.url = d;
    "" !== c && void 0 !== c && (this.width = parseInt(c, 10));
    this.setTitle(b);
    this.register()
}
NonaccessibleDialog.prototype = new SimpleDialog;
NonaccessibleDialog.prototype.display = function() {
    var a = [];
    a.push('\x3ciframe frameborder\x3d"no" id\x3d"' + this.contentId + '" style\x3d"border:0;height:' + this.height + "px;width:" + (Sfdc.userAgent.isIE6 ? "93%" : "100%") + ';" src\x3d"' + CollaborationAccessibleDialogHelper.transformUrl(this.url) + '"\x3e\x3c/iframe\x3e');
    this.setContentInnerHTML(a.join(""));
    this.show();
    this.setWidth(this.width)
};
NonaccessibleDialog.prototype.resize = function(a, b) {
    document.getElementById(this.contentId).style.height = a + "px";
    this.setWidth(b)
};
NonaccessibleDialog.superclass = SimpleDialog.prototype;
NonaccessibleDialog.prototype.hide = function() {
    var a = this.getContentElement().firstChild.contentWindow;
    try {
        a.closePopup && a.closePopup()
    } catch (b) {} finally {
        NonaccessibleDialog.superclass.hide.call(this)
    }
};
NonaccessibleDialog.prototype.close = function() {
    this.hide()
};
var chatter = new function () {
function g() {
function b() {
    function b() {
        document.title = c ? l : g;
        c && h++;
        c = !c;
        h <= d ? a = setTimeout(b, k) : document.title = g
    }
    var c = !0;
    b()
}

function c() {
    clearTimeout(a);
    document.title = l;
    h = 0
}
var a, k, d, h = 0,f = chatter.getEventBus(),l = document.title,g = LC.getLabel("Feeds", "pageTitleFlipMessage");
this.init = function (a, h) {
    f.addEventListener("chatter:feed", "onAfterLiveFeedMessageShown", b);
    f.addEventListener("chatter:feed", "onAfterFeedRefresh", c);
    k = a;
    d = h
}
}

function d() {
function b(a) {
    Ext.get("notFavorited").addClass("hidden");
    var b = Ext.get("alreadyFavorited");
    b.removeClass("hidden");
    b.set({
        feedFavoriteId: a
    });
    a = !!Sfdc.select("#Chatter_Tab:first-child").length;
    HelpBubble.display({
        parentDiv: "Chatter_Tab",
        pointerDirection: a ? HelpBubble.BOTTOMLEFT : HelpBubble.BOTTOM,
        contentText: LC.getLabel("FeedFavorites", "SavedFeedFavoriteBubble"),
        hideCloseX: !0,
        additionalClass: "feedFavoriteHelpBubble",
        fadeInCallBackFn: function () {
            setTimeout("HelpBubble.hideBubble('feedFavoriteHelpBubble');", 3E3)
        }
    })
}
this.remove = function (a) {
    omnitureWrapper.trackEvent(chatter.getOmnitureEventMap().removeFavorite);
    Perf.mark("DeleteFeedFavoriteStart");
    var b = a.name,c = !0;
    a.noalert || (b = LC.getLabel("Feeds", "FeedFavoriteDeleteAlert", b), c = confirm(b));
    c && chatter.getToolbox().post({
        url: "/feed/favorites/" + a.feedFavoriteId + ";delete",
        params: a,
        success: function () {
            var b = Ext.get("feedFavoriteDelete{0}".replace("{0}", a.feedFavoriteId));
            b && (b = Sfdc.Dom.getParent(b.dom, "li"), Sfdc.Dom.hasClass(b, "selected") && chatter.getNavigationGroups().getAssociatedGroup("chatterTabNavigation").mainNavigation.selectDefaultItem(!0), Sfdc.Dom.removeChild(b));
            a.calledByWidget && (Ext.get("alreadyFavorited").addClass("hidden"), Ext.get("notFavorited").removeClass("hidden"));
            Perf.endMark("DeleteFeedFavoriteStart")
        }
    })
};
var c = this.add = function (a) {
    omnitureWrapper.trackEvent(chatter.getOmnitureEventMap().addFavorite);
    chatter.getToolbox().post({
        url: "/feed/favorite/term;create",
        params: a,
        success: function (c, d) {
            a.calledByWidget && b(d.feedFavoriteId)
        }
    })
};
this.addFavoriteFromSearchResult = function (a) {
    c({
        searchText: a,
        calledByWidget: !0,
        type: "S"
    })
};
this.addFavoriteFromListView =function (a, b) {
    c({
        entityId: a,
        calledByWidget: !0,
        name: b,
        type: "L"
    })
};
this.addFavoriteFromTopic = function (a, b) {
    c({
        entityId: a,
        calledByWidget: !0,
        name: b,
        type: "T"
    })
};
this.widgetRemove = function () {
    var b = Ext.get("alreadyFavorited").dom.getAttribute("feedFavoriteId");
    chatter.getFeedFavoriteHelper().remove({
        feedFavoriteId: b,
        noalert: !0,
        calledByWidget: !0
    })
};
this.favoriteDeleteRemoveZenAssist = function (b) {
    b = Sfdc.get(".delete", b);
    chatter.getToolbox().removeZenAssist(b)
};
this.favoriteDeleteAddZenAssist = function (b) {
    b = Sfdc.get(".delete", b);
    chatter.getToolbox().addZenAssist(b)
}
}

function r() {
var b = 0, c, a, k = !1, d = "idle", h = chatter.getEventBus();
h.addEventListener("chatter:feed", "onAfterShowMoreFeedItems", function () {
    d = "idle"
});
h.addEventListener("chatter:feed", "onAfterFeedRefresh", function () {
    b = 0;
    d = "idle";
    k = !1
});
this.init = function (f) {
    c = f.max || 3;
    a = f.factor || 0.75;
    Ext.EventManager.on(window, "scroll", function () {
        if (chatter.isFeedVisible()) {
            var f = (Ext.get("contentWrapper") || Ext.get("bodyInner") || Ext.getBody()).getHeight();
            if (Ext.get(document).getScroll().top +(Ext.isIE ? document.documentElement.clientHeight : window.innerHeight) > f * a && (!(b >= c) && !k) && "processing" != d) d = "processing", f = Ext.select("div.showmorefeeditemscontainer a").elements, 1 == f.length ? (f[0].onclick(), b += 1) : (k = !0, d = "idle")
        }
    })
};
this.getMax = function () {
    return c
};
this.resetShownCount = function () {
    b = 0
};
this.isReachedMaxExecutions = function () {
    return b >= c
}
}

function s() {
this.onMouseOver = function (b) {
    b = Ext.get(b);
    b.hasClass("newFeedItemsMessageHover") || b.addClass("newFeedItemsMessageHover")
};
this.onMouseOut = function (b) {
    b = Ext.get(b);
    b.hasClass("newFeedItemsMessageHover") && b.removeClass("newFeedItemsMessageHover")
}
}

function m() {
StringBuffer = function () {
    this.buffer = [];
    this.append = function (b) {
        this.buffer.push(b);
        return this
    };
    this.toString = function () {
        return this.buffer.join("")
    }
};
return new StringBuffer
}

function p() {
function b(e) {
    chatter.isInvalidSession(e.responseText) && (f.log("Handling redirect"), chatter.getToolbox().refresh())
}

function c(e) {
    var a = e.params || {}, c = e.dieSilently || !1, k = u.sitePrefix() + f.apiurl() + (e.url || "");
    f.log("XHR request " + e.method + " " + k + (a.q ? a.q : ""));
    Ext.each(chatter.getConfig().getUrlObservers(), function (e) {
        k = e(k);
        return !0
    });
    f.log("Rewritten URL: " + k);
    var d = f.now(),l;
    m && (l = ["XHR ", e.method, ": ", a.q ? k + "?q\x3d" + a.q : k].join(""), Perf.mark(l));
    y && (a.trace = "sqltrace");
    a = {
        url: k,
        params: a,
        method: e.method,
        headers: e.headers,
        timeout: e.timeout || 6E4,
        failure: function (a) {
            var q = f.now();
            f.log("Request completed in " + (q - d) + "ms");
            if (c) f.log("Request to " + k + " failed.");
            else {
                var h;
                try {
                    h = f.evalJson(a.responseText)
                } catch (l) {
                    f.log("Oops, an error occurred parsing JSON: " + l + " from text" + a.responseText), h = {}, b(a)
                }
                window.checkSessionTimeout && checkSessionTimeout();
                f.xhrFailure(a, h);
                if (e.failure) try {
                    e.failure(a, h)
                } catch (g) {
                    f.log("Failure handler caught an exception: " + g)
                }
                h.redirecturl && f.navigateTo(h.redirecturl)
            }
        },
        success: function (a) {
            var c = f.now();
            f.log("Request completed in " + (c - d) + "ms");
            var h;
            try {
                h = f.evalJson(a.responseText)
            } catch (q) {
                f.log("Oops, an error occurred parsing JSON: " + q + " from text" + a.responseText), h = {}, b(a)
            }
            window.checkSessionTimeout && !h.skipTimeoutRefresh && checkSessionTimeout();
            if (e.success) try {
                e.success(a, h), f.log("Success handler completed in " + (f.now() - c) + "ms")
            } catch (k) {
                f.log("Success handler caught an exception: " + k), e.failure && e.failure(a, {}), f.log("Success handler completed with failure in " + (f.now() - c) + "ms")
            }
            m && Perf.endMark(l)
        }
    };
    e.form && (a.form = e.form);
    Ext.Ajax.defaultHeaders = {
        Authorization: f.token()
    };
    var g = e.abortTargets;
    if (g && Sfdc.isArray(g))
        for (var t = 0; t < g.length; t++) Ext.Ajax.abort(h[g[t]]);
    e.ajaxInstanceKey ? h[e.ajaxInstanceKey] = Ext.Ajax.request(a) : Ext.Ajax.request(a)
}

function a(e, a) {
    for (var b = /(?:<script([^>]*)?>)((\n|\r|.)*?)(?:<\/script>)/ig, c = /\ssrc=([\'\"])(.*?)\1/i, f, h, k = [], d = [], l = function () {
        for (; k.length; ) window.execScript ? window.execScript(k.shift()) : window.eval(k.shift());
        Sfdc.isFunction(a) && a()
    }; f = b.exec(e); ) (h = (h = f[1]) ? h.match(c) : !1) && h[2] ? d.push(h[2]) : f[2] && 0 < f[2].length && k.push(f[2]);
    d.length ? Sfdc.Resource.addJavaScripts(d, l) : l()
}

function k(e, b, c) {
    Ext.lib.Event.onAvailable(c, function () {
        a(e, b)
    })
}

function d(e) {
    return Array(e.length - 1).join("\x26nbsp;") + " "
}
var h = {},
f = this,
l = null,
g = "",
m = window.Perf && Perf.enabled,
y = !1,
n;
this.enableSqlTrace = function () {
    y = !0
};
this.disableSqlTrace = function () {
    y = !1
};
this.handleRedirect = function (e) {
    b(e)
};
this.log = function (e) {
    "undefined" != typeof console && "undefined" != typeof console.info && console.info(e)
};
this.now = function () {
    return (new Date).getTime()
};
this.disableButton = function (e) {
    e = f.returnHtmlElementIfExtElement(e, "disableButton");
    Sfdc.Dom.addClass(e, ["btnDisabled", ZenCss.disabledBtn]);
    f.disable(e)
};
this.enableButton = function (e) {
    e = f.returnHtmlElementIfExtElement(e, "enableButton");
    Sfdc.Dom.removeClass(e, ["btnDisabled", ZenCss.disabledBtn]);
    f.enable(e)
};
this.addZenAssist = function (e) {
    e && Sfdc.Dom.addClass(e, "zen-assistiveText")
};
this.removeZenAssist = function (e) {
    e && Sfdc.Dom.removeClass(e, "zen-assistiveText")
};
this.removeClassOnMouseOut = function (e, a, b) {
    Sfdc.Event.mouseExited(e, a) && Sfdc.Dom.removeClass(a, b)
};
this.expandableTextArea = function (e, a, b) {
    Sfdc.on(e, "keyup", this.updateHeight.bind(this, e, a, a *                b))
};
this.updateHeight = function (e, a, b) {
    Sfdc.isDefAndNotNull(n) || (n = Sfdc.Dom.create(document.body), Sfdc.Dom.addClass(n, "shadowDiv"));
    a = n;
    var c = Sfdc.Dom.getStyles(e, "paddingTop paddingBottom paddingLeft paddingRight lineHeight fontSize fontStyle fontWeight fontFamily wordWrap".split(" ")),
f = parseInt(c.paddingLeft) || 0,
h = parseInt(c.paddingRight) || 0;
    c.width = Sfdc.Dom.getWidth(e) - (f + h) + "px";
    Sfdc.Dom.setStyles(a, c);
    c = e.value;
    Sfdc.Dom.updateHTML(a, c.replace(/<|>|&/g, "\x26lt;").replace(/\n$/, "\x3cbr/\x3e\x26nbsp;").replace(/\n/g,"\x3cbr/\x3e\x26nbsp;").replace(/ {2,}/g, d));
    a.value = c;
    a = Sfdc.Dom.getActualHeight(a);
    a < b && (a = b);
    if (a !== parseInt(e.style.height || 0)) e.style.height = a + "px"
};
this.initializeIE8JPNTypingFix = function (e) {
    if (Sfdc.userAgent.isIE8 && "ENTITY" === chatter.getFeed().getConfig().feedType) {
        var a = Sfdc.get("bodyTable");
        a && (Sfdc.Event.add(e, "focus", function () {
            a.width = a.offsetWidth + "px";
            Sfdc.Dom.addClass(a, "recordTableBodyIE8Fix")
        }), Sfdc.Event.add(e, "blur", function () {
            a.width = "100%";
            Sfdc.Dom.removeClass(a, "recordTableBodyIE8Fix")
        }))
    }
};
this.disable = function () {
    Sfdc.Array.forEach(Sfdc.Array.toArray(arguments), function (e) {
        f.returnHtmlElementIfExtElement(e, "disable").disabled = !0
    })
};
this.enable = function () {
    Sfdc.Array.forEach(Sfdc.Array.toArray(arguments), function (e) {
        f.returnHtmlElementIfExtElement(e, "enable").disabled = !1
    })
};
this.poll = function (e) {
    e = new z(e);
    e.start();
    return e
};
this.xhrFailure = function (e, a) {
    var b;
    b = "XHR Failure." + (a && a.errorid ? " Error ID: " + a.errorid + ". " : "");
    b += "\nResponse text:\n" + e.responseText;
    f.log(b);
    a && a.errormessage &&                alert(a.errormessage)
};
this.stopPropagation = function (e) {
    e = e || event;
    e.stopPropagation ? e.stopPropagation() : e.cancelBubble = !0
};
this.stringIsEmpty = function (e) {
    return 0 == e.replace(/\s+$/g, "").length
};
this.stringTrim = function (e) {
    return e.replace(/^\s+|\s+$/g, "")
};
this.setToken = function (e) {
    l = e
};
this.token = function () {
    return l
};
this.apiurl = function () {
    return "/chatter/handlers"
};
this.setImageSrc = function (e, a) {
    var b = Sfdc.Dom.get(e, "src");
    return !b || a !== Sfdc.Url.stripDomainFromUrl(b) ? (Sfdc.Dom.set(e, {
        src: a
    }), !0) :                !1
};
this.setSitePrefix = function (e) {
    g = e
};
this.sitePrefix = function () {
    return "" !== g ? g : UserContext.siteUrlPrefix ? UserContext.siteUrlPrefix : ""
};
this.evalJson = function (e) {
    return Util.evalAjaxServletOutput(e) || {}
};
this.get = function (e) {
    e.method = "GET";
    c(e)
};
this.post = function (e) {
    e.method = "POST";
    c(e)
};
this.navigateTo = function (e, a) {
    navigateToUrl(e, "CHATTER", a)
};
this.refresh = function () {
    f.navigateTo(window.location)
};
this.showMoreDescription = function (a) {
    a = Ext.get(a).parent(".chatterDescription");
    a.child(".truncatedDescription").remove();
    a.child(".fullDescription").enableDisplayMode().show()
};
this.htmlEncode = function (a) {
    return !a ? a : String(a).replace(/&/g, "\x26amp;").replace(/>/g, "\x26gt;").replace(/</g, "\x26lt;").replace(/"/g, "\x26quot;").replace(/'/g, "\x26#39;")
};
this.htmlDecode = function (a) {
    return !a ? a : String(a).replace(/&gt;/g, "\x3e").replace(/&lt;/g, "\x3c").replace(/&quot;/g, '"').replace(/&#39;/g, "'").replace(/&amp;/g, "\x26")
};
this.getEmptyPublisherHTML = function () {
    return emptyPublisherHTML
};
this.hide = function (a) {
    if (!Ext.isEmpty(a)) return a.setVisibilityMode(Ext.Element.DISPLAY).hide()
};
this.show = function (a) {
    if (!Ext.isEmpty(a)) return a.setVisibilityMode(Ext.Element.DISPLAY).show()
};
this.runScriptReturnHtml = function (a, b, c) {
    a = a || "";
    var f = Ext.id();
    a += '\x3cspan id\x3d"' + f + '"\x3e\x3c/span\x3e';
    k(a, function () {
        var a = Sfdc.get(f);
        a && Sfdc.Dom.removeChild(a);
        Sfdc.isFunction(b) && b()
    }, f);
    !0 !== c && (a = a.replace(/(?:<script.*?>)((\n|\r|.)*?)(?:<\/script>)/ig, ""));
    return a
};
this.updateHTMLFromConfig = function (a) {
    var b = a.el,                c = a.callback;
    if (!b) return b;
    b.dom && (b = b.dom);
    var f = a.html || "";
    if (!0 !== a.loadScripts) return b.innerHTML =                f, Ext.isFunction(c) && c(), b;
    b.innerHTML = this.runScriptReturnHtml(f, c, a.leaveScripts);
    return b
};
this.updateHTML = function (a, b, c, f) {
    this.updateHTMLFromConfig({
        el: a,
        html: b,
        loadScripts: c,
        callback: f
    })
};
this.fixIE7Haslayout = function (a) {
    Sfdc.userAgent.isIE7 && setTimeout(function () {
        a.style.display = "block"
    }, 0)
};
this.mask = function (a, b, c) {
    var f = Ext.Element.data,                h = a.dom,                k = Ext.DomHelper,                d;
    !/^body/i.test(h.tagName) && "static" == a.getStyle("position") && a.addClass("toolkit-masked-relative");
    (d = f(h, "maskMsg")) && d.remove();
    (d = f(h, "mask")) && d.remove();
    d = k.append(h, {
        cls: "toolkit-el-mask",
        onclick: "chatter.getToolbox().stopPropagation(event); return false;"
    }, !0);
    f(h, "mask", d);
    a.addClass("toolkit-masked");
    d.setDisplayed(!0);
    "string" == typeof b && (k = k.append(h, {
        cls: "toolkit-el-mask-msg",
        cn: {
            tag: "div"
        }
    }, !0), f(h, "maskMsg", k), k.dom.className = c ? "toolkit-el-mask-msg " + c : "toolkit-el-mask-msg", k.dom.firstChild.innerHTML = b, k.setDisplayed(!0), k.center(a));
    Ext.isIE && ((!Ext.isIE7 || !Ext.isStrict) && "auto" == a.getStyle("height")) && this.setSize(d,                void 0, a.getHeight());
    return d
};
this.unmask = function (a) {
    var b = Ext.Element.data,c = a.dom,f = b(c, "mask"),h = b(c, "maskMsg");
    f && (h && (h.remove(), b(c, "maskMsg", void 0)), f.remove(), b(c, "mask", void 0), a.removeClass(["toolkit-masked", "toolkit-masked-relative"]))
};
this.setSize = function (a, b, c, f) {
    "object" == typeof b && (c = b.height, b = b.width);
    b = a.adjustWidth(b);
    c = a.adjustHeight(c);
    !f || !a.anim ? (a.dom.style.width = a.addUnits(b), a.dom.style.height = a.addUnits(c)) : a.anim({
        width: {
            to: b
        },
        height: {
            to: c
        }
    }, a.preanim(arguments, 2));
    return a
};
this.isVisible = function (a, b) {
    var c = !a.isStyle("visibility", "hidden") && !a.isStyle("display", "none"),f = a.dom.parentNode,h = chatter.getToolbox();
    if (!0 !== b || !c) return c;
    for (; f && !/body/i.test(f.tagName); ) {
        if (!h.isVisible(Ext.fly(f, "_isVisible"))) return !1;
        f = f.parentNode
    }
    return !0
};
this.getStyles = function (a, b) {
    var c = {};
    Ext.each(b, function (b) {
        c[b] = a.getStyle(b)
    }, a);
    return c
};
this.validateTextFieldLength = function (a, b) {
    var c = Ext.get(a),f = c.getValue().length > b.maxlength,h = c.hasClass("maxlengthfielderror"),k = chatter.getToolbox();
    f != h && (h = c.parent().child(".errorMsg"), null == h && (h = c.parent().child(".zen-errorMessage")), f ? (k.updateHTML(h, b.msg), k.show(h), c.addClass("maxlengthfielderror"), c = a.form, SfdcApp.Chatter.FormHandler.disableSubmit(c)) : (k.hide(h), c.removeClass("maxlengthfielderror"), c = a.form, SfdcApp.Chatter.FormHandler.enableSubmit(c)))
};
this.getPerfEnabled = function () {
    return m
};
this.getElementErrorContainer = function (a) {
    return a.parent("div").child(".errorMsg")
};
this.validateElement = function (a, b,            c) {
    if (b()) return a.addClass("hidden"), !0;
    this.updateHTML(a, c);
    a.removeClass("hidden");
    return !1
};
this.wireFieldChange = function (a, b, c) {
    a.on("keyup", b);
    if (!c) a.on("blur", b);
    a.on("paste", function () {
        b.defer(10)
    });
    a.on("cut", function () {
        b.defer(10)
    })
};
this.dismissMessage = function (a, b, c) {
    Ext.get(a).remove();
    UserContext.userPreferences.setBoolean(b, c)
};
this.returnHtmlElementIfExtElement = function (a, b) {
    return a.dom ? (Sfdc.warn("By 182 the method " + b + " will only accept html dom elements. Please stop passing in Ext Elements."),                a.dom) : a
}
}

function z(b) {
    function c() {
        var b = chatter.getToolbox();
        if (0 == a.intervalCount) {
            if (a.index >= a.intervals.length) {
                a.run = !1;
                b.log("Ending polling sequence: " + a.configName);
                return
            }
            var d = a.intervals[a.index++];
            a.currentInterval = d[0];
            a.intervalCount = d[1]
        }
        a.intervalCount--;
        b.log("Polling timeout: " + a.configName + " \x3c" + a.currentInterval + "\x3e");
        a.pollerId = setTimeout(function () {
            b.log("Polling: " + a.configName);
            a.config.callback() && a.run ? c() : b.log("Ending polling sequence: " + a.configName)
        }, 1E3 * a.currentInterval)
    }
    var a = this;
    this.config = b;
    this.configName = b.name || (new Date).getTime();
    this.index = 0;
    this.run = !0;
    this.intervals = b.intervals || [            [90, -1]        ];
    this.currentInterval = 90;
    this.intervalCount = -1;
    this.pollerId = null;
    this.start = function () {
        if (!a.pollerId) {
            chatter.getToolbox().log("Starting to poll: " + a.configName);
            a.index = 0;
            a.run = !0;
            var b = a.intervals[a.index++];
            a.currentInterval = b[0];
            a.intervalCount = b[1];
            c()
        }
    };
    this.stop = function () {
        a.pollerId && (chatter.getToolbox().log("Stopping polling of: " + a.configName), clearTimeout(a.pollerId),                a.pollerId = null)
    }
}

function A() {
    var b = function (b) {
        b = Ext.get(b).parent(".cxchattertextareacontainer");
        return {
            parent: b,
            messageContainer: b.child(".cxchattermessagecontainer")
        }
    };
    this.enableSubmitButtonIfNoErrorsInternal = function (b, a) {
        var k = Sfdc.Dom.getParent(b, ".feeditemcommentnew");
        0 === Sfdc.select(".cxchattertextareaerror", k).length && u.enableButton(a)
    };
    this.isMessageDisplayed = function (b, a) {
        return !!Ext.get(b + "_" + a)
    };
    this.showMessage = function (c) {
        var a = c.el,k = chatter.getToolbox(),d = b(a),a = a + "_" + c.msg_id,h = document.getElementById(a);
        h || (h = document.createElement("div"), h.id = a, 1 == c.type ? (h.className = "cxchattertextareaerror chattertextareaerror", d.parent.addClass("chattertextareahaserror")) : h.className = "chattertextareanotice", c.append || (d.messageContainer.dom.innerHTML = ""), h.innerHTML = c.msg_html, d.messageContainer.appendChild(h));
        k.show(d.messageContainer);
        return h.id
    };
    this.hideMessage = function (c) {
        var a = c.el,                k = b(a),                d = !0,                h = c.hideAll || !1;
        if ((c = document.getElementById(a + "_" + c.msg_id)) || h) return a = chatter.getToolbox(),                h ? (Sfdc.Dom.setText(k.messageContainer.dom, ""), a.hide(k.messageContainer), d = !1) : (Ext.fly(c).remove(), 0 === k.messageContainer.query(".cxchattertextareaerror").length && (d = !1, 0 === k.messageContainer.query("div").length && a.hide(k.messageContainer))), d || k.parent.removeClass("chattertextareahaserror"), d
    }
}

function N() {
    this.NODE_TYPES = {
        ELEMENT: 1,
        ATTRIBUTE: 2,
        TEXT: 3,
        CDATA_SECTION: 4,
        ENTITY_REFERENCE: 5,
        ENTITY: 6,
        PROCESSING_INSTRUCTION: 7,
        COMMENT: 8,
        DOCUMENT: 9,
        DOCUMENT_TYPE: 10,
        DOCUMENT_FRAGMENT: 11,
        NOTATION_NODE: 12
    };
    this.insertBreak = function () {
        if (document.selection) {
            var b = document.selection.createRange();
            b.pasteHTML("\x3cbr/\x3e");
            b.moveEnd("character", 1);
            b.collapse();
            b.select()
        }
    };
    this.isText = function (b) {
        return b.nodeType === this.NODE_TYPES.TEXT
    };
    this.isBreak = function (b) {
        var c, a;
        try {
            if (c = (new String(b.nodeName)).toUpperCase(), a = b.nodeType, "BR" == c || "BR" == a) return !0
        } catch (k) { }
        return !1
    };
    this.getContentValue = function (b) {
        for (var c = "", a = this.NODE_TYPES, k = a.TEXT, d = a.CDATA_SECTION, a = a.COMMENT, h = 0, f = b.length; h < f; h++) {
            var l =                    b[h];
            l.nodeType === k || l.nodeType === d ? c += l.nodeValue : this.isBreak(l) ? c += "\n" : this.isMention(l) ? c += "{@" + l.name + "}" : l.nodeType !== a && (c += this.getContentValue(l.childNodes))
        }
        return c
    };
    this.toArray = function (b) {
        for (var c = [], a = 0, k = b.length; a < k; a++) c[a] = b[a];
        return c
    };
    this.getText = function (b) {
        for (var c = "", a = this.NODE_TYPES, k = a.TEXT, d = a.CDATA_SECTION, a = a.COMMENT, h = 0, f = b.length; h < f; h++) {
            var l = b[h];
            l.nodeType === k || l.nodeType === d ? c += l.nodeValue : l.nodeType !== a && (c += this.getText(l.childNodes))
        }
        return c
    };
    this.getCaretLocation =            function (b) {
        if ("number" === typeof b.selectionStart) return b.selectionStart;
        if (document.selection) {
            b.focus();
            var c = document.selection.createRange();
            if (null == c) return 0;
            var a = b.value.replace(/(\r\n)+$/, ""),
                k = c.duplicate();
            k.moveToElementText(b);
            k.setEndPoint("StartToStart", c);
            return a.length - k.text.length
        }
        return 0
    };
    this.setCaretLocation = function (b, c) {
        if (document.selection) {
            var a = b.createTextRange();
            a.collapse(!0);
            a.moveEnd("character", c);
            a.moveStart("character", c);
            a.select()
        } else if (b.selectionStart || "0" == b.selectionStart) b.selectionStart = c, b.selectionEnd = c, b.focus()
    };
    this.getValue = function (b) {
        return b.value
    }
}

function O() {
var b = new Sfdc.Event.EventManager;
b.onError = function (b) {
    Sfdc.sendGack("CHATTEREVENTBUS", b)
};
this.addEventListener = function (c, a, k, d) {
    b.add(this, c + ":" + a, k, d || this)
};
this.fireEvent = function (c, a, k) {
    var d = chatter.getToolbox().now();
    b.fireEvent(this, c + ":" + a, {
        data: k
    });
    var h = chatter.getToolbox().now(),                f = m();
    f.append("CEB EVENT! ns\x3c");
    f.append(c);
    f.append("\x3e en\x3c");
    f.append(a);
    f.append("\x3e pld\x3c");
    f.append(k);
    f.append("\x3e exec-time\x3c");
    f.append(h - d);
    f.append("\x3e");
    chatter.getToolbox().log(f.toString())
};
this.removeEventListener = function (c, a, k) {
    b.remove(this, c + ":" + a, k)
}
}

function w(b) {
    var c = this;
    this.config = b;
    this.id = b.id;
    this.title = b.title || "";
    this.url = b.url;
    this.content = "";
    this.height = b.height || 400;
    this.width = b.width || 500;
    this.extraClass = b.extraClass;
    this.isAbsolutePositioned = this.isDialogPositionAbsolute = b.isDialogPositionAbsolute;
    Sfdc.userAgent.isIE6 || (this.useCSS = !0);
    this.closeDialog = function () {
        return (UserContext.isAccessibleMode ? window.opener ? window.opener : window.parent : window).sfdcPage.getDialogById(c.id).cancel()
    };
    this.open = function () {
        var a = {
            i: c.subjectId
        };
        if (this.config.params)
            for (var b in this.config.params) a[b] = this.config.params[b];
        var d = chatter.getToolbox();
        chatter.getToolbox().get({
            url: c.url,
            params: a,
            success: function (a, b) {
                chatter.getEventBus().fireEvent("chatter:modalOverlay", "onBeforeOverlayShown", {});
                c.content = UserContext.isAccessibleMode ? b.html :                        d.runScriptReturnHtml(b.html);
                c.display()
            },
            failure: function (a, b) {
                b && !b.errormessage && alert(LC.getLabel("Feeds", "GenericFailureNoGack"))
            }
        });
        if (this.config.onOpen) this.config.onOpen(c.id)
    }
}

function P() {
    this.toggle = function (b, c) {
        var a = Ext.get(b),                k = chatter.getToolbox();
        if (a) {
            var d = a.dom.getAttribute("entityid");
            if (d) {
                k.mask(a);
                var h = !0;
                a.hasClass("unfollow") && (h = !1);
                var f = this;
                k.post({
                    url: "/subscriptions/" + d + (h ? ";new" : ";delete"),
                    params: {
                        entityid: d
                    },
                    failure: function () {
                        k.unmask(a)
                    },
                    success: function (b, d) {
                        a &&                                (k.unmask(a), f.updateFollowActionLink(h, a.dom), c && Ext.isFunction(c) && c(b, d));
                        return !1
                    }
                })
            }
        }
    };
    this.updateFollowActionLink = function (b, c) {
        var a = Ext.get(c);
        a.setVisible(!1);
        b ? a.addClass("unfollow") : a.removeClass("unfollow");
        var d = a.dom.getAttribute("title"),                g = a.dom.getAttribute("revtitle");
        d && g && a.set({
            title: g,
            revtitle: d
        });
        a.setVisible(!0)
    }
}

function Q() {
    this.wire = function (b) {
        var c = function (a, c) {
            if (c.followersHtml && c.entityId == b) {
                var d = Ext.select("." + b).filter(".followers");
                d && d.hasClass("followers") &&
    d.replaceWith({
        html: c.followersHtml
    })
            }
        };
        chatter.getEventBus().addEventListener("chatter:FollowUnfollow", "onAfterFollow", c);
        chatter.getEventBus().addEventListener("chatter:FollowUnfollow", "onAfterUnfollow", c)
    }
}

function R() {
    this.deleteProfilePhoto = function (b) {
        if (!confirm(LC.getLabel("UserProfilePage", "ConfirmPhotoDelete"))) return !1;
        var c = chatter.getToolbox();
        c.log("delete photo for subject id: " + b);
        c.post({
            url: "/profilephoto/" + b + ";delete",
            success: function () {
                window.location.reload()
            },
            failure: function (a,                    b) {
                b.reloadOnFail && window.loation.reload()
            }
        });
        return !0
    }
}

function S(b, c, a) {
    var d = this;
    this.pollForPhotoTimeout = function () {
        clearTimeout(d.timeoutId);
        chatter.getToolbox().navigateTo(a)
    };
    this.pollForPhoto = function () {
        var h = chatter.getToolbox(),                f = h.now() - g;
        Ext.Ajax.request({
            url: h.sitePrefix() + h.apiurl() + "/pollphotoresize/" + b,
            method: "GET",
            params: {
                timeElapsed: f,
                token: h.token()
            },
            success: function (b) {
                200 == b.status ? (clearTimeout(d.timeoutId), window.opener ? (window.opener.closeDialog(!1), window.opener.location = c) : (window.parent.closeDialog(!1), window.parent.location = c)) : 202 == b.status ? setTimeout("chatter.getPhotoPoller().pollForPhoto()", 1E3) : (clearTimeout(d.timeoutId), window.location = a)
            },
            failure: function () {
                clearTimeout(d.timeoutId);
                window.location = a
            }
        })
    };
    var g = u.now();
    setTimeout("chatter.getPhotoPoller().pollForPhoto()", 1E3);
    d.timeoutId = setTimeout("chatter.getPhotoPoller().pollForPhotoTimeout()", 6E4)
}

function T() {
    function b() {
        if (Ext.fly("chatterFile" + d)) {
            var a = Ext.fly("chatterFile" + d).dom.value;
            return a &&                    "" != a
        }
        return !0
    }
    var c = chatter.getToolbox(),a = !1,d = "",
    g = new function () {
        this.decode = function (a) {
        var b = [],
            c, d, k = "",
            g, n = "",
            e = 0;
        a = a.replace(/[^A-Za-z0-9\+\/\=]/g, "");
        do c = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(e++)), d = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(e++)), g = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(e++)), n = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(e++)),
            c = c << 2 | d >> 4, d = (d & 15) << 4 | g >> 2, k = (g & 3) << 6 | n, b.push(String.fromCharCode(c)), 64 != g && b.push(String.fromCharCode(d)), 64 != n && b.push(String.fromCharCode(k)); while (e < a.length);
        a = b.join("");
        b = "";
        for (n = g = 0; g < a.length; ) n = a.charCodeAt(g++), 128 > n ? b += String.fromCharCode(n) : 191 < n && 224 > n ? (e = a.charCodeAt(g++), b += String.fromCharCode((n & 31) << 6 | e & 63)) : (e = a.charCodeAt(g++), c = a.charCodeAt(g++), b += String.fromCharCode((n & 15) << 12 | (e & 63) << 6 | c & 63));
        return b
    }
};
    this.setDialogAppendix = function (a) {
        d = a
    };
    this.resetDialogAppendix =            function () {
     d = ""
    };
    this.createFromContentHubDocument = function (a, b, c) {
        var d = a.indexOf(":"),                k = a.substring(0, d),                g = a.substring(d + 1);
        a = chatter.getToolbox().sitePrefix() + chatter.getToolbox().apiurl() + "/chatterfile/";
        d = b.lastIndexOf(".");
        b = {
            fileName: -1 != d ? b.substring(0, d) : b,
            desc: "",
            fileFullName: b,
            chubRepositoryId: k,
            chubDocumentId: g,
            chubCreateAsExternalFile: c,
            shareOption_upload: "lst"
        };
        this.createUploadFormIfMissing();
        c = {
            failureHandler: Sfdc.AccessibleUploadFileDialog.getFailureAndErrorHandler(),
            errorHandler: Sfdc.AccessibleUploadFileDialog.getFailureAndErrorHandler(),
            successHandler: Sfdc.AccessibleUploadFileDialog.getSuccessHandler()
        };
        this.upload(a, b, c)
    };
    this.createUploadFormIfMissing = function () {
        var a = "chatterFileForm" + d;
        Ext.getDom(a) || Ext.DomHelper.append(Ext.getBody(), "\x3cform style\x3d'display:none' id\x3d'" + a + "'\x3e\x3cinput type\x3d'file' name\x3d'file'/\x3e\x3c/form\x3e", !1)
    };
    this.upload = function (a, b, g, m) {
        b = b || {};
        window.checkSessionTimeout && checkSessionTimeout();
        var r = this,
            y = b.fileName || Ext.get("fileName" + d).getValue(),
            n = b.desc || "" == b.desc || Ext.get("desc" +d).getValue(),
            e = b.fileFullName || Ext.get("chatterFile" + d).getValue(),
            q = e.lastIndexOf("."),
            p = ""; -1 < q && (p = e.substring(q));
        var t;
        t = b.chubRepositoryId ? ExternalFileProgressDialog.showOnPostFile("extFileProgress", b.chubCreateAsExternalFile) : FeedPostContentUploadDialog.getDialog("uploadProgressDialog", chatter.getToolbox().htmlEncode(y), p, m);
        t.show();
        b.token = c.token();
        b.fileName = y;
        b.desc = n;
        var v = !0,                s = (m = Ext.getDom("shareOptionPRIVATE")) ? m.checked : !1;
        Ext.Ajax.request({
            url: a,
            params: b,
            isUpload: !0,
            form: "chatterFileForm" +                    d,
            method: "POST",
            failure: function () {
                v = !1;
                t.hide()
            },
            success: function (a) {
                if (a.responseText) {
                    v = !1;
                    t.hide();
                    var b = a.responseText.replace(/\r/g, "\n");
                    0 == b.indexOf("\x3cpre") && (b = b.replace(/^<pre[^>]*>/, "").replace(/<\/pre>$/, ""));
                    b.substring(0, AjaxServlet.CSRF_PROTECT.length) !== AjaxServlet.CSRF_PROTECT && 0 <= b.indexOf("/img/s.gif") || (!a.responseXML || chatter.isInvalidSession(a.responseXML.location + "") ? chatter.getToolbox().refresh() : (b = c.evalJson(b), b.html = b.html && r.getBase64Decoder().decode(b.html), "Failure" === b.message ? g && g.failureHandler && g.failureHandler.call(this, a, b) : "Error" === b.message ? (b.errormessage = b.errormessage && r.getBase64Decoder().decode(b.errormessage), g && g.errorHandler ? g.errorHandler.call(this, a, b) : c.xhrFailure(a, b)) : b.errormessage ? g && g.errorHandler ? g.errorHandler.call(this, a, b) : c.xhrFailure(a, b) : g && g.successHandler && g.successHandler.call(this, a, b, s)))
                }
            }
        });
        (function () {
            v && Ext.Ajax.request({
                url: a,
                method: "POST",
                failure: function (a, b) {
                    v = !1
                },
                success: function (a, b) {
                    c.handleRedirect(a)
                }
            })
        }).defer(1E4)
    };
    this.initValidation = function (c, f, g, m) {
        var r = !f,
            p = f || Ext.get("fileName" + d),
            n = g || Ext.get("desc" + d),
            e = m || Ext.get("reason" + d),
            q = chatter.getToolbox(),
            t = q.getElementErrorContainer(n),
            s = q.getElementErrorContainer(p);
        q.updateHTML(t, "");
        q.updateHTML(s, "");
        var v;
        e && (v = q.getElementErrorContainer(e), q.updateHTML(v, ""));
        var u = LC.getLabel("Publisher", "postValueMaxLen", 255),
            w = LC.getLabel("Publisher", "postFileNameRequired"),
            A = LC.getLabel("Publisher", "postContentDescriptionMaxLen", 1E3),
            x = LC.getLabel("ChatterFileSharing",
            "postWhatChangedMaxLen", 1E3),
            z = function () {
            var a = q.stringTrim(p.getValue()).length,
                d = q.stringTrim(n.getValue()).length,
                f = q.validateElement(s, function () {
                    return 0 < a
                }, w) && q.validateElement(s, function () {
                    return 255 >= a
                }, u) && q.validateElement(t, function () {
                    return 1E3 >= d
                }, A);
            if (e) var g = q.stringTrim(e.getValue()).length,
                f = f && q.validateElement(v, function () {
                    return 1E3 >= g
                }, x);
            f = f && b();
            c && c.call(this, f)
    };
    f = function () {
        a = !0;
        return z()
    };
    chatter.getToolbox().wireFieldChange(p, f, !0);
    chatter.getToolbox().wireFieldChange(n,z, !0);
    g = function () {
        (!r || b()) && z()
    };
    p.on("blur", g);
    n.on("blur", g);
    e && chatter.getToolbox().wireFieldChange(e, f);
    p.focus()
};
    this.reset = function (b, c, d) {
        this.initFields(c, d);
        a = c ? !0 : !1;
        this.resetFileSelectPanel(b);
        b = Ext.get("slideDownError_chatterFileStageTwo");
        null !== b && b.setDisplayed(!1);
        b = Ext.get("slideDownError_chatterLinkPost");
        null !== b && b.setDisplayed(!1)
    };
    this.initFields = function (a, b) {
        Ext.fly("chatterFile" + d).dom.value = "";
        Ext.fly("fileName" + d).dom.value = a || "";
        Ext.fly("desc" + d).dom.value = b || "";
        Ext.fly("reason" +                d) && (Ext.fly("reason" + d).dom.value = "");
        Ext.getDom("shareOptionPUBLIC") && (Ext.getDom("shareOptionPUBLIC").checked = !0)
    };
    this.fileInfoUpdate = function () {
        var b = Ext.get("fileName" + d),                f = "" == b.dom.value;
        Ext.fly("hiddenFileName" + d).dom.value = Ext.fly("chatterFile" + d).dom.value;
        if (!a || f) {
            var g = Util.getFileNameFromFileInputUsingJS(Ext.fly("chatterFile" + d).dom),                    g = Util.convertPathToTitle(g);
            b.dom.value = g.name;
            b = c.getElementErrorContainer(b);
            c.updateHTML(b, "");
            f && (a = !1)
        }
    };
    this.resetFileSelectPanel = function (a) {
        var b =                this,
        c = {
        id: "chatterFile" + d,
        name: "chatterFile" + d,
        tag: "input",
        cls: "file",
        type: "file",
        size: 20
        };
        Ext.fly("chatterFile" + d).replaceWith(c);
        c = Ext.fly("chatterFile" + d);
        c.dom.onchange = function () {
            b.fileInfoUpdate();
            a && a.call(this, !0)
        }
    };
    this.getBase64Decoder = function () {
        return g
    }
}
var U = new function () {
    function b() {
        return Ext.get("recentFilesPanel")
    }
    this.refresh = function (c) {
        b().replaceWith({
            html: c
        })
    };
    this.isWidgetPresent = function () {
        return null !== b()
    };
    this.getEntityId = function () {
        return b().child(".entityId").dom.innerHTML
    }
},
u, B, C, D, E, F, G, H, I, J, K, L, M, x = this,
V = {
addFavorite: "add-favorite",
follow: "follow",
filterByTopic: "filter-by-topic",
inviteCoWorkers: "invite-coworkers",
invite: "invite",
inviteSuccess: "invite-success",
joinGroupsSplash: "join-groups-splash",
joinGroup: "join-group",
post: "post",
postFile: "post-file",
postLink: "post-link",
postComment: "post-comment",
postThanks: "post-thanks",
removeFavorite: "remove-favorite",
showListView: "show-list-view",
showDropdownFilter: "show-dropdown-filter",
showMainFilter: "show-main-filter",
unfollow: "unfollow",
unjoinGroup: "unjoin-group"
};
this.extend = function (b, c, a) {
    function d() {
        var a = b.charAt(0);
        return a !== a.toUpperCase() ? (h += "\n name has to start with a capital letter.", !1) : !0
    }
    var g = "ext_" + b,            h = "Error extending " + b,            f;
    x.hasOwnProperty("get" + b) ? (h += "\n'" + g + "' already exists in the chatter object", f = !0) : f = !1;
    !f && d() ? x["get" + b] = function () {
        x[g] || (x[g] = new c(a));
        return x[g]
    } : alert(h)
};
this.getPageTitleController = function () {
    L || (L = new g);
    return L
};
this.getAutoShowOlder = function () {
    K || (K = new r);
    return K
};
this.createModalOverlay =        function (b) {
    return new w(b)
};
this.getFeedFavoriteHelper = function () {
    M || (M = new d);
    return M
};
this.getRecentFiles = function () {
    return U
};
this.isInvalidSession = function (b) {
    return b.match("ec\x3d302")
};
this.getToolbox = function () {
    u || (u = new p);
    return u
};
this.getTextareaMessageUtil = function () {
    C || (C = new A);
    return C
};
this.getTextUtil = function () {
    B || (B = new N);
    return B
};
this.getEventBus = function () {
    D || (D = new O);
    return D
};
this.getModalOverlay = function (b) {
    var c = window[b];
    if ((!c || !c.closeDialog) && window.opener) c = window.opener[b];
    return c
};
this.getFeedUpdatesMessage = function () {
    J || (J = new s);
    return J
};
this.getFollowUnfollowListAction = function () {
    E || (E = new P);
    return E
};
this.getFollowersPanel = function () {
    G || (G = new Q);
    return G
};
this.getProfilePhoto = function () {
    F || (F = new R);
    return F
};
this.getPhotoPoller = function (b, c, a) {
    H || (H = new S(b, c, a));
    return H
};
this.getFileUploader = function () {
    I || (I = new T);
    return I
};
this.isFeedVisible = function () {
    var b = Sfdc.get(".feedcontainer");
    return b ? Sfdc.Dom.isVisible(b, !0) : !1
};
this.notifyFrameActive = function () {
    if (Ext.isGecko) {
        var b =                Ext.get("chatterexpando").dom;
        if ("none" != b.style.display) {
            var c = document.createElement("div");
            b.parentNode.insertBefore(c, b);
            c.appendChild(b);
            c.parentNode.insertBefore(b, c);
            Ext.removeNode(c)
        }
    }
};
this.getOmnitureEventMap = function () {
    return V
};
this.onDeferLoad = function (b) {
    Sfdc.on(this, "chatter:onDeferLoad", b)
};
w.prototype = new AccessibleDialog({});
w.prototype.display = function () {
    UserContext.isAccessibleMode || this.createContent();
    this.show();
    if (this.isDialogPositionAbsolute && !UserContext.isAccessibleMode) {
        (Sfdc.userAgent.isFirefox ?              document.body.style : document.documentElement.style).overflow = Sfdc.userAgent.isIE7 ? "" : "visible";
        var b = Sfdc.Window.getScrollY(),
c = Sfdc.Dom.getHeight(this.dialog),
a = Sfdc.Window.getWindowHeight(),
b = Math.max(a - c, 10) / 2 + b;
        Sfdc.Dom.setStyles(this.dialog, {
            top: b + "px",
            marginTop: "0px"
        })
    }
};
w.prototype.hide = function () {
    AccessibleDialog.prototype.hide.call(this);
    if (this.config.onClose) this.config.onClose(this.id)
};
w.prototype.getContent = function () {
    return this.content
};
w.prototype.writeAccessiblePopupHeaderIncludes =        function (b) {
if (this.config.jsLibs)
for (var c = 0; c < this.config.jsLibs.length; c++) b.write('\x3cscript src\x3d"'), b.write(this.config.jsLibs[c]), b.writeln('" type\x3d"text/javascript"\x3e\x3c/script\x3e')
};
var W = new function () {
    var b = [];
    this.addUrlObserver = function (c) {
        if (!Ext.isFunction(c)) throw Error("A URL observer must be a function and instead is a " + typeof c + ". Wit documentation.");
        b.push(c)
    };
    this.getUrlObservers = function () {
        return b
    }
};
    this.getConfig = function () {
        return W
    }
};
UserPanelAccessibleUrlDialog = function (g, d, r, s, m) {
    var p = this;
    this.id = g;
    this.title = d;
    this.url = r;
    this.subjectId = s;
    this.content = "";
    this.height = m;
    this.width = 0;
    this.open = function () {
        chatter.getToolbox().get({
            url: p.url,
            params: {
                i: p.subjectId,
                dialogId: p.id
            },
            success: function (d, g) {
                p.content = g.html;
                p.display()
            }
        })
    }
};
UserPanelAccessibleUrlDialog.prototype = new AccessibleDialog({});
UserPanelAccessibleUrlDialog.prototype.getContent = function () {
    return this.content
};
UserPanelAccessibleUrlDialog.prototype.display = function () {
    UserContext.isAccessibleMode || this.createContent();
    this.show()
};
GroupListAccessibleUrlDialog = function (g, d, r, s, m) {
    var p = this;
    this.id = g;
    this.title = d;
    this.url = r;
    this.subjectId = s;
    this.content = "";
    this.height = m;
    this.width = 0;
    this.open = function () {
        chatter.getToolbox().get({
            url: p.url,
            success: function (d, g) {
                p.content = g.html;
                p.display()
            }
        })
    }
};
GroupListAccessibleUrlDialog.prototype = new AccessibleDialog({});
GroupListAccessibleUrlDialog.prototype.getContent = function () {
    return this.content
};
GroupListAccessibleUrlDialog.prototype.display = function () {
    UserContext.isAccessibleMode || this.createContent();
    SfdcApp.ChatterGroupMembership.setCurrentUserProfileId(this.subjectId);
    this.show()
};
GroupListAccessibleUrlDialog.prototype.hide = function () {
    AccessibleDialog.prototype.hide.call(this);
    var g = Ext.get("groupListPanel");
    g && chatter.getToolbox().get({
        url: "/user/" + this.subjectId + "/grouplistpanel",
        success: function (d, r) {
            Ext.DomHelper.insertBefore(g, r.html);
            g.remove()
        }
    });
    SfdcApp.ChatterGroupMembership.setCurrentUserProfileId("")
};
Ext.ns("Sfdc.Chatter");
Sfdc.Chatter.TutorialWindow = function (g, d) {
    var r = LC.getLabel("CSNWelcomeMessage", "videoTitle"),        s = d ? d : 635,        m;
    Sfdc.Chatter.TutorialWindow.dialogInstance ? m = Sfdc.Chatter.TutorialWindow.dialogInstance : (m = Sfdc.Chatter.TutorialWindow.dialogInstance = new VideoDialog("Sfdc.Chatter.TutorialWindow", !1), m.displayX = !0, m.setTitle(r), m.setWidth(840), m.register());
    this.show = function () {
        m.setContentInnerHTML(String.format('\x3ciframe width\x3d"{0}" height\x3d"{1}" src\x3d"{2}" frameborder\x3d"no" scrolling\x3d"no"\x3e',            810, s, g));
        m.show()
    };
    this.hide = function () {
        m.hide()
    }
};
Sfdc.Chatter.ChatterDesktopWindow = function (g) {
    var d;
    Sfdc.Chatter.ChatterDesktopWindow.dialogInstance ? d = Sfdc.Chatter.ChatterDesktopWindow.dialogInstance : (d = Sfdc.Chatter.ChatterDesktopWindow.dialogInstance = new SimpleDialog("Sfdc.Chatter.ChatterDesktopWindow", !1), d.displayX = !0, d.setTitle("Chatter Desktop"), d.setWidth(728), d.register());
    this.show = function () {
        d.setContentInnerHTML(String.format('\x3ciframe width\x3d"{0}" height\x3d"{1}" src\x3d"{2}" frameborder\x3d"no"\x3e', 705, 500, g));
        d.show()
    };
    this.hide =        function () {
        d.hide()
    }
};
Sfdc.Chatter.ChatterMobileWindow = function (g) {
    var d;
    Sfdc.Chatter.ChatterMobileWindow.dialogInstance ? d = Sfdc.Chatter.ChatterMobileWindow.dialogInstance : (d = Sfdc.Chatter.ChatterMobileWindow.dialogInstance = new SimpleDialog("Sfdc.Chatter.ChatterMobileWindow", !1), d.displayX = !0, d.setWidth(632), d.register());
    this.show = function () {
        d.setContentInnerHTML(String.format('\x3ciframe id\x3d"getChatterMobileIFrame" width\x3d"{0}" height\x3d"{1}" src\x3d"{2}" frameborder\x3d"0" scrolling\x3d"no"\x3e', 600, 520, g));
        d.show()
    };
    this.hide = function () {
        d.hide()
    }
};
var topicForm = new function () {
    var g = chatter.getToolbox();
    this.onKeyUpNameField = function (d) {
        g.validateTextFieldLength(d, {
            maxlength: 255,
            msg: LC.getLabel("TopicPage", "nameExceedsMaxLength", 255)
        })
    };
    this.onKeyUpDescriptionField = function (d) {
        g.validateTextFieldLength(d, {
            maxlength: 1E3,
            msg: LC.getLabel("TopicPage", "descriptionExceedsMaxLength", 1E3)
        })
    }
},
requestdeclineform = new function () {
    var g = chatter.getToolbox();
    this.onKeyUpResponseMessageField = function (d) {
        g.validateTextFieldLength(d, {
        maxlength: 255,
        msg: LC.getLabel("ChatterGroups",
            "declinedMessageExceedsMaxLengthJs", 255)
        })
    }
};
Ext.ns("Sfdc.Feed.ViewFileConfirmDialog");
Sfdc.Feed.ViewFileConfirmDialog = function (g) {
    this.id = g.id;
    this.docId = g.docId;
    this.fileName = g.fileName;
    this.subjectName = g.subjectName;
    this.windowName = id;
    this.setupDefaultButtons();
    this.addEvents();
    this.buttonContents = this.contents = "";
    this.hasButtonsBar = !0
};
Ext.extend(Sfdc.Feed.ViewFileConfirmDialog, OverlayDialogElement);
Sfdc.Feed.ViewFileConfirmDialog.ID = "viewFileConfirmDialog";
Sfdc.Feed.ViewFileConfirmDialog.showIt = function (g) {
    var d = null;
    document.getElementById(Sfdc.Feed.ViewFileConfirmDialog.ID) ? (d = OverlayDialogElement.getDialog(Sfdc.Feed.ViewFileConfirmDialog.ID), d.fileName = g.fileName, d.subjectName = g.subjectName) : (g.id = Sfdc.Feed.ViewFileConfirmDialog.ID, d = new Sfdc.Feed.ViewFileConfirmDialog(g), d.register());
    d.showDialog(g)
};
Sfdc.Feed.ViewFileConfirmDialog.closeIt = function () {
    OverlayDialogElement.getDialog(Sfdc.Feed.ViewFileConfirmDialog.ID).cancel()
};
Sfdc.Feed.ViewFileConfirmDialog.prototype.showDialog = function (g) {
    this.makeContent(g);
    this.createContent();
    this.setWidth(440);
    this.show()
};
Sfdc.Feed.ViewFileConfirmDialog.prototype.makeContent = function (g) {
    this.setTitle(LC.getLabel("Publisher", "privatelyShareConfirmTitle"));
    var d = [];
    d.push('\x3cdiv class\x3d"confirmationMsgPanel"\x3e');
    var r = LC.getLabel("Publisher", "privatelyShareConfirmMsg", this.fileName, this.subjectName);
    d.push('\x3cimg src\x3d"/s.gif" class\x3d"icon"\x3e\x3cdiv class\x3d"confirmationMsg"\x3e' + r + "\x3c/div\x3e");
    d.push("\x3c/div\x3e");
    this.contents = d.join("");
    d = [];
    d.push('\x3cinput type\x3d"button" value\x3d"');
    d.push(LC.getLabel("Publisher",        "viewFile"));
    d.push('" class\x3d"btn"');
    d.push(' onclick\x3d"Sfdc.Feed.ViewFileConfirmDialog.execute(');
    d.push("{docId: '");
    d.push(g.docId);
    d.push("'}");
    d.push(');"/\x3e');
    d.push('\x3cinput type\x3d"button" value\x3d"');
    d.push(LC.getLabel("Buttons", "close"));
    d.push('" class\x3d"btn" onclick\x3d"Sfdc.Feed.ViewFileConfirmDialog.closeIt();"/\x3e');
    this.buttonContents = d.join("")
};
Sfdc.Feed.ViewFileConfirmDialog.execute = function (g) {
    navigateToUrl("/" + g.docId)
};

function ContentListViewport(u, k, h, v, J, w, m, x, y, z, A, B, C, D) {
function s(b, a, c, d, e, f) {
    b = {
        "ContentListViewport.entityId": b,
        ptype: "ftab"
    };
    if (a = E[a]) b[a] = !0, "ct" === a && (b.contentTypes = y);
    if (l()) {
        b.ptype = "sfs";
        a:
        {
            if ((a = (a = window.opener && window.opener.chatter || parent.chatter || parent.opener && parent.opener.chatter || window.chatter) && a.getPublisher && a.getPublisher() || null) && a.getHandler)
                if ((a = a.getHandler("ContentPost")) && a.getCurrentFeedParentId) {
                    a = a.getCurrentFeedParentId();
                    break a
                }
            a = ""
        }
        b.feedParentId = a
    } !0 == c && (b.isCustom = !0);
    d && (b.customFilterParams = Sfdc.JSON.stringify(d));
    e && (b.fldr = e);
    Sfdc.get("chatterListViewContainer") && (b.ptype = "ctab");
    !0 === f && (b.cc = "true");
    return b
}

function t(b, a, c, d, e) {
    if (b) return b;
    b = null;
    switch (a) {
        case "ContentVersionRecentlyViewedFileSearch":
            e && (b = LC.getLabel("ChatterFileListPage", "findAllFilesWithFileSync"));
            break;
        case "ContentVersionSharedWithMeFileSearch":
            b = e ? LC.getLabel("ChatterFileListPage", "findFilesSharedWithMeWithFileSync") : LC.getLabel("ChatterFileListPage", "findFilesSharedWithMe");
            break;
        case "ContentVersionAllUserFileSearch":
            b = LC.getLabel("ChatterFileListPage", "searchMyFiles");
            break;
        case "ContentVersionFollowedFileSearch":
            b = e ? LC.getLabel("ChatterFileListPage", "findFilesIFollowWithFileSync") : LC.getLabel("ChatterFileListPage", "findFilesIFollow");
            break;
        case "ContentVersionMyGroupsFileSearch":
            b = LC.getLabel("ChatterFileListPage", "findFilesInMyGroups");
            break;
        case "ContentVersionMyWorkspacesFileSearch":
            b = LC.getLabel("ChatterFileListPage", "findAllFilesInMyLibraries");
            break;
        case "ContentVersionPersonalWorkspaceFileSearch":
            b =                    LC.getLabel("ChatterFileListPage", "searchPersonalWorkspace");
            break;
        case "ContentVersionFileSyncFileSearch":
            b = LC.getLabel("ChatterFileListPage", "searchChatterbox");
            break;
        case "ContentVersionUserFileSearch":
            b = UserContext.userId == c ? e ? LC.getLabel("ChatterFileListPage", "findFilesIOwnWithFileSync") : LC.getLabel("ChatterFileListPage", "findFilesIOwn") : LC.getLabel("ChatterFileListPage", "searchOwnedFiles");
            break;
        case "ContentVersionGroupFileSearch":
        case "ContentVersionWorkspaceFileSearch":
            b = LC.getLabel("ChatterFileListPage",                    "searchInGroupOrWorkspace", d)
    }
    return b || LC.getLabel("ChatterFileListPage", "findAllFiles")
}

function q(b) {
switch (b || "") {
    case "ChatterOrganizationContentSearchFilter":
    case "ChatterWorkspaceFilesSearchFilter":
    case "ChatterGroupFilesSearchFilter":
    case "ChatterUserFilesSearchFilter":
    case "ContentVersionOrganizationFileSearch":
    case "ContentVersionGroupFileSearch":
    case "ContentVersionUserFileSearch":
    case "ContentVersionWorkspaceFileSearch":
    case "ContentVersionPersonalWorkspaceFileSearch":
    case "ContentVersionFileSearch":
    case "ContentVersionSharedWithMeFileSearch":
    case "ContentVersionRecentlyViewedFileSearch":
    case "ContentVersionMyGroupsFileSearch":
    case "ContentVersionMyWorkspacesFileSearch":
    case "ContentVersionAllUserFileSearch":
    case "ContentVersionFollowedFileSearch":
    case "ContentVersionFileSyncFileSearch":
        return !0
}
return !1
}

function l() {
    return !!Sfdc.get("sfsContentWrapper")
}

function F(b, a) {
    if (a.columns)
        for (var c = 0; c < a.columns.length; c++) switch (a.columns[c].sortable = !1, a.columns[c].fieldName) {
            case "actions":
                a.columns[c].className += m ? " limited" : "";
                break;
            case "type":
                a.columns[c].className += q() ? " narrow" : "";
                break;
            case "following":
                switch (UserContext.initialized && UserContext.language || "") {
                    case "de":
                    case "fr":
                    case "it":
                    case "ru":
                        className += " medium";
                        break;
                    case "nl_NL":
                        className += " wide"
                }
        }
    var c = b.target.labels.listView,            d = e.viewType,
g = '\x3ca class\x3d"uploadFileLink" href\x3d"javascript: void(0);" onclick\x3d"{onclick}"\x3e{label}\x3c/a\x3e',
f = Sfdc.String.format(g, {
onclick: "Sfdc.AccessibleUploadFileDialog.open();",
label: LC.getLabel("ChatterFilesTabPage", "uploadingFileLinkText")
}),
g = Sfdc.ChatterFileUploader.isMultiFileUpload ? Sfdc.ChatterFileUploader.isIEMultiFileUpload ? LC.getLabel("ChatterFilesTabPage", "uploadMultiFilesTextForIE") : Sfdc.String.format(g, {
onclick: "document.getElementById(Sfdc.UploadButton.HIDDEN_MULTI_INPUT_ID).click();",
label: LC.getLabel("ChatterFilesTabPage", "uploadMultiFilesLinkText")
}) : Sfdc.String.format(g, {
onclick: "Sfdc.AccessibleUploadFileDialog.open();",
label: LC.getLabel("ChatterFilesTabPage", "uploadFileLinkText")
});
if (e.searchTerm) d = "ContentVersionFileTypeSearch" === d ? LC.getLabel("ChatterNotesList", "noNotesFoundSearch") : LC.getLabel("ChatterFilesTabPage", "noFilesFoundSearch");
else switch (d) {
case "ContentVersionRecentlyViewedFileSearch":
    d = LC.getLabel("ChatterFilesTabPage", "noFilesFoundRecentlyViewed");
    break;
case "ContentVersionSharedWithMeFileSearch":
    d = m ? LC.getLabel("ChatterFilesTabPage", "noFilesFoundSharedWithMeExternal") : LC.getLabel("ChatterFilesTabPage", "noFilesFoundSharedWithMe");
    break;
case "ContentVersionGroupFileSearch":
    d = LC.getLabel("ChatterFilesTabPage", "noFilesFoundGroup");
    break;
case "ContentVersionOrganizationFileSearch":
    d = LC.getLabel("ChatterFilesTabPage", "noFilesFoundAllFiles");
    l() || (d += " " + LC.getLabel("ChatterFilesTabPage", "noFilesFoundUpload", g));
    break;
case "ContentVersionUserFileSearch":
    d =                    LC.getLabel("ChatterFilesTabPage", "noFilesFoundFilesIOwn");
    l() || (d = m ? d + (" " + LC.getLabel("ChatterFilesTabPage", "noFilesFoundUploadExternal", g)) : d + (" " + LC.getLabel("ChatterFilesTabPage", "noFilesFoundUpload", g)));
    break;
case "ContentVersionWorkspaceFileSearch":
case "ContentVersionPersonalWorkspaceFileSearch":
    d = LC.getLabel("ChatterFilesTabPage", "noFilesFoundWorkspace");
    break;
case "ContentVersionFollowedFileSearch":
    d = LC.getLabel("ChatterFilesTabPage", "noFilesFoundFilesIFollow");
    break;
case "ContentVersionMyGroupsFileSearch":
    d =                    LC.getLabel("ChatterFilesTabPage", "noFilesFoundMyGroups");
    break;
case "ContentVersionMyWorkspacesFileSearch":
    d = LC.getLabel("ChatterFilesTabPage", "noFilesFoundMyWorkspaces");
    break;
case "ContentVersionAllUserFileSearch":
    d = m ? LC.getLabel("ChatterFilesTabPage", "noFilesFoundMyFilesExternal") : LC.getLabel("ChatterFilesTabPage", "noFilesFoundMyFiles");
    l() || (d += " " + LC.getLabel("ChatterFilesTabPage", "noFilesFoundGetStarted", f));
    break;
case "ContentVersionFileSyncFileSearch":
    d = LC.getLabel("ChatterFilesTabPage",                    "noFilesFoundFileSync");
    break;
case "ContentVersionFileTypeSearch":
    d = LC.getLabel("ChatterNotesList", "noNotesFound");
    break;
default:
    d = LC.getLabel("ChatterFilesTabPage", "noFilesFound")
}
c.emptyMessage = d
}

function G(b, a) {
    e && a && 1 == a.searchTerm.replace(RegExp(UnifiedSearchUI.RESERVED_CHAR_REGEX, "g"), "").length && (alert(LC.getLabel("ChatterFilesTabPage", "searchTermHasTwoOrMore")), a.cancel = !0)
}

function H(b, a) {
    var c = Sfdc.get(".listBody");
    if (c) {
        var d = Sfdc.get(".sync", c);
        if (d)
            if (!0 === r) {
                if (c = Sfdc.get(".zen-data",
        c)) c.className += " hideSync", 0 === a.items.length && (c = Sfdc.get(".emptyText", c)) && c.setAttribute("colspan", a.columns.length - 1)
            } else d.title = LC.getLabel("FileSyncRemoveLink", "syncColumnHeaderTooltip")
    }
}

function I(b, a, c) {
    b.labels.listView.errorMessage = c && c.data && c.data.displayErrorMessage ? c.data.exDesc : LC.getLabel("List", "error") || "No records to display."
}
Perf.mark("Sfdc.Content:Start");
var f, e, p, r, E = {
    ContentVersionRecentlyViewedFileSearch: "rv",
    ContentVersionPersonalWorkspaceFileSearch: "pw",
    ContentVersionSharedWithMeFileSearch: "sm",
    ContentVersionMyGroupsFileSearch: "ag",
    ContentVersionMyWorkspacesFileSearch: "al",
    ContentVersionAllUserFileSearch: "auf",
    ContentVersionFollowedFileSearch: "ff",
    ContentVersionFileSyncFileSearch: "fs",
    ContentVersionFileTypeSearch: "ct"
};
this.load = function (b, a, c, d, g, h, n, k, l, m) {
    e && (e.viewType = a, e.additionalParams = s(b, a, n, k, void 0, m), e.sortBy = "", e.searchTerm = "", e.currentPage = 1, e.provide());
    if (!1 === g) f.setNavigationVisible(!1);
    else {
        if (p && p.length)
            for (g = 0; g < p.length; g++) n = p[g], n.searchTerm = "", n.setPlaceholder(h ? h : t("", a, b, c, d)), n.setSearchButtonLabel(q(a) ? LC.getLabel("Buttons", "search") : LC.getLabel("Buttons", "go")), n.update();
        f.setNavigationVisible(!0)
    }
    r = l
};
this.isFileSyncFilter = function () {
    return e && !!e.additionalParams.fs
};
this.refresh = function () {
    if (e) {
        var b = e.items.length, a = e.currentPage;
        1 < a && 1 == b && (a -= 1);
        e.currentPage = a;
        e.provide()
    }
};
Sfdc.ns("Chatter.Files.ContentListViewport");
Chatter.Files.ContentListViewport.INSTANCE = this;
Sfdc.onload(function () {
        var b = t(w, k),a = x || "",b = Sfdc.String.format('\x3csfdc:listView class\x3d"FileListView {className}zen-listViewFixed"\x3e\x3cdata:provider type\x3d"ListServlet" pageSize\x3d"{pageSize}" resourceUri\x3d"{resourceUri}" viewType\x3d"{viewType}" additionalParams\x3d"{additionalParams}" autoProvide\x3d"false"\x3e\x3c/data:provider\x3e\x3cfacet:header\x3e\x3c/facet:header\x3e\x3cfacet:navigation\x3e\x3cui:searchbox className\x3d"zen-searchBox" labelText\x3d"" labelClass\x3d"zen-assistiveText" placeholder\x3d"{searchBoxPlaceholder}" title\x3d"{searchBoxTitle}" delay\x3d"1000" searchButtonLabel\x3d"{searchButtonLabel}" searchTerm\x3d"{searchTerm}" searchMode\x3d"explicit" maxLength\x3d"100"\x3e\x3c/ui:searchbox\x3e\x3c/facet:navigation\x3e\x3cfacet:footer\x3e\x3cui:pagerPageInfo\x3e\x3c/ui:pagerPageInfo\x3e\x3cui:pagerNextPrevious\x3e\x3c/ui:pagerNextPrevious\x3e\x3cui:pagerJumpToPage readOnly\x3d"true"\x3e\x3c/ui:pagerJumpToPage\x3e\x3c/facet:footer\x3e\x3c/sfdc:listView\x3e', {
        additionalParams: Sfdc.String.escapeToHtml(Sfdc.JSON.stringify(s(v, k, A, B, C))),
        className: l() ? "SfsListView zen-listViewFixedHeader " : "",
        pageSize: h && h.rowsPerPage || 25,
        resourceUri: UserContext.getUrl("/_ui/core/chatter/content/FileListServlet"),
        viewType: k,
        searchBoxPlaceholder: Sfdc.String.escapeToHtml(b),
        searchBoxTitle: Sfdc.String.escapeToHtml(b),
        searchTerm: a,
        searchButtonLabel: q(k) ? LC.getLabel("Buttons", "search") : LC.getLabel("Buttons", "go")
        }),
        c = Sfdc.get(u + "_listBody");
        Sfdc.Dom.updateHTML(c, b);
        SfdcCmp.init(c);
        f = SfdcCmp.findInstance(c, SfdcCmp.Sfdc.ListView);
        f.attach("onbeforesearch", G);
        f.attach("onbeforeupdate", F);
        f.attach("onupdate", H);
        h && h.displayErrorMessage && (f.labels.listView.errorMessage = h.exDesc);
        e = f.getProvider();
        e.attach("onreceive", I.bind(this, f));
        e.viewType = k;
        e.searchTerm = a;
        e.setPayload(h);
        r = D;
        p = SfdcCmp.findInstances(c, SfdcCmp.Ui.ISearchable, !0);
        !1 === z && f.setNavigationVisible(!1);
        Perf.endMark("Sfdc.Content:Start")
    })
};
DirectMessageDialog = {
    dialogs: {},
    showDialog: function (a, b) {
        window.checkSessionTimeout && checkSessionTimeout();
        DirectMessageDialog.getDialog(a, b).display()
    },
    getDialog: function (a, b) {
        if (DirectMessageDialog.dialogs[a]) return DirectMessageDialog.dialogs[a];
        var c = "conversationComposeDialog" + a, d = null;
        Perf.mark(OverlayDialog.LOAD_MARK);
        d = UserContext.isAccessibleMode ? new CollaborationAccessibleDialog(c, LC.getLabel("DirectMessage", "sendMessageDialogTitle"), b, 249, 530) : new NonaccessibleDialog(c, LC.getLabel("DirectMessage","sendMessageDialogTitle"), b, 249, 530);
        return DirectMessageDialog.dialogs[a] = d
    }
};
var JoinGroupsSplash = new function () {
    this.showGroupsOverlay = function (a) {
        chatter.getToolbox().post({
            url: "/chatterEditionSplash",
            params: {
                nextAction: "groupOverlay",
                lastOverlay: a
            },
            success: function (a, d) {
                "true" == d.isLastOverlay && (document.getElementById("csn_onboarding_splashX").style.display = "inline");
                document.getElementById("csn_onboarding_splashContent").innerHTML = d.html;
                omnitureWrapper.trackEvent(chatter.getOmnitureEventMap().joinGroupsSplash)
            },
            failure: function (a, d) {
                "true" == d.showInviteOverlay ? ViralInviteDialog.showOnboardingInviteUsersOverlay() : sfdcPage.getDialogById("csn_onboarding_splash").cancel()
            }
        })
    };
this.showInviteCoworkersOverlay = function () {
    chatter.getToolbox().get({
        url: "/ui/members/inviteOnboarding?firstPage\x3dfalse",
        params: {},
        success: function (a, c) {
            document.getElementById("csn_onboarding_splashContent").innerHTML = c.html;
            omnitureWrapper.trackEvent(chatter.getOmnitureEventMap().inviteCoWorkers)
        }
    })
};
this.finishForExternalUser = function (a) {
    var c = window.sfdcPage.getDialogById("csn_onboarding_splash").cancel(),d = document.getElementById("csn_onboarding_splash");
    d && (d.parentNode.removeChild(d), "" != a && (window.location = a));
    return c
};
this.joinGroup = function (a) {
    this.takeAction(a, "joinGroup", !1)
};
this.leaveGroup = function (a) {
    this.takeAction(a, "leaveGroup", !1)
};
this.createGroup = function (a) {
    this.takeAction(a, "createGroup", !0)
};
this.goToGroupCreatePage = function () {
    chatter.getToolbox().post({
        url: "/chatterEditionSplash",
        params: {
            nextAction: "GoToGroupCreatePage"
        },
        success: function (a, c) {
            navigateToUrl(c.url)
        }
    })
};
this.takeAction = function (a, c, d) {
    var e = Ext.get("joinGroupsOverlay-" + a);
    e.dom.innerHTML = '\x3cdiv class\x3d"inprogress"\x3e\x3cimg class\x3d"check" src\x3d"/s.gif"\x3e' + LC.getLabel("Images", "search_loading") + "\x3c/div\x3e";
    params = {
        nextAction: c
    };
    params[d ? "groupNumber" : "groupId"] = a;
    chatter.getToolbox().post({
        url: "/chatterEditionSplash",
        params: params,
        success: function (d, b) {
            e.dom.id = "joinGroupsOverlay-" + b.groupId;
            if ("true" == b.groupOwner) e.update('\x3cdiv class\x3d"owner"\x3e\x3cimg class\x3d"check" src\x3d"/s.gif"\x3e' + b.label + "\x3c/div\x3e");
            else if ("true" == b.joinGroup) {
                var c =  "onclick\x3d\"JoinGroupsSplash.joinGroup('" + a + "');\"";
                e.update('\x3cdiv class\x3d"asktojoin"\x3e\x3ca ' + c + ' href\x3d"javascript:void(0);" title\x3d\'' + b.tooltip + '\'\x3e\x3cimg class\x3d"check" src\x3d"/s.gif"\x3e' + b.label + "\x3c/a\x3e\x3c/div\x3e")
            } else if ("true" == b.groupMember) {
                var f = "csnLeaveGroupIcon-" + b.groupId,c = "onclick\x3d\"JoinGroupsSplash.leaveGroup('" + b.groupId + "');\"";
                e.update('\x3cdiv class\x3d"member"\x3e\x3cimg class\x3d"check" src\x3d"/s.gif"\x3e' + b.label + "\x3cspan onmouseout\x3d\"Ext.get('" + f + "').removeClass('active');\" onmouseover\x3d\"Ext.get('" + f + "').addClass('active');\"\x3e\x3ca " + c + '"  title\x3d"' + b.tooltip + '" href\x3d"javascript:void(0);"\x3e\x3cimg src\x3d"/s.gif" class\x3d"leave" id\x3d"' + f + '"\x3e\x3c/a\x3e\x3c/span\x3e\x3c/div\x3e')
            }
        },
        failure: function (a, b) {
            e.update('\x3cdiv class\x3d"errorResponse"\x3e\x3cimg class\x3d"check" src\x3d"/s.gif"\x3e' + b.errMsg + "\x3c/div\x3e")
        }
    });
    "joinGroup" == c && omnitureWrapper.trackEvent(chatter.getOmnitureEventMap().joinGroup)
}
};
var moderateChatter = function () {
    return {
        executeCommand: function (a, b) {
            chatter.getToolbox().post({
                url: "/moderateChatter/" + b + "/" + a,
                params: {},
                success: function (a, b) {
                    window.location.reload()
                }
            })
        },
        confirmTask: function (a, b, c) {
            confirmDelete(a) && this.executeCommand(b, c)
        }
    }
} ();
var swfobject = function () {
function x() {
    if (!v) {
        try {
            var a = d.getElementsByTagName("body")[0].appendChild(d.createElement("span"));
            a.parentNode.removeChild(a)
        } catch (b) {
            return
        }
        v = !0;
        for (var a = A.length, c = 0; c < a; c++) A[c]()
    }
}

function O(a) {
    v ? a() : A[A.length] = a
}

function P(a) {
    if (typeof p.addEventListener != k) p.addEventListener("load", a, !1);
    else if (typeof d.addEventListener != k) d.addEventListener("load", a, !1);
    else if (typeof p.attachEvent != k) X(p, "onload", a);
    else if ("function" == typeof p.onload) {
        var b = p.onload;
        p.onload = function () {
            b();
            a()
        }
    } else p.onload = a
}

function Y() {
    var a = d.getElementsByTagName("body")[0], b = d.createElement(u);
    b.setAttribute("type", B);
    var c = a.appendChild(b);
    if (c) {
        var f = 0;
        (function () {
            if (typeof c.GetVariable != k) {
                var g = c.GetVariable("$version");
                g && (g = g.split(" ")[1].split(","), e.pv = [parseInt(g[0], 10), parseInt(g[1], 10), parseInt(g[2], 10)])
            } else if (10 > f) {
                f++;
                setTimeout(arguments.callee, 10);
                return
            }
            a.removeChild(b);
            c = null;
            G()
        })()
    } else G()
}

function G() {
    var a = s.length;
    if (0 < a)
        for (var b = 0; b < a; b++) {
            var c = s[b].id,
f = s[b].callbackFn,
g = {
    success: !1,
    id: c
};
            if (0 < e.pv[0]) {
                var d = q(c);
                if (d)
                    if (C(s[b].swfVersion) && !(e.wk && 312 > e.wk)) w(c, !0), f && (g.success = !0, g.ref = H(c), f(g));
                    else if (s[b].expressInstall && I()) {
                        g = {};
                        g.data = s[b].expressInstall;
                        g.width = d.getAttribute("width") || "0";
                        g.height = d.getAttribute("height") || "0";
                        d.getAttribute("class") && (g.styleclass = d.getAttribute("class"));
                        d.getAttribute("align") && (g.align = d.getAttribute("align"));
                        for (var h = {}, d = d.getElementsByTagName("param"), l = d.length, m = 0; m < l; m++) "movie" != d[m].getAttribute("name").toLowerCase() && (h[d[m].getAttribute("name")] = d[m].getAttribute("value"));
                        J(g, h, c, f)
                    } else Z(d), f && f(g)
            } else if (w(c, !0), f) {
                if ((c = H(c)) && typeof c.SetVariable != k) g.success = !0, g.ref = c;
                f(g)
            }
        }
}

function H(a) {
    var b = null;
    if ((a = q(a)) && "OBJECT" == a.nodeName) typeof a.SetVariable != k ? b = a : (a = a.getElementsByTagName(u)[0]) && (b = a);
    return b
}

function I() {
    return !D && C("6.0.65") && (e.win || e.mac) && !(e.wk && 312 > e.wk)
}

function J(a, b, c, f) {
    D = !0;
    K = f || null;
    Q = {
        success: !1,
        id: c
    };
    var g = q(c);
    if (g) {
        "OBJECT" == g.nodeName ? (z = L(g), E = null) : (z = g, E = c);
        a.id =               R;
        if (typeof a.width == k || !/%$/.test(a.width) && 310 > parseInt(a.width, 10)) a.width = "310";
        if (typeof a.height == k || !/%$/.test(a.height) && 137 > parseInt(a.height, 10)) a.height = "137";
        d.title = d.title.slice(0, 47) + " - Flash Player Installation";
        f = e.ie && e.win ? "ActiveX" : "PlugIn";
        f = "MMredirectURL\x3d" + encodeURI(window.location).toString().replace(/&/g, "%26") + "\x26MMplayerType\x3d" + f + "\x26MMdoctitle\x3d" + d.title;
        b.flashvars = typeof b.flashvars != k ? b.flashvars + ("\x26" + f) : f;
        e.ie && (e.win && 4 != g.readyState) && (f = d.createElement("div"),
c += "SWFObjectNew", f.setAttribute("id", c), g.parentNode.insertBefore(f, g), g.style.display = "none",
function () {
4 == g.readyState ? g.parentNode.removeChild(g) : setTimeout(arguments.callee, 10)
} ());
        M(a, b, c)
    }
}

function Z(a) {
    if (e.ie && e.win && 4 != a.readyState) {
        var b = d.createElement("div");
        a.parentNode.insertBefore(b, a);
        b.parentNode.replaceChild(L(a), b);
        a.style.display = "none";
        (function () {
            4 == a.readyState ? a.parentNode.removeChild(a) : setTimeout(arguments.callee, 10)
        })()
    } else a.parentNode.replaceChild(L(a), a)
}

function L(a) {
    var b =            d.createElement("div");
    if (e.win && e.ie) b.innerHTML = a.innerHTML;
    else if (a = a.getElementsByTagName(u)[0])
        if (a = a.childNodes)
            for (var c = a.length, f = 0; f < c; f++) !(1 == a[f].nodeType && "PARAM" == a[f].nodeName) && 8 != a[f].nodeType && b.appendChild(a[f].cloneNode(!0));
    return b
}

function M(a, b, c) {
    var f, g = q(c);
    if (e.wk && 312 > e.wk) return f;
    if (g)
        if (typeof a.id == k && (a.id = c), e.ie && e.win) {
            var r = "",                    h;
            for (h in a) a[h] != Object.prototype[h] && ("data" == h.toLowerCase() ? b.movie = a[h] : "styleclass" == h.toLowerCase() ? r += ' class\x3d"' + a[h] + '"' : "classid" != h.toLowerCase() && (r += " " + h + '\x3d"' + a[h] + '"'));
            h = "";
            for (var l in b) b[l] != Object.prototype[l] && (h += '\x3cparam name\x3d"' + l + '" value\x3d"' + b[l] + '" /\x3e');
            g.outerHTML = '\x3cobject classid\x3d"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"' + r + "\x3e" + h + "\x3c/object\x3e";
            F[F.length] = a.id;
            f = q(a.id)
        } else {
            l = d.createElement(u);
            l.setAttribute("type", B);
            for (var m in a) a[m] != Object.prototype[m] && ("styleclass" == m.toLowerCase() ? l.setAttribute("class", a[m]) : "classid" != m.toLowerCase() && l.setAttribute(m, a[m]));
            for (r in b) b[r] != Object.prototype[r] && "movie" != r.toLowerCase() && (a = l, h = r, m = b[r], c = d.createElement("param"), c.setAttribute("name", h), c.setAttribute("value", m), a.appendChild(c));
            g.parentNode.replaceChild(l, g);
            f = l
        }
    return f
}

                    function S(a) {
                        var b = q(a);
                        b && "OBJECT" == b.nodeName && (e.ie && e.win ? (b.style.display = "none", function () {
                            if (4 == b.readyState) {
                                var c = q(a);
                                if (c) {
                                    for (var f in c) "function" == typeof c[f] && (c[f] = null);
                                    c.parentNode.removeChild(c)
                                }
                            } else setTimeout(arguments.callee, 10)
                        } ()) : b.parentNode.removeChild(b))
                    }

                    function q(a) {
                        var b = null;
                        try {
                            b = d.getElementById(a)
                        } catch (c) { }
                        return b
                    }

                    function X(a, b, c) {
                        a.attachEvent(b, c);
                        y[y.length] = [a, b, c]
                    }

                    function C(a) {
                        var b = e.pv;
                        a = a.split(".");
                        a[0] = parseInt(a[0], 10);
                        a[1] = parseInt(a[1], 10) || 0;
                        a[2] = parseInt(a[2], 10) || 0;
                        return b[0] > a[0] || b[0] == a[0] && b[1] > a[1] || b[0] == a[0] && b[1] == a[1] && b[2] >= a[2] ? !0 : !1
                    }

                    function T(a, b, c, f) {
                        if (!e.ie || !e.mac) {
                            var g = d.getElementsByTagName("head")[0];
                            if (g) {
                                c = c && "string" == typeof c ? c : "screen";
                                f && (N = n = null);
                                if (!n || N != c) f = d.createElement("style"), f.setAttribute("type","text/css"), f.setAttribute("media", c), n = g.appendChild(f), e.ie && (e.win && typeof d.styleSheets != k && 0 < d.styleSheets.length) && (n = d.styleSheets[d.styleSheets.length - 1]), N = c;
                                e.ie && e.win ? n && typeof n.addRule == u && n.addRule(a, b) : n && typeof d.createTextNode != k && n.appendChild(d.createTextNode(a + " {" + b + "}"))
                            }
                        }
                    }

                    function w(a, b) {
                        if (U) {
                            var c = b ? "visible" : "hidden";
                            v && q(a) ? q(a).style.visibility = c : T("#" + a, "visibility:" + c)
                        }
                    }

                    function V(a) {
                        return null != /[\\\"<>\.;]/.exec(a) && typeof encodeURIComponent != k ? encodeURIComponent(a) :  a
                    }
                    var k = "undefined",
        u = "object",
        B = "application/x-shockwave-flash",
        R = "SWFObjectExprInst",
        p = window,
        d = document,
        t = navigator,
        W = !1,
        A = [function () {
            W ? Y() : G()
        } ],
        s = [],
        F = [],
        y = [],
        z, E, K, Q, v = !1,
        D = !1,
        n, N, U = !0,
        e = function () {
            var a = typeof d.getElementById != k && typeof d.getElementsByTagName != k && typeof d.createElement != k,
                b = t.userAgent.toLowerCase(),
                c = t.platform.toLowerCase(),
                f = c ? /win/.test(c) : /win/.test(b),
                c = c ? /mac/.test(c) : /mac/.test(b),
                b = /webkit/.test(b) ? parseFloat(b.replace(/^.*webkit\/(\d+(\.\d+)?).*$/, "$1")) : !1,
                g = ! +"\v1",
                e = [0, 0, 0],
                h = null;
            if (typeof t.plugins != k && typeof t.plugins["Shockwave Flash"] == u) {
                if ((h = t.plugins["Shockwave Flash"].description) && !(typeof t.mimeTypes != k && t.mimeTypes[B] && !t.mimeTypes[B].enabledPlugin)) W = !0, g = !1, h = h.replace(/^.*\s+(\S+\s+\S+$)/, "$1"), e[0] = parseInt(h.replace(/^(.*)\..*$/, "$1"), 10), e[1] = parseInt(h.replace(/^.*\.(.*)\s.*$/, "$1"), 10), e[2] = /[a-zA-Z]/.test(h) ? parseInt(h.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0
            } else if (typeof p.ActiveXObject != k) try {
                var l = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
                if (l && (h = l.GetVariable("$version"))) g = !0, h = h.split(" ")[1].split(","), e = [parseInt(h[0], 10), parseInt(h[1], 10), parseInt(h[2], 10)]
            } catch (m) { }
            return {
                w3: a,
                pv: e,
                wk: b,
                ie: g,
                win: f,
                mac: c
            }
        } ();
                    (function () {
                        e.w3 && ((typeof d.readyState != k && "complete" == d.readyState || typeof d.readyState == k && (d.getElementsByTagName("body")[0] || d.body)) && x(), v || (typeof d.addEventListener != k && d.addEventListener("DOMContentLoaded", x, !1), e.ie && e.win && (d.attachEvent("onreadystatechange", function () {
                            "complete" == d.readyState && (d.detachEvent("onreadystatechange",                arguments.callee), x())
                        }), p == top && function () {
                            if (!v) {
                                try {
                                    d.documentElement.doScroll("left")
                                } catch (a) {
                                    setTimeout(arguments.callee, 0);
                                    return
                                }
                                x()
                            }
                        } ()), e.wk && function () {
                            v || document.addEventListener("DOMContentLoaded", function (a) {
                                x()
                            })
                        } (), P(x)))
                    })();
                    (function () {
                        e.ie && e.win && window.attachEvent("onunload", function () {
                            for (var a = y.length, b = 0; b < a; b++) y[b][0].detachEvent(y[b][1], y[b][2]);
                            a = F.length;
                            for (b = 0; b < a; b++) S(F[b]);
                            for (var c in e) e[c] = null;
                            e = null;
                            for (var f in swfobject) swfobject[f] = null;
                            swfobject = null
                        })
                    })();
                    return {
                        registerObject: function (a, b, c, f) {
                            if (e.w3 && a && b) {
                                var d = {};
                                d.id = a;
                                d.swfVersion = b;
                                d.expressInstall = c;
                                d.callbackFn = f;
                                s[s.length] = d;
                                w(a, !1)
                            } else f && f({
                                success: !1,
                                id: a
                            })
                        },
                        getObjectById: function (a) {
                            if (e.w3) return H(a)
                        },
                        embedSWF: function (a, b, c, d, g, r, h, l, m, p) {
                            var q = {
                                success: !1,
                                id: b
                            };
                            e.w3 && !(e.wk && 312 > e.wk) && a && b && c && d && g ? (w(b, !1), O(function () {
                                c += "";
                                d += "";
                                var e = {};
                                if (m && typeof m === u)
                                    for (var n in m) e[n] = m[n];
                                e.data = a;
                                e.width = c;
                                e.height = d;
                                n = {};
                                if (l && typeof l === u)
                                    for (var s in l) n[s] = l[s];
                                if (h && typeof h ===                    u)
                                    for (var t in h) n.flashvars = typeof n.flashvars != k ? n.flashvars + ("\x26" + t + "\x3d" + h[t]) : t + "\x3d" + h[t];
                                if (C(g)) s = M(e, n, b), e.id == b && w(b, !0), q.success = !0, q.ref = s;
                                else {
                                    if (r && I()) {
                                        e.data = r;
                                        J(e, n, b, p);
                                        return
                                    }
                                    w(b, !0)
                                }
                                p && p(q)
                            })) : p && p(q)
                        },
                        switchOffAutoHideShow: function () {
                            U = !1
                        },
                        ua: e,
                        getFlashPlayerVersion: function () {
                            return {
                                major: e.pv[0],
                                minor: e.pv[1],
                                release: e.pv[2]
                            }
                        },
                        hasFlashPlayerVersion: C,
                        createSWF: function (a, b, c) {
                            if (e.w3) return M(a, b, c)
                        },
                        showExpressInstall: function (a, b, c, d) {
                            e.w3 && I() && J(a, b, c, d)
                        },
                        removeSWF: function (a) {
                            e.w3 &&                S(a)
                        },
                        createCSS: function (a, b, c, d) {
                            e.w3 && T(a, b, c, d)
                        },
                        addDomLoadEvent: O,
                        addLoadEvent: P,
                        getQueryParamValue: function (a) {
                            var b = d.location.search || d.location.hash;
                            if (b) {
                                /\?/.test(b) && (b = b.split("?")[1]);
                                if (null == a) return V(b);
                                for (var b = b.split("\x26"), c = 0; c < b.length; c++)
                                    if (b[c].substring(0, b[c].indexOf("\x3d")) == a) return V(b[c].substring(b[c].indexOf("\x3d") + 1))
                            }
                            return ""
                        },
                        expressInstallCallback: function () {
                            if (D) {
                                var a = q(R);
                                a && z && (a.parentNode.replaceChild(z, a), E && (w(E, !0), e.ie && e.win && (z.style.display = "block")),                    K && K(Q));
                                D = !1
                            }
                        }
                    }
                } ();
                var whatToDoNext = new function () {
                    function f(a, b, c) {
                        chatter.getEventBus().addEventListener(a, b, function (a, b) {
                            try {
                                c(a, b)
                            } catch (g) {
                                Sfdc.Debug.error("whatToDoNext: Event listener could not be executed.", {
                                    error: g,
                                    eventname: a,
                                    payload: b
                                })
                            }
                        })
                    }
                    this.logClicks = this.accessibilityMode = !0;
                    this.contextId = this.tabNameType = null;
                    this.inAjaxCall = !1;
                    this.dismissThisItem = function (a, b) {
                        "getSalesforce1" == a && Sfdc.logServer("WTDN", {
                            userAction: a + "TaskDismissed",
                            location: window.location.pathname
                        });
                        this.doAjaxCall(a, b, "dismiss", !1)
                    };
                    this.completeThisItem = function (a, b, c, e) {
                        Ext.fly("todoItem") && Ext.fly("todoItem").addClass("success");
                        this.doAjaxCall(a, b, e ? "completeAndLog" : "complete", !0)
                    };
                    this.hideWTDN = function () {
                        Ext.fly("todoItem") && Ext.fly("todoItem").remove()
                    };
                    this.logThisItem = function (a) {
                        !0 === whatToDoNext.logClicks && chatter.getToolbox().post({
                            url: "/whatToDoNext",
                            params: {
                                taskName: a,
                                taskAction: "log"
                            }
                        })
                    };
                    this.doAjaxCall = function (a, b, c, e) {
                        if (!this.inAjaxCall) {
                            this.inAjaxCall = !0;
                            var d = this;
                            chatter.getToolbox().post({
                                url: "/whatToDoNext",
                                params: {
                                    taskName: a,
                                    taskAction: c,
                                    tabNameType: whatToDoNext.tabNameType || "CHATTER",
                                    contextId: whatToDoNext.contextId
                                },
                                success: function (a, c) {
                                    Ext.fly(b) && d.replaceItem(b, c.html, c.selfFade, e)
                                },
                                failure: function (a, b) {
                                    d.inAjaxCall = !1
                                }
                            })
                        }
                    };
                    this.replaceItem = function (a, b, c, e) {
                        var d, g, f = this;
                        b && (d = Ext.get(a), g = d.parent(), setTimeout(function () {
                            d.fadeOut({
                                endOpacity: 0,
                                duration: 0.5,
                                remove: !0,
                                callback: function (a) {
                                    c ? Ext.fly("todoItem").addClass("success") : Ext.fly("todoItem").removeClass("success");
                                    a = g.createChild(b);
                                    a.is("script") && (a = a.prev());
                                    a.fadeIn({
                                        endOpacity: 1,
                                        duration: 1,
                                        callback: function () {
                                            f.inAjaxCall = !1;
                                            c && setTimeout(function () {
                                                Ext.get("todoItem").parent().fadeOut({
                                                    endOpacity: 0,
                                                    duration: 1,
                                                    remove: !0
                                                })
                                            }, 5E3)
                                        }
                                    })
                                }
                            })
                        }, e ? 5E3 : 0))
                    };
                    this.markListItemComplete = function (a) {
                        var b = "listItem-" + a;
                        null !== Ext.get(b) && this.completeThisItem(a, b)
                    };
                    this.markInvitePeopleAsComplete = function () {
                        this.markListItemComplete("invitePeople")
                    };
                    this.setProfileProperties = function () { };
                    this.uploadPhoto = function () {
                        this.logThisItem("addPhoto");
                        SfdcApp.ChatterProfileSection.showDialog("uploadPhoto");
                        return !1
                    };
                    this.editContactInfo = function () {
                        this.logThisItem("contactInfo");
                        SfdcApp.ChatterProfileSection.showDialog("contactInfo");
                        return !1
                    };
                    this.shortBio = function () {
                        this.logThisItem("shortBio");
                        SfdcApp.ChatterProfileSection.showDialog("aboutMe");
                        return !1
                    };
                    this.showProfilePage = function () {
                        whatToDoNext.logThisItem("profileTask");
                        navigateToUrl("/_ui/core/userprofile/UserProfilePage")
                    };
                    this.getPeopleListNavigationElement = function () {
                        return Sfdc.select("div#mainNavigation li.peopleListView a")[0]
                    };
                    this.isProfileTab = function () {
                        return 0 < document.URL.indexOf("_ui/core/userprofile/UserProfilePage")
                    };
                    this.isPeopleListTab = function () {
                        return 0 < document.URL.indexOf("_ui/core/chatter/people/PeopleListPage")
                    };
                    this.isGroupDetailTab = function () {
                        return 0 < document.URL.indexOf("_ui/core/chatter/groups/GroupProfilePage")
                    };
                    this.isGroupListTab = function () {
                        return 0 < document.URL.indexOf("_ui/core/chatter/groups/GroupListPage")
                    };
                    this.isHomeTab = function () {
                        return 0 < document.URL.indexOf("home/home.jsp")
                    };
                    this.isGroupListFilter =        function () {
                        return Sfdc.select("div[title\x3d'" + LC.getLabel("ChatterGroups", "listheader_membership") + "']")[0] || null
                    };
                    this.isPeopleListFilter = function () {
                        return Sfdc.get('div[title\x3d"' + LC.getLabel("Feeds", "Following") + '"]') ? !0 : !1
                    };
                    this.getGroupListNavigationElement = function () {
                        return Sfdc.select("div#mainNavigation li.groupListView")[0]
                    };
                    this.getInviteLink = function () {
                        var a = Sfdc.get("viralInviteMembersButtonId");
                        return a ? a : Sfdc.get("externalInviteLinkId")
                    };
                    this.showInvite = function () {
                        whatToDoNext.getInviteLink().click()
                    };
                    this.invitePeople = function () {
                        whatToDoNext.logThisItem("invitePeople");
                        whatToDoNext.getInviteLink() && whatToDoNext.showInvite()
                    };
                    this.joinGroup = function () {
                        whatToDoNext.logThisItem("findGroups");
                        navigateToUrl("/_ui/core/chatter/ui/ChatterPage?listViewType\x3dgroups")
                    };
                    this.showCreateGroupsPage = function () {
                        whatToDoNext.createGroup()
                    };
                    this.createGroup = function () {
                        whatToDoNext.logThisItem("createGroup");
                        navigateToUrl("/_ui/core/chatter/groups/GroupCreatePage")
                    };
                    this.uploadGroupPhoto = function () {
                        whatToDoNext.logThisItem("addGroupPhoto");
                        SfdcApp.ChatterProfileSection.showDialog("uploadPhoto");
                        return !1
                    };
                    this.updateGroupDescription = function () {
                        whatToDoNext.logThisItem("addGroupDesc");
                        SfdcApp.ChatterProfileSection.showDialog("groupDescription");
                        return !1
                    };
                    this.addGroupMembers = function () {
                        whatToDoNext.logThisItem("addGroupMembers");
                        Sfdc.get("manageUsersLink").click();
                        return !1
                    };
                    this.showHomePage = function () {
                        whatToDoNext.logThisItem("showProfile");
                        navigateToUrl("/home/home.jsp")
                    };
                    this.showFilesPage = function () {
                        whatToDoNext.logThisItem("shareFile");
                        navigateToUrl("/_ui/core/chatter/files/FileTabPage")
                    };
                    this.getChatterMobile = function () {
                        this.completeThisItem("getChatterMobile", "listItem-getChatterMobile", "completedItemClass", !0);
                        (new Sfdc.Chatter.ChatterMobileWindow("/mobile/chattersplash/chatterMobileOverlay.apexp")).show()
                    };
                    this.showShortVideo = function () {
                        !0 === this.accessibilityMode || 1 == this.accessibilityMode ? (whatToDoNext.completeThisItem("shortVideo", "listItem-shortVideo", "completedItemClass", !0), (new Sfdc.Chatter.TutorialWindow("/collaboration/tutorial/chatter.htm")).show()) :
            chatter.getToolbox().post({
                url: "/whatToDoNext",
                params: {
                    taskName: "shortVideo",
                    taskAction: "shortVideo"
                },
                success: function (a, b) {
                    whatToDoNext.completeThisItem("shortVideo", "listItem-shortVideo", "completedItemClass", !0);
                    (new Sfdc.Chatter.TutorialWindow(b.shortVideoURL, 435)).show()
                }
            })
                    };
                    this.getSalesforce1 = function () {
                        this.completeThisItem("getSalesforce1", "listItem-getSalesforce1", "completedItemClass", !0);
                        Sfdc.logServer("WTDN", {
                            userAction: "getSalesforce1TaskCompleted",
                            linkUrl: "http://www..com//",
                            location: window.location.pathname
                        });
                        window.open("http://www..com//")
                    };
                    this.clickS1LinkInDesc = function (a) {
                        Sfdc.logServer("WTDN", {
                            userAction: "s1LinkClicked",
                            linkUrl: a,
                            location: window.location.pathname
                        });
                        window.open(a)
                    };
                    this.getChatterDesktop = function () {
                        this.completeThisItem("getChatterDesktop", "listItem-getChatterDesktop", "completedItemClass", !0);
                        (new Sfdc.Chatter.ChatterDesktopWindow("/setup/chatterdesktop/chatterdesktopoverlay.apexp")).show()
                    };
                    Ext.onReady(function () {
                        f("chatter:joinGroup","onAfterJoin",
            function () {
                Ext.fly("listItem-findGroups") && whatToDoNext.completeThisItem("findGroups", "listItem-findGroups", "completedItemClass", !1)
            });
                        f("chatter:joinGroup", "onAfterJoin", function () {
                            Ext.fly("listItem-findGroupsIfCreated") && whatToDoNext.completeThisItem("findGroupsIfCreated", "listItem-findGroupsIfCreated", "completedItemClass", !1)
                        })
                    }, this)
                };
                var omnitureWrapper = {
                    trackEvent: function (a) {
                        try {
                            "undefined" == typeof OmniturePage ? Sfdc.require("SfdcApp.Omni.Config", function (b) {
                                b.trackActivity(a, {
                                    events: ["event8"]
                                })
                            }) : OmniturePage.setStage(a)
                        } catch (c) { }
                    }
                };
                Sfdc.provide("SfdcApp.social.intents", function (d) {
                    return {
                        follow: function (b, a, c) {
                            return chatter.getToolbox().post({
                                url: UserContext.getUrl("/social/engage/follow/" + a),
                                params: {
                                    follower: b
                                },
                                success: c.success,
                                failure: c.failure
                            })
                        },
                        unfollow: function (b, a, c) {
                            return chatter.getToolbox().post({
                                url: UserContext.getUrl("/social/engage/follow/" + a) + ";delete",
                                params: {
                                    follower: b
                                },
                                success: c.success,
                                failure: c.failure
                            })
                        },
                        deletePost: function (b, a) {
                            return chatter.getToolbox().post({
                                url: UserContext.getUrl("/social/engage/socialPost/" + b) + ";delete",
                                success: a.success,
                                failure: a.failure
                            })
                        },
                        getFollowList: function (b, a) {
                            return chatter.getToolbox().get({
                                url: UserContext.getUrl("/social/engage/twitter/following/" + b),
                                success: a.success,
                                failure: a.failure
                            })
                        }
                    }
                } (Sfdc));
                Sfdc.provide("SfdcApp.social.attachmentsBuilder", function (f) {
                    function k(a) {
                        var b = a.type;
                        if (b) {
                            b = a.type.split("/")[0].toLowerCase();
                            if ("video" == b) return l(a.url, a.title);
                            if ("image" == b) return m(a.url, a.title);
                            b = a.type.split("/")[0].toLowerCase()
                        }
                        return g(a.url, a.title, b)
                    }

                    function l(a, b) {
                        if (document.createElement("video").canPlayType) {
                            var d = document.createElement("SPAN"), c = document.createElement("VIDEO");
                            c.className = "embeddedmedia";
                            c.src = a;
                            c.onerror = function () {
                                f.Dom.replace(g(a, b, "video", LC.getLabel("EmbeddedSocialPost", "AttachmentError")), d)
                            };
                            c.onfocus = function () {
                                this.setAttribute("controls", "");
                                this.play()
                            };
                            c.onblur = function () {
                                this.removeAttribute("controls");
                                this.pause()
                            };
                            c.onclick = function () {
                                this.focus()
                            };
                            c.tabIndex = -1;
                            d.appendChild(c);
                            d.appendChild(h("/img/chatter/play.png", c));
                            return d
                        }
                        return g(a, b, "video")
                    }

                    function h(a, b) {
                        var d = document.createElement("IMG");
                        d.tabIndex = -1;
                        d.src = a;
                        d.className = "overlay";
                        d.onclick = function () {
                            b.click()
                        };
                        d.onfocus = function () {
                            b.focus()
                        };
                        return d
                    }

                    function m(a, b) {
                        var d = document.createElement("SPAN"), c = document.createElement("IMG");
                        c.className = "embeddedmedia";
                        c.src = a;
                        c.alt = b;
                        c.onerror = function () {
                            f.Dom.replace(g(a, b, "image", LC.getLabel("EmbeddedSocialPost", "AttachmentError")), d)
                        };
                        c.tabIndex = -1;
                        d.appendChild(c);
                        d.appendChild(h("/img/chatterfiles/zoom24withbg.png", c));
                        return d
                    }

                    function g(a, b, d, c) {
                        var e = document.createElement("A");
                        e.href = f.Url.generateUrl(f.Url.resolveUrl("/servlet/servlet.ExternalRedirect"), {
                            url: a
                        });
                        e.target = "_blank";
                        a = document.createElement("SPAN");
                        a.appendChild(document.createTextNode(b));
                        a.className = "filename";
                        e.appendChild(a);
                        e.className += "embeddedmedia " + d;
                        c && (b = document.createElement("SPAN"), b.appendChild(document.createTextNode(c)), b.className = "error", e.appendChild(b));
                        return e
                    }
                    return {
                        buildAttachments: function (a) {
                            if (a.attachments && 0 < a.attachments.length) {
                                section = document.createElement("div");
                                section.className = "attachments";
                                for (var b = 0; b < a.attachments.length; b++) section.appendChild(k(a.attachments[b]));
                                return section
                            }
                            return document.createTextNode("")
                        }
                    }
                } (Sfdc));
                Sfdc.provide("SfdcApp.social.embeddedPost", function (c) {
                    function h(a) {
                        window.setTimeout(function () {
                            c.Dom.hideByDisplay(a.parentNode)
                        }, 2E3)
                    }

                    function g(a) {
                        c.Dom.removeClass(a, "failed");
                        c.Dom.removeClass(a, "activated");
                        c.Dom.removeClass(a, "processing")
                    }

                    function n(a, b, d) {
                        return {
                            success: function () {
                                var e = f[d];
                                e || (e = {});
                                e[b] = b;
                                g(a);
                                c.Dom.addClass(a, "activated");
                                h(a)
                            },
                            failure: function () {
                                g(a);
                                c.Dom.addClass(a, "failed")
                            }
                        }
                    }

                    function p(a, b, d) {
                        return {
                            success: function () {
                                var c = f[d];
                                c && delete c[b];
                                g(a);
                                h(a)
                            },
                            failure: function () {
                                g(a);
                                c.Dom.addClass(a, "failed")
                            }
                        }
                    }

                    function k(a, b) {
                        c.Dom.removeClass(b, "loading");
                        b.focus()
                    }

                    function l(a, b, d) {
                        var e = f[d];
                        (d = c.select(".personainfo", b)) && c.Array.forEach(d, function (a) {
                            c.Dom.removeClass(a, "failed");
                            var b = c.Data.get(a, "managedAccountId");
                            b && e[b] ? c.Dom.addClass(a, "activated") : c.Dom.removeClass(a, "activated")
                        });
                        k(a, b)
                    }
                    var f = {};
                    return {
                        followOptionOnClick: function (a, b, d, e) {
                            var m = f[e];
                            c.Dom.addClass(a, "processing");
                            m && m[b] ? SfdcApp.social.intents.unfollow(b, d, p(a, b, e)) : SfdcApp.social.intents.follow(b, d, n(a, b, e))
                        },
                        deleteOnClick: function (a, b) {
                            if (!0 == confirm(LC.getLabel("DeleteIntentAction", "DeleteConfirmation"))) {
                                var d = c.Dom.getParent(b), e = c.Dom.getParent(d), d = c.get(".deleteFail", e);
                                c.Dom.removeClass(d, "deleteMessage");
                                SfdcApp.social.intents.deletePost(a, {
                                    success: function (a, b) {
                                        c.Dom.addClass(e, "deleted");
                                        b && SfdcApp.social.postBuilder.renderDeletedByElement(e, b)
                                    },
                                    failure: function (a, b) {
                                        b && b.errors && SfdcApp.social.postBuilder.setDeleteFailMessage(e, b.errors.message)
                                    }
                                })
                            }
                        },
                        followOnClick: function (a, b, d) {
                            var e = c.Dom.getLocalOffsetXY(a);
                            c.Dom.setStyle(b, "left", e.x + "px");
                            c.Dom.show(b);
                            f[d] ? l(a, b, d) : SfdcApp.social.intents.getFollowList(d, {
                                success: function (c, e) {
                                    f[d] = e;
                                    l(a, b, d)
                                },
                                failure: function (c, d) {
                                    k(a, b)
                                }
                            })
                        }
                    }
                } (Sfdc));
                Sfdc.provide("SfdcApp.social.intentBuilder", function (g) {
                    function k(a, c, b) {
                        return b && c ? (a = e(LC.getLabel("WebIntents", "Reply"), "javascript:void(0);", "reply"), a.onclick = function () {
                            SfdcApp.social.publisher.revealPublisher(b, c.actionId, c.apiName)
                        }, a) : a ? e(LC.getLabel("WebIntents", "Reply"), a, "reply") : document.createTextNode("")
                    }

                    function h(a, c, b) {
                        return c && b ? (a = h("javascript:void(0);"), a.onclick = function () {
                            SfdcApp.social.publisher.revealPublisher(b, c.actionId, c.apiName)
                        }, a) : a ? e(LC.getLabel("WebIntents", "Retweet"), a, "retweet") : document.createTextNode("")
                    }

                    function l(a, c) {
                        var b = null, b = "Retweet" === a.messageType.apiValue ? a.replyTo : a;
                        return c && 0 < c.length && b && b.author && b.author.externalId ? m(c, b) : b && b.postUrl ? e(LC.getLabel("WebIntents", "Follow"), b.postUrl, "follow") : document.createTextNode("")
                    }

                    function m(a, c) {
                        var b = e(LC.getLabel("WebIntents", "Follow"), "javascript:void(0);", "follow"), d = n(a, c);
                        b.appendChild(d);
                        b.onclick = function () {
                            SfdcApp.social.embeddedPost.followOnClick(b, d, c.author.externalId)
                        };
                        return b
                    }

                    function p() {
                        var a = LC.getLabel("Global", "loading"), c = document.createElement("LI");
                        c.className = "loadingHolder";
                        var b = document.createElement("IMG");
                        c.appendChild(b);
                        b.src = UserContext.getUrl("/img/loading.gif");
                        b.className = "loadingImage";
                        b = document.createElement("SPAN");
                        c.appendChild(b);
                        b.innerHTML = a;
                        b.className = "loadingDescription";
                        return c
                    }

                    function n(a, c) {
                        var b = document.createElement("UL");
                        b.className = "loading";
                        b.tabIndex = -1;
                        b.onblur = function () {
                            g.Dom.hideByDisplay(b)
                        };
                        g.Dom.hideByDisplay(b);
                        b.appendChild(p());
                        for (i = 0; i < a.length; i++) b.appendChild(q(a[i], c));
                        return b
                    }

                    function q(a, c) {
                        var b = document.createElement("LI");
                        b.className = "personainfo";
                        g.Data.set(b, "managedAccountId", a.id);
                        b.onclick = function () {
                            SfdcApp.social.embeddedPost.followOptionOnClick(b, a.id, c.author.id, c.author.externalId);
                            !1
                        };
                        b.appendChild(r(a));
                        b.appendChild(s(a));
                        b.appendChild(t());
                        return b
                    }

                    function t() {
                        var a = document.createElement("SPAN");
                        a.className = "followingSuffix";
                        a.appendChild(document.createTextNode(" " + LC.getLabel("FollowIntentAction", "FollowSuffix")));
                        return a
                    }

                    function r(a) {
                        if (a.name) {
                            var c = document.createElement("SPAN");
                            c.className = "realname";
                            c.appendChild(document.createTextNode(a.name));
                            return c
                        }
                        return document.createTextNode("")
                    }

                    function s(a) {
                        if (a.handle) {
                            var c = document.createElement("SPAN");
                            c.className = "handle";
                            c.appendChild(document.createTextNode(a.handle));
                            return c
                        }
                        return document.createTextNode("")
                    }

                    function u(a) {
                        if (g.isDefAndNotNull(a.author) && !g.isEmpty(a.accounts))
                            for (var c in a.accounts)
                                if (a.accounts[c].id === a.author.id) return !0;
                        return !1
                    }

                    function v(a) {
                        if (a && a.isOutbound && g.isDefAndNotNull(a.externalId) && g.isDefAndNotNull(a.status) && ("SENT" == a.status.statusType || "REPLIED" == a.status.statusType) && u(a)) {
                            var c = e(LC.getLabel("WebIntents", "Delete"), "javascript:void(0);", "delete");
                            c.onclick = function () {
                                SfdcApp.social.embeddedPost.deleteOnClick(a.id, c)
                            };
                            return c
                        }
                        return document.createTextNode("")
                    }

                    function e(a, c, b) {
                        var d = document.createElement("LI");
                        d.className = "intent";
                        b && (d.className += " " + b);
                        b = document.createElement("A");
                        b.appendChild(document.createTextNode(a));
                        b.href = c;
                        d.appendChild(b);
                        return d
                    }
                    return {
                        buildIntents: function (a, c, b, d) {
                            var f = document.createElement("UL");
                            f.className = "intents";
                            f.appendChild(k(a.postUrl, c, b));
                            f.appendChild(a.postUrl ? e(LC.getLabel("WebIntents", "Favorite"), a.postUrl, "favorite") : document.createTextNode(""));
                            f.appendChild(a.postUrl ? e(LC.getLabel("WebIntents", "Like"), a.postUrl, "like") : document.createTextNode(""));
                            f.appendChild(h(a.postUrl, c, d));
                            f.appendChild(l(a, a.accounts));
                            f.appendChild(v(a));
                            return f
                        }
                    }
                } (Sfdc));
                Sfdc.provide("SfdcApp.social.postBuilder", function (d) {
                    function r(a, b) {
                        var c = document.createElement("DIV");
                        c.className += " " + s(a);
                        var f;
                        f = a && a.messageType && "RETWEET" === a.messageType.dbValue ? t : u;
                        var e = f.getBlueprint(a);
                        e && d.Array.forEach(e, function (b) {
                            (b = b.call(f, a)) && c.appendChild(b)
                        });
                        c.appendChild(v());
                        b && c.appendChild(b);
                        return c
                    }

                    function g(a) {
                        return SfdcApp.social.attachmentsBuilder.buildAttachments(a)
                    }

                    function v() {
                        var a = document.createElement("DIV");
                        a.className = "deleteFail";
                        return a
                    }

                    function h(a) {
                        var b = document.createElement("DIV");
                        b.className = "deletedByContainer";
                        b.appendChild(k(a));
                        return b
                    }

                    function k(a) {
                        var b = document.createElement("DIV");
                        b.className = "deletedBy";
                        if (a && a.deletedByUserUrl && a.deletedByUserName) {
                            var c = document.createElement("SPAN");
                            b.appendChild(c);
                            d.Dom.setText(c, (a.messageType && "RETWEET" === a.messageType.dbValue ? LC.getLabel("DeleteIntentAction", "RetweetDeletedBy") : LC.getLabel("DeleteIntentAction", "DeletedBy")) + " ");
                            c = document.createElement("A");
                            c.href = a.deletedByUserUrl;
                            d.Dom.setText(c, a.deletedByUserName);
                            b.appendChild(c)
                        }
                        return b
                    }

                    function s(a) {
                        var b = "socialpost";
                        a.provider && (b += " " + (a.provider && a.provider.apiValue ? a.provider.apiValue.toLowerCase() : ""));
                        a.messageType && (b += " " + a.messageType.apiValue.toLowerCase());
                        b = a.isOutbound ? b + " outbound" : b + " inbound";
                        a.status && (b += " " + a.status.statusType.toLowerCase());
                        return b
                    }

                    function l(a) {
                        return a.author ? m(a.author, "author") : document.createTextNode("")
                    }

                    function n(a) {
                        return a.recipient ? m(a.recipient, "recipient") : document.createTextNode("")
                    }

                    function m(a, b) {
                        var c = document.createElement("A");
                        c.className = "personainfo " + b;
                        a.profileUrl && (c.href = a.profileUrl, c.target = "_blank");
                        a.name && c.appendChild(e("SPAN", a.name, "realname"));
                        a.handle && c.appendChild(e("SPAN", a.handle, "handle"));
                        return c
                    }

                    function p(a) {
                        if (a.content) {
                            if ("twitter" === (a.provider && a.provider.apiValue ? a.provider.apiValue.toLowerCase() : "")) try {
                                var b = document.createElement("DIV");
                                b.className += "content";
                                b.innerHTML = twttr.txt.autoLink(d.String.escapeToHtml(a.content), {
                                    targetBlank: !0
                                });
                                return b
                            } catch (c) { }
                            return e("DIV", a.content, "content")
                        }
                        return document.createTextNode("")
                    }

                    function q(a) {
                        return a.status && a.status.statusMessage ? e("DIV", a.status.statusMessage, "status " + a.status.statusType.toLowerCase()) : document.createTextNode("")
                    }

                    function e(a, b, c) {
                        a = document.createElement(a);
                        a.appendChild(document.createTextNode(b));
                        c && (a.className = c);
                        return a
                    }
                    var u = {
                        getBlueprint: function (a) {
                            return [l, n, p, g, q, h]
                        }
                    }, t = {
                        getBlueprint: function (a) {
                            return !a.replyTo ? null : [this.buildAuthor, this.buildRecipient,
                    this.buildContent, this.buildAttachment, this.buildRetweetedBy, this.buildStatus, h
                ]
                        },
                        buildAuthor: function (a) {
                            return l(a.replyTo)
                        },
                        buildRecipient: function (a) {
                            return n(a.replyTo)
                        },
                        buildContent: function (a) {
                            return p(a.replyTo)
                        },
                        buildAttachment: function (a) {
                            return g(a)
                        },
                        buildStatus: function (a) {
                            return q(a.replyTo)
                        },
                        buildRetweetedBy: function (a) {
                            if (a.author && a.author.handle) {
                                var b = document.createElement("DIV");
                                b.className = "retweetedBy";
                                d.Dom.setText(b, LC.getLabel("EmbeddedSocialPost", "RetweetedBy") + " " + a.author.handle);
                                return b
                            }
                        }
                    };
                    return {
                        buildPost: function (a, b) {
                            return r(a, b)
                        },
                        renderDeletedByElement: function (a, b) {
                            var c = d.get(".deletedByContainer", a);
                            if (c) {
                                var e = d.get(".deletedBy", c);
                                e && c.removeChild(e)
                            }
                            c.appendChild(k(b))
                        },
                        setDeleteFailMessage: function (a, b) {
                            var c = d.get(".deleteFail", a);
                            d.Dom.setText(c, b);
                            d.Dom.addClass(c, "deleteMessage")
                        }
                    }
                } (Sfdc));
                Sfdc.provide("SfdcApp.social.publisher", function (d) {
                    function p(a) {
                        if (!q[a]) {
                            q[a] = !0;
                            var b = h(a);
                            if (b) {
                                var c = function () {
                                    r(a)
                                };
                                b.onkeypress = c;
                                b.oncut = c;
                                b.onpaste = c;
                                b.onfocus = c;
                                b.oninput = c;
                                b.ondrop = c
                            }
                        }
                    }

                    function A(a) {
                        return 140 < a.length ? (a = a.substring(0, 139), d.String.rtrim(a) + "...") : a
                    }

                    function s(a, b, c) {
                        p(c);
                        var e = d.JSON.parse(a);
                        if (e.provider) {
                            m[c] = e.provider;
                            if (a = f("Provider", c)) a.value = e.provider.dbValue, a = d.get(".socialPubProvider", d.Dom.getParent(a)), d.Dom.setText(a, e.provider.label);
                            r(c);
                            t(c)
                        }
                        if (e.replyTo) {
                            var k = f("ReplyTo", c);
                            if (k) {
                                var g = e.replyTo;
                                k.value = g.id;
                                for (a = d.get(".socialPubReplyTo .socialpostcontainer", d.Dom.getParent(k)); a.firstChild; ) a.removeChild(a.firstChild);
                                g.content = A(g.content);
                                a.appendChild(SfdcApp.social.postBuilder.buildPost(g))
                            }
                        }
                        e.accounts && (a = n(c)) && u(a, v(e.accounts, function (a) {
                            return new Option(a.label, a.id)
                        }));
                        if (e.author && e.author.id) {
                            var l = n(c);
                            w(l, e.author.id, !0)
                        }
                        e.messageTypes && (a = f("MessageType", c)) && u(a, v(e.messageTypes, function (a) {
                            return new Option(a.label, a.dbValue)
                        }));
                        e.messageType && e.messageType.dbValue && (a = f("MessageType", c), w(a, e.messageType.dbValue), B(c, e.messageType));
                        if (a = h(c)) a.value = e.content ? e.content : "", document.createEvent && (g = document.createEvent("Event"), g.initEvent("input", !1, !0), a.dispatchEvent(g));
                        k = f("ReplyTo", c);
                        l = n(c);
                        e.recipient && (e.recipient.externalId && e.provider && "Twitter" == e.provider.apiValue && k && l && !(1 == l.options.length && "" == l.options[0].value)) && chatter.getToolbox().get({
                            url: UserContext.getUrl("/social/engage/twitter/followsus/" + e.recipient.externalId),
                            success: function (a, b) {
                                var c = l;
                                if (k.value == e.replyTo.id)
                                    for (var d = LC.getLabel("SocialPublisher", "FromAccountCantDirectMessage"), f = 0; f < c.options.length; f++) !b[c.options[f].value] && ("" != c.options[f].value && -1 == c.options[f].text.indexOf(d)) && (c.options[f].text += " " + d)
                                }
                            });
                            entityFeedPage && entityFeedPage.getEventBus().fireEvent("action:" + b, "onDirty", {
                                objectId: e.parent
                            })
                        }

                        function B(a, b) {
                            if (b && b.dbValue && "RETWEET" === b.dbValue) {
                                var c = x(a);
                                c && d.Dom.hideByDisplay(c)
                            } else y(a)
                        }

                        function u(a, b) {
                            if (a) {
                                a.options.length = b.length;
                                for (var c = 0; c < b.length; c++) a.options[c] = b[c]
                            }
                        }

                        function v(a, b) {
                            var c = [];
                            a || (a = {
                                length: 0
                            });
                            0 == a.length && c.push(new Option(LC.getLabel("SelectElement", "Required"), ""));
                            for (var d = 0; d < a.length; d++) c.push(b(a[d]));
                            return c
                        }

                        function w(a, b, c) {
                            if (a) {
                                for (var d = !1, f = 0; f < a.options.length; f++)
                                    if (a.options[f].value === b) {
                                        a.options.selectedIndex = f;
                                        d = !0;
                                        break
                                    }
                                if (!d && c && (b = 0 < a.options.length ? a.options[0] : null, null === b || "" !== b.value)) a.add(new Option(LC.getLabel("SelectElement", "Required"), ""), b), a.options.selectedIndex = 0
                            }
                        }

                        function t(a) {
                            a = m[a];
                            var b = d.get("publishersharebutton");
                            a && b && (b.value = a.createButtonText ? a.createButtonText : LC.getLabel("Publisher", "Create"))
                        }

                        function r(a) {
                            var b = h(a);
                            if (b) {
                                d.Window.getScrollY();
                                d.Dom.setStyle(b, "height", 0);
                                var c = 10 * Math.ceil(b.scrollHeight / 10);
                                d.Dom.setStyle(b, "height", Math.max(c + 10, 100) + "px");
                                var c = m[a], e = "";
                                c.contentLengthLimit && -1 != c.contentLengthLimit && (b = d.String.trim(b.value), e = c.contentLengthLimit - twttr.txt.getTweetLength(b));
                                a = f("socialPubCharCount_Content", a);
                                a.innerHTML = e;
                                0 > e ? d.Dom.addClass(a, "charLimit") : d.Dom.removeClass(a, "charLimit")
                            }
                        }

                        function f(a, b) {
                            return d.get(a + "__" + b)
                        }

                        function n(a) {
                            return f("OutboundSocialAccount", a)
                        }

                        function h(a) {
                            return f("Content", a)
                        }

                        function z(a) {
                            return d.get("." + a + ".publisherTemplate .pbBody")
                        }

                        function x(a) {
                            return (a = h(a)) ? d.Dom.getParent(a, ".quickActionField") : null
                        }

                        function y(a) {
                            (a = x(a)) && d.Dom.show(a)
                        }

                        function C(a) {
                            a = z(a);
                            var b = d.select(".errorMsg", a).concat(d.select(".pbError", a));
                            d.each(b, function (a) {
                                d.Dom.hideByDisplay(a)
                            });
                            d.each(d.select(".error", a), function (a) {
                                d.Dom.removeClass(a, "error")
                            })
                        }
                        var m = {}, q = {};
                        return {
                            initializePublisher: function (a, b) {
                                d.onReady(function () {
                                    p(b);
                                    if (h(b)) {
                                        var c = d.JSON.parse(a);
                                        new QuickTextAutoCompleteTextArea(c)
                                    }
                                })
                            },
                            setPublisherValues: function (a, b, c) {
                                d.onReady(function () {
                                    s(a, b, c)
                                })
                            },
                            revealPublisher: function (a, b, c) {
                                C(b);
                                y(b);
                                d.canvas.parent.publish({
                                    name: "publisher.selectAction",
                                    payload: {
                                        actionName: c
                                    }
                                });
                                s(a, c, b);
                                if (a = h(b)) a.selectionStart = a.selectionEnd = a.value.length, a.focus();
                                (a = z(b)) && a.scrollIntoView(!1);
                                b = d.get("ReplyTo__" + b + "_container");
                                a = d.Dom.getStyle(b, "backgroundColor");
                                d.Units.HexColor.isHexColor(a) || (a = (new d.Units.RGBColor(a)).toHex().toString());
                                d.Animation.css(b, "backgroundColor", "#F6F6A6", a, {
                                    duration: 1500
                                })
                            },
                            onShowPanel: function (a) {
                                t(a)
                            }
                        }
                    } (Sfdc));
                    (function () {
                        function g(e, d) {
                            d = d || "";
                            "string" !== typeof e && (e.global && 0 > d.indexOf("g") && (d += "g"), e.ignoreCase && 0 > d.indexOf("i") && (d += "i"), e.multiline && 0 > d.indexOf("m") && (d += "m"), e = e.source);
                            return RegExp(e.replace(/#\{(\w+)\}/g, function (e, d) {
                                var m = a.txt.regexen[d] || "";
                                "string" !== typeof m && (m = m.source);
                                return m
                            }), d)
                        }

                        function r(a, d) {
                            return a.replace(/#\{(\w+)\}/g, function (a, e) {
                                return d[e] || ""
                            })
                        }

                        function f(a, d, b) {
                            var h = String.fromCharCode(d);
                            b !== d && (h += "-" + String.fromCharCode(b));
                            a.push(h);
                            return a
                        }

                        function s(a) {
                            var d = {}, b;
                            for (b in a) a.hasOwnProperty(b) && (d[b] = a[b]);
                            return d
                        }

                        function p(a, d, b) {
                            return !b ? "string" === typeof a && a.match(d) && RegExp["$\x26"] === a : !a || a.match(d) && RegExp["$\x26"] === a
                        }
                        if ("undefined" === typeof a || null === a) var a = {};
                        a.txt = {};
                        a.txt.regexen = {};
                        var y = {
                            "\x26": "\x26amp;",
                            "\x3e": "\x26gt;",
                            "\x3c": "\x26lt;",
                            '"': "\x26quot;",
                            "'": "\x26#39;"
                        };
                        a.txt.htmlEscape = function (a) {
                            return a && a.replace(/[&"'><]/g, function (a) {
                                return y[a]
                            })
                        };
                        a.txt.regexSupplant = g;
                        a.txt.stringSupplant = r;
                        a.txt.addCharsToCharClass = f;
                        var k = String.fromCharCode, c = [k(32), k(133), k(160), k(5760), k(6158), k(8232), k(8233), k(8239), k(8287), k(12288)];
                        f(c, 9, 13);
                        f(c, 8192, 8202);
                        var u = [k(65534), k(65279), k(65535)];
                        f(u, 8234, 8238);
                        a.txt.regexen.spaces_group = g(c.join(""));
                        a.txt.regexen.spaces = g("[" + c.join("") + "]");
                        a.txt.regexen.invalid_chars_group = g(u.join(""));
                        a.txt.regexen.punct = /\!'#%&'\(\)*\+,\\\-\.\/:;<=>\?@\[\]\^_{|}~\$/;
                        a.txt.regexen.rtl_chars = /[\u0600-\u06FF]|[\u0750-\u077F]|[\u0590-\u05FF]|[\uFE70-\uFEFF]/mg;
                        a.txt.regexen.non_bmp_code_pairs = /[\uD800-\uDBFF][\uDC00-\uDFFF]/mg;
                        c = [];
                        f(c, 1024, 1279);
                        f(c, 1280, 1319);
                        f(c, 11744, 11775);
                        f(c, 42560, 42655);
                        f(c, 1425, 1471);
                        f(c, 1473, 1474);
                        f(c, 1476, 1477);
                        f(c, 1479, 1479);
                        f(c, 1488, 1514);
                        f(c, 1520, 1524);
                        f(c, 64274, 64296);
                        f(c, 64298, 64310);
                        f(c, 64312, 64316);
                        f(c, 64318, 64318);
                        f(c, 64320, 64321);
                        f(c, 64323, 64324);
                        f(c, 64326, 64335);
                        f(c, 1552, 1562);
                        f(c, 1568, 1631);
                        f(c, 1646, 1747);
                        f(c, 1749, 1756);
                        f(c, 1758, 1768);
                        f(c, 1770, 1775);
                        f(c, 1786, 1788);
                        f(c, 1791, 1791);
                        f(c, 1872, 1919);
                        f(c, 2208, 2208);
                        f(c, 2210, 2220);
                        f(c, 2276, 2302);
                        f(c, 64336, 64433);
                        f(c, 64467, 64829);
                        f(c, 64848, 64911);
                        f(c, 64914, 64967);
                        f(c, 65008, 65019);
                        f(c, 65136, 65140);
                        f(c, 65142, 65276);
                        f(c, 8204, 8204);
                        f(c, 3585, 3642);
                        f(c, 3648, 3662);
                        f(c, 4352, 4607);
                        f(c, 12592, 12677);
                        f(c, 43360, 43391);
                        f(c, 44032, 55215);
                        f(c, 55216, 55295);
                        f(c, 65441, 65500);
                        f(c, 12449, 12538);
                        f(c, 12540, 12542);
                        f(c, 65382, 65439);
                        f(c, 65392, 65392);
                        f(c, 65296, 65305);
                        f(c, 65313, 65338);
                        f(c, 65345, 65370);
                        f(c, 12353, 12438);
                        f(c, 12441, 12446);
                        f(c, 13312, 19903);
                        f(c, 19968, 40959);
                        f(c, 173824, 177983);
                        f(c, 177984, 178207);
                        f(c, 194560, 195103);
                        f(c, 12291, 12291);
                        f(c, 12293, 12293);
                        f(c, 12347, 12347);
                        a.txt.regexen.nonLatinHashtagChars = g(c.join(""));
                        c = [];
                        f(c, 192, 214);
                        f(c, 216, 246);
                        f(c, 248, 255);
                        f(c, 256, 591);
                        f(c, 595, 596);
                        f(c, 598, 599);
                        f(c, 601, 601);
                        f(c, 603, 603);
                        f(c, 611, 611);
                        f(c, 616, 616);
                        f(c, 623, 623);
                        f(c, 626, 626);
                        f(c, 649, 649);
                        f(c, 651, 651);
                        f(c, 699, 699);
                        f(c, 768, 879);
                        f(c, 7680, 7935);
                        a.txt.regexen.latinAccentChars = g(c.join(""));
                        a.txt.regexen.hashSigns = /[#\uff03]/;
                        a.txt.regexen.hashtagAlpha = g(/[a-z_#{latinAccentChars}#{nonLatinHashtagChars}]/i);
                        a.txt.regexen.hashtagAlphaNumeric = g(/[a-z0-9_#{latinAccentChars}#{nonLatinHashtagChars}]/i);
                        a.txt.regexen.endHashtagMatch = g(/^(?:#{hashSigns}|:\/\/)/);
                        a.txt.regexen.hashtagBoundary = g(/(?:^|$|[^&a-z0-9_#{latinAccentChars}#{nonLatinHashtagChars}])/);
                        a.txt.regexen.validHashtag = g(/(#{hashtagBoundary})(#{hashSigns})(#{hashtagAlphaNumeric}*#{hashtagAlpha}#{hashtagAlphaNumeric}*)/gi);
                        a.txt.regexen.validMentionPrecedingChars = /(?:^|[^a-zA-Z0-9_!#$%&*@\uff20]|RT:?)/;
                        a.txt.regexen.atSigns = /[@\uff20]/;
                        a.txt.regexen.validMentionOrList = g("(#{validMentionPrecedingChars})(#{atSigns})([a-zA-Z0-9_]{1,20})(/[a-zA-Z][a-zA-Z0-9_-]{0,24})?", "g");
                        a.txt.regexen.validReply = g(/^(?:#{spaces})*#{atSigns}([a-zA-Z0-9_]{1,20})/);
                        a.txt.regexen.endMentionMatch = g(/^(?:#{atSigns}|[#{latinAccentChars}]|:\/\/)/);
                        a.txt.regexen.validUrlPrecedingChars = g(/(?:[^A-Za-z0-9@\uff20$#\uff03#{invalid_chars_group}]|^)/);
                        a.txt.regexen.invalidUrlWithoutProtocolPrecedingChars = /[-_.\/]$/;
                        a.txt.regexen.invalidDomainChars = r("#{punct}#{spaces_group}#{invalid_chars_group}", a.txt.regexen);
                        a.txt.regexen.validDomainChars = g(/[^#{invalidDomainChars}]/);
                        a.txt.regexen.validSubdomain = g(/(?:(?:#{validDomainChars}(?:[_-]|#{validDomainChars})*)?#{validDomainChars}\.)/);
                        a.txt.regexen.validDomainName = g(/(?:(?:#{validDomainChars}(?:-|#{validDomainChars})*)?#{validDomainChars}\.)/);
                        a.txt.regexen.validGTLD = g(/(?:(?:aero|asia|biz|cat|com|coop|edu|gov|info|int|jobs|mil|mobi|museum|name|net|org|pro|tel|travel|xxx)(?=[^0-9a-zA-Z]|$))/);
                        a.txt.regexen.validCCTLD = g(RegExp("(?:(?:ac|ad|ae|af|ag|ai|al|am|an|ao|aq|ar|as|at|au|aw|ax|az|ba|bb|bd|be|bf|bg|bh|bi|bj|bm|bn|bo|br|bs|bt|bv|bw|by|bz|ca|cc|cd|cf|cg|ch|ci|ck|cl|cm|cn|co|cr|cs|cu|cv|cx|cy|cz|dd|de|dj|dk|dm|do|dz|ec|ee|eg|eh|er|es|et|eu|fi|fj|fk|fm|fo|fr|ga|gb|gd|ge|gf|gg|gh|gi|gl|gm|gn|gp|gq|gr|gs|gt|gu|gw|gy|hk|hm|hn|hr|ht|hu|id|ie|il|im|in|io|iq|ir|is|it|je|jm|jo|jp|ke|kg|kh|ki|km|kn|kp|kr|kw|ky|kz|la|lb|lc|li|lk|lr|ls|lt|lu|lv|ly|ma|mc|md|me|mg|mh|mk|ml|mm|mn|mo|mp|mq|mr|ms|mt|mu|mv|mw|mx|my|mz|na|nc|ne|nf|ng|ni|nl|no|np|nr|nu|nz|om|pa|pe|pf|pg|ph|pk|pl|pm|pn|pr|ps|pt|pw|py|qa|re|ro|rs|ru|rw|sa|sb|sc|sd|se|sg|sh|si|sj|sk|sl|sm|sn|so|sr|ss|st|su|sv|sx|sy|sz|tc|td|tf|tg|th|tj|tk|tl|tm|tn|to|tp|tr|tt|tv|tw|tz|ua|ug|uk|us|uy|uz|va|vc|ve|vg|vi|vn|vu|wf|ws|ye|yt|za|zm|zw)(?\x3d[^0-9a-zA-Z]|$))"));
                        a.txt.regexen.validPunycode = g(/(?:xn--[0-9a-z]+)/);
                        a.txt.regexen.validDomain = g(/(?:#{validSubdomain}*#{validDomainName}(?:#{validGTLD}|#{validCCTLD}|#{validPunycode}))/);
                        a.txt.regexen.validAsciiDomain = g(/(?:(?:[\-a-z0-9#{latinAccentChars}]+)\.)+(?:#{validGTLD}|#{validCCTLD}|#{validPunycode})/gi);
                        a.txt.regexen.invalidShortDomain = g(/^#{validDomainName}#{validCCTLD}$/);
                        a.txt.regexen.validPortNumber = g(/[0-9]+/);
                        a.txt.regexen.validGeneralUrlPathChars = g(/[a-z0-9!\*';:=\+,\.\$\/%#\[\]\-_~@|&#{latinAccentChars}]/i);
                        a.txt.regexen.validUrlBalancedParens = g(/\(#{validGeneralUrlPathChars}+\)/i);
                        a.txt.regexen.validUrlPathEndingChars = g(/[\+\-a-z0-9=_#\/#{latinAccentChars}]|(?:#{validUrlBalancedParens})/i);
                        a.txt.regexen.validUrlPath = g("(?:(?:#{validGeneralUrlPathChars}*(?:#{validUrlBalancedParens}#{validGeneralUrlPathChars}*)*#{validUrlPathEndingChars})|(?:@#{validGeneralUrlPathChars}+/))", "i");
                        a.txt.regexen.validUrlQueryChars = /[a-z0-9!?\*'@\(\);:&=\+\$\/%#\[\]\-_\.,~|]/i;
                        a.txt.regexen.validUrlQueryEndingChars = /[a-z0-9_&=#\/]/i;
                        a.txt.regexen.extractUrl = g("((#{validUrlPrecedingChars})((https?:\\/\\/)?(#{validDomain})(?::(#{validPortNumber}))?(\\/#{validUrlPath}*)?(\\?#{validUrlQueryChars}*#{validUrlQueryEndingChars})?))", "gi");
                        a.txt.regexen.validTcoUrl = /^https?:\/\/t\.co\/[a-z0-9]+/i;
                        a.txt.regexen.urlHasProtocol = /^https?:\/\//i;
                        a.txt.regexen.urlHasHttps = /^https:\/\//i;
                        a.txt.regexen.cashtag = /[a-z]{1,6}(?:[._][a-z]{1,2})?/i;
                        a.txt.regexen.validCashtag = g("(^|#{spaces})(\\$)(#{cashtag})(?\x3d$|\\s|[#{punct}])", "gi");
                        a.txt.regexen.validateUrlUnreserved = /[a-z0-9\-._~]/i;
                        a.txt.regexen.validateUrlPctEncoded = /(?:%[0-9a-f]{2})/i;
                        a.txt.regexen.validateUrlSubDelims = /[!$&'()*+,;=]/i;
                        a.txt.regexen.validateUrlPchar = g("(?:#{validateUrlUnreserved}|#{validateUrlPctEncoded}|#{validateUrlSubDelims}|[:|@])", "i");
                        a.txt.regexen.validateUrlScheme = /(?:[a-z][a-z0-9+\-.]*)/i;
                        a.txt.regexen.validateUrlUserinfo = g("(?:#{validateUrlUnreserved}|#{validateUrlPctEncoded}|#{validateUrlSubDelims}|:)*", "i");
                        a.txt.regexen.validateUrlDecOctet = /(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9]{2})|(?:2[0-4][0-9])|(?:25[0-5]))/i;
                        a.txt.regexen.validateUrlIpv4 = g(/(?:#{validateUrlDecOctet}(?:\.#{validateUrlDecOctet}){3})/i);
                        a.txt.regexen.validateUrlIpv6 = /(?:\[[a-f0-9:\.]+\])/i;
                        a.txt.regexen.validateUrlIp = g("(?:#{validateUrlIpv4}|#{validateUrlIpv6})", "i");
                        a.txt.regexen.validateUrlSubDomainSegment = /(?:[a-z0-9](?:[a-z0-9_\-]*[a-z0-9])?)/i;
                        a.txt.regexen.validateUrlDomainSegment = /(?:[a-z0-9](?:[a-z0-9\-]*[a-z0-9])?)/i;
                        a.txt.regexen.validateUrlDomainTld = /(?:[a-z](?:[a-z0-9\-]*[a-z0-9])?)/i;
                        a.txt.regexen.validateUrlDomain = g(/(?:(?:#{validateUrlSubDomainSegment]}\.)*(?:#{validateUrlDomainSegment]}\.)#{validateUrlDomainTld})/i);
                        a.txt.regexen.validateUrlHost = g("(?:#{validateUrlIp}|#{validateUrlDomain})", "i");
                        a.txt.regexen.validateUrlUnicodeSubDomainSegment = /(?:(?:[a-z0-9]|[^\u0000-\u007f])(?:(?:[a-z0-9_\-]|[^\u0000-\u007f])*(?:[a-z0-9]|[^\u0000-\u007f]))?)/i;
                        a.txt.regexen.validateUrlUnicodeDomainSegment = /(?:(?:[a-z0-9]|[^\u0000-\u007f])(?:(?:[a-z0-9\-]|[^\u0000-\u007f])*(?:[a-z0-9]|[^\u0000-\u007f]))?)/i;
                        a.txt.regexen.validateUrlUnicodeDomainTld = /(?:(?:[a-z]|[^\u0000-\u007f])(?:(?:[a-z0-9\-]|[^\u0000-\u007f])*(?:[a-z0-9]|[^\u0000-\u007f]))?)/i;
                        a.txt.regexen.validateUrlUnicodeDomain = g(/(?:(?:#{validateUrlUnicodeSubDomainSegment}\.)*(?:#{validateUrlUnicodeDomainSegment}\.)#{validateUrlUnicodeDomainTld})/i);
                        a.txt.regexen.validateUrlUnicodeHost = g("(?:#{validateUrlIp}|#{validateUrlUnicodeDomain})", "i");
                        a.txt.regexen.validateUrlPort = /[0-9]{1,5}/;
                        a.txt.regexen.validateUrlUnicodeAuthority = g("(?:(#{validateUrlUserinfo})@)?(#{validateUrlUnicodeHost})(?::(#{validateUrlPort}))?", "i");
                        a.txt.regexen.validateUrlAuthority = g("(?:(#{validateUrlUserinfo})@)?(#{validateUrlHost})(?::(#{validateUrlPort}))?", "i");
                        a.txt.regexen.validateUrlPath = g(/(\/#{validateUrlPchar}*)*/i);
                        a.txt.regexen.validateUrlQuery = g(/(#{validateUrlPchar}|\/|\?)*/i);
                        a.txt.regexen.validateUrlFragment = g(/(#{validateUrlPchar}|\/|\?)*/i);
                        a.txt.regexen.validateUrlUnencoded = g("^(?:([^:/?#]+):\\/\\/)?([^/?#]*)([^?#]*)(?:\\?([^#]*))?(?:#(.*))?$", "i");
                        var z = {
                            urlClass: !0,
                            listClass: !0,
                            usernameClass: !0,
                            hashtagClass: !0,
                            cashtagClass: !0,
                            usernameUrlBase: !0,
                            listUrlBase: !0,
                            hashtagUrlBase: !0,
                            cashtagUrlBase: !0,
                            usernameUrlBlock: !0,
                            listUrlBlock: !0,
                            hashtagUrlBlock: !0,
                            linkUrlBlock: !0,
                            usernameIncludeSymbol: !0,
                            suppressLists: !0,
                            suppressNoFollow: !0,
                            targetBlank: !0,
                            suppressDataScreenName: !0,
                            urlEntities: !0,
                            symbolTag: !0,
                            textWithSymbolTag: !0,
                            urlTarget: !0,
                            invisibleTagAttrs: !0,
                            linkAttributeBlock: !0,
                            linkTextBlock: !0,
                            htmlEscapeNonEntities: !0
                        },
        v = {
            disabled: !0,
            readonly: !0,
            multiple: !0,
            checked: !0
        };
                        a.txt.tagAttrs = function (e) {
                            var d = "", b;
                            for (b in e) {
                                var h = e[b];
                                v[b] && (h = h ? b : null);
                                null != h && (d += " " + a.txt.htmlEscape(b) + '\x3d"' + a.txt.htmlEscape(h.toString()) + '"')
                            }
                            return d
                        };
                        a.txt.linkToText = function (e, d, b, h) {
                            h.suppressNoFollow || (b.rel = "nofollow");
                            h.linkAttributeBlock && h.linkAttributeBlock(e, b);
                            h.linkTextBlock && (d = h.linkTextBlock(e, d));
                            e = {
                                text: d,
                                attr: a.txt.tagAttrs(b)
                            };
                            return r("\x3ca#{attr}\x3e#{text}\x3c/a\x3e", e)
                        };
                        a.txt.linkToTextWithSymbol = function (e, d, b, h, m) {
                            var c = m.symbolTag ? "\x3c" + m.symbolTag + "\x3e" + d + "\x3c/" + m.symbolTag + "\x3e" : d;
                            b = a.txt.htmlEscape(b);
                            b = m.textWithSymbolTag ? "\x3c" + m.textWithSymbolTag + "\x3e" + b + "\x3c/" + m.textWithSymbolTag + "\x3e" : b;
                            return m.usernameIncludeSymbol || !d.match(a.txt.regexen.atSigns) ? a.txt.linkToText(e, c + b, h, m) : c + a.txt.linkToText(e, b, h, m)
                        };
                        a.txt.linkToHashtag = function (e, d, b) {
                            d = d.substring(e.indices[0], e.indices[0] + 1);
                            var h = a.txt.htmlEscape(e.hashtag), m = s(b.htmlAttrs || {});
                            m.href = b.hashtagUrlBase + h;
                            m.title = "#" + h;
                            m["class"] = b.hashtagClass;
                            h[0].match(a.txt.regexen.rtl_chars) && (m["class"] += " rtl");
                            b.targetBlank && (m.target = "_blank");
                            return a.txt.linkToTextWithSymbol(e, d, h, m, b)
                        };
                        a.txt.linkToCashtag = function (e, d, b) {
                            d = a.txt.htmlEscape(e.cashtag);
                            var h = s(b.htmlAttrs || {});
                            h.href = b.cashtagUrlBase + d;
                            h.title = "$" + d;
                            h["class"] = b.cashtagClass;
                            b.targetBlank && (h.target = "_blank");
                            return a.txt.linkToTextWithSymbol(e, "$", d, h, b)
                        };
                        a.txt.linkToMentionAndList = function (e, d, b) {
                            d = d.substring(e.indices[0], e.indices[0] + 1);
                            var h = a.txt.htmlEscape(e.screenName),
            m = a.txt.htmlEscape(e.listSlug),
            c = e.listSlug && !b.suppressLists,
            f = s(b.htmlAttrs || {});
                            f["class"] = c ? b.listClass : b.usernameClass;
                            f.href = c ? b.listUrlBase + h + m : b.usernameUrlBase + h;
                            !c && !b.suppressDataScreenName && (f["data-screen-name"] =
            h);
                            b.targetBlank && (f.target = "_blank");
                            return a.txt.linkToTextWithSymbol(e, d, c ? h + m : h, f, b)
                        };
                        a.txt.linkToUrl = function (e, d, b) {
                            d = e.url;
                            var h = a.txt.htmlEscape(d), m = b.urlEntities && b.urlEntities[d] || e;
                            m.display_url && (h = a.txt.linkTextWithEntity(m, b));
                            var c = s(b.htmlAttrs || {});
                            d.match(a.txt.regexen.urlHasProtocol) || (d = "http://" + d);
                            c.href = d;
                            b.targetBlank && (c.target = "_blank");
                            b.urlClass && (c["class"] = b.urlClass);
                            b.urlTarget && (c.target = b.urlTarget);
                            !b.title && m.display_url && (c.title = m.expanded_url);
                            return a.txt.linkToText(e, h, c, b)
                        };
                        a.txt.linkTextWithEntity = function (e, d) {
                            var b = e.display_url, h = e.expanded_url, c = b.replace(/\u2026/g, "");
                            if (-1 != h.indexOf(c)) {
                                var f = h.indexOf(c), b = {
                                    displayUrlSansEllipses: c,
                                    beforeDisplayUrl: h.substr(0, f),
                                    afterDisplayUrl: h.substr(f + c.length),
                                    precedingEllipsis: b.match(/^\u2026/) ? "\u2026" : "",
                                    followingEllipsis: b.match(/\u2026$/) ? "\u2026" : ""
                                }, g;
                                for (g in b) b.hasOwnProperty(g) && (b[g] = a.txt.htmlEscape(b[g]));
                                b.invisible = d.invisibleTagAttrs;
                                return r("\x3cspan class\x3d'tco-ellipsis'\x3e#{precedingEllipsis}\x3cspan #{invisible}\x3e\x26nbsp;\x3c/span\x3e\x3c/span\x3e\x3cspan #{invisible}\x3e#{beforeDisplayUrl}\x3c/span\x3e\x3cspan class\x3d'js-display-url'\x3e#{displayUrlSansEllipses}\x3c/span\x3e\x3cspan #{invisible}\x3e#{afterDisplayUrl}\x3c/span\x3e\x3cspan class\x3d'tco-ellipsis'\x3e\x3cspan #{invisible}\x3e\x26nbsp;\x3c/span\x3e#{followingEllipsis}\x3c/span\x3e", b)
                            }
                            return b
                        };
                        a.txt.autoLinkEntities = function (e, d, b) {
                            b = s(b || {});
                            b.hashtagClass = b.hashtagClass || "tweet-url hashtag";
                            b.hashtagUrlBase = b.hashtagUrlBase || "https://twitter.com/#!/search?q\x3d%23";
                            b.cashtagClass = b.cashtagClass || "tweet-url cashtag";
                            b.cashtagUrlBase = b.cashtagUrlBase || "https://twitter.com/#!/search?q\x3d%24";
                            b.listClass = b.listClass || "tweet-url list-slug";
                            b.usernameClass = b.usernameClass || "tweet-url username";
                            b.usernameUrlBase = b.usernameUrlBase || "https://twitter.com/";
                            b.listUrlBase = b.listUrlBase || "https://twitter.com/";
                            b.htmlAttrs = a.txt.extractHtmlAttrsFromOptions(b);
                            b.invisibleTagAttrs = b.invisibleTagAttrs || "style\x3d'position:absolute;left:-9999px;'";
                            var h, c, f;
                            if (b.urlEntities) {
                                h = {};
                                c = 0;
                                for (f = b.urlEntities.length; c < f; c++) h[b.urlEntities[c].url] = b.urlEntities[c];
                                b.urlEntities = h
                            }
                            h = "";
                            f = 0;
                            d.sort(function (a, b) {
                                return a.indices[0] - b.indices[0]
                            });
                            var g = b.htmlEscapeNonEntities ? a.txt.htmlEscape : function (a) {
                                return a
                            };
                            for (c = 0; c < d.length; c++) {
                                var l = d[c];
                                h += g(e.substring(f, l.indices[0]));
                                l.url ? h += a.txt.linkToUrl(l, e, b) : l.hashtag ? h += a.txt.linkToHashtag(l, e, b) : l.screenName ? h += a.txt.linkToMentionAndList(l, e, b) : l.cashtag && (h += a.txt.linkToCashtag(l, e, b));
                                f = l.indices[1]
                            }
                            return h += g(e.substring(f, e.length))
                        };
                        a.txt.autoLinkWithJSON = function (e, d, b) {
                            var h = [], c;
                            for (c in d) h = h.concat(d[c]);
                            for (d = 0; d < h.length; d++) entity = h[d], entity.screen_name ? entity.screenName = entity.screen_name : entity.text && (entity.hashtag = entity.text);
                            a.txt.modifyIndicesFromUnicodeToUTF16(e, h);
                            return a.txt.autoLinkEntities(e, h, b)
                        };
                        a.txt.extractHtmlAttrsFromOptions = function (a) {
                            var d = {},
                                b;
                            for (b in a) {
                                var h = a[b];
                                z[b] || (v[b] && (h = h ? b : null), null != h && (d[b] = h))
                            }
                            return d
                        };
                        a.txt.autoLink = function (e, d) {
                            var b = a.txt.extractEntitiesWithIndices(e, {
                                extractUrlsWithoutProtocol: !1
                            });
                            return a.txt.autoLinkEntities(e, b, d)
                        };
                        a.txt.autoLinkUsernamesOrLists = function (e, d) {
                            var b = a.txt.extractMentionsOrListsWithIndices(e);
                            return a.txt.autoLinkEntities(e, b, d)
                        };
                        a.txt.autoLinkHashtags = function (e, d) {
                            var b = a.txt.extractHashtagsWithIndices(e);
                            return a.txt.autoLinkEntities(e, b, d)
                        };
                        a.txt.autoLinkCashtags = function (e, d) {
                            var b = a.txt.extractCashtagsWithIndices(e);
                            return a.txt.autoLinkEntities(e, b, d)
                        };
                        a.txt.autoLinkUrlsCustom = function (e, d) {
                            var b = a.txt.extractUrlsWithIndices(e, {
                                extractUrlsWithoutProtocol: !1
                            });
                            return a.txt.autoLinkEntities(e, b, d)
                        };
                        a.txt.removeOverlappingEntities = function (a) {
                            a.sort(function (a, b) {
                                return a.indices[0] - b.indices[0]
                            });
                            for (var d = a[0], b = 1; b < a.length; b++) d.indices[1] > a[b].indices[0] ? (a.splice(b, 1), b--) : d = a[b]
                        };
                        a.txt.extractEntitiesWithIndices = function (e, d) {
                            var b = a.txt.extractUrlsWithIndices(e,
            d).concat(a.txt.extractMentionsOrListsWithIndices(e)).concat(a.txt.extractHashtagsWithIndices(e, {
                checkUrlOverlap: !1
            })).concat(a.txt.extractCashtagsWithIndices(e));
                            if (0 == b.length) return [];
                            a.txt.removeOverlappingEntities(b);
                            return b
                        };
                        a.txt.extractMentions = function (e) {
                            var d = [];
                            e = a.txt.extractMentionsWithIndices(e);
                            for (var b = 0; b < e.length; b++) d.push(e[b].screenName);
                            return d
                        };
                        a.txt.extractMentionsWithIndices = function (e) {
                            for (var d = [], b = a.txt.extractMentionsOrListsWithIndices(e), h = 0; h < b.length; h++) e = b[h],
            "" == e.listSlug && d.push({
                screenName: e.screenName,
                indices: e.indices
            });
                            return d
                        };
                        a.txt.extractMentionsOrListsWithIndices = function (e) {
                            if (!e || !e.match(a.txt.regexen.atSigns)) return [];
                            var d = [];
                            e.replace(a.txt.regexen.validMentionOrList, function (b, e, c, f, g, l, k) {
                                k.slice(l + b.length).match(a.txt.regexen.endMentionMatch) || (g = g || "", b = l + e.length, d.push({
                                    screenName: f,
                                    listSlug: g,
                                    indices: [b, b + f.length + g.length + 1]
                                }))
                            });
                            return d
                        };
                        a.txt.extractReplies = function (e) {
                            if (!e) return null;
                            e = e.match(a.txt.regexen.validReply);
                            return !e || RegExp.rightContext.match(a.txt.regexen.endMentionMatch) ? null : e[1]
                        };
                        a.txt.extractUrls = function (e, d) {
                            for (var b = [], h = a.txt.extractUrlsWithIndices(e, d), c = 0; c < h.length; c++) b.push(h[c].url);
                            return b
                        };
                        a.txt.extractUrlsWithIndices = function (e, d) {
                            d || (d = {
                                extractUrlsWithoutProtocol: !0
                            });
                            if (!e || (d.extractUrlsWithoutProtocol ? !e.match(/\./) : !e.match(/:/))) return [];
                            for (var b = []; a.txt.regexen.extractUrl.exec(e); ) {
                                var h = RegExp.$2,
                c = RegExp.$3,
                f = RegExp.$5,
                g = RegExp.$7,
                l = a.txt.regexen.extractUrl.lastIndex,
                k =
                l - c.length;
                                if (RegExp.$4) c.match(a.txt.regexen.validTcoUrl) && (c = RegExp.lastMatch, l = k + c.length), b.push({
                                    url: c,
                                    indices: [k, l]
                                });
                                else if (d.extractUrlsWithoutProtocol && !h.match(a.txt.regexen.invalidUrlWithoutProtocolPrecedingChars)) {
                                    var n = null, t = !1, q = 0;
                                    f.replace(a.txt.regexen.validAsciiDomain, function (e) {
                                        var d = f.indexOf(e, q);
                                        q = d + e.length;
                                        n = {
                                            url: e,
                                            indices: [k + d, k + q]
                                        };
                                        (t = e.match(a.txt.regexen.invalidShortDomain)) || b.push(n)
                                    });
                                    null != n && g && (t && b.push(n), n.url = c.replace(f, n.url), n.indices[1] = l)
                                }
                            }
                            return b
                        };
                        a.txt.extractHashtags = function (e) {
                            var d = [];
                            e = a.txt.extractHashtagsWithIndices(e);
                            for (var b = 0; b < e.length; b++) d.push(e[b].hashtag);
                            return d
                        };
                        a.txt.extractHashtagsWithIndices = function (e, d) {
                            d || (d = {
                                checkUrlOverlap: !0
                            });
                            if (!e || !e.match(a.txt.regexen.hashSigns)) return [];
                            var b = [];
                            e.replace(a.txt.regexen.validHashtag, function (e, d, c, h, f, g) {
                                g.slice(f + e.length).match(a.txt.regexen.endHashtagMatch) || (e = f + d.length, b.push({
                                    hashtag: h,
                                    indices: [e, e + h.length + 1]
                                }))
                            });
                            if (d.checkUrlOverlap) {
                                var c = a.txt.extractUrlsWithIndices(e);
                                if (0 < c.length) {
                                    c = b.concat(c);
                                    a.txt.removeOverlappingEntities(c);
                                    for (var b = [], f = 0; f < c.length; f++) c[f].hashtag && b.push(c[f])
                                }
                            }
                            return b
                        };
                        a.txt.extractCashtags = function (e) {
                            var d = [];
                            e = a.txt.extractCashtagsWithIndices(e);
                            for (var b = 0; b < e.length; b++) d.push(e[b].cashtag);
                            return d
                        };
                        a.txt.extractCashtagsWithIndices = function (e) {
                            if (!e || -1 == e.indexOf("$")) return [];
                            var d = [];
                            e.replace(a.txt.regexen.validCashtag, function (a, e, c, f, g, l) {
                                a = g + e.length;
                                d.push({
                                    cashtag: f,
                                    indices: [a, a + f.length + 1]
                                })
                            });
                            return d
                        };
                        a.txt.modifyIndicesFromUnicodeToUTF16 = function (e, d) {
                            a.txt.convertUnicodeIndices(e, d, !1)
                        };
                        a.txt.modifyIndicesFromUTF16ToUnicode = function (e, d) {
                            a.txt.convertUnicodeIndices(e, d, !0)
                        };
                        a.txt.getUnicodeTextLength = function (e) {
                            return e.replace(a.txt.regexen.non_bmp_code_pairs, " ").length
                        };
                        a.txt.convertUnicodeIndices = function (a, d, b) {
                            if (0 != d.length) {
                                var c = 0, f = 0;
                                d.sort(function (a, b) {
                                    return a.indices[0] - b.indices[0]
                                });
                                for (var g = 0, k = d[0]; c < a.length; ) {
                                    if (k.indices[0] == (b ? c : f)) {
                                        var l = k.indices[1] - k.indices[0];
                                        k.indices[0] = b ? f : c;
                                        k.indices[1] = k.indices[0] + l;
                                        g++;
                                        if (g == d.length) break;
                                        k = d[g]
                                    }
                                    l = a.charCodeAt(c);
                                    55296 <= l && (56319 >= l && c < a.length - 1) && (l = a.charCodeAt(c + 1), 56320 <= l && 57343 >= l && c++);
                                    f++;
                                    c++
                                }
                            }
                        };
                        a.txt.splitTags = function (a) {
                            a = a.split("\x3c");
                            for (var d, b = [], c = 0; c < a.length; c += 1)
                                if (d = a[c]) {
                                    d = d.split("\x3e");
                                    for (var f = 0; f < d.length; f += 1) b.push(d[f])
                                } else b.push("");
                            return b
                        };
                        a.txt.hitHighlight = function (e, d, b) {
                            d = d || [];
                            b = b || {};
                            if (0 === d.length) return e;
                            b = b.tag || "em";
                            b = ["\x3c" + b + "\x3e", "\x3c/" + b + "\x3e"];
                            e = a.txt.splitTags(e);
                            var c, f, g = "", k = 0, l = e[0], p = 0, n = 0, t = !1, q = l, s = [], r;
                            for (c = 0; c < d.length; c += 1)
                                for (f = 0; f < d[c].length; f += 1) s.push(d[c][f]);
                            for (d = 0; d < s.length; d += 1) {
                                f = s[d];
                                c = b[d % 2];
                                for (r = !1; null != l && f >= p + l.length; ) g += q.slice(n), t && f === p + q.length && (g += c, r = !0), e[k + 1] && (g += "\x3c" + e[k + 1] + "\x3e"), p += q.length, n = 0, k += 2, q = l = e[k], t = !1;
                                !r && null != l ? (t = f - p, g += q.slice(n, t) + c, n = t, t = 0 === d % 2 ? !0 : !1) : r || (g += c)
                            }
                            if (null != l) {
                                n < q.length && (g += q.slice(n));
                                for (d = k + 1; d < e.length; d += 1) g += 0 === d % 2 ? e[d] : "\x3c" + e[d] + "\x3e"
                            }
                            return g
                        };
                        var w = [k(65534), k(65279), k(65535), k(8234), k(8235), k(8236), k(8237), k(8238)];
                        a.txt.getTweetLength = function (e, d) {
                            d || (d = {
                                short_url_length: 22,
                                short_url_length_https: 23
                            });
                            var b = a.txt.getUnicodeTextLength(e), c = a.txt.extractUrlsWithIndices(e);
                            a.txt.modifyIndicesFromUTF16ToUnicode(e, c);
                            for (var f = 0; f < c.length; f++) b += c[f].indices[0] - c[f].indices[1], b = c[f].url.toLowerCase().match(a.txt.regexen.urlHasHttps) ? b + d.short_url_length_https : b + d.short_url_length;
                            return b
                        };
                        a.txt.isInvalidTweet = function (e) {
                            if (!e) return "empty";
                            if (140 < a.txt.getTweetLength(e)) return "too_long";
                            for (var d = 0; d < w.length; d++)
                                if (0 <= e.indexOf(w[d])) return "invalid_characters";
                            return !1
                        };
                        a.txt.isValidTweetText = function (e) {
                            return !a.txt.isInvalidTweet(e)
                        };
                        a.txt.isValidUsername = function (e) {
                            if (!e) return !1;
                            var d = a.txt.extractMentions(e);
                            return 1 === d.length && d[0] === e.slice(1)
                        };
                        var A = g(/^#{validMentionOrList}$/);
                        a.txt.isValidList = function (a) {
                            a = a.match(A);
                            return !(!a || !("" == a[1] && a[4]))
                        };
                        a.txt.isValidHashtag = function (e) {
                            if (!e) return !1;
                            var d = a.txt.extractHashtags(e);
                            return 1 === d.length && d[0] === e.slice(1)
                        };
                        a.txt.isValidUrl = function (e, d, b) {
                            null == d && (d = !0);
                            null == b && (b = !0);
                            if (!e) return !1;
                            var c = e.match(a.txt.regexen.validateUrlUnencoded);
                            if (!c || c[0] !== e) return !1;
                            e = c[1];
                            var f = c[2],
                g = c[3],
                k = c[4],
                c = c[5];
                            return b && (!p(e, a.txt.regexen.validateUrlScheme) || !e.match(/^https?$/i)) || !p(g, a.txt.regexen.validateUrlPath) || !p(k, a.txt.regexen.validateUrlQuery, !0) || !p(c, a.txt.regexen.validateUrlFragment, !0) ? !1 : d && p(f, a.txt.regexen.validateUrlUnicodeAuthority) || !d && p(f, a.txt.regexen.validateUrlAuthority)
                        };
                        "undefined" != typeof module && module.exports && (module.exports = a.txt);
                        if ("undefined" != typeof window)
                            if (window.twttr)
                                for (var x in a) window.twttr[x] = a[x];
                            else window.twttr = a
                        })();

                        function HelpBubble() {
                            this.isOpen = !1;
                            this.currentParentDivElement = this.bubbleDivElement = null;
                            this.isParentDivHighlighted = !1;
                            this.preferenceConfigOnBubbleClose = this.additionalClass = null;
                            this.currentParentOriginalBorderColor = "transparent";
                            this.hideCloseX = !1;
                            this.TAB_MAP = {
                                invitePeople: {
                                    tabId: "OtherUserProfile_Tab",
                                    contentText: LC.getLabel("whatToDoNext", "showPeopleTabBubble"),
                                    redirectUrl: "/_ui/core/chatter/people/PeopleListPage?displayInviteTip\x3dtrue",
                                    additionalClass: "showPeopleTabBubble"
                                },
                                followPeople: {
                                    tabId: "OtherUserProfile_Tab",
                                    contentText: LC.getLabel("whatToDoNext", "showPeopleTabBubble"),
                                    redirectUrl: "/_ui/core/chatter/people/PeopleListPage?displayFollowTip\x3dtrue",
                                    additionalClass: "showPeopleTabBubble"
                                },
                                createGroup: {
                                    tabId: "CollaborationGroup_Tab",
                                    contentText: LC.getLabel("whatToDoNext", "showGroupsTabBubble"),
                                    redirectUrl: "/_ui/core/chatter/groups/GroupListPage?displayCreateGroupTip\x3dtrue",
                                    additionalClass: "showGroupsTabBubble"
                                },
                                joinGroup: {
                                    tabId: "CollaborationGroup_Tab",
                                    contentText: LC.getLabel("whatToDoNext", "showGroupsTabBubble"),
                                    redirectUrl: "/_ui/core/chatter/groups/GroupListPage?filter\x3dall\x26displayJoinGroupTip\x3dtrue",
                                    additionalClass: "showGroupsTabBubble"
                                },
                                showProfile: {
                                    tabId: "UserProfile_Tab",
                                    contentText: LC.getLabel("whatToDoNext", "showProfileTabBubble"),
                                    redirectUrl: "/_ui/core/userprofile/UserProfilePage",
                                    additionalClass: "showProfileTabBubble"
                                }
                            }
                        }
                        HelpBubble.prototype.getBubbleDivId = function () {
                            return HelpBubble.HELP_BUBBLE
                        };
                        HelpBubble.prototype.getBubbleTextContainerId = function () {
                            return "helpBubbleContent"
                        };
                        HelpBubble.prototype.getBubbleDirectionId = function () {
                            return "helpBubbleDirection"
                        };
                        HelpBubble.prototype.getCloseXId = function () {
                            return "helpBubbleCloseX"
                        };
                        HelpBubble.prototype.hasClass = function (a) {
                            return Sfdc.Dom.hasClass(this.bubbleDivElement, a)
                        };
                        HelpBubble.prototype.resetParentAndBubbleDiv = function () {
                            this.isOpen && (this.isParentDivHighlighted && this.currentParentDivElement && Sfdc.Dom.setStyle(this.currentParentDivElement, HelpBubble.BORDER_COLOR_PROPERTY, this.currentParentOriginalBorderColor), this.additionalClass && (Sfdc.Dom.removeClass(this.bubbleDivElement, this.additionalClass), this.additionalClass = null), this.hideCloseX && (Sfdc.Dom.removeClass(Sfdc.get(this.getCloseXId()), HelpBubble.INVISIBLE_CLASS), this.hideCloseX = !1), this.bubbleUniqueId = this.preferenceConfigOnBubbleClose =
        this.currentParentDivElement = null, this.isOpen = !1)
                        };
                        HelpBubble.prototype.close = function (a) {
                            this.isOpen && (this.hide(), this.preferenceConfigOnBubbleClose && UserContext.userPreferences.setBoolean(this.preferenceConfigOnBubbleClose.preferenceBit, this.preferenceConfigOnBubbleClose.value, function () {
                                a && a()
                            }))
                        };
                        HelpBubble.prototype.hide = function () {
                            this.isOpen && this.fadeOut()
                        };
                        HelpBubble.prototype.fadeIn = function (a) {
                            Sfdc.Effects.fadeIn(this.bubbleDivElement, a)
                        };
                        HelpBubble.prototype.fadeOut = function () {
                            var a = this;
                            Sfdc.Effects.fadeOut(this.bubbleDivElement, function () {
                                a.resetParentAndBubbleDiv()
                            })
                        };
                        HelpBubble.LEFT = {
                            align: "l-r",
                            pointerClass: "left",
                            offset: [25, 0],
                            pointerAlign: "r-l",
                            pointerOffset: [2, 0]
                        };
                        HelpBubble.RIGHT = {
                            align: "r-l",
                            pointerClass: "right",
                            offset: [-25, 0],
                            pointerAlign: "l-r",
                            pointerOffset: [0, 0]
                        };
                        HelpBubble.TOP = {
                            align: "t-b",
                            pointerClass: "top",
                            offset: [0, 16],
                            pointerAlign: "b-t",
                            pointerOffset: [0, 2]
                        };
                        HelpBubble.BOTTOM = {
                            align: "b-t",
                            pointerClass: "bottom",
                            offset: [0, -10],
                            pointerAlign: "t-b",
                            pointerOffset: [0, -4]
                        };
                        HelpBubble.BOTTOMLEFT = {
                            align: "bl-t",
                            pointerClass: "bottom",
                            offset: [-30, -10],
                            pointerAlign: "t-bl",
                            pointerOffset: [30, 0]
                        };
                        HelpBubble.BORDER_COLOR_PROPERTY = "borderColor";
                        HelpBubble.HIGHTLIGHT_BORDER_COLOR = "#FFE5A9";
                        HelpBubble.INVISIBLE_CLASS = "helpBubbleInvisible";
                        HelpBubble.HELP_BUBBLE = "helpBubble";
                        HelpBubble.helpBubble = null;
                        HelpBubble.getElement = function (a) {
                            return Sfdc.get(a) || Sfdc.select(a)[0]
                        };
                        HelpBubble.getTabMap = function () {
                            return HelpBubble.getBubble().TAB_MAP
                        };
                        HelpBubble.hideBubble = function (a) {
                            HelpBubble.isBubblePresent(a) && HelpBubble.getBubble().hide()
                        };
                        HelpBubble.closeBubble = function (a, b) {
                            HelpBubble.isBubblePresent(a) && HelpBubble.getBubble().close(b)
                        };
                        HelpBubble.isBubblePresent = function (a) {
                            return HelpBubble.helpBubble && (!a || HelpBubble.getBubble().hasClass(a))
                        };
                        HelpBubble.display = function (a) {
                            var b = HelpBubble.getElement(a.parentDiv);
                            if (b) {
                                var c = HelpBubble.getBubble();
                                c.resetParentAndBubbleDiv();
                                c.currentParentDivElement = b;
                                if (c.isParentDivHighlighted = a.highLightParentDiv) c.currentParentOriginalBorderColor = Sfdc.Dom.getStyle(b, HelpBubble.BORDER_COLOR_PROPERTY), Sfdc.Dom.setStyle(b, HelpBubble.BORDER_COLOR_PROPERTY, HelpBubble.HIGHTLIGHT_BORDER_COLOR);
                                Sfdc.Dom.updateHTML(c.getBubbleTextContainerId(), a.contentText);
                                var f = c.bubbleDivElement;
                                a.additionalClass && (c.additionalClass = a.additionalClass, Sfdc.Dom.addClass(f, a.additionalClass));
                                c.preferenceConfigOnBubbleClose = a.preferenceConfigOnBubbleClose;
                                var e = a.pointerDirection;
                                LC.isRtlPage() && (a.pointerDirection == HelpBubble.LEFT ? e = HelpBubble.RIGHT : a.pointerDirection == HelpBubble.RIGHT && (e = HelpBubble.LEFT));
                                a.hideCloseX && (Sfdc.Dom.addClass(Sfdc.get(c.getCloseXId()), HelpBubble.INVISIBLE_CLASS), this.hideCloseX = !0);
                                var d = e.offset;
                                a.customExtraOffset && (d = [d[0] + (LC.isRtlPage() ? -a.customExtraOffset[0] : a.customExtraOffset[0]), d[1] + a.customExtraOffset[1]]);
                                Sfdc.Dom.alignTo(f, b, e.align, d);
                                b = Sfdc.get(c.getBubbleDirectionId());
                                a.hidePointer ? Sfdc.Dom.addClass(b, HelpBubble.INVISIBLE_CLASS) : (Sfdc.Dom.removeClass(b, [HelpBubble.LEFT.pointerClass, HelpBubble.RIGHT.pointerClass, HelpBubble.TOP.pointerClass, HelpBubble.BOTTOM.pointerClass, HelpBubble.INVISIBLE_CLASS]), Sfdc.Dom.addClass(b, e.pointerClass), Sfdc.Dom.alignTo(b, f, e.pointerAlign, e.pointerOffset));
                                c.fadeIn(a.fadeInCallBackFn);
                                c.isOpen = !0
                            }
                        };
                        HelpBubble.displayBubble = function (a, b, c, f, e) {
                            HelpBubble.display({
                                parentDiv: a,
                                pointerDirection: b,
                                contentText: c,
                                highLightParentDiv: e,
                                additionalClass: f
                            })
                        };
                        HelpBubble.showTabBubble = function (a) {
                            HelpBubble.display({
                                parentDiv: a.tabId,
                                pointerDirection: HelpBubble.BOTTOM,
                                contentText: a.contentText,
                                fadeInCallBackFn: function () {
                                    navigateToUrl(a.redirectUrl)
                                },
                                additionalClass: a.additionalClass
                            })
                        };
                        HelpBubble.createBubble = function () {
                            var a = new HelpBubble, b = document.createElement("div");
                            b.id = a.getBubbleDivId();
                            b.className = "helpBubbleCommon";
                            var c = [];
                            c.push(Sfdc.String.format('\x3ca id\x3d"{0}" href\x3d"#" class\x3d"closeHelpBubble" onclick\x3d"HelpBubble.getBubble().close();"\x3e', [a.getCloseXId()]));
                            c.push('\x3cimg title\x3d"Close" class\x3d"dialogClose" src\x3d"/s.gif"\x3e');
                            c.push("\x3c/a\x3e");
                            c.push(Sfdc.String.format('\x3cdiv class\x3d"helpBubbleContainer" id\x3d"{0}"\x3e\x3c/div\x3e', [a.getBubbleTextContainerId()]));
                            c.push(Sfdc.String.format('\x3cdiv class\x3d"helpBubblePointer" id\x3d"{0}"/\x3e', [a.getBubbleDirectionId()]));
                            b.innerHTML = c.join("");
                            document.body.appendChild(b);
                            a.bubbleDivElement = b;
                            return a
                        };
                        HelpBubble.getBubble = function () {
                            var a = HelpBubble.helpBubble;
                            a || (a = HelpBubble.createBubble(), HelpBubble.helpBubble = a);
                            return a
                        };
                        HelpBubble.getHelpTextWithTitleAndLink = function (a, b, c, f) {
                            a = Sfdc.String.format("\x3cdiv class\x3d'helpBubbleTitle'\x3e{0}\x3c/div\x3e\x3cp\x3e{1}\x3c/p\x3e", [a, b]);
                            c = Sfdc.String.format('\x3ca href\x3d"{0}"\x3e{1}\x3c/a\x3e', [f, c]);
                            return a + c
                        };
                        HelpBubble.showWhatAreGuestsBubble = function (a) {
                            a = HelpBubble.getHelpTextWithTitleAndLink(LC.getLabel("onboarding", "whatAreGuestsMsgTitle"), LC.getLabel("onboarding", "whatAreGuestsMsgText"), LC.getLabel("onboarding", "whatAreGuestsMsgOnlineHelpText"), a);
                            HelpBubble.display({
                                parentDiv: "allowGuests",
                                pointerDirection: HelpBubble.LEFT,
                                contentText: a,
                                additionalClass: "widerHelpBubble",
                                preferenceConfigOnBubbleClose: {
                                    preferenceBit: "HideWhatAreGuestsMsg",
                                    value: !0
                                }
                            })
                        };
                        HelpBubble.getHelpTitleWithNew = function (a) {
                            return Sfdc.String.format("\x3cdiv class\x3d'helpBubbleTitle'\x3e\x3cspan class\x3d'new'\x3e{0}\x3c/span\x3e {1}\x3c/div\x3e", [LC.getLabel("Global", "exciting_and_new"), a])
                        };
                        HelpBubble.showQueueHelpBubble = function (a, b) {
                            var c = HelpBubble.getHelpTitleWithNew(LC.getLabel("QueueCallouts", "bubbleTitle")),
        f = Sfdc.String.format('\x3ca id\x3d"{0}" href\x3d"{1}"\x3e{2}\x3c/a\x3e', [BaseAssociationConstants.HELP_LINK_ID, a, LC.getLabel("QueueCallouts", "bubbleOnlineHelpText")]),
        e = Sfdc.String.format('\x3ca id\x3d"{0}" href\x3d"{1}"\x3e{2}\x3c/a\x3e', [BaseAssociationConstants.VIDEO_LINK_ID, b, LC.getLabel("QueueCallouts", "bubbleVideoLinkText")]),
        f = LC.getLabel("QueueCallouts", "queueHelpBubble", f, e),
        d = Sfdc.select("div#queueTabs ul\x3eli"),
        d = (e = 0 < d.length) ? d[d.length - 1] : "input[name\x3d'save']",
        g = [];
                            g.push(c);
                            g.push(f);
                            HelpBubble.display({
                                parentDiv: d,
                                pointerDirection: e ? HelpBubble.LEFT : HelpBubble.RIGHT,
                                contentText: g.join(""),
                                additionalClass: "queueHelpBubble",
                                preferenceConfigOnBubbleClose: {
                                    preferenceBit: "HideAssociationQueueCallout",
                                    value: !0
                                },
                                hidePointer: !0
                            })
                        };
                        HelpBubble.showInfluenceHelpBubble = function (a) {
                            var b = Sfdc.String.format("\x3cdiv class\x3d'helpBubbleTitle'\x3e{0}\x3c/div\x3e{1}", a ? [LC.getLabel("Influence", "otherUserNotStarted_0", a), LC.getLabel("Influence", "otherUserNotStarted_1", a)] : [LC.getLabel("Influence", "selfNotStarted_0"), LC.getLabel("Influence", "selfNotStarted_1")]);
                            HelpBubble.display({
                                parentDiv: "influenceBox",
                                pointerDirection: HelpBubble.LEFT,
                                contentText: b,
                                additionalClass: "influenceHelpBubble",
                                customExtraOffset: [-15, 0],
                                preferenceConfigOnBubbleClose: {
                                    preferenceBit: a ? "HideOtherInfluenceGetStarted" : "HideSelfInfluenceGetStarted",
                                    value: !0
                                }
                            })
                        };
                        HelpBubble.showEnhancedProfileHelpBubble = function (a) {
                            a = LC.getLabel("UserProfilePage", "WelcomeText", a);
                            HelpBubble.display({
                                parentDiv: "profileTabSetHeader",
                                pointerDirection: HelpBubble.TOP,
                                contentText: a,
                                additionalClass: "enhancedProfileHelpBubble",
                                customExtraOffset: [-280, 10],
                                preferenceConfigOnBubbleClose: {
                                    preferenceBit: "HideEnhancedProfileHelpBubble",
                                    value: !0
                                }
                            })
                        };
                        HelpBubble.showDomainOverflowHelpBubble = function (a, b) {
                            HelpBubble.display({
                                parentDiv: a,
                                pointerDirection: HelpBubble.TOP,
                                hidePointer: !0,
                                contentText: b,
                                additionalClass: "domainOverflowHelpBubble",
                                customExtraOffset: [0, -8]
                            })
                        };
                        HelpBubble.showSmartSearchBubble = function (a) {
                            var b = HelpBubble.getHelpTitleWithNew(LC.getLabel("SmartSearchOneTimeCallOut", "title")),
        c = '\x3cli class\x3d"smartSearchCallOutFeeds"\x3e\x3cimg alt\x3d\'' + LC.getLabel("Page_UnifiedSearch", "feedsToggleLabel") + "' src\x3d'/s.gif' /\x3e\x3cspan\x3e" + LC.getLabel("SmartSearchOneTimeCallOut", "chatterFeeds") + "\x3c/span\x3e\x3c/li\x3e",
        f = '\x3cli class\x3d"smartSearchCallOutResults"\x3e\x3cimg alt\x3d\'' + LC.getLabel("Page_UnifiedSearch", "recordsToggleLabel") + "' src\x3d'/s.gif' /\x3e\x3cspan\x3e" +
        LC.getLabel("SmartSearchOneTimeCallOut", "orderedResults") + "\x3c/span\x3e\x3c/li\x3e",
        e = '\x3cli class\x3d"smartSearchCallOutPinning"\x3e\x3cimg alt\x3d\'' + LC.getLabel("Page_UnifiedSearch", "pinAlt") + "' src\x3d'/s.gif' /\x3e\x3cspan\x3e" + LC.getLabel("SmartSearchOneTimeCallOut", "pinning") + "\x3c/span\x3e\x3c/li\x3e";
                            a = "\x3cdiv class\x3d'smartSearchCallOutSeeMore'\x3e" + String.format('\x3ca href\x3d"{0}" id\x3d"smartSearchOneTimeCallOutLink"\x3e{1}\x3c/a\x3e', a, LC.getLabel("SmartSearchOneTimeCallOut", "tellMeMore")) +
        "\x3cdiv style\x3d'clear:both'\x3e\x3c/div\x3e\x3c/div";
                            var d = [];
                            d.push(b);
                            d.push('\x3cul class\x3d"smartSearchCallOutList"\x3e');
                            d.push(c);
                            d.push(f);
                            d.push(e);
                            d.push("\x3c/ul\x3e");
                            d.push(a);
                            HelpBubble.display({
                                parentDiv: SfdcApp.Search.Sidetabs.RECORD_TOGGLE_ID,
                                pointerDirection: HelpBubble.LEFT,
                                contentText: d.join(""),
                                additionalClass: "smartSearchCallOut",
                                customExtraOffset: [0, -20],
                                preferenceConfigOnBubbleClose: {
                                    preferenceBit: "HideSmartSearchCallOut",
                                    value: !0
                                }
                            })
                        };
                        Sfdc.ns("Sfdc.AccessibleFileSyncMobileDownloadDialog");
                        Sfdc.AccessibleFileSyncMobileDownloadDialog = function (a) {
                            Sfdc.BaseAccessibleFileDialog.call(this, a);
                            this.id = a.id;
                            this.title = unescape(a.title)
                        };
                        Sfdc.AccessibleFileSyncMobileDownloadDialog.prototype = new Sfdc.BaseAccessibleFileDialog({});
                        Sfdc.AccessibleFileSyncMobileDownloadDialog.ID = "AccessibleFileSyncMobileDownloadDialog";
                        Sfdc.AccessibleFileSyncMobileDownloadDialog.DATA_LOAD_URL = "/file/filesyncmobiledownload/";
                        Sfdc.AccessibleFileSyncMobileDownloadDialog.open = function () {
                            var a = Sfdc.AccessibleFileSyncMobileDownloadDialog.ID,
        b = sfdcPage.getDialogById(a),
        a = {
            id: a,
            title: LC.getLabel("FileSyncMobileDownload", "fileSyncMobileDownloadLabel")
        };
                            b || (b = new Sfdc.AccessibleFileSyncMobileDownloadDialog(a), b.width = 450, b.register());
                            a = Sfdc.AccessibleFileSyncMobileDownloadDialog.DATA_LOAD_URL;
                            chatter.getToolbox().post({
                                url: a,
                                success: function (a, c) {
                                    b.content = c.html;
                                    b.display()
                                }
                            })
                        };
                        Sfdc.AccessibleFileSyncMobileDownloadDialog.prototype.getContent = function () {
                            return this.content
                        };
                        Sfdc.ns("Sfdc.AccessibleFileSyncSetupDialog");
                        Sfdc.AccessibleFileSyncSetupDialog = function (a) {
                            Sfdc.BaseAccessibleFileDialog.call(this, a);
                            this.id = a.id;
                            this.title = unescape(a.title)
                        };
                        Sfdc.AccessibleFileSyncSetupDialog.prototype = new Sfdc.BaseAccessibleFileDialog({});
                        Sfdc.AccessibleFileSyncSetupDialog.ID = "accessibleFileSyncSetupDialog";
                        Sfdc.AccessibleFileSyncSetupDialog.DATA_LOAD_URL = "/file/filesyncsetup/";
                        Sfdc.AccessibleFileSyncSetupDialog.open = function () {
                            var a = Sfdc.AccessibleFileSyncSetupDialog.ID,b = sfdcPage.getDialogById(a),a = {
                                id: a,
                                title: LC.getLabel("FileSyncOnBoard", "downloadChatterboxTitle")
                            };
                            b || (b = new Sfdc.AccessibleFileSyncSetupDialog(a), b.width = 750, b.register());
                            a = Sfdc.AccessibleFileSyncSetupDialog.DATA_LOAD_URL;
                            chatter.getToolbox().post({
                                url: a,
                                success: function (a, c) {
                                    b.content = c.html;
                                    b.display();
                                    var d = Util.evalAjaxServletOutput(c.config) || {};
                                    Sfdc.FileSyncOnboardSetup.fileSyncOnboardSetupInit(!1, d)
                                }
                            })
                        };
                        Sfdc.AccessibleFileSyncSetupDialog.prototype.getContent = function () {
                            return this.content
                        };
                        Sfdc.ns("Sfdc.AccessibleMultiUploadFilesDialog");
                        Sfdc.AccessibleMultiUploadFilesDialog = function (a, b) {
                            Sfdc.BaseAccessibleFileDialog.call(this, {
                                id: a,
                                useCSS: !0,
                                extraClass: "multiUploadFilesDialog"
                            });
                            this.id = a;
                            this.content = "";
                            this.height = 500;
                            this.width = 590;
                            this.filterParentId = b.filterParentId;
                            this.uploaderOrigin = b.uploaderOrigin;
                            this.title = Sfdc.AccessibleMultiUploadFilesDialog.getDialogTitle(this, b.parentEntityName)
                        };
                        Ext.extend(Sfdc.AccessibleMultiUploadFilesDialog, Sfdc.BaseAccessibleFileDialog);
                        Sfdc.AccessibleMultiUploadFilesDialog.prototype.getContent = function () {
                            return this.content
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID = "chatterFilesMultiUploadDialog";
                        Sfdc.AccessibleMultiUploadFilesDialog.DRAG_AND_DROP_TARGET_DIV_ID = "dragAndDropTargetDiv";
                        Sfdc.AccessibleMultiUploadFilesDialog.uploadFileDialog = null;
                        Sfdc.AccessibleMultiUploadFilesDialog.uploader = null;
                        Sfdc.AccessibleMultiUploadFilesDialog.XPATH_CHATTER_PAGE_FILES_LIST = "#mainNavigation .primaryNavList .fileListView";
                        Sfdc.AccessibleMultiUploadFilesDialog.XPATH_CHATTER_PAGE_FILESYNC_LIST = "#mainNavigation .primaryNavList .fileSync";
                        Sfdc.AccessibleMultiUploadFilesDialog.loadForm = function (a, b) {                            
                            var c = sfdcPage.getDialogById(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID);
                            c ? b(c) : chatter.getToolbox().get({
                                url: "/chatterfilemultiuploadform",
                                success: function (d, f) {                                    
                                    c = new Sfdc.AccessibleMultiUploadFilesDialog(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID, a);
                                    c.content = "\x3cdiv id\x3dcontentPublisherSlideDown\x3e" + f.html + "\x3c/div\x3e";
                                    c.created = !0;
                                    c.register();
                                    b && b(c)
                                }
                            })
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.prototype.position = function () {
                            if (this.dialog) {
                                var a = this.dialog.style;
                                a.marginTop = -0.5 * this.dialog.offsetHeight + "px";
                                LC && LC.isRtlPage() ? a.marginRight = -0.5 * this.dialog.offsetWidth + "px" : a.marginLeft = -0.5 * this.dialog.offsetWidth + "px"
                            }
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.getDialogTitle = function (a, b) {
                            if (a.uploaderOrigin === Sfdc.ChatterFileUploader.GROUP_PAGE) return LC.getLabel("ChatterFileMultiUpload", "uploadTo", b);
                            if (a.uploaderOrigin === Sfdc.ChatterFileUploader.PROFILE_PAGE) return LC.getLabel("ChatterFileMultiUpload", "uploadToProfile", b);
                            var c = LC.getLabel("ChatterFilesTabPage", "myFilesLabel");
                            if (Sfdc.ChatterFileUploader.isFileSync) var c = Sfdc.get("folderNavigationMutton"),d = Sfdc.get("folderNavigationMuttonDropDownElement"), c = c && "none" !== c.style.display && d ? d.getAttribute("title") : LC.getLabel("ChatterFilesTabPage", "myChatterbox");
                            return LC.getLabel("ChatterFileMultiUpload", "uploadTo", c)
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.getGroupFileListUrl = function (a) {
                            return chatter.getToolbox().sitePrefix() + "/_ui/core/chatter/content/GroupFileListPage?g\x3d" + a
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.getUserFileListUrl = function (a) {
                            return chatter.getToolbox().sitePrefix() + "/_ui/core/chatter/content/UserFileListPage?u\x3d" + a
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.getFileTabUrl = function (a) {
                            return chatter.getToolbox().sitePrefix() + "/_ui/core/chatter/files/FileTabPage?f\x3d" + a
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.open = function (a) {
                            var b = sfdcPage.getDialogById(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID);
                            Sfdc.MultiFileUploaderUtil.checkFileSyncOption();
                            if (b) {
                                var c = Sfdc.AccessibleMultiUploadFilesDialog.getDialogTitle(b), d = Sfdc.get(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID + "Title");
                                Sfdc.Dom.setText(d, c);
                                Sfdc.AccessibleMultiUploadFilesDialog.init(b, a)
                            } else Sfdc.AccessibleMultiUploadFilesDialog.loadForm(a, function (b) {
                                Sfdc.AccessibleMultiUploadFilesDialog.init(b, a)
                            })
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.init = function (a, b) {
                            if (!0 !== b.displayDDTargetIcon || Sfdc.ChatterFileUploader.dragAndDropZone.isDragAndDropInProgress()) a.config = b, a.show(), Sfdc.get("uploadingStatusInfo").innerHTML = LC.getLabel("ChatterFileMultiUpload", "prepareToUpload"), Sfdc.Dom.show(Sfdc.get("overallProgress")), Sfdc.get("overallProgress").childNodes.item(0).style.width = 0, Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadSharingSettingsBtn")), !0 === b.displayDDTargetIcon ? Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon(!0) : Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon(!1),
        Sfdc.AccessibleMultiUploadFilesDialog.uploader = a.uploaderOrigin === Sfdc.ChatterFileUploader.GROUP_PAGE || a.uploaderOrigin === Sfdc.ChatterFileUploader.PROFILE_PAGE ? Sfdc.ChatterFileUploader.createInstance(b, a.filterParentId) : Sfdc.ChatterFileUploader.createInstance(b), Sfdc.Dom.show(Sfdc.get("multiUploadCancelRemainingBtn")), Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadCloseBtn")), a.uploaderOrigin === Sfdc.ChatterFileUploader.PUBLISHER && (Sfdc.Dom.setStyle(Sfdc.get("multiUploadCancelUploadBtn"), "display", "inline-block"),
            Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadCancelRemainingBtn")), Sfdc.Dom.hideByDisplay(Sfdc.get("multiUploadCloseBtn")))
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.closeIt = function (a) {
                            var b = sfdcPage.getDialogById(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID);
                            b && b.cancel(a)
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.cancelIt = function () {
                            var a = sfdcPage.getDialogById(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID);
                            a && (a.config.customHandlers && a.config.customHandlers.cancelHandler && a.config.customHandlers.cancelHandler(), a.cancel(!0))
                        };
                        Sfdc.AccessibleMultiUploadFilesDialog.prototype.cancel = function (a) {
                            if (0 < Sfdc.AccessibleMultiUploadFilesDialog.uploader.filesInProgress) this.uploaderOrigin === Sfdc.ChatterFileUploader.PUBLISHER ? (this.config.customHandlers && this.config.customHandlers.cancelHandler && this.config.customHandlers.cancelHandler(), Sfdc.BaseAccessibleFileDialog.prototype.cancel.call(this)) : Sfdc.MultiUploadCancelRemainingConfirmDialog.open();
                            else if (Sfdc.BaseAccessibleFileDialog.prototype.cancel.call(this), !(!0 === a || 0 == Sfdc.AccessibleMultiUploadFilesDialog.uploader.filesCompleted) &&  Sfdc.AccessibleMultiUploadFilesDialog.uploader.filesCompleted === Sfdc.AccessibleMultiUploadFilesDialog.uploader.filesSelected)
                                if (this.uploaderOrigin === Sfdc.ChatterFileUploader.GROUP_PAGE) window.location = Sfdc.AccessibleMultiUploadFilesDialog.getGroupFileListUrl(this.filterParentId);
                                else if (this.uploaderOrigin === Sfdc.ChatterFileUploader.PROFILE_PAGE) window.location = Sfdc.AccessibleMultiUploadFilesDialog.getUserFileListUrl(this.filterParentId);
                                else if (this.uploaderOrigin === Sfdc.ChatterFileUploader.CHATTER_FILE_PAGE) {
                                    if (a = Sfdc.select(Sfdc.AccessibleMultiUploadFilesDialog.XPATH_CHATTER_PAGE_FILES_LIST), 0 === a.length && (a = Sfdc.select(Sfdc.AccessibleMultiUploadFilesDialog.XPATH_CHATTER_PAGE_FILESYNC_LIST)), a = a[0])
                                        if ("undefined" === typeof Sfdc.ChatterFileUploader.isFileSync || !Sfdc.ChatterFileUploader.isFileSync) (a = Sfdc.get("myFilesLinkInChatterTab", Sfdc.get(a))) && Sfdc.Event.fireEvent(a, "click");
                                        else if (a = Sfdc.get("chatterboxFilesLinkInChatterTab")) {
                                            var b = Sfdc.get("folderNavigationMutton");
                                            b ? (a = b.getAttribute("data-contentsfdc-currentfolderid")) &&  chatter.getChatterTab().refresh("ListViews", {
                    type: "file",
                    filter: "fs",
                    fldr: a
                }) : Sfdc.Event.fireEvent(a, "click")
                                        }
                                } else a = "undefined" === typeof Sfdc.ChatterFileUploader.isFileSync || !Sfdc.ChatterFileUploader.isFileSync ? Sfdc.AccessibleMultiUploadFilesDialog.getFileTabUrl(UserContext.userId) : this.config.fldr ? "/" + this.config.fldr : Sfdc.AccessibleMultiUploadFilesDialog.getFileTabUrl(UserContext.userId) + "\x26fs\x3dtrue", window.location = a
                            };
                            Sfdc.AccessibleMultiUploadFilesDialog.isOpened = function () {
                                var a = sfdcPage.getDialogById(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID);
                                return a && a.isOpen
                            };
                            Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon = function (a) {
                                var b = '\x3cdiv id\x3d"' + Sfdc.AccessibleMultiUploadFilesDialog.DRAG_AND_DROP_TARGET_DIV_ID + '" class\x3d"' + Sfdc.AccessibleMultiUploadFilesDialog.DRAG_AND_DROP_TARGET_DIV_ID + '"\x3e\x3cdiv class\x3d"dragAndDropTargetImg"\x3e\x3c/div\x3e\x3cdiv class\x3d"dragAndDropTargetTextDiv"\x3e' + LC.getLabel("ChatterFileMultiUpload", "dropFiles") + "\x3c/div\x3e\x3c/div\x3e", c = document.getElementById(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID);
                                if (c && c.childNodes) {
                                    for (var d = c.childNodes, f = !1, g = 0; g < d.length; g++) {
                                        var e = d[g];
                                        Sfdc.Dom.hasClass(e, Sfdc.AccessibleMultiUploadFilesDialog.DRAG_AND_DROP_TARGET_DIV_ID) ? (!1 !== a ? Sfdc.Dom.removeClass(e, "hidden") : Sfdc.Dom.addClass(e, "hidden"), f = !0) : !1 !== a ? Sfdc.Dom.addClass(e, "hidden") : Sfdc.Dom.removeClass(e, "hidden")
                                    }
                                    f || (b = Sfdc.MultiFileUploaderUtil.createElementFromHTML(b), c.appendChild(b), !1 === a && Sfdc.Dom.addClass(b, "hidden"));
                                    Sfdc.Function.delay(function () {
                                        sfdcPage.getDialogById(Sfdc.AccessibleMultiUploadFilesDialog.UPLOAD_FILE_DIALOG_ID).position()
                                    }, 10)
                                }
                            };
                            Sfdc.ns("Sfdc.BaseAccessibleFileListDialog");
                            Sfdc.BaseAccessibleFileListDialog = function (a) {
                                Sfdc.BaseAccessibleFileDialog.call(this, a);
                                this.id = a.id;
                                this.title = unescape(a.title);
                                this.dataLoadUrl = a.dataLoadUrl;
                                this.docId = a.docId;
                                this.height = a.height;
                                this.content = "";
                                this.width = 0;
                                this.background = Sfdc.select(".overlayBackground")[0]
                            };
                            Ext.extend(Sfdc.BaseAccessibleFileListDialog, Sfdc.BaseAccessibleFileDialog);
                            Sfdc.BaseAccessibleFileListDialog.prototype.getContent = function () {
                                return this.content
                            };
                            Sfdc.BaseAccessibleFileListDialog.prototype.open = function (a) {
                                this.loadList(a)
                            };
                            Sfdc.BaseAccessibleFileListDialog.prototype.loadList = function (a) {
                                var c = this.dataLoadUrl + this.docId, b = this;
                                a = a || {};
                                chatter.getToolbox().get({
                                    url: c,
                                    params: a,
                                    success: function (a, d) {
                                        b.updateContent(d);
                                        b.callback && b.callback(c, d)
                                    }
                                })
                            };
                            Sfdc.BaseAccessibleFileListDialog.prototype.updateContent = function (a) {
                                this.content = a.html;
                                this.display()
                            };
                            Sfdc.BaseAccessibleFileListDialog.prototype.nextPage = function (a, c, b) {
                                (a = sfdcPage.getDialogById(this.id)) && a.loadList({
                                    p: b + 1
                                })
                            };
                            Sfdc.BaseAccessibleFileListDialog.prototype.prevPage = function (a, c, b) {
                                (a = sfdcPage.getDialogById(this.id)) && a.loadList({
                                    p: b - 1
                                })
                            };
                            Sfdc.BaseAccessibleFileListDialog.closeDialog = function (a) {
                                return (Sfdc.BaseAccessibleFileDialog.prototype.isInAccessibilityMode() ? window.opener ? window.opener : window.parent : window).sfdcPage.getDialogById(a).cancel()
                            };
                            Sfdc.BaseAccessibleFileListDialog.prototype.hook_cancel = function () {
                                var a = Sfdc.BaseAccessibleFileDialog.getDialogById(this.id);
                                a && a.refreshPage && location.reload(!0)
                            };
                            Sfdc.ns("Sfdc.ScriptLoader");
                            Sfdc.ScriptLoader = function () {
                                return {
                                    loadScript: function (a, b) {
                                        if (a) {
                                            var c = document.getElementsByTagName("head")[0], e = document.createElement("script");
                                            e.type = "text/javascript";
                                            e.src = a;
                                            b && (e.onload = b, e.onreadystatechange = function () {
                                                if ("loaded" == e.readyState || "complete" == e.readyState) e.onreadystatechange = null, b()
                                            });
                                            c.appendChild(e)
                                        } else b && b()
                                    }
                                }
                            } ();
                            Sfdc.ns("Sfdc.AccessibleFilePublishToLibraryDialog");
                            Sfdc.AccessibleFilePublishToLibraryDialog = function (a) {
                                Sfdc.BaseAccessibleFileDialog.call(this, a);
                                this.id = a.id;
                                this.title = unescape(a.title);
                                this.dataLoadUrl = a.dataLoadUrl;
                                this.verId = a.verId;
                                this.height = a.height;
                                this.content = "";
                                this.width = 820;
                                this.WorkspacesInfo = {}
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype = new Sfdc.BaseAccessibleFileDialog({});
                            Sfdc.AccessibleFilePublishToLibraryDialog.ID = "FilePublishToLibraryDialog";
                            Sfdc.AccessibleFilePublishToLibraryDialog.TAG_UNRESTRICTED = "U";
                            Sfdc.AccessibleFilePublishToLibraryDialog.TAG_GUIDED = "G";
                            Sfdc.AccessibleFilePublishToLibraryDialog.TAG_RESTRICTED = "R";
                            Sfdc.AccessibleFilePublishToLibraryDialog.TAG_FANCY_INPUT_ID = "tag_input_fancy";
                            Sfdc.AccessibleFilePublishToLibraryDialog.CURRENT_TAGS_INPUT_VALUES = {};
                            Sfdc.AccessibleFilePublishToLibraryDialog.showDialog = function (a) {
                                Perf.mark("Sfdc.AccessibleFilePublishToLibraryDialog.showDialog");
                                var b = sfdcPage.getDialogById(Sfdc.AccessibleFilePublishToLibraryDialog.ID);
                                if (!b) {
                                    var c = {
                                        id: Sfdc.AccessibleFilePublishToLibraryDialog.ID,
                                        title: LC.getLabel("ChatterFilePublishOverlay", "overlayTitle"),
                                        dataLoadUrl: "/file/publishToLibrary/",
                                        verId: a[ChatterFilesConstants.FILE_CONFIG_KEY_VERID],
                                        height: 650
                                    }, b = new Sfdc.AccessibleFilePublishToLibraryDialog(c);
                                    b.register()
                                }
                                b.verId = a[ChatterFilesConstants.FILE_CONFIG_KEY_VERID];
                                a = b.dataLoadUrl + b.verId;
                                chatter.getToolbox().get({
                                    url: a,
                                    params: {},
                                    success: function (a, c) {
                                        Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.showDialog");
                                        b.updateContent(c);
                                        Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.showDialog");
                                        b.initPublishInputElements();
                                        Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.showDialog");
                                        if (c.wsId && (b.populateWorkspaceInfo(c), Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.showDialog"), Sfdc.get("toWid").value =
                    c.wsId, c.existingTags && c.existingTags.length && 0 < c.existingTags.length)) {
                                            for (var d = 0; d < c.existingTags.length; d++) Sfdc.TagAutoCompleteElement.addTagToList(c.existingTags[d]);
                                            Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.showDialog")
                                        }
                                        if (c.customFieldsHtml) {
                                            b.processCustomFieldsJson(c);
                                            if (c.toRecTypeId && (d = Sfdc.get("toTid"))) d.value = c.toRecTypeId;
                                            d = Sfdc.get("publishToLibBtn");
                                            chatter.getToolbox().enableButton(d);
                                            Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.showDialog")
                                        }
                                    }
                                })
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.getContent = function () {
                                return this.content
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.togglePublishProgressDialog = function (a) {
                                var b = Sfdc.get(Sfdc.AccessibleFilePublishToLibraryDialog.ID),        c = chatter.getToolbox().htmlEncode(Sfdc.get("publish_file_name").value),        c = PublishToLibraryProgressDialog.getDialog("publishToLibProgressDialog", c);
                                a ? (Sfdc.Dom.setStyle(b, "display", "none"), c.show()) : (Sfdc.Dom.setStyle(b, "display", "block"), c.hide())
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.updateContent = function (a) {
                                this.content = a.html;
                                this.display()
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.initPublishInputElements = function () {
                                var a = new Sfdc.TagAutoCompleteElement({
                                    elementId: Sfdc.AccessibleFilePublishToLibraryDialog.TAG_FANCY_INPUT_ID,
                                    inDialog: !0,
                                    fixedACYPosition: 0,
                                    handleBlur: function () {
                                        this.clearSuggestions();
                                        this.displayGhostText()
                                    }
                                });
                                this.tagAC = a;
                                var b = Sfdc.get(Sfdc.AccessibleFilePublishToLibraryDialog.TAG_FANCY_INPUT_ID);
                                b.onkeyup = function (c) {
                                    var f = c || window.event;
                                    b.setAttribute("size", b.value.length + 2);
                                    f.keyCode === KEY_COMMA && !c.shiftKey && (Sfdc.Event.stopPropogation(f), b.focus());
                                    a.acBox && (a.acBox.setStyle("top", a.getACYPosition() + "px"), b.focus())
                                };
                                Sfdc.on(b, "keypress", function (a) {
                                    a = a || window.event;
                                    a = a.keyCode || a.charCode;
                                    return 44 === a || a === KEY_ENTER ? !1 : !0
                                });
                                var c = Sfdc.get("publishFancyTagsList");
                                Sfdc.on(c, "click", function () {
                                    b.focus()
                                })
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.setPublishButtonState = function () {
                                var a = Sfdc.get("publishToLibBtn");
                                this.validateBasicSelections() ? chatter.getToolbox().enableButton(a) : chatter.getToolbox().disableButton(a)
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.getWorkspaceInfo = function () {
                                var a = Sfdc.get("publishOverlayWorkspaceSelection").value, b = Sfdc.get("publishOverlayContentTypeSelection");
                                b.options.length = 0;
                                b.disabled = !0;
                                b = Sfdc.get("publishAsUserSelection");
                                b.options.length = 0;
                                b.disabled = !0;
                                Sfdc.Dom.hideByDisplay(Sfdc.get("asUserRow"));
                                Sfdc.Dom.hideByDisplay(Sfdc.get("fileTagRow"));
                                (b = Sfdc.get("contentTypeRow")) && Sfdc.Dom.hideByDisplay(b);
                                this.cleanupAndHideCustomFields();
                                this.setPublishButtonState();
                                if (!(0 === Sfdc.get("publishOverlayWorkspaceSelection").selectedIndex || "" === a))
                                    if (this.WorkspaceInfo && this.WorkspaceInfo[a]) this.populateWorkspaceInfo(this.WorkspaceInfo(a));
                                    else {
                                        a = "/file/workspaceInfo/" + a;
                                        params = {};
                                        var c = this;
                                        chatter.getToolbox().get({
                                            url: a,
                                            params: params,
                                            success: function (a, b) {
                                                c.WorkspacesInfo[b.wsId] = b;
                                                c.populateWorkspaceInfo(b);
                                                if (b.customFieldsHtml) {
                                                    c.processCustomFieldsJson(b);
                                                    if (b.toRecTypeId) {
                                                        var d = Sfdc.get("toTid");
                                                        d && (d.value = b.toRecTypeId)
                                                    }
                                                    d = Sfdc.get("publishToLibBtn");
                                                    chatter.getToolbox().enableButton(d)
                                                }
                                            }
                                        })
                                    }
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.populateWorkspaceInfo = function (a) {
                                this.currentWorkspaceInfo = a;
                                var b = Sfdc.get("publishOverlayContentTypeSelection");
                                if (b && a.contentTypes && a.contentTypes.length) {
                                    b.disabled = !1;
                                    for (var c = 0; c < a.contentTypes.length; c++) {
                                        var e = new Option(a.contentTypes[c].name, a.contentTypes[c].id);
                                        a.contentTypes[c].selected && (e.selected = !0, b.selectedIndex = c);
                                        b.options.add(e)
                                    }
                                }
                                Sfdc.Dom.show(Sfdc.get("asUserRow"));
                                Sfdc.Dom.show(Sfdc.get("fileTagRow"));
                                (c = Sfdc.get("contentTypeRow")) && Sfdc.Dom.show(c);
                                this.tagAC.initWithNewData(a);
                                if (a.publishOnBehaveOf) {
                                    b = Sfdc.get("publishAsUserSelection");
                                    if (a.possibleAuthors && a.possibleAuthors.length)
                                        for (c = 0; c < a.possibleAuthors.length; c++) e = new Option(a.possibleAuthors[c].name, a.possibleAuthors[c].id), a.possibleAuthors[c].selected && (e.selected = !0), b.options.add(e);
                                    Sfdc.Dom.show(Sfdc.get("asUserRow"));
                                    b.disabled = !1
                                } else Sfdc.Dom.hideByDisplay(Sfdc.get("asUserRow"));
                                Sfdc.Dom.show(Sfdc.get("publishFancyTagsContainer"));
                                Sfdc.Dom.show(Sfdc.get("fileTagRow"));
                                (c = Sfdc.get("contentTypeRow")) && Sfdc.Dom.show(c)
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.cleanupAndHideCustomFields = function () {
                                Sfdc.Dom.hideByDisplay(Sfdc.get("publishCustomFieldsBlock"));
                                Sfdc.Dom.setText(Sfdc.get("customFieldsBody"), "")
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.showCustomFields = function (a) {
                                Sfdc.Dom.show(Sfdc.get("publishCustomFieldsBlock"));
                                var b = Sfdc.get("customFieldsBody");
                                Sfdc.Dom.updateHTML(b, a, !0);
                                this.position()
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.getCustomFields = function (a) {
                                var b = chatter.getToolbox(), c = Sfdc.get("publishOverlayContentTypeSelection").value;
                                this.cleanupAndHideCustomFields();
                                if ("" !== c) {
                                    var e = Sfdc.get("global_form_error_msg");
                                    e.innerHTML = "";
                                    Sfdc.Dom.addClass(e, "hidden");
                                    Sfdc.get("publib_fdesc_error_msg") && Sfdc.Dom.addClass(Sfdc.get("publib_fdesc_error_msg"), "hidden");
                                    Sfdc.get("publib_fname_error_msg") && Sfdc.Dom.addClass(Sfdc.get("publib_fname_error_msg"), "hidden");
                                    Sfdc.get("publib_reason_error_msg") && Sfdc.Dom.addClass(Sfdc.get("publib_reason_error_msg"), "hidden");
                                    Sfdc.get("publib_lang_error_msg") && Sfdc.Dom.addClass(Sfdc.get("publib_lang_error_msg"), "hidden");
                                    Sfdc.get("publib_author_error_msg") && Sfdc.Dom.addClass(Sfdc.get("publib_author_error_msg"), "hidden");
                                    Sfdc.get("publib_tag_error_msg") && Sfdc.Dom.addClass(Sfdc.get("publib_tag_error_msg"), "hidden");
                                    this.setPublishButtonState();
                                    params = {
                                        ctype: c
                                    };
                                    var f = this;
                                    b.get({
                                        url: "/file/customfields/" + a,
                                        params: params,
                                        success: function (a, b) {
                                            f.processCustomFieldsJson(b)
                                        }
                                    })
                                }
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.processCustomFieldsJson = function (a) {
                                if (a && a.customFieldsHtml) {
                                    var b = this;
                                    Sfdc.ScriptLoader.loadScript(a.helpJsUrl, function () {
                                        Sfdc.ScriptLoader.loadScript(a.corePlJsUrl, function () {
                                            Sfdc.ScriptLoader.loadScript(a.plServletUrl, function () {
                                                b.showCustomFields(a.customFieldsHtml)
                                            })
                                        })
                                    })
                                }
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.publish = function (a) {
                                Perf.mark("Sfdc.AccessibleFilePublishToLibraryDialog.publish");
                                var b = Sfdc.get("global_form_error_msg"),        c = chatter.getToolbox(),        e = sfdcPage.getDialogById(Sfdc.AccessibleFilePublishToLibraryDialog.ID);
                                a = Sfdc.TagAutoCompleteElement.getCombinedSelectedTags();
                                Sfdc.get("publishTagsVal").value = a;
                                e.validatePublishForm() ? (Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.publish"), Sfdc.Dom.addClass(b, "hidden"), a = e.dataLoadUrl, Sfdc.AccessibleFilePublishToLibraryDialog.togglePublishProgressDialog(!0),
        Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.publish"), chatter.getToolbox().post({            url: a,
            form: "contributeForm",
            failure: function (a, b) {
                b && !b.errormessage && alert(b.errormessage);
                Sfdc.AccessibleFilePublishToLibraryDialog.togglePublishProgressDialog(!1);
                Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.publish")
            },
            success: function (a, d) {
                Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.publish");
                if (d.toDocId) navigateToUrl("/" + d.toDocId);
                else if (d.globalErrorMsg) {
                    Sfdc.AccessibleFilePublishToLibraryDialog.togglePublishProgressDialog(!1);
                    Sfdc.get("publishToLibContent").scrollTop = 0;
                    var g = d.globalErrorMsg;
                    if (d.failureMsgs && d.failureMsgs.length && 0 < d.failureMsgs.length) {
                        for (var g = g + "\x3cul\x3e", h = 0; h < d.failureMsgs.length; h++) g += "\x3cli\x3e", g += d.failureMsgs[h].msg, g += "\x3c/li\x3e";
                        g += "\x3c/ul\x3e"
                    }
                    Sfdc.Dom.updateHTML(b, g);
                    Sfdc.Dom.removeClass("hidden");
                    e.processCustomFieldsJson(d);
                    Sfdc.get("publib_fdesc_error_msg") && c.validateElement(Ext.get("publib_fdesc_error_msg"), function () {
                        return !d.descrError
                    }, d.descrError);
                    Sfdc.get("publib_fname_error_msg") &&
                        c.validateElement(Ext.get("publib_fname_error_msg"), function () {
                            return !d.titleError
                        }, d.titleError);
                    Sfdc.get("publib_tag_error_msg") && c.validateElement(Ext.get("publib_tag_error_msg"), function () {
                        return !d.tagError
                    }, d.tagError);
                    Sfdc.get("publib_author_error_msg") && c.validateElement(Ext.get("publib_author_error_msg"), function () {
                        return !d.authorError
                    }, d.authorError);
                    Sfdc.get("publib_lang_error_msg") && c.validateElement(Ext.get("publib_lang_error_msg"), function () {
                        return !d.langError
                    }, d.langError);
                    Sfdc.get("publib_reason_error_msg") &&
                        c.validateElement(Ext.get("publib_reason_error_msg"), function () {
                            return !d.reasonError
                        }, d.reasonError);
                    Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.publish")
                }
            }
        })) : (Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.publish"), Sfdc.Dom.setText(b, LC.getLabel("ChatterFilePublishOverlay", "formHasValidationError")), Sfdc.Dom.removeClass(b, "hidden"), Perf.endMark("Sfdc.AccessibleFilePublishToLibraryDialog.publish"))
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.validatePublishForm = function () {
                                var a = !0;
                                this.validateDescription() || (a = !1);
                                this.validateFileName() || (a = !1);
                                Sfdc.get("reason_upload") && (a = this.validateReasonForChange());
                                return a
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.validateBasicSelections = function () {
                                var a = Sfdc.get("publishOverlayWorkspaceSelection").value, b = Sfdc.get("publishOverlayContentTypeSelection").value;
                                return "" === a || "" === b ? !1 : !0
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.validateDescription = function () {
                                var a = chatter.getToolbox(), b = LC.getLabel("Publisher", "postContentDescriptionMaxLen", 1E3), c = Sfdc.get("publish_file_desc"), e = Sfdc.String.trim(c.value).length;
                                return a.validateElement(Ext.get("publib_fdesc_error_msg"), function () {
                                    return 1E3 > e
                                }, b)
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.validateFileName = function () {
                                var a = chatter.getToolbox(), b = LC.getLabel("Publisher", "postFileNameRequired"), c = Sfdc.get("publish_file_name"), e = a.stringTrim(c.value).length;
                                return a.validateElement(Ext.get("publib_fname_error_msg"), function () {
                                    return 0 < e
                                }, b)
                            };
                            Sfdc.AccessibleFilePublishToLibraryDialog.prototype.validateReasonForChange = function () {
                                var a = chatter.getToolbox(),
        b = LC.getLabel("ChatterFilePublishOverlay", "reasonRequired"),
        c = Sfdc.get("reason_upload"),
        e = a.stringTrim(c.value).length;
                                if (!a.validateElement(Ext.get("publib_reason_error_msg"), function () {
                                    return 0 < e
                                }, b)) return !1;
                                b = LC.getLabel("ChatterFilePublishOverlay", "reasonTooLong", 1E3);
                                return a.validateElement(Ext.get("publib_reason_error_msg"), function () {
                                    return 1E3 > e
                                }, b)
                            };
                            Sfdc.ns("Sfdc.TagAutoCompleteElement");
                            Sfdc.TagAutoCompleteElement = function (a) {
                                a && (AutoCompleteInputElement.getInstance(a.id) || BaseAutoCompleteElement.call(this, a))
                            };
                            Sfdc.TagAutoCompleteElement.prototype = new BaseAutoCompleteElement({});
                            Sfdc.TagAutoCompleteElement.SELECTED_TAGS = {};
                            Sfdc.TagAutoCompleteElement.prototype.initWithNewData = function (a) {
                                this.emptyInputCache = {
                                    AllItems: a.tags
                                };
                                this.tagType = a.tagModel;
                                Sfdc.TagAutoCompleteElement.SELECTED_TAGS = Sfdc.TagAutoCompleteElement.SELECTED_TAGS || {};
                                for (var b in Sfdc.TagAutoCompleteElement.SELECTED_TAGS) Sfdc.TagAutoCompleteElement.SELECTED_TAGS[b].element && (Sfdc.TagAutoCompleteElement.SELECTED_TAGS[b].element.next() && Sfdc.TagAutoCompleteElement.SELECTED_TAGS[b].element.next().remove(), Sfdc.TagAutoCompleteElement.SELECTED_TAGS[b].element.remove());
                                Sfdc.TagAutoCompleteElement.SELECTED_TAGS = {}
                            };
                            Sfdc.TagAutoCompleteElement.prototype.allowNewTag = function () {
                                return this.tagType && this.tagType === Sfdc.AccessibleFilePublishToLibraryDialog.TAG_RESTRICTED ? !1 : !0
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getBoxCssClass = function () {
                                return AutoCompleteInputElement.BOX_CSS_CLASS + " tagACBox"
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getListOlCssClass = function () {
                                return "tagACList"
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getRowCssClass = function () {
                                return AutoCompleteInputElement.ROW_CSS_CLASS + " tagACRow"
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getRowSelectedCssClass = function () {
                                return AutoCompleteInputElement.ROW_CSS_CLASS_SELECTED + " tagACRowSelected"
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getHintRowCssClass = function () {
                                return this.getRowCssClass() + " tagACHintRow"
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getRowMouseOverCssClass = function () {
                                return this.getRowCssClass() + " tagACRowHover"
                            };
                            Sfdc.TagAutoCompleteElement.prototype.retrieveFromServlet = function (a) {
                                if (!this.inGhostMode()) {
                                    this.ajaxState = "initialized";
                                    var b = sfdcPage.getDialogById(Sfdc.AccessibleFilePublishToLibraryDialog.ID);
                                    b.currentWorkspaceInfo || alert("something wrong");
                                    this.saveToCache(a, {
                                        AllItems: b.currentWorkspaceInfo.tags
                                    });
                                    this.ajaxState = "finished";
                                    this.displaySuggestions(!0);
                                    return !0
                                }
                            };
                            Sfdc.TagAutoCompleteElement.prototype.addSuggestions = function (a, b, c, e) {
                                if (b)
                                    if (0 === b.length) b = "\x3cb\x3e\x26quot;" + BaseAutoCompleteElement.htmlEncode(Sfdc.get(this.id).value) + "\x26quot;\x3c/b\x3e", a.push('\x3cli\x3e\x3cdiv class\x3d"ugAC_noMatch"\x3e'), !this.tagType || this.tagType === Sfdc.AccessibleFilePublishToLibraryDialog.TAG_UNRESTRICTED ? a.push(LC.getLabel("ChatterFilePublishOverlay", "noMatchOpenTags")) : this.tagType === Sfdc.AccessibleFilePublishToLibraryDialog.TAG_GUIDED ? a.push(LC.getLabel("ChatterFilePublishOverlay",
            "noMatchSuggestedTags", b)) : a.push(LC.getLabel("ChatterFilePublishOverlay", "noMatchRestrictedTags", b)), a.push("\x3c/div\x3e\x3c/li\x3e");
                                    else
                                        for (e = 0; e < b.length; e++) {
                                            var f = b[e];
                                            if (f && f.ItemName) {
                                                var d = e;
                                                a.push("\x3cli\x3e");
                                                a.push("\x3cdiv ");
                                                a.push("onmouseover\x3d'BaseAutoCompleteElement.mouseOver(");
                                                a.push('"');
                                                a.push(this.id);
                                                a.push('", ');
                                                a.push(d);
                                                a.push(")' ");
                                                a.push("onmouseout\x3d'BaseAutoCompleteElement.mouseOut(");
                                                a.push('"');
                                                a.push(this.id);
                                                a.push('", ');
                                                a.push(d);
                                                a.push(")' ");
                                                a.push("onmousedown\x3d'Sfdc.TagAutoCompleteElement.click(event,");
                                                a.push('"');
                                                a.push(this.id);
                                                a.push('", "');
                                                a.push(d);
                                                a.push('", "');
                                                a.push(BaseAutoCompleteElement.htmlEncodeForJS(f.ItemName));
                                                a.push('");');
                                                a.push("' ");
                                                c && this.compareSuggestions(c, f) ? (a.push("class\x3d'" + this.getRowSelectedCssClass() + "' "), this.selected = d, this.select(d)) : a.push("class\x3d'" + this.getRowCssClass() + "' ");
                                                a.push("id\x3d'" + AutoCompleteInputElement.getRowIdStatic(this.id, d) + "'\x3e");
                                                a.push(this.getSuggestionHtml(f));
                                                a.push("\x3c/div\x3e");
                                                a.push("\x3c/li\x3e")
                                            }
                                        }
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getSuggestionHtml = function (a) {
                                var b = escapeHTML(this.lastInput);
                                a = BaseAutoCompleteElement.htmlEncode(a.ItemName);
                                var c = this.getRegexForInput(b);
                                return ["\x3cspan class\x3d'name'\x3e", "" === b ? a : a.replace(c, '$1\x3cstrong class\x3d"autocompleteMatch"\x3e$2\x3c/strong\x3e'), "\x3c/span\x3e"].join("")
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getACXPosition = function () {
                                return Sfdc.Dom.getElementXY(Sfdc.get("publishFancyTagsContainer")).x
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getACYPosition = function () {
                                var a = Sfdc.get("publishFancyTagsContainer");
                                return Sfdc.Dom.getElementXY(a).y + Sfdc.getHeight(a)
                            };
                            Sfdc.TagAutoCompleteElement.prototype.getMinimumWidth = function () {
                                return Sfdc.Dom.getWidth(Sfdc.get("publishFancyTagsContainer")) - 2
                            };
                            Sfdc.TagAutoCompleteElement.prototype.compareSuggestions = function (a, b) {
                                return a === b
                            };
                            Sfdc.TagAutoCompleteElement.prototype.handleNav = function (a) {
                                var b = Sfdc.get(this.id);
                                if (a.keyCode === KEY_ENTER) this.getRow(this.selected) ? (this.handleEnter(a), this.resizeTextArea()) : this.addTagAndCleanUpIfPossible(a), b.value = "", b.focus(), this.displaySuggestions(!0);
                                else if (a.keyCode === KEY_TAB) b.value = "", b.blur(), Sfdc.Event.stopPropogation(a);
                                else if (a.keyCode === KEY_BACKSPACE && "" === b.value) {
                                    if (a = Ext.get("publishFancyTagsList").last(".tagItem"))
                                        for (var c in Sfdc.TagAutoCompleteElement.SELECTED_TAGS)
                                            if (Sfdc.TagAutoCompleteElement.SELECTED_TAGS[c].element === a) {
                                                Sfdc.TagAutoCompleteElement.SELECTED_TAGS[c].element.next().remove();
                                                Sfdc.TagAutoCompleteElement.SELECTED_TAGS[c].element.remove();
                                                delete Sfdc.TagAutoCompleteElement.SELECTED_TAGS[c];
                                                break
                                            }
                                } else a.keyCode === KEY_COMMA && !a.shiftKey ? (this.addTagAndCleanUpIfPossible(a), Sfdc.Event.stopPropogation(a)) : BaseAutoCompleteElement.superclass.handleNav.call(this, a)
                            };
                            Sfdc.TagAutoCompleteElement.prototype.addTagAndCleanUpIfPossible = function (a) {
                                a = Sfdc.get(this.id);
                                "" !== a.value && this.allowNewTag() && (Sfdc.TagAutoCompleteElement.addTagToList(a.value), a.value = "")
                            };
                            Sfdc.TagAutoCompleteElement.click = function (a, b, c, e) {
                                if (b = AutoCompleteInputElement.getInstance(b)) AutoCompleteInputElement.captureKeystroke(a), Sfdc.TagAutoCompleteElement.addTagToList(e), b.allowHideAC = !0, Sfdc.get(b.id).blur()
                            };
                            Sfdc.TagAutoCompleteElement.addTagToList = function (a) {
                                var b = a.toUpperCase();
                                if ((a = AutoCompleteInputElement.getInstance(Sfdc.AccessibleFilePublishToLibraryDialog.TAG_FANCY_INPUT_ID)) && !Sfdc.TagAutoCompleteElement.SELECTED_TAGS[b]) {
                                    var c = Sfdc.get("publishFancyTagsList"), e = Sfdc.get(Sfdc.AccessibleFilePublishToLibraryDialog.TAG_FANCY_INPUT_ID).parent(),
            f = Ext.get(c.createChild({
                tag: "span",
                "class": "tagItem",
                cn: [{
                    tag: "span",
                    html: escapeHTML(b),
                    "class": "tagItemText",
                    title: escapeHTML(b)
                }, {
                    tag: "a",
                    href: "#",
                    "class": "remove",
                    cn: {
                        tag: "img",
                        src: "/s.gif"
                    }
                }]
            }, e, !0));
                                    f.select(".remove").addListener("click", function (a) {
                                        Sfdc.TagAutoCompleteElement.removeTagFromList(b)
                                    });
                                    Sfdc.TagAutoCompleteElement.SELECTED_TAGS[b] = {
                                        element: f,
                                        value: b
                                    };
                                    c.createChild({
                                        tag: "span",
                                        html: " "
                                    }, e);
                                    a.positionACBox()
                                }
                            };
                            Sfdc.TagAutoCompleteElement.removeTagFromList = function (a) {
                                AutoCompleteInputElement.getInstance(Sfdc.AccessibleFilePublishToLibraryDialog.TAG_FANCY_INPUT_ID) && (Sfdc.TagAutoCompleteElement.SELECTED_TAGS[a] && Sfdc.TagAutoCompleteElement.SELECTED_TAGS[a].element) && (Sfdc.TagAutoCompleteElement.SELECTED_TAGS[a].element.remove(), delete Sfdc.TagAutoCompleteElement.SELECTED_TAGS[a])
                            };
                            Sfdc.TagAutoCompleteElement.getCombinedSelectedTags = function () {
                                if (!AutoCompleteInputElement.getInstance(Sfdc.AccessibleFilePublishToLibraryDialog.TAG_FANCY_INPUT_ID) || !Sfdc.TagAutoCompleteElement.SELECTED_TAGS) return "";
                                var a = "", b = !0, c;
                                for (c in Sfdc.TagAutoCompleteElement.SELECTED_TAGS) Sfdc.TagAutoCompleteElement.SELECTED_TAGS.hasOwnProperty(c) && Sfdc.TagAutoCompleteElement.SELECTED_TAGS[c] && (b ? b = !1 : a += ",", a += c);
                                return a
                            };
                            Sfdc.ns("Sfdc.AccessibleUploadFileDialog");
                            Sfdc.AccessibleUploadFileDialog = function (a, b, c, d) {
                                Sfdc.BaseAccessibleFileDialog.call(this, {
                                    id: a
                                });
                                this.id = a;
                                this.title = b;
                                this.docId = c;
                                this.isContentComment = d || !1;
                                this.content = "";
                                this.height = 400;
                                this.width = 520
                            };
                            Ext.extend(Sfdc.AccessibleUploadFileDialog, Sfdc.BaseAccessibleFileDialog);
                            Sfdc.AccessibleUploadFileDialog.prototype.getContent = function () {
                                return this.content
                            };
                            Sfdc.AccessibleUploadFileDialog.getSuccessHandler = function () {
                                return function (a, b) {
                                    if (b && b.docid) {
                                        var c = Sfdc.AccessibleUploadFileDialog.getBaseUrl() + "/" + b.docid;
                                        b.so && (c += "?so\x3d" + b.so);
                                        navigateToUrl(c)
                                    }
                                }
                            };
                            Sfdc.AccessibleUploadFileDialog.prototype.getSuccessHandler = function () {
                                return void 0 === this.successHandler ? Sfdc.AccessibleUploadFileDialog.getSuccessHandler() : this.successHandler
                            };
                            Sfdc.AccessibleUploadFileDialog.prototype.setSuccessHandler = function (a) {
                                void 0 !== a && (this.successHandler = a)
                            };
                            Sfdc.AccessibleUploadFileDialog.prototype.setCancelHandler = function (a) {
                                void 0 !== a && (this.cancelHandler = a)
                            };
                            Sfdc.AccessibleUploadFileDialog.getFailureAndErrorHandler = function () {
                                return function (a, b) {
                                    var c = b && b.html ? b.html : LC.getLabel("ChatterFilesTabPage", "uploadGeneralErrorMessage"), d = Dialogs.types.ERROR;
                                    Dialogs.createDialog({
                                        id: Dialogs.getNextId(),
                                        title: LC.getLabel("Global", "error"),
                                        message: c,
                                        backgroundClass: d.backgroundClass,
                                        contentClass: d.contentClass,
                                        iconClass: d.iconClass,
                                        iconAlt: d.getIconAlt(),
                                        actions: [null],
                                        actionLabels: [LC.getLabel("Buttons", "ok")]
                                    }, !0).show()
                                }
                            };
                            Sfdc.AccessibleUploadFileDialog.prototype.getFailureAndErrorHandler = function () {
                                return Sfdc.AccessibleUploadFileDialog.getFailureAndErrorHandler()
                            };
                            Sfdc.AccessibleUploadFileDialog.prototype.setFailureAndErrorHandler = function (a) {
                                void 0 !== a && (this.failureAndErrorHandler = a)
                            };
                            Sfdc.AccessibleUploadFileDialog.prototype.enableButton = function (a) {
                                var b = Sfdc.get("uploadToMyFilesButton");
                                a ? chatter.getToolbox().enableButton(b) : chatter.getToolbox().disableButton(b)
                            };
                            Sfdc.AccessibleUploadFileDialog.prototype.hook_cancel = function () {
                                this.cancelHandler && this.cancelHandler()
                            };
                            Sfdc.AccessibleUploadFileDialog.UPLOAD_FILE_DIALOG_ID = "chatterFilesTabPageUploadDialog";
                            Sfdc.AccessibleUploadFileDialog.REQUIRED_LEGEND_ID = "requiredLegend" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_FIELD_ID = "chatterFile" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_FIELD_NEW_LABEL_ID = "chatterFileNewLabel" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_ROW_ID = "chatterFileRow" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_NAME_FIELD_ID = "fileName" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_DESCRIPTION_FIELD_ID = "desc" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_NAME_ROW_ID = "fileNameRow" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_DESCRIPTION_ROW_ID = "descRow" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.FILE_SHARE_OPT_PANEL_ID = "sharedWithOptionPanel" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.UPLOAD_MSG_PANEL_ID = "uploadFileMsgPanel" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.UPLOAD_FILE_FORM_ID = "chatterFileForm" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_FIELD_ID = "shareOption" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_STATUS_ID = "shareOptionStatus" + ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX;
                            Sfdc.AccessibleUploadFileDialog.uploadFileDialog = null;
                            Sfdc.AccessibleUploadFileDialog.open = function (a, b) {
                                var c = sfdcPage.getDialogById(Sfdc.AccessibleUploadFileDialog.UPLOAD_FILE_DIALOG_ID);
                                if (c) Sfdc.AccessibleUploadFileDialog.init(c, a);
                                else {
                                    var d = {
                                        nv: Sfdc.AccessibleUploadFileDialog.isNewVersionUpload(a),
                                        cc: Sfdc.AccessibleUploadFileDialog.isContentComment(a)
                                    };
                                    b && chatter.getToolbox().setToken(b);
                                    chatter.getToolbox().get({
                                        url: "/chatterfileuploadform",
                                        params: d,
                                        success: function (b, d) {
                                            c = new Sfdc.AccessibleUploadFileDialog(Sfdc.AccessibleUploadFileDialog.UPLOAD_FILE_DIALOG_ID, Sfdc.AccessibleUploadFileDialog.getDialogTitle(a), a ? a[ChatterFilesConstants.FILE_CONFIG_KEY_DOCID] : null, Sfdc.AccessibleUploadFileDialog.isContentComment(a));
                                            c.content = '\x3cdiv id\x3d"contentPublisherSlideDown" class\x3d"contentPublisherSlideDown"\x3e' + d.html + "\x3c/div\x3e";
                                            c.created = !0;
                                            c.register();
                                            Sfdc.AccessibleUploadFileDialog.init(c, a)
                                        }
                                    })
                                }
                            };
                            Sfdc.AccessibleUploadFileDialog.getBaseUrl = function () {
                                return chatter.getToolbox().sitePrefix()
                            };
                            Sfdc.AccessibleUploadFileDialog.getFileDetailPageUrl = function () {
                                return Sfdc.AccessibleUploadFileDialog.getBaseUrl() + "/_ui/core/chatter/files/FileDetailPage"
                            };
                            Sfdc.AccessibleUploadFileDialog.isNewVersionUpload = function (a) {
                                return a ? a[ChatterFilesConstants.FILE_CONFIG_KEY_DOCID] ? !0 : !1 : !1
                            };
                            Sfdc.AccessibleUploadFileDialog.isContentComment = function (a) {
                                return a ? a.isContentComment ? !0 : !1 : !1
                            };
                            Sfdc.AccessibleUploadFileDialog.getDialogTitle = function (a) {
                                return a ? a.title ? a.title : Sfdc.AccessibleUploadFileDialog.isContentComment(a) ? LC.getLabel("Publisher", "postFileFormTitle") : LC.getLabel("ChatterFileDetailPage", "uploadNewVersionDialogTitle") : LC.getLabel("ChatterFilesTabPage", "uploadFileDialogTitle")
                            };
                            Sfdc.AccessibleUploadFileDialog.hideField = function (a, b) {
                                a && (b ? Sfdc.Dom.addClass(a, "hidden") : Sfdc.Dom.removeClass(a, "hidden"))
                            };
                            Sfdc.AccessibleUploadFileDialog.adjustUploadLayout = function (a) {
                                var b = Sfdc.AccessibleUploadFileDialog.isNewVersionUpload(a);
                                a = Sfdc.AccessibleUploadFileDialog.isContentComment(a);
                                if (!b && !a) {
                                    var c = Sfdc.get(Sfdc.AccessibleUploadFileDialog.FILE_ROW_ID), d = Sfdc.select("th", c)[0];
                                    if (d && (Sfdc.Dom.addClass(d, "hidden"), !Sfdc.get(Sfdc.AccessibleUploadFileDialog.FILE_FIELD_NEW_LABEL_ID))) {
                                        var c = Sfdc.get(Sfdc.Dom.getParent(c, "table")), e = document.createElement("div");
                                        e.id = Sfdc.AccessibleUploadFileDialog.FILE_FIELD_NEW_LABEL_ID;
                                        e.innerHTML = Sfdc.get(d).innerHTML;
                                        c.parentNode.insertBefore(e, c)
                                    }
                                }
                                Sfdc.AccessibleUploadFileDialog.hideField(Sfdc.get(Sfdc.AccessibleUploadFileDialog.FILE_NAME_ROW_ID), !0);
                                Sfdc.AccessibleUploadFileDialog.hideField(Sfdc.get(Sfdc.AccessibleUploadFileDialog.FILE_DESCRIPTION_ROW_ID), !0);
                                Sfdc.AccessibleUploadFileDialog.hideField(Sfdc.get(Sfdc.AccessibleUploadFileDialog.FILE_SHARE_OPT_PANEL_ID), b || a);
                                (b = Sfdc.get(Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID + "Item1")) && Sfdc.AccessibleUploadFileDialog.selectShareOption(b, "pvt");
                                Sfdc.AccessibleUploadFileDialog.hideField(Sfdc.get(Sfdc.AccessibleUploadFileDialog.UPLOAD_MSG_PANEL_ID), !0)
                            };
                            Sfdc.AccessibleUploadFileDialog.init = function (a, b) {
                                chatter.getFileUploader().setDialogAppendix(ChatterFilesConstants.UPLOAD_DIALOG_APPENDIX);
                                Sfdc.AccessibleUploadFileDialog.adjustUploadLayout(b, !1);
                                a.show();
                                a.enableButton(!1);
                                var c = "", d = "";
                                if (b) {
                                    b.successHandler && b.cancelHandler && (a.setSuccessHandler(b.successHandler), a.setCancelHandler(b.cancelHandler));
                                    if (!Sfdc.AccessibleUploadFileDialog.isContentComment(b)) {
                                        var e = Sfdc.get("fileTitle");
                                        e && (c = unescapeHTML(e.innerHTML));
                                        (e = Sfdc.get("fileDescriptionText")) && (d = unescapeHTML(e.innerHTML))
                                    }
                                    b.fldr && (a.fldr = b.fldr)
                                }
                                chatter.getFileUploader().reset(a.enableButton, c, d);
                                chatter.getFileUploader().initValidation(a.enableButton)
                            };
                            Sfdc.AccessibleUploadFileDialog.close = function () {
                                var a = sfdcPage.getDialogById(Sfdc.AccessibleUploadFileDialog.UPLOAD_FILE_DIALOG_ID);
                                a && a.cancel()
                            };
                            Sfdc.AccessibleUploadFileDialog.upload = function () {
                                var a = sfdcPage.getDialogById(Sfdc.AccessibleUploadFileDialog.UPLOAD_FILE_DIALOG_ID);
                                if (a) {
                                    a.hide();
                                    var b = chatter.getToolbox().sitePrefix() + chatter.getToolbox().apiurl() + "/chatterfile/", c = { cc: a.isContentComment };
                                    a.docId && (c = {
                                        id: a.docId
                                    });
                                    var d = Sfdc.get("browseLabel");
                                    d && "fs" === d.getAttribute("data-contentsfdc-filter") && (c.fileSync = !0, a.fldr && (c.fldr = a.fldr));
                                    chatter.getFileUploader().upload(b, c, {
                                        failureHandler: a.getFailureAndErrorHandler(),
                                        errorHandler: a.getFailureAndErrorHandler(),
                                        successHandler: a.getSuccessHandler()
                                    })
                                }
                            };
                            Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID = "shareOptionDropdown";
                            Sfdc.FileSharedWithOptionDropdown = function (a, b) {
                                Sfdc.DropdownPanel.call(this, a);
                                this.pubLinkEnabled = !1;
                                b && !0 === b.pubLinkEnabled && (this.pubLinkEnabled = !0);
                                this.isRendered = !1
                            };
                            Ext.extend(Sfdc.FileSharedWithOptionDropdown, Sfdc.DropdownPanel);
                            Sfdc.FileSharedWithOptionDropdown.prototype.getXY = function () {
                                var a = Sfdc.get("chatterFilesTabPageUploadDialog"), b = getObjX(this.anchorElem), c = getObjY(this.anchorElem);
                                0 == b && (b = parseInt(a.style.left) + 44);
                                0 == c && (c = parseInt(a.style.top) + 182);
                                b += Sfdc.Window.getScrollX() - 1;
                                c += Sfdc.Window.getScrollY() + this.anchorElem.offsetHeight + 1;
                                return {
                                    x: b,
                                    y: c
                                }
                            };
                            Sfdc.FileSharedWithOptionDropdown.prototype.getSize = function () {
                                return {
                                    width: this.anchorElem.offsetWidth
                                }
                            };
                            Sfdc.FileSharedWithOptionDropdown.prototype.getContent = function (a) {
                                return !this.isRendered ? (a = [], a.push('\x3cul\x3e\x3cli class\x3d"sharedWithStatusBar checked"\x3e\x3ca id\x3d"' + Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID + 'Item1" onclick\x3d"Sfdc.AccessibleUploadFileDialog.selectShareOption(this, \'pvt\');return false;" class\x3d"lockItemIcon" href\x3d"javascript:void(0);"\x3e' + LC.getLabel("ChatterFileSharing", "shareOptionPrivate") + "\x3c/a\x3e\x3c/li\x3e"), a.push('\x3cli class\x3d"sharedWithStatusBar"\x3e\x3ca id\x3d"' +
            Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID + 'Item2"  onclick\x3d"Sfdc.AccessibleUploadFileDialog.selectShareOption(this, \'grp\');return false;" class\x3d"groupItemIcon" href\x3d"javascript:void(0);"\x3e' + LC.getLabel("ChatterFileSharing", "shareOptionGroup") + "\x3c/a\x3e\x3c/li\x3e"), a.push('\x3cli class\x3d"sharedWithStatusBar"\x3e\x3ca id\x3d"' + Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID + 'Item3"  onclick\x3d"Sfdc.AccessibleUploadFileDialog.selectShareOption(this, \'ppl\');return false;" class\x3d"peopleItemIcon" href\x3d"javascript:void(0);"\x3e' +
            LC.getLabel("ChatterFileSharing", "shareOptionPeople") + "\x3c/a\x3e\x3c/li\x3e"), this.pubLinkEnabled && a.push('\x3cli class\x3d"sharedWithStatusBar"\x3e\x3ca id\x3d"' + Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID + 'Item4"  onclick\x3d"Sfdc.AccessibleUploadFileDialog.selectShareOption(this, \'lnk\');return false;" class\x3d"linkItemIcon" href\x3d"javascript:void(0);"\x3e' + LC.getLabel("ChatterFileSharing", "shareOptionLink") + "\x3c/a\x3e\x3c/li\x3e"), a.push("\x3c/ul\x3e"), this.isRendered = !0, a.join("")) : null
                            };
                            Sfdc.AccessibleUploadFileDialog.getShareOptionDropdown = function (a) {
                                var b = Sfdc.DropdownPanel.getPanel(Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID);
                                b || (b = new Sfdc.FileSharedWithOptionDropdown(Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_DROPDOWN_ID, a));
                                return b
                            };
                            Sfdc.AccessibleUploadFileDialog.showShareOptionDropdown = function (a, b) {
                                var c = Sfdc.AccessibleUploadFileDialog.getShareOptionDropdown(b);
                                c && c.show(a)
                            };
                            Sfdc.AccessibleUploadFileDialog.closeShareOptionDropdown = function () {
                                var a = Sfdc.AccessibleUploadFileDialog.getShareOptionDropdown();
                                a && a.close()
                            };
                            Sfdc.AccessibleUploadFileDialog.selectShareOption = function (a, b) {
                                for (var c = Sfdc.select("li.sharedWithStatusBar", Sfdc.Dom.getParent(Sfdc.get(a), "ul")), d = 0; d < c.length; d++) Sfdc.Dom.removeClass(c[d], "checked");
                                Sfdc.Dom.addClass(Sfdc.Dom.getParent(Sfdc.get(a), "li"), "checked");
                                c = Sfdc.get(Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_STATUS_ID);
                                c.className = a.className;
                                c.firstChild.innerHTML = a.innerHTML;
                                Sfdc.get(Sfdc.AccessibleUploadFileDialog.SHARE_OPTION_FIELD_ID).value = b;
                                Sfdc.AccessibleUploadFileDialog.closeShareOptionDropdown()
                            };
                            Sfdc.ns("Sfdc.AccessibleSelectFileDropDownPanel");
                            Sfdc.AccessibleSelectFileDropDownPanel = function (a, b) {
                                Sfdc.DropdownPanel.call(this, a);
                                this.isFileSyncEnabled = b
                            };
                            Ext.extend(Sfdc.AccessibleSelectFileDropDownPanel, Sfdc.DropdownPanel);
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.resizeEventHandler = function (a) {
                                return function () { }
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.scrollEventHandler = function (a) {
                                return function () { }
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.clickEventHandler = function (a, b) {
                                return function () { }
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.keydownEventHandler = function (a) {
                                return function () { }
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.getXY = function () {
                                var a = getObjX(this.anchorElem), b = getObjY(this.anchorElem);
                                return {
                                    x: a + 10,
                                    y: b + 23
                                }
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.getContent = function (a) {
                                a = UserContext.isDefaultNetwork ? LC.getLabel("Publisher", "linkAFile") : LC.getLabel("Publisher", "linkAFileChatter");
                                var b = LC.getLabel("Publisher", "uploadAFile");
                                if (!this.isRendered) {
                                    var c = [];
                                    c.push("\x3cul\x3e");
                                    c.push('\x3cli class\x3d"contentCommentMenuItem"\x3e\x3ca class\x3d"contentCommentLink" onclick\x3d"Sfdc.AccessibleSelectFileDropDownPanel.doAction(\'sfs\');return false;"  href\x3d"javascript:void(0);"\x3e' + chatter.getToolbox().htmlEncode(a) + "\x3c/a\x3e\x3c/li\x3e");
                                    c.push('\x3cli class\x3d"contentCommentMenuItem"\x3e\x3ca class\x3d"contentCommentLink" onclick\x3d"Sfdc.AccessibleSelectFileDropDownPanel.doAction(\'uploadFile\');return false;"  href\x3d"javascript:void(0);"\x3e' + chatter.getToolbox().htmlEncode(b) + "\x3c/a\x3e\x3c/li\x3e");
                                    c.push("\x3c/ul\x3e");
                                    this.isRendered = !0;
                                    return c.join("")
                                }
                                return null
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.hideDropDown = function () {
                                var a = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown();
                                if (a) {
                                    var b = Sfdc.get(Sfdc.AccessibleSelectFileDropDownPanel.SELECT_FILE_DROPDOWN_ID);
                                    b && Sfdc.Dom.isVisible(b) && a.close()
                                }
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.doAction = function (a) {
                                var b = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown();
                                chatter.getFeed().setAttachingContent(b.anchorElem, !0);
                                Sfdc.AccessibleSelectFileDropDownPanel.hideDropDown();
                                b.source = a;
                                "uploadFile" == a ? chatter.getFeed().showContentCommentUpload(b.anchorElem) : "sfs" == a && chatter.getFeed().showContentCommentLink(b.anchorElem)
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.SELECT_FILE_DROPDOWN_ID = "contentCommentDropdown";
                            Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown = function (a) {
                                var b = Sfdc.AccessibleSelectFileDropDownPanel.SELECT_FILE_DROPDOWN_ID, c = Sfdc.DropdownPanel.getPanel(b);
                                c || (c = new Sfdc.AccessibleSelectFileDropDownPanel(b, a));
                                return c
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.showSelectFileDropdown = function (a) {
                                var b = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown(config);
                                b && b.show(a)
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.hasFocusInitially = function () {
                                return !1
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.closeSelectFileDropdown = function () {
                                var a = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown();
                                a && a.close()
                            };
                            Sfdc.AccessibleSelectFileDropDownPanel.prototype.close = function () {
                                Sfdc.DropdownPanel.prototype.close.call(this);
                                var a = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown();
                                a && a.anchorElem && chatter.getFeed().setDisableCommentBoxBlur(a.anchorElem, !1)
                            };
                            var PostToWidget = function (r, h) {
                                function s() {
                                    return LC.getLabel("Publisher", "SearchGroups")
                                }

                                function t() {
                                    var a = d();
                                    Sfdc.Dom.removeClass(a, "hasFocus");
                                    Sfdc.Dom.set(a, "value", s())
                                }

                                function v() {
                                    if (!c) {
                                        var a = d();
                                        c = new UserAndGroupAutoCompleteInputElement({
                                            elementId: a.id,
                                            entityType: UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP,
                                            disableGhostText: !0,
                                            handleSelect: function (a) {
                                                var b = a.itemName,
                        c = a.isExternalUserOrGroup,
                        k = a.imageHtml,
                        g = "private" === a.itemPrivacy;
                                                e = a = {
                                                    subjectId: a.itemId,
                                                    entityType: LC.getLabel("Publisher", "CollaborationGroupLabel"),
                                                    isExternalGroup: c,
                                                    isPrivateGroup: g
                                                };
                                                h(a);
                                                Sfdc.Dom.hideByDisplay(d());
                                                Sfdc.Dom.set(d(), "value", "");
                                                a = l();
                                                m || (m = Sfdc.get(w, f()));
                                                c = m;
                                                c.innerHTML = k;
                                                k = Sfdc.get(".chatter-avatar", c);
                                                Sfdc.Dom.removeClass(k, "chatter-avatarMedium");
                                                Sfdc.Dom.addClass(k, "chatter-avatarSmall");
                                                Sfdc.get(".groupInfo", a).innerHTML = b;
                                                b = l();
                                                Sfdc.Dom.setStyle(b, "display", "inline-block");
                                                Sfdc.get(".removeGroup", b).focus();
                                                this.clearSuggestions()
                                            },
                                            getACXPosition: function () {
                                                return 8
                                            },
                                            getACYPosition: function () {
                                                return Sfdc.Dom.getHeight(a) - 2;
                                            },
                                            getMinimumWidth: function () {
                                                return 209
                                            }
                                        });
                                        c.addACBoxToPage = function (b) {
                                            Sfdc.Dom.getParent(a).appendChild(b)
                                        };
                                        c.clearGhostText = function () {
                                            a.value === s() && (Sfdc.Dom.addClass(a, "hasFocus"), Sfdc.Dom.set(a, "value", ""))
                                        };
                                        Sfdc.on(a, "blur", function () {
                                            "" === a.value && t()
                                        });
                                        var b = Sfdc.get(".removeGroup", l());
                                        Sfdc.on(b, "click", function (a, b) {
                                            u();
                                            d().focus()
                                        })
                                    }
                                }

                                function u() {
                                    var a = {};
                                    e = a;
                                    h(a);
                                    Sfdc.Dom.hideByDisplay(l());
                                    Sfdc.Dom.show(d())
                                }

                                function f() {
                                    g || (g = Sfdc.get(x, r));
                                    return g
                                }

                                function d() {
                                    n || (n = Sfdc.get(y, f()));
                                    return n
                                }

                                function l() {
                                    p || (p = Sfdc.get(z, f()));
                                    return p
                                }
                                var x = ".groupSelection",
        y = ".groupSelectionInput",
        z = ".groupRecipient",
        w = ".groupIconContainer",
        c = null,
        g = null,
        n = null,
        p = null,
        m = null,
        A = this,
        q = {
            subjectId: UserContext.userId,
            entityType: LC.getLabel("Publisher", "UserLabel")
        },
        e = q,
        b = "me";
                                this.setTargetToGroup = function () {
                                    if ("group" != b) {
                                        var a = {};
                                        e = a;
                                        h(a);
                                        t();
                                        v();
                                        Sfdc.Dom.setStyle(f(), "display", "inline-block");
                                        b = "group"
                                    }
                                };
                                this.setTargetToMyProfile = function () {
                                    "me" != b && (Sfdc.Dom.hideByDisplay(f()), u(), e = q, h(q), b = "me")
                                };
                                this.reset = function () {
                                    A.setTargetToMyProfile();
                                    var a = Sfdc.get(".zen-select", r);
                                    SfdcCmp.getInstance(a).reset()
                                };
                                this.getSubject = function () {
                                    return e
                                }
                            };
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
                                addToWaitingQueue: function (a, c) {
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
                                    var d = this, b = new XMLHttpRequest, e = this.filesToUpload[a].fileInfo.name;
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
                                    if (a = Sfdc.MultiFileUploaderUtil.parseResponseResult(a)) a.html && (a.html = chatter.getFileUploader().getBase64Decoder().decode(a.html)), a.errormessage && (a.errormessage = chatter.getFileUploader().getBase64Decoder().decode(a.errormessage));
                                    return a
                                },
                                runCustomHandlers: function (a, c, d) {
                                    var b = this.config.customHandlers;
                                    b && ("Failure" === a && b.failureHandler ? b.failureHandler(d.response, c) : "Error" === a && b.errorHandler ? b.errorHandler(d.response, c) : "Success" == a && b.successHandler && b.successHandler(d.response, c))
                                },
                                onXhrDone: function (a, c) {
                                    if (!0 !== this.filesToUpload[a].canceled) {
                                        var d = this.filesToUpload[a].fileObject, b = this.filesToUpload[a].fileInfo.size;
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
                                            if (b.errormessage) this.config.onErrorCallback(a, d, b.errormessage);
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
                                var b = Sfdc.MultiFileUploaderUtil.getBrowserName(), c = "", e;
                                for (e in this.uploadStats)
                                    if (this.uploadStats.hasOwnProperty(e)) {
                                        var d = this.uploadStats[e], f = 0;
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
                                this.filterParentId && (this.origin === Sfdc.ChatterFileUploader.PROFILE_PAGE && this.filterParentId != UserContext.userId) && (b.fcnt = a, b.fpid = this.filterParentId);
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
                                    //debugger;
                                    var a = document.createElement("input");
                                    a.setAttribute("type", "file");
                                    a.setAttribute("name", "chatterFile_upload");
                                    a.setAttribute("title", LC.getLabel("ChatterFilesTabPage", "uploadMultiFilesLinkText"));
                                    !0 === b ? (a.setAttribute("multiple", "multiple"), a.setAttribute("class", "multifile-upload-input-button"), a.id = Sfdc.UploadButton.HIDDEN_MULTI_INPUT_ID) : (a.setAttribute("class", "singlefile-upload-input-button"), a.id = Sfdc.UploadButton.HIDDEN_SINGLE_INPUT_ID);
                                    this.uploadBtnAnchor.appendChild(a);
                                    var c = this;
                                    addEvent(a, "change", function () {
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
                                    var a =
            document.createElement("div");
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
                                Sfdc.get(".multifile-upload-status",
        this.dom).innerHTML = e;
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
                                Sfdc.Dom.removeClass(Sfdc.get(".uploadWarningIconClass", this.dom),
        "hidden");
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
                                Sfdc.Dom.addClass(a,
        "warningLabelInRed")
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

                            function ExternalFileProgressDialog(b, c, d, a) {
                                ActionProgressDialog.call(this, b, c, d, a)
                            }
                            ExternalFileProgressDialog.prototype = new ActionProgressDialog;
                            ExternalFileProgressDialog.show = function (b, c, d) {
                                var a = sfdcPage.getDialogById(b);
                                a || (a = new ExternalFileProgressDialog(b), a.register());
                                a.setProgressMsgTitle(c);
                                a.setProgressMsgText(d);
                                a.createContent();
                                a.show();
                                return a
                            };
                            ExternalFileProgressDialog.showOnGetFileInfo = function (b) {
                                var c = LC.getLabel("Publisher", "externalFileGetInfoProgressTitle"),
        d = LC.getLabel("Publisher", "externalFileGetInfoProgressText");
                                return ExternalFileProgressDialog.show(b, c, d)
                            };
                            ExternalFileProgressDialog.showOnPostFile = function (b, c) {
                                var d = LC.getLabel("Publisher", "externalFilePostProgressTitle"),
        a;
                                a = c ? LC.getLabel("Publisher", "externalFilePostAsReferenceProgressText") : LC.getLabel("Publisher", "externalFilePostAsCopyProgressText");
                                return ExternalFileProgressDialog.show(b, d, a)
                            };

                            function FeedPostContentUploadDialog(c, b, d, e) {
                                ActionProgressDialog.call(this, c, b, d, e)
                            }
                            FeedPostContentUploadDialog.prototype = new ActionProgressDialog;
                            FeedPostContentUploadDialog.prototype.addButtonBar = function () {
                                this.overrideButton(0, LC.getLabel("Publisher", "postFileProgressCancel"), "chatter.getPublisher().getHandler('ContentPost').handleFileUploadCancel()")
                            };
                            FeedPostContentUploadDialog.getDialog = function (c, b, d, e) {
                                var a = sfdcPage.getDialogById(c);
                                a || (a = new FeedPostContentUploadDialog(c), a.register());
                                d ? (b += d, c = '\x3cspan class\x3d"multifile-upload-type"\x3e\x3cimg height\x3d"16" width\x3d"16" src\x3d"/s.gif"  class\x3d"' + Sfdc.MultiFileUploaderUtil.formatFileTypeCSS(d) + '" /\x3e\x3c/span\x3e', a.setProgressMsgTitle(c + "\x26nbsp;" + b, b)) : a.setProgressMsgTitle(LC.getLabel("Publisher", "postFileUploading") + " " + b, b);
                                a.setProgressMsgText(LC.getLabel("Publisher", "postFileProgressText"));
                                a.setHelpUrl(e);
                                a.createContent();
                                return a
                            };

                            function PublishToLibraryProgressDialog(b, c, a, d) {
                                ActionProgressDialog.call(this, b, c, a, d);
                                this.isModal = !1
                            }
                            PublishToLibraryProgressDialog.prototype = new ActionProgressDialog;
                            PublishToLibraryProgressDialog.getDialog = function (b, c) {
                                var a = sfdcPage.getDialogById(b);
                                a || (a = new PublishToLibraryProgressDialog(b), a.register());
                                a.setProgressMsgTitle(LC.getLabel("ChatterFilePublishOverlay", "publishToLibProgressTitle") + " " + c, c);
                                a.setProgressMsgText(LC.getLabel("ChatterFilePublishOverlay", "publishToLibProgressText"));
                                a.createContent();
                                return a
                            };

                            function ApprovalPostDialog(a, b, c, d) {
                                this.workItemId = a;
                                this.transitionType = b;
                                this.targetObjectType = c;
                                this.servletUrl = d;
                                this.lookupMode = !1;
                                this.comments = this.lookupInputHTML = "";
                                this.receivedResponse = this.showNextApprover = !1;
                                this.timeOutId = null
                            }
                            ApprovalPostDialog.prototype = new OverlayDialog;
                            ApprovalPostDialog.prototype.createContent = OverlayDialogElement.prototype.createContent;
                            ApprovalPostDialog.prototype.getDialog = function (a) {
                                var b = sfdcPage.getDialogById(a);
                                if (b) return this.resetDlgContents(), b;
                                OverlayDialogElement.call(this, a);
                                this._initApprovalOverlay();
                                this.register();
                                return this
                            };
                            ApprovalPostDialog.prototype._initApprovalOverlay = function () {
                                this.allowKeyboardEsc = this.displayX = this.hasButtonsBar = this.isModal = !0;
                                this.extraClass = "";
                                this.refreshOnClose = this.isAbsolutePositioned = !1;
                                var a = this._getIdBase();
                                this.buttonContents = '\x3cinput value\x3d"' + LC.getLabel("Buttons", "ok") + '" class\x3d"' + ZenCss.btn + '" name\x3d"ok" onclick\x3d"' + a + 'Var.executeProcessAction();" title\x3d"OK" type\x3d"button" /\x3e\x3cinput value\x3d"' + LC.getLabel("Buttons", "cancel") + '" class\x3d"' + ZenCss.btn + '" name\x3d"cancel" onclick\x3d"' +
        a + "Var.getDialog('" + a + 'overlay\').cancel()" title\x3d"Cancel" type\x3d"button" /\x3e';
                                this.contents = '\x3cdiv id\x3d"' + a + 'commentDiv" style\x3d"display:block; padding:5px"\x3e\x3cdiv id\x3d"commentPrompt" style\x3d"padding-bottom:5px"\x3e' + LC.getLabel("FeedPostAction", "OverlayCommentPrompt") + '\x3c/div\x3e\x3ctextarea class\x3d"feedPostComment" cols\x3d"60" id\x3d"' + a + 'comment" maxlength\x3d"1000" name\x3d"' + a + 'comment" rows\x3d"5" type\x3d"text" wrap\x3d"soft"\x3e\x3c/textarea\x3e\x3c/div\x3e\x3cdiv id\x3d"' +
        a + 'nextApproverDiv" class\x3d"overlayPanel nextApproverOverlay" style\x3d"display:none"\x3e\x3c/div\x3e\x3cdiv class\x3d"spinner" id\x3d"' + a + 'spinnerDiv" style\x3d"display:none"\x3e\x3c/div\x3e\x3cdiv class\x3d"overlayPanel" id\x3d"' + a + 'errorDiv" style\x3d"display:none"\x3e\x3cdiv class\x3d"message errorM3" id\x3d"' + a + 'errorMsg"\x3e\x3cdiv class\x3d"messageDiv"\x3e\x3cimg src\x3d"/s.gif" alt\x3d"Error" class\x3d"msgIcon" title\x3d"Error"/\x3e\x3cdiv class\x3d"messageText"\x3e\x3c/div\x3e\x3c/div\x3e\x3cscript type\x3d"text/javascript"\x3eif (window.sfdcPage) sfdcPage.registerMessage(\'' +
        a + 'errorMsg\');\x3c/script\x3e\x3c/div\x3e\x3cdiv class\x3d"buttons" id\x3d"' + a + 'error_buttons" style\x3d"display:none"\x3e\x3cinput value\x3d"' + LC.getLabel("Buttons", "ok") + '" class\x3d"' + ZenCss.btn + '" name\x3d"rejectButton" onclick\x3d"' + a + "Var.getDialog('" + a + 'overlay\').cancel()" title\x3d"OK" type\x3d"button" /\x3e\x3c/div\x3e\x3c/div\x3e';
                                this.setWidth(480);
                                "A" == this.transitionType ? this.setTitle(LC.getLabel("FeedPostAction", "OverlayApproveTitle")) : this.setTitle(LC.getLabel("FeedPostAction", "OverlayRejectTitle"))
                            };
                            ApprovalPostDialog.prototype.resetDlgContents = function () {
                                var a = this._getIdBase(),
        b = Sfdc.get(a + "comment"),
        a = Sfdc.get(a + "nextApprover");
                                b && (b.value = "");
                                a && (a.value = "");
                                this.lookupMode = !1;
                                a && this.lookupInputHTML && this._updateLookupControl(this.lookupInputHTML);
                                this._updateErrorMsg("", "error");
                                this._updateLookupErrorMsg("");
                                this._updateCommentErrorMsg("");
                                this.showNextApprover = !1;
                                this._showCommentInputState(!0);
                                this._showButtonBarState(!0);
                                this._showNextApproverInputState(!1);
                                this._showErrorState(!1);
                                this._showPendingState(!1)
                            };
                            ApprovalPostDialog.prototype.executeProcessAction = function () {
                                var a = this._getIdBase(),
        b = "",
        c = "",
        d = "005";
                                if (this.showNextApprover) {
                                    Sfdc.get(a + "nextApproverDiv");
                                    var b = (b = Sfdc.get(a + "nextApprover_lkid")) && b.value ? b.value : "",
            e = Sfdc.get(a + "nextApprover_mlktp");
                                    e && (d = e.value);
                                    if (0 === b.length || b == Udd.EMPTY_KEY)
                                        if (this.lookupMode = !0, b = "", c = (c = Sfdc.get(a + "nextApprover")) && c.value ? Sfdc.String.trim(c.value) : "", 0 === c.length) {
                                            this._updateLookupErrorMsg(LC.getLabel("Edit", "Required"));
                                            return
                                        }
                                } else if (this.comments =
        (e = Sfdc.get(a + "comment")) && e.value ? e.value : "", 1E3 < e.value.length) {
                                    this._updateCommentErrorMsg(LC.getLabel("Edit", "TooLong"));
                                    return
                                }
                                this._showCommentInputState(!1);
                                this._showNextApproverInputState(!1);
                                this._showButtonBarState(!1);
                                this._showErrorState(!1);
                                this._showPendingState(!0);
                                d = {
                                    workitemId: this.workItemId,
                                    transitionType: this.transitionType,
                                    targetObjectType: this.targetObjectType,
                                    comments: this.comments,
                                    nextOwnerId: b,
                                    nextOwnerLookupVal: c,
                                    lookupType: d
                                };
                                d[a + "nextApprover"] = c;
                                this.timeOutId && (clearTimeout(this.timeOutId),
        this.timeOutId = null);
                                var f = window[a + "Var"];
                                this.timeOutId = setTimeout(function () {
                                    f._onTimeoutAjaxRequest(f)
                                }, 6E4);
                                this.receivedResponse = !1;
                                Sfdc.Ajax.post(UserContext.getUrl(this.servletUrl), this.onCompleteProcessAction, {
                                    data: d,
                                    failure: this.onHttpFailure,
                                    context: this,
                                    escape: encodeURIComponent
                                })
                            };
                            ApprovalPostDialog.prototype.onCompleteProcessAction = function (a) {
                                this.receivedResponse = !0;
                                a = Util.evalAjaxServletOutput(a);
                                a.actionSucceeded ? this._processSuccessResponse() : this._processFailureResponse(a)
                            };
                            ApprovalPostDialog.prototype.onHttpFailure = function (a, b, c) {
                                this.receivedResponse = !0;
                                this._getIdBase();
                                this._showPendingState(!1);
                                a = LC.getLabel("FeedPostAction", "ServletHttpError", b.status);
                                this._updateErrorMsg(a, "error");
                                this._showErrorState(!0)
                            };
                            ApprovalPostDialog.prototype.expandMore = function (a, b) {
                                var c = Sfdc.Dom.getParent(a, ".approvalMoreContainer");
                                if (c) {
                                    var d = Sfdc.get(".approvalMoreLink", c);
                                    d && (d.style.display = "none")
                                }
                                d = null;
                                b && (d = Sfdc.Dom.getParent(a, b));
                                if (c = Sfdc.get(".approvalExpandedContent", d ? d : c)) c.style.display = "inline"
                            };
                            ApprovalPostDialog.prototype._processSuccessResponse = function () {
                                var a = this._getIdBase(),
        b = sfdcPage.getDialogById(a + "overlay");
                                b && b.cancel();
                                if (b = Sfdc.get("buttons_" + this.workItemId)) b.style.display = "none";
                                if (a = Sfdc.get(a + "status")) a.style.display = "block"
                            };
                            ApprovalPostDialog.prototype._processFailureResponse = function (a) {
                                if (a && a.errMsg && 0 < a.errMsg.length) {
                                    var b = this._getIdBase();
                                    this._showPendingState(!1);
                                    if (0 < a.missingNextApprover.length || this.lookupMode) {
                                        if (this.lookupMode) {
                                            this._updateLookupErrorMsg(a.errMsg);
                                            if (b = Sfdc.get(b + "nextApprover")) b.value = "";
                                            this.lookupInputHTML = this._updateLookupControl(a.lookupHtml)
                                        } else this._populateNextApproverInput(a.missingNextApprover);
                                        ForeignKeyInputElement.reload();
                                        this.showNextApprover = !0;
                                        this._showNextApproverInputState(!0);
                                        this._showButtonBarState(!0)
                                    } else this._updateErrorMsg(a.errMsg, a.severity), this._showErrorState(!0)
                                }
                            };
                            ApprovalPostDialog.prototype._onTimeoutAjaxRequest = function (a) {
                                if (!a.receivedResponse) {
                                    a._showPendingState(!1);
                                    var b = LC.getLabel("FeedPostAction", "ServletTimeoutError");
                                    a._updateErrorMsg(b, "error");
                                    a._showErrorState(!0)
                                }
                                a.timeOutId && (clearTimeout(a.timeOutId), a.timeOutId = null)
                            };
                            ApprovalPostDialog.prototype._updateCommentErrorMsg = function (a) {
                                var b = this._getIdBase();
                                if (b = Sfdc.get(b + "commentDiv")) {
                                    var c = Sfdc.get(".errorMsg", b);
                                    c && Sfdc.Dom.removeChild(c);
                                    c = "\x3cdiv class\x3d'errorMsg'\x3e\x3c/div\x3e";
                                    0 < a.length && (c = "\x3cdiv class\x3d'errorMsg'\x3e\x3cb\x3e" + LC.getLabel("Apex", "Error") + "\x3c/b\x3e" + a + "\x3c/div\x3e");
                                    Sfdc.Dom.insertHTML(b, c)
                                }
                            };
                            ApprovalPostDialog.prototype._updateLookupErrorMsg = function (a) {
                                var b = this._getIdBase();
                                if (b = Sfdc.get(b + "nextApproverDiv"))
                                    if (b = Sfdc.get(".requiredInput", b)) {
                                        var c = Sfdc.get(".errorMsg", b);
                                        c && Sfdc.Dom.removeChild(c);
                                        c = "\x3cdiv class\x3d'errorMsg'\x3e\x3c/div\x3e";
                                        0 < a.length && (c = "\x3cdiv class\x3d'errorMsg'\x3e\x3cb\x3e" + LC.getLabel("Apex", "Error") + "\x3c/b\x3e" + a + "\x3c/div\x3e");
                                        Sfdc.Dom.insertHTML(b, c)
                                    }
                            };
                            ApprovalPostDialog.prototype._updateLookupControl = function (a) {
                                var b = this._getIdBase();
                                if ((b = Sfdc.get(b + "nextApproverDiv")) && a) (b = Sfdc.get(".requiredInput", b)) && Sfdc.Dom.updateHTML(b, a);
                                return ""
                            };
                            ApprovalPostDialog.prototype._updateErrorMsg = function (a, b) {
                                var c = this._getIdBase();
                                if (c = Sfdc.get(c + "errorMsg"))
                                    if (b && "info" == b ? c.className = "message infoM3" : b && "error" == b && (c.className = "message errorM3"), c = Sfdc.get(".messageText", c)) c.innerHTML = a
                                };
                                ApprovalPostDialog.prototype._showCommentInputState = function (a) {
                                    var b = this._getIdBase();
                                    if (b = Sfdc.get(b + "commentDiv")) b.style.display = a ? "block" : "none"
                                };
                                ApprovalPostDialog.prototype._populateNextApproverInput = function (a) {
                                    var b = this._getIdBase();
                                    (b = Sfdc.get(b + "nextApproverDiv")) && Sfdc.Dom.updateHTML(b, a);
                                    this._updateLookupErrorMsg("")
                                };
                                ApprovalPostDialog.prototype._showNextApproverInputState = function (a) {
                                    var b = this._getIdBase();
                                    if (b = Sfdc.get(b + "nextApproverDiv")) a && this.showNextApprover ? (b.style.display = "block", this._centerLookupElement()) : b.style.display = "none"
                                };
                                ApprovalPostDialog.prototype._centerLookupElement = function () {
                                    var a = this._getIdBase(),
        b = Sfdc.get(a + "nextApproverLookup");
                                    if (b) {
                                        var c = 0,
            d = Sfdc.get(a + "nextApprover_top");
                                        d && (d.style.display = "inline");
                                        var e = Sfdc.get(".errorMsg", b);
                                        e && (e.style.display = "none");
                                        c = b.offsetWidth;
                                        d && !Ext.isIE7 && (d.style.display = "");
                                        a = Sfdc.get(a + "nextApproverDiv").offsetWidth;
                                        c = Math.round((parseInt(a) - parseInt(c)) / 2);
                                        b.style.left = c + "px";
                                        e && (e.style.display = "", e.style.left = "-" + c + "px")
                                    }
                                };
                                ApprovalPostDialog.prototype._showButtonBarState = function (a) {
                                    var b = this._getIdBase();
                                    if (b = Sfdc.get(b + "overlay_buttons")) b.style.display = a ? "block" : "none"
                                };
                                ApprovalPostDialog.prototype._showPendingState = function (a) {
                                    var b = this._getIdBase();
                                    if (b = Sfdc.get(b + "spinnerDiv")) b.style.display = a ? "block" : "none"
                                };
                                ApprovalPostDialog.prototype._showErrorState = function (a) {
                                    var b = this._getIdBase(),
        c = Sfdc.get(b + "errorDiv"),
        b = Sfdc.get(b + "error_buttons");
                                    c && (c.style.display = a ? "block" : "none");
                                    b && (b.style.display = a ? "block" : "none")
                                };
                                ApprovalPostDialog.prototype._getIdBase = function () {
                                    return this.transitionType + "_" + this.workItemId + "_"
                                };
                                chatter.extend("ApprovalPost", ApprovalPostDialog, null);
                                (function () {
                                    chatter.extend("CanvasAuxThumbnailRetriever", function () {
                                        function a() {
                                            var a = Sfdc.select("." + c.classPrefetch);
                                            a && 0 < a.length && Sfdc.each(a, function (a) {
                                                Sfdc.Dom.removeClass(a, c.classPrefetch);
                                                Sfdc.get("\x3e a \x3e img", a).setAttribute("src", a.getAttribute("data-canvasThumbnailUrl"));
                                                Sfdc.Dom.addClass(a, c.classFetched)
                                            })
                                        }
                                        var b = chatter.getEventBus(),
            c = {
                classPrefetch: "canvasThumbnail-prefetch",
                classFetched: "canvasThumbnail-fetched"
            };
                                        b.addEventListener("chatter:feed", "onAfterFeedRefresh", a);
                                        b.addEventListener("chatter:feed",
            "onAfterShowMoreFeedItems", a);
                                        b.addEventListener("chatter:feed", "onAfterNewPostFeedUpdate", a);
                                        b.addEventListener("chatter:rechat", "onAfterPreviewLoaded", a);
                                        b.addEventListener("unifiedSearchPage:feedSearchResults", "onAfterResultsShown", a);
                                        this.parseDOMAndRender = function () {
                                            a()
                                        }
                                    }, null);
                                    Sfdc.onload(function () {
                                        chatter.getCanvasAuxThumbnailRetriever().parseDOMAndRender()
                                    })
                                })();
                                chatter.getToolbox().getPerfEnabled() && Perf.mark("Sfdc.ChatterFeed:Start");

                                function Feed() {
                                    function A() {
                                        return Sfdc.get("feedwrapper")
                                    }

                                    function m() {
                                        var a = A();
                                        return a ? Sfdc.get(".cxfeedcontainer", a) : null
                                    }

                                    function q(a, b, c, d, e, h) {
                                        var g;
                                        try {
                                            g = G(a + "_" + c, b, d, e, h)
                                        } catch (f) {
                                            g = void 0
                                        }
                                        g || (g = G(a, b, d, e, h));
                                        return g
                                    }

                                    function G(a, b, c, d, e) {
                                        return c && d && e ? LC.getLabel(a, b, c, d, e) : c && d ? LC.getLabel(a, b, c, d) : c ? LC.getLabel(a, b, c) : LC.getLabel(a, b)
                                    }

                                    function V() {
                                        var a = Sfdc.get("chatterfeedshell");
                                        return a && Sfdc.select(".feedrightbar", a)[0]
                                    }

                                    function k(a) {
                                        return Ext.get(a).findParent(".cxfeeditem",            50, !0)
                                    }

                                    function y(a) {
                                        return Ext.get(a).findParent(".cxfeedcomment", 50, !0)
                                    }

                                    function W(a, b) {
                                        if (b) {
                                            var c = !(f.getCommentElement(b.id).getInputValueLength() <= H),
                d = chatter.getTextareaMessageUtil().isMessageDisplayed(b.id, "CommentMaxLengthErrorMsg"),
                e = LC.getLabel("Feeds", "CommentMaxLengthErrorMsg", H);
                                            c != d && (d = chatter.getTextareaMessageUtil(), c ? (d.showMessage({
                                                el: b.id,
                                                type: 1,
                                                append: !0,
                                                msg_html: e,
                                                msg_id: "CommentMaxLengthErrorMsg"
                                            }), chatter.getToolbox().disableButton(I(b))) : d.hideMessage({
                                                el: b.id,
                                                msg_id: "CommentMaxLengthErrorMsg"
                                            }) ||
                chatter.getToolbox().enableButton(I(b)))
                                        }
                                    }

                                    function I(a) {
                                        a = Sfdc.Dom.getParent(a, ".cxchattertextareacontainer");
                                        return Sfdc.get(".cxchattersubmit", a)
                                    }

                                    function J(a) {
                                        if (!a.hasClass("cxiswired")) {
                                            a.dom.value = "";
                                            a.on("keyup", W);
                                            chatter.getToolbox().expandableTextArea(a.dom, B, C);
                                            chatter.getToolbox().initializeIE8JPNTypingFix(a.dom);
                                            var b = a.hasClass("groupAtMentionsEnabled"),
                c = a.hasClass("externalGroupInputElement"),
                d = k(a).dom,
                e = null;
                                            Sfdc.Dom.hasClass(d, "cxrechatfeeditem") || (e = d.id);
                                            var h = f.getFeedItemData(d),
                b = new PublisherAutoComplete(a.dom.id, "/autocomplete", {}, e, b, h.parentid, h.parentname);
                                            Sfdc.Dom.hasClass(d, "cxfeeditemoverlay") && b.setIsOverlay(!0);
                                            c && b.toggleExternalGroupWarning(!0);
                                            z[b.id] = b;
                                            X(a, d);
                                            a.addClass("cxiswired")
                                        }
                                    }

                                    function X(a, b) {
                                        var c = f.getFeedItemData(b),
            d = f.getConfig();
                                        if (d && d.isPrivateGroup && c && d.subjectId !== c.parentid) {
                                            var d = Sfdc.get(".feeditemvisibilitycontainer", b),
                e = Sfdc.Dom.create(d, {}, "div");
                                            Sfdc.Dom.addClass(e, "visibilityWidgetParent");
                                            e = Sfdc.Dom.create(e, {
                                                href: "javascript:void(0);",
                                                title: LC.getLabel("Feeds", "WhoCanSeeYourComment")
                                            }, "a");
                                            Sfdc.Dom.addClass(e, "visibilityicon");
                                            var h = Sfdc.Dom.create(e, {}, "span");
                                            Sfdc.Dom.addClass(h, "zen-assistiveText");
                                            Sfdc.Dom.insertHTML(h, LC.getLabel("Feeds", "WhoCanSeeYourComment"));
                                            if (Sfdc.userAgent.isIE7) var g = Sfdc.Dom.getParent(d, ".chattertextareacontainer"),
                l = function () {
                    Sfdc.Dom.addClass(g, "feeditemZIndex")
                },
                p = function () {
                    Sfdc.Dom.removeClass(g, "feeditemZIndex")
                };
                                            var n = new VisibilityWidget({
                                                icon: e,
                                                helpUrl: f.getCommentVisibilityHelpLink(),
                                                onexpand: l,
                                                oncollapse: p
                                            });
                                            Sfdc.Event.add(e, "click", function () {
                                                n.toggleDisplay()
                                            });
                                            var r = {
                                                text: LC.getLabel("Feeds", "WhoCanSeeThisCommentMsg", c.parentActualName),
                                                title: LC.getLabel("Feeds", "WhoCanSeeThisCommentTitle")
                                            },
                s = {
                    text: LC.getLabel("Feeds", "WhereCanOthersFindThisCommentMsg", c.parentActualName),
                    title: LC.getLabel("Feeds", "WhereCanOthersFindThisCommentTitle")
                };
                                            n.registerHandler(function () {
                                                return [r, s]
                                            });
                                            c = LC.getLabel("Feeds", "CommentPostAtmentionPrivateGroupMsg");
                                            d = Sfdc.Dom.create(d, {}, "div");
                                            Sfdc.Dom.addClass(d,
                "visibilityWarningMessage");
                                            Sfdc.Dom.insertHTML(d, c)
                                        }
                                    }

                                    function K(a, b) {
                                        var c = a.child(".cxfeedcommentcount");
                                        if (c) {
                                            var d = parseInt(c.dom.innerHTML, 10),                e = d + b;
                                            1 == e || 1 == d ? (c = a.child(".cxshowmorecommentslabel").dom, d = Ext.DomHelper.markup({
                                                cls: "cxfeedcommentcount",
                                                tag: "span",
                                                html: e
                                            }), e = 1 == e ? LC.getLabel("Feeds", "ShowOneComment", d) : LC.getLabel("Feeds", "ShowAllComments", d), c.innerHTML = e) : c.dom.innerHTML = e
                                        }
                                    }

                                    function L(a) {
                                        var b = chatter.getToolbox(),
            c = a.select("div.cxfeedcomment"),
            d = a.select("div.cxfeeditemlike"),
            e = a.child(".cxfeedcommentsshowmore"),
            h = a.child(".cxnewcommenttext"),
            h = h ? h.dom.value : "",
            g = a.child(".linkedContentDetailsContainer");
                                        0 === c.getCount() && (null === e && 0 === d.getCount()) && (b.hide(a.child("div.cxcomments")), b.stringIsEmpty(h) && !g && (b.hide(a.child("div.cxnewcomment")), b.hide(a.child("div.cxcommentplaceholder"))))
                                    }

                                    function M(a, b, c) {
                                        var d = a.child(".cxshowmorecommentscontainer"),            e = chatter.getToolbox();
                                        e.mask(d);
                                        var h = f.getConfig();
                                        b.writable = h.writable;
                                        var g = f.search,            l;
                                        for (l in g) b[l] = g[l];
                                        g = f.pagingParams;
                                        for (l in g) b[l] = e.htmlDecode(g[l]);
                                        b.returnCommentExpanded = h.alwaysShowFullText;
                                        e.get({
                                            url: "/feeditems/" + b.feeditemid + "/comments",
                                            params: b,
                                            failure: function () {
                                                e.unmask(d)
                                            },
                                            success: function (b, g) {
                                                c();
                                                a.child(".cxfeedcommentsshowmore").remove();
                                                var h = a.child(".cxcomments");
                                                h.createChild(g.html, a.child(".cxcomments\x3e.cxfeedcomment:first"));
                                                var f = chatter.getEventBus();
                                                SfdcApp.MruHovers.isHoverSection(a) && f.fireEvent("chatter:hover", "onAfterUpdate", {
                                                    container: h
                                                });
                                                SfdcCmp.init(h.dom);
                                                e.unmask(d);
                                                a.child(".cxaddcommentaction").focus()
                                            }
                                        });
                                        return !1
                                    }

                                    function t() {
                                        return Sfdc.get(".feedsupermenu", m())
                                    }

                                    function N(a, b) {
                                        f.searchString = b;
                                        var c = {
                                            isPost: !0,
                                            verb: ";edit",
                                            feedType: "SEARCH",
                                            isFullRefresh: !1
                                        },            d;
                                        d = a.params ? a.params : a;
                                        d.showFeedItemsOnly = !0;
                                        d.initialViewMode = "feeds";
                                        d.str = f.searchString;
                                        var e = Sfdc.get("filterDisplay");
                                        e && (d.label = e.innerHTML);
                                        "SEARCH" !== a.feedType && (f.findInFeedType = a.feedType);
                                        d.findInFeedType = f.findInFeedType;
                                        c.params = d;
                                        var h = Sfdc.clone(c.onSuccess);
                                        c.onSuccess = function () {
                                            f.expandSearchAndShowMenu(b);
                                            Sfdc.isFunction(h) &&
                h(json);
                                            if (d.isDropDownFiltersVisible) {
                                                var a = Sfdc.get("filterDisplay");
                                                a && Sfdc.Dom.updateHTML(a, d.label)
                                            }
                                        };
                                        return c
                                    }
                                    var f = this,
        u = chatter.getToolbox(),
        H = 5E3,
        B = 16,
        C = 2,
        z = {},
        D = {};
                                    f.config = {};
                                    f.commentVisibilityHelpLink;
                                    var Y = function (a) {
                                        return (a = a.select("div.cxfeedcomment")) && 0 < a.getCount()
                                    },
        O = function (a, b) {
            var c = chatter.getToolbox(),
                d = k(a);
            c.hide(d.child(".cxcontentcommentaction"));
            chatter.getToolbox().get({
                params: {
                    q: ";linkedContentDetails",
                    contentDocumentId: b,
                    cc: !0
                },
                success: function (d, c) {
                    k(a).child(".cxcontentcommentinfo").dom.innerHTML =
                        c.html
                }
            })
        },
        Z = function (a, b, c) {
            var d = chatter.getToolbox(),
                e = k(a);
            d.hide(e.child(".cxcontentcommentaction"));
            var h = ExternalFileProgressDialog.showOnGetFileInfo("extFileProgress");
            chatter.getToolbox().get({
                url: "/contenthub/linkedfiledetails/" + b + "/" + encodeURIComponent(c),
                params: {
                    cc: !0
                },
                success: function (d, c) {
                    h.hide();
                    k(a).child(".cxcontentcommentinfo").dom.innerHTML = c.html
                },
                failure: function (a, d) {
                    h.hide()
                }
            })
        },
        v = function (a) {
            return attachFileEl = a.child(".cxcontentcommentaction")
        },
        P = function (a, b, c) {
            a = k(a).child(".cxnewcommenttext");
            c ? a.addClass(b) : a.removeClass(b)
        },
        Q = function (a) {
            chatter.getToolbox().log("Fetching feed");
            var b = a.params || {};
            b.isFullRefresh = !1;
            var c = a.verb || "",
                d = b.subjectId ? b.subjectId : UserContext.userId,
                b = {
                    url: a.url || "/feed/" + d + "/" + a.feedType + c,
                    params: b,
                    success: a.onSuccess,
                    failure: a.onFailure,
                    abortTargets: ["feedRefresh"],
                    ajaxInstanceKey: "feedRefresh"
                };
            a = a.isPost ? "post" : "get";
            chatter.getToolbox()[a](b)
        },
        R = function (a, b) {
            chatter.getToolbox().log("Replacing feed with fetched feed");
            var c = m();
            Sfdc.Dom.hideByVisibility(c);
            var d = chatter.getEventBus();
            d.fireEvent("chatter:feed", "onBeforeRemoveFeed");
            var e = a.html;
            Sfdc.Dom.updateHTML(A(), e, !0);
            (e = Sfdc.get(b.feedItemId, c)) && f.removeItemElement(e);
            Sfdc.Dom.show(c, !0);
            a.pollingToken = b.pollingToken;
            d.fireEvent("chatter:feed", "onAfterFeedRefresh", {
                json: a
            });
            E(b)
        },
        E = function (a) {
            var b = chatter.getEventBus();
            b.fireEvent("chatter:feed", "onBeforeNewPostFeedUpdate", {
                json: a
            });
            var c = chatter.getToolbox().runScriptReturnHtml(a.html, chatter.getYoutubeVideo().fetchVideoPreviews),
                c = f.addFeedItem(c);
            b.fireEvent("chatter:feed", "onAfterNewPostFeedUpdate", {
                json: a,
                feedItem: c
            })
        },
        S = function (a, b) {
            E(b.json)
        };
                                    this.wire = function () {
                                        SfdcCmp.init(m());
                                        var a = V();
                                        a && SfdcCmp.init(a);
                                        D = {};
                                        z = {};
                                        f.config = f.getConfig();
                                        f.listenersWired || (a = chatter.getEventBus(), a.addEventListener("chatter:publisher", "onAfterUpdateStatus", function (a, c) {
                                            m() && S(a, c)
                                        }), a.addEventListener("chatter:feed", "onAfterMarkAsBest", function (a, c) {
                                            var d = c.feedItemEl,
                e = d.child(".questionTitleAndBody"),
                d = d.child(".cxfeeditemaux");
                                            e && (Ext.DomHelper.insertBefore(e,
                c.feedItemBodyHtml), e.remove(), d && d.remove())
                                        }), a.addEventListener("chatter:feed", "onAfterDeleteFeedComment", function (a, c) {
                                            var d = c.feedItemEl,
                e = d.child(".questionTitleAndBody"),
                h = d.child(".cxfeeditemaux");
                                            e && h && d.child(".bestAnswerBody").dom.getAttribute("data-bestanswerid") === c.commentId && h.remove()
                                        }), f.listenersWired = !0)
                                    };
                                    this.initializeFeedFilterReset = function () {
                                        chatter.getFeed().wireFeedSwitchAfterPost(Sfdc.clone(chatter.getFeed().getConfig()), function () {
                                            return "all" !== chatter.getFeed().getConfig().feedfilter
                                        })
                                    };
                                    this.wireFeedSwitchAfterPost = function (a, b) {
                                        var c = null,
            d = chatter.getEventBus();
                                        d.addEventListener("chatter:publisher", "onBeforeUpdateStatus", function (e, h) {
                                            if (m() && b()) {
                                                c = null;
                                                var g = {};
                                                g.params = a;
                                                g.feedType = a.feedType;
                                                g.onSuccess = function (a, b) {
                                                    c = b;
                                                    d.fireEvent("chatter:feed", "onAfterSwitchFeedRetrieved")
                                                };
                                                g.onFailure = function (a, d) {
                                                    0 !== a.status && (!d || !d.errormessage) && alert(LC.getLabel("Feeds", "GenericFailureNoGack"))
                                                };
                                                Q(g)
                                            }
                                        });
                                        S = function (a, h) {
                                            if (b())
                                                if (c) R(c, h.json);
                                                else {
                                                    var g = function () {
                                                        d.removeEventListener("chatter:feed",
                            "onAfterSwitchFeedRetrieved", g);
                                                        R(c, h.json)
                                                    };
                                                    d.addEventListener("chatter:feed", "onAfterSwitchFeedRetrieved", g)
                                                } else E(h.json)
                                        }
                                    };
                                    this.getConfig = function () {
                                        var a = {},            b = m();
                                        b && (b = b.getAttribute("data-feed")) && Sfdc.apply(a, Sfdc.JSON.parse(b), !0);
                                        return a
                                    };
                                    this.getFeedItemData = function (a) {
                                        var b = {};
                                        a && (a = Sfdc.Dom.getAttribute(a, "data-feeditem")) && Sfdc.apply(b, Sfdc.JSON.parse(a), !0);
                                        return b
                                    };
                                    this.lazyLoadRechatDropdown = function (a) {
                                        D[a] || (D[a] = new CheckedMenu(a, !1))
                                    };
                                    this.setSearch = function (a) {
                                        f.search = a
                                    };
                                    this.setAdditionalPagingParams = function (a) {
                                        f.pagingParams = a
                                    };
                                    this.setItemTypeFilter = function (a) {
                                        f.itemTypeFilter = a
                                    };
                                    this.isLiveFeed = function () {
                                        var a = f.getConfig();
                                        return !!f.activePoller && "NEWS" === a.feedType && "all" === a.feedfilter
                                    };
                                    this.getFeedItemData = function (a) {
                                        return feedItemData = (a = a.getAttribute("data-feeditem")) ? Sfdc.JSON.parse(a) : {}
                                    };
                                    this.setCommentVisibilityHelpLink = function (a) {
                                        this.commentVisibilityHelpLink || (this.commentVisibilityHelpLink = a)
                                    };
                                    this.getCommentVisibilityHelpLink = function () {
                                        return this.commentVisibilityHelpLink
                                    };
                                    this.showCommentPlaceholder = function (a) {
                                        a = Ext.get(a).parent(".feeditemcontent");
                                        a.child(".feeditemcommentplaceholder").show();
                                        a.child(".cxfeeditemcommentdot").setStyle("display", "none");
                                        a.child(".feeditemactionlink").setStyle("display", "none")
                                    };
                                    this.showCommentBoxViaAnchor = function (a) {
                                        var b = k(a),
            c = chatter.getToolbox(),
            d = b.child(".cxnewcommentaction");
                                        chatter.onDeferLoad(function () {
                                            c.show(b.child(".cxnewcomment").addClass("feedArrow"));
                                            c.hide(b.child(".cxcommentplaceholder"));
                                            d && c.enableButton(d);
                                            var a = b.child(".cxnewcommenttext");
                                            J(a);
                                            a.dom.style.minHeight = B * C + "px";
                                            c.show(b.child(".cxnewcomment").addClass("feedArrow"));
                                            a.focus()
                                        });
                                        return !1
                                    };
                                    this.showCommentBoxViaPlaceholder = function (a) {
                                        var b = k(a),
            c = chatter.getToolbox(),
            d = b.child(".cxnewcommentaction");
                                        chatter.onDeferLoad(function () {
                                            c.hide(b.child(".cxcommentplaceholder"));
                                            c.show(b.child(".cxnewcomment").removeClass("feedArrow"));
                                            d && c.enableButton(d);
                                            var a = b.child(".cxnewcommenttext");
                                            J(a);
                                            a.dom.style.minHeight = B * C + "px";
                                            c.show(b.child(".cxnewcomment").removeClass("feedArrow"));
                                            a.focus()
                                        });
                                        return !1
                                    };
                                    this.showCommentBoxViaPlaceholderOnKeyPress = function (a, b) {
                                        if (b.keyCode == KEY_ENTER) return this.showCommentBoxViaPlaceholder(a)
                                    };
                                    this.showFirstCommentBoxAtPageLoad = function () {
                                        var a = Ext.get(m()).child(".cxfeeditem").child(".cxcomments"),            b = a.child(".cxfeedcomment");
                                        Ext.onReady(function () {
                                            b ? f.showCommentBoxViaPlaceholder(a) : f.showCommentBoxViaAnchor(a)
                                        })
                                    };
                                    this.hideMoreChanges = function (a) {
                                        a = k(a);
                                        var b = chatter.getToolbox();
                                        b.show(a.child(".feedTrackedChangePreambleMessage"));
                                        b.hide(a.child(".cxexpandedtext"))
                                    };
                                    this.showMoreChanges = function (a) {
                                        a = k(a);
                                        var b = chatter.getToolbox();
                                        b.hide(a.child(".feedTrackedChangePreambleMessage"));
                                        b.show(a.child(".cxexpandedtext"))
                                    };
                                    this.addFeedItem = function (a) {
                                        var b = Ext.get(m()),            c = b.child(".cxfeeditem");
                                        if (null === c) {
                                            if (c = b.child(".emptyfeed")) Ext.DomHelper.insertBefore(c, a), c.remove()
                                        } else Ext.DomHelper.insertBefore(c, a);
                                        SfdcCmp.init(Sfdc.Dom.getFirstChild(m(), ".cxfeeditem"));
                                        return b.child(".feeditem").dom
                                    };
                                    this.commentBoxBlur = function (a, b) {
                                        var c = k(a),
            d = chatter.getToolbox(),
            e = c.child(".cxnewcommenttext").dom,
            h = f.getCommentElement(e.id).getValue();
                                        chatter.getToolbox().stringIsEmpty(h) && (!this.getDisableCommentBoxBlur(a) && !this.getAttachingContent(a) && !this.hasContentAttached(a) && !e.hasFocus) && (d.hide(c.child(".cxnewcomment")), d.show(c.child(".cxcommentplaceholder")))
                                    };
                                    this.setDisableCommentBoxBlur = function (a, b) {
                                        P(a, "disableCommentBoxBlur", b)
                                    };
                                    this.getDisableCommentBoxBlur = function (a) {
                                        return k(a).child(".cxnewcommenttext").hasClass("disableCommentBoxBlur")
                                    };
                                    this.setAttachingContent =
        function (a, b) {
            P(a, "attachingContent", b)
        };
                                    this.getAttachingContent = function (a) {
                                        return k(a).child(".cxnewcommenttext").hasClass("attachingContent")
                                    };
                                    this.hasContentAttached = function (a) {
                                        return k(a).child(".linkedContentDetailsContainer") ? !0 : !1
                                    };
                                    this.contentCommentActionBlur = function (a) {
                                        this.setDisableCommentBoxBlur(a, !1);
                                        a = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown();
                                        (!a || !a.hasFocus) && a && a.close()
                                    };
                                    this.contentCommentActionFocus = function (a) {
                                        this.setDisableCommentBoxBlur(a, !0)
                                    };
                                    this.contentCommentActionMouseDown =
        function (a) {
            this.setDisableCommentBoxBlur(a, !0)
        };
                                    this.createContentComment = function (a, b, c) {
                                        this.setDisableCommentBoxBlur(a, !0);
                                        a.focus();
                                        a = k(a);
                                        a = v(a).dom;
                                        if (c = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown(c)) (b = Ext.get(Sfdc.AccessibleSelectFileDropDownPanel.SELECT_FILE_DROPDOWN_ID)) && !b.isStyle("display", "none") ? c.close() : c.show(a)
                                    };
                                    this.showContentCommentLink = function (a) {
                                        var b = function () {
                                            return chatter.getFeed().getFeedItemData(Sfdc.Dom.getParent(a, ".cxfeeditem")).parentid
                                        },
            c = "findExistingContentForContentComment" +            b();
                                        chatter.getFeed().handleLinkedFile = function (d) {
                                            OverlayDialogElement.getDialog(c).hide();
                                            O(a, d)
                                        };
                                        chatter.getFeed().handleExternalLinkedFile = function (d, b) {
                                            OverlayDialogElement.getDialog(c).hide();
                                            Z(a, d, b)
                                        };
                                        b = chatter.getPublisher().getHandler("ContentPost").openSelectFilesToAttach(c, !0, b);
                                        b.display();
                                        b.cancel = function () {
                                            IFrameDialog.prototype.cancel.call(this);
                                            var d = k(a);
                                            v(d).focus()
                                        };
                                        b.hide = function () {
                                            IFrameDialog.prototype.hide.call(this);
                                            chatter.getFeed().setAttachingContent(a, !1)
                                        }
                                    };
                                    this.showContentCommentUpload =        function (a) {
            var b = k(a);
            Sfdc.AccessibleUploadFileDialog.open({
                successHandler: function (c, d) {
                    chatter.getFeed().setAttachingContent(a, !1);
                    var e = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown();
                    e && (e.docId = d.docid);
                    O(a, d.docid);
                    e = v(b);
                    u.hide(e)
                },
                isContentComment: !0,
                cancelHandler: function () {
                    chatter.getFeed().setAttachingContent(a, !1);
                    v(b).focus()
                }
            })
        };
                                    this.removeContentComment = function (a, b) {
                                        var c = Sfdc.AccessibleSelectFileDropDownPanel.getSelectFileDropdown();
                                        if (b && c && "uploadFile" == c.source) {
                                            var c =
                c.docId,
                d = chatter.getToolbox();
                                            d.post({
                                                url: "/chatterfile/" + c + ";delete",
                                                id: c,
                                                success: function () { },
                                                failure: function (a, d) { }
                                            })
                                        }
                                        d = k(a);
                                        c = v(d);
                                        (d = d.child(".linkedContentDetailsContainer")) && d.remove();
                                        d = chatter.getToolbox();
                                        d.show(c);
                                        c.focus()
                                    };
                                    this.getCommentElement = function (a) {
                                        return z[a]
                                    };
                                    this.removeCommentElement = function (a) {
                                        z[a] = null
                                    };
                                    this.newComment = function (a, b, c) {
                                        var d = k(a),
            e = chatter.getToolbox(),
            h = d.child(".cxnewcommenttext").dom;
                                        e.disable(h);
                                        var g = d.child(".cxnewcommentaction");
                                        e.disableButton(g);
                                        var l = f.getCommentElement(h.id),
            p = l.getInputWithEncodedAtMentions(),
            n = d.child(".cxversionid"),
            r = d.child(".cxexternaldatasourceid"),
            s = d.child(".cxexternaldocumentid"),
            m = d.child(".cxsharedbyreference");
                                        if (chatter.getToolbox().stringIsEmpty(p) && !n && (!r || !s)) e.enable(h), e.enableButton(g);
                                        else {
                                            var T;
                                            n && (T = n.dom.innerHTML);
                                            var F, q;
                                            r && s && (F = r.dom.innerHTML, q = s.dom.innerHTML);
                                            e.log("comment submit");
                                            var U = chatter.getEventBus(),
                w = {
                    feeditemid: b,
                    dom: a
                };
                                            U.fireEvent("chatter:publisher", "onBeforeComment", w);
                                            n =
                f.getPollToken();
                                            omnitureWrapper.trackEvent(chatter.getOmnitureEventMap().postComment);
                                            var x;
                                            F && q && (x = ExternalFileProgressDialog.showOnPostFile("extFileProgress", m ? "true" == m.dom.innerHTML : !1));
                                            e.post({
                                                url: "/feeditems/" + b + "/comments",
                                                params: {
                                                    text: p,
                                                    pollingToken: n,
                                                    relatedRecordId: T,
                                                    returnCommentExpanded: f.getConfig().alwaysShowFullText,
                                                    feedItemType: c,
                                                    externalDataSourceId: F,
                                                    externalDocumentId: q,
                                                    feedType: f.getConfig().feedType
                                                },
                                                failure: function (a, d) {
                                                    x && x.hide();
                                                    d && (d.errors && d.errors.comment) && alert(d.errors.comment);
                                                    e.enable(h);
                                                    e.enableButton(g)
                                                },
                                                success: function (c, b) {
                                                    x && x.hide();
                                                    h.value = "";
                                                    h.style.height = "";
                                                    l.clearAtMentions();
                                                    e.hide(d.child(".cxnewcomment"));
                                                    e.enable(h);
                                                    e.show(d.child(".cxcommentplaceholder"));
                                                    var g = d.child(".cxcomments");
                                                    e.show(g);
                                                    chatter.getTextareaMessageUtil().hideMessage({
                                                        el: h.id,
                                                        hideAll: !0
                                                    });
                                                    g.createChild(b.html);
                                                    K(d, 1);
                                                    w.json = b;
                                                    var g = Sfdc.select(".cxfeedcomment", g.dom),
                        f = null;
                                                    0 < g.length && (f = g[g.length - 1]);
                                                    w.element = f;
                                                    SfdcCmp.init(w.element);
                                                    U.fireEvent("chatter:publisher", "onAfterComment",
                        w);
                                                    chatter.getFeed().removeContentComment(a, !1)
                                                }
                                            })
                                        }
                                    };
                                    this.IE7ZIndexFeedItemOverflowMenuFix = function (a) {
                                        var b = Sfdc.Dom.getParent(a, ".cxallfeedactions"),
            c = SfdcCmp.findInstance(b, SfdcCmp.Ui.Dropdown, !0);
                                        if (c) {
                                            var d = Sfdc.Dom.getParent(b, ".feeditembodyandfooter");
                                            c.attach("onexpand", function () {
                                                Sfdc.Dom.addClass(d, "feeditemZIndex")
                                            });
                                            c.attach("oncollapse", function () {
                                                Sfdc.Dom.removeClass(d, "feeditemZIndex")
                                            })
                                        }
                                        a.onclick = null
                                    };
                                    this.checkAccessAndDeleteItem = function (a, b, c) {
                                        var d = this,
            e = chatter.getToolbox();
                                        e.log("checking access before deleting post with id: " + b);
                                        e.get({
                                            url: "/feeditems/" + b + "/deleteable",
                                            success: function () {
                                                d.deleteItem(a, b, c)
                                            }
                                        })
                                    };
                                    this.deleteItem = function (a, b, c) {
                                        var d = f.getFeedItemData(Sfdc.Dom.getParent(a, ".cxfeeditem")),
            e = d.parentid,
            h = d.feedItemType,
            d = q("Feeds", "FeedPostDeleteConfirmation", h),
            g = q("Feeds", "FeedConversationDeleteConfirmation", h),
            h = q("Feeds", "FeedPostDeleteNonCreatorMsg", h),
            d = Y(k(a)) ? g : d;
                                        c || (d = d + "\n\n" + h);
                                        if (confirm(d)) {
                                            var l = chatter.getToolbox();
                                            l.mask(Ext.fly(a));
                                            var p = !1;
                                            c = null;
                                            0 < Ext.query(".contentActionLink", k(a).dom).length && (p = chatter.getRecentFiles().isWidgetPresent()) && (c = chatter.getRecentFiles().getEntityId());
                                            l.post({
                                                url: "/feeditems/" + b + ";delete",
                                                params: {
                                                    refreshRecentFiles: p,
                                                    recentFilesEntityId: c,
                                                    feedItemParentId: e
                                                },
                                                failure: function () {
                                                    l.unmask(Ext.fly(a))
                                                },
                                                success: function (d, c) {
                                                    f.removeItemElement(a);
                                                    p && chatter.getRecentFiles().refresh(c.recentFilesPanelHtml)
                                                }
                                            });
                                            chatter.getEventBus().fireEvent("chatter:feed", "onAfterDeleteFeedItem", {
                                                el: this
                                            })
                                        }
                                    };
                                    this.removeItemElement =
        function (a) {
            var b = k(a),
                c = Ext.get(m());
            b.remove();
            u.unmask(Ext.fly(a));
            c.child(".cxfeeditem") || Ext.DomHelper.append(c, {
                cls: "emptyfeed",
                tag: "div",
                html: LC.getLabel("Feeds", "emptyFeed")
            })
        };
                                    this.checkAccessAndDeleteComment = function (a, b, c, d) {
                                        var e = chatter.getToolbox(),
            h = this,
            g = k(a).dom.id,
            f = h.getFeedItemData(Sfdc.Dom.getParent(a, ".cxfeeditem")).feedItemType;
                                        e.log("checking access before deleting comment with id: " + c + " from feed item with id " + g);
                                        e.get({
                                            url: "/feeditems/" + g + "/comments/" + c + "/deleteable",
                                            success: function () {
                                                h.deleteComment(a,
                    b, f, c, d)
                                            }
                                        })
                                    };
                                    this.deleteComment = function (a, b, c, d, e) {
                                        b = q("Feeds", "CommentDeleteConfirmation", c);
                                        c = q("Feeds", "CommentDeleteNonCreatorMsg", c);
                                        e || (b = b + "\n\n" + c);
                                        if (confirm(b)) {
                                            var h = chatter.getToolbox(),
                g = Ext.get(a);
                                            h.mask(g);
                                            e = k(a).dom.id;
                                            h.log("delete comment with id: " + d + " from feed item with id " + e);
                                            h.post({
                                                url: "/feeditems/" + e + "/comments/" + d + ";delete",
                                                failure: function () {
                                                    h.unmask(g)
                                                },
                                                success: function () {
                                                    var c = k(a);
                                                    Ext.fly(a).findParent(".cxfeedcomment", 50, !0).remove();
                                                    K(c, -1);
                                                    L(c);
                                                    chatter.getEventBus().fireEvent("chatter:feed",
                        "onAfterDeleteFeedComment", {
                            feedItemEl: c,
                            commentId: d
                        })
                                                }
                                            })
                                        }
                                    };
                                    this.likeItem = function (a, b, c) {
                                        var d = chatter.getToolbox(),
            e = k(a),
            h = e.child(".cxlikeitemaction");
                                        d.mask(h);
                                        d.post({
                                            url: "/feeditems/" + b + "/likes",
                                            params: {
                                                feedItemType: c,
                                                feedType: f.getConfig().feedType
                                            },
                                            success: function (a, c) {
                                                d.hide(h);
                                                d.show(e.child(".cxunlikeitemaction"));
                                                d.unmask(h);
                                                d.show(e.child(".cxcomments"));
                                                e.child(".cxlikecontainer").dom.innerHTML = c.html;
                                                d.show(e.child(".cxlikecontainer"))
                                            },
                                            failure: function (a, c) {
                                                d.unmask(h)
                                            }
                                        })
                                    };
                                    this.unlikeItem =
        function (a, b) {
            var c = chatter.getToolbox(),
                d = k(a),
                e = d.child(".cxunlikeitemaction");
            c.mask(e);
            c.post({
                url: "/feeditems/" + b + "/likes;delete",
                success: function (a, b) {
                    c.hide(e);
                    var f = d.child(".cxlikeitemaction");
                    f ? c.show(f) : c.hide(d.child(".cxfeeditemlikedot"));
                    c.unmask(e);
                    d.child(".cxlikecontainer").dom.innerHTML = b.html;
                    L(d)
                },
                failure: function (a, d) {
                    c.unmask(e)
                }
            })
        };
                                    this.likeComment = function (a, b, c) {
                                        var d = chatter.getToolbox(),
            e = y(a),
            h = e.child(".cxlikecommentaction");
                                        d.mask(h);
                                        d.post({
                                            url: "/feeditems/" + b + "/likes?commentid\x3d" +
                c,
                                            params: {
                                                feedType: f.getConfig().feedType
                                            },
                                            success: function (a, c) {
                                                d.hide(h);
                                                d.show(e.child(".cxunlikecommentaction"));
                                                e.child(".cxcommentlikecontainer").dom.innerHTML = c.html;
                                                d.show(e.child(".cxcommentlikecontainer"));
                                                d.unmask(h)
                                            },
                                            failure: function (a, c) {
                                                d.unmask(h)
                                            }
                                        })
                                    };
                                    this.unlikeComment = function (a, b, c) {
                                        var d = chatter.getToolbox(),
            e = y(a),
            f = e.child(".cxunlikecommentaction");
                                        d.mask(f);
                                        d.post({
                                            url: "/feeditems/" + b + "/likes;delete?commentid\x3d" + c,
                                            success: function (a, c) {
                                                d.hide(f);
                                                var b = e.child(".cxlikecommentaction");
                                                b ? d.show(b) : d.hide(e.child(".cxcommentlikedot"));
                                                e.child(".cxcommentlikecontainer").dom.innerHTML = c.html;
                                                d.unmask(f)
                                            },
                                            failure: function (a, c) {
                                                d.unmask(f)
                                            }
                                        })
                                    };
                                    this.markAsBest = function (a, b, c) {
                                        var d = chatter.getToolbox(),
            e = y(a),
            h = k(a),
            g = e.child(".cxmarkasbestaction");
                                        d.mask(g);
                                        d.post({
                                            url: "/feeditems/" + b + "/bestanswer",
                                            params: {
                                                feedtype: f.getConfig().feedType,
                                                commentid: c
                                            },
                                            success: function (a, c) {
                                                d.hide(g);
                                                var b = h.query(".cxremovebestaction");
                                                b && Ext.each(b, function (a) {
                                                    d.hide(Ext.get(a))
                                                });
                                                (b = h.query(".bestAnswerHeader")) &&
                Ext.each(b, function (a) {
                    d.hide(Ext.get(a))
                });
                                                (b = h.query(".cxmarkasbestaction")) && Ext.each(b, function (a) {
                                                    d.show(Ext.get(a))
                                                });
                                                (b = e.child(".cxremovebestaction")) && d.show(b);
                                                if (b = e.child(".bestAnswerHeader")) b.dom.innerHTML = c.bestAnswerHeaderHtml, d.show(b);
                                                chatter.getEventBus().fireEvent("chatter:feed", "onAfterMarkAsBest", {
                                                    feedItemEl: h,
                                                    feedItemBodyHtml: c.feedItemBodyHtml
                                                });
                                                d.unmask(g);
                                                d.hide(g)
                                            },
                                            failure: function (a, c) {
                                                d.unmask(g)
                                            }
                                        })
                                    };
                                    this.removeAsBest = function (a, b) {
                                        var c = chatter.getToolbox(),
            d = y(a),
            e =
            d.child(".cxremovebestaction");
                                        c.mask(e);
                                        var f = k(a);
                                        c.post({
                                            url: "/feeditems/" + b + "/bestanswer;delete",
                                            success: function (a, b) {
                                                c.hide(e);
                                                var p = d.child(".cxmarkasbestaction");
                                                p && c.show(p);
                                                (p = d.child(".bestAnswerHeader")) && c.hide(p);
                                                (p = f.child(".cxfeeditemaux")) && c.hide(p);
                                                c.unmask(e)
                                            },
                                            failure: function (a, d) {
                                                c.unmask(e)
                                            }
                                        })
                                    };
                                    this.bringIntoView = function (a) {
                                        Sfdc.Dom.removeClass(a, "zen-assistiveText")
                                    };
                                    this.removeFromView = function (a) {
                                        Sfdc.Dom.addClass(a, "zen-assistiveText")
                                    };
                                    this.commentDeleteAddZenAssist = function (a) {
                                        a =            Sfdc.get(".commentDeleteLink", a);
                                        u.addZenAssist(a)
                                    };
                                    this.commentDeleteRemoveZenAssist = function (a) {
                                        a = Sfdc.get(".commentDeleteLink", a);
                                        u.removeZenAssist(a)
                                    };
                                    this.bookmark = function (a, b) {
                                        var c = chatter.getToolbox(),
            d = Sfdc.Dom.getParent(a, ".cxallfeedactions"),
            e = Sfdc.get(".bookmarked", d),
            f = LC.getLabel("Feeds", "FeedPostUnbookmarkVerb"),
            g = LC.getLabel("Feeds", "FeedPostUnbookmarkTooltip");
                                        c.post({
                                            url: "/feeditems/" + b + "/bookmarks",
                                            success: function (c, d) {
                                                Sfdc.Dom.show(e);
                                                a.onclick = null;
                                                a.onclick = function () {
                                                    chatter.getFeed().unbookmark(a,                        b)
                                                };
                                                Sfdc.Dom.setText(a, f);
                                                Sfdc.Dom.set(a, {
                                                    title: g
                                                })
                                            },
                                            failure: function (a, c) { }
                                        })
                                    };
                                    this.unbookmark = function (a, b) {
                                        var c = chatter.getToolbox(),
            d = Sfdc.Dom.getParent(a, ".cxallfeedactions"),
            e = Sfdc.get(".bookmarked", d),
            f = LC.getLabel("Feeds", "FeedPostBookmarkVerb"),
            g = LC.getLabel("Feeds", "FeedPostBookmarkTooltip");
                                        c.post({
                                            url: "/feeditems/" + b + "/bookmarks;delete",
                                            success: function (c, d) {
                                                Sfdc.Dom.hideByDisplay(e);
                                                a.onclick = null;
                                                a.onclick = function () {
                                                    chatter.getFeed().bookmark(a, b)
                                                };
                                                Sfdc.Dom.setText(a, f);
                                                Sfdc.Dom.set(a, {
                                                    title: g
                                                })
                                            },
                                            failure: function (a, c) { }
                                        })
                                    };
                                    this.expandItem = function (a, b) {
                                        var c = chatter.getToolbox(),            d = Ext.get(a).findParent(".cxmorecontainer", 50, !0);
                                        c.hide(d.child(".cxmorelink"));
                                        c.show(d.child(".cxexpandedcontent"));
                                        c.show(d.child(".cxlesslink"))
                                    };
                                    this.collapseItem = function (a, b) {
                                        var c = chatter.getToolbox(),            d = Ext.get(a).findParent(".cxmorecontainer", 50, !0);
                                        c.hide(d.child(".cxlesslink"));
                                        c.hide(d.child(".cxexpandedcontent"));
                                        c.show(d.child(".cxmorelink"))
                                    };
                                    this.expandRecordSummaryItem = function (a, b) {
                                        var c =
            chatter.getToolbox(),
            d = Ext.get(a).findParent(".rsmorecontainer", 50, !0);
                                        c.hide(d.child(".rsmorelink"));
                                        c.show(d.child(".rsexpandedcontent"))
                                    };
                                    this.toggle = function (a, b) {
                                        var c = {};
                                        Sfdc.apply(c, Sfdc.JSON.parse(a), !0);
                                        var d = chatter.getToolbox(),
            e = Sfdc.get(".chatterexpando"),
            f = null !== e,
            g = f && Sfdc.Dom.isVisible(e),
            l = function () {
                d.log("Started running animation callback.  Hiding: " + g);
                var a = Sfdc.get(".hideFeedLink"),
                    b = Sfdc.get(".showFeedLink");
                g ? (Sfdc.Dom.hideByDisplay(a), Sfdc.Dom.show(b), Sfdc.Dom.set(b, {
                    style: {
                        display: "inline-block"
                    }
                })) :
                    (Sfdc.Dom.hideByDisplay(b), Sfdc.Dom.show(a), Sfdc.Dom.set(a, {
                        style: {
                            display: "inline-block"
                        }
                    }), chatter.getEventBus().fireEvent("chatter:feed", "onAfterToggleShow", {
                        entityId: c.subjectId
                    }));
                Sfdc.Dom.setStyle(e, "overflow", "visible");
                e = null
            };
                                        f && (Sfdc.Dom.setStyle(e, "overflow", "hidden"), g ? Sfdc.Effects.rollOut(e, l) : Sfdc.Effects.rollIn(e, l));
                                        d.post({
                                            params: {
                                                q: "toggleFeed",
                                                id: c.subjectId,
                                                feedType: c.feedType,
                                                renderFeed: !f,
                                                withRecs: b
                                            },
                                            success: function (a, c) {
                                                if (!f) {
                                                    var d = Sfdc.get(".chatterfeedshell");
                                                    Sfdc.Dom.updateHTML(d,                        c.html, !0);
                                                    l()
                                                }
                                            }
                                        });
                                        return !1
                                    };
                                    this.expandSearch = function (a) {
                                        var b = Sfdc.get(".feedSearch"),            c = Sfdc.get(".feedSearchTerm");
                                        b && c && (Sfdc.Dom.addClass(b, "feedSearchOpen"), Sfdc.isDefAndNotNull(a) ? (Sfdc.get(".feedSearchForm") && Sfdc.Dom.set(c, "value", a), Sfdc.Dom.addClass(b, "feedSearchActive")) : (Sfdc.Dom.set(c, "value", ""), Sfdc.Dom.removeClass(b, "feedSearchActive")), c.focus())
                                    };
                                    this.expandSearchAndHideMenu = function (a) {
                                        this.expandSearch(a);
                                        a = t();
                                        Sfdc.Dom.addClass(a, "menuhidden")
                                    };
                                    this.expandSearchAndShowMenu =        function (a) {
            this.expandSearch(a);
            a = t();
            Sfdc.Dom.removeClass(a, "menuhidden");
            Sfdc.Dom.addClass(a, "shift")
        };
                                    this.closeSearchBox = function () {
                                        var a = m(),
            b = Sfdc.get(".feedSearch", a),
            a = Sfdc.get(".feedSearchTerm", a);
                                        b && a && (a.value = "", Sfdc.Dom.removeClass(b, "feedSearchOpen"), b = t(), Sfdc.Dom.removeClass(b, "menuhidden"), Sfdc.Dom.removeClass(b, "shift"))
                                    };
                                    this.runSearch = function (a) {
                                        a && Sfdc.Event.preventDefault(a);
                                        a = Sfdc.get(".feedSearchTerm").value;
                                        Sfdc.String.trim(a || "") ? (a = N(f.getConfig(), a), f.refresh(a)) : f.clearSearch()
                                    };
                                    this.clearSearch = function () {
                                        f.closeSearchBox();
                                        if (f.findInFeedType) {
                                            var a = f.getConfig(),
                b = {
                    isPost: !0,
                    verb: ";edit",
                    feedType: f.findInFeedType,
                    isFullRefresh: !1,
                    onSuccess: function () {
                        f.closeSearchBox()
                    }
                };
                                            if ("SEARCH" == a.feedType && f.search)
                                                for (var c in f.search) a[c] = chatter.getToolbox().htmlDecode(f.search[c]);
                                            var d = f.pagingParams;
                                            for (c in d) a[c] = chatter.getToolbox().htmlDecode(d[c]);
                                            b.params = a;
                                            f.searchString = null;
                                            f.findInFeedType = null;
                                            f.refresh(b)
                                        }
                                    };
                                    this.searchAllFeeds = function (a) {
                                        if (a && (a = a.getAttribute("data-search-url"))) window.location.href =
            Sfdc.Url.generateUrl(a, {
                str: Sfdc.String.trim(Sfdc.get(".feedSearchTerm").value || "")
            }, {
                allowMultipleOfParam: !0
            })
                                    };
                                    this.toggleSort = function (a, b, c) {
                                        c && Sfdc.Event.preventDefault(c);
                                        var d = f.getConfig(),
            e = chatter.getEventBus(),
            h = {
                sortByComments: b
            };
                                        e.fireEvent("chatter:FeedSort", "onBeforeSortFeed", h);
                                        a = {
                                            isPost: !0,
                                            verb: ";edit",
                                            feedType: d.feedType,
                                            isFullRefresh: !1,
                                            onSuccess: function () {
                                                if ("SEARCH" == d.feedType) {
                                                    f.expandSearch(g.str);
                                                    var a = t();
                                                    Sfdc.Dom.addClass(a, "shift")
                                                }
                                                g.isDropDownFiltersVisible && ((a = Sfdc.get("sortDisplay")) &&                    Sfdc.Dom.updateHTML(a, g.label), (a = Sfdc.get("filterDisplay")) && Sfdc.Dom.updateHTML(a, g.label));
                                                e.fireEvent("chatter:FeedSort", "onAfterSortFeed", h)
                                            }
                                        };
                                        var g = d;
                                        g.toggleSort = b;
                                        g.showFeedItemsOnly = !0;
                                        if (b = Sfdc.get("sortDisplay")) g.label = b.innerHTML;
                                        if (b = Sfdc.get("filterDisplay")) g.label = b.innerHTML;
                                        if ("SEARCH" == d.feedType && f.search)
                                            for (var l in f.search) g[l] = chatter.getToolbox().htmlDecode(f.search[l]);
                                        f.itemTypeFilter && "ENTITY" == d.feedType && (g.feedfilter = "feeditemtype", g.itemtypefilter = f.itemTypeFilter);
                                        b = f.pagingParams;
                                        for (l in b) g[l] = chatter.getToolbox().htmlDecode(b[l]);
                                        a.params = g;
                                        f.refresh(a)
                                    };
                                    this.showMoreFeedItems = function (a, b) {
                                        var c = Ext.get(m()),
            d = c.child(".cxshowmorefeeditemscontainer"),
            e = chatter.getToolbox(),
            h = chatter.getEventBus();
                                        (new LoadingScreen(d.dom, LC.getLabel("Global", "loading"))).show();
                                        var g = Sfdc.select("body");
                                        0 < d.dom.children.length && (0 < g.length && document.activeElement == g[0] && chatter.getAutoShowOlder().isReachedMaxExecutions()) && d.dom.children[0].focus();
                                        g = f.getConfig();
                                        b.writable =            g.writable;
                                        var l = f.search,            k;
                                        for (k in l) k && (b[k] = e.htmlDecode(l[k]));
                                        l = f.pagingParams;
                                        for (k in l) k && (b[k] = e.htmlDecode(l[k]));
                                        f.itemTypeFilter && "ENTITY" == g.feedType && (b.feedfilter = "feeditemtype", b.itemtypefilter = f.itemTypeFilter);
                                        "ENTITY" == g.feedType && (b.itemVisibilityFilter = g.itemVisibilityFilter);
                                        if (g.feedfilter && ("NEWS" == g.feedType || "ENTITY" == g.feedType)) b.feedfilter = g.feedfilter, b.keyprefix = g.keyprefix;
                                        chatter.getToolbox().get({
                                            url: "/feed/" + g.subjectId + "/" + g.feedType,
                                            params: b,
                                            failure: function () {
                                                e.unmask(d);
                                                h.fireEvent("chatter:feed", "onAfterShowMoreFeedItems", {
                                                    firstFeedItem: null
                                                })
                                            },
                                            success: function (a, d) {
                                                var b = c.child(".emptyfeed");
                                                null !== b && b.remove();
                                                var f = e.runScriptReturnHtml(d.html, chatter.getYoutubeVideo().fetchVideoPreviews),
                    b = c.child(".cxshowmorefeeditemscontainer"),
                    g = b.prev(".cxfeeditem"),
                    l = m();
                                                Sfdc.Dom.insertHTML(l, f);
                                                SfdcCmp.init(l);
                                                if (0 < b.dom.children.length && document.activeElement == b.dom.children[0]) {
                                                    f = b.dom.nextSibling;
                                                    for (l = []; 0 == l.length && null != f; ) l = Sfdc.select("a", f), f = f.nextSibling,                        0 < l.length && l[0].focus()
                                                }
                                                b.remove();
                                                h.fireEvent("chatter:feed", "onAfterShowMoreFeedItems", {
                                                    firstFeedItem: g.next(".cxfeeditem")
                                                })
                                            }
                                        });
                                        return !1
                                    };
                                    this.showMoreComments = function (a, b) {
                                        var c = k(a);
                                        return M(c, b, function () { })
                                    };
                                    this.showFirstPageOfComments = function (a, b) {
                                        var c = k(a);
                                        if (1 == c.select(".showmorecommentscontainer").elements.length) return M(c, b, function () {
                                            c.select(".cxfeedcomment").each(function (a) {
                                                a.remove()
                                            })
                                        })
                                    };
                                    this.applyDropDownFilter = function (a) {
                                        var b = f.getConfig(),
            c = {
                feedType: b.feedType,
                isFullRefresh: !1
            };
                                        c.params = {
                                            feedfilter: a.filterType,
                                            keyprefix: a.keyprefix,
                                            showFeedItemsOnly: !0,
                                            isDropDownFiltersVisible: !0,
                                            subjectId: b.subjectId || UserContext.userId,
                                            str: f.searchString,
                                            findInFeedType: f.findInFeedType,
                                            itemVisibilityFilter: a.itemVisibilityFilter
                                        };
                                        c.onSuccess = function () {
                                            if (f.searchString) {
                                                f.expandSearch(f.searchString);
                                                var b = t();
                                                Sfdc.Dom.addClass(b, "shift")
                                            } (b = Sfdc.get("filterDisplay")) && Sfdc.Dom.updateHTML(b, a.label)
                                        };
                                        f.refresh(c);
                                        omnitureWrapper.trackEvent(function (a) {
                                            var b = chatter.getOmnitureEventMap().showDropdownFilter +                "-" + a.filterType;
                                            "record" == a.filterType && (b += "-" + a.keyprefix);
                                            return b
                                        } (a))
                                    };
                                    this.refresh = function (a) {
                                        var b = chatter.getEventBus();
                                        if ("SEARCH" !== a.feedType) {
                                            var c = Sfdc.get(".feedSearchTerm", m());
                                            if (c) {
                                                var d = Sfdc.String.trim(c.value || "");
                                                d && ("" != d && d != Sfdc.Dom.getAttribute(c, "placeholder")) && (a = N(a, d))
                                            }
                                        }
                                        var e = Sfdc.clone(a.onSuccess),            h = Sfdc.clone(a.onFailure);
                                        a.onSuccess = function (a, c) {
                                            if (!c || !c.html) refreshFailure(a, c);
                                            else {
                                                b.fireEvent("chatter:feed", "onBeforeRemoveFeed");
                                                var d = c.html;
                                                Sfdc.Dom.updateHTML(A(),                    d, !0);
                                                b.fireEvent("chatter:feed", "onAfterFeedRefresh", {
                                                    json: c
                                                });
                                                Sfdc.isFunction(e) && e(c)
                                            }
                                        };
                                        a.onFailure = function (a, b) {
                                            Sfdc.isFunction(h) && h();
                                            0 !== a.status && (!b || !b.errormessage) && alert(LC.getLabel("Feeds", "GenericFailureNoGack"));
                                            f.loadingScreen && f.loadingScreen.hide()
                                        };
                                        b.fireEvent("chatter:feed", "onBeforeRemoveFeed");
                                        f.loadingScreen = new LoadingScreen(m(), LC.getLabel("Global", "loading"));
                                        f.loadingScreen.show();
                                        Q(a)
                                    };
                                    this.insertFeedItems = function (a) {
                                        var b = Ext.get(m());
                                        b.select(".cxfeeditem").each(function (a) {
                                            a.remove()
                                        });
                                        var c = b.child(".cxshowmorefeeditemscontainer");
                                        c && c.remove();
                                        (c = b.child(".emptyfeed")) && c.remove();
                                        (c = b.child(".cxfeedtitle")) ? Ext.DomHelper.insertAfter(c, a) : Ext.DomHelper.insertFirst(b, a)
                                    };
                                    this.showNewUpdates = function () {
                                        var a = Ext.get(m()).child(".newFeedItemsMessage");
                                        a && a.remove();
                                        f.refresh({
                                            feedType: "NEWS",
                                            params: {
                                                isDropDownFiltersVisible: !0
                                            }
                                        })
                                    };
                                    this.getPollToken = function () {
                                        var a = null;
                                        f.isLiveFeed() && (a = f.pollToken);
                                        return a
                                    };
                                    this.wireLiveFeed = function (a, b) {
                                        function c() {
                                            chatter.getToolbox().log("PAUSING STATUS POLLER");
                                            f.activePoller.stop();
                                            k = (new Date).getTime()
                                        }

                                        function d(a, b) {
                                            b && (b.json && b.json.pollingToken) && (e(b.json.pollingToken), l && (b.json.hasNewUpdates ? h(b.json) : (chatter.getToolbox().log("UNPAUSING STATUS POLLER"), f.activePoller.start())))
                                        }

                                        function e(a) {
                                            chatter.getToolbox().log("UPDATE POLL TOKEN: " + a);
                                            f.pollToken = a
                                        }

                                        function h(a) {
                                            if (l) {
                                                chatter.getToolbox().log("SHOWING NEW ITEMS MESSAGE");
                                                var b = Ext.get(m());
                                                if (!b.child(".newFeedItemsMessage")) {
                                                    var d = b.child(".feeditem");
                                                    b.createChild(a.liveFeedHtml, d);
                                                    b.first().fadeIn({
                                                        endOpacity: 1,
                                                        duration: 1.25
                                                    });
                                                    Sfdc.Aria.notify(LC.getLabel("Feeds", "live_newitems"));
                                                    chatter.getEventBus().fireEvent("chatter:feed", "onAfterLiveFeedMessageShown")
                                                }
                                                c()
                                            } else chatter.getToolbox().log("NEW ITEMS MESSAGE NOT SHOWN BECAUSE NOT ALLOWED")
                                        }

                                        function g() {
                                            var a;
                                            if (b) a = [                [3, 100]            ];
                                            else {
                                                a = Math.round(30);
                                                var d = Math.round(90),
                    g = Math.round(840 / d),
                    l = Math.round(300),
                    m = Math.round(2700 / l),
                    n = Math.round(3600);
                                                a = [
                    [a, 2],
                    [d, g],
                    [l, m],
                    [n, -1]
                ]
                                            }
                                            return {
                                                name: "live feed- " + UserContext.userId,
                                                callback: function () {
                                                    var a = (new Date).getTime();
                                                    chatter.getToolbox().log("POLLING (" + a + ")");
                                                    chatter.getToolbox().get({
                                                        url: "/feed/" + UserContext.userId + "/news/ismodified",
                                                        params: {
                                                            pollingToken: f.pollToken
                                                        },
                                                        success: function (b, c) {
                                                            c.pollingToken && e(c.pollingToken);
                                                            c.hasNewUpdates && (0 != k && a && a < k ? chatter.getToolbox().log("NEW ITEMS MESSAGE NOT SHOWN BECAUSE gatekeeperTimestamp BLOCKED IT") : (chatter.getToolbox().log("NEW MESSAGE GATEKEEPER PASSED(" + k + ", " + a + ")"), h(c)))
                                                        },
                                                        failure: c
                                                    });
                                                    return !0
                                                },
                                                intervals: a
                                            }
                                        }
                                        if (null == f.activePoller) {
                                            var l = !0,                k = 0;
                                            f.pollToken =                a;
                                            f.activePoller = chatter.getToolbox().poll(g());
                                            var n = chatter.getEventBus();
                                            n.addEventListener("chatter:feed", "onBeforeRemoveFeed", c);
                                            n.addEventListener("chatter:feed", "onAfterFeedRefresh", function (a, b) {
                                                var c = f.getConfig(), e = !c.feedfilter || "all" === c.feedfilter;
                                                l = "NEWS" === c.feedType && e;
                                                d(a, b)
                                            });
                                            n.addEventListener("chatter:feed", "onBeforeRechat", c);
                                            n.addEventListener("chatter:publisher", "onBeforeUpdateStatus", c);
                                            n.addEventListener("chatter:feed", "onAfterNewPostFeedUpdate", d);
                                            n.addEventListener("chatter:publisher",                "onBeforeComment",
                function () {
                    f.getConfig().sortByComments && c()
                });
                                            n.addEventListener("chatter:publisher", "onAfterComment", function (a, b) {
                                                f.getConfig().sortByComments && d(a, b)
                                            })
                                        }
                                    };
                                    this.removeCaseCommentFromPortal = function (a, b, c, d) {
                                        var e = chatter.getToolbox();
                                        k(a);
                                        d = d ? LC.getLabel("CaseInteraction", "ConfirmRemoveCustomerPortalPost") : LC.getLabel("CaseInteraction", "ConfirmRemovePortalPost");
                                        confirm(d) && (c = {
                                            url: "/caseinteraction/privateanswer/" + c + ";edit",
                                            params: {
                                                removeFromPortal: !0
                                            }
                                        }, "undefined" != typeof caseInteraction ?
            caseInteraction.getCaseFeed().postRemoveCaseComment(b, c) : (c.success = function (b, c) {
                c.feedItem && feed.addFeedItem(c.feedItem);
                f.removeItemElement(a)
            }, e.post(c)))
                                    };
                                    this.deleteReplyFromCase = function (a, b, c) {
                                        confirm(LC.getLabel("CaseInteraction", "ConfirmRemoveCustomerPortalPost")) && chatter.getToolbox().post({
                                            url: "/caseinteraction/publicanswer/" + c + ";delete",
                                            params: {
                                                replyId: b
                                            },
                                            success: function (b, c) {
                                                k(a).remove();
                                                u.unmask(Ext.fly(a))
                                            }
                                        })
                                    }
                                }
                                chatter.getToolbox().getPerfEnabled() && Perf.mark("Sfdc.ChatterFeed:End");
                                chatter.extend("Feed", Feed, null);

                                function NavigationGroups() {
                                    var b = {},        g;
                                    this.addNavigationGroup = function (c) {
                                        g = c.associatedGroup;
                                        var e = c.id;
                                        "null" != g ? (b[g] || (b[g] = {}), b[g][e] = new NavigationGroup(c)) : b[e] ? alert(["the id:", e, "is already in use."].join("")) : b[e] = new NavigationGroup(c)
                                    };
                                    this.getAssociatedGroup = function (c) {
                                        return b[c]
                                    };
                                    var l = this.clearSelectedStateInAssociatedGroup = function (c) {
                                        if (b[c]) {
                                            var e = b[c].selected;
                                            e && (b[c][e].reset(), b[c].selected = null)
                                        }
                                    };
                                    this.changeNavigationItemState = function (c, e, g, h) {
                                        l(c);
                                        b[c][e].changeNavigationItemState(g,            h)
                                    }
                                }

                                function NavigationGroup(b) {
                                    function g(a) {
                                        m = a;
                                        e ? chatter.getNavigationGroups().clearSelectedStateInAssociatedGroup(e) : l();
                                        f = a;
                                        Sfdc.Dom.addClass(f, "selected");
                                        (a = Sfdc.Dom.getParent(f, ".subNavSection")) && Sfdc.Dom.setStyle(a, "display", "block");
                                        a = Sfdc.get(".trigger", f);
                                        Sfdc.Dom.set(a, {
                                            title: ("" !== a.title ? a.title : a.innerHTML) + p
                                        });
                                        e && (chatter.getNavigationGroups().getAssociatedGroup(e).selected = b.id);
                                        m = null
                                    }

                                    function l() {
                                        if (f) {
                                            var a = m,                d = Sfdc.Dom.getParent(f, "div.subNavSection"),                a = a ? Sfdc.Dom.getParent(a, "div.subNavSection") :                !1;
                                            d && d != a && Sfdc.Dom.setStyle(d, "display", "none");
                                            Sfdc.Dom.removeClass(f, "selected");
                                            d = Sfdc.get(".trigger", f);
                                            Sfdc.Dom.set(d, {
                                                title: ("" !== d.title ? d.title : d.innerHTML).replace(p, "")
                                            });
                                            chatter.getEventBus().fireEvent("chatter:navigation", "onAfterLeavingItem", f);
                                            f = null
                                        }
                                    }

                                    function c(a) {
                                        var d = Sfdc.get(".subNavSection .default", a);
                                        return d ? d : Sfdc.get(".subNavSection .trigger", a)
                                    }
                                    var e = b.associatedGroup,
        k = b.id,
        h = Sfdc.get(k),
        f, m, q = Sfdc.select(".trigger", h),
        r = Sfdc.get(".overflow", h),
        n = Sfdc.get(".showMore",
            h),
        p = LC.getLabel("ChatterNavigation", "SelectedTitleExtra");
                                    (f = Sfdc.get(".subNavSection li.selected", h)) || (f = Sfdc.get("li.selected", h));
                                    f && (chatter.getNavigationGroups().getAssociatedGroup(e).selected = k);
                                    for (k = 0; k < q.length; k++) Sfdc.on(q[k], "click", function () {
                                        var a = Sfdc.Dom.getParent(this, "li");
                                        if (Sfdc.Dom.hasClass(a, "hasSubNav")) {
                                            a = c(a);
                                            if (a.onclick) a.onclick();
                                            a = Sfdc.Dom.getParent(a, "li")
                                        }
                                        g(a)
                                    });
                                    if (n) Sfdc.on(n, "click", function () {
                                        Perf.mark("NavigationGroupShowMoreStart");
                                        Sfdc.Dom.show(r);
                                        Sfdc.Dom.addClass(r,            "opened");
                                        Sfdc.Dom.hideByDisplay(n);
                                        Perf.endMark("NavigationGroupShowMoreStart")
                                    });
                                    this.reset = function () {
                                        l()
                                    };
                                    this.selectDefaultItem = function (a) {
                                        var d = Sfdc.get(".trigger", h),            b = Sfdc.Dom.getParent(d, "li");
                                        Sfdc.Dom.hasClass(b, "hasSubNav") && (d = c(b), b = Sfdc.Dom.getParent(d, "li"));
                                        if (a && d.onclick) d.onclick();
                                        g(b)
                                    };
                                    this.changeNavigationItemState = function (a, b) {
                                        var c = Sfdc.select("li.hasSubNav", h);
                                        c.length <= a || (c = Sfdc.select(".subNavSection li", c[a]), c.length <= b || g(c[b]))
                                    };
                                    this.getSelectedNavItem = function () {
                                        return f
                                    }
                                }
                                chatter.extend("NavigationGroups", NavigationGroups, null);
                                chatter.getToolbox().getPerfEnabled() && Perf.mark("Sfdc.ChatterPublisher:Start");

                                function Publisher() {
                                    function R(a, b) {
                                        if ("true" === Sfdc.Dom.getAttribute(a, "lazyInit")) {
                                            var c = Sfdc.String.trim(a.innerHTML).slice(4, -3);
                                            a.setAttribute("lazyInit", "");
                                            Sfdc.Dom.updateHTML(a, c, !0, b)
                                        } else b()
                                    }

                                    function S(a) {
                                        try {
                                            a.onShowPanel()
                                        } catch (b) {
                                            Sfdc.error(b)
                                        }
                                    }

                                    function T(a) {
                                        var b = d.getHandler(a);
                                        if (!U[a] && Sfdc.isFunction(b.setupPanel)) try {
                                            b.setupPanel(), U[a] = !0
                                        } catch (c) {
                                            Sfdc.error(c)
                                        }
                                    }

                                    function V(a) {
                                        var b = d.getHandler(g.actionId);
                                        a = window.event || a;
                                        !(a.shiftKey && 9 == a.keyCode) && (9 === a.keyCode && !b.focusFirstElement()) &&        (a.preventDefault ? a.preventDefault() : a.returnValue = !1)
                                    }

                                    function w() {
                                        r || chatter.getToolbox().updateHeight(e, C, C * J)
                                    }

                                    function W() {
                                        r && (r = !1);
                                        "TextPost" == p.actionId && K() && Sfdc.Dom.hasClass(f, "defaultState") && (Sfdc.Dom.removeClass(f, "defaultState"), w())
                                    }

                                    function X() {
                                        return {
                                            subjectId: null,
                                            entityType: null,
                                            isPrivateGroup: !1,
                                            isExternalGroup: !1
                                        }
                                    }

                                    function K() {
                                        var a = f.getAttribute("data-publisher");
                                        return a ? Sfdc.JSON.parse(a).useDefaultState : !0
                                    }

                                    function L() {
                                        var a = e;
                                        a.value = D();
                                        a.title = D();
                                        Sfdc.Dom.removeClass(a,            "publishertextareafocus");
                                        w();
                                        M(!1)
                                    }

                                    function Y(a) {
                                        var b = Sfdc.get(".publisherFeedItemTypeChoices", f),            c = Sfdc.get(".withArrowAttached", b);
                                        Sfdc.Dom.removeClass(c, "withArrowAttached");
                                        a = Sfdc.get(a, b);
                                        Sfdc.Dom.getParent(a, ".publisherTypeOverflow") ? Sfdc.Dom.addClass(Sfdc.Dom.getParent(a, ".publisherTypeOverflow"), "withArrowAttached") : Sfdc.Dom.addClass(a, "withArrowAttached")
                                    }

                                    function D() {
                                        var a = s[g.actionId];
                                        if (a && Sfdc.isString(a.config.promptText)) return a.config.promptText;
                                        N || (N = Ext.fly("publisherprompttext").getValue());
                                        return N
                                    }

                                    function Z() {
                                        var a = l || Sfdc.get("publishersharebutton"),            b;
                                        a:
                                        {
                                            b = s[g.actionId];
                                            if (Sfdc.isObject(b.config.submitValueAndTitle) && (b = b.config.submitValueAndTitle, b.value && b.title && Sfdc.isString(b.value) && Sfdc.isString(b.title))) break a;
                                            b = !1
                                        }
                                        b ? Sfdc.Dom.set(a, {
                                            value: b.value,
                                            title: b.title
                                        }) : (b = LC.getLabel("Publisher", "Share"), Sfdc.Dom.set(a, {
                                            value: b,
                                            title: b
                                        }))
                                    }

                                    function da(a, b) {
                                        if (a) {
                                            var c = Sfdc.get(".publisherTypeOverflow .zen-trigger", f),                k = null != Sfdc.Dom.getParent(a, ".publisherTypeOverflow");
                                            if (c) {
                                                var d =                    Sfdc.get(".publisherTypeOverflowSelected", c);
                                                if (d) {
                                                    var e = Sfdc.get(".publisherattachtext", d);
                                                    if (e)
                                                        if (Sfdc.each(e.childNodes, function (a) {
                                                            3 == a.nodeType && e.removeChild(a)
                                                        }), k) {
                                                            if (Sfdc.Dom.removeClass(d, "hidden"), k = Sfdc.get(".publisherFeedItemTypeChoice.publisherattach" + b, f), k = Sfdc.Dom.getText(k)) e.appendChild(document.createTextNode(k)), Sfdc.Dom.set(c, {
                                                                title: k
                                                            })
                                                        } else Sfdc.Dom.addClass(d, "hidden"), Sfdc.Dom.set(c, {
                                                            title: LC.getLabel("Publisher", "OverflowMenuTitle")
                                                        })
                                                }
                                            }
                                        }
                                    }

                                    function ea() {
                                        var a = e;
                                        d.isPromptText(a.value) &&            (a.value = "", Ext.isSafari && a.focus());
                                        Sfdc.Dom.addClass(e, "publishertextareafocus");
                                        Sfdc.Dom.addClass(f, "publisheronfocus");
                                        $ = Sfdc.Dom.get(e, "title");
                                        Sfdc.Dom.set(e, "title", "");
                                        W()
                                    }

                                    function aa() {
                                        d.isTextBoxEmpty() && L()
                                    }

                                    function ba() {
                                        var a = e,            b;
                                        b = m ? m.getInputValueLength() : e.value.length;
                                        b = b > O;
                                        var c = chatter.getTextareaMessageUtil().isMessageDisplayed(a.id, "PublisherMaxLengthErrorMsg"),            k = l.disabled;
                                        b && !k && d.disableShareButton();
                                        b != c && (c = LC.getLabel("Publisher", "PublisherMaxLengthErrorMsg"), b ? (M(!0), chatter.getTextareaMessageUtil().showMessage({
                                            el: a.id,
                                            type: 1,
                                            append: !0,
                                            msg_html: c,
                                            msg_id: "PublisherMaxLengthErrorMsg"
                                        })) : chatter.getTextareaMessageUtil().hideMessage({
                                            el: a.id,
                                            msg_id: "PublisherMaxLengthErrorMsg"
                                        }) || M(!1))
                                    }

                                    function M(a) {
                                        y !== a && ((y = a) ? d.disableShareButton() : d.enableShareButtonIfValid())
                                    }

                                    function fa() {
                                        for (var a = 0; a < z.length; a++) {
                                            var b = z[a];
                                            A.removeEventListener(b.namespace, b.eventname, b.listener)
                                        }
                                        z = []
                                    }

                                    function ga() {
                                        for (var a = u.widgetsToAdd, b = 0; b < a.length; b++) {
                                            var c = a[b];
                                            if (Sfdc.isFunction(c.wire)) try {
                                                c.wire()
                                            } catch (d) {
                                                Sfdc.error(d)
                                            }
                                            u.currentWidgets[c.widgetName] =                c
                                        }
                                        u.widgetsToAdd = []
                                    }

                                    function ca() {
                                        var a = Sfdc.get(".activeTemplate", n),
            b = Sfdc.get("." + g.actionId, n);
                                        Sfdc.Dom.hideByVisibility(n);
                                        Sfdc.Dom.removeClass(a, "activeTemplate");
                                        Sfdc.Dom.addClass(b, "activeTemplate");
                                        if (!E) {
                                            var a = Sfdc.get("publisherTextArea", n),
                c = Sfdc.get("publisherBottomBar", n),
                d = Sfdc.get("publisherPostToElement", c),
                e = Sfdc.get("publisherVisibilityWidget", c),
                f = Sfdc.get("publishersharebutton", c);
                                            E = [{
                                                className: "publisherTextAreaPlaceholder",
                                                element: a
                                            }, {
                                                className: "publisherBottomBarPlaceholder",
                                                element: c
                                            }, {
                                                className: "publisherPostToElementPlaceholder",
                                                element: d
                                            }, {
                                                className: "publisherVisibilityWidgetPlaceholder",
                                                element: e
                                            }, {
                                                className: "publisherShareButtonPlaceholder",
                                                element: f
                                            }]
                                        }
                                        a = E;
                                        for (c = 0; c < a.length; c++)
                                            if (d = a[c], e = Sfdc.get("." + d.className, b)) e.appendChild(d.element), Sfdc.Dom.hasClass(d.element, "hideElement") && Sfdc.Dom.removeClass(d.element, "hideElement");
                                        Sfdc.Dom.show(n)
                                    }
                                    var d = this,
        p = {
            actionId: "",
            actionType: ""
        },
        g = {
            actionId: "",
            actionType: ""
        },
        q = chatter.getToolbox(),
        A = chatter.getEventBus(),
        N, $, s = {},
        U = {},
        z = [],
        u = {
            widgetsToAdd: [],
            currentWidgets: {}
        },
        m = null,
        O, C, J, r, F, y, G, P, t, H, Q, I, E = null,
        e = null,
        f = null,
        n = null,
        l = null,
        B = null,
        v = [];
                                    this.DEFAULT_MAX_BODY_LENGTH = 5E3;
                                    this.FEEDITEM_VISIBILITY_INTERNAL_USERS = "INTERNAL_USERS";
                                    this.FEEDITEM_VISIBILITY_ALL_USERS = "ALL_USERS";
                                    this.getSubjectId = function () {
                                        return d.getSubject().subjectId
                                    };
                                    this.getRawBody = function () {
                                        return m.getInputWithEncodedAtMentions()
                                    };
                                    this.getTextArea = function () {
                                        return e
                                    };
                                    this.isPromptText = function (a) {
                                        return a == D()
                                    };
                                    this.addTopicId =        function (a) {
            null != a && "" != a && v.push(a)
        };
                                    this.removeTopicIds = function (a) {
                                        a = v.lastIndexOf(a); -1 < a && (v = v.splice(a, 1))
                                    };
                                    this.getTopicIds = function () {
                                        return v
                                    };
                                    this.clearTopicIds = function () {
                                        v = []
                                    };
                                    this.wire = function (a, b) {
                                        R(Sfdc.get(".publishercontainer .publisherWrapper ." + a), function () {
                                            d.wireDefaultPublisher(a, b)
                                        })
                                    };
                                    this.wireDefaultPublisher = function (a, b) {
                                        q.log("publisher core wiring started");
                                        var c = q.now();
                                        fa();
                                        u.currentWidgets = {};
                                        y = !1;
                                        P = G = !0;
                                        r = "TextPost" === a;
                                        t = null;
                                        isInternalOnly = I = Q = H = !1;
                                        d.setDefaultAction(a,            b);
                                        g.actionId = a || b;
                                        g.actionType = b;
                                        E = null;
                                        e = Sfdc.get("publishereditablearea");
                                        f = Sfdc.Dom.getParent(e, ".publishercontainer");
                                        Sfdc.get(".publisherTextAreaContainer", f);
                                        n = Sfdc.Dom.getParent(e, ".publisherWrapper");
                                        l = Sfdc.get("publishersharebutton");
                                        ga();
                                        SfdcCmp.init(f);
                                        var k = g.actionId,            h = d.getHandler(k);
                                        if (h) {
                                            ca();
                                            T(k);
                                            Y("publisherAttach" + g.actionId);
                                            Sfdc.on(e, "blur", function () {
                                                Sfdc.Dom.set(e, "title", $)
                                            });
                                            e.value = D();
                                            F = d.getSubject();
                                            var x = Sfdc.Dom.hasClass(e, "groupAtMentionsEnabled");
                                            chatter.onDeferLoad(function () {
                                                Sfdc.on(e,                    "focus", ea);
                                                chatter.getToolbox().initializeIE8JPNTypingFix(e);
                                                m = new PublisherAutoComplete("publishereditablearea", "/autocomplete", {}, null, x, F.subjectId, F.entityType, t)
                                            });
                                            Sfdc.on(e, "drop", aa);
                                            C = 16;
                                            J = h.config.defaultTextAreaLines || 3;
                                            w();
                                            Sfdc.on(e, "keyup", w);
                                            O = d.DEFAULT_MAX_BODY_LENGTH;
                                            Sfdc.on(e, "keyup", ba);
                                            Sfdc.on(e, "blur", aa);
                                            q.log("publisher core wiring finished in " + (q.now() - c) + "ms");
                                            Sfdc.userAgent.isIE7 && (Sfdc.on(l, "mouseover", function () {
                                                Sfdc.Dom.addClass(l, "onHover")
                                            }), Sfdc.on(l, "mouseout", function () {
                                                Sfdc.Dom.removeClass(l,                    "onHover")
                                            }));
                                            Z();
                                            S(h)
                                        }
                                    };
                                    this.submit = function () {
                                        var a = chatter.getEventBus(),            b = s[g.actionId];
                                        q.log("publisher submit");
                                        d.disablePublisher();
                                        a.fireEvent("chatter:publisher", "onBeforeUpdateStatus");
                                        b.config.omnitureEvent && omnitureWrapper.trackEvent(chatter.getOmnitureEventMap()[b.config.omnitureEvent]);
                                        var c = f.getAttribute("data-topics");
                                        d.addTopicId(c);
                                        var c = {
                                            feedItemType: g.actionId,
                                            entityId: d.getSubjectId(),
                                            feedItemVisibility: t,
                                            topicIds: d.getTopicIds()
                                        },            e = chatter.getFeed();
                                        if (e) {
                                            var h = e.getConfig();
                                            h && h.feedType && (c.feedType = h.feedType);
                                            if (e = e.getPollToken()) c.pollingToken = e
                                        }
                                        var x = function (c, e) {
                                            a.fireEvent("chatter:publisher", "onAfterUpdateStatus", {
                                                json: e
                                            });
                                            Sfdc.isFunction(b.onSuccess) && (b.onSuccess(c, e), Sfdc.isFunction(b.clearPanelState) && b.clearPanelState());
                                            d.switchToDefaultPublisherType()
                                        },
            e = function (a) {
                if (Sfdc.isFunction(b.validatePayload)) {
                    var c = b.validatePayload(a);
                    if (!c.isValid) {
                        if (Sfdc.isFunction(b.onValidationFailure)) b.onValidationFailure(c.errorPayload);
                        return
                    }
                }
                Sfdc.isFunction(b.postWithCustomFunction) ?  b.postWithCustomFunction(a) : q.post({
                        url: "/feeditems",
                        params: a,
                        failure: b.onFailure,
                        success: x
                    })
            },
            c = b.getPayload(c, e);
                Sfdc.isDefAndNotNull(c.isAsync) || e(c)
            };
            this.getPublisherContainer = function () {
                return f
            };
            this.isPublisherPresent = function () {
                return !!Sfdc.get("publishereditablearea")
            };
            this.show = function () {
                Sfdc.Dom.show(f)
            };
            this.hide = function () {
                Sfdc.Dom.hideByDisplay(f)
            };
            this.resetPublisher = function () {
                L();
                m && m.clearAtMentions();
                d.clearTopicIds();
                d.setIsExtensionValidForSubmit(!0)
            };
            this.enablePublisher = function () {
                d.enableShareButtonIfValid();
                d.enableTextArea(!0)
            };
            this.disablePublisher = function () {
                d.disableShareButton();
                d.enableTextArea(!1)
            };
            this.setIsExtensionValidForSubmit = function (a) {
                (P = a) ? d.enableShareButtonIfValid() : d.disableShareButton()
            };
            this.enableShareButtonIfValid = function () {
                var a = Sfdc.get("." + g.actionId, n), b = P && G;
                Sfdc.select(".publishertextarea", a).length && (b = b && !y);
                b && (l.disabled = !1)
            };
            this.disableShareButton = function () {
                l.disabled = !0
            };
            this.enableTextArea = function (a) {
                a ? chatter.getToolbox().enable(e) : chatter.getToolbox().disable(e)
            };
            this.focusOnTextArea = function () {
                e.focus();
                Sfdc.userAgent.isIE && (e.value = e.value)
            };
            this.showErrors = function (a) {
                alert(a)
            };
            this.isTextBoxEmpty = function () {
                var a = e.value;
                return q.stringIsEmpty(a) || d.isPromptText(a)
            };
            this.restoreDefaultUIState = function () {
                chatter.getTextareaMessageUtil().hideMessage({
                    el: e.id,
                    hideAll: !0
                });
                d.resetPublisher();
                d.enablePublisher();
                r || (r = !0);
                "TextPost" == p.actionId && K() && (Sfdc.Dom.addClass(f, "defaultState"), e.style.height = "16px");
                A.fireEvent("chatter:publisher", "onAfterRestoreDefaultUIState")
            };
            this.registerFeedItemTypeHandler = function (a, b, c) {
                a = c || a;
                return !s[a] && Sfdc.isObject(b) && Sfdc.isFunction(b.getPayload) && Sfdc.isFunction(b.onShowPanel) && Sfdc.isFunction(b.onSuccess) && Sfdc.isFunction(b.onFailure) && Sfdc.isObject(b.config) ? (b.publisherCore = this, s[a] = b, !0) : !1
            };
            this.getHandler = function (a) {
                return s[a]
            };
            this.initializeExtension = function (a, b, c) {
                var e = d.getHandler(b);
                if (e) {
                    T(b);
                    var h = d.getHandler(g.actionId);
                    if (h) try {
                        Sfdc.isFunction(h.removeEventsForPostType) && h.removeEventsForPostType(), Sfdc.isFunction(h.clearPanelState) && h.clearPanelState()
                    } catch (x) {
                        Sfdc.error(x)
                    }
                    h = d.isTextBoxEmpty();
                    g.actionId = b;
                    g.actionType = c;
                    h && L();
                    C = e.config.lineHeight || 16;
                    J = e.config.defaultTextAreaLines || 3;
                    O = e.config.maxBodyLength || d.DEFAULT_MAX_BODY_LENGTH;
                    ca();
                    Y("publisherAttach" + g.actionId);
                    b = Sfdc.get("." + g.actionId, n);
                    Sfdc.select(".publishertextarea", b).length && (w(), ba());
                    W();
                    b = (b = f.getAttribute("data-publisher")) ? Sfdc.JSON.parse(b).useEnhancedKeyboardNavigation : !0;
                    if (b) {
                        B && Sfdc.un(B, "keydown", V);
                        B = a;
                        if (g.actionId != p.actionId) Sfdc.on(B, "keydown", V);
                        if (!Sfdc.userAgent.isIE7) try {
                            B.focus()
                        } catch (l) { }
                    }
                    Z();
                    S(e);
                    da(a, g.actionId);
                    A.fireEvent("chatter:publisher", "onOpenTypeSpecificPanel", e)
                }
            };
            this.openTypeSpecificPanel = function (a, b, c) {
                var e = c || b;
                (g.actionId !== e || r) && R(Sfdc.get(".publishercontainer .publisherWrapper ." + e), function () {
                    d.initializeExtension(a, e, b)
                })
            };
            this.switchToDefaultPublisherType = function () {
                if (K()) {
                    var a = Sfdc.get("publisherAttach" + p.actionId, f);
                    d.openTypeSpecificPanel(a, p.actionType, p.actionId)
                }
                d.restoreDefaultUIState()
            };
            this.hideShowFollowV2Message = function () {
                chatter.getToolbox().get({
                    url: "/commands/hideFollowV2Message",
                    success: function () {
                        var a = chatter.getPublisher();
                        a.setShowFollowV2Message(!1);
                        a.getWidget("visibilityWidget").hideVisibilityBox();
                        Sfdc.Dom.removeClass(Sfdc.get("publisherVisibilityIcon"), "active")
                    }
                })
            };
            this.getVisibilityMessages = function () {
                var a = f.getAttribute("data-topics"), b = [];
                if (Q) {
                    var c = LC.getLabel("ChatterVisibility", "GotIt");
                    b.push({
                        HTML: '\x3cdiv class\x3d"zen-box zen-simple visibilityInfoBox"\x3e\x3cdiv class\x3d"zen-inner"\x3e\x3cdiv class\x3d"zen-body"\x3e\x3cp\x3e\x3ch3 class\x3d"infoMessageTitle"\x3e' + LC.getLabel("ChatterVisibility", "New") + '\x3c/h3\x3e\x3cp class\x3d"followV2Message"\x3e' + LC.getLabel("ChatterVisibility", "FollowV2Message", "\x3cb\x3e" + c + "\x3c/b\x3e") + '\x3c/p\x3e\x3cbutton  class\x3d"zen-btn" onclick\x3d"chatter.getPublisher().hideShowFollowV2Message()"title\x3d"' + c + '"\x3e' + c + "\x3c/button\x3e\x3c/p\x3e\x3c/div\x3e\x3c/div\x3e\x3c/div\x3e"
                    })
                }
                b = b.concat(PublisherVisibilityMessages.getVisibilityMessages(d.getSubject(), I, t, H, a));
                return (c = s[g.actionId]) && Sfdc.isFunction(c.getVisibilityMessages) ? b.concat(c.getVisibilityMessages(d.getSubject(), I, t, H, a)) : b
            };
            this.addEventListener = function (a, b, c) {
                A.addEventListener(a, b, c);
                z[z.length] = {
                    namespace: a,
                    eventname: b,
                    listener: c
                }
            };
            this.setSubject = function (a) {
                var b = X();
                Sfdc.apply(b, a, !0);
                m.updateParent(a.subjectId, a.entityType);
                a.subjectId ? (G = !0, d.enableShareButtonIfValid()) : (G = !1, d.disableShareButton());
                a.isExternalGroup ? Sfdc.Dom.addClass(f, "externalGroup") : Sfdc.Dom.removeClass(f, "externalGroup");
                f.setAttribute("data-publisher", Sfdc.JSON.stringify(a));
                A.fireEvent("chatter:publisher", "onAfterUpdateSubject", {
                    subjectId: a.subjectId
                })
            };
            this.setFeedItemVisibility = function (a) {
                t = a;
                m && m.updateFeedItemVisibility(t)
            };
            this.setHasUserSharingMessage = function (a) {
                H = a
            };
            this.setShowFollowV2Message = function (a) {
                Q = a
            };
            this.setIsFollowV2Enabled = function (a) {
                I = a
            };
            this.setDefaultAction = function (a, b) {
                p.actionId = a;
                p.actionType = b
            };
            this.getHasTextareaErrors = function () {
                return y
            };
            this.getSubject = function () {
                var a = f.getAttribute("data-publisher"), b = X();
                a && Sfdc.apply(b, Sfdc.JSON.parse(a), !0);
                return b
            };
            this.getOriginalSubject = function () {
                return F
            };
            this.addWidget = function (a) {
                a.lazyLoad = function () {
                    a.instance || (a.instance = a.get());
                    return a.instance
                };
                var b = u.widgetsToAdd;
                b[b.length] = a
            };
            this.getWidget = function (a) {
                var b = u.currentWidgets[a];
                Sfdc.isDebug && !b && Sfdc.log(a + " has not been wired yet.  Either the widget wasn't added with addWidget() or wireWidgets() was not called after it was added.", Sfdc.Logging.LogLevel.ERROR);
                return b.lazyLoad()
            };
            this.addPostToWidget = function () {
                var a = chatter.getPublisher();
                a.addWidget({
                    widgetName: "postToWidget",
                    get: function () {
                        var b = Sfdc.get(".postTo", a.getPublisherContainer()), c = new PostToWidget(b, a.setSubject);
                        a.addEventListener("chatter:publisher", "onAfterRestoreDefaultUIState", c.reset);
                        a.addEventListener("chatter:publisher", "onOpenTypeSpecificPanel", function (b) {
                            b = Sfdc.get(".activeTemplate", a.getPublisherContainer());
                            Sfdc.get(".postTo", b) ? d.setSubject(c.getSubject()) : d.setSubject(a.getOriginalSubject())
                        });
                        return c
                    }
                })
            };
            this.addVisibilityWidget = function (a, b, c, e) {
                var d = chatter.getPublisher();
                d.addWidget({
                    widgetName: "visibilityWidget",
                    get: function () {
                        d.setHasUserSharingMessage(b);
                        d.setShowFollowV2Message(e);
                        d.setIsFollowV2Enabled(c);
                        var f = Sfdc.Dom.getParent(Sfdc.get("publisherVisibilityIcon")), f = new VisibilityWidget({
                            icon: f,
                            helpUrl: a
                        });
                        f.registerHandler(d.getVisibilityMessages);
                        return f
                    },
                    wire: function () {
                        d.addEventListener("chatter:publisher", "onAfterUpdateSubject", function (a, b) {
                            var c = d.getWidget("visibilityWidget");
                            b.subjectId ? c.enableWidget() : c.disableWidget()
                        })
                    }
                })
            };
            this.addVisibilityDropdownWidget = function () {
                var a = chatter.getPublisher();
                a.addWidget({
                    widgetName: "visibilityDropdownWidget",
                    get: function () {
                        a.addEventListener("chatter:publisher", "onAfterRestoreDefaultUIState", function () {
                            a.setFeedItemVisibility(a.FEEDITEM_VISIBILITY_INTERNAL_USERS);
                            var b = Sfdc.get(".internalExternalDropdown .zen-select", a.getPublisherContainer());
                            SfdcCmp.getInstance(b).reset()
                        });
                        return {
                            setFeedItemVisibility: function (b) {
                                a.setFeedItemVisibility(b)
                            }
                        }
                    },
                    wire: function () {
                        a.setFeedItemVisibility(a.FEEDITEM_VISIBILITY_INTERNAL_USERS)
                    }
                })
            };                                
                                    if (q.getPerfEnabled()) {
                                        var ha = this.openTypeSpecificPanel,            ia = this.submit,            ja = this.registerFeedItemTypeHandler;
                                        this.openTypeSpecificPanel = function (a, b, c) {
                                            Perf.mark("openTypeSpecificPanel: " + b);
                                            ha.call(this, a, b, c);
                                            Perf.endMark("openTypeSpecificPanel: " + b)
                                        };
                                        this.submit = function () {
                                            Perf.mark("Publisher: submit");
                                            ia.call()
                                        };
                                        this.registerFeedItemTypeHandler = function (a, b, c) {
                                            if (a = ja.call(this, a, b, c)) {
                                                var d = b.onSuccess, e = b.onFailure;
                                                b.onSuccess = function (a, c) {
                                                    d.call(b, a, c);
                                                    Perf.endMark("Publisher: submit")
                                                };
                                                b.onFailure = function (a, c) {
                                                    e.call(b, a, c);
                                                    Perf.endMark("Publisher: submit")
                                                }
                                            }
                                            return a
                                        }
                                    }
                                }
                                chatter.getToolbox().getPerfEnabled() && Perf.mark("Sfdc.ChatterPublisher:End");
                                chatter.extend("Publisher", Publisher, null);
                                chatter.getToolbox().getPerfEnabled() && Perf.mark("Sfdc.ChatterTabUtil:Start");

                                function ChatterTab() {
                                    function n(a, b, c, d) {
                                        y();
                                        var e = "get";
                                        d.isPost && (e = "post");
                                        chatter.getEventBus().fireEvent("chatter:feed", "onBeforeRemoveFeed");
                                        (null != d.params.showRefreshStatus ? d.params.showRefreshStatus : 1) && D(a);
                                        var z = function (a, c) {
                                            if (d.onFailure) d.onFailure(c);
                                            0 !== a.status && (!c || !c.errormessage) && alert(LC.getLabel("Feeds", "GenericFailureNoGack"));
                                            if (b)
                                                for (var e = 0; e < b.length; e++) {
                                                    var f = b[e].pane;
                                                    chatter.getToolbox().updateHTML(f, b[e].html, !0)
                                                }
                                            y()
                                        },
            p = {
                url: d.url,
                params: d.params,
                success: function (b,
                    e) {
                    if (Sfdc.isFunction(c) && !c(e)) z(b, e);
                    else {
                        chatter.getToolbox().updateHTML(f(), "", !1);
                        chatter.getToolbox().updateHTML(l(), "", !1);
                        chatter.getToolbox().updateHTML(k(), "", !1);
                        d.params.showDefaultRightPane && E();
                        for (var g = 0; g < a.length; g++) {
                            var p = a[g].pane,
                                h = a[g].responseHTMLKey;
                            chatter.getToolbox().updateHTML(p, e[h], !0)
                        }
                        if (d.onSuccess) d.onSuccess(b, e);
                        e.showVideoLink && "true" == e.showVideoLink ? (e.videoLinkUrl && (g = e.videoLinkUrl, Ext.select("a.videoLinkElement").set({
                            href: g
                        })), chatter.getToolbox().show(Ext.select("a.videoLinkElement"))) :
                            F();
                        defaultHelpLinkUrl && (e.helpLinkUrl ? A(e.helpLinkUrl) : G());
                        chatter.getEventBus().fireEvent("chatter:navigation", "onAfterHtmlUpdate")
                    }
                },
                failure: z,
                abortTargets: ["feedRefresh", "chatterTabRefresh"],
                ajaxInstanceKey: ["chatterTabRefresh"]
            };
                                        chatter.getToolbox()[e](p)
                                    }

                                    function y() {
                                        for (var a = 0; a < h.length; a++) h[a].hide();
                                        h = []
                                    }

                                    function D(a) {
                                        for (var b = 0; b < a.length; b++) {
                                            var c = new LoadingScreen(a[b].pane.dom, LC.getLabel("Global", "loading"));
                                            c.show();
                                            h.push(c)
                                        }
                                    }

                                    function q(a) {
                                        switch (a) {
                                            case "middle":
                                                return r || (r = Ext.get("centerContent")), r;
                                            case "right":
                                                return s || (s = Ext.get("rightContent")), s;
                                            case "whole":
                                                return t || (t = Ext.get("wholeContent")), t;
                                            default:
                                                alert("unknown pane type")
                                        }
                                    }

                                    function H(a, b) {
                                        switch (a) {
                                            case "ListViews":
                                                return chatter.getOmnitureEventMap().showListView + "-" + b.type + "-" + b.filter;
                                            default:
                                                var c = "", d;
                                                for (d in b) c += d + "\x3d" + b[d] + "\x26";
                                                return a + "?" + c
                                        }
                                    }
                                    var h = [],
        s, r, t, u, v = {},
        w = null,
        I = this.refreshMiddlePane = function (a) {
            m();
            var b = k(),
                b = x([b]),
                c = [{
                    pane: l(),
                    responseHTMLKey: "html"
                }];
            a.params.showDefaultRightPane = !0;
            n(c, b, function (a) {
                return a && a.html
            }, a)
        },
        J = this.refreshWholePane = function (a) {
            m();
            var b = l(),
                c = f(),
                d = k(),
                b = x([b, c]);
            n([{
                pane: d,
                responseHTMLKey: "html"
            }], b, function (a) {
                return a && a.html
            }, a)
        },
        K = this.refreshBothPanes = function (a) {
            m();
            var b = l(),
                c = f(),
                d = k(),
                d = x([d]);
            n([{
                pane: b,
                responseHTMLKey: "middlePaneHtml"
            }, {
                pane: c,
                responseHTMLKey: "rightPaneHtml"
            }], d, function (a) {
                return a && a.middlePaneHtml && Sfdc.isString(a.rightPaneHtml)
            }, a)
        },
        G = this.revertToDefaultHelpLinkUrl = function () {
            A(defaultHelpLinkUrl)
        },
        B = {};
        this.isOnChatterTab = function () {
            return null !== Ext.get("chatterTab")
        };
                                    this.handleMainFeedFiltersClick = function () {
                                        m();
                                        chatter.getToolbox().updateHTML(k(), "", !1)
                                    };
                                    this.setDefaultHelpLinkUrl = function (a) {
                                        defaultHelpLinkUrl = a
                                    };
                                    this.getHelpLinkHref = function (a) {
                                        return (a = B[a]) ? a : null
                                    };
                                    this.setHelpLinkHref = function (a, b) {
                                        B[a] = b
                                    };
                                    var l = this.getMiddlePane = function () {
                                        return q("middle")
                                    },
        f = this.getRightPane = function () {
            return q("right")
        },
        k = this.getWholePane = function () {
            return q("whole")
        };
        this.handleListViewSearch = function (a) {
            var b = Sfdc.select("#chatterListViewContainer h2 span.text")[0];
            switch (a) {
                case "groups":
                    a = !1;
                    var c = Sfdc.get("#mainNavigation .ftr_recent");
                    c && (a = Sfdc.Dom.hasClass(c.parentNode, "selected"));
                    if (a) {
                        if (Sfdc.get("#mainNavigation .ftr_all")) {
                            Sfdc.Dom.setText(b, LC.getLabel("ChatterGroups", "groupFilter_all"));
                            chatter.getNavigationGroups().changeNavigationItemState("chatterTabNavigation", "mainNavigation", 2, 2);
                            break
                        }
                        if (Sfdc.get("#mainNavigation .ftr_my")) {
                            Sfdc.Dom.setText(b, LC.getLabel("ChatterGroups", "groupFilter_my"));
                            chatter.getNavigationGroups().changeNavigationItemState("chatterTabNavigation", "mainNavigation", 2, 0);
                            break
                        }
                    }
                    break;
                default:
                    Sfdc.log(a + " not supported")
            }
        };
                                    this.initializeFeedTypeList = function () {
                                        chatter.getFeed().wireFeedSwitchAfterPost({
                                            feedType: "NEWS",
                                            isDropDownFiltersVisible: !0
                                        }, function () {
                                            var a = chatter.getFeed().getConfig();
                                            return "NEWS" !== a.feedType || "all" !== a.feedfilter
                                        });
                                        chatter.getEventBus().addEventListener("chatter:feed", "onAfterNewPostFeedUpdate", function () {
                                            C().selectDefaultItem()
                                        })
                                    };
                                    this.registerRefreshTypeHandler = function (a, b) {
                                        v[a] ? Sfdc.error(a + " refresh handler has already been implemented") :            v[a] = b
                                    };
                                    this.refresh = function (a, b) {
                                        omnitureWrapper.trackEvent(H(a, b));
                                        var c = v[a],
            d = {
                isPost: !1
            };
                                        if (!c || !c.getRefreshTarget || !c.getEndPoint) alert("handler " + a + " is not implemented properly.");
                                        else {
                                            var e = c.getRefreshTarget(b),                f = {};
                                            d.url = c.getEndPoint(b);
                                            c.getAjaxParams && (f = c.getAjaxParams(b));
                                            d.params = f;
                                            c.getAjaxMethod && (d.isPost = "post" === c.getAjaxMethod());
                                            d.onSuccess = function (a, b) {
                                                if (c.onSuccess) try {
                                                    c.onSuccess(a, b)
                                                } catch (d) {
                                                    Sfdc.error(d)
                                                }
                                            };
                                            d.onFailure = function (a, b) {
                                                if (c.onFailure) try {
                                                    c.onFailure(a, b)
                                                } catch (d) {
                                                    Sfdc.error(d)
                                                }
                                            };
                                            switch (e) {
                                                case "middle":
                                                    I(d);
                                                    break;
                                                case "both":
                                                    K(d);
                                                    break;
                                                case "whole":
                                                    J(d);
                                                    break;
                                                case "feed":
                                                    d.feedType = d.params.feedType;
                                                    chatter.getFeed().refresh(d);
                                                    break;
                                                default:
                                                    alert("refreshTarget: " + e + " not supported")
                                            }
                                        }
                                    };
                                    this.isDefaultFeedSelected = function () {
                                        var a = C();
                                        if (!a) return !1;
                                        a = a.getSelectedNavItem();
                                        return !!Sfdc.get(".trigger.NEWS", a)
                                    };
                                    var E = this.showDefaultRightContent = function () {
                                        if (u) {
                                            var a = u;
                                            chatter.getToolbox().updateHTML(f(), a, !0)
                                        } else chatter.getToolbox().get({
                                            url: "/chattertab/rightContent",
                                            success: function (a, c) {
                                                chatter.getToolbox().updateHTML(f(), c.html, !0)
                                            }
                                        })
                                    },
        m = this.cacheDefaultRightContent = function () {
            var a = f().select(".defaultRightContentDiv").item(0);
            a && (u = a.dom.innerHTML)
        },
        x = function (a) {
            var b = [];
            if (Sfdc.isArray(a))
                for (var c = 0; c < a.length; c++) b[c] = {
                    pane: a[c],
                    html: a[c].dom.innerHTML
                }, chatter.getToolbox().updateHTML(a[c], "", !1);
            return b
        },
        A = function (a) {
            Ext.select("a.helpLinkElement").set({
                href: a
            })
        },
        F = this.hideVideoLink = function () {
            chatter.getToolbox().hide(Ext.select("a.videoLinkElement"))
        },
        C = function () {
            return chatter.getNavigationGroups().getAssociatedGroup("chatterTabNavigation").mainNavigation
        };
                                    this.customFilterRefresh = function (a, b) {
                                        var c = this;
                                        w = null;
                                        w = {
                                            refresh: function (d) {
                                                d && (b.customFilterParams = Sfdc.JSON.stringify(d));
                                                c.refresh(a, b)
                                            }
                                        };
                                        this.refresh(a, b)
                                    };
                                    this.currentCustomFilter = function () {
                                        return w
                                    }
                                }
                                chatter.getToolbox().getPerfEnabled() && Perf.mark("Sfdc.ChatterTabUtil:End", "Sfdc.ChatterTabUtil:Start");
                                chatter.extend("ChatterTab", ChatterTab, null);
                                chatter.getChatterTab().registerRefreshTypeHandler("CanvasApps", function () {
                                    return {
                                        getAjaxParams: function (a) {
                                            return {
                                                showRefreshStatus: !1
                                            }
                                        },
                                        getEndPoint: function (a) {
                                            return "/canvas?canvas\x3d" + a.canvas + (a.namespace ? "\x26namespace\x3d" + a.namespace : "")
                                        },
                                        getRefreshTarget: function (a) {
                                            return "whole"
                                        },
                                        onSuccess: function (a, b) {
                                            if (Sfdc.canvas) {
                                                var d = Sfdc.get("canvas-iframe"),                    e = Sfdc.JSON.parse(b.application),                    c = Sfdc.JSON.parse(b.xorSessionResult);
                                                Sfdc.canvas.parent.render({
                                                    app: e,
                                                    login: b.loginUrl,
                                                    version: b.version,
                                                    sid: Sfdc.String.decryptXOR(c.maskedSid, c.mask)
                                                }, d, {
                                                    displayLocation: "Chatter"
                                                })
                                            }
                                        },
                                        onFailure: function (a, b) { }
                                    }
                                } ());
                                chatter.getChatterTab().registerRefreshTypeHandler("DirectMessages", function () {
                                    return {
                                        getEndPoint: function (a) {
                                            return "/directmessages/"
                                        },
                                        getRefreshTarget: function (a) {
                                            return "both"
                                        },
                                        onSuccess: function (a, b) {
                                            HelpBubble.hideBubble();
                                            directMessage.renderInboxOnSuccess(b)
                                        }
                                    }
                                } ());
                                chatter.getChatterTab().registerRefreshTypeHandler("FeedFavorites", function () {
                                    return {
                                        getEndPoint: function (a) {
                                            return "/feed/favorites/" + a.feedFavoriteId
                                        },
                                        getAjaxParams: function (a) {
                                            return {
                                                feedFavoriteId: a.feedFavoriteId,
                                                type: a.type,
                                                str: a.str,
                                                filterId: a.filterId,
                                                topicId: a.topicId,
                                                isPost: !0
                                            }
                                        },
                                        getAjaxMethod: function (a) {
                                            return "post"
                                        },
                                        onSuccess: function (a, b) {
                                            chatter.getEventBus().fireEvent("chatter:feed", "onAfterFeedRefresh", {
                                                json: b
                                            })
                                        },
                                        getRefreshTarget: function (a) {
                                            return "middle"
                                        }
                                    }
                                } ());
                                chatter.getChatterTab().registerRefreshTypeHandler("FeedTypes", function () {
                                    return {
                                        getEndPoint: function (a) {
                                            return "/feed/" + UserContext.userId + "/" + a.type
                                        },
                                        getAjaxParams: function (a) {
                                            var b = "NEWS" === a.type;
                                            return {
                                                feedType: a.type,
                                                showFeedItemsOnly: chatter.getPublisher().isPublisherPresent(),
                                                isDropDownFiltersVisible: b
                                            }
                                        },
                                        getRefreshTarget: function (a) {
                                            return chatter.getPublisher().isPublisherPresent() ? "feed" : "middle"
                                        },
                                        onSuccess: function (a, b) {
                                            chatter.getEventBus().fireEvent("chatter:feed", "onAfterFeedRefresh", {
                                                json: b
                                            })
                                        }
                                    }
                                } ());

                                function ChatterTabGuidedTour() {
                                    var c = LC.getLabel("ChatterTab", "GuidedTourSortByText"),
        b = LC.getLabel("ChatterTab", "LearnMoreLink"),
        b = "\x3ca class\x3d'chattertabguidedtour' href\x3d\"" + chatter.getChatterTab().getHelpLinkHref("SortByHelpDoc") + '"\x3e' + b + "\x3c/a\x3e",
        c = c + "\x3cbr\x3e\x3cbr\x3e" + b,
        e = {
            locator: ".feedcontainer .feedSortMenuContainer",
            position: "tr-b",
            useArrow: !0,
            offsets: [15, -3],
            arrowOffset: -60,
            width: 350,
            title: LC.getLabel("ChatterTab", "GuidedTourSortByTitle"),
            content: c,
            countStep: !0,
            toolbarItems: [{
                xtype: "tbfill"
            }]
        };
                                    this.startGuidedTour = function (c) {
                                        var b = new Sfdc.GuidedTour({
                                            steps: [e]
                                        });
                                        b.closeForeverHandler = function () {
                                            var a;
                                            a:
                                            {
                                                for (a = this.currentStepNum; a < this.steps.length - 1; )
                                                    if (a += 1, this.shouldShowTheStep(this.steps[a])) {
                                                        a = !0;
                                                        break a
                                                    }
                                                a = !1
                                            }
                                            a ? this.nextStepHandler() : (UserContext.userPreferences.setBoolean("ShowChatterTab178GuidedTour", !1), Sfdc.GuidedTour.prototype.closeForeverHandler.call(this))
                                        };
                                        var d = chatter.getEventBus();
                                        d.addEventListener("chatter:feed", "onBeforeRemoveFeed", function () {
                                            d.removeEventListener("chatter:feed",                "onBeforeRemoveFeed", arguments.callee);
                                            b.showLaterHandler()
                                        });
                                        b.start()
                                    }
                                }
                                chatter.extend("ChatterTabGuidedTour", ChatterTabGuidedTour, null);
                                chatter.getChatterTab().registerRefreshTypeHandler("ListViews", function () {
                                    return {
                                        getEndPoint: function (a) {
                                            return "/listview/" + a.type
                                        },
                                        getAjaxParams: function (a) {
                                            return {
                                                type: a.type,
                                                filter: a.filter,
                                                fldr: a.fldr,
                                                linkDesc: a.linkDesc,
                                                customFilterParams: a.customFilterParams
                                            }
                                        },
                                        getRefreshTarget: function (a) {
                                            return "file" === a.type ? (Sfdc.ChatterFileUploader && (Sfdc.ChatterFileUploader.isFileSync = "fs" === a.filter ? !0 : !1), "whole") : "note" === a.type || "topics" === a.type ? "whole" : "both"
                                        }
                                    }
                                } ());
                                chatter.getPublisher().registerFeedItemTypeHandler("ContentPost", function () {
                                    var h = {
                                        visiblePanel: null,
                                        config: {
                                            omnitureEvent: "postFile"
                                        },
                                        setupPanel: function () {
                                            this.config.promptText = LC.getLabel("Publisher", "FileGhostText")
                                        },
                                        state: {
                                            currentContentAction: null
                                        },
                                        clearPanelState: function () {
                                            this.onShowPanel();
                                            this.state = {
                                                currentContentAction: null
                                            };
                                            chatter.getFileUploader().reset(this.fileInfoUpdate)
                                        },
                                        onShowPanel: function () {
                                            this.showPanel("chatterFileStageOne");
                                            this.publisherCore.setIsExtensionValidForSubmit(!1)
                                        },
                                        onFailure: function (a, b) {
                                            var c = chatter.getPublisher().getHandler("ContentPost");
                                            "UPLOAD" === c.state.currentContentAction ? c.publisherCore.showErrors(b.html) : "ATTACH_EXISTING" === c.state.currentContentAction ? c.publisherCore.showErrors(b.errors.message) : "ATTACH_EXTERNAL" === c.state.currentContentAction && c.publisherCore.showErrors(b.errors.message);
                                            c.publisherCore.enablePublisher()
                                        },
                                        onSuccess: function (a, b) {
                                            var c = chatter.getPublisher().getHandler("ContentPost");
                                            c.clearPanelState();
                                            c.publisherCore.switchToDefaultPublisherType();
                                            chatter.getRecentFiles().isWidgetPresent() && b.recentFilesPanelHtml && (c = chatter.getFileUploader().getBase64Decoder().decode(b.recentFilesPanelHtml), chatter.getRecentFiles().refresh(c))
                                        },
                                        getPayload: function (a) {
                                            var b = this.publisherCore.getRawBody();
                                            "UPLOAD" === this.state.currentContentAction ? a.q = ";postFile" : "ATTACH_EXISTING" === this.state.currentContentAction ? a.contentDocumentId = this.state.contentDocumentId : "ATTACH_EXTERNAL" === this.state.currentContentAction && (a.externalDataSourceId = this.state.externalDataSourceId,  a.externalDocumentId = this.state.externalDocumentId);
                                            a.refreshRecentFiles = chatter.getRecentFiles().isWidgetPresent();
                                            this.publisherCore.isPromptText(b) || (a.text = b);
                                            return a
                                        },
                                        postWithCustomFunction: function (a) {
                                            var b = chatter.getToolbox(),
                c = this.publisherCore,
                d = c.getHandler("ContentPost"),
                e = function (a, b) {
                    chatter.getEventBus().fireEvent("chatter:publisher", "onAfterUpdateStatus", {
                        json: b
                    });
                    d.onSuccess(a, b)
                };
                                            if ("UPLOAD" === this.state.currentContentAction)
                                                if (!0 === d.state.showNewStageTwo) {
                                                    var k = function (a, d) {
                                                        Sfdc.AccessibleMultiUploadFilesDialog.closeIt(!0);
                                                        b.xhrFailure(a, d);
                                                        c.switchToDefaultPublisherType();
                                                        c.enablePublisher()
                                                    },                        g = Sfdc.get("sfdcSyncOption");
                                                    g && (a.sfdcSync = g.checked ? "1" : "0");
                                                    Sfdc.AccessibleMultiUploadFilesDialog.open({
                                                        fileInput: this.state.fileInput,
                                                        displayDDTargetIcon: !1,
                                                        filterParentId: "",
                                                        parentEntityName: "",
                                                        uploaderOrigin: "PUBLISHER",
                                                        uploadActionUrl: b.sitePrefix() + b.apiurl(),
                                                        params: a,
                                                        customHandlers: {
                                                            failureHandler: function (a, b) {
                                                                Sfdc.AccessibleMultiUploadFilesDialog.closeIt(!0);
                                                                d.onFailure(a, b)
                                                            },
                                                            errorHandler: k,
                                                            successHandler: function (a,                                b) {
                                                                Sfdc.AccessibleMultiUploadFilesDialog.closeIt(!0);
                                                                e(a, b)
                                                            },
                                                            cancelHandler: function () {
                                                                Sfdc.AccessibleMultiUploadFilesDialog.uploader.cancelRemainingUploads();
                                                                c.openTypeSpecificPanel(Sfdc.get("publisherAttachContentPost"), "ContentPost");
                                                                c.enablePublisher()
                                                            }
                                                        }
                                                    })
                                                } else chatter.getFileUploader().upload(b.sitePrefix() + b.apiurl(), a, {
                                                    failureHandler: this.onFailure,
                                                    errorHandler: k,
                                                    successHandler: e
                                                }, this.state.helpUrl);
                                            else if ("ATTACH_EXISTING" == this.state.currentContentAction) b.post({
                                                url: "/feeditems",
                                                params: a,
                                                failure: this.onFailure,
                                                success: e
                                            });
                                            else if ("ATTACH_EXTERNAL" == this.state.currentContentAction) {
                                                var f = ExternalFileProgressDialog.showOnPostFile("extFileProgress", this.state.externalFileSharedByReference);
                                                b.post({
                                                    url: "/feeditems",
                                                    params: a,
                                                    failure: function (a, b) {
                                                        f.hide();
                                                        d.onFailure(a, b)
                                                    },
                                                    success: function (a, b) {
                                                        f.hide();
                                                        e(a, b)
                                                    }
                                                })
                                            }
                                        },
                                        fileInfoUpdate: function () {
                                            var a = chatter.getPublisher().getHandler("ContentPost");
                                            chatter.getFileUploader().fileInfoUpdate();
                                            a.publisherCore.setIsExtensionValidForSubmit(!0)
                                        },
                                        fileNewInfoUpdate: function (a) {
                                            var b = chatter.getPublisher().getHandler("ContentPost");
                                            if (a.files && 1 == a.files.length) {
                                                b.state.showNewStageTwo = !0;
                                                b.state.currentContentAction = "UPLOAD";
                                                b.state.fileInput = a;
                                                a = a.files[0];
                                                var c = "undefined" != typeof a.fileName ? a.fileName : a.name,
                    d = "undefined" != typeof a.fileSize ? a.fileSize : a.size,
                    d = Sfdc.MultiFileUploaderUtil.formatFileSize(d);
                                                Sfdc.get("chatterSelectedFileName").innerHTML = chatter.getToolbox().htmlEncode(c);
                                                Sfdc.get("chatterSelectedFileSize").innerHTML = chatter.getToolbox().htmlEncode(LC.getLabel("ChatterFileMultiUpload",                    "valueInParentheses", d));
                                                a = Sfdc.MultiFileUploaderUtil.formatFileTypeCSS(a.type, "32");
                                                Sfdc.get("chatterSelectedFileTypeIcon").className = a;
                                                b.showPanel("chatterFileNewStageTwo");
                                                b.publisherCore.setIsExtensionValidForSubmit(!0)
                                            }
                                        },
                                        focusFirstElement: function () {
                                            var a = Sfdc.get("chatterLinkFileAction");
                                            if (Sfdc.Dom.isVisible(a, !0)) a.focus();
                                            else return !0
                                        },
                                        showFileInfo: function (a, b, c) {
                                            isIPhone || isIPad ? alert(LC.getLabel("Publisher", "fileUploadNotSupportedOnDevice")) : c && Sfdc.MultiFileUploaderUtil.isFileAPISupported() &&
                !Sfdc.userAgent.isSafari && !Sfdc.userAgent.isChromium ? Sfdc.get("hiddenFileBtn").click() : (this.showPanel("chatterFileStageTwo"), this.state.currentContentAction = "UPLOAD", this.state.helpUrl = b ? b : null, a = chatter.getFileUploader(), a.resetDialogAppendix(), a.initFields(), a.initValidation(function (a) {
                    var b = chatter.getPublisher().getHandler("ContentPost");
                    a ? b.publisherCore.setIsExtensionValidForSubmit(!0) : b.publisherCore.setIsExtensionValidForSubmit(!1)
                }))
                                        },
                                        setMyFilesFilterFlag: function (a) {
                                            this.config.isMyFilesFilterOn =                a
                                        },
                                        openSelectFilesToAttach: function (a, b, c) {
                                            this.getCurrentFeedParentId = c;
                                            if (c = sfdcPage.getDialogById(a)) return c;
                                            c = 558;
                                            Ext.isIE && (c = 560);
                                            var d = "?feedParentId\x3d" + this.getCurrentFeedParentId();
                                            b && (d += "\x26cc\x3dtrue");
                                            c = new IFrameDialog(a, LC.getLabel("Publisher", "selectFileDialogTitle"), UserContext.getUrl("/_ui/content/view/files/sharing/FindLinkedFilesPage" + d), c, 946);
                                            c.getContent = function () {
                                                return '\x3ciframe frameborder\x3d"no" scrolling\x3d"no" id\x3d"' + this.contentId + '" style\x3d"overflow:hidden; border:0;height:' +  this.height + 'px;width: 100%;" src\x3d"' + this.url + '"\x3e\x3c/iframe\x3e'
                                            };
                                            c.register();
                                            return c
                                        },
                                        showLinkFile: function () {
                                            this.openSelectFilesToAttach("chatterFindExistingContent", !1, function () {
                                                return chatter.getPublisher().getSubjectId()
                                            }).display()
                                        },
                                        showSharingOptions: function (a, b) {
                                            if (a.match(Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX_MATCH) == Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX) {
                                                var c = this,
                    d = [{
                        text: LC.getLabel("ChatterFileSharing", "viewer"),
                        value: Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_VIEWER
                    }, {
                        text: LC.getLabel("ChatterFileSharing", "collaborator"),
                        value: Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_COLLABORATOR
                    }];
                                                b ? (d = {
                                                    entityId: a
                                                }, chatter.getToolbox().get({
                                                    url: "/file/sharingright/" + b,
                                                    params: d,
                                                    success: function (a, b) {
                                                        for (var d = [], f = 0; f < b.length; f++) d[f] = {
                                                            text: b[f].label,
                                                            value: b[f].sharingType
                                                        };
                                                        c.publisherCore.setOptionsMenu(d)
                                                    },
                                                    failure: function (a, b) { }
                                                })) : c.publisherCore.setOptionsMenu(d)
                                            }
                                        },
                                        showLinkedFileInfo: function (a) {
                                            this.state.currentContentAction = "ATTACH_EXISTING";
                                            OverlayDialogElement.getDialog("chatterFindExistingContent").hide();
                                            var b = this;
                                            chatter.getToolbox().get({
                                                params: {
                                                    q: ";linkedContentDetails",
                                                    contentDocumentId: a
                                                },
                                                failure: function (a, d) {
                                                    d.errors && b.publisherCore.showErrors(d.errors);
                                                    b.publisherCore.setIsExtensionValidForSubmit(!1)
                                                },
                                                success: function (c, d) {
                                                    b.showPanel("chatterFileContent");
                                                    var e = Ext.get("chatterExistContentInfo");
                                                    Ext.DomHelper.overwrite(e, d.html);
                                                    b.state.contentDocumentId = a;
                                                    b.publisherCore.setIsExtensionValidForSubmit(!0);
                                                    Ext.get("publishersharebutton").focus()
                                                }
                                            })
                                        },
                                        showExternalLinkedFileInfo: function (a,            b, c) {
                                            this.state.currentContentAction = "ATTACH_EXTERNAL";
                                            OverlayDialogElement.getDialog("chatterFindExistingContent").hide();
                                            var d = this,                e = ExternalFileProgressDialog.showOnGetFileInfo("extFileProgress");
                                            chatter.getToolbox().get({
                                                url: "/contenthub/linkedfiledetails/" + a + "/" + encodeURIComponent(b),
                                                failure: function (a, b) {
                                                    e.hide();
                                                    b.errors && d.publisherCore.showErrors(b.errors.message);
                                                    d.publisherCore.setIsExtensionValidForSubmit(!1)
                                                },
                                                success: function (h, g) {
                                                    e.hide();
                                                    d.showPanel("chatterFileContent");
                                                    var f = Ext.get("chatterExistContentInfo");
                                                    Ext.DomHelper.overwrite(f, g.html);
                                                    d.state.externalDataSourceId = a;
                                                    d.state.externalDocumentId = b;
                                                    d.state.externalFileSharedByReference = c;
                                                    d.publisherCore.setIsExtensionValidForSubmit(!0);
                                                    Ext.get("publishersharebutton").focus()
                                                }
                                            })
                                        },
                                        handleFileUploadCancel: function () {
                                            for (i = 0; i < window.frames.length; i++) try {
                                                0 <= window.frames[i].name.indexOf("ext-gen") && (window.frames[i].location = "/img/s.gif")
                                            } catch (a) { }
                                            this.publisherCore.openTypeSpecificPanel(Sfdc.get("publisherAttachContentPost"), "ContentPost");
                                            this.publisherCore.enablePublisher();
                                            return !0
                                        },
                                        getVisibilityMessages: function (a, b) {
                                            var c = UserContext.isDefaultNetwork,
                d = a.subjectId.substr(0, 3),
                e = "0F9" === d,
                c = "005" === d ? c ? LC.getLabel("ContentPostVisibility", "whoCanSeeThis_UserPostInCompany") : LC.getLabel("ContentPostVisibility", "whoCanSeeThis_UserPostInNetwork") : e ? LC.getLabel("ContentPostVisibility", "whoCanSeeThis_GroupPost") : "INTERNAL_USERS" == b ? LC.getLabel("ContentPostVisibility", "whoCanSeeThis_RecordPost_InternalUsers") : LC.getLabel("ContentPostVisibility", "whoCanSeeThis_RecordPost_AllUsers"),
                d = LC.getLabel("ContentPostVisibility", "whoCanSeeThisFileTitle");
                                            return [{
                                                text: c,
                                                title: d
                                            }]
                                        },
                                        showPanel: function (a) {
                                            var b = this.publisherCore.getPublisherContainer(),                c = Sfdc.get(h.visiblePanel, b);
                                            c && Sfdc.Dom.addClass(c, "hidden");
                                            (b = Sfdc.get(a, b)) && Sfdc.Dom.removeClass(b, "hidden");
                                            h.visiblePanel = a
                                        }
                                    };
                                    return h
                                } ());
                                Sfdc.ns("Sfdc.CreateRecordHandler");
                                Sfdc.CreateRecordHandler = function () {
                                    this.registerFeedItemTypeHandler = function (e, n, g) {
                                        chatter.getPublisher().registerFeedItemTypeHandler("CreateRecordEvent", function () {
                                            function p(r) {
                                                var b = Sfdc.get("editPage__" + e),                    a = b.parentNode;
                                                Sfdc.Dom.removeChild(b);
                                                Sfdc.Dom.insertHTML(a, r.htmlForm);
                                                (b = Sfdc.get("editPage__" + e)) && Sfdc.Resource.execScripts(Sfdc.Resource.getScriptsFromHtml(b));
                                                window.picklist && (picklist.initialized = !1, picklist.initAll())
                                            }
                                            var a = {
                                                config: {
                                                    omnitureEvent: "recordCreate",
                                                    urlMaxLen: 1E3,
                                                    urlNameMaxLen: 255,
                                                    disallowedLinkChars: /[\s\\]+/
                                                },
                                                state: {}
                                            };
                                            a.config.actionIdParam = e;
                                            a.config.formId = n;
                                            a.setupPanel = function () {
                                                Sfdc.onload(function () {
                                                    window.picklist && picklist.initAll()
                                                });
                                                a.config.submitValueAndTitle = {
                                                    value: g,
                                                    title: g
                                                }
                                            };
                                            a.clearPanelState = function () { };
                                            a.focusFirstElement = function () { };
                                            a.onShowPanel = function () {
                                                this.publisherCore.setIsExtensionValidForSubmit(!0)
                                            };
                                            var q = null;
                                            a.onSuccess = function (a, b) {
                                                var f = chatter.getEventBus();
                                                b.feedItemId && "undefined" === typeof entityFeedPage && f.fireEvent("chatter:publisher", "onAfterUpdateStatus", {
                        json: b
                    });
                                                p(b);
                                                if (!b.feedItemId && b.successMessage) {
                                                    var k = document.querySelectorAll(".nonFeedSuccess")[0], h = document.querySelectorAll(".nonFeedSuccessMessage")[0];
                                                    Sfdc.Dom.setText(h, b.successMessage);
                                                    Sfdc.Dom.setStyle(k, "display", "block");
                                                    Sfdc.Animation.opacity(k, 0, 1, {
                                                        duration: 1E3
                                                    });
                                                    clearTimeout(q);
                                                    q = setTimeout(function () {
                                                        Sfdc.Animation.opacity(k, 1, 0, {
                                                            duration: 1E3,
                                                            onComplete: function () {
                                                                Sfdc.Dom.setStyle(k, "display", "none")
                                                            }
                                                        })
                                                    }, 5E3);
                                                    f.fireEvent("chatter:publisher", "onAfterNonFeedUpdateStatus", {
                                                        json: b
                                                    })
                                                }
                                                chatter.getPublisher().getHandler(e).publisherCore.enablePublisher()
                                            };
                                            a.onFailure = function (a, b) {
                                                var f = chatter.getPublisher().getHandler(e);
                                                b.errors ? f.publisherCore.showErrors(b.errors.message) : p(b);
                                                f.publisherCore.enablePublisher()
                                            };
                                            a.getPayload = function (a) {
                                                a.actionIdParam = this.config.actionIdParam;
                                                for (var b = ["input", "select", "textarea"], f = document.getElementById(n), e = "undefined" !== typeof CKEDITOR, h = 0; h < b.length; h++)
                                                    for (var d = f.getElementsByTagName(b[h]), c = 0; c < d.length; c++)
                                                        if ("checkbox" != d[c].getAttribute("type") || d[c].checked)
                                                            if ("TEXTAREA" == d[c].tagName && (e && CKEDITOR.instances[d[c].name]) && (CKEDITOR.instances[d[c].name].updateElement(), CKEDITOR.instances[d[c].name].destroy(!0)), "SELECT" == d[c].tagName) {
                                                                for (var g = [], m = d[c].options, l = 0; l < m.length; l++) m[l].selected && g.push(m[l].value);
                                                                a[d[c].name] = g
                                                            } else a[d[c].name] = d[c].value;
                                                a.save_new = "Saving...";
                                                return a
                                            };
                                            a.postWithCustomFunction = function (a) {
                                                a = {
                                                    url: "/quickcreate",
                                                    params: a,
                                                    failure: this.onFailure,
                                                    success: this.onSuccess
                                                };
                                                "undefined" !== typeof entityFeedPage ? entityFeedPage.postObjectUpdate(chatter.getFeed().getConfig().subjectId, a) : chatter.getToolbox().post(a)
                                            };
                                            return a
                                        } (), e)
                                    }
                                };
                                var createRecordHandler = new Sfdc.CreateRecordHandler;
                                chatter.getPublisher().registerFeedItemTypeHandler("AnnouncementPost", function () {
                                    var c = {
                                        config: {
                                            omnitureEvent: "post"
                                        },
                                        setupPanel: function () {
                                            this.config.promptText = LC.getLabel("ChatterGroups", "announcementGhostText");
                                            this.config.expirationDateElement = Sfdc.get("expirationDate");
                                            d(this.config.expirationDateElement, e);
                                            var a = chatter.getPublisher().getTextArea();
                                            d(a, e)
                                        }
                                    },
        e = function () {
            var a = chatter.getPublisher().getHandler("AnnouncementPost"),
                b = chatter.getPublisher(),
                c = b.getRawBody(),
                b = !(chatter.getToolbox().stringIsEmpty(c) ||
                    b.isPromptText(c)) && a.dateValidator(a.config.expirationDateElement.value);
            a.publisherCore.setIsExtensionValidForSubmit(b)
        } .bind(this),
        d = function (a, b) {
            Sfdc.Event.add(a, "keyup", b);
            Sfdc.Event.add(a, "change", function () {
                b.defer(10)
            });
            Sfdc.Event.add(a, "cut", function () {
                b.defer(10)
            });
            Sfdc.Event.add(a, "paste", function () {
                b.defer(10)
            })
        };
                                    c.dateValidator = function (a) {
                                        a = Sfdc.Date.isDate(a, UserContext.dateFormat);
                                        var b = Sfdc.get(".expirationDateErrorMsg");
                                        a ? Sfdc.Dom.addClass(b, "hidden") : (Sfdc.Dom.updateHTML(b, LC.getLabel("ChatterGroups", "announcementExpirationDateInvalid")), Sfdc.Dom.removeClass(b, "hidden"));
                                        return a
                                    };
                                    c.onShowPanel = function () {
                                        this.publisherCore.setIsExtensionValidForSubmit(!1)
                                    };
                                    c.focusFirstElement = function () {
                                        this.publisherCore.focusOnTextArea()
                                    };
                                    c.onSuccess = function (a, b) {
                                        chatter.getPublisher().getHandler("AnnouncementPost").publisherCore.restoreDefaultUIState();
                                        if (b.announcement) {
                                            var c = Sfdc.get("announcementPanel");
                                            Sfdc.Dom.updateHTML(c, b.announcement);
                                            (c = Sfdc.get("announcementActionDropDownButton")) && SfdcCmp.init(c)
                                        }
                                    };
                                    c.onFailure = function (a, b) {
                                        var c = chatter.getPublisher().getHandler("AnnouncementPost");
                                        b.errors && c.publisherCore.showErrors(b.errors.message);
                                        c.publisherCore.enablePublisher()
                                    };
                                    c.getPayload = function (a) {
                                        var b = this.publisherCore.getRawBody();
                                        a.text = b;
                                        a.expirationDate = this.config.expirationDateElement.value;
                                        return a
                                    };
                                    c.validatePayload = function (a) {
                                        var b = !(Sfdc.isEmpty(a.text) || this.publisherCore.isPromptText(a.text));
                                        a = Sfdc.Date.isDate(a.expirationDate, UserContext.dateFormat);
                                        return {
                                            isValid: b && a
                                        }
                                    };
                                    c.onValidationFailure = function () {
                                        this.publisherCore.resetPublisher();
                                        this.publisherCore.enablePublisher()
                                    };
                                    return c
                                } ());
                                (function () {
                                    chatter.extend("LinkMetadataRetriever", function () {
                                        function r() {
                                            for (var a = Sfdc.select("div.richPost div.inlinePlayer iframe"), b = a.length, c = 0; c < b; c++) {
                                                var f = a[c],
                    e = n(f),
                    d = Sfdc.get(".content", e),
                    e = Sfdc.get(".inlinePlayerTrigger", e);
                                                Sfdc.Dom.show(e);
                                                Sfdc.Dom.removeClass(d, "full");
                                                Sfdc.Dom.hideByDisplay(f);
                                                Sfdc.Dom.removeChild(f)
                                            }
                                        }

                                        function E() {
                                            var a = F();
                                            p++;
                                            "" !== a && (a = {
                                                url: "/link/metadata",
                                                params: {
                                                    urls: a
                                                },
                                                success: function (a, c) {
                                                    t && console.log(c);
                                                    for (var f = c.linkMetadata, e = 0; e < f.length; e++) {
                                                        var d = f[e];
                                                        try {
                                                            if (y(d)) {
                                                                var g = d.original_url,
                                    m = d.type,
                                    l = h[g],
                                    r = d.title ? w(d.title, k.titleLength) : "",
                                    q = "";
                                                                d.description && (q = w(d.description, k.descriptionLength));
                                                                if (l) {
                                                                    l.type = m;
                                                                    l.state = "fetched";
                                                                    l.data = {
                                                                        title: r,
                                                                        thumbnail_url: d.thumbnail_url,
                                                                        description: q,
                                                                        original_url: d.original_url,
                                                                        provider_url: d.provider_url,
                                                                        frame_src: d.frame_src + "\x26width\x3d" + d.width + "\x26height\x3d" + d.height + "\x26autoplay\x3d1\x26wmode\x3dtransparent",
                                                                        frame_width: d.width,
                                                                        frame_height: d.height
                                                                    };
                                                                    for (var d = g, n = h[d], p = n.previews, s = z(n), q = 0; q < p.length; q++) {
                                                                        var x = p[q], u = Sfdc.get(x.getPlaceholderId());
                                                                        Sfdc.Dom.hasClass(u, k.classFetching) && d === x.getUrl() && s(x, n.data)
                                                                    }
                                                                }
                                                            }
                                                        } catch (v) {
                                                            t && Sfdc.log('chatter:richLinkPost failed on parsing embed.ly response for "' + g + '": ' + v, Sfdc.Logging.LogLevel.ERROR)
                                                        }
                                                    }
                                                },
                                                failure: function () { },
                                                dieSilently: !0
                                            }, l && (a.params.runningTest = l), G.get(a))
                                        }

                                        function y(a) {
                                            return l ? !0 : a.error_code ? !1 : (a = a.thumbnail_url) && (0 != a.indexOf("https") || -1 < a.indexOf(window.location.hostname)) ? !1 : !0
                                        }

                                        function w(a, b) {
                                            var c = document.createElement("DIV");
                                            Sfdc.Dom.setText(c, a);
                                            a = c.innerHTML;
                                            return a.length > b ? a.substr(0, b) + "..." : a
                                        }

                                        function z(a) {
                                            var b = "";
                                            switch (a.type) {
                                                case "link":
                                                    b = u;
                                                    break;
                                                case "photo":
                                                    b = u;
                                                    break;
                                                case "video":
                                                    b = v;
                                                    break;
                                                case "rich":
                                                    b = v;
                                                    break;
                                                case "error":
                                                    return
                                            }
                                            return b
                                        }

                                        function u(a, b) {
                                            var c = A(a, H, b),
                c = b.thumbnail_url && "" !== b.thumbnail_url ? c.replace("{!#thumbnail}", I).replace("{!#thumbnail_url}", b.thumbnail_url).replace("{!#rich_link_url}", b.original_url) : c.replace("{!#thumbnail}", B).replace("{!#rich_link_url}", b.original_url);
                                            C(a.getPlaceholderId(), c)
                                        }

                                        function v(a, b) {
                                            var c = A(a, J, b),
                c = b.thumbnail_url && "" !== b.thumbnail_url ? c.replace("{!#thumbnail}", K).replace("{!#thumbnail_url}", b.thumbnail_url).replace("{!#frame_src}", b.frame_src).replace("{!#frameWidth}", b.frame_width).replace("{!#frameHeight}", b.frame_height) : c.replace("{!#thumbnail}", B).replace("{!#rich_link_url}", b.original_url);
                                            C(a.getPlaceholderId(), c)
                                        }

                                        function C(a, b) {
                                            var c = Sfdc.get(a);
                                            if (c) {
                                                var f = n(c),                    f = Sfdc.select(".linkPostLinkContainer", f);
                                                Sfdc.Dom.hideByDisplay(f);
                                                Sfdc.Dom.insertHTML(c,  b)
                                            }
                                            Sfdc.Dom.removeClass(c, k.classFetching);
                                            Sfdc.Dom.addClass(c, k.classFetched);
                                            L(c)
                                        }

                                        function n(a) {
                                            return Sfdc.Dom.getParent(a, ".feeditem")
                                        }

                                        function A(a, b, c) {
                                            a = "" != a.getTitle() ? a.getTitle() : c.title;
                                            "" === a && (a = c.provider_url);
                                            return b = b.replace("{!#title}", a).replace("{!#description}", c.description).replace(/{!#original_url}/g, c.original_url).replace(/{!#provider_url}/g, c.provider_url)
                                        }

                                        function F() {
                                            var a = "",                b = 0,                c;
                                            for (c in h) {
                                                if (b >= s) break;
                                                "initial" === h[c].state && (a += encodeURIComponent(c) + ",", h[c].state ="fetching", b++)
                                            }
                                            return a.substring(0, a.length - 1)
                                        }

                                        function m(a) {
                                            p = 0;
                                            var b = Sfdc.select("." + k.classPrefetch);
                                            t && console.log("event: " + a + " | found:" + b.length);
                                            if (0 < b.length) {
                                                Sfdc.each(b, function (a, b) {
                                                    var e = a.id,
                        d = a.getAttribute("data-richUrl"),
                        g = a.getAttribute("data-title") || "";
                                                    l = "true" == a.getAttribute("data-runningTest") || !1;
                                                    Sfdc.Dom.removeClass(a, k.classPrefetch);
                                                    Sfdc.Dom.addClass(a, k.classFetching);
                                                    e = new M(e, d, g);
                                                    h[d] ? "fetching" === h[d].state || "initial" === h[d].state ? h[d].previews.push(e) : "fetched" ===
                        h[d].state && (d = h[d], z(d)(e, d.data)) : h[d] = {
                            state: "initial",
                            previews: [e],
                            type: "",
                            data: {}
                        }
                                                });
                                                for (a = 0; a < b.length / s; a++) E()
                                            }
                                        }

                                        function L(a) {
                                            function b() {
                                                Sfdc.logServer("LinkMetadataRetriever", k.brokenImageErrorMessage, Sfdc.Logging.LogLevel.ERROR);
                                                Sfdc.un(c, "error", b, null);
                                                Sfdc.Dom.addClass(f, ["thumbnail", "default"]);
                                                Sfdc.Dom.updateHTML(f, N)
                                            }
                                            var c = Sfdc.get(".thumb", a), f = Sfdc.get(".thumbContainer", a);
                                            Sfdc.on(c, "error", b, null, null)
                                        }

                                        function M(a, b, c) {
                                            this.getPlaceholderId = function () {
                                                return a
                                            };
                                            this.getTitle =  function () {
                                                 return c
                                            };
                                            this.getUrl = function () {
                                                return b
                                            }
                                        }
                                        var k = {
                                            titleLength: 60,
                                            descriptionLength: 150,
                                            poweredByText: LC.getLabel("Feeds", "poweredByEmbedly"),
                                            classPrefetch: "richLink-prefetch",
                                            classFetching: "richLink-fetching",
                                            classFetched: "richLink-fetched",
                                            brokenImageErrorMessage: "Embed.ly returned thumbnail url is broken."
                                        },
            l = !1,
            t = !1,
            h = {},
            g = chatter.getEventBus(),
            G = chatter.getToolbox(),
            s = 5,
            p = 0,
            D = "\x3cdiv class\x3d'richPost {!#type}'\x3e{!#thumbnail}{!#inlinePlayer}\x3cdiv class\x3d'content'\x3e\x3ch4 class\x3d'title'\x3e\x3ca target\x3d'_blank' href\x3d'{!#original_url}'\x3e{!#title}\x3c/a\x3e\x3c/h4\x3e\x3ch5 class\x3d'provider'\x3e\x3ca target\x3d'_blank' href\x3d'{!#provider_url}'\x3e{!#provider_url}\x3c/a\x3e\x3cspan class\x3d'embedlyIcon' title\x3d'" +
            k.poweredByText + "'\x3e" + k.poweredByText + "\x3c/span\x3e\x3c/h5\x3e\x3cdiv class\x3d'desc'\x3e{!#description}\x3c/div\x3e\x3c/div\x3e\x3cdiv class\x3d'chatter-clear'/\x3e\x3c/div\x3e",
            K = "\x3cspan class\x3d'thumbContainer'\x3e\x3ca data-iframeSrc\x3d'{!#frame_src}' data-frameWidth\x3d'{!#frameWidth}' data-frameHeight\x3d'{!#frameHeight}' href\x3d'javascript:;' onclick\x3d'chatter.getLinkMetadataRetriever().launchVideo(this);' class\x3d'thumbnail inlinePlayerTrigger'\x3e\x3cimg src\x3d'/img/chatter/play.png' class\x3d'play' /\x3e\x3cimg src\x3d'{!#thumbnail_url}' class\x3d'thumb' width\x3d'120px' /\x3e\x3c/a\x3e\x3c/span\x3e",
            I = "\x3cspan class\x3d'thumbContainer'\x3e\x3ca target\x3d'_blank' href\x3d'{!#rich_link_url}' class\x3d'thumbnail'\x3e\x3cimg class\x3d'thumb' src\x3d'{!#thumbnail_url}'/\x3e\x3c/a\x3e\x3c/span\x3e",
            B = "\x3cspan class\x3d'thumbContainer default'\x3e\x3ca target\x3d'_blank' href\x3d'{!#rich_link_url}' class\x3d'thumbnail default'\x3e\x3cimg class\x3d'thumb' src\x3d'/s.gif'/\x3e\x3c/a\x3e\x3c/span\x3e",
            H = D.replace("{!#type}", "link").replace("{!#inlinePlayer}", ""),
            J = D.replace("{!#type}", "video").replace("{!#inlinePlayer}",
                "\x3cdiv class\x3d'inlinePlayer'\x3e\x3c/div\x3e"),
            N = "\x3cimg src\x3d'/s.gif'\x3e";
                                        this.setRunningTest = function (a) {
                                            l = a
                                        };
                                        this.setDebugMode = function (a) {
                                            t = a
                                        };
                                        this.getBatchSize = function () {
                                            return s
                                        };
                                        this.getBatchCallCount = function () {
                                            return p
                                        };
                                        this.parseDOMAndRender = function () {
                                            m()
                                        };
                                        this.launchVideo = function (a) {
                                            var b = a.getAttribute("data-iframeSrc"), c = a.getAttribute("data-frameWidth"), f = a.getAttribute("data-frameHeight"), e = n(a);
                                            a = Sfdc.get(".content", e);
                                            var d = Sfdc.get(".inlinePlayerTrigger", e), e = Sfdc.get(".inlinePlayer",e);
                                            Sfdc.Dom.addClass(a, "full");
                                            Sfdc.Dom.hideByDisplay(d);
                                            Sfdc.Dom.insertHTML(e, "\x3ciframe src\x3d'{!#frame_src}' width\x3d'{!#frameWidth}px' height\x3d'{!#frameHeight}px' frameborder\x3d'0' scrolling\x3d'no'\x3e\x3c/iframe\x3e".replace("{!#frame_src}", b).replace("{!#frameWidth}", c).replace("{!#frameHeight}", f))
                                        };
                                        this.isResultSafeToRender = function (a) {
                                            return y(a)
                                        };
                                        this.getProperLengthString = function (a, b) {
                                            return w(a, b)
                                        };
                                        g.addEventListener("chatter:feed", "onAfterFeedRefresh", m);
                                        g.addEventListener("chatter:feed", "onAfterShowMoreFeedItems", m);
                                        g.addEventListener("chatter:feed", "onAfterNewPostFeedUpdate", m);
                                        g.addEventListener("chatter:rechat", "onAfterPreviewLoaded", m);
                                        g.addEventListener("unifiedSearchPage:feedSearchResults", "onAfterResultsShown", m);
                                        g.addEventListener("chatter:modalOverlay", "onBeforeOverlayShown", r);
                                        g.addEventListener("chatter:feed", "onBeforeRemoveFeed", r);
                                        g.addEventListener("UIComponent:OverlayDialog", "onBeforeOverlayShow", r)
                                    }, null);
                                    Sfdc.onload(function () {
                                        chatter.getLinkMetadataRetriever().parseDOMAndRender()
                                    })
                                })();
                                chatter.getPublisher().registerFeedItemTypeHandler("LinkPost", function () {
                                    var c = {
                                        config: {
                                            omnitureEvent: "postLink",
                                            urlMaxLen: 1E3,
                                            urlNameMaxLen: 255,
                                            disallowedLinkChars: /[\s\\]+/
                                        },
                                        state: {},
                                        setupPanel: function () {
                                            var a = this;
                                            a.config.promptText = LC.getLabel("Publisher", "LinkGhostText");
                                            a.config.urlElement = Ext.get("url");
                                            a.config.urlNameElement = Ext.get("urlName");
                                            a.config.urlErrorEl = chatter.getToolbox().getElementErrorContainer(c.config.urlElement);
                                            a.config.urlNameErrorEl = chatter.getToolbox().getElementErrorContainer(c.config.urlNameElement);
                                            var b = function () {
                                                var b = chatter.getToolbox(),
                    c = b.stringTrim(a.config.urlElement.getValue()),
                    d = c.length,
                    e = b.stringTrim(a.config.urlNameElement.getValue()).length,
                    f = LC.getLabel("Publisher", "postInvalidLinkUrl"),
                    g = LC.getLabel("Publisher", "postLinkRequired"),
                    h = LC.getLabel("Publisher", "postValueMaxLen", a.config.urlMaxLen),
                    k = LC.getLabel("Publisher", "postValueMaxLen", a.config.urlNameMaxLen);
                                                b.validateElement(a.config.urlErrorEl, function () {
                                                    return 0 < d
                                                }, g) && b.validateElement(a.config.urlErrorEl, function () {
                                                    return d <= a.config.urlMaxLen
                                                }, h) && b.validateElement(a.config.urlErrorEl, function () {
                                                    return !a.config.disallowedLinkChars.test(c)
                                                }, f) && b.validateElement(a.config.urlNameErrorEl, function () {
                                                    return e <= a.config.urlNameMaxLen
                                                }, k) ? a.publisherCore.setIsExtensionValidForSubmit(!0) : a.publisherCore.setIsExtensionValidForSubmit(!1)
                                            };
                                            chatter.getToolbox().wireFieldChange(a.config.urlElement, b);
                                            chatter.getToolbox().wireFieldChange(a.config.urlNameElement, b)
                                        },
                                        clearPanelState: function () {
                                            this.config.urlElement.dom.value = LC.getLabel("Publisher","httpProtocolPrefix");
                                            this.config.urlNameElement.dom.value = "";
                                            Sfdc.Dom.addClass(this.config.urlErrorEl.dom, "hidden");
                                            Sfdc.Dom.addClass(this.config.urlNameErrorEl.dom, "hidden")
                                        },
                                        focusFirstElement: function () {
                                            this.config.urlElement.focus();
                                            this.config.urlElement.dom.select()
                                        },
                                        onShowPanel: function () {
                                            this.publisherCore.setIsExtensionValidForSubmit(!1)
                                        },
                                        onSuccess: function (a, b) {
                                            chatter.getPublisher().getHandler("LinkPost");
                                            chatter.getYoutubeVideo().fetchVideoPreviews()
                                        },
                                        onFailure: function (a, b) {
                                            var c = chatter.getPublisher().getHandler("LinkPost");
                                            b.errors && c.publisherCore.showErrors(b.errors.message);
                                            c.publisherCore.enablePublisher()
                                        },
                                        getPayload: function (a) {
                                            var b = this.publisherCore.getRawBody();
                                            this.publisherCore.isPromptText(b) || (a.text = b);
                                            a.url = this.config.urlElement.getValue();
                                            a.urlName = this.config.urlNameElement.getValue();
                                            return a
                                        }
                                    };
                                    return c
                                } ());
                                chatter.getPublisher().registerFeedItemTypeHandler("NotePost", function () {
                                    var a = {},h = "";
                                    a.config = {};
                                    a.state = {};
                                    a.setupPanel = function () {
                                        this.config.promptText = LC.getLabel("Publisher", "NoteGhostText");
                                        this.unsubmittedDelta = Tandem.Delta.getInitial("\n");
                                        h = Sfdc.get("#formatting-container").innerHTML;
                                        Sfdc.on(window, "unload", k)
                                    };
                                    a.removeEventsForPostType = function () {
                                        f()
                                    };
                                    a.onShowPanel = function () {
                                        a.editor = new Scribe.Editor("editor", {
                                            modules: {
                                                attribution: {
                                                    enabled: !1
                                                }
                                            },
                                            theme: Scribe.Themes.Snow
                                        });
                                        Scribe.Themes.Default.stylesheets["styles/snow.css"] = !0;
                                        a.editor.theme.addModule("toolbar", {
                                            container: "formatting-container"
                                        });
                                        a.editor.setDelta(a.unsubmittedDelta);
                                        d();
                                        var b = chatter.getPublisher().getHandler("NotePost"), e = Sfdc.get(".noteTitleInput");
                                        Sfdc.Event.add(e, "keyup", d);
                                        Sfdc.Event.add(b.editor.root, "keyup", d)
                                    };
                                    a.clearPanelState = function () {
                                        chatter.getPublisher().getHandler("NotePost").unsubmittedDelta = g();
                                        Sfdc.get("#editor").innerHTML = "";
                                        Sfdc.get("#formatting-container").innerHTML = h;
                                        f()
                                    };
                                    a.getPayload = function (b) {
                                        var e = chatter.getToolbox(),
                                        a = g(),
                                        d = Sfdc.get(".noteTitleInput"),
                                        e = e.stringTrim(d.value);
                                        b.delta = JSON.stringify(a);
                                        b.noteTitle = e;
                                        return b
                                    };
                                    a.validatePayload = function (b) {
                                        chatter.getToolbox();
                                        b = JSON.parse(b.delta);
                                        b = !l(b);
                                        return {
                                            isValid: b,
                                            errorPayload: {
                                                hasContent: b
                                            }
                                        }
                                    };
                                    a.onValidationFailure = function (b) {
                                        var a = chatter.getPublisher().getHandler("NotePost"),
            c = LC.getLabel("Publisher", "noteMissingBody");
                                        b.hasContent || a.publisherCore.showErrors(c);
                                        a.publisherCore.enablePublisher()
                                    };
                                    a.onSuccess = function (b, a) {
                                        var c = chatter.getPublisher().getHandler("NotePost");
                                        Sfdc.get(".noteTitleInput").value = "";
                                        c.editor.setDelta(Tandem.Delta.getInitial("\n"));
                                        c.unsubmittedDelta = Tandem.Delta.getInitial("\n");
                                        f()
                                    };
                                    a.onFailure = function (b, a) {
                                        var c = chatter.getPublisher().getHandler("NotePost");
                                        a.errors && c.publisherCore.showErrors(a.errors.message);
                                        c.publisherCore.enablePublisher()
                                    };
                                    var k = function () {
                                        Sfdc.un(window, "unload", k)
                                    },
        d = function () {
            var b = chatter.getToolbox(),
                a = chatter.getPublisher(),
                c = g(),
                c = !l(c),
                d = Sfdc.get(".noteTitleInput"),
                b = 0 < b.stringTrim(d.value).length;
            c && b ? a.setIsExtensionValidForSubmit(!0) :
                a.setIsExtensionValidForSubmit(!1)
        },
        l = function (a) {
            if (0 === a.ops.length) return !0;
            if (2 > a.ops.length)
                if (2 > a.ops[0].value.length) {
                    if ("\n" === a.ops[0].value) return !0
                } else return !1;
            else return !1
        },
        g = function () {
            return chatter.getPublisher().getHandler("NotePost").editor.getDelta()
        },
        f = function () {
            var a = chatter.getPublisher().getHandler("NotePost"),
                e = Sfdc.get(".noteTitleInput");
            Sfdc.Event.remove(e, "keyup", d);
            Sfdc.Event.remove(a.editor.root, "keyup", d)
        };
                                    return a
                                } ());

                                function PollPostHelper() {
                                    function g(a) {
                                        a = new LoadingScreen(a, LC.getLabel("Global", "loading"));
                                        a.show();
                                        b = a
                                    }
                                    var e = chatter.getToolbox(),
        b = null;
                                    this.vote = function (a) {
                                        var c = Ext.get(a),
            d = c.findParent(".pollauxiliarybody", null, !0);
                                        if (a = d.child(".pollchoices").child("input:checked")) {
                                            a = a.dom.id;
                                            var b = Sfdc.Dom.getParent(d.dom, ".cxfeeditem").id;
                                            e.disableButton(c);
                                            e.post({
                                                url: "/poll/choices/" + a + "/votes",
                                                params: {
                                                    feeditemid: b
                                                },
                                                success: function (a, b) {
                                                    b.html && Sfdc.Dom.updateHTML(d.dom, b.html)
                                                },
                                                failure: function (a,
                    b) {
                                                    e.enableButton(c)
                                                }
                                            })
                                        } else alert(LC.getLabel("Feeds", "PollNoChoiceSelectedVoteError"))
                                    };
                                    this.toggleView = function (a, c, d) {
                                        var f = Ext.get(c).parent(".pollauxiliarybody");
                                        d && g(f.dom);
                                        c = Sfdc.Dom.getParent(f.dom, ".cxfeeditem").id;
                                        e.get({
                                            url: "/poll/" + c + "/",
                                            params: {
                                                viewtype: a
                                            },
                                            success: function (a, c) {
                                                d && (b.hide(), b = null);
                                                c.html && Sfdc.Dom.updateHTML(f.dom, c.html)
                                            },
                                            failure: function (a, c) {
                                                d && (b.hide(), b = null)
                                            }
                                        })
                                    }
                                }
                                chatter.extend("PollPostHelper", PollPostHelper, null);
                                chatter.getPublisher().registerFeedItemTypeHandler("PollPost", function () {
                                    var k = {
                                        config: {
                                            defaultNumChoicesDisplayed: 2,
                                            minNumChoices: 2,
                                            maxNumChoices: 10,
                                            maxChoiceLength: 100
                                        },
                                        state: {
                                            numChoicesShown: 2
                                        },
                                        wiredFields: {},
                                        setupPanel: function () {
                                            this.config.promptText = LC.getLabel("Publisher", "QuestionGhostPrompt");
                                            Sfdc.on(window, "unload", l)
                                        },
                                        validatePollChoices: function () {
                                            for (var a = chatter.getPublisher().getHandler("PollPost"), b = chatter.getToolbox(), d = LC.getLabel("Feeds", "PollChoiceLengthError", a.config.maxChoiceLength),
                        c = Sfdc.select(".publisherpollchoiceinput"), e = c.length, f = !0, g = 0; g < e; g++) {
                                                var h = b.stringTrim(c[g].value),
                        k = Sfdc.get(".errorMsg", Sfdc.Dom.getParent(c[g]));
                                                h ? f = a.validateElement(k, function () {
                                                    return h.length <= a.config.maxChoiceLength
                                                }, d) && f : Sfdc.Dom.addClass(k, "hidden")
                                            }
                                            return f
                                        },
                                        validateElement: function (a, b, d) {
                                            if (b()) return Sfdc.Dom.addClass(a, "hidden"), !0;
                                            Sfdc.Dom.updateHTML(a, d);
                                            Sfdc.Dom.removeClass(a, "hidden");
                                            return !1
                                        },
                                        removeEventsForPostType: function () {
                                            m()
                                        },
                                        focusFirstElement: function () {
                                            this.publisherCore.focusOnTextArea()
                                        },
                                        onShowPanel: function () {
                                            chatter.getPublisher().getHandler("PollPost");
                                            this.publisherCore.setIsExtensionValidForSubmit(!1);
                                            for (var a = Sfdc.select("input.publisherpollchoiceinput"), b = a.length, d = chatter.getPublisher().getHandler("PollPost"), c = 0; c < b; c++) {
                                                var e = a[c];
                                                d.wiredFields[a[c].id] = e.value;
                                                Sfdc.Event.add(e, "keyup", n)
                                            }
                                            a = chatter.getPublisher().getTextArea();
                                            Sfdc.Event.add(a, "keyup", h);
                                            this.publisherCore.enablePublisher()
                                        },
                                        clearPanelState: function () {
                                            var a = this.config.defaultNumChoicesDisplayed;
                                            LC.getLabel("Publisher",
                    "MoreChoicesLabel");
                                            for (var b = Sfdc.select("div.publisherpollchoice"), d = b.length, c = 0; c < d; c++) {
                                                var e = b[c];
                                                c < a ? Sfdc.get(".publisherpollchoiceinput", e).value = "" : e.parentNode.removeChild(e)
                                            }
                                            chatter.getPublisher().getHandler("PollPost").wiredFields = {};
                                            a = Sfdc.get(".publisherpolladdchoice");
                                            Sfdc.Dom.show(a);
                                            k.state.numChoicesShown = k.config.defaultNumChoicesDisplayed;
                                            a = Sfdc.select(".errorMsg", Sfdc.get(".publisherpollchoices"));
                                            for (b = 0; b < a.length; b++) Sfdc.Dom.setText(a[b], "")
                                        },
                                        getPayload: function (a) {
                                            for (var b =
                        chatter.getToolbox(), d = this.publisherCore.getRawBody(), c = Sfdc.select(".publisherpollchoiceinput"), e = [], f = 0; f < c.length; f++) {
                                                var g = b.stringTrim(c[f].value);
                                                g && e.push(g)
                                            }
                                            a.question = d;
                                            a.choices = e;
                                            return a
                                        },
                                        validatePayload: function (a) {
                                            var b = chatter.getPublisher().getHandler("PollPost"),
                    d = chatter.getToolbox(),
                    c = a.choices.length;
                                            a = !(d.stringIsEmpty(a.question) || chatter.getPublisher().isPromptText(a.question));
                                            d = c >= b.config.minNumChoices;
                                            c = c <= b.config.maxNumChoices;
                                            return {
                                                isValid: a && d && c && b.validatePollChoices(),
                                                errorPayload: {
                                                    questionPresent: a,
                                                    hasMinNumChoices: d,
                                                    hasLessThanMaxNumChoices: c
                                                }
                                            }
                                        },
                                        onValidationFailure: function (a) {
                                            var b = chatter.getPublisher().getHandler("PollPost"),
                    d = LC.getLabel("Feeds", "PollTooFewChoicesError", b.config.minNumChoices);
                                            LC.getLabel("Feeds", "PollTooManyChoicesError", b.config.maxNumChoices);
                                            var c = LC.getLabel("Feeds", "PollQuestionRequiredError");
                                            a.questionPresent ? a.hasMinNumChoices ? a.hasLessThanMaxNumChoices || b.publisherCore.showErrors(c) : b.publisherCore.showErrors(d) : b.publisherCore.showErrors(c);
                                            b.publisherCore.enablePublisher()
                                        },
                                        onSuccess: function (a, b) {
                                            chatter.getPublisher().getHandler("PollPost");
                                            m()
                                        },
                                        onFailure: function (a, b) {
                                            var d = chatter.getPublisher().getHandler("PollPost");
                                            b.errors && d.publisherCore.showErrors(b.errors.message);
                                            d.publisherCore.enablePublisher()
                                        },
                                        addPollChoiceInputElement: function (a) {
                                            var b = chatter.getPublisher().getHandler("PollPost"),
                    d = Sfdc.get(".publisherpollchoice").cloneNode(!0),
                    c = Sfdc.get(".publisherpollchoicelabel", d),
                    e = Sfdc.get(".publisherpollchoiceinput", d);
                                            b.state.numChoicesShown++;
                                            var f = p(e.getAttribute("id")),
                    g = p(e.getAttribute("title"));
                                            Sfdc.Dom.set(e, {
                                                value: "",
                                                title: g,
                                                id: f
                                            });
                                            Sfdc.Dom.set(c, {
                                                attributes: {
                                                    "for": f
                                                }
                                            });
                                            Sfdc.Dom.setText(c, g);
                                            b.state.numChoicesShown == b.config.maxNumChoices && Sfdc.Dom.hideByDisplay(Sfdc.Dom.getParent(a, ".publisherpolladdchoice"));
                                            a = Sfdc.get(".errorMsg", d);
                                            Sfdc.Dom.addClass(a, "hidden");
                                            Sfdc.Event.add(e, "keyup", n);
                                            Sfdc.get(".publisherpollchoices").appendChild(d);
                                            e.focus()
                                        }
                                    },
        l = function () {
            for (var a = Sfdc.select(".publisherpollchoiceinput"), b = 0; b < a.length; b++) a[b].onfocus =
                null;
            Sfdc.un(window, "unload", l)
        },
        n = function () {
            chatter.getPublisher().getHandler("PollPost").wiredFields[this.id] = this.value;
            h()
        },
        h = function () {
            chatter.getPublisher().getHandler("PollPost");
            chatter.getToolbox();
            var a = chatter.getPublisher();
            a.getRawBody();
            var b;
            if (b = !a.isTextBoxEmpty() && !a.getHasTextareaErrors()) {
                b = chatter.getToolbox();
                var d = chatter.getPublisher().getHandler("PollPost"),
                    c = d.wiredFields,
                    e = 0,
                    f;
                for (f in c) b.stringTrim(c[f]) && e++;
                b = e >= d.config.minNumChoices
            }
            b ? a.setIsExtensionValidForSubmit(!0) :
                a.setIsExtensionValidForSubmit(!1)
        },
        m = function () {
            var a = chatter.getPublisher().getTextArea();
            Sfdc.Event.remove(a, "keyup", h)
        },
        p = function (a) {
            var b = chatter.getPublisher().getHandler("PollPost");
            return a.replace(/\d/, b.state.numChoicesShown)
        };
                                    return k
                                } ());
                                PublisherVisibilityMessages = function () { };
                                PublisherVisibilityMessages.getVisibilityMessages = function (a, d, f, b, g) {
                                    d = PublisherVisibilityMessages.getLabels(a, d, f, UserContext.isDefaultNetwork, b, g);
                                    a = {
                                        text: d.directedTo,
                                        title: LC.getLabel("ChatterVisibility", "DirectedToTitle")
                                    };
                                    d = {
                                        text: d.accessibleFrom,
                                        title: LC.getLabel("ChatterVisibility", "AccessibleFromTitle")
                                    };
                                    return [a, d]
                                };
                                PublisherVisibilityMessages.getLabels = function (a, d, f, b, g, k) {
                                    var c = a.subjectId.substr(0, 3),
        l = "005" === c,
        h = a.subjectId === UserContext.userId,
        m = "0F9" === c,
        e;
                                    b ? (c = LC.getLabel("ChatterVisibility", "TheAllCompanyFeed"), e = ",") : e = c = "";
                                    l ? k ? (a = LC.getLabel("ChatterVisibility", "DirectedToTopic"), b = LC.getLabel("ChatterVisibility", "AccessibleFromTopic", c)) : h || d ? (a = LC.getLabel("ChatterVisibility", "DirectedToYourProfile"), b = h ? LC.getLabel("ChatterVisibility", "AccessibleFromYourProfile", c, e) : LC.getLabel("ChatterVisibility",
        "AccessibleFromOtherUserProfile", c, e)) : g ? (a = LC.getLabel("ChatterVisibility", "DirectedToOtherUserProfileWhenUserSharingEnabled"), b = b ? LC.getLabel("ChatterVisibility", "AccessibleFromOtherUserProfileWhenUserSharingEnabledCommunityZero", c) : LC.getLabel("ChatterVisibility", "AccessibleFromOtherUserProfileWhenUserSharingEnabledOtherCommunity")) : (a = LC.getLabel("ChatterVisibility", "DirectedToOtherUserProfile"), b = LC.getLabel("ChatterVisibility", "AccessibleFromOtherUserProfile", c, e)) : m ? a.isExternalGroup ? (a = LC.getLabel("ChatterVisibility",
        "DirectedToExternalGroup"), b = LC.getLabel("ChatterVisibility", "AccessibleFromPrivateGroup", c)) : a.isPrivateGroup ? (a = LC.getLabel("ChatterVisibility", "DirectedToPrivateGroup"), b = LC.getLabel("ChatterVisibility", "AccessibleFromPrivateGroup", c)) : (a = LC.getLabel("ChatterVisibility", "DirectedToPublicGroup"), b = LC.getLabel("ChatterVisibility", "AccessibleFromPublicGroup", c)) : "INTERNAL_USERS" == f ? (a = LC.getLabel("ChatterVisibility", "DirectedToRecordDetailEmployees"), b = LC.getLabel("ChatterVisibility", "AccessibleFromRecordDetailEmployees",
        c)) : (a = LC.getLabel("ChatterVisibility", "DirectedToRecordDetailEveryone"), b = LC.getLabel("ChatterVisibility", "AccessibleFromRecordDetailEveryone", c));
                                    return {
                                        directedTo: a,
                                        accessibleFrom: b
                                    }
                                };
                                chatter.getPublisher().registerFeedItemTypeHandler("QuestionPost", function () {
                                    var d = {
                                        config: {},
                                        setupPanel: function () {
                                            var a = this;
                                            a.config.questionTitleEl = Sfdc.get("publisherQuestionTitle");
                                            a.config.questionTitleGhostText = LC.getLabel("QuestionFeedItemPublisher", "QuestionTitleGhostText");
                                            a.config.promptText = LC.getLabel("QuestionFeedItemPublisher", "QuestionBodyGhostText");
                                            var b = {
                                                subjectId: chatter.getFeed().getConfig().subjectId
                                            };
                                            chatter.onDeferLoad(function () {
                                                a.config.deflectionAutoCompleteComp = new DeflectionAutoComplete("publisherQuestionTitle", chatter.getToolbox().sitePrefix() + "/_ui/deflection/QuestionDeflectionAutoCompleteServlet", b, chatter)
                                            });
                                            Sfdc.on(a.config.questionTitleEl, "focus", function () {
                                                d.onFocus(a.config.questionTitleEl)
                                            });
                                            Sfdc.on(a.config.questionTitleEl, "blur", function () {
                                                d.onUnfocus(a.config.questionTitleEl)
                                            });
                                            chatter.getToolbox().wireFieldChange(Ext.get("publisherQuestionTitle"), function () {
                                                a.isTitleEmptyOrPrompt() ? a.publisherCore.setIsExtensionValidForSubmit(!1) : a.publisherCore.setIsExtensionValidForSubmit(!0)
                                            });
                                            var c = LC.getLabel("QuestionFeedItemPublisher", "Ask");
                                            a.config.submitValueAndTitle = {
                                                value: c,
                                                title: c
                                            }
                                        },
                                        onFocus: function (a) {
                                            chatter.getPublisher().getHandler("QuestionPost").isTitlePromptText() && (a.value = "", Sfdc.userAgent.isSafari && a.focus());
                                            Sfdc.Dom.addClass(a, "publisherQuestionTitlefocus")
                                        },
                                        onUnfocus: function (a) {
                                            var b = chatter.getPublisher().getHandler("QuestionPost");
                                            b.isTitleEmptyOrPrompt() && (a.value = b.config.questionTitleGhostText, Sfdc.Dom.removeClass(a, "publisherQuestionTitlefocus"))
                                        },
                                        onShowPanel: function () {
                                            chatter.getPublisher().getHandler("QuestionPost").publisherCore.setIsExtensionValidForSubmit(!1)
                                        },
                                        onFailure: function (a, b) {
                                            var c = chatter.getPublisher().getHandler("QuestionPost");
                                            c.publisherCore.enablePublisher();
                                            (c = c.config.deflectionAutoCompleteComp) && c.hideNoResultsMessage();
                                            b.errors && alert(b.errors.message)
                                        },
                                        focusFirstElement: function () {
                                            chatter.getPublisher().getHandler("QuestionPost").config.questionTitleEl.focus()
                                        },
                                        clearPanelState: function () {
                                            var a = chatter.getPublisher().getHandler("QuestionPost");
                                            a.config.questionTitleEl.value = "";
                                            a.onUnfocus(a.config.questionTitleEl);
                                            if (a = a.config.deflectionAutoCompleteComp) a.clearSuggestions(), a.hideNoResultsMessage()
                                        },
                                        onSuccess: function () {
                                            var a = chatter.getPublisher().getHandler("QuestionPost").config.deflectionAutoCompleteComp;
                                            a && (a.clearCache(), a.clearSuggestions(), a.hideNoResultsMessage())
                                        },
                                        getPayload: function (a) {
                                            var b = chatter.getPublisher().getHandler("QuestionPost"), c = b.publisherCore.getRawBody();
                                            b.publisherCore.isPromptText(c) || (a.text = c);
                                            b.isTitleEmptyOrPrompt() || (a.title = b.config.questionTitleEl.value);
                                            return a
                                        },
                                        isTitlePromptText: function () {
                                            var a = chatter.getPublisher().getHandler("QuestionPost");
                                            return a.config.questionTitleEl.value == a.config.questionTitleGhostText
                                        },
                                        isTitleEmptyOrPrompt: function () {
                                            var a = chatter.getPublisher().getHandler("QuestionPost");
                                            return 0 == chatter.getToolbox().stringTrim(a.config.questionTitleEl.value).length || a.isTitlePromptText()
                                        },
                                        modifyPublisherForDeflectionResults: function () {
                                            chatter.getPublisher().getHandler("QuestionPost").publisherCore.setIsExtensionValidForSubmit(!1)
                                        },
                                        modifyPublisherWithoutDeflectionResults: function () {
                                            var a = chatter.getPublisher().getHandler("QuestionPost");
                                            a.publisherCore.setIsExtensionValidForSubmit(!a.isTitleEmptyOrPrompt())
                                        },
                                        validatePayload: function () {
                                            var a = !0, b = {};
                                            chatter.getPublisher().getHandler("QuestionPost").isTitleEmptyOrPrompt() && (a = !1, b = {
                                                emptyQuestionTitle: !0
                                            });
                                            return {
                                                isValid: a,
                                                errorPayload: b
                                            }
                                        },
                                        onValidationFailure: function (a) {
                                            var b = LC.getLabel("QuestionFeedItemPublisher", "postTitleRequired");
                                            a.emptyQuestionTitle && this.publisherCore.showErrors(b);
                                            chatter.getPublisher().getHandler("QuestionPost").publisherCore.enablePublisher()
                                        }
                                    };
                                    return d
                                } ());
                                chatter.getPublisher().registerFeedItemTypeHandler("RypplePost", function () {
                                    var h = null,
        b = null,
        f = null,
        s = function (a, b) {
            for (; null !== a.firstChild; ) a.removeChild(a.firstChild);
            a.appendChild(document.createTextNode(b))
        },
        m = function () {
            "undefined" == typeof thanksRecipientContainer && (thanksRecipientContainer = Sfdc.get("thanksRecipientContainer"))
        },
        t = function () {
            var a = Sfdc.get("thanksRecipientInputBox");
            a.value = LC.getLabel("Rypple_Publisher", "recipientghosttextJS");
            Sfdc.Dom.addClass(a, UserAndGroupAutoCompleteInputElement.INPUTBOX_GHOSTTEXT_CSS_CLASS)
        },
        p = function () {
            Sfdc.get("thanksRecipientInputBox").value = ""
        },
        u = function () {
            m();
            return Sfdc.Dom.getElementXY(thanksRecipientContainer).y + Sfdc.Dom.getHeight(thanksRecipientContainer)
        },
        k = function (a) {
            b.state.thanksRecipientid = "";
            var c = Sfdc.get("thanksRecipientInputBox"),
                d = Sfdc.Dom.getParent(c),
                e = Sfdc.get("thanksRecipient");
            a = Sfdc.get(".item_" + a + "", e);
            Sfdc.Dom.removeChild(a);
            Sfdc.Dom.show(d);
            b.state.usernoaccesstogrp = "";
            v();
            g();
            w();
            null != a && (b.state.ryppleThanksSuccess || (Sfdc.userAgent.isIE ? window.setTimeout("Sfdc.get('thanksRecipientInputBox').focus()",
                200) : c.focus()))
        },
        n = function (a, c) {
            if (b.state.thanksRecipientid != UserContext.userId) {
                b.state.thanksRecipientid = a;
                var d = Sfdc.get("thanksRecipientInputBox"),
                    e = Sfdc.Dom.getParent(d),
                    q = '\x3cdiv userid\x3d"' + a + '" class\x3d"item_' + a + ' item " tabindex\x3d"0"\x3e\x3cspan class\x3d"recipientName"\x3e' + c + '\x3c/span\x3e\x3cdiv class\x3d"rypple-thanksRecipientRemove"\x3e\x3ca href\x3d"javascript:void(0)" class\x3d"remove"\x3e\x3cimg src\x3d"/s.gif"/\x3e\x3c/a\x3e\x3c/div\x3e\x3c/div\x3e',
                    h = Sfdc.get("thanksRecipient"),
                    q = Sfdc.Dom.insertHTML(h, q);
                remove = Sfdc.get(".remove", q[0]);
                Sfdc.on(remove, "click", function () {
                    k(a)
                });
                Sfdc.on(h, "keydown", function (b) {
                    if (b.keyCode == Sfdc.Event.keyCode.BACKSPACE || b.keyCode == Sfdc.Event.keyCode.DELETE) k(a), Sfdc.Event.stopPropagation(), d.focus()
                });
                Sfdc.Dom.hideByDisplay(e);
                g();
                Sfdc.userAgent.isIE ? window.setTimeout("chatter.getPublisher().getTextArea().focus()", 200) : f.focus()
            }
            UserAndGroupAutoCompleteInputElement.needDefer() ? p.defer(100) : p();
            D();
            E(a, c)
        },
        g = function () {
            result = !1;
            if (!b.config.ryppleReturnedError) {
                var a =
                    f,
                    c = Sfdc.get("thanksRecipient"),
                    c = Sfdc.get(".recipientName", c),
                    d = LC.getLabel("Rypple_Publisher", "descriptionghosttextJS");
                "" != b.state.usernoaccesstogrp && x(b.state.usernoaccesstogrp);
                result = null != c && null != a.value && a.value != d && 0 < a.value.length && null == a.value.match(/^\s*$/) ? !0 : !1
            }
            b.publisherCore.setIsExtensionValidForSubmit(result)
        },
        D = function () {
            var a = Sfdc.get("thanksRecipientInputBox");
            Sfdc.Dom.set(a, "size", a.value.length + 25);
            b.config.thankedWidget.acBox && b.config.thankedWidget.acBox.setStyle("top",
                u() + "px")
        },
        F = function () {
            b.state.isRyppleAuthorized && (b.state.badgesRetrieved || chatter.getToolbox().get({
                url: "/rypplebadges",
                params: {},
                success: function (a, c) {
                    b.state.badgeHTML = c.html;
                    b.state.badgesRetrieved = !0;
                    "" != b.state.ryppleDialog && b.state.ryppleDialog.setContentInnerHTML(b.state.badgeHTML)
                }
            }))
        },
        H = function (a) {
            b.state.isRyppleAuthorized && (G(), chatter.getToolbox().get({
                url: "/badgedefinitions/" + a + "/limits",
                params: {},
                success: function (a, d) {
                    if (b.state.ryppleDialog)
                        if (null == d.limitRemaining || 0 < d.limitRemaining) {
                            var e =
                                Sfdc.get(".limitRemaining");
                            Sfdc.Dom.set(e, "innerHTML", d.limitRemaining);
                            e = Sfdc.get(".badgeLimitsSection");
                            Sfdc.Dom.removeClass(e, "hidden");
                            r()
                        } else e = Sfdc.get(".cancelButton"), Sfdc.Dom.addClass(e, "zen-highlightBtn"), Sfdc.Dom.addClass(e, "zen-btn"), Sfdc.Dom.removeClass(e, "linkStyle"), e = Sfdc.get(".confirmButton"), Sfdc.Dom.addClass(e, "hidden"), Sfdc.Dom.removeClass(e, "zen-highlightBtn"), Sfdc.Dom.removeClass(e, "zen-btn"), e = Sfdc.get(".badgeButtonsContainer"), Sfdc.Dom.removeClass(e, "hidden"), e = Sfdc.get(".badgeLimitsErrorSection"),
                            Sfdc.Dom.removeClass(e, "hidden")
                },
                failure: function () {
                    r()
                }
            }))
        },
        r = function () {
            var a = Sfdc.get(".badgeButtonsContainer");
            Sfdc.Dom.removeClass(a, "hidden");
            a = Sfdc.get(".cancelButton");
            Sfdc.Dom.removeClass(a, "zen-highlightBtn");
            Sfdc.Dom.removeClass(a, "hidden");
            Sfdc.Dom.removeClass(a, "zen-btn");
            Sfdc.Dom.addClass(a, "linkStyle");
            a = Sfdc.get(".confirmButton");
            Sfdc.Dom.addClass(a, "zen-btn");
            Sfdc.Dom.addClass(a, "zen-highlightBtn");
            Sfdc.Dom.removeClass(a, "hidden");
            a = Sfdc.get(".badgeLimitsErrorSection");
            Sfdc.Dom.addClass(a,
                "hidden")
        },
        G = function () {
            var a = Sfdc.get(".badgeButtonsContainer");
            Sfdc.Dom.addClass(a, "hidden")
        },
        l = function () {
            var a = Sfdc.get("badgeInfo");
            if (null != a) {
                var c = Sfdc.Dom.get(a, "dataset");
                null != c ? (b.state.badgeSmallUrl = c.smallurl, b.state.badgeFullUrl = c.fullurl, b.state.badgeName = c.name, b.state.badgeId = c.externalid, b.state.badgeDescription = c.description) : (b.state.badgeSmallUrl = a.getAttribute("data-smallurl"), b.state.badgeFullUrl = a.getAttribute("data-fullUrl"), b.state.badgeName = a.getAttribute("data-name"),
                    b.state.badgeId = a.getAttribute("data-externalid"), b.state.badgeDescription = a.getAttribute("data-description"));
                !0 !== b.state.defaultBadgeImageSet && (Sfdc.Dom.set(Sfdc.get(".publisherBadge"), "src", b.state.badgeSmallUrl), b.state.defaultBadgeImageSet = !0)
            }
        },
        w = function () {
            chatter.getTextareaMessageUtil().hideMessage({
                el: f.id,
                msg_id: "ryppleThanksFailed"
            });
            b.config.ryppleReturnedError = !1
        },
        v = function () {
            chatter.getTextareaMessageUtil().hideMessage({
                el: f.id,
                msg_id: "thanksRecipientWithoutAccess"
            })
        },
        x = function (a) {
            var b =
                LC.getLabel("PublisherAutoComplete", "allCannotReadNoEntitySingular"),
                b = b.replace("{0}", a),
                b = b.replace("{1}", h.getSubject().entityType);
            chatter.getTextareaMessageUtil().showMessage({
                el: f.id,
                type: 2,
                append: !0,
                msg_html: b,
                msg_id: "thanksRecipientWithoutAccess"
            })
        },
        E = function (a, c) {
            var d = chatter.getFeed().config.feedType,
                d = ["/feed/", b.state.subjectId, "/", d, "/checkaccess/", a].join("");
            chatter.getToolbox().get({
                url: d,
                success: function (d, f) {
                    !1 === f[a] && (b.state.usernoaccesstogrp = c, x(c))
                }
            })
        },
        y = function () {
            g()
        },
        z =
        function () {
            g()
        },
        A = function () {
            g()
        },
        B = function () {
            f.focus()
        },
        C = function () {
            b.state.isRyppleAuthorized && (k(b.state.subjectId), b.state.defaultUserRetrieved ? "" != b.state.defaultUserName && n(b.state.subjectId, b.state.defaultUserName) : (b.state.subjectId = h.getSubjectId(), /^005/.test(b.state.subjectId) && b.state.subjectId != UserContext.userId && chatter.getToolbox().get({
                url: "/userlookup",
                params: {
                    subjectId: b.state.subjectId
                },
                success: function (a, c) {
                    if (0 < c.name.length) {
                        var d = chatter.getToolbox().htmlEncode(c.name);
                        n(b.state.subjectId,
                            d);
                        b.state.defaultUserRetrieved = !0;
                        b.state.defaultUserName = d
                    }
                }
            })))
        };
                                    return {
                                        config: {
                                            omnitureEvent: "postThanks",
                                            maxthanksRecipients: 1,
                                            defaultTextAreaLines: 7,
                                            maxBodyLength: 978
                                        },
                                        state: {
                                            thanksRecipientid: "",
                                            ryppleDialog: "",
                                            badgesRetrieved: !1,
                                            defaultUserRetrieved: !1,
                                            defaultUserName: "",
                                            isRyppleAuthorized: !1,
                                            ryppleReturnedError: !1,
                                            ryppleThanksSuccess: !1
                                        },
                                        setupPanel: function () {
                                            var a = Sfdc.get("thanksRecipientInputBox");
                                            if (null !== a) {
                                                this.state.isRyppleAuthorized = null != Sfdc.get("showingrypplethanks");
                                                m();
                                                var c = Sfdc.get("thanksRecipient");
                                                h = chatter.getPublisher();
                                                b = h.getHandler("RypplePost");
                                                b.config.maxBodyLength = h.DEFAULT_MAX_BODY_LENGTH - 22;
                                                b.config.promptText = LC.getLabel("Rypple_Publisher", "descriptionghosttextJS");
                                                f = h.getTextArea();
                                                Sfdc.on(c, "click", function () {
                                                    a.focus()
                                                });
                                                this.config.thankedWidget = new UserAndGroupAutoCompleteInputElement({
                                                    elementId: "thanksRecipientInputBox",
                                                    inDialog: !0,
                                                    disableGhostText: !1,
                                                    entityType: UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER,
                                                    fixedACYPosition: 0,
                                                    ghostText: LC.getLabel("Rypple_Publisher", "recipientghosttextJS"),
                                                    handleSelect: function (a) {
                                                        n(a.itemId, a.itemName);
                                                        this.complete()
                                                    },
                                                    getMinimumWidth: function () {
                                                        m();
                                                        return Sfdc.Dom.getWidth(thanksRecipientContainer) - 2
                                                    },
                                                    getACXPosition: function () {
                                                        m();
                                                        return Sfdc.Dom.getElementXY(thanksRecipientContainer).x
                                                    },
                                                    getACYPosition: function () {
                                                        return u()
                                                    }
                                                });
                                                this.config.thankedWidget.isValidSuggestion = function (a, b) {
                                                    return b.ItemId === UserContext.userId ? !1 : UserAndGroupAutoCompleteInputElement.prototype.isValidSuggestion.call(this, a, b)
                                                };
                                                Sfdc.on(a, "blur", function () {
                                                    var c = Sfdc.get(".recipientName", a);
                                                    b.config.thankedWidget.allowHideAC && null == c && (p(), t())
                                                })
                                            }
                                        },
                                        onShowPanel: function () {
                                            this.state.isRyppleAuthorized && (l(), C(), t());
                                            F();
                                            Sfdc.Event.add(f, "keyup", y);
                                            Sfdc.Event.add(f, "paste", z);
                                            Sfdc.Event.add(f, "blur", A);
                                            var a = Sfdc.get("publisherTextArea");
                                            Sfdc.Event.add(a, "click", B);
                                            g()
                                        },
                                        clearPanelState: function () {
                                            w();
                                            v();
                                            b.state.isRyppleAuthorized && (k(b.state.thanksRecipientid), b.state.thanksRecipientid = "", b.state.usernoaccesstogrp = "", C(), l(), publisherBadgeImageElement = Sfdc.get(".publisherBadge"),
                Sfdc.Dom.set(publisherBadgeImageElement, "src", b.state.badgeSmallUrl), Sfdc.Dom.set(publisherBadgeImageElement, "alt", b.state.badgeName), Sfdc.Dom.set(publisherBadgeImageElement, "title", b.state.badgeDescription));
                                            b.config.ryppleReturnedError = !1;
                                            b.state.ryppleThanksSuccess = !1
                                        },
                                        getPayload: function (a) {
                                            a.thanked = b.state.thanksRecipientid;
                                            a.thankyounote = this.publisherCore.getRawBody();
                                            a.smallurl = b.state.badgeSmallUrl;
                                            a.fullurl = b.state.badgeFullUrl;
                                            a.name = b.state.badgeName;
                                            a.externalid = b.state.badgeId;
                                            a.description = b.state.badgeDescription;
                                            a.skills = b.state.badgeSkills;
                                            return a
                                        },
                                        validatePayload: function (a) {
                                            var c = chatter.getToolbox();
                                            null == a.thanked && (a.thanked = "");
                                            var c = !c.stringIsEmpty(a.thankyounote), d = a.thankyounote.length <= b.config.maxBodyLength, e = a.thankyounote != b.config.promptText, f = 0 < a.thanked.length;
                                            a = "undefined" !== typeof a.externalid;
                                            return {
                                                isValid: f && d && e && c && a,
                                                errorPayload: {
                                                    thankyounote: c,
                                                    thankyounotetoobig: d,
                                                    thankyounoteghosttext: e,
                                                    thanked: f,
                                                    badgeidempty: a
                                                }
                                            }
                                        },
                                        onValidationFailure: function (a) {
                                            var c =
                LC.getLabel("Rypple_Publisher", "ryppleThankedRequired"),
                d = LC.getLabel("Feeds", "CommentMaxLengthErrorMsg", b.config.maxBodyLength + 18),
                e = LC.getLabel("Rypple_Publisher", "ryppleBadgeRequired");
                                            a.thanked ? a.thankyounotetoobig ? a.badgeidempty || this.publisherCore.showErrors(e) : this.publisherCore.showErrors(d) : this.publisherCore.showErrors(c);
                                            b.publisherCore.enablePublisher()
                                        },
                                        onSuccess: function (a, c) {
                                            b.state.ryppleThanksSuccess = !0;
                                            b.publisherCore.switchToDefaultPublisherType();
                                            l()
                                        },
                                        onFailure: function (a, c) {
                                            if (c.errors) {
                                                b.config.ryppleReturnedError = !0;
                                                g();
                                                var d = c.errors.message;
                                                chatter.getTextareaMessageUtil().showMessage({
                                                    el: f.id,
                                                    type: 1,
                                                    append: !0,
                                                    msg_html: d ? d : LC.getLabel("Rypple_Publisher", "ryppleThanksFailed"),
                                                    msg_id: "ryppleThanksFailed"
                                                })
                                            }
                                            b.publisherCore.enablePublisher()
                                        },
                                        removeEventsForPostType: function () {
                                            Sfdc.Event.remove(f, "keyup", y);
                                            Sfdc.Event.remove(f, "paste", z);
                                            Sfdc.Event.remove(f, "blur", A);
                                            var a = Sfdc.get("publisherTextArea");
                                            Sfdc.Event.remove(a, "click", B)
                                        },
                                        showRyppleDialog: function () {
                                            var a;
                                            "" != b.state.ryppleDialog ? a = b.state.ryppleDialog : (a = new SimpleDialog("rypple", !0), b.state.ryppleDialog = a, a.displayX = !0, a.register());
                                            a.setTitle(LC.getLabel("Rypple_Badge", "selectBadgeTitle"));
                                            b.state.badgesRetrieved ? a.setContentInnerHTML(b.state.badgeHTML) : a.setContentInnerHTML(LC.getLabel("Global", "loading"));
                                            a.setWidth("520px");
                                            a.setMinHeight("500px");
                                            var c = Sfdc.get("ryppleContent");
                                            Sfdc.Dom.addClass(c, "ryppleBadgeContent");
                                            a.show()
                                        },
                                        displayBadgeList: function () {
                                            b.state.ryppleDialog.setTitle(LC.getLabel("Rypple_Badge", "selectBadgeTitle"));
                                            var a = Sfdc.get(".ryppleBadgeList"), c = Sfdc.get(".ryppleBadgeDetail");
                                            Sfdc.Dom.addClass(c, "hidden");
                                            Sfdc.Dom.removeClass(a, "hidden")
                                        },
                                        displayBadgeDetail: function (a, c, d, e, f, h) {
                                            if (b.state.ryppleDialog) {
                                                var g = Sfdc.get(".badgeLimitsSection");
                                                Sfdc.Dom.addClass(g, "hidden");
                                                g = Sfdc.get(".limitRemaining");
                                                Sfdc.Dom.set(g, "innerHTML", "");
                                                r()
                                            }
                                            H(a);
                                            b.state.ryppleDialog.setTitle(LC.getLabel("Rypple_Badge", "infoBadgeTitle"));
                                            var g = Sfdc.get(".ryppleBadgeList"), m = Sfdc.get(".ryppleBadgeDetail"), k = Sfdc.get(".badgeTitle"),
                p = Sfdc.get(".badgeSelectionDescription"), n = Sfdc.get(".badgeLargeImage"), l = Sfdc.get(".badgeSelectionSkills");
                                            s(k, escapeHTML(decodeURIComponent(c)));
                                            Sfdc.Dom.set(k, "data-id", a);
                                            s(p, escapeHTML(decodeURIComponent(d)));
                                            Sfdc.Dom.set(l, "data-skillscat", e);
                                            for (c = !1; !c; ) a = Sfdc.get(".skillPink", l), null != a ? Sfdc.Dom.removeChild(a) : c = !0;
                                            e = e.split(" ");
                                            for (i = 0; i < e.length; i++) a = Sfdc.Dom.create(l, {}, "span", document), Sfdc.Dom.addClass(a, "skillPink"), Sfdc.Dom.setText(a, e[i]);
                                            Sfdc.Dom.set(n, "src", f);
                                            Sfdc.Dom.set(n, "data-fullurl", h);
                                            Sfdc.Dom.addClass(g, "hidden");
                                            Sfdc.Dom.removeClass(m, "hidden");
                                            Sfdc.get("ryppleContent").style.height = "auto"
                                        },
                                        updateSelectedBadge: function () {
                                            var a = Sfdc.get(".badgeTitle"), c = Sfdc.get(".badgeSelectionDescription"), d = Sfdc.get(".badgeSelectionSkills"), e = Sfdc.get(".badgeLargeImage");
                                            Sfdc.get(".badgeTitle");
                                            var f = Sfdc.get(".badgeInfo");
                                            b.state.badgeSmallUrl = Sfdc.Dom.get(e, "src");
                                            b.state.badgeFullUrl = Sfdc.Dom.get(e, "data-fullurl");
                                            b.state.badgeName = Sfdc.Dom.get(a, "innerHTML");
                                            b.state.badgeId = Sfdc.Dom.get(a, "data-id");
                                            b.state.badgeDescription = Sfdc.Dom.get(c, "innerHTML");
                                            a = d.childNodes;
                                            b.state.badgeSkills = "";
                                            for (c = 0; c < a.length; c++) b.state.badgeSkills += Sfdc.Dom.get(a[c], "innerHTML");
                                            Sfdc.Dom.get(d, "span");
                                            d = Sfdc.get(".publisherBadge");
                                            b.state.ryppleDialog.hide();
                                            Sfdc.Dom.set(d, "src", b.state.badgeSmallUrl);
                                            Sfdc.Dom.set(d, "alt", b.state.badgeName);
                                            Sfdc.Dom.set(d, "title", b.state.badgeDescription);
                                            Sfdc.Dom.set(f, "data-badgename", b.state.badgeName)
                                        }
                                    }
                                } ());
                                chatter.getPublisher().registerFeedItemTypeHandler("TextPost", function () {
                                    return {
                                        config: {
                                            omnitureEvent: "post"
                                        },
                                        onShowPanel: function () {
                                            this.publisherCore.setIsExtensionValidForSubmit(!0)
                                        },
                                        onFailure: function (a, b) {
                                            chatter.getPublisher().getHandler("TextPost").publisherCore.enablePublisher();
                                            b.errors && alert(b.errors.message)
                                        },
                                        focusFirstElement: function () {
                                            this.publisherCore.focusOnTextArea()
                                        },
                                        onSuccess: function (a, b) {
                                            chatter.getPublisher().getHandler("TextPost").publisherCore.restoreDefaultUIState()
                                        },
                                        getPayload: function (a) {
                                            var b = this.publisherCore.getRawBody();
                                            a.text = b;
                                            return a
                                        },
                                        validatePayload: function (a) {
                                            return {
                                                isValid: !(chatter.getToolbox().stringIsEmpty(a.text) || this.publisherCore.isPromptText(a.text))
                                            }
                                        },
                                        onValidationFailure: function () {
                                            this.publisherCore.resetPublisher();
                                            this.publisherCore.enablePublisher()
                                        }
                                    }
                                } ());
                                Sfdc.ns("Sfdc.CreateVFPublisherHandler");
                                Sfdc.CreateVFPublisherHandler = function () {
                                    function c(a) {
                                        var b = chatter.getFeed();
                                        "undefined" != typeof entityFeedPage ? entityFeedPage.getApi().refresh(b.getConfig().subjectId, a) : a.feed && b.refresh({
                                            params: {
                                                subjectId: b.getConfig().subjectId
                                            },
                                            feedType: b.getConfig().feedType
                                        })
                                    }

                                    function e(a) {
                                        "undefined" != typeof entityFeedPage && entityFeedPage.getApi().selectAction(chatter.getFeed().getConfig().subjectId, a)
                                    }

                                    function f(a) {
                                        "undefined" != typeof entityFeedPage && entityFeedPage.getApi().setActionInputValues(chatter.getFeed().getConfig().subjectId, a)
                                    }

                                    function g(a) {
                                        "undefined" != typeof entityFeedPage && entityFeedPage.getApi().invokeAction(chatter.getFeed().getConfig().subjectId, a)
                                    }

                                    function h(a) {
                                        var b = d[a.actionName];
                                        b && Sfdc.canvas.parent.publish({
                                            name: "publisher.customActionMessage",
                                            payload: a,
                                            target: {
                                                iframe: b.frameId
                                            }
                                        })
                                    }
                                    var d = {};
                                    this.registerFeedItemTypeHandler = function (a, b, c) {
                                        d[c] = {
                                            frameId: b
                                        };
                                        chatter.getPublisher().registerFeedItemTypeHandler("VisualforcePage", function () {
                                            Sfdc.onload(function () {
                                                if ("undefined" != typeof entityFeedPage) entityFeedPage.getApi().onRefresh(b,
                    function (a) {
                        Sfdc.canvas.parent.publish({
                            name: "publisher.refresh",
                            payload: a,
                            target: {
                                iframe: b
                            }
                        })
                    })
                                            });
                                            return {
                                                config: {},
                                                onFailure: function () { },
                                                onSuccess: function () { },
                                                getPayload: function () { },
                                                validatePayload: function () { },
                                                onValidationFailure: function () { },
                                                setupPanel: function () {
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.setupPanel",
                                                        payload: {},
                                                        target: {
                                                            iframe: b
                                                        }
                                                    })
                                                },
                                                clearPanelState: function () {
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.clearPanelState",
                                                        payload: {},
                                                        target: {
                                                            iframe: b
                                                        }
                                                    })
                                                },
                                                onShowPanel: function () {
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.showPanel",
                                                        payload: {},
                                                        target: {
                                                            iframe: b
                                                        }
                                                    })
                                                }
                                            }
                                        } (), a)
                                    };
                                    Sfdc.onload(function () {
                                        Sfdc.canvas.parent.subscribe({
                                            name: "publisher.refresh",
                                            onData: c
                                        });
                                        Sfdc.canvas.parent.subscribe({
                                            name: "publisher.selectAction",
                                            onData: e
                                        });
                                        Sfdc.canvas.parent.subscribe({
                                            name: "publisher.setActionInputValues",
                                            onData: f
                                        });
                                        Sfdc.canvas.parent.subscribe({
                                            name: "publisher.invokeAction",
                                            onData: g
                                        });
                                        Sfdc.canvas.parent.subscribe({
                                            name: "publisher.customActionMessage",
                                            onData: h
                                        })
                                    })
                                };
                                var createVFPublisherHandler = new Sfdc.CreateVFPublisherHandler;

                                function VisibilityWidget(c) {
                                    function h() {
                                        Sfdc.Dom.hideByDisplay(g());
                                        Sfdc.Event.fireEvent(g(), "visibilitybox:oncollapse", g());
                                        k = !1;
                                        Sfdc.un(document.body, "click", n)
                                    }

                                    function n(a) {
                                        (a = Sfdc.Event.getEventTarget(a)) && (Sfdc.Dom.getParent(a, ".visibilityWidgetParent") || h())
                                    }

                                    function g() {
                                        if (!e) {
                                            var a = Sfdc.Dom.getParent(c.icon, ".visibilityWidgetParent"), a = Sfdc.Dom.create(a);
                                            Sfdc.Dom.addClass(a, [r, "zen-sideNorth", "zen-arrowCenter", "zen-callout"]);
                                            var b = Sfdc.Dom.create(a, {}, "b");
                                            Sfdc.Dom.addClass(b, ["zen-arrow", "vis-arrow"]);
                                            b = Sfdc.Dom.create(a);
                                            Sfdc.Dom.addClass(b, "zen-inner");
                                            var d = Sfdc.Dom.create(b);
                                            Sfdc.Dom.addClass(d, [q, "zen-body"]);
                                            b = Sfdc.Dom.create(b);
                                            Sfdc.Dom.addClass(b, "visibilityFooter");
                                            b = Sfdc.Dom.create(b, {
                                                href: s
                                            }, "a");
                                            Sfdc.Dom.addClass(b, "visibilitylearnmorelink");
                                            Sfdc.Dom.setText(b, LC.getLabel("ChatterVisibility", "LearnMore"));
                                            Sfdc.on(b, "keydown", t);
                                            e = a;
                                            Sfdc.on(c.icon, "keydown", u);
                                            Sfdc.on(document.body, "click", n);
                                            Sfdc.isFunction(c.onexpand) && Sfdc.Event.add(e, "visibilitybox:onexpand", c.onexpand);
                                            Sfdc.isFunction(c.oncollapse) && Sfdc.Event.add(e, "visibilitybox:oncollapse", c.oncollapse)
                                        }
                                        return e
                                    }

                                    function u(a) {
                                        a = window.event || a;
                                        a.shiftKey && 9 === a.keyCode && h()
                                    }

                                    function t(a) {
                                        a = window.event || a;
                                        a.shiftKey && 9 == a.keyCode || 9 === a.keyCode && h()
                                    }
                                    var l = this;
                                    l.disabled = !1;
                                    var r = "visibilityHelpContainer", q = "visibilityHelpBody", k = !1, e, p, m = [], s = c.helpUrl;
                                    this.hideVisibilityBox = function () {
                                        k && h()
                                    };
                                    this.registerHandler = function (a) {
                                        m[m.length] = a
                                    };
                                    this.toggleDisplay = function () {
                                        if (!k && !l.disabled) {
                                            var a = Sfdc.Dom.create(null, {}, "ul"), b;
                                            b = [];
                                            for (var d, c = 0; c < m.length; c++) d = m[c], d = d(), Sfdc.isArray(d) && (b = b.concat(d));
                                            for (c = 0; c < b.length; c++) {
                                                d = b[c];
                                                var f = Sfdc.Dom.create(a, {}, "li");
                                                Sfdc.Dom.addClass(f, "visibilityMessage");
                                                if (d.HTML) Sfdc.Dom.addClass(f, "visibilityCustomHTMLMsg"), Sfdc.Dom.updateHTML(f, d.HTML);
                                                else {
                                                    var e = Sfdc.Dom.create(f, {}, "h3");
                                                    Sfdc.Dom.insertHTML(e, d.title);
                                                    Sfdc.Dom.addClass(e, "visibilityMessageTitle");
                                                    f = Sfdc.Dom.create(f);
                                                    Sfdc.Dom.addClass(f, "visibilityMsgAnchor");
                                                    Sfdc.Dom.insertHTML(f, d.text)
                                                }
                                            }
                                            p || (p = Sfdc.get("." + q, g()));
                                            b = p;
                                            Sfdc.Dom.updateHTML(b, "");
                                            b.appendChild(a);
                                            Sfdc.Event.fireEvent(g(), "visibilitybox:onexpand", g());
                                            Sfdc.Dom.show(g());
                                            k = !0;
                                            Sfdc.on(document.body, "click", n)
                                        } else h()
                                    };
                                    this.disableWidget = function () {
                                        l.disabled = !0;
                                        Sfdc.Dom.addClass(c.icon, "disable")
                                    };
                                    this.enableWidget = function () {
                                        l.disabled = !1;
                                        Sfdc.Dom.removeClass(c.icon, "disable")
                                    }
                                };

                                function VideoPreview(g, h, m, d) {
                                    var k = m.replace("{0}", window.location.protocol);
                                    this.getVideoLinkTitle = function () {
                                        return d
                                    };
                                    this.getVideoUrl = function () {
                                        return k
                                    };
                                    this.getContainerId = function () {
                                        return g
                                    };
                                    this.getVideoId = function () {
                                        return h
                                    };
                                    this.getInlinePlayerUrl = function () {
                                        return window.location.protocol + "//www.youtube.com/embed/" + h + "?version\x3d3\x26autoplay\x3d1\x26rel\x3d0\x26fs\x3d1\x26autohide\x3d1\x26wmode\x3dtransparent\x26enablejsapi\x3d0"
                                    }
                                }

                                function YoutubeVideo() {
                                    function g(a) {
                                        var b = a.getVideoUrl();
                                        Sfdc.Ajax.crossDomainRequest(b, function (c) {
                                            if (c = Sfdc.JSON.parseSafe(c)) {
                                                var b = a.getContainerId(), l = c.error;
                                                if (b = Ext.get(b)) {
                                                    if (!l && (b && c.data) && c.data.thumbnail) {
                                                        var f, d;
                                                        if (c.data.title && (f = a.getVideoLinkTitle(), d = b.child(".linkPostLinkTitleText").dom.innerHTML, "www.youtube.com" === f || "youtu.be" === f)) d = f = c.data.title;
                                                        k[b.parent().id] = a.getInlinePlayerUrl();
                                                        var l = m(c.data.duration), g = b.child(".linkPostLink").dom.href;
                                                        b.dom.innerHTML = h(c.data.thumbnail.sqDefault.replace("http", "https"), l, "www.youtube.com", "chatter.getYoutubeVideo().expandInlinePlayer(this);", f, d, g)
                                                    }
                                                    b.setDisplayed("block")
                                                }
                                            }
                                        }, {})
                                    }

                                    function h(a, b, c, e, d, f, g) {
                                        return q.replace("{2}", b).replace("{3}", c).replace("{6}", f).replace("{7}", d).replace("{9}", g).replace("{5}", e).replace("{4}", e).replace("{8}", d).replace("{0}", a)
                                    }

                                    function m(a) {
                                        if (a) {
                                            var b = parseInt(a / 60);
                                            a = parseInt(a % 60);
                                            var c;
                                            1 > b && (b = "00");
                                            10 > a && (a = "0" + a);
                                            return 60 < b ? (c = parseInt(b / 60), b = parseInt(b % 60), LC.getLabel("Feeds", "lengthLong", c, b, a)) : LC.getLabel("Feeds", "lengthShort", b, a)
                                        }
                                        return ""
                                    }
                                    var d = [],
        k = [],
        n = !1,
        p = !0,
        q = '\x3cdiv class\x3d"videoImages"\x3e\x3cimg src\x3d"{0}" alt\x3d"{8}" class\x3d"thumbnail" onclick\x3d"{4}" title\x3d""\x3e\x3cspan class\x3d"play" onclick\x3d"{5}"\x3e\x3c/span\x3e\x3c/div\x3e\x3cdiv class\x3d"videoLinkMetaClass"\x3e\x3cdiv class\x3d"videoLinkPostTitle"\x3e\x3ca href\x3d"{9}" title\x3d"{7}" target\x3d"_blank"\x3e{6}\x3c/a\x3e\x3c/div\x3e\x3cdiv class\x3d"videoLinkDescription"\x3e{3}\x3c/div\x3e\x3cdiv class\x3d"videoLinkLengthClass"\x3e{2}\x3c/div\x3e\x3c/div\x3e\x3cdiv class\x3d"clear"\x3e\x3c/div\x3e';
                                    chatter.getEventBus().addEventListener("UIComponent:OverlayDialog", "onBeforeOverlayShow", function () {
                                        Ext.select(".videoLinkPostOuterContainer \x3e iframe").remove();
                                        Ext.select(".videoLinkPostContainer").setDisplayed("block")
                                    });
                                    this.testInlinePlayer = function (a) {
                                        a = Ext.get(a).parent().parent();
                                        var b = a.parent().id;
                                        a.setVisibilityMode(Ext.Element.DISPLAY);
                                        a.hide();
                                        Ext.DomHelper.append(b, {
                                            tag: "iframe",
                                            width: "420px",
                                            height: "300px",
                                            src: "",
                                            name: "youtubePlayer",
                                            frameborder: "0"
                                        })
                                    };
                                    this.setTestMode = function (a) {
                                        n = a
                                    };
                                    this.isRenderTypeVideoLinkPost = function (a) {
                                        p = a
                                    };
                                    this.onPageLoaded = function () {
                                        Ext.EventManager.onDocumentReady(function () {
                                            chatter.getYoutubeVideo().fetchVideoPreviews()
                                        }, null, null)
                                    };
                                    this.fetchVideoPreviews = function () {
                                        for (var a = d.length, b = 0; b < a; b++) {
                                            var c = d.shift();
                                            if (n) {
                                                var e = c, c = Ext.get(e.getContainerId());
                                                if (p) {
                                                    k[c.parent().id] = "";
                                                    var l = m("10000"), e = e.getVideoLinkTitle(), f = c.child(".linkPostLinkTitleText").dom.innerHTML;
                                                    if ("www.youtube.com" === e || "youtu.be" === e) f = e = "user did not enter url name";
                                                    c.dom.innerHTML = h(null, l, "www.youtube.com", "chatter.getYoutubeVideo().testInlinePlayer(this);", e, f, "www.youtube.com")
                                                }
                                            } else g(c)
                                        }
                                    };
                                    this.appendToQueue = function (a) {
                                        d.push(a)
                                    };
                                    this.expandInlinePlayer = function (a) {
                                        a = Ext.get(a).parent().parent();
                                        var b = a.parent().id, c = k[b];
                                        a.setVisibilityMode(Ext.Element.DISPLAY);
                                        a.hide();
                                        Ext.DomHelper.append(b, {
                                            tag: "iframe",
                                            width: "420px",
                                            height: "300px",
                                            src: c,
                                            name: "youtubePlayer",
                                            frameborder: "0"
                                        })
                                    }
                                }
                                chatter.extend("YoutubeVideo", YoutubeVideo, null);
                                Sfdc.ns("Sfdc.SocialPostHandler");
                                Sfdc.SocialPostHandler = function () {
                                    this.registerFeedItemTypeHandler = function (c, n) {
                                        chatter.getPublisher().registerFeedItemTypeHandler("SocialPostEvent", function () {
                                            function g(f) {
                                                var b = Sfdc.get("editPage__" + c), a = b.parentNode;
                                                Sfdc.Dom.removeChild(b);
                                                Sfdc.Dom.insertHTML(a, f.htmlForm);
                                                (b = Sfdc.get("editPage__" + c)) && Sfdc.Resource.execScripts(Sfdc.Resource.getScriptsFromHtml(b));
                                                window.picklist && (picklist.initialized = !1, picklist.initAll());
                                                SfdcCmp.init(Sfdc.get(".socialPubSenderContainer"))
                                            }
                                            var a = {
                                                config: {
                                                    omnitureEvent: "recordCreate",
                                                    urlMaxLen: 1E3,
                                                    urlNameMaxLen: 255,
                                                    disallowedLinkChars: /[\s\\]+/
                                                },
                                                state: {}
                                            };
                                            a.config.actionIdParam = c;
                                            a.config.formId = n;
                                            a.setupPanel = function () {
                                                Sfdc.onload(function () {
                                                    window.picklist && picklist.initAll()
                                                });
                                                var f = LC.getLabel("Publisher", "Create");
                                                a.config.submitValueAndTitle = {
                                                    value: f,
                                                    title: f
                                                }
                                            };
                                            a.clearPanelState = function () { };
                                            a.focusFirstElement = function () { };
                                            a.onShowPanel = function () {
                                                this.publisherCore.setIsExtensionValidForSubmit(!0);
                                                SfdcApp.social.publisher.onShowPanel(c)
                                            };
                                            a.onSuccess = function (f, b) {
                                                b.feedItemId && "undefined" === typeof entityFeedPage && chatter.getEventBus().fireEvent("chatter:publisher", "onAfterUpdateStatus", { json: b });
                                                var a = chatter.getPublisher().getHandler(c);
                                                g(b);
                                                a.publisherCore.enablePublisher()
                                            };
                                            a.onFailure = function (f, a) {
                                                var h = chatter.getPublisher().getHandler(c);
                                                a.errors ? h.publisherCore.showErrors(a.errors.message) : a.htmlForm ? g(a) : f.isTimeout ? h.publisherCore.showErrors(LC.getLabel("SocialPublisherSendingErrors", "Timeout")) : h.publisherCore.showErrors(LC.getLabel("SocialPublisherSendingErrors", "UnknownException"));
                                                h.publisherCore.enablePublisher()
                                            };
                                            a.getPayload = function (a) {
                                                a.actionIdParam = this.config.actionIdParam;
                                                for (var b = ["input", "select", "textarea"], c = document.getElementById(n), l = 0; l < b.length; l++)
                                                    for (var e = c.getElementsByTagName(b[l]), d = 0; d < e.length; d++)
                                                        if ("checkbox" != e[d].getAttribute("type") || e[d].checked)
                                                            if ("SELECT" == e[d].tagName) {
                                                                for (var g = [], m = e[d].options, k = 0; k < m.length; k++) m[k].selected && g.push(m[k].value);
                                                                a[e[d].name] = g
                                                            } else a[e[d].name] = e[d].value;
                                                a.save_new = "Saving...";
                                                return a
                                            };
                                            a.postWithCustomFunction = function (a) {
                                                a = {
                                                    url: "/quickcreate/social",
                                                    params: a,
                                                    failure: this.onFailure,
                                                    success: this.onSuccess
                                                };
                                                "undefined" !== typeof entityFeedPage ? entityFeedPage.postObjectUpdate(chatter.getFeed().getConfig().subjectId, a) : chatter.getToolbox().post(a)
                                            };
                                            return a
                                        } (), c)
                                    }
                                };
                                var socialPostHandler = new Sfdc.SocialPostHandler;
                                Sfdc.ns("Sfdc.AccessibleFileSharedWithListDialog");
                                Sfdc.AccessibleFileSharedWithListDialog = function (a) {
                                    Sfdc.BaseAccessibleFileListDialog.call(this, a);
                                    this.id = a.id;
                                    this.title = unescape(a.title);
                                    this.dataLoadUrl = a.dataLoadUrl;
                                    this.docId = a.docId;
                                    this.height = a.height;
                                    this.sharedWithEntityType = a[EntitySharingConstants.SHAREDWITH_PARAM];
                                    this.areSharingTypesUpdatable = !1;
                                    this.fileOwnerID = "";
                                    this.ghostMsg = LC.getLabel("ChatterFileSharing", "optionalMsgGhostText");
                                    this.fileTitle = a.fileTitle
                                };
                                Ext.extend(Sfdc.AccessibleFileSharedWithListDialog, Sfdc.BaseAccessibleFileListDialog);
                                Sfdc.AccessibleFileSharedWithListDialog.ID = "chatterFileSharedWithListDialog";
                                Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID = "sharedWithInputBox";
                                Sfdc.AccessibleFileSharedWithListDialog.MaxSharedLimit = 100;
                                Sfdc.AccessibleFileSharedWithListDialog.MaxVisibleRowNumber = 3;
                                Sfdc.AccessibleFileSharedWithListDialog.MAX_SHAREDWITH_PEOPLE_COUNT = 9;
                                Sfdc.AccessibleFileSharedWithListDialog.MAX_SHAREDWITH_PEOPLE_MSG_ID = "maxSharedWithPeopleCntMsg";
                                Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_COLLABORATOR = "C";
                                Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_VIEWER = "V";
                                Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_INFERRED = "I";
                                Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_NOACCESS = "N";
                                Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX = "0F9";
                                Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX_MATCH = "^0F9";
                                Sfdc.AccessibleFileSharedWithListDialog.sharingRowCounter = 0;
                                Sfdc.AccessibleFileSharedWithListDialog.MYENTITY_PREFIX_MATCH = "0U0";
                                Sfdc.AccessibleFileSharedWithListDialog.areSharingTypesUpdatable = !1;
                                Sfdc.AccessibleFileSharedWithListDialog.chatterMessagesPerm = !1;
                                Sfdc.AccessibleFileSharedWithListDialog.isPrivateFile = !1;
                                Sfdc.AccessibleFileSharedWithListDialog.MAX_COMPANY_NAME_LENGTH = 10;
                                Sfdc.AccessibleFileSharedWithListDialog.ENTITY_TYPE_ORGANIZATION = "c";
                                Sfdc.AccessibleFileSharedWithListDialog.shareWithButtonLocked = !1;
                                Sfdc.AccessibleFileSharedWithListDialog.NOTIFICATION_EMAIL_PANEL_ID = "notificationEmailPanelTextArea";
                                Sfdc.AccessibleFileSharedWithListDialog.GROUP_STATUS_PUBLIC = "public";
                                Sfdc.AccessibleFileSharedWithListDialog.GROUP_STATUS_PRIVATE = "private";
                                Sfdc.AccessibleFileSharedWithListDialog.isFileDetailPage = function () {
                                    return 0 < Sfdc.select("body.FileDetailPage").length
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.isChatterPageWithFeed = function () {
                                    return 0 < Sfdc.select("body.homepage").length || 0 < Sfdc.select("body.ChatterPage").length && 0 === Sfdc.select("div.chatterFileListView").length || 0 < Sfdc.select("body.UserProfilePage").length || 0 < Sfdc.select("body.GroupProfilePage").length
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showDialog = function (a) {
                                    Perf.mark(OverlayDialog.LOAD_MARK);
                                    var b = Sfdc.AccessibleFileSharedWithListDialog.ID, d = Sfdc.BaseAccessibleFileDialog.getDialogById(b);
                                    d ? (d.dataLoadUrl = a.dataLoadUrl, d.docId = a.docId, d.setTitle(a.title), d.fileTitle = a.fileTitle, d.sharedWithEntityType = a[EntitySharingConstants.SHAREDWITH_PARAM]) : (d = {
                                        id: b,
                                        title: a.title,
                                        dataLoadUrl: a.dataLoadUrl,
                                        fileTitle: a.fileTitle,
                                        docId: a.docId,
                                        height: 600
                                    }, d[EntitySharingConstants.SHAREDWITH_PARAM] = a[EntitySharingConstants.SHAREDWITH_PARAM], d = new Sfdc.AccessibleFileSharedWithListDialog(d), d.width = 650, d.register());
                                    d.callback = a.callback;
                                    d.syncUpMainPage = !1;
                                    d.refreshMainPage = !1;
                                    b = {};
                                    a[EntitySharingConstants.SHAREDWITH_PARAM] && (b[EntitySharingConstants.SHAREDWITH_PARAM] = a[EntitySharingConstants.SHAREDWITH_PARAM]);
                                    a[EntitySharingConstants.SHARE_OPTION_PARAM_NAME] && (b[EntitySharingConstants.SHARE_OPTION_PARAM_NAME] = a[EntitySharingConstants.SHARE_OPTION_PARAM_NAME]);
                                    d.open(b)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.prototype.cancel = function () {
                                    Sfdc.AccessibleFileSharedWithListDialog.closeACList();
                                    Sfdc.AccessibleFileSharedWithListDialog.superclass.cancel.call(this)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList = function (a, b, d) {
                                    a = Sfdc.AccessibleFileSharedWithListDialog.getFileTitle(a);
                                    var c = null !== a ? LC.getLabel("ChatterFileSharing", "sharingSettingWithFileTitle", a) : LC.getLabel("ChatterFileSharing", "sharingSetting");
                                    Sfdc.AccessibleFileSharedWithListDialog.closeACList();
                                    Sfdc.AccessibleFileSharedWithListDialog.showDialog({
                                        title: chatter.getToolbox().htmlEncode(c),
                                        docId: b,
                                        fileTitle: a,
                                        dataLoadUrl: d ? d : "/file/sharedwithlist/"
                                    })
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showSharedWithPeople = function (a, b, d, c, f, e) {
                                    this.fileOwnerID = d;
                                    b = Sfdc.AccessibleFileSharedWithListDialog.getFileTitle(b);
                                    d = null !== b ? LC.getLabel("ChatterFileSharing", "shareWithPeopleWithFileTitle", b) : LC.getLabel("ChatterFileSharing", "shareWithPeople");
                                    e && (d = LC.getLabel("ChatterFileSharing", "shareInScope", d, e));
                                    Sfdc.AccessibleFileSharedWithListDialog.showSharedWithWizard(d, a, b, EntitySharingConstants.SHAREDWITH_PEOPLE, c, f)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showSharedWithGroups = function (a, b, d, c, f, e) {
                                    this.fileOwnerID = d;
                                    b = Sfdc.AccessibleFileSharedWithListDialog.getFileTitle(b);
                                    d = null !== b ? LC.getLabel("ChatterFileSharing", "shareWithGroupsWithFileTitle", b) : LC.getLabel("ChatterFileSharing", "shareWithGroups");
                                    e && (d = LC.getLabel("ChatterFileSharing", "shareInScope", d, e));
                                    Sfdc.AccessibleFileSharedWithListDialog.showSharedWithWizard(d, a, b, EntitySharingConstants.SHAREDWITH_GROUPS, c, f)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showSharedWithCompany = function (a, b, d, c, f) {
                                    this.fileOwnerID = d;
                                    b = Sfdc.AccessibleFileSharedWithListDialog.getFileTitle(b);
                                    d = null !== b ? LC.getLabel("ChatterFileSharing", "shareWithCompanyWithFileTitle", b) : LC.getLabel("ChatterFileSharing", "shareWithCompany");
                                    Sfdc.AccessibleFileSharedWithListDialog.showSharedWithWizard(d, a, b, EntitySharingConstants.SHAREDWITH_COMPANY, c, f)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.getFileTitle = function (a) {
                                    return null
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showSharedWithWizard = function (a, b, d, c, f, e) {
                                    this.areSharingTypesUpdatable = Sfdc.AccessibleFileSharedWithListDialog.areSharingTypesUpdatable;
                                    a = {
                                        title: chatter.getToolbox().htmlEncode(a),
                                        docId: b,
                                        fileTitle: d,
                                        dataLoadUrl: f ? f : "/file/sharedwithwizard/",
                                        callback: Sfdc.AccessibleFileSharedWithListDialog.callBack
                                    };
                                    a[EntitySharingConstants.SHAREDWITH_PARAM] = c;
                                    e && (a[EntitySharingConstants.SHARE_OPTION_PARAM_NAME] = e);
                                    Sfdc.AccessibleFileSharedWithListDialog.showDialog(a)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.clearInputText = function () {
                                    var a = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID);
                                    a.blur();
                                    Sfdc.Dom.set(a, "value", "");
                                    a.focus()
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.getOptionalMessageLength = function (a) {
                                    return a && a === EntitySharingConstants.SHAREDWITH_GROUPS ? 1E3 : 255
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.wireACBox = function (a, b) {
                                    var d = a && a === EntitySharingConstants.SHAREDWITH_GROUPS ? UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP : UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER;
                                    new UserAndGroupAutoCompleteInputElement({
                                        servletURI: b,
                                        elementId: Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID,
                                        inDialog: !0,
                                        entityType: d,
                                        fixedACYPosition: 0,
                                        zIndex: 80200,
                                        handleSelect: function (a) {
                                            var b = Sfdc.AccessibleFileSharedWithListDialog.hasEntityRow() ? !1 : !0;
                                            !Sfdc.AccessibleFileSharedWithListDialog.isNumberOfRowOverLimit() &&
                !Sfdc.AccessibleFileSharedWithListDialog.isRowExist(a.itemId) && Sfdc.AccessibleFileSharedWithListDialog.addEntityRow({
                    itemID: a.itemId,
                    itemName: a.itemName,
                    itemTitle: a.itemTitle,
                    itemPhoto: a.imageLink,
                    entityType: d,
                    badgeHtml: a.badgeHtml,
                    imageHtml: a.imageHtml,
                    itemPrivacy: a.itemPrivacy
                });
                                            this.select(a.rowIndex);
                                            this.complete();
                                            a = Sfdc.select(".overlayScrollList");
                                            0 < a.length && (a[0].scrollTop += 50);
                                            a = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID);
                                            d === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP ? (this.allowHideAC = !0, a.blur(), this.displayGhostText(), Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.NOTIFICATION_EMAIL_PANEL_ID).focus()) : (this.allowHideAC = !0, b ? (a.blur(), this.displayGhostText(), (b = Sfdc.select(".sharingOptionRadio")) && 0 < b.length && b[b.length - 1].focus()) : UserAndGroupAutoCompleteInputElement.needDefer() ? Sfdc.AccessibleFileSharedWithListDialog.clearInputText.defer(100) : Sfdc.AccessibleFileSharedWithListDialog.clearInputText())
                                        },
                                        handleBlur: function () {
                                            this.clearSuggestions();
                                            this.displayGhostText()
                                        },
                                        handleFocusExtra: function () {
                                            if (Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem().rows.length >= Sfdc.AccessibleFileSharedWithListDialog.MaxVisibleRowNumber) {
                                                var a = Sfdc.select(".overlayScrollList");
                                                0 < a.length && (a[0].scrollTop = a[0].scrollHeight)
                                            }
                                        },
                                        getACYPosition: function (a) {
                                            if (Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem().rows.length <= Sfdc.AccessibleFileSharedWithListDialog.MaxVisibleRowNumber - 1) this.fixedACYPosition = AutoCompleteInputElement.prototype.getACYPosition(a);
                                            else {
                                                var b = Sfdc.select(".overlayScrollList"), d = 0;
                                                0 < b.length && (d = b[0].scrollHeight - b[0].offsetHeight + 3);
                                                this.fixedACYPosition = AutoCompleteInputElement.prototype.getACYPosition(a) - d
                                            }
                                            return this.fixedACYPosition
                                        }
                                    });
                                    Sfdc.get("shareHelpLinkElement").focus();
                                    addEvent(document.body, "keydown", function (a) {
                                        getEvent(a).keyCode == KEY_ESC && Sfdc.AccessibleFileSharedWithListDialog.closeACList()
                                    })
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.callBack = function (a, b) {
                                    Sfdc.AccessibleFileSharedWithListDialog.areSharingTypesUpdatable = "true" === b.areSharingTypesUpdatable ? !0 : !1;
                                    Sfdc.AccessibleFileSharedWithListDialog.chatterMessagesPerm = "true" === b.chatterMessagesPerm ? !0 : !1;
                                    Sfdc.AccessibleFileSharedWithListDialog.isPrivateFile = "true" === b.isPrivateFile ? !0 : !1;
                                    Sfdc.AccessibleFileSharedWithListDialog.CurrentEntities = {};
                                    var d = b.sharedWithType === EntitySharingConstants.SHAREDWITH_COMPANY;
                                    if (d) {
                                        var c = b.orgId;
                                        if (!c) {
                                            alert(LC.getLabel("Feeds", "GenericFailureNoGack"));
                                            return
                                        }
                                        Sfdc.Dom.addClass(Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID), "hidden");
                                        Sfdc.AccessibleFileSharedWithListDialog.areSharingTypesUpdatable ? LC.getLabel("ChatterFileSharing", "collaborator") : LC.getLabel("ChatterFileSharing", "viewer");
                                        Sfdc.AccessibleFileSharedWithListDialog.addEntityRow({
                                            itemID: c,
                                            itemName: LC.getLabel("ChatterFileSharing", "shareWithCompanyLabel"),
                                            itemTitle: "",
                                            itemPhoto: "/img/chatterfiles/sharewithcompany32x32.png",
                                            entityType: Sfdc.AccessibleFileSharedWithListDialog.ENTITY_TYPE_ORGANIZATION,
                                            badgeHtml: ""
                                        });
                                        var c = Sfdc.get("selectedPeopleToShareList"), f = Sfdc.get(".overlayListLink", c);
                                        Sfdc.Dom.hideByDisplay(f);
                                        Sfdc.AccessibleFileSharedWithListDialog.areSharingTypesUpdatable ? (c.child(".shortSharedWithName").dom.setAttribute("title", ""), c.child(".shortSharedWithName").removeClass("shortSharedWithName"), c.child(".displayNameWidthWithViewCollaborator").removeClass("displayNameWidthWithViewCollaborator")) : (c.child(".longSharedWithName").dom.setAttribute("title", ""), c.child(".longSharedWithName").removeClass("longSharedWithName"));
                                        Sfdc.Dom.setText(Sfdc.get("sendEmailOptionLabel"), LC.getLabel("ChatterFileSharing", "shareWithCompanyMessageLabel"));
                                        c.addClass("noBottomBorder")
                                    } else c = "/myentity/" == a.substr(0, 10) ? "/chatter/handlers/myentity/shareAutoComplete" : "/chatter/handlers/file/shareAutoComplete", Sfdc.AccessibleFileSharedWithListDialog.wireACBox(this.sharedWithEntityType, c);
                                    var e = Ext.fly(this.id).child(".optionalMsg"), g = this;
                                    if (e) {
                                        var h = chatter.getToolbox(), k = Sfdc.AccessibleFileSharedWithListDialog.getOptionalMessageLength(this.sharedWithEntityType), l = h.getElementErrorContainer(e);
                                        h.updateHTML(l, "");
                                        var m = LC.getLabel("Publisher", "postValueMaxLen", k);
                                        e.on("focus", function () {
                                            e.dom.value == g.ghostMsg && (e.dom.value = "", e.removeClass("optionalMsgGhostText"))
                                        });
                                        e.on("blur", function () {
                                            "" === e.dom.value && (e.addClass("optionalMsgGhostText"), e.dom.value = g.ghostMsg)
                                        });
                                        e.on("keyup", function () {
                                            var a = h.stringTrim(e.getValue()).length, b = h.validateElement(l, function () {
                                                return a <= k
                                            }, m) && Sfdc.AccessibleFileSharedWithListDialog.hasEntityRow();
                                            Sfdc.AccessibleFileSharedWithListDialog.toggleShareWithButton(b)
                                        })
                                    }
                                    if (d) {
                                        e.setVisibilityMode(Ext.Element.DISPLAY).hide();
                                        var n = Sfdc.get(".sendEmailOption", Sfdc.get(this.id));
                                        Sfdc.Dom.removeClass(n, "hidden");
                                        if (n) Sfdc.on(n, "click", function () {
                                            e && (n.checked ? e.setVisibilityMode(Ext.Element.DISPLAY).show() : e.setVisibilityMode(Ext.Element.DISPLAY).hide())
                                        })
                                    }
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.toggleShareWithButton = function (a, b) {
                                    if ("undefined" == typeof b) {
                                        if (!0 === Sfdc.AccessibleFileSharedWithListDialog.shareWithButtonLocked) return
                                    } else Sfdc.AccessibleFileSharedWithListDialog.shareWithButtonLocked = b;
                                    var d = Sfdc.get("fileSharedWithBtn"), c = chatter.getToolbox();
                                    a ? c.enableButton(d) : c.disableButton(d)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.closeDialog = function () {
                                    var a = Sfdc.BaseAccessibleFileDialog.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID);
                                    a && a.closeDialog()
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.nextPage = function (a, b, d) {
                                    (a = sfdcPage.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID)) && a.loadList({
                                        p: d + 1
                                    })
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.prevPage = function (a, b, d) {
                                    (a = sfdcPage.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID)) && a.loadList({
                                        p: d - 1
                                    })
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.getEntityTypeForId = function (a) {
                                    return a.substr(0, Sfdc.AccessibleFileSharedWithListDialog.MYENTITY_PREFIX_MATCH.length) == Sfdc.AccessibleFileSharedWithListDialog.MYENTITY_PREFIX_MATCH ? "myentity" : "file"
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.shareWithEntity = function (a, b, d) {
                                    var c = LC.getLabel("ChatterFileSharing", "sharingSetting", a);
                                    a = chatter.getToolbox();
                                    Sfdc.AccessibleFileSharedWithListDialog.toggleShareWithButton(!1, !0);
                                    var f = "/" + Sfdc.AccessibleFileSharedWithListDialog.getEntityTypeForId(b) + "/sharedwithwizard/" + b + ";create", e = Sfdc.BaseAccessibleFileDialog.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID), g = Sfdc.get(".optionalMsg", Sfdc.get(e.id));
                                    g && a.stringTrim(g.value) == e.ghostMsg && (g.value = "");
                                    g = {};
                                    d && (g[EntitySharingConstants.SHAREDWITH_PARAM] = d);
                                    a.post({
                                        url: f,
                                        params: g,
                                        form: "shareWithEntityForm",
                                        failure: function (a, b) {
                                            Sfdc.AccessibleFileSharedWithListDialog.toggleShareWithButton(!1, !1);
                                            b && !b.errormessage && alert(LC.getLabel("Feeds", "GenericFailureNoGack"))
                                        },
                                        success: function (a, d) {
                                            Sfdc.AccessibleFileSharedWithListDialog.toggleShareWithButton(!1, !1);
                                            try {
                                                e && (e.setTitle(c), e.updateContent(d)), e.syncUpMainPage = !0, Sfdc.AccessibleFileSharedWithListDialog.updateTitle(b, d.isPrivate)
                                            } catch (f) { }
                                        }
                                    })
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem = function () {
                                    return Sfdc.select(".overlayListTable")[0]
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.isNumberOfRowOverLimit = function () {
                                    return Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem()).rows.length >= Sfdc.AccessibleFileSharedWithListDialog.MaxSharedLimit ? !0 : !1
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.isRowExist = function (a) {
                                    return Sfdc.AccessibleFileSharedWithListDialog.CurrentEntities[a] ? !0 : !1
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.deleteEntityRow = function (a, b, d) {
                                    var c = Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem().rows.length;
                                    Sfdc.Dom.removeChild(Sfdc.Dom.getParent(a, "tr"));
                                    delete Sfdc.AccessibleFileSharedWithListDialog.CurrentEntities[b];
                                    Sfdc.AccessibleFileSharedWithListDialog.toggleShareWithButton(Sfdc.AccessibleFileSharedWithListDialog.hasEntityRow());
                                    c === Sfdc.AccessibleFileSharedWithListDialog.MaxVisibleRowNumber && Sfdc.Dom.removeClass(Sfdc.get(Sfdc.select(".overlayList")[0]), "overlayScrollList");
                                    Sfdc.AccessibleFileSharedWithListDialog.showHideExternalUserLabel();
                                    d === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP && Sfdc.AccessibleFileSharedWithListDialog.showHidePublicGroupWarningLabel();
                                    Sfdc.AccessibleFileSharedWithListDialog.chatterMessagesPerm && d === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER && c == Sfdc.AccessibleFileSharedWithListDialog.MAX_SHAREDWITH_PEOPLE_COUNT && Sfdc.AccessibleFileSharedWithListDialog.toggleMaxPeopleCountWarningMsg(!1)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.hasEntityRow = function () {
                                    return 0 < Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem()).rows.length
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.addEntityRow = function (a) {
                                    var b = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem()), d = b.rows.length, c = b.insertRow(d), f = "";
                                    0 < d && (f = " notFirstRow");
                                    var e = a.itemTitle, g = a.itemName, h = a.entityType, k = document.createElement("td");
                                    k.className = "overlayListPhoto" + f;
                                    k.setAttribute("valign", "top");
                                    k.innerHTML = a.imageHtml ? a.imageHtml : '\x3cimg width\x3d"32" height\x3d"32" title\x3d"' + g + " - " + e + '" class\x3d"followerIcon" alt\x3d"' + g + " - " + e + '" src\x3d"' + a.itemPhoto + '"\x3e';
                                    var l = [];
                                    l.push('\x3cspan title\x3d"' + g + '" class\x3d"' + (!0 === this.areSharingTypesUpdatable ? "shortSharedWithName" : "longSharedWithName") + '"\x3e');
                                    l.push(g);
                                    this.areSharingTypesUpdatable || l.push('\x3cinput type\x3d"hidden" name\x3d"' + EntitySharingConstants.ENTITY_ID + '" value\x3d"' + a.itemID + '"/\x3e');
                                    l.push("\x3c/span\x3e");
                                    l.push(a.badgeHtml);
                                    l.push("\x3cbr\x3e");
                                    l.push('\x3cspan title\x3d"' + e + '" class\x3d"titleSpan"\x3e' + e + "\x3c/span\x3e");
                                    g = l.join("");
                                    e = document.createElement("td");
                                    e.className = "overlayListName" + f;
                                    !0 === this.areSharingTypesUpdatable && (e.className += " displayNameWidthWithViewCollaborator");
                                    h === Sfdc.AccessibleFileSharedWithListDialog.ENTITY_TYPE_ORGANIZATION && (e.className += " displayNameWidthWithCompanyShare");
                                    e.setAttribute("valign", "top");
                                    e.innerHTML = g;
                                    g = document.createElement("td");
                                    g.className = "overlayListLink" + f;
                                    l = h === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP ? LC.getLabel("ChatterFileSharing", "removeGroup") : LC.getLabel("ChatterFileSharing", "removePerson");
                                    g.innerHTML = '\x3ca href\x3d"javascript:void(0);" onclick\x3d"Sfdc.AccessibleFileSharedWithListDialog.deleteEntityRow(this,\x26quot;' + a.itemID + "\x26quot;,\x26quot;" + h + '\x26quot);" title\x3d"' + l + '"\x3e\x3cimg alt\x3d"' + l + '" title\x3d"' + l + '" class\x3d"deleteIconClass" src\x3d"/s.gif"\x3e\x3c/a\x3e';
                                    c.appendChild(k);
                                    c.appendChild(e);
                                    c.appendChild(g);
                                    !0 === this.areSharingTypesUpdatable && (!0 === (a.itemID === this.fileOwnerID ? !0 : !1) ? (k = document.createElement("td"), k.className = "overlayListOwner" + f, f = document.createElement("span"),
        f.className = "overlayOwnerSpan", e = document.createTextNode(LC.getLabel("ChatterFileSharing", "alreadyOwner")), f.appendChild(e), e = document.createElement("input"), e.type = "hidden", e.name = EntitySharingConstants.SHARING_TYPE + Sfdc.AccessibleFileSharedWithListDialog.sharingRowCounter, e.value = a.itemID + ":" + Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_INFERRED, k.appendChild(f), k.appendChild(e), c.appendChild(k), k.setAttribute("colSpan", "2")) : (k = EntitySharingConstants.SHARING_TYPE + Sfdc.AccessibleFileSharedWithListDialog.sharingRowCounter,
        e = document.createElement("td"), e.className = "overlayListViewer" + f, g = document.createElement("td"), g.className = "overlayListCollaborator" + f, Sfdc.userAgent.isIE8 || Sfdc.userAgent.isIE7 ? (f = document.createElement('\x3cinput type\x3d"radio" name\x3d"' + k + '"\x3e'), l = document.createElement('\x3cinput type\x3d"radio" name\x3d"' + k + '"\x3e')) : (f = document.createElement("input"), f.type = "radio", f.name = k, l = document.createElement("input"), l.type = "radio", l.name = k), f.className = "sharingOptionRadio", f.value = a.itemID + ":" +
        Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_VIEWER, e.appendChild(f), l.className = "sharingOptionRadio", l.value = a.itemID + ":" + Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_COLLABORATOR, g.appendChild(l), c.appendChild(e), c.appendChild(g), h === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP ? a.itemPrivacy && a.itemPrivacy === Sfdc.AccessibleFileSharedWithListDialog.GROUP_STATUS_PRIVATE ? l.checked = !0 : f.checked = !0 : h === Sfdc.AccessibleFileSharedWithListDialog.ENTITY_TYPE_ORGANIZATION ? f.checked = !0 : l.checked = !0));
                                    Sfdc.AccessibleFileSharedWithListDialog.CurrentEntities[a.itemID] = a;
                                    Sfdc.get("selectedPeopleToShareList").scrollTop += 50;
                                    Sfdc.AccessibleFileSharedWithListDialog.toggleShareWithButton(!0);
                                    d === Sfdc.AccessibleFileSharedWithListDialog.MaxVisibleRowNumber - 1 && Sfdc.Dom.addClass(Sfdc.get(Sfdc.select(".overlayList")[0]), "overlayScrollList");
                                    Sfdc.AccessibleFileSharedWithListDialog.sharingRowCounter++;
                                    Sfdc.AccessibleFileSharedWithListDialog.showHideExternalUserLabel();
                                    h === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_GROUP && !0 === Sfdc.AccessibleFileSharedWithListDialog.isPrivateFile && Sfdc.AccessibleFileSharedWithListDialog.showHidePublicGroupWarningLabel();
                                    Sfdc.AccessibleFileSharedWithListDialog.chatterMessagesPerm && h === UserAndGroupAutoCompleteInputElement.ENTITY_TYPE_USER && (d = b.rows.length, d == Sfdc.AccessibleFileSharedWithListDialog.MAX_SHAREDWITH_PEOPLE_COUNT && Sfdc.AccessibleFileSharedWithListDialog.toggleMaxPeopleCountWarningMsg(!0))
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.toggleMaxPeopleCountWarningMsg = function (a) {
                                    var b = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.MAX_SHAREDWITH_PEOPLE_MSG_ID);
                                    b || (b = document.createElement("div"), b.id = Sfdc.AccessibleFileSharedWithListDialog.MAX_SHAREDWITH_PEOPLE_MSG_ID, b.className = "maxSharedWithPeopleCntMsg", b.innerHTML = LC.getLabel("ChatterFileSharing", "maxSharedWithPeopleCntMsg"), Sfdc.get("selectedPeopleToShareList").parentNode.appendChild(b), b = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.MAX_SHAREDWITH_PEOPLE_MSG_ID));
                                    a ? (Sfdc.Dom.addClass(Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID), "hidden"), Sfdc.Dom.removeClass(b, "hidden")) : (Sfdc.Dom.removeClass(Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID), "hidden"), Sfdc.Dom.addClass(b, "hidden"))
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showHideExternalUserLabel = function () {
                                    for (var a = !1, b = Sfdc.select("span[class\x3dchatterUserGuestBadge]", Sfdc.get("selectedPeopleToShareList")), d = 0; d < b.length; d++)
                                        if (b[d].innerHTML) {
                                            var c = b[d].innerHTML;
                                            if (0 <= c.indexOf(LC.getLabel("ChatterExternal", "withGuests")) || 0 <= c.indexOf(LC.getLabel("ChatterExternal", "privateWithGuests"))) {
                                                a = !0;
                                                break
                                            }
                                        }
                                    a ? Sfdc.Dom.removeClass(Sfdc.get("shareWithPeopleListHeader"), "hidden") : Sfdc.Dom.addClass(Sfdc.get("shareWithPeopleListHeader"), "hidden")
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showHidePublicGroupWarningLabel = function () {
                                    var a = !1, b = Sfdc.get("selectedPeopleToShareList"), d = Sfdc.select("img.chatter-photo", b), b = Sfdc.select(".chatter-privateIcon", b);
                                    d.length > b.length && (a = !0);
                                    a ? (Sfdc.Dom.addClass(Sfdc.get("defaultWallPostLabel"), "hidden"), Sfdc.Dom.removeClass(Sfdc.get("publicWallPostLabel"), "hidden")) : (Sfdc.Dom.removeClass(Sfdc.get("defaultWallPostLabel"), "hidden"), Sfdc.Dom.addClass(Sfdc.get("publicWallPostLabel"), "hidden"))
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.prototype.show = function () {
                                    Sfdc.BaseAccessibleFileDialog.prototype.show.call(this);
                                    this.dialog.style.top = getScrollTop() + this.dialog.offsetTop + "px";
                                    Sfdc.userAgent.isChrome && window.scrollBy(0, 1)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.closeNoGroupMembershipOverlay = function (a, b, d) {
                                    var c = location.href;
                                    0 < c.indexOf("\x26so\x3dgrp") || 0 < c.indexOf("?so\x3dgrp") ? Sfdc.BaseAccessibleFileListDialog.closeDialog("chatterFileSharedWithListDialog") : (Sfdc.BaseAccessibleFileListDialog.closeDialog("chatterFileSharedWithListDialog"), Sfdc.AccessibleFileSharedWithListDialog.showSharedWithList(a, b, d))
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.prototype.hook_cancel = function () {
                                    var a = Sfdc.BaseAccessibleFileDialog.getDialogById(this.id);
                                    if (a && (!0 === a.refreshMainPage || !0 === a.syncUpMainPage)) {
                                        var b = Sfdc.AccessibleFileSharedWithListDialog.isFileDetailPage(), d = Sfdc.AccessibleFileSharedWithListDialog.isChatterPageWithFeed();
                                        if (!0 === a.refreshMainPage || !0 === b || !0 === d) {
                                            var a = location.href, c;
                                            if (0 < (b = a.indexOf("?fa\x3d")) || 0 < (b = a.indexOf("?so\x3d"))) a = 0 < (c = a.indexOf("\x26", b + 4)) ? 0 < a.indexOf("?fa\x3d") ? a.substr(0,b + 1) + a.substr(c + 1) : a.substr(0, b) + a.substr(c) : a.substr(0, b);
                                            navigateToUrl(a)
                                        } else Sfdc.ChatterFileFeedActions.resetDocUpload(a.docId)
                                    }
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.PERM_DROPDOWN_ID = "permissionDropdown";
                                Sfdc.FileSharedWithPermissionDropdown = function (a, b) {
                                    Sfdc.DropdownPanel.call(this, a, b)
                                };
                                Ext.extend(Sfdc.FileSharedWithPermissionDropdown, Sfdc.DropdownPanel);
                                Sfdc.FileSharedWithPermissionDropdown.prototype.initCustomEvents = function () {
                                    var a = this;
                                    addEvent(document.getElementById("sharedWithListScrollPanel"), "scroll", function () {
                                        a.close()
                                    })
                                };
                                Sfdc.FileSharedWithPermissionDropdown.prototype.getXY = function (a) {
                                    var b = document.getElementById("sharedWithListScrollPanel"), d = 0, c = 0;
                                    Sfdc.userAgent.isIE8 ? (d = 9, c = -1) : Sfdc.userAgent.isIE7 && (d = 10, c = 0);
                                    return {
                                        x: a.x - 14 + c,
                                        y: a.y - b.scrollTop + d
                                    }
                                };
                                Sfdc.FileSharedWithPermissionDropdown.prototype.getContent = function (a) {
                                    var b = a.docId,        d = a.sharedWithId,        c = a.sharedFileOwnerId,        f = a.isAdmin,        e = a.shareId,        g = a.isChatterFile,        h = a.fileTitle,        k = a.sharedWithName,        l = a.isSharedWithPublicGroup;
                                    a = a.useStopLinkShareLabel;
                                    var m = [];
                                    m.push('\x3cdiv class\x3d"permissionLabelPanel"\x3e\x3ca onclick\x3d"Sfdc.AccessibleFileSharedWithListDialog.closePermissionDropdown(); return false;" href\x3d"javascript:void(0);"\x3e' + this.anchorElem.innerHTML + "\x3c/a\x3e\x3c/div\x3e");
                                    var n = Sfdc.get("sharingOptionJSONStr" + d), p, s = [];
                                    if (n)
                                        for (var q = Sfdc.JSON.parse(n.innerHTML), n = q[EntitySharingConstants.SHARING_CURRENT_TYPE], r = 0; r < q.sharingOption.length; r++) {
                                            var k = q.sharingOption[r],                t = k.sharingType,                u = k.label;
                                            t[0] === Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_NOACCESS ? (k = LC.getLabel("ChatterFileSharing", "inYourCompanyLabel"), p = '\x3cdiv class\x3d"permissionActionLinkPanel"\x3e\x3ca onclick\x3d"Sfdc.MakeFilePrivateConfirmDialog.showDialog({isChatterFile:\x26quot;' + g + "\x26quot;, docId:\x26quot;" +
                b + "\x26quot;, fileTitle:\x26quot;" + escape(h) + "\x26quot;, sharedWithId:\x26quot;" + d + "\x26quot;, sharedWithName:\x26quot;" + k + "\x26quot;, shareId:\x26quot;" + e + "\x26quot;, isSharedWithPublicGroup:" + l + ", useStopLinkShareLabel:" + a + '}); return false;" class\x3d"permissionActionLink"\x3e\x3cspan class\x3d"permissionLabel"\x3e' + u + "\x3c/span\x3e\x3c/a\x3e\x3c/div\x3e") : s.push('\x3cdiv class\x3d"permissionActionLinkPanel"\x3e\x3ca onclick\x3d"Sfdc.AccessibleFileSharedWithListDialog.changeSharingType(\x26quot;' +
                b + "\x26quot;, \x26quot;" + d + "\x26quot;, \x26quot;" + c + "\x26quot;, \x26quot;" + n + "\x26quot;, \x26quot;" + t + "\x26quot;, \x26quot;" + k.label + "\x26quot;, " + f + ", \x26quot;" + e + '\x26quot;); return false;" class\x3d"permissionActionLink"\x3e\x3cspan class\x3d"permissionLabel"\x3e' + u + "\x3c/span\x3e\x3c/a\x3e\x3c/div\x3e")
                                        }
                                    p && m.push(p);
                                    m = m.concat(s);
                                    if (Sfdc.userAgent.isIE7 || Sfdc.userAgent.isIE8) m.push('\x3cdiv class\x3d"usid-roundedCornerDropdown usid-trDropdown"\x3e\x3c/div\x3e'), 2 == q.sharingOption.length ? m.push('\x3cdiv class\x3d"usid-topSpacer usid-topSpacerThreeRows"\x3e') :
        m.push('\x3cdiv class\x3d"usid-topSpacer"\x3e'), m.push('\x3cimg src\x3d"/s.gif" height\x3d"8"/\x3e\x3c/div\x3e'), m.push('\x3cdiv class\x3d"usid-roundedCornerDropdown usid-tlDropdown"\x3e\x3c/div\x3e'), m.push('\x3cdiv class\x3d"usid-roundedCornerDropdown usid-brDropdown"\x3e\x3c/div\x3e'), 2 == q.sharingOption.length ? m.push('\x3cdiv class\x3d"usid-bottomSpacer usid-bottomSpacerThreeRows"\x3e') : m.push('\x3cdiv class\x3d"usid-bottomSpacer"\x3e'), m.push('\x3cimg src\x3d"/s.gif" height\x3d"8"/\x3e\x3c/div\x3e'),
        m.push('\x3cdiv class\x3d"usid-roundedCornerDropdown usid-blDropdown"\x3e\x3c/div\x3e');
                                    return m.join("")
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.getPermissionDropdown = function () {
                                    var a = Sfdc.DropdownPanel.getPanel(Sfdc.AccessibleFileSharedWithListDialog.PERM_DROPDOWN_ID);
                                    a || (a = new Sfdc.FileSharedWithPermissionDropdown(Sfdc.AccessibleFileSharedWithListDialog.PERM_DROPDOWN_ID, "sharedWithPermissionDropdown"));
                                    return a
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.showPermissionDropdown = function (a, b, d, c, f, e, g, h, k, l, m, n) {
                                    var p = Sfdc.AccessibleFileSharedWithListDialog.getPermissionDropdown();
                                    p && (b = {
                                        docId: b,
                                        sharedWithId: d,
                                        sharingOptionJSONStr: c,
                                        sharedFileOwnerId: f,
                                        isAdmin: e,
                                        shareId: g,
                                        x: getObjX(a),
                                        y: getObjY(a),
                                        isChatterFile: h,
                                        fileTitle: k,
                                        sharedWithName: l,
                                        isSharedWithPublicGroup: m,
                                        useStopLinkShareLabel: n
                                    }, p.show(a, b))
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.closePermissionDropdown = function () {
                                    var a = Sfdc.AccessibleFileSharedWithListDialog.getPermissionDropdown();
                                    a && a.close()
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.closeACList = function () {
                                    var a = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.INPUTBOX_ID + TagAutoComplete.BOX_ID);
                                    a && Sfdc.Dom.hideByDisplay(a)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.changeSharingType = function (a, b, d, c, f, e, g, h) {
                                    Sfdc.AccessibleFileSharedWithListDialog.closePermissionDropdown();
                                    a = {
                                        docId: a,
                                        sharedWithId: b,
                                        currentType: c,
                                        type: f,
                                        label: e,
                                        syncUpMainPage: !1,
                                        shareId: h
                                    };
                                    e = UserContext.userId;
                                    e === d || g || c === Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_VIEWER && f === Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_COLLABORATOR ? Sfdc.AccessibleFileSharedWithListDialog.postSharingTypeChange(a) : (e === b || b.match(Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX_MATCH) ==
        Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX) && c === Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_COLLABORATOR && f === Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_VIEWER ? (a.syncUpMainPage = !0, Sfdc.ChangeSharingTypeConfirmDialog.showDialog(a)) : Sfdc.AccessibleFileSharedWithListDialog.postSharingTypeChange(a)
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.postSharingTypeChange = function (a, b) {
                                    var d = a.docId,
        c = a.sharedWithId,
        f = a.currentType,
        e = a.type,
        g = chatter.getToolbox(),
        d = "/" + Sfdc.AccessibleFileSharedWithListDialog.getEntityTypeForId(d) + "/sharedwithwizard/" + d + ";edit",
        h = Sfdc.BaseAccessibleFileDialog.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID);
                                    f === Sfdc.AccessibleFileSharedWithListDialog.SHARING_TYPE_NOACCESS && h && (h.syncUpMainPage = !0);
                                    g.post({
                                        url: d,
                                        params: {
                                            st: e,
                                            reload: !0,
                                            eid: c,
                                            shareId: a.shareId
                                        },
                                        failure: function (a, c) {
                                            c && !c.errormessage && alert(LC.getLabel("Feeds", "GenericFailureNoGack"));
                                            b && b()
                                        },
                                        success: function (a, c) {
                                            var d = !1;
                                            h && h.updateContent(c);
                                            var d = !0, e = null;
                                            Sfdc.ChangeSharingTypeConfirmDialog.dialogExists() && (e = OverlayDialogElement.getDialog(Sfdc.ChangeSharingTypeConfirmDialog.ID));
                                            d && e && (!0 === e.syncUpMainPage && h) && (h.syncUpMainPage = !0);
                                            b && b()
                                        }
                                    })
                                };
                                Sfdc.AccessibleFileSharedWithListDialog.updateTitle = function (a, b) {
                                    a = ApiUtils.to18CharId(a);
                                    var d = Sfdc.get(a + "_title");
                                    if (d) {
                                        var d = Sfdc.get(".fileTypeIcon", Sfdc.Dom.getParent(d, "div")), c = Sfdc.get(".filePrivateIcon", d);
                                        b ? c || (c = Sfdc.Dom.create(document, !1, "img"), c.className = "filePrivateIcon", c.src = "/s.gif", d.appendChild(c)) : c && Sfdc.Dom.removeChild(c)
                                    }
                                };
                                Sfdc.ns("Sfdc.FileCollaborationConfirmDialog");
                                Sfdc.FileCollaborationConfirmDialog = function (a) {
                                    this.id = a.id;
                                    this.docId = a.docId;
                                    this.windowName = a.id;
                                    this.setupDefaultButtons();
                                    this.addEvents();
                                    this.buttonContents = this.contents = "";
                                    this.hasButtonsBar = !0
                                };
                                Ext.extend(Sfdc.FileCollaborationConfirmDialog, OverlayDialogElement);
                                Sfdc.FileCollaborationConfirmDialog.prototype.makeContent = function (a) { };
                                Sfdc.FileCollaborationConfirmDialog.prototype.showDialog = function (a) {
                                    this.makeContent(a);
                                    this.isModal = !1;
                                    this.createContent();
                                    this.setWidth(540);
                                    this.show();
                                    a = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.ID);
                                    Sfdc.Dom.hideByDisplay(a)
                                };
                                Sfdc.FileCollaborationConfirmDialog.prototype.cancel = function () {
                                    this.hide();
                                    var a = Sfdc.get(Sfdc.AccessibleFileSharedWithListDialog.ID);
                                    Sfdc.Dom.show(a)
                                };
                                Sfdc.ns("Sfdc.MakeFilePrivateConfirmDialog");
                                Sfdc.MakeFilePrivateConfirmDialog = function (a) {
                                    Sfdc.FileCollaborationConfirmDialog.call(this, a);
                                    this.isChatterFile = a.isChatterFile
                                };
                                Ext.extend(Sfdc.MakeFilePrivateConfirmDialog, Sfdc.FileCollaborationConfirmDialog);
                                Sfdc.MakeFilePrivateConfirmDialog.ID = "makePrivateConfirmDialog";
                                Sfdc.MakeFilePrivateConfirmDialog.showDialog = function (a) {
                                    Sfdc.AccessibleFileSharedWithListDialog.closePermissionDropdown();
                                    var b = null;
                                    document.getElementById(Sfdc.MakeFilePrivateConfirmDialog.ID) ? b = OverlayDialogElement.getDialog(Sfdc.MakeFilePrivateConfirmDialog.ID) : (a.id = Sfdc.MakeFilePrivateConfirmDialog.ID, b = new Sfdc.MakeFilePrivateConfirmDialog(a), b.register());
                                    b.showDialog(a)
                                };
                                Sfdc.MakeFilePrivateConfirmDialog.prototype.makeContent = function (a) {
                                    var b, d;
                                    a.sharedWithId ? (b = LC.getLabel("ChatterFileSharing", "stopSharing"), d = a.useStopLinkShareLabel ? LC.getLabel("ChatterFileSharing", "stopSharingViaLinkMsg", "\x3cb\x3e" + escapeHTML(a.fileTitle) + "\x3c/b\x3e") : "00D" === a.sharedWithId.substr(0, 3) ? '\x3cdiv class\x3d"stopSharingWithCompany"\x3e' + LC.getLabel("ChatterFileSharing", "stopSharingMsg", escapeHTML(unescape(a.fileTitle)), LC.getLabel("ChatterFileSharing", "yourCompanyLabel")) + '\x3c/div\x3e\x3cdiv class\x3d"stopSharingWithCompanyDescription"\x3e' +
        LC.getLabel("ChatterFileSharing", "stopSharingWithCompany") + "\x3c/div\x3e" : "0DB" === a.sharedWithId.substr(0, 3) ? '\x3cdiv class\x3d"stopSharingWithCompany"\x3e' + LC.getLabel("ChatterFileSharing", "stopSharingMsg", escapeHTML(unescape(a.fileTitle)), LC.getLabel("ChatterFileSharing", "yourCommunityLabel")) + '\x3c/div\x3e\x3cdiv class\x3d"stopSharingWithCompanyDescription"\x3e' + LC.getLabel("ChatterFileSharing", "stopSharingWithCommunity") + "\x3c/div\x3e" : LC.getLabel("ChatterFileSharing", "stopSharingMsg", "\x3cb\x3e" +
            escapeHTML(unescape(a.fileTitle)) + "\x3c/b\x3e", "\x3cb\x3e" + escapeHTML(a.sharedWithName) + "\x3c/b\x3e")) : a.isChatterFile ? (b = LC.getLabel("ChatterFileSharing", "makePrivate"), d = LC.getLabel("ChatterFileSharing", "makePrivateMsgForChatterFile")) : (b = LC.getLabel("ChatterFileSharing", "restrictAccess"), d = LC.getLabel("ChatterFileSharing", "makePrivateMsgForContentFile"));
                                    this.setTitle(b);
                                    this.isModal = !1;
                                    var c = [];
                                    c.push('\x3cdiv class\x3d"makePrivateMsgPanel"\x3e');
                                    a.sharedWithId ? c.push('\x3cdiv class\x3d"stopSharingMsg"\x3e' + d + "\x3c/div\x3e") : a.isChatterFile ? (c.push('\x3cdiv class\x3d"makePrivateMsgIcon"\x3e\x3c/div\x3e'), c.push('\x3cdiv class\x3d"makePrivateMsgForChatterFile"\x3e' + d + "\x3c/div\x3e")) : c.push('\x3cdiv class\x3d"makePrivateMsgForContentFile"\x3e' + d + "\x3c/div\x3e");
                                    c.push("\x3c/div\x3e");
                                    this.contents = c.join("");
                                    c = [];
                                    c.push('\x3cinput type\x3d"button" value\x3d"');
                                    a.sharedWithId ? c.push(LC.getLabel("ChatterFileSharing", "stopSharing")) : c.push(b);
                                    c.push('" class\x3d"' + ZenCss.btn + '"');
                                    c.push(' onclick\x3d"Sfdc.MakeFilePrivateConfirmDialog.execute(');
                                    c.push("{isChatterFile: ");
                                    c.push(a.isChatterFile ? "true" : "false");
                                    c.push(", docId: \x26quot;");
                                    c.push(a.docId);
                                    a.sharedWithId && (c.push("\x26quot;, sharedWithId: \x26quot;"), c.push(a.sharedWithId));
                                    a.shareId && (c.push("\x26quot;, shareId: \x26quot;"), c.push(a.shareId));
                                    c.push("\x26quot;}");
                                    c.push(');"/\x3e');
                                    c.push('\x3cinput type\x3d"button" value\x3d"');
                                    c.push(LC.getLabel("Buttons", "cancel"));
                                    c.push('" class\x3d"' + ZenCss.btn + '" onclick\x3d"Sfdc.MakeFilePrivateConfirmDialog.closeDialog();"/\x3e');
                                    this.buttonContents = c.join("")
                                };
                                Sfdc.MakeFilePrivateConfirmDialog.closeDialog = function () {
                                    OverlayDialogElement.getDialog(Sfdc.MakeFilePrivateConfirmDialog.ID).cancel()
                                };
                                Sfdc.MakeFilePrivateConfirmDialog.execute = function (a) {
                                    var b = chatter.getToolbox(), d = "/" + Sfdc.AccessibleFileSharedWithListDialog.getEntityTypeForId(a.docId) + "/sharedwithwizard/" + a.docId + ";delete", c = !1;
                                    a.sharedWithId && (d += "?eid\x3d" + a.sharedWithId, c = !0);
                                    a.shareId && (d = d + (c ? "\x26" : "?") + "shareId\x3d" + a.shareId);
                                    b.post({
                                        url: d,
                                        failure: function (a, b) {
                                            b && !b.errormessage && alert(LC.getLabel("Feeds", "GenericFailureNoGack"));
                                            Sfdc.MakeFilePrivateConfirmDialog.closeDialog()
                                        },
                                        success: function (b, c) {
                                            try {
                                                var d = Sfdc.AccessibleFileSharedWithListDialog.isFileDetailPage();
                                                if (c.url)
                                                    if (d) navigateToUrl(c.url, null, Desktop.CLOSETAB_ACTION);
                                                    else {
                                                        var h = Sfdc.BaseAccessibleFileDialog.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID);
                                                        h.refreshMainPage = !0;
                                                        Sfdc.MakeFilePrivateConfirmDialog.closeDialog();
                                                        Sfdc.BaseAccessibleFileListDialog.closeDialog("chatterFileSharedWithListDialog")
                                                    } else (h = Sfdc.BaseAccessibleFileDialog.getDialogById(Sfdc.AccessibleFileSharedWithListDialog.ID)) && h.updateContent(c), h.syncUpMainPage = !0, Sfdc.MakeFilePrivateConfirmDialog.closeDialog();
                                                var k = Sfdc.AccessibleFileSharedWithListDialog.getSharedWithListDomElem().rows.length;
                                                Sfdc.AccessibleFileSharedWithListDialog.updateTitle(a.docId, 2 > k)
                                            } catch (l) { }
                                        }
                                    })
                                };
                                Sfdc.ns("Sfdc.ChangeSharingTypeConfirmDialog");
                                Sfdc.ChangeSharingTypeConfirmDialog = function (a) {
                                    Sfdc.FileCollaborationConfirmDialog.call(this, a);
                                    this.isChatterFile = a.isChatterFile
                                };
                                Ext.extend(Sfdc.ChangeSharingTypeConfirmDialog, Sfdc.FileCollaborationConfirmDialog);
                                Sfdc.ChangeSharingTypeConfirmDialog.ID = "changeSharingTypeConfirmDialog";
                                Sfdc.ChangeSharingTypeConfirmDialog.dialogExists = function () {
                                    return document.getElementById(Sfdc.ChangeSharingTypeConfirmDialog.ID) ? !0 : !1
                                };
                                Sfdc.ChangeSharingTypeConfirmDialog.showDialog = function (a) {
                                    var b = null;
                                    Sfdc.ChangeSharingTypeConfirmDialog.dialogExists() ? b = OverlayDialogElement.getDialog(Sfdc.ChangeSharingTypeConfirmDialog.ID) : (a.id = Sfdc.ChangeSharingTypeConfirmDialog.ID, b = new Sfdc.ChangeSharingTypeConfirmDialog(a), b.register());
                                    b.syncUpMainPage = a.syncUpMainPage;
                                    b.showDialog(a)
                                };
                                Sfdc.ChangeSharingTypeConfirmDialog.prototype.makeContent = function (a) {
                                    var b = LC.getLabel("ChatterFileSharing", "changePermission"), d;
                                    d = a.sharedWithId.match(Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX_MATCH) == Sfdc.AccessibleFileSharedWithListDialog.GROUP_ENTITY_PREFIX ? LC.getLabel("ChatterFileSharing", "changeGroupPermissionAlert") : LC.getLabel("ChatterFileSharing", "changePeoplePermissionAlert");
                                    this.setTitle(b);
                                    this.isModal = !1;
                                    var c = [];
                                    c.push('\x3cdiv class\x3d"changePermissionMsgPanel"\x3e');
                                    c.push('\x3cdiv class\x3d"changePermissionMsg"\x3e' + d + "\x3c/div\x3e");
                                    c.push("\x3c/div\x3e");
                                    this.contents = c.join("");
                                    c = [];
                                    c.push('\x3cinput type\x3d"button" value\x3d"');
                                    c.push(b);
                                    c.push('" class\x3d"' + ZenCss.btn + '"');
                                    c.push(' onclick\x3d"Sfdc.ChangeSharingTypeConfirmDialog.execute(');
                                    c.push("{docId: \x26quot;");
                                    c.push(a.docId);
                                    c.push("\x26quot;, sharedWithId: \x26quot;");
                                    c.push(a.sharedWithId);
                                    c.push("\x26quot;, type: \x26quot;");
                                    c.push(a.type);
                                    c.push("\x26quot;, label: \x26quot;");
                                    c.push(a.label);
                                    c.push("\x26quot;}");
                                    c.push(');"/\x3e');
                                    c.push('\x3cinput type\x3d"button" value\x3d"');
                                    c.push(LC.getLabel("Buttons", "cancel"));
                                    c.push('" class\x3d"' + ZenCss.btn + '" onclick\x3d"Sfdc.ChangeSharingTypeConfirmDialog.closeDialog();"/\x3e');
                                    this.buttonContents = c.join("")
                                };
                                Sfdc.ChangeSharingTypeConfirmDialog.closeDialog = function () {
                                    OverlayDialogElement.getDialog(Sfdc.ChangeSharingTypeConfirmDialog.ID).cancel()
                                };
                                Sfdc.ChangeSharingTypeConfirmDialog.execute = function (a) {
                                    Sfdc.AccessibleFileSharedWithListDialog.postSharingTypeChange(a, Sfdc.ChangeSharingTypeConfirmDialog.closeDialog)
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
                                                b.config.onCancelCallback(a, c)
                                            },
                                            onErrorCallback: function (a, c, d) {
                                                b.onErrorHandler(a, c, d);
                                                b.config.onErrorCallback(a, c, d)
                                            },
                                            customHandlers: this.config.customHandlers
                                        })
                                    },
                                    preventLeaveInProgress: function () {
                                        var b = this, a = this.config.errMsg.leavePage;
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
                                        //debugger;
                                        Sfdc.get("uploadFileButtonLink").innerHTML = LC.getLabel("ChatterFilesTabPage", "uploadMultiFilesLinkText");
                                        var a = this.swfUrlPrefix + "/flex/MultiFileUploader.swf", b = Sfdc.MultiFileUploaderUtil.createElementFromHTML('\x3cdiv class\x3d"swfbtn-panel"\x3e\x3cdiv id\x3d"' + Sfdc.SWFUploadButton.SWF_BUTTON_ID + '"\x3e\x26nbsp;\x3c/div\x3e\x3c/div\x3e');
                                        this.uploadBtnAnchor.appendChild(b);
                                        swfobject.embedSWF(a, Sfdc.SWFUploadButton.SWF_BUTTON_ID, "100%", "100%", Sfdc.SWFUploadButton.SUPPORTED_FLASH_VERSION.toString(), "", {}, {
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
                                    var b = a.parent(".overlayDialog ").dom, c = b.id, b = b.offsetTop + b.offsetHeight, d = Sfdc.Window.getWindowHeight();
                                    b > d && (b -= d, d = a.getHeight(), d > b && a.setHeight(d - b), a.setStyle("overflow-y", "auto"), c && (a = sfdcPage.getDialogById(c)) && a.position())
                                };
                                Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList.prototype.get = function (a) {
                                    return this.idToFileUploadBadge[a]
                                };
                                Sfdc.ns("Sfdc.CreateCanvasPublisherHandler");
                                Sfdc.CreateCanvasPublisherHandler = function () {
                                    this.registerFeedItemTypeHandler = function (e) {
                                        chatter.getPublisher().registerFeedItemTypeHandler("CanvasPost", function () {
                                            return {
                                                config: {},
                                                setupPanel: function () {
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.setupPanel",
                                                        payload: {},
                                                        target: {
                                                            canvas: e
                                                        }
                                                    })
                                                },
                                                clearPanelState: function () {
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.clearPanelState",
                                                        payload: {},
                                                        target: {
                                                            canvas: e
                                                        }
                                                    })
                                                },
                                                onShowPanel: function () {
                                                    var a = this.publisherCore;
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.showPanel",
                                                        payload: {},
                                                        target: {
                                                            canvas: e
                                                        }
                                                    });
                                                    Sfdc.canvas.parent.subscribe({
                                                        name: "publisher.setValidForSubmit",
                                                        onData: function (c) {
                                                            a.setIsExtensionValidForSubmit(c)
                                                        }
                                                    });
                                                    a.setIsExtensionValidForSubmit(!1)
                                                },
                                                onSuccess: function () {
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.success",
                                                        payload: {},
                                                        target: {
                                                            canvas: e
                                                        }
                                                    })
                                                },
                                                onFailure: function (a, c) {
                                                    var d = this.publisherCore;
                                                    "undefined" !== typeof d && "undefined" !== typeof d.setIsExtensionValidForSubmit && d.setIsExtensionValidForSubmit(!1);
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.failure",
                                                        payload: c,
                                                        target: {
                                                            canvas: e
                                                        }
                                                    })
                                                },
                                                getPayload: function (a, c) {
                                                    var d = this.publisherCore, f = d.getRawBody();
                                                    a.text = d.isPromptText(f) ? "" : f;
                                                    Sfdc.canvas.parent.publish({
                                                        name: "publisher.getPayload",
                                                        payload: a,
                                                        target: {
                                                            canvas: e
                                                        }
                                                    });
                                                    Sfdc.canvas.parent.subscribe({
                                                        name: "publisher.setPayload",
                                                        onData: function (b) {
                                                            a.feedItemType = b.feedItemType;
                                                            "CanvasPost" === b.feedItemType ? (a.auxText = b.auxText, a.namespacePrefix = b.namespace, a.developerName = b.developerName, a.title = b.title, a.height = b.height, a.parameters = chatter.getToolbox().htmlEncode(b.parameters),a.description = b.description, a.thumbnailUrl = b.thumbnailUrl) : (Sfdc.isEmpty(b.auxText) || (a.text = a.text + "\n\n" + b.auxText), "LinkPost" === b.feedItemType && (a.url = b.url, a.urlName = b.urlName));
                                                            c(a)
                                                        }
                                                    });
                                                    return {
                                                        isValid: !0,
                                                        isAsync: !0,
                                                        errorPayload: {}
                                                    }
                                                },
                                                validatePayload: function (a) {
                                                    var c = !0, d = { validFeedItemType: !0 };
                                                    "TextPost" !== a.feedItemType && ("LinkPost" !== a.feedItemType && "CanvasPost" !== a.feedItemType) && (d.validFeedItemType = !1, d.feedItemType = a.feedItemType, c = !1);
                                                    return {
                                                        isValid: c,
                                                        errorPayload: d
                                                    }
                                                },
                                                onValidationFailure: function (a) {
                                                    var c = this.publisherCore;
                                                    a.validFeedItemType || (a = {
                                                        errors: {
                                                            message: LC.getLabel("CanvasPublisher", "invalidFeedItemType", a.feedItemType)
                                                        }
                                                    }, Sfdc.canvas.parent.publish({
                                                        name: "publisher.failure",
                                                        payload: a,
                                                        target: {
                                                            canvas: e
                                                        }
                                                    }));
                                                    c.enablePublisher()
                                                }
                                            }
                                        } (), e)
                                    }
                                };
                                var createCanvasPublisherHandler = new Sfdc.CreateCanvasPublisherHandler;
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
                                    var a = Sfdc.get("linkSettingDetailDiv"), b = Sfdc.get("linkSettingHeader_icon");
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
                                    var b = Sfdc.AccessibleFilePublicLinksDialog.DATA_LOAD_URL + a.docId, c = this;
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
                                    this.fileUploadBadgeList = new Sfdc.MultiFileUploaderUiComponents.FileUploadBadgeList({
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
                                    var d = this.config.fileInput ? 1 : 2, e = Sfdc.ChatterFileUploader.getOriginOfMultiUpload(this.filterParentId);
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
                                        var a = this.filesCompleted, c = this.filesSelected;
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
                                            if (a != Sfdc.ChatterFileUploader.GROUP_PAGE && a != Sfdc.ChatterFileUploader.PROFILE_PAGE) return !0
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
                                        Sfdc.MultiFileUploaderBase.prototype.onStartHandler.apply(this, arguments);
                                        b.dom.isAbort = !1;
                                        return !0
                                    },
                                    onProgressHandler: function (a, c, b, d) {
                                        Sfdc.MultiFileUploaderBase.prototype.onProgressHandler.apply(this, arguments);
                                        var e = this.fileUploadBadgeList.get(a), h = e.dom;
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
                                        Sfdc.ChatterFileUploader.dragAndDropZone.errorDialog = a;
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
                                        Sfdc.MultiFileUploaderUtil.isIE9AndBelow() ? Sfdc.ChatterFileSWFUploader.cancelRemainingUploads() : this.uploadHandler.cancelRemainingUploads()
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
                                                a && 0 === a.filesCompleted + a.filesInProgress ? Sfdc.AccessibleMultiUploadFilesDialog.closeIt() : Sfdc.AccessibleMultiUploadFilesDialog.displayDragAndDropTargetIcon(!1)
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
                                    var e = document.getElementById("fileUploaderDiv"), m = document.getElementById(c);
                                    if (m)
                                        if (c = Ext.isWindows && Sfdc.userAgent.isSafari, b && Sfdc.MultiFileUploaderUtil.isMultiFileUploadSupported() && !c) 
                                            Sfdc.ChatterFileUploader.isMultiFileUpload = !0, Sfdc.ChatterFileUploader.hideUploadFileButtonLink(), Sfdc.ChatterFileUploader.createAndAttachUploadButton(m, k), Sfdc.ChatterFileUploader.setupPageDragDropZone(k), Sfdc.ChatterFileUploader.addDragDropZoneButtonStyle(m), Sfdc.ChatterFileUploader.addDragDropZoneDashedBorder(e),
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
                                            e.totalNumberOfFilesSelected = 0;
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
                                            e.config.onProgressCallback(a.index, a, b, d)
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