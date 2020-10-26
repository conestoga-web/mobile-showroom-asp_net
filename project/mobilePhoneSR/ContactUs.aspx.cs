using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mobilePhoneSR
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*Master.HeaderText = "Contact Us"*/;

            Master.AddBreadcrumbLink("/default.aspx", "Home");
            Master.AddCurrentPage("Company");

            lblPhone.Text = "1-800-555-0400" + "<br>" + "Weekdays, 8 to 5 Pacific Time";
            lblFax.Text = "1-559-555-2732";
            lblAddress.Text = "Online Mobilephone Shop" + "<br>" + "1500 N. Main Street" + "<br>" + "Fresno, California 93710";
        }
    }
}