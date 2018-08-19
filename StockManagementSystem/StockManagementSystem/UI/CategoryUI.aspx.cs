using StockManagementSystem.BLL;
using StockManagementSystem.Models.EntityModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StockManagementSystem.UI
{
    public partial class CategoryUI : System.Web.UI.Page
    {
        CategoryManager aCategoryManager = new CategoryManager();

        protected void Page_Load(object sender, EventArgs e)
        {
            List<Category> allCategory = new List<Category>();
            allCategory=aCategoryManager.GetAll();

            categoryGridView.DataSource = allCategory;
            categoryGridView.DataBind();
        }

        protected void saveButton_Click(object sender, EventArgs e)
        {
             Category aCategory = new Category();
            aCategory.Name = categoryTextBox.Text;
            string msg = aCategoryManager.Save(aCategory);
            categoryTextBox.Text = "";
            this.Page_Load(null,null);
            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('"+msg+"')", true);
        }
    }
}