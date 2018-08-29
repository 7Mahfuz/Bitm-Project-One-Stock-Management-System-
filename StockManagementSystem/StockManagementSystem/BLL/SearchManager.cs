using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;
using StockManagementSystem.DAL;

namespace StockManagementSystem.BLL
{
    public class SearchManager
    {
        ItemGateway aItemGateway = new ItemGateway();
        SellGateway aSellGateway = new SellGateway();

        public List<SearchItemVM> SearchItem(int companyId,int categoryId)
        {
            List<SearchItemVM> allItems = new List<SearchItemVM>();
            if (companyId > 0 && categoryId == 0)
            {
                allItems = aItemGateway.SearchItemByComapanyId(companyId);
            }
            else if (companyId == 0 && categoryId > 0)
            {
                allItems = aItemGateway.SearchItemByCategoryId(categoryId);
            }
            else if (companyId > 0 && categoryId > 0)
            {
                allItems = aItemGateway.SearchItemByBothId(companyId, categoryId);
            }
            return allItems;
        }

       

        public List<SearchByDateVM> GetAllSellHistoryByDates(DateTime from,DateTime to)
        {
            List<SearchByDateVM> allsearchByDateVMs = new List<SearchByDateVM>();
            allsearchByDateVMs = aSellGateway.SerachByDates(from, to);

            return allsearchByDateVMs;
        }
    }
}