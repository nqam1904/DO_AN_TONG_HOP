using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BatDongSan.Models.Api
{
    public class BILL
    {
        public int idBill { get; set; }
        public int idCustom { get; set; }
        public int idUserNV { get; set; }
        public int idBuild { get; set; }
        public int totalPrice { get; set; }
        public DateTime createDate { get; set; }
        public string content { get; set; }
        public string cmndTruoc { get; set; }
        public string cmndSau { get; set; }
        public DateTime ngayKyTen { get; set; }
        public string kyten { get; set; }
    }
}