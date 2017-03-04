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
    public class YeuCauThamGiaController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        //
        // GET: /YeuCauThamGia/

        public ActionResult Index()
        {
            List<YeuCauThamGia> YeuCauThamGias = new List<YeuCauThamGia>();
            if (Session["LopMonHocCurrent"] != null)
            {
                LopMonHoc LopMonHocCurrent = (LopMonHoc)Session["LopMonHocCurrent"];
                int idLop = LopMonHocCurrent.IdLopMonHoc;
                YeuCauThamGias = (from y in db.YeuCauThamGias
                                  where y.IdLopMonHoc == idLop
                                  orderby y.NguoiDung.HoTen
                                  select y).ToList();
            }
            return View(YeuCauThamGias);
        }

        //
        // GET: /YeuCauThamGia/Accept
        public ActionResult Accept(int id = 0)
        {
            LopMonHoc LopMonHocCurrent =  (LopMonHoc)Session["LopMonHocCurrent"];

            DanhSachController DanhSachCon = new DanhSachController();

            YeuCauThamGia yeucauthamgia = db.YeuCauThamGias.Find(id);

            DanhSach newDanhSach = new DanhSach();
            // dummydata
            newDanhSach.IdLopMonHoc = LopMonHocCurrent.IdLopMonHoc;

            if (DanhSachCon.KiemTraTonTaiNguoiDung(yeucauthamgia.NguoiDung.UserName))
            {
                newDanhSach.IdNguoiDung = yeucauthamgia.IdNguoiDung;

                if (DanhSachCon.KiemTraLaSinhVien(yeucauthamgia.IdNguoiDung))
                {
                    if (false == DanhSachCon.KiemTraDanhSachTrung(newDanhSach.IdLopMonHoc, newDanhSach.IdNguoiDung))
                    {
                        db.DanhSaches.Add(newDanhSach);
                        db.SaveChanges();
                        TempData["Message"] = "Sinh viên '"
                            + yeucauthamgia.NguoiDung.HoTen
                            + "-"
                            + yeucauthamgia.NguoiDung.UserName
                            + "' đã được thêm vào lớp thành công";
                        // Nếu lớp này đã bắt đầu và có buổi điểm danh
                        var LopCurrent = db.LopMonHocs.Find(((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc);
                        if (LopCurrent.BuoiHocs.Count() > 0)
                        {
                            // Thì với mỗi buổi học đã điểm danh, 
                            // Gán cho sinh viên này tình trạng nghỉ có phép và ghi chú là nhập học muộn
                            foreach (var buoihoc in LopCurrent.BuoiHocs)
                            {
                                DiemDanh newDiemDanh = new DiemDanh();
                                newDiemDanh.IdBuoiHoc = buoihoc.IdBuoiHoc;
                                newDiemDanh.IdNguoiDung = newDanhSach.IdNguoiDung;
                                newDiemDanh.IdTinhTrangDiHoc = 3; //3 = nghỉ có phép
                                newDiemDanh.NhanXet = "Đăng ký vào lớp muộn";
                                db.DiemDanhs.Add(newDiemDanh);
                                db.SaveChanges();
                            }
                        }
                    }
                    else
                    {
                        // sinh viên đã có trong lớp học
                        DanhSachThemThatBai BanGhiThatBai = new DanhSachThemThatBai();
                        BanGhiThatBai.MaNguoiDung = yeucauthamgia.NguoiDung.UserName;
                        TempData["Message"] = "Sinh viên "
                            + yeucauthamgia.NguoiDung.HoTen
                            + "-"
                            + yeucauthamgia.NguoiDung.UserName
                            + " đã có trong lớp học";
                    }
                }
                else
                {
                    // nếu không phải là sinh viên
                    DanhSachThemThatBai BanGhiThatBai = new DanhSachThemThatBai();
                    BanGhiThatBai.MaNguoiDung = yeucauthamgia.NguoiDung.UserName;
                    TempData["Message"] = "Sinh viên "
                            + yeucauthamgia.NguoiDung.HoTen
                            + "-"
                            + yeucauthamgia.NguoiDung.UserName
                            + " không phải là sinh viên";
                }
            }
            else
            {
                // nếu người dùng k tồn tại
                DanhSachThemThatBai BanGhiThatBai = new DanhSachThemThatBai();
                BanGhiThatBai.MaNguoiDung = yeucauthamgia.NguoiDung.UserName;
                TempData["Message"] = "Sinh viên "
                            + yeucauthamgia.NguoiDung.HoTen
                            + "-"
                            + yeucauthamgia.NguoiDung.UserName
                            + " không tồn tại";
            }
            db.YeuCauThamGias.Remove(yeucauthamgia);
            db.SaveChanges();
            int YeuCauCount = (from y in db.YeuCauThamGias
                               where y.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                               select y).Count();
            Session["YeuCauCount"] = YeuCauCount;
            return RedirectToAction("Index");
        }

        //
        // GET: /YeuCauThamGia/Deny
        public ActionResult Deny(int id = 0)
        {
            YeuCauThamGia yeucauthamgia = db.YeuCauThamGias.Find(id);
            db.YeuCauThamGias.Remove(yeucauthamgia);
            db.SaveChanges();
            Session["YeuCauCount"] = ((List<YeuCauThamGia>)(from y in db.YeuCauThamGias
                                                                              where y.IdLopMonHoc == ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc 
                                                                              select y)).Count();

            return RedirectToAction("Index");
        }

        //
        // GET: /YeuCauThamGia/Details/5

        public ActionResult Details(int id = 0)
        {
            YeuCauThamGia yeucauthamgia = db.YeuCauThamGias.Find(id);
            if (yeucauthamgia == null)
            {
                return HttpNotFound();
            }
            return View(yeucauthamgia);
        }

        //
        // GET: /YeuCauThamGia/Create

        public ActionResult Create()
        {
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc");
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh");
            return View();
        }

        //
        // POST: /YeuCauThamGia/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(YeuCauThamGia yeucauthamgia)
        {
            if (ModelState.IsValid)
            {
                db.YeuCauThamGias.Add(yeucauthamgia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", yeucauthamgia.IdLopMonHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", yeucauthamgia.IdNguoiDung);
            return View(yeucauthamgia);
        }

        //
        // GET: /YeuCauThamGia/Edit/5

        public ActionResult Edit(int id = 0)
        {
            YeuCauThamGia yeucauthamgia = db.YeuCauThamGias.Find(id);
            if (yeucauthamgia == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", yeucauthamgia.IdLopMonHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", yeucauthamgia.IdNguoiDung);
            return View(yeucauthamgia);
        }

        //
        // POST: /YeuCauThamGia/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(YeuCauThamGia yeucauthamgia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(yeucauthamgia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopMonHoc", yeucauthamgia.IdLopMonHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", yeucauthamgia.IdNguoiDung);
            return View(yeucauthamgia);
        }

        //
        // GET: /YeuCauThamGia/Delete/5

        public ActionResult Delete(int id = 0)
        {
            YeuCauThamGia yeucauthamgia = db.YeuCauThamGias.Find(id);
            if (yeucauthamgia == null)
            {
                return HttpNotFound();
            }
            return View(yeucauthamgia);
        }

        //
        // POST: /YeuCauThamGia/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            YeuCauThamGia yeucauthamgia = db.YeuCauThamGias.Find(id);
            db.YeuCauThamGias.Remove(yeucauthamgia);
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