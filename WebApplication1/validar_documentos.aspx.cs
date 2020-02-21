using DevExpress.Web;
using ERP.Core.Log4Net;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
        public partial class validar_documentos : PageBase { 
            protected void Page_Load(object sender, EventArgs e) {
            try
            {
                if (!IsPostBack)
                {
                    ObtenerInformacion(long.Parse(Request.QueryString[0]));
                    obtenerRegion();
                }
            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = "No contiene la documentación completa";
            }
        }


        void ObtenInformacion(string cedulaProfesional)
        {
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format("select top 1 * from [tblPadronDRO] where Cedula='{0}' ", cedulaProfesional);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    txtApaterno.Text = dr["ap_paterno"].ToString();
                    txtAMaterno.Text = dr["ap_materno"].ToString();
                    txtNombres.Text = dr["nombre"].ToString();
                    txtCalleNumero.Text = dr["calle_numero"].ToString();
                    txtColonia.Text = dr["colonia"].ToString();
                    cboMunicipio.Value = dr["municipio"].ToString();
                    cboLocalidad.Value = dr["Idlocalidad"].ToString();
                    cboRegion.Text = dr["region"].ToString();
                    txtTelLocal.Text = dr["telefono_local"].ToString();
                    txtTelCelular.Text = dr["telefono_celular"].ToString();
                    txtCorreoElectronico.Text = dr["email"].ToString();
                    cboProfesion.Value = dr["prof.abreviatura_de_profesion as clave_profesion"].ToString();
                    cboEgresado.Value = dr["egresado_de"].ToString();
                    if (dr["fecha_titulo"] != DBNull.Value)
                    {
                        dtFechaTitulo.Date = Convert.ToDateTime(dr["fecha_titulo"]);
                    }
                    if (dr["fecha_cedula"] != DBNull.Value)
                    {
                        dtFechaCedula.Date = Convert.ToDateTime(dr["fecha_cedula"]);
                    }
                    cboColegio.Value = dr["colegio"].ToString();
                    txtCursos.Text = dr["cursos"].ToString();
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = "No contiene la documentación completa";
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
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
      " , UPPER(p.calle_numero) as calle_numero " +
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
      " , s.notasfecha " +
      " , s.folio_finanzas " +
      " , p.idRegistro " +
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
                  " where s.id ={0}", folio);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    dtFechaSolicitud.Date = Convert.ToDateTime(dr["fecha_solicitud"]);
                    if (dr["fecha_de_sesion"] == DBNull.Value)
                    {
                        dtFechaSesion.Date = DateTime.Now;
                    }
                    else
                    {
                        dtFechaSesion.Date = Convert.ToDateTime(dr["fecha_de_sesion"]);
                    }
                    txtCedula.Text = dr["cedula"].ToString();
                    cboTipoTramite.Value = dr["tramite_que_solicita"].ToString();
                    txtClaveSolicitud.Text = dr["id"].ToString();
                    txtApaterno.Text = dr["ap_paterno"].ToString();
                    txtAMaterno.Text = dr["ap_materno"].ToString();
                    txtNombres.Text = dr["nombre"].ToString();
                    txtCalleNumero.Text = dr["calle_numero"].ToString();
                    txtColonia.Text = dr["colonia"].ToString();
                    cboMunicipio.Value = dr["nombreMunicipio"].ToString();
                    cboLocalidad.Value = dr["idLocalidad"].ToString();
                    txtTelLocal.Text = dr["telefono_local"].ToString();
                    txtTelCelular.Text = dr["telefono_celular"].ToString();
                    txtCorreoElectronico.Text = dr["email"].ToString();
                    folio_pago.Text = dr["folio_finanzas"].ToString();
                    cboProfesion.Value = dr["clave_profesion"].ToString();
                    cboEgresado.Value = dr["egresado_de"].ToString();
                    if (dr["fecha_titulo"] != DBNull.Value)
                    {
                        dtFechaTitulo.Date = Convert.ToDateTime(dr["fecha_titulo"]);
                    }
                    if (dr["fecha_cedula"] != DBNull.Value)
                    {
                        dtFechaCedula.Date = Convert.ToDateTime(dr["fecha_cedula"]);
                    }
                    txtCedula.Text = txtCedula.Text.Trim();
                    ASPxLabel1.Text = txtCedula.Value.ToString();
                    txtCursos.Text = dr["cursos"].ToString();
                    cboColegio.Value = dr["colegio"].ToString();

                    if (dr["tramite_que_solicita"].ToString() == "1")
                    {
                        doc_registro.Visible = true;
                        cargagrids_registros();
                    }
                    else if (dr["tramite_que_solicita"].ToString() == "2")
                    {
                        doc_revalida.Visible = true;
                        carga_revalidacion();
                    }
                    else if (dr["tramite_que_solicita"].ToString() == "3")
                    {
                        RevaRecla.Visible = true;
                        carga_revaliclas();
                    }
                    else if (dr["tramite_que_solicita"].ToString() == "4")
                    {
                        reclasifica.Visible = true;
                        carga_reclas();
                    }
                    else if (dr["tramite_que_solicita"].ToString() == "5")
                    {
                        ReponCrede.Visible = true;
                        carga_crede();
                    }
                    
                    if (dr["notasfecha"] != DBNull.Value)
                    {
                        txtObservacionesDictamen.Text = dr["notasfecha"].ToString();
                    }
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = "No contiene la documentación completa";
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        protected void carga_reclas()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Documents/D_Recla/Solicitud/" + ASPxLabel1.Text));
            FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);
            GridView18.DataSource = fileInfo;
            GridView18.DataBind();
            DirectoryInfo dirInfo3 = new DirectoryInfo(Server.MapPath("~/Documents/D_Recla/Credencial/" + ASPxLabel1.Text));
            FileInfo[] fileInfo3 = dirInfo3.GetFiles("*.*", SearchOption.AllDirectories);
            GridView20.DataSource = fileInfo3;
            GridView20.DataBind();
            DirectoryInfo dirInfo4 = new DirectoryInfo(Server.MapPath("~/Documents/D_Recla/Oficios/" + ASPxLabel1.Text));
            FileInfo[] fileInfo4 = dirInfo4.GetFiles("*.*", SearchOption.AllDirectories);
            GridView21.DataSource = fileInfo4;
            GridView21.DataBind();
            DirectoryInfo dirInfo5 = new DirectoryInfo(Server.MapPath("~/Documents/D_Recla/Cursos/" + ASPxLabel1.Text));
            FileInfo[] fileInfo5 = dirInfo5.GetFiles("*.*", SearchOption.AllDirectories);
            GridView22.DataSource = fileInfo5;
            GridView22.DataBind();
            DirectoryInfo dirInfo6 = new DirectoryInfo(Server.MapPath("~/Documents/D_Recla/CV/" + ASPxLabel1.Text));
            FileInfo[] fileInfo6 = dirInfo6.GetFiles("*.*", SearchOption.AllDirectories);
            GridView23.DataSource = fileInfo6;
            GridView23.DataBind();
        }

        protected void carga_crede()
        {
            DirectoryInfo dirInfo2 = new DirectoryInfo(Server.MapPath("~/Documents/D_Credencial/Pagos/" + ASPxLabel1.Text));
            FileInfo[] fileInfo2 = dirInfo2.GetFiles("*.*", SearchOption.AllDirectories);
            GridView19.DataSource = fileInfo2;
            GridView19.DataBind();
        }

        protected void carga_revaliclas()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Documents/D_RevalidayRecla/Solicitud/" + ASPxLabel1.Text));
            FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);
            GridView12.DataSource = fileInfo;
            GridView12.DataBind();
            DirectoryInfo dirInfo2 = new DirectoryInfo(Server.MapPath("~/Documents/D_RevalidayRecla/Pagos/" + ASPxLabel1.Text));
            FileInfo[] fileInfo2 = dirInfo2.GetFiles("*.*", SearchOption.AllDirectories);
            GridView13.DataSource = fileInfo2;
            GridView13.DataBind();
            DirectoryInfo dirInfo3 = new DirectoryInfo(Server.MapPath("~/Documents/D_RevalidayRecla/Credencial/" + ASPxLabel1.Text));
            FileInfo[] fileInfo3 = dirInfo3.GetFiles("*.*", SearchOption.AllDirectories);
            GridView14.DataSource = fileInfo3;
            GridView14.DataBind();
            DirectoryInfo dirInfo4 = new DirectoryInfo(Server.MapPath("~/Documents/D_RevalidayRecla/Oficios/" + ASPxLabel1.Text));
            FileInfo[] fileInfo4 = dirInfo4.GetFiles("*.*", SearchOption.AllDirectories);
            GridView15.DataSource = fileInfo4;
            GridView15.DataBind();
            DirectoryInfo dirInfo5 = new DirectoryInfo(Server.MapPath("~/Documents/D_RevalidayRecla/Cursos/" + ASPxLabel1.Text));
            FileInfo[] fileInfo5 = dirInfo5.GetFiles("*.*", SearchOption.AllDirectories);
            GridView16.DataSource = fileInfo5;
            GridView16.DataBind();
            DirectoryInfo dirInfo6 = new DirectoryInfo(Server.MapPath("~/Documents/D_RevalidayRecla/CV/" + ASPxLabel1.Text));
            FileInfo[] fileInfo6 = dirInfo6.GetFiles("*.*", SearchOption.AllDirectories);
            GridView17.DataSource = fileInfo6;
            GridView17.DataBind();
        }

        protected void carga_revalidacion()
        {
            DirectoryInfo dirInfo4 = new DirectoryInfo(Server.MapPath("~/Documents/D_Revalida/Solicitud/" + ASPxLabel1.Text));
            FileInfo[] fileInfo4 = dirInfo4.GetFiles("*.*", SearchOption.AllDirectories);
            GridView11.DataSource = fileInfo4;
            GridView11.DataBind();
            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Documents/D_Revalida/Pagos/" + ASPxLabel1.Text));
            FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);
            GridView8.DataSource = fileInfo;
            GridView8.DataBind();
            DirectoryInfo dirInfo2 = new DirectoryInfo(Server.MapPath("~/Documents/D_Revalida/Credencial/" + ASPxLabel1.Text));
            FileInfo[] fileInfo2 = dirInfo2.GetFiles("*.*", SearchOption.AllDirectories);
            GridView9.DataSource = fileInfo2;
            GridView9.DataBind();
            DirectoryInfo dirInfo3 = new DirectoryInfo(Server.MapPath("~/Documents/D_Revalida/Oficio/" + ASPxLabel1.Text));
            FileInfo[] fileInfo3 = dirInfo3.GetFiles("*.*", SearchOption.AllDirectories);
            GridView10.DataSource = fileInfo3;
            GridView10.DataBind();
        }

        protected void cargagrids_registros()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Documents/D_Registro/Pagos/" + ASPxLabel1.Text));
            FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);
            GridView1.DataSource = fileInfo;
            GridView1.DataBind();
            DirectoryInfo dirInfo2 = new DirectoryInfo(Server.MapPath("~/Documents/D_Registro/Elector/" + ASPxLabel1.Text));
            FileInfo[] fileInfo2 = dirInfo2.GetFiles("*.*", SearchOption.AllDirectories);
            GridView2.DataSource = fileInfo2;
            GridView2.DataBind();
            DirectoryInfo dirInfo3 = new DirectoryInfo(Server.MapPath("~/Documents/D_Registro/Domicilio/" + ASPxLabel1.Text));
            FileInfo[] fileInfo3 = dirInfo3.GetFiles("*.*", SearchOption.AllDirectories);
            GridView3.DataSource = fileInfo3;
            GridView3.DataBind();
            DirectoryInfo dirInfo4 = new DirectoryInfo(Server.MapPath("~/Documents/D_Registro/Nacimiento/" + ASPxLabel1.Text));
            FileInfo[] fileInfo4 = dirInfo4.GetFiles("*.*", SearchOption.AllDirectories);
            GridView4.DataSource = fileInfo4;
            GridView4.DataBind();
            DirectoryInfo dirInfo5 = new DirectoryInfo(Server.MapPath("~/Documents/D_Registro/Vitae/" + ASPxLabel1.Text));
            FileInfo[] fileInfo5 = dirInfo5.GetFiles("*.*", SearchOption.AllDirectories);
            GridView5.DataSource = fileInfo5;
            GridView5.DataBind();
            DirectoryInfo dirInfo6 = new DirectoryInfo(Server.MapPath("~/Documents/D_Registro/Foto/" + ASPxLabel1.Text));
            FileInfo[] fileInfo6 = dirInfo6.GetFiles("*.*", SearchOption.AllDirectories);
            GridView6.DataSource = fileInfo6;
            GridView6.DataBind();
            DirectoryInfo dirInfo7 = new DirectoryInfo(Server.MapPath("~/Documents/D_Registro/Cedulas/" + ASPxLabel1.Text));
            FileInfo[] fileInfo7 = dirInfo7.GetFiles("*.*", SearchOption.AllDirectories);
            GridView7.DataSource = fileInfo7;
            GridView7.DataBind();
        }

        void obtenerRegion()
        {
            int valormun = int.Parse(cboMunicipio.Value.ToString());
            conn = new SqlConnection(strConexion);
            conn.Open();
            String cSQL = string.Format(" SELECT  " +
                "id, nombre from dbo.tblRegion as reg inner join dbo.tblRegionesMunicipios as regm on reg.Id = regm.idRegion  where idMunicipio = {0}", valormun);
            cmd = conn.CreateCommand();
            cmd.CommandText = cSQL;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                cboRegion.Value = dr["id"].ToString();
            }
            dr.Close();
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
            System.Diagnostics.Debug.WriteLine("Inicio de callback");
            try
            {
                if(cboTipoTramite.Value.ToString() == "5")
                {
                    String cSQL = "";
                    conn = new SqlConnection(strConexion);
                    conn.Open();
                    cmd = conn.CreateCommand();
                    transaction = conn.BeginTransaction();
                    cmd.Transaction = transaction;
                    cSQL = "update [dbo].[tblsolicitudes] set notasfecha = @observaciones, fecha_de_sesion= GETDATE(), status = 'SOLICITUD AUTORIZADA' where id=" + Request.QueryString[0].ToString();
                    cmd.CommandText = cSQL;
                    cmd.Parameters.AddWithValue("@observaciones", txtObservacionesDictamen.Text);
                    cmd.ExecuteNonQuery();
                    transaction.Commit();
                    enviarCorreo("aceptada");
                    e.Result = "true|Solicitud aceptada correctamente";
                }else
                {
                    String cSQL = "";
                    conn = new SqlConnection(strConexion);
                    conn.Open();
                    cmd = conn.CreateCommand();
                    transaction = conn.BeginTransaction();
                    cmd.Transaction = transaction;
                    cSQL = "update [dbo].[tblsolicitudes] set notasfecha = @observaciones, status = 'EN ASIGNACION DE FECHA' where id=" + Request.QueryString[0].ToString();
                    cmd.CommandText = cSQL;
                    cmd.Parameters.AddWithValue("@observaciones", txtObservacionesDictamen.Text);
                    cmd.ExecuteNonQuery();
                    transaction.Commit();
                    enviarCorreo("aceptada");
                    e.Result = "true|Solicitud aceptada correctamente";
                }
                
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("antes del rollback");
                e.Result = "false|Datos no agregados";
                transaction.Rollback();
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

        protected void cbRechazar_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            System.Diagnostics.Debug.WriteLine("Inicio de callback");
            try
            {
                
                String cSQL = "";
                conn = new SqlConnection(strConexion);
                conn.Open();
                cmd = conn.CreateCommand();
                transaction = conn.BeginTransaction();
                cmd.Transaction = transaction;

                System.Diagnostics.Debug.WriteLine("ya encontro el id registro");
                cSQL = "update [dbo].[tblsolicitudes] set notasfecha = @observaciones, status = 'EN RECEPCION DE DOCUMENTOS' where id=" + Request.QueryString[0].ToString();
                cmd.CommandText = cSQL;
                cmd.Parameters.AddWithValue("@observaciones", txtObservacionesDictamen.Text);
                cmd.ExecuteNonQuery();
                transaction.Commit();
                enviarCorreo("rechazada");
                e.Result = "true|Datos agregados correctamente";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("antes del rollback");
                e.Result = "false|Datos no agregados";
                transaction.Rollback();
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

        protected void callpanelLocalidad_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cboLocalidad.DataBind();
        }

        protected void enviarCorreo(String procedio)
        {
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtCorreoElectronico.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Cambio de estatus de solicitud";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                        "Usuario = " + txtCorreoElectronico.Text + "<br/>" +
                        "Tramite Solicitado = " + cboTipoTramite.Text + "<br/>" +
                        "Notas = " + txtObservacionesDictamen.Text + "<br/>" +
                        "Documentación "+procedio+ "<br/>" +
                        "Inicie sesion continuar con el proceso";
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
                    Response.Redirect("asignador.aspx", false);
                }
            }
        }
    }
}