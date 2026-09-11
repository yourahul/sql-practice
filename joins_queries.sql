Q1
-- Find all profitable orders
SELECT t1.order_id, sum(profit) as "acutal_profit"FROM flipkart.orders t1
join flipkart.order_details t2
on t1.order_id = t2.order_id
group by t1.order_id
having acutal_profit > 0;


Q2
-- Find the customer who has placed max number of orders
SELECT t1.name, count(*) FROM flipkart.users t1
join flipkart.orders t2
on t1.user_id = t2.user_id
group by t1.name
order by count(*) desc
Limit 1


Q3
-- Which is the most profitable category
SELECT t2.vertical, sum(profit)  FROM flipkart.order_details t1
join flipkart.category t2
on t1.category_id = t2.category_id
group by t2.vertical
order by sum(profit) desc
LIMIT 1


Q4
-- Which is the most profitable state
  SELECT t3.state, sum(profit) FROM flipkart.orders t1
join flipkart.order_details t2
on t1.order_id = t2.order_id
join flipkart.users t3
on t1.user_id = t3.user_id
group by t3.state
order by sum(profit) desc Limit 1


Q5
-- Find all categories with profit higher than 5000
SELECT t2.vertical, sum(profit) FROM flipkart.order_details t1
join flipkart.category t2
on t1.category_id = t2.category_id
group by t2.vertical
having sum(profit) > 4000

Q6
SELECT t1.brand_name,
	   t1.model,
       t2.model,
       t1.rating,
       t2.rating 
FROM campusx.smartphones_cleaned_v6 t1
join campusx.smartphones_cleaned_v6 t2
on t1.brand_name = t2.brand_name
AND t1.model < t2.model
WHERE t1.rating > 80 
AND t2.rating > 80;

Q7
SELECT t1.brand_name,t1.processor_brand,t1.model,t2.model FROM campusx.smartphones_cleaned_v6 t1
JOIN campusx.smartphones_cleaned_v6 t2
ON t1.brand_name = t2.brand_name
AND t1.processor_brand = t2.processor_brand
WHERE t1.model < t2.model

Q8
SELECT brand_name 
FROM campusx.smartphones_cleaned_v6
where rating >= 85 

UNION

SELECT brand_name 
FROM campusx.smartphones_cleaned_v6
where price < 15000;

Q9
SELECT BattingTeam,sum(total_run) AS TotalRuns 
FROM campusx.ipl
GROUP BY BattingTeam
HAVING SUM(total_run) > 10000

UNION ALL

SELECT BattingTeam,sum(total_run) AS TotalRuns
FROM campusx.ipl
GROUP BY BattingTeam
HAVING SUM(total_run) < 1000;

Q10
SELECT t1.state,t1.name,t2.order_id FROM flipkart.users t1
JOIN flipkart.orders t2
on t1.user_id = t2.user_id
WHERE t1.state = 'karnataka'

Q11
SELECT t1.name,
	t3.order_id,
    SUM(t3.profit)  AS 'total_profit'
FROM flipkart.users t1
JOIN flipkart.orders t2
on t1.user_id = t2.user_id
JOIN flipkart.order_details t3
on t3.order_id = t2.order_id
GROUP BY t3.order_id, t1.name
ORDER BY total_profit DESC;

Q12
SELECT t1.name AS "customer name",
	   sum(t3.amount)  AS total_sales,
       sum(t3.profit)  AS  total_profit
FROM flipkart.users t1
JOIN flipkart.orders t2
on t1.user_id = t2.user_id
JOIN flipkart.order_details t3
on t3.order_id = t2.order_id
GROUP BY t1.name
ORDER BY total_profit DESC;

Q13
SELECT t1.state,
		sum(t3.profit) AS total_profit,
        t4.category
FROM flipkart.users t1
JOIN flipkart.orders t2
on t1.user_id = t2.user_id
JOIN flipkart.order_details t3
on t3.order_id = t2.order_id
JOIN flipkart.category t4
on t4.category_id = t3.category_id
GROUP BY t4.category,t1.state
ORDER BY t1.state, total_profit DESC;

Q14
SELECT t1.state,
	   t4.category,
       sum(t3.profit) AS total_profit,
        COUNT(t2.order_id) AS number_of_orders
	FROM flipkart.users t1
JOIN flipkart.orders t2
on t1.user_id = t2.user_id
JOIN flipkart.order_details t3
on t3.order_id = t2.order_id
JOIN flipkart.category t4
on t4.category_id = t3.category_id
GROUP BY t1.state, t4.category
HAVING  total_profit > 2000
AND number_of_orders >= 3
ORDER BY  total_profit DESC 
LIMIT 5

Q15
SELECT t1.name, t1.state, t2.order_id FROM flipkart.users t1
JOIN flipkart.orders t2
ON t1.user_id = t2.user_id
WHERE t1.state = 'karnataka' OR t1.state = 'kerala'
ORDER BY t1.state ASC, t2.order_id DESC

Q16
SELECT t1.name,sum(t3.profit) AS totalprofit FROM flipkart.users t1
JOIN flipkart.orders t2
ON t1.user_id = t2.user_id
JOIN flipkart.order_details t3
ON t3.order_id = t2.order_id
GROUP BY t1.name
HAVING totalprofit > 5000
ORDER BY totalprofit DESC

Q17
SELECT t2.vertical,
	sum(t1.profit) as totalprofit,
    COUNT(DISTINCT t1.order_id) as number_of_orders
FROM flipkart.order_details t1
JOIN flipkart.category t2
ON t1.category_id = t2.category_id
group by t2.vertical
HAVING COUNT(DISTINCT t1.order_id) >= 5
order by totalprofit desc
LIMIT 5;
