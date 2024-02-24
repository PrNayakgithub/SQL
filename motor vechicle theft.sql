select * from locations;
select * from make_details;
select * from stolen_vehicles;

-- How many vechicle stolen in day of the week?

select DAYNAME(date_stolen) AS day_of_week,
       COUNT(*) AS theft_count
from stolen_vehicles
group by day_of_week
order by theft_count DESC;


2.What types of vehicles are most often and least often stolen? Does this vary by region?

-- Most often stolen vehicle types
Select vehicle_type,
       COUNT(*) AS theft_count
From stolen_vehicles
Group by vehicle_type
Order by theft_count DESC;

-- Least often stolen vehicle types
select vehicle_type,
       COUNT(*) AS theft_count
from stolen_vehicles
group by vehicle_type
order by theft_count ASC;

-- Variation by region
select region,
       vehicle_type,
       COUNT(*) AS theft_count
from stolen_vehicles
join locations ON stolen_vehicles.location_id = locations.location_id
group by region, vehicle_type
order by region, theft_count DESC;


3.What is the average age of the vehicles that are stolen? Does this vary based on the vehicle type?

-- Overall average age of stolen vehicles

select AVG(YEAR(CURRENT_DATE()) - model_year) AS avg_age
from stolen_vehicles;

-- Average age of stolen vehicles by type

SELECT vehicle_type,
       AVG(YEAR(CURRENT_DATE()) - model_year) AS avg_age
FROM stolen_vehicles
GROUP BY vehicle_type;

4.Which regions have the most and least number of stolen vehicles? What are the characteristics of the regions?

-- Regions with the most stolen vehicles
select region,
       COUNT(*) AS theft_count,
       population,
       density,
       country
from stolen_vehicles
join locations ON stolen_vehicles.location_id = locations.location_id
Group by region, population, density, country
order by theft_count DESC
LIMIT 1;


-- Regions with the least stolen vehicles
select region,
       COUNT(*) AS theft_count,
       population,
       density,
       country
from stolen_vehicles
join locations ON stolen_vehicles.location_id = locations.location_id
group by region,population, density, country
order by theft_count ASC
LIMIT 1;
