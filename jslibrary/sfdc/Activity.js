/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
function ActivityFunction(){ownerIdId=userId=isVisibleInSelfServiceId=whatLookupId=whatLinkId=whatIdId=whatNameId=leadPrefix=null}ActivityFunction.recurrenceEndDateId=null;ActivityFunction.recurrenceEndDateErrorElem=null;
ActivityFunction.initWhoWhatFieldsWithJsonObj=function(a){ActivityFunction.initWhoWhatFields(a[EventUi.LEAD_PREFIX_PARAM_NAME],a[EventUi.WHO_NAME_PARAM_NAME],a[EventUi.WHO_ID_PARAM_NAME],a[EventUi.WHO_LINK_PARAM_NAME],a[EventUi.WHO_TYPE_PARAM_NAME],a[EventUi.WHAT_NAME_PARAM_NAME],a[EventUi.WHAT_ID_PARAM_NAME],a[EventUi.WHAT_LINK_PARAM_NAME],a[EventUi.WHAT_TYPE_PARAM_NAME],a[EventUi.VISIBLE_IN_SS_PARAM_NAME],a[EventUi.EVENT_OWNER],a[EventUi.CURRENT_USER])};
ActivityFunction.initWhoWhatFields=function(a,b,c,d,e,f,g,h,k,l,m,n){ActivityFunction.leadPrefix=a;ActivityFunction.whoNameId=b;ActivityFunction.whoIdId=c;ActivityFunction.whoLinkId=d;ActivityFunction.whoLookupId=e;ActivityFunction.whatNameId=f;ActivityFunction.whatIdId=g;ActivityFunction.whatLinkId=h;ActivityFunction.whatLookupId=k;ActivityFunction.isVisibleInSelfServiceId=l;ActivityFunction.ownerIdId=m;ActivityFunction.userId=n};
ActivityFunction.dswt=function(){var a=document.getElementById(ActivityFunction.whatNameId),b=document.getElementById(ActivityFunction.whatLinkId),c=document.getElementById(ActivityFunction.whatLookupId);a&&(a.disabled=!0);b&&(b.style.display="none");c&&(c.disabled=!0)};
ActivityFunction.enwt=function(){var a=document.getElementById(ActivityFunction.whatNameId),b=document.getElementById(ActivityFunction.whatLinkId),c=document.getElementById(ActivityFunction.whatLookupId);a&&(a.disabled=!1);b&&(b.style.display="");c&&(c.disabled=!1)};
ActivityFunction.adjwht=function(a){var b=document.getElementById(ActivityFunction.whatNameId),c=document.getElementById(ActivityFunction.whatIdId);document.getElementById(a).value==ActivityFunction.leadPrefix?(b&&(b.value=""),c&&(c.value=""),ActivityFunction.dswt()):ActivityFunction.enwt()};ActivityFunction.wholkp=function(a){""===a?ActivityFunction.enwt():ActivityFunction.dswt()};
ActivityFunction.updateCalendar=function(a){var b={},c,d;for(d in a)if(a.hasOwnProperty(d)){var e=document.getElementsByName(a[d]);if(null!==e)for(var f=0;f<e.length;f++)c=e[f],"checkbox"===c.type?ActivityFunction.pushPostArg(b,a[d],c.checked?"1":"0"):("radio"!==c.type||c.checked)&&ActivityFunction.pushPostArg(b,a[d],c.value)}Sfdc.Ajax.post(window.location.pathname,ActivityFunction.replaceCalendar,{data:b,escape:encodeURIComponent});Hover.clearHovers()};
ActivityFunction.pushPostArg=function(a,b,c){if(null===a[b]||void 0===a[b])a[b]=[];a[b].push(c)};
ActivityFunction.replaceCalendar=function(a){var b,c;c="\x3c!-- "+EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR_MARKER+" --\x3e";b=a.indexOf(c);c=a.lastIndexOf(c);0<=b&&0<=c&&(a=a.substring(b,c));b=Sfdc.Dom.create(null,null,"div",document);Sfdc.Dom.updateHTML(b,a);b=Sfdc.get("#"+EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR,b);if(null!==b&&(ActivityFunction.setConflictError(b),Sfdc.Dom.removeChild(Sfdc.Dom.getParent(b),b),a=document.getElementById(EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR),
Sfdc.Dom.replace(b,a),Sfdc.userAgent.isIE6||Sfdc.userAgent.isIE7||Sfdc.userAgent.isIE8))a=Sfdc.get(EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR_ADD_INVITEES_ID),a.onclick=function(){return!1},Sfdc.Event.add(a,"click",addInvitees)};
ActivityFunction.setConflictError=function(a){if(!(0<Sfdc.select("."+EditElement.ERROR_CLASS,document.getElementById(DetailElement.DEFAULT_DETAIL_ELEMENT_ID)).length)){var b=document.getElementById(DetailElement.DEFAULT_ERROR_DIV_ID);0<Sfdc.select("."+EditElement.ERROR_CLASS,a).length?b.style.display="block":b.style.display="none"}};
ActivityFunction.initMiniPage=function(a){ActivityFunction.initWhoWhatFieldsWithJsonObj(a);var b=a[EventUi.WHO_TYPE_PARAM_NAME],c=a[EventUi.ALL_DAY_PARAM_NAME],d=a[EventUi.REMINDER_DATE_TIME_PARAM_NAME],e=a[EventUi.RECURRING_EVENT_PARAM_NAME],f=a[EventUi.START_DATE_PARAM_NAME],g=a[EventUi.START_TIME_PARAM_NAME],h=a[EventUi.END_DATE_PARAM_NAME],k=a[EventUi.END_TIME_PARAM_NAME];a=a[EventUi.PRIVATE_CHECKBOX_PARAM_NAME];null!==document.getElementById(b)&&(ActivityFunction.adjwht(b),ActivityFunction.adjustWhoWhat(!0,
!0,a));ActivityFunction.adjustEventReminderOptions(!1,c,d);ActivityFunction.checkDuration(e,c,f,g,h,k);ActivityFunction.adjustPrivate(a);document.getElementById(f)&&document.getElementById(g)&&ActivityFunction.saveStartTime(f,g)};
ActivityFunction.clearTimeElements=function(a,b,c,d,e,f,g,h){h&&(a=document.getElementById(a).checked,document.getElementById(c)&&(document.getElementById(c).disabled=a),document.getElementById(e)&&(document.getElementById(e).disabled=a),document.getElementById(g)&&(document.getElementById(g).disabled=a),document.getElementById(DurationInputElement.pHOURS_NAME)&&(document.getElementById(DurationInputElement.pHOURS_NAME).disabled=a,document.getElementById(DurationInputElement.pMINUTES_NAME).disabled=
a),document.getElementById(b)&&(document.getElementById(d)&&document.getElementById(f))&&(b=a&&document.getElementById(b).checked,document.getElementById(d).disabled=b,document.getElementById(f).disabled=b))};ActivityFunction.adjustAddToInviteesLink=function(){var a=document.getElementById(EventUi.pISPERSONACCOUNT);a&&("true"==a.value?document.getElementById(EventUi.pADD_INVITEE_ID).style.display="":document.getElementById(EventUi.pADD_INVITEE_ID).style.display="none")};
ActivityFunction.adjustPrivate=function(a){var b=document.getElementById(ActivityFunction.whoNameId),c=document.getElementById(ActivityFunction.whoNameId+ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX),d=document.getElementById(ActivityFunction.whatNameId),e=b?b.value:"";if(c&&("visible"===c.style.visibility&&"hidden"===b.style.visibility)&&(b=getElementByIdCS(ActivityFunction.whoNameId+MultiLookupInputElement.MULTI_LOOKUP_SELECT_SUFFIX),null!==b&&"003"===b.value&&(b=document.getElementById(Sfdc.Activity.ManyWhoFunction.recurrenceElementId),
!b||!b.checked)))e=c.value;c=d?d.value:"";b=document.getElementById(this.ownerIdId);d=ActivityFunction.userId;b&&(d=b.value);a=document.getElementById(a);null!==a&&(""!==e||""!==c||0<ActivityFunction.getInviteePopupCount()||d!==ActivityFunction.userId?(a.checked=!1,a.disabled=!0):a.disabled=!1)};ActivityFunction.setInviteePopupCount=function(a){ActivityFunction.inviteePopupCount=a};ActivityFunction.getInviteePopupCount=function(){return ActivityFunction.inviteePopupCount};
ActivityFunction.adjustWhoWhat=function(a,b,c,d){if(b){a=!a;b=document.getElementById(ActivityFunction.whoLookupId);var e=document.getElementById(ActivityFunction.whoIdId);if(b||e)b?a=b.value==ActivityFunction.leadPrefix:e.value&&(a=e.value,a=3<a.length&&a.substring(0,3)==ActivityFunction.leadPrefix);if(null===d||void 0===d)d=(c=document.getElementById(c))&&c.checked;d?(ActivityFunction.dswt(),ActivityFunction.disableWho()):(a?ActivityFunction.dswt():ActivityFunction.enwt(),ActivityFunction.enableWho())}};
ActivityFunction.disableWho=function(){var a=document.getElementById(ActivityFunction.whoNameId),b=document.getElementById(Activity.WHO_BUTTON_ID),c=document.getElementById(ActivityFunction.whoLookupId),d=document.getElementById(ActivityFunction.whoNameId+ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX);a&&(a.disabled=!0);d&&(d.disabled=!0,d.style.background="#f8f8f8");b&&(b.style.display="none");c&&(c.disabled=!0)};
ActivityFunction.enableWho=function(){var a=document.getElementById(ActivityFunction.whoNameId),b=document.getElementById(Activity.WHO_BUTTON_ID),c=document.getElementById(ActivityFunction.whoLookupId),d=document.getElementById(ActivityFunction.whoNameId+ActivityUi.MANY_WHO_CONTACT_FIELD_NAME_SUFFIX);a&&(a.disabled=!1);d&&(d.disabled=!1,d.style.background="");b&&(b.style.display="");c&&(c.disabled=!1)};
ActivityFunction.adjustEventReminderOptions=function(a,b,c,d,e){var f=document.getElementById(b),g=document.getElementById(d);d=document.getElementById(Activity.REMINDER_SELECT_ID);b=document.getElementById(Activity.REMINDER_DATE_TIME_ID);var h=document.getElementById(Activity.REMINDER_LEAD_DAYS_TIME_ID),k=document.getElementById(Activity.REMINDER_SET_ID);d&&b&&(a=f?f.checked:a,c=g?g.checked:c,d.style.display=a?"none":"inline",b.parentNode.style.display=a&&!c?"inline":"none",h.parentNode.style.display=
a&&c?"inline":"none",c=k.checked,d.disabled=!c,b.disabled=!c,h.disabled=!c,e&&document.getElementById(e)&&(document.getElementById(e).disabled=!c))};ActivityFunction.adjustRecurrenceFrequency=function(a){var b=ActivityUi.ALL_SUBGROUP_DIVS;for(i=0;i<b.length;i++)b.charAt(i)==a.charAt(0)?document.getElementById(b.charAt(i)).style.display="":document.getElementById(b.charAt(i)).style.display="none"};
ActivityFunction.selectMakeRecurring=function(a,b,c,d,e,f){var g=document.getElementById(a);a=document.getElementById(b);c=document.getElementById(c);d=document.getElementById(d);e=document.getElementById(e);g=g.checked;b="null"==b?!0:!1;c&&(c.disabled=g);a&&(b=a.checked);a&&(d&&e)&&(a=g&&b,d.disabled=a,e.disabled=a);ActivityFunction.showReminderSet(g,b);ActivityFunction.showRecurrenceOptions(g);TaskEditPage.allowGroupTasks(g,f)};
ActivityFunction.toggleRecurrenceAndRegeneration=function(a,b,c){a=document.getElementById(a);b=document.getElementById(b);c=document.getElementById(c);var d=!1,e=!1;b&&(e=""!==b.value);a&&(d=a.checked);d?(b&&(b.value="",b.disabled=!0),c&&(c.value="",c.disabled=!0)):e?a&&(a.checked=!1,a.disabled=!0):(b&&(b.disabled=!1),c&&(c.disabled=!1),a&&(a.disabled=!1))};
ActivityFunction.showReminderSet=function(a,b){var c=document.getElementById(Activity.REMINDER_LEAD_DAYS_TIME_ID),d=document.getElementById(Activity.REMINDER_DATE_TIME_ID),e=document.getElementById(Activity.REMINDER_SELECT_ID);c&&(c.parentNode.style.display=a&&b?"inline":"none");d&&(d.parentNode.style.display=!a&&b?"inline":"none");e&&(e.style.display=!b?"inline":"none")};
ActivityFunction.calculateRecurrenceEnd=function(a,b,c,d){null!==ActivityFunction.recurrenceEndDateErrorElem&&(ActivityFunction.recurrenceEndDateErrorElem.style.display="none");ActivityFunction.recurrenceEndDateId=a;a=document.getElementById(EditPageConstants.pEDIT_PAGE).elements;var e={},f=!1;ActivityFunction.pushPostArg(e,Activity.ACTIVITY_TYPE,c);ActivityFunction.pushPostArg(e,UiData.pID,d);"Event"==c&&ActivityFunction.pushPostArg(e,"inviteeCount",ActivityFunction.getInviteePopupCount());for(c=
0;c<a.length;c++)element=a[c],!f&&element.name==b&&(f=!0),element.disabled||("checkbox"==element.type?ActivityFunction.pushPostArg(e,element.name,element.checked?"1":"0"):("radio"!=element.type||element.checked)&&ActivityFunction.pushPostArg(e,element.name,element.value));f||ActivityFunction.pushPostArg(e,b,"1");Sfdc.Ajax.post(UserContext.getUrl("/ui/core/activity/CalculateMaxEndDate"),ActivityFunction.replaceRecurrenceEnd,{data:e,escape:encodeURIComponent})};
ActivityFunction.replaceRecurrenceEnd=function(a){ActivityFunction.recurrenceEndDateId&&(a=Util.evalAjaxServletOutput(a),a[Activity.MAX_RECURRENCE_END_DATE]?document.getElementById(ActivityFunction.recurrenceEndDateId).value=a[Activity.MAX_RECURRENCE_END_DATE]:ActivityFunction.handleCalculateRecurrenceEndError(a))};
ActivityFunction.handleCalculateRecurrenceEndError=function(a){var b=document.getElementById(Activity.MAX_RECURRENCE_SPAN_ID);a[Activity.MAX_RECURRENCE_ERRORS]&&b&&(null===ActivityFunction.recurrenceEndDateErrorElem?(a=LC.getLabel("Global","colonSeparatedWords",LC.getLabel("Global","error"),a[Activity.MAX_RECURRENCE_ERRORS]),ActivityFunction.recurrenceEndDateErrorElem=document.createElement("div"),ActivityFunction.recurrenceEndDateErrorElem.className="errorMsg",ActivityFunction.recurrenceEndDateErrorElem.appendChild(document.createTextNode(a)),
b.appendChild(ActivityFunction.recurrenceEndDateErrorElem)):ActivityFunction.recurrenceEndDateErrorElem.style.display="block")};ActivityFunction.showRecurrenceOptions=function(a){a?document.getElementById(ActivityUi.RECURRENCE_PATTERN_DIV).style.display="":document.getElementById(ActivityUi.RECURRENCE_PATTERN_DIV).style.display="none"};
ActivityFunction.updateDates=function(a,b,c){var d=document.getElementById(a);if(null!==d){for(var e in b)if(b.hasOwnProperty(e)){var f=document.getElementById(b[e]);if(f&&0<DateUtil.getDateFromFormat(d.value,UserContext.dateFormat)&&(!c||b[e]!==Activity.END_DATE_ID))f.value=d.value}!0===c&&(b=document.getElementById(Activity.START_TIME_ID),c=document.getElementById(Activity.END_DATE_ID),e=document.getElementById(Activity.END_TIME_ID),null!==c&&isNaN(Date.parse(c.value))?c.value=d.value:null!==b&&
(null!==c&&null!==e)&&ActivityFunction.updateEndTime(a,Activity.START_TIME_ID,Activity.END_DATE_ID,Activity.END_TIME_ID))}};ActivityFunction.showTimePicker=function(a){if("undefined"!=typeof CalCnC&&document.getElementById(CalCnC.cncDialogContent)){var b=document.getElementById(CalCnC.cncDialogContent);SimpleTimePicker.pickTime(a,b)}else SimpleTimePicker.pickTime(a)};
ActivityFunction.updateEndTime=function(a,b,c,d){if((a=ActivityFunction.getDateTimeValue(a,b))&&ActivityFunction.oldStartDateTime){b=a.getTime()-ActivityFunction.oldStartDateTime.getTime();var e=ActivityFunction.getDateTimeValue(c,d).getTime(),e=new Date(e+b);b=DateUtil.getDateStringFromUserLocale(e);e=DateUtil.getTimeStringFromUserLocale(e);document.getElementById(c).value=b;document.getElementById(d).value=e;ActivityFunction.oldStartDateTime=a}};
ActivityFunction.saveStartTime=function(a,b){ActivityFunction.oldStartDateTime=ActivityFunction.getDateTimeValue(a,b)};
ActivityFunction.getDateTimeValue=function(a,b){var c=document.getElementById(a),d=document.getElementById(b),c=CalFunctions.safe_html(c.value),d=CalFunctions.safe_html(d.value);return DateUtil.isDate(c,UserContext.dateFormat)&&DateUtil.isDate(d,UserContext.timeFormat)?(c=DateUtil.getDateFromUserLocale(c),d=DateUtil.getTimeFromUserLocale(d),new Date(c.getFullYear(),c.getMonth(),c.getDate(),d.getHours(),d.getMinutes(),0)):null};
ActivityFunction.checkDuration=function(a,b,c,d,e,f){a=document.getElementById(a);b=(b=document.getElementById(b))?b.checked:!1;c=document.getElementById(c);d=document.getElementById(d);var g=document.getElementById(e);e=document.getElementById(f);f=document.getElementById(ActivityPage.DISABLED_RECURRENCE_MSG_DIV);if(null!==a&&null!==c&&null!==g&&null!==d&&null!==e){c=c.value;var g=g.value,h=!e.disabled&&""!==e.value;if(h=!d.disabled&&""!==d.value&&h)c=c+" "+d.value,g=g+" "+e.value;d=DateUtil.getDateFromValue(c,
h);e=DateUtil.getDateFromValue(g,h);if(null!==d&&null!==e&&(d=DateUtil.differenceInMinutes(d,e),b&&(d+=EventObject.ONE_DAY_IN_MINUTES),d>EventObject.ONE_DAY_IN_MINUTES)){a.checked=!1;a.disabled=!0;ActivityFunction.showRecurrenceOptions(!1);f.style.visibility="visible";return}if(void 0===Sfdc.Activity||1>=Sfdc.Activity.ManyWhoFunction.selectedManyWhoCount)a.disabled=!1,f.style.visibility="hidden"}};
ActivityFunction.setDefaultTimes=function(a,b,c,d,e){b=document.getElementById(b);d=document.getElementById(d);!ActivityFunction.defaultTimesSet&&(!a&&null!==b&&null!==d)&&(b.value=CalFunctions.safe_html(c),d.value=CalFunctions.safe_html(e),ActivityFunction.defaultTimesSet=!0)};ActivityFunction.weekdays=[Activity.DAY_OF_WEEK_SUNDAY,Activity.DAY_OF_WEEK_MONDAY,Activity.DAY_OF_WEEK_TUESDAY,Activity.DAY_OF_WEEK_WEDNESDAY,Activity.DAY_OF_WEEK_THURSDAY,Activity.DAY_OF_WEEK_FRIDAY,Activity.DAY_OF_WEEK_SATURDAY];
ActivityFunction.setDayOfWeekDefault=function(a){var b=null;if(a=document.getElementById(a)){for(i=0;i<ActivityFunction.weekdays.length;i++)if((b=document.getElementById(ActivityFunction.weekdays[i]))&&b.checked)return;if(b=DateUtil.getDateFromValue(a.value,!1))if(b=b.getDay(),b=document.getElementById(ActivityFunction.weekdays[b]))b.checked=!0}};
ActivityFunction.openInviteePicker=function(){Sfdc.Activity.PeoplePicker.invitee||(Sfdc.Activity.PeoplePicker.invitee=new Sfdc.Activity.PeoplePicker(MWPicker.INVITEE_PICKER_ID));Sfdc.Activity.PeoplePicker.invitee.toggleOverlayPanel()};
ActivityFunction.getInviteesInfo=function(a){var b=document.getElementById(EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR+ActivityUi.MANY_WHO_ID_ELEMENT_SUFFIX),c=document.getElementById(EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR+ActivityUi.MANY_WHO_NAME_ELEMENT_SUFFIX),d=document.getElementById(EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR+ActivityUi.MANY_WHO_TITLE_ELEMENT_SUFFIX),e=document.getElementById(EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR+
ActivityUi.MANY_WHO_OWNER_ELEMENT_SUFFIX),f=document.getElementById(EditEventMultiUserCalendarElementConstants.EDIT_PAGE_CALENDAR+ActivityUi.MANY_WHO_COMPANY_ELEMENT_SUFFIX),b=b.value.split(","),g=[];if(b[0]&&0<b[0].length)for(var c=Sfdc.JSON.parse(c.value),d=Sfdc.JSON.parse(d.value),e=Sfdc.JSON.parse(e.value),f=Sfdc.JSON.parse(f.value),h=0;h<b.length;h++)g.push({id:b[h],name:a.escapeHTMLValue(c[h]),title:a.escapeHTMLValue(d[h]),company:a.escapeHTMLValue(f[h]),owner:a.escapeHTMLValue(e[h])});return g};
function CalFunctions(){}CalFunctions.listviewComponentId=null;CalFunctions.setListviewComponentId=function(a){CalFunctions.listviewComponentId=a};CalFunctions.isListviewPage=function(){return null!==CalFunctions.listviewComponentId&&0!==CalFunctions.listviewComponentId.length};CalFunctions.returnUrlProvider=function(){if(CalFunctions.isListviewPage()){var a=ListViewport.instances[CalFunctions.listviewComponentId].retURL;if(null!==a&&void 0!==a)return encodeURIComponent(a)}return window.sfdcPage.getHrefAsRetURL()};
CalFunctions.fixAddItemLink=function(a){CalFunctions.isListviewPage()&&(a.href=CalFunctions.mungeRetUrl(a.href))};CalFunctions.fixReturnUrl=function(a){return CalFunctions.isListviewPage()?CalFunctions.mungeRetUrl(a):a};CalFunctions.fixReturnUrlAndNavigateToUrl=function(a){var c=a;CalFunctions.isListviewPage()&&(c=CalFunctions.mungeRetUrl(a));this.isConsoleContext()&&this.isActionUrl(c)?srcSelf(c):window.navigateToUrl(c)};CalFunctions.isConsoleContext=function(){return Sfdc.resolve("Sfdc.servicedeskview")};
CalFunctions.isActionUrl=function(a){return-1<a.indexOf("/deleteredirect.jsp")?!0:!1};
CalFunctions.mungeRetUrl=function(a){var c=CalFunctions.returnUrlProvider(),d=QueryString.getURI(a);a=QueryString.createQueryString(a);var b=a.get(EditPageConstants.pSAVE_NEW_URL);if(null!==b&&void 0!==b){var e=QueryString.getURI(b),b=QueryString.createQueryString(b);b.remove(UiData.pRET_URL);b.add(UiData.pRET_URL,decodeURIComponent(c));a.remove(EditPageConstants.pSAVE_NEW_URL);a.add(EditPageConstants.pSAVE_NEW_URL,e+b.toString())}a.remove(UiData.pRET_URL);a.add(UiData.pRET_URL,decodeURIComponent(c));
return d+a.toString()};CalFunctions.onCompleteRerender=function(){void 0!==InlineScheduler.scheduler&&null!==InlineScheduler.scheduler&&InlineScheduler.scheduler.postRefreshCalendar();Hover.clearHovers()};CalFunctions.onBeforeDOMUpdate=function(){Hover.clearHovers()};CalFunctions.safe_html=function(a){return a.replace(/&/g,"\x26amp;").replace(/</g,"\x26lt;").replace(/>/g,"\x26gt;").replace(/'/g,"\x26#39;").replace(/"/g,"\x26quot;")};
function CalendarTaskList(){}CalendarTaskList.verifySelected=function(b,c,a){if(a=verifyChecked(b,c,a)){for(i=a=0;i<b.elements.length;i++)b.elements[i].name==c&&b.elements[i].checked&&a++;return a>TaskMassAction.ROW_LIMIT?(alert(LC.getLabel("List","checkboxLimit",TaskMassAction.ROW_LIMIT)),!1):!0}return a};
window.IFrameShim=iframeShim;function Hover(){this.loaded=!1;this.yObjBottom=this.yObjTop=this.yCoord=this.xObjRight=this.xObjLeft=this.xCoord=0;this.positioned=this.hideTimer=this.showTimer=this.showing=!1}Hover.SHOW_DELAY=800;Hover.HIDE_DELAY=100;Hover.hoverMap={};Hover.hoversEnabled=!0;Hover.disableHovers=function(){Hover.hoversEnabled=!1};Hover.clearHovers=function(){Hover.hoverMap={}};
Hover.getHover=function(a){var b=Hover.hoverMap[a];return"undefined"==typeof b?Hover.createHover(new Hover,a):b};Hover.createHover=function(a,b){a.eid=b;a.ele=getElementByIdCS(a.eid);a.iFShim=new IFrameShim(a.ele);return Hover.hoverMap[b]=a};Hover.isDragging=function(){return"undefined"!=typeof Ext&&"undefined"!=typeof Ext.dd&&Ext.dd.DragDropMgr.dragCurrent};
Hover.prototype.showHover=function(a,b,c){Hover.isDragging()||(this.hoverType||(this.hoverType=c),this.hideTimer&&(window.clearTimeout(this.hideTimer),this.hideTimer=!1),this.showTimer||(this.showTimer=window.setTimeout("Hover.getHover('"+this.eid+"').showHoverAfterDelay('"+b+"')",Hover.SHOW_DELAY)),this.setPosition(a))};
Hover.prototype.hideHover=function(){this.showTimer&&(window.clearTimeout(this.showTimer),this.showTimer=!1);this.hideTimer||(this.hideTimer=window.setTimeout("Hover.getHover('"+this.eid+"').hideHoverAfterDelay()",Hover.HIDE_DELAY))};Hover.prototype.showHoverAfterDelay=function(a){if(!this.hideTimer&&!Modal.isBlocked()){if(!this.loaded)if(Hover.hoversEnabled)a&&this.loadAjaxHover(a);else{window.location.reload();return}this.positioned&&this.revealHover()}this.showTimer=!1};
Hover.prototype.revealHover=function(){this.iFShim.setStyle("visibility","visible");this.showing=!0};Hover.prototype.hideHoverAfterDelay=function(){Modal.isBlocked()?this.hideTimer=window.setTimeout("Hover.getHover('"+this.eid+"').hideHoverAfterDelay()",100):(this.showTimer||(this.iFShim.setStyle("visibility","hidden"),this.showing=!1),this.hideTimer=!1)};
Hover.prototype.setPosition=function(a){this.showing||(this.xObjLeft=getObjX(getSrcElement(a)),this.xObjRight=this.xObjLeft+Hover.getElementWidth(getSrcElement(a)),this.yObjTop=getObjY(getSrcElement(a)),this.yObjBottom=this.yObjTop+Hover.getElementHeight(getSrcElement(a)),this.setXPos(getMouseX(a)),this.setYPos(getMouseY(a)),this.reposition())};
Hover.prototype.reposition=function(){var a=this.xCoord,b=document.getElementById(BodyLayout.PAGE_HEADER_ID),b=b?Hover.getElementHeight(b):0,b=this.yCoord-b;this.iFShim.setStyle("left",a+"px");this.iFShim.setStyle("top",b+"px");this.positioned=!0};Hover.prototype.setXPos=function(a){var b=this.getMaxX();a>b&&(a=Math.max(this.getMinX(),b));this.xCoord=a};
Hover.prototype.getMinX=function(){var a=document.getElementById(BodyLayout.BODY_CELL_ID),a=a?getCurrentStyle(a,"paddingLeft"):"0px",a=parseInt(a.substring(0,a.indexOf("px")),10),b=assureInt(window.pageXOffset||(Hover.documentBody?Hover.documentBody.scrollLeft:0)||0);return Math.max(b,a)};
Hover.prototype.getMaxX=function(){return assureInt(Hover.documentBody&&Hover.documentBody.clientWidth?Hover.documentBody.clientWidth:window.innerWidth)+assureInt(window.pageXOffset||(Hover.documentBody?Hover.documentBody.scrollLeft:0)||0)-Hover.getElementWidth(this.ele)};Hover.prototype.setYPos=function(a){var b=this.getMaxY();a>b&&(a=Math.max(this.getMinY(),b));this.yCoord=a};
Hover.prototype.getMinY=function(){return assureInt((Hover.documentBody?Hover.documentBody.scrollTop:0)||window.pageYOffset||0)};Hover.prototype.getMaxY=function(){return assureInt((Hover.documentBody?Hover.documentBody.clientHeight:0)||window.innerHeight)+assureInt((Hover.documentBody?Hover.documentBody.scrollTop:0)||window.pageYOffset||0)-Hover.getElementHeight(this.ele)};
Hover.prototype.loadAjaxHover=function(a){var b=!1;if(window.XMLHttpRequest)b=new XMLHttpRequest;else if(window.ActiveXObject)try{b=new ActiveXObject("Msxml2.XMLHTTP")}catch(c){try{b=new ActiveXObject("Microsoft.XMLHTTP")}catch(e){}}else return!1;var d=this.eid;b.onreadystatechange=function(){window.Hover&&window.Hover.getHover(d).loadPage(b)};b.open("GET",a,!0);b.send(null);this.loaded=!0};
Hover.prototype.loadPage=function(a){if(4==a.readyState){var b;try{b=a.status}catch(c){if(2147746065==c.result&&-1!=c.message.indexOf("NS_ERROR_NOT_AVAILABLE"))return}if(200==b||-1==window.location.href.indexOf("http"))this.iFShim.setStyle("visibility","hidden"),getElementByIdCS(this.eid+"_content").innerHTML=a.responseText,this.loadHook_afterLoad(),this.setXPos(this.xCoord),this.setYPos(this.yCoord),this.reposition(),!this.hideTimer&&this.showing&&this.iFShim.setStyle("visibility","visible")}};
Hover.prototype.loadHook_afterLoad=function(){};Hover.getElementWidth=function(a){return assureInt(a.style.pixelWidth||a.offsetWidth)};Hover.getElementHeight=function(a){return assureInt(a.style.pixelHeight||a.offsetHeight)};Hover.documentBody=document.compatMode&&"BackCompat"!=document.compatMode?document.documentElement:document.body?document.body:null;
function TaskEditPage(){var c=this;this.appendToOnloadQueue(function(){c.initLookups()},"Initialize dependent lookups")}TaskEditPage.prototype=new EditPage;
TaskEditPage.prototype.onChangeOwnerDisplay=function(c,f,d,a,g,e){var b=document.getElementById(c);f=document.getElementById(f);var k=document.getElementById(d);d=document.getElementById(d+TaskUi.pLOOKUP_BUTTON_MULTI_OWNER_SUFFIX);a=document.getElementById(a);var h=document.getElementById(c+EditElement.pID_SUFFIX),l=document.getElementById(e),n=document.getElementById(ActivityPage.DISABLED_RECURRENCE_MSG_DIV);e=0<h.value.indexOf(TaskUi.ASSIGNEE_SEPARATOR)||h.value!=Udd.EMPTY_KEY&&"005"!=h.value.substring(0,
3);var h="inline",m="none";e&&(h="none",m="block");if(l){if(l.disabled=e)ActivityFunction.showRecurrenceOptions(!1),l.checked=!1;n.style.visibility=e?"visible":"hidden"}b.style.display=h;k.style.display=h;a&&(a.style.display=h);f.style.display=m;d.style.display=m;b=b.value;c=document.getElementById(c+TaskUi.pLOOKUP_DISPLAY_SUFFIX);b=CalFunctions.safe_html(TaskEditPage.unescapeChar(decodeURIComponent(b),"\\"));b.length>g&&(b=b.substring(0,g),b+=LC.getLabel("Sidebar","ellipses"));c.innerHTML=b;document.close();
!0===TaskEditPage.isManyWhoReady&&void 0!==Sfdc.Activity.ManyWhoFunction.manyWhoAllowed&&(Sfdc.Activity.ManyWhoFunction.manyWhoAllowed=!e,Sfdc.Activity.ManyWhoFunction.flipManyWhoContactField())};TaskEditPage.prototype.setNotificationValue=function(){document.getElementById(TaskUi.pNOTIFY_PREFERENCE_GROUP_ELEMENT).style.display="block";document.getElementById(TaskUi.pSHOW_PREFERENCE).value="1"};
TaskEditPage.unescapeChar=function(c,f){for(var d="",a=!1,g=0;g<c.length;g++){var e=c.charAt(g);a?(d+=e,a=!1):e==f?a=!0:d+=e}return a?null:d};
TaskEditPage.reenableReminders=function(c,f,d,a,g,e){var b=document.getElementById(Activity.REMINDER_SET_ID);if(b){c=document.getElementById(c);f=document.getElementById(f);d=document.getElementById(d);a=document.getElementById(a);g=document.getElementById(g);e=document.getElementById(e);if(c){for(var k=!0,h=0;;h++){var l=c.getAttribute("closed_values"+h);if(!l)break;if(l==c.value){k=!1;break}}b.disabled=!k;!k&&b.checked&&(b.prev_checked=!0,b.checked=!1);k&&!0===b.prev_checked&&(b.checked=!0,b.prev_checked=
!1)}b=b.checked;d.disabled=!b;a.disabled=!b;g.disabled=!b;e.disabled=!b;f&&ActivityFunction.showReminderSet(f.checked?!0:!1,!0)}};TaskEditPage.allowGroupTasks=function(c,f){var d=document.getElementById(f);if(d){var a=d.getAttribute("href"),g="\x26",e="\x26"+TaskOwnerLookup.pTABBED_TMU_LOOKUP+"\x3d1";-1==a.indexOf("\x26")&&(g=encodeURIComponent(g),e=encodeURIComponent(e));c?(a=a.replace(RegExp(e,"g"),""),a=a.replace(e,"")):a=a.replace(g,e+g);d.setAttribute("href",a)}};
TaskEditPage.updateReminderDate=function(c,f,d,a){c=document.getElementById(c);f=document.getElementById(f);d=document.getElementById(d);a=document.getElementById(a);if(c)if(c.checked)a.value=d.value;else if((c=f.value)&&0<c.length)a.value=f.value};
function TaskOwnerUROGLookup(a,c,f,b,g,d,h){var e=this;this.appendToOnloadQueue(function(){e.init()});this.selectEleId=f;this.baseName=b;this.noneLabel=g;this.jsVarName=d;this.isSearch=h}TaskOwnerUROGLookup.prototype=new EditPage;TaskOwnerUROGLookup.prototype.isUrogId=function(a){if(!a||0===a.length)return!1;a=a.split(":");return 2===a.length&&1===a[0].length&&15===a[1].length};
TaskOwnerUROGLookup.prototype.init=function(){var a=this;addEvent(document.getElementById(TaskOwnerLookup.DONE_BUTTON_ID),"click",function(){a.onDone()},!1);window.sfdcPage.initButtons([TaskOwnerLookup.DONE_BUTTON_ID,EditPageConstants.pCANCEL]);this.jsVarName=window[this.jsVarName];if(top.window.opener&&!this.isSearch){var c=TaskOwnerUROGLookup.splitWithQuoteAndEsc(decodeURIComponent(top.window.opener.document.getElementById(this.baseName+EditElement.pOLD_NAME_SUFFIX).value),TaskUi.ASSIGNEE_SEPARATOR),
f=top.window.opener.document.getElementById(this.baseName+TaskOwnerLookup.pLOOKUP_UROG_SUFFIX).value.split(TaskUi.ASSIGNEE_SEPARATOR),b=top.window.opener.document.getElementById(this.baseName+EditElement.pID_SUFFIX).value,g=b.split(TaskUi.ASSIGNEE_SEPARATOR),d=document.getElementById(this.selectEleId).options;if(0<b.length&&0<g.length&&c.length===f.length&&g.length===f.length){for(b=0;b<f.length&&0<f[b].length&&this.isUrogId(f[b]);b+=1)g=new Option(c[b],f[b]),1===d.length&&d[0].text===this.noneLabel?
d[0]=g:d[d.length]=g;this.jsVarName.beforeMoveRight();this.jsVarName.filter()}}};TaskOwnerUROGLookup.prototype.onSwitchTab=function(){return!this.isValueSelected(document.getElementById(this.selectEleId))?!0:Modal.confirm(LC.getLabel("Page_Task","confirmSwitchingTabs"))?!0:!1};TaskOwnerUROGLookup.prototype.isValueSelected=function(a){return 1>a.length||1===a.length&&(a=a.options[0].text,null===a||""===a||a===this.noneLabel)?!1:!0};
TaskOwnerUROGLookup.prototype.onDone=function(){var a=TaskUi.ASSIGNEE_SEPARATOR,c,f=[],b=[],g=[],d=[],h=document.getElementById(this.selectEleId),e=LC.getLabel("Page_Task","taskUrogNoValuesSelected");if(this.isValueSelected(h)){window.sfdcPage.disableSaveButtons();for(e=0;e<h.length;e+=1){var k=h.options[e].value.replace(/\\/g,"\\\\"),k=k.replace(RegExp(a,"g"),"\\"+a);g.push(k);d.push(k.replace(/.\:/g,""));c=h.options[e].textContent?h.options[e].textContent:h.options[e].innerText;c=c.replace(/\\/g,
"\\\\");c=c.replace(RegExp(a,"g"),"\\"+a);b.push(c);c=encodeURIComponent(c);f.push(c)}e=UrlMap.convertClassNameToUrl(AjaxGetUsersInGroups.pCLASS_NAME,null);k={};if(1===d.length&&"005"===d[0].substring(0,3)){c=h.options[0].textContent?h.options[0].textContent:h.options[0].innerText;c=c.replace(/\\/g,"\\\\");c=c.substring(c.indexOf(":")+2);var l=this;setTimeout(function(){top.window.opener.lookupPick("editPage",l.baseName+EditElement.pID_SUFFIX,l.baseName,"",d[0],c,"","")},0)}else this.valuesIdOnlyString=
d.join(a),this.labelsString=f.join(a),this.labelsForDisplayString=b.join(a),this.valuesString=g.join(a),k[AjaxGetUsersInGroups.pOWNER_ID_LIST]=this.valuesIdOnlyString,k[AjaxGetUsersInGroups.pOWNER_NAME_LIST]=this.labelsString,Sfdc.Ajax.post(e,this.handleResponse,{data:k})}else this.jsVarName.showErrorMessage(!0,e)};
TaskOwnerUROGLookup.prototype.handleResponse=function(a){var c=Util.evalAjaxServletOutput(a);a=c[AjaxGetUsersInGroups.pINVALID_GROUPS_MESSAGE];var c=c[AjaxGetUsersInGroups.pNUM_USERS],f=LC.getLabel("Global","labelWithColon",LC.getLabel("Global","error"))+" ";if(a)window.sfdcPage.jsVarName.showErrorMessage(!0,f+a),window.sfdcPage.enableSaveButtons();else if(c>TaskUi.MAX_TMU_ASSIGNEES)window.sfdcPage.jsVarName.showErrorMessage(!0,f+LC.getLabel("Page_Task","taskUrogTooManyUsersSelected",TaskUi.MAX_TMU_ASSIGNEES)),
window.sfdcPage.enableSaveButtons();else if(0===c)window.sfdcPage.jsVarName.showErrorMessage(!0,f+LC.getLabel("Page_Task","tmuHasNoUsers")),window.sfdcPage.enableSaveButtons();else{a=top.window.opener.document.getElementById(window.sfdcPage.baseName+TaskUi.pLOOKUP_SUMMARY_SUFFIX);null!==a&&(a.innerHTML=1===c?LC.getLabel("Page_Task","TMU_summary_singular"):LC.getLabel("Page_Task","TMU_summary",c));var b=window.sfdcPage.baseName+EditElement.pID_SUFFIX,g=window.sfdcPage.baseName+TaskOwnerLookup.pLOOKUP_UROG_SUFFIX,
d=window.sfdcPage.baseName;setTimeout(function(){top.window.opener.lookupPick("editPage",b,d,g,window.sfdcPage.valuesIdOnlyString,window.sfdcPage.labelsForDisplayString,window.sfdcPage.valuesString,"")},0)}};
TaskOwnerUROGLookup.splitWithQuoteAndEsc=function(a,c){for(var f=[],b="",g=!1,d=!1,h=0;h<a.length;h+=1){var e=a.charAt(h);if(d){switch(e){case "n":b+="\n";break;case "r":b+="\r";break;case "t":b+="\t";break;default:b+=e}d=!1}else"\\"===e?d=!0:'"'===e?g=!g:!g&&e===c?(f.push(b),b=""):b+=e}if(d||g)return null;f.push(b);return f};
function ActivityHover(){}ActivityHover.prototype=new Hover;ActivityHover.getHover=function(a){var c=Hover.hoverMap[a];return"undefined"==typeof c?Hover.createHover(new ActivityHover,a):c};
ActivityHover.prototype.loadHook_afterLoad=function(){var a=getElementByIdCS(this.eid+"_content"),c=Sfdc.get(".pbSubsection",a);if(c){var b=Sfdc.get(".detailList",c);if(Hover.getElementWidth(b)>Hover.getElementWidth(c)){var d=Hover.getElementWidth(b)-Hover.getElementWidth(c);a.style.width=Hover.getElementWidth(a)+d+"px";c.style.width=Hover.getElementWidth(b)+"px"}}delStyleClass(a,"hoverContentLoading")};
ActivityHover.prototype.setXPos=function(a){var c=this.getMinX(),b=this.getMaxX(),d=this.xObjRight-this.xObjLeft,d=75>d?d:75,f=Math.max(this.xObjLeft-c,b+Hover.getElementWidth(this.ele)-this.xObjLeft-d);200>f&&(f=200);if(Hover.getElementWidth(this.ele)>f){var e=getElementByIdCS(this.eid+"_content"),g=Sfdc.get(".pbSubsection",e);if(g){var b=Hover.getElementWidth(e)-Hover.getElementWidth(g),h=Hover.getElementWidth(this.ele)-Hover.getElementWidth(e);e.style.width=f-h+"px";g.style.width=Hover.getElementWidth(e)-
b+"px";Hover.getElementWidth(this.ele)>f&&(e.style.width=Hover.getElementWidth(this.ele)-h+"px",g.style.width=Hover.getElementWidth(e)-b+"px");b=assureInt(Hover.documentBody&&Hover.documentBody.clientWidth?Hover.documentBody.clientWidth:window.innerWidth)+assureInt(window.pageXOffset||(Hover.documentBody?Hover.documentBody.scrollLeft:0)||0)-Hover.getElementWidth(this.ele)}}b<this.xObjLeft+d&&(b=this.xObjLeft-Hover.getElementWidth(this.ele));a<this.xObjLeft+d&&(a=this.xObjLeft+d,addStyleClass(this.ele,
"hoverDetailOffsetted"));a>b&&(a=Math.max(c,b),addStyleClass(this.ele,"hoverDetailOverMax"));this.xCoord=a};

//# sourceMappingURL=/javascript/1524134401000/sfdc/source/Activity.js.map
