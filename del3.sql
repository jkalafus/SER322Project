CREATE SCHEMA BOOKS;
​
CREATE TABLE Book
(
  ISBN int not null, 
  Title nvarchar(200) not null, 
  IsRead bit, 
  NumberOfPages int not null,
  constraint BookPK
    primary key (ISBN),
);
                  
CREATE TABLE Author
(
  Id int not null, 
  ProfessionalDesignation nvarchar(10), 
  FirstName nvarchar(50) not null, 	  
  LastName nvarchar(100) not null, 
  constraint AuthorPK
    primary key (Id),
);
                    
CREATE TABLE Publisher
(
  Id int not null, 
  PName nvarchar(200) not null, 
  Address nvarchar(200), 
  constraint PublisherPK
    primary key (Id),
);
​
CREATE TABLE Genre
(
  GName nvarchar(20) not null, 
  GType nvarchar(20), 
  constraint GenrePK
    primary key (GName),
  );
​
CREATE TABLE BFormat
(
  FName nvarchar(20) not null, 
  constraint BFormatPK
    primary key (FName),
);

create table Writes
(
  ISBN int not null,
  AuthorId int not null,
  constraint WritesFKtoBook
    foreign key (ISBN) references Book(ISBN)
      on delete cascade on update cascade,
  constraint WritesFKtoAuthor
    foreign key (AuthorId) references Author(Id)
      on delete cascade on update cascade,
);

create table Publishes
(
  ISBN int not null,
  PublisherId int not null,
  constraint PublishesFKtoBook
    foreign key (ISBN) references Book(ISBN)
      on delete cascade on update cascade,
  constraint PublishesFKtoPublisher
    foreign key (Publisher) references Publisher(Id)
      on delete cascade on update cascade,
);

create table Belongs
(
  ISBN int not null,
  GenreName nvarchar(20) not null,
  constraint BelongsFKtoBook
    foreign key (ISBN) references Book(ISBN)
      on delete cascade on update cascade,
  constraint BelongsFKtoGenre
    foreign key (GenreName) references Genre(GName)
      on delete cascade on update cascade,
);

create table Is_of_type
(
  ISBN int not null,
  FormatName nvarchar(20) not null,
  constraint Is_of_typeFKtoBook
    foreign key (ISBN) references Book(ISBN)
      on delete cascade on update cascade,
  constraint IS_of_typeFKtoBFormat
    foreign key (FormatName) references BFormat(FName)
      on delete cascade on update cascade,
);
