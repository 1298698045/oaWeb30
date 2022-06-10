/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
function LineItemListViewport(a,b,c,d,e){LineItemListViewport.superclass.constructor.call(this,a,b,c,void 0,!1,25);this.url=UserContext.getUrl(e);this.addTo=d;this.filterQuery=this.search="";this.filterInfoId="lineItemView_filterInfo"}
Ext.extend(LineItemListViewport,ListViewport,{delayResize:!1,shouldDelayResize:function(){return this.delayResize},setResizeDelay:function(a){this.delayResize=a},getListDataPost:function(a){var b=LineItemListViewport.superclass.getListDataPost.call(this,a);b.addTo=this.addTo;if((""===a.sort||void 0===a.sort)&&null!==this.grid&&null!==this.grid.view){var c=this.grid.view.sortState;null!==c&&void 0!==c&&(b.sort="DESC"===c.dir?"-"+c.field:c.field)}void 0!==a.search&&(this.search=a.search);void 0!==a.filterQuery&&
(this.filterQuery=a.filterQuery);b.search=this.search;b.filterQuery=this.filterQuery;return b},refreshList:function(){this.getListData({page:this.paginator.currentPage,rolodexIndex:this.rolodexIndex})},xhrHandler:function(a){this.waitingForXhr=!1;var b;try{b=Util.evalAjaxServletOutput(a)}catch(c){window.location.reload()}a=Sfdc.get("lineItemView_searchHeader").firstChild.firstChild;var d=Sfdc.get(this.filterInfoId);if(b.columnFilterInfo){var e=document.createElement("tr");e.setAttribute("id",this.filterInfoId);
e.innerHTML=b.columnFilterInfo;d&&a.removeChild(d);a.appendChild(e)}else d&&a.removeChild(d);this.updatePage(b)},getResizeHeight:function(){var a=0;Sfdc.select("div.x-grid3-row",this.grid.el.dom).length?a=20*Math.min(25,this.paginator.recordsPerPage)+120:(a=160,Sfdc.userAgent.isIE7&&(a+=40));var b=LineItemListViewport.superclass.getResizeHeight.call(this);return Math.max(b,a)},getSelectionModel:function(){return new Sfdc.grid.CheckboxSelectionModel({menuDisabled:!0,width:22,maxSelections:50,onBeforeRowSelect:function(a,
b,c,d){!Ext.isIE6&&!Ext.isIE7&&Sfdc.get("search").blur();return Sfdc.grid.CheckboxSelectionModel.prototype.onBeforeRowSelect.call(a,b,c,d)}})}});

//# sourceMappingURL=/javascript/1437385424000/sfdc/source/LineItem.js.map
