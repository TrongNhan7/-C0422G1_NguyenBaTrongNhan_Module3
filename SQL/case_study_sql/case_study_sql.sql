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
values ("1","Qu???n L??"),
		("2","Nh??n Vi??n");

insert into trinh_do(ma_trinh_do,ten_trinh_do)
values ("1","Trung C???p"),
	("2","Cao ?????ng"),
	("3","?????i H???c"),
	("4","Sau ?????i H???c");

insert into bo_phan(ma_bo_phan,ten_bo_phan)
values ("1","Sale-Marketing"),
	("2","H??nh ch??nh"),
	("3","Ph???c v???"),
	("4","Ph???c v???");

INSERT INTO  nhan_vien(ho_ten, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi, ma_vi_tri, ma_trinh_do, ma_bo_phan)
VALUES ("Nguy???n V??n An", "1970-11-07", "456231786", 10000000, "0901234121", "annguyen@gmail.com", "295 Nguy???n T???t Th??nh, ???? N???ng", "1", "3", "1"),
  ("L?? V??n B??nh", "1997-04-09", "654231234", 7000000, "0934212314", "binhlv@gmail.com", "22 Y??n B??i, ???? N???ng", "1", "2", "2"),
  ("H??? Th??? Y???n", "1995-12-12", "999231723", 14000000, "0412352315", "thiyen@gmail.com", "K234/11 ??i???n Bi??n Ph???, Gia Lai", "1", "3", "2"),
  ("V?? C??ng To???n", "1980-04-04", "123231365", 17000000, "0374443232", "toan0404@gmail.com", "77 Ho??ng Di???u, Qu???ng Tr???", "1", "4", "4"),
  ("Nguy???n B???nh Ph??t", "1999-12-09", "454363232", 6000000, "0902341231", "phatphat@gmail.com", "43 Y??n B??i, ???? N???ng", "2", "1", "1"),
  ("Kh??c Nguy???n An Nghi", "2000-11-08", "964542311", 7000000, "0978653213", "annghi20@gmail.com", "294 Nguy???n T???t Th??nh, ???? N???ng", "2", "2", "3"),
  ("Nguy???n H???u H??", "1993-01-01", "534323231", 8000000, "0941234553", "nhh0101@gmail.com", "4 Nguy???n Ch?? Thanh, Hu???", "2", "3", "2"),
  ("Nguy???n H?? ????ng", "1989-09-03", "234414123", 9000000, "0642123111", "donghanguyen@gmail.com", "111 H??ng V????ng, H?? N???i", "2", "4", "4"),
  ("T??ng Hoang", "1982-09-03", "256781231", 6000000, "0245144444", "hoangtong@gmail.com", "213 H??m Nghi, ???? N???ng", "2", "4", "4"),
  ("Nguy???n C??ng ?????o", "1994-01-08", "755434343",8000000, "0988767111", "nguyencongdao12@gmail.com", "6 Ho?? Kh??nh, ?????ng Nai", "2", "3", "2");

insert into loai_khach(ma_loai_khach,ten_loai_khach)
values ("1","Diamond"),
	("2","Platinium"),
	("3","Gold"),
	("4","Silver"),
	("5","Member");
    
INSERT INTO khach_hang(ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai, email, dia_chi, ma_loai_khach)
VALUES ("Nguy???n Th??? H??o", "1970-11-07", 0, "643431213", "0945423362", "thihao07@gmail.com", "23 Nguy???n Ho??ng, ???? N???ng", 5),
("Ph???m Xu??n Di???u", "1992-08-08", 1, "865342123", "0954333333", "xuandieu92@gmail.com", "K77/22 Th??i Phi??n, Qu???ng Tr???", 3),
("Tr????ng ????nh Ngh???", "1990-02-27", 1, "488645199", "0373213122", "nghenhan2702@gmail.com", "K323/12 ??ng ??ch Khi??m, Vinh", 1),
("D????ng V??n Quan", "1981-07-08", 1, "543432111", "0490039241", "duongquan@gmail.com", "K453/12 L?? L???i, ???? N???ng", 1),
("Ho??ng Tr???n Nhi Nhi", "1995-12-09", 0, "795453345", "0312345678", "nhinhi123@gmail.com", "224 L?? Th??i T???, Gia Lai", 4),
("T??n N??? M???c Ch??u", "2005-12-06", 0, "732434215", "0988888844", "tonnuchau@gmail.com", "37 Y??n Th???, ???? N???ng", 4),
("Nguy???n M??? Kim", "1984-04-08", 0, "856453123", "0912345698", "kimcuong84@gmail.com", "K123/45 L?? L???i, H??? Ch?? Minh", 1),
("Nguy???n Th??? H??o", "1999-04-08", 0, "965656433", "0763212345", "haohao99@gmail.com", "55 Nguy???n V??n Linh, Kon Tum", 3),
("Tr???n ?????i Danh", "1994-07-01", 1, "432341235", "0643343433", "danhhai99@gmail.com", "24 L?? Th?????ng Ki???t, Qu???ng Ng??i", 1),
("Nguy???n T??m ?????c", "1989-07-01", 1, "344343432", "0987654321", "dactam@gmail.com", "22 Ng?? Quy???n, ???? N???ng", 2);

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
VALUES ("Villa Beach Front", 25000, "1000000", "10", "vip", "C?? h??? b??i", 500, 4, null, "3", "1"),
("House Princess 01", 14000, "5000000", "7", "vip", "C?? th??m b???p n?????ng", null, 3, null, "2", "2"),
("Room Twin 01", 5000, "1000000", "2", "normal", "C?? tivi", null, null, "1 Xe m??y, 1 Xe ?????p", "4", "3"),
("Villa No Beach Front", 22000, "9000000", "8", "normal", "C?? h??? b??i", 300, 3, null, "3", "1"),
("House Princess 02", 1000, "4000000", "5", "normal", "C?? th??m b???p n?????ng", null, 2, null, "3", "2"),
("Room Twin 02", 3000, "900000", "2", "normal", "C?? tivi", null, null, "1 Xe m??y", "4", "3");

INSERT INTO  dich_vu_di_kem(ma_dich_vu_di_kem, ten_dich_vu_di_kem, gia, don_vi, trang_thai)
VALUES ("1", "Karaoke", 10000, "gi???", "ti???n nghi, hi???n t???i"),
("2","Thu?? xe m??y", 10000, "chi???c", "h???ng 1 xe"),
("3","Thu?? xe ?????p", 20000, "chi???c", "t???t"),
("4","Buffet bu???i s??ng", 15000, "su???t", " ?????y ????? ????? ??n, tr??ng mi???ng "),
("5","Buffet bu???i tr??a", 90000,"su???t", " ?????y ????? ????? ??n, tr??ng mi???ng "),
("6","Buffet bu???i t???i", 16000,"su???t", " ?????y ????? ????? ??n, tr??ng mi???ng ");

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

-- 2. k?? t??? ???H???, ???T??? ho???c ???K??? v?? c?? t???i ??a 15 k?? t??? --
SELECT 
    *
FROM
    nhan_vien
WHERE
    ho_ten REGEXP '^[HTK]'
        AND CHAR_LENGTH(ho_ten) <= 15 ;
        
        -- tu???i t??? 18 ?????n 50 tu???i v?? c?? ?????a ch??? ??? ??????? N???ng??? ho???c ???Qu???ng Tr?????? --
SELECT 
    *
FROM
    khach_hang
WHERE (YEAR(CURDATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50)
AND (dia_chi LIKE "%???? N???ng" OR dia_chi LIKE "%Qu???ng Tr???") ;

-- 4.?????m nh???ng kh??ch h??ng n??o c?? T??n lo???i kh??ch h??ng l?? ???Diamond??? --
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

-- 5.T???ng ti???n --

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


-- 6.qu?? 1 c???a n??m 2021 (Qu?? 1 l?? th??ng 1, 2, 3) --
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
            
-- 7.trong n??m 2020 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t ph??ng trong n??m 2021 --
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

-- 8.H???c vi??n s??? d???ng theo 3 c??ch kh??c nhau ????? th???c hi???n y??u c???u t??n kh??ng tr??ng nhau --
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

-- 9.trong n??m 2021 th?? s??? c?? bao nhi??u kh??ch h??ng th???c hi???n ?????t ph??ng --
SELECT 
    MONTH(ngay_lam_hop_dong) AS `month`, COUNT(ma_hop_dong)
FROM
    hop_dong
WHERE
    YEAR(ngay_lam_hop_dong) = 2021
GROUP BY `month`
ORDER BY `month`;

-- 10.	Hi???n th??? th??ng tin t????ng ???ng v???i t???ng h???p ?????ng th?? ???? s??? d???ng bao nhi??u d???ch v??? ??i k??m.
-- K???t qu??? hi???n th??? bao g???m ma_hop_dong, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc,
-- so_luong_dich_vu_di_kem (???????c t??nh d???a tr??n vi???c sum so_luong ??? dich_vu_di_kem).

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

-- 11.ten_loai_khach l?? ???Diamond??? v?? c?? dia_chi ??? ???Vinh??? ho???c ???Qu???ng Ng??i??? --
 
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
        OR dia_chi LIKE '%Qu???ng Ng??i');
        
-- 12.tien_dat_coc c???a t???t c??? c??c d???ch v??? ???? t???ng ???????c kh??ch h??ng --
-- ?????t v??o 3 th??ng cu???i n??m 2020 nh??ng ch??a t???ng ???????c kh??ch h??ng ?????t v??o 6 th??ng ?????u n??m 2021. --

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

-- 13.	Hi???n th??? th??ng tin c??c D???ch v??? ??i k??m ???????c s??? d???ng nhi???u nh???t b???i c??c Kh??ch h??ng ???? ?????t ph??ng -- 
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
    

-- 14.Hi???n th??? th??ng tin t???t c??? c??c D???ch v??? ??i k??m ch??? m???i ???????c s??? d???ng m???t l???n duy nh???t -- 
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

-- 15.	Hi???n thi th??ng tin c???a t???t c??? nh??n vi??n bao g???m ma_nhan_vien,
-- ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi m???i ch???
-- l???p ???????c t???i ??a 3 h???p ?????ng t??? n??m 2020 ?????n 2021 --

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
        
-- 16.	X??a nh???ng Nh??n vi??n ch??a t???ng l???p ???????c h???p ?????ng n??o t??? n??m 2019 ?????n n??m 2021 --
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
 
    

-- 17.	C???p nh???t th??ng tin nh???ng kh??ch h??ng c?? ten_loai_khach t??? Platinum l??n Diamond,
-- ch??? c???p nh???t nh???ng kh??ch h??ng ???? t???ng ?????t ph??ng v???i T???ng Ti???n thanh to??n trong n??m 2021 l?? l???n h??n 10.000.000 VN?? --

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
 
 -- 18.	X??a nh???ng kh??ch h??ng c?? h???p ?????ng tr?????c n??m 2021 (ch?? ?? r??ng bu???c gi???a c??c b???ng). --

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
    

-- 19	C???p nh???t gi?? cho c??c d???ch v??? ??i k??m ???????c s??? d???ng tr??n 10 l???n trong n??m 2020 l??n g???p ????i. --
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
 
 -- 20.	Hi???n th??? th??ng tin c???a t???t c??? c??c nh??n vi??n v?? kh??ch h??ng c?? trong h??? th???ng,
 -- th??ng tin hi???n th??? bao g???m id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi --
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


