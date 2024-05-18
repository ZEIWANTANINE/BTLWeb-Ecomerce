using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BTLweb
{
    public partial class MessageList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Lấy tin nhắn từ Query Parameters
            // string message = Request.QueryString["message"];
            //phần if này giống với bên SendMSG.aspx
            /*  if (!string.IsNullOrEmpty(message))
              {
                  // Lấy danh sách tin nhắn từ Session hoặc khởi tạo nếu chưa tồn tại
                  List<string> messages = (List<string>)Session["DSSM"];
                  if (messages == null)
                  {
                      messages = new List<string>();
                  }

                  // Thêm tin nhắn mới vào danh sách
                  messages.Add(message);

                  // Lưu danh sách tin nhắn vào Session
                  Session["DSSM"] = messages;
              }
            */

            // Hiển thị danh sách tin nhắn
            // Lấy tin nhắn từ Query Parameters
           
            string message = Request.QueryString["message"];
            string phone = Request.QueryString["phone"];
            string date = DateTime.Now.ToLongTimeString();
            Member member = (Member)Session["member"];
            
            if (!string.IsNullOrEmpty(message))
            {
                // Lấy danh sách tin nhắn từ Application hoặc khởi tạo nếu chưa tồn tại
                List<Message> messages = (List<Message>)Application["DSSM"];
                if (messages == null)
                {
                    messages = new List<Message>();
                }
                
                // Thêm tin nhắn mới vào danh sách
                messages.Add(new Message(phone,message, date));

                // Lưu danh sách tin nhắn vào Application
                Application["DSSM"] = messages;
            }

            // Hiển thị danh sách tin nhắn
            List<Message> displayedMessages = (List<Message>)Application["DSSM"];
            if (displayedMessages != null)
            {
                foreach (Message msg in displayedMessages)
                {
                    Response.Write($"{msg.phone} ({msg.timeStamp}): {msg.message}<br/>");
                }
            }
        }
    }
 }
