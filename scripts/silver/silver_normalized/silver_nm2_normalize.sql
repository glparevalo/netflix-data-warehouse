-- silver.nm2_cast
TRUNCATE TABLE silver.nm2_cast;

INSERT INTO silver.nm2_cast
select DISTINCT
	show_key,
	trim(unnest(string_to_array(show_cast, ','))) as indiv_cast
from silver.netflix_data;

-- silver.nm2_country
TRUNCATE TABLE silver.nm2_country;

INSERT INTO silver.nm2_country
select distinct
	show_key,
	trim(unnest(string_to_array(country, ','))) as indiv_country
from silver.netflix_data;

-- silver.nm2_director
TRUNCATE TABLE silver.nm2_director;

INSERT INTO silver.nm2_director
select DISTINCT
	show_key,
	trim(unnest(string_to_array(director, ','))) as indiv_director
from silver.netflix_data;

-- silver.nm2_listed_in
TRUNCATE TABLE silver.nm2_listed_in;

INSERT INTO silver.nm2_listed_in
select DISTINCT
	show_key,
	trim(unnest(string_to_array(listed_in, ','))) as indiv_listed_in
from silver.netflix_data;

-- validate data
select * from silver.nm2_director