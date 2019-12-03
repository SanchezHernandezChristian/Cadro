using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Code
{
    public class ReporteFichaIndividual
    {
        public string Folio { get; set; }
        public string Solicita { get; set; }
        public string Nombre { get; set; }
        public string Profesion { get; set; }
        public string Domicilio { get; set; }
        public string Municipio { get; set; }
        public string Telefono { get; set; }
        public string Colegio { get; set; }
        public string Egresado { get; set; }
        public string FechaExpTitulo { get; set; }
        public string Cedula { get; set; }
        public string FechaExpCedula { get; set; }
        public string Cursos { get; set; }
        public string FechaCurso { get; set; }
        public string AnioRegistro { get; set; }
        public string Vigencia { get; set; }
        public string ClasificaDirectorTipo { get; set; }
        public string RegistroDirector { get; set; }
        public Boolean RevalidacionSi { get; set; }
        public Boolean RevalidacionNo { get; set; }
        public string Observaciones { get; set; }
        public string AnioRevalidacion { get; set; }
    }
}