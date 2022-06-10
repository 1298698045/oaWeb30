using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore.Contents;
using Supermore.Data.Query;
using Supermore.EntityFramework.Entities;
using Supermore.Queries;
using Supermore;
using Supermore.Data;
using Supermore.GridBuilder;
using System.Text;

namespace WebClient._ui.core.chatter.files
{
    public partial class FileTabPage : System.Web.UI.Page
    {
        CallContext _caller = null;
        private string _script = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            _script = GetFileFilterResultList();
            GetFileLib();
        }
        public void GetFileLib()
        {
            StringBuilder sb = new StringBuilder();
           EntityCollection entities = ItemTreeManager.GetFolders(_caller, ObjectTypeCodes.File);
           foreach (Entity entity in entities)
           {
               sb.Append("<li class=\"liItem\">");
               sb.Append("<a class=\"subLinkItem\" onclick=\"Chatter.FileBrowse.clickHandler(this,");
               sb.AppendFormat("'{0}', Chatter.FileBrowse.SELECTION_TYPES.WORKSPACE, '{1}'); return false\" title=\"{1}\" href=\"javascript:void(0);\"><span class=\"hyperlinkTextSpan\">{1}</span></a></li>", entity.ID, entity.Name);
               //<li class="liItem"><a class="subLinkItem" onclick="Chatter.FileBrowse.clickHandler(this, '0059000000390Wh', Chatter.FileBrowse.SELECTION_TYPES.PERSONAL_WORKSPACE, '专用库'); return false" title="专用库" href="javascript:void(0);"><span class="hyperlinkTextSpan">专用库</span></a></li>
           }
           this.FileLibHTML = sb.ToString();
        }
        public string GetFileFilterResultList()
        {
            //ContentListViewport.entityId
            string filterType = this.Request["filterType"];
            //filterType
            string filterId = this.Request["filterId"];
            //search
            string search = this.Request["search"];
            //sort
            // if (string.IsNullOrEmpty(filterId))
            filterId = "4718A162-1959-4836-BB34-E118CEBB7C87";
            QueryExpression extraQueryExpression = new QueryExpression();
            EntityCollection entities = null;
            switch (filterType)
            {
                case "ContentVersionOrganizationFileSearch"://所有文件
                    extraQueryExpression.Criteria.AddCondition("OrganizationId", ConditionOperator.Equal, new string[] { _caller.CustomerID });
                    break;
                case "ContentVersionRecentlyViewedFileSearch"://最近
                    //extraQueryExpression.Criteria.AddCondition("OwningUser", ConditionOperator.Equal, new string[] { _caller.UserID });
                    extraQueryExpression.Criteria.AddCondition("CreatedOn", ConditionOperator.LastXDays, new int[] { 30 });
                    break;
                case "ContentVersionAllUserFileSearch"://我的文件
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
                case "ContentVersionMyWorkspacesFileSearch"://我的文档库中的文件
                    break;
                case "ContentVersionPersonalWorkspaceFileSearch"://个人文档库
                    break;
                case "ContentVersionWorkspaceFileSearch"://办公文档
                    break;
            }

            SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(filterId));
            int rowsPerPage = 25;
            int pageNumber = 1;
            pageNumber = MainUtil.GetInt(this.Request["page"], 1);
            rowsPerPage = MainUtil.GetInt(this.Request["rowsPerPage"], 25);
            entities = SavedQueryManager.GetEntityies(_caller, savedQuery, rowsPerPage, pageNumber, extraQueryExpression);

            FileListJsonRenderer listProvider = new FileListJsonRenderer();
            listProvider.Entities = entities;
            listProvider.Query = savedQuery;
            listProvider.RowsPerPage = rowsPerPage;
            listProvider.CurrentPage = pageNumber;
            listProvider.TotalRowCount = SavedQueryManager.Count(_caller, savedQuery, null);
            listProvider.Execute();

            string result = listProvider.ToInitJson();
            return result;
        }

        public string InitScript
        {
            get { return _script; }
            set { _script = value; }
        }
        public string FileLibHTML { get; set; }
    }
}