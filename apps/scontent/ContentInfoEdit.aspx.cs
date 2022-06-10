using System;
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
using System.IO;
using Supermore.IO;
using Supermore.Media;
using System.Text;
using Supermore.Files;
using Youyou.Contents;

namespace WebClient.apps.scontent
{
    public partial class ContentInfoEdit : System.Web.UI.Page
    {
        CallContext _caller = null;
        string businessUnitIdControlHtml = "";
        string ownerName="";
        int typeCode = 1;
        string parentId = "";
        string _title = "";
        string coverDisplay = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            this.CTitle = "";
            this.Contents = "<div style=\"font-size:16px;margin-top:20px;\">&nbsp; &nbsp; &nbsp;&nbsp;请在这输入内容</div>";
            _caller = AppDataSource.GetCallContext();
            this.ownerName = WebContext.UserFullName;
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                if (string.IsNullOrEmpty(cancelURL))
                    cancelURL = Request["retURL"];
                if (string.IsNullOrEmpty(cancelURL))
                    cancelURL = "/090/o";
                Response.Redirect(cancelURL);
            }
            if (Request["save"] != null)
            {
                SaveData(false, false);
            }
            if (Request["save_new"] != null)
            {
                SaveData(true, false);
            }
            if (Request["save_approve"] != null)
            {
                SaveData(false, true);
            }
            
            if (Request["approve_notify"] != null)
            {
                parentId = Request["id"];
                string retURL = string.Format("/apps/scontent/ApproveInfo.aspx?t=090&parentid={0}&retURL=%2f090%2fe?id={0}",parentId);
                Response.Redirect(retURL);
                return;
            }
           
            if (!Page.IsPostBack)
            {
                string retURL = Request["retURL"];
                if (string.IsNullOrEmpty(retURL))
                    retURL = "%2F090%2Fo";
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", "/090/e?type=100201&retURL=%2F090%2Fo");
                //RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", retURL);
            }
            this.BusinessUnitId = _caller.BussinessUnitId.ToString();
            this.BusinessUnitName = WebContext.BusinessUnitName; 
            GetData();
            
            BusinessUnitLookup lookup = new BusinessUnitLookup();
            lookup.EntityCode = "10";
            lookup.FieldLabel = "上级部门";
            lookup.FieldValue = this.BusinessUnitId;
            lookup.FieldName = "businessUnit";
            lookup.FieldValueText = this.BusinessUnitName;
            lookup.Render();
            businessUnitIdControlHtml = lookup.ControlHtml;

            int _itemCategoryCode = MainUtil.GetInt(Request["type"], 100201);
            this.typeCode = _itemCategoryCode;
            EntityCollection entities = ItemTreeManager.GetAllFolders(_caller, _itemCategoryCode);
            this.folderPicker.Caller = _caller;
            this.folderPicker.EnableAccess = true;
            this.folderPicker.DataSource = entities;
            this.folderPicker.SelectValue = this.FolderId;

            GetFolders();
        }
        void SaveData(bool saveNew,bool submitApprove)
        {
            
            string id = Request["id"];
            bool isUpdated = false;
            Guid orgId = new Guid(_caller.CustomerID);
            Entity entity = null;
            if (string.IsNullOrEmpty(id))
            {
                entity = new Entity(Guid.NewGuid(), EntityTemplateIDs.Content, orgId);
                id = entity.ID.ToString();
            }
            else
            {
                entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.Content, new Guid(id));
                isUpdated = true;
            }
            _title = Request["cpn1"];
            //string userName = Request["Username"];
            string folderId = Request["parent_lkid"];
            folderId = Request["folderPicker"];
            if (string.IsNullOrEmpty(folderId) || string.IsNullOrEmpty(_title))
                return;
           
            entity.BeginEdit();
            entity.Fields["Title"].Value = _title;
            entity.Fields["ContentTypeCode"].Value = typeCode;
            
            if (!string.IsNullOrEmpty(folderId))
                entity.Fields["FolderId"].Value = folderId;

            entity.Fields["ContentBody"].Value = Request["cpn4"];
            entity.Fields["KeyWords"].Value = Request["KeyWords"];
           
            string parentName = Request["businessUnit"];
            string businessUnitId = Request["businessUnit_lkid"];
            if (!string.IsNullOrEmpty(businessUnitId))
                entity.Fields["BusinessUnitId"].Value = businessUnitId;
            //entity.Fields["Description"].Value = Request["Description"];                        
            //entity.Fields["BusinessUnitId"].Value = Request["BusinessUnit"];
            //if (Request["infoSms"] != null)
            //    entity.Fields["InfoSms"].Value = Request["infoSms"];
            //if (Request["infoSms"] != null)
            //    entity.Fields["InfoEmail"].Value = Request["infoEmail"];
            if (Request["chkIsImportant"] != null)
                entity.Fields["IsImportant"].Value = true;
            else
                entity.Fields["IsImportant"].Value = false;

            if (Request["chkIsTop"] != null)//置顶
                 entity.Fields["IsTop"].Value = 1;
            else
                entity.Fields["IsTop"].Value = 0;

            string endTopDate = Request["endTopDate"];
            if (entity.Fields["EndTopDate"] != null && !string.IsNullOrEmpty(endTopDate))
            {
                entity.Fields["EndTopDate"].Value = endTopDate;
            }
            entity.Fields["IsPublic"].Value = 1;

            //未知
            string Position = Request["Position"];
            if (entity.Fields["Position"] != null && !string.IsNullOrEmpty(Position))
            {
                entity.Fields["Position"].Value = Position;
            }
            

            if (Request["attachRightCode"] != null)
            {
                if (Request["AttachRightCode"] != null)
                {
                    entity.Fields["AttachRightCode"].Value = Request["AttachRightCode"];
                }
            }
            //短信提醒
            if (entity.Fields["RemindSms"] != null)
            {
                if (Request["chkRemindSms"] != null)
                    entity.Fields["RemindSms"].Value = true;
                else
                    entity.Fields["RemindSms"].Value = false;
            }
            if (!isUpdated)
            {                
                entity.Fields["OrganizationId"].Value = orgId;
                entity.Fields["CreatedBy"].Value = _caller.UserID;
                entity.Fields["CreatedOn"].Value = DateTime.Now;
                entity.Fields["ModifiedBy"].Value = _caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
            }
            else
            {
                entity.Fields["ModifiedBy"].Value = _caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
            }
            //发布时间
            string createdOn = Request["CreatedOn"];
            if (string.IsNullOrEmpty(createdOn))
            {
                createdOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
            }
            //if(DateUtil.is
            entity.Fields["CreatedOn"].Value = createdOn;
            Entity itemTree = EntityManager.GetEntity(_caller, EntityTemplateIDs.ItemTree, new Guid(folderId));
            bool needCensor = MainUtil.GetBool(itemTree.Fields["NeedCensor"].Value, false);
            if (needCensor) //需要审核就状态
            {
                if (submitApprove)
                {
                    entity.Fields["StateCode"].Value = 0;
                    entity.Fields["StatusCode"].Value = 1; //提交审核

                    //随机分配审批人
                    if (!string.IsNullOrEmpty(folderId))
                    {
                        Guid approverId = ContentFolderManager.AssignApprover(_caller, new Guid(folderId));
                        if (approverId != Guid.Empty)
                        {
                            if (approverId == new Guid(_caller.UserID)) //如果发布者与审核者是一个，就直接发布
                            {
                                entity.Fields["StateCode"].Value = 1;
                                entity.Fields["StatusCode"].Value = 2; //审批完毕
                            }
                            entity.Fields["ApprovedBy"].Value = approverId;
                            if (entity.Fields["ApprovedOn"] != null)
                                entity.Fields["ApprovedOn"].Value = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                        }
                        else
                        {
                            //没有获取到审核人，直接发布
                            entity.Fields["StateCode"].Value = 1;
                            entity.Fields["StatusCode"].Value = 2;
                        }
                    }
                }
                else
                {
                    entity.Fields["StateCode"].Value = 0;
                    entity.Fields["StatusCode"].Value = 1; // 1 提交审核 2 审核发布
                }
            }
            else
            {
                entity.Fields["StatusCode"].Value = 2; //2 审核完成
                entity.Fields["StateCode"].Value = 1;
            }
            coverDisplay = Request["coverDisplay"];
            //封皮方式
            if (entity.Fields["CoverDisplay"] != null && !string.IsNullOrEmpty(coverDisplay))
                entity.Fields["CoverDisplay"].Value = coverDisplay;
          
            //entity.Fields["BusinessUnitId"].Value = orgId;    //部门
           
            bool isSaved = entity.EndEdit();
            if (isSaved)
            {                
                //@@TOD 加人
                if (!string.IsNullOrWhiteSpace(Request["readers"]))
                {
                    Guid guid = new Guid();
                    var readers = Request["readers"];
                    Guid cgid = entity.ID;
                    for (int i = 0; i < readers.Split(',').Length; i++)
                    {
                        Guid.TryParse(readers.Split(',')[i], out guid);
                        //InviteContentReader(_caller, cgid, guid);
                        Youyou.Contents.ContentManager mgr = new Youyou.Contents.ContentManager();
                        mgr.InviteContentReader(_caller, new Guid(id), guid);
                    }

                }
            }
            //保存图片
            string imgSrc = SaveFiles(id);

            SaveAttachFiles(_title, id);//附件

            string retURL = Request["retURL"];
            string entityCode = Request["t"];
            /*
            if (saveNew)
            {
                string save_new_url = Request["save_new_url"];
                if (string.IsNullOrEmpty(save_new_url))
                    save_new_url = "/090/e?type=100201&retURL=%2F090%2Fo";

                Response.Redirect(save_new_url);
            }
            else
            */
            {
                retURL = string.Format("/{0}/detail?id={1}&objectTypeCode=100201&retURL=%2f{0}%2fo", entityCode, entity.ID);
                Response.Redirect(retURL);
            }
        }
         
        /// <summary>
        /// 保存图片
        /// </summary>
        /// <param name="objectId"></param>
        /// <returns></returns>
        string SaveFiles(string objectId)
        {
            string imgURL = "";
            try
            {

                string rootPath = IOPaths.CustomerMediaCodePath + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM");
                string virtualPath = DateTime.Now.ToString("yyyy") + "/" + DateTime.Now.ToString("MM") + "/";
                if (!Directory.Exists(rootPath))
                {
                    Directory.CreateDirectory(rootPath);
                }
               
                imgURL = Settings.GetSetting("MediaWebSite");
                if (!string.IsNullOrEmpty(imgURL))
                {
                    if (imgURL.Substring(imgURL.Length - 1, 1) != "/")
                    {
                        imgURL = imgURL + "/" + _caller.CustomerCode + "/";
                    }
                }
                //string targetFile = "";
                //string fileName = "";
                //string extName = "";
                //bool isUpload = false;
                Guid newid = Guid.NewGuid();

                //for (int c = 0; c < this.Request.Files.Count; c++)
                IList<HttpPostedFile> imgfiles = this.Request.Files.GetMultiple("mainImg[]");
                for (int c = 0; c < imgfiles.Count; c++)
                {
                    HttpPostedFile file = imgfiles[c];
                    //HttpPostedFile file = Request.Files[c];
                    if (file.ContentLength == 0)
                        continue;

                    ImageManager.UploadImage(this._caller, file, Guid.NewGuid(), ObjectTypeCodes.Content, objectId);
                    //Supermore.Diagnostics.Trace.LogTest(coverDisplay);
                    if (coverDisplay == "BelowTitleBigImg") //大图时候同步过来
                    {
                        string extName = FileUtil2.GetFileExtension(file.FileName);
                        string rootPath2 = Server.MapPath("/SysFiles/images");
                        
                        string fileName2 = objectId.ToUpper() + extName;
                        file.SaveAs(rootPath2 + "\\" + fileName2);
                        string imgPath = "/SysFiles/images/" + fileName2;
                        Supermore.Contents.ContentManager.CreateImageNews(this._caller, new Guid(objectId), _title, imgPath, extName, file.ContentLength);
                    }
                }
                imgURL += virtualPath;
                
            }
            catch(Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            return imgURL;
        }

        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="objectId"></param>
        void SaveAttachFiles(string parentName, string parentId)
        {
            string parentType = "100201";// Request["type"];
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("pid", Request["pid"]);
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("type", parentType);
            //this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("pid", Request["pid"]);
            // this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("type", parentType);
            if (string.IsNullOrEmpty(parentType))
                parentType = "unkown";

            long fileSize = 0;
            string rootPath = "";
            // DateTime.Now.ToString("yyyy") + "/" + Datestring virtualPath =Time.Now.ToString("MM") + "/";
            string virtualPath = "";
            
            try
            {
                rootPath = IOPaths.AttachFiles + "\\" + parentType + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + DateTime.Now.ToString("dd");
                if (!Directory.Exists(rootPath))
                {
                    Directory.CreateDirectory(rootPath);
                }
                Guid fileId = Guid.Empty;
                bool isUpload = false;
                //string parentName = "";

                string targetFile = "";
                string fileName = "";
                string extName = "";
                int seqNo = 1;
                //string parentId = Request["pid"];
                //foreach (string key in this.Request.Files.Keys)
                //for (int c = 0; c < this.Request.Files.Count; c++)
                IList<HttpPostedFile> attachFiles = this.Request.Files.GetMultiple("attachFile[]");
                for (int c = 0; c < attachFiles.Count; c++)
                {
                    //HttpPostedFile file = Request.Files.Get(key);
                    //HttpPostedFile file = Request.Files[c];
                    HttpPostedFile file = attachFiles[c];
                    fileSize = file.ContentLength;
                    if (fileSize == 0)
                    {
                        // Supermore.Diagnostics.Trace.LogError("Upload File attach size 0.");
                        continue;
                    }
                    //fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                    fileName = FileUtil2.GetFileName(file.FileName);
                    extName = FileUtil2.GetFileExtension(file.FileName).ToLower();

                    if (extName == ".exe" || extName == ".js" || extName == ".asp" || extName == ".aspx" || extName == ".jsp" || extName == ".php"
                        || extName == ".lnk" || extName == ".css" || extName == ".dll" || extName == ".msu" || extName == ".shtml")
                    {
                        continue;
                    }
                    //if (string.Compare(extName, ".zip", true)==0)//相等
                    //{
                    //    //UnzipFiles(file);
                    //    //return;
                    //}
                    fileId = Guid.NewGuid();

                    //string actualFileName = string.Format("{0}_{1}_{2}{3}", parentType, DateTime.Now.ToString("yyyyMMddHHmmss"), seqNo, extName);
                    string actualFileName = string.Format("{0}{1}", fileId.ToString().ToUpper(), extName);
                    targetFile = rootPath + "\\" + actualFileName;
                    //virtualPath += actualFileName;
                    virtualPath = string.Format("/{0}/{1}/{2}/{3}/{4}", parentType, DateTime.Now.ToString("yyyy"), DateTime.Now.ToString("MM"), DateTime.Now.ToString("dd"), actualFileName);

                    file.SaveAs(targetFile);
                    isUpload = true;
                    /*
                    if (extName.Equals(".doc", StringComparison.InvariantCultureIgnoreCase) || extName.Equals(".docx", StringComparison.InvariantCultureIgnoreCase)
                        || extName.Equals(".xls", StringComparison.InvariantCultureIgnoreCase)
                        || extName.Equals(".xlsx", StringComparison.InvariantCultureIgnoreCase))
                    {
                        mFileBody = new byte[file.ContentLength];
                        Stream objStream = file.InputStream;
                        objStream.Read(mFileBody, 0, file.ContentLength);
                    }
                    */
                    #region upload
                    if (isUpload)
                    {

                        Entity entity = new Entity(fileId, EntityTemplateIDs.RelatedAttachment, new Guid(_caller.CustomerID));
                        entity.BeginEdit();
                        entity.Fields["Name"].Value = fileName;
                        entity.Fields["FileExtension"].Value = extName.TrimStart('.');
                        entity.Fields["FileLocation"].Value = virtualPath;// Request["tsk13"];                
                        entity.Fields["FileSize"].Value = fileSize;
                        entity.Fields["ParentTypeCode"].Value = parentType;
                        entity.Fields["ParentId"].Value = parentId;
                        entity.Fields["ParentName"].Value = parentName;
                        entity.Fields["CreatedBy"].Value = _caller.UserID;
                        entity.Fields["CreatedOn"].Value = DateTime.Now;
                        entity.Fields["ModifiedBy"].Value = _caller.UserID;
                        entity.Fields["ModifiedOn"].Value = DateTime.Now;
                        entity.Fields["OwningUser"].Value = _caller.UserID;
                        entity.Fields["OrganizationId"].Value = _caller.CustomerID;
                        //FileTypeCode
                        entity.EndEdit();
                        /*可以直接读目录文件了*/

                    }
                    #endregion
                    seqNo++;
                }
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }

        }
        void GetData()
        {
            string strId = Request["id"];
            if (string.IsNullOrEmpty(strId))
            {
                RenderAttachRightCodeControlHTML(0);
                this.CreatedOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                return;
            }
            this.PreviewURL = Supermore.Configuration.Settings.GetSetting("Sites.Portal") + "ViewArticle.aspx?id=" + strId;

            Entity entity = null;
            EntityId = strId;
            entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.Content, new Guid(strId));
            if (entity != null)
                this.CreatedOn = entity.CreatedOn.ToString("yyyy-MM-dd HH:mm:sss");
            CTitle = StringUtil.GetString(entity.Fields["Title"]);
            Contents = StringUtil.GetString(entity.Fields["ContentBody"]);
            this.KeyWords = StringUtil.GetString(entity.Fields["KeyWords"]);
            this.FolderId = StringUtil.GetString(entity.Fields["FolderId"].Value);

            this.FolderName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.ItemTree, new Guid(FolderId));
            Guid businessUnitId = MainUtil.GetGuid(entity.Fields["BusinessUnitId"].Value);
            this.BusinessUnitId = businessUnitId.ToString();
            BusinessUnit org = OrganizationManager.GetBusinessUnit(_caller, businessUnitId);
            if (org != null)
                this.BusinessUnitName = org.Name;
            //this.ParentBusinessUnitId = org.ParentBusinessUnitId;

            bool isTop = MainUtil.GetBool(entity.Fields["IsTop"].Value, false);
            if (isTop)
            {
                this.IsTopHTML = " checked ";
                this.EndTopDate = StringUtil.GetString(entity.Fields["EndTopDate"].Value);
            }
            bool isImportant = MainUtil.GetBool(entity.Fields["IsImportant"].Value, false);
            if (isImportant)
            {
                this.IsImportantHTML = " checked ";
            }

            int status = MainUtil.GetInt(entity.Fields["StateCode"].Value, 0);
            if (status == 0)
            {
                StatusName = "草稿";
            }
            else if (status == 1)
            {
                StatusName = "审批通过";
            }
            else if (status == 2)
            {
                StatusName = "审批不通过";
            }
            int statusCode = MainUtil.GetInt(entity.Fields["StatusCode"].Value, 0);
            if (statusCode == 1)
            {
                this.CanApprove = true;
            }

            this.Position = MainUtil.GetInt(entity.Fields["Position"].Value, 0);

            GetImages(new Guid(strId));
            GetAttachs(new Guid(strId));
            int attachRightCode = MainUtil.GetInt(entity.Fields["AttachRightCode"].Value, 0);
            RenderAttachRightCodeControlHTML(attachRightCode);
            string urgentLevel = StringUtil.GetString(entity.Fields["UrgentLevel"].Value);
            RenderUrgentLevelHtml(urgentLevel);
        }

        void RenderAttachRightCodeControlHTML(int attachRightCode)
        {
            AttachRightCodeControlHTML = "";
            if (attachRightCode == 0)
            {
                AttachRightCodeControlHTML += "<option value='0' >所有</option>";
                AttachRightCodeControlHTML += "<option value='4' >只读</option>";
                AttachRightCodeControlHTML += "<option value='8' selected>可下载</option>";
            }
            else if (attachRightCode == 4)
            {
                AttachRightCodeControlHTML += "<option value='0' >所有</option>";
                AttachRightCodeControlHTML += "<option value='4' selected>只读</option>";
                AttachRightCodeControlHTML += "<option value='8' >可下载</option>";
            }
            else if (attachRightCode == 8)
            {
                AttachRightCodeControlHTML += "<option value='0' >所有</option>";
                AttachRightCodeControlHTML += "<option value='4' >只读</option>";
                AttachRightCodeControlHTML += "<option value='8' selected>可下载</option>";
            }
        }
        void RenderUrgentLevelHtml(string urgentLevel)
        {
            UrgentLevelHtml = "";
            if (urgentLevel == "紧急")
            {
                UrgentLevelHtml += "<option value='普通' >普通</option>";
                UrgentLevelHtml += "<option value='紧急' selected>紧急</option>";
                UrgentLevelHtml += "<option value='非常紧急' >非常紧急</option>";
            }
            else if (urgentLevel == "非常紧急")
            {
                UrgentLevelHtml += "<option value='普通' >普通</option>";
                UrgentLevelHtml += "<option value='紧急' >紧急</option>";
                UrgentLevelHtml += "<option value='非常紧急' selected>非常紧急</option>";
            }
            else
            {
                UrgentLevelHtml += "<option value='普通' selected>普通</option>";
                UrgentLevelHtml += "<option value='紧急' >紧急</option>";
                UrgentLevelHtml += "<option value='非常紧急' >非常紧急</option>";
            }
        }
        private string GetAttachs(Guid contentId)
        {
            string strattaches = "";
            try
            {
                List<Entity> attaches = AttachFileManager.GetAttaches(this._caller, contentId);
                StringBuilder sb = new StringBuilder();
                sb.Append("<div>");
                foreach (var entity in attaches)
                {
                    sb.Append("<div style='text-align:center'>");
                    sb.AppendFormat("<table border='1'><td width='70%'><a href='/apps/files/fileDownload.aspx?isAttach=1&id={0}'>{1}</a><td>", entity.ID, entity.Name);
                    sb.AppendFormat("<td width='30%'><a href='#' onclick=\"javascript:delAttachFile('{0}','{1}')\">删除</a></div>", entity.ID, contentId);
                    sb.Append("</td></table>");
                }

                sb.Append("</div>");
                strattaches = sb.ToString();
                AttachHTML = strattaches;
            }
            catch (Exception ex)
            { }
            return strattaches;
        }
        protected string GetImages(Guid contentid)
        {
            //string 
           // int i = 0;
            string strimages = "";
            List<Entity> images = ImageManager.GetImages(this._caller, contentid);
            string sitemImg = Settings.GetSetting("Site.Img");
            StringBuilder sb = new StringBuilder();
            sb.Append("<div>");
            foreach (Entity entity in images)
            {
                //if (i > 0)
                //    strimages += ",";
                //ImageEntity imgEntity = new ImageEntity(entity);
                //string vPath = string.Format("{0}{1}", sitemImg, imgEntity.Path);
                //string thumbnailPath = string.Format("{0}{1}", sitemImg, imgEntity.ThumbnailPath);
                //strimages += string.Format("{{\"id\":\"{0}\",\"path\":\"{1}\",\"thumbnailPath\":\"{2}\"}}", imgEntity.ID, vPath, thumbnailPath);
                //i++;
                sb.Append("<div style='text-align:center'>");
                sb.AppendFormat("<img src='{0}/ArticleImgHanlder.ashx?id={1}&thumnnail=1&sessionKey='>", sitemImg, entity.ID,this._caller.UserID);
                sb.AppendFormat("<div><a href='#' onclick=\"javascript:delCoverImg('{0}','{1}')\">删除</a></div>", entity.ID, contentid);
                sb.Append("</div>");
            }
            sb.Append("</div>");
            strimages = sb.ToString();
            CoverHTML = strimages;
            return strimages;
        }
        string str1 = "";
        void GetFolders()
        {
            int i = 0;
            EntityCollection entities = ItemTreeManager.GetFolders(_caller, ObjectTypeCodes.ContentTag);
            foreach (Entity entity in entities)
            {
                if(i>0)
                 str1 += ",";
                str1 +=string.Format("{0}|{0}", entity.Name);
                i++;
            }

            MutipleCheckbox multCheckbox = new MutipleCheckbox();
            if (!string.IsNullOrEmpty(this.KeyWords))
                multCheckbox.FieldValue = this.KeyWords;
            multCheckbox.ControlId = "KeyWords";
            multCheckbox.Options = str1;
            multCheckbox.Cols = 10;
            multCheckbox.RenderField();
            this.TagHTML = multCheckbox.ControlHtml;
        }
        public string EntityId { get; set; }
        public string OwnerName { get { return ownerName; } set { ownerName = value; } }
        public string CTitle { get; set; }
        public string KeyWords { get; set; }
        public string Contents { get; set; }
        public string FolderId { get; set; }
        public string FolderName { get; set; }
        public string StatusName { get; set; }
        public string CreatedOn { get; set; }
        public int Position { get; set; }
        /// <summary>
        /// 附件权限
        /// </summary>
        public int AttachRightCode { get; set; }
        
        public string AttachRightCodeControlHTML { get; set; }
        /// <summary>
        /// 紧急程度
        /// </summary>
        public string UrgentLevelHtml { get; set; }
        public string BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }
        public bool CanApprove { get; set; }
        public string BusinessUnitIdControlHtml
        {
            get { return businessUnitIdControlHtml; }
            set { businessUnitIdControlHtml = value; } 
        }

        public string TagHTML { get; set; }

        public string PreviewURL { get; set; }

        public string IsTopHTML { get; set; }
        public string EndTopDate { get; set; }
        public string IsImportantHTML { get; set; }
        public string AttachHTML { get; set; }
        public string CoverHTML { get; set; }
        public string ContentReadersListHtml { get; set; }
        public string Readers { get; set; }
    }
}