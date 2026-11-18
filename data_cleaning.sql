use [Shopify Portfolio]
go 

select * from dbo.dirty_cafe_sales;  

select distinct (Location) from dirty_cafe_sales ; 

---------------------- Remove duplicates  using Window function		-----------------
-------------------- All original rows are preserved here --------------------------
select * , 
ROW_NUMBER()  over ( 
partition by Item , 
			 Quantity,  
			 Price_Per_Unit,  
			 Total_Spent , 
			 Payment_Method , 
			 Location , 
			 Transaction_Date
			 order by 
			 Transaction_ID 
			 ) row_num  
from dirty_cafe_sales ; 

 

select * , 
ROW_NUMBER()  over ( 
partition by Item , 
			 Quantity , 
			 Location , 
			 Transaction_Date 
			 order by 
			 Transaction_ID 
			 ) row_num  
from dirty_cafe_sales ; 

-- Delete Duplicate ROWS Using Common Table Expressions ---------- 

with RowCTE as ( 
select * , 
ROW_NUMBER()  over ( 
partition by Item , 
			 Quantity , 
			 Location , 
			 Transaction_Date 
			 order by 
			 Transaction_ID 
			 ) row_num  
from dirty_cafe_sales  ) 


--select * from RowCTE 
-- where row_num>1 

delete from RowCTE where row_num>1 

select * from dirty_cafe_sales ; 

