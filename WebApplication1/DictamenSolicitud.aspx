<%@ Page Title="Solicitud" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="DictamenSolicitud.aspx.cs" Inherits="WebApplication1.DictamenSolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function terminaCallbackDictamen(s, e) {
            lp.Hide();
            alert(e.result);
            window.location.href = 'SolicitudesCapturadas.aspx';
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <br />
        <div style="text-align: center">
            <dx:ASPxLabel runat="server" ForeColor="White" Text="Dictamen de la Solicitud" Font-Bold="true" Theme="Material" Font-Size="22px">
            </dx:ASPxLabel>
        </div>
        <br />
        <div align="right">
            <dx:ASPxButton runat="server" ID="btnImprimir" CausesValidation="false" Theme="Material" AutoPostBack="false" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 48.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px">
                <ClientSideEvents Click="function(s, e) { window.open('ReporFichaIndividual.aspx?p='+txtClaveSolicitud.GetText(), 'Reporte ficha', ''); }" />
            </dx:ASPxButton>
        </div>
        <dx:ASPxLabel ID="ASPxLabel1" ForeColor="White" runat="server" Text="Datos de sesión" Font-Bold="true" Theme="Moderno">
        </dx:ASPxLabel>
        <table style="width: 100%">
            <tr>
                <td style="width: 10%">
                    <dx:ASPxLabel runat="server" ForeColor="White" Text="Fecha de solicitud" Theme="Material">
                    </dx:ASPxLabel>
                </td>
                <td style="width: 23%">
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSolicitud" ClientEnabled="false" ClientInstanceName="dtFechaSolicitud" Theme="Material" Width="100%">
                    </dx:ASPxDateEdit>
                </td>
                <td style="width: 10%">
                    <dx:ASPxLabel runat="server" ForeColor="White" Text="Cédula profesional" Theme="Material">
                    </dx:ASPxLabel>

                </td>
                <td style="width: 23%">
                    <dx:ASPxTextBox ID="txtCedula" ClientEnabled="false" ClientInstanceName="txtCedula" runat="server" Theme="Material" Width="100%">
                    </dx:ASPxTextBox>

                </td>
                <td style="width: 10%">
                    <dx:ASPxLabel runat="server" ForeColor="White" Text="Trámite que solicita" Theme="Material">
                    </dx:ASPxLabel>
                </td>
                <td style="width: 23%">
                    <dx:ASPxComboBox runat="server" ID="cboTipoTramite" ClientEnabled="false" ClientInstanceName="cboTipoTramite" ValueField="id_tipo_solicitud" ValueType="System.String" TextField="descripcion" Theme="Material" Width="100%" DataSourceID="SqlDataSource1">
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT id_tipo_solicitud, descripcion FROM [catalogo_de_tramites] ORDER BY descripcion"></asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel runat="server" ForeColor="White" Text="Clave de solicitud" Theme="Material" ID="lblFolio" ClientInstanceName="lblFolio">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxTextBox ID="txtClaveSolicitud" ClientInstanceName="txtClaveSolicitud" runat="server" Theme="Material" Width="100%" ClientEnabled="false">
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <dx:ASPxLabel runat="server" ForeColor="White" Text="Fecha de sesión" Theme="Material" ID="ASPxLabel7" ClientInstanceName="lblFolio">
                    </dx:ASPxLabel>
                </td>
                <td>
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSesion" ClientEnabled="false"  ClientInstanceName="dtFechaSesion" Theme="Material" Width="100%">
                    </dx:ASPxDateEdit>
                </td>
            </tr>
        </table>
        <div>
            <br />
            <dx:ASPxLabel ID="ASPxLabel2" ForeColor="White" runat="server" Text="Datos  personales" Font-Bold="true" Theme="Moderno">
            </dx:ASPxLabel>
            <table style="width: 100%; border-collapse: separate; border-spacing: 4px">
                <tr>
                    <td style="width: 8%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="A. Paterno" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 25%">
                        <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 8%">
                        <dx:ASPxLabel runat="server" Text="A. Materno" ForeColor="White" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 25%">
                        <dx:ASPxTextBox ID="txtAMaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 8%">
                        <dx:ASPxLabel runat="server" Text="Nombre(s)" ForeColor="White" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 25%">
                        <dx:ASPxTextBox ID="txtNombres" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Calle y número" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtCalleNumero" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td>
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Colonia" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxTextBox ID="txtColonia" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
            <%--      <td>
                                    <dx:ASPxLabel runat="server" ID="lblinformacion" Text="Cédula (Digital)" ForeColor="#D6D2C9" Theme="Material">
                                    </dx:ASPxLabel>
                                </td>
                           <td>
                               <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Ver</asp:LinkButton>
                               </td> --%>   
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel runat="server" ID="lblinformacion" Text="Cédula (Digital)" ForeColor="#D6D2C9" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                    <asp:GridView runat="server" ID="GridView1" BorderColor="Transparent" OnDataBinding="GridView1_DataBinding" BackColor="Transparent" ForeColor="Transparent" AutoGenerateColumns="false" RowHeaderColumn="false">
                        <Columns>
                            <asp:TemplateField>
                            <%--  --%>    <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" ForeColor="Blue" runat="server" OnClick="LinkButton1_Click">Ver</asp:LinkButton>
                                </ItemTemplate>   <%--  --%>
                            </asp:TemplateField>
                            <asp:BoundField HeaderText="" DataField="Id" Visible="false"/>
                            <asp:BoundField HeaderText="" DataField="FileName" Visible="false"/>
                            <asp:BoundField HeaderText="" DataField="FileLocation" Visible="true" ItemStyle-ForeColor="Transparent"/>
                        </Columns>
                    </asp:GridView>
                    </td> 
             <%--         <td>
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">Ver</asp:LinkButton>
                    </td>  --%>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Municipio" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox runat="server" ValueField="idMunicipio" ClientEnabled="false" ValueType="System.String" TextField="nombreMunicipioINEGI" ID="cboMunicipio" Theme="Material" Width="100%" DataSourceID="SqlDataSource2">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	                    cboRegion.PerformCallback(s.GetValue());
                        }" />
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [idMunicipio], [nombreMunicipioINEGI] FROM [tblMunicipios] ORDER BY [nombreMunicipioINEGI]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Localidad" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxCallbackPanel ID="callpanelLocalidad" ClientEnabled="false" ClientInstanceName="callpanelLocalidad" Theme="Material" runat="server" Width="100%" OnCallback="callpanelLocalidad_Callback">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades" TextField="nom_loc" ValueField="loc"></dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="dsLocalidades" runat="server" ConnectionString="<%$  ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [loc], lower([nom_loc]) as nom_loc FROM [tblLocalidades] WHERE ([mun] = @mun) ORDER BY [nom_loc]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboMunicipio" Name="mun" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                    </td>
                    <td>
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Región" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cboRegion" ValueType="System.String" OnCallback="cboRegion_Callback" ClientInstanceName="cboRegion" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    </td>
                </tr>
            </table>

            <dx:ASPxLabel ID="ASPxLabel3" ForeColor="White" runat="server" Text="Datos  de contacto" Font-Bold="true" Theme="Moderno">
            </dx:ASPxLabel>
            <br />
            <table style="width: 100%">
                <tr>
                    <td style="width: 8%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Teléfono local" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 25%">
                        <dx:ASPxTextBox ID="txtTelLocal" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 8%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Teléfono celular" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 25%">
                        <dx:ASPxTextBox ID="txtTelCelular" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                    <td style="width: 8%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Correo electrónico" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 25%">
                        <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>
            <br />

            <dx:ASPxLabel ID="ASPxLabel4" runat="server" ForeColor="White" Text="Datos Profesionales" Font-Bold="true" Theme="Moderno">
            </dx:ASPxLabel>
            <br />
            <table style="width: 100%">
                <tr>
                    <td style="width: 10%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Profesión" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 40%">
                        <dx:ASPxComboBox runat="server" TextField="Descripcion" ClientEnabled="false" ValueType="System.String" ValueField="Id_Profesion"
                            Theme="Material" ID="cboProfesion"
                            Width="100%" DataSourceID="SqlDataSource3" CallbackPageSize="15"
                            EnableCallbackMode="True" EnableViewState="false">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                    </td>
                    <td style="width: 10%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Egresado de " Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 40%">
                        <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material"
                            ID="cboEgresado" Width="100%"
                            DataSourceID="SqlDataSource4" CallbackPageSize="15"
                            EnableCallbackMode="True" EnableViewState="false">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Universidad], [Descripcion] FROM [tblUniversidades] ORDER BY [Descripcion]"></asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <table style="width: 100%">
                <tr>
                    <td style="width: 10%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Fecha título" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 40%">
                        <dx:ASPxDateEdit runat="server" ID="dtFechaTitulo" ClientEnabled="false" Theme="Material" Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                    <td style="width: 10%">
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Fecha cédula" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td style="width: 40%">
                        <dx:ASPxDateEdit runat="server" ID="dtFechaCedula" ClientEnabled="false" Theme="Material" Width="100%">
                        </dx:ASPxDateEdit>
                    </td>
                </tr>
            </table>
            <div>
                <dx:ASPxLabel runat="server" ForeColor="White" Text="Cursos de actualización o postgrado" Theme="Material">
                </dx:ASPxLabel>
                <dx:ASPxMemo ID="txtCursos" runat="server" Theme="Material" ClientEnabled="false" Width="100%" Height="60px">
                    <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                        <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                    </ValidationSettings>
                </dx:ASPxMemo>
            </div>
            <div>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 20%">
                            <dx:ASPxLabel runat="server" ForeColor="White" Text="Colegio" Theme="Material">
                            </dx:ASPxLabel>
                        </td>
                        <td style="width: 80%">
                            <dx:ASPxComboBox runat="server" ValueField="Id_Colegio" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material"
                                ID="cboColegio" Width="100%"
                                DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                EnableCallbackMode="True" EnableViewState="false">
                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
            </div>
            <dx:ASPxLabel ID="ASPxLabel5" runat="server" ForeColor="White" Text="Registro SINFRA" Font-Bold="true" Theme="Moderno">
            </dx:ASPxLabel>
            <br />
            <table style="width: 100%">
                <tr>
                    <td>
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Año de registro SINFRA" Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <dx:ASPxSpinEdit ID="txtAñoRegistro" ClientEnabled="false" runat="server" Theme="Material">
                        </dx:ASPxSpinEdit>
                    </td>
                    <td>
                        <dx:ASPxLabel runat="server" ForeColor="White" Text="Registro de D.R.O." Theme="Material">
                        </dx:ASPxLabel>
                    </td>
                    <td>
                        <table>
                            <tr>
                                <td>
                                    <dx:ASPxComboBox ID="cboClasificacion" NullText="Clasificación" ClientEnabled="false" runat="server" Theme="Material" ValueType="System.String">
                                        <Items>
                                            <dx:ListEditItem Text="A" Value="A" />
                                            <dx:ListEditItem Text="B" Value="B" />
                                            <dx:ListEditItem Text="C" Value="C" />
                                        </Items>

                                    </dx:ASPxComboBox>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="txtRegistroDRO" NullText="Folio" ClientEnabled="false" runat="server" Theme="Material">
                                    </dx:ASPxTextBox>
                                </td>
                                <td>
                                    <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                    <dx:ASPxComboBox ID="cboClaveProfesion" DataSourceID="SqlDataSource6" NullText="Clave Profesión" ClientEnabled="false" runat="server" Theme="Material" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion">
                                    </dx:ASPxComboBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </div>
        <br />
        <br />
        <div align="center">
            <dx:ASPxLabel ID="ASPxLabel6" runat="server" ForeColor="White" Text="Respuesta a su solicitud" Font-Bold="true" Theme="Moderno">
            </dx:ASPxLabel>
        </div>
        <table style="width: 100%">
            <tr style="height:50px">
                <td style="width: 20%; height:20px">
                    <dx:ASPxLabel Theme="Material" ForeColor="White" runat="server" Text="Estado de trámite">
                    </dx:ASPxLabel>
                </td>
                <td style="width: 20%">
                    <dx:ASPxComboBox runat="server" ID="rdstatus" Theme="Material" Width="95%">
                    <Items>
                        <dx:ListEditItem Text="Autorizado" Value="Autorizado" />
                        <dx:ListEditItem Text="Rechazado" Value="Rechazado" />
                    </Items>
                    </dx:ASPxComboBox>
                </td>
         <%--      <td style="width: 10%">
                    <dx:ASPxRadioButton ID="rdAutorizado" runat="server" Theme="Material" Text="Autorizado" ForeColor="White" GroupName="dictamen">                        
                    </dx:ASPxRadioButton>
                </td>  
             --%>
        <%--         <td style="width: 10%">
                    <dx:ASPxRadioButton runat="server" ID="rdRechazado" Theme="Material" Text="Rechazado" ForeColor="White" GroupName="dictamen">                       
                    </dx:ASPxRadioButton>
                </td> 
           --%>  
                <td style="width: 20%"></td>
                <td style="width: 20%">
                    <dx:ASPxLabel Theme="Material" ForeColor="White" runat="server" Text="Trámite que procedió">
                    </dx:ASPxLabel>
                </td>
                <td style="width: 20%">
                    <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cbTramiteProcede" ClientInstanceName="cbTramiteProcede" ValueField="id_tipo_solicitud" ValueType="System.String" TextField="descripcion" Theme="Material" Width="100%" DataSourceID="SqlDataSource1">
                        <ValidationSettings SetFocusOnError="True" ErrorText="">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td>
                    <dx:ASPxLabel Theme="Material" ForeColor="White" runat="server" Text="Observaciones">
                    </dx:ASPxLabel>
                </td>
                <td colspan="5">
                    <dx:ASPxMemo runat="server" ID="txtObservacionesDictamen" Width="800px" Theme="Material" Height="40px">
                        <ValidationSettings SetFocusOnError="True" ErrorText="">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxMemo>
                </td>
            </tr>
        </table>
        <br />
        <div>
            <table>
                <tr>
                    <td>
                        <dx:ASPxButton runat="server" Theme="Material" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 57.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px">
                            <ClientSideEvents Click="function(s, e) {
window.location.href='solicitudes.aspx';	
}" />
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;&nbsp;
                    </td>
                    <td>
                        <dx:ASPxButton runat="server" Theme="Material" ID="btnGuardar" AutoPostBack="false" ClientInstanceName="btnGuardar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 56.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px" OnClick="btnGuardar_Click">
                            <ClientSideEvents Click="function(s, e) {
                                if(ASPxClientEdit.AreEditorsValid()){
                                lp.Show();
                                 cbGuardar.PerformCallback();
                                }
}" />
                        </dx:ASPxButton>
                    </td>
                </tr>
            </table>

            <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server">
            </dx:ASPxLoadingPanel>
            <dx:ASPxCallback ID="cbGuardar" ClientInstanceName="cbGuardar" OnCallback="cbGuardar_Callback" runat="server">
                <ClientSideEvents  CallbackComplete="function(s, e) {
	terminaCallbackDictamen(s,e);
}" />
            </dx:ASPxCallback>
        </div>
    </div>
</asp:Content>
