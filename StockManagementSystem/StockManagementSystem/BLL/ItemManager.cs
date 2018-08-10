using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystem.DAL;

namespace StockManagementSystem.BLL
{
    public class ItemManager
    {
        ItemGateway aItemGateway = new ItemGateway();
        public string Save (Item aItem)
        {
            if(IsExist(aItem))
            {
                return "Exist";
            }
              int rows = aItemGateway.Save(aItem);

            if(rows>0)
            {
                return "Saved";
            }
            return "Failed";
        }

       public bool IsExist(Item aItem)
        {
            if(aItemGateway.IsExist(aItem))
            {
                return true;
            }
            return false;
        }

        public void GetAllItemByCompanyId(int companyId)
        {

        }

        public void GetAItemById(int itemId)
        {

        }

    }
}