using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Web;
using System.Web.Configuration;
using UtilsInfraestructura;

namespace WebApplication1.Code
{
    public class ApiService
    {
        string urlSeguridad = "";
        string urlService = "";

        public ApiService()
        {
            string host = WebConfigurationManager.AppSettings["Host"];
            switch (host)
            {
                case "pruebas":
                    urlSeguridad = "http://172.17.75.116/seguridad/api/";
                    //urlService = "http://172.17.75.116/ServicioPruebas/api/"; //"http://172.17.75.9/ServicioPruebas/api/";
                    urlService = "http://172.17.75.116/RESTPII_V3/api/";
                    break;
                case "local":
                    urlSeguridad = "http://localhost:53903/api/";
                    urlService = "http://localhost:24012/api/";
                    break;
                case "produccion":
                    urlSeguridad = "http://172.17.75.9/seguridad/api/";
                    urlService = "http://172.17.75.9/RESTPII_V3/api/";
                    break;
            }
        }

        public Response GetLista<T>(string controller)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlService);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(controller).Result;
                var returnString = response.Content.ReadAsStringAsync().Result;
                if (!response.IsSuccessStatusCode)
                {
                    result.IsSuccess = false;
                    result.Message = response.ReasonPhrase;
                }
                else
                {
                    var list = JsonConvert.DeserializeObject<List<T>>(returnString);
                    result.IsSuccess = true;
                    result.Result = list;
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response GetObject(string controller)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlService);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(controller).Result;
                var returnString = response.Content.ReadAsStringAsync().Result;
                if (!response.IsSuccessStatusCode)
                {
                    result.IsSuccess = false;
                    result.Message = response.ReasonPhrase;
                }
                else
                {
                    var obj = JsonConvert.DeserializeObject<object>(returnString);
                    result.IsSuccess = true;
                    result.Result = obj;
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response GetObject2(string controller)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlService);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(controller).Result;
                var returnString = response.Content.ReadAsStringAsync().Result;
                if (!response.IsSuccessStatusCode)
                {
                    result.IsSuccess = false;
                    result.Message = response.ReasonPhrase;
                }
                else
                {
                    result = JsonConvert.DeserializeObject<Response>(returnString);
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response GetObjectList<T>(string controller)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlService);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(controller).Result;
                var returnString = response.Content.ReadAsStringAsync().Result;
                if (!response.IsSuccessStatusCode)
                {
                    result.IsSuccess = false;
                    result.Message = response.ReasonPhrase;
                }
                else
                {
                    result = JsonConvert.DeserializeObject<Response>(returnString);
                   
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response post(string controller, object obj)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlService);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var json = JsonConvert.SerializeObject(obj);
                var contentU = new StringContent(json, Encoding.UTF8, "application/json");
                var response = client.PostAsync(controller, contentU).Result;
                response.EnsureSuccessStatusCode();
                var returnString = response.Content.ReadAsStringAsync().Result;
                var objresult = JsonConvert.DeserializeObject<object>(returnString);
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {                                    
                    result.Message = response.ReasonPhrase;
                    result.IsSuccess = true;
                    result.Result = objresult;
                }
                else
                {                    
                    result.IsSuccess = false;
                    result.Message = "Ocurrio un problema al guardar la información.\n " + response.ReasonPhrase;
                    result.Result = objresult;
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response put(string controller, object obj)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlService);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var json = JsonConvert.SerializeObject(obj);
                var contentU = new StringContent(json, Encoding.UTF8, "application/json");
           
                var response = client.PutAsync(controller, contentU).Result;
                response.EnsureSuccessStatusCode();
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    result.Message = response.ReasonPhrase;
                    result.IsSuccess = true;
                }
                else
                {
                    result.IsSuccess = false;
                    result.Message = "Ocurrio un problema al guardar la información.\n " + response.ReasonPhrase;
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response GetObjectSeguridad(string controller)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlSeguridad);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var response = client.GetAsync(controller).Result;
                var returnString = response.Content.ReadAsStringAsync().Result;
                if (!response.IsSuccessStatusCode)
                {
                    result.IsSuccess = false;
                    var obj = JsonConvert.DeserializeObject<object>(returnString);
                    result.Result = obj;
                }
                else
                {
                    var obj = JsonConvert.DeserializeObject<object>(returnString);
                    result.IsSuccess = true;
                    result.Result = obj;
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response postSeguridad(string controller, object obj)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlSeguridad);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));
                var json = JsonConvert.SerializeObject(obj);
                var contentU = new StringContent(json, Encoding.UTF8, "application/json");
                var response = client.PostAsync(controller, contentU).Result;
                var returnString = response.Content.ReadAsStringAsync().Result;
                response.EnsureSuccessStatusCode();
                if (response.IsSuccessStatusCode)
                {
                    var objre = JsonConvert.DeserializeObject<object>(returnString);
                    result.IsSuccess = true;
                    result.Result = objre;
                }
                else
                {
                    result.IsSuccess = false;
                    var objfalse = JsonConvert.DeserializeObject<object>(returnString);
                    result.Result = objfalse;
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }

        public Response delete(string controller)
        {
            Response result = new Response();
            var client = new HttpClient();
            try
            {
                client.BaseAddress = new Uri(urlService);
                client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));


                var response = client.DeleteAsync(controller).Result;
                response.EnsureSuccessStatusCode();
                var returnString = response.Content.ReadAsStringAsync().Result;
                var objresult = JsonConvert.DeserializeObject<object>(returnString);
                if (response.StatusCode == System.Net.HttpStatusCode.OK)
                {
                    result.Message = response.ReasonPhrase;
                    result.IsSuccess = true;
                    result.Result = objresult;
                }
                else
                {
                    result.IsSuccess = false;
                    result.Message = "Ocurrio un problema al guardar la información.\n " + response.ReasonPhrase;
                    result.Result = objresult;
                }
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = ex.Message;
            }
            finally { client.Dispose(); }
            return result;
        }
    }
}