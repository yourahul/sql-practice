Q1
SELECT model, brand_name, price, rating 
FROM campusx.smartphones_cleaned_v6
WHERE price < 20000

Q2
SELECT avg(price) AS "AVERAGE price"
FROM campusx.smartphones_cleaned_v6
WHERE has_5g = 'True'

Q3
SELECT brand_name, avg(ram_capacity) as 'Ram_Cap'
FROM campusx.smartphones_cleaned_v6
group by brand_name
order by Ram_Cap desc

Q4
SELECT BattingTeam, sum(total_run) AS 'total runs'
FROM campusx.ipl
group by BattingTeam
having sum(total_run) > 10000

Q5
SELECT brand_name, avg(rating) as 'avg_rating', count(*) AS 'no of phones'
FROM campusx.smartphones_cleaned_v6
group by brand_name
having avg_rating > 75
order by avg_rating desc
Limit 5

--6/9/26--

Q6
SELECT model,brand_name,price, rating FROM campusx.smartphones_cleaned_v6
where rating > 80 and price < 25000
order by rating desc

Q7
SELECT max(price),min(price),avg(price) FROM campusx.smartphones_cleaned_v6
where has_5g = 'True'

Q8
SELECT brand_name, count(*) FROM campusx.smartphones_cleaned_v6
group by brand_name
order by count(*) desc

Q9
SELECT BattingTeam, sum(total_run) FROM campusx.ipl
group by BattingTeam
having  sum(total_run) > 10000

Q10
SELECT brand_name, avg(price), count(*) FROM campusx.smartphones_cleaned_v6
group by brand_name
Having count(*) >= 5
order by avg(price) desc
Limit 5

Q11
SELECT t1.state,
	t4.category
FROM flipkart.users t1
Join flipkart.orders t2
ON t1.user_id = t2.user_id
JOIN flipkart.order_details t3
ON t3.order_id = t2.order_id
JOIN flipkart.category t4
ON t4.category_id = t3.category_id 
Group by t1.state, t4.category
having sum(t3.profit)  > 30

UNION

SELECT t1.state,
	t4.category
FROM flipkart.users t1
Join flipkart.orders t2
ON t1.user_id = t2.user_id
JOIN flipkart.order_details t3
ON t3.order_id = t2.order_id
JOIN flipkart.category t4
ON t4.category_id = t3.category_id 
Group by t1.state, t4.category
having count(distinct t3.order_id) >= 2

Q12
SELECT model,brand_name,price,rating 
FROM campusx.smartphones_cleaned_v6
where rating >= 85 

UNION

SELECT model,brand_name,price,rating 
FROM campusx.smartphones_cleaned_v6
where price < 10000

Q13


