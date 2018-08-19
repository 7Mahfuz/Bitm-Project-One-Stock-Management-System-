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
                return " This Item is Already Exist";
            }
              int rows = aItemGateway.Save(aItem);

            if(rows>0)
            {
                return " Item Saved Succesfully";
            }
            return "Failed to Save the Item";
        }

       public bool IsExist(Item aItem)
        {
            if(aItemGateway.IsExist(aItem))
            {
                return true;
            }
            return false;
        }

        public List<Item> GetAllItemByCompanyId(int companyId)
        {
            List<Item> allItem = new List<Item>();
            allItem = aItemGateway.GetAllItemByCompanyId(companyId);
            return allItem;
        }

        public int GetReorderByItemId(int itemId)
        {
            return aItemGateway.GetReorderByItemId(itemId);
        }

    }
}