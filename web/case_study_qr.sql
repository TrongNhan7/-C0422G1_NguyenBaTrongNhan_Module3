use case_study_2;

delimiter $$
create procedure select_all_employee ()
begin
SELECT 
    nhan_vien.ma_nhan_vien,
    nhan_vien.ho_ten,
    nhan_vien.ngay_sinh,
    nhan_vien.so_cmnd,
    nhan_vien.luong,
    nhan_vien.so_dien_thoai,
    nhan_vien.email,
    nhan_vien.dia_chi,
    vi_tri.ten_vi_tri,
    trinh_do.ten_trinh_do,
    bo_phan.ten_bo_phan
FROM
    nhan_vien
        JOIN
    vi_tri ON nhan_vien.ma_vi_tri = vi_tri.ma_vi_tri
        JOIN
    trinh_do ON nhan_vien.ma_trinh_do = trinh_do.ma_trinh_do
        JOIN
    bo_phan ON nhan_vien.ma_bo_phan = bo_phan.ma_bo_phan;
end $$
delimiter ;

call select_all_employee;

drop procedure select_all_contract;
delimiter $$
create procedure select_all_contract()
begin
SELECT 
	hd.ma_hop_dong AS ma_hop_dong,
	dv.ten_dich_vu AS ten_dich_vu,
    kh.ho_ten AS ho_ten,
    nv.ho_ten AS ho_ten_nv,
	hd.ngay_lam_hop_dong AS ngay_lam_hop_dong,
    hd.ngay_ket_thuc AS ngay_ket_thuc,
	tien_dat_coc,
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
       LEFT JOIN
   nhan_vien nv ON hd.ma_nhan_vien = nv.ma_nhan_vien
GROUP BY hd.ma_hop_dong;
end $$
delimiter ;
call select_all_contract();

-- tim nhieu truong
drop procedure find_by_sp;

delimiter $$
create procedure find_by_sp (name_key varchar(55))
begin
SELECT 
   *
FROM
    khach_hang
        JOIN
    loai_khach ON khach_hang.ma_loai_khach = loai_khach.ma_loai_khach
    where khach_hang.ho_ten like concat("%",name_key,"%") 
    or loai_khach.ten_loai_khach like concat("%",name_key,"%") ;
end $$
delimiter ;

call find_by_sp("nhan");

