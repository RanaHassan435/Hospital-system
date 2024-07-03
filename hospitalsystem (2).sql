CREATE DATABASE hospitalsystem;
use hospitalsystem;
create table patient (
Fullname varchar(40) not null,
age int,
idnational int,
doctorid int,
nursesid int,
Bdate date,
Address varchar(100),
gender varchar(20) not null,
phone int,
primary key (idnational)
);

create table inpatient (
name varchar(40) not null,
id int,
email varchar(100),
patientnationalid int,
primary key (id)
);
create table outpatient (
name varchar(40) not null,
id int,
email varchar(100),
patientnationalid int,
primary key (id)
);
create table bills (
treatmentbill varchar(40) not null,
billcode int,
numberofdays int,
patientnationalid int,
primary key (billcode)
);
create table DPARTMENT (
 name varchar(40) not null,
location varchar(40),
numberofemployees int,
manger varchar(40),
primary key (name)
);
create table clnics (
name varchar(40) not null,
type varchar(40),
dpartmentname varchar(40),
phonenumber int,
floor int,
primary key (name)
);
create table rooms (
dpartmentname varchar(40),
number int,
floor int,
primary key (number)
);
create table operations (
dpartmentname varchar(40),
number int,
floor int,
primary key (number)
);
create table icu (
dpartmentname varchar(40),
number int,
floor int,
primary key (number)
);
create table pharmacy (
dpartmentname varchar(40) not null,
id int,
medicine varchar(100),
numberofemployees int,
primary key (id)
);
create table dpartmentlocaion(
dpartmentname varchar(40) not null,
location varchar(100),
primary key (dpartmentname,location)
);
create table treatment (
name varchar(40) not null,
serialnumber int,
doctorid int,
pharmacyid int,
primary key (serialnumber)
);
create table patienttreatment (
serialnumber int,
nationalid int,
primary key (serialnumber,nationalid)
);
create table employee (
name varchar(40) not null,
id int,
salary int,
email varchar(100),
dpartmentname varchar(40),
primary key (id)
);
create table workers (
name varchar(40) not null,
id int,
employeeid int,
email varchar(100),
primary key (id)
);
create table doctors (
name varchar(40) not null,
id int,
employeeid int,
email varchar(100),
primary key (id)
);
create table nurses (
name varchar(40) not null,
id int,
employeeid int,
email varchar(100),
primary key (id)
);
create table managers (
name varchar(40) not null,
id int,
employeeid int,
email varchar(100),
primary key (id)
);
create table disease (
name varchar(40) not null,
degreeofdisease varchar(40),
symptoms varchar(100),
primary key (name)
);
create table patientdisease (
diseasename varchar(40) not null,
patientnationalid int,
primary key (diseasename,patientnationalid)
);
ALTER TABLE patient
ADD FOREIGN KEY(doctorid)
REFERENCES doctors(id);
ALTER TABLE patient
ADD FOREIGN KEY(nursesid)
REFERENCES nurses(id);
ALTER TABLE inpatient
ADD FOREIGN KEY(patientnationalid)
REFERENCES patient(idnational);
ALTER TABLE outpatient
ADD FOREIGN KEY(patientnationalid)
REFERENCES patient(idnational);
ALTER TABLE bills
ADD FOREIGN KEY(patientnationalid)
REFERENCES patient(idnational);
ALTER TABLE clnics
ADD FOREIGN KEY(dpartmentname)
REFERENCES dpartment(name);
ALTER TABLE rooms
ADD FOREIGN KEY(dpartmentname)
REFERENCES dpartment(name);
ALTER TABLE operations
ADD FOREIGN KEY(dpartmentname)
REFERENCES dpartment(name);
ALTER TABLE icu
ADD FOREIGN KEY(dpartmentname)
REFERENCES dpartment(name);
ALTER TABLE pharmacy
ADD FOREIGN KEY(dpartmentname)
REFERENCES dpartment(name);
ALTER TABLE treatment
ADD FOREIGN KEY(pharmacyid)
REFERENCES pharmacy(id);
ALTER TABLE patienttreatment
ADD FOREIGN KEY(nationalid)
REFERENCES patient(idnational);
ALTER TABLE employee
ADD FOREIGN KEY(dpartmentname)
REFERENCES dpartment(name);
ALTER TABLE workers
ADD FOREIGN KEY(employeeid)
REFERENCES employee(id);
ALTER TABLE doctors
ADD FOREIGN KEY(employeeid)
REFERENCES employee(id);
ALTER TABLE nurses
ADD FOREIGN KEY(employeeid)
REFERENCES employee(id);
ALTER TABLE managers
ADD FOREIGN KEY(employeeid)
REFERENCES employee(id);
ALTER TABLE patientdisease
ADD FOREIGN KEY(patientnationalid)
REFERENCES patient(idnational);

select* from patient;
INSERT INTO patient
VALUES ('Ahmed ali hosny' ,  60 , 200003060, 2020014, 2020022 , '1966-11-16' , 'alex' , 'female' , 01114562100);
INSERT INTO patient
VALUES ('Alaa Ahmed medhat' , 70 , 200003061,60499, 2057 ,'1930-12-18', 'fayoum city' , 'female' ,01004994561);
iNSERT INTO patient
VALUES ('ahmed mahmoud ahmed' , 20 ,300003061, 60399 , 5032 , '2001-9-7' , 'cairo' , 'male' , 012555555);
iNSERT INTO patient
VALUES ('mariam ahmed hemada' , 24 ,300003072, 60399 , 5032 , '1994-2-4' , 'october' , 'female' , 012555559);
iNSERT INTO patient
VALUES ('aya mohamed elsaeed' , 32 ,300003321, 60308 , 6840 , '1982-1-9' , 'kalyoub' , 'female' , 012465559);
select* from inpatient;
Insert into inpatient values ('rames',201456, 'ramesh@gmail.com',300003321);
Insert into inpatient values('rakes',254650, 'rakesh@gmail.com',300003072);
Insert into inpatient values(' mohamed',254687, 'mohamed@gamil.com',300003061);
Insert into inpatient values('amira ',253004, 'amira@gamil.com',200003061);


select* from outpatient;
Insert into outpatient values ('rehab',10016,'rehaoutpatientbb@gmail.com',300003321);
Insert into outpatient values ('ahmed' ,20406,'ahmed@gmail.com',300003061);
Insert into outpatient values ('Noha',10659,'Noha@gmail.com',200003061);
Insert into outpatient values ('laila',10655,'lelelee@gmail.com',200003061);


select* from bills;
Insert into bills values ('cancer',232,3,200003061);
Insert into bills values('Heart treatments',30,6,200003060);
Insert into bills values('therapy' ,40,1,300003072);
Insert into bills values('lung surgery' ,46,150,300003072);
Insert into bills values('chest rumor' ,32,1,300003072);

select * from dpartment;
Insert into dpartment values ('breast screening','floor5',10,'manar');
Insert into dpartment values('ICU','floor3',11,'monda');
Insert into dpartment values('general surgeclnicsry', 'floor' ,20,'youssef');
Insert into dpartment values('urology', 'floor5' ,40,'seif');
Insert into dpartment values('surgery', 'floor5' ,20,'hemada');

select* from clnics;
Insert into clnics values ('care',' medical', 'casualty',01121129506, 1);
Insert into clnics values('medicine', 'OP', 'casualty',0122543899,3);
Insert into clnics values('cancer', 'mutation', 'casualty',010225436,6);
Insert into clnics values('dentistry', 'medical', 'casualty',010225436,6);

select* from rooms;
Insert into rooms values ('breast screening',33,2);
Insert into rooms values('hematology',22,3);
Insert into rooms values('ICU',56,1);

select* from operations;
Insert into operations values ('urology' ,1,3);
Insert into operations values('surgery',5,3);
Insert into operations values('surgery',4,3);
Insert into operations values('surgery',6,3);
Insert into operations values('surgery',3,3);
Insert into operations values('surgery',21,6);
Insert into operations values('surgery',12,9);
Insert into operations values('surgery',17,7);


select* from icu;
Insert into icu values ( 'breast screening',9, 1);
Insert into icu values('ICU',3,6);
Insert into icu values('general surgeclnicsry',6,7 );

select* from pharmacy;
Insert into pharmacy values ('breast screening',09899098, 'capsules',10);
Insert into pharmacy values('Hematology',89272920, 'drops',8);
Insert into pharmacy values('general surgery' ,8901838, 'injection', 29 );


select* from dpartmentlocaion;
Insert into dpartmentlocaion values ('breast',' aldokki' );
Insert into dpartmentlocaion values('Hematolog','madinat nassr');
Insert into dpartmentlocaion values( ' generalsurgery', 'maadi');

select* from treatment;
Insert into treatment values (' cancer',20003,26941,09899098);
Insert into treatment values('Liver',209867,60499,8901838);
Insert into treatment values( 'open heart',789076,60308,89272920);

select* from patienttreatment;
Insert into patienttreatment values (20003, 200003061);
Insert into patienttreatment values(789076, 300003321);
Insert into patienttreatment values(209867, 300003072);

select* from employee;
Insert into employee values ('mona',1050,5000,'mona@gmail.com','dermatology');
Insert into employee values('hala',3050,6000,'hala@gmail.com','heartsurgery');
Insert into employee values('ahmed',2040,4500,'ahmed@gmail.com','surgery');
Insert into employee values('shrief',2070,4600,'ahmed@gmail.com','surgery');
Insert into employee values('mohamed',2080,4480,'mohamed@gmail.com','heartsurgery');
Insert into employee values('reem',2082,4486,'erl@gmail.com','ENT');
Insert into employee values('manar',2085,4486,'manarrrr@gmail.com','manegment');
Insert into employee values('mondar',2086,15000,'mondaar@gmail.com','manegment');
Insert into employee values('youssef',2090,15000,'mondaar@gmail.com','manegment');
Insert into employee values('selim',2091,700,'soly@gmail.com','workers');
Insert into employee values('hamdy',2092,740,'hamdy@gmail.com','workers');
Insert into employee values('helmy',2093,740,'helmy@gmail.com','workers');






select* from workers;
Insert into workers values ('selim',6363,2091,'ahmed@gmail.com');
Insert into workers values('hamdy',6362,2092,'ha@gmail.com');
Insert into workers values( 'helmy',6364,2093,'helmy@gmail.com');

select* from doctors;
Insert into doctors values ('Hany',26941,26940,'Hdoctorsany@gmail.com');
Insert into doctors values('Hossam',60369,26944,'hossam@gamil.com' );
Insert into doctors values('amany',60308,26966,'hossam@gamil.com' );
Insert into doctors values('manal',60399,26955,'hossam@gamil.com' );
Insert into doctors values('omnia',60499,26944,'hossam@gamil.com' );



select* from nurses;
Insert into nurses values ('hala' ,5032,1050,'hala@gmail.com');
insert  into nurses values('ahmed',6840,2070, 'Ali@gamil.com');
Insert into nurses values('mona',2057, 1050,'mona@gmail.com');
Insert into nurses values('mohamed',2059, 2040,'mo@gmail.com');



select* from managers;
Insert into managers values ( 'manar',2029890, 2085, 'manar@gamil.com');
Insert into managers values('Monda',2098098,2086, 'monda@gamil.com');
Insert into managers values('Youssef',209873,2090,'youssef@gamil.com' );

select* from disease;
Insert into disease values ('mutation' ,2, 'hair fall');
Insert into disease values('covid 19', 1, 'headache');
Insert into disease values( 'syndrome', 3, 'small noses');




select* from patientdisease;
Insert into patientdisease values ('covid 19',200003061);
Insert into patientdisease values('mutation' ,300003072);
Insert into patientdisease values('syndrome' , 300003321);

UPDATE doctors
SET name = 'Hania', email= 'Hania.he@gmail.com'
WHERE id= 26941 ;

UPDATE operations
SET  floor= 3 
WHERE number=21 ;


DELETE FROM workers  WHERE id = 6363 ;

DELETE FROM ICU  WHERE number = 9;



SELECT employeeid
FROM workers
INNER JOIN employee
ON workers.employeeid = employee.id;


Select * from patient
Where fullname like '%Ahmed%' ;

SELECT age 
FROM patient
WHERE age  BETWEEN 10  AND 40 ;

SELECT * FROM treatment
ORDER BY serialnumber DESC;
