USE QuanLyBanHangThoiTrang;
GO
 
IF NOT EXISTS (SELECT * FROM sys.columns WHERE object_id = OBJECT_ID('SanPham') AND name = 'HinhAnh')
BEGIN
    ALTER TABLE SanPham ADD HinhAnh VARCHAR(255);
END
GO

UPDATE SanPham SET HinhAnh = ' áo_sơ_mi.jpg' WHERE TenSanPham LIKE N'%Sơ Mi%';
UPDATE SanPham SET HinhAnh = 'ao_polo.jpg' WHERE TenSanPham LIKE N'%Polo%';
UPDATE SanPham SET HinhAnh = 'quan_jean.jpg' WHERE TenSanPham LIKE N'%Jean%';
UPDATE SanPham SET HinhAnh = 'ao_bomber.jpg' WHERE TenSanPham LIKE N'%Bomber%';
GO