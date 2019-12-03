<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="WebApplication1.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>CADRO</title>
    <link href="css/login_style.css" rel="stylesheet">
    <link rel="shortcut icon" href="css/img/LogoVII.ico" type="image/x-icon">
    <link rel="icon" href="css/img/LogoVII.ico" type="image/x-icon">
</head>
<body id="principal" style="background-image:url(css/img/Inicio.png)" ondragstart="return false" onselect="return false" oncontextmenu="return false">
    <form runat="server">
        <div id="wrap">
            <header id="cabeza" style="height:180px">
            </header>

            <section>
                <div align="center">
                    <div>
                        <dx:ASPxLabel runat="server" Text="" ForeColor="Red" ID="lblError">
                        </dx:ASPxLabel>
                        <br />
                        <table>
                            <tr id="imagen">
                                <dx:ASPxImage ID="imagen_avatar" runat="server" ImageUrl="~/css/img/Recurso 5.png">
                                </dx:ASPxImage>
                            </tr>
                            <tr>
                                <td id="texto"><p>Usuario</p></td>
                                <td>
                                    <dx:ASPxTextBox runat="server" ID="UserName" NullText="Usuario"></dx:ASPxTextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
                                        ControlToValidate="UserName"
                                        ErrorMessage="El nombre de usuario es obligatorio." CssClass="LabelTextNormal"
                                        ToolTip="El nombre de usuario es obligatorio." ValidationGroup="LoginCotizador" ForeColor="Red" Display="Dynamic">Usuario obligatorio</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td id="pwd"><p>Contraseña</p>
                                </td>
                                <td>
                                    <dx:ASPxTextBox ID="PassWord" Password="true" runat="server" NullText="Contraseña">
                                    </dx:ASPxTextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                        ControlToValidate="PassWord"
                                        ErrorMessage="La contraseña es obligatoria." CssClass="LabelTextNormal"
                                        ToolTip="La contraseña es obligatoria." ForeColor="Red" ValidationGroup="LoginCotizador" Display="Dynamic">Contraseña Obligatoria</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr style="text-align:center">
                                <td>
                                        <dx:ASPxButton ID="ASPxButton1" Border-BorderStyle="None" BackColor="Transparent" BackgroundImage-ImageUrl="~/css/img/Recurso 62.png" BackgroundImage-Repeat="NoRepeat" runat="server" AutoPostBack="true" OnClick="ASPxButton1_Click" Height="51px" Width="200px">
                                        </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <br />
                <div align="center" style="height:90px" class="clase-general">
                    <table>
                        <tr>
                            <td>
                                <dx:ASPxButton runat="server" Text="Registrarse" Theme="Material" RenderMode="Link" AutoPostBack="False" ForeColor="White" Font-Size="18px">
                                    <ClientSideEvents Click="function(s, e) {
	             window.location.href='Registrarse.aspx';
             }" />
                                </dx:ASPxButton>
                            </td>
                            <td style="width: 18px"></td>
                            <td>
                                <dx:ASPxButton runat="server" Text="Recuperar Contraseña" Theme="Material" RenderMode="Link" AutoPostBack="False" ForeColor="White" Font-Size="18px">
                                    <ClientSideEvents Click="function(s, e) {
	           puRecuperarContrasena.Show();
             }" />
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </div>
                <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server">
                </dx:ASPxLoadingPanel>
            </section>
        </div>
        <footer>
            <div style="text-align: center">
                <dx:ASPxLabel ID="ASPxLabel5" Font-Size="15px" runat="server" Font-Bold="true" ForeColor="White" Text="Gobierno del Estado de Oaxaca 2016 - 2022"></dx:ASPxLabel>
            </div>
        </footer>

        <dx:ASPxPopupControl ID="puRecuperarContrasena" Width="500px" PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" Modal="true" HeaderText="Recupera tu contraseña" ClientInstanceName="puRecuperarContrasena" runat="server">
            <ContentCollection>
                <dx:PopupControlContentControl runat="server">
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 20%">
                                <dx:ASPxLabel Theme="Material" runat="server" Text="Correo electrónico">
                                </dx:ASPxLabel>
                            </td>
                            <td style="width: 80%">
                                <dx:ASPxTextBox runat="server" Width="100%" ID="txtEmail" ClientInstanceName="txtEmail" Theme="Material">
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                        <dx:ASPxButton Text="Recuperar" runat="server" Theme="Material" ID="btnRecuperar" AutoPostBack="false" OnClick="btnRecuperar_Click">
                            <ClientSideEvents Click="function(s, e) {
                                lp.Show();
	cbRecuperar.PerformCallback()
}" />
                        </dx:ASPxButton>

                    </div>
                </dx:PopupControlContentControl>
            </ContentCollection>
        </dx:ASPxPopupControl>
        <dx:ASPxCallback ID="cbRecuperar" ClientInstanceName="cbRecuperar" OnCallback="cbRecuperar_Callback" runat="server">
            <ClientSideEvents CallbackComplete="function(s, e) {
                puRecuperarContrasena.Hide();
     lp.Hide();
	alert(e.result);
}" />
        </dx:ASPxCallback>
    </form>
</body>
</html>