using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebClient.apps.wf
{
    public partial class ContainerfrmEdit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string para = "";
            int i = 0;
           // IEnumerator enumerator = this.Request.QueryString.GetEnumerator();
           // IEnumerator myEnumerator = this.Request.QueryString.GetEnumerator();   
            //while (enumerator.MoveNext())
            //{ 
            //   // enumerator.Current
            //    enumerator.Current;
            //}
           // myEnumerator.g
            string[] keys= this.Request.QueryString.AllKeys;
            //foreach(KeyValuePair<string,string> key in this.Request.QueryString)
            foreach(string key in keys)
            {
                if (i > 0)
                    para += "&";
                if (key=="retURL")
                    para += string.Format("{0}={1}", key, HttpUtility.UrlEncode( this.Request.QueryString[key]));
                else
                    para += string.Format("{0}={1}", key, this.Request.QueryString[key]);
                i++;
            }
            this.FormSRC = "SubfrmEdit.aspx?" + para;
        }
        public string FormSRC { get; set; }
    }
}