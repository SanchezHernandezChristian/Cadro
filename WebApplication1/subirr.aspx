<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="subirr.aspx.cs" Inherits="WebApplication1.subirr" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script type="text/javascript">
        function onFileUploadComplete(s, e) {
            if(e.callbackData) {
                var fileData = e.callbackData.split('|');
                var fileName = fileData[0],
                    fileUrl = fileData[1],
                    fileSize = fileData[2];
                DXUploadedFilesContainer.AddFile(fileName, fileUrl, fileSize);
            }
        }
    </script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxUploadControl ID="ASPxUploadControl1" runat="server" Width="280px" ClientInstanceName="UploadControl" NullText="Selecciona cedula" UploadMode="Advanced" ShowUploadButton="True" ShowProgressPanel="True"
            OnFileUploadComplete="UploadControl_FileUploadComplete">
            <AdvancedModeSettings EnableMultiSelect="True" EnableFileList="True" EnableDragAndDrop="True" />
            <ValidationSettings MaxFileSize="4194304" AllowedFileExtensions=".jpg,.jpeg,.gif,.png">
            </ValidationSettings>
            <ClientSideEvents FilesUploadStart="function(s, e) { DXUploadedFilesContainer.Clear(); }"
                              FileUploadComplete="onFileUploadComplete"/>
        </dx:ASPxUploadControl>
    </div>
    </form>
</body>
</html>
