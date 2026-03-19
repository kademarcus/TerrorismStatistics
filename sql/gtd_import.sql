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
SELECT COUNT(*) FROM attacks;

-- Storage and Tables
SELECT * FROM attacks
LIMIT 10;
