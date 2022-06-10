/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
function SimpleDecimalFormat(a, b, c, d, e, f) {
    this.decimalSeparator = a;
    this.groupingSeparator = b;
    this.posPrefix = c;
    this.negPrefix = d;
    this.posSuffix = e;
    this.negSuffix = f
}
SimpleDecimalFormat.prototype.formatNumber = function (a) {
    a = parseFloat(a);
    var b = String(parseInt(a, 10));
    a = Math.round(100 * (a - parseInt(a, 10)));
    a = 0 > a ? -1 * a : a;
    100 == a ? (b++, a = "00") : a = 0 === a ? "00" : 10 > a ? "0" + a : String(a);
    for (var c = /(\d+)(\d{3})/; c.test(b); ) b = b.replace(c, "$1" + this.groupingSeparator + "$2");
    return b + this.decimalSeparator + a
};
SimpleDecimalFormat.prototype.formatCurrency = function (a) {
    val = parseFloat(a);
    a = this.formatNumber(a);
    if (0 <= val) return this.posPrefix + a + this.posSuffix;
    "-" == a.charAt(0) && (a = a.substr(1));
    return this.negPrefix + a + this.negSuffix
};
SimpleDecimalFormat.prototype._parseFloat = function (a) {
    a = String(a);
    if (0 > a.indexOf(this.decimalSeparator)) return parseInt(a, 10);
    a = a.split(this.decimalSeparator);
    var b = a[1] ? parseInt(a[1], 10) : 0;
    if (isNaN(a[0]) || isNaN(b)) return NaN;
    b = a[1] ? b / Math.pow(10, a[1].length) : 0;
    return parseInt(a[0], 10) + b
};
SimpleDecimalFormat.prototype._isNaN = function (a) {
    for (var b = 0; b < a.length; b++) {
        var c = a.charAt(b);
        if (isNaN(parseInt(c, 10)) && c != this.decimalSeparator) return !0
    }
    return !1
};
window.Sfdc = window.Sfdc || {};
window.Sfdc.Sales = window.Sfdc.Sales || {};
window.Sfdc.Sales.Opportunity = window.Sfdc.Sales.Opportunity || {};
Sfdc.Sales.Opportunity.togglePrivate = function (a, b) {
    var c = Sfdc.get(a);
    c && c.checked && alert(b)
};
Sfdc.Sales.Opportunity.setForecastCategory = function (a, b, c) {
    null !== Sfdc.get(a) && (Sfdc.get(a).value = Sfdc.Sales.Opportunity.oppo[c].fctCat[Sfdc.get(b).options[Sfdc.get(b).selectedIndex].value])
};
Sfdc.Sales.Opportunity.modifyForecastCategorySelect = function (a, b, c) {
    Sfdc.get(b);
    Sfdc.get(b);
    b = Sfdc.Sales.Opportunity.oppo[c].allOptions[Sfdc.Sales.Opportunity.oppo[c].fctClosedWon[Sfdc.get(b).value]];
    if (null !== Sfdc.get(a)) {
        Sfdc.get(a).length = b.length;
        for (c = 0; c < b.length; c++) Sfdc.get(a).options[c] = b[c]
    }
};
Sfdc.Sales.Opportunity.delCampaignInfluence = function (a, b, c, d, e) {
    Sfdc.Ajax.get(a, function (a) {
        a == c ? e ? window.location.reload() : window.sfdcPage.getRelatedListById(b).refresh() : a == d ? window.location.reload() : alert(a)
    })
};
//# sourceMappingURL=/javascript/1410512610000/sfdc/source/Opportunity.js.map
