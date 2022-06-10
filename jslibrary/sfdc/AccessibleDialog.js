/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
function OverlayDialog(){this.dialog=this.id=null;this.isModal=!0;this.extraClass="";this.background=null;this.width=OverlayDialog.MAX_WIDTH;this.minHeight=OverlayDialog.MIN_HEIGHT;this.minWidth=OverlayDialog.MIN_WIDTH;this.buttons=[];this.info=this.header=this.title=null;this.created=this.isOpen=!1;this.allowKeyboardEsc=this.displayX=!0;this.resizing=this.moving=this.positioned=this.isAbsolutePositioned=this.isMovable=this.isResizable=!1;this.changeY=this.changeX=this.relativeY=this.relativeX=this.fixedY=
this.fixedX=0;this.wrappingPointId=this.focusPointId=null;this.focusOnShow=!0;this.useCSS=!1;this.htmlOverflow="";this.refreshOnClose=!1}OverlayDialog.MAX_BUTTONS=4;OverlayDialog.MAX_WIDTH=800;OverlayDialog.MIN_WIDTH=300;OverlayDialog.MIN_HEIGHT=200;OverlayDialog.EDGE_BUFFER=40;OverlayDialog.LOAD_MARK="OverlayLoadStart";OverlayDialog.HIDDEN_STYLE="width:2px;height:2px;position:absolute;border:0;margin:0;padding:0;background:none;outline:none;z-index:-1;cursor:none;";
OverlayDialog.prototype.addEvents=function(){if(this.id){var a=this;this.allowKeyboardEsc&&addEvent(document,"keydown",function(c){a.handleKeyPress(c)},!1);this.useCSS||(addEvent(window,"resize",function(){a.resizeEvent()},!1),Sfdc.userAgent.isIE6&&addEvent(window,"scroll",function(){a.scrollEvent()},!1))}};OverlayDialog.prototype.setTitle=function(a){this.title=a;this.created&&(document.getElementById(this.id+"Title").innerHTML=this.title)};
OverlayDialog.prototype.setHeader=function(a){this.header=a;this.created&&(document.getElementById(this.id+"Header").innerHTML=this.header)};OverlayDialog.prototype.setInfo=function(a){this.info=a;this.created&&(document.getElementById(this.id+"Info").innerHTML=this.info)};OverlayDialog.prototype.setWidth=function(a){this.width=a;this.dialog&&(Sfdc.isDefAndNotNull(a)&&(this.dialog.style.width="string"==typeof a?a:a+"px"),this.isOpen&&this.position())};
OverlayDialog.prototype.setMinHeight=function(a){this.minHeight=a};OverlayDialog.prototype.setMinWidth=function(a){this.minWidth=a};OverlayDialog.prototype.overrideButton=function(a,c,b){if(a>=OverlayDialog.MAX_BUTTONS)throw"Cannot have more than "+OverlayDialog.MAX_BUTTONS+" buttons.";this.buttons[a]={display:c,action:b}};
OverlayDialog.prototype.setupDefaultButtons=function(){this.buttons=[];this.buttons[0]={display:LC.getLabel("Buttons","ok"),action:null};this.buttons[1]={display:LC.getLabel("Buttons","cancel"),action:null}};OverlayDialog.prototype.clearButtons=function(){this.buttons=[]};
OverlayDialog.prototype.show=function(){if(this.useCSS){var a=this.getPageOverflowElement();this.htmlOverflow=a.style.overflow;a.style.overflow="hidden"}this.dialog?(this.dialog.style.display="block",this.position(),this.isModal&&(this.background||this.createBackground(),this.resizeBackground(),this.background.style.display="block",this.processSelectElems()),this.dialog.style.visibility="visible",this.isOpen=!0,Sfdc.Function.delay(this.setPrimaryFocus,1,this,[this]),window.Perf&&Perf.endMark(OverlayDialog.LOAD_MARK)):
Sfdc.log("WARNING \x3e OverlayDialog.show() was called even though no dialog object had been created with createDialog(). This means that the dialog creation failed or is stuck in the Aloha onLoad queue.")};
OverlayDialog.prototype.setPrimaryFocus=function(a,c){a||(a=this);if(!0===c){if(null!==a.wrappingPointId){var b=document.getElementById(a.wrappingPointId);if(null!==b&&!0!==b.disabled)try{b.focus()}catch(d){}else Sfdc.error(a.wrappingPointId+" could not be focused")}}else if(!0===a.focusOnShow){b=null;null!==a.focusPointId&&(b=document.getElementById(a.focusPointId));if(null===b||b.disabled||"none"===b.style.display||"hidden"===b.style.display.visibility){var e=a.dialog.getElementsByTagName("*"),
f=null,h=null;for(i=0;i<e.length;i++)if(!e[i].disabled&&!("none"===e[i].style.display||"hidden"===e[i].style.visibility)){var g=e[i].tagName;if("INPUT"===g||"TEXTAREA"===g||"SELECT"===g){h=i;break}null===f&&"A"===g&&(f=i)}null!==h?b=e[h]:null!==f&&(b=e[f])}if(null!==b&&!0!==b.disabled){try{b.focus()}catch(k){}("text"==b.type||"textarea"==b.type)&&b.select()}else Sfdc.error(a.focusPointId+" could not be focused")}};
OverlayDialog.prototype.processSelectElems=function(a){if(Sfdc.userAgent.isIE6){for(var c=document.getElementsByTagName("select"),b=c.length,d=0;d<b;d++)c[d].style.visibility=a?"visible":"hidden";if(!a){a=this.dialog.getElementsByTagName("select");c=a.length;for(d=0;d<c;d++)a[d].style.visibility="visible"}}};
OverlayDialog.prototype.hide=function(){this.isMovable&&this.stopDrag();this.isModal&&(this.background.style.display="none",this.processSelectElems(!0));this.dialog.style.visibility="hidden";Sfdc.userAgent.isFirefox||(this.dialog.style.display="none");this.useCSS&&(this.getPageOverflowElement().style.overflow=this.htmlOverflow);this.htmlOverflow="";this.isOpen=!1;this.refreshOnClose&&(Sfdc.userAgent.isChromeFrame?window.location=window.location:window.location.reload(!0))};
OverlayDialog.prototype.getPageOverflowElement=function(){return Sfdc.userAgent.isFirefox?document.body:document.documentElement};OverlayDialog.prototype.cancel=function(){this.hide()};OverlayDialog.prototype.handleKeyPress=function(a){if(this.isOpen){a=getEvent(a);var c=a.keyCode;c==KEY_ESC&&this.allowKeyboardEsc?this.handleCancel():c==KEY_ENTER&&this.captureEnter(getEventTarget(a))&&this.enter()}};
OverlayDialog.prototype.captureEnter=function(a){return"A"!=a.nodeName&&"TEXTAREA"!=a.nodeName&&"button"!=a.type};OverlayDialog.prototype.enter=function(){};OverlayDialog.prototype.handleCancel=function(){this.cancel()};
OverlayDialog.prototype.position=function(){if(this.dialog){var a=this.dialog.style;if(this.useCSS)a.marginTop=-0.25*this.dialog.offsetHeight+"px",LC&&LC.isRtlPage()?a.marginRight=-0.5*this.dialog.offsetWidth+"px":a.marginLeft=-0.5*this.dialog.offsetWidth+"px";else if(this.resizing){var c=this.startWidth+this.changeX,b=this.startHeight+this.changeY;c<this.minWidth&&(c=this.minWidth);b<this.minHeight&&(b=this.minHeight);a.width=c+"px";a.height=b+"px";document.getElementById(this.getContentId()).style.height=
b-46+"px"}else{if(c=document.getElementById(this.getContentId()))c.style.height="",c.style.overflowY="",c.style.position="",this.dialog.offsetHeight>getWindowHeight()&&(c.style.height=getWindowHeight()-100+"px",c.style.overflowY="auto",c.style.position="relative");if(this.positioned){var c=Sfdc.Window.getWindowWidth()-OverlayDialog.EDGE_BUFFER,b=Sfdc.Window.getWindowHeight()-OverlayDialog.EDGE_BUFFER,d=OverlayDialog.EDGE_BUFFER-this.dialog.offsetWidth,e=-OverlayDialog.EDGE_BUFFER/2;this.fixedX<d?
this.fixedX=d:this.fixedX>c&&(this.fixedX=c);this.fixedY<e?this.fixedY=e:this.fixedY>b&&(this.fixedY=b)}else this.setInnerHeight(),c=Sfdc.Window.getWindowWidth()-this.dialog.offsetWidth,c=6>c?6:c/2,b=Sfdc.Window.getWindowHeight()-this.dialog.offsetHeight,this.fixedX=c,this.fixedY=6>b?6:b/2;Sfdc.userAgent.isIE6?(a.left=this.fixedX+getScrollX()+"px",a.top=this.fixedY+getScrollY()+"px"):(a.left=this.fixedX+"px",a.top=this.fixedY+"px")}}};OverlayDialog.prototype.setInnerHeight=function(){};
OverlayDialog.prototype.createBackground=function(){this.background=document.createElement("div");this.background.className="overlayBackground";this.useCSS&&(Sfdc.userAgent.isSafariIOS?(this.background.style.width=document.body.scrollWidth+"px",this.background.style.height=document.body.scrollHeight+"px"):(this.background.style.width="10000px",this.background.style.height="20000px"));document.body.appendChild(this.background);var a=this;addEvent(this.background,"mousedown",function(c){a.smash(c)},
!1);addEvent(this.background,"click",function(c){a.smash(c)},!1)};OverlayDialog.prototype.resizeBackground=function(){if(this.background&&!this.useCSS&&this.created){var a=this.background.style;this.dialog.currentStyle&&Sfdc.userAgent.isIE6?(a.width=document.body.offsetWidth+"px",a.height=document.body.offsetHeight+"px"):(a.width=Math.max(document.documentElement.scrollWidth,Sfdc.Window.getWindowWidth())+"px",a.height=Math.max(document.documentElement.scrollHeight,Sfdc.Window.getWindowHeight())+"px")}};
OverlayDialog.prototype.scrollEvent=function(){this.created&&this.position()};OverlayDialog.prototype.resizeEvent=function(){this.resizeBackground();this.position()};
OverlayDialog.prototype.createDialog=function(){this.dialog=this.createDialogElement();document.body.appendChild(this.dialog);this.setWidth(this.width);var a=this;addEvent(document.getElementById(this.blurCatchId),"focus",function(){a.setPrimaryFocus(a,!0)});addEvent(document.body,"keyup",function(){if(a&&a.isOpen){for(var b=document.activeElement,c=!0;b.id!=a.id;){if(b===document.body){c=!1;break}b=b.parentNode}c||a.setPrimaryFocus(a)}});if(!this.useCSS&&(this.isMovable||this.isResizable))if(addEvent(document,
"mouseup",function(){a.stopDrag()},!1),this.isMovable&&(addEvent(this.dialog.firstChild,"mousedown",function(b){a.startMove(b)},!1),addEvent(document,"mousemove",function(b){a.move(b)},!1)),this.isResizable){var c=document.getElementById(this.id+"Resize");addEvent(c,"mousedown",function(b){a.startResize(b)},!1);addEvent(document,"mousemove",function(b){a.resize(b)},!1)}this.createContent();this.created=!0};
OverlayDialog.prototype.createDialogElement=function(){this.blurCatchId=this.id+"BlurCatch";this.focusPointId=this.id+"FocusPoint";this.wrappingPointId=this.displayX?this.id+"X":this.focusPointId;var a=this.id+"Title",c=document.createElement("div");c.id=this.id;c.setAttribute("role","dialog");c.setAttribute("aria-live","assertive");c.setAttribute("aria-describedby",a);var b=["overlayDialog"];this.isAbsolutePositioned&&b.push("absolutePositionedOverlayDialog");this.useCSS&&b.push("cssDialog");b.push(this.extraClass);
c.className=b.join(" ");b=[];b.push("\x3cdiv class\x3d'topRight");this.isMovable&&b.push(" movable");b.push("'\x3e");b.push("\x3ca id\x3d'"+this.focusPointId+"' ");b.push("href\x3d'javascript:void(0)' ");b.push("onclick\x3d'return false;' ");b.push("style\x3d'"+OverlayDialog.HIDDEN_STYLE+"' ");b.push("title\x3d'"+LC.getLabel("Global","startOfDialog")+"' ");this.displayX&&b.push("onfocus\x3d'document.getElementById(\""+this.wrappingPointId+"\").focus()'");b.push("\x3e");b.push(LC.getLabel("Global",
"startOfDialog"));b.push("\x3c/a\x3e");b.push("\x3cdiv class\x3d'topLeft'\x3e");this.displayX&&(b.push("\x3ca id\x3d'"+this.wrappingPointId+"' title\x3d'"+LC.getLabel("Buttons","close")+"' tabindex\x3d'0' onmouseover\x3d\"this.className \x3d 'dialogCloseOn'\" onmouseout\x3d\"this.className \x3d 'dialogClose'\" onclick\x3d\"sfdcPage.getDialogById('"),b.push(this.id),b.push("').cancel()\" href\x3d'javascript:void(0)' class\x3d'dialogClose'\x3e"+LC.getLabel("Buttons","close")+"\x3c/a\x3e"));b.push("\x3ch2 id\x3d'"+
a+"'\x3e");b.push(this.title);b.push("\x3c/h2\x3e\x3c/div\x3e\x3c/div\x3e\x3cdiv class\x3d'middle'\x3e\x3cdiv class\x3d'innerContent' id\x3d'");b.push(this.getContentId());b.push("'\x3e\x3c/div\x3e\x3c/div\x3e");this.isResizable&&(b.push("\x3cdiv id\x3d'"),b.push(this.id),b.push("Resize' class\x3d'dialogResize'\x3e\x3c/div\x3e"));b.push('\x3cdiv class\x3d\'bottomRight\'\x3e\x3clabel style\x3d"display:none;" for \x3d"'+this.blurCatchId+"\"\x3e'\x26nbsp;'\x3c/label\x3e\x3cinput id\x3d'"+this.blurCatchId+
"' style\x3d'"+OverlayDialog.HIDDEN_STYLE+"' type\x3d'text' /\x3e\x3cdiv class\x3d'bottomLeft'\x3e\x3c/div\x3e\x3c/div\x3e");c.innerHTML=b.join("");return c};OverlayDialog.prototype.createContent=function(){};
OverlayDialog.prototype.startMove=function(a){a=getEvent(a);"IMG"!=getEventTarget(a).nodeName&&(this.moving=this.positioned=!0,this.relativeX=a.clientX-this.dialog.offsetLeft,this.relativeY=a.clientY-this.dialog.offsetTop,Sfdc.userAgent.isIE6&&(this.relativeX+=getScrollX(),this.relativeY+=getScrollY()),this.fixedX=a.clientX-this.relativeX,this.fixedY=a.clientY-this.relativeY,this.smash(a))};
OverlayDialog.prototype.startResize=function(a){a=getEvent(a);this.resizing=this.positioned=!0;this.relativeX=a.clientX;this.relativeY=a.clientY;this.startWidth=this.dialog.offsetWidth;this.startHeight=this.dialog.offsetHeight;this.smash(a)};OverlayDialog.prototype.stopDrag=function(){this.resizing=this.moving=!1};OverlayDialog.prototype.move=function(a){this.moving&&(a=getEvent(a),this.smash(a),this.fixedX=a.clientX-this.relativeX,this.fixedY=a.clientY-this.relativeY,this.position())};
OverlayDialog.prototype.resize=function(a){this.resizing&&(a=getEvent(a),this.smash(a),this.changeX=a.clientX-this.relativeX,this.changeY=a.clientY-this.relativeY,this.position())};OverlayDialog.prototype.smash=function(a){a.stopPropagation?a.stopPropagation():a.cancelBubble=!0;a.preventDefault?a.preventDefault():a.returnValue=!1};OverlayDialog.prototype.getContentId=function(){return this.id+"Content"};
OverlayDialog.prototype.createButtons=function(a){a.push("\x3cdiv id\x3d'"+this.id+"_buttons' class\x3d'buttons ");a.push("zen");a.push("'\x3e");for(var c=0;c<this.buttons.length;c++){var b=this.buttons[c].display,d=this.buttons[c].action,e=this.buttons[c].id;a.push("\x3cinput class\x3d'");a.push("zen-btn");a.push("' type\x3d'button' value\x3d'");a.push(b);e&&(a.push("' id\x3d'"),a.push(e));a.push("' onclick\x3d\"");"string"==typeof d?(a.push("if("),a.push(d.replace(/"/,'\\"')),a.push(")")):"function"==
typeof d&&(a.push("if("),a.push(d.name),a.push("())"));a.push("sfdcPage.getDialogById('");a.push(this.id);a.push("').hide();\"\x3e")}a.push("\x3c/div\x3e")};OverlayDialog.prototype.register=function(){sfdcPage.registerDialog(this)};
function SimpleDialog(b,a){this.id=b;this.isModal=!0;this.isMovable=a;this.extraClass="";this.width=450;this.title="";this.displayX=!1;this.addEvents()}SimpleDialog.prototype=new OverlayDialog;SimpleDialog.prototype.createContent=function(){var b=document.getElementById(this.getContentId()),a=[];a.push("\x3ch2 id\x3d'");a.push(this.id);a.push("Header'\x3e");a.push(this.header);a.push("\x3c/h2\x3e");a.push("\x3cdiv id\x3d'");a.push(this.id);a.push("Inner'\x3e\x3c/div\x3e");b.innerHTML=a.join("")};
SimpleDialog.prototype.setContentInnerHTML=function(b){this.getContentElement().innerHTML=b};SimpleDialog.prototype.importContentNode=function(b){this.setContentInnerHTML("");this.getContentElement().appendChild(b)};SimpleDialog.prototype.getContentElement=function(){return document.getElementById(this.id+"Inner")};
function getOpenDialog(){for(var a in sfdcPage.dialogs)if(sfdcPage.dialogs.hasOwnProperty(a)){var b=sfdcPage.dialogs[a];if(b.isOpen)return b}}function closeDialog(a){var b=getOpenDialog();b&&b.close();a&&(Sfdc.userAgent.isSafari3?window.location.href=window.location.href:window.location.reload())}function resizeDialog(a,b){var d=getOpenDialog();d&&d.resize(a,b)}function CollaborationAccessibleDialogHelper(){}CollaborationAccessibleDialogHelper.addUrlObserver=function(a){CollaborationAccessibleDialogHelper.urlObservers.push(a)};
CollaborationAccessibleDialogHelper.urlObservers=[];CollaborationAccessibleDialogHelper.transformUrl=function(a){for(var b=0;b<CollaborationAccessibleDialogHelper.urlObservers.length;b++)a=CollaborationAccessibleDialogHelper.urlObservers[b](a);return a};function CollaborationAccessibleDialog(a,b,d,e,c){this.id=a;this.contentId=a+"ContentId";this.height=e;this.url=d;""!==c&&void 0!==c&&(this.width=parseInt(c,10));this.register();Ext.fly(window).on("focus",function(){closeDialog()})}
CollaborationAccessibleDialog.prototype=new SimpleDialog;CollaborationAccessibleDialog.prototype.display=function(){for(var a in sfdcPage.dialogs)if(sfdcPage.dialogs.hasOwnProperty(a)){var b=sfdcPage.dialogs[a];b.isOpen&&b.popupWindow.close()}this.popupWindow=window.open(CollaborationAccessibleDialogHelper.transformUrl(this.url),this.id,"height\x3d"+this.height+",width\x3d"+this.width+",location\x3d0,status\x3d0");this.popupWindow.focus();this.isOpen=!0};
CollaborationAccessibleDialog.prototype.resize=function(a,b){this.popupWindow.resizeTo(b,a+100)};CollaborationAccessibleDialog.prototype.close=function(){this.popupWindow.close()};function NonaccessibleDialog(a,b,d,e,c){this.id=a;this.contentId=a+"ContentId";this.displayX=this.isMovable=!0;this.height=e;this.url=d;""!==c&&void 0!==c&&(this.width=parseInt(c,10));this.setTitle(b);this.register()}NonaccessibleDialog.prototype=new SimpleDialog;
NonaccessibleDialog.prototype.display=function(){var a=[];a.push('\x3ciframe frameborder\x3d"no" id\x3d"'+this.contentId+'" style\x3d"border:0;height:'+this.height+"px;width:"+(Sfdc.userAgent.isIE6?"93%":"100%")+';" src\x3d"'+CollaborationAccessibleDialogHelper.transformUrl(this.url)+'"\x3e\x3c/iframe\x3e');this.setContentInnerHTML(a.join(""));this.show();this.setWidth(this.width)};NonaccessibleDialog.prototype.resize=function(a,b){document.getElementById(this.contentId).style.height=a+"px";this.setWidth(b)};
NonaccessibleDialog.superclass=SimpleDialog.prototype;NonaccessibleDialog.prototype.hide=function(){var a=this.getContentElement().firstChild.contentWindow;try{a.closePopup&&a.closePopup()}catch(b){}finally{NonaccessibleDialog.superclass.hide.call(this)}};NonaccessibleDialog.prototype.close=function(){this.hide()};

//# sourceMappingURL=/javascript/1457082225000/sfdc/source/AccessibleDialog.js.map