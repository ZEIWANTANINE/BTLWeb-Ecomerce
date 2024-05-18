<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Upload.aspx.cs" Inherits="BTLweb.Upload" %>
<%@ Import Namespace="BTLweb"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" type="text/css" href="css/Upload.css"/>
    <link rel="stylesheet" type="text/css" href="css/Tranguploadresponsive.css"/>
    <title></title>
</head>
<body>
        <form id="form1" runat="server" method="post" action="XuLyUpLoad.aspx" enctype="multipart/form-data">
         <%
            BTLweb.Member sM = Session[Global.MEMBER] as Member;
            var lstVd = Application[Global.VIDEO_LIST] as List<Video>;
            var lstMem = Application[Global.MEMBER_LIST] as List<Member>;
        %>
        <div>
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
                        <button class="profile-button"><%=sM.MemberName %></button>
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
                    
                <div class="right-side">
                    <div class="title">
                            <p class="Upload-video-title">Upload Video</p>
                        <p class="Post-video-title">Post a video to your account</p>
                    </div>
                    <div class="upload-main">
                        <div class="left-upload">
                            <div class="left-upload-title">
                                <p>Select video to upload</p>
                            </div>
                            <div class="left-upload-subtitle">
                                <p>Support mp4, avi, webm, 
                                    and mov video formats
                                    720x1280 resolution or higher
                                    Up to 10 minutes
                                    Less than 10 GB
                                    Less than 30 videos</p>
                            </div>
                            <div class="select-file-button" name="SelectFile">
                                <input type="file" name="file-video" />
                            </div>
                        </div>
                        <div class="right-upload">
                            <div class="Caption">
                                <p>Caption</p>
                                <input type="text" name="caption"/>
                            </div>
                            <div class="Description">
                                <p>Description</p>
                                <input type="text" name="description"/>
                            </div>
                            <div class="button">
                                <div class="Discard">
                                    <button>Discard</button>
                                </div>
                                <div class="Post">
                                    <input type="submit" name="postbutton" />
                                </div>
                            </div>  
                        </div>
                    </div>
                </div>
</div>
<script src="Upload.js"></script>
        </div>
    </form>
</body>
</html>
