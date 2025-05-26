-- 1.

select authors.name
from authors
join authors_books on authors.id = authors_books.authors_id
group by authors.id
order by count(authors_books.books_id) desc
limit 1;


-- 2.
select title, year
from books
where year is not null
order by year asc
limit 5;


-- 3. 
select count(*)
from books
join shelves on books.shelves_id = shelves.id
where shelves.title = 'Полка в кабинете';

-- 4.
select books.title, authors.name author_name, books.year
from books
join shelves on books.shelves_id = shelves.id
join authors_books on books.id = authors_books.books_id
join authors on authors_books.authors_id = authors.id
where shelves.title = 'Полка в спальне';

-- 5.
select books.title, books.year
from books 
join authors_books on books.id = authors_books.books_id
join authors on authors_id = authors.id
where authors.name = "Лев Толстой"; 


-- 6. 
select books.title
from books 
join authors_books on books.id = authors_books.books_id
join authors on authors_id = authors.id
where authors.name like "А%";

-- 7. 
select books.title, authors.name 
from books
join shelves on books.shelves_id = shelves.id
left join authors_books on books.id = authors_books.books_id
left join authors on authors_books.authors_id = authors.id
where shelves.title like '%верхняя%' or shelves.title like '%нижняя%';

