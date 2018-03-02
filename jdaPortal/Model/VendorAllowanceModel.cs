using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jdaPortal.Model
{
    public class VendorAllowanceModel
    {
        public int VENDOR { get; set; }
        public string VENDOR_NAME { get; set; }
        public int? DEPARTMENT { get; set; }
        public int? SUB_DEPARTMENT { get; set; }
        public int? CLASS { get; set; }
        public int? SUB_CLASS { get; set; }
        public string ITEM { get; set; }
        public string ALLW_TYPE { get; set; }
        public double? PRCNT_OFF { get; set; }
        public string ALLW_DESC { get; set; }
        public string DATE_FROM { get; set; }
        public string DATE_TO { get; set; }
        public bool? COGS { get; set; }
        public bool? ALLW_NET { get; set; }
        public string ITEM_STYLE { get; set; }
        public int? ALLW_NUM { get; set; }

    }
}
