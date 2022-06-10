/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
function ChatterGroupListViewport(n,p,h,q,k,l,r){function m(a){if(Sfdc.Dom.isElement(a)){var b=["selected","cxselected"],c=Sfdc.get(k),d=Sfdc.Dom.getAttribute(c,"selectedIndicator");if(c=Sfdc.select("li.selected",c)[0])if(Sfdc.Dom.removeClass(c,b),(c=Sfdc.select("a.trigger",c)[0])&&c.title)c.title=c.title.replace(d,"");c=Sfdc.Dom.getParent(a,"li");Sfdc.Dom.addClass(c,b);a.title+=d;Sfdc.Dom.setText(Sfdc.get(".topNav .title"),Sfdc.Dom.getAttribute(a,"deschead"))}}function s(a){d&&(a=Sfdc.Event.getSrcElement(a),
g=Sfdc.Dom.getAttribute(a,"filter"),m(a),d.sortBy="",d.searchTerm="",d.currentPage=1,d.additionalParams.groupListFilterType=g,d.provide());if(e&&e.length)for(a=0;a<e.length;a++){var b=e[a];b.setSearchTerm("");b.update()}}function t(a,b){if(d&&b)if(1!=b.searchTerm.length){var c=chatter.getChatterTab();c.isOnChatterTab()&&c.handleListViewSearch("groups");0>Sfdc.Array.indexOf(u,g)&&(d.additionalParams.groupListFilterType=l,m(Sfdc.select(Sfdc.String.format("li.ftr_{0} a.trigger",[l]),Sfdc.get(k))[0]));
d.sortBy=""}else b.cancel=!0}function v(a,b){f.labels.listView.emptyMessage=b&&b.data&&b.data.emptyMessageElement||LC.getLabel("List","none")}Perf.mark("Sfdc.ChatterGroups:Start");var f,d,u=["my","all","my_archived"],g,e;Sfdc.onload(function(){var a=Sfdc.String.format('\x3csfdc:listView class\x3d"GroupListView zen-listViewMedium zen-listViewFixed" contentClass\x3d"{contentClass}"\x3e\x3cdata:provider type\x3d"ListServlet" pageSize\x3d"{pageSize}" resourceUri\x3d"{resourceUri}" viewType\x3d"{viewType}" additionalParams\x3d"{additionalParams}" autoProvide\x3d"false"\x3e\x3c/data:provider\x3e\x3cfacet:header\x3e\x3c/facet:header\x3e\x3cfacet:navigation\x3e\x3cui:searchbox labelText\x3d"" labelClass\x3d"zen-assistiveText" placeholder\x3d"{searchBoxPlaceholder}" title\x3d"{searchBoxTitle}"\x3e\x3c/ui:searchbox\x3e\x3c/facet:navigation\x3e\x3cfacet:footer\x3e\x3cui:pagerPageInfo\x3e\x3c/ui:pagerPageInfo\x3e\x3cui:pagerNextPrevious\x3e\x3c/ui:pagerNextPrevious\x3e\x3cui:pagerJumpToPage\x3e\x3c/ui:pagerJumpToPage\x3e\x3c/facet:footer\x3e\x3c/sfdc:listView\x3e',
{contentClass:r,additionalParams:Sfdc.String.escapeToHtml(Sfdc.JSON.stringify({groupListFilterType:g=q})),pageSize:h&&h.rowsPerPage||25,resourceUri:UserContext.getUrl("/_ui/core/chatter/groups/ChatterGroupsListServlet"),viewType:p,searchBoxPlaceholder:LC.getLabel("page_ChatterGroups","quickfindDefault"),searchBoxTitle:LC.getLabel("Filter","quickfindInputLabel")}),b=Sfdc.get(n+"_listBody");Sfdc.Dom.updateHTML(b,a);SfdcCmp.init(b);f=SfdcCmp.findInstance(b,SfdcCmp.Sfdc.ListView);f.attach("onbeforesearch",
t);f.attach("onbeforeupdate",v);d=f.getProvider();d.setPayload(h);e=SfdcCmp.findInstances(b,SfdcCmp.Ui.ISearchable,!0);a=Sfdc.get(k);a=Sfdc.select("li\x3e.cxgrouplistfilterheader\x3ea.trigger",a);for(b=0;b<a.length;b++)Sfdc.on(a[b],"click",s);Perf.endMark("Sfdc.ChatterGroups:Start")})};

//# sourceMappingURL=/javascript/1457082225000/sfdc/source/ChatterGroups.js.map
