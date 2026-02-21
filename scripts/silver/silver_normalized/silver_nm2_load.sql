-- silver.nm2_netflix_data
TRUNCATE TABLE silver.nm2_netflix_data;

INSERT INTO silver.nm2_netflix_data
SELECT DISTINCT 
	show_key,
	show_type,
	title,
	date_added,
	release_year,
	rating,
	duration,
	description
FROM silver.netflix_data;

-- silver.nm2_cast
TRUNCATE TABLE silver.nm2_cast;

INSERT INTO silver.nm2_cast
SELECT DISTINCT
	show_key,
	show_cast
FROM silver.netflix_data;

-- silver.nm2_country
TRUNCATE TABLE silver.nm2_country;

INSERT INTO silver.nm2_country
SELECT DISTINCT
	show_key,
	country
FROM silver.netflix_data;

-- silver.nm2_director
TRUNCATE TABLE silver.nm2_director;

INSERT INTO silver.nm2_director
SELECT DISTINCT
	show_key,
	director
FROM silver.netflix_data;

-- silver.nm2_listed_in
TRUNCATE TABLE silver.nm2_listed_in;

INSERT INTO silver.nm2_listed_in
SELECT DISTINCT
	show_key,
	listed_in
FROM silver.netflix_data;