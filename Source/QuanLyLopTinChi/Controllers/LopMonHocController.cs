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
    public class LopMonHocController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();
        public string TaiLieuPath = "/uploads/TaiLieu";
        //
        // GET: /LopMonHoc/

        public ActionResult Index()
        {
            return View(db.LopMonHocs.ToList());
        }

        //
        // GET: /LopMonHoc/

        public ActionResult DanhSachTheoNguoiDung()
        {
            NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];
            var lops = from e in db.LopMonHocs
                       where (e.IdNguoiDung == NguoiDungCurrent.IdNguoiDung)
                       select e;
            IList<LopMonHoc> listLops = lops.ToList<LopMonHoc>();
            ViewBag.NguoiDungCurrentHoTen = NguoiDungCurrent.HoTen;
            return View(listLops);
        }

        //
        // GET: /LopMonHoc/Details/5

        public ActionResult Details(int id = 0)
        {
            LopMonHoc lopmonhoc = db.LopMonHocs.Find(id);
            List<TaiLieu> ListTaiLieuTheoLop = new List<TaiLieu>();
            List<BuoiHoc> ListBuoiHocTheoLop = new List<BuoiHoc>();
            List<NguoiDung> ListDanhSachTheoLop = new List<NguoiDung>();
            List<BaiTap> ListBaiTapTheoLop = new List<BaiTap>();
            Session["LopMonHocCurrent"] = lopmonhoc;
            Session["YeuCauCount"] = (from y in db.YeuCauThamGias
                                      where y.IdLopMonHoc == id
                                      select y).Count();
            if (lopmonhoc == null)
            {
                return HttpNotFound();
            }
            else
            {
                // Chỉ hiển thi kết quả các tài liệu theo lớp môn học
                LopMonHoc LopMonHocCurrent = ((LopMonHoc)Session["LopMonHocCurrent"]);
                List<int> ListIdTaiLieu = (List<int>)((from t in db.TaiLieu_LopMonHoc
                                                       where t.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                                       select t.IdTaiLieu).ToList());
                List<int> ListIdDanhSach = (from t in db.DanhSaches
                                            where t.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                            select t.IdNguoiDung).ToList();

                ListBuoiHocTheoLop = (List<BuoiHoc>)(from b in db.BuoiHocs
                                                     where b.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                                     select b).ToList();

                ListTaiLieuTheoLop = (List<TaiLieu>)(from s in db.TaiLieux
                                                     where ListIdTaiLieu.Contains(s.IdTaiLieu)
                                                     orderby s.LoaiTaiLieu.TenLoaiTaiLieu, s.TenTaiLieu
                                                     select s).ToList();

                ListDanhSachTheoLop = (from t in db.NguoiDungs
                                       where ListIdDanhSach.Contains(t.IdNguoiDung)
                                       select t).ToList();

                ListBaiTapTheoLop = (from b in db.BaiTaps
                                     where b.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                     select b).ToList();

            }
            ViewBag.TaiLieuTheoLop = ListTaiLieuTheoLop;
            ViewBag.ListBuoiHocTheoLop = ListBuoiHocTheoLop;
            ViewBag.ListDanhSachTheoLop = ListDanhSachTheoLop;
            ViewBag.TongSoSinhVien = ListDanhSachTheoLop.Count();
            ViewBag.ListBaiTapTheoLop = ListBaiTapTheoLop;

            return View(lopmonhoc);
        }

        [HttpPost]
        public ActionResult UploadTaiLieu(HttpPostedFileBase TaiLieusUpload, TaiLieu tailieu)
        {
            if (ModelState.IsValid)
            {
                if (Request != null)
                {
                    HttpPostedFileBase file = Request.Files["TaiLieuUpload"];
                    if ((file != null) && (file.ContentLength > 0) && !string.IsNullOrEmpty(file.FileName))
                    {
                        string filePath = Path.Combine(Server.MapPath("/uploads"), file.FileName);
                        file.SaveAs(filePath);
                        tailieu.DinhDang = Path.GetExtension(file.FileName);
                        tailieu.DuongDan = file.FileName;
                        tailieu.DungLuong = file.ContentLength.ToString();

                        NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];
                        tailieu.IdNguoiDung = NguoiDungCurrent.IdNguoiDung;

                        db.TaiLieux.Add(tailieu);
                        db.SaveChanges();
                        Session["TaiLieuLe"] = tailieu;
                        return RedirectToAction("CreateLopLayTaiLieu");
                    }
                }
            }
            return View();
        }

        [AcceptVerbs(HttpVerbs.Get)]
        public JsonResult LoadHeDaoTaoTheoMonHoc(string IdMonHoc)
        {
            // Xử lý việc người dùng không hoặc chưa chọn monhoc
            if (IdMonHoc == "")
            {
                IdMonHoc = "-1";
            }
            int idMonHoc = Int32.Parse(IdMonHoc);
            List<int> ListIdHeDaoTao = (from u in db.MonHoc_HeDaoTao
                                        where u.IdMonHoc == idMonHoc
                                        select u.HeDaoTao.IdHeDaoTao).ToList();
            var ListHeDaoTao = (from t in db.HeDaoTaos
                                where (ListIdHeDaoTao.Contains(t.IdHeDaoTao))
                                select t).ToList();

            var HeDaoTaoData = ListHeDaoTao.Select(m => new SelectListItem()
            {
                Text = m.TenHeDaoTao,
                Value = m.IdHeDaoTao.ToString(),
            });

            return Json(HeDaoTaoData, JsonRequestBehavior.AllowGet);
        }

        //
        // GET: /LopMonHoc/Create

        public ActionResult CreateLopCoBan()
        {
            if (Session["NguoiDungCurrent"] != null)
            {
                // Fill dữ liệu vào dropdownlist chọn môn học
                NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];

                var LopMonTheoNguoiDung = from t in db.LopMonHocs
                                          where t.IdNguoiDung == NguoiDungCurrent.IdNguoiDung
                                          select t;

                ViewBag.LopMonHoc = new SelectList(LopMonTheoNguoiDung, "IdLopMonHoc", "TenLopFull");
                List<SelectListItem> ListMonHoc = new List<SelectListItem>();
                var query = from u in db.MonHocs select u;
                if (query.Count() > 0)
                {
                    foreach (var v in query)
                    {
                        ListMonHoc.Add(new SelectListItem { Text = v.TenMonHoc, Value = v.IdMonHoc.ToString() });
                    }
                }
                ViewBag.ListMonHoc = ListMonHoc;
            }
            else
            {
                // chưa đăng nhập
            }
            return View();
        }

        //
        // POST: /LopMonHoc/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult CreateLopCoBan(HttpPostedFileBase DeCuongBaiGiangUpload,
                                           FormCollection collection,
                                           LopMonHoc lopmonhoc,
                                           int IdLopMonHocTaiLieu = -1,
                                           int IdMonHoc = -1,
                                           int IdHeDaoTao = -1)
        {
            NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];
            TaiLieu tailieu = null;

            // Thêm đề cương bài giảng vào csdl và vào lớp
            string TenTaiLieu = Convert.ToString(collection["TenTaiLieu"]);
            if (Request != null)
            {
                HttpPostedFileBase file = Request.Files["DeCuongBaiGiangUpload"];
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
                    tailieu.IdLoaiTaiLieu = 2; // 2 = đề cương bài giảng

                    // Thêm đề cương bài giảng vào csdl
                    db.TaiLieux.Add(tailieu);
                    db.SaveChanges();
                }
                else
                {
                    return View();
                }
            }

            // Lấy ra list monhoc_hedaotao thỏa mãn giá trị IdMonHoc và IdHeDaoTao nhập vào
            List<MonHoc_HeDaoTao> ListMonHoc_HeDaoTao = (from t in db.MonHoc_HeDaoTao
                                                         where ((t.IdMonHoc == IdMonHoc) && (t.IdHeDaoTao == IdHeDaoTao))
                                                         select t).ToList();

            // tồn tại idmonhoc_hedaotao thỏa mãn
            if (ListMonHoc_HeDaoTao.Count() > 0)
            {
                ViewBag.IdNguoiDung = new SelectList(db.LoaiNguoiDungs, "IdNguoiDung", "HoTen", lopmonhoc.IdNguoiDung);

                lopmonhoc.MonHoc_HeDaoTao = ListMonHoc_HeDaoTao.First();

                // Lấy danh sách tài liệu từ lớp môn học có sẵn đã chọn
                List<int> idTaiLieusInLopCoSan = (from t in db.TaiLieu_LopMonHoc
                                                  where t.IdLopMonHoc == IdLopMonHocTaiLieu
                                                  select t.TaiLieu.IdTaiLieu).ToList();
                var taiLieusInLopCoSan = (from t in db.TaiLieux
                                          where (idTaiLieusInLopCoSan.Contains(t.IdTaiLieu))
                                          select t).ToList();

                Session["ListTaiLieuTheoLop"] = (List<TaiLieu>)taiLieusInLopCoSan;
            }
            else
            {
                return View(); 
            }

            // Thêm LopMonHoc moi
            lopmonhoc.IdNguoiDung = NguoiDungCurrent.IdNguoiDung;
            // Thêm đề cương bài giảng vào lớp
            if (tailieu != null)
            {
                lopmonhoc.IdDeCuongBaiGiang = tailieu.IdTaiLieu;
            }
            db.LopMonHocs.Add(lopmonhoc);
            db.SaveChanges();

            Session["TaoLopCurrent"] = lopmonhoc;
            Session["TaoLopCurrentListTaiLieu"] = new List<TaiLieu>();

            return RedirectToAction("CreateLopLayTaiLieu");
        }

        //public ActionResult ChonMonHoc(int IdMonHoc = -1)
        //{

        //}

        //
        // GET: /LopMonHoc/CreateLopLayTaiLieu

        public ActionResult ChonTaiLieuTuLopCoSan(int IdLopMonHoc = -1)
        {
            if (IdLopMonHoc != -1)
            {
                List<TaiLieu> ListTaiLieuTheoLop = new List<TaiLieu>();
                // Lấy danh sách tài liệu theo IdLopMonHoc lấy được 
                List<int> taiLieuLops = (from tl in db.TaiLieu_LopMonHoc
                                         where (tl.IdLopMonHoc.Equals(IdLopMonHoc))
                                         select tl.TaiLieu.IdTaiLieu).ToList();

                var taiLieus = (from t in db.TaiLieux
                                where (taiLieuLops.Contains(t.IdTaiLieu))
                                select t).ToList();
                // Nếu Session đã tồn tại
                if (Session["ListTaiLieuTheoLop"] != null)
                {
                    ListTaiLieuTheoLop = (List<TaiLieu>)Session["ListTaiLieuTheoLop"];

                    ListTaiLieuTheoLop.Clear();
                    foreach (TaiLieu t in taiLieus)
                    {
                        ListTaiLieuTheoLop.Add(t);
                    }
                    Session["ListTaiLieuTheoLop"] = ListTaiLieuTheoLop;
                }
                else
                {
                    foreach (TaiLieu t in taiLieus)
                    {
                        ListTaiLieuTheoLop.Add(t);
                    }
                    Session["ListTaiLieuTheoLop"] = ListTaiLieuTheoLop;
                }
            }
            return RedirectToAction("CreateLopLayTaiLieu");
        }

        public bool KiemTraListTaiLieuTrung(List<TaiLieu> ListTaiLieu, int IdTaiLieu)
        {
            bool exsist = false;
            foreach (TaiLieu t in ListTaiLieu)
            {
                if (t.IdTaiLieu == IdTaiLieu)
                {
                    exsist = true;
                }
            }
            return exsist;
        }

        //
        // GET: /LopMonHoc/CreateLopLayTaiLieu

        public ActionResult CreateLopLayTaiLieu(string sortOrder)
        {
            // Hiển thị các DropdownList
            ViewBag.LopMonHoc = new SelectList(db.LopMonHocs, "IdLopMonHoc", "TenLopFull");
            ViewBag.NguoiDang = new SelectList(db.NguoiDungs, "IdNguoiDung", "HoTen");

            // Merge các list tài liệu
            List<TaiLieu> taiLieus = new List<TaiLieu>();
            List<TaiLieu> ListTaiLieu = new List<TaiLieu>(); ;
            List<TaiLieu> ListTaiLieuTheoLop = new List<TaiLieu>();
            List<TaiLieu> ListTaiLieuLe = new List<TaiLieu>();
            TaiLieu TaiLieuLe = new TaiLieu();

            if (Session["ListTaiLieu"] != null)
            {
                ListTaiLieu = (List<TaiLieu>)Session["ListTaiLieu"];
            }
            if (Session["ListTaiLieuTheoLop"] != null)
            {
                ListTaiLieuTheoLop = (List<TaiLieu>)Session["ListTaiLieuTheoLop"];
                // Gộp 2 list và loại bỏ trùng lặp
                foreach (TaiLieu t in ListTaiLieuTheoLop)
                {
                    if (KiemTraListTaiLieuTrung(ListTaiLieu, t.IdTaiLieu) == false)
                    {
                        ListTaiLieu.Add(t);
                    }
                }
                Session["ListTaiLieuTheoLop"] = null;
            }
            if (Session["ListTaiLieuLe"] != null)
            {
                ListTaiLieuLe = (List<TaiLieu>)Session["ListTaiLieuLe"];
            }
            if (Session["TaiLieuLe"] != null)
            {
                TaiLieuLe = (TaiLieu)Session["TaiLieuLe"];
                // Chi Khi Tai Lieu Le chưa tồn tại trong list thì mới add
                if (KiemTraListTaiLieuTrung(ListTaiLieu, TaiLieuLe.IdTaiLieu) == false)
                {
                    ListTaiLieu.Add(TaiLieuLe);
                }

                Session["TaiLieuLe"] = null;
            }
            Session["ListTaiLieu"] = ListTaiLieu;

            // Chức năng hiển thị sáp xếp theo header của List Tài Liệu
            if (ListTaiLieu != null && ListTaiLieu.Count() != 0)
            {
                List<int> ListIdTaiLieu = ListTaiLieu.Select(o => o.IdTaiLieu).ToList();
                taiLieus = (from t in db.TaiLieux
                            where (ListIdTaiLieu.Contains(t.IdTaiLieu))
                            select t).ToList();
                ViewBag.TenSortParm = String.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
                ViewBag.NguoiDangSortParm = sortOrder == "User" ? "user_desc" : "User";
                ViewBag.DuongDanSortParm = sortOrder == "Link" ? "link_desc" : "Link";
                ViewBag.DungLuongSortParm = sortOrder == "Size" ? "size_desc" : "Size";
                ViewBag.DinhDangSortParm = sortOrder == "Format" ? "format_desc" : "Format";

                switch (sortOrder)
                {
                    case "name_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.TenTaiLieu).ToList();
                        break;
                    case "User":
                        taiLieus = taiLieus.OrderBy(s => s.NguoiDung.HoTen).ToList();
                        break;
                    case "user_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.NguoiDung.HoTen).ToList();
                        break;
                    case "Link":
                        taiLieus = taiLieus.OrderBy(s => s.DuongDan).ToList();
                        break;
                    case "link_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.DuongDan).ToList();
                        break;
                    case "Size":
                        taiLieus = taiLieus.OrderBy(s => s.DungLuong).ToList();
                        break;
                    case "size_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.DungLuong).ToList();
                        break;
                    case "Format":
                        taiLieus = taiLieus.OrderBy(s => s.DinhDang).ToList();
                        break;
                    case "format_desc":
                        taiLieus = taiLieus.OrderByDescending(s => s.DinhDang).ToList();
                        break;
                    default:
                        taiLieus = taiLieus.OrderBy(s => s.TenTaiLieu).ToList();
                        break;
                }
            }
            // Xử lý show các tài liệu sau khi tìm kiếm
            List<int> ListIdTaiLieuLe = ListTaiLieuLe.Select(o => o.IdTaiLieu).ToList();
            var taiLieuLes = (from t in db.TaiLieux
                              where (ListIdTaiLieuLe.Contains(t.IdTaiLieu))
                              select t).ToList();
            ViewBag.ListTaiLieuLe = taiLieuLes;
            ViewBag.ListTaiLieu = taiLieus;

            return View();
        }


        //
        // POST: /LopMonHoc/CreateLopLayTaiLieu
        [HttpPost]
        public ActionResult CreateLopLayTaiLieu()
        {
            LopMonHoc LopMonHocCurrent = (LopMonHoc)Session["TaoLopCurrent"];
            NguoiDung GiaoVienTaoLop = (NguoiDung)Session["NguoiDungCurrent"];
            // Chỉnh sửa tên lớp môn học, idmonhoc_hedaotao, nguoiDang.
            LopMonHocCurrent.TenLopMonHoc = (LopMonHocCurrent.MonHoc_HeDaoTao.TenMonHocHeDaoTao + " - " +
                                            LopMonHocCurrent.SoTiet + " tiết");
            LopMonHocCurrent.IdMonHocHeDaoTao = LopMonHocCurrent.MonHoc_HeDaoTao.IdMonHocHeDaoTao;
            LopMonHocCurrent.IdNguoiDung = GiaoVienTaoLop.IdNguoiDung;

            //// Thêm LopMonHoc moi
            //db.LopMonHocs.Add(LopMonHocCurrent);
            //db.SaveChanges();
            // Lấy được IdLopMonHoc vừa tạo từ csdl
            int newIdLopMonHoc = LopMonHocCurrent.IdLopMonHoc;

            List<TaiLieu> ListTaiLieuDaChon = (List<TaiLieu>)Session["ListTaiLieu"];
            foreach (TaiLieu t in ListTaiLieuDaChon)
            {
                TaiLieu_LopMonHoc tl = new TaiLieu_LopMonHoc();
                tl.IdLopMonHoc = newIdLopMonHoc;
                tl.IdTaiLieu = t.IdTaiLieu;
                // Add vào bảng TaiLieu_LopMonHoc
                db.TaiLieu_LopMonHoc.Add(tl);
                db.SaveChanges();
            }

            // Thêm lớp thành công thì xóa trắng các session
            Session["TaoLopCurrent"] = null;
            Session["ListTaiLieu"] = null;

            return RedirectToAction("Details", new { id = newIdLopMonHoc });
        }

        [HttpPost]
        public ActionResult LayTaiLieuLe(FormCollection collection)
        {
            // Lấy dữ liệu từ View
            string TenTaiLieu = Convert.ToString(collection["TenTaiLieu"]);
            int idNguoiDang = -1;
            int idLopMonHoc = -1;
            string IdNguoiDangCollect = collection["IdNguoiDang"].ToString();
            string IdLopMonHocCollect = collection["IdLopMonHoc"].ToString();

            if (IdNguoiDangCollect != "")
            {
                idNguoiDang = Int32.Parse(collection["IdNguoiDang"]);
            }
            if (IdLopMonHocCollect != "")
            {
                idLopMonHoc = Int32.Parse(collection["IdLopMonHoc"]);
            }

            Session["ListTaiLieuLe"] = TimKiemTaiLieu(TenTaiLieu, idNguoiDang, idLopMonHoc);

            return RedirectToAction("CreateLopLayTaiLieu");
        }

        public List<TaiLieu> TimKiemTaiLieu(string TenTaiLieu, int IdNguoiDang, int IdLopMonHoc)
        {
            // Thực hiện lọc kết quả
            List<int> taiLieuLops = (from tl in db.TaiLieu_LopMonHoc
                                     where (tl.IdLopMonHoc.Equals(IdLopMonHoc))
                                     select tl.TaiLieu.IdTaiLieu).ToList();

            var taiLieus = from t in db.TaiLieux
                           select t;
            if (TenTaiLieu != "")
            {
                taiLieus = taiLieus.Where(q => q.TenTaiLieu == TenTaiLieu);
            }
            if (IdNguoiDang != -1)
            {
                taiLieus = taiLieus.Where(q => q.IdNguoiDung == IdNguoiDang);
            }
            if (IdLopMonHoc != -1)
            {
                taiLieus = taiLieus.Where(q => taiLieuLops.Contains(q.IdTaiLieu));
            }

            //Xử lý kết quả
            if (taiLieus.ToList().Count != 0)
            {
                return (List<TaiLieu>)taiLieus.ToList();
            }
            else
            {
                return null;
            }
        }


        public ActionResult ThemVaoDanhSach(int idTaiLieu)
        {
            var taiLieu = (from t in db.TaiLieux
                           where t.IdTaiLieu == idTaiLieu
                           select t);
            Session["TaiLieuLe"] = taiLieu.ToList().First();

            return RedirectToAction("CreateLopLayTaiLieu");
        }

        [HttpPost]
        public ActionResult XoaKhoiDanhSach(int idTaiLieu)
        {
            List<TaiLieu> ListTaiLieu = (List<TaiLieu>)Session["ListTaiLieu"];

            ListTaiLieu.RemoveAll(item => item.IdTaiLieu == idTaiLieu);
            Session["ListTaiLieu"] = ListTaiLieu;
            int itemCount = ListTaiLieu.Count();

            var results = new
            {
                DeleteId = idTaiLieu,
                ItemCount = itemCount
            };
            return Json(results);
        }

        public ActionResult Edit(int id = 0)
        {
            LopMonHoc lopmonhoc = db.LopMonHocs.Find(id);
            if (lopmonhoc == null)
            {
                return HttpNotFound();
            }
            return View(lopmonhoc);
        }

        //
        // POST: /LopMonHoc/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(LopMonHoc lopmonhoc)
        {
            if (ModelState.IsValid)
            {
                db.Entry(lopmonhoc).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(lopmonhoc);
        }

        //
        // GET: /LopMonHoc/Delete/5

        public ActionResult Delete(int id = 0)
        {
            LopMonHoc lopmonhoc = db.LopMonHocs.Find(id);
            if (lopmonhoc == null)
            {
                return HttpNotFound();
            }
            return View(lopmonhoc);
        }

        //
        // POST: /LopMonHoc/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            LopMonHoc lopmonhoc = db.LopMonHocs.Find(id);
            db.LopMonHocs.Remove(lopmonhoc);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        public bool ValidateData(LopMonHoc lopmonhoc)
        {
            bool b = true;
            if (lopmonhoc.ThoiGianBatDau < lopmonhoc.ThoiGianKetThuc)
            {
                // thơi gian bắt đầu nhỏ hơn thời gian kết thúc
                b = false;
            }

            return b;
        }


        [HttpPost]
        public ActionResult TimKiemLop(FormCollection collection)
        {
            // Lấy Dữ liệu từ form tìm kiếm
            // Giá trị mặc định
            int MaLop = -1;
            int IdMonHoc = -1;
            int IdHeDaoTao = -1;
            int IdGiaoVien = -1;

            // Giá trị từ form
            string MaLopCollect = collection["MaLop"].ToString();
            string MonHocCollect = collection["IdMonHoc"].ToString();
            string HeDaoTaoCollect = collection["IdHeDaoTao"].ToString();
            string GiaoVienCollect = collection["IdGiaoVien"].ToString();

            // Lấy giá trị từ form nếu không bỏ trống
            if (MaLopCollect != "")
            {
                MaLop = Int32.Parse(MaLopCollect);
            }
            if (MonHocCollect != "0" && MonHocCollect != "")
            {
                IdMonHoc = Int32.Parse(MonHocCollect);
            }
            if (HeDaoTaoCollect != "0" && HeDaoTaoCollect != "")
            {
                IdHeDaoTao = Int32.Parse(HeDaoTaoCollect);
            }
            if (GiaoVienCollect != "0" && GiaoVienCollect != "")
            {
                IdGiaoVien = Int32.Parse(GiaoVienCollect);
            }
            bool IsHoatDong = Convert.ToBoolean(collection["IsHoatDong"].Split(',')[0]);

            // Tìm kiếm 
            List<int> ListIdLopTimKiem = new List<int>();
            ListIdLopTimKiem = TimKiemIdLopCore(MaLop, IdMonHoc, IdHeDaoTao, IdGiaoVien, IsHoatDong);
            Session["ListIdLopTimKiem"] = ListIdLopTimKiem;
            return Redirect(HttpContext.Request.UrlReferrer.AbsoluteUri);

        }

        public List<int> TimKiemIdLopCore(int MaLop = -1,
                                    int IdMonHoc = -1,
                                    int IdHeDaoTao = -1,
                                    int IdGiaoVien = -1,
                                    bool IsHoatDong = true)
        {
            // List tìm kiếm
            IEnumerable<LopMonHoc> ListLopTimKiem = (List<LopMonHoc>)(from e in db.LopMonHocs
                                                                      select e).ToList();


            if (MaLop != -1)
            {
                ListLopTimKiem = ListLopTimKiem.Where(q => q.IdLopMonHoc == MaLop);
            }
            if (IdMonHoc != -1)
            {
                ListLopTimKiem = ListLopTimKiem.Where(q => q.MonHoc_HeDaoTao.MonHoc.IdMonHoc == IdMonHoc);
            }
            if (IdHeDaoTao != -1)
            {
                ListLopTimKiem = ListLopTimKiem.Where(q => q.MonHoc_HeDaoTao.HeDaoTao.IdHeDaoTao == IdHeDaoTao);
            }
            if (IdGiaoVien != -1)
            {
                ListLopTimKiem = ListLopTimKiem.Where(q => q.NguoiDung.IdNguoiDung == IdGiaoVien);
            }
            if (IsHoatDong == true)
            {
                ListLopTimKiem = ListLopTimKiem.Where(d => d.ThoiGianKetThuc > DateTime.Now.Date);
            }

            List<int> ListIdLopTimKiem = new List<int>();
            foreach (LopMonHoc l in ListLopTimKiem)
            {
                ListIdLopTimKiem.Add(l.IdLopMonHoc);
            }

            return ListIdLopTimKiem;
        }

    }
}