var DomainSwitcher = function () {
    function g(a) {
        if (a = document.getElementById(a)) a.style.display = "inline"
    }

    function f(a) {
        if (a = document.getElementById(a)) a.style.display = "none"
    }

    function k(a) {
        var c = document.getElementById("mydomain_preview"),
            d = document.getElementById("mydomain_suffix").value,
            e = document.getElementById("community_suffix").value,
            b = a.value.replace(/^\s+|\s+$/g, "");
        b || (b = "DOMAIN");
        for (b.match(/^[-./A-Za-z0-9]+$/) && a.removeAttribute("style") ; c.firstChild;) c.removeChild(c.firstChild);
        a = b.indexOf(".");
        d = -1 === a ? "https://" + b + d : 0 !== a && 0 === d.indexOf(b.substring(a)) ? "https://" + b.substring(0, a) + d : 0 !== a && 0 === e.indexOf(b.substring(a)) ? "https://" + b.substring(0, a) + e : "https://" + b;
        d = document.createTextNode(d);
        c.appendChild(d)
    }
    return {
        handleMyDomain: function () {
            var a = document.getElementById("mydomain"),
                c = a.value.replace(/^\s+|\s+$/g, "");
            if (c.match(/^[-./A-Za-z0-9]+$/)) {
                var a = window.SFDCSessionVars && window.SFDCSessionVars.usec ? "http://" : "https://",
                    d = document.getElementById("mydomain_suffix"),
                    e = document.getElementById("community_suffix"),
                    b = c.indexOf("."),
                    a = -1 === b ? a + (c + d.value) : 0 !== b && 0 === d.value.indexOf(c.substring(b)) ? a + (c.substring(0, b) + d.value) : 0 !== b && 0 === e.value.indexOf(c.substring(b)) ? a + (c.substring(0, b) + e.value) : a + c;
                (c = document.getElementById("pqs")) && (c.value && "?" === c.value.substring(0, 1)) && (a += c.value);
                window.location = a
            } else a.style.border = "#f00 1px solid"
        },
        updateMyDomain: function (a, c) {
            k(a);
            var d = document.getElementById("mydomain_suffix").value,
                e = document.getElementById("community_suffix").value,
                b = d.indexOf(":"),
                d = -1 === b ?
                d : d.substring(0, b),
                b = e.indexOf(":"),
                e = -1 === b ? e : e.substring(0, b),
                d = [d, e],
                e = a.value;
            if (a && (0 !== a.value.length && c) && (b = a.setSelectionRange ? c.which : c.keyCode, !(32 > b || 33 <= b && 46 >= b || 112 <= b && 123 >= b))) {
                var f;
                a.setSelectionRange ? f = a.selectionStart : (b = document.selection.createRange(), b.parentElement() === a && (f = a.value.lastIndexOf(b.text)));
                for (var b = e.indexOf("."), g = 0; g < d.length; g++) {
                    var h = d[g];
                    if (0 < b && 0 === h.toLowerCase().indexOf(e.toLowerCase().substring(b))) {
                        a.value += h.substring(e.length - b, h.length);
                        break
                    }
                }
                a.setSelectionRange ?
                    a.setSelectionRange(f, a.value.length) : (b = a.createTextRange(), b.moveStart("character", f), b.moveEnd("character", a.value.length), b.select())
            }
        },
        enterCustomDomain: function () {
            g("notMydomain");
            g("mydomainContainer");
            var a = document.getElementById("mydomain");
            k(a);
            f("theloginform");
            f("hint_back_chooser")
        },
        dismissCustomDomain: function () {
            f("notMydomain");
            f("mydomainContainer");
            g("theloginform");
            g("hint_back_chooser");
            f("error")
        }
    }
}();
var LoginHint = function (f) {
    
    function p(b, e) {
        SfdcApp.SfdcSession.getIdentities({
            get: [],
            callback: function (a) {
                h && (window.clearTimeout(h), h = null);
                a = a.identities;
                q = !0;
                if (b) {
                    var d = [],
                        c = f.im,
                        k = f.ic,
                        g;
                    for (g in a)
                        if (a.hasOwnProperty(g)) {
                            var l = a[g];
                            c && !l.mydomain || k && !l.community || (c || k) && f.ur != a[g].identity.instance || (d[g] = l)
                        }
                    g = n(d);
                    LoginHint.Ui.renderEdit(g)
                } else r(a);
                e()
            }
        })
    }

    function n(b) {
        var e = [],
            a = [],
            d;
        for (d in b)
            if (b.hasOwnProperty(d)) {
                var c = b[d];
                c.active ? e.push(c) : a.push(c)
            }
        b = e.sort(function (a, b) {
            return b.lastused -
                a.lastused
        });
        a = a.sort(function (a, b) {
            return b.lastused - a.lastused
        });
        return b.concat(a)
    }

    function r(b) {
        var e = 0,
            a = [],
            d = f.im,
            c = f.ic,
            k;
        for (k in b)
            if (b.hasOwnProperty(k)) {
                var g = b[k];
                d && !g.mydomain || c && !g.community || (d || c) && f.ur != b[k].identity.instance || (e++, a[k] = g)
            }
        b = 1 < e ? n(a) : a;
        LoginHint.Ui.renderIdentities(f.su, f.suo, f.sum, e, b, f.lh, f.le, f.lp, d, c);
        SFDCSessionVars.hintRendered = !0
    }

    function u() {
        var b = document.getElementById("theloginform");
        b && (b.style.display = "block", loader());
        h = null
    }

    function s(b, e) {
        LoginHint.Ui.useIdentity(b,
            e, !1)
    }

    function t(b) {
        p(b, function () { })
    }
    var h = null,
        q = !1;
    return {
        dismissEdit: function () {
            LoginHint.Ui.dismissEdit()
        },
        showChooser: function () {
            LoginHint.Ui.showChooser()
        },
        useNewIdentity: function () {
            LoginHint.Ui.useNewIdentity()
        },
        clearUsr: function () {
            LoginHint.Ui.clearUsr(q)
        },
        showEdit: function () {
            t(!0);
            LoginHint.Ui.showEdit()
        },
        hideLoginForm: function () {
            if (window.setTimeout && !SfdcApp.SfdcSession.disabled) {
                var b = !1;
                try {
                    var e = document.styleSheets,
                        a;
                    for (a in e)
                        if (e.hasOwnProperty && e.hasOwnProperty(a)) {
                            var d = e[a];
                            if (d.cssRules) {
                                d.insertRule ? (d.insertRule("#theloginform { display:none; }", d.cssRules.length), b = !0) : d.addRule && (d.addRule("#theloginform", "display:none;"), b = !0);
                                break
                            }
                        }
                } catch (c) { }
                b && (h = window.setTimeout(u, 1500))
            }
        },
        useIdentity: s,
        getSavedIdentities: t,
        sortResults: n,
        deleteIdentity: function (b, e) {
            SfdcApp.SfdcSession.deleteIdentity({
                oid: b,
                uid: e,
                callback: function () {
                    var a = b + e,
                        d = document.getElementById("edit-" + a),
                        c = d.parentNode;
                    c.removeChild(d);
                    a = document.getElementById("hint_" + a);
                    a.parentNode.removeChild(a);
                    LoginHint.Ui.updateSavedText(f.su, f.suo, f.sum, c.childNodes.length);
                    0 === c.childNodes.length && LoginHint.Ui.nothingToEdit()
                }
            })
        },
        renderIdentities: r,
        blurIdentity: function (b, e, a, d) {
            var c = b.value;
            c && (c == d ? c = null : 100 < c.length && (c = c.substring(0, 100)));
            SfdcApp.SfdcSession.changeDisplay({
                oid: e,
                uid: a,
                display: c
            });
            LoginHint.Ui.blurIdentity(d, b, c, e, a)
        },
        executeActive: function (b, e, a, d, c, f, g, l) {
            debugger;
            if (new Date(a) < new Date) {
                var h = null;
                a = function () {
                    h && (window.clearTimeout(h), h = null);
                    p(!1, function () {
                        if (g) {
                            var a = d;
                            l && (a +="/login");
                            var b = document.getElementById("pqs"),
                                a = b && b.value ? a + (b.value + "\x26") : a + "?";
                            window.location = a + "stbdtimeout\x3d1\x26login_hint\x3d" + encodeURIComponent(c)
                        } else s(c, f)
                    })
                };
                window.setTimeout && (h = window.setTimeout(a, 1E3));
                SfdcApp.SfdcSession.inactive({
                    oid: b,
                    uid: e,
                    callback: a
                })
            } else {
                a = "";
                l && (a += "\x26icom\x3d1");
                var m = document.getElementById("pqs");
                m && (m.value && "?" === m.value.substring(0, 1)) && (a += "\x26q\x3d" + encodeURIComponent(m.value));
                window.location = d + "/secur/loginhint?o\x3d" + b + a + "\x26u\x3d" + e +
                    "\x26un\x3d" + encodeURIComponent(c) + "\x26retURL\x3d" + encodeURIComponent(document.getElementById("login_startUrl").value)
            }
        }
    }
}(SFDCSessionVars);
if (!this.LoginHint) var LoginHint = {};
LoginHint.Ui = function () {
    function y(a) {
        if (a = document.getElementById(a)) a.style.display = "block"
    }

    function z(a) {
        if (a = document.getElementById(a)) a.style.display = "inline"
    }

    function h(a) {
        if (a = document.getElementById(a)) a.style.display = "none"
    }

    function n() {
        r ? z("loginwith") : h("loginwith");
        B ? z("edit") : h("edit");
        p ? z("hints") : h("hints");
        E ? y("another") : h("another");
        s ? (z("chooser"), y("edit")) : (h("chooser"), h("edit"));
        t ? y("error") : h("error");
        k ? (y("mdom_authconfigs"), y("mydomainLink"), z("theloginform")) : (h("mdom_authconfigs"),
            h("mydomainLink"), h("theloginform"));
        var a = document.getElementById("loginthumb");
        a && (a.src = u);
        null !== l && (document.getElementById("username").value = l);
        a = document.getElementById(v);
        k && (a && a.focus) && a.focus()
    }

    function A() {
        r = !0;
        p = !1;
        s = E = !0;
        showMydomainContainer = k = !1;
        B = !0;
        t = !1;
        n()
    }

    function F(a) {
        r = !1;
        p = q;
        s = !1;
        k = !0;
        showMydomainContainer = !1;
        t = !0;
        B = !1;
        l = a ? a : q ? "" : null;
        u = w;
        v = "username";
        n()
    }

    function C(a, d, e) {
        r = !1;
        p = q;
        s = !1;
        k = !0;
        l = a;
        u = d;
        v = "password";
        if ((a = document.getElementById("rememberUn")) && !e) a.checked = !0;
        n()
    }

    function G() {
        s = p = r = !1;
        t = k = !0;
        u = w;
        l = null;
        v = "username";
        n()
    }

    function x(a, d, e) {
        if (a.addEventListener) a.addEventListener(d, e, !1);
        else if (a.attachEvent) a.attachEvent("on" + d, e);
        else throw "Could not add handler " + d;
    }

    function I(a) {
        a = a || window.event;
        a = a.target || a.srcElement;
        a.style.backgroundColor = "#ddd";
        a.style.border = "1px solid #aaa"
    }

    function J(a) {
        a = a || window.event;
        a = a.target || a.srcElement;
        var d = m[a.paramkey];
        LoginHint.blurIdentity(a, d.oid, d.uid, d.username)
    }

    function K(a) {
        a = a || window.event;
        a = m[(a.target ||
            a.srcElement).paramkey];
        LoginHint.deleteIdentity(a.oid, a.uid)
    }

    function L(a) {
        var d;
        d = a.identity.display ? a.identity.display : a.identity.username;
        var e = a.identity.oid + a.identity.uid,
            c = document.createElement("div");
        c.setAttribute("class", "identity edit");
        c.setAttribute("id", "edit-" + e);
        var b = document.createElement("span");
        b.setAttribute("class", "t");
        var g = document.createElement("img");
        g.setAttribute("class", "thumbnail");
        g.setAttribute("title", d);
        g.setAttribute("src", a.identity.thumbnail);
        b.appendChild(g);
        c.appendChild(b);
        var g = document.createElement("div"),
            f = document.createElement("input");
        f.setAttribute("type", "text");
        f.setAttribute("maxlength", "100");
        b = "editp" + e + (new Date).getTime();
        x(f, "focus", I);
        m[b] = {
            oid: a.identity.oid,
            uid: a.identity.uid,
            username: a.identity.username
        };
        f.paramkey = b;
        x(f, "blur", J);
        f.setAttribute("placeholder", a.identity.username);
        f.setAttribute("value", d);
        f.setAttribute("class", "input identityinput");
        f.setAttribute("name", "edithint_" + e);
        f.setAttribute("id", "edithint_" + e);
        g.appendChild(f);
        c.appendChild(g);
        a = document.createElement("div");
        a.setAttribute("class", "deleteHint");
        a.paramkey = b;
        x(a, "click", K);
        c.appendChild(a);
        return c
    }

    function M(a) {
        a = a || window.event;
        a = m[(a.target || a.srcElement).paramkey];
        LoginHint.executeActive(a.oid, a.uid, a.expire, a.instance, a.username, a.thumbnail, a.otherDom, a.community)
    }

    function N(a) {
        a = a || window.event;
        window.location = m[(a.target || a.srcElement).paramkey].redir
    }

    function O(a) {
        a = a || window.event;
        a = m[(a.target || a.srcElement).paramkey];
        LoginHint.useIdentity(a.username, a.thumbnail)
    }

    function H(a, d, e, c) {
        var b = !d && (a.mydomain || a.community);
        d = document.createElement("div");
        e = a.identity.oid + a.identity.uid;
        d.setAttribute("id", "hint_" + e);
        d.setAttribute("class", "identity one");
        c = "hintclick" + e + (new Date).getTime();
        if (a.active) m[c] = {
            oid: a.identity.oid,
            uid: a.identity.uid,
            expire: a.expire,
            instance: a.identity.instance,
            username: a.identity.username,
            thumbnail: a.identity.thumbnail,
            otherDom: b,
            community: a.community
        }, x(d, "click", M);
        else if (b) {
            b = a.identity.instance;
            a.community && (b += "/login");
            var g = document.getElementById("pqs"),
                b = g && g.value ? b + (g.value + "\x26") : b + "?",
                b = b + ("stbdtimeout\x3d1\x26login_hint\x3d" + encodeURIComponent(a.identity.username));
            m[c] = {
                redir: b
            };
            x(d, "click", N)
        } else m[c] = {
            username: a.identity.username,
            thumbnail: a.identity.thumbnail
        }, x(d, "click", O);
        d.paramkey = c;
        b = a.identity.display ? a.identity.display : a.identity.username;
        g = document.createElement("span");
        g.setAttribute("class", "t");
        var f = document.createElement("img");
        f.setAttribute("class", "thumbnail");
        f.setAttribute("title",  b);
        f.setAttribute("src", a.identity.thumbnail);
        f.paramkey = c;
        g.appendChild(f);
        g.paramkey = c;
        d.appendChild(g);
        g = document.createElement("div");
        f = document.createElement("input");
        f.setAttribute("type", "text");
        f.setAttribute("value", b);
        f.setAttribute("class", "input identityinput hinput");
        f.setAttribute("name", "hintdisp_" + e);
        f.setAttribute("id", "hintdisp_" + e);
        f.paramkey = c;
        g.appendChild(f);
        g.paramkey = c;
        d.appendChild(g);
        b = document.createElement("div");
        b.setAttribute("name", "hintbul_" + e);
        b.setAttribute("class",
            "select" + (a.active ? " online" : ""));
        b.innerHTML = "\x26bull;";
        b.paramkey = c;
        d.appendChild(b);
        return d
    }

    function D(a, d, e, c) {
        var b = document.getElementById("hint_back_chooser");
        a && b && (b.innerHTML = 1 == c ? d : e.replace("#p#", c))
    }
    var q = !1,
        r = !1,
        p = !1,
        E = !1,
        s = !1,
        k = !1,
        t = !1,
        B = !1,
        w = "/img/user188.png",
        u = w,
        l = "",
        v = "password",
        m = {};
    return {
        blurIdentity: function (a, d, e, c, b) {
            e || (e = a, d.value = a);
            d.style.backgroundColor = "transparent";
            d.style.border = "0px";
            document.getElementById("hintdisp_" + c + b).value = e
        },
        dismissEdit: function () {
            document.getElementById("logo_wrapper").style.display = "block";
            document.getElementById("manageheader").style.display = "none";
            A()
        },
        showChooser: A,
        useNewIdentity: function () {
            r = !1;
            p = q;
            s = !1;
            k = !0;
            t = !1;
            u = w;
            l = "";
            v = "username";
            n()
        },
        showEdit: function () {
            h("edit");
            h("chooser");
            document.getElementById("logo_wrapper").style.display = "none";
            document.getElementById("loginwith").style.display = "none";
            document.getElementById("another").style.display = "none";
            document.getElementById("manageheader").style.display = "block"
        },
        updateSavedText: D,
        clearUsr: function (a) {
            if (a) l = "", u = w, document.getElementById("clrUsr").style.display = "none", v = "username", p = q, t = !1, n();
            else if (a = document.getElementById("username")) document.getElementById("clrUsr").style.display = "none", a.value = "", a.focus()
        },
        useIdentity: C,
        renderEdit: function (a) {
            for (var d = a.length, e = document.getElementById("editlist") ; e.firstChild;) e.removeChild(e.firstChild);
            for (var c = 0; c < d; c++) e.appendChild(L(a[c]));
            a.length && (document.getElementById("editscale").style.width = "285px")
        },
        renderIdentities: function (a, d, e, c, b, g, f, h, m, p) {
            for (var k = document.getElementById("idlist") ; k.firstChild;) k.removeChild(k.firstChild);
            if (0 === c) q = !1, G();
            else if (1 === c) {
                q = !0;
                c = null;
                for (var l in b) b.hasOwnProperty(l) && (c = b[l]);
                D(a, d, e, 1);
                k.appendChild(H(c, m || p, !0, !0));
                f ? F(c.identity.username) : g || (c.active ? A() : C(c.identity.username, c.identity.thumbnail, !1))
            } else {
                q = !0;
                l = b.length;
                for (var n = 0; n < l; n++) k.appendChild(H(b[n], m || p));
                D(a, d, e, c);
                3 < c && (document.getElementById("idscale").style.width = "285px");
                f ? F() : g || A()
            }
            g && C(h, w, !0)
        },
        nothingToEdit: function () {
            document.getElementById("logo_wrapper").style.display = "block";
            document.getElementById("manageheader").style.display = "none";
            G()
        }
    }
}();