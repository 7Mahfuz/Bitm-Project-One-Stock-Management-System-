using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;

namespace StockManagementSystem.DAL
{
    public class ComapanyGateway : SQLGateway
    {
        public int Save(Company aCompany)
        {
            Connection.Open();

            Query = "insert into Company_tbl values(@Name)";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("Name", aCompany.Name);

            RowCount = Command.ExecuteNonQuery();
            Connection.Close();
            return RowCount;
        }

        public List<Company> GetAll()
        {
            Connection.Open();

            List<Company> allCompany = new List<Company>();
            Query = "select * from Company_tbl";
            Command = new SqlCommand(Query, Connection);
            Reader = Command.ExecuteReader();
            while (Reader.Read())
            {
                Company aCompany = new Company();
                aCompany.Id= (int)Reader["Id"];
                aCompany.Name = Reader["Name"].ToString();
                allCompany.Add(aCompany);
            }
            Reader.Close();
            Connection.Close();

            return allCompany;
        }

        public bool IsExist(string company)
        {
            Connection.Open();
            Query = "select * from Company_tbl where Name=@Name";
            Command = new SqlCommand(Query, Connection);
            Command.Parameters.Clear();
            Command.Parameters.AddWithValue("Name", company);

            Reader = Command.ExecuteReader();

            bool flag = Reader.HasRows;
            Connection.Close();
            Reader.Close();
            return flag;
        }
    }
}