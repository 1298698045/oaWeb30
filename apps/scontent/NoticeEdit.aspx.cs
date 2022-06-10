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
using Supermore.Media;
using System.Text;
using Supermore.IO;
using System.IO;
using Youyou.Contents;

namespace WebClient.apps.scontent
{
    public partial class NoticeEdit : System.Web.UI.Page
    {
        CallContext _caller = null;
        string businessUnitIdControlHtml = "";
        string ownerName = "";
        int typeCode = 100202;
        string _title = "";
        string id = "";
        string coverDisplay = "";
        
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PublicHTML = " checked ";
            id = Request["id"];
            this.CTitle = "";
            this.Contents = "<div style=\"font-size:16px;margin-top:20px;\">&nbsp; &nbsp; &nbsp;&nbsp;请在这输入内容</div>";
            _caller = AppDataSource.GetCallContext();
            this.ownerName = _caller.UserName;
            if (Request["cancel"] != null)
            {
                string cancelURL = Request["cancelURL"];
                if (string.IsNullOrEmpty(cancelURL))
                    cancelURL = Request["retURL"];
                if (string.IsNullOrEmpty(cancelURL))
                    cancelURL = "/091/o";
                Response.Redirect(cancelURL);
            }
            if (Request["save"] != null)
            {
                SaveData(false, false);
            }
            if (Request["save_new"] != null)
            {
                SaveData(true,false);
            }
            if (Request["save_approve"] != null)
            {
                SaveData(false, true);
            }
            if (Request["approve_notify"] != null)
            {
                string retURL = "/apps/scontent/ApproveInfo.aspx?t=091&parentid=" + Request["id"];
                Response.Redirect(retURL);
                return;
            }
            
            if (!Page.IsPostBack)
            {
                string retURL = Request["retURL"];
                RegisterParamsHiddenFieldsControl1.AddHiddenValue("cancelURL", retURL);
                //RegisterParamsHiddenFieldsControl1.AddHiddenValue("save_new_url", retURL);
            }
            this.BusinessUnitId = _caller.BussinessUnitId.ToString();
            this.BusinessUnitName = _caller.BussinessUnitName; 
            GetData();
            GetFolders();
            GetTags();
            BusinessUnitLookup lookup = new BusinessUnitLookup();
            lookup.EntityCode = "10";
            lookup.FieldLabel = "部门";
            lookup.FieldValue = this.BusinessUnitId;
            lookup.FieldName = "businessUnitId";
            lookup.FieldValueText = this.BusinessUnitName;
            lookup.Render();
            BusinessUnitIdControlHtml = lookup.ControlHtml;
            /*
            Lookup lookup = new Lookup();
            lookup.EntityCode = "00D";
            lookup.FieldLabel = "上级部门";
            lookup.FieldValue = this.BusinessUnitId;
            lookup.FieldName = "businessUnit";
            lookup.FieldValueText = "";
            lookup.Render();
            businessUnitIdControlHtml = lookup.ControlHtml;
            */
        }
        void SaveData(bool saveNew, bool submitApprove)
        {
            //string folderId = Request["categories"];
            //if (string.IsNullOrEmpty(folderId))
            //    return;
            _title = Request["title"].Trim();
            string folderId = "";
            folderId = Request["folderPicker"];
            if (string.IsNullOrEmpty(folderId) || string.IsNullOrEmpty(_title))
                return;

            bool isUpdated = false;
            Guid orgId = new Guid(_caller.CustomerID);
            Entity entity = null;
            if (string.IsNullOrEmpty(id))
            {
                entity = new Entity(Guid.NewGuid(), EntityTemplateIDs.Content, orgId);
            }
            else
            {
                entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.Content, new Guid(id));
                isUpdated = true;
            }
           
            //string userName = Request["Username"];
           
            entity.BeginEdit();
            entity.Fields["Title"].Value = _title.Replace('"','”');
            entity.Fields["ContentTypeCode"].Value = 2;
            if (!string.IsNullOrEmpty(folderId))
                entity.Fields["FolderId"].Value = folderId;
            entity.Fields["ContentBody"].Value = Request["textAreaDelegate_body"];
            string keyWords = Request["KeyWords"];
            entity.Fields["KeyWords"].Value = keyWords.Trim(',');
            entity.Fields["StatusCode"].Value = 1;
            entity.Fields["StateCode"].Value = 1;
            string parentName = Request["businessUnitId"];
            string businessUnitId = Request["businessUnitId_lkid"];
            if (!string.IsNullOrEmpty(businessUnitId))
                entity.Fields["BusinessUnitId"].Value = businessUnitId;
            entity.Fields["ReadDetectionFlag"].Value = Request["readDetectionValue"];    //回执                   
            //entity.Fields["BusinessUnitId"].Value = Request["BusinessUnit"];
            
            if (Request["chkIsPublic"] != null)
                entity.Fields["IsPublic"].Value = true;
            else
                entity.Fields["IsPublic"].Value = false;

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

            if (Request["attachRightCode"] != null)
            {
                if (Request["AttachRightCode"] != null)
                {
                    entity.Fields["AttachRightCode"].Value = Request["AttachRightCode"];
                }
            }
            //未知
            string Position = Request["Position"];
            if (entity.Fields["Position"] != null && !string.IsNullOrEmpty(Position))
            {
                entity.Fields["Position"].Value = Position;
            }

            if (Request["ExpiresOn"] != null)
            {
                if (Request["ExpiresOn"] != null)
                {
                    entity.Fields["ExpiresOn"].Value = Request["ExpiresOn"];
                }
            }
            if (Request["UrgentLevel"] != null)
            {
                if (Request["UrgentLevel"] != null)
                {
                    entity.Fields["UrgentLevel"].Value = Request["UrgentLevel"];
                }
            }
            //短信提醒
            if (entity.Fields["RemindSms"] !=null)
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
              
                entity.Fields["ModifiedBy"].Value = _caller.UserID;
                entity.Fields["ModifiedOn"].Value = DateTime.Now;
                id = entity.ID.ToString();
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

            #region  需要审核
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
                                entity.Fields["StatusCode"].Value = 2; //提交审核
                            }
                            entity.Fields["ApprovedBy"].Value = approverId;
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
                    entity.Fields["StatusCode"].Value = 1;
                }
            }
            else
            {
                entity.Fields["StatusCode"].Value = 2;
                entity.Fields["StateCode"].Value = 1;
            }
            #endregion

            //entity.Fields["BusinessUnitId"].Value = orgId;    //部门
            //LanguageLocaleKey
            //LocaleSidKey
            //TimeZoneSidKey
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
            //if (isSaved)
            //{
            //SecurityAuth.CreateUser(entity);
            //保存图片
            string imgSrc = SaveFiles(id);

            SaveAttachFiles(_title, id);//附件
            //}
            string retURL = Request["retURL"];
            /*if (saveNew)
            {
                string save_new_url = Request["save_new_url"];
                Response.Redirect(save_new_url);
            }
            else*/
            {
                //if (string.IsNullOrEmpty(retURL))
                retURL = string.Format("/091/detail?id={0}&objectTypeCode=100202&retURL=%2f091%2fo", id);
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
                //图片
                IList<HttpPostedFile> imgfiles = this.Request.Files.GetMultiple("mainImg[]");
                for (int c = 0; c < imgfiles.Count; c++)
                //for (int c = 0; c < this.Request.Files.Count; c++)
                {
                    HttpPostedFile file = imgfiles[c];
                    //HttpPostedFile file = Request.Files[c];
                    if (file.ContentLength == 0)
                        continue;
                    
                    ImageManager.UploadImage(this._caller, file,Guid.NewGuid(), ObjectTypeCodes.Content, objectId);
                    //
                    if (coverDisplay == "BelowTitleBigImg") //大图时候同步过来
                    {
                        string extName = FileUtil2.GetFileExtension(file.FileName);
                        string rootPath2 = Server.MapPath("/SysFiles/images");
                        //Guid.NewGuid().ToString().ToLower();
                        string fileName2 = objectId.ToUpper() + extName;
                        file.SaveAs(rootPath2 + "\\" + fileName2);
                        string imgPath = "/SysFiles/images/" + fileName2;
                        Supermore.Contents.ContentManager.CreateImageNews(this._caller, new Guid(objectId), _title, imgPath, extName, file.ContentLength);
                    }
                }
                imgURL += virtualPath;

            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
            return imgURL;
        }

        /// <summary>
        /// 上传附件
        /// </summary>
        /// <param name="objectId"></param>
        void SaveAttachFiles(string parentName,string parentId)
        {
            string parentType = "100202";// Request["type"];
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("pid", Request["pid"]);
            //this.RegisterParamsHiddenFieldsControl1.AddHiddenValue("type", parentType);
            //this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("pid", Request["pid"]);
           // this.RegisterParamsHiddenFieldsControl2.AddHiddenValue("type", parentType);
            if (string.IsNullOrEmpty(parentType))
                parentType = "unkown";

            long fileSize = 0;
            string rootPath = IOPaths.AttachFiles + "\\" + parentType + "\\" + DateTime.Now.ToString("yyyy") + "\\" + DateTime.Now.ToString("MM") + "\\" + DateTime.Now.ToString("dd");
            // DateTime.Now.ToString("yyyy") + "/" + Datestring virtualPath =Time.Now.ToString("MM") + "/";
            string virtualPath = "";
            if (!Directory.Exists(rootPath))
            {
                Directory.CreateDirectory(rootPath);
            }
            try
            {
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
                RenderUrgentLevelHtml("");
                this.CreatedOn = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss");
                return;
            }
            EntityId = strId;
            Entity entity = null;

            entity = EntityManager.GetEntity(_caller, EntityTemplateIDs.Content, new Guid(strId));
            if (entity != null)
                this.CreatedOn = entity.CreatedOn.ToString("yyyy-MM-dd HH:mm:sss");
            CTitle = entity.Fields["Title"].Value.ToString();
            Contents = entity.Fields["ContentBody"].Value.ToString();
            this.FolderId = StringUtil.GetString(entity.Fields["FolderId"].Value);
            this.FolderName = EntityManager.GetEntityName(_caller, EntityTemplateIDs.ItemTree, new Guid(FolderId));
            this.KeyWords = StringUtil.GetString(entity.Fields["KeyWords"]);
            Guid businessUnitId = MainUtil.GetGuid(entity.Fields["BusinessUnitId"].Value);
            if (businessUnitId != Guid.Empty)
            {
                this.BusinessUnitId = businessUnitId.ToString();
                BusinessUnit org = OrganizationManager.GetBusinessUnit(_caller, businessUnitId);
                if (org != null)
                    this.BusinessUnitName = org.Name;
            }
            bool isImportant = MainUtil.GetBool(entity.Fields["IsImportant"].Value, false);
            if (isImportant)
            {
                this.IsImportantHTML = " checked ";
            }
            //this.ReadDetectionFlag = StringUtil.GetString(entity.Fields["ReadDetectionFlag"].Value);
            bool isPublic= MainUtil.GetBool(entity.Fields["IsPublic"].Value,true);
            if (isPublic)
                this.PublicHTML = " checked ";
            else
                this.PublicHTML = "  ";
            //this.ParentBusinessUnitId = org.ParentBusinessUnitId;

            bool isTop = MainUtil.GetBool(entity.Fields["IsTop"].Value, false);
            if (isTop)
            {
                this.IsTopHTML = " checked ";
                this.EndTopDate = StringUtil.GetString(entity.Fields["EndTopDate"].Value);
            }
            int attachRightCode = MainUtil.GetInt(entity.Fields["AttachRightCode"].Value, 0);
            RenderAttachRightCodeControlHTML(attachRightCode);

            this.ExpiresOn = StringUtil.GetString(entity.Fields["ExpiresOn"].Value);
            this.UrgentLevel = StringUtil.GetString(entity.Fields["UrgentLevel"].Value);
            RenderUrgentLevelHtml(this.UrgentLevel);

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
                sb.AppendFormat("<img src='{0}/ArticleImgHanlder.ashx?id={1}&thumnnail=1'>", sitemImg, entity.ID);
                sb.AppendFormat("<div><a href='#' onclick=\"javascript:delCoverImg('{0}')\">删除</a></div>", entity.ID);
                sb.Append("</div>");
            }
            sb.Append("</div>");
            strimages = sb.ToString();
            CoverHTML = strimages;
            return strimages;
        }
        
        void GetFolders()
        {
           // hotlist_mode = Request["fcf"];
            /*
            Guid sele = Guid.Empty;
            if (!string.IsNullOrEmpty(this.FolderId))
            {
                sele = new Guid(this.FolderId);
            }
            EntityCollection entities = ItemTreeManager.GetFolders(caller, typeCode);
            foreach (Entity entity in entities)
            {
                if (sele == entity.ID)
                    _options += string.Format("<option value='{0}' selected='selected'>{1}</option>", entity.ID, entity.Name);
                else
                    _options += string.Format("<option value='{0}'>{1}</option>", entity.ID.ToString().ToLower(), entity.Name);
            }
            */
            int _itemCategoryCode = MainUtil.GetInt(Request["type"], 100202);
            this.typeCode = _itemCategoryCode;
            EntityCollection entities = ItemTreeManager.GetAllFolders(_caller, _itemCategoryCode);
            this.folderPicker.Caller = _caller;

            this.folderPicker.EnableAccess = true;
            this.folderPicker.DataSource = entities;
            this.folderPicker.SelectValue = this.FolderId;
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

        string str1 = "";
        void GetTags()
        {
            int i = 0;
            EntityCollection entities = ItemTreeManager.GetFolders(_caller, ObjectTypeCodes.ContentTag);
            foreach (Entity entity in entities)
            {
                if (i > 0)
                    str1 += ",";
                str1 += string.Format("{0}|{0}", entity.Name);
                i++;
            }

            MutipleCheckbox multCheckbox = new MutipleCheckbox();
            if (!string.IsNullOrEmpty(this.KeyWords))
                multCheckbox.FieldValue = this.KeyWords;
            multCheckbox.ControlId = "KeyWords";
            multCheckbox.Cols = 10;
            multCheckbox.Options = str1;
            multCheckbox.RenderField();
            this.TagHTML = multCheckbox.ControlHtml;
        }
        public string OwnerName { get { return ownerName; } set { ownerName = value; } }
        public string CTitle { get; set; }
        public string Contents { get; set; }
        public string EntityId { get; set; }
        public string FolderId { get; set; }
        public string FolderName { get; set; }
        public string ReadDetectionFlag { get; set; }
        public string BusinessUnitId { get; set; }
        public string BusinessUnitName { get; set; }
        public string KeyWords { get; set; }
        public string ExpiresOn { get; set; }
        public string CreatedOn { get; set; }
        public int Position { get; set; }
        public string UrgentLevel { get; set; }
        public bool CanApprove { get; set; }
        
        /// <summary>
        /// 附件权限
        /// </summary>
        public int AttachRightCode { get; set; }

        public string AttachRightCodeControlHTML { get; set; }
        /// <summary>
        /// 紧急程度
        /// </summary>
        public string UrgentLevelHtml { get; set; }

        public string BusinessUnitIdControlHtml
        {
            get { return businessUnitIdControlHtml; }
            set { businessUnitIdControlHtml = value; }
        }
        public string IsImportantHTML { get; set; }

        string _options = "";
        public string Folders
        {
            get { return _options; }
        }

        public string PublicHTML { get; set; }

        public string TagHTML { get; set; }

        public string IsTopHTML { get; set; }
        public string EndTopDate { get; set; }

        public string CoverHTML { get; set; }
        public string ContentReadersListHtml { get; set; }
        public string Readers { get; set; }
        public string StatusName { get; set; }
    }
}