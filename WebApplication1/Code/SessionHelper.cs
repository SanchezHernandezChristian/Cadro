
using BusinessEntities;
using RestMembership.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApplication1.Code
{
    /// <summary>
    /// Clase auxiliar para administrar sesiones
    /// </summary>
    public class SessionHelper
    {       
        private const string PROYECTOVAR = "Proyecto";
        private const string LISTMARCADORESVAR = "puntos";
        private const string LISTMARCADORESMODIFICADOSVAR = "puntosIns";
        private const string LISTCOMPONENTESVAR = "lstComponentes";
        private const string LISTCOMPONENTESMODIFICADOSVAR = "lstCompInst";
        private const string DETALLEINTEGRACIONVAR = "CatIntegracion";
        private const string INFORMACIONUSUARIOVAR = "InfoUsuario";
        private const string LOGINVAR = "Login";
        private const string INDICEVAR = "Indice";
        private const string LISTESTIMACIONES = "ltEstimaciones";
        private const string OFCTRAMITE = "ofcTramite";
        private const string OFCRECEPCION = "ofcRecepcion";

        private const string OPINIONSOCIAL = "opinionSocial";
        private const string OPINIONTECNICA = "opinionTecnica";
        //private const string CEDPROYECTISTA = "cedProyectista";


        public static T Get<T>(string variable)
        {
            object valor = HttpContext.Current.Session[variable];
            if (valor == null)
                return default(T);
            else
                return ((T)valor);
        }

        public static void Set(string variable, object valor)
        {
            HttpContext.Current.Session[variable] = valor;
        }

        /// <summary>
        /// Obtiene y asigna valores a la sesión del proyecto
        /// </summary>
        public static Proyecto Proyecto
        {
            get
            {
                return Get<Proyecto>(PROYECTOVAR);
            }
            set
            {
                Set(PROYECTOVAR, value);
            }
        }
        /// <summary>
        /// Obtiene y asigna valores a la sesión de marcadores
        /// </summary>
        public static List<InfoBasicaMarcador> ListMarcador
        {
            get
            {
                return Get<List<InfoBasicaMarcador>>(LISTMARCADORESVAR);
            }
            set
            {
                Set(LISTMARCADORESVAR, value);
            }
        }
        /// <summary>
        /// Obtiene y asigna valores a la sesión de marcadores modificados
        /// </summary>
        public static List<InfoBasicaMarcador> ListMarcadoresModificados
        {
            get
            {
                return Get<List<InfoBasicaMarcador>>(LISTMARCADORESMODIFICADOSVAR);
            }
            set
            {
                Set(LISTMARCADORESMODIFICADOSVAR, value);
            }
        }

        /// <summary>
        /// Obtiene y asigna valores a la sesión de componentes
        /// </summary>
        public static List<Componente> ListComponentes
        {
            get
            {
                return Get<List<Componente>>(LISTCOMPONENTESVAR);
            }
            set
            {
                Set(LISTCOMPONENTESVAR, value);
            }
        }
        /// <summary>
        /// Obtiene y asigna valores a la sesión de componentes modificados
        /// </summary>
        public static List<Componente> ListComponentesModificados
        {
            get
            {
                return Get<List<Componente>>(LISTCOMPONENTESMODIFICADOSVAR);
            }
            set
            {
                Set(LISTCOMPONENTESMODIFICADOSVAR, value);
            }
        }
        /// <summary>
        /// Obtiene y asigna el detalle de un proyecto
        /// </summary>
        public static DetalleIntegracionProyecto DetalleIntegracionProyecto
        {
            get
            {
                return Get<DetalleIntegracionProyecto>(DETALLEINTEGRACIONVAR);
            }
            set
            {
                Set(DETALLEINTEGRACIONVAR, value);
            }
        }

        /// <summary>
        /// Obtiene y asigna la información de un usuario
        /// </summary>
        public static User InformacionUsuario
        {
            get
            {
                return Get<User>(INFORMACIONUSUARIOVAR);
            }
            set
            {
                Set(INFORMACIONUSUARIOVAR, value);
            }
        }
        /// <summary>
        /// Obtiene y asigna la información de el login
        /// </summary>
        public static bool Login
        {
            get
            {
                return Get<bool>(LOGINVAR);
            }
            set
            {
                Set(LOGINVAR, value);
            }
        }

        /// <summary>
        /// Obtiene y asigna la información de el login
        /// </summary>
        public static Int32? Indice
        {
            get
            {
                return Get<Int32>(INDICEVAR);
            }
            set
            {
                Set(INDICEVAR, value);
            }
        }

        /// <summary>
        /// Obtiene y asigna valores a la sesión de Estimaciones
        /// </summary>
        public static List<Estimacion> Estimaciones
        {
            get
            {
                return Get<List<Estimacion>>(LISTESTIMACIONES);
            }
            set
            {
                Set(LISTESTIMACIONES, value);
            }
        }


        /// <summary>
        /// Obtiene y asigna valores a la sesión de os oficios de la estimacion
        /// </summary>
        public static String OficioTramite
        {
            get
            {
                return Get<String>(OFCTRAMITE);
            }
            set
            {
                Set(OFCTRAMITE, value);
            }
        }


        /// <summary>
        /// Obtiene y asigna valores a la sesión de os oficios de la estimacion
        /// </summary>

        public static String OficioRecepcion
        {
            get
            {
                return Get<String>(OFCRECEPCION);
            }
            set
            {
                Set(OFCRECEPCION, value);
            }
        }



        public static List<OpinionSocial> OpinionSocial
        {
            get
            {
                return Get<List<OpinionSocial>>(OPINIONSOCIAL);
            }
            set
            {
                Set(OPINIONSOCIAL, value);
            }
        }


        public static List<OpinionTecnica> OpinionTecnica
        {
            get
            {
                return Get<List<OpinionTecnica>>(OPINIONTECNICA);
            }
            set
            {
                Set(OPINIONTECNICA, value);
            }
        }

        //public static String cedulaProyectista
        //{
        //    get
        //    {
        //        return Get<String>(CEDPROYECTISTA);
        //    }
        //    set
        //    {
        //        Set(CEDPROYECTISTA, value);
        //    }
        //}



    }
}