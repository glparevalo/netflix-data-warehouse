-- silver.nm_netflix_data
DROP TABLE IF EXISTS silver.nm_netflix_data;

CREATE TABLE silver.nm_netflix_data(
	show_key			VARCHAR PRIMARY KEY,
	show_type			VARCHAR,
	title				VARCHAR,
	date_added			DATE,
	release_year		INT,
	rating				VARCHAR,
	duration			VARCHAR,
	description			VARCHAR
);


--silver.nm_show_casts
DROP TABLE IF EXISTS silver.nm_show_casts;

CREATE TABLE silver.nm_show_casts(
	show_cast_key		VARCHAR PRIMARY KEY,
	show_cast 			VARCHAR
);


--silver.nm_countries
DROP TABLE IF EXISTS silver.nm_countries;

CREATE TABLE silver.nm_countries(
	country_key			VARCHAR PRIMARY KEY,
	country 			VARCHAR
);


--silver.nm_directors
DROP TABLE IF EXISTS silver.nm_directors;

CREATE TABLE silver.nm_directors(
	director_key		VARCHAR PRIMARY KEY,
	director 			VARCHAR
);


--silver.nm_categories
DROP TABLE IF EXISTS silver.nm_categories;

CREATE TABLE silver.nm_categories(
	category_key		VARCHAR PRIMARY KEY,
	category 			VARCHAR
);