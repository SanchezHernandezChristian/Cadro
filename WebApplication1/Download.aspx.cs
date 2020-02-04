using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class Download : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            /*  InfDRO objInfDRO = new InfDRO();
              objInfDRO.cedula = ASPxTextBox1.Text; */
            if (Session["InfoUsuario"] != null)
            {
                InfUsuario objInfUsuario = Session["InfoUsuario"] as InfUsuario;
                
            }
            else
            {
                Response.Redirect("default.aspx", false);
            }

            string filename = Request.QueryString["filename"].ToString();
            Response.Clear();
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", filename));
            Response.ContentType = "application/octet-stream";
            Response.WriteFile(Server.MapPath(Path.Combine("~/Documents/Pagos/", filename)));
            Response.End();
        }
    }
}