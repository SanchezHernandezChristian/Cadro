using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class subeced : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxLabel1.Text = ASPxTextBox1.Value.ToString();
            if (!IsPostBack)
            {
                DirectoryInfo dirInfo = new DirectoryInfo(Server.MapPath("~/Documents/Cedulas/" + ASPxLabel1.Text));
                FileInfo[] fileInfo = dirInfo.GetFiles("*.*", SearchOption.TopDirectoryOnly);
                GridView1.DataSource = fileInfo;
                GridView1.DataBind();
            }
        }

        protected void btnSubirArchivo_Click(object sender, EventArgs e)
        {
            string path = Path.Combine(Server.MapPath("~/Documents/Cedulas"), ASPxTextBox1.Text);
            Directory.CreateDirectory(path);


            if (FileUpload1.HasFile)
            {
                string fullPath = Path.Combine(Server.MapPath("~/Documents/Cedulas/" + ASPxTextBox1.Text), FileUpload1.FileName);
                FileUpload1.SaveAs(fullPath);

                Response.Redirect("subeced.aspx"); //se recarga la propia pagina
            }
            /*    if (FileUpload1.HasFile)
                {
                    string fullPath = Path.Combine(Server.MapPath("~/Documents/"+TextBox1.Text), FileUpload1.FileName);
                    FileUpload1.SaveAs(fullPath);

                    Response.Redirect("subeced.aspx"); //se recarga la propia pagina
                }           */
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //se obtiene el nombre de campo definido en el DataKeyNames del gridview
            string fileName = Convert.ToString(GridView1.DataKeys[e.RowIndex].Value);
            //se define el path fisico del archivo
            string fullPath = Path.Combine(Server.MapPath("~/Documents/"), fileName);

            File.Delete(fullPath);

            Response.Redirect("subeced.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                string fullPath = Path.Combine(Server.MapPath("~/Documents/Cedulas/" + ASPxTextBox1.Text), FileUpload1.FileName);
                FileUpload1.SaveAs(fullPath);

                Response.Redirect("subeced.aspx"); //se recarga la propia pagina
            }
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            string filename = Request.QueryString["filename"].ToString();
            Response.Clear();
            Response.AddHeader("content-disposition", string.Format("attachment;filename={0}", filename));
            Response.ContentType = "application/octet-stream";
            Response.WriteFile(Server.MapPath(Path.Combine("~/Documents/Cedulas/" + ASPxLabel1.Text + "", filename)));
            Response.End();
        }
    }
}