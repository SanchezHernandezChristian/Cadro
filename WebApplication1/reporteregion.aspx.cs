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
    public partial class reporteregion : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarRegiones();
            CargarTramites();
        }

        private void CargarRegiones()
        {
            try
            {
                cboRegion.Items.Clear();

                conn = new SqlConnection(strConexion);
                conn.Open();

                String cSQL = string.Format(" SELECT * from tblRegion order by Id");

                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;

                SqlDataReader drR = cmd.ExecuteReader();

                while (drR.Read())
                {
                    cboRegion.Items.Add(drR["Nombre"].ToString(), drR["Id"]);
                }
                cboRegion.Items.Add("TODO", -1);
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

        private void CargarTramites()
        {
            try
            {
                cboTipoTramite.Items.Clear();

                conn = new SqlConnection(strConexion);
                conn.Open();

                String cSQL = string.Format(" SELECT * from catalogo_de_tramites order by id_tipo_solicitud");

                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;

                SqlDataReader drR = cmd.ExecuteReader();

                while (drR.Read())
                {
                    cboTipoTramite.Items.Add(drR["descripcion"].ToString(), drR["id_tipo_solicitud"]);
                }
                cboTipoTramite.Items.Add("TODO", -1);
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

        protected void gvReporete_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvReporte.DataBind();
        }

        protected void gvReporete_DataBinding(object sender, EventArgs e)
        {
            string cFiltro = "";
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();

                if (cboRegion.Value != null)
                {
                    if (Convert.ToInt32(cboRegion.Value) != -1)
                        cFiltro = string.Format("where r.Id='{0}' and s.status='SOLICITUD AUTORIZADA' order by t.id_tipo_solicitud", cboRegion.Value);
                }
                String cSQL = string.Format("SELECT p.Idregistro as Id_Registro, s.tramite_que_solicita, s.fecha_de_entrega_de_licencia, CONCAT((UPPER(substring(p.ap_paterno, 1,1)) + lower(SUBSTRING(p.ap_paterno,2,Len(p.ap_paterno)))) , ' ' , (UPPER(substring(p.ap_materno, 1,1)) + lower(SUBSTRING(p.ap_materno,2,Len(p.ap_materno)))) , ' ' , (UPPER(substring(p.nombre, 1,1)) + lower(SUBSTRING(p.nombre,2,Len(p.nombre))))) as Nombres, p.Idlocalidad, m.idMunicipio" +
                    ",(isnull(p.clasificacion, ' ') + '-' + convert(varchar, p.Idregistro) + '-' + isnull(p.id_profesion, ' ')) as Registro  " +
                    ",p.cedula, r.Id as Id_dela_Region, r.Nombre as region,l.nom_loc as NombreLocalidad, l.nom_mun as NombreMunicipio" +
                    ",t.[descripcion] as tramite,year( s.[fecha_de_sesion]) as año  " +
                    "FROM [tblPadronDRO] as p " +
                    "inner join tblsolicitudes as s on p.id = s.id_PadronDRO " +
                    "inner join tblLocalidades as l on l.Id = p.Idlocalidad  " +
                    "inner join tblMunicipios as m on l.mun = m.idMunicipio "+
                    "inner join catalogo_de_tramites t on t.id_tipo_solicitud = s.tramite_que_solicita "+
                    "inner join tblRegionesMunicipios as regm on regm.idMunicipio = m.idMunicipio "+
                    "inner join tblRegion as r on r.Id = regm.idRegion {0}", cFiltro);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader drR = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(drR);
                gvReporte.DataSource = dt;
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

        protected void btnExportar_Click(object sender, EventArgs e)
        {
            String cFile = String.Format("reporte_{0}{1}{2}.xlsx", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            gvExporter.WriteXlsxToResponse(cFile);
        }

        protected void ASPxGridView1_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            ASPxGridView1.DataBind();
        }

        protected void ASPxGridView1_DataBinding(object sender, EventArgs e)
        {
            string cFiltro = "";
            try
            {
                conn = new SqlConnection(strConexion);
                conn.Open();

                if (cboTipoTramite.Value != null)
                {
                    if (Convert.ToInt32(cboTipoTramite.Value) != -1)
                        cFiltro = string.Format("where t.id_tipo_solicitud='{0}' order by p.nombre", cboTipoTramite.Value);
                }

                String cSQL = string.Format("SELECT p.Idregistro as Id_Registro, s.tramite_que_solicita, s.fecha_de_entrega_de_licencia " +
                    ", CONCAT((UPPER(substring(p.ap_paterno, 1,1)) + lower(SUBSTRING(p.ap_paterno,2,Len(p.ap_paterno)))) , ' ' , (UPPER(substring(p.ap_materno, 1,1)) + lower(SUBSTRING(p.ap_materno,2,Len(p.ap_materno)))) , ' ' , (UPPER(substring(p.nombre, 1,1)) + lower(SUBSTRING(p.nombre,2,Len(p.nombre))))) as Nombres, p.Idlocalidad, m.idMunicipio, s.status as testado" +
                    ",(isnull(p.clasificacion, ' ') + '-' + convert(varchar, p.Idregistro) + '-' + isnull(p.id_profesion, ' ')) as Registro  " +
                    ",p.cedula, r.Id as Id_dela_Region, r.Nombre as region, l.nom_loc as NombreLocalidad, l.nom_mun as NombreMunicipio" +
                    ",t.[descripcion] as tramite, year( s.[fecha_de_sesion]) as año  " +
                    "FROM [tblPadronDRO] as p " +
                    "inner join tblsolicitudes as s on p.id = s.id_PadronDRO " +
                    "inner join tblLocalidades as l on l.Id = p.Idlocalidad  " +
                    "inner join tblMunicipios as m on l.mun = m.idMunicipio " +
                    "inner join catalogo_de_tramites t on t.id_tipo_solicitud = s.tramite_que_solicita " +
                    "inner join tblRegionesMunicipios as regm on regm.idMunicipio = m.idMunicipio " +
                    "inner join tblRegion as r on r.Id = regm.idRegion {0}", cFiltro);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader drR = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(drR);
                ASPxGridView1.DataSource = dt;
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

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            String cFile = String.Format("reporte_{0}{1}{2}.xlsx", DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            ASPxGridViewExporter1.WriteXlsxToResponse(cFile);
        }
    }
}