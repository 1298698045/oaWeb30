using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Supermore;
using Supermore.Data;
using Supermore.IO;
using Supermore.Files;
using Supermore.Queries;
using Supermore.GridBuilder;
using Supermore.Data.Query;
using Supermore.EntityFramework.Entities;
using System.IO;
using Supermore.Configuration;
using Youyou.Chatters;
using Supermore.Pipelines.ChatterContent;

namespace WebClient.apps
{
    /// <summary>
    /// Summary description for ChatterfileProcessor
    /// </summary>
    public class ChatterfileProcessor : IHttpHandler
    {

         public void ProcessRequest(HttpContext context)
        {
            _context = context;
            string docId= context.Request["docid"];
            id = context.Request["id"];
            string commandName = context.Request["cmd"];
            _caller = AppDataSource.GetCallContext();
            string[] arrs = null;
            string name = "";
            string desc = "";
            string path = "";
            switch (commandName.ToLower())
            {
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
                        string action = arrs[1];
                        if (action == "delete")
                        {
                            FileManager.DeleteFile(_caller, new Guid(arrs[0]));
                        }
                        else if (action == "edit")
                        {
                            bool isRe = FileManager.Rename(_caller, new Guid(arrs[0]), name, desc);
                            if (isRe)
                                result = "while(1);\n{\"title\":\"" + name + "\",\"description\":\"" + desc + "\"}";
                        }
                    }
                    else
                    {
                        //upload files 
                        result = SaveFiles();
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
                    //sw=g(小组),p(人)
                    string sw = Request["sw"];
                    if (sw=="g")
                        path = context.Server.MapPath("/_ui/_jsonPage/sharedwithwizard_g.txt");
                    else
                        path = context.Server.MapPath("/_ui/_jsonPage/sharedwithwizard.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "sharedwithlist":
                    path = context.Server.MapPath("/_ui/_jsonPage/sharedwithlist.txt");
                    result = FileUtil.ReadFromFile(path);
                    //FileEntity fEntity =  FileManager.GetFile(_caller, new Guid(id)); 
                    result = "while(1);\n" + result;
                    break;
                 
                case "publiclinks"://通过链接共享
                    path = context.Server.MapPath("/_ui/_jsonPage/publiclinks.txt");
                    result = FileUtil.ReadFromFile(path);
                    string versionId = context.Request["versionId"];
                    string rSite = Settings.GetSetting("Sites.Portal");
                    string shareUrl = string.Format(rSite + "sfd/p/{0}/a/{1}", _caller.CustomerCode, docId);
                    result = string.Format(result, shareUrl);
                    result = "while(1);\n" + result;
                    break;
                case "shareautocomplete": //查人，组shareAutoComplete
                    //https://ap1..com/chatter/handlers/file/shareAutoComplete?_dc=1449565256478&str=&etype=g
                    string str = Request["str"];//查询的字符
                    string etype = Request["etype"];//g(小组)，NULL（人）
                    path = context.Server.MapPath("/_ui/_jsonPage/shareAutoComplete.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "versionlist":
                    path = context.Server.MapPath("/_ui/_jsonPage/versionlist.txt");
                    result = FileUtil.ReadFromFile(path);
                    result = "while(1);\n" + result;
                    break;
                case "subscriptions": //文件订阅
                    break;
                #endregion

                case "getfilelist":
                    result = GetFileFilterResultList();
                    break;
                case "sfc_shepherd":
                    string format = Request["format"];
                    string message = Request["message"];

                    //{"actions":[{"controller":"view","action":"show","params":{"views":[{"container":"container_bubble","page":"workspaceCreate"}]}}]}
                    /*
                     {
	                    "contextId": "7b7d",
	                    "actions": [{
		                    "controller": "view",
		                    "action": "show",
		                    "params": {
			                    "executeBodyOnLoad": "false",
			                    "motif": null,
			                    "views": [{
				                    "container": "container_bubble",
				                    "page": "workspaceCreate",
				                    "content": ""
			                    }]
		                    },
		                    "response": true
	                    }]
                    }
                     */
                    break;
                default:
                    
                    break;
            }
            context.Response.Write(result);
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
             string entityId = this._context.Request["entityId"];
             if (feedItemType == "LinkPost")
             {
                 path = _context.Server.MapPath("/_ui/_jsonPage/LinkPost.txt");
                 result = FileUtil.ReadFromFile(path);
             }
             if (feedItemType == "TextPost")
             {
                
                 string text = this._context.Request["text"];
                 string topicIds = this._context.Request["topicIds"];
                 // string feedItemType = this._context.Request["feedItemType"];
                 /*
                    entityId	0059000000390Wh
                    feedItemType	TextPost
                    feedItemVisibility	
                    feedType	NEWS
                    isRichText	true
                    mentionLogging	[]
                    text	<p>AA1</p>
                    topicIds	
                  */
                 ChatterManager.TextPost(_caller, entityId,feedItemType, text, topicIds);
                 ChatterContentRenderArgs args = new ChatterContentRenderArgs();
                 args.HttpContext = _context;
                 TextPostRender textRender = new TextPostRender();
                 textRender.Process(args);
                 //path = _context.Server.MapPath("/_ui/_jsonPage/TextPost.txt");
                 //result = FileUtil.ReadFromFile(path);
                 result = args.ResultJSON;
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
                 case "ContentVersionMyWorkspacesFileSearch"://我的文档库中的文件
                     break;
                 case "ContentVersionPersonalWorkspaceFileSearch"://个人文档库(专有)
                    extraQueryExpression.Criteria.AddCondition("OwningUser", ConditionOperator.Equal, new string[] { _caller.UserID });
                    extraQueryExpression.Criteria.AddCondition("FolderId", ConditionOperator.Equal, new Guid[] { Guid.Empty });
                    break;
                 case "ContentVersionWorkspaceFileSearch"://办公文档
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
             listProvider.RowsPerPage = rowsPerPage;
             listProvider.CurrentPage = pageNumber;
             listProvider.TotalRowCount = SavedQueryManager.Count(_caller, savedQuery, extraQueryExpression);
             listProvider.Execute();

             string result = listProvider.ToJson();
             return result;
         }
         #endregion


         string SaveFiles()
         {

             if (this._context.Request.Files.Keys.Count == 0)
             {
                 return "";
             }

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
             bool isUpload = false;
             int fileSize = 0;
             foreach (string key in this._context.Request.Files.Keys)
             {
                 HttpPostedFile file = this._context.Request.Files.Get(key);
                 fileName = FileUtil2.GetFileNameWithoutExtension(file.FileName);
                 extName = FileUtil2.GetFileExtension(file.FileName);
                 string actualFileName = "file_" + DateTime.Now.ToString("yyyyMMddHHmmss") + extName;
                 targetFile = rootPath + "\\" + actualFileName;
                 fileSize = file.ContentLength;
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

                 FileManager.CreateVersion(_caller, newid, virtualPath, fileSize, 1, "");
             }
             string data = "";
             if (isUpload)
             {
                 data = "<textarea>while(1);\n{{\"message\":\"Success\",\"docid\":\"{0}\",\"versionId\":\"{1}\",\"so\":\"pvt\"}}</textarea>";
                 data = string.Format(data, newid.ToString(), 1);
                
             }
             else
             {
                  data = "<textarea>while(1);\n{\"message\":\"Failure\",\"docid\":\"\",\"versionId\":\"\",\"so\":\"pvt\"}</textarea>";                  
             }
             return data;
         }

         HttpContext _context = null;
         CallContext _caller = null;
         string id = "";

         public bool IsReusable
         {
             get { return false; }
         }
         string result = "";
         public HttpRequest Request
         {
             get { return this._context.Request; }
         }
    }
}