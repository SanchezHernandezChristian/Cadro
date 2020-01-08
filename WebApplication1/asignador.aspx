<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="asignador.aspx.cs" Inherits="WebApplication1.asignador" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        function EjecutaBotonEdicion(s, e) {
            if (e.buttonID == 'btnEditar' || e.buttonID == 'btnEditarSolSesion' || e.buttonID == 'btnEditarFolios' || e.buttonID == 'btnEditarFoliosAnterior') {
                var rowKey = s.GetRowKey(e.visibleIndex);
                window.location.href = "asignacionFecha.aspx?id=" + rowKey;
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
        <div class="container-fluid">
            <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Solicitudes pendientes</strong>
            </h1>
            <dx:ASPxLabel runat="server" Text="EN ESPERA DE DICTAMEN" ClientVisible="false" ForeColor="Transparent" ID="acepta">
            </dx:ASPxLabel>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row col">
            <dx:ASPxPageControl ID="ASPxPageControl1" Width="100%" Theme="Material" runat="server" ActiveTabIndex="0" OnActiveTabChanged="ASPxPageControl1_ActiveTabChanged">
            <TabPages>
            <dx:TabPage Text="En espera">
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
                    <dx:GridViewCommandColumn VisibleIndex="0" Caption="Editar" ButtonType="Image" Width="18%">
                        <CustomButtons>
                            <dx:GridViewCommandColumnCustomButton ID="btnEditar" Image-IconID="actions_edit_32x32devav" Visibility="AllDataRows" Text="Modificar">
                                <Image Url="css/img/Recurso 34.png">
                                </Image>
                            </dx:GridViewCommandColumnCustomButton>
                        </CustomButtons>
                    </dx:GridViewCommandColumn>
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
</asp:Content>

