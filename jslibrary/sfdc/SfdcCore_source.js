/*
* This code is for Internal Salesforce use only, and subject to change without notice.
* Customers shouldn't reference this file in any web pages.
*/
function DateUtil() { }
DateUtil.MONTH_NAMES = "January February March April May June July August September October November December Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec".split(" ");
DateUtil.DAY_NAMES = "Sunday Monday Tuesday Wednesday Thursday Friday Saturday Sun Mon Tue Wed Thu Fri Sat".split(" ");
DateUtil.LZ = function (a) {
    return (0 > a || 9 < a ? "" : "0") + a
};
DateUtil.isDate = function (a, c) {
    return 0 === DateUtil.getDateFromFormat(a, c) ? !1 : !0
};
DateUtil.compareDates = function (a, c, b, h) {
    a = DateUtil.getDateFromFormat(a, c);
    b = DateUtil.getDateFromFormat(b, h);
    return 0 === a || 0 === b ? -1 : a > b ? 1 : 0
};
DateUtil.formatDate = function (a, c) {
    c += "";
    var b = "",
        h = 0,
        f = "",
        d = "",
        f = a.getFullYear() + "",
        d = a.getMonth() + 1,
        p = a.getDate(),
        q = a.getDay(),
        k = a.getHours(),
        m = a.getMinutes(),
        l = a.getSeconds(),
        e = {};
    LC.isThaiTHLocale() && (f = f - 0 + LC.BUDDHIST_CAL_OFFSET + "");
    e.y = "" + f;
    e.yyyy = f;
    e.yy = f.substring(2, 4);
    e.M = d;
    e.MM = DateUtil.LZ(d);
    e.MMM = DateUtil.MONTH_NAMES[d - 1];
    e.NNN = DateUtil.MONTH_NAMES[d + 11];
    e.d = p;
    e.dd = DateUtil.LZ(p);
    e.E = DateUtil.DAY_NAMES[q + 7];
    e.EE = DateUtil.DAY_NAMES[q];
    e.H = k;
    e.HH = DateUtil.LZ(k);
    e.h = 0 === k ? 12 : 12 < k ? k - 12 : k;
    e.hh =
        DateUtil.LZ(e.h);
    e.K = 11 < k ? k - 12 : k;
    e.k = k + 1;
    e.KK = DateUtil.LZ(e.K);
    e.kk = DateUtil.LZ(e.k);
    e.a = 11 < k ? DateUtil.getPMSymbol() : DateUtil.getAMSymbol();
    e.m = m;
    e.mm = DateUtil.LZ(m);
    e.s = l;
    for (e.ss = DateUtil.LZ(l); h < c.length; ) {
        f = c.charAt(h);
        for (d = ""; c.charAt(h) == f && h < c.length; ) d += c.charAt(h++);
        b = Sfdc.isDefAndNotNull(e[d]) ? b + e[d] : b + d
    }
    return b
};
DateUtil._isInteger = function (a) {
    for (var c = 0; c < a.length; c++)
        if (-1 == "1234567890".indexOf(a.charAt(c))) return !1;
    return !0
};
DateUtil._getInt = function (a, c, b, h) {
    for (; h >= b; h--) {
        var f = a.substring(c, c + h);
        if (f.length < b) break;
        if (DateUtil._isInteger(f)) return f
    }
    return null
};
DateUtil.getDateFromFormat = function (a, c) {
    a += "";
    c += "";
    for (var b = 0, h = 0, f = "", d = "", p, q, k = new Date, m = k.getFullYear(), l = k.getMonth() + 1, e = 1, g = k.getHours(), r = k.getMinutes(), k = k.getSeconds(), n = ""; h < c.length; ) {
        f = c.charAt(h);
        for (d = ""; c.charAt(h) == f && h < c.length; ) d += c.charAt(h++);
        if ("yyyy" == d || "yy" == d || "y" == d) {
            "yyyy" == d && (p = 2, q = 4);
            "yy" == d && (q = p = 2);
            "y" == d && (p = 2, q = 4);
            m = DateUtil._getInt(a, b, p, q);
            if (null === m) return 0;
            b += m.length;
            2 == m.length && (m = 70 < m ? 1900 + (m - 0) : 2E3 + (m - 0))
        } else if ("MMM" == d || "NNN" == d) {
            for (f = l = 0; f < DateUtil.MONTH_NAMES.length; f++) {
                var s =
                    DateUtil.MONTH_NAMES[f];
                if (a.substring(b, b + s.length).toLowerCase() == s.toLowerCase() && ("MMM" == d || "NNN" == d && 11 < f)) {
                    l = f + 1;
                    12 < l && (l -= 12);
                    b += s.length;
                    break
                }
            }
            if (1 > l || 12 < l) return 0
        } else if ("EE" == d || "E" == d)
            for (f = 0; f < DateUtil.DAY_NAMES.length; f++) {
                if (d = DateUtil.DAY_NAMES[f], a.substring(b, b + d.length).toLowerCase() == d.toLowerCase()) {
                    b += d.length;
                    break
                }
            } else if ("MM" == d || "M" == d) {
            l = DateUtil._getInt(a, b, 1, 2);
            if (null === l || 1 > l || 12 < l) return 0;
            b += l.length
        } else if ("dd" == d || "d" == d) {
            e = DateUtil._getInt(a, b, 1, 2);
            if (null ===
                e || 1 > e || 31 < e) return 0;
            b += e.length
        } else if ("hh" == d || "h" == d) {
            g = DateUtil._getInt(a, b, d.length, 2);
            if (null === g || 1 > g || 12 < g) return 0;
            b += g.length
        } else if ("HH" == d || "H" == d) {
            g = DateUtil._getInt(a, b, d.length, 2);
            if (null === g || 0 > g || 23 < g) return 0;
            b += g.length
        } else if ("KK" == d || "K" == d) {
            g = DateUtil._getInt(a, b, d.length, 2);
            if (null === g || 0 > g || 11 < g) return 0;
            b += g.length
        } else if ("kk" == d || "k" == d) {
            g = DateUtil._getInt(a, b, d.length, 2);
            if (null === g || 1 > g || 24 < g) return 0;
            b += g.length;
            g--
        } else if ("mm" == d || "m" == d) {
            r = DateUtil._getInt(a, b,
                d.length, 2);
            if (null === r || 0 > r || 59 < r) return 0;
            b += r.length
        } else if ("ss" == d || "s" == d) {
            k = DateUtil._getInt(a, b, d.length, 2);
            if (null === k || 0 > k || 59 < k) return 0;
            b += k.length
        } else if ("a" == d) {
            n = DateUtil.getAMSymbol();
            d = DateUtil.getPMSymbol();
            f = a.substring(b, b + n.length);
            s = a.substring(b, b + d.length);
            if (!(f == n || f.toUpperCase() == n))
                if (s == d || s.toUpperCase() == d) n = d;
                else return 0;
            b += n.length
        } else {
            if (a.substring(b, b + d.length) != d) return 0;
            b += d.length
        }
    }
    if (b != a.length) return 0;
    LC.isThaiTHLocale() && (m -= LC.BUDDHIST_CAL_OFFSET);
    if (2 == l)
        if (0 === m % 4 && 0 !== m % 100 || 0 === m % 400) {
            if (29 < e) return 0
        } else if (28 < e) return 0;
    if ((4 == l || 6 == l || 9 == l || 11 == l) && 30 < e) return 0;
    12 > g && n == DateUtil.getPMSymbol() ? g = g - 0 + 12 : 11 < g && n == DateUtil.getAMSymbol() && (g -= 12);
    return (new Date(m, l - 1, e, g, r, k)).getTime()
};
DateUtil.parseDate = function (a) {
    var c = 2 == arguments.length ? arguments[1] : !1;
    generalFormats = "y-M-d;MMM d, y;MMM d,y;y-MMM-d;d-MMM-y;MMM d".split(";");
    monthFirst = "M/d/y M-d-y M.d.y MMM-d M/d M-d M.d".split(" ");
    dateFirst = "d/M/y d-M-y d.M.y d-MMM d/M d-M d.M".split(" ");
    for (var c = ["generalFormats", c ? "dateFirst" : "monthFirst", c ? "monthFirst" : "dateFirst"], b = null, h = 0; h < c.length; h++)
        for (var f = window[c[h]], d = 0; d < f.length; d++)
            if (b = DateUtil.getDateFromFormat(a, f[d]), 0 !== b) return new Date(b);
    return null
};
DateUtil.TIMEZONES = null;
DateUtil.getTimezoneOffset = function () {
    var a = new Date,
        c = 6E4 * a.getTimezoneOffset(),
        b = DateUtil.getTimezoneIndex(a);
    DateUtil.TIMEZONES || (DateUtil.TIMEZONES = DateUtil.getTimezones(a));
    return DateUtil.TIMEZONES[b] + c
};
DateUtil.isBrowserAndSystemTimezoneSame = function () {
    return 0 === DateUtil.getTimezoneOffset()
};
DateUtil.getTimezoneIndex = function (a) {
    return DateUtil.formatDate(a, "yyyyMMdd")
};
DateUtil.getTimezones = function (a) {
    a = Sfdc.Url.generateUrl(UserContext.getUrl("/home/timezones.aspx"), {
        ts: a.getTime()
    });
    return (a = Sfdc.Ajax.request(a, {
        async: !1
    })) ? Sfdc.JSON.parse(a) : null
};
DateUtil.rollDate = function (a, c) {
    var b = new Date(a.getTime());
    b.setDate(b.getDate() + c);
    return b
};
DateUtil.roundDate = function (a) {
    a = new Date(a.getTime());
    a.setHours(0);
    a.setMinutes(0);
    a.setSeconds(0);
    return a
};
DateUtil.getDateStringFromUserLocale = function (a) {
    return DateUtil.formatDate(a, UserContext.dateFormat)
};
DateUtil.getDateFromUserLocale = function (a) {
    return new Date(DateUtil.getDateFromFormat(a, UserContext.dateFormat))
};
DateUtil.getDateTimeStringFromUserLocale = function (a) {
    return DateUtil.formatDate(a, UserContext.dateTimeFormat)
};
DateUtil.getDateTimeFromUserLocale = function (a) {
    return new Date(DateUtil.getDateFromFormat(a, UserContext.dateTimeFormat))
};
DateUtil.getTimeStringFromUserLocale = function (a) {
    return DateUtil.formatDate(a, UserContext.timeFormat)
};
DateUtil.getTimeFromUserLocale = function (a) {
    return new Date(DateUtil.getDateFromFormat(a, UserContext.timeFormat))
};
DateUtil.getAMSymbol = function () {
    return UserContext.initialized ? UserContext.ampm[0] : "AM"
};
DateUtil.getPMSymbol = function () {
    return UserContext.initialized ? UserContext.ampm[1] : "PM"
};
DateUtil.is24Hour = function (a) {
    return -1 < a.indexOf("k")
};
DateUtil.hasAMPM = function (a) {
    return -1 < a.indexOf("a")
};
DateUtil.equals = function (a, c) {
    return a && c && 0 === DateUtil.compare(a, c)
};
DateUtil.lessThan = function (a, c) {
    return 0 > DateUtil.compare(a, c)
};
DateUtil.greaterThan = function (a, c) {
    return 0 < DateUtil.compare(a, c)
};
DateUtil.compare = function (a, c) {
    return a.getFullYear() != c.getFullYear() ? a.getFullYear() - c.getFullYear() : a.getMonth() != c.getMonth() ? a.getMonth() - c.getMonth() : a.getDate() - c.getDate()
};
DateUtil.separators = ["/", "-", "."];
DateUtil.checkYear = function (a, c) {
    var b = a.value.toLowerCase();
    if (b = DateUtil.getCheckYearValue(b))
        if (a.value = b, c && a.onchange) a.onchange()
};
DateUtil.getCheckYearValue = function (a) {
    if (!(a && 0 < a.length)) return null;
    for (var c = null, b = 0; b < DateUtil.separators.length; b++)
        if (-1 != a.indexOf(DateUtil.separators[b])) {
            c = DateUtil.separators[b];
            break
        }
    b = DateUtil.getDateTimeFromUserLocale(UserContext.today);
    if (c)
        if (b.setDate(1), a = a.split(c), 2 == a.length) {
            if (!isNaN(parseInt(a[0], 10)) && !isNaN(parseInt(a[1], 10))) return b.setMonth(parseInt(a[0], 10) - 1), b.setDate(parseInt(a[1], 10)), DateUtil.getDateStringFromUserLocale(b)
        } else {
            if (3 == a.length && !isNaN(parseInt(a[2],
                10)) && !isNaN(parseInt(a[0], 10)) && !isNaN(parseInt(a[1], 10))) {
                var h = parseInt(a[2], 10);
                if (1 > h / 1E3) return b.setMonth(parseInt(a[0], 10) - 1), b.setDate(parseInt(a[1], 10)), 60 <= h && 100 > h ? b.setFullYear(h + 1900) : b.setFullYear(h + 2E3), DateUtil.getDateStringFromUserLocale(b);
                if ("/" != c) return a[0] + "/" + a[1] + "/" + a[2]
            }
        } else return DateUtil.getEvaluateShortcutValue(a)
};
DateUtil.DAY_SHORTCUTS = "Sun Mon Tue Wed Thu Fri Sat".split(" ");
DateUtil.evaluateShortcut = function (a, c) {
    var b = a.value.toLowerCase();
    if (b = DateUtil.getEvaluateShortcutValue(b))
        if (a.value = b, c && a.onchange) a.onchange()
};
DateUtil.getEvaluateShortcutValue = function (a) {
    if (!(a && 0 < a.length)) return null;
    var c = DateUtil.getDateTimeFromUserLocale(UserContext.today);
    if (0 === a.indexOf("tod")) return DateUtil.getDateStringFromUserLocale(c);
    if (0 === a.indexOf("yes")) return c.setDate(c.getDate() - 1), DateUtil.getDateStringFromUserLocale(c);
    if (0 === a.indexOf("tom")) return c.setDate(c.getDate() + 1), DateUtil.getDateStringFromUserLocale(c);
    if (3 <= a.length)
        for (var b = 0; b < DateUtil.DAY_SHORTCUTS.length; b++)
            if (0 === a.indexOf(DateUtil.DAY_SHORTCUTS[b].toLowerCase())) return a =
                b - c.getDay(), 0 > a && (a += 7), c.setDate(c.getDate() + a), DateUtil.getDateStringFromUserLocale(c);
    return null
};
DateUtil.differenceInMinutes = function (a, c) {
    var b = c.getTime() - a.getTime();
    return Math.round(b / 6E4)
};
DateUtil.getDateFromValue = function (a, c) {
    var b = c ? DateUtil.getDateFromFormat(a, UserContext.dateTimeFormat) : DateUtil.getDateFromFormat(a, UserContext.dateFormat);
    return 0 !== b ? new Date(b) : null
};
Array.isArray || (Array.isArray = function (a) {
    return "[object Array]" === Object.prototype.toString.call(a)
});
Date.now || (Date.now = function () {
    return +new Date
});
Error.prototype.toString = function () {
    var a = this.message || this.description;
    return void 0 === a || null === a ? "Unknown Error." : a + ""
};
Function.prototype.bind || (Function.prototype.bind = function (a) {
    var b = this,
        c = Array.prototype.slice.call(arguments, 1);
    return function () {
        return b.apply(a, c.concat(Array.prototype.slice.call(arguments, 0)))
    }
});
this.Node || (this.Node = {
    ELEMENT_NODE: 1,
    ATTRIBUTE_NODE: 2,
    TEXT_NODE: 3,
    CDATA_SECTION_NODE: 4,
    ENTITY_REFERENCE_NODE: 5,
    ENTITY_NODE: 6,
    PROCESSING_INSTRUCTION_NODE: 7,
    COMMENT_NODE: 8,
    DOCUMENT_NODE: 9,
    DOCUMENT_TYPE_NODE: 10,
    DOCUMENT_FRAGMENT_NODE: 11,
    NOTATION_NODE: 12
});
Object.keys || (Object.keys = function () {
    var e = Object.prototype.hasOwnProperty,
        f = !{
            toString: null
        }.propertyIsEnumerable("toString"),
        c = "toString toLocaleString valueOf hasOwnProperty isPrototypeOf propertyIsEnumerable constructor".split(" "),
        g = c.length;
    return function (b) {
        if ("object" !== typeof b && "function" !== typeof b || null === b) throw new TypeError("Object.keys called on non-object");
        var d = [],
            a;
        for (a in b) e.call(b, a) && d.push(a);
        if (f)
            for (a = 0; a < g; a++) e.call(b, c[a]) && d.push(c[a]);
        return d
    }
} ());
String.prototype.trim || (String.prototype.trim = function (a) {
    return Sfdc.String.trim(this, a)
});
if ("undefined" === typeof Mustache) var Mustache;
(function (r) {
    "undefined" !== typeof module && module.exports ? module.exports = r : "function" === typeof define ? define(r) : Mustache = r
})(function () {
    function r(a) {
        return a.replace(/[\-\[\]{}()*+?.,\\\^$|#\s]/g, "\\$\x26")
    }

    function t(a) {
        this.tail = this.string = a;
        this.pos = 0
    }

    function n(a, b) {
        this.view = a;
        this.parent = b;
        this.clearCache()
    }

    function h() {
        this.clearCache()
    }

    function y(a) {
        for (var b = a[3], c = b, d;
            (d = a[4]) && d.length; ) a = d[d.length - 1], c = a[3];
        return [b, c]
    }

    function u(a) {
        function b(a, b, g) {
            if (!c[a]) {
                var e = u(b);
                c[a] = function (a,
                    b) {
                    return e(a, b, g)
                }
            }
            return c[a]
        }
        var c = {};
        return function (c, f, g) {
            for (var e = "", m, l, k = 0, h = a.length; k < h; ++k) switch (m = a[k], m[0]) {
                case "#":
                    l = g.slice.apply(g, y(m));
                    e += c._section(m[1], f, l, b(k, m[4], g));
                    break;
                case "^":
                    e += c._inverted(m[1], f, b(k, m[4], g));
                    break;
                case "\x3e":
                    e += c._partial(m[1], f);
                    break;
                case "\x26":
                    e += c._name(m[1], f);
                    break;
                case "name":
                    e += c._escaped(m[1], f);
                    break;
                case "text":
                    e += m[1]
            }
            return e
        }
    }

    function v(a) {
        if (2 !== a.length) throw Error("Invalid tags: " + a.join(" "));
        return [RegExp(r(a[0]) + "\\s*"), RegExp("\\s*" +
            r(a[1]))]
    }
    var l = {
        name: "mustache.js",
        version: "0.7.0",
        tags: ["{{", "}}"]
    };
    l.Scanner = t;
    l.Context = n;
    l.Writer = h;
    var z = /\s*/,
        A = /\s+/,
        B = /\S/,
        w = /\s*=/,
        C = /\s*\}/,
        D = /#|\^|\/|>|\{|&|=|!/,
        x = Array.isArray || function (a) {
            return "[object Array]" === Object.prototype.toString.call(a)
        },
        E = {
            "\x26": "\x26amp;",
            "\x3c": "\x26lt;",
            "\x3e": "\x26gt;",
            '"': "\x26quot;",
            "'": "\x26#39;",
            "/": "\x26#x2F;"
        };
    l.escape = function (a) {
        return String(a).replace(/[&<>"'\/]/g, function (a) {
            return E[a]
        })
    };
    t.prototype.eos = function () {
        return "" === this.tail
    };
    t.prototype.scan = function (a) {
        return (a = this.tail.match(a)) && 0 === a.index ? (this.tail = this.tail.substring(a[0].length), this.pos += a[0].length, a[0]) : ""
    };
    t.prototype.scanUntil = function (a) {
        var b = this.tail.search(a);
        switch (b) {
            case -1:
                a = this.tail;
                this.pos += this.tail.length;
                this.tail = "";
                break;
            case 0:
                a = "";
                break;
            default:
                a = this.tail.substring(0, b), this.tail = this.tail.substring(b), this.pos += b
        }
        return a
    };
    n.make = function (a) {
        return a instanceof n ? a : new n(a)
    };
    n.prototype.clearCache = function () {
        this._cache = {}
    };
    n.prototype.push =
        function (a) {
            return new n(a, this)
        };
    n.prototype.lookup = function (a) {
        var b = this._cache[a];
        if (!b) {
            if ("." === a) b = this.view;
            else
                for (var c = this; c; ) {
                    if (0 < a.indexOf("."))
                        for (var d = a.split("."), f = 0, b = c.view; b && f < d.length; ) b = b[d[f++]];
                    else b = c.view[a]; if (null != b) break;
                    c = c.parent
                }
            this._cache[a] = b
        }
        "function" === typeof b && (b = b.call(this.view));
        return b
    };
    h.prototype.clearCache = function () {
        this._cache = {};
        this._partialCache = {}
    };
    h.prototype.compile = function (a, b) {
        var c = this._cache[a];
        c || (c = l.parse(a, b), c = this._cache[a] =
            this.compileTokens(c, a));
        return c
    };
    h.prototype.compilePartial = function (a, b, c) {
        b = this.compile(b, c);
        return this._partialCache[a] = b
    };
    h.prototype.compileTokens = function (a, b) {
        var c = u(a),
            d = this;
        return function (a, g) {
            if (g)
                if ("function" === typeof g) d._loadPartial = g;
                else
                    for (var e in g) d.compilePartial(e, g[e]);
            return c(d, n.make(a), b)
        }
    };
    h.prototype.render = function (a, b, c) {
        return this.compile(a)(b, c)
    };
    h.prototype._section = function (a, b, c, d) {
        a = b.lookup(a);
        switch (typeof a) {
            case "object":
                if (x(a)) {
                    c = "";
                    for (var f = 0,
                        g = a.length; f < g; ++f) c += d(this, b.push(a[f]));
                    return c
                }
                return a ? d(this, b.push(a)) : "";
            case "function":
                var e = this;
                d = a.call(b.view, c, function (a) {
                    return e.render(a, b)
                });
                return null != d ? d : "";
            default:
                if (a) return d(this, b)
        }
        return ""
    };
    h.prototype._inverted = function (a, b, c) {
        a = b.lookup(a);
        return !a || x(a) && 0 === a.length ? c(this, b) : ""
    };
    h.prototype._partial = function (a, b) {
        !(a in this._partialCache) && this._loadPartial && this.compilePartial(a, this._loadPartial(a));
        var c = this._partialCache[a];
        return c ? c(b) : ""
    };
    h.prototype._name =
        function (a, b) {
            var c = b.lookup(a);
            "function" === typeof c && (c = c.call(b.view));
            return null == c ? "" : String(c)
        };
    h.prototype._escaped = function (a, b) {
        return l.escape(this._name(a, b))
    };
    l.parse = function (a, b) {
        b = b || l.tags;
        for (var c = v(b), d = new t(a), f = [], g = [], e = !1, m = !1, h, k, p; !d.eos(); ) {
            h = d.pos;
            if (p = d.scanUntil(c[0]))
                for (var n = 0, s = p.length; n < s; ++n)
                    if (k = p.charAt(n), RegExp.prototype.test.call(B, k) ? m = !0 : g.push(f.length), f.push(["text", k, h, h + 1]), h += 1, "\n" === k) {
                        if (e && !m)
                            for (; g.length; ) f.splice(g.pop(), 1);
                        else g = [];
                        m = e = !1
                    }
            h =
                d.pos;
            if (!d.scan(c[0])) break;
            e = !0;
            k = d.scan(D) || "name";
            d.scan(z);
            "\x3d" === k ? (p = d.scanUntil(w), d.scan(w), d.scanUntil(c[1])) : "{" === k ? (p = RegExp("\\s*" + r("}" + b[1])), p = d.scanUntil(p), d.scan(C), d.scanUntil(c[1]), k = "\x26") : p = d.scanUntil(c[1]);
            if (!d.scan(c[1])) throw Error("Unclosed tag at " + d.pos);
            f.push([k, p, h, d.pos]);
            if ("name" === k || "{" === k || "\x26" === k) m = !0;
            "\x3d" === k && (b = p.split(A), c = v(b))
        }
        for (var c = f, q, f = [], g = 0; g < c.length; ++g) d = c[g], q && "text" === q[0] && "text" === d[0] ? (q[1] += d[1], q[3] = d[3]) : (q = d, f.push(d));
        q = f;
        e = c = [];
        d = [];
        for (g = 0; g < q.length; ++g) switch (f = q[g], f[0]) {
            case "#":
            case "^":
                f[4] = [];
                d.push(f);
                e.push(f);
                e = f[4];
                break;
            case "/":
                if (0 === d.length) throw Error("Unopened section: " + f[1]);
                e = d.pop();
                if (e[1] !== f[1]) throw Error("Unclosed section: " + e[1]);
                e = 0 < d.length ? d[d.length - 1][4] : c;
                break;
            default:
                e.push(f)
        }
        if (e = d.pop()) throw Error("Unclosed section: " + e[1]);
        return c
    };
    var s = new h;
    l.clearCache = function () {
        return s.clearCache()
    };
    l.compile = function (a, b) {
        return s.compile(a, b)
    };
    l.compilePartial = function (a, b, c) {
        return s.compilePartial(a,
            b, c)
    };
    l.compileTokens = function (a, b) {
        return s.compileTokens(a, b)
    };
    l.render = function (a, b, c) {
        return s.render(a, b, c)
    };
    l.to_html = function (a, b, c, d) {
        a = l.render(a, b, c);
        if ("function" === typeof d) d(a);
        else return a
    };
    return l
} ());
(function () {
    function C(a, b, c, d, f, e) {
        f = 0;
        for (var h = d.length; f < h; f++) {
            var g = d[f];
            if (g) {
                for (var k = !1, g = g[a]; g; ) {
                    if (g.sizcache === c) {
                        k = d[g.sizset];
                        break
                    }
                    1 === g.nodeType && !e && (g.sizcache = c, g.sizset = f);
                    if (g.nodeName.toLowerCase() === b) {
                        k = g;
                        break
                    }
                    g = g[a]
                }
                d[f] = k
            }
        }
    }

    function D(a, b, c, d, f, e) {
        f = 0;
        for (var h = d.length; f < h; f++) {
            var g = d[f];
            if (g) {
                for (var l = !1, g = g[a]; g; ) {
                    if (g.sizcache === c) {
                        l = d[g.sizset];
                        break
                    }
                    if (1 === g.nodeType)
                        if (e || (g.sizcache = c, g.sizset = f), "string" !== typeof b) {
                            if (g === b) {
                                l = !0;
                                break
                            }
                        } else if (0 < k.filter(b, [g]).length) {
                            l = g;
                            break
                        }
                    g = g[a]
                }
                d[f] = l
            }
        }
    }
    var A = /((?:\((?:\([^()]+\)|[^()]+)+\)|\[(?:\[[^\[\]]*\]|['"][^'"]*['"]|[^\[\]'"]+)+\]|\\.|[^ >+~,(\[\\]+)+|[>+~])(\s*,\s*)?((?:.|\r|\n)*)/g,
        B = 0,
        E = Object.prototype.toString,
        x = !1,
        F = !0,
        r = /\\/g,
        y = /\W/;
    [0, 0].sort(function () {
        F = !1;
        return 0
    });
    var k = function (a, b, c, d) {
        c = c || [];
        var f = b = b || document;
        if (1 !== b.nodeType && 9 !== b.nodeType) return [];
        if (!a || "string" !== typeof a) return c;
        var e, h, g, n, v, s = !0,
            p = k.isXML(b),
            m = [],
            r = a;
        do
            if (A.exec(""), e = A.exec(r))
                if (r = e[3], m.push(e[1]), e[2]) {
                    n =
                        e[3];
                    break
                }
        while (e);
        if (1 < m.length && H.exec(a))
            if (2 === m.length && l.relative[m[0]]) h = G(m[0] + m[1], b);
            else
                for (h = l.relative[m[0]] ? [b] : k(m.shift(), b); m.length; ) a = m.shift(), l.relative[a] && (a += m.shift()), h = G(a, h);
        else if (!d && (1 < m.length && 9 === b.nodeType && !p && l.match.ID.test(m[0]) && !l.match.ID.test(m[m.length - 1])) && (e = k.find(m.shift(), b, p), b = e.expr ? k.filter(e.expr, e.set)[0] : e.set[0]), b) {
            e = d ? {
                expr: m.pop(),
                set: q(d)
            } : k.find(m.pop(), 1 === m.length && ("~" === m[0] || "+" === m[0]) && b.parentNode ? b.parentNode : b, p);
            h = e.expr ?
                k.filter(e.expr, e.set) : e.set;
            for (0 < m.length ? g = q(h) : s = !1; m.length; ) {
                e = v = m.pop();
                l.relative[v] ? e = m.pop() : v = "";
                if (null === e || void 0 === e) e = b;
                l.relative[v](g, e, p)
            }
        } else g = [];
        g || (g = h);
        g || k.error(v || a);
        if ("[object Array]" === E.call(g))
            if (s)
                if (b && 1 === b.nodeType)
                    for (a = 0; null !== g[a] && void 0 !== g[a]; a++) g[a] && (!0 === g[a] || 1 === g[a].nodeType && k.contains(b, g[a])) && c.push(h[a]);
                else
                    for (a = 0; null !== g[a] && void 0 !== g[a]; a++) g[a] && 1 === g[a].nodeType && c.push(h[a]);
            else c.push.apply(c, g);
        else q(g, c);
        n && (k(n, f, c, d), k.uniqueSort(c));
        return c
    };
    k.uniqueSort = function (a) {
        if (z && (x = F, a.sort(z), x))
            for (var b = 1; b < a.length; b++) a[b] === a[b - 1] && a.splice(b--, 1);
        return a
    };
    k.matches = function (a, b) {
        return k(a, null, null, b)
    };
    k.matchesSelector = function (a, b) {
        return 0 < k(b, null, null, [a]).length
    };
    k.find = function (a, b, c) {
        var d;
        if (!a) return [];
        for (var f = 0, e = l.order.length; f < e; f++) {
            var h, g = l.order[f];
            if (h = l.leftMatch[g].exec(a)) {
                var k = h[1];
                h.splice(1, 1);
                if ("\\" !== k.substr(k.length - 1) && (h[1] = (h[1] || "").replace(r, ""), d = l.find[g](h, b, c))) {
                    a = a.replace(l.match[g],
                        "");
                    break
                }
            }
        }
        d || (d = "undefined" !== typeof b.getElementsByTagName ? b.getElementsByTagName("*") : []);
        return {
            set: d,
            expr: a
        }
    };
    k.filter = function (a, b, c, d) {
        for (var f, e, h = a, g = [], n = b, q = b && b[0] && k.isXML(b[0]); a && b.length; ) {
            for (var s in l.filter)
                if (f = l.leftMatch[s].exec(a), null !== f && void 0 !== f && f[2]) {
                    var p, m, r = l.filter[s],
                        u = f[1];
                    e = !1;
                    f.splice(1, 1);
                    if ("\\" !== u.substr(u.length - 1)) {
                        n === g && (g = []);
                        if (l.preFilter[s])
                            if (f = l.preFilter[s](f, n, c, g, d, q)) {
                                if (!0 === f) continue
                            } else e = p = !0;
                        if (f)
                            for (u = 0; null !== (m = n[u]) && void 0 !==
                                m; u++)
                                if (m) {
                                    p = r(m, f, u, n);
                                    var t = d ^ !!p;
                                    c && null !== p && void 0 !== p ? t ? e = !0 : n[u] = !1 : t && (g.push(m), e = !0)
                                }
                        if (void 0 !== p) {
                            c || (n = g);
                            a = a.replace(l.match[s], "");
                            if (!e) return [];
                            break
                        }
                    }
                }
            if (a === h)
                if (null === e || void 0 === e) k.error(a);
                else break;
            h = a
        }
        return n
    };
    k.error = function (a) {
        throw "Syntax error, unrecognized expression: " + a;
    };
    var l = k.selectors = {
        order: ["ID", "NAME", "TAG"],
        match: {
            ID: /#((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,
            CLASS: /\.((?:[\w\u00c0-\uFFFF\-]|\\.)+)/,
            NAME: /\[name=['"]*((?:[\w\u00c0-\uFFFF\-]|\\.)+)['"]*\]/,
            ATTR: /\[\s*((?:[\w\u00c0-\uFFFF\-]|\\.)+)\s*(?:(\S?=)\s*(?:(['"])(.*?)\3|(#?(?:[\w\u00c0-\uFFFF\-]|\\.)*)|)|)\s*\]/,
            TAG: /^((?:[\w\u00c0-\uFFFF\*\-]|\\.)+)/,
            CHILD: /:(only|nth|last|first)-child(?:\(\s*(even|odd|(?:[+\-]?\d+|(?:[+\-]?\d*)?n\s*(?:[+\-]\s*\d+)?))\s*\))?/,
            POS: /:(nth|eq|gt|lt|first|last|even|odd)(?:\((\d*)\))?(?=[^\-]|$)/,
            PSEUDO: /:((?:[\w\u00c0-\uFFFF\-]|\\.)+)(?:\((['"]?)((?:\([^\)]+\)|[^\(\)]*)+)\2\))?/
        },
        leftMatch: {},
        attrMap: {
            "class": "className",
            "for": "htmlFor"
        },
        attrHandle: {
            href: function (a) {
                return a.getAttribute("href")
            }
        },
        relative: {
            "+": function (a, b) {
                var c = "string" === typeof b,
                        d = c && !y.test(b),
                        c = c && !d;
                d && (b = b.toLowerCase());
                for (var d = 0, f = a.length, e; d < f; d++)
                    if (e = a[d]) {
                        for (;
                                (e = e.previousSibling) && 1 !== e.nodeType; );
                        a[d] = c || e && e.nodeName.toLowerCase() === b ? e || !1 : e === b
                    }
                c && k.filter(b, a, !0)
            },
            "\x3e": function (a, b) {
                var c, d = "string" === typeof b,
                        f = 0,
                        e = a.length;
                if (d && !y.test(b))
                    for (b = b.toLowerCase(); f < e; f++) {
                        if (c = a[f]) c = c.parentNode, a[f] = c.nodeName.toLowerCase() === b ? c : !1
                    } else {
                    for (; f < e; f++) (c = a[f]) && (a[f] = d ? c.parentNode : c.parentNode === b);
                    d && k.filter(b, a, !0)
                }
            },
            "": function (a, b, c) {
                var d, f = B++,
                        e = D;
                "string" === typeof b &&
                        !y.test(b) && (d = b = b.toLowerCase(), e = C);
                e("parentNode", b, f, a, d, c)
            },
            "~": function (a, b, c) {
                var d, f = B++,
                        e = D;
                "string" === typeof b && !y.test(b) && (d = b = b.toLowerCase(), e = C);
                e("previousSibling", b, f, a, d, c)
            }
        },
        find: {
            ID: function (a, b, c) {
                if ("undefined" !== typeof b.getElementById && !c) return (a = b.getElementById(a[1])) && a.parentNode ? [a] : []
            },
            NAME: function (a, b) {
                if ("undefined" !== typeof b.getElementsByName) {
                    for (var c = [], d = b.getElementsByName(a[1]), f = 0, e = d.length; f < e; f++) d[f].getAttribute("name") === a[1] && c.push(d[f]);
                    return 0 ===
                            c.length ? null : c
                }
            },
            TAG: function (a, b) {
                if ("undefined" !== typeof b.getElementsByTagName) return b.getElementsByTagName(a[1])
            }
        },
        preFilter: {
            CLASS: function (a, b, c, d, f, e) {
                a = " " + a[1].replace(r, "") + " ";
                if (e) return a;
                e = 0;
                for (var h; null !== (h = b[e]) && void 0 !== h; e++) h && (f ^ (h.className && 0 <= (" " + h.className + " ").replace(/[\t\n\r]/g, " ").indexOf(a)) ? c || d.push(h) : c && (b[e] = !1));
                return !1
            },
            ID: function (a) {
                return a[1].replace(r, "")
            },
            TAG: function (a, b) {
                return a[1].replace(r, "").toLowerCase()
            },
            CHILD: function (a) {
                if ("nth" === a[1]) {
                    a[2] ||
                            k.error(a[0]);
                    a[2] = a[2].replace(/^\+|\s*/g, "");
                    var b = /(-?)(\d*)(?:n([+\-]?\d*))?/.exec("even" === a[2] && "2n" || "odd" === a[2] && "2n+1" || !/\D/.test(a[2]) && "0n+" + a[2] || a[2]);
                    a[2] = b[1] + (b[2] || 1) - 0;
                    a[3] = b[3] - 0
                } else a[2] && k.error(a[0]);
                a[0] = B++;
                return a
            },
            ATTR: function (a, b, c, d, f, e) {
                b = a[1] = a[1].replace(r, "");
                !e && l.attrMap[b] && (a[1] = l.attrMap[b]);
                a[4] = (a[4] || a[5] || "").replace(r, "");
                "~\x3d" === a[2] && (a[4] = " " + a[4] + " ");
                return a
            },
            PSEUDO: function (a, b, c, d, f) {
                if ("not" === a[1])
                    if (1 < (A.exec(a[3]) || "").length || /^\w/.test(a[3])) a[3] =
                            k(a[3], null, null, b);
                    else return a = k.filter(a[3], b, c, 1 ^ f), c || d.push.apply(d, a), !1;
                else if (l.match.POS.test(a[0]) || l.match.CHILD.test(a[0])) return !0;
                return a
            },
            POS: function (a) {
                a.unshift(!0);
                return a
            }
        },
        filters: {
            enabled: function (a) {
                return !1 === a.disabled && "hidden" !== a.type
            },
            disabled: function (a) {
                return !0 === a.disabled
            },
            checked: function (a) {
                return !0 === a.checked
            },
            selected: function (a) {
                a.parentNode.selectedIndex;
                return !0 === a.selected
            },
            parent: function (a) {
                return !!a.firstChild
            },
            empty: function (a) {
                return !a.firstChild
            },
            has: function (a, b, c) {
                return !!k(c[3], a).length
            },
            header: function (a) {
                return /h\d/i.test(a.nodeName)
            },
            text: function (a) {
                return "text" === a.type
            },
            radio: function (a) {
                return "radio" === a.type
            },
            checkbox: function (a) {
                return "checkbox" === a.type
            },
            file: function (a) {
                return "file" === a.type
            },
            password: function (a) {
                return "password" === a.type
            },
            submit: function (a) {
                return "submit" === a.type
            },
            image: function (a) {
                return "image" === a.type
            },
            reset: function (a) {
                return "reset" === a.type
            },
            button: function (a) {
                return "button" === a.type || "button" === a.nodeName.toLowerCase()
            },
            input: function (a) {
                return /input|select|textarea|button/i.test(a.nodeName)
            }
        },
        setFilters: {
            first: function (a, b) {
                return 0 === b
            },
            last: function (a, b, c, d) {
                return b === d.length - 1
            },
            even: function (a, b) {
                return 0 === b % 2
            },
            odd: function (a, b) {
                return 1 === b % 2
            },
            lt: function (a, b, c) {
                return b < c[3] - 0
            },
            gt: function (a, b, c) {
                return b > c[3] - 0
            },
            nth: function (a, b, c) {
                return c[3] - 0 === b
            },
            eq: function (a, b, c) {
                return c[3] - 0 === b
            }
        },
        filter: {
            PSEUDO: function (a, b, c, d) {
                var f = b[1],
                        e = l.filters[f];
                if (e) return e(a, c, b, d);
                if ("contains" === f) return 0 <= (a.textContent ||
                        a.innerText || k.getText([a]) || "").indexOf(b[3]);
                if ("not" === f) {
                    b = b[3];
                    c = 0;
                    for (d = b.length; c < d; c++)
                        if (b[c] === a) return !1;
                    return !0
                }
                k.error(f)
            },
            CHILD: function (a, b) {
                var c = b[1],
                        d = a;
                switch (c) {
                    case "only":
                    case "first":
                        for (; d = d.previousSibling; )
                            if (1 === d.nodeType) return !1;
                        if ("first" === c) return !0;
                        d = a;
                    case "last":
                        for (; d = d.nextSibling; )
                            if (1 === d.nodeType) return !1;
                        return !0;
                    case "nth":
                        var c = b[2],
                                f = b[3];
                        if (1 === c && 0 === f) return !0;
                        var e = b[0],
                                h = a.parentNode;
                        if (h && (h.sizcache !== e || !a.nodeIndex)) {
                            for (var g = 0, d = h.firstChild; d; d =
                                    d.nextSibling) 1 === d.nodeType && (d.nodeIndex = ++g);
                            h.sizcache = e
                        }
                        d = a.nodeIndex - f;
                        return 0 === c ? 0 === d : 0 === d % c && 0 <= d / c
                }
            },
            ID: function (a, b) {
                return 1 === a.nodeType && a.getAttribute("id") === b
            },
            TAG: function (a, b) {
                return "*" === b && 1 === a.nodeType || a.nodeName.toLowerCase() === b
            },
            CLASS: function (a, b) {
                return -1 < (" " + (a.className || a.getAttribute("class")) + " ").indexOf(b)
            },
            ATTR: function (a, b) {
                var c = b[1],
                        c = l.attrHandle[c] ? l.attrHandle[c](a) : null !== a[c] && void 0 !== a[c] ? a[c] : a.getAttribute(c),
                        d = c + "",
                        f = b[2],
                        e = b[4];
                return null ===
                        c || void 0 === c ? "!\x3d" === f : "\x3d" === f ? d === e : "*\x3d" === f ? 0 <= d.indexOf(e) : "~\x3d" === f ? 0 <= (" " + d + " ").indexOf(e) : !e ? d && !1 !== c : "!\x3d" === f ? d !== e : "^\x3d" === f ? 0 === d.indexOf(e) : "$\x3d" === f ? d.substr(d.length - e.length) === e : "|\x3d" === f ? d === e || d.substr(0, e.length + 1) === e + "-" : !1
            },
            POS: function (a, b, c, d) {
                var f = l.setFilters[b[2]];
                if (f) return f(a, c, b, d)
            }
        }
    },
        H = l.match.POS,
        I = function (a, b) {
            return "\\" + (b - 0 + 1)
        },
        t;
    for (t in l.match) l.match[t] = RegExp(l.match[t].source + /(?![^\[]*\])(?![^\(]*\))/.source), l.leftMatch[t] = RegExp(/(^(?:.|\r|\n)*?)/.source +
        l.match[t].source.replace(/\\(\d+)/g, I));
    var q = function (a, b) {
        a = Array.prototype.slice.call(a, 0);
        return b ? (b.push.apply(b, a), b) : a
    };
    try {
        Array.prototype.slice.call(document.documentElement.childNodes, 0)[0].nodeType
    } catch (J) {
        q = function (a, b) {
            var c = 0,
                d = b || [];
            if ("[object Array]" === E.call(a)) Array.prototype.push.apply(d, a);
            else if ("number" === typeof a.length)
                for (var f = a.length; c < f; c++) d.push(a[c]);
            else
                for (; a[c]; c++) d.push(a[c]);
            return d
        }
    }
    var z, w;
    document.documentElement.compareDocumentPosition ? z = function (a,
        b) {
        return a === b ? (x = !0, 0) : !a.compareDocumentPosition || !b.compareDocumentPosition ? a.compareDocumentPosition ? -1 : 1 : a.compareDocumentPosition(b) & 4 ? -1 : 1
    } : (z = function (a, b) {
        var c, d, f = [],
            e = [];
        c = a.parentNode;
        d = b.parentNode;
        var h = c;
        if (a === b) return x = !0, 0;
        if (c === d) return w(a, b);
        if (c) {
            if (!d) return 1
        } else return -1;
        for (; h; ) f.unshift(h), h = h.parentNode;
        for (h = d; h; ) e.unshift(h), h = h.parentNode;
        c = f.length;
        d = e.length;
        for (h = 0; h < c && h < d; h++)
            if (f[h] !== e[h]) return w(f[h], e[h]);
        return h === c ? w(a, e[h], -1) : w(f[h], b, 1)
    }, w = function (a,
        b, c) {
        if (a === b) return c;
        for (a = a.nextSibling; a; ) {
            if (a === b) return -1;
            a = a.nextSibling
        }
        return 1
    });
    k.getText = function (a) {
        for (var b = "", c, d = 0; a[d]; d++) c = a[d], 3 === c.nodeType || 4 === c.nodeType ? b += c.nodeValue : 8 !== c.nodeType && (b += k.getText(c.childNodes));
        return b
    };
    (function () {
        var a = document.createElement("div"),
            b = "script" + (new Date).getTime(),
            c = document.documentElement;
        a.innerHTML = "\x3ca name\x3d'" + b + "'/\x3e";
        c.insertBefore(a, c.firstChild);
        document.getElementById(b) && (l.find.ID = function (a, b, c) {
            if ("undefined" !==
                typeof b.getElementById && !c) return (b = b.getElementById(a[1])) ? b.id === a[1] || "undefined" !== typeof b.getAttributeNode && b.getAttributeNode("id").nodeValue === a[1] ? [b] : void 0 : []
        }, l.filter.ID = function (a, b) {
            var c = "undefined" !== typeof a.getAttributeNode && a.getAttributeNode("id");
            return 1 === a.nodeType && c && c.nodeValue === b
        });
        c.removeChild(a);
        c = a = null
    })();
    (function () {
        var a = document.createElement("div");
        a.appendChild(document.createComment(""));
        0 < a.getElementsByTagName("*").length && (l.find.TAG = function (a, c) {
            var d =
                c.getElementsByTagName(a[1]);
            if ("*" === a[1]) {
                for (var f = [], e = 0; d[e]; e++) 1 === d[e].nodeType && f.push(d[e]);
                d = f
            }
            return d
        });
        a.innerHTML = "\x3ca href\x3d'#'\x3e\x3c/a\x3e";
        a.firstChild && ("undefined" !== typeof a.firstChild.getAttribute && "#" !== a.firstChild.getAttribute("href")) && (l.attrHandle.href = function (a) {
            return a.getAttribute("href", 2)
        });
        a = null
    })();
    document.querySelectorAll && function () {
        var a = k,
            b = document.createElement("div");
        b.innerHTML = "\x3cp class\x3d'TEST'\x3e\x3c/p\x3e";
        if (!(b.querySelectorAll && 0 ===
            b.querySelectorAll(".TEST").length)) {
            k = function (b, c, e, h) {
                c = c || document;
                if (!h && !k.isXML(c)) {
                    var g = /^(\w+$)|^\.([\w\-]+$)|^#([\w\-]+$)/.exec(b);
                    if (g && (1 === c.nodeType || 9 === c.nodeType)) {
                        if (g[1]) return q(c.getElementsByTagName(b), e);
                        if (g[2] && l.find.CLASS && c.getElementsByClassName) return q(c.getElementsByClassName(g[2]), e)
                    }
                    if (9 === c.nodeType) {
                        if ("body" === b && c.body) return q([c.body], e);
                        if (g && g[3]) {
                            var n = c.getElementById(g[3]);
                            if (n && n.parentNode) {
                                if (n.id === g[3]) return q([n], e)
                            } else return q([], e)
                        }
                        try {
                            return q(c.querySelectorAll(b),
                                e)
                        } catch (r) { }
                    } else if (1 === c.nodeType && "object" !== c.nodeName.toLowerCase()) {
                        var n = (g = c.getAttribute("id")) || "__sizzle__",
                            s = c.parentNode,
                            p = /^\s*[+~]/.test(b);
                        g ? n = n.replace(/'/g, "\\$\x26") : c.setAttribute("id", n);
                        p && s && (c = c.parentNode);
                        try {
                            if (!p || s) return q(c.querySelectorAll("[id\x3d'" + n + "'] " + b), e)
                        } catch (m) { } finally {
                            g || c.removeAttribute("id")
                        }
                    }
                }
                return a(b, c, e, h)
            };
            for (var c in a) k[c] = a[c];
            b = null
        }
    } ();
    (function () {
        var a = document.documentElement,
            b = a.matchesSelector || a.mozMatchesSelector || a.webkitMatchesSelector ||
            a.msMatchesSelector,
            c = !1;
        try {
            b.call(document.documentElement, "[test!\x3d'']:sizzle")
        } catch (d) {
            c = !0
        }
        b && (k.matchesSelector = function (a, d) {
            d = d.replace(/\=\s*([^'"\]]*)\s*\]/g, "\x3d'$1']");
            if (!k.isXML(a)) try {
                if (c || !l.match.PSEUDO.test(d) && !/!=/.test(d)) return b.call(a, d)
            } catch (h) { }
            return 0 < k(d, null, null, [a]).length
        })
    })();
    (function () {
        var a = document.createElement("div");
        a.innerHTML = "\x3cdiv class\x3d'test e'\x3e\x3c/div\x3e\x3cdiv class\x3d'test'\x3e\x3c/div\x3e";
        a.getElementsByClassName && 0 !== a.getElementsByClassName("e").length &&
            (a.lastChild.className = "e", 1 !== a.getElementsByClassName("e").length && (l.order.splice(1, 0, "CLASS"), l.find.CLASS = function (a, c, d) {
                if ("undefined" !== typeof c.getElementsByClassName && !d) return c.getElementsByClassName(a[1])
            }, a = null))
    })();
    k.contains = document.documentElement.contains ? function (a, b) {
        return a !== b && (a.contains ? a.contains(b) : !0)
    } : document.documentElement.compareDocumentPosition ? function (a, b) {
        return !!(a.compareDocumentPosition(b) & 16)
    } : function () {
        return !1
    };
    k.isXML = function (a) {
        return (a = (a ? a.ownerDocument ||
            a : 0).documentElement) ? "HTML" !== a.nodeName : !1
    };
    var G = function (a, b) {
        for (var c, d = [], f = "", e = b.nodeType ? [b] : b; c = l.match.PSEUDO.exec(a); ) f += c[0], a = a.replace(l.match.PSEUDO, "");
        a = l.relative[a] ? a + "*" : a;
        c = 0;
        for (var h = e.length; c < h; c++) k(a, e[c], d);
        return k.filter(f, d)
    };
    window.Sizzle = k
})();
var TWEEN = TWEEN || function () {
    var a, d, c = 60,
        b = !1,
        e = [];
    return {
        setFPS: function (a) {
            c = a || 60
        },
        start: function (a) {
            0 != arguments.length && this.setFPS(a);
            d = setInterval(this.update, 1E3 / c)
        },
        stop: function () {
            clearInterval(d)
        },
        setAutostart: function (a) {
            (b = a) && !d && this.start()
        },
        add: function (a) {
            e.push(a);
            b && !d && this.start()
        },
        getAll: function () {
            return e
        },
        removeAll: function () {
            e = []
        },
        remove: function (b) {
            a = e.indexOf(b); -1 !== a && e.splice(a, 1)
        },
        update: function (c) {
            a = 0;
            num_tweens = e.length;
            for (c = c || Date.now(); a < num_tweens; ) e[a].update(c) ?
                a++ : (e.splice(a, 1), num_tweens--);
            0 == num_tweens && !0 == b && this.stop()
        }
    }
} ();
TWEEN.Tween = function (a) {
    var d = {},
        c = {},
        b = {},
        e = 1E3,
        h = 0,
        k = null,
        p = TWEEN.Easing.Linear.EaseNone,
        l = null,
        m = null,
        n = null;
    this.to = function (c, d) {
        null !== d && (e = d);
        for (var f in c) null !== a[f] && (b[f] = c[f]);
        return this
    };
    this.start = function (q) {
        TWEEN.add(this);
        k = q ? q + h : Date.now() + h;
        for (var e in b) null !== a[e] && (d[e] = a[e], c[e] = b[e] - a[e]);
        return this
    };
    this.stop = function () {
        TWEEN.remove(this);
        return this
    };
    this.delay = function (a) {
        h = a;
        return this
    };
    this.easing = function (a) {
        p = a;
        return this
    };
    this.chain = function (a) {
        l = a
    };
    this.onUpdate =
        function (a) {
            m = a;
            return this
        };
    this.onComplete = function (a) {
        n = a;
        return this
    };
    this.update = function (b) {
        var g, f;
        if (b < k) return !0;
        b = (b - k) / e;
        b = 1 < b ? 1 : b;
        f = p(b);
        for (g in c) a[g] = d[g] + c[g] * f;
        null !== m && m.call(a, f);
        return 1 == b ? (null !== n && n.call(a), null !== l && l.start(), !1) : !0
    }
};
TWEEN.Easing = {
    Linear: {},
    Quadratic: {},
    Cubic: {},
    Quartic: {},
    Quintic: {},
    Sinusoidal: {},
    Exponential: {},
    Circular: {},
    Elastic: {},
    Back: {},
    Bounce: {}
};
TWEEN.Easing.Linear.EaseNone = function (a) {
    return a
};
TWEEN.Easing.Quadratic.EaseIn = function (a) {
    return a * a
};
TWEEN.Easing.Quadratic.EaseOut = function (a) {
    return -a * (a - 2)
};
TWEEN.Easing.Quadratic.EaseInOut = function (a) {
    return 1 > (a *= 2) ? 0.5 * a * a : -0.5 * (--a * (a - 2) - 1)
};
TWEEN.Easing.Cubic.EaseIn = function (a) {
    return a * a * a
};
TWEEN.Easing.Cubic.EaseOut = function (a) {
    return --a * a * a + 1
};
TWEEN.Easing.Cubic.EaseInOut = function (a) {
    return 1 > (a *= 2) ? 0.5 * a * a * a : 0.5 * ((a -= 2) * a * a + 2)
};
TWEEN.Easing.Quartic.EaseIn = function (a) {
    return a * a * a * a
};
TWEEN.Easing.Quartic.EaseOut = function (a) {
    return -(--a * a * a * a - 1)
};
TWEEN.Easing.Quartic.EaseInOut = function (a) {
    return 1 > (a *= 2) ? 0.5 * a * a * a * a : -0.5 * ((a -= 2) * a * a * a - 2)
};
TWEEN.Easing.Quintic.EaseIn = function (a) {
    return a * a * a * a * a
};
TWEEN.Easing.Quintic.EaseOut = function (a) {
    return (a -= 1) * a * a * a * a + 1
};
TWEEN.Easing.Quintic.EaseInOut = function (a) {
    return 1 > (a *= 2) ? 0.5 * a * a * a * a * a : 0.5 * ((a -= 2) * a * a * a * a + 2)
};
TWEEN.Easing.Sinusoidal.EaseIn = function (a) {
    return -Math.cos(a * Math.PI / 2) + 1
};
TWEEN.Easing.Sinusoidal.EaseOut = function (a) {
    return Math.sin(a * Math.PI / 2)
};
TWEEN.Easing.Sinusoidal.EaseInOut = function (a) {
    return -0.5 * (Math.cos(Math.PI * a) - 1)
};
TWEEN.Easing.Exponential.EaseIn = function (a) {
    return 0 == a ? 0 : Math.pow(2, 10 * (a - 1))
};
TWEEN.Easing.Exponential.EaseOut = function (a) {
    return 1 == a ? 1 : -Math.pow(2, -10 * a) + 1
};
TWEEN.Easing.Exponential.EaseInOut = function (a) {
    return 0 == a ? 0 : 1 == a ? 1 : 1 > (a *= 2) ? 0.5 * Math.pow(2, 10 * (a - 1)) : 0.5 * (-Math.pow(2, -10 * (a - 1)) + 2)
};
TWEEN.Easing.Circular.EaseIn = function (a) {
    return -(Math.sqrt(1 - a * a) - 1)
};
TWEEN.Easing.Circular.EaseOut = function (a) {
    return Math.sqrt(1 - --a * a)
};
TWEEN.Easing.Circular.EaseInOut = function (a) {
    return 1 > (a /= 0.5) ? -0.5 * (Math.sqrt(1 - a * a) - 1) : 0.5 * (Math.sqrt(1 - (a -= 2) * a) + 1)
};
TWEEN.Easing.Elastic.EaseIn = function (a) {
    var d, c = 0.1,
        b = 0.4;
    if (0 == a) return 0;
    if (1 == a) return 1;
    b || (b = 0.3);
    !c || 1 > c ? (c = 1, d = b / 4) : d = b / (2 * Math.PI) * Math.asin(1 / c);
    return -(c * Math.pow(2, 10 * (a -= 1)) * Math.sin(2 * (a - d) * Math.PI / b))
};
TWEEN.Easing.Elastic.EaseOut = function (a) {
    var d, c = 0.1,
        b = 0.4;
    if (0 == a) return 0;
    if (1 == a) return 1;
    b || (b = 0.3);
    !c || 1 > c ? (c = 1, d = b / 4) : d = b / (2 * Math.PI) * Math.asin(1 / c);
    return c * Math.pow(2, -10 * a) * Math.sin(2 * (a - d) * Math.PI / b) + 1
};
TWEEN.Easing.Elastic.EaseInOut = function (a) {
    var d, c = 0.1,
        b = 0.4;
    if (0 == a) return 0;
    if (1 == a) return 1;
    b || (b = 0.3);
    !c || 1 > c ? (c = 1, d = b / 4) : d = b / (2 * Math.PI) * Math.asin(1 / c);
    return 1 > (a *= 2) ? -0.5 * c * Math.pow(2, 10 * (a -= 1)) * Math.sin(2 * (a - d) * Math.PI / b) : 0.5 * c * Math.pow(2, -10 * (a -= 1)) * Math.sin(2 * (a - d) * Math.PI / b) + 1
};
TWEEN.Easing.Back.EaseIn = function (a) {
    return a * a * (2.70158 * a - 1.70158)
};
TWEEN.Easing.Back.EaseOut = function (a) {
    return (a -= 1) * a * (2.70158 * a + 1.70158) + 1
};
TWEEN.Easing.Back.EaseInOut = function (a) {
    return 1 > (a *= 2) ? 0.5 * a * a * (3.5949095 * a - 2.5949095) : 0.5 * ((a -= 2) * a * (3.5949095 * a + 2.5949095) + 2)
};
TWEEN.Easing.Bounce.EaseIn = function (a) {
    return 1 - TWEEN.Easing.Bounce.EaseOut(1 - a)
};
TWEEN.Easing.Bounce.EaseOut = function (a) {
    return (a /= 1) < 1 / 2.75 ? 7.5625 * a * a : a < 2 / 2.75 ? 7.5625 * (a -= 1.5 / 2.75) * a + 0.75 : a < 2.5 / 2.75 ? 7.5625 * (a -= 2.25 / 2.75) * a + 0.9375 : 7.5625 * (a -= 2.625 / 2.75) * a + 0.984375
};
TWEEN.Easing.Bounce.EaseInOut = function (a) {
    return 0.5 > a ? 0.5 * TWEEN.Easing.Bounce.EaseIn(2 * a) : 0.5 * TWEEN.Easing.Bounce.EaseOut(2 * a - 1) + 0.5
};

function LC() { }
LC.getLabel = function () {
    return LC.getLabelWithArray(this.getLabel.arguments)
};
LC.getLabelWithArray = function (a) {
    var b = "";
    a[0] && a[1] && (b = LC.labels[a[0]][a[1]]);
    for (var c = 2; c < a.length; c++) b = b.replace(RegExp("\\{" + (c - 2) + "\\}", "g"), a[c]);
    return b
};
LC.isEnglishLanguage = function () {
    return UserContext.initialized && "en_US" == UserContext.language
};
LC.isUSLocale = function () {
    return UserContext.initialized && "en_US" == UserContext.locale
};
LC.isEnglishUS = function () {
    return LC.isEnglishLanguage() && LC.isUSLocale()
};
LC.isThaiTHLocale = function () {
    return "th_TH" == UserContext.locale
};
LC.isRtlPage = function () {
    return "rtl" == getCurrentStyle(document.body, "direction")
};
LC.BUDDHIST_CAL_OFFSET = 543;
var UserContext = {
    initialized: !1,
    locale: "",
    language: "",
    startOfWeek: 0,
    dateFormat: "",
    dateTimeFormat: "",
    timeFormat: "",
    ampm: null,
    today: "",
    isAccessibleMode: !1,
    userPreferences: null,
    orgPreferences: null,
    siteUrlPrefix: "",
    userId: "",
    uiSkin: "",
    renderMode: "",
    labelLastModified: "",
    networkId: "",
    isDefaultNetwork: !0,
    cloud: null,
    initialize: function (a) {
        a ? UserContext.processValues(a) : UserContext.initializeFromServlet()
    },
    initializeFromServlet: function () {
        var a = UserContext.getUrl("/_ui/system/context/UserContextServlet");
        Sfdc.Ajax.get(a, function (a) {
            a = Sfdc.JSON.parseWithCSRF(a);
            UserContext.processValues(a)
        })
    },
    processValues: function (a) {
        for (var b in a) "undefined" != typeof UserContext[b] && (UserContext[b] = "userPreferences" == b || "orgPreferences" == b ? new PreferenceBits(b, a[b]) : a[b]);
        UserContext.initialized = !0
    },
    getUrl: function (a) {
        return "undefined" == typeof a || ("undefined" == typeof UserContext.siteUrlPrefix || !UserContext.siteUrlPrefix) || 0 !== a.indexOf("/") || 0 === a.indexOf(UserContext.siteUrlPrefix) ? a : UserContext.siteUrlPrefix + a
    }
};
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
            } else a = []; if (b.isArray(a) && 0 < a.length)
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
        } ();
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
            for (var a = Array.prototype.slice.call(arguments), b = null; a.length; )
                for (var d = (a.shift() || "").toString().split("."), b = k; d.length; ) {
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
                for (var e = a.split("."); d && e.length; ) d = d[e.shift()];
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
            if (/^[>\.#\\]/.test(a)) return b.select(a,
                c)[0] || null;
            c ? d = c.getElementById ? c : c.ownerDocument : c = d;
            d = d.getElementById(a);
            return null === d || d.getAttribute("id") === a ? d : c.all ? c.all[a] : null
        };
        b.assert = function (a, c) {
            if (void 0 === a || null === a || !1 === a) throw "error" in b && b.error(c), Error(c);
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
                var c = a.getAttribute("data-uidSfdc");
                if (c) return c;
                c = b.newUID();
                a.setAttribute("data-uidSfdc",
                    c);
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
        b.inherits =
            function (a, c) {
                if (!b.isFunction(a)) throw Error("Sfdc.inherit(): 'type' must be a valid Function pointer.");
                for (var d = c; d; ) {
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
                if (void 0 === c[g]) return d && (d.reason = b.String.format("Instance member not implemented. Expected: '{0}{1}'.", [g, b.isFunction(a[g]) ? b.String.format("({0})", [b.Function.getParameters(a[g]).join(", ")]) : ""])), !1;
                if (b.isFunction(a[g])) {
                    if (b.inherits(a[g], c[g])) continue;
                    if (b.isFunction(c[g]) && b.isDebug && (e = b.Function.getParameters(a[g]).join(", "), f = b.Function.getParameters(c[g]).join(", "), e != f)) return d && (d.reason = b.String.format("Instance member signature mismatch on '{0}()'. Expected '{0}({1})', found '{0}({2})'.", [g, e, f])), !1
                }
                if (b.isObject(a[g])) {
                    if (null !== c[g] && !b.implies(a[g], c[g], d)) return d && (d.reason =
                        b.String.format("Instance member type mismatch on '{0}': {1}", [g, d.reason])), !1
                } else if (typeof a[g] !== typeof c[g]) return d && (d.reason = b.String.format("Instance member type mismatch on '{0}'. Expected '{1}', found '{2}'.", [g, typeof a[g], typeof c[g]])), !1
            }
            return !0
        };
        b.isAssignableFrom = function (a, c, d) {
            if (void 0 == a) throw Error("Sfdc.isAssignableFrom(): 'type' must be a valid Function or Object.");
            if (void 0 != c) switch (typeof a) {
                case "object":
                    if (a.constructor != Object && b.inherits(a.constructor, c) || b.implies(a,
                        c, d)) return !0;
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
            e ? (c = (e.dependencies || []).toString() === (c || []).toString(), (e.ctr.toString() !== d.toString() || !c) && b.error("Cannot redefine an existing module (" + a + ").")) : x(a, d, c)
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
        b.error = function (a) {
            throw Error(a);
        };
        return b
    };
    new SfdcFramework(this,
        Sfdc)
};
Sfdc.provide("Sfdc.Labels", window.LC);
Sfdc.provide("Sfdc.UserContext", window.UserContext);
Sfdc.provide("Sfdc.Perf", window.Perf);
Sfdc.provide("Sfdc.Date", window.DateUtil);
Sfdc.provide("Sfdc.Ajax", {
    get: function (d, a, b) {
        b = b || {};
        b.method || (b.method = "GET");
        a && (b.success = a);
        return this.request(d, b)
    },
    crossDomainRequest: function (d, a, b) {
        b = b || {};
        b.isCrossDomain = !0;
        b.onBrowserNotSupportXDR || (b.onBrowserNotSupportXDR = Sfdc.Function.blank());
        return this.get(d, a, b)
    },
    post: function (d, a, b) {
        b = b || {};
        b.method = "POST";
        a && (b.success = a);
        return this.request(d, b)
    },
    jsonp: function (d, a) {
        var b = {
            success: function () { },
            onScriptLoad: function () { },
            data: {},
            cache: !1,
            callback: null
        };
        a ? Sfdc.apply(a, b) : a = b;
        !1 === a.cache && (a.data = a.data || {}, a.data._ = (new Date).getTime());
        var e = a.callback || "jsonp" + Sfdc.newUID();
        window[e] = function (b) {
            Sfdc.isFunction(a.success) && a.success(b);
            if (!a.callback) try {
                window[e] = null, delete window[e]
            } catch (c) {
                Sfdc.log("Couldn't delete jsonp callback function", Sfdc.Logging.LogLevel.INFO, c)
            }
        };
        a.data.callback = e;
        d = Sfdc.Url.generateUrl(d, a.data);
        Sfdc.Resource.addJavaScript(d, function () {
            if (Sfdc.isFunction(a.onScriptLoad)) a.onScriptLoad(this);
            Sfdc.Dom.removeChild(this)
        })
    },
    request: function (d,
        a) {
        var b = a.isCrossDomain || !1,
            e = "undefined" != typeof XDomainRequest,
            g = b && e;
        a = Sfdc.apply(a || {}, {
            method: "GET",
            async: !0,
            beforerequest: function () {
                return !0
            },
            success: function () { },
            failure: function () { },
            complete: function () { },
            contentType: null,
            headers: null,
            data: null,
            processData: !0,
            context: window,
            escape: function (a) {
                return a
            }
        });
        a.method = a.method.toUpperCase();
        var c = this._createXmlHttpObject();
        if (b && !e && !("withCredentials" in c)) a.onBrowserNotSupportXDR();
        else {
            if (g) return this._handleXDR(d, a);
            b = function () {
                if (4 ===
                    c.readyState) {
                    var b = c.status;
                    200 <= b && 300 > b || 304 === b || 1223 === b ? a.success && a.success.call(a.context, c.responseText, c, a) : a.failure && a.failure.call(a.context, c.responseText, c, a);
                    a.complete && a.complete.call(a.context, c.responseText, c, a);
                    a.complete = a.success = a.failure = a.beforerequest = null
                }
            };
            a.data && ("GET" === a.method || "HEAD" === a.method ? d = Sfdc.Url.generateUrl(d, a.data, {
                escape: a.escape
            }) : !Sfdc.isString(a.data) && a.processData && (a.data = Sfdc.Url.generateQueryString("", a.data, {
                includeMark: !1,
                escape: a.escape,
                allowMultipleOfParam: !0
            })));
            a.async && (c.onreadystatechange = b);
            if (!Sfdc.isFunction(a.beforerequest) || a.beforerequest.call(a.context)) {
                c.open(a.method, d, a.async);
                if (a.headers)
                    for (var f in a.headers) a.headers.hasOwnProperty(f) && c.setRequestHeader(f, a.headers[f]);
                a.contentType ? c.setRequestHeader("Content-Type", a.contentType) : a.data && "POST" === a.method && c.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset\x3dUTF-8");
                c.send(a.data);
                return !a.async ? (b(), f = c.responseText, c.onreadystatechange = function () { }, c = null,
                    f) : c
            }
        }
    },
    _createXmlHttpObject: function () {
        if (window.XMLHttpRequest) return new window.XMLHttpRequest;
        try {
            return new ActiveXObject("MSXML2.XMLHTTP.3.0")
        } catch (d) { }
        return null
    },
    _handleXDR: function (d, a) {
        var b = new XDomainRequest;
        if (!Sfdc.isFunction(a.beforerequest) || a.beforerequest.call(a.context)) return b && (b.onerror = function () {
            a.failure.call(a.context, b.responseText, b, a)
        }, b.ontimeout = function () {
            a.failure.call(a.context, b.responseText, b, a)
        }, b.onprogress = function () { }, b.onload = function () {
            a.success.call(a.context,
                b.responseText, b, a)
        }, b.open("get", d), b.send()), b
    }
});
(function (c) {
    function m(a) {
        return c.apply({
            duration: c.Animation.DEFAULT_DURATION,
            delay: c.Animation.DEFAULT_DELAY,
            onComplete: c.Function.blank(),
            tryCSS: c.Animation.DEFAULT_USE_CSS_ANIMATION,
            timing: c.Animation.DEFAULT_TIMING_FUNCTION
        }, a || {}, !0)
    }

    function q(a, b) {
        var e;
        e = c.isEmpty(a) ? c.Animation.Easing[c.Animation.DEFAULT_TIMING_FUNCTION] : c.isString(a) ? c.Animation.Easing[a] : a;
        return !e ? c.Animation.Easing[c.Animation.DEFAULT_TIMING_FUNCTION][b.toUpperCase()] : e[b.toUpperCase()]
    }

    function v(a, b) {
        b = new n(b);
        var e = new l(b.toDashed());
        e.duration = 0;
        var d = new p(a);
        d.set(e);
        return c.Dom.setPrefixedStyle(a, "transition", d.toString())
    }

    function r() { }

    function s() { }

    function k() { }

    function t() { }

    function n(a) {
        if (a instanceof n) return a;
        this.rawProperty = a
    }

    function u(a) { }

    function p(a) {
        this.delimiter = ", ";
        this.onParse = l.parse;
        this.getId = function () {
            return this.prop
        };
        this.parse(c.Dom.getPrefixedStyle(a, "transition"))
    }

    function l(a) {
        this.prop = a
    }
    c.provide("Sfdc.Animation", {
        DEFAULT_DURATION: 400,
        DEFAULT_DELAY: 0,
        DEFAULT_USE_CSS_ANIMATION: !1,
        DEFAULT_TIMING_FUNCTION: "Linear",
        Easing: {
            Linear: {
                CSS: "linear",
                JS: TWEEN.Easing.Linear.EaseNone
            },
            Ease: {
                CSS: "ease",
                JS: TWEEN.Easing.Sinusoidal.EaseInOut
            },
            EaseIn: {
                CSS: "ease-in",
                JS: TWEEN.Easing.Cubic.EaseIn
            },
            EaseOut: {
                CSS: "ease-out",
                JS: TWEEN.Easing.Cubic.EaseOut
            },
            EaseInOut: {
                CSS: "ease-in-out",
                JS: TWEEN.Easing.Cubic.EaseInOut
            }
        },
        css: function (a, b, e, d, f) {
            c.assert(a && b, "An element and animation definition must be specified.");
            f = m(f);
            b = new n(b);
            if (e == d) c.Dom.setStyle(a, b.toCamelCase(), d);
            else {
                if (f.tryCSS) {
                    if (f.tryCSS &&
                        this.cssTransform(a, b, e, d, f)) return null
                } else v(a, b);
                f.onUpdate = function (e) {
                    c.Dom.setStyle(a, b.toCamelCase(), e)
                };
                return this.animate(e, d, f)
            }
        },
        property: function (a, b, e, d, f) {
            c.assert(a && b, "An element and animation definition must be specified.");
            f = m(f);
            f.onUpdate = function (c) {
                a[b] = c
            };
            return this.animate(e, d, f)
        },
        animate: function (a, b, e) {
            c.assert(c.isFunction(e.onUpdate), "config.onUpdate must be set to a function");
            e = m(e);
            var d = !c.isDefAndNotNull(a) ? null : !isNaN(a) ? new r : c.Units.HexColor.isHexColor(a) ? new k :
                /^[\d\.-]+px$/g.test(a) ? new s : /^rgb/g.test(a) ? new t : null;
            if (d) {
                var f = {},
                    g = {};
                d instanceof k ? (c.apply(f, d.toInt(a)), c.apply(g, d.toInt(b))) : (f.prop = d.toInt(a), g.prop = d.toInt(b));
                TWEEN.start();
                a = (new TWEEN.Tween(f)).to(g, e.duration).easing(q(e.timing, "JS")).onUpdate(function () {
                    if (d instanceof k) e.onUpdate(d.fromInt(f));
                    else e.onUpdate(d.fromInt(f.prop))
                }).onComplete(function () {
                    TWEEN.stop();
                    e.onComplete()
                });
                e.delay && a.delay(e.delay);
                return a.start()
            }
        },
        opacity: function (a, b, e, d) {
            function f(b) {
                c.Dom.setStyle(a,
                    "opacity", b)
            }

            function g() {
                var b = "" + c.Dom.getStyle(a, "opacity");
                "0" === b && c.Dom.hideByVisibility(a);
                if (!("opacity" in a.style) && ("1" === b || "0" === b)) {
                    var b = a,
                        e = b.style.filter;
                    c.isEmpty(e) ? b.style.opacity = "" : b.style.filter = c.String.trim(e.replace(/alpha\(opacity=(.*)\)/i, ""))
                }
                h && h()
            }
            var h;
            if (a) {
                d = m(d);
                b = Math.min(Math.max(0, b), 1);
                e = Math.min(Math.max(0, e), 1);
                h = d.onComplete;
                if (b || e) c.Dom.setStyle(a, "opacity", b), c.Dom.show(a);
                d.onUpdate = f;
                d.onComplete = g;
                if (b == e) c.Dom.setStyle(a, "opacity", e), d.onComplete();
                else return d.tryCSS && this.cssTransform(a, "opacity", b, e, d) ? null : this.animate(b, e, d)
            }
        },
        cssTransform: function (a, b, e, d, f) {
            function g() {
                c.un(a, "oTransitionEnd", g);
                c.un(a, "transitionend", g);
                c.un(a, "webkitTransitionEnd", g);
                f.onComplete();
                f = null
            }
            if (!a) return !1;
            f = m(f);
            b = new n(b);
            var h = new l(b.toDashed());
            h.duration = 0;
            var k = new p(a);
            k.set(h);
            if (!c.Dom.setPrefixedStyle(a, "transition", k.toString())) return !1;
            c.Dom.setStyle(a, b.toCamelCase(), e);
            h.duration = f.duration;
            h.delay = f.delay;
            h.timing = q(f.timing, "CSS");
            k.set(h);
            c.on(a, "oTransitionEnd", g);
            c.on(a, "transitionend", g);
            c.on(a, "webkitTransitionEnd", g);
            setTimeout(function () {
                c.Dom.setPrefixedStyle(a, "transition", k.toString());
                setTimeout(function () {
                    c.Dom.setStyle(a, b.toCamelCase(), d)
                }, 0)
            }, 0);
            return !0
        }
    }, !0);
    r.prototype = {
        toInt: function (a) {
            return a
        },
        fromInt: function (a) {
            return a
        }
    };
    s.prototype = {
        toInt: function (a) {
            return 1 * a.replace(/\D+$/gi, "")
        },
        fromInt: function (a) {
            return a + "px"
        }
    };
    k.prototype = {
        toInt: function (a) {
            var b, c, d;
            4 == a.length && (b = a.substr(1, 1), c = a.substr(2,
                1), d = a.substr(3, 1), b = parseInt(b + b, 16), c = parseInt(c + c, 16), d = parseInt(d + d, 16));
            7 == a.length && (b = parseInt(a.substr(1, 2), 16), c = parseInt(a.substr(3, 2), 16), d = parseInt(a.substr(5, 2), 16));
            return {
                r: b,
                g: c,
                b: d
            }
        },
        fromInt: function (a) {
            return "#" + [(16 > Math.round(a.r) ? "0" : "") + Math.round(a.r).toString(16), (16 > Math.round(a.g) ? "0" : "") + Math.round(a.g).toString(16), (16 > Math.round(a.b) ? "0" : "") + Math.round(a.b).toString(16)].join("")
        }
    };
    t.prototype = {
        toInt: function (a) {
            a = a.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
            return {
                r: a[1],
                g: a[2],
                b: a[3]
            }
        },
        fromInt: function (a) {
            return c.String.format("rgb({r}, {g}, {b})", a)
        }
    };
    n.prototype = {
        rawProperty: null,
        toCamelCase: function () {
            var a = c.String.toCamelCase(this.rawProperty);
            this.toCamelCase = function () {
                return a
            };
            return a
        },
        toDashed: function () {
            var a = c.String.dashify(this.rawProperty);
            this.toDashed = function () {
                return a
            };
            return a
        }
    };
    u.prototype = {
        delimiter: ", ",
        onParse: function () { },
        $coll: {},
        get: function (a) {
            return this.$coll[a]
        },
        set: function (a) {
            this.$coll[a.getId()] = a
        },
        toString: function () {
            var a = [],
                b;
            for (b in this.$coll) this.$coll.hasOwnProperty(b) && a.push(this.$coll[b].toString());
            return a.join(this.delimiter)
        },
        parse: function (a) {
            if (a) {
                a = a.split(this.delimiter);
                for (var b, c = 0, d = a.length; c < d; c++) (b = this.onParse(a[c])) && (this.$coll[b.prop] = b)
            }
        }
    };
    p.prototype = new u;
    l.parse = function (a) {
        var b = new l;
        b.parse(a);
        return b
    };
    l.prototype = {
        getId: function () {
            return this.prop
        },
        parse: function (a) {
            if (!a) throw "Invalid string to parse.";
            a = a.split(" ");
            this.prop = a[0];
            this.duration = a[1] || 0;
            this.delay = a[2] || 0;
            a[3] &&
                (this.timing = a[3])
        },
        toString: function () {
            var a = [this.prop, this.getDuration(), this.getDelay()];
            this.timing && a.push(this.timing);
            return a.join(" ")
        },
        getDuration: function () {
            return -1 < this.duration.toString().indexOf("s") ? this.duration : this.duration + "ms"
        },
        getDelay: function () {
            return -1 < this.delay.toString().indexOf("s") ? this.delay : this.delay + "ms"
        },
        prop: "",
        duration: 0,
        delay: 0,
        timing: ""
    }
})(Sfdc);
Sfdc.provide("Sfdc.Aria", function (b) {
    var c = function () {
        if (!b.get("sfdc_aria_asstv_marquee")) {
            var a = [];
            a.push('\x3cdiv id\x3d"sfdc_aria_asstv_marquee" class\x3d"assistiveText zen-assistiveText"\x3e');
            a.push('    \x3cdiv id\x3d"sfdc_aria_msg_alert" role\x3d"alert"\x3e\x3c/div\x3e');
            a.push('    \x3cdiv id\x3d"sfdc_aria_msg_assertive" aria-live\x3d"assertive" aria-atomic\x3d"false" aria-relevant\x3d"additions"\x3e\x3c/div\x3e');
            a.push('    \x3cdiv id\x3d"sfdc_aria_msg_polite" aria-live\x3d"polite" aria-atomic\x3d"false" aria-relevant\x3d"additions"\x3e\x3c/div\x3e');
            a.push("\x3c/div\x3e");
            b.Dom.insertHTML(document.body, a.join(""))
        }
        c = function () { }
    };
    return {
        alert: function (a) {
            b.assert(b.isString(a), "msg parameter must be String");
            c();
            b.get("sfdc_aria_msg_alert").innerHTML = a
        },
        assert: function (a) {
            b.assert(b.isString(a), "msg parameter must be String");
            c();
            b.get("sfdc_aria_msg_assertive").innerHTML += a
        },
        notify: function (a) {
            b.assert(b.isString(a), "msg parameter must be String");
            c();
            b.get("sfdc_aria_msg_polite").innerHTML += a
        }
    }
} (Sfdc));
Sfdc.provide("Sfdc.Array", {
    indexOf: function (a, c) {
        if (Array.prototype.indexOf) return a.indexOf(c);
        for (var b = a.length - 1; 0 <= b; b--)
            if (a[b] === c) return b;
        return -1
    },
    toArray: function (a) {
        if (!Sfdc.isDefAndNotNull(a)) return [];
        for (var c = Array(a.length), b = 0, d = a.length; b < d; b++) c[b] = a[b];
        return c
    },
    map: function (a, c, b) {
        Sfdc.assert(Sfdc.isArray(a), "Must provide a valid non null array.");
        Sfdc.assert(Sfdc.isFunction(c), "A valid non null function must be supplied to operate on the array.");
        if (Array.prototype.map) return a.map(c,
            b);
        for (var d = a.length, e = [], f = 0; f < d; f++) f in a && e.push(c.call(b, a[f]));
        return e
    },
    forEach: function (a, c, b) {
        Sfdc.assert(Sfdc.isArray(a), "Must provide a valid non null array.");
        Sfdc.assert(Sfdc.isFunction(c), "A valid non null function must be supplied to operate on the array.");
        if (Array.prototype.forEach) return a.forEach(c, b);
        for (var d = 0, e = a.length; d < e; d++) d in a && c.call(b, a[d], d, a)
    },
    find: function (a, c, b) {
        Sfdc.assert(Sfdc.isArray(a), "Must provide a valid non null array.");
        Sfdc.assert(Sfdc.isFunction(c),
            "A valid non null function must be supplied to operate on the array.");
        for (var d = 0, e = a.length; d < e; d++)
            if (d in a && c.call(b, a[d], d)) return a[d];
        return null
    }
});
(function (e) {
    function w(b, a, f, c, m) {
        var h = q(a, c),
            d;
        for (d in h)
            if (!s.hasOwnProperty(d)) {
                if (c[d])
                    if (e.isFunction(c[d])) {
                        if ("toString" != d || !c[d].Documented) b[d] = t(c[d], a, f)
                    } else b[d] = c[d];
                e.isFunction(h[d]) && (f[d] = r(h[d].bind(b), h[d]), m && (a[d] = null, delete a[d]))
            }
    }

    function r(b, a) {
        if (b && void 0 != a) {
            var f = b.toString.bind(b);
            b.toString = function (b) {
                return !b ? a + "" : e.String.format("{0}\n\nOriginal:\n\n{1}", [a + "", f()])
            };
            b.toString.Documented = !0
        }
        return b
    }

    function x(b, a, f, c) {
        c || (c = {});
        for (var m in b)
            if (!s.hasOwnProperty(m)) {
                var h =
                    b[m];
                e.isFunction(h) && (h = t(h, a, f));
                c[m] && c[m] != s[m] ? c[m] = h : a[m] = h
            }
    }

    function q(b, a) {
        var f = {},
            c;
        for (c in b)
            if (!a || a[c] !== b[c]) f[c] = b[c];
        return f
    }

    function y(b, a, f, c) {
        return t(b, a, r(function () {
            var b = q(f),
                e = q(a);
            a.parent && (a.parent._instance = c);
            var d = f.apply(a, arguments);
            a.parent && delete a.parent._instance;
            w(a, f, c, b, !0);
            w(a, a, c, e, !1);
            return d
        }, f))
    }

    function t(b, a, f) {
        return r(function () {
            a || (a = this);
            var c = a.parent;
            a.parent = f;
            var e = b.apply(a, arguments);
            a.parent = c;
            return e
        }, b)
    }

    function z(b, a, f) {
        b = new Function;
        b.prototype = f && f.prototype || a && a.prototype;
        return new b
    }

    function A(b, a) {
        b && (a || (a = this), e.isFunction(b) && (b = b.prototype), e.apply(a, b, !0))
    }
    var s = {
        parent: !0,
        constructor: !0,
        prototype: !0,
        $constructor: !0,
        $decorators: !0,
        $extends: !0,
        $implements: !0
    };
    e.provide("Sfdc.Class", function (b, a) {
        b || (b = {});
        e.isFunction(b) && (b = {
            $constructor: b
        }, void 0 != a && (b.$extends = a));
        if (b.hasOwnProperty("$constructor") && !e.isFunction(b.$constructor)) throw Error("Sfdc.Class.ctor: '$constructor' must be a valid Function pointer.");
        if (b.hasOwnProperty("$extends") && !e.isFunction(b.$extends)) throw Error("Sfdc.Class.ctor: '$extends' must be a valid Function pointer.");
        return function (a, c, m, h) {
            function d() {
                var n = q(this),
                    k = c ? {} : null;
                x(a.prototype || a, this, k, n);
                var l = h;
                if (l) {
                    e.isArray(l) || (l = [l]);
                    for (var p = 0; p < l.length; p++) A(l[p], this)
                }
                x(b, this, k);
                var l = d,
                    p = k,
                    u = q(this, n),
                    g;
                for (g in u)
                    if (!s.hasOwnProperty(g) && u.hasOwnProperty(g) && n.hasOwnProperty(g)) {
                        this[g] = n[g];
                        var v = r(u[g].bind(this), u[g]);
                        this.parent && this.parent._instance && (this.parent._instance[g] =
                            v);
                        p && (p[g] = v);
                        l[g] = v
                    }
                k = (c ? y(a, this, c, k) : t(a, this)).apply(this, arguments);
                if ((g = m) && this) {
                    e.isArray(g) || (g = [g]);
                    n = {};
                    for (l = 0; l < g.length; l++) e.implies(g[l], this, n) || e.assert(!1, n.reason)
                }
                this.constructor = d;
                if (void 0 !== k) {
                    a: switch (typeof k) {
                        case "number":
                            k = new Number(k);
                            break a;
                        case "string":
                            k = new String(k);
                            break a
                    }
                    return k
                }
            }
            a || (a = new Function);
            if (e.inherits(a, c)) throw Error(e.String.format("Sfdc.Class.ctor:'$extends' is already in the inheritance chain of '$constructor'. '$constructor': {0}, $'expected': {1}.", [a.toString(), c.toString()]));
            d.prototype = z(d, a, c);
            return r(d, a)
        } (b.$constructor, b.$extends, b.$implements, b.$decorators)
    })
})(this.Sfdc);
Sfdc.provide("Sfdc.Cookie", {
    setCookie: function (e, d, b, c, a, f, g) {
        g = g || encodeURIComponent;
        document.cookie = e + "\x3d" + g(d) + (b ? "; expires\x3d" + b.toGMTString() : "") + (c ? "; path\x3d" + c : "; path\x3d/") + (a ? "; domain\x3d" + a : "") + (!0 === f ? "; secure" : "")
    },
    getCookie: function (e, d) {
        d = d || decodeURIComponent;
        var b = document.cookie,
            c = e + "\x3d",
            a = b.indexOf("; " + c);
        if (-1 == a) {
            if (a = b.indexOf(c), 0 !== a) return null
        } else a += 2;
        var f = document.cookie.indexOf(";", a); -1 == f && (f = b.length);
        return d(b.substring(a + c.length, f))
    },
    deleteCookie: function (e,
        d, b) {
        if (this.getCookie(e)) {
            var c = new Date((new Date).getTime() + -1E4);
            this.setCookie(e, "", c, d, b)
        }
    }
});
Sfdc.provide("Sfdc.Data", function (b) {
    var e = {};
    return {
        set: function (a, d, c) {
            b.assert(a, "An element must be provided for Sfdc.Data.set(el, name, val);");
            b.assert(d, "A name must be defined for Sfdc.Data.set(el, name, val);");
            a = b.getUID(b.get(a));
            e[a] || (e[a] = {});
            e[a][d] = c
        },
        get: function (a, d) {
            b.assert(a, "An element must be provided for Sfdc.Data.get(el, name);");
            a = b.get(a);
            var c = null;
            b.hasUID(a) && (c = e[b.getUID(a)]);
            c && void 0 !== d && (c = c[d]);
            return c
        },
        clear: function (a, b) {
            this.set(a, b, null)
        }
    }
} (Sfdc));
Sfdc.provide("Sfdc.Debug", {
    describe: function (b, a) {
        a = a || Sfdc.log;
        var c = [],
            d;
        for (d in b) b.hasOwnProperty(d) && c.push([d, b[d]].join(" \x3d "));
        a(c.join(", "))
    },
    log: function (b, a) {
        window.console && (b.constructor == Array ? window.console.log.apply(this, arguments) : window.console.log(Sfdc.String.format(b, a)))
    },
    warn: function (b, a) {
        window.console && window.console.warn(Sfdc.String.format(b, a))
    },
    error: function (b, a) {
        window.console && window.console.error(Sfdc.String.format(b, a))
    },
    logUsage: function (b, a) {
        if (Sfdc.isDefAndNotNull(a)) Sfdc.isArray(a) ||
            (a = [a]);
        else {
            a = [];
            for (var c in b) b.hasOwnProperty(c) && Sfdc.isFunction(b[c]) && a.push(c)
        }
        c = 0;
        for (var d = a.length; c < d; c++) Sfdc.isFunction(b[a[c]]) && Sfdc.Function.wrap(b, a[c], function (a) {
            return function () {
                Sfdc.log("Logging usage: " + a)
            }
        } (a[c]))
    }
});
(function (n, r) {
    n.provide("Sfdc.Dom", new function (e, g) {
        function m(a) {
            try {
                return a()
            } catch (b) {
                e.error && e.error(b)
            }
        }

        function n(a) {
            for (var b = 0, c = a.length; b < c; b++) m(a[b]);
            a.length = 0
        }

        function s(a, b) {
            if (a) {
                void 0 == b && (b = !0);
                var c = a.attributes;
                if (c && c.length)
                    for (var d = null, f = c.length - 1; 0 <= f; f--)
                        if (d = c[f].name, !("style" == d || "undefined" == typeof a[d])) switch (typeof a[d]) {
                            case "object":
                            case "function":
                                a[d] = null
                        }
                e.Event && e.Event.removeAll(a, !1);
                if (b && (c = a.childNodes)) {
                    d = 0;
                    for (f = c.length; d < f; d++) s(c[d], b)
                }
            }
        }

        function l(a,
            b, c, d, e) {
            if (b)
                if (b.addEventListener) {
                    if (!e) b[a ? "addEventListener" : "removeEventListener"](c, d, !1)
                } else if (b.attachEvent && (e || 5 > arguments.length)) b[a ? "attachEvent" : "detachEvent"]("on" + c, d)
        }
        var r = {
            A: 1,
            ABBR: 1,
            B: 1,
            CODE: 1,
            EM: 1,
            I: 1,
            IMG: 1,
            INPUT: 1,
            LABEL: 1,
            SELECT: 1,
            SMALL: 1,
            SPAN: 1,
            TEXTAREA: 1
        },
            p = ["", "Moz", "Webkit", "O"],
            q = {},
            k = null;
        this.isNode = function (a) {
            return a && "nodeType" in a
        };
        this.isElement = function (a) {
            return this.isNode(a) && a.nodeType == Node.ELEMENT_NODE
        };
        this.replace = function (a, b) {
            if (!this.isNode(a)) throw Error("Sfdc.Dom.replace(): 'replacementNode' must be a valid Node.");
            if (!this.isNode(b)) throw Error("Sfdc.Dom.replace(): 'targetNode' must be a valid Node.");
            if (!this.isNode(b.parentNode)) throw Error("Sfdc.Dom.replace(): 'targetNode' must be attached to a valid Node.");
            var c = b.parentNode;
            c.insertBefore(a, b);
            c.removeChild(b);
            return a
        };
        this.setText = function (a, b) {
            e.assert(a, "No element specified!");
            a = e.get(a);
            this.updateHTML(a, "");
            a.appendChild(document.createTextNode(b));
            return this
        };
        this.getText = function (a) {
            e.assert(a, "No element specified!");
            a = e.get(a);
            return void 0 !==
                a.innerText ? a.innerText : a.textContent
        };
        this.getTextFromMarkup = function (a) {
            if (!a) return "";
            k || (k = document.createElement("div"));
            k.innerHTML = a;
            a = "textContent" in k ? k.textContent : k.innerText;
            k.innerHTML = "";
            return a
        };
        this.hideByDisplay = function (a) {
            e.assert(a, "No Element specified.");
            a = e.get(a);
            e.isArray(a) || (a = [a]);
            for (var b, c; b = a.pop(); ) c = this.getStyle(b, "display"), "none" !== c && e.Data.set(b, "original-display", c), this.setStyle(b, "display", "none");
            return this
        };
        this.hideByVisibility = function (a) {
            e.assert(a,
                "No Element specified.");
            a = e.get(a);
            e.isArray(a) || (a = [a]);
            this.set(a, {
                style: {
                    visibility: "hidden"
                }
            });
            return this
        };
        this.show = function (a) {
            e.assert(a, "No Element specified.");
            a = e.get(a);
            e.isArray(a) || (a = [a]);
            for (var b, c, d; b = a.pop(); ) c = this.getStyles(b, ["visibility", "display"]), d = {}, "hidden" === c.visibility && (d.visibility = "visible"), "none" === c.display && (d.display = e.Data.get(b, "original-display"), d.display || (d.display = r.hasOwnProperty(b.nodeName) ? "inline" : "block")), this.setStyles(b, d);
            return this
        };
        this.isVisible =
            function (a, b) {
                a = e.get(a);
                var c = this.getStyles(a, ["visibility", "display"]),
                    c = !("hidden" === c.visibility || "none" === c.display);
                return !c || !b ? c : "BODY" !== a.tagName.toUpperCase() && a.parentNode && "BODY" !== a.parentNode.tagName.toUpperCase() ? this.isVisible(a.parentNode, b) : !0
            };
        this.blur = function (a) {
            if (this.isElement(a) && a.blur) try {
                return a.blur(), !0
            } catch (b) { }
            return !1
        };
        this.focus = function (a, b) {
            if (this.isElement(a) && a.focus) try {
                return a.focus(), b && a.select && a.select(), !0
            } catch (c) { }
            return !1
        };
        this.get = function (a,
            b) {
            a = e.get(a);
            if (e.isArray(b)) {
                for (var c = {}, d = 0, f = b.length; d < f; d++) c[b[d]] = a[b[d]];
                return c
            }
            return a[b]
        };
        this.getAttribute = function (a, b, c) {
            if (!this.isElement(a) && !e.isFunction(a && a.getAttribute)) throw Error("Sfdc.Dom.getAttribute(): 'element' must be a valid Element or implement the method getAttribute(name).");
            a = a.getAttribute(b);
            null === a && void 0 !== c && (a = c);
            return a
        };
        this.set = function (a, b, c) {
            if (e.isArray(a)) {
                for (var d = 0, f = a.length; d < f; d++) this.set(a[d], b, c);
                return this
            }
            a = e.get(a);
            e.assert(a, "First parameter to Sfdc.Dom.set() was empty. It should either be an element, selector or an array of such values.");
            if (e.isObject(b)) {
                for (d in b)
                    if (b.hasOwnProperty(d)) switch (d) {
                        case "attributes":
                            for (f in b.attributes) b.attributes.hasOwnProperty(f) && a.setAttribute(f, b.attributes[f]);
                            break;
                        case "style":
                            this.setStyles(a, b[d]);
                            break;
                        case "innerText":
                            this.setText(a, b[d]);
                            break;
                        default:
                            c = b[d], e.assert("object" !== typeof c, "You cannot set objects or arrays to an element. It has the tendency to create memory leaks."), a[d] = c
                    }
                return this
            }
            e.assert("object" !== typeof c, "You cannot set objects or arrays to an element. It has the tendency to create memory leaks.");
            a[b] = c;
            return this
        };
        this.setStyle = function (a, b, c) {
            a = e.get(a);
            "opacity" === b && !(b in a.style) && (b = "filter", c = "alpha(opacity\x3d" + 100 * c + ")");
            c != this.getStyle(a, b) && (a.style[b] = c);
            return this
        };
        this.setStyles = function (a, b) {
            a = e.get(a);
            for (var c in b) b.hasOwnProperty(c) && this.setStyle(a, c, b[c]);
            return this
        };
        this.getStyle = function (a, b) {
            a = e.get(a);
            if (a.currentStyle) {
                if ("opacity" === b && !(b in a.style)) {
                    var c = a.currentStyle.filter;
                    return !c || -1 === c.indexOf("alpha") ? 1 : parseInt(c.replace(/[^\d^\.^-]/g, "")) / 100
                }
                return a.currentStyle[b]
            }
            if (document.defaultView &&
                document.defaultView.getComputedStyle) return (c = document.defaultView.getComputedStyle(a, null)) ? c.getPropertyValue(e.String.dashify(b)) : null
        };
        this.getStyles = function (a, b) {
            a = e.get(a);
            for (var c = {}, d = 0, f = b.length, h; d < f; d++) h = b[d], c[h] = this.getStyle(a, h);
            return c
        };
        this.getElementXY = function (a) {
            a = e.get(a);
            var b = 0,
                c = 0;
            if (a.getBoundingClientRect) {
                var c = a.getBoundingClientRect(),
                    b = Math.round(c.left),
                    c = Math.round(c.top),
                    d = a.ownerDocument;
                d && d.documentElement && (b -= d.documentElement.clientLeft, c -= d.documentElement.clientTop);
                "fixed" !== e.Dom.getStyle(a, "position") && (b += e.Window.getScrollX(d), c += e.Window.getScrollY(d))
            } else
                for (; null !== a; ) b += a.offsetLeft, c += a.offsetTop, a = a.offsetParent;
            return {
                x: b,
                y: c
            }
        };
        this.setElementXY = function (a, b) {
            a = e.get(a);
            var c = this.getElementXY(a),
                d = parseInt(this.getStyle(a, "left"), 10),
                f = parseInt(this.getStyle(a, "top"), 10),
                h = "relative" == this.getStyle(a, "position"),
                d = !isNaN(d) ? d : h ? 0 : a.offsetLeft,
                f = !isNaN(f) ? f : h ? 0 : a.offsetTop;
            this.setStyles(a, {
                left: b[0] - c.x + d + "px",
                top: b[1] - c.y + f + "px"
            })
        };
        this.getPositionXY =
            function (a, b, c) {
                e.assert(a, "Trying to get positionXY of a non existent element");
                a = e.get(a);
                b = (b || "tl").toLowerCase();
                var d = null,
                    d = this.getWidth(a),
                    f = this.getHeight(a);
                switch (b) {
                    case "c":
                        d = [Math.round(0.5 * d), Math.round(0.5 * f)];
                        break;
                    case "t":
                        d = [Math.round(0.5 * d), 0];
                        break;
                    case "l":
                        d = [0, Math.round(0.5 * f)];
                        break;
                    case "r":
                        d = [d, Math.round(0.5 * f)];
                        break;
                    case "b":
                        d = [Math.round(0.5 * d), f];
                        break;
                    case "tl":
                        d = [0, 0];
                        break;
                    case "tr":
                        d = [d, 0];
                        break;
                    case "lb":
                    case "bl":
                        d = [0, f];
                        break;
                    case "rb":
                    case "br":
                        d = [d, f];
                        break;
                    default:
                        throw "Unsupported position option";
                }
                a = c ? {
                    x: 0,
                    y: 0
                } : this.getElementXY(a);
                return [a.x + d[0], a.y + d[1]]
            };
        this.alignTo = function (a, b, c, d) {
            e.assert(a, "Trying to align a non existent element");
            e.assert(b, "Trying to align with a non existent element");
            var f = (c || "tl-bl").toLowerCase().split("-");
            c = e.Dom.getPositionXY(a, f[0], !0);
            b = e.Dom.getPositionXY(b, f[1]);
            d = d || [0, 0];
            this.setElementXY(a, [b[0] - c[0] + d[0], b[1] - c[1] + d[1]])
        };
        this.getLocalOffsetXY = function (a) {
            var b = {
                x: a.offsetLeft,
                y: a.offsetTop
            },
                c;
            try {
                c = a.offsetParent
            } catch (d) {
                return b
            }
            for (; c &&
                "static" == this.getStyle(c, "position"); ) {
                b.x += c.offsetLeft;
                b.y += c.offsetTop;
                try {
                    c = c.offsetParent
                } catch (e) {
                    break
                }
            }
            return b
        };
        this.deepCopy = function (a, b) {
            var c = b.createElement(a.tagName);
            if ("undefined" != typeof a.attributes && null !== a.attributes)
                for (var d = 0; d < a.attributes.length; d++) c.setAttribute(a.attributes[d].name, a.attributes[d].value);
            null !== a.nodeValue && c.appendChild(b.createTextNode(a.nodeValue));
            if ("undefined" != typeof a.childNodes && null !== a.childNodes)
                for (var d = 0, e = a.childNodes.length; d < e; d++) c.appendChild(this.deepCopy(a.childNodes[d],
                    b));
            return c
        };
        this.importNode = function (a, b) {
            e.assert(a, "Node to import is a required parameter.");
            if (b.importNode) return b.importNode(a, !1);
            for (var c = b.createElement(a.tagName), d = 0; d < a.attributes.length; d++) a.attributes[d].specified && c.setAttribute(a.attributes[d].name, a.attributes[d].value);
            return c
        };
        this.cleanListeners = function (a, b) {
            if (a) {
                var c = null;
                !e.isArray(a) && !e.Dom.isNodeList(a) && (a = [a]);
                void 0 == b && (b = !0);
                for (var d = 0, f = a.length; d < f; d++) c = a[d], (this.isElement(c) || c === g) && s(a[d], b)
            }
            return this
        };
        this.isNodeList = function (a) {
            return "undefined" != typeof NodeList ? a instanceof NodeList : "object" == typeof a && "number" == typeof a.length && "undefined" != typeof a.item
        };
        this.updateHTML = function (a, b, c, d) {
            a = e.get(a);
            e.isFunction(d) || (d = function () { });
            e.isDefAndNotNull(a) && e.isDefAndNotNull(b) && (this.cleanListeners(a.childNodes), a.innerHTML = b, c && e.Resource.execScripts(e.Resource.getScriptsFromHtml(a), d));
            return this
        };
        this.replaceChildrenWith = function (a, b, c, d) {
            a = e.get(a);
            if (e.isDefAndNotNull(a)) {
                b = e.get(b);
                var f =
                    a.childNodes;
                this.cleanListeners(f);
                for (f = f.length; 0 <= --f; ) a.removeChild(a.firstChild);
                a.appendChild(b);
                c && (e.isFunction(d) || (d = function () { }), e.Resource.execScripts(e.Resource.getScriptsFromHtml(a), d))
            }
            return this
        };
        this.insertHTML = function (a, b) {
            var c = [],
                d = document.createElement("DIV");
            d.innerHTML = b;
            for (var e; e = d.firstChild; ) c.push(e), a.appendChild(e);
            return c
        };
        this.removeChild = function (a) {
            a && a.parentNode && (this.cleanListeners(a), a.parentNode.removeChild(a));
            return this
        };
        this.hasClass = function (a, b) {
            return this.isElement(a) ||
                !e.isEmpty(a) ? a.classList ? a.classList.contains(b) : 0 <= (" " + a.className + " ").indexOf(" " + b + " ") : !1
        };
        this.addClass = function (a, b) {
            if (this.isElement(a) || !e.isEmpty(a))
                if (e.isArray(b) || (b = e.isString(b) ? e.String.trim(b).split(/\s+/) : [b]), a.classList)
                    for (var c = b.length - 1; 0 <= c; c--) e.isEmpty(b[c]) || a.classList.add(b[c]);
                else if (e.isEmpty(a.className)) a.className = b.join(" ");
                else {
                    for (var c = [], d = b.length - 1; 0 <= d; d--) this.hasClass(a, b[d]) || c.push(b[d]);
                    0 < c.length && (a.className += " " + c.join(" "))
                }
            return this
        };
        this.removeClass =
            function (a, b) {
                if (this.isElement(a) || !e.isEmpty(a)) {
                    e.isArray(b) || (b = e.isString(b) ? e.String.trim(b).split(/\s+/) : [b]);
                    if (a.classList) {
                        for (var c = b.length; 0 <= c; c--) a.classList.remove(b[c]);
                        return this
                    }
                    for (var c = e.String.trim, d = c(a.className).split(/\s+/), f, h = b.length - 1; 0 <= h; h--) f = c(b[h]), f = e.Array.indexOf(d, f), -1 != f && d.splice(f, 1);
                    a.className = d.join(" ")
                }
                return this
            };
        this.toggleClass = function (a, b, c) {
            void 0 === c && (c = !this.hasClass(a, b));
            c ? this.addClass(a, b) : this.removeClass(a, b);
            return this
        };
        this.getParent =
            function (a, b) {
                var c = a.parentNode;
                if (!b) return c;
                for (; c; ) {
                    if (c.getAttribute && this.isMatch(c, b)) return c;
                    c = c.parentNode
                }
                return null
            };
        this.getFirstChild = function (a, b) {
            e.assert(this.isElement(a), "Sfdc.Dom.getFirstChild: el must be an HTMLElement");
            if (e.isString(b)) return e.get("\x3e " + b, a);
            var c = a.firstElementChild;
            if (c) return c;
            c = a.firstChild;
            return !c ? null : 1 === c.nodeType ? c : this.getNext(c)
        };
        this.getPrevious = function (a, b) {
            var c = a.previousElementSibling;
            if (!c)
                for (c = a.previousSibling; c && 1 !== c.nodeType; ) c =
                    c.previousSibling;
            if (!b) return c;
            for (; c; ) {
                if (this.isMatch(c, b)) return c;
                c = this.getPrevious(c)
            }
            return null
        };
        this.getNext = function (a, b) {
            var c = a.nextElementSibling;
            if (!c)
                for (c = a.nextSibling; c && 1 !== c.nodeType; ) c = c.nextSibling;
            if (!b) return c;
            for (; c; ) {
                if (this.isMatch(c, b)) return c;
                c = this.getNext(c)
            }
            return null
        };
        this.isMatch = function (a, b) {
            e.isArray(a) || (a = [a]);
            return 1 === Sizzle.matches(b, a).length
        };
        this.getWidth = function (a, b) {
            return !b && !isNaN(a.clientWidth) && 0 < a.clientWidth ? a.clientWidth : a.offsetWidth ||
                0
        };
        this.getHeight = function (a, b) {
            return !b && !isNaN(a.clientHeight) && 0 < a.clientHeight ? a.clientHeight : a.offsetHeight || 0
        };
        this.getScrollBarWidth = function (a) {
            if (a) return a.offsetWidth - a.clientWidth;
            void 0 == this.scrollBarWidth && (a = this.create(document.body, {
                style: {
                    overflow: "scroll",
                    visibility: "hidden",
                    width: "100px",
                    height: "100px",
                    position: "absolute"
                }
            }), this.scrollBarWidth = a.offsetWidth - a.clientWidth, a.parentNode.removeChild(a));
            return this.scrollBarWidth
        };
        this.computeTextWidth = function (a, b) {
            var c = 0,
                d = null;
            try {
                d = this.create(g.document.body || g.document.documentElement, {
                    style: {
                        position: "absolute",
                        top: "-1000px",
                        left: "-1000px",
                        visibility: "hidden"
                    }
                }, "SPAN");
                if (b) {
                    var f = this.getStyles(b, "fontSize fontStyle fontWeight fontFamily textTransform letterSpacing".split(" "));
                    this.setStyles(d, {
                        fontSize: f.fontSize,
                        fontStyle: f.fontStyle,
                        fontWeight: f.fontWeight,
                        fontFamily: f.fontFamily,
                        textTransform: f.textTransform,
                        letterSpacing: f.letterSpacing
                    })
                }
                this.setText(d, a);
                c = this.getWidth(d)
            } catch (h) {
                e.error(h)
            } finally {
                d && this.removeChild(d)
            }
            return c
        };
        this.getPrefixedStyle = function (a, b) {
            b = e.String.toCamelCase(b);
            var c = p,
                d = q[b],
                f = a.style;
            if (d) return f[d];
            for (var h = 0, g = c.length; h < g; h++)
                if (c[h].length && (b = b.charAt(0).toUpperCase() + b.substr(1)), d = c[h] + b, d in f) return c[h] && (p = ["", c[h]]), q[b] = d, f[d];
            return null
        };
        this.setPrefixedStyle = function (a, b, c) {
            b = e.String.toCamelCase(b);
            var d = p,
                f = q[b];
            a = a.style;
            if (f) return a[f] = c, !0;
            for (var h = 0, g = d.length; h < g; h++)
                if (d[h].length && (b = b.charAt(0).toUpperCase() + b.substr(1)), f = d[h] + b, f in a) return d[h] && (p = ["", d[h]]),
                    q[b] = f, a[f] = c, !0;
            return !1
        };
        this.create = function (a, b, c, d) {
            c = (d || a && a.ownerDocument || document).createElement(c || "div");
            b && this.set(c, b);
            a && a.appendChild(c);
            return c
        };
        this.getActualHeight = function (a, b) {
            var c = this.getStyle(a, "position"),
                d = this.getStyle(a, "visibility"),
                e = this.getStyle(a, "display");
            "none" === e && ("relative" !== c && "absolute" != c) && this.setStyles(a, {
                position: "absolute",
                display: "block",
                visibility: "hidden"
            });
            var h = /.*px$/,
                g = b ? a.scrollHeight : a.offsetHeight,
                l = this.getStyle(a, "paddingTop"),
                k = this.getStyle(a,
                    "paddingBottom");
            if (!h.exec(l) || !h.exec(k)) return g;
            l = l.substring(0, l.length - 2);
            k = k.substring(0, k.length - 2);
            this.setStyles(a, {
                position: c,
                visibility: d,
                display: e
            });
            return g - l - k
        };
        this.onReady = function () {
            function a() {
                try {
                    g.document.documentElement.doScroll("left"), b()
                } catch (c) {
                    g.setTimeout(a, 13)
                }
            }

            function b() {
                c || (g.document.body ? (c = !0, l(!1, g.document, "DOMContentLoaded", b, !1), l(!1, g.document, "readystatechange", b, !0), l(!1, g, "load", b), n(d)) : g.setTimeout(b, 13))
            }
            var c = !1,
                d = [];
            (function () {
                if (g.document && "complete" ===
                    g.document.readyState) b();
                else {
                    l(!0, g.document, "DOMContentLoaded", b, !1);
                    l(!0, g.document, "readystatechange", b, !0);
                    l(!0, g, "load", b);
                    var c = e.userAgent.isIE && (e.userAgent.isIE6 || e.userAgent.isIE7 || e.userAgent.isIE8),
                        d = m(function () {
                            return g === g.top
                        }) || !1,
                        k = g.document && g.document.documentElement && g.document.documentElement.doScroll;
                    c && (d && k) && a()
                }
            })();
            return function (a) {
                if (c) return this.onReady = m, m(a);
                d.push(a)
            }
        } ();
        this.onload = function () {
            function a() {
                b = !0;
                l(!1, g, "load", a);
                n(c)
            }
            var b = !1,
                c = [];
            l(!0, g, "load",
                a);
            return function (a) {
                if (b) return this.onload = m, m(a);
                c.push(a)
            }
        } ();
        this.contains = function (a, b) {
            if (!a || !b) return !1;
            e.assert(this.isNode(a), "Sfdc.Dom.contains: 'container' must be a valid node.");
            e.assert(this.isNode(b), "Sfdc.Dom.contains: 'target' must be a valid node.");
            for (var c = b.parentNode; c; ) {
                if (c === a) return !0;
                c = c.parentNode
            }
            return !1
        }
    } (n, r))
})(Sfdc, this);
(function (a, v) {
    a.provide("Sfdc.DragDrop.MouseOffset", {
        BottomLeft: "bottomleft",
        BottomRight: "bottomright",
        Center: "center",
        Preserve: "preserve",
        TopLeft: "topleft",
        TopRight: "topright"
    });
    a.provide("Sfdc.DragDrop.Draggable", {
        $implements: a.IDisposable,
        $constructor: function (l) {
            function m() {
                h.remove(v, "mousemove", A);
                h.remove(v, "mouseup", x);
                d && (a.Dom.setStyle(d, "position", B), d !== c && a.Dom.removeChild(d));
                a.DragDrop.activeDrag = d = null
            }

            function n(b) {
                return {
                    height: a.Dom.getHeight(b),
                    width: a.Dom.getWidth(b)
                }
            }

            function g(b) {
                var e =
                    a.DragDrop.MouseOffset;
                switch (s.offset) {
                    case e.BottomLeft:
                        return {
                            x: 0,
                            y: c.offsetHeight
                        };
                    case e.BottomRight:
                        return {
                            x: c.offsetWidth,
                            y: c.offsetHeight
                        };
                    case e.Center:
                        return {
                            x: c.offsetWidth / 2,
                            y: c.offsetHeight / 2
                        };
                    case e.TopLeft:
                        return {
                            x: 0,
                            y: 0
                        };
                    case e.TopRight:
                        return {
                            x: c.offsetWidth,
                            y: 0
                        };
                    default:
                        e = a.Event.getMouseX(b);
                        b = a.Event.getMouseY(b);
                        var q = a.Dom.getElementXY(c);
                        return {
                            x: e - q.x,
                            y: b - q.y
                        }
                }
            }

            function k(b) {
                a.Dom.setStyles(d, {
                    position: "absolute",
                    left: Math.round(b.x) + "px",
                    top: Math.round(b.y) + "px"
                })
            }

            function C(b,
                e) {
                d && m();
                var q = {
                    event: e || null,
                    target: p,
                    cancel: !1
                };
                p.notify("ondragstart", q);
                if (!q.cancel) {
                    q = a.Data.get(b, "Sfdc.DragDrop.Draggable");
                    if (s.ghost) {
                        d = b.cloneNode(!0);
                        a.Dom.addClass(d, "zen-draggable zen-visualization");
                        d.removeAttribute("data-uidsfdc");
                        for (var f = b, c = {
                            x: 0,
                            y: 0
                        }, g = f && f.ownerDocument.body, l = !1; f && f != g; ) "static" != a.Dom.getStyle(f, "position") && (l = !0), l && (c.x += f.offsetLeft, c.y += f.offsetTop), f = f.offsetParent;
                        t = c;
                        f = a.Dom.getElementXY(b);
                        f.x -= t.x;
                        f.y -= t.y;
                        k(f);
                        b.parentNode.appendChild(d);
                        a.Dom.setStyles(d, {
                            opacity: ".8",
                            "z-index": 999999,
                            width: ""
                        })
                    } else d = b;
                    B = a.Dom.getStyle(b, "position");
                    u = n(d);
                    h.add(v, "mousemove", A);
                    h.add(v, "mouseup", x);
                    a.DragDrop.activeDrag = q
                }
            }

            function A(b) {
                b = h.getEvent(b);
                var e;
                e = b.pageX || b.clientX + document.body.scrollLeft;
                var c = b.pageY || b.clientY + document.body.scrollTop,
                    f = e - t.x - r.x,
                    d = c - t.y - r.y,
                    g = y;
                g && (e - r.x < g.left ? f = g.left : e - r.x + u.width > g.right && (f = g.right - u.width), c - r.y < g.top ? d = g.top : c - r.y + u.height > g.bottom && (d = g.bottom - u.height));
                e = {
                    x: f,
                    y: d
                };
                p.notify("ondrag", {
                    event: b,
                    target: p,
                    position: e
                });
                c = h.getEventTarget(b);
                b = p;
                do (f = a.Data.get(c, "Sfdc.DragDrop.Droppable")) && f.notify("ondrag", {
                    event: event,
                    target: b,
                    position: e
                }), c = a.Dom.getParent(c); while (a.Dom.isElement(c));
                k(e)
            }

            function x(b) {
                clearTimeout(z);
                m();
                p.notify("ondrop", {
                    event: b,
                    target: p
                })
            }
            var t = {
                x: 0,
                y: 0
            },
                y = null,
                p = this,
                c = l.target,
                r = {
                    x: 0,
                    y: 0
                },
                h = new a.Event.EventManager("ondragstart", "ondrag", "ondrop"),
                d = null,
                u = {
                    width: 0,
                    height: 0
                },
                B = "",
                s = {
                    ghost: !1 === l.ghost ? !1 : !0,
                    containment: l.containment || null,
                    delay: l.delay || 0,
                    offset: l.offset ||
                        a.DragDrop.MouseOffset.Preserve
                },
                z = null,
                w;
            if (!l.handle || !(w = a.select(l.handle, c)[0])) w = c;
            a.Data.set(c, "Sfdc.DragDrop.Draggable", this);
            h.add(w, "mousedown", function (b) {
                if (0 == b.button) {
                    h.preventDefault(b);
                    r = g(b);
                    var e = s.containment;
                    if (e) {
                        var d = a.Dom.getElementXY(e),
                            e = n(e);
                        y = {
                            left: d.x,
                            top: d.y,
                            right: d.x + e.width,
                            bottom: d.y + e.height
                        }
                    } else y = null;
                    s.delay ? (clearTimeout(z), z = setTimeout(C.bind(c, c), parseInt(s.delay, 10))) : C(c, b)
                }
            });
            h.add(w, "mouseup", x);
            this.dispose = function () {
                h && h.dispose();
                p = c = h = d = null
            };
            this.attach =
                function (b, a) {
                    h.add(this, b, a)
                };
            this.detach = function (b, a) {
                h.remove(this, b, delegate)
            };
            this.notify = function (b, a) {
                h.fireEvent(this, b, {
                    data: a
                })
            };
            this.getElement = function () {
                return c
            };
            this.getVisualization = function () {
                return d
            }
        }
    });
    a.provide("Sfdc.DragDrop.Droppable", {
        $implements: a.IDisposable,
        $constructor: function (l) {
            var m = new a.Event.EventManager("ondrag", "ondragout", "ondrop"),
                n = l.target;
            a.Data.set(n, "Sfdc.DragDrop.Droppable", this);
            m.add(n, "mouseup", function (g) {
                var k = a.DragDrop.activeDrag;
                k && this.notify("ondrop", {
                    event: g,
                    target: k
                })
            }, this);
            m.add(n, "mouseout", function (g) {
                var k = a.DragDrop.activeDrag;
                k && this.notify("ondragout", {
                    event: g,
                    target: k
                })
            }, this);
            this.dispose = function () {
                m && m.dispose();
                m = n = null
            };
            this.attach = function (a, k) {
                m.add(this, a, k)
            };
            this.detach = function (a, k) {
                m.remove(this, a, delegate)
            };
            this.notify = function (a, k) {
                m.fireEvent(this, a, {
                    data: k
                })
            };
            this.getElement = function () {
                return n
            }
        }
    })
})(Sfdc, this);
(function (a) {
    a.provide("Sfdc.Effects", {
        fadeIn: function (b, d) {
            var c = a.Dom.isVisible(b) ? a.Dom.getStyle(b, "opacity") : 0;
            a.Animation.opacity(b, c, 1, {
                onComplete: d || a.Function.blank(),
                duration: 500,
                tryCSS: !0
            })
        },
        fadeOut: function (b, d) {
            var c = a.Dom.getStyle(b, "opacity");
            a.Animation.opacity(b, c, 0, {
                onComplete: d || a.Function.blank(),
                duration: 500,
                tryCSS: !0
            })
        },
        rollIn: function (b, d, c) {
            var e = a.Dom.getActualHeight(b) + "px";
            c = c && c.duration || 500;
            a.Dom.setStyle(b, "height", "1px");
            a.Dom.show(b);
            a.Animation.css(b, "height", "1px",
                e, {
                    onComplete: d || a.Function.blank(),
                    duration: c,
                    timing: a.Animation.Easing.Linear
                })
        },
        rollOut: function (b, d) {
            var c = a.Dom.getActualHeight(b) + "px";
            a.Dom.show(b);
            a.Animation.css(b, "height", c, "1px", {
                onComplete: function () {
                    a.Dom.hideByVisibility(b);
                    a.Dom.hideByDisplay(b);
                    a.Dom.setStyle(b, "height", "");
                    a.isFunction(d) && d()
                },
                duration: 500,
                timing: a.Animation.Easing.EaseIn
            })
        },
        rollInRollOut: function (b, d, c) {
            a.Effects.rollIn(b, function () {
                setTimeout(function () {
                    a.Effects.rollOut(b, c)
                }, d)
            })
        }
    })
})(Sfdc);
(function (d, l) {
    function n() {
        function n(a, c, b, e) {
            var f = d.Data.get(a, c) || {};
            f[d.getUID(b)] = e ? r(b, e) : b;
            d.Data.set(a, c, f)
        }

        function p(a, c, b, e, f) {
            var g = {
                element: a,
                eventName: c,
                handler: e ? r(b, e) : b,
                originalHandler: b,
                useCapture: f || !1
            };
            f = d.getUID(a);
            h[f] || (h[f] = []);
            h[f].push(g);
            a.addEventListener ? g.element.addEventListener(g.eventName, g.handler, g.useCapture) : a.attachEvent ? (b = g.handler, g.handler = function (c) {
                b.call(e || a, d.apply(c || l.event, {
                    currentTarget: g.element
                }, !0))
            }, g.element.attachEvent("on" + g.eventName, g.handler)) :
                n(a, c, b, e)
        }

        function s(a, c, b, e, f) {
            var g = d.Data.get(a, c);
            c = {
                eventName: c,
                target: a
            };
            if (g)
                for (var h in g)
                    if (g.hasOwnProperty(h) && d.isFunction(g[h])) try {
                        g[h].apply(b.context || a, [c].concat(b.data || []))
                    } catch (k) {
                        if (d.isFunction(f) && f(k), e) throw k;
                    }
            return !0
        }

        function r(a, c) {
            return function () {
                a.apply(c, arguments)
            }
        }

        function t(a) {
            var c = null,
                b;
            for (b in h)
                if (h.hasOwnProperty(b))
                    for (c = h[b]; c.length; ) try {
                        q(c.shift())
                    } catch (e) {
                        d.log(e.message || e.description)
                    }
            if (k)
                for (var f in k)
                    if (k.hasOwnProperty(f)) try {
                        k[f](a), k[f] =
                                null
                    } catch (g) {
                        d.log(g.message || g.description)
                    }
            k = null;
            h = {}
        }

        function u(a, c, b) {
            a = d.Data.get(a, c);
            b = d.getUID(b);
            a && a[b] && (a[b] = null, delete a[b])
        }

        function q(a) {
            var c = d.getUID(a.element);
            if (h.hasOwnProperty(c)) {
                for (var b = h[c], e = null, f = 0; f < b.length; f++) {
                    e = b[f];
                    if (e === a) {
                        b.splice(f, 1);
                        break
                    }
                    if (e.element === a.element && e.eventName === a.eventName && e.handler === a.handler && e.useCapture === a.useCapture) {
                        e.element = null;
                        b.splice(f, 1);
                        break
                    }
                }
                b.length || (h[c] = null, delete h[c])
            }
            a.element.removeEventListener ? a.element.removeEventListener(a.eventName,
                a.handler, a.useCapture) : a.element.detachEvent ? a.element.detachEvent("on" + a.eventName, a.handler) : u(a.element, a.eventName, a.handler);
            a.element = null
        }
        var m = d.isArray(arguments[0]) ? arguments[0] : Array.prototype.slice.call(arguments, 0),
            h = {},
            k = null;
        this.haltOnError = d.isDebug;
        this.onError = null;
        this.getMouseX = function (a) {
            a = this.getEvent(a);
            return a.pageX ? a.pageX : d.Window.getScrollX() + a.clientX
        };
        this.getMouseY = function (a) {
            a = this.getEvent(a);
            return a.pageY ? a.pageY : d.Window.getScrollY() + a.clientY
        };
        this.getSrcElement =
            function (a) {
                a = this.getEvent(a);
                return !a ? null : a.currentTarget || a.srcElement
            };
        this.addExpectedEvent = function (a) {
            0 > d.Array.indexOf(m, a) && m.push(a)
        };
        this.getExpectedEvents = function () {
            return m.slice(0)
        };
        this.getEvent = function (a) {
            return a || l.event
        };
        this.getEventTarget = function (a, c) {
            a = this.getEvent(a);
            if (!a) return null;
            var b = a.target || a.srcElement;
            return !c || Sizzle.filter(c, [b]).length ? b : d.Dom.getParent(b, c)
        };
        this.getEventToElement = function (a) {
            a = this.getEvent(a);
            return a.relatedTarget ? a.relatedTarget : a.toElement
        };
        this.isCustomEvent = function (a) {
            return -1 < d.Array.indexOf(m, a) || -1 !== a.indexOf(":")
        };
        this.isKeyAction = function (a, c) {
            a = this.getEvent(a);
            var b = a.which || a.keyCode;
            if (d.isArray(c)) {
                for (var e = 0, f = c.length; e < f; e++)
                    if (b === c[e]) return !0;
                return !1
            }
            return b === c
        };
        this.stop = function (a) {
            a = this.getEvent(a);
            d.assert(a, "No event object was passed to stop().");
            this.preventDefault(a);
            this.stopPropagation(a)
        };
        this.stopPropagation = function (a) {
            a = this.getEvent(a);
            d.assert(a, "No event object was passed to stopPropagation().");
            a.cancelBubble = !0;
            a.stopPropagation && a.stopPropagation()
        };
        this.preventDefault = function (a) {
            a = this.getEvent(a);
            d.assert(a, "No event object was passed to preventDefault().");
            a.preventDefault ? a.preventDefault() : a.returnValue = !1
        };
        this.fireEvent = function (a, c, b) {
            b || (b = {});
            if (this.isCustomEvent(c)) return s(a, c, b, this.haltOnError, this.onError);
            try {
                var e;
                if (l.document.createEvent && a.dispatchEvent) {
                    var f = l.document.createEvent("HTMLEvents");
                    f.initEvent(c, !0, !0);
                    e = a.dispatchEvent(f)
                } else e = l.document.createEventObject &&
                    a.fireEvent ? a.fireEvent("on" + c, l.document.createEventObject()) : s(a, c, b, !0);
                return e
            } catch (g) {
                if (d.isFunction(this.onError)) this.onError(g);
                if (this.haltOnError) throw g;
            }
        };
        this.add = function (a, c, b, e, f) {
            d.assert(a, "Sfdc.Event.add(): 'element' must be a valid Object or Node.");
            d.assert(c, "Sfdc.Event.add(): 'eventName' must be a valid String.");
            if (this.isCustomEvent(c)) {
                if (m.length && 0 > d.Array.indexOf(m, c)) throw Error(d.String.format("Sfdc.Event.EventManager.add(): unknown 'eventName' '{0}'. The following events are supported: '{1}'", [c, m.join("', '")]));
                return n(a, c, b, e)
            }
            k || (p(l, "unload", t), k = {});
            a == l && "unload" == c.toLowerCase() ? (a = d.getUID(b), k.hasOwnProperty(a) || (k[a] = e ? r(b, e) : b)) : p(a, c, b, e, f)
        };
        this.remove = function (a, c, b, e) {
            d.assert(a, "Sfdc.Event.remove(): 'element' must be a valid Object or Node.");
            d.assert(c, "Sfdc.Event.remove(): 'eventName' must be a valid String.");
            if (this.isCustomEvent(c)) return u(a, c, b);
            if (a == l && "unload" == c.toLowerCase()) a = d.getUID(b), k && k.hasOwnProperty(a) && (k[a] = null, delete k[a]);
            else {
                var f = d.getUID(a);
                if (h.hasOwnProperty(f))
                    for (var f = h[f], g = null, m = 0; m < f.length; m++)
                        if (g = f[m], g.element === a && g.eventName === c && g.originalHandler === b && g.useCapture === !!e) {
                            q(g);
                            return
                        }
                q({
                    element: a,
                    eventName: c,
                    handler: b,
                    useCapture: e || !1
                })
            }
        };
        this.removeAll = function (a, c) {
            d.assert(a && a.nodeType, "Sfdc.Event.removeAll(): 'element' must be a valid Object or Node.");
            if (1 == a.nodeType) {
                void 0 == c && (c = !0);
                var b = d.getUID(a);
                if (h.hasOwnProperty(b)) {
                    for (; h[b] && h[b].length; ) try {
                        q(h[b].shift())
                    } catch (e) {
                        d.log(e.message || e.description)
                    }
                    h[b] =
                        null;
                    delete h[b]
                }
                if (c && (a === l && (a = l.document), a.hasChildNodes()))
                    for (var b = a.childNodes, f = 0, g = b.length; f < g; f++) 1 == b[f].nodeType && this.removeAll(b[f], c)
            }
        };
        this.mouseExited = function (a, c) {
            for (var b = this.getEventToElement(a); b && b != l.document.body; ) {
                if (b == c) return !1;
                b = b.parentNode
            }
            return !0
        };
        this.dispose = function () {
            t()
        };
        this.keyCode = {
            BACKSPACE: 8,
            TAB: 9,
            ENTER: 13,
            ESC: 27,
            SPACE: 32,
            PAGEDOWN: 33,
            PAGEUP: 34,
            ARROW_L: 37,
            ARROW_U: 38,
            ARROW_R: 39,
            ARROW_D: 40,
            SHIFT: 16,
            CTRL: 17,
            ALT: 18,
            CAPSLOCK: 20,
            KEY_0: 48,
            KEY_1: 49,
            KEY_2: 50,
            KEY_3: 51,
            KEY_4: 52,
            KEY_5: 53,
            KEY_6: 54,
            KEY_7: 55,
            KEY_8: 56,
            KEY_9: 57,
            KEY_A: 65,
            KEY_B: 66,
            KEY_C: 67,
            KEY_D: 68,
            KEY_E: 69,
            KEY_F: 70,
            KEY_G: 71,
            KEY_H: 72,
            KEY_I: 73,
            KEY_J: 74,
            KEY_K: 75,
            KEY_L: 76,
            KEY_M: 77,
            KEY_N: 78,
            KEY_O: 79,
            KEY_P: 80,
            KEY_Q: 81,
            KEY_R: 82,
            KEY_S: 83,
            KEY_T: 84,
            KEY_U: 85,
            KEY_V: 86,
            KEY_W: 87,
            KEY_X: 88,
            KEY_Y: 89,
            KEY_Z: 90,
            WINDOWS_L: 91,
            WINDOWS_R: 92,
            SELECT: 93,
            NUMPAD_0: 96,
            NUMPAD_1: 97,
            NUMPAD_2: 98,
            NUMPAD_3: 99,
            NUMPAD_4: 100,
            NUMPAD_5: 101,
            NUMPAD_6: 102,
            NUMPAD_7: 103,
            NUMPAD_8: 104,
            NUMPAD_9: 105,
            NUMPAD_MULTIPLY: 106,
            NUMPAD_PLUS: 107,
            NUMPAD_MINUS: 109,
            NUMPAD_DECIMAL: 110,
            NUMPAD_DIVIDE: 111,
            F1: 112,
            F2: 113,
            F3: 114,
            F4: 115,
            F5: 116,
            F6: 117,
            F7: 118,
            F8: 119,
            F9: 120,
            F10: 121,
            F11: 122,
            F12: 123,
            PAUSE: 19,
            END: 35,
            HOME: 36,
            INSERT: 45,
            DELETE: 46,
            NUMLOCK: 144,
            SCROLLLOCK: 145,
            SEMICOLON: d.userAgent.isFirefox ? 59 : 186,
            EQUALS: 61,
            COMMA: 188,
            DASH: 109,
            PERIOD: 190,
            FORWARDSLASH: 191,
            GRAVE: 192,
            OPENBRACKET: 219,
            BACKSLASH: 220,
            CLOSEBRACKET: 221,
            APOSTROPHE: 222,
            PROCESS: 229
        };
        d.isDebug && (this.Debug = {
            getAllEvents: function () {
                return h
            }
        })
    }
    if (!d.resolve("Sfdc.Event")) {
        var p = new n;
        p.EventManager = n;
        d.provide("Sfdc.Event",
            p);
        d.define("Sfdc.Event.EventManager", function () {
            return n
        })
    }
})(Sfdc, this);
Sfdc.provide("Sfdc.Forms", {
    submitFormActionURL: function (a, b) {
        a.action = b;
        a.submit()
    },
    setElementsEnabledBasedOnCheckbox: function (a, b) {
        var c = document.getElementById(a);
        if (null !== c && null !== b)
            for (var e = 0; e < b.length; e++) {
                var f = c,
                    d = document.getElementById(b[e]);
                d && (d.style.display = f.checked ? "" : "none")
            }
    },
    borrowForm: function (a, b, c) {
        a = document.getElementById(a);
        var e = a.action,
            f = a.target;
        null !== b && (a.action = b);
        null !== c && (a.target = c);
        if (a.onsubmit) a.onsubmit();
        a.submit();
        a.action = e;
        a.target = f
    },
    formatPhone: function (a) {
        a.value =
            trim(a.value);
        var b = a.value,
            c = "",
            e = -1;
        if (0 < b.length && "+" != b.charAt(0)) {
            var f = 0;
            "1" == b.charAt(0) && (b = b.substring(1, b.length));
            for (i = 0; i < b.length; i++) {
                var d = b.charAt(i);
                "0" <= d && "9" >= d && (0 === f ? c += "(" : 3 == f ? c += ") " : 6 == f && (c += "-"), c += d, f++);
                if (!("0" <= d && "9" >= d) && " " != d && "-" != d && "." != d && "(" != d && ")" != d) {
                    e = i;
                    break
                }
            }
            0 <= e && (c += " " + b.substring(e, b.length));
            10 == f && 40 >= c.length && (a.value = c)
        }
        return !0
    }
});
Sfdc.provide("Sfdc.Function", function (c) {
    function f() { }
    return {
        blank: function () {
            return f
        },
        wrap: function (a, b, d, g) {
            c.assert(a, "Specify an object to operate on.");
            c.assert(c.isFunction(d), "Must wrap with another function.");
            var e = a[b];
            e && c.isFunction(e) ? a[b] = function (a, b) {
                return g ? function () {
                    var c = a.apply(b, arguments);
                    d.apply(b, arguments);
                    return c
                } : function () {
                    d.apply(b, arguments);
                    return a.apply(b, arguments)
                }
            } (e, a) : a[b] = d
        },
        delay: function (a, b, d, c) {
            c = c || [];
            d = d || window;
            return {
                timeoutId: setTimeout(function () {
                    a.apply(d,
                        c)
                }, b),
                cancel: function () {
                    clearTimeout(this.timeoutId)
                }
            }
        },
        delayCallback: function (a, b, d) {
            return function () {
                c.Function.delay(a, b, d, arguments)
            }
        },
        bind: function (a, b, d) {
            c.assert(c.isFunction(a) && b, "A function must be provided for it to be bound to a context.");
            d = d || [];
            return Function.prototype.bind ? a.bind.apply(a, [b].concat(d)) : function () {
                return a.apply(b || window, d.concat(c.Array.toArray(arguments)))
            }
        },
        getName: function (a) {
            if (!c.isFunction(a)) throw Error("Sfdc.Function.getName: 'method' must be a valid Function pointer.");
            var b = null;
            c.String.trim(a.toString()).match(/\bfunction\s?([^(]*)\(/) && (b = c.String.trim(RegExp.$1));
            return b || "[anonymous]"
        },
        getParameters: function (a) {
            if (!c.isFunction(a)) throw Error("Sfdc.Function.getParameters: 'method' must be a valid Function pointer.");
            a = a.toString();
            var b = a.indexOf("(") + 1;
            return a.substring(b, a.indexOf(")", b)).replace(/\s/g, "").split(",")
        }
    }
} (Sfdc));
Sfdc.provide("Sfdc.History", function (q) {
    function m(a, b) {
        var d, k;
        if (q.isArray(a)) {
            d = 0;
            for (k = a.length; d < k; ) b(a[d++])
        } else
            for (d in a) a.hasOwnProperty(d) && b(d, a[d])
    }

    function u(a) {
        function b(a, f, h) {
            m(a, function (a) {
                a.cb.call(a.scope, f, h, a.data)
            })
        }

        function d(a) {
            return q.Url.getUrlParameters(a)
        }
        var k = [],
            c = null,
            g = null;
        this.updateState = function (a) {
            var b = [];
            null === g && (g = d(n.getState()));
            1 === arguments.length ? m(q.isObject(a) ? a : d(a), function (a, b) {
                g[a] = b
            }) : g[arguments[0]] = arguments[1];
            m(g, function (a, l) {
                l !== r &&
                    b.push(a + "\x3d" + encodeURIComponent(l))
            });
            n.setState(b.join("\x26"))
        };
        this.replaceState = function (a) {
            g = {};
            this.updateState(a)
        };
        this.handleState = function (a, f) {
            a = d(a);
            f = d(f);
            0 !== k.length && b(k, a, f);
            null !== c && m(a, function (a, l) {
                var d = f[a];
                l !== d && c[a] !== r && b(c[a], l, d)
            });
            g = a
        };
        this.addListener = function (a) {
            if ("string" === typeof a[0]) {
                var b = a[0],
                    d = a[1],
                    l = a[2];
                a = a[3];
                null === c && (c = {});
                c[b] || (c[b] = []);
                c[b].push({
                    cb: d,
                    data: l || null,
                    scope: a || null
                })
            } else "function" === typeof a[0] && k.push({
                cb: a[0],
                data: a[1] || null,
                scope: a[2] ||
                    null
            })
        };
        m(a, this.addListener)
    }
    var r, e, b = window,
        s = [],
        n, t = !1;
    n = function () {
        var a = null,
            e = null,
            d = !1,
            k = null,
            c, g = !0,
            m = function () {
                var f = document.createElement("iframe"),
                    c = document.createElement("p"),
                    l = function () {
                        var a = f.contentWindow.document.getElementById("hidden-state-field");
                        return null === a ? null : a.innerText
                    },
                    g = function (a) {
                        var b = f.contentWindow.document;
                        c.innerText = a;
                        b.open();
                        b.write('\x3chtml\x3e\x3cbody\x3e\x3cspan id\x3d"hidden-state-field"\x3e' + c.innerHTML + "\x3c/span\x3e\x3c/body\x3e\x3c/html\x3e");
                        b.close()
                    },
                    m = function () {
                        var c, e, p, h, n = f.contentWindow;
                        !n || !n.document ? setTimeout(m, 20) : (e = l(), c = b.location.hash, d && 0 === c.length ? g("#!/" + b.location.search.slice(1)) : g(c), setInterval(function () {
                            p = l();
                            h = b.location.hash;
                            if (e !== p) {
                                if (e && "#" != e || p && "#" != p) {
                                    b.location.hash = p;
                                    var d = p.slice(3),
                                        f = null !== e ? e.slice(3) : e;
                                    k(d, f);
                                    a();
                                    e = c = p
                                }
                            } else if (h !== c && (c && "#" != c || h && "#" != h)) c = h, g(h)
                        }, 100))
                    };
                a = function () {
                    return l().slice(3)
                };
                e = function (a) {
                    g("#!/" + a);
                    window.location.hash = "#!/" + a
                };
                f.style.display = "none";
                document.body.appendChild(f);
                m()
            };
        return {
            setState: function (a) {
                e(a)
            },
            getState: function () {
                return a()
            },
            isBrowserSupported: function () {
                return g
            },
            init: function (f, h) {
                q.userAgent.isIE6 || (k = f, h.useQuery !== r && (d = h.useQuery), !("onhashchange" in window) || 8 > document.documentMode ? m(h) : (Boolean(b.history && b.history.pushState && h.usePushState) ? (a = function () {
                    return b.location.search.slice(1)
                }, e = function (a) {
                    b.history.pushState({}, "Sfdc.History", "?" + a);
                    b.onpopstate()
                }, b.onpopstate = function () {
                    var b = a();
                    k(b, c);
                    a();
                    c = a()
                }) : (a = function () {
                    var a = b.location.href.split("#")[1];
                    return a ? a.slice(2) : ""
                }, e = function (a) {
                    b.location.hash = "!/" + a
                }, b.onhashchange !== r || window.hasOwnProperty("onhashchange") ? ("" === a() && d && (b.location.hash = "!/" + b.location.search.slice(1)), b.onhashchange = function () {
                    var b = a();
                    k(b, c);
                    a();
                    c = a()
                }) : g = !1), c = a(), k(c, void 0), a()))
            }
        }
    } ();
    return {
        onChange: function () {
            var a = arguments;
            e ? e.addListener(a) : s.push(a)
        },
        update: function () {
            e.updateState.apply(e, arguments)
        },
        replace: function (a) {
            e.replaceState(a)
        },
        isBrowserSupported: function () {
            return n.isBrowserSupported()
        },
        init: function (a) {
            a =
                a || {};
            a.window && (b = a.window);
            e = new u(s);
            n.init(e.handleState, a);
            this.init = function () { };
            t = !0
        },
        isInit: function () {
            return t
        }
    }
} (Sfdc));
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
            a: 
            {
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
} (Sfdc));
Sfdc.provide("Sfdc.LocalStorage", function (h) {
    function f() {
        h.localStorage ? (k = p, e = new l(h.localStorage)) : h.document && h.document.body.addBehavior ? (k = q, e = new m(r, s, h.document)) : (k = t, e = new u);
        f = function () { }
    }

    function n(a, b) {
        Sfdc.log("Removing all local storage data with prefix: " + b);
        for (var d = a.keys(), c = 0; c < d.length; c++) 0 === d[c].indexOf(b) && (Sfdc.log("\tRemoving: " + d[c]), a.removeItem(d[c]))
    }

    function l(a) {
        this.ls = a
    }

    function u() {
        var a = {};
        this.clear = function () {
            a = {}
        };
        this.getItem = function (b) {
            return a[b]
        };
        this.keys =
            function (b) {
                return Object.keys(a)
            };
        this.length = function (a) {
            return this.keys().length
        };
        this.removeItem = function (b) {
            delete a[b]
        };
        this.setItem = function (b, d) {
            a[b] = d
        }
    }

    function m(a, b, d) {
        var c = d.createElement("span");
        c.id = a;
        c.addBehavior("#default#userData");
        d.body.appendChild(c);
        c.load(a);
        this.el = c;
        this.userDataPath = a;
        this.userDataName = b;
        try {
            this.data = Sfdc.JSON.parse(c.getAttribute(b)), this.data || (this.data = {})
        } catch (e) {
            this.data = {}
        }
    }
    var t = 0,
        p = 1,
        q = 3,
        e = {},
        k = 0,
        r = "sfdc_user_data",
        s = "user_data",
        g = {
            clear: function (a) {
                f();
                try {
                    e.clear(a)
                } catch (b) {
                    return g.onError(b)
                }
            },
            getItem: function (a) {
                f();
                try {
                    return e.getItem(a)
                } catch (b) {
                    return g.onError(b)
                }
            },
            keys: function () {
                f();
                try {
                    return e.keys()
                } catch (a) {
                    return g.onError(a)
                }
            },
            length: function () {
                f();
                return e.length()
            },
            removeItem: function (a) {
                f();
                try {
                    e.removeItem(a)
                } catch (b) {
                    return g.onError(b)
                }
            },
            setItem: function (a, b) {
                f();
                try {
                    e.setItem(a, b)
                } catch (d) {
                    return g.onError(d)
                }
            },
            getMode: function () {
                f();
                return k
            },
            onError: function (a) {
                throw {
                    name: "StorageError",
                    message: a.message
                };
            }
        };
    l.prototype = {
        clear: function (a) {
            a ? n(this, a) : this.ls.clear()
        },
        getItem: function (a) {
            return this.ls.getItem(a)
        },
        keys: function () {
            return Object.keys(this.ls)
        },
        length: function () {
            return this.ls.length
        },
        removeItem: function (a) {
            return this.ls.removeItem(a)
        },
        setItem: function (a, b) {
            return this.ls.setItem(a, b)
        }
    };
    m.prototype = {
        clear: function (a) {
            a ? n(this, a) : this.data = {};
            this.saveData()
        },
        getItem: function (a) {
            return this.data.hasOwnProperty(a) ? this.data[a] : null
        },
        keys: function () {
            return Object.keys(this.data)
        },
        length: function () {
            var a =
                0,
                b;
            for (b in this.data) this.data.hasOwnProperty(b) && (a += 1);
            return a
        },
        removeItem: function (a) {
            delete this.data[a];
            this.saveData()
        },
        saveData: function () {
            var a = Sfdc.JSON.stringify(this.data);
            this.el.setAttribute(this.userDataName, a);
            this.el.save(this.userDataPath)
        },
        setItem: function (a, b) {
            this.data[a] = b;
            this.saveData()
        }
    };
    return g
} (this));
Sfdc.provide("Sfdc.Logging", function (g) {
    function l(a) {
        if (!k) {
            var b = g.Logging.LogLevel.GACK;
            try {
                var e = g.Logging.formatError(a);
                g.log(e.subject, b, e);
                g.logServer("WINDOWERROR", e, b)
            } catch (d) { }
        }
    }

    function m(a, b) {
        var e = {
            msg: 1,
            url: 1,
            message: 1,
            stack: 1
        },
            d;
        for (d in b)
            if (b.hasOwnProperty(d)) {
                var c = g.isFunction(b[d]),
                    f = a.hasOwnProperty(d),
                    h = e.hasOwnProperty(d);
                !c && (!f && !h) && (a[d] = b[d])
            }
    }
    var k = !1;
    return {
        startWindowErrorListener: function () {
            if (window.onerror && window.onerror.cache)
                for (var a = window.onerror.cache, b =
                    0, e = a.length; b < e; b++) l(a[b]);
            g.Function.wrap(window, "onerror", function (a, c, b) {
                l({
                    msg: a,
                    url: c,
                    lines: b
                })
            });
            g.Logging.startWindowErrorListener = function () {
                k = !1
            }
        },
        stopWindowErrorListener: function () {
            k = !0
        },
        formatError: function (a) {
            var b = {},
                e = "(" + window.location.pathname + ") ";
            if (g.isString(a.msg)) b.subject = e + a.msg, g.isDefAndNotNull(a.url) && (e = a.url.split("/").pop(), b.trace = this._createTraceLine("", "", e, a.lines)), m(b, a);
            else {
                var d = g.userAgent;
                try {
                    var c = a.message,
                        f = null;
                    if (d.isFirefox) f = this._parseFFError(a.stack.split("\n"));
                    else if (d.isChrome) f = this._parseChromeError(a.stack.split("\n"));
                    else if (d.isSafari) f = this._parseSafariError(a);
                    else
                        for (var f = [], h = arguments.callee.caller, d = {}; h; ) {
                            if (!d[h]) {
                                f.push("Unable to trace caller past recursion entry point.");
                                break
                            }
                            var k = h.toString(),
                                l = k.substr(k.indexOf("function"), k.indexOf(")") + 1);
                            f.push(l);
                            d[h] = !0;
                            h = h.caller
                        }
                    b.subject = e + c;
                    m(b, a);
                    f && (b.trace = f.join("\\n"))
                } catch (n) {
                    a.message && (b.subject = e + a.message)
                }
            }
            return b
        },
        _parseFFError: function (a) {
            for (var b = [], e = a.length, d = 0; d < e; d++) {
                var c =
                    a[d];
                if (c) {
                    var f = c.substring(0, c.indexOf("@")),
                        c = c.split("/"),
                        c = c[c.length - 1],
                        c = c.split(":");
                    b.push(this._createTraceLine("", f, c[0], c[1]))
                }
            }
            return b
        },
        _parseChromeError: function (a) {
            for (var b = [], e = a.length, d = 0; d < e; d++) {
                var c = g.String.trim(a[d]);
                if (c && 0 === c.indexOf("at")) {
                    var f = ["", ""],
                        c = c.split(" ");
                    3 === c.length && (f = c[1].split("."));
                    c = c[3 === c.length ? 2 : 1].split("/");
                    c = c[c.length - 1].split(":");
                    b.push(this._createTraceLine(f[0], f[1], c[0], c[1]))
                }
            }
            return b
        },
        _parseSafariError: function (a) {
            var b = a.sourceURL.split("/");
            return this._createTraceLine("", "", b[b.length - 1], a.line)
        },
        _createTraceLine: function (a, b, e, d) {
            return [a, b, e, d].join(":")
        }
    }
} (Sfdc));
Sfdc.provide("Sfdc.Logging.LogLevel", {
    INFO: "INFO",
    WARNING: "WARNING",
    ERROR: "ERROR",
    GACK: "GACK"
});
Sfdc.provide("Sfdc.Resource", function (c) {
    function l(a, b) {
        c.Dom.create(null, {
            onload: b,
            onerror: b,
            src: a
        }, "IMG")
    }

    function m(a, b) {
        c.Dom.create(document.body, {
            width: 0,
            height: 0,
            onload: b,
            onerror: b,
            data: a,
            style: {
                position: "absolute",
                top: "-10000px"
            }
        }, "OBJECT")
    }
    var g, f = {};
    return {
        addCSS: function (a) {
            g || (g = document.head || document.getElementsByTagName("head")[0]);
            return c.Dom.create(g, {
                type: "text/css",
                href: a,
                rel: "stylesheet"
            }, "LINK")
        },
        addJavaScript: function (a, b, d) {
            function e() {
                this.onLoadDone = !0;
                b.call(this)
            }
            b = b ||
                c.Function.blank();
            d = d || document.body;
            return c.Dom.create(d, {
                type: "text/javascript",
                onLoadDone: !1,
                onreadystatechange: function () {
                    if (("complete" == this.readyState || "loaded" == this.readyState) && !this.onLoadDone) this.onLoadDone = !0, this.onreadystatechange = this.onload = null, b.call(this)
                },
                onload: e,
                onerror: e,
                src: a
            }, "script", d.ownerDocument)
        },
        addJavaScripts: function (a, b) {
            function d() {
                a.length ? c.Resource.addJavaScript(a.shift(), d) : b()
            }
            b = b || c.Function.blank();
            this.cacheScripts(a, d)
        },
        addInlineJavaScript: function (a) {
            c.Dom.create(document.body, {
                type: "text/javascript",
                text: a
            }, "script")
        },
        execScripts: function (a, b) {
            function d() {
                if (0 < a.length) {
                    var h = a.shift(),
                        e = h.src;
                    if (e) {
                        if (!f[e]) {
                            c.Resource.addJavaScript(e, d);
                            f[e] = !0;
                            return
                        }
                    } else c.Resource.addInlineJavaScript(h.text);
                    d()
                } else b()
            }
            a = c.Array.toArray(a);
            b = b || c.Function.blank();
            if (a.length) {
                var e = c.Array.map(a, function (a) {
                    return (a = a.src) ? void 0 !== f[a] && a : null
                });
                this.cacheScripts(e, d)
            } else b()
        },
        cacheScripts: function (a, b) {
            var d = 0,
                e = a.length,
                h = c.userAgent.isIE ? l : m;
            b = b || c.Function.blank();
            for (var g =
                function () {
                    ++d === e && b()
                }, f = 0, k; f < e; f++) (k = a[f]) ? h(k, g) : g()
        },
        getScriptsFromHtml: function (a) {
            return c.select("script", c.get(a))
        }
    }
} (Sfdc));
Sfdc.provide("Sfdc.String", function (d) {
    function n(a) {
        switch (a) {
            case "'":
                return "\x26#39;";
            case "\x26":
                return "\x26amp;";
            case "\x3c":
                return "\x26lt;";
            case "\x3e":
                return "\x26gt;";
            case '"':
                return "\x26quot;";
            case "\u00a9":
                return "\x26copy;";
            case "\u2028":
                return "\x3cbr\x3e";
            case "\u2029":
                return "\x3cp\x3e";
            default:
                return a
        }
    }
    return {
        capitalizationModes: {
            None: 0,
            CamelCase: 1,
            AfterControlCharacters: 2,
            RemoveControlCharacters: 4,
            ReplaceControlCharacters: 8,
            ReduceWordBody: 16
        },
        capitalize: function (a, b) {
            var c = this.capitalizationModes;
            d.isEmpty(b) && (b = c.None);
            var e = b & c.CamelCase,
                f = b & c.RemoveControlCharacters,
                g = b & c.ReplaceControlCharacters,
                h = b & c.ReduceWordBody;
            return (a || "").replace(b & c.AfterControlCharacters || f || g ? /(\s|(^[-_.]?)|[-_.])(\S)([^\s-_.]*)/g : /(\s|(^))(\S)(\S*)/g, function (a, b, c, d, m) {
                a = "" === b || c === b;
                f && " " !== b ? b = "" : g && "" !== b && (b = " ");
                d = e && a ? d.toLowerCase() : d.toUpperCase();
                h && (m = m.toLowerCase());
                return b + d + m
            })
        },
        ltrim: function (a) {
            return a && a.replace(/^[\s\u0000-\u0020]*/, "") || ""
        },
        rtrim: function (a) {
            return a && a.replace(/[\s\u0000-\u0020]*$/,
                "") || ""
        },
        trim: function (a) {
            return a && a.replace(/^[\s\u0000-\u0020]*|[\s\u0000-\u0020]*$/g, "") || ""
        },
        dashify: function (a) {
            return a.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase()
        },
        decryptXOR: function (a, b) {
            d.assert(d.isDefAndNotNull(b), "Key cannot be undefined or null");
            b = this.base64Decode(b, !1);
            for (var c = this.base64Decode(a, !1), e = [], f, g = 0, h = c.length; g < h; g++) f = decodeURIComponent(String.fromCharCode(c.charCodeAt(g) ^ (b.charCodeAt(g) || 0))), e.push(f);
            return e.join("")
        },
        toCamelCase: function (a) {
            a = a.replace(/^-/g,
                "").split("-");
            for (var b = 1, c = a.length, e; b < c; b++) e = a[b], a[b] = e.charAt(0).toUpperCase() + e.substr(1);
            return a.join("")
        },
        getIntValue: function (a, b) {
            if (0 === b) throw Error("Radix not equal to 0 must be supplied");
            var c = parseInt(a, b || 10);
            return isNaN(c) ? 0 : c
        },
        format: function (a, b) {
            return a.replace(/{([^{}]*)}/g, function (a, e) {
                var f = !b.hasOwnProperty(e) && -1 < e.indexOf(".") ? d.resolve(e, b) : b[e];
                return "string" === typeof f || "number" === typeof f ? f : a
            })
        },
        escapeToUTF8: function (a) {
            for (var b = "", c = 0; c < a.length; ) {
                var e = a.charCodeAt(c++),
                    d;
                if (128 > e) b += String.fromCharCode(e);
                else if (191 < e && 224 > e) d = a.charCodeAt(c++), b += String.fromCharCode((e & 31) << 6 | d & 63);
                else {
                    d = a.charCodeAt(c++);
                    var g = a.charCodeAt(c++),
                        b = b + String.fromCharCode((e & 15) << 12 | (d & 63) << 6 | g & 63)
                }
            }
            return b
        },
        base64Decode: function (a, b) {
            var c = [],
                e, f, g = "",
                h, l = "",
                k = 0;
            a = a.replace(RegExp("[^A-Za-z0-9+/\x3d]", "g"), "");
            do e = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)), f = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)),
                h = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)), l = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\x3d".indexOf(a.charAt(k++)), e = e << 2 | f >> 4, f = (f & 15) << 4 | h >> 2, g = (h & 3) << 6 | l, c.push(String.fromCharCode(e)), 64 != h && c.push(String.fromCharCode(f)), 64 != l && c.push(String.fromCharCode(g)); while (k < a.length);
            return void 0 === b || b ? d.String.escapeToUTF8(c.join("")) : c.join("")
        },
        escapeToHtml: function (a, b) {
            if (null == a || "" === a) return "";
            d.assert(a && d.isString(a),
                "Expected escapeToHtml(String input, Boolean escapeNewline)");
            d.assert(d.isBoolean(b || !1), "Expected escapeToHtml(String input, Boolean escapeNewline)");
            if (d.isEmpty(a)) return a;
            var c = a.replace(/[&<>"'\u00a9\u2028\u2029]/g, n);
            b && (c = c.replace(/\n/g, "\x3cbr\x3e"));
            return c
        },
        unescapeHtml: function (a, b) {
            if (null === a) return "";
            d.assert(a && d.isString(a), "expected unescapeHtml(string input, boolean replaceBRwithNewline)");
            d.assert(d.isBoolean(b || !1), "expected unescapeHtml(string input, boolean replaceBRwithNewline)");
            if (d.isEmpty(a)) return a;
            var c = a.replace(/&lt;/g, "\x3c").replace(/&gt;/g, "\x3e").replace(/&quot;/g, '"').replace(/&apos;/g, "'").replace(/&#39;/g, "'").replace(/&copy;/g, "\u00a9").replace(/&amp;/g, "\x26");
            b && (c = c.replace(/<br>/g, "\n").replace(/<br\/>/g, "\n"));
            return c
        }
    }
} (Sfdc));
(function (a, e) {
    var d = e.Mustache;
    a.provide("Sfdc.Template", {
        compile: function (b, c) {
            return d.compile(b, c)
        },
        render: function (b, c, a) {
            return d.render(b, c, a)
        }
    })
})(Sfdc, this);
Sfdc.provide("Sfdc.Units.HexColor", {
    $constructor: function (a) {
        Sfdc.assert(Sfdc.isString(a) || Sfdc.isObject(a), "Must specify a color parameter");
        this.val = a
    },
    toString: function () {
        return this.val
    },
    toRGB: function () {
        var a = this.toInt();
        return Sfdc.Units.RGBColor.fromInt(a)
    },
    toInt: function () {
        return Sfdc.Units.HexColor.toInt(this.val)
    }
});
Sfdc.apply(Sfdc.Units.HexColor, {
    fromInt: function (a) {
        if (!Sfdc.isObject(a) || Sfdc.isString(a)) throw Error("Requires rgb object as input - { r: 0, g: 0, b: 0 }");
        a = "#" + [(16 > Math.round(a.r) ? "0" : "") + Math.round(a.r).toString(16), (16 > Math.round(a.g) ? "0" : "") + Math.round(a.g).toString(16), (16 > Math.round(a.b) ? "0" : "") + Math.round(a.b).toString(16)].join("");
        return new Sfdc.Units.HexColor(a)
    },
    toInt: function (a) {
        if (Sfdc.isObject(a) || -1 < a.indexOf("rgb")) throw Error("Requires hex color as input - {String} #fffff");
        var b, c, d;
        4 == a.length && (b = a.substr(1, 1), c = a.substr(2, 1), d = a.substr(3, 1), b = parseInt(b + b, 16), c = parseInt(c + c, 16), d = parseInt(d + d, 16));
        7 == a.length && (b = parseInt(a.substr(1, 2), 16), c = parseInt(a.substr(3, 2), 16), d = parseInt(a.substr(5, 2), 16));
        return {
            r: b,
            g: c,
            b: d
        }
    },
    isHexColor: function (a) {
        return /^#?(([a-fA-F0-9]){3}){1,2}$/g.test(a)
    }
});
Sfdc.provide("Sfdc.Units.RGBColor", {
    $constructor: function (a) {
        Sfdc.assert(Sfdc.isString(a), "Must specify a color parameter as string.");
        this.val = a
    },
    toString: function () {
        return this.val.replace(/\s+/g, "")
    },
    toHex: function () {
        return Sfdc.Units.HexColor.fromInt(this.toInt())
    },
    toInt: function () {
        return Sfdc.Units.RGBColor.toInt(this.val)
    }
});
Sfdc.apply(Sfdc.Units.RGBColor, {
    fromInt: function (a) {
        if (!Sfdc.isObject || Sfdc.isString(a)) throw Error("Requires rgb object as input - { r: 0, g: 0, b: 0 }");
        a = Sfdc.String.format("rgb({r}, {g}, {b})", a);
        return new Sfdc.Units.RGBColor(a)
    },
    toInt: function (a) {
        if (-1 < a.indexOf("#")) throw Error("Requires RGB color as input - rgb(0, 0, 0)");
        a = a.match(/^rgb\((\d+),\s*(\d+),\s*(\d+)\)$/);
        return {
            r: a[1],
            g: a[2],
            b: a[3]
        }
    }
});
Sfdc.provide("Sfdc.Units.Pixel", {
    $constructor: function (a) {
        this.val = a
    },
    toString: function () {
        if (Sfdc.isNumber(this.val)) return this.val + "px";
        if (Sfdc.isString(this.val)) return this.val
    },
    toInt: function () {
        return Sfdc.Units.Pixel.toInt(this.val)
    },
    fromInt: function () {
        return Sfdc.Units.Pixel.fromInt(this.val)
    }
});
Sfdc.apply(Sfdc.Units.Pixel, {
    fromInt: function (a) {
        Sfdc.assert(!(Sfdc.isString(a) && -1 < a.indexOf("px")), "Parameter already formatted to 'px'");
        return new Sfdc.Units.Pixel(a + "px")
    },
    toInt: function (a) {
        Sfdc.assert(!Sfdc.isNumber(a), "Parameter already an int");
        return 1 * a.replace(/\D+$/gi, "")
    }
});
Sfdc.provide("Sfdc.Url", function (f) {
    var g = document.createElement("a");
    return {
        getHash: function (a) {
            a = a || window;
            return a.location.hash.substring(1)
        },
        setHash: function (a, c) {
            if ("undefined" == typeof a || "" === a) return !1;
            c = c || window;
            c.location.hash = a;
            return !0
        },
        generateQueryString: function (a, c, b) {
            var l = [],
                d = {},
                k = null;
            b = f.apply(b || {}, {
                includeMark: !0,
                escape: encodeURIComponent,
                fullUrl: !1,
                allowMultipleOfParam: !1
            }, !1);
            var h = a.split("?"),
                d = 1 < h.length ? h[1] : "";
            if (!c) return b.fullUrl ? a : d;
            d = this.getUrlParameters(d, b);
            if (b.allowMultipleOfParam)
                for (var e in c) d.hasOwnProperty(e) ? f.isArray(d[e]) ? d[e].push(c[e]) : d[e] = [d[e], c[e]] : d[e] = c[e];
            else d = f.apply(d, c, !0);
            for (var g in d)
                if (d.hasOwnProperty(g) && (k = d[g], f.isDefAndNotNull(k)))
                    if (b.allowMultipleOfParam && f.isArray(k)) {
                        a = 0;
                        for (c = k.length; a < c; a++) l.push(g + "\x3d" + b.escape(k[a]))
                    } else l.push(g + "\x3d" + b.escape(k));
            return b.fullUrl ? (b = h[0].split("#"), 1 < b.length ? b.shift() + "?" + l.join("\x26") + "#" + b.join("#") : b[0] + "?" + l.join("\x26")) : b.includeMark ? "?" + l.join("\x26") : l.join("\x26")
        },
        generateUrl: function (a, c, b) {
            b = f.apply(b || {}, {
                fullUrl: !0
            }, !0);
            return this.generateQueryString(a, c, b)
        },
        getHostFromUrl: function (a) {
            if (!f.isString(a)) return "";
            g.href = a;
            return (a = a.match(/:(\d+)/g)) ? (g.hostname || window.location.hostname) + a[0] : g.hostname || window.location.hostname
        },
        getUrlParameters: function (a, c) {
            if (!a) return {}; -1 < a.indexOf("?") && (a = a.split("?")[1]);
            var b = {};
            c = f.apply(c || {}, {
                unescape: decodeURIComponent,
                allowMultipleOfParam: !1
            });
            for (var g = a.split("\x26"), d = 0, k = g.length, h = null, e; d < k; d++) f.isEmpty(g[d]) ||
                (h = g[d].split("\x3d"), e = h[0], h = c.unescape(h[1]), c.allowMultipleOfParam && f.isDefAndNotNull(b[e]) ? f.isArray(b[e]) ? b[e].push(h) : b[e] = [b[e], h] : b[e] = h);
            return b
        },
        navigateTo: function (a, c) {
            c = c || window;
            /^#/.test(a) ? this.setHash(a, c) : c.navigateTo ? c.navigateTo(a) : c.location.href = a
        },
        resolveUrl: function (a) {
            return f.UserContext && f.UserContext.getUrl ? f.UserContext.getUrl(a) : a
        },
        stripDomainFromUrl: function (a) {
            if (!f.isString(a) || !a.length) return "";
            g.href = a;
            a = g.pathname;
            return !/^\//gi.test(a) ? "/" + a : a
        }
    }
} (Sfdc));
Sfdc.provide("Sfdc.Window", {
    getScrollX: function (a) {
        a = a || document;
        return a == document && window.pageXOffset ? window.pageXOffset : a.documentElement && a.documentElement.scrollLeft ? a.documentElement.scrollLeft : a.body.scrollLeft || 0
    },
    getScrollY: function (a) {
        a = a || document;
        return a == document && window.pageYOffset ? window.pageYOffset : a.documentElement && a.documentElement.scrollTop ? a.documentElement.scrollTop : a.body.scrollTop || 0
    },
    getWindowHeight: function () {
        if ("number" == typeof window.innerHeight) return window.innerHeight;
        if (document.documentElement && document.documentElement.clientHeight) return document.documentElement.clientHeight;
        if (document.body && document.body.clientHeight) return document.body.clientHeight
    },
    getWindowWidth: function () {
        if ("number" == typeof window.innerWidth) return window.innerWidth;
        if (document.documentElement && document.documentElement.clientWidth) return document.documentElement.clientWidth;
        if (document.body && document.body.clientWidth) return document.body.clientWidth
    }
});
(function (a) {
    a.provide("Sfdc.IDisposable", {
        dispose: function () { }
    })
})(Sfdc);
Sfdc.provide("Sfdc.IEquatable", {
    equals: function (a, b) { },
    getHashCode: function (a) { }
});
Sfdc.provide("Sfdc.IObservable", {
    attach: function (a, b) { },
    detach: function (a, b) { },
    notify: function (a, b) { }
});
(function (c) {
    c.provide("Sfdc.Class.Config", {
        setConfig: function (d) {
            var b = this.config = c.apply(this.config || {}, d || {}, !0);
            if (this.addEvent) {
                var e = /^on[A-Z]/,
                    a;
                for (a in b) d.hasOwnProperty(a) && (c.isFunction(b[a]) && e.test(a)) && (this.addEvent(a, b[a]), delete b[a])
            }
        }
    })
})(Sfdc);
(function (c) {
    c.provide("Sfdc.Class.Eventing", {
        addEvent: function (a, b, d) {
            return c.Event.add(this, ":" + a, b, d)
        },
        removeEvent: function (a, b) {
            return c.Event.remove(this, ":" + a, b)
        },
        fireEvent: function (a, b) {
            return c.Event.fireEvent(this, ":" + a, {
                data: [b]
            })
        }
    })
})(window.Sfdc);
Sfdc.provide("Sfdc.ClientLogging", function (a) {
    var d = a.log(),
        b = [];
    a.log = function () {
        a.ClientLogging.log.apply(a.ClientLogging, arguments)
    };
    a.warn = function (e, c) {
        return a.log(e, a.Logging.LogLevel.WARNING, c)
    };
    a.error = function (e, c) {
        return a.log(e, a.Logging.LogLevel.ERROR, c)
    };
    a.Function.wrap(a, "sendGack", function (e, c, b) {
        return a.log(c, a.Logging.LogLevel.GACK, b)
    });
    return {
        log: function (a, c, h) {
            for (var f = 0, g = b.length, k; f < g; f++) null !== (k = b[f]) && k.log(a, c, h);
            d.push({
                msg: a,
                level: c,
                args: h
            })
        },
        addRelay: function (e, c) {
            a.assert(e &&
                e.name, "A relay with a name property must be provided. ");
            for (var d = 0, f = b.length, g; d < f; d++)
                if ((g = b[d]) && g.name === e.name) return !1;
            b.push(e);
            c && this.flush(e);
            return !0
        },
        removeRelay: function (a) {
            for (var c = 0, d = b.length; c < d; c++) b[c] instanceof a && (b[c] = null)
        },
        flush: function (a) {
            for (var c = 0, b = d.length, f; c < b; c++) f = d[c], a.log(f.msg, f.level, f.args)
        }
    }
} (Sfdc));
Sfdc.provide("Sfdc.ClientLogging.ConsoleLogger", {
    $constructor: function () { },
    name: "ConsoleLogger",
    log: function (a, d, b) {
        if (!window.console || !Sfdc.isDefAndNotNull(a)) return !1;
        switch (d) {
            case Sfdc.Logging.LogLevel.INFO:
                window.console.log(a);
                break;
            case Sfdc.Logging.LogLevel.WARNING:
                window.console.warn(a);
                break;
            case Sfdc.Logging.LogLevel.ERROR:
                if (Sfdc.isDebug) throw a;
                Sfdc.isString(a) ? window.console.error(a) : (d = Sfdc.Logging.formatError(a), d = Sfdc.String.format("Subject: {subject}\nTrace: {trace}\n", d), window.console.error(d,
                    a));
                break;
            case Sfdc.Logging.LogLevel.GACK:
                window.console.error(a);
                break;
            default:
                window.console.log(a)
        }
    }
});
Sfdc.provide("Sfdc.ClientLogging.SeleniumLogger", {
    $constructor: function () {
        try {
            var a = top;
            this.enabled = a.LOG && Sfdc.isFunction(a.LOG.log)
        } catch (d) {
            this.enabled = !1
        }
    },
    enabled: !0,
    name: "SeleniumLogger",
    log: function (a, d, b) {
        if (!this.enabled || !Sfdc.isDefAndNotNull(a)) return !1;
        b = top;
        switch (d) {
            case Sfdc.Logging.LogLevel.INFO:
                b.LOG.log("info", a);
                break;
            case Sfdc.Logging.LogLevel.WARNING:
                b.LOG.log("warning", a);
                break;
            case Sfdc.Logging.LogLevel.ERROR:
                b.LOG.log("error", a);
                break;
            case Sfdc.Logging.LogLevel.GACK:
                b.LOG.log("error",
                    a);
                break;
            default:
                b.LOG.log("info", a)
        }
    }
});
Sfdc.provide("Sfdc.ServerLogging", function (a) {
    var e = null,
        f = [],
        h = {},
        c = {
            URL: "/_ui/common/request/servlet/JsLoggingServlet",
            LOG_NAME: "logName",
            LOG_LEVEL: "logLevel",
            LOG_ATTRS: "logAttrs",
            LOG_LINES: "logLines",
            MAX_BUFFER_SIZE: 100,
            FLUSH_SIZE: 100,
            FLUSH_INTERVAL: 1500,
            AUTO_FLUSH: !0
        };
    a.Function.wrap(a, "sendGack", function (b, c, f) {
        var d = Array.prototype.slice.call(arguments, 0);
        !1 == a.isDefAndNotNull(d[1]) ? a.warn("No error information was passed to Sfdc.sendGack()") : (d[1] = a.Logging.formatError(d[1]), d[2] = a.Logging.LogLevel.GACK,
            a.ServerLogging.log.apply(a.ServerLogging, d))
    });
    a.logServer = function (b, c, f) {
        a.ServerLogging.log.apply(a.ServerLogging, arguments)
    };
    return {
        log: function (b, g, e) {
            a.assert(b && g, "You must provide a relay key and a data object to log.");
            e = e || a.Logging.LogLevel.INFO;
            var d = this.getRelay(b);
            if (!d || !d.log(b, g, e)) d = {}, d[c.LOG_NAME] = b, d[c.LOG_LEVEL] = e, d[c.LOG_ATTRS] = g, f.push(d), f.length > c.MAX_BUFFER_SIZE && f.shift(), this.startFlushTimer()
        },
        getRelay: function (b) {
            return h[b]
        },
        addRelay: function (b, a) {
            h[b] = a
        },
        removeRelay: function (a) {
            delete h[a]
        },
        flush: function () {
            e && (clearTimeout(e), e = null);
            if (0 === f.length) return 0;
            var b = f.splice(0, c.FLUSH_SIZE),
                g = {};
            g[c.LOG_LINES] = a.JSON.stringify(b);
            a.Ajax.post(a.Url.resolveUrl(c.URL), null, {
                data: g,
                escape: encodeURI
            });
            0 < f.length && this.startFlushTimer();
            return b.length
        },
        setConfig: function (b) {
            a.apply(c, b, !0)
        },
        startFlushTimer: function () {
            if (!e && c.AUTO_FLUSH)
                if (0 < c.FLUSH_INTERVAL) {
                    var a = this;
                    e = setTimeout(function () {
                        a.flush()
                    }, c.FLUSH_INTERVAL)
                } else this.flush()
        },
        getLogQueue: function () {
            return f
        }
    }
} (Sfdc));
Sfdc.onReady(function () {
    Sfdc.isDebug && Sfdc.ClientLogging.addRelay(new Sfdc.ClientLogging.ConsoleLogger, !0)
});
Sfdc.on(window, "unload", function () {
    window.Node = window.Sizzle = window.Modernizr = window.SfdcApp = window.SfdcCmp = window.Ninja = window.sfdcPage = window.Recommend = null
});

//# sourceMappingURL=/javascript/1410512610000/sfdc/source/SfdcCore.js.map