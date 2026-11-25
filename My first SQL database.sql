create table UAEUsers(UserID int primary key, Uname varchar (40), EmailID varchar(50), City varchar(15)); 
insert into UAEUsers VALUES (1, 'shan', 'shanregal@gmail.com', 'Sharjah') ; 
insert into UAEUsers VALUES (2, 'prak', 'mechpraksh@gmail.com', 'Abudhabi') ; 
insert into UAEUsers VALUES (3, 'Afreen', 'afreen86@gmail.com', 'Dubai') ; 
insert into UAEUsers VALUES (4, 'thuyki', 'thuki@23@gmail.com', 'Ajman') ; 
insert into UAEUsers VALUES (5, 'Sara', 'sara4554@gmail.com', 'Dubai') ; 




select * from UAEUsers;


create table UAEProducts( PID int primary key, PName varchar(30), Price decimal, Stock int );
insert into UAEProducts values( 11, 'Mouse', 78.50, 300 );
insert into UAEProducts values( 12, 'Keyboard', 118.50, 400 );
insert into UAEProducts values( 13, 'Laptop', 1006.50, 600 );
insert into UAEProducts values (14, 'Monitor', 56.25, 20 );
insert into UAEProducts values( 15, 'Ram', 60.50, 500 );

select * from UAEProducts; 

create table UAEOrders (OID int primary key, UserID int, OrderDate date, foreign key (UserID) references UAEUsers(UserID));
insert into UAEOrders values ( 21, 1, '2026-01-26');
insert into UAEOrders values ( 22, 2, '2026-02-26');
insert into UAEOrders values ( 23, 3, '2026-03-26');
insert into UAEOrders values ( 24, 4, '2026-04-26');
insert into UAEOrders values ( 25, 5, '2026-05-26');

select * from UAEOrders; 

create table UAEOrderDetailsnew ( Orderdetails  int, OID int, PID int, Quantity int, foreign key (OID) references UAEOrders(OID), foreign key (PID) references UAEProducts(PID));

insert into UAEOrderDetailsnew VALUES ( 31, 21, 11, 555); 
insert into UAEOrderDetailsnew VALUES ( 32, 22, 12, 666); 
insert into UAEOrderDetailsnew VALUES ( 33, 23, 13, 777); 
insert into UAEOrderDetailsnew VALUES ( 34, 24, 14, 888); 
insert into UAEOrderDetailsnew VALUES ( 35, 25, 15, 999); 


select * from UAEOrderDetailsnew;







