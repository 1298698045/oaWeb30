using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Globalization;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using OA.Web.UI.WebControls;

using Supermore;
//using Supermore.Contents;
using Supermore.Data;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore.Activities;
using System.Text;
using Supermore.Meetings;
using Youyou.Contents;
using Youyou.Calendars;

namespace WebClient.home
{
    public partial class Home : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Md0 = DateTime.Now.Year.ToString();
            this.Md1 = (DateTime.Now.Month - 1).ToString();
            this.Md3 = DateTime.Now.DayOfYear.ToString();
            this.TimeNow = DateTime.Now.ToString("yyyy-MM-dd HH:mm");

            GetBlocks();

            GetDayEvents();
        }
        void GetBlocks()
        {
            //首页           
            try
            {
                caller = AppDataSource.GetCallContext();

                this.UserName = string.Format("{0} / {1} / {2}", WebContext.UserFullName, caller.UserName, caller.BussinessUnitName);

                GetLinks();

                string sql = " SELECT * FROM ContentPageBlockBase WHERE ContentPageId='{0}' ORDER BY SortNumber";
                sql = string.Format(sql, "00000000-0000-0000-0000-000000000001");
                //LeftBlockHTML += "<table width='100%'>";
                
                DataSet ds = DatabaseTool.GetDataSet(caller.CustomerID, sql);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    string strFolders = StringUtil.GetString(dr["QueryCondition"]);
                    string savedQueryId = StringUtil.GetString(dr["SavedQueryId"]);
                    string title = StringUtil.GetString(dr["Name"]);
                    int BlockType = MainUtil.GetInt(dr["BlockType"], 1);
                    int topRows = MainUtil.GetInt(dr["DisplayRows"], 6);
                    int objectTypeCode = MainUtil.GetInt(dr["ObjectTypeCode"], 0);
                    string moreLink = StringUtil.GetString(dr["LinkMore"]);
                    string[] folderIds = strFolders.Split(',');
                    string contentBlockId = StringUtil.GetString(dr["ContentBlockId"]);
                    string queryAPI = StringUtil.GetString(dr["QueryAPI"]);

                    //folders = ItemTreeManager.GetFolders(caller, folderIds,true);
                    if (BlockType == 1 && !string.IsNullOrEmpty(strFolders)) //内容
                    {
                        Dictionary<Entity, EntityCollection> _categoryData = new Dictionary<Entity, EntityCollection>();
                        //foreach (Entity folder in folders)
                        foreach (string folderId in folderIds)
                        {
                            Entity folder = Supermore.Contents.ItemTreeManager.GetFolder(caller, new Guid(folderId));
                            EntityCollection contents = ContentManager.GetFolderPublishContents(caller, folder.ID, topRows);
                            _categoryData.Add(folder, contents);
                        }
                        NewsBlock newsBlock = new NewsBlock();
                        newsBlock.Caller = this.caller;
                        newsBlock.MoreLink = moreLink;
                        newsBlock.BlockId = contentBlockId;
                        newsBlock.DisplayRows = topRows;
                        newsBlock.CategoryData = _categoryData;
                        newsBlock.ObjectTypeCode = objectTypeCode;
                        newsBlock.RemovedShowAfterRead = true;
                       newsBlock.Render();
                        //this.LeftBlockHTML += newsBlock.HTMLResult;
                        RenderContents(newsBlock.HTMLResult);
                        continue;
                    }
                    if (BlockType == 2) //图片
                    {
                        EntityCollection imageEntities = null;
                        foreach (string str in folderIds)
                        {
                            imageEntities = Supermore.Contents.ContentManager.GetImageContents(caller, new Guid(str), 6);
                        }
                        NewsImageBlock imgBlock = new NewsImageBlock();
                        imgBlock.Entities = imageEntities;
                        imgBlock.Caller = this.caller;
                        imgBlock.Render();
                        //this.LeftBlockHTML += imgBlock.HTMLResult;                
                        RenderContents(imgBlock.HTMLResult);
                        continue;
                    }
                    if (BlockType == 0) //待办
                    {
                        if (objectTypeCode == 123)//待办任务
                        {
                            WfTaskBlock wfTaskBlock = new WfTaskBlock();
                            wfTaskBlock.Caller = this.caller;
                            wfTaskBlock.DisplayRows = topRows;
                            wfTaskBlock.Render();
                            //this.LeftBlockHTML += wfTaskBlock.HTMLResult;                      
                            RenderContents(wfTaskBlock.HTMLResult);
                        }
                        else if (objectTypeCode == 20033)
                        {
                            //
                            SuperviseListBlock superviseListBlock = new SuperviseListBlock();
                            superviseListBlock.Caller = this.caller;
                            superviseListBlock.DisplayRows = topRows;
                            superviseListBlock.MoreLink = moreLink;
                            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(caller, new Guid(savedQueryId));
                            superviseListBlock.Entities = SavedQueryManager.GetEntityies(this.caller, savedQuery, topRows, null);
                            superviseListBlock.Title = title;
                            superviseListBlock.Render();
                            RenderContents(superviseListBlock.HTMLResult);
                            continue;
                        }
                        else if (objectTypeCode == 100100) //文件
                        {
                            DashboardFileComponent dashboardFileComponent = new DashboardFileComponent();
                            dashboardFileComponent.Caller = this.caller;
                            dashboardFileComponent.DisplayRows = topRows;
                            dashboardFileComponent.MoreLink = moreLink;
                            dashboardFileComponent.Title = title;
                            dashboardFileComponent.QueryCondition = strFolders;
                            dashboardFileComponent.QueryAPI = queryAPI;
                            if (!string.IsNullOrEmpty(savedQueryId))
                            {
                                SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(caller, new Guid(savedQueryId));
                                dashboardFileComponent.Entities = SavedQueryManager.GetEntityies(this.caller, savedQuery, topRows, null);
                            }
                            dashboardFileComponent.Render();
                            RenderContents(dashboardFileComponent.HTMLResult);
                            continue;
                        }
                    }
                    if (BlockType == 4) //温州 效能曝光
                    {
                        WFTaskTopListBlock superviseListBlock = new WFTaskTopListBlock();
                        superviseListBlock.Caller = this.caller;
                        superviseListBlock.DisplayRows = topRows;
                        superviseListBlock.MoreLink = moreLink;
                        SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(caller, new Guid(savedQueryId));
                        superviseListBlock.Entities = SavedQueryManager.GetEntityies(this.caller, savedQuery, topRows, null);
                        superviseListBlock.Title = title;
                        superviseListBlock.Render();
                        RenderContents(superviseListBlock.HTMLResult);
                        continue;
                    }
                    if (!string.IsNullOrEmpty(savedQueryId))
                    {
                        QueryContentBlock queryContentBlock = new QueryContentBlock();
                        queryContentBlock.Caller = this.caller;
                        queryContentBlock.DisplayRows = topRows;
                        queryContentBlock.ObjectTypeCode = objectTypeCode;
                        SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(caller, new Guid(savedQueryId));
                        if (savedQuery != null)
                            queryContentBlock.Entities = SavedQueryManager.GetEntityies(this.caller, savedQuery, topRows, null);
                        queryContentBlock.Title = title;
                        queryContentBlock.MoreLink = moreLink;
                        queryContentBlock.RemovedShowAfterRead = true;
                        queryContentBlock.Render();

                        //this.LeftBlockHTML += queryContentBlock.HTMLResult;
                        RenderContents(queryContentBlock.HTMLResult);
                    }
                }
                //LeftBlockHTML += "</table>";
                Supermore.Diagnostics.Trace.Log("---------------------------------9");

            }
            catch (Exception ex)
            {
                //Supermore.Diagnostics.Trace.l
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }

        void GetLinks()
        {
            try
            {
                QuickLinkBlock quickLinkBlock = new QuickLinkBlock();
                quickLinkBlock.Caller = caller;
                quickLinkBlock.Render();
                this.QuickLinkBlockHTML = quickLinkBlock.HTMLResult;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        void GetDayEvents()
        {
            try
            {
                string retURL = "%2Fhome%2Fhome.aspx";
                StringBuilder sb = new StringBuilder();
                sb.Append("<div class='eventHomeEventItems'>");
                List<ActivityEvent> events = ActivityManager.GetEvents(caller, new Guid(this.caller.UserID), DateTime.Now.ToString("yyyy-MM-dd"));
                if (events.Count == 0)
                {
                    //sb.Append("<div class='eventHomeEventItem'>今日未安排日程</div>");
                }
                foreach (ActivityEvent ae in events)
                {
                    sb.AppendFormat("<div class='eventHomeEventItem'><div class='evtLine' style='width:3px;background-color:#10a2f8;'></div><div class=\"evtTime\">{1}</div><div class='evtSubject'><a href=\"/00U/detail?id={0}&retURL={3}\">{2}</a></div></div>", ae.ID, ae.ScheduledStart.ToString("HH:mm"), ae.Subject, retURL);
                }
                sb.Append("</div>");

                MeetingManager meetingManager = new MeetingManager();
                List<MeetingItem> meetingItems = meetingManager.GetMyNotResponseMeetingItems(caller, 0);
                if (meetingItems.Count > 0)
                {
                    sb.Append("<div class='eventHomeEventItems'>");
                    foreach (MeetingItem ae in meetingItems)
                    {
                        sb.AppendFormat("<div class='eventHomeEventItem'><div class='evtLine' style='width:3px;background-color:#10a2f8;'></div><div class=\"evtTime\" style='color:#ff6849;'>{1}</div><div class='evtSubject'><a href=\"/00W/detail?id={0}&retURL={3}\">{2}</a></div></div>", ae.MeetingItemId, "[议题待填]", ae.Subject + ae.ScheduledStart, retURL);
                    }
                    sb.Append("</div>");
                }
                //待接受的会议
                EntityCollection meetings = meetingManager.GetMyNotAcceptMeetings(caller, 0);
                if (meetings.Count > 0)
                {
                    sb.Append("<div class='eventHomeEventItems'>");
                    foreach (Entity ae in meetings)
                    {
                        Meeting meeting = new Meeting(ae);
                        string name = string.Format("{0}{1}", ae.Name, meeting.ScheduledStart.ToShortDateString());
                        sb.AppendFormat("<div class='eventHomeEventItem'><div class='evtLine' style='width:3px;background-color:#10a2f8;'></div><div class=\"evtTime\" style='color:#ff6849;' title='{1} {2}' >{1}</div><div class='evtSubject'><a href=\"/apps/meetings/meetingResp.aspx?id={0}&retURL={4}\" title='{1} {3}' ><span style='color:red;font-weight:bold;'>{2}</span>{3}</a></div></div>", ae.ID, meeting.ScheduledStart.ToString("HH:mm"), "[待接受会议]", name, retURL);
                    }
                    sb.Append("</div>");
                }

                string list = sb.ToString();
                EventsHTML = list;
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        int iMode = 1;
        void RenderContents(string content)
        {
            //if ((iMode % 2) == 0)
            //{
            //    LeftBlockHTML += string.Format("<td width='48%'>{0}</td>", content);
            //    LeftBlockHTML += "</tr>";
            //}
            //else
            //{
            //    LeftBlockHTML += "<tr>";
            //    LeftBlockHTML += string.Format("<td width='48%'>{0}</td>", content);

            //}
            LeftBlockHTML += content;
            iMode++;
        }
        //星期一 2014年9月15日
        public string TodayDisplay
        {
            get
            {
                //CultureInfo ci = CultureInfo.CurrentCulture;
                //ci.
                string cDateName = DateUtil2.GetWeekNameOfDate(DateTime.Now.DayOfWeek) + "," + DateTime.Now.ToString("yyyy年MM月dd日");
                return cDateName;
            }
            // set; 
        }
        public string Md0 { get; set; }
        public string Md1 { get; set; }
        public string Md3 { get; set; }
        public string UserName { get; set; }
        public string TimeNow { get; set; }

        public string LeftBlockHTML { get; set; }
        public string QuickLinkBlockHTML { get; set; }

        public string EventsHTML { get; set; }
    }
}