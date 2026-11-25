-- TMart Company database creatiom -- 
CREATE database TMart 
Go

--  Table 1 -- 
create table department(
DID int primary key, 
Dname varchar(50), 
Dlocation varchar(20)) ; 

--  Table 2 -- 

create table customer (
CID int primary key , 
CName varchar (100) , 
ProductPurchased varchar(30) , 
); 
--  Table 3 -- 

create table employee (
EID int primary key, 
FirstName varchar (25), 
LastName varchar(25), 
Salary decimal (15, 2) ); 

--  Table 4 -- 

create table employee_department  (
EID int , 
DID int , 
foreign key (EID) references employee(EID), 
foreign key (DID ) references department(DID), 
dep_no int
); 

--  Table 5 -- 
create table employee_projects1
(
PID int primary key, 
EID int , 
DID int , 
No_of_hours_worked int , 

 foreign key (EID) references employee(EID), 
 foreign key (DID) references department (DID)  ); 

-- insert into department values -- 
insert into department values
( 1, 'Groceries', 'Ajman') , 
 ( 2, 'Beauty', 'Ajman') , 
 ( 3, 'Bakery', 'Abudhabi') , 
 ( 4, 'Beverages', 'Ajman') , 
 ( 5, 'Vegetables ', 'Dubai') ; 

-- insert into customer values -- 

insert into customer values 
( 11, 'Shanthi', 'Loreal ' ) , 
(12, 'Thuki', 'Toys ') , 
( 13, 'Muthu ' , ' Bread' ) , 
(14, ' Sam', ' Tomato' ) , 
(15, ' Angel ' , ' Toor dal ' ) ; 

-- insert into employee values -- 
insert into employee values 
( 111, ' Shakthi ', 'SIva ', 20000.50 ) , 
(112, ' Mina ', 'Kumar ' , 25000), 
( 113, ' Ravi ', ' Chader ', 30000.50) , 
(114, 'Amina ' , 'Mohammed', 35000) , 
(115, ' Shalini', 'Kanaga ' , 40000) ; 

-- insert into employee department -- 

insert into employee_projects1 ( PID, No_of_hours_worked) values 
( 1001, 30) ; 

select * from employee_projects1; 
