<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subeced.aspx.cs" Inherits="WebApplication1.subeced" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Text="1" Width="170px"></dx:ASPxTextBox>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text=""></dx:ASPxLabel>
        <br />
        <br />
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        <asp:Button ID="btnSubirArchivo" runat="server" Text="Subir Archivo" 
            onclick="btnSubirArchivo_Click"  />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click"/>
        <asp:RegularExpressionValidator 
             id="RegularExpressionValidator1" runat="server" 
             ErrorMessage="Solo archivos PDF" 
             ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(pdf)$" 
             ControlToValidate="FileUpload1">
        </asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
            ForeColor="#333333" GridLines="None" onrowdeleting="GridView1_RowDeleting" DataKeyNames="Name">
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:TemplateField HeaderText="Nombre Archivo">
                    <ItemTemplate>
                        <asp:HyperLink ID="nombre" runat="server" NavigateUrl='<%# Eval("Name", "~/Documents/Cedulas/"+ASPxLabel1.Text+"/{0}") %>'
                            Text='<%# Eval("Name") %>'>
                        </asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Descargar" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <dx:ASPxButton ID="ASPxButton1" runat="server" RenderMode="Link" Text="Descargar" OnClick="ASPxButton1_Click"></dx:ASPxButton>
                   <%--     <asp:HyperLink ID="descarga" Text="Descargar" runat="server" NavigateUrl='<%# Eval("Name", "~/Download.aspx?filename={0}") %>'> 
                               
                        </asp:HyperLink>
--%> 
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
    </form>
</body>
</html>
