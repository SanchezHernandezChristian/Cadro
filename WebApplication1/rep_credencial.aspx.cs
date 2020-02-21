using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;
using System.Drawing;
using System.Drawing.Imaging;
using System.Net.Mail;
using System.Data;

namespace WebApplication1
{
    public partial class rep_credencial : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ObtenerInformacion(long.Parse(Request.QueryString[0]));
                }
            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = ex.Message;
            }
            
        }

        void ObtenerInformacion(long folio)
        {
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" SELECT  " +
                  " s.id " +
                  " , fecha_solicitud " +
                  " , fecha_de_sesion " +
                  " , tramite_que_solicita " +
                  " , p.cedula " +
                 " , (UPPER(substring(p.ap_paterno, 1,1)) + lower(SUBSTRING(p.ap_paterno,2,Len(p.ap_paterno)))) as ap_paterno " +
                  " , (UPPER(substring(p.ap_materno, 1,1)) + lower(SUBSTRING(p.ap_materno,2,Len(p.ap_materno)))) as ap_materno " +
                  " , (UPPER(substring(p.nombre, 1,1)) + lower(SUBSTRING(p.nombre,2,Len(p.nombre)))) as nombre " +
                  " , p.calle_numero " +
                  " , m.idMunicipio as nombreMunicipio " +
                  " , l.nom_loc as idLocalidad " +
                  " , p.email " +
                  " , prof.abreviatura_de_profesion as clave_profesion " +
                  " , uni.descripcion as egresado_de " +
                  " , p.fecha_titulo " +
                  " , p.fecha_cedula " +
                  " , p.anio_reg_sop " +
                  " , p.cursos " +
                  " , col.descripcion as colegio " +
                  " , p.clasificacion " +
                  " , UPPER(p.colonia) as colonia " +
                  " , p.telefono_local " +
                  " , p.telefono_celular " +
                  //" , (isnull(p.clasificacion, ' ') + '-' + isnull(p.idRegistro, ' ') + '-' + isnull(prof.abreviatura_de_profesion, ' ')) as registroDRO " +
                  " , s.observaciones " +
                  " , s.status " +
                  " , p.Idregistro " +
                  " FROM tblsolicitudes as s " +
                  " inner join tblPadronDRO as p " +
                  " on s.id_PadronDRO = p.Id " +
                  " left join tblProfesiones as prof" +
                  " on prof.id_profesion = p.id_profesion" +
                  " left join catalogo_de_tramites as tramites" +
                  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
                  " inner join tblColegios as col" +
                  " on col.id_colegio = p.id_colegio" +
                  " inner join tblUniversidades as uni" +
                  " on uni.id_universidad = p.id_universidad" +
                  " inner join tblLocalidades as l" +
                  " on l.Id = p.Idlocalidad " +
                  " inner join tblMunicipios as m" +
                  " on l.mun = m.idMunicipio " +
                  " where s.Id ={0}", folio);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtCedula.Text = dr["cedula"].ToString();
                    txtApaterno.Text = dr["ap_paterno"].ToString();
                    txtAMaterno.Text = dr["ap_materno"].ToString();
                    txtNombres.Text = dr["nombre"].ToString();
                    txtCorreoElectronico.Text = dr["email"].ToString();
                    if (dr["clasificacion"] != DBNull.Value)
                    {
                        cboClasificacion.Value = dr["clasificacion"].ToString();
                    }
                    if (dr["Idregistro"] != DBNull.Value)
                    {
                        txtRegistroDRO.Text = dr["Idregistro"].ToString();
                    }
                    if (dr["clave_profesion"] != DBNull.Value)
                    {
                        cboClaveProfesion.Value = dr["clave_profesion"].ToString();
                    }
                }
                dr.Close();
                //clasificación
               

            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = ex.Message;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
        
        protected void gvSolicitudes_DataBinding(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" select year(fechaSesion) as anio, soli * from [tblSolicitud] as soli where CedulaProfesional='{0}' and isAutorizado is not null", txtCedula.Text);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                DataTable dt = new DataTable();
                dt.Load(cmd.ExecuteReader());
                //gvSolicitudes.DataSource = dt;
            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = ex.Message;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void cbGuardar_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            try
            {
                string foliosol = null;
                conn = new SqlConnection(strConexion);
                conn.Open();
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
                                       " set fecha_de_entrega_de_licencia=getdate() where id='{0}'", foliosol);
                cmd.CommandText = cSQL;
                cmd.ExecuteNonQuery();
                transaction.Commit();
                //enviarCorreo();
                e.Result = "true|Credencial generada correctamente";
            }
            catch
            {
                transaction.Rollback();
                e.Result = "false|No se pudo realizar el trámite";
            }
        }
        

        protected void enviarCorreo()
        {
            //Envia el correo
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtCorreoElectronico.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Impresión de Credencial";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                        "Usuario = " + txtCorreoElectronico.Text + "<br/>" +
                        "Tramite Solicitado = " + "Registro"+ "<br/>" +
                        "Estado de trámite = " + "Usted puede pasar por su credencial personalmente a las instalaciones de SINFRA" + "<br/>" +
                        "Cedula = " + txtCedula.Text;
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
        }
        // DataClasses1DataContext db = new DataClasses1DataContext();

        /*   void LoadData()
           {
               var st = from s in db.Documentos select s;
               GridView1.DataSource = st;
               GridView1.DataBind();
           } */
    }
}
