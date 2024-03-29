-- 1. What query would you run to get all the countries that speak Slovene?
-- Your query should return the name of the country, language and language percentage. 
-- Your query should arrange the result by language percentage in descending order. (1)
select c.name, l.language, l.percentage 
from countries c join languages l
on c.id = l.country_id
where l.language = 'Slovene'
order by (l.percentage) desc;

-- #######################################################################################
-- 2. What query would you run to display the total number of cities for each country?
-- Your query should return the name of the country and the total number of cities.
-- Your query should arrange the result by the number of cities in descending order. (3)
select c.name, count(ci.id) as "Num of cities"
from countries c join cities ci
on c.id = ci.country_id 
group by c.name
order by count(ci.id) desc;

-- #######################################################################################
-- 3. What query would you run to get all the cities in Mexico with a population of greater than 500,000?
-- Your query should arrange the result by population in descending order. (1)
-- Using join
select c.name, c.population 
from cities c join countries co 
on c.country_id = co.id
where co.name = "Mexico" and 
c.population > 500000
order by c.population desc; 

-- Using nested select
select c.name, c.population 
from cities c 
where c.population > 500000 and c.country_id = (select id from countries co where co.name = "Mexico" )
order by c.population desc; 

-- #######################################################################################
-- 4. What query would you run to get all languages in each country with a percentage greater than 89%?
-- Your query should arrange the result by percentage in descending order. (1)
select c.name, l.language, l.percentage
from countries c join languages l
on c.id = l.country_id 
where l.percentage > .89
order by l.percentage desc;

-- #######################################################################################
-- 5. What query would you run to get all the countries with Surface Area below 501 and Population greater than 100,000? (2)
select name, surface_area, population 
from countries  
where surface_area < 501.0 and 
population > 100000;

-- #######################################################################################
-- 6. What query would you run to get countries with only Constitutional Monarchy 
-- with a capital greater than 200 and a life expectancy greater than 75 years? (1)
select c.name, c.government_form, c.capital, c.life_expectancy 
from countries c
where government_form = "Constitutional Monarchy " and 
	  capital > 200 and 
      life_expectancy > 75.0;

-- #######################################################################################
-- 7. What query would you run to get all the cities of Argentina inside the Buenos Aires district and have the population greater than 500, 000?
-- The query should return the Country Name, City Name, District and Population. (2)
select co.name, c.name, c.district, c.population 
from cities c join countries co
where c.district = "Buenos Aires" and 
c.population > 500000 and 
co.name = "Argentina";

-- #######################################################################################
-- 8. What query would you run to summarize the number of countries in each region?
-- The query should display the name of the region and the number of countries.
-- Also, the query should arrange the result by the number of countries in descending order. (2)
select distinct c1.region, count(distinct c2.id) as "number of countries"
from  countries c1 join countries c2
on c1.region = c2.region
group by c1.region
order by count(distinct c2.id) desc;

select distinct c.region, count(*) as "number of countries"
from  countries c
group by c.region
order by count(*) desc;