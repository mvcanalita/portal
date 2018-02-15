using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using jdaPortal.Toolkit;
using jdaPortal.Data;

namespace jdaPortal.Pages
{
    public partial class indetJDAreports : System.Web.UI.Page
    {
        globalMeta ios = new globalMeta();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!portalSession.UserIsLogged)
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            if (IsPostBack) return;
            ios.pageAuthorize(Session["RepType"].ToString());
            try
            {
                listPnl.DataSource = ios.listLoad(1);
                listPnl.DataBind();
            }
            catch (Exception exc)
            {
                Console.WriteLine("CHECK THIS: " + exc.ToString());
            }
        }

        [System.Web.Services.WebMethod(EnableSession = true)]
        public static void sampleFucktion(string sessionName) {
            HttpContext.Current.Session.Add("filePath", sessionName);
            HttpContext.Current.Session.Add("RepType", sessionName);
            var io = sessionName.ToString();
            
        }
    }
}