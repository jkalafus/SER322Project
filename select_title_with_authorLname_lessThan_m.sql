select book.title, author.firstName, author.lastName
from book, author, writes
where book.isbn = writes.isbn
and writes.authorId = author.id
and author.lastName < "M"
group by book.title;