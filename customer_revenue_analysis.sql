create database customer_purchase;
use customer_purchase;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO customers VALUES
(1,'Amit','Delhi','2023-01-12'),
(2,'Ravi','Mumbai','2023-02-10'),
(3,'Neha','Bangalore','2023-02-18'),
(4,'Priya','Chennai','2023-03-05'),
(5,'Rahul','Delhi','2023-03-22'),
(6,'Kiran','Hyderabad','2023-04-01'),
(7,'Sneha','Pune','2023-04-15'),
(8,'Arjun','Mumbai','2023-05-01'),
(9,'Pooja','Delhi','2023-05-20'),
(10,'Ankit','Bangalore','2023-06-10'),
(11,'Rohit','Pune','2023-06-22'),
(12,'Meena','Chennai','2023-07-01'),
(13,'Suresh','Hyderabad','2023-07-15'),
(14,'Kavya','Delhi','2023-08-05'),
(15,'Vikas','Mumbai','2023-08-18'),
(16,'Nisha','Bangalore','2023-09-01'),
(17,'Deepak','Delhi','2023-09-10'),
(18,'Asha','Pune','2023-09-25'),
(19,'Manoj','Chennai','2023-10-02'),
(20,'Divya','Hyderabad','2023-10-15'),
(21,'Harsh','Delhi','2023-11-01'),
(22,'Payal','Mumbai','2023-11-10'),
(23,'Yash','Bangalore','2023-11-20'),
(24,'Rina','Pune','2023-12-01'),
(25,'Gaurav','Delhi','2023-12-12'),
(26,'Swati','Mumbai','2024-01-05'),
(27,'Abhishek','Chennai','2024-01-10'),
(28,'Isha','Hyderabad','2024-01-20'),
(29,'Nitin','Pune','2024-02-01'),
(30,'Komal','Bangalore','2024-02-12');

INSERT INTO orders VALUES
(101,1,'2024-01-10',4500),
(102,2,'2024-01-12',7200),
(103,3,'2024-01-15',3800),
(104,1,'2024-02-01',5200),
(105,4,'2024-02-10',6100),
(106,5,'2024-02-15',2900),
(107,6,'2024-02-20',8800),
(108,7,'2024-03-01',3100),
(109,8,'2024-03-05',9900),
(110,9,'2024-03-10',4500),
(111,10,'2024-03-18',6700),
(112,2,'2024-04-01',5300),
(113,3,'2024-04-07',7600),
(114,11,'2024-04-12',4100),
(115,12,'2024-04-18',3900),
(116,13,'2024-05-01',8200),
(117,14,'2024-05-10',4700),
(118,15,'2024-05-15',9100),
(119,16,'2024-06-01',3600),
(120,17,'2024-06-10',6400),
(121,18,'2024-06-15',2800),
(122,19,'2024-07-01',7500),
(123,20,'2024-07-05',8600),
(124,21,'2024-07-10',4300),
(125,22,'2024-07-15',5200),
(126,23,'2024-08-01',6900),
(127,24,'2024-08-10',3100),
(128,25,'2024-08-15',4700),
(129,26,'2024-09-01',8800),
(130,27,'2024-09-10',3900),
(131,28,'2024-09-15',6200),
(132,29,'2024-10-01',3400),
(133,30,'2024-10-05',7100),
(134,1,'2024-10-12',5600),
(135,2,'2024-11-01',8300),
(136,3,'2024-11-10',4900),
(137,4,'2024-11-15',6700),
(138,5,'2024-12-01',5200),
(139,6,'2024-12-10',9400),
(140,7,'2024-12-20',3800),
(141,8,'2025-01-05',10500),
(142,9,'2025-01-10',4600),
(143,10,'2025-01-15',7200),
(144,11,'2025-02-01',5800),
(145,12,'2025-02-10',4200),
(146,13,'2025-02-15',8900),
(147,14,'2025-03-01',6100),
(148,15,'2025-03-05',9600),
(149,16,'2025-03-10',3500),
(150,17,'2025-03-15',7800);

INSERT INTO order_items VALUES
(1,101,'Laptop',1,4500),
(2,102,'Phone',2,3600),
(3,103,'Headphones',2,1900),
(4,104,'Tablet',1,5200),
(5,105,'Laptop',1,6100),
(6,106,'Mouse',2,1450),
(7,107,'Phone',2,4400),
(8,108,'Keyboard',1,3100),
(9,109,'Laptop',1,9900),
(10,110,'Tablet',1,4500);

select * from customers;
select * from orders;
select * from order_items;

select count(*) as total_orders,
sum(total_amount) as total_amount 
from orders;

select c.city,sum(o.total_amount) as total_revenue
from customers c
join orders o
on c.customer_id =o.customer_id
group by c.city
order by total_revenue desc;

select c.name,sum(o.total_amount) as total_spend
from customers c
join orders o
on c.customer_id=o.customer_id
group by c.name 
order by total_spend desc
limit 10;

select date_format(order_date,'%y-%m') as month,
sum(total_amount) as total_amount 
from orders
group by month
order by month;

SELECT customer_type, COUNT(*) AS customers
FROM (
    SELECT customer_id,
           CASE WHEN COUNT(*) > 1 THEN 'Repeat'
                ELSE 'One-Time' END AS customer_type
    FROM orders
    GROUP BY customer_id
) t
GROUP BY customer_type;

select customer_id ,avg(total_amount) as avg_amount
from orders
group by customer_id;

select c.name,c.city,sum(o.total_amount) as total_spent
from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.name,c.city
order by total_spent desc;

select oi.product,sum(o.total_amount)as total_revenue
from order_items oi
join orders o
on oi.order_id=o.order_id
group by oi.product
order by total_revenue desc;

SELECT c.customer_id, c.name
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
HAVING MAX(o.order_date) < DATE_SUB(CURDATE(), INTERVAL 6 MONTH);

WITH customer_revenue AS (
    SELECT customer_id, SUM(total_amount) AS revenue
    FROM orders
    GROUP BY customer_id
),
ranked AS (
    SELECT *,
    NTILE(5) OVER (ORDER BY revenue DESC) AS bucket
    FROM customer_revenue
)
SELECT ROUND(SUM(revenue) * 100 /
       (SELECT SUM(total_amount) FROM orders),2) AS top_20_percent_revenue
FROM ranked
WHERE bucket = 1;
