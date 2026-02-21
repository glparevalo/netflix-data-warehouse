-- drop bronze table if it already exists
DROP TABLE IF EXISTS bronze.netflix_data;

-- create bronze table
CREATE TABLE IF NOT EXISTS bronze.netflix_data(
	show_id			VARCHAR,
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
	description		VARCHAR
)