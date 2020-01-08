using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WebApplication1.Models;

namespace WebApplication1.Code
{
    public class SessionHelper
    {
        public const string url = "~/Documents";
        public const string urlFactibilidad = "~/Documents/Cedulas";
        private const string FACTIBILIDADESPDFVAR = "factibilidadesPDF";

        public static T Get<T>(string variable)
        {
            object valor = HttpContext.Current.Session[variable];
            if (valor == null)
                return default(T);
            else
                return ((T)valor);
        }

        public static void Set(string variable, object valor)
        {
            HttpContext.Current.Session[variable] = valor;
        }

        public static FactibilidadPDF FactibilidadesPDF
        {

            get
            {
                return Get<FactibilidadPDF>(FACTIBILIDADESPDFVAR);
            }
            set
            {
                Set(FACTIBILIDADESPDFVAR, value);
            }
        }
    }
}