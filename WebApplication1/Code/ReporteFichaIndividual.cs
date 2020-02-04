using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Code
{
    public class ReporteFichaIndividual
    {
        public string id { get; set; }
        public string tramite_que_solicita { get; set; }
        public string nombre { get; set; }
        public string Profesion { get; set; }
        public string calle_numero { get; set; }
        public string nombreMunicipio { get; set; }
        public string telefono_celular { get; set; }
        public string Colegio { get; set; }
        public string Egresado { get; set; }
        public string FechaExpTitulo { get; set; }
        public string cedula { get; set; }
        public string FechaExpCedula { get; set; }
        public string status { get; set; }
        public string Cursos { get; set; }
        public string FechaCurso { get; set; }
        public string AnioRegistro { get; set; }
        public string Vigencia { get; set; }
        public string ClasificaDirectorTipo { get; set; }
        public string id_RegistroDRO { get; set; }
        public Boolean RevalidacionSi { get; set; }
        public Boolean RevalidacionNo { get; set; }
        public string observaciones { get; set; }
        public string AnioRevalidacion { get; set; }
    }
}