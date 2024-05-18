<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangtimkiem.aspx.cs" Inherits="BTLweb.trangTImKiem" %>
<%@ Import Namespace="BTLweb"%>
<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/Trangtimkiem.css"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <%
    BTLweb.Member sM = Session[Global.MEMBER] as Member;
    var lstVd = Application[Global.VIDEO_LIST] as List<Video>;
    var lstMem = Application[Global.MEMBER_LIST] as List<Member>;
%>

   <!-- -chỉnh lại css cho trang 
        -làm phần tìm kiếm nhập vào input mới hiện ra-->
            <header class="header">
                <div class="name-web">
                    <p class="Tiktek">Tiktek</p>
                </div>
    <div class="search-bar">
        <input type="text" placeholder="Search Here What You Need..." name="txtTenVideo"/>
        <span class="vertical-line"></span>
        <img src="img/searchicon.png" alt="Search Icon" class="icon-search"/>
    </div>
    <div class="actions">
        <div class="profile-dropdown">
            <button class="profile-button">Profile</button>
                <div class="dropdown-content">
                    <a href="Upload.aspx" class="upload-button">Upload</a>
                    <a href="Trangcanhan.aspx">Xem hồ sơ</a>
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
            <a href="Trangchu.aspx" class="Main-title">Trang chủ</a>
        </div>
        <div class="Profile">
            <img src="img/download.jpg"/>
            <a href="Trangcanhan.aspx?user=<%=sM.MemberName %>" class="Profile-title">Trang cá nhân</a>
        </div>
        <div class="follow">
            <p class="follow-title">Following accounts</p>
            <div class="Follow1">
                <a>
                    <img src="img/meo.jpg"/>
                    <div class="Title">
                        <p class="Follow-title">Mèo béo</p>
                        <p class="Follow-subtitle">Mèo béo</p>
                    </div>
                </a>
            </div>
            <div class="Follow1">
                <a>
                    <img src="img/meo.jpg"/>
                    <div class="Title">
                        <p class="Follow-title">Mèo béo</p>
                        <p class="Follow-subtitle">Mèo béo</p>
                    </div>
                 </a>
            </div>
            <p class="xemthem">Xem thêm</p>
        </div>
        <div class="footer">
            <div class="footer1">
                <a href="#">Abouts</a>
                <a href="#">Newsroom</a>
                 <a href="#">Contacts</a>
                <a href="#">Careers</a>
            </div>
        <div class="footer2">
                <a href="#">Tiktek for Good</a>
                 <a href="#">Advertise</a>
        </div>
        <div class="footer3">
                <a href="#">Deverlopers</a>
                <a href="#">Transparency</a>
        </div>
        <div class="footer4">
               <a href="#">Tiktek Rewards</a>
               <a href="#">Tiktek Embeds</a>
        </div>
        <div class="footer5">
                <a href="#">Helps</a>
                <a href="#">Safety</a>
                <a href="#">Terms</a>
                <a href="#">Privacy</a>
        </div>
        <div class="footer6">
                <a href="#">Creator Portal</a>
        </div>
        <div class="footer7">
                 <a href="#">Community Guidelines</a>
        </div>
        <p>2023 Tiktek</p>
</div>
    </div>
    <div class="maincontent">
        <p><strong>Tài Khoản</strong></p>
        <div class="account">
            <a href="#"><img src="img/meo.jpg" class="chanel-img" alt="avatar người dùng"/></a>
            <a><p class="userMain">Mèo Ú</p></a>
        <div class="decrip">
            <p class="userSubTitile">MeoU . </p>
            <strong>"10M"
                <span>Follower</span>
            </strong>
        </div>
        </div>
        <p class="video-title"><strong>Video</strong></p>
    <div class="videofind">
        
        <%var findVideo = Application[BTLweb.Global.ListVideo] as List<BTLweb.Findvideo>;
 //lay danh sach tu list da tao,viet 2 product boi vi ten project laf Product
    ///tim kiem
    if (Request.Form["txtTenVideo"] != null && !string.IsNullOrWhiteSpace(Request.Form["txtTenVideo"]))
{
    string searchText = RemoveDiacritics(Request.Form["txtTenVideo"]);

    findVideo = findVideo.FindAll(p => RemoveDiacritics(p.Title).IndexOf(searchText, StringComparison.CurrentCultureIgnoreCase) >= 0);
}

// Hàm loại bỏ dấu từ chuỗi

    foreach (var p in findVideo)// duyet tung phan tu de hien hang hoa 
    {
     %>
        <div class="grid-video">
            <div class="girdview_items">
                <video width="240" height="290" controls="controls">
                    <source src="<%=p.Videourl%>" type="video/mp4" aria-controls="controls"/>
                    Your browser does not support the video tag.
                </video>
                <div class="decripstion">
                    <div class="title">
                        <p><%=p.Title%>
                    </div>
                    <div class="avt">
                        <div class="avt-title">
                            <a><img src="<%=p.Avatarurl %>" alt="avatar Người dùng"/></a>
                            <p><%=p.NameChanel %></p>
                        </div>
                        <div class="view-title">
                            <strong><input type="text" hidden="hidden" class="view"/><%=p.View %></strong> 
                        </div>
                        
                    </div>
                    
                </div>
            </div>
          </div>
        <%} %>
        </div>
    </div>
    <script src="Trangtimkiem.js"></script>
</div>
</form>
</body>
</html>
