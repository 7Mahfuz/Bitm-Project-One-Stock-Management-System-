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
    public partial class StockInUI : System.Web.UI.Page
    {
        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();
        StockManager aStockManager = new StockManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                List<Company> allCompanies = new List<Company>();
                allCompanies = aCompanyManager.GetAll();
                companyDropDownList.DataValueField = "Id";
                companyDropDownList.DataTextField = "Name";
                companyDropDownList.DataSource = allCompanies;
                companyDropDownList.DataBind();


                List<Item> allItems = new List<Item>();
                allItems = aItemManager.GetAllItemByCompanyId(Convert.ToInt32(companyDropDownList.SelectedValue));
                itemDropDownList.DataValueField = "Id";
                itemDropDownList.DataTextField = "Name";
                itemDropDownList.DataSource = allItems;
                itemDropDownList.DataBind();
            }
        }

        protected void companyDropDownList_TextChanged(object sender, EventArgs e)
        {
            List<Item> allItems = new List<Item>();
            allItems = aItemManager.GetAllItemByCompanyId(Convert.ToInt32(companyDropDownList.SelectedValue));
            itemDropDownList.DataValueField = "Id";
            itemDropDownList.DataTextField = "Name";
            itemDropDownList.DataSource = allItems;
            itemDropDownList.DataBind();
        }

        protected void itemDropDownList_TextChanged(object sender, EventArgs e)
        {
            reorderTextBox.Text = aItemManager.GetReorderByItemId(Convert.ToInt32(itemDropDownList.SelectedValue)).ToString();
            Stock aStock = new Stock();
            aStock = aStockManager.GetAStockByItemId(Convert.ToInt32(itemDropDownList.SelectedValue));
            availableTextBox.Text = aStock.Quantity.ToString();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
            Stock aStock = new Stock();
            aStock.Quantity = Convert.ToInt32(stockTextBox.Text);
            aStock.ItemId = Convert.ToInt32(itemDropDownList.SelectedValue);
            aStock.CompanyId = Convert.ToInt32(companyDropDownList.SelectedValue);

            msgLabel.Text = aStockManager.Save(aStock);
        }
    }
}