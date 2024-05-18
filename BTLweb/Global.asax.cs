using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace BTLweb
{
    public class Global : System.Web.HttpApplication
    {
        
        public const string MEMBER_LIST = "MemberList";

        public const string ListVideo = "ListVideo";
        public const string VIDEO_LIST = "VideoList";
        public const string MEMBER = "Member";

        protected void Application_Start(object sender, EventArgs e)
        {
            Application[ListVideo] = createProductList();
          
            Application[MEMBER_LIST] = createAListOfMember();
            Application[VIDEO_LIST] = createAListOfVideo();

        }
        
        private List<Findvideo> createProductList()
        {
            return new List<Findvideo>
            {
                new Findvideo { Id = 1, Videourl = "/img/AIDS.mp4", Title = "Một con mèo đi ngủ", Avatarurl = "/img/meo3.jpg",NameChanel="Cuộc sống của mèo béo" ,View="15K" },
                new Findvideo { Id = 2, Videourl = "/img/AIDS.mp4", Title = "Căn bệnh ung thư đáng sợ như thế nào", Avatarurl = "/img/meo3.jpg",NameChanel="Lời khuyên bệnh tật" ,View="25K"},
                new Findvideo { Id = 3, Videourl = "/img/AIDS.mp4", Title = "AIDS căn bệnh nguy hiểm", Avatarurl = "/img/meo3.jpg",NameChanel="Cuộc sống của mèo béo" ,View="55K"},
                new Findvideo { Id = 4, Videourl = "/img/AIDS.mp4", Title = "Một số điều bạn nên biết về loài mèo", Avatarurl = "/img/meo3.jpg", NameChanel = "Cuộc sống của mèo béo", View = "150K" },
                new Findvideo { Id = 5, Videourl = "/img/AIDS.mp4", Title = "Sản phẩm chính hãng", Avatarurl = "/img/meo3.jpg", NameChanel = "Cuộc sống của mèo béo", View = "10K" },
                new Findvideo { Id = 6, Videourl = "/img/AIDS.mp4", Title = "Một con mèo đi ngủ", Avatarurl = "/img/meo3.jpg", NameChanel = "Cuộc sống của mèo béo", View = "100K" },
                new Findvideo { Id = 7, Videourl = "/img/AIDS.mp4", Title = "Một con mèo đi ngủ", Avatarurl = "/img/meo3.jpg", NameChanel = "Cuộc sống của mèo béo", View = "16K" },
                new Findvideo { Id = 8, Videourl = "/img/AIDS.mp4", Title = "Một con mèo đi ngủ", Avatarurl = "/img/meo3.jpg", NameChanel = "Cuộc sống của mèo béo", View = "19K" },
                new Findvideo { Id = 9, Videourl = "/img/AIDS.mp4", Title = "Một con mèo đi ngủ", Avatarurl = "/img/meo3.jpg", NameChanel = "Cuộc sống của mèo béo", View = "200K" },
                new Findvideo { Id = 10, Videourl = "/img/AIDS.mp4", Title = "Một con mèo đi ngủ", Avatarurl = "/img/meo3.jpg", NameChanel = "Cuộc sống của mèo béo", View = "1K" },

            };
        }
        private object createAListOfVideo()
        {
            return new List<Video>()
            {
                new Video{ID = "1",VideoUrl ="../img/AIDS.mp4", Title="ConMeo", NguoiDang="user1"}
                , new Video{ID="2", VideoUrl ="../img/khoga.mp4", Title="Cận Cảnh Chế Biến Khô Bò", NguoiDang="user2"}
                , new Video{ID="3", VideoUrl ="../img/AIDS.mp4", Title="Camping in car", NguoiDang="trinhhoangdat"}
                , new Video{ID="4", VideoUrl ="/img/AIDS.mp4", Title="Chill", NguoiDang="vutiendat"}
                , new Video{ID="5", VideoUrl ="/img/AIDS.mp4", Title="Anh nghĩ em tiếc anh sao", NguoiDang="vuquangduoc"}
                , new Video{ID="6", VideoUrl ="/img/AIDS.mp4", Title="Xương sống kêu rộp rộp", NguoiDang="trinhhoangdat"}
                , new Video{ID="7", VideoUrl ="/img/AIDS.mp4", Title="Thắng Idol", NguoiDang="vutiendat"}
            };
        }
        protected void Session_Start(object sender, EventArgs e)
        {
            Session[MEMBER] = new Member { };
        }
        private List<Member> createAListOfMember()
        {
           
            return new List<Member>()
            {
                new Member{MemberName="user1", password="pass1", phone="098765432",UrlImg="../img/user1.jpg"}
                ,new Member{MemberName="user2", password="pass", phone="099765432",UrlImg="../img/meo2.jpg"}
                ,new Member{MemberName="long", password="123456", phone="0947269603",UrlImg="../img/meo3.jpg"}
            };
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}