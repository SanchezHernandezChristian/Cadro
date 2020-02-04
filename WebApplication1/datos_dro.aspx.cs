using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class datos_dro : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    ObtenerInformacion(Request.QueryString[0].ToString());
                    obtenerRegion();


                    txtCedula.Text = txtCedula.Text.Trim();

                    cargaimagen();

                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "noterror(' No existe el DRO ingresado ', 'www.sinfra.oaxaca.gob.mx');", true);
                System.Diagnostics.Debug.WriteLine(ex);
            }

        }
        protected void callpanelLocalidad_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            cboLocalidad.DataBind();
        }

        protected void cargaimagen()
        {
            // "nombre" runat = "server" Target = "_blank" NavigateUrl = '<%# Eval("Name", "~/Documents/Vitae/"+ASPxLabel1.Text+"/{0}") %>'
            //                          Text = '<%# Eval("Name") %>' >
            //  DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("Name", "~/Documents/Foto/" + txtCedula.Text + "/{0}"));
            //  FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.AllDirectories);
   /*         System.Diagnostics.Debug.WriteLine("~/Documents/Foto/" + txtCedula.Text.Trim() + "/{0}");
            
            string[] files = Directory.GetFiles("~/Documents/Foto/" + txtCedula.Text.Trim(), "*.*");

            foreach (string url in files)
            {
                System.Diagnostics.Debug.WriteLine("~/Documents/Foto/" + txtCedula.Text.Trim() + url);

            }
            */

            Image2.ImageUrl = "~/Documents/Foto/" + txtCedula.Text.Trim() + "/cedula.png";
            
        }

            void ObtenerInformacion(String cedula)
        {
            try
            {
                var conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format("SELECT clasificacion, IdRegistro, cedula, ap_paterno, ap_materno, nombre, prof.abreviatura_de_profesion as clave_profesion,email, anio_reg_sop, ultima_vigencia, m.idMunicipio as nombreMunicipio, l.nom_loc as idLocalidad, ultima_vigencia  " +
                    "FROM tblPadronDRO as p left join tblProfesiones as prof on prof.id_profesion = p.id_profesion inner join tblLocalidades as l on l.Id = p.Idlocalidad inner join tblMunicipios as m on l.mun = m.idMunicipio  where cedula = '{0}' " , cedula);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    txtCedula.Text = dr["cedula"].ToString();
                    txtApaterno.Text = dr["ap_paterno"].ToString();
                    txtAMaterno.Text = dr["ap_materno"].ToString();
                    txtNombres.Text = dr["nombre"].ToString();
                    cboMunicipio.Value = dr["nombreMunicipio"].ToString();
                    cboLocalidad.Value = dr["idLocalidad"].ToString();
                    cboProfesion.Value = dr["clave_profesion"].ToString();
                    txtAnioRegistro.Text = dr["anio_reg_sop"].ToString();
                    if (dr["clasificacion"] != DBNull.Value)
                    {
                        cboClasificacion.Value = dr["clasificacion"].ToString();
                    }
                    if(Int32.Parse(dr["ultima_vigencia"].ToString()) >= Int32.Parse(DateTime.Now.ToString("yyyy")))
                    {
                        estatus_dro.Text = "DRO con acreditación vigente hasta " + Int32.Parse(dr["ultima_vigencia"].ToString());
                        ClientScript.RegisterStartupScript(GetType(), "Message", "cambio_color(1);", true);
                    }
                    else
                    {
                        estatus_dro.Text = "DRO sin acreditación";
                        ClientScript.RegisterStartupScript(GetType(), "Message", "cambio_color(2);", true);
                    }
                    if (dr["IdREgistro"] != DBNull.Value)
                    {
                        txtRegistroDRO.Text = dr["IdRegistro"].ToString();
                    }
                    if (dr["clave_profesion"] != DBNull.Value)
                    {
                        cboClaveProfesion.Value = dr["clave_profesion"].ToString();
                    }
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(GetType(), "Message", "noterror(' No existe el DRO ingresado ', 'www.sinfra.oaxaca.gob.mx');", true);
                //(Master.FindControl("lblError") as DevExpress.Web.ASPxLabel).Text = ex.Message;
            }
            finally
            {
                if (conn != null)
                {
                    conn.Close();
                }
            }
        }

        void obtenerRegion()
        {
            int valormun = int.Parse(cboMunicipio.Value.ToString());
            conn = new SqlConnection(strConexion);
            conn.Open();
            String cSQL = string.Format(" SELECT  " +
                "id, nombre from dbo.tblRegion as reg inner join dbo.tblRegionesMunicipios as regm on reg.Id = regm.idRegion  where idMunicipio = {0}", valormun);

            cmd = conn.CreateCommand();
            cmd.CommandText = cSQL;
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                //this.Page.Response.Write("<script language='JavaScript'>window.alert('" + dr["id"] + "');</script>");
                cboRegion.Value = dr["id"].ToString();

            }
            dr.Close();
        }



    }

}