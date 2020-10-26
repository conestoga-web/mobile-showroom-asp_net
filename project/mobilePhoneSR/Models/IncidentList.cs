using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace mobilePhoneSR.Models
{
    public class IncidentList
    {
        private List<Incident> incidents;

        public IncidentList()
        {
            incidents = new List<Incident>();
        }

        public Incident this[int index]
        {
            get { return incidents[index]; }
            set { incidents[index] = value; }
        }

        public Incident this[string customerID]
        {
            get
            {
                foreach (Incident i in incidents)
                    if (i.ListedIncident.CustomerID == customerID) return i;
                return null;
            }
        }

        public int Count
        {
            get { return incidents.Count; }
        }

        public static IncidentList GetList()
        {
            //IncidentList list = (IncidentList)HttpContext.Current.Session["Incident"];
            //if (list == null)
            HttpContext.Current.Session["Incident"] = new IncidentList();
            return (IncidentList)HttpContext.Current.Session["Incident"];
        }

        public void AddIncident(Incident incident)
        {
            Incident i = new Incident(incident);
            i.IncidentID = i.ListedIncident.IncidentID;
            i.CustomerID = i.ListedIncident.CustomerID;
            i.ProductCode = i.ListedIncident.ProductCode;
            i.TechID = i.ListedIncident.TechID;
            i.DateOpened = i.ListedIncident.DateOpened;
            i.DateClosed = i.ListedIncident.DateClosed;
            i.Title = i.ListedIncident.Title;

            incidents.Add(i);
        }

        public void Clear()
        {
            incidents.Clear();
        }
    }
}