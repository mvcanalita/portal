using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jdaPortal.Toolkit
{
    public class portalSession
    {
        /// <summary>
        /// The currently logged in user (instance of User object)
        /// </summary>
        public static portaluser LoggedUser
        {
            get
            {
                return HttpContext.Current.Session["logged_user"] as portaluser;
            }
            set
            {
                HttpContext.Current.Session["logged_user"] = value;
            }
        }

        /// <summary>
        /// True if a user is currently logged in, false otherwise.
        /// </summary>
        public static bool UserIsLogged
        {
            get
            {
                return LoggedUser != null;
            }
        }
    }
}