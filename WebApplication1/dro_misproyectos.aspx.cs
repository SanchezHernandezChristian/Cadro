namespace WebApplication1
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.Web.UI;
    using System.Web.UI.WebControls;
    using BusinessEntities;
    using Code;
    using DevExpress.Web;
    using Newtonsoft.Json;
    using RestMembership.Models;
    using UtilsInfraestructura;

    public partial class dro_misproyectos : System.Web.UI.Page
    {
        ApiService apiService;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                apiService = new ApiService();
                gvProyectos.DataBind();
            }

        }
        protected void gvProyectos_DataBinding(object sender, EventArgs e)
        {

            try
            {
                if (SessionHelper.InformacionUsuario != null)
                {
                    User objContexto = SessionHelper.InformacionUsuario;
                    if (objContexto != null)
                    {
                        apiService = new ApiService();
                        var response = apiService.GetObjectList<Response>(string.Format("Proyectos/proyectosDRO?cedulaDRO={0}", SessionHelper.InformacionUsuario.IdUser));
                        if (response.IsSuccess)
                        {
                            List<Proyecto> ltProyectos = JsonConvert.DeserializeObject<List<Proyecto>>(response.Result.ToString());
                            gvProyectos.DataSource = ltProyectos.OrderByDescending(f => f.Folio);
                        }
                        else
                        {
                            (Master.FindControl("lblError") as ASPxLabel).Text = response.Message;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                (Master.FindControl("lblError") as ASPxLabel).Text = ex.Message;

            }
        }
        protected void gvProyectos_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            gvProyectos.DataBind();
        }

        protected void gvProyectos_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            try
            {
                //if (SessionHelper.InformacionUsuario.IsBloquearProyectosPendientes)
                //{
                //    //   e.Visible = DevExpress.Utils.DefaultBoolean.False;
                //}


            }
            catch (Exception ex)
            {

            }
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

        protected void gvProyectos_CommandButtonInitialize1(object sender, ASPxGridViewCommandButtonEventArgs e)
        {
            try
            {
                //if (SessionHelper.InformacionUsuario.IsBloquearProyectosPendientes)
                //{
                //    e.Visible = false;
                //}

                //if (SessionHelper.InformacionUsuario.IsBloquearProyectosNuevos)
                //{
                //    e.Visible = false;
                //}
            }
            catch (Exception ex)
            {
            }
        }

    }
}