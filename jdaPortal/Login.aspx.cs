using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using jdaPortal.Data;
using jdaPortal.Toolkit;

namespace jdaPortal
{
    public partial class Login : System.Web.UI.Page
    {
        jdaportalDataContext db = new jdaportalDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            Page.Header.DataBind();
            if (portalSession.UserIsLogged)
            {
                Response.Redirect(ResolveUrl("~/Default.aspx"));
            }
            //pnotifyMe();
        }

        
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var usrLog = db.proc_UserLogIn(txtlgUser.Value, txtlgPass.Value).FirstOrDefault();
            if (usrLog.Result > 0 )
            {
                var usrDtls = db.proc_GetUsrDetails(usrLog.Result).FirstOrDefault();
                var sysSettings = db.proc_GetSystemSettings().FirstOrDefault();
                var usr = new jdaPortal.Toolkit.portaluser
                {
                    usrInfoID = Convert.ToInt32(usrDtls.UsrInfoID),
                    userIsLog = Convert.ToBoolean(usrDtls.UsrIsLog),
                    userLastLog = Convert.ToDateTime(usrDtls.UsrLastLog),
                    userStatus = Convert.ToBoolean(usrDtls.UsrStatus),
                    Username = usrDtls.UsrName,
                    Password = usrDtls.UsrPass,
                    Position = usrDtls.UsrPosition,
                    imagePath = usrDtls.photoLocation,
                    Department = usrDtls.DepName,
                    usrEmpCode = usrDtls.UsrEmpCode,
                    UsrAddress = usrDtls.UsrAddress,
                    UsrSection = usrDtls.UsrSection,
                    UserGroupCode = (int)usrDtls.UsrGroupID,
                    UsrEmailAdd = usrDtls.UsrEAdd,
                    UsrNName = usrDtls.UsrNickName,
                    pdfPath = sysSettings.sysValue.ToString(),
                    Fullname = new jdaPortal.Toolkit.portaluser.name{FirstName=usrDtls.UsrFName, MiddleName=usrDtls.UsrMName, LastName=usrDtls.UsrLName }
                    
                };

                portalSession.LoggedUser = usr;
                usr.UserModAccess = db.proc_UsrAccessMods(portalSession.LoggedUser.Username.ToString()).Select(x => new Toolkit.portaluser.ModuleAccess
                {
                    ModCode = x.UsrAccessCode
                }).ToList();
                Session["includeData"] = portalSession.LoggedUser.usrInfoID.ToString();
                var refUrl = Request["ref_url"];

                if (refUrl == null)
                {
                    Response.Redirect(ResolveUrl("~/Default.aspx"));
                }
                else
                {
                    Response.Redirect(ResolveUrl("~" + refUrl.ToString()));
                    Session["username"] = portalSession.LoggedUser;
                }

                

            }
            else if(usrLog.Result < 0)
            {
                toastr.Show(this, "User not not found.");
                //ScriptManager.RegisterStartupScript(this, typeof(Page), "notifyUser", "showMsg('Incorrect User/Password')", true);
            }
            else if(usrLog.Result == 0)
            {
                toastr.Show(this, usrLog.Message);
                //ScriptManager.RegisterStartupScript(this, typeof(Page), "notifyUser", "showMsg('" +  + "')", true);
            }
        }

        
        //protected void btnRecover_Click(object sender, EventArgs e)
        //{
        //    if (forg_username.Text == string.Empty)
        //    {
        //        toastr.Show(this, "Username Empty");
        //    }
        //    else if (Convert.ToInt32(forg_securityQuestion.SelectedValue) == 0)
        //    {
        //        toastr.Show(this, "Select Question");
        //    }
        //    else if (for_SecQAns.Text == string.Empty)
        //    {
        //        toastr.Show(this, "No answer entered");
        //    }
        //    else
        //    {
        //        if (hdnFld.Value == "1")
        //        {
        //            var recMsg = db.proc_recoverValidation(forg_username.Text, for_SecQAns.Text, Convert.ToInt32(forg_securityQuestion.SelectedValue)).FirstOrDefault();
        //            toastr.Show(this, recMsg.Message);
        //        }
        //    }
            
        //}

    }
}