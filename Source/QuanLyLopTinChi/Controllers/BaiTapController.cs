using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyLopTinChi.Models;
using System.IO;

namespace QuanLyLopTinChi.Controllers
{
    public class BaiTapController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();
        public string TaiLieuPath = "/uploads/TaiLieu";
        //
        // GET: /BaiTap/

        public ActionResult Index()
        {
            LopMonHoc LopMonHocCurrent = (LopMonHoc)Session["LopMonHocCurrent"];
            var baitaps = from b in db.BaiTaps
                          where b.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                          select b;
            return View(baitaps.ToList());
        }

        //
        // GET: /BaiTap/Details/5

        public ActionResult Details(int id = 0)
        {
            List<BaiLam> ListBaiLam = (List<BaiLam>)(from b in db.BaiLams
                                                     where b.IdBaiTap == id
                                                     select b).ToList();
            BaiTap baitap = db.BaiTaps.Find(id);
            if (baitap == null)
            {
                return HttpNotFound();
            }
            ViewBag.ListBaiLam = ListBaiLam;
            ViewBag.TongSoBaiLam = ListBaiLam.Count();
            return View(baitap);
        }

        //
        // GET: /BaiTap/Create

        public ActionResult Create()
        {
            BaiTap newBaiTap = new BaiTap();
            return View(newBaiTap);
        }

        //
        // POST: /BaiTap/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase DeBaiTapUpload,
                                   FormCollection collection,
                                   BaiTap baitap)
        {
            NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];
            TaiLieu tailieu = null;

            // Thêm đề cương bài giảng vào csdl và vào lớp
            string TenTaiLieu = Convert.ToString(collection["TenTaiLieu"]);
            if (Request != null)
            {
                HttpPostedFileBase file = Request.Files["DeBaiTapUpload"];
                if ((file != null) && !string.IsNullOrEmpty(file.FileName))
                {
                    tailieu = new TaiLieu();
                    string filePath = Path.Combine(Server.MapPath(TaiLieuPath), file.FileName);
                    file.SaveAs(filePath);
                    tailieu.TenTaiLieu = TenTaiLieu;
                    tailieu.DinhDang = Path.GetExtension(file.FileName);
                    tailieu.DuongDan = file.FileName;
                    tailieu.DungLuong = file.ContentLength.ToString();
                    tailieu.IdNguoiDung = NguoiDungCurrent.IdNguoiDung;
                    tailieu.IdLoaiTaiLieu = 5; // 5 = đề bài tập

                    // Thêm đề cương bài giảng vào csdl
                    db.TaiLieux.Add(tailieu);
                    db.SaveChanges();
                }
                else
                {
                    return View();
                }
            }

            if (ModelState.IsValid)
            {
                LopMonHoc LopMonHocCurrent = (LopMonHoc)Session["LopMonHocCurrent"];
                if (tailieu != null)
                {
                    baitap.IdDeBaiTap = tailieu.IdTaiLieu;
                }
                baitap.IdLopMonHoc = LopMonHocCurrent.IdLopMonHoc;
                db.BaiTaps.Add(baitap);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", baitap.IdLopMonHoc);
            return View(baitap);
        }

        //
        // GET: /BaiTap/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BaiTap baitap = db.BaiTaps.Find(id);
            if (baitap == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", baitap.IdLopMonHoc);
            return View(baitap);
        }

        //
        // POST: /BaiTap/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BaiTap baitap)
        {
            if (ModelState.IsValid)
            {
                db.Entry(baitap).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", baitap.IdLopMonHoc);
            return View(baitap);
        }

        //
        // GET: /BaiTap/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BaiTap baitap = db.BaiTaps.Find(id);
            if (baitap == null)
            {
                return HttpNotFound();
            }
            return View(baitap);
        }

        //
        // POST: /BaiTap/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BaiTap baitap = db.BaiTaps.Find(id);
            db.BaiTaps.Remove(baitap);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
}