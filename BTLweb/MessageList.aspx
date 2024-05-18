<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MessageList.aspx.cs" Inherits="BTLweb.MessageList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           
        </div>
    </form>
    <script>
        // Function to reload the page every 2 seconds
        function reloadPage() {
            setTimeout(function () {
                location.reload();
            }, 1000); // 2000 milliseconds = 2 seconds
        }

        // Call the reloadPage function when the page loads
        window.onload = function () {
            reloadPage();
        };
    </script>
</body>
</html>
