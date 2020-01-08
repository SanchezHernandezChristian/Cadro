<%@ Page Language="C#" Title="Registro de Directores Responsables de Obra" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="WebApplication1.Registrarse" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Language" content="es"/>
    <title>Registro</title>
    <link rel="shortcut icon" href="css/img/LogoVII.ico" type="image/x-icon" />
    <link rel="icon" href="css/img/LogoVII.ico" type="image/x-icon" />
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
    <script type="text/javascript">

        function habilitarEdicion(habilitar) {
            btnCancelar.SetVisible(habilitar);
            cbSolicitud.SetVisible(habilitar);
            btnGuardar.SetVisible(habilitar);
        }
        

        function OnFileUploadCompleteCedula(s, e) {
            var htmlData = e.callbackData.split("|");
            if (htmlData[0] == "true") {
                hfHiddenField.Set("archivoAnexo", htmlData[2]);
                hfHiddenField.Set("tieneArchivo", true);
                alert("Archivo anexado correctamente.");
                btnVisualizarCedula.SetNavigateUrl(htmlData[1]);
            }
            else {
                alert(htmlData[1]);
            }
        }

        function resultadoValidacion(s, e) {
            var htmlData = e.result.split('|');
            if (htmlData[0] == "true") {
                btnAgregarSolicitud.SetVisible(false);
                txtCedula.SetEnabled(true);
                txtCedula.SetVisible(false);
                cboTipoTramite.SetEnabled(true);
                cboTipoTramite.SetVisible(false);
                var tipoTramiteSeleccionado = cboTipoTramite.GetText().toLowerCase();
                if (tipoTramiteSeleccionado == "registro" || tipoTramiteSeleccionado == "registro con número anterior") {
                    habilitarEdicion(true);
                } else {
                    habilitarEdicion(true);
                    habilitarEdicion(true);
                    cbSolicitud.PerformCallback(txtCedula.GetText());
                }
            } else {
                swal.fire({
                    icon: 'error',
                    html: htmlData[1]
                });
                //alert(htmlData[1]);
            }
        }

        function AgregarSolicitud(s, e) {

            var editoresValidos = ASPxClientEdit.AreEditorsValid();
            if (editoresValidos) {
                cbSolicitud.PerformCallback('Guardar');
            }
        }

        function terminaCallbackGuardar(s, e) {

            if (s.cp_Resultado) {
                var htmlData = s.cp_Resultado.split("|");
                console.log(htmlData);
                alert(htmlData[1]);
                if (htmlData[0] == "true") {
                    cbSolicitud.SetVisible(false);
                    btnCancelar.SetVisible(false);
                    btnAgregarSolicitud.SetVisible(true);
                    txtCedula.SetEnabled(true);
                    txtCedula.SetVisible(true);
                    cboTipoTramite.SetEnabled(true);
                    cboTipoTramite.SetVisible(true);
                }
            }
        }
        function ActualizaLocalidad(s, e) {

        }

        function fn_AllowonlyNumeric(s, e) { 
            var theEvent = e.htmlEvent || window.event; 
            var key = theEvent.keyCode || elEvento.que; 
            key = String.fromCharCode (key); 
            var regex =  [0-9] ;

            if (! regex.test (clave)) { 
                theEvent.returnValue = false; 
                if (theEvent.preventDefault) {
                    theEvent.preventDefault();
                }
            } 
        }
    </script>
</head>
<body>
        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-2 bg-white border-bottom shadow-sm">
            <img style="text-align: center; background-size: cover; max-width:200px; " src="/css/img/logo.png"/>
            <br />
            <h5 class="my-0 mr-md-auto font-weight-normal col-6" style="padding-left: 1rem;">Comité de acreditación de Dirección de Responsables de Obra</h5>
            </div>
    <br />
        <form id="envioRegistro" runat="server">
            <div id="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb justify-content-center">
              <li class="breadcrumb-item">
                <a><strong>Registro</strong></a>
              </li>
              <li class="breadcrumb-item active">Ingrese los datos solicitados</li>
            </ol>

            
                <div class="form-group">
                    <div class="row  justify-content-center" >
                        <div class="form-label-group col-5">
                            <label>Ingrese su Cédula Profesional</label>
                            <dx:ASPxTextBox MaxLength="10" ID="txtCedula" ClientInstanceName="txtCedula" runat="server" Theme="Material" CssClass="form-control">
                            </dx:ASPxTextBox>
                        </div>
                        <div class="form-label-group col-5 ">
                            <label>Seleccione el registro que desea realizar</label>
                                <dx:ASPxComboBox runat="server" ID="cboTipoTramites" ClientInstanceName="cboTipoTramite" ValueField="Id_Tipo_Solicitud" ValueType="System.String" TextField="Descripcion" Theme="Material" Cssclass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                                        <Items>
                                        <dx:ListEditItem Text="Revalidación" Value="2"/>
                              <dx:ListEditItem Text="Revalidación y Clasificación" Value="3"/>
                              <dx:ListEditItem Text="Revalidación con Reclasificación" Value="4"/>
                              <dx:ListEditItem Text="Reclasificación" Value="5"/>
                              <dx:ListEditItem Text="Revalidación con Cambio de Clave" Value="6"/>
                          <dx:ListEditItem Text="Reposición de Credencial" Value="8"/>
                                        </Items>                      
                                </dx:ASPxComboBox>
                        </div>
                     </div>
                  </div>
                <div class="form-group">
                    <div class="row justify-content-center" >
                        <div class="form-label-group text-center col-md-2">
                            <dx:ASPxButton runat="server" ID="btnAgregarSolicitud" ClientInstanceName="btnAgregarSolicitud" Theme="Material" AutoPostBack="False" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 61.png" BackgroundImage-Repeat="NoRepeat" Height="48px" Width="191px">
                            <ClientSideEvents Click="function(s, e) {
                                                         lp.Show();
	                                                     cbValidar.PerformCallback();
                                                         }" />
                             </dx:ASPxButton>
                        </div>
                        
                     </div>
                  </div>
                </div>
            </div>

                
        <dx:ASPxCallback ID="cbValidar" ClientInstanceName="cbValidar" OnCallback="cbValidar_Callback" runat="server">
            <ClientSideEvents CallbackComplete="function(s, e) {
                lp.Hide();
                resultadoValidacion(s,e);
                  }"/>
        </dx:ASPxCallback>
        <div class="container-fluid">
            <dx:ASPxCallbackPanel ID="cbSolicitud" ClientInstanceName="cbSolicitud" Theme="Material" ClientVisible="false" runat="server" Width="100%" OnCallback="cbSolicitud_Callback">
                <ClientSideEvents EndCallback="function(s, e) {
	                terminaCallbackGuardar(s,e);
                    }" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div>
                                <dx:ASPxLabel runat="server" ID="lblMensajeError" ClientInstanceName="lblMensajeError" ForeColor="Red" Font-Size="Small">
                                </dx:ASPxLabel>
                                 <dx:ASPxLabel runat="server" ID="contra" ClientVisible="false" ForeColor="Red" Font-Size="Small">
                                </dx:ASPxLabel>
                                <dx:ASPxLabel runat="server" ID="droalta" ClientVisible="false" ForeColor="Red" Font-Size="Small">
                                </dx:ASPxLabel>
                                <dx:ASPxTextBox ID="txtFolio" ClientInstanceName="txtFolio" ClientVisible="false" runat="server" Theme="Material" Width="100px" ClientEnabled="true">
                                    </dx:ASPxTextBox>
                                <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Clave de solicitud" Theme="Material" ID="lblFolio" ClientInstanceName="lblFolio" ClientVisible="false">
                                    </dx:ASPxLabel>
                            </div>
                            
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Paterno</label>
                                            <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" MaxLength="25" Width="90%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                           
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Materno</label>
                                            <dx:ASPxTextBox ID="txtAMaterno" runat="server" MaxLength="25" Theme="Material" Width="90%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Nombre(s)</label>
                                            <dx:ASPxTextBox ID="txtNombres" runat="server" Theme="Material" MaxLength="40" Width="90%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Calle y número</label>
                                            <dx:ASPxTextBox ID="txtCalleNumero" runat="server" MaxLength="60" Theme="Material" Width="90%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Colonia</label>
                                            <dx:ASPxTextBox ID="txtColonia" runat="server" Theme="Material" Width="90%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Cédula</label>
                                            <dx:ASPxLabel runat="server" ID="lblinformacion" Text="Cédula Digital" ForeColor="#D6D2C9" Theme="Material">
                                            </dx:ASPxLabel>
                                            <br />
                                            <asp:FileUpload ID="FlpArchivo" runat="server" BackColor="White" Width="280px" Height="30px"/>
                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Municipio</label>
                                            <dx:ASPxComboBox runat="server" ValueField="idMunicipio" ValueType="System.String" TextField="nombreMunicipioINEGI" ID="cboMunicipio" Theme="Material" Width="90%" DataSourceID="SqlDataSource2">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                    callpanelLocalidad.PerformCallback();
	                                                cboRegion.PerformCallback(s.GetValue());
                                                    }" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [idMunicipio], [nombreMunicipioINEGI] FROM [tblMunicipios] ORDER BY [nombreMunicipioINEGI]"></asp:SqlDataSource>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Localidad</label>
                                            <dx:ASPxCallbackPanel ID="callpanelLocalidad" ClientInstanceName="callpanelLocalidad" Theme="Material" runat="server" Width="100%" OnCallback="callpanelLocalidad_Callback">
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="90%" DataSourceID="dsLocalidades" TextField="nom_loc" ValueField="loc"></dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="dsLocalidades" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [loc], lower([nom_loc]) as nom_loc FROM [tblLocalidades] WHERE ([mun] = @mun) ORDER BY [nom_loc]">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="cboMunicipio" Name="mun" PropertyName="Value" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>
                                        
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Región</label>
                                            <dx:ASPxComboBox runat="server"  ClientVisible="false" ID="cboRegion" ValueField="id" ValueType="System.String" TextField="nombre" ClientInstanceName="cboRegion" Theme="Material" Width="90%" OnCallback="cboRegion_Callback">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>   
                                            </dx:ASPxComboBox>
                            
                                        </div>
                                    </div>
                                </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos de contacto</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Teléfono local</label>
                                            <dx:ASPxSpinEdit ID="txtTelLocal" MaxLength="12" runat="server" Theme="Material" Width="90%" SpinButtons-ShowIncrementButtons="false">
                                                <SpinButtons ShowIncrementButtons="False"></SpinButtons>

                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxSpinEdit>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Teléfono celular</label>
                                            <dx:ASPxSpinEdit ID="txtTelCelular" MaxLength="10" runat="server" Theme="Material" Width="90%" SpinButtons-ShowIncrementButtons="false">
                                                <SpinButtons ShowIncrementButtons="False"></SpinButtons>

                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxSpinEdit>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Correo Electronico</label>
                                            <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" Width="90%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                            
                                        </div>
                                    </div>
                                </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos profesionales</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-6">
                                            <label>Profesión</label>
                                            <dx:ASPxComboBox runat="server" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion"
                                                Theme="Material" ID="cboProfesion"
                                                Width="90%" DataSourceID="SqlDataSource3" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
              
                                        </div>
                                        <div class="form-label-group col-md-6">
                                            <label>Institución de Egreso:</label>
                                            <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" TextField="Descripcion" ValueType="System.String" Theme="Material"
                                                ID="cboEgresado" Width="90%"
                                                DataSourceID="SqlDataSource4" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Universidad], [Descripcion] FROM [tblUniversidades] ORDER BY [Descripcion]"></asp:SqlDataSource>
              
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-3">
                                            <label>Fecha de título</label>
                                            <dx:ASPxDateEdit runat="server" ID="dtFechaTitulo" Theme="Material" Width="80%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>

                                        </div>
                                        <div class="form-label-group col-md-3">
                                            <label>Fecha de cédula</label>
                                            <dx:ASPxDateEdit runat="server" ID="dtFechaCedula" Theme="Material" Width="80%">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                     
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-6">
                                            <label>Cursos de actualización o postgrado</label>
                                            <dx:ASPxMemo ID="txtCursos" runat="server" MaxLength="800" Theme="Material" Width="100%" Height="60px">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxMemo>
                           
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-6">
                                            <label>Colegio de pertenencia</label>
                                            <dx:ASPxComboBox runat="server" ValueField="Id_Colegio" TextField="Descripcion" ValueType="System.String" Theme="Material"
                                                ID="cboColegio" Width="90%"
                                                DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>
                            
                                        </div>
                                    </div>
                                </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk; display: none">Registro SINFRA</p>
                                <div class="form-group" style="display:none">
                                    <div class="row" >
                                        <div class="form-label-group col-md-6">
                                            <label>Año de registro SINFRA</label>
                                            <dx:ASPxSpinEdit ID="txtAñoRegistro" ClientEnabled="false" runat="server" Theme="Material" SpinButtons-ShowIncrementButtons="false">
                                                <SpinButtons ShowIncrementButtons="False"></SpinButtons>
                                            </dx:ASPxSpinEdit>
              
                                        </div>
                                        <div class="form-label-group col-md-6">
                                            <label>Registro de D.R.O.</label>
                                            <div class="container-fluid row">
                                                <dx:ASPxComboBox ID="cboClasificacion" NullText="Clasificación" ClientEnabled="true" runat="server" Theme="Material" ValueType="System.String">
                                                <Items>
                                                    <dx:ListEditItem Text="A" Value="A" />
                                                    <dx:ListEditItem Text="B" Value="B" />
                                                    <dx:ListEditItem Text="C" Value="C" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                            <dx:ASPxTextBox ID="txtRegistro" NullText="Folio" ClientEnabled="false" runat="server" Theme="Material">
                                            </dx:ASPxTextBox>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                            <dx:ASPxComboBox ID="cboClaveProfesion" DataSourceID="SqlDataSource6" NullText="Clave Profesión" ClientEnabled="false" runat="server" Theme="Material" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion">
                                            </dx:ASPxComboBox>
                                            </div>
                                            
                            
                                        </div>
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                <div class="row  justify-content-center" >
                                    <div class="form-label-group text-center col-md-2">
                                                    <dx:ASPxButton ID="btnGuardar" runat="server" Theme="Material" ClientVisible="true" AutoPostBack="false" ClientInstanceName="btnGuardar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 56.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px" OnClick="btnGuardar_Click">
                                                        <ClientSideEvents Click="function(s, e) {
                                                            AgregarSolicitud(s,e);
                                                            }" />
                                                        <BackgroundImage ImageUrl="~/css/img/Recurso 56.png" Repeat="NoRepeat"></BackgroundImage>
                                                        <Border BorderStyle="None"></Border>
                                                    </dx:ASPxButton>
                                    </div>
                       
                                    <div class="form-label-group text-center col-md-2">
                                        <dx:ASPxButton runat="server" Theme="Material" OnClick="sube_Click" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 57.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px">
                                            <ClientSideEvents Click="function(s, e) {
                                                        cbSolicitud.SetVisible(false);
                                                        btnCancelar.SetVisible(false);
                                                        btnGuardar.SetVisible(false);
                                                        btnAgregarSolicitud.SetVisible(true);
                                                        txtCedula.SetEnabled(true);
                    txtCedula.SetVisible(true);
                    cboTipoTramite.SetEnabled(true);
                    cboTipoTramite.SetVisible(true);
                                                                        }" />
                                            <BackgroundImage ImageUrl="~/css/img/Recurso 57.png" Repeat="NoRepeat"></BackgroundImage>
                                            <Border BorderStyle="None"></Border>
                                        </dx:ASPxButton>
                                    </div>
                        
                                    </div>
                                </div>
                                
                            
                        </dx:PanelContent>
                    </PanelCollection>


                </dx:ASPxCallbackPanel>
            </div>
                

          


    <div>
        <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server">
        </dx:ASPxLoadingPanel>
    </div>
    </form>
</body>
</html>
