select author.firstName, author.lastName
from author
join writes w ON w.authorId = author.id
join book b ON b.isbn = w.isbn
where b.numberPages > 300;