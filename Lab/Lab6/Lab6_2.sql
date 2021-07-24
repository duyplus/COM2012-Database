use mssv;
-- Bài 1
-- a. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau:
-- MaHD, MaKH, TrangThai, MaSP, SoLuongMua, NgayLapHD
select hd.MaHD,  hd.MaKH, hd.TrangThai, hdct.MaSP, hdct.SoLuongMua, hd.NgayLapHD from hoadon hd, hoadonchitiet hdct
where hd.MaHD = hdct.MaHD;
-- b. Hiển thị tất cả thông tin có trong 2 bảng Hoá đơn và Hoá đơn chi tiết gồm các cột sau:
-- MaHD, MaKH, TrangThai, MaSP, SoLuongMua, NgayLapHD với điều kiện MaKH = ‘KH001’
select hd.MaHD,  hd.MaKH, hd.TrangThai, hdct.MaSP, hdct.SoLuongMua, hd.NgayLapHD from hoadon hd, hoadonchitiet hdct
where hd.MaHD = hdct.MaHD
and hd.MaKH = "KH001";
-- c. Hiển thị thông tin từ 3 bảng Hoá đơn, Hoá đơn chi tiết và Sản phẩm gồm các cột sau:
-- MaHD, NgayLapHD, TenSP, DonGia, SoLuongMua, thành tiền. Với thành tiền= donGia* soLuong
select hd.MaHD, hd.NgayLapHD, sp.TenSP, sp.GiaSP, hdct.SoLuongMua, (sp.GiaSP* sp.SoLuong) as ThanhTien from hoadon hd
join hoadonchitiet hdct on hdct.MaHD = hd.MaHD
join sanpham sp on sp.MaSP = hdct.MaSP;
-- d. Hiển thị thông tin từ bảng Khách hàng, Hoá đơn và Hoá đơn chi tiết gồm các cột:
-- Họ và tên, Email, dienThoai, maHoaDon, trangThai và tổng tiền. Chỉ hiển thị thông tin các hoá đơn "Chưa thanh toán".
select concat(HoVaTenLot," ",Ten) as TenKhachHang, kh.Email, kh.DienThoai, hd.TrangThai, (sp.GiaSP* sp.SoLuong) as TongTien from hoadon hd
join hoadonchitiet hdct on hdct.MaHD = hd.MaHD
join khachhang kh on kh.MaKH = hd.MaKH
join sanpham sp on sp.MaSP = hdct.MaSP
where hd.TrangThai = "Chưa thanh toán";
-- e. Hiển thị maHoaDon, ngayMuahang, Tổng số tiền đã mua trong từng hoá đơn. Chỉ hiển thị những hóa đơn có tổng số tiền >=500.000 và sắp xếp theo thứ tự giảm dần của cột tổng tiền.
select hd.MaHD, hd.NgayLapHD, (sp.GiaSP* sp.SoLuong) as TongTien from
hoadon hd join hoadonchitiet hdct on hdct.MaHD = hd.MaHD
join sanpham sp on sp.MaSP = hdct.MaSP
where (sp.GiaSP* sp.SoLuong) >= 500000
order by TongTien DESC;

-- Bài 2
-- a. Hiển thị danh sách các khách hàng chưa mua hàng lần nào kể từ tháng 1/1/2019
select * from khachhang
where MaKH not in (select MaKH from hoadon where NgayLapHD > "2019-01-01");
-- b. Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 01/2019
select sp.MaSP, sp.TenSP, max(hdct.SoLuongMua) as muaNhieuNhat, hd.NgayLapHD from
hoadonchitiet hdct join hoadon hd on hd.MaHD = hdct.MaHD
join sanpham sp on sp.MaSP = hdct.MaSP
where hd.NgayLapHD like "2019-01-%";
-- c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2019
select concat(HoVaTenLot," ",Ten) as TenKhachHang, (sp.GiaSP* sp.soLuong) as TongTien from
hoadonchitiet hdct join sanpham sp on hdct.MaSP = sp.MaSP,
hoadon hd join khachhang kh on kh.MaKH = hd.MaKH
where hdct.MaHD = hd.MaHD limit 5;
-- d. Hiển thị thông tin các khách hàng sống ở ‘Đà Nẵng’ có mua sản phẩm có tên “Samsung Galaxy Note 9” trong tháng 12/2019
select kh.MaKH, concat(HoVaTenLot," ",Ten) as HoTenKH, DiaChi, TenSP from khachhang kh
join hoadon hd on hd.MaKH = kh.MaKH
join hoadonchitiet hdct on hd.MaHD = hdct.MaHD
join sanpham sp on sp.MaSP = hdct.MaSP
where kh.DiaChi like '%Quận 1'
and month(hd.NgayLapHD)='01'
and year(hd.NgayLapHD)='2019'
and sp.TenSP = 'Samsung Galaxy Note 9';
-- e. Hiển thị tên sản phẩm có lượt đặt mua nhỏ hơn lượt mua trung bình các các sản phẩm.
select sp.TenSP, count(hdct.MaSP) as SoLuotMua from hoadonchitiet hdct
join hoadon hd on hd.MaHD = hdct.MaHD
join sanpham sp on hdct.MaSP = sp.MaSP
group by hdct.MaSP
having count(hdct.MaSP)<(select avg(temp.SoLuotMua) from(select count(hdct.MaSP) as SoLuotMua
from hoadonchitiet hdct
join hoadon hd on hd.MaHD = hdct.MaHD
join sanpham sp on hdct.MaSP = sp.MaSP
group by hdct.MaSP) as temp);