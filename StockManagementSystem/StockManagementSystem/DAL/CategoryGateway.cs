using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;

namespace StockManagementSystem.DAL
{
    public class CategoryGateway : SQLGateway
    {
        public int Save(Category aCategory)
        {
            Connection.Open();
            Query = "insert into Category_tbl values('"+aCategory.Name+"')";
            Command = new SqlCommand(Query, Connection);
            RowCount = Command.ExecuteNonQuery();

            Connection.Close();

            return RowCount;
        }

        public List<Category> GetAll()
        {
            Connection.Open();

            List<Category> allCategory = new List<Category>();
            Query = "select * from Category_tbl";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            while(Reader.Read())
            {
                Category aCategory = new Category();
                aCategory.Id = (int)Reader["Id"];
                aCategory.Name = Reader["Name"].ToString();
                allCategory.Add(aCategory);
            }
            Reader.Close();
            Connection.Close();

            return allCategory;
        }

        public bool IsExist(string category)
        {
            Connection.Open();
            Query = "select * from Category_tbl where Name='" + category + "'";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            if(Reader.HasRows)
            {
                Connection.Close();
                Reader.Close();
                return true;
            }
            Connection.Close();
            Reader.Close();
            return false;
        }
    }
}