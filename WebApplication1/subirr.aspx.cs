using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Code;

namespace WebApplication1
{
    public partial class subirr : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            InfDRO objInfDRO = new InfDRO();
            //txtTitulo.Text = (PreviousPage.FindControl("txtCedula") as DevExpress.Web.ASPxLabel).Text;
                //(FindControl("txtCedula") as DevExpress.Web.ASPxLabel).Text;
                // (Master.FindControl("txtCedula") as DevExpress.Web.ASPxLabel).Text;
        }
    }
}