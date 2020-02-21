<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="validar_documentos.aspx.cs" Inherits="WebApplication1.validar_documentos" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function terminaCallbackDictamen(s, e) {
            var htmlData = e.result.split('|');
            if (htmlData[0] == "true") {
                lp.Hide();
                var ubicacion = "asignador.aspx"
                console.log(htmlData[1])
                notexitoso(htmlData[1], ubicacion);
            } else {
                notificacionerror(htmlData[1]);
            }
        };
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
        <div class="container-fluid">
            <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Validación de documentos</strong>
            </h1>
        </div>
    </div>
    <div class="container-fluid">
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos de sesión</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Fecha de solicitud</label>
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSolicitud" ClientEnabled="false" ClientInstanceName="dtFechaSolicitud" 
                        Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                    </dx:ASPxDateEdit>
                </div>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientVisible="false" Text=""></dx:ASPxLabel>
                <div class="form-label-group col-md-4">
                    <label>Cédula profesional</label>
                    <dx:ASPxTextBox ID="txtCedula" ClientEnabled="false" ClientInstanceName="txtCedula" runat="server" Theme="Material" 
                        Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Trámite que solicita</label>
                    <dx:ASPxComboBox runat="server" ID="cboTipoTramite" ClientEnabled="false" ClientInstanceName="cboTipoTramite" 
                        ValueField="id_tipo_solicitud" ValueType="System.String" TextField="descripcion" Theme="Material" Width="100%" 
                        DataSourceID="SqlDataSource1" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT id_tipo_solicitud, descripcion FROM [catalogo_de_tramites] ORDER BY descripcion"></asp:SqlDataSource>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Folio de solicitud</label>
                    <dx:ASPxTextBox ID="txtClaveSolicitud" ClientInstanceName="txtClaveSolicitud" runat="server" Theme="Material" Width="100%"
                         ClientEnabled="false" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSesion" ClientEnabled="false" ClientVisible="false" ClientInstanceName="dtFechaSesion" 
                        Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                    </dx:ASPxDateEdit>
                </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Nombre(s)</label>
                    <dx:ASPxTextBox ID="txtNombres" runat="server" ClientEnabled="false" Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>A. Paterno</label>
                    <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>A. Materno</label>
                    <dx:ASPxTextBox ID="txtAMaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                            
                </div>
                
                <div class="form-label-group col-md-4">
                    <label>Calle y número</label>
                    <dx:ASPxTextBox ID="txtCalleNumero" runat="server" ClientEnabled="false" Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Colonia</label>
                    <dx:ASPxTextBox ID="txtColonia" runat="server" Theme="Material" ClientEnabled="false" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Municipio</label>
                     <dx:ASPxComboBox runat="server" ValueField="idMunicipio" ClientEnabled="false" ValueType="System.String" TextField="nombreMunicipioINEGI" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                         ID="cboMunicipio" Theme="Material" Width="100%" DataSourceID="SqlDataSource2">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                     </dx:ASPxComboBox>
                     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [idMunicipio], [nombreMunicipioINEGI] FROM [tblMunicipios] ORDER BY [nombreMunicipioINEGI]"></asp:SqlDataSource>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Localidad</label>
                    <dx:ASPxCallbackPanel ID="callpanelLocalidad" ClientEnabled="false" ClientInstanceName="callpanelLocalidad" Theme="Material" runat="server" Width="100%" OnCallback="callpanelLocalidad_Callback">
                            <PanelCollection>
                                <dx:PanelContent runat="server">
                                    <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades" 
                                        TextField="nom_loc" ValueField="loc" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">

                                    </dx:ASPxComboBox>
                                    <asp:SqlDataSource ID="dsLocalidades" runat="server" ConnectionString="<%$  ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [loc], lower([nom_loc]) as nom_loc FROM [tblLocalidades] WHERE ([mun] = @mun) ORDER BY [nom_loc]">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboMunicipio" Name="mun" PropertyName="Value" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </dx:PanelContent>
                            </PanelCollection>
                    </dx:ASPxCallbackPanel>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Región</label>
                    <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cboRegion" ValueType="System.String" ClientInstanceName="cboRegion" DataSourceID="dsRegion" TextField="nombre" 
                        ValueField="id" Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="dsRegion" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="select distinct id, Nombre from dbo.tblRegion as reg left join dbo.tblRegionesMunicipios as regm on reg.Id = regm.idRegion;"></asp:SqlDataSource>
                </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos de contacto</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Teléfono local</label>
                    <dx:ASPxTextBox ID="txtTelLocal" runat="server" ClientEnabled="false" Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Teléfono celular</label>
                    <dx:ASPxTextBox ID="txtTelCelular" runat="server" ClientEnabled="false" Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Correo electrónico</label>
                     <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" ClientEnabled="false" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos profesionales</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Profesión</label>
                    <dx:ASPxComboBox runat="server" TextField="Descripcion" ClientEnabled="false" ValueType="System.String" ValueField="Id_Profesion"
                            Theme="Material" ID="cboProfesion" DisabledStyle-ForeColor="Gray"
                            Width="100%" DataSourceID="SqlDataSource3" CallbackPageSize="15"
                            EnableCallbackMode="True" EnableViewState="false" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Institución de egreso</label>
                    <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material"
                            ID="cboEgresado" Width="100%" DisabledStyle-ForeColor="Gray"
                            DataSourceID="SqlDataSource4" CallbackPageSize="15"
                            EnableCallbackMode="True" EnableViewState="false" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Universidad], [Descripcion] FROM [tblUniversidades] ORDER BY [Descripcion]"></asp:SqlDataSource>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Fecha de título</label>
                    <dx:ASPxDateEdit runat="server" ID="dtFechaTitulo" ClientEnabled="false" Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                        </dx:ASPxDateEdit>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Fecha de cédula</label>
                     <dx:ASPxDateEdit runat="server" ID="dtFechaCedula" ClientEnabled="false" Theme="Material" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                        </dx:ASPxDateEdit>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Cursos de actualización o postgrado</label>
                     <dx:ASPxMemo ID="txtCursos" runat="server" Theme="Material" ClientEnabled="false" Width="100%" DisabledStyle-ForeColor="Gray" CssClass="form-control">
                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxMemo>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Colegio de pertenecia</label>
                     <dx:ASPxComboBox runat="server" ValueField="Id_Colegio" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material"
                                ID="cboColegio" Width="100%" DisabledStyle-ForeColor="Gray"
                                DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                EnableCallbackMode="True" EnableViewState="false" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>  
                 </div>
                <div class="form-label-group col-md-4">
                    </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Documentos</p>


        <asp:Panel ID="doc_registro" runat="server" Visible="false">
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Comprobante de Pago">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Pagos/"+ASPxLabel1.Text+"/pago.pdf") %>'
                            Text="Ver">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
</div>
                                        <div class="form-label-group col-md-4">
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Credencial de elector">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Elector/"+ASPxLabel1.Text+"/ine.pdf") %>'
                            Text="Ver">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                                            <br />
                                            <br />
                                            </div>

                                        <div class="form-label-group col-md-4">
                                             <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Comprobante de domicilio">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Domicilio/"+ASPxLabel1.Text+"/domicilio.pdf") %>'
                            Text="Ver">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                                            <br />
                                            <br />
                                            </div>
                                        </div>
                                    <div class="row">
                                        <div class="form-label-group col-md-4">
                                           <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Acta de nacimiento">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Nacimiento/"+ASPxLabel1.Text+"/acta.pdf") %>'
                            Text="Ver">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="form-label-group col-md-4">
                                             <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Curriculum Vitae">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Vitae/"+ASPxLabel1.Text+"/cv.pdf") %>'
                            Text="Ver">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="form-label-group col-md-4">
                                                     <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Fotografia">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Foto/"+ASPxLabel1.Text+"/cedula.png") %>'
                            Text="Ver">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                                        </div>
                                        </div>
                                    <div class="row">
                                        <div class="form-label-group col-md-4">
                                                     <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Cedula Profesional">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Cedulas/"+ASPxLabel1.Text+"/cedula.pdf") %>'
                            Text="Ver">
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>

                                            </div>
                                    </div>
                                    </div>
            </asp:Panel>

        <asp:Panel ID="doc_revalida" runat="server" Visible="false">
            <div class="form-group">
                                    <div class="row" >
                                        
                                        <div class="form-label-group col-md-4">
                                            <label>Solicitud de Revalidación</label>
                                            <asp:GridView ID="GridView11" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Revalida/Solicitud/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
</div>
                                        <div class="form-label-group col-md-4">
                                            <label>Comprobante de pago</label>
                                            <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Revalida/Pagos/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
</div>
                                        <div class="form-label-group col-md-4">
                                            <label>Credencial de D. R. O.</label>
                                            <asp:GridView ID="GridView9" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Revalida/Credencial/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
</div>
                                        <div class="form-label-group col-md-4">
                                            <label>Oficio de Licencia de D. R. O.</label>
                                            <asp:GridView ID="GridView10" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Revalida/Oficio/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
</div>
                                        </div>
                </div>
            </asp:Panel>

        <asp:Panel ID="RevaRecla" runat="server" Visible="false">
            <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Solicitud de Revalidación con Reclasificación</label>
                                            <asp:GridView ID="GridView12" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_RevalidayRecla/Solicitud/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Comprobante de pago</label>
                                            <asp:GridView ID="GridView13" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_RevalidayRecla/Pagos/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>
        <div class="form-label-group col-md-4">
                                                    <label>Credencial de D. R. O.</label>
                                                    <asp:GridView ID="GridView14" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" DataKeyNames="Name">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre Archivo">
                            <ItemTemplate>
                                <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_RevalidayRecla/Credencial/"+ASPxLabel1.Text+"/{0}") %>'
                                    Text='<%# Eval("Name") %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                        </div>
                                         <div class="form-label-group col-md-4">
                                                    <label>Oficio de Licencia de D. R. O.</label>
                                                    <asp:GridView ID="GridView15" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" DataKeyNames="Name">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre Archivo">
                            <ItemTemplate>
                                <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_RevalidayRecla/Oficios/"+ASPxLabel1.Text+"/{0}") %>'
                                    Text='<%# Eval("Name") %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                        </div>
                                        </div>
                <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Cursos</label>
                                            <asp:GridView ID="GridView16" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_RevalidayRecla/Cursos/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>
                    <div class="form-label-group col-md-4">
                                            <label>Curriculum Vitae</label>
                                            <asp:GridView ID="GridView17" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_RevalidayRecla/CV/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>
                    </div>
                </div>
            </asp:Panel>

        <asp:Panel ID="reclasifica" runat="server" Visible="false">
            <div class="form-group">
                                    <div class="row" style="height:120px">
                                        <div class="form-label-group col-md-4">
                                            <label>Solicitud de Revalidación con Reclasificación</label>
                                            <asp:GridView ID="GridView18" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Recla/Solicitud/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>
            <div class="form-label-group col-md-4">
                                                        <label>Credencial de D. R. O.</label>
                                                        <asp:GridView ID="GridView20" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        ForeColor="#333333" GridLines="None" DataKeyNames="Name">
                        <RowStyle BackColor="#EFF3FB" />
                        <Columns>
                            <asp:TemplateField HeaderText="Nombre Archivo">
                                <ItemTemplate>
                                    <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Recla/Credencial/"+ASPxLabel1.Text+"/{0}") %>'
                                        Text='<%# Eval("Name") %>'>
                                    </asp:HyperLink>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#2461BF" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                            </div>  
                                        <div class="form-label-group col-md-4">
                                            <label>Oficio de Licencia de D. R. O.</label>
                                            <asp:GridView ID="GridView21" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Recla/Oficios/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>


                                        </div>
                <div class="row" >
                    
        <div class="form-label-group col-md-4">
                                                    <label>Cursos</label>
                                                    <asp:GridView ID="GridView22" runat="server" AutoGenerateColumns="False" CellPadding="4"
                    ForeColor="#333333" GridLines="None" DataKeyNames="Name">
                    <RowStyle BackColor="#EFF3FB" />
                    <Columns>
                        <asp:TemplateField HeaderText="Nombre Archivo">
                            <ItemTemplate>
                                <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Recla/Cursos/"+ASPxLabel1.Text+"/{0}") %>'
                                    Text='<%# Eval("Name") %>'>
                                </asp:HyperLink>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#2461BF" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Curriculum Vitae</label>
                                            <asp:GridView ID="GridView23" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Recla/CV/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>

                    </div>
                </div>
            </asp:Panel>

        <asp:Panel ID="ReponCrede" runat="server" Visible="false">
            <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Comprobante de Pago</label>
                                            <asp:GridView ID="GridView19" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Credencial/Pagos/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                </div>
                                        </div>
                </div>
            </asp:Panel>
        <label>Folio de captura</label>
        <dx:ASPxTextBox ID="folio_pago" runat="server" ReadOnly="true" Theme="Material" Width="20%" DisabledStyle-ForeColor="Gray" CssClass="form-control"></dx:ASPxTextBox>
        <p class="text-center text-black rounded h5" style="background-color: lightgreen"></p>
        <div class="form-group">
            <div class="row" >
                
                <div class="form-label-group col-md-8">
                    <label>Notas</label>
                    <dx:ASPxMemo runat="server" ID="txtObservacionesDictamen" Width="100%" Theme="Material" CssClass="form-control" >
                        <ValidationSettings SetFocusOnError="True" ErrorText="">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxMemo>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row  justify-content-center" >
                <div class="form-label-group text-center col-md-2">
                    <dx:ASPxButton runat="server" Theme="Material" ID="btnGuardar" AutoPostBack="false" ClientInstanceName="btnGuardar" Border-BorderStyle="None" 
                          Text="Aceptar"  CssClass="mr-2 btn btn-aceptar" width="100%" >
                        <Image Url="~/css/img/aceptar.png"></Image> 
                            <ClientSideEvents Click="function(s, e) {
                                if(ASPxClientEdit.AreEditorsValid()){
                                lp.Show();
                                 cbGuardar.PerformCallback();
                                }
                                }" />
                        </dx:ASPxButton>
                </div>
                <div class="form-label-group text-center col-md-2">
                    <dx:ASPxButton runat="server" Theme="Material" ID="btnRechazar" AutoPostBack="false" ClientInstanceName="btnRechazar" Border-BorderStyle="None" 
                        Text="Rechazar"  CssClass="mr-2 btn btn-rechazar" width="100%" >
                        <Image Url="~/css/img/rechazar.png"></Image> 
                            <ClientSideEvents Click="function(s, e) {
                                if(ASPxClientEdit.AreEditorsValid()){
                                lp.Show();
                                 cbRechazar.PerformCallback();
                                }
                                }" />
                        </dx:ASPxButton>
                </div>
                <div class="form-label-group text-center col-md-2">
                        <dx:ASPxButton runat="server" Theme="Material" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None" 
                            Text="Cancelar" CssClass="mr-2 btn btn-cancelar" width="100%">
                            <Image Url="~/css/img/cancelar.png"></Image> 
                            <ClientSideEvents Click="function(s, e) {
                                window.location.href='asignador.aspx';	
                                }" />
                        </dx:ASPxButton>
                </div>
                   <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server" Modal="true">
            </dx:ASPxLoadingPanel>
            <dx:ASPxCallback ID="cbGuardar" ClientInstanceName="cbGuardar" OnCallback="cbGuardar_Callback" runat="server">
                <ClientSideEvents  CallbackComplete="function(s, e) {
	                    terminaCallbackDictamen(s,e);
                    }" />
            </dx:ASPxCallback>
                <dx:ASPxCallback ID="cbRechazar" ClientInstanceName="cbRechazar" OnCallback="cbRechazar_Callback" runat="server">
                <ClientSideEvents  CallbackComplete="function(s, e) {
	                    terminaCallbackDictamen(s,e);
                    }" />
            </dx:ASPxCallback>       
            </div>
        </div>
      <div>
      </div>
    </div>
</asp:Content>