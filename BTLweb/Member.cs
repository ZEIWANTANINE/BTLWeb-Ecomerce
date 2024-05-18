using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTLweb
{
    public class Member
    {
  

        public Member()
        {
        }

        
        public Member(string MemberName, string phone, string password,string UrlImg,string MST)
        {
            this.MemberName = MemberName;
            this.phone = phone;
            this.password = password;
            this.UrlImg = UrlImg;
            this.MST= MST;
        }

        /// <summary>
        /// Login name
        /// </summary>
        public string MemberName { get; set; }
        public string phone { get; set; }

        /// <summary>
        /// Password name
        /// </summary>
        public string password { get; set; }


        public string UrlImg { get; set; }
        public string MST { get; set; }
    }
}