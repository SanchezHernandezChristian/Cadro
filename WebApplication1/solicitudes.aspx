<%@ Page Language="C#" Title="Solicitudes Aceptadas" AutoEventWireup="true" MasterPageFile="~/SiteCADRO.Master" CodeBehind="solicitudes.aspx.cs" Inherits="WebApplication1.solicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function EjecutaBotonEdicion(s, e) {
            if (e.buttonID == 'btnEditar' || e.buttonID == 'btnEditarSolSesion' || e.buttonID == 'btnEditarFolios' || e.buttonID == 'btnEditarFoliosAnterior') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.location.href = "DictamenSolicitud.aspx?id=" + rowKey;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="text-align:center; height:50px">
         <dx:ASPxLabel runat="server" Text="Solicitudes Aceptadas" Font-Size="16px" ForeColor="#D6D2C9" Font-Bold="true">
         </dx:ASPxLabel>
        <dx:ASPxLabel runat="server" Text="EN ESPERA DE DICTAMEN" ClientVisible="false" ForeColor="Transparent" ID="acepta">
         </dx:ASPxLabel>
    </div>
        <dx:ASPxPageControl ID="ASPxPageControl1" Width="100%" Theme="Material" runat="server" ActiveTabIndex="3" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
        <TabPages>
            <dx:TabPage Text="Solicitudes en espera">
                <ContentCollection> 
                    <dx:ContentControl runat="server">

    <div>
                            <dx:ASPxGridView ID="gvSolicitudes" ClientInstanceName="gvSolicitudes" OnHtmlRowPrepared="gvSolicitudes_HtmlRowPrepared" KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudes_CustomCallback" OnDataBinding="gvSolicitudes_DataBinding" runat="server" AutoGenerateColumns="False">
                                <Settings ShowFilterRow="True" HorizontalScrollBarMode="Visible"/>
                                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true"></SettingsAdaptivity>
            <SettingsBehavior AllowEllipsisInText="true"/>
                                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                                <Columns>
                                    <dx:GridViewCommandColumn VisibleIndex="0" Caption="Editar" ButtonType="Image" Width="60px">
                                        <CustomButtons>
                                            <dx:GridViewCommandColumnCustomButton ID="btnEditar" Image-IconID="actions_edit_32x32devav" Visibility="AllDataRows" Text="Modificar">
                                                <Image Url="css/img/Recurso 34.png">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Clave de solicitud" FieldName="id" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="250px" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Registro DRO" FieldName="registroDRO" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Width="200px" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Width="400px" Caption="Observacion" FieldName="observaciones" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Cédula" FieldName="cedula_profesional" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Solicitudes Aceptadas">
                <ContentCollection> 
                    <dx:ContentControl runat="server">

    <div>
                            <dx:ASPxGridView ID="gvSolicitudesSesion" ClientInstanceName="gvSolicitudesSesion" OnHtmlRowPrepared="gvSolicitudesSesion_HtmlRowPrepared" KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudesSesion_CustomCallback" OnDataBinding="gvSolicitudesSesion_DataBinding" runat="server" AutoGenerateColumns="False">
                                <Settings ShowFilterRow="True" HorizontalScrollBarMode="Visible"/>
                                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                                <Columns>
                                 <%--   <dx:GridViewCommandColumn VisibleIndex="0" Caption="Editar" ButtonType="Image" Width="60px">
                                        <CustomButtons>
                                            <dx:GridViewCommandColumnCustomButton ID="btnEditar2" Image-IconID="actions_edit_32x32devav" Visibility="AllDataRows" Text="Modificar">
                                                <Image Url="css/img/Recurso 34.png">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>  --%> 
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Clave de solicitud" FieldName="id" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="250px" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Registro DRO" FieldName="registroDRO" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Width="200px" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Width="400px" Caption="Observacion" FieldName="observaciones" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Cédula" FieldName="cedula_profesional" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <dx:TabPage Text="Solicitudes Canceladas">
                <ContentCollection> 
                    <dx:ContentControl runat="server">

    <div>
                            <dx:ASPxGridView ID="gvSolicitudesFolios" ClientInstanceName="gvSolicitudesFolios" OnHtmlRowPrepared="gvSolicitudesFolios_HtmlRowPrepared" KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudesFolios_CustomCallback" OnDataBinding="gvSolicitudesFolios_DataBinding" runat="server" AutoGenerateColumns="False">
                                <Settings ShowFilterRow="True" HorizontalScrollBarMode="Visible"/>
                                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                                <Columns>
                                  <%--  <dx:GridViewCommandColumn VisibleIndex="0" Caption="Editar" ButtonType="Image" Width="60px">
                                        <CustomButtons>
                                            <dx:GridViewCommandColumnCustomButton ID="btnEditar3" Image-IconID="actions_edit_32x32devav" Visibility="AllDataRows" Text="Modificar">
                                                <Image Url="css/img/Recurso 34.png">
                                                </Image>
                                            </dx:GridViewCommandColumnCustomButton>
                                        </CustomButtons>
                                    </dx:GridViewCommandColumn>  --%>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Clave de solicitud" FieldName="id" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="250px" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Registro DRO" FieldName="registroDRO" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="200px" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataDateColumn Width="200px" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                                    </dx:GridViewDataDateColumn>
                                    <dx:GridViewDataTextColumn Width="400px" Caption="Observacion" FieldName="observaciones" VisibleIndex="12">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Width="150px" Caption="Cédula" FieldName="cedula_profesional" VisibleIndex="4">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:ASPxGridView>
                        </div>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>