/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
DhtmlHistory.POLLING_FREQUENCY=300;DhtmlHistory.WAIT_FREQUENCY=500;function DhtmlHistory(a,c,b){this.locationOfBlankPage=UserContext.getUrl("/back_blank.html?");this.currentLocation=null;this.listener=c;this.iframe=null;this.ignoreLocationChange=!1;this.currentWaitTime=0;this.historyStorage=a;this.parentObject=b;this.create()}
DhtmlHistory.prototype.add=function(a,c){var b=this;window.setTimeout(function(){0<b.currentWaitTime&&(b.currentWaitTime-=DhtmlHistory.WAIT_FREQUENCY);a=b.removeHash(a);if(document.getElementById(a))Sfdc.error("History locations can not have the same value as any id's that might be in the document");else if(b.historyStorage[a]=c,b.ignoreLocationChange=!0,b.currentLocation=a,window.location.hash=a,Sfdc.userAgent.isIE)if(b.iframe)b.iframe.src=b.locationOfBlankPage+a;else{var e=document.getElementsByTagName("body")[0];
if(e){var d=document.createElement("div");e.appendChild(d);d.style.display="none";d.innerHTML="\x3ciframe class\x3d'dhtmlHistoryFrame' name\x3d'DhtmlHistoryFrame' id\x3d'DhtmlHistoryFrame' src\x3d'"+b.locationOfBlankPage+a+"'\x3e\x3c/iframe\x3e";b.iframe=document.getElementById("DhtmlHistoryFrame")}}},this.currentWaitTime);this.currentWaitTime+=DhtmlHistory.WAIT_FREQUENCY};DhtmlHistory.prototype.getCurrentLocation=function(){return this.removeHash(window.location.hash)};
DhtmlHistory.prototype.create=function(){this.currentLocation=this.getCurrentLocation();this.ignoreLocationChange=!0;if(!Sfdc.userAgent.isIE){var a=this;setInterval(function(){a.checkLocation()},DhtmlHistory.POLLING_FREQUENCY)}};DhtmlHistory.prototype.fireHistoryEvent=function(a,c){this.listener.call(this.parentObject,a,c)};DhtmlHistory.prototype.shouldProceedWithHistoryEvent=function(){return this.ignoreLocationChange?this.ignoreLocationChange=!1:!0};
DhtmlHistory.prototype.checkLocation=function(){if(!Sfdc.userAgent.isIE&&this.shouldProceedWithHistoryEvent()){var a=this.getCurrentLocation();if(a!=this.currentLocation){var c=this.currentLocation;this.currentLocation=a;this.fireHistoryEvent(c,a)}}};DhtmlHistory.prototype.removeHash=function(a){return a?""==a||1==a.length&&"#"==a.charAt(0)?"":1<a.length&&"#"==a.charAt(0)?a.substring(1):a:null};
DhtmlHistory.prototype.iframeLoaded=function(a){if(Sfdc.userAgent.isIE&&this.shouldProceedWithHistoryEvent()){a=new String(a.search);!a||1==a.length&&"?"==a.charAt(0)?a="":2<=a.length&&"?"==a.charAt(0)&&(a=a.substring(1));var c=this.removeHash(window.location.hash);window.location.hash=a;this.fireHistoryEvent(c,a)}};
SearchHistory.LIST_URL="listUrl";SearchHistory.ACTION_URL="actionUrl";SearchHistory.LIST_QS="listQS";SearchHistory.LIST_ID="listId";function SearchHistory(){this.listId=this.listQs=this.listUrl=this.actionUrl=null}
SearchHistory.prototype.readFromQs=function(a){this.actionUrl=SearchPage.prototype.decodeForSearch(a.get(SearchHistory.ACTION_URL));this.listUrl=SearchPage.prototype.decodeForSearch(a.get(SearchHistory.LIST_URL));this.listQs=SearchPage.prototype.decodeForSearch(a.get(SearchHistory.LIST_QS));this.listId=SearchPage.prototype.decodeForSearch(a.get(SearchHistory.LIST_ID))};SearchHistory.prototype.setActionUrl=function(a){this.actionUrl=a};SearchHistory.prototype.setListUrl=function(a){this.listUrl=a};
SearchHistory.prototype.setListQs=function(a){this.listQs=a};SearchHistory.prototype.setListId=function(a){this.listId=a};SearchHistory.prototype.getActionUrl=function(){return this.actionUrl};SearchHistory.prototype.getListUrl=function(){return this.listUrl};SearchHistory.prototype.getListQs=function(){return this.listQs};SearchHistory.prototype.getListId=function(){return this.listId};
SearchHistory.prototype.toString=function(){var a=new QueryString("");this.actionUrl&&0<this.actionUrl.length&&a.add(SearchHistory.ACTION_URL,SearchPage.prototype.encodeForSearch(this.actionUrl));this.listUrl&&0<this.listUrl.length&&a.add(SearchHistory.LIST_URL,SearchPage.prototype.encodeForSearch(this.listUrl));this.listQs&&0<this.listQs.length&&a.add(SearchHistory.LIST_QS,SearchPage.prototype.encodeForSearch(this.listQs));this.listId&&0<this.listId.length&&a.add(SearchHistory.LIST_ID,SearchPage.prototype.encodeForSearch(this.listId));
a=a.toString();return a.substring(1,a.length)};
SearchHistory.TIMEOUT=1E3;SearchHistory.TIMEOUT_STEP=5;function SearchPage(){this.dhtmlHistory=this.openComponent=null;this.historyEnabled=!0;this.historyCounter=0;this.historyPrefix="hst";this.historyStorage={};this.actionIdStorage={};this.cancelCalls={};this.duelingBoxRef={};var a=this;this.closeOpenedComponent=function(d){if(a.openComponent&&(d=document.getElementById(a.openComponent)))d.style.display="none",a.openComponent=null}}SearchPage.prototype=new DetailPage;
SearchPage.prototype.wrapDhtmlWaitingRequest=function(a,d,b,c,h,e,f){var g=this.createIdentifier();this.hook_shouldProceedWithAction()&&(this.processAction(h,e,g),b=this.addActionIdentifier(b,g),f&&(b=this.addAdditionalParams(b)),this.callRelatedListActionAndSaveHistory(a,d,b,c,h))};SearchPage.prototype.hook_shouldProceedWithAction=function(){return!0};SearchPage.prototype.addAdditionalParams=function(a){return a};
SearchPage.prototype.addActionIdentifier=function(a,d){if(a){var b=a.split("?"),c=new QueryString(1<b.length?b[1]:"",!0);c.remove(SearchRelatedList.SEARCH_ACTION_IDENTIFIER_PARAM);c.add(SearchRelatedList.SEARCH_ACTION_IDENTIFIER_PARAM,d);return b[0]+c.toString()}return a};SearchPage.prototype.createIdentifier=function(){return"_"+(new Date).getTime()};
SearchPage.prototype.checkActionCanceled=function(a,d){var b=!1,c=getElementByIdCSWithDoc(a,SearchRelatedList.SEARCH_ACTION_IDENTIFIER_PARAM+d);c&&(c=c.innerHTML,(b=c in this.actionIdStorage)&&delete this.actionIdStorage[c]);this.clearVariablesOnActionLoad();return b};SearchPage.prototype.clearVariablesOnActionLoad=function(){};SearchPage.prototype.registerOpenComponent=function(a){this.openComponent=a};
SearchPage.prototype.searchEntity=function(a,d){var b=document.getElementsByName(d);if(b)for(i=0;i<b.length;++i)b[i].checked=a};
SearchPage.prototype.checkEntitySelection=function(a,d){var b=document.getElementsByName(d);if(b){var c=[],h=0;for(i=0;i<b.length;i++)b[i].type&&("checkbox"==b[i].type&&b[i].value)&&(b[i].checked?c.push(b[i].value):h++);if(0==c.length)for(i=0;i<b.length;i++)b[i].checked=!0;if(0==c.length||0==h)b=document.createElement("input"),b.type="hidden",b.name=d,b.value=SearchRelatedList.pENTITY_ALL,a.appendChild(b);else for(i=0;i<c.length;i++)b=document.createElement("input"),b.type="hidden",b.name=d,b.value=
c[i],a.appendChild(b)}};SearchPage.prototype.submitSearchForm=function(a,d){if(d){var b=document.getElementById(d);if(b){var c=this.getKeyNumForEvent(a);if(c&&c==KEY_ENTER){if(b.onsubmit)b.onsubmit();b.submit()}}}};SearchPage.prototype.getKeyNumForEvent=function(a){if(a=getEvent(a)){var d;window.event?d=a.keyCode:a.which&&(d=a.which);return d}};SearchPage.prototype.setDlbeRef=function(a,d){d&&(this.duelingBoxRef[a]=d)};
SearchPage.prototype.toggleSearchElement=function(a,d,b,c){function h(a){if((a=e.getKeyNumForEvent(a))&&a==KEY_ESC&&b)e.closeOpenedComponent(),e.duelingBoxRef&&e.duelingBoxRef[d]&&(e.duelingBoxRef[d].resetSelection(),e.duelingBoxRef[d].quickUnwarn())}var e=this;c||(c="block");var f=document.getElementById(a);Sfdc.userAgent.isIE7&&(f.style.position="absolute");f&&(null==f.onkeyup&&(f.onkeyup=h),a!=this.openComponent&&this.closeOpenedComponent(),"none"==f.style.display?(f.style.display=c,(c=f.getElementsByTagName("select")||
f.getElementsByTagName("input"))&&0<c.length&&c[0].focus(),b&&this.registerOpenComponent(a)):f.style.display="none");this.duelingBoxRef&&this.duelingBoxRef[d]&&(this.duelingBoxRef[d].resetSelection(),this.duelingBoxRef[d].quickUnwarn())};
SearchPage.prototype.processAction=function(a,d,b,c){var h=document.getElementById(a);if(h){var e=Sfdc.select("div.pbBody",h),f=this.getControlHeadersForCover(h);if(e&&e[0]&&f){e[0].style.position="relative";for(i=0;i<f.length;++i)f[i]&&(f[i].style.position="relative");var g=this.createLoadingElement(e[0]);g.className="waitingSearchDiv waitingSearchDivOpacity";var l=this.createLoadingElement(e[0]);l.className="waitingSearchDiv";d||(d=LC.getLabel("Page_SearchResult","dhtmlLoading"));var k=[];for(i=
0;i<f.length;++i)f[i]&&(k[i]=document.createElement("div"),f[i].appendChild(k[i]),k[i].style.height=f[i].clientHeight+"px",k[i].style.width=f[i].clientWidth+"px",k[i].className="waitingHeaderSearchDiv");d=this.addLoadingDescription(d,l);var n=this.actionIdStorage,h=function(){for(i=0;i<f.length;++i)f[i]&&f[i].removeChild(k[i]);e[0].removeChild(g);e[0].removeChild(l);b&&(n[b]=b)};c||(c=document.createElement("input"),c.title=LC.getLabel("Global","cancel"),c.className="waitingCancel",c.type="button",
d.appendChild(c),c.onclick=h,c=null);this.hook_saveCancelCall(a,h)}}};SearchPage.prototype.hook_saveCancelCall=function(a,d){this.cancelCalls[a]=d};SearchPage.prototype.getControlHeadersForCover=function(a){return Sfdc.select(".pbHeader",a)};SearchPage.prototype.createLoadingElement=function(a){var d=document.createElement("div");a.appendChild(d);var b=this.getHeightForLoadingElement(a);d.style.width=this.getWidthForLoadingElement(a);d.style.height=b;return d};
SearchPage.prototype.isTagBrowser=function(a){return a.id&&0==a.id.indexOf(TagConstants.TAG_RESULTS_BODY_ID)};SearchPage.prototype.getHeightForLoadingElement=function(a){return this.isTagBrowser(a)?this.getHeightForLoadingElementTag(a):this.getHeightForLoadingElementNonTag(a)};SearchPage.prototype.getWidthForLoadingElement=function(a){return this.isTagBrowser(a)?this.getWidthForLoadingElementTag(a):this.getWidthForLoadingElementNonTag(a)};
SearchPage.prototype.getHeightForLoadingElementTag=function(a){return a.scrollHeight+-4+"px"};SearchPage.prototype.getWidthForLoadingElementTag=function(a){return a.scrollWidth+-4+"px"};SearchPage.prototype.getHeightForLoadingElementNonTag=function(a){var d=a.offsetHeight+5;Sfdc.userAgent.isIE&&(d=a.offsetHeight);return d+"px"};SearchPage.prototype.getWidthForLoadingElementNonTag=function(a){return a.offsetWidth+"px"};
SearchPage.prototype.addLoadingDescription=function(a,d){var b=document.createElement("span");d.appendChild(b);b.className="waitingSearchHolder";var c=d.offsetHeight/5;100<c&&(c=100);b.style.top=c+"px";c=document.createElement("img");b.appendChild(c);c.src=UserContext.getUrl("/img/loading.gif");c.className="waitingImage";c=document.createElement("span");b.appendChild(c);c.innerHTML=a;c.className="waitingDescription";return b};
SearchPage.prototype.savePerEntityEnum=function(a,d){var b=UserContext.getUrl("/setup/search/")+SearchRelatedList.SearchFilterInfoServletName,c={timeStamp:Date.now()};a&&(c[SearchRelatedList.ENTITY_PARAMETER]=a);c[SearchRelatedList.PER_ENTITY_VALUE]=d;Sfdc.Ajax.post(b,Sfdc.Function.blank(),{data:c})};SearchPage.prototype.clearAjaxCache=function(){};
SearchPage.prototype.saveSearchColumnSelection=function(a,d,b,c,h,e,f,g){function l(a,b){if(200==b.status)RelatedList.get(g).callRelatedListAction(c,e,f,null,null,!0);else{if(p.cancelCalls[g])p.cancelCalls[g]();p.displayErrorForSearch(LC.getLabel("Page_SearchResult","unknown_error"),g)}}function k(a){if(p.cancelCalls[g])p.cancelCalls[g]();p.displayErrorForSearch(LC.getLabel("Page_SearchResult","unknown_error"),g)}if(this.hook_shouldProceedWithAction()){h=this.createIdentifier();this.processAction(g,
LC.getLabel("Page_SearchResult","dhtmlCustomizing"),h);var n=document.getElementById(a);if(n){a="";for(var m=0;m<n.options.length;m++)a=a+n.options[m].value+",";n=UserContext.getUrl("/setup/search/")+SearchRelatedList.SearchUserLayoutServletName;m={timeStamp:Date.now()};m[SearchRelatedList.COLUMN_PARAMETER]=a;m[SearchRelatedList.ENTITY_PARAMETER]=d;m[SearchRelatedList.LIST_LAYOUT_TYPE_PARAMETER]=b;this.clearAjaxCache();Sfdc.Ajax.post(n,l,{data:m,failure:k});e=this.addActionIdentifier(e,h);var p=this}}};
SearchPage.prototype.displayErrorForSearch=function(a,d){var b=document.getElementById(SearchRelatedList.ERROR_DIV_ID_PREFIX+d);b&&(b.lastChild&&(b.lastChild.innerHTML=LC.getLabel("Global","error")+": "+a),"none"==b.style.display&&Sfdc.Effects.rollInRollOut(b,5E3))};
SearchPage.prototype.filterResults=function(a,d,b,c,h,e){if(this.hook_shouldProceedWithAction()){DatePicker.datePicker&&(DatePicker.datePicker=null);var f=this.createIdentifier();this.processAction(e,LC.getLabel("Page_SearchResult","dhtmlFiltering"),f);var g=a.split(",");a="";for(var l=[],k=0;k<g.length;k++){var n=g[k];if(""!=n){var m=document.getElementById(n);if(m&&(m=m.value)&&""!=m)a=a+"\x26"+n+"\x3d"+this.encodeForSearch(m),l.push(n)}}""!=a&&(c=c+a+"\x26"+SearchRelatedList.FILTER_FIELDS_PARAM+
"\x3d"+l.join(","),c=c+"\x26"+SearchRelatedList.ShouldNotLookUp+"\x3dtrue");c=this.addActionIdentifier(c,f);this.callRelatedListActionAndSaveHistory(d,b,c,h,e)}};SearchPage.prototype.encodeForSearch=function(a){return window.encodeURIComponent?encodeURIComponent(a):escape(a)};SearchPage.prototype.decodeForSearch=function(a){return!a?a:window.encodeURIComponent?decodeURIComponent(a):unescape(a)};
SearchPage.prototype.toggleAllFilterInfoElement=function(a){if(a=Sfdc.select("div."+a,document.body))for(var d=0;d<a.length;d++)a[d].style.display="none"};
SearchPage.prototype.callRelatedListActionAndSaveHistory=function(a,d,b,c,h){Sfdc.log("callRelatedListActionAndSaveHistory");var e=this;RelatedList.get(h).callRelatedListAction(a,b,c,null,null,!0,function(){if(e.historyEnabled){e.dhtmlHistory||(e.dhtmlHistory=new DhtmlHistory(e.historyStorage,e.historyChange,e));var f,g=e.dhtmlHistory.getCurrentLocation();if(g&&(g=e.historyStorage[g])&&g.listId!=h)f=e.historyPrefix+e.historyCounter,e.historyCounter+=1;0==e.historyCounter&&!f&&(f=e.historyPrefix+e.historyCounter,
e.historyCounter+=1);f&&(g=new SearchHistory,g.setActionUrl(a),g.setListUrl(d),g.setListQs(c),g.setListId(h),e.dhtmlHistory.add(f,g),e.saveStateToInput(f,g));g=new SearchHistory;g.setActionUrl(a);g.setListUrl(b);g.setListQs(c);g.setListId(h);e.dhtmlHistory.add(e.historyPrefix+e.historyCounter,g);e.saveStateToInput(e.historyPrefix+e.historyCounter,g);e.updateLastListState(a,b,c,h);e.historyCounter+=1}})};
SearchPage.prototype.loadStateFromInput=function(){if(Sfdc.userAgent.isFirefox&&(this.allHistoryStorage=document.getElementById(SearchRelatedList.ALL_STATES_PREFIX+this.currentSearchId))){var a=this.allHistoryStorage.value;if(a&&0!=a.length){var a=new QueryString(a),d;for(d in a.params){var b=new SearchHistory;b.readFromQs(new QueryString(SearchPage.prototype.decodeForSearch(a.get(d))));this.historyStorage[d]=b;this.historyCounter+=1}this.historyEnabled&&(0<this.historyCounter&&!this.dhtmlHistory)&&
(this.dhtmlHistory=new DhtmlHistory(this.historyStorage,this.historyChange,this))}}};SearchPage.prototype.saveStateToInput=function(a,d){if(Sfdc.userAgent.isFirefox&&this.allHistoryStorage&&d&&a){var b=new QueryString("");b.add(a,SearchPage.prototype.encodeForSearch(d.toString()));b=b.toString();this.allHistoryStorage.value+=b.substring(1,b.length)}};
SearchPage.prototype.historyChange=function(a,d){if(this.hook_shouldProceedWithAction()&&d&&this.historyStorage[d]){var b=this.historyStorage[d];if(a&&this.historyStorage[a]){if(!window.parseInt)return;var c=parseInt(a.substring(3,a.length)),h=parseInt(d.substring(3,a.length)),e=this.historyStorage[a].getListId(),f=b.getListId();if(e!=f){if(c>h){window.history.go(-1);return}if(c<h){window.history.go(1);return}}}if(a){c=this.createIdentifier();this.processAction(b.listId,null,c);var g=this.addActionIdentifier(b.getListUrl(),
c),l=this;RelatedList.get(b.getListId()).callRelatedListAction(b.getActionUrl(),g,b.getListQs(),null,null,!0,function(){l.updateLastListState(b.getActionUrl(),g,b.getListQs(),b.getListId())})}}};SearchPage.prototype.hook_updatedStateOnLoad=function(a,d){};
SearchPage.prototype.setCookieFormState=function(a,d,b){var c=getCookie(b),c=c?new QueryString(c):new QueryString("");(a=document.getElementById(SearchRelatedList.FILTER_FIELDS_PREFIX+a))&&("none"==a.style.display?c.add(d,"1"):c.add(d,"0"));d=new Date;d.setTime(d.getTime()+72E5);c=c.toString();setCookie(b,c.substring(1,c.length),d,null)};
SearchPage.prototype.onLoadUpdateState=function(){var a=document.getElementById(SearchRelatedList.SEARCH_IDENTIFIER_PARAM);if(this.currentSearchId=a?a.innerHTML:null)if(this.loadStateFromInput(),(a=document.getElementById(this.currentSearchId))&&a.value)for(var a=this.decodeForSearch(a.value).split(","),d=0,b=SearchHistory.TIMEOUT,c=0,h=a.length-1;0<=h;h--){var e=a[h];if(e&&""!=e&&document.getElementById(e)){var f=document.getElementById(this.currentSearchId+e);if(f&&f.value&&(e=new SearchHistory,
e.readFromQs(new QueryString(f.value)),e.getListUrl())){var f=this.createIdentifier(),g=this.addActionIdentifier(e.getListUrl(),f);this.hook_updatedStateOnLoad(g,e.getListId());(function(a,b,c,e){window.setTimeout(function(){RelatedList.get(e).callRelatedListAction(a,b,c,null,null,!0)},d)})(e.getActionUrl(),g,e.getListQs(),e.getListId());c++;0<c&&0==c%SearchHistory.TIMEOUT_STEP&&(b+=SearchHistory.TIMEOUT);d+=b;this.processAction(e.getListId(),null,f)}}}};
SearchPage.prototype.updateLastListState=function(a,d,b,c){if(this.currentSearchId){var h=document.getElementById(this.currentSearchId);if(h){var e=document.getElementById(this.currentSearchId+c);if(e){var f;f=h.value?this.decodeForSearch(h.value).split(","):[];for(var g="",l=0;l<f.length;l++){var k=f[l];if(k&&!(""==k||c==k))g=g+k+","}h.value=this.encodeForSearch(g+c);h=new SearchHistory;a&&h.setActionUrl(a);d&&h.setListUrl(d);b&&h.setListQs(b);c&&h.setListId(c);e.value=h.toString()}}}};
SearchPage.prototype.addCloser=function(a){(a=document.getElementById(SearchRelatedList.COMBO_BUTTON_ID+a))&&addEvent(a,"click",this.closeOpenedComponent,!1)};
SearchPage.prototype.addUnloadClearState=function(){Sfdc.userAgent.isIE&&(this.dhtmlHistory&&(this.dhtmlHistory.iframe=null,this.dhtmlHistory.parentObject=null,this.dhtmlHistory.listener=null,this.dhtmlHistory.historyStorage=null),this.duelingBoxRef=this.actionIdStorage=this.cancelCalls=this.historyStorage=this.historyPrefix=this.historyCounter=this.openComponent=this.dhtmlHistory=null)};
function SearchQueryTool(a){this.queryTypeWithEntityStorage={};this.targetEntityInputId=a;this.savedValue=this.entityInput=null}SearchQueryTool.prototype.addQueryTypeWithEntity=function(a){this.queryTypeWithEntityStorage[a]=a};
SearchQueryTool.prototype.processTargetEntity=function(a){if(this.entityInput||this.targetEntityInputId)this.entityInput||(this.entityInput=document.getElementById(this.targetEntityInputId),this.targetEntityInputId=null),a in this.queryTypeWithEntityStorage?(this.entityInput.disabled=!0,this.savedValue=this.entityInput.value,this.entityInput.value=""):(this.entityInput.disabled=!1,this.savedValue&&(this.entityInput.value=this.savedValue))};
SearchQueryTool.prototype.toggleExplanation=function(a){a=Sfdc.get(a);a.style.display="none"===a.style.display?"block":"none"};SearchQueryTool.prototype.toggleExpandCollapseLuceneQueryToString=function(a){var b=Sfdc.select("ul",Sfdc.Dom.getParent(a));a=Sfdc.select("ul",Sfdc.Dom.getParent(a))[0];if(Sfdc.Dom.isVisible(a)){Sfdc.Dom.hideByDisplay(a);for(a=0;a<b.length;a++)Sfdc.Dom.hideByDisplay(b[a])}else for(a=0;a<b.length;a++)Sfdc.Dom.show(b[a])};
SearchSettingsPage={totalCounts:{},currentCounts:{},toggleCheckboxes:function(a,b){if(a&&b){var c=document.getElementById(EditPageConstants.pEDIT_PAGE),f=document.getElementById(a);if(f&&c){for(var h=f.checked,g=0,d=0;d<c.elements.length;d++){var e=c.elements[d];if(e&&e!=f&&e.id&&"checkbox"==e.type){var k=e.id.indexOf(b);0<=k&&k+b.length==e.id.length&&(e.checked=h,g++)}}SearchSettingsPage.totalCounts[b]=g;SearchSettingsPage.currentCounts[b]=f.checked?g:0}}},updateParentCheckbox:function(a,b,c){if(a&&
b&&c){var f=document.getElementById(EditPageConstants.pEDIT_PAGE);a=document.getElementById(a);b=document.getElementById(b);f&&(a&&b)&&(SearchSettingsPage.isCountInitialized(c)?SearchSettingsPage.currentCounts[c]=a.checked?SearchSettingsPage.currentCounts[c]+1:SearchSettingsPage.currentCounts[c]-1:SearchSettingsPage.initCounts(b,c),a.checked!=b.checked&&(a.checked?SearchSettingsPage.isAllChecked(c)&&(b.checked=!0):b.checked=!1))}},getCurCount:function(a){a=SearchSettingsPage.currentCounts[a];return!a&&
0!==a?-1:a},getTotalCount:function(a){a=SearchSettingsPage.totalCounts[a];return!a&&0!==a?-1:a},isCountInitialized:function(a){return-1!=SearchSettingsPage.getCurCount(a)&&-1!=SearchSettingsPage.getTotalCount(a)},initCounts:function(a,b){for(var c=document.getElementById(EditPageConstants.pEDIT_PAGE),f=0,h=0,g=0;g<c.elements.length;g++){var d=c.elements[g];if(d&&d!=a&&d.id&&"checkbox"==d.type){var e=d.id.indexOf(b);0<=e&&e+b.length==d.id.length&&(f++,d.checked&&h++)}}SearchSettingsPage.totalCounts[b]=
f;SearchSettingsPage.currentCounts[b]=h},isAllChecked:function(a){return SearchSettingsPage.getCurCount(a)==SearchSettingsPage.getTotalCount(a)},toggleDefaultEntitySection:function(){var a=document.getElementById(SearchSettingsConstants.SIDEBAR_SEARCH_ENTITY_PICKER_ID),b=document.getElementById(SearchSettingsConstants.DEFAULT_SEARCH_ENTITY_CHECKBOX_ID);a&&b&&(b.disabled=!a.checked,SearchSettingsPage.toggleDefaultEntityPicker())},toggleDefaultEntityPicker:function(){var a=document.getElementById(SearchSettingsConstants.DEFAULT_SEARCH_ENTITY_CHECKBOX_ID),
b=document.getElementById(SearchSettingsConstants.DEFAULT_SEARCH_ENTITY_PICKLIST_ID);a&&b&&(b.disabled=!a.checked||a.disabled)},toggleCJKWarning:function(){var a=document.getElementById(SearchSettingsConstants.OPTIMIZE_SEARCH_FOR_CJK_NAME);document.getElementById(SearchSettingsConstants.OPTIMIZE_SEARCH_FOR_CJK_WARNING).style.display=a.checked?"block":"none"}};
function LookupSearchPage(){SearchPage.call(this);this.historyEnabled=!1}LookupSearchPage.prototype=new SearchPage;
function ProductSearchPage(){}ProductSearchPage.prototype=new SearchPage;
ProductSearchPage.prototype.filterResults=function(a,b,c,p,g,q){if(window.sfdcPage.hook_shouldProceedWithAction()){var h=this.createIdentifier();this.processAction(g,null,h);for(var e=document.getElementsByName(SearchRelatedList.pSEARCH),f,d=0;d<e.length;d++)if(e[d].id==SearchRelatedList.pSEARCH){f=e[d].value;break}""!=f&&(c=c+"\x26"+SearchRelatedList.pSEARCH+"\x3d"+this.encodeForSearch(f));f=!1;for(d=0;d<q;d++){var e=g+FilterSelectionElement.pCOLUMN+d,k=g+FilterSelectionElement.pOPERATOR+d,l=g+FilterSelectionElement.pFILTER_VALUE+
d,m=document.getElementById(e).value,n=document.getElementById(k).value,r=document.getElementById(l).value;""!=m&&""!=n&&(c=c+"\x26"+e+"\x3d"+this.encodeForSearch(m),c=c+"\x26"+k+"\x3d"+this.encodeForSearch(n),c=c+"\x26"+l+"\x3d"+this.encodeForSearch(r),f=!0)}f&&(c=c+"\x26"+SearchRelatedList.FILTER_FIELDS_PARAM+"\x3d1");c=this.addActionIdentifier(c,h);this.callRelatedListActionAndSaveHistory(a,b,c,p,g)}};
ProductSearchPage.prototype.evalScripts=function(a){a=a.getElementsByTagName("script");for(var b=0;b<a.length;b++)eval(a[b].innerHTML)};ProductSearchPage.prototype.handleKeyPress=function(a,b,c){if((a=this.getKeyNumForEvent(a))&&a==KEY_ENTER)if(b=document.getElementById(SearchRelatedList.FILTER_FIELDS_SAVE_PREFIX+b))c.blur(),b.click();return!1};ProductSearchPage.prototype.verifyChecked=function(a,b,c){(b=verifyChecked(a,b,c))&&a.submit();return b};
ProductSearchPage.prototype.selectionCancel=function(a){var b=document.createElement("input");b.type="hidden";b.name="cancel";b.value="Cancel";a.appendChild(b);a.submit()};ProductSearchPage.prototype.hook_postRelatedListActionUpdate=function(a){eval(" if(window."+FilterSelectionElement.ON_LOAD_CRITERIA+"){ "+FilterSelectionElement.ON_LOAD_CRITERIA+"(); }")};ProductSearchPage.prototype.isTagBrowser=function(a){return!1};
function SelectionSearchPage(){}SelectionSearchPage.prototype=new SearchPage;SelectionSearchPage.prototype.hook_shouldProceedWithAction=function(){var a=document.getElementsByName(ListView.CHECKBOX_ID);if(a){var b=0;for(i=0;i<a.length;++i)a[i].checked&&b++;return 0<b?window.confirm(LC.getLabel("List","checkboxWarning")):!0}};
SelectionSearchPage.prototype.hook_postRelatedListActionUpdate=function(a){var b=document.getElementsByName(EditPageConstants.pSAVE_NEW_URL);b&&b[0]&&(b[0].value=a,eval(" if(window."+FilterSelectionElement.ON_LOAD_CRITERIA+"){ "+FilterSelectionElement.ON_LOAD_CRITERIA+"(); }"))};SelectionSearchPage.prototype.verifyChecked=function(a,b,c){(b=verifyChecked(a,b,c))&&window.confirm(LC.getLabel("DeactivatedUserTagCleanupPage","cleanConfirmation"))&&a.submit();return b};
SelectionSearchPage.prototype.selectionCancel=function(a){window.location=UserContext.getUrl(TagConstants.TAG_SEARCH_RESULTS_URL)};SelectionSearchPage.prototype.evalScripts=function(a){a=a.getElementsByTagName("script");for(var b=0;b<a.length;b++)eval(a[b].innerHTML)};SelectionSearchPage.prototype.isTagBrowser=function(a){return!1};
function TagSearchPage(a){this.activeCancelRenameButton=this.menuButtonOpenId=null;this.csrfToken=a}TagSearchPage.prototype=new SearchPage;TagSearchPage.prototype.setTagLinkReturnsResults=function(a){this.tagLinkReturnResults=a};TagSearchPage.prototype.setMenuButtonOpen=function(a){var b=this.menuButtonOpenId;this.onLinkOver(a);this.menuButtonOpenId=a.id;if(b&&(a=document.getElementById(b)))this.onLinkOut(a)};
TagSearchPage.prototype.setMenuButtonClosed=function(){var a=this.menuButtonOpenId;this.menuButtonOpenId=null;if(a&&(a=document.getElementById(a)))this.onLinkOut(a)};
TagSearchPage.prototype.tagLinkAction=function(a,b,c,d){this.removeError();LC.getLabel("ManageTags","noneSelected");if(this.hasTagsInEdit()){d=!1;for(var e=0;e<this.currentTags.length;e++){var p=this.currentTagsIds[e];if(this.currentTags[e]==b&&p==c){this.currentTags.splice(e,1);this.currentTagsIds.splice(e,1);d=!0;break}}d||(this.currentTags.push(b),this.currentTagsIds.push(c))}else this.currentTags=[b],this.currentTagsIds=[c];this.updateCurrentTags();window.location=this.addAdditionalParams(a,!0)};
TagSearchPage.prototype.updateCurrentTags=function(a,b){a&&b&&(this.currentTags=a,this.currentTagsIds=b);var c=document.getElementById(TagConstants.CHANGE_TAGS_NAMES),d=document.getElementById(TagConstants.CHANGE_TAGS_IDS);c&&d&&(this.hasTagsInEdit()?(c.innerHTML=this.currentTags.join(", "),d.innerHTML=this.currentTagsIds.join(", ")):(c.innerHTML=LC.getLabel("ManageTags","noneSelected"),d.innerHTML=LC.getLabel("ManageTags","noneSelected")))};
TagSearchPage.prototype.swtichScopeMode=function(a){window.location=a};
TagSearchPage.prototype.inlineEditAction=function(a,b,c,d,e,p,k,m,l,h,n){if(this.hook_shouldProceedWithAction()){var g,f;g=m?"delete":(f=document.getElementById(l))?f.value:n;if(g){if(/[,\.\\\/\'"!@#\$%\^&\*\(\)\+=\{\}:;<>\|\[\]]/.exec(g))return this.displayError(LC.getLabel("ManageTags","errorOnRename"),!1,h),f&&(f.className=f.className+" "+EditElement.ERROR_CLASS),!1;if(0===TagAutoComplete.normalize(g).length)return this.displayError(LC.getLabel("TagHeader","tag_whitespace_error"),!1,h),f&&(f.className=
f.className+" "+EditElement.ERROR_CLASS),!1}else return this.displayError(LC.getLabel("ManageTags","errorMissingName"),!1,h),f&&(f.className=f.className+" "+EditElement.ERROR_CLASS),!1;if(m)this.inner_inlineEditAction(g,a,b,c,d,e,p,k,m,l,h);else{n=new QueryString("");n.add("t",(new Date).getTime());n.add(TagConstants.TAG_UPDATE_STRING,g);n.add(TagConstants.pTAG_SCOPE_MODE,k);n.add(TagConstants.TAG_ID_LIST,b);n=UserContext.getUrl(TagConstants.TAG_MERGE_CHECK)+n.toString();var s=this;Sfdc.Ajax.get(n,
function(f){(f=Util.evalAjaxServletOutput(f).tagId)&&window.confirm(LC.getLabel("ManageTags","renameWarning",g))?s.inner_inlineEditAction(g,a,b,c,d,e,p,k,m,l,h,f):f||s.inner_inlineEditAction(g,a,b,c,d,e,p,k,m,l,h)},{failure:function(a){if(s.cancelCalls[TagConstants.BROWSER_LIST_ID])s.cancelCalls[TagConstants.BROWSER_LIST_ID]();s.displayError(LC.getLabel("TagHeader","server_error_edit"))}})}}};
TagSearchPage.prototype.inner_inlineEditAction=function(a,b,c,d,e,p,k,m,l,h,n,g){h=this.createIdentifier();this.processAction(p,k,h,!0);this.activeCancelRenameButton&&(this.activeCancelRenameButton.click(),this.activeCancelRenameButton=null);d=this.addActionIdentifier(d,h);d=this.addAdditionalParams(d);g&&(d=d.replace(RegExp(c,"g"),g));var f=this;k={t:(new Date).getTime()};k[TagConstants.TAG_UPDATE_STRING]=a;k[TagConstants.IS_DELETE]=l?"1":"0";k[TagConstants.pTAG_SCOPE_MODE]=m;k[TagConstants.TAG_ID_LIST]=
c;this.csrfToken&&(k[CSRFConstants.CSRF_TOKEN]=this.csrfToken);c=UserContext.getUrl(TagConstants.EDIT_TAGS_PAGE);Sfdc.Ajax.post(c,function(c,g){var h=g.responseXML;if(!h||Sfdc.userAgent.isIE&&!h.xml)if(200==g.status)window.location.reload();else{if(f.cancelCalls[TagConstants.BROWSER_LIST_ID])f.cancelCalls[TagConstants.BROWSER_LIST_ID]();f.displayError(LC.getLabel("TagHeader","unknown_error"));return}if(h.getElementsByTagName("ok")[0])f.removeError(),f.hasTagsInEdit()?window.location=f.createInlinePageReloadUrl(d,
l,b,a):(window.location=f.createInlinePageReloadUrl(d,l,b,a),TagMenuButton.flushCache());else{var k=h.getElementsByTagName("error")[0];if(h.getElementsByTagName("reload")[0]&&k){if(RelatedList.get(p).callRelatedListAction(null,d,e,null,null,!0,function(){f.displayError(k.firstChild.nodeValue,!0)}),TagMenuButton.flushCache(),f.hasTagsInEdit()&&(h=document.getElementById(TagConstants.TAG_RESULTS_ID)))h.innerHTML=""}else{if(f.cancelCalls[TagConstants.BROWSER_LIST_ID])f.cancelCalls[TagConstants.BROWSER_LIST_ID]();
k?f.displayError(k.firstChild.nodeValue,!0):f.displayError(LC.getLabel("TagHeader","unknown_error"))}}},{data:k,failure:function(a){if(f.cancelCalls[TagConstants.BROWSER_LIST_ID])f.cancelCalls[TagConstants.BROWSER_LIST_ID]();f.displayError(LC.getLabel("TagHeader","server_error_edit"))}})};
TagSearchPage.prototype.createInlinePageReloadUrl=function(a,b,c,d){if(a){a=a.split("?");var e=new QueryString(1<a.length?a[1]:"");e.remove(SearchRelatedList.SEARCH_ACTION_IDENTIFIER_PARAM);e.remove(TagConstants.TAG_SET_HAS_RECORDS);e.remove("rId");e.add(TagConstants.TAG_VALUE_FOR_UPDATE,c);b||e.add(TagConstants.TAG_UPDATE_STRING,d);return a[0]+e.toString()}return a};TagSearchPage.prototype.inlineDeleteAction=function(a,b,c,d,e,p,k){this.inlineEditAction(a,b,c,d,e,p,k,!0,null)};
TagSearchPage.prototype.inlineRenameAction=function(a,b,c,d,e,p,k,m){var l=document.getElementById(a+MenuButtonElement.BUTTON);if(l){var h=document.getElementById(Sfdc.userAgent.isIE?TagConstants.BROWSER_TAG_TABLE_ID:TagConstants.BROWSER_LIST_ID);if(h){var n=document.createElement("div");h.style.position="relative";h.appendChild(n);n.style.height=h.clientHeight+"px";n.style.width=h.clientWidth+"px";n.className="waitingHeaderSearchDiv"}var g=document.createElement("div");g.style.position="absolute";
g.style.display="none";l.parentNode.parentNode.appendChild(g);var f=0,s=0,f=l.offsetParent.offsetTop,s=l.offsetParent.offsetLeft;g.style.top=f+20;g.style.left=s+16;var q=document.createElement("input");q.type="text";q.name="tagRename"+a;q.id=q.name;q.maxLength="100";q.size="30";q.className="tagRename";q.value=b;g.appendChild(q);g.appendChild(document.createElement("br"));var u=this;a=document.createElement("span");a.className="errorMsg";var v=document.createElement("div");v.style.display="none";v.className=
"tagRenameMenuError";v.appendChild(a);var r=document.createElement("input");r.title=LC.getLabel("Global","cancel");r.value=r.title;r.className="btn";r.type="button";r.onclick=function(){l.parentNode.parentNode.removeChild(g);h&&(h.removeChild(n),n=null);g=null;u.onLinkOut(l.parentNode)};var t=document.createElement("input");t.title=LC.getLabel("Global","save");t.value=t.title;t.className="btn";g.className="tagRenameMenu";t.type="button";t.onclick=function(){u.activeCancelRenameButton=r;u.inlineEditAction(b,
c,d,e,p,k,m,!1,q.id,v)};g.appendChild(t);g.appendChild(r);g.appendChild(v);g.style.display="block";q.onfocus=function(){setTimeout(function(){u.onLinkOver(l.parentNode)},0)};q.focus();q.onkeypress=function(a){(a=u.getKeyNumForEvent(a))&&a==KEY_ESC?r.click():a&&a==KEY_ENTER&&t.click()}}else UserContext.isAccessibleMode&&(a=window.prompt(LC.getLabel("ManageTags","accessibleRenamePrompt"),b))&&this.inlineEditAction(b,c,d,e,p,k,m,!1,null,null,a)};
TagSearchPage.prototype.clearVariablesOnActionLoad=function(){this.cancelCalls&&(this.cancelCalls={})};TagSearchPage.prototype.hook_updatedStateOnLoad=function(a,b){if(b&&b==TagConstants.BROWSER_LIST_ID){var c=a.split("?");new QueryString(1<c.length?c[1]:"")}};
TagSearchPage.prototype.addAdditionalParams=function(a,b){if(a){var c=a.split("?"),d=new QueryString(1<c.length?c[1]:"");d.add(TagConstants.TAG_ID_LIST,this.hasTagsInEdit()?this.currentTagsIds.join(","):"");var e=document.getElementById(TagConstants.SAVED_TAG_SEARCH);e&&(e.firstChild&&e.firstChild.data&&0<e.firstChild.data.length)&&d.add(TagConstants.TAG_SEARCH_FIELD,this.processTagSearchString(e.firstChild.data));e=document.getElementById(TagConstants.TAG_RESULTS_ID);!b&&e&&0<e.childNodes.length?
d.add(TagConstants.TAG_SET_HAS_RECORDS,"1"):b||d.add(TagConstants.TAG_SET_HAS_RECORDS,"0");d=d.toString();this.currentTags&&this.currentTagsIds&&(this.currentTagsIds=this.currentTags=null);return c[0]+d}this.removeError();return a};
TagSearchPage.prototype.hasTagsInEdit=function(){if(!this.currentTags||!this.currentTagsIds){var a=document.getElementById(TagConstants.CHANGE_TAGS_NAMES),b=document.getElementById(TagConstants.CHANGE_TAGS_IDS),c=LC.getLabel("ManageTags","noneSelected");b&&b.innerHTML!=c&&a&&a.innerHTML!=c?(this.currentTags=a.innerHTML.split(", "),this.currentTagsIds=b.innerHTML.split(", ")):(this.currentTags=[],this.currentTagsIds=[])}return this.currentTags&&0<this.currentTags.length&&this.currentTagsIds&&0<this.currentTagsIds.length};
TagSearchPage.prototype.getHeightForLoadingElementTag=function(a){return a.scrollHeight+-2+"px"};TagSearchPage.prototype.getWidthForLoadingElementTag=function(a){return a.scrollWidth+-2+"px"};TagSearchPage.prototype.isTagBrowser=function(a){return a.childNodes[0]&&a.childNodes[0].id==TagConstants.BROWSER_TAG_TABLE_ID};
TagSearchPage.prototype.wrapTagBrowserSearch=function(a,b,c,d,e,p,k){this.removeError();var m=document.getElementById(TagConstants.TAG_SEARCH_FIELD);if(m){c=c.split("?");var l=new QueryString(1<c.length?c[1]:""),m=this.processTagSearchString(m.value);l.add(TagConstants.TAG_SEARCH_FIELD,m);var h=document.getElementById(TagConstants.SAVED_TAG_SEARCH);h&&(null!=h.firstChild&&!k)&&(h.firstChild.data=m);k||m&&0<m.length?l.add("lsc",TagConstants.ROLODEX_SEARCH_VALUE):(!m||0==m.length)&&l.add("lsc","-1");
this.wrapDhtmlWaitingRequest(a,b,c[0]+l.toString(),d,e,p,!0)}else this.wrapDhtmlWaitingRequest(a,b,c,d,e,p,!0)};TagSearchPage.prototype.processTagSearchString=function(a){a&&(a=a.replace(/'/g,'"'),a=a.replace(/\+/g," "));return a};TagSearchPage.prototype.submitTagBrowserAction=function(a,b){if(b){var c=document.getElementById(b);if(c){var d=this.getKeyNumForEvent(a);d&&d==KEY_ENTER&&((d=document.getElementById(TagConstants.TAG_EDIT_FIELD))&&d.blur(),c.click(),c.blur())}}};
TagSearchPage.prototype.getControlHeadersForCover=function(a){if(a&&a.id==TagConstants.BROWSER_LIST_ID){var b=[];b[0]=Sfdc.select("div."+TagConstants.BROWSER_SEARCH_HEADER_CLASS,a)[0];b[1]=Sfdc.select("div.withFilter",a)[0];b[2]=Sfdc.userAgent.isIE?Sfdc.select("table.withFilter",a)[0]:Sfdc.select("div.bNext",a)[0];return b}return Sfdc.select("div.pbHeader",a)};
TagSearchPage.prototype.displayError=function(a,b,c){var d=c?c:document.getElementById(TagConstants.ERROR_DIV_ID);d&&(d.lastChild&&(d.lastChild.innerHTML=(b?"":LC.getLabel("Global","error")+": ")+a),"none"==d.style.display&&(c?d.style.display="block":Sfdc.Effects.rollIn(d)))};TagSearchPage.prototype.removeError=function(a){(a=a?a:document.getElementById(TagConstants.ERROR_DIV_ID))&&"none"!=a.style.display&&Sfdc.Effects.rollOut(a)};
TagSearchPage.prototype.fixRolodexPadding=function(){var a=document.getElementById(TagConstants.TAG_ROLODEX_ID);if(a&&Sfdc.userAgent.isFirefox){var b=a.childNodes.length-4;0<b&&(a.style.paddingRight=2*b+"px")}};TagSearchPage.prototype.notifySuccess=function(a){var b=document.getElementById(TagConstants.NOTIFY_MSG_ID);if(b&&b.parentNode){var c=b.parentNode;a?(b.innerHTML=a,"none"==c.style.display&&(c.style.display="block",setTimeout(function(){Sfdc.Effects.rollOut(c)},5E3))):c.style.display="none"}};
TagSearchPage.prototype.onLinkOver=function(a){0>a.parentNode.className.indexOf("hover")&&this.menuButtonOpenId!=a.id&&(this.existingClass=a.parentNode.className,a.parentNode.className+=" hover")};TagSearchPage.prototype.onLinkOut=function(a){this.menuButtonOpenId!=a.id&&(a.parentNode.className=this.existingClass)};
TagSearchPage.prototype.addUnloadClearState=function(){Sfdc.userAgent.isIE&&(this.dhtmlHistory&&(this.dhtmlHistory.iframe=null,this.dhtmlHistory.parentObject=null,this.dhtmlHistory.listener=null,this.dhtmlHistory.historyStorage=null),this.ignoreClose=this.menuButtonOpenId=this.currentTagIds=this.currentTags=this.tagLinkReturnResults=this.duelingBoxRef=this.actionIdStorage=this.cancelCalls=this.historyStorage=this.historyPrefix=this.historyCounter=this.openComponent=this.dhtmlHistory=null)};
function LineItemSearchPage(){}LineItemSearchPage.prototype=new ProductSearchPage;
LineItemSearchPage.prototype.filterResults=function(d,b,a,c,e,f){if(window.sfdcPage.hook_shouldProceedWithAction()){c=document.getElementsByName(SearchRelatedList.pSEARCH);b=d="";for(a=0;a<c.length;a++)if(c[a].id==SearchRelatedList.pSEARCH){d=c[a].value;break}if(null!==d&&(a=d.replace(/[\"*()?]/g,""),a=a.replace(/^\s\s*/,"").replace(/\s\s*$/,""),0<d.length&&2>a.length)){alert(LC.getLabel("Page_Product2_Overview","invalid_search_term"));return}for(a=0;a<f;a++){var g=e+FilterSelectionElement.pOPERATOR+
a,h=e+FilterSelectionElement.pFILTER_VALUE+a;c=document.getElementById(e+FilterSelectionElement.pCOLUMN+a).value;g=document.getElementById(g).value;h=document.getElementById(h).value;""!=c&&""!=g&&(b=b+"\n"+this.encodeForSearch(c),b=b+"\t"+this.encodeForSearch(g),b=b+"\t"+h)}this.getNewList(d,b,f)}};
LineItemSearchPage.prototype.getNewList=function(d,b,a,c){var e=ListViewport.instances.lineItemView;!0!==c&&e.grid.getSelectionModel().clearAllSelections();c={};c.search=d;c.filterQuery=b;if(""==b)for(d=0;d<a;d++){b="PricebookEntry"+FilterSelectionElement.pOPERATOR+d;var f="PricebookEntry"+FilterSelectionElement.pFILTER_VALUE+d;document.getElementById("PricebookEntry"+FilterSelectionElement.pCOLUMN+d).selectedIndex=0;document.getElementById(b).selectedIndex=0;document.getElementById(f).value=""}e.getListData(c)};
LineItemSearchPage.prototype.hook_shouldProceedWithAction=function(){return 0<Paginator.instances.lineItemView_paginator.selectCount?window.confirm(LC.getLabel("List","checkboxWarning")):!0};
LineItemSearchPage.prototype.verifyChecked=function(d,b,a,c){b=ListViewport.instances.lineItemView.grid.selModel.selections.items;if(0==b.length)alert(a);else if(50<b.length)alert(c);else{a=[];for(i=0;i<b.length;i++)c=document.createElement("input"),c.setAttribute("name","ids"),c.setAttribute("id",b[i].id),c.setAttribute("value",b[i].id),a[i]=c;d.innerhtml=""+a;d.submit()}};
function ProductSelectionSearchPage(){}ProductSelectionSearchPage.prototype=new ProductSearchPage;ProductSelectionSearchPage.prototype.hook_shouldProceedWithAction=function(){var b=document.getElementsByName(ListView.CHECKBOX_ID);if(b){var a=0;for(i=0;i<b.length;++i)b[i].checked&&a++;return 0<a?window.confirm(LC.getLabel("List","checkboxWarning")):!0}};
ProductSelectionSearchPage.prototype.hook_postRelatedListActionUpdate=function(b){var a=document.getElementsByName(EditPageConstants.pSAVE_NEW_URL);a&&a[0]&&(a[0].value=b,eval(" if(window."+FilterSelectionElement.ON_LOAD_CRITERIA+"){ "+FilterSelectionElement.ON_LOAD_CRITERIA+"(); }"))};

//# sourceMappingURL=/javascript/1415910311000/sfdc/source/SearchOnly.js.map
