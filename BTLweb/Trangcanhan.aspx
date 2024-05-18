<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangcanhan.aspx.cs" Inherits="BTLweb.Trangcanhan" %>
<%@ Import Namespace="BTLweb"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/Trangcanhan.css"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
    <input type="text" placeholder="Search Here What You Need..." id="txtInput"/>
    <span class="vertical-line"></span>
    <button type="button" id="search" name="btnSearch">
        <a href="Trangtimkiem.aspx.html"><img src="img/searchicon.png" alt="Search Icon" class="icon-search" /></a>
    </button>
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
            <a href="Trangchu.aspx" class="Main-title">Trang chủ</a>
        </div>
        <div class="Profile">
            <img src="img/download.jpg"/>
            <a href="Trangcanhan.aspx?user=<%=sM.MemberName %>" class="Profile-title">Trang cá nhân</a>
        </div>
        <div>
            <p class=""></p>
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
           <a class="xemthem" href="#" >Xem thêm</a>
        </div>
         <div class="footer"><!-- footer--->
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
        <div class="account">
                    <%
            foreach(var m in lstMem)
            {
                if(m.MemberName.Equals(Request.QueryString["user"]))
            {%>
                              <a href="#"><img src="<%=m.UrlImg %>" class="chanel-img" alt="avatar người dùng"/>
                            </a>
                            <a><p class="userMain"><%=m.MemberName %></p></a>
                            <div class="decrip">
                                <p class="userSubTitile"><%=m.MemberName %> User</p>
                            </div>
                            <%
                                if(m.MemberName.Equals(sM.MemberName))
                                {%>
                                    <div class="editUser">
                                <a href="ChinhSuaCaNhan.aspx?user=<%=sM.MemberName %>">
                                    <img src="img/download.jpg" alt=" edit Profile"/>
                                    <p><strong>Edit Profile</strong></p>
                                </a>
                                        </div>
                                 <%}
                                %>
                            
            
                            
                            <div class="info">
                                <div class="fllowing">
                                   <p><strong>10</strong></p>
                                   <p>Fllowing</p>
                                </div>
                                <div class="fllower">
                                    <p><strong>10</strong></p>
                                    <p>Fllowers</p>
                                 </div>
                                 <div class="like">
                                    <p><strong>10</strong></p>
                                    <p>Likes</p>
                                 </div>
                            </div>
                        </div>
            <%}
            }

            %>
        

    <div class="video">
        <a href="#"><p><strong>Video</strong></p></a>
        <div class="grid-video">
        <%
            foreach(var v in lstVd)
            {
                if(v.NguoiDang.Equals(Request.QueryString["user"]))
            {%>
                 <div class="girdview_items">
                <video width="240" height="290" controls="controls">
                    <source src="img/AIDS.mp4" type="video/mp4"/>
                    Your browser does not support the video tag.
                </video>
                <div class="decripstion">
                    <div class="title">
                        <%=v.Title%>
                    </div>
                    <div class="avt">
                        <img src="img/meo.jpg" alt="avatar Người dùng"/>
                        <p>Mèo Ú</p>
                       <strong><input type="text" hidden="hidden" />14K</strong> 
                    </div>
                </div>
            </div>
            <%}
            }
            %>
        </div>
    </div>
</div>
    </div>
</form>
<script src="js/Trangcanhan.js"></script>
</body>
</html>
