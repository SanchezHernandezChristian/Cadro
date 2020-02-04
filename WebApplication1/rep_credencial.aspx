<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCADRO.Master" CodeBehind="rep_credencial.aspx.cs" Inherits="WebApplication1.rep_credencial" %>

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
            window.open('imp_crede.aspx?p=' + txtCedula.GetText(), 'Reporte ficha', '_self');
        }

        function printDiv(nombreDiv) {
            var contenido = document.getElementById(areaImprimir).innerHTML;
            var contenidoOriginal = document.body.innerHTML;

            document.body.innerHTML = contenido;

            window.print();

            document.body.innerHTML = contenidoOriginal;
        }

    </script>

    <style type="text/css">
        .auto-style1 {
            height: 225px;
            width: 368px;
            font-family: Tahoma, Geneva, sans-serif;
            font-size: 12px;
            margin-left: 160px;
        }
        .auto-style2 {
            right: 200px;
            margin-left: 174px;
            margin-top:50px;
            width: 170px;
        }
        .auto-style3 {
            margin-left: 114px;
            width: 243px;
        }
        .auto-style4 {
            margin-left: 114px;
            width: 241px;
            height: 94px;
        }
        .auto-style5 {
            margin-left: 36px;
            width: 212px;
        }
        </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--

    <div id="areaImprimir">
            <div style="background-image: url('http://localhost:3421/credencial/delante.png'); background-repeat: no-repeat; background-position: center center" class="auto-style1">
                <div class="auto-style2">
                <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="Se expide la presente al A. C." Width="170px">
                </dx:ASPxLabel>
                </div>
                <div class="auto-style3">
                    <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Height="18px" Width="235px" Border-BorderColor="Transparent" BackColor="Transparent">
                    </dx:ASPxTextBox>
                </div>
                <div class="auto-style4">

                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Height="17px" Text="CUYA FIRMA, NO. DE CÉDULA PROFESIONAL, FOTOGRAFÍA Y REGISTRO LO ACREDITAN COMO DIRECTOR RESPONSABLE DE OBRA (D.R.O.) EN EL ESTADO, CON SUJECIÓN A LAS LEYES, PLANES Y PROGRAMAS VIGENTES EN LOS CENTROS DE POBLACIÓN." Width="236px">
                    </dx:ASPxLabel>

                </div>
                <div class="auto-style5">
                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Cédula profesional"></dx:ASPxLabel>
                    <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Border-BorderColor="Transparent" BackColor="Transparent" Width="170px"></dx:ASPxTextBox>
                </div>
            </div>
            
           
        </div>

    <input type="button" onclick="printDiv('areaImprimir')" value="imprimir div" />

    --%>

    <div class="d-flex justify-content-start flex-wrap flex-md-nowrap align-items-center mt-2">
        <div class="container-fluid">
            <h1 class="h4 mx-3 mt-2 align-content-center"><strong>Credencial D.R.O.</strong>
            </h1>
        </div>
    </div>

    <div class="container-fluid">
        <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos de credencial</p>
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
                    <label>Correo electrónico</label>
                     <dx:ASPxTextBox ID="txtCorreoElectronico" runat="server" Theme="Material" ClientEnabled="false" Width="100%">
                            <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                            </ValidationSettings>
                        </dx:ASPxTextBox>

                </div>
            </div>
            <div class="row" >
                <div class="form-label-group col-md-4">
                    <label>Cédula</label><br />
                            <dx:ASPxTextBox ID="txtCedula" ClientEnabled="false" ClientInstanceName="txtCedula" runat="server" Theme="Material" Width="100%">
                    </dx:ASPxTextBox>
                    </div>
                 <div class="form-label-group col-md-8">
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
            </div></div>
    </asp:Content>