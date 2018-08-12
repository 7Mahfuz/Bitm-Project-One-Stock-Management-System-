using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;
using StockManagementSystem.DAL;

namespace StockManagementSystem.BLL
{
    public class SellManager
    {
        StockManager aStockManager = new StockManager();

        public void Sell(List<StockOutChartVM> chartList, List<int>listOfitemId)
        {
           
        }

        public bool IsItOk(List<StockOutChartVM> chartList, List<int> listOfitemId)
        {
            bool flag = true;
            foreach (int itemId in listOfitemId)
            {
                Stock aStock = new Stock();
                aStock = aStockManager.GetAStockByItemId(itemId);
                int sumOfQuantity = 0;
                foreach (var aChart in chartList)
                {
                    if (aChart.ItemId == itemId)
                    {
                        sumOfQuantity += aChart.Quantity;
                    }
                }

                if (sumOfQuantity > aStock.Quantity)
                {
                    flag = false; break;
                }
            }

            if (flag)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}