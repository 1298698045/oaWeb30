using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Data.Query;
using Supermore.EntityFramework.Entities;
using Supermore.IO;
using OptimaJet.Workflow;
using OptimaJet.Workflow.Core.Model;
using Supermore.Web;
using Supermore.Configuration;

namespace WebClient.apps.wf
{
    public partial class InstanceAttachList : System.Web.UI.Page
    {
        string objectId = "";
        CallContext _caller = null;
        protected EntityCollection _entities = null;
        string instanceState = "";
        string organizationId = "";
        string version = "";
        int editType = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            version = Settings.GetSetting("JingeOffice.Version");//金格办公软件的版本
            objectId = Request["InstanceId"];
            instanceState = Request["InstanceState"];

            editType = MainUtil.GetInt(Request["editType"], 1);
                
            _caller = AppDataSource.GetCallContext();
            //为了支持子流程
            try
            {
                string querySql = "SELECT ParentId FROM WFProcessInstance WHERE ProcessInstanceId='{0}'";
                querySql = string.Format(querySql, objectId);
                string parentId = DatabaseTool.GetFirstCellStr(_caller.CustomerID, querySql, "");

                if (SiteUtil.IsMultipleCustomer)
                {
                    querySql = "SELECT OrganizationId FROM WFProcessInstance WHERE ProcessInstanceId='{0}'";
                    querySql = string.Format(querySql, objectId);
                    organizationId = DatabaseTool.GetFirstCellStr(_caller.CustomerID, querySql, "");
                    
                    if (!string.IsNullOrEmpty(organizationId))
                    {
                        if (organizationId != _caller.CustomerID)
                            _caller = AppDataSource.GetCallerByCustomerId(new Guid(organizationId));
                    }
                }
                //ProcessInstance instance = WfInstanceManager.GetProcessInstance(new Guid(objectId));
                //if (instance != null)
                //{ 
                //}
                // OR ParentId='' 
                WfInstanceManager.SumIntanceAttachQty(_caller, new Guid(objectId));
                //附件包括自己 以及父亲实例的
                string queryAttachSql = "SELECT * FROM RelatedAttachmentBase Where ParentId='{0}' Order by Position,CreatedOn";
                queryAttachSql = string.Format(queryAttachSql, objectId);

                if (!string.IsNullOrEmpty(parentId))
                {
                    queryAttachSql = "SELECT * FROM RelatedAttachmentBase Where ParentId='{0}' OR ParentId='{1}' Order by Position,CreatedOn";
                    queryAttachSql = string.Format(queryAttachSql, parentId, objectId);
                }
                int attachRight = MainUtil.GetInt(Request["right"], 4);//附件权限
                string retURL = this.Request.RawUrl;
                retURL = HttpUtility.UrlEncode(retURL);
                StringBuilder sb = new StringBuilder();
                //string str1 = string.Format("organizationId:{0},{1};processInstanceId:{1}", organizationId, _caller.CustomerName, objectId);
                //Supermore.Diagnostics.Trace.LogError(str1);

                _entities = EntityManager.GetEntities(_caller, EntityTemplateIDs.RelatedAttachment, queryAttachSql);
                if (_entities != null)
                {
                    sb.Append("<table style='font-size:14px;width:100%;'>");
                    int iRow = 1;
                    string custId = _caller.CustomerID;
                    //Guid currentUserId = new Guid(this._caller.UserID);
                    bool isSupportBrowser = IsSupportBrowser();
                    string orgId = "";
                    foreach (Entity entity in _entities)
                    {
                        string fileName = StringUtil.GetString(entity.Fields["Name"].Value);
                        string fileExtension = StringUtil.GetString(entity.Fields["FileExtension"].Value);
                        string fileType = "." + fileExtension;
                        Guid createdBy = MainUtil.GetGuid(entity.Fields["CreatedBy"].Value);
                        //bool hasExtName = true;
                        string checkFileExt = "";
                        checkFileExt = FileUtil2.GetFileExtensionWithoutDot(fileName);
                        orgId = StringUtil.GetString(entity.Fields["OrganizationId"].Value);
                        if (string.IsNullOrEmpty(checkFileExt))
                        {
                            checkFileExt = fileExtension;
                            //hasExtName = false;
                            fileName = fileName + fileType;
                        }
                        string previewLink = "";
                        sb.Append("<tr>");
                        switch (fileExtension.ToLower())
                        {
                            case ".xls":
                            case ".xlsx":
                            case "xls":
                            case "xlsx":

                                if (IsGoogleBrowser() || version == "2015")
                                {
                                    if (attachRight >= 8)
                                    {
                                        sb.AppendFormat("<td width='32'><img src='/img/images/excel.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/jgfiles/samples/OpenAndSave_Excel.aspx?id={1}&filesource=1001&EditType=1&FileType={2}&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName);
                                        previewLink = string.Format("/jgfiles/samples/OpenAndSave_Excel.aspx?filesource=1001&id={0}&FileType={1}&EditType={2}&OrganizationId={3}", entity.ID, fileType, editType, orgId);

                                    }
                                    else
                                    {
                                        sb.AppendFormat("<td width='32'><img src='/img/images/excel.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/jgfiles/samples/OpenAndSave_Excel.aspx?id={1}&filesource=1001&EditType=0&FileType={2}&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName);

                                        previewLink = string.Format("/jgfiles/samples/OpenAndSave_Excel.aspx?filesource=1001&id={0}&FileType={1}&EditType={2}&OrganizationId={3}", entity.ID, fileType, editType, orgId);
                                    }
                                }
                                else
                                {
                                    if (attachRight >= 8)
                                    {
                                        sb.AppendFormat("<td width='32'><img src='/img/images/excel.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id={1}&EditType=1,1&readonly=0&FileType={2}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName);
                                        previewLink = string.Format("/apps/files/DocEditor.aspx?id={0}&EditType=1,1&readonly=0&FileType={1}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId={2}", entity.ID, fileType, orgId);
                                    }
                                    else
                                    {
                                        sb.AppendFormat("<td width='32'><img src='/img/images/excel.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id={1}&EditType=0,0&readonly=1&FileType={2}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName);

                                        previewLink = string.Format("/apps/files/DocEditor.aspx?id={0}&EditType=0,0&readonly=1&FileType={1}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId={2}", entity.ID, fileType, orgId);
                                    }
                                }

                                break;
                            case "doc":
                            case "docx":
                            case ".doc":
                            case ".docx":
                            case "ppt":
                            case "pptx":
                            case "wps":
                            case ".ppt":
                            case ".pptx":
                            case ".wps":
                                // if (this._accessRight >= 8)
                                //     sb.AppendFormat("<a title=\"编辑 - 记录 {1} -\" target=\"_blank\" class=\"actionLink\" href=\"/apps/files/DocEditor.aspx?id={0}&EditType=1,1&FileType={3}\">编辑</a></td>", entity.ID, iRow, this.RetURL, fileType);
                                sb.Append("<td width='32'><img src='/img/images/word.png' width='32' height='32' alt='{2}' /></td>");
                                if ( IsGoogleBrowser() || version == "2015" )
                                {
                                    if (attachRight >= 8)
                                    {
                                        sb.AppendFormat("<td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/jgfiles/samples/OpenAndSave_Word.aspx?id={1}&filesource=1001&EditType={4}&FileType={2}&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName,editType);
                                        previewLink = string.Format("/jgfiles/samples/OpenAndSave_Word.aspx?filesource=1001&id={0}&FileType={1}&EditType={2}&OrganizationId={3}", entity.ID, fileType,editType, orgId);
                                    }
                                    else
                                    {
                                        sb.AppendFormat("<td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/jgfiles/samples/OpenAndSave_Word.aspx?id={1}&filesource=1001&EditType=4&FileType={2}&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName);
                                        previewLink = string.Format("/jgfiles/samples/OpenAndSave_Word.aspx?filesource=1001&id={0}&EditType=0&FileType={1}&OrganizationId={2}", entity.ID, fileType, orgId);
                                    }
                                }
                                else
                                {
                                    if (attachRight >= 8)
                                    {
                                        sb.AppendFormat("<td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id={1}&EditType=3,1&readonly=0&FileType={2}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName);
                                        previewLink = string.Format("/apps/files/DocEditor.aspx?id={0}&EditType=3,1&readonly=0&FileType={1}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId={2}", entity.ID, fileType, orgId);
                                    }
                                    else
                                    {
                                        sb.AppendFormat("<td><a title=\"查看 - 记录 {0} - 附件\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/apps/files/DocEditor.aspx?id={1}&EditType=0,0&readonly=1&FileType={2}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId=" + orgId + "', '查看{3}', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{3}</a></td>", iRow, entity.ID, fileType, fileName);
                                        previewLink = string.Format("/apps/files/DocEditor.aspx?id={0}&EditType=0,0&readonly=1&FileType={1}&filesource=1001&isAttach=1&objectTypeCode=1001&OrganizationId={2}", entity.ID, fileType, orgId);
                                    }
                                }

                                break;
                            case "jpg":
                            case "jepg":
                            case "png":
                            case "gif":                            
                            case ".jpg":
                            case ".jepg":
                            case ".png":
                            case ".gif":
                                if (isSupportBrowser)
                                {
                                    sb.AppendFormat("<td width='32'><img src='/img/images/image.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - {2}\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/fie/imgvwer.aspx?parentid={3}&id={1}&isAttach=1&filesource=1001&OrganizationId=" + orgId + "', '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{2}</a></td>", iRow, entity.ID, fileName, objectId);

                                    previewLink = string.Format("/fie/imgvwer.aspx?parentid={1}&id={0}&isAttach=1&filesource=1&OrganizationId={2}", entity.ID, objectId, orgId);
                                }
                                else
                                {
                                    sb.AppendFormat("<td width='32'><img src='/img/images/image.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - {2}\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/apps/files/FileViewer.aspx?id={1}&isAttach=1&filesource=1001&OrganizationId=" + orgId + "', '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{2}</a></td>", iRow, entity.ID, fileName);

                                    previewLink = string.Format("/apps/files/FileViewer.aspx?id={0}&parentid={1}&isAttach=1&filesource=1&OrganizationId={2}", entity.ID, objectId, orgId);
                                }
                                break;
                            case "pdf":
                            case ".pdf":
                                sb.AppendFormat("<td width='32'><img src='/img/images/pdf.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - {2}\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/apps/files/FileViewer.aspx?parentid={3}&id={1}&isAttach=1&filesource=1001&OrganizationId=" + orgId + "', '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{2}</a></td>", iRow, entity.ID, fileName, objectId);
                                previewLink = string.Format("/apps/files/FileViewer.aspx?id={0}&parentid={1}&isAttach=1&filesource=1&OrganizationId={2}", entity.ID, objectId, orgId);
                                break;
                            default:
                                sb.AppendFormat("<td width='32'><img src='/img/images/pdf.png' width='32' height='32' alt='{2}' /></td><td><a title=\"查看 - 记录 {0} - {2}\"  class=\"actionLink\" onclick=\"javascript:openPopupFocusEscapePounds('/apps/files/FileViewer.aspx?id={1}&isAttach=1&filesource=1001&OrganizationId=" + orgId + "', '查看', 1024, 768, 'width=1024,height=768,resizable=yes,toolbar=yes,status=yes,scrollbars=yes,menubar=yes,directories=no,location=yes,dependant=yes,alwaysRaised=yes', false, false);\"  href=\"#\">{2}</a></td>", iRow, entity.ID, fileName);
                                break;
                        }

                        sb.Append("</tr><tr><td width='32'></td><td>");

                        if (!string.IsNullOrEmpty(previewLink))
                            sb.AppendFormat("<a href=\"{0}\" target=\"_blank\" class=\"actionLink\"><img border='0' width='16' height='16' src=\"/img/images/11931.png\">预览</a> | ", previewLink);

                        sb.AppendFormat("<a title=\"下载 - 记录 {0} - {2}\" target=\"_blank\" class=\"actionLink\" href=\"/apps/files/FileDownload.aspx?id={1}&isAttach=1&filesource=1&OrganizationId=" + orgId + "\"><img width=\"16\" height=\"16\" title=\"下载{2}\" alt=\"下载{2}\" border='0' src=\"/img/indicators/icoManagedInstalled.gif\">下载</a>", iRow, entity.ID, fileName);

                        //currentUserId == createdBy ||
                        if ((instanceState == "0" || instanceState == "5") || (attachRight == 16 && instanceState == "1"))
                            sb.AppendFormat(" | <a class=\"actionLink\" title=\"删除 - 记录 {1} - {2}\" onclick=\"return confirmDelete();\" href=\"/setup/own/deleteredirect.aspx?delID={0}&type=00P&retURL={3}\"><img border='0' title=\"删除{2}\" alt=\"删除{2}\" src=\"/img/dismiss.gif\">删除</a>", entity.ID, iRow, fileName, retURL);//
                        sb.Append("</td></tr>");
                        iRow++;
                    }
                    sb.Append("</table>");
                }
                this.AttachmentListHTML = sb.ToString();
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        public bool IsSupportBrowser()
        {
            string version = GetBrowser();
            if (version.IndexOf("IE8", StringComparison.InvariantCultureIgnoreCase) > -1)
            {
                return false;
            }
            if (version.IndexOf("IE9", StringComparison.InvariantCultureIgnoreCase) > -1)
            {
                return false;
            }
            else if (version.IndexOf("IE7", StringComparison.InvariantCultureIgnoreCase) > -1)
            {
                return false;
            }
            return true;
        }
        public bool IsGoogleBrowser()
        {
            string version = GetBrowser();
            if (version.IndexOf("Chrome", StringComparison.InvariantCultureIgnoreCase) > -1)
            {
                return true;
            }
            return false;
        }
        public  string GetBrowser()
        {
            HttpBrowserCapabilities bc = HttpContext.Current.Request.Browser;
            return bc.Browser + bc.Version;
        }  
        public string AttachmentListHTML { get; set; }
    }
}