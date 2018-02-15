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

namespace jdaPortal
{
    
    public partial class Default : System.Web.UI.Page
    {

        jdaportalDataContext iServNot = new Data.jdaportalDataContext();

        protected void Page_Load(object sender, EventArgs e)
        {

            if (!portalSession.UserIsLogged)
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            if (IsPostBack) return;
            //check for the user group
        }
    }
}