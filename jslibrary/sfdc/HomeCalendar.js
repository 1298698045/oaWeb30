/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
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
        b[HomeCalendarAjaxServlet.PROPOSED_EVENT_TAB_PARAM] = a;
        a = UrlMap.convertClassNameToUrl(HomeCalendarAjaxServlet.SERVLET_NAME, null);
        Sfdc.resolve("privateapi.console") && Sfdc.resolve("DesktopContext.preserveDesktopPageUrl") && (a = DesktopContext.preserveDesktopPageUrl(a, Desktop.VIEW));
        Sfdc.Ajax.request(a, {
            success: HomeCalendar.showCalendarDiv,
            data: b
        })
    }
};
//# sourceMappingURL=/javascript/1410512610000/sfdc/source/HomeCalendar.js.map