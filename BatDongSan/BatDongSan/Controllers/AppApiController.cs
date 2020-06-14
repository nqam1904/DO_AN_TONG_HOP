using BatDongSan.Models;
using BatDongSan.Models.Api;
using System;
using System.Collections.Generic;
using System.Data.Entity.Core;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Results;

namespace BatDongSan.Controllers
{
    public class AppApiController : ApiController
    {

        public string TestAPI()
        {
            return "ok";
        }
        [HttpPost]
        public JsonResult<ApiResult> Login(USER data)
        {
            ApiResult result = new ApiResult();
            try
            {
                if (String.IsNullOrEmpty(data.userName) || String.IsNullOrEmpty(data.userPassword)) throw new Exception("Vui lòng nhập đầy đủ thông tin đăng nhập");
               
               using(BDSEntities  db = new BDSEntities())
                {
                    data.userPassword = db.proc_CryptData(data.userPassword).FirstOrDefault();
                    if (!db.USERs.Any(x => x.userName.Equals(data.userName) && x.userPassword.Equals(data.userPassword)))
                    {
                        result.Message = "Tài khoản hoặc mật khẩu không chính xác, vui lòng kiểm tra lại";
                        return Json(result);
                    }
                    
                    var userDB = db.USERs.Where(x => x.userName.Equals(data.userName) && x.userPassword.Equals(data.userPassword)).FirstOrDefault();
                    if (data is null) result.Message = "Tài khoản không tồn tại!";
                    result.Data = userDB.idUser.ToString();
                    result.Success = true;
                }

            }
            catch (Exception ex)
            {
                result.Message = ex.Message;
            }
            return Json(result);
        }
        [HttpGet]
        public JsonResult<List<TOANHA>> Building()
        {
            List<TOANHA> result = new List<TOANHA>();
            using (BDSEntities db = new BDSEntities())
            {
                var lstBuild = db.BUILDINGs.ToList();
                foreach (var build in lstBuild)
                {
                    TOANHA b = new TOANHA();
                    b.idBuild = build.idBuild;
                    b.nameBuild = build.nameBuild;
                    b.nameManager = build.nameManager;
                    b.phoneManager = build.phoneManager;
                    b.price = (decimal)build.price;
                    b.street = build.street;
                    b.floor = (int)build.floor;
                    b.conent = build.conent;
                    b.depositDate = build.depositDate;
                    b.deposits = build.deposits;
                    b.floorarea = (decimal)build.floorarea;
                    b.HinhAnh = build.IMAGEs.FirstOrDefault().nameImage;
                    result.Add(b);
                }
            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult<List<TOANHA>> GetBuilding(int id)
        {
            
            List<TOANHA> result = new List<TOANHA>();
            using (BDSEntities db = new BDSEntities())
            {

                var lstBuild = db.BUILDINGs.Where(x=>x.idBuild == id).FirstOrDefault();

                TOANHA b = new TOANHA();
                b.idBuild = lstBuild.idBuild;
                b.idWard = lstBuild.idWard;
                b.idHuong = lstBuild.idHuong ?? 0;
                b.idType = lstBuild.idType;
                b.idUser = lstBuild.idUser;
                b.idStatus = lstBuild.idStatus ?? 0;
                b.nameBuild = lstBuild.nameBuild;
                b.nameManager = lstBuild.nameManager;
                b.phoneManager = lstBuild.phoneManager;
                b.price = (decimal)lstBuild.price;
                b.street = lstBuild.street;
                b.floor = (int)lstBuild.floor;
                b.conent = lstBuild.conent;
                b.depositDate = lstBuild.depositDate;
                b.deposits = lstBuild.deposits;
                b.floorarea = (decimal)lstBuild.floorarea;
                result.Add(b);
            }
            return Json(result);
        }
        [HttpGet]
        public JsonResult<List<NEWS>> News()
        {
            List<NEWS> result = new List<NEWS>();
            using (BDSEntities db = new BDSEntities())
            {
                var lstnews = db.NEWS.ToList();
                foreach (var news in lstnews)
                {
                    NEWS n = new NEWS();
                    n.idNews = news.idNews;
                    n.Description = news.Description;
                    n.titleNews = news.titleNews;
                    n.Img = news.Img;
                    n.createDate = news.createDate;
                    result.Add(n);
                }
            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult<List<NEWS>> GetNews(int id)
        {

            List<NEWS> result = new List<NEWS>();
            using (BDSEntities db = new BDSEntities())
            {

                var tintuc = db.NEWS.Where(x => x.idNews == id).FirstOrDefault();
                var nhanvien = db.USERs.Where(x => x.idUser == tintuc.idUser).FirstOrDefault();
                NEWS n = new NEWS();
                n.idNews = tintuc.idNews;
                n.idUser = nhanvien.idUser;
                n.Description = tintuc.Description;
                n.titleNews = tintuc.titleNews;
                n.Img = tintuc.Img;
                n.createDate = tintuc.createDate;
                result.Add(n);
            }
            return Json(result);
        }
        [HttpGet]
        public JsonResult<List<CUSTOMER>> Custom()
        {
            List<CUSTOMER> result = new List<CUSTOMER>();
            using(BDSEntities db = new BDSEntities())
            {
                var lstKH = db.CUSTOMERs.ToList();
                foreach (var kh in lstKH)
                {
                    CUSTOMER k = new CUSTOMER();
                    k.idCustom = kh.idCustom;
                    k.nameCustom = kh.nameCustom;
                    k.emailCustom = kh.emailCustom;
                    k.addressCustom = kh.addressCustom;
                    k.phoneCustom = kh.phoneCustom;
                    result.Add(k);
                }
            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult<List<CUSTOMER>> GetCustom(int id)
        {

            List<CUSTOMER> result = new List<CUSTOMER>();
            using (BDSEntities db = new BDSEntities())
            {

                var khachhang = db.CUSTOMERs.Where(x => x.idCustom == id).FirstOrDefault();
                CUSTOMER k = new CUSTOMER();
                k.idCustom = khachhang.idCustom;
                k.nameCustom = khachhang.nameCustom;
                k.phoneCustom = khachhang.phoneCustom;
                k.addressCustom = khachhang.addressCustom;
                k.emailCustom = khachhang.emailCustom;
                result.Add(k);
            }
            return Json(result);
        }
        [HttpGet]
        public JsonResult<List<BILL>> Bill()
        {
            List<BILL> result = new List<BILL>();
            using (BDSEntities db = new BDSEntities())
            {
                var lshopdong = db.BILLs.ToList();
                foreach (var hopdong in lshopdong)
                {
                    BILL bill = new BILL();
                    bill.idBill = hopdong.idBill;
                    bill.kyten = hopdong.kyten;
                    bill.totalPrice = hopdong.totalPrice;
                    bill.ngayKyTen = hopdong.ngayKyTen;
                    bill.idCustom = hopdong.idCustom;
                    bill.idUserNV = hopdong.idUserNV;

                    result.Add(bill);
                }
            }
            return Json(result);
        }
    }
}
