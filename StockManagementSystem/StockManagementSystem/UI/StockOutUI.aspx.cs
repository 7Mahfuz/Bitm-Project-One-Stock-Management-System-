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
        SellManager aSellManager = new SellManager();

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
       

        protected void addButton_Click(object sender, EventArgs e)
        {
            StockOutChartVM aStockChart = new StockOutChartVM();
            aStockChart = aStockManager.AddToChart(Convert.ToInt32(itemDropDownList.SelectedValue));
            
            aStockChart.Quantity = Convert.ToInt32(stockTextBox.Text);

            List<StockOutChartVM> aTempStockChartList = new List<StockOutChartVM>();

            if ((List<StockOutChartVM>)ViewState["chart"]==null)
            {
                aTempStockChartList.Add(aStockChart);
                if (!aStockManager.IsItOkAdd(aTempStockChartList, Convert.ToInt32(itemDropDownList.SelectedValue)))
                {
                    msgLabel.Text = "Cann't add";
                }
                else
                {
                    aStockChartList.Add(aStockChart);
                    ViewState["chart"] = aStockChartList;
                    msgLabel.Text = "";
                }
            }
            else
            {
                aTempStockChartList = (List<StockOutChartVM>)ViewState["chart"];
               
                aTempStockChartList.Add(aStockChart);
                if (!aStockManager.IsItOkAdd(aTempStockChartList, Convert.ToInt32(itemDropDownList.SelectedValue)))
                {
                    msgLabel.Text = "Cann't add";
                    aTempStockChartList.RemoveAt(aTempStockChartList.Count - 1);
                    aStockChartList = aTempStockChartList;
                }
                else
                {
                    aStockChartList = aTempStockChartList;
                    ViewState["chart"] = aStockChartList;


                }
            }

            stockOutGridView.DataSource = aStockChartList;
            stockOutGridView.DataBind();

        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            aStockChartList= (List<StockOutChartVM>)ViewState["chart"];
            aSellManager.Sell(aStockChartList,1);
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            aStockChartList = (List<StockOutChartVM>)ViewState["chart"];
            aSellManager.Sell(aStockChartList, 2);
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            aStockChartList = (List<StockOutChartVM>)ViewState["chart"];
            aSellManager.Sell(aStockChartList, 2);
        }
    }
}