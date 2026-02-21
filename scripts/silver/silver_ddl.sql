DROP TABLE IF EXISTS silver.netflix_data;

CREATE TABLE IF NOT EXISTS silver.netflix_data(
	show_key		VARCHAR PRIMARY KEY,
	show_type		VARCHAR,
	title			VARCHAR,
	director		VARCHAR,
	show_cast		VARCHAR,
	country			VARCHAR,
	date_added		DATE,
	release_year	INT,
	rating			VARCHAR,
	duration		VARCHAR,
	listed_in		VARCHAR,
	description		VARCHAR,
	show_id			VARCHAR,
	datetime_added	TIMESTAMPTZ
);