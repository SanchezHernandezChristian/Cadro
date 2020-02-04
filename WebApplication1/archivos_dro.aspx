<%@ Page Language="C#" MasterPageFile="~/SiteCADRO.Master" AutoEventWireup="true" CodeBehind="archivos_dro.aspx.cs" Inherits="WebApplication1.archivos_dro" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    
       
    <script type="text/javascript">

        function UploadFile(s, e) {
            uploadControl.Upload();
            uploadControl2.Upload();
            uploadControl3.Upload();
            uploadControl4.Upload();
            uploadControl5.Upload();
            uploadControl6.Upload();
            uploadControl7.Upload();
            uploadControl8.Upload();
        }

        function uploadFile_OnFileUploadComplete(s, e) {
            resultUploadFile = e.callbackData.split("|");
            if (resultUploadFile[0] == "ok") {
                btnGuardar.SetEnabled(false);
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

        function onTokenBoxValidation(s, e) {
            var isValid =  UploadedFilesTokenBox.GetText().length > 0;
            e.isValid = isValid;
            if (!isValid) {
                e.errorText = "Debes subir el documento";
            }
        }
        function onTokenBoxValueChanged(s, e) {
            updateTokenBoxVisibility();
        }
        function updateTokenBoxVisibility() {
            var isTokenBoxVisible = UploadedFilesTokenBox.GetTokenCollection().length > 0;
            UploadedFilesTokenBox.SetVisible(isTokenBoxVisible);
        }

        function GuardarOficios(s, e) {
            cbGuardarOficios.PerformCallback();
        }

        function onCallbackCompletecbGuardarOficios(s, e) {
            try {
                lp.Hide();
                
                var htmlData = e.result.split("|");
                if (htmlData[0] == "true") {
                    var ubicacion = "solicitante.aspx"
                    console.log(htmlData[1])
                    notexitoso(htmlData[1], ubicacion);
                    btnGuardar.SetEnabled(false);
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

    </script>

    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
     <div class="col-md-12">
         <dx:ASPxMenu ID="menuCadro" runat="server" Width="100%" Orientation="Horizontal" HorizontalAlign="Left" Theme="Material" BackColor="White">
                <Items>
                                            <dx:MenuItem Text="Inicio" NavigateUrl="solicitante.aspx">
                                                <Image Url="css/img/Recurso 29.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem Text="Nuevos Trámites" NavigateUrl="registros_dro.aspx">
                                                <Image Url="css/img/Recurso 30.png">
                                                </Image>
                                            </dx:MenuItem>
                                            <dx:MenuItem Text="PII" NavigateUrl="dro_misproyectos.aspx">
                                            </dx:MenuItem>
                                        </Items>
            </dx:ASPxMenu>
    </div>

            <ol class="breadcrumb justify-content-center">
              <li class="breadcrumb-item">
                <a><strong>Registro D. R. O.</strong></a>
              </li>
            </ol>


    <div class="form-label-group col-md-5">
                            <label>Cédula Profesional</label>
                            <dx:ASPxTextBox MaxLength="10" ID="txtCedula" ClientInstanceName="txtCedula" runat="server" Theme="Material" CssClass="form-control" ClientEnabled="false">
                            </dx:ASPxTextBox>
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="" Visible="false" ClientVisible="false"></dx:ASPxLabel>
                        </div>
    <br />
    <br />
    <p class="text-center text-black rounded h5" style="background-color: cornsilk">Datos personales</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Paterno</label>
                                            <dx:ASPxTextBox ID="txtApaterno" runat="server" ClientEnabled="false" Theme="Material" MaxLength="25" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
                           
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Apellido Materno</label>
                                            <dx:ASPxTextBox ID="txtAMaterno" runat="server" ClientEnabled="false" MaxLength="25" Theme="Material" Width="100%" CssClass="form-control">   
                                            </dx:ASPxTextBox>
                            
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Nombre(s)</label>
                                            <dx:ASPxTextBox ID="txtNombres" runat="server" ClientEnabled="false" Theme="Material" MaxLength="40" Width="100%" CssClass="form-control">
                                                <ValidationSettings SetFocusOnError="True" ErrorText="" ErrorTextPosition="Bottom">
                                                    <RequiredField IsRequired="True" ErrorText="Obligatorio" />
                                                </ValidationSettings>
                                            </dx:ASPxTextBox>
              
                                        </div>
                                    </div>
                                </div>
     <p class="text-center text-black rounded h5" style="background-color: cornsilk">Documentos para registro</p>
                                <div class="form-group">
                                    <div class="row" >
                                        <div class="form-label-group col-md-4">
                                            <label>Comprobante de pago del trámite</label>
                                            <dx:ASPxUploadControl ID="pago" Theme="Material" runat="server" Width="280px" ShowProgressPanel="True" ClientInstanceName="uploadControl" 
                                                UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="pago_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304" MaxFileCount="1">

            </ValidationSettings>
                                                <ClientSideEvents 
                FilesUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                            <label>El comprobante deberá ser escaneado junto con el ticket de pago</label>
                                            <dx:ASPxTokenBox runat="server" Width="100%" ID="UploadedFilesTokenBox" ClientInstanceName="UploadedFilesTokenBox" NullText="Selecciona Pdf" AllowCustomTokens="false" ClientVisible="false">
                                                <ClientSideEvents Init="updateTokenBoxVisibility" ValueChanged="onTokenBoxValueChanged" Validation="onTokenBoxValidation" />
                                                <ValidationSettings EnableCustomValidation="true" />
                                            </dx:ASPxTokenBox>
                                            <br />
                                            <br />
                                            </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Credencial de elector</label>
                                            
                                            <dx:ASPxUploadControl ID="credencial" Theme="Material" runat="server" Width="280px"  ClientInstanceName="uploadControl2"
                                                UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="credencial_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304">
            </ValidationSettings>
                                                <ClientSideEvents 
                FileUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                            <label>La credencial de elector deberá ser vigente, escaneada ambos lados</label>

                                            <br />
                                            <br />
                                            </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Comprobante de domicilio</label>
                                            
                                            <dx:ASPxUploadControl ID="domicilio" Theme="Material" runat="server" Width="280px"  ClientInstanceName="uploadControl3"
                                                UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="domicilio_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304">
            </ValidationSettings>
                                                  <ClientSideEvents 
               FileUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                            <label>El comprobante de domicilio no debe ser mayor a 3 meses</label>
                                            <br />
                                            <br />
                                            </div>
                                        
                                        </div>
                                    <div class="row">
                                        <div class="form-label-group col-md-4">
                                            <label>Acta de nacimiento</label>
                                            <dx:ASPxUploadControl ID="acta_nac" runat="server" Theme="Material" Width="280px"  ClientInstanceName="uploadControl4"
                                                UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="acta_nac_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304">
            </ValidationSettings>
                                                  <ClientSideEvents 
                FileUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                            <label>El acta de nacimiento deberá ser reciente</label>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Curriculum Vitae</label>
                                            
                                            <dx:ASPxUploadControl ID="cv" runat="server" Width="280px" Theme="Material" ClientInstanceName="uploadControl5"
                                                UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="cv_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304">
            </ValidationSettings>
                                                  <ClientSideEvents 
                FileUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                             <label>El curriculum deberá ser reciente</label>
                                            <br />
                                            <br />
                                        </div>
                                        <div class="form-label-group col-md-4">
                                            <label>Fotografia</label>
                                            <dx:ASPxUploadControl ID="foto" runat="server" Width="280px" Theme="Material" ClientInstanceName="uploadControl6"
                                                ShowProgressPanel="True" UploadMode="Advanced" ShowUploadButton="false" OnFileUploadComplete="foto_FileUploadComplete" >
            <ValidationSettings AllowedFileExtensions=".jpg, .png"  MaxFileSize="4194304">
            </ValidationSettings>
                                                  <ClientSideEvents 
                                                       Init="function(s, e) { UpdateUploadButton6(); }" 
                TextChanged="function(s, e) { UpdateUploadButton6(); }" 
                FilesUploadComplete="uploadFile_OnFileUploadComplete" 
                FileUploadStart="function(s, e) {
                 btnGuardar.SetEnabled(false);
                }" />
                                            </dx:ASPxUploadControl>
                                             <label>La foto deberá ser tamaño infantil</label>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="form-label-group col-md-4">
                                             <label>Cédula profesional digital</label>
                                            <br />
                                            <dx:ASPxUploadControl ID="ASPxUploadControl1" Theme="Material" runat="server" Width="280px"
            ClientInstanceName="uploadControl7" OnFileUploadComplete="ASPxUploadControl1_FileUploadComplete" 
            ShowProgressPanel="True" UploadMode="Advanced" ShowUploadButton="false" >
            <ValidationSettings AllowedFileExtensions=".pdf"  MaxFileSize="4194304">
            </ValidationSettings>
                                                <ClientSideEvents 
                 FileUploadComplete="uploadFile_OnFileUploadComplete"/>
        </dx:ASPxUploadControl> 
                                             <label></label>
    <br />
    <br />
                                            </div>

                                        <div class="form-label-group col-md-4">
                                             <label>Cursos</label>

                                            <dx:ASPxUploadControl ID="cursos" runat="server" Width="280px" ClientInstanceName="uploadControl8"
                                                UploadMode="Advanced" ShowUploadButton="false" Theme="Material" OnFileUploadComplete="cursos_FileUploadComplete">
            <ValidationSettings AllowedFileExtensions=".pdf" MaxFileSize="4194304">
            </ValidationSettings>
                                                  <ClientSideEvents 
                FileUploadComplete="uploadFile_OnFileUploadComplete"/>
                                            </dx:ASPxUploadControl>
                                             <label>Los cursos deberán subirse en un solo archivo</label>
                                            </div>
                                        </div>
                                    </div>  
    <div class="form-group">
                                <div class="row  justify-content-center" >
                                    <div class="form-label-group text-center col-md-2">
            
                                                    <dx:ASPxButton ID="btnGuardar" Theme="Material" BackColor="#9999FF" runat="server" Width="150px" 
                                                        ForeColor="Black"  AutoPostBack="False" Text="Guardar" ClientInstanceName="btnGuardar"> 
                                                        <ClientSideEvents Click="function(s, e) {
                                                            UploadFile();
                                                            lp.Show();
                                                            cbGuardarOficios.PerformCallback();
                                                            }" />
                                                    </dx:ASPxButton>
                                    </div>


                                    <dx:ASPxLoadingPanel ID="lp" ClientInstanceName="lp" Theme="Material" runat="server" Modal="true">
            </dx:ASPxLoadingPanel>
    <dx:ASPxCallback ID="cbGuardarOficios" ClientInstanceName="cbGuardarOficios" runat="server" OnCallback="cbGuardarOficios_Callback">
            <ClientSideEvents CallbackComplete="function(s, e) {
	                    onCallbackCompletecbGuardarOficios(s,e);
                    }" />
        </dx:ASPxCallback>
                                    </div>
                                </div>
    

    <dx:ASPxLabel ID="correo" runat="server" Text="" Visible="false" ClientVisible="false"></dx:ASPxLabel>

    </asp:Content>