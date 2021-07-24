create database QuanLyPhimBHD;
use QuanLyPhimBHD;

create table phim(
	MaPhim varchar(10),
	TenPhim varchar(100) not null,
	NgayDuKien date,
	HangSanXuat varchar(50) not null,
	ThoiLuong int,
	TheLoai varchar(50),
    -- CONSTRAINT TenRB check(NgayDuKien  > day(curdate()+10)),
	primary key(MaPhim)
);
insert into phim value('BHD1','Raya và rồng thần cuối cùng','2021-03-04','Disney Studios',107,'Hoạt Hình'),
('BHD2','Tom & Jerry: Quậy tung New York','2021-02-17','Warner Animation Group',120,'Hoạt Hình'),
('BHD3','Godzilla đại chiến Kong','2021-03-21','Warner Bros',113,'Hành Động'),
('BHD4','Bố Già','2021-03-12','Galaxy Studio',128,'Hài Hước'),
('BHD5','Hành tinh hỗn loạn','2021-02-24','Lionsgate',109,'Hành Động');

create table phong(
	MaPhong varchar(10),
	TenPhong varchar(50),
	SucChua int,
	primary key(MaPhong)
);
insert into phong value('P1','Phòng 1',150),
('P2','Phòng 2',100),
('P3','Phòng 3',120);

create table lichchieu(
	SoThuTu int,
	MaPhong varchar(10),
	MaPhim varchar(10),
	NgayChieu date,
	XuatChieu time(0),
	primary key(SoThuTu),
    foreign key(MaPhong) references phong(MaPhong),
    foreign key(MaPhim) references phim(MaPhim)
);

insert into lichchieu value(1,'P2','BHD1','2021-03-14','13:30:00'),
(2,'P1','BHD5','2021-02-27','17:30:00'),
(3,'P3','BHD4','2021-04-01','19:00:00'),
(4,'P2','BHD3','2021-03-22','21:30:00'),
(5,'P3','BHD2','2021-03-04','11:30:00'),
(6,'P2','BHD1','2021-03-14','15:30:00'),
(7,'P1','BHD5','2021-02-27','13:30:00'),
(8,'P3','BHD4','2021-04-01','21:00:00'),
(9,'P3','BHD3','2021-03-22','20:30:00'),
(10,'P1','BHD2','2021-03-04','15:30:00');

-- Truy xuất Tên phim, hãng sản xuất , thể loại , ngày chiếu, xuất chiếu, tên phòng chiếu
select TenPhim,HangSanXuat,TheLoai,NgayChieu,XuatChieu,TenPhong from phim
join lichchieu on phim.MaPhim = lichchieu.MaPhim
join phong on lichchieu.MaPhong = phong.MaPhong;
-- Liệt kê tổng số phòng chiếu theo mỗi tên phim
select phim.TenPhim,count(phong.MaPhong) as 'Số Phòng' from lichchieu
join phim on lichchieu.MaPhim = phim.MaPhim
join phong on phong.MaPhong = lichchieu.MaPhong
group by lichchieu.MaPhim;
-- Thống kê số lượng phim theo thể loại
select TheLoai as 'Thể Loại',count(MaPhim) as 'Số Lượng' from phim
group by TheLoai;