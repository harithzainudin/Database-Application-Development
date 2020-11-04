drop table contractor cascade constraint;
drop table staffs cascade constraint;
drop table contract_class cascade constraint;
drop table zon cascade constraint;
drop table area cascade constraint;


create table contractor (
conid number constraint contractor_pk primary key,
companyname varchar2(40),
conowner varchar2(40),
conaddress varchar2(120),
conphone varchar2(11),
conprice number
);

insert into contractor values (111, 'Kawah Bulat Construction','Shamril bin Bahadon', '123 Jalan Kasawari, Bukit Serdang, Selangor','019-2033941', 10000);
insert into contractor values (112, 'Mekar Enterprise','Zaharuddin bin Ahmad', '3123 Bukit Damansara, Petaling Jaya, Selangor','013-1235567', 20000);
insert into contractor values (113, 'Sepadu Jaya Sdn Bhd','Murad bin Isnin', '29 Jalan Cecawi 4/4, Ampang, Kuala Lumpur','014-4568807',20000);
insert into contractor values (114, 'Inspirasi Gagah','Hanisah binti Kadar', '66, Presint 9, Putrajaya Wilayah Persekutuan','010-6649888',40000);

create table staffs (
staffid varchar2(6) constraint staff1_pk primary key,
staffname varchar2(40),
staffaddress varchar2(120),
staffphone varchar2(11),
staffmgrid varchar2(6),
staffzonid varchar2(1) 
);

insert into staffs values ('S00001', 'Azira binti Yaakub','3456 Seri Hartamas Petaling Jaya, Selangor','03-89462222', null,null);
insert into staffs values ('S02347', 'Sarah binti Mansor','S.1772 Serdang Lama, Selangor','03-89461771', 'S00001','A');
insert into staffs values ('S03333', 'Muhammad Fatah bin Adli','34 Jalan Bunga Raya, Permatang Pauh, Kelantan','03-89462345', 'S00001','B');
insert into staffs values ('S02378', 'Minhad bin Awang','7894 Taman Seri Serdang, Selangor','03-89466745', 'S00001','C');
insert into staffs values ('S01287', 'Azmi binti Wok','67 Puchong Intan, Puchong Selangor','03-89463422', 'S00001','D');

create table contract_class (
classlevel varchar2(3),
max_cost number,
min_cost number
);

insert into contract_class values ('I',10000, 0);
insert into contract_class values ('II',20000, 10001);
insert into contract_class values ('III',30000, 20001);
insert into contract_class values ('IV',40000, 30001);

create table zon (
zonid varchar2(1),
description varchar2(10)
);

insert into zon values ('A','Zon A');
insert into zon values ('B','Zon B');
insert into zon values ('C','Zon C');
insert into zon values ('D','Zon D');

create table area(
areaid varchar2(4),
areaname varchar2(40),
area_zonid varchar2(1),
area_type varchar2(20),
area_cost number,
area_conid number
);

insert into area values ('1000','Puchong Jaya 1-9', 'A','Residential',20000, 111);
insert into area values ('1001','Puchong Aman', 'A','Residential',15000,111);
insert into area values ('1002','Puchong Intan Blok A', 'A','Shoplot',25000,111);
insert into area values ('1003','Serdang Jaya', 'B','Residential',32000,112);
insert into area values ('1004','Taman Sri Serdang', 'B','Residential',20000,112);
insert into area values ('1005','Serdang Perdana', 'B','Shoplot',12000,113);
insert into area values ('1006','USJ 1- 10', 'C','Residential',40000,114);
insert into area values ('1006','Persiaran USJ', 'C','Persiaran',15000,114);
insert into area values ('1007','Putra Height', 'D','Residential',24000,114);



