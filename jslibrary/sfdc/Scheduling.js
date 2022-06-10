/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
var SchedulingProposeMeeting = window.parent.SchedulingProposeMeeting || {
    meetingDialog: null,
    loading: null,
    initialWidth: 1,
    padding: {
        top: 0,
        right: 0,
        bottom: 0,
        left: 0
    },
    borderWidth: 2,
    dialogContentHeight: 530,
    dialogContentWidth: "",
    init: function () {
        var a = this.getOverlayUrl();
        a && this.openAskForMeetingDialog(unescape(a))
    },
    getFrameWindowRef: function () {
        var a = document.getElementById("OrganizerFrame");
        return a && a.contentWindow
    },
    getOverlayUrl: function () {
        var a = QueryString.valueFromHash(SchedulingUtils.SCHEDULING_URL_KEY, "/");
        a || (a = QueryString.createQueryString(window.location.href).get(SchedulingUtils.SCHEDULING_URL_KEY));
        return a
    },
    openAskForMeetingDialog: function (a, b, c) {        
        b ? alert(LC.getLabel("ProposedEvent", "emailRequired")) : (this.initialWidth = c || SchedulingUtils.OVERLAY_DIALOG_WIDTH,
            this.dialogContentWidth = this.initialWidth - this.padding.right - this.padding.left - this.borderWidth,
             this.meetingDialog || (this.meetingDialog = new SimpleDialog("Organizer_Dialog", !1),
             this.meetingDialog.displayX = !0, this.meetingDialog.setTitle(LC.getLabel("ProposedEvent", "popupTitle")),
             this.meetingDialog.register(), this.setupAutoResize()), function () {
                 if (this.meetingDialog.created) {                    
                     this.setDialogSize(),
                     this.meetingDialog.setContentInnerHTML('\x3ciframe id\x3d"OrganizerFrame" src\x3d"' + a + '" width\x3d"' + this.dialogContentWidth + 'px" height\x3d"' + this.dialogContentHeight + 'px" frameborder\x3d"no"\x3e'),
                     this.meetingDialog.show(),                                          
                     this.ShowLoading(document.getElementById("Organizer_DialogContent")),
                     QueryString.clearHash();
                 }
                 else {
                    //debugger;
                     var b = this,
                    c = arguments.callee;
                     setTimeout(function () {
                         c.call(b)
                     },
                    100)
                 }
             } .call(this))
    },
    ShowLoading: function (a) {
        this.loading || (this.loading = new LoadingScreen(a, LC.getLabel("Global", "loading")));
        this.loading.show()
    },
    HideLoading: function () {
        this.loading && this.loading.hide()
    },
    setupAutoResize: function () {
        this.meetingDialog.resizeEvent = function () {
            //debugger;
            var a = document.getElementById("Organizer_Dialog"), b = !0;
            a && a.currentStyle ? "hidden" == a.currentStyle.visibility && (b = !1) : a && (a.style && "hidden" == a.style.visibility) && (b = !1);
            b && SchedulingProposeMeeting.setDialogSize();
            OverlayDialog.prototype.resizeEvent.call(this)
        }
    },
    setDialogSize: function () {
        var a = document.getElementById("Organizer_Dialog"),
            b = document.getElementById("Organizer_DialogContent");
        document.getElementById("ep");
        if (a && b) {
            b.style.padding = "0px";
            b.style.borderTop = "1px solid #FFFFFF";
            b.style.borderBottom = "1px solid #FFFFFF";
            a.style.overflowX = "auto";
            b.style.position = "relative";
            b.style.overflow = "auto";
            var c = getWindowWidth(), d = c;
            4 < c && (d = c - 2 - 2);
            c = SchedulingProposeMeeting.initialWidth > d ? d : SchedulingProposeMeeting.initialWidth;
            SchedulingProposeMeeting.meetingDialog.setWidth(c + "px");
            b.style.width = c - SchedulingProposeMeeting.padding.right - SchedulingProposeMeeting.padding.left - SchedulingProposeMeeting.borderWidth + "px";
            c = getWindowHeight() - SchedulingProposeMeeting.padding.top - SchedulingProposeMeeting.padding.bottom - SchedulingProposeMeeting.borderWidth - 2 - 2 - 31;
            d = SchedulingProposeMeeting.dialogContentHeight;
            Sfdc.userAgent.isSafari && (b = document.getElementById("Organizer_DialogInner"));
            b.style.height = d > c ? c + "px" : d + "px";
            a.style.overflow = "hidden"
        }
    }
};
if ("undefined" != typeof addEvent) addEvent(window, "load", function () {
    SchedulingProposeMeeting.init()
});
else if ("undefined" != typeof Ext) Ext.onReady(function () {
    addEvent(window, "load", function () {
        SchedulingProposeMeeting.init()
    })
});
//# sourceMappingURL=/javascript/1410512610000/sfdc/source/Scheduling.js.map