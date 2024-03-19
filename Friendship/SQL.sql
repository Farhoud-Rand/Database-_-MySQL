SELECT * FROM users u
LEFT JOIN friendships f ON u.id = f.user_id 
LEFT JOIN users as u2 ON u2.id = f.friend_id;

# Query 8: Display all relationships
select concat_ws(" ",u1.first_name, u1.last_name) as "user name", concat_ws(" ",u2.first_name, u2.last_name) as "friend name"
from users u1 join friendships f 
on u1.id = f.user_id join users u2 
on u2.id = f.friend_id;

SELECT distinct concat_ws(" ",u1.first_name, u1.last_name) as "user name", concat_ws(" ",u2.first_name, u2.last_name) as "friend name"
from friendships f1 join  friendships f2 
on f1.user_id = f2.friend_id 
and f1.friend_id = f2.user_id join users u1 
on f1.user_id = u1.id join users u2 
on f1.friend_id = u2.id;

-- Query 9: Retrun all users who are freinds with the first user 
select concat_ws(" ",u1.first_name, u1.last_name) as "user name", concat_ws(" ",u2.first_name, u2.last_name) as "friend name"
from users u1 join friendships f 
on u1.id = f.user_id join users u2 
on u2.id = f.friend_id
where u1.id = 1;

select concat_ws(" ",u1.first_name, u1.last_name) as "user name", concat_ws(" ",u2.first_name, u2.last_name) as "friend name"
from users u1 join friendships f 
on u1.id = f.user_id join users u2 
on u2.id = f.friend_id
where u2.id = 1;

-- Query 10: return the count of all relationships
select count(distinct f.id)
from friendships f;

-- Query 11: Find who has the most friends and return the count of their friends 
select concat_ws(" ",u1.first_name, u1.last_name) as "user_name", count(f.user_id) as "Number of Friends"
from users u1 join friendships f 
on u1.id = f.user_id join users u2 
on u2.id = f.friend_id
group by u1.id
order by count(f.user_id) desc;

-- Query 12: return the friends of the user_id = 3 ordered by alphabetical order
select concat_ws(" ",u1.first_name, u1.last_name) as "user name", concat_ws(" ",u2.first_name, u2.last_name) as "friend name"
from users u1 join friendships f 
on u1.id = f.user_id join users u2 
on u2.id = f.friend_id
where u1.id = 3
order by u2.first_name, u2.last_name;