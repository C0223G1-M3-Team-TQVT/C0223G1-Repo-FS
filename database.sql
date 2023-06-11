create database bakery_management;

use bakery_management;

create table chuc_vu(
ma_chuc_vu int auto_increment primary key,
ten_chuc_vu varchar(50)
);

create table nhan_vien(
ma_nhan_vien int auto_increment primary key,
ten_nhan_vien varchar(50) not null,
cccd varchar(15) not null,
sdt varchar(15) not null unique,
dia_chi varchar(50),
ma_chuc_vu int,
foreign key (ma_chuc_vu) references chuc_vu(ma_chuc_vu) on delete set null
);

create table `user`(
sdt varchar(15) primary key,
foreign key (sdt) references nhan_vien(sdt) on delete cascade,
mat_khau varchar(20)
);

create table khach_hang(
ma_khach_hang int auto_increment primary key,
ten_khach_hang varchar(50),
sdt varchar(15)
);

create table loai_banh(
ma_loai_banh int auto_increment primary key,
ten_loai_banh varchar(50)
);

create table hoa_don(
ma_hoa_don int auto_increment primary key,
ma_khach_hang int,
foreign key (ma_khach_hang) references khach_hang(ma_khach_hang) on delete set null,
ma_nhan_vien int,
foreign key (ma_nhan_vien) references nhan_vien(ma_nhan_vien) on delete set null,
ngay_dat_hang datetime,
dia_chi_giao_hang varchar(250),
trang_thai bit,
mo_ta varchar(100)
);

create table banh(
ma_banh int auto_increment primary key,
ten_banh varchar(50),
ma_loai_banh int,
foreign key (ma_loai_banh) references loai_banh(ma_loai_banh) on delete set null,
gia double,
so_luong_hien_co int,
anh_banh varchar(1000)
);

create table hoa_don_chi_tiet(
ma_banh int,
foreign key (ma_banh) references banh(ma_banh) on delete cascade,
ma_hoa_don int,
foreign key (ma_hoa_don) references hoa_don(ma_hoa_don) on delete cascade,
primary key (ma_banh, ma_hoa_don),
so_luong int
);

insert into chuc_vu(ten_chuc_vu)
values ('quan li'), ('thu ngan'), ('phuc vu'), ('bao ve');
 
 insert into nhan_vien (ten_nhan_vien, cccd, sdt, dia_chi, ma_chuc_vu)
 values('vu', '123456789', '0123456789', 'DN', 1),
 ('vu1', '123456789', '1123456789', 'DN', 2),
 ('vu2', '123456789', '2123456789', 'DN', 2),
 ('vu3', '123456789', '3123456789', 'DN', 3),
 ('vu4', '123456789', '4123456789', 'DN', 3),
 ('vu5', '123456789', '5123456789', 'DN', 3),
 ('vu6', '123456789', '6123456789', 'DN', 4),
 ('vu7', '123456789', '7123456789', 'DN', 4);
 
 insert into `user` (sdt, mat_khau)
 values('0123456789','123456'),
 ('1123456789','123456'),
 ('2123456789','123456');
 
 insert into khach_hang(ten_khach_hang, sdt)
 values('vu1', '111111111'),
 ('vu2', '222222222'),
 ('vu3', '33333333'),
 ('vu4', '44444444'),
 ('vu5', '555555555'),
 ('vu6', '6666666666');
 
 insert into loai_banh(ten_loai_banh)
 value('banh ngot'),
 ('banh lanh'),
 ('banh mi'),
 ('pizza'),
 ('banh kem'),
 ('banh kem nho'),
 ('banh khac');
 
 insert into banh(ten_banh, ma_loai_banh, gia, so_luong_hien_co)
 values ('banh mi thit', 3 , 15,20),
 ('banh mi trung', 3 , 10,20),
 ('banh mi pate', 3 , 15,20),
 ('mousse chanh day', 2 ,30,20),
 ('mousse dau', 2 , 32,20),
 ('cheese chanh day', 2 , 35,20),
 ('banh bong lan', 1 , 6,20),
 ('banh quy', 1 , 7,20),
 ('pizza thit', 4 ,45,20),
 ('pizza tom', 4 , 50,20),
 ('banh sinh nhat 1', 5 , 60,20),
 ('banh sinh nhat 2', 5 , 70,20),
 ('banh sinh nhat 3', 5 , 80,20),
 ('su kem 1', 6 , 20,20),
 ('su kem 2', 6 , 22,20),
 ('banh trung thu 1', 7 , 70,20),
 ('banh trung thu 2', 7 , 80,20);
 
 

 
