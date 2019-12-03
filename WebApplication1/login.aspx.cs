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
                    if (objUsuario.IsActivo)
                    {
                        Response.Redirect("solicitudes.aspx", false);
                    }
                    else
                    {
                        lblError.Text = "Debe confirmar su usuario en su cuenta de correo electrónico";
                    }
                }
                else
                {
                    lblError.Text = "Usuario/contraseña incorrecto";
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Error " + ex.Message;
            }
            finally
            {
                conn.Close();

            }
        }

        protected void cbRecuperar_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            try
            {
                if (txtEmail.Text == "")
                {
                    e.Result = "Debe ingresar el correo";
                    return;
                }
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = "select * from [tblUsuarios] where Email=@email";
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                cmd.Parameters.AddWithValue("@email", txtEmail.Text);
                SqlDataReader reader = cmd.ExecuteReader();

                string cPassword = "";
                while (reader.Read())
                {
                    cPassword = reader["Contrasena"].ToString();
                }
                reader.Close();

                string nuevaContraseña = Membership.GeneratePassword(8, 1);
                Random rdn = new Random();
                nuevaContraseña = Regex.Replace(nuevaContraseña, @"[^0-9]", m => rdn.Next(1, 9).ToString());

                //Registrarse objRegistrarse = new Registrarse();

                System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
                mail.To.Add(txtEmail.Text);
                mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
                mail.Subject = "Recuperación de contraseña";
                mail.Bcc.Add("yarielsilva54@gmail.com");
                //mail.Bcc.Add("ismaelgomezvelasco@outlook.com");
                mail.SubjectEncoding = System.Text.Encoding.UTF8;
                mail.Body = "Usuario = " + txtEmail.Text + "<br/>" +
                            "Contraseña = " + nuevaContraseña;
                mail.BodyEncoding = System.Text.Encoding.UTF8;
                mail.IsBodyHtml = true;
                mail.Priority = MailPriority.High;
                SmtpClient client = new SmtpClient();
                client.Credentials = new System.Net.NetworkCredential("cadro.sinfra@gmail.com", "judicial10");
                client.Port = 587;
                client.Host = "smtp.gmail.com";
                client.EnableSsl = true;
                e.Result = "Contraseña modificada, revise su correo por favor";
                try
                {
                    cSQL = "update [tblUsuarios] set Contrasena=@contra where [Email]='" + txtEmail.Text + "'";
                    cmd.CommandText = cSQL;
                    cmd.Parameters.AddWithValue("@contra", nuevaContraseña);
                    cmd.ExecuteNonQuery();
                    client.Send(mail);
                }
                catch (Exception ex)
                {
                    Exception ex2 = ex;
                    string errorMessage = string.Empty;
                    while (ex2 != null)
                    {
                        errorMessage += ex2.ToString();
                        ex2 = ex2.InnerException;
                    }
                }
                txtEmail.Text = "";
            }

            catch (Exception ex)
            {
                e.Result = "Error " + ex.Message;

            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void btnRecuperar_Click(object sender, EventArgs e)
        {

        }
    }
}