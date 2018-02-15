using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.IO;
using System.Net;
using jdaPortal.Toolkit;
using jdaPortal.Data;

namespace jdaPortal.Toolkit
{
    public class globalMeta : Page
    {
        
        public List<ListItem> listLoad(int flag)
        {
            //TODO: add the files to the grid
            List<ListItem> filesToList = new List<ListItem>();
            try
            {
                string pathEval = returnResult(flag); //variable for path evaluation
                //check if the directory exists
                if (Directory.Exists(pathEval))
                {
                    //store filenames in string array
                    string[] files = new DirectoryInfo(pathEval).GetFiles()//gets the file from the path var
                                    .OrderByDescending(x => x.LastWriteTime) //order by last update date-time
                                    .Select(x => x.Name) //selects the filename
                                    .ToArray(); //parse to array

                    //Now, add the files to this list
                    for (int filecount = 0; filecount < files.Length; filecount++)
                    {
                        //adding the actual items to the list using the filecount variable as index of the array
                        filesToList.Add(new ListItem(Path.GetFileName(files[filecount])));

                    }
                    return filesToList.ToList();
                }
                return filesToList.ToList();
            }
            catch (Exception exc)
            {
                Session["errorPage"] = exc.ToString(); //writes error to console
                HttpContext.Current.Response.Redirect(ResolveUrl("~/Pages/ErrorPage.aspx"));
                var tuple = new Tuple<List<ListItem>, int>(null, Convert.ToInt32(0));
                return filesToList.ToList();
            }

        }


        public string returnResult(int? flag)
        {
            string iPath = portalSession.LoggedUser.pdfPath.ToUpper() + Session["filePath"].ToString().ToUpper(); //path constant

            switch (flag)
            {
                case 1:
                    return iPath + "\\" + portalSession.LoggedUser.Username.ToUpper();
                case 2:
                    return iPath + "\\" + portalSession.LoggedUser.BuyerName.ToUpper();
                case 3:
                    return iPath + "\\AP\\";
                case 4:
                    return portalSession.LoggedUser.pdfPath.ToUpper() + "xls\\" + Session["filePath"].ToString().ToUpper() + "\\" + portalSession.LoggedUser.Username.ToUpper();
                default: return iPath + "\\" + portalSession.LoggedUser.Username.ToUpper();
            }
        }
        public void pageAuthorize(string pageName)
        {
            //check null
            int modAccCount = portalSession.LoggedUser.UserModAccess.Count(x => x.ModCode == pageName);
            if (Convert.ToInt32(modAccCount) < 1)
            {
                HttpContext.Current.Response.Redirect(ResolveUrl("~/page_403.aspx"));
            }
        }
        //searches the spooled files

        public List<ListItem> listSearch(string searchString, int? searchFlag)
        {
            //TODO: add the files to the grid
            List<ListItem> filesToList = new List<ListItem>();
            try
            {
                string pathEval = returnResult(searchFlag); //variable for path evaluation
                //check if the directory exists
                if (Directory.Exists(pathEval))
                {
                    //store filenames in string array
                    string[] files = new DirectoryInfo(pathEval).GetFiles()//gets the file from the path var
                                    .OrderByDescending(x => x.LastWriteTime) //order by last update date-time
                                    .Where(f => f.Name.Contains(searchString.ToLower())) //select the specific data
                                    .Select(x => x.Name) //selects the filename
                                    .ToArray(); //parse to array

                    //Now, add the files to this list
                    for (int filecount = 0; filecount < files.Length; filecount++)
                    {
                        //adding the actual items to the list using the filecount variable as index of the array
                        filesToList.Add(new ListItem(Path.GetFileName(files[filecount])));
                    }

                    return filesToList.ToList();
                }
                return filesToList.ToList();
            }
            catch (Exception exc)
            {
                //Console.WriteLine("CHECK THIS YOU MONGREL: " + exc.ToString()); //writes error to console
                Session["errorPage"] = exc.ToString(); //writes error to console
                HttpContext.Current.Response.Redirect(ResolveUrl("~/Pages/ErrorPage.aspx")); //redirects to error page;
                return filesToList.ToList();
            }

        }


        //download sub encaps
        
        //check the directory does exist
        private int ifDirectoryExist(int? flag)
        {
            if (Directory.Exists(returnResult(flag)))
            {
                int icount = Directory.GetFiles(returnResult(flag), "*.*", SearchOption.TopDirectoryOnly).Length;
                return icount;
            }
            return 0;
        }
    }

    public class regDetails
    {
       
        public string regUsrname { get; set; }
        public string regPassword { get; set; }
        public string regEmpCode { get; set; }
        public string regEmail { get; set; }
        public bool regGender { get; set; }
        public string regMotto { get; set; }
        public string regNN { get; set; }
        public int regQuestionID { get; set; }
        public string regQuestionAns { get; set; }
    }

    public class EmployeeDetails
    {
        public string EmpCode { get; set; }
        public bool Exist { get; set; }
    }

    public class EmailRecovery
    {
        public string UserName { get; set; }
        public int SecurityQuestionID { get; set; }
        public string SecurityQuestionAns { get; set; }
    }
}