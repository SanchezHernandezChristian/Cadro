using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class archivos_dro : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["InfoUsuario2"] != null)
            {
                InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
                //    (Master.FindControl("lblNombreUsuario") as DevExpress.Web.ASPxLabel).Text = objInfUsuario.Nombre;
                txtCedula.Text = objInfUsuario.cedula;
                txtNombres.Text = objInfUsuario.Nombre;
                txtApaterno.Text = objInfUsuario.Paterno;
                txtAMaterno.Text = objInfUsuario.Materno;
                // cedulatxt.Text = objInfUsuario.cedula;
              //  btnGuardar.Enabled = false;
              //  btnGuardar.ClientEnabled = false;
            }
            else
            {
                Response.Redirect("default.aspx", false);
            }
            string foliosol=null;
            conn = new SqlConnection(strConexion);
            conn.Open();

       /*   */  String cSQL2 = string.Format(" SELECT p.cedula, s.id, s.status, p.Idregistro " +
      " FROM tblsolicitudes as s" +
                  " inner join tblPadronDRO as p" +
                  " on s.id_PadronDRO = p.id" +
                  " where s.status='EN RECEPCION DE DOCUMENTOS' and p.cedula = '{0}'", txtCedula.Text);
            cmd = conn.CreateCommand();
            cmd.CommandText = cSQL2;
            
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                foliosol = dr["id"].ToString();
            }
            dr.Close();
          /*  */
        }


        protected void ASPxUploadControl1_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            
                InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
                txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl7 = sender as ASPxUploadControl;

            if (uploadControl7.UploadedFiles != null && uploadControl7.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl7.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl7.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Cedulas/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Cedulas/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);

                    if (file.FileName != "")
                    {
                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Cedulas/" + txtCedula.Text), file.FileName);
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }

        protected void pago_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl = sender as ASPxUploadControl;

            if (uploadControl.UploadedFiles != null && uploadControl.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Pagos/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Pagos/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);

                    if (file.FileName != "")
                    {
                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Pagos/" + txtCedula.Text), file.FileName);
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }

        protected void credencial_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl2 = sender as ASPxUploadControl;

            if (uploadControl2.UploadedFiles != null && uploadControl2.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl2.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl2.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Elector/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Elector/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);

                    if (file.FileName != "")
                    {
                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Elector/" + txtCedula.Text), file.FileName);
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }

        protected void domicilio_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl3 = sender as ASPxUploadControl;

            if (uploadControl3.UploadedFiles != null && uploadControl3.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl3.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl3.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Domicilio/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Domicilio/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);

                    if (file.FileName != "")
                    {
                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Domicilio/" + txtCedula.Text), file.FileName);
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }

        protected void acta_nac_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl4 = sender as ASPxUploadControl;

            if (uploadControl4.UploadedFiles != null && uploadControl4.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl4.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl4.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Nacimiento/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Nacimiento/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);

                    if (file.FileName != "")
                    {
                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Nacimiento/" + txtCedula.Text), file.FileName);
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }

        protected void cv_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl5 = sender as ASPxUploadControl;

            if (uploadControl5.UploadedFiles != null && uploadControl5.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl5.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl5.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Vitae/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Vitae/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);

                    if (file.FileName != "")
                    {
                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Vitae/" + txtCedula.Text), file.FileName);
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }

        protected void foto_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl6 = sender as ASPxUploadControl;

            if (uploadControl6.UploadedFiles != null && uploadControl6.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl6.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl6.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Foto/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Foto/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);

                    if (file.FileName != "")
                    {

                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Foto/" + txtCedula.Text), "cedula.png");
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }

        protected void cbGuardarOficios_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                string foliosol = null;
                conn = new SqlConnection(strConexion);
                conn.Open();

                /*   */
                String cSQL2 = string.Format(" SELECT p.cedula, s.id, s.status, p.Idregistro " +
      " FROM tblsolicitudes as s" +
                  " inner join tblPadronDRO as p" +
                  " on s.id_PadronDRO = p.id" +
                  " where s.status='EN RECEPCION DE DOCUMENTOS' and p.cedula = '{0}'", txtCedula.Text);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL2;

                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    foliosol = dr["id"].ToString();
                }
                dr.Close();
                
                conn = new SqlConnection(strConexion);
                conn.Open();
                cmd = conn.CreateCommand();
                transaction = conn.BeginTransaction();
                cmd.Transaction = transaction;
                String cSQL = string.Format(" update [tblsolicitudes]   " +
                                       " set status='EN REVISION DE DOCUMENTOS' where id='{0}'", foliosol);
                cmd.CommandText = cSQL;
                cmd.ExecuteNonQuery();
                transaction.Commit();
                
                enviarCorreo();
                //e.Result = "true|Trámite de registro realizado correctamente";
            }
            catch
            {
                transaction.Rollback();
                e.Result = "false|No se pudo realizar el trámite";
            }
        }

        protected void cursos_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            txtCedula.Text = objInfUsuario.cedula;

            System.Threading.Thread.Sleep(2000);

            ASPxUploadControl uploadControl = sender as ASPxUploadControl;

            if (uploadControl.UploadedFiles != null && uploadControl.UploadedFiles.Length > 0)
            {
                for (int i = 0; i < uploadControl.UploadedFiles.Length; i++)
                {
                    UploadedFile file = uploadControl.UploadedFiles[i];

                    string.Format(Server.MapPath("~/Documents/Cursos/{0}"), txtCedula.Text);
                    string path = (Server.MapPath(string.Format("~/Documents/Cursos/{0}", txtCedula.Text)));
                    Directory.CreateDirectory(path);
                    
                    if (file.FileName != "")
                    {
                        string fileName = Path.Combine("{0}{1}", MapPath("~/Documents/Cursos/" + txtCedula.Text), file.FileName);
                        file.SaveAs(fileName, true);
                    }
                }
            }
        }


        protected void enviarCorreo()
        {
            InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            correo.Text = objInfUsuario.Correo;

            //Response.Write("<script language='javascript'>alert('inicio enviar correo')</script>");
            //Envia el correo
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(correo.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Asignación de fecha para solicitud";
            mail.Bcc.Add("yarielsilva54@gmail.com");
            //mail.Bcc.Add("ismaelgomezvelasco@outlook.com");
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                        "Su trámite fue enviado correctamente";
            mail.BodyEncoding = System.Text.Encoding.UTF8;
            mail.IsBodyHtml = true;
            mail.Priority = MailPriority.High;
            SmtpClient client = new SmtpClient();
            client.Credentials = new System.Net.NetworkCredential("cadro.sinfra@gmail.com", "judicial10");
            client.Port = 587;
            client.Host = "smtp.gmail.com";
            client.EnableSsl = true;
            try
            {
                System.Diagnostics.Debug.WriteLine("antes del correo");
                client.Send(mail);
                System.Diagnostics.Debug.WriteLine("despues del correo");
            }
            catch (Exception ex)
            {
                Exception ex2 = ex;
                string errorMessage = string.Empty;
                while (ex2 != null)
                {
                    errorMessage += ex2.ToString();
                    ex2 = ex2.InnerException;
                    Response.Redirect("solicitante.aspx", false);
                }
            }
        }
    }
}