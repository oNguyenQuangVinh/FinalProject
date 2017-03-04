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
    public class BuoiHocController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        //
        // GET: /BuoiHoc/

        public ActionResult ListCacBuoiHocDiemDanh()
        {
            List<BuoiHoc> buoihocs = new List<BuoiHoc>();
            if (Session["LopMonHocCurrent"] != null)
            {
                int IdLopMonHoc = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;
                buoihocs = (List<BuoiHoc>)(from b in db.BuoiHocs
                               where b.IdLopMonHoc == IdLopMonHoc
                               select b).ToList();
            }
            else
            {
                // chưa chọn lớp
            }
            return View(buoihocs.ToList());
        }

        //
        // GET: /BuoiHoc/Details/5

        public ActionResult Details(int id = 0)
        {
            BuoiHoc buoihoc = db.BuoiHocs.Find(id);
            if (buoihoc == null)
            {
                return HttpNotFound();
            }
            return View(buoihoc);
        }

        //
        // GET: /BuoiHoc/Create

        public ActionResult Create()
        {
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc");
            return View();
        }

        //
        // POST: /BuoiHoc/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BuoiHoc buoihoc)
        {
            if (ModelState.IsValid)
            {
                db.BuoiHocs.Add(buoihoc);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", buoihoc.IdLopMonHoc);
            return View(buoihoc);
        }

        //
        // GET: /BuoiHoc/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BuoiHoc buoihoc = db.BuoiHocs.Find(id);
            if (buoihoc == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", buoihoc.IdLopMonHoc);
            return View(buoihoc);
        }

        //
        // POST: /BuoiHoc/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BuoiHoc buoihoc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(buoihoc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", buoihoc.IdLopMonHoc);
            return View(buoihoc);
        }

        //
        // GET: /BuoiHoc/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BuoiHoc buoihoc = db.BuoiHocs.Find(id);
            if (buoihoc == null)
            {
                return HttpNotFound();
            }
            return View(buoihoc);
        }

        //
        // POST: /BuoiHoc/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BuoiHoc buoihoc = db.BuoiHocs.Find(id);
            db.BuoiHocs.Remove(buoihoc);
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