using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystem.Models.ViewModels
{
    [Serializable]
    public class StockOutChartVM
    {
        
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public string CompanyName { get; set; }
        public int Quantity { get; set; }
    }
}