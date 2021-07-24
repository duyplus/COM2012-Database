create database mssv;
create table mssv.khachhang(
	MaKH varchar(10) not null,
    HoVaTenLot varchar(50) ,
    Ten varchar(50) not null,
    DiaChi varchar(255),
    Email varchar(50),
    DienThoai varchar(20) not null,
    primary key (MaKH)
);
create table mssv.nhanvien(
	MaNV varchar(10) not null,
    HoVaTenLot varchar(50) ,
    Ten varchar(50) not null,
    DiaChi varchar(255),
    Email varchar(50),
    DienThoai varchar(20) not null,
    primary key (MaNV)
);
create table mssv.sanpham(
	MaSP varchar(10) not null,
    TenSP varchar(50) ,
    GiaSP float not null,
    SoLuong int not null,
    MoTa varchar(255) not null,
    primary key (MaSP)
);
create table mssv.hoadon(
	MaHD varchar(10) not null,
    NgayLapHD date not null,
    TongTien float not null,
    TrangThai varchar(20) not null,
    MaNV varchar(10) not null,
    MaKH varchar(10) not null,
    primary key (MaHD)
);
create table mssv.HoaDonChiTiet(
	MaHD varchar(10) not null,
    MaSP varchar(10) not null,
    SoLuongMua int not null,
    primary key (MaHD, MaSP)
);

alter table mssv.hoadon
add constraint FK_HD1 foreign key (MaNV) references mssv.nhanvien(MaNV),
add constraint FK_HD2 foreign key (MaKH) references mssv.khachhang(MaKH);

alter table mssv.HoaDonChiTiet
add constraint FK_HDCT1 foreign key (MaHD) references mssv.hoadon(MaHD),
add constraint FK_HDCT2 foreign key (MaSP) references mssv.sanpham(MaSP);


insert into mssv.khachhang values 
('KH001', 'Trần Trọng', 'Trí', 'Gò Vấp', '', '0983456654'),
('KH002', 'Đàm Vĩnh', 'Hưng', 'Quận 3', '', '0988123567'),
('KH003', 'Châu Đăng', 'Khoa', 'Quận 1', '', '0977874300'),
('KH004', 'Phạm', 'Hương', 'Quận 2', '', '0903090932'),
('KH005', 'Trường', 'Giang', 'Bình Thạnh', '', '0933411154'),
('KH006', 'Hoài', 'Linh', 'Phú Nhuận', '', '0888012381'),
('KH007', 'Mỹ', 'Tâm', 'Quận 1', '', '0977456654'),
('KH008', 'Ưng Hoàng', 'Phúc', 'Quận 5', '', '091950064'),
('KH009', 'Châu Tinh', 'Trì', 'Quận 1', '', '0888456098'),
('KH010', 'Thành', 'Long', 'Quận 2', '', '0903090908'),
('KH011', 'Lý Liên', 'Kiệt', 'Tân Bình', '', '0933410054'),
('KH012', 'Châu Khải', 'Phong', 'Quận 1', '', '0888022411'),
('KH013', 'Vân Quang', 'Long', 'Quận 12', '', '0983456633'),
('KH014', 'Châu Việt', 'Cường', 'Quận 8', '', '0988903664'),
('KH015', 'Ngọc', 'Sơn', 'Quận 10', '', '0977766098'),
('KH016', 'Nguyễn Phi', 'Hùng', 'Quận 12', '', '0903098032'),
('KH017', 'Trịnh Thăng', 'Bình', 'Bình Thạnh', '', '0933477754'),
('KH018', 'Sơn', 'Tùng M-TP', 'Tân Phú', '', '0888029999'),
('KH019', 'Ngô Thanh', 'Vân', 'Tân Bình', '', '0983456890'),
('KH020', 'Trương Quỳnh', 'Anh', 'Quận 3', '', '0888053664'),
('KH021', 'Hoàng Thùy', 'Linh', 'Quận 1', '', '0977000098'),
('KH022', 'Tóc', 'Tiên', 'Quận 2', '', '0903090888'),
('KH023', 'Bích', 'Phương', 'Quận 1', '', '0933411010'),
('KH024', 'Thu', 'Minh', 'Quận 9', '', '0888022223');
insert into mssv.nhanvien values 
('NV001', 'Võ Đình', 'Hải', 'Gò Vấp', '', '0983769320'),
('NV002', 'Lý Minh', 'Khoa', 'Quận 3', '', '0933999100'),
('NV003', 'Vũ Phạm Minh', 'Châu', 'Quận 1', '', '0977333902'),
('NV004', 'Nguyễn Văn', 'Tuấn', 'Quận 2', '', '0903000021'),
('NV005', 'Lê Hoài', 'Bảo', 'Bình Thạnh', '', '0933488854'),
('NV006', 'Trần Duy Bảo', 'Long', 'Phú Nhuận', '', '0888022422');

insert into mssv.sanpham values 
('SP001', 'Samsung Galaxy Note 9', 20000000.0, 30, 'Hàng chính hãng'),
('SP002', 'IPHONE XS MAX', 30000000.0, 15, 'Hàng chính hãng'),
('SP003', 'IPHONE X', 20000000.0, 40, 'Hàng xách tay'),
('SP004', 'BPhone 3', 70000000.0, 300, 'Hàng chính hãng'),
('SP005', 'Oppo F9', 7000000.0, 50, 'Hàng chính hãng'),
('SP006', 'Samsung Galaxy S9 Plus', 18000000.0, 30, 'Hàng xách tay');

insert into mssv.hoadon values
('HD001', '2019-01-20', 20000000,'Đã thanh toán', 'NV004', 'KH003'),
('HD002', '2019-02-09', 27000000,'Chưa thanh toán', 'NV002', 'KH001'),
('HD003', '2019-01-22', 50000000,'Thanh toán qua thẻ', 'NV005', 'KH004'),
('HD004', '2019-02-03', 60000000,'Đã thanh toán', 'NV003', 'KH003'),
('HD005', '2019-01-29', 80000000,'Chưa thanh toán', 'NV003', 'KH005'),
('HD006', '2018-01-29', 30000000,'Chưa thanh toán', 'NV003', 'KH007'),
('HD007', '2018-01-29', 80000000,'Đã Thanh Toán', 'NV002', 'KH010'),
('HD008', '2018-01-29', 20000000,'Chưa thanh toán', 'NV003', 'KH001'),
('HD009', '2018-01-29', 10000000,'Đã Thanh Toán', 'NV003', 'KH006'),
('HD010', '2018-01-29', 10000000,'Chưa thanh toán', 'NV001', 'KH008'),
('HD011', '2018-01-29', 40000000,'Chưa thanh toán', 'NV002', 'KH009'),
('HD012', '2018-01-29', 50000000,'Đã Thanh Toán', 'NV005', 'KH002'),
('HD013', '2018-01-29', 20000000,'Đã thanh toán', 'NV001', 'KH003'),
('HD014', '2018-01-29', 30000000,'Đã thanh toán', 'NV003', 'KH011'),
('HD015', '2018-01-29', 70000000,'Đã thanh toán', 'NV002', 'KH015'),
('HD016', '2018-01-29', 80000000,'Chưa thanh toán', 'NV004', 'KH020'),
('HD017', '2018-01-29', 60000000,'Chưa thanh toán', 'NV004', 'KH021'),
('HD018', '2018-01-29', 90000000,'Chưa thanh toán', 'NV005', 'KH020'),
('HD019', '2018-01-29', 50000000,'Chưa thanh toán', 'NV001', 'KH003'),
('HD020', '2018-01-29', 40000000,'Chưa thanh toán', 'NV002', 'KH004'),
('HD021', '2018-01-29', 24000000,'Chưa thanh toán', 'NV003', 'KH009'),
('HD022', '2018-01-29', 12000000,'Chưa thanh toán', 'NV002', 'KH008'),
('HD023', '2018-01-29', 21000000,'Chưa thanh toán', 'NV003', 'KH016'),
('HD024', '2018-01-29', 22000000,'Chưa thanh toán', 'NV005', 'KH013'),
('HD025', '2018-01-29', 32000000,'Chưa thanh toán', 'NV004', 'KH011'),
('HD026', '2018-01-29', 19000000,'Chưa thanh toán', 'NV003', 'KH010'),
('HD027', '2018-01-29', 17500000,'Chưa thanh toán', 'NV001', 'KH001'),
('HD028', '2018-01-29', 12550000,'Chưa thanh toán', 'NV002', 'KH001'),
('HD029', '2018-01-29', 7000000,'Chưa thanh toán', 'NV001', 'KH002');

insert into mssv.hoadonchitiet values 
('HD001','SP001',1),
('HD002','SP003',1),
('HD002','SP004',1),
('HD003','SP002',1),
('HD003','SP003',1),
('HD004','SP001',3),
('HD005','SP002',2),
('HD005','SP003',1);

-- Truy vấn lab 6
select * from khachhang;
select * from nhanvien;
select * from sanpham;
select * from hoadon;
select * from hoadonchitiet;
-- 1. Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên khách hàng)
select MaHD,NgayLapHD,TongTien,concat(HoVaTenLot," ",Ten) as TenKhachHang from hoadon, khachhang
where hoadon.MaKH = khachhang.MaKH;

-- 2. Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền, tên nhân viên)
select MaHD,NgayLapHD,TongTien,concat(HoVaTenLot," ",Ten) as TenNhanVien from hoadon, nhanvien
where hoadon.MaNV = nhanvien.MaNV;

-- 3. Hiển thị các cột thông tin (mã hóa đơn, ngày lập, tổng tiền,tên nhân viên, tên khách hàng)
select MaHD,NgayLapHD,TongTien,nhanvien.Ten,khachhang.Ten from hoadon, nhanvien join khachhang
where hoadon.MaKH = khachhang.MaKH
and hoadon.MaNV = nhanvien.MaNV;

-- 4. Đếm tổng số khách hàng và nhóm theo quận
select count(MaKH) as SoLuongKH,DiaChi from khachhang
group by DiaChi;

-- 5. Hiển thị tất cả thông tin trong bảng khách hàng và mã hóa đơn, lưu ý: Chỉ lấy những khách hàng có mua hàng (có mã hóa đơn).
select khachhang.MaKH,HoVaTenLot,Ten,DiaChi,Email,DienThoai,hoadon.MaHD from khachhang, hoadon
where khachhang.MaKH = hoadon.MaKH
group by hoadon.MaKH;

-- 6. Hiển thị các thông tin (mã hóa đơn, ngày lập, tên khách hàng, số điện thoại), chỉ hiển thị các thông tin mà trạng thái là “chưa thanh toán”
select MaHD,NgayLapHD,concat(HoVaTenLot," ",Ten) as TenKhachHang,DienThoai, TrangThai from hoadon right join khachhang
on hoadon.MaKH = khachhang.MaKH
where TrangThai = "Chưa thanh toán"
group by hoadon.MaHD
order by hoadon.MaHD;

-- 7. Hiển thị các thông tin (Mã hóa đơn, ngày lập, số lượng, tổng tiền, tên sản phẩm)
select a.MaHD,a.NgayLapHD,b.SoLuong,a.TongTien,b.TenSP from hoadon a,sanpham b,hoadonchitiet c
where c.MaSP = b.MaSP
and a.MaHD = c.MaHD;

-- 8. Hiển thị các thông tin (mã hóa đơn, ngày lập, tổng tiền, tên khách hàng), điều kiện là chỉ hiển thị thông tin của khách hàng ở quận 1
select MaHD,NgayLapHD,TongTien,concat(HoVaTenLot," ",Ten) as TenKhachHang,DiaChi from hoadon, khachhang
where hoadon.MaKH = khachhang.MaKH
and DiaChi = "Quận 1";

-- 9. Hiển thị thông tin (mã hóa đơn, ngày lập hóa đơn, tổng tiền hóa đơn, số lượng mua, mã sản phẩm, tên sản phẩm)
select a.MaHD,a.NgayLapHD,a.TongTien,b.SoLuong,b.TenSP,b.MaSP from hoadon a,sanpham b,hoadonchitiet c
where c.MaSP = b.MaSP
and a.MaHD = c.MaHD;

-- 10. Hiển thị thông tin (mã hóa đơn, ngày lập hóa đơn, tổng tiền hóa đơn, số lượng mua, mã sản phẩm, tên sản phẩm, tên khách hàng), điều kiện khách hàng tên Khoa
select a.MaHD,a.NgayLapHD,a.TongTien,b.SoLuong,b.MaSP,b.TenSP,d.Ten from hoadon a,sanpham b,hoadonchitiet c,khachhang d
where c.MaSP = b.MaSP
and a.MaHD = c.MaHD
and a.MaKH = d.MaKH
and d.Ten = "Khoa";