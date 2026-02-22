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
					) AS show_key,
		show_type,
		title,
		COALESCE(
			TRIM(director),
			'None Specified'
		) AS director,
		COALESCE(
			TRIM(show_cast),
			'None Specified'
		) AS show_cast,
		TRIM(
			COALESCE(
				TRIM(BOTH ',' FROM TRIM(country)), 
				'None Specified'
			)
		) AS country,
		COALESCE(
			date_added, 
			CAST(CONCAT(CAST(release_year AS VARCHAR), '-01-01') AS DATE)
		) AS date_added,
		CAST(
			COALESCE(
				TRIM(CAST(release_year AS VARCHAR)), 
				'1900'
			) AS INT
		) AS release_year,
		COALESCE(
			TRIM(rating),
			'None Specified'
		) AS rating,
		COALESCE(
			TRIM(duration), 
			'None Specified'
		) AS duration,
		COALESCE(
			TRIM(listed_in),
			'None Specified'
		) AS listed_in,
		COALESCE(
			TRIM(description),
			'None Specified'
		) AS description,
		show_id,
		NOW() as datetime_now
	FROM bronze.netflix_data;