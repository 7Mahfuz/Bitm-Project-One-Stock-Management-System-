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
    public partial class ViewSalesUI : System.Web.UI.Page
    {
        SearchManager aSearchManager = new SearchManager();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void searchButton_Click(object sender, EventArgs e)
        {
            DateTime from = DateTime.Parse(fromTextBox.Text);
            DateTime to = DateTime.Parse(toTextBox.Text);

            List<SearchByDateVM> aSearchByDateVMs = new List<SearchByDateVM>();
            aSearchByDateVMs = aSearchManager.GetAllSellHistoryByDates(from, to);
            searchSellGridView.DataSource = aSearchByDateVMs;
            searchSellGridView.DataBind();
        }
    }
}