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

-- 8. 
select id into @friend_id from friends where name like "Иванов Иван";

select books.id into @book_id from books
join authors_books on books.id = authors_books.books_id
join authors on authors_books.authors_id = authors.id
where title like "Божественная комедия" and authors.name like "Данте Алигьери";

update books 
set friends_id = @friend_id
where id = @book_id;


select * from books 
join authors_books on books.id = authors_books.books_id
join authors on authors_books.authors_id = authors.id
where title like "Божественная комедия";


-- 9. 
select id into @shelf_id from shelves where title = 'Полка в кабинете';
insert into authors (name) values ('Стивен Хокинг');
insert into books (title, year, shelves_id) values ('Краткие ответы на большие вопросы', 2020, @shelf_id);
SELECT LAST_INSERT_ID() into @book_id;
insert into authors_books (books_id, authors_id) values (@book_id, @author_id);
