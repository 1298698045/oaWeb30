using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;

namespace WebClient.apps
{
    public partial class UtilAction : System.Web.UI.Page
    {
        CallContext _caller = null;
        string id = "";
        string result = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            // _context = context;
            //string docId = Request["docid"];
            id = Request["id"];
            string commandName = Request["cmd"];
            _caller = AppDataSource.GetCallContext();
            //string[] arrs = null;
            //string name = "";
            //string desc = "";
            //string path = "";
            switch (commandName.ToLower())
            {
                case "tocapitalizednumber": //转换成中文大写
                    string num = Request["num"];
                    result = CurrencyUtil.ToChineseCapitalizedNumber(num);
                    //壹万零贰拾贰元零玖分
                    Console.WriteLine(result);
                    result = string.Format("{{\"result\":\"{0}\"}}", result);
                    break;
                default:
                    break;
            }
            Response.Write(result);
        }
    }
}