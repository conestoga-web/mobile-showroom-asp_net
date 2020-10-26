using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mobilePhoneSR.Models
{
    public class Incident
    {
        public Incident() { }

        public Incident(Incident incident)
        {
            this.ListedIncident = incident;
        }

        public Incident ListedIncident { get; set; }

        public string CustomerIncidentDisplay()
        {
            string displayString = string.Format("Incident for product {0} closed {1} ({2})",
                ProductCode,
                DateClosed,
                Title
            );
            return displayString;
        }

        public string IncidentID { get; set; }
        public string CustomerID { get; set; }
        public string ProductCode { get; set; }
        public string TechID { get; set; }
        public string DateOpened { get; set; }
        public string DateClosed { get; set; }
        public string Title { get; set; }
    }
}