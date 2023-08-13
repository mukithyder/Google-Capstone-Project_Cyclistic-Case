##Cleaning & Creating cleaned data##
Create TAble `project-zeus001.Cyclistic_2022_2023.aggregated_data_3`
as
(
SELECT
*
FROM `project-zeus001.Cyclistic_2022_2023.aggregated_data`
WHERE 
  started_at<ended_at AND
  (SELECT
  distinct char_length(ride_id)
FROM `project-zeus001.Cyclistic_2022_2023.aggregated_data`)=16 AND
  EXISTS
  (
  SELECT as struct
  ride_id, count(*) as countNO
FROM `project-zeus001.Cyclistic_2022_2023.aggregated_data`
GROUP BY
  ride_id
HAVING
  countNO=1) AND
  (
    ride_id IS NOT NULL
AND rideable_type IS NOT NULL
AND started_at IS NOT NULL
AND ended_at IS NOT NULL
AND start_station_name IS NOT NULL
AND start_station_id IS NOT NULL
AND end_station_name IS NOT NULL
AND end_station_id IS NOT NULL
AND start_lat IS NOT NULL
AND start_lng IS NOT NULL
AND end_lat IS NOT NULL
AND end_lng IS NOT NULL
AND member_casual IS NOT NULL
)
)