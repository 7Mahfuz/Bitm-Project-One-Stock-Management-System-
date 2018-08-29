using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystem.DAL;

namespace StockManagementSystem.BLL
{
    public class StockManager
    {
        StockGateway aStockGateway = new StockGateway();

        public string Save(Stock aStock)
        {
            Stock stock = new Stock();
            stock = aStockGateway.GetAStockByItemId(aStock.ItemId);
            if(stock.Id==0 && stock.Quantity==0)
            {
                int rows=aStockGateway.Save(aStock);
                if (rows > 0)
                {
                    return "Saved Succesfully";
                }
                else return "Failed to Save Stock detail";

            }
            else
            {
                aStock.Quantity += stock.Quantity;
                aStock.Id = stock.Id;
                int rows = aStockGateway.Update(aStock);

                if (rows > 0)
                {
                    return "Updated the Stock detail";
                }
                else return "Failed to update stock detail";
            }

        }

        public Stock GetAStockByItemId(int itemId)
        {
            Stock aStock = new Stock();
            aStock = aStockGateway.GetAStockByItemId(itemId);
            return aStock;
        }

        public StockOutChartVM GetChartThingsByItemId(int itemId)
        {
           StockOutChartVM newChart = new StockOutChartVM();
            newChart = aStockGateway.GetChartThingsByItemId(itemId);
            return newChart;
        }

        public bool IsItOkAdd(List<StockOutChartVM> chartList, int itemId)
        {
                Stock aStock = new Stock();
                aStock = GetAStockByItemId(itemId);
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
                   return false;
                }
            return true;
            
        }

        

    }
}