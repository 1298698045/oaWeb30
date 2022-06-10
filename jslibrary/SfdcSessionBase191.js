this.Sfdc || (Sfdc = {});
if ("undefined" === typeof SfdcFramework) {
    var SfdcFramework = function (k, b) {
        function x(a, c, d) {
            var e = !1;
            b.isArray(d) && (e = !r(d));
            m[a] = {
                pending: e,
                name: a,
                ctr: c,
                dependencies: d
            };
            e ? b.require(d, function () {
                var b = m[a];
                b && (b.pending = !1);
                u(a)
            }) : u(a)
        }

        function u(a) {
            if (a in n) {
                for (var c = n[a], d = [], e, f = 0; f < c.length; f++) e = s[c[f]], r(e) && d.push(c[f]);
                delete n[a];
                a = d
            } else a = [];
            if (b.isArray(a) && 0 < a.length)
                for (c = 0; c < a.length; c++) t(a[c], s[a[c]])
        }

        function t(a, c) {
            var d = [];
            b.isArray(c) || (c = []);
            for (var e, f, g = 0; g < c.length; g++) (e =
                m[c[g]]) && !e.pending && (f = t(e.ctr, e.dependencies)), d.push(f);
            return a.apply(this, d)
        }

        function r(a) {
            b.assert(b.isArray(a), "Required ModulesList is an Array");
            for (var c, d = 0; d < a.length; d++)
                if (c = a[d], b.isEmpty(c) && b.error("A specified ModuleName must be a non empty string"), c = m[c], !c || c.pending) return !1;
            return !0
        }
        b || (b = {});
        var v = k.Sizzle,
            p = k.document,
            w = [],
            y = 0,
            q = Object.prototype.toString,
            m = {},
            s = {},
            n = {};
        b.isDebug = function () {
            var a = p && (p.head || p.getElementsByTagName("head")[0]);
            return a && "true" === a.getAttribute("debug")
        }();
        b.userAgent = new function () {
            var a = k.navigator && k.navigator.userAgent || "",
                b = -1 != a.indexOf("Chromium"),
                d = -1 != a.indexOf("AppleWebKit"),
                e = d && -1 != a.indexOf("Chrome/"),
                f = d && !e,
                g = -1 != a.indexOf("Firefox/"),
                h = -1 != a.indexOf("MSIE ") || -1 != a.indexOf("Trident/"),
                l = parseInt(a.split("MSIE")[1], 10) || -1;
            h && (-1 == l && -1 != a.indexOf("Trident/7.0")) && (l = 11);
            return {
                isIE: h,
                isIE11: h && 11 == l,
                isIE10: h && 10 == l,
                isIE9: h && 9 == l,
                isIE8: h && 8 == l,
                isIE7: h && 7 == l,
                isIE6: h && 6 == l,
                isWebkit: d,
                isChrome: e,
                isChromeFrame: e && "undefined" != typeof k.externalHost,
                isChromium: b,
                isSafari: f,
                isSafari3: f && -1 != a.indexOf("Version/3"),
                isSafariIpad: d && -1 != a.indexOf("iPad"),
                isSafariIOS: f && (-1 != a.indexOf("iPad") || -1 != a.indexOf("iPhone")),
                isFirefox: g,
                isFirefox3: g && -1 != a.indexOf("Firefox/3"),
                isOpera: -1 != a.indexOf("Opera"),
                isNetscape: -1 != a.indexOf("Netscape/")
            }
        };
        b.ns = function () {
            for (var a = Array.prototype.slice.call(arguments), b = null; a.length;)
                for (var d = (a.shift() || "").toString().split("."), b = k; d.length;) {
                    var e = d.shift();
                    if (!e.length) break;
                    b[e] || (b[e] = {});
                    b = b[e]
                }
            return b
        };
        b.provide = function (a, c) {
            if (a && c) {
                var d = b.resolve(a);
                if (!d) {
                    var e = a.split("."),
                        d = e.pop(),
                        e = b.ns(e.join("."));
                    c.$constructor && (b.assert(b.Class, "Sfdc.provide(): Sfdc.Class is required when providing $constructor 'classOrFunction' notation."), c = new b.Class(c));
                    b.define(a, function () {
                        return c
                    });
                    return e[d] = c
                }
                return d
            }
        };
        b.resolve = function (a, b) {
            var d = b || k;
            if (void 0 != a && a.length)
                for (var e = a.split(".") ; d && e.length;) d = d[e.shift()];
            return void 0 != d ? d : null
        };
        b.apply = function (a, b, d) {
            if (d)
                for (var e in b) b.hasOwnProperty(e) &&
                    (a[e] = b[e]);
            else
                for (var f in b) a.hasOwnProperty(f) || (a[f] = b[f]);
            return a
        };
        b.clone = function (a, c) {
            c = !!c;
            if (!a) return a;
            var d = b.isArray(a),
                e = b.isObject(a);
            if (!d && !e) return a;
            if (c) {
                if (d)
                    for (var d = [], f = 0, e = a.length; f < e; f++) d.push(b.clone(a[f], !0));
                else
                    for (f in d = {}, a) a.hasOwnProperty(f) && (d[f] = b.clone(a[f], !0));
                return d
            }
            return d ? a.slice() : b.apply({}, a)
        };
        b.each = function (a, c, d) {
            b.assert(b.Array, "Sfdc.each(): Sfdc.Array is required for calls to Sfdc.each().");
            if (b.isArray(a)) return b.Array.forEach(a, c,
                d);
            if ("length" in a) return b.Array.forEach(b.Array.toArray(a), c, d);
            b.error("You tried to iterate over an object that is not yet supported.");
            return null
        };
        b.onReady = function (a) {
            b.assert(b.Dom, "Sfdc.onReady(): Sfdc.Dom is required for calls to Sfdc.onReady().");
            return b.Dom.onReady(a)
        };
        b.onload = function (a) {
            b.assert(b.Dom, "Sfdc.onload(): Sfdc.Dom is required for calls to Sfdc.onload().");
            return b.Dom.onload(a)
        };
        b.isArray = function (a) {
            return void 0 === a || null === a ? !1 : "[object Array]" === q.call(a)
        };
        b.isObject =
            function (a) {
                return null != a ? "object" === typeof a && !b.isArray(a) : !1
            };
        b.isString = function (a) {
            return "[object String]" === q.call(a)
        };
        b.isBoolean = function (a) {
            return "[object Boolean]" === q.call(a)
        };
        b.isFunction = function (a) {
            return "function" === typeof a
        };
        b.isNumber = function (a) {
            return "[object Number]" === q.call(a)
        };
        b.select = function (a, c) {
            b.assert(v, "Sfdc.select(): There is no selection engine specified.");
            return v(a, c)
        };
        b.get = function (a, c) {
            if (!b.isString(a)) return a;
            var d = p;
            if (/^[>\.#\\]/.test(a)) return b.first(a,
                c);
            c ? d = c.getElementById ? c : c.ownerDocument : c = d;
            d = d.getElementById(a);
            return null === d || d.getAttribute("id") === a ? d : c.all ? c.all[a] : null
        };
        b.first = function (a, c) {
            return b.select(a, c)[0] || null
        };
        b.assert = function (a, c) {
            if (void 0 === a || null === a || !1 === !!a) throw "error" in b && b.error(c), Error(c);
            return a
        };
        b.isDefAndNotNull = function (a) {
            return void 0 !== a && null !== a
        };
        b.on = function (a, c, d, e, f) {
            b.assert(b.Event, "Sfdc.on(): Sfdc.Event is required to use Sfdc.on().");
            b.assert(a, "Sfdc.on(): 'element' must be a valid Object or Node.");
            b.assert(c, "Sfdc.on(): 'eventName' must be a valid String.");
            b.Event.add(a, c, d, e, f);
            return b
        };
        b.un = function (a, c, d, e) {
            b.assert(b.Event, "Sfdc.un(): Sfdc.Event is required to use Sfdc.un().");
            b.assert(a, "Sfdc.un(): 'element' must be a valid Object or Node.");
            b.assert(c, "Sfdc.un(): 'eventName' must be a valid String.");
            b.Event.remove(a, c, d, e);
            return b
        };
        b.getConst = function (a, c) {
            b.assert(void 0 !== k[a], "That Constants group does not exist.");
            return k[a][c]
        };
        b.getUID = function (a) {
            if (a.getAttribute) {
                var c =
                    a.getAttribute("data-uidSfdc");
                if (c) return c;
                c = b.newUID();
                a.setAttribute("data-uidSfdc", c);
                return c
            }
            return (c = a["data-uidSfdc"]) ? c : a["data-uidSfdc"] = b.newUID()
        };
        b.hasUID = function (a) {
            return a ? a.getAttribute ? null != a.getAttribute("data-uidSfdc") : a.hasOwnProperty ? a.hasOwnProperty("data-uidSfdc") : "data-uidSfdc" in a : !1
        };
        b.newUID = function () {
            return ++y
        };
        b.log = function (a, b, d) {
            void 0 !== a && w.push({
                msg: a,
                level: b,
                args: d
            });
            return w
        };
        b.isEmpty = function (a) {
            if (b.isObject(a)) {
                for (var c in a)
                    if (a.hasOwnProperty(c)) return !1;
                return !0
            }
            return null === a || void 0 === a || "" === a || b.isArray(a) && !a.length
        };
        b.inherits = function (a, c) {
            if (!b.isFunction(a)) throw Error("Sfdc.inherit(): 'type' must be a valid Function pointer.");
            for (var d = c; d;) {
                if (a === d || d instanceof a || a === d.constructor) return !0;
                d = d.prototype
            }
            return !1
        };
        b.implies = function (a, c, d) {
            if (!b.isObject(a)) throw Error("Sfdc.implies(): 'contract' must be a valid Object.");
            if (null == c) return d && (d.reason = "Instance was undefined."), !1;
            var e = null,
                f = null,
                g;
            for (g in a) {
                if (void 0 === c[g]) return d &&
                    (d.reason = b.String.format("Instance member not implemented. Expected: '{0}{1}'.", [g, b.isFunction(a[g]) ? b.String.format("({0})", [b.Function.getParameters(a[g]).join(", ")]) : ""])), !1;
                if (b.isFunction(a[g])) {
                    if (b.inherits(a[g], c[g])) continue;
                    if (b.isFunction(c[g]) && b.isDebug && (e = b.Function.getParameters(a[g]).join(", "), f = b.Function.getParameters(c[g]).join(", "), e != f)) return d && (d.reason = b.String.format("Instance member signature mismatch on '{0}()'. Expected '{0}({1})', found '{0}({2})'.", [g, e, f])), !1
                }
                if (b.isObject(a[g])) {
                    if (null !== c[g] && !b.implies(a[g], c[g], d)) return d && (d.reason = b.String.format("Instance member type mismatch on '{0}': {1}", [g, d.reason])), !1
                } else if (typeof a[g] !== typeof c[g]) return d && (d.reason = b.String.format("Instance member type mismatch on '{0}'. Expected '{1}', found '{2}'.", [g, typeof a[g], typeof c[g]])), !1
            }
            return !0
        };
        b.isAssignableFrom = function (a, c, d) {
            if (void 0 == a) throw Error("Sfdc.isAssignableFrom(): 'type' must be a valid Function or Object.");
            if (void 0 != c) switch (typeof a) {
                case "object":
                    if (a.constructor !=
                        Object && b.inherits(a.constructor, c) || b.implies(a, c, d)) return !0;
                    break;
                case "function":
                    if (b.inherits(a, c)) return !0
            }
            return !1
        };
        b.define = function (a, c, d) {
            b.assert(b.isString(a) && 0 < a.length, "ModuleName is required and must be a string of length greater than 0.");
            b.isFunction(c) ? (d = c, c = null) : (b.assert(b.isFunction(d), "ModuleConstructor parameter must be a function that returns an instance of the module."), b.assert(b.isArray(c), "Dependencies for your module must be specified as an Array."));
            var e = m[a];
            e ? (c =
                (e.dependencies || []).toString() === (c || []).toString(), (e.ctr.toString() !== d.toString() || !c) && b.error("Cannot redefine an existing module (" + a + ").")) : x(a, d, c)
        };
        b.require = function (a, c) {
            b.assert(!b.isEmpty(a), "Required Modules are required");
            b.isArray(a) || (a = Array.prototype.slice.call(arguments), c = a.pop());
            b.assert(b.isFunction(c), "Callback must be a function");
            if (r(a)) t(c, a);
            else {
                var d = c,
                    e = a;
                s[d] = e;
                for (var f, g, h = 0; h < e.length; h++)
                    if (f = e[h], g = m[f], !g || g.pending) !1 === f in n && (n[f] = []), n[f].push(d)
            }
        };
        b.error =
            function (a) {
                throw Error(a);
            };
        return b
    };
    new SfdcFramework(this, Sfdc)
};
Sfdc.provide("Sfdc.JSON", function (f) {
    function g(a, e, d) {
        if (f.isArray(a)) {
            for (var b = d || [], c = 0; c < a.length; c++) b.push(g(a[c], e));
            return b
        }
        if (f.isObject(a)) {
            b = a.serId;
            if (void 0 !== b) return a = a.value, c = f.isArray(a) ? [] : {}, e[b] = c, g(a, e, c);
            b = a.serRefId;
            if (void 0 !== b) return e[b];
            b = d || {};
            for (c in a) a.hasOwnProperty(c) && (b[c] = g(a[c], e));
            return b
        }
        return a
    }

    function h(a, e, d) {
        var b = null,
            c = !0;
        if ("undefined" !== typeof JSON && JSON.parse) try {
            b = JSON.parse(a), c = !1
        } catch (f) { }
        var h = /^\(?("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t])+?\)?$/g;
        c && (d && h.test(a)) && (b = eval(["false||(", ")"].join(a)));
        b && e && (b = g(b, {}));
        return b
    }
    return {
        parseSafe: function (a, e) {
            return h(a, e, !1)
        },
        parse: function (a, e) {
            return h(a, e, !0)
        },
        parseWithCSRF: function (a, e) {
            if (!f.isString(a)) return null;
            var d;
            a: {
                d = f.getConst("AjaxServlet", "CSRF_PROTECT");
                d = [d, d.replace("\n", "")];
                for (var b = 0, c = d.length; b < c; b++) {
                    var g = d[b];
                    if (0 === a.indexOf(g)) {
                        d = a.slice(g.length);
                        break a
                    }
                }
                f.assert(!1, "CSRF protect string not added to servlet response.");
                d = void 0
            }
            return h(d, e, !0)
        },
        stringify: function (a,
            e, d) {
            if ("undefined" !== typeof JSON && JSON.stringify) {
                if (Array.prototype.toJSON) {
                    var b = Array.prototype,
                        c = b.toJSON;
                    delete b.toJSON;
                    var f = JSON.stringify(a, e, d);
                    b.toJSON = c;
                    return f
                }
                return JSON.stringify(a, e, d)
            }
            if (void 0 === a) return "";
            if (null === a) return "null";
            switch (a.constructor) {
                case String:
                    return '"' + a.replace(/\\/g, "\\\\").replace(/\"/g, '\\"').replace(/\r|\n|\f/g, "\\n") + '"';
                case Array:
                    b = [];
                    for (c = 0; c < a.length; c++) b.push(arguments.callee(a[c]));
                    return "[" + b.join(",") + "]";
                case Object:
                    b = [];
                    for (c in a) a.hasOwnProperty(c) &&
                        b.push(arguments.callee(c) + ":" + arguments.callee(a[c]));
                    return "{" + b.join(",") + "}";
                default:
                    return a.toString()
            }
        }
    }
}(Sfdc));
(function (e, h) {
    function l(a) {
        if (a.origin.split("://")[1].split(":")[0] === SFDCSessionVars.host && (a = Sfdc.JSON.parse(a.data)))
            if ("sfdcsession::ready" === a.cmd) f = c.contentWindow, setTimeout(q, 0);
            else {
                var d = g[a.id];
                d && (d.callback && d.callback(a), delete g[a.id])
            }
    }

    function q() {
        for (var a = 0; a < k.length; a++) {
            var d = g[k.shift()];
            f.postMessage(Sfdc.JSON.stringify(m(d)), h)
        }
    }

    function m(a) {
        var d = {},
            b;
        for (b in a) a.hasOwnProperty(b) && "function" != typeof a[b] && (d[b] = a[b]);
        return d
    }

    function b(a) {
        if (!n)
            if (a.id = p, g[p++] = a, !c || !f) {
                if (k.push(a.id), !c && !f) {
                    a = e.document;
                    c = a.createElement("iframe");
                    c.setAttribute("title", "sessionserver");
                    var b = c.style;
                    b.position = "absolute";
                    b.left = b.top = "-999px";
                    e.addEventListener ? e.addEventListener("message", l, !1) : e.attachEvent && e.attachEvent("onmessage", l);
                    a.body.appendChild(c);
                    c.src = h
                }
            } else f.postMessage(Sfdc.JSON.stringify(m(a)), h)
    }
    var n = !(e.postMessage && e.localStorage),
        c = null,
        f = null,
        g = {},
        p = 0,
        k = [];
    Sfdc.provide("SfdcApp.SfdcSession", {
        setIdentity: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::setIdentity",
                uid: a.uid || null,
                oid: a.oid || null,
                identity: a.identity || "",
                expire: a.expire || 0,
                session: a.session || !1,
                active: a.active || !1,
                activeonly: a.activeonly || !1,
                community: a.community || !1,
                mydomain: a.mydomain || !1,
                callback: a.callback || null
            })
        },
        getIdentities: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::getIdentities",
                get: a.get || [],
                callback: a.callback || null
            })
        },
        active: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::active",
                uid: a.uid || null,
                oid: a.oid || null,
                callback: a.callback || null
            })
        },
        inactive: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::inactive",
                uid: a.uid || null,
                oid: a.oid || null,
                callback: a.callback || null,
                upexp: a.upexp || null
            })
        },
        updateAndActivate: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::updateandactivate",
                uid: a.uid || null,
                oid: a.oid || null,
                expire: a.expire || 0,
                instance: a.instance || null,
                callback: a.callback || null
            })
        },
        updateLastused: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::updatelastused",
                uid: a.uid || null,
                oid: a.oid || null,
                callback: a.callback || null
            })
        },
        updateExpires: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::updateexpires",
                uid: a.uid || null,
                oid: a.oid ||
                    null,
                expire: a.expire || 0,
                callback: a.callback || null
            })
        },
        deleteIdentity: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::deleteIdentity",
                uid: a.uid || null,
                oid: a.oid || null,
                callback: a.callback || null
            })
        },
        changeDisplay: function (a) {
            a || (a = {});
            b({
                cmd: "sfdcsession::changeDisplay",
                uid: a.uid || null,
                oid: a.oid || null,
                display: a.display || null,
                callback: a.callback || null
            })
        },
        disabled: n
    })
})(this, SFDCSessionVars.server);
(function () {
    function d() {
        SFDCSessionVars.success = !0;
        SFDCSessionVars.callback && SFDCSessionVars.callback()
    }

    function e() {
        if ("a" === a.act) {
            var b = {};
            b.uid = a.uid;
            b.username = a.un;
            b.thumbnail = a.photo;
            b.oid = a.oid;
            b.instance = a.inst;
            var c = a.disp;
            c && (b.display = 100 < c.length ? c.substring(0, 100) : c);
            SfdcApp.SfdcSession.setIdentity({
                uid: a.uid,
                oid: a.oid,
                identity: b,
                expire: a.exp,
                session: !0,
                active: !0,
                activeonly: a.ao,
                community: a.isComm,
                mydomain: a.isMyDom,
                callback: d
            })
        } else "u" === a.act ? SfdcApp.SfdcSession.updateExpires({
            oid: a.oid,
            uid: a.uid,
            expire: a.exp,
            callback: d
        }) : "t" === a.act && SfdcApp.SfdcSession.updateAndActivate({
            oid: a.oid,
            uid: a.uid,
            expire: a.exp,
            instance: a.inst,
            callback: d
        })
    }
    var a = SFDCSessionVars;
    !window.Sfdc || !Sfdc.require ? e() : Sfdc.require("SfdcApp.SfdcSession", e)
})();