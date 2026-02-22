--silver.nm_show_casts_br
DROP TABLE IF EXISTS silver.nm_show_casts_br;

CREATE TABLE silver.nm_show_casts_br(
	show_cast_rel_key	VARCHAR PRIMARY KEY,
	show_key			VARCHAR,
	show_cast_key		VARCHAR
);


--silver.nm_countries_br
DROP TABLE IF EXISTS silver.nm_countries_br;

CREATE TABLE silver.nm_countries_br(
	country_rel_key		VARCHAR PRIMARY KEY,
	show_key			VARCHAR,
	country_key			VARCHAR
);


--silver.nm_directors_br
DROP TABLE IF EXISTS silver.nm_directors_br;

CREATE TABLE silver.nm_directors_br(
	director_rel_key	VARCHAR PRIMARY KEY,
	show_key			VARCHAR,
	director_key		VARCHAR
);


--silver.nm_categories_br
DROP TABLE IF EXISTS silver.nm_categories_br;

CREATE TABLE silver.nm_categories_br(
	category_rel_key	VARCHAR PRIMARY KEY,
	show_key			VARCHAR,
	category_key		VARCHAR
);