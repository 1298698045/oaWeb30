using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

using Supermore;
using Supermore.Data;
using Supermore.Security;
using Supermore.Activities;
using Supermore.EntityFramework.Entities;


namespace WebClient._ui.common.data
{
    public partial class AddressPicker : System.Web.UI.Page
    {
        CallContext caller;
        string _options = "";
        string _userName;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public string SelectOptions { get { return _options; } }
    }
}