<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/SiteCADRO.Master" CodeBehind="imp_crede.aspx.cs" Inherits="WebApplication1.imp_crede" %>

<%@ Register Assembly="DevExpress.XtraReports.v16.1.Web, Version=16.1.12.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    </asp:content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <dx:ASPxDocumentViewer ID="dro_credencial" runat="server" SettingsReportViewer-EnableReportMargins="true"></dx:ASPxDocumentViewer>
    </div>
    </asp:content>