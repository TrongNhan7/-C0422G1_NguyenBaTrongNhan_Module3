DROP DATABASE IF EXISTS chuyen_doi_erd;

CREATE DATABASE IF NOT EXISTS chuyen_doi_erd;
USE chuyen_doi_erd;

CREATE TABLE phieuxuat (
    sopx INT,
    ngayxuat DATE,
    CONSTRAINT phieuxuat_pk PRIMARY KEY (sopx)
);

CREATE TABLE vattu (
    mavtu INT,
    tenvtu VARCHAR(55),
    CONSTRAINT vattu_pk PRIMARY KEY (mavtu)
);

CREATE TABLE chi_tiet_phieu_suat (
    phieuxuat_SoPX INT,
    vatu_mavtu INT,
    dgxuat VARCHAR(55),
    slxuat INT,
    PRIMARY KEY (phieuxuat_sopx , vatu_mavtu),
    FOREIGN KEY (phieuxuat_sopx)
        REFERENCES phieuxuat (sopx),
    FOREIGN KEY (vatu_mavtu)
        REFERENCES vattu (mavtu)
);

CREATE TABLE phieunhap (
    sopn INT,
    ngaynhap DATE,
    PRIMARY KEY (sopn)
);

CREATE TABLE chi_tiet_phieu_nhap (
    chi_tiet_mavtu INT,
    chi_tiet_sopn INT,
    dgnhap VARCHAR(55),
    slnhap INT,
    PRIMARY KEY (chi_tiet_mavtu , chi_tiet_sopn),
    FOREIGN KEY (chi_tiet_mavtu)
        REFERENCES vattu (mavtu),
    FOREIGN KEY (chi_tiet_sopn)
        REFERENCES phieunhap (sopn)
);

CREATE TABLE nhacc (
    mancc VARCHAR(45),
    tenncc VARCHAR(45),
    diachi VARCHAR(45),
    PRIMARY KEY (mancc)
);

CREATE TABLE dondh (
    sodh INT,
    ngaydh DATE,
    dondh_mancc VARCHAR(45),
    PRIMARY KEY (sodh),
    FOREIGN KEY (dondh_mancc)
        REFERENCES nhacc (mancc)
);

CREATE TABLE chi_tiet_don_dat_hang (
    chi_tiet_don_dat_hang_mavtu INT,
    chi_tiet_don_dat_hang_sodh INT,
    PRIMARY KEY (chi_tiet_don_dat_hang_mavtu , chi_tiet_don_dat_hang_sodh),
    FOREIGN KEY (chi_tiet_don_dat_hang_mavtu)
        REFERENCES VATTU (mavtu),
    FOREIGN KEY (chi_tiet_don_dat_hang_sodh)
        REFERENCES dondh (sodh)
);

CREATE TABLE sdt (
    so_dien_thoai INT,
    sdt_nhacc VARCHAR(45),
    PRIMARY KEY (so_dien_thoai),
    FOREIGN KEY (sdt_nhacc)
        REFERENCES nhacc (mancc)
);






