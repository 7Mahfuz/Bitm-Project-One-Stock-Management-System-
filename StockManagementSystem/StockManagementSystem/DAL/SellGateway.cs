using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;

namespace StockManagementSystem.DAL
{
    public class SellGateway : SQLGateway
    {
        public void Save( SellHistory aSellHistory)
        {
            Connection.Open();
            Query = "insert into SellHistory_tbl values('"+aSellHistory.Date+"',"+aSellHistory.Quantity+","+aSellHistory.ItemId+")";
            Command = new SqlCommand(Query, Connection);
            RowCount = Command.ExecuteNonQuery();
                        Connection.Close();
         
        }

        public void SerachByDates(DateTime from,DateTime to)
        {
            Connection.Open();
            Query = "select * from SearchByDate where Date between '" + from + "' and '" + to + "'";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            Connection.Close();
        }
    }
}