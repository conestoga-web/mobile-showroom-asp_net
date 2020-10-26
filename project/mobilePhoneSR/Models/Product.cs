using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mobilePhoneSR
{
    public class Product
    {
        public string ProductID { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string Specification { get; set; }
        public string Colour { get; set; }
        public string Warranty { get; set; }
        public decimal UnitPrice { get; set; }
        public string ImageFile { get; set; }
    }
}