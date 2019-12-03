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
    public partial class solicitudes : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvSolicitudes.DataBind();
                gvSolicitudesFolios.DataBind();
                gvSolicitudesSesion.DataBind();
            }
        }       

        protected void gvSolicitudes_DataBinding(object sender, EventArgs e)
        {
           try
            {
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
      " , s.cedula_profesional " +
  " FROM tblsolicitudes as s" +
  " inner join tblPadronDRO as p" +
  " on s.cedula_profesional = p.cedula_profesional" +
  " left join tblProfesiones as prof" +
  " on prof.id_profesion = p.clave_profesion" +
  " left join catalogo_de_tramites as tramites" +
  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
  " where s.status='EN ESPERA DE DICTAMEN' order by fecha_solicitud desc");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                cmd.Parameters.AddWithValue("@acepta", acepta.Text);
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
        protected void gvSolicitudesSesion_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
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

        protected void gvSolicitudesSesion_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvSolicitudesSesion.DataBind();
        }

        protected void gvSolicitudesSesion_DataBinding(object sender, EventArgs e)
        {
            try
            {
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
      " , s.cedula_profesional " +
  " FROM tblsolicitudes as s" +
  " inner join tblPadronDRO as p" +
  " on s.cedula_profesional = p.cedula_profesional" +
  " left join tblProfesiones as prof" +
  " on prof.id_profesion = p.clave_profesion" +
  " left join catalogo_de_tramites as tramites" +
  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
  " where s.status='SOLICITUD AUTORIZADA' order by fecha_solicitud desc");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                cmd.Parameters.AddWithValue("@acepta", acepta.Text);
                SqlDataReader drR = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(drR);
                gvSolicitudesSesion.DataSource = dt;
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

        protected void gvSolicitudesFolios_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
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

        protected void gvSolicitudesFolios_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvSolicitudesFolios.DataBind();
        }

        protected void gvSolicitudesFolios_DataBinding(object sender, EventArgs e)
        {
            try
            {
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
      " , s.cedula_profesional " +
  " FROM tblsolicitudes as s" +
  " inner join tblPadronDRO as p" +
  " on s.cedula_profesional = p.cedula_profesional" +
  " left join tblProfesiones as prof" +
  " on prof.id_profesion = p.clave_profesion" +
  " left join catalogo_de_tramites as tramites" +
  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
  " where s.status='SOLICITUD RECHAZADA' order by fecha_solicitud desc");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader drR = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(drR);
                gvSolicitudesFolios.DataSource = dt;
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

        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.TabControlEventArgs e)
        {

        }
    }
}