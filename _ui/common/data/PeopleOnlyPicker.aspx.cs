using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Supermore;
using Supermore.Data;
using Supermore.Security;
using Supermore.Activities;
using Supermore.EntityFramework.Entities;
using System.Text;
using Supermore.Organization;

namespace WebClient._ui.common.data
{
    public partial class PeopleOnlyPicker : System.Web.UI.Page
    {

        CallContext caller;
        string _options = "";
        string _userName;
        int totalItems = 0;
        string _availableSelectOptions = "";
        string lktp = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            caller = AppDataSource.GetCallContext();
            _userName = caller.UserName;

            //LoadUsers();
            //if (Request["showuserOnly"] == null)
            //{
            //   //LoadVaiables();
            //}
            if (Request["group"] != null)
            {
                LoadPublicGroups();
                LoadPersonalGroups();
            }
            if (Request["role"] != null)
            {
                LoadRoles();
            }
        }
        /*
         ['P', '个人小组：开发1组', 'P:00G90000001cUGE', '开发1组', existingSelduel_select_0, ''], 
         ['R', '小组：开发一组组', 'R:00G90000001c3rI', '开发一组组', existingSelduel_select_0, '']
         ['U', '用户：liu jack', 'U:0059000000390Wh', 'liu jack', existingSelduel_select_0, '']
         ['A', '角色：CEO', 'A:00G90000002JvmM', 'ceo', existingSelduel_select_0, '']
         */
        void LoadRoles()
        {
            // if (!string.IsNullOrEmpty(_availableSelectOptions))
            List<Role> users = SecurityAuth.GetSystemRoles(caller);

            if (totalItems > 0 && users.Count > 0)
                _availableSelectOptions += ",";

            int i = 0;
            foreach (Role a in users)
            {
                if (lktp.IndexOf(a.ID.ToString()) > -1)
                    SelectedOptions += string.Format("<option value='A:{1}'>角色：{0}</option>", a.Name, a.ID);

                if (i > 0)
                    _availableSelectOptions += ",";

                _availableSelectOptions += string.Format("['A', '角色：{0}', 'A:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
                totalItems++;
            }
            //   duel_select_0Var.addOptions(false, [['R', '小组：OA维护组', 'R:2840a66b-9437-47e7-93d4-4e2f9e169b0f', 'OA维护组', existingSelduel_select_0, ''],['R', '小组：护理部', 'R:1350c017-838a-4b73-909a-f820398be65e', '护理部', existingSelduel_select_0, ''],,['A', '角色：安全生产指导科科长', 'A:9c805f8a-5883-40ae-9186-ec9be8bccd48', '安全生产指导科科长', existingSelduel_select_0, ''],['A', '角色：办公室副主任', 'A:6e74d72b-d72d-487f-b987-9b1c03f6a67d', '办公室副主任', existingSelduel_select_0, ''],['A', '角色：办公室主任', 'A:02573ae4-43ac-475b-8023-c32a8079a370', '办公室主任', existingSelduel_select_0, ''],['A', '角色：办公室主任科员', 'A:f789fb40-4847-46df-b20e-bb5060b944ee', '办公室主任科员', existingSelduel_select_0, ''],['A', '角色：编制人事科长', 'A:c9435aee-4b86-4c6f-a8ca-25346132a8b5', '编制人事科长', existingSelduel_select_0, ''],['A', '角色：标准用户', 'A:b5ef3bb9-85e1-4c50-9316-2c39a1634003', '标准用户', existingSelduel_select_0, ''],['A', '角色：产权管理科副科长', 'A:1fd04717-f3b7-4e8c-841a-f55d9740537b', '产权管理科副科长', existingSelduel_select_0, ''],['A', '角色：常务副书记', 'A:f96251e2-105c-437a-9a75-6326c2a69311', '常务副书记', existingSelduel_select_0, ''],['A', '角色：党委书记、主任', 'A:8cc0246f-5221-4ae0-a077-c95dda05fedb', '党委书记、主任', existingSelduel_select_0, ''],['A', '角色：党委委员副主任', 'A:933874b1-a63e-4762-8292-5a34c51936f8', '党委委员副主任', existingSelduel_select_0, ''],['A', '角色：党委委员纪委书记', 'A:6205a826-cd5b-4baf-aab2-1b8a864d20a5', '党委委员纪委书记', existingSelduel_select_0, ''],['A', '角色：党委委员总工程师', 'A:5ef21114-09cf-4b14-89f2-d2b58bc38f43', '党委委员总工程师', existingSelduel_select_0, ''],['A', '角色：党委委员总经济师', 'A:a3a28d34-0d45-4f07-adea-7468c8442ba9', '党委委员总经济师', existingSelduel_select_0, ''],['A', '角色：电力科科长', 'A:e90c33ea-d566-4a52-bd5b-7332f8fa66a8', '电力科科长', existingSelduel_select_0, ''],['A', '角色：电子信息科科长', 'A:7bd38d21-7eac-4d9a-833d-f66034c2f909', '电子信息科科长', existingSelduel_select_0, ''],['A', '角色：电子信息科科员', 'A:04160eaa-ab7f-4bc7-9373-13e8cfe8dffc', '电子信息科科员', existingSelduel_select_0, ''],['A', '角色：服务企业办公室科长', 'A:f0233642-fde0-48b7-bfe9-129c78200ce0', '服务企业办公室科长', existingSelduel_select_0, ''],['A', '角色：副调研员', 'A:ef746b10-7c3e-46f9-bf08-2152b0f1a5ab', '副调研员', existingSelduel_select_0, ''],['A', '角色：纪检监察室科长', 'A:d73a4e1e-98b2-4260-b093-bfe97357aeeb', '纪检监察室科长', existingSelduel_select_0, ''],['A', '角色：技术创新与装备科科长', 'A:0f8e3fc0-c378-429b-9f28-a74983ab522c', '技术创新与装备科科长', existingSelduel_select_0, ''],['A', '角色：节能环保科科长', 'A:5e3717aa-c61e-42bd-8f84-29786672dfb3', '节能环保科科长', existingSelduel_select_0, ''],['A', '角色：经济运行科科长', 'A:a8b85154-d496-4d6d-86ba-2e2b7b01f960', '经济运行科科长', existingSelduel_select_0, ''],['A', '角色：老干科科长', 'A:600af05e-5068-47ba-956c-1b11cd388bf3', '老干科科长', existingSelduel_select_0, ''],['A', '角色：民营经济发展科主任科员', 'A:9fa5143c-973d-43dc-a842-439346675447', '民营经济发展科主任科员', existingSelduel_select_0, ''],['A', '角色：能源交通科科长', 'A:db5bfe19-c2de-4f27-b444-2044146ba191', '能源交通科科长', existingSelduel_select_0, ''],['A', '角色：企业改革发展科科长', 'A:699b0215-955c-4ae9-880f-a727d196a573', '企业改革发展科科长', existingSelduel_select_0, ''],['A', '角色：企业离退休人员管理科科长', 'A:4d3b4d69-02df-486b-81f3-cc0cfb6288cb', '企业离退休人员管理科科长', existingSelduel_select_0, ''],['A', '角色：统计评价科科长', 'A:6c27e345-7af4-42aa-bcc3-23ed06b27d9a', '统计评价科科长', existingSelduel_select_0, ''],['A', '角色：投资规划科科长', 'A:00aa435c-d861-4b4c-9439-6e2cb47dc2d4', '投资规划科科长', existingSelduel_select_0, ''],['A', '角色：维稳办公室科长', 'A:c0d143cb-5b9e-4815-917e-fa842b3feb93', '维稳办公室科长', existingSelduel_select_0, ''],['A', '角色：系统管理员', 'A:3248e241-cab9-4fae-81a5-1fc0711f57f9', '系统管理员', existingSelduel_select_0, ''],['A', '角色：消费品科科长', 'A:adbd685b-d7c4-4e1c-a8f3-9fbee1669344', '消费品科科长', existingSelduel_select_0, ''],['A', '角色：信息化推进科科长', 'A:790ee048-e9ce-4a8c-bf47-e4edacd4a149', '信息化推进科科长', existingSelduel_select_0, ''],['A', '角色：信息化推进科科员', 'A:af1d870e-757f-4fe9-b39c-e3255bd46895', '信息化推进科科员', existingSelduel_select_0, ''],['A', '角色：行政审批科科长', 'A:3ac18b3a-22cf-454e-9012-9dd9b4ddd437', '行政审批科科长', existingSelduel_select_0, ''],['A', '角色：宣传部科长', 'A:633c3c66-059e-4b9c-a63f-87e4a1b0e2ee', '宣传部科长', existingSelduel_select_0, ''],['A', '角色：政策法规科科长', 'A:cd8b323c-a7e1-4579-8ff0-0c13247bc441', '政策法规科科长', existingSelduel_select_0, ''],['A', '角色：主任助理', 'A:8680b4c2-2563-4255-9694-fb9ad2ea222f', '主任助理', existingSelduel_select_0, ''],['A', '角色：组织部科长', 'A:a91ebac3-8f03-46eb-af93-67e5dc084bdd', '组织部科长', existingSelduel_select_0, ''],['F', '流程变量：发起人', 'F:00000000-0000-0000-0000-000000000001', '发起人', existingSelduel_select_0, ''],['F', '流程变量：流程参与人', 'F:00000000-0000-0000-0000-000000000002', '流程参与人', existingSelduel_select_0, ''],['F', '流程变量：发起人部门领导', 'F:00000000-0000-0000-0000-000000000003', '发起人部门领导', existingSelduel_select_0, ''],['F', '流程变量：发起人部门分管领导', 'F:00000000-0000-0000-0000-000000000004', '发起人部门分管领导', existingSelduel_select_0, ''],['F', '流程变量：与发起人相同部门人员', 'F:00000000-0000-0000-0000-000000000006', '与发起人相同部门人员', existingSelduel_select_0, ''],]);
        }
        #region
        /*
        void LoadPersonalGroups()
        {
            EntityCollection entities = SecurityAuth.GetPersonalGroups(caller);
            if (!string.IsNullOrEmpty(_options) && entities.Count > 0)
                _options += ",";
            int i = 0;
            foreach (Entity a in entities)
            {
                if (i > 0)
                    _options += ",";
                _options += string.Format("['P', '个人小组：{0}', 'P:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
            }
        }
        */
        #endregion

        void LoadPersonalGroups()
        {
            // if (!string.IsNullOrEmpty(_availableSelectOptions))
            EntityCollection entities = GroupManager.GetPersonalGroups(caller);
            if (totalItems > 0 && entities.Count > 0)
                _availableSelectOptions += ",";
            int i = 0;
            foreach (Entity a in entities)
            {
                if (lktp.IndexOf(a.ID.ToString()) > -1)
                    SelectedOptions += string.Format("<option value='P:{1}'>个人小组：{0}</option>", a.Name, a.ID);
                if (i > 0)
                    _availableSelectOptions += ",";
                _availableSelectOptions += string.Format("['P', '个人小组：{0}', 'P:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID);
                i++;
                totalItems++;
            }
        }
        void LoadPublicGroups()
        {
            EntityCollection entities = GroupManager.GetPublicGroups(caller);
            // if (!string.IsNullOrEmpty(_availableSelectOptions))
            if (totalItems > 0 && entities.Count > 0)
                _availableSelectOptions += ",";

            int i = 0;
            foreach (Entity a in entities)
            {
                int qty = MainUtil.GetInt(a.Fields["Quantity"].Value, 0);
                if (lktp.IndexOf(a.ID.ToString()) > -1)
                    SelectedOptions += string.Format("<option value='R:{1}'>公用小组：{0}</option>", a.Name, a.ID);
                if (i > 0)
                    _availableSelectOptions += ",";
                _availableSelectOptions += string.Format("['R', '公用小组：{0} ({2}人)', 'R:{1}', '{0}', existingSelduel_select_0, '']", a.Name, a.ID, qty);
                i++;
                totalItems++;
            }
        }
        void LoadUsers()
        {
            List<SystemUser> entities = SecurityAuth.GetAllSystemUsers(caller);

            if (!string.IsNullOrEmpty(_options) && entities.Count > 0)
                _options += ",";
           
            int i = 0;
            foreach (SystemUser a in entities)
            {
                if (i > 0)
                    _options += ",";
                _options += string.Format("['U', '用户：{0}', 'R:{1}', '{0}', existingSelduel_select_0, '']", a.FullName, a.ID);
                i++;
            }
        }
        /// <summary>
        /// 加载变量
        /// </summary>
        void LoadVaiables()
        {
            // if (!string.IsNullOrEmpty(_availableSelectOptions))
            if (totalItems > 0)
                _availableSelectOptions += ",";
            StringBuilder sb = new StringBuilder();
            sb.Append("['F', '流程变量：发起人', 'F:00000000-0000-0000-0000-000000000001', '发起人', existingSelduel_select_0, ''],");
            sb.Append("['F', '流程变量：发起人部门负责人', 'F:00000000-0000-0000-0000-000000000003', '发起人部门负责人', existingSelduel_select_0, ''],");
            sb.Append("['F', '流程变量：发起人部门分管领导', 'F:00000000-0000-0000-0000-000000000004', '发起人部门分管领导', existingSelduel_select_0, ''],");
            sb.Append("['F', '流程变量：主管部门负责人', 'F:00000000-0000-0000-0000-000000000007', '主管部门负责人', existingSelduel_select_0, ''],");
            sb.Append("['F', '流程变量：发起人部门人员', 'F:00000000-0000-0000-0000-000000000006', '发起人部门人员', existingSelduel_select_0, '']");
            sb.Append(",['F', '流程变量：发起人部门分管业务领导', 'F:00000000-0000-0000-0000-000000000041', '发起人部门分管业务领导', existingSelduel_select_0, ''],");
            //sb.Append("['F', '流程变量：流程参与人', 'F:00000000-0000-0000-0000-000000000002', '流程参与人', existingSelduel_select_0, ''],");
            _availableSelectOptions += sb.ToString();
        }

        public string SelectOptions { get { return _options; } }

        public string AvailableSelectOptions { get { return _availableSelectOptions; } }

        public string SelectedOptions { get; set; }
    }
}