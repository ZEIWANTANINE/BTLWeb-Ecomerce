<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangnhap.aspx.cs" Inherits="BTLweb.Dangnhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/Dangnhap.css"/>
    <title></title>
</head>
<body>
    <form id="formDangNhap" runat="server" method="post" onsubmit="return validateLoginForm();">
    <div>
          <div class="content">
            <h3>Đăng Nhập</h3>
            <div class="info">
                <div class="DienThoai">
                    <div class="text">
                        <span>Tên đăng nhập</span>
                    </div>
                    <div class="info_inputBlock">
                        <input type="text" id="sdt" name="phone" placeholder="Số điện thoại" runat="server" />
                    </div>
                </div>
                <div class="MK">
                    <div class="text">
                        <span>Mật khẩu</span>
                    </div>
                    <div class="info_inputBlock">
                        <input type="password" id="matkhau" name="Pass" placeholder="Mật khẩu" runat="server" />
                    </div>
                </div>
            </div>
              <div id="error" style="font-size: 1rem; color: red;" runat="server">
            <%--error--%>
        </div>
              <div class="button">
            <a><asp:Button id="DangNhap" runat="server" Text="DangNhap" name="DangNhap" OnClick="DangNhap_onClick"/></a>
        </div>
            
            <%--<div class="quenMK"><a>Quên mật khẩu ?</a></div>--%>
            <div class="DKMK"><p>Chưa có tài khoản đăng ký tại <a href="Dangky.aspx">đây!</a></p></div>
        </div>
    </div>
</form>
    <script src="js/DangNhap.js"></script>
    <script>
    
    </script>
</body>
</html>
