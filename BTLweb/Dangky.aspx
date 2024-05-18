<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dangky.aspx.cs" Inherits="BTLweb.Dangky" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/Dangky.css"/>
    <title></title>
</head>
<body>
    <form id="formDangKy" method="post" runat="server" onsubmit="return checkDangKy();">
    <div>
        <div class="content">
            <h3>Đăng Ký</h3>
            <div class="info">
                <div class="HoTen">
                    <div class="text">
                        <span>Họ và tên</span>
                    </div>
                    <div class="info_inputBlock">
                        <input type="text" id="hoten" name="name" placeholder="Họ và tên" runat="server" />
                    </div>
                </div>
                <div class="DienThoai">
                    <div class="text">
                        <span>Số điện thoại</span>
                    </div>
                    <div class="info_inputBlock">
                        <input type="text" id="sdt" name="phone" placeholder="Số điện thoại" runat="server" />
                    </div>
                </div>
                <%--<div class="TK">
                    <div class="text">
                        <span>Tài khoản</span>
                    </div>
                    <div class="info_inputBlock">
                        <input type="text" id="taikhoan" name="username" placeholder="Email" runat="server" />
                    </div>
                </div>--%>
                <div class="MK">
                    <div class="text">
                        <span>Mật khẩu</span>
                    </div>
                    <div class="info_inputBlock">
                        <input type="password" id="matkhau" name="Pass" placeholder="Mật khẩu" runat="server" />
                        <p id="errorpassword" style="font-size: 1rem; color: red;"></p>
                    </div>
                </div>
                <div class="MKNL">
                    <div class="text">
                        <span>Nhập lại mật khẩu</span>
                    </div>
                    <div class="info_inputBlock">
                        <input type="password" id="matkhaunhaplai" name="rePass" placeholder="Xác nhận mật khẩu" runat="server" />
                        <p id="errorpassword1" style="font-size: 1rem; color: red;"></p>
                    </div>
                </div>
                <div class="MST">
                <div class="text">
                <span>Mã số thuế</span>
                </div>
                <div class="info_inputBlock">
                    <input type="text" id="MST" name="MST" placeholder="MST" runat="server" />
                    <p id="errormst" style="font-size: 1rem; color: red;"></p>
                </div>
            </div>
            </div>
            <div id="error" style="font-size: 1rem; color: red;" runat="server">
                <%--error--%>
            </div>
            <div class="button">
                    <asp:Button ID="DangKy" cssclass="dangky" runat="server" Text="DangKy" name="DangKy" OnClick="Dangky_onClick" />
                <p id="testdangky"></p>
            </div>
            <%--<div class="button">
                <asp:Button id="DangKy" runat="server" Text="Đăng Ký" OnClick="DangKy_Click" />
            </div>--%>
            <%--<div class="quenMK"><a href="">Quên mật khẩu ?</a></div>--%>
            <div class="DKMK">
                <p>Đã có tài khoản đăng nhập tại <a href="Dangnhap.aspx">đây!</a></p>
            </div>
        </div>
    </div>
</form>
    
    <script>
        var passwordNoti = document.getElementById("errorpassword")
        var passwordNoti1 = document.getElementById("errorpassword1")
        var testRegister = document.getElementById("testdangky")
        var inputPassword = document.getElementById("matkhau")
        var inputPassword1 = document.getElementById("matkhaunhaplai")
        var inputMST=document.getElementById("MST")
       var MSTnoti=document.getElementById("errormst")
        var btnDangKy = document.getElementsByClassName("dangky")[0]

        inputPassword.addEventListener("input", () => {
            let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{5,}$/;
            //              chữ thường   chữ hoa    số        kí tự         kết hợp  độ dài 5->?
            let valid = regex.test(inputPassword.value);
            if (valid) {
                passwordNoti.innerHTML = ""
            } else {
                passwordNoti.innerHTML = "Mật khẩu không hợp lệ (A-Z)(a-z)(0-9)(7 kt->)(!@#$%^&*())"

            }
        })


        inputMST.addEventListener("input", () => {
            let regex = /[0-9]/;
            let valid = regex.test(inputMST.value);
            if (inputMST.value==Number ) {
                MSTnoti.innerHTML = ""
            } 
            if (inputMST[0] != 0) {
                MSTnoti.innerHTML = ""
            }
            if (inputMST.value.length > 8) {
                MSTnoti.innerHTML = ""
            }
            else {
                MSTnoti.innerHTML="MST không hợp lệ"
            }

        })
        
       
        

        btnDangKy.addEventListener("click", (e) => {
            if (passwordNoti.innerHTML !== ""|| passwordNoti1.innerHTML!==""){
                e.preventDefault()
                e.stopPropagation()
                document.getElementById("test_register").innerHTML = "Hãy nhập đúng kiểu dữ liệu"
            } else {

            }
        })
        inputPassword1.addEventListener("input", function () {
            if (inputPassword1.value == inputPassword.value) {
                passwordNoti1.innerHTML = "";
            } else {
                passwordNoti1.innerHTML="Mật khẩu nhập lại không khớp"
            }
        })
        //hàm ktra đăng nhập 
        function checkLoginAttempts() {
            var incorrectAttempts = <%= Session["IncorrectAttempts"] %>;
            if (incorrectAttempts >= 3) {
                alert("Tài khoản của bạn đã bị khoá tạm thời. Liên hệ với quản trị viên để mở lại.");
            }
        }

        window.onload = function () {
            checkLoginAttempts();
        };
        
    </script>
    
</body>
</html>
