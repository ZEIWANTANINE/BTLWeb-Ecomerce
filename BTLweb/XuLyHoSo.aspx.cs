using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLweb
{
    public partial class XuLyHoSo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BTLweb.Member sM = Session[Global.MEMBER] as Member;
            HttpPostedFile file = Request.Files["file-anh"];
            string tenDangNhap = Request.Form["txtTenDangNhap"];
            string matkhauCu = Request.Form["txtMatKhauCu"];
            string matkhauMoi = Request.Form["txtMatKhauMoi"];
            var lstmem = Application[Global.MEMBER_LIST] as List<Member>;
            foreach (var m in lstmem)
            {
                if (m.MemberName.Equals(sM.MemberName))
                {
                    if (matkhauCu.Equals(sM.password))
                    {
                        if (matkhauMoi != null && !string.IsNullOrEmpty(matkhauMoi))
                        {
                            m.password = matkhauMoi;
                        }
                        if (file != null && file.ContentLength > 0)
                        {
                            string a = "1";
                            string fileNameWithoutExtension = Path.GetFileNameWithoutExtension(file.FileName);
                            string fileExtension = Path.GetExtension(file.FileName);
                            string filePath = Server.MapPath("~/img") + "\\" + fileNameWithoutExtension + fileExtension;
                            while (File.Exists(filePath))
                            {
                                fileNameWithoutExtension = fileNameWithoutExtension + a;
                                filePath = Server.MapPath("~/img") + "\\" + fileNameWithoutExtension + fileExtension;

                            }
                            file.SaveAs(filePath);
                            m.UrlImg = "../img/" + fileNameWithoutExtension + fileExtension;

                        }
                        Session[Global.MEMBER] = m;
                        Response.Redirect("Trangcanhan.aspx?user=" + m.MemberName);
                    }
                }
            }
            Response.Redirect("ChinhSuaCaNhan.aspx?loi=true");
    }
    }
}