﻿<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TopNavNoMain.ascx.cs" Inherits="WebClient.UIControls.TopNavNoMain" %>
<table  class="phHeader brandZeronaryBgr phHeaderCustomLogo" border="0" cellpadding="0" cellspacing="0" id="phHeader"><tr><td class="left"><a href="/home/home.aspx" id="phHeaderLogoImage"><img src="/img/support/servicedesk/miniLogo10.png" alt="主页" width="104" height="25" class="miniHeaderLogo" title="主页" /></a><img src="/s.gif" alt="" width="1" height="1" class="spacer" title="" /></td><td class="searchCell"><!--<form  action="/_ui/search/ui/UnifiedSearchResults" id="phSearchForm" method="GET" name="sbsearch" onsubmit="if (window.ffInAlert) { return false; }" ><input type="hidden" name="searchType" id="searchType" value="2" /><input type="hidden" name="sen" id="sen0" value="00Q" /><input type="hidden" name="sen" id="sen1" value="001" /><input type="hidden" name="sen" id="sen2" value="003" /><div class="headerSearchContainer" id="phSearchContainer"><div class="headerSearchLeftRoundedCorner"><div class="searchBoxClearContainer"><input  autocomplete="off" id="phSearchInput" maxlength="100" name="str" placeholder="搜索..." size="20" title="搜索..." type="text" value="" /><a class="headerSearchClearButton" href="javascript: void(0);" id="phSearchClearButton" name="phSearchClearButton" style="visibility:hidden" title="清除搜索词"></a></div><div class="headerSearchRightRoundedCorner" id="searchButtonContainer"><input value=" 搜索 "  id="phSearchButton" type="button" /></div></div></div></form>--></td><td class="right vtop"><div class="multiforce"><div class="messages"><div class="msgContent"><span class="hasButtons pageMsg highImportance"><!--<span class="normalImportance subMsg"><a href="/StoreDoor" class="actionLink">剩余 23 天</a></span><span class="highImportance subMsg"><input value=" 立即订购！ "  class="actionBtn" name="立即订购！" onclick="navigateToUrl('/StoreDoor',null,'立即订购！');" title="立即订购！" type="button" /></span>--></span></div></div><div class="navLinks"><div class="linkElements"><div class="menuButton menuButtonRounded" id="userNav" title="<%=ScreenName%> 的用户菜单"><div class="menuButtonButton" id="userNavButton"><span  class="menuButtonLabel" id="userNavLabel" tabindex="0"><%=ScreenName%></span><div class="userNav-buttonArrow mbrButtonArrow" id="userNav-arrow"></div><div class="userNavButton-btm mbrButton-btm mbrButton-rc"></div></div><div class="menuButtonMenu" id="userNavMenu"><div class="userNavMenu-tr mbrMenu-tr mbrMenu-rc"></div><div class="userNavMenu-tl mbrMenu-tl mbrMenu-rc"></div><div class="mbrMenuItems" id="userNav-menuItems"><a href="/_ui/core/userprofile/UserProfilePage" class="menuButtonMenuLink firstMenuItem" title="我的简档">我的简档</a><a href="/ui/setup/Setup?setupid=PersonalSetup" class="menuButtonMenuLink" title="我的设置">我的设置</a><!--<a href="javascript:openPopupFocus('')" class="menuButtonMenuLink debugLogLink" title="开发人员控制台 （新窗口）">开发人员控制台</a>--><a href="/secur/logout.aspx" class="menuButtonMenuLink" title="退出">退出</a></div><div class="userNavMenu-br mbrMenu-br mbrMenu-rc"></div><div class="userNavMenu-bc mbrMenu-bc"></div><div class="userNavMenu-bl mbrMenu-bl mbrMenu-rc"></div></div></div><script>               new MenuButtonRounded('userNav', false, 16);</script><a href="/apps/setup/Homepage.aspx?setupid=ForceCom" id="setupLink" title="设置">设置</a><a href="javascript:openPopupFocusEscapePounds('','Help%27, 1024, 768, %27width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=no%27, false, false);" class="brandZeronaryFgr" title="帮助和培训 （新窗口）">帮助和培训</a></div></div><div id="toolbar"><!-- TabSet drop down -->
<div class="menuButton menuButtonRounded appSwitcher" id="tsid" title="应用程序菜单"><div class="menuButtonButton" id="tsidButton"><span  class="menuButtonLabel" id="tsidLabel" tabindex="0"><%=CurrentAppName%></span><div class="tsid-buttonArrow mbrButtonArrow" id="tsid-arrow"></div><div class="tsidButton-btm mbrButton-btm mbrButton-rc"></div></div><div class="menuButtonMenu" id="tsidMenu"><div class="tsidMenu-tr mbrMenu-tr mbrMenu-rc"></div><div class="tsidMenu-tl mbrMenu-tl mbrMenu-rc"></div><div class="mbrMenuItems" id="tsid-menuItems"><%=AppItems%></div><div class="tsidMenu-br mbrMenu-br mbrMenu-rc"></div><div class="tsidMenu-bc mbrMenu-bc"></div><div class="tsidMenu-bl mbrMenu-bl mbrMenu-rc"></div></div></div><script>    new MenuButtonRounded('tsid', false, 16);</script></div></div></td></tr>
</table>