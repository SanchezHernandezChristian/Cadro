using DevExpress.Web;
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
    public partial class solicitante : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                //InfUsuario objUser = Session["InfoUsuario"] as InfUsuario;
                correo.Text = SessionHelper.InformacionUsuario.Email; //objUser.Correo; 
                conn = new SqlConnection(strConexion);
                conn.Open();
                String cSQL = string.Format(" SELECT  " +
      " s.id " +
      " ,fecha_de_sesion " +
      " ,fecha_solicitud " +
      " , prof.abreviatura_de_profesion " +
      " , (p.ap_paterno + ' ' + p.ap_materno + ' ' + p.nombre) as nombre " +
      ",p.Idregistro " +
     // " , (isnull(p.clasificacion, ' ') + '-' + isnull(p.Idregistro, ' ') + '-' + isnull(p.id_profesion, ' ')) as registroDRO " +
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
  " where p.email=@acepta");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                cmd.Parameters.AddWithValue("@acepta", correo.Text);
                SqlDataReader drR = cmd.ExecuteReader();
                DataTable dt = new DataTable();
                dt.Load(drR);
              //  gvSolicitudes.DataSource = dt;
                
                String cSQL2 = string.Format(" SELECT p.cedula, s.id, s.status, p.Idregistro " +
                    " , tramites.descripcion " +
      " FROM tblsolicitudes as s" +
                  " inner join tblPadronDRO as p" +
                  " on s.id_PadronDRO = p.id"+
                  " left join catalogo_de_tramites as tramites" +
                  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
                  " where p.email='{0}' order by fecha_solicitud asc", correo.Text);  //Checar pued ser asc
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL2;
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    ASPxLabel1.Text = dr["status"].ToString();
                    ASPxLabel2.Text = "Registro";
                }
                    dr.Close();

            if (ASPxLabel1.Text == "EN RECEPCION DE DOCUMENTOS" && ASPxLabel2.Text=="Registro")
                {
                    RegistroPadron.Visible = true;
                    RegistroPadron.ClientVisible = true;
                    gvSolicitudes.Visible = false;
                    gvSolicitudes.ClientVisible = false;
                    s.Visible = false;
                    menuCadro.Items[1].ClientEnabled = false;
                    menuCadro.Items[1].Enabled = false;
                }
            else if (ASPxLabel1.Text == "EN ASIGNACION DE FECHA")
                {
                    gvSolicitudes.DataSource = dt;
                    RegistroPadron.Visible = false;
                    RegistroPadron.ClientVisible = false;
                    s.Visible = true;
                    menuCadro.Items[1].ClientEnabled = false;
                    menuCadro.Items[1].Enabled = false;
                }
            else if (ASPxLabel1.Text == "EN REVISION DE DOCUMENTOS")
                {
                    gvSolicitudes.DataSource = dt;
                    RegistroPadron.Visible = false;
                    RegistroPadron.ClientVisible = false;
                    s.Visible = true;
                    menuCadro.Items[1].ClientEnabled = false;
                    menuCadro.Items[1].Enabled = false;
                }
                else{
                    gvSolicitudes.DataSource = dt;
                    RegistroPadron.Visible = false;
                    RegistroPadron.ClientVisible = false;
                    s.Visible = true;
                }
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

        protected void menuCadro_ItemDataBound(object source, DevExpress.Web.MenuItemEventArgs e)
        {
            ASPxMenu menu = source as ASPxMenu;
            menu.Items[0].Items[0].ClientVisible = false;
        }

        protected void menuCadro_DataBound(object sender, EventArgs e)
        {
            ASPxMenu menu = sender as ASPxMenu;
            menu.Items[0].Items[0].ClientVisible = false;
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
                else
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(244,244,244);
                }
            }
        }
    }
}