-- FACT
DROP VIEW IF EXISTS gold.fact_netflix_shows;

CREATE VIEW gold.fact_netflix_shows AS
SELECT 
	show_key,
	show_type,
	title as show_title,
	description as show_description,
	release_year as show_year_released,
	rating as content_rating,
	duration as show_duration,
	date_added as show_date_added
FROM silver.netflix_data;


-- DIMENSIONS
-- gold.dim_show_casts
DROP VIEW IF EXISTS gold.dim_show_casts;

CREATE VIEW gold.dim_show_casts AS
SELECT
	show_cast_key,
	show_cast
FROM silver.nm_show_casts;


-- gold.dim_production_countries
DROP VIEW IF EXISTS gold.dim_production_countries;

CREATE VIEW gold.dim_production_countries AS
SELECT
	country_key,
	country as production_country
FROM silver.nm_countries;


-- gold.dim_show_director 
DROP VIEW IF EXISTS gold.dim_show_director;

CREATE VIEW gold.dim_show_director AS
SELECT
	director_key,
	director as show_director
FROM silver.nm_directors;


-- gold.dim_show_categories
DROP VIEW IF EXISTS gold.dim_show_categories;

CREATE VIEW gold.dim_show_categories AS
SELECT
	category_key,
	category as show_category
FROM silver.nm_categories;


-- BRIDGES
-- gold.bridge_show_casts
DROP VIEW IF EXISTS gold.bridge_show_casts;

CREATE VIEW gold.bridge_show_casts AS
SELECT
	show_key,
	show_cast_key
FROM silver.nm_show_casts_br;


-- gold.bridge_countries
DROP VIEW IF EXISTS gold.bridge_countries;

CREATE VIEW gold.bridge_countries AS
SELECT
	show_key,
	country_key
FROM silver.nm_countries_br;


-- gold.bridge_directors
DROP VIEW IF EXISTS gold.bridge_directors;

CREATE VIEW gold.bridge_directors AS
SELECT
	show_key,
	director_key
FROM silver.nm_directors_br;


-- gold.bridge_categories
DROP VIEW IF EXISTS gold.bridge_categories;

CREATE VIEW gold.bridge_categories AS
SELECT
	show_key,
	category_key
FROM silver.nm_categories_br;

