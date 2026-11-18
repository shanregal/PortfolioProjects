/* 
------ Cleaning Data in Bayut Property Sales Records --------

*/ 
use [Shopify Portfolio]
go

select * from [Shopify Portfolio].dbo.bayut_sales_data

-- Standard Date format 
/* post date is already in standard format .. if it is added with time information do the following code to bring it into standard format 
*/
select bayut_sales_data.post_date, CONVERT(Date, bayut_sales_data.post_date) as [modified_post_date]
from bayut_sales_data; 

--- OR --- 
update bayut_sales_data 
set post_date = CONVERT(date, post_date) 

select * from bayut_sales_data; 

-- Breaking address into multiple columns like Building, Location and City 
select 
TRIM(parsename(replace(bayut_sales_data.address, ',','.'),3)) as Building_name,
TRIM(parsename(replace(bayut_sales_data.address, ',','.'),2))as Location_name,  
TRIM(parsename(replace(bayut_sales_data.address, ',','.'),1)) as City_name  
from bayut_sales_data; 

-- Saving these new address columns into sales table 
alter table bayut_sales_data add Building varchar(30), Location varchar(50), Emirate varchar(15); 

select * from bayut_sales_data; 

alter table bayut_sales_data 
drop column Building, Location, Emirate ; 

select bayut_sales_data.building_name from bayut_sales_data where bayut_sales_data.address is not null   ; 

-- update table bayut_sales_Data with new column addresses  
alter table bayut_sales_data add Address1 varchar(100), Address2 varchar(400), Address3 varchar(300);

alter table bayut_sales_data alter column Address1 varchar(255); 
update bayut_sales_data
set Address1= TRIM(parsename(replace(bayut_sales_data.address, ',','.'),3))

alter table bayut_sales_data alter column Address2 varchar(255); 
update bayut_sales_data
set Address2 = TRIM(parsename(replace(bayut_sales_data.address, ',','.'),2))

alter table bayut_sales_data alter column Address3 varchar(255); 
update bayut_sales_data
set Address3= TRIM(parsename(replace(bayut_sales_data.address, ',','.'),1)) 


select * from bayut_sales_data; 

select distinct(bayut_sales_data.purpose)
from bayut_sales_data; 

------ Delete Unused Columns -------------- 

select * from bayut_sales_data; 

alter table bayut_sales_data 
drop column address 

-- Common table expressions ---- 
----- Total properties without parking spaces order by type -------------

with parking_spaces as ( 
select price, type,post_date, total_parking_spaces from bayut_sales_data 
where bayut_sales_data.total_parking_spaces=0 
group by price, type, post_date, bayut_sales_data.completion_status, total_parking_spaces
) 
select * from parking_spaces
order by type 

select * from bayut_sales_data; 