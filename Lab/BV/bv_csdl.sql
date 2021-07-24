-- Tạo schema
CREATE DATABASE bv_csdl;
-- Sử dụng schema
USE bv_csdl;
-- Tạo bản học viên
CREATE TABLE hocvien(
	MaHV varchar(10) NOT NULL,
    HoTenHV varchar(50) NOT NULL,
    DiaChi varchar(50) NOT NULL,
    QueQuan varchar(50) NOT NULL,
    SDT varchar(13) NOT NULL,
    PRIMARY KEY(MaHV)
);
insert into hocvien value('PS1','Nguyen Hoang Duy','Ho Chi Minh','Phan Thiet','0919993715'),
('PS2','Nguyen Hoang Dung','Phan Thiet','Gia Lai','0334927862'),
('PS3','Hoang Manh Dat','Quang Ngai','Binh Dinh','0336195530'),
('PS4','Le Bao Tram','Vung Tau','Nam Dinh','0982224530'),
('PS5','Dao Quoc Hung','Ha Noi','Nha Trang','0778050316');
CREATE TABLE monhoc(
	MaMH varchar(10) NOT NULL,
    TenMH varchar(50) NOT NULL,
    SoGio float NOT NULL,
    PRIMARY KEY(MaMH)
);
insert into monhoc value('KT','Kinh Te',120),
('IT','Cong Nghe Thong Tin',90),
('QTKD','Quan Tri Kinh Doanh',60),
('DDT','Dien Tu',90),
('TKDH','Thiet Ke Do Hoa',120);
CREATE TABLE ketqua(
	MaHV varchar(10) NOT NULL,
    MaMH varchar(50) NOT NULL,
    Diem float NOT NULL,
    foreign key(MaHV) references hocvien(MaHV),
    foreign key(MaMH) references monhoc(MaMH)
);
insert into ketqua value('PS1','TKDH',8.5),
('PS2','QTKD',7),
('PS3','IT',5.5),
('PS4','DDT',6.2),
('PS5','KT',4.7);

-- Liệt kê tất cả các thông tin của môn học sau đó sắp xếp thứ tự tăng dần theo số giờ.
select * from monhoc
order by SoGio asc;
-- Liệt kê tất cả các thông tin của học viên mà có quê quán tại "Nam Định".
select * from hocvien
where QueQuan like "Nam Dinh";
-- Liệt kê MaMH, TenMH có điểm thi dưới 5
select mh.MaMH, mh.TenMH, kq.Diem from monhoc mh join ketqua kq
on kq.MaMH = mh.MaMH
where kq.Diem < 5;
-- Hãy tính điểm trung bình của mỗi học viên thông tin hiển thị gồm có: MAHV, DIEMTB
select hv.MaHV, avg(kq.Diem) as DiemTB from hocvien hv join ketqua kq
on kq.MaHV = hv.MaHV
order by kq.Diem asc;