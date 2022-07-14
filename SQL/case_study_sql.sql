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
    ma_loai_khach INT NOT NULL,
    ho_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    gioi_tinh BIT(1) NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL UNIQUE,
    so_dien_thoai VARCHAR(45) NOT NULL UNIQUE,
    email VARCHAR(45) NOT NULL UNIQUE,
    dia_chi VARCHAR(45) NOT NULL,
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
    chi_phi_thue DOUBLE NOT NULL,
    so_nguoi_toi_da INT NOT NULL,
    ma_kieu_thue INT NOT NULL,
    ma_loai_dich_vu INT NOT NULL,
    tieu_chuan_phong VARCHAR(45) NOT NULL,
    mo_ta_tien_nghi_khac VARCHAR(45) NOT NULL,
    dien_tich_ho_boi DOUBLE NOT NULL,
    so_tang INT NOT NULL,
    dich_vu_mien_phi_di_kem TEXT NOT NULL,
    PRIMARY KEY (ma_dich_vu),
    FOREIGN KEY (ma_kieu_thue)
        REFERENCES kieu_thue (ma_kieu_thue),
    FOREIGN KEY (ma_loai_dich_vu)
        REFERENCES loai_dich_vu (ma_loai_dich_vu)
);

CREATE TABLE dich_vu_di_kem (
    ma_dich_vu_di_kem INT NOT NULL,
    ten_dich_vu_di_kem VARCHAR(45) NOT NULL,
    gia DOUBLE NOT NULL,
    don_vi VARCHAR(10) NOT NULL,
    trang_thai VARCHAR(45) NOT NULL,
    PRIMARY KEY (ma_dich_vu_di_kem)
);


CREATE TABLE hop_dong (
    ma_hop_dong INT AUTO_INCREMENT,
    ngay_lam_hop_dong DATETIME NOT NULL,
    ngay_ket_thuc DATETIME NOT NULL,
    tien_dat_coc DOUBLE NOT NULL,
    ma_nhan_vien INT NOT NULL UNIQUE,
    ma_khach_hang INT NOT NULL UNIQUE,
    ma_dich_vu INT NOT NULL,
    PRIMARY KEY (ma_hop_dong),
    FOREIGN KEY (ma_nhan_vien)
        REFERENCES nhan_vien (ma_nhan_vien),
    FOREIGN KEY (ma_khach_hang)
        REFERENCES khach_hang (ma_khach_hang),
    FOREIGN KEY (ma_dich_vu)
        REFERENCES dich_vu (ma_dich_vu)
);
CREATE TABLE hop_dong_chi_tiet (
    ma_hop_dong_chi_tiet INT NOT NULL UNIQUE,
    ma_hop_dong INT NOT NULL,
    ma_dich_vu_di_kem INT NOT NULL,
    so_luong INT NOT NULL,
    PRIMARY KEY (ma_hop_dong_chi_tiet),
    FOREIGN KEY (ma_hop_dong)
        REFERENCES hop_dong (ma_hop_dong),
    FOREIGN KEY (ma_dich_vu_di_kem)
        REFERENCES dich_vu_di_kem (ma_dich_vu_di_kem)
);

insert into vi_tri(ma_vi_tri,ten_vi_tri) values ("1","Quản Lý"),("2","Nhân Viên");
insert into trinh_do(ma_trinh_do,ten_trinh_do) values ("1","Trung Cấp"),("2","Cao Đẳng"),
("3","Đại Học"),("4","Sau Đại Học");
insert into bo_phan(ma_bo_phan,ten_bo_phan) values ("1","Sale-Marketing"),("2","Hành chính"),
("3","Phục vụ"),("4","Phục vụ");
insert into nhan_vien(ho_ten,ngay_sinh,so_cmnd,luong,so_dien_thoai,email,dia_chi,ma_vi_tri,ma_trinh_do,ma_bo_phan)
values ("Nguyễn Văn An","1970-11-07","456231786","10000000","0901234121",	
"annguyen@gmail.com","295 Nguyễn Tất Thành, Đà Nẵng","1","3","1"),








