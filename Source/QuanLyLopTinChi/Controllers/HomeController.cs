using QuanLyLopTinChi.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace QuanLyLopTinChi.Controllers
{
    public class HomeController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        public ActionResult TrangChu()
        {
            List<int> ListIdLopTimKiem = null;
            List<LopMonHoc> ListLopTimKiem = null;

            if(Session["ListIdLopTimKiem"] != null)
            {
                ListIdLopTimKiem = (List<int>)Session["ListIdLopTimKiem"];
                ListLopTimKiem = (List<LopMonHoc>)(from t in db.LopMonHocs
                                                   where ListIdLopTimKiem.Contains(t.IdLopMonHoc)
                                                   select t).ToList();
            }

            // Hiển thị các DropdownList
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
            ViewBag.HeDaoTao = new SelectList(db.HeDaoTaos, "IdHeDaoTao", "TenHeDaoTao");
            ViewBag.NguoiDang = new SelectList(db.NguoiDungs, "IdNguoiDung", "HoTen");

            NguoiDung NguoiDungCurrent = (NguoiDung)Session["NguoiDungCurrent"];




            List<LopMonHoc> ListLopDangHoatDong = (from e in db.LopMonHocs
                                       where (((e.ThoiGianKetThuc > DateTime.Now) &&
                                             (e.CongKhai == true)) &&
                                             e.IdNguoiDung != NguoiDungCurrent.IdNguoiDung)
                                       select e).ToList();
            List<LopMonHoc> ListLopTheoNguoiDung = (List<LopMonHoc>)((from t in db.LopMonHocs
                                                                      where t.IdNguoiDung == NguoiDungCurrent.IdNguoiDung
                                                                      select t).ToList());
            ViewBag.ListLopTimKiem = ListLopTimKiem;
            ViewBag.NguoiDungCurrentHoTen = NguoiDungCurrent.HoTen;
            ViewBag.ListLopDangHoatDong = ListLopDangHoatDong;
            ViewBag.ListLopTheoNguoiDung = ListLopTheoNguoiDung;

            return View();
            
        }

        [HttpPost]
        public ActionResult TimKiemLop(FormCollection collection)
        {
            LopMonHocController lopMonHocCont = new LopMonHocController();

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
            ListIdLopTimKiem = lopMonHocCont.TimKiemIdLopCore(MaLop, IdMonHoc, IdHeDaoTao, IdGiaoVien, IsHoatDong);
            Session["ListIdLopTimKiem"] = ListIdLopTimKiem;
            return RedirectToAction("TrangChu");

        }


        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}
