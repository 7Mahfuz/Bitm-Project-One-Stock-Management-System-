using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models.EntityModels;
using StockManagementSystem.Models.ViewModels;

namespace StockManagementSystem.UI
{
    public partial class SearchItemUI : System.Web.UI.Page
    {

        CompanyManager aCompanyManager = new CompanyManager();
        CategoryManager aCategoryManager = new CategoryManager();
        SearchManager aSearchManager = new SearchManager();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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
                
            }

            DataTable dt = new DataTable();
            showItemsGridView.DataSource = dt;
            showItemsGridView.DataBind();
        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            int companyId = Convert.ToInt32(companyDropDownList.SelectedValue);
            int categoryId = Convert.ToInt32(categoryDropDownList.SelectedValue);

            List<SearchItemVM> allItems = new List<SearchItemVM>();
            if(companyId>0 && categoryId==0)
            {
                allItems = aSearchManager.SearchItem(companyId, categoryId);
            }
            else if(companyId==0 && categoryId>0)
            {
                allItems = aSearchManager.SearchItem(companyId, categoryId);
            }
            else if(companyId>0 && categoryId>0)
            {
                allItems = aSearchManager.SearchItem(companyId, categoryId);
            }
            showItemsGridView.DataSource = allItems;
            showItemsGridView.DataBind();

        }
    }
}