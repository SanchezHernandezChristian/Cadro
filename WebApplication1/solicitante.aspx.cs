using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Code;

namespace WebApplication1
{
    public partial class solicitante : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (Session["InfoUsuario"] != null)
            {
                InfUsuario objInfUsuario = Session["InfoUsuario"] as InfUsuario;
                (Master.FindControl("lblNombreUsuario") as DevExpress.Web.ASPxLabel).Text = objInfUsuario.Nombre;
            }
            else
            {
                Response.Redirect("default.aspx", false);
            }
            try
            {
                InfUsuario objUser = Session["InfoUsuario"] as InfUsuario;
                correo.Text = objUser.Correo;
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" SELECT  " +
      " s.id " +
      " ,fecha_de_sesion " +
      " ,fecha_solicitud " +
      " , prof.abreviatura_de_profesion " +
      " , (p.apellido_paterno + ' ' + p.apellido_materno + ' ' + p.nombres) as nombre " +
      " , (isnull(p.clasifica, ' ') + '-' + isnull(p.idRegistro, ' ') + '-' + isnull(p.clave_profesion, ' ')) as registroDRO " +
      " , p.nombreMunicipio " +
      " , lower(p.nombreLocalidad) as nombreLocalidad " +
      " , tramites.descripcion " +
      " , prof.abreviatura_de_profesion " +
      " , s.status " +
      " , s.observaciones " +
      " , s.cedula " +
      " , s.email " +
  " FROM tblsolicitudes as s" +
  " inner join tblPadronDRO as p" +
  " on s. = p.cedula_profesional" +
  " left join tblProfesiones as prof" +
  " on prof.id_profesion = p.id_profesion" +
  " left join catalogo_de_tramites as tramites" +
  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
  " where s.email=@acepta");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                cmd.Parameters.AddWithValue("@acepta", correo.Text);
                SqlDataReader drR = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(drR);
                gvSolicitudes.DataSource = dt;
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
            gvSolicitudes.DataBind();
        }

        protected void gvSolicitudes_DataBinding(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            HttpContext.Current.Session.Clear();
            HttpContext.Current.Session.Abandon();
            HttpContext.Current.User = null;
            System.Web.Security.FormsAuthentication.SignOut(); // if forms auth is used
            Session.Abandon();
            Response.Redirect("Login.aspx", false);
        }

        protected void gvSolicitudes_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvSolicitudes.DataBind();
        }

        protected void gvSolicitudes_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            string procede = Convert.ToString(e.GetValue("status"));
            if (procede.Trim() != "")
            {
                if (procede.Trim() == "SOLICITUD AUTORIZADA")
                {
                    e.Row.BackColor = System.Drawing.Color.LightGreen;
                }
                else if (procede.Trim() == "SOLICITUD RECHAZADA")
                {
                    e.Row.BackColor = System.Drawing.Color.Salmon;
                }
                else if (procede.Trim() == "EN ESPERA DE DICTAMEN")
                {
                    e.Row.BackColor = System.Drawing.Color.White;
                }
            }
        }
    }
}