-- a. Hiển thị số lượng khách hàng có trong bảng khách hàng
select count(maKhachHang) as SoLuongKH from khachhang;
-- b. Hiển thị đơn giá lớn nhất trong bảng SanPham
select max(donGia) as donGiaLN from sanpham;
-- c. Hiển thị số lượng sản phẩm thấp nhất trong bảng sản phẩm
select min(SoLuong) as soLuongTN from sanpham;
-- d. Hiển thị tổng tất cả số lượng sản phẩm có trong bảng sản phẩm
select SoLuong from sanpham;
-- e. Hiển thị số hoá đơn đã xuất trong tháng 12/2016 mà có trạng thái chưa thanh toán
select * from hoadon
where maHoaDon and year(ngayMuaHang) = 2016 and month(ngayMuaHang) = 12;
-- f. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn.
select maHoaDon, maSanPham from hoadonchitiet;
-- g. Hiển thị mã hoá đơn và số loại sản phẩm được mua trong từng hoá đơn. Yêu cầu chỉ hiển thị hàng nào có số loại sản phẩm được mua >=5.
select maHoaDon, maSanPham from hoadonchitiet
where maSanPham >= 5;
-- h. Hiển thị thông tin bảng HoaDon gồm các cột maHoaDon, ngayMuaHang, maKhachHang. Sắp xếp theo thứ tự giảm dần của ngayMuaHang
select maHoaDon, ngayMuaHang, maKhachHang from hoadon
order by ngayMuaHang;