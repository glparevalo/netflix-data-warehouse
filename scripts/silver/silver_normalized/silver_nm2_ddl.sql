-- silver.nm2_netflix_data
DROP TABLE IF EXISTS silver.nm2_netflix_data;

CREATE TABLE silver.nm2_netflix_data(
	show_key			VARCHAR PRIMARY KEY,
	show_type			VARCHAR,
	title				VARCHAR,
	date_added			DATE,
	release_year		INT,
	rating				VARCHAR,
	duration			VARCHAR,
	description			VARCHAR
);

--silver.nm2_cast
DROP TABLE IF EXISTS silver.nm2_cast;

CREATE TABLE silver.nm2_cast(
	show_key 			VARCHAR,
	show_cast 			VARCHAR
);

--silver.nm2_country
DROP TABLE IF EXISTS silver.nm2_country;

CREATE TABLE silver.nm2_country(
	show_key 			VARCHAR,
	country 			VARCHAR
);

--silver.nm2_director
DROP TABLE IF EXISTS silver.nm2_director;

CREATE TABLE silver.nm2_director(
	show_key 			VARCHAR,
	director 			VARCHAR
);

--silver.nm2_listed_in
DROP TABLE IF EXISTS silver.nm2_listed_in;

CREATE TABLE silver.nm2_listed_in(
	show_key 			VARCHAR,
	nm2_listed_in 		VARCHAR
);