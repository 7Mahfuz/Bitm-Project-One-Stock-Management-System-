using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using StockManagementSystem.BLL;
using StockManagementSystem.Models.EntityModels;
using StockManagementSystem.Models.ViewModels;

namespace StockManagementSystem.UI
{
    public partial class StockOutUI : System.Web.UI.Page
    {
        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();
        StockManager aStockManager = new StockManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
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

        List<StockOutChartVM> aStockChartList = new List<StockOutChartVM>();
        List<int> listOfItemIds = new List<int>();
        Dictionary<int, int> trackOfItemId = new Dictionary<int, int>();

        protected void addButton_Click(object sender, EventArgs e)
        {
            StockOutChartVM aStockChart = new StockOutChartVM();
            aStockChart = aStockManager.AddToChart(Convert.ToInt32(itemDropDownList.SelectedValue));
            
            aStockChart.Quantity = Convert.ToInt32(stockTextBox.Text);
            if(Convert.ToInt32(trackOfItemId[Convert.ToInt32(itemDropDownList.SelectedValue)])!=1)
            {
                listOfItemIds.Add(Convert.ToInt32(itemDropDownList.SelectedValue));
                trackOfItemId[(Convert.ToInt32(itemDropDownList.SelectedValue))]=1;
            }

            
            if((List<StockOutChartVM>)ViewState["chart"]==null)
            {
                aStockChartList.Add(aStockChart);
                ViewState["chart"] = aStockChartList;
            }
            else
            {
                aStockChartList = (List<StockOutChartVM>)ViewState["chart"];
                aStockChartList.Add(aStockChart);
                ViewState["chart"] = aStockChartList;
            }

            stockOutGridView.DataSource = aStockChartList;
            stockOutGridView.DataBind();

        }

        protected void sellButton_Click(object sender, EventArgs e)
        {

        }
    }
}