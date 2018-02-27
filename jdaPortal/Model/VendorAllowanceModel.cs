using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jdaPortal.Model
{
    public class VendorAllowanceModel
    {
        public int vendorCode { get; set; }
        public string vendorName { get; set; }
        public int? depno { get; set; }
        public int? subdepno { get; set; }
        public int? iclassno { get; set; }
        public int? isclassno { get; set; }
        public string skuNumber { get; set; }
        public string itemDesc { get; set; }
        public string AllowanceType { get; set; }
        public string AllowanceDesc { get; set; }
        public int? AllowanceNo { get; set; }
        public double? percentoff { get; set; }
        public string fromtoDate { get; set; }

    }
}