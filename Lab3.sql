-- 1
select count(distinct last_name) from actor; -- 121

-- 2
select count(distinct language_id) from film; -- 1

-- 3
select count(film_id) from film
where rating = 'PG-13'; -- 223

-- 4
select title, length from film
order by length desc
limit 10;

-- 5
select datediff(now(), min(rental_date)) from rental; -- 6769 days

-- 6
select rental_id, rental_date, 
	extract(month from rental_date) as month,
    dayname(rental_date) as weekday from rental
limit 20;

-- 7
select rental_id, rental_date,
    extract(month from rental_date) as month,
    dayname(rental_date) as weekday,
    case 
        when dayofweek(rental_date) in (1, 7) then 'weekend'
        else 'workday'
    end as day_type
from rental;

-- 8 
select count(rental_id) from rental
where date_format(rental_date, '%Y-%m') = date_format(now() - interval 1 month, '%Y-%m'); -- 0
