<%@ Page Language="C#" MasterPageFile="~/SiteCADRO.Master" Title="Administrador" AutoEventWireup="true" CodeBehind="dro_Administrador.aspx.cs" Inherits="WebApplication1.dro_Administrador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function EjecutaBotonEdicion(s, e) {
            if (e.buttonID == 'btnEditar' || e.buttonID == 'btnEditarSolSesion' || e.buttonID == 'btnEditarFolios' || e.buttonID == 'btnEditarFoliosAnterior') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.location.href = "asignacionFecha.aspx?id=" + rowKey;
            }
            if (e.buttonID == 'identificacion') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.location.href = "rep_dictamen.aspx?id=" + rowKey;
            }
            if (e.buttonID == 'btnImprimir') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.location.href = "rep_credencial.aspx?id=" + rowKey;
            }
            if (e.buttonID == 'validarDoc') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.location.href = "validar_documentos.aspx?id=" + rowKey;
            }
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
    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
         <div class="container-fluid">
            <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Solicitudes Recibidas</strong>
            </h1>
         <%--   <dx:ASPxLabel runat="server" Text="EN ESPERA DE DICTAMEN" ClientVisible="false" ForeColor="Transparent" ID="acepta">
            </dx:ASPxLabel>  --%> 
        </div>
    </div>
    <div class="container-fluid">
         <div class="row col">
       <dx:ASPxPageControl ID="ASPxPageControl1" Width="100%" Theme="Material" runat="server" ActiveTabIndex="0">
        <TabPages>
             <dx:TabPage Text="SOLICITUDES RECHAZADAS" ActiveTabStyle-ForeColor="#009688" TabStyle-ForeColor="#D6D2C9">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <dx:ASPxGridView ID="gvSolicitudesFolios" ClientInstanceName="gvSolicitudesFolios" OnHtmlRowPrepared="gvSolicitudesFolios_HtmlRowPrepared" KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudesFolios_CustomCallback" OnDataBinding="gvSolicitudesFolios_DataBinding" runat="server" AutoGenerateColumns="False">
                                <Settings ShowFilterRow="True"  HorizontalScrollBarMode="Visible"/>
                                 <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                <SettingsBehavior AutoExpandAllGroups="true" />
                <SettingsPager PageSize="20" NumericButtonCount="6" />
                <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                <Columns>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="38%" Caption="Clave de solicitud" FieldName="id" VisibleIndex="2">
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
                                KeyFieldName="id" Width="100%" Theme="Material" OnCustomCallback="gvSolicitudesSesion_CustomCallback" OnDataBinding="gvSolicitudesSesion_DataBinding" runat="server" AutoGenerateColumns="False">
                                <Settings ShowFilterRow="True"  HorizontalScrollBarMode="Visible"/>
                                 <Settings ShowFilterRow="true" ShowFilterRowMenu="true" ShowGroupPanel="true" UseFixedTableLayout="true" />
                <SettingsBehavior AutoExpandAllGroups="true" />
                <SettingsPager PageSize="20" NumericButtonCount="6" />
                <SettingsDataSecurity AllowInsert="false" AllowEdit="false" AllowDelete="false" />
                <SettingsAdaptivity AdaptivityMode="HideDataCells" AllowOnlyOneAdaptiveDetailExpanded="true" />
                <ClientSideEvents CustomButtonClick="function(s, e) { EjecutaBotonEdicion(s, e) }" />
                <Columns>
                    <dx:GridViewDataTextColumn MinWidth="280" Width="38%" Caption="Clave de solicitud" FieldName="id" VisibleIndex="2">
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
    <div>
            <table style="height:50px">
                <tr>
                    <td style="width:25px">
                        <dx:ASPxPanel ID="ASPxPanel1" runat="server" Width="20px" Height="20px" BackColor="LightGreen" Border-BorderColor="Black" Border-BorderStyle="Solid"></dx:ASPxPanel>
                    </td>
                    <td style="width:180px">
                        <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="SOLICITUD AUTORIZADA" Font-Bold="true"></dx:ASPxLabel>
                    </td>
                    <td style="width:25px">
                        <dx:ASPxPanel ID="ASPxPanel2" runat="server" Width="20px" Height="20px" BackColor="Salmon"></dx:ASPxPanel>
                        
                    </td>
                    <td style="width:180px">
                        <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="SOLICITUD RECHAZADA" Font-Bold="true"></dx:ASPxLabel>
                    </td>
                    <td style="width:25px">
                        <dx:ASPxPanel ID="ASPxPanel3" runat="server" Width="20px" Height="20px" BackColor="#F4F4F4"></dx:ASPxPanel>
                        
                    </td>
                    <td style="width:180px">
                        <dx:ASPxLabel ID="ASPxLabel5" runat="server" Text="EN ESPERA" Font-Bold="true"></dx:ASPxLabel>
                    </td>
                </tr>
            </table>
            </div>
</asp:Content>