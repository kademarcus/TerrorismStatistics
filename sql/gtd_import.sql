CREATE DATABASE terrorism_db;
USE terrorism_db;

-- Create table
CREATE TABLE attacks (
terrorist_attack INT, 
year INT, 
month INT, 
country TEXT, 
region TEXT, 
success INT, 
suicide INT, 
attack_type TEXT, 
target_type TEXT,
weapon_type TEXT, 
number_killed FLOAT, 
number_wounded FLOAT, 
property_damage TEXT, 
ransom INT, 
casualties FLOAT, 
number_killed_clean FLOAT,
number_wounded_clean FLOAT,
casualties_clean float);

-- Get UMD Data
SET GLOBAL local_infile = 1;
LOAD DATA LOCAL INFILE 'C:\\Users\\kadem\\Downloads\\umd_terrorism_data.csv'
INTO TABLE attacks
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Make sure all rows imported
SELECT COUNT(*) FROM attacks; -- Around 200k expected

-- Data Head
SELECT * FROM attacks
LIMIT 10;

-- Attacks by year
CREATE TABLE attacks_by_year AS
	SELECT year, 
		COUNT(*) AS total_attacks, 
		SUM(success) AS successful_attacks,
		SUM(suicide) AS suicide_attacks,
		SUM(number_killed) AS total_killed,
        SUM(casualties_clean) AS total_casualties
    FROM attacks
    GROUP BY year
    ORDER BY year;
    
SELECT * FROM attacks_by_year
LIMIT 10;

-- Attacks by country
CREATE TABLE attacks_by_country AS
	SELECT country,
		COUNT(*) AS total_attacks,
		SUM(success) AS successful_attacks,
		SUM(suicide) AS suicide_attacks,
        SUM(number_killed) AS total_killed,
        SUM(casualties_clean) AS total_casualties
	FROM attacks
    GROUP BY country
    ORDER BY total_attacks DESC;
    
SELECT * FROM attacks_by_country
LIMIT 10;

-- Attacks by region
CREATE TABLE attacks_by_region AS
	SELECT region,
		COUNT(*) AS total_attacks,
		SUM(success) AS successful_attacks,
		SUM(suicide) AS suicide_attacks,
        SUM(number_killed) AS total_killed,
        SUM(casualties_clean) AS total_casualties
	FROM attacks 
    GROUP BY region
    ORDER BY total_attacks DESC;	

SELECT * FROM attacks_by_region
LIMIT 10;

-- Attacks by type 
CREATE TABLE attacks_by_type AS 
	SELECT attack_type,
		COUNT(*) AS total_attacks,
		SUM(success) AS successful_attacks,
		SUM(suicide) AS suicide_attacks,
        SUM(number_killed) AS total_killed,
        SUM(casualties_clean) AS total_casualties
	FROM attacks 
    GROUP BY attack_type
    ORDER BY total_attacks DESC;

SELECT * FROM attacks_by_type
LIMIT 10;

-- Attacks by target
CREATE TABLE attacks_by_target AS 
	SELECT target_type,
		COUNT(*) AS total_attacks,
		SUM(success) AS successful_attacks,
		SUM(suicide) AS suicide_attacks,
        SUM(number_killed) AS total_killed,
        SUM(casualties_clean) AS total_casualties
	FROM attacks
    GROUP BY target_type
    ORDER BY total_attacks DESC;

SELECT * FROM attacks_by_target
LIMIT 10
