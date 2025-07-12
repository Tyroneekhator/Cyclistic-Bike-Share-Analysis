
-- SQL Queries for Cyclistic Bike-Share Data Analysis

-- 1. What is the total number of trips for each year (2019 and 2020)?
-- This provides a high-level overview of the volume of bike usage year over year.

-- SQL Code Snippet (for 2019):
SELECT
    COUNT(trip_id_2019) AS TotalTrips_2019 -- This counts all unique trip IDs in 2019, naming the result 'TotalTrips_2019'.
FROM
    Cyclistic_trips_2019; -- This specifies that we are looking at data from the 'Cyclistic_trips_2019' table.

-- SQL Code Snippet (for 2020):
SELECT
    COUNT(ride_id_2020) AS TotalTrips_2020 -- This counts all unique ride IDs in 2020, naming the result 'TotalTrips_2020'.
FROM
    Cyclistic_trips_2020; -- This specifies that we are looking at data from the 'Cyclistic_trips_2020' table.

-- 2. What is the average ride duration for each membership type in 2019 and 2020?
-- This question helps to understand if members or casual riders tend to take longer trips, which is crucial for marketing and service adjustments.

-- SQL Code Snippet (for 2019):
SELECT
    membership_type_2019, -- This selects the type of membership.
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
-- ... and so on for all 16 questions and their respective SQL code snippets.
