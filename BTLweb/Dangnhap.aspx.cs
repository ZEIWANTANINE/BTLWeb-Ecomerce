using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLweb
{
    public partial class Dangnhap : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["IncorrectAttempts"] = 0;
                Session["IsAccountLocked"] = false;
            }

        }
        protected void DangNhap_onClick(object sender, EventArgs e)
        {
            string phone = Request.Form["sdt"];
            string pass = Request.Form["matkhau"];

            if (IsPostBack)
            {
                var listMember = Application[Global.MEMBER_LIST] as List<Member>;

                // Validate user credentials
                Member authenticatedMember = null;
                foreach (Member member in listMember)
                {
                    if (member.MemberName == phone && member.password == pass)
                    {
                        authenticatedMember = member;
                        break;
                    }
                }

                if (authenticatedMember != null)
                {
                    // Check user role (assuming "Admin" exists in the Role property)
                    if (authenticatedMember.Role == "Admin")
                    {
                        Session[Global.MEMBER] = authenticatedMember;
                        Response.Redirect("Admin.aspx"); // Redirect to Admin page
                    }
                    else
                    {
                        Session[Global.MEMBER] = authenticatedMember;
                        Response.Redirect("User.aspx"); // Redirect to User page
                    }
                }
                else
                {
                    error.InnerHtml = "ERROR: Wrong phone number or password!";
                }
            }
        }

    }

}
