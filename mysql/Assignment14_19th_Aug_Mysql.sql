
#show db
show DATABASES;
#create and use database myineurondb
create DATABASE myineurondb;
use myineurondb;

/*-----------------problem statement-1--------------------------
select the list of id's who has all the required skills
----------------------------------------------------------------*/

#create a table to store candidate id and technology
CREATE Table cndt_technology(
    Id INT,
    technology VARCHAR(25)
);

#insert the id and technology to the table
INSERT INTO cndt_technology VALUES(1,"python"),(1,"datascience"),(1,"sql"),(2,"python"),(2,"datascience"),(3,"datascience"),(3,"sql");
select * from cndt_technology;

#select the list of id's who has all the required skills
select Id,COUNT(DISTINCT technology) as tech_count 
from cndt_technology where technology in ("python","datascience","sql")
GROUP BY Id HAVING tech_count =3;

#-------------------------------------------------------------------


/*---------------------problem statement-2----------------------------
select the list of id's product of product info that has 0 likes
----------------------------------------------------------------------*/


#create table product_info
CREATE TABLE product_info(
    product_id INT,
    product_name VARCHAR(25)
);

#insert data into product_info
insert into product_info VALUES(1001,"blog"),(1002,"youtube"),(1003,"education");

select * from  product_info;


#create table product_likes_info
create table product_likes_info(
    usr_id int,
    product_id int,
    liked_date DATE
);

#insert data to product_likes_info
insert into product_likes_info values(1,1001,"2023-08-18"),(2,1003,"2023-08-19");
select * from product_likes_info;


#select the list of id's product of product info that has 0 likes in product_likes_info
select * from product_info where  product_id not in (select product_id from product_likes_info);





