USE [QuanLyLopTinChi]
GO
/****** Object:  Table [dbo].[BaiLam]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BaiLam](
	[IdNguoiDung] [int] NOT NULL,
	[IdBaiTap] [int] NOT NULL,
	[IdFileBaiLam] [int] NULL,
	[NhanXet] [nvarchar](500) NULL,
	[Diem] [float] NULL,
	[NopMuon] [bit] NULL,
	[NgayNop] [date] NULL,
 CONSTRAINT [PK_BaiLam] PRIMARY KEY CLUSTERED 
(
	[IdNguoiDung] ASC,
	[IdBaiTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BaiTap]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BaiTap](
	[IdBaiTap] [int] IDENTITY(1,1) NOT NULL,
	[TenBaiTap] [nvarchar](50) NULL,
	[IdLopMonHoc] [int] NULL,
	[MoTaBaiTap] [nvarchar](4000) NULL,
	[IdDeBaiTap] [int] NULL,
	[DinhDangFileBaiLam] [varchar](50) NULL,
	[DungLuongFileBaiLam] [varchar](50) NULL,
	[ChoPhepXemBai] [bit] NULL,
	[ThoiGianBatDau] [datetime] NULL,
	[ThoiGianNopBai] [datetime] NULL,
	[ChoPhepGiaHan] [bit] NULL,
	[SoNgayGiaHan] [int] NULL,
	[DanhDauNopMuon] [bit] NULL,
	[IsKetThuc] [bit] NULL,
 CONSTRAINT [PK_BaiTap] PRIMARY KEY CLUSTERED 
(
	[IdBaiTap] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BuoiHoc]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BuoiHoc](
	[IdBuoiHoc] [int] IDENTITY(1,1) NOT NULL,
	[IdLopMonHoc] [int] NULL,
	[NgayHoc] [date] NULL,
 CONSTRAINT [PK_BuoiHoc] PRIMARY KEY CLUSTERED 
(
	[IdBuoiHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuDeTraoDoi]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDeTraoDoi](
	[IdChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NULL,
	[IdLopMonHoc] [int] NULL,
 CONSTRAINT [PK_ChuDeTraoDoi] PRIMARY KEY CLUSTERED 
(
	[IdChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DanhSach]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhSach](
	[IdLopMonHoc] [int] NOT NULL,
	[IdNguoiDung] [int] NOT NULL,
	[DiemChuyenCan] [float] NULL,
	[DiemThuongXuyen] [float] NULL,
 CONSTRAINT [PK_DanhSach] PRIMARY KEY CLUSTERED 
(
	[IdLopMonHoc] ASC,
	[IdNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DiemDanh]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiemDanh](
	[IdBuoiHoc] [int] NOT NULL,
	[IdNguoiDung] [int] NOT NULL,
	[IdTinhTrangDiHoc] [int] NULL,
	[NhanXet] [nvarchar](500) NULL,
 CONSTRAINT [PK_DiemDanh] PRIMARY KEY CLUSTERED 
(
	[IdBuoiHoc] ASC,
	[IdNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonViQuanLy]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonViQuanLy](
	[IdDonViQuanLy] [int] IDENTITY(1,1) NOT NULL,
	[TenDonViQuanLy] [nvarchar](50) NULL,
 CONSTRAINT [PK_DonViQuanLy] PRIMARY KEY CLUSTERED 
(
	[IdDonViQuanLy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HeDaoTao]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HeDaoTao](
	[IdHeDaoTao] [int] IDENTITY(1,1) NOT NULL,
	[TenHeDaoTao] [nvarchar](50) NULL,
 CONSTRAINT [PK_HeDaoTao] PRIMARY KEY CLUSTERED 
(
	[IdHeDaoTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiNguoiDung]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiNguoiDung](
	[IdLoaiNguoiDng] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiNguoiDung] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiNguoiDung] PRIMARY KEY CLUSTERED 
(
	[IdLoaiNguoiDng] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LoaiTaiLieu]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LoaiTaiLieu](
	[IdLoaiTaiLieu] [int] IDENTITY(1,1) NOT NULL,
	[TenLoaiTaiLieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_LoaiTaiLieu] PRIMARY KEY CLUSTERED 
(
	[IdLoaiTaiLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LopMonHoc]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LopMonHoc](
	[IdLopMonHoc] [int] IDENTITY(1,1) NOT NULL,
	[MaLopMonHoc] [int] NULL,
	[SoTiet] [int] NULL,
	[IdMonHocHeDaoTao] [int] NULL,
	[TenLopMonHoc] [nvarchar](50) NULL,
	[SoBuoiDiemDanh] [int] NULL,
	[ThoiGianBatDau] [date] NULL,
	[ThoiGianKetThuc] [date] NULL,
	[CongKhai] [bit] NULL,
	[IdNguoiDung] [int] NULL,
	[IdDeCuongBaiGiang] [int] NULL,
 CONSTRAINT [PK_LopMonHoc] PRIMARY KEY CLUSTERED 
(
	[IdLopMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc](
	[IdMonHoc] [int] IDENTITY(1,1) NOT NULL,
	[TenMonHoc] [nvarchar](50) NULL,
 CONSTRAINT [PK_MonHoc] PRIMARY KEY CLUSTERED 
(
	[IdMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonHoc-HeDaoTao]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonHoc-HeDaoTao](
	[IdMonHocHeDaoTao] [int] IDENTITY(1,1) NOT NULL,
	[IdMonHoc] [int] NULL,
	[IdHeDaoTao] [int] NULL,
	[TenMonHocHeDaoTao] [nvarchar](50) NULL,
	[IdDeCuongMonHoc] [int] NULL,
	[IdDeCuongChiTiet] [int] NULL,
 CONSTRAINT [PK_MonHoc-HeDaoTao] PRIMARY KEY CLUSTERED 
(
	[IdMonHocHeDaoTao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[IdNguoiDung] [int] IDENTITY(1,1) NOT NULL,
	[DuongDanAnh] [varchar](500) NULL,
	[HoTen] [nvarchar](50) NULL,
	[NgaySinh] [date] NULL,
	[QueQuan] [nvarchar](50) NULL,
	[NgayTaoTaiKhoan] [date] NULL,
	[IdDonViQuanLy] [int] NULL,
	[UserName] [varchar](50) NULL,
	[Password] [varchar](10) NULL,
	[IdLoaiNguoiDung] [int] NULL,
	[HocHam] [nvarchar](50) NULL,
	[HocVi] [nvarchar](50) NULL,
 CONSTRAINT [PK_NguoiDung] PRIMARY KEY CLUSTERED 
(
	[IdNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiLieu]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TaiLieu](
	[IdTaiLieu] [int] IDENTITY(1,1) NOT NULL,
	[TenTaiLieu] [nvarchar](50) NULL,
	[DuongDan] [nvarchar](500) NULL,
	[DinhDang] [varchar](50) NULL,
	[DungLuong] [varchar](50) NULL,
	[IdNguoiDung] [int] NULL,
	[IdLoaiTaiLieu] [int] NULL,
 CONSTRAINT [PK_TaiLieu] PRIMARY KEY CLUSTERED 
(
	[IdTaiLieu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TaiLieu-LopMonHoc]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiLieu-LopMonHoc](
	[IdTaiLieu] [int] NOT NULL,
	[IdLopMonHoc] [int] NOT NULL,
	[GhiChu] [nvarchar](500) NULL,
 CONSTRAINT [PK_TaiLieu-LopMonHoc_1] PRIMARY KEY CLUSTERED 
(
	[IdTaiLieu] ASC,
	[IdLopMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[IdThongBao] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [int] NULL,
	[IdLopMonHoc] [int] NULL,
	[NoiDung] [nvarchar](100) NULL,
	[IsDaDoc] [bit] NULL,
 CONSTRAINT [PK_ThongBao] PRIMARY KEY CLUSTERED 
(
	[IdThongBao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhTrangDiHoc]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangDiHoc](
	[IdTinhTrangDiHoc] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](50) NULL,
	[KyHieu] [nvarchar](50) NULL,
 CONSTRAINT [PK_TinhTrangDiHoc] PRIMARY KEY CLUSTERED 
(
	[IdTinhTrangDiHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinhTrangDiHoc-BuoiNghi]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinhTrangDiHoc-BuoiNghi](
	[IdTinhTrangDiHoc] [int] NOT NULL,
	[IdLopMonHoc] [int] NOT NULL,
	[TuongDuongBuoiNghi] [float] NULL,
 CONSTRAINT [PK_TinhTrangDiHoc-BuoiNghi] PRIMARY KEY CLUSTERED 
(
	[IdTinhTrangDiHoc] ASC,
	[IdLopMonHoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TraoDoi]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TraoDoi](
	[IdTraoDoi] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [int] NULL,
	[IdChuDe] [int] NULL,
	[NoiDungTraoDoi] [nvarchar](4000) NULL,
 CONSTRAINT [PK_TraoDoi] PRIMARY KEY CLUSTERED 
(
	[IdTraoDoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[YeuCauThamGia]    Script Date: 06/05/2016 08:29:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YeuCauThamGia](
	[IdYeuCauThamGia] [int] IDENTITY(1,1) NOT NULL,
	[IdNguoiDung] [int] NOT NULL,
	[IdLopMonHoc] [int] NOT NULL,
	[NgayYeuCau] [datetime] NULL,
 CONSTRAINT [PK_YeuCauThamGia_1] PRIMARY KEY CLUSTERED 
(
	[IdYeuCauThamGia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150580, 1, 41, N'không hoàn thành', 1, 1, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150580, 2, 42, NULL, NULL, 0, CAST(N'2016-05-07' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150581, 1, 43, N'hoàn thành tốt', 8, 0, CAST(N'2016-05-07' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150581, 2, 44, NULL, NULL, 0, CAST(N'2016-05-09' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150582, 1, 45, N'không xem được file', 1, 1, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150582, 2, 46, NULL, NULL, 0, CAST(N'2016-05-10' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150583, 1, 47, NULL, 1, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150583, 2, 48, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150584, 1, 49, NULL, 2, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150584, 2, 50, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150585, 1, 51, N'Cần cố gắng', 4, 1, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150585, 2, 52, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150586, 1, 53, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150586, 2, 54, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150587, 1, 55, NULL, 0, 1, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150587, 2, 56, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150588, 1, 57, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150588, 2, 58, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150589, 1, 59, N'Tốt', 10, 0, CAST(N'2016-05-08' AS Date))
INSERT [dbo].[BaiLam] ([IdNguoiDung], [IdBaiTap], [IdFileBaiLam], [NhanXet], [Diem], [NopMuon], [NgayNop]) VALUES (11150589, 2, 60, NULL, NULL, 0, CAST(N'2016-05-08' AS Date))
SET IDENTITY_INSERT [dbo].[BaiTap] ON 

INSERT [dbo].[BaiTap] ([IdBaiTap], [TenBaiTap], [IdLopMonHoc], [MoTaBaiTap], [IdDeBaiTap], [DinhDangFileBaiLam], [DungLuongFileBaiLam], [ChoPhepXemBai], [ThoiGianBatDau], [ThoiGianNopBai], [ChoPhepGiaHan], [SoNgayGiaHan], [DanhDauNopMuon], [IsKetThuc]) VALUES (1, N'Thiết kế hệ thống', 13, N'Phân tích hệ thống
Thiết kế hệ thống', 61, NULL, NULL, 0, CAST(N'2016-04-30 00:00:00.000' AS DateTime), CAST(N'2016-05-07 00:00:00.000' AS DateTime), 1, 1, 1, 0)
INSERT [dbo].[BaiTap] ([IdBaiTap], [TenBaiTap], [IdLopMonHoc], [MoTaBaiTap], [IdDeBaiTap], [DinhDangFileBaiLam], [DungLuongFileBaiLam], [ChoPhepXemBai], [ThoiGianBatDau], [ThoiGianNopBai], [ChoPhepGiaHan], [SoNgayGiaHan], [DanhDauNopMuon], [IsKetThuc]) VALUES (2, N'Bài Tập Cuối Kỳ', 13, N'Bài Tập cuối kỳ đánh giá sinh viên', NULL, NULL, NULL, 0, CAST(N'2016-05-07 00:00:00.000' AS DateTime), CAST(N'2016-05-28 00:00:00.000' AS DateTime), 0, 0, 0, 0)
INSERT [dbo].[BaiTap] ([IdBaiTap], [TenBaiTap], [IdLopMonHoc], [MoTaBaiTap], [IdDeBaiTap], [DinhDangFileBaiLam], [DungLuongFileBaiLam], [ChoPhepXemBai], [ThoiGianBatDau], [ThoiGianNopBai], [ChoPhepGiaHan], [SoNgayGiaHan], [DanhDauNopMuon], [IsKetThuc]) VALUES (3, N'Bài Tập Thực Hành 1', 21, N'Bài Tập Bắt Buộc', NULL, NULL, NULL, 1, CAST(N'2016-05-01 00:00:00.000' AS DateTime), CAST(N'2016-07-31 00:00:00.000' AS DateTime), 1, 2, 1, 0)
INSERT [dbo].[BaiTap] ([IdBaiTap], [TenBaiTap], [IdLopMonHoc], [MoTaBaiTap], [IdDeBaiTap], [DinhDangFileBaiLam], [DungLuongFileBaiLam], [ChoPhepXemBai], [ThoiGianBatDau], [ThoiGianNopBai], [ChoPhepGiaHan], [SoNgayGiaHan], [DanhDauNopMuon], [IsKetThuc]) VALUES (4, N'Bài Tập Giữa Kỳ', 13, N'Lấy Điểm Giữa Kỳ', 63, NULL, NULL, 0, CAST(N'2016-05-06 00:00:00.000' AS DateTime), CAST(N'2016-05-24 00:00:00.000' AS DateTime), 1, 2, 1, 0)
SET IDENTITY_INSERT [dbo].[BaiTap] OFF
SET IDENTITY_INSERT [dbo].[BuoiHoc] ON 

INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (6, 13, CAST(N'2016-04-06' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (7, 13, CAST(N'2016-04-07' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (8, 13, CAST(N'2016-04-08' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (9, 13, CAST(N'2016-04-09' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (10, 13, CAST(N'2016-04-10' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (11, 13, CAST(N'2016-04-11' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (12, 13, CAST(N'2016-04-12' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (13, 13, CAST(N'2016-04-13' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (14, 13, CAST(N'2016-04-14' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (15, 13, CAST(N'2016-04-15' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (16, 13, CAST(N'2016-04-16' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (17, 13, CAST(N'2016-04-17' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (18, 13, CAST(N'2016-04-18' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (19, 13, CAST(N'2016-04-19' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (20, 3, CAST(N'2016-05-06' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (21, 3, CAST(N'2016-05-07' AS Date))
INSERT [dbo].[BuoiHoc] ([IdBuoiHoc], [IdLopMonHoc], [NgayHoc]) VALUES (22, 3, CAST(N'2016-05-08' AS Date))
SET IDENTITY_INSERT [dbo].[BuoiHoc] OFF
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150580, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150581, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150582, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150583, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150584, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150585, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150586, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150587, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150588, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150589, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150590, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (1, 11150591, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150580, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150581, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150582, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150583, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150584, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150585, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150586, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150587, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150588, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150589, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150590, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (3, 11150591, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150580, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150581, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150582, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150583, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150584, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150585, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150586, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150587, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150588, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150589, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150590, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (6, 11150591, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150580, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150581, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150582, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150583, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150584, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150585, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150586, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150587, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150588, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150589, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150590, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (11, 11150591, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150580, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150581, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150582, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150583, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150584, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150585, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150586, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150587, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150588, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150589, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150590, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150591, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (13, 11150640, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150580, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150581, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150582, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150583, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150584, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150585, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150586, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150587, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150588, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150589, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150590, NULL, NULL)
INSERT [dbo].[DanhSach] ([IdLopMonHoc], [IdNguoiDung], [DiemChuyenCan], [DiemThuongXuyen]) VALUES (16, 11150591, NULL, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150580, 4, N'Nói Chuyện Riêng')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150581, 5, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150582, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150584, 2, N'Mất Trật tự')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150590, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150591, 5, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (6, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150580, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150585, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150589, 1, N'Làm bài tốt')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150591, 4, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (7, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150580, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150583, 4, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150584, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150585, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150589, 5, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150591, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (8, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150580, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150581, 4, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150582, 4, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150583, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (9, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150580, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150581, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150588, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (10, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (11, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150580, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150582, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150585, 5, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150586, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150588, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (12, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150588, 1, NULL)
GO
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (13, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (14, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150580, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (15, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150580, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (16, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150582, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (17, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150582, 4, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150583, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150587, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (18, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150581, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150585, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150588, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150591, 1, N'Làm bài tốt')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (19, 11150640, 3, N'Đăng ký vào lớp muộn')
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150581, 3, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150582, 4, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150588, 4, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150590, 5, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (20, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150581, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150585, 1, NULL)
GO
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (21, 11150591, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150580, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150581, 2, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150582, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150583, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150584, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150585, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150586, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150587, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150588, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150589, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150590, 1, NULL)
INSERT [dbo].[DiemDanh] ([IdBuoiHoc], [IdNguoiDung], [IdTinhTrangDiHoc], [NhanXet]) VALUES (22, 11150591, 1, NULL)
SET IDENTITY_INSERT [dbo].[DonViQuanLy] ON 

INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (1, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (2, N'Khoa Công Nghệ Phần Mềm')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (3, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (4, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (5, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (6, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (7, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (8, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (9, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (10, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (11, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (12, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (13, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (14, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (15, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (16, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (17, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (18, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (19, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (20, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (21, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (22, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (23, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (24, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (25, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (26, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (27, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (28, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (29, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (30, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (31, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (32, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (33, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (34, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (35, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (36, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (37, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (38, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (39, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (40, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (41, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (42, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (43, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (44, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (45, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (46, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (47, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (48, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (49, N'TH10B')
INSERT [dbo].[DonViQuanLy] ([IdDonViQuanLy], [TenDonViQuanLy]) VALUES (50, N'TH10B')
SET IDENTITY_INSERT [dbo].[DonViQuanLy] OFF
SET IDENTITY_INSERT [dbo].[HeDaoTao] ON 

INSERT [dbo].[HeDaoTao] ([IdHeDaoTao], [TenHeDaoTao]) VALUES (1, N'Đại Học')
INSERT [dbo].[HeDaoTao] ([IdHeDaoTao], [TenHeDaoTao]) VALUES (2, N'Cao Đẳng')
INSERT [dbo].[HeDaoTao] ([IdHeDaoTao], [TenHeDaoTao]) VALUES (3, N'Cao Đẳng')
SET IDENTITY_INSERT [dbo].[HeDaoTao] OFF
SET IDENTITY_INSERT [dbo].[LoaiNguoiDung] ON 

INSERT [dbo].[LoaiNguoiDung] ([IdLoaiNguoiDng], [TenLoaiNguoiDung]) VALUES (1, N'Giáo Viên')
INSERT [dbo].[LoaiNguoiDung] ([IdLoaiNguoiDng], [TenLoaiNguoiDung]) VALUES (2, N'Sinh Viên')
SET IDENTITY_INSERT [dbo].[LoaiNguoiDung] OFF
SET IDENTITY_INSERT [dbo].[LoaiTaiLieu] ON 

INSERT [dbo].[LoaiTaiLieu] ([IdLoaiTaiLieu], [TenLoaiTaiLieu]) VALUES (1, N'Tài Liệu Tham Khảo')
INSERT [dbo].[LoaiTaiLieu] ([IdLoaiTaiLieu], [TenLoaiTaiLieu]) VALUES (2, N'Đề Cương Bài Giảng')
INSERT [dbo].[LoaiTaiLieu] ([IdLoaiTaiLieu], [TenLoaiTaiLieu]) VALUES (3, N'Đề Cương Môn Học')
INSERT [dbo].[LoaiTaiLieu] ([IdLoaiTaiLieu], [TenLoaiTaiLieu]) VALUES (4, N'Đề Cương Chi Tiết')
INSERT [dbo].[LoaiTaiLieu] ([IdLoaiTaiLieu], [TenLoaiTaiLieu]) VALUES (5, N'Đề Bài Tập')
INSERT [dbo].[LoaiTaiLieu] ([IdLoaiTaiLieu], [TenLoaiTaiLieu]) VALUES (6, N'Bài Làm')
SET IDENTITY_INSERT [dbo].[LoaiTaiLieu] OFF
SET IDENTITY_INSERT [dbo].[LopMonHoc] ON 

INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (1, 21312312, 45, 1, N'1', 15, CAST(N'2016-02-09' AS Date), CAST(N'2016-02-19' AS Date), 1, 11150571, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (2, 123421, 45, 2, N'1', 15, CAST(N'2016-02-09' AS Date), CAST(N'2016-12-19' AS Date), 1, 11150573, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (3, 12353, 30, 3, N'1', 10, CAST(N'2016-02-09' AS Date), CAST(N'2016-12-19' AS Date), 1, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (4, 346436, 60, 4, N'1', 15, CAST(N'2016-03-17' AS Date), CAST(N'2016-12-12' AS Date), 0, 11150573, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (5, 23235, 40, 5, N'1', 10, CAST(N'2016-03-19' AS Date), CAST(N'2016-03-31' AS Date), 1, 11150571, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (6, 12412412, 35, 8, N'Kỹ Thuật Lập Trình - Cao Đẳng -  35 tiết', 15, CAST(N'2016-02-19' AS Date), CAST(N'2016-02-19' AS Date), 0, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (7, 7996796, 40, 8, N'1', 15, CAST(N'2016-03-17' AS Date), CAST(N'2016-12-19' AS Date), 0, 11150573, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (10, 567457, 60, 11, N'Kỹ Thuật Lập Trình - Đại Học -  60 tiết', 15, CAST(N'2016-02-19' AS Date), CAST(N'2016-02-19' AS Date), 0, 11150571, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (11, 457346, 25, 12, N'Giao Diện Người Máy - Cao Đẳng -  25 tiết', 15, CAST(N'2016-02-19' AS Date), CAST(N'2016-02-19' AS Date), 0, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (12, 79769, 30, 13, N'Toán Chuyên Đề - Đại Học - 30 tiết', 15, CAST(N'2016-04-01' AS Date), CAST(N'2016-12-30' AS Date), 1, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (13, 5346346, 45, 14, N'Toán Chuyên Đề - Đại Học - 45 tiết', 12, CAST(N'2016-04-01' AS Date), CAST(N'2016-12-30' AS Date), 1, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (14, 4588658, 45, 15, N'Toán Chuyên Đề - Đại Học - 45 tiết', 15, CAST(N'2016-04-07' AS Date), CAST(N'2016-12-30' AS Date), 1, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (15, 57457, 45, 16, N'Toán Chuyên Đề - Đại Học - 45 tiết', 15, CAST(N'2016-04-07' AS Date), CAST(N'2016-12-30' AS Date), 1, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (16, 47457, 45, 17, N'Toán Chuyên Đề - Cao Đẳng - 45 tiết', 15, CAST(N'2016-04-01' AS Date), CAST(N'2016-12-30' AS Date), 1, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (20, 756799, 45, 5, NULL, 15, CAST(N'2016-05-06' AS Date), CAST(N'2016-08-31' AS Date), 1, 11150575, 39)
INSERT [dbo].[LopMonHoc] ([IdLopMonHoc], [MaLopMonHoc], [SoTiet], [IdMonHocHeDaoTao], [TenLopMonHoc], [SoBuoiDiemDanh], [ThoiGianBatDau], [ThoiGianKetThuc], [CongKhai], [IdNguoiDung], [IdDeCuongBaiGiang]) VALUES (21, 41412488, 45, 4, NULL, 15, CAST(N'2016-05-06' AS Date), CAST(N'2016-08-31' AS Date), 1, 11150575, 40)
SET IDENTITY_INSERT [dbo].[LopMonHoc] OFF
SET IDENTITY_INSERT [dbo].[MonHoc] ON 

INSERT [dbo].[MonHoc] ([IdMonHoc], [TenMonHoc]) VALUES (1, N'Toán Chuyên Đề')
INSERT [dbo].[MonHoc] ([IdMonHoc], [TenMonHoc]) VALUES (2, N'Kỹ Thuật Lập Trình')
INSERT [dbo].[MonHoc] ([IdMonHoc], [TenMonHoc]) VALUES (3, N'Giao Diện Người Máy')
INSERT [dbo].[MonHoc] ([IdMonHoc], [TenMonHoc]) VALUES (4, N'Lập trình web')
INSERT [dbo].[MonHoc] ([IdMonHoc], [TenMonHoc]) VALUES (5, N'Kỹ Thuật Lập Trình')
SET IDENTITY_INSERT [dbo].[MonHoc] OFF
SET IDENTITY_INSERT [dbo].[MonHoc-HeDaoTao] ON 

INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (1, 1, 1, N'Toán Chuyên Đề - Đại Học', 15, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (2, 1, 2, N'Toán Chuyên Đề - Cao Đẳng', 11, 20)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (3, 2, 1, N'Kỹ Thuật Lập Trình - Đại Học', 15, 21)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (4, 2, 2, N'Kỹ Thuật Lập Trình - Cao Đẳng', 21, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (5, 3, 1, N'Giao Diện Người Máy - Đại Học', 21, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (6, 3, 2, N'Giao Diện Người Máy - Cao Đẳng', 20, 15)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (7, 4, 1, N'Lập trình web - Đại Học', 11, 20)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (8, 5, 3, N'Kỹ Thuật Lập Trình - Cao Đẳng', 21, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (9, 3, 1, N'Giao Diện Người Máy - Đại Học', 21, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (10, 2, 2, N'Kỹ Thuật Lập Trình - Cao Đẳng', 21, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (11, 2, 1, N'Kỹ Thuật Lập Trình - Đại Học', 15, 21)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (12, 3, 2, N'Giao Diện Người Máy - Cao Đẳng', 20, 15)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (13, 1, 1, N'Toán Chuyên Đề - Đại Học', 15, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (14, 1, 1, N'Toán Chuyên Đề - Đại Học', 15, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (15, 1, 1, N'Toán Chuyên Đề - Đại Học', 15, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (16, 1, 1, N'Toán Chuyên Đề - Đại Học', 15, 11)
INSERT [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao], [IdMonHoc], [IdHeDaoTao], [TenMonHocHeDaoTao], [IdDeCuongMonHoc], [IdDeCuongChiTiet]) VALUES (17, 1, 2, N'Toán Chuyên Đề - Cao Đẳng', 11, 20)
SET IDENTITY_INSERT [dbo].[MonHoc-HeDaoTao] OFF
SET IDENTITY_INSERT [dbo].[NguoiDung] ON 

INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (1, N'/uploads/NguoiDungImage/1.jpg', N'Trần Thanh Bình', CAST(N'1982-10-22' AS Date), N'Quảng Bình', CAST(N'1992-10-22' AS Date), 2, N'10150575', N'123', 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150571, N'/uploads/NguoiDungImage/7.jpg', N'Hà Dương', CAST(N'1992-10-22' AS Date), N'Hà Nội', CAST(N'2015-10-23' AS Date), 1, N'10150573', N'123', 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150573, N'/uploads/NguoiDungImage/3.jpg', N'Nguyễn Quảng Bình', CAST(N'1991-12-23' AS Date), N'Hà Tây', CAST(N'2014-10-30' AS Date), 1, N'10150478', N'123', 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150575, N'/uploads/NguoiDungImage/4.jpg', N'Nguyễn Hà Tĩnh', CAST(N'1994-05-05' AS Date), N'Hà Đông', CAST(N'2013-10-04' AS Date), 1, N'10150571', N'123', 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150576, N'/uploads/NguoiDungImage/5.jpg', N'Trần Bình Trọng', CAST(N'1994-10-12' AS Date), N'Quảng Bình', CAST(N'2014-06-09' AS Date), 1, N'10150476', N'123', 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150579, N'/uploads/NguoiDungImage/6.jpg', N'Nguyễn Tử Quảng', CAST(N'1970-08-09' AS Date), N'Hồ Chí Minh', CAST(N'2010-10-11' AS Date), 2, N'10150451', N'123', 1, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150580, N'/uploads/NguoiDungImage/sv2.jpg', N'Hoàng Thị Anh', CAST(N'1989-09-08' AS Date), N'Lý Sơn', CAST(N'2010-10-22' AS Date), 1, N'10150452', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150581, N'/uploads/NguoiDungImage/sv1.jpg', N'Nguyễn Phúc Tân', CAST(N'1999-09-10' AS Date), N'Hà Nội', CAST(N'2010-10-22' AS Date), 1, N'10150453', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150582, N'/uploads/NguoiDungImage/sv3.jpg', N'Hoàng Thị Ngọc', CAST(N'1989-11-10' AS Date), N'Hà Đông', CAST(N'2011-10-10' AS Date), 1, N'10150454', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150583, N'/uploads/NguoiDungImage/sv4.jpg', N'Hoàng Văn Công', CAST(N'1998-10-22' AS Date), N'Hà Giang', CAST(N'2011-10-10' AS Date), 1, N'10150455', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150584, N'/uploads/NguoiDungImage/sv5.jpg', N'Tăng Thành Đạt', CAST(N'1997-10-20' AS Date), N'Hà Giang', CAST(N'2011-10-10' AS Date), 1, N'10150456', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150585, N'/uploads/NguoiDungImage/sv6.jpg', N'Phạm Hồng Nhật', CAST(N'1998-10-22' AS Date), N'Hà Đông', CAST(N'2011-10-10' AS Date), 1, N'10150457', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150586, N'/uploads/NguoiDungImage/sv7.jpg', N'Ngô Văn Duy', CAST(N'1997-10-20' AS Date), N'Hà Đông', CAST(N'2011-10-10' AS Date), 1, N'10150458', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150587, N'/uploads/NguoiDungImage/sv8.jpg', N'Nguyễn Sỹ Tuấn', CAST(N'1998-10-22' AS Date), N'Hà Giang', CAST(N'2011-10-10' AS Date), 1, N'10150459', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150588, N'/uploads/NguoiDungImage/sv9.jpg', N'Lương Xuân Phú', CAST(N'1989-11-10' AS Date), N'Hà Giang', CAST(N'2011-10-10' AS Date), 1, N'10150460', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150589, N'/uploads/NguoiDungImage/sv10.jpg', N'Trương Tiến Phúc', CAST(N'1997-10-20' AS Date), N'Hà Đông', CAST(N'2011-10-10' AS Date), 1, N'10150461', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150590, N'/uploads/NguoiDungImage/sv11.jpg', N'Đặng Thu Ly', CAST(N'1998-10-22' AS Date), N'Hà Đông', CAST(N'2011-10-10' AS Date), 1, N'10150462', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150591, N'/uploads/NguoiDungImage/sv12.jpg', N'Phạm Hải Đăng', CAST(N'1989-11-10' AS Date), N'Hà Giang', CAST(N'2011-10-10' AS Date), 1, N'10150463', N'123', 2, NULL, NULL)
INSERT [dbo].[NguoiDung] ([IdNguoiDung], [DuongDanAnh], [HoTen], [NgaySinh], [QueQuan], [NgayTaoTaiKhoan], [IdDonViQuanLy], [UserName], [Password], [IdLoaiNguoiDung], [HocHam], [HocVi]) VALUES (11150640, N'/uploads/NguoiDungImage/sv13.jpg', N'Nguyên Mạnh Cường', CAST(N'1989-10-20' AS Date), N'Hà Nội', CAST(N'2011-10-10' AS Date), 1, N'10150464', N'123', 2, NULL, NULL)
SET IDENTITY_INSERT [dbo].[NguoiDung] OFF
SET IDENTITY_INSERT [dbo].[TaiLieu] ON 

INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (11, N'Đề Cương', N'Đề Cương.docx', N'.doc', N'3123155', 1, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (15, N'Đề Cương chi tiết', N'Đề Cương chi tiết.docx', N'.docx', N'123', 1, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (20, N'Báo Cáo', N'Báo Cáo.docx', N'.docx', N'123', 11150571, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (21, N'Nhập Môn Công Nghệ Phần Mềm', N'Nhập Môn Công Nghệ Phần Mềm.docx', N'.docx', N'12', 1, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (22, N'Bài Tâp Mẫu', N'Bài Tâp Mẫu.docx', N'.docx', N'3079851', 11150571, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (23, N'Bài Tập', N'Bài Tập.docx', N'.docx', N'839396', 11150575, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (24, N'Báo Cáo Phần 1', N'Báo Cáo Phần 1.docx', N'.docx', N'123', 11150575, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (34, N'Báo Cáo Phần 2', N'Báo Cáo Phần 2.docx', N'.docx', N'0', 11150575, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (35, N'Báo Cáo Tốt Nghiệp ', N'Báo Cáo Tốt Nghiệp v1.docx', N'.docx', N'0', 11150575, 2)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (37, N'Giải Bài Tập', N'Giải Bài Tập.xlsx', N'.xlsx', N'5770', 11150575, 1)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (39, N'Đề Cương Bài Giảng v1', N'Đề Cương Bài Giảng v1.docx', N'.docx', N'0', 11150575, 2)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (40, N'Đề Cương Bài Giảng v2', N'Đề Cương Bài Giảng v2.docx', N'.docx', N'11292', 11150575, 2)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (41, N'Bài Làm 1', N'Bài Làm 1.docx', N'.docx', N'12', 11150580, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (42, N'Bài Làm 2', N'Bài Làm 2.docx', N'.docx', N'12', 11150580, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (43, N'Bài Làm 3', N'Bài Làm 3.docx', N'.docx', N'12', 11150581, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (44, N'Bài Làm 4', N'Bài Làm 4.docx', N'.docx', N'12', 11150581, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (45, N'Bài Làm 5', N'Bài Làm 5.docx', N'.docx', N'12', 11150582, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (46, N'Bài Làm 6', N'Bài Làm 6.docx', N'.docx', N'12', 11150582, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (47, N'Bài Làm 7', N'Bài Làm 7.docx', N'.docx', N'12', 11150583, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (48, N'Bài Làm 8', N'Bài Làm 8.docx', N'.docx', N'12', 11150583, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (49, N'Bài Làm 9', N'Bài Làm 9.docx', N'.docx', N'12', 11150584, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (50, N'Bài Làm 10', N'Bài Làm 10.docx', N'.docx', N'12', 11150584, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (51, N'Bài Làm 11', N'Bài Làm 11.docx', N'.docx', N'12', 11150585, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (52, N'Bài Làm 12', N'Bài Làm 12.docx', N'.docx', N'12', 11150585, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (53, N'Bài Làm 13', N'Bài Làm 13.docx', N'.docx', N'12', 11150586, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (54, N'Bài Làm 14', N'Bài Làm 14.docx', N'.docx', N'13', 11150586, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (55, N'Bài Làm 15', N'Bài Làm 15.docx', N'.docx', N'13', 11150587, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (56, N'Bài Làm 16', N'Bài Làm 16.docx', N'.docx', N'13', 11150587, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (57, N'Bài Làm 17', N'Bài Làm 17.docx', N'.docx', N'13', 11150588, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (58, N'Bài Làm 18', N'Bài Làm 18.docx', N'.docx', N'13', 11150588, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (59, N'Bài Làm 19', N'Bài Làm 19.docx', N'.docx', N'13', 11150589, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (60, N'Bài Làm 20', N'Bài Làm 20.docx', N'.docx', N'13', 11150589, 6)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (61, N'Đề Bài Tập', N'Đề Bài Tập.xlsx', N'xlsx', N'45', 11150571, 5)
INSERT [dbo].[TaiLieu] ([IdTaiLieu], [TenTaiLieu], [DuongDan], [DinhDang], [DungLuong], [IdNguoiDung], [IdLoaiTaiLieu]) VALUES (63, N'Bài Tập Giữa Kỳ', N'Bài Tập Giữa Kỳ.docx', N'.docx', N'11287', 11150575, 5)
SET IDENTITY_INSERT [dbo].[TaiLieu] OFF
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 1, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 2, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 3, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 10, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 11, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 12, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 13, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 14, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 15, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 16, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 20, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (11, 21, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 1, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 2, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 10, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 12, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 13, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 14, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 15, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (15, 21, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (20, 10, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (20, 16, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (21, 14, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (23, 16, NULL)
INSERT [dbo].[TaiLieu-LopMonHoc] ([IdTaiLieu], [IdLopMonHoc], [GhiChu]) VALUES (24, 13, NULL)
SET IDENTITY_INSERT [dbo].[TinhTrangDiHoc] ON 

INSERT [dbo].[TinhTrangDiHoc] ([IdTinhTrangDiHoc], [NoiDung], [KyHieu]) VALUES (1, N'Đi Học', N'')
INSERT [dbo].[TinhTrangDiHoc] ([IdTinhTrangDiHoc], [NoiDung], [KyHieu]) VALUES (2, N'Nghỉ Không Phép', N'0')
INSERT [dbo].[TinhTrangDiHoc] ([IdTinhTrangDiHoc], [NoiDung], [KyHieu]) VALUES (3, N'Nghỉ Có Phép', N'0p')
INSERT [dbo].[TinhTrangDiHoc] ([IdTinhTrangDiHoc], [NoiDung], [KyHieu]) VALUES (4, N'Đi Muộn', N'm')
INSERT [dbo].[TinhTrangDiHoc] ([IdTinhTrangDiHoc], [NoiDung], [KyHieu]) VALUES (5, N'Về Sớm', N's')
SET IDENTITY_INSERT [dbo].[TinhTrangDiHoc] OFF
SET IDENTITY_INSERT [dbo].[YeuCauThamGia] ON 

INSERT [dbo].[YeuCauThamGia] ([IdYeuCauThamGia], [IdNguoiDung], [IdLopMonHoc], [NgayYeuCau]) VALUES (25, 11150584, 13, CAST(N'2016-05-01 00:00:00.000' AS DateTime))
INSERT [dbo].[YeuCauThamGia] ([IdYeuCauThamGia], [IdNguoiDung], [IdLopMonHoc], [NgayYeuCau]) VALUES (26, 11150585, 13, CAST(N'2016-05-01 00:00:00.000' AS DateTime))
INSERT [dbo].[YeuCauThamGia] ([IdYeuCauThamGia], [IdNguoiDung], [IdLopMonHoc], [NgayYeuCau]) VALUES (29, 11150582, 13, CAST(N'2016-05-01 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[YeuCauThamGia] OFF
ALTER TABLE [dbo].[BaiLam]  WITH CHECK ADD  CONSTRAINT [FK_BaiLam_BaiTap] FOREIGN KEY([IdBaiTap])
REFERENCES [dbo].[BaiTap] ([IdBaiTap])
GO
ALTER TABLE [dbo].[BaiLam] CHECK CONSTRAINT [FK_BaiLam_BaiTap]
GO
ALTER TABLE [dbo].[BaiLam]  WITH CHECK ADD  CONSTRAINT [FK_BaiLam_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[BaiLam] CHECK CONSTRAINT [FK_BaiLam_NguoiDung]
GO
ALTER TABLE [dbo].[BaiLam]  WITH CHECK ADD  CONSTRAINT [FK_BaiLam_TaiLieu] FOREIGN KEY([IdFileBaiLam])
REFERENCES [dbo].[TaiLieu] ([IdTaiLieu])
GO
ALTER TABLE [dbo].[BaiLam] CHECK CONSTRAINT [FK_BaiLam_TaiLieu]
GO
ALTER TABLE [dbo].[BaiTap]  WITH CHECK ADD  CONSTRAINT [FK_BaiTap_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[BaiTap] CHECK CONSTRAINT [FK_BaiTap_LopMonHoc]
GO
ALTER TABLE [dbo].[BaiTap]  WITH CHECK ADD  CONSTRAINT [FK_BaiTap_TaiLieu] FOREIGN KEY([IdDeBaiTap])
REFERENCES [dbo].[TaiLieu] ([IdTaiLieu])
GO
ALTER TABLE [dbo].[BaiTap] CHECK CONSTRAINT [FK_BaiTap_TaiLieu]
GO
ALTER TABLE [dbo].[BuoiHoc]  WITH CHECK ADD  CONSTRAINT [FK_BuoiHoc_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[BuoiHoc] CHECK CONSTRAINT [FK_BuoiHoc_LopMonHoc]
GO
ALTER TABLE [dbo].[ChuDeTraoDoi]  WITH CHECK ADD  CONSTRAINT [FK_ChuDeTraoDoi_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[ChuDeTraoDoi] CHECK CONSTRAINT [FK_ChuDeTraoDoi_LopMonHoc]
GO
ALTER TABLE [dbo].[DanhSach]  WITH CHECK ADD  CONSTRAINT [FK_DanhSach_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[DanhSach] CHECK CONSTRAINT [FK_DanhSach_LopMonHoc]
GO
ALTER TABLE [dbo].[DanhSach]  WITH CHECK ADD  CONSTRAINT [FK_DanhSach_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[DanhSach] CHECK CONSTRAINT [FK_DanhSach_NguoiDung]
GO
ALTER TABLE [dbo].[DiemDanh]  WITH CHECK ADD  CONSTRAINT [FK_DiemDanh_BuoiHoc] FOREIGN KEY([IdBuoiHoc])
REFERENCES [dbo].[BuoiHoc] ([IdBuoiHoc])
GO
ALTER TABLE [dbo].[DiemDanh] CHECK CONSTRAINT [FK_DiemDanh_BuoiHoc]
GO
ALTER TABLE [dbo].[DiemDanh]  WITH CHECK ADD  CONSTRAINT [FK_DiemDanh_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[DiemDanh] CHECK CONSTRAINT [FK_DiemDanh_NguoiDung]
GO
ALTER TABLE [dbo].[DiemDanh]  WITH CHECK ADD  CONSTRAINT [FK_DiemDanh_TinhTrangDiHoc] FOREIGN KEY([IdTinhTrangDiHoc])
REFERENCES [dbo].[TinhTrangDiHoc] ([IdTinhTrangDiHoc])
GO
ALTER TABLE [dbo].[DiemDanh] CHECK CONSTRAINT [FK_DiemDanh_TinhTrangDiHoc]
GO
ALTER TABLE [dbo].[LopMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopMonHoc_MonHoc-HeDaoTao] FOREIGN KEY([IdMonHocHeDaoTao])
REFERENCES [dbo].[MonHoc-HeDaoTao] ([IdMonHocHeDaoTao])
GO
ALTER TABLE [dbo].[LopMonHoc] CHECK CONSTRAINT [FK_LopMonHoc_MonHoc-HeDaoTao]
GO
ALTER TABLE [dbo].[LopMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopMonHoc_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[LopMonHoc] CHECK CONSTRAINT [FK_LopMonHoc_NguoiDung]
GO
ALTER TABLE [dbo].[LopMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_LopMonHoc_TaiLieu] FOREIGN KEY([IdDeCuongBaiGiang])
REFERENCES [dbo].[TaiLieu] ([IdTaiLieu])
GO
ALTER TABLE [dbo].[LopMonHoc] CHECK CONSTRAINT [FK_LopMonHoc_TaiLieu]
GO
ALTER TABLE [dbo].[MonHoc-HeDaoTao]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc-HeDaoTao_HeDaoTao] FOREIGN KEY([IdHeDaoTao])
REFERENCES [dbo].[HeDaoTao] ([IdHeDaoTao])
GO
ALTER TABLE [dbo].[MonHoc-HeDaoTao] CHECK CONSTRAINT [FK_MonHoc-HeDaoTao_HeDaoTao]
GO
ALTER TABLE [dbo].[MonHoc-HeDaoTao]  WITH CHECK ADD  CONSTRAINT [FK_MonHoc-HeDaoTao_MonHoc] FOREIGN KEY([IdMonHoc])
REFERENCES [dbo].[MonHoc] ([IdMonHoc])
GO
ALTER TABLE [dbo].[MonHoc-HeDaoTao] CHECK CONSTRAINT [FK_MonHoc-HeDaoTao_MonHoc]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_DonViQuanLy] FOREIGN KEY([IdDonViQuanLy])
REFERENCES [dbo].[DonViQuanLy] ([IdDonViQuanLy])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_DonViQuanLy]
GO
ALTER TABLE [dbo].[NguoiDung]  WITH CHECK ADD  CONSTRAINT [FK_NguoiDung_LoaiNguoiDung] FOREIGN KEY([IdLoaiNguoiDung])
REFERENCES [dbo].[LoaiNguoiDung] ([IdLoaiNguoiDng])
GO
ALTER TABLE [dbo].[NguoiDung] CHECK CONSTRAINT [FK_NguoiDung_LoaiNguoiDung]
GO
ALTER TABLE [dbo].[TaiLieu]  WITH CHECK ADD  CONSTRAINT [FK_TaiLieu_LoaiTaiLieu] FOREIGN KEY([IdLoaiTaiLieu])
REFERENCES [dbo].[LoaiTaiLieu] ([IdLoaiTaiLieu])
GO
ALTER TABLE [dbo].[TaiLieu] CHECK CONSTRAINT [FK_TaiLieu_LoaiTaiLieu]
GO
ALTER TABLE [dbo].[TaiLieu]  WITH CHECK ADD  CONSTRAINT [FK_TaiLieu_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[TaiLieu] CHECK CONSTRAINT [FK_TaiLieu_NguoiDung]
GO
ALTER TABLE [dbo].[TaiLieu-LopMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_TaiLieu-LopMonHoc_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[TaiLieu-LopMonHoc] CHECK CONSTRAINT [FK_TaiLieu-LopMonHoc_LopMonHoc]
GO
ALTER TABLE [dbo].[TaiLieu-LopMonHoc]  WITH CHECK ADD  CONSTRAINT [FK_TaiLieu-LopMonHoc_TaiLieu] FOREIGN KEY([IdTaiLieu])
REFERENCES [dbo].[TaiLieu] ([IdTaiLieu])
GO
ALTER TABLE [dbo].[TaiLieu-LopMonHoc] CHECK CONSTRAINT [FK_TaiLieu-LopMonHoc_TaiLieu]
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [FK_ThongBao_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [FK_ThongBao_LopMonHoc]
GO
ALTER TABLE [dbo].[ThongBao]  WITH CHECK ADD  CONSTRAINT [FK_ThongBao_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[ThongBao] CHECK CONSTRAINT [FK_ThongBao_NguoiDung]
GO
ALTER TABLE [dbo].[TinhTrangDiHoc-BuoiNghi]  WITH CHECK ADD  CONSTRAINT [FK_TinhTrangDiHoc-BuoiNghi_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[TinhTrangDiHoc-BuoiNghi] CHECK CONSTRAINT [FK_TinhTrangDiHoc-BuoiNghi_LopMonHoc]
GO
ALTER TABLE [dbo].[TinhTrangDiHoc-BuoiNghi]  WITH CHECK ADD  CONSTRAINT [FK_TinhTrangDiHoc-BuoiNghi_TinhTrangDiHoc] FOREIGN KEY([IdTinhTrangDiHoc])
REFERENCES [dbo].[TinhTrangDiHoc] ([IdTinhTrangDiHoc])
GO
ALTER TABLE [dbo].[TinhTrangDiHoc-BuoiNghi] CHECK CONSTRAINT [FK_TinhTrangDiHoc-BuoiNghi_TinhTrangDiHoc]
GO
ALTER TABLE [dbo].[TraoDoi]  WITH CHECK ADD  CONSTRAINT [FK_TraoDoi_ChuDeTraoDoi] FOREIGN KEY([IdChuDe])
REFERENCES [dbo].[ChuDeTraoDoi] ([IdChuDe])
GO
ALTER TABLE [dbo].[TraoDoi] CHECK CONSTRAINT [FK_TraoDoi_ChuDeTraoDoi]
GO
ALTER TABLE [dbo].[TraoDoi]  WITH CHECK ADD  CONSTRAINT [FK_TraoDoi_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[TraoDoi] CHECK CONSTRAINT [FK_TraoDoi_NguoiDung]
GO
ALTER TABLE [dbo].[YeuCauThamGia]  WITH CHECK ADD  CONSTRAINT [FK_YeuCauThamGia_LopMonHoc] FOREIGN KEY([IdLopMonHoc])
REFERENCES [dbo].[LopMonHoc] ([IdLopMonHoc])
GO
ALTER TABLE [dbo].[YeuCauThamGia] CHECK CONSTRAINT [FK_YeuCauThamGia_LopMonHoc]
GO
ALTER TABLE [dbo].[YeuCauThamGia]  WITH CHECK ADD  CONSTRAINT [FK_YeuCauThamGia_NguoiDung] FOREIGN KEY([IdNguoiDung])
REFERENCES [dbo].[NguoiDung] ([IdNguoiDung])
GO
ALTER TABLE [dbo].[YeuCauThamGia] CHECK CONSTRAINT [FK_YeuCauThamGia_NguoiDung]
GO
