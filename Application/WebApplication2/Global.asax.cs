using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Web.Http;
using WebApplication2.Models;

namespace WebApplication2
{
    public class Global : HttpApplication
    {
        //public static List<Civilite> ListCivilite;
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            GlobalConfiguration.Configure(WebApiConfig.Register);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            //create civilites
            //ListCivilite = new List<Civilite>();
            //ListCivilite.Add(new Civilite { UID = 1, Lib = "Monsieur" });
            //ListCivilite.Add(new Civilite { UID = 2, Lib = "Madame" });
            //ListCivilite.Add(new Civilite { UID = 3, Lib = "Mademoiselle" });


        }
    }
}