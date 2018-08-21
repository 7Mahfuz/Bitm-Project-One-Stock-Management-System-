using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystem.Models.ViewModels
{
    public class SearchItemVM
    {
        
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public string Quantity { get; set; }
                public int Reorderlvl { get; set; }
    }
}