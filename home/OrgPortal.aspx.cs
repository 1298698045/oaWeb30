using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OA.Web.UI.WebControls;
using Supermore.Data;
using Supermore;
using Supermore.EntityFramework.Entities;
using System.Data;
using Supermore.Contents;
using Supermore.Queries;

namespace WebClient.home
{
    public partial class OrgPortal : System.Web.UI.Page
    {
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            this.UserName = caller.UserName;
            this.Md0 = DateTime.Now.Year.ToString();
            this.Md1 = (DateTime.Now.Month - 1).ToString();
            this.Md3 = DateTime.Now.DayOfYear.ToString();
            this.TimeNow = DateTime.Now.ToString("yyyy-MM-dd HH:mm");
            GetBlocks();
            QuickLinkBlock quickLinkBlock = new QuickLinkBlock();
            quickLinkBlock.Caller = caller;
            quickLinkBlock.Render();
            this.QuickLinkBlockHTML = quickLinkBlock.HTMLResult;
        }
        void GetBlocks()
        {
            //首页           
            string sql = " SELECT * FROM ContentPageBlockBase WHERE ContentPageId='{0}' ORDER BY SortNumber";
            sql = string.Format(sql, "00000000-0000-0000-0000-000000000001");

            DataSet ds = DatabaseTool.GetDataSet(caller.CustomerID, sql);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string strFolders = StringUtil.GetString(dr["QueryCondition"]);
                string savedQueryId = StringUtil.GetString(dr["SavedQueryId"]);
                string title = StringUtil.GetString(dr["Name"]);
                int BlockType = MainUtil.GetInt(dr["BlockType"], 1);
                int topRows = MainUtil.GetInt(dr["DisplayRows"], 6);
                int objectTypeCode = MainUtil.GetInt(dr["ObjectTypeCode"], 0);
                string[] folderIds = strFolders.Split(',');
                //folders = ItemTreeManager.GetFolders(caller, folderIds,true);

                if (BlockType == 1 && !string.IsNullOrEmpty(strFolders))
                {
                    Dictionary<Entity, EntityCollection> _categoryData = new Dictionary<Entity, EntityCollection>();
                    //foreach (Entity folder in folders)
                    foreach (string folderId in folderIds)
                    {
                        Entity folder = ItemTreeManager.GetFolder(caller, new Guid(folderId));

                        EntityCollection contents = ContentManager.GetFolderPublishContents(caller, folder.ID, topRows);                      
                        _categoryData.Add(folder, contents);                      
                    }

                    NewsBlock newsBlock = new NewsBlock();
                    newsBlock.Caller = this.caller;
                    newsBlock.DisplayRows = topRows;
                    newsBlock.CategoryData = _categoryData;
                    newsBlock.Render();
                    this.LeftBlockHTML += newsBlock.HTMLResult;
                }
                if (BlockType == 2)
                {
                    EntityCollection imageEntities = null;
                    foreach (string str in folderIds)
                    {
                        imageEntities = ContentManager.GetImageContents(caller, new Guid(str), 6);
                    }
                    NewsImageBlock imgBlock = new NewsImageBlock();
                    imgBlock.Entities = imageEntities;
                    imgBlock.Caller = this.caller;
                    imgBlock.Render();
                    this.LeftBlockHTML += imgBlock.HTMLResult;
                }
                if (BlockType == 0)
                {
                    if (objectTypeCode==123)//待办任务
                    {
                        WfTaskBlock wfTaskBlock = new WfTaskBlock();
                        wfTaskBlock.Caller = this.caller;
                        wfTaskBlock.DisplayRows = topRows;
                        wfTaskBlock.Render();
                        this.LeftBlockHTML += wfTaskBlock.HTMLResult;
                    }
                }
                if (!string.IsNullOrEmpty(savedQueryId))
                {
                    QueryContentBlock queryContentBlock = new QueryContentBlock();
                    queryContentBlock.Caller = this.caller;
                    queryContentBlock.DisplayRows = topRows;
                    queryContentBlock.Entities = SavedQueryManager.GetEntityies(this.caller, new Guid(savedQueryId),null);
                    queryContentBlock.Title = title;
                    queryContentBlock.Render();
                    this.LeftBlockHTML += queryContentBlock.HTMLResult;
                }
            }
        }
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
        public string TimeNow { get; set; }
        public string Md0 { get; set; }
        public string Md1 { get; set; }
        public string Md3 { get; set; }
        public string UserName { get; set; }

        public string LeftBlockHTML { get; set; }
        public string QuickLinkBlockHTML { get; set; }
    }
}