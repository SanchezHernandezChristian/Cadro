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
using WebApp;
using WebApp.Code;

namespace WebApplication1
{
    public partial class DictamenSolicitud : PageBase
    {
        Correo c = new Correo();
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    // LoadData();
                    try
                    {
                        conn = new SqlConnection(strConexion);
                        conn.Open();
                        String cSQL = string.Format(" SELECT  " +
              " Id " +
              " ,FileName " +
              " ,FileLocation " +
          " FROM Documentos" +
          " where FileName = '" + txtCedula.Text + "'");
                        cmd = conn.CreateCommand();
                        cmd.CommandText = cSQL;
                        SqlDataReader drR = cmd.ExecuteReader();
                        DataTable dt = new DataTable();
                        dt.Load(drR);
                        GridView1.DataSource = dt;
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
                    ObtenerInformacion(long.Parse(Request.QueryString[0]));
                }
            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = ex.Message;
            }
        }


        void ObtenInformacion(string cedulaProfesional)
        {
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format("select top 1 * from [tblPadronDRO] where Cedula_Profesional='{0}' ", cedulaProfesional);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {

                    txtApaterno.Text = dr["apellido_paterno"].ToString();
                    txtAMaterno.Text = dr["apellido_materno"].ToString();
                    txtNombres.Text = dr["nombres"].ToString();
                    txtCalleNumero.Text = dr["calle_numero"].ToString();
                    txtColonia.Text = dr["colonia"].ToString();
                    cboMunicipio.Value = dr["municipio"].ToString();
                    cboLocalidad.Value = dr["Idlocalidad"].ToString();
                    cboRegion.Text = dr["region"].ToString();
                    txtTelLocal.Text = dr["telefono_local"].ToString();
                    txtTelCelular.Text = dr["telefono_celular"].ToString();
                    txtCorreoElectronico.Text = dr["email"].ToString();
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
                    cboColegio.Value = dr["colegio"].ToString();
                    txtCursos.Text = dr["cursos"].ToString();
                    if (dr["IdRegistro"] != DBNull.Value)
                    {
                        txtCedula.Text = dr["IdRegistro"].ToString();
                    }
                    txtAñoRegistro.Text = dr["anio_registro_sop"].ToString();
                    cboClasificacion.Value = dr["clasifica"].ToString();
                    cboClaveProfesion.Value = dr["clave_profesion"].ToString();
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
      " , p.cedula_profesional " +
      " , p.apellido_paterno " +
      " , p.apellido_materno " +
      " , p.nombres " +
      " , p.calle_numero " +
      " , p.municipio " +
      " , p.Idlocalidad " +
      " , p.region " +
      " , p.email " +
      " , p.clave_profesion " +
      " , p.egresado_de " +
      " , p.fecha_titulo " +
      " , p.fecha_cedula " +
      " , p.anio_registro_sop " +
      " , p.cursos " +
      " , p.colegio " +
      " , p.clasifica " +
      " , p.colonia " +
      " , p.telefono_local " +
      " , p.telefono_celular " +
      " , (isnull(p.clasifica, ' ') + '-' + isnull(p.idRegistro, ' ') + '-' + isnull(p.clave_profesion, ' ')) as registroDRO " +
      " , s.procede_si_no " +
      " , s.observaciones " +
      " , s.tramite_que_procede " +
      " , p.idRegistro " +
      " FROM tblsolicitudes as s " +
      " inner join tblPadronDRO as p " +
      " on s.cedula_profesional = p.cedula_profesional where s.Id ={0}", folio);
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
                    txtCedula.Text = dr["cedula_profesional"].ToString();
                    cboTipoTramite.Value = dr["tramite_que_solicita"].ToString();
                    txtClaveSolicitud.Text = dr["id"].ToString();
                    txtApaterno.Text = dr["apellido_paterno"].ToString();
                    txtAMaterno.Text = dr["apellido_materno"].ToString();
                    txtNombres.Text = dr["nombres"].ToString();
                    txtCalleNumero.Text = dr["calle_numero"].ToString();
                    txtColonia.Text = dr["colonia"].ToString();
                    cboMunicipio.Value = dr["municipio"].ToString();
                    cboLocalidad.Value = dr["Idlocalidad"].ToString();
                    cboRegion.Value = dr["region"].ToString();
                    txtTelLocal.Text = dr["telefono_local"].ToString();
                    txtTelCelular.Text = dr["telefono_celular"].ToString();
                    txtCorreoElectronico.Text = dr["email"].ToString();
                    cboProfesion.Value = dr["clave_profesion"].ToString();
                    cboEgresado.Value = dr["egresado_de"].ToString();
                    txtAñoRegistro.Text = dr["anio_registro_sop"].ToString();
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
                    cboColegio.Value = dr["colegio"].ToString();
                    if (dr["clasifica"] != DBNull.Value)
                    {
                        cboClasificacion.Value = dr["clasifica"].ToString();
                    }
                    if (dr["registroDRO"] != DBNull.Value)
                    {
                        txtRegistroDRO.Text = dr["registroDRO"].ToString();
                    }
                    if (dr["clave_profesion"] != DBNull.Value)
                    {
                        cboClaveProfesion.Value = dr["clave_profesion"].ToString();
                    }
                    if (dr["procede_si_no"] != DBNull.Value)
                    {
                        if (dr["procede_si_no"].ToString() == "S")
                        {
                            rdstatus.Text = "Autorizado";
                        }
                        else
                        {
                            rdstatus.Text = "Rechazado";
                        }
                    }
                    if (dr["tramite_que_procede"] != DBNull.Value)
                    {
                        cbTramiteProcede.Value = dr["tramite_que_procede"].ToString();
                    }
                    if (dr["observaciones"] != DBNull.Value)
                    {
                        txtObservacionesDictamen.Text = dr["observaciones"].ToString();
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
        
        protected void cboRegion_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {

            try
            {
                llenarRegiones(e.Parameter);
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
        void llenarRegiones(object idMunicipio)
        {

            if (idMunicipio != null)
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" SELECT distinct " +
                                            " regiones.Id " +
                                            " regiones.Nombre " +
                                            " FROM [tblRegionesMunicipios] as p " +
                                            " inner join[CADRO].[dbo].[tblRegion] as regiones " +
                                            " on regiones.Id = p.idRegion " +
                                            " where idMunicipio = {0}  order by Nombre", idMunicipio);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;

                SqlDataReader drR = cmd.ExecuteReader();
                while (drR.Read())
                {

                    cboRegion.Items.Add(drR["nombre"].ToString(), drR["id"].ToString());
                    cboRegion.Value = drR["id"].ToString();
                }
                conn.Close();
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
            long IdRegistro = 0;
            string statusDictamen = "";
            try
            {
                if (rdstatus.Value == null)
                {
                    e.Result = "Debe seleccionar rechazado/autorizado";
                    return;
                }

                String cSQL = "";
                conn = new SqlConnection(strConexion);
                conn.Open();
                cmd = conn.CreateCommand();
                transaction = conn.BeginTransaction();
                cmd.Transaction = transaction;
                cSQL = string.Format(" select * from tblPadronDRO where cedula_profesional='{0}'", txtCedula.Text.Trim());
                cmd.CommandText = cSQL;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader["Idregistro"] != DBNull.Value)
                    {
                        if (reader["IdRegistro"].ToString().Trim() != "")
                        {
                            IdRegistro = Convert.ToInt64(reader["IdRegistro"]);
                        }
                    }
                }
                reader.Close();

                if (IdRegistro != 0)
                {
                    cSQL = " update [tblsolicitudes]   " +
                  " set procede_si_no=@procede, observaciones=@observaciones,tramite_que_procede=@tramiteProcede,status=@status,fecha_de_sesion=getdate()  " +
                  " where Id=" + Request.QueryString[0].ToString();
                    cmd.CommandText = cSQL;
                    cmd.Parameters.Clear();
                    if (rdstatus.Text == "Autorizado")
                    {
                        cmd.Parameters.AddWithValue("@procede", "S");
                        statusDictamen = "SOLICITUD AUTORIZADA";
                        cmd.Parameters.AddWithValue("@observaciones", txtObservacionesDictamen.Text);
                        cmd.Parameters.AddWithValue("@tramiteProcede", cbTramiteProcede.Value.ToString());
                        cmd.Parameters.AddWithValue("@status", statusDictamen);
                        cmd.ExecuteNonQuery();

                        //si es una reclasificación
                        if (cboTipoTramite.Value.ToString() == "5")
                        {
                            cmd.Parameters.Clear();
                            cSQL = " update tblPadronDRO set clasifica=@clasificacion where cedula_profesional=@cedulaProfesional";
                            cmd.CommandText = cSQL;
                            cmd.Parameters.AddWithValue("@clasificacion", cboClasificacion.Value.ToString());
                            cmd.Parameters.AddWithValue("@cedulaProfesional", txtCedula.Text);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        cmd.Parameters.AddWithValue("@procede", "N");
                        statusDictamen = "SOLICITUD RECHAZADA";
                        cmd.Parameters.AddWithValue("@observaciones", txtObservacionesDictamen.Text);
                        cmd.Parameters.AddWithValue("@tramiteProcede", cbTramiteProcede.Value.ToString());
                        cmd.Parameters.AddWithValue("@status", statusDictamen);
                        cmd.ExecuteNonQuery();
                    }
                }
                else
                {
                    if (rdstatus.Text == "Autorizado")
                    {
                        cmd.Parameters.Clear();
                        cSQL = " insert into tblFoliosRegistros (fecha) values(getdate()); select scope_identity();";
                        cmd.CommandText = cSQL;
                        var folioRegistro = cmd.ExecuteScalar();
                        cmd.Parameters.Clear();
                        cSQL = " update tblPadronDRO set IdRegistro=@idRegistro,anio_registro_sop=year(getdate()) where cedula_profesional=@cedulaProfesional";
                        cmd.CommandText = cSQL;
                        cmd.Parameters.AddWithValue("@idRegistro", folioRegistro.ToString());
                        cmd.Parameters.AddWithValue("@cedulaProfesional", txtCedula.Text.Trim());
                        cmd.ExecuteNonQuery();
                    }
                    cSQL = " update [tblsolicitudes]   " +
                   " set procede_si_no=@procede, observaciones=@observaciones,tramite_que_procede=@tramiteProcede,status=@status,fecha_de_sesion=getdate()  " +
                   " where Id=" + Request.QueryString[0].ToString();
                    cmd.CommandText = cSQL;
                    cmd.Parameters.Clear();
                    if (rdstatus.Text == "Autorizado")
                    {
                        statusDictamen = "SOLICITUD AUTORIZADA";
                        cmd.Parameters.AddWithValue("@procede", "S");
                    }
                    else
                    {
                        statusDictamen = "SOLICITUD RECHAZADA";
                        cmd.Parameters.AddWithValue("@procede", "N");
                    }
                    cmd.Parameters.AddWithValue("@observaciones", txtObservacionesDictamen.Text);
                    cmd.Parameters.AddWithValue("@tramiteProcede", cbTramiteProcede.Value.ToString());
                    cmd.Parameters.AddWithValue("@status", statusDictamen);
                    cmd.ExecuteNonQuery();
                }
                transaction.Commit();
                e.Result = "Solicitud dictaminada correctamente";
            }
            catch (Exception ex)
            {
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

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            //Envia el correo
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtCorreoElectronico.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Respuesta de Solicitud";
            mail.Bcc.Add("yarielsilva54@gmail.com");
            //mail.Bcc.Add("ismaelgomezvelasco@outlook.com");
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                        "Usuario = " + txtCorreoElectronico.Text + "<br/>" +
                        "Tramite Solicitado = " + cboTipoTramite.Text + "<br/>" +
                        "Estado de trámite = " + rdstatus.Text + "<br/>" +
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

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            int rowIndex = ((GridViewRow)((sender as Control)).NamingContainer).RowIndex;
            string filelocation = GridView1.Rows[rowIndex].Cells[3].Text;
            //   string filelocation = "select FileLocation from Documents where FileName="+ txtCedula.Text +"";
            string filePath = Server.MapPath("~/" + filelocation);

            WebClient user = new WebClient();
            Byte[] FileBuffer = user.DownloadData(filePath);

            if (FileBuffer != null)
            {
                Response.ContentType = "application/pdf";
                Response.AddHeader("content-leght", FileBuffer.Length.ToString());
                Response.BinaryWrite(FileBuffer);
            }
        }

        protected void GridView1_DataBinding(object sender, EventArgs e)
        {

        }
    }
}
