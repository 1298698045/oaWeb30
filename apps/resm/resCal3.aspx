<%@ Page Language="C#" AutoEventWireup="true" %>
<%@ Register Assembly="Yoyou.UIFramework" Namespace="Youyou.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议室使用情况 - 会议室管理 ~  - 高效协同</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/css/cntrt/cntrt.css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/jslibrary/sfdc/source/Chatter.js"></script>
    <script src="/jslibrary/sfdc/source/UserProfile.js"></script>
    <link rel="shortcut icon" href="https://ap1..com/favicon.ico" />
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script> 
    <script type="text/javascript">
        function loadNew() {
            if (!commonUtils.isBrowserSupported() || commonUtils.IS_IE8 || commonUtils.IS_IE7) {
                window.location = "/apps/resm/ResScheduleview.aspx?t=025";
            }
        }
        loadNew();
    </script>
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/meetingroom.css" rel="stylesheet" />
    <link href="/template/css/layui.css" rel="stylesheet" />
    <link href="/template/css/date.css" rel="stylesheet" />

    <link rel="stylesheet" href="/js/layoutlist/layoutlist.css" />
    <link rel="stylesheet" href="/template/css/indexStyle.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/common.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/icon/iconfont.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layout.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/layoutAside.css" />
    <link rel="stylesheet" href="/sCSS/49.0/sprites/1585769954000/Theme3/zh/blue/home.css" />
    <link rel="stylesheet" href="/css/meetingroom.css" />
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif campaignTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <div id="contentWrapper" style="vertical-align: middle">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="miss-header">
                <div class="header-left-logo">
                    <img src="/template/hearder/logo.png" />
                </div>
                <div class="header-left-title">
                    <p class="header-left-title-name">会议室预约</p>
                    <p class="header-left-title-time">2019年4月29日 星期一</p>
                </div>
                <div class="header-mi-sign">
                    <div class="sign-item">
                        <div class="sign-item-color color-sp"></div>
                        <div class="sign-item-name">
                            待审批
                        </div>
                    </div>
                    <%--<div class="sign-item">
                        <div class="sign-item-color color-notstart"></div>
                        <div class="sign-item-name">
                            未审批
                        </div>
                    </div>--%>
                    <div class="sign-item">
                        <div class="sign-item-color color-started"></div>
                        <div class="sign-item-name">
                            已通过
                        </div>
                    </div>
                    <div class="sign-item">
                        <div class="sign-item-color color-end"></div>
                        <div class="sign-item-name">
                            已拒绝
                        </div>
                    </div>
                </div>
                <div class="header-right-buttonbtn">
                    <div class="buttonbtn-group">
                        <div class="prev-buttonbtn"></div>
                        <div class="next-buttonbtn"></div>
                    </div>
                    <div class="buttonbtn tody tody-true">
                        <div>今天</div>
                    </div>
                    <div class="buttonbtn shuaxin">
                    </div>
                    <div class="buttonbtn calander selectbuttonbtn">
                        <div class="selectlist selectlistcheck">
                            <ul class="daytype-chook">
                                <li>日</li>
                                <li class="active">星期</li>
                                <li>月</li>
                                <li>我的预约</li>
                                <li>报表</li>
                                <li>预约查询</li>
                            </ul>
                        </div>
                    </div>
                    <div class="buttonbtn-group">
                        <div class="buttonbtn newbtn">新建</div>
                        <%--<div class="buttonbtn">导出</div>--%>
                    </div>
                    <%--<div class="buttonbtn">
                <div>会议室管理</div>
            </div>
            <div class="buttonbtn">
                <div>车辆管理</div>
            </div>--%>
                    <div class="buttonbtn sort active">
                        <div></div>
                    </div>
                </div>
            </div>
            <div class="calendar calendar1">
                <div class="calendarTop bumpForScrollBar">
                    <div class="calendarUserTimezoneOffset">
                        <strong class="rili_calender_strong">
                            <span>时间</span>
                        </strong>
                    </div>
                    <div class="calendarDayHeaders">
                    </div>
                    <div class="calendarTrough">
                        <ul class="calendarTroughContainer week">
                        </ul>
                    </div>
                </div>
                <div class="calendarRow">
                    <div class="calendarKey">
                        <strong time=""></strong>
                        <strong time="08:00">
                            <span>8:00</span>
                        </strong>
                        <strong time="09:00">
                            <span>9:00</span>
                        </strong>
                        <strong time="10:00">
                            <span>10:00</span>
                        </strong>
                        <strong time="11:00">
                            <span>11:00</span>
                        </strong>
                        <strong time="12:00">
                            <span>12:00</span>
                        </strong>
                        <strong time="13:00">
                            <span>13:00</span>
                        </strong>
                        <strong time="14:00">
                            <span>14:00</span>
                        </strong>
                        <strong time="15:00">
                            <span>15:00</span>
                        </strong>
                        <strong time="16:00">
                            <span>16:00</span>
                        </strong>
                        <strong time="17:00">
                            <span>17:00</span>
                        </strong>
                        <strong time="18:00">
                            <span>18:00</span>
                        </strong>
                        <strong time="19:00">
                            <span>19:00</span>
                        </strong>
                        <strong time="20:00">
                            <span>20:00</span>
                        </strong>
                        <strong time="21:00">
                            <span>21:00</span>
                        </strong>
                    </div>
                    <div class="rowCore">
                        <div class="scroll"></div>
                    </div>
                </div>
            </div>
            <div class="calendar calendar2">
                <div class="calendarTop bumpForScrollBar">
                    <div class="calendarUserTimezoneOffset">
                        <strong class="rili_calender_strong">
                            <span>会议室</span>
                        </strong>
                    </div>
                    <div class="calendarDayHeaders">
                    </div>
                    <div class="calendarTrough">
                        <ul class="calendarTroughContainer week">
                        </ul>
                    </div>
                </div>
                <div class="calendarRow">
                    <div class="calendarRow">
                        <div class="rowCore">
                        <div class="scroll">
                            <table id="yuecaltable">
                       </table>
                        <div class="table-flexleft"></div>

                        </div>

                        </div>
                    </div>
                </div>
            </div>
            <div class="slds-brand-band-zhou">
                <div class="calendar calendar3">
                    <div class="calendarTop bumpForScrollBar">
                        <div class="calendarUserTimezoneOffset">
                            <strong class="rili_calender_strong">
                                <span>会议室</span>
                            </strong>
                        </div>
                        <div class="calendarDayHeaders">
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周天)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周天)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周天)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周天)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周天)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周天)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周天)</strong>
                        </div>
                        <div class="calendarTrough">
                            <ul class="calendarTroughContainer week">
                            </ul>
                        </div>
                    </div>
                    <div class="calendarRow">
                       <table id="zhoucaltable">
                       </table>
                    </div>
                </div>
                <div class="calder-content">
                    <div class="calder-content-head">
                        <p>28</p>
                        <p>星期日</p>
                    </div>
                    <div id="time-chook"></div>
                </div>
            </div>
            <div class="calder calderlist">
                <div>
                    <div id="gridContainer"></div>
                </div>
            </div>
        </div>
        <div class="meetingroom-message-hover meetingroom-message-hover1">
            <div>
                <div class="close"></div>
                <div class="meetingroom-message-hover-point"></div>
                <div class="meetingroom-message-hover-title">
                    <div class="header-left-logo">
                        <img src="/template/hearder/logo.png" />
                    </div>
                    <div class="header-left-title">
                        <p class="header-left-title-name">医院医务流程讨论</p>
                    </div>
                </div>
                <div class="meetingroom-message-hover-body">
                    <div class="meetingroom-message-hover-body-message">
                        <p>预约人: <span class="OwningUserName">李丽燕</span></p>
                        <p>联系电话: <span class="TelePhone">135678489465498</span></p>
                        <p></p>
                        <p>开始：<span class="ScheduledStart">content</span></p>
                        <p>备注：<span class="Description"></span></p>
                    </div>
                    <div class="meetingroom-message-hover-body-message">
                        <p>会议室: <span class="Roomname">2号楼国际交流中心</span></p>
                        <p>会议室设备: <span class="attachs"></span></p>
                        <p></p>
                        <p>结束: <span class="ScheduledEnd">content</span></p>
                        <p></p>
                    </div>
                </div>
                <div class="meetingroom-message-hover-foot">
                    <%--<div class="meetingroom-message-hover-left">
                        更多详细信息
                    </div>--%>
                    <div class="meetingroom-message-hover-foot-right">
                        <div class="buttonbtn">部门审批</div>
                        <div class="buttonbtn">管理员审批</div>
                        <div class="buttonbtn">编辑</div>
                        <div class="buttonbtn">删除</div>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="meetingroom-message-hover meetingroom-message-hover2">
            <div>
                <div class="close"></div>
                <div class="meetingroom-message-hover-point"></div>
                <div class="meetingroom-message-hover-title">
                    <div class="header-left-logo">
                        <img src="/template/hearder/logo.png" />
                    </div>
                    <div class="header-left-title">
                        <p class="header-left-title-name">星期一，四月 29</p>
                    </div>
                </div>
                <div class="meetingroom-message-hover-body">
                    <div class="meetingroom-message meetingroom-message1 meetingroom-moremessage">
                        <p>
                            已被张丽萍预约
                <span>8:00</span>-<span>9:00</span>
                            <span>医院医务流程讨论</span>
                        </p>
                    </div>
                    <div class="meetingroom-message meetingroom-message2 meetingroom-moremessage">
                        <p>
                            已被张丽萍预约
                <span>8:00</span>-<span>9:00</span>
                            <span>医院医务流程讨论</span>
                        </p>
                    </div>
                    <div class="meetingroom-message meetingroom-message3 meetingroom-moremessage">
                        <p>
                            已被张丽萍预约
                <span>8:00</span>-<span>9:00</span>
                            <span>医院医务流程讨论</span>
                        </p>
                    </div>
                    <div class="meetingroom-message meetingroom-message4 meetingroom-moremessage">
                        <p>
                            已被张丽萍预约
                <span>8:00</span>-<span>9:00</span>
                            <span>医院医务流程讨论</span>
                        </p>
                    </div>
                    <div class="meetingroom-message meetingroom-message4 meetingroom-moremessage">
                        <p>
                            已被张丽萍预约
                <span>8:00</span>-<span>9:00</span>
                            <span>医院医务流程讨论</span>
                        </p>
                    </div>
                    <div class="meetingroom-message meetingroom-message4 meetingroom-moremessage">
                        <p>
                            已被张丽萍预约
                <span>8:00</span>-<span>9:00</span>
                            <span>医院医务流程讨论</span>
                        </p>
                    </div>

                </div>
                <div class="meetingroom-message-hover-foot"></div>
                <div class="clear"></div>
            </div>
        </div>
        <div class="card-hover-point"></div>
        <iframe id="iframe" style="display: none;"></iframe>
        <div class="popup-mask"></div>
        <script src="/js/alert.js"></script>
        <script src="/js/schedule.js"></script>
        <script src="/js/laydate/laydate.js"></script>
        <script src="/template/js/indexjs.js"></script>
        <script src="/template/js/meetingroom3.js?a=1"></script>
        <script src="/template/js/Calendar-lunar.js?a=1"></script>
        <script>
            $('.daytype-chook li').eq(4).off()
            $('.daytype-chook li').eq(4).click(function () {
                window.location.href = '/apps/room/home.aspx?t=025'
            })
            $('.daytype-chook li').eq(3).click(function () {
                window.location.href = '/apps/room/reservationlst.aspx?entityType=025&t=025'
            });
            $('.daytype-chook li').eq(5).click(function () {
                window.location.href = '/apps/resm/appointlst.aspx?entityType=025&t=025'
            });
            $('.meetingroom-message-hover-left').click(function () {
                var id = $('.meetingroom-message-hover-foot-right>div').eq(1).attr('id')
                window.open('/025/detail?objectTypeCode=20035&id=' + id + "&retURL=/025/c")
                return false;
            })
        </script>
</body>
</html>