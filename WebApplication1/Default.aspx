<%@ Page Title="Registro" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1._Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta http-equiv="Content-Language" content="es"/>
    <title>CADRO</title>
    <link rel="shortcut icon" href="css/img/LogoVII.ico" type="image/x-icon"/>
    <link rel="icon" href="css/img/LogoVII.ico" type="image/x-icon"/>
    <script src="Content/sweetalert2.all.min.js"></script>
    <script> 
        function notificacion(texto) {
            swal.fire({
                title: 'Error',
                icon: 'error',
                type: 'error',
                text: texto
                
            });
        };

    </script>
</head>
<body>
    <dx:ASPxLabel runat="server" Text="" ForeColor="Red" ID="lblError">
                        </dx:ASPxLabel>
<!-- Logos de la dependencia -->
<div style="text-align: center; clear:both;">
    <asp:Image id="Image1" runat="server" ImageUrl="/css/img/logo.png"   AlternateText="Imagen no disponible" ImageAlign="TextTop" />
</div>
    <br />
<div style="text-align:center">
  <h3 class=" font-weight-normal col-12" ><strong>Comité de acreditación de Dirección de Responsables de Obra</strong></h3>
</div>
 
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header"><strong>Registro</strong></div>
      <div class="card-body">

      <form id="formulario" runat="server">

          <div class="form-group">
            <div class="form-label-group">
                <label>Usuario:</label>
              <dx:ASPxTextBox runat="server" ID="UserName" CssClass="form-control" NullText="Usuario"></dx:ASPxTextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
                                        ControlToValidate="UserName"
                                        ErrorMessage="El nombre de usuario es obligatorio." CssClass="LabelTextNormal"
                                        ToolTip="El nombre de usuario es obligatorio." ValidationGroup="LoginCotizador" ForeColor="Red" Display="Dynamic">Usuario obligatorio</asp:RequiredFieldValidator>
              
            </div>
          </div>
          <div class="form-group">
            <div class="form-label-group">
                <label>Contraseña:</label>
               <dx:ASPxTextBox ID="PassWord" Password="true" CssClass="form-control" runat="server"  NullText="Contraseña">
                                    </dx:ASPxTextBox>
                                    <asp:RequiredFieldValidator  ID="RequiredFieldValidator2"  runat="server"
                                        ControlToValidate="PassWord"
                                        ErrorMessage="La contraseña es obligatoria." CssClass="LabelTextNormal"
                                        ToolTip="La contraseña es obligatoria." ForeColor="Red" ValidationGroup="LoginCotizador" Display="Dynamic">Contraseña Obligatoria</asp:RequiredFieldValidator>
                
             
            </div>
          </div>
          <div class="form-group text-center">
            <dx:ASPxButton ID="ASPxButton1" CssClass="text-center" BackgroundImage-ImageUrl="~/css/img/Recurso 62.png" BackgroundImage-Repeat="NoRepeat" 
                runat="server" AutoPostBack="true" OnClick="ASPxButton1_Click" Height="51px" Width="200px" ValidationGroup="LoginCotizador" CausesValidation="True">
                                        </dx:ASPxButton>
          </div>
          <div class="form-group text-center">
              <a href="registro.aspx" class=" btn-outline-info">REGISTRO</a>
          </div>
        </form>
      </div>
    </div>
  </div>
</body>
</html>