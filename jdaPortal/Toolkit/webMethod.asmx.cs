using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using jdaPortal.Data;
using jdaPortal.Toolkit;
using System.Web.Script;

namespace jdaPortal.Toolkit
{
    /// <summary>
    /// Summary description for webMethod
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.Web.Script.Services.ScriptService]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class webMethod : System.Web.Services.WebService
    {
        jdaportalDataContext db = new jdaportalDataContext();
        [System.Web.Services.WebMethod]
        public EmployeeDetails getEmpDetails(string empCode)
        {
            string ioCode;
            string ioFormat = "000000";
            if (empCode.Length < 6)
            {
                ioCode = ioFormat.Substring(0, ioFormat.Length - empCode.Length) + empCode;
            }
            else
            {
                ioCode = empCode;
            }

            EmployeeDetails iDtls = new EmployeeDetails();
            var checkMe = db.proc_checkifExist(ioCode).FirstOrDefault();

            iDtls.EmpCode = ioCode.ToString();
            iDtls.Exist = Convert.ToBoolean(checkMe.result);
            return iDtls;
            
        }

        [System.Web.Services.WebMethod]
        public EmployeeDetails isAvailable(string Uname)
        {
            
            EmployeeDetails iDtls = new EmployeeDetails();
            var usrAvail = db.func_checkUserAvailability(Uname);
            iDtls.EmpCode = Uname;
            iDtls.Exist = Convert.ToBoolean(usrAvail);
            return iDtls;
        }

        [WebMethod]
        public string updatePassword(string UsrName,string newPass,string oldPass)
        {
            var msgResult = db.proc_updatePassword(UsrName, oldPass, newPass).FirstOrDefault();
            string retMsg = msgResult.Message.ToString();
            return retMsg;
        }

        [WebMethod]
        public string recoverEmail(EmailRecovery erecover)
        {
            var RecMsg = db.proc_recoverValidation(erecover.UserName,erecover.SecurityQuestionAns,Convert.ToInt32(erecover.SecurityQuestionID)).FirstOrDefault();
            var cMsg = RecMsg.Message;
            return cMsg;
        }

        [WebMethod]
        public bool RegisterUser(regDetails udtls)
        {
            string strCheck = "000000";
            string empCode;

            if (udtls.regEmpCode.Length < 6)
            {
                empCode = strCheck.Substring(0, udtls.regEmpCode.Length) + udtls.regEmpCode;
            }
            else
            {
                empCode = udtls.regEmpCode;
            }
            
           
            int genderOne = ((udtls.regGender) ? 1 : 0);
            string emailMsgDetails = "Username: " + udtls.regUsrname + "<br /> ID Number: " + empCode;
            var reMsg = db.proc_InsertWizardRegister(udtls.regUsrname, udtls.regPassword, empCode, udtls.regEmail, Convert.ToBoolean(genderOne), udtls.regMotto, udtls.regNN, null, Convert.ToInt16(udtls.regQuestionID), udtls.regQuestionAns).FirstOrDefault();
            //var notifyMsg = db.proc_emailNotify(emailMsgDetails, "michole.canalita@gmail.com", 0, null).FirstOrDefault();
            
            bool booleanParsing;
            booleanParsing = reMsg.ErrorNumber != null ? true : false;
            //sgRetCode = notifyMsg.Result != null ? true : false;

            if (booleanParsing )
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        [WebMethod]
        public string emailConcer(string details)
        {

            var emailConcernMsg = db.proc_emailNotify(details, "michole.canalita@gmail.com", 1, null).FirstOrDefault();

            return emailConcernMsg.Message.ToString();
        }

        [WebMethod(EnableSession=true)]
        public void setSessionReptype(string Reptype)
        {
            Session["something"] = Reptype;
        }

    }
}
