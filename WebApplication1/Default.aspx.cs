using Newtonsoft.Json;
using RestMembership.Models;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UtilsInfraestructura;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class _Default : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection conn;
        String strConexion = ConfigurationManager.ConnectionStrings["BD_CADROConnectionString"].ConnectionString;
        ApiService apiService;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SessionHelper.InformacionUsuario != null)
                {
                    foreach (var item in SessionHelper.InformacionUsuario.ListPermisosConNivelAcceso)
                    {
                        switch (item.RoleName)
                        {
                            case "DRO":
                                Response.Redirect("solicitante.aspx", false);
                                break;
                            case "DRO_ASIGNADOR":
                                Response.Redirect("asignador.aspx", false);
                                break;
                            case "DRO_SESIONADOR":
                                Response.Redirect("solicitudes.aspx", false);
                                break;
                            case "ADMIN":
                                Response.Redirect("dro_Administrador.aspx", false);
                                break;
                        }
                    }
                }
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            bool loggin = false;
            if (Page.IsValid)
            {
                try
                {
                    apiService = new ApiService();

                    var result = apiService.GetObjectSeguridad(string.Format("Users?app=PII&Email={0}&Pass={1}", UserName.Text, PassWord.Text));
                    if (result.IsSuccess)
                    {
                        var res = JsonConvert.DeserializeObject<Response>(result.Result.ToString());
                        if (res.IsSuccess)
                        {
                            var usu = JsonConvert.DeserializeObject<User>(res.Result.ToString());
                            SessionHelper.Login = true;
                            loggin = true;
                            SessionHelper.InformacionUsuario = usu;

                            conn = new SqlConnection(strConexion);
                            conn.Open();
                            String cSQL = "select * from [tblUsuarios] where nomUser=@usuario";
                            cmd = conn.CreateCommand();
                            cmd.CommandText = cSQL;
                            cmd.Parameters.AddWithValue("@usuario", usu.IdUser);
                            SqlDataReader dr = cmd.ExecuteReader();
                            InfUsuario objUsuario = new InfUsuario();
                            while (dr.Read())
                            {
                                loggin = true;
                                objUsuario.Nombre = dr["Nombre"].ToString();
                                objUsuario.Correo = dr["Email"].ToString();
                                objUsuario.IsActivo = Convert.ToBoolean(dr["IsActivado"]);
                                objUsuario.Rol = dr["rol"].ToString();
                                objUsuario.cedula = dr["cedula"].ToString();
                                objUsuario.Paterno = dr["APaterno"].ToString();
                                objUsuario.Materno = dr["AMaterno"].ToString();
                                Session["InfoUsuario2"] = objUsuario;
                                Session["rol"]= dr["rol"].ToString();



                            }
                            conn.Close();
                            foreach (var item in usu.ListPermisosConNivelAcceso)
                            {
                                switch (item.RoleName)
                                {
                                    case "DRO":
                                        Response.Redirect("solicitante.aspx", false);
                                        break;
                                    case "DRO_ASIGNADOR":
                                        Response.Redirect("asignador.aspx", false);
                                        break;
                                    case "DRO_SESIONADOR":
                                        Response.Redirect("solicitudes.aspx", false);
                                        break;
                                    case "ADMIN":
                                        Response.Redirect("dro_Administrador.aspx", false);
                                        break;
                                    default:
                                        ClientScript.RegisterStartupScript(GetType(), "Message", "alertas('No tiene rol', 'error');", true);
                                        break;
                                }
                            }
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "Message", "alertas('" + res.Message + "', 'error');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(GetType(), "Message", "alertas('" + result.Message + "', 'error');", true);
                    } 
                    
                }
                catch (Exception ex)
                {
                    //lblError.Text = "Error " + ex.Message;
                    ClientScript.RegisterStartupScript(GetType(), "Message", "alertas('" + "No se pudo conectar al servidor" + "', 'error');", true);
                }
                finally
                {
                    
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "alertas('" + "Agregue el usuario y contraseña" + "', 'error');", true);
            }

        }
    }
}