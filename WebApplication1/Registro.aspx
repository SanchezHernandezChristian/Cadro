<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registro.aspx.cs" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta http-equiv="Content-Language" content="es" />
    <title>Registro</title>
    <link rel="shortcut icon" href="css/img/LogoVII.ico" type="image/x-icon" />
    <link rel="icon" href="css/img/LogoVII.ico" type="image/x-icon" />
    <script src="Content/notificaciones.js"></script>
    <script src="Content/sweetalert2.all.min.js"></script>

    <script type="text/javascript">
        function imagenarriba() {
            window.location.href = '/default';
        }
        function habilitarEdicion(habilitar) {
            btnCancelar.SetVisible(habilitar);
            Solicitud.SetVisible(habilitar);
            btnGuardar.SetVisible(habilitar);
        }

        function UpdateUploadButton() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl.GetFileInputCount() ; i++) {
                if (uploadControl.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
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
                txtCedula.SetEnabled(false);
                txtCedula.SetVisible(true);
                habilitarEdicion(true);
                Solicitud.PerformCallback(txtCedula.GetText());
            } else {
                notificacionerror(htmlData[1]);

                //alert(htmlData[1]);
            }
        }

        function AgregarSolicitud(s, e) {
            var editoresValidos = ASPxClientEdit.AreEditorsValid();
            Swal.fire({
                html: 'Los datos de acceso serán enviados al correo: <b>' + txtCorreoElectronico.GetText() + '</b>  con el registro de cedula profesional: <b>' + txtCedula.GetText() + '</b>',
                type: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#c87cdf',
                cancelButtonColor: '#00b7df',
                confirmButtonText: 'Continuar',
                cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.value) {
                    if (editoresValidos) {
                        Solicitud.PerformCallback('Guardar');

                    } else {
                        notificacionerror("Rellene todos los campos");
                    }
                }
            })

        }

        function terminaCallbackGuardar(s, e) {
            if (s.cp_Resultado) {
                var htmlData = s.cp_Resultado.split("|");
                //alert(htmlData[1]);
                notexitoso(htmlData[1], "default.aspx");

                if (htmlData[0] == "true") {
                    Solicitud.SetVisible(false);
                    btnCancelar.SetVisible(false);
                    btnAgregarSolicitud.SetVisible(true);
                    txtCedula.SetEnabled(true);
                    txtCedula.SetVisible(true);
                    notexitoso(htmlData[1], "default.aspx");
                }
                else {
                    notificacionerror(htmlData[1]);
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
            //           console.log(txtCedula.GetText());
            //         labelcedula.SetText(txtCedula.GetText());
            //       cedulatxt.SetText(txtCedula.GetText());
        }
    </script>
</head>
<body>
    <div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-2 bg-white border-bottom shadow-sm">
        <div class="row">
            <asp:HyperLink ID="link" NavigateUrl="~/" runat="server">
                <asp:Image ID="imagenTop" runat="server" ImageUrl="~/css/img/logo.png" Style="text-align: center; background-size: cover; max-width: 200px;" CssClass="col-xl" AlternateText="Imagen no disponible" />
            </asp:HyperLink>

            <br />
            <h5 class="my-0 mr-md-auto font-weight-normal col" style="padding-left: 1rem;">Comisión de Admisión de Directores Responsables de Obra</h5>
        </div>

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
                    <div class="row  justify-content-center">
                        <div class="form-label-group col-md-5">
                            <label>Ingrese su Cédula Profesional</label>
                            <dx:ASPxTextBox MaxLength="10" ID="txtCedula" type="number" onkeypress="return soloNumeros(event);" ClientInstanceName="txtCedula" runat="server" Theme="Material" CssClass="form-control" ClientEnabled="true" EnableClientSideAPI="True">
                            </dx:ASPxTextBox>

                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row justify-content-center">
                        <div class="form-label-group text-center col-md-2">
                            <dx:ASPxButton runat="server" ID="btnAgregarSolicitud" ClientInstanceName="btnAgregarSolicitud" Theme="Material" AutoPostBack="False" Border-BorderStyle="None"
                                Text="Enviar" CssClass="mr-2 btn btn-aceptar" Width="100%">
                                <Image Url="~/css/img/enviar.png"></Image>
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
                  }" />
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
                        </div>
                        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
                        <div class="form-group">
                            <div class="row">
                                <div class="form-label-group col-md-4">
                                    <label>Nombre(s)</label>
                                    <dx:ASPxTextBox ID="txtNombres" runat="server" Theme="Material" MaxLength="40" Width="100%" CssClass="form-control">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>

                                </div>
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
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="form-label-group col-md-2">
                                    <label>Día de nacimiento</label>
                                    <dx:ASPxComboBox runat="server" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
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
                                    <dx:ASPxComboBox runat="server" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                        ID="mes_nacimiento" Width="100%" EnableViewState="false">
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
                                    <dx:ASPxTextBox ID="año_nacimiento" runat="server" onkeypress="return soloNumeros(event);" MaxLength="4" Theme="Material" Width="100%" CssClass="form-control">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </div>
                                <div class="form-label-group col-md-2">
                                    <label>Sexo</label>
                                    <dx:ASPxComboBox runat="server" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                        ID="sexo" Width="100%" EnableViewState="false">
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
                                    <dx:ASPxComboBox runat="server" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                        ID="nacimiento" Width="100%" EnableViewState="false">
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
                                            <dx:ListEditItem Text="Ciudad de México" Value="CDMX"></dx:ListEditItem>
                                        </Items>
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="form-label-group col-md-4">
                                    <label>CURP</label>
                                    <dx:ASPxTextBox ID="curp" runat="server" MaxLength="18" Theme="Material" Width="100%" CssClass="form-control">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>

                                        </div>
                                        
                                <div class="form-label-group col-md-4">
                                    <label>RFC (Con homoclave)</label>
                                    <dx:ASPxTextBox ID="rfc" MaxLength="13" runat="server" Theme="Material" Width="100%" CssClass="form-control">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>

                                </div>

                            </div>
                        </div>
                        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Domicilio</p>
                        <div class="form-group">
                            <div class="row">
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
                                        Width="100%" OnCallback="callpanelLocalidad_Callback">
                                        <PanelCollection>
                                            <dx:PanelContent runat="server">
                                                <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades"
                                                    TextField="nom_loc" ValueField="idloc" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                                                    <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                        <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                    </ValidationSettings>
                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="dsLocalidades" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id] as idloc, lower([nom_loc]) as nom_loc FROM [tblLocalidades] WHERE ([mun] = @mun) ORDER BY [nom_loc]">
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
                            <div class="row">
                                <div class="form-label-group col-md-4">
                                    <dx:ASPxComboBox runat="server" ClientVisible="false" ID="cboRegion" ValueField="id"
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
                            <div class="row">
                                <div class="form-label-group col-md-4">
                                    <label>Teléfono local</label>

                                    <dx:ASPxTextBox MaxLength="10" ID="txtTelLocal" type="number" onkeypress="return soloNumeros(event);"
                                        Width="100%" runat="server" Theme="Material" CssClass="form-control">
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
                                    <label>Correo Electrónico</label>
                                    <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" Width="100%" ClientEnabled="true"
                                        ClientVisible="true" ClientInstanceName="txtCorreoElectronico" CssClass="form-control"
                                        onblur="validarcorreo()">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                            <RegularExpression ErrorText="Correo no valido"
                                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </div>
                            </div>
                        </div>
                        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos profesionales</p>
                        <div class="form-group">
                            <div class="row">
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
                                    <label>Institución de Egreso</label>
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
                                <div class="form-label-group col-md-6">
                                    <label>Colegio de pertenencia</label>
                                    <dx:ASPxComboBox runat="server" ValueField="Id_Colegio" TextField="Descripcion" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
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
                            <div class="row">
                                <div class="form-label-group col-md-4">
                                    <label>Fecha de título</label>
                                    <dx:ASPxDateEdit runat="server" Height="100%" ID="dtFechaTitulo" OnInit="dtFechaTitulo_Init" EditFormatString="dd/MM/yyyy"
                                        DisplayFormatString="dd/MM/yyyy" Theme="Material" Width="80%" CssClass="form-control">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>

                                </div>
                                <div class="form-label-group col-md-4">
                                    <label>Fecha de cédula</label>
                                    <dx:ASPxDateEdit runat="server" Height="100%" ID="dtFechaCedula" OnInit="dtFechaCedula_Init" EditFormatString="dd/MM/yyyy"
                                        DisplayFormatString="dd/MM/yyyy" Theme="Material" Width="80%" CssClass="form-control">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="form-label-group col-md-6">
                                    <label>Cursos de actualización o postgrado</label>
                                    <dx:ASPxMemo ID="txtCursos" runat="server" MaxLength="800" Theme="Material" Width="100%" Height="60px" CssClass="form-control">
                                    </dx:ASPxMemo>

                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                            </div>
                        </div>
                        <p class="text-center text-black rounded h5" style="background-color: cornsilk; display: none">Registro SINFRA</p>
                        <div class="form-group" style="display: none">
                            <div class="row">
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
                            <div class="row  justify-content-center">
                                <div class="form-label-group text-center col-md-2">
                                    <dx:ASPxButton ID="btnGuardar" runat="server" Theme="Material" ClientVisible="true" AutoPostBack="false" ClientInstanceName="btnGuardar" Border-BorderStyle="None"
                                        Text="Registrar" CssClass="mr-2 btn btn-aceptar" Width="100%">
                                        <Image Url="~/css/img/registrar.png"></Image>
                                        <ClientSideEvents Click="function(s, e) {
                                                            AgregarSolicitud(s,e);
                                                            }" />
                                        <Border BorderStyle="None"></Border>
                                    </dx:ASPxButton>
                                </div>

                                <div class="form-label-group text-center col-md-2">
                                    <dx:ASPxButton runat="server" Theme="Material" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None"
                                        Text="Cancelar" CssClass="mr-2 btn btn-cancelar" Width="100%">
                                        <Image Url="~/css/img/cancelar.png"></Image>
                                        <ClientSideEvents Click="function(s, e) {
                                                window.location.href='Default.aspx';
                                                                        }" />
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
            <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server" Modal="false">
            </dx:ASPxLoadingPanel>
        </div>
    </form>
</body>
</html>


