<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SendMSG.aspx.cs" Inherits="BTLweb.SendMSG" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/Sendmsg.css"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   <input type="text" id="messageInput" class="text-type" name="txtmessage"placeholder="Hãy bình luận cảm nghĩ của bạn" />
   <div class="cmt-btn">
    <button type="button" onclick="sendMessage()">Gửi</button>
    <button type="button" onclick="hideCommentForm()">Cancel</button>
   </div>
</form>
    <script>
        //cái này quan trọng để khi bấm nút nó gửi value về 
        function sendMessage() {
            var message = document.getElementById('messageInput').value;
            // Gửi tin nhắn đến trang MessageList.aspx
            // Open MessageList.aspx in a new window or tab
            window.location.href = 'MessageList.aspx?message=' + encodeURIComponent(message);
            location.reload();
        }
        
        
    
    </script>
</body>
</html>
