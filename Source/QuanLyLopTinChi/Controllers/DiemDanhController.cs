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
    public class DiemDanhController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        //
        // GET: /DiemDanh/

        public ActionResult Index()
        {
            var diemdanhs = db.DiemDanhs.Include(d => d.BuoiHoc).Include(d => d.NguoiDung).Include(d => d.TinhTrangDiHoc);
            return View(diemdanhs.ToList());
        }

        //
        // GET: /DiemDanh/Details/5

        public ActionResult Details(int id = 0)
        {
            DiemDanh diemdanh = db.DiemDanhs.Find(id);
            if (diemdanh == null)
            {
                return HttpNotFound();
            }
            return View(diemdanh);
        }

        //
        // GET: /DiemDanh/Create

        public ActionResult Create()
        {
            ViewBag.IdBuoiHoc = new SelectList(db.BuoiHocs, "IdBuoiHoc", "IdBuoiHoc");
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh");
            ViewBag.IdTinhTrangDiHoc = new SelectList(db.TinhTrangDiHocs, "IdTinhTrangDiHoc", "NoiDung");
            return View();
        }

        //
        // POST: /DiemDanh/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DiemDanh diemdanh)
        {
            if (ModelState.IsValid)
            {
                db.DiemDanhs.Add(diemdanh);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdBuoiHoc = new SelectList(db.BuoiHocs, "IdBuoiHoc", "IdBuoiHoc", diemdanh.IdBuoiHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", diemdanh.IdNguoiDung);
            ViewBag.IdTinhTrangDiHoc = new SelectList(db.TinhTrangDiHocs, "IdTinhTrangDiHoc", "NoiDung", diemdanh.IdTinhTrangDiHoc);
            return View(diemdanh);
        }

        //
        // GET: /DiemDanh/Edit/5

        public ActionResult Edit(int idbuoihoc = 0 , int idnguoidung = 0)
        {
            DiemDanh diemdanh = (DiemDanh)(from d in db.DiemDanhs
                                           where d.IdBuoiHoc == idbuoihoc && d.IdNguoiDung == idnguoidung
                                           select d).First();
            if (diemdanh == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdBuoiHoc = new SelectList(db.BuoiHocs, "IdBuoiHoc", "IdBuoiHoc", diemdanh.IdBuoiHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", diemdanh.IdNguoiDung);
            ViewBag.IdTinhTrangDiHoc = new SelectList(db.TinhTrangDiHocs, "IdTinhTrangDiHoc", "NoiDung", diemdanh.IdTinhTrangDiHoc);
            return View(diemdanh);
        }

        //
        // POST: /DiemDanh/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DiemDanh diemdanh)
        {
            if (ModelState.IsValid)
            {
                db.Entry(diemdanh).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("EditDiemDanh", new { id = diemdanh.IdBuoiHoc});
            }
            ViewBag.IdBuoiHoc = new SelectList(db.BuoiHocs, "IdBuoiHoc", "IdBuoiHoc", diemdanh.IdBuoiHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", diemdanh.IdNguoiDung);
            ViewBag.IdTinhTrangDiHoc = new SelectList(db.TinhTrangDiHocs, "IdTinhTrangDiHoc", "NoiDung", diemdanh.IdTinhTrangDiHoc);
            return RedirectToAction("EditDiemDanh", new { id = diemdanh.IdBuoiHoc });
        }

        //
        // GET: /DiemDanh/Delete/5

        public ActionResult Delete(int id = 0)
        {
            DiemDanh diemdanh = db.DiemDanhs.Find(id);
            if (diemdanh == null)
            {
                return HttpNotFound();
            }
            return View(diemdanh);
        }

        //
        // POST: /DiemDanh/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DiemDanh diemdanh = db.DiemDanhs.Find(id);
            db.DiemDanhs.Remove(diemdanh);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        //
        // GET: /DanhSach/ThongKeDiemDanh
        public ActionResult ThongKeDiemDanh()
        {
            List<TinhTrangDiHoc> ListTinhTrangDiHoc = (List<TinhTrangDiHoc>)((from t in db.TinhTrangDiHocs
                                                      select t).ToList());
            List<BuoiHoc> ListBuoiHocTheoLop = new List<BuoiHoc>();
            List<DiemDanh> ListDiemDanhTheoLop = new List<DiemDanh>();
            List<DanhSach> ListDanhSachTheoLop = new List<DanhSach>();
            double SoBuoiNghiChoPhep = -1;
            double TyLeBuoiNghiChoPhep = 0.2;

            if (Session["LopMonHocCurrent"] != null)
            {

                int IdLopMonHoc = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;

                LopMonHoc LopMonHocCurrent = (LopMonHoc)((from t in db.LopMonHocs
                                                          where t.IdLopMonHoc == IdLopMonHoc
                                                          select t).ToList().First());

                ListBuoiHocTheoLop = (List<BuoiHoc>)((from b in db.BuoiHocs
                                                      where b.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                                      orderby b.NgayHoc 
                                                      select b).ToList());

                ListDanhSachTheoLop = (List<DanhSach>)((from b in db.DanhSaches
                                                      where b.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                                      orderby b.NguoiDung.HoTen
                                                      select b).ToList());


                ListDiemDanhTheoLop = (List<DiemDanh>)((from b in db.DiemDanhs
                                                        where b.BuoiHoc.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                                        orderby b.NguoiDung.HoTen, b.BuoiHoc.IdBuoiHoc
                                                        select b).ToList());


                SoBuoiNghiChoPhep = ((LopMonHoc)db.LopMonHocs.Find(IdLopMonHoc)).SoBuoiDiemDanh * TyLeBuoiNghiChoPhep; 
            }
            else
            {
                // chưa chọn lớp 
            }

            ViewBag.ListTinhTrangDiHoc = ListTinhTrangDiHoc;
            ViewBag.ListBuoiHocTheoLop = ListBuoiHocTheoLop;
            ViewBag.ListDanhSachTheoLop = ListDanhSachTheoLop;
            ViewBag.ListDiemDanhTheoLop = ListDiemDanhTheoLop;
            ViewBag.SoBuoiNghiChoPhep = SoBuoiNghiChoPhep;
            return View(ListDiemDanhTheoLop);
        }

        //
        // GET: /DanhSach/DiemDanhMoi
        public ActionResult DiemDanhMoi()
        {
            int IdDiHoc = 1; // idtinhtrangdihoc = đi học
            List<SelectListItem> ListTrangThai = new List<SelectListItem>();
            List<DiemDanh> ListDiemDanh = new List<DiemDanh>();
            if (Session["LopMonHocCurrent"] != null)
            {

                int IdLopMonHoc = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;

                LopMonHoc LopMonHocCurrent = (LopMonHoc)((from t in db.LopMonHocs
                                                          where t.IdLopMonHoc == IdLopMonHoc
                                                          select t).ToList().First());

                List<NguoiDung> ListSinhVienTrongLop = (List<NguoiDung>)((from t in db.DanhSaches
                                                                          where t.IdLopMonHoc == IdLopMonHoc
                                                                          select t.NguoiDung).ToList());


                foreach (NguoiDung n in ListSinhVienTrongLop)
                {
                    DiemDanh NewDiemDanh = new DiemDanh();
                    NewDiemDanh.NguoiDung = n;
                    NewDiemDanh.IdNguoiDung = n.IdNguoiDung;
                    TinhTrangDiHoc TinhTrangDiHoc = (TinhTrangDiHoc)(from t in db.TinhTrangDiHocs
                                                                     where IdDiHoc == t.IdTinhTrangDiHoc
                                                                     select t).ToList().First();
                    NewDiemDanh.TinhTrangDiHoc = TinhTrangDiHoc;
                    NewDiemDanh.IdTinhTrangDiHoc = IdDiHoc;
                    ListDiemDanh.Add(NewDiemDanh);
                }
            }
            else
            {
                // chưa chọn lớp môn học
            }

            ViewBag.DanhSach = ListDiemDanh;
            ViewBag.ListTrangThai = new SelectList(db.TinhTrangDiHocs, "IdTinhTrangDiHoc", "NoiDung", IdDiHoc);
            return View(ListDiemDanh);
        }

        //
        // POST: /DanhSach/DiemDanhMoi
        [HttpPost]
        public ActionResult DiemDanhMoi(List<DiemDanh> ListDiemDanh)
        {
            // tạo mới 1 buổi học
            if (Session["LopMonHocCurrent"] != null)
            {
                int IdLopMonHocCurrent = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;

                LopMonHoc LopMonHocCurrent = (LopMonHoc)((from t in db.LopMonHocs
                                                          where t.IdLopMonHoc == IdLopMonHocCurrent
                                                          select t).ToList().First());

                DateTime NgayHoc = DateTime.Now.Date;

                BuoiHoc NewObjBuoiHoc = new BuoiHoc();
                NewObjBuoiHoc.IdLopMonHoc = IdLopMonHocCurrent;
                NewObjBuoiHoc.LopMonHoc = LopMonHocCurrent;
                NewObjBuoiHoc.NgayHoc = NgayHoc;

                db.BuoiHocs.Add(NewObjBuoiHoc);
                db.SaveChanges();

                int NewIdBuoiHoc = NewObjBuoiHoc.IdBuoiHoc;
                NguoiDung nguoiDung;

                // Tạo mới các điểm danh
                foreach (DiemDanh d in ListDiemDanh)
                {
                    nguoiDung = (from t in db.NguoiDungs
                                  where t.UserName == d.NguoiDung.UserName
                                  select t).ToList().First();

                    d.IdBuoiHoc = NewIdBuoiHoc;
                    d.IdNguoiDung = nguoiDung.IdNguoiDung;
                    d.NguoiDung = nguoiDung;
                    db.DiemDanhs.Add(d);
                    db.SaveChanges();
                }
            }
            else
            {
                // chưa chọn lớp môn học
            }
            return RedirectToAction("ThongKeDiemDanh");
        }

        ////////////////


        //
        // GET: /DanhSach/EditDiemDanh
        public ActionResult EditDiemDanh(int id = 6)
        {
            List<SelectListItem> ListTrangThai = new List<SelectListItem>();
            List<DiemDanh> ListDiemDanh = new List<DiemDanh>();
            if (Session["LopMonHocCurrent"] != null)
            {

                int IdBuoiHọc = id;
                ListDiemDanh = (List<DiemDanh>)(from t in db.DiemDanhs
                                                where t.IdBuoiHoc == IdBuoiHọc
                                                select t).ToList();
            }
            else
            {
                // chưa chọn lớp môn học
            }

            ViewBag.DanhSach = ListDiemDanh;
            ViewBag.ListTrangThai = new SelectList(db.TinhTrangDiHocs, "IdTinhTrangDiHoc", "NoiDung");
            return View(ListDiemDanh);
        }

        //
        // POST: /DanhSach/EditDiemDanh
        [HttpPost]
        public ActionResult EditDiemDanh(List<DiemDanh> ListDiemDanh)
        {
            // tạo mới 1 buổi học
            if (Session["LopMonHocCurrent"] != null)
            {
                int IdLopMonHocCurrent = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;

                LopMonHoc LopMonHocCurrent = (LopMonHoc)((from t in db.LopMonHocs
                                                          where t.IdLopMonHoc == IdLopMonHocCurrent
                                                          select t).ToList().First());

                DateTime NgayHoc = DateTime.Now.Date;

                BuoiHoc NewObjBuoiHoc = new BuoiHoc();
                NewObjBuoiHoc.IdLopMonHoc = IdLopMonHocCurrent;
                NewObjBuoiHoc.LopMonHoc = LopMonHocCurrent;
                NewObjBuoiHoc.NgayHoc = NgayHoc;

                db.BuoiHocs.Add(NewObjBuoiHoc);
                db.SaveChanges();

                int NewIdBuoiHoc = NewObjBuoiHoc.IdBuoiHoc;
                NguoiDung nguoiDung;

                // Tạo mới các điểm danh
                foreach (DiemDanh d in ListDiemDanh)
                {
                    nguoiDung = (from t in db.NguoiDungs
                                 where t.UserName == d.NguoiDung.UserName
                                 select t).ToList().First();

                    d.IdBuoiHoc = NewIdBuoiHoc;
                    d.IdNguoiDung = nguoiDung.IdNguoiDung;
                    d.NguoiDung = nguoiDung;
                    db.DiemDanhs.Add(d);
                    db.SaveChanges();
                }
            }
            else
            {
                // chưa chọn lớp môn học
            }
            return RedirectToAction("ThongKeDiemDanh");
        }


    }
}