
using BatDongSan.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace BatDongSan.Controllers
{
    public class AjaxController : Controller
    {
        // GET: Ajax
        public ActionResult Index()
        {
            return View();
        }
        public JsonResult GetPosition(int id)
        {
            if (Session["AdminLogin"] is null) return null;

            using (BDSEntities db = new BDSEntities())
            {
                var role = db.ROLEs.Where(x => x.idRole == id).FirstOrDefault();
                if (role is null) return null;
                return new JsonResult()
                {
                    Data = new { NAME = role.nameRole },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }
        [HttpPost]
        public string EditPosition(ROLE role)
        {
            if (Session["AdminLogin"] is null) return "";
            var user = (USER)Session["AdminLogin"];
            if (String.IsNullOrEmpty(user.userName))
            {
                return "Vui lòng không bỏ trống thông tin";
            }

            using (BDSEntities db = new BDSEntities())
            {

                ROLE r = new ROLE();
                if (role.idRole > 0) r = db.ROLEs.Where(x => x.idRole == role.idRole).FirstOrDefault();
                if (r is null) return "Dữ liệu bất thường vui lòng thử lại sau";
                r.idRole = role.idRole;
                r.nameRole = role.nameRole;
                if (role.idRole == 0) db.ROLEs.Add(r);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }

            }
            return "ok";
        }
        [HttpPost]
        public string DeleteRole(int id)
        {
            if (Session["AdminLogin"] is null) return null;

            using (BDSEntities db = new BDSEntities())
            {
                var role = db.ROLEs.Where(x => x.idRole == id).FirstOrDefault();
                if (role is null) return "Không tìm thấy đối tượng này";
                db.ROLEs.Remove(role);
                try
                {
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    return ex.Message;
                }
            }
            return "ok";
        }
        public JsonResult GetUser(int id)
        {
            using (BDSEntities db = new BDSEntities())
            {
                var user = db.USERs.Where(x => x.idUser == id).FirstOrDefault();
                if (user is null) return null;
                return new JsonResult()
                {
                    Data = new { USERNAME = user.userName, PASSWORD = user.userPassword, FULLNAME = user.FullName, PHONE = user.Phone, EMAIL = user.Email, DIACHI = user.Address, ROLE = user.idRole },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }

        [HttpPost]
        public JsonResult PostChangePassword(string oldPass, string newPass)
        {
            ApiResult result = new ApiResult();
            if (String.IsNullOrEmpty(oldPass) || String.IsNullOrEmpty(newPass))
            {
                result.Message = "Vui lòng điền đầy đủ thông tin bên trên";
                return Json(result.Data);
            }
            using (BDSEntities db = new BDSEntities())
            {
                var user = (USER)Session["AdminLogin"];
                var userDB = db.USERs.Where(x => x.idUser == user.idUser).FirstOrDefault();
                if (userDB is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }

                userDB.userPassword = newPass;

                try
                {
                    db.SaveChanges();
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }


        [HttpPost]
        public JsonResult PostUser(USER user)
        {
            ApiResult result = new ApiResult();
            if (user is null)
            {
                result.Message = "Vui lòng điền đầy đủ thông tin bên trên";
                return Json(result.Data);
            }
            using (BDSEntities db = new BDSEntities())
            {
                USER u = new USER();
                if (user.idUser > 0) u = db.USERs.Where(x => x.idUser == user.idUser).FirstOrDefault();
                if (u is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                u.FullName = user.FullName;
                u.userName = user.userName;
                u.userPassword = user.userPassword;
                u.Phone = user.Phone;
                u.Email = user.Email;
                u.Address = user.Address;
                u.idRole = user.idRole;
                if (user.idUser == 0) db.USERs.Add(u);
                try
                {
                    db.SaveChanges();
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult DeleteUser(int id)
        {
            ApiResult result = new ApiResult();
            using (BDSEntities db = new BDSEntities())
            {
                var user = db.USERs.Where(x => x.idUser == id).FirstOrDefault();
                if (user is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                try
                {
                    db.USERs.Remove(user);
                    db.SaveChanges();
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }

        public JsonResult GetBuild(int id)
        {
            using (BDSEntities db = new BDSEntities())
            {
                var build = db.BUILDINGs.Where(x => x.idBuild == id).FirstOrDefault();
                var phuong = db.WARDs.Where(x => x.idWard == build.idWard).FirstOrDefault();
                var quan = db.DISTRICTs.Where(x => x.idDistrict == phuong.idDistrict).FirstOrDefault();
                var city = db.CITies.Where(x => x.idCity == quan.idCity).FirstOrDefault();
                var huong = db.HUONGs.Where(x => x.idHuong == build.idHuong).FirstOrDefault();
                var loai = db.TYPEs.Where(x => x.idType == build.idType).FirstOrDefault();
                var nhanvien = db.USERs.Where(x => x.idUser == build.idUser).FirstOrDefault();
                var hinh = db.IMAGEs.Where(x => x.idBuild == build.idBuild).FirstOrDefault();
                //var hinh = db.IMAGEs.Where(x => x.idImage == id).FirstOrDefault();
                if (build is null) return null;
                return new JsonResult()
                {
                    Data = new { NAME = build.nameBuild, CITY = city.idCity, QUAN = quan.idDistrict, HINHANH = hinh.nameImage, PHUONG = phuong.idWard, DIACHI = build.street, MOTA = build.conent, TANG = build.floor, DIENTICH = build.floorarea, HUONG = huong.idHuong, MANAGER = build.nameManager, PHONE = build.phoneManager, LOAI = loai.idType, STATUS = build.idStatus, GIA = build.price, DATCOC = build.deposits, NHANVIEN = nhanvien.idUser, DATE = build.depositDate },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }
        [HttpPost]
        [ValidateInput(false)]
        public JsonResult PostBuild(BUILDING build)
        {
            ApiResult result = new ApiResult();
            if (build is null)
            {
                result.Message = "Vui lòng điền đầy đủ thông tin bên trên";
                return Json(result.Data);
            }
            using (BDSEntities db = new BDSEntities())
            {
                BUILDING b = new BUILDING();
                if (build.idBuild > 0) b = db.BUILDINGs.Where(x => x.idBuild == build.idBuild).FirstOrDefault();
                if (b is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }

                var huong = db.HUONGs.Where(x => x.idHuong == build.idHuong).FirstOrDefault();
                b.nameBuild = build.nameBuild;
                b.floor = build.floor;
                b.floorarea = build.floorarea;
                b.idHuong = build.idHuong;
                b.nameManager = build.nameManager;
                b.phoneManager = build.phoneManager;
                b.conent = build.conent;
                b.street = build.street;
                b.deposits = build.deposits;
                b.depositDate = build.depositDate;
                b.idUser = build.idUser;
                b.idWard = build.idWard;
                b.idType = build.idType;
                b.idStatus = build.idStatus;
                b.price = build.price;
                b.idHuong = build.idHuong;

                if (build.idBuild == 0) db.BUILDINGs.Add(b);
                try
                {
                    db.SaveChanges();

                    result.Success = true;
                    result.Message = b.idBuild + "";
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }

            }
            return Json(result);

        }
        [HttpPost]
        public JsonResult DeleteBuild(int id)
        {
            ApiResult result = new ApiResult();
            using (BDSEntities db = new BDSEntities())
            {
                var build = db.BUILDINGs.Where(x => x.idBuild == id).FirstOrDefault();
                if (build is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                try
                {
                    db.Database.ExecuteSqlCommand("delete from IMAGE where IdBuild=" + id);
                    db.BUILDINGs.Remove(build);
                    db.SaveChanges();
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }

        [HttpPost]
        [ValidateInput(false)]
        public JsonResult SaveImg(int id, HttpPostedFileBase file)
        {


            if (file == null)
            {
                ViewBag.Error = "Vui lòng chọn ảnh!";
            }
            else
            {
                if (file != null)
                {
                    var fileName = DateTime.Now.ToFileTimeUtc() + ".png";
                    var path = Path.Combine(Server.MapPath("~/Images/"), fileName);

                    file.SaveAs(path);

                    using (BDSEntities db = new BDSEntities())
                    {
                        db.Database.ExecuteSqlCommand("delete from IMAGE where IdBuild=" + id);


                        IMAGE img = new IMAGE();
                        img.nameImage = fileName;
                        img.idBuild = id;
                        db.IMAGEs.Add(img);
                        db.SaveChanges();

                    }
                }
            }
            int response = 1;
            return Json(response, JsonRequestBehavior.AllowGet);
        }
        public JsonResult GetCustomer(string phone)
        {
            using (BDSEntities db = new BDSEntities())
            {

                var customer = db.CUSTOMERs.Where(x => x.phoneCustom.Equals(phone)).FirstOrDefault();
                if (customer is null) return null;

                return new JsonResult()
                {
                    Data = new { NAME = customer.nameCustom, SDT = customer.phoneCustom, EMAIL = customer.emailCustom },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }
        //public JsonResult GetQuanLy(BUILDING build)
        //{
        //    using(BDSEntities db = new BDSEntities())
        //    {
        //        var quanly = db.BUILDINGs.Where(x=>x.nameBuild == build.nameBuild).FirstOrDefault();
        //        if (quanly is null) return null;
        //        return new JsonResult()
        //        {
        //            Data = new {NAMEQL = quanly.nameManager, TOANHA = quanly.nameBuild},
        //            JsonRequestBehavior = JsonRequestBehavior.AllowGet

        //        };
        //    }
        //}
        [HttpPost]
        public JsonResult DeletePhieu(int id)
        {
            ApiResult result = new ApiResult();
            using (BDSEntities db = new BDSEntities())
            {
                var phieu = db.PHIEUHENs.Where(x => x.idPhieu == id).FirstOrDefault();
                if (phieu is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                try
                {
                    db.PHIEUHENs.Remove(phieu);
                    db.SaveChanges();
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }


        public JsonResult PostPhieuHen(PHIEUHEN ph, string phone, string cusname)
        {
            ApiResult result = new ApiResult();
            if (ph is null)
            {
                result.Message = "Vui lòng điền đầy đủ thông tin bên trên";
                return Json(result.Data);
            }
            using (BDSEntities db = new BDSEntities())
            {
                PHIEUHEN p = new PHIEUHEN();
                if (ph.idPhieu > 0) p = db.PHIEUHENs.Where(x => x.idPhieu == ph.idPhieu).FirstOrDefault();
                if (p is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }

                var kh = db.CUSTOMERs.Where(x => x.phoneCustom.Equals(phone)).FirstOrDefault();
                if (kh == null)
                {
                    kh = new CUSTOMER();
                    kh.nameCustom = cusname;
                    kh.phoneCustom = phone;

                    db.CUSTOMERs.Add(kh);
                    db.SaveChanges();
                }
                p.ngayhen = ph.ngayhen;
                p.idBuild = ph.idBuild;
                p.contentPhieu = ph.contentPhieu;
                p.idUserNV = ph.idUserNV;
                p.createPhieu = DateTime.Now;
                p.idCustom = kh.idCustom;
                if (ph.idPhieu == 0) db.PHIEUHENs.Add(p);
                try
                {
                    db.SaveChanges();

                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }

            }
            return Json(result);
        }
        public JsonResult GetPhieu(int id)
        {
            if (Session["AdminLogin"] is null) return null;
            using (BDSEntities db = new BDSEntities())
            {
                var phieu = db.PHIEUHENs.Where(x => x.idPhieu == id).FirstOrDefault();
                var build = db.BUILDINGs.Where(x => x.idBuild == phieu.idBuild).FirstOrDefault();
                var idKH = db.CUSTOMERs.Where(x => x.idCustom == phieu.idCustom).FirstOrDefault();
                if (phieu == null) return null;
                return new JsonResult()
                {
                    Data = new { CONTENT = phieu.contentPhieu, NGAYHEN = phieu.ngayhen.Value.ToString(" HH:mm dd/MM/yyyy"), NGAYTAO = phieu.createPhieu.Value.ToString("HH:mm dd/MM/yyyy"), BUILD = build.nameBuild, SDT = idKH.nameCustom, EMAIL = idKH.emailCustom },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }
        public JsonResult GetKH(int id)
        {
            if (Session["AdminLogin"] is null) return null;

            using (BDSEntities db = new BDSEntities())
            {
                var kh = db.CUSTOMERs.Where(x => x.idCustom == id).FirstOrDefault();
                if (kh is null) return null;
                return new JsonResult()
                {
                    Data = new { NAME = kh.nameCustom, PHONE = kh.phoneCustom, EMAIL = kh.emailCustom, ADDRESS = kh.addressCustom },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }

        [HttpPost]
        public JsonResult PostKH(CUSTOMER kh)
        {
            ApiResult result = new ApiResult();
            if (kh is null)
            {
                result.Message = "Vui lòng điền đầy đủ thông tin bên trên";
                return Json(result.Data);
            }
            using (BDSEntities db = new BDSEntities())
            {
                CUSTOMER k = new CUSTOMER();
                if (kh.idCustom > 0) k = db.CUSTOMERs.Where(x => x.idCustom == kh.idCustom).FirstOrDefault();
                if (k is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                k.nameCustom = kh.nameCustom;
                k.phoneCustom = kh.phoneCustom;
                k.addressCustom = kh.addressCustom;
                k.emailCustom = kh.emailCustom;
                if (kh.idCustom == 0) db.CUSTOMERs.Add(k);
                try
                {
                    db.SaveChanges();

                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }

            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult DeleteKH(int id)
        {
            ApiResult result = new ApiResult();
            using (BDSEntities db = new BDSEntities())
            {
                var kh = db.CUSTOMERs.Where(x => x.idCustom == id).FirstOrDefault();
                if (kh is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                var phieuhen = db.PHIEUHENs.Where(x => x.idCustom == kh.idCustom).FirstOrDefault();

                try
                {
                    db.PHIEUHENs.Remove(phieuhen);
                    db.SaveChanges();

                    db.CUSTOMERs.Remove(kh);
                    db.SaveChanges();
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }
        [HttpPost]
        [ValidateInput(false)]
        public JsonResult PostNews(NEWS news, HttpPostedFileBase file)
        {
            ApiResult result = new ApiResult();
            if (news is null)
            {
                result.Message = "Vui lòng điền đầy đủ thông tin bên trên";
                return Json(result.Data);
            }
            using (BDSEntities db = new BDSEntities())
            {

                NEWS n = new NEWS();
                if (news.idNews > 0) n = db.NEWS.Where(x => x.idNews == news.idNews).FirstOrDefault();
                if (n is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                var user = ((USER)Session["AdminLogin"]).idUser;
                n.titleNews = news.titleNews;
                n.Description = news.Description;
                if (news.idNews == 0)
                {
                    n.titleNews = news.titleNews;
                    n.Description = news.Description;
                    n.idUser = user;
                    n.createDate = DateTime.Now;
                   
                }
                try
                {
                    db.NEWS.Add(n);
                  

                    if (file != null)
                    {
                        // upload image
                        var fileName = Path.GetFileName(file.FileName);
                       
                        var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                        file.SaveAs(path);
                        n.Img = fileName;
                        db.SaveChanges();

                    }


                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }
        public JsonResult GetNews(int id)
        {
            if (Session["AdminLogin"] is null) return null;

            using (BDSEntities db = new BDSEntities())
            {
                var news = db.NEWS.Where(x => x.idNews == id).FirstOrDefault();
                if (news is null) return null;
                return new JsonResult()
                {
                    Data = new { TITLE = news.titleNews, NOIDUNG = news.Description, HINH = news.Img },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }
        [HttpPost]
        public JsonResult DeleteNews(int id)
        {
            ApiResult result = new ApiResult();
            using (BDSEntities db = new BDSEntities())
            {
                var news = db.NEWS.Where(x => x.idNews == id).FirstOrDefault();
                if (news is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                try
                {
                    db.NEWS.Remove(news);
                    db.SaveChanges();
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }
        [HttpPost]
        [ValidateInput(false)]
        public JsonResult SendEmail(HttpPostedFileBase file)
        {
            ApiResult result = new ApiResult();
            return Json(result);
        }
        [HttpPost]
        public JsonResult PostPhieuHen2(PHIEUHEN ph, string phone, string cusname, string email)
        {
            ApiResult result = new ApiResult();
            if (ph is null)
            {
                result.Message = "Vui lòng điền đầy đủ thông tin bên trên";
                return Json(result.Data);
            }
            using (BDSEntities db = new BDSEntities())
            {
                PHIEUHEN p = new PHIEUHEN();
                if (ph.idPhieu > 0) p = db.PHIEUHENs.Where(x => x.idPhieu == ph.idPhieu).FirstOrDefault();
                if (p is null)
                {
                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }

                var kh = db.CUSTOMERs.Where(x => x.phoneCustom.Equals(phone)).FirstOrDefault();
                if (kh == null)
                {
                    kh = new CUSTOMER();
                    kh.nameCustom = cusname;
                    kh.phoneCustom = phone;
                    kh.emailCustom = email;
                    db.CUSTOMERs.Add(kh);
                    db.SaveChanges();
                }
              
               
                p.ngayhen = ph.ngayhen;
                p.idBuild = ph.idBuild;
                p.contentPhieu = ph.contentPhieu;
                p.idUserNV = ph.idUserNV;
                p.createPhieu = DateTime.Now;
                p.idCustom = kh.idCustom;
                if (ph.idPhieu == 0) db.PHIEUHENs.Add(p);
                try
                {
                    db.SaveChanges();

                    result.Success = true;
                }
                catch (Exception ex)
                {
                    result.Message = ex.Message;
                }

            }
            return Json(result);
        }
        


        [HttpPost]
        [ValidateInput(false)]
        public JsonResult EditHopDong(BILL bill, HttpPostedFileBase file, string phone, string cusname)
        {
            ApiResult result = new ApiResult();
            using (BDSEntities db = new BDSEntities())
            {
                BILL b = new BILL();
                if (bill.idBill > 0) b = db.BILLs.Where(x => x.idBill == bill.idBill).FirstOrDefault();

                if (b is null)
                {

                    result.Message = "Vui lòng thử lại";
                    return Json(result);
                }
                var kh = db.CUSTOMERs.Where(x => x.phoneCustom.Equals(phone)).FirstOrDefault();
                if (kh == null)
                {
                    kh = new CUSTOMER();
                    kh.nameCustom = cusname;
                    kh.phoneCustom = phone;
                    db.CUSTOMERs.Add(kh);
                    db.SaveChanges();
                }

                var user = ((USER)Session["AdminLogin"]).idUser;
                b.idBuild = bill.idBuild;
                b.idCustom = kh.idCustom;
                b.totalPrice = bill.totalPrice;
                b.content = bill.content;
                b.createDate = DateTime.Now;
                if (bill.idBill == 0)
                {
                    b.idBuild = bill.idBuild;
                    b.idCustom = kh.idCustom;
                    b.totalPrice = bill.totalPrice;
                    b.content = bill.content;
                    b.idUserNV = user;
                    b.ngayKyTen = bill.ngayKyTen;
                    b.createDate = DateTime.Now;

                }
                try
                {
                    db.BILLs.Add(b);


                    if (file != null)
                    {
                        // upload image
                        var fileName = Path.GetFileName(file.FileName);

                        var path = Path.Combine(Server.MapPath("~/Images/"), fileName);
                        if (System.IO.File.Exists(path))
                        {
                            System.IO.File.Delete(path);
                        }
                        file.SaveAs(path);
                        b.cmndTruoc = fileName;
                        db.SaveChanges();

                    }
                    result.Success = true;
                }
                catch (Exception ex)
                {
                    ViewBag.Error = ex;
                    result.Message = ex.Message;
                }
            }
            return Json(result);
        }
        [HttpGet]
        public JsonResult GetBill(int id)
        {
            if (Session["AdminLogin"] is null) return null;

            using (BDSEntities db = new BDSEntities())
            {
                var bill = db.BILLs.Where(x => x.idBill == id).FirstOrDefault();
                string GiaTien = String.Format("{0:N0}", bill.totalPrice);
                if (bill is null) return null;
                return new JsonResult()
                {
                    Data = new { NAME = bill.CUSTOMER.nameCustom, PHONE = bill.CUSTOMER.phoneCustom, BUILD = bill.BUILDING.nameBuild, PRICE = GiaTien, NAMEQL = bill.BUILDING.nameManager, CREATEDATE = bill.createDate.Value.ToString("dd/MM/yyyy"), HINH = bill.cmndTruoc, MOTA = bill.content, DIACHI = bill.BUILDING.street, TANG = bill.BUILDING.floor, DIENTICH = bill.BUILDING.floorarea },
                    JsonRequestBehavior = JsonRequestBehavior.AllowGet
                };
            }
        }

    }
}