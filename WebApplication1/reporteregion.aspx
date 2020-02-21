<%@ Page Language="C#" Title="Reportes" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="reporteregion.aspx.cs" Inherits="WebApplication1.reporteregion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        function AplicaFiltro(s, e) {
            gvReporte.PerformCallback();
        }
        function AplicaFiltroTramite(s, e) {
            ASPxGridView1.PerformCallback();
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
         <dx:ASPxMenu ID="ASPxMenu1" runat="server" Width="100%" Orientation="Horizontal" HorizontalAlign="Left" Theme="Material" BackColor="White">
                <Items>
                                            <dx:MenuItem Text="Inicio" NavigateUrl="dro_Administrador.aspx">
                                                <Image Url="css/img/Recurso 29.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem Text="Reportes" NavigateUrl="reporteregion.aspx">
                                                <Image Url="css/img/Recurso 67.png">
                                                </Image>
                                            </dx:MenuItem>
                                        </Items>
            </dx:ASPxMenu>
    </div>
    <div>
    <dx:ASPxPageControl ID="ASPxPageControl1" Width="100%" Theme="Material" runat="server" ActiveTabIndex="0" EnableTabScrolling="true">
        <TabPages>
            <dx:TabPage Text="Reporte por Región" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
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
                        <Settings VerticalScrollBarMode="Visible"  UseFixedTableLayout="true" GridLines="Vertical" VerticalScrollableHeight="620"  ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                        <SettingsBehavior AutoExpandAllGroups="true" />
                        <SettingsPager PageSize="20" NumericButtonCount="6" />
                        <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                        <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Fecha de entrega" MinWidth="280" Width="36%" FieldName="fecha_de_entrega_de_licencia" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDatatextColumn Caption="Nombre" MinWidth="280" Width="200px" FieldName="Nombres" VisibleIndex="2">
                            </dx:GridViewDatatextColumn>
                            <dx:GridViewDataTextColumn Caption="Registro" MinWidth="280" Width="36%" FieldName="Registro" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cédula" MinWidth="280" Width="25%" FieldName="cedula" VisibleIndex="5">
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
        </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <dx:TabPage Text="Reporte por trámite" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
              <div class="container-fluid">
                  <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Reporte por tipo de trámite</strong></h1>
                      <div class="row">
                          <div class="col"> 
                            <dx:ASPxComboBox ID="cboTipoTramite" NullText="Seleccione Trámite" Width="40%" CssClass="mr-3 btn" runat="server" ValueType="System.String" Theme="Material">
                            </dx:ASPxComboBox>
                            <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="ASPxGridView1">
                            </dx:ASPxGridViewExporter>
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Theme="Material"  CssClass="mr-2 btn btn-primary btn-sm" text="Consultar" AutoPostBack="False" Width="5%" > 
                                <ClientSideEvents Click="function(s, e) { AplicaFiltroTramite(s, e); }" />
                            </dx:ASPxButton>
                            <dx:ASPxButton ID="ASPxButton2" runat="server" Theme="Material" CssClass="mr-2 btn btn-success btn-sm" Text="Exportar" OnClick="ASPxButton2_Click" Width="5%" >
                        
                            </dx:ASPxButton>
                          </div>
                          
                      </div> 
            </div>
          </div>
                        <div class="container-fluid">
            <div class="row">
                <div class="col">   
                        <dx:ASPxGridView runat="server" Width="100%" ID="ASPxGridView1" Theme="Material" ClientInstanceName="ASPxGridView1" 
                        AutoGenerateColumns="False" OnCustomCallback="ASPxGridView1_CustomCallback" OnDataBinding="ASPxGridView1_DataBinding" KeyFieldName="Folio" EnableRowsCache="false">
                        <Settings VerticalScrollBarMode="Visible"  UseFixedTableLayout="true" GridLines="Vertical" VerticalScrollableHeight="620"  ShowGroupPanel="True" ShowHeaderFilterButton="True" />
                        <SettingsBehavior AutoExpandAllGroups="true" />
                        <SettingsPager PageSize="20" NumericButtonCount="6" />
                        <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                        <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Fecha de entrega" MinWidth="280" Width="36%" FieldName="fecha_de_entrega_de_licencia" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDatatextColumn Caption="Nombre" MinWidth="280" Width="200px" FieldName="Nombres" VisibleIndex="2">
                            </dx:GridViewDatatextColumn>
                            <dx:GridViewDataTextColumn Caption="Registro" MinWidth="280" Width="25%" FieldName="Registro" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cédula" MinWidth="280" Width="25%" FieldName="cedula" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Región" MinWidth="280" Width="25%" FieldName="region" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Municipio" MinWidth="280" Width="36%" FieldName="NombreMunicipio" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Localidad" MinWidth="280" Width="36%" FieldName="NombreLocalidad" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Trámite" MinWidth="280" Width="25%" FieldName="tramite" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Año" MinWidth="280" Width="18%" FieldName="año" VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Estado" MinWidth="280" Width="25%" FieldName="testado" VisibleIndex="12">
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

                        </dx:ContentControl>
                    </ContentCollection>
            </dx:TabPage>

            </TabPages>
        </dx:ASPxPageControl>
        </div>
</asp:Content>
