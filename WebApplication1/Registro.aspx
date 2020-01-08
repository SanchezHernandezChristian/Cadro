<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="WebApplication1.WebForm1" %>

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
    <script src="Content/sweetalert2.all.min.js"></script>
    
    <script type="text/javascript">
        function habilitarEdicion(habilitar) {
            btnCancelar.SetVisible(habilitar);
            Solicitud.SetVisible(habilitar);
            btnGuardar.SetVisible(habilitar);
        }
        function notificacion(texto) {
            swal.fire({
                title: 'Error',
                icon: 'error',
                type: 'error',
                text: texto

            });
        };
        
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
                document.getElementById("div_cedula").style.display = "none";
                cboTipoTramite.SetEnabled(true);
                cboTipoTramite.SetVisible(false);
                var tipoTramiteSeleccionado = cboTipoTramite.GetText().toLowerCase();
                if (tipoTramiteSeleccionado == "registro" || tipoTramiteSeleccionado == "registro con número anterior") {
                    habilitarEdicion(true);
                } else {
                    habilitarEdicion(true);
                    habilitarEdicion(true);
                    Solicitud.PerformCallback(txtCedula.GetText());
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
                Solicitud.PerformCallback('Guardar');
            }
        }

        function terminaCallbackGuardar(s, e) {
            if (s.cp_Resultado) {
                var htmlData = s.cp_Resultado.split("|");
                //alert(htmlData[1]);
                swal.fire({
                    icon: 'success',
                    html: htmlData[1]
                });
                console.log(htmlData[1]);
                if (htmlData[0] == "true") {
                    Solicitud.SetVisible(false);
                    btnCancelar.SetVisible(false);
                    btnAgregarSolicitud.SetVisible(true);
                    txtCedula.SetEnabled(true);
                    txtCedula.SetVisible(true);
                    cboTipoTramite.SetEnabled(true);
                    cboTipoTramite.SetVisible(true);
                    swal.fire({
                        icon: 'success',
                        html: htmlData[1]
                    });
                    console.log(htmlData[1]);
                }
                else {
                    swal.fire({
                        icon: 'error',
                        html: htmlData[1]
                    });
                    console.log(htmlData[1]);
                }
            }
        }
        function ActualizaLocalidad(s, e) {

        }

        function soloNumeros(e) {
            var keynum = window.event ? window.event.keyCode : e.which;
            if ((keynum == 8) || (keynum == 46))
                return true;
            return /\d/.test(String.fromCharCode(keynum));

        }
    </script>
</head>
<body>
        <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-2 bg-white border-bottom shadow-sm">
            <img style="text-align: center; background-size: cover; max-width:200px; " src="/css/img/logo.png"/>
            <br />
            <h5 class="my-0 mr-md-auto font-weight-normal col" style="padding-left: 1rem;">Comité de acreditación de Dirección de Responsables de Obra</h5>
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

            
                <div class="form-group" id="div_cedula">
                    <div class="row  justify-content-center" >
                        <div class="form-label-group col-md-5">
                            <label>Ingrese su Cédula Profesional</label>
                            <dx:ASPxTextBox MaxLength="10" ID="txtCedula" type="number" onkeypress="return soloNumeros(event);" ClientInstanceName="txtCedula" runat="server" Theme="Material" CssClass="form-control">
                            </dx:ASPxTextBox>
                            
                        </div>
                        <div class="form-label-group col-md-5 ">
                            <label>Seleccione el registro que desea realizar</label>
                                <dx:ASPxComboBox runat="server" ID="cboTipoTramites" ClientInstanceName="cboTipoTramite" ValueField="Id_Tipo_Solicitud" ValueType="System.String" TextField="Descripcion" Theme="Material" Cssclass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                                        <Items>
                                        <dx:ListEditItem Text="Registro" Value="1"/>
                                        <dx:ListEditItem Text="Registro con número anterior" Value="7"/>
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
            <dx:ASPxCallbackPanel ID="Solicitud" ClientInstanceName="Solicitud" Theme="Material" ClientVisible="false" runat="server" Width="100%" OnCallback="Solicitud_Callback">
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
                                <dx:ASPxTextBox ID="txtFolio" ClientInstanceName="txtFolio" ClientVisible="false" runat="server" Theme="Material" Width="100px" ClientEnabled="true">
                                </dx:ASPxTextBox>
                            </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Paterno</label>
                                            <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" MaxLength="25" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                           
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Materno</label>
                                            <dx:ASPxTextBox ID="txtAMaterno" runat="server" MaxLength="25" Theme="Material" Width="100%" CssClass="form-control">   
                                            </dx:ASPxTextBox>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Nombre(s)</label>
                                            <dx:ASPxTextBox ID="txtNombres" runat="server" Theme="Material" MaxLength="40" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-2">
                                            <label>Día de nacimiento</label>
                                            <dx:ASPxComboBox runat="server" ValueType="System.String"  Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="dia_nacimiento" Width="100%" EnableViewState="false">
                                                <Items>
                                                    <dx:ListEditItem Text="01" Value="01"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="02" Value="02"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="03" Value="03"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="04" Value="04"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="05" Value="05"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="06" Value="06"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="07" Value="07"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="08" Value="08"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="09" Value="09"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="10" Value="10"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="11" Value="11"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="12" Value="12"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="13" Value="13"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="14" Value="14"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="15" Value="15"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="16" Value="16"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="17" Value="17"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="18" Value="18"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="19" Value="19"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="20" Value="20"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="21" Value="21"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="22" Value="22"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="23" Value="23"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="24" Value="24"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="25" Value="25"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="26" Value="26"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="27" Value="27"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="28" Value="28"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="29" Value="29"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="30" Value="30"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="31" Value="31"></dx:ListEditItem>
                                                </Items>
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>

                                        </div>
                                        <div class="form-label-group col-md-2">
                                            <label>Mes de nacimiento</label>
                                            <dx:ASPxComboBox runat="server" ValueType="System.String"  Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="mes_nacimiento" Width="100%"  EnableViewState="false">
                                                <Items>
                                                    <dx:ListEditItem Text="01" Value="01"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="02" Value="02"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="03" Value="03"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="04" Value="04"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="05" Value="05"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="06" Value="06"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="07" Value="07"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="08" Value="08"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="09" Value="09"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="10" Value="10"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="11" Value="11"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="12" Value="12"></dx:ListEditItem>
                                                </Items>
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div class="form-label-group col-md-2">
                                            <label>Año de nacimiento</label>
                                            <dx:ASPxTextBox ID="año_nacimiento" runat="server" MaxLength="4" Theme="Material" Width="100%"  CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                        <div class="form-label-group col-md-2">
                                            <label>Sexo</label>
                                            <dx:ASPxComboBox runat="server" ValueType="System.String"  Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="sexo" Width="100%"  EnableViewState="false">
                                                <Items>
                                                    <dx:ListEditItem Text="Hombre" Value="1"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Mujer" Value="2"></dx:ListEditItem>
                                                </Items>
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Estado de nacimiento</label>
                                            <dx:ASPxComboBox runat="server" ValueType="System.String"  Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="nacimiento" Width="100%"  EnableViewState="false">
                                                <Items>
                                                    <dx:ListEditItem Text="Aguascalientes" Value="Aguascalientes"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Baja California" Value="Baja California"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Baja California Sur" Value="Baja California Sur"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Campeche" Value="Campeche"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Chiapas" Value="Chiapas"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Chihuahua" Value="Chihuahua"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Coahuila de Zaragoza" Value="Coahuila de Zaragoza"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Colima" Value="Colima"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Durango" Value="Durango"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Estado de México" Value="Estado de México"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Guanajuato" Value="Guanajuato"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Guerrero" Value="Guerrero"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Hidalgo" Value="Hidalgo"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Jalisco" Value="Jalisco"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Michoacán de Ocampo" Value="Michoacán de Ocampo"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Morelos" Value="Morelos"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Nayarit" Value="Nayarit"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Nuevo León" Value="Nuevo León"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Oaxaca" Value="Oaxaca"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Puebla" Value="Puebla"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Querétaro" Value="Querétaro"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Quintana Roo" Value="Quintana Roo"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="San Luis Potosí" Value="San Luis Potosí"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Sinaloa" Value="Sinaloa"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Sonora" Value="Sonora"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Tabasco" Value="Tabasco"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Tamaulipas" Value="Tamaulipas"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Tlaxcala" Value="Tlaxcala"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Veracruz de Ignacio de la Llave" Value="Veracruz de Ignacio de la Llave"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Yucatán" Value="Yucatán"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Zacatecas" Value="Zacatecas"></dx:ListEditItem>
                                                </Items>
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>CURP</label>
                                            <dx:ASPxTextBox ID="curp" runat="server" MaxLength="18" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>RFC</label>
                                            <dx:ASPxTextBox ID="rfc" MaxLength="11" runat="server" Theme="Material" Width="100%" CssClass="form-control">
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
                                            <label>Municipio</label>
                                            <dx:ASPxComboBox runat="server" ValueField="idMunicipio" ValueType="System.String" TextField="nombreMunicipioINEGI" 
                                                ID="cboMunicipio" Theme="Material" Width="100%" DataSourceID="SqlDataSource2" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
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
                                            <dx:ASPxCallbackPanel ID="callpanelLocalidad" ClientInstanceName="callpanelLocalidad" Theme="Material" runat="server" 
                                                Width="100%" OnCallback="callpanelLocalidad_Callback" >
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades" TextField="nom_loc" ValueField="loc" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"></dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="dsLocalidades" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id], [loc], lower([nom_loc]) as nom_loc FROM [tblLocalidades] WHERE ([mun] = @mun) ORDER BY [nom_loc]">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="cboMunicipio" Name="mun" PropertyName="Value" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>
                                        
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Colonia</label>
                                            <dx:ASPxTextBox ID="txtColonia" runat="server" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Calle y número</label>
                                            <dx:ASPxTextBox ID="txtCalleNumero" runat="server" MaxLength="60" Theme="Material" Width="100%" CssClass="form-control">
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
                                            <dx:ASPxComboBox runat="server"  ClientVisible="false" ID="cboRegion" ValueField="id" 
                                                ValueType="System.String" TextField="nombre" ClientInstanceName="cboRegion" 
                                                Theme="Material" Width="100%" OnCallback="cboRegion_Callback" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
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
                                            
                                            <dx:ASPxTextBox MaxLength="10" ID="txtTelLocal" type="number" onkeypress="return soloNumeros(event);" 
                                                Width="100%" runat="server" Theme="Material" CssClass="form-control">
                                                     <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>                            
                                                
                                                </dx:ASPxTextBox>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Teléfono celular</label>
                                                <dx:ASPxTextBox MaxLength="10" ID="txtTelCelular" type="number" onkeypress="return soloNumeros(event);" 
                                                    Width="100%" runat="server" Theme="Material" CssClass="form-control">
                                                     <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>                            
                                                
                                                </dx:ASPxTextBox>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Correo Electronico</label>
                                            <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                            <asp:RegularExpressionValidator ID="validateEmail"    
                                              runat="server" ErrorMessage="Correo no valido" foreColor="red"
                                              ControlToValidate="txtCorreoElectronico" 
                                              ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                            
                                        </div>
                                    </div>
                                </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos profesionales</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Profesión</label>
                                            <dx:ASPxComboBox runat="server" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                Theme="Material" ID="cboProfesion"
                                                Width="100%" DataSourceID="SqlDataSource3" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id_profesion], [descripcion] FROM [tblProfesiones] ORDER BY [descripcion]"></asp:SqlDataSource>
              
                                        </div>
                                        <div class="form-label-group col-md-6">
                                            <label>Institución de Egreso:</label>
                                            <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" TextField="Descripcion" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="cboEgresado" Width="100%"
                                                DataSourceID="SqlDataSource4" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id_universidad], [Descripcion] FROM [tblUniversidades] ORDER BY [Descripcion]"></asp:SqlDataSource>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Cédula</label>
                                            <dx:ASPxLabel runat="server" Width="100%" ID="lblinformacion" Text="Cédula Digital" ForeColor="#D6D2C9" Theme="Material" CssClass="form-control">
                                            </dx:ASPxLabel>
                                            <br />
                                            <asp:FileUpload ID="FileUpload1" runat="server" BackColor="White" Width="280px" Height="30px"/>
                                            <br />
                                            <br />
                                            <asp:RegularExpressionValidator 
             id="RegularExpressionValidator1" runat="server" 
             ErrorMessage="Solamente archivos PDF" 
             ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.pdf)$" 
             ControlToValidate="FileUpload1" ForeColor="Red">
        </asp:RegularExpressionValidator>
                                        </div>
                                        <div class="form-label-group col-md-6">
                                            <label>Colegio de pertenencia</label>
                                            <dx:ASPxComboBox runat="server"  ValueField="Id_Colegio" TextField="Descripcion" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="cboColegio" Width="100%"
                                                DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id_colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Fecha de título</label>
                                            <dx:ASPxDateEdit runat="server" Height="100%" ID="dtFechaTitulo" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" Theme="Material" Width="80%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>

                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Fecha de cédula</label>
                                            <dx:ASPxDateEdit runat="server" Height="100%" ID="dtFechaCedula" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" Theme="Material" Width="80%" CssClass="form-control" >
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
                                            <dx:ASPxMemo ID="txtCursos" runat="server" MaxLength="800" Theme="Material" Width="100%" Height="60px" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxMemo>
                           
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                    </div>
                                </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk; display:none">Registro SINFRA</p>
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
                                                    <dx:ASPxButton ID="btnGuardar" runat="server" Theme="Material" ClientVisible="true" AutoPostBack="false" ClientInstanceName="btnGuardar"
                                                         Border-BorderStyle="None" ImageUrlBackColor="Transparent" BackgroundImage-="~/css/img/Recurso 56.png" BackgroundImage-Repeat="NoRepeat" 
                                                        Height="45px" Width="180px" OnClick="btnGuardar_Click">
                                                        <ClientSideEvents Click="function(s, e) {
                                                            AgregarSolicitud(s,e);
                                                            }" />
                                                        <BackgroundImage ImageUrl="~/css/img/Recurso 56.png" Repeat="NoRepeat"></BackgroundImage>
                                                        <Border BorderStyle="None"></Border>
                                                    </dx:ASPxButton>
                                    </div>
                       
                                    <div class="form-label-group text-center col-md-2">
                                        <dx:ASPxButton runat="server" Theme="Material" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 57.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px">
                                            <ClientSideEvents Click="function(s, e) {
                                                window.location.href='Registro.aspx';
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


