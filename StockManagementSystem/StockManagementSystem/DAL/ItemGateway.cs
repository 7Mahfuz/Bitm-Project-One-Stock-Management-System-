using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;

namespace StockManagementSystem.DAL
{
    public class ItemGateway : SQLGateway
    {
        public int Save(Item aItem)
        {
            Connection.Open();
            Query = "insert into Item_tbl values('"+aItem.Name+"',"+aItem.ReorderLevel+","+aItem.CategoryId+","+aItem.CompanyId+")";
            Command = new SqlCommand(Query, Connection);
            RowCount = Command.ExecuteNonQuery();

            Connection.Close();

            return RowCount;
        }

        public bool IsExist(Item aItem)
        {
            Connection.Open();
            Query="select * from Item_tbl where CategoryId="+aItem.CategoryId+" and CompanyId="+aItem.CompanyId+" and Name='"+aItem.Name+"' ";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            if(Reader.HasRows)
            {
                Connection.Close();Reader.Close();
                return true;
            }
            Connection.Close(); Reader.Close();
            return false;

        }

        public List<Item> GetAllItemByCompanyId(int companyId)
        {
            List<Item> allItem = new List<Item>();
            Connection.Open();
            Query = "select * from Item_tbl where CompanyId="+companyId+"";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            while(Reader.Read())
            {
                Item aItem = new Item();
                aItem.Id = (int)Reader["Id"];
                aItem.Name = Reader["Name"].ToString();
                allItem.Add(aItem);
            }
            Reader.Close();
            Connection.Close();
            return allItem;
        }

        public int GetReorderByItemId(int itemId)
        {

            Connection.Open();
            Query = "select Reorderlvl from Item_tbl where Id="+itemId+"";
            Command = new SqlCommand(Query, Connection);
            int reorderlvl = int.Parse(Command.ExecuteScalar().ToString());
             Connection.Close();
            return reorderlvl;
        }

        public List<SearchItemVM> SearchItemByComapanyId(int companyId)
        {
            List<SearchItemVM> allItems = new List<SearchItemVM>();
            Connection.Open();
            Query = "select * from SearchItem where CompanyId=" + companyId + "";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                SearchItemVM searchItemVM= new SearchItemVM();
                searchItemVM.ItemName = Reader["Item"].ToString();
                searchItemVM.Reorderlvl =(int) Reader["Reorderlvl"];
                searchItemVM.CompanyName = Reader["Company"].ToString();
                searchItemVM.Quantity = Reader["Quantity"].ToString();

                allItems.Add(searchItemVM);
            }
            Reader.Close();Connection.Close();
            return allItems;
        }
        public List<SearchItemVM> SearchItemByCategoryId(int categoryId)
        {
            List<SearchItemVM> allItems = new List<SearchItemVM>();
            Connection.Open();
            Query = "select * from SearchItem where CategoryId=" + categoryId + "";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                SearchItemVM searchItemVM = new SearchItemVM();
                searchItemVM.ItemName = Reader["Item"].ToString();
                searchItemVM.Reorderlvl = (int)Reader["Reorderlvl"];
                searchItemVM.CompanyName = Reader["Company"].ToString();
                searchItemVM.Quantity = Reader["Quantity"].ToString();

                allItems.Add(searchItemVM);
            }
            Reader.Close(); Connection.Close();
            return allItems;
        }
        public List<SearchItemVM> SearchItemByBothId(int companyId,int categoryId)
        {
            List<SearchItemVM> allItems = new List<SearchItemVM>();
            Connection.Open();
            Query = "select * from SearchItem where CompanyId=" + companyId + " and CategoryId="+categoryId+"";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                SearchItemVM searchItemVM = new SearchItemVM();
                searchItemVM.ItemName = Reader["Item"].ToString();
                searchItemVM.Reorderlvl = (int)Reader["Reorderlvl"];
                searchItemVM.CompanyName = Reader["Company"].ToString();
                searchItemVM.Quantity = Reader["Quantity"].ToString();

                allItems.Add(searchItemVM);
            }
            Reader.Close(); Connection.Close();
            return allItems;
        }
    }
}