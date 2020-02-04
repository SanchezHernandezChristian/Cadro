<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="asignador.aspx.cs" Inherits="WebApplication1.asignador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function EjecutaBotonEdicion(s, e) {
            if (e.buttonID == 'btnEditar' || e.buttonID == 'btnEditarSolSesion' || e.buttonID == 'btnEditarFolios' || e.buttonID == 'btnEditarFoliosAnterior') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.open( "asignacionFecha.aspx?id=" + rowKey, '_blank');
            }
            if (e.buttonID == 'identificacion') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.open("rep_dictamen.aspx?id=" + rowKey, '_blank');
            }
            if (e.buttonID == 'btnImprimir') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.open( "rep_credencial.aspx?id=" + rowKey, '_blank');
            }
            if (e.buttonID == 'validarDoc') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.open( "validar_documentos.aspx?id=" + rowKey, '_blank');
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
         <div class="container-fluid">
            <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Solicitudes Recibidas</strong>
            </h1>
         <%--   <dx:ASPxLabel runat="server" Text="EN ESPERA DE DICTAMEN" ClientVisible="false" ForeColor="Transparent" ID="acepta">
            </dx:ASPxLabel>  --%> 
        </div>
    </div>
    <div class="container-fluid">
         <div class="row col-md-12">
       <dx:ASPxPageControl ID="ASPxPageControl1" Width="100%" Theme="Material" runat="server" ActiveTabIndex="0" EnableTabScrolling="true">
        <TabPages>
            
            <dx:TabPage Text="VALIDACION DE DOCUMENTACION" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
            
           <dx:ASPxGridView ID="documentos" ClientInstanceName="documentos" OnHtmlRowPrepared="documentos_HtmlRowPrepared"
                KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="documentos_CustomCallback" OnDataBinding="documentos_DataBinding"
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
                            <dx:GridViewCommandColumnCustomButton ID="validarDoc" Visibility="AllDataRows" Text="Validar">
                                
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Folio" FieldName="id" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn MinWidth="280" Width="36%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Notas" FieldName="notasfecha" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="28%" Caption="Cédula" FieldName="cedula" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager PageSize="10" NumericButtonCount="6" />
                <Styles>
                    <Cell Wrap="true" />
                </Styles>
            </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
                
            
            <dx:TabPage Text="PARA ASIGNAR FECHA" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
            
           <dx:ASPxGridView ID="gvSolicitudes" ClientInstanceName="gvSolicitudes" OnHtmlRowPrepared="gvSolicitudes_HtmlRowPrepared" 
                KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudes_CustomCallback" OnDataBinding="gvSolicitudes_DataBinding" 
                runat="server" AutoGenerateColumns="False">
                <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                <SettingsBehavior AutoExpandAllGroups="true" />
                <SettingsPager PageSize="20" NumericButtonCount="6" />
                <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" Caption="Asignar Fecha" ButtonType="Link" Width="30%">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnEditar" Visibility="AllDataRows" Text="Asignar">
                                
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Folio" FieldName="id" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn MinWidth="280" Width="36%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Notas" FieldName="notasfecha" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="28%" Caption="Cédula" FieldName="cedula" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager PageSize="10" NumericButtonCount="6" />
                <Styles>
                    <Cell Wrap="true" />
                </Styles>
            </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
             
            
            <dx:TabPage Text="IMPRESIÓN DE DICTAMEN" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
            
           <dx:ASPxGridView ID="credencial" ClientInstanceName="credencial" OnHtmlRowPrepared="credencial_HtmlRowPrepared"
                KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="credencial_CustomCallback" OnDataBinding="credencial_DataBinding"
                runat="server" AutoGenerateColumns="False">
                <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                <SettingsBehavior AutoExpandAllGroups="true" />
                <SettingsPager PageSize="20" NumericButtonCount="6" />
                <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" Caption="Imprimir" ButtonType="Link" Width="25%">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="identificacion" Visibility="AllDataRows" Text="Imprimir">
                                
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Folio" FieldName="id" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn MinWidth="280" Width="36%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Notas" FieldName="notasfecha" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="28%" Caption="Cédula" FieldName="cedula" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager PageSize="10" NumericButtonCount="6" />
                <Styles>
                    <Cell Wrap="true" />
                </Styles>
            </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            
            
            <dx:TabPage Text="SOLICITUDES RECHAZADAS" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGridView ID="gvSolicitudesFolios" ClientInstanceName="gvSolicitudesFolios" OnHtmlRowPrepared="gvSolicitudesFolios_HtmlRowPrepared" 
                            KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudesFolios_CustomCallback" OnDataBinding="gvSolicitudesFolios_DataBinding" 
                            runat="server" AutoGenerateColumns="False">
                <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                <SettingsBehavior AutoExpandAllGroups="true" />
                <SettingsPager PageSize="20" NumericButtonCount="6" />
                <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                <Columns>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Folio" FieldName="id" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn MinWidth="280" Width="36%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Notas" FieldName="notasfecha" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="28%" Caption="Cédula" FieldName="cedula" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager PageSize="10" NumericButtonCount="6" />
                <Styles>
                    <Cell Wrap="true" />
                </Styles>
            </dx:ASPxGridView>
                        </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            
            

        <dx:TabPage Text="SOLICITUDES ACEPTADAS" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                <dx:ASPxGridView ID="gvSolicitudesSesion" ClientInstanceName="gvSolicitudesSesion" OnHtmlRowPrepared="gvSolicitudesSesion_HtmlRowPrepared" 
                 KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudesSesion_CustomCallback" OnDataBinding="gvSolicitudesSesion_DataBinding" 
                 runat="server" AutoGenerateColumns="False">
                <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                <SettingsBehavior AutoExpandAllGroups="true" />
                <SettingsPager PageSize="20" NumericButtonCount="6" />
                <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                <Columns>
                    <dx:GridViewCommandColumn VisibleIndex="0" Caption="Identificacion" ButtonType="Link" Width="30%">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnImprimir" Visibility="AllDataRows" Text="Ver">
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Folio" FieldName="id" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="25%" Caption="Profesión" FieldName="abreviatura_de_profesion" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Nombre" FieldName="nombre" VisibleIndex="3">
                            <Settings AutoFilterCondition="Contains" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Municipio" FieldName="nombreMunicipio" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Localidad" FieldName="nombreLocalidad" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Trámite solicitado" FieldName="descripcion" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Estado de trámite" FieldName="status" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn MinWidth="280" Width="36%" Caption="Fecha de trámite" FieldName="fecha_solicitud" VisibleIndex="11">
                        <PropertiesDateEdit DisplayFormatString="dd/MM/yyyy"></PropertiesDateEdit>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="36%" Caption="Notas" FieldName="notasfecha" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="28%" Caption="Cédula" FieldName="cedula" VisibleIndex="4">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager PageSize="10" NumericButtonCount="6" />
                <Styles>
                    <Cell Wrap="true" />
                </Styles>
            </dx:ASPxGridView>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            
             
        </TabPages>
    </dx:ASPxPageControl>
             </div>

    </div>
</asp:Content>

