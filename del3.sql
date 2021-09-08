CREATE SCHEMA BOOKS;
​
CREATE TABLE Book(ISBN int primary key, Title nvarchar(200), IsRead bit, Genre nvarchar(20),
				  BFormat nvarchar(20), PublisherId int, AuthorId int, NumberOfPages int);
                  
CREATE TABLE Author(Id int primary key, ProfessionalDesignation nvarchar(10), FirstName nvarchar(50), 
				  LastName nvarchar(100), foreign key (Id) references Book(AuthorId) on update cascade
				  on delete cascade);
                    
CREATE TABLE Publisher(Id int primary key, PName nvarchar(200), Address nvarchar(200), foreign key (Id) 
				  references Book(PublisherId) on update cascade on delete cascade);
​
CREATE TABLE Genre(GName nvarchar(20) primary key, GType nvarchar(20), foreign key (GName) references
				  Book(Genre) on update cascade on delete cascade);
​
CREATE TABLE BFormat(FName nvarchar(20) primary key, foreign key (FName) references Book(BFormat) on
				  update cascade on delete cascade);