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
    public partial class asignacionFecha : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Session["InfoUsuario2"] != null && Session["rol"].ToString() == "ASIGNADOR")
            //{
            //    InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
            //    (Master.FindControl("lblNombreUsuario") as DevExpress.Web.ASPxLabel).Text = objInfUsuario.Nombre;
            //}
            //else
            //{
            //    Response.Redirect("default.aspx", false);
            //}
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
                    /*       if (dr["IdRegistro"] != DBNull.Value)
                           {
                               txtCedula.Text = dr["IdRegistro"].ToString();
                           }  */
                    txtAnioRegistro.Text = dr["anio_registro_sop"].ToString();
                    cboClasificacion.Value = dr["clasifica"].ToString();
                    cboClaveProfesion.Value = dr["prof.abreviatura_de_profesion as clave_profesion"].ToString();
                    //if (cboTipoTramite.Text == "Reclasificación" ) {
                    //    cboClasificacion.ClientEnabled = true;
                    //}
                }
                dr.Close();

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
      " , p.ap_paterno " +
      " , p.ap_materno " +
      " , p.nombre " +
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
      " , p.colonia " +
      " , p.telefono_local " +
      " , p.telefono_celular " +
      //" , (isnull(p.clasificacion, ' ') + '-' + isnull(p.idRegistro, ' ') + '-' + isnull(prof.abreviatura_de_profesion, ' ')) as registroDRO " +
      " , s.notasfecha " +
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
                    cboProfesion.Value = dr["clave_profesion"].ToString();
                    cboEgresado.Value = dr["egresado_de"].ToString();
                    txtAnioRegistro.Text = dr["anio_reg_sop"].ToString();
                    cbTramiteSolicita.Value = dr["tramite_que_solicita"].ToString();
                    if (dr["fecha_titulo"] != DBNull.Value)
                    {
                        dtFechaTitulo.Date = Convert.ToDateTime(dr["fecha_titulo"]);
                    }
                    if (dr["fecha_cedula"] != DBNull.Value)
                    {
                        dtFechaCedula.Date = Convert.ToDateTime(dr["fecha_cedula"]);
                    }
                    txtCursos.Text = dr["cursos"].ToString();
                    cboColegio.Value = dr["colegio"].ToString();
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
                        cbTramiteSolicita.Value = dr["tramite_que_solicita"].ToString();
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
                txtCedula.Text = txtCedula.Text.Trim();
                ASPxLabel1.Text = txtCedula.Value.ToString();
                cargagrids();
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

        protected void cargagrids()
        {
            DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Documents/Pagos/" + ASPxLabel1.Text));
            FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);
            GridView1.DataSource = fileInfo;
            GridView1.DataBind();
            DirectoryInfo dirInfo2 = new DirectoryInfo(Server.MapPath("~/Documents/Elector/" + ASPxLabel1.Text));
            FileInfo[] fileInfo2 = dirInfo2.GetFiles("*.*", SearchOption.AllDirectories);
            GridView2.DataSource = fileInfo2;
            GridView2.DataBind();
            DirectoryInfo dirInfo3 = new DirectoryInfo(Server.MapPath("~/Documents/Domicilio/" + ASPxLabel1.Text));
            FileInfo[] fileInfo3 = dirInfo3.GetFiles("*.*", SearchOption.AllDirectories);
            GridView3.DataSource = fileInfo3;
            GridView3.DataBind();
            DirectoryInfo dirInfo4 = new DirectoryInfo(Server.MapPath("~/Documents/Nacimiento/" + ASPxLabel1.Text));
            FileInfo[] fileInfo4 = dirInfo4.GetFiles("*.*", SearchOption.AllDirectories);
            GridView4.DataSource = fileInfo4;
            GridView4.DataBind();
            DirectoryInfo dirInfo5 = new DirectoryInfo(Server.MapPath("~/Documents/Vitae/" + ASPxLabel1.Text));
            FileInfo[] fileInfo5 = dirInfo5.GetFiles("*.*", SearchOption.AllDirectories);
            GridView5.DataSource = fileInfo5;
            GridView5.DataBind();
            DirectoryInfo dirInfo6 = new DirectoryInfo(Server.MapPath("~/Documents/Foto/" + ASPxLabel1.Text));
            FileInfo[] fileInfo6 = dirInfo6.GetFiles("*.*", SearchOption.AllDirectories);
            GridView6.DataSource = fileInfo6;
            GridView6.DataBind();
            DirectoryInfo dirInfo7 = new DirectoryInfo(Server.MapPath("~/Documents/Cedulas/" + ASPxLabel1.Text));
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
            System.Diagnostics.Debug.WriteLine("Inicio de callback");
            try
            {
                if (dtFechaTitulo.Date == null)
                {
                    e.Result = "Debe seleccionar fecha";
                    return;
                }

                String cSQL = "";
                conn = new SqlConnection(strConexion);
                conn.Open();
                cmd = conn.CreateCommand();
                transaction = conn.BeginTransaction();
                cmd.Transaction = transaction;


                System.Diagnostics.Debug.WriteLine("ya encontro el id registro");
                cSQL = "update [dbo].[tblsolicitudes] set fecha_de_sesion = @asignar, status = 'EN ESPERA DE DICTAMEN' where id=" + Request.QueryString[0].ToString();
                cmd.CommandText = cSQL;
                
                cmd.Parameters.AddWithValue("@asignar", fsesion.Date);
                cmd.ExecuteNonQuery();
                enviarCorreo();
                transaction.Commit();
                e.Result = "true|Fecha asignada correctamente";
                
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("antes del rollback");
                e.Result = "false|Fecha no asignada";
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

        protected void enviarCorreo()
        {
            //Response.Write("<script language='javascript'>alert('inicio enviar correo')</script>");
            //Envia el correo
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtCorreoElectronico.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Asignación de fecha para solicitud";
            mail.Bcc.Add("yarielsilva54@gmail.com");
            //mail.Bcc.Add("ismaelgomezvelasco@outlook.com");
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                        "Usuario = " + txtCorreoElectronico.Text + "<br/>" +
                        "Tramite Solicitado = " + cboTipoTramite.Text + "<br/>" +
                        "Fecha de asignación = " + fsesion.Date.ToString("dd/MM/yyyy") + "<br/>" +
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

        protected void fsesion_Init(object sender, EventArgs e)
        {
            fsesion.MinDate = DateTime.Now;
        }
    }
}