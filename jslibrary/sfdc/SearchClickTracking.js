/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
function SearchClickTracking(){}var searchResultClick=new SearchClickTracking;
SearchClickTracking.prototype.mousedown=function(a,b){var c=getEvent(b);if(void 0!==c.button&&(0===c.button||1===c.button))if(c=a.getAttribute("href",2),-1===QueryString.getURI(c).indexOf(SearchClickLoggingUtil.SEARCH_CLICK_LOGGING_SERVLET_PATH)){a.getAttribute("data-seclkp");var f=a.getAttribute("data-seclki"),t=a.getAttribute("data-seclkr"),u=a.getAttribute("data-seclkh"),d=a.getAttribute("data-seclke");if("true"!==a.getAttribute("data-seclkd")){if(Sfdc.resolve("Sfdc.servicedeskview")){var e=Sfdc.resolve("Sfdc.support.servicedesk.FooterWidgetWindowHelper",
top),e=e?e.getMasterWindow():top.Sfdc.support.servicedesk.getMasterWindow();if(e=Sfdc.resolve("SfdcApp.Search.ConsoleSearchLogSwitcher",e)){var g=this.getClickedRecordId(f,d,c);g&&e.switchOnForObject(g)}}var e=new QueryString,h,k,l,m,n,p,q,r,s;a.hasAttribute("data-seclkqid")?(g=a.getAttribute("data-seclkqid"),h=a.getAttribute("data-seclkc"),k=-1,l=a.getAttribute("data-seclkpn"),m=a.getAttribute("data-seclkrpp"),n=a.getAttribute("data-seclkf"),p="",q=-1,r="false",s=""):(g=this.clickResults.queryGuid,
h=this.clickResults.counts[d],k=this.clickResults.bucketRanks[d],l=this.clickResults.pageNums[d],m=this.clickResults.numResultsPerPage[d],n=this.clickResults.filters[d],p=this.clickResults.sorts[d],q=this.clickResults.numResultsForEntityBeforeDb[d],r=this.clickResults.isTagging[d],s=this.clickResults.resultLists[d]);e=SearchClickLoggingUtil.addSearchResultClickLoggingParams(e,{recordId:f,queryGuid:g,totalResultsForEntity:h,rank:t,bucketRank:k,idHash:u,resultList:s,numResultsForEntityBeforeDb:q,pageNum:l,
numResultsPerPage:m,filter:n,sort:p,isTagging:r,entityName:d});Sfdc.resolve("Sfdc.servicedeskview")||top.isDesktopPage||!SearchClickLoggingUtil.isRedirectableUrl(c)?(this.ajaxStatus=null,Sfdc.Ajax.get(SearchClickLoggingUtil.getClickLoggingServletUrl(e,null),function(a,b){b&&(this.searchResultClick.ajaxStatus=b.status)})):a.href=SearchClickLoggingUtil.getClickLoggingServletUrl(e,c)}}};
SearchClickTracking.prototype.getClickedRecordId=function(a,b,c){if("KnowledgeArticleVersion"===b){var f;c&&(a=Sfdc.resolve("Sfdc.support.servicedesk",top),(c=a.extractSrcUpUrl(c))&&0!==c.indexOf("javascript")&&(f=a.getEntityIdFromUrl(c)));return f}return a};
SearchClickTracking.prototype.setRelatedListQueryData=function(a){this.clickResults||(this.clickResults={},this.clickResults.totalCount=0,this.clickResults.counts={},this.clickResults.bucketRanks={},this.clickResults.pageNums={},this.clickResults.numResultsPerPage={},this.clickResults.filters={},this.clickResults.sorts={},this.clickResults.numResultsForEntityBeforeDb={},this.clickResults.isTagging={},this.clickResults.resultLists={});this.clickResults.queryGuid=a.queryGuid;var b=this.clickResults.counts.name;
0<b&&(this.clickResults.totalCount-=b);this.clickResults.totalCount+=a.count;b=a.name;this.clickResults.counts[b]=a.count;this.clickResults.pageNums[b]=a.pageNum;this.clickResults.numResultsPerPage[b]=a.numResultsPerPage;this.clickResults.filters[b]=a.filter;this.clickResults.sorts[b]=a.sort;this.clickResults.numResultsForEntityBeforeDb[b]=a.numResultsForEntityBeforeDb;this.clickResults.isTagging[b]=a.isTagging;this.clickResults.resultLists[b]=a.resultList;if(!this.clickResults.bucketRanks[b]){a=
0;for(var c in this.clickResults.bucketRanks)if(this.clickResults.bucketRanks.hasOwnProperty(c)){var f=this.clickResults.bucketRanks[c];f>a&&(a=f)}this.clickResults.bucketRanks[b]=a+1}};

//# sourceMappingURL=/javascript/1460102753000/sfdc/source/SearchClickTracking.js.map
