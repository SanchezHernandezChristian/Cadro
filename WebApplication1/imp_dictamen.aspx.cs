using DevExpress.XtraPrinting;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class imp_dictamen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            String nID = Request.QueryString["p"];
            
            rptFichaIndividual report = new rptFichaIndividual();
            report.DataSource = CargarDatos(nID);
            report.CreateDocument();
            dvReporte.Report = report;
            using (MemoryStream ms = new MemoryStream())
            {
                report.ExportToPdf(ms, new PdfExportOptions() { ShowPrintDialogOnOpen = true });
                PrintDocument(ms.ToArray(), nID + ".pdf");
            }
        }

        void PrintDocument(byte[] documentData, string fileName)
        {
            string contentType = String.Format("application/{0}", "pdf");
            string disposition = "inline";
            Response.Clear();
            Response.ContentType = "application/pdf";
            Response.AddHeader("Content-Disposition", String.Format("{0}; filename={1}", disposition, fileName));
            Response.BinaryWrite(documentData);
            Response.End();
        }

        private List<ReporteFichaIndividual> CargarDatos(String nID)
        {
            List<ReporteFichaIndividual> result = null;

            SqlCommand cmd;
            SqlConnection conn;
            String strConexion = ConfigurationManager.ConnectionStrings["BD_CADROConnectionString"].ConnectionString;

            conn = new SqlConnection(strConexion);
            conn.Open();
            
            try
            {
                String cSQL = string.Format (" SELECT  " +
      " s.id " +
      " , fecha_solicitud " +
      " , fecha_de_sesion " +
      " , s.status " +
      " , tramite_que_solicita " +
      " , tramites.descripcion " +
      " , prof.descripcion as pdescripcion" +
      " , s.observaciones " +
      " , p.cedula " +
      " , p.ap_paterno " +
      " , p.ap_materno " +
      " , p.nombre " +
      ", s.id_PadronDRO" +
      " , p.calle_numero " +
      " , m.nombreMunicipioINEGI as nombreMunicipio " +
      " , l.nom_loc as idLocalidad " +
      " , p.email " +
      " , prof.abreviatura_de_profesion as clave_profesion " +
      " , uni.descripcion as egresado_de " +
      " , p.fecha_titulo " +
      " , p.fecha_cedula " +
      " , p.anio_reg_sop " +
       " , p.ultima_vigencia " +
      " , p.cursos " +
      " , col.descripcion as colegio " +
      " , p.clasificacion " +
      " , p.colonia " +
      " , p.telefono_local " +
      " , p.telefono_celular " +
      //" , (isnull(p.clasificacion, ' ') + '-' + isnull(p.idRegistro, ' ') + '-' + isnull(prof.abreviatura_de_profesion, ' ')) as registroDRO " +
      " , s.notasfecha " +
      " , p.idRegistro " +
      " FROM tblsolicitudes as s " +
      " inner join tblPadronDRO as p " +
      " on s.id_PadronDRO = p.Id " +
      " left join tblProfesiones as prof" +
                  " on prof.id_profesion = p.id_profesion" +
                  " left join catalogo_de_tramites as tramites" +
                  " on tramites.id_tipo_solicitud = s.tramite_que_solicita" +
                  " inner join tblColegios as col" +
                  " on col.id_colegio = p.id_colegio" +
                  " inner join tblUniversidades as uni" +
                  " on uni.id_universidad = p.id_universidad" +
                  " inner join tblLocalidades as l" +
                  " on l.Id = p.Idlocalidad " +
                  " inner join tblMunicipios as m" +
                  " on l.mun = m.idMunicipio " +
                  " where s.id ='{0}'", nID);
                //cSQL = "SELECT Id as folio,[NombreTipoTramite] as solicita,concat( [APaterno], ' ', [AMaterno], ' ', [Nombres]) as nombre " +
                //        ",profesion,[CalleNumero],[Colonia],[Municipio],[TelLocal],[TelCelular],[colegio],[Universidad] as egresado " +
                //        ",[FechaTitulo] as fechaexptitulo,[CedulaProfesional] as cedula,[FechaCedula] as fechaexpcedula,[CursoActualizacion] as cursos " +
                //        ",[FechaActualizacion] as fechacurso,[AnioRegistroSINFRA] as anioregistro,' ' as vigencia " +
                //        ",[Clasificacion] as clasificadirectortipo,[FolioRegistro] as registrodirector,[isAutorizado] as isrevalidacion " +
                //        ",[observacionesDictamen] as observaciones,0 as aniorevalidacion " +
                //        "FROM [tblSolicitud] where id = @id";
               // cmd = new SqlCommand(cSQL, conn);
              //  cmd.Parameters.AddWithValue("@id", nID);
                cmd = conn.CreateCommand();
                cmd.CommandText = cSQL;
                SqlDataReader dR = cmd.ExecuteReader();
                result = new List<ReporteFichaIndividual>();
                while (dR.Read())
                {
                    ReporteFichaIndividual rll = new ReporteFichaIndividual();
                    rll.id = (dR["id"] is DBNull ? "" : dR["id"]).ToString();
                    rll.tramite_que_solicita = (dR["descripcion"] is DBNull ? "" : dR["descripcion"]).ToString();
                    rll.nombre = (dR["nombre"] is DBNull ? "" : dR["nombre"]).ToString();
                    rll.Profesion = (dR["pdescripcion"] is DBNull ? "" : dR["pdescripcion"]).ToString();
                    String cCalle = (dR["calle_numero"] is DBNull ? "" : dR["calle_numero"]).ToString();
                    String cColonia = (dR["colonia"] is DBNull ? "" : dR["colonia"]).ToString();
                    rll.calle_numero = cCalle + (cCalle != string.Empty && cColonia != string.Empty ? ", " : "") + cColonia;
                    rll.nombreMunicipio = (dR["nombreMunicipio"] is DBNull ? "" : dR["nombreMunicipio"]).ToString();
                    String cTelFijo = (dR["telefono_local"] is DBNull ? "" : dR["telefono_local"]).ToString();
                    String cTelCel = (dR["telefono_celular"] is DBNull ? "" : dR["telefono_celular"]).ToString();
                    rll.telefono_celular = cTelFijo + (cTelFijo != string.Empty && cTelCel != string.Empty ? ", " : "") + cTelCel;
                    rll.Colegio = (dR["colegio"] is DBNull ? "" : dR["colegio"]).ToString();
                    rll.Egresado = (dR["egresado_de"] is DBNull ? "" : dR["egresado_de"]).ToString();
                    String cFechaExpTitulo = "";
                    String cFechaExpCedula = "";
                    String cFechaCurso = "";
                    try
                    {
                        cFechaExpTitulo = ((DateTime)dR["fecha_titulo"]).ToShortDateString();
                    }
                    catch { }
                    try
                    {
                        cFechaExpCedula = ((DateTime)dR["fecha_cedula"]).ToShortDateString();
                    }
                    catch { }
                    try
                    {
                        cFechaCurso = ((DateTime)dR["fecha_de_sesion"]).ToShortDateString();
                    }
                    catch { }
                    rll.FechaExpTitulo = cFechaExpTitulo;
                    rll.cedula = (dR["cedula"] is DBNull ? "" : dR["cedula"]).ToString();
                    rll.FechaExpCedula = cFechaExpCedula;
                    rll.Cursos = (dR["cursos"] is DBNull ? "" : dR["cursos"]).ToString();
                    rll.FechaCurso = cFechaCurso;
                    rll.AnioRegistro = (dR["anio_reg_sop"] is DBNull ? "" : dR["anio_reg_sop"]).ToString();
                    rll.Vigencia = (dR["ultima_vigencia"] is DBNull ? "" : dR["ultima_vigencia"]).ToString();
                    rll.ClasificaDirectorTipo = (dR["clasificacion"] is DBNull ? "" : dR["clasificacion"]).ToString();
                    rll.id_RegistroDRO = (dR["idRegistro"] is DBNull ? "" : dR["idRegistro"]).ToString();
                    rll.observaciones = (dR["observaciones"] is DBNull ? "" : dR["observaciones"]).ToString();
                    rll.status= (dR["status"] is DBNull ? "" : dR["status"]).ToString();
                    result.Add(rll);
                }
            }
            catch (Exception ex)
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