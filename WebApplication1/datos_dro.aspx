<%@  Title="Datos DRO" Language="C#" AutoEventWireup="true" CodeBehind="datos_dro.aspx.cs" Inherits="WebApplication1.datos_dro" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Language" content="es"/>
    <title>Datos DRO</title>
    <link rel="shortcut icon" href="css/img/LogoVII.ico" type="image/x-icon"/>
    <link rel="icon" href="css/img/LogoVII.ico" type="image/x-icon"/>
    <script src="Content/notificaciones.js"></script>
    <script src="Content/sweetalert2.all.min.js"></script>
    <script>
        function cambio_color(color) {
            if (color === 1) {
                document.getElementById("barraColor").style.backgroundColor = "#0038b1";
            } else
            {
                document.getElementById("barraColor").style.backgroundColor = "red";
            }
        }
        function imagenarriba() {
            window.location.href = '/default';
        }
    </script>
</head>
<body>
    <dx:ASPxLabel runat="server" Text="" ForeColor="Red" ID="lblError">
                        </dx:ASPxLabel>
<!-- Logos de la dependencia -->


        <div class="card mx-auto mt-1">
      <div class="card-header align-content-center">
          <div class="form-group">
            <div class="row">
                <div class="col-md-9" style="clear:both; ">
                          <asp:Image id="Image4" runat="server" ImageUrl="~/css/img/logo.png"   AlternateText="Imagen no disponible" CssClass=".img-fluid. max-width: 100%;" onclick="imagenarriba()" />
                          
                    <h4 class="pt-3" ><strong>Datos de Director Responsable de Obra</strong></h4>
	            </div>
		        <div class="col-md-3">
                       <asp:Image id="Image2" runat="server" ImageUrl="~/css/img/Recurso 3.png" Width="180px" Height="180px"  AlternateText="Imagen no disponible"  CssClass=".img-fluid. max-width: 100%;"  />
                    <div class="well well-sm">

                        
                    </div>
                </div>
                
                </div>
              <div>
                  <h5 class="align-items-sm-end">Información</h5>
              </div>
               
        </div>
         
      </div>
      <div class="card-body">
          <p id="barraColor" class="text-center text-black rounded h5" style="background-color: #0038b1">
              <dx:ASPxLabel ID="estatus_dro" ForeColor="#c9c9c9" Font-Size="26px"  runat="server" ></dx:ASPxLabel>
              </p>
          <form id="envioRegistro" runat="server">
            <div class="form-group">
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Nombre(s)</label>
                    <dx:ASPxTextBox ID="txtNombres" runat="server" ClientEnabled="false" Theme="Material" Width="100%"  DisabledStyle-ForeColor="#333333">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                </div>
                <div class="form-label-group col-md-4">
                    <label>A. Paterno</label>
                    <dx:ASPxTextBox ID="txtApaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%" DisabledStyle-ForeColor="#333333">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                           
                </div>
                <div class="form-label-group col-md-4">
                    <label>A. Materno</label>
                    <dx:ASPxTextBox ID="txtAMaterno" runat="server" Theme="Material" ClientEnabled="false" Width="100%"  DisabledStyle-ForeColor="#333333">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                    </dx:ASPxTextBox>
                            
                </div>
                
                <div class="form-label-group col-md-4">
                    <label>Profesión</label>
                    <dx:ASPxComboBox runat="server" TextField="Descripcion" ClientEnabled="false" ValueType="System.String" ValueField="Id_Profesion"  DisabledStyle-ForeColor="#333333"
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
                    <label>Cédula profesional</label>
                    <dx:ASPxTextBox ID="txtCedula" ClientEnabled="true" ClientInstanceName="txtCedula" runat="server" Theme="Material" Width="100%"  DisabledStyle-ForeColor="#333333">
                    </dx:ASPxTextBox>
                            
                </div>
                <div class="form-label-group col-md-4">
                    <label>Municipio</label>
                     <dx:ASPxComboBox runat="server" ValueField="idMunicipio" ClientEnabled="false" ValueType="System.String" TextField="nombreMunicipioINEGI"   DisabledStyle-ForeColor="#333333"
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
                                    <dx:ASPxComboBox ID="cboLocalidad" ClientInstanceName="cboLocalidad" runat="server" Theme="Material" Width="100%" DataSourceID="dsLocalidades" TextField="nom_loc" ValueField="loc"  DisabledStyle-ForeColor="#333333"></dx:ASPxComboBox>
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
                    <dx:ASPxComboBox runat="server" ClientEnabled="false" ID="cboRegion" ValueType="System.String" ClientInstanceName="cboRegion" DataSourceID="dsRegion" TextField="nombre" ValueField="id" Theme="Material" Width="100%"  DisabledStyle-ForeColor="#333333">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxComboBox>
                    <asp:SqlDataSource ID="dsRegion" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="select distinct id, Nombre from dbo.tblRegion as reg left join dbo.tblRegionesMunicipios as regm on reg.Id = regm.idRegion;"></asp:SqlDataSource>
                </div>
                <div class="form-label-group col-md-4">
                    <label>Año de registro en SINFRA</label>
                    <dx:ASPxSpinEdit ID="txtAnioRegistro" ClientEnabled="false" runat="server" Theme="Material"  DisabledStyle-ForeColor="#333333">
                        </dx:ASPxSpinEdit>
                           
                </div>
                <div class="form-label-group col-md-8">
                    <label>Registro de D.R.O.</label>
                    <div class="container-fluid row">
                        <dx:ASPxComboBox ID="cboClasificacion" NullText="Clasificación" ClientEnabled="false" runat="server" Theme="Material" ValueType="System.String"  DisabledStyle-ForeColor="#333333">
                                            <Items>
                                                <dx:ListEditItem Text="A" Value="A" />
                                                <dx:ListEditItem Text="B" Value="B" />
                                                <dx:ListEditItem Text="C" Value="C" />
                                            </Items>

                                        </dx:ASPxComboBox>
                         <dx:ASPxTextBox ID="txtRegistroDRO" NullText="Folio"  ClientEnabled="false" runat="server" Theme="Material"  DisabledStyle-ForeColor="#333333">
                                        </dx:ASPxTextBox>
                        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:BD_CADROConnectionString %>" SelectCommand="SELECT [Id_Profesion], [Descripcion] FROM [tblProfesiones] ORDER BY [Descripcion]"></asp:SqlDataSource>
                                        <dx:ASPxComboBox ID="cboClaveProfesion" DataSourceID="SqlDataSource6" NullText="Clave Profesión" ClientEnabled="false" runat="server" Theme="Material" TextField="Descripcion" ValueType="System.String" ValueField="Id_Profesion"  DisabledStyle-ForeColor="#333333">
                                        </dx:ASPxComboBox>
                    </div>
                </div> 
            </div>
            </div>
        </form>

      
      </div>
    </div>
  </div>
</body>
</html>
