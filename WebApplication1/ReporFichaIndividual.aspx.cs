using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApp.Code;

namespace WebApplication1
{
    public partial class ReporFichaIndividual : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String nID = Request.QueryString["p"];
            rptFichaIndividual reportfi = new rptFichaIndividual();
            reportfi.ShowPreviewMarginLines = true;

            reportfi.DataSource = CargarDatos(nID);

            dvReporte.Report = reportfi;
        }

        private List<ReporteFichaIndividual> CargarDatos(String nID)
        {
            List<ReporteFichaIndividual> result = null;

            SqlCommand cmd;
            SqlConnection conn;
            String strConexion = ConfigurationManager.ConnectionStrings["BD_CADROConnectionString"].ConnectionString;

            conn = new SqlConnection(strConexion);
            conn.Open();

            String cSQL = "";
            try
            {
                cSQL = " SELECT s.id " +
   "   AS " +
   "  folio, " +
   "  fecha_solicitud, " +
   "  s.fecha_de_sesion,      " +
   "  tramites.descripcion" +
   "  AS solicita, " +
   "  p.cedula_profesional, 	 " +
   "  p.apellido_paterno + ' ' + p.apellido_materno + ' ' + p.nombres  AS nombre, " +
   "       p.calle_numero " +
   "       AS CalleNumero, " +
   "  p.nombremunicipio as municipio, " +
   "  p.idlocalidad, " +
   "  p.cedula_profesional as cedula, " +
   "  p.region, " +
   "  p.email, " +
   "  p.clave_profesion as profesion, " +
   "  p.clave_profesion, " +
   "  universidades.descripcion" +
   "  AS egresado, " +
   "  p.fecha_titulo " +
   "  AS fechaexptitulo, " +
   "  p.fecha_cedula, " +
   "  p.anio_registro_sop AS anioregistro, " +
   "  p.cursos, " +
   "  colegios.descripcion" +
   "  AS colegio, " +
   "  p.clasifica" +
   "  AS clasificadirectortipo, " +
   "  p.colonia, " +
   "  p.telefono_local" +
   "  AS telLocal, " +
   "  p.telefono_celular" +
   "  AS telCelular, " +
   "    (Isnull(p.clasifica, ' ') + '-' " +
   "    + Isnull(p.idregistro, ' ') + '-' " +
   "    + Isnull(p.clave_profesion, ' ')) " +
   "  AS registrodirector, " +
   "  s.procede_si_no, " +
   "  s.observaciones,  " +
   "  0 " +
   "  AS anioRevalidacion," +
   "  s.tramite_que_procede" +
   "  isrevalidacion," +
   "  p.ultima_vigencia " +
   "  AS vigencia " +
   "  FROM   tblsolicitudes AS s " +
   "    INNER JOIN tblpadrondro AS p " +
   "            ON s.cedula_profesional = p.cedula_profesional " +
   "    INNER JOIN catalogo_de_tramites AS tramites " +
   "            ON tramites.id_tipo_solicitud = s.tramite_que_solicita " +
   "    INNER JOIN tblcolegios AS colegios " +
   "            ON colegios.id_colegio = p.colegio " +
   "    INNER JOIN tbluniversidades AS universidades " +
   "            ON universidades.id_universidad = p.egresado_de " +
   "  WHERE s.id = " + nID + "";



                //cSQL = "SELECT Id as folio,[NombreTipoTramite] as solicita,concat( [APaterno], ' ', [AMaterno], ' ', [Nombres]) as nombre " +
                //        ",profesion,[CalleNumero],[Colonia],[Municipio],[TelLocal],[TelCelular],[colegio],[Universidad] as egresado " +
                //        ",[FechaTitulo] as fechaexptitulo,[CedulaProfesional] as cedula,[FechaCedula] as fechaexpcedula,[CursoActualizacion] as cursos " +
                //        ",[FechaActualizacion] as fechacurso,[AnioRegistroSINFRA] as anioregistro,' ' as vigencia " +
                //        ",[Clasificacion] as clasificadirectortipo,[FolioRegistro] as registrodirector,[isAutorizado] as isrevalidacion " +
                //        ",[observacionesDictamen] as observaciones,0 as aniorevalidacion " +
                //        "FROM [tblSolicitud] where id = @id";

                cmd = new SqlCommand(cSQL, conn);

                cmd.Parameters.AddWithValue("@id", nID);

                SqlDataReader dR = cmd.ExecuteReader();

                result = new List<ReporteFichaIndividual>();

                while (dR.Read())
                {
                    ReporteFichaIndividual rll = new ReporteFichaIndividual();

                    rll.Folio = (dR["folio"] is DBNull ? "" : dR["folio"]).ToString();
                    rll.Solicita = (dR["solicita"] is DBNull ? "" : dR["solicita"]).ToString();
                    rll.Nombre = (dR["nombre"] is DBNull ? "" : dR["nombre"]).ToString();
                    rll.Profesion = (dR["profesion"] is DBNull ? "" : dR["profesion"]).ToString();

                    String cCalle = (dR["CalleNumero"] is DBNull ? "" : dR["CalleNumero"]).ToString();
                    String cColonia = (dR["Colonia"] is DBNull ? "" : dR["Colonia"]).ToString();

                    rll.Domicilio = cCalle + (cCalle != string.Empty && cColonia != string.Empty ? ", " : "") + cColonia;
                    rll.Municipio = (dR["Municipio"] is DBNull ? "" : dR["Municipio"]).ToString();

                    String cTelFijo = (dR["TelLocal"] is DBNull ? "" : dR["TelLocal"]).ToString();
                    String cTelCel = (dR["TelCelular"] is DBNull ? "" : dR["TelCelular"]).ToString();

                    rll.Telefono = cTelFijo + (cTelFijo != string.Empty && cTelCel != string.Empty ? ", " : "") + cTelCel;
                    rll.Colegio = (dR["colegio"] is DBNull ? "" : dR["colegio"]).ToString();
                    rll.Egresado = (dR["egresado"] is DBNull ? "" : dR["egresado"]).ToString();

                    String cFechaExpTitulo = "";
                    String cFechaExpCedula = "";
                    String cFechaCurso = "";
                    try
                    {
                        cFechaExpTitulo = ((DateTime)dR["fechaexptitulo"]).ToShortDateString();
                    }
                    catch { }
                    try
                    {
                        cFechaExpCedula = ((DateTime)dR["fechaexpcedula"]).ToShortDateString();
                    }
                    catch { }
                    //try
                    //{
                    //    cFechaCurso = ((DateTime)dR["fechacurso"]).ToShortDateString();
                    //}
                    //catch { }

                    rll.FechaExpTitulo = cFechaExpTitulo;
                    rll.Cedula = (dR["cedula"] is DBNull ? "" : dR["cedula"]).ToString();


                    rll.FechaExpCedula = cFechaExpCedula;
                    rll.Cursos = (dR["cursos"] is DBNull ? "" : dR["cursos"]).ToString();


                    rll.FechaCurso = cFechaCurso;
                    rll.AnioRegistro = (dR["anioregistro"] is DBNull ? "" : dR["anioregistro"]).ToString();
                    rll.Vigencia = (dR["vigencia"] is DBNull ? "" : dR["vigencia"]).ToString();
                    rll.ClasificaDirectorTipo = (dR["clasificadirectortipo"] is DBNull ? "" : dR["clasificadirectortipo"]).ToString();
                    rll.RegistroDirector = (dR["registrodirector"] is DBNull ? "" : dR["registrodirector"]).ToString();

                    if (dR["isrevalidacion"] != DBNull.Value)
                    {
                        if (dR["isrevalidacion"].ToString() == "S")
                        {
                            rll.RevalidacionSi = true;
                        }
                        else
                        {
                            rll.RevalidacionSi = false;
                        }
                    }

                    rll.Observaciones = (dR["observaciones"] is DBNull ? "" : dR["observaciones"]).ToString();
                    rll.AnioRevalidacion = (dR["aniorevalidacion"] is DBNull ? "" : dR["aniorevalidacion"]).ToString();

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