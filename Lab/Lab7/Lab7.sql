use mssv;
-- Bài 1
-- a. Sử dụng câu lệnh INSERT để thêm dữ liệu các các bảng
insert into khachhang
value('KH025','Nguyễn Thị','Nga','15 QuangTrung, TP Đà Nẵng','ngant@gamil.com',0912345670),
('KH026','Trần Công','Thành','234 Lê Lợi, TP Quảng Nam','thanhtc@gamil.com',16109423443),
('KH027','Lê Hoàng','Nam','23 Trần Phú, TP Huế','namlt@gamil.com',0989354556),
('KH028','Vũ Ngọc','Hiền','37 Nguyễn Thị Thập, TP Đà Nẵng','hienvn@gamil.com',0894545435);

insert into sanpham
value('SP007','Samsung Galaxy J7 Pro',800,6600000,'Samsung Galaxy J7 Pro là một chiếc smartphone phù hợp với những người yêu thích một sản phẩm pin tốt, thích hệ điều hành mới cùng những tính năng đi kèm độc quyền'),
('SP008','iPhone 6 32GB',500,8990000,'iPhone 6 là một trong những smartphone được yêu thích nhất. Lắng nghe nhu cầu về thiết kế, khả năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối chính hãng tại Việt Nam hứa hẹn sẽ là một sản phẩm rất "Hot"'),
('SP009','Laptop Dell Inspiron 3467',507,11290000,'Dell Inspiron 3467 i3 7100U/4GB/1TB/Win10/(M20NR21)'),
('SP010','Pin sạc dự phòng',600,200000,'Pin sạc dự phòng Polymer 5.000 mAh eSaver JP85'),
('SP011','Nokia 3100',100,700000,'Nokia 3100 phù hợp với SINH VIÊN');

insert into hoadon
value('120954','2016-03-23',24000000,'Đã thanh toán','NV005','KH025'),
('120955','2016-04-02',1400000,'Đã thanh toán','NV001','KH026'),
('120956','2016-07-12',54000000,'Chưa thanh toán','NV002','KH025'),
('125957','2016-12-04',8400000,'Chưa thanh toán','NV004','KH028');

insert into hoadonchitiet
value('120954','SP003',40),
('120954','SP001',20),
('120955','SP002',100),
('120956','SP004',6),
('120956','SP002',60),
('120956','SP001',10),
('125957','SP002',50);

-- b Tạo 1 bảng có tên KhachHang_daNang chứa thông tin tin đầy đủ về các khách hàng đến từ Đà Nẵng (sử dụng SELECT INTO)
create table KhachHang_daNang as
select * from khachhang
where DiaChi like "Đà Nẵng";

-- Bài 2
-- a. Cập nhật lại thông tin số điện thoại của khách hàng có mã "KH025" có giá trị mới là "16267788989"
update khachhang
set DienThoai = "16267788989"
where MaKH = "KH025";
-- b. Tăng số lượng mặt hàng có mã "SP009" lên thêm "200" đơn vị
update sanpham
set SoLuong = SoLuong + 200
where MaSP = "SP009";
-- c. Giảm giá cho tất cả sản phẩm giảm 5%
update sanpham
set GiaSP = GiaSP - (GiaSP * 0.95)
where MaSP like "SP%";
-- d. Tăng số lượng của mặt hàng bán chạy nhất trong tháng 12/2016 lên 100 đơn vị
select MaSP, sum(SoLuongMua) as slban from hoadonchitiet
join hoadon on hoadon.MaHD = hoadonchitiet.MaHD
where year(NgayLapHD) = '2016' and month(NgayLapHD) = '12'
group by MaSP
order by slban desc;
-- e. Giảm giá 10% cho 2 sản phẩm bán ít nhất trong năm 2016
select MaSP from hoadonchitiet
join hoadon on hoadon.MaHD = hoadonchitiet.MaHD
where year(NgayLapHD) = '2016'
group by MaSP
order by sum(SoLuongMua) asc;
-- f. Cập nhật lại trạng thái "Đã thanh toán" cho hoá đơn có mã "120956"
update hoadon
set TrangThai = "Đã thanh toán"
where MaHD like "120956";
-- g. Xoá mặt hàng có mã sản phẩm là "SP008" ra khỏi hoá đơn "120956" và trạng thái là "Chưa thanh toán".
delete from hoadonchitiet
where MaSP = 'SP008'
and MaHD in (select * from hoadonchitiet join hoadon
on hoadon.MaHD = hoadonchitiet.MaHD
where hoadonchitiet.MaHD = '120956'
and TrangThai = 'Chưa thanh toán');
-- h. Xoá khách hàng chưa từng mua hàng kể từ ngày "2016-01-01"
delete from khachhang
where MaKH in (select hoadon.MaHD from hoadon join khachhang
on khachhang.MaKH = hoadon.MaKH
where NgayLapHD like '2016-01-01');