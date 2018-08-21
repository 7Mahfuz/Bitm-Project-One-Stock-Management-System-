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
    public partial class ItemUI : System.Web.UI.Page
    {
        CategoryManager aCategoryManager = new CategoryManager();
        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                List<Category> allCategories = new List<Category>();
                allCategories = aCategoryManager.GetAll();

                List<Company> allCompanies = new List<Company>();
                allCompanies = aCompanyManager.GetAll();
                
                categoryDropDownList.DataValueField = "Id";
                categoryDropDownList.DataTextField = "Name";
                categoryDropDownList.DataSource = allCategories;
                 categoryDropDownList.DataBind();
                categoryDropDownList.Items.Insert(0, new ListItem("-- Select Category --", "0"));

                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataSource = allCompanies;
                companyDropDownList.DataBind();
                companyDropDownList.Items.Insert(0, new ListItem("-- Select Company --", "0"));

                reorderTextBox.Text = "0";
            }

        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            string msg = "";
            Item aItem = new Item();
            aItem.Name = itemTextBox.Text;
            
            aItem.CategoryId = int.Parse(categoryDropDownList.SelectedValue);
            aItem.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);

            try {
                aItem.ReorderLevel = int.Parse(reorderTextBox.Text);

                if (aItem.CategoryId > 0 && aItem.CompanyId > 0 && itemTextBox.Text != "")
                {
                    msg = aItemManager.Save(aItem);
                    ClearAll();
                }
                else
                {
                    msg = "Please Fill all boxes with valid property";
                }
            }
            catch {
                msg = "Re-Order Box must be a number value";
            }    

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('" + msg + "')", true);
        }

        public void ClearAll()
        {

            itemTextBox.Text = "";
            reorderTextBox.Text = "0";
            categoryDropDownList.SelectedValue = "0";
            companyDropDownList.SelectedValue = "0";
        }
    }
}