using StockManagementSystem.Models.ViewModels;
using StockManagementSystem.Models.EntityModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using StockManagementSystem.DAL;

namespace StockManagementSystem.BLL
{
    public class CompanyManager
    {
        ComapanyGateway aComapanyGateway = new ComapanyGateway();

        public string Save(Company aCompany)
        {
            if(aCompany.Name=="")
            {
                return "Company Name Can not be Empty";
            }

            if (aComapanyGateway.IsExist(aCompany.Name))
            {
                return "Company Name Exist";
            }

            int rows = aComapanyGateway.Save(aCompany);
            if (rows > 0)
            {
                return "Saved Susscesfully";
            }

            return "Failed";
        }

        public List<Company> GetAll()
        {
            List<Company> allCompany = new List<Company>();
            allCompany = aComapanyGateway.GetAll();
            return allCompany;
        }

        public bool IsExist(string company)
        {
            if (aComapanyGateway.IsExist(company))
            {
                return true;
            }
            return false;
        }



    }
}