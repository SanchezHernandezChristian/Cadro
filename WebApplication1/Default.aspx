<%@ Page Title="Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.3.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                alert(htmlData[1]);
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
                alert(htmlData[1]);
                if (htmlData[0] == "true") {
                    cbSolicitud.SetVisible(false);
                    btnCancelar.SetVisible(false);
                    btnAgregarSolicitud.SetVisible(true);
                    cboTipoTramite.SetEnabled(true);
                    cboTipoTramite.SetEnabled(true);
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <div style="text-align: center; height:40px">
            <dx:ASPxLabel runat="server" Text="Registro" Font-Bold="true" Theme="Material" Font-Size="22px" ForeColor="#D6D2C9">
            </dx:ASPxLabel>
        </div>
        <div id="frmHitCounter" method="post" runat="server">
   <asp:Label runat="server" ID="lbluser" />
  </div>
        <br />
        <table style="width:800px; margin-left:300px">
            <tr>
                <td style="width: 150px">
                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Ingresa tu Cédula Profesional" Theme="Material">
                    </dx:ASPxLabel>
                </td>
                <td style="width: 200px">
                    <dx:ASPxTextBox MaxLength="10" ID="txtCedula" ClientInstanceName="txtCedula" runat="server" Theme="Material" Width="180px">
                       
                    </dx:ASPxTextBox>
                </td>
                <td style="width:50px"></td>
                <td style="width: 150px">
                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Selecciona el registro que deseas realizar" Theme="Material">
                    </dx:ASPxLabel>
                </td>
                <td style="width: 200px">
                    <dx:ASPxComboBox runat="server" ID="cboTipoTramites" ClientInstanceName="cboTipoTramite" ValueField="Id_Tipo_Solicitud" ValueType="System.String" TextField="Descripcion" Theme="Material" Width="220px">
                          <Items>
                          <dx:ListEditItem Text="Registro" Value="1"/>
                          <dx:ListEditItem Text="Registro con número anterior" Value="7"/>
                          </Items>                      
                    </dx:ASPxComboBox>
                </td>
            </tr>
            </table>
        <div style="text-align:center">
            <br />
            <dx:ASPxButton runat="server" ID="btnAgregarSolicitud" ClientInstanceName="btnAgregarSolicitud" Theme="Material" AutoPostBack="False" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 61.png" BackgroundImage-Repeat="NoRepeat" Height="48px" Width="191px">
                <ClientSideEvents Click="function(s, e) {
                    lp.Show();
	cbValidar.PerformCallback();
}" />
            </dx:ASPxButton>

        </div>

        <dx:ASPxCallback ID="cbValidar" ClientInstanceName="cbValidar" OnCallback="cbValidar_Callback" runat="server">
            <ClientSideEvents CallbackComplete="function(s, e) {
                lp.Hide();
  resultadoValidacion(s,e);
}" />
        </dx:ASPxCallback>
        <div style="width:1300px; margin-left:34px; margin-right:34px">
            <dx:ASPxCallbackPanel ID="cbSolicitud" ClientInstanceName="cbSolicitud" Theme="Material" ClientVisible="true" runat="server" Width="100%" OnCallback="cbSolicitud_Callback">
                <ClientSideEvents EndCallback="function(s, e) {
	terminaCallbackGuardar(s,e);
}" />
                <PanelCollection>
                    <dx:PanelContent runat="server">
                        <div>
                            <dx:ASPxLabel runat="server" ID="lblMensajeError" ClientInstanceName="lblMensajeError" ForeColor="Red" Font-Size="Small">
                            </dx:ASPxLabel>
                             <dx:ASPxLabel runat="server" ID="contra" ClientVisible="false" ForeColsor="Red" Font-Size="Small">
                            </dx:ASPxLabel>
                            <dx:ASPxLabel runat="server" ID="droalta" ClientVisible="false" ForeColor="Red" Font-Size="Small">
                            </dx:ASPxLabel>
                        </div>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Clave de solicitud" Theme="Material" ID="lblFolio" ClientInstanceName="lblFolio" ClientVisible="false">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtFolio" ClientInstanceName="txtFolio" ClientVisible="false" runat="server" Theme="Material" Width="100px" ClientEnabled="true">
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <dx:ASPxLabel ID="ASPxLabel2" ForeColor="#D6D2C9" runat="server" Text="Datos personales" Font-Bold="true" Theme="Moderno">
                        </dx:ASPxLabel>
                        <table style="width: 1300px; border-collapse: separate; border-spacing: 8px">
                            <tr>
                                <td style="width: 8%">
                                    <dx:ASPxLabel runat="server" ForeColor="#D6D2C9" Text="A. Paterno" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" MaxLength="25" Width="90%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 8%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="A. Materno" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxTextBox ID="txtAMaterno" runat="server" MaxLength="25" Theme="Material" Width="90%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width: 8%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Nombre(s)" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxTextBox ID="txtNombres" runat="server" Theme="Material" MaxLength="40" Width="90%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Calle y número" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtCalleNumero" runat="server" MaxLength="60" Theme="Material" Width="90%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Colonia" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtColonia" runat="server" Theme="Material" Width="90%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <dx:ASPxLabel runat="server" ID="lblinformacion" Text="Cédula (Digital)" ForeColor="#D6D2C9" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                            <td>
                                <asp:FileUpload ID="FlpArchivo" runat="server" BackColor="White" Width="280px" Height="30px"/>
                            </td>
                            </tr>
                            <tr>
                                <td>
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Municipio" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
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
                                </td>
                                <td>
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Localidad" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
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
                                </td>
                                <td>
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Región" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxComboBox runat="server" ID="cboRegion" ValueField="id" ValueType="System.String" TextField="nombre" ClientInstanceName="cboRegion" Theme="Material" Width="90%" OnCallback="cboRegion_Callback">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>   
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                        <br />

                        <dx:ASPxLabel ID="ASPxLabel3" ForeColor="#D6D2C9" runat="server" Text="Datos  de contacto" Font-Bold="true" Theme="Moderno">
                        </dx:ASPxLabel>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 8%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Teléfono local" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxSpinEdit ID="txtTelLocal" MaxLength="12" runat="server" Theme="Material" Width="90%" SpinButtons-ShowIncrementButtons="false">
<SpinButtons ShowIncrementButtons="False"></SpinButtons>

                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxSpinEdit>
                                </td>
                                <td style="width: 8%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Teléfono celular" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxSpinEdit ID="txtTelCelular" MaxLength="10" runat="server" Theme="Material" Width="90%" SpinButtons-ShowIncrementButtons="false">
<SpinButtons ShowIncrementButtons="False"></SpinButtons>

                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxSpinEdit>
                                </td>
                                <td style="width: 8%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Correo electrónico" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" Width="90%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxTextBox>
                                </td>
                            </tr>
                        </table>
                        <dx:ASPxLabel ID="ASPxLabel4" ForeColor="#D6D2C9" runat="server" Text="Datos Profesionales" Font-Bold="true" Theme="Moderno">
                        </dx:ASPxLabel>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 10%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Profesión" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 30%">
                                    <dx:ASPxComboBox runat="server" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion"
                                        Theme="Material" ID="cboProfesion"
                                        Width="90%" DataSourceID="SqlDataSource3" CallbackPageSize="15"
                                        EnableCallbackMode="True" EnableViewState="false">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                </td>
                                <td style="width: 10%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Egresado de " Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 30%">
                                    <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" TextField="Descripcion" ValueType="System.String" Theme="Material"
                                        ID="cboEgresado" Width="90%"
                                        DataSourceID="SqlDataSource4" CallbackPageSize="15"
                                        EnableCallbackMode="True" EnableViewState="false">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Universidad], [Descripcion] FROM [tblUniversidades] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 10%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Fecha título" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxDateEdit runat="server" ID="dtFechaTitulo" Theme="Material" Width="80%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                                <td style="width: 10%">
                                    <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Fecha cédula" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td style="width: 25%">
                                    <dx:ASPxDateEdit runat="server" ID="dtFechaCedula" Theme="Material" Width="80%">
                                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                        </ValidationSettings>
                                    </dx:ASPxDateEdit>
                                </td>
                            </tr>
                        </table>
                        <div>
                            <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Cursos de actualización o postgrado" Theme="Material">
                            </dx:ASPxLabel>
                            <dx:ASPxMemo ID="txtCursos" runat="server" MaxLength="800" Theme="Material" Width="100%" Height="60px">
                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                </ValidationSettings>
                            </dx:ASPxMemo>
                        </div>
                        <div>
                            <table style="width: 100%">
                                <tr>
                                    <td style="width: 10%">
                                        <dx:ASPxLabel ForeColor="#D6D2C9" runat="server" Text="Colegio" Theme="Material">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td style="width: 30%">
                                        <dx:ASPxComboBox runat="server" ValueField="Id_Colegio" TextField="Descripcion" ValueType="System.String" Theme="Material"
                                            ID="cboColegio" Width="90%"
                                            DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                            EnableCallbackMode="True" EnableViewState="false">
                                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                    </td>
                                    <td style="width: 60%">
                                </tr>
                            </table>
                        </div>
                        <dx:ASPxLabel ID="ASPxLabel5" ForeColor="#D6D2C9" runat="server" Text="Registro SINFRA" Font-Bold="true" Theme="Moderno">
                        </dx:ASPxLabel>
                        <br />
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <dx:ASPxLabel runat="server" ForeColor="#D6D2C9" Text="Año de Registro SINFRA" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <dx:ASPxSpinEdit ID="txtAñoRegistro" ClientEnabled="false" runat="server" Theme="Material" SpinButtons-ShowIncrementButtons="false">
<SpinButtons ShowIncrementButtons="False"></SpinButtons>
                                    </dx:ASPxSpinEdit>
                                </td>
                                <td>
                                    <dx:ASPxLabel runat="server" ForeColor="#D6D2C9" Text="Registro de D.R.O." Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                                <td>
                                    <table>
                                        <tr>
                                            <td>
                                                <dx:ASPxComboBox ID="cboClasificacion" NullText="Clasificación" ClientEnabled="true" runat="server" Theme="Material" ValueType="System.String">
                                                    <Items>
                                                        <dx:ListEditItem Text="A" Value="A" />
                                                        <dx:ListEditItem Text="B" Value="B" />
                                                        <dx:ListEditItem Text="C" Value="C" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                            </td>
                                            <td style="width:10px"></td>
                                            <td>
                                                <dx:ASPxTextBox ID="txtRegistro" NullText="Folio" ClientEnabled="false" runat="server" Theme="Material">
                                                </dx:ASPxTextBox>
                                            </td>
                                            <td style="width:10px"></td>
                                            <td>
                                                <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                                <dx:ASPxComboBox ID="cboClaveProfesion" DataSourceID="SqlDataSource6" NullText="Clave Profesión" ClientEnabled="false" runat="server" Theme="Material" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion">
                                                </dx:ASPxComboBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <div style="text-align:center">
                            <dx:ASPxLabel ID="ASPxLabel6" ForeColor="#D6D2C9" runat="server" Text="Historial de tus solicitudes" Font-Bold="true" Theme="Moderno">
                            </dx:ASPxLabel>
                        </div>
                        <br />
                        <div>
                            <dx:ASPxGridView ID="gvHistorial" runat="server" Theme="Material" Width="100%" OnDataBinding="gvHistorial_DataBinding" AutoGenerateColumns="False">
<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Vigencia" FieldName="anioVigencia" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Caption="Fecha Solicitud" FieldName="fecha_solicitud" VisibleIndex="1">
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Caption="Trámite Solicitado" FieldName="tramiteSolicita" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Estatus" FieldName="status" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataCheckColumn Caption="¿Autorizado?" FieldName="procede_si_no" VisibleIndex="4">
                                    </dx:GridViewDataCheckColumn>
                                    <dx:GridViewDataTextColumn Caption="Trámite que procedió" FieldName="tramiteProcede" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>  
                        <br />
                        <div style="text-align:center">
                            <table>
                                <tr>
                                    <td style="width:300px">
                                        <dx:ASPxButton ID="btnGuardar" runat="server" Theme="Material" ClientVisible="false" AutoPostBack="false" ClientInstanceName="btnGuardar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 56.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px" OnClick="btnGuardar_Click">
                                            <ClientSideEvents Click="function(s, e) {
                                                AgregarSolicitud(s,e);
                                                }" />
<BackgroundImage ImageUrl="~/css/img/Recurso 56.png" Repeat="NoRepeat"></BackgroundImage>
<Border BorderStyle="None"></Border>
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton runat="server" Theme="Material" OnClick="sube_Click" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 57.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px">
                                            <ClientSideEvents Click="function(s, e) {
                            cbSolicitud.SetVisible(false);
                            btnCancelar.SetVisible(false);
                            btnGuardar.SetVisible(false);
                            btnAgregarSolicitud.SetVisible(true);
                            txtCedula.SetEnabled(true);
                            cboTipoTramite.SetEnabled(true);
                                            }" />
            <BackgroundImage ImageUrl="~/css/img/Recurso 57.png" Repeat="NoRepeat"></BackgroundImage>
            <Border BorderStyle="None"></Border>
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
    </div>
    <div>
        <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server">
        </dx:ASPxLoadingPanel>
    </div>
</asp:Content>