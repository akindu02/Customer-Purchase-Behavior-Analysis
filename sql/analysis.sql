-- =========================================
-- Customer Purchase Behavior Analysis
-- Database: customer_db
-- Table: customers
-- =========================================


-- -------------------------------------------------
-- (Run once) Table structure
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    total_spent INT
);


-- -------------------------------------------------
-- 1. Average spending by city
-- -------------------------------------------------
SELECT
    city,
    ROUND(AVG(total_spent), 2) AS avg_spent
FROM customers
GROUP BY city
ORDER BY avg_spent DESC;


-- -------------------------------------------------
-- 2. Customer distribution by gender
-- -------------------------------------------------
SELECT
    gender,
    COUNT(*) AS customer_count
FROM customers
GROUP BY gender;


-- -------------------------------------------------
-- 3. High-value customers (premium segment)
-- -------------------------------------------------
SELECT
    customer_id,
    city,
    total_spent
FROM customers
WHERE total_spent > 250
ORDER BY total_spent DESC;


-- -------------------------------------------------
-- 4. Overall business KPIs
-- -------------------------------------------------
SELECT
    COUNT(*) AS total_customers,
    SUM(total_spent) AS total_revenue,
    ROUND(AVG(total_spent), 2) AS avg_customer_spend
FROM customers;
