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
        <div style="width:100%; text-align:center;padding-bottom:10px;">
            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Font-Bold="true" ForeColor="#D6D2C9" Font-Size="18pt" Text="Reporte por Región"></dx:ASPxLabel>
        </div>
        
        <div style="padding-bottom:15px;">
        <table>
            <tr>
                <td style="width:100px">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Región:" ForeColor="#D6D2C9" Theme="Material"></dx:ASPxLabel>
                </td>
                <td style="width:180px">
                    <dx:ASPxComboBox ID="cboRegion" Width="160px" runat="server" ValueType="System.String" Theme="Material"></dx:ASPxComboBox>
                    <dx:ASPxGridViewExporter ID="gvExporter" runat="server" GridViewID="gvReporte">
                    </dx:ASPxGridViewExporter>
                </td>
                <td>
                    <dx:ASPxButton ID="btnConsultar" runat="server" Theme="Material" AutoPostBack="False" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 58.png" BackgroundImage-Repeat="NoRepeat" Width="180px" Height="45px">
                        <ClientSideEvents Click="function(s, e) { AplicaFiltro(s, e); }" />
                    </dx:ASPxButton>
                </td>
                <td>&nbsp;&nbsp;&nbsp;</td>
                <td>
                    <dx:ASPxButton ID="btnExportar" runat="server" Theme="Material" OnClick="btnExportar_Click" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 59.png" BackgroundImage-Repeat="NoRepeat" Width="180px" Height="45px">
                        
                    </dx:ASPxButton>
                </td>
            </tr>
        </table></div>
        <dx:ASPxGridView ID="gvReporte" ClientInstanceName="gvReporte" Width="100%" runat="server" Theme="Material" OnCustomCallback="gvReporete_CustomCallback" OnDataBinding="gvReporete_DataBinding" AutoGenerateColumns="False">
            <Settings HorizontalScrollBarMode="Visible" ShowGroupPanel="True" ShowHeaderFilterButton="True" />
            <Columns>
                <dx:GridViewDataTextColumn Caption="Folio" FieldName="Folio" VisibleIndex="1">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Fecha de entrega" Width="150px" FieldName="fecha_de_entrega_de_licencia" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nombre" Width="180px" FieldName="nombre" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Registro" Width="120px" FieldName="Registro" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cédula" FieldName="cedula_profesional" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Región" FieldName="region" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Id Municipio" FieldName="municipio" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Municipio" Width="160px" FieldName="NombreMunicipio" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Id Localidad" FieldName="Idlocalidad" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Localidad" Width="160px" FieldName="NombreLocalidad" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Trámite" Width="135px" FieldName="tramite" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Año" FieldName="año" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
</asp:Content>