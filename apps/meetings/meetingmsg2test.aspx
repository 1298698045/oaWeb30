<%@ Page Language="C#" AutoEventWireup="true" %>

<%@ Register Assembly="HRCore" Namespace="Youyou.HRCore.Web.UI" TagPrefix="ctl" %>
<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="ext-strict" style="">
<head>
    <script src="/static/111213/js/perf/stub.js"></script>
    <title>会议 - 会议管理 ~  - 高效协同</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <%--    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/ManyWhoStyles.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/Calendar.css" rel="stylesheet" type="text/css" />--%>
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/<%=Supermore.WebContext.SkinName%>/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/<%=Supermore.WebContext.SkinName%>/dCustom0.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="/css/cntrt/cntrt.css">
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/<%=Supermore.WebContext.SkinName%>/extended.css" rel="stylesheet"
        type="text/css" />

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/EXT/ext-3.0.0/ext-core.js"></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script type="text/javascript" src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script type="text/javascript" src="/js/CommonUtils.js"></script>
    <link href="/easyui/themes/icon.css" rel="stylesheet" type="text/css" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/mycal.css" rel="stylesheet" />
    <link href="/template/css/layui.css" rel="stylesheet" />
    <link href="/template/css/date.css" rel="stylesheet" />
    <script type="text/javascript">
        function loadNew() {
            if (!commonUtils.isBrowserSupported() || commonUtils.IS_IE8 || commonUtils.IS_IE7) {
                window.location = "/apps/meetings/mtgCal.aspx?t=00V";
            }
        }
        loadNew();
    </script>
    <style>
        .eventTab .brdPalette {
            width: 100%;
        }

        .calendar1 .calendarDay {
            width: 100%;
        }

        .calendar1 .eventList {
            width: calc(100% - 1px);
        }

        .calendar3 .calendarKey {
            background-color: #fff;
        }

        .meetingroom-message-hover2 {
            padding: 5px;
        }

        .calendar3 .meetingroom-message {
            min-height: 59px;
        }

        .calendar3{
            display:none;
        }

        .calendar1 .meetingroom-message {
            min-height: 59px;
        }

        .meetingroom-message {
            border-color: #0070d2;
        }
        #iframe {
            position: fixed;
            z-index: 1001;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: none;
            height: 620px;
            border: 0;
            display: inline;
            height: 620px;
            margin-top: -310px;
        }
        .popup-mask {
            opacity: 0.4;
            position: absolute;
            z-index: 1000;
            background-color: #000;
            height: 100%;
            width: 100%;
            display: none;
            left:0px;
        }
        .meetingroom-message.widthitem2{
            height:35px;
            padding-top:2px;
        }
        .meetingroom-message-hover-foot{
            margin-top:0;
        }
    </style>
</head>
<body onunload="if(this.bodyOnUnload)bodyOnUnload();" onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}" onload="if(this.bodyOnLoad)bodyOnLoad();" class="hasMotif solutionTab   ext-gecko ext-gecko3 sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();">
    <div id="contentWrapper" style="vertical-align: middle">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd">
            <div class="miss-header">
                <div class="header-left-logo">
                    <img src="/img/images/meetingmsg.png" />
                </div>
                <div class="header-left-title">
                    <p class="header-left-title-name">会议</p>
                    <p class="header-left-title-time">2019年4月29日 星期一</p>
                </div>
                <%--<div class="header-mi-sign">
            <div class="sign-item">
                <div class="sign-item-color color-sp"></div>
                <div class="sign-item-name">
                    已通过
                </div>
            </div>
            <div class="sign-item">
                <div class="sign-item-color color-notstart"></div>
                <div class="sign-item-name">
                    未审批
                </div>
            </div>
            <div class="sign-item">
                <div class="sign-item-color color-started"></div>
                <div class="sign-item-name">
                    未通过
                </div>
            </div>
            <div class="sign-item">
                <div class="sign-item-color color-end"></div>
                <div class="sign-item-name">
                    已结束
                </div>
            </div>
        </div>--%>
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
                                <li>星期</li>
                                <li class="active">月</li>
                                <li>列表</li>
                            </ul>
                        </div>
                    </div>
                    <div class="buttonbtn-group">
                        <div class="buttonbtn newbtn">新建会议</div>
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
                        <div class="calendarDay">
                            <div class="eventList"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="calendar calendar2">
                <div class="calendarTop bumpForScrollBar">
                    <div class="calendarDayHeaders">
                        <strong class="widthitem3 calenderDayHeader" time="2019-10-27">周日</strong>
                        <strong class="widthitem3 calenderDayHeader" time="2019-10-27">周一</strong>
                        <strong class="widthitem3 calenderDayHeader" time="2019-10-27">周二</strong>
                        <strong class="widthitem3 calenderDayHeader" time="2019-10-27">周三</strong>
                        <strong class="widthitem3 calenderDayHeader" time="2019-10-27">周四</strong>
                        <strong class="widthitem3 calenderDayHeader" time="2019-10-27">周五</strong>
                        <strong class="widthitem3 calenderDayHeader" time="2019-10-27">周六</strong>
                    </div>
                    <div class="calendarTrough">
                        <ul class="calendarTroughContainer week">
                        </ul>
                    </div>
                </div>
                <div class="calendarRow">
                    <div class="rowCore">
                        <div class="scroll">
                        </div>
                    </div>
                </div>
            </div>
            <div class="slds-brand-band-zhou">
                <div class="calendar calendar3">
                    <div class="calendarTop bumpForScrollBar">
                        <div class="calendarUserTimezoneOffset">
                            <strong class="rili_calender_strong">
                                <span>时间</span>
                            </strong>
                        </div>
                        <div class="calendarDayHeaders">
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周日)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周日)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周日)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周日)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周日)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周日)</strong>
                            <strong class="widthitem3 calenderDayHeader" time="2019-10-27">11/1(周日)</strong>
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
                            <div class="calendarDay ">
                                <div class="eventList widthitem3"></div>
                            </div>
                            <div class="calendarDay">
                                <div class="eventList widthitem3"></div>
                            </div>
                            <div class="calendarDay">
                                <div class="eventList widthitem3"></div>
                            </div>
                            <div class="calendarDay">
                                <div class="eventList widthitem3"></div>
                            </div>
                            <div class="calendarDay">
                                <div class="eventList widthitem3"></div>
                            </div>
                            <div class="calendarDay">
                                <div class="eventList widthitem3"></div>
                            </div>
                            <div class="calendarDay">
                                <div class="eventList widthitem3"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="calder-content">
                    <div class="calder-content-head">
                        <p>28</p>
                        <p>星期日</p>
                    </div>
                    <div id="time-chook"></div>
                    <div class="calendarListPanel" style="display: none;">
                        <div class="calendarListPanel-item">
                            <div class="calendarListPanel-item-head">
                                <div class="calendarListPanel-item-head-left">
                                    <span>我的日历</span>
                                </div>

                            </div>
                            <div class="calendarListPanel-item-body">
                                <div class="calendarListPanel-item-body-left">
                                    <div class="item-color"></div>
                                    <div class="calendarlist-item-name">我的事件</div>
                                </div>
                                <div class="calendarListPanel-item-body-right selectbuttonbtn">
                                    <div class="selectlist2">
                                        <ul class="">
                                            <li>仅显示此日历</li>
                                            <li class="sharecal">共享日历</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="calendarListPanel-item-head">
                                <div class="calendarListPanel-item-head-left">
                                    <span>其他日历</span>
                                </div>
                                <div class="calendarListPanel-item-head-right">
                                    <div class="selectlist2">
                                        <ul class="">
                                            <li class="addcal">添加日历</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="calendarListPanel-item-body">
                                <div class="calendarListPanel-item-body-left">
                                    <div class="item-color"></div>
                                    <div class="calendarlist-item-name">我的事件</div>
                                </div>
                                <div class="calendarListPanel-item-body-right">
                                    <div class="selectlist2">
                                        <ul class="scrollable">
                                            <li>仅显示此日历
                                            </li>
                                            <li>添加事件
                                            </li>
                                            <li>可拆卸共享日历
                                            </li>
                                            <li style="border-top: 1px solid #cccccc; height: 1px;"></li>
                                            <li class="calendarCalendarColorMenuItem">
                                                <span class="colorItem" style="background-color: #e1b4e8;"></span>
                                            </li>
                                            <li class="calendarCalendarColorMenuItem">
                                                <span class="colorItem" style="background-color: #c2c9e7;"></span>
                                            </li>
                                            <li class="calendarCalendarColorMenuItem">
                                                <span class="colorItem" style="background-color: #a6d5f8"></span>
                                            </li>
                                            <li class="calendarCalendarColorMenuItem">
                                                <span class="colorItem" style="background-color: #96dfd3"></span>
                                            </li>
                                            <li class="calendarCalendarColorMenuItem">
                                                <span class="colorItem" style="background-color: #96e9b9"></span>
                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #f9ea93"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #f9ce94"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #bc35bc"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #5679c1"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #3e8ede"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #00aea9"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #3eba4d"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #f6bc26"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #f7931e"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #570d8c"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #001970"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #0b2399"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #0a7476"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #0a6b51"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">

                                                <span class="colorItem" style="background-color: #b67d11"></span>

                                            </li>
                                            <li class="calendarCalendarColorMenuItem">
                                                <span class="colorItem" style="background-color: #b75d0d"></span>
                                            </li>
                                            <li style="clear: both; height: 0px"></li>
                                            <li>选择自定义颜色
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="calder calderlist">
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
                        <p>召集人: <span class="OwningUserName"></span></p>
                        <p style="margin-bottom:5px;">会议内容: <span class="TelePhone"></span></p>
                        <%--<p></p>--%>
                        <p>开始：<span class="ScheduledStart"></span></p>
                        <p>备注：<span class="Description"></span></p>
                    </div>
                    <div class="meetingroom-message-hover-body-message">
                        <p>会议地点: <span class="Roomname"></span></p>
                        <p style="margin-bottom:5px;">参会人: <span class="attachs"></span></p>
                        <%--<p></p>--%>
                        <p>结束: <span class="ScheduledEnd"></span></p>
                        <%--<p></p>--%>
                    </div>
                </div>
                <div class="meetingroom-message-hover-foot">
                    <div class="meetingroom-message-hover-left" style="margin-bottom:10px;display:block;width:100%;">
                        更多详细信息
                    </div>
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
        <script src="/js/schedule.js"></script>
        <script src="/js/laydate/laydate.js"></script>
        <script src="/template/js/indexjs.js"></script>
        <script src="/js/meeting/meeting2test.js"></script>
        <script src="/js/alert.js"></script>
</body>
</html>
