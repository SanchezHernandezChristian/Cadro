using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Net.Mime;

namespace WebApplication1
{
    class Correo
    {
            MailMessage correos = new MailMessage();
            SmtpClient envios = new SmtpClient();

            public void enviarCorreo(string password, string destinatario, string cedula)
            {
                string output = null;
                try
                {
                    correos.Body = "Usuario= " + destinatario + "<br/>" + "<br/>" +
                                    "Contraseña= " + password + "<br/>" + "<br/>" +
                                    "Cedula= " + cedula;
                    correos.Subject = "Registro Exitoso";
                    correos.Bcc.Add("yarielsilva54@gmail.com");
                    // correos.Bcc.Add("");
                    correos.IsBodyHtml = true;
                    correos.To.Add(destinatario.Trim());



                    correos.From = new MailAddress("cadro.sinfra@gmail.com");
                    envios.Credentials = new NetworkCredential("cadro.sinfra@gmail.com", "judicial10");

                    //Datos importantes no modificables para tener acceso a las cuentas

                    envios.Host = "smtp.gmail.com";
                    envios.Port = 587;
                    envios.EnableSsl = true;

                    envios.Send(correos);
                }
                catch (Exception ex)
                {
                    output = "Error enviando correo electrónico: " + ex.Message;
                }
            }
    }
}