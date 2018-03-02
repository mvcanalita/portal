using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using jdaPortal.Data;
using jdaPortal.Model;
using jdaPortal.Toolkit;

namespace jdaPortal.Pages
{
    public partial class VendorAllowance : System.Web.UI.Page
    {
        jdaportalDataContext _db = new Data.jdaportalDataContext();
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

            if (!IsPostBack) { loadVendorAllowance(); }
        }

        private void loadVendorAllowance()
        {
            var vendor_allowance = (from x in _db.proc_getVendorAllowanceV2(null, null, null, null, null, null, null)
                                         select x).OrderByDescending(x=>x.DATE_FROM).Take(10).ToList();
            lstVendorAllowance.DataSource = vendor_allowance;
            lstVendorAllowance.DataBind();
        }

        protected void lstVendorAllowance_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!e.CommandName.Equals("recordSelect")) return;
            var row = ((e.CommandSource as LinkButton).Parent.Parent as GridViewRow).RowIndex;

            lstVendorAllowance.SelectedIndex = row;

            var VENDOR = lstVendorAllowance.DataKeys[row][0].ToString();
            var VENDOR_NAME = lstVendorAllowance.DataKeys[row][1].ToString();
            var DEPARTMENT = lstVendorAllowance.DataKeys[row][2].ToString();
            var SUB_DEPARTMENT = lstVendorAllowance.DataKeys[row][3].ToString();
            var CLASS = lstVendorAllowance.DataKeys[row][4].ToString();
            var SUB_CLASS = lstVendorAllowance.DataKeys[row][5].ToString();
            var ITEM = (lstVendorAllowance.DataKeys[row][6] == null) ? "NA" : lstVendorAllowance.DataKeys[row][6].ToString();
            var ITEM_DESC = (lstVendorAllowance.DataKeys[row][7] == null) ? "none" : lstVendorAllowance.DataKeys[row][7].ToString();
            var ALLW_TYPE = lstVendorAllowance.DataKeys[row][8].ToString();
            var PRCNT_OFF = lstVendorAllowance.DataKeys[row][9].ToString();
            var ALLW_DESC = lstVendorAllowance.DataKeys[row][10].ToString();
            var DATE_FROM = lstVendorAllowance.DataKeys[row][11].ToString();
            var DATE_TO = lstVendorAllowance.DataKeys[row][12] == null;
            var COGS = (lstVendorAllowance.DataKeys[row][13].ToString() == "Y") ? "Yes" : "Nope";
            var ITEM_STYLE = (lstVendorAllowance.DataKeys[row][14] == null) ? "No Record" : lstVendorAllowance.DataKeys[row][15].ToString();
            var ALLW_NET = (lstVendorAllowance.DataKeys[row][15].ToString() == "Y") ? "Yes" : "Nope";
            var ALLW_NUM = (lstVendorAllowance.DataKeys[row][16] == null) ? "0" : lstVendorAllowance.DataKeys[row][17];

            vndr.Text = VENDOR;
        }
    }
}