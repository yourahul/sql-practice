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
