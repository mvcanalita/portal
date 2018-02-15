using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jdaPortal.Toolkit
{
    public class portaluser
    {
        /// <summary>
        /// Gets or sets the user record ID (database).
        /// </summary>
        public int usrInfoID { get; set; }
        /// <summary>
        /// Gets or sets the username (database).
        /// </summary>
        public String Username { get; set; }
        /// <summary>
        /// Gets or sets the userpassword (database).
        /// </summary>
        public String Password { get; set;}

        /// <summary>
        /// Gets or sets the userIsLog (database).
        /// </summary>
        public Boolean userIsLog { get; set; }

        /// <summary>
        /// Gets or sets the user Status - disabled/enabled (database).
        /// </summary>
        public Boolean userStatus { get; set; }

        /// <summary>
        /// Gets or sets the user last login date (database).
        /// </summary>
        public DateTime userLastLog { get; set; }

        public class GroupAccess
        {
            /// <summary>
            /// Gets or sets the group ID (database identity)
            /// </summary>
            public int GrpId { get; set; }
            /// <summary>
            /// Gets or sets group name/description.
            /// </summary>
            public String GrpDesc { get; set; }
        }



    }
}