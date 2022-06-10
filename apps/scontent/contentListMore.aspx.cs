using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;
using Supermore.Data.Query;
using Supermore.Data;
using System.Text;
using Supermore.Contents;
using Supermore.Security;
using Supermore.Queries;

namespace WebClient.apps.scontent
{
    public partial class contentListMore : System.Web.UI.Page
    {
        CallContext _caller;
        int pageSize=25,  pageNumber=1;
        string strFolders = "";
        string queryId = "";
        EntityCollection collection = null;
        int objectTypeCode = 0;
        bool isPostSearch = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            _caller = AppDataSource.GetCallContext();
            strFolders = Request["folderId"];
            queryId = Request["queryid"];
            pageNumber = MainUtil.GetInt(Request["page"],1);
            objectTypeCode = MainUtil.GetInt(Request["contentTypeCode"], 1);

            if (string.IsNullOrEmpty(strFolders))
            {
                strFolders = Request["folderPicker"];
               // strFolders = Request["folderId"];
            }
           
            // 
            EntityCollection entities = null;
            if (objectTypeCode==2)
                entities = ItemTreeManager.GetAllFolders(_caller, ObjectTypeCodes.Notice);
            else
                entities = ItemTreeManager.GetAccessFolders(_caller, ObjectTypeCodes.Content);
           // this.folderPicker.EnableAccess = true;
            this.folderPicker.DataSource = entities;
            this.folderPicker.SelectValue = strFolders;
            if (Request["searchBtn"] != null)
            {
                pageNumber = 1;
                isPostSearch = true;
            }

            //if (!string.IsNullOrEmpty(queryId))
            //{
            if (objectTypeCode == 2)
                GetMoreNotices();
            else
                GetMoreContents();

            GetMoreByQueryContents();
            //}
            //else
            //{
            //}
            hiddenFields.RemoveHidden("folderId");
            hiddenFields.RemoveHidden("folderPicker");
            hiddenFields.RemoveHidden("srch_StartDate");
            hiddenFields.RemoveHidden("srch_EndDate");
            hiddenFields.RemoveHidden("srch_Title");
            hiddenFields.RemoveHidden("searchBtn");
            hiddenFields.RemoveHidden("t");
            hiddenFields.RemoveHidden("businessunitid_lkid");
        }
        void GetMoreByQueryContents()
        {
            //SavedQuery savedQuery = SavedQueryManager.GetSavedQuery(_caller, new Guid(queryId));
            ///apps/scontent/contentListMore.aspx?t=home&page=1&folderId=
            //Template template = savedQuery.Template;// TemplateManager.GetTemplate(new Guid(_caller.CustomerID), ObjectTypeCodes.Content);
            // collection = SavedQueryManager.GetEntityies(_caller, savedQuery, 50,pageNumber,null);
            //RenderGrid(collection);
            string title = Request["srch_Title"];

            this.NextPageUrl = string.Format("/apps/scontent/contentListMore.aspx?t=home&queryid={0}&page={1}", queryId, pageNumber + 1);
                        
           this.PrePageUrl = string.Format("/apps/scontent/contentListMore.aspx?t=home&queryid={0}&page={1}", queryId, pageNumber - 1);

            if (objectTypeCode != 0)
            {
                this.NextPageUrl += "&contentTypeCode=" + objectTypeCode;
                this.PrePageUrl += "&contentTypeCode=" + objectTypeCode;
            }
            if (!string.IsNullOrEmpty(Request["srch_EndDate"]))
            {
                string endDate = Request["srch_EndDate"];
                this.NextPageUrl += "&srch_EndDate=" + endDate;
                this.PrePageUrl += "&srch_EndDate=" + endDate;
            }
            if (!string.IsNullOrEmpty(Request["srch_StartDate"]))
            {
                string startDate = Request["srch_StartDate"];
                this.NextPageUrl += "&srch_StartDate=" + startDate;
                this.PrePageUrl += "&srch_StartDate=" + startDate;
            }

            string strFolders = "";

            strFolders = Request["folderId"];
            if (string.IsNullOrEmpty(strFolders))
            {
                strFolders = Request["folderPicker"];
            }
            if (!string.IsNullOrEmpty(strFolders))
            {
                this.NextPageUrl += "&folderId=" + strFolders;
                this.PrePageUrl += "&folderId=" + strFolders;
            }
            //查询标题
            if (!string.IsNullOrEmpty(title))
            {
                this.NextPageUrl += "&srch_Title=" + title;
                this.PrePageUrl += "&srch_Title=" + title;
            }

            if (pageNumber <= 1)
                this.PrePageUrl = "#";
            if (collection.Count==0)
                this.NextPageUrl = "#";
        }
        void GetMoreContents()
        {
                                    
            string isimportant = Request["isimportant"];
          
            //string contenttype = Request["contenttype"];
            if (isimportant == "1")
            {
                collection = ContentManager.GetImportantTop6News(_caller, 1, 50);
            }
            else
            {
                QueryExpression queryExp = new QueryExpression();
                queryExp.IsPaged = true;
                queryExp.PageInfo.PageNumber = pageNumber;
                queryExp.PageInfo.Count = pageSize;
                
                ConditionExpression conditionExpression = new ConditionExpression();
                conditionExpression.AttributeName = "StateCode";
                conditionExpression.Operator = ConditionOperator.Equal;
                conditionExpression.Values = new object[] { 1 };
                conditionExpression.DataType = AttributeDataType.Number;
                queryExp.Criteria.Add(conditionExpression);

                if (objectTypeCode!=0) //分类
                {
                    conditionExpression = new ConditionExpression();
                    conditionExpression.AttributeName = "ContentTypeCode";
                    conditionExpression.Operator = ConditionOperator.Equal;
                    conditionExpression.Values = new object[] { objectTypeCode };
                    conditionExpression.DataType = AttributeDataType.Number;
                    queryExp.Criteria.Add(conditionExpression);
                }
                /*
                if (!string.IsNullOrEmpty(strFolders))
                {
                    string[] folderIds = strFolders.Split(',');

                    conditionExpression = new ConditionExpression();
                    conditionExpression.AttributeName = "FolderId";
                    conditionExpression.Operator = ConditionOperator.In;
                    conditionExpression.Values = folderIds;
                    queryExp.Criteria.Add(conditionExpression);
                }
                */
                strFolders = Request["folderId"];
                if (string.IsNullOrEmpty(strFolders))
                {
                    strFolders = Request["folderPicker"];
                }

                if (!string.IsNullOrEmpty(strFolders))
                {
                    conditionExpression = new ConditionExpression();
                    conditionExpression.AttributeName = "FolderId";
                    conditionExpression.Operator = ConditionOperator.In;
                    conditionExpression.Values = new object[] { strFolders };
                    queryExp.Criteria.Add(conditionExpression);
                }

                if (isPostSearch)
                { }
                string title = Request["srch_Title"];
                if (!string.IsNullOrEmpty(title))
                {
                    conditionExpression = new ConditionExpression();
                    conditionExpression.AttributeName = "Title";
                    conditionExpression.Operator = ConditionOperator.Contains;
                    conditionExpression.Values = new object[] { title };
                    queryExp.Criteria.Add(conditionExpression);
                }

                string stratDate = Request["srch_StartDate"];
                if (!string.IsNullOrEmpty(stratDate))
                {
                    conditionExpression = new ConditionExpression();
                    conditionExpression.AttributeName = "CreatedOn";
                    conditionExpression.Operator = ConditionOperator.GreaterEqual;
                    conditionExpression.Values = new object[] { stratDate };
                    queryExp.Criteria.Add(conditionExpression);
                }

                string endDate = Request["srch_EndDate"];
                if (!string.IsNullOrEmpty(endDate))
                {
                    conditionExpression = new ConditionExpression();
                    conditionExpression.AttributeName = "CreatedOn";
                    conditionExpression.Operator = ConditionOperator.LessEqual;
                    conditionExpression.Values = new object[] { endDate };
                    queryExp.Criteria.Add(conditionExpression);
                }
                string businessunitid = Request["businessunitid_lkid"];
                if (!string.IsNullOrEmpty(businessunitid))
                {
                    conditionExpression = new ConditionExpression();
                    conditionExpression.AttributeName = "BusinessUnitId";
                    conditionExpression.Operator = ConditionOperator.Equal;
                    conditionExpression.Values = new object[] { businessunitid };
                    queryExp.Criteria.Add(conditionExpression);
                }
                queryExp.AddOrder("CreatedOn", OrderType.Descending);

                Template template = TemplateManager.GetTemplate(new Guid(_caller.CustomerID), ObjectTypeCodes.Content);
                collection = EntityManager.GetEntities(_caller, template, queryExp);
            }

            RenderGrid(collection);
        }
        /// <summary>
        /// 
        /// </summary>
        void GetMoreNotices()
        {
            //QueryExpression queryExp = new QueryExpression();
            //queryExp.IsPaged = true;
            //queryExp.PageInfo.PageNumber = pageNumber;
            //queryExp.PageInfo.Count = pageSize;
            strFolders = Request["folderId"];
            if (string.IsNullOrEmpty(strFolders))
            {
                strFolders = Request["folderPicker"];
            }
            string stratDate = Request["srch_StartDate"];
            string endDate = Request["srch_EndDate"];
            string title = Request["srch_Title"];

            string businessunitid = Request["businessunitid_lkid"];
            //if (!string.IsNullOrEmpty(businessunitid))
            //{
            //    conditionExpression = new ConditionExpression();
            //    conditionExpression.AttributeName = "BusinessUnitId";
            //    conditionExpression.Operator = ConditionOperator.Equal;
            //    conditionExpression.Values = new object[] { businessunitid };
            //    queryExp.Criteria.Add(conditionExpression);
            //}

            collection = ContentManager.GetNotices(_caller, strFolders, stratDate, endDate, businessunitid,title, pageNumber, pageSize);

            // collection = EntityManager.GetEntities(_caller, template, queryExp);
            RenderGrid(collection);
        }
        
        void RenderGrid(List<Entity> entities)
        {
            StringBuilder sb = new StringBuilder();
            int mode = 2;
            //CallContext caller = AppDataSource.GetCallContext();
            //QueryExpression queryExp = new QueryExpression();
            //Template template = TemplateManager.GetTemplate(new Guid(caller.CustomerID), EntityTemplateIDs.WFProcess);
            //EntityCollection entities = EntityManager.GetEntities(caller, template, queryExp);
            string retURL = HttpUtility.UrlEncode(Request.RawUrl);
            //string objectId = "";
            foreach (Entity entity in entities)
            {
                string tRow = "";
                tRow += RenderStartRow(mode);
                //int stateCode = MainUtil.GetInt(entity.Fields["StateCode"].Value, 0);
                //string stateName = "办理中";
                //if (stateCode == 0)
                //    stateName = "办理中";
                //if (stateCode == 1)
                //    stateName = "办理中";
                //if (stateCode == 2)
                //    stateName = "已完成";
                //action
                // if (stateCode == 2)
               tRow += string.Format("<td  class=\" actionColumn  \">{0}</td>", "");
                // else
                //    tRow += string.Format("<td  class=\" actionColumn  \"><a title=\"催办\" class=\"actionLink\" href=\"javascript:openPopupFocus('')\">催办</a></td>", entity.ID, "", retURL);

                //name
                tRow += string.Format(" <td class=\"dataCell\"><a href=\"/apps/scontent/PreviewContent.aspx?id={0}\"  target=\"_blank\" >{1}</a></td>",entity.ID, entity.Name);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["CreatedOn"].Value));

                //Guid folderId = MainUtil.GetGuid(entity.Fields["FolderId"].Value);
                //Entity folder = ItemTreeManager.GetFolder(_caller, folderId);

                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", folder.Name);
                string createByName = "";
                string createBusinessUnitName="";
                Guid businessUnitId = MainUtil.GetGuid(entity.Fields["BusinessUnitId"].Value);
                Guid createdBy = MainUtil.GetGuid(entity.Fields["CreatedBy"].Value);
                SystemUser systemUser = SecurityAuth.GetSystemUser(createdBy);
                createByName = EntityManager.GetEntityName(_caller,EntityTemplateIDs.SystemUser,createdBy);
                if (systemUser != null)
                {
                    createByName = systemUser.FullName;
                }
               

                Guid folderId = Guid.Empty;
                string folderName = "";
                if (entity.Fields["FolderId"] != null)
                    folderId = MainUtil.GetGuid(entity.Fields["FolderId"].Value);
                if (folderId != Guid.Empty)
                {
                    folderName = EntityManager.GetEntityName(this._caller, EntityTemplateIDs.ItemTree, folderId);
                }
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", folderName);

                if (businessUnitId != Guid.Empty)
                    createBusinessUnitName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.BusinessUnit, businessUnitId);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", createBusinessUnitName);
                tRow += string.Format(" <td class=\"dataCell\">{0}</td>", createByName);
                
                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["SourceType"].Value));                
                //tRow += string.Format(" <td class=\"dataCell\">{0}</td>", StringUtil.GetString(entity.Fields["ModifiedOn"].Value));
              

                tRow += "</tr>";

                sb.Append( tRow);
                mode++;
            }
            _gridBody = sb.ToString();
        }
        string RenderStartRow(int mode)
        {
            string tRow = "";
            string css = (mode % 2) > 0 ? "even" : "odd";
            tRow = "<tr class=\" dataRow " + css + "\" onblur=\"if (window.hiOff){hiOff(this);}\" onfocus=\"if (window.hiOn){hiOn(this);}\" onmouseout=\"if (window.hiOff){hiOff(this);}\" onmouseover=\"if (window.hiOn){hiOn(this);}\">";

            return tRow;
        }
        string _gridBody;
        string _nextPageUrl = "";
        public string GridBody { get { return _gridBody; } }
        public string PrePageUrl { get; set; }
        public string NextPageUrl { get { return _nextPageUrl; } set { _nextPageUrl = value; } }
    }
}