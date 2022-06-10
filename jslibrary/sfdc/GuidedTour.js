/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Ext.ns("Sfdc");
Sfdc.GuidedTour=function(a){Ext.apply(this,a);this.currentStepNum=0;this.totalSteps=null;this.majorVersion=void 0!==Ext.version?Ext.version.substring(0,Ext.version.indexOf(".")):Ext.getVersion().getMajor();4<=this.majorVersion?(this.showLaterHandlerIntercept&&(this.showLaterHandler=Ext.Function.createInterceptor(this.showLaterHandler,this.showLaterHandlerIntercept,this)),this.closeForeverHandlerIntercept&&(this.closeForeverHandler=Ext.Function.createInterceptor(this.closeForeverHandler,this.closeForeverHandlerIntercept,
this))):(this.showLaterHandlerIntercept&&(this.showLaterHandler=this.showLaterHandler.createInterceptor(this.showLaterHandlerIntercept,this)),this.closeForeverHandlerIntercept&&(this.closeForeverHandler=this.closeForeverHandler.createInterceptor(this.closeForeverHandlerIntercept,this)))};Sfdc.GuidedTour.prototype.DEFAULT_TOUR_Y=150;Sfdc.GuidedTour.prototype.ARROW_BASE_CLASS="gt_arrow";Sfdc.GuidedTour.prototype.ARROW_LEFT_CLASS=Sfdc.GuidedTour.prototype.ARROW_BASE_CLASS+"_left";
Sfdc.GuidedTour.prototype.ARROW_RIGHT_CLASS=Sfdc.GuidedTour.prototype.ARROW_BASE_CLASS+"_right";Sfdc.GuidedTour.prototype.ARROW_UP_CLASS=Sfdc.GuidedTour.prototype.ARROW_BASE_CLASS+"_up";Sfdc.GuidedTour.prototype.ARROW_DOWN_CLASS=Sfdc.GuidedTour.prototype.ARROW_BASE_CLASS+"_down";Sfdc.GuidedTour.prototype.CONTAINER_CLASS="gt-ct";Sfdc.GuidedTour.prototype.SHADOW_OFFSET=6;Sfdc.GuidedTour.prototype.RIGHT_BUTTON_ICON_CLASS="gt-btn-icon-right";Sfdc.GuidedTour.prototype.LEFT_BUTTON_ICON_CLASS="gt-btn-icon-left";
Sfdc.GuidedTour.prototype.LEFT_BUTTON_CLASS="gt-btn-left";Sfdc.GuidedTour.prototype.STANDARD_BUTTON_CLASS="gt-btn";Sfdc.GuidedTour.prototype.MIN_BUTTON_WIDTH=20;Sfdc.GuidedTour.prototype.ARROW_SIZE=38;Sfdc.GuidedTour.prototype.ARROW_OVERLAP=5;Sfdc.GuidedTour.prototype.RESIZE_DELAY=500;Sfdc.GuidedTour.prototype.nextStepHandler=function(){this.hideStep();this.stepToNextValid();this.showStep()};Sfdc.GuidedTour.prototype.prevStepHandler=function(){this.hideStep();this.stepToPrevValid();this.showStep()};
Sfdc.GuidedTour.prototype.jumpToStartHandler=function(){this.hideStep();this.currentStepNum=0;this.showStep()};Sfdc.GuidedTour.prototype.showLaterHandler=function(){this._closeStepWindow()};Sfdc.GuidedTour.prototype.closeForeverHandler=function(){this._closeStepWindow()};Sfdc.GuidedTour.prototype._closeStepWindow=function(){this.currentStepNum=0;this.stepWindow&&this.stepWindow.close()};
Sfdc.GuidedTour.prototype.shouldShowTheStep=function(a){if("undefined"===typeof a.locator)return!0;a=Ext.get(Ext.DomQuery.selectNode(a.locator));return null!==a&&a.isVisible(!0)};Sfdc.GuidedTour.prototype.stepToNextValid=function(){for(Perf.mark("Sfdc.GuidedTour.prototype.stepToNextValid:start");this.currentStepNum<this.steps.length-1&&!(this.currentStepNum+=1,this.shouldShowTheStep(this.steps[this.currentStepNum])););Perf.endMark("Sfdc.GuidedTour.prototype.stepToNextValid:start")};
Sfdc.GuidedTour.prototype.stepToPrevValid=function(){for(Perf.mark("Sfdc.GuidedTour.prototype.stepToPrevValid:start");0<this.currentStepNum&&!(this.currentStepNum-=1,this.shouldShowTheStep(this.steps[this.currentStepNum])););Perf.endMark("Sfdc.GuidedTour.prototype.stepToPrevValid:start")};
Sfdc.GuidedTour.prototype.getCounterText=function(){Perf.mark("Sfdc.GuidedTour.prototype.getCounterText:start");if(null===this.totalSteps){var a=1,c=0,d=this;Ext.each(this.steps,function(b){b.countStep&&d.shouldShowTheStep(b)&&(b.stepIndex=a++,c+=1)});this.totalSteps=c}Perf.endMark("Sfdc.GuidedTour.prototype.getCounterText:start");return LC.getLabel("GuidedTour","stepCounter",this.steps[this.currentStepNum].stepIndex,this.totalSteps)};
Sfdc.GuidedTour.prototype.createButtonBarItems=function(a){var c=[];Ext.each(a.toolbarItems,function(d){var b={};Ext.apply(b,d);b.handler=this[b.action];b.scope=this;"label"===b.xtype&&!b.text?b.text=this.getCounterText():(b.text="continueLabel"===d.labelType&&"undefined"!==typeof a.stepIndex&&"undefined"!==typeof this.totalSteps&&a.stepIndex===this.totalSteps?this.endTourLabel:this[d.labelType],"continueLabel"===d.labelType||"startTourLabel"===d.labelType||"endTourLabel"===d.labelType?(b.iconCls=
this.RIGHT_BUTTON_ICON_CLASS,b.iconAlign="right",b.cls=this.STANDARD_BUTTON_CLASS):"previousLabel"===d.labelType?(b.iconCls=this.LEFT_BUTTON_ICON_CLASS,b.iconAlign="left",b.cls=this.LEFT_BUTTON_CLASS,b.text="\x3cspan\x3e"+b.text+"\x3c/span\x3e"):b.cls=this.STANDARD_BUTTON_CLASS);c.push(b)},this);return c};
Sfdc.GuidedTour.prototype.createStepConfig=function(a){var c;c=4<=this.majorVersion?{resizable:!1,draggable:!1,html:a.content+'\x3cdiv style\x3d"clear:both"/\x3e',title:a.title,width:a.width,buttonAlign:"left",baseCls:this.CONTAINER_CLASS,bodyStyle:"padding-top:25px;",shadow:"frame",shadowOffset:this.SHADOW_OFFSET,closeAction:"closeForever",closeForever:Ext.Function.bind(this.closeForeverHandler,this),closable:a.countStep,buttons:this.createButtonBarItems(a),defaultButton:a.toolbarItems.length-1,
listeners:{close:{fn:this.hideArrowElement,scope:this}},toolTemplate:new Ext.Template('\x3ca href\x3d"javsascript:void()" class\x3d"x-tool x-tool-{id}"\x3e\x26#160;\x3c/a\x3e')}:{resizable:!1,draggable:!1,html:a.content+'\x3cdiv style\x3d"clear:both"/\x3e',title:a.title,width:a.width,buttonAlign:"left",baseCls:this.CONTAINER_CLASS,shadow:"frame",shadowOffset:this.SHADOW_OFFSET,closeAction:"closeForever",closeForever:this.closeForeverHandler.createDelegate(this),closable:a.countStep,buttons:this.createButtonBarItems(a),
defaultButton:a.toolbarItems.length-1,listeners:{close:{fn:this.hideArrowElement,scope:this}},toolTemplate:new Ext.Template('\x3ca href\x3d"javsascript:void()" class\x3d"x-tool x-tool-{id}"\x3e\x26#160;\x3c/a\x3e')};a.height?c.height=a.height:c.autoHeight=!0;return c};
Sfdc.GuidedTour.prototype.scrollToTour=function(){if(this.stepWindow){var a=Ext.getBody(),c=a.getScroll().top,d=this.stepWindow.getPosition()[1]-Sfdc.GuidedTour.prototype.DEFAULT_TOUR_Y;c!==d&&a.animate({scroll:{to:[0,d],from:[0,c]}},0.5,null,"easeOut","scroll")}};
Sfdc.GuidedTour.prototype.positionTourAtDefault=function(a){Perf.mark("Sfdc.GuidedTour.prototype.positionTourAtDefault:start");if(a){var c=Ext.getBody().getViewSize().width,d=Math.round(a.getWidth()/2);a.setPagePosition(Math.round(c/2-d),this.DEFAULT_TOUR_Y)}Perf.endMark("Sfdc.GuidedTour.prototype.positionTourAtDefault:start")};Sfdc.GuidedTour.prototype.hideArrowElement=function(){this.arrowEl&&this.arrowEl.hide()};
Sfdc.GuidedTour.prototype.getArrowElement=function(){this.arrowEl||(this.arrowEl=Ext.DomHelper.append(Ext.getBody(),{tag:"div",cls:this.ARROW_BASE_CLASS},!0),this.arrowEl.setSize({width:this.ARROW_SIZE,height:this.ARROW_SIZE}));return this.arrowEl};
Sfdc.GuidedTour.prototype.showStep=function(){Perf.mark("Sfdc.GuidedTour.prototype.showStep:start");var a=this.steps[this.currentStepNum];this.stepWindow=new Ext.Window(this.createStepConfig(a));this.stepWindow.show();Sfdc.isFunction(a.beforeShow)&&a.beforeShow();if(a.locator){var c=Ext.DomQuery.selectNode(a.locator);if(c){var d=4<=this.majorVersion||Sfdc.userAgent.isIE7||Sfdc.userAgent.isIE8;if(a.useArrow){this.arrowEl=this.getArrowElement();this.arrowEl.show();this.arrowEl.position("absolute",parseInt(this.stepWindow.getEl().getStyle("z-index"),
10)+1);d?this.arrowEl.alignTo(c,a.position,a.offsets):this.arrowEl.anchorTo(c,a.position,a.offsets);var b=a.position.substring(0,a.position.indexOf("-")).charAt(0),e=a.offsets?a.offsets[0]:0,f=a.offsets?a.offsets[1]:0,g=a.arrowOffset||0;switch(b){case "t":f=f+this.arrowEl.getHeight()-Sfdc.GuidedTour.prototype.ARROW_OVERLAP;e-=g;b=this.ARROW_UP_CLASS;break;case "b":f=f-this.arrowEl.getHeight()+Sfdc.GuidedTour.prototype.ARROW_OVERLAP;e-=g;b=this.ARROW_DOWN_CLASS;break;case "l":e=e+this.arrowEl.getWidth()-
Sfdc.GuidedTour.prototype.ARROW_OVERLAP;f-=g;b=this.ARROW_LEFT_CLASS;break;default:e=e-this.arrowEl.getWidth()+Sfdc.GuidedTour.prototype.ARROW_OVERLAP,f-=g,b=this.ARROW_RIGHT_CLASS}this.arrowEl.set({cls:this.ARROW_BASE_CLASS+" "+b});d?this.stepWindow.el.alignTo(c,a.position,[e,f]):this.stepWindow.anchorTo(c,a.position,[e,f])}else d?this.stepWindow.alignTo(c,a.position,a.offsets):this.stepWindow.anchorTo(c,a.position,a.offsets)}else this.positionTourAtDefault(this.stepWindow)}else this.positionTourAtDefault(this.stepWindow);
this.scrollToTour();Sfdc.isFunction(a.afterShow)&&a.afterShow();this.stepWindow.focus();Perf.endMark("Sfdc.GuidedTour.prototype.showStep:start")};Sfdc.GuidedTour.prototype.hideStep=function(){var a=this.steps[this.currentStepNum];"function"==typeof a.beforeHide&&a.beforeHide();this.stepWindow&&this.stepWindow.close();this.arrowEl&&this.arrowEl.hide()};
Sfdc.GuidedTour.prototype.start=function(a){Sfdc.log("Evaluating org and environment to see if guided tour can start...");var c=Sfdc.LocalStorage.getItem("walkthrough.version");Sfdc.log("The walkthrough app "+(c?"IS":"is NOT")+" running.");a||!c&&(!Sfdc.isFunction(this.shouldShowHandler)||this.shouldShowHandler())?(Sfdc.log("Starting the first step of the guided tour..."),this.showStep()):Sfdc.log("No action taken - the guided tour did not start.")};
Sfdc.GuidedTour.prototype.isCurrentlyOpen=function(){return this.stepWindow?this.stepWindow.isVisible():!1};

//# sourceMappingURL=/javascript/1410512610000/sfdc/source/GuidedTour.js.map
