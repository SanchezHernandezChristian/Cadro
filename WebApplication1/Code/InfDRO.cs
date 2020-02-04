using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Code
{
    public class InfDRO
    {
        private long _Id;       
        private DateTime _FechaActualizacion;
        private string _cedula;
        private long _IdRegistro;
        private string _Clasificacion;
        private string _APaterno;
        private string _AMaterno;
        private string _Nombre;
        private string _ClaveProfesion;
        private string _CalleNum;
        private string _Colonia;
        private int _IdMunicipio;
        private string _Municipio;
        private int _IdRegion;
        private string _Region;
        private int _IdLocalidad;
        private string _Localidad;
        private string _TelLocal;
        private string _TelCelular;
        private int _IdColegio;
        private string _Colegio;
        private int _IdUniversidad;
        private string _Universidad;
        private DateTime? _FechaTitulo;
        private DateTime? _FechaCedula;
        private int _AnioRegistroSOP;//?
        private string _CursoActualizacion;
        private string _Correo;
        private int _UltimaVigencia;
        private string _Observaciones;
        private string _Curp;
        private string _Rfc;
        private string _Nacimiento;

        public long Id
        {
            get
            {
                return _Id;
            }

            set
            {
                _Id = value;
            }
        }

        public DateTime FechaActualizacion
        {
            get
            {
                return _FechaActualizacion;
            }

            set
            {
                _FechaActualizacion = value;
            }
        }

        public string cedula
        {
            get
            {
                return _cedula;
            }

            set
            {
                _cedula = value;
            }
        }
                   

        public string APaterno
        {
            get
            {
                return _APaterno;
            }

            set
            {
                _APaterno = value;
            }
        }

        public string AMaterno
        {
            get
            {
                return _AMaterno;
            }

            set
            {
                _AMaterno = value;
            }
        }

        public string Nombre
        {
            get
            {
                return _Nombre;
            }

            set
            {
                _Nombre = value;
            }
        }

        public string CalleNum
        {
            get
            {
                return _CalleNum;
            }

            set
            {
                _CalleNum = value;
            }
        }

        public string Colonia
        {
            get
            {
                return _Colonia;
            }

            set
            {
                _Colonia = value;
            }
        }

        public int IdMunicipio
        {
            get
            {
                return _IdMunicipio;
            }

            set
            {
                _IdMunicipio = value;
            }
        }

        public string Municipio
        {
            get
            {
                return _Municipio;
            }

            set
            {
                _Municipio = value;
            }
        }

        public int IdRegion
        {
            get
            {
                return _IdRegion;
            }

            set
            {
                _IdRegion = value;
            }
        }

        public string Region
        {
            get
            {
                return _Region;
            }

            set
            {
                _Region = value;
            }
        }

        public string TelLocal
        {
            get
            {
                return _TelLocal;
            }

            set
            {
                _TelLocal = value;
            }
        }

        public string TelCelular
        {
            get
            {
                return _TelCelular;
            }

            set
            {
                _TelCelular = value;
            }
        }

        public string Correo
        {
            get
            {
                return _Correo;
            }

            set
            {
                _Correo = value;
            }
        }

        public int IdUniversidad
        {
            get
            {
                return _IdUniversidad;
            }

            set
            {
                _IdUniversidad = value;
            }
        }

        public string Universidad
        {
            get
            {
                return _Universidad;
            }

            set
            {
                _Universidad = value;
            }
        }

        public DateTime? FechaTitulo
        {
            get
            {
                return _FechaTitulo;
            }

            set
            {
                _FechaTitulo = value;
            }
        }

        public DateTime? FechaCedula
        {
            get
            {
                return _FechaCedula;
            }

            set
            {
                _FechaCedula = value;
            }
        }

        public string CursoActualizacion
        {
            get
            {
                return _CursoActualizacion;
            }

            set
            {
                _CursoActualizacion = value;
            }
        }
      
        public long IdRegistro
        {
            get
            {
                return _IdRegistro;
            }

            set
            {
                _IdRegistro = value;
            }
        }
        
        public int IdColegio
        {
            get
            {
                return _IdColegio;
            }

            set
            {
                _IdColegio = value;
            }
        }

        public string Colegio
        {
            get
            {
                return _Colegio;
            }

            set
            {
                _Colegio = value;
            }
        }
       
        public string ClaveProfesion
        {
            get
            {
                return _ClaveProfesion;
            }

            set
            {
                _ClaveProfesion = value;
            }
        }

        public int IdLocalidad
        {
            get
            {
                return _IdLocalidad;
            }

            set
            {
                _IdLocalidad = value;
            }
        }

        public string Localidad
        {
            get
            {
                return _Localidad;
            }

            set
            {
                _Localidad = value;
            }
        }

        public int AnioRegistroSOP
        {
            get
            {
                return _AnioRegistroSOP;
            }

            set
            {
                _AnioRegistroSOP = value;
            }
        }

        public string Observaciones
        {
            get
            {
                return _Observaciones;
            }

            set
            {
                _Observaciones = value;
            }
        }

        public string Clasificacion
        {
            get
            {
                return _Clasificacion;
            }

            set
            {
                _Clasificacion = value;
            }
        }
        public string Curp
        {
            get
            {
                return _Curp;
            }

            set
            {
                _Curp = value;
            }
        }
        public string Rfc
        {
            get
            {
                return _Rfc;
            }

            set
            {
                _Rfc = value;
            }
        }

        public string Nacimiento
        {
            get
            {
                return _Nacimiento;
            }

            set
            {
                _Nacimiento = value;
            }
        }

        public int UltimaVigencia
        {
            get
            {
                return _UltimaVigencia;
            }

            set
            {
                _UltimaVigencia = value;
            }
        }
    }
}