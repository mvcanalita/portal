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

namespace jdaPortal.Pages
{
    public partial class DataPage : System.Web.UI.Page
    {
        globalMeta ios = new globalMeta();
        int repFlag = 1;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["filePath"] = Request.QueryString["ReportName"].ToString(); //gets the report name and place it to session variable for globalMeta to handle
            Session["RepType"] = Request.QueryString["ReportType"].ToString(); //gets the report type

            repFlag = (Session["RepType"].ToString().ToLower() == "xls") ? 4 : 1; //Auto selects flag if pdf or xls - 4 for xls and 1 for pdf
            lblRepTitle.Text = Session["filePath"].ToString(); // Sets the Report Title Label
            if (!portalSession.UserIsLogged)
            {
                Response.Redirect(ResolveUrl("~/Login.aspx")); //redirects user to loginpage if not logged.
            }
            if (IsPostBack) return;
            //ios.pageAuthorize(Session["RepType"].ToString()); //The authorization - stagnant for the time being
            try
            {
                listPnl.DataSource = ios.listLoad(repFlag); //loads the report base on the return value of flag check at page load
                listPnl.DataBind(); // binds the data to gridview
                lblCOunt.Text = ios.listLoad(repFlag).Count().ToString(); //sets count on count label
            }
            catch (Exception exc)
            {
                Console.WriteLine("CHECK THIS: " + exc.ToString());
            }

        }

        //DownloadFile
        protected void DownloadFile(object sender, EventArgs e)
        {
            string filePath = (sender as LinkButton).CommandArgument; //command argument from gridview link
            string[] iFile = filePath.Split('.'); //Splits the filename
            string checking2 = iFile[iFile.Length - 1];

            if (iFile[iFile.Length - 1] == "XLS")
            {
                selectDl(filePath); // download for xls - 2003 - early 2007 versions
            }
            else if (iFile[iFile.Length - 1] == "xlsx")
            {
                selectDl(filePath); //download for xlxs - 2007 to present
            }
            else
            {
                selectDl(filePath); // generic download handler
            }

        }

        //search list
        protected void listPnl_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (!e.CommandName.Equals("ViewFile")) return;
            Session["form_mode"] = "edit";
            var row = ((e.CommandSource as LinkButton).Parent.Parent as GridViewRow).RowIndex;
            listPnl.SelectedIndex = row;
            ViewState["edit_id"] = listPnl.DataKeys[row][0];
            string theReasonPath = Session["RepType"].ToString();

            if (!theReasonPath.Equals("xls")) // if it is not equal to xls then do the generic view file of pdf with pdf mimetype
            {
                viewFile2(Session["filePath"].ToString().ToUpper() + "/" + portalSession.LoggedUser.Username.ToUpper() + "/" + listPnl.DataKeys[row][0]);
            }
            else //then do the modified view file for xlxs/xls mime types
            { // resulting to : xls/pom343/mcanalita/POM343_PO#11001_11001_20161212.pdf
                viewFile2("xls/" + Session["filePath"].ToString().ToUpper() + "/" + portalSession.LoggedUser.Username.ToUpper() + "/" + listPnl.DataKeys[row][0]);
            }


        }

        private void viewFile2(string ifilename)
        {

            string extensionDiff = Session["RepType"].ToString();

            if (!extensionDiff.Equals("xls")) //if not xls then use generic mime type
            {
                string pdfPath = Server.MapPath("/pdf/" + ifilename);
                WebClient client = new WebClient();
                Byte[] buffer = client.DownloadData(pdfPath);
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-length", buffer.Length.ToString());
                Response.BinaryWrite(buffer);
            }
            else //use modified xls/xlsx mime type
            {
                string pdfPath = Server.MapPath("/pdf/" + ifilename);
                WebClient client = new WebClient();
                Byte[] buffer = client.DownloadData(pdfPath);
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment; filename= " + pdfPath);
                Response.BinaryWrite(buffer);
            }


        }

        //the actual search - working
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            if (txtSearch.Text == string.Empty) //just checking if the search parameter is empty
            {
                return;
            }
            else
            {
                
                if (!Convert.ToBoolean(ViewState["iS_search"])) //checking if user is currently on search mode - expiremntal
                {

                    ViewState["iS_search"] = true;
                    listPnl.DataSource = ios.listSearch(txtSearch.Text, repFlag);
                    lblCOunt.Text = ios.listSearch(txtSearch.Text, repFlag).Count().ToString();
                    listPnl.DataBind();
                }
                else
                {
                    ViewState["iS_search"] = false;
                    listPnl.DataSource = ios.listSearch(txtSearch.Text, repFlag);
                    lblCOunt.Text = ios.listSearch(txtSearch.Text, repFlag).Count().ToString();
                    listPnl.DataBind();
                }

            }

        }
        public void selectDl(string path)
        {

            if (Session["RepType"].ToString() == "xls")
            {
                Response.ContentType = ContentType;//"application/vnd.ms-excel"; ;
                Response.Buffer = true;
                Response.AppendHeader("Content-Disposition", "attachment; Filename=" + Path.GetFileName(path));
                Response.WriteFile(ios.returnResult(4) + "\\" + path);
                Response.End();
            }
            else if (Session["RepType"].ToString() == "AP")
            {
                Response.ContentType = ContentType;//"application/vnd.ms-excel"; ;
                Response.Buffer = true;
                Response.AppendHeader("Content-Disposition", "attachment; Filename=" + Path.GetFileName(path));
                Response.WriteFile(ios.returnResult(3) + "\\" + path);
                Response.End();
            }
            else
            {
                Response.ContentType = ContentType;
                Response.Buffer = true;
                Response.AppendHeader("Content-Disposition", "attachment; Filename=" + Path.GetFileName(path));
                Response.WriteFile(ios.returnResult(1) + "\\" + path);
                Response.End();
            }

        }


        //On index changes - handles multiple pages of the grid
        protected void listPnl_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            if (IsPostBack)
            {
                string path = Session["filePath"].ToString().ToUpper();

                if (Session["RepType"].ToString() == "xls")
                {
                    listPnl.PageIndex = e.NewPageIndex;
                    listPnl.DataSource = ios.listLoad(repFlag);
                    lblCOunt.Text = ios.listLoad(repFlag).Count().ToString();
                    listPnl.DataBind();
                }
                else if (Session["RepType"].ToString() == "AP")
                {
                    listPnl.PageIndex = e.NewPageIndex;
                    listPnl.DataSource = ios.listLoad(3);
                    lblCOunt.Text = ios.listLoad(3).Count().ToString();
                    listPnl.DataBind();
                }
                else
                {
                    listPnl.PageIndex = e.NewPageIndex;
                    listPnl.DataSource = ios.listLoad(1);
                    lblCOunt.Text = ios.listLoad(1).Count().ToString();
                    listPnl.DataBind();
                }
            }
        }
    }
}