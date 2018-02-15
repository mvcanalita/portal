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
        /// Gets or sets the Employee record ID (database).
        /// </summary>
        public string usrEmpCode { get; set; }
        /// <summary>
        /// Gets or sets the Employee record ID (database).
        /// </summary>
        public string UsrAddress { get; set; }
        /// <summary>
        /// Gets or sets the Address record ID (database).
        /// </summary>
        public string UsrSection { get; set; }
        /// <summary>
        /// Gets or sets the Section (database).
        /// </summary>
        public String Username { get; set; }
        /// <summary>
        /// Gets or sets the userpassword (database).
        /// </summary>
        public String Password { get; set;}

        /// <summary>
        /// Gets or sets the Position (database).
        /// </summary>
        public String Position { get; set; }

        /// <summary>
        /// Gets or sets the userpassword (database).
        /// </summary>
        public String Department { get; set; }

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

        /// <summary>
        /// Gets or sets the user Group Name (database).
        /// </summary>
        public String UserGroupName { get; set; }

        /// <summary>
        /// Gets or sets the user Group Code (database).
        /// </summary>
        public int UserGroupCode { get; set; }

        /// <summary>
        /// Gets or sets the user User Access ID (database).
        /// </summary>
        public String UserAccessID { get; set; }
        /// <summary>
        /// Gets or sets the user User Access ID (database).
        /// </summary>
        public String BuyerName { get; set; }

        /// <summary>
        /// Gets or sets the user Email (database).
        /// </summary>
        public String UsrEmailAdd { get; set; }
        /// <summary>
        /// Gets or sets the user Email (database).
        /// </summary>
        public String UsrNName { get; set; }
        /// <summary>
        /// Gets or sets the user User Access ID (database).
        /// </summary>
        public String pdfPath { get; set; }

        /// <summary>
        /// Gets or sets the user User Access ID (database).
        /// </summary>
        public String fielPath { get; set; }

        /// <summary>
        /// Gets or sets the user fullname.
        /// </summary>
        public name Fullname { get; set; }
        // <summary>
        /// Gets or sets the user User Access ID (database).
        /// </summary>
        public List<ModuleAccess> UserModAccess { get; set; }
        public String imagePath { get; set; }


        public class name
        {
            public String FirstName { get; set; }
            public String MiddleName { get; set; }
            public String LastName { get; set; }

            public override string ToString()
            {
                return FirstName + " " + MiddleName + " " + LastName;
            }
        }

        public class GroupAccess
        {
            /// <summary>
            /// Gets or sets the group ID (database identity)
            /// </summary>
            public string GrpId { get; set; }
            /// <summary>
            /// Gets or sets group name/description.
            /// </summary>
            public String GrpDesc { get; set; }
        }

        
        public class ModuleAccess
        {
            public string ModCode { get; set; }
        }


    }
}