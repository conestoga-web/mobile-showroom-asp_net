using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mobilePhoneSR
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Master.AddBreadcrumbLink("/default.aspx", "Home");
                Master.AddCurrentPage("Login");

                HttpCookie firstName = Request.Cookies["FirstName"];
                HttpCookie lastName = Request.Cookies["LastName"];
                txtFirstName.Text = firstName?.Value;
                txtLastName.Text = lastName?.Value;
            }
        }

        protected void btnContinue_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                DateTime expiry = DateTime.Now.AddMinutes(5);
                SetCookie("FirstName", txtFirstName.Text, expiry);
                SetCookie("LastName", txtLastName.Text, expiry);
            }
            Response.Redirect("~/CheckOut.aspx");
        }

        private void SetCookie(string name, string value, DateTime expiry)
        {
            HttpCookie cookie = new HttpCookie(name, value);
            cookie.Expires = expiry;
            Response.Cookies.Add(cookie);
        }
    }
}