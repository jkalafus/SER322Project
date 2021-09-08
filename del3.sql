create table book (
	isbn nvarchar(20) primary key,
    title nvarchar(200),
    isRead bit,
    numberPages int);

create table author (
	id int primary key,
    professionalDesignation nvarchar(50),
    firstName nvarchar(50),
    lastName nvarchar(50));
    
create table publisher (
	id int primary key,
    pName nvarchar(200),
    address nvarchar(200));
    
create table genre (
	gName nvarchar(20) primary key,
    gtype nvarchar(20));
    
create table bformat (
	fName nvarchar(20) primary key);
    
create table writes (
	isbn nvarchar(20),
    authorId int,
    primary key (isbn, authorId),
    foreign key (isbn) references book(isbn),
    foreign key (authorId) references author(id)
		on update cascade on delete cascade);

create table publishes (
	isbn nvarchar(20),
    publisherId int,
    primary key (isbn, publisherId),
    foreign key (isbn) references book(isbn),
    foreign key (publisherId) references publisher(id)
		on update cascade on delete cascade);
    
create table is_of_type (
	isbn nvarchar(20),
    fName nvarchar(20),
    primary key (isbn, fName),
    foreign key (isbn) references book(isbn),
    foreign key (fName) references bformat(fName)
		on update cascade on delete cascade);