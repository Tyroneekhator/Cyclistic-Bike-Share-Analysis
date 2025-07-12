-- SQL Queries and Result Templates for Cyclistic Bike-Share Data Analysis

-- =======================================================================================================================
-- SECTION: DATA-DRIVEN QUESTIONS AND SQL QUERIES
-- This section contains SQL queries designed to answer key data-driven questions about Cyclistic bike trip data.
-- Each query is followed by a placeholder for its expected output.
-- =======================================================================================================================


-- 1. What is the total number of trips for each year (2019 and 2020)?
-- This provides a high-level overview of the volume of bike usage year over year.

-- SQL Code Snippet (for 2019):
SELECT
    COUNT(trip_id_2019) AS TotalTrips_2019
FROM
    Cyclistic_trips_2019;

/*
--- RESULT TEMPLATE for Question 1 (2019) ---
[Paste your 2019 query result here, e.g., as a Markdown table or raw text]
Example:
TotalTrips_2019
-------------
1000000
*/

-- SQL Code Snippet (for 2020):
SELECT
    COUNT(ride_id_2020) AS TotalTrips_2020
FROM
    Cyclistic_trips_2020;

/*
--- RESULT TEMPLATE for Question 1 (2020) ---
[Paste your 2020 query result here, e.g., as a Markdown table or raw text]
Example:
TotalTrips_2020
-------------
1200000
*/

-----------------------------------------------------------------------------------------------------------------------

-- 2. What is the average ride duration for each membership type in 2019 and 2020?
-- This question helps to understand if members or casual riders tend to take longer trips, which is crucial for marketing and service adjustments.

-- SQL Code Snippet (for 2019):
SELECT
    membership_type_2019,
    CAST(DATEADD(second,
        AVG(
            DATEPART(hour, "ride_duration_2019[hh:mm:ss]") * 3600 +
            DATEPART(minute, "ride_duration_2019[hh:mm:ss]") * 60 +
            DATEPART(second, "ride_duration_2019[hh:mm:ss]")
        ),
        '00:00:00'
    ) AS time) AS AverageRideDuration
FROM
    Cyclistic_trips_2019
GROUP BY
    membership_type_2019;

/*
--- RESULT TEMPLATE for Question 2 (2019) ---
[Paste your 2019 query result here]
Example:
membership_type_2019 | AverageRideDuration
---------------------|--------------------
Casual               | 00:35:15
Member               | 00:18:30
*/

-- SQL Code Snippet (for 2020):
SELECT
    membership_type_2020,
    CAST(DATEADD(second,
        AVG(
            DATEPART(hour, "trip_length(hh:mm:ss)_2020") * 3600 +
            DATEPART(minute, "trip_length(hh:mm:ss)_2020") * 60 +
            DATEPART(second, "trip_length(hh:mm:ss)_2020")
        ),
        '00:00:00'
    ) AS time) AS AverageRideDuration
FROM
    Cyclistic_trips_2020
GROUP BY
    membership_type_2020;

/*
--- RESULT TEMPLATE for Question 2 (2020) ---
[Paste your 2020 query result here]
Example:
membership_type_2020 | AverageRideDuration
---------------------|--------------------
casual               | 00:40:20
member               | 00:20:10
*/

-----------------------------------------------------------------------------------------------------------------------

-- 3. What are the top 10 most popular starting stations for bike trips in 2019 and 2020?
-- Identifying popular starting points can inform station placement or marketing efforts for high-demand areas.

-- SQL Code Snippet (for 2019):
SELECT TOP 10
    from_station_name_2019 AS StationName,
    COUNT(trip_id_2019) AS NumberOfTrips
FROM
    Cyclistic_trips_2019
WHERE
    from_station_name_2019 IS NOT NULL
GROUP BY
    from_station_name_2019
ORDER BY
    NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 3 (2019) ---
[Paste your 2019 query result here]
Example:
StationName           | NumberOfTrips
----------------------|--------------
Streeter Dr & Grand Ave | 50000
Michigan Ave & Washington St | 45000
...
*/

-- SQL Code Snippet (for 2020):
SELECT TOP 10
    start_station_name_2020 AS StationName,
    COUNT(ride_id_2020) AS NumberOfTrips
FROM
    Cyclistic_trips_2020
WHERE
    start_station_name_2020 IS NOT NULL
GROUP BY
    start_station_name_2020
ORDER BY
    NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 3 (2020) ---
[Paste your 2020 query result here]
Example:
StationName           | NumberOfTrips
----------------------|--------------
Ellis Ave & 60th St   | 60000
Clark St & Elm St     | 55000
...
*/

-----------------------------------------------------------------------------------------------------------------------

-- 4. What are the top 10 most popular ending stations for bike trips in 2019 and 2020?
-- Understanding popular destinations helps optimize bike redistribution and identify common travel patterns.

-- SQL Code Snippet (for 2019):
SELECT TOP 10
    to_station_name_2019 AS StationName,
    COUNT(trip_id_2019) AS NumberOfTrips
FROM
    Cyclistic_trips_2019
WHERE
    to_station_name_2019 IS NOT NULL
GROUP BY
    to_station_name_2019
ORDER BY
    NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 4 (2019) ---
[Paste your 2019 query result here]
Example:
StationName           | NumberOfTrips
----------------------|--------------
Streeter Dr & Grand Ave | 48000
Lake Shore Dr & Monroe St | 43000
...
*/

-- SQL Code Snippet (for 2020):
SELECT TOP 10
    end_station_name_2020 AS StationName,
    COUNT(ride_id_2020) AS NumberOfTrips
FROM
    Cyclistic_trips_2020
WHERE
    end_station_name_2020 IS NOT NULL
GROUP BY
    end_station_name_2020
ORDER BY
    NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 4 (2020) ---
[Paste your 2020 query result here]
Example:
StationName           | NumberOfTrips
----------------------|--------------
Ellis Ave & 60th St   | 58000
Millennium Park       | 53000
...
*/

-----------------------------------------------------------------------------------------------------------------------

-- 5. What is the distribution of trip durations (e.g., short, medium, long) for each membership type in both years?
-- This provides insight into how different user types utilize bikes for various trip lengths.

-- SQL Code Snippet (for 2019):
SELECT
    membership_type_2019,
    CASE
        WHEN DATEDIFF(minute, start_date_time_2019, end_date_time_2019) <= 15 THEN 'Short (0-15 min)'
        WHEN DATEDIFF(minute, start_date_time_2019, end_date_time_2019) <= 60 THEN 'Medium (16-60 min)'
        ELSE 'Long (>60 min)'
    END AS TripDurationCategory,
    COUNT(trip_id_2019) AS NumberOfTrips
FROM
    Cyclistic_trips_2019
GROUP BY
    membership_type_2019,
    CASE
        WHEN DATEDIFF(minute, start_date_time_2019, end_date_time_2019) <= 15 THEN 'Short (0-15 min)'
        WHEN DATEDIFF(minute, start_date_time_2019, end_date_time_2019) <= 60 THEN 'Medium (16-60 min)'
        ELSE 'Long (>60 min)'
    END
ORDER BY
    membership_type_2019, NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 5 (2019) ---
[Paste your 2019 query result here]
Example:
membership_type_2019 | TripDurationCategory | NumberOfTrips
---------------------|----------------------|--------------
Casual               | Long (>60 min)       | 200000
Casual               | Medium (16-60 min)   | 150000
Casual               | Short (0-15 min)     | 50000
Member               | Short (0-15 min)     | 400000
Member               | Medium (16-60 min)   | 300000
Member               | Long (>60 min)       | 10000
*/

-- SQL Code Snippet (for 2020):
SELECT
    membership_type_2020,
    CASE
        WHEN DATEDIFF(minute, start_date_time_2020, end_date_time_2020) <= 15 THEN 'Short (0-15 min)'
        WHEN DATEDIFF(minute, start_date_time_2020, end_date_time_2020) <= 60 THEN 'Medium (16-60 min)'
        ELSE 'Long (>60 min)'
    END AS TripDurationCategory,
    COUNT(ride_id_2020) AS NumberOfTrips
FROM
    Cyclistic_trips_2020
GROUP BY
    membership_type_2020,
    CASE
        WHEN DATEDIFF(minute, start_date_time_2020, end_date_time_2020) <= 15 THEN 'Short (0-15 min)'
        WHEN DATEDIFF(minute, start_date_time_2020, end_date_time_2020) <= 60 THEN 'Medium (16-60 min)'
        ELSE 'Long (>60 min)'
    END
ORDER BY
    membership_type_2020, NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 5 (2020) ---
[Paste your 2020 query result here]
Example:
membership_type_2020 | TripDurationCategory | NumberOfTrips
---------------------|----------------------|--------------
casual               | Long (>60 min)       | 250000
casual               | Medium (16-60 min)   | 180000
casual               | Short (0-15 min)     | 60000
member               | Short (0-15 min)     | 450000
member               | Medium (16-60 min)   | 350000
member               | Long (>60 min)       | 15000
*/

-----------------------------------------------------------------------------------------------------------------------

-- 6. What is the monthly trend of bike trips for 2019 and 2020?
-- Understanding seasonal patterns helps in resource allocation and targeted marketing campaigns.

-- SQL Code Snippet (for 2019):
SELECT
    start_time_month_(2019) AS TripMonth,
    COUNT(trip_id_2019) AS NumberOfTrips
FROM
    Cyclistic_trips_2019
GROUP BY
    start_time_month_(2019)
ORDER BY
    CASE start_time_month_(2019)
        WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3 WHEN 'April' THEN 4
        WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'July' THEN 7 WHEN 'August' THEN 8
        WHEN 'September' THEN 9 WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12
    END;

/*
--- RESULT TEMPLATE for Question 6 (2019) ---
[Paste your 2019 query result here]
Example:
TripMonth   | NumberOfTrips
------------|--------------
January     | 30000
February    | 35000
...
July        | 150000
...
*/

-- SQL Code Snippet (for 2020):
SELECT
    start_time_month_(2020) AS TripMonth,
    COUNT(ride_id_2020) AS NumberOfTrips
FROM
    Cyclistic_trips_2020
GROUP BY
    start_time_month_(2020)
ORDER BY
    CASE start_time_month_(2020)
        WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3 WHEN 'April' THEN 4
        WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'July' THEN 7 WHEN 'August' THEN 8
        WHEN 'September' THEN 9 WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12
    END;

/*
--- RESULT TEMPLATE for Question 6 (2020) ---
[Paste your 2020 query result here]
Example:
TripMonth   | NumberOfTrips
------------|--------------
January     | 25000
February    | 30000
...
August      | 180000
...
*/

-----------------------------------------------------------------------------------------------------------------------

-- 7. What is the gender distribution of cyclists in 2019?
-- This insight from 2019 can help tailor marketing messages. (Note: Gender data is only available for 2019).

-- SQL Code Snippet (for 2019):
SELECT
    membership_gender_2019 AS Gender,
    COUNT(trip_id_2019) AS NumberOfCyclists,
    CAST(COUNT(trip_id_2019) * 100.0 / SUM(COUNT(trip_id_2019)) OVER() AS DECIMAL(5,2)) AS Percentage
FROM
    Cyclistic_trips_2019
WHERE
    membership_gender_2019 IS NOT NULL AND membership_gender_2019 != ''
GROUP BY
    membership_gender_2019;

/*
--- RESULT TEMPLATE for Question 7 (2019) ---
[Paste your 2019 query result here]
Example:
Gender   | NumberOfCyclists | Percentage
---------|------------------|-----------
Male     | 600000           | 60.00
Female   | 350000           | 35.00
Unknown  | 50000            | 5.00
*/

-----------------------------------------------------------------------------------------------------------------------

-- 8. What is the hourly distribution of trips for members vs. casual riders in 2019 and 2020 (12-hour AM/PM format)?
-- This helps identify peak usage times for different customer segments, informing staffing and bike availability.

-- SQL Code Snippet (for 2019):
SELECT
    membership_type_2019,
    FORMAT(CAST(start_trip_time_2019 AS time), 'hh:mm tt') AS StartHour_12HR,
    COUNT(trip_id_2019) AS NumberOfTrips
FROM
    Cyclistic_trips_2019
GROUP BY
    membership_type_2019,
    FORMAT(CAST(start_trip_time_2019 AS time), 'hh:mm tt')
ORDER BY
    membership_type_2019,
    CAST(start_trip_time_2019 AS time);

/*
--- RESULT TEMPLATE for Question 8 (2019) ---
[Paste your 2019 query result here]
Example:
membership_type_2019 | StartHour_12HR | NumberOfTrips
---------------------|----------------|--------------
Casual               | 12:00 AM       | 1500
Casual               | 08:00 AM       | 20000
...
Member               | 07:00 AM       | 30000
Member               | 05:00 PM       | 40000
...
*/

-- SQL Code Snippet (for 2020):
SELECT
    membership_type_2020,
    FORMAT(CAST(trip_start_time_2020 AS time), 'hh:mm tt') AS StartHour_12HR,
    COUNT(ride_id_2020) AS NumberOfTrips
FROM
    Cyclistic_trips_2020
GROUP BY
    membership_type_2020,
    FORMAT(CAST(trip_start_time_2020 AS time), 'hh:mm tt')
ORDER BY
    membership_type_2020,
    CAST(trip_start_time_2020 AS time);

/*
--- RESULT TEMPLATE for Question 8 (2020) ---
[Paste your 2020 query result here]
Example:
membership_type_2020 | StartHour_12HR | NumberOfTrips
---------------------|----------------|--------------
casual               | 09:00 AM       | 25000
casual               | 03:00 PM       | 35000
...
member               | 08:00 AM       | 45000
member               | 06:00 PM       | 50000
...
*/

-----------------------------------------------------------------------------------------------------------------------

-- 9. What is the average age of members who rent bikes in 2019?
-- This can help understand the demographic of the core membership base for targeted marketing. (Note: Age data is only available for 2019).

-- SQL Code Snippet (for 2019):
SELECT
    AVG("cyclist_age(2019)") AS AverageMemberAge
FROM
    Cyclistic_trips_2019
WHERE
    membership_type_2019 = 'Member'
    AND "cyclist_age(2019)" IS NOT NULL
    AND "cyclist_age(2019)" > 0; -- Assuming age should be positive

/*
--- RESULT TEMPLATE for Question 9 (2019) ---
[Paste your 2019 query result here]
Example:
AverageMemberAge
----------------
38
*/

-----------------------------------------------------------------------------------------------------------------------

-- 10. How do rideable bike types affect trip duration in 2020?
-- Understanding the usage patterns of different bike types can help in fleet management and promotions. (Note: Rideable type data is only available for 2020).

-- SQL Code Snippet (for 2020):
SELECT
    "rideable_type_(2020)" AS RideableType,
    CAST(DATEADD(second,
        AVG(
            DATEPART(hour, "trip_length(hh:mm:ss)_2020") * 3600 +
            DATEPART(minute, "trip_length(hh:mm:ss)_2020") * 60 +
            DATEPART(second, "trip_length(hh:mm:ss)_2020")
        ),
        '00:00:00'
    ) AS time) AS AverageRideDuration
FROM
    Cyclistic_trips_2020
WHERE
    "rideable_type_(2020)" IS NOT NULL
GROUP BY
    "rideable_type_(2020)";

/*
--- RESULT TEMPLATE for Question 10 (2020) ---
[Paste your 2020 query result here]
Example:
RideableType | AverageRideDuration
-------------|--------------------
docked_bike  | 00:45:00
electric_bike| 00:22:30
classic_bike | 00:20:00
*/

-----------------------------------------------------------------------------------------------------------------------

-- 11. What is the mean ride length or duration of a trip for the 2019 and 2020 tables?
-- Overall average duration helps in understanding general usage behavior.

-- SQL Code Snippet (for 2019):
SELECT
    CAST(DATEADD(second,
        AVG(
            DATEPART(hour, "ride_duration_2019[hh:mm:ss]") * 3600 +
            DATEPART(minute, "ride_duration_2019[hh:mm:ss]") * 60 +
            DATEPART(second, "ride_duration_2019[hh:mm:ss]")
        ),
        '00:00:00'
    ) AS time) AS OverallAverageRideDuration_2019
FROM
    Cyclistic_trips_2019;

/*
--- RESULT TEMPLATE for Question 11 (2019) ---
[Paste your 2019 query result here]
Example:
OverallAverageRideDuration_2019
-------------------------------
00:25:00
*/

-- SQL Code Snippet (for 2020):
SELECT
    CAST(DATEADD(second,
        AVG(
            DATEPART(hour, "trip_length(hh:mm:ss)_2020") * 3600 +
            DATEPART(minute, "trip_length(hh:mm:ss)_2020") * 60 +
            DATEPART(second, "trip_length(hh:mm:ss)_2020")
        ),
        '00:00:00'
    ) AS time) AS OverallAverageRideDuration_2020
FROM
    Cyclistic_trips_2020;

/*
--- RESULT TEMPLATE for Question 11 (2020) ---
[Paste your 2020 query result here]
Example:
OverallAverageRideDuration_2020
-------------------------------
00:28:00
*/

-----------------------------------------------------------------------------------------------------------------------

-- 12. What is the breakdown of trips by start station and end station (route popularity) for 2019 and 2020?
-- Understanding popular routes helps identify common travel corridors and potential for route-specific promotions.

-- SQL Code Snippet (for 2019):
SELECT TOP 10
    from_station_name_2019 AS StartStation,
    to_station_name_2019 AS EndStation,
    COUNT(trip_id_2019) AS NumberOfTrips
FROM
    Cyclistic_trips_2019
WHERE
    from_station_name_2019 IS NOT NULL AND to_station_name_2019 IS NOT NULL
GROUP BY
    from_station_name_2019, to_station_name_2019
ORDER BY
    NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 12 (2019) ---
[Paste your 2019 query result here]
Example:
StartStation            | EndStation            | NumberOfTrips
------------------------|-----------------------|--------------
Streeter Dr & Grand Ave | Streeter Dr & Grand Ave | 10000
Michigan Ave & Washington St | Millennium Park       | 8000
...
*/

-- SQL Code Snippet (for 2020):
SELECT TOP 10
    start_station_name_2020 AS StartStation,
    end_station_name_2020 AS EndStation,
    COUNT(ride_id_2020) AS NumberOfTrips
FROM
    Cyclistic_trips_2020
WHERE
    start_station_name_2020 IS NOT NULL AND end_station_name_2020 IS NOT NULL
GROUP BY
    start_station_name_2020, end_station_name_2020
ORDER BY
    NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 12 (2020) ---
[Paste your 2020 query result here]
Example:
StartStation            | EndStation            | NumberOfTrips
------------------------|-----------------------|--------------
Ellis Ave & 60th St   | Ellis Ave & 60th St   | 12000
Clark St & Elm St     | Oak St Beach          | 9000
...
*/

-----------------------------------------------------------------------------------------------------------------------

-- 13. How does the popularity of certain stations change over different months of the year for 2019 and 2020?
-- This helps in understanding seasonal shifts in station usage and optimizing bike distribution.

-- SQL Code Snippet (for 2019):
SELECT TOP 5
    start_time_month_(2019) AS TripMonth,
    from_station_name_2019 AS StationName,
    COUNT(trip_id_2019) AS NumberOfTrips
FROM
    Cyclistic_trips_2019
WHERE
    from_station_name_2019 IS NOT NULL
GROUP BY
    start_time_month_(2019), from_station_name_2019
ORDER BY
    CASE start_time_month_(2019)
        WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3 WHEN 'April' THEN 4
        WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'July' THEN 7 WHEN 'August' THEN 8
        WHEN 'September' THEN 9 WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12
    END, NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 13 (2019) ---
[Paste your 2019 query result here - top 5 stations per month will be a long list, consider sampling or visualizing]
Example (showing top 1 for brevity):
TripMonth   | StationName           | NumberOfTrips
------------|-----------------------|--------------
January     | Union Station         | 1500
February    | Clinton St & Lake St  | 1600
...
July        | Streeter Dr & Grand Ave | 15000
...
*/

-- SQL Code Snippet (for 2020):
SELECT TOP 5
    start_time_month_(2020) AS TripMonth,
    start_station_name_2020 AS StationName,
    COUNT(ride_id_2020) AS NumberOfTrips
FROM
    Cyclistic_trips_2020
WHERE
    start_station_name_2020 IS NOT NULL
GROUP BY
    start_time_month_(2020), start_station_name_2020
ORDER BY
    CASE start_time_month_(2020)
        WHEN 'January' THEN 1 WHEN 'February' THEN 2 WHEN 'March' THEN 3 WHEN 'April' THEN 4
        WHEN 'May' THEN 5 WHEN 'June' THEN 6 WHEN 'July' THEN 7 WHEN 'August' THEN 8
        WHEN 'September' THEN 9 WHEN 'October' THEN 10 WHEN 'November' THEN 11 WHEN 'December' THEN 12
    END, NumberOfTrips DESC;

/*
--- RESULT TEMPLATE for Question 13 (2020) ---
[Paste your 2020 query result here - top 5 stations per month will be a long list, consider sampling or visualizing]
Example (showing top 1 for brevity):
TripMonth   | StationName           | NumberOfTrips
------------|-----------------------|--------------
January     | Ogilvie Transportation Center | 1800
February    | Clinton St & Washington St | 1900
...
August      | Ellis Ave & 60th St   | 18000
...
*/

-----------------------------------------------------------------------------------------------------------------------

-- 14. What is the average ride length or trip duration by days of the week for the 2019 and 2020 tables?
-- This helps pinpoint specific days when casual riders might be more active, informing weekend promotions.

-- SQL Code Snippet (for 2019):
SELECT
    "day_trip_started_(2019)" AS DayOfWeek,
    CAST(DATEADD(second,
        AVG(
            DATEPART(hour, "ride_duration_2019[hh:mm:ss]") * 3600 +
            DATEPART(minute, "ride_duration_2019[hh:mm:ss]") * 60 +
            DATEPART(second, "ride_duration_2019[hh:mm:ss]")
        ),
        '00:00:00'
    ) AS time) AS AverageRideDuration
FROM
    Cyclistic_trips_2019
GROUP BY
    "day_trip_started_(2019)"
ORDER BY
    CASE "day_trip_started_(2019)"
        WHEN 'Sunday' THEN 1 WHEN 'Monday' THEN 2 WHEN 'Tuesday' THEN 3 WHEN 'Wednesday' THEN 4
        WHEN 'Thursday' THEN 5 WHEN 'Friday' THEN 6 WHEN 'Saturday' THEN 7
    END;

/*
--- RESULT TEMPLATE for Question 14 (2019) ---
[Paste your 2019 query result here]
Example:
DayOfWeek | AverageRideDuration
----------|--------------------
Sunday    | 00:40:00
Monday    | 00:20:00
...
Saturday  | 00:45:00
*/

-- SQL Code Snippet (for 2020):
SELECT
    "start_time_day_(2020)" AS DayOfWeek,
    CAST(DATEADD(second,
        AVG(
            DATEPART(hour, "trip_length(hh:mm:ss)_2020") * 3600 +
            DATEPART(minute, "trip_length(hh:mm:ss)_2020") * 60 +
            DATEPART(second, "trip_length(hh:mm:ss)_2020")
        ),
        '00:00:00'
    ) AS time) AS AverageRideDuration
FROM
    Cyclistic_trips_2020
GROUP BY
    "start_time_day_(2020)"
ORDER BY
    CASE "start_time_day_(2020)"
        WHEN 'Sunday' THEN 1 WHEN 'Monday' THEN 2 WHEN 'Tuesday' THEN 3 WHEN 'Wednesday' THEN 4
        WHEN 'Thursday' THEN 5 WHEN 'Friday' THEN 6 WHEN 'Saturday' THEN 7
    END;

/*
--- RESULT TEMPLATE for Question 14 (2020) ---
[Paste your 2020 query result here]
Example:
DayOfWeek | AverageRideDuration
----------|--------------------
Sunday    | 00:48:00
Monday    | 00:22:00
...
Saturday  | 00:50:00
*/

-----------------------------------------------------------------------------------------------------------------------

-- 15. What is the average age of cyclists by membership type in 2019?
-- This helps in understanding the demographic differences between casual riders and members. (Note: Age data is only available for 2019).

-- SQL Code Snippet (for 2019):
SELECT
    membership_type_2019,
    AVG("cyclist_age(2019)") AS AverageAge
FROM
    Cyclistic_trips_2019
WHERE
    "cyclist_age(2019)" IS NOT NULL
    AND "cyclist_age(2019)" > 0
GROUP BY
    membership_type_2019;

/*
--- RESULT TEMPLATE for Question 15 (2019) ---
[Paste your 2019 query result here]
Example:
membership_type_2019 | AverageAge
---------------------|-----------
Casual               | 35
Member               | 38
*/

-----------------------------------------------------------------------------------------------------------------------

-- 16. What is the average ride duration for each membership type by days of the week for the 2019 and 2020 tables (Pivoted View for easy comparison)?
-- This is a critical question for identifying when casual riders take longer trips compared to members, informing conversion strategies.

-- SQL Code Snippet (for 2019 - Pivoted):
SELECT
    membership_type_2019,
    CAST(DATEADD(second, AVG(CASE WHEN "day_trip_started_(2019)" = 'Sunday' THEN DATEDIFF(second, start_date_time_2019, end_date_time_2019) END), '00:00:00') AS time) AS Sunday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "day_trip_started_(2019)" = 'Monday' THEN DATEDIFF(second, start_date_time_2019, end_date_time_2019) END), '00:00:00') AS time) AS Monday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "day_trip_started_(2019)" = 'Tuesday' THEN DATEDIFF(second, start_date_time_2019, end_date_time_2019) END), '00:00:00') AS time) AS Tuesday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "day_trip_started_(2019)" = 'Wednesday' THEN DATEDIFF(second, start_date_time_2019, end_date_time_2019) END), '00:00:00') AS time) AS Wednesday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "day_trip_started_(2019)" = 'Thursday' THEN DATEDIFF(second, start_date_time_2019, end_date_time_2019) END), '00:00:00') AS time) AS Thursday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "day_trip_started_(2019)" = 'Friday' THEN DATEDIFF(second, start_date_time_2019, end_date_time_2019) END), '00:00:00') AS time) AS Friday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "day_trip_started_(2019)" = 'Saturday' THEN DATEDIFF(second, start_date_time_2019, end_date_time_2019) END), '00:00:00') AS time) AS Saturday_AvgDuration
FROM
    Cyclistic_trips_2019
GROUP BY
    membership_type_2019;

/*
--- RESULT TEMPLATE for Question 16 (2019) ---
[Paste your 2019 query result here]
Example:
membership_type_2019 | Sunday_AvgDuration | Monday_AvgDuration | ... | Saturday_AvgDuration
---------------------|--------------------|--------------------|-----|--------------------
Casual               | 00:45:00           | 00:25:00           | ... | 00:50:00
Member               | 00:20:00           | 00:18:00           | ... | 00:22:00
*/

-- SQL Code Snippet (for 2020 - Pivoted):
SELECT
    membership_type_2020,
    CAST(DATEADD(second, AVG(CASE WHEN "start_time_day_(2020)" = 'Sunday' THEN DATEDIFF(second, start_date_time_2020, end_date_time_2020) END), '00:00:00') AS time) AS Sunday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "start_time_day_(2020)" = 'Monday' THEN DATEDIFF(second, start_date_time_2020, end_date_time_2020) END), '00:00:00') AS time) AS Monday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "start_time_day_(2020)" = 'Tuesday' THEN DATEDIFF(second, start_date_time_2020, end_date_time_2020) END), '00:00:00') AS time) AS Tuesday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "start_time_day_(2020)" = 'Wednesday' THEN DATEDIFF(second, start_date_time_2020, end_date_time_2020) END), '00:00:00') AS time) AS Wednesday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "start_time_day_(2020)" = 'Thursday' THEN DATEDIFF(second, start_date_time_2020, end_date_time_2020) END), '00:00:00') AS time) AS Thursday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "start_time_day_(2020)" = 'Friday' THEN DATEDIFF(second, start_date_time_2020, end_date_time_2020) END), '00:00:00') AS time) AS Friday_AvgDuration,
    CAST(DATEADD(second, AVG(CASE WHEN "start_time_day_(2020)" = 'Saturday' THEN DATEDIFF(second, start_date_time_2020, end_date_time_2020) END), '00:00:00') AS time) AS Saturday_AvgDuration
FROM
    Cyclistic_trips_2020
GROUP BY
    membership_type_2020;

/*
--- RESULT TEMPLATE for Question 16 (2020) ---
[Paste your 2020 query result here]
Example:
membership_type_2020 | Sunday_AvgDuration | Monday_AvgDuration | ... | Saturday_AvgDuration
---------------------|--------------------|--------------------|-----|--------------------
casual               | 00:55:00           | 00:30:00           | ... | 01:00:00
member               | 00:25:00           | 00:20:00           | ... | 00:28:00
*/
