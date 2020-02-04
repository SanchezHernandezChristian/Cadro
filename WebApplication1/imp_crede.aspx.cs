using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class imp_crede : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String nID = Request.QueryString["p"];

            rptCredencial reportfi = new rptCredencial();
            reportfi.ShowPreviewMarginLines = true;

            reportfi.DataSource = CargarDatos(nID);
            reportfi.CreateDocument();

            dro_credencial.Report = reportfi;
        }
        private List<credencial> CargarDatos(String nID)
        {
            List<credencial> result = null;

            SqlCommand cmd;
            SqlConnection conn;
            String strConexion = ConfigurationManager.ConnectionStrings["BD_CADROConnectionString"].ConnectionString;

            conn = new SqlConnection(strConexion);
            conn.Open();

            try
            {
                String cSQL = string.Format(" SELECT  " +
      "  p.cedula " +
      " , UPPER(prof.abreviatura_de_profesion + ' ' + p.ap_paterno + ' ' + p.ap_materno + ' ' + p.nombre) as nombre, prof.abreviatura_de_profesion as clave_profesion, p.id " +
      " ,   p.clasificacion, p.Idregistro, p.url, p.ultima_vigencia, p.id_profesion "+
      " , (isnull(p.clasificacion, ' ') + '-' + convert(varchar, p.Idregistro) + '-' + isnull(p.id_profesion, ' ')) as registroDRO " +
      " FROM tblPadronDRO as p inner join tblProfesiones as prof on prof.id_profesion = p.id_profesion " +
   " where p.cedula ='{0}'", nID);
                //cSQL = "SELECT Id as folio,[NombreTipoTramite] as solicita,concat( [APaterno], ' ', [AMaterno], ' ', [Nombres]) as nombre " +
                //        ",profesion,[CalleNumero],[Colonia],[Municipio],[TelLocal],[TelCelular],[colegio],[Universidad] as egresado " +
                //        ",[FechaTitulo] as fechaexptitulo,[CedulaProfesional] as cedula,[FechaCedula] as fechaexpcedula,[CursoActualizacion] as cursos " +
                //        ",[FechaActualizacion] as fechacurso,[AnioRegistroSINFRA] as anioregistro,' ' as vigencia " +
                //        ",[Clasificacion] as clasificadirectortipo,[FolioRegistro] as registrodirector,[isAutorizado] as isrevalidacion " +
                //        ",[observacionesDictamen] as observaciones,0 as aniorevalidacion " +
                //        "FROM [tblSolicitud] where id = @id";
                // cmd = new SqlCommand(cSQL, conn);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dR = cmd.ExecuteReader();
                result = new List<credencial>();
                while (dR.Read())
                {
                    credencial rll = new credencial();
                    rll.id = (dR["id"]).ToString();
                    rll.nombre = (dR["nombre"]).ToString();
                   rll.cedula = (dR["cedula"]).ToString();
                    rll.id_profesion = (dR["id_profesion"]).ToString();
                    rll.idRegistro = (dR["registroDRO"]).ToString();
                    rll.clasificacion = (dR["clasificacion"]).ToString();
                    rll.url = (dR["url"]).ToString();
                    rll.vigencia = (dR["ultima_vigencia"]).ToString();
                    result.Add(rll);
                }

            }
            catch (Exception)
            {
            }
            finally
            {
                conn.Close();
            }

            return result;
        }
    }
}