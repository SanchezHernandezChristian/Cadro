using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Code;

namespace WebApplication1
{
    public partial class Registrarse : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        void validarFechaSesion()
        {
            conn = new SqlConnection(strConexion);
            conn.Open();
            try
            {
                cmd = conn.CreateCommand();
                cmd.CommandText = string.Format(" SELECT " +
                                  " top 1 * from tblsolicitudes" +
                                  " where cedula_profesional = '{0}' order by id desc ", txtCedula.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader["fecha_de_sesion"] == DBNull.Value)
                    {
                        btnGuardar.ClientVisible = false;
                        lblMensajeError.Text = " No puede generar una nueva solicitud, si su última solicitud aún no ha sido dictaminada.";
                    }
                    else
                    {
                        btnGuardar.ClientVisible = true;
                    }
                }

            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = ex.Message;
            }
            finally
            {
                conn.Close();
            }
        }
        void llenarRegiones(object idMunicipio)
        {

            if (idMunicipio != null)
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" SELECT [Id], [Nombre] " +
                    " FROM [tblRegion] ORDER BY[Nombre] ");

                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;

                SqlDataReader drR = cmd.ExecuteReader();
                while (drR.Read())
                {

                    cboRegion.Items.Add(drR["Nombre"].ToString(), drR["Id"].ToString());
                    cboRegion.Value = drR["Id"].ToString();
                }
                conn.Close();
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

        protected void cboEgresado_DataBinding(object sender, EventArgs e)
        {
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" SELECT [Id], [NOmbre] " +
                " FROM [tblUniversidades] ORDER BY[NOmbre] ");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;

                SqlDataReader drR = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(drR);

                cboEgresado.DataSource = dt;
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



        protected void cbSolicitud_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                InfUsuario objInfUsuario = null;
                if (Session["InfoUsuario"] != null)
                {
                    objInfUsuario = Session["InfoUsuario"] as InfUsuario;
                }
                String cSQL = "";
                conn = new SqlConnection(strConexion);
                conn.Open();
                transaction = conn.BeginTransaction();
                cmd = conn.CreateCommand();
                cmd.Transaction = transaction;
                switch (e.Parameter)
                {
                    case "Guardar":
                        bool isRegistrado = false;
                        ///si no se encuentra en el padrón de DRO´S se agrega  a la base                        
                        cmd.CommandText = " select * from tblPadronDRO where cedula_profesional='" + txtCedula.Text + "'";
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            isRegistrado = true;
                        }
                        reader.Close();
                        if (isRegistrado == false)
                        {

                            InfDRO objInfDRO = new InfDRO();
                            objInfDRO.AMaterno = txtAMaterno.Text;
                            objInfDRO.AnioRegistroSOP = int.Parse(txtAñoRegistro.Text == "" ? "0" : txtAñoRegistro.Text);
                            objInfDRO.APaterno = txtApaterno.Text;
                            objInfDRO.CalleNum = txtCalleNumero.Text;
                            objInfDRO.CedulaProfesional = txtCedula.Text;
                            if (cboClasificacion.Value == null)
                            {
                                objInfDRO.Clasificacion = "";
                            }
                            else
                            {
                                objInfDRO.Clasificacion = cboClasificacion.Value.ToString();
                            }
                            objInfDRO.Colonia = txtColonia.Text;
                            objInfDRO.Correo = txtCorreoElectronico.Text;
                            objInfDRO.CursoActualizacion = txtCursos.Text;
                            objInfDRO.IdRegistro = 0;

                            if (cboProfesion.Value == null)
                            {
                                objInfDRO.ClaveProfesion = "";
                            }
                            else
                            {
                                objInfDRO.ClaveProfesion = cboProfesion.Value.ToString();
                            }
                            if (dtFechaCedula.Date.Year == 1)
                            {
                                objInfDRO.FechaCedula = null;
                            }
                            else
                            {
                                objInfDRO.FechaCedula = dtFechaCedula.Date;
                            }
                            if (dtFechaTitulo.Date.Year == 1)
                            {
                                objInfDRO.FechaTitulo = null;
                            }
                            else
                            {
                                objInfDRO.FechaTitulo = dtFechaTitulo.Date;
                            }
                            objInfDRO.IdMunicipio = int.Parse(cboMunicipio.Value.ToString());
                            objInfDRO.Municipio = cboMunicipio.Text.ToString();
                            objInfDRO.IdUniversidad = int.Parse(cboEgresado.Value.ToString());
                            objInfDRO.IdLocalidad = int.Parse(cboLocalidad.Value.ToString());
                            objInfDRO.Localidad = cboLocalidad.Text;
                            objInfDRO.Nombre = txtNombres.Text;
                            objInfDRO.Region = cboRegion.Text;
                            objInfDRO.TelCelular = txtTelCelular.Text;
                            objInfDRO.TelLocal = txtTelLocal.Text;
                            objInfDRO.Universidad = cboEgresado.Text;
                            objInfDRO.IdColegio = int.Parse(cboColegio.Value.ToString());
                            objInfDRO.IdRegion = int.Parse(cboRegion.Value.ToString());
                            cSQL = " insert into tblPadronDRO ( " +
      "  cedula_profesional " +
      " ,Idregistro  " +
      " ,clasifica " +
      " ,apellido_paterno " +
      " ,apellido_materno " +
      " ,nombres " +
      " ,clave_profesion " +
      " ,calle_numero " +
      " ,colonia " +
      " ,municipio " +
      " ,region " +
      " ,telefono_local " +
      " ,telefono_celular " +
      " ,colegio " +
      " ,egresado_de " +
      " ,fecha_titulo " +
      " ,fecha_cedula " +
      " ,anio_registro_sop " +
      " ,cursos " +
      " ,total_vigencias " +
      " ,email " +
      " ,ultima_vigencia " +
      " ,observaciones " +
      " ,url_foto " +
      " ,FechaRegistro " +
      " ,FechaActualizacion " +
      " ,IdUsuario " +
      " ,Idlocalidad " +
      " ,NombreLocalidad " +
      " ,NombreMunicipio) values (@cedula,'',@clasificacion,@aPaterno,@aMaterno,@nombres,@claveProfesion,@calle,@colonia,@municipio,@region,@telLocal,@telCelular,@colegio,@egresado,@fechaTitulo,@fechacedula,'',@cursos,0,@email,'',null,'',getdate(),getdate(),@idUsuario,@idLocalidad,@nombreLocalidad,@nombreMunicipio); select scope_identity()";


                            cmd.CommandText = cSQL;
                            cmd.Parameters.AddWithValue("@cedula", objInfDRO.CedulaProfesional);
                            cmd.Parameters.AddWithValue("@clasificacion", objInfDRO.Clasificacion);
                            cmd.Parameters.AddWithValue("@aPaterno", objInfDRO.APaterno);
                            cmd.Parameters.AddWithValue("@aMaterno", objInfDRO.AMaterno);
                            cmd.Parameters.AddWithValue("@nombres", objInfDRO.Nombre);
                            cmd.Parameters.AddWithValue("@claveProfesion", objInfDRO.ClaveProfesion == null ? "" : objInfDRO.ClaveProfesion.ToString());
                            cmd.Parameters.AddWithValue("@calle", objInfDRO.CalleNum);
                            cmd.Parameters.AddWithValue("@colonia", objInfDRO.Colonia);
                            cmd.Parameters.AddWithValue("@calleNum", objInfDRO.CalleNum);
                            cmd.Parameters.AddWithValue("@municipio", objInfDRO.IdMunicipio);
                            cmd.Parameters.AddWithValue("@nombreMunicipio", objInfDRO.Municipio);
                            cmd.Parameters.AddWithValue("@region", objInfDRO.IdRegion);
                            cmd.Parameters.AddWithValue("@telLocal", objInfDRO.TelLocal);
                            cmd.Parameters.AddWithValue("@telCelular", objInfDRO.TelCelular);

                            cmd.Parameters.AddWithValue("@colegio", objInfDRO.IdColegio);
                            cmd.Parameters.AddWithValue("@egresado", objInfDRO.IdUniversidad);
                            if (objInfDRO.FechaTitulo == null)
                            {
                                cmd.Parameters.AddWithValue("@fechaTitulo", DBNull.Value);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@fechaTitulo", objInfDRO.FechaTitulo);
                            }
                            if (objInfDRO.FechaCedula == null)
                            {
                                cmd.Parameters.AddWithValue("@fechaCedula", DBNull.Value);
                            }
                            else
                            {
                                cmd.Parameters.AddWithValue("@fechaCedula", objInfDRO.FechaCedula);
                            }
                            cmd.Parameters.AddWithValue("@cursos", objInfDRO.CursoActualizacion);
                            cmd.Parameters.AddWithValue("@email", objInfDRO.Correo);
                            cmd.Parameters.AddWithValue("@idUsuario", 0);
                            cmd.Parameters.AddWithValue("@idLocalidad", objInfDRO.IdLocalidad);
                            cmd.Parameters.AddWithValue("@nombreLocalidad", objInfDRO.Localidad);

                            cmd.ExecuteNonQuery();
                        }

                        //Guarda la solicitud
                        cSQL = " insert into tblsolicitudes ( " +
                            " fecha_de_sesion " +
                            " ,fecha_escrito " +
                            " ,fecha_solicitud " +
                            " ,folio_solicitud " +
                            " ,registro_dro " +
                            " ,tramite_que_solicita " +
                            " ,procede_si_no " +
                            " ,observaciones " +
                            " ,tramite_que_procede " +
                            " ,folio_autorizado " +
                            " ,folio_rechazado " +
                            " ,numero_de_oficio " +
                            " ,fecha_de_oficios " +
                            " ,status " +
                            " ,ultima_vigencia " +
                            " ,fecha_de_entrega_de_licencia " +
                            " ,cedula_profesional " +
                            " ,email " +
                           " ,entregado_por) values (null,null,getdate(),0,null,@tramiteSolicita,null,null,null,null,null,null,null,'EN ESPERA DE DICTAMEN',null,null,@cedulaProfesional,@correo,null); select scope_identity();";
                        cmd.CommandText = cSQL;
                        cmd.Parameters.Clear();
                        cmd.Parameters.AddWithValue("@tramiteSolicita", cboTipoTramites.Value.ToString());
                        cmd.Parameters.AddWithValue("@cedulaProfesional", txtCedula.Text);
                        cmd.Parameters.AddWithValue("@correo", txtCorreoElectronico.Text);
                        var folio = cmd.ExecuteScalar();
                        transaction.Commit();
                        cbSolicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada con folio " + folio.ToString();
                        break;

                    default:
                        LimpiaCampos();
                        validarFechaSesion();
                        //Obtiene los datos del profesionista y lo pone en los controles
                        ObtenerInformacion(txtCedula.Text);
                        cboLocalidad.DataBind();
                        llenarRegiones(cboMunicipio.Value);
                        break;
                }

            }
            catch (Exception ex)
            {
                transaction.Rollback();
                cbSolicitud.JSProperties["cp_Resultado"] = "false|" + ex.Message;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        void LimpiaCampos()
        {
            txtApaterno.Text = "";
            txtAMaterno.Text = "";
            txtNombres.Text = "";
            txtCalleNumero.Text = "";
            txtColonia.Text = "";
            cboMunicipio.Value = "";
            cboLocalidad.Value = "";
            cboRegion.Text = "";
            txtTelLocal.Text = "";
            txtTelCelular.Text = "";
            txtCorreoElectronico.Text = "";
            cboProfesion.Value = "";
            cboEgresado.Value = "";
            cboColegio.Value = "";
            txtCursos.Text = "";
            txtFolio.Text = "";
            dtFechaCedula.Value = null;
            dtFechaTitulo.Value = null;
        }

        void ObtenerInformacion(string cedulaProfesional)
        {
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" select top 1 * from [tblPadronDRO] where Cedula_Profesional='{0}' ", cedulaProfesional);
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
                        txtFolio.Text = dr["IdRegistro"].ToString();
                    }
                    txtAñoRegistro.Text = dr["anio_registro_sop"].ToString();
                    cboClasificacion.Value = dr["clasifica"].ToString();
                    txtRegistro.Text = dr["IdRegistro"].ToString();
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

        protected void cbValidar_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            try
            {
                bool existeRegistro = false;
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" select * from tblPadronDRO where cedula_Profesional='{0}'", txtCedula.Text.Trim());
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    existeRegistro = true;
                    break;
                }

                if (txtCedula.Text.Trim() == "")
                {
                    e.Result = "false|Debe ingresar la cédula profesional";
                    return;
                }
                if (cboTipoTramites.Value == null)
                {
                    e.Result = "false|Debe seleccionar el tipo de trámite";
                    return;
                }
                if (existeRegistro && (cboTipoTramites.Text == "Registro con número anterior" || cboTipoTramites.Text == "Registro"))
                {
                    e.Result = "false| La cédula ya se encuentra registrada en el padrón, puede seleccionar otro tipo de trámite.";
                    return;
                }

                if (existeRegistro == false && (cboTipoTramites.Text != "Registro con número anterior" && cboTipoTramites.Text != "Registro"))
                {
                    e.Result = "false| La cédula ingresada no existe en el padrón, primero debe registrarlo.";
                    return;
                }

                e.Result = "true|";
            }
            catch (Exception ex)
            {
                e.Result = "false|" + ex.Message;
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
            mail.Subject = "Registro Exitoso";
            mail.Bcc.Add("yarielsilva54@gmail.com");
            //mail.Bcc.Add("ismaelgomezvelasco@outlook.com");
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                       "Usuario = " + txtCorreoElectronico.Text + "<br/>" +
                       "Cedula = " + txtCedula.Text + "<br/>" +
                       "Tramite Solicitado = " + cboTipoTramites.Text + "<br/>" +
                       "Estado de trámite = " + "EN ESPERA DE ASIGNACIÓN DE FECHA PARA REVISIÓN" + "<br/>";
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
            }
        }

        protected void sube_Click(object sender, EventArgs e)
        {
            try
            {
                FlpArchivo.SaveAs(Server.MapPath("~/Documents/Cedulas/") + FlpArchivo.FileName);
                lblinformacion.Text = "El archivo " + FlpArchivo.FileName + " ha sido subido correctamente";
            }
            catch
            {
                lblinformacion.Text = "Ha ocurrido un error al intentar subir el archivo al servidor";
            }
        }
    }
}