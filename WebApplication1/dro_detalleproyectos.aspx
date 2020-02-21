<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="dro_detalleproyectos.aspx.cs" Inherits="WebApplication1.dro_detalleproyectos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script>
        function cbGuardarDROComplete(s, e) {
             try {
                var htmlData = e.result.split("|");

                if (htmlData[0] == "true") {
                    alert(htmlData[1]);
                } else {
                    alert(htmlData[1]);
                }

            } catch (exception) {
                console.log(exception);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


   <div class="col-md-12">
         <dx:ASPxMenu ID="menuCadro" runat="server" Width="100%" Orientation="Horizontal" HorizontalAlign="Left" Theme="Material" BackColor="White">

                <Items>
                                            <dx:MenuItem Text="Inicio" NavigateUrl="solicitante.aspx">
                                                <Image Url="css/img/Recurso 29.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem Text="Nuevos Trámites" NavigateUrl="registros_dro.aspx">
                                                <Image Url="css/img/Recurso 30.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem Text="PII" NavigateUrl="dro_misproyectos.aspx">
                                                <Image Url="css/img/pii blanco.png" Width="32px" Height="32px">
                                                  </Image>
                                            </dx:MenuItem>
                                        </Items>
            </dx:ASPxMenu>
    </div>
    
      <script type="text/javascript" src="http://maps.google.com/maps/api/js?key=AIzaSyAVIAaexuLN0lfi9PKHdklnJ8j0pcVnmmU&sensor=false&language=es&libraries=places"></script>
    <script src="Scripts/JSMarkerClusterer.js"></script>
    <script src="Scripts/jsMaps.js"></script>
    <link href="Content/estilos.css" rel="stylesheet" />
    <script src="Scripts/rp_EditarProyectos.js"></script>

    <script>
        function OtraLocalidad(s, e) {
            var nombreLocalidad = cmbLocalidad.GetSelectedItem().value;
            if (nombreLocalidad == 999) {
                lblOtroLocalidad.SetVisible(true);
                lblLinkDof.SetVisible(true);
                cp_otraLocalidad.SetVisible(true);
                txtOtraLocalidad.SetVisible(true);
                txtOtraLocalidad.SetEnabled(true);
                cp_otraLocalidad.SetEnabled(true);
            }
            else {
                lblLinkDof.SetVisible(false);
                lblOtroLocalidad.SetVisible(false);
                txtOtraLocalidad.SetVisible(false);
                txtOtraLocalidad.SetEnabled(false);
                cp_otraLocalidad.SetEnabled(false);
                cp_otraLocalidad.SetVisible(false);
            }
        }

        function sumarPersonas(s, e) {
            var hombres = 0;
            var mujeres = 0;
            if (txtHombres.GetText() != '')
                hombres = parseInt(txtHombres.GetText(), 10);
            if (txtMujeres.GetText() != '')
                mujeres = parseInt(txtMujeres.GetText(), 10);
            txtTotalBeneficiarios.SetText(hombres + mujeres);
        }

        function onFileUploadCompleteFotos(s, e) {
            if (e.callbackData) {
                var fileData = e.callbackData.split('|');
                if (fileData[0] == "true") {
                    cbpFotosGeoreferenciadas.PerformCallback();
                    cbGeoreferencias.PerformCallback();
                }
                else {
                    alert(fileData[1]);
                }
            }
        }

        function onCallbackCompletecbGeoreferencia(s, e) {
            inicializarMapa(e.result);
            gvPuntos.PerformCallback();
        }

        function onCallbackCompletecbGuardarInfoBasica(s, e) {
            try {
                LoadingPanel.Hide();
                var htmlData = e.result.split("|");
                alert(htmlData[1]);
            } catch (exception) {
            }
        }

        function onEndCbComponente(s, e) {
            if (s.cp_msj !== undefined || s.cp_msj !== null) {
                alert(s.cp_msj);
                gvComponentes.PerformCallback();
            }
        }

        function CustomButtonClick(s, e) {
            //key = s.GetRowKey(e.visibleIndex);
            //switch (e.buttonID) {
            //    case "elimCompo":
            //        cbEliminaComponente.PerformCallback(key);
            //        break;
            //}

            if (e.buttonID == 'elimCompo') {
                if (confirm("¿Desea eliminar el componente?")) {
                    gvComponentes.DeleteRow(e.visibleIndex);
                }
            } else {
                gvComponentes.StartEditRow(e.visibleIndex);
            }
        }

        function OnCbCompleteEliminaComponente(s, e) {
            try {
                var htmlData = e.result.split("|");

                if (htmlData[0] == "true") {
                    alert(htmlData[1]);
                    gvComponentes.PerformCallback();

                } else {
                    alert(htmlData[1]);

                }

            } catch (exception) {
                console.log(exception);
            }
        }
        function p_1(s, e) {
            p1.Show();
        }
        function p_2(s, e) {
            p2.Show();
        }
        function problematica(s, e) {
            p3.Show();
        }

        function almacenarPresupuesto() {
            if (confirm("¿Está seguro que deseas guardar la información en este momento?")) {
                LoadingPanel.SetText('Enviando información. Espere por favor.');
                LoadingPanel.Show();
                cbGuardarConceptos.PerformCallback();
            }
        }

        function onFileUpload(s, e) {
            if (e.callbackData) {
                var fileData = e.callbackData.split('|');
                if (fileData[0] == "True") {

                    gridVistaPrevia.PerformCallback();
                    pcVistaPreviaPresupuesto.Show();
                }
                else {
                    alert(fileData[1]);
                }
            }

        }

        function onCallbackCompletecbGuardarConceptos(s, e) {
            try {

                var htmlData = e.result.split("|");

                if (htmlData[0] == "true") {
                    gridViewConceptos.PerformCallback();
                    upcExcel.SetEnabled(false);
                }
                LoadingPanel.Hide();
                alert(htmlData[1]);
                pcVistaPreviaPresupuesto.Hide();

            }
            catch (exception) {
            }
        }
    </script>
    <style>
        #pac-input:focus {
            border-color: #4d90fe;
        }

        .pac-container {
            font-family: Roboto;
        }

        #type-selector {
            color: #fff;
            background-color: #4d90fe;
            padding: 5px 11px 0px 11px;
        }

            #type-selector label {
                font-family: Roboto;
                font-size: 13px;
                font-weight: 300;
            }

        .auto-style2 {
            font-weight: bold;
            text-align: right;
        }

        .auto-style3 {
            font-weight: bold;
            text-align: right;
            width: 13%;
        }

        .auto-style5 {
            width: 17%;
        }

        .auto-style7 {
            width: 18%;
        }

        .auto-style8 {
            font-weight: bold;
            text-align: right;
            width: 18%;
        }

        .auto-style9 {
            font-weight: bold;
            text-align: right;
            width: 13%;
            font-family: Tahoma, Geneva, sans-serif;
            font-size: 12px;
        }
        .auto-style10 {
            text-align: center;
            height: 30px;
        }
    </style>


    <div>
        <dx:ASPxLabel runat="server" ID="lblError" ForeColor="Red"></dx:ASPxLabel>

        <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
            <tr>
                <td style="width: 13%" class="auto-style2">
                    <dx:ASPxButton runat="server" AutoPostBack="False" Text="CERRAR PROYECTO" Theme="Material" BackColor="#003366" ID="ASPxButton2">
                        <ClientSideEvents Click="function(s, e) {javascript:history.back();}" />
                    </dx:ASPxButton>
                </td>

                <td style="width: 20%"></td>

                <td style="width: 13%" class="auto-style2"></td>

                <td style="width: 20%"></td>

                <td style="width: 13%" class="text-right">
                    <label class="control-label" for="middle-name">
                        Folio</label></td>

                <td style="width: 20%">
                    <dx:ASPxSpinEdit ID="txtFolio" ClientInstanceName="txtFolio" runat="server" Number="0" HorizontalAlign="Right" NumberType="Integer" ReadOnly="True" Theme="Material" Width="98%">
                        <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                        </SpinButtons>
                    </dx:ASPxSpinEdit>

                </td>
            </tr>
        </table>
        <br />
        <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
            <tr>
                <td style="width: 13%" class="auto-style2">
                    <label class="control-label" for="middle-name">Renovación de Opinión Técnica</label></td>

                <td style="width: 20%">
                    <dx:ASPxCheckBox ID="chkRenovacionOpinionTecnica" runat="server" CheckState="Unchecked" Theme="Material" ReadOnly="true">
                    </dx:ASPxCheckBox>
                </td>

                <td style="width: 13%" class="auto-style2">
                    <label class="control-label" for="middle-name">Ejecutor</label>
                </td>

                <td style="width: 20%">
                    <dx:ASPxComboBox ID="cmbModalidadEjecucion" ClientInstanceName="cmbModalidadEjecucion" runat="server" ValueType="System.String" Theme="Material" Width="98%" ReadOnly="true">
                        <Items>
                            <dx:ListEditItem Text="MUNICIPAL" Value="MUNICIPAL" />
                            <dx:ListEditItem Selected="True" Text="SINFRA" Value="SINFRA" />
                        </Items>
                    </dx:ASPxComboBox>
                </td>

                <td style="width: 13%" class="auto-style2">
                    <label class="control-label" for="middle-name">
                        Ejercicio</label></td>

                <td style="width: 20%">

                    <dx:ASPxComboBox ID="cmbEjercicio" ClientInstanceName="cmbEjercicio" runat="server" ValueType="System.String" Theme="Material" Width="98%" ReadOnly="true">
                        <Items>
                            <dx:ListEditItem Selected="True" Text="2019" Value="2019" />
                            <dx:ListEditItem Text="2020" Value="2020" />
                        </Items>
                    </dx:ASPxComboBox>

                </td>
            </tr>
            <tr>
                <td style="width: 13%" class="auto-style2">
                    <label class="auto-style1" for="middle-name" style="max-width: 100%;" __designer:mapid="2c6">
                        Proyecto</label></td>

                <td colspan="5">
                    <dx:ASPxMemo runat="server" Height="71px" Width="99%" Theme="Material" ID="txtNombreProyecto" ReadOnly="true">
                    </dx:ASPxMemo>
                </td>

            </tr>
            <tr>
                <td style="width: 13%" class="auto-style2">&nbsp;</td>

                <td style="width: 20%">&nbsp;</td>

                <td style="width: 13%" class="auto-style2">&nbsp;</td>

                <td style="width: 20%">&nbsp;</td>

                <td style="width: 13%" class="auto-style2">&nbsp;</td>

                <td style="width: 20%">&nbsp;</td>
            </tr>
        </table>
        <dx:ASPxPageControl ID="cpInfoBasica" ClientInstanceName="cpInfoBasica" runat="server" ActiveTabIndex="3" EnableTheming="True" Theme="Material" Width="100%" ActiveTabStyle-Wrap="True" TabStyle-Wrap="True">
            <TabPages>
                <dx:TabPage Text="UBICACIÓN DE LA OBRA" Name="1">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                <tr>
                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">Municipio</label>
                                    </td>
                                    <td style="width: 20%">
                                        <dx:ASPxComboBox ID="cmbMunicipio" ClientInstanceName="cmbMunicipio" runat="server" Theme="Material" Width="100%" TextField="StMunicipio" ValueField="IdMunicipio" ValueType="System.Int32" ReadOnly="true">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) { LoadingPanel.Show();  cmbLocalidad.PerformCallback(); cmbCodigoPostal.PerformCallback(); }" />
                                        </dx:ASPxComboBox>

                                    </td>

                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">Localidad</label>
                                    </td>

                                    <td style="width: 20%">

                                        <dx:ASPxComboBox ID="cmbLocalidad" ClientInstanceName="cmbLocalidad" runat="server" Theme="Material" Width="100%" TextField="StLocalidad" ValueField="IdLocalidad" ValueType="System.Int32" OnCallback="cmbLocalidad_Callback" ReadOnly="true">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {OtraLocalidad();}" EndCallback="function(s, e) {
	                                            LoadingPanel.Hide();
                                                }" />
                                        </dx:ASPxComboBox>

                                    </td>

                                    <td class="auto-style3">
                                        <dx:ASPxLabel ID="lblOtroLocalidad" ClientInstanceName="lblOtroLocalidad" ClientVisible="false" runat="server" Text="Nombre de la localidad" Font-Bold="True"></dx:ASPxLabel>
                                    </td>

                                    <td style="width: 20%">

                                        <dx:ASPxTextBox ID="txtOtraLocalidad" ClientInstanceName="txtOtraLocalidad" runat="server" Theme="Material" Width="100%" ClientVisible="false" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right">
                                        <dx:ASPxLabel ID="lblLinkDof" ClientInstanceName="lblLinkDof" ClientVisible="false" runat="server" Text="Link del DOF" Font-Bold="True">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td class="auto-style7">
                                        <dx:ASPxCallbackPanel ID="cp_otraLocalidad" ClientInstanceName="cp_otraLocalidad" ClientVisible="false" runat="server" Theme="Material" Width="100%">
                                            <PanelCollection>
                                                <dx:PanelContent runat="server">
                                                    <dx:ASPxTextBox ID="txtLiga" ClientInstanceName="txtLiga" runat="server" Theme="Material" Width="100%" ReadOnly="true">
                                                    </dx:ASPxTextBox>
                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>
                                    </td>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Código postal</label>

                                    </td>
                                    <td class="auto-style7">
                                        <dx:ASPxComboBox ID="cmbCodigoPostal" ClientInstanceName="cmbCodigoPostal" runat="server" Theme="Material" Width="100%" TextField="CpYasentamiento" ValueField="IdCP" ValueType="System.Int32" OnCallback="cmbCodigoPostal_Callback" ReadOnly="true">
                                        </dx:ASPxComboBox>
                                    </td>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Colonia</label></td>
                                    <td class="auto-style7">
                                        <dx:ASPxTextBox ID="txtColonia" ClientInstanceName="txtColonia" runat="server" Theme="Material" Width="100%" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Calle</label>
                                    </td>
                                    <td class="auto-style7">
                                        <dx:ASPxTextBox ID="txtCalle" ClientInstanceName="txtCalle" runat="server" Theme="Material" Width="100%" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Número exterior</label>
                                    </td>
                                    <td class="auto-style7">
                                        <%--  <dx:ASPxTextBox ID="txtNumExt" ClientInstanceName="txtNumExt" runat="server" Theme="Material" Width="100%" MaxLength="5">
                                        </dx:ASPxTextBox>--%>

                                        <dx:ASPxSpinEdit ID="txtNumExt" runat="server" ClientInstanceName="txtNumExt" NumberType="Integer" AllowMouseWheel="false" Width="100%" Theme="Material" HorizontalAlign="Center" SpinButtons-ClientVisible="false" SpinButtons-ShowIncrementButtons="false" NullText="0" MinValue="0" ReadOnly="true">
                                            <%--<ClientSideEvents KeyPress="function(s, e) {SoloNumeros(event);}" />--%>
                                            <SpinButtons ShowIncrementButtons="False" ClientVisible="False"></SpinButtons>
                                        </dx:ASPxSpinEdit>
                                    </td>
                                    <td class="text-right"></td>
                                    <td class="auto-style7"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                    <td style="width: 20%">&nbsp;</td>
                                    <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                    <td style="width: 20%">&nbsp;</td>
                                    <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                    <td style="width: 20%">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Calle 1
                                        </label>
                                    </td>
                                    <td class="auto-style7">
                                        <dx:ASPxTextBox ID="txtCalle1" ClientInstanceName="txtCalle1" runat="server" Theme="Material" Width="100%" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Calle 2
                                        </label>
                                    </td>
                                    <td class="auto-style7">
                                        <dx:ASPxTextBox ID="txtCalle2" ClientInstanceName="txtCalle2" runat="server" Theme="Material" Width="100%" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Calle 3
                                        </label>
                                    </td>
                                    <td class="auto-style7">
                                        <dx:ASPxTextBox ID="txtCalle3" ClientInstanceName="txtCalle3" runat="server" Theme="Material" Width="100%" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="width: 13%">
                                        <label class="control-label" for="middle-name">
                                            Calle 4
                                        </label>
                                    </td>
                                    <td style="width: 20%">
                                        <dx:ASPxTextBox ID="txtCalle4" ClientInstanceName="txtCalle4" runat="server" Theme="Material" Width="100%" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="auto-style2" style="width: 13%">
                                        <label class="control-label" for="middle-name">
                                            Indique una referencia
                                        </label>
                                    </td>
                                    <td colspan="3">
                                        <dx:ASPxMemo ID="txtComentarioUbicacion" ClientInstanceName="txtComentarioUbicacion" runat="server" Height="71px" Theme="Material" Width="99%" MaxLength="255" ReadOnly="true">
                                        </dx:ASPxMemo>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                    <td style="width: 20%">&nbsp;</td>
                                    <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                    <td style="width: 20%">
                                        &nbsp;</td>
                                    <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                    <td style="width: 20%">&nbsp;</td>
                                </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="TIPO DE PROYECTO">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

                            <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                <tr>
                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">
                                            Tipo de proyecto</label></td>

                                    <td style="width: 20%">
                                        <dx:ASPxComboBox ID="cmbTipoProyecto" ClientInstanceName="cmbTipoProyecto" TextField="NomProyecto" ValueField="IdTipoProyecto" runat="server" Theme="Material" ValueType="System.String" Width="98%" ReadOnly="true">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) { LoadingPanel.Show(); cmbTipoObra.PerformCallback(); cmbAccion.PerformCallback();}" />
                                        </dx:ASPxComboBox>
                                    </td>

                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">
                                            Tipo de obra</label></td>

                                    <td style="width: 20%">
                                        <dx:ASPxComboBox ID="cmbTipoObra" ClientInstanceName="cmbTipoObra" runat="server" Theme="Material" TextField="TipodeObra" ValueField="IdDeObraYidProyectoAnterior" Width="98%" OnCallback="cmbTipoObra_Callback" ReadOnly="true">
                                            <ClientSideEvents EndCallback="function(s, e) {LoadingPanel.Hide();}" SelectedIndexChanged="function(s, e) {cmbUnidadMedida.PerformCallback();cbpDocumentos.PerformCallback();}" />
                                        </dx:ASPxComboBox>
                                    </td>

                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name" tabindex="width: 10%">
                                            Tipo de acción</label></td>

                                    <td style="width: 20%">

                                        <dx:ASPxComboBox ID="cmbAccion" ClientInstanceName="cmbAccion" runat="server" Theme="Material" Width="98%" TextField="Accion" ValueField="IdTipodeAccion" OnCallback="cmbAccion_Callback" ReadOnly="true">
                                        </dx:ASPxComboBox>
                                    </td>
                                </tr>
                                <tr>
                                        <td class="text-right" style="width: 13%">
                                            <label class="control-label" for="middle-name">
                                            Situación de la Obra</label></td>
                                        <td style="width: 20%">
                                            <dx:ASPxComboBox ID="cmbSituacionObra" runat="server" ClientInstanceName="cmbSituacionObra" Theme="Material" Width="98%"  ReadOnly="true">
                                                <Items>
                                                    <dx:ListEditItem Text="C-CONTINUACION" Value="C-CONTINUACION" />
                                                    <dx:ListEditItem Text="I-INICIO" Value="I-INICIO" />
                                                    <dx:ListEditItem Text="IT-INICIO TERMINO" Value="IT-INICIO TERMINO" />
                                                    <dx:ListEditItem Text="T-TERMINO" Value="T-TERMINO" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                        </td>
                                        <td class="auto-style2" style="width: 13%; text-align: right;">&nbsp;</td>
                                        <td style="width: 20%">&nbsp;</td>
                                        <td class="auto-style2" style="width: 13%; text-align: right;">&nbsp;</td>
                                        <td style="width: 20%">&nbsp;</td>
                                    </tr>
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="GEOREFERENCIA">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxLabel ID="ASPxLabel8" runat="server" Text="Nota: Evidencia fotográfica del centro de la obra. *Las fotográfias deberá estar georeferenciada." Font-Size="8pt" ForeColor="Red">
                            </dx:ASPxLabel>
                            <br />
                            <p class="note">
                                
                            </p>
                            <dx:ASPxUploadControl ID="upcFotos" runat="server" ClientInstanceName="upcFotos" Width="50%"
                                NullText="Seleccione mínimo tres archivos..." UploadMode="Advanced" ShowUploadButton="True" ShowProgressPanel="True"
                                OnFileUploadComplete="upcFotos_FileUploadComplete" Theme="Material" ClientEnabled="False" ClientVisible="False">
                                <AdvancedModeSettings EnableMultiSelect="True" EnableFileList="True" EnableDragAndDrop="True" />
                                <ValidationSettings MaxFileSize="10194304" AllowedFileExtensions=".jpg,.jpeg,.png">
                                </ValidationSettings>
                                <ClientSideEvents FilesUploadStart="function(s, e) {  }"
                                    FileUploadComplete="onFileUploadCompleteFotos" />
                            </dx:ASPxUploadControl>
                            <br />
                            <dx:ASPxGridView ID="gvPuntos" ClientInstanceName="gvPuntos" KeyFieldName="Id" runat="server" AutoGenerateColumns="False" EnableTheming="True" Theme="Material" Width="100%" OnDataBinding="gvPuntos_DataBinding" OnCustomCallback="gvPuntos_CustomCallback">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Id" ShowInCustomizationForm="True" VisibleIndex="0" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DESCRIPCIÓN" FieldName="Descripcion" ShowInCustomizationForm="True" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="LATITUD" FieldName="Latitud" ShowInCustomizationForm="True" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="LONGITUD" FieldName="Longitud" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                            <br />
                            <dx:ASPxCallbackPanel ID="cbpFotosGeoreferenciadas" ClientInstanceName="cbpFotosGeoreferenciadas" runat="server" OnCallback="cbpFotosGeoreferenciadas_Callback" Width="100%">
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <dx:ASPxImageSlider ID="imgSliderGeoreferencia" runat="server" Width="100%" Theme="Material">
                                            <SettingsImageArea AnimationType="Slide" />
                                            <SettingsAutoGeneratedImages ImageCacheFolder="~/Thumb/" />
                                        </dx:ASPxImageSlider>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                            <br />
                            <div id="divMap" style="width: 100%; height: 450px; margin: 0 auto; border: 1px solid #000000; text-align: center"></div>
                            <br />
                           

                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="RESPONSABLE DE PROYECTO">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxCallbackPanel ID="cbpBuscarProyectista" ClientInstanceName="cbpBuscarProyectista" runat="server" Width="100%" OnCallback="cbpBuscarProyectista_Callback">
                                <ClientSideEvents EndCallback="function(s, e) { LoadingPanel.Hide();}" />
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                            <tr>
                                                <td class="text-center" colspan="6" style="background-color: #000000">
                                                    <label class="control-label" for="middle-name">
                                                        <span class="fa-inverse">PROYECTISTA</span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 13%" class="auto-style2">Cédula profesional</td>
                                                <td style="width: 20%">
                                                    <dx:ASPxSpinEdit ID="txtCedulaProyectista" runat="server" ClientInstanceName="txtCedula" HorizontalAlign="Right" MaxValue="99999999999999999999" MinValue="1" NullText="0" NumberType="Integer" Theme="Material" Width="98%">
                                                        <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                        </SpinButtons>
                                                        <ClientSideEvents ValueChanged="sumarPersonas" />
                                                    </dx:ASPxSpinEdit>
                                                </td>
                                                <td style="width: 13%" class="text-right">
                                                    <dx:ASPxButton ID="btnBuscarProyectista" runat="server" AutoPostBack="False" Text="Buscar" Theme="Material" Visible="false">
                                                        <ClientSideEvents Click="function(s, e) { LoadingPanel.Show(); cbpBuscarProyectista.PerformCallback();}" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxLabel ID="lblProyectista" runat="server" Font-Italic="True">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2" style="width: 13%">Proyectista</td>
                                                <td style="width: 20%">
                                                    <dx:ASPxTextBox ID="txtProyectista" runat="server" ReadOnly="true" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td class="auto-style2" style="width: 13%">Correo</td>
                                                <td style="width: 20%">
                                                    <dx:ASPxTextBox ID="txtCorreoProyectista" runat="server" ReadOnly="true" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td class="auto-style2" style="width: 13%">Teléfono</td>
                                                <td style="width: 20%">
                                                    <dx:ASPxTextBox ID="txtTelefonoProyectista" runat="server" ReadOnly="true" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>

                            <dx:ASPxCallbackPanel ID="cbpDRO" ClientInstanceName="cbpDRO" runat="server" Width="100%" OnCallback="cbpDRO_Callback">
                                <ClientSideEvents EndCallback="function(s, e) { LoadingPanel.Hide();}" />
                                <PanelCollection>
                                    <dx:PanelContent>
                                        <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                            <tr>
                                                <td class="text-center" colspan="6" style="background-color: #000000">
                                                    <label class="control-label" for="middle-name">
                                                        <span class="fa-inverse">DIRECTOR RESPONSABLE DE OBRA</span>
                                                    </label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2" style="width: 13%">No. de registro SINFRA	</td>
                                                <td style="width: 20%">
                                                    <dx:ASPxTextBox ID="txtNumRegistroSinfra" runat="server" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td style="width: 13%" class="text-right">
                                                    <dx:ASPxButton ID="btnBuscarDRO" runat="server" AutoPostBack="False" Text="Buscar" Theme="Material" Visible="false">
                                                    </dx:ASPxButton>
                                                </td>
                                                <td colspan="3">
                                                    <dx:ASPxLabel ID="lblDro" runat="server" Font-Italic="True">
                                                    </dx:ASPxLabel>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 13%" class="auto-style2">Clasificación</td>

                                                <td style="width: 20%">
                                                    <dx:ASPxTextBox ID="txtclasificacion" ReadOnly="true" runat="server" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>

                                                <td class="auto-style2" style="width: 13%">Profesión</td>

                                                <td class="auto-style5">
                                                    <dx:ASPxTextBox ID="txtProfesion" runat="server" ReadOnly="true" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>

                                                <td class="auto-style8">Cédula profesional</td>

                                                <td class="auto-style7">
                                                    <dx:ASPxTextBox ID="txtCedulaDRO" ReadOnly="true" runat="server" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 13%" class="auto-style2">Nombre</td>
                                                <td style="width: 20%">
                                                    <dx:ASPxTextBox ID="txtNombreDRO" runat="server" ReadOnly="true" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td class="auto-style2" style="width: 13%">Correo</td>
                                                <td class="auto-style5">
                                                    <dx:ASPxTextBox ID="txtCorreoDRO" runat="server" ReadOnly="true" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>
                                                </td>
                                                <td class="auto-style8">Teléfono</td>
                                                <td class="auto-style7">
                                                    <dx:ASPxTextBox ID="txtTelenofoDRO" runat="server" ReadOnly="true" Theme="Material" Width="100%">
                                                    </dx:ASPxTextBox>

                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                           <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                            <tr>
                                                  <td style="width: 13%" class="auto-style2">
                                                    ESTADO
                                                </td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <tr>
                                               <td style="width: 13%" class="auto-style2">COMENTARIO</td>
                                                <td>
                                                    <dx:ASPxMemo ID="txtComentarioDRO" runat="server" Height="71px" Width="100%"></dx:ASPxMemo>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        <br />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <dx:ASPxButton ID="ASPxButton4" runat="server" Text="RECHAZAR" AutoPostBack="false" Theme="Material">
                                            <ClientSideEvents Click="function(s, e) {  cbGuardarDRO.PerformCallback('RECHAZADO');}" />
                                        </dx:ASPxButton>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <dx:ASPxButton ID="btnVincular" AutoPostBack="false" runat="server" Text="VICULAR MIS DATOS" Theme="Material">
                                             <ClientSideEvents Click="function(s, e) {  cbGuardarDRO.PerformCallback('CONFIRMADO');}" />
                                        </dx:ASPxButton>
                                        <br />
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>


                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="DOCUMENTACIÓN">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

                            <%--<dx:ASPxCallbackPanel ID="cptipoProyecto" runat="server" Width="100%" Theme="Material" SettingsLoadingPanel-ShowImage="true" ClientInstanceName="cptipoProyecto" OnCallback="cptipoProyecto_Callback">--%>
                            <dx:ASPxCallbackPanel ID="cbpDocumentos" ClientInstanceName="cbpDocumentos" runat="server" Width="100%" OnCallback="cbpDocumentos_Callback">
                                <PanelCollection>
                                    <dx:PanelContent>

                                        <%--<p class="note">
                                            <dx:ASPxLabel ID="lblExtensionesDocumentos" runat="server" Text="Suba un único archivo por documento. Se admite PDF, Excel, AutoCad o ZIP para cuando necesite subir más de uno." Font-Size="8pt">
                                            </dx:ASPxLabel>
                                            <br />
                                            <dx:ASPxLabel ID="lblTamanioMaximoDocumento" runat="server" Text="Tamaño máximo por archivo: 10 MB." Font-Size="8pt">
                                            </dx:ASPxLabel>
                                            <br />
                                            <dx:ASPxLabel ID="lblGuardadoAutomatico" runat="server" Text="Su documentación se irá guardando conforme vaya subiendo los archivos." Font-Size="8pt">
                                            </dx:ASPxLabel>
                                        </p>--%>

                                        <%--<dx:ASPxPageControl ID="integ" ClientInstanceName="integ" runat="server" ActiveTabIndex="1" TabAlign="Justify" Theme="Material" Width="100%" AutoPostBack="false">--%>
                                        <dx:ASPxPageControl ID="pcDocumentacion" ClientInstanceName="pcDocumentacion" runat="server" EnableTheming="True" Theme="Material" Width="100%" ActiveTabStyle-Wrap="True" TabStyle-Wrap="True" ActiveTabIndex="1">
                                            <TabPages>

                                                <dx:TabPage Text="Documentación Social">
                                                    <ContentCollection>
                                                        <dx:ContentControl>

                                                            <%-- CALL GUARDAR LOS DOC SOCIALES  --%>


                                                            <dx:ASPxGridView ID="gvDocsSociales" ClientInstanceName="gvDocsSociales" runat="server"
                                                                KeyFieldName="IdCatIntegracion" OnDataBinding="gvDocsSociales_DataBinding"
                                                                OnCustomCallback="gvDocsSociales_CustomCallback"
                                                                OnCustomButtonInitialize="gvDocsSociales_CustomButtonInitialize"
                                                                OnHtmlRowPrepared="gvDocsSociales_HtmlRowPrepared" OnHtmlDataCellPrepared="gvDocsSociales_HtmlDataCellPrepared"
                                                                Settings-VerticalScrollBarMode="Visible" AutoGenerateColumns="false" Width="100%" Theme="Material">

                                                                <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" HorizontalScrollBarMode="Auto"></Settings>
                                                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

                                                                <ClientSideEvents CustomButtonClick="OnCustomButtonClickDoc"
                                                                    RowClick="function(s,e) { cbRowClickgvDocsSociales.PerformCallback(e.visibleIndex); }" />


                                                                <SettingsCommandButton>
                                                                    <UpdateButton>
                                                                        <Styles>
                                                                            <Style CssClass="invisible" Wrap="False"></Style>
                                                                        </Styles>
                                                                    </UpdateButton>

                                                                    <CancelButton>
                                                                        <Styles>
                                                                            <Style CssClass="invisible" Wrap="False"></Style>
                                                                        </Styles>
                                                                    </CancelButton>
                                                                </SettingsCommandButton>

                                                                <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                                    <Summary Text="page {0} of {1} ({2} items)" />
                                                                </SettingsPager>

                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="#" FieldName="IdCatIntegracion" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" Width="0px" Visible="false">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataCheckColumn FieldName="IsDoc" Caption="*" ReadOnly="true" Width="30px" VisibleIndex="1" Visible="False">
                                                                    </dx:GridViewDataCheckColumn>

                                                                    <dx:GridViewCommandColumn VisibleIndex="2" Caption="..." Width="0px" HeaderStyle-CssClass="txt-center">
                                                                        <CustomButtons>
                                                                            <dx:GridViewCommandColumnCustomButton ID="verDocSocial" Text="Ver" Visibility="Invisible">
                                                                            </dx:GridViewCommandColumnCustomButton>
                                                                            <dx:GridViewCommandColumnCustomButton ID="subirDocSocial" Text="Subir" Visibility="Invisible"></dx:GridViewCommandColumnCustomButton>
                                                                        </CustomButtons>

                                                                        <HeaderStyle CssClass="txt-center"></HeaderStyle>
                                                                    </dx:GridViewCommandColumn>

                                                                    <dx:GridViewDataTextColumn Caption="Documento" FieldName="Documento" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="30%">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn Caption="Archivo" FieldName="Archivo" ShowInCustomizationForm="True" VisibleIndex="4" Width="20%">
                                                                        <EditItemTemplate></EditItemTemplate>
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn Caption="Estatus" FieldName="StDetalleRevisionSocial" ShowInCustomizationForm="True" VisibleIndex="5" ReadOnly="true" Width="16%">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn Caption="Descripcion" FieldName="Descripcion" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn Caption="Observaciones Sociales" FieldName="Observacion" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="22%" EditFormSettings-Visible="False">
                                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn FieldName="PdfFormato" Caption="PdfFormato" Visible="False" VisibleIndex="8">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="StObservacionTecnica" Caption="Estado Técnico" VisibleIndex="8" Width="13%">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn FieldName="ObservacionTecnica" Caption="Observacion Técnica" VisibleIndex="9" Width="22%">
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>

                                                                <Styles>
                                                                    <Header CssClass="grid-head"></Header>
                                                                    <Cell CssClass="grid-cell"></Cell>
                                                                    <StatusBar CssClass="oculto"></StatusBar>
                                                                </Styles>
                                                            </dx:ASPxGridView>


                                                            <table class="w100 mtop10">
                                                                <tr>
                                                                    <td class="w70">
                                                                        <%-- <span class="box-lbl mright5 bg-gris_">Enviado a revisión</span>--%>
                                                                        Claves:
                                                                        <span class="box-lbl mright5 bg-amarillo">En revisión</span>
                                                                        <span class="box-lbl mright5 bg-verde">Aceptado</span>
                                                                        <span class="box-lbl mright5 bg-rojo">Observado</span>
                                                                        <span class="box-lbl bg-azul">Solventado(Para revisión)</span>
                                                                    </td>
                                                                    <td class="w30 txt-right">
                                                                        <dx:ASPxLabel CssClass="color-app b" ID="lblFechaAgendada" runat="server" Text=""></dx:ASPxLabel>
                                                                    </td>
                                                                </tr>
                                                            </table>


                                                            <dx:ASPxCallback ID="cbGuardarSociales" ClientInstanceName="cbGuardarSociales" runat="server" OnCallback="cbGuardarSociales_Callback">
                                                                <ClientSideEvents CallbackComplete="onCallbackCompleteCb_GuardarSociales" />
                                                            </dx:ASPxCallback>
                                                            <dx:ASPxCallback ID="cbEnviarIntegracionSocial" ClientInstanceName="cbEnviarIntegracionSocial" runat="server" OnCallback="cbEnviarIntegracionSocial_Callback">
                                                                <ClientSideEvents CallbackComplete="onCallbackCompletecbEnviarIntegracionSocial" />
                                                            </dx:ASPxCallback>


                                                            <dx:ASPxCallbackPanel ID="cpBotonesDocSociales" ClientInstanceName="cpBotonesDocSociales" runat="server" CssClass="w100 mtop20 txt-center">
                                                                <PanelCollection>
                                                                    <dx:PanelContent>
                                                                       
                                                                    </dx:PanelContent>
                                                                </PanelCollection>
                                                            </dx:ASPxCallbackPanel>




                                                        </dx:ContentControl>
                                                    </ContentCollection>

                                                </dx:TabPage>

                                                <dx:TabPage Text="Documentación Técnica" Name="docs1">
                                                    <ContentCollection>
                                                        <dx:ContentControl runat="server">

                                                            <%-- cpValidacionDoc       --%>

                                                            <dx:ASPxGridView ID="gvDocsTecnicos" ClientInstanceName="gvDocsTecnicos" runat="server"
                                                                KeyFieldName="IdCatIntegracion" OnDataBinding="gvDocsTecnicos_DataBinding"
                                                                OnCustomCallback="gvDocsTecnicos_CustomCallback"
                                                                OnCustomButtonInitialize="gvDocsTecnicos_CustomButtonInitialize"
                                                                OnHtmlRowPrepared="gvDocsTecnicos_HtmlRowPrepared" OnHtmlDataCellPrepared="gvDocsTecnicos_HtmlDataCellPrepared"
                                                                Settings-VerticalScrollBarMode="Visible" AutoGenerateColumns="false" Width="100%" Theme="Material">

                                                                <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="400" HorizontalScrollBarMode="Auto"></Settings>
                                                                <SettingsDataSecurity AllowDelete="False" AllowInsert="False" />

                                                                <ClientSideEvents CustomButtonClick="OnCustomButtonClickDoc"
                                                                    RowClick="function(s,e) { cbRowClickgvDocsTecnicos.PerformCallback(e.visibleIndex); }" />


                                                                <SettingsCommandButton>
                                                                    <UpdateButton>
                                                                        <Styles>
                                                                            <Style CssClass="invisible" Wrap="False"></Style>
                                                                        </Styles>
                                                                    </UpdateButton>

                                                                    <CancelButton>
                                                                        <Styles>
                                                                            <Style CssClass="invisible" Wrap="False"></Style>
                                                                        </Styles>
                                                                    </CancelButton>
                                                                </SettingsCommandButton>

                                                                <SettingsPager Visible="False" Mode="ShowAllRecords">
                                                                    <Summary Text="page {0} of {1} ({2} items)" />
                                                                </SettingsPager>

                                                                <Columns>
                                                                    <dx:GridViewDataCheckColumn FieldName="IsDoc" Caption="*" ReadOnly="true" Width="30px" VisibleIndex="2" Visible="False">
                                                                    </dx:GridViewDataCheckColumn>

                                                                    <dx:GridViewCommandColumn VisibleIndex="3" Caption="..." Width="0px" HeaderStyle-CssClass="txt-center">
                                                                        <CustomButtons>
                                                                            <dx:GridViewCommandColumnCustomButton ID="verDocTecnico" Text="Ver" Visibility="Invisible">
                                                                            </dx:GridViewCommandColumnCustomButton>
                                                                            <dx:GridViewCommandColumnCustomButton ID="subirDocTecnico" Text="Subir" Visibility="Invisible"></dx:GridViewCommandColumnCustomButton>
                                                                            <dx:GridViewCommandColumnCustomButton ID="btnNoAplica" Text="No aplica" Visibility="Invisible"></dx:GridViewCommandColumnCustomButton>
                                                                        </CustomButtons>

                                                                        <HeaderStyle CssClass="txt-center"></HeaderStyle>
                                                                    </dx:GridViewCommandColumn>

                                                                    <dx:GridViewDataTextColumn Caption="Documento" FieldName="NomDocumento" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Width="35%">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn Caption="Archivo" FieldName="ArchivoPdf" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                                        <EditItemTemplate></EditItemTemplate>
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn FieldName="Revisor" Caption="Revisor" VisibleIndex="6" Visible="false">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn VisibleIndex="7" Caption="Estado" FieldName="StDetalleRevisionTecnica">
                                                                        <EditFormSettings Visible="True"></EditFormSettings>
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn FieldName="ObsRevision" Caption="Observaciones" VisibleIndex="8" Width="25%">
                                                                    </dx:GridViewDataTextColumn>

                                                                    <dx:GridViewDataTextColumn Caption="descDocumento" FieldName="DescDocumento" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9" EditFormSettings-Visible="False">
                                                                        <EditFormSettings Visible="False"></EditFormSettings>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>

                                                                <Styles>
                                                                    <Header CssClass="grid-head"></Header>
                                                                    <Cell CssClass="grid-cell"></Cell>
                                                                    <StatusBar CssClass="oculto"></StatusBar>
                                                                </Styles>
                                                            </dx:ASPxGridView>

                                                            <table class="w100 mtop10">
                                                                <tr>
                                                                    <td class="w70">
                                                                        <%--<span class="box-lbl mright5 bg-gris_">Enviado a revisión</span>--%>
                                                                        Claves:
                                                                        <span class="box-lbl mright5 bg-amarillo">En revisión</span>
                                                                        <span class="box-lbl mright5 bg-verde">Aceptado</span>
                                                                        <span class="box-lbl mright5 bg-rojo">Observado</span>
                                                                        <span class="box-lbl bg-azul">Solventado(Para revisión)</span>
                                                                    </td>
                                                                    <td class="w30 txt-right">
                                                                        <dx:ASPxLabel CssClass="color-app b" ID="ASPxLabel1" runat="server" Text=""></dx:ASPxLabel>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                            <dx:ASPxCallback ID="cbGuardarIntegracionTecnica" runat="server" ClientInstanceName="cbGuardarIntegracionTecnica" OnCallback="cbGuardarIntegracionTecnica_Callback">
                                                                <ClientSideEvents CallbackComplete="onCallbackCompleteCb_GuardarTecnicos" />
                                                            </dx:ASPxCallback>

                                                            <dx:ASPxCallback ID="cbEnviarIntegracionTecnica" runat="server" ClientInstanceName="cbEnviarIntegracionTecnica" OnCallback="cbEnviarIntegracionTecnica_Callback">
                                                                <ClientSideEvents CallbackComplete="onCallbackCompleteCbEnviarIntegracionTecnica" />
                                                            </dx:ASPxCallback>

                                                            <dx:ASPxCallbackPanel ID="cbGuardarTecnicos" runat="server" Width="100%" ClientInstanceName="cbGuardarTecnicos" CssClass="w100 mtop20 txt-center">
                                                                <PanelCollection>
                                                                    <dx:PanelContent ID="PanelContent3" runat="server">
                                                                       
                                                                    </dx:PanelContent>
                                                                </PanelCollection>
                                                            </dx:ASPxCallbackPanel>
                                                            <br />




                                                            <dx:ASPxCallback ID="cbFinalizarIntegracionDocumentacion" runat="server" ClientInstanceName="cbFinalizarIntegracionDocumentacion" OnCallback="cbFinalizarIntegracionDocumentacion_Callback">
                                                                <ClientSideEvents CallbackComplete="onCallbackCompleteCbFinalizarIntegracionDocumentacion" />
                                                            </dx:ASPxCallback>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>


                                                <dx:TabPage Text="ENVIAR A REVISIÓN" ClientVisible="false">
                                                    <ContentCollection>
                                                        <dx:ContentControl>


                                                            <%-- Finalizar Integracion --%>

                                                            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="cbGuardarTecnicos" CssClass="w100 mtop20 txt-center">
                                                                <PanelCollection>
                                                                    <dx:PanelContent ID="PanelContent1" runat="server">
                                                                       

                                                                    </dx:PanelContent>
                                                                </PanelCollection>
                                                            </dx:ASPxCallbackPanel>
                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>

                                            </TabPages>

                                            <ActiveTabStyle Wrap="True"></ActiveTabStyle>

                                            <TabStyle Wrap="True"></TabStyle>
                                        </dx:ASPxPageControl>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>

                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="INFORMACIÓN TÉCNICA BÁSICA">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

                            <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                <tr>
                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">
                                            Unidad de medida</label></td>

                                    <td style="width: 20%">
                                        <dx:ASPxComboBox ID="cmbUnidadMedida" ClientInstanceName="cmbUnidadMedida" runat="server" Theme="Material" TextField="StUnidaMedida" ValueField="IdUnidad" ValueType="System.Int32" Width="98%" OnCallback="cmbUnidadMedida_Callback" ReadOnly="true">
                                        </dx:ASPxComboBox>
                                    </td>

                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">
                                            Meta</label></td>

                                    <td style="width: 20%">
                                        <dx:ASPxSpinEdit ID="txtMeta" ClientInstanceName="txtMeta" runat="server" MinValue="0.1" MaxValue="99999999999" NullText="0" Theme="Material" Width="98%" HorizontalAlign="Right" ReadOnly="true">
                                            <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                            </SpinButtons>
                                        </dx:ASPxSpinEdit>
                                    </td>

                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">
                                            Importe del presupuesto</label></td>

                                    <td class="w_20">

                                        <dx:ASPxSpinEdit ID="txtImportePresupuesto" ClientInstanceName="txtImportePresupuesto" runat="server" Theme="Material" Width="98%" HorizontalAlign="Right" DisplayFormatString="C2" NullText="0" ReadOnly="true">
                                            <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                            </SpinButtons>
                                        </dx:ASPxSpinEdit>
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                <tr>
                                    <td style="width: 13%">
                                        <label class="control-label" for="middle-name">
                                            Problemática actual</label></td>

                                    <td style="width: 82%">
                                        <dx:ASPxMemo ID="txtdescripcionCedula" ClientInstanceName="txtdescripcionCedula" runat="server" Height="120px" Theme="Material" Width="99%" ReadOnly="true">
                                        </dx:ASPxMemo>
                                    </td>

                                    <td style="width: 5%">
                                        <dx:ASPxImage ID="ASPxImage1" runat="server" ImageUrl="~/iconos/help.png" ShowLoadingImage="True" Width="30px">
                                            <ClientSideEvents Click="function(s, e) {
	p_1(s,e);
}" />
                                        </dx:ASPxImage>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="width: 13%">
                                        <label class="control-label" for="middle-name">
                                            Solución a la situación actual</label></td>

                                    <td style="width: 82%">
                                        <dx:ASPxMemo ID="txtSolucion" ClientInstanceName="txtSolucion" runat="server" Height="120px" Theme="Material" Width="99%" ReadOnly="true">
                                        </dx:ASPxMemo>
                                    </td>
                                    <td style="width: 5%">
                                        <dx:ASPxImage ID="ASPxImage2" runat="server" ImageUrl="~/iconos/help.png" ShowLoadingImage="True" Width="30px">
                                            <ClientSideEvents Click="function(s, e) {
	p_2(s,e);
}" />
                                        </dx:ASPxImage>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="text-right">
                                        <label class="control-label" for="middle-name">
                                            Descripción técnica simplificada</label></td>

                                    <td style="width: 82%">
                                        <dx:ASPxMemo ID="txtDecripcionTecnica" ClientInstanceName="txtDecripcionTecnica" runat="server" Height="120px" Theme="Material" Width="99%" ReadOnly="true">
                                        </dx:ASPxMemo>
                                    </td>

                                    <td style="width: 5%">
                                        <dx:ASPxImage ID="imgDesctecnica" runat="server" ImageUrl="~/iconos/help.png" ShowLoadingImage="True" Width="30px">
                                            <ClientSideEvents Click="function(s, e) {
	problematica(s,e);
}" />
                                        </dx:ASPxImage>
                                    </td>

                                </tr>


                            </table>
                            <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">


                                <tr>
                                    <td class="auto-style10" colspan="6" style="background-color: #000000">
                                        <label class="control-label" for="middle-name">
                                            <span class="fa-inverse">BENEFICIARIOS DIRECTOS</span>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 13%" class="auto-style2">Tipo de beneficiario</td>
                                    <td style="width: 20%">
                                        <dx:ASPxComboBox ID="cmbTipoBeneficiario" runat="server" ClientInstanceName="cmbTipoBeneficiario" SelectedIndex="0" Theme="Material" Width="98%" ReadOnly="true">
                                            <Items>
                                                <dx:ListEditItem Selected="True" Text="POBLACIÓN GENERAL" Value="POBLACIÓN GENERAL" />
                                                <dx:ListEditItem Text="NÑOS" Value="NÑOS" />
                                                <dx:ListEditItem Text="JOVENES/ADOLECENTES" Value="JOVENES/ADOLECENTES" />
                                            </Items>
                                        </dx:ASPxComboBox>
                                    </td>

                                    <td style="width: 13%" class="text-right">
                                        &nbsp;</td>

                                    <td style="width: 20%">
                                        &nbsp;</td>

                                    <td style="width: 13%" class="text-right">
                                        &nbsp;</td>

                                    <td class="w_20">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="auto-style2" style="width: 13%">Hombres</td>
                                    <td style="width: 20%">
                                        <dx:ASPxSpinEdit ID="txtHombres" runat="server" ClientInstanceName="txtHombres" HorizontalAlign="Right" MaxValue="99999999999" MinValue="1" NullText="0" NumberType="Integer" Theme="Material" Width="98%" ReadOnly="true">
                                            <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                            </SpinButtons>
                                            <ClientSideEvents ValueChanged="sumarPersonas" />
                                        </dx:ASPxSpinEdit>
                                    </td>
                                    <td class="text-right" style="width: 13%">
                                        <label class="control-label" for="middle-name">
                                        Mujeres</label></td>
                                    <td style="width: 20%">
                                        <dx:ASPxSpinEdit ID="txtMujeres" runat="server" ClientInstanceName="txtMujeres" HorizontalAlign="Right" MaxValue="999999999" MinValue="1" NullText="0" NumberType="Integer" Theme="Material" Width="98%" ReadOnly="true">
                                            <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                            </SpinButtons>
                                            <ClientSideEvents ValueChanged="sumarPersonas" />
                                        </dx:ASPxSpinEdit>
                                    </td>
                                    <td class="text-right" style="width: 13%">
                                        <label class="control-label" for="middle-name">
                                        Total</label></td>
                                    <td class="w_20">
                                        <label class="control-label" for="middle-name">
                                        <dx:ASPxSpinEdit ID="txtTotalBeneficiarios" runat="server" ClientInstanceName="txtTotalBeneficiarios" HorizontalAlign="Right" MaxValue="99999999999" MinValue="1" NullText="0" NumberType="Integer" ReadOnly="True" Theme="Material" Width="98%">
                                            <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                            </SpinButtons>
                                        </dx:ASPxSpinEdit>
                                        </label>
                                    </td>
                                </tr>
                            </table>

                            

                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                <dx:TabPage Text="COMPONENTES" NewLine="true">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <dx:ASPxCallbackPanel ID="cbpComponentes" ClientInstanceName="cbpComponentes" runat="server" Width="100%" OnCallback="cbpComponentes_Callback" OnCustomJSProperties="cbpComponentes_CustomJSProperties">
                                <ClientSideEvents EndCallback="onEndCbComponente" />
                                <PanelCollection>
                                    <dx:PanelContent runat="server">
                                        <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                            <tr>
                                                <td style="width: 13%" class="auto-style2">Componente
                                                </td>
                                                <td colspan="3">&nbsp;<dx:ASPxMemo ID="txtComponente" runat="server" ClientInstanceName="txtComponente" Height="80px" MaxLength="512" Width="100%" Theme="Material">
                                                </dx:ASPxMemo>

                                                </td>

                                                <td class="auto-style9">Unidad de Medida</td>

                                                <td style="width: 20%">

                                                    <dx:ASPxComboBox ID="cmbUnidadMedidaComponentes" runat="server" ClientInstanceName="cmbUnidadMedidaComponentes" TextField="StUnidaMedida" ValueField="IdUnidad" ValueType="System.Int32" Width="100%" Theme="Material">
                                                    </dx:ASPxComboBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2" style="width: 13%">
                                                    <label class="control-label" for="middle-name">
                                                        Cantidad
                                                    </label>
                                                </td>
                                                <td style="width: 20%">
                                                    <dx:ASPxSpinEdit ID="txtCantidadComponentes" runat="server" ClientInstanceName="txtCantidadComponentes" HorizontalAlign="Right" NullText="0" Theme="Material" Width="98%">
                                                        <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                        </SpinButtons>
                                                    </dx:ASPxSpinEdit>
                                                </td>
                                                <td class="auto-style2" style="width: 13%">
                                                    <label class="control-label" for="middle-name">
                                                        Total importe<br />
                                                        (con IVA)</label></td>
                                                <td style="width: 20%">
                                                    <dx:ASPxSpinEdit ID="txtImporteComponente" runat="server" ClientInstanceName="txtImporteComponente" DisplayFormatString="C2" HorizontalAlign="Right" NullText="0" Theme="Material" Width="98%">
                                                        <SpinButtons ClientVisible="False" Enabled="False" ShowIncrementButtons="False">
                                                        </SpinButtons>
                                                    </dx:ASPxSpinEdit>
                                                </td>
                                                <td class="auto-style3">
                                                    <label class="control-label" for="middle-name">
                                                        Aplica para meta</label></td>
                                                <td style="width: 20%">
                                                    <dx:ASPxCheckBox ID="txtAplicaMeta" runat="server" CheckState="Unchecked" ClientInstanceName="txtAplicaMeta">
                                                    </dx:ASPxCheckBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                                <td style="width: 20%">&nbsp;</td>
                                                <td class="auto-style2" style="width: 13%">&nbsp;</td>
                                                <td style="width: 20%">&nbsp;</td>
                                                <td class="auto-style3">&nbsp;</td>
                                                <td style="width: 20%">
                                                    <dx:ASPxButton ID="btnAgregarComponente" runat="server" AutoPostBack="False" ClientInstanceName="btnAgregarComponente" Text="Agregar Componente" Theme="Material" Visible="false">
                                                        <ClientSideEvents Click="function(s, e) { cbpComponentes.PerformCallback();}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                             
                                            <dx:ASPxGridView ID="gvComponentes" runat="server" AutoGenerateColumns="False"
                                                ClientInstanceName="gvComponentes" SettingsBehavior-ConfirmDelete="true"
                                                Font-Size="10pt" KeyFieldName="Orden" OnCustomCallback="gvComponentes_CustomCallback"
                                                OnDataBinding="gvComponentes_DataBinding" Theme="Material" Width="100%"
                                                OnRowDeleting="gvComponentes_RowDeleting" OnRowUpdating="gvComponentes_RowUpdating">

                                                <ClientSideEvents CustomButtonClick="function(s, e) {
	                                                OnCustomButtonClickComponentes(s,e);
                                                    }" />

                                                <Settings GridLines="Vertical" HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowFooter="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" />
                                                <SettingsBehavior AllowSelectByRowClick="True" />
                                                <SettingsText ConfirmDelete="¿Desea eliminar el componente?" />
                                                <Columns>
                                                   <dx:GridViewDataMemoColumn PropertiesMemoEdit-Height="140" Caption="Componente" FieldName="NombreComponente" ShowInCustomizationForm="True" VisibleIndex="2" Width="26%">
<PropertiesMemoEdit Height="140px"></PropertiesMemoEdit>

                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataMemoColumn>
                                                    <dx:GridViewDataComboBoxColumn Caption="Unidad" FieldName="StUnidadMedida" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                   
                                                    </dx:GridViewDataComboBoxColumn>
                                                    <%-- <dx:GridViewDataTextColumn Caption="Unidad" FieldName="StUnidadMedida" ShowInCustomizationForm="True" VisibleIndex="3" Width="10%">
                                                        <PropertiesTextEdit DisplayFormatString="f0">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>--%>
                                                    <dx:GridViewDataTextColumn Caption="Cantidad" FieldName="CantidadComponente" ShowInCustomizationForm="True" VisibleIndex="4" Width="10%">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataCheckColumn Caption="Aplica para meta" FieldName="IsSeleccionado" ShowInCustomizationForm="True" VisibleIndex="1" Width="9%">
                                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                                                    </dx:GridViewDataCheckColumn>
                                                    <dx:GridViewDataTextColumn Caption="Precio Unitario (importe sin IVA)" FieldName="PrecioUnitarioComponente" EditFormSettings-Visible="False" ShowInCustomizationForm="True" VisibleIndex="5" Width="15%">
                                                        <PropertiesTextEdit DisplayFormatString="c">
                                                        </PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>

                                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="SubTotal (importe sin IVA)" FieldName="SubtotalComponente" ShowInCustomizationForm="True" EditFormSettings-Visible="False"  VisibleIndex="6" Width="15%">
                                                        <PropertiesTextEdit DisplayFormatString="c">
                                                        </PropertiesTextEdit>

<EditFormSettings Visible="False"></EditFormSettings>

                                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Total (importe con IVA)" FieldName="TotalComponente" ShowInCustomizationForm="True" VisibleIndex="7" Width="15%">
                                                        <PropertiesTextEdit DisplayFormatString="c">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" Wrap="True" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="id" FieldName="Orden" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewCommandColumn Caption="Opciones" ShowInCustomizationForm="True" VisibleIndex="0" Width="15%">
                                                        <CustomButtons>
                                                            <dx:GridViewCommandColumnCustomButton ID="elimCompo" Text="Eliminar" Visibility="AllDataRows">
                                                            </dx:GridViewCommandColumnCustomButton>
                                                            <dx:GridViewCommandColumnCustomButton ID="editCompo" Text="Editar" Visibility="AllDataRows">
                                                            </dx:GridViewCommandColumnCustomButton>
                                                        </CustomButtons>
                                                       
                                                    </dx:GridViewCommandColumn>
                                                    <dx:GridViewDataTextColumn FieldName="IdComponente" Visible="False" ShowInCustomizationForm="True" VisibleIndex="9">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem FieldName="TotalComponente" SummaryType="Sum" />
                                                </TotalSummary>
                                                <GroupSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="c" SummaryType="Sum" ValueDisplayFormat="c" />
                                                </GroupSummary>
                                                <Styles>
                                                    <Header BackColor="#4D4C51" Border-BorderColor="White" Font-Bold="False" ForeColor="White">
                                                        <Paddings PaddingBottom="5px" PaddingTop="5px" />
                                                    </Header>
                                                    <SelectedRow BackColor="#E2F1EC" Font-Bold="True" ForeColor="Black">
                                                    </SelectedRow>
                                                    <Cell CssClass="SinFondo" Font-Size="9pt" ForeColor="Black">
                                                        <Paddings PaddingBottom="5px" PaddingTop="5px" />
                                                    </Cell>
                                                    <GroupPanel BackColor="White">
                                                    </GroupPanel>
                                                    <CommandColumn CssClass="SinFondo">
                                                    </CommandColumn>
                                                    <CommandColumnItem CssClass="SinFondo" ForeColor="#1D1D1B">
                                                    </CommandColumnItem>
                                                    <SearchPanel BackColor="White">
                                                    </SearchPanel>
                                                </Styles>
                                                <Border BorderStyle="None" />
                                            </dx:ASPxGridView>
                                        <br />

                                        <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                            <tr>
                                                <td style="width: 13%"></td>
                                                <td style="width: 20%">&nbsp;</td>
                                                <td style="width: 13%">
                                                    <dx:ASPxButton ID="btnGuardarComponentes" runat="server" Text="GUARDAR" Theme="Material" ClientEnabled="true" ClientInstanceName="btnGuardarGeoreferencias" AutoPostBack="false">
                                                        <ClientSideEvents Click="function(s, e) {cbGuardarProyecto.PerformCallback();}" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td style="width: 20%">
                                                    <dx:ASPxButton ID="ASPxButton3" runat="server" AutoPostBack="False" ClientInstanceName="btnSiguiente" Text="SIGUIENTE" Theme="Material">
                                                        <ClientSideEvents Click="function(s, e) {  cpInfoBasica.SetActiveTabIndex(4);}" />
                                                    </dx:ASPxButton>
                                                </td>
                                                <td style="width: 13%">&nbsp;</td>
                                                <td style="width: 20%">&nbsp;</td>
                                            </tr>
                                        </table>
                                    </dx:PanelContent>
                                </PanelCollection>
                            </dx:ASPxCallbackPanel>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="PRESUPUESTO FINAL">
                    <ContentCollection>
                        <dx:ContentControl runat="server"> 
                        
                            <br />
                            <dx:ASPxGridView ID="gridViewConceptos" ClientInstanceName="gridViewConceptos" runat="server" AutoGenerateColumns="False" KeyFieldName="IdConcepto" OnDataBinding="gridViewConceptos_DataBinding" OnCustomCallback="gridViewConceptos_CustomCallback" Theme="Material" Width="95%" Font-Size="9pt">
                            

                                <Styles>
                                    <Cell HorizontalAlign="Left"></Cell>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                                <Columns>
                                  
                                    <dx:GridViewDataTextColumn FieldName="IdConcepto" ShowInCustomizationForm="True" VisibleIndex="1" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PARTIDA" FieldName="NombrePartida" GroupIndex="1" >
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="CÓDIGO" FieldName="Codigo" ShowInCustomizationForm="True" VisibleIndex="3" Width="20px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CONCEPTO" FieldName="Concepto" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="UNIDAD" FieldName="Unidad" VisibleIndex="5" Width="20px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CANTIDAD" FieldName="Cantidad"  VisibleIndex="6" Width="20px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PRECIO UNITARIO" FieldName="PUnitario" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px">
                                         <PropertiesTextEdit DisplayFormatString="c">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PRECIO CON LETRA" FieldName="PrecioLetra" ShowInCustomizationForm="True" VisibleIndex="8" Width="160px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="IMPORTE" FieldName="Importe" ShowInCustomizationForm="True" VisibleIndex="9" Width="30px">
                                        <PropertiesTextEdit DisplayFormatString="c">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>


                                </Columns>
                                <TotalSummary>
                                    <dx:ASPxSummaryItem FieldName="Importe" SummaryType="Sum" DisplayFormat="Total Sin IVA: ${0:n2}" ShowInColumn="IMPORTE" />
                                </TotalSummary>
                                <GroupSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="c" SummaryType="Sum" ValueDisplayFormat="c" FieldName="Importe" />
                                </GroupSummary>



                            </dx:ASPxGridView>


                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="PAGO DE DERECHO">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
                            <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                <tr>
                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">
                                            Folio de Pago</label></td>

                                    <td style="width: 20%">
                                        <dx:ASPxTextBox ID="txtFolioPago" runat="server" Width="100%" Theme="Material" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>

                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name">
                                            Linea de Captura</label></td>

                                    <td style="width: 20%">
                                        <dx:ASPxTextBox ID="txtLineaCaptura" runat="server" Width="100%" Theme="Material" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>

                                    <td style="width: 13%" class="auto-style2">
                                        <label class="control-label" for="middle-name" tabindex="width: 10%">
                                            Estatus de pago</label></td>

                                    <td style="width: 20%">
                                        <dx:ASPxTextBox ID="txtEstatusPago" runat="server" Width="100%" Theme="Material" ReadOnly="true">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                              
                            </table>
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

            </TabPages>

            <ActiveTabStyle Wrap="True"></ActiveTabStyle>

            <TabStyle Wrap="True" Font-Size="9pt"></TabStyle>
        </dx:ASPxPageControl>

        <%--<dx:ASPxCallbackPanel ID="cptipoProyecto" runat="server" Width="100%" Theme="Material" SettingsLoadingPanel-ShowImage="true" ClientInstanceName="cptipoProyecto" OnCallback="cptipoProyecto_Callback">--%>
        <dx:ASPxPopupControl ID="pcUploadDoc" ClientInstanceName="pcUploadDoc" Theme="Material" ShowCloseButton="true" runat="server" ViewStateMode="Disabled" Modal="True" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" CloseAction="CloseButton" AutoUpdatePosition="True" AllowResize="true" AllowDragging="true">
            <CloseButtonStyle BackColor="#009688"></CloseButtonStyle>
            <HeaderStyle BackColor="#3A4A5B" Font-Bold="True" Font-Size="16px" ForeColor="White" HorizontalAlign="Center" VerticalAlign="Middle">
                <Paddings Padding="4px" />
                <BorderBottom BorderStyle="Dashed" />
                <BorderBottom BorderStyle="None" />
            </HeaderStyle>
            <ContentCollection>
                <dx:PopupControlContentControl runat="server"></dx:PopupControlContentControl>
            </ContentCollection>
            <ContentStyle>
                <Paddings Padding="0px" />
            </ContentStyle>
            <%--<ClientSideEvents PopUp="OnPopupInit" Shown="OnPopupShown" />--%>
        </dx:ASPxPopupControl>

        <dx:ASPxCallback ID="cbRowClickgvDocsSociales" runat="server" ClientInstanceName="cbRowClickgvDocsSociales" OnCallback="cbRowClickgvDocsSociales_Callback">
            <ClientSideEvents CallbackComplete="cbRowClickgvDocsSociales_CallbackComplete" />
        </dx:ASPxCallback>

        <dx:ASPxCallback ID="cbRowClickgvDocsTecnicos" runat="server" ClientInstanceName="cbRowClickgvDocsTecnicos" OnCallback="cbRowClickgvDocsTecnicos_Callback">
            <ClientSideEvents CallbackComplete="cbRowClickgvDocsTecnicos_CallbackComplete" />
        </dx:ASPxCallback>

        <dx:ASPxHiddenField ID="hfDocs" ClientInstanceName="hfDocs" runat="server"></dx:ASPxHiddenField>


        <dx:ASPxLoadingPanel ID="LoadingPanel" ClientInstanceName="LoadingPanel" runat="server" Theme="Material"></dx:ASPxLoadingPanel>
        <dx:ASPxCallback ID="cbGuardarProyecto" runat="server" ClientInstanceName="cbGuardarProyecto" OnCallback="cbGuardarProyecto_Callback">
            <ClientSideEvents CallbackComplete="onCallbackCompletecbGuardarInfoBasica" />
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cbEnviarRevision" runat="server" ClientInstanceName="cbEnviarRevision" OnCallback="cbEnviarRevision_Callback">
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cbGuardarGeoreferencia" runat="server" ClientInstanceName="cbGuardarGeoreferencia" OnCallback="cbGuardarGeoreferencia_Callback">
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cbAgregarCoponente" runat="server" ClientInstanceName="cbAgregarCoponente" OnCallback="cbAgregarCoponente_Callback">
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cbGuardarComponentes" runat="server" ClientInstanceName="cbGuardarComponentes">
        </dx:ASPxCallback>
        <dx:ASPxCallback ID="cbGeoreferencias" ClientInstanceName="cbGeoreferencias" OnCallback="cbGeoreferencias_Callback" runat="server">
            <ClientSideEvents CallbackComplete="onCallbackCompletecbGeoreferencia" />
        </dx:ASPxCallback>
        <dx:ASPxPopupControl ID="poupImg" ClientInstanceName="poupImg" runat="server" Width="300px" ShowHeader="False">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <dx:ASPxCallbackPanel ID="cbpImgDet" ClientInstanceName="cbpImgDet" runat="server" Width="100%" OnCallback="cbpImgDet_Callback">
                        <PanelCollection>
                            <dx:PanelContent>
                                <dx:ASPxImage ID="ibFotoGeoreferenciada" runat="server" ShowLoadingImage="true" Width="300px"></dx:ASPxImage>
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </dx:PopupControlContentControl>
            </ContentCollection>


        </dx:ASPxPopupControl>

        <%--  --%>

               <dx:ASPxPopupControl ID="pcVistaPreviaPresupuesto" runat="server" CloseAction="CloseButton" CloseOnEscape="true" Modal="True"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" ClientInstanceName="pcVistaPreviaPresupuesto" 
        HeaderText="Vista Previa" HeaderStyle-HorizontalAlign="Center" AllowDragging="True" PopupAnimationType="None" EnableViewState="False" AutoUpdatePosition="true" Theme ="Material" AllowResize="true" ShowPageScrollbarWhenModal="true">
        
        <ContentCollection >
            <dx:PopupControlContentControl runat="server">
                <dx:ASPxPanel ID="pnlVistaPrevia" runat="server" DefaultButton="btOK" ScrollBars="Auto"  >
                    <PanelCollection >
                        <dx:PanelContent runat="server"  >
                <dx:ASPxLabel runat="server" Text="Nota: Antes de guardar los cambios asegurate que la información se cargo completamente. Ten en cuenta que solo se permite guardar una vez." ForeColor="DarkSlateGray" Font-Size="11px" CssClass="text-center" ></dx:ASPxLabel>
                            <br />  
                            <br />        
                            <br />
                            <dx:ASPxGridView ID="gridVistaPrevia" ClientInstanceName="gridVistaPrevia" runat="server" AutoGenerateColumns="False" KeyFieldName="IdConcepto" OnDataBinding="gridVistaPrevia_DataBinding" OnCustomCallback="gridVistaPrevia_CustomCallback" Theme="Material" Width="99%" Font-Size="9pt" >
                                <Styles>
                                    <Cell HorizontalAlign="Left"></Cell>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" />
                                <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />

                                <Columns>
                                   
                                    <dx:GridViewDataTextColumn FieldName="IdConcepto" ShowInCustomizationForm="True" VisibleIndex="1" Visible="false">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PARTIDA" FieldName="NombrePartida" VisibleIndex="2" GroupIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CÓDIGO" FieldName="Codigo" ShowInCustomizationForm="True" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CONCEPTO" FieldName="Concepto" ShowInCustomizationForm="True" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="UNIDAD" FieldName="Unidad" ShowInCustomizationForm="True" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CANTIDAD" FieldName="Cantidad" ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PRECIO UNITARIO" FieldName="PUnitario" ShowInCustomizationForm="True" VisibleIndex="7">
                                         <PropertiesTextEdit DisplayFormatString="c">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="PRECIO CON LETRA" FieldName="PrecioLetra" ShowInCustomizationForm="True" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="IMPORTE" FieldName="Importe" ShowInCustomizationForm="True" VisibleIndex="9">
                                        <PropertiesTextEdit DisplayFormatString="c">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>


                                </Columns>
                                <TotalSummary>
                                    <dx:ASPxSummaryItem FieldName="Importe" SummaryType="Sum" DisplayFormat="Total Sin IVA: ${0:n2}" ShowInColumn="IMPORTE" />
                                </TotalSummary>
                                <GroupSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="c" SummaryType="Sum" ValueDisplayFormat="c" FieldName="Importe" />
                                </GroupSummary>

                            </dx:ASPxGridView>
                    
                            <br />
                             <table cellpadding="2" style="border-collapse: separate; border-spacing: 10px; width: 100%">
                                <tr>
                                    <td style="width: 50%;align-items: center;text-align: center;">
                                        <dx:ASPxButton ID="btnGuardarConceptos" runat="server" Text="ACEPTAR" Theme="Material" ClientInstanceName="btnGuardarConceptos" ClientEnabled="true" AutoPostBack="false"  CssClass="btn-success">
                                            <ClientSideEvents Click="function(s, e) { almacenarPresupuesto();}" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td style="width: 50%;align-items: center;text-align: center;">
                                       <dx:ASPxButton ID="btnCancelarVistaPrevia" runat="server" Text="CANCELAR" Theme="Material" ClientInstanceName="btnCancelarVistaPrevia" ClientEnabled="true" AutoPostBack="false" CssClass="btn-danger">
                                            <ClientSideEvents Click="function(s, e) {pcVistaPreviaConceptos.Hide();}" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxPanel>
                <div>
                    
                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>
       
    </dx:ASPxPopupControl>

        <%--  --%>
        <script>
            cbGeoreferencias.PerformCallback();
        </script>

         <dx:ASPxCallback ID="cbGuardarConceptos" runat="server" ClientInstanceName="cbGuardarConceptos" OnCallback="cbGuardarConceptos_Callback">
            <ClientSideEvents CallbackComplete="onCallbackCompletecbGuardarConceptos" />
        </dx:ASPxCallback>

        <dx:ASPxCallback ID="cbEliminaComponente" ClientInstanceName="cbEliminaComponente" runat="server" OnCallback="cbEliminaComponente_Callback">
            <ClientSideEvents CallbackComplete="OnCbCompleteEliminaComponente" />
        </dx:ASPxCallback>

        <dx:ASPxCallback ID="cbEliminarDocumento" ClientInstanceName="cbEliminarDocumento" runat="server" OnCallback="cbEliminarDocumento_Callback">
            <ClientSideEvents CallbackComplete="OnCbCompleteEliminarDocumento" />
        </dx:ASPxCallback>
        <dx:ASPxPopupControl ID="ASPxPopupControl3" ClientInstanceName="p1" runat="server" PopupHorizontalAlign="OutsideLeft" Width="563px" PopupElementID="imgDesctecnica" ShowHeader="False">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    EN LA LOCALIDAD DE XXX, MUNICIPIO DE XXX, ACTUALMENTE LA ESCUELA BENITO JUÁREZ CON CLAVE 20DSO115E UBICADA EN LA CALLE DE BENITO JUÁREZ  NO. 504, SE CUENTA CON 14 AULAS, BIBLIOTECA, MÓDULO DE SANITARIOS, PLAZA CÍVICA, Y ÁREAS COMUNES, TODAS EN BUEN ESTADO, CUENTA CON UNA MATRÍCULA DE ___ ALUMNOS. LAS 14 AULAS DE MUROS DE CONCRETO Y LOSA DE CONCRETO SON UTILIZADAS PARA IMPARTIR CLASES CON CAPACIDAD PARA 30 ALUMNOS,, DEBIDO AL NÚMERO DE ALUMNOS INSCRITOS ES NECESARIO CONSTRUIR AULAS PARA EVITAR EL HACINAMIENTO ESTUDIANTIL EN LAS AULAS, YA QUE EN OCASIONES ES NECESARIO REUNIR DOS GRUPOS POR AULA PARA PODER CUMPLIR CON EL PROGRAMA DE CLASES; SE CUENTA CON EL EQUIPAMIENTO NECESARIO PARA EL PROYECTO. (DATOS DEL H. AYUNTAMIENTO).
LA INSTITUCIÓN BRINDA SERVICIO EN UN HORARIO DE CLASES DE 8:00 A.M. A 1:00 P.M., DE LUNES A VIERNES.
LOS TRABAJOS DE INSTALACIÓN QUE SE REALIZARÁN SON DE ACUERDO A LOS COMPONENTES: 
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>


        <dx:ASPxPopupControl ID="ASPxPopupControl2" ClientInstanceName="p2" runat="server" PopupHorizontalAlign="OutsideLeft" Width="563px" PopupElementID="imgDesctecnica" ShowHeader="False">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    AL TÉRMINO DE LA EJECUCIÓN DEL PROYECTO SE TENDRÁ UN AULA DIDÁCTICA DE 6.0 M X 8.0M FUNCIONAL Y OPERABLE CON CAPACIDAD DE 30 ALUMNOS, TENDIENDO ASÍ AULAS EN BUENAS CONDICIONES.
CON LAS 15 AULAS QUE EXISTIRÁN SE VERÁN BENEFICIADOS LA MATRICULA ESCOLAR QUE ES DE N__- DE ALUMNOS

                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

        <dx:ASPxPopupControl ID="ASPxPopupControl1" ClientInstanceName="p3" runat="server" Width="563px" PopupElementID="imgDesctecnica" ShowHeader="False">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    ES-MX">EN LA LOCALIDAD DE XXX, MUNICIPIO DE XXX, ACTUALMENTE LA ESCUELA BENITO JUÁREZ CON CLAVE 20DSO115E UBICADA EN LA CALLE DE BENITO JUÁREZ<span>&nbsp; </span>NO. 504, SE CUENTA CON 14 AULAS, BIBLIOTECA, MÓDULO DE SANITARIOS, PLAZA CÍVICA, Y ÁREAS COMUNES, TODAS EN BUEN ESTADO, CUENTA CON UNA MATRÍCULA DE ___ ALUMNOS. LAS 14 AULAS DE MUROS DE CONCRETO Y LOSA DE CONCRETO SON UTILIZADAS PARA IMPARTIR CLASES CON CAPACIDAD PARA 30 ALUMNOS,, DEBIDO AL NÚMERO DE ALUMNOS INSCRITOS ES NECESARIO CONSTRUIR AULAS PARA EVITAR EL HACINAMIENTO ESTUDIANTIL EN LAS AULAS, YA QUE EN OCASIONES ES NECESARIO REUNIR DOS GRUPOS POR AULA PARA PODER CUMPLIR CON EL PROGRAMA DE CLASES; SE CUENTA CON EL EQUIPAMIENTO NECESARIO PARA EL PROYECTO. (DATOS DEL H. AYUNTAMIENTO).
        LA INSTITUCIÓN BRINDA SERVICIO EN UN HORARIO DE CLASES DE 8:00 A.M. A 1:00 P.M., DE LUNES A VIERNES.
        LOS TRABAJOS DE INSTALACIÓN QUE SE REALIZARÁN SON DE ACUERDO A LOS COMPONENTES:
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>

            <asp:ObjectDataSource ID="dataSourceUnidadMedida" runat="server" TypeName="WebRegistrodeProyectos.Code.Utils" SelectMethod="ObtenerUnidadMedida"></asp:ObjectDataSource>
        <asp:SqlDataSource ID="SqlDataSourceDRO" runat="server" 
           ConnectionString="<%$ ConnectionStrings:BD_InfraConnectionString %>">
        </asp:SqlDataSource>
    </div>
    <dx:ASPxCallback ID="cbGuardarDRO" ClientInstanceName="cbGuardarDRO" OnCallback="cbGuardarDRO_Callback" runat="server">
        <ClientSideEvents CallbackComplete="cbGuardarDROComplete"  />
    </dx:ASPxCallback>
</asp:Content>
