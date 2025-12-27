SQL Customer Revenue Analytics

-> Overview
This project analyzes customer purchase data using SQL to understand revenue patterns, customer behavior, and business performance.  
It simulates a real-world **Data Analyst / SQL Analyst** scenario using relational data and business-driven questions.

->Objective
The objective of this project is to:
- Identify high-value customers
- Analyze revenue trends over time
- Understand repeat vs one-time customers
- Detect inactive customers
- Apply advanced SQL concepts to solve business problems

-> Dataset
The analysis is performed on three relational tables:

-> customers
- customer_id  
- name  
- city  
- signup_date  

-> orders
- order_id  
- customer_id  
- order_date  
- total_amount  

-> order_items
- order_item_id  
- order_id  
- product  
- quantity  
- price  

-> Business Questions Solved
- What is the total revenue and total number of orders?
- Which cities generate the highest revenue?
- Who are the top spending customers?
- What is the monthly revenue trend?
- How many customers are repeat buyers vs one-time buyers?
- Which customers have been inactive in the last 6 months?
- How much revenue is contributed by the top 20% customers?
- Which products generate the highest revenue?

-> SQL Skills Used
- Joins (INNER JOIN, LEFT JOIN)
- Aggregations (SUM, COUNT, AVG, MAX)
- GROUP BY and HAVING
- Common Table Expressions (CTEs)
- Window Functions (DENSE_RANK, NTILE)
- Subqueries
- Date functions (CURDATE, DATE_SUB)

-> Key Insights
- The top 20% of customers contribute more than 60% of the total revenue.
- Repeat customers have a significantly higher lifetime value.
- Metro cities contribute the highest share of revenue.
- Monthly revenue trends show seasonal variations.
- Identifying inactive customers helps improve customer retention strategies.

-> Tools Used
- SQL (MySQL compatible)
- GitHub for version control


