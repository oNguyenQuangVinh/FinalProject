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
    public class TaiLieuController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        public string TaiLieuPath = "/uploads/TaiLieu";
        //
        // GET: /TaiLieu/

        public ActionResult Index(string sortOrder, string TenTaiLieu, string TenNguoiDang)
        {
            ViewBag.TenSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
            ViewBag.NguoiDangSortParm = sortOrder == "User" ? "user_desc" : "User";
            ViewBag.DuongDanSortParm = sortOrder == "Link" ? "link_desc" : "Link";
            ViewBag.DungLuongSortParm = sortOrder == "Size" ? "size_desc" : "Size";
            ViewBag.DinhDangSortParm = sortOrder == "Format" ? "format_desc" : "Format";
            var taiLieus = from s in db.TaiLieux
                           select s;

            if (!String.IsNullOrEmpty(TenNguoiDang))
            {
                taiLieus = taiLieus.Where(s => s.NguoiDung.HoTen.Contains(TenNguoiDang));
            }
            if (!String.IsNullOrEmpty(TenTaiLieu))
            {
                taiLieus = taiLieus.Where(s => s.TenTaiLieu.Contains(TenTaiLieu));
            }

            switch (sortOrder)
            {
                case "name_desc":
                    taiLieus = taiLieus.OrderByDescending(s => s.TenTaiLieu);
                    break;
                case "User":
                    taiLieus = taiLieus.OrderBy(s => s.NguoiDung.HoTen);
                    break;
                case "user_desc":
                    taiLieus = taiLieus.OrderByDescending(s => s.NguoiDung.HoTen);
                    break;
                case "Link":
                    taiLieus = taiLieus.OrderBy(s => s.DuongDan);
                    break;
                case "link_desc":
                    taiLieus = taiLieus.OrderByDescending(s => s.DuongDan);
                    break;
                case "Size":
                    taiLieus = taiLieus.OrderBy(s => s.DungLuong);
                    break;
                case "size_desc":
                    taiLieus = taiLieus.OrderByDescending(s => s.DungLuong);
                    break;
                case "Format":
                    taiLieus = taiLieus.OrderBy(s => s.DinhDang);
                    break;
                case "format_desc":
                    taiLieus = taiLieus.OrderByDescending(s => s.DinhDang);
                    break;
                default:
                    taiLieus = taiLieus.OrderBy(s => s.TenTaiLieu);
                    break;
            }
            return View(taiLieus.ToList());
        }

        //
        // GET: /TaiLieu/TaiLieuTheoLop

        public ActionResult TaiLieuTheoLop(string sortOrder, string TenTaiLieu, string TenNguoiDang)
        {
            var taiLieus = from s in db.TaiLieux
                           select s;

            if (Session["LopMonHocCurrent"] != null)
            {
                // Chỉ hiển thi kết quả các tài liệu theo lớp môn học
                LopMonHoc LopMonHocCurrent = ((LopMonHoc)Session["LopMonHocCurrent"]);
                List<int> ListIdTaiLieu = (List<int>)((from t in db.TaiLieu_LopMonHoc
                                          where t.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                          select t.IdTaiLieu).ToList());

                taiLieus = from s in db.TaiLieux
                           where ListIdTaiLieu.Contains(s.IdTaiLieu)
                           select s;

                ViewBag.TenSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
                ViewBag.NguoiDangSortParm = sortOrder == "User" ? "user_desc" : "User";
                ViewBag.DuongDanSortParm = sortOrder == "Link" ? "link_desc" : "Link";
                ViewBag.DungLuongSortParm = sortOrder == "Size" ? "size_desc" : "Size";
                ViewBag.DinhDangSortParm = sortOrder == "Format" ? "format_desc" : "Format";

                if (!String.IsNullOrEmpty(TenNguoiDang))
                {
                    taiLieus = taiLieus.Where(s => s.NguoiDung.HoTen.Contains(TenNguoiDang));
                }
                if (!String.IsNullOrEmpty(TenTaiLieu))
                {
                    taiLieus = taiLieus.Where(s => s.TenTaiLieu.Contains(TenTaiLieu));
                }

                switch (sortOrder)
                {
                    case "name_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.TenTaiLieu);
                        break;
                    case "User":
                        taiLieus = taiLieus.OrderBy(s => s.NguoiDung.HoTen);
                        break;
                    case "user_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.NguoiDung.HoTen);
                        break;
                    case "Link":
                        taiLieus = taiLieus.OrderBy(s => s.DuongDan);
                        break;
                    case "link_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.DuongDan);
                        break;
                    case "Size":
                        taiLieus = taiLieus.OrderBy(s => s.DungLuong);
                        break;
                    case "size_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.DungLuong);
                        break;
                    case "Format":
                        taiLieus = taiLieus.OrderBy(s => s.DinhDang);
                        break;
                    case "format_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.DinhDang);
                        break;
                    default:
                        taiLieus = taiLieus.OrderBy(s => s.TenTaiLieu);
                        break;
                }
            }
            return View(taiLieus.ToList());
        }

        //
        // GET: /TaiLieu/Details/5

        public ActionResult Details(int id = 0)
        {
            TaiLieu tailieu = db.TaiLieux.Find(id);
            if (tailieu == null)
            {
                return HttpNotFound();
            }
            return View(tailieu);
        }        

        //
        // GET: /TaiLieu/TaiLieuTheoNguoiDung
        public ActionResult TaiLieuTheoNguoiDung()
        {
            NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];
            List<TaiLieu> ListTaiLieuTheoNguoiDung = (List<TaiLieu>)(from t in db.TaiLieux
                                                                       where t.IdNguoiDung == NguoiDungCurrent.IdNguoiDung
                                                                       select t).ToList();

            return View(ListTaiLieuTheoNguoiDung);
        }

        //
        // GET: /TaiLieu/Create

        public ActionResult Create()
        {
            ViewBag.ListLoaiTaiLieu = new SelectList(db.LoaiTaiLieux, "IdLoaiTaiLieu", "TenLoaiTaiLieu");
            return View();
        }

        //
        //POST: /TaiLieu/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(HttpPostedFileBase TaiLieusUpload, TaiLieu tailieu)
        {
            NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];
            if (ModelState.IsValid)
            {
                if (Request != null)
                {
                    HttpPostedFileBase file = Request.Files["TaiLieuUpload"];
                    if ((file != null) && !string.IsNullOrEmpty(file.FileName))
                    {
                        string filePath = Path.Combine(Server.MapPath(TaiLieuPath), file.FileName);
                        file.SaveAs(filePath);
                        tailieu.DinhDang = Path.GetExtension(file.FileName);
                        tailieu.DuongDan = file.FileName;
                        tailieu.DungLuong = file.ContentLength.ToString();
                        tailieu.IdNguoiDung = NguoiDungCurrent.IdNguoiDung;
                        db.TaiLieux.Add(tailieu);
                        db.SaveChanges();
                        return RedirectToAction("Index");
                    }
                    //NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];

                    //tailieu.IdNguoiDung = NguoiDungCurrent.IdNguoiDung;
                }
            }

            

            return View(tailieu);
        }
        
        public FileResult DownloadTaiLieu(string TenTaiLieu)
        {
            string FilePath = Path.Combine(Server.MapPath(TaiLieuPath), TenTaiLieu);
            FileInfo info = new FileInfo(FilePath);
            byte[] fileBytes = System.IO.File.ReadAllBytes(FilePath);
            string fileName = info.Name;
            return File(fileBytes, System.Net.Mime.MediaTypeNames.Application.Octet, fileName);
        }

        //
        // GET: /TaiLieu/Edit/5

        public ActionResult Edit(int id = 0)
        {
            TaiLieu tailieu = db.TaiLieux.Find(id);
            if (tailieu == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "HoTen", tailieu.IdNguoiDung);
            return View(tailieu);
        }

        //
        // POST: /TaiLieu/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(TaiLieu tailieu)
        {
            if (ModelState.IsValid)
            {
                db.Entry(tailieu).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "HoTen", tailieu.IdNguoiDung);
            return View(tailieu);
        }

        //
        // GET: /TaiLieu/Delete/5

        public ActionResult Delete(int id = 0)
        {
            TaiLieu tailieu = db.TaiLieux.Find(id);
            if (tailieu == null)
            {
                return HttpNotFound();
            }
            return View(tailieu);
        }

        //
        // POST: /TaiLieu/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            TaiLieu tailieu = db.TaiLieux.Find(id);
            db.TaiLieux.Remove(tailieu);
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