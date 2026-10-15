USE QuanLyBanHangThoiTrang;
GO

DELETE FROM SanPham;
GO
INSERT INTO SanPham (MaDanhMuc, TenSanPham, Gia, HinhAnh) VALUES 
(1, N'Áo Sơ Mi Nam Công Sở Cao Cấp', 2900000, 'aosomi.png'),
(1, N'Áo Thun Polo Cotton Nam', 1900000, 'POLO.jpg'),
(1, N'Áo Khoác Varsity Nam form boxy', 42000000, 'varsity.jpg'),
(1, N'Áo Over coat nam', 150000000, 'OIP.jpg'),
(1, N'Áo Thời Trang Cao Cấp LV Edition', 550000000, 'LV.jpg'),
(2, N'Quần Jean Nam Slimfit Xanh Nhạt', 3800000, 'jean.jpg'),
(2, N'Quần Tây Nam Âu Công Sở Lịch Lãm', 3200000, 'au.jpg'),
(2, N'Quần Short Nam ', 1800000, 'short.jpg'),
(2, N'Quần Bò Nam Dáng Loe Style', 360000, 'loe.jpg');
GO

