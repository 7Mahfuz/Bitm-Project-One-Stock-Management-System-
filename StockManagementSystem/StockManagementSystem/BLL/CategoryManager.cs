using StockManagementSystem.DAL;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystem.BLL
{
    public class CategoryManager
    {
        CategoryGateway aCategoryGateway = new CategoryGateway();

        public string Save(Category aCategory)
        {
            if(aCategory.Name=="")
            {
                return "Category Name can not be Empty";
            }

            if(aCategoryGateway.IsExist(aCategory.Name))
            {
                return "Category Name Exist";
            }

            int rows=aCategoryGateway.Save(aCategory);
            if(rows>0)
            {
                return "Saved Susscesfully";
            }



            return "Failed";
        }

        public List<Category> GetAll()
        {
            List<Category> allCategory = new List<Category>();
            allCategory=aCategoryGateway.GetAll();
            return allCategory;
        }

      public bool IsExist(string category)
        {
            if(aCategoryGateway.IsExist(category))
            {
                return true;
            }
            return false;
        }

    }
}