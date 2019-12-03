using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp.Code
{
    public class InfUsuario
    {
        private string _Nombre;
        private string _Correo;
        private string _Rol;
        private bool _IsActivo;
        private string _cedula;

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

        public string Rol
        {
            get
            {
                return _Rol;
            }

            set
            {
                _Rol = value;
            }
        }

        public bool IsActivo
        {
            get
            {
                return _IsActivo;
            }

            set
            {
                _IsActivo = value;
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
    }
}