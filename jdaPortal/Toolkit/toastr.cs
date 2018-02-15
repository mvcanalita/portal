using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;


namespace jdaPortal.Toolkit
{
    public class toastr
    {
        /// <summary>
        /// Display a toast message with the default duration (2 seconds).
        /// </summary>
        /// <param name="page">The current page.</param>
        /// <param name="message">The message to display.</param>
        public static void Show(Page page, String message)
        {
            Show(page, message, ToastDuration.NORMAL);
        }

        /// <summary>
        /// Display a toast message with a specific duration.
        /// </summary>
        /// <param name="page">The current page.</param>
        /// <param name="message">The message to display.</param>
        /// <param name="duration">ToastDuration: SHORT, NORMAL, LONG, VERY_LONG</param>
        public static void Show(Page page, String message, ToastDuration duration)
        {
            var cs = page.ClientScript;
            var jsCode = "$(document).ready(function() { $.Toast('" + message + "', " + (int)duration + "); });";

            var jsLink = new HtmlGenericControl { TagName = "script", InnerHtml = jsCode };
            jsLink.Attributes.Add("type", "text/javascript");
            page.Controls.Add(jsLink);
        }

        public enum ToastDuration
        {
            SHORT = 1500,
            NORMAL = 2000,
            LONG = 3500,
            VERY_LONG = 5000
        }
    }
}