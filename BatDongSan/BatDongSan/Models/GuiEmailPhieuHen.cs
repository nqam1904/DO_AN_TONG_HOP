using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BatDongSan.Models
{
    public class GuiEmailPhieuHen
    {
        public string token { get; set; }
        public string To { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
    }
}