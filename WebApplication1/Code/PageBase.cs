using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;

namespace WebApp.Code
{
    public class PageBase : System.Web.UI.Page
    {
        public string URL = ConfigurationManager.AppSettings["urlService"];

        public SqlTransaction transaction;
        public SqlCommand cmd;
        public SqlConnection conn;
        public String strConexion = ConfigurationManager.ConnectionStrings["BD_CADROConnectionString"].ConnectionString;

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            InitPage();
        }
        void InitPage()
        {
            invokeScriptValidarTiempoSession();
        }
        void invokeScriptValidarTiempoSession()
        {

            HttpCookie myCookie = new HttpCookie("sesionCookie");
            //create a cookie               
            //Add key-values in the cookie
            myCookie.Values.Add("login", "true");
            //set cookie expiry date-time. Made it to last for next 12 hours.
            myCookie.Expires = DateTime.Now.AddHours(12);
            //Most important, write the cookie to client.
            Response.Cookies.Add(myCookie);
            Response.Cookies["sesionCookie"].Expires = DateTime.Now.AddDays(-1);
            string pagina = getPageName().ToLower();
            if (this.Session["InfoUsuario"] == null)
            {
                //create a cookie               
                //Add key-values in the cookie
                myCookie.Values.Add("login", "false");
                //set cookie expiry date-time. Made it to last for next 12 hours.
                myCookie.Expires = DateTime.Now.AddHours(12);
                //Most important, write the cookie to client.
                Response.Cookies.Add(myCookie);
                if (pagina != "Login.aspx")
                {
                    String strFuncion = "<script type='text/javascript'> setTimeout('RegresarLogin()') </script>";
                    RegistrScriptClient(strFuncion);
                }
            }
        }

        public void RegistrScriptClient(string enunciado)
        {
            try
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ScriptClient" + Guid.NewGuid().ToString(), enunciado, false);
            }
            catch (Exception ex)
            {
                throw (ex);
            }
        }
        public string getPageName()
        {
            string[] arrResult = HttpContext.Current.Request.RawUrl.Split('/');
            string result = arrResult[arrResult.GetUpperBound(0)];
            arrResult = result.Split('?');
            return arrResult[arrResult.GetLowerBound(0)];
        }
        public void ShowMessage(string message)
        {
            string script = string.Format("<script type=\"text/javascript\"> alert(\"{0}\"); </script>", message);
            ClientScript.RegisterStartupScript(Type.GetType("System.String"), "key", script);
        }
    }
}