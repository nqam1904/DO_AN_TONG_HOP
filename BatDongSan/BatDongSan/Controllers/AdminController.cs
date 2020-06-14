using BatDongSan.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.Mvc;

namespace BatDongSan.Controllers
{
    public class AdminController : Controller
    {
        BDSEntities db = new BDSEntities();
        // GET: Admin
        public ActionResult Index()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();

        }
        [HttpGet]
        public ActionResult AdminLogin()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AdminLogin(USER user)
        {
            if (db is null) return HttpNotFound();
            if (String.IsNullOrEmpty(user.userName) || String.IsNullOrEmpty(user.userPassword))
            {
                ViewBag.Error = "Vui lòng nhập thông tin";
                return View("AdminLogin");
            }
            using (BDSEntities db = new BDSEntities())
            {
                user.userPassword = db.proc_CryptData(user.userPassword).FirstOrDefault();
                var adlogin = db.USERs.Where(x => x.userName.Equals(user.userName.ToLower().Trim()) && x.userPassword.Equals(user.userPassword)).FirstOrDefault();
                if (adlogin is null)
                {
                    ViewBag.Error = "Sai thông tin đăng nhập";
                    return View("AdminLogin");
                }
                Session["AdminLogin"] = adlogin;
                int idRole = ((USER)Session["AdminLogin"]).idRole;
                if (idRole != 1 && idRole != 3)
                {
                    ViewBag.Error2 = "Không đủ quyền truy cập !!!";
                    return View("AdminLogin");
                }
                return RedirectToAction("Index", "Admin");
            }

        }
        public ActionResult Role()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult User()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult City()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult Districts()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult Ward()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult Building()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult PhieuHen()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult DanhSachKH()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
       public ActionResult TinTuc()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
       public ActionResult HopDong()
        {
            if (Session["AdminLogin"] is null) return View("AdminLogin");
            return View();
        }
        public ActionResult ModalGuiEmail(int id)
        {

            ViewBag.IdPhieu = id;
            return PartialView("_PartialGuiEmail");
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult ModalGuiEmail(BatDongSan.Models.GuiEmailPhieuHen objModelMail, HttpPostedFileBase fileUploader)
        {
            if (Session[objModelMail.token] == null) return RedirectToAction("PhieuHen");
            Session.Remove(objModelMail.token);
            if (ModelState.IsValid)
            {
                string from = "batdongsanhutech@gmail.com";
                using (MailMessage mail = new MailMessage(from, objModelMail.To))
                {
                    mail.Subject = objModelMail.Subject;
                    mail.Body = objModelMail.Body;
                    if (fileUploader != null)
                    {
                        string fileName = Path.GetFileName(fileUploader.FileName);
                        mail.Attachments.Add(new Attachment(fileUploader.InputStream, fileName));
                    }
                    mail.IsBodyHtml = false;
                    SmtpClient smtp = new SmtpClient();
                    smtp.Host = "smtp.gmail.com";
                    smtp.EnableSsl = true;
                    NetworkCredential networkCredential = new NetworkCredential(from, "minh@123");
                    smtp.UseDefaultCredentials = true;
                    smtp.Credentials = networkCredential;
                    smtp.Port = 587;
                    smtp.Send(mail);
                    ViewBag.Message = "Sent";
                    return View("PhieuHen", objModelMail);
                }
            }
            else
            {
                ViewBag.Error = "Error";
                return View();
            }
        }
        public ActionResult AdminLogout()
        {
            Session.Clear();
            return RedirectToAction("AdminLogin");
        }
    }
}