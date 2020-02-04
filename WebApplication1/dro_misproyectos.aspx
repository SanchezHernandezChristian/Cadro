<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="dro_misproyectos.aspx.cs" Inherits="WebApplication1.dro_misproyectos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <script>
        function CustomButtonClick(s, e) {
            key = s.GetRowKey(e.visibleIndex);
            switch (e.buttonID) {
                case "btnEdit":
                    location.href = "dro_detalleproyectos.aspx?action=Edit&id=" + key;
                    break;
            }
        }      
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
                                            </dx:MenuItem>
                                        </Items>
            </dx:ASPxMenu>
    </div>
    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-3">
        <div class="container-fluid row mx-4 ">
            <h1 class="h4 col-5"><strong>Plataforma para la Inversión en Infraestructura</strong>
            </h1>
        </div>
    </div>
    <div class="container-fluid">
    <dx:ASPxGridView ID="gvProyectos"  runat="server" ClientInstanceName="gvProyectos" Font-Size="10pt" KeyFieldName="IdProyecto" OnDataBinding="gvProyectos_DataBinding" OnCustomCallback="gvProyectos_CustomCallback" AutoGenerateColumns="False" Theme="Material" Width="100%"  OnCustomButtonInitialize="gvProyectos_CustomButtonInitialize">
         <ClientSideEvents CustomButtonClick="CustomButtonClick"  />
        <Border BorderStyle="None" />
         <SettingsPager PageSize="50">
         </SettingsPager>
        <Settings GridLines="Vertical" ShowFilterRow="True" ShowHeaderFilterButton="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" />
        <SettingsBehavior AllowSelectByRowClick="true" />
        <SettingsSearchPanel Visible="True" />
        <Columns>
            <dx:GridViewCommandColumn Caption="OPCIONES" Name="Comandos" ShowInCustomizationForm="True" VisibleIndex="0" Width="120px" ShowNewButtonInHeader="false" FixedStyle="Left">
                <CustomButtons>
                    <dx:GridViewCommandColumnCustomButton ID="btnEdit" Text="Editar" Visibility="AllDataRows">
                    </dx:GridViewCommandColumnCustomButton>
                </CustomButtons>
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn FieldName="IdProyecto" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1" Width="40px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Folio" FieldName="Folio" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Status" FieldName="StStatusProyecto" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="StatusProyecto" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Proyecto" FieldName="StProyecto" ShowInCustomizationForm="True" VisibleIndex="7" Width="300px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Tipo" FieldName="StTipoProyecto" ShowInCustomizationForm="True" VisibleIndex="8" Width="200px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Idmunicipio" ShowInCustomizationForm="True" Visible="False" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Municipio" FieldName="StMunicipio" ShowInCustomizationForm="True" VisibleIndex="10" Width="200px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Idlocalidad" ShowInCustomizationForm="True" Visible="False" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Localidad" FieldName="StLocalidad" ShowInCustomizationForm="True" VisibleIndex="12" Width="200px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IdCatProyecto" ShowInCustomizationForm="True" Visible="False" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataSpinEditColumn Caption="Monto Total" FieldName="MontoTotal" ShowInCustomizationForm="True" VisibleIndex="14" Width="150px">
                <PropertiesSpinEdit DecimalPlaces="2" DisplayFormatString="c" NumberFormat="Custom" MinValue="0" MaxValue="10000000000000000000000">
                </PropertiesSpinEdit>
            </dx:GridViewDataSpinEditColumn>
            <dx:GridViewDataTextColumn Caption="Meta" FieldName="Meta" ShowInCustomizationForm="True" VisibleIndex="15" Width="150px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Unidad/Medida" FieldName="StUnidadMedida" ShowInCustomizationForm="True" VisibleIndex="16" Width="150px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Observaciones" FieldName="ObservacionesProyecto" ShowInCustomizationForm="True" Visible="False" VisibleIndex="17" Width="200px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nombre de Contacto" FieldName="NombreContacto" ShowInCustomizationForm="True" Visible="False" VisibleIndex="18" Width="40px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Correo" FieldName="Correo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19" Width="40px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Teléfono" FieldName="Telefono" ShowInCustomizationForm="True" Visible="False" VisibleIndex="20" Width="40px">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="FechaCapturaProyeto" ShowInCustomizationForm="True" Visible="False">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Latitud" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="Longitud" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
        <GroupSummary>
            <dx:ASPxSummaryItem DisplayFormat="c" FieldName="MontoTotal" SummaryType="Sum" ValueDisplayFormat="c" />
        </GroupSummary>
        <Styles>
            <Header BackColor="#4D4C51" Border-BorderColor="White" Font-Bold="False" ForeColor="White" Paddings-PaddingBottom="5px" Paddings-PaddingTop="5px" Font-Size="10pt">
<Paddings PaddingTop="5px" PaddingBottom="5px"></Paddings>
            </Header>
            <SelectedRow BackColor="#E2F1EC" Font-Bold="True" ForeColor="Black">
            </SelectedRow>
            <Cell CssClass="SinFondo" ForeColor="Black" Font-Size="9pt" Paddings-PaddingBottom="5px" Paddings-PaddingTop="5px">
<Paddings PaddingTop="5px" PaddingBottom="5px"></Paddings>
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
        </div>
</asp:Content>
