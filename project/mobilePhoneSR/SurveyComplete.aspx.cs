using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mobilePhoneSR
{
    public partial class SurveyComplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/default.aspx", "Home");
            Master.AddCurrentPage("Support / Survey / Survey Complete");

            bool contactAsked = Convert.ToBoolean(HttpContext.Current.Session["Contact"]);
            if (true == contactAsked)
            {
                lblMessage.Text = "A Customer service representative will contact you within 24 hours.";
                HttpContext.Current.Session["Contact"] = false;
            }

        }

        protected void btnSurvey_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/CustomerSurvey.aspx");
        }
    }
}