-- silver.nm_show_casts
TRUNCATE TABLE silver.nm_show_casts;

INSERT INTO silver.nm_show_casts
WITH base_cast AS (
	SELECT DISTINCT
		show_cast,
		TRIM(UNNEST(STRING_TO_ARRAY(show_cast, ','))) AS indiv_cast
	FROM silver.netflix_data
)

SELECT DISTINCT
	CONCAT(
		'cast_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY indiv_cast) AS VARCHAR),
			6,
			'0'
		)
	) AS CAST_SHOW,
	indiv_cast as show_cast
FROM base_cast
GROUP BY indiv_cast;


-- silver.nm_countries
TRUNCATE TABLE silver.nm_countries;

INSERT INTO silver.nm_countries
WITH base_countries AS (
	SELECT DISTINCT
		country,
		TRIM(UNNEST(STRING_TO_ARRAY(country, ','))) AS indiv_country
	FROM silver.netflix_data
)

SELECT
	CONCAT(
		'country_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY indiv_country ASC) AS VARCHAR),
			3,
			'0'
		)
	) AS country_key,
	indiv_country as country
	
FROM (
	SELECT DISTINCT
		CASE
			WHEN indiv_country = '' THEN 'None Specified'
			WHEN indiv_country = 'East Germany' OR indiv_country = 'West Germany' THEN 'Germany'
			ELSE indiv_country
		END AS indiv_country
	FROM base_countries
);


-- silver.nm_directors
TRUNCATE TABLE silver.nm_directors;

INSERT INTO silver.nm_directors
WITH base_directors AS (
	SELECT DISTINCT
		director,
		TRIM(UNNEST(STRING_TO_ARRAY(director, ','))) as indiv_director
	FROM silver.netflix_data
)

SELECT DISTINCT
	CONCAT(
		'director_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY indiv_director ASC) AS VARCHAR),
			6,
			'0'
		)
	) AS director_key,
	indiv_director AS director
FROM base_directors
GROUP BY indiv_director;


-- silver.nm_categories
TRUNCATE TABLE silver.nm_categories;

INSERT INTO silver.nm_categories
WITH base_categories AS (
	SELECT DISTINCT
		listed_in AS category,
		TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS indiv_category
	FROM silver.netflix_data
)

SELECT DISTINCT
	CONCAT(
		'category_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY indiv_category) AS VARCHAR),
			3,
			'0'
		)
	) AS category_key,
	indiv_category as category
FROM base_categories
GROUP BY indiv_category;