﻿using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Code;

namespace WebApplication1
{
    public partial class SiteCADRO : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["InfoUsuario"] != null)
                {
                    InfUsuario objInfUsuario = Session["InfoUsuario"] as InfUsuario;
                    lblNombreUsuario.Text = objInfUsuario.Nombre;

                    InfUsuario objUsuario = Session["InfoUsuario"] as InfUsuario;
                    if (objUsuario.Rol == "CIUDADANO")
                    {

                        menuCadro.Items[0].Items[1].ClientVisible = false;
                        menuCadro.Items[0].Items[2].ClientVisible = false;
                        menuCadro.Items[0].Items[3].ClientVisible = false;
                        menuCadro.Items[0].Items[4].ClientVisible = false;
                        menuCadro.Items[1].ClientVisible = false;
                    }
                    else
                    {

                    }
                }
                else
                {
                    Response.Redirect("login.aspx", false);
                }
            }
        }

        protected void cbMaster_Callback(object source, DevExpress.Web.CallbackEventArgs e)
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
    }
}