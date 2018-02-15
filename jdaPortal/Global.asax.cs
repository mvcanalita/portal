using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace jdaPortal
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            Application["UserOnline"] = 0;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            
            // Code that runs when a new session is started  
            if (Session["username"] != null)
            {
                //Redirect to Welcome Page if Session is not null  
                //HttpContext.Current.Response.Redirect(page.ResolveUrl("~/User/SessionExpired.aspx"));
                HttpContext.Current.Response.Redirect("~/Default.aspx");
            }
            else
            {
                //Redirect to Login Page if Session is null & Expires
                HttpContext.Current.Response.Redirect("~/Login.aspx");
            }
            Application.Lock();
            Application["UserOnline"] = (int)Application["UserOnline"] + 1;
            Application.UnLock();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            //String WebsiteURL = Request.Url.ToString();
            //String[] SplitedURL = WebsiteURL.Split('/');
            //String[] Temp = SplitedURL[SplitedURL.Length - 1].Split('.');

            // //This is for aspx page
            //if (!WebsiteURL.Contains(".aspx") && Temp.Length == 1)
            //{
            //    if (!string.IsNullOrEmpty(Temp[0].Trim()))
            //        Context.RewritePath(Temp[0] + ".aspx");
            //}
        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
             //Get the exception object.
            var exc = Server.GetLastError();
            var page = HttpContext.Current.Handler as System.Web.UI.Page;

            if (exc.GetType() == typeof(HttpException)) { return; }
            HttpContext.Current.Response.Redirect("~/ErrorPage.aspx");
            //var errorPage =  page.ResolveUrl("~/ErrorPage.aspx");

            // Clear the error from the server
            Server.ClearError();
            
        }

        protected void Session_End(object sender, EventArgs e)
        {
            Application.Lock();
            Application["UserOnline"] = (int)Application["UserOnline"] - 1;
            Application.UnLock();
        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}