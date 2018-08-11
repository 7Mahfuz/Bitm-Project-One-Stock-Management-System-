using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;

namespace StockManagementSystem.DAL
{
    public class StockGateway : SQLGateway
    {
        public int Save(Stock aStock)
        {
            Connection.Open();
            Query = "insert into Stock_tbl values("+aStock.Quantity+","+aStock.ItemId+","+aStock.CompanyId+")";
            Command = new SqlCommand(Query, Connection);
            RowCount = Command.ExecuteNonQuery();

            Connection.Close();

            return RowCount;
        }

        public int Update(Stock aStock)
        {
            Connection.Open();
            Query = "update Stock_tbl set Quantity="+aStock.Quantity+" where Id="+aStock.Id+"";
            Command = new SqlCommand(Query, Connection);
            RowCount = Command.ExecuteNonQuery();

            Connection.Close();
            return RowCount;
        }

        public Stock GetAStockByItemId(int itemId)
        {
            Connection.Open();
            Query = "select * from Stock_tbl where ItemId=" + itemId + "";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            Stock aStock = new Stock();
           if(Reader.HasRows)
            {
               while(Reader.Read())
                {
                    aStock.Id = (int)Reader["Id"];
                    aStock.Quantity = (int)Reader["Quantity"];
                }
            }
            else
            {
                aStock.Id = 0;
                aStock.Quantity = 0;
            }
            Reader.Close();
            Connection.Close();
            return aStock;
        }


        public StockOutChartVM GetChartThingsByItemId(int itemId)
        {
            Connection.Open();
            StockOutChartVM stockOutChartVM = new StockOutChartVM();
            Query = "select * from StockChart where ID=" + itemId + "";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            while(Reader.Read())
            {
                
                stockOutChartVM.ItemId = (int)Reader["ID"];
                stockOutChartVM.ItemName = Reader["Item"].ToString();
                stockOutChartVM.CompanyName = Reader["Company"].ToString();
                

                
            }
            Reader.Close();
            Connection.Close();
            return stockOutChartVM;
        }
    }
}