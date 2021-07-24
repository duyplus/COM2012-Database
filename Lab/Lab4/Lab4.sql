create database lab4;
use lab4;

create table thannhan(
	MaTN int primary key,
	TenTN varchar(45),
    NgaySinh date,
    MoiQH varchar(40),
    MaKN int
);
insert into thannhan
value (19,"Đầm","1976-08-22","Mẹ",14),
(20,"Loan","1976-08-22","Cha",15),
(21,"Huệ","1976-08-22","Bà nội",16),
(22,"Phong","1976-08-22","Anh trai",17),
(23,"Ngọc","1976-08-22","Chị dâu",18);
alter table thannhan
add constraint MaKN
foreign key(MaKN) references nhanvien(MaNV)
on update cascade
on delete restrict;

create table nhanvien(
	MaNV int primary key,
	TenNV varchar(45),
    ChucVu varchar(30),
    MaKN1 int
);
insert into nhanvien
value (14,"Duy","Trưởng phòng",9),
(15,"Dũng","Nhân viên",10),
(16,"Hà","Trưởng phòng",11),
(17,"Đạt","Trưởng phòng",12),
(18,"Bình","Nhân viên",13);
alter table nhanvien
add constraint MaKN1
foreign key(MaKN1) references vanphong(MaVP)
on update cascade
on delete restrict;

create table vanphong(
	MaVP int primary key,
	DiaChi varchar(50),
    MaKN2 int
);
insert into vanphong
value (9,"Hà Nội",4),
(10,"HCM",5),
(11,"Hà Nội",6),
(12,"Phan Thiết",7),
(13,"Bình Dương",8);
alter table vanphong
add constraint MaKN2
foreign key(MaKN2) references batdongsan(MaBDS)
on update cascade
on delete restrict;

create table batdongsan(
	MaBDS int primary key,
	DiaChiBDS varchar(50),
    MaKN3 int
);
insert into batdongsan
value (4,"Hà Nội",1),
(5,"HCM",2),
(6,"Nha Trang",3),
(7,"Đà Nẵng",4),
(8,"Hạ Long",5);
alter table batdongsan
add constraint MaKN3
foreign key(MaKN3) references chusohuu(MaCSH)
on update cascade
on delete restrict;

create table chusohuu(
	MaCSH int primary key,
	TenCSH varchar(45),
    DiaChiCSH varchar(50),
    SdtCSH varchar(13)
);
insert into chusohuu
value (1,"Kiên","HCM",0123456789),
(2,"Trinh","Hà Nội",0534534563),
(3,"Kiệt","Phan Thiết",0942345623),
(4,"Hoà","Vũng Tàu",0336443559),
(5,"Quyên","Nha Trang",0643494218);