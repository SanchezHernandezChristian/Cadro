using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class registros_dro : PageBase
    {
        Correo c = new Correo();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LimpiaCampos();
            }
                InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
                //(Master.FindControl("lblNombreUsuario") as DevExpress.Web.ASPxLabel).Text = objInfUsuario.Nombre;
                txtCedula.Text = objInfUsuario.cedula;
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
            dtFechaCedula.Value = null;
            dtFechaTitulo.Value = null;
        }

        void ObtenerInformacion(string cedulaProfesional)
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
      " , p.curp " +
      " , p.rfc " +
      " , p.nacimiento " +
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
                  " where cedula='{0}' ", cedulaProfesional);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    cboTipoTramites.Value = dr["tramite_que_solicita"].ToString();
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
                    if (dr["fecha_titulo"] != DBNull.Value)
                    {
                        dtFechaTitulo.Date = Convert.ToDateTime(dr["fecha_titulo"]);
                    }
                    if (dr["fecha_cedula"] != DBNull.Value)
                    {
                        dtFechaCedula.Date = Convert.ToDateTime(dr["fecha_cedula"]);
                    }
                    curp.Text = dr["curp"].ToString();
                    rfc.Text = dr["rfc"].ToString();
                    nacimiento.Text = dr["nacimiento"].ToString();
                    txtCursos.Text = dr["cursos"].ToString();
                    cboColegio.Value = dr["colegio"].ToString();
                    txtAñoRegistro.Text= dr["anio_reg_sop"].ToString();
                    txtRegistro.Text= dr["id_PadronDRO"].ToString();
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
                }
                dr.Close();
                //clasificación
                if (cboTipoTramites.Value.ToString() == "5")
                {
                    cboClasificacion.ClientEnabled = true;
                    cboClasificacion.ValidationSettings.CausesValidation = true;
                    cboClasificacion.ValidationSettings.ErrorTextPosition = DevExpress.Web.ErrorTextPosition.Left;
                    cboClasificacion.ValidationSettings.RequiredField.IsRequired = true;
                    cboClasificacion.ValidationSettings.RequiredField.ErrorText = "*";

                }
                txtCedula.Text = txtCedula.Text.Trim();
                ASPxLabel1.Text = txtCedula.Value.ToString();
                DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Documents/Cedulas/" + ASPxLabel1.Text));
                FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);
                GridView1.DataSource = fileInfo;
                GridView1.DataBind();
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

        void validarFechaSesion()
        {
            conn = new SqlConnection(strConexion);
            conn.Open();
            try
            {
                cmd = conn.CreateCommand();
                cmd.CommandText = string.Format(" SELECT " +
                                   " s.id " +
                         " , fecha_solicitud " +
                            " , fecha_de_sesion " +
                            " , tramite_que_solicita " +
                            " , p.cedula " +
                            " FROM tblsolicitudes as s " +
      " inner join tblPadronDRO as p " +
      " on s.id_PadronDRO = p.Id " +
                                  " where p.cedula = '{0}' order by id desc ", txtCedula.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader["fecha_de_sesion"] == DBNull.Value)
                    {
                        btnGuardar.ClientVisible = false;

                        //ClientScript.RegisterStartupScript(GetType(), "Message", "noterror('" + "No puede generar una nueva solicitud, si su última solicitud aún no ha sido dictaminada." + "', 'solicitante.aspx'); ", true);
                        //noterror("No puede generar una nueva solicitud, si su última solicitud aún no ha sido dictaminada.", "solicitante.aspx");
                        lblMensajeError.Text = "No puede generar una nueva solicitud, porque usted tiene una solicitud pendiente";
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

        protected void cbValidar_Callback(object source, DevExpress.Web.CallbackEventArgs e)
        {
            bool existeRegistro = false;
            conn = new SqlConnection(strConexion);
            conn.Open();
            try
            {
                String cSQL = string.Format(" SELECT  s.id,  s.status , fecha_solicitud  , fecha_de_sesion  , tramite_que_solicita  , p.cedula  "+
 " FROM tblsolicitudes as s  inner join tblPadronDRO as p  on s.id_PadronDRO = p.Id  " +
 " where s.id = (SELECT MAX(s.id) FROM tblsolicitudes as s inner join tblPadronDRO as p  on s.id_PadronDRO = p.Id where p.cedula = '{0}')", txtCedula.Text.Trim());

                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader["fecha_de_sesion"] == DBNull.Value)
                    {
                        btnGuardar.ClientVisible = false;
                        e.Result = "false| No puede generar una nueva solicitud, porque usted tiene una solicitud pendiente";
                    }
                    else
                    {
                        existeRegistro = true;
                        btnGuardar.ClientVisible = true;
                        break;
                    }
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

             /*    if (existeRegistro == true)
                {
                    if (reader["fecha_de_sesion"] == DBNull.Value)
                    {
                        btnGuardar.ClientVisible = false;
                        e.Result = "false| No puede generar una nueva solicitud, porque usted tiene una solicitud pendiente";
                    }
                    else
                    {
                        btnGuardar.ClientVisible = true;
                    }
                    return;
                }  */

                if (existeRegistro == false)
                {
                    e.Result = "false| No puede generar una nueva solicitud, porque usted tiene una solicitud pendiente";
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
            string path = Path.Combine(Server.MapPath("~/Documents/Cedulas"), txtCedula.Text);
            Directory.CreateDirectory(path);
        }

        protected void enviarCorreo()
        {
            //Envia el correo
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtCorreoElectronico.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Trámite realizado correctamente";
            mail.Bcc.Add("yarielsilva54@gmail.com");
            //mail.Bcc.Add("ismaelgomezvelasco@outlook.com");
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "Nombre de DRO = " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
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
                    Response.Redirect("default.aspx", false);
                }
            }
        }
        protected void Solicitud_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                String cSQL = "";
                var folio = "";
                conn = new SqlConnection(strConexion);
                conn.Open();
                transaction = conn.BeginTransaction();
                cmd = conn.CreateCommand();
                cmd.Transaction = transaction;
                switch (e.Parameter)
                {
                    case "Guardar":
                        bool isRegistrado = false;
                        int idPersona = 0;
                        ///si no se encuentra en el padrón de DRO´S se agrega  a la base                        
                        cmd.CommandText = " select * from tblPadronDRO where cedula='" + txtCedula.Text + "'";
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            isRegistrado = true;
                            idPersona = Int32.Parse(reader["id"].ToString());
                        }
                        reader.Close();
                        if (isRegistrado == true)
                        {
                            //Guarda la solicitud
                            cSQL = "insert into tblsolicitudes ( " +
                               " fecha_de_sesion " + " ,fecha_solicitud " + " ,id_PadronDRO " + " ,tramite_que_solicita " + " ,observaciones " +
                               " ,numero_de_oficio " + " ,fecha_de_oficio " + " ,status " + " ,fecha_de_entrega_de_licencia "  +
                               " ,entregado_por) values (null,getdate(),@idRegister,@tramiteSolicita,null,null,null,'EN REVISION DE DOCUMENTOS',null,null); select scope_identity();";
                            cmd.CommandText = cSQL;
                            //     cmd.Parameters.Clear();
                            //     ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('" + "inicio insercion en solicitudes" + "');", true);
                            cmd.Parameters.AddWithValue("@idRegister", idPersona);
                            cmd.Parameters.AddWithValue("@tramiteSolicita", cboTipoTramites.Value.ToString());
                            folio = cmd.ExecuteScalar().ToString();
                            cmd.Parameters.Clear();
                            // Agerega a tabla usuarios
                   /*         cSQL = "insert into tblUsuarios (Nombre,Apaterno,Amaterno,isActivado,rol,fechaRegistro,Email,Contrasena,nivel,nomUser,cedula) values(@nombre,@apaterno,@amaterno,@isactivado,@rol,getdate(),@email,@contrasena,@nivel,@usuario,@ced_pro)";
                            cmd.CommandText = cSQL;
                            cmd.Parameters.AddWithValue("@nombre", txtNombres.Text);
                            cmd.Parameters.AddWithValue("@apaterno", txtApaterno.Text);
                            cmd.Parameters.AddWithValue("@amaterno", txtAMaterno.Text);
                            cmd.Parameters.AddWithValue("@isactivado", true);
                            cmd.Parameters.AddWithValue("@rol", "CIUDADANO");
                            cmd.Parameters.AddWithValue("@email", txtCorreoElectronico.Text);
                            cmd.Parameters.AddWithValue("@contrasena", contra.Text);
                            cmd.Parameters.AddWithValue("@nivel", "1");
                            cmd.Parameters.AddWithValue("@usuario", txtNombres.Text);
                            cmd.Parameters.AddWithValue("@ced_pro", txtCedula.Text); 
                            cmd.ExecuteNonQuery();   */

                            //Solicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada con folio = " + folio.ToString();
                        }
                        transaction.Commit();
                        //enviarCorreo();
                        Solicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada correctamente con folio " + folio + "\nLa informacion ha sido enviada al correo " + txtCorreoElectronico.Text;
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
                Solicitud.JSProperties["cp_Resultado"] = "false|" + "El usuario ya se encuentra registrado o no tiene conexión. Por favor verifique.";
                System.Diagnostics.Debug.WriteLine("Error " + ex.Message);
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }


        protected void credencial_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario"] as InfUsuario;
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

        protected void pago_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario"] as InfUsuario;
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


        protected void cursos_FileUploadComplete(object sender, DevExpress.Web.FileUploadCompleteEventArgs e)
        {
            InfUsuario objInfUsuario = Session["InfoUsuario"] as InfUsuario;
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
    }
}