<%@ Page Language="C#" Title="Reporte por región" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="reporteregion.aspx.cs" Inherits="WebApplication1.reporteregion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function AplicaFiltro(s, e) {
            gvReporte.PerformCallback();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
              <div class="container-fluid">
                  <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Reporte por Región</strong></h1>
                      <div class="row">
                          <div class="col"> 
                            <dx:ASPxComboBox ID="cboRegion" NullText="Seleccione una Región" Width="40%" CssClass="mr-3 btn" runat="server" ValueType="System.String" Theme="Material">
                            </dx:ASPxComboBox>
                            <dx:ASPxGridViewExporter ID="gvExporter" runat="server" GridViewID="gvReporte">
                            </dx:ASPxGridViewExporter>
                            <dx:ASPxButton ID="btnConsultar" runat="server" Theme="Material"  CssClass="mr-2 btn btn-primary btn-sm" text="Consultar" AutoPostBack="False" Width="5%" > 
                                <ClientSideEvents Click="function(s, e) { AplicaFiltro(s, e); }" />
                            </dx:ASPxButton>
                            <dx:ASPxButton ID="btnExportar" runat="server" Theme="Material" CssClass="mr-2 btn btn-success btn-sm" Text="Exportar" OnClick="btnExportar_Click" Width="5%" >
                        
                            </dx:ASPxButton>
                          </div>
                          
                      </div> 
            </div>
          </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col">   
                        <dx:ASPxGridView runat="server" Width="100%" ID="gvReporte" Theme="Material" ClientInstanceName="gvReporte" 
                        AutoGenerateColumns="False" OnCustomCallback="gvReporete_CustomCallback" OnDataBinding="gvReporete_DataBinding" KeyFieldName="Folio" EnableRowsCache="false">
                        <Settings VerticalScrollBarMode="Visible" GridLines="Vertical" VerticalScrollableHeight="620"  ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                        <SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="780" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>
                        <EditFormLayoutProperties>
                            <SettingsAdaptivity AdaptivityMode="SingleColumnWindowLimit" SwitchToSingleColumnAtWindowInnerWidth="600" />
                        </EditFormLayoutProperties>
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Folio"  MinWidth="280" Width="15%" FieldName="Folio" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Fecha de entrega" MinWidth="280" Width="36%" FieldName="fecha_de_entrega_de_licencia" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDatatextColumn Caption="Nombre" MinWidth="280" Width="200px" FieldName="nombre" VisibleIndex="3">
                            </dx:GridViewDatatextColumn>
                            <dx:GridViewDataTextColumn Caption="Registro" MinWidth="280" Width="36%" FieldName="Registro" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cédula" MinWidth="280" Width="25%" FieldName="cedula_profesional" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Región" MinWidth="280" Width="36%" FieldName="region" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Municipio" MinWidth="280" Width="36%" FieldName="NombreMunicipio" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Localidad" MinWidth="280" Width="36%" FieldName="NombreLocalidad" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Trámite" MinWidth="280" Width="32%" FieldName="tramite" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Año" MinWidth="280" Width="18%" FieldName="año" VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    <SettingsPager PageSize="30" NumericButtonCount="6" />
                    <Styles>
                        <Cell Wrap="true" />
                    </Styles>
        </dx:ASPxGridView>
                </div>
                 



            </div>
        </div>
        
        

        
    </div>
</asp:Content>
