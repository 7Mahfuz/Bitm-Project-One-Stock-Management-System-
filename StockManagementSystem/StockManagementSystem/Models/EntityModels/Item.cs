﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace StockManagementSystem.Models.EntityModels
{
    public class Item
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int ReorderLevel { get; set; }

        public int CategotyId { get; set; }
        public int CompanyId { get; set; }
    }
}