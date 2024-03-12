-- 1. What query would you run to get all the customers inside city_id = 312?
-- Your query should return customer first name, last name, email, and address.
select c.first_name, c.last_name, c.email, a.address, a.city_id 
from customer c join address a 
on c.address_id = a.address_id 
where a.city_id = 312;

-- ##############################################################################
-- 2. What query would you run to get all comedy films?
-- Your query should return film title, description, release year, rating,
-- special features, and genre (category).
-- Using join 
select f.film_id,f.title, f.description, f.release_year, f.rating, f.special_features, c.name as genre
from film f join film_category fc on 
f.film_id = fc.film_id join category c on 
fc.category_id = c.category_id 
where c.name = "Comedy";

-- Using views 
select f.FID, f.title, f.description, f.rating, f.category as genre
from film_list f;

-- To get the film special_features and  film release_year while using views
select f.film_id,f.title, f.description, f.release_year, f.rating, f.special_features, "Comedy" as genre
from film f 
where f.film_id in (select f.FID from film_list f where f.category = "Comedy");

-- ##############################################################################
-- 3. What query would you run to get all the films joined by actor_id=5?
-- Your query should return the actor id, actor name, film title, description, and release year.
select a.actor_id, concat_ws(" ",a.first_name, a.last_name) as "actor_name",f.film_id,f.title, f.description, f.release_year 
from actor a join film_actor fc 
on a.actor_id = fc.actor_id join film f 
on fc.film_id = f.film_id
where a.actor_id = 5;

-- ##############################################################################
-- 4. What query would you run to get all the customers in store_id = 1 and inside these cities (1, 42, 312 and 459)?
-- Your query should return customer first name, last name, email, and address.
select c.store_id, a.city_id , c.first_name, c.last_name, c.email, a.address
from customer c join address a 
on c.address_id = a.address_id 
where c.store_id = 1 and 
a.city_id  in (1,42,312,459);

-- ##############################################################################
-- 5. What query would you run to get all the films with a "rating = G" and "special feature = behind the scenes", joined by actor_id = 15?
-- Your query should return the film title, description, release year, rating, and special feature. 
-- Hint: You may use LIKE function in getting the 'behind the scenes' part
select f.title, f.description, f.release_year, f.rating, f.special_features
from film f join film_actor fa 
on f.film_id = fa.film_id 
where fa.actor_id = 15 and 
f.rating = "G" and 
f.special_features like "%behind the scenes%";

-- ##############################################################################
-- 6. What query would you run to get all the actors that joined in the film_id = 369?
-- Your query should return the film_id, title, actor_id, and actor_name.
select f.film_id, f.title, a.actor_id, concat_ws(" ",a.first_name, a.last_name) as "actor_name"
from actor a join film_actor fc 
on a.actor_id = fc.actor_id join film f 
on fc.film_id = f.film_id
where f.film_id = 369;

-- ##############################################################################
-- 7. What query would you run to get all drama films with a rental rate of 2.99?
-- Your query should return film title, description, release year, rating, special features, and genre (category).
select f.film_id,f.title, f.description, f.release_year, f.rating, f.special_features, c.name as genre,  f.rental_rate
from film f join film_category fc on 
f.film_id = fc.film_id join category c on 
fc.category_id = c.category_id 
where c.name = "Drama" and 
	  f.rental_rate = 2.99;

-- ##############################################################################
-- 8. What query would you run to get all the action films which are joined by SANDRA KILMER?
-- Your query should return film title, description, release year, rating, special features, genre (category), and actor's first name and last name.
select a.actor_id, concat_ws(" ",a.first_name, a.last_name) as "actor_name", f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name as genre 
from actor a join film_actor fc 
on a.actor_id = fc.actor_id join film f 
on fc.film_id = f.film_id join film_category fca
on f.film_id = fca.film_id join category c 
on c.category_id = fca.category_id
where a.first_name = "SANDRA" and 
	  a.last_name = "KILMER" and 
      c.name = "Action" 
order by f.film_id;
      
-- select f.film_id, f.title, f.description, f.release_year, f.rating, f.special_features, c.name as genre, a.actor_id, concat_ws(" ",a.first_name, a.last_name) as "actor_name"
-- from actor a join film_actor fc 
-- on a.actor_id = fc.actor_id join film f 
-- on fc.film_id = f.film_id join film_category fca
-- on f.film_id = fca.film_id 
-- where a.first_name = "SANDRA" and 
-- 	  a.last_name = "KILMER" and 
--       fca.category_id = (select c.category_id form category c where c.name = "Action" );
--       
-- select c.category_id form category c where c.name = "Action";