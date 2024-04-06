--tao bang 
CREATE TABLE Khoa (
    MaKhoa VARCHAR(255),
    TenKhoa VARCHAR(255),
    PRIMARY KEY (MaKhoa)
);

CREATE TABLE BoMon (
    MaBoMon VARCHAR(255),
    TenBoMon VARCHAR(255),
    MaKhoa VARCHAR(255),
    PRIMARY KEY (MaBoMon),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa),
);

CREATE TABLE NganhHoc (
    MaNganh VARCHAR(255),
    TenNganh VARCHAR(255),
	MaBoMon VARCHAR(255),
    PRIMARY KEY (MaNganh),
	FOREIGN KEY (MaBoMon) REFERENCES BoMon(MaBoMon)
);

CREATE TABLE MonHoc (
    MaMon VARCHAR(255),
    TenMon VARCHAR(255),
    MaNganh VARCHAR(255),
    SoTinChi INT,
    PRIMARY KEY (MaMon),
    FOREIGN KEY (MaNganh) REFERENCES NganhHoc(MaNganh)
);

CREATE TABLE SinhVien (
    MaSinhVien VARCHAR(255),
    HoTen VARCHAR(255),
    NamNhapHoc INT,
    PRIMARY KEY (MaSinhVien),
);

CREATE TABLE SinhVienNganhHoc (
    MaSinhVien VARCHAR(255),
    MaNganh VARCHAR(255),
    NgayDangKy DATE,
    PRIMARY KEY (MaSinhVien, MaNganh),
    FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien),
    FOREIGN KEY (MaNganh) REFERENCES NganhHoc(MaNganh)
);

CREATE TABLE SinhVienMonHoc (
    MaSinhVien VARCHAR(255),
    MaMon VARCHAR(255),
    MaBoMon VARCHAR(255),
    ĐiemChuyenCan DECIMAL(5,2),
    ĐiemGiuaKy DECIMAL(5,2),
    ĐiemCuoiKy DECIMAL(5,2),
    PRIMARY KEY (MaSinhVien, Mamon),
    FOREIGN KEY (MaSinhVien) REFERENCES SinhVien(MaSinhVien),
    FOREIGN KEY (MaMon) REFERENCES MonHoc(MaMon),
);

--them du lieu 
INSERT INTO Khoa (MaKhoa, TenKhoa) VALUES
('K001', 'Khoa Kỹ thuật'),
('K002', 'Khoa Khoa học Xã hội'),
('K003', 'Khoa Y Dược');
INSERT INTO BoMon (MaBoMon, TenBoMon, MaKhoa) VALUES
('BM001', 'Bộ môn Kỹ thuật phần mềm', 'K001'),
('BM002', 'Bộ môn Toán học', 'K001'),
('BM003', 'Bộ môn Lịch sử', 'K002');
INSERT INTO NganhHoc (MaNganh, TenNganh, MaBoMon) VALUES
('NH001', 'Công nghệ thông tin', 'BM001'),
('NH002', 'Toán ứng dụng', 'BM002'),
('NH003', 'Lịch sử Việt Nam', 'BM003');
INSERT INTO MonHoc (MaMon, TenMon, MaNganh, SoTinChi) VALUES
('MH001', 'Lập trình Java', 'NH001', 3),
('MH002', 'Toán cao cấp', 'NH002', 4),
('MH003', 'Lịch sử Đông Nam Á', 'NH003', 3);
INSERT INTO SinhVien (MaSinhVien, HoTen, NamNhapHoc) VALUES
('SV001', 'Nguyễn Văn A', 2020),
('SV002', 'Trần Thị B', 2019),
('SV003', 'Lê Minh C', 2021);
INSERT INTO SinhVienNganhHoc (MaSinhVien, MaNganh, NgayDangKy) VALUES
('SV001', 'NH001', '2023-02-15'),
('SV002', 'NH002', '2022-12-10'),
('SV003', 'NH003', '2024-01-20');
INSERT INTO SinhVienMonHoc (MaSinhVien, MaMon, MaBoMon, ĐiemChuyenCan, ĐiemGiuaKy, ĐiemCuoiKy) VALUES
('SV001', 'MH001', 'BM001', 8.5, 7.2, 8.0),
('SV002', 'MH002', 'BM002', 9.0, 8.5, 7.8),
('SV003', 'MH003', 'BM003', 7.8, 6.9, 8.2);
