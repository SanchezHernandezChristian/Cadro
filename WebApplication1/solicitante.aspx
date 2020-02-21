<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="solicitante.aspx.cs" Inherits="WebApplication1.solicitante" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function EjecutaBotonEdicion(s, e) {
            if (e.buttonID == 'btnEditar') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.location.href = "archivos_dro.aspx";
            }
            if (e.buttonID == 'validarDoc') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.open("dro_reenviadoc.aspx?id=" + rowKey);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-12">

         <dx:ASPxMenu ID="menuCadro" runat="server" Width="100%" Orientation="Horizontal" HorizontalAlign="Left" Theme="Material" OnDataBound="menuCadro_DataBound" OnItemDataBound="menuCadro_ItemDataBound" BackColor="White">
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
                                              <Image Url="css/img/pii blanco.png" Width="10%">
                                                  </Image>
                                          </dx:MenuItem>
                                        </Items>
            </dx:ASPxMenu>
    </div>
    
    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-6">
        <div class="form-group row mx-2">
                
            <div class="form-label-group col-md-2">
                <dx:ASPxButton ID="RegistroPadron" Theme="Material" runat="server" AutoPostBack="False" Text="Solicitud de Registro"
                    BackColor="#00CC00" CssClass="btn btn-imprimir col-md-2">
                    <ClientSideEvents Click="function(s, e) {
                                                window.location.href = 'archivos_dro.aspx';
                                                                        }" />
                </dx:ASPxButton>
            </div>
            <%--    <a class="btn btn-success" role="button" href="registros_dro.aspx"> Nueva solicitud</a>   --%>
            <br />
            <dx:ASPxLabel runat="server" ClientVisible="false" ForeColor="Transparent" ID="acepta">
            </dx:ASPxLabel>
        </div>
    </div>
        
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <asp:Panel runat="server" ID="docpendiente">
                <dx:ASPxLabel ID="correo" runat="server" ClientVisible="false" Text=""></dx:ASPxLabel>
                <dx:ASPxLabel ID="ced" runat="server" ClientVisible="false" Text=""></dx:ASPxLabel>
                
                <h1 class="h4 col-7"><strong>Solicitudes con documentación pendiente</strong>
                </h1>
                <dx:ASPxGridView ID="doc" ClientInstanceName="doc" OnHtmlRowPrepared="doc_HtmlRowPrepared" KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="doc_CustomCallback" OnDataBinding="doc_DataBinding" Visible="false"
                    runat="server" AutoGenerateColumns="False">
                    <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                    <SettingsBehavior AutoExpandAllGroups="true" />
                    <SettingsPager PageSize="20" NumericButtonCount="6" />
                    <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />

                    <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                    <Columns>
                        <dx:GridViewCommandColumn MinWidth="280" VisibleIndex="0" Caption="Documentos" ButtonType="Link" Width="25%">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="validarDoc" Visibility="AllDataRows" Text="Subir">
                                
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Folio de solicitud" FieldName="id" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn MinWidth="280" Width="40%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Observacion" FieldName="observaciones" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Cédula" FieldName="cedula" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="10" NumericButtonCount="6" />
                    <Styles>
                        <Cell Wrap="true" />
                    </Styles>
                    </dx:ASPxGridView>
                    </asp:Panel>
                <br />
                <asp:Panel runat="server" ID="solici">
                <h1 class="h4 col-5"><strong>Solicitudes realizadas</strong>
                </h1>
                <dx:ASPxGridView ID="gvSolicitudes" ClientInstanceName="gvSolicitudes" OnHtmlRowPrepared="gvSolicitudes_HtmlRowPrepared" KeyFieldName="id" Width="100%"
                    Theme="Material" OnCustomCallback="gvSolicitudes_CustomCallback" OnDataBinding="gvSolicitudes_DataBinding"
                    runat="server" AutoGenerateColumns="False">
                    <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                    <SettingsBehavior AutoExpandAllGroups="true" />
                    <SettingsPager PageSize="20" NumericButtonCount="6" />
                    <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                    <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />

                    <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                    <Columns>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Folio de solicitud" FieldName="id" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn MinWidth="280" Width="40%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Observacion" FieldName="observaciones" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Cédula" FieldName="cedula" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="10" NumericButtonCount="6" />
                    <Styles>
                        <Cell Wrap="true" />
                    </Styles>
                </dx:ASPxGridView>
                    </asp:Panel>
                <br />
                <br />
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="ASPxLabel" ClientVisible="false" Visible="false"></dx:ASPxLabel>
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="ASPxLabel" ClientVisible="false" Visible="false"></dx:ASPxLabel>
            </div>
        </div>
        <asp:Panel runat="server" ID="s">
            <table id="tabla">
                <tr>
                    <td style="width: 25px">
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="20px" Height="20px" BackColor="LightGreen" Border-BorderColor="Black" Border-BorderStyle="Solid"></dx:ASPxPanel>

                    </td>
                    <td style="width: 180px">
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="SOLICITUD AUTORIZADA" Font-Bold="true"></dx:ASPxLabel>
                    </td>
                    <td style="width: 25px">
                        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="20px" Height="20px" BackColor="Salmon"></dx:ASPxPanel>

                    </td>
                    <td style="width: 180px">
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="SOLICITUD RECHAZADA" Font-Bold="true"></dx:ASPxLabel>
                    </td>
                    <td style="width: 25px">
                        <dx:ASPxPanel ID="ASPxPanel3" runat="server" Width="20px" Height="20px" BackColor="#F4F4F4"></dx:ASPxPanel>

                    </td>
                    <td style="width: 180px">
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="EN ESPERA" Font-Bold="true"></dx:ASPxLabel>
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
</asp:Content>
