using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using jdaPortal.Data;
using jdaPortal.Toolkit;

namespace jdaPortal.User
{
    public partial class Profile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!portalSession.UserIsLogged)
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            if (IsPostBack) return;

            lblFname.Text = portalSession.LoggedUser.Fullname.LastName + " " + portalSession.LoggedUser.Fullname.FirstName;
            lblAddress.Text = portalSession.LoggedUser.UsrAddress;
            lblPosition.Text = portalSession.LoggedUser.Position;
            lblUserSect.Text = portalSession.LoggedUser.UsrSection;
        }
    }
}