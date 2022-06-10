/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Sfdc.provide("SfdcApp.Umps.widgetLoader",function(){var b=[];return{addWidget:function(a){a&&(a.callback=function(){});b.push(a)},init:function(a){a.url&&Sfdc.Resource.addJavaScript(a.url,function(){if(window.UMPSWidget&&0<b.length)for(var a=0;a<b.length;a++)UMPSWidget.execute(b[a])})}}}());

//# sourceMappingURL=/javascript/1413796312000/sfdc/source/UmpsWidgetLoader.js.map
