﻿using System;
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
    public partial class dro_Administrador : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["InfoUsuario2"] != null && Session["rol"].ToString() == "ADMIN")
            {
                System.Diagnostics.Debug.WriteLine("antes del rollback" + Session["rol"].ToString());
                InfUsuario objInfUsuario = Session["InfoUsuario2"] as InfUsuario;
                //(Master.FindControl("lblNombreUsuario") as DevExpress.Web.ASPxLabel).Text = objInfUsuario.Nombre;
                ClientScript.RegisterStartupScript(GetType(), "Message", "logueado();", true);
            }
            else
            {
                Response.Redirect("default.aspx", false);
            }
            gvSolicitudesFolios.DataBind();
            gvSolicitudesSesion.DataBind();
        }

        protected void gvSolicitudesSesion_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvSolicitudesSesion.DataBind();
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
                else
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(244, 244, 244);
                }
            }
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
                      " , (p.ap_paterno + ' ' + p.ap_materno + ' ' + p.nombre) as nombre " +
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
                  " where s.status='SOLICITUD AUTORIZADA' order by fecha_de_sesion desc");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                //md.Parameters.AddWithValue("@acepta", acepta.Text);
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

        protected void gvSolicitudes_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
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
                    e.Row.BackColor = System.Drawing.Color.FromArgb(244, 244, 244);
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
                else
                {
                    e.Row.BackColor = System.Drawing.Color.FromArgb(244, 244, 244);
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
                      " , (p.ap_paterno + ' ' + p.ap_materno + ' ' + p.nombre) as nombre " +
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
                  " where s.status='SOLICITUD RECHAZADA' order by fecha_de_sesion desc");
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                //md.Parameters.AddWithValue("@acepta", acepta.Text);
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

    }
}