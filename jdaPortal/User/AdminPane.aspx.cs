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
    public partial class AdminPane : System.Web.UI.Page
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
            loadGroup();
            
            loadDepartments();
        }


        protected void searchUsr_Click(object sender, EventArgs e)
        {
            var SearchResutl = iServNot.proc_searchUsr(txtSearchUser.Text);
            listPnl.DataSource = SearchResutl;
            listPnl.DataBind();
        }

        protected void loadGroup()
        {
            ddlGroup.Items.Clear();
            var groups = iServNot.proc_GetUserGroup(null);
            ddlGroup.Items.Add("Select Group");
            ddlGroup.SelectedIndex = ddlGroup.Items.Count - 1;
            ddlGroup.DataSource = groups;
            ddlGroup.DataBind();
        }

        protected void loadDepartments()
        {
            ddlDepartment.Items.Clear();
            var groups = iServNot.proc_GetDepartment(null);
            ddlDepartment.Items.Add("No Department");
            ddlDepartment.SelectedIndex = ddlDepartment.Items.Count - 1;
            ddlDepartment.DataSource = groups;
            ddlDepartment.DataBind();
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

            GroupName.Value = UsrGroupName;
            GroupCode.Value = UsrGroupID.ToString();
            pUsername.Value = UsrName;
            pPassword.Text = UsrPass.ToString();
            pPassword.Attributes.Add("Value", UsrPass.ToString());
            pFName.Value = UsrFName;
            pLName.Value = UsrLName;
            pMName.Value = UsrMName;
            pDesignation.Value = UsrPosition;
            pSection.Value = UsrSection;
            pAddress.Value = UsrAddress;
            peAddress.Value = UsrEAdd;
            pempCode.Value = UsrEmpCode;
            rbIsActive.Checked = UsrStatus;
            rbUsrIsLog.Checked = UsrIsLog;
            //cbStatus.Attributes.Add("checked", UsrStatus.ToString());
            //cbUsrIsLog.Attributes.Add("checked", "false");
            //if (UsrIsLog) { cbUsrIsLog.Attributes.Add("checked", "checked"); } else { cbUsrIsLog.Attributes.Remove("checked"); }
            //if (UsrStatus) { cbStatus.Attributes.Add("checked", "checked"); } else { cbStatus.Attributes.Remove("checked"); }

            ddlDepartment.SelectedValue = DepCode.ToString();
            loadThisShitPart2();
        }

        //Update group proc here
        protected void groupUpdate(int oldUg, int newUG, int usrInfoId)
        {
            var updateMsg = iServNot.proc_UpdateUserGroup(usrInfoId, oldUg, newUG).FirstOrDefault();
            if (Convert.ToInt32(updateMsg.Request_Result) <= 0)
            {
                toastr.Show(this, updateMsg.Message);
            }
            else
            {
                toastr.Show(this, updateMsg.Message);
                clearInputs("group");
            }
            
        }

        protected void updateUsrGroup_Click(object sender, EventArgs e)
        {
            if (GroupCode.Value == "" || GroupCode.Value == null)
            {
                toastr.Show(this, "No Group ID detected. Ask MVCanalita for Help.");
            }
            else if (ddlGroup.SelectedIndex <= 0)
            {
                toastr.Show(this, "Please select new group!");
            }
            else
            {
                groupUpdate(Convert.ToInt32(GroupCode.Value),Convert.ToInt32(ddlGroup.SelectedValue),Convert.ToInt32(ViewState["UsrInfoID"]));
            }
        }

        protected void updateDetails()
        {
            try
            {
                var uname = pUsername.Value;
                var empCode = pempCode.Value;
                var pass = pPassword.Text;
                var fname = pFName.Value;
                var mname = pMName.Value;
                var lname = pLName.Value;
                var desig = pDesignation.Value;
                var site = pSection.Value;
                var address = pAddress.Value;
                var depID = Convert.ToInt32(ddlDepartment.SelectedValue);
                var Eadd = peAddress.Value;
                var usrIsActive = rbIsActive.Checked;
                var usrIsLog = rbUsrIsLog.Checked;
                //var islog = (cbUsrlog.Value=="1") ? true : false;
                

            
                var updateMsg = iServNot.proc_updateUserDtls(Convert.ToInt32(ViewState["UsrInfoID"]), portalSession.LoggedUser.usrInfoID, uname,
                                empCode, pass, fname, mname, lname, desig, Eadd, site, address, depID, usrIsActive, usrIsLog, true).FirstOrDefault();
                if (updateMsg.Result <= 0)
                {
                    toastr.Show(this, updateMsg.Message);
                }
                else
                {
                    toastr.Show(this, updateMsg.Message);
                    clearInputs("usrdtls");
                }
            }
            catch (Exception ex)
            {
                toastr.Show(this, ex.Message);
            }

        }

        //clear inputs 
        protected void clearInputs(string grp)
        {
            switch (grp)
            {
                case "group":
                    GroupName.Value = "";
                    GroupCode.Value = "";
                    ddlGroup.SelectedIndex = 0;
                    break;
                case "usrdtls":
                    pUsername.Value = "";
                    pPassword.Text = "";
                    pPassword.Attributes.Remove("value");
                    pFName.Value = "";
                    pLName.Value = "";
                    pMName.Value = "";
                    pDesignation.Value = "";
                    pSection.Value = "";
                    pAddress.Value = "";
                    peAddress.Value = "";
                    pempCode.Value = "";
                    ddlDepartment.SelectedIndex = 0;
                    rbIsActive.Checked = false;
                    rbUsrIsLog.Checked = false;
                    listPnl.DataSource = null;
                    break;

                default:
                    break;
            }

        }
        //updates the personal info panel
        protected void updatePersonalInfo_Click(object sender, EventArgs e)
        {
            updateDetails();
        }

        
        protected void AccessGrid_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            
            if (!e.CommandName.Equals("Delete")) return;

            var row = ((e.CommandSource as LinkButton).Parent.Parent as GridViewRow).RowIndex;
            AccessGrid.SelectedIndex = row;
            ////0,1,2 - AccessCode,AccessDesc,AccessID
            //DataTable dt = new DataTable();
            //dt.Columns.AddRange(new DataColumn[3] { new DataColumn("UsrAccessCode"), new DataColumn("UsrAccessDesc"), new DataColumn("UsrAccessID") });
            //string UsrAccessCode, UsrAccessDesc, UsrAccessID;
            //UsrAccessCode = AccessGrid.DataKeys[row][0].ToString();
            //UsrAccessDesc = AccessGrid.DataKeys[row][1].ToString();
            //UsrAccessID = AccessGrid.DataKeys[row][2].ToString();
            //dt.Rows.Add(UsrAccessCode, UsrAccessDesc);
            //ViewState["dtAcc"] = dt;

            //UsrAccessCur.DataSource = dt;
            //UsrAccessCur.DataBind();

        }
        protected void loadThisShitPart2()
        {
            var listOfAllAccessMods = iServNot.proc_displayAccessModules().ToArray();
            AccessGrid.DataSource = listOfAllAccessMods;
            List<portaluser.ModuleAccess> myAccessModule = portalSession.LoggedUser.UserModAccess.ToList();
            AccessGrid.DataBind();
            foreach (GridViewRow row in AccessGrid.Rows)
            {
                string compareMe = row.Cells[1].Text;
                for (var x = 0; x < myAccessModule.Count; x++)
                {
                    if (compareMe.Equals(myAccessModule[x].ModCode.ToString()))
                    {
                        System.Web.UI.WebControls.CheckBox chkbx = row.FindControl("rbAccess") as System.Web.UI.WebControls.CheckBox;
                        chkbx.Checked = true;
                    }
                }
                   
            }
        }

        protected void updatingAccess()
        {
            string accessibleModules = "0";
            for (int x = 0; x < AccessGrid.Rows.Count; x++)
            {
                GridViewRow row = AccessGrid.Rows[x];
                bool isChecked = ((System.Web.UI.WebControls.CheckBox)row.FindControl("rbAccess")).Checked;

                if (isChecked)
                {
                    accessibleModules = accessibleModules + "," + AccessGrid.DataKeys[row.DataItemIndex][2].ToString();
                }
            }
            var updateMsg = iServNot.proc_updateUAccessMod(Convert.ToInt32(ViewState["UsrInfoID"]), accessibleModules).FirstOrDefault();
            toastr.Show(this, accessibleModules);
        }

        protected void AccessGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            AccessGrid.PageIndex = e.NewPageIndex;
            loadThisShitPart2();
        }

        protected void btnUpdateAccessibleModules_Click(object sender, EventArgs e)
        {
            
            try
            {
                updatingAccess();
            }
            catch (Exception ex)
            {
                toastr.Show(this, ex.Message);
            }
        }


        protected void cbCheckAll_CheckedChanged(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.CheckBox ChkBoxHeader = (System.Web.UI.WebControls.CheckBox)AccessGrid.HeaderRow.FindControl("cbCheckAll");
            foreach (GridViewRow row in AccessGrid.Rows)
            {
                System.Web.UI.WebControls.CheckBox ChkBoxRows = (System.Web.UI.WebControls.CheckBox)row.FindControl("rbAccess");
                if (ChkBoxHeader.Checked == true)
                {
                    ChkBoxRows.Checked = true;
                }
                else
                {
                    ChkBoxRows.Checked = false;
                }
            }
        }

    }
}

