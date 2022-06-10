<%@ Page Language="C#" %>

<%@ Register Assembly="WebControls" Namespace="OA.Web.UI.WebControls" TagPrefix="cc1" %>
<%@ Register Src="/UIControls/TopNav.ascx" TagName="TopRight" TagPrefix="uc1" %>
<%@ Register Src="/UIControls/MainNav.ascx" TagName="MainNav" TagPrefix="uc1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="" style="display: none !important;">
<head>
    <script src="/static/js/perf/stub.js"></script>
    <title>流程报表 ：流程管理  ~  - 高效协同</title>
    <cc1:StyleAdapter runat="server" ID="StyleAdapter" />
    <link href="/sCSS/31/sprites/Theme3/base/dStandard.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/base/dCustom0.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/extended.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css" rel="stylesheet" type="text/css" />
    <link href="/sCSS/31/sprites/Theme3/zh/base/setupV2.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/css/themes/lightning/PersonalInformationhome.css">
    <link rel="stylesheet" href="/css/peoplehome.css">
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <link href="/template/css/header.css" rel="stylesheet" />
    <link href="/template/css/search.css" rel="stylesheet" />
    <link href="#" rel="stylesheet" />

    <script type="text/javascript">
        //<![CDATA[
        try { (function () { var w = self, l, p, o; if (w && top) { for (; w !== top && (p = w.parent) && p !== w && (o = p.location) && o.protocol === (l = w.location).protocol && (o.host === l.host || (p.document && p.document.domain === w.document.domain)) ; w = p); if (w !== top) throw ""; } ({ f: function () { document.documentElement ? document.documentElement.style.display = "" : (!this.a && (this.a = 10), this.a < 1E5 && (window.sfdcRetryShowWindow = this) && setTimeout("sfdcRetryShowWindow.f()", this.a), this.a *= 2) } }.f()) })(); } catch (e) { if (top !== self) top.location = location; else throw e; }//]]></script>
    <script src="/jslibrary/sfdc/main.js"></script>
    <script src="/jslibrary/jslabels/zh_CN.js"></script>
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>

    <script type="text/javascript">
        /*

        SetupTreeNode.prototype.initializeSetup = function () {
            var openNodes = '';
            if (openNodes != null) {
                SetupTreeNode.prototype.openListSetup = openNodes.split(':');
            }
            SetupTreeNode.prototype.personalSetupV2 = true;
        }
        */
    </script>
    <script>        window.sfdcPage = new GenericSfdcPage();
        UserContext.initialize({ "networkId": "", "labelLastModified": "1411677186000", "locale": "zh_CN", "isDefaultNetwork": true, "timeFormat": "ah:mm", "today": "2014-10-7 下午2:47", "orgPreferences": [{ "index": 257, "name": "TabOrganizer", "value": true }], "userPreferences": [{ "index": 112, "name": "HideInlineEditSplash", "value": false }, { "index": 114, "name": "OverrideTaskSendNotification", "value": false }, { "index": 115, "name": "DefaultTaskSendNotification", "value": false }, { "index": 119, "name": "HideUserLayoutStdFieldInfo", "value": false }, { "index": 116, "name": "HideRPPWarning", "value": false }, { "index": 87, "name": "HideInlineSchedulingSplash", "value": false }, { "index": 88, "name": "HideCRUCNotification", "value": false }, { "index": 89, "name": "HideNewPLESplash", "value": false }, { "index": 90, "name": "HideNewPLEWarnIE6", "value": false }, { "index": 122, "name": "HideOverrideSharingMessage", "value": false }, { "index": 91, "name": "HideProfileILEWarn", "value": false }, { "index": 93, "name": "HideProfileElvVideo", "value": false }, { "index": 97, "name": "ShowPicklistEditSplash", "value": false }, { "index": 92, "name": "HideDataCategorySplash", "value": false }, { "index": 128, "name": "ShowDealView", "value": false }, { "index": 129, "name": "HideDealViewGuidedTour", "value": false }, { "index": 132, "name": "HideKnowledgeFirstTimeSetupMsg", "value": false }, { "index": 104, "name": "DefaultOffEntityPermsMsg", "value": false }, { "index": 135, "name": "HideNewCsnSplash", "value": false }, { "index": 101, "name": "HideBrowserWarning", "value": false }, { "index": 139, "name": "HideDashboardBuilderGuidedTour", "value": false }, { "index": 140, "name": "HideSchedulingGuidedTour", "value": false }, { "index": 180, "name": "HideReportBuilderGuidedTour", "value": false }, { "index": 183, "name": "HideAssociationQueueCallout", "value": false }, { "index": 194, "name": "HideQTEBanner", "value": false }, { "index": 193, "name": "HideChatterOnboardingSplash", "value": true }, { "index": 195, "name": "HideSecondChatterOnboardingSplash", "value": false }, { "index": 270, "name": "HideIDEGuidedTour", "value": false }, { "index": 282, "name": "HideQueryToolGuidedTour", "value": false }, { "index": 196, "name": "HideCSIGuidedTour", "value": false }, { "index": 271, "name": "HideFewmetGuidedTour", "value": false }, { "index": 272, "name": "HideEditorGuidedTour", "value": false }, { "index": 205, "name": "HideApexTestGuidedTour", "value": false }, { "index": 206, "name": "HideSetupProfileHeaderTour", "value": false }, { "index": 207, "name": "HideSetupProfileObjectsAndTabsTour", "value": false }, { "index": 213, "name": "DefaultOffArticleTypeEntityPermMsg", "value": false }, { "index": 214, "name": "HideSelfInfluenceGetStarted", "value": false }, { "index": 215, "name": "HideOtherInfluenceGetStarted", "value": false }, { "index": 216, "name": "HideFeedToggleGuidedTour", "value": false }, { "index": 268, "name": "ShowChatterTab178GuidedTour", "value": false }, { "index": 275, "name": "HidePeopleTabDeprecationMsg", "value": false }, { "index": 276, "name": "HideGroupTabDeprecationMsg", "value": false }, { "index": 224, "name": "HideUnifiedSearchGuidedTour", "value": false }, { "index": 226, "name": "ShowDevContextMenu", "value": true }, { "index": 227, "name": "HideWhatRecommenderForActivityQueues", "value": false }, { "index": 228, "name": "HideLiveAgentFirstTimeSetupMsg", "value": false }, { "index": 232, "name": "HideGroupAllowsGuestsMsgOnMemberWidget", "value": false }, { "index": 233, "name": "HideGroupAllowsGuestsMsg", "value": false }, { "index": 234, "name": "HideWhatAreGuestsMsg", "value": false }, { "index": 235, "name": "HideNowAllowGuestsMsg", "value": false }, { "index": 236, "name": "HideSocialAccountsAndContactsGuidedTour", "value": false }, { "index": 237, "name": "HideAnalyticsHomeGuidedTour", "value": false }, { "index": 238, "name": "ShowQuickCreateGuidedTour", "value": true }, { "index": 245, "name": "HideFilePageGuidedTour", "value": false }, { "index": 250, "name": "HideForecastingGuidedTour", "value": false }, { "index": 251, "name": "HideBucketFieldGuide", "value": false }, { "index": 263, "name": "HideSmartSearchCallOut", "value": false }, { "index": 265, "name": "HideSocialProfilesKloutSplashScreen", "value": false }, { "index": 273, "name": "ShowForecastingQuotaAttainment", "value": false }, { "index": 280, "name": "HideForecastingQuotaColumn", "value": false }, { "index": 301, "name": "HideManyWhoGuidedTour", "value": false }, { "index": 284, "name": "HideExternalSharingModelGuidedTour", "value": false }, { "index": 298, "name": "HideFileSyncBannerMsg", "value": false }, { "index": 299, "name": "HideTestConsoleGuidedTour", "value": false }, { "index": 302, "name": "HideManyWhoInlineEditTip", "value": false }, { "index": 303, "name": "HideSetupV2WelcomeMessage", "value": true }, { "index": 312, "name": "ForecastingShowQuantity", "value": false }, { "index": 313, "name": "HideDataImporterIntroMsg", "value": false }, { "index": 314, "name": "HideEnvironmentHubLightbox", "value": false }, { "index": 316, "name": "HideSetupV2GuidedTour", "value": false }, { "index": 317, "name": "HideFileSyncMobileDownloadDialog", "value": false }, { "index": 321, "name": "HideCustomEntityQuickActionCallout", "value": false }, { "index": 322, "name": "HideEnhancedProfileHelpBubble", "value": true }, { "index": 328, "name": "ForecastingHideZeroRows", "value": false }, { "index": 330, "name": "HideEmbeddedComponentsFeatureCallout", "value": false }, { "index": 341, "name": "HideDedupeMatchResultCallout", "value": false }, { "index": 340, "name": "HideS1BrowserUI", "value": false }, { "index": 346, "name": "HideS1Banner", "value": true }], "startOfWeek": "1", "isAccessibleMode": false, "ampm": ["上午", "下午"], "renderMode": "RETRO", "userId": "005900000038QVZ", "dateTimeFormat": "yyyy-M-d ah:mm", "dateFormat": "yyyy-M-d", "uiSkin": "Theme3", "language": "zh_CN", "siteUrlPrefix": "" });
    </script>
    <script>        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/zen-componentsCompatible.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/elements.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/common.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/base/dStandard.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/00D90000000yI4o/005900000038QVZ/base/dCustom0.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/extended.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/WalkthroughCoreUI.css") } catch (e) { }
        try { DynamicCss.addCssUrl("/sCSS/31/sprites/Theme3/zh/base/setupV2.css") } catch (e) { }
        try { DynamicCss.doneLoading() } catch (e) { }</script>
    <script>        Sfdc.onReady(function () { HTMLTreeNode.prototype.populateTheTreeInformation('_font', '_child', '_icon', '_leaf', '展开', '折叠', '/img/alohaSkin/setup/setup_plus_lev1.gif', '/img/alohaSkin/setup/setup_minus_lev1.gif', 'setupHighlightLeaf', 'setupLeaf');; });</script>
    <script src="/jslibrary/sfdc/Security.js"></script>
    <script>        //    ClientHash.prototype.needsClientHash('sid_Client', '00000038QVZ0000000yI4o', '117.79.232.233', '/servlet/servlet.ClientHashValidator?ResponseRequestedURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPersonalSetup');</script>
    <style>
        .tree_a{
            font-size:14px;
        }
        .items_a{
            font-size:14px;
        }
        body #iframe {
            position: fixed;
            background-color: white;
            width: 60%;
            left: 20%;
            top: 50%;
            margin-top: -300px;
            border-radius: 7px;
            display: block;
            height:620px;
            border:0;
            overflow:hidden;
            z-index:9999;
            display:none;
        }
        .popup-mask {
            display:none;
            position: fixed;
            background-color:transparent;
            width:100%;
            height:100%;
            top:0;
            z-index:999;
            left:0;
            position:fixed;
            background: url(/img/bgOverlayDialogBackground.png) ;
            background-color: transparent;
        }
    </style>
</head>
<body onload="if(this.bodyOnLoad)bodyOnLoad();" onunload="if(this.bodyOnUnload)bodyOnUnload();"
    class="hasMotif homeTab  Home sfdcBody brandQuaternaryBgr" onfocus="if(this.bodyOnFocus)bodyOnFocus();"
    onbeforeunload="if(this.bodyOnBeforeUnload){var s=bodyOnBeforeUnload();if(s)return s;}">
    <!-- Main Body Starts Here -->
    <cc1:SesstionTimeout ID="SesstionTimeout1" runat="server" />
    <div id="contentWrapper">
        <div class="bPageHeader" id="AppBodyHeader">
            <uc1:TopRight ID="TopRight1" runat="server" />
            <uc1:MainNav ID="MainNav1" runat="server" />
        </div>
        <div class="bodyDiv brdPalette brandPrimaryBrd" id="bodyDiv_setup">

            <div class="body-item">
                <div class="left-view">
                    <div class="nav-search">
                        <input id="globalQuickfind" type="" name="" value="" />
                    </div>
                    <ul id="leftnav">
                    </ul>
                </div>
                <div class="right-view">
                    <div class="right-view-top">
                        <img src="/img/images/boshi.png" alt="" />
                        <span class="breadcrumbDetail uiOutputText"></span>
                    </div>
                    <div class="right-view-bottom">
                        <iframe frameborder ="0" id="childreniframe"></iframe>
                    </div>
                </div>
            </div>
        </div>    
    </div>
    <script>        //   walkthrough.trials = {};</script>
    <script defer="true" src="/jslibrary/sfdc/Setup.js"></script>
    <script defer="true" src="/jslibrary/sfdc/SetupV2.js"></script>
    <!--<script>        var s = document.createElement('SCRIPT'); s.async = true; s.defer = true; s.src = '/jslibrary/sfdc/SfdcSessionBase190.js'; (document.body || document.getElementsByTagName('script')[0]).appendChild(s);</script>-->
    <script src="/js/jquery/1.7.1/jquery.min.js"></script>
    <script src="/js/jqueryui/1.8.17/jquery-ui.min.js"></script>
    <script src="/js/CommonUtils.js"></script>
    <link rel="stylesheet" href="/easyui/themes/bootstrap/easyui.css" type="text/css" />
    <link rel="stylesheet" href="/easyui/themes/icon.css" type="text/css" />
    <script type="text/javascript" src="/easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript" src="/easyui/js/GridEasy.js"></script>
    <link href="/layui/layui/css/layui.css" rel="stylesheet" />
    <link href="/js/layoutlist/layoutlist.css" rel="stylesheet" />
    <link href="/template/css/indexStyle.css" rel="stylesheet" />
    <script type="text/javascript" src="/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="/template/js/search.js"></script>
    <script type="text/javascript" src="/template/js/indexjs.js"></script>
    <script src="/js/laydate/laydate.js"></script>
    <script type="text/javascript" src="/layui/layui/layui.js"></script>
    <script type="text/javascript" src="/js/formcomponents.js"></script>
    <script type="text/javascript">
         var data = [
              {
                  text: '流程报表',
                  children: [{
                      text: '流程量分析',
                      url: '/wfinstance/report/instanceStat.html?name=流程量分析'
                  }, {
                      text: '在办流程分析',
                      url: '/wfinstance/report/runningInstaceStat.html?name=在办流程分析'
                  }, {
                      text: '流程效率分析',
                      url: '/wfinstance/report/InstaceEfficiencyStat.html?name=流程效率分析'
                  }, {
                      text: '办理效率分析',
                      url: '/wfinstance/report/DealEfficiencyStat.html?name=办理效率分析'
                  }, {
                      text: '超期流程分析',
                      url: '/wfinstance/report/InstaceOverdueStat.html?name=超期流程分析'
                  }, {
                      text: '办理超期分析',
                      url: '/wfinstance/report/DealOverdueStat.html?name=办理超期分析'
                  }, {
                      text: '流程办理情况统计表',
                      url: '/wfinstance/report/instanceStat.html?name=流程办理情况统计表&iframename=childreniframe'
                  }
                  /*, {
                      text: '相对方',
                      url: '/cntrt/report/entitylistiframe.html?entitytype=001&name=供应商'
                  }, {
                      text: '联系人',
                      url: '/cntrt/report/entitylistiframe.html?entitytype=003&name=联系人'
                  }*/
                  ]
              }];
        for (var i = 0; i < data.length; i++) {
            if (data[i]) {
                data[i].show = 1
                for (var j = 0; j < data[i].children.length; j++) {
                    if (data[i].children[j]) {
                        data[i].children[j].show = 1
                    }
                }
            }
        }
       
        setnav(data)
        function setnav(data) {
            for (var i = 0; i < data.length; i++) {
                var res = data[i]
                if (res) {
                    if (data[i].show != '0') {
                        $('#leftnav').append('<li class="tree_item"><div><img style="width:10px;" src="/img/images/rightArrow.png"></img><a class="tree_a">' + res.text + '</a></div><ul class="ul"></ul>')
                        for (var j = 0; j < res.children.length; j++) {
                            var ress = res.children[j]
                            if (ress) {
                                if (ress.show != '0') {
                                    $('#leftnav .tree_item ul:last').append('<li url="' + ress.url + '" class="item_items"><a class="items_a">' + ress.text + '</a></li>')
                                }
                            }
                        }
                    }
                }

            }
            $('.tree_item').eq(0).find('div').addClass('active').next('ul').addClass('active')
            $('.tree_item').eq(0).find('div img').attr('src', '/img/images/S01-5.Open.png')
            $('.item_items').eq(0).addClass('items_active')
            $('#childreniframe').attr('src', $('.item_items').eq(0).attr('url'))
            $('.breadcrumbDetail.uiOutputText').html($('.item_items').eq(0).find('a').html())
            $('.tree_item>div').click(function () {
                $(this).toggleClass('active');
                $(this).next('ul').toggleClass('active');
                if ($(this).hasClass('active')) {
                    $(this).find('img').attr('src', '/img/images/Open.png')
                } else {
                    $(this).find('img').attr('src', '/img/images/rightArrow.png')
                }
            })
            $('.item_items').click(function () {
                $('.item_items').removeClass('items_active');
                $(this).addClass('items_active');
                $('iframe').attr('src', $(this).attr('url'))
                $('.breadcrumbDetail.uiOutputText').html($(this).find('a').html())
            })
        }
        searchnav(data);
        function searchnav(data) {
            $('#globalQuickfind').keyup(function () {
                var search = $(this).val()
                //console.log(search)
                $('.tree_item').remove()
                for (var i = 0; i < data.length; i++) {
                    if (data[i].text.indexOf(search) != '-1') {
                        data[i].show = 1
                    } else {
                        data[i].show = '0'
                    }
                    for (var j = 0; j < data[i].children.length; j++) {
                        if (data[i].children[j].text.indexOf(search) != '-1') {
                            data[i].children[j].show = 1
                            data[i].show = 1
                        } else {
                            data[i].children[j].show = '0'
                        }
                    }
                }
                setnav(data);
            })
        }
        function newdata() {
            var src = $('#childreniframe').attr('src')
            $('#childreniframe').attr('src', src)
        }
    </script>
    <iframe id="iframe" frameborder="0"></iframe>
    <div class="popup-mask"></div>
    <script src="/js/alert.js"></script>
</body>
</html>
<!-- page generation time: 103ms -->
