using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BusinessEntities;
using DevExpress.Web;
using ERP.Core.Log4Net;
using Newtonsoft.Json;
using RestMembership.Models;
using UtilsInfraestructura;
using WebApplication1.Code;

namespace WebApplication1
{
    public partial class dro_detalleproyectos : System.Web.UI.Page
    {
        ApiService apiService;

        protected void Page_Load(object sender, EventArgs e)
        {
            apiService = new ApiService();
            try
            {
                if (!IsPostBack)
                {
                    getMunicipio();
                    getTipoProyecto();
                    getUnidadMedida();
                    SessionHelper.ListMarcadoresModificados = null;
                    SessionHelper.Proyecto = null;
                    SessionHelper.ListComponentes = null;
                    SessionHelper.DetalleIntegracionProyecto = null;
                    if (Request.QueryString["action"].ToString() != null)
                    {
                        if (Request.QueryString["action"].ToString() == "Edit")
                        {
                            if (Request.QueryString["id"].ToString() != null)
                            {
                                var response = apiService.GetObject(string.Format("Proyectos?id={0}", Request.QueryString["id"].ToString().Trim()));
                                if (response.IsSuccess)
                                {
                                    var p = JsonConvert.DeserializeObject<Proyecto>(response.Result.ToString());
                                    if (p.IdDRO.ToLower() == SessionHelper.InformacionUsuario.IdUser.ToLower())
                                    {
                                        SessionHelper.Proyecto = p;
                                        getDocumentos(p.IdCatProyecto, p.Folio);
                                        cmbMunicipio.ValueField = "Idmunicipio";
                                        cmbMunicipio.SelectedIndex = p.Idmunicipio - 1;
                                        getLocalidades(p.Idmunicipio);
                                        getCodigosPostales(p.Idmunicipio);
                                        cmbLocalidad.Value = p.Idlocalidad.ToString();
                                        cmbLocalidad.Text = p.StLocalidad;
                                        chkRenovacionOpinionTecnica.Checked = p.IsRenovacion;
                                        if (!string.IsNullOrEmpty(p.LocalidadOtroNombre))
                                        {
                                            //cp_otraLocalidad.ClientVisible = true;
                                            txtOtraLocalidad.Text = p.LocalidadOtroNombre;
                                        }
                                        txtLiga.Text = p.Link;
                                        cmbCodigoPostal.ValueField = "IdCP";
                                        cmbCodigoPostal.Value = p.CodigoPostal.ToString();
                                        cmbCodigoPostal.Text = p.CpYasentamiento;
                                        txtColonia.Text = p.Colonia;
                                        txtCalle.Text = p.Calle;
                                        txtNumExt.Text = p.NumeroExt.ToString();
                                        txtCalle1.Text = p.Calle1;
                                        txtCalle2.Text = p.Calle2;
                                        txtCalle3.Text = p.Calle3;
                                        txtCalle4.Text = p.Calle4;
                                        txtComentarioUbicacion.Text = p.ComentarioUbicacion;

                                        getTipoObras(p.IdTipoProyecto);
                                        getTipoAcciones(p.IdTipoProyecto);
                                        cmbTipoProyecto.Text = p.StTipoProyecto;
                                        cmbTipoProyecto.Value = p.IdTipoProyecto.ToString();
                                        if (p.IdTipoProyecto == 2 || p.IdTipoProyecto == 13 || (p.IdTipoProyecto == 10 && (p.TipoObra == 44 && p.IdCatProyecto == 4)) || (p.IdTipoProyecto == 10 && (p.TipoObra == 48 && p.IdCatProyecto == 3)))
                                        {
                                            cbpDRO.ClientVisible = false;
                                        }
                                        cmbSituacionObra.Value = p.SituacionObra;
                                        cmbSituacionObra.Text = p.SituacionObra;
                                        cmbTipoObra.Value = p.TipoObra.ToString() + " - " + p.IdCatProyecto.ToString();
                                        //cmbTipoObra.Text = p.StTipoObra;
                                        cmbAccion.ValueField = "IdTipodeAccion";
                                        cmbAccion.Value = p.TipoAccion.ToString();
                                        cmbAccion.Text = p.StTipoAccion;
                                        cmbUnidadMedida.ValueField = "IdUnidad";
                                        cmbUnidadMedida.Text = p.StUnidadMedida;
                                        cmbUnidadMedida.Value = p.IdUnidadMedida;
                                        txtFolio.Text = p.Folio.ToString();
                                        cmbModalidadEjecucion.Text = p.ModalidadEjecucion;
                                        cmbModalidadEjecucion.Value = p.ModalidadEjecucion;
                                        cmbEjercicio.Text = p.Ejercicio.ToString();
                                        cmbEjercicio.Value = p.Ejercicio.ToString();
                                        txtMeta.Value = p.Meta;
                                        txtImportePresupuesto.Value = p.InversionSolicitada;
                                        txtNombreProyecto.Text = p.StProyecto.ToUpper();
                                        txtdescripcionCedula.Text = p.DescripcionSimplificada.Trim().ToUpper();
                                        txtSolucion.Text = p.SolucionProblematica.Trim().ToUpper();
                                        txtDecripcionTecnica.Text = p.DescripcionTecnica.Trim().ToUpper();
                                        cmbTipoBeneficiario.Value = p.TipoBeneficiario;
                                        txtHombres.Value = p.NoHombres;
                                        txtMujeres.Value = p.NoMujeres;
                                        txtTotalBeneficiarios.Value = p.NoHombres + p.NoMujeres;

                                        txtCedulaProyectista.Text = p.CedulaProyectista.Trim();
                                        txtProyectista.Text = p.Proyectista.Trim();
                                        txtTelefonoProyectista.Text = p.TelefonoProyectista.Trim();
                                        txtCorreoProyectista.Text = p.CorreoProyectista.Trim();

                                        //Dro
                                        txtNumRegistroSinfra.Text = p.NoSinfraDro.Trim();
                                        txtclasificacion.Text = p.ClasificacionDRO.Trim();
                                        txtProfesion.Text = p.AvProfesion.Trim();
                                        txtTelenofoDRO.Text = p.Telefonodro.Trim();
                                        txtNombreDRO.Text = p.Dro.Trim();
                                        txtCorreoDRO.Text = p.Correodro.Trim();
                                        txtCedulaDRO.Text = p.CedulaDRO.Trim();
                                        txtLineaCaptura.Text = p.LineaCapturaFinanzas;
                                        txtFolioPago.Text = p.FolioPagoFinanzas;
                                        txtEstatusPago.Text = p.EstatusPagoFinanzas;
                                        //if(p.dr)


                                        //Fotos georeferenciadas
                                        if (p.LtImagen != null || p.LtImagen.Count > 0)
                                        {
                                            for (int i = 0; i < p.LtImagen.Count; i++)
                                            {
                                                ImageSliderItem sI = new ImageSliderItem();
                                                sI.ImageUrl = p.LtImagen[i].UrlIMagen;
                                                if (string.IsNullOrEmpty(p.LtImagen[i].Latitud))
                                                {
                                                    string UploadDirectory = (string.Format("~/Documents/{0}/img/{1}", SessionHelper.Proyecto.Folio, p.LtImagen[i].NombreImagen));
                                                    string resultFilePath = MapPath(UploadDirectory);
                                                    Coordenada resultIm = LocationExtractor.ExtractLocation(resultFilePath);
                                                    if (resultIm.IsCoordenadas)
                                                    {
                                                        sI.Text = string.Format("{0}: {1},{2}", p.LtImagen[i].Descripcion, resultIm.Latitud, resultIm.Longitud);
                                                    }
                                                }
                                                else
                                                {
                                                    sI.Text = string.Format("{0}: {1},{2}", p.LtImagen[i].Descripcion, p.LtImagen[i].Latitud, p.LtImagen[i].Longitud);
                                                }
                                                imgSliderGeoreferencia.Items.Add(sI);
                                            }
                                        }
                                        cmbAccion.ReadOnly = true;
                                        cmbTipoObra.ReadOnly = true;
                                        cmbTipoProyecto.ReadOnly = true;
                                        //COmponentes
                                        getComponentes(p.Folio);
                                        ocultarCargaConceptos();

                                        if (p.StatusProyecto >= 2)
                                        {
                                            soloLectura();
                                            var numTecParaSolventar = SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Where(x => x.IsParaSolventar || x.StDetalleRevisionTecnica == "OBSERVADO").Count();
                                            var numSocParaSolventar = SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion.Where(x => x.IsParaSolventar || x.StDetalleRevisionSocial == "OBSERVADO" || x.StObservacionTecnica == "OBSERVADO" || x.StObservacionTecnica == "PENDIENTE DE FIRMAS").Count();
                                            
                                            if (SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica == "EN REVISIÓN")
                                            {
                                                txtNombreProyecto.ReadOnly = false;
                                                cmbModalidadEjecucion.ReadOnly = false;
                                                cmbUnidadMedida.ReadOnly = false;
                                            }
                                            if (SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica == "EN CERTIFICACIÓN" || SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica == "EN REVISIÓN" || SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica == "EN VISTO BUENO")
                                            {
                                                activarEdicion();
                                            }
                                            if (SessionHelper.Proyecto.StatusProyecto < 6)
                                            {
                                                txtdescripcionCedula.ReadOnly = false;
                                                txtSolucion.ReadOnly = false;
                                                txtDecripcionTecnica.ReadOnly = false;
                                                btnAgregarComponente.Visible = true;
                                                btnGuardarComponentes.Visible = true;
                                                cmbUnidadMedida.ReadOnly = false;
                                                cmbSituacionObra.ReadOnly = false;
                                                txtMeta.ReadOnly = false;
                                                txtHombres.ReadOnly = false;
                                                txtMujeres.ReadOnly = false;
                                            }
                                        }

                                    }
                                    else
                                    {
                                        //Regresar
                                        Response.Redirect("~/dro_misproyectos.aspx");
                                    }
                                }
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }

        }
        private void ocultarCargaConceptos()
        {
            gridViewConceptos.DataBind();
        }
        private void soloLectura()
        {
            chkRenovacionOpinionTecnica.ReadOnly = true;
            cmbMunicipio.ReadOnly = true;
            cmbLocalidad.ReadOnly = true;
            txtOtraLocalidad.ReadOnly = true;
            txtLiga.ReadOnly = true;
            txtCedulaProyectista.ReadOnly = true;
            txtNumRegistroSinfra.ReadOnly = true;
            cmbCodigoPostal.ReadOnly = true;
            txtColonia.ReadOnly = true;
            txtCalle.ReadOnly = true;
            txtNumExt.ReadOnly = true;
            txtCalle1.ReadOnly = true;
            txtCalle2.ReadOnly = true;
            txtCalle3.ReadOnly = true;
            txtCalle4.ReadOnly = true;
            txtComentarioUbicacion.ReadOnly = true;
            cmbTipoProyecto.ReadOnly = true;
            cmbTipoObra.ReadOnly = true;
            cmbAccion.ReadOnly = true;
            cmbUnidadMedida.ReadOnly = true;
            cmbSituacionObra.ReadOnly = true;
            txtFolio.ReadOnly = true;
            cmbModalidadEjecucion.ReadOnly = true;
            cmbEjercicio.ReadOnly = true;
            txtMeta.ReadOnly = true;
            txtImportePresupuesto.ReadOnly = true;
            txtNombreProyecto.ReadOnly = true;
            txtdescripcionCedula.ReadOnly = true;
            txtDecripcionTecnica.ReadOnly = true;
            cmbTipoBeneficiario.ReadOnly = true;
            txtHombres.ReadOnly = true;
            txtMujeres.ReadOnly = true;
            txtTotalBeneficiarios.ReadOnly = true;
            txtCedulaProyectista.ReadOnly = true;
            txtProyectista.ReadOnly = true;
            txtTelefonoProyectista.ReadOnly = true;
            txtCorreoProyectista.ReadOnly = true;

            //Dro
            txtNumRegistroSinfra.ReadOnly = true;
            txtclasificacion.ReadOnly = true;
            txtProfesion.ReadOnly = true;
            txtTelenofoDRO.ReadOnly = true;
            txtNombreDRO.ReadOnly = true;
            txtCorreoDRO.ReadOnly = true;
            txtCedulaDRO.ReadOnly = true;
            btnBuscarDRO.Visible = false;
            btnAgregarComponente.Visible = false;
            btnBuscarProyectista.Visible = false;
            btnGuardarGeoreferencias.Visible = false;
            btnGuardarComponentes.Visible = false;
            upcFotos.Visible = false;
        }

        private void activarEdicion()
        {

            txtImportePresupuesto.ReadOnly = false;
            txtdescripcionCedula.ReadOnly = false;
            txtDecripcionTecnica.ReadOnly = false;
            cmbModalidadEjecucion.ReadOnly = false;
            //Dro
            btnAgregarComponente.Visible = true;
            btnGuardarComponentes.Visible = true;
            txtMeta.ReadOnly = false;
            txtHombres.ReadOnly = false;
            txtMujeres.ReadOnly = false;
        }
        private void ActivaComponentes()
        {
            //txtImportePresupuesto.ReadOnly = false;
            txtdescripcionCedula.ReadOnly = false;
            txtDecripcionTecnica.ReadOnly = false;
            //Dro
            btnAgregarComponente.Visible = true;
            btnGuardarComponentes.Visible = true;
            txtMeta.ReadOnly = false;
            txtHombres.ReadOnly = false;
            txtMujeres.ReadOnly = false;
        }

        #region CATALOGOS
        private void getMunicipio()
        {
            try
            {
                var response = apiService.GetLista<Municipio>(string.Format("Municipios?idEntidad=20"));
                if (response.IsSuccess)
                {
                    cmbMunicipio.DataSource = (List<Municipio>)response.Result;
                    cmbMunicipio.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cmbLocalidad_Callback(object sender, DevExpress.Web.CallbackEventArgsBase e)
        {
            try
            {
                int idMun = Convert.ToInt32(cmbMunicipio.Value.ToString());
                getLocalidades(idMun);
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
                lblError.Text = ex.Message;
            }
        }

        private void getLocalidades(int id)
        {
            try
            {
                var response = apiService.GetLista<Localidad>(string.Format("Localidades?idMun={0}", id));
                if (response.IsSuccess)
                {
                    cmbLocalidad.DataSource = (List<Localidad>)response.Result;
                    cmbLocalidad.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cmbCodigoPostal_Callback(object sender, CallbackEventArgsBase e)
        {
            try
            {
                int idMun = Convert.ToInt32(cmbMunicipio.Value.ToString());
                getCodigosPostales(idMun);
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
                lblError.Text = ex.Message;
            }
        }

        private void getCodigosPostales(int id)
        {
            try
            {
                var response = apiService.GetLista<CodigoPostal>(string.Format("CodigosPostales?idMunicipio={0}", id));
                if (response.IsSuccess)
                {
                    cmbCodigoPostal.DataSource = (List<CodigoPostal>)response.Result;
                    cmbCodigoPostal.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        private void getTipoProyecto()
        {
            try
            {
                var response = apiService.GetLista<CatTipoProyecto>(string.Format("CatTipoProyecto"));
                if (response.IsSuccess)
                {
                    var lista = (List<CatTipoProyecto>)response.Result;
                    var listaProyectosActivos = lista.Where(x => x.IsActivo == true).ToList();
                    cmbTipoProyecto.DataSource = listaProyectosActivos;
                    cmbTipoProyecto.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
                lblError.Text = ex.Message;
            }
        }

        protected void cmbTipoObra_Callback(object sender, CallbackEventArgsBase e)
        {
            try
            {
                int idTipoPRoy = Convert.ToInt32(cmbTipoProyecto.Value.ToString());
                getTipoObras(idTipoPRoy);
                getUnidadMedida();
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        private void getTipoObras(int idProy)
        {
            try
            {
                var response = apiService.GetLista<CatTipoObra>(String.Format("CatTipoObras?idProyecto={0}", idProy));
                if (response.IsSuccess)
                {
                    var lista = (List<CatTipoObra>)response.Result;
                    var listaTipoObras = lista.Where(x => x.IsActivo == true).ToList();
                    cmbTipoObra.DataSource = listaTipoObras;
                    cmbTipoObra.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cmbAccion_Callback(object sender, CallbackEventArgsBase e)
        {
            try
            {
                int idTipoPRoy = Convert.ToInt32(cmbTipoProyecto.Value.ToString());
                getTipoAcciones(idTipoPRoy);
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
                lblError.Text = ex.Message;
            }
        }

        private void getTipoAcciones(int idProy)
        {
            try
            {
                var response = apiService.GetLista<CatTipoAccion>(String.Format("CatTipoAcciones?idProyecto={0}", idProy));
                if (response.IsSuccess)
                {
                    cmbAccion.DataSource = (List<CatTipoAccion>)response.Result;
                    cmbAccion.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cmbUnidadMedida_Callback(object sender, CallbackEventArgsBase e)
        {
            getUnidadMedida();
        }

        private void getUnidadMedida()
        {
            try
            {
                var response = apiService.GetLista<UnidadMedida>(string.Format("UnidadMedidas"));
                if (response.IsSuccess)
                {
                    var lista = (List<UnidadMedida>)response.Result;
                    cmbUnidadMedida.DataSource = (List<UnidadMedida>)response.Result;
                    cmbUnidadMedida.DataBind();

                    var listaUnidades1 = lista.Where(x => x.Componente == true).ToList();
                    cmbUnidadMedidaComponentes.DataSource = listaUnidades1;
                    cmbUnidadMedidaComponentes.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cbpBuscarProyectista_Callback(object sender, CallbackEventArgsBase e)
        {
            lblProyectista.Text = string.Empty;
            string resultado = string.Empty;
            string nombre = string.Empty;
            try
            {
                if (!string.IsNullOrEmpty(txtCedulaProyectista.Text))
                {
                    var res = apiService.GetObject(string.Format("Proyectistas?cedula={0}&op=0", txtCedulaProyectista.Text));
                    if (res.IsSuccess)
                    {
                        var objResponse = JsonConvert.DeserializeObject<Response>(res.Result.ToString());
                        if (objResponse.IsSuccess)
                        {
                            var proyectista = JsonConvert.DeserializeObject<Proyectista>(objResponse.Result.ToString());
                            //Falta valdidar si ya culmino su captura
                            txtProyectista.Text = proyectista.Nombre.Trim().ToUpper();
                            txtCorreoProyectista.Text = proyectista.Correo.Trim();
                            txtTelefonoProyectista.Text = proyectista.Telefono.Trim();
                            btnBuscarProyectista.Enabled = false;
                            //resultado = string.Format("true|{0}|{1}|{2}", proyectista.Nombre, proyectista.Correo, proyectista.Telefono);
                        }
                        else
                        {
                            lblProyectista.Text = objResponse.Message.Trim();
                            txtProyectista.Text = string.Empty;
                            txtCorreoProyectista.Text = string.Empty;
                            txtTelefonoProyectista.Text = string.Empty;
                            btnBuscarProyectista.Enabled = true;
                        }
                    }
                }
                else
                {
                    lblProyectista.Text = "Es obligatorio captura la cédula del proyectista.";
                }
            }
            catch (Exception ex)
            {
                resultado = "false|" + ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cbpDRO_Callback(object sender, CallbackEventArgsBase e)
        {
            lblDro.Text = string.Empty;
            string resultado = string.Empty;
            string nombre = string.Empty;
            try
            {
                if (!string.IsNullOrEmpty(txtNumRegistroSinfra.Text))
                {
                    string reg = txtNumRegistroSinfra.Text;
                    var res = apiService.GetObject(string.Format("Dros?registro={0}", reg));
                    if (res.IsSuccess)
                    {
                        var dro = JsonConvert.DeserializeObject<Dro>(res.Result.ToString());
                        if (dro.CedulaProfesional != null)
                        {
                            txtclasificacion.Text = dro.Clasificacion;
                            txtCedulaDRO.Text = dro.CedulaProfesional;
                            txtProfesion.Text = dro.ClaveProfesion.Trim();
                            txtCorreoDRO.Text = dro.Email;
                            txtNombreDRO.Text = string.Format("{0} {1} {2}", dro.Nombres, dro.ApellidoPaterno, dro.ApellidoMaterno);
                            txtTelenofoDRO.Text = dro.TelefonoCelular;
                            btnBuscarDRO.Enabled = false;
                        }
                        else
                        {
                            lblDro.Text = string.Format("El D. R. O. con número de registro SINFRA {0} no existe.", txtNumRegistroSinfra.Text);
                        }
                    }
                    else
                    {
                        lblDro.Text = "Ocurrio un error intentelo más tarde.";
                    }

                }
                else
                {
                    lblDro.Text = "Escriba un número de registro SINFRA.";
                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void getComponentes(Int64 folio)
        {
            var gtC = apiService.GetLista<Componente>(string.Format("Componentes?folio={0}", folio));
            if (gtC.IsSuccess)
            {
                SessionHelper.ListComponentes = (List<Componente>)gtC.Result;
                gvComponentes.DataBind();
            }
            else
            {
                lblError.Text = gtC.Message;
            }
        }
        #endregion

        #region GEOREFERENCIAS
        protected void upcFotos_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            try
            {
                if (SessionHelper.Proyecto != null)
                {
                    List<Imagen> ltImg = new List<Imagen>();
                    Imagen img = new Imagen();
                    Guid g2 = Guid.NewGuid();
                    string file = string.Format("SituacionActual_{0}_{1}{2}", SessionHelper.Proyecto.Folio, g2.ToString("N"), Path.GetExtension(e.UploadedFile.FileName));
                    string UploadDirectory = (string.Format("~/Documents/{0}/img/{1}", SessionHelper.Proyecto.Folio, file));
                    string resultFilePath = MapPath(UploadDirectory);
                    e.UploadedFile.SaveAs(resultFilePath);
                    var ftValidada = Utils.verificarMetadatosFotografia(resultFilePath);
                    //if (ftValidada.IsSuccess)
                    //{

                    var result = LocationExtractor.ExtractLocation(resultFilePath);
                    if (result.IsCoordenadas)
                    {
                        img.Estado = "Situación Actual";
                        img.FechaCaptura = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff");
                        img.NombreImagen = file;
                        int i = e.UploadedFile.FileName.IndexOf('.');
                        img.Descripcion = e.UploadedFile.FileName.Substring(0, i);
                        img.UrlIMagen = string.Format("~/{0}", ResolveClientUrl(UploadDirectory));
                        img.IsModificado = true;
                        img.Latitud = result.Latitud.ToString();
                        img.Longitud = result.Longitud.ToString();
                        if (SessionHelper.Proyecto.LtImagen != null)
                        {
                            // string.Format("SituacionActual_{0}_{1}{2}", SessionHelper.Proyecto.Folio, SessionHelper.Proyecto.LtImagen.Count + 1, Path.GetExtension(e.UploadedFile.FileName));
                            img.Id = SessionHelper.Proyecto.LtImagen.Count + 1;
                            SessionHelper.Proyecto.LtImagen.Add(img);
                        }
                        else
                        {
                            img.Id = 1;
                            ltImg.Add(img);
                            SessionHelper.Proyecto.LtImagen = ltImg;
                        }
                        string name = e.UploadedFile.FileName;
                        string url = ResolveClientUrl(UploadDirectory);
                        long sizeInKilobytes = e.UploadedFile.ContentLength / 1024;
                        string sizeText = sizeInKilobytes.ToString() + " KB";
                        e.CallbackData = string.Format("true|{0}|{1}", result.Latitud, result.Longitud);
                    }
                    else
                        e.CallbackData = string.Format("false|{0}", result.Mensaje);
                    //}
                    //else
                    //    e.CallbackData = string.Format("false|{0}", ftValidada.Message);

                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cbGeoreferencias_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                if (SessionHelper.Proyecto.LtImagen != null)
                {
                    var json = JsonConvert.SerializeObject(SessionHelper.Proyecto.LtImagen);
                    e.Result = json;
                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cbpFotosGeoreferenciadas_Callback(object sender, CallbackEventArgsBase e)
        {
            try
            {
                imgSliderGeoreferencia.Items.Clear();
                for (int i = 0; i < SessionHelper.Proyecto.LtImagen.Count; i++)
                {
                    ImageSliderItem sI = new ImageSliderItem();
                    sI.ImageUrl = SessionHelper.Proyecto.LtImagen[i].UrlIMagen;
                    sI.Text = string.Format("{0}: {1},{2}", SessionHelper.Proyecto.LtImagen[i].Descripcion, SessionHelper.Proyecto.LtImagen[i].Latitud, SessionHelper.Proyecto.LtImagen[i].Longitud);
                    imgSliderGeoreferencia.Items.Add(sI);
                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cbpImgDet_Callback(object sender, CallbackEventArgsBase e)
        {
            ibFotoGeoreferenciada.ImageUrl = e.Parameter;
        }

        protected void gvPuntos_DataBinding(object sender, EventArgs e)
        {
            try
            {
                if (SessionHelper.Proyecto.LtImagen != null)
                {
                    gvPuntos.DataSource = SessionHelper.Proyecto.LtImagen;
                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void gvPuntos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            gvPuntos.DataBind();
        }

        #endregion

        protected void cbGuardarProyecto_Callback(object source, CallbackEventArgs e)
        {
            e.Result = guardarProyecto();
        }

        private string guardarProyecto()
        {
            string msj = "";
            try
            {
                if (SessionHelper.InformacionUsuario != null)
                {
                    Proyecto p = new Proyecto();
                    var v = validarCampos();
                    if (v.IsSuccess)
                    {
                        p.IdEmpresa = SessionHelper.InformacionUsuario.IdUser;
                        p.IdUsuarioProyecto = SessionHelper.InformacionUsuario.IdUser;
                        //p.Cv = SessionHelper.InformacionUsuario.Cv;
                        if (SessionHelper.Proyecto != null)
                        {
                            p.Folio = SessionHelper.Proyecto.Folio;
                            p.StStatusProyecto = SessionHelper.Proyecto.StStatusProyecto;
                            //p.StatusProyecto = SessionHelper.Proyecto.StatusProyecto;
                            if (SessionHelper.Proyecto.LtImagen != null)
                                p.LtImagen = SessionHelper.Proyecto.LtImagen;
                            if (SessionHelper.ListComponentes != null)
                                p.LtComponente = SessionHelper.ListComponentes;
                        }
                        p.ProyectoPendiente = SessionHelper.Proyecto.ProyectoPendiente;
                        //Ubicacion de la obra
                        p.FolioPagoFinanzas = SessionHelper.Proyecto.FolioPagoFinanzas;
                        p.LineaCapturaFinanzas = SessionHelper.Proyecto.LineaCapturaFinanzas;
                        p.EstatusPagoFinanzas = SessionHelper.Proyecto.EstatusPagoFinanzas;
                        p.StStatusProyecto = SessionHelper.Proyecto.StStatusProyecto;
                        p.Idmunicipio = int.Parse(cmbMunicipio.Value.ToString());
                        p.Idlocalidad = Convert.ToInt32(cmbLocalidad.Value.ToString());
                        p.LocalidadOtroNombre = txtOtraLocalidad.Text.Trim();
                        p.Link = txtLiga.Text.Trim();
                        p.CodigoPostal = Convert.ToInt32(cmbCodigoPostal.Value.ToString()); p.CodigoPostal = Convert.ToInt32(cmbCodigoPostal.Value.ToString());
                        p.Colonia = txtColonia.Text.Trim();
                        p.Calle = txtCalle.Text.Trim();
                        p.NumeroExt = int.Parse(txtNumExt.Text.Trim());
                        p.Calle1 = txtCalle1.Text.Trim();
                        p.Calle2 = txtCalle2.Text.Trim();
                        p.Calle3 = txtCalle3.Text.Trim();
                        p.Calle4 = txtCalle4.Text.Trim();
                        p.ComentarioUbicacion = txtComentarioUbicacion.Text.Trim();
                        p.IsRenovacion = chkRenovacionOpinionTecnica.Checked;
                        //Informacion Tecnica Basica
                        p.ModalidadEjecucion = cmbModalidadEjecucion.Text;
                        p.Ejercicio = Convert.ToInt32(cmbEjercicio.Text);
                        p.IdTipoProyecto = Convert.ToInt32(cmbTipoProyecto.Value.ToString());
                        string tipoID = cmbTipoObra.Value.ToString();
                        string[] ids = tipoID.ToString().Split(new char[] { '-' });

                        if (ids.Length >= 2)
                        {
                            int idProyAnterior = int.Parse(ids[1]);
                            int idTipoObra = int.Parse(ids[0]);
                            p.TipoObra = idTipoObra;
                            p.IdCatProyecto = idProyAnterior;
                        }
                        p.TipoAccion = Convert.ToInt32(cmbAccion.Value.ToString());
                        p.IdUnidadMedida = Convert.ToInt32(cmbUnidadMedida.Value.ToString());
                        p.Meta = decimal.Parse(txtMeta.Value.ToString());
                        p.InversionSolicitada = decimal.Parse(txtImportePresupuesto.Value.ToString());
                        p.StProyecto = txtNombreProyecto.Text.Trim().ToUpper();
                        p.DescripcionSimplificada = txtdescripcionCedula.Text.Trim().ToUpper();
                        p.SolucionProblematica = txtSolucion.Text.Trim().ToUpper();
                        p.DescripcionTecnica = txtDecripcionTecnica.Text.Trim().ToUpper();
                        p.NoMujeres = int.Parse(txtMujeres.Text);
                        p.NoHombres = int.Parse(txtHombres.Text);
                        p.SituacionObra = cmbSituacionObra.Text;
                        p.TipoBeneficiario = cmbTipoBeneficiario.Text.Trim();
                        p.CedulaProyectista = SessionHelper.InformacionUsuario.IdUser;
                        p.SituacionObra = cmbSituacionObra.Text;
                        //si es estudio
                        if (p.IdTipoProyecto == 2 || p.IdTipoProyecto == 13)
                        {
                            p.NoSinfraDro = "";
                            p.Dro = "";
                            p.Telefonodro = "";
                            p.ClasificacionDRO = "";
                            p.CedulaDRO = "";
                        }
                        else
                        {
                            p.NoSinfraDro = txtCedulaDRO.Text.Trim(); //txtNumRegistroSinfra.Text.Trim();
                            p.Dro = txtNombreDRO.Text.Trim();
                            p.Telefonodro = txtTelenofoDRO.Text.Trim();
                            p.ClasificacionDRO = txtclasificacion.Text.Trim();
                            p.IsDROConfirm = SessionHelper.Proyecto.IsDROConfirm;
                            p.CedulaDRO = txtCedulaDRO.Text.Trim();
                        }
                        p.IdProyectista = SessionHelper.InformacionUsuario.IdUser;
                        p.IdPromovente = SessionHelper.Proyecto.IdPromovente;
                        var response = apiService.post("Proyectos", p);
                        if (response.IsSuccess)
                        {
                            msj = "true|Información guardado correctamente.";
                            // Match m = Regex.Match(response.Message, @"\d+");
                            //p.Folio = int.Parse(m.Value);
                            SessionHelper.Proyecto = JsonConvert.DeserializeObject<Proyecto>(response.Result.ToString());
                            string pathToCreate = string.Format("~/Documents/{0}", SessionHelper.Proyecto.Folio);
                            if (!Directory.Exists(Server.MapPath(pathToCreate)))
                            {
                                Directory.CreateDirectory(Server.MapPath(pathToCreate));
                                Directory.CreateDirectory(Server.MapPath(string.Format("{0}/img", pathToCreate)));

                                SessionHelper.DetalleIntegracionProyecto = new DetalleIntegracionProyecto();

                                SessionHelper.DetalleIntegracionProyecto.DetalleTecnico = new IntegracionTecnico();
                                SessionHelper.DetalleIntegracionProyecto.IntegSocial = new IntegracionSocial();

                                SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.Folio = SessionHelper.Proyecto.Folio;
                                SessionHelper.DetalleIntegracionProyecto.IntegSocial.Folio = SessionHelper.Proyecto.Folio;
                                SessionHelper.DetalleIntegracionProyecto.IntegSocial.FechaCaptura = DateTime.Now;
                                SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.FechaCaptura = DateTime.Now;

                                SessionHelper.DetalleIntegracionProyecto.IntegSocial.IdUsuario = SessionHelper.InformacionUsuario.IdUser;
                                SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.IdUsuario = SessionHelper.InformacionUsuario.IdUser;

                                // var lisDocSocial = SessionHelper.DetalleIntegracionProyecto.LtDetSocial.Where(x => x.IsDoc == true).ToList();
                                // SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion = lisDocSocial;

                            }
                            var responseSociales = apiService.post("IntegracionSocial", SessionHelper.DetalleIntegracionProyecto.IntegSocial);
                            var responseTecnicos = apiService.post("IntegracionTecnica", SessionHelper.DetalleIntegracionProyecto.DetalleTecnico);
                        }
                        else
                        {
                            msj = "false|" + response.Message;
                        }
                    }
                    else
                    {
                        msj = "false|" + v.Message;
                    }
                }
                else
                {
                    msj = "false|Ha finalizado la sesión del usuario.";
                }
            }
            catch (Exception ex)
            {
                msj = "false|Ocurrio un error al guardar la información";
                Log4NetCommon.WriteException(ex);
            }
            return msj;
        }

        protected void cbEnviarRevision_Callback(object source, CallbackEventArgs e)
        {

        }

        protected void cbGuardarGeoreferencia_Callback(object source, CallbackEventArgs e)
        {

        }


        #region componentes

        protected void gvComponentes_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            gvComponentes.DataBind();
        }

        protected void gvComponentes_DataBinding(object sender, EventArgs e)
        {
            if (SessionHelper.ListComponentes != null)
                gvComponentes.DataSource = SessionHelper.ListComponentes.Where(x => x.IsVisible == true);
        }

        protected void cbAgregarCoponente_Callback(object source, CallbackEventArgs e)
        {

        }

        protected void cbpComponentes_Callback(object sender, CallbackEventArgsBase e)
        {
            string msj = string.Empty;
            decimal montoAcumulado = 0;
            List<Componente> lstComp = new List<Componente>();
            if (SessionHelper.Proyecto != null)
            {
                decimal montoAprobado = decimal.Parse(SessionHelper.Proyecto.MontoTotal.ToString());
                try
                {
                    Componente co = new Componente();
                    if (SessionHelper.ListComponentes != null)
                    {
                        lstComp = SessionHelper.ListComponentes.Where(c => c.IsVisible == true).ToList();
                    }
                    montoAcumulado = lstComp.Sum(su => su.TotalComponente) + decimal.Parse(txtImporteComponente.Text);
                    if (montoAprobado < montoAcumulado)
                    {
                        msj = "Verifique el importe acumulado excede el importe del presupuesto.";
                        txtComponente.Text = string.Empty;
                        cmbUnidadMedidaComponentes.SelectedIndex = -1;
                        txtCantidadComponentes.Text = string.Empty;
                        txtImporteComponente.Text = string.Empty;
                        txtAplicaMeta.Checked = false;
                    }
                    else
                    {
                        co.Orden = lstComp.Count + 1;
                        co.IsModificado = true;
                        co.NombreComponente = txtComponente.Text;
                        co.StUnidadMedida = cmbUnidadMedidaComponentes.Text;
                        co.CantidadComponente = decimal.Parse(txtCantidadComponentes.Text);
                        co.TotalComponente = decimal.Parse(txtImporteComponente.Value.ToString());
                        co.PrecioUnitarioComponente = (co.TotalComponente / co.CantidadComponente) / ((decimal)1.16);
                        co.SubtotalComponente = co.PrecioUnitarioComponente * co.CantidadComponente;
                        co.IsVisible = true;
                        if (txtAplicaMeta.Checked)
                        {
                            co.IsSeleccionado = true;
                        }
                        else
                        {
                            co.IsSeleccionado = false;
                        }
                        co.FolioProyecto = SessionHelper.Proyecto.Folio;
                        lstComp.Add(co);
                        SessionHelper.ListComponentes = lstComp;
                        msj = "Componente agregado";
                        txtComponente.Text = string.Empty;
                        cmbUnidadMedidaComponentes.SelectedIndex = -1;
                        txtCantidadComponentes.Text = string.Empty;
                        txtImporteComponente.Text = string.Empty;
                        txtAplicaMeta.Checked = false;
                    }
                }
                catch (Exception ex)
                {
                    msj = "Para poder agregar componentes primero debe guardar la información basica del proyecto.";
                    Log4NetCommon.WriteException(ex);
                }
            }
            else
            {
                msj = "Debe guardar primero el proyecto.";
            }
            cbpComponentes.JSProperties.Add("cp_msj", msj);
        }

        protected void cbEliminaComponente_Callback(object source, CallbackEventArgs e)
        {
            string msj = string.Empty;
            if (SessionHelper.Proyecto != null)
            {
                try
                {

                    var key = Convert.ToUInt32(e.Parameter.ToString());
                    SessionHelper.ListComponentes.Where(p => p.Orden == key).First().IsModificado = true;
                    SessionHelper.ListComponentes.Where(p => p.Orden == key).First().IsVisible = false;
                    msj = "true|Componente eliminado correctamente.";
                }
                catch (Exception ex)
                {
                    msj = "false|Ocurrio un problema la eliminar el componente.";
                    Log4NetCommon.WriteException(ex);
                }
            }
            else
            {
                msj = "false|Debe guardar primero el proyecto.";
            }
            e.Result = msj;
        }

        protected void cbpComponentes_CustomJSProperties(object sender, CustomJSPropertiesEventArgs e)
        {
        }
        #endregion

        Response validarCampos()
        {
            Response result = new Response();
            string msj = "***Campos obligatorios***\n";
            try
            {
                result.IsSuccess = true;

                if (cmbMunicipio.Value == null)
                {
                    result.IsSuccess = false;
                    msj += "Municipio.\n";
                }
                if (cmbLocalidad.Value == null)
                {
                    result.IsSuccess = false;
                    msj += "Localidad.\n";
                }
                else
                {
                    if (int.Parse(cmbLocalidad.Value.ToString()) == 999)
                    {
                        if (string.IsNullOrEmpty(txtOtraLocalidad.Text))
                        {
                            result.IsSuccess = false;
                            msj += "Otra localidad.\n";
                        }
                        if (string.IsNullOrEmpty(txtLiga.Text))
                        {
                            result.IsSuccess = false;
                            msj += "Liga del DOF.\n";
                        }
                    }

                }
                if (cmbCodigoPostal.Value == null)
                {
                    result.IsSuccess = false;
                    msj += "Codigo postal.\n";
                }
                if (string.IsNullOrEmpty(txtColonia.Text))
                {
                    result.IsSuccess = false;
                    msj += "Colonia.\n";
                }
                if (string.IsNullOrEmpty(txtCalle.Text))
                {
                    result.IsSuccess = false;
                    msj += "Calle.\n";
                }
                if (string.IsNullOrEmpty(txtNumExt.Text))
                {
                    result.IsSuccess = false;
                    msj += "Número exterior.\n";
                }
                if (string.IsNullOrEmpty(txtCalle1.Text) || string.IsNullOrEmpty(txtCalle2.Text))
                {
                    result.IsSuccess = false;
                    msj += "Registrar al menos dos calles.\n";
                }
                if (string.IsNullOrEmpty(txtComentarioUbicacion.Text))
                {
                    result.IsSuccess = false;
                    msj += "Referencia de la ubicación.\n";
                }

                if (cmbTipoProyecto.Value == null)
                {
                    result.IsSuccess = false;
                    msj += "Tipo de Proyecto.\n";
                }
                if (cmbTipoObra.Value == null)
                {
                    result.IsSuccess = false;
                    msj += "Tipo de Obra.\n";
                }
                if (cmbAccion.Value == null)
                {
                    result.IsSuccess = false;
                    msj += "Tipo de Acción.\n";
                }

                //if (cmbUnidadMedida.Value == null)
                //{
                //    result.IsSuccess = false;
                //    msj += "Unidad de Medida.\n";
                //}

                //if (string.IsNullOrEmpty(txtMeta.Text))
                //{
                //    result.IsSuccess = false;
                //    msj += "Meta.\n";
                //}

                //if (string.IsNullOrEmpty(txtImportePresupuesto.Text))
                //{
                //    result.IsSuccess = false;
                //    msj += "Importe del presupuesto.\n";
                //}

                if (string.IsNullOrEmpty(txtNombreProyecto.Text))
                {
                    result.IsSuccess = false;
                    msj += "Nombre de la Obra.\n";
                }
                //if (string.IsNullOrEmpty(txtdescripcionCedula.Text))
                //{
                //    result.IsSuccess = false;
                //    msj += "Descripción de la Obra de la Cédula.\n";
                //}
                //if (string.IsNullOrEmpty(txtDecripcionTecnica.Text))
                //{
                //    result.IsSuccess = false;
                //    msj += "Descripción técnica simplificada.\n";
                //}

                if (string.IsNullOrEmpty(txtHombres.Text))
                {
                    result.IsSuccess = false;
                    msj += "Número de Hombres.\n";
                }
                if (string.IsNullOrEmpty(txtMujeres.Text))
                {
                    result.IsSuccess = false;
                    msj += "Número de Mujeres.\n";
                }

                if (string.IsNullOrEmpty(txtCedulaProyectista.Text))
                {
                    result.IsSuccess = false;
                    msj += "Cédula Profesional de Proyectista\n";
                }

                if (cmbTipoProyecto.Value == null)
                {
                    if (int.Parse(cmbTipoProyecto.Value.ToString()) == 2)
                    {
                    }
                    else
                    {
                        if (string.IsNullOrEmpty(txtNumRegistroSinfra.Text))
                        {
                            result.IsSuccess = false;
                            msj += "Número de registro SINFRA de D. R. O.\n";
                        }
                    }
                }
                result.Message = msj;
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
                result.IsSuccess = false;
                result.Message = "Ocurrio un error al validar la Información.\n" + ex.Message;
            }
            return result;
        }


        // INICIA PESTAÑA "DOCUMENTACIÓN"
        private void getDocumentos(int tipoProyecto, Int64 folio)
        {
            try
            {
                if (SessionHelper.Proyecto == null) folio = 0; else folio = SessionHelper.Proyecto.Folio;

                SessionHelper.DetalleIntegracionProyecto = null;
                var response = apiService.GetObject(string.Format("CatIntegracion?folio={0}&idTipoProyecto={1}", folio, tipoProyecto));

                if (response.IsSuccess)
                {
                    var objInte = JsonConvert.DeserializeObject<DetalleIntegracionProyecto>(response.Result.ToString());
                    User objContexto = SessionHelper.InformacionUsuario;

                    objInte.DetalleTecnico.LtDocumentacionTecnico = objInte.DetalleTecnico.LtDocumentacionTecnico.OrderBy(x => x.Orden).ToList();
                    SessionHelper.DetalleIntegracionProyecto = objInte;

                    gvDocsSociales.DataBind();
                    gvDocsTecnicos.DataBind();
                }
                else
                {
                    lblError.Text = response.Message;
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void cbpDocumentos_Callback(object sender, CallbackEventArgsBase e)
        {
            //getCatIntegracion(documentos, 0);
            try
            {
                string documentos = cmbTipoObra.Value.ToString();
                string[] ids = documentos.ToString().Split(new char[] { '-' });

                int idProyAnterior = int.Parse(ids[1]);
                var nombre = cmbTipoObra.Text;
                //var response = apiService.GetLista<CatTipoObra>(String.Format("CatTipoObras?idProyecto={0}", documentos));
                var objTipoObras = apiService.GetObject(string.Format("CatTipoObras?idProyecto={0}&tipoObra={1}", idProyAnterior, nombre));

                if (objTipoObras.IsSuccess)
                {
                    var p = JsonConvert.DeserializeObject<CatTipoObra>(objTipoObras.Result.ToString());
                    int numero = p.IdProyectoAnterior;

                    getDocumentos(numero, 0);
                }
                else
                {
                    lblError.Text = objTipoObras.Message;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void gvDocsSociales_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            gvDocsSociales.DataBind();
        }

        protected void gvDocsTecnicos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            gvDocsTecnicos.DataBind();
        }

        protected void gvDocsSociales_DataBinding(object sender, EventArgs e)
        {
            try
            {
                if (SessionHelper.DetalleIntegracionProyecto != null)
                {
                    var proy = SessionHelper.DetalleIntegracionProyecto;
                    var sociales = proy.IntegSocial.DetIntegracion;

                    gvDocsSociales.DataSource = sociales;
                }
            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void gvDocsTecnicos_DataBinding(object sender, EventArgs e)
        {
            try
            {
                if (SessionHelper.DetalleIntegracionProyecto != null)
                {
                    var proy = SessionHelper.DetalleIntegracionProyecto;
                    var tecnicos = proy.DetalleTecnico.LtDocumentacionTecnico.OrderBy(d => d.IdCatIntegracion).ToList();

                    gvDocsTecnicos.DataSource = tecnicos.OrderBy(d => d.Id).Where(d => d.IsVisible == true).ToList();
                }

            }
            catch (Exception ex)
            {
                lblError.Text = ex.Message;
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void gvDocsSociales_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            if (e.GetValue("StDetalleRevisionSocial") != null && e.GetValue("IsParaRevisionTec") != null)
            {
                string status = e.GetValue("StDetalleRevisionSocial").ToString();
                bool isParaRevision = bool.Parse(e.GetValue("IsParaRevisionTec").ToString());
                if (e.GetValue("StObservacionTecnica") != null && isParaRevision)
                {
                    string statusTecnico = e.GetValue("StObservacionTecnica").ToString();

                    if (status == "OBSERVADO" || statusTecnico == "OBSERVADO")
                    {
                        e.Row.BackColor = System.Drawing.Color.FromArgb(255, 205, 210); // rojo
                    }
                    else if (status == "ACEPTADO" && statusTecnico == "DEFINIDO TÉCNICAMENTE")
                    {
                        e.Row.BackColor = System.Drawing.Color.FromArgb(200, 230, 201); // verde
                    }
                    else if (status == "SOLVENTADO" && statusTecnico == "SOLVENTADO")
                    {
                        e.Row.BackColor = System.Drawing.Color.FromArgb(205, 235, 255); // azul
                    }
                    else if (status == "EN REVISIÓN" && statusTecnico == "EN REVISIÓN")
                    {
                        e.Row.BackColor = System.Drawing.Color.FromArgb(255, 249, 196); // amarillo
                    }
                    else if (status == "EN REVISIÓN" && statusTecnico == "")
                    {
                        e.Row.BackColor = System.Drawing.Color.FromArgb(255, 249, 196); // amarillo
                    }
                    else
                    {
                        e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 255); // 
                    }

                }
                else
                {
                    switch (status)
                    {
                        case "OBSERVADO":
                            e.Row.BackColor = System.Drawing.Color.FromArgb(255, 205, 210); // rojo
                            break;
                        case "ACEPTADO":
                            e.Row.BackColor = System.Drawing.Color.FromArgb(200, 230, 201); // verde
                            break;
                        case "PENDIENTE DE FIRMAS":
                            e.Row.BackColor = System.Drawing.Color.FromArgb(224, 224, 224); // gris
                            break;
                        case "EN REVISIÓN":
                            e.Row.BackColor = System.Drawing.Color.FromArgb(255, 249, 196); // amarillo
                            break;
                        case "SOLVENTADO":
                            e.Row.BackColor = System.Drawing.Color.FromArgb(205, 235, 255); // azul
                            break;
                        case "REVISADO":
                            e.Row.BackColor = System.Drawing.Color.FromArgb(224, 224, 224); // gris
                            break;
                        default:
                            e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 255); // blanco
                            break;
                    }


                }

            }
        }

        protected void gvDocsTecnicos_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != GridViewRowType.Data) return;
            if (e.GetValue("StDetalleRevisionTecnica") != null)
            {
                switch (e.GetValue("StDetalleRevisionTecnica").ToString())
                {
                    case "OBSERVADO":
                        e.Row.BackColor = System.Drawing.Color.FromArgb(255, 205, 210); // rojo
                        break;
                    case "DEFINIDO TÉCNICAMENTE":
                        e.Row.BackColor = System.Drawing.Color.FromArgb(200, 230, 201); // verde
                        break;
                    case "EN REVISIÓN":
                        e.Row.BackColor = System.Drawing.Color.FromArgb(255, 249, 196); // amarillo
                        break;
                    case "SOLVENTADO":
                        e.Row.BackColor = System.Drawing.Color.FromArgb(205, 235, 255); // azul
                        break;
                    case "REVISADO":
                        e.Row.BackColor = System.Drawing.Color.FromArgb(224, 224, 224); // gris
                        break;
                    default:
                        e.Row.BackColor = System.Drawing.Color.FromArgb(255, 255, 255); // blanco
                        break;
                }

            }
        }

        protected void gvDocsSociales_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "Documento")
            {
                if (e.CellValue != null)
                {
                    //e.Cell.ToolTip = string.Format("{0}", e.GetValue("Descripcion"));
                }
            }
        }

        protected void gvDocsTecnicos_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {
            if (e.DataColumn.FieldName == "NomDocumento")
            {
                if (e.CellValue != null)
                {
                    // e.Cell.ToolTip = string.Format("{0}", e.GetValue("DescDocumento"));
                }
            }
        }

        protected void gvDocsSociales_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            var archivo = gvDocsSociales.GetRowValues(e.VisibleIndex, "Archivo");
            var estatus = gvDocsSociales.GetRowValues(e.VisibleIndex, "StDetalleRevisionSocial");
            var solventar = gvDocsSociales.GetRowValues(e.VisibleIndex, "IsParaSolventar");
            var stTecnico = gvDocsSociales.GetRowValues(e.VisibleIndex, "StObservacionTecnica");


            if (archivo == null) archivo = "";
            if (stTecnico == null) stTecnico = "";
            if (estatus == null) estatus = "";
            if (solventar == null) solventar = "false";

            switch (e.ButtonID)
            {
                case "subirDocSocial":
                    if (archivo.ToString().Trim() == "" ||
                          estatus.ToString().Trim() == "OBSERVADO" ||
                          stTecnico.ToString().Trim() == "OBSERVADO" ||
                          estatus.ToString().Trim() == "PENDIENTE DE ENVIAR A REVISIÓN" ||
                          estatus.ToString().Trim() == "PENDIENTE DE FIRMAS" ||
                          bool.Parse(solventar.ToString()).Equals(true))
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.True;
                    }
                    else
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.False;
                    }
                    break;

                case "verDocSocial":
                    if (archivo.ToString().Trim() != "")
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.True;
                    }
                    else
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.False;
                    }
                    break;
            }
        }

        protected void gvDocsTecnicos_CustomButtonInitialize(object sender, ASPxGridViewCustomButtonEventArgs e)
        {
            //var arc = gvDocsTecnicos.GetRowValues(e.VisibleIndex, "ArchivoPdf");
            //if (arc != null && arc.ToString() != "Click para subir archivo")

            var archivo = gvDocsTecnicos.GetRowValues(e.VisibleIndex, "ArchivoPdf");
            var estatus = gvDocsTecnicos.GetRowValues(e.VisibleIndex, "StDetalleRevisionTecnica");
            var solventar = gvDocsTecnicos.GetRowValues(e.VisibleIndex, "IsParaSolventar");

            var isNoAplica = gvDocsTecnicos.GetRowValues(e.VisibleIndex, "IsNoAplica");

            if (archivo == null) archivo = "";
            if (estatus == null) estatus = "";
            if (solventar == null) solventar = "false";
            if (isNoAplica == null) solventar = "false";

            switch (e.ButtonID)
            {
                case "subirDocTecnico":
                    if (archivo.ToString().Trim() == "" ||
                        estatus.ToString().Trim() == "OBSERVADO" && bool.Parse(solventar.ToString()).Equals(true) ||
                        estatus.ToString().Trim() == "PENDIENTE DE ENVIAR A REVISIÓN")
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.True;
                    }
                    else
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.False;
                    }
                    break;

                case "verDocTecnico":
                    if (archivo.ToString().Trim() != "")
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.True;
                    }
                    else
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.False;
                    }
                    break;

                case "btnNoAplica":
                    if (bool.Parse(isNoAplica.ToString()).Equals(true))
                    {
                        e.Visible = DevExpress.Utils.DefaultBoolean.True;
                    }
                    break;




            }

        }

        protected void cbRowClickgvDocsSociales_Callback(object source, CallbackEventArgs e)
        {
            SessionHelper.Indice = int.Parse(e.Parameter.ToString());
        }

        protected void cbRowClickgvDocsTecnicos_Callback(object source, CallbackEventArgs e)
        {
            SessionHelper.Indice = int.Parse(e.Parameter.ToString());
        }

        protected void cbGuardarSociales_Callback(object source, CallbackEventArgs e)
        {
            Proyecto p = new Proyecto();
            DetalleIntegracionProyecto dip = new DetalleIntegracionProyecto();

            string msj = "";
            string[] resultado = new string[2];
            try
            {
                if (SessionHelper.Proyecto != null)
                {
                    if (SessionHelper.DetalleIntegracionProyecto != null)
                    {
                        if (SessionHelper.DetalleIntegracionProyecto.IntegSocial.StRevisionSocial == "")
                        {
                            SessionHelper.DetalleIntegracionProyecto.IntegSocial.StRevisionSocial = "EN INTEGRACIÓN DOCUMENTACIÓN";
                        }

                        SessionHelper.DetalleIntegracionProyecto.IntegSocial.Folio = SessionHelper.Proyecto.Folio;
                        SessionHelper.DetalleIntegracionProyecto.IntegSocial.FechaCaptura = DateTime.Now;


                        var responseguarda = apiService.post("IntegracionSocial", SessionHelper.DetalleIntegracionProyecto.IntegSocial);
                        if (responseguarda.IsSuccess)
                        {
                            msj = "true|La información se guardó correctamente.|false|";
                        }
                        else
                        {

                            msj = "false|" + responseguarda.Message + "|false|";
                        }
                    }
                    else
                    {
                        msj = "false|Ocurrio un problema al guardar la información, por favor intentelo mas tarde.||";
                    }
                }
            }
            catch (Exception ex)
            {
                msj = "false|" + ex.Message + "||";
                Log4NetCommon.WriteException(ex);
            }
            e.Result = msj;
        }

        public string[] enviaNotificacion(int folio, string envia, string recibe, string mensaje)
        {
            ApiService apiService;
            apiService = new ApiService();
            string[] resultado = new string[2];
            Notificacion no = new Notificacion();
            no.FolioProyecto = folio;
            no.IdEnvia = envia;
            no.IdRecibe = recibe;
            no.Mensaje = mensaje;
            var not = apiService.post("Notificaciones", no);
            if (not.IsSuccess)
            {
                string[] separador = new string[] { "|" };
                resultado = not.Message.Split(separador, StringSplitOptions.None);
            }
            else
            {
                resultado[0] = "false";
                resultado[1] = "false";
            }
            return resultado;
        }

        protected void cbGuardarIntegracionTecnica_Callback(object source, CallbackEventArgs e)
        {
            Proyecto p = new Proyecto();
            DetalleIntegracionProyecto dip = new DetalleIntegracionProyecto();

            string msj = "";
            string[] resultado = new string[2];
            try
            {
                if (SessionHelper.Proyecto != null)
                {
                    if (SessionHelper.DetalleIntegracionProyecto != null)
                    {
                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.ProyectoIncompleto = SessionHelper.Proyecto.ProyectoPendiente;
                        if (SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica == "")
                        {
                            SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica = "EN INTEGRACIÓN DOCUMENTACIÓN";
                        }

                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.Folio = SessionHelper.Proyecto.Folio;
                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.ProyectoIncompleto = SessionHelper.Proyecto.ProyectoPendiente;
                        var responseguarda = apiService.post("IntegracionTecnica", SessionHelper.DetalleIntegracionProyecto.DetalleTecnico);
                        if (responseguarda.IsSuccess)
                        {
                            msj = "true|La información se guardó correctamente.|false|";
                        }
                        else
                        {

                            msj = "false|" + responseguarda.Message + "|false|";
                        }
                    }
                    else
                    {
                        msj = "false|Ocurrio un problema al guardar la información, por favor intentelo mas tarde.||";
                    }
                }
            }
            catch (Exception ex)
            {
                msj = "false|" + ex.Message + "||";
                Log4NetCommon.WriteException(ex);
            }
            e.Result = msj;
        }

        protected void cbEnviarIntegracionTecnica_Callback(object source, CallbackEventArgs e)
        {
            string msj = "";
            string[] resultado = new string[2];
            try
            {
                if (SessionHelper.Proyecto != null && SessionHelper.DetalleIntegracionProyecto != null)
                {
                    var pendientesSolventar = SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Where(x => x.StDetalleRevisionTecnica == "OBSERVADO").Count();

                    if (pendientesSolventar == 0)
                    {
                        if (SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica == "")
                        {
                            SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica = "EN REVISIÓN";
                        }
                        // SE CONSIDERA REGRESAR EL STATUS DE NOTIFICACION

                        foreach (var item in SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico)
                        {
                            if (item.StDetalleRevisionTecnica == "PENDIENTE DE ENVIAR A REVISIÓN")
                            {
                                // item.StDetalleRevisionTecnica = "EN REVISIÓN";
                                item.StDetalleRevisionTecnica = "SOLVENTADO";

                                item.IsParaSolventar = false;
                                item.IsParaNotificar = false;
                            }
                        }
                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.ProyectoIncompleto = SessionHelper.Proyecto.ProyectoPendiente;
                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.Folio = SessionHelper.Proyecto.Folio;
                        var responseguarda = apiService.post("IntegracionTecnica", SessionHelper.DetalleIntegracionProyecto.DetalleTecnico);
                        if (responseguarda.IsSuccess)
                        {
                            if (SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.IdResponsable != "")
                            {
                                string mensaje = string.Format("Se han solventado las observaciones del proyecto con folio:{0}", SessionHelper.Proyecto.Folio);
                                resultado = enviaNotificacion(SessionHelper.Proyecto.Folio, SessionHelper.InformacionUsuario.IdUser, SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.IdResponsable, mensaje);

                                if (SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Where(x => x.StDetalleRevisionTecnica == "SOLVENTADO" && x.IdRevisor != "").Count() > 0)
                                {
                                    foreach (var listaAgrupados in SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Where(x => x.StDetalleRevisionTecnica == "SOLVENTADO" && x.IdRevisor != "").GroupBy(p => p.IdRevisor))
                                    {
                                        enviaNotificacion(SessionHelper.Proyecto.Folio, SessionHelper.InformacionUsuario.IdUser, listaAgrupados.Key, mensaje);
                                    }
                                }
                            }
                            else
                            {
                                string mensaje = string.Format("Se han solventado las observaciones del proyecto con folio:{0}", SessionHelper.Proyecto.Folio);
                                resultado = enviaNotificacion(SessionHelper.Proyecto.Folio, SessionHelper.InformacionUsuario.IdUser, "3BB00242-5CD6-4467-A60E-DA65F1EF32D4", mensaje);

                            }
                            msj = string.Format("true|La información se envió correctamente.|true|{0}", resultado[1]);

                        }
                        else
                        {
                            msj = "false|" + responseguarda.Message + "|false|";
                        }
                    }
                    else
                    {

                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.Folio = SessionHelper.Proyecto.Folio;
                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.ProyectoIncompleto = SessionHelper.Proyecto.ProyectoPendiente;
                        var responseguarda = apiService.post("IntegracionTecnica", SessionHelper.DetalleIntegracionProyecto.DetalleTecnico);
                        if (responseguarda.IsSuccess)
                        {
                            msj = "false|Los archivos se guardaron correctamente pero no se enviaron. Es necesario solventar todos las observaciones|false|";
                        }
                        else
                        {
                            msj = "false|Ocurrió detalle al enviar. Intentalo más tarde.|false|";
                        }

                    }
                }
                else
                {
                    msj = "false|Ocurrió detalle al enviar. Intentalo más tarde.|false|";
                }

            }
            catch (Exception ex)
            {

                msj = "false|" + ex.Message + "||";
            }
            e.Result = msj;
        }

        protected void cbFinalizarIntegracionDocumentacion_Callback(object source, CallbackEventArgs e)
        {

            string msj = "";
            try
            {
                if (SessionHelper.InformacionUsuario != null)
                {
                    var resul = validarEnvio();
                    if (!resul.IsSuccess)// (SessionHelper.Proyecto.LtImagen == null || SessionHelper.Proyecto.LtImagen.Count == 0)
                    {
                        msj = guardarProyecto() + resul.Message;
                    }
                    else
                    {
                        SessionHelper.DetalleIntegracionProyecto.IntegSocial.FechaCaptura = DateTime.Now;
                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.FechaCaptura = DateTime.Now;
                        SessionHelper.DetalleIntegracionProyecto.IntegSocial.IdUsuario = SessionHelper.InformacionUsuario.IdUser;
                        SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.IdUsuario = SessionHelper.InformacionUsuario.IdUser;


                        var pendientesTecnicos = SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Where(
                            x => x.ArchivoPdf == "").Count();
                        var pendientesSociales = SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion.Where(x => x.Archivo == "").Count();

                        if (pendientesTecnicos == 0 && pendientesSociales == 0)
                        {
                            string[] resultado = new string[2];

                            //var lisDocSocial = SessionHelper.DetalleIntegracionProyecto.LtDetSocial.Where(x => x.IsDoc == true).ToList();
                            //SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion = lisDocSocial;

                            var soc = SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion.Where(x => x.TipoDocto == 1 && x.StDetalleRevisionSocial == "PENDIENTE DE ENVIAR A REVISIÓN");
                            var tec = SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Where(x => x.StDetalleRevisionTecnica == "PENDIENTE DE ENVIAR A REVISIÓN");

                            foreach (var item in soc)
                            {
                                //var det = soc.Where(x => x.IdCatIntegracion == item.IdCatIntegracion).FirstOrDefault();
                                //SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion.Remove(det); 
                                item.StDetalleRevisionSocial = "EN REVISIÓN";
                                item.IsParaSolventar = false;


                                //SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion.Add(det);

                            }
                            foreach (var it in tec)
                            {
                                // var det = tec.Where(x => x.IdCatIntegracion == it.IdCatIntegracion).FirstOrDefault();
                                //SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Remove(det);
                                it.StDetalleRevisionTecnica = "EN REVISIÓN";
                                it.IsParaSolventar = false;
                                it.IsParaNotificar = false;
                                //SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Add(det);
                            }
                            SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.StRevisionTecnica = "EN REVISIÓN";
                            SessionHelper.DetalleIntegracionProyecto.IntegSocial.StRevisionSocial = "EN REVISIÓN";


                            //

                            SessionHelper.Proyecto.StStatusProyecto = "EN REVISÓN DE PROYECTO";
                            SessionHelper.Proyecto.StatusProyecto = 2;
                            SessionHelper.Proyecto.StatusIntegracion = 2;


                            string res = guardarProyecto();
                            if ("true|Información guardado correctamente." == res)
                            //var responseSociales = apiService.post("IntegracionSocial", SessionHelper.DetalleIntegracionProyecto.IntegSocial);
                            //var responseTecnicos = apiService.post("IntegracionTecnica", SessionHelper.DetalleIntegracionProyecto.DetalleTecnico);

                            //if (responseSociales.IsSuccess && responseTecnicos.IsSuccess)
                            {
                                string mensaje = string.Format("Se envió el proyecto con folio:{0} para su validación", SessionHelper.Proyecto.Folio);
                                resultado = enviaNotificacion(SessionHelper.Proyecto.Folio, SessionHelper.InformacionUsuario.IdUser, "3BB00242-5CD6-4467-A60E-DA65F1EF32D4", mensaje);

                                msj = string.Format("true|La información se envió correctamente.|" + SessionHelper.Proyecto.Folio + "|true|{0}|{1}", resultado[0], resultado[1]);
                            }
                            else
                            {
                                msj = "false|Ocurrió un error al enviar la información.|";
                            }
                        }
                        else
                        { //Si no cumple con toda la documentacion

                            string res = guardarProyecto();
                            if ("true|Información guardado correctamente." == res)
                            {
                                //var responseSociales = apiService.post("IntegracionSocial", SessionHelper.DetalleIntegracionProyecto.IntegSocial);
                                //var responseTecnicos = apiService.post("IntegracionTecnica", SessionHelper.DetalleIntegracionProyecto.DetalleTecnico);
                                msj = "false|La información se guardo correctamente.\n¡Para enviar a revisión es necesario adjuntar toda la documentación legal y la correspondiente al proyecto ejecutivo.!";
                            }
                            else
                            {
                                msj = res;
                            }
                        }

                    }




                }
                else
                {
                    msj = "false|Ha finalizado la sesión del usuario.";
                }
            }
            catch (Exception ex)
            {
                msj = "false|Ocurrio un error al guardar la información.";
                Log4NetCommon.WriteException(ex);
            }
            e.Result = msj;

        }

        protected void cbEnviarIntegracionSocial_Callback(object source, CallbackEventArgs e)
        {
            string msj = "";
            string[] resultado = new string[2];
            try
            {
                if (SessionHelper.Proyecto != null && SessionHelper.DetalleIntegracionProyecto != null)
                {
                    var pendientesSolventar = SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion.Where(x => x.StDetalleRevisionSocial == "OBSERVADO").Count();

                    if (pendientesSolventar == 0)
                    {
                        if (SessionHelper.DetalleIntegracionProyecto.IntegSocial.StRevisionSocial == "")
                        {
                            SessionHelper.DetalleIntegracionProyecto.IntegSocial.StRevisionSocial = "EN REVISIÓN";
                        }
                        // SE CONSIDERA REGRESAR EL STATUS DE NOTIFICACION

                        foreach (var item in SessionHelper.DetalleIntegracionProyecto.IntegSocial.DetIntegracion)
                        {
                            if (item.StDetalleRevisionSocial == "PENDIENTE DE ENVIAR A REVISIÓN")
                            {
                                item.StDetalleRevisionSocial = "SOLVENTADO";
                                item.IsParaSolventar = false;
                            }
                        }
                        SessionHelper.DetalleIntegracionProyecto.IntegSocial.Folio = SessionHelper.Proyecto.Folio;
                        var responseguarda = apiService.post("IntegracionSocial", SessionHelper.DetalleIntegracionProyecto.IntegSocial);
                        if (responseguarda.IsSuccess)
                        {
                            if (SessionHelper.DetalleIntegracionProyecto.IntegSocial.IdResponsable != "")
                            {
                                string mensaje = string.Format("Se han solventado las observaciones del proyecto con folio:{0}", SessionHelper.Proyecto.Folio);
                                resultado = enviaNotificacion(SessionHelper.Proyecto.Folio, SessionHelper.InformacionUsuario.IdUser, SessionHelper.DetalleIntegracionProyecto.IntegSocial.IdResponsable, mensaje);

                            }
                            else
                            {
                                string mensaje = string.Format("Se han solventado las observaciones del proyecto con folio:{0}", SessionHelper.Proyecto.Folio);
                                resultado = enviaNotificacion(SessionHelper.Proyecto.Folio, SessionHelper.InformacionUsuario.IdUser, "3BB00242-5CD6-4467-A60E-DA65F1EF32D4", mensaje);

                            }

                            msj = string.Format("true|La información se envió correctamente.|true|{0}", resultado[1]);
                        }
                        else
                        {
                            msj = "false|" + responseguarda.Message + "|false|";
                        }
                    }
                    else
                    {
                        msj = "false|Debe solventar todas las observaciones pendientes.|false|";
                    }
                }
                else
                {
                    msj = "false|Ocurrió detalle al enviar. Intentalo más tarde.|false|";
                }
            }
            catch (Exception ex)
            {

                msj = "false|Ocurrió detalle al enviar. Intentalo más tarde.|false|";
            }
            e.Result = msj;
        }

        protected void cbEliminarDocumento_Callback(object source, CallbackEventArgs e)
        {
            string msj = "";
            try
            {
                int idDoc = Convert.ToInt32(e.Parameter.ToString());
                var aux = SessionHelper.DetalleIntegracionProyecto.DetalleTecnico.LtDocumentacionTecnico.Where(x => x.IdCatIntegracion == idDoc).First();

                if (aux != null)
                {

                    aux.IsVisible = false;
                    aux.ArchivoPdf = "NO APLICA";

                    msj = "true|Modificado|true|";
                }
                else

                {
                    msj = "false|Ocurrió un detalle al modificar. Intentalo más tarde.|false|";

                }

            }
            catch (Exception ex)
            {

                Log4NetCommon.WriteException(ex);
                msj = "false|Ocurrió un detalle al modificar. Intentalo más tarde.|false|";
            }
            e.Result = msj;
        }
        // TERMINA PESTAÑA "DOCUMENTACIÓN"



        protected void gvComponentes_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            try
            {
                var IdComponente = gvComponentes.GetRowValuesByKeyValue(e.Keys[0], "IdComponente");
                var res = apiService.delete("Componentes?idComponente=" + IdComponente + "&nombreAnterior=" + e.Values["NombreComponente"].ToString() + "&folio=" + Convert.ToInt64(Request.QueryString["id"].ToString()));
                if (!res.IsSuccess)
                {
                    throw new Exception(res.Message);
                }
                {
                    SessionHelper.ListComponentes.RemoveAll(c => c.Orden == Convert.ToInt32(e.Keys[0]));
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                e.Cancel = true;
                (sender as ASPxGridView).CancelEdit();
            }
        }

        protected void gvComponentes_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            try
            {
                Componente objComponente = new Componente();
                var IdComponente = gvComponentes.GetRowValuesByKeyValue(e.Keys[0], "IdComponente");
                objComponente.IdComponente = Convert.ToInt32(IdComponente);
                objComponente.CantidadComponente = Convert.ToDecimal(e.NewValues["CantidadComponente"]);
                objComponente.StUnidadMedida = e.NewValues["StUnidadMedida"].ToString();
                objComponente.IsSeleccionado = Convert.ToBoolean(e.NewValues["IsSeleccionado"]);
                objComponente.NombreComponente = e.OldValues["NombreComponente"].ToString();
                objComponente.NombreComponenteAnterior = e.NewValues["NombreComponente"].ToString();
                objComponente.TotalComponente = Convert.ToDecimal(e.NewValues["TotalComponente"]);

                decimal IVA = 0;

                IVA = objComponente.TotalComponente * Convert.ToDecimal("0.16");
                objComponente.SubtotalComponente = objComponente.TotalComponente - IVA;
                objComponente.PrecioUnitarioComponente = objComponente.SubtotalComponente / objComponente.CantidadComponente;
                objComponente.SubtotalComponente = Math.Round(objComponente.SubtotalComponente, 4);
                objComponente.PrecioUnitarioComponente = Math.Round(objComponente.PrecioUnitarioComponente, 4);
                objComponente.FolioProyecto = Convert.ToInt64(Request.QueryString["id"]);

                var res = apiService.put("Componentes/actualizarComponetes", objComponente);
                if (res.IsSuccess)
                {
                    res = apiService.put("Componentes/actualizarComponentePre", objComponente);
                    if (!res.IsSuccess)
                    {
                        throw new Exception(res.Message);
                    }
                    else
                    {
                        Componente objComponenteModificado = SessionHelper.ListComponentes.Where(c => c.Orden == Convert.ToInt32(e.Keys[0])).FirstOrDefault();
                        SessionHelper.ListComponentes.RemoveAll(c => c.Orden == Convert.ToInt32(e.Keys[0]));
                        objComponenteModificado.IdComponente = objComponente.IdComponente;
                        objComponenteModificado.CantidadComponente = objComponente.CantidadComponente;
                        objComponenteModificado.StUnidadMedida = objComponente.StUnidadMedida;
                        objComponenteModificado.IsSeleccionado = objComponente.IsSeleccionado;
                        objComponenteModificado.NombreComponente = objComponente.NombreComponenteAnterior;
                        objComponenteModificado.TotalComponente = objComponente.TotalComponente;
                        objComponenteModificado.PrecioUnitarioComponente = objComponente.PrecioUnitarioComponente;
                        objComponenteModificado.SubtotalComponente = objComponente.SubtotalComponente;
                        objComponenteModificado.FolioProyecto = objComponenteModificado.FolioProyecto;
                        SessionHelper.ListComponentes.Add(objComponenteModificado);
                    }
                }
            }
            catch (Exception ex)
            {
                throw new Exception(ex.Message);
            }
            finally
            {
                e.Cancel = true;
                (sender as ASPxGridView).CancelEdit();
            }
        }
        #region Presupuesto

        protected void upcExcel_FileUploadComplete(object sender, FileUploadCompleteEventArgs e)
        {
            string msj = "";
            String cFileSave = "";
            string fileName = Path.GetFileName(e.UploadedFile.FileName);
            Session["PruebaExcel"] = fileName;
            try
            {
                cFileSave = Server.MapPath("TempExcel") + "/" + fileName.Trim();
                e.UploadedFile.SaveAs(cFileSave, true);
                FileInfo fiF = new FileInfo(cFileSave);

                //   var filteredRows = ConsultaSQLFromXLSx().Columns[0].Table.Rows[0];

                if (e.IsValid)
                {
                    var aux = validarExcel();
                    if (aux != null)
                    {
                        var listaConceptos = datatableToList(aux);


                        if (listaConceptos.Count > 0)
                        {
                            Session["Conceptos"] = listaConceptos;
                            gridVistaPrevia.DataBind();
                            msj = "True|";
                        }
                        else
                        {
                            if (File.Exists(cFileSave))
                                File.Delete(cFileSave);
                            msj = "False|Verifica que el archivo cumpla con el formato establecido.";
                        }

                    }
                    else
                    {
                        if (File.Exists(cFileSave))
                            File.Delete(cFileSave);

                        msj = "False|Verifica que el archivo cumpla con el formato establecido.";
                    }
                }
                else
                {
                    msj = "False|Error al cargar el archivo";
                }


            }
            catch (Exception ex)
            {
                msj = ex.Message;
            }
            e.CallbackData = msj;
        }

        protected void gridViewConceptos_DataBinding(object sender, EventArgs e)
        {
            try
            {
                apiService = new ApiService();
                var response = apiService.GetLista<CatConcepto>(string.Format("CatalogoConceptos?folio={0}", SessionHelper.Proyecto.Folio));
                if (response.IsSuccess)
                {
                    gridViewConceptos.DataSource = (List<CatConcepto>)response.Result;
                    // gridBase.DataBind();
                }
            }
            catch (Exception ex)
            {


                Log4NetCommon.WriteException(ex);
            }
        }

        protected void gridViewConceptos_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            gridViewConceptos.DataBind();
        }

        protected void gridVistaPrevia_DataBinding(object sender, EventArgs e)
        {
            try
            {

                if ((List<CatConcepto>)Session["Conceptos"] != null)
                {
                    gridVistaPrevia.DataSource = (List<CatConcepto>)Session["Conceptos"];
                }
                else
                {

                }
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }
        }

        protected void gridVistaPrevia_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            gridVistaPrevia.DataBind();
        }

        private DataTable validarExcel()
        {
            var dataTable = ConsultaSQLFromXLSx();
            var pivote = 0;

            for (int i = 0; i < dataTable.Rows.Count; i++)
            {

                var filteredRows2 = dataTable.Rows[i];
                if (filteredRows2.ItemArray.Contains("Código") && filteredRows2.ItemArray.Contains("Concepto") &&
                    filteredRows2.ItemArray.Contains("Unidad") && filteredRows2.ItemArray.Contains("Cantidad") &&
                    filteredRows2.ItemArray.Contains("P. Unitario") && (filteredRows2.ItemArray.Contains("Precio con letra") || filteredRows2.ItemArray.Contains("Precio con Letra"))
                     && filteredRows2.ItemArray.Contains("Importe"))
                {
                    pivote = i;
                    break;
                }

            }
            if (pivote != 0)
                return dataTable.AsEnumerable().Skip(pivote).Take(dataTable.Rows.Count).CopyToDataTable();
            else
                return null;
        }



        private List<CatConcepto> datatableToList(DataTable datos)
        {
            List<CatConcepto> conceptos;

            try
            {
                if (datos != null)
                {

                    conceptos = new List<CatConcepto>();
                    string nombrePartidaActual = string.Empty;
                    for (int i = 1; i < datos.Rows.Count; i++)
                    {

                        var itemArray = datos.Rows[i];


                        if (itemArray.ItemArray[0].ToString() != "PARTIDA")
                        {
                            if (!itemArray.ItemArray[2].ToString().ToLower().Contains("total"))
                            {
                                var concepto = new CatConcepto();
                                concepto.IdConcepto = i;
                                concepto.FolioProyecto = SessionHelper.Proyecto.Folio;
                                concepto.NombrePartida = nombrePartidaActual;
                                concepto.Codigo = itemArray.ItemArray[1].ToString();
                                concepto.Concepto = itemArray.ItemArray[2].ToString();
                                concepto.Unidad = itemArray.ItemArray[3].ToString();
                                concepto.Cantidad = double.Parse(itemArray.ItemArray[4].ToString().Replace("$", string.Empty));
                                concepto.PUnitario = double.Parse(itemArray.ItemArray[5].ToString().Replace("$", string.Empty));
                                concepto.PrecioLetra = itemArray.ItemArray[6].ToString();
                                concepto.Importe = double.Parse(itemArray.ItemArray[7].ToString().Replace("$", string.Empty));
                                conceptos.Add(concepto);
                            }

                        }
                        else
                        {
                            nombrePartidaActual = itemArray.ItemArray[2].ToString();

                        }
                    }

                    return conceptos;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception ex)
            {

                throw;
            }
        }
        protected void cbGuardarConceptos_Callback(object source, CallbackEventArgs e)
        {
            string msj = "";
            try
            {
                apiService = new ApiService();

                if ((List<CatConcepto>)Session["Conceptos"] != null)
                {
                    var responseguarda = apiService.post("CatalogoConceptos", (List<CatConcepto>)Session["Conceptos"]);
                    if (responseguarda.IsSuccess)
                    {
                        msj = "true|La información se guardó correctamente.|false|";
                    }
                    else
                    {

                        msj = "false|" + responseguarda.Message + "|false|";
                    }
                }
            }
            catch (Exception ex)
            {

                Log4NetCommon.WriteException(ex);
            }
            e.Result = msj;
        }

        private DataTable ConsultaSQLFromXLSx()
        {
            DataTable dtExcel = new DataTable();
            bool hasHeaders = false;
            string HDR = hasHeaders ? "Yes" : "No";
            string strConn;
            String filePath = "";
            filePath = Server.MapPath("TempExcel") + "\\" + Session["PruebaExcel"].ToString();
            /// filePath = "C:\\Proyectos\\WebEstimaciones\\WebEstimaciones\\TempExcel/T005 PRESUPUESTO Y TARJETAS v 2.1.xlsx";
            try
            {
                if (filePath.Substring(filePath.LastIndexOf('.')).ToLower() == ".xlsx")
                    strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=\"Excel 12.0;HDR=" + HDR + ";IMEX=1\"";
                //strConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=Excel 12.0;";
                else
                    strConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties=\"Excel 8.0;HDR=" + HDR + ";IMEX=0\"";

                OleDbConnection conn = new OleDbConnection(strConn);
                conn.Open();
                DataTable dbSchema = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                if (dbSchema == null || dbSchema.Rows.Count < 1)
                {
                    throw new Exception("Error: Could not determine the name of the first worksheet.");
                }
                string firstSheetName = dbSchema.Rows[0]["TABLE_NAME"].ToString();
                string consulta = string.Format("select IIF (( F3<>'' AND F4<>'' AND F5<>'' AND F6<>'' AND F7<>''), '','PARTIDA') as r, F1,F2,F3,F4,F5,F6,F7 from [{0}] WHERE  (F1<>'' AND F2<>'')", firstSheetName);
                OleDbDataAdapter daexcel = new OleDbDataAdapter(consulta, conn);
                dtExcel.Locale = CultureInfo.CurrentCulture;
                daexcel.Fill(dtExcel);
                conn.Close();
            }
            catch (Exception ex)
            {
                dtExcel = null;
                //MessageBox.Show(String.Format("Error al cargar el archivo de Excel. Error: {0}", ex.Message));
            }
            return dtExcel;
        }
        #endregion

        Response validarEnvio()
        {
            Response result = new Response();
            string msj = "";
            result.IsSuccess = true;
            try
            {
                if (SessionHelper.Proyecto.LtImagen == null || SessionHelper.Proyecto.LtImagen.Count == 0)
                {
                    result.IsSuccess = false;
                    msj = "\n**Es necesario adjuntar las imganes georeferenciadas del proyecto.";
                }
                if (SessionHelper.Proyecto.EstatusPagoFinanzas.Trim() == "PENDIENTE DE VALIDAR")
                {
                    result.IsSuccess = false;
                    msj += "\nSu pago de derecho aun no ha sido autorizado";
                }
                if (!SessionHelper.Proyecto.IsDROConfirm)
                {
                    result.IsSuccess = false;
                    msj += "\nSu Director Responsable de Obra(DRO), aún no ha confirmado sus datos en el proyecto.";
                }
                result.Message = msj;
            }
            catch (Exception ex)
            {
                result.IsSuccess = false;
                result.Message = "Ocurrio un error al validar la información.";
                Log4NetCommon.WriteException(ex);
            }
            return result;
        }

        protected void cbGuardarDRO_Callback(object source, CallbackEventArgs e)
        {
            try
            {
                SqlDataSourceDRO.InsertCommandType = SqlDataSourceCommandType.Text;
                SqlDataSourceDRO.InsertCommand = string.Format("INSERT INTO [dbo].[tbl_DROConfirmacion](" +
                    "[folioProyecto]," +
                    "[statusConfirmacionDro]," +
                    "[comentario]," +
                    "[fechaCaptura]," +
                    "[idUsuario]) VALUES" +
                    "(" +
                    "{0}," +
                    "'{1}'," +
                    "'{2}'," +
                    "'{3}'," +
                    "'{4}'" +
                    ")",
                    txtFolio.Text,
                    e.Parameter.ToString(),
                    txtComentarioDRO.Text.ToUpper().Trim(),
                    DateTime.Now.ToString("yyyy-MM-ddTHH:mm:ss.fff"),
                   SessionHelper.InformacionUsuario.IdUser
                    );
                SqlDataSourceDRO.Insert();
                e.Result = "true|Información actualizada correctamente";
            }
            catch (Exception ex)
            {
                Log4NetCommon.WriteException(ex);
            }
        }
    }
}