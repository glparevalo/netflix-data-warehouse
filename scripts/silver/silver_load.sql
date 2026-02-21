-- truncate table first
TRUNCATE TABLE silver.netflix_data;

-- insert bronze values to silver table
INSERT INTO silver.netflix_data
	SELECT
		concat('s_', 
				lpad(
					right(show_id, (LENGTH(show_id)-1)), 
					6, 
					'0')
					) as show_key,
		show_type,
		title,
		director,
		show_cast,
		country,
		date_added,
		release_year,
		rating,
		duration,
		listed_in,
		description,
		show_id,
		NOW() as datetime_now
	FROM bronze.netflix_data;

-- validate silver.netflix_data table
SELECT * FROM silver.netflix_data;