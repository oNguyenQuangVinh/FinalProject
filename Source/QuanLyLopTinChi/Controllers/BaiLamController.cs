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
    public class BaiLamController : Controller
    {
        private QuanLyLopTinChiEntities db = new QuanLyLopTinChiEntities();

        //
        // GET: /BaiLam/

        public ActionResult Index()
        {
            var bailams = db.BaiLams.Include(b => b.BaiTap).Include(b => b.NguoiDung);
            return View(bailams.ToList());
        }

        //
        // GET: /BaiLam/Details/5

        public ActionResult Details(int id = 0)
        {
            BaiLam bailam = db.BaiLams.Find(id);
            if (bailam == null)
            {
                return HttpNotFound();
            }
            return View(bailam);
        }

        //
        // GET: /BaiLam/XemBangDiem/5

        public ActionResult XemBangDiem(int idBaiTap = 0)
        {
            LopMonHoc LopMonHocCurrent = (LopMonHoc)Session["LopMonHocCurrent"];
            List<BaiLam> ListBaiLam = (List<BaiLam>)(from b in db.BaiLams
                                                     where b.IdBaiTap == idBaiTap
                                                     select b).ToList();
            List<int> ListIdNguoiDungDaNop = new List<int>();
            foreach(BaiLam bl in ListBaiLam)
            {
                ListIdNguoiDungDaNop.Add(bl.IdNguoiDung);
            }

            List<NguoiDung> ListChuaNopBai = (List<NguoiDung>)(from b in db.DanhSaches
                                                               where !ListIdNguoiDungDaNop.Contains(b.IdNguoiDung)
                                                               && b.IdLopMonHoc == LopMonHocCurrent.IdLopMonHoc
                                                               select b.NguoiDung).ToList();

            ViewBag.ListChuaNopBai = ListChuaNopBai;

            return View(ListBaiLam);
        }

        //
        // GET: /BaiLam/SuaDiem

        public ActionResult SuaDiem(int id = 0)
        {
            List<BaiLam> ListBaiLamDaCham = (List<BaiLam>)(from b in db.BaiLams
                                                           where b.IdBaiTap == id && b.Diem != null
                                                           select b).ToList();
            BaiTap BaiTapCurrent = (BaiTap)((from b in db.BaiTaps
                                             where b.IdBaiTap == id
                                             select b).First());

            ViewBag.BaiTapCurrent = BaiTapCurrent;

            return View(ListBaiLamDaCham);
        }

        //
        // POST: /BaiLam/SuaDiem

        [HttpPost]
        public ActionResult SuaDiem(List<BaiLam> ListBaiLam)
        {
            foreach (BaiLam b in ListBaiLam)
            {
                if (b.Diem != null || b.NhanXet != null)
                {
                    BaiLam bailam = (BaiLam)(from k in db.BaiLams
                                             where k.IdBaiTap == b.IdBaiTap && k.IdNguoiDung == b.IdNguoiDung
                                             select k).First();
                    if (b.Diem != null)
                    {
                        bailam.Diem = b.Diem;
                    }
                    if (b.NhanXet != null)
                    {
                        bailam.NhanXet = b.NhanXet;
                    }

                    db.Entry(bailam).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            return RedirectToAction("XemBangDiem", new { idBaiTap = ListBaiLam[0].IdBaiTap });
        }

        //
        // GET: /BaiLam/ChamBai

        public ActionResult ChamBai(int id = 0)
        {
            List<BaiLam> ListBaiLamChuaCham = (List<BaiLam>)(from b in db.BaiLams
                                                             where b.IdBaiTap == id && b.Diem == null
                                                             select b).ToList();
            List<BaiLam> ListBaiLamDaCham = (List<BaiLam>)(from b in db.BaiLams
                                                           where b.IdBaiTap == id && b.Diem != null
                                                           select b).ToList();
            BaiTap BaiTapCurrent = (BaiTap)((from b in db.BaiTaps
                                             where b.IdBaiTap == id
                                             select b).First());

            ViewBag.BaiTapCurrent = BaiTapCurrent;
            ViewBag.ListBaiLamDaCham = ListBaiLamDaCham;

            return View(ListBaiLamChuaCham);
        }

        //
        // POST: /BaiLam/ChamBai

        [HttpPost]
        public ActionResult ChamBai(List<BaiLam> ListBaiLam, FormCollection collection)
        {
            string DiemTruStr = Convert.ToString(collection["DiemTru"]);

            foreach (BaiLam b in ListBaiLam)
            {
                if (b.Diem != null || b.NhanXet != null)
                {
                    BaiLam bailam = (BaiLam)(from k in db.BaiLams
                                             where k.IdBaiTap == b.IdBaiTap && k.IdNguoiDung == b.IdNguoiDung
                                             select k).First();
                    if (b.Diem != null)
                    {
                        int DiemTru;
                        if (int.TryParse(DiemTruStr, out DiemTru))
                        {
                            // Nếu có thực hiện trừ điểm muộn
                            if (DiemTru > 0 && b.NopMuon == true)
                            {
                                // Nếu sau khi trừ điểm mà điểm cuối cùng > 0
                                if (b.Diem - Convert.ToInt16(DiemTru) >= 0)
                                {
                                    bailam.Diem = b.Diem - Convert.ToInt16(DiemTru);
                                }
                                // Nếu sau khi trừ điểm mà điểm cuối cùng < 0 thì gán điểm cuối cùng = 0
                                else
                                {
                                    bailam.Diem = 0;
                                }
                            }
                            else
                            {
                                bailam.Diem = b.Diem;
                            }
                        }
                        else
                        {
                            bailam.Diem = b.Diem;
                        }
                    }

                    if (b.NhanXet != null)
                    {
                        bailam.NhanXet = b.NhanXet;
                    }
                    db.Entry(bailam).State = EntityState.Modified;
                    db.SaveChanges();
                }
            }
            return RedirectToAction("XemBangDiem", new { idBaiTap = ListBaiLam[0].IdBaiTap });
        }


        //
        // GET: /BaiLam/Create

        public ActionResult Create()
        {
            ViewBag.IdBaiTap = new SelectList(db.BaiTaps, "IdBaiTap", "TenBaiTap");
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh");
            return View();
        }

        //
        // POST: /BaiLam/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(BaiLam bailam)
        {
            if (ModelState.IsValid)
            {
                db.BaiLams.Add(bailam);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.IdBaiTap = new SelectList(db.BaiTaps, "IdBaiTap", "TenBaiTap", bailam.IdBaiTap);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", bailam.IdNguoiDung);
            return View(bailam);
        }

        //
        // GET: /BaiLam/Edit/5

        public ActionResult Edit(int id = 0)
        {
            BaiLam bailam = db.BaiLams.Find(id);
            if (bailam == null)
            {
                return HttpNotFound();
            }
            ViewBag.IdBaiTap = new SelectList(db.BaiTaps, "IdBaiTap", "TenBaiTap", bailam.IdBaiTap);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", bailam.IdNguoiDung);
            return View(bailam);
        }

        //
        // POST: /BaiLam/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(BaiLam bailam)
        {
            if (ModelState.IsValid)
            {
                db.Entry(bailam).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.IdBaiTap = new SelectList(db.BaiTaps, "IdBaiTap", "TenBaiTap", bailam.IdBaiTap);
            ViewBag.IdNguoiDung = new SelectList(db.NguoiDungs, "IdNguoiDung", "DuongDanAnh", bailam.IdNguoiDung);
            return View(bailam);
        }

        //
        // GET: /BaiLam/Delete/5

        public ActionResult Delete(int id = 0)
        {
            BaiLam bailam = db.BaiLams.Find(id);
            if (bailam == null)
            {
                return HttpNotFound();
            }
            return View(bailam);
        }

        //
        // POST: /BaiLam/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            BaiLam bailam = db.BaiLams.Find(id);
            db.BaiLams.Remove(bailam);
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