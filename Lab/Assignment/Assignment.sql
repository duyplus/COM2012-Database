-- Tạo schema
CREATE DATABASE asm_thuvien;
-- Sử dụng schema
USE asm_thuvien;

-- Tạo bản sinh viên
CREATE TABLE sinhvien(
	MaSV varchar(10) NOT NULL,
    TenSV varchar(50) NOT NULL,
    NgayHetHan date NOT NULL,
    ChuyenNganh varchar(50) NULL,
    Email varchar(50) NOT NULL,
    SDT varchar(13) NOT NULL,
    PRIMARY KEY(MaSV)
);
INSERT INTO sinhvien
VALUE("PS18293","Nguyễn Hoàng Duy","2022-09-18","CNTT","duynhps18293@fpt.edu.vn","0919993715"),
("PS19432","Nguyễn Đăng Hưng","2022-09-18","TĐH","hungnvps19432@fpt.edu.vn","0943247731"),
("PS34854","Trần Quốc Dũng","2021-04-12","TKĐH","dungnhps34854@fpt.edu.vn","0732524424"),
("PS12395","Thạch Nhật Tiến","2020-12-02","QTKD","tientnps12395@fpt.edu.vn","0832732442"),
("PS24712","Trần Thị Thuý Vân","2024-01-17","K-Beauty","vanntbps29765@fpt.edu.vn","0412738534"),
("PS18329","Nguyễn Xuân Đào","2022-09-18","QTKD","daonxps12395@fpt.edu.vn","0424231234"),
("PS63335","Trần Nam Kiệt","2020-12-02","TKĐH","kiettnps12395@fpt.edu.vn","0823823952"),
("PS91892","Ngô Minh Kiên","2021-04-12","DDT","kiennmps12395@fpt.edu.vn","0582313145"),
("PS30393","Trần Thị Mỹ Linh","2021-04-12","K-Beauty","linhttmps12395@fpt.edu.vn","0812838313"),
("PS12941","Đinh Văn Long","2022-09-18","TĐH","longdvps12395@fpt.edu.vn","0239934356");

-- Tạo bản loại sách
CREATE TABLE loaisach(
	MaLoai varchar(10) NOT NULL,
    TenLoai varchar(50) NOT NULL,
    PRIMARY KEY(MaLoai)
);
INSERT INTO loaisach
VALUE("KT","Kinh tế"),
("IT","Công nghệ thông tin"),
("DL","Du lịch"),
("VH","Văn học"),
("NN","Ngoại ngữ");

-- Tạo bảng sách
CREATE TABLE sach(
	MaSach varchar(10) NOT NULL,
    TenSach varchar(50) NOT NULL,
    NhaXuatBan varchar(50) NOT NULL,
    TacGia varchar(50),
    SoTrang int NOT NULL check (SoTrang > 5),
    SoLuongBS int NOT NULL check (SoLuongBS > 1),
    GiaTien float NOT NULL check (GiaTien > 0),
    NgayNhap date,
    ViTri varchar(50) NOT NULL,
    MaLoai varchar(50) NOT NULL,
    PRIMARY KEY(MaSach),
    FOREIGN KEY(MaLoai) REFERENCES loaisach(MaLoai)
);
INSERT INTO sach
VALUE("1A", "SQL", "FPT", "Bảo Ninh",156, 92, 150000, "2014-01-01", "a1", "KT"),
("2B", "Javascript", "TDT", "Stephen Hawking",756, 25, 210000, "2014-01-02", "b2", "VH"),
("3C", "Photoshop", "UEF", "Dương Thuỵ",456, 74, 470000, "2015-01-01", "c3", "IT"),
("4D", "HTML", "NTT", "Sơn Nam",656, 54, 220000, "2015-01-02", "d4", "DL"),
("5E", "English", "UPT", "J.K.Rowling",256, 78, 180000, "2015-01-03", "e5", "NN"),
("6F", "Javascript", "FPT", "Bảo Ninh",424, 63, 580000, "2014-01-03", "f6", "VH"),
("7H", "English", "UEF", "Sơn Nam",646, 24, 880000, "2013-01-01", "h7", "NN"),
("8I", "Photoshop", "FPT", "Dương Thuỵ",735, 16, 179000, "2013-01-02", "i8", "IT"),
("9U", "HTML", "TDT", "Stephen Hawking",811, 21, 275000, "2017-01-01", "u9", "DL"),
("Z10", "SQL", "NTT", "J.K.Rowling",429, 33, 654000, "2017-01-02", "z10", "KT");

-- Tạo bản phiếu mượn
CREATE TABLE phieumuon(
	MaPhieu varchar(10) NOT NULL,
    NgayMuon date,
    NgayTra date,
    TrangThai varchar(10) NOT NULL,
    MaSV varchar(10) NOT NULL,
    CONSTRAINT TenRB CHECK (NgayTra >= NgayMuon),
    PRIMARY KEY(MaPhieu),
    FOREIGN KEY(MaSV) REFERENCES sinhvien(MaSV)
);
INSERT INTO phieumuon
VALUE("D1","2017-05-04","2017-05-11","Chưa trả","PS18293"),
("H1","2017-07-12","2017-07-19","Chưa trả","PS19432"),
("D2","2017-03-25","2017-04-02","Đã trả","PS34854"),
("T1","2017-11-08","2017-11-15","Chưa trả","PS12395"),
("V1","2017-01-18","2017-01-25","Đã trả","PS24712"),
("D3","2017-04-10","2017-04-17","Đã trả","PS18329"),
("K1","2017-06-22","2017-06-29","Chưa trả","PS63335"),
("L1","2017-10-01","2017-10-07","Chưa trả","PS91892"),
("K2","2017-01-11","2017-01-18","Đã trả","PS30393"),
("L2","2017-05-05","2017-05-12","Chưa trả","PS12941");

-- Tạo bản chi tiết phiếu mượn
CREATE TABLE chitietpm(
	MaPhieu varchar(10) NOT NULL,
    MaSach varchar(10) NOT NULL,
    GhiChu varchar(255) NOT NULL,
    PRIMARY KEY(MaPhieu, MaSach),
    FOREIGN KEY(MaPhieu) REFERENCES phieumuon(MaPhieu),
    FOREIGN KEY(MaSach) REFERENCES sach(MaSach)
);
INSERT INTO chitietpm
VALUE("D1","1A","Chưa trả sách"),
("H1","2B","Đã trả sách"),
("D2","3C","Đã trả sách"),
("T1","4D","Chưa trả sách"),
("V1","5E","Chưa trả sách"),
("D3","1A","Đã trả sách"),
("L1","4D","Chưa trả sách"),
("L2","2B","Đã trả sách"),
("K1","4D","Chưa trả sách"),
("K2","3C","Đã trả sách");

-- 6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền, tác giả thuộc loại sách có mã "IT".
SELECT MaSach,TenSach,GiaTien,TacGia FROM sach
WHERE MaLoai = "IT";
-- 6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách, ngày mượn, mã sinh viên có ngày mượn trong tháng 01/2020.
SELECT ctpm.MaPhieu, MaSach, NgayMuon, MaSV FROM phieumuon pm
JOIN chitietpm ctpm ON pm.MaPhieu = ctpm.MaPhieu
WHERE MONTH(NgayMuon) = 1 and YEAR(NgayMuon) = 2017;
-- 6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày mượn sách.
SELECT pm.NgayMuon,ctpm.GhiChu FROM chitietpm ctpm
JOIN phieumuon pm ON pm.MaPhieu = ctpm.MaPhieu
WHERE ctpm.GhiChu LIKE "Chưa trả sách"
ORDER BY pm.NgayMuon ASC;
-- 6.4 Liệt kê tổng số đầu sách của mỗi loại sách (gồm mã loại sách, tên loại sách, tổng số lượng sách mỗi loại).
SELECT ls.MaLoai, TenLoai, COUNT(MaSach) AS SoSach FROM sach
JOIN loaisach ls ON sach.MaLoai = ls.MaLoai
GROUP BY ls.MaLoai, TenLoai;
-- 6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
SELECT COUNT(MaSV) AS SoSVMuonSach FROM phieumuon
WHERE MaSV IN (SELECT MaSV FROM sinhvien);
-- 6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá "SQL".
SELECT MaSach,TenSach FROM sach
WHERE TenSach LIKE "SQL";
-- 6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.
SELECT pm.MaSV,TenSV,ctpm.MaPhieu,TenSach,NgayMuon,NgayTra FROM sinhvien sv
JOIN phieumuon pm ON sv.MaSV = pm.MaSV
JOIN chitietpm ctpm ON pm.MaPhieu = ctpm.MaPhieu
JOIN sach ON ctpm.MaSach = sach.MaSach
ORDER BY NgayMuon;
-- 6.8 Liệt kê các đầu sách có lượt mượn lớn hơn "2" lần.
SELECT MaSach, COUNT(MaSach) AS SLSach FROM chitietpm
GROUP BY MaSach
HAVING COUNT(MaSach) > 2;
-- 6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm "2014" giảm 30%.
UPDATE sach
SET GiaTien = GiaTien - (GiaTien*0.3)
WHERE YEAR(NgayNhap) < "2014";
-- 6.10 Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã sinh viên PS18293 (ví dụ).
UPDATE phieumuon
SET TrangThai = "Đã trả"
WHERE MaSV = "PS18293";
-- 6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn, tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.
SELECT ctpm.MaPhieu,sv.TenSV,sv.Email,sach.TenSach,pm.NgayMuon FROM chitietpm ctpm
JOIN phieumuon pm ON ctpm.MaPhieu = pm.MaPhieu
JOIN sach ON ctpm.MaSach = SACH.MaSach
JOIN sinhvien sv ON pm.maSV = sv.maSV
WHERE ctpm.GhiChu = "Chưa trả sách";
-- 6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên "5" đơn vị đối với các đầu sách có lượt mượn lớn hơn "2"
UPDATE sach
SET SoLuongBS = SoLuongBS + 5
WHERE MaSach IN (SELECT MaSach FROM chitietpm GROUP BY MaSach HAVING COUNT(MaSach) > 2);
-- 6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước "1/1/2017"
DELETE FROM phieumuon
WHERE year(NgayMuon) < "2017"
AND month(NgayMuon) < "01"
AND day(NgayMuon) < "01";