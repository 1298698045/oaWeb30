/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Sfdc.provide("SfdcApp.Search.Logger",{logSeuit:function(c,b,d,e){var a={format:"SEUIT"};a.innerParams=d.params;a.componentId=c;a.subComponentId=b;a.searchPageVersion=e;Sfdc.logServer(UnifiedSearchUI.SEARCH_LOGGING_HANDLER,a,Sfdc.Logging.LogLevel.INFO)},logSedwlFromConsole:function(c){var b={format:"SEDWL"};b.actionField=c;Sfdc.logServer(UnifiedSearchUI.SEARCH_LOGGING_HANDLER,b,Sfdc.Logging.LogLevel.INFO);Sfdc.ServerLogging.flush()},logSeasc:function(c,b,d,e){var a={format:"SEASC"};a.recordId=c;a.searchString=
b;a.position=d;a.suggestionType=e;Sfdc.logServer(UnifiedSearchUI.SEARCH_LOGGING_HANDLER,a,Sfdc.Logging.LogLevel.INFO);Sfdc.ServerLogging.flush()}});

//# sourceMappingURL=/javascript/1431595920000/sfdc/source/UnifiedSearchLogging.js.map
