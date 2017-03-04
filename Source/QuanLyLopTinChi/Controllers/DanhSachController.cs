using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QuanLyLopTinChi.Models;
using OfficeOpenXml;

namespace QuanLyLopTinChi.Controllers
{
    public class DanhSachThemThatBai
    {
        public string MaNguoiDung { get; set; }
        public string MoTa { get; set; }
    }

    public class DanhSachController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        //
        // GET: /DanhSach/

        public ActionResult Index()
        {
            var danhsaches = db.DanhSaches.Include(d => d.LopMonHoc).Include(d => d.NguoiDung);
            return View(danhsaches.ToList());
        }

        //
        // GET: /DanhSach/Details/5

        public ActionResult Details(int id = 0)
        {
            DanhSach danhsach = db.DanhSaches.Find(id);
            if (danhsach == null)
            {
                return HttpNotFound();
            }
            return View(danhsach);
        }

        //
        // GET: /DanhSach/Create

        public ActionResult Create()
        {
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "MaLopMonHoc");
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh");
            return View();
        }

        //
        // POST: /DanhSach/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(DanhSach danhsach)
        {
            if (ModelState.IsValid)
            {
                db.DanhSaches.Add(danhsach);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "MaLopMonHoc", danhsach.IdLopMonHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", danhsach.IdNguoiDung);
            return View(danhsach);
        }

        //
        // GET: /DanhSach/Edit/5

        public ActionResult Edit(int id = 0)
        {
            DanhSach danhsach = db.DanhSaches.Find(id);
            if (danhsach == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "MaLopMonHoc", danhsach.IdLopMonHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", danhsach.IdNguoiDung);
            return View(danhsach);
        }

        //
        // POST: /DanhSach/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(DanhSach danhsach)
        {
            if (ModelState.IsValid)
            {
                db.Entry(danhsach).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "MaLopMonHoc", danhsach.IdLopMonHoc);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", danhsach.IdNguoiDung);
            return View(danhsach);
        }

        //
        // GET: /DanhSach/Delete/5

        public ActionResult Delete(int id = 0)
        {
            DanhSach danhsach = db.DanhSaches.Find(id);
            if (danhsach == null)
            {
                return HttpNotFound();
            }
            return View(danhsach);
        }

        //
        // POST: /DanhSach/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DanhSach danhsach = db.DanhSaches.Find(id);
            db.DanhSaches.Remove(danhsach);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        //
        // GET: /DanhSach/ThemSinhVien
        public ActionResult ThemSinhVien()
        {
            return View();
        }


        //
        // GET: /DanhSach/XemDanhSachSinhVien
        public ActionResult XemDanhSachSinhVien(string sortOrder)
        {
            if (Session["LopMonHocCurrent"] != null)
            {
                int IdLopMonHoc = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;
                List<int> ListIdDanhSach = (from t in db.DanhSaches
                                            where t.IdLopMonHoc == IdLopMonHoc
                                            select t.IdNguoiDung).ToList();

                List<NguoiDung> ListDanhSach = (from t in db.NguoiDungs
                                                where ListIdDanhSach.Contains(t.IdNguoiDung)
                                                select t).ToList();


                // Sắp xếp List Thành công
                ViewBag.MaSortParm = String.IsNullOrEmpty(sortOrder) ? "ma_desc" : "";
                ViewBag.TenSortParm = sortOrder == "Ten" ? "ten_desc" : "Ten";
                ViewBag.NgaySinhSortParm = sortOrder == "NgaySinh" ? "ngaySinh_desc" : "NgaySinh";
                ViewBag.LopSortParm = sortOrder == "Lop" ? "lop_desc" : "Lop";

                switch (sortOrder)
                {
                    case "ma_desc":
                        ListDanhSach = ListDanhSach.OrderByDescending(s => s.UserName).ToList();
                        break;
                    case "Ten":
                        ListDanhSach = ListDanhSach.OrderBy(s => s.HoTen).ToList();
                        break;
                    case "ten_desc":
                        ListDanhSach = ListDanhSach.OrderByDescending(s => s.HoTen).ToList();
                        break;
                    case "NgaySinh":
                        ListDanhSach = ListDanhSach.OrderBy(s => s.NgaySinh).ToList();
                        break;
                    case "ngaySinh_desc":
                        ListDanhSach = ListDanhSach.OrderByDescending(s => s.NgaySinh).ToList();
                        break;
                    case "Lop":
                        ListDanhSach = ListDanhSach.OrderBy(s => s.DonViQuanLy.TenDonViQuanLy).ToList();
                        break;
                    case "lop_desc":
                        ListDanhSach = ListDanhSach.OrderByDescending(s => s.DonViQuanLy.TenDonViQuanLy).ToList();
                        break;
                    default:
                        ListDanhSach = ListDanhSach.OrderBy(s => s.UserName).ToList();
                        break;
                }


                ViewBag.TongSoSinhVien = ListDanhSach.Count();
                ViewBag.DanhSach = ListDanhSach;
            }
            else
            {
                //chưa chọn lớp môn học
            }
            return View();
        }

        //
        // GET: /DanhSach/KetQuaThemVaoDanhSach
        public ActionResult KetQuaThemVaoDanhSach(string sortOrder)
        {
            if (Session["ListDanhSachThanhCong"] != null)
            {
                List<DanhSach> ListDanhSachThanhCong = (List<DanhSach>)Session["ListDanhSachThanhCong"];
                foreach(DanhSach d in ListDanhSachThanhCong)
                {
                    d.NguoiDung = (from t in db.NguoiDungs
                                   where t.IdNguoiDung == d.IdNguoiDung
                                   select t).ToList().First();
                }

                // Sắp xếp List Thành công
                ViewBag.MaSortParm = String.IsNullOrEmpty(sortOrder) ? "ma_desc" : "";
                ViewBag.TenSortParm = sortOrder == "Ten" ? "ten_desc" : "Ten";
                ViewBag.NgaySinhSortParm = sortOrder == "NgaySinh" ? "ngaySinh_desc" : "NgaySinh";
                ViewBag.LopSortParm = sortOrder == "Lop" ? "lop_desc" : "Lop";

                switch (sortOrder)
                {
                    case "ma_desc":
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderByDescending(s => s.NguoiDung.UserName).ToList();
                        break;
                    case "Ten":
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderBy(s => s.NguoiDung.HoTen).ToList();
                        break;
                    case "ten_desc":
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderByDescending(s => s.NguoiDung.HoTen).ToList();
                        break;
                    case "NgaySinh":
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderBy(s => s.NguoiDung.NgaySinh).ToList();
                        break;
                    case "ngaySinh_desc":
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderByDescending(s => s.NguoiDung.NgaySinh).ToList();
                        break;
                    case "Lop":
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderBy(s => s.NguoiDung.DonViQuanLy.TenDonViQuanLy).ToList();
                        break;
                    case "lop_desc":
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderByDescending(s => s.NguoiDung.DonViQuanLy.TenDonViQuanLy).ToList();
                        break;
                    default:
                        ListDanhSachThanhCong = ListDanhSachThanhCong.OrderBy(s => s.NguoiDung.UserName).ToList();
                        break;
                }

                ViewBag.ListDanhSachThanhCong = ListDanhSachThanhCong;
            }


            if (Session["ListDanhSachThatBai"] != null)
            {
                List<DanhSachThemThatBai> ListDanhSachThatBai = (List<DanhSachThemThatBai>)Session["ListDanhSachThatBai"];
                // Sắp xếp List Thất bại
                ViewBag.MaThatBaiSortParm = String.IsNullOrEmpty(sortOrder) ? "maThatBai_desc" : "";
                ViewBag.MoTaThatBaiSortParm = sortOrder == "MoTa" ? "moTa_desc" : "MoTa";

                switch (sortOrder)
                {
                    case "maThatBai_desc":
                        ListDanhSachThatBai = ListDanhSachThatBai.OrderByDescending(s => s.MaNguoiDung).ToList();
                        break;
                    case "MoTa":
                        ListDanhSachThatBai = ListDanhSachThatBai.OrderBy(s => s.MoTa).ToList();
                        break;
                    case "moTa_desc":
                        ListDanhSachThatBai = ListDanhSachThatBai.OrderByDescending(s => s.MoTa).ToList();
                        break;
                    default:
                        ListDanhSachThatBai = ListDanhSachThatBai.OrderBy(s => s.MaNguoiDung).ToList();
                        break;
                }


                ViewBag.ListDanhSachThatBai = ListDanhSachThatBai;
            }
            return View();
        }

        //
        // GET: /DanhSach/ThemSinhVienThuCong

        public ActionResult ThemSinhVienThuCong()
        {
            List<NguoiDung> ListSinhVien = new List<NguoiDung>();
            if (Session["ListSinhVien"] != null)
            {
                ListSinhVien = (List<NguoiDung>)Session["ListSinhVien"];

                if (ListSinhVien != null && ListSinhVien.Count() != 0)
                {
                    List<int> ListIdSinhVien = ListSinhVien.Select(o => o.IdNguoiDung).ToList();
                    ListSinhVien = (from t in db.NguoiDungs
                                    where (ListIdSinhVien.Contains(t.IdNguoiDung))
                                    select t).ToList();
                }
            }
            ViewBag.ListSinhVien = ListSinhVien;
            return View();
        }

        //
        // POST: /DanhSach/ThemSinhVienThuCong

        [HttpPost]
        public ActionResult ThemSinhVienThuCong(FormCollection formCollection)
        {
            List<DanhSach> ListDanhSachThanhCong = new List<DanhSach>();
            List<DanhSachThemThatBai> ListDanhSachThatBai = new List<DanhSachThemThatBai>();
            List<NguoiDung> ListSinhVien = (List<NguoiDung>)Session["ListSinhVien"];
            foreach(NguoiDung n in ListSinhVien)
            {
                DanhSach newDanhSach = new DanhSach();
                // dummydata
                newDanhSach.IdLopMonHoc = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;

                if (KiemTraTonTaiNguoiDung(n.UserName))
                {
                    newDanhSach.IdNguoiDung = n.IdNguoiDung;

                    if (KiemTraLaSinhVien(n.IdNguoiDung))
                    {
                        if (false == KiemTraDanhSachTrung(newDanhSach.IdLopMonHoc, newDanhSach.IdNguoiDung))
                        {
                            db.DanhSaches.Add(newDanhSach);
                            db.SaveChanges();
                            ListDanhSachThanhCong.Add(newDanhSach);
                            // Nếu lớp này đã bắt đầu và có buổi điểm danh
                            var LopCurrent = db.LopMonHocs.Find(((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc);
                            if(LopCurrent.BuoiHocs.Count() > 0)
                            {
                                // Thì với mỗi buổi học đã điểm danh, 
                                // Gán cho sinh viên này tình trạng nghỉ có phép và ghi chú là nhập học muộn
                                foreach(var buoihoc in LopCurrent.BuoiHocs)
                                {
                                    DiemDanh newDiemDanh = new DiemDanh();
                                    newDiemDanh.IdBuoiHoc = buoihoc.IdBuoiHoc;
                                    newDiemDanh.IdNguoiDung = n.IdNguoiDung;
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
                            BanGhiThatBai.MaNguoiDung = n.UserName;
                            BanGhiThatBai.MoTa = "đã có trong lớp học";
                            ListDanhSachThatBai.Add(BanGhiThatBai);
                        }
                    }
                    else
                    {
                        // nếu không phải là sinh viên
                        DanhSachThemThatBai BanGhiThatBai = new DanhSachThemThatBai();
                        BanGhiThatBai.MaNguoiDung = n.UserName;
                        BanGhiThatBai.MoTa = "không phải là sinh viên";
                        ListDanhSachThatBai.Add(BanGhiThatBai);
                    }
                }
                else
                {
                    // nếu người dùng k tồn tại
                    DanhSachThemThatBai BanGhiThatBai = new DanhSachThemThatBai();
                    BanGhiThatBai.MaNguoiDung = n.UserName;
                    BanGhiThatBai.MoTa = "không tồn tại";
                    ListDanhSachThatBai.Add(BanGhiThatBai);
                }
            }
            Session["ListDanhSachThanhCong"] = ListDanhSachThanhCong;
            Session["ListDanhSachThatBai"] = ListDanhSachThatBai;
            Session["ListSinhVien"] = null;
            return RedirectToAction("KetQuaThemVaoDanhSach", new
            {
                ListDanhSachThanhCong = ListDanhSachThanhCong,
                ListDanhSachThatBai = ListDanhSachThatBai
            });

        }

        [HttpPost]
        public ActionResult ThemSinhVienLe(FormCollection collection)
        {
            // Lấy dữ liệu từ View
            string UserName = Convert.ToString(collection["UserName"]);

            var nguoiDung = (from t in db.NguoiDungs
                          where t.UserName == UserName
                          select t);
            if (nguoiDung.Count() > 0 )
            {
                NguoiDung n = (NguoiDung)(nguoiDung.ToList().First());
                List<NguoiDung> ListSinhVien = new List<NguoiDung>();
                if (Session["ListSinhVien"] != null)
                {
                    ListSinhVien = (List<NguoiDung>)Session["ListSinhVien"];
                }
                ListSinhVien.Add(n);
                Session["ListSinhVien"] = ListSinhVien;
            }
            return RedirectToAction("ThemSinhVienThuCong");
        }

        [HttpPost]
        public ActionResult XoaKhoiDanhSach(string UserName)
        {
            List<NguoiDung> ListSinhVien = (List<NguoiDung>)Session["ListSinhVien"];

            ListSinhVien.RemoveAll(item => item.UserName == UserName);
            Session["ListSinhVien"] = ListSinhVien;
            int itemCount = ListSinhVien.Count();

            var results = new
            {
                DeleteId = UserName,
                ItemCount = itemCount
            };
            return Json(results);
        }

        //
        // GET: /DanhSach/BrowseDanhSach

        public ActionResult BrowseDanhSach()
        {
            ViewBag.IdLopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "MaLopMonHoc");
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh");
            return View();
        }

        //
        // POST: /DanhSach/BrowseDanhSach

        [HttpPost]
        public ActionResult BrowseDanhSach(FormCollection formCollection)
        {
            if (Request != null)
            {
                HttpPostedFileBase file = Request.Files["UploadedDanhSach"];
                if ((file != null) && (file.ContentLength > 0) && !string.IsNullOrEmpty(file.FileName))
                {
                    string fileName = file.FileName;
                    string fileContentType = file.ContentType;
                    byte[] fileBytes = new byte[file.ContentLength];
                    var data = file.InputStream.Read(fileBytes, 0, Convert.ToInt32(file.ContentLength));

                    // Khai báo biến
                    if (Session["LopMonHocCurrent"] != null)
                    {
                        int IdLopMonHocCurrent = ((LopMonHoc)Session["LopMonHocCurrent"]).IdLopMonHoc;
                        List<DanhSach> ListDanhSachThanhCong = new List<DanhSach>();
                        List<DanhSachThemThatBai> ListDanhSachThatBai = new List<DanhSachThemThatBai>();
                        string MaSinhVienFromFile = ""; 

                        using (var package = new ExcelPackage(file.InputStream))
                        {
                            var currentSheet = package.Workbook.Worksheets;
                            var workSheet = currentSheet.First();
                            var noOfCol = workSheet.Dimension.End.Column;
                            var noOfRow = workSheet.Dimension.End.Row;

                            for (int rowIterator = 2; rowIterator <= noOfRow; rowIterator++)
                            {

                                DanhSach DanhSach = new DanhSach();
                                DanhSach.IdLopMonHoc = IdLopMonHocCurrent;
                                MaSinhVienFromFile = workSheet.Cells[rowIterator, 2].Value.ToString();

                                if (KiemTraTonTaiNguoiDung(MaSinhVienFromFile))
                                {
                                    DanhSach.IdNguoiDung = (from t in db.NguoiDungs
                                                            where t.UserName == MaSinhVienFromFile
                                                            select t.IdNguoiDung).ToList().First();
                                
                                    if (KiemTraLaSinhVien(DanhSach.IdNguoiDung))
                                    {
                                        if (false == KiemTraDanhSachTrung(DanhSach.IdLopMonHoc, DanhSach.IdNguoiDung))
                                        {
                                            db.DanhSaches.Add(DanhSach);
                                            db.SaveChanges();
                                            ListDanhSachThanhCong.Add(DanhSach);
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
                                                    newDiemDanh.IdNguoiDung = DanhSach.IdNguoiDung;
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
                                            BanGhiThatBai.MaNguoiDung = workSheet.Cells[rowIterator, 2].Value.ToString();
                                            BanGhiThatBai.MoTa = "đã có trong lớp học";
                                            ListDanhSachThatBai.Add(BanGhiThatBai);
                                        }
                                    }
                                    else
                                    {
                                        // nếu không phải là sinh viên
                                        DanhSachThemThatBai BanGhiThatBai = new DanhSachThemThatBai();
                                        BanGhiThatBai.MaNguoiDung = workSheet.Cells[rowIterator, 2].Value.ToString();
                                        BanGhiThatBai.MoTa = "không phải là sinh viên";
                                        ListDanhSachThatBai.Add(BanGhiThatBai);
                                    }
                                }
                                else
                                {
                                    // nếu người dùng k tồn tại
                                    DanhSachThemThatBai BanGhiThatBai = new DanhSachThemThatBai();
                                    BanGhiThatBai.MaNguoiDung = workSheet.Cells[rowIterator, 2].Value.ToString();
                                    BanGhiThatBai.MoTa = "không tồn tại";
                                    ListDanhSachThatBai.Add(BanGhiThatBai);
                                }

                            }

                        }

                        Session["ListDanhSachThanhCong"] = ListDanhSachThanhCong;
                        Session["ListDanhSachThatBai"] = ListDanhSachThatBai;

                        return RedirectToAction("KetQuaThemVaoDanhSach", new
                        {
                            ListDanhSachThanhCong = ListDanhSachThanhCong,
                            ListDanhSachThatBai = ListDanhSachThatBai
                        });

                    }
                    else
                    {
                        // Chưa chọn lớp môn học
                    }
                }
            }
            return View("BrowseDanhSach");
        }


        // return true là trùng, false là không trùng
        public bool KiemTraDanhSachTrung(int IdLopMonHoc, int IdNguoiDung)
        {
            bool b = false;
            var ListNguoiDungTrongLop = (from t in db.DanhSaches
                                         where ((t.IdLopMonHoc == IdLopMonHoc) && (t.IdNguoiDung == IdNguoiDung))
                                         select t);
            if(ListNguoiDungTrongLop.Count() > 0)
            {
                b = true;
            }
            return b;
        }

        // return true là sinh viên, false không phải là sinh viên
        public bool KiemTraLaSinhVien(int IdNguoiDung)
        {
            bool b = false;
            var SinhVien = (from t in db.NguoiDungs
                            where ((t.IdNguoiDung == IdNguoiDung) && (t.IdLoaiNguoiDung == 2))
                            select t);
            if (SinhVien.Count() > 0)
            {
                b = true;
            }
            return b;
        }

        // return true là tồn tại, false không tồn tại
        public bool KiemTraTonTaiNguoiDung(string UserName)
        {
            bool b = false;
            var NguoiDung = (from t in db.NguoiDungs
                             where ((t.UserName == UserName))
                            select t);
            if (NguoiDung.Count() > 0)
            {
                b = true;
            }
            return b;
        }

    }
}