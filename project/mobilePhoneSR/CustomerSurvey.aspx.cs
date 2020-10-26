using mobilePhoneSR.Models;
using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace mobilePhoneSR
{
    public partial class CustomerSurvey : System.Web.UI.Page
    {
        private IncidentList list;
        private Survey survey;

        protected void Page_Load(object sender, EventArgs e)
        {
            list = IncidentList.GetList();
            Page.SetFocus(txtCustomerID);
            if (!IsPostBack)
            {
                Master.AddBreadcrumbLink("/default.aspx", "Home");
                Master.AddCurrentPage("Support / Survey");

                lstIncident.DataBind();

                lstIncident.Enabled = !lstIncident.Enabled;
                rblResponseTime.Enabled = !rblResponseTime.Enabled;
                rblTechEfficiency.Enabled = !rblTechEfficiency.Enabled;
                rblProbResolution.Enabled = !rblProbResolution.Enabled;
                txtComments.Enabled = !txtComments.Enabled;
                chkAskContact.Enabled = !chkAskContact.Enabled;
                rdoEmail.Enabled = !rdoEmail.Enabled;
                rdoPhone.Enabled = !rdoPhone.Enabled;
                btnSubmit.Enabled = !btnSubmit.Enabled;

                lstIncident.Items.Clear();

                Page.SetFocus(txtCustomerID);
            }
        }

        protected void BtnGetIncidents_Click(object sender, EventArgs e)
        {
            if (IsValid)
            {
                IncidentList icdList = IncidentList.GetList();
                Incident icd = icdList[txtCustomerID.Text];

                if (icd == null)
                {
                    this.GetIncidentData();
                }
                this.DisplayList();
            }

        }

        private void DisplayList()
        {
            lstIncident.Items.Clear();
            Incident item;
            for (int i = 0; i < list.Count; i++)
            {
                item = list[i];
                ListItem li = new ListItem();
                li.Text = item.CustomerIncidentDisplay();
                li.Value = item.IncidentID;
                lstIncident.Items.Add(li);
            }
        }

        private void GetIncidentData()
        {
            DataView incidentTable = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            incidentTable.RowFilter = "CustomerID = '" + txtCustomerID.Text + "' AND DateClosed is not null";

            if (0 != incidentTable.Count)
            {
                lstIncident.Enabled = !lstIncident.Enabled;
                rblResponseTime.Enabled = !rblResponseTime.Enabled;
                rblTechEfficiency.Enabled = !rblTechEfficiency.Enabled;
                rblProbResolution.Enabled = !rblProbResolution.Enabled;
                txtComments.Enabled = !txtComments.Enabled;
                chkAskContact.Enabled = !chkAskContact.Enabled;
                rdoEmail.Enabled = !rdoEmail.Enabled;
                rdoPhone.Enabled = !rdoPhone.Enabled;
                btnSubmit.Enabled = !btnSubmit.Enabled;

                Incident icd = new Incident();
                Page.SetFocus(lstIncident);

                for (int i = 0; i < incidentTable.Count; i++)
                {
                    DataRowView row = incidentTable[i];

                    icd.IncidentID = row["IncidentID"].ToString();
                    icd.CustomerID = row["CustomerID"].ToString();
                    icd.ProductCode = row["ProductCode"].ToString();
                    icd.TechID = row["TechID"].ToString();
                    icd.DateOpened = row["DateOpened"].ToString();
                    icd.DateClosed = row["DateClosed"].ToString();
                    icd.Title = row["Title"].ToString();

                    list.AddIncident(icd);
                }
            }
            else
            {
                lblIdCheck.Text = "There are no closed incidents with your ID.";
            }
        }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                GetSurveyData();
                Response.Redirect("~/SurveyComplete.aspx");
            }
        }

        protected void ChkAskContact_CheckedChanged(object sender, EventArgs e)
        {
            Session["Contact"] = chkAskContact.Checked;
        }

        private void GetSurveyData()
        {
            if (survey == null) survey = new Survey();

            if ("" != txtCustomerID.Text) survey.CustomerID = Convert.ToInt32(txtCustomerID.Text);
            if ("" != lstIncident.SelectedValue) survey.IncidentID = Convert.ToInt32(lstIncident.SelectedValue);
            if ("" != rblResponseTime.SelectedValue) survey.ResponseTime = Convert.ToInt32(rblResponseTime.SelectedValue);
            if ("" != rblTechEfficiency.SelectedValue) survey.TechEfficiency = Convert.ToInt32(rblTechEfficiency.SelectedValue);
            if ("" != rblProbResolution.SelectedValue) survey.Resolution = Convert.ToInt32(rblProbResolution.SelectedValue);
            survey.Comments = txtComments.Text;
            survey.Contact = chkAskContact.Checked;
            if (rdoEmail.Checked) survey.ContactBy = "Contact by email";
            if (rdoPhone.Checked) survey.ContactBy = "Contact by phone";
            Session["Survey"] = survey;
        }

        private void LoadSurveyData()
        {
            if (survey != null)
            {
                txtCustomerID.Text = Convert.ToString(survey.CustomerID);
                lstIncident.SelectedValue = Convert.ToString(survey.IncidentID);
                rblResponseTime.SelectedValue = Convert.ToString(survey.ResponseTime);
                rblTechEfficiency.SelectedValue = Convert.ToString(survey.TechEfficiency);
                rblProbResolution.SelectedValue = Convert.ToString(survey.Resolution);
                txtComments.Text = survey.Comments;
                chkAskContact.Checked = survey.Contact;
                if ("Contact by email" == survey.ContactBy) rdoEmail.Checked = true; rdoPhone.Checked = false;
                if ("Contact by phone" == survey.ContactBy) rdoPhone.Checked = true; rdoEmail.Checked = false;

            }
        }

        private void ReloadPage()
        {
            var id = lstIncident.SelectedValue;
            Response.Redirect("~/CustomerSurvey.aspx");
        }
    }
}