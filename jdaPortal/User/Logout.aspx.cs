using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using jdaPortal.Toolkit;
using jdaPortal.Data;

namespace jdaPortal.User
{
    public partial class Logout : System.Web.UI.Page
    {
        jdaportalDataContext db = new jdaportalDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            

            HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            HttpContext.Current.Response.Cache.SetNoServerCaching();
            HttpContext.Current.Response.Cache.SetNoStore();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetExpires(DateTime.Now);
            var updateMsg = db.proc_LogOut(Convert.ToInt32(portalSession.LoggedUser.usrInfoID)).FirstOrDefault();

            if (updateMsg.Result == 0)
            {
                Session["username"] = "";
                portalSession.LoggedUser = null;
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            else
            {
                Session["username"] = "";
                portalSession.LoggedUser = null;
                Response.Redirect(ResolveUrl("~/Login.aspx"));
                Session["errorPage"] = updateMsg.Message;
            }
           
        }
    }
}