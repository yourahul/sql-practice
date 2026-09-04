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
