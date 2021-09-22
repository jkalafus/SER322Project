/* 
Select all books and their corresponding author from the database.
*/
select book.title as 'Title', author.lastName as 'Author'
from author, writes, book
where author.id = writes.authorId
	and writes.isbn = book.isbn;