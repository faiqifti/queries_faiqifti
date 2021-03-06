use datasets

--I have two tables,
--user_tab consist of columns userid, country
--order_tab consist of columns orderid, userid, gmv, order_time

select* from user_tab;
select* from order_tab;

--count number of users per country:
select count(userid) as number_of_users, country
from user_tab
group by country;

--join two tables with columns orderid, userid, and country:
select order_tab.orderid, user_tab.userid, user_tab.country
from [order_tab]
inner join user_tab
on order_tab.userid = user_tab.userid
order by userid 

--count number of orders per country:
select count (order_tab.orderid) as number_of_orders, user_tab.country
from [order_tab]
inner join user_tab
on order_tab.userid = user_tab.userid
group by country

--find the first order date of each user:
select userid, min(order_time) as first_occurance
from order_tab
group by userid

--find the number of users who made their first order in each country, each day:
select count (*) number_of_users, 
			min(order_tab.order_time) as first_occurance,
			user_tab.country
from [order_tab]
inner join user_tab
on order_tab.userid = user_tab.userid
group by day(order_tab.order_time), user_tab.country
order by day(order_tab.order_time), user_tab.country

--find the first order GMV of each user. 
--If there is a tie, use the order with the lower orderid:
select user_tab.userid, order_tab.gmv, order_tab.orderid, order_tab.order_time
from [order_tab]
inner join user_tab
on order_tab.userid = user_tab.userid
order by order_tab.order_time, order_tab.orderid





