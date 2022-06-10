/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
window.IFrameShim=iframeShim;
var CalCnC={enabled:!1,editNewEventDialog:"",isAllDay:null,startDate:null,startTime:null,actionUrl:null,eventMiniEditElementIdsJson:null,editPageUrlBase:null,editPageUrl:null,propagateErrorsToEditPage:null,initialHeight:null,initialWidth:1,loading:null,datePickerParent:null,loadingShim:null,cncDialogContent:"editNewEventDialogContent",init:function(a,b,d){CalCnC.enabled||(CalCnC.editNewEventDialog=new SimpleDialog("editNewEventDialog",!0),CalCnC.editNewEventDialog.extraClass="clickAndCreateDialog",
CalCnC.editNewEventDialog.displayX=!0,CalCnC.editNewEventDialog.register(),CalCnC.editNewEventDialog.resizeEvent=function(){var a=document.getElementById("editNewEventDialog"),b=!0;a&&a.currentStyle?"hidden"==a.currentStyle.visibility&&(b=!1):a&&(a.style&&"hidden"==a.style.visibility)&&(b=!1);b&&CalCnC.setDialogSize();OverlayDialog.prototype.resizeEvent.call(this)},CalCnC.editNewEventDialog.cancel=function(){CalCnC.cancelHandler()},window.sfdcPage.appendToOnloadQueue(function(){CalCnC.onloadHandler(a,
b,d)},"Setup click and create"))},onloadHandler:function(a,b,d){CalCnC.actionUrl=a;CalCnC.eventMiniEditElementIdsJson=b;CalCnC.editPageUrlBase=d;a=[];a.push(CalCnC.actionUrl);a.push("?isAjaxRequest\x3d1");CalCnC.actionUrl=a.join("");CalCnC.editNewEventDialog.setTitle(LC.getLabel("Page_Event","page_title_new"));CalCnC.propagateErrorsToEditPage=!1;CalCnC.enabled=!0},editNewEventHandler:function(a,b,d,c,f,g,h){if(CalCnC.enabled){isAllDay=null===c||void 0===c;var e=[];e.push(CalCnC.actionUrl);e.push("\x26aid\x3d");
e.push(a);e.push("\x26anm\x3d");e.push(b);e.push("\x26evt4\x3d");e.push(d);e.push("\x26RecurrenceStartDateTime\x3d");e.push(d);isAllDay?e.push("\x26evt15\x3d1"):(e.push("\x26evt13\x3d"),e.push(c));f&&(!0===g&&(e.push("\x26who_id\x3d"),e.push(f)),!0===h&&(e.push("\x26what_id\x3d"),e.push(f)));e.push("\x26");e.push(UiData.pRET_URL);e.push("\x3d");e.push(CalFunctions.returnUrlProvider());a=e.join("");CalCnC.editPageUrl=CalFunctions.fixReturnUrl(CalCnC.editPageUrlBase);CalCnC.loading||(CalCnC.loading=
new LoadingScreen(CalCnC.getCnCOverlayNode(),LC.getLabel("Global","loading"),"editNewEventDialog_Loading"));CalCnC.showLoadScreen(CalCnC.loading);Sfdc.Ajax.get(a,CalCnC.formGetHandler,{failure:CalCnC.formErrorHandler})}},showLoadScreen:function(a){CalCnC.loadingShim||(CalCnC.loadingShim=new IFrameShim(CalCnC.getCnCOverlayNode()));CalCnC.loadingShim.setStyle("width","100%");CalCnC.loadingShim.setStyle("height","100%");Sfdc.userAgent.isIE6&&(CalCnC.loadingShim.iframe.style.zIndex=50);a.show()},hideLoadScreen:function(a){CalCnC.loadingShim&&
Sfdc.userAgent.isIE6&&(CalCnC.loadingShim.iframe.style.zIndex=-1);a.hide()},formGetHandler:function(a,b){CalCnC.enabled&&(CalCnC.isDisplayingForm(b)?(DatePicker.datePicker&&(DatePicker.datePicker=null),CalCnC.displayFormContent(b)&&(null===CalCnC.initialHeight&&(CalCnC.initialHeight=document.getElementById("editNewEventDialog").scrollHeight),document.getElementById("editNewEventDialog"),CalCnC.hideLoadScreen(CalCnC.loading),CalCnC.setDialogSize(),Ext.get("evt5").focus(),Sfdc.userAgent.isIE&&Ext.get("evt5").focus())):
CalCnC.formErrorHandler(b))},formErrorHandler:function(a){if(CalCnC.enabled&&(CalCnC.loading&&CalCnC.hideLoadScreen(CalCnC.loading),a=[],a.push('\x3cdiv id\x3d"overlayErrorId" class\x3d"overlayError"\x3e'),a.push('\x3cdiv class\x3d"errorText"\x3e'),a.push(LC.getLabel("Page_Schedule","click_and_create_error")),a.push("\x3c/div\x3e"),a.push('\x3cdiv class\x3d"buttons"\x3e'),a.push('\x3cinput type\x3d"button" onclick\x3d"window.location.reload();" name\x3d"miniOk" class\x3d"btn" value\x3d"'),a.push(LC.getLabel("Buttons",
"ok")),a.push('"/\x3e'),a.push("\x3c/div\x3e"),a.push("\x3c/div\x3e"),CalCnC.editNewEventDialog.setContentInnerHTML(a.join("")),document.getElementById("editNewEventDialogX").style.visibility="hidden",document.getElementById("editNewEventDialogContent").style.height="auto",CalCnC.editNewEventDialog.positioned=!1,CalCnC.editNewEventDialog.position(),!CalCnC.editNewEventDialog.dialog.style.visibility||"hidden"==CalCnC.editNewEventDialog.dialog.style.visibility))CalCnC.editNewEventDialog.setWidth(OverlayDialog.MIN_WIDTH),
CalCnC.editNewEventDialog.show()},displayFormContent:function(a){CalCnC.enabled&&(a=a.responseText.replace(/(&nbsp;|\s)*<script/,"\x26nbsp;\n\x3cscript"),CalCnC.editNewEventDialog.setContentInnerHTML(a),document.getElementById("editPage").onsubmit=function(){CalCnC.saveNewEventHandler();return!1},document.getElementById("editNewEventDialogX").onclick=function(){CalCnC.editNewEventDialog.cancel();return!1},CalCnC.eventMiniEditElementIdsJson&&ActivityFunction.initMiniPage(CalCnC.eventMiniEditElementIdsJson));
CalCnC.editNewEventDialog.setWidth(CalCnC.initialWidth);Util.evalScriptsUnderElementWithSrc(document.getElementById("editNewEventDialog"));document.getElementById(EditPageConstants.pEDIT_PAGE).action="";var b=document.getElementById("editNewEventDialogContent");a=document.getElementById("datePicker");CalCnC.datePickerParent=a.parentNode;b.appendChild(a);a=window.sfdcPage;a.setHelpParent(b);a.showHelp=function(a,c){GenericSfdcPage.prototype.showHelp.call(this,a,c);this.displayDiv.style.top=getObjY(c)+
c.offsetHeight+8-getObjY(b)+"px"};if(!Ext.get("evt5"))return CalCnC.formErrorHandler(),!1;CalCnC.editNewEventDialog.positioned=!1;CalCnC.editNewEventDialog.show();return!0},setDialogSize:function(){var a=document.getElementById("editNewEventDialog"),b=document.getElementById("editNewEventDialogContent"),d=document.getElementById("ep");if(a&&b&&Ext.get(a).isVisible()){a.style.overflowX="auto";1==CalCnC.initialWidth&&0<a.scrollWidth&&(b.style.overflowY="",CalCnC.initialWidth=a.scrollWidth+20+20,b.style.overflowY=
"auto");b.style.position="relative";b.style.overflow="auto";var c=getWindowWidth(),f=c;100<c&&(f=c-50-50);c=CalCnC.initialWidth>f?f:CalCnC.initialWidth;CalCnC.editNewEventDialog.setWidth(c+"px");b.style.width=c-20+"px";d.style.width=CalCnC.initialWidth-20-20+"px";d=c=Sfdc.Window.getWindowHeight();100<c&&(d=c-50-50);var c=Ext.get(Ext.getDom("editPage")),f=Ext.get(b).getOffsetsTo(Ext.get(a))[1],g=c.getOffsetsTo(Ext.get(b))[1],h=c.getHeight()+g+f;Sfdc.userAgent.isSafari&&(b=document.getElementById("editNewEventDialogInner"));
b.style.height=h>d?d-f+"px":c.getHeight()+g+20+"px";a.style.overflow="hidden"}},saveNewEventHandler:function(a,b,d){a=document.getElementById(EditPageConstants.pEDIT_PAGE);postBody=CalCnC.extractPostBody(a,!0);CalCnC.disableButtons();CalCnC.propagateErrorsToEditPage=!0;Sfdc.Ajax.post(CalCnC.actionUrl,CalCnC.formSubmitHandler,{failure:CalCnC.formErrorHandler,data:postBody})},cancelHandler:function(){CalCnC.clearState(!0);CalCnC.editNewEventDialog.hide()},extractPostBody:function(a,b){var d=Ext.Ajax.serializeForm(a);
b||(d=d.replace(/&save=[^&]*&/g,"\x26"),d=d.replace(/&save=[^$]*$/g,""),CalCnC.propagateErrorsToEditPage||(d=d.replace(/&[^=]*=&/g,"\x26"),d=d.replace(/&[^=]*=$/g,"")));return d},formSubmitHandler:function(a,b){CalCnC.enabled&&(CalCnC.isDisplayingForm(b)?CalCnC.displayFormContent(b)&&(CalCnC.setDialogSize(),Ext.get("evt5").focus(),document.getElementById("editNewEventDialogContent").scrollTop=0):(CalCnC.clearState(!0),CalCnC.editNewEventDialog.hide(),refreshCalendar()))},isDisplayingForm:function(a){var b=
CalCnC.editNewEventDialog.getContentElement().innerHTML;CalCnC.editNewEventDialog.setContentInnerHTML(a.responseText);a=null!==document.getElementById(EditPageConstants.pEDIT_PAGE);CalCnC.editNewEventDialog.setContentInnerHTML(b);return a},clearState:function(a){DatePicker.datePicker&&DatePicker.datePicker.hide();var b=document.getElementById("datePicker");CalCnC.datePickerParent.appendChild(b);SimpleTimePicker.hideTimePicker();CalCnC.propagateErrorsToEditPage=!1;a&&CalCnC.editNewEventDialog.setContentInnerHTML("")},
disableButtons:function(){var a=document.getElementById("miniSave");a.disabled=!0;a.className="btnDisabled";a=document.getElementById("miniCancel");a.disabled=!0;a.className="btnDisabled";document.getElementById("miniEditPageLink").onclick=function(){return!1}},goToFullEditPageHandler:function(){var a=document.getElementById(EditPageConstants.pEDIT_PAGE);if(!CalCnC.propagateErrorsToEditPage){var a=(new Ext.BasicForm(a)).getValues(),b=document.createElement("form"),d,c;for(c in a)if(a.hasOwnProperty(c)&&
(d=a[c],""!==d&&null!==d&&void 0!==d&&"save"!==c)){var f=document.createElement("input");f.setAttribute("type","hidden");f.setAttribute("name",c);f.setAttribute("value",d);b.appendChild(f)}document.body.appendChild(b);b.setAttribute("method","POST");a=b}c=document.createElement("input");c.setAttribute("type","hidden");c.setAttribute("name",EditPageConstants.pSAVE);c.setAttribute("value",EditPageConstants.NOSAVE);a.appendChild(c);a.setAttribute("action",CalCnC.editPageUrl);a.submit()},getCnCOverlayNode:function(){return Sfdc.resolve("Sfdc.servicedeskview")?
document.getElementsByTagName("HTML")[0]:document.getElementById(BodyLayout.BODY_TABLE_ID).parentNode}};
Ext&&(Ext.versionDetail&&3===Ext.versionDetail.major&&Sfdc.userAgent.isIE9)&&("undefined"!==typeof Range&&!Range.prototype.createContextualFragment)&&(Range.prototype.createContextualFragment=function(a){var b=document.createDocumentFragment(),c=document.createElement("div");b.appendChild(c);c.outerHTML=a;return b});
function CalDnD(a,b,c,k,f,l,m,n,p){new Ext.dd.DragZone(a,{containerScroll:!0,scroll:f,getDragData:function(b){var e=b.getTarget(".eventBlockDnD");e||(e=b.getTarget(".allDayItem"));if(e)return d=e.cloneNode(!0),d.width=e.clientWidth+"px",d.height=e.clientHeight+"px",a.dragData={sourceEl:e,repairXY:Ext.fly(e).getXY(),ddel:d},a.dragData},onInitDrag:function(a,b){this.proxy.update(this.dragData.ddel.cloneNode(!0));this.proxy.getEl().setWidth(this.dragData.ddel.width);this.proxy.getEl().setHeight(this.dragData.ddel.height);
this.proxy.getEl().setStyle("overflow","hidden");this.onStartDrag(a,b);return!0},getRepairXY:function(){return this.dragData.repairXY}});new Ext.dd.DropTarget(a,{currentCell:null,notifyOver:function(a,e,c){a=!1;var h=null,g;if((c=!(c&&c.rowId))||n)if(g=e.getTarget(".hourRowDnD"),!g&&(c||p))g=e.getTarget("td.alldayevent"),a=!0;g&&(c=!0,a||(this.currentCell&&CalDnD.mouseInElementBox(e,this.currentCell)&&(g=this.currentCell,c=!1),c&&(h=CalDnD.getDropIdClass(g),h="timedDay_"+CalDnD.getDropIdClassDay(h),
e=CalDnD.getTimedRealTargetID(e,g,h,b),g=Ext.getDom(e))),c&&CalDnD.setHighlight(g,a,k,b,"calDnDHover"));g!=this.currentCell&&(this.currentCell&&(delStyleClass(this.currentCell,"calDnDHover"),h=CalDnD.getDropIdClass(this.currentCell),(h=Ext.select("td."+h,b))&&h.removeClass("calDnDHover")),this.currentCell=g);return g?Ext.dd.DropZone.prototype.dropAllowed:null},notifyDrop:function(a,e,f){setStatusPosition=function(a,e){var g,f,h,k;if(e){g=CalDnD.getDropIdClass(a);f=Ext.select("td."+g,b);allDayItems=
Ext.select("td."+g+" div.allDayItem",b);var m=0,n=0,l,p;f.each(function(a,b,c){if(0===m||a.getY()<m)m=a.getTop(),l=a.getHeight();a.getY()>n&&(n=a.getTop(),p=a.getHeight())});g=f.first().getLeft();h=m+l*allDayItems.getCount();k=f.first().getWidth();f=l*(f.getCount()-allDayItems.getCount()-1)+p}else dt=Ext.fly(a),g=dt.getLeft(),h=dt.getTop(),k=dt.getWidth(),f=dt.getHeight();c.setLocation(g+k/2-8,h+f/2-10)};var h=!1;a=e.getTarget(".hourRowDnD");a||(a=e.getTarget("td.alldayevent"),h=!0);if(!a)return!1;
if(f&&f.rowId){if(!n||h&&!p)return!1;h||(dropTargetIdClass=CalDnD.getDropIdClass(a),timedDayClass="timedDay_"+CalDnD.getDropIdClassDay(dropTargetIdClass),rtID=CalDnD.getTimedRealTargetID(e,a,timedDayClass,b),a=Ext.getDom(rtID));CalDnD.clearHighlight(a,b,"calDnDHover");e=a.attributes.ondblclick.value;var g=e.slice(e.indexOf("Handler(")+8,e.lastIndexOf(")")-1).split(",");e=g[0].replace(/'/g,"");var h=g[1].replace(/'/g,""),k=g[2].replace(/'/g,""),g=4<=g.length?g[3].replace(/'/g,""):null;CalCnC.editNewEventHandler(e,
h,k,g,f.rowId,l,m)}else dropTargetIdClass=CalDnD.getDropIdClass(a),h?(setStatusPosition(a,h),e=Ext.DomQuery.selectNode("div."+dropTargetIdClass),alldayDrop(f.sourceEl.id,e.id)):(timedDayClass="timedDay_"+CalDnD.getDropIdClassDay(dropTargetIdClass),rtID=CalDnD.getTimedRealTargetID(e,a,timedDayClass,b),a=Ext.getDom(rtID),setStatusPosition(a,h),timedDrop(f.sourceEl.id,rtID));Ext.fly(a).frame();return!0}})}CalDnD.DROP_ZONE_ALL_DAY_PREFIX="dropAD_";CalDnD.DROP_ZONE_TIMED_PREFIX="drop_";
CalDnD.getDropIdClass=function(a){a=a.className;var b=a.indexOf(CalDnD.DROP_ZONE_ALL_DAY_PREFIX),c;-1==b?(b=a.indexOf(CalDnD.DROP_ZONE_TIMED_PREFIX),c=CalDnD.DROP_ZONE_TIMED_PREFIX.length+4):c=CalDnD.DROP_ZONE_ALL_DAY_PREFIX.length+4;return a.substring(b,b+c)};CalDnD.getDropIdClassDay=function(a){var b=-1==a.indexOf(CalDnD.DROP_ZONE_ALL_DAY_PREFIX)?5:7;return a.substring(b,b+4)};
CalDnD.getTimedRealTargetID=function(a,b,c,k){if(!a.getTarget(".eventBlockDnD"))return b.id;halfHourTroughs=Ext.select("div."+c,k);var f,l=a.getPageY();halfHourTroughs.each(function(a,b,c){f||(b=a.getY(),c=a.getHeight(),l>=b&&l<=b+c&&(f=Ext.id(a)))});return f?f:b.id};CalDnD.setHighlight=function(a,b,c,k,f){b?c?(a=CalDnD.getDropIdClass(a),allDayCells=Ext.select("td."+a,k),allDayCells.addClass(f)):addStyleClass(a,f):addStyleClass(a,f)};
CalDnD.clearHighlight=function(a,b,c){a&&(delStyleClass(a,c),a=CalDnD.getDropIdClass(a),(b=Ext.select("td."+a,b))&&b.removeClass(c))};CalDnD.mouseInElementBox=function(a,b){var c=Ext.fly(b),k=a.getPageX(),f=a.getPageY(),l=c.getX(),m=c.getY(),n=c.getWidth(),c=c.getHeight();return k>=l&&k<=l+n&&f>=m&&f<=m+c};
function InlineScheduler(a,b,d,c,e,f,g,h,k){this.closeCalTitle=LC.getLabel("Inline_Scheduling","close_calendar");this.openCalTitle=LC.getLabel("Inline_Scheduling","open_calendar");this.toggleText=document.getElementById("toggleText");this.toggleImg=document.getElementById(f);this.toggleDivElement=document.getElementById("toggleCalDiv");this.isCalOpen=g;this.calPercent=h;this.minCalPercent=10;this.maxCalPercent=90;this.enhancedListId=k;this.listviewContentEl=b;this.calendarContentEl=d;this.isCalendarInitialized=
!1;InlineScheduler.enabled=!0;Ext.layout.BorderLayout.SplitRegion.prototype.onSplitMove=Ext.layout.BorderLayout.SplitRegion.prototype.onSplitMove.createSequence(function(a,b){this.saveCalendarHeightState(a,b)},this);b=Ext.get("footer-panel");this.footerPanelHeight=b.getHeight();d=document.documentElement.clientHeight;c=Ext.fly(e).getTop();d=d-c-this.footerPanelHeight;c=Math.round(d*(this.calPercent/100));f=d-(this.isCalOpen?c:0);this.listviewPortObj=ListViewport.instances[this.enhancedListId];this.listviewPortObj.height=
f;this.mainP=new Ext.Panel({id:"main-panel",region:"center",layout:"border",renderTo:e,border:!1,height:d,autoWidth:!0,items:[{id:"listview-panel",region:"center",border:!1,height:f,autoScroll:!1},{id:"calendar-panel",region:"south",border:!1,split:!0,collapsed:!0,collapsible:!0,collapseMode:"mini",height:c,cls:"calendarPanel",autoScroll:!1}]});this.calendarP=Ext.getCmp("calendar-panel");this.listviewP=Ext.getCmp("listview-panel");!0===this.isCalOpen&&(this.updateToggleElements(!1),this.calendarP.expand(!1),
this.initCalendar());this.replacePanelElements();Ext.getDom(b).style.visibility="visible";Ext.get(a).on("click",this.toggleCalendar,this);this.calendarP.on({beforecollapse:function(){this.updateToggleElements(!0)},beforeexpand:function(){this.updateToggleElements(!1);this.openCalendar()},scope:this});Ext.EventManager.onWindowResize(this.resize,this);this.updateEventHovers();this.listviewPortObj.resize=function(){this.vf=!0;ListViewport.prototype.resize.call(this);this.vf=!1};this.splitterHeight=Ext.fly("calendar-panel-xsplit").getHeight();
this.resizeCalListPanels();this.listviewPortObj.grid&&(a=this.listviewPortObj.grid.getColumnModel().getIndexById(ListView.ACTION_COLUMN),this.listviewPortObj.grid.view.sizeColumnToContent(a))}InlineScheduler.enabled=!1;InlineScheduler.scheduler=null;
InlineScheduler.prototype.initCalendar=function(){var a=Ext.get("scrollContainerDiv");Ext.dd.ScrollManager.register(a);this.calendarP.on({collapse:this.closeCalendar,beforecollapse:function(){this.hideCalendarHtml()},beforedestroy:function(){Ext.dd.ScrollManager.unregister(a)},scope:this});this.isCalendarInitialized=!0};InlineScheduler.prototype.toggleCalendar=function(){this.calendarP&&this.calendarP.toggleCollapse(!0)};
InlineScheduler.prototype.postRenderCalendar=function(){this.postOpenCalendar();this.initCalendar()};InlineScheduler.prototype.postOpenCalendar=function(){this.showCalendarHtml();CalFunctions.onCompleteRerender()};InlineScheduler.prototype.postRefreshCalendar=function(){this.resizeCalListPanels();this.updateEventHovers()};InlineScheduler.prototype.hideCalendarHtml=function(){Ext.getDom(this.calendarContentEl).style.display="none"};
InlineScheduler.prototype.showCalendarHtml=function(){Ext.getDom(this.calendarContentEl).style.display="block"};InlineScheduler.prototype.replacePanelElements=function(){this.listviewP.body.dom.appendChild(document.getElementById(this.listviewContentEl));this.calendarP.body.dom.appendChild(document.getElementById(this.calendarContentEl))};
InlineScheduler.prototype.openCalendar=function(){this.isCalOpen=!0;!0!==this.isCalendarInitialized?renderCalendar(!0,this.calPercent):openCalendarAndSaveStateAction(!0,this.calPercent)};InlineScheduler.prototype.closeCalendar=function(){this.isCalOpen=!1;this.resizeAllPanels();closeCalendarAndSaveStateAction(this.isCalOpen,this.calPercent)};
InlineScheduler.prototype.updateToggleElements=function(a){a?(this.calPercent=this.getCalPercent(),this.toggleText.innerHTML=CalFunctions.safe_html(this.openCalTitle),this.toggleImg.alt=CalFunctions.safe_html(this.openCalTitle),this.toggleDivElement.className="toggleCalendarOpen"):(this.toggleText.innerHTML=CalFunctions.safe_html(this.closeCalTitle),this.toggleImg.alt=CalFunctions.safe_html(this.closeCalTitle),this.toggleDivElement.className="toggleCalendarClose");this.toggleImg.src="/img/cal/footer/inline_sched_cal.gif"};
InlineScheduler.prototype.saveCalendarHeightState=function(){this.resizeCalListPanels();if(!this.calendarP.collapsed){var a=this.getCalPercent();5<Math.abs(a-this.calPercent)&&(this.calPercent=a,saveCalendarHeightStateAction(this.isCalOpen,this.calPercent))}};InlineScheduler.prototype.getCalPercent=function(){var a=this.mainP.getBox(),b=this.calendarP.getBox(),a=Math.round(100*(b.height/a.height));return Math.max(Math.min(a,this.maxCalPercent),this.minCalPercent)};
InlineScheduler.prototype.resizeCalListPanels=function(){var a=0;if(this.isCalOpen){var a=this.calendarP.el.dom,b=Ext.get("fixedHeaderDiv"),d=Ext.get("scrollContainerDiv");b.addClass("calDnDfixedHeader");d.addClass("calDnDfixedHeaderBody");var c=b.getOffsetsTo(Ext.get("bCalDiv"))[0],e=d.getOffsetsTo(Ext.get("bCalDiv"))[1];d.setHeight(a.clientHeight-e-1);c=a.clientWidth-c-1;Ext.isSafari||Ext.isChrome?(b.dom.style.width=c+"px",d.dom.style.width=c+"px"):(b.setWidth(c),d.setWidth(c));b=Ext.getDom("daynamerow").getElementsByTagName("th");
b=b[b.length-1];d=Ext.get(b);c=Ext.getDom("daynamerowBody").getElementsByTagName("th");c=Ext.get(c[c.length-1]);c=d.getOffsetsTo(c)[0];lastDayCellWidth=d.getWidth();Ext.isSafari||Ext.isChrome?b.style.width=lastDayCellWidth+c+"px":d.setWidth(lastDayCellWidth+c);a=Ext.get(a).getHeight()}void 0!==this.listviewPortObj&&null!==this.listviewPortObj&&(a=this.mainP.el.getHeight()-this.splitterHeight-a,b=0,this.listviewPortObj.topNav&&(this.listviewPortObj.bottomNav&&this.listviewPortObj.listViewport&&this.listviewPortObj.listBody)&&
(b=this.listviewPortObj.getHOffset()),this.listviewPortObj.height=a>b?a:b,this.listviewPortObj.topNav&&this.listviewPortObj.resize())};
InlineScheduler.prototype.resizeMainPanel=function(){var a=document.documentElement.clientHeight,b=this.mainP.getEl().getTop(),a=a-b-this.footerPanelHeight,b=Math.round(a*(this.calPercent/100))-this.footerPanelHeight,d=a-this.splitterHeight-(this.isCalOpen?b:0),c=this.mainP.getEl().getWidth();this.calendarP.setSize(c,b);this.listviewP.setSize(c,d);this.mainP.setHeight(a);this.isCalOpen||this.calendarP.body.setSize(c,b)};InlineScheduler.prototype.resizeAllPanels=function(){this.resizeMainPanel();this.resizeCalListPanels()};
InlineScheduler.prototype.resize=function(){this.resizeAllPanels()};InlineScheduler.dismissILSBanner=function(){UserContext.userPreferences.setBoolean("HideInlineSchedulingSplash",!0);window.sfdcPage.hideMessage("ilsBanner");InlineScheduler.scheduler&&InlineScheduler.scheduler.resizeAllPanels()};
InlineScheduler.prototype.updateEventHovers=function(){var a=document.getElementById("calendarEventHoverContainer"),b=document.getElementById("inlineSchedulerEventHoverContainer");if(a&&b){for(;0<b.childNodes.length;)b.removeChild(b.firstChild);for(;0<a.childNodes.length;)b.appendChild(a.firstChild)}};

//# sourceMappingURL=/javascript/1421058411000/sfdc/source/Calendar.js.map
