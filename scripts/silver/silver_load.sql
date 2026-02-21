-- insert bronze values to silver table
INSERT INTO silver.netflix_data
	SELECT * FROM bronze.netflix_data
