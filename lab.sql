-- Q1
SELECT DISTINCT c.first_name, c.last_name, c.email
FROM customer c
LEFT JOIN rental r ON r.customer_id = c.customer_id;

-- Q2

SELECT distinct c.customer_id, concat(c.first_name,' ',c.last_name) as Full_name, sum(p.amount)
FROM customer c
LEFT JOIN rental r ON r.customer_id = c.customer_id
left join payment p on  r.customer_id = p.customer_id
group by customer_id;

-- Q3

select distinct c.customer_id, concat(c.first_name,' ',c.last_name) as Full_name, c.email 
from customer c
left join rental r ON c.customer_id = r.customer_id
left join inventory i ON r.inventory_id = i.inventory_id
left join film_category fc on i.film_id = fc.film_id
left join category ca on fc.category_id = ca.category_id
where name = 'Action';

select distinct customer_id, concat(first_name,' ',last_name) as Full_name, email 
from customer 
where customer_id in (select customer_id from rental
	where inventory_id in (select inventory_id from inventory
    where film_id in (select film_id from film_category
    where category_id = (select category_id from category
    where name ='action'))));
    
-- both are more or less the same


-- Q4
select customer_id,
sum(case when amount <= 3  then amount else 0 end) as low,
sum(case when amount > 2 and amount <= 4 then amount else 0 end) as medium,
sum(case when amount > 4 then amount else 0 end) as hight

from payment

group by customer_id
    


