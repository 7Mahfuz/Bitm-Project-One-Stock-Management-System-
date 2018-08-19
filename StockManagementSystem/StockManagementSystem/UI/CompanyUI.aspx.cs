using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models.EntityModels;

namespace StockManagementSystem.UI
{
    public partial class CompanyUI : System.Web.UI.Page
    {

        CompanyManager aCompanyManager = new CompanyManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<Company> allComapny = new List<Company>();
            allComapny =aCompanyManager.GetAll();

            companyGridView.DataSource = allComapny;
            companyGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Company aCompany = new Company();
           aCompany.Name = companyNameTextBox.Text;
            string msg = aCompanyManager.Save(aCompany);
            companyNameTextBox.Text = "";
            this.Page_Load(null, null);
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + msg + "')", true);
        }
    }
}