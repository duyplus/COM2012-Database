-- a. Hiển thị tất cả thông tin có trong bảng khách hàng bao gồm tất cả các cột
select * from khachhang;
-- b. Hiển thị 5 khách hàng đầu tiên trong bảng khách hàng bao gồm các cột: mã khách hàng, họ và tên, email, số điện thoại
select maKhachHang, hoVaTenLot, Ten, Email, dienThoai from khachhang limit 5;
-- c. Hiển thị thông tin từ bảng Sản phẩm gồm các cột: mã sản phẩm, tên sản phẩm, tổng tiền tồn kho. Với tổng tiền tồn kho = đơn giá* số lượng
select maSanPham, tenSP, soLuong, donGia, (soLuong*donGia) as TongTien from sanpham;
-- d. Hiển thị danh sách khách hàng có tên bắt đầu bởi kí tự ‘H’ gồm các cột: maKhachHang, hoVaTen, diaChi. Trong đó cột hoVaTen ghép từ 2 cột hoVaTenLot và Ten
select maKhachHang, concat(hoVaTenLot," ",Ten) as HoVaTen,diaChi from khachhang
where Ten like "H%";
-- e. Hiển thị tất cả thông tin các cột của khách hàng có địa chỉ chứa chuỗi ‘Đà Nẵng’
select * from khachhang
where diaChi = "Da Nang";
-- f. Hiển thị các sản phẩm có số lượng nằm trong khoảng từ 100 đến 500.
select * from sanpham
where soLuong between 100 and 500;
-- g. Hiển thị danh sách các hoá hơn có trạng thái là chưa thanh toán và ngày mua hàng trong năm 2016
select * from hoadon
where trangThai = "Chua thanh toan" and year(ngayMuaHang) = 2016;
-- h. Hiển thị các hoá đơn có mã Khách hàng thuộc 1 trong 3 mã sau: KH001, KH003, KH006
select * from hoadon
where maKhachHang in ("KH001", "KH003", "KH006");