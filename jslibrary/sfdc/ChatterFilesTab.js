/*
 * This code is for Internal Salesforce use only, and subject to change without notice.
 * Customers shouldn't reference this file in any web pages.
 */
Perf.mark("Sfdc.ChatterFiles:Start");function ChatterFilePreviewPoller(c){function e(){d++;chatter.getToolbox().get({url:"/chatterfile/"+c,success:function(a,b){Sfdc.Dom.updateHTML(Sfdc.get("centerContent"),b.html,!0)}})}var a=this,d=0;this.startPoll=function(){a.timeoutid=setTimeout(e,1E3*Math.pow(2,d))}}var chatterFilePreview=function(){var c;return{getPreviewPoller:function(e){c||(c=new ChatterFilePreviewPoller(e));return c}}}();
(function(){function c(a,d,c,b){b=b?LC.getLabel("ChatterFilesTabPage","deleteExternalFileConfirmation",b):LC.getLabel("ChatterFilesTabPage","deleteConfirmation");return confirm(b)?(chatter.getToolbox().post({url:"/chatterfile/"+a+";delete",id:a,success:function(){d?d.call(this):navigateToUrl(UserContext.getUrl(e),null,Desktop.CLOSETAB_ACTION)},failure:function(a,b){c&&c.call(this,a,b)}}),!0):!1}var e="/_ui/core/chatter/files/FileTabPage";Sfdc.apply(Sfdc.ChatterFiles,{deleteFile:function(a,d,h){var b=
document.body||document.documentElement,f=new LoadingScreen(b,LC.getLabel("ChatterFileDetailPage","deleteFileMsg")),k=d?d:UserContext.getUrl(e),g=function(){navigateToUrl(k,null,"closeTab")};c(a,g,function(a,b){f.hide();g()},h)&&(f.show(),a=Sfdc.get(".waitingSearchDiv",b),Sfdc.Dom.addClass(a,"progressOverlay"),b=Sfdc.get(".waitingHolder",b),Sfdc.Dom.addClass(b,"progressMessage"))},showEntityNotViewableDialog:function(a){a=this.ENTITY_NOT_VIEWABLE_COMMAND_URL+a;chatter.getToolbox().get({url:a,success:function(a,
c){Dialogs.createDialog({id:Dialogs.getNextId(),title:LC.getLabel("ChatterFileSharing","sharedEntityNotViewableOverlayTitle"),message:c.html,backgroundClass:Dialogs.types.WARN.backgroundClass,contentClass:Dialogs.types.WARN.contentClass,iconClass:Dialogs.types.WARN.iconClass,iconAlt:Dialogs.types.WARN.getIconAlt(),actions:[null],actionLabels:[LC.getLabel("Buttons","ok")]},!0).show()}})},setTitleWidthForContentFile:function(){var a=Sfdc.select(".chatterBreadcrumbs")[0];a&&Sfdc.Dom.setStyles(a,{width:"600px"});
Sfdc.userAgent.isIE&&(a=Sfdc.select(".fileTailNode")[0])&&Sfdc.Dom.setStyles(a,{width:"600px"})}})})();Perf.endMark("Sfdc.ChatterFiles:Start");
Perf.mark("Chatter.FileBrowse:Start");Sfdc.ns("Chatter.FileBrowse");
Chatter.FileBrowse=function(){function n(b,c,l,d,e,h,a,k,r,q,n,p,s){Sfdc.ChatterFileUploader.config&&(Sfdc.ChatterFileUploader.config.fldr=null);(f=Sfdc.get(".selectedLinkItem",Sfdc.get("chatterFileBrowsePanel")))||(f=Sfdc.get(".selectedSubLinkItem",Sfdc.get("chatterFileBrowsePanel")));var t=k?!0:!1;"undefined"!==typeof Sfdc.ChatterFileUploader.isFileSync&&(Sfdc.ChatterFileUploader.isFileSync=l===Chatter.FileBrowse.SELECTION_TYPES.FILESYNC);"undefined"!==typeof Sfdc.ChatterFileUploader.setVisible&&
Sfdc.ChatterFileUploader.setVisible(a);if(b){f&&(Sfdc.Dom.hasClass(f,"selectedLinkItem")?Sfdc.Dom.removeClass(f,"selectedLinkItem"):Sfdc.Dom.removeClass(f,"selectedSubLinkItem"),a=Sfdc.get(".hyperlinkTextSpan",f),f.setAttribute("title",a.textContent||a.innerText));a=Sfdc.get(b);Sfdc.Dom.hasClass(a,"linkItem")?Sfdc.Dom.addClass(a,"selectedLinkItem"):Sfdc.Dom.addClass(a,"selectedSubLinkItem");var g=Sfdc.get(".hyperlinkTextSpan",a);a.setAttribute("title",(g.textContent||g.innerText)+" - "+LC.getLabel("ChatterFilesTabPage",
"selected"));f=b}(b=Sfdc.get("browseLabelPanel"))&&Sfdc.Dom.show(b);(b=Sfdc.get("folderNavigationMutton"))&&Sfdc.Dom.hideByDisplay(b);a=Sfdc.get("browseLabel");var g=Sfdc.get("browseDesc"),m=!!Sfdc.get("sfsContentWrapper");b="other";switch(l){case Chatter.FileBrowse.SELECTION_TYPES.USER:b="my";!0===h?Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","ownedByMeDescWithFileSync")):Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","allFilesYouOwn"));!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.ALL_GROUPS:Sfdc.Dom.setText(a,
LC.getLabel("ChatterFilesTabPage","filesInAllGroups"));!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.ALL_LIBRARIES:Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","filesInAllLibraries"));!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.GROUP:Sfdc.Dom.setText(a,d);!1===m&&(g.innerHTML="\x3ca class\x3d'browseLink' href\x3d 'javascript:;' onclick\x3d'"+('navigateToUrl(UserContext.getUrl("/_ui/core/chatter/groups/GroupProfilePage?g\x3d'+
c+'"))')+"' alt\x3d'"+escapeHTML(d)+"'\x3e"+LC.getLabel("ChatterFilesTabPage","goto")+" "+LC.getLabel("ChatterFilesTabPage","groupPage")+"\x26nbsp; \x26raquo; \x3c/a\x3e");break;case Chatter.FileBrowse.SELECTION_TYPES.WORKSPACE:Sfdc.Dom.setText(a,d);!1===m&&(g.innerHTML="\x3ca class\x3d'browseLink' href\x3d'javascript:;'  onclick\x3d'"+('navigateToUrl(UserContext.getUrl("/sfc/#workspaceView?selectedWorkspaceId\x3d'+c+'"))')+"' alt\x3d'"+escapeHTML(d)+"'\x3e"+LC.getLabel("ChatterFilesTabPage","goto")+
" "+LC.getLabel("ChatterFilesTabPage","workspaceDetails")+"\x26nbsp; \x26raquo; \x3c/a\x3e");break;case Chatter.FileBrowse.SELECTION_TYPES.PERSONAL_WORKSPACE:Sfdc.Dom.setText(a,d);!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.RECENT:b="recent";!0===h?Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","recentFilesDescWithFileSync")):Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","recentFilesDesc"));!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.SHARED_WITH_ME:b=
"shared";!0===h?Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","sharedWithMeWithFileSync")):!0===e?Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","filesSharedWithMeDesc")):Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","filesSharedWithMeDescForExternalUser"));!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.ALL_USER_FILES:!0===e?Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","filesAllUserFilesDesc")):Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage",
"filesAllUserFilesDescForExternalUser"));break;case Chatter.FileBrowse.SELECTION_TYPES.FOLLOWED_FILES_ONLY:b="follow";Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","filesIFollowDesc"));!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.ORG:b="all";!0===h?Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","allFilesDescWithFileSync")):Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","allFilesDesc"));!1===m&&Sfdc.Dom.setText(g,"");break;case Chatter.FileBrowse.SELECTION_TYPES.FILESYNC:Sfdc.Dom.setText(a,
LC.getLabel("ChatterFilesTabPage","myChatterboxFilesDesc"));b="fs";!1===m&&Sfdc.Dom.setText(g,"");break;default:r?Sfdc.Dom.setText(a,r):Sfdc.Dom.setText(a,LC.getLabel("ChatterFilesTabPage","allFilesDesc")),!1===m&&Sfdc.Dom.setText(g,"")}(e=Sfdc.get("browseLabel"))&&e.setAttribute("data-contentsfdc-filter",b);l=k?k:u[l];k=window.location.href;k=-1!=k.indexOf("\x26cc\x3d")||-1!=k.indexOf("?cc\x3d");Chatter.Files.ContentListViewport.INSTANCE.load(c,l,d,h,q,n,t,p,s,k)}var f=null,u={recent_viewed:"ContentVersionRecentlyViewedFileSearch",
personal_workspace:"ContentVersionPersonalWorkspaceFileSearch",shared_with_me:"ContentVersionSharedWithMeFileSearch",all_groups:"ContentVersionMyGroupsFileSearch",all_libraries:"ContentVersionMyWorkspacesFileSearch",all_user_files:"ContentVersionAllUserFileSearch",followed_files_only:"ContentVersionFollowedFileSearch",filesync:"ContentVersionFileSyncFileSearch",user:"ContentVersionUserFileSearch",group:"ContentVersionGroupFileSearch",workspace:"ContentVersionWorkspaceFileSearch",org:"ContentVersionOrganizationFileSearch"},
p=null;return{isFBClicked:!1,SELECTION_TYPES:{ORG:"org",SHARED_WITH_ME:"shared_with_me",ALL_USER_FILES:"all_user_files",FOLLOWED_FILES_ONLY:"followed_files_only",RECENT:"recent_viewed",USER:"user",ALL_GROUPS:"all_groups",GROUP:"group",ALL_LIBRARIES:"all_libraries",WORKSPACE:"workspace",PERSONAL_WORKSPACE:"personal_workspace",FILESYNC:"filesync"},clickHandler:function(b,c,l,d,e,h,a,k){p=null;n(b,c,l,d,e,h,a,k)},customFilterClickHandler:function(b,c,l,d,e,h,a,k,f,q){p={refresh:function(f){n(b,null,
null,l,!1,e,h,c,d,a,k,f,q)}};n(b,null,null,l,!1,e,h,c,d,a,k,f,q)},currentCustomFilter:function(){return p},toggleMoreLink:function(b,c,l){Sfdc.Dom.hideByDisplay(Sfdc.get(b).parentNode);b=c+"More";c=Sfdc.get(c);var d=Sfdc.get(b);if(c&&d){for(var e=d.childNodes,h=b=0;h<e.length;h++){var a=e[h].cloneNode(!0);c.appendChild(a);a.tagName&&"li"==a.tagName.toLowerCase()&&b++}Sfdc.Dom.removeChild(d);d=!!Sfdc.get("sfsContentWrapper");e=!!Sfdc.get("chatterAllMyFiles");d?(Sfdc.Dom.addClass(Sfdc.get("chatterFilesInScrollPanel"),
"autoDiv"),e?(Sfdc.Dom.addClass(Sfdc.get("chatterFilesInScrollPanel"),"autoDivWithMyFilesFilter"),Sfdc.userAgent.isChrome&&Sfdc.Dom.setStyle(Sfdc.get("chatterFilesInScrollPanel"),"height","365px")):Sfdc.userAgent.isChrome&&Sfdc.Dom.setStyle(Sfdc.get("chatterFilesInScrollPanel"),"height","404px")):b>ChatterFilesConstants.MAX_VISIBLE_COUNT&&(Sfdc.Dom.addClass(c,"autoUl"),!0===l?(Sfdc.Dom.addClass(c,"autoUlHeightWithContent"),e&&Sfdc.Dom.addClass(c,"autoUlHeightWithContentMyFileFilter")):(Sfdc.Dom.addClass(c,
"autoUlHeightWithoutContent"),e&&Sfdc.Dom.addClass(c,"autoUlHeightWithoutContentMyFileFilter")));f&&f.focus()}}}}();Perf.endMark("Chatter.FileBrowse:Start");
Ext.ns("Ninja.Flex");
Ninja.Flex.FlexCoverflow={getApp:function(){return getFlexRoot("Coverflow")},showPreview:function(c){if(Sfdc.ChatterFiles||"undefined"==typeof Shepherd){var b=ChatterFilesConstants.OVERLAY_ID,g=ChatterFilesConstants.DOC_VIEWER_OVERLAY_CLASS,h=ChatterFilesConstants.DOC_VIEWER_CONTAINER_PARENT_CLASS,e=ChatterFilesConstants.DOC_VIEWER_CONTAINER_PARENT_CLASS,f=ChatterFilesConstants.CONTAINER_ID,k=ChatterFilesConstants.CONTAINER_ID,d=Sfdc.Window.getWindowWidth(),a=Sfdc.Window.getWindowHeight(),d=d-40,
a=a-20-48;width=730<d?d:730;height=480<a?a:480;null===Ext.get(b)?(a=new AccessiblePreviewContentDialog(b),a.extraClass=g,a.content="\x3cdiv id\x3d'"+e+"' class\x3d'"+h+"'\x3e\x3cdiv id\x3d'"+f+"' class\x3d'"+k+"'\x3e\x3c/div\x3e\x3c/div\x3e",a.created=!0,a.register(),Ext.get(e).setHeight(height),Ext.get(b).setWidth(width),a.show(),Ext.get(b).setStyle("left","10px")):(a=OverlayDialogElement.getDialog(b),a.setTitle(""),Ext.get(e).setHeight(height),Ext.get(b).setWidth(width),Ext.getBody().setStyle("overflow",
"auto"),a.show());b=chatter&&chatter.getToolbox()?chatter.getToolbox().sitePrefix():"";insertFlexComponent(Ninja.Flex.ContentStaticResourcesBase+"/flex/DocViewer","shepherd_prefix\x3d"+b+Ninja.Flex.ShepherdController+"\x26v\x3d"+c+"\x26mode\x3dbubble\x26in_tests\x3dfalse","100%","100%","#f3f3f3",f,"renditionLarge",!1,{adobeFlashVersionLbl:LC.getLabel("ContentFlashPlayer","adobeFlashVersion"),downloadAdobeLbl:LC.getLabel("ContentFlashPlayer","downloadAdobe"),downloadAdobeLinkLbl:LC.getLabel("ContentFlashPlayer",
"downloadAdobeLink"),closeDialogLbl:LC.getLabel("ContentFlashPlayer","closeDialog")})}else Shepherd.run("document","viewRenditionLarge",{selectedVersionId:c})},showDetails:function(c){Sfdc.ChatterFiles||"undefined"==typeof Shepherd?navigateToUrl(UserContext.getUrl("/"+c)):Shepherd.run("document","view",{selectedDocumentId:c})}};Ninja.Flex.ContentStaticResourcesBase="/sfc";Ninja.Flex.ShepherdController="/sfc/servlet.shepherd";

//# sourceMappingURL=/javascript/1410512610000/sfdc/source/ChatterFilesTab.js.map
