using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Code
{
    public class InfUsuario
    {
        private string _Nombre;
        private string _ApPaterno;
        private string _ApMaterno;
        private string _Correo;
        private string _Rol;
        private bool _IsActivo;
        private string _cedula;
        private string _nomUser;

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

        public string Paterno
        {
            get
            {
                return _ApPaterno;
            }

            set
            {
                _ApPaterno = value;
            }
        }

        public string Materno
        {
            get
            {
                return _ApMaterno;
            }

            set
            {
                _ApMaterno = value;
            }
        }

        public string nomUser
        {
            get
            {
                return _nomUser;
            }

            set
            {
                _nomUser = value;
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
