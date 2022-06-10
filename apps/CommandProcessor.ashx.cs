using System;
using System.Drawing;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Runtime.Remoting;
using System.IO;
using System.Data;
using System.Text;

using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;

using Supermore;
using Supermore.Configuration;
using Supermore.Contents;
using Supermore.Data;
//using Supermore.Data.Entities;
using Supermore.Data.Query;
using Supermore.Emails;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.IO;
using Supermore.Files;
using Supermore.Security;
using Supermore.Security.Accounts;
using Supermore.Web.UI.WebControls;
using Supermore.Media;
//using OA.Web.Servlets;
using OA.Web.UI.WebControls;
using Youyou.Plans;
using Supermore.EntityFramework;


using Supermore.Mobile;
using Supermore.Workflow;
using Supermore.Messenger;
using Supermore.HR.Employees;
using Supermore.Organization;
using Supermore.Actions;
using Youyou.Contents;
using Youyou.Calendars;
using Youyou.Calendars.Models;
using Youyou.Meetings;
using Youyou.Workflow.Actions;
using Youyou.Security.Actions;
using Youyou.Reports.Actions;
using Youyou.Entities.Actions;
using Youyou.Worklogs.Actions;

namespace WebClient.apps
{
    /// <summary>
    /// Summary description for CommandProcessor1
    /// </summary>
    public class CommandProcessor : IHttpHandler
    {

        HttpContext _context = null;
        CallContext _caller = null;
        string id = "";

        public bool IsReusable
        {
            get { return false; }
        }
        string result = "";
        public void ProcessRequest(HttpContext context)
        {
            _context = context;
            string docId = context.Request["docid"];
            id = context.Request["id"];
            string commandName = context.Request["cmd"];
            _caller = AppDataSource.GetCallContext();
            string[] arrs = null;
            string name = "";
            string desc = "";
            string path = "";
            switch (commandName.ToLower())
            {
                case "islogin":
                    if (_caller != null)
                    {
                        string token = Request["token"];
                        string logstatus = "0";
                        if (!string.IsNullOrEmpty(token))
                        {
                            logstatus = "1";
                        }
                        //(WebContext.IsLoggedIn ? "1" : "0")
                        //if (context.Session["web_user_status"] != null)
                        //{
                        result = "{\"IsLogin\":\"" + logstatus + "\",\"UserName\":\"" + _caller.UserName + "\",\"FullName\":\"" + _caller.FullName + "\",\"EmployeeId\":\"" + _caller.EmployeeId + "\"" + ",\"id\":\"" + _caller.UserID + "\"}";
                        //}
                        //else
                        //    result = "{\"IsLogin\":\"0\",\"UserName\":\"\"}";
                    }
                    else
                        result = "{\"IsLogin\":\"0\",\"UserName\":\"\"}";
                    break;
                case "user.info.get":
                    result = "{\"userName\":\"" + _caller.UserName + "\",\"fullName\":\"" + _caller.FullName + "\",\"employeeId\":\"" + _caller.EmployeeId + "\"" + ",\"userId\":\"" + _caller.UserID + "\"}";
                    break;
                case "entity.autocomplete.lookup":
                    //result = "{\"query\":\"河\",\"suggestions\":[{\"data\":\"hn\",\"value\":\"河南\"},{\"data\":\"zz\",\"value\":\"郑州\"}] }";
                    int objCode = MainUtil.GetInt(context.Request["objectTypeCode"], 0);
                    EntityAutocompleteLookup autocompleteLookup = new EntityAutocompleteLookup(_caller, context.Request["query"], objCode);
                    result = autocompleteLookup.Lookup();
                    break;
                case "schedulingbusytimes":
                    result = "while(1);\n";
                    result += "{\"timezone\":\"CDT (China)\",\"busyblocks\":[{\"userbusyblocks\":[],\"userid\":\"0059000000390Wh\"}],\"date\":\"2014-11-24T00:00:00\"}";
                    break;
                #region UI
                case "bindgrid":
                    string sdp = this.Request["dp"];
                    string pageNum = Request["pageNumber"];
                    string pageSize = Request["pageSize"];
                    string assemblyName = "WebControls";
                    string className = "Supermore.Web.UI.WebControls." + sdp;
                    ObjectHandle handle = Activator.CreateInstance(assemblyName, className);

                    FolderViewDataProvider provider = (handle == null) ? null : (handle.Unwrap() as FolderViewDataProvider);
                    provider.ItemId = id;
                    provider.PageNumber = MainUtil2.GetInt32(pageNum);
                    provider.RecordsPerPage = MainUtil2.GetInt32(pageSize);
                    provider.QueryCondition = Request["search"];
                    if (Request["sort"] != null)
                    {
                        provider.SortField = Request["sort"];
                        provider.SortDirection = Request["dir"];
                    }

                    if (sdp == "ContactFeedbackTabDataProvider")
                    {
                        provider.AddParameter("contactid", Request["contactid"]);
                    }
                    if (sdp == "ContacsOfOpenedEmailtGridDataProvider")
                    {
                        provider.AddParameter("type", Request["type"]);
                    }
                    provider.Execute();
                    result = provider.JsonString;
                    break;
                case "getpageinfobyquery":
                    result = GetPageInfo();
                    break;
                #endregion

                #region chatterfile
                case "quickcreate":
                    result = QuickCreate();
                    break;
                case "feeditems":
                    /*
                     
                     */
                    result = FeedItems();
                    break;
                case "feeditemlike":
                    //{"html":"<div class=\"cxfeeditemlike feeditemlike \" style=\"display:block\">\n\t<span class='like-icon'>&nbsp;<\/span><span>您说这个赞。<\/span>\n<\/div>\n"}
                    //result="{\"html\":\"<div class=\\\"cxfeeditemlike feeditemlike \\\" style=\\\"display:block\\\">\n\t<span class='like-icon'>&nbsp;</span><span>您说这个赞。</span>\n</div>\n\"}";
                    path = context.Server.MapPath("/_ui/_jsonPage/feeditemlike.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "chatterfile":
                    arrs = docId.Split(';');
                    if (arrs.Length > 1)
                    {
                        name = context.Request["fileName"];
                        desc = context.Request["desc"];
                        bool isRe = FileManager.Rename(_caller, new Guid(arrs[0]), name, desc);
                        if (isRe)
                            result = "while(1);\n{\"title\":\"" + name + "\",\"description\":\"" + desc + "\"}";
                    }
                    else
                    {
                        //get 
                    }
                    break;
                case "chatterfilemultiuploadform":
                case "chatterfileuploadform":
                    path = context.Server.MapPath("/_ui/_jsonPage/chatterfileuploadform.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    //result = ChatterFileUploadform();
                    break;

                case "sharedwithwizard":
                    path = context.Server.MapPath("/_ui/_jsonPage/sharedwithwizard.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "sharedwithlist":
                    path = context.Server.MapPath("/_ui/_jsonPage/sharedwithlist.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "publiclinks"://通过链接共享
                    path = context.Server.MapPath("/_ui/_jsonPage/publiclinks.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "shareAutoComplete":
                    break;
                case "versionlist":
                    path = context.Server.MapPath("/_ui/_jsonPage/versionlist.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "subscriptions": //文件订阅
                    break;
                case "getfilelist":
                    result = GetFileFilterResultList();
                    break;
                #endregion
                case "getlist": //根据视图查询
                    result = GetFilterResultList();
                    break;
                case "searchresult"://根据搜索查询SearchResult
                    result = SearchResultList();
                    break;
                case "filterstatcount": //根据条件，统计条数
                    result = StatQuantityFromFilter();
                    break;
                case "searchentitylistservlet": //表单实体查询
                    result = SearchEntityListServlet();
                    break;
                #region HR
                case "empsearchresult":
                    result = EmpSearchResultList();
                    break;
                #endregion

                #region AddressList
                case "addresssearchresult":
                    result = EntityListSearchResultListByObjectCode(ObjectTypeCodes.AddressList);
                    break;
                #endregion

                case "docoutsearch"://发文查询
                    result = DocInSearchResultList(ObjectTypeCodes.OfficialDocumentOut);
                    break;
                case "docinsearch"://收文查询
                    result = DocInSearchResultList(ObjectTypeCodes.OfficialDocumentIn);
                    break;
               
                case "getrelatedlist":
                    result = GetRelatedList();
                    break;

                #region folder,item tree
                case "getitemfoldertree":
                    result = ItemTreeManager.GetJsonOfContentFolderTree(_caller, 1, "", "");
                    result = "while(1);\n" + result;
                    break;
                case "getchildfoldersandfiles": //文档管理 获得文档目录与文件
                    result = GetChildFoldersAndFiles();
                    break;
                case "archfoldertreeservlet"://ArchFolderTreeServlet 档案目录
                    result = GetFolders();
                    break;
                case "updatecontentaccess"://修改内容权限
                    //string folderId = _context.Request["entityId"];
                    int r2 = MainUtil.GetInt(_context.Request["rightCode"], 2);
                    bool isAuth = ContentAccessAuthorization.UpateContentAccessControl(_caller, new Guid(id), r2);
                    if (isAuth)
                        result = "{\"status\":1}";
                    else
                        result = "{\"status\":998,\"msg\":\"修改权限失败！\"}";
                    break;
                case "addcontentaccess":    //增加内容权限
                    AddEntityAccess();
                    break;

                case "foldertreeservlet":
                    result = FolderTreeServlet();
                    result = "while(1);\n" + result;
                    break;
                case "reportfoldertree":
                    //path = context.Server.MapPath("/App_Data/DataTemplate/FolderTree.txt");
                    //result = FileUtil.ReadFromFile(path);
                    int t = MainUtil.GetInt(Request["type"], 9100);
                    result = ItemTreeManager.GetJsonOfContentFolderTree(_caller, t, "", "");
                    result = "while(1);\n" + result;
                    break;

                #endregion

                case "reportlist":
                    //path = context.Server.MapPath("/App_Data/DataTemplate/AnalyticsHomeListServlet.txt");
                    //result = FileUtil.ReadFromFile(path);
                    //result = "while(1);\n" + result;
                    ListReportServlt rptServlt = new ListReportServlt();
                    rptServlt.Caller = this._caller;
                    rptServlt.Execute(this._context);
                    result = rptServlt.ResponseJson;

                    break;
                case "publishtemplate":
                    bool isCreatedTable = TemplateUtil.CreateTable(_caller, new Guid(id));
                    if (isCreatedTable)
                        result = "1";
                    break;
                #region item

                #endregion

                case "getaddresslist":
                    result = GetAddresslist();
                    break;

                #region contents
                case "listfoldercontent":
                    result = ListFolderContents();
                    break;
                case "publishofficenotice": //通知
                    Supermore.Contents.ContentManager.PulishNotice(_caller, new Guid(id), MainUtil.GetInt(Request["statuscode"], 0));
                    break;
                #endregion
                //workflow
                case "listprocessservlet":
                    ListProcessServlt pServlt = new ListProcessServlt();
                    pServlt.Caller = this._caller;
                    pServlt.Execute(this._context);
                    result = pServlt.ResponseJson;
                    break;

                #region workflow
                case "manageinstanceslistservlet":
                    //path = context.Server.MapPath("/App_Data/DataTemplate/ManageInstancesListServlet.txt");
                    //result = FileUtil.ReadFromFile(path);
                    //result = "while(1);\n" + result;
                    result = ManageInstanceslistServlet();
                    break;
                case "delwfinstance": //删除流程实例
                    WfInstanceManager.Delete(_caller, new Guid(id));
                    result = "{\"status\":1,\"data\":\"\"}";
                    break;
                case "stopprocess":
                    bool b1 = WfSchemeManager.StopProcess(new Guid(id));
                    break;
                case "publishprocess":
                    bool b2 = WfSchemeManager.PublishProcess(new Guid(id));
                    break;



                #endregion

                case "approveplan": //审批计划
                    PlanManager.Approve(_caller, new Guid(id), MainUtil.GetInt(Request["StateCode"], 0));
                    break;

                case "rtaimageupload":
                    //https://ap1..com/_ui/common/request/servlet/RtaImageUploadServlet
                    //while(1);
                    //{"height":289,"width":500,"isRunningTests":false,"uploadStatus":true,"src":"https://c.ap1.content.force.com/servlet/rtaImage?refid=0EM90000000185U"}
                    result = RtaImageUpload();
                    result = "while(1);\n" + result;
                    break;
                #region security
                case "freezeuser": //FreezeUser 冻结用户
                    break;
                case "resetpwd": //重置密码
                    break;
                #endregion

                #region home page
                case "getwaitingwftask":
                    result = GetWFWaitingInstanceTask();
                    break;
                case "gettopnews":
                    result = GetTopNews();
                    break;
                case "getimportanttopnews"://GetImportantTopNews
                    result = GetImportantTopNews();
                    break;
                case "gettopnotices":
                    result = GetWFWaitingInstanceTask();
                    break;
                case "getwftaskstatistic"://获得用户的各种统计
                    result = GetWFTaskStatistic();
                    break;
                case "statwftask"://单个统计
                    WfInstanceManager.StatSingleUserTask(_caller);
                    break;
                #endregion

                #region inner email
                case "deleteemail":
                    DeleteInnerEmails();
                    break;
                case "getinneremails":
                    result = GetInnerEmails();
                    break;
                case "getunreademailqty"://未读邮件数量
                    int unread = InnerMailManager.CountUnreadQuantity(this._caller);
                    result = string.Format("{{\"status\":1,\"unread\":{0}}}", unread);
                    break;
                case "loaduploadattaches": //load attaches
                    result = LoadUploadAttaches();
                    break;
                case "removeuploademailattachfile":
                    RemoveUploadAttach();
                    break;
                case "email.user.searchusers":
                    result = SearchEmailUsers();
                    break;
                #endregion

                case "picklist":
                    result = GetPicklist();
                    break;
                case "getdeptchildren":
                    result = GetJsonDepartmentChidren();
                    break;

                case "unifiedsearchajaxservlet"://UnifiedSearchAjaxServlet
                    result = UnifiedSearchAjaxServlet();
                    break;

                case "sendtestsms":
                    string testMobile = Request["testMobile"];
                    string testmsg = Request["testmsg"];
                    Supermore.Mobile.SmsMessageManager.PushSmsQueue(_caller, Guid.Empty, "测试", testMobile, testmsg, 100, DateTime.Now, "", "");
                    break;

                case "listaddress":
                    result = ListFolderAddressList();
                    break;
                case "savemeetingitem"://保存会议议题
                    MeetingManager meetingManager = new MeetingManager();
                    Entity mItem = meetingManager.GetMeetingItem(_caller, new Guid(id));
                    mItem.BeginEdit();
                    mItem.Fields["Description"].Value = HttpUtility.UrlDecode(Request["desc"]);
                    mItem.EndEdit();
                    break;
                case "meetinghoverpage": //会议MeetingHoverPage
                    result = LoadMeetingHoverPage();
                    break;
                case "planhoverpage": //会议MeetingHoverPage
                    result = LoadPlanHoverPage();
                    break;
                #region event
                case "eventhoverpage":
                    result = LoadEventHoverPage();
                    break;
                case "taskhoverpage":
                    result = LoadTaskHoverPage();
                    break;

                case "activityrelationsearch": //活动邀请人
                    result = ActivityRelationSearch();
                    result = "while(1);\n" + result;
                    break;
                #endregion

                #region resource
                case "resourcehoverpage":
                    result = LoadResourceHoverPage();
                    break;
                case "checkresourcefree"://检查资源是否空闲
                    string start = Request["startTime"];
                    string end = Request["endTime"];
                    string resource = Request["resourceId"];
                    string meetingid = Request["meetingid"];
                    Supermore.OrgResource.ResourceAppointmentInfo appInfo = RoomManager.CheckRoomFree(_caller, start, end, resource, meetingid);
                    result = "{\"isFree\":" + (appInfo.IsFree ? "true" : "false") + ",\"msg\":\"" + appInfo.ToString() + "\"}";
                    break;
                #endregion


                #region get query
                case "getquerylist": //获取查询列表
                    result = GetEntityQueries();
                    result = "while(1);\n" + result;
                    break;
                #endregion

                #region setup field
                case "ajaxloadfieldsforentity"://
                    /*
                    while(1);
                    {"fieldList":[{"name":"LastModifiedBy","columnType":"ENTITYID","label":"上次修改人 ID"},{"name":"LastModifiedDate"
                    ,"columnType":"DATETIME","label":"上次修改日期"},{"name":"CreatedBy","columnType":"ENTITYID","label":"创建人 ID"
                    },{"name":"CreatedDate","columnType":"DATETIME","label":"创建日期"},{"name":"00N9000000DWnh0","columnType"
                    :"CURRENCY","label":"报销金额"},{"name":"Name","columnType":"TEXT","label":"报销项目"},{"name":"Id","columnType"
                    :"ENTITYID","label":"记录 ID"},{"name":"00N9000000DWnhF","columnType":"MULTILINETEXT","label":"项目说明"}]
                    ,"entity":"01I90000001TpT3"}
                    */
                    LoadFieldsForEntity loadFieldsForEntity = new LoadFieldsForEntity();
                    loadFieldsForEntity.Caller = this._caller;
                    loadFieldsForEntity.Execute(this._context);
                    result = loadFieldsForEntity.ResponseJson;
                    break;
                #endregion

                case "getstringcode": //获取代码
                    result = GetJsonStringCodes();
                    break;

                case "sorttemplatefield":
                    int sort = MainUtil.GetInt(_context.Request["sortnumber"], 1);
                    Guid tmpId = MainUtil.GetGuid(_context.Request["templateid"]);
                    Guid fieldId = MainUtil.GetGuid(_context.Request["fieldid"]);
                    if (_context.Request["direct"] == "1")
                    {
                        //sort = sort + 1;
                        int iRes = TemplateManager.SortDownField(_caller, tmpId, fieldId, sort);
                    }
                    else
                    {
                        //sort = sort - 1;
                        TemplateManager.SortUpField(_caller, tmpId, fieldId, sort);
                    }
                    break;

                //case "media.delete": //内容图片删除
                //    break;

                #region report
                case "getoldreportlist":
                    result = getReportList();
                    break;
                case "report.instances.getusertop":
                    string startDate2 = Request["startDate"];
                    string endDate2 = Request["endDate"];
                    result = WFInstanceReports.GetTopStatInstanceTasks(_caller, startDate2, endDate2);
                    break;
                #endregion

                #region 温州海洋 日志评鉴

                case "getuserjournal":
                    result = GetUserJournal();
                    break;
                case "savejournalcomment":
                    result = SaveUserJournalComment();
                    break;
                #endregion

                #region worklogreport
                case "workreport.content.send":
                case "worklog.reportcontent.send":
                    WorklogReportContentSend logSend = new WorklogReportContentSend();
                    logSend.Caller = this._caller;
                    logSend.SessionKey = this._caller.UserID;
                    logSend.Execute(this._context);
                    result = logSend.ResponseJson;
                    break;
                case "worklog.fetch":
                    WorklogMainRender loglistRener = new WorklogMainRender();
                    loglistRener.Caller = _caller;
                    loglistRener.Execute(this._context);
                    result = loglistRener.HTMLResult;
                    break;
                #endregion

                case "sys.group.getlist":
                    SysGroupAndPeopleGetList sysGroupAndPeopleGetList = new SysGroupAndPeopleGetList();
                    sysGroupAndPeopleGetList.Caller = _caller;
                    sysGroupAndPeopleGetList.SessionKey = _caller.UserID;
                    sysGroupAndPeopleGetList.Execute(this._context);
                    result = sysGroupAndPeopleGetList.ResponseJson;
                    break;

                case "volunteerappoint": //活动预约
                    string appDate = Request["date"];
                    int exeRes = VolunteerAppointManager.Appoint(_caller, appDate);
                    if (exeRes > 0)
                    {
                        result = "{\"name\":\"" + _caller.FullName + "\"}";
                    }
                    else
                    {
                        result = "{\"name\":\"\"}";
                    }
                    break;
                case "object.waitingedit.getlist"://等等编辑对象
                    result = GetWaitingEditObject();
                    break; ;
                default:
                    string curUserId = "";
                    if (this._caller != null)
                        curUserId = this._caller.UserID;
                    Supermore.WebAPI.WebAPIExecutor executor = new Supermore.WebAPI.WebAPIExecutor(this._context);
                    result = executor.Execute(this._caller, curUserId);
                    break;
            }
            context.Response.Write(result);
        }
        #region entity access
        void AddEntityAccess()
        {
            try
            {
                string entityId = _context.Request["entityId"];
                string strobjectId = _context.Request["objectId"];
                string[] str10 = strobjectId.Split(',');
                int r = MainUtil.GetInt(_context.Request["rightCode"], 1);
                foreach (string str11 in str10)
                {
                    string[] selAr = str11.Split(':');
                    Guid objectTypeId = new Guid(selAr[1]);
                    if (selAr[0] == SecurityAccountTypeCode.SystemUser)
                        ContentAccessControl.SetContentAccessControl(_caller, new Guid(entityId), objectTypeId, ObjectTypeCodes.SystemUser, r);
                    else if (selAr[0] == SecurityAccountTypeCode.Role)
                        ContentAccessControl.SetContentAccessControl(_caller, new Guid(entityId), objectTypeId, ObjectTypeCodes.Role, r);
                    else if (selAr[0] == SecurityAccountTypeCode.PublicGroup || selAr[0] == SecurityAccountTypeCode.PersonalGroup)
                        ContentAccessControl.SetContentAccessControl(_caller, new Guid(entityId), objectTypeId, ObjectTypeCodes.Group, r);
                    else if (selAr[0] == SecurityAccountTypeCode.BusinessUnit)//部门
                        ContentAccessControl.SetContentAccessControl(_caller, new Guid(entityId), objectTypeId, ObjectTypeCodes.BusinessUnit, r);
                }
                result = "{\"status\":1,\"添加成功\"}";
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                result = "{\"status\":999,\"添加失败！\"}";
            }
        }
        #endregion
        string GetEntityQueries()
        {
            int objectTypeCode = MainUtil.GetInt(Request["type"], 0);
            return SavedQueryManager.GetGetSavedQueriesJson(_caller, objectTypeCode, 0);
        }

        string GetJsonDepartmentChidren()
        {
            try
            {
                string parentDeptId = Request["node"];
                if (!MainUtil2.IsID(parentDeptId))
                    parentDeptId = "";
                StringBuilder sb = new StringBuilder();
                sb.Append("[");
                EntityCollection entityis = SecurityAuth.GetDepartmentChidren(_caller, parentDeptId);
                int c = 0;
                foreach (Entity entinty in entityis)
                {
                    if (c > 0)
                        sb.Append(",");
                    sb.Append("{");
                    sb.AppendFormat(" \"text\": \"{1}\",\"id\": \"{0}\",\"leaf\":false,\"cls\":\"folder\"", entinty.ID, entinty.Name);
                    sb.Append("}");
                    c++;
                }
                sb.Append("]");
                return sb.ToString();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                return string.Empty;
            }
        }

        #region workflow
        string ManageInstanceslistServlet()
        {
            string action = this._context.Request["action"];
            string strids = this._context.Request["ids"];
            if (action == "remove_members" && !string.IsNullOrEmpty(strids))
            {
                string[] ids = strids.Split(',');
                //delete
                // foreach (string s in ids)
                //   WfInstanceManager.Delete(new Guid(s));

                return "while(1);\n{\"membersRemoved\":1,\"membersError\":\"\"}";
            }
            else if (action == "newfilter" || action == "filter")
            {
                return GetWFInstanceFilterResultList();
            }
            return string.Empty;
        }
        string GetWFInstanceFilterResultList()
        {
            try
            {
                string filterType = this._context.Request["filterType"]; //对象 object id
                string filterId = this._context.Request["filterId"];
                string filterState = Request["filterState"];
                string filterQuery = this._context.Request["filterQuery"];
                string srch = this._context.Request["search"];
                //search
                //sort
                //filterId = "00000000-0000-0000-00AA-000010001019";
                Guid queryId = new Guid(filterId);
                SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, queryId);
                int rowsPerPage = 25;
                int pageNumber = 1;
                pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
                rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 25);
                string sort = this._context.Request["sort"];
                EntityCollection entities = null;
                //savedQuery.
                QueryExpression extraQueryExpression = new QueryExpression();
                if (Request["filterVals"] != null)
                {
                    string filterVals = Request["filterVals"];
                    string filterCols = Request["filterCols"];
                    string filterOps = Request["filterOps"];
                    string[] cols = filterCols.Split(',');
                    string[] vals = filterVals.Split(',');
                    string[] ops = filterOps.Split(',');

                    for (int c = 0; c < cols.Length; c++)
                    {
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(ops[c]);
                        OperatorType operatorType = QueryUtil.GetOperatorType(condOperator);
                        if (vals[c] != "" || operatorType == OperatorType.NoValue)
                            extraQueryExpression.Criteria.AddCondition(cols[c], condOperator, vals[c]);
                    }
                }
               
                if (!string.IsNullOrEmpty(srch))
                {
                    extraQueryExpression = new QueryExpression();
                    ConditionOperator condOperator = ConditionOperator.Contains;
                    extraQueryExpression.Criteria.AddCondition(savedQuery.Template.NameField, condOperator, srch);
                }
                if (!string.IsNullOrEmpty(filterQuery))
                {
                    string[] conds = filterQuery.Split('\n');
                    foreach (string condLine in conds)
                    {
                        if (string.IsNullOrEmpty(condLine)) continue;
                        string[] v = condLine.Split('\t');
                        string fValue = v[2].Trim();
                        if (!string.IsNullOrEmpty(fValue))
                        {
                            string[] vals = fValue.Split(',');
                            ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1].Trim());
                            extraQueryExpression.Criteria.AddCondition(v[0].Trim(), condOperator, vals);
                        }
                    }
                }
                else
                {
                    if (Request["processPara"] == "1") //流程事务，现在人查看其它人的流程事务
                    {
                        ConditionExpression condExp = new ConditionExpression();
                        //condExp.AttributeName = "BusinessUnitId";
                        condExp.AttributeName = "CreatedBy";
                        condExp.Operator = ConditionOperator.Equal;
                        condExp.Values = new object[] { _caller.UserID };
                        extraQueryExpression.Criteria.Add(condExp);
                    }
                }
                //if (filterState == "content_created")//我创建
                //{
                //    //5FE538F6-18A2-4E7B-8F19-6B77C285D5B5
                //    //extraQueryExpression.Criteria.AddCondition(cols[c], condOperator, vals[c]);
                //}
                if (filterState == "content_manage" || filterState == "notice_created")//
                {
                    EntityCollection allowFolders = new EntityCollection();
                    if (filterState == "notice_created")
                    {
                        //allowFolders = ItemTreeManager.GetCanCreateFolders(_caller, ObjectTypeCodes.Notice);
                        //extraQueryExpression.Criteria.AddCondition("CreatedBy", ConditionOperator.Equal, _caller.UserID);                        
                        //allowFolders = new EntityCollection();
                    }
                    else
                        allowFolders = ItemTreeManager.GetCanCreateFolders(_caller, ObjectTypeCodes.Content);

                    if (allowFolders.Count > 0)
                    {
                        ConditionExpression cond = new ConditionExpression();
                        cond.AttributeName = "FolderId";
                        cond.Operator = ConditionOperator.In;
                        string[] ids = new string[] { };
                        foreach (Entity entity in allowFolders)
                        {
                            Array.Resize<string>(ref ids, ids.Length + 1);
                            ids[ids.Length - 1] = entity.ID.ToString();
                        }
                        cond.Values = ids;
                        extraQueryExpression.Criteria.AddCondition(cond);
                    }
                }

                entities = SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression, sort);
                //else if (filterState == "content_running")//待审核
                //{
                //    //FC992F65-4332-427C-9D4A-1A553A5908D4
                //}
                //else if (filterState == "content_publish")//已发布
                //{
                //    //A7F9C191-B2D0-4B8B-B719-99A790A94ADA

                //}


                List<GridSort> sorts = new List<GridSort>();
                if (!string.IsNullOrEmpty(sort))
                {

                    GridSort orderExp = new GridSort();
                    if (sort.Substring(0, 1) == "-")
                    {
                        orderExp.Field = sort.Substring(1);
                        orderExp.Direction = SortDirect.DESC;
                    }
                    else
                    {
                        orderExp.Field = sort;
                        orderExp.Direction = SortDirect.ASC;
                    }
                    sorts.Add(orderExp);
                }

                WFInstanceListRender listProvider = new WFInstanceListRender();
                listProvider.Sorts = sorts;
                listProvider.Entities = entities;
                listProvider.Query = savedQuery;
                listProvider.RowsPerPage = rowsPerPage;
                listProvider.CurrentPage = pageNumber;
                listProvider.RetURL = Request["retURL"];
                listProvider.ViewURL = string.Format("/{0}/detail", filterType);
                listProvider.EntityType = filterType;
                listProvider.TotalRowCount = SavedQueryManager.Count(_caller, savedQuery, extraQueryExpression);
                listProvider.QueryType = Request["filterState"];
                listProvider.Execute();

                string result = listProvider.ToJson();

                //Supermore.Diagnostics.Trace.LogError("wfrulelog:" + result);
                return result;
            }
            catch (Exception ex)
            {
                //Supermore.Diagnostics.Trace.LogError("wfrulelog:" + ex.Message);
                Supermore.Diagnostics.Trace.LogException(ex);
                return "";
            }
        }
        /// <summary>
        /// 获取等到办理的流程事务
        /// </summary>
        string GetWFWaitingInstanceTask()
        {
            IEnumerable<TransitionLog> logs = null;
            EntityCollection entities = null;
            int iC = 0;
            string json = "[";
            string filterType = Request["filterType"];
            if (filterType == "inform") //知会
            {
                entities = WfInstanceManager.GetMyTopSharedInstance(_caller, 1, 6);

            }
            else if (filterType == "share") //传阅
            {
                entities = WfInstanceManager.GetMyTopSharedInstance(_caller, 2, 6);

            }
            else if (filterType == "remind") //催办
            {
                logs = WfInstanceManager.GetMyTop6RemindTransitions(_caller, 6);

            }
            else //普通流程
            {
                logs = WfInstanceManager.GetMyTop5UnfinishedTransitions(_caller, 6);

            }

            if (filterType == "inform" || filterType == "share")
            {
                iC = 0;
                foreach (Entity entity in entities)
                {
                    if (iC > 0)
                        json += ",";
                    string createdByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, entity.CreatedBy);
                    string instId = StringUtil.GetString(entity.Fields["ProcessInstanceId"].Value);
                    string instName = StringUtil.GetString(entity.Fields["InstanceName"].Value);
                    json += "{\"id\":\"" + entity.ID.ToString() + "\",\"instanceId\":\"" + instId + "\",\"name\":\" " + instName + "\",\"date\":\"" + entity.CreatedOn.ToString("yyyy-MM-dd") + "\",\"createdBy\":\"" + createdByName + "\",\"remindTimes\":0}";
                    //log.c
                    iC++;
                }
            }
            else
            {
                foreach (TransitionLog log in logs)
                {
                    if (iC > 0)
                        json += ",";
                    string createdByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, log.CreatedBy);

                    json += "{\"id\":\"" + log.ID.ToString() + "\",\"instanceId\":\"" + log.ProcessInstanceId.ToString() + "\",\"name\":\" " + log.InstanceName + "【" + log.ToActivityName + "】\",\"date\":\"" + log.CreatedOn.ToString("yyyy-MM-dd") + "\",\"createdBy\":\"" + createdByName + "\",\"remindTimes\":" + log.RemindTimes + "}";
                    //log.c
                    iC++;
                }
            }

            json += "]";
            return json;
        }
        /// <summary>
        /// 获取流程任务上的待办任务数量
        /// </summary>
        /// <returns></returns>
        string GetWFTaskStatistic()
        {
            WfInstanceManager.StatSingleUserTask(_caller);
            string json = "[";
            int iC = 0;
            EntityCollection entities = null;
            string sql = "SELECT TOP 6 * FROM UserStatisticBase WHERE OrganizationId='{0}' ORDER BY NotStartedWfTasks DESC";
            sql = string.Format(sql, _caller.CustomerID);
            entities = EntityManager.GetEntities(_caller, ObjectTypeCodes.UserStatistic, sql);
            foreach (Entity entity in entities)
            {
                if (iC > 0)
                    json += ",";

                Guid systemUserId = MainUtil.GetGuid(entity.Fields["SystemUserId"].Value);

                SystemUser sysUser = SecurityAuth.GetSystemUser(systemUserId);
                Entity busiUnit = SecurityAuth.GetDepartment(_caller, sysUser.BusinessUnitId);
                string fullName = StringUtil.GetString(entity.Fields["FullName"].Value);
                int notStartedWfTasks = MainUtil.GetInt(entity.Fields["NotStartedWfTasks"].Value, 0);
                string dept = "";
                if (busiUnit != null)
                    dept = busiUnit.Name;
                //string isRead = StringUtil.GetString(entity.Fields["IsRead"].Value);
                json += "{\"dept\":\"" + dept + "\",\"systemUserId\":\"" + systemUserId + "\",\"fullName\":\"" + fullName + "\",\"notStartedWfTasks\":" + notStartedWfTasks + "}";
                //log.c
                iC++;
            }
            json += "]";
            return json;

        }

        #endregion

        #region home dash board
        string GetTopNews()
        {
            string taskName = Request["taskName"];
            string contentType = Request["contentType"];
            string folderId1 = Request["folderId"];
            string json = "[";
            int iC = 0;
            EntityCollection entities = null;
            //if (contentType == "news")
            //    entities = ContentManager.GetUnreadTop6News(_caller);
            //if (contentType == "notice")
            //    entities = ContentManager.GetUnreadTop6News(_caller);
            if (taskName == "read")
            {
                if (contentType == "notice")
                    entities = Supermore.Contents.ContentManager.GetTop6Notices(_caller);
                else
                {
                    if (!string.IsNullOrEmpty(folderId1))
                        entities = Supermore.Contents.ContentManager.GetUnreadTop6Contents(_caller, 1, new string[] { folderId1 });
                    else
                        entities = Supermore.Contents.ContentManager.GetUnreadTop6Contents(_caller, 1);
                }
            }
            if (taskName == "approve")
            {
                entities = Supermore.Contents.ContentManager.GetUnapprovedNews(_caller);
            }

            foreach (Entity entity in entities)
            {
                if (iC > 0)
                    json += ",";
                string createdByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, entity.CreatedBy);
                string title = StringUtil.GetString(entity.Fields["Title"].Value);
                Guid folderId = MainUtil.GetGuid(entity.Fields["FolderId"].Value);
                string folderName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.ItemTree, folderId);
                //string isRead = StringUtil.GetString(entity.Fields["IsRead"].Value);
                json += "{\"id\":\"" + entity.ID.ToString() + "\",\"title\":\" " + title + "\",\"date\":\"" + entity.CreatedOn.ToString("yyyy-MM-dd") + "\"" +
                    ",\"createdBy\":\"" + createdByName + "\""
                    + ",\"folderName\":\"" + folderName + "\""
                    + ",\"isRead\":false}";
                //log.c
                iC++;
            }
            json += "]";
            return json;
        }

        string GetImportantTopNews()
        {
            string taskName = Request["taskName"];
            string contentType = Request["contentType"];
            string folderId1 = Request["folderId"];
            string json = "[";
            int iC = 0;
            EntityCollection entities = null;
            //if (contentType == "news")
            //    entities = ContentManager.GetUnreadTop6News(_caller);
            //if (contentType == "notice")
            //    entities = ContentManager.GetUnreadTop6News(_caller);
            if (taskName == "read")
            {
                //if (contentType == "notice")
                //    entities = ContentManager.GetTop6Notices(_caller);
                //else
                //{
                //if (!string.IsNullOrEmpty(folderId1))
                //    entities = ContentManager.GetUnreadTop6Contents(_caller, 1, folderId1);
                //else
                entities = Supermore.Contents.ContentManager.GetImportantTop6News(_caller, 1, 6);
                // }
            }
            //if (taskName == "approve")
            //{
            //    entities = ContentManager.GetUnapprovedNews(_caller);
            //}

            foreach (Entity entity in entities)
            {
                if (iC > 0)
                    json += ",";
                string createdByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, entity.CreatedBy);
                string title = StringUtil.GetString(entity.Fields["Title"].Value);
                Guid folderId = MainUtil.GetGuid(entity.Fields["FolderId"].Value);
                string folderName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.ItemTree, folderId);
                //string isRead = StringUtil.GetString(entity.Fields["IsRead"].Value);
                json += "{\"id\":\"" + entity.ID.ToString() + "\",\"title\":\" " + title + "\",\"date\":\"" + entity.CreatedOn.ToString("yyyy-MM-dd") + "\"" +
                    ",\"createdBy\":\"" + createdByName + "\""
                    + ",\"folderName\":\"" + folderName + "\""
                    + ",\"isRead\":false}";
                //log.c
                iC++;
            }
            json += "]";
            return json;
        }
        #endregion
        /// <summary>
        /// 根据查询视图，搜索
        /// </summary>
        /// <returns></returns>
        string GetFilterResultList()
        {
            //filterType
            string filterId = this._context.Request["filterId"];
            string retURL = this._context.Request["retURL"];
            string sort = this._context.Request["sort"];
            if (string.IsNullOrEmpty(filterId))
                filterId = this._context.Request["fcf"];

            try
            {
                //search
                //sort
                //filterId = "00000000-0000-0000-00AA-000010001019";
                SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterId));
                int rowsPerPage = 25;
                int pageNumber = 1;
                pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
                rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 25);

                QueryExpression extraQueryExpression = new QueryExpression();
                string srch = Request["search"];
                if (!string.IsNullOrEmpty(srch))
                {

                    /*
                    string filterVals = Request["filterVals"];
                    string filterCols = Request["filterCols"];
                    string filterOps = Request["filterOps"];
                    string[] cols = filterCols.Split(',');
                    string[] vals = filterVals.Split(',');
                    string[] ops = filterOps.Split(',');                
                    for (int c = 0; c < cols.Length; c++)
                    {
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(ops[c]);
                        extraQueryExpression.Criteria.AddCondition(cols[c], condOperator, vals[c]);
                    }
                    */
                    ConditionOperator condOperator = ConditionOperator.Contains;
                    srch = MainUtil2.FilterInjectSql(srch);
                    extraQueryExpression.Criteria.AddCondition(savedQuery.Template.NameField, condOperator, srch);
                }
                string filterQuery = Request["filterQuery"];
                if (!string.IsNullOrEmpty(filterQuery))
                {
                    string[] conds = filterQuery.Split('\n');
                    foreach (string condLine in conds)
                    {
                        if (string.IsNullOrEmpty(condLine)) continue;
                        string[] v = condLine.Split('\t');
                        string fValue = v[2];
                        if (!string.IsNullOrEmpty(fValue))
                        {
                            ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1].Trim());
                            fValue = fValue.Trim();
                            fValue = MainUtil2.FilterInjectSql(fValue);//移除注入
                            string[] values = fValue.Split(',');
                            //if(condOperator = ConditionOperator.
                            extraQueryExpression.Criteria.AddCondition(v[0].Trim(), condOperator, values);
                        }
                    }
                }

                EntityCollection entities = SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression, sort);

                List<GridSort> sorts = new List<GridSort>();
                if (!string.IsNullOrEmpty(sort))
                {

                    GridSort orderExp = new GridSort();
                    if (sort.Substring(0, 1) == "-")
                    {
                        orderExp.Field = sort.Substring(1);
                        orderExp.Direction = SortDirect.DESC;
                    }
                    else
                    {
                        orderExp.Field = sort;
                        orderExp.Direction = SortDirect.ASC;
                    }
                    sorts.Add(orderExp);
                }
                //string DisplayColumnNames = StringUtil.GetString(savedQuery.ColumnSetXml);
                //string[] cols = DisplayColumnNames.Split(',');
                //SavedQueryParser parser = new SavedQueryParser();

                QueryListJsonRenderer listProvider = new QueryListJsonRenderer();
                listProvider.Sorts = sorts;
                listProvider.Entities = entities;
                listProvider.Query = savedQuery;
                listProvider.RowsPerPage = rowsPerPage;
                listProvider.CurrentPage = pageNumber;
                listProvider.Template = savedQuery.Template;
                listProvider.RetURL = retURL;
                //listProvider.Columns = parser.ParseColumns(template, cols);
                listProvider.TotalRowCount = SavedQueryManager.Count(_caller, savedQuery, extraQueryExpression);
                listProvider.Execute();


                string result = listProvider.ToJson();
                //debuggr
                //Supermore.Diagnostics.Trace.LogError(_json);

                return result;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                return string.Empty;
            }
        }
        /// <summary>
        /// 根据搜索查询
        /// </summary>
        /// <returns></returns>
        string SearchResultList()
        {
            int rowsPerPage = 25;
            int pageNumber = 1;
            string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 50);
            string retURL = this._context.Request["retURL"];
            string sort = this._context.Request["sort"];
            string filterQuery = this._context.Request["filterQuery"];
            string srch = this._context.Request["search"];
            SavedQueryParser parser = new SavedQueryParser();
            QueryExpression extraQueryExpression = new QueryExpression();

            try
            {
                SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));



                if (!string.IsNullOrEmpty(srch))
                {
                    extraQueryExpression = new QueryExpression();
                    ConditionOperator condOperator = ConditionOperator.Contains;
                    srch = MainUtil2.FilterInjectSql(srch);
                    extraQueryExpression.Criteria.AddCondition(savedQuery.Template.NameField, condOperator, srch);
                }
                if (!string.IsNullOrEmpty(filterQuery))
                {
                    string[] conds = filterQuery.Split('\n');
                    foreach (string condLine in conds)
                    {
                        if (string.IsNullOrEmpty(condLine)) continue;
                        string[] v = condLine.Split('\t');
                        string fValue = v[2];
                        if (!string.IsNullOrEmpty(fValue))
                        {
                            ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1].Trim());
                            fValue = fValue.Trim();
                            fValue = MainUtil2.FilterInjectSql(fValue);//移除注入
                            string[] values = fValue.Split(',');
                            extraQueryExpression.Criteria.AddCondition(v[0].Trim(), condOperator, values);
                        }
                    }
                }

                List<GridSort> sorts = new List<GridSort>();
                if (!string.IsNullOrEmpty(sort))
                {
                    GridSort orderExp = new GridSort();
                    if (sort.Substring(0, 1) == "-")
                    {
                        orderExp.Field = sort.Substring(1);
                        orderExp.Direction = SortDirect.DESC;
                    }
                    else
                    {
                        orderExp.Field = sort;
                        orderExp.Direction = SortDirect.ASC;
                    }
                    sorts.Add(orderExp);
                }
                EntityCollection entities = SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression, sort);

                QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
                relatedEntityListRenderer.InitContainerId = "lineItemView";
                relatedEntityListRenderer.Caller = _caller;
                relatedEntityListRenderer.Query = savedQuery;
                relatedEntityListRenderer.Template = savedQuery.Template;
                relatedEntityListRenderer.Columns = parser.ParseColumns(savedQuery.Template, savedQuery.ColumnSetXml);
                relatedEntityListRenderer.Entities = entities;
                relatedEntityListRenderer.TotalRowCount = SavedQueryManager.Count(_caller, savedQuery, extraQueryExpression);
                relatedEntityListRenderer.RetURL = retURL;
                relatedEntityListRenderer.RowsPerPage = rowsPerPage;
                relatedEntityListRenderer.CurrentPage = pageNumber;
                relatedEntityListRenderer.Sorts = sorts;
                relatedEntityListRenderer.Execute();

                string result = relatedEntityListRenderer.ToJson();
                //Supermore.Diagnostics.Trace.LogError(_json);
                return result;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                return string.Empty;
            }

        }
        /// <summary>
        /// 根据条件统计数据
        /// </summary>
        /// <returns></returns>
        string StatQuantityFromFilter()
        {


            string filterQuery = this._context.Request["filterQuery"];
            string templateObjectCode = this._context.Request["objecttypecode"];

            QueryExpression extraQueryExpression = new QueryExpression();

            if (!string.IsNullOrEmpty(filterQuery))
            {
                string[] conds = filterQuery.Split('\n');
                foreach (string condLine in conds)
                {
                    if (string.IsNullOrEmpty(condLine)) continue;
                    string[] v = condLine.Split('\t');
                    string fValue = v[2];
                    if (!string.IsNullOrEmpty(fValue))
                    {
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
                        fValue = MainUtil2.FilterInjectSql(fValue);//移除注入
                        string[] values = fValue.Split(',');
                        extraQueryExpression.Criteria.AddCondition(v[0], condOperator, values);
                    }
                }

            }
            int typeCode = MainUtil.GetInt(templateObjectCode, 0);
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, typeCode);
            if (template != null)
            {
                int total = SavedQueryManager.Count(_caller, template, extraQueryExpression);

                string result = string.Format("{{\"total\":{0}}}", total);
                result = string.Format("查询总数为<b>{0}</b>", total);
                return result;
            }
            else
            {
                string result = string.Format("{{\"total\":-1,\"error\":\"{0}\"}}", "没有此对象！");
                result = string.Format("没有此对象,查询总数为<b>{0}</b>", -1);
                return result;
            }
        }
        string EmpSearchResultList()
        {
            int rowsPerPage = 25;
            int pageNumber = 1;
            //string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 50);
            string retURL = this._context.Request["retURL"];
            string sort = this._context.Request["sort"];
            string filterQuery = this._context.Request["filterQuery"];
            string srch = this._context.Request["search"];
            string stateCode = this._context.Request["StateCode"];
            SavedQueryParser parser = new SavedQueryParser();
            //SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, ObjectTypeCodes.HREmployee);
            QueryExpression queryExp = new QueryExpression(template.BaseTableName);
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = pageNumber;
            queryExp.PageInfo.PageSize = rowsPerPage;

            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = DisplayColumnNames.Split(',');

            queryExp.ColumnSet.AddColumn(template.PKField.Name);
            foreach (string c in cols)
                queryExp.ColumnSet.AddColumn(c);

            if (!string.IsNullOrEmpty(srch))
            {
                queryExp = new QueryExpression();
                ConditionOperator condOperator = ConditionOperator.Contains;
                srch = MainUtil2.FilterInjectSql(srch);
                queryExp.Criteria.AddCondition(template.NameField, condOperator, srch);
            }
            if (!string.IsNullOrEmpty(filterQuery))
            {
                string[] conds = filterQuery.Split('\n');
                foreach (string condLine in conds)
                {
                    if (string.IsNullOrEmpty(condLine)) continue;
                    string[] v = condLine.Split('\t');
                    string fValue = v[2];
                    if (!string.IsNullOrEmpty(fValue))
                    {
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
                        fValue = MainUtil2.FilterInjectSql(fValue);//移除注入
                        string[] values = fValue.Split(',');

                        queryExp.Criteria.AddCondition(v[0], condOperator, values);
                    }
                }

            }


            List<GridSort> sorts = new List<GridSort>();
            if (!string.IsNullOrEmpty(sort))
            {
                GridSort orderExp = new GridSort();
                string sortField = sort;
                if (sort.Substring(0, 1) == "-")
                {
                    sortField = sort.Substring(1);
                    orderExp.Field = sortField;
                    orderExp.Direction = SortDirect.DESC;

                    queryExp.AddOrder(sortField, OrderType.Descending);
                }
                else
                {
                    orderExp.Field = sort;
                    orderExp.Direction = SortDirect.ASC;
                    queryExp.AddOrder(sortField, OrderType.Ascending);
                }
                sorts.Add(orderExp);
            }
            else
            {
                queryExp.AddOrder("ModifiedOn", OrderType.Descending);
            }
            EntityCollection entities = null;// SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression, sort);
            entities = EntityManager.GetEntities(_caller, template, queryExp);
            int total = SavedQueryManager.Count(_caller, template, queryExp);
            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            relatedEntityListRenderer.Caller = _caller;
            //relatedEntityListRenderer.ShowActionColumn = false;
            //relatedEntityListRenderer.ShowEntityButtons = false;
            if (Request["edit_blank"] == "1")
                relatedEntityListRenderer.LinkOpenBlank = true;
            relatedEntityListRenderer.Sorts = sorts;
            relatedEntityListRenderer.Template = template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = rowsPerPage;
            relatedEntityListRenderer.CurrentPage = pageNumber;
            relatedEntityListRenderer.Execute();

            string result = relatedEntityListRenderer.ToJson();

            return result;
        }

        string EntityListSearchResultListByObjectCode(int objectCode)
        {
            int rowsPerPage = 25;
            int pageNumber = 1;
            //string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 50);
            string retURL = this._context.Request["retURL"];
            string sort = this._context.Request["sort"];
            string filterQuery = this._context.Request["filterQuery"];
            string srch = this._context.Request["search"];
            SavedQueryParser parser = new SavedQueryParser();
            //SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, objectCode);
            QueryExpression queryExp = new QueryExpression(template.BaseTableName);
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = pageNumber;
            queryExp.PageInfo.PageSize = rowsPerPage;

            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = DisplayColumnNames.Split(',');

            queryExp.ColumnSet.AddColumn(template.PKField.Name);
            foreach (string c in cols)
                queryExp.ColumnSet.AddColumn(c);

            if (!string.IsNullOrEmpty(srch))
            {
                queryExp = new QueryExpression();
                srch = MainUtil2.FilterInjectSql(srch);
                ConditionOperator condOperator = ConditionOperator.Contains;
                queryExp.Criteria.AddCondition(template.NameField, condOperator, srch);
            }
            if (!string.IsNullOrEmpty(filterQuery))
            {
                string[] conds = filterQuery.Split('\n');
                foreach (string condLine in conds)
                {
                    if (string.IsNullOrEmpty(condLine)) continue;
                    string[] v = condLine.Split('\t');
                    string fValue = v[2];
                    if (!string.IsNullOrEmpty(fValue))
                    {
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
                        fValue = MainUtil2.FilterInjectSql(fValue);//移除注入
                        string[] values = fValue.Split(',');
                        queryExp.Criteria.AddCondition(v[0], condOperator, values);
                    }
                }

            }

            List<GridSort> sorts = new List<GridSort>();
            if (!string.IsNullOrEmpty(sort))
            {
                GridSort orderExp = new GridSort();
                string sortField = sort;
                if (sort.Substring(0, 1) == "-")
                {
                    sortField = sort.Substring(1);
                    orderExp.Field = sortField;
                    orderExp.Direction = SortDirect.DESC;

                    queryExp.AddOrder(sortField, OrderType.Descending);
                }
                else
                {
                    orderExp.Field = sort;
                    orderExp.Direction = SortDirect.ASC;
                    queryExp.AddOrder(sortField, OrderType.Ascending);
                }
                sorts.Add(orderExp);
            }
            else
            {
                //queryExp.AddOrder("ModifiedOn", OrderType.Descending);
                queryExp.AddOrder("SeqNo", OrderType.Ascending);
            }
            EntityCollection entities = null;// SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression, sort);
            entities = EntityManager.GetEntities(_caller, template, queryExp);
            int total = SavedQueryManager.Count(_caller, template, queryExp);
            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            relatedEntityListRenderer.Caller = _caller;
            //relatedEntityListRenderer.ShowActionColumn = false;
            //relatedEntityListRenderer.ShowEntityButtons = false;
            relatedEntityListRenderer.Sorts = sorts;
            relatedEntityListRenderer.Template = template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = rowsPerPage;
            relatedEntityListRenderer.CurrentPage = pageNumber;
            relatedEntityListRenderer.Execute();

            string result = relatedEntityListRenderer.ToJson();

            return result;
        }

        #region 公文
        string DocInSearchResultList(int objectTypeCode)
        {
            int rowsPerPage = 25;
            int pageNumber = 1;
            //string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 50);
            string retURL = this._context.Request["retURL"];
            string sort = this._context.Request["sort"];
            string filterQuery = this._context.Request["filterQuery"];
            string srch = this._context.Request["search"];
            SavedQueryParser parser = new SavedQueryParser();
            //SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, objectTypeCode);
            QueryExpression queryExp = new QueryExpression(template.BaseTableName);
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = pageNumber;
            queryExp.PageInfo.PageSize = rowsPerPage;

            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = DisplayColumnNames.Split(',');

            queryExp.ColumnSet.AddColumn(template.PKField.Name);
            foreach (string c in cols)
                queryExp.ColumnSet.AddColumn(c);

            if (!string.IsNullOrEmpty(srch))
            {
                queryExp = new QueryExpression();
                srch = MainUtil2.FilterInjectSql(srch);
                ConditionOperator condOperator = ConditionOperator.Contains;
                queryExp.Criteria.AddCondition(template.NameField, condOperator, srch);
            }
            if (!string.IsNullOrEmpty(filterQuery))
            {
                string[] conds = filterQuery.Split('\n');
                foreach (string condLine in conds)
                {
                    if (string.IsNullOrEmpty(condLine)) continue;
                    string[] v = condLine.Split('\t');
                    string fValue = v[2];
                    if (!string.IsNullOrEmpty(fValue))
                    {
                        fValue = MainUtil2.FilterInjectSql(fValue);//移除注入
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
                        queryExp.Criteria.AddCondition(v[0], condOperator, fValue);
                    }
                }

            }

            List<GridSort> sorts = new List<GridSort>();
            if (!string.IsNullOrEmpty(sort))
            {
                GridSort orderExp = new GridSort();
                string sortField = sort;
                if (sort.Substring(0, 1) == "-")
                {
                    sortField = sort.Substring(1);

                    orderExp.Field = sortField;
                    orderExp.Direction = SortDirect.DESC;

                    queryExp.AddOrder(sortField, OrderType.Descending);
                }
                else
                {
                    orderExp.Field = sortField;
                    orderExp.Direction = SortDirect.ASC;

                    queryExp.AddOrder(sortField, OrderType.Ascending);
                }
                //sorts.Add(orderExp);
            }
            else
            {
                queryExp.AddOrder("CreatedOn", OrderType.Descending);
            }
            EntityCollection entities = null;// SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression, sort);
            entities = EntityManager.GetEntities(_caller, template, queryExp);
            int total = SavedQueryManager.Count(_caller, template, queryExp);
            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            relatedEntityListRenderer.Caller = _caller;
            relatedEntityListRenderer.ShowActionColumn = false;
            relatedEntityListRenderer.ShowEntityButtons = false;
            relatedEntityListRenderer.LinkOpenBlank = true;
            relatedEntityListRenderer.Sorts = sorts;
            relatedEntityListRenderer.Template = template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = rowsPerPage;
            relatedEntityListRenderer.CurrentPage = pageNumber;
            relatedEntityListRenderer.Execute();

            string result = relatedEntityListRenderer.ToJson();

            return result;
        }
        #endregion
        #region entity
        string SearchEntityListServlet()
        {
            int rowsPerPage = 25;
            int pageNumber = 1;
            string templateId = this._context.Request["templateId"];
            //string filterID = "7305b340-d513-4c25-97a2-a3510f2a59af";
            pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 50);
            string retURL = this._context.Request["retURL"];
            string sort = this._context.Request["sort"];
            string filterQuery = this._context.Request["filterQuery"];
            string srch = this._context.Request["search"];
            string actionCol = this._context.Request["actionCol"];
            string showAction = this._context.Request["showAction"];
            SavedQueryParser parser = new SavedQueryParser();
            //SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterID));
            Template template = TemplateManager.GetTemplate(_caller.OrganizationId, new Guid(templateId));
            QueryExpression queryExp = new QueryExpression(template.BaseTableName);
            queryExp.IsPaged = true;
            queryExp.PageInfo.PageNumber = pageNumber;
            queryExp.PageInfo.PageSize = rowsPerPage;

            Entity layoutEntity = TemplateSearchLayoutManager.GetSearchResultLayout(_caller, template.ID);
            string DisplayColumnNames = StringUtil.GetString(layoutEntity.Fields["DisplayColumnNames"].Value);
            string[] cols = DisplayColumnNames.Split(',');

            queryExp.ColumnSet.AddColumn(template.PKField.Name);
            foreach (string c in cols)
                queryExp.ColumnSet.AddColumn(c);

            if (!string.IsNullOrEmpty(srch))
            {
                queryExp = new QueryExpression();
                srch = MainUtil2.FilterInjectSql(srch);
                ConditionOperator condOperator = ConditionOperator.Contains;
                queryExp.Criteria.AddCondition(template.NameField, condOperator, srch);
            }
            if (!string.IsNullOrEmpty(filterQuery))
            {
                string[] conds = filterQuery.Split('\n');
                foreach (string condLine in conds)
                {
                    if (string.IsNullOrEmpty(condLine)) continue;
                    string[] v = condLine.Split('\t');
                    string fValue = v[2];
                    if (!string.IsNullOrEmpty(fValue))
                    {
                        
                        string[] values = fValue.Split(',');
                        //fValue = MainUtil2.FilterInjectSql(fValue);//移除注入
                        ConditionOperator condOperator = QueryUtil.ConditionOperatorFromString(v[1]);
                        queryExp.Criteria.AddCondition(v[0], condOperator, values);
                    }
                }

            }

            List<GridSort> sorts = new List<GridSort>();
            if (!string.IsNullOrEmpty(sort))
            {
                GridSort orderExp = new GridSort();
                if (sort.Substring(0, 1) == "-")
                {
                    string sortField = sort.Substring(1);
                    orderExp.Field = sortField;
                    orderExp.Direction = SortDirect.DESC;
                    queryExp.AddOrder(sortField, OrderType.Descending);
                }
                else
                {
                    orderExp.Field = sort;
                    orderExp.Direction = SortDirect.ASC;
                    queryExp.AddOrder(sort, OrderType.Ascending);
                }
                sorts.Add(orderExp);

            }
            else
            {
                queryExp.AddOrder("CreatedOn", OrderType.Descending);
            }
            EntityCollection entities = null;// SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression, sort);
            entities = EntityManager.GetEntities(_caller, template, queryExp);
            int total = SavedQueryManager.Count(_caller, template, queryExp);
            QueryListJsonRenderer relatedEntityListRenderer = new QueryListJsonRenderer();
            relatedEntityListRenderer.InitContainerId = "lineItemView";
            relatedEntityListRenderer.Caller = _caller;

            // relatedEntityListRenderer.ShowActionColumn = false;
            //relatedEntityListRenderer.ShowEntityButtons = false;

            if (EntityTemplateIDs.SystemUser == template.ID && string.IsNullOrEmpty(actionCol))
            {
                relatedEntityListRenderer.ShowActionColumn = true;
                relatedEntityListRenderer.ShowEntityButtons = true;
            }
            else
            {
                if (actionCol == "no")
                {
                    //relatedEntityListRenderer.EnableFieldOpenLink = false;

                    relatedEntityListRenderer.ShowActionColumn = false;
                    relatedEntityListRenderer.ShowEntityButtons = false;
                }
            }
            relatedEntityListRenderer.LinkOpenBlank = true;
            relatedEntityListRenderer.Sorts = sorts;
            relatedEntityListRenderer.Template = template;
            relatedEntityListRenderer.Columns = parser.ParseColumns(template, cols);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.TotalRowCount = total;
            relatedEntityListRenderer.RetURL = retURL;
            relatedEntityListRenderer.RowsPerPage = rowsPerPage;
            relatedEntityListRenderer.CurrentPage = pageNumber;
            relatedEntityListRenderer.Execute();

            string result = relatedEntityListRenderer.ToJson();

            return result;
        }
        #endregion

        #region inner emails
        void RemoveUploadAttach()
        {
            //removeuploadfile
            string tempPath = IOPaths.EmailAttachFiles + "\\" + _caller.UserName + "\\temp";
            string fileName = Request["fileName"];
            string rFileName = HttpUtility.UrlDecode(fileName);
            string file = tempPath + "\\" + rFileName;
            if (File.Exists(file))
            {
                File.Delete(file);
            }

        }
        string LoadUploadAttaches()
        {
            string tempPath = IOPaths.EmailAttachFiles + "\\" + _caller.UserName + "\\temp";
            string[] files = System.IO.Directory.GetFiles(tempPath);
            StringBuilder sb = new StringBuilder();
            int iRow = 0;
            foreach (string f in files)
            {
                string sFileName = FileUtil2.GetFileName(f);
                string orgName = HttpUtility.UrlEncode(sFileName);
                sb.AppendFormat("<div id='att_{1}'><span style='line-height:16px;font-size:12px;'>{0}</span>&nbsp;&nbsp;<a style='line-height:16px;cursor:pointer;color: #1e5494;' class=\"att_del\" href='#' onclick=\"delBigAttach('att_{1}','{2}')\">删除</a></div>", sFileName, iRow, orgName);
                iRow++;
            }
            return sb.ToString();
        }
        string DeleteInnerEmails()
        {
            // CallContext caller = AppDataSource.GetCallContext();
            string strIds = Request["ids"];
            string mailBox = Request["ltags"];
            string[] ids = strIds.Split(';');
            bool isDelete = InnerMailManager.DeleteEmail(_caller, ids, mailBox);

            string json = "{\"status\":\"success\"}";

            return json;
        }
        /// <summary>
        /// Email tag / untag
        /// </summary>
        /// <returns></returns>
        string EmailTag()
        {
            //emailtag
            //emailuntag
            return string.Empty;
        }
        string GetInnerEmails()
        {
            string json = "{";
            string tag = Request["ltags"];
            string srch = Request["search"];
            json += "\"totalRecords\":0,\"pageNumber\":1,\"data\":[";
            int pageNum1 = MainUtil.GetInt(Request["pageNumber"], 1);
            EntityCollection mails = null;
            int iR = 0;
            if (!string.IsNullOrEmpty(srch))
                srch = MainUtil2.FilterInjectSql(srch);
            if (tag == "draft" || tag == "sent")
            {
                mails = InnerMailManager.GetSentEmails(_caller, tag, srch, pageNum1);

                foreach (Entity entity in mails)
                {
                    if (iR > 0)
                        json += ",";

                    string subject = DataUtil.ToJsonString(StringUtil.GetString(entity.Fields["Subject"].Value));

                    json += string.Format("{{\"emailId\":\"{0}\",\"subject\":\"{1}\",\"createdOn\":\"{2}\",\"toUserNames\":\"{3}\",\"toGroupNames\":\"{4}\",\"isRead\":{5},\"mailTag\":\"{6}\"}}", entity.ID,
                        subject,
                        StringUtil.GetString(entity.Fields["CreatedOn"].Value).Trim(),
                        StringUtil.GetString(entity.Fields["toUserNames"].Value).Trim(),
                        StringUtil.GetString(entity.Fields["ToGroupNames"].Value).Trim(),
                        "true",
                        StringUtil.GetString(entity.Fields["MailTag"].Value)
                        );
                    iR++;
                }
            }
            else
            {

                mails = InnerMailManager.GetInboxEmails(_caller, new Guid(_caller.UserID), tag, srch, pageNum1);
                foreach (Entity entity in mails)
                {
                    if (iR > 0)
                        json += ",";
                    string subject = DataUtil.ToJsonString(StringUtil.GetString(entity.Fields["Subject"].Value));
                    json += string.Format("{{\"emailId\":\"{0}\",\"subject\":\"{1}\",\"createdOn\":\"{2}\",\"fromName\":\"{3}\",\"isRead\":{4},\"mailTag\":\"{5}\"}}", entity.ID,
                        subject,
                        StringUtil.GetString(entity.Fields["CreatedOn"].Value),
                        StringUtil.GetString(entity.Fields["FromName"].Value),
                        MainUtil.GetBool(entity.Fields["IsRead"].Value, false).ToString().ToLower(),
                        StringUtil.GetString(entity.Fields["MailTag"].Value)
                        );
                    iR++;
                }
            }//

            json += "]}";
            return json;
        }
        string SearchEmailUsers()
        {
            string json = "[";
            int i = 0;

            string tag = Request["tag"];
            string objectType = Request["objectType"];
            EntityCollection entities = null;
            if (!string.IsNullOrEmpty(tag))
                tag = MainUtil2.FilterInjectSql(tag);

            /*
            <option value="U">用户</option>
            <option value="A">角色</option>                                                        
            <option value="P">个人小组</option>
            <option value="R">公用小组</option>
             */
            try
            {
                tag = MainUtil2.FilterInjectSql(tag);
                //if (objectType == "A")
                //{
                entities = SecurityAuth.GetRoles(_caller, tag);
                foreach (Entity entity in entities)
                {
                    if (i > 0)
                        json += ",";
                    string entityId = StringUtil.GetString(entity.ID);
                    string name = entity.Name;

                    json += string.Format("{{\"key\":\"A:{0}\",\"value\":\"角色：{1}\"}}", entityId, name);

                    i++;
                }

                DataSet ds = SecurityAuth.SearchSystemRoleUsers(_caller, tag);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (i > 0)
                        json += ",";
                    //{"key": "hello world", "value": "hello world"},
                    string userId = StringUtil.GetString(dr["SystemUserId"]);
                    string userName = StringUtil.GetString(dr["UserName"]);
                    string fullName = StringUtil.GetString(dr["FullName"]);
                    string deptName = StringUtil.GetString(dr["DeptName"]);
                    string Pinyin = StringUtil.GetString(dr["Pinyin"]);
                    string roleName = StringUtil.GetString(dr["RoleIdName"]);
                    string name1 = "";
                    if (!string.IsNullOrEmpty(Pinyin))
                        name1 = string.Format("{0}({1})   {2}   {3}", fullName, Pinyin, userName, roleName);
                    else
                        name1 = string.Format("{0}   {1}   {2}", fullName, userName, roleName);

                    name1 = DataUtil.ToJsonString(name1);
                    json += string.Format("{{\"key\":\"U:{0}\",\"value\":\"用户：{1}\"}}", userId, name1);

                    i++;
                }
                //i = 0;
                //}
                //i = 0;
                //if (objectType == "R")
                //{
                entities = GroupManager.GetPublicGroups(_caller, tag);
                foreach (Entity entity in entities)
                {
                    if (i > 0)
                        json += ",";
                    string entityId = StringUtil.GetString(entity.ID);
                    string name = entity.Name;

                    json += string.Format("{{\"key\":\"R:{0}\",\"value\":\"公用小组：{1}\"}}", entityId, name);
                    i++;
                }

                ds = SecurityAuth.SearchSystemGroupUsers(_caller, tag);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (i > 0)
                        json += ",";
                    //{"key": "hello world", "value": "hello world"},
                    string userId = StringUtil.GetString(dr["SystemUserId"]);
                    string userName = StringUtil.GetString(dr["UserName"]);
                    string fullName = StringUtil.GetString(dr["FullName"]);
                    string deptName = StringUtil.GetString(dr["DeptName"]);
                    string Pinyin = StringUtil.GetString(dr["Pinyin"]);
                    string roleName = StringUtil.GetString(dr["GroupIdName"]);
                    string name1 = "";
                    if (!string.IsNullOrEmpty(Pinyin))
                        name1 = string.Format("{0}({1})   {2}   {3}", fullName, Pinyin, userName, roleName);
                    else
                        name1 = string.Format("{0}   {1}   {2}", fullName, userName, roleName);

                    name1 = DataUtil.ToJsonString(name1);
                    json += string.Format("{{\"key\":\"U:{0}\",\"value\":\"用户：{1}\"}}", userId, name1);

                    i++;
                }


                entities = GroupManager.GetPersonalGroups(_caller, tag);
                foreach (Entity entity in entities)
                {
                    if (i > 0)
                        json += ",";
                    string entityId = StringUtil.GetString(entity.ID);
                    string name = entity.Name;

                    json += string.Format("{{\"key\":\"P:{0}\",\"value\":\"个人小组：{1}\"}}", entityId, name);
                    i++;
                }
                //json += "]";

                //return json;
                //}
                //i = 0;
                //if (objectType == "B") //部门
                //{
                QueryExpression queyExp = new QueryExpression();
                ConditionExpression cond = new ConditionExpression();
                cond.AttributeName = "Name";
                cond.Operator = ConditionOperator.Like;
                cond.Values = new object[] { tag };
                queyExp.Criteria.AddCondition(cond);

                cond = new ConditionExpression();
                cond.AttributeName = "IsDisabled";
                cond.Operator = ConditionOperator.Equal;
                cond.Values = new object[] { 0 };
                queyExp.Criteria.AddCondition(cond);

                //OrderExpression orderExp = new OrderExpression();
                queyExp.AddOrder("Name", OrderType.Ascending);

                entities = SecurityAuth.GetDepartmentChidren(_caller, queyExp);
                foreach (Entity entity in entities)
                {
                    if (i > 0)
                        json += ",";
                    string entityId = StringUtil.GetString(entity.ID);
                    string name = entity.Name;

                    json += string.Format("{{\"key\":\"B:{0}\",\"value\":\"科室部门：{1}\"}}", entityId, name);
                    i++;
                }
                //}

                string sql = @"SELECT a.*,b.Name As DeptName,a.Pinyin FROM SystemUserBase a 
                                Left Join BusinessUnitBase b on a.BusinessUnitId=b.BusinessUnitId 
                                Where (a.UserName like '%'+@UserName+'%' OR a.FullName like '%'+@FullName+'%' OR a.Pinyin like '%'+@Pinyin%+'%' OR b.Name like '%'+@BusinessUnitName+'%' ) And a.IsDisabled=0";
                sql = @"SELECT a.*,b.Name As DeptName,a.Pinyin FROM SystemUserBase a 
                                Left Join BusinessUnitBase b on a.BusinessUnitId=b.BusinessUnitId 
                                Where (a.UserName like '%{0}%' OR a.FullName like '%{0}%' OR a.Pinyin like '%{0}%' OR b.Name like '%{0}%' ) And a.IsDisabled=0";
                sql = string.Format(sql, tag);
                //Supermore.Data.DataProviders.DataParamCol col = new Supermore.Data.DataProviders.DataParamCol(
                //        new Supermore.Data.DataProviders.InputDataParam("UserName", tag),
                //        new Supermore.Data.DataProviders.InputDataParam("FullName", tag),
                //        new Supermore.Data.DataProviders.InputDataParam("Pinyin", tag),
                //        new Supermore.Data.DataProviders.InputDataParam("BusinessUnitName", tag)
                //    );
                ds = AppDataSource.GetDataSet(_caller, sql);
                //ds = AppDataSource.GetDataSet(_caller, sql, col);

                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    if (i > 0)
                        json += ",";
                    //{"key": "hello world", "value": "hello world"},
                    string userId = StringUtil.GetString(dr["SystemUserId"]);
                    string userName = StringUtil.GetString(dr["UserName"]);
                    string fullName = StringUtil.GetString(dr["FullName"]);
                    string deptName = StringUtil.GetString(dr["DeptName"]);
                    string Pinyin = StringUtil.GetString(dr["Pinyin"]);
                    //fullName = "apples";
                    //json += string.Format("{{\"key\":\"{0}\",\"value\":\"{1}\"}}", fullName, fullName);
                    string name1 = "";
                    if (!string.IsNullOrEmpty(Pinyin))
                        name1 = string.Format("{0}({1})   {2}   {3}", fullName, Pinyin, userName, deptName);
                    else
                        name1 = string.Format("{0}   {1}   {2}", fullName, userName, deptName);

                    name1 = DataUtil.ToJsonString(name1);
                    json += string.Format("{{\"key\":\"U:{0}\",\"value\":\"用户：{1}\"}}", userId, name1);
                    //{"key": "hello world", "value": "hello world"}
                    i++;
                }
                json += "]";
                //Response(json);
                return json;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
                return "[]";
            }
        }
        #endregion

        #region pagerinfo
        public string GetPageInfo()
        {
            string queryID = Request["id"];
            string searchJson = Request["search"];
            CallContext caller = AppDataSource.GetCallContext();
            int totalRecords = 0;
            //if (Request["dp"] == "ContactSegmentProvider")
            //{
            //    ContactManager cManager = new ContactManager();
            //    Segment segment = SegmentManager.GetSegment(caller, new ID(queryID));
            //    totalRecords = cManager.GetContactAmountsBySegment(caller, segment);
            //    //totalRecords = SegmentManager.GetTotalResult(caller, new ID(queryID));
            //}
            //else
            totalRecords = SavedQueryManager.Count(caller, new Guid(queryID), searchJson);

            int recordsPerPage = MainUtil.GetInt(Request["pageSize"], 10);
            int totalPages = 0;
            if (totalRecords <= recordsPerPage)
                totalPages = 1;
            else
            {
                totalPages = totalRecords / recordsPerPage;
                if ((totalRecords % recordsPerPage) > 0)
                    totalPages += 1;
            }

            string resultset = string.Format("{{\"success\":true,\"totalRecords\":{0},\"totalPages\":{1}}}", totalRecords, totalPages); ;

            return resultset;
        }
        #endregion

        public string GetRelatedList()
        {
            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(id));
            RelatedEntityListRenderer relatedEntityListRenderer = new RelatedEntityListRenderer();

            EntityCollection entities = SavedQueryManager.GetEntityies(_caller, savedQuery, 200, 1, null);

            SavedQueryParser parser = new SavedQueryParser();
            relatedEntityListRenderer.Columns = parser.ParseColumns(savedQuery.Template, savedQuery.ColumnSetXml);
            relatedEntityListRenderer.Entities = entities;
            relatedEntityListRenderer.Render();

            return relatedEntityListRenderer.TableHTML;
            // SavedQueryManager
        }

        #region chatter

        string QuickCreate()
        {
            //记录电话
            /*feedItemType=09D90000002aw8k&entityId=0059000000390Wh&feedItemVisibility=&topicIds=&feedType=NEWS&
            actionIdParam=09D90000002aw8k&formSuffix=09D90000002aw8k&who_id=000000000000000
            &tsk5__09D90000002aw8k=%E6%9D%A5%E7%94%B51&tsk2__09D90000002aw8k_lkid=000000000000000&tsk2__09D90000002aw8k_lkold=null&tsk2__09D90000002aw8k_lktp=003
            &tsk2__09D90000002aw8k_lspf=0&tsk2__09D90000002aw8k_lspfsub=0&tsk2__09D90000002aw8k_mod=0&tsk2__09D90000002aw8k=
            &tsk3__09D90000002aw8k_lkid=000000000000000&tsk3__09D90000002aw8k_lkold=null&tsk3__09D90000002aw8k_lktp=006&tsk3__09D90000002aw8k_lspf=0
            &tsk3__09D90000002aw8k_lspfsub=0&tsk3__09D90000002aw8k_mod=0&tsk3__09D90000002aw8k=&tsk2__09D90000002aw8k_mlktp=003&tsk3__09D90000002aw8k_mlktp=006
            &tsk6__09D90000002aw8k=111&save_new=Saving...
            */
            /*
                actionIdParam	09D90000002aw8k
                entityId	0059000000390Wh
                feedItemType	09D90000002aw8k
                feedItemVisibility	
                feedType	NEWS
                formSuffix	09D90000002aw8k
                save_new	Saving...
                topicIds	
                tsk2__09D90000002aw8k	
                tsk2__09D90000002aw8k_lki...	000000000000000
                tsk2__09D90000002aw8k_lko...	null
                tsk2__09D90000002aw8k_lkt...	003
                tsk2__09D90000002aw8k_lsp...	0
                tsk2__09D90000002aw8k_lsp...	0
                tsk2__09D90000002aw8k_mlk...	003
                tsk2__09D90000002aw8k_mod	0
                tsk3__09D90000002aw8k	
                tsk3__09D90000002aw8k_lki...	000000000000000
                tsk3__09D90000002aw8k_lko...	null
                tsk3__09D90000002aw8k_lkt...	006
                tsk3__09D90000002aw8k_lsp...	0
                tsk3__09D90000002aw8k_lsp...	0
                tsk3__09D90000002aw8k_mlk...	006
                tsk3__09D90000002aw8k_mod	0
                tsk5__09D90000002aw8k	来电1
                tsk6__09D90000002aw8k	111
                who_id	000000000000000
             */
            string path = "";
            string result = "";
            // if (feedItemType == "LinkPost")
            {
                path = _context.Server.MapPath("/_ui/_jsonPage/QuickCreate.txt");
                result = FileUtil.ReadFromFile(path);
            }
            result = "while(1);\n" + result;
            return result;
        }
        string FeedItems()
        {
            string feedItemType = this._context.Request["feedItemType"];
            //@@TODO
            /*
            entityId	0059000000390Wh
            feedItemType	LinkPost
            feedItemVisibility	
            feedType	NEWS
            text	333
            topicIds	
            url	http://www.sina.com
            urlName	sina
            */
            /*
             entityId	0059000000390Wh
             feedItemType	TextPost
             feedItemVisibility	
             feedType	NEWS
             text	what are you doning?
             topicIds	
             */
            string path = "";
            string result = "";
            if (feedItemType == "LinkPost")
            {
                path = _context.Server.MapPath("/_ui/_jsonPage/LinkPost.txt");
                result = FileUtil.ReadFromFile(path);
            }
            if (feedItemType == "TextPost")
            {
                path = _context.Server.MapPath("/_ui/_jsonPage/TextPost.txt");
                result = FileUtil.ReadFromFile(path);
            }
            /*
             choices	china
choices	Unite states
entityId	0059000000390Wh
feedItemType	PollPost
feedItemVisibility	
feedType	NEWS
question	你喜欢那个国家？
topicIds	
             */
            if (feedItemType == "PollPost")
            {
                path = _context.Server.MapPath("/_ui/_jsonPage/PollPost.txt");
                result = FileUtil.ReadFromFile(path);
            }
            /*
             entityId	0059000000390Wh
feedItemType	QuestionPost
feedItemVisibility	
feedType	NEWS
text	谁知道如何登录youtube?
title	谁知道如何登录youtube?
topicIds
             */
            if (feedItemType == "QuestionPost")
            {
                path = _context.Server.MapPath("/_ui/_jsonPage/QuestionPost.txt");
                result = FileUtil.ReadFromFile(path);
            }
            result = "while(1);\n" + result;
            return result;
        }

        string ChatterFileUploadform()
        {
            bool isUpload = false;

            string rootPath = IOPaths.Files + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM");
            string virtualPath = DateTime.Now.ToString("yyyy") + "/" + DateTime.Now.ToString("MM") + "/";
            if (!Directory.Exists(rootPath))
            {
                Directory.CreateDirectory(rootPath);
            }
            string targetFile = "";
            string fileName = "";
            string extName = "";
            Guid newid = Guid.NewGuid();
            foreach (string key in this.Request.Files.Keys)
            {
                HttpPostedFile file = this._context.Request.Files.Get(key);
                fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                extName = FileUtil2.GetFileExtension(file.FileName);
                string actualFileName = "file_" + DateTime.Now.ToString("yyyyMMddHHmmss") + extName;
                targetFile = rootPath + "\\" + actualFileName;

                if (extName == ".exe" || extName == ".js" || extName == ".asp" || extName == ".aspx" || extName == ".jsp" || extName == ".php"
                   || extName == ".lnk" || extName == ".css" || extName == ".dll" || extName == ".msu" || extName == ".shtml")
                {
                    continue;
                }

                virtualPath += actualFileName;
                //if (FileManager.FileExists(this.UploadCsvName))
                //{
                //    this.UploadCsvName = rootPath + "\\" + DateTime.Now.ToString("yyyyMMddHHmmss") + "_" + extName;
                //}
                file.SaveAs(targetFile);
                isUpload = true;
            }
            if (isUpload)
            {
                newid = Guid.NewGuid();
                Entity entity = new Entity(newid, EntityTemplateIDs.File, new Guid(_caller.CustomerID));
                entity.BeginEdit();
                entity.Fields["Name"].Value = fileName;
                entity.Fields["FileExtension"].Value = extName.TrimStart('.');
                entity.Fields["CreatedBy"].Value = _caller.UserID;
                entity.Fields["OwningUser"].Value = _caller.UserID;
                entity.Fields["OrganizationId"].Value = _caller.CustomerID;
                //FileTypeCode
                entity.EndEdit();

                FileManager.CreateVersion(_caller, newid, virtualPath, 0, 1, "");
            }
            string data = "";
            if (isUpload)
            {
                data = "<textarea>while(1);{\"message\":\"Success\",\"docid\":\"{0}\",\"versionId\":\"{1}\",\"so\":\"pvt\"}</textarea>);";
                data = string.Format(data, newid.ToString(), 1);
                // context.Response.Write(data);
            }
            else
            {
                data = "<textarea>while(1);{\"message\":\"Failure\",\"docid\":\"\",\"versionId\":\"\",\"so\":\"pvt\"}</textarea>);";
                //data = string.Format(data, newid.ToString(), 1);
                // context.Response.Write(data);
            }
            return data;
        }
        /// <summary>
        /// 获取列表
        /// </summary>
        /// <returns></returns>
        public string GetFileFilterResultList()
        {
            //ContentListViewport.entityId
            string filterType = this._context.Request["filterType"];
            //filterType
            string filterId = this._context.Request["filterId"];
            //search
            string search = this._context.Request["search"];
            //sort
            // if (string.IsNullOrEmpty(filterId))
            filterId = "4718A162-1959-4836-BB34-E118CEBB7C87";
            QueryExpression extraQueryExpression = new QueryExpression();
            if (!string.IsNullOrEmpty(search))
            {
                //Cond
                extraQueryExpression.Criteria.AddCondition("Name", ConditionOperator.Contains, new string[] { search });
            }
            EntityCollection entities = null;
            string folderId = Request["ContentListViewport.entityId"];
            switch (filterType)
            {
                case "ContentVersionOrganizationFileSearch"://所有文件
                    extraQueryExpression.Criteria.AddCondition("OrganizationId", ConditionOperator.Equal, new string[] { _caller.CustomerID });
                    break;
                case "ContentVersionRecentlyViewedFileSearch"://最近
                    //extraQueryExpression.Criteria.AddCondition("OwningUser", ConditionOperator.Equal, new string[] { _caller.UserID });
                    extraQueryExpression.Criteria.AddCondition("CreatedOn", ConditionOperator.LastXDays, new int[] { 30 });
                    break;
                case "ContentVersionAllUserFileSearch"://我的文件( 我拥有的文件、与我共享的文件，以及我追随的文件 )
                    extraQueryExpression.Criteria.AddCondition("OwningUser", ConditionOperator.Equal, new string[] { _caller.UserID });
                    break;
                case "ContentVersionUserFileSearch"://由我所有
                    extraQueryExpression.Criteria.AddCondition("OwningUser", ConditionOperator.Equal, new string[] { _caller.UserID });
                    break;
                case "ContentVersionSharedWithMeFileSearch"://与我共享
                    break;
                case "ContentVersionFollowedFileSearch"://正在追随
                    break;
                case "ContentVersionMyGroupsFileSearch"://我的小组中的文件
                    break;
                case "ContentVersionMyWorkspacesFileSearch"://我的文档库中的文件（查询，我拥有文档库里的文件）
                    break;
                case "ContentVersionPersonalWorkspaceFileSearch"://个人文档库/专有文档库
                    extraQueryExpression.Criteria.AddCondition("OwningUser", ConditionOperator.Equal, new string[] { _caller.UserID });
                    extraQueryExpression.Criteria.AddCondition("FolderId", ConditionOperator.Equal, new Guid[] { Guid.Empty });
                    break;
                case "ContentVersionWorkspaceFileSearch"://具体某一个文档库
                    //ContentVersionPersonalWorkspaceFileSearch
                    extraQueryExpression.Criteria.AddCondition("FolderId", ConditionOperator.Equal, new Guid[] { new Guid(folderId) });
                    //ContentListViewport.entityId
                    break;
            }

            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterId));
            int rowsPerPage = 25;
            int pageNumber = 1;
            pageNumber = MainUtil.GetInt(this._context.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this._context.Request["rowsPerPage"], 25);
            entities = SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression);

            FileListJsonRenderer listProvider = new FileListJsonRenderer();
            listProvider.Caller = this._caller;
            listProvider.Entities = entities;
            listProvider.Query = savedQuery;
            //listProvider.Template = 
            listProvider.RowsPerPage = rowsPerPage;
            listProvider.CurrentPage = pageNumber;
            listProvider.TotalRowCount = SavedQueryManager.Count(_caller, savedQuery, extraQueryExpression);
            listProvider.Execute();

            string result = listProvider.ToJson();
            return result;
        }
        #endregion

        #region content
        /// <summary>
        /// 获取目录
        /// </summary>
        /// <returns></returns>
        string GetFolders()
        {
            int t = MainUtil.GetInt(Request["type"], 1);
            string filterVal = Request["filterVal"];
            string action = Request["action"];
            string parentId = Request["node"];
            string checksecurity = Request["checksecurity"];
            //action	PIN
            /*
            if (action == "PIN")
            {
                string folderToPin = Request["folderToPin"];
                ItemTreeManager.Pin(_caller, new Guid(folderToPin));
            }
            if (action == "UNPIN")
            {
                string folderToUnPin = Request["folderToUnPin"];
                ItemTreeManager.UnPin(_caller, new Guid(folderToUnPin));
            }
            string result = ItemTreeManager.GetJsonOfContentFolderTree(_caller, t, "", filterVal);
            return result;
            */
            bool isSuperAdmin = WebContext.IsAdministrator;
            if (!MainUtil2.IsID(parentId))
                parentId = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            EntityCollection entities = null;
            if (checksecurity == "1")
                entities = ItemTreeManager.GetAccessItems(_caller, isSuperAdmin, t, parentId, filterVal);
            else if (checksecurity == "3")
                entities = ItemTreeManager.GetAdminAccessItems(_caller, isSuperAdmin, t, parentId, filterVal);
            else
                entities = ItemTreeManager.GetFolders(_caller, t, parentId, filterVal);
            int c = 0;
            foreach (Entity entinty in entities)
            {
                if (c > 0)
                    sb.Append(",");
                sb.Append("{");
                sb.AppendFormat(" \"text\": \"{1}\",\"id\": \"{0}\",\"leaf\":false,\"cls\":\"folder\"", entinty.ID, entinty.Name);
                sb.Append("}");
                c++;
            }
            sb.Append("]");
            return sb.ToString();
        }
        string FolderTreeServlet()
        {
            //action	PIN
            int t = MainUtil.GetInt(Request["type"], 1);
            string filterVal = Request["filterVal"];
            string action = Request["action"];
            string parentId = Request["node"];
            if (action == "PIN")
            {
                string folderToPin = Request["folderToPin"];
                ItemTreeManager.Pin(_caller, new Guid(folderToPin));
            }
            if (action == "UNPIN")
            {
                string folderToUnPin = Request["folderToUnPin"];
                ItemTreeManager.UnPin(_caller, new Guid(folderToUnPin));
            }
            string result = ItemTreeManager.GetJsonOfContentFolderTree(_caller, t, "", filterVal);
            return result;
        }
        string ListFolderContents()
        {
            string folderId = Request["fcf"];
            string entityType = Request["entityType"];
            string scope = Request["scope"];
            string action = Request["action"];
            string search = Request["search"];
            if (string.IsNullOrEmpty(entityType))
            {
                entityType = "1";
            }
            int rowsPerPage = 25;
            int pageNumber = 1;
            pageNumber = MainUtil.GetInt(this.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this.Request["rowsPerPage"], 25);
            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid("9C9DBC85-86CA-4B9D-9E30-4EF42AB9550A"));

            QueryExpression queryExp = new QueryExpression("ContentBase");

            ConditionExpression cond = null;
            if (action == "filter")
            {
                if (!string.IsNullOrEmpty(folderId))
                {
                    if (folderId == "00000000-0000-0000-0000-000000000002") //待审批信息
                    {
                        cond = new ConditionExpression();
                        cond.AttributeName = "ApprovedBy";
                        cond.Operator = ConditionOperator.Equal;
                        cond.Values = new object[] { _caller.UserID };
                        queryExp.Criteria.Add(cond);
                        //StatusCode 0 草稿 1 审批中 2 审批完毕
                        cond = new ConditionExpression();
                        cond.AttributeName = "StatusCode"; //StateCode 1 草稿  2 审批通过 3 审批不通过
                        cond.Operator = ConditionOperator.Equal;
                        cond.Values = new object[] { 0 };
                        queryExp.Criteria.Add(cond);
                    }
                    else if (folderId == "00000000-0000-0000-0000-000000000003") //已审批信息
                    {
                        cond = new ConditionExpression();
                        cond.AttributeName = "ApprovedBy";
                        cond.Operator = ConditionOperator.Equal;
                        cond.Values = new object[] { _caller.UserID };
                        queryExp.Criteria.Add(cond);
                        //StatusCode 0 草稿 1 审批中 2 审批完毕
                        cond = new ConditionExpression();
                        cond.AttributeName = "StatusCode"; //StateCode 1 草稿  2 审批通过 3 审批不通过
                        cond.Operator = ConditionOperator.Equal;
                        cond.Values = new object[] { 2 };
                        queryExp.Criteria.Add(cond);
                    }
                    else if (folderId == "00000000-0000-0000-0000-000000000001")//我的发布信息
                    {
                        cond = new ConditionExpression();
                        cond.AttributeName = "CreatedBy";
                        cond.Operator = ConditionOperator.Equal;
                        cond.Values = new object[] { _caller.UserID };
                        queryExp.Criteria.Add(cond);
                    }
                    else
                    {
                        cond = new ConditionExpression();
                        cond.AttributeName = "FolderId";
                        cond.Operator = ConditionOperator.Equal;
                        cond.Values = new object[] { folderId };
                        queryExp.Criteria.Add(cond);
                    }
                }
                if (!string.IsNullOrEmpty(search))
                {
                    cond = new ConditionExpression();
                    cond.AttributeName = "Title";
                    cond.Operator = ConditionOperator.Like;
                    cond.Values = new object[] { search };
                    //cond.DataType = AttributeDataType.Number;
                    queryExp.Criteria.Add(cond);
                }
                //加权限目录限制
            }
            else
            {

                //if (scope.Equals("recentlyViewed"))
                //{
                //    cond = new ConditionExpression();
                //    cond.AttributeName = "LastVisisted";
                //    cond.Operator = ConditionOperator.LatestXDays;
                //    cond.Values = new object[] { 30 };
                //    queryExp.Criteria.Add(cond);
                //}
                if (scope.Equals("createdByMe"))
                {
                    cond = new ConditionExpression();
                    cond.AttributeName = "CreatedOn";
                    cond.Operator = ConditionOperator.LatestXDays;
                    cond.Values = new object[] { 30 };
                    queryExp.Criteria.Add(cond);
                }
            }
            if (!string.IsNullOrEmpty(entityType))
            {
                cond = new ConditionExpression();
                cond.AttributeName = "ContentTypeCode";
                cond.Operator = ConditionOperator.Equal;
                cond.Values = new object[] { entityType };
                cond.DataType = AttributeDataType.Number;
                queryExp.Criteria.Add(cond);
            }

            ContentListJsonRender contentListJsonRender = new ContentListJsonRender();
            contentListJsonRender.Entities = Supermore.Contents.ContentManager.GetFolderContents(_caller, queryExp);
            contentListJsonRender.Caller = this._caller;
            //contentListJsonRender.Entities = entities;
            contentListJsonRender.Query = savedQuery;
            contentListJsonRender.RowsPerPage = rowsPerPage;
            contentListJsonRender.CurrentPage = pageNumber;
            contentListJsonRender.TotalRowCount = Supermore.Contents.ContentManager.GetFolderCount(_caller, queryExp);
            string result = contentListJsonRender.ToJson();
            return result;
        }

        string GetChildFoldersAndFiles()
        {
            int t = MainUtil.GetInt(Request["type"], 1);
            string filterVal = Request["filterVal"];
            string action = Request["action"];
            string parentId = Request["node"];
            string checksecurity = Request["checksecurity"];
            string dataType = StringUtil.GetString(Request["dataType"]);
            string search = Request["search"];
            if (!string.IsNullOrEmpty(search))
                filterVal = search;
            if (!MainUtil2.IsID(parentId))
                parentId = "";
            bool isSuperAdmin = WebContext.IsAdministrator;
            int c = 0;
            EntityCollection entities = null;
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            try
            {
                bool canAdmin = false;
                if (!string.IsNullOrEmpty(filterVal))
                    filterVal = MainUtil2.FilterInjectSql(filterVal);

                if (!string.IsNullOrEmpty(parentId))
                {
                    Entity folder = ItemTreeManager.GetFolder(_caller, new Guid(parentId));
                    canAdmin = ContentAccessControl.CanAdmin(_caller, folder);//是否可以管理
                }
                if (checksecurity == "1")
                {
                    entities = ItemTreeManager.GetAccessItems(_caller, isSuperAdmin, t, parentId, filterVal);
                }
                else if (checksecurity == "3")
                    entities = ItemTreeManager.GetAdminAccessItems(_caller, isSuperAdmin, t, parentId, filterVal);
                else
                    entities = ItemTreeManager.GetFolders(_caller, t, parentId, filterVal);

                foreach (Entity entity in entities)
                {
                    if (c > 0)
                        sb.Append(",");
                    sb.Append("{");
                    string createdByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, entity.CreatedBy);
                    sb.AppendFormat(" \"text\": \"{1}\",\"id\": \"{0}\",\"leaf\":false,\"cls\":\"folder\",\"created\":\"{2}\",\"createdby\":\"{3}\",\"modifiedon\":\"{4}\",\"fileExtension\":\"\"", entity.ID, entity.Name, entity.CreatedOn.ToString("yyyy-MM-dd HH:mm:ss"), createdByName, entity.ModifiedOn.ToString("yyyy-MM-dd HH:mm:ss"));
                    sb.Append("}");
                    c++;
                }

                if (entities.Count == 0)
                    c = 0;
                //get files
                if (!string.IsNullOrEmpty(parentId) && (dataType.ToLower() != "folder"))
                {
                    entities = FileManager.GetFolderFiles(_caller, parentId, filterVal);
                    foreach (Entity entity in entities)
                    {
                        if (c > 0)
                            sb.Append(",");
                        sb.Append("{");
                        string createdByName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, entity.CreatedBy);
                        sb.AppendFormat(" \"text\": \"{1}\",\"id\": \"{0}\",\"leaf\":true,\"cls\":\"file\",\"created\":\"{2}\",\"createdby\":\"{3}\",\"modifiedon\":\"{4}\",\"canadmin\":\"{5}\"", entity.ID, entity.Name, entity.CreatedOn.ToString("yyyy-MM-dd HH:mm:ss"), createdByName, entity.ModifiedOn.ToString("yyyy-MM-dd HH:mm:ss"), canAdmin.ToString());
                        sb.AppendFormat(" ,\"fileExtension\": \"{0}\"", StringUtil.GetString(entity.Fields["FileExtension"].Value));
                        sb.Append("}");
                        c++;
                    }
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            sb.Append("]");
            return sb.ToString();
        }
        #endregion

        #region picklist
        string GetPicklist()
        {
            //非全局变量
            string e = this.Request["e"]; //object
            string sql = "SELECT  AttributeName,AttributeValue,Value  from StringMap Where ObjectTypeCode={0} Order by AttributeName,DisplayOrder";
            //sql = string.Format(sql, e);
            //查下拉列表存储值 Picklist
            sql = @"SELECT  AttributeName,AttributeValue,Value  from StringMap a JOIN
                                (SELECT b1.Name FROM Attribute b1 JOIN Entity e ON b1.EntityId = e.EntityId WHERE e.ObjectTypeCode={0} 
                                    AND AttributeTypeId='{1}'  ) b 
                                ON a.AttributeName = b.Name Where a.ObjectTypeCode={0}  Order by AttributeName,DisplayOrder";
            sql = string.Format(sql, e, "00000000-0000-0000-00aa-110000000030");



            DataSet ds = AppDataSource.GetDataSet(_caller, sql, null);
            StringBuilder sb = new StringBuilder();

            sb.Append(" window.pl = window.pl || {};");
            string lastAttrName = "";
            string attrName = "";
            int iC = 0;
            int iT = 0;
            bool isMultipleSelect = false;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                attrName = StringUtil.GetString(dr["AttributeName"]);
                if (attrName != lastAttrName)
                {
                    if (!string.IsNullOrEmpty(lastAttrName))
                        sb.AppendFormat("];\r\n");
                    iC = 0;
                    sb.AppendFormat("pl.vals_{0}=[", attrName);
                    iT++;
                    isMultipleSelect = TemplateUtil.IsMultipleSelectField(_caller, e, attrName);
                }
                if (iC > 0)
                    sb.Append(",");

                string attributeValue = StringUtil.GetString(dr["AttributeValue"]);
                string value = StringUtil.GetString(dr["Value"]);
                if (isMultipleSelect)
                    sb.AppendFormat("'{0}','{1}'", value, value);
                else
                    sb.AppendFormat("'{0}','{1}'", attributeValue, value);
                lastAttrName = attrName;
                iC++;
            }

            if (iT > 0)
                sb.AppendFormat("];\r\n");

            //全局变量
            try
            {
                sql = @"SELECT a.Name,a.ApiName,b.FieldName from StringMapTypeBase a join ( select a.PicklistEnumOrId,a.Name As FieldName from Attribute a join Entity e on a.EntityId=e.EntityId
                        where e.ObjectTypeCode={0} And a.PicklistEnumOrId Is Not null) b on a.StringMapTypeId = b.PicklistEnumOrId";
                sql = string.Format(sql, e);
                ds = AppDataSource.GetDataSet(_caller, sql, null);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    iT++;
                    string apiName = StringUtil.GetString(dr["ApiName"]);
                    attrName = StringUtil.GetString(dr["FieldName"]);
                    sb.AppendFormat("pl.vals_{0}=[", attrName);

                    string sql2 = "SELECT   Name, Value,AttributeValue FROM  StringCode where AttributeName='{0}' order by DisplayOrder";
                    sql2 = string.Format(sql2, apiName);
                    DataSet ds2 = AppDataSource.GetDataSet(_caller, sql2, null);
                    iC = 0;
                    foreach (DataRow dr2 in ds2.Tables[0].Rows)
                    {
                        //pl.vals_Gender=['0','男','1','女'];
                        if (iC > 0)
                            sb.Append(",");
                        string value = StringUtil.GetString(dr2["Value"]);
                        string attributeValue = StringUtil.GetString(dr2["AttributeValue"]);
                        //sb.AppendFormat("'{0}','{1}'", value, value);
                        sb.AppendFormat("'{0}','{1}'", attributeValue, value);
                        iC++;
                    }

                    sb.AppendFormat("];\r\n");
                }


                //查下拉列表存储文字 DroplistText 和按钮,左右选
                sql = @"SELECT  AttributeName,AttributeValue,Value  from StringMap a JOIN
                                (SELECT b1.Name FROM Attribute b1 JOIN Entity e ON b1.EntityId = e.EntityId WHERE e.ObjectTypeCode={0} 
                                AND (AttributeTypeId='{1}' OR AttributeTypeId='{2}'  OR AttributeTypeId='{3}') ) b 
                                ON a.AttributeName = b.Name Where a.ObjectTypeCode={0}  Order by AttributeName,DisplayOrder";
                sql = string.Format(sql, e, "00000000-0000-0000-00AA-110000000400", "00000000-0000-0000-00AA-110000000088", "00000000-0000-0000-00AA-110000000091");
                ds = AppDataSource.GetDataSet(_caller, sql, null);
                iC = 0;
                iT = 0;
                lastAttrName = "";
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    attrName = StringUtil.GetString(dr["AttributeName"]);
                    if (attrName != lastAttrName)
                    {
                        if (!string.IsNullOrEmpty(lastAttrName))
                            sb.AppendFormat("];\r\n");
                        iC = 0;
                        sb.AppendFormat("pl.vals_{0}=[", attrName);
                        iT++;
                        isMultipleSelect = TemplateUtil.IsMultipleSelectField(_caller, e, attrName);
                    }
                    if (iC > 0)
                        sb.Append(",");

                    string attributeValue = StringUtil.GetString(dr["AttributeValue"]);
                    string value = StringUtil.GetString(dr["Value"]);
                    if (isMultipleSelect)
                        sb.AppendFormat("'{0}','{1}'", value, value);
                    else
                        sb.AppendFormat("'{0}','{1}'", value, value);
                    lastAttrName = attrName;
                    iC++;
                }

                if (iT > 0)
                    sb.AppendFormat("];\r\n");

                string str2 = GetPicklistDepency(e);
                sb.Append(str2);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }



            sb.Append("\r\n");
            sb.Append("pl.noneLabel=\"--请选择--\";");
            sb.Append("\r\n");
            sb.Append("pl.naLabel=\"\\*\\*不适用\\*\\*\";");
            sb.Append("\r\n");
            sb.Append("pl.selectedLabel=\"已选择\";");
            sb.Append("\r\n");
            sb.Append("pl.availableLabel=\"可用\"; ");

            return sb.ToString();
        }
        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        string GetPicklistDepency(string objectTypeCode)
        {
            string str1 = "";
            StringBuilder sb = new StringBuilder();
            /*
            pl.vals_00N0o00000Ni5Hv=['江西','江西','北京','北京','广东','广东','广西','广西','福建','福建','浙江','浙江','江苏','江苏','湖北','湖北','湖南','湖南','河南','河南','河北','河北','贵州','贵州','山西','山西','陕西','陕西','青海','青海','新疆','新疆','西藏','西藏','辽宁','辽宁','吉林','吉林','黑龙江','黑龙江'];
            pl.vals_00N0o00000Ni5I0=['南昌','南昌','东城','东城','西城','西城','海淀','海淀','朝阳','朝阳','杭州','杭州','南京','南京','广州','广州','拉萨','拉萨','南宁','南宁'];
            pl.map_00N0o00000Ni5I0={'广西':'AEAA','浙江':'BAAA','江西':'gAAA','广东':'AQAA','江苏':'AgAA','北京':'eAAA'};            
            */
            /*
             new picklist('00N0o00000Ni5I0','00N0o00000Ni5I0','00N0o00000Ni5I0','00N0o00000Ni5Hv',['',''],' id=\"00N0o00000Ni5I0\" name=\"00N0o00000Ni5I0\" tabindex=\"5\"',true,true);
             */
            try
            {
                string sql = @"select EntityAttributeDependencyBase.*,lk_entity_entityid.EntityCode
                        , lk_entity_entityid.Name EntityIdName
                         , lk_entity_entityid.DisplayName
                        ,lk_entity_entityid.ObjectTypeCode
                        ,lk_attribute_dependentattributeid.Name AttributeDependencyIdName
                        FROM EntityAttributeDependencyBase  join Entity lk_entity_entityid
                        ON EntityAttributeDependencyBase.EntityId = lk_entity_entityid.EntityId
                        JOIN Attribute lk_attribute_dependentattributeid ON EntityAttributeDependencyBase.DependentAttributeId = lk_attribute_dependentattributeid.AttributeId
                        WHERE lk_entity_entityid.ObjectTypeCode = {0}
                    ";
                sql = string.Format(sql, objectTypeCode);
                DataSet ds = AppDataSource.GetDataSet(this._caller, sql);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string attributeDependencyIdName = StringUtil.GetString(dr["AttributeDependencyIdName"]);
                    string AttributeDependencyId = StringUtil.GetString(dr["AttributeDependencyId"]);
                    sb.AppendFormat("pl.map_{0}=", attributeDependencyIdName);
                    sb.Append("{");
                    string sql2 = string.Format(@"select * from EntityAttributeDependencyMapBase WHERE AttributeDependencyId='{0}'", AttributeDependencyId);
                    DataSet ds2 = AppDataSource.GetDataSet(this._caller, sql2);
                    int iV = 0;
                    foreach (DataRow dr2 in ds2.Tables[0].Rows)
                    {
                        if (iV > 0)
                            sb.Append(",");
                        string mapColName = StringUtil.GetString(dr2["Name"]);
                        string mapColValue = StringUtil.GetString(dr2["DependentValue"]);
                        sb.AppendFormat("'{0}':'{1}'", mapColName, mapColValue);

                        iV++;
                    }

                    sb.Append("}");

                    sb.Append("\r\n");
                }
                str1 = sb.ToString();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            return str1;
        }
        #endregion

        #region 图片上传
        string RtaImageUpload()
        {
            int imgHeight = 0;
            int imgWidth = 0;
            string imgSrc = "";

            string rootPath = IOPaths.CustomerMediaCodePath + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM");
            string virtualPath = DateTime.Now.ToString("yyyy") + "/" + DateTime.Now.ToString("MM") + "/";
            if (!Directory.Exists(rootPath))
            {
                Directory.CreateDirectory(rootPath);
            }
            string imgURL = "";

            string targetFile = "";
            string fileName = "";
            string extName = "";
            bool isUpload = false;
            Guid newid = Guid.NewGuid();

            foreach (string key in this._context.Request.Files.Keys)
            {
                HttpPostedFile file = this._context.Request.Files.Get(key);
                fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                extName = FileUtil2.GetFileExtension(file.FileName);
                string actualFileName = "file_" + DateTime.Now.ToString("yyyyMMddHHmmss") + extName;
                targetFile = rootPath + "\\" + actualFileName;
                virtualPath += actualFileName;

                file.SaveAs(targetFile);
                isUpload = true;
            }
            Size size = MediaUtil.GetSize(targetFile);
            imgHeight = size.Height;
            imgWidth = size.Width;
            if (imgWidth > 700)
                imgWidth = 700;
            if (imgHeight > 700)
                imgHeight = 700;
            if (isUpload)
            {

                Entity entity = new Entity(newid, EntityTemplateIDs.Media, new Guid(_caller.CustomerID));
                entity.BeginEdit();
                entity.Fields["Name"].Value = fileName;
                entity.Fields["Ext"].Value = extName.TrimStart('.');
                entity.Fields["Path"].Value = virtualPath;

                entity.Fields["Width"].Value = imgWidth;
                entity.Fields["Height"].Value = imgHeight;
                // OrganizationId
                entity.Fields["CreatedBy"].Value = _caller.UserID;
                entity.Fields["ModifiedBy"].Value = _caller.UserID;
                //entity.Fields["OwningUser"].Value = _caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
                entity.Fields["OrganizationId"].Value = _caller.CustomerID;
                //FileTypeCode
                entity.EndEdit();

                //FileManager.CreateVersion(_caller, newid, virtualPath, 0, 1, "");
            }
            //imgURL += virtualPath;
            imgURL = Settings.GetSetting("MediaWebSite");
            //if (imgURL.Substring(imgURL.Length - 1, 1) != "/")
            //{
            //    imgURL = imgURL + "/" + _caller.CustomerCode + "/";
            //}
            //imgURL = imgURL + string.Format("/ImageHandler.ashx?id={0}&height={1}&width={2}&filesource={3}&objecttypecode={3}", newid, imgHeight, imgWidth, ObjectTypeCodes.Media);
            imgURL = imgURL + string.Format("/ArticleImgHanlder.ashx?id={0}&height={1}&width={2}&filesource={3}&objecttypecode={3}", newid, imgHeight, imgWidth, ObjectTypeCodes.Media);

            //string json = string.Format("{{\"height\":{1},\"width\":{2},\"isRunningTests\":false,\"uploadStatus\":true,\"src\":\"{0}\"}}", imgURL, imgHeight, imgWidth);
            string json = string.Format("{{\"isRunningTests\":false,\"uploadStatus\":true,\"src\":\"{0}\"}}", imgURL);
            //json = string.Format(json, imgSrc, 500, 500);
            return json;

            //return imgURL;
        }
        #endregion

        string UnifiedSearchAjaxServlet()
        {
            string json = "";
            string searchEntityType = Request["fen"];
            string searchText = Request["str"];
            if (string.IsNullOrEmpty(searchText)) //如果没有条件
            {
                return string.Empty;
            }

            if (string.IsNullOrEmpty(searchEntityType)) //个别查询未空，就批量查询
            {

            }
            else
            {
                SingleEntitySearchResultRender render = new SingleEntitySearchResultRender();
                render.Caller = _caller;
                // string 

                render.SearchText = searchText;
                render.TemplateCode = searchEntityType;
                render.Render();

                json = " {\"singleEntitySearchResult\":{\"keyPrefix\":\"";
                json += searchEntityType + "\"";
                json += ",\"html\":\"";

                string listDataHTML = render.RenderResultHTML;
                #region old
                //listDataHTML.r
                //listDataHTML = listDataHTML.Replace("!", "\n"); //换行
                //StringBuilder sb = new StringBuilder();
                //string str2 = "";
                //char[] chars = listDataHTML.ToCharArray();
                //foreach (char c in chars)
                //{
                //    if (c == 13)//回车
                //    {
                //        str2 += "\\r";
                //    }
                //    else if (c == 10) //换行
                //    {
                //        str2 += "\\n";
                //    }
                //    //else if (c == 33) //!
                //    //{
                //    //    str2 += "\\u0021";
                //    //}
                //    //else if (c == 'a' || c == 'A')
                //    //{
                //    //    str2 += "\\u003Ca";
                //    //}
                //    //else if (c == 60)//<
                //    //{
                //    //    str2 += "\\u003C";
                //    //}
                //    //else if (c == 62)//>
                //    //{
                //    //    str2 += "\\u003E";
                //    //}
                //    else
                //        str2 += c;

                //}
                //sb.Append("");
                #endregion
                //json += str2;
                json += listDataHTML;
                json += "\",\"rowCount\":\"1\"}";
                json += ",\"firstPageQueryIdOverride\":\"b44ttmx3\"}";
                //string json=" {\"singleEntitySearchResult\":{\"keyPrefix\":\"001","html":"","rowCount":"1"},"firstPageQueryIdOverride":"b44ttmx3"}";
            }
            string result = "while(1);\n" + json;
            return result;
        }

        #region 通讯录
        /// <summary>
        /// 获取通讯录
        /// </summary>
        /// <returns></returns>
        string GetAddresslist()
        {
            string type = Request["type"];
            string deptId = Request["dept"];
            string srch = Request["srch"];
            int addressTypeCode = 0;
            if (type == "O")//同事
            {
                addressTypeCode = 1;
            }
            if (type == "P")//个人
            {
                addressTypeCode = 0;
            }
            if (type == "S")//共享
            {
                addressTypeCode = 2;
            }
            // string sql = "SELECT * FROM AddressListBase WHERE AddressTypeCode={0}";
            // sql = string.Format(sql, addressTypeCode);

            string sql = "SELECT * FROM AddressListBase  WHERE (AddressTypeCode=1 OR AddressTypeCode=1)  ";
            //sql = "SELECT * FROM AddressListBase WHERE AddressTypeCode={0}";
            if (!string.IsNullOrEmpty(deptId))
            {
                sql += " And DeptId='" + deptId + "'";
            }
            if (!string.IsNullOrEmpty(srch))
            {
                srch = MainUtil2.FilterInjectSql(srch);
                sql += string.Format(" And (FullName LIKE '%{0}%' OR Mobile LIKE '%{0}%')", srch);
            }
            List<Entity> users = EntityManager.GetEntities(_caller, ObjectTypeCodes.AddressList, sql);
            string json = "[";
            int i = 0;
            foreach (Entity ent in users)
            {
                if (i > 0)
                    json += ",";

                json += string.Format("{{\"id\":\"{0}\",\"name\":\"{1}\"}}", ent.ID.ToString(), ent.Name);

                i++;
            }
            json += "]";
            //Response(json);
            return json;
        }
        string ListFolderAddressList()
        {
            string folderId = Request["fcf"];
            string entityType = Request["entityType"];
            string scope = Request["scope"];
            string action = Request["action"];
            string search = Request["search"];
            if (string.IsNullOrEmpty(entityType))
            {
                entityType = "1";
            }
            int rowsPerPage = 25;
            int pageNumber = 1;
            pageNumber = MainUtil.GetInt(this.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this.Request["rowsPerPage"], 25);
            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid("05181a22-909c-41d6-ba74-83f76cdec494"));

            QueryExpression queryExp = new QueryExpression("AddressListBase");

            ConditionExpression cond = null;
            if (action == "filter")
            {
                if (!string.IsNullOrEmpty(folderId))
                {
                    cond = new ConditionExpression();
                    cond.AttributeName = "FolderId";
                    cond.Operator = ConditionOperator.Equal;
                    cond.Values = new object[] { folderId };
                    queryExp.Criteria.Add(cond);

                }
                if (!string.IsNullOrEmpty(search))
                {
                    cond = new ConditionExpression();
                    cond.AttributeName = "FullName";
                    cond.Operator = ConditionOperator.Like;
                    cond.Values = new object[] { search };
                    //cond.DataType = AttributeDataType.Number;
                    queryExp.Criteria.Add(cond);
                }
            }


            QueryListJsonRenderer contentListJsonRender = new QueryListJsonRenderer();
            contentListJsonRender.Entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.AddressList, queryExp);
            contentListJsonRender.Caller = this._caller;
            //contentListJsonRender.Entities = entities;
            contentListJsonRender.Query = savedQuery;
            contentListJsonRender.RowsPerPage = rowsPerPage;
            contentListJsonRender.CurrentPage = pageNumber;
            contentListJsonRender.TotalRowCount = 100;// SavedQueryManager.Count(_caller, queryExp, null);
            string result = contentListJsonRender.ToJson();
            return result;
        }
        #endregion

        #region
        /// <summary>
        /// 老数据报表，列表
        /// </summary>
        /// <returns></returns>
        string getReportList()
        {
            string sql = "";// "select * from v_reportlink where Avaliable=1 And (IsPublic=1) ORDER BY r.categegory,r.Name";
            sql = @"Select a.* from v_reportlink a LEFT JOIN [EntityAccessControlBase] b
                    on a.ValueId = b.EntityId
                    LEFT Join RoleBase c on b.ObjectId = c.RoleId
                    LEft Join SystemUserRoles d ON c.RoleId = d.RoleId
                    WHERE a.Avaliable=1 And 
                    (a.IsPublic=1 OR (d.SystemUserId='{0}' ))
                    ORDER BY a.categoryNo,a.Name
                   ";
            sql = string.Format(sql, _caller.UserID);
            DataSet ds = AppDataSource.GetDataSet(_caller, sql, null);
            return DataUtil.ToJsonFromDataSet(ds);
        }
        #endregion

        #region event
        string LoadEventHoverPage()
        {
            string path = this._context.Server.MapPath("/_ui/_pageBlockTemplate/EventHover.htm");
            string result = FileUtil.ReadFromFile(path);
            ActivityEvent ae = null;
            string id = Request["id"];
            ae = ActivityManager.GetActivity(_caller, new Guid(id));
            EntityPageRender render = new EntityPageRender();
            render.Caller = this._caller;
            render.RetURL = Request["retURL"];
            render.Render(result, ae.InnerEntity);
            return render.HTMLResult;

        }
        string LoadTaskHoverPage()
        {
            string path = this._context.Server.MapPath("/_ui/_pageBlockTemplate/TaskHover.htm");
            string result = FileUtil.ReadFromFile(path);
            ActivityTask ae = null;
            string id = Request["id"];
            ae = ActivityManager.GetTask(_caller, new Guid(id));
            EntityPageRender render = new EntityPageRender();
            render.Caller = this._caller;
            string retURL = HttpUtility.UrlEncode(Request["retURL"]);
            render.RetURL = retURL;
            render.Render(result, ae.InnerEntity);
            return render.HTMLResult;

        }
        string LoadMeetingHoverPage()
        {
            string path = this._context.Server.MapPath("/_ui/_pageBlockTemplate/act/MeetingHover.htm");
            string result = FileUtil.ReadFromFile(path);
            Supermore.Meetings.Meeting ae = null;
            string id = Request["id"];
            ae = new Supermore.Meetings.MeetingManager().GetMeeting(_caller, new Guid(id));
            EntityPageRender render = new EntityPageRender();
            render.Caller = this._caller;
            string retURL = HttpUtility.UrlEncode(Request["retURL"]);
            render.RetURL = retURL;
            render.Render(result, ae.InnerEntity);
            return render.HTMLResult;

        }
        string LoadPlanHoverPage()
        {
            string path = this._context.Server.MapPath("/_ui/_pageBlockTemplate/act/PlanHover.htm");
            string result = FileUtil.ReadFromFile(path);
            PlanEntity ae = null;
            string id = Request["id"];
            ae = PlanManager.GetPlan(_caller, new Guid(id));
            EntityPageRender render = new EntityPageRender();
            render.Caller = this._caller;
            string retURL = HttpUtility.UrlEncode(Request["retURL"]);
            render.RetURL = retURL;
            render.Render(result, ae.InnerEntity);
            return render.HTMLResult;
        }
        /// <summary>
        /// 活动事件邀请人搜索 srtp=005&go=1&srch=
        /// </summary>
        /// <returns></returns>
        string ActivityRelationSearch()
        {
            /*
            go	=1
            srch=
            srtp=005
             */
            /*
             while(1);
{"reachMaxRows":"0","contacts":[{"owner":"","name":"liu jack","company":"","id":"0059000000390Wh"},{"owner"
:"","name":"liu lan","company":"","id":"005900000039oIN"},{"owner":"","name":"璞","company":"","id":"00590000003y68m"
}]}
             */
            //string strSql="SELECT * FROM SystemUserBase ";
            EntityCollection entities = null;
            QueryExpression queryExpression = new QueryExpression();
            queryExpression.IsPaged = false;
            //extraQueryExpression.PageInfo.PageSize = rowsPerPage;
            // extraQueryExpression.PageInfo.PageNumber = pageNumber;
            string srtp = this._context.Request["srtp"];//搜索类型(all,myunit(本部门),005(用户),00Q(潜在客户),003(联系人),023(资源),a0V(人员)
            string srch = this._context.Request["srch"];
            string querySql = "";
            if (srtp == "myunit")
            {
                ConditionExpression cond = new ConditionExpression();
                cond.AttributeName = "BusinessUnitId";
                cond.Operator = ConditionOperator.Equal;
                cond.Values = new object[] { _caller.BussinessUnitId };
                cond.LogicalOperator = LogicalOperator.And;
                queryExpression.Criteria.Add(cond);

                cond = new ConditionExpression();
                cond.DataType = AttributeDataType.Boolean;
                cond.AttributeName = "IsDisabled";
                cond.Operator = ConditionOperator.Equal;
                cond.Values = new object[] { 0 };
                cond.LogicalOperator = LogicalOperator.And;
                queryExpression.Criteria.Add(cond);
                //SystemUserManager.
                //SystemUserManager userManager = new SystemUserManager();
                //userManager.
            }

            if (!string.IsNullOrEmpty(srch))
            {
                //ConditionOperator condOperator = ConditionOperator.Contains;
                //extraQueryExpression.Criteria.AddCondition("FullName", condOperator, srch);
                // QueryExpression extraQueryExpression = new QueryExpression();
                FilterExpression subFilter = new FilterExpression();
                ConditionExpression cond = new ConditionExpression();
                cond.AttributeName = "FullName";
                cond.Operator = ConditionOperator.Contains;
                cond.Values = new object[] { srch };
                cond.LogicalOperator = LogicalOperator.Or;
                subFilter.Add(cond);

                cond = new ConditionExpression();
                cond.AttributeName = "UserName";
                cond.Operator = ConditionOperator.Contains;
                cond.Values = new object[] { srch };
                cond.LogicalOperator = LogicalOperator.Or;
                subFilter.Add(cond);

                queryExpression.Criteria.AddFilter(subFilter);

            }
            queryExpression.AddOrder("FullName", OrderType.Ascending);

            string _json = "{\"reachMaxRows\":\"0\",\"contacts\":[";
            entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.SystemUser, queryExpression);
            int i = 0;
            foreach (Entity a in entities)
            {
                SystemUser systemUser = new SystemUser(a);
                if (i > 0)
                    _json += ",";
                _json += string.Format("{{\"owner\":\"\",\"name\":\"{1}({2})\",\"company\":\"\", \"id\":\"{0}\"}}", systemUser.ID, systemUser.FullName, systemUser.UserName);
                //{"owner":"","name":"liu jack","company":"","id":"0059000000390Wh"}
                i++;
            }
            _json += "]}";
            return _json;
        }
        #endregion


        #region codes
        string GetJsonStringCodes()
        {
            string parentDeptId = Request["node"];
            string attributeName = Request["AttributeName"];
            string enumId = Request["EnumId"];

            if (!MainUtil2.IsID(parentDeptId))
                parentDeptId = "";
            StringBuilder sb = new StringBuilder();
            sb.Append("[");
            EntityCollection entities = null;

            if (!string.IsNullOrEmpty(enumId))
                entities = StringCodeManager.GetFieldPicklist(_caller, new Guid(enumId), parentDeptId);
            else
                entities = StringCodeManager.GetFieldPicklist(_caller, attributeName, parentDeptId);

            int c = 0;
            foreach (Entity entinty in entities)
            {
                if (c > 0)
                    sb.Append(",");
                sb.Append("{");
                sb.AppendFormat(" \"id\": \"{0}\",\"text\": \"{1}\",\"attributeValue\": \"{1}\",\"leaf\":false,\"cls\":\"folder\"", entinty.ID, entinty.Name);
                sb.Append("}");
                c++;
            }
            sb.Append("]");
            return sb.ToString();
        }
        #endregion

        #region 日志评鉴
        string GetUserJournal()
        {
            string userId = Request["userId"];
            string year = Request["year"];
            QueryExpression queryExp = new QueryExpression();

            ConditionExpression cond = new ConditionExpression("UserId", ConditionOperator.Equal, userId);
            queryExp.Criteria.Add(cond);

            cond = new ConditionExpression("JournalYear", ConditionOperator.Equal, year);
            queryExp.Criteria.Add(cond);

            OrderExpression order = new OrderExpression();
            order.AttributeName = "JournalMonth";

            queryExp.Orders.Add(order);

            EntityCollection cols = EntityManager.GetEntities(_caller, EntityTemplateIDs.WorkLogComment, queryExp);
            return DataUtil.ToJsonFromEntities(cols);
        }
        string SaveUserJournalComment()
        {
            bool isCreated = false;
            Guid newEntityId = Guid.NewGuid();
            Entity insEntity = null;
            string strId = id;
            Template _template = TemplateManager.GetTemplate(_caller.OrganizationId, EntityTemplateIDs.WorkLogComment);
            if (!string.IsNullOrEmpty(strId))
                insEntity = EntityManager.GetEntity(_caller, _template, new Guid(strId));
            if (insEntity == null)
            {
                insEntity = new Entity(newEntityId, _template.ID, new Guid(_caller.CustomerID));
                isCreated = true;
            }
            insEntity.BeginEdit();

            insEntity.Fields["ManagerComment"].Value = Request["comment"];
            insEntity.Fields["CommentOn"].Value = DateTime.Now;

            insEntity.Fields["ManagerId"].Value = _caller.UserID;
            string userId = Request["userId"];
            insEntity.Fields["UserId"].Value = userId;
            insEntity.Fields["Name"].Value = EntityManager.GetEntityName(_caller, EntityTemplateIDs.SystemUser, new Guid(userId));

            insEntity.Fields["Score"].Value = Request["score"];
            insEntity.Fields["JournalYear"].Value = Request["JournalYear"];
            insEntity.Fields["JournalMonth"].Value = Request["JournalMonth"];

            insEntity.Fields["ModifiedBy"].Value = _caller.UserID;
            insEntity.Fields["ModifiedOn"].Value = DateTime.Now;

            bool isSaved = insEntity.EndEdit();
            return string.Empty;
        }
        #endregion
        string LoadResourceHoverPage()
        {
            string path = this._context.Server.MapPath("/_ui/_pageBlockTemplate/ResourceHover.htm");
            string result = FileUtil.ReadFromFile(path);
            Supermore.OrgResource.ResourceAppointment ae = null;
            string id = Request["id"];
            ae =  OrgResourceManager.GetResourceActivity(_caller, new Guid(id));
            EntityPageRender render = new EntityPageRender();
            render.Caller = this._caller;
            render.RetURL = Request["retURL"];
            render.Render(result, ae.InnerEntity);
            return render.HTMLResult;
        }
        string _json = "";
        /// <summary>
        /// 查询待填的对象
        /// </summary>
        /// <returns></returns>
        string GetWaitingEditObject()
        {

            string sql = string.Format("select * from ObjectActionBase Where [WriteBy]='{0}'", this._caller.UserID);
            DataSet ds = AppDataSource.GetDataSet(this._caller, sql, null);
            _json += "{\"status\":1,";
            _json += "\"msg\":\"\",";
            //  _json += "\"rowsPerPage\":" + rowsPerPage + ",";
            // _json += "\"page\": " + pageNumber + ",";
            _json += "\"listData\":[";
            int i = 0;
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                // Supermore.Contents.Content content = new Supermore.Contents.Content(entity);
                if (i > 0)
                    _json += ",";

                string ObjectId = StringUtil.GetString(dr["ObjectId"]);
                string ObjectTypeCode = StringUtil.GetString(dr["ObjectTypeCode"]);
                string name = StringUtil.GetString(dr["Name"]);
                string createdOn = StringUtil.GetString(dr["CreatedOn"]);

                _json += string.Format("{{\"ObjectId\":\"{0}\",\"ObjectTypeCode\":\"{1}\",\"Name\":\"{2}\",\"CreatedOn\":\"{3}\"", ObjectId, ObjectTypeCode, name, createdOn);
                _json += "}";

                i++;
            }

            _json += "]}";
            return _json;
        }
        public HttpRequest Request
        {
            get { return this._context.Request; }
        }
    }
}