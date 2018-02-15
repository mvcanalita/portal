using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Net;
using jdaPortal.Toolkit;
using jdaPortal.Data;
using System.Windows.Forms;

namespace jdaPortal.User
{
    
    public partial class AdminPage : System.Web.UI.Page
    {
        jdaportalDataContext iServNot = new Data.jdaportalDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!portalSession.UserIsLogged)
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            if (portalSession.LoggedUser.UserGroupCode != 5)
            {
                Response.Redirect(ResolveUrl("~/page_403.aspx"));
            }
            if (IsPostBack) return;

            
        }

        protected void searchUsr_Click(object sender, EventArgs e)
        {
            var SearchResutl = iServNot.proc_searchUsr(txtSearchUser.Text);
            listPnl.DataSource = SearchResutl;
            listPnl.DataBind();
        }
        protected void listPnl_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!e.CommandName.Equals("selectedRecord")) return;

            var row = ((e.CommandSource as LinkButton).Parent.Parent as GridViewRow).RowIndex;
            listPnl.SelectedIndex = row;

            ViewState["UsrInfoID"] = listPnl.DataKeys[row][0];
            ViewState["uname"] = listPnl.DataKeys[row][1].ToString();
            var UsrName = listPnl.DataKeys[row][1].ToString();
            var UsrPass = listPnl.DataKeys[row][2].ToString();
            var UsrIsLog = Convert.ToBoolean(listPnl.DataKeys[row][3]);
            var UsrStatus = Convert.ToBoolean(listPnl.DataKeys[row][4]);
            var UsrLastLog = Convert.ToDateTime(listPnl.DataKeys[row][5]);
            var UsrGroupID = Convert.ToInt32(listPnl.DataKeys[row][6]);
            var UsrModuleAccess = (listPnl.DataKeys[row][7] == null) ? "none" : listPnl.DataKeys[row][7].ToString();
            var UsrEmpCode = (listPnl.DataKeys[row][8] == null) ? "none" : listPnl.DataKeys[row][8].ToString();
            var UsrFName = listPnl.DataKeys[row][9].ToString();
            var UsrMName = listPnl.DataKeys[row][10].ToString();
            var UsrLName = listPnl.DataKeys[row][11].ToString();
            var UsrPosition = listPnl.DataKeys[row][12].ToString();
            var UsrSection = (listPnl.DataKeys[row][13] == null) ? "none" : listPnl.DataKeys[row][13].ToString();
            var UsrAddress = (listPnl.DataKeys[row][14] == null) ? "none" : listPnl.DataKeys[row][14].ToString();
            var UsrEAdd = (listPnl.DataKeys[row][15] == null) ? "No Record" : listPnl.DataKeys[row][15].ToString();
            var DepName = (listPnl.DataKeys[row][16] == null) ? "none" : listPnl.DataKeys[row][16].ToString();
            var DepCode = (listPnl.DataKeys[row][17] == null) ? "0" : listPnl.DataKeys[row][17];
            var UsrGroupName = (listPnl.DataKeys[row][18] == null) ? "none" : listPnl.DataKeys[row][18].ToString();
            var usrActive = listPnl.DataKeys[row][19].ToString();

            
            //cbStatus.Attributes.Add("checked", UsrStatus.ToString());
            //cbUsrIsLog.Attributes.Add("checked", "false");
            //if (UsrIsLog) { cbUsrIsLog.Attributes.Add("checked", "checked"); } else { cbUsrIsLog.Attributes.Remove("checked"); }
            //if (UsrStatus) { cbStatus.Attributes.Add("checked", "checked"); } else { cbStatus.Attributes.Remove("checked"); }

        }
    }
}