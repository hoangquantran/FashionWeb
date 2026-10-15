
USE master;
GO

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'QuanLyBanHangThoiTrang')
BEGIN
    ALTER DATABASE QuanLyBanHangThoiTrang SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE QuanLyBanHangThoiTrang;
END
GO

CREATE DATABASE QuanLyBanHangThoiTrang;
GO

USE QuanLyBanHangThoiTrang;
GO

-- 4. Bảng Quản lý Người dùng (Khách hàng & Quản trị viên)
CREATE TABLE NguoiDung (
    MaNguoiDung INT IDENTITY(1,1) PRIMARY KEY,
    HoTen NVARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    MatKhau VARCHAR(255) NOT NULL,
    SoDienThoai VARCHAR(15),
    DiaChi NVARCHAR(255),
    VaiTro INT DEFAULT 0, -- 0: Khách hàng, 1: Quản trị viên
    NgayTao DATETIME DEFAULT GETDATE()
);

-- 5. Bảng Danh mục sản phẩm thời trang
CREATE TABLE DanhMuc (
    MaDanhMuc INT IDENTITY(1,1) PRIMARY KEY,
    TenDanhMuc NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(MAX)
);

-- 6. Bảng Sản phẩm thời trang
CREATE TABLE SanPham (
    MaSanPham INT IDENTITY(1,1) PRIMARY KEY,
    MaDanhMuc INT FOREIGN KEY REFERENCES DanhMuc(MaDanhMuc),
    TenSanPham NVARCHAR(200) NOT NULL,
    Gia DECIMAL(18,2) NOT NULL,
    SoLuongTon INT DEFAULT 0,
    HinhAnh VARCHAR(255),
    MoTa NVARCHAR(MAX),
    NgayTao DATETIME DEFAULT GETDATE()
);

-- 7. Bảng Biến thể sản phẩm (Quản lý Kích thước và Màu sắc)
CREATE TABLE BienTheSanPham (
    MaBienThe INT IDENTITY(1,1) PRIMARY KEY,
    MaSanPham INT FOREIGN KEY REFERENCES SanPham(MaSanPham) ON DELETE CASCADE,
    KichThuoC VARCHAR(10) NOT NULL, -- Ví dụ: S, M, L, XL
    MauSac NVARCHAR(50) NOT NULL, -- Ví dụ: Đen, Trắng
    SoLuong INT DEFAULT 0
);

-- 8. Bảng Quản lý Đơn hàng
CREATE TABLE DonHang (
    MaDonHang INT IDENTITY(1,1) PRIMARY KEY,
    MaNguoiDung INT FOREIGN KEY REFERENCES NguoiDung(MaNguoiDung),
    NgayDatHang DATETIME DEFAULT GETDATE(),
    TongTien DECIMAL(18,2) NOT NULL,
    TrangThai NVARCHAR(50) DEFAULT N'Chờ xác nhận',
    DiaChiGiaoHang NVARCHAR(255) NOT NULL,
    SoDienThoai VARCHAR(15) NOT NULL
);

-- 9. Bảng Chi tiết đơn hàng
CREATE TABLE ChiTietDonHang (
    MaChiTiet INT IDENTITY(1,1) PRIMARY KEY,
    MaDonHang INT FOREIGN KEY REFERENCES DonHang(MaDonHang) ON DELETE CASCADE,
    MaSanPham INT FOREIGN KEY REFERENCES SanPham(MaSanPham),
    MaBienThe INT FOREIGN KEY REFERENCES BienTheSanPham(MaBienThe),
    SoLuong INT NOT NULL,
    Gia DECIMAL(18,2) NOT NULL
);