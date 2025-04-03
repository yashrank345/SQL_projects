# **Retail Sales Data Analysis**  

## **Overview**  
This project focuses on analyzing retail sales data using SQL. The analysis includes data cleaning, exploration, and business insights extraction through SQL queries and views.  

## **Technologies Used**  
- **SQL (PostgreSQL)**  
- **Views & CTEs**  
- **Aggregations & Window Functions**  

## **Dataset**  
The dataset consists of sales transactions with the following columns:  

- `transaction_id` (INT, Primary Key)  
- `sale_date` (DATE)  
- `sale_time` (TIME)  
- `customer_id` (INT)  
- `gender` (VARCHAR)  
- `age` (INT)  
- `category` (VARCHAR)  
- `quantity` (INT)  
- `price_per_unit` (FLOAT)  
- `cogs` (FLOAT)  
- `total_sale` (FLOAT)  

## **Setup Instructions**  

### **Create Database**  
```sql
CREATE DATABASE sql_project_1;
```

### **Create Table**  
```sql
CREATE TABLE retail_sales (
    transaction_id INT PRIMARY KEY,
    sale_date DATE,
    sale_time TIME,
    customer_id INT,
    gender VARCHAR(15),
    age INT,
    category VARCHAR(15),
    quantity INT,
    price_per_unit FLOAT,
    cogs FLOAT,
    total_sale FLOAT
);
```

## **Data Analysis & Business Key Problems**  

### **Q1: Retrieve all sales made on '2022-11-05'**
```sql
SELECT * FROM Q_1;
```

### **Q2: Retrieve all transactions where the category is 'Clothing' and the quantity sold is more than 10 in Nov 2022**
```sql
SELECT * FROM Q_2;
```

### **Q3: Calculate the total sales (`total_sale`) for each category**
```sql
SELECT * FROM Q_3;
```

### **Q4: Find the average age of customers who purchased items from the 'Beauty' category**
```sql
SELECT * FROM Q_4;
```

### **Q5: Retrieve all transactions where `total_sale` is greater than 1000**
```sql
SELECT * FROM Q_5;
```

### **Q6: Find the total number of transactions (`transaction_id`) made by each gender in each category**
```sql
SELECT * FROM Q_6;
```

### **Q7: Calculate the average sale for each month and find the best-selling month in each year**
```sql
SELECT * FROM Q_7;
```

### **Q8: Find the top 5 customers based on the highest total sales**
```sql
SELECT * FROM Q_8;
```

### **Q9: Find the number of unique customers who purchased items from each category**
```sql
SELECT * FROM Q_9;
```

### **Q10: Create each shift and count the number of orders (Morning <=12, Afternoon Between 12 & 17, Evening >17)**
```sql
SELECT * FROM Q_10;
```
