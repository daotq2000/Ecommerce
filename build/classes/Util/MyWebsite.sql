
Create database MyWebsite
use MyWebsite
CREATE TABLE Producer
(
IdProducer varchar(10) not null,
NameProducer nvarchar(50) not null,
constraint pk_Producer primary key(IdProducer)
)
CREATE TABLE TypeProduct(
IdProductType varchar(10) not null,
NameProductType nvarchar(50) not null,
constraint ProductType primary key(IdProductType)
)
CREATE TABLE Product(
IdProduct varchar(10) not null,
NameProduct nvarchar(50) not null,
PriceProduct int not null,
Amout int not null,
ImageProduct varchar(50) not null,
DescriptionProduct nvarchar(50) null,
IdProducer varchar(10) not null,
IdProductType varchar(10) not null,
constraint pk_Product primary key(IdProduct),
constraint fk_IdProducer_Product foreign key(IdProducer) references Producer(IdProducer),
constraint fk_IdProductType_Product foreign key(IdProductType) references TypeProduct(IdProductType)
)
Create Table Customer(
UserCustomer varchar(20) not null,
PasswordCustomer varchar(20) not null,
NameCustomer nvarchar(50) not null,
Email varchar(50) null,
PhoneNumber nvarchar(12) not null,
RoleCustomer BIT default 0,
AddressCustomer nvarchar(200) not null
constraint pk_Customer primary key(UserCustomer)
)
Create Table Invoice(
IdInvoice int Identity(1,1) not null,
IdProduct varchar(10) not null,
Amount int not null,
DateOrder date default getdate(),
Total int not null,
UserCustomer varchar(20) not null,
constraint pk_Invoice primary key(IdInvoice),
constraint fk_UserCustomer_Customer foreign key(UserCustomer) references Customer(UserCustomer),
constraint fk_IdProduct_Customer foreign key(IdProduct) references Product(IdProduct)

)

---- Insert DataProducer

Insert into Producer values('Pc01','Apple')
Insert into Producer values('Pc02','SamSung')
Insert into Producer values('Pc03','Acer')
Insert into Producer values('Pc04','Dell')
Insert into Producer values('Pc05','Xiaomi')
Insert into Producer values('Pc06','Lenovo')
Insert into Producer values('Pc07','Vivo')
Insert into Producer values('Pc08','Huawei')
Insert into Producer values('Pc09','Blackberry')
Insert into Producer values('Pc10','Iphone')
select * from Producer
------------ Insert TypeProduct
Insert into TypeProduct values('T01',N'Điện Thoại')
Insert into TypeProduct values('T02',N'Laptop')
Insert into TypeProduct values('T03',N'Máy Tính Bảng')
Insert into TypeProduct values('T04',N'Phụ Kiện Điện Thoại')

select * from TypeProduct
-----------------Insert Product

insert into Product values('SP001',N'Iphone 11',1469,20,'SP1.jpg',N'Iphone 11- Sản phẩm mới nhất 2019','Pc10','T01')
insert into Product values('SP002',N'Sam Sung A10 Pro',216,50,'SP2.jpg',N'Sam Sung A10 Pro- Sản phẩm hot nhất 2018','Pc02','T01')
insert into Product values('SP003',N'Xiaomi',110,100,'SP3.jpg',N'Xiaomi- Sản phẩm ổn định giá thành tốt','Pc05','T01')
insert into Product values('SP004',N'Heawei 160i',50,50,'SP4.jpg',N'Heawei 160i- Sự trở lại của Heawei','Pc08','T01')
insert into Product values('SP005',N'Black Berry E680',30,10,'SP5.jpg',N'Sản Phẩm có tính bảo mật tốt nhất','Pc09','T01')
insert into Product values('SP006',N'Lenovo ThinkPad E480',800,20,'SP6.jpg',N'Lenovo ThinkPad E480 sang trọng thời thượng','Pc06','T02')
insert into Product values('SP007',N'MacBook Pro 16',2000,50,'SP7.jpg',N'MacBook Pro 16 sức mạnh và sự sang trọng ','Pc01','T02')
insert into Product values('SP008',N'Hp VivoBook Pro',1150,50,'SP8.jpg',N'Hp VivoBook Pro đẹp-thanh lịch','Pc06','T02')
insert into Product values('SP009',N'Dell Inspiron',1200,50,'SP9.jpg',N'Dell Inspiron cực trâu, cực bền','Pc04','T02')
insert into Product values('SP0010',N'Acer Nitro 5',1200,10,'SP10.jpg',N'Acer Nitro 5- Dòng máy gaming ','Pc03','T02')

select * from Product
Alter table Invoice
add constraint fk_UserCustomer_Customer foreign key(UserCustomer) references Customer(UserCustomer)
Alter table Invoice
add constraint fk_IdProduct_Customer foreign key(IdProduct) references Product(IdProduct)

drop table Customer 
---------------------------------------Insert Customer
insert into Customer values('admin','123',N'Trần Quang Đạo','daotqph08312@fpt.edu.vn','0374550289',1,N'nghách 58/63 đường nguyễn khánh toàn, cầu giấy, hà nội')
insert into Customer values('anhkim','123',N'Trần Kim Anh','anhkim@fpt.edu.vn','03284786289',0,N'số 10 đường trần hưng đạo, quế võ,bắc ninh')

select * from Customer