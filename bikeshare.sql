-- I am using Postgresql locally
-- Create a table with this query 
CREATE TABLE bikesharecsv (
    ride_id character varying,
	rideable_type character varying,
	started_at timestamp,
	ended_at timestamp,
	start_station_name character varying,
	start_station_id character varying,
	end_station_name character varying,
	end_station_id character varying,
	start_lat VARCHAR(255),
	start_long VARCHAR(255),
	end_lat VARCHAR(255),
	end_long VARCHAR(255),
        member_casual character varying
);


-- view 5 rows in a table_name
select * from public.table_name LIMIT 5

-- count null value in a column
SELECT COUNT(*) 
FROM public.table_name
WHERE column_name IS NULL;

-- load csv file to table_name
COPY public.table_name from 'path\to\csv\file ',' CSV HEADER;


-- query I use to create a second table  and add empty columns starting point and duration
-- note that the data type I use for duration is INTERVAL

CREATE TABLE second_table AS
SELECT *, 
       NULL::VARCHAR AS starting_point, 
       NULL::INTERVAL AS duration
FROM public.table_name;


-- update duration column with this query
UPDATE public.second_table
SET duration = ended_at - started_at;

-- update starting_point with this query
-- we sill use this column to fill rows with empty station names
UPDATE public.second_table
SET starting_point = 'starting point: ' || start_lat || ' , ' || start_long;


-- this query substitute starting point value to an empty start station name
UPDATE public.spointndura
SET start_station_name = starting_point
WHERE start_station_name IS NULL;

-- create table to be exported as csv
CREATE TABLE final_table_tobe_exported AS
SELECT 
    DATE(started_at) AS date,
    COUNT(member_casual) FILTER (WHERE member_casual = 'casual') AS total_daily_casual_biker,
    COUNT(member_casual) FILTER (WHERE member_casual = 'member') AS total_daily_member_biker,
    DATE_TRUNC('second', AVG(duration) FILTER (WHERE member_casual = 'casual')) AS average_daily_casual_duration,
    DATE_TRUNC('second', AVG(duration) FILTER (WHERE member_casual = 'member')) AS average_daily_member_duration
FROM public.second_table
GROUP BY date;



-- copy and create two empty columns
CREATE TABLE table_loc_points AS
SELECT *, 
       NULL::VARCHAR AS starting_point, 
       NULL::VARCHAR AS end_point
FROM public.table_name;



-- populate starting points
UPDATE public.table_loc_points
SET starting_point = 'starting point: ' || start_lat || ' , ' || start_long;

-- populate end points
UPDATE public.table_loc_points
SET end_point = 'destination point: ' || end_lat || ' , ' || end_long;


--- update start station name
UPDATE public.table_loc_points
SET start_station_name = starting_point
WHERE start_station_name IS NULL;

--- update end station name
UPDATE public.table_loc_points
SET end_station_name = end_point
WHERE end_station_name IS NULL;

-- make column named route which is concatenation of start_station_name and end_station name
CREATE TABLE table_route AS
SELECT *, 
       NULL::VARCHAR AS route
FROM public.table_loc_points;


--- end station name
UPDATE public.table_route
SET end_station_name = 'no_station_name'
WHERE end_station_name IS NULL;

--- update route
UPDATE public.table_route
SET route = 'from ' || start_station_name || ' to ' || end_station_name;

--- create new table
CREATE TABLE exportable (
    route VARCHAR(255) PRIMARY KEY,
    number_of_members INT,
    number_of_casuals INT
);

--- this compute how often a route use althroughout the year (12-months worth data)
INSERT INTO exportable (route, number_of_members, number_of_casuals)
SELECT
    route,
    SUM(CASE WHEN member_casual = 'member' THEN 1 ELSE 0 END) AS number_of_members,
    SUM(CASE WHEN member_casual = 'casual' THEN 1 ELSE 0 END) AS number_of_casuals
FROM
    public.table_route
GROUP BY
    route;

--- export table as csv
COPY public.exportable TO 'path\to\csv\file' DELIMITER ',' CSV HEADER;


