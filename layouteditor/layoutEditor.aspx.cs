using Supermore;
using Supermore.Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Youyou.Layouts;
using Newtonsoft.Json;
using Supermore.EntityFramework.Templates;
using System.Web.Script.Serialization;

namespace WebClient.layouteditor
{
    public partial class layoutEditor : System.Web.UI.Page
    {
        LayoutData layouData = null;
        CallContext caller = null;
        //string lid = string.Empty;
        string layoutId = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            layoutId = Request["lid"];
            string type = Request["entityId"];
            string entityId = Request["entityId"];
            //if (!string.IsNullOrEmpty(lid))
            //    layoutId = lid;
            if (string.IsNullOrEmpty(layoutId))
                layoutId = Request["layoutId"];
            string layoutName = Request["layoutName"];

            if (string.IsNullOrEmpty(type))
                type = Request["type"];

            if (string.IsNullOrEmpty(entityId))
                entityId = Request["type"];

            LayoutProvider lp = new LayoutProvider();

            if (!string.IsNullOrEmpty(layoutId) && !string.IsNullOrEmpty(layoutName))
            {
                lp.UpdateLayoutName(caller, layoutId, layoutName);
                string url = string.Format("/layouteditor/layoutEditor.aspx?setupid=CustomObjects&lid={0}&entityId={1}&type={1}", layoutId, entityId);
                Response.Redirect(url,false);
                return;
            }

            string btnRequest = this.Request["j_id0:f:save"];
            
            //保存布局
            if (!string.IsNullOrEmpty(btnRequest))
            {
                try
                {
                    string layoutdata = Request["j_id0:f:jsonLayout"];
                    //string json = layoutdata;
                    Supermore.Diagnostics.Trace.LogError(layoutdata);
                    //string jsonlayoutdata = HttpUtility.HtmlDecode(json);
                    //JavaScriptSerializer js = new JavaScriptSerializer();
                    //LayoutData list = js.Deserialize<LayoutData>(layoutdata);
                    lp.SaveLayoutData(this.caller, layoutId, layoutdata);

                }
                catch (Exception ex)
                {
                    Supermore.Diagnostics.Trace.LogError(ex.Message);
                }
                Response.Redirect(string.Format("/01I/detail?setupid=CustomObjects&id={0}", entityId), false);
            }
            else
            {
                if (!string.IsNullOrEmpty(layoutId) && !string.IsNullOrEmpty(type))
                {
                    GetLayoutData(caller, layoutId);
                    GetLayTroughData(caller, type);
                }
            }
            //快速保存布局
            if (!string.IsNullOrEmpty(Request["quicksave"]))
            {

            }

        }
        /// <summary>
        /// 获取LayoutData
        /// </summary>
        /// <param name="caller"></param>
        /// <param name="entityid"></param>
        public void GetLayoutData(CallContext caller, string layoutId)
        {
            try
            {
                LayoutProvider layoutProvider = new LayoutProvider();
                layouData = layoutProvider.GetLayoutData(caller, layoutId);

                // this.LayoutId = layouData.LayoutId;
                this.LayoutType = layouData.LayoutType;

                LayoutDataJson =  Newtonsoft.Json.JsonConvert.SerializeObject(layouData);
                Supermore.Diagnostics.Trace.LogError(LayoutDataJson);
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogError(ex.Message);
            }

        }
        /// <summary>
        /// 获取TroughData
        /// </summary>
        /// <param name="_caller"></param>
        /// <param name="type"></param>
        public void GetLayTroughData(CallContext _caller, string type)
        {
            try
            {
                LayoutHelper layoutHelper = new LayoutHelper();
                List<object> troughData = new List<object>();
                troughData = layoutHelper.GetTroughData(_caller, type);

                List<object> throughRelateList = layoutHelper.GetTroughRelatedListData(_caller, type);
                troughData.AddRange(throughRelateList);

                StandardButton stdBtnDelete = new StandardButton();
                stdBtnDelete.id = "BTN__Delete";
                stdBtnDelete.name = "Delete";
                stdBtnDelete.label = "删除";
                /*
                  {
                    "displayCategory": "Button",
                    "removable": true,
                    "name": "Delete",
                    "id": "BTN__Delete",
                    "label": "删除",
                    "btnOrder": 1,
                    "category": "StandardButton"
                  }
                 */
                troughData.Add(stdBtnDelete);

                #region 快速操作
                /*
                    {
                    "actionType": "发布",
                    "displayCategory": "QuickAction",
                    "name": "FeedItem.ContentPost",
                    "id": "QA__FeedItem.ContentPost",
                    "label": "文件",
                    "category": "QuickAction"
                    }
                    */
                QuickAction quickAction = new QuickAction();
                quickAction.actionType = "发布";
                quickAction.label = "文件";
                quickAction.name = "FeedItem.ContentPost";
                quickAction.id = "QA__FeedItem.ContentPost";
                troughData.Add(quickAction);
                TroughDataJson = JsonConvert.SerializeObject(troughData);
                #endregion
            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogError(ex.Message);
            }
        }
        /// <summary>
        /// 保存Layoutdata
        /// </summary>
        public void SaveLayoutData(CallContext Caller, string layoutId, string layoutData)
        {
            try
            {
                LayoutProvider lp = new LayoutProvider();
                if (!string.IsNullOrEmpty(layoutId) && !string.IsNullOrEmpty(layoutData))
                {
                    lp.SaveLayoutData(this.caller, layoutId, layoutData);
                }

            }
            catch (Exception ex)
            {
                Supermore.Diagnostics.Trace.LogError(ex.Message);
            }
        }
        /// <summary>
        /// 保存TroughData
        /// </summary>
        public void SaveTroughData()
        {

        }
        /// <summary>
        /// 获取LayoutId
        /// </summary>
        /// <param name="caller"></param>
        /// <param name="id"></param>
        /// <returns></returns>
        public string GetLayoutId(CallContext caller, string id)
        {
            string sql = string.Format("select LayoutId From LayoutSectionBase Where SectionId='{0}'", id);
            string layoutid = DatabaseTool.GetFirstCellStr(caller, sql, "");
            return layoutid;
        }

        public string LayoutDataJson { get; set; }
        public string LayoutDataJsonMethod()
        {
            return LayoutDataJson;
        }
        public string LayoutType { get; set; }
        public string LayoutId
        {
            get { return layoutId; }
            set { layoutId = value; }
        }
        /// <summary>
        /// 糟糕数据
        /// </summary>
        public string TroughDataJson { get; set; }
    }
}