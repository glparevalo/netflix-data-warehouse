
-- Truncate table first
TRUNCATE TABLE bronze.netflix_data;

-- Load data into bronze.netflix_data table
-- For maximum compatibility, ensure data is pipe-delimited
COPY bronze.netflix_data
	FROM 'your-path-to-data'
	DELIMITER '|' CSV HEADER;