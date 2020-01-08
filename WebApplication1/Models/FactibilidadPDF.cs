using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Models
{
    public class FactibilidadPDF
    {
        string cedula;
        DateTime fechaCaptura;
        string idUsuario;

        public string Cedula
        {
            get
            {
                return cedula;
            }

            set
            {
                cedula = value;
            }
        }

        public DateTime FechaCaptura
        {
            get
            {
                return fechaCaptura;
            }

            set
            {
                fechaCaptura = value;
            }
        }

        public string IdUsuario
        {
            get
            {
                return idUsuario;
            }

            set
            {
                idUsuario = value;
            }
        }
    }
}