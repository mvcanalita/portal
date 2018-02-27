using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using jdaPortal.Toolkit;
using jdaPortal.Data;
using System.Data;
using System.Data.SqlClient;
using System.Web.Script.Serialization;
using System.Web.SessionState;
using System.Configuration;

namespace jdaPortal.Data
{
    /// <summary>
    /// Summary description for MenuHandler
    /// </summary>
    public class MenuHandler : IHttpHandler, IRequiresSessionState
    {
        jdaportalDataContext db = new jdaportalDataContext();
        public void ProcessRequest(HttpContext context)
        {
            List<Menu> menuList = new List<Menu>();
            string cs = ConfigurationManager.ConnectionStrings["jdaportalConnectionString"].ToString();
            using(SqlConnection con=new SqlConnection(cs)){
                SqlCommand cmd = new SqlCommand("proc_getMenuDataParameter ", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UsrInfoID", SqlDbType.Int).Value = Convert.ToInt32(context.Session["includeData"]);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while(rdr.Read()){
                    Menu men = new Menu();
                    men.menuId = Convert.ToInt32(rdr["menuID"]);
                    men.menuTxt = rdr["menuDescription"].ToString();
                    men.parentId = rdr["menuParentID"] != DBNull.Value ? Convert.ToInt32(rdr["menuParentID"]) : (int?)null;
                    men.menuLink = rdr["menuLinkAddress"].ToString();
                    men.isActive = Convert.ToBoolean(rdr["isActive"]);
                    men.reportFilename = rdr["reportFileName"].ToString();
                    men.reportType = rdr["reportType"].ToString();
                    menuList.Add(men);
                }
            }
            List<Menu> menuTree = getMenuTree(menuList,null);
            JavaScriptSerializer js = new JavaScriptSerializer();
            context.Response.Write(js.Serialize(menuTree));
            
        }

        private List<Menu> getMenuTree(List<Menu> list, int? parentId)
        {
            return list.Where(x => x.parentId == parentId).Select(x => new Menu()
            {
                menuId = x.menuId,
                menuTxt = x.menuTxt,
                parentId = x.parentId,
                menuLink = x.menuLink,
                isActive = x.isActive,
                reportFilename = x.reportFilename,
                reportType = x.reportType,
                menuList = getMenuTree(list, x.menuId)
            }).ToList();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}