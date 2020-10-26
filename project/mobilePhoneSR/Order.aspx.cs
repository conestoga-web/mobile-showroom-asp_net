using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Microsoft.AspNet.FriendlyUrls;
using System.Web.Caching;

namespace mobilePhoneSR
{
    public partial class Order : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // set breadcrumb on first load;    
            if (!IsPostBack)
            {
                Master.AddBreadcrumbLink("/default.aspx", "Home");
                Master.AddCurrentPage("Shopping");

                Application.Lock();
                int hitCount = Convert.ToInt32(Application["HitCount"]);
                hitCount++;
                Application["HitCount"] = hitCount.ToString();
                Application.UnLock();

                lblPageHits.Text = hitCount.ToString();
            }

            // get firstname cookie and set welcome message if it exists
            HttpCookie firstName = Request.Cookies["FirstName"];
            if (firstName != null)
                lblWelcome.Text = "<h4>welcome back, " + firstName.Value + "!</h4>";

            // get timestamp from cache, then display it
            // or set timestamp in cache to now plus 10, then display
            object cacheTimestamp = Cache.Get("Timestamp");
            if (cacheTimestamp == null)
            {
                cacheTimestamp = DateTime.Now;
                Cache.Insert("Timestamp", cacheTimestamp, null,
                    DateTime.Now.AddMinutes(10), Cache.NoSlidingExpiration);
            }
            lblCacheTimestamp.Text = cacheTimestamp.ToString();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                Product selectedProduct = GetSelectedProduct();
                CartItemList cart = CartItemList.GetCart();
                CartItem cartItem = cart[selectedProduct.ProductID];

                if (cartItem == null)
                {
                    cart.AddItem(selectedProduct,
                                 Convert.ToInt32(txtQuantity.Text));
                }
                else
                {
                    cartItem.AddQuantity(Convert.ToInt32(txtQuantity.Text));
                }
                Response.Redirect("Cart.aspx");
            }
        }

        private Product GetSelectedProduct()
        {
            // get row from SqlDataSource based on value in dropdownlist
            DataView productsTable = (DataView)
                SqlDataSource2.Select(DataSourceSelectArguments.Empty);
            DataRowView row = productsTable[0];

            // create a new product object and load with data from row
            Product p = new Product();
            p.ProductID = row["ProductID"].ToString();
            p.Name = row["Name"].ToString();
            p.Description = row["Description"].ToString();
            p.Specification = row["Specification"].ToString();
            p.Colour = row["Colour"].ToString();
            p.Warranty = row["Warranty"].ToString();
            p.UnitPrice = (decimal)row["UnitPrice"];
            p.ImageFile = row["ImageFile"].ToString();
            return p;
        }
    }
}