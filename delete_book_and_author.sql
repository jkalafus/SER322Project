delete from writes
where writes.authorId = (select author.id
from author
where author.lastName = "Austen");

delete from author 
where author.lastName = "Austen";

delete from publishes 
where publishes.isbn = (select book.isbn
from book
where book.title = "Emma");

delete from belongs
where belongs.isbn = (select book.isbn
from book
where book.title = "Emma");

delete from is_of_type
where is_of_type.isbn = (select book.isbn
from book
where book.title = "Emma");

delete from book
where book.title = "Emma";