using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace jdaPortal.Toolkit
{
    public class Menu
    {
        public int menuId { get; set; }
        public string menuTxt { get; set; }
        public int? parentId { get; set; }
        public string menuLink { get; set; }
        public bool isActive { get; set; }

        public string reportFilename { get; set; }
        public string reportType { get; set; }

        public List<Menu> menuList { get; set; }
    }
}
