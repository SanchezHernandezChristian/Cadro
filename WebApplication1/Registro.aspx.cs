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
using WebApp;
using WebApp.Code;

namespace WebApplication1
{
    public partial class WebForm1 : PageBase
    {
        Correo c = new Correo();

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

        protected void cboEgresado_DataBinding(object sender, EventArgs e)
                {
                   
                }


        protected void cbSolicitud_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
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
                        cmd.CommandText = " select * from tblPadronDRO where cedula='" + txtCedula.Text + "'";
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            isRegistrado = true;
                        }
                        reader.Close();
                        if (isRegistrado == false)
                        {
                            InfDRO objInfDRO = new InfDRO();
                            cSQL = " insert into IdRegistros (fecha) values(getdate()); select scope_identity();";
                            cmd.CommandText = cSQL;
                            var folioRegistro = cmd.ExecuteScalar();
                            cmd.Parameters.Clear();
                            cSQL = " insert into tblPadronDRO ( " + "  cedula " + " ,Idregistro  " + " ,clasificacion " + " ,ap_paterno " +
                                       " ,ap_materno " + " ,nombre " + " ,id_profesion " + " ,calle_numero " +
                                       " ,colonia " + " ,telefono_local " + " ,telefono_celular " + " ,id_colegio " + " ,id_universidad" + " ,fecha_titulo " +
                                       " ,fecha_cedula " + " ,anio_reg_sop " + " ,cursos " + " ,email " + " ,ultima_vigencia " + " ,observaciones " + " ,FechaRegistro " +
                                       " ,FechaActualizacion " + " ,Idlocalidad " + " ,curp " + " ,rfc " +
                                       " ,nacimiento) values (@cedula,@idRegistro,@clasificacion,@aPaterno,@aMaterno,@nombres,@claveProfesion,@calle,@colonia,@telLocal,@telCelular,@colegio,@egresado,@fechaTitulo,@fechacedula,'',@cursos,@email,'',null,getdate(),getdate(),@idLocalidad,@curp,@rfc,@nacimiento); select scope_identity()";
                            cmd.CommandText = cSQL;
                            cmd.Parameters.AddWithValue("@cedula", txtCedula.Text);
                            cmd.Parameters.AddWithValue("@idRegistro", folioRegistro.ToString());
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
                            cmd.ExecuteNonQuery();
                        }
                        /*            //Guarda la solicitud
                                     cSQL = "insert into tblsolicitudes ( " +
                                        " fecha_de_sesion " + " ,fecha_solicitud " + " ,id_PadronDRO " + " ,tramite_que_solicita " + " ,observaciones " +
                                        " ,numero_de_oficio " + " ,fecha_de_oficio " + " ,status " + " ,fecha_de_entrega_de_licencia " + " ,cedula " +
                                        " ,entregado_por) values (null,getdate(),'',@tramiteSolicita,null,null,null,'EN ASIGNACION DE FECHA',null,@cedula,null); select scope_identity();";
                                     cmd.CommandText = cSQL;
                                     cmd.Parameters.Clear();
                                     //     ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('" + "inicio insercion en solicitudes" + "');", true);
                                     cmd.Parameters.AddWithValue("@idRegistro", folioRegistro.ToString());
                                     cmd.Parameters.AddWithValue("@tramiteSolicita", cboTipoTramites.Value.ToString());
                                     cmd.Parameters.AddWithValue("@cedula", txtCedula.Text);
                                     var folio = cmd.ExecuteScalar(); /*    */
                                     transaction.Commit();
                                     Solicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada con folio " + txtCedula.ToString();  
                        break;
                }
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                Solicitud.JSProperties["cp_Resultado"] = "false|" + ex.Message;
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
            string path = Path.Combine(Server.MapPath("~/Documents/Cedulas"), txtCedula.Text);
            Directory.CreateDirectory(path);


            if (FileUpload1.HasFile)
            {
                string fullPath = Path.Combine(Server.MapPath("~/Documents/Cedulas/" + txtCedula.Text), FileUpload1.FileName);
                FileUpload1.SaveAs(fullPath);
            }
        }

        protected void Solicitud_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
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
                        cmd.CommandText = " select * from tblPadronDRO where cedula='" + txtCedula.Text + "'";
                        SqlDataReader reader = cmd.ExecuteReader();
                        while (reader.Read())
                        {
                            isRegistrado = true;
                        }
                        reader.Close();
                        if (isRegistrado == false)
                        {
                            InfDRO objInfDRO = new InfDRO();
                            cSQL = " insert into IdRegistros (fecha) values(getdate()); select scope_identity();";
                            cmd.CommandText = cSQL;
                            var folioRegistro = cmd.ExecuteScalar();
                            cmd.Parameters.Clear();
                          //  int idPersona;
                            cSQL = " insert into tblPadronDRO ( " + "  cedula " + " ,Idregistro  " + " ,clasificacion " + " ,ap_paterno " +
                                       " ,ap_materno " + " ,nombre " + " ,id_profesion " + " ,calle_numero " +
                                       " ,colonia " + " ,telefono_local " + " ,telefono_celular " + " ,id_colegio " + " ,id_universidad" + " ,fecha_titulo " +
                                       " ,fecha_cedula " + " ,anio_reg_sop " + " ,cursos " + " ,email " + " ,ultima_vigencia " + " ,observaciones " + " ,FechaRegistro " +
                                       " ,FechaActualizacion " + " ,Idlocalidad " + " ,curp " + " ,rfc " +
                                       " ,nacimiento) output inserted.id values (@cedula,@idRegistro,@clasificacion,@aPaterno,@aMaterno,@nombres,@claveProfesion,@calle,@colonia,@telLocal,@telCelular,@colegio,@egresado,@fechaTitulo,@fechacedula,'',@cursos,@email,'',null,getdate(),getdate(),@idLocalidad,@curp,@rfc,@nacimiento); select scope_identity()";
                            cmd.CommandText = cSQL;
                            cmd.Parameters.AddWithValue("@cedula", txtCedula.Text);
                            cmd.Parameters.AddWithValue("@idRegistro", folioRegistro.ToString());
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
                            //cmd.ExecuteNonQuery();
                            // int idPersona = cmd.ExecuteNonQuery();
                            var idPersona = cmd.ExecuteScalar();
                            cmd.Parameters.Clear();
                            //Guarda la solicitud
                            cSQL = "insert into tblsolicitudes ( " +
                               " fecha_de_sesion " + " ,fecha_solicitud " + " ,id_PadronDRO " + " ,tramite_que_solicita " + " ,observaciones " +
                               " ,numero_de_oficio " + " ,fecha_de_oficio " + " ,status " + " ,fecha_de_entrega_de_licencia " +
                               " ,entregado_por) values (null,getdate(),@idRegister,@tramiteSolicita,null,null,null,'EN ASIGNACION DE FECHA',null,null); select scope_identity();";
                            cmd.CommandText = cSQL;
                       //     cmd.Parameters.Clear();
                            //     ClientScript.RegisterStartupScript(GetType(), "Message", "notificacion('" + "inicio insercion en solicitudes" + "');", true);
                            cmd.Parameters.AddWithValue("@idRegister", idPersona);
                            cmd.Parameters.AddWithValue("@tramiteSolicita", cboTipoTramites.Value.ToString());
                            var folio = cmd.ExecuteScalar();
                            Solicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada con folio " + folio.ToString();
                        }
                        transaction.Commit();
                        //Solicitud.JSProperties["cp_Resultado"] = "true|Solicitud generada correctamente ";
                        break;
                }
            }
            catch (Exception ex)
            {
                transaction.Rollback();
                Solicitud.JSProperties["cp_Resultado"] = "false|" + ex.Message;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }
    }
}