create database sql_project_1;

create table retail_sales(
        transaction_id INT PRIMARY KEY,	
        sale_date DATE,	 
        sale_time TIME,	
        customer_id	INT,
        gender	VARCHAR(15),
        age	INT,
        category VARCHAR(15),	
        quantity	INT,
        price_per_unit FLOAT,	
        cogs	FLOAT,
        total_sale FLOAT
)

-- improt data
select * from retail_sales;

-- count of rows
select count(*) from retail_sales;

-- Data Cleaning

create view null_values as
select * from retail_sales
where 
    transaction_id is null
    or
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	category is null
	or
	quantity is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null;

select * from null_values;	

delete from retail_sales
where
   transaction_id is null
    or
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	category is null
	or
	quantity is null
	or
	price_per_unit is null
	or
	cogs is null
	or
	total_sale is null;

-- Data Exploration

-- How many sales

select count(*) as total_sales from retail_sales;

-- How many uniuque customers we have ?

select  count(distinct customer_id) as unique_customer from retail_sales;

-- category of items 

select distinct category from retail_sales;

-- Data Analysis & Business Key Problems & Answers


-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
create view Q_1 as
select * from retail_sales
where
    sale_date = '2022-11-05'
	order by 1 asc;

select * from Q_1;

-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 3 in the month of Nov-2022
create view Q_2 as
select * from retail_sales
where 
     category = 'Clothing'
	 and
	 quantity >=3
	 and
	 to_char(sale_date ,'YYYY-MM')='2022-11'
	 order by 1;

select * from Q_2;
	 
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
create view Q_3 as
select  category, count(total_sale) as total_sale  from retail_sales
group by category
order by 2 ;

select * from Q_3;

-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
create view Q_4 as
select round(avg(age),2) from retail_sales
where 
   category =  'Beauty';

select * from Q_4; 
   
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
create view Q_5 as
select * from retail_sales
where 
    total_sale >1000
	order by 1;

select * from Q_5;	
	
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
create view Q_6 as
select category , gender , count(transaction_id) as total_transactions from retail_sales
group by category , gender
order by 1;

select * from Q_6;

-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
create view Q_7 as
select 
   year, 
   month,
   round(avg_sale::numeric ,2)
from   
(   
select 
   extract(year from sale_date) as year,
   extract(month from sale_date) as month,
   avg(total_sale) as avg_sale,
   rank() over(partition by extract(year from sale_date) order by avg(total_sale)  ) as rank
from retail_sales
group by 1,2
) as t1
where rank =1;

select * from Q_7;

-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales 
create view Q_8 as
select 
   customer_id , 
   sum(total_sale) as total_sale
from retail_sales
group by customer_id
order by 2 desc
limit 5;

select * from Q_8 ;
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
create view Q_9 as 
select 
      category, 
	  count(distinct customer_id) as unique_customer
from retail_sales
group by category;

select * from Q_9;


-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
create view Q_10 as
with hour_shift as
(
select *,
     case
	  when extract(hour from sale_time ) < 12 then 'morning'
	  when extract(hour from sale_time) between 12 and 17 then 'aftermoon'
	  else 'evening'
	 end as shift
from retail_sales
)
select 
     shift,
     count(transaction_id) as orders
from hour_shift 
group by shift;

select * from Q_10;

-- final answers
-- Q.1 Write a SQL query to retrieve all columns for sales made on '2022-11-05
select * from Q_1;
-- Q.2 Write a SQL query to retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in the month of Nov-2022
select * from Q_2;
-- Q.3 Write a SQL query to calculate the total sales (total_sale) for each category.
select * from Q_3;
-- Q.4 Write a SQL query to find the average age of customers who purchased items from the 'Beauty' category.
select * from Q_4;
-- Q.5 Write a SQL query to find all transactions where the total_sale is greater than 1000.
select * from Q_5;
-- Q.6 Write a SQL query to find the total number of transactions (transaction_id) made by each gender in each category.
select * from Q_6;
-- Q.7 Write a SQL query to calculate the average sale for each month. Find out best selling month in each year
select * from Q_7;
-- Q.8 Write a SQL query to find the top 5 customers based on the highest total sales
select * from Q_8;
-- Q.9 Write a SQL query to find the number of unique customers who purchased items from each category.
select * from Q_9;
-- Q.10 Write a SQL query to create each shift and number of orders (Example Morning <=12, Afternoon Between 12 & 17, Evening >17)
select * from Q_10;

	