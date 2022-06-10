using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore.EntityFramework.Entities;
using Supermore;
using Supermore.Data;

namespace WebClient.apps.scontent
{
    public partial class Default : System.Web.UI.Page
    {
        CallContext caller = null;
        string strId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();

            if (Request["id"] != null)
            {
                strId = Request["id"];
            }
        }
        protected void ShowData()
        {
            Entity entity = null;
            if (!string.IsNullOrEmpty(strId))
            {
                entity = EntityManager.GetEntity(caller, EntityTemplateIDs.Content, new Guid(strId));
            }
        }
    }
}