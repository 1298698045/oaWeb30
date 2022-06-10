<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addRelatedInsts.aspx.cs" Inherits="WebClient.apps.wf.addRelatedInsts" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html style="">
<head>
    <title>选择事务被关联事务</title>
    <meta http-equiv="PRAGMA" content="NO-CACHE">
    <cc1:StyleAdapter runat="server" id="StyleAdapter" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438736810000/Theme3/00D90000000yvHG/0059000000390Wh/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/34.0/sprites/1438195776000/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
</head>
<body class="eventTab popupTab brandNoBgrImg" onload="setFocusOnLoad()" onunload="if(this.bodyOnUnload)bodyOnUnload();">

    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>

    <script type='text/javascript'>

        var inviterLookupMatchMap = null;

        function insertInvitees() {
            var inviteesObject = getSelectedIds();
            if (!inviteesObject) {
                return;
            }
            if (inviteesObject.count == 0) {
                alert('必须选择至少一位被邀请人。');
            } else if (exceededMaxTotalAttendees(inviteesObject.idList.split(','))) {
                return false;
            } else {
                window.opener.updateOpener(inviteesObject.idList, '0', inviteesObject.dataList);;
                window.close();
            }
            return false;
        }

        function getSelectedIds() {
            var checkboxes = document.srchfrm.elements;
            if (checkboxes) {
                var dataList = [];
                var idList = '';
                var count = 0;
                for (var i = 0, id, match; i < checkboxes.length; i++) {
                    if (checkboxes[i].type == 'checkbox' && (checkboxes[i].name == 'invtee' || checkboxes[i].name == 'invsel')) {
                        if (checkboxes[i].checked) {
                            count++;
                            if (count > 1) {
                                idList = idList + ',';
                            }
                            id = checkboxes[i].value;
                            idList = idList + id;

                            if (inviterLookupMatchMap !== null) {
                                match = inviterLookupMatchMap[id];
                                if (match !== undefined && match !== null) {
                                    dataList.push(match);
                                }
                            }
                        }
                    }
                }
                return { idList: idList, dataList: dataList, count: count };
            } else {
                return null;
            }
        }

        function insertSelected() {
            document.srchfrm.ins.value = '1';
            document.srchfrm.submit();
        }

        function hasExceededLimit(selectedAttendees) {
            var maxTotalAttendees = 50;
            var existingAttendeeString = document['srchfrm']['invtdids'].value;
            var existingCount = 0;
            if (existingAttendeeString.length > 1) {
                var existingAttendees = existingAttendeeString.split(',');
                for (var i = existingAttendees.length - 1; i >= 0; i--) {
                    for (var j = 0; j < selectedAttendees.length; j++) {
                        if (selectedAttendees[j] === existingAttendees[i]) {
                            existingAttendees.splice(i, 1);
                            break;
                        }
                    }
                }
                existingCount = existingAttendees.length;
            }
            var totalCurrentAttendees = selectedAttendees.length + existingCount;
            if (totalCurrentAttendees > maxTotalAttendees) {
                return totalCurrentAttendees;
            } else {
                return -1;
            }
        }

        function exceededMaxTotalAttendees(selectedAttendees) {
            // No Attendees? Well then you've certainly not exceeded your limit.
            if (!selectedAttendees) { return; }
            // also check if the selectedAttendees contains empty value:
            if (selectedAttendees.length > 0 && selectedAttendees[0] === null || selectedAttendees[0] === '') {
                return;
            }
            if (true) {
                var totalCurrentAttendees = hasExceededLimit(selectedAttendees);
                if (totalCurrentAttendees !== -1) {
                    var banner = document.getElementById('errorBanner');
                    // Set it to visible:
                    if (banner) {
                        banner.style.display = 'block';
                    }
                    // Reformat Error Label.
                    var errorLbl = getElementsByClassName('messageText', banner, 'div')[0].lastChild;
                    errorLbl.nodeValue = formatMessage('您最多可以邀请 {0} 个人，而现在有 {1} 个受邀人。', '50', totalCurrentAttendees);
                    return true;
                }
            }
            // Everything passed.
            return;
        }

    </script>

    <div class="invitee">
        <form action="addRelatedInsts.aspx" id="srchfrm" method="post" name="srchfrm" onsubmit="if (window.ffInAlert) { return false; }">
            <input type="hidden" id="ins" name="ins" value="" />
             <cc1:RegisterParamsHiddenFieldsControl runat="server" ID="RegisterParamsHiddenFieldsControl1" />
            <div class="bPageTitle">
                <div class="ptBody secondaryPalette">
                    <div class="content">
                        <img src="/s.gif" alt="主页" class="pageTitleIcon" title="主页" /><h1>事务</h1>
                        <h2>选择事务被关联的事务</h2>
                    </div>
                </div>
            </div>
            <input type="hidden" id="invtdids" name="invtdids" value="" /><div class="body" id="searchBox">
                <div class="bFilter">
                    <label class="text" for="srch">事务名称：</label><!--&nbsp;<select id="srtp" name="srtp"><option value="all">用户、潜在客户和联系人</option>
                        <option value="005" selected="selected">用户</option>
                        <option value="00Q">潜在客户</option>
                        <option value="003">联系人</option>
                    </select>&nbsp;<label class="text">类型</label>&nbsp;&nbsp;--><input id="srch" maxlength="30" name="srch" size="20" type="text" value="" />
                    <div style="display:inline-block;">
                    创建人：
                        <input type="hidden" value="" id="ApplyUserId_lkid" name="ApplyUserId_lkid" searchcolumn="true" datafield="ApplyUserId" dataope="eq"><input type="hidden" value="" id="ApplyUserId_lkold" name="ApplyUserId_lkold"><input type="hidden" value="8" id="ApplyUserId_lktp" name="ApplyUserId_lktp"><input type="hidden" value="1" id="ApplyUserId_lspf" name="ApplyUserId_lspf"><input type="hidden" value="0" id="ApplyUserId_lspfsub" name="ApplyUserId_lspfsub"><input type="hidden" value="1" id="ApplyUserId_mod" name="ApplyUserId_mod"><span class="lookupInput"><input type="text" value="" tabindex="4" size="10" onchange="getElementByIdCS('ApplyUserId_lkid').value='';getElementByIdCS('ApplyUserId_mod').value='1';" name="ApplyUserId" maxlength="255" id="ApplyUserId"><a title="申请人 查找（新窗口）" tabindex="4" onclick="setLastMousePosition(event)" id="ApplyUserId_lkwgt" href="javascript:openLookup('/_ui/common/data/LookupPage?lkfm=editPage&amp;lknm=ApplyUserId&amp;lktp=' + getElementByIdCS('ApplyUserId_lktp').value,670,'1','&amp;lksrch=' + escapeUTF(encodeURIComponent(getElementByIdCS('ApplyUserId').value.substring(0, 80))))"><img title="申请人 查找（新窗口）" onmouseover="this.className = 'lookupIconOn';this.className = 'lookupIconOn';" onmouseout="this.className = 'lookupIcon';this.className = 'lookupIcon';" onfocus="this.className = 'lookupIconOn';" onblur="this.className = 'lookupIcon';" class="lookupIcon" alt="申请人 查找（新窗口）" src="/s.gif"></a></span>
                    </div>
                    <div style="display:inline-block;">
                     流程：<input id="processName" maxlength="30" name="processName" size="20" type="text" value="" />
                    </div>
                    &nbsp;<input value=" 搜索！ " class="btn" name="go" style="height:25px;" title="搜索！" type="submit" />
                </div>
            </div>
            <div class="message errorM3 errorBanner" id="errorBanner">
                <table class="messageTable" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <img src="/s.gif" alt="错误" class="msgIcon" title="错误" /></td>
                        <td class="messageCell">
                            <div class="messageText">
                                <h4>错误：已邀请过多人参加该会议。</h4>
                                您最多可以邀请 {0} 个人，而现在有 {1} 个受邀人。</div>
                        </td>
                    </tr>
                </table>
            </div>
            <script>if (window.sfdcPage) sfdcPage.registerMessage('errorBanner');</script>
            <div id="searchResults">
                <!-- Begin RelatedListElement -->
                <div class="bRelatedList">
                    <!-- Begin ListElement -->

                    <!-- motif: Event -->

                    <!-- WrappingClass -->
                    <div class="listRelatedObject eventBlock">
                        <div class="bPageBlock brandSecondaryBrd secondaryPalette">
                            <div class="pbHeader">
                                <table border="0" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td class="pbTitle">
                                            <img src="/s.gif" alt="" width="1" height="1" class="minWidth" title="" /><img src="/s.gif" alt="" class="relatedListIcon" title="" /><h3>搜索结果</h3>
                                        </td>
                                        <td class="pbButton">
                                            <input value=" 插入所选 " class="btn" name="insert" onclick="javascript: insertSelected();" title="插入所选" type="submit" style="height:25px;"/><!--<input value=" 完成 " style="height:25px;" class="btn" name="insert" onclick="    return insertInvitees();" title="完成" type="submit" />--><input value=" 取消 " style="height:25px;" class="btn" name="done" onclick="    javascript: window.close();" title="取消" type="submit" /></td>
                                        <td class="pbHelp">&nbsp;</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="pbBody">
                                <table class="list" border="0" cellspacing="0" cellpadding="0">
                                    <tr class="headerRow">
                                        <th class="actionColumn" scope="col">
                                            <input id="" name="" onclick="SelectAllOrNoneByCheckbox(document.srchfrm, 'invtee', this)" title="选择全部" type="checkbox" value="" /></th>
                                        <th scope="col" class=" zen-deemphasize">标题</th>  
                                        <th scope="col" class=" zen-deemphasize">流程名称</th>  
                                        <th scope="col" class=" zen-deemphasize">创建人</th>  
                                        <th scope="col" class=" zen-deemphasize">创建时间</th>                                 
                                    </tr>
                                    <%=SearchGridHTML%>                                   
                                </table>
                            </div>
                            <div class="pbFooter secondaryPalette">
                                <div class="bg"></div>
                            </div>
                        </div>
                    </div>
                    <div class="listElementBottomNav"></div>
                    <!-- End ListElement -->
                </div>
                <!-- End RelatedListElement -->
            </div>
            <!--<div class="footer">&copy; 2016-2019 , inc. 公司版权所有。 本公司保留所有权利。</div>-->
            <script>document.forms[0].srch.focus(); </script>
             <script type="text/javascript">function bodyOnLoad() { }
                 function bodyOnBeforeUnload() { } function bodyOnFocus() { }
                 function bodyOnUnload() {
                     var isSearched = document.srchfrm.ins.value;
                     if (isSearched) {
                         // window.opener.location.reload();
                         window.opener.refreshRelatedInstances();
                     }
                 }
                </script>
            <!--<script>  inviterLookupMatchMap = { "0059000000390Wh": { "name": "liu jack", "id": "0059000000390Wh", "type": "user", "email": "jackliu185@sina.com" }, "005900000039oIN": { "name": "liu lan", "id": "005900000039oIN", "type": "user", "email": "69839499@qq.com" }, "00590000003y68m": { "name": "璞", "id": "00590000003y68m", "type": "user", "email": "83981395@qq.com" } }</script>-->
        </form>
    </div>
</body>
</html>


