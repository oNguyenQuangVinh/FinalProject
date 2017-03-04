﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace QuanLyLopTinChi.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    
    public partial class TaiLieu
    {
        public TaiLieu()
        {
            this.BaiLams = new HashSet<BaiLam>();
            this.BaiTaps = new HashSet<BaiTap>();
            this.LopMonHocs = new HashSet<LopMonHoc>();
            this.TaiLieu_LopMonHoc = new HashSet<TaiLieu_LopMonHoc>();
        }
    
        public int IdTaiLieu { get; set; }

        [Display(Name = "Tên Tài Liệu")]
        public string TenTaiLieu { get; set; }

        [Display(Name = "Đường Dẫn")]
        public string DuongDan { get; set; }

        [Display(Name = "Định Dạng")]
        public string DinhDang { get; set; }

        [Display(Name = "Dung Lượng")]
        public string DungLuong { get; set; }

        [Display(Name = "Người Tạo")]
        public Nullable<int> IdNguoiDung { get; set; }

        [Display(Name = "Loại Tài Liệu")]
        public Nullable<int> IdLoaiTaiLieu { get; set; }
    
        public virtual ICollection<BaiLam> BaiLams { get; set; }
        public virtual ICollection<BaiTap> BaiTaps { get; set; }
        public virtual LoaiTaiLieu LoaiTaiLieu { get; set; }
        public virtual ICollection<LopMonHoc> LopMonHocs { get; set; }
        public virtual NguoiDung NguoiDung { get; set; }
        public virtual ICollection<TaiLieu_LopMonHoc> TaiLieu_LopMonHoc { get; set; }
    }
}
