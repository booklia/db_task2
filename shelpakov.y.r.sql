-- запрос 1
SELECT DISTINCT brand
FROM transactions
WHERE standard_cost > 1500;


-- запрос 2
SELECT *
FROM transactions
WHERE transaction_date BETWEEN '2017-04-01' AND '2017-04-09'
  AND order_status = 'Approved';


-- запрос 3
SELECT DISTINCT job_title
FROM customers
WHERE (job_industry_category = 'IT' OR job_industry_category = 'Financial Services')
  AND job_title LIKE 'Senior%';


-- запрос 4
SELECT DISTINCT t.brand
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE c.job_industry_category = 'Financial Services';


-- запрос 5
SELECT DISTINCT c.customer_id, c.first_name, c.last_name
FROM transactions t
JOIN customers c ON t.customer_id = c.customer_id
WHERE t.online_order = 'Yes'
  AND t.brand IN ('Giant Bicycles', 'Norco Bicycles', 'Trek Bicycles')
LIMIT 10;


-- запрос 6
SELECT customers.*
FROM customers
LEFT JOIN transactions ON customers.customer_id = transactions.customer_id
WHERE transactions.customer_id IS NULL;


-- запрос 7
SELECT c.*
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE c.job_industry_category = 'IT'
  AND t.standard_cost = (SELECT MAX(standard_cost) FROM transactions);


-- запрос 8
SELECT DISTINCT c.*
FROM customers c
JOIN transactions t ON c.customer_id = t.customer_id
WHERE (c.job_industry_category = 'IT' OR c.job_industry_category = 'Health')
  AND t.order_status = 'Approved'
  AND t.transaction_date BETWEEN '2017-07-07' AND '2017-07-17';