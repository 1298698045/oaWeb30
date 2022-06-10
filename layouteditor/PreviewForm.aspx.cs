using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using Supermore;
using Supermore.Data;
using Supermore.EntityFramework;
using Supermore.EntityFramework.Entities;
using Supermore.EntityFramework.Templates;

using Supermore.Pipelines;
using Supermore.Pipelines.RenderForm;

namespace WebClient.layouteditor
{
    public partial class PreviewForm : System.Web.UI.Page
    {
        string formId = "";
        string templateId = "";
        CallContext caller = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            try
            {
                formId = Request["formId"];
                templateId = Request["templateid"];
                RenderFormArgs args = new RenderFormArgs();
                args.FormId = new Guid(formId);
                args.MasterTemplateId = new Guid(templateId);
                args.RenderMode = FormEditMode.Preview;
                args.Caller = caller;
                args.QueryString = this.Request.QueryString;
                Template template = TemplateManager.GetTemplate(caller ,new Guid(templateId));

                if (template == null)
                {
                    Supermore.Diagnostics.Trace.LogError("preview form template is null" + templateId);
                }
                args.MasterTemplate = template;
                // PipelineManager.GetInstance().RunPipeline
                CorePipeline.Run("renderForm", args);
                this.RenderHTML = args.ResultHTML;
                this.ObjectTypeCode = template.ObjectTypeCode.ToString();

            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogException(ex);
            }
        }
        public string RenderHTML { get; set; }
        public string ObjectTypeCode { get; set; }
    }
}