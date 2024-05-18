<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Trangchu.aspx.cs" Inherits="BTLweb.Trangchu" %>
<%@ Import Namespace="BTLweb"%>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/Trangchu.css"/>
    <link rel="stylesheet" href="icon/fontawesome-free-6.4.2-web/fontawesome-free-6.4.2-web/css/all.css"/>
    
    <title></title>
</head>
<body>

    <!-- làm nút follow chạy được
         làm nút heart chạy được
         làm nút comment sẽ hiện ra 1 trang mới-->
    <form id="form1" runat="server">
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
            <%
                BTLweb.Member sM = Session[Global.MEMBER] as Member;
                var lstVd = Application[Global.VIDEO_LIST] as List<Video>;
                var lstMem = Application[Global.MEMBER_LIST] as List<Member>;
            %>
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
    <div class="scroll">
        <div class="main-page"><!--video -->
             <%
                  foreach(var v in lstVd)
                  {
                      foreach(var m in lstMem)
                      {
                          if(v.NguoiDang.Equals(m.MemberName))
             {%>
            <div class="chanel-title">
                <div class="description">
                    <div class="main-title">
                        <div class="chanel-img">
                            <img src="<%=m.UrlImg %>" alt="avatarUser"/>
                        </div>
                        <div class="noidung">
                        <a class="chanel-name" href="TrangCaNhan.aspx?user=<%=m.MemberName%>"><%=m.MemberName%></a>
                        <p class="video-name"><%=v.Title %></p>
                        </div>
                    <div class="followbutton" id="followButton">
                        <button type="button" onclick="toggleFollow()" >Follow</button>
                    </div>   
                    <script>
                        function toggleFollow() {
                            var followButton = document.getElementById('followButton');
                            var button = followButton.querySelector('button');

                            // Toggle text content
                            if (button.textContent === 'Follow') {
                                button.textContent = 'Followed';
                            } else {
                                button.textContent = 'Follow';
                            }
                        }
                    </script>
                </div>
            </div>
            <div class="video">
                <div>
                    <video width="640" height="360" controls="controls">
                        <source src="<%=v.VideoUrl %> "type="video/mp4"/>
                        Your browser does not support the video tag.
                    </video>
                </div>
                <div class="react-button">
                        <div class="buttoncamxuc" >
                            <button class="camxuc" id="heartButton" type="button" onclick="toggleHeartColor()" >
                            <i class="fa-solid fa-heart fa-xl" id="buttonImage" ></i></button>
                        </div>
                    <span id="likeCount_video1">0</span>
                    
                        <script>
                            var btnheart = document.getElementById('buttonImage');
                            var isRed = false;
                            var likeCount = 0;

                            function toggleHeartColor() {
                                isRed = !isRed;

                            if (isRed) {
                                btnheart.classList.add('heart-red');
                            likeCount++;
            } else {
                                btnheart.classList.remove('heart-red');
                            likeCount = Math.max(0, likeCount - 1);
            }
                            document.getElementById('likeCount_video1').textContent = likeCount;
        }
                    </script>
                    
                    <!---
                        <div class="buttoncamxuc">
                            <button class="camxuc1" type="button">
                             <i class="fa-solid fa-comment-dots fa-xl"></i></button>
                        </div>
                        
                    <script>
                        document.addEventListener('DOMContentLoaded', function () {
                            // Function to hide the comment form
                            function hideCommentForm() {
                                var commentForm = document.querySelector('.binhluan');
                                commentForm.style.display = 'none';
                                // Save the state to local storage
                                localStorage.setItem('commentFormVisible', 'false');
                            }

                            // Function to show or hide the comment form based on the stored state
                            function toggleCommentForm() {
                                var commentForm = document.querySelector('.binhluan');
                                var commentFormVisible = localStorage.getItem('commentFormVisible');
                                if (commentFormVisible === 'true') {
                                    commentForm.style.display = 'block';
                                } else {
                                    commentForm.style.display = 'none';
                                }
                            }

                            // Event listener for the comment button
                            var commentButton = document.querySelector('.buttoncamxuc1 .camxuc1');
                            commentButton.addEventListener('click', function () {
                                var commentForm = document.querySelector('.binhluan');
                                if (commentForm.style.display === 'none' || commentForm.style.display === '') {
                                    commentForm.style.display = 'block';
                                    // Save the state to local storage
                                    localStorage.setItem('commentFormVisible', 'true');
                                } else {
                                    commentForm.style.display = 'none';
                                    // Save the state to local storage
                                    localStorage.setItem('commentFormVisible', 'false');
                                }
                            });

                            // Initial setup on page load
                            hideCommentForm(); // Hide the comment form by default
                            toggleCommentForm(); // Toggle the comment form based on the stored state
                        });
                    </script>
                        --->
                        <div class="buttoncamxuc">
                            <button class="camxuc">
                            <i class="fa-solid fa-share fa-xl"></i></button>
                            <div class="dropdown-content1">
                                <a ><img src="/img/facebook.jpg"/>Facebook</a>
                                <a ><img src="/img/instagram.jpg"/>Instagram</a>
                                <a ><img src="/img/twitter.jpg"/>Twitter</a>
                             </div>
                      </div>
                   </div>
                <!---
                   <div class="binhluan">
                       <p>Bình Luận</p>
                         <iframe id="sendmessArea1" name="sendmemsArea" src="SendMSG.aspx"></iframe>
                        <iframe id="messArea1" name="memsArea" src="MessageList.aspx">
                        </iframe>
                    </div>
                    -->
                </div>
           </div> 
                      <%  break;
        }
    }
}
%>
</div>
</div>     
    </form>
    <script src="Trangchu.js"></script>
</body>
</html>
