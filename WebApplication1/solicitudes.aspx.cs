using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class solicitudes : PageBase
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gvSolicitudes.DataBind();
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
                     " , ((UPPER(substring(p.ap_paterno, 1,1)) + lower(SUBSTRING(p.ap_paterno,2,Len(p.ap_paterno)))) + ' ' + (UPPER(substring(p.ap_materno, 1,1)) + lower(SUBSTRING(p.ap_materno,2,Len(p.ap_materno)))) + ' ' + (UPPER(substring(p.nombre, 1,1)) + lower(SUBSTRING(p.nombre,2,Len(p.nombre))))) as nombre " +
                      ",p.Idregistro " +
                      //" , (isnull(p.clasificacion, ' ') + '-' + isnull(p.idRegistro, ' ') + '-' + isnull(p.id_profesion, ' ')) as registroDRO " +
                      " , m.nombreMunicipioINEGI as nombreMunicipio " +
                      " , lower(l.nom_loc) as nombreLocalidad " +
                      " , tramites.descripcion " +
                      " , prof.abreviatura_de_profesion " +
                      " , s.status " +
                      " , s.observaciones " +
                      " , s.notasfecha " +
                      " , (p.cedula) as cedula " +
                  " FROM tblsolicitudes as s" +
                  " inner join tblPadronDRO as p" +
                  " on s.id_PadronDRO = p.id" +
                  " left join tblProfesiones as prof" +
                  " on prof.id_profesion = p.id_profesion" +
                  " left join catalogo_de_tramites as tramites" +
                  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
                  " inner join tblLocalidades as l" +
                  " on l.Id = p.Idlocalidad " +
                  " inner join tblMunicipios as m" +
                  " on l.mun = m.idMunicipio" +
                " where s.status='EN ESPERA DE DICTAMEN' and (correo_votantes not like @correo or correo_votantes is null)  order by fecha_solicitud desc");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                String correo = SessionHelper.InformacionUsuario.Email;
                cmd.Parameters.AddWithValue("@correo", "%" +correo + "%");
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
        

        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.TabControlEventArgs e)
        {

        }
    }
}