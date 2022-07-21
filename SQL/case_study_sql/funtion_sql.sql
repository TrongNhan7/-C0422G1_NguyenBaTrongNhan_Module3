use case_study;

DROP function IF EXISTS checkCorrect;

delimiter $$
create function checkCorrect ( 
    ma_nhan_vien_f INT,
    ma_khach_hang_f INT ,
    ma_dich_vu_f INT)
RETURNS boolean
deterministic
begin 
if not exists (select ma_nhan_vien_f from nhan_vien where ma_nhan_vien = ma_nhan_vien_f) or
	not exists ( select ma_khach_hang from khach_hang where ma_khach_hang = ma_khach_hang_f) or
	not exists ( select ma_dich_vu_f from dich_vu where ma_dich_vu = ma_dich_vu_f) then
    signal sqlstate '45000' set message_text = 'ma nhan vien/ ma khach hang/ ma dich vu khong ton tai';
	return false;
end if;
return true;
end $$
delimiter ;

select checkCorrect("7", "7", "1");

select * from khach_hang;