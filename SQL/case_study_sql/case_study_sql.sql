drop database if exists case_study;

create database case_study;
use case_study;

CREATE TABLE vi_tri (
    ma_vi_tri INT NOT NULL,
    ten_vi_tri VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_vi_tri)
);
CREATE TABLE trinh_do (
    ma_trinh_do INT NOT NULL,
    ten_trinh_do VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_trinh_do)
);

CREATE TABLE bo_phan (
    ma_bo_phan INT NOT NULL,
    ten_bo_phan VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_bo_phan)
);
CREATE TABLE nhan_vien (
    ma_nhan_vien INT AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL UNIQUE,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL UNIQUE,
    email VARCHAR(45) NOT NULL UNIQUE,
    dia_chi VARCHAR(45) NOT NULL,
    ma_vi_tri INT NOT NULL,
    ma_trinh_do INT NOT NULL,
    ma_bo_phan INT NOT NULL,
--     `status` BIT(1) DEFAULT 0,
    PRIMARY KEY (ma_nhan_vien),
    FOREIGN KEY (ma_vi_tri)
        REFERENCES vi_tri (ma_vi_tri),
    FOREIGN KEY (ma_trinh_do)
        REFERENCES trinh_do (ma_trinh_do),
    FOREIGN KEY (ma_bo_phan)
        REFERENCES bo_phan (ma_bo_phan)
);
CREATE TABLE loai_khach (
    ma_loai_khach INT NOT NULL,
    ten_loai_khach VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_loai_khach)
);

CREATE TABLE loai_dich_vu (
    ma_loai_dich_vu INT NOT NULL,
    ten_loai_dich_vu VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_loai_dich_vu)
);
CREATE TABLE khach_hang (
    ma_khach_hang INT AUTO_INCREMENT,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL UNIQUE,
    so_dien_thoai VARCHAR(45) NOT NULL UNIQUE,
    email VARCHAR(45) NOT NULL UNIQUE,
    dia_chi VARCHAR(45) NOT NULL,
    ma_loai_khach INT NOT NULL,
 --    `status` BIT(1) DEFAULT 0,
    PRIMARY KEY (ma_khach_hang),
    FOREIGN KEY (ma_loai_khach)
        REFERENCES loai_khach (ma_loai_khach)
);

CREATE TABLE kieu_thue (
    ma_kieu_thue INT NOT NULL,
    ten_kieu_thue VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_kieu_thue)
);


CREATE TABLE dich_vu (
    ma_dich_vu INT AUTO_INCREMENT,
    ten_dich_vu VARCHAR(45) NOT NULL,
    dien_tich INT NOT NULL,
    chi_phi_thue DOUBLE NOT NULL DEFAULT 0,
    so_nguoi_toi_da INT NOT NULL,
    tieu_chuan_phong VARCHAR(45) NOT NULL,
    mo_ta_tien_nghi_khac VARCHAR(45) NOT NULL,
    dien_tich_ho_boi DOUBLE,
    so_tang INT,
    dich_vu_mien_phi_di_kem TEXT,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    PRIMARY KEY (ma_dich_vu),
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT NOT NULL,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL DEFAULT 0,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_dich_vu_di_kem)
);


CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT NOT NULL,
    ma_khach_hang INT NOT NULL,
    ma_dich_vu INT NOT NULL,
    PRIMARY KEY (ma_hop_dong),
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    CONSTRAINT fk_ma_khach_hang FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT NOT NULL UNIQUE,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    so_luong INT NOT NULL DEFAULT 0,
    PRIMARY KEY (ma_hop_dong_chi_tiet),
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

insert into vi_tri(ma_vi_tri,ten_vi_tri)
values ("1","Quản Lý"),
		("2","Nhân Viên");

insert into trinh_do(ma_trinh_do,ten_trinh_do)
values ("1","Trung Cấp"),
	("2","Cao Đẳng"),
	("3","Đại Học"),
	("4","Sau Đại Học");

insert into bo_phan(ma_bo_phan,ten_bo_phan)
values ("1","Sale-Marketing"),
	("2","Hành chính"),
	("3","Phục vụ"),
	("4","Phục vụ");

INSERT INTO  nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES ("Nguyễn Văn An", "1970-11-07", "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguyễn Tất Thành, Đà Nẵng", "1", "3", "1"),
  ("Lê Văn Bình", "1997-04-09", "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Yên Bái, Đà Nẵng", "1", "2", "2"),
  ("Hồ Thị Yến", "1995-12-12", "999231723", 14000000, "0412352315", "thiyen@gmail.com", "K234/11 Điện Biên Phủ, Gia Lai", "1", "3", "2"),
  ("Võ Công Toản", "1980-04-04", "123231365", 17000000, "0374443232", "toan0404@gmail.com", "77 Hoàng Diệu, Quảng Trị", "1", "4", "4"),
  ("Nguyễn Bỉnh Phát", "1999-12-09", "454363232", 6000000, "0902341231", "phatphat@gmail.com", "43 Yên Bái, Đà Nẵng", "2", "1", "1"),
  ("Khúc Nguyễn An Nghi", "2000-11-08", "964542311", 7000000, "0978653213", "annghi20@gmail.com", "294 Nguyễn Tất Thành, Đà Nẵng", "2", "2", "3"),
  ("Nguyễn Hữu Hà", "1993-01-01", "534323231", 8000000, "0941234553", "nhh0101@gmail.com", "4 Nguyễn Chí Thanh, Huế", "2", "3", "2"),
  ("Nguyễn Hà Đông", "1989-09-03", "234414123", 9000000, "0642123111", "donghanguyen@gmail.com", "111 Hùng Vương, Hà Nội", "2", "4", "4"),
  ("Tòng Hoang", "1982-09-03", "256781231", 6000000, "0245144444", "hoangtong@gmail.com", "213 Hàm Nghi, Đà Nẵng", "2", "4", "4"),
  ("Nguyễn Công Đạo", "1994-01-08", "755434343",8000000, "0988767111", "nguyencongdao12@gmail.com", "6 Hoà Khánh, Đồng Nai", "2", "3", "2");

insert into loai_khach(ma_loai_khach,ten_loai_khach)
values ("1","Diamond"),
	("2","Platinium"),
	("3","Gold"),
	("4","Silver"),
	("5","Member");
    
INSERT INTO khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES ("Nguyễn Thị Hào", "1970-11-07", 0, "643431213", "0945423362", "thihao07@gmail.com", "23 Nguyễn Hoàng, Đà Nẵng", 5),
("Phạm Xuân Diệu", "1992-08-08", 1, "865342123", "0954333333", "xuandieu92@gmail.com", "K77/22 Thái Phiên, Quảng Trị", 3),
("Trương Đình Nghệ", "1990-02-27", 1, "488645199", "0373213122", "nghenhan2702@gmail.com", "K323/12 Ông Ích Khiêm, Vinh", 1),
("Dương Văn Quan", "1981-07-08", 1, "543432111", "0490039241", "duongquan@gmail.com", "K453/12 Lê Lợi, Đà Nẵng", 1),
("Hoàng Trần Nhi Nhi", "1995-12-09", 0, "795453345", "0312345678", "nhinhi123@gmail.com", "224 Lý Thái Tổ, Gia Lai", 4),
("Tôn Nữ Mộc Châu", "2005-12-06", 0, "732434215", "0988888844", "tonnuchau@gmail.com", "37 Yên Thế, Đà Nẵng", 4),
("Nguyễn Mỹ Kim", "1984-04-08", 0, "856453123", "0912345698", "kimcuong84@gmail.com", "K123/45 Lê Lợi, Hồ Chí Minh", 1),
("Nguyễn Thị Hào", "1999-04-08", 0, "965656433", "0763212345", "haohao99@gmail.com", "55 Nguyễn Văn Linh, Kon Tum", 3),
("Trần Đại Danh", "1994-07-01", 1, "432341235", "0643343433", "danhhai99@gmail.com", "24 Lý Thường Kiệt, Quảng Ngãi", 1),
("Nguyễn Tâm Đắc", "1989-07-01", 1, "344343432", "0987654321", "dactam@gmail.com", "22 Ngô Quyền, Đà Nẵng", 2);

insert into kieu_thue(ma_kieu_thue,ten_kieu_thue)
values ("1","year"),
	("2","month"),
	("3","day"),
	("4","hour");
    
insert into loai_dich_vu(ma_loai_dich_vu,ten_loai_dich_vu)
values (1,"Villa"),
	(2,"House"),
	(3,"Room");

INSERT INTO  dich_vu(ten_dich_vu, dien_tich, chi_phi_thue, so_nguoi_toi_da, tieu_chuan_phong, mo_ta_tien_nghi_khac, dien_tich_ho_boi, so_tang, dich_vu_mien_phi_di_kem, ma_kieu_thue, ma_loai_dich_vu)
VALUES ("Villa Beach Front", 25000, "1000000", "10", "vip", "Có hồ bơi", 500, 4, null, "3", "1"),
("House Princess 01", 14000, "5000000", "7", "vip", "Có thêm bếp nướng", null, 3, null, "2", "2"),
("Room Twin 01", 5000, "1000000", "2", "normal", "Có tivi", null, null, "1 Xe máy, 1 Xe đạp", "4", "3"),
("Villa No Beach Front", 22000, "9000000", "8", "normal", "Có hồ bơi", 300, 3, null, "3", "1"),
("House Princess 02", 1000, "4000000", "5", "normal", "Có thêm bếp nướng", null, 2, null, "3", "2"),
("Room Twin 02", 3000, "900000", "2", "normal", "Có tivi", null, null, "1 Xe máy", "4", "3");

INSERT INTO  dich_vu_di_kem(ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES ("1", "Karaoke", 10000, "giờ", "tiện nghi, hiện tại"),
("2","Thuê xe máy", 10000, "chiếc", "hỏng 1 xe"),
("3","Thuê xe đạp", 20000, "chiếc", "tốt"),
("4","Buffet buổi sáng", 15000, "suất", " đầy đủ đồ ăn, tráng miệng "),
("5","Buffet buổi trưa", 90000,"suất", " đầy đủ đồ ăn, tráng miệng "),
("6","Buffet buổi tối", 16000,"suất", " đầy đủ đồ ăn, tráng miệng ");

INSERT INTO hop_dong (ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, ma_nhan_vien, ma_khach_hang, ma_dich_vu) 
VALUES ("2020-12-08", "2020-12-08", "0", "3", "1", "3"),
("2020-07-14", "2020-07-21", "200000", "7", "3", "1"),
("2021-03-15", "2021-03-17", "50000", "3", "4", "2"),
("2021-01-14", "2021-01-18", "100000", "7", "5", "5"),
("2021-07-14", "2021-07-15", "0", "7", "2", "6"),
("2021-06-01", "2021-06-03", "0", "7", "7", "6"),
("2021-09-02", "2021-09-05", "100000", "7", "4", "4"),
("2021-06-17", "2021-06-18", "150000", "3", "4", "1"),
("2020-11-19", "2020-11-19", "0", "3", "4", "3"),
("2021-04-12", "2021-04-14", "0", "10", "3", "5"),
("2021-04-25", "2021-04-25", "0", "2", "2", "1"),
("2021-05-25", "2021-05-27", "0", "7", "10", "1");

INSERT INTO hop_dong_chi_tiet (ma_hop_dong_chi_tiet, so_luong, ma_hop_dong, ma_dich_vu_di_kem) 
VALUES ("1", "5", "2", "4"),
("2", "8", "2", "5"),
("3", "15", "2", "6"),
("4", "1", "3", "1"),
("5", "11", "3", "2"),
("6", "1", "1", "3"),
("7", "2", "1", "2"),
("8", "2", "12", "2");

-- 2. ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự --
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten REGEXP '^[HTK]'
        AND CHAR_LENGTH(ho_ten) <= 15 ;
        
        -- tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị” --
SELECT 
    *
FROM
    khach_hang
WHERE (YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50)
AND (dia_chi LIKE "%Đà Nẵng" OR dia_chi LIKE "%Quảng Trị") ;

-- 4.đếm những khách hàng nào có Tên loại khách hàng là “Diamond” --
SELECT 
    khach_hang.ma_khach_hang AS ma_khach_hang,
    khach_hang.ho_ten AS ho_ten,
    COUNT(hop_dong.ma_hop_dong) AS so_lan_dat_phong
FROM
    khach_hang
        JOIN
    hop_dong ON hop_dong.ma_khach_hang = khach_hang.ma_khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
WHERE
    ten_loai_khach = 'Diamond'
GROUP BY khach_hang.ho_ten
ORDER BY COUNT(hop_dong.ma_hop_dong);

-- 5.Tổng tiền --

SELECT 
    kh.ma_khach_hang AS ma_khach_hang,
    kh.ho_ten AS ho_ten,
    lk.ten_loai_khach AS ten_loai_khach,
    hd.ma_hop_dong AS ma_hop_dong,
    dv.ten_dich_vu AS ten_dich_vu,
    hd.ngay_lam_hop_dong AS ngay_lam_hop_dong,
    hd.ngay_ket_thuc AS ngay_ket_thuc,
    SUM(chi_phi_thue + ifnull(so_luong * gia,0)) AS tong_tien
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY hd.ma_hop_dong;


-- 6.quý 1 của năm 2021 (Quý 1 là tháng 1, 2, 3) --
SELECT 
    ma_dich_vu,
    ten_dich_vu,
    dien_tich,
    chi_phi_thue,
    ten_loai_dich_vu
FROM
    dich_vu
        JOIN
    loai_dich_vu ON loai_dich_vu.ma_loai_dich_vu = dich_vu.ma_loai_dich_vu
        AND ma_dich_vu NOT IN 
        (SELECT 
            ma_dich_vu
        FROM
            hop_dong
        WHERE
            QUARTER(ngay_lam_hop_dong) = 1);
            
-- 7.trong năm 2020 nhưng chưa từng được khách hàng đặt phòng trong năm 2021 --
SELECT 
    dv.ma_dich_vu,
    ten_dich_vu,
    dien_tich,
    so_nguoi_toi_da,
    chi_phi_thue,
    ten_loai_dich_vu
FROM
    dich_vu dv
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong hd ON dv.ma_dich_vu = hd.ma_dich_vu
WHERE
    YEAR(ngay_lam_hop_dong) = 2020
        AND hd.ma_dich_vu NOT IN (SELECT 
            ma_dich_vu
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) = 2021)
GROUP BY hd.ma_dich_vu;

-- 8.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu tên không trùng nhau --
-- c1 --
SELECT 
    ho_ten
FROM
    khach_hang
GROUP BY ho_ten;


-- c2 --
SELECT DISTINCT
    ho_ten
FROM
    khach_hang;

-- c3 --
-- SELECT 
--     ho_ten
-- FROM
--     khach_hang
-- WHERE
--     ho_ten NOT IN (SELECT 
--             ho_ten
--         FROM
--             khach_hang
--         GROUP BY ho_ten
--         HAVING COUNT(ho_ten) > 1);

SELECT 
    ho_ten
FROM
    khach_hang 
UNION SELECT 
    ho_ten
FROM
    khach_hang;

-- 9.trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng --
SELECT 
    MONTH(ngay_lam_hop_dong) AS `month`, COUNT(ma_hop_dong)
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2021
GROUP BY `month`
ORDER BY `month`;

-- 10.	Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm.
-- Kết quả hiển thị bao gồm ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).

SELECT 
    hd.ma_hop_dong,
    ngay_lam_hop_dong,
    ngay_ket_thuc,
    tien_dat_coc,
    SUM(so_luong) AS so_luong_dich_vu_di_kem
FROM
    hop_dong hd
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
GROUP BY hd.ma_hop_dong;

-- 11.ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi” --
 
 SELECT 
    dvdk.ma_dich_vu_di_kem, ten_dich_vu_di_kem
FROM
    khach_hang kh
        JOIN
    loai_khach lk ON kh.ma_loai_khach = lk.ma_loai_khach
        JOIN
    hop_dong hd ON kh.ma_khach_hang = hd.ma_khach_hang
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
WHERE
    ten_loai_khach = 'Diamond'
        AND (dia_chi LIKE '%Vinh'
        OR dia_chi LIKE '%Quảng Ngãi');
        
-- 12.tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng --
-- đặt vào 3 tháng cuối năm 2020 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021. --

SELECT 
    hop_dong.ma_hop_dong,
    nhan_vien.ho_ten AS ho_ten_nhan_vien,
    khach_hang.ho_ten AS ho_ten_khach_hang,
    khach_hang.so_dien_thoai,
    dich_vu.ten_dich_vu,
    SUM(so_luong) AS so_luong_dich_vu_di_kem,
    tien_dat_coc
FROM
    khach_hang
        INNER JOIN
    hop_dong ON khach_hang.ma_khach_hang = hop_dong.ma_khach_hang
       INNER JOIN
    dich_vu ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet ON hop_dong.ma_hop_dong = hop_dong_chi_tiet.ma_hop_dong
        INNER JOIN
    nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
        AND YEAR(ngay_lam_hop_dong) = 2020
        AND QUARTER(ngay_lam_hop_dong) = 4
        AND hop_dong.ma_dich_vu NOT IN (SELECT 
            hop_dong.ma_dich_vu
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) = 2021
                AND (QUARTER(ngay_lam_hop_dong) = 1
                OR QUARTER(ngay_lam_hop_dong) = 2))
GROUP BY khach_hang.ma_khach_hang;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng -- 
SELECT 
    dich_vu_di_kem.ma_dich_vu_di_kem,
    ten_dich_vu_di_kem,
    SUM(so_luong) AS so_luong_dich_vu_di_kem
FROM
    dich_vu
        INNER JOIN
    hop_dong ON hop_dong.ma_dich_vu = dich_vu.ma_dich_vu
        INNER JOIN
    hop_dong_chi_tiet hdct ON hdct.ma_hop_dong = hop_dong.ma_hop_dong
        INNER JOIN
    dich_vu_di_kem ON dich_vu_di_kem.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
GROUP BY ten_dich_vu_di_kem
HAVING so_luong_dich_vu_di_kem = (SELECT 
        SUM(so_luong)
    FROM
        hop_dong_chi_tiet
    GROUP BY ma_dich_vu_di_kem
    ORDER BY SUM(so_luong) DESC
    LIMIT 1);
    

-- 14.Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất -- 
SELECT 
    hd.ma_hop_dong,
    ten_loai_dich_vu,
    ten_dich_vu_di_kem,
    COUNT(dvdk.ma_dich_vu_di_kem) AS so_lan_su_dung
FROM
    hop_dong hd
        JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        JOIN
    loai_dich_vu ldv ON dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
GROUP BY ten_dich_vu_di_kem
HAVING COUNT(dvdk.ma_dich_vu_di_kem) = 1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien,
-- ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi mới chỉ
-- lập được tối đa 3 hợp đồng từ năm 2020 đến 2021 --

SELECT 
    nhan_vien.ma_nhan_vien AS ma_nhan_vien,
    hop_dong.ma_hop_dong,
    nhan_vien.ho_ten AS ho_ten,
    ten_trinh_do,
    ten_bo_phan,
    nhan_vien.so_dien_thoai AS so_dien_thoai,
    nhan_vien.dia_chi AS dia_chi
FROM
    hop_dong
        JOIN
    nhan_vien ON hop_dong.ma_nhan_vien = nhan_vien.ma_nhan_vien
        JOIN
    trinh_do ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
        JOIN
    bo_phan ON nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan
        AND hop_dong.ma_nhan_vien IN (SELECT 
            ma_nhan_vien
        FROM
            hop_dong
        WHERE
            YEAR(ngay_lam_hop_dong) BETWEEN 2020 AND 2021
        GROUP BY ma_nhan_vien
        HAVING COUNT(ma_hop_dong) <= 3);
        
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021 --
-- set sql_safe_updates =0;
--  update nhan_vien
--  set `status` = 1
-- WHERE
--     nhan_vien.ma_nhan_vien NOT IN (SELECT 
--         ma_nhan_vien
--     FROM
--         hop_dong
--     
--     WHERE
--         YEAR(ngay_lam_hop_dong) BETWEEN 2019 AND 2021
--     GROUP BY ma_nhan_vien);
--     set sql_safe_updates =1;
--     select * from nhan_vien where `status` =1;

set sql_safe_updates = 0;
DELETE FROM nhan_vien 
WHERE
    ma_nhan_vien NOT IN (SELECT 
        temp.ma_nhan_vien
    FROM
        (SELECT 
            nhan_vien.ma_nhan_vien
        FROM
            hop_dong
        LEFT JOIN nhan_vien ON nhan_vien.ma_nhan_vien = hop_dong.ma_nhan_vien
        
        WHERE
            YEAR(ngay_lam_hop_dong) IN (2019, 2020 , 2021)
        GROUP BY ma_nhan_vien) temp);
    set sql_safe_updates =1;
SELECT 
    *
FROM
    nhan_vien;
 
    

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ --

set sql_safe_updates =0;
update khach_hang
set ma_loai_khach = 1
where ma_loai_khach = 2
and ma_khach_hang in (select temp.ma_khach_hang from
(select kh.ma_khach_hang from
    khach_hang kh
        JOIN
    loai_khach lk ON lk.ma_loai_khach = kh.ma_loai_khach
        LEFT JOIN
    hop_dong hd ON hd.ma_khach_hang = kh.ma_khach_hang
        LEFT JOIN
    dich_vu dv ON hd.ma_dich_vu = dv.ma_dich_vu
        LEFT JOIN
    hop_dong_chi_tiet hdct ON hd.ma_hop_dong = hdct.ma_hop_dong
        LEFT JOIN
    dich_vu_di_kem dvdk ON hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
    AND YEAR(ngay_lam_hop_dong) = 2021
GROUP BY kh.ma_khach_hang
having SUM(chi_phi_thue + ifnull( so_luong * gia,0)) > 1000000) temp );
 set sql_safe_updates =1;
 
 -- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng). --

--  set sql_safe_updates =0;
-- UPDATE khach_hang 
-- SET 
--     `status` = 1
-- WHERE
--     khach_hang.ma_khach_hang IN (SELECT 
--             ma_khach_hang
--         FROM
--             hop_dong
--         WHERE
--             YEAR(ngay_lam_hop_dong) < 2021);
--  set sql_safe_updates =1;

-- SELECT 
--     *
-- FROM
--     khach_hang
-- WHERE
--     `status` = 1;

 set sql_safe_updates = 0;
 set foreign_key_checks =0;
DELETE FROM khach_hang 
WHERE
    ma_khach_hang IN (SELECT 
        ma_khach_hang
    FROM
        hop_dong
    
    WHERE
        YEAR(ngay_lam_hop_dong) < 2021);
  set foreign_key_checks =1;
  set sql_safe_updates = 1;
SELECT 
    *
FROM
    khach_hang;
    

-- 19	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi. --
SELECT 
    *
FROM
    dich_vu_di_kem;
 set sql_safe_updates =0;
UPDATE dich_vu_di_kem 
SET 
    gia = gia * 2
WHERE
    ma_dich_vu_di_kem IN (SELECT 
            ma_dich_vu_di_kem
        FROM
            hop_dong_chi_tiet hdct
                INNER JOIN
            hop_dong ON hdct.ma_hop_dong = hop_dong.ma_hop_dong
                AND YEAR(ngay_lam_hop_dong) = 2020
        GROUP BY ma_dich_vu_di_kem
        HAVING SUM(so_luong) > 10);
 set sql_safe_updates =1;
 
 -- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống,
 -- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi --
SELECT 
    ma_khach_hang AS id,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    khach_hang 
UNION ALL SELECT 
    ma_nhan_vien,
    ho_ten,
    email,
    so_dien_thoai,
    ngay_sinh,
    dia_chi
FROM
    nhan_vien;
 
 
 create table mess ( 
 id int AUTO_INCREMENT,
 mess VARCHAR(255) NOT NULL,
 primary key (id)
 );


