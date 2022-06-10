<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SetupNavTree.ascx.cs"
    Inherits="WebClient.UIControls.SetupNavTree" %>
<div class="mTreeSelection" id="setupNavTree">
    <div class="quickfindContainer">
        <input class="quickfindInput" id="setupSearch" maxlength="80" name="setupSearch"
            size="20" title="快速查找" type="text" /></div>
    <div class="setupControlLinks">
        <a href="#" id="setupNavExpandAll">全部展开</a>|<a href="#" id="setupNavCollapseAll">全部折叠</a></div>
    <div id="setupSearchError">
        找不到匹配的项目</div>
    <div id="treeInformation" style="display: none;">
    </div>
    <div id="AutoNumber5">
        <img src="/s.gif" alt="" width="205" height="1" style="margin-right: 0.25em; margin-right: 0.25em;
            margin-right: 0.25em;" title="" />
        <div class="setupNavtree">
            <h2>
                <a href="/setup/forcecomHomepage.apexp?setupid=ForceCom&amp;retURL=%2Fui%2Fsetup%2FSetup"
                    class="setupSection" id="ForceCom_font">主页</a></h2>
        </div>
        <div class="setupNavtree">
            <h2>
                <a href="/ui/setup/Setup?setupid=AdminSetup" class="setupSection" id="AdminSetup_font">
                    管理</a></h2>
        </div>
        <div id="Users" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Users%27%29" id="Users_icon">
                <img src="/img/alohaSkin/setup/setup_minus_lev1.gif" alt="折叠 - 管理用户 - 级别 1" width="11"
                    height="11" class="setupImage" title="折叠 - 管理用户 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=Users"
                        class="setupFolder" id="Users_font">管理用户</a>
            <div class="childContainer" style="display: block;" id="Users_child">
                <div class="setupHighlightLeaf">
                    <a href="/005?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers&amp;setupid=ManageUsers"
                        id="ManageUsers_font">用户</a></div>
                <div class="setupLeaf">
                    <a href="/ui/massmail/MassMailStageManager?setupid=EmailUsers&amp;ftype=UserMassMail&amp;wizardRetUrl=%2F005%3FretURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DUsers%26setupid%3DManageUsers&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers"
                        id="EmailUsers_font">批量电子邮件用户</a></div>
                <div class="setupLeaf">
                    <a href="/ui/setup/user/RoleViewPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers&amp;setupid=Roles"
                        id="Roles_font">角色</a></div>
                <div class="setupLeaf">
                    <a href="/0PS?setupid=PermSets&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers"
                        id="PermSets_font">权限组</a></div>
                <div class="setupLeaf">
                    <a href="/p/own/OrgPublicGroupsPage/d?setupid=PublicGroups&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers"
                        id="PublicGroups_font">公用小组</a></div>
                <div class="setupLeaf">
                    <a href="/p/own/OrgQueuesPage/d?setupid=Queues&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers"
                        id="Queues_font">队列</a></div>
                <div class="setupLeaf">
                    <a href="/0Ya?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers&amp;setupid=OrgLoginHistory"
                        id="OrgLoginHistory_font">登录历史</a></div>
                <div class="setupLeaf">
                    <a href="/train/traininglist.jsp?setupid=TrainingHistory&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUsers"
                        id="TrainingHistory_font">培训历史</a></div>
            </div>
        </div>
        <div id="ManageApps" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27ManageApps%27%29"
                id="ManageApps_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 管理应用程序 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 管理应用程序 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=ManageApps"
                        class="setupFolder" id="ManageApps_font">管理应用程序</a><div class="childContainer" style="display: none;"
                            id="ManageApps_child">
                            <div class="setupLeaf">
                                <a href="/app/mgmt/forceconnectedapps/forceInstalledConnectedAppList.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DManageApps&amp;setupid=ConnectedApplication"
                                    id="ConnectedApplication_font">连接的应用程序</a></div>
                            <div class="setupLeaf">
                                <a href="/identity/app/connectedAppsUsage.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DManageApps&amp;setupid=ConnectedAppsUsage"
                                    id="ConnectedAppsUsage_font">已连接应用程序 OAuth 使用情况</a></div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/tab/AppMenuItemReorderPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DManageApps&amp;setupid=AppMenu"
                                    id="AppMenu_font">应用程序菜单</a></div>
                        </div>
        </div>
        <div id="CompanyProfile" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27CompanyProfile%27%29"
                id="CompanyProfile_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 公司简档 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 公司简档 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=CompanyProfile"
                        class="setupFolder" id="CompanyProfile_font">公司简档</a><div class="childContainer"
                            style="display: none;" id="CompanyProfile_child">
                            <div class="setupLeaf">
                                <a href="/00D90000000yI4o?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCompanyProfile&amp;setupid=CompanyProfileInfo"
                                    id="CompanyProfileInfo_font">公司信息</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/org/orgfyedit.jsp?id=00D90000000yI4o&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCompanyProfile&amp;setupid=ForecastFiscalYear"
                                    id="ForecastFiscalYear_font">会计年度</a></div>
                            <div class="setupLeaf">
                                <a href="/01m?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCompanyProfile&amp;setupid=BusinessHours"
                                    id="BusinessHours_font">工作时间</a></div>
                            <div class="setupLeaf">
                                <a href="/p/case/HolidayList?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCompanyProfile&amp;setupid=Holiday"
                                    id="Holiday_font">假期</a></div>
                            <div class="setupLeaf">
                                <a href="/_ui/system/organization/LanguageSettings?setupid=LanguageSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCompanyProfile"
                                    id="LanguageSettings_font">语言设置</a></div>
                        </div>
        </div>
        <div id="Security" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Security%27%29" id="Security_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 安全性控制 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 安全性控制 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=Security"
                        class="setupFolder" id="Security_font">安全性控制</a><div class="childContainer" style="display: none;"
                            id="Security_child">
                            <div class="setupLeaf">
                                <a href="/p/own/OrgSharingDetail?setupid=SecuritySharing&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity"
                                    id="SecuritySharing_font">共享设置</a></div>
                            <div class="setupLeaf">
                                <a href="/secur/orgloginsettingedit.jsp?id=00D90000000yI4o&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=SecurityPolicies"
                                    id="SecurityPolicies_font">密码策略</a></div>
                            <div class="setupLeaf">
                                <a href="/_ui/system/security/SessionSettings?id=00D90000000yI4o&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=SecuritySession"
                                    id="SecuritySession_font">会话设置</a></div>
                            <div class="setupLeaf">
                                <a href="/05G?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=NetworkAccess"
                                    id="NetworkAccess_font">网络访问</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/secur/identityconfirmation/ActivatedIpAddressAndClientBrowsersPage.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=ActivatedIpAddressAndClientBrowsersPage"
                                    id="ActivatedIpAddressAndClientBrowsersPage_font">启用</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/secur/session/SessionManagementPage.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=SessionManagementPage"
                                    id="SessionManagementPage_font">会话管理</a></div>
                            <div class="setupLeaf">
                                <a href="/partnerbt/loginAccessPolicies.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=LoginAccessPolicies"
                                    id="LoginAccessPolicies_font">登录访问权限政策</a></div>
                            <div class="setupLeaf">
                                <a href="/0P1?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=CertificatesAndKeysManagement"
                                    id="CertificatesAndKeysManagement_font">证书和密钥管理</a></div>
                            <div class="setupLeaf">
                                <a href="/_ui/identity/saml/SingleSignOnSettingsUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=SingleSignOn"
                                    id="SingleSignOn_font">单点登录设置</a></div>
                            <div class="setupLeaf">
                                <a href="/0SO?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=AuthProviders"
                                    id="AuthProviders_font">验证提供商</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/org/orgsetupaudit.jsp?setupid=SecurityEvents&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity"
                                    id="SecurityEvents_font">查看设置审计线索</a></div>
                            <div class="setupLeaf">
                                <a href="/secur/organizationpasswordreset.jsp?setupid=SecurityExpirePasswords&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity"
                                    id="SecurityExpirePasswords_font">使所有密码到期</a></div>
                            <div class="setupLeaf">
                                <a href="/0rp?spl1=1&amp;setupid=SecurityRemoteProxy&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity"
                                    id="SecurityRemoteProxy_font">远程站点设置</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/content/FileTypeSetting.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSecurity&amp;setupid=FileTypeSetting"
                                    id="FileTypeSetting_font">文件上载和下载安全性</a></div>
                        </div>
        </div>
        <div id="Domains" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Domains%27%29" id="Domains_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 域管理 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 域管理 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=Domains"
                        class="setupFolder" id="Domains_font">域管理</a><div class="childContainer" style="display: none;"
                            id="Domains_child">
                            <div class="setupLeaf">
                                <a href="/domainname/DomainName.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDomains&amp;setupid=OrgDomain"
                                    id="OrgDomain_font">My Domain</a></div>
                        </div>
        </div>
        <div id="CommunicationTemplates" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27CommunicationTemplates%27%29"
                id="CommunicationTemplates_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 通信模板 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 通信模板 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=CommunicationTemplates"
                        class="setupFolder" id="CommunicationTemplates_font">通信模板</a><div class="childContainer"
                            style="display: none;" id="CommunicationTemplates_child">
                            <div class="setupLeaf">
                                <a href="/email/brand/brandsplash.jsp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesLetterheads"
                                    id="CommunicationTemplatesLetterheads_font">信头</a></div>
                            <div class="setupLeaf">
                                <a href="/00X?setupid=CommunicationTemplatesEmail&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates"
                                    id="CommunicationTemplatesEmail_font">电子邮件模板</a></div>
                            <div class="setupLeaf">
                                <a href="/01H?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCommunicationTemplates&amp;setupid=CommunicationTemplatesWord"
                                    id="CommunicationTemplatesWord_font">邮件合并模板</a></div>
                        </div>
        </div>
        <div id="LabelWorkbench" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27LabelWorkbench%27%29"
                id="LabelWorkbench_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 翻译工作台 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 翻译工作台 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=LabelWorkbench"
                        class="setupFolder" id="LabelWorkbench_font">翻译工作台</a><div class="childContainer"
                            style="display: none;" id="LabelWorkbench_child">
                            <div class="setupLeaf">
                                <a href="/i18n/TranslationSplash.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLabelWorkbench&amp;setupid=LabelWorkbenchSetup"
                                    id="LabelWorkbenchSetup_font">翻译设置</a></div>
                            <div class="setupLeaf">
                                <a href="/i18n/TranslationSplash.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLabelWorkbench&amp;setupid=LabelWorkbenchTranslate"
                                    id="LabelWorkbenchTranslate_font">翻译</a></div>
                            <div class="setupLeaf">
                                <a href="/i18n/LabelWorkbenchOverride.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLabelWorkbench&amp;setupid=LabelWorkbenchOverride"
                                    id="LabelWorkbenchOverride_font">覆盖</a></div>
                            <div class="setupLeaf">
                                <a href="/i18n/TranslationSplash.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLabelWorkbench&amp;setupid=LabelWorkbenchExport"
                                    id="LabelWorkbenchExport_font">导出</a></div>
                            <div class="setupLeaf">
                                <a href="/i18n/TranslationSplash.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLabelWorkbench&amp;setupid=LabelWorkbenchImport"
                                    id="LabelWorkbenchImport_font">导入</a></div>
                        </div>
        </div>
        <div id="DataManagement" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27DataManagement%27%29"
                id="DataManagement_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 数据管理 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 数据管理 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=DataManagement"
                        class="setupFolder" id="DataManagement_font">数据管理</a><div class="childContainer"
                            style="display: none;" id="DataManagement_child">
                            <div class="setupLeaf">
                                <a href="/_ui/analytics/jobs/AnalyticSnapshotSplashUi?setupid=AnalyticSnapshots&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="AnalyticSnapshots_font">分析快照</a></div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/dataimporter/DataImporterAdminLandingPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement&amp;setupid=DataManagementDataImporter"
                                    id="DataManagementDataImporter_font">数据导入向导</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/imp/orgimport_welcome.jsp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement&amp;setupid=DataManagementContacts"
                                    id="DataManagementContacts_font">导入客户/联系人</a></div>
                            <div class="setupLeaf">
                                <a href="/lead/leadImportWelcome.jsp?setupid=DataManagementLeads&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="DataManagementLeads_font">导入潜在客户</a></div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/imp/SolutionImportWelcomePage?setupid=DataManagementSolutions&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="DataManagementSolutions_font">导入解决方案</a></div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/imp/ImportWizardWelcomePage?setupid=DataManagementImportWizard&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="DataManagementImportWizard_font">导入自定义对象</a></div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/export/DataExportPage/d?setupid=DataManagementExport&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="DataManagementExport_font">数据导出</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/org/orgstorageusage.jsp?id=00D90000000yI4o&amp;setupid=CompanyResourceDisk&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="CompanyResourceDisk_font">存储空间使用情况</a></div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/own/BulkTransferPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement&amp;setupid=DataManagementTransfer"
                                    id="DataManagementTransfer_font">批量转移记录</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/own/massdeleteselect.jsp?setupid=DataManagementDelete&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="DataManagementDelete_font">批量删除记录</a></div>
                            <div class="setupLeaf">
                                <a href="/_ui/system/organization/SoftDeleteAllDataUi?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement&amp;setupid=DataManagementDeleteAll"
                                    id="DataManagementDeleteAll_font">删除所有数据</a></div>
                            <div class="setupLeaf">
                                <a href="/i18n/AddressCleanerOverview.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement&amp;setupid=AddressCleanerOverview"
                                    id="AddressCleanerOverview_font">州/省和国家选项列表</a></div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/cleanse/MassUpdateAddressWizard?setupid=DataManagementMassUpdateAddresses&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDataManagement"
                                    id="DataManagementMassUpdateAddresses_font">批量更新地址</a></div>
                        </div>
        </div>
        <div id="MobileAdministration" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27MobileAdministration%27%29"
                id="MobileAdministration_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 移动管理 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 移动管理 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=MobileAdministration"
                        class="setupFolder" id="MobileAdministration_font">移动管理</a><div class="childContainer"
                            style="display: none;" id="MobileAdministration_child">
                            <div class="setupLeaf">
                                <a href="/setup/salesforce1AppMenu.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DMobileAdministration&amp;setupid=ProjectOneAppMenu"
                                    id="ProjectOneAppMenu_font">移动导航</a></div>
                            <div class="setupLeaf">
                                <a href="/mobile/mobileadmin/offlineStorageSettings.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DMobileAdministration&amp;setupid=MobileOfflineStorageAdmin"
                                    id="MobileOfflineStorageAdmin_font">离线</a></div>
                            <div id="NotificationsAdmin" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27NotificationsAdmin%27%29"
                                    id="NotificationsAdmin_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 通知 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 通知 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=NotificationsAdmin"
                                            class="setupFolder" id="NotificationsAdmin_font">通知</a><div class="childContainer"
                                                style="display: none;" id="NotificationsAdmin_child">
                                                <div class="setupLeaf">
                                                    <a href="/notifications/notificationsSetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DNotificationsAdmin&amp;setupid=NotificationsSettings"
                                                        id="NotificationsSettings_font">设置</a></div>
                                            </div>
                            </div>
                            <div id="Salesforce1" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Salesforce1%27%29"
                                    id="Salesforce1_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Salesforce1 - 级别 2"
                                        width="11" height="11" class="setupImage" title="展开 - Salesforce1 - 级别 2" /></a><a
                                            href="/ui/setup/Setup?setupid=Salesforce1" class="setupFolder" id="Salesforce1_font">Salesforce1</a><div
                                                class="childContainer" style="display: none;" id="Salesforce1_child">
                                                <div class="setupLeaf">
                                                    <a href="/mobile/mobileadmin/settingsMovedToConnectedApps.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSalesforce1&amp;setupid=Salesforce1Settings"
                                                        id="Salesforce1Settings_font">设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui-global/setup/s1Branding.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSalesforce1&amp;setupid=Salesforce1Branding"
                                                        id="Salesforce1Branding_font">品牌化</a></div>
                                            </div>
                            </div>
                            <div id="ApexMobile" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27ApexMobile%27%29"
                                    id="ApexMobile_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Salesforce Classic - 级别 2"
                                        width="11" height="11" class="setupImage" title="展开 - Salesforce Classic - 级别 2" /></a><a
                                            href="/ui/setup/Setup?setupid=ApexMobile" class="setupFolder" id="ApexMobile_font">Salesforce
                                            Classic</a><div class="childContainer" style="display: none;" id="ApexMobile_child">
                                                <div class="setupLeaf">
                                                    <a href="/_ui/core/mobileadmin/MobileSplashUi?Type=M&amp;EntityId=MobileConfig&amp;setupid=ApexMobileConfigurations&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DApexMobile"
                                                        id="ApexMobileConfigurations_font">配置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/086?setupid=ApexMobileUsersAndDevices&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DApexMobile"
                                                        id="ApexMobileUsersAndDevices_font">用户和设备</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/core/mobileadmin/MobileSettingsPage/d?setupid=MobileSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DApexMobile"
                                                        id="MobileSettings_font">设置</a></div>
                                            </div>
                            </div>
                        </div>
        </div>
        <div id="DesktopAdministration" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27DesktopAdministration%27%29"
                id="DesktopAdministration_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 桌面管理 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 桌面管理 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=DesktopAdministration"
                        class="setupFolder" id="DesktopAdministration_font">桌面管理</a><div class="childContainer"
                            style="display: none;" id="DesktopAdministration_child">
                            <div class="setupLeaf">
                                <a href="/063?Type=E&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDesktopAdministration&amp;setupid=EmailConfigurations"
                                    id="EmailConfigurations_font">Outlook 配置</a></div>
                            <div class="setupLeaf">
                                <a href="/_ui/core/mobileadmin/OfflineSplashUi?Type=O&amp;EntityId=MobileConfig&amp;setupid=OfflineConfigurations&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDesktopAdministration"
                                    id="OfflineConfigurations_font">离线公文包配置</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/chatterdesktop/chatterdesktopadmin.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDesktopAdministration&amp;setupid=ChatterDesktopSettings"
                                    id="ChatterDesktopSettings_font">Chatter Desktop 设置</a></div>
                        </div>
        </div>
        <div id="EmailAdmin" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27EmailAdmin%27%29"
                id="EmailAdmin_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 电子邮件管理 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 电子邮件管理 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=EmailAdmin"
                        class="setupFolder" id="EmailAdmin_font">电子邮件管理</a><div class="childContainer" style="display: none;"
                            id="EmailAdmin_child">
                            <div class="setupLeaf">
                                <a href="/email/admin/editOrgEmailSettings.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DEmailAdmin&amp;setupid=OrgEmailSettings"
                                    id="OrgEmailSettings_font">递送能力</a></div>
                            <div class="setupLeaf">
                                <a href="/email/address/listOrgWideEmailAddress.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DEmailAdmin&amp;setupid=OrgWideEmailAddresses"
                                    id="OrgWideEmailAddresses_font">组织范围内地址</a></div>
                            <div class="setupLeaf">
                                <a href="/email/admin/testEmailDeliverability.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DEmailAdmin&amp;setupid=TestEmailDeliverability"
                                    id="TestEmailDeliverability_font">测试递送能力</a></div>
                            <div class="setupLeaf">
                                <a href="/email/admin/emailToSalesforceOrgSetup.apexp?mode=detail&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DEmailAdmin&amp;setupid=EmailToSalesforce"
                                    id="EmailToSalesforce_font">Email 至 Salesforce</a></div>
                            <div class="setupLeaf">
                                <a href="/_ui/core/email/attach/EmailAttachmentManagement?setupid=EmailAttachmentManagement&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DEmailAdmin"
                                    id="EmailAttachmentManagement_font">删除作为链接发送的附件</a></div>
                            <div class="setupLeaf">
                                <a href="/0GC?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DEmailAdmin&amp;setupid=EmailDisclaimers"
                                    id="EmailDisclaimers_font">电子邮件页脚</a></div>
                        </div>
        </div>
        <div id="GoogleAppsFb" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27GoogleAppsFb%27%29"
                id="GoogleAppsFb_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Google 企业应用套件 - 级别 1"
                    width="11" height="11" class="setupImage" title="展开 - Google 企业应用套件 - 级别 1" /></a><a
                        href="/ui/setup/Setup?setupid=GoogleAppsFb" class="setupFolder" id="GoogleAppsFb_font">Google
                        企业应用套件</a><div class="childContainer" style="display: none;" id="GoogleAppsFb_child">
                            <div class="setupLeaf">
                                <a href="/ui/setup/google/GoogleAppsSetupUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DGoogleAppsFb&amp;setupid=GoogleAppsFbSettings"
                                    id="GoogleAppsFbSettings_font">设置</a></div>
                        </div>
        </div>
        <div class="setupNavtree">
            <h2>
                <a href="/ui/setup/Setup?setupid=Studio" class="setupSection" id="Studio_font">版本</a></h2>
        </div>
        <div id="Customize" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Customize%27%29" id="Customize_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 自定义 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 自定义 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=Customize"
                        class="setupFolder" id="Customize_font">自定义</a><div class="childContainer" style="display: none;"
                            id="Customize_child">
                            <div id="Tab" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Tab%27%29" id="Tab_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 选项卡名称和标签 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 选项卡名称和标签 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Tab"
                                            class="setupFolder" id="Tab_font">选项卡名称和标签</a><div class="childContainer" style="display: none;"
                                                id="Tab_child">
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/RenameTabPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DTab&amp;setupid=RenameTab"
                                                        id="RenameTab_font">重命名选项卡和标签</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/helpsettingedit.jsp?setupid=RenameHelp&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DTab"
                                                        id="RenameHelp_font">帮助设置</a></div>
                                            </div>
                            </div>
                            <div id="Home" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Home%27%29" id="Home_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 主页 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 主页 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Home"
                                            class="setupFolder" id="Home_font">主页</a><div class="childContainer" style="display: none;"
                                                id="Home_child">
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/homepagecomponents.jsp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DHome&amp;setupid=HomePageComponents"
                                                        id="HomePageComponents_font">主页组件</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/02T?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DHome&amp;setupid=HomePageLayouts"
                                                        id="HomePageLayouts_font">主页布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/CustomResourceLinkList?pageName=CustomPageItem&amp;type=CustomPageItem&amp;setupid=HomeLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DHome"
                                                        id="HomeLinks_font">自定义链接</a></div>
                                            </div>
                            </div>
                            <div id="Activity" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Activity%27%29" id="Activity_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 活动 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 活动 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Activity"
                                            class="setupFolder" id="Activity_font">活动</a><div class="childContainer" style="display: none;"
                                                id="Activity_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Task&amp;setupid=TaskFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="TaskFields_font">任务字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;tableEnumOrId=Task&amp;setupid=TaskValidations"
                                                        id="TaskValidations_font">任务验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Task&amp;type=Task&amp;setupid=TaskLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="TaskLinks_font">任务按钮、链接和操作</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Task&amp;setupid=TaskLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="TaskLayouts_font">任务页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;tableEnumOrId=Task&amp;setupid=TaskFieldSets"
                                                        id="TaskFieldSets_font">任务字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;type=Task&amp;setupid=TaskCompactLayouts"
                                                        id="TaskCompactLayouts_font">任务紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Task&amp;setupid=TaskLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="TaskLimits_font">任务限制数</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Event&amp;setupid=EventFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="EventFields_font">事件字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;tableEnumOrId=Event&amp;setupid=EventValidations"
                                                        id="EventValidations_font">事件验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Event&amp;type=Event&amp;setupid=EventLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="EventLinks_font">事件按钮和链接</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Event&amp;setupid=EventLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="EventLayouts_font">事件页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;tableEnumOrId=Event&amp;setupid=EventFieldSets"
                                                        id="EventFieldSets_font">事件字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;type=Event&amp;setupid=EventCompactLayouts"
                                                        id="EventCompactLayouts_font">事件紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Event&amp;setupid=EventLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="EventLimits_font">事件限制数</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Activity&amp;setupid=ActivityFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="ActivityFields_font">活动自定义字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Activity&amp;setupid=ActivitySearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="ActivitySearchLayouts_font">活动搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Activity&amp;type=Activity&amp;setupid=ActivityLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="ActivityLinks_font">活动按钮</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Activity&amp;setupid=ActivityLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity"
                                                        id="ActivityLimits_font">活动限制数</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/023/s?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;setupid=Calendars"
                                                        id="Calendars_font">公共日历和资源</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/activitiesSetupPage.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;setupid=HomeActivitiesSetupPage"
                                                        id="HomeActivitiesSetupPage_font">活动设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/activities/cloudSchedulerSetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DActivity&amp;setupid=CloudSchedulerSetupPage"
                                                        id="CloudSchedulerSetupPage_font">云调度程序</a></div>
                                            </div>
                            </div>
                            <div id="Campaign" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Campaign%27%29" id="Campaign_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 市场活动 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 市场活动 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Campaign"
                                            class="setupFolder" id="Campaign_font">市场活动</a><div class="childContainer" style="display: none;"
                                                id="Campaign_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Campaign&amp;setupid=CampaignFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign"
                                                        id="CampaignFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign&amp;tableEnumOrId=Campaign&amp;setupid=CampaignLookups"
                                                        id="CampaignLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign&amp;tableEnumOrId=Campaign&amp;setupid=CampaignValidations"
                                                        id="CampaignValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Campaign&amp;setupid=CampaignLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign"
                                                        id="CampaignLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign&amp;tableEnumOrId=Campaign&amp;setupid=CampaignFieldSets"
                                                        id="CampaignFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign&amp;type=Campaign&amp;setupid=CampaignCompactLayouts"
                                                        id="CampaignCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Campaign&amp;setupid=CampaignSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign"
                                                        id="CampaignSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Campaign&amp;type=Campaign&amp;setupid=CampaignLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign"
                                                        id="CampaignLinks_font">按钮、链接和操作</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Campaign&amp;setupid=CampaignLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign"
                                                        id="CampaignLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/camp/CampaignInfluenceSetupUi/e?ftype=CampaignInfluence&amp;setupid=CampaignInfluence&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaign"
                                                        id="CampaignInfluence_font">市场活动影响</a></div>
                                                <div id="CampaignMember" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27CampaignMember%27%29"
                                                        id="CampaignMember_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 市场活动成员 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 市场活动成员 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=CampaignMember"
                                                                class="setupFolder" id="CampaignMember_font">市场活动成员</a><div class="childContainer"
                                                                    style="display: none;" id="CampaignMember_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=CampaignMember&amp;setupid=CampaignMemberFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaignMember"
                                                                            id="CampaignMemberFields_font">字段</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaignMember&amp;tableEnumOrId=CampaignMember&amp;setupid=CampaignMemberValidations"
                                                                            id="CampaignMemberValidations_font">验证规则</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/PageLayouts?type=CampaignMember&amp;setupid=CampaignMemberLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaignMember"
                                                                            id="CampaignMemberLayouts_font">页面布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaignMember&amp;tableEnumOrId=CampaignMember&amp;setupid=CampaignMemberFieldSets"
                                                                            id="CampaignMemberFieldSets_font">字段集</a></div>
                                                                    <div class="setupLeaf">
                                                                        <span><a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaignMember&amp;type=CampaignMember&amp;setupid=CampaignMemberCompactLayouts"
                                                                            id="CampaignMemberCompactLayouts_font">紧凑布局</a><span class="newFlag">新！</span></span></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/link/ActionButtonLinkList?pageName=CampaignMember&amp;type=CampaignMember&amp;setupid=CampaignMemberLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaignMember"
                                                                            id="CampaignMemberLinks_font">按钮和链接</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/EntityLimits?type=CampaignMember&amp;setupid=CampaignMemberLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCampaignMember"
                                                                            id="CampaignMemberLimits_font">限制</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="Lead" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Lead%27%29" id="Lead_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 潜在客户 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 潜在客户 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Lead"
                                            class="setupFolder" id="Lead_font">潜在客户</a><div class="childContainer" style="display: none;"
                                                id="Lead_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Lead&amp;setupid=LeadFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead&amp;tableEnumOrId=Lead&amp;setupid=LeadLookups"
                                                        id="LeadLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead&amp;tableEnumOrId=Lead&amp;setupid=LeadValidations"
                                                        id="LeadValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Lead&amp;setupid=LeadLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead&amp;tableEnumOrId=Lead&amp;setupid=LeadFieldSets"
                                                        id="LeadFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead&amp;type=Lead&amp;setupid=LeadCompactLayouts"
                                                        id="LeadCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Lead&amp;setupid=LeadSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/own/entityrulelist.jsp?rtype=1&amp;entity=Lead&amp;setupid=LeadRules&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadRules_font">分配规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/sales/lead/LeadSetup/d?setupid=LeadSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadSettings_font">设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Lead&amp;type=Lead&amp;setupid=LeadLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadLinks_font">按钮、链接和操作</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Lead&amp;setupid=LeadLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/lead/leadcapture.jsp?setupid=LeadWebtoleads&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadWebtoleads_font">在线潜在客户</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/own/entityrulelist.jsp?rtype=4&amp;entity=Lead&amp;setupid=LeadResponses&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLead"
                                                        id="LeadResponses_font">自动响应规则</a></div>
                                            </div>
                            </div>
                            <div id="Account" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Account%27%29" id="Account_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 客户 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 客户 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Account"
                                            class="setupFolder" id="Account_font">客户</a><div class="childContainer" style="display: none;"
                                                id="Account_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Account&amp;setupid=AccountFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount"
                                                        id="AccountFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount&amp;tableEnumOrId=Account&amp;setupid=AccountLookups"
                                                        id="AccountLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount&amp;tableEnumOrId=Account&amp;setupid=AccountValidations"
                                                        id="AccountValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/picklist_masterdetail.jsp?tid=00I&amp;pt=17&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount&amp;setupid=AccountRoles"
                                                        id="AccountRoles_font">合作伙伴角色</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/picklist_masterdetail.jsp?tid=02Z&amp;pt=38&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount&amp;setupid=AccountContactRoles"
                                                        id="AccountContactRoles_font">联系人角色</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Account&amp;setupid=AccountLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount"
                                                        id="AccountLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount&amp;tableEnumOrId=Account&amp;setupid=AccountFieldSets"
                                                        id="AccountFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount&amp;type=Account&amp;setupid=AccountCompactLayouts"
                                                        id="AccountCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Account&amp;setupid=AccountSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount"
                                                        id="AccountSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Account&amp;type=Account&amp;setupid=AccountLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount"
                                                        id="AccountLinks_font">按钮、链接和操作</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Account&amp;setupid=AccountLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount"
                                                        id="AccountLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/accounts/accountSetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAccount&amp;setupid=AccountSettings"
                                                        id="AccountSettings_font">设置</a></div>
                                            </div>
                            </div>
                            <div id="Contact" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Contact%27%29" id="Contact_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 联系人 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 联系人 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Contact"
                                            class="setupFolder" id="Contact_font">联系人</a><div class="childContainer" style="display: none;"
                                                id="Contact_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Contact&amp;setupid=ContactFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact"
                                                        id="ContactFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact&amp;tableEnumOrId=Contact&amp;setupid=ContactLookups"
                                                        id="ContactLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact&amp;tableEnumOrId=Contact&amp;setupid=ContactValidations"
                                                        id="ContactValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Contact&amp;setupid=ContactLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact"
                                                        id="ContactLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact&amp;tableEnumOrId=Contact&amp;setupid=ContactFieldSets"
                                                        id="ContactFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact&amp;type=Contact&amp;setupid=ContactCompactLayouts"
                                                        id="ContactCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Contact&amp;setupid=ContactSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact"
                                                        id="ContactSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Contact&amp;type=Contact&amp;setupid=ContactLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact"
                                                        id="ContactLinks_font">按钮、链接和操作</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Contact&amp;setupid=ContactLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContact"
                                                        id="ContactLimits_font">限制</a></div>
                                            </div>
                            </div>
                            <div id="Opportunity" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Opportunity%27%29"
                                    id="Opportunity_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 业务机会 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 业务机会 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Opportunity"
                                            class="setupFolder" id="Opportunity_font">业务机会</a><div class="childContainer" style="display: none;"
                                                id="Opportunity_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Opportunity&amp;setupid=OpportunityFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity"
                                                        id="OpportunityFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity&amp;tableEnumOrId=Opportunity&amp;setupid=OpportunityLookups"
                                                        id="OpportunityLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity&amp;tableEnumOrId=Opportunity&amp;setupid=OpportunityValidations"
                                                        id="OpportunityValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/picklist_masterdetail.jsp?tid=00K&amp;pt=11&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity&amp;setupid=OpportunityRoles"
                                                        id="OpportunityRoles_font">联系人角色</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/picklist_masterdetail.jsp?tid=00J&amp;pt=35&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity&amp;setupid=OpportunityCompetitors"
                                                        id="OpportunityCompetitors_font">竞争对手</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Opportunity&amp;setupid=OpportunityLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity"
                                                        id="OpportunityLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity&amp;tableEnumOrId=Opportunity&amp;setupid=OpportunityFieldSets"
                                                        id="OpportunityFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity&amp;type=Opportunity&amp;setupid=OpportunityCompactLayouts"
                                                        id="OpportunityCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Opportunity&amp;setupid=OpportunitySearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity"
                                                        id="OpportunitySearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Opportunity&amp;type=Opportunity&amp;setupid=OpportunityLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity"
                                                        id="OpportunityLinks_font">按钮、链接和操作</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Opportunity&amp;setupid=OpportunityLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity"
                                                        id="OpportunityLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/opp/oppalertedit.jsp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity&amp;setupid=OpportunityAlerts"
                                                        id="OpportunityAlerts_font">大宗交易报警</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/opp/updatereminders.jsp?setupid=OpportunityUpdateReminders&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity"
                                                        id="OpportunityUpdateReminders_font">更新提醒</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/opp/oppSettings.jsp?setupid=OpportunitySettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunity"
                                                        id="OpportunitySettings_font">设置</a></div>
                                                <div id="OpportunityLineItem" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27OpportunityLineItem%27%29"
                                                        id="OpportunityLineItem_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 业务机会产品 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 业务机会产品 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=OpportunityLineItem"
                                                                class="setupFolder" id="OpportunityLineItem_font">业务机会产品</a><div class="childContainer"
                                                                    style="display: none;" id="OpportunityLineItem_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=OpportunityLineItem&amp;setupid=OpportunityLineItemFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem"
                                                                            id="OpportunityLineItemFields_font">字段</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem&amp;tableEnumOrId=OpportunityLineItem&amp;setupid=OpportunityLineItemValidations"
                                                                            id="OpportunityLineItemValidations_font">验证规则</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/PageLayouts?type=OpportunityLineItem&amp;setupid=OpportunityLineItemLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem"
                                                                            id="OpportunityLineItemLayouts_font">页面布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem&amp;tableEnumOrId=OpportunityLineItem&amp;setupid=OpportunityLineItemFieldSets"
                                                                            id="OpportunityLineItemFieldSets_font">字段集</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/EntityLimits?type=OpportunityLineItem&amp;setupid=OpportunityLineItemLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem"
                                                                            id="OpportunityLineItemLimits_font">限制</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem&amp;type=OpportunityLineItem&amp;setupid=OpportunityLineItemCompactLayouts"
                                                                            id="OpportunityLineItemCompactLayouts_font">紧凑布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/ListLayouts?type=PricebookEntry&amp;setupid=OpportunityLineItemSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem"
                                                                            id="OpportunityLineItemSearchLayouts_font">搜索布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/link/ActionButtonLinkList?pageName=OpportunityLineItem&amp;type=OpportunityLineItem&amp;setupid=OpportunityLineItemLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOpportunityLineItem"
                                                                            id="OpportunityLineItemLinks_font">按钮和链接</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="Quote" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Quote%27%29" id="Quote_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 报价 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 报价 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Quote"
                                            class="setupFolder" id="Quote_font">报价</a><div class="childContainer" style="display: none;"
                                                id="Quote_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Quote&amp;setupid=QuoteFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote"
                                                        id="QuoteFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote&amp;tableEnumOrId=Quote&amp;setupid=QuoteLookups"
                                                        id="QuoteLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote&amp;tableEnumOrId=Quote&amp;setupid=QuoteValidations"
                                                        id="QuoteValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Quote&amp;setupid=QuoteLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote"
                                                        id="QuoteLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote&amp;tableEnumOrId=Quote&amp;setupid=QuoteFieldSets"
                                                        id="QuoteFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote&amp;type=Quote&amp;setupid=QuoteCompactLayouts"
                                                        id="QuoteCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Quote&amp;setupid=QuoteSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote"
                                                        id="QuoteSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Quote&amp;type=Quote&amp;setupid=QuoteLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote"
                                                        id="QuoteLinks_font">按钮和链接</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Quote&amp;setupid=QuoteLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote"
                                                        id="QuoteLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/quote/QuoteTemplateLayouts?setupid=QuoteTemplateEditor&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote"
                                                        id="QuoteTemplateEditor_font">模板</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/quote/quoteSettings.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuote&amp;setupid=QuoteSettings"
                                                        id="QuoteSettings_font">设置</a></div>
                                                <div id="QuoteLineItem" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27QuoteLineItem%27%29"
                                                        id="QuoteLineItem_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 报价行项目 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 报价行项目 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=QuoteLineItem"
                                                                class="setupFolder" id="QuoteLineItem_font">报价行项目</a><div class="childContainer"
                                                                    style="display: none;" id="QuoteLineItem_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=QuoteLineItem&amp;setupid=QuoteLineItemFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuoteLineItem"
                                                                            id="QuoteLineItemFields_font">字段</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuoteLineItem&amp;tableEnumOrId=QuoteLineItem&amp;setupid=QuoteLineItemValidations"
                                                                            id="QuoteLineItemValidations_font">验证规则</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/PageLayouts?type=QuoteLineItem&amp;setupid=QuoteLineItemLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuoteLineItem"
                                                                            id="QuoteLineItemLayouts_font">页面布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuoteLineItem&amp;tableEnumOrId=QuoteLineItem&amp;setupid=QuoteLineItemFieldSets"
                                                                            id="QuoteLineItemFieldSets_font">字段集</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuoteLineItem&amp;type=QuoteLineItem&amp;setupid=QuoteLineItemCompactLayouts"
                                                                            id="QuoteLineItemCompactLayouts_font">紧凑布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/link/ActionButtonLinkList?pageName=QuoteLineItem&amp;type=QuoteLineItem&amp;setupid=QuoteLineItemLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuoteLineItem"
                                                                            id="QuoteLineItemLinks_font">按钮和链接</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/EntityLimits?type=QuoteLineItem&amp;setupid=QuoteLineItemLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuoteLineItem"
                                                                            id="QuoteLineItemLimits_font">限制</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="Forecasting3" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Forecasting3%27%29"
                                    id="Forecasting3_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 预测 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 预测 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Forecasting3"
                                            class="setupFolder" id="Forecasting3_font">预测</a><div class="childContainer" style="display: none;"
                                                id="Forecasting3_child">
                                                <div class="setupLeaf">
                                                    <a href="/_ui/sales/forecasting/ui/ForecastingSettingsPageAura?setupid=Forecasting3Settings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DForecasting3"
                                                        id="Forecasting3Settings_font">设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/forecasting/ForecastingRolePage?setupid=Forecasting3Role&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DForecasting3"
                                                        id="Forecasting3Role_font">预测层次结构</a></div>
                                            </div>
                            </div>
                            <div id="Case" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Case%27%29" id="Case_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 个案 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 个案 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Case"
                                            class="setupFolder" id="Case_font">个案</a><div class="childContainer" style="display: none;"
                                                id="Case_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Case&amp;setupid=CaseFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase&amp;tableEnumOrId=Case&amp;setupid=CaseLookups"
                                                        id="CaseLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase&amp;tableEnumOrId=Case&amp;setupid=CaseValidations"
                                                        id="CaseValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/picklist_masterdetail.jsp?tid=03j&amp;pt=45&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase&amp;setupid=CaseContactRoles"
                                                        id="CaseContactRoles_font">联系人角色</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Case&amp;setupid=CaseLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase&amp;tableEnumOrId=Case&amp;setupid=CaseFieldSets"
                                                        id="CaseFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase&amp;type=Case&amp;setupid=CaseCompactLayouts"
                                                        id="CaseCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Case&amp;setupid=CaseSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=CaseClose&amp;setupid=CaseCloseLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseCloseLayouts_font">个案关闭 布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/own/entityrulelist.jsp?rtype=1&amp;entity=Case&amp;setupid=CaseRules&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseRules_font">分配规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/own/entityrulelist.jsp?rtype=3&amp;entity=Case&amp;setupid=CaseEscRules&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseEscRules_font">升级规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Case&amp;type=Case&amp;setupid=CaseLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseLinks_font">按钮、链接和操作</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Case&amp;setupid=CaseLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/support/organization/SupportOrganizationSetupUi/d?setupid=CaseSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseSettings_font">支持设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/own/entityrulelist.jsp?rtype=4&amp;entity=Case&amp;setupid=CaseResponses&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="CaseResponses_font">自动响应规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/email/EmailToCaseSplashPage?setupid=EmailToCase&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCase"
                                                        id="EmailToCase_font">电子邮件转个案</a></div>
                                                <div id="QuickText" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27QuickText%27%29" id="QuickText_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 快速文本 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 快速文本 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=QuickText"
                                                                class="setupFolder" id="QuickText_font">快速文本</a><div class="childContainer" style="display: none;"
                                                                    id="QuickText_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/liveagent/quicktextsettings.apexp?setupid=QuickTextSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DQuickText"
                                                                            id="QuickTextSettings_font">设置</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="SelfService" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27SelfService%27%29"
                                    id="SelfService_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 自助 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 自助 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=SelfService"
                                            class="setupFolder" id="SelfService_font">自助</a><div class="childContainer" style="display: none;"
                                                id="SelfService_child">
                                                <div class="setupLeaf">
                                                    <a href="/setup/supp/publicsolutiondetail.jsp?setupid=PublicSolutionDetail&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSelfService"
                                                        id="PublicSolutionDetail_font">公共解决方案</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/cases/casecapture.jsp?setupid=CaseWebtocase&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSelfService"
                                                        id="CaseWebtocase_font">在线个案</a></div>
                                            </div>
                            </div>
                            <div id="CallCenterEdition" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27CallCenterEdition%27%29"
                                    id="CallCenterEdition_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Call Center - 级别 2"
                                        width="11" height="11" class="setupImage" title="展开 - Call Center - 级别 2" /></a><a
                                            href="/ui/setup/Setup?setupid=CallCenterEdition" class="setupFolder" id="CallCenterEdition_font">Call
                                            Center</a><div class="childContainer" style="display: none;" id="CallCenterEdition_child">
                                                <div class="setupLeaf">
                                                    <a href="/04v?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCallCenterEdition&amp;setupid=CallCenters"
                                                        id="CallCenters_font">Call Center</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/04m?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCallCenterEdition&amp;setupid=AdditionalDirectoryNumbers"
                                                        id="AdditionalDirectoryNumbers_font">目录数量</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/04n?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCallCenterEdition&amp;setupid=SoftphoneLayouts"
                                                        id="SoftphoneLayouts_font">SoftPhone 布局</a></div>
                                            </div>
                            </div>
                            <div id="Contract" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Contract%27%29" id="Contract_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 合同 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 合同 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Contract"
                                            class="setupFolder" id="Contract_font">合同</a><div class="childContainer" style="display: none;"
                                                id="Contract_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Contract&amp;setupid=ContractFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract"
                                                        id="ContractFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract&amp;tableEnumOrId=Contract&amp;setupid=ContractLookups"
                                                        id="ContractLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract&amp;tableEnumOrId=Contract&amp;setupid=ContractValidations"
                                                        id="ContractValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/ui/picklist_masterdetail.jsp?tid=02a&amp;pt=39&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract&amp;setupid=ContractContactRoles"
                                                        id="ContractContactRoles_font">联系人角色</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Contract&amp;setupid=ContractLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract"
                                                        id="ContractLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract&amp;tableEnumOrId=Contract&amp;setupid=ContractFieldSets"
                                                        id="ContractFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract&amp;type=Contract&amp;setupid=ContractCompactLayouts"
                                                        id="ContractCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Contract&amp;setupid=ContractSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract"
                                                        id="ContractSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Contract&amp;type=Contract&amp;setupid=ContractLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract"
                                                        id="ContractLinks_font">按钮和链接</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Contract&amp;setupid=ContractLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract"
                                                        id="ContractLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ctrc/contractsettings.jsp?setupid=ContractSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContract"
                                                        id="ContractSettings_font">设置</a></div>
                                            </div>
                            </div>
                            <div id="Order" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Order%27%29" id="Order_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 订单 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 订单 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Order"
                                            class="setupFolder" id="Order_font">订单</a><div class="childContainer" style="display: none;"
                                                id="Order_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Order&amp;setupid=OrderFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder"
                                                        id="OrderFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder&amp;tableEnumOrId=Order&amp;setupid=OrderValidations"
                                                        id="OrderValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Order&amp;setupid=OrderLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder"
                                                        id="OrderLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder&amp;type=Order&amp;setupid=OrderCompactLayouts"
                                                        id="OrderCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Order&amp;setupid=OrderSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder"
                                                        id="OrderSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Order&amp;type=Order&amp;setupid=OrderLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder"
                                                        id="OrderLinks_font">按钮和链接</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/rectype/RecordTypes?type=Order&amp;setupid=OrderRecords&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder"
                                                        id="OrderRecords_font">记录类型</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Order&amp;setupid=OrderLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder"
                                                        id="OrderLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/oe/orderSettings.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrder&amp;setupid=OrderSettings"
                                                        id="OrderSettings_font">设置</a></div>
                                                <div id="OrderItem" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27OrderItem%27%29" id="OrderItem_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 订单产品 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 订单产品 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=OrderItem"
                                                                class="setupFolder" id="OrderItem_font">订单产品</a><div class="childContainer" style="display: none;"
                                                                    id="OrderItem_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=OrderItem&amp;setupid=OrderItemFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrderItem"
                                                                            id="OrderItemFields_font">字段</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrderItem&amp;tableEnumOrId=OrderItem&amp;setupid=OrderItemValidations"
                                                                            id="OrderItemValidations_font">验证规则</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/PageLayouts?type=OrderItem&amp;setupid=OrderItemLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrderItem"
                                                                            id="OrderItemLayouts_font">页面布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrderItem&amp;type=OrderItem&amp;setupid=OrderItemCompactLayouts"
                                                                            id="OrderItemCompactLayouts_font">紧凑布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/ListLayouts?type=PricebookEntry&amp;setupid=OrderItemSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrderItem"
                                                                            id="OrderItemSearchLayouts_font">搜索布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/link/ActionButtonLinkList?pageName=OrderItem&amp;type=OrderItem&amp;setupid=OrderItemLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrderItem"
                                                                            id="OrderItemLinks_font">按钮和链接</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/EntityLimits?type=OrderItem&amp;setupid=OrderItemLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DOrderItem"
                                                                            id="OrderItemLimits_font">限制</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="Solutions" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Solutions%27%29" id="Solutions_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 解决方案 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 解决方案 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Solutions"
                                            class="setupFolder" id="Solutions_font">解决方案</a><div class="childContainer" style="display: none;"
                                                id="Solutions_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Solution&amp;setupid=SolutionFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions"
                                                        id="SolutionFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions&amp;tableEnumOrId=Solution&amp;setupid=SolutionValidations"
                                                        id="SolutionValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Solution&amp;setupid=SolutionLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions"
                                                        id="SolutionLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions&amp;tableEnumOrId=Solution&amp;setupid=SolutionFieldSets"
                                                        id="SolutionFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions&amp;type=Solution&amp;setupid=SolutionCompactLayouts"
                                                        id="SolutionCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Solution&amp;setupid=SolutionSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions"
                                                        id="SolutionSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Solution&amp;type=Solution&amp;setupid=SolutionLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions"
                                                        id="SolutionLinks_font">按钮和链接</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/category/CategoryTreeEditorPage?cldb=1&amp;cekey=501&amp;setupid=SolutionCategories&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions"
                                                        id="SolutionCategories_font">解决方案类别</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Solution&amp;setupid=SolutionLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions"
                                                        id="SolutionLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/support/organization/SolutionSettings/d?setupid=SolutionSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSolutions"
                                                        id="SolutionSettings_font">解决方案设置</a></div>
                                            </div>
                            </div>
                            <div id="Products" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Products%27%29" id="Products_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 产品 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 产品 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Products"
                                            class="setupFolder" id="Products_font">产品</a><div class="childContainer" style="display: none;"
                                                id="Products_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Product2&amp;setupid=Product2Fields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts"
                                                        id="Product2Fields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts&amp;tableEnumOrId=Product2&amp;setupid=Product2Lookups"
                                                        id="Product2Lookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts&amp;tableEnumOrId=Product2&amp;setupid=Product2Validations"
                                                        id="Product2Validations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Product2&amp;setupid=Product2Layouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts"
                                                        id="Product2Layouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts&amp;tableEnumOrId=Product2&amp;setupid=Product2FieldSets"
                                                        id="Product2FieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts&amp;type=Product2&amp;setupid=Product2CompactLayouts"
                                                        id="Product2CompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Product2&amp;setupid=Product2SearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts"
                                                        id="Product2SearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Product2&amp;type=Product2&amp;setupid=Product2Links&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts"
                                                        id="Product2Links_font">按钮和链接</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Product2&amp;setupid=Product2Limits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts"
                                                        id="Product2Limits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/pbk/orgAnnuityEnable.jsp?setupid=Product2ScheduleSetup&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts"
                                                        id="Product2ScheduleSetup_font">计划设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/pbk/productSettings.jsp?setupid=Product2Settings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DProducts"
                                                        id="Product2Settings_font">设置</a></div>
                                            </div>
                            </div>
                            <div id="Pricebook" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Pricebook%27%29" id="Pricebook_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 价格手册 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 价格手册 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Pricebook"
                                            class="setupFolder" id="Pricebook_font">价格手册</a><div class="childContainer" style="display: none;"
                                                id="Pricebook_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Pricebook2&amp;setupid=Pricebook2Fields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook"
                                                        id="Pricebook2Fields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Pricebook2&amp;setupid=Pricebook2Layouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook"
                                                        id="Pricebook2Layouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook&amp;tableEnumOrId=Pricebook2&amp;setupid=Pricebook2Validations"
                                                        id="Pricebook2Validations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/ApexTriggerList?type=Pricebook2&amp;setupid=Pricebook2Triggers&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook"
                                                        id="Pricebook2Triggers_font">触发器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook&amp;tableEnumOrId=Pricebook2&amp;setupid=Pricebook2FieldSets"
                                                        id="Pricebook2FieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Pricebook2&amp;setupid=Pricebook2SearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook"
                                                        id="Pricebook2SearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/rectype/RecordTypes?type=Pricebook2&amp;setupid=Pricebook2Records&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook"
                                                        id="Pricebook2Records_font">记录类型</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Pricebook2&amp;setupid=Pricebook2Limits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebook"
                                                        id="Pricebook2Limits_font">限制</a></div>
                                                <div id="PricebookEntry" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27PricebookEntry%27%29"
                                                        id="PricebookEntry_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 价格手册条目 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 价格手册条目 - 级别 3" /></a><span><a href="/ui/setup/Setup?setupid=PricebookEntry"
                                                                class="setupFolder" id="PricebookEntry_font">价格手册条目</a><span class="newFlag">新！</span></span><div
                                                                    class="childContainer" style="display: none;" id="PricebookEntry_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=PricebookEntry&amp;setupid=PricebookEntryFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebookEntry"
                                                                            id="PricebookEntryFields_font">字段</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebookEntry&amp;tableEnumOrId=PricebookEntry&amp;setupid=PricebookEntryValidations"
                                                                            id="PricebookEntryValidations_font">验证规则</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/PageLayouts?type=PricebookEntry&amp;setupid=PricebookEntryLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebookEntry"
                                                                            id="PricebookEntryLayouts_font">页面布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebookEntry&amp;tableEnumOrId=PricebookEntry&amp;setupid=PricebookEntryFieldSets"
                                                                            id="PricebookEntryFieldSets_font">字段集</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/ListLayouts?type=PricebookEntry&amp;setupid=PricebookEntrySearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebookEntry"
                                                                            id="PricebookEntrySearchLayouts_font">搜索布局</a></div>
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/custent/EntityLimits?type=PricebookEntry&amp;setupid=PricebookEntryLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPricebookEntry"
                                                                            id="PricebookEntryLimits_font">限制</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="PartnerNetwork" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27PartnerNetwork%27%29"
                                    id="PartnerNetwork_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Salesforce 至 Salesforce - 级别 2"
                                        width="11" height="11" class="setupImage" title="展开 - Salesforce 至 Salesforce - 级别 2" /></a><a
                                            href="/ui/setup/Setup?setupid=PartnerNetwork" class="setupFolder" id="PartnerNetwork_font">Salesforce
                                            至 Salesforce</a><div class="childContainer" style="display: none;" id="PartnerNetwork_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/pnetwork/PartnerNetworkEnable/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPartnerNetwork&amp;setupid=PartnerNetworkEnable"
                                                        id="PartnerNetworkEnable_font">设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/org/PartnerNetworkSurveySettingsPage/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DPartnerNetwork&amp;setupid=PartnerNetworkSurvey"
                                                        id="PartnerNetworkSurvey_font">连接查找器</a></div>
                                            </div>
                            </div>
                            <div id="WorkDotComObjectsNode" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27WorkDotComObjectsNode%27%29"
                                    id="WorkDotComObjectsNode_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Work.com - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - Work.com - 级别 2" /></a><a href="/ui/setup/Setup?setupid=WorkDotComObjectsNode"
                                            class="setupFolder" id="WorkDotComObjectsNode_font">Work.com</a><div class="childContainer"
                                                style="display: none;" id="WorkDotComObjectsNode_child">
                                                <div class="setupLeaf">
                                                    <a href="/work/workSettings.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DWorkDotComObjectsNode&amp;setupid=WorkSetup"
                                                        id="WorkSetup_font">设置</a></div>
                                                <div id="WorkBadge" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27WorkBadge%27%29" id="WorkBadge_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 徽章 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 徽章 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=WorkBadge"
                                                                class="setupFolder" id="WorkBadge_font">徽章</a><div class="childContainer" style="display: none;"
                                                                    id="WorkBadge_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=WorkBadge&amp;setupid=WorkBadgeFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DWorkBadge"
                                                                            id="WorkBadgeFields_font">字段</a></div>
                                                                </div>
                                                </div>
                                                <div id="WorkBadgeDefinition" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27WorkBadgeDefinition%27%29"
                                                        id="WorkBadgeDefinition_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 徽章定义 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 徽章定义 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=WorkBadgeDefinition"
                                                                class="setupFolder" id="WorkBadgeDefinition_font">徽章定义</a><div class="childContainer"
                                                                    style="display: none;" id="WorkBadgeDefinition_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=WorkBadgeDefinition&amp;setupid=WorkBadgeDefinitionFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DWorkBadgeDefinition"
                                                                            id="WorkBadgeDefinitionFields_font">字段</a></div>
                                                                </div>
                                                </div>
                                                <div id="WorkThanks" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27WorkThanks%27%29"
                                                        id="WorkThanks_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 谢谢 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 谢谢 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=WorkThanks"
                                                                class="setupFolder" id="WorkThanks_font">谢谢</a><div class="childContainer" style="display: none;"
                                                                    id="WorkThanks_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/p/setup/layout/LayoutFieldList?type=WorkThanks&amp;setupid=WorkThanksFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DWorkThanks"
                                                                            id="WorkThanksFields_font">字段</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="Ideas" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Ideas%27%29" id="Ideas_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 意见 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 意见 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Ideas"
                                            class="setupFolder" id="Ideas_font">意见</a><div class="childContainer" style="display: none;"
                                                id="Ideas_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DIdeas&amp;tableEnumOrId=Idea&amp;setupid=IdeaFieldSets"
                                                        id="IdeaFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/idea/IdeaSettingsUI/d?setupid=IdeasSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DIdeas"
                                                        id="IdeasSettings_font">设置</a></div>
                                            </div>
                            </div>
                            <div id="Asset" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Asset%27%29" id="Asset_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 资产 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 资产 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Asset"
                                            class="setupFolder" id="Asset_font">资产</a><div class="childContainer" style="display: none;"
                                                id="Asset_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=Asset&amp;setupid=AssetFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset"
                                                        id="AssetFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset&amp;tableEnumOrId=Asset&amp;setupid=AssetLookups"
                                                        id="AssetLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset&amp;tableEnumOrId=Asset&amp;setupid=AssetValidations"
                                                        id="AssetValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=Asset&amp;setupid=AssetLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset"
                                                        id="AssetLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset&amp;tableEnumOrId=Asset&amp;setupid=AssetFieldSets"
                                                        id="AssetFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset&amp;type=Asset&amp;setupid=AssetCompactLayouts"
                                                        id="AssetCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=Asset&amp;setupid=AssetSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset"
                                                        id="AssetSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=Asset&amp;setupid=AssetLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset"
                                                        id="AssetLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Asset&amp;type=Asset&amp;setupid=AssetLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAsset"
                                                        id="AssetLinks_font">按钮和链接</a></div>
                                            </div>
                            </div>
                            <div id="UserCustomize" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27UserCustomize%27%29"
                                    id="UserCustomize_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 用户 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 用户 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=UserCustomize"
                                            class="setupFolder" id="UserCustomize_font">用户</a><div class="childContainer" style="display: none;"
                                                id="UserCustomize_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/layout/LayoutFieldList?type=User&amp;setupid=UserFields&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize"
                                                        id="UserFields_font">字段</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/PageLayouts?type=User&amp;setupid=UserLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize"
                                                        id="UserLayouts_font">页面布局</a></div>
                                                <div class="setupLeaf">
                                                    <span><a href="/ui/setup/layout/PageLayouts?type=UserAlt&amp;setupid=UserAltLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize"
                                                        id="UserAltLayouts_font">用户简档 布局</a><span class="newFlag">新！</span></span></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/RelatedLookupFiltersListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize&amp;tableEnumOrId=User&amp;setupid=UserLookups"
                                                        id="UserLookups_font">相关查找筛选器</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/ValidationFormulaListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize&amp;tableEnumOrId=User&amp;setupid=UserValidations"
                                                        id="UserValidations_font">验证规则</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/FieldSetListUI/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize&amp;tableEnumOrId=User&amp;setupid=UserFieldSets"
                                                        id="UserFieldSets_font">字段集</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/common/config/compactlayout/CompactLayoutListUi/d?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize&amp;type=User&amp;setupid=UserCompactLayouts"
                                                        id="UserCompactLayouts_font">紧凑布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/layout/ListLayouts?type=User&amp;setupid=UserSearchLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize"
                                                        id="UserSearchLayouts_font">搜索布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/custent/EntityLimits?type=User&amp;setupid=UserLimits&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize"
                                                        id="UserLimits_font">限制</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=User&amp;type=User&amp;setupid=UserLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DUserCustomize"
                                                        id="UserLinks_font">自定义链接</a></div>
                                            </div>
                            </div>
                            <div id="AgentConsoleSetup" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27AgentConsoleSetup%27%29"
                                    id="AgentConsoleSetup_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 代理控制台 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 代理控制台 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=AgentConsoleSetup"
                                            class="setupFolder" id="AgentConsoleSetup_font">代理控制台</a><div class="childContainer"
                                                style="display: none;" id="AgentConsoleSetup_child">
                                                <div class="setupLeaf">
                                                    <a href="/_ui/support/organization/AgentDesktopSettings/d?setupid=AgentConsole&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAgentConsoleSetup"
                                                        id="AgentConsole_font">控制台布局</a></div>
                                            </div>
                            </div>
                            <div id="Content" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Content%27%29" id="Content_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Salesforce CRM Content - 级别 2"
                                        width="11" height="11" class="setupImage" title="展开 - Salesforce CRM Content - 级别 2" /></a><a
                                            href="/ui/setup/Setup?setupid=Content" class="setupFolder" id="Content_font">Salesforce
                                            CRM Content</a><div class="childContainer" style="display: none;" id="Content_child">
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/org/ContentSettingsPage/d?setupid=ContentSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContent"
                                                        id="ContentSettings_font">设置</a></div>
                                            </div>
                            </div>
                            <div id="ContentDistribution" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27ContentDistribution%27%29"
                                    id="ContentDistribution_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 内容递送 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 内容递送 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=ContentDistribution"
                                            class="setupFolder" id="ContentDistribution_font">内容递送</a><div class="childContainer"
                                                style="display: none;" id="ContentDistribution_child">
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/org/ContentDistributionEnablePage/d?setupid=ContentDistributionEnable&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DContentDistribution"
                                                        id="ContentDistributionEnable_font">设置</a></div>
                                            </div>
                            </div>
                            <div id="Tagging" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Tagging%27%29" id="Tagging_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 标记 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 标记 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Tagging"
                                            class="setupFolder" id="Tagging_font">标记</a><div class="childContainer" style="display: none;"
                                                id="Tagging_child">
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/org/TagSettingsPage?setupid=SetupTagging&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DTagging"
                                                        id="SetupTagging_font">标记设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/user/SelectSearch?setupid=TagCleanup&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DTagging"
                                                        id="TagCleanup_font">个人标记清理</a></div>
                                            </div>
                            </div>
                            <div id="ReportsAndDashboards" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27ReportsAndDashboards%27%29"
                                    id="ReportsAndDashboards_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 报表和仪表板 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 报表和仪表板 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=ReportsAndDashboards"
                                            class="setupFolder" id="ReportsAndDashboards_font">报表和仪表板</a><div class="childContainer"
                                                style="display: none;" id="ReportsAndDashboards_child">
                                                <div class="setupLeaf">
                                                    <a href="/ui/rpt/ReportUISettingsPage?setupid=ReportUI&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DReportsAndDashboards"
                                                        id="ReportUI_font">用户界面</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/ui/rpt/AnalyticsSharingSettingsPage?setupid=SharingAnalytics&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DReportsAndDashboards"
                                                        id="SharingAnalytics_font">文件夹共享</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/identity/authconfig/sessionLevelPolicySetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DReportsAndDashboards&amp;setupid=SessionLevelPolicyUI"
                                                        id="SessionLevelPolicyUI_font">访问策略</a></div>
                                            </div>
                            </div>
                            <div id="Search" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Search%27%29" id="Search_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 搜索 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 搜索 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Search"
                                            class="setupFolder" id="Search_font">搜索</a><div class="childContainer" style="display: none;"
                                                id="Search_child">
                                                <div class="setupLeaf">
                                                    <a href="/ui/setup/org/SearchSettingsPage?setupid=SearchSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSearch"
                                                        id="SearchSettings_font">搜索设置</a></div>
                                            </div>
                            </div>
                            <div id="Collaboration" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Collaboration%27%29"
                                    id="Collaboration_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - Chatter - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - Chatter - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Collaboration"
                                            class="setupFolder" id="Collaboration_font">Chatter</a><div class="childContainer"
                                                style="display: none;" id="Collaboration_child">
                                                <div class="setupLeaf">
                                                    <a href="/collaboration/collaborationSettings.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCollaboration&amp;setupid=CollaborationSettings"
                                                        id="CollaborationSettings_font">设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/setup/globalPublisherLayoutRedirect.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCollaboration&amp;setupid=ChatterLayouts"
                                                        id="ChatterLayouts_font">发布者布局</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/feeds/feedTracking.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCollaboration&amp;setupid=FeedTracking"
                                                        id="FeedTracking_font">摘要跟踪</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/chatternow/chatternowSettings.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCollaboration&amp;setupid=ChatterNowSettings"
                                                        id="ChatterNowSettings_font">聊天设置</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/sbi/setup/InfluenceSettingsPage?setupid=InfluenceSettings&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCollaboration"
                                                        id="InfluenceSettings_font">影响力</a></div>
                                                <div class="setupLeaf">
                                                    <a href="/_ui/core/chatter/email/ui/ChatterEmailSettings/e?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCollaboration&amp;setupid=ChatterEmailSettings"
                                                        id="ChatterEmailSettings_font">电子邮件设置</a></div>
                                                <div id="CollaborationGroup" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27CollaborationGroup%27%29"
                                                        id="CollaborationGroup_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 小组 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 小组 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=CollaborationGroup"
                                                                class="setupFolder" id="CollaborationGroup_font">小组</a><div class="childContainer"
                                                                    style="display: none;" id="CollaborationGroup_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/layout/PageLayouts?type=CollaborationGroup&amp;setupid=CollaborationGroupLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCollaborationGroup"
                                                                            id="CollaborationGroupLayouts_font">小组布局</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="SocialAppsIntegration" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27SocialAppsIntegration%27%29"
                                    id="SocialAppsIntegration_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 社交应用程序集成 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 社交应用程序集成 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=SocialAppsIntegration"
                                            class="setupFolder" id="SocialAppsIntegration_font">社交应用程序集成</a><div class="childContainer"
                                                style="display: none;" id="SocialAppsIntegration_child">
                                                <div id="SocialProfilesOrg" class="parent">
                                                    <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27SocialProfilesOrg%27%29"
                                                        id="SocialProfilesOrg_icon">
                                                        <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 社交客户和联系人 - 级别 3" width="11"
                                                            height="11" class="setupImage" title="展开 - 社交客户和联系人 - 级别 3" /></a><a href="/ui/setup/Setup?setupid=SocialProfilesOrg"
                                                                class="setupFolder" id="SocialProfilesOrg_font">社交客户和联系人</a><div class="childContainer"
                                                                    style="display: none;" id="SocialProfilesOrg_child">
                                                                    <div class="setupLeaf">
                                                                        <a href="/ui/setup/socialcrm/SocialProfilesOrgSettingsPage?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DSocialProfilesOrg&amp;setupid=SocialProfileOrgSettings"
                                                                            id="SocialProfileOrgSettings_font">设置</a></div>
                                                                </div>
                                                </div>
                                            </div>
                            </div>
                            <div id="Topic" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Topic%27%29" id="Topic_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 主题 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 主题 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=Topic"
                                            class="setupFolder" id="Topic_font">主题</a><div class="childContainer" style="display: none;"
                                                id="Topic_child">
                                                <div class="setupLeaf">
                                                    <a href="/topics/topicsSetup.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DTopic&amp;setupid=TopicRecords"
                                                        id="TopicRecords_font">对象主题</a></div>
                                            </div>
                            </div>
                            <div class="setupLeaf">
                                <a href="/ui/setup/org/UserInterfaceUI?setupid=UserInterface&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DCustomize"
                                    id="UserInterface_font">用户界面</a></div>
                        </div>
        </div>
        <div id="DevTools" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27DevTools%27%29" id="DevTools_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 创建 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 创建 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=DevTools"
                        class="setupFolder" id="DevTools_font">创建</a><div class="childContainer" style="display: none;"
                            id="DevTools_child">
                            <div class="setupLeaf">
                                <a href="/02u?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevTools&amp;setupid=TabSet"
                                    id="TabSet_font">应用程序</a></div>
                            <div class="setupLeaf">
                                <a href="/101?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevTools&amp;setupid=ExternalStrings"
                                    id="ExternalStrings_font">自定义标签</a></div>
                            <div class="setupLeaf">
                                <a href="/p/setup/custent/CustomObjectsPage?setupid=CustomObjects&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevTools"
                                    id="CustomObjects_font">对象</a></div>
                            <div class="setupLeaf">
                                <a href="/0A2?setupid=Package&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevTools"
                                    id="Package_font">软件包</a></div>
                            <div class="setupLeaf">
                                <a href="/_ui/analytics/crt/setup/CustomReportTypeSplashUi?setupid=CustomReportTypes&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevTools"
                                    id="CustomReportTypes_font">报表类型</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/ui/customtabs.jsp?setupid=CustomTabs&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevTools"
                                    id="CustomTabs_font">选项卡</a></div>
                            <div id="GlobalActions" class="parent">
                                <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27GlobalActions%27%29"
                                    id="GlobalActions_icon">
                                    <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 全局操作 - 级别 2" width="11"
                                        height="11" class="setupImage" title="展开 - 全局操作 - 级别 2" /></a><a href="/ui/setup/Setup?setupid=GlobalActions"
                                            class="setupFolder" id="GlobalActions_font">全局操作</a><div class="childContainer" style="display: none;"
                                                id="GlobalActions_child">
                                                <div class="setupLeaf">
                                                    <a href="/p/setup/link/ActionButtonLinkList?pageName=Global&amp;type=Global&amp;setupid=GlobalActionLinks&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DGlobalActions"
                                                        id="GlobalActionLinks_font">操作</a></div>
                                                <div class="setupLeaf">
                                                    <span><a href="/ui/setup/layout/PageLayouts?type=Global&amp;setupid=GlobalPublisherLayouts&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DGlobalActions"
                                                        id="GlobalPublisherLayouts_font">发布者布局</a><span class="newFlag">新！</span></span></div>
                                            </div>
                            </div>
                        </div>
        </div>
        <div id="DevToolsIntegrate" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27DevToolsIntegrate%27%29"
                id="DevToolsIntegrate_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 发展 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 发展 - 级别 1" /></a><a href="/setup/integratesplash.jsp?setupid=DevToolsIntegrate&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DDevToolsIntegrate"
                        class="setupFolder" id="DevToolsIntegrate_font">发展</a><div class="childContainer"
                            style="display: none;" id="DevToolsIntegrate_child">
                            <div class="setupLeaf">
                                <a href="/setup/integratesplash.jsp?setupid=WebServices&amp;retURL=%2Fsetup%2Fbuild%2Fwebservices.apexp%3Fsetupid%3DWebServices%26retURL%3D%252Fsetup%252Fintegratesplash.jsp%253Fsetupid%253DDevToolsIntegrate%2526retURL%253D%25252Fui%25252Fsetup%25252FSetup%25253Fsetupid%25253DDevToolsIntegrate"
                                    id="WebServices_font">API</a></div>
                            <div class="setupLeaf">
                                <a href="/apexpages/setup/listApexComponent.apexp?retURL=%2Fsetup%2Fintegratesplash.jsp%3Fsetupid%3DDevToolsIntegrate%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DDevToolsIntegrate&amp;setupid=ApexComponents"
                                    id="ApexComponents_font">组件</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/ui/listCustomSettings.apexp?retURL=%2Fsetup%2Fintegratesplash.jsp%3Fsetupid%3DDevToolsIntegrate%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DDevToolsIntegrate&amp;setupid=CustomSettings"
                                    id="CustomSettings_font">自定义设置</a></div>
                            <div class="setupLeaf">
                                <a href="/email/admin/listEmailServicesFunction.apexp?retURL=%2Fsetup%2Fintegratesplash.jsp%3Fsetupid%3DDevToolsIntegrate%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DDevToolsIntegrate&amp;setupid=EmailToApexFunction"
                                    id="EmailToApexFunction_font">电子邮件服务</a></div>
                            <div class="setupLeaf">
                                <a href="/apexpages/setup/listApexPage.apexp?retURL=%2Fsetup%2Fintegratesplash.jsp%3Fsetupid%3DDevToolsIntegrate%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DDevToolsIntegrate&amp;setupid=ApexPages"
                                    id="ApexPages_font">页</a></div>
                            <div class="setupLeaf">
                                <a href="/apexpages/setup/listStaticResource.apexp?retURL=%2Fsetup%2Fintegratesplash.jsp%3Fsetupid%3DDevToolsIntegrate%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DDevToolsIntegrate&amp;setupid=StaticResources"
                                    id="StaticResources_font">静态资源</a></div>
                            <div class="setupLeaf">
                                <a href="/888?setupid=RemoteAccess&amp;retURL=%2Fsetup%2Fintegratesplash.jsp%3Fsetupid%3DDevToolsIntegrate%26retURL%3D%252Fui%252Fsetup%252FSetup%253Fsetupid%253DDevToolsIntegrate"
                                    id="RemoteAccess_font">远程访问</a></div>
                        </div>
        </div>
        <div class="setupLeaf">
            <a href="/_ui/platform/schema/ui/schemabuilder/SchemaBuilderUi?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DStudio&amp;setupid=SchemaBuilder"
                id="SchemaBuilder_font">方案生成器</a></div>
        <div class="setupLeaf">
            <a href="/_ui/force/canvas/ui/CanvasPreviewerUi?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DStudio&amp;setupid=CanvasPreviewerUi"
                id="CanvasPreviewerUi_font">画布应用程序预览器</a></div>
        <div class="setupLeaf">
            <a href="/0A3?setupid=ImportedPackage&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DStudio"
                id="ImportedPackage_font">已安装的软件包</a></div>
        <div class="setupLeaf">
            <a href="/packaging/viewAEMarketplace.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DStudio&amp;setupid=AppExchangeMarketplace"
                id="AppExchangeMarketplace_font">AppExchange 市场</a></div>
        <div class="setupLeaf">
            <a href="/ruac/ruacPage.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DStudio&amp;setupid=CriticalUpdates"
                id="CriticalUpdates_font">重要更新</a></div>
        <div class="setupNavtree">
            <h2>
                <a href="/ui/setup/Setup?setupid=Monitoring" class="setupSection" id="Monitoring_font">
                    监视</a></h2>
        </div>
        <div class="setupLeaf">
            <a href="/setup/systemOverview.apexp?setupid=SystemOverview&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DMonitoring"
                id="SystemOverview_font">系统概览</a></div>
        <div class="setupLeaf">
            <a href="/setup/imp/importqueue.jsp?setupid=DataManagementContactsQueue&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DMonitoring"
                id="DataManagementContactsQueue_font">导入</a></div>
        <div class="setupLeaf">
            <a href="/setup/own/massdelete.jsp?ftype=CaseEscalation&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DMonitoring&amp;setupid=DataManagementManageCaseEscalation"
                id="DataManagementManageCaseEscalation_font">个案升级</a></div>
        <div class="setupLeaf">
            <a href="/07A?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DMonitoring&amp;setupid=MassMailMonitoring"
                id="MassMailMonitoring_font">批量发送电子邮件</a></div>
        <div id="Jobs" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Jobs%27%29" id="Jobs_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 作业 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 作业 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=Jobs"
                        class="setupFolder" id="Jobs_font">作业</a><div class="childContainer" style="display: none;"
                            id="Jobs_child">
                            <div class="setupLeaf">
                                <a href="/08e?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DJobs&amp;setupid=ScheduledJobs"
                                    id="ScheduledJobs_font">计划的作业</a></div>
                            <div class="setupLeaf">
                                <a href="/apexpages/setup/listAsyncApexJobs.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DJobs&amp;setupid=AsyncApexJobs"
                                    id="AsyncApexJobs_font">Apex 作业</a></div>
                            <div class="setupLeaf">
                                <a href="/0Ys?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DJobs&amp;setupid=ParallelJobsStatus"
                                    id="ParallelJobsStatus_font">后台作业</a></div>
                            <div class="setupLeaf">
                                <a href="/750?setupid=AsyncApiJobStatus&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DJobs"
                                    id="AsyncApiJobStatus_font">批量数据加载作业</a></div>
                        </div>
        </div>
        <div id="Logs" class="parent">
            <a href="javascript:HTMLTreeNode.prototype.toggleHTMLTree%28%27Logs%27%29" id="Logs_icon">
                <img src="/img/alohaSkin/setup/setup_plus_lev1.gif" alt="展开 - 日志 - 级别 1" width="11"
                    height="11" class="setupImage" title="展开 - 日志 - 级别 1" /></a><a href="/ui/setup/Setup?setupid=Logs"
                        class="setupFolder" id="Logs_font">日志</a><div class="childContainer" style="display: none;"
                            id="Logs_child">
                            <div class="setupLeaf">
                                <a href="/_ui/core/email/logs/EmailLogSearchOverview?setupid=EmailLogFiles&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLogs"
                                    id="EmailLogFiles_font">电子邮件日志文件</a></div>
                            <div class="setupLeaf">
                                <a href="/setup/ui/listApexTraces.apexp?retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DLogs&amp;setupid=ApexDebugLogs"
                                    id="ApexDebugLogs_font">调试日志</a></div>
                        </div>
        </div>
        <div class="setupNavtree">
            <h2>
                <a href="/ui/setup/Setup?setupid=AppStore" class="setupSection" id="AppStore_font">Checkout</a></h2>
        </div>
        <img src="/img/tree/empty.gif" alt="" width="9" height="9" class="setupImage" title="" /><a
            href="/ui/setup/store/AppStoreSummaryPage?setupid=AppStoreSummary&amp;retURL=%2Fui%2Fsetup%2FSetup%3Fsetupid%3DAppStore"
            class="setupFolder" id="AppStoreSummary_font">Checkout摘要</a></div>
    <script>        new SetupTreeNode("AutoNumber5", "setupSearch");
    </script>
</div>