using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using jdaPortal.Toolkit;
using jdaPortal.Data;
using System.Net;

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

            loadVendorAllowance();
        }

        private void loadVendorAllowance()
        {
            //var vndorlst = _db.proc_getVendorAllowance(2373, null, null, null, null, null, null).OrderBy(x=>x.);

            var test = _db.proc_test();
            lstVndorAllowance.DataSource = test;
            lstVndorAllowance.DataBind();
        }
    }
}