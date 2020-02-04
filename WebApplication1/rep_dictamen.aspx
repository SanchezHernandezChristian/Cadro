<%@ Page Title="Impresion de Dictamen" Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="rep_dictamen.aspx.cs" Inherits="WebApplication1.rep_dictamen" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            window.open('imp_dictamen.aspx?p=' + txtClaveSolicitud.GetText(), 'Reporte ficha', '_self');
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
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSolicitud" ClientEnabled="false" ClientInstanceName="dtFechaSolicitud" Theme="Material" Width="100%">
                    </dx:ASPxDateEdit>
                           
                </div>
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" ClientVisible="false" Text=""></dx:ASPxLabel>
                <div class="form-label-group col-md-4">
                    <label>Cédula profesional</label>
                    <dx:ASPxTextBox ID="txtCedula" ClientEnabled="false" ClientInstanceName="txtCedula" runat="server" Theme="Material" Width="100%">
                    </dx:ASPxTextBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Trámite que solicita</label>
                    <dx:ASPxComboBox runat="server" ID="cboTipoTramite" ClientEnabled="false" ClientInstanceName="cboTipoTramite" ValueField="id_tipo_solicitud" ValueType="System.String" TextField="descripcion" Theme="Material" Width="100%" DataSourceID="SqlDataSource1">
                    </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT id_tipo_solicitud, descripcion FROM [catalogo_de_tramites] ORDER BY descripcion"></asp:SqlDataSource>
              
                </div>
                <div class="form-label-group col-md-4">
                    <label>Clave de solicitud</label>
                    <dx:ASPxTextBox ID="txtClaveSolicitud" ClientInstanceName="txtClaveSolicitud" runat="server" Theme="Material" Width="100%" ClientEnabled="false">
                    </dx:ASPxTextBox>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Fecha de sesion</label>
                    <dx:ASPxDateEdit runat="server" ID="dtFechaSesion" ClientEnabled="false"  ClientInstanceName="dtFechaSesion" Theme="Material" Width="100%">
                    </dx:ASPxDateEdit>

                </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>A. Paterno</label>
                    <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                           
                </div>
                <div class="form-label-group col-md-4">
                    <label>A. Materno</label>
                    <dx:ASPxTextBox ID="txtAMaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Nombre(s)</label>
                    <dx:ASPxTextBox ID="txtNombres" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Calle y número</label>
                    <dx:ASPxTextBox ID="txtCalleNumero" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Colonia</label>
                    <dx:ASPxTextBox ID="txtColonia" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>

                </div>
                <div class="form-label-group col-md-4">
                </div>
                <div class="form-label-group col-md-4">
                    <label>Región</label>
                    <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cboRegion" ValueType="System.String" TextField="nombre" ValueField="id"
                        DataSourceID="dsRegion" ClientInstanceName="cboRegion" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="dsRegion" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="select distinct id, Nombre from dbo.tblRegion as reg left join dbo.tblRegionesMunicipios as regm on reg.Id = regm.idRegion;"></asp:SqlDataSource>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Municipio</label>
                     <dx:ASPxComboBox runat="server" ValueField="idMunicipio" ClientEnabled="false" ValueType="System.String" TextField="nombreMunicipioINEGI" 
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
                                    <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades" TextField="nom_loc" ValueField="loc"></dx:ASPxComboBox>
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
                    <dx:ASPxTextBox ID="txtTelLocal" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Teléfono celular</label>
                    <dx:ASPxTextBox ID="txtTelCelular" runat="server" ClientEnabled="false" Theme="Material" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Correo electrónico</label>
                     <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
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
                            Theme="Material" ID="cboProfesion"
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
                    <dx:ASPxComboBox runat="server" ValueField="Id_Universidad" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material"
                            ID="cboEgresado" Width="100%"
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
                    <dx:ASPxDateEdit runat="server" ID="dtFechaTitulo" ClientEnabled="false" Theme="Material" Width="100%">
                        </dx:ASPxDateEdit>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Fecha de cédula</label>
                     <dx:ASPxDateEdit runat="server" ID="dtFechaCedula" ClientEnabled="false" Theme="Material" Width="100%">
                        </dx:ASPxDateEdit>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Cursos de actualización o postgrado</label>
                     <dx:ASPxMemo ID="txtCursos" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                        <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxMemo>

                </div>
                <div class="form-label-group col-md-4">
                    <label>Colegio de pertenecia</label>
                     <dx:ASPxComboBox runat="server" ValueField="Id_Colegio" ClientEnabled="false" TextField="Descripcion" ValueType="System.String" Theme="Material"
                                ID="cboColegio" Width="100%"
                                DataSourceID="SqlDataSource5" CallbackPageSize="15"
                                EnableCallbackMode="True" EnableViewState="false">
                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                </ValidationSettings>
                            </dx:ASPxComboBox>
                     <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Colegio], [Descripcion] FROM [tblColegios] ORDER BY [Descripcion]"></asp:SqlDataSource>  
                 </div>
                <label>Cedula Digital</label>
                <div class="form-label-group col-md-4">
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
                  <%--  Arreglar despues ---------------

                <asp:TemplateField HeaderText="Descargar" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:HyperLink ID="descarga" Text="Descargar" Target="_blank" runat="server" NavigateUrl='<%# Eval("Name", "~/Download.aspx"+ASPxLabel1.Text+"?filename={0}") %>'>
                               
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
--%>
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
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Registro en SINFRA</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Año de registro en SINFRA</label>
                    <dx:ASPxSpinEdit ID="txtAñoRegistro" ClientEnabled="false" runat="server" Theme="Material">
                        </dx:ASPxSpinEdit>
                           
                </div>
                <div class="form-label-group align-content-center col-md-8">
                    <label>Registro de D.R.O.</label>
                    <div class="container-fluid row">
                        <dx:ASPxComboBox ID="cboClasificacion" NullText="Clasificación" ClientEnabled="false" runat="server" Theme="Material" ValueType="System.String">
                                            <Items>
                                                <dx:ListEditItem Text="A" Value="A" />
                                                <dx:ListEditItem Text="B" Value="B" />
                                                <dx:ListEditItem Text="C" Value="C" />
                                            </Items>

                                        </dx:ASPxComboBox>
                         <dx:ASPxTextBox ID="txtRegistroDRO" NullText="Folio" ClientEnabled="false" runat="server" Theme="Material">
                                        </dx:ASPxTextBox>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                        <dx:ASPxComboBox ID="cboClaveProfesion" DataSourceID="SqlDataSource6" NullText="Clave Profesión" ClientEnabled="false" runat="server" Theme="Material" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion">
                                        </dx:ASPxComboBox>
                    </div>
                            
                </div>
            </div>
        </div>
        <p class="text-center text-black rounded h5" style="background-color: lightgreen">Respuesta a su solicitud</p>
        <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Trámite que procedio</label>
                    <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cbTramiteProcede" ClientInstanceName="cbTramiteProcede" ValueField="id_tipo_solicitud" ValueType="System.String" TextField="descripcion" Theme="Material" Width="100%" DataSourceID="SqlDataSource1">
                        <ValidationSettings SetFocusOnError="True" ErrorText="">
                            <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                        </ValidationSettings>
                    </dx:ASPxComboBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Estado del trámite</label>
                    <dx:ASPxComboBox runat="server" ID="rdstatus" Theme="Material" ClientEnabled="false" Width="95%">
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
                    <dx:ASPxMemo runat="server" ID="txtObservacionesDictamen" Width="100%" ClientEnabled="false" Theme="Material" >
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

                     <dx:ASPxButton runat="server" ID="btnImprimir" CausesValidation="false" Theme="Material" AutoPostBack="false" Border-BorderStyle="None" 
                         Text="Imprimir" CssClass="mr-2 btn btn-imprimir" width="100%">
                            <Image Url="~/css/img/imprimir.png"></Image> 
                        <ClientSideEvents Click="function(s, e) { 
                                            Swal.fire({
                                                title: '¿Los datos son correctos? ',
                                                html: 'Una vez guardado no se podra modificar la informacion',
                                                type: 'warning',
                                                showCancelButton: true,
                                                confirmButtonColor: '#c87cdf',
                                                cancelButtonColor: '#00b7df',
                                                confirmButtonText: 'Continuar',
                                                cancelButtonText: 'Cancelar',
                                                allowOutsideClick: false
                                            }).then((result) => {
                                                if (result.value) {
                                                    if(ASPxClientEdit.AreEditorsValid()){
                                                                    lp.Show();
                                                                        cbGuardar.PerformCallback();
                                                        }
                                                    }
                                                });
                                                }" 
                                 />
                </dx:ASPxButton>
                  <%--  <dx:ASPxButton runat="server" Theme="Material" ID="btnGuardar" AutoPostBack="false" ClientInstanceName="btnGuardar" 
                        Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 56.png" BackgroundImage-Repeat="NoRepeat" 
                        Height="45px" Width="180px" >
                            <ClientSideEvents Click="function(s, e) {
                                if(ASPxClientEdit.AreEditorsValid()){
                                lp.Show();
                                 cbGuardar.PerformCallback();
                                }
                                }" />
                        </dx:ASPxButton>  --%>  
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
            </div>
        </div>
      
    </div>
</asp:Content>
