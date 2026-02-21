-- reusable script for exploring
select * from silver.netflix_data
limit 100;

-- 1. show_id should not have duplicates
select
	show_id,
	count(*)
from (select * from silver.netflix_data)
group by show_id
	having count(*) > 1;

-- 2. check for semi-structured columns
select distinct duration 
from silver.netflix_data;

