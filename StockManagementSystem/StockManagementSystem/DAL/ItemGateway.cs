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
            Query = "insert into Item_tbl values(@Name,@ReOrder,@CategoryId,@CompanyId)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("Name",aItem.Name);
            Command.Parameters.AddWithValue("ReOrder",aItem.ReorderLevel);
            Command.Parameters.AddWithValue("CategoryId",aItem.CategoryId);
            Command.Parameters.AddWithValue("CompanyId",aItem.CompanyId);

            RowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return RowCount;
        }

        public bool IsExist(Item aItem)
        {
            Connection.Open();

            Query="select * from Item_tbl where CategoryId=@CategoryId and CompanyId=@CompanyId and Name=@Name ";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("Name", aItem.Name);
            Command.Parameters.AddWithValue("CategoryId", aItem.CategoryId);
            Command.Parameters.AddWithValue("CompanyId", aItem.CompanyId);

            Reader = Command.ExecuteReader();

            bool flag = Reader.HasRows;
            Connection.Close();
            Reader.Close();
            return flag;

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