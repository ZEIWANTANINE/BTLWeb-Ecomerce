using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BTLweb
{
    public class Message
    {
        public string phone, message, timeStamp;
        public Message() { }

        public Message( string mess, string time, string phone)
        {
            this.phone= phone;
            this.message = mess;
            this.timeStamp = time;
        }
    }
}