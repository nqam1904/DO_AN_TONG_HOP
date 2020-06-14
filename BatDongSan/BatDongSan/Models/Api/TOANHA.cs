using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BatDongSan.Models.Api
{
    public class TOANHA
    {
        public string HinhAnh { get; set; }
        public int idBuild{ get; set; }
        public int idWard{ get; set; }
        public int idUser{ get; set; }
        public int idType{ get; set; }
        public string nameBuild{ get; set; }
        public string street{ get; set; }
        public decimal floorarea{ get; set; }
        public int floor{ get; set; }
        public string conent{ get; set; }
        public decimal price{ get; set; }
        public string depositDate{ get; set; }
        public string nameManager{ get; set; }
        public string phoneManager{ get; set; }
        public int idHuong{ get; set; }
        public int idStatus{ get; set; }
        public string deposits{ get; set; } 

    }
}