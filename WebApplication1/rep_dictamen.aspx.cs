using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class rep_dictamen : PageBase
    {
        Correo c = new Correo();
        protected void Page_Load(object sender, EventArgs e)
        {
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
                  " where s.Id ={0}", folio);
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
                    cboProfesion.Value = dr["clave_profesion"].ToString();
                    cboEgresado.Value = dr["egresado_de"].ToString();
                    txtAñoRegistro.Text = dr["anio_reg_sop"].ToString();
                    cbTramiteProcede.Value = dr["tramite_que_solicita"].ToString();
                    if (dr["fecha_titulo"] != DBNull.Value)
                    {
                        dtFechaTitulo.Date = Convert.ToDateTime(dr["fecha_titulo"]);
                    }
                    if (dr["fecha_cedula"] != DBNull.Value)
                    {
                        dtFechaCedula.Date = Convert.ToDateTime(dr["fecha_cedula"]);
                    }
                    txtCursos.Text = dr["cursos"].ToString();
                    rdstatus.Value = dr["status"].ToString();
                    cboColegio.Value = dr["colegio"].ToString();
                    txtObservacionesDictamen.Text= dr["observaciones"].ToString();
                    if (dr["clasificacion"] != DBNull.Value)
                    {
                        cboClasificacion.Value = dr["clasificacion"].ToString();
                    }
                    //if (dr["registroDRO"] != DBNull.Value)
                    //{
                    //    txtRegistroDRO.Text = dr["registroDRO"].ToString();
                    //}
                    if (dr["clave_profesion"] != DBNull.Value)
                    {
                        cboClaveProfesion.Value = dr["clave_profesion"].ToString();
                    }

                    if (dr["tramite_que_solicita"] != DBNull.Value)
                    {
                        cbTramiteProcede.Value = dr["tramite_que_solicita"].ToString();
                    }

                }
                dr.Close();
                //clasificación
                if (cboTipoTramite.Value.ToString() == "5")
                {
                    cboClasificacion.ClientEnabled = true;
                    cboClasificacion.ValidationSettings.CausesValidation = true;
                    cboClasificacion.ValidationSettings.ErrorTextPosition = DevExpress.Web.ErrorTextPosition.Left;
                    cboClasificacion.ValidationSettings.RequiredField.IsRequired = true;
                    cboClasificacion.ValidationSettings.RequiredField.ErrorText = "*";

                }

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
                //this.Page.Response.Write("<script language='JavaScript'>window.alert('" + dr["id"] + "');</script>");
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
                String cSQL = "";
                Double votos, totalvotantes, divisionvotos = 0;
                conn = new SqlConnection(strConexion);
                conn.Open();
                cmd = conn.CreateCommand();
                cSQL = "select votos, registrovotos from tblsolicitudes where Id =" + Request.QueryString[0].ToString();
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    votos = Double.Parse(dr["votos"].ToString());
                    totalvotantes = Double.Parse(dr["registrovotos"].ToString());
                    divisionvotos = totalvotantes / 2;
                    if (votos > divisionvotos)
                    {
                        try
                        {
                            conn = new SqlConnection(strConexion);
                            conn.Open();
                            cmd = conn.CreateCommand();
                            transaction = conn.BeginTransaction();
                            cmd.Transaction = transaction;
                            cSQL = "update [dbo].[tblsolicitudes] set status = 'SOLICITUD AUTORIZADA' where id=" + Request.QueryString[0].ToString();
                            cmd.CommandText = cSQL;
                            cmd.ExecuteNonQuery();
                            
                            if (cboTipoTramite.Value.ToString() == "1")//registro
                            {
                                cSQL = "update [dbo].[tblPadronDRO] set ultima_vigencia = (Select year(getdate())), clasificacion = 'C', Idregistro = isnull(Idregistro, (select top 1 IdRegistro from tblPadronDRO order by IdRegistro DESC) + 1) where cedula= '" + txtCedula.Text.Trim().ToString()+"'";
                                cmd.CommandText = cSQL;
                                System.Diagnostics.Debug.WriteLine("el id prueba antes del error" + txtCedula.Text.Trim());
                                cmd.ExecuteNonQuery();
                                System.Diagnostics.Debug.WriteLine("el id prueba antes de bsuqueda" + txtCedula.Text.Trim());
                                cSQL = " select id from tblPadronDRO where cedula= '" + txtCedula.Text.Trim().ToString()+"'";
                                cmd.CommandText = cSQL;
                                var idPersona = cmd.ExecuteScalar();
                                System.Diagnostics.Debug.WriteLine("el id " + idPersona);
                                cSQL = "INSERT INTO[dbo].[tblFoliosRegistros]([id_PadronDRO],[fecha])VALUES(@id,getdate());";
                                cmd.CommandText = cSQL;
                                cmd.Parameters.AddWithValue("@id", idPersona);
                                cmd.ExecuteNonQuery();
                            }else if(cboTipoTramite.Value.ToString() == "2")//revalidacion
                            {
                                cSQL = "update [dbo].[tblPadronDRO] set ultima_vigencia = (Select year(getdate())) where cedula= '" + txtCedula.Text.Trim().ToString() + "'";
                                cmd.CommandText = cSQL;
                                cmd.ExecuteNonQuery();
                            }else if (cboTipoTramite.Value.ToString() == "3")//revalidacion con reclasificacion
                            {
                                cSQL = " select folio_solicitud from tblSolicitudes where id=" + Request.QueryString[0].ToString();
                                cmd.CommandText = cSQL;
                                var nueva_clasi = cmd.ExecuteScalar();
                                cSQL = "update [dbo].[tblPadronDRO] set ultima_vigencia = (Select year(getdate())), clasificacion = @nueva_clasificacion where cedula= '" + txtCedula.Text.Trim().ToString() + "'";
                                cmd.Parameters.AddWithValue("@nueva_clasificacion", nueva_clasi);
                                cmd.CommandText = cSQL;
                                cmd.ExecuteNonQuery();
                            }
                            else
                            {
                                cSQL = " select folio_solicitud from tblSolicitudes where id=" + Request.QueryString[0].ToString();
                                cmd.CommandText = cSQL;
                                var nueva_clasi = cmd.ExecuteScalar();
                                cSQL = "update [dbo].[tblPadronDRO] set clasificacion = @nueva_clasificacion where cedula= '" + txtCedula.Text.Trim().ToString() + "'";
                                cmd.Parameters.AddWithValue("@nueva_clasificacion", nueva_clasi);
                                cmd.CommandText = cSQL;
                                cmd.ExecuteNonQuery();
                            }
                            
                            transaction.Commit();
                            enviarCorreo();
                            e.Result = "true|Solicitud dictaminada correctamente";

                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            System.Diagnostics.Debug.WriteLine("el error " + ex);
                            e.Result = "false|No se pudo realizar" ;
                        }
                        
                    }
                    else
                    {
                        try
                        {
                            conn = new SqlConnection(strConexion);
                            conn.Open();
                            cmd = conn.CreateCommand();
                            transaction = conn.BeginTransaction();
                            cmd.Transaction = transaction;
                            cSQL = "update [dbo].[tblsolicitudes] set status = 'SOLICITUD RECHAZADA' where id=" + Request.QueryString[0].ToString();
                            cmd.CommandText = cSQL;
                            cmd.ExecuteNonQuery();
                            transaction.Commit();
                            enviarCorreo();
                            e.Result = "true|Solicitud dictaminada correctamente";
                        }
                        catch (Exception ex)
                        {
                            transaction.Rollback();
                            e.Result = "false|No se pudo realizar" ;
                        }
                    }
                    System.Diagnostics.Debug.WriteLine("votos " +votos+ " votos totales " + totalvotantes );
                    System.Diagnostics.Debug.WriteLine("Resultado" + divisionvotos + "es mayor a" + votos);
                    
                }
                dr.Close();
                
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                e.Result = "false|No se pudo realizar el dictamen. Verifique los datos e intente de nuevo";
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

        protected void enviarCorreo()
        {
            //Envia el correo
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtCorreoElectronico.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Impresión de Dictamen";
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                        "Usuario = " + txtCorreoElectronico.Text + "<br/>" +
                        "Tramite Solicitado = " + cboTipoTramite.Text + "<br/>" +
                        "Estado de trámite = " + "La solicitud ha sido dictaminada. Ingrese al sitio para conocer el estatus" + "<br/>" +
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
        protected void GridView1_DataBinding(object sender, EventArgs e)
        {

        }

    }
}
