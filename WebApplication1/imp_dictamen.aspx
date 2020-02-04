<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="imp_dictamen.aspx.cs" Inherits="WebApplication1.imp_dictamen" %>

<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxDocumentViewer ID="dvReporte" runat="server" SettingsReportViewer-EnableReportMargins="true"></dx:ASPxDocumentViewer>
    </div>
    </form>
</body>
</html>
