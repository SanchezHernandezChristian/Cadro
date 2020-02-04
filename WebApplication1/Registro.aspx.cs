using DevExpress.Web;
using Newtonsoft.Json;
using RestMembership.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using UtilsInfraestructura;
using WebApp;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class WebForm1 : PageBase
    {
        Correo c = new Correo();
        ApiService apiService;
        

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LimpiaCampos();
            }
            string nuevaContraseña = Membership.GeneratePassword(8, 1);
            Random rdn = new Random();
            nuevaContraseña = Regex.Replace(nuevaContraseña, @"[^0-9]", m => rdn.Next(1, 9).ToString());
            contra.Text = nuevaContraseña;
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
                                  " where cedula = '{0}' order by id desc ", txtCedula.Text.Trim());
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    if (reader["fecha_de_sesion"] == DBNull.Value)
                    {
                        btnGuardar.ClientVisible = false;
                        lblMensajeError.Text = "No puede generar una nueva solicitud, si su última solicitud aún no ha sido dictaminada.";
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
                String cSQL = string.Format("select top 1 * from [tblPadronDRO] where cedula='{0}' ", cedulaProfesional);
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
                    }
                    txtAñoRegistro.Text = dr["anio_registro_sop"].ToString();
                    cboClasificacion.Value = dr["clasifica"].ToString();
                    txtRegistro.Text = dr["IdRegistro"].ToString();
                    cboClaveProfesion.Value = dr["clave_profesion"].ToString();
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
              //  subirarchivos();
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" select * from tblPadronDRO where cedula='{0}'", txtCedula.Text.Trim());
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
                if (existeRegistro == true)
                {
                    e.Result = "false| La cédula ya se encuentra registrada en el padrón. Inicie sesión o ingrese una cédula diferente";
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
        
        protected void subirarchivos()
        {
            string path = Path.Combine(Server.MapPath("~/Documents/Cedulas"), txtCedula.Text);
            string path2 = Path.Combine(Server.MapPath("~/Documents/Pagos"), txtCedula.Text);
            string path3 = Path.Combine(Server.MapPath("~/Documents/Elector"), txtCedula.Text);
            string path4 = Path.Combine(Server.MapPath("~/Documents/Domicilio"), txtCedula.Text);
            string path5 = Path.Combine(Server.MapPath("~/Documents/Nacimiento"), txtCedula.Text);
            string path6 = Path.Combine(Server.MapPath("~/Documents/Vitae"), txtCedula.Text);
            Directory.CreateDirectory(path);
            Directory.CreateDirectory(path2);
            Directory.CreateDirectory(path3);
            Directory.CreateDirectory(path4);
            Directory.CreateDirectory(path5);
            Directory.CreateDirectory(path6);
        }
     
        protected void enviarCorreo(string contrasenia)
        {
            //Envia el correo
            System.Net.Mail.MailMessage mail = new System.Net.Mail.MailMessage();
            mail.To.Add(txtCorreoElectronico.Text);
            mail.From = new MailAddress("cadro.sinfra@gmail.com", "CADRO", System.Text.Encoding.UTF8);
            mail.Subject = "Registro Exitoso";
            mail.Bcc.Add("yarielsilva54@gmail.com");
            //mail.Bcc.Add("ismaelgomezvelasco@outlook.com");
            mail.SubjectEncoding = System.Text.Encoding.UTF8;
            mail.Body = "<html><head></head><body>" +
                        "<img style='text - align: center; background - size: cover; max - width:200px;' src='cid:logo'>"+
                        "Nombre de DRO: " + txtNombres.Text + " " + txtApaterno.Text + " " + txtAMaterno.Text + "<br/>" +
                        "Usuario: " + txtCorreoElectronico.Text + "<br/>" +
                        "Contraseña: " + contrasenia + "<br/>" +
                        "Su cuenta ha sido creada correctamente. Inicie sesión con los datos anteriores"+
                        "<img style='text - xalign: center; background - size: cover; max - width:200px;' src='cid:LogoVII'/>" +
                        "</ body >" +
                        "</ html > ";
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
            User user = new User();
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
                        
                        ///si no se encuentra en el padrón de DRO´S se agrega  a la base                        
                        cmd.CommandText = " select * from tblPadronDRO where cedula='" + txtCedula.Text + "'";
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            isRegistrado = true;
                        }
                        reader.Close();
                        if (isRegistrado == false)
                        {

                            apiService = new ApiService();
                            Random r = new Random();
                            int pass = r.Next(100000, 999999); //
                            string contrasenia = System.Web.Security.Membership.GeneratePassword(6, 0); // 
                           
                            user.FullName = string.Format("{0} {1} {2}", txtNombres.Text.Trim(), txtApaterno.Text.Trim(), txtAMaterno.Text.Trim());

                            user.Email = txtCorreoElectronico.Text;
                            user.IsEmpresa = false;
                            user.IsApproved = true;
                            if (pass > 0)
                                user.Password = pass.ToString();
                            else
                                user.Password = r.Next(100000, 999999).ToString();


                            user.Roles = new List<Rol>();
                            Rol rol = new Rol();
                            rol.ApplicationName = "PII";
                            rol.RoleName = "DRO";
                            user.Roles.Add(rol);
                            var responseSeguridad = apiService.postSeguridad("Users", user);
                            if (responseSeguridad.IsSuccess)
                            {
                                var res = JsonConvert.DeserializeObject<Response>(responseSeguridad.Result.ToString());//Respuesta del Objeto Usuaruo
                                if (res.IsSuccess)
                                {
                                    var result = apiService.GetObjectSeguridad(string.Format("Users?ApplicationName=PII&UserName={0}", user.FullName.Trim()));
                                    if (result.IsSuccess)
                                    {
                                        var resUserID = JsonConvert.DeserializeObject<Response>(result.Result.ToString());
                                        System.Diagnostics.Debug.WriteLine("Error " + resUserID);
                                        if (resUserID.IsSuccess)//Respuesta obtener el ID del Usuario
                                        {
                                            InfDRO objInfDRO = new InfDRO();
                                            cSQL = " insert into tblPadronDRO ( " + "  cedula,clasificacion,ap_paterno " +
                                                       " ,ap_materno,nombre,id_profesion,calle_numero " +
                                                       " ,colonia " + " ,telefono_local " + " ,telefono_celular " + " ,id_colegio " + " ,id_universidad" + " ,fecha_titulo " +
                                                       " ,fecha_cedula " + " ,anio_reg_sop " + " ,cursos " + " ,email " + " ,ultima_vigencia " + " ,observaciones " + " ,FechaRegistro " +
                                                       " ,FechaActualizacion " + " ,Idlocalidad " + " ,curp " + " ,rfc " +
                                                       " ,nacimiento, isActivado, url) output inserted.id values (@cedula,@clasificacion,@aPaterno,@aMaterno,@nombres,@claveProfesion,@calle,@colonia,@telLocal,@telCelular,@colegio,@egresado,@fechaTitulo,@fechacedula,'',@cursos,@email,'',null,getdate(),getdate(),@idLocalidad,@curp,@rfc,@nacimiento,@activado,@url); select scope_identity()";
                                            cmd.CommandText = cSQL;
                                            cmd.Parameters.AddWithValue("@cedula", txtCedula.Text.Trim());
                                            cmd.Parameters.AddWithValue("@clasificacion", " ");
                                            cmd.Parameters.AddWithValue("@aPaterno", txtApaterno.Text);
                                            cmd.Parameters.AddWithValue("@aMaterno", txtAMaterno.Text);
                                            cmd.Parameters.AddWithValue("@nombres", txtNombres.Text);
                                            cmd.Parameters.AddWithValue("@claveProfesion", cboProfesion.Value.ToString() == null ? "" : cboProfesion.Value.ToString());
                                            cmd.Parameters.AddWithValue("@calle", txtCalleNumero.Text);
                                            cmd.Parameters.AddWithValue("@colonia", txtColonia.Text);
                                            cmd.Parameters.AddWithValue("@telLocal", txtTelLocal.Text);
                                            cmd.Parameters.AddWithValue("@telCelular", txtTelCelular.Text);
                                            cmd.Parameters.AddWithValue("@colegio", cboColegio.Value.ToString());
                                            cmd.Parameters.AddWithValue("@egresado", cboEgresado.Value.ToString());

                                            if (dtFechaTitulo.Date == null)
                                            {
                                                cmd.Parameters.AddWithValue("@fechaTitulo", DBNull.Value);
                                            }
                                            else
                                            {
                                                cmd.Parameters.AddWithValue("@fechaTitulo", dtFechaTitulo.Date);
                                            }
                                            if (dtFechaCedula.Date == null)
                                            {
                                                cmd.Parameters.AddWithValue("@fechaCedula", DBNull.Value);
                                            }
                                            else
                                            {
                                                cmd.Parameters.AddWithValue("@fechaCedula", dtFechaCedula.Date);
                                            }
                                            cmd.Parameters.AddWithValue("@cursos", txtCursos.Text);
                                            cmd.Parameters.AddWithValue("@email", txtCorreoElectronico.Text);
                                            cmd.Parameters.AddWithValue("@idLocalidad", cboLocalidad.Value.ToString());
                                            cmd.Parameters.AddWithValue("@curp", curp.Text);
                                            cmd.Parameters.AddWithValue("@rfc", rfc.Text);
                                            cmd.Parameters.AddWithValue("@nacimiento", nacimiento.Text);
                                            cmd.Parameters.AddWithValue("@activado", false);
                                            cmd.Parameters.AddWithValue("@url", "pii.oaxaca.gob.mx/dro/datos_dro?cedula=" + txtCedula.Text.Trim());
                                            //cmd.ExecuteNonQuery();
                                            // int idPersona = cmd.ExecuteNonQuery();
                                            var idPersona = cmd.ExecuteScalar();
                                            cmd.Parameters.Clear();
                                            //Guarda la solicitud
                                            cSQL = "insert into tblsolicitudes ( " +
                                               " fecha_de_sesion " + " ,fecha_solicitud " + " ,id_PadronDRO " + " ,tramite_que_solicita " +
                                               " ,numero_de_oficio " + " ,fecha_de_oficio " + " ,status " + " ,fecha_de_entrega_de_licencia " +
                                               " ,entregado_por, observaciones, correo_votantes) values (null,getdate(),@idRegister,'1',null,null,'EN RECEPCION DE DOCUMENTOS',null,null,'',''); select scope_identity();";

                                            cmd.CommandText = cSQL;
                                            //     cmd.Parameters.Clear();
                                            //     ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('" + "inicio insercion en solicitudes" + "');", true);
                                            cmd.Parameters.AddWithValue("@idRegister", idPersona);

                                            folio = cmd.ExecuteScalar().ToString();

                                            cmd.Parameters.Clear();
                                            // Agerega a tabla usuarios
                                            cSQL = "insert into tblUsuarios (Nombre,Apaterno,Amaterno,isActivado,rol,fechaRegistro,Email,Contrasena,nivel,nomUser,cedula) values(@nombre,@apaterno,@amaterno,@isactivado,@rol,getdate(),@email,@contrasena,@nivel,@usuario,@ced_pro)";
                                            cmd.CommandText = cSQL;
                                            cmd.Parameters.AddWithValue("@nombre", txtNombres.Text);
                                            cmd.Parameters.AddWithValue("@apaterno", txtApaterno.Text);
                                            cmd.Parameters.AddWithValue("@amaterno", txtAMaterno.Text);
                                            cmd.Parameters.AddWithValue("@isactivado", true);
                                            cmd.Parameters.AddWithValue("@rol", "CIUDADANO");
                                            cmd.Parameters.AddWithValue("@email", txtCorreoElectronico.Text);
                                            cmd.Parameters.AddWithValue("@contrasena", "");
                                            cmd.Parameters.AddWithValue("@nivel", "1");
                                            cmd.Parameters.AddWithValue("@usuario", resUserID.Message);
                                            cmd.Parameters.AddWithValue("@ced_pro", txtCedula.Text);
                                            cmd.ExecuteNonQuery();
                                            transaction.Commit();
                                            enviarCorreo(user.Password);
                                            Solicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada correctamente con folio " + folio + "\nLa informacion ha sido enviada al correo " + txtCorreoElectronico.Text;
                                        }
                                    }
                                    else
                                    {
                                        Solicitud.JSProperties["cp_Resultado"] = "false|" + result.Message;
                                    }
                                }
                                else
                                {
                                    Solicitud.JSProperties["cp_Resultado"] = "false|" + res.Message ;
                                }
                            }
                            else
                            {
                                Solicitud.JSProperties["cp_Resultado"] = "false|" + responseSeguridad.Message;
                            }
                            //Solicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada con folio = " + folio.ToString();
                        }
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
        protected void dtFechaTitulo_Init(object sender, EventArgs e)
        {
            dtFechaTitulo.MaxDate = DateTime.Now;
        }
        protected void dtFechaCedula_Init(object sender, EventArgs e)
        {
            dtFechaCedula.MaxDate = DateTime.Now;
        }
    }
}