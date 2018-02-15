using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using jdaPortal.Toolkit;


namespace jdaPortal.Pages
{
    public partial class PdfPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!portalSession.UserIsLogged)
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            if (!this.IsPostBack)
            {
                string pdfPath = Server.MapPath("/pdf/" + Session["ioLink"]);
                WebClient client = new WebClient();
                Byte[] buffer = client.DownloadData(pdfPath);
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
        }
    }
}