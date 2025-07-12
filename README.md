# Cyclistic Bike-Share Data Analysis: Converting Casual Riders to Annual Members

## 💡 Project Overview

This project analyzes Cyclistic's historical bike trip data from 2019 and 2020 to understand the differences in how casual riders and annual members use the bike-share service. [cite_start]The ultimate goal is to design a new marketing strategy to convert casual riders into annual members, as annual members are significantly more profitable. [cite: 32, 34]

[cite_start]**Business Task:** How do annual members and casual riders use Cyclistic bikes differently? [cite: 44, 45]

## 📊 Data Sources

[cite_start]The analysis uses Cyclistic's historical trip data, specifically two tables from an SQL Server database named `Cyclistic_bike_trips`: [cite: 224, 226]

* [cite_start]`Cyclistic_trips_2019`: Contains bike rental records for the year 2019. [cite: 226]
* [cite_start]`Cyclistic_trips_2020`: Contains bike rental records for the year 2020. [cite: 226]

[cite_start]These datasets are publicly available from Motivate International Inc. (though named differently for this case study as Cyclistic is fictional). [cite: 68] [cite_start]Data privacy issues prevent the use of personally identifiable information. [cite: 69]

**Key Columns Used Across Tables:**

| Column Name (2019)        | Column Name (2020)        | Explanation                          | Data Type  |
| :-------------------------- | :-------------------------- | :----------------------------------- | :--------- |
| `trip_id_2019`              | `ride_id_2020`              | Unique ID of each trip/ride.         | `int`/`nvarchar` |
| `start_date_time_2019`      | `start_date_time_2020`      | Date-time the trip started.          | `datetime` |
| `end_date_time_2019`        | `end_date_time_2020`        | Date-time the trip ended.            | `datetime` |
| `from_station_name_2019`    | `start_station_name_2020`   | Name of starting station.            | `nvarchar` |
| `to_station_name_2019`      | `end_station_name_2020`     | Name of ending station.              | `nvarchar` |
| `membership_type_2019`      | `membership_type_2020`      | Type of membership (Casual/Member).  | `nvarchar` |
| `ride_duration_2019[hh:mm:ss]` | `trip_length(hh:mm:ss)_2020` | Length of each bike trip.            | `time`     |
| `day_trip_started_2019`   | `start_time_day_2020`     | Day of the week trip started.        | `varchar`  |
| `start_time_month_2019`   | `start_time_month_2020`   | Month of the year trip started.      | `varchar`  |
| `start_trip_time_2019`      | `trip_start_time_2020`      | Hour of the day the trip started.    | `varchar`  |
| `membership_gender_2019`    | N/A                         | Gender of each cyclist (2019 only).  | `nvarchar` |
| `birthyear_2019_cyclists`  | N/A                         | Birth year of each cyclist (2019 only). | `smallint` |
| N/A                         | `rideable_type_2020`      | Type of bike used (2020 only).       | `nvarchar` |

## 🛠️ Tools Used

* [cite_start]**Microsoft SQL Server**: For data storage, cleaning, transformation, and querying. [cite: 224, 159]
* [cite_start]**Tableau**: For creating compelling data visualizations. [cite: 194]
* [cite_start]**Microsoft Excel / Google Sheets**: For initial data preparation and understanding. [cite: 113, 141]

## 🚀 Analysis Process

[cite_start]The analysis followed the steps of the data analysis process: **Ask, Prepare, Process, Analyze, Share, and Act**. [cite: 6]

1.  [cite_start]**Ask**: Defined the business task and guiding questions. [cite: 40, 56]
2.  [cite_start]**Prepare**: Identified data sources, ensured data organization, and considered credibility and privacy. [cite: 74, 84, 85, 87]
3.  [cite_start]**Process**: Performed data cleaning and transformation using SQL, including: [cite: 91, 100]
    * [cite_start]Ensuring data integrity. [cite: 95]
    * [cite_start]Calculating ride length. [cite: 117, 118]
    * [cite_start]Extracting day of the week. [cite: 119]
    * [cite_start]Making columns consistent where necessary. [cite: 142]
4.  [cite_start]**Analyze**: Conducted descriptive analysis and identified trends using SQL queries and pivot tables. [cite: 124, 137, 144, 149, 161, 162]
    * [cite_start]Calculated mean, max, and mode of ride lengths and days of the week. [cite: 146, 147, 148]
    * [cite_start]Explored average ride lengths by membership type and day of the week. [cite: 150, 151, 152]
    * [cite_start]Merged data for a full-year view where appropriate. [cite: 155]
5.  [cite_start]**Share**: Created supporting visualizations and summarized key findings. [cite: 172, 190]
6.  [cite_start]**Act**: Developed top recommendations based on the analysis. [cite: 200, 201]

## ❓ Data-Driven Questions & SQL Queries

All SQL queries used for the analysis are located in the `sql/data_driven_questions.sql` file. Here's a summary of the questions addressed:

1.  Total number of trips for each year (2019 and 2020).
2.  Average ride duration for each membership type in 2019 and 2020.
3.  Top 10 most popular starting stations for bike trips in 2019 and 2020.
4.  Top 10 most popular ending stations for bike trips in 2019 and 2020.
5.  Distribution of trip durations (short, medium, long) for each membership type in both years.
6.  Monthly trend of bike trips for 2019 and 2020.
7.  Gender distribution of cyclists in 2019.
8.  Hourly distribution of trips for members vs. casual riders in 2019 and 2020 (12-hour AM/PM format).
9.  Average age of members who rent bikes in 2019.
10. How rideable bike types affect trip duration in 2020.
11. Mean ride length or duration of a trip for the 2019 and 2020 tables.
12. Breakdown of trips by start station and end station (route popularity) for 2019 and 2020.
13. How the popularity of certain stations changes over different months of the year for 2019 and 2020.
14. Average ride length or trip duration by days of the week for the 2019 and 2020 tables.
15. Average age of cyclists by membership type in 2019.
16. Average ride duration for each membership type by days of the week for the 2019 and 2020 tables (Pivoted View for easy comparison).

## 📊 Visualizations

(Once you create your visualizations in Tableau, you would export them as images and place them in the `visualizations/` folder. Then, you'd embed them here with brief descriptions.)

Example:

### Average Ride Duration by Day and Member Type (2019 vs 2020)
* **Insight**: This visualization clearly shows that casual riders consistently take longer trips, especially on weekends, compared to members. This highlights a key behavioral difference.

## 📈 Key Findings & Recommendations

(This section would be populated after your full analysis, drawing from the insights gained from the data-driven questions and visualizations. You'll align this with the business task of converting casual riders to members. Refer back to the core insights you gain from your SQL queries and Tableau visualizations).

**Example Key Findings (based on our analysis):**
* Casual riders use bikes for significantly longer durations, particularly on weekends, suggesting leisure use. Members, conversely, use bikes for shorter, more consistent durations, likely for commuting or quick errands.
* Certain stations are consistently popular year-round, while others show strong seasonal peaks, especially in warmer months.
* Rideable bike types in 2020 have different average durations, with docked bikes showing longer average times, potentially indicating their use for more relaxed, longer rides.

**Example Top Three Recommendations:**
1.  **Target Weekend Riders with Membership Perks**: Offer weekend-specific discounts or loyalty programs to casual riders who frequently use bikes for long durations on Saturdays and Sundays.
2.  **Promote Weekday Commute Benefits**: Highlight the convenience and cost-effectiveness of annual memberships for weekday commutes, potentially with promotions near popular commuter stations.
3.  **Tiered Membership Options**: Introduce flexible membership tiers (e.g., a "weekend warrior" pass or a "weekday commuter" pass) that cater to distinct casual rider behaviors to ease the transition to full annual membership.

## 🤝 Connecting to Tableau

To connect your SQL Server database (`Cyclistic_bike_trips`) to Tableau and join the two tables (`Cyclistic_trips_2019` and `Cyclistic_trips_2020`), follow these general steps:

1.  **Open Tableau Desktop**: Launch the application.
2.  **Connect to Data**:
    * Under "Connect" in the left pane, select "Microsoft SQL Server".
    * Enter your server details (server name, authentication method, database name: `Cyclistic_bike_trips`).
    * Click "Sign In".
3.  **Drag Tables to Canvas**:
    * Once connected, you'll see the tables in your database. Drag `Cyclistic_trips_2019` and `Cyclistic_trips_2020` onto the canvas in the "Data Source" tab.
4.  **Create Joins**:
    * Since these tables represent different years, a direct `INNER JOIN` on common `trip_id` or `ride_id` is not appropriate for combining all records. Instead, you'll likely want to use a **UNION** to stack the data if you intend to analyze them as one continuous dataset (e.g., total trips over two years).
    * However, for answering specific questions about **differences between years or member types**, you would analyze them separately or use **blending** in Tableau.
    * **If you absolutely needed a "join" for common fields that represent the *same entity across years* (e.g., station IDs if they are consistent), you would define the join key.** But for analyzing trip data across years, a union or separate analysis is usually more fitting.
    * **For our data-driven questions, you'd typically handle 2019 and 2020 data separately or UNION them if the schema allows for combining similar fields (e.g., `start_station_name` from both tables).** Tableau's data blending feature is excellent for comparing data from different sources (like your two separate year tables) without a direct join.

### Visualizations You Can Create in Tableau:

Aligning with the data-driven questions, here are some powerful visualizations:

* **Bar Charts**:
    * **Total Trips by Year**: Simple bar chart showing `COUNT(trip_id)` for each year. (Q1)
    * **Top 10 Stations (Start/End)**: Bar charts for `NumberOfTrips` by `StationName`. (Q3, Q4)
    * **Monthly Trip Trends**: Bar chart showing `NumberOfTrips` for each `Month`. (Q6)
    * **Hourly Trip Distribution**: Bar chart showing `NumberOfTrips` by `StartHour` with `membership_type` on color. (Q8)
* **Grouped Bar Charts / Stacked Bars**:
    * **Trip Duration Categories by Membership Type**: Stacked bar chart showing `NumberOfTrips` for each `TripDurationCategory` within `membership_type`. (Q5)
* **Tables / Cross-Tabulations**:
    * **Average Ride Duration by Day and Member Type (Pivoted)**: This is best represented as a cross-tab (table) in Tableau, similar to our Q16 example. You can use conditional formatting (color scales) to quickly highlight longer/shorter durations.
* **Maps**:
    * If you had station coordinates for both years (you have `start_lat`, `start_lng`, `end_lat`, `end_lng` for 2020, and could potentially get it for 2019 or use station IDs), you could create maps showing popular start/end stations, or even flow maps for routes. (Relates to Q3, Q4, Q12)
* **Line Charts**:
    * **Monthly Trend over time**: Line chart showing `NumberOfTrips` per month for each year on the same axis for comparison. (Q6)

By following this structure and filling in your specific analysis results and visualizations, you'll have a comprehensive and professional GitHub repository for your Cyclistic case study!
