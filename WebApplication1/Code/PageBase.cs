using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Runtime.Serialization.Json;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using RestMembership.Models;

namespace WebApplication1.Code
{
    public class PageBase : System.Web.UI.Page
    {
        public string URL = ConfigurationManager.AppSettings["urlService"];

        public SqlTransaction transaction;
        public SqlCommand cmd;
        public SqlConnection conn;
        public String strConexion = ConfigurationManager.ConnectionStrings["BD_CADROConnectionString"].ConnectionString;

        string webMethod;
        protected string returnData;
        protected bool IsXmlHttpRequest = false;
      //  bool isIphoneIPad = false;

        public PageBase()
        {

        }

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);
            //Page.ClientScript.RegisterClientScriptInclude("Utilities", Page.ResolveUrl("~/Scripts/Utilities.js"));
            InitPage();
        }

        void InitPage()
        {
            InitWebMethod();
            invokeScriptValidarTiempoSession();
            string pag = string.Empty;
            string pagina = string.Empty;
            if (!getPageName().ToLower().Contains(".aspx"))
                pagina = getPageName().ToLower() + ".aspx";
            else
                pagina = getPageName().ToLower();
            string rs = "false";
            if (SessionHelper.InformacionUsuario != null)
            {
                User objContexto = SessionHelper.InformacionUsuario;



                if (objContexto.ListPermisosConNivelAcceso != null && objContexto.ListPermisosConNivelAcceso.Count() > 0)
                {
                    IEnumerable<PermisosConNivelAcceso> query = from objPermisosConNivelAcceso in objContexto.ListPermisosConNivelAcceso
                                                                where objPermisosConNivelAcceso.IdPagina.ToLower() == pagina
                                                                select objPermisosConNivelAcceso;

                    foreach (PermisosConNivelAcceso objPermisosConNivelAcceso in query)
                    {
                        //if (objPermisosConNivelAcceso.NivelAcceso == 1)
                        //{

                        //}
                        //if (objPermisosConNivelAcceso.NivelAcceso == 2)
                        //{

                        //}
                        //rs = "true|" + objPermisosConNivelAcceso.NivelAcceso.ToString();                                
                        rs = "true";
                    }
                }
                else
                {
                    //rs = "true|0|No tiene acceso a la página"; //No tiene acceso, retorna a Menú Principal
                    rs = "false";
                }


                //}

                if (rs == "false")
                {
                    Session.Clear();
                    Session.Abandon();
                    String strFuncion = "<script type='text/javascript'> alert('No tiene acceso a la página'); window.location.href='Default.aspx';  </script>";
                    RegistrScriptClient(strFuncion);
                }
            }
            //InsertarScriptOrientacion();
        }

        void invokeScriptValidarTiempoSession()
        {
            if (!Request.AppRelativeCurrentExecutionFilePath.Equals("~/Default.aspx"))
            {
                // String strFuncion = "<script type='text/javascript'> setTimeout('TerminarSession()'," + ObtenerValorTiempoSesion().ToString() + "); </script>";

                //   RegistrScriptClient(strFuncion);
            }
            string pagina = getPageName().ToLower();
      
            if (SessionHelper.Login)
            {
                if (SessionHelper.Login == true)
                {
                }
                else
                {
                    if ((pagina != "Default.aspx") || (pagina != "Default"))
                    {
                        //String strFuncion = "<script type='text/javascript'> setTimeout('RegresarLogin()') </script>";
                        //RegistrScriptClient(strFuncion);
                    }
                }
            }
            else
            {
                if (pagina != "Default.aspx")
                {
                    //String strFuncion = "<script type='text/javascript'> setTimeout('RegresarLogin()') </script>";
                    //RegistrScriptClient(strFuncion);
                }
            }

        }

        public string getPageName()
        {
            string pa = string.Empty;
            if (!HttpContext.Current.Request.RawUrl.Trim().Contains(".aspx"))
                pa = HttpContext.Current.Request.RawUrl.Trim() + ".aspx";
            else
                pa = HttpContext.Current.Request.RawUrl;
            string[] arrResult = pa.Split('/');
            string result = arrResult[arrResult.GetUpperBound(0)];
            arrResult = result.Split('?');
            return arrResult[arrResult.GetLowerBound(0)];
        }

        void InitWebMethod()
        {
            GetWebMethod();
            if (webMethod != string.Empty)
            {
                IsXmlHttpRequest = true;
                ExecuteReflectionMethod();
            }
        }

        void GetWebMethod()
        {
            string rawUrl1 = HttpUtility.UrlDecode(Request.RawUrl);
            string rawUrl = string.Empty;
            if (!rawUrl.Contains(".aspx"))
                rawUrl = rawUrl1 + ".aspx";
            else
                rawUrl = HttpUtility.UrlDecode(Request.RawUrl);

            int lastSlashIndex = rawUrl.LastIndexOf('/') + 1;
            webMethod = string.Empty;
            if ((lastSlashIndex > -1 && !rawUrl.EndsWith(".aspx") && rawUrl.IndexOf("?") == -1))
                webMethod = rawUrl.Substring(lastSlashIndex);
            else
                webMethod = string.Empty;


        }

        void ExecuteReflectionMethod()
        {
            MethodInfo method;

            if (webMethod.Trim().Length > 0)
            {
                try
                {
                    if (SesionValida())
                    {
                        method = this.GetType().GetMethod(webMethod);

                        //Inicia registro de depuración
                        String cParameters1 = String.Format("PROJECT:WebERP, CLASS: PageBase.cs " +
                        "METHOD: GetRequestParameters \nPARAMETERS:  \nmethod={0} ", method);
                        //Log4NetCommon.WriteDebug("DEBUG", cParameters1);
                        //Termina registro de depuración

                        object[] parameters = GetRequestParameters(method);
                        method.Invoke(this, parameters);
                    }
                    else
                        returnData = "**-1";
                }
                catch (Exception ex)
                {
                    //Inicia registro de excepciones
                    //Log4NetCommon.WriteException(ex);
                    //Termina registro de excepciones
                    returnData = "there is an error on execute the method " + webMethod + " " + ex.Message;
                }
                finally
                {
                    HttpResponse response = HttpContext.Current.Response;
                    response.Clear();
                    response.ContentType = "text/plain";
                    response.Write(returnData);
                    response.Flush();
                    response.End();
                }
            }

        }

        object[] GetRequestParameters(MethodInfo method)
        {
            object[] paramRequest = null;
            ParameterInfo[] methodParams = method.GetParameters();
            paramRequest = new Object[methodParams.Length];

            for (int x = 0; x < methodParams.Length; x++)
            {
                if (Request.HttpMethod.ToLower() == "post")
                    paramRequest[x] = GetParameter(Request.Form[x], methodParams[x].ParameterType);
                else if (Request.HttpMethod.ToLower() == "get")
                    paramRequest[x] = GetParameter(Request.Form[x], methodParams[x].ParameterType);
            }

            return paramRequest;
        }


        object GetParameter(string parameterData, Type parameterType)
        {
            if (parameterType == (typeof(Int16)))
                return Int16.Parse(parameterData);
            else if (parameterType == (typeof(Int32)))
                return Int32.Parse(parameterData);
            else if (parameterType == (typeof(Int64)))
                return Int64.Parse(parameterData);
            else if (parameterType == (typeof(double)))
                return double.Parse(parameterData);
            else if (parameterType == (typeof(float)))
                return float.Parse(parameterData);
            else if (parameterType == (typeof(decimal)))
                return decimal.Parse(parameterData);
            else if (parameterType == (typeof(DateTime)))
                return DateTime.Parse(parameterData);
            else if (parameterType == (typeof(bool)))
                return bool.Parse(parameterData);
            else if (parameterType == (typeof(Single)))
                return Single.Parse(parameterData);
            else if (parameterType == (typeof(String)))
                return parameterData;
            else
                return DeserializeJSON(parameterData, parameterType);
        }

        //SErializa un objeto a formato JSON
        protected string SerializeToJSON<T>(T o)
        {
            MemoryStream ms = new MemoryStream();
            DataContractJsonSerializer ser = new DataContractJsonSerializer(o.GetType());
            ser.WriteObject(ms, o);
            string json = Encoding.Default.GetString(ms.ToArray());
            ms.Close();
            return json;


        }

        //Deserializa un objeto de tipo JSON a Cualquier Tipo...
        protected object DeserializeJSON(string jsonData, Type objectType)
        {
            MemoryStream ms = new MemoryStream(Encoding.Unicode.GetBytes(jsonData));
            DataContractJsonSerializer ser = new DataContractJsonSerializer(objectType);
            object o = ser.ReadObject(ms);
            ms.Close();
            return o;

        }

        //Obtiene de la session un objeto JSON
        public void GetJsonSessionObject(string key)
        {
            string o = null;
            if (Session[key] != null)
                o = (string)Session[key];

            returnData = o;
        }

        //Almacena en sesion un objeto Json..
        public void SetJsonSessionObject(string key, string o)
        {
            Session[key] = o;
            returnData = "{\"result\":true}";
        }

        public void TerminarSesion()
        {
            try
            {
                FormsAuthentication.SignOut();
                Session.Clear();
                Session.Abandon();
                returnData = "true";
            }
            catch (Exception ex)
            {
                //Inicia registro de excepciones
                //Log4NetCommon.WriteException(ex);
                //Termina registro de excepciones
                returnData = ex.Message;
            }
        }

        protected string GetThemeCookieName()
        {
            return "MyThemeName";
        }

        //Función para obtener el valor del config de session
        //cookieTimeout
        //roleManager

        public bool SesionValida()
        {
            return (SessionHelper.Login);
        }

        public void RegistrScriptClient(string enunciado)
        {
            try
            {
                ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "ScriptClient" + Guid.NewGuid().ToString(), enunciado, false);
            }
            catch (Exception ex)
            {
                //Inicia registro de excepciones
                // Log4NetCommon.WriteException(ex);
                //Termina registro de excepciones
                throw (ex);
            }
        }


        public string getId()
        {
            string id = string.Empty;
            try
            {
                if (SessionHelper.InformacionUsuario != null)
                {
                  //  User objContexto = new User();
                    //objContexto = (User)this.Session["InfoUsuario"];
                    id = SessionHelper.InformacionUsuario.IdUser;
                }
            }
            catch (Exception ex)
            {
            }
            return id;
        }
    }
}