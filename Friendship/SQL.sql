SELECT * FROM users u
LEFT JOIN friendships f ON u.id = f.user_id 
LEFT JOIN users as u2 ON u2.id = f.friend_id;

select concat_ws(" ",u1.first_name, u1.last_name) as "user name", concat_ws(" ",u2.first_name, u2.last_name) as "friend name"
from users u1 join friendships f 
on u1.id = f.user_id join users u2 
on u2.id = f.friend_id;
