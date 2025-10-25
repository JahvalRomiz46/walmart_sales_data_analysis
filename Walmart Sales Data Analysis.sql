-- Walmart Sales Data Analysis

-- GOAL
/* To explore the Walmart Sales data to understand top performing branches and products, 
sales trend of different products, customer behaviour. The aims is to study how sales
strategies can be improved and optimized. */

SELECT *
FROM sales;

-- Add time_of_day column
SELECT
	time,
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END AS time_of_day
FROM sales;

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales
SET time_of_day = (
	CASE
		WHEN `time` BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
        WHEN `time` BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
        ELSE "Evening"
    END
);

-- Add day_name column
SELECT
	date,
	DAYNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);


-- Add month_name column
SELECT
	date,
	MONTHNAME(date)
FROM sales;

ALTER TABLE sales ADD COLUMN month_name VARCHAR(10);

UPDATE sales
SET month_name = MONTHNAME(date);



/* BUSINESS QUESTIONS TO ANSWER */

# GENERIC QUESTION
-- How many unique cities does the data have?
SELECT COUNT(DISTINCT city) AS total_cities
FROM sales;

-- In which city is each branch?
SELECT DISTINCT branch, city
FROM sales
ORDER BY 1;


# PRODUCT
-- 1. How many unique product lines does the data have?
SELECT COUNT(DISTINCT product_line) AS total_product_lines
FROM sales;

-- 2. What is the most common payment method?
SELECT payment, COUNT(payment) AS payment_method_used
FROM sales
GROUP BY payment
ORDER BY 2 DESC;

-- 3. What is the most selling product line?
SELECT product_line, SUM(quantity) AS total_qty
FROM sales
GROUP BY product_line
ORDER BY total_qty DESC;

-- 4. What is the total revenue by month?
SELECT month_name AS `month`, SUM(total) AS total_revenue
FROM sales
GROUP BY month_name
ORDER BY
	CASE `month`
		WHEN 'Januari' THEN 1
        WHEN 'February' THEN 2
        WHEN 'March' THEN 3
    END;
    
-- 5. What month had the largest COGS?
SELECT month_name AS `month`, SUM(cogs) AS cogs
FROM sales
GROUP BY `month`
ORDER BY cogs DESC;

-- 6. What product line had the largest revenue?
SELECT product_line, SUM(total) AS revenue
FROM sales
GROUP BY product_line
ORDER BY revenue DESC;

-- 7. What is the city with the largest revenue?
SELECT city, SUM(total) AS revenue
FROM sales
GROUP BY city
ORDER BY revenue DESC;

-- 8. What product line had the largest VAT?
SELECT product_line, AVG(tax_pct) as avg_tax
FROM sales
GROUP BY product_line
ORDER BY avg_tax DESC;

-- 9. Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
WITH product_sales AS
(
SELECT product_line, SUM(total) AS total
FROM sales
GROUP BY product_line
), avg_sales AS
(
SELECT AVG(total) AS avg_total 
FROM product_sales
) SELECT ps.product_line, ps.total, 
CASE
	WHEN ps.total > (SELECT avg_total FROM avg_sales)  THEN 'Good'
    ELSE 'Bad'
END AS sales_category
FROM product_sales ps;


-- 10. Which branch sold more products than average product sold?
WITH branch_sales AS
(
SELECT branch, SUM(quantity) AS total_qty
FROM sales
GROUP BY branch
) SELECT *, ROUND(AVG(total_qty) OVER()) AS avg_qty
FROM branch_sales;

-- 11. What is the most common product line by gender?
SELECT gender, COUNT(product_line) AS product_line
FROM sales
GROUP BY gender
ORDER BY 2 DESC;

-- 12. What is the average rating of each product line?
SELECT product_line, ROUND(AVG(rating), 2) AS avg_rating
FROM sales
GROUP BY product_line;


# SALES
-- 1. Number of sales made in each time of the day per weekday
SELECT
	day_name,
    time_of_day,
	COUNT(*) AS total_sales
FROM sales
WHERE day_name = "Monday" OR day_name = "Tuesday" OR day_name = "Wednesday" OR day_name = "Thursday" OR day_name = "Friday"
GROUP BY day_name, time_of_day 
ORDER BY 
	CASE day_name
        WHEN 'Sunday' THEN 1
        WHEN 'Monday' THEN 2
        WHEN 'Tuesday' THEN 3
        WHEN 'Wednesday' THEN 4
        WHEN 'Thursday' THEN 5
        WHEN 'Friday' THEN 6
        WHEN 'Saturday' THEN 7
    END,
    CASE time_of_day
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
    END;

-- Ada kasus lain jika ingin filter berdasarkan rentang per 7 hari
SELECT DATE(`date`) AS `date`, day_name, time_of_day, COUNT(DISTINCT invoice_id) AS total_sales
FROM sales
WHERE DATE(`date`) BETWEEN '2019-01-01' AND '2019-01-08'
GROUP BY day_name, time_of_day, `date`
ORDER BY
	`date`,
    CASE time_of_day
        WHEN 'Morning' THEN 1
        WHEN 'Afternoon' THEN 2
        WHEN 'Evening' THEN 3
    END;

-- 2. Which of the customer types brings the most revenue?
SELECT customer_type, ROUND(SUM(total), 2) AS total_revenue
FROM sales
GROUP BY customer_type
ORDER BY total_revenue DESC;

-- 3. Which city has the largest tax percent/ VAT (Value Added Tax)?
-- THIS QUESTION CANNOT BE ANSWERED WITH THIS DATA, BECAUSE EVERY CITY HAS THE SAME TAX PERCENT

-- BUT IF THE QUESTION IS "WHICH CITY HAS THE LARGEST TAX INCOME?", THEN
SELECT city, SUM(tax_pct) AS tax_income
FROM sales
GROUP BY city
ORDER BY tax_income DESC;

-- 4. Which customer type pays the most in VAT?
SELECT customer_type, SUM(tax_pct) AS total_tax_paid
FROM sales
GROUP BY customer_type
ORDER BY total_tax_paid DESC;


# CUSTOMER
-- 1. How many unique customer types does the data have?
SELECT DISTINCT customer_type
FROM sales;

-- 2. How many unique payment methods does the data have?
SELECT DISTINCT payment
FROM sales;

-- 3. What is the most common customer type?
SELECT customer_type, COUNT(customer_type) AS total_cst
FROM sales
GROUP BY customer_type
ORDER BY 2 DESC;

-- 4. Which customer type buys the most?
-- Based On Total Transaction
SELECT customer_type, COUNT(customer_type) AS total_cst
FROM sales
GROUP BY customer_type
ORDER BY 2 DESC;
-- Based On Total Product Quantity
SELECT customer_type, SUM(quantity) AS total_qtyy
FROM sales
GROUP BY customer_type
ORDER BY 2 DESC;
-- Based On Total Spend
SELECT customer_type, ROUND(SUM(total)) AS total_spend
FROM sales
GROUP BY customer_type
ORDER BY 2 DESC;

-- 5. What is the gender of most of the customers?
SELECT gender, COUNT(gender) AS total_gender
FROM sales
GROUP BY gender
ORDER BY 2 DESC;

-- 6. What is the gender distribution per branch?
SELECT branch, gender, COUNT(gender) AS total_gender
FROM sales
GROUP BY branch, gender
	ORDER BY
		CASE 
			WHEN branch = 'A' THEN 1
            WHEN branch = 'B' THEN 2
            WHEN branch = 'C' THEN 3
        END,
        CASE 
			WHEN gender = 'Male' THEN 1
            WHEN gender = 'Female' THEN 2
        END;

-- 7. Which time of the day do customers give most ratings?
SELECT time_of_day, AVG(rating) AS avg_rating
FROM sales
GROUP BY time_of_day
ORDER BY 2 DESC;
/* Keliatannya sesi waktu menujukkan pemberian rating yang tidak jauh beda,
yang berarti sesi waktu ga ada hubungannya dengan besar rating */

-- 8. Which time of the day do customers give most ratings per branch?
SELECT branch, time_of_day, AVG(rating) AS avg_rating
FROM sales
GROUP BY branch, time_of_day
ORDER BY
	CASE 
		WHEN branch = 'A' THEN 1
        WHEN branch = 'B' THEN 2
		WHEN branch = 'C' THEN 3
    END, avg_rating DESC;

-- 9. Which day of the week has the best avg ratings?
SELECT day_name, AVG(rating) AS avg_rating
FROM sales
GROUP BY day_name
ORDER BY 2 DESC;

-- 10. Which day of the week has the best average ratings per branch?
WITH best_rating_day AS
(
SELECT branch, day_name AS day, AVG(rating) AS avg_rating
FROM sales
GROUP BY branch, day
ORDER BY
	CASE 
		WHEN branch = 'A' THEN 1
        WHEN branch = 'B' THEN 2
		WHEN branch = 'C' THEN 3
    END, avg_rating DESC
), top_1_day AS 
(
SELECT *, ROW_NUMBER() OVER(PARTITION BY branch) AS rate_rank
FROM best_rating_day
) SELECT *
FROM top_1_day
WHERE rate_rank = 1; 



SELECT *
FROM sales;
