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
    public partial class StockOutUI : System.Web.UI.Page
    {
        CompanyManager aCompanyManager = new CompanyManager();
        ItemManager aItemManager = new ItemManager();
        StockManager aStockManager = new StockManager();
        SellManager aSellManager = new SellManager();

        List<StockOutChartVM> aStockChartList = new List<StockOutChartVM>();

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
                companyDropDownList.Items.Insert(0, new ListItem("-- Select Company --", "0"));

                GridViewInitialize();

            }
            else
            {
                if (ViewState["chart"] == null)
                {
                    GridViewInitialize();
                }
                else { 
                stockOutGridView.DataSource = (List<StockOutChartVM>)ViewState["chart"];
                stockOutGridView.DataBind();
            }
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
            itemDropDownList.Items.Insert(0, new ListItem("-- Select Item --", "0"));

            reorderTextBox.Text = "";
            availableTextBox.Text = "";
            stockTextBox.Text = "";

                    }

        protected void itemDropDownList_TextChanged(object sender, EventArgs e)
        {
            reorderTextBox.Text = aItemManager.GetReorderByItemId(Convert.ToInt32(itemDropDownList.SelectedValue)).ToString();
            Stock aStock = new Stock();
            aStock = aStockManager.GetAStockByItemId(Convert.ToInt32(itemDropDownList.SelectedValue));
            availableTextBox.Text = aStock.Quantity.ToString();
        }                      

        protected void addButton_Click(object sender, EventArgs e)
        {
            bool chartflag = false;
            int itemId = Convert.ToInt32(itemDropDownList.SelectedValue);
            List<StockOutChartVM> aTempStockChartList = new List<StockOutChartVM>();
            StockOutChartVM aStockChart = new StockOutChartVM();

            try
            {
                aStockChart.Quantity = Convert.ToInt32(stockTextBox.Text);
            }
            catch
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Please Insert a valid Stock Quantity value')", true);
                return;
            }

            aStockChart = aStockManager.GetChartThingsByItemId(itemId);          

            aStockChart.Quantity = Convert.ToInt32(stockTextBox.Text);       
           
            if ((List<StockOutChartVM>)ViewState["chart"]==null)
            {
                aTempStockChartList.Add(aStockChart);
                if (!aStockManager.IsItOkAdd(aTempStockChartList, itemId))
                {                    
                    chartflag = true;
                }
                else
                {
                    aStockChartList.Add(aStockChart);
                    ViewState["chart"] = aStockChartList;
                    ClearAllControls();
                }
            }
            else
            {
                aTempStockChartList = (List<StockOutChartVM>)ViewState["chart"];
               
                aTempStockChartList.Add(aStockChart);
                if (!aStockManager.IsItOkAdd(aTempStockChartList, itemId))
                {                  
                    aTempStockChartList.RemoveAt(aTempStockChartList.Count - 1);
                    aStockChartList = aTempStockChartList;
                    chartflag = true;
                }
                else
                {
                    aStockChartList = aTempStockChartList;
                    ViewState["chart"] = aStockChartList;
                    ClearAllControls();
                }
            }

            if(chartflag)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Can not be added in chart due to quantity limit')", true);
            }

            stockOutGridView.DataSource = aStockChartList;
            stockOutGridView.DataBind();
            
        }

        protected void sellButton_Click(object sender, EventArgs e)
        {
            aStockChartList= (List<StockOutChartVM>)ViewState["chart"];
            aSellManager.Sell(aStockChartList,1);
            ViewState["chart"] = null;
            ClearAllControls();
            GridViewInitialize();

            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Sold Succsefully')", true);
        }

        protected void damageButton_Click(object sender, EventArgs e)
        {
            aStockChartList = (List<StockOutChartVM>)ViewState["chart"];
            aSellManager.Sell(aStockChartList, 2);
            ViewState["chart"] = null;
            ClearAllControls();
            GridViewInitialize();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Items added on Damage list')", true);
        }

        protected void lostButton_Click(object sender, EventArgs e)
        {
            aStockChartList = (List<StockOutChartVM>)ViewState["chart"];
            aSellManager.Sell(aStockChartList, 2);
             ViewState["chart"] = null;
            ClearAllControls();
            GridViewInitialize();
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Items added on lost list')", true);
        }

        public void GridViewInitialize()
        {
            DataTable dt = new DataTable();
            stockOutGridView.DataSource = dt;
            stockOutGridView.DataBind();
        }

        public void ClearAllControls()
        {
            companyDropDownList.SelectedValue = "0";
            itemDropDownList.SelectedValue = "0";
            reorderTextBox.Text = "";
            availableTextBox.Text = "";
            stockTextBox.Text = "";
        }
    }
}