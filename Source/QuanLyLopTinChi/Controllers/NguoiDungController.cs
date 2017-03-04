using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyLopTinChi.Models;

namespace QuanLyLopTinChi.Controllers
{
    public class NguoiDungController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        //
        // GET: /NguoiDung/

        public ActionResult Index()
        {
            var nguoidungs = db.NguoiDungs.Include(n => n.DonViQuanLy).Include(n => n.LoaiNguoiDung);
            return View(nguoidungs.ToList());
        }

        //
        // GET: /NguoiDung/Details/5

        public ActionResult Details(int id = 0)
        {
            NguoiDung nguoidung = db.NguoiDungs.Find(id);
            if (nguoidung == null)
            {
                return HttpNotFound();
            }
            return View(nguoidung);
        }

        //
        // GET: /NguoiDung/Create

        public ActionResult Create()
        {
            ViewBag.IdDonViQuanLy = new SelectList(db.DonViQuanLies, "IdDonViQuanLy", "TenDonViQuanLy");
            ViewBag.IdLoaiNguoiDung = new SelectList(db.LoaiNguoiDungs, "IdLoaiNguoiDng", "TenLoaiNgưoiDung");
            return View();
        }

        //
        // POST: /NguoiDung/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(NguoiDung nguoidung)
        {
            if (ModelState.IsValid)
            {
                db.NguoiDungs.Add(nguoidung);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdDonViQuanLy = new SelectList(db.DonViQuanLies, "IdDonViQuanLy", "TenDonViQuanLy", nguoidung.IdDonViQuanLy);
            ViewBag.IdLoaiNguoiDung = new SelectList(db.LoaiNguoiDungs, "IdLoaiNguoiDng", "TenLoaiNgưoiDung", nguoidung.IdLoaiNguoiDung);
            return View(nguoidung);
        }

        //
        // GET: /NguoiDung/Edit/5

        public ActionResult Edit(int id = 0)
        {
            NguoiDung nguoidung = db.NguoiDungs.Find(id);
            if (nguoidung == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdDonViQuanLy = new SelectList(db.DonViQuanLies, "IdDonViQuanLy", "TenDonViQuanLy", nguoidung.IdDonViQuanLy);
            ViewBag.IdLoaiNguoiDung = new SelectList(db.LoaiNguoiDungs, "IdLoaiNguoiDng", "TenLoaiNgưoiDung", nguoidung.IdLoaiNguoiDung);
            return View(nguoidung);
        }

        //
        // POST: /NguoiDung/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(NguoiDung nguoidung)
        {
            if (ModelState.IsValid)
            {
                db.Entry(nguoidung).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdDonViQuanLy = new SelectList(db.DonViQuanLies, "IdDonViQuanLy", "TenDonViQuanLy", nguoidung.IdDonViQuanLy);
            ViewBag.IdLoaiNguoiDung = new SelectList(db.LoaiNguoiDungs, "IdLoaiNguoiDng", "TenLoaiNgưoiDung", nguoidung.IdLoaiNguoiDung);
            return View(nguoidung);
        }

        //
        // GET: /NguoiDung/Delete/5

        public ActionResult Delete(int id = 0)
        {
            NguoiDung nguoidung = db.NguoiDungs.Find(id);
            if (nguoidung == null)
            {
                return HttpNotFound();
            }
            return View(nguoidung);
        }

        //
        // POST: /NguoiDung/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            NguoiDung nguoidung = db.NguoiDungs.Find(id);
            db.NguoiDungs.Remove(nguoidung);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }


        // GET: /Account/Login

        [AllowAnonymous]
        public ActionResult Login(string returnUrl)
        {
            ViewBag.ReturnUrl = returnUrl;
            return View();
        }

        //
        // POST: /NguoiDung/Login

        [HttpPost]
        [AllowAnonymous]
        [ValidateAntiForgeryToken]
        public ActionResult Login(NguoiDung nguoiDung, string returnUrl)
        {
            if (ModelState.IsValid)
            {
                Session["NguoiDungCurrent"] = null;
                Session["NguoiDungCurrent"] = ValidateUser(nguoiDung.UserName, nguoiDung.Password);
                if (Session["NguoiDungCurrent"] != null)
                {
                    return RedirectToAction("TrangChu", "Home");
                    //return RedirectToLocal(returnUrl);
                }
                else
                {

                }
            }

            // If we got this far, something failed, redisplay form
            ModelState.AddModelError("", "The user name or password provided is incorrect.");
            return View(nguoiDung);
        }

        //
        // GET: /NguoiDung/Logoff

        public ActionResult Logoff()
        {
            Session["NguoiDungCurrent"] = null;
            return RedirectToAction("Login");
        }

        public NguoiDung ValidateUser(string UserName, string Password)
        {
            var nguoiDungs = from e in db.NguoiDungs
                             where (UserName == e.UserName)
                             select e;
            if ((nguoiDungs.ToList<NguoiDung>().Count) == 0)
            {
                // không tồn tại user name
                return null;
            }
            else
            {
                NguoiDung nguoiDung = (NguoiDung)(nguoiDungs.ToList<NguoiDung>()[0]);
                if (nguoiDung.Password == Password)
                {
                    return nguoiDung;
                }
                else
                {
                    // sai pass
                    return null;
                }
            }
        }


    }
}