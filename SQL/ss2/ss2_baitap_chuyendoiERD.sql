drop database if exists chuyen_doi_EDR;

create database if not exists chuyen_doi_EDR;
use chuyen_doi_EDR;

CREATE TABLE PHIEUXUAT (
    SoPX INT,
    NgayXuat DATE,
    CONSTRAINT PHIEUXUAT_pk PRIMARY KEY (SoPX)
);

CREATE TABLE VATTU (
    MaVTU INT,
    TenVTU VARCHAR(55),
    CONSTRAINT VATTU_pk PRIMARY KEY (MaVTU)
);

CREATE TABLE chi_tiet_phieu_suat (
    PHIEUXUAT_SoPX INT,
    VATTU_MaVTU INT,
    DGXuat VARCHAR(55),
    SLXuat INT,
    PRIMARY KEY (PHIEUXUAT_SoPX , VATTU_MaVTU),
    FOREIGN KEY (PHIEUXUAT_SoPX)
        REFERENCES PHIEUXUAT (SoPX),
    FOREIGN KEY (VATTU_MaVTU)
        REFERENCES VATTU (MaVTU)
);

CREATE TABLE PHIEUNHAP (
    SoPN INT,
    NgayNhap DATE,
    PRIMARY KEY (SoPN)
);

CREATE TABLE chi_tiet_phieu_nhap (
    chi_tiet_MaVTU INT,
    chi_tiet_SoPN INT,
    DGNhap VARCHAR(55),
    SLNhap INT,
    PRIMARY KEY (chi_tiet_MaVTU , chi_tiet_SoPN),
    FOREIGN KEY (chi_tiet_MaVTU)
        REFERENCES VATTU (MaVTU),
    FOREIGN KEY (chi_tiet_SoPN)
        REFERENCES PHIEUNHAP (SoPN)
);

CREATE TABLE NHACC (
    MaNCC VARCHAR(45),
    TenNCC VARCHAR(45),
    DiaChi VARCHAR(45),
    PRIMARY KEY (MaNCC)
);

CREATE TABLE DONDH (
    SoDH INT,
    NgayDH DATE,
    DONDH_MaNCC VARCHAR(45),
    PRIMARY KEY (SoDH),
    FOREIGN KEY (DONDH_MaNCC)
        REFERENCES NHACC (MaNCC)
);

CREATE TABLE chi_tiet_don_dat_hang (
    chi_tiet_don_dat_hang_MaVTU INT,
    chi_tiet_don_dat_hang_SoDH INT,
    PRIMARY KEY (chi_tiet_don_dat_hang_MaVTU , chi_tiet_don_dat_hang_SoDH),
    FOREIGN KEY (chi_tiet_don_dat_hang_MaVTU)
        REFERENCES VATTU (MaVTU),
    FOREIGN KEY (chi_tiet_don_dat_hang_SoDH)
        REFERENCES DONDH (SoDH)
);

CREATE TABLE SDT (
    so_dien_thoai INT,
    SDT_NHACC VARCHAR(45),
    PRIMARY KEY (so_dien_thoai),
    FOREIGN KEY (SDT_NHACC)
        REFERENCES NHACC (MaNCC)
);






