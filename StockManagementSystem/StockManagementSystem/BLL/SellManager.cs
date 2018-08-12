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
        SellGateway aSellGateway = new SellGateway();
        StockGateway aStockGateway = new StockGateway();

        public void Sell(List<StockOutChartVM> chartList,int whatToDo)
        {
            Dictionary<int, int> itemIdMap = new Dictionary<int, int>();

            foreach(StockOutChartVM astock in chartList)
            {
                int itemId = astock.ItemId;
                int quantity = 0;
                int res;
                if(!itemIdMap.TryGetValue(astock.ItemId, out res))
                {
                    itemIdMap.Add(astock.ItemId, 1);

                    foreach (StockOutChartVM aInnerstock in chartList)
                    {
                        if (aInnerstock.ItemId == itemId)
                        {
                            quantity += aInnerstock.Quantity;

                        }

                    }

                    Stock baseStock = new Stock();
                    baseStock = aStockGateway.GetAStockByItemId(itemId);
                    baseStock.Quantity -= quantity;
                    int row = aStockGateway.Update(baseStock);

                    if (row > 0 && whatToDo==1)
                    {
                        SellHistory aSellHistory = new SellHistory();
                        aSellHistory.Date = DateTime.Today;
                        aSellHistory.Quantity = baseStock.Quantity;
                        aSellHistory.ItemId = itemId;
                        aSellGateway.Save(aSellHistory);
                    }
                }

                
            }
        }

        
    }
}