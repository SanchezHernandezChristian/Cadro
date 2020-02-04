using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using DevExpress.XtraReports.UI;

/// <summary>
/// Summary description for rptFichaIndividual
/// </summary>
public class rptFichaIndividual : DevExpress.XtraReports.UI.XtraReport
{
    private DevExpress.XtraReports.UI.DetailBand Detail;
    private DevExpress.XtraReports.UI.TopMarginBand TopMargin;
    private DevExpress.XtraReports.UI.BottomMarginBand BottomMargin;
    private XRLabel xrLabel23;
    private XRLabel xrLabel25;
    private XRLabel xrLabel26;
    private XRLabel xrLabel27;
    private XRLabel xrLabel28;
    private XRLabel xrLabel29;
    private XRLabel xrLabel30;
    private XRLabel xrLabel32;
    private XRLabel xrLabel33;
    private XRLabel xrLabel34;
    private XRLabel xrLabel35;
    private XRLabel xrLabel36;
    private XRLabel xrLabel37;
    private XRLabel xrLabel39;
    private XRLabel xrLabel40;
    private XRLabel xrLabel41;
    private XRLabel xrLabel42;
    private XRLine xrLine1;
    private DevExpress.DataAccess.ObjectBinding.ObjectDataSource objectDataSource1;
    private PageFooterBand pageFooterBand1;
    private XRPageInfo xrPageInfo1;
    private XRPageInfo xrPageInfo2;
    private ReportHeaderBand reportHeaderBand1;
    private XRControlStyle Title;
    private XRControlStyle FieldCaption;
    private XRControlStyle PageInfo;
    private XRControlStyle DataField;
    private XRLabel xrLabel44;
    private XRLabel xrLabel43;
    private XRLabel xrLabel51;
    private XRLabel xrLabel52;
    private XRLabel xrLabel53;
    private XRLabel xrLabel54;
    private XRLabel xrLabel55;
    private XRLabel xrLabel56;
    private XRLabel xrLabel57;
    private XRLabel xrLabel60;
    private XRLabel xrLabel61;
    private XRLabel xrLabel63;
    private XRLabel xrLabel65;
    private XRLabel xrLabel67;
    private XRPanel xrPanel7;
    private XRLabel xrLabel69;
    private XRLabel xrLabel70;
    private XRPanel xrPanel3;
    private XRLabel xrLabel73;
    private XRLabel xrLabel74;
    private XRLabel xrLabel76;
    private XRLabel xrLabel79;
    private XRLabel xrLabel80;
    private XRLabel xrLabel81;
    private XRPanel xrPanel8;
    private XRLabel xrLabel82;
    private XRPanel xrPanel4;
    private XRLabel xrLabel46;
    private XRPanel xrPanel5;
    private XRLabel xrLabel50;
    private XRLabel xrLabel1;
    private XRLabel xrLabel9;
    private XRLabel xrLabel2;
    private XRPictureBox xrPictureBox1;
    private XRLabel xrLabel3;
    private XRPanel xrPanel2;

    /// <summary>
    /// Required designer variable.
    /// </summary>
    private System.ComponentModel.IContainer components = null;

    public rptFichaIndividual()
    {
        InitializeComponent();
        //
        // TODO: Add constructor logic here
        //
    }

    /// <summary> 
    /// Clean up any resources being used.
    /// </summary>
    /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
    protected override void Dispose(bool disposing)
    {
        if (disposing && (components != null))
        {
            components.Dispose();
        }
        base.Dispose(disposing);
    }

    #region Designer generated code

    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    private void InitializeComponent()
    {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(rptFichaIndividual));
            this.Detail = new DevExpress.XtraReports.UI.DetailBand();
            this.xrPanel4 = new DevExpress.XtraReports.UI.XRPanel();
            this.xrLabel9 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel46 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrPanel5 = new DevExpress.XtraReports.UI.XRPanel();
            this.xrLabel50 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel1 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel2 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel51 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel52 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel53 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel54 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel55 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel56 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel57 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel60 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel61 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel63 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel65 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel67 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel36 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel39 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel37 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel28 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel26 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel25 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel40 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel29 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel30 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel33 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel32 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrPanel7 = new DevExpress.XtraReports.UI.XRPanel();
            this.xrLabel69 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel70 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel27 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrPanel3 = new DevExpress.XtraReports.UI.XRPanel();
            this.xrLabel73 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel74 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel76 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel23 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel42 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel79 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel80 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel81 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrPanel8 = new DevExpress.XtraReports.UI.XRPanel();
            this.xrLabel82 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel35 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel34 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel41 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLine1 = new DevExpress.XtraReports.UI.XRLine();
            this.TopMargin = new DevExpress.XtraReports.UI.TopMarginBand();
            this.BottomMargin = new DevExpress.XtraReports.UI.BottomMarginBand();
            this.pageFooterBand1 = new DevExpress.XtraReports.UI.PageFooterBand();
            this.xrPageInfo1 = new DevExpress.XtraReports.UI.XRPageInfo();
            this.xrPageInfo2 = new DevExpress.XtraReports.UI.XRPageInfo();
            this.reportHeaderBand1 = new DevExpress.XtraReports.UI.ReportHeaderBand();
            this.xrPictureBox1 = new DevExpress.XtraReports.UI.XRPictureBox();
            this.xrLabel43 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrLabel44 = new DevExpress.XtraReports.UI.XRLabel();
            this.Title = new DevExpress.XtraReports.UI.XRControlStyle();
            this.FieldCaption = new DevExpress.XtraReports.UI.XRControlStyle();
            this.PageInfo = new DevExpress.XtraReports.UI.XRControlStyle();
            this.DataField = new DevExpress.XtraReports.UI.XRControlStyle();
            this.xrLabel3 = new DevExpress.XtraReports.UI.XRLabel();
            this.xrPanel2 = new DevExpress.XtraReports.UI.XRPanel();
            this.objectDataSource1 = new DevExpress.DataAccess.ObjectBinding.ObjectDataSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.objectDataSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this)).BeginInit();
            // 
            // Detail
            // 
            this.Detail.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPanel2,
            this.xrPanel4,
            this.xrPanel5,
            this.xrPanel7,
            this.xrPanel3,
            this.xrPanel8});
            this.Detail.Dpi = 100F;
            this.Detail.HeightF = 474.4615F;
            this.Detail.Name = "Detail";
            this.Detail.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.Detail.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // xrPanel4
            // 
            this.xrPanel4.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrPanel4.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel9,
            this.xrLabel46});
            this.xrPanel4.Dpi = 100F;
            this.xrPanel4.LocationFloat = new DevExpress.Utils.PointFloat(206.0976F, 386.2342F);
            this.xrPanel4.Name = "xrPanel4";
            this.xrPanel4.SizeF = new System.Drawing.SizeF(370.8333F, 75F);
            this.xrPanel4.StylePriority.UseBorders = false;
            // 
            // xrLabel9
            // 
            this.xrLabel9.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel9.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "status")});
            this.xrLabel9.Dpi = 100F;
            this.xrLabel9.LocationFloat = new DevExpress.Utils.PointFloat(15.18809F, 41.99988F);
            this.xrLabel9.Name = "xrLabel9";
            this.xrLabel9.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel9.SizeF = new System.Drawing.SizeF(345.398F, 23.00005F);
            this.xrLabel9.StylePriority.UseBorders = false;
            this.xrLabel9.StylePriority.UseTextAlignment = false;
            this.xrLabel9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabel46
            // 
            this.xrLabel46.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel46.Dpi = 100F;
            this.xrLabel46.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel46.LocationFloat = new DevExpress.Utils.PointFloat(85F, 10F);
            this.xrLabel46.Name = "xrLabel46";
            this.xrLabel46.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel46.SizeF = new System.Drawing.SizeF(198F, 19F);
            this.xrLabel46.StylePriority.UseBorders = false;
            this.xrLabel46.StylePriority.UseFont = false;
            this.xrLabel46.StylePriority.UseTextAlignment = false;
            this.xrLabel46.Text = "RESULTADO DE DICTAMEN";
            this.xrLabel46.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrPanel5
            // 
            this.xrPanel5.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrPanel5.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel50,
            this.xrLabel1});
            this.xrPanel5.Dpi = 100F;
            this.xrPanel5.LocationFloat = new DevExpress.Utils.PointFloat(9.999995F, 295F);
            this.xrPanel5.Name = "xrPanel5";
            this.xrPanel5.SizeF = new System.Drawing.SizeF(728.0001F, 75.00003F);
            this.xrPanel5.StylePriority.UseBorders = false;
            // 
            // xrLabel50
            // 
            this.xrLabel50.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel50.Dpi = 100F;
            this.xrLabel50.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel50.LocationFloat = new DevExpress.Utils.PointFloat(2.000046F, 1.999982F);
            this.xrLabel50.Name = "xrLabel50";
            this.xrLabel50.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel50.SizeF = new System.Drawing.SizeF(102.5F, 17.79165F);
            this.xrLabel50.StylePriority.UseBorders = false;
            this.xrLabel50.StylePriority.UseFont = false;
            this.xrLabel50.Text = "Observaciones";
            // 
            // xrLabel1
            // 
            this.xrLabel1.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "observaciones")});
            this.xrLabel1.Dpi = 100F;
            this.xrLabel1.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel1.LocationFloat = new DevExpress.Utils.PointFloat(104.5F, 9.999956F);
            this.xrLabel1.Name = "xrLabel1";
            this.xrLabel1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel1.SizeF = new System.Drawing.SizeF(608.8549F, 55.20838F);
            this.xrLabel1.StylePriority.UseFont = false;
            // 
            // xrLabel2
            // 
            this.xrLabel2.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel2.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "FechaCurso")});
            this.xrLabel2.Dpi = 100F;
            this.xrLabel2.LocationFloat = new DevExpress.Utils.PointFloat(490.2368F, 132.36F);
            this.xrLabel2.Name = "xrLabel2";
            this.xrLabel2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel2.SizeF = new System.Drawing.SizeF(247.7632F, 18F);
            this.xrLabel2.StylePriority.UseBorders = false;
            // 
            // xrLabel51
            // 
            this.xrLabel51.Dpi = 100F;
            this.xrLabel51.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel51.ForeColor = System.Drawing.Color.Black;
            this.xrLabel51.LocationFloat = new DevExpress.Utils.PointFloat(2F, 71F);
            this.xrLabel51.Name = "xrLabel51";
            this.xrLabel51.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel51.SizeF = new System.Drawing.SizeF(81.2888F, 18F);
            this.xrLabel51.StyleName = "FieldCaption";
            this.xrLabel51.StylePriority.UseFont = false;
            this.xrLabel51.StylePriority.UseForeColor = false;
            this.xrLabel51.Text = "Telefonos:";
            // 
            // xrLabel52
            // 
            this.xrLabel52.Dpi = 100F;
            this.xrLabel52.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel52.ForeColor = System.Drawing.Color.Black;
            this.xrLabel52.LocationFloat = new DevExpress.Utils.PointFloat(410F, 28F);
            this.xrLabel52.Name = "xrLabel52";
            this.xrLabel52.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel52.SizeF = new System.Drawing.SizeF(70.33331F, 18F);
            this.xrLabel52.StyleName = "FieldCaption";
            this.xrLabel52.StylePriority.UseFont = false;
            this.xrLabel52.StylePriority.UseForeColor = false;
            this.xrLabel52.Text = "Profesión:";
            // 
            // xrLabel53
            // 
            this.xrLabel53.Dpi = 100F;
            this.xrLabel53.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel53.ForeColor = System.Drawing.Color.Black;
            this.xrLabel53.LocationFloat = new DevExpress.Utils.PointFloat(2F, 28F);
            this.xrLabel53.Name = "xrLabel53";
            this.xrLabel53.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel53.SizeF = new System.Drawing.SizeF(61F, 18F);
            this.xrLabel53.StyleName = "FieldCaption";
            this.xrLabel53.StylePriority.UseFont = false;
            this.xrLabel53.StylePriority.UseForeColor = false;
            this.xrLabel53.Text = "Nombre:";
            // 
            // xrLabel54
            // 
            this.xrLabel54.Dpi = 100F;
            this.xrLabel54.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel54.ForeColor = System.Drawing.Color.Black;
            this.xrLabel54.LocationFloat = new DevExpress.Utils.PointFloat(362F, 50F);
            this.xrLabel54.Name = "xrLabel54";
            this.xrLabel54.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel54.SizeF = new System.Drawing.SizeF(70.41675F, 18F);
            this.xrLabel54.StyleName = "FieldCaption";
            this.xrLabel54.StylePriority.UseFont = false;
            this.xrLabel54.StylePriority.UseForeColor = false;
            this.xrLabel54.Text = "Municipio:";
            // 
            // xrLabel55
            // 
            this.xrLabel55.Dpi = 100F;
            this.xrLabel55.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel55.ForeColor = System.Drawing.Color.Black;
            this.xrLabel55.LocationFloat = new DevExpress.Utils.PointFloat(2F, 50F);
            this.xrLabel55.Name = "xrLabel55";
            this.xrLabel55.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel55.SizeF = new System.Drawing.SizeF(81.24706F, 18.00001F);
            this.xrLabel55.StyleName = "FieldCaption";
            this.xrLabel55.StylePriority.UseFont = false;
            this.xrLabel55.StylePriority.UseForeColor = false;
            this.xrLabel55.Text = "Domicilio:";
            // 
            // xrLabel56
            // 
            this.xrLabel56.Dpi = 100F;
            this.xrLabel56.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel56.ForeColor = System.Drawing.Color.Black;
            this.xrLabel56.LocationFloat = new DevExpress.Utils.PointFloat(363F, 71F);
            this.xrLabel56.Name = "xrLabel56";
            this.xrLabel56.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel56.SizeF = new System.Drawing.SizeF(70.45847F, 18F);
            this.xrLabel56.StyleName = "FieldCaption";
            this.xrLabel56.StylePriority.UseFont = false;
            this.xrLabel56.StylePriority.UseForeColor = false;
            this.xrLabel56.Text = "Colegio:";
            // 
            // xrLabel57
            // 
            this.xrLabel57.Dpi = 100F;
            this.xrLabel57.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel57.ForeColor = System.Drawing.Color.Black;
            this.xrLabel57.LocationFloat = new DevExpress.Utils.PointFloat(2F, 90F);
            this.xrLabel57.Name = "xrLabel57";
            this.xrLabel57.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel57.SizeF = new System.Drawing.SizeF(81.08025F, 18.00001F);
            this.xrLabel57.StyleName = "FieldCaption";
            this.xrLabel57.StylePriority.UseFont = false;
            this.xrLabel57.StylePriority.UseForeColor = false;
            this.xrLabel57.Text = "Egresado:";
            // 
            // xrLabel60
            // 
            this.xrLabel60.Dpi = 100F;
            this.xrLabel60.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel60.ForeColor = System.Drawing.Color.Black;
            this.xrLabel60.LocationFloat = new DevExpress.Utils.PointFloat(1.999991F, 110F);
            this.xrLabel60.Name = "xrLabel60";
            this.xrLabel60.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel60.SizeF = new System.Drawing.SizeF(101.0582F, 17.99997F);
            this.xrLabel60.StyleName = "FieldCaption";
            this.xrLabel60.StylePriority.UseFont = false;
            this.xrLabel60.StylePriority.UseForeColor = false;
            this.xrLabel60.Text = "Fecha de Titulo:";
            // 
            // xrLabel61
            // 
            this.xrLabel61.Dpi = 100F;
            this.xrLabel61.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel61.ForeColor = System.Drawing.Color.Black;
            this.xrLabel61.LocationFloat = new DevExpress.Utils.PointFloat(245F, 110F);
            this.xrLabel61.Name = "xrLabel61";
            this.xrLabel61.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel61.SizeF = new System.Drawing.SizeF(121.8824F, 18.00001F);
            this.xrLabel61.StyleName = "FieldCaption";
            this.xrLabel61.StylePriority.UseFont = false;
            this.xrLabel61.StylePriority.UseForeColor = false;
            this.xrLabel61.Text = "Cédula Profesional:";
            // 
            // xrLabel63
            // 
            this.xrLabel63.Dpi = 100F;
            this.xrLabel63.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel63.ForeColor = System.Drawing.Color.Black;
            this.xrLabel63.LocationFloat = new DevExpress.Utils.PointFloat(525F, 110F);
            this.xrLabel63.Name = "xrLabel63";
            this.xrLabel63.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel63.SizeF = new System.Drawing.SizeF(111.5125F, 18.00001F);
            this.xrLabel63.StyleName = "FieldCaption";
            this.xrLabel63.StylePriority.UseFont = false;
            this.xrLabel63.StylePriority.UseForeColor = false;
            this.xrLabel63.Text = "Fecha de Cédula:";
            // 
            // xrLabel65
            // 
            this.xrLabel65.Dpi = 100F;
            this.xrLabel65.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel65.ForeColor = System.Drawing.Color.Black;
            this.xrLabel65.LocationFloat = new DevExpress.Utils.PointFloat(1.999991F, 138.5577F);
            this.xrLabel65.Name = "xrLabel65";
            this.xrLabel65.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel65.SizeF = new System.Drawing.SizeF(207.9166F, 43.78922F);
            this.xrLabel65.StyleName = "FieldCaption";
            this.xrLabel65.StylePriority.UseFont = false;
            this.xrLabel65.StylePriority.UseForeColor = false;
            this.xrLabel65.Text = "Cursos de actualización y/o postgrados:";
            // 
            // xrLabel67
            // 
            this.xrLabel67.Dpi = 100F;
            this.xrLabel67.Font = new System.Drawing.Font("Arial", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel67.ForeColor = System.Drawing.Color.Black;
            this.xrLabel67.LocationFloat = new DevExpress.Utils.PointFloat(414.6535F, 132.3601F);
            this.xrLabel67.Name = "xrLabel67";
            this.xrLabel67.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel67.SizeF = new System.Drawing.SizeF(75.58325F, 18F);
            this.xrLabel67.StyleName = "FieldCaption";
            this.xrLabel67.StylePriority.UseFont = false;
            this.xrLabel67.StylePriority.UseForeColor = false;
            this.xrLabel67.Text = "FECHA:";
            // 
            // xrLabel36
            // 
            this.xrLabel36.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel36.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "nombre")});
            this.xrLabel36.Dpi = 100F;
            this.xrLabel36.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel36.LocationFloat = new DevExpress.Utils.PointFloat(85F, 28F);
            this.xrLabel36.Name = "xrLabel36";
            this.xrLabel36.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel36.SizeF = new System.Drawing.SizeF(324.125F, 18.00001F);
            this.xrLabel36.StyleName = "DataField";
            this.xrLabel36.StylePriority.UseBorders = false;
            this.xrLabel36.StylePriority.UseFont = false;
            this.xrLabel36.Text = "xrLabel36";
            // 
            // xrLabel39
            // 
            this.xrLabel39.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel39.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Profesion")});
            this.xrLabel39.Dpi = 100F;
            this.xrLabel39.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel39.LocationFloat = new DevExpress.Utils.PointFloat(481F, 27.99999F);
            this.xrLabel39.Name = "xrLabel39";
            this.xrLabel39.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel39.SizeF = new System.Drawing.SizeF(237.0001F, 18F);
            this.xrLabel39.StyleName = "DataField";
            this.xrLabel39.StylePriority.UseBorders = false;
            this.xrLabel39.StylePriority.UseFont = false;
            this.xrLabel39.Text = "xrLabel39";
            // 
            // xrLabel37
            // 
            this.xrLabel37.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel37.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "nombreMunicipio")});
            this.xrLabel37.Dpi = 100F;
            this.xrLabel37.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel37.LocationFloat = new DevExpress.Utils.PointFloat(433F, 50.00002F);
            this.xrLabel37.Name = "xrLabel37";
            this.xrLabel37.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel37.SizeF = new System.Drawing.SizeF(285.0001F, 17.99999F);
            this.xrLabel37.StyleName = "DataField";
            this.xrLabel37.StylePriority.UseBorders = false;
            this.xrLabel37.StylePriority.UseFont = false;
            this.xrLabel37.Text = "xrLabel37";
            // 
            // xrLabel28
            // 
            this.xrLabel28.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel28.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Colegio")});
            this.xrLabel28.Dpi = 100F;
            this.xrLabel28.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel28.LocationFloat = new DevExpress.Utils.PointFloat(434F, 71F);
            this.xrLabel28.Name = "xrLabel28";
            this.xrLabel28.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel28.SizeF = new System.Drawing.SizeF(284.0001F, 18F);
            this.xrLabel28.StyleName = "DataField";
            this.xrLabel28.StylePriority.UseBorders = false;
            this.xrLabel28.StylePriority.UseFont = false;
            this.xrLabel28.Text = "xrLabel28";
            // 
            // xrLabel26
            // 
            this.xrLabel26.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel26.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "cedula")});
            this.xrLabel26.Dpi = 100F;
            this.xrLabel26.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel26.LocationFloat = new DevExpress.Utils.PointFloat(372F, 110F);
            this.xrLabel26.Name = "xrLabel26";
            this.xrLabel26.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel26.SizeF = new System.Drawing.SizeF(148.29F, 18.00001F);
            this.xrLabel26.StyleName = "DataField";
            this.xrLabel26.StylePriority.UseBorders = false;
            this.xrLabel26.StylePriority.UseFont = false;
            this.xrLabel26.Text = "xrLabel26";
            // 
            // xrLabel25
            // 
            this.xrLabel25.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel25.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "calle_numero")});
            this.xrLabel25.Dpi = 100F;
            this.xrLabel25.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel25.LocationFloat = new DevExpress.Utils.PointFloat(86F, 50F);
            this.xrLabel25.Name = "xrLabel25";
            this.xrLabel25.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel25.SizeF = new System.Drawing.SizeF(275F, 18F);
            this.xrLabel25.StyleName = "DataField";
            this.xrLabel25.StylePriority.UseBorders = false;
            this.xrLabel25.StylePriority.UseFont = false;
            this.xrLabel25.Text = "xrLabel25";
            // 
            // xrLabel40
            // 
            this.xrLabel40.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel40.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "telefono_celular")});
            this.xrLabel40.Dpi = 100F;
            this.xrLabel40.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel40.LocationFloat = new DevExpress.Utils.PointFloat(86F, 71F);
            this.xrLabel40.Name = "xrLabel40";
            this.xrLabel40.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel40.SizeF = new System.Drawing.SizeF(275.6277F, 18F);
            this.xrLabel40.StyleName = "DataField";
            this.xrLabel40.StylePriority.UseBorders = false;
            this.xrLabel40.StylePriority.UseFont = false;
            this.xrLabel40.Text = "xrLabel40";
            // 
            // xrLabel29
            // 
            this.xrLabel29.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrLabel29.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Cursos")});
            this.xrLabel29.Dpi = 100F;
            this.xrLabel29.LocationFloat = new DevExpress.Utils.PointFloat(219.7277F, 138.5577F);
            this.xrLabel29.Name = "xrLabel29";
            this.xrLabel29.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel29.SizeF = new System.Drawing.SizeF(498.1885F, 43.78922F);
            this.xrLabel29.StyleName = "DataField";
            this.xrLabel29.StylePriority.UseBorders = false;
            this.xrLabel29.Text = "xrLabel29";
            // 
            // xrLabel30
            // 
            this.xrLabel30.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel30.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Egresado")});
            this.xrLabel30.Dpi = 100F;
            this.xrLabel30.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel30.LocationFloat = new DevExpress.Utils.PointFloat(86.99997F, 89.99999F);
            this.xrLabel30.Name = "xrLabel30";
            this.xrLabel30.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel30.SizeF = new System.Drawing.SizeF(631.0001F, 18F);
            this.xrLabel30.StyleName = "DataField";
            this.xrLabel30.StylePriority.UseBorders = false;
            this.xrLabel30.StylePriority.UseFont = false;
            this.xrLabel30.Text = "xrLabel30";
            // 
            // xrLabel33
            // 
            this.xrLabel33.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel33.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "FechaExpTitulo")});
            this.xrLabel33.Dpi = 100F;
            this.xrLabel33.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel33.LocationFloat = new DevExpress.Utils.PointFloat(105F, 110F);
            this.xrLabel33.Name = "xrLabel33";
            this.xrLabel33.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel33.SizeF = new System.Drawing.SizeF(129.6397F, 18.00001F);
            this.xrLabel33.StyleName = "DataField";
            this.xrLabel33.StylePriority.UseBorders = false;
            this.xrLabel33.StylePriority.UseFont = false;
            this.xrLabel33.Text = "xrLabel33";
            // 
            // xrLabel32
            // 
            this.xrLabel32.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel32.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "FechaExpCedula")});
            this.xrLabel32.Dpi = 100F;
            this.xrLabel32.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel32.LocationFloat = new DevExpress.Utils.PointFloat(637F, 110F);
            this.xrLabel32.Name = "xrLabel32";
            this.xrLabel32.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel32.SizeF = new System.Drawing.SizeF(80.91626F, 18.00005F);
            this.xrLabel32.StyleName = "DataField";
            this.xrLabel32.StylePriority.UseBorders = false;
            this.xrLabel32.StylePriority.UseFont = false;
            this.xrLabel32.Text = "xrLabel32";
            // 
            // xrPanel7
            // 
            this.xrPanel7.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrPanel7.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel69,
            this.xrLabel70,
            this.xrLabel27});
            this.xrPanel7.Dpi = 100F;
            this.xrPanel7.LocationFloat = new DevExpress.Utils.PointFloat(282.6429F, 210F);
            this.xrPanel7.Name = "xrPanel7";
            this.xrPanel7.SizeF = new System.Drawing.SizeF(212.75F, 72.69389F);
            this.xrPanel7.StylePriority.UseBorders = false;
            // 
            // xrLabel69
            // 
            this.xrLabel69.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel69.Dpi = 100F;
            this.xrLabel69.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel69.LocationFloat = new DevExpress.Utils.PointFloat(2F, 2F);
            this.xrLabel69.Name = "xrLabel69";
            this.xrLabel69.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel69.SizeF = new System.Drawing.SizeF(205.8751F, 32.37494F);
            this.xrLabel69.StylePriority.UseBorders = false;
            this.xrLabel69.StylePriority.UseFont = false;
            this.xrLabel69.StylePriority.UseTextAlignment = false;
            this.xrLabel69.Text = "CLASIFICACION DE DIRECTOR RESPONSABLE DE OBRA";
            this.xrLabel69.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel70
            // 
            this.xrLabel70.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel70.Dpi = 100F;
            this.xrLabel70.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel70.LocationFloat = new DevExpress.Utils.PointFloat(24.01274F, 47.29174F);
            this.xrLabel70.Name = "xrLabel70";
            this.xrLabel70.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel70.SizeF = new System.Drawing.SizeF(64.34437F, 15.70828F);
            this.xrLabel70.StylePriority.UseBorders = false;
            this.xrLabel70.StylePriority.UseFont = false;
            this.xrLabel70.StylePriority.UseTextAlignment = false;
            this.xrLabel70.Text = "TIPO:";
            this.xrLabel70.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel27
            // 
            this.xrLabel27.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel27.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "ClasificaDirectorTipo")});
            this.xrLabel27.Dpi = 100F;
            this.xrLabel27.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel27.LocationFloat = new DevExpress.Utils.PointFloat(90.35709F, 44.99996F);
            this.xrLabel27.Name = "xrLabel27";
            this.xrLabel27.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel27.SizeF = new System.Drawing.SizeF(91.76735F, 17.99999F);
            this.xrLabel27.StyleName = "DataField";
            this.xrLabel27.StylePriority.UseBorders = false;
            this.xrLabel27.StylePriority.UseFont = false;
            this.xrLabel27.Text = "xrLabel27";
            // 
            // xrPanel3
            // 
            this.xrPanel3.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrPanel3.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel73,
            this.xrLabel74,
            this.xrLabel76,
            this.xrLabel23,
            this.xrLabel42});
            this.xrPanel3.Dpi = 100F;
            this.xrPanel3.LocationFloat = new DevExpress.Utils.PointFloat(9.999995F, 210F);
            this.xrPanel3.Name = "xrPanel3";
            this.xrPanel3.SizeF = new System.Drawing.SizeF(272.6429F, 72.69389F);
            this.xrPanel3.StylePriority.UseBorders = false;
            // 
            // xrLabel73
            // 
            this.xrLabel73.CanShrink = true;
            this.xrLabel73.Dpi = 100F;
            this.xrLabel73.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel73.ForeColor = System.Drawing.Color.Black;
            this.xrLabel73.KeepTogether = true;
            this.xrLabel73.LocationFloat = new DevExpress.Utils.PointFloat(1.999991F, 22.08344F);
            this.xrLabel73.Name = "xrLabel73";
            this.xrLabel73.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel73.SizeF = new System.Drawing.SizeF(107.792F, 18F);
            this.xrLabel73.StyleName = "FieldCaption";
            this.xrLabel73.StylePriority.UseFont = false;
            this.xrLabel73.StylePriority.UseForeColor = false;
            this.xrLabel73.Text = "Año de Registro:";
            // 
            // xrLabel74
            // 
            this.xrLabel74.CanShrink = true;
            this.xrLabel74.Dpi = 100F;
            this.xrLabel74.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel74.ForeColor = System.Drawing.Color.Black;
            this.xrLabel74.KeepTogether = true;
            this.xrLabel74.LocationFloat = new DevExpress.Utils.PointFloat(1.999991F, 45.00004F);
            this.xrLabel74.Name = "xrLabel74";
            this.xrLabel74.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel74.SizeF = new System.Drawing.SizeF(107.792F, 17.99994F);
            this.xrLabel74.StyleName = "FieldCaption";
            this.xrLabel74.StylePriority.UseFont = false;
            this.xrLabel74.StylePriority.UseForeColor = false;
            this.xrLabel74.Text = "Vigencia:";
            // 
            // xrLabel76
            // 
            this.xrLabel76.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel76.CanShrink = true;
            this.xrLabel76.Dpi = 100F;
            this.xrLabel76.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel76.KeepTogether = true;
            this.xrLabel76.LocationFloat = new DevExpress.Utils.PointFloat(2F, 2F);
            this.xrLabel76.Name = "xrLabel76";
            this.xrLabel76.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel76.SizeF = new System.Drawing.SizeF(166.0417F, 17.79167F);
            this.xrLabel76.StylePriority.UseBorders = false;
            this.xrLabel76.StylePriority.UseFont = false;
            this.xrLabel76.Text = "REGISTRO COMO D.R.O.";
            // 
            // xrLabel23
            // 
            this.xrLabel23.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel23.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "AnioRegistro")});
            this.xrLabel23.Dpi = 100F;
            this.xrLabel23.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel23.LocationFloat = new DevExpress.Utils.PointFloat(114.0603F, 22.08344F);
            this.xrLabel23.Name = "xrLabel23";
            this.xrLabel23.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel23.SizeF = new System.Drawing.SizeF(151.2765F, 18.00002F);
            this.xrLabel23.StyleName = "DataField";
            this.xrLabel23.StylePriority.UseBorders = false;
            this.xrLabel23.StylePriority.UseFont = false;
            this.xrLabel23.Text = "xrLabel23";
            // 
            // xrLabel42
            // 
            this.xrLabel42.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel42.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "Vigencia")});
            this.xrLabel42.Dpi = 100F;
            this.xrLabel42.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel42.LocationFloat = new DevExpress.Utils.PointFloat(114.0603F, 44.99996F);
            this.xrLabel42.Name = "xrLabel42";
            this.xrLabel42.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel42.SizeF = new System.Drawing.SizeF(151.2765F, 18F);
            this.xrLabel42.StyleName = "DataField";
            this.xrLabel42.StylePriority.UseBorders = false;
            this.xrLabel42.StylePriority.UseFont = false;
            this.xrLabel42.Text = "xrLabel42";
            // 
            // xrLabel79
            // 
            this.xrLabel79.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel79.Dpi = 100F;
            this.xrLabel79.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel79.LocationFloat = new DevExpress.Utils.PointFloat(1.999991F, 1.999991F);
            this.xrLabel79.Name = "xrLabel79";
            this.xrLabel79.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel79.SizeF = new System.Drawing.SizeF(716.0001F, 17.79167F);
            this.xrLabel79.StylePriority.UseBorders = false;
            this.xrLabel79.StylePriority.UseFont = false;
            this.xrLabel79.Text = "DATOS PERSONALES";
            // 
            // xrLabel80
            // 
            this.xrLabel80.Dpi = 100F;
            this.xrLabel80.Font = new System.Drawing.Font("Arial", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel80.LocationFloat = new DevExpress.Utils.PointFloat(0F, 248.6152F);
            this.xrLabel80.Name = "xrLabel80";
            this.xrLabel80.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel80.SizeF = new System.Drawing.SizeF(154.9586F, 17.79167F);
            this.xrLabel80.StylePriority.UseFont = false;
            this.xrLabel80.Text = "FOLIO DE SOLICITUD:";
            // 
            // xrLabel81
            // 
            this.xrLabel81.Dpi = 100F;
            this.xrLabel81.Font = new System.Drawing.Font("Arial", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel81.LocationFloat = new DevExpress.Utils.PointFloat(0F, 266.6152F);
            this.xrLabel81.Name = "xrLabel81";
            this.xrLabel81.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel81.SizeF = new System.Drawing.SizeF(91.28878F, 17.79167F);
            this.xrLabel81.StylePriority.UseFont = false;
            this.xrLabel81.Text = "SOLICITA:";
            // 
            // xrPanel8
            // 
            this.xrPanel8.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrPanel8.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel82,
            this.xrLabel35});
            this.xrPanel8.Dpi = 100F;
            this.xrPanel8.LocationFloat = new DevExpress.Utils.PointFloat(495.3929F, 210F);
            this.xrPanel8.Name = "xrPanel8";
            this.xrPanel8.SizeF = new System.Drawing.SizeF(242.6071F, 72.69389F);
            this.xrPanel8.StylePriority.UseBorders = false;
            // 
            // xrLabel82
            // 
            this.xrLabel82.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.xrLabel82.Dpi = 100F;
            this.xrLabel82.Font = new System.Drawing.Font("Arial", 9F, System.Drawing.FontStyle.Bold);
            this.xrLabel82.LocationFloat = new DevExpress.Utils.PointFloat(1.999991F, 1.999991F);
            this.xrLabel82.Name = "xrLabel82";
            this.xrLabel82.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel82.SizeF = new System.Drawing.SizeF(237F, 45F);
            this.xrLabel82.StylePriority.UseBorders = false;
            this.xrLabel82.StylePriority.UseFont = false;
            this.xrLabel82.StylePriority.UseTextAlignment = false;
            this.xrLabel82.Text = "REGISTRO ÚNICO DE DIRECTOR RESPONSABLE DE OBRA EN EL ESTADO";
            this.xrLabel82.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter;
            // 
            // xrLabel35
            // 
            this.xrLabel35.Borders = DevExpress.XtraPrinting.BorderSide.Bottom;
            this.xrLabel35.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "id_RegistroDRO")});
            this.xrLabel35.Dpi = 100F;
            this.xrLabel35.Font = new System.Drawing.Font("Arial", 9F);
            this.xrLabel35.LocationFloat = new DevExpress.Utils.PointFloat(50.33049F, 47.29174F);
            this.xrLabel35.Name = "xrLabel35";
            this.xrLabel35.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel35.SizeF = new System.Drawing.SizeF(141.9185F, 18F);
            this.xrLabel35.StyleName = "DataField";
            this.xrLabel35.StylePriority.UseBorders = false;
            this.xrLabel35.StylePriority.UseFont = false;
            this.xrLabel35.StylePriority.UseTextAlignment = false;
            this.xrLabel35.Text = "xrLabel35";
            this.xrLabel35.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter;
            // 
            // xrLabel34
            // 
            this.xrLabel34.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "id")});
            this.xrLabel34.Dpi = 100F;
            this.xrLabel34.Font = new System.Drawing.Font("Arial", 10F);
            this.xrLabel34.LocationFloat = new DevExpress.Utils.PointFloat(154.9586F, 248.6152F);
            this.xrLabel34.Name = "xrLabel34";
            this.xrLabel34.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel34.SizeF = new System.Drawing.SizeF(61.20837F, 18F);
            this.xrLabel34.StyleName = "DataField";
            this.xrLabel34.StylePriority.UseFont = false;
            this.xrLabel34.Text = "xrLabel34";
            // 
            // xrLabel41
            // 
            this.xrLabel41.DataBindings.AddRange(new DevExpress.XtraReports.UI.XRBinding[] {
            new DevExpress.XtraReports.UI.XRBinding("Text", null, "tramite_que_solicita")});
            this.xrLabel41.Dpi = 100F;
            this.xrLabel41.Font = new System.Drawing.Font("Arial", 10F);
            this.xrLabel41.LocationFloat = new DevExpress.Utils.PointFloat(95.62434F, 266.6152F);
            this.xrLabel41.Name = "xrLabel41";
            this.xrLabel41.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel41.SizeF = new System.Drawing.SizeF(313.4173F, 17.99997F);
            this.xrLabel41.StyleName = "DataField";
            this.xrLabel41.StylePriority.UseFont = false;
            this.xrLabel41.Text = "xrLabel41";
            // 
            // xrLine1
            // 
            this.xrLine1.Dpi = 100F;
            this.xrLine1.LocationFloat = new DevExpress.Utils.PointFloat(25.35497F, 293.2172F);
            this.xrLine1.Name = "xrLine1";
            this.xrLine1.SizeF = new System.Drawing.SizeF(698F, 2F);
            // 
            // TopMargin
            // 
            this.TopMargin.Dpi = 100F;
            this.TopMargin.HeightF = 13.45919F;
            this.TopMargin.Name = "TopMargin";
            this.TopMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.TopMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // BottomMargin
            // 
            this.BottomMargin.Dpi = 100F;
            this.BottomMargin.HeightF = 61F;
            this.BottomMargin.Name = "BottomMargin";
            this.BottomMargin.Padding = new DevExpress.XtraPrinting.PaddingInfo(0, 0, 0, 0, 100F);
            this.BottomMargin.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopLeft;
            // 
            // pageFooterBand1
            // 
            this.pageFooterBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrPageInfo1,
            this.xrPageInfo2});
            this.pageFooterBand1.Dpi = 100F;
            this.pageFooterBand1.HeightF = 29F;
            this.pageFooterBand1.Name = "pageFooterBand1";
            // 
            // xrPageInfo1
            // 
            this.xrPageInfo1.Dpi = 100F;
            this.xrPageInfo1.LocationFloat = new DevExpress.Utils.PointFloat(6F, 6F);
            this.xrPageInfo1.Name = "xrPageInfo1";
            this.xrPageInfo1.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrPageInfo1.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime;
            this.xrPageInfo1.SizeF = new System.Drawing.SizeF(313F, 23F);
            this.xrPageInfo1.StyleName = "PageInfo";
            // 
            // xrPageInfo2
            // 
            this.xrPageInfo2.Dpi = 100F;
            this.xrPageInfo2.Format = "Página {0} de {1}";
            this.xrPageInfo2.LocationFloat = new DevExpress.Utils.PointFloat(331F, 6F);
            this.xrPageInfo2.Name = "xrPageInfo2";
            this.xrPageInfo2.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrPageInfo2.SizeF = new System.Drawing.SizeF(313F, 23F);
            this.xrPageInfo2.StyleName = "PageInfo";
            this.xrPageInfo2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight;
            // 
            // reportHeaderBand1
            // 
            this.reportHeaderBand1.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel3,
            this.xrPictureBox1,
            this.xrLabel43,
            this.xrLabel44,
            this.xrLine1,
            this.xrLabel80,
            this.xrLabel34,
            this.xrLabel41,
            this.xrLabel81,
            this.xrLabel67,
            this.xrLabel2});
            this.reportHeaderBand1.Dpi = 100F;
            this.reportHeaderBand1.HeightF = 305.2172F;
            this.reportHeaderBand1.Name = "reportHeaderBand1";
            // 
            // xrPictureBox1
            // 
            this.xrPictureBox1.Dpi = 100F;
            this.xrPictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("xrPictureBox1.Image")));
            this.xrPictureBox1.LocationFloat = new DevExpress.Utils.PointFloat(348.0557F, 0F);
            this.xrPictureBox1.Name = "xrPictureBox1";
            this.xrPictureBox1.SizeF = new System.Drawing.SizeF(390.7955F, 116.2499F);
            // 
            // xrLabel43
            // 
            this.xrLabel43.Dpi = 100F;
            this.xrLabel43.Font = new System.Drawing.Font("Arial", 10F);
            this.xrLabel43.ForeColor = System.Drawing.Color.Black;
            this.xrLabel43.LocationFloat = new DevExpress.Utils.PointFloat(71.20856F, 225.6152F);
            this.xrLabel43.Name = "xrLabel43";
            this.xrLabel43.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel43.SizeF = new System.Drawing.SizeF(314.7332F, 20.70834F);
            this.xrLabel43.StyleName = "Title";
            this.xrLabel43.StylePriority.UseFont = false;
            this.xrLabel43.StylePriority.UseForeColor = false;
            this.xrLabel43.StylePriority.UseTextAlignment = false;
            this.xrLabel43.Text = "DICTAMEN DE SOLICITUD";
            this.xrLabel43.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // xrLabel44
            // 
            this.xrLabel44.Dpi = 100F;
            this.xrLabel44.Font = new System.Drawing.Font("Arial", 12F, System.Drawing.FontStyle.Bold);
            this.xrLabel44.ForeColor = System.Drawing.Color.Black;
            this.xrLabel44.LocationFloat = new DevExpress.Utils.PointFloat(0F, 175.3235F);
            this.xrLabel44.Name = "xrLabel44";
            this.xrLabel44.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel44.SizeF = new System.Drawing.SizeF(458.5836F, 50.29166F);
            this.xrLabel44.StyleName = "Title";
            this.xrLabel44.StylePriority.UseFont = false;
            this.xrLabel44.StylePriority.UseForeColor = false;
            this.xrLabel44.StylePriority.UseTextAlignment = false;
            this.xrLabel44.Text = "COMISIÓN DE ADMISIÓN DE DIRECTORES RESPONSABLES DE OBRA EN EL ESTADO DE OAXACA";
            this.xrLabel44.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // Title
            // 
            this.Title.BackColor = System.Drawing.Color.Transparent;
            this.Title.BorderColor = System.Drawing.Color.Black;
            this.Title.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.Title.BorderWidth = 1F;
            this.Title.Font = new System.Drawing.Font("Times New Roman", 20F, System.Drawing.FontStyle.Bold);
            this.Title.ForeColor = System.Drawing.Color.Maroon;
            this.Title.Name = "Title";
            // 
            // FieldCaption
            // 
            this.FieldCaption.BackColor = System.Drawing.Color.Transparent;
            this.FieldCaption.BorderColor = System.Drawing.Color.Black;
            this.FieldCaption.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.FieldCaption.BorderWidth = 1F;
            this.FieldCaption.Font = new System.Drawing.Font("Arial", 10F, System.Drawing.FontStyle.Bold);
            this.FieldCaption.ForeColor = System.Drawing.Color.Maroon;
            this.FieldCaption.Name = "FieldCaption";
            // 
            // PageInfo
            // 
            this.PageInfo.BackColor = System.Drawing.Color.Transparent;
            this.PageInfo.BorderColor = System.Drawing.Color.Black;
            this.PageInfo.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.PageInfo.BorderWidth = 1F;
            this.PageInfo.Font = new System.Drawing.Font("Times New Roman", 10F, System.Drawing.FontStyle.Bold);
            this.PageInfo.ForeColor = System.Drawing.Color.Black;
            this.PageInfo.Name = "PageInfo";
            // 
            // DataField
            // 
            this.DataField.BackColor = System.Drawing.Color.Transparent;
            this.DataField.BorderColor = System.Drawing.Color.Black;
            this.DataField.Borders = DevExpress.XtraPrinting.BorderSide.None;
            this.DataField.BorderWidth = 1F;
            this.DataField.Font = new System.Drawing.Font("Times New Roman", 10F);
            this.DataField.ForeColor = System.Drawing.Color.Black;
            this.DataField.Name = "DataField";
            this.DataField.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            // 
            // xrLabel3
            // 
            this.xrLabel3.Dpi = 100F;
            this.xrLabel3.Font = new System.Drawing.Font("Arial", 10F, System.Drawing.FontStyle.Bold);
            this.xrLabel3.LocationFloat = new DevExpress.Utils.PointFloat(0F, 225.6152F);
            this.xrLabel3.Name = "xrLabel3";
            this.xrLabel3.Padding = new DevExpress.XtraPrinting.PaddingInfo(2, 2, 0, 0, 100F);
            this.xrLabel3.SizeF = new System.Drawing.SizeF(71.20856F, 22.99998F);
            this.xrLabel3.StylePriority.UseFont = false;
            this.xrLabel3.StylePriority.UseTextAlignment = false;
            this.xrLabel3.Text = "ASUNTO: ";
            this.xrLabel3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft;
            // 
            // xrPanel2
            // 
            this.xrPanel2.Borders = ((DevExpress.XtraPrinting.BorderSide)((((DevExpress.XtraPrinting.BorderSide.Left | DevExpress.XtraPrinting.BorderSide.Top) 
            | DevExpress.XtraPrinting.BorderSide.Right) 
            | DevExpress.XtraPrinting.BorderSide.Bottom)));
            this.xrPanel2.Controls.AddRange(new DevExpress.XtraReports.UI.XRControl[] {
            this.xrLabel79,
            this.xrLabel36,
            this.xrLabel53,
            this.xrLabel52,
            this.xrLabel39,
            this.xrLabel40,
            this.xrLabel25,
            this.xrLabel51,
            this.xrLabel55,
            this.xrLabel28,
            this.xrLabel37,
            this.xrLabel56,
            this.xrLabel54,
            this.xrLabel30,
            this.xrLabel57,
            this.xrLabel60,
            this.xrLabel33,
            this.xrLabel61,
            this.xrLabel26,
            this.xrLabel63,
            this.xrLabel32,
            this.xrLabel65,
            this.xrLabel29});
            this.xrPanel2.Dpi = 100F;
            this.xrPanel2.LocationFloat = new DevExpress.Utils.PointFloat(9.999995F, 9.999995F);
            this.xrPanel2.Name = "xrPanel2";
            this.xrPanel2.SizeF = new System.Drawing.SizeF(728.0001F, 192.3469F);
            this.xrPanel2.StylePriority.UseBorders = false;
            // 
            // objectDataSource1
            // 
            this.objectDataSource1.DataSource = typeof(WebApplication1.Code.ReporteFichaIndividual);
            this.objectDataSource1.Name = "objectDataSource1";
            // 
            // rptFichaIndividual
            // 
            this.Bands.AddRange(new DevExpress.XtraReports.UI.Band[] {
            this.Detail,
            this.TopMargin,
            this.BottomMargin,
            this.pageFooterBand1,
            this.reportHeaderBand1});
            this.ComponentStorage.AddRange(new System.ComponentModel.IComponent[] {
            this.objectDataSource1});
            this.DataSource = this.objectDataSource1;
            this.Margins = new System.Drawing.Printing.Margins(50, 52, 13, 61);
            this.StyleSheet.AddRange(new DevExpress.XtraReports.UI.XRControlStyle[] {
            this.Title,
            this.FieldCaption,
            this.PageInfo,
            this.DataField});
            this.Version = "16.1";
            ((System.ComponentModel.ISupportInitialize)(this.objectDataSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this)).EndInit();

    }

    #endregion
}
