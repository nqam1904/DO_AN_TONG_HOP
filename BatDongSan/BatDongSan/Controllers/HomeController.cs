using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BatDongSan.Controllers
{
    public class HomeController : Controller
    {
        BDSEntities db = new BDSEntities();
        public ActionResult Index(int? idBuild, string timkiem)
        {
            ViewBag.idBuild = idBuild;
            ViewBag.TimKiem = timkiem;
            return View();
        }
        public ActionResult ListBuild()
        {
            
            return View();
        }
        public ActionResult ListType()
        {
            //ViewBag.idCity = idCity;
            //ViewBag.idDistrict = idDistrict;
            //ViewBag.idWard = idWard;
            //ViewBag.Id = id;
            return View();
        }
        public ActionResult Theo_Quan(int id)
        {
           
            ViewBag.IdQuan = id;
            
            return View();
        }
        public ActionResult Theo_Loai(int id)
        {

            ViewBag.IdLoai = id;
            return View();
        }
        public ActionResult Theo_Huong(int id)
        {
            ViewBag.IdHuong = id;
            return View();
        }
        public ActionResult TinTuc()
        {
            return View();
        }
        public ActionResult ChiTietTinTuc(int id)
        {
            ViewBag.IdNews = id;
            return View();
        }
        public ActionResult ChiTietToaNha(int id)
        {
            ViewBag.IdBuild = id;
            return View();
        }
      
        //[HttpPost]
        //public ActionResult PhieuHen()
        //{
        //    return PartialView("_PartialPhieuHen");
        //}
    }
}