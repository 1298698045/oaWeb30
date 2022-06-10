using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Contents;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.Configuration;
using Supermore.Organization;

using OA.Web.UI.FieldControls;
using OA.Web.UI.WebControls;
using System.Text;

namespace WebClient.apps.scontent
{
    public partial class overviewContents : System.Web.UI.Page
    {
        CallContext caller = null;
        int iMode = 1;
        EntityCollection folders = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            //首页
            caller = AppDataSource.GetCallContext();
            string pageId = Request["pageId"];
            string sql = " SELECT * FROM ContentPageBlockBase WHERE ContentPageId='{0}' ORDER BY SortNumber";
            sql = string.Format(sql, pageId);
            GetCategroy();
           // HTMLResult += "<table width='100%'>";
            DataSet ds = DatabaseTool.GetDataSet(caller.CustomerID, sql);
            Guid userId = new Guid(caller.UserID);
            foreach (DataRow dr in ds.Tables[0].Rows)
            {
                string strFolders = StringUtil.GetString(dr["QueryCondition"]);
                int BlockType = MainUtil.GetInt(dr["BlockType"], 1);
                int topRows = MainUtil.GetInt(dr["DisplayRows"], 6);
                string[] folderIds = strFolders.Split(',');
                string title = StringUtil.GetString(dr["Name"]);
                int objectTypeCode = MainUtil.GetInt(dr["ObjectTypeCode"], 0);
                string moreLink = StringUtil.GetString(dr["LinkMore"]);
                string contentBlockId = StringUtil.GetString(dr["ContentBlockId"]); 
                if (BlockType == 1)
                {
                    Dictionary<Entity, EntityCollection> _categoryData = new Dictionary<Entity, EntityCollection>();
                    //foreach (Entity folder in folders)
                    foreach(string folderId in folderIds)
                    {
                        if (string.IsNullOrEmpty(folderId)) continue;
                       Entity folder = ItemTreeManager.GetFolder(caller, new Guid(folderId));
                       if (folder != null)
                       {
                           ItemTree itemTree = new ItemTree(folder);
                           if (itemTree.IsPublic || folder.Access.CanRead(userId))
                           {
                               //itemTree.canr
                               EntityCollection contents = ContentManager.GetFolderPublishContents(caller, folder.ID, topRows,true);
                               //if (contents.Count > 0)
                               //{
                               _categoryData.Add(folder, contents);
                               //}
                           }
                       }
                    }
                    if (_categoryData.Count > 0)
                    {
                        NewsBlock newsBlock = new NewsBlock();
                        newsBlock.Caller = this.caller;
                        newsBlock.BlockId = contentBlockId;
                        newsBlock.ObjectTypeCode = objectTypeCode;
                        newsBlock.DisplayRows = topRows;
                        newsBlock.CategoryData = _categoryData;
                        newsBlock.MoreLink = moreLink;
                        newsBlock.Render();
                        //this.HTMLResult += newsBlock.HTMLResult;
                        RenderContents(newsBlock.HTMLResult);
                    }
                }
                if (BlockType == 2) //图片
                {
                    EntityCollection imageEntities = null;
                    foreach (string str in folderIds)
                    {
                        imageEntities = ContentManager.GetImageContents(caller,new Guid(str), 6);
                    }
                                        
                    NewsImageBlock imgBlock = new NewsImageBlock();
                    imgBlock.Entities = imageEntities;
                    imgBlock.Render();
                    //this.HTMLResult += newsBlock.HTMLResult;
                    RenderContents(imgBlock.HTMLResult);
                }
                if (BlockType == 3) //汇总
                {
                    QueryContentBlock queryContentBlock = new QueryContentBlock();
                    queryContentBlock.Caller = this.caller;
                    queryContentBlock.DisplayRows = topRows;

                    //string strFolders
                    string childFolders = GetChildFolders(strFolders);
                    childFolders = strFolders + "," + childFolders;
                    string[] folders = MainUtil2.ToStringArray(childFolders, ',');
                    EntityCollection contents = ContentManager.GetFolderPublishContents(caller, folders, topRows);
                    //EntityCollection contents = ContentManager.GetFolderPublishContents(caller, childFolders, topRows);
                    queryContentBlock.Entities = contents;
                    queryContentBlock.Title = title;
                    //queryContentBlock.MoreLink = "/apps/scontent/contentListMore.aspx?t=home&folderId=" + childFolders;
                    queryContentBlock.MoreLink = moreLink;
                    queryContentBlock.Render();
                    //this.LeftBlockHTML += queryContentBlock.HTMLResult;
                    RenderContents(queryContentBlock.HTMLResult);
                }
               
            }
            //HTMLResult += "</table>";
            this.PageTitle = DatabaseTool.GetFirstCellStr(caller.CustomerID, string.Format("SELECT Name FROM ContentPageBase WHERE ContentPageId='{0}'",pageId), "");
           
        }

        void RenderContents(string content)
        {
            //if ((iMode % 2) == 0)
            //{
            //    HTMLResult +=string.Format( "<td width='48%'>{0}</td>",content);
            //    HTMLResult += "</tr>";
            //}
            //else
            //{
            //    HTMLResult += "<tr>";
            //    HTMLResult += string.Format("<td width='48%'>{0}</td>", content);
               
            //}
            HTMLResult += content;
            iMode++;
        }
        EntityCollection allfolders = null;
        void GetCategroy()
        {
            allfolders = ItemTreeManager.GetFolders(caller, 100201);
            //EntityCollection selRecs = allfolders.Select("ParentId", "");
            //foreach (Entity entity in selRecs)
            //{
            //     string str1 = RenderDataRow(entity, 0);
            //}

        }
        string GetChildFolders(string parentId)
        {
            EntityCollection selRecs = allfolders.Select("ParentId", parentId);
            if (selRecs.Count == 0) return "";

            StringBuilder sb = new StringBuilder();
            
            foreach (Entity entity in selRecs)
            {
                string str1 = RenderDataRow(entity);
                if (!string.IsNullOrEmpty(str1))
                    sb.Append(string.Format("{0},", str1));

                str1 = GetChildFolders(entity.ID.ToString());
                if (!string.IsNullOrEmpty(str1))
                    sb.Append(string.Format("{0},", str1));
                 
            }
            return sb.ToString().TrimEnd(',');
        }
        string RenderDataRow(Entity entity)
        {
            return entity.ID.ToString();
        }

        public string HTMLResult { get; set; }
        public string PageTitle { get; set; }
    }
}