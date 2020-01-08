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
using WebApp.Code;

namespace WebApplication1
{
    public partial class login : System.Web.UI.Page
    {
        SqlCommand cmd;
        SqlConnection conn;
        String strConexion = ConfigurationManager.ConnectionStrings["BD_CADROConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    bool loggin = false;
                    string contraseñaCifrada = "";
                    conn = new SqlConnection(strConexion);
                    conn.Open();
                    String cSQL = "select * from [tblUsuarios] where Email=@usuario and Contrasena=@contrasena";
                    cmd = conn.CreateCommand();
                    cmd.CommandText = cSQL;
                    cmd.Parameters.AddWithValue("@usuario", UserName.Text);
                    cmd.Parameters.AddWithValue("@contrasena", PassWord.Text);
                    SqlDataReader dr = cmd.ExecuteReader();
                    InfUsuario objUsuario = new InfUsuario();
                    while (dr.Read())
                    {
                        loggin = true;

                        objUsuario.Nombre = dr["Nombre"].ToString();
                        objUsuario.Correo = dr["Email"].ToString();
                        objUsuario.IsActivo = Convert.ToBoolean(dr["IsActivado"]);
                        objUsuario.Rol = dr["rol"].ToString();
                        contraseñaCifrada = dr["contrasena"].ToString();
                        Session["InfoUsuario"] = objUsuario;
                    }
                    if (contraseñaCifrada == Utils.sha256_hash(PassWord.Text))
                    {
                        loggin = true;
                    }
                    if (loggin == true)
                    {
                        System.Diagnostics.Debug.WriteLine("rol"+objUsuario.Rol+"usuario"+objUsuario.Correo);
                        if (objUsuario.Rol == "CIUDADANO")
                        {
                            Response.Redirect("solicitante.aspx", false);
                        }
                        else if (objUsuario.Rol == "ASIGNADOR")
                        {
                            Response.Redirect("asignador.aspx", false);
                        }
                        else if (objUsuario.Rol == "SESIONADOR")
                        {
                            Response.Redirect("solicitudes.aspx", false);
                        }
                        else if (objUsuario.Rol == "ADMIN")
                        {
                            Response.Redirect("administrador.aspx", false);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('" + "El usuario no existe o se encuentra inactivo" + objUsuario.Rol + "');", true);
                        }
                    }
                    else
                    {
                        //lblError.Text = "Usuario/contraseña incorrecto";

                        ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('"+ "Usuario/contraseña incorrecto" + "');", true);
                    }
                }
                catch (Exception ex)
                {
                    //lblError.Text = "Error " + ex.Message;
                    ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('" + "No se pudo conectar al servidor" + "');", true);
                }
                finally
                {
                    conn.Close();

                }
            }
            else
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('" + "Agregue el usuario y contraseña" + "');", true);
            }
        }
    }
}