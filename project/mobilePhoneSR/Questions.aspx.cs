using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mobilePhoneSR
{
    public partial class Questions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Master.AddBreadcrumbLink("/default.aspx", "Home");
            Master.AddCurrentPage("Support / Q & A");
        }

        protected void grdQuestions_PreRender(object sender, EventArgs e)
        {
            grdQuestions.HeaderRow.TableSection = TableRowSection.TableHeader;
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                var parameters = SqlDataSource1.InsertParameters;
                parameters["CustomerID"].DefaultValue = txtID.Text;
                parameters["FirstName"].DefaultValue = txtFirstName.Text;
                parameters["LastName"].DefaultValue = txtLastName.Text;
                //parameters["CategoryName"].DefaultValue = txtCategoryName.Text;
                parameters["Questions"].DefaultValue = txtQuestion.Text;
                parameters["Email"].DefaultValue = txtEmail.Text;
                parameters["PhoneNumber"].DefaultValue = txtPhoneNumber.Text;
                parameters["DueDate"].DefaultValue = txtDueDate.Text;

                try
                {
                    SqlDataSource1.Insert();
                    txtID.Text = "";
                    txtFirstName.Text = "";
                    txtLastName.Text = "";
                    //txtCategoryName.Text = "";
                    txtQuestion.Text = "";
                    txtEmail.Text = "";
                    txtPhoneNumber.Text = "";
                    txtDueDate.Text = "";
                }
                catch (Exception ex)
                {
                    lblError.Text = DatabaseErrorMessage(ex.Message);
                }
            }
        }

        protected void grdQuestions_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
                e.KeepInEditMode = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }

        protected void grdQuestions_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            if (e.Exception != null)
            {
                lblError.Text = DatabaseErrorMessage(e.Exception.Message);
                e.ExceptionHandled = true;
            }
            else if (e.AffectedRows == 0)
            {
                lblError.Text = ConcurrencyErrorMessage();
            }
        }

        private string DatabaseErrorMessage(string errorMsg)
        {
            return $"<b>A database error has occurred:</b> {errorMsg}";
        }
        private string ConcurrencyErrorMessage()
        {
            return "Another user may have updated that category. Please try again";
        }
    }
}