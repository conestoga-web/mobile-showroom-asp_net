using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mobilePhoneSR
{
    public partial class Products : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/default.aspx", "Home");

            string header = "Our Products";
            string catID = Request.QueryString["catID"];

            // assign data source based on whether there's a catID query string value
            if (string.IsNullOrEmpty(catID))
            {
                Repeater1.DataSourceID = "SqlDataSourceAll";
                Master.AddCurrentPage("Products");
            }
            else
            {
                Repeater1.DataSourceID = "SqlDataSourceByCategory";
                Master.AddBreadcrumbLink("/Products.aspx", "Products");

                // amend header string to include category 
                switch (catID)
                {
                    case "1":
                        header += " - Apple";
                        Master.AddCurrentPage("Apple");
                        break;
                    case "2":
                        header += " - Samsung";
                        Master.AddCurrentPage("Samsung");
                        break;
                    case "3":
                        header += " - LG";
                        Master.AddCurrentPage("LG");
                        break;
                    case "4":
                        header += " - Blackberry";
                        Master.AddCurrentPage("Blackberry");
                        break;
                    case "5":
                        header += " - Google";
                        Master.AddCurrentPage("Google");
                        break;
                }
            }

            // set page header text 
            Master.HeaderText = header;
        }
    }
}