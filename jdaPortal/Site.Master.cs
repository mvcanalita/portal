using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using jdaPortal.Data;
using jdaPortal.Toolkit;
using System.Web.UI.HtmlControls;
using System.IO;



namespace jdaPortal
{
    public partial class Site : System.Web.UI.MasterPage
    {
        jdaportalDataContext db = new jdaportalDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
            HttpContext.Current.Response.AddHeader("Cache-Control", "no-cache, no-store, must-revalidate");
            HttpContext.Current.Response.AddHeader("Pragma", "no-cache");
            HttpContext.Current.Response.AddHeader("Expires", "0");
            Page.Header.DataBind();
            
            if (!portalSession.UserIsLogged )
            {
                Response.Redirect(ResolveUrl("~/Login.aspx"));
            }
            lblUserFirstName.Text = portalSession.LoggedUser.Fullname.FirstName;
            lblUsrNameData.Text = portalSession.LoggedUser.Username;
            if (portalSession.LoggedUser.UserGroupCode != 5)
            {
                adminPage.Visible = false;
            }
            hdmfxyxsf.Value = portalSession.LoggedUser.Username.ToString();
            usrFullName.Value = portalSession.LoggedUser.Fullname.ToString();
            usrEmail.Value = portalSession.LoggedUser.UsrEmailAdd.ToString();
            checkUploadedImage(portalSession.LoggedUser.imagePath);
        }
        protected void logOut(object sender, EventArgs e)
        {
            Response.Redirect(ResolveUrl("~/User/Logout.aspx"));
            
        }
        protected void checkUploadedImage(string imagePath)
        {

            if (File.Exists(Server.MapPath(imagePath)))
            {
                usrAvatar.Attributes["src"] = portalSession.LoggedUser.imagePath;
                navavatar.Attributes["src"] = portalSession.LoggedUser.imagePath;
            }
            else
            {
                Random rnd = new Random();
                int avatar = rnd.Next(1, 3);
                usrAvatar.Attributes["src"] = "img/avatar/Male-" + avatar.ToString() + ".jpg";
                navavatar.Attributes["src"] = "img/avatar/Male-" + avatar.ToString() + ".jpg";
            }
        }
    }
}