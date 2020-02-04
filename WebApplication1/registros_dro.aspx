<%@ Page Title="" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="registros_dro.aspx.cs" Inherits="WebApplication1.registros_dro" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
        <form id="envioRegistro">
            <div id="content-wrapper">
        <div class="container-fluid">
            <!-- Breadcrumbs-->
            <ol class="breadcrumb justify-content-center">
              <li class="breadcrumb-item">
                <a><strong>Nueva solicitud</strong></a>
              </li>
              <li class="breadcrumb-item active">Ingrese los datos solicitados</li>
            </ol>

            
                <div class="form-group" id="div_cedula">
                    <div class="row  justify-content-center" >
                        <div class="form-label-group col-md-5">
                            <label>Ingrese su Cédula Profesional</label>
                            <dx:ASPxTextBox MaxLength="10" ID="txtCedula" ClientEnabled="false" type="number" onkeypress="return soloNumeros(event);" ClientInstanceName="txtCedula" runat="server" Theme="Material" CssClass="form-control">
                            </dx:ASPxTextBox>
                            
                        </div>
                        <div class="form-label-group col-md-5 ">
                            <label>Seleccione el registro que desea realizar</label>
                                <dx:ASPxComboBox runat="server" ID="cboTipoTramites" ClientInstanceName="cboTipoTramite" ValueField="Id_Tipo_Solicitud" ValueType="System.String" TextField="Descripcion" Theme="Material" Cssclass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                                        <Items>
                                        <dx:ListEditItem Text="Revalidación" Value="2"/>
                              <dx:ListEditItem Text="Revalidación con Reclasificación" Value="3"/>
                              <dx:ListEditItem Text="Reclasificación" Value="4"/>
                          <dx:ListEditItem Text="Reposición de Credencial" Value="5"/>
                                        </Items>                      
                                </dx:ASPxComboBox>
                        </div>
                     </div>
                  </div>
                <div class="form-group">
                    <div class="row justify-content-center" >
                        <div class="form-label-group text-center col-md-2">
                            <dx:ASPxButton runat="server" ID="btnAgregarSolicitud" ClientInstanceName="btnAgregarSolicitud" Theme="Material" AutoPostBack="False" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 61.png" BackgroundImage-Repeat="NoRepeat" Height="48px" Width="191px">
                            <ClientSideEvents Click="function(s, e) {
                                                         lp.Show();
	                                                     cbValidar.PerformCallback();
                                                         }" />
                             </dx:ASPxButton>
                        </div>
                     </div>
                  </div>
                </div>
            </div>

                
        <dx:ASPxCallback ID="cbValidar" ClientInstanceName="cbValidar" OnCallback="cbValidar_Callback" runat="server">
            <ClientSideEvents CallbackComplete="function(s, e) {
                lp.Hide();
                resultadoValidacion(s,e);
                  }"/>
        </dx:ASPxCallback>
        <div class="container-fluid">
            <dx:ASPxCallbackPanel ID="Solicitud" ClientInstanceName="Solicitud" Theme="Material" ClientVisible="false" runat="server" Width="100%" OnCallback="Solicitud_Callback">
                <ClientSideEvents EndCallback="function(s, e) {
	                terminaCallbackGuardar(s,e);
                    }" />
                    <PanelCollection>
                        <dx:PanelContent runat="server">
                            <div>
                                <dx:ASPxLabel runat="server" ID="lblMensajeError" ClientInstanceName="lblMensajeError" ForeColor="Red" Font-Size="Small">
                                </dx:ASPxLabel>
                            </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
                                <div class="form-group">
                                    <div class="row">
                                        <div class="form-label-group col-md-4">
                                            <label>Nombre(s)</label>
                                            <dx:ASPxTextBox ID="txtNombres" runat="server" Theme="Material" ClientEnabled="false" Enabled="false" MaxLength="40" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Paterno</label>
                                            <dx:ASPxTextBox ID="txtApaterno" runat="server" ClientEnabled="false" Enabled="false" Theme="Material" MaxLength="25" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Materno</label>
                                            <dx:ASPxTextBox ID="txtAMaterno" runat="server" MaxLength="25" ClientEnabled="false" Enabled="false" Theme="Material" Width="100%" CssClass="form-control">   
                                            </dx:ASPxTextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>CURP</label>
                                            <dx:ASPxTextBox ID="curp" runat="server" ClientEnabled="false" Enabled="false" MaxLength="18" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>RFC</label>
                                            <dx:ASPxTextBox ID="rfc" MaxLength="13" ClientEnabled="false" Enabled="false" runat="server" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Estado de nacimiento</label>
                                            <dx:ASPxComboBox runat="server" ValueType="System.String" ClientEnabled="false" Enabled="false"  Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="nacimiento" Width="100%"  EnableViewState="false">
                                                <Items>
                                                    <dx:ListEditItem Text="Aguascalientes" Value="Aguascalientes"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Baja California" Value="Baja California"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Baja California Sur" Value="Baja California Sur"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Campeche" Value="Campeche"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Chiapas" Value="Chiapas"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Chihuahua" Value="Chihuahua"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Coahuila de Zaragoza" Value="Coahuila de Zaragoza"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Colima" Value="Colima"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Durango" Value="Durango"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Estado de México" Value="Estado de México"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Guanajuato" Value="Guanajuato"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Guerrero" Value="Guerrero"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Hidalgo" Value="Hidalgo"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Jalisco" Value="Jalisco"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Michoacán de Ocampo" Value="Michoacán de Ocampo"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Morelos" Value="Morelos"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Nayarit" Value="Nayarit"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Nuevo León" Value="Nuevo León"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Oaxaca" Value="Oaxaca"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Puebla" Value="Puebla"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Querétaro" Value="Querétaro"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Quintana Roo" Value="Quintana Roo"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="San Luis Potosí" Value="San Luis Potosí"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Sinaloa" Value="Sinaloa"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Sonora" Value="Sonora"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Tabasco" Value="Tabasco"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Tamaulipas" Value="Tamaulipas"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Tlaxcala" Value="Tlaxcala"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Veracruz de Ignacio de la Llave" Value="Veracruz de Ignacio de la Llave"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Yucatán" Value="Yucatán"></dx:ListEditItem>
                                                    <dx:ListEditItem Text="Zacatecas" Value="Zacatecas"></dx:ListEditItem>
                                                </Items>
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Municipio</label>
                                            <dx:ASPxComboBox runat="server" ClientEnabled="false" Enabled="false" ValueField="idMunicipio" ValueType="System.String" TextField="nombreMunicipioINEGI" 
                                                ID="cboMunicipio" Theme="Material" Width="100%" DataSourceID="SqlDataSource2" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                                <ClientSideEvents SelectedIndexChanged="function(s, e) {
                                                    callpanelLocalidad.PerformCallback();
	                                                cboRegion.PerformCallback(s.GetValue());
                                                    }" />
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [idMunicipio], [nombreMunicipioINEGI] FROM [tblMunicipios] ORDER BY [nombreMunicipioINEGI]"></asp:SqlDataSource>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Localidad</label>
                                            <dx:ASPxCallbackPanel ID="callpanelLocalidad" ClientEnabled="false" Enabled="false" ClientInstanceName="callpanelLocalidad" Theme="Material" runat="server" 
                                                Width="100%" OnCallback="callpanelLocalidad_Callback" >
                                                <PanelCollection>
                                                    <dx:PanelContent runat="server">
                                                        <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades" TextField="nom_loc" ValueField="loc" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"></dx:ASPxComboBox>
                                                        <asp:SqlDataSource ID="dsLocalidades" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id], [loc], lower([nom_loc]) as nom_loc FROM [tblLocalidades] WHERE ([mun] = @mun) ORDER BY [nom_loc]">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="cboMunicipio" Name="mun" PropertyName="Value" Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </dx:PanelContent>
                                                </PanelCollection>
                                            </dx:ASPxCallbackPanel>
                                        
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Colonia</label>
                                            <dx:ASPxTextBox ID="txtColonia" ClientEnabled="false" Enabled="false" runat="server" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Calle y número</label>
                                            <dx:ASPxTextBox ID="txtCalleNumero" ClientEnabled="false" Enabled="false" runat="server" MaxLength="60" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <dx:ASPxComboBox runat="server" ClientEnabled="false" Enabled="false" ClientVisible="false" ID="cboRegion" ValueField="id" 
                                                ValueType="System.String" TextField="nombre" ClientInstanceName="cboRegion" 
                                                Theme="Material" Width="100%" OnCallback="cboRegion_Callback" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>   
                                            </dx:ASPxComboBox>
                            
                                        </div>
                                    </div>
                                </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos de contacto</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Teléfono local</label>
                                            
                                            <dx:ASPxTextBox MaxLength="10"  ID="txtTelLocal" type="number" onkeypress="return soloNumeros(event);" 
                                                Width="100%" runat="server" Theme="Material" CssClass="form-control">
                                                     <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>                            
                                                
                                                </dx:ASPxTextBox>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Teléfono celular</label>
                                                <dx:ASPxTextBox MaxLength="10" ID="txtTelCelular" type="number" onkeypress="return soloNumeros(event);" 
                                                    Width="100%" runat="server" Theme="Material" CssClass="form-control">
                                                     <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>                            
                                                
                                                </dx:ASPxTextBox>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Correo Electronico</label>
                                            <dx:ASPxTextBox ID="txtCorreoElectronico" ClientEnabled="false" Enabled="false" runat="server" Theme="Material" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                                            <asp:RegularExpressionValidator ID="validateEmail"    
                                              runat="server" ErrorMessage="Correo no valido" foreColor="red"
                                              ControlToValidate="txtCorreoElectronico" 
                                              ValidationExpression="^([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)$" />
                            
                                        </div>
                                    </div>
                                </div>
                                <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos profesionales</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Profesión</label>
                                            <dx:ASPxComboBox runat="server" TextField="Descripcion" ClientEnabled="false" Enabled="false" ValueType="System.String" ValueField="Id_Profesion" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                Theme="Material" ID="cboProfesion"
                                                Width="100%" DataSourceID="SqlDataSource3" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id_profesion], [descripcion] FROM [tblProfesiones] ORDER BY [descripcion]"></asp:SqlDataSource>
              
                                        </div>
                                        <div class="form-label-group col-md-6">
                                            <label>Institución de Egreso:</label>
                                            <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" ClientEnabled="false" Enabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="cboEgresado" Width="100%"
                                                DataSourceID="SqlDataSource4" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id_universidad], [Descripcion] FROM [tblUniversidades] ORDER BY [Descripcion]"></asp:SqlDataSource>
              
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Cédula Digital</label>
                                            <br />
<dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientVisible="false" Text=""></dx:ASPxLabel>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" Target="_blank" NavigateUrl='<%# Eval("Name", "~/Documents/Cedulas/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="  |         | ">
                    <ItemTemplate>
                    </ItemTemplate>
                </asp:TemplateField>
                <%--            ------------------------  Arreglar despues --------------

                <asp:TemplateField HeaderText="Descargar" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:HyperLink ID="descarga" Text="Descargar" Target="_blank" runat="server" NavigateUrl='<%# Eval("Name", "~/Download.aspx?filename={0}") %>'>
                               
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>     --%>
            </Columns>
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                                        </div>
                                        <div class="form-label-group col-md-6">
                                            <label>Colegio de pertenencia</label>
                                            <dx:ASPxComboBox runat="server"  ValueField="Id_Colegio" ClientEnabled="false" Enabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material" CssClass="dxeTextBoxSys dxeTextBox_Material form-control dxeTextBoxDefaultWidthSys"
                                                ID="cboColegio" Width="100%"
                                                DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                                EnableCallbackMode="True" EnableViewState="false">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id_colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Fecha de título</label>
                                            <dx:ASPxDateEdit runat="server" Height="100%" ClientEnabled="false" Enabled="false" ID="dtFechaTitulo" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" Theme="Material" Width="80%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>

                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Fecha de cédula</label>
                                            <dx:ASPxDateEdit runat="server" Height="100%" ClientEnabled="false" Enabled="false" ID="dtFechaCedula" EditFormatString="dd/MM/yyyy" DisplayFormatString="dd/MM/yyyy" Theme="Material" Width="80%" CssClass="form-control" >
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxDateEdit>
                                            
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="row" >
                                        
                                        <div class="form-label-group col-md-6">
                                            <br />
                                            <br />
                                            <label>Cursos de actualización o postgrado</label>
                                            <dx:ASPxMemo ID="txtCursos" runat="server" MaxLength="800" Theme="Material" Width="100%" Height="60px" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxMemo>
                           
                                        </div>

                                        <div class="form-label-group col-md-6">
                                            <br />
                                            <br />
                                            <label>Cursos</label>
                                            
                                            <dx:ASPxUploadControl ID="cursos" runat="server" Width="280px" ClientInstanceName="uploadControl5"
                                                UploadMode="Advanced" ShowUploadButton="false" Theme="Material" OnFileUploadComplete="cursos_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304">
            </ValidationSettings>
                                                  <ClientSideEvents 
                FileUploadComplete="uploadFile_OnFileUploadComplete" 
                FileUploadStart="function(s, e) {
                                                       btnGuardar.SetEnabled(false);
                }" />
                                            </dx:ASPxUploadControl>

                                            <br />
                                            <br />
                                            </div>

                                    </div>
                                </div>

                            <p class="text-center text-black rounded h5" style="background-color: cornsilk">Documentos para trámite</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-6">
                                            <label>Comprobante de pago del trámite</label>
                                            <dx:ASPxUploadControl ID="pago" Theme="Material" runat="server" Width="280px" ShowProgressPanel="True" ClientInstanceName="uploadControl" 
                                                UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="pago_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304" MaxFileCount="1">

            </ValidationSettings>
                                                <ClientSideEvents 
                FilesUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                            <label>El comprobante deberá ser escaneado junto con el ticket de pago</label>
                                            <br />
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Credencial de D.R.O.</label>
                                            
                                            <dx:ASPxUploadControl ID="credencial" Theme="Material" runat="server" Width="280px"  ClientInstanceName="uploadControl2"
                                                UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="credencial_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304">
            </ValidationSettings>
                                                <ClientSideEvents 
                FileUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                            <label>La credencial deberá estar vigente</label>

                                            <br />
                                            <br />
                                            </div>
                                    </div>
                                </div>
                            <p class="text-center text-black rounded h5" style="background-color: cornsilk">Registro SINFRA</p>
                             <%--   <p class="text-center text-black rounded h5" style="background-color: cornsilk; display:none">Registro SINFRA</p>
                                 <div class="form-group" style="display:none">  --%>
                            <div class="form-group">     
                            <div class="row" >
                                        <div class="form-label-group col-md-6">
                                            <label>Año de registro SINFRA</label>
                                            <dx:ASPxSpinEdit ID="txtAñoRegistro" ClientEnabled="false" runat="server" Theme="Material" SpinButtons-ShowIncrementButtons="false">
                                                <SpinButtons ShowIncrementButtons="False"></SpinButtons>
                                            </dx:ASPxSpinEdit>
              
                                        </div>
                                        <div class="form-label-group col-md-6">
                                            <label>Registro de D.R.O.</label>
                                            <div class="container-fluid row">
                                                <dx:ASPxComboBox ID="cboClasificacion" NullText="Clasificación" ClientEnabled="false" runat="server" Theme="Material" ValueType="System.String">
                                                <Items>
                                                    <dx:ListEditItem Text="A" Value="A" />
                                                    <dx:ListEditItem Text="B" Value="B" />
                                                    <dx:ListEditItem Text="C" Value="C" />
                                                </Items>
                                            </dx:ASPxComboBox>
                                            <dx:ASPxTextBox ID="txtRegistro" NullText="Folio" ClientEnabled="false" runat="server" Theme="Material">
                                            </dx:ASPxTextBox>
                                            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [id_profesion], [descripcion] FROM [tblProfesiones] ORDER BY [descripcion]"></asp:SqlDataSource>
                                            <dx:ASPxComboBox ID="cboClaveProfesion" DataSourceID="SqlDataSource6" NullText="Clave Profesión" ClientEnabled="false" runat="server" Theme="Material" TextField="Descripcion" ValueType="System.String" ValueField="id_profesion">
                                            </dx:ASPxComboBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                <div class="row  justify-content-center" >
                                    <div class="form-label-group text-center col-md-2">
                                                    <dx:ASPxButton ID="btnGuardar" runat="server" Theme="Material" ClientVisible="true" AutoPostBack="false" ClientInstanceName="btnGuardar"
                                                         Border-BorderStyle="None" ImageUrlBackColor="Transparent" BackgroundImage-="~/css/img/Recurso 56.png" BackgroundImage-Repeat="NoRepeat" 
                                                        Height="45px" Width="180px">
                                                        <ClientSideEvents Click="function(s, e) {
                                                            AgregarSolicitud(s,e);
                                                            UploadFile();
                                                            window.location.href='solicitante.aspx';
                                                            }" />
                                                        <BackgroundImage ImageUrl="~/css/img/Recurso 56.png" Repeat="NoRepeat"></BackgroundImage>
                                                        <Border BorderStyle="None"></Border>
                                                    </dx:ASPxButton>
                                    </div>
                       
                                    <div class="form-label-group text-center col-md-2">
                                        <dx:ASPxButton runat="server" Theme="Material" AutoPostBack="False" ClientInstanceName="btnCancelar" ID="btnCancelar" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 57.png" BackgroundImage-Repeat="NoRepeat" Height="45px" Width="180px">
                                             <ClientSideEvents Click="function(s, e) {
                                                        window.location.href='solicitante.aspx';
                                                                        }" />
                                            <BackgroundImage ImageUrl="~/css/img/Recurso 57.png" Repeat="NoRepeat"></BackgroundImage>
                                            <Border BorderStyle="None"></Border>
                                        </dx:ASPxButton>
                                    </div>
                        
                                    </div>
                                </div>
                        </dx:PanelContent>
                    </PanelCollection>
                </dx:ASPxCallbackPanel>
            </div>
    <div>
        <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server" Modal="true">
        </dx:ASPxLoadingPanel>
    </div>
    </form>
   

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

     <script type="text/javascript">
        function UploadFile(s, e) {
            uploadControl5.Upload();
            uploadControl.Upload();
            uploadControl2.Upload();
        }


        function uploadFile_OnFileUploadComplete(s, e) {
            resultUploadFile = e.callbackData.split("|");
            if (resultUploadFile[0] == "ok") {
                btnGuardar.SetEnabled(true);
                switch (resultUploadFile[1]) {
                    case "1":
                        alert(resultUploadFile[2]);
                        break;
                    case "2":
                        break;
                    case "3":
                        break;
                    case "4":
                        break;
                    case "5":
                        break;
                }
            }
        }

        function GuardarOficios(s, e) {
            cbGuardarOficios.PerformCallback();
        }

        function onCallbackCompletecbGuardarOficios(s, e) {
            try {
                var htmlData = e.result.split("|");
                if (htmlData[0] == "true") {
                    btnGuardarOficico.SetEnabled(false);
                    alert(htmlData[1]);
                }
                else if (htmlData[0] == "false") {
                    alert(htmlData[1]);
                }

            }
            catch (exception) {
                return exception;
            }
        }

        function UpdateUploadButton() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl.GetFileInputCount(); i++) {
                if (uploadControl.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
            btnGuardar.SetEnabled(isAnyFileSelected);
        }

        function UpdateUploadButton2() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl2.GetFileInputCount() ; i++) {
                if (uploadControl2.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
            btnGuardar.SetEnabled(isAnyFileSelected);
        }
        function UpdateUploadButton3() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl3.GetFileInputCount() ; i++) {
                if (uploadControl3.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
            btnGuardar.SetEnabled(isAnyFileSelected);
        }
        function UpdateUploadButton4() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl4.GetFileInputCount() ; i++) {
                if (uploadControl4.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
            btnGuardar.SetEnabled(isAnyFileSelected);
        }
        function UpdateUploadButton5() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl5.GetFileInputCount() ; i++) {
                if (uploadControl5.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
            btnGuardar.SetEnabled(isAnyFileSelected);
        }
        function UpdateUploadButton6() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl6.GetFileInputCount() ; i++) {
                if (uploadControl6.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
            btnGuardar.SetEnabled(isAnyFileSelected);
        }
        function UpdateUploadButton7() {
            var isAnyFileSelected = false;
            for (var i = 0; i < uploadControl7.GetFileInputCount() ; i++) {
                if (uploadControl7.GetText(i) != "") { isAnyFileSelected = true; break; }
            }
            btnGuardar.SetEnabled(isAnyFileSelected);
        }


        function habilitarEdicion(habilitar) {
            btnCancelar.SetVisible(habilitar);
            Solicitud.SetVisible(habilitar);
            btnGuardar.SetVisible(habilitar);
        }
        
        function OnFileUploadCompleteCedula(s, e) {
            var htmlData = e.callbackData.split("|");
            if (htmlData[0] == "true") {
                hfHiddenField.Set("archivoAnexo", htmlData[2]);
                hfHiddenField.Set("tieneArchivo", true);
                alert("Archivo anexado correctamente.");
                btnVisualizarCedula.SetNavigateUrl(htmlData[1]);
            }
            else {
                alert(htmlData[1]);
            }
        }

        function resultadoValidacion(s, e) {
            var htmlData = e.result.split('|');
            if (htmlData[0] == "true") {
                btnAgregarSolicitud.SetVisible(false);
                txtCedula.SetEnabled(true);
                txtCedula.SetVisible(false);
                document.getElementById("div_cedula").style.display = "none";
                cboTipoTramite.SetEnabled(true);
                cboTipoTramite.SetVisible(false);
                var tipoTramiteSeleccionado = cboTipoTramite.GetText().toLowerCase();
                if (tipoTramiteSeleccionado == "registro" || tipoTramiteSeleccionado == "registro con número anterior") {
                    habilitarEdicion(true);
                } else {
                    habilitarEdicion(true);
                    habilitarEdicion(true);
                    Solicitud.PerformCallback(txtCedula.GetText());
                }
            } else {
                swal.fire({
                    icon: 'error',
                    html: htmlData[1]
                });
                //alert(htmlData[1]);
            }
        }

        function AgregarSolicitud(s, e) {
            var editoresValidos = ASPxClientEdit.AreEditorsValid();
            if (editoresValidos) {
                Solicitud.PerformCallback('Guardar');
                
            }
        }

        function terminaCallbackGuardar(s, e) {
            if (s.cp_Resultado) {
                var htmlData = s.cp_Resultado.split("|");
                //alert(htmlData[1]);
                swal.fire({
                    type: 'success',
                    icon: 'success',
                    html: htmlData[1],
                    allowOutsideClick: false
                }).then((result) => {
                    if (result.value) {
                        window.location.replace("default.aspx");
                    }
                });
                console.log(htmlData[1]);
                if (htmlData[0] == "true") {
                    Solicitud.SetVisible(false);
                    btnCancelar.SetVisible(false);
                    btnAgregarSolicitud.SetVisible(true);
                    txtCedula.SetEnabled(true);
                    txtCedula.SetVisible(true);
                    cboTipoTramite.SetEnabled(true);
                    cboTipoTramite.SetVisible(true);
                    swal.fire({
                        type: 'success',
                        icon: 'success',
                        html: htmlData[1],
                        allowOutsideClick: false
                    }).then((result) => {
                        if (result.value) {
                            window.location.replace("default.aspx");
                        }
                    });
                    console.log(htmlData[1]);
                }
                else {
                    swal.fire({
                        type: 'error',
                        icon: 'error',
                        html: htmlData[1]
                    });
                    console.log(htmlData[1]);
                }
            }
        }
        function ActualizaLocalidad(s, e) {

        }

        function soloNumeros(e) {
            var keynum = window.event ? window.event.keyCode : e.which;
            if ((keynum == 8) || (keynum == 46))
                return true;
            return /\d/.test(String.fromCharCode(keynum));

        }
    </script>


</asp:Content>
