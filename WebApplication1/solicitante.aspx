<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="solicitante.aspx.cs" Inherits="WebApplication1.solicitante" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-3">
        <div class="container-fluid row mx-3">
            <h1 class="h4 col-3"><strong>Solicitudes enviadas</strong>
            </h1>
            <a class="btn btn-success " role="button" href="registrarse.aspx"> Nueva solicitud</a>
            <dx:ASPxLabel runat="server" ClientVisible="false" ForeColor="Transparent" ID="acepta">
         </dx:ASPxLabel>
        </div>
         
    </div>
    
    <div class="container-fluid">
        <div class="row">
            <div class="col">
                <dx:ASPxLabel ID="correo" runat="server" Visible="true" Text=""></dx:ASPxLabel>
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
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Clave de solicitud" FieldName="id" VisibleIndex="2">
                        </dx:GridViewDataTextColumn>
                     <%--   <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>     --%> 
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Registro DRO" FieldName="registroDRO" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                        </dx:GridViewDataTextColumn>
                        <%--  <dx:GridViewDataTextColumn Width="200px" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>   --%> 
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="40%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn MinWidth="280" Width="40%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                            <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Observacion" FieldName="observaciones" VisibleIndex="12">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Cédula" FieldName="cedula_profesional" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsPager PageSize="10" NumericButtonCount="6" />
                                <Styles>
                                    <Cell Wrap="true" />
                                </Styles>
                </dx:ASPxGridView>
                </div>
            </div>
        </div>
</asp:Content>
