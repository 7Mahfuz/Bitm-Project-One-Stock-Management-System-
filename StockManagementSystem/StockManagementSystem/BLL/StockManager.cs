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
                    return "Saved";
                }
                else return "Failed";

            }
            else
            {
                aStock.Quantity += stock.Quantity;
                aStock.Id = stock.Id;
                int rows = aStockGateway.Update(aStock);

                if (rows > 0)
                {
                    return "Updated";
                }
                else return "Update failed";
            }

        }

        public Stock GetAStockByItemId(int itemId)
        {
            Stock aStock = new Stock();
            aStock = aStockGateway.GetAStockByItemId(itemId);
            return aStock;
        }

        public void AddToChart()
        {

        }

        public void DamageOrLost()
        {

        }

    }
}