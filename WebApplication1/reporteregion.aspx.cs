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
            if (Session["InfoUsuario"] != null && Session["rol"].ToString() == "ADMIN")
            {
                InfUsuario objInfUsuario = Session["InfoUsuario"] as InfUsuario;
                (Master.FindControl("lblNombreUsuario") as DevExpress.Web.ASPxLabel).Text = objInfUsuario.Nombre;
            }
            else
            {
                Response.Redirect("default.aspx", false);
            }
            CargarRegiones();
        }

        private void CargarRegiones()
        {
            try
            {
                cboRegion.Items.Clear();

                conn = new SqlConnection(strConexion);
                conn.Open();

                String cSQL = string.Format(" SELECT * from catregiones order by iIdRegion");

                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;

                SqlDataReader drR = cmd.ExecuteReader();

                while (drR.Read())
                {
                    cboRegion.Items.Add(drR["cRegion"].ToString(), drR["iIdRegion"]);
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
                        cFiltro = string.Format("where p.region='{0}'", cboRegion.Value);
                }

                String cSQL = string.Format("SELECT p.[Id] as Folio, s.[fecha_de_entrega_de_licencia], concat([apellido_paterno] " +
                    ",' ', [apellido_materno], ' ', [nombres]) as nombre, concat([clasifica], '-', [Idregistro], '-', [clave_profesion]) as Registro " +
                    ",p.[cedula_profesional],r.[cRegion] as region,[municipio],[NombreMunicipio],[Idlocalidad],[NombreLocalidad] " +
                    ",t.[descripcion] as tramite,year( s.[fecha_de_sesion]) as año " +
                    "FROM [tblPadronDRO] p " +
                    "inner join tblSolicitudes s on p.[cedula_profesional] = s.[cedula_profesional] " +
                    "inner join catalogo_de_tramites t on t.[id_tipo_solicitud] = s.[tramite_que_solicita] " +
                    "inner join[catregiones] r on p.[region] = r.[iIdRegion] {0}", cFiltro);
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
    }
}