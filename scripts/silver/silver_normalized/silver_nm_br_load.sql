-- silver.nm_show_casts_br
TRUNCATE TABLE silver.nm_show_casts_br;

INSERT INTO silver.nm_show_casts_br
WITH base_cast AS (
	SELECT DISTINCT
		show_cast,
		TRIM(UNNEST(STRING_TO_ARRAY(show_cast, ','))) AS indiv_cast
	FROM silver.netflix_data
)

SELECT DISTINCT
	t1.show_key,
	t3.show_cast_key,
	CONCAT(
		'show_cast_rel_key_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY t1.show_key, t3.show_cast_key) AS VARCHAR),
			8,
			'0'
		)
	) AS show_cast_rel_key
FROM silver.netflix_data AS t1
LEFT JOIN base_cast AS t2 
	ON t1.show_cast = t2.show_cast
LEFT JOIN silver.nm_show_casts AS t3
	ON t3.show_cast = t2.indiv_cast
ORDER BY show_key, show_cast_key;


-- silver.nm_countries_br
TRUNCATE TABLE silver.nm_countries_br;

INSERT INTO silver.nm_countries_br
WITH base_countries AS (
	SELECT DISTINCT
		country,
		TRIM(UNNEST(STRING_TO_ARRAY(country, ','))) AS indiv_country
	FROM silver.netflix_data
	ORDER BY indiv_country
)

SELECT DISTINCT
	CONCAT(
		'country_rel_key_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY t1.show_key, t3.country_key) AS VARCHAR),
			8,
			'0'
		)
	) AS country_rel_key,
	t1.show_key,
	t3.country_key
FROM silver.netflix_data AS t1
LEFT JOIN base_countries AS t2 
	ON t2.country = t1.country
LEFT JOIN silver.nm_countries AS t3
	ON t2.indiv_country = t3.country;


-- silver.nm_directors_br
TRUNCATE TABLE silver.nm_directors_br;

INSERT INTO silver.nm_directors_br
WITH base_directors AS (
	SELECT DISTINCT
		director,
		TRIM(UNNEST(STRING_TO_ARRAY(director, ','))) as indiv_director
	FROM silver.netflix_data
)

SELECT DISTINCT
	CONCAT(
		'director_rel_key_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY t1.show_key, t3.director_key) AS VARCHAR),
			8,
			'0'
		)
	) AS director_rel_key,
	t1.show_key,
	t3.director_key
FROM silver.netflix_data AS t1
LEFT JOIN base_directors AS t2
	ON t1.director = t2.director
LEFT JOIN silver.nm_directors AS t3
	ON t2.indiv_director = t3.director;


-- silver.nm_categories_br
TRUNCATE TABLE silver.nm_categories_br;

INSERT INTO silver.nm_categories_br
WITH base_categories AS (
	SELECT DISTINCT
		listed_in AS category,
		TRIM(UNNEST(STRING_TO_ARRAY(listed_in, ','))) AS indiv_category
	FROM silver.netflix_data
)

SELECT DISTINCT
	CONCAT(
		'director_rel_key_',
		LPAD(
			CAST(ROW_NUMBER() OVER (ORDER BY t1.show_key, t3.category_key) AS VARCHAR),
			8,
			'0'
		)
	) AS director_rel_key,
	t1.show_key,
	t3.category_key
FROM silver.netflix_data AS t1
LEFT JOIN base_categories AS t2
	ON t1.listed_in = t2.category
LEFT JOIN silver.nm_categories AS t3
	ON t2.indiv_category = t3.category;
