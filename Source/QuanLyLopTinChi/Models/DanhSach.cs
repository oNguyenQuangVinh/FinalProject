//------------------------------------------------------------------------------
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
    
    public partial class DanhSach
    {
        public int IdLopMonHoc { get; set; }
        public int IdNguoiDung { get; set; }
        public Nullable<double> DiemChuyenCan { get; set; }
        public Nullable<double> DiemThuongXuyen { get; set; }
    
        public virtual LopMonHoc LopMonHoc { get; set; }
        public virtual NguoiDung NguoiDung { get; set; }
    }
}
