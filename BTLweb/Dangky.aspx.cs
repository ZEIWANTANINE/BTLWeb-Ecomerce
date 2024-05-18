using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLweb
{
    public partial class Dangky : System.Web.UI.Page
    {
        List<Member> listMember;
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void Dangky_onClick(object sender, EventArgs e)
        {
            if(IsPostBack) {
                string name = Request.Form.Get("hoten");
                string phone = Request.Form.Get("sdt");
                string password = Request.Form.Get("matkhau");
                string MST = Request.Form.Get("MST");
                bool check = true;
                if (Session["listMember"] == null)
                {
                    Session["listMember"] = new List<Member>();
                }
                List<Member> sessionListMember = (List<Member>)Application[Global.MEMBER_LIST];

                foreach (Member member in sessionListMember)
                {
                    if (member.phone == phone)
                    {
                        check = false;
                        error.InnerHtml = "ERROR: Phone number existed!";
                        break;
                    }
                    else
                    {
                        error.InnerHtml = "";
                    }
                }

                if (check)
                {
                    Member newMember = new Member(name, phone, password, "/img/meo3.jpg", MST);
                    sessionListMember.Add(newMember);
                    // Update the Application state with the new list of members
                    Application[Global.MEMBER_LIST] = sessionListMember;
                    // Redirect to the login page or any other page
                    Response.Redirect("Dangnhap.aspx");
                }
            }
            
        }
    }
    
}