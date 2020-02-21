<%@ Page Title="Dictamen de Solicitud" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="DictamenSolicitud.aspx.cs" Inherits="WebApplication1.DictamenSolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function terminaCallbackDictamen(s, e) {
            var htmlData = e.result.split('|');
            if (htmlData[0] == "true") {
                lp.Hide();
                var ubicacion = "solicitudes.aspx"
                console.log(htmlData[1])
                notexitoso(htmlData[1], ubicacion);
            } else {
                notificacionerror(htmlData[1]);
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
        <div class="container-fluid">
            <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Dictamen de la solicitud</strong>
            </h1>
        </div>
    </div>
    <div class="container-fluid">
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos de sesión</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Fecha solicitud</label>
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSolicitud" ClientEnabled="false" ClientInstanceName="dtFechaSolicitud" DisabledStyle-ForeColor="Gray" Theme="Material" Width="100%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                    </dx:ASPxDateEdit>
                           
                </div>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientVisible="false" Text=""></dx:ASPxLabel>
                <div class="form-label-group col-md-4">
                    <label>Cédula profesional</label>
                    <dx:ASPxTextBox ID="txtCedula" ClientEnabled="false" ClientInstanceName="txtCedula" runat="server" DisabledStyle-ForeColor="Gray" Theme="Material" Width="100%" CssClass="form-control">
                    </dx:ASPxTextBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Trámite que solicita</label>
                    <dx:ASPxComboBox runat="server" ID="cboTipoTramite" ClientEnabled="false" ClientInstanceName="cboTipoTramite" ValueField="id_tipo_solicitud" ValueType="System.String" 
                        TextField="descripcion" Theme="Material" Width="100%" DataSourceID="SqlDataSource1" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys" DisabledStyle-ForeColor="Gray">
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT id_tipo_solicitud, descripcion FROM [catalogo_de_tramites] ORDER BY descripcion"></asp:SqlDataSource>
              
                </div>
                <div class="form-label-group col-md-4">
                    <label>Clave de solicitud</label>
                    <dx:ASPxTextBox ID="txtClaveSolicitud" ClientInstanceName="txtClaveSolicitud" runat="server" Theme="Material" Width="100%" ClientEnabled="false" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                    </dx:ASPxTextBox>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Fecha de sesion</label>
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSesion" ClientEnabled="false"  ClientInstanceName="dtFechaSesion" Theme="Material" 
                        Width="100%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys" DisabledStyle-ForeColor="Gray">
                    </dx:ASPxDateEdit>

                </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Nombre(s)</label>
                    <dx:ASPxTextBox ID="txtNombres" runat="server" ClientEnabled="false" Theme="Material" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom" >
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>A. Paterno</label>
                    <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                           
                </div>
                <div class="form-label-group col-md-4">
                    <label>A. Materno</label>
                    <dx:ASPxTextBox ID="txtAMaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                            
                </div>
                
                <div class="form-label-group col-md-4">
                    <label>Calle y número</label>
                    <dx:ASPxTextBox ID="txtCalleNumero" runat="server" ClientEnabled="false" Theme="Material" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Colonia</label>
                    <dx:ASPxTextBox ID="txtColonia" runat="server" Theme="Material" ClientEnabled="false" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>

                </div>
                <div class="form-label-group col-md-4">
                </div>
                <div class="form-label-group col-md-4">
                    <label>Región</label>
                    <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cboRegion" ValueType="System.String" TextField="nombre" ValueField="id" DisabledStyle-ForeColor="Gray"
                        DataSourceID="dsRegion" ClientInstanceName="cboRegion" Theme="Material" Width="100%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="dsRegion" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="select distinct id, Nombre from dbo.tblRegion as reg left join dbo.tblRegionesMunicipios as regm on reg.Id = regm.idRegion;"></asp:SqlDataSource>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Municipio</label>
                     <dx:ASPxComboBox runat="server" ValueField="idMunicipio" ClientEnabled="false" ValueType="System.String" TextField="nombreMunicipioINEGI" DisabledStyle-ForeColor="Gray"
                         ID="cboMunicipio" Theme="Material" Width="100%" DataSourceID="SqlDataSource2" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
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
                                    <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades" DisabledStyle-ForeColor="Gray"
                                        TextField="nom_loc" ValueField="loc" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">

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
                
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos de contacto</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Teléfono local</label>
                    <dx:ASPxTextBox ID="txtTelLocal" runat="server" ClientEnabled="false" Theme="Material" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Teléfono celular</label>
                    <dx:ASPxTextBox ID="txtTelCelular" runat="server" ClientEnabled="false" Theme="Material" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Correo electrónico</label>
                     <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" ClientEnabled="false" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
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
                    <dx:ASPxComboBox runat="server" TextField="Descripcion" ClientEnabled="false" ValueType="System.String" ValueField="Id_Profesion" DisabledStyle-ForeColor="Gray"
                            Theme="Material" ID="cboProfesion" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                            Width="100%" DataSourceID="SqlDataSource3" CallbackPageSize="15"
                            EnableCallbackMode="True" EnableViewState="false">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                           
                </div>
                <div class="form-label-group col-md-4">
                    <label>Institución de egreso</label>
                    <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material" DisabledStyle-ForeColor="Gray"
                            ID="cboEgresado" Width="100%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                            DataSourceID="SqlDataSource4" CallbackPageSize="15"
                            EnableCallbackMode="True" EnableViewState="false">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Universidad], [Descripcion] FROM [tblUniversidades] ORDER BY [Descripcion]"></asp:SqlDataSource>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Fecha de título</label>
                    <dx:ASPxDateEdit runat="server" ID="dtFechaTitulo" ClientEnabled="false" Theme="Material" Width="100%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys" DisabledStyle-ForeColor="Gray"> 
                        </dx:ASPxDateEdit>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Fecha de cédula</label>
                     <dx:ASPxDateEdit runat="server" ID="dtFechaCedula" ClientEnabled="false" Theme="Material" Width="100%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys" DisabledStyle-ForeColor="Gray">
                        </dx:ASPxDateEdit>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Cursos de actualización o postgrado</label>
                     <dx:ASPxMemo ID="txtCursos" runat="server" Theme="Material" ClientEnabled="false" Width="100%" CssClass="form-control" DisabledStyle-ForeColor="Gray">
                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxMemo>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Colegio de pertenecia</label>
                     <dx:ASPxComboBox runat="server" ValueField="Id_Colegio" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material" DisabledStyle-ForeColor="Gray"
                                ID="cboColegio" Width="100%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                EnableCallbackMode="True" EnableViewState="false">
                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>  
                 </div>
            </div>
        </div>

        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Documentos</p>
                             
        <asp:Panel ID="doc_registro" runat="server" Visible="false">
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Comprobante de pago</label>
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Pagos/"+ASPxLabel1.Text+"/{0}") %>'
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
                                            <label>Credencial de elector</label>
                                            
                                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Elector/"+ASPxLabel1.Text+"/{0}") %>'
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
                                            <br />
                                            <br />
                                            </div>

                                        <div class="form-label-group col-md-4">
                                            <label>Comprobante de domicilio</label>
                                            
                                             <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Domicilio/"+ASPxLabel1.Text+"/{0}") %>'
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
                                            <br />
                                            <br />
                                            </div>
                                        </div>
                                    <div class="row">
                                        <div class="form-label-group col-md-4">
                                            <label>Acta de nacimiento</label>
                                            
                                           <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Nacimiento/"+ASPxLabel1.Text+"/{0}") %>'
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
                                            <br />
                                            <br />
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Curriculum Vitae</label>
                                             <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Vitae/"+ASPxLabel1.Text+"/{0}") %>'
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
                                            <br />
                                            <br />
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Fotografia</label>
                                           
                                                     <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Foto/"+ASPxLabel1.Text+"/{0}") %>'
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
                                    <div class="row">
                                        <div class="form-label-group col-md-4">
                                            <label>Cedula Profesional</label>

                                                     <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/D_Registro/Cedulas/"+ASPxLabel1.Text+"/{0}") %>'
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

        <asp:Panel ID="doc_revalida" runat="server" Visible="false">
            <div class="form-group">
                                    <div class="row" style="height:120px">
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
                                        </div>
                <div class="row">
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
                                    <div class="row" style="height:140px">
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
                                        </div>
                <div class="row" >
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
                <div class="row" style="height:140px">
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

        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Registro en SINFRA</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-2">
                    <label>Año de registro en SINFRA</label>
                    <dx:ASPxSpinEdit ID="txtAñoRegistro" ClientEnabled="false" runat="server" Theme="Material" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                        </dx:ASPxSpinEdit>
                           
                </div>
                <div class="form-label-group align-content-center col-md-6">
                    <label>Registro de D.R.O.</label>
                    <div class="container-fluid row">
                        <dx:ASPxComboBox ID="cboClasificacion" NullText="Clasificación" ClientEnabled="false" DisabledStyle-ForeColor="Gray" runat="server" Theme="Material" ValueType="System.String" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys" Width="33%">
                                            <Items>
                                                <dx:ListEditItem Text="A" Value="A" />
                                                <dx:ListEditItem Text="B" Value="B" />
                                                <dx:ListEditItem Text="C" Value="C" />
                                            </Items>

                                        </dx:ASPxComboBox>
                         <dx:ASPxTextBox ID="txtRegistroDRO" NullText="Folio" ClientEnabled="false" runat="server" DisabledStyle-ForeColor="Gray" Theme="Material" CssClass="form-control" Width="33%">
                                        </dx:ASPxTextBox>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                        <dx:ASPxComboBox ID="cboClaveProfesion" DataSourceID="SqlDataSource6" NullText="Clave Profesión" ClientEnabled="false" runat="server" Theme="Material" 
                                            TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion" DisabledStyle-ForeColor="Gray" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys" Width="33%">
                                        </dx:ASPxComboBox>
                    </div>
                            
                </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: lightgreen">Respuesta a su solicitud</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Trámite solicitado</label>
                    <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cbTramiteProcede" ClientInstanceName="cbTramiteProcede" ValueField="id_tipo_solicitud" ValueType="System.String" 
                        TextField="descripcion" Theme="Material" Width="100%" DataSourceID="SqlDataSource1" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys" DisabledStyle-ForeColor="Gray">
                        <ValidationSettings SetFocusOnError="True" ErrorText="">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Estado del trámite</label>
                    <dx:ASPxComboBox runat="server" ID="rdstatus" Theme="Material" Width="95%" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                    <Items>
                        <dx:ListEditItem Text="Autorizado" Value="Autorizado" />
                        <dx:ListEditItem Text="Rechazado" Value="Rechazado" />
                    </Items>
                        <ValidationSettings SetFocusOnError="True" ErrorText="">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                           
                </div>
                
                <div class="form-label-group col-md-12">
                    <label>Observaciones</label>
                    <dx:ASPxMemo runat="server" ID="txtObservacionesDictamen" Width="100%" Theme="Material" CssClass="form-control">
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
                        Text="Votar" CssClass="mr-2 btn btn-aceptar" width="100%">
                            <Image Url="~/css/img/votar.png"></Image> 
                            <ClientSideEvents Click="function(s, e) {
                                if(ASPxClientEdit.AreEditorsValid()){
                                lp.Show();
                                 cbGuardar.PerformCallback();
                                }
                                }" />
                        </dx:ASPxButton>
                </div>
                <div class="form-label-group text-center col-md-2">
                        <dx:ASPxButton runat="server" Theme="Material" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None" 
                            Text="Cancelar" CssClass="mr-2 btn btn-cancelar" width="100%">
                            <Image Url="~/css/img/cancelar.png"></Image> 
                            <ClientSideEvents Click="function(s, e) {
                                window.location.href='solicitudes.aspx';	
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
            </div>
        </div>
      
    </div>
</asp:Content>
