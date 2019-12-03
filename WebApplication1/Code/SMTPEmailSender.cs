using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;

namespace WebApp.Code
{
    /// <summary>
    /// Clase para el envío de correos por medio de un servidor SMTP
    /// </summary>
    public class SMTPEmailSender : IDisposable
    {
        private MailMessage Messsage;
        private SmtpClient SMTPClientServerObject;

        /// <summary>
        /// Nombre del servidor SMTP que se va a utilizar para el envío del correo, Ejemplo: smtp.gmail.com
        /// </summary>
        public String SMTPClientName = "";
        /// <summary>
        /// Número de puerto del servidor SMTP, Ejemplo: 587
        /// </summary>
        public int Port;
        /// <summary>
        /// Usuario de la cuenta del remitente, Ejemplo: juanperez223@gmail.com
        /// </summary>
        public String User;
        /// <summary>
        /// Contraseña de la cuenta del remitente. 
        /// </summary>
        public String Password;
        /// <summary>
        /// Cuanta de correo del remitente, Ejemplo: juanperez223@gmail.com
        /// </summary>
        public String MailAccountFrom = "";
        /// <summary>
        /// Cuerpo o texto principal del correo electrónico
        /// </summary>
        public String MessageBody = "";
        /// <summary>
        /// Asunto del correo
        /// </summary>
        public String Subject = "";
        /// <summary>
        /// Lista de cuentas de correo de destino, Ejemplo: ListMailAccountTo.Add("pedro22@hotmail.com");
        /// </summary>
        public List<String> ListMailAccountTo = new List<string>();
        /// <summary>
        /// Lista de cuentas de correo de destino como "Con Copia Para", Ejemplo: ListMailAccountCC.Add("pedro22@hotmail.com");
        /// </summary>
        public List<String> ListMailAccountCC = new List<string>();
        /// <summary>
        /// Lista de cuentas de correo de destino como "Con Copia Oculta", Ejemplo: ListMailAccountTo.Add("pedro22@hotmail.com");
        /// </summary>
        public List<String> ListMailAccountCCO = new List<string>();
        /// <summary>
        /// Lista de archivos que se van a adjuntar al mensaje, Ejemplo: ListFileAttachment.Add("c:\\temp\\foto1.jpg");
        /// </summary>
        public List<String> ListFileAttachment = new List<String>();

        public List<Attachment> ListAttachmentStream = new List<Attachment>();
        /// <summary>
        /// Constructor vacio
        /// </summary>
        public SMTPEmailSender()
        {
        }

        /// <summary>
        /// Constructor sobrecargado de la clase que recibe los datos del mensaje
        /// </summary>
        /// <param name="cSMTP">Cliente SMTP, Ejemplo: smtp.gmail.com</param>
        /// <param name="nPort">Puerto, Ejemplo: 587</param>
        /// <param name="cFrom">Cuenta de correo de origen, Ejem: juanperez223@gmail.com</param>
        /// <param name="cUser">Usuario, Ejemplo: juanperez223@gmail.com</param>
        /// <param name="cPassword">Contraseña</param>
        public SMTPEmailSender(String cSMTP, int nPort, String cFrom, String cUser, String cPassword)
        {
            MailAccountFrom = cFrom;
            User = cUser;
            Password = cPassword;
            Port = nPort;
            SMTPClientName = cSMTP;
        }

        /// <summary>
        /// Liberador de la clase
        /// </summary>
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }

        /// <summary>
        /// Liberador sobrecargado
        /// </summary>
        /// <param name="disposing"></param>
        protected virtual void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (Messsage != null)
                {
                    Messsage.Dispose();
                    Messsage = null;
                }
                if (SMTPClientServerObject != null)
                {
                    //SMTPClientServerObject.Dispose();
                    SMTPClientServerObject = null;
                }
            }
        }

        /// <summary>
        /// Destructor 
        /// </summary>
        ~SMTPEmailSender()
        {
            Dispose(false);
        }

        /// <summary>
        /// Valida que la cuenta de correo especificada sea una cuenta valida
        /// </summary>
        /// <param name="cEmailAccount">Cuenta de correo a validar</param>
        /// <returns>Valor lógico que determina si la cuenta de correo es valida o no, true=cuenta valida, false=cuenta erronea</returns>
        private Boolean ValidEmailAccount(String cEmailAccount)
        {
            const String cExpresion = "\\w+([-+.']\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*";
            if (Regex.IsMatch(cEmailAccount, cExpresion))
            {
                if (Regex.Replace(cEmailAccount, cExpresion, String.Empty).Length == 0)
                { return true; }
                else
                { return false; }
            }
            else
            { return false; }
        }

        /// <summary>
        /// Permite enviar un correo electrónico con las opciones previamente configuradas 
        /// (ListMailAccountTo, ListMailAccountCC, ListMailAccountCCO, Subject, MessageBody, ListFileAttachment)
        /// </summary>
        /// <returns>Retorna un valor lógico que determina si el mensaje pudo ser enviado correctamente</returns>
        public bool SendMail()
        {
            return SendMail(ListMailAccountTo, ListMailAccountCC, ListMailAccountCCO, Subject, MessageBody, ListFileAttachment, ListAttachmentStream);
        }

        /// <summary>
        /// Realiza el envío del correo a los destinatarios especificados
        /// </summary>
        /// <param name="LMailAccountTo">Lista de cuentas de correo destinatarias de tipo List string</param>
        /// <param name="LMailAccountCC">Lista de cuentas de correo destinatarias CC (Con copia para) de tipo List string</param>
        /// <param name="LMailAccountCCO">Lista de cuentas de correo destinatarias CCO (Con copia oculta para) de tipo List string</param>
        /// <param name="cSubject">Título o asunto del correo</param>
        /// <param name="cMessage">Cuerpo o texto del correo</param>
        /// <param name="LFileAttachment">Lista de archivos adjuntos de tipo List string </param>
        /// <returns>Bandera lógica que determina si el envío del correo pudo realizarse. true=Correo enviado sin errores, false=Error en el proceso de envio</returns>
        public bool SendMail(List<String> LMailAccountTo, List<String> LMailAccountCC, List<String> LMailAccountCCO, String cSubject, String cMessage, List<String> LFileAttachment, List<Attachment> LAttachmentStream)
        {
            try
            {

                Messsage = new MailMessage();
                Messsage.From = new MailAddress(MailAccountFrom);
                Messsage.Priority = MailPriority.Normal;
                SMTPClientServerObject = new SmtpClient(SMTPClientName);
                SMTPClientServerObject.Port = Port;

                // Cargando la lista de direcciones de correo de destino MailTo
                if (LMailAccountTo != null && LMailAccountTo.Count > 0)
                {
                    foreach (String cMA in LMailAccountTo)
                    {
                        if (ValidEmailAccount(cMA))
                        {
                            Messsage.To.Add(cMA);
                        }
                    }
                }
                else
                {
                    Exception exAT = new Exception("No se especificó la cuenta de correo del remitente.");
                    throw exAT;
                    //return false;
                }

                // Cargando la lista de direcciones de correo de destino Mail CC
                if (LMailAccountCC != null && LMailAccountCC.Count > 0)
                {
                    foreach (String cMA in LMailAccountCC)
                    {
                        if (ValidEmailAccount(cMA))
                        {
                            Messsage.CC.Add(cMA);
                        }
                    }
                }

                // Cargando la lista de direcciones de correo de destino Mail CCO
                if (LMailAccountCCO != null && LMailAccountCCO.Count > 0)
                {
                    foreach (String cMA in LMailAccountCCO)
                    {
                        if (ValidEmailAccount(cMA))
                        {
                            Messsage.Bcc.Add(cMA);
                        }
                    }
                }

                // Cargando la lista de Archivos Adjuntos
                if (LFileAttachment != null && LFileAttachment.Count > 0)
                {
                    foreach (String cFA in LFileAttachment)
                    {
                        Attachment oA = new Attachment(cFA);
                        Messsage.Attachments.Add(oA);
                    }
                }

                if (ListAttachmentStream != null && ListAttachmentStream.Count > 0)
                {
                    foreach (var att in ListAttachmentStream)
                    {
                        Messsage.Attachments.Add(att);
                    }
                }

                Messsage.Subject = cSubject;
                Messsage.IsBodyHtml = true; //el texto del mensaje lo pueden poner en HTML y darle formato
                Messsage.Body = cMessage;

                //Establesco que usare seguridad (ssl = Secure Sockets Layer) 
                SMTPClientServerObject.EnableSsl = true;
                SMTPClientServerObject.UseDefaultCredentials = false;
                SMTPClientServerObject.Credentials = new NetworkCredential(User, Password);
                SMTPClientServerObject.Send(Messsage);
                return true;
            }
            catch
            {
                try
                {
                    //Establesco que no usare seguridad ssl (por si no pudo enviarlo con ssl habilitado)
                    SMTPClientServerObject.EnableSsl = false;
                    SMTPClientServerObject.Send(Messsage);

                    return true;
                }
                catch (Exception ExSendMail)
                {
                    throw ExSendMail;
                    //return false;
                }
            }
        }
    }
}