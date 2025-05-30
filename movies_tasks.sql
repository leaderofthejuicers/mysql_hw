-- 1. 
select count(*) from movies 
join companies on movies.companies_id = companies.id
where companies.title = "Universal Pictures";

-- 2. 
select count(*) from movies 
join directors on movies.directors_id = directors.id
where directors.full_name = "Фрэнсис Форд Коппола";

-- 3. 
select count(*) from movies 
where year > (2025 - 20);

-- 4. 
select distinct genres.title from genres 
join movies on genres.id = movies.genres_id
join directors on movies.directors_id = directors.id 
where directors.full_name = "Стивен Спилберг";

-- 5. 
select movies.title, genres.title genre, directors.full_name director from movies 
join directors on movies.directors_id = directors.id
join genres on movies.genres_id = genres.id
order by budget
limit 5;

-- 6.
select full_name, count(movies.id) from movies
join directors on  movies.directors_id = directors.id 
group by directors.full_name
order by count(movies.id) desc
limit 1;
 
-- 7. 
select movies.title, genres.title 
from movies 
join companies on movies.companies_id = companies.id
join genres on movies.genres_id = genres.id 
where movies.companies_id = ( 
	select companies.id 
	from movies 
	join companies on movies.companies_id = companies.id
	group by companies.id 
	order by sum(movies.budget) desc 
	limit 1
);

-- 8. 
select avg(budget)
from movies 
join companies on movies.companies_id = companies.id
where companies.title = "Warner Bros.";

-- 9. 
select genres.title, count(movies.id) films_count, avg(budget)
from movies 
join genres on movies.genres_id = genres.id
group by genres.title;

-- 10. 
DELETE FROM movies
WHERE id = (
    SELECT movies.id
    FROM movies
    JOIN genres ON movies.genres_id = genres.id
    WHERE movies.title = 'Дикие истории' AND movies.year = 2014 AND genres.title = 'Комедия'
    LIMIT 1
);
