SET NAMES utf8mb4;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';
SET @old_autocommit=@@autocommit;

USE `friendships` ;

SET AUTOCOMMIT=0;
-- Add users according to question 
insert into users (first_name, last_name, created_at, updated_at) values 
('Chris','Baker','2006-02-15 04:34:33', '2020-02-15 04:34:33'),
('Jessica','Davidson','2006-02-15 04:34:33', '2016-02-15 04:34:33'),
('James','Johnson','2006-02-15 04:34:33','2023-02-15 04:34:33'),
('Diana','Smith','2006-02-15 04:34:33','2023-02-15 04:34:33');
select * from users;

-- Put friendship according to the table 
insert into friendships (user_id, friend_id,created_at, updated_at) values 
(1,2, now(), now()),
(1,3, now(), now()),
(1,4, now(), now()),
(4,1, now(), now()),
(3,1, now(), now()),
(2,1, now(), now());

select * from friendships;
