<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChinhSuaCaNhan.aspx.cs" Inherits="BTLweb.ChinhSuaCaNhan" %>
<%@ Import Namespace="BTLweb" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/ChinhSuaCaNhan.css"/>
</head>
<body>
              <%
                BTLweb.Member sM = Session[Global.MEMBER] as Member;
                var lstVd = Application[Global.VIDEO_LIST] as List<Video>;
                var lstMem = Application[Global.MEMBER_LIST] as List<Member>;
            %>
    <header class="header">
    <div class="name-web">
        <p class="Tiktek">Tiktek</p>
    </div>
    <div class="search-bar">
        <input type="text" placeholder="Search Here What You Need..."/>
        <span class="vertical-line"></span>
        <a href="Trangtimkiem.aspx"><img src="img/searchicon.png" alt="Search Icon" class="icon-search"/></a>
    </div>
    <div class="actions">
        <div class="profile-dropdown">
            <button class="profile-button" style="!important;color=white"><%=sM.MemberName %></button>
            <div class="dropdown-content">
              <a href="Upload.aspx?user=<%=sM.MemberName %>" class="upload-button">Upload</a>
                <a href="Trangcanhan.aspx?user=<%=sM.MemberName %>">Xem hồ sơ</a>
                <a href="Dangnhap.aspx">Đăng nhập</a>
                <a href="Dangky.aspx">Đăng ký</a>
                <a href="Dangnhap.aspx">Đăng xuất</a>
            </div>
        </div>
    </div>
</header>
<div class="body-tiktek">
    <div class="sidebar-left">
        <div class="Main">
            <img src="img/th.jpg"/>
            <p class="Main-title"><a href="Trangchu.aspx"></a>Trang chủ</p>
        </div>
        <div class="Profile">
            <img src="img/download.jpg"/>
            <p class="Profile-title"><a href="Trangcanhan.aspx"></a>Trang cá nhân</p>
        </div>
        <div>
            <p class=""></p>
        </div>
        <div class="follow">
            <p class="follow-title">Following accounts</p>
            <div class="Follow1">
                <img src="img/meo.jpg"/>
                <div class="Title">
                    <p class="Follow-title">Mèo béo</p>
                    <p class="Follow-subtitle">Mèo béo</p>
                </div>
            </div>
            <div class="Follow1">
                <img src="img/meo.jpg"/>
                <div class="Title">
                    <p class="Follow-title">Mèo béo</p>
                    <p class="Follow-subtitle">Mèo béo</p>
                </div>
            </div>
            <p class="xemthem">Xem thêm</p>
        </div>
    </div>
    </div>
     <div class="form-doi-thong-tin">
    <form  method="post" action="XuLyHoSo.aspx" enctype="multipart/form-data" runat="server">
        <% Member sM = Session[Global.MEMBER] as Member;%>
                <h1>Chỉnh sửa hồ sơ</h1>
                <img src="<%=sM.UrlImg %>" alt="avatar"/>
                <label for="file-anh">Đổi ảnh</label>
                <input type="file" id="file-anh" name="file-anh" />
                <label for="txtTenDangNhap">Tên đăng nhập</label>
                <input type="text" id="txtTenDangNhap" name="txtTenDangNhap" />
                <label for="txtTenDangNhap" id="LoiRongTenDangNhap" class="Loi">Bạn phải nhập tên đăng nhập</label>
                <label for="txtTenDangNhap" id="LoiSaiTaiKhoan"></label>
                <label for="txtMatKhauCu">Mật khẩu cũ</label>
                <input type="password" id="txtMatKhauCu" name="txtMatKhauCu" />
                <label for="txtMatKhauCu" id="LoiRongMatKhauCu" class="Loi">Bạn phải nhập mật khẩu cũ</label>
                <label for="txtMatKhauMoi">Mật khẩu mới</label>
                <input type="password" id="txtMatKhauMoi" name="txtMatKhauMoi" />
                <label for="txtNhapLaiMatKhauMoi">Nhập lại mật khẩu mới</label>
                <input type="text" id="txtNhapLaiMatKhauMoi" name="txtNhapLaiMatKhauMoi" />
                <label for="txtNhapLaiMatKhauMoi" id="LoiLapLaiMatKhau" class="Loi">Nhập lại mật khẩu không đúng</label>
                <button type="button" id="btnHuySuaHoSo" onclick="window.location.href='TrangCaNhan.aspx?user=<%=sM.MemberName %>'">Hủy</button>
                <button type="submit" id="btnXacNhanSuaHoSo">Xác nhận</button>
    </form>
         </div>
   <script src="js/ChinhSuaCaNhan.js" ></script>
</body>
</html>
