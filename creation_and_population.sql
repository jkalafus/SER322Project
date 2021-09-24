CREATE DATABASE IF NOT EXISTS `books`;
USE `books`;

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
    gType nvarchar(20));
    
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
        
create table belongs (
	isbn nvarchar(20),
    gName nvarchar(20),
    primary key (isbn, gName),
    foreign key (isbn) references book(isbn),
    foreign key (gName) references genre(gName)
		on update cascade on delete cascade);
        
insert into book (`isbn`, `title`, `isRead`, `numberPages`)
	values 
		('978-0142437230', 'Don Quixote', 0, 1072),
        ('978-0191569579', 'Pilgrims Progress', 1, 380),
        ('978-1503292383', 'Robinson Cruesoe', 1, 158),
        ('978-0486292731', 'Gullivers Travels', 1, 158),
        ('978‐18535260216', 'Tom Jones', 1, 768),
        ('978-1426221774', 'Cosmic Queries', 0, 312),
        ('978-0671562717', 'My Life With The Chimpanzees', 1, 160),
        ('978-0451524935', '1984', 1, 328),
        ('978-1493663644', 'Emma', 1, 208),
        ('978-0553380163', 'A Brief History of Time', 1, 212);
        
insert into author (`id`, `professionalDesignation`, `firstName`, `lastName`)
	values
		(1, null, 'Miguel', 'De Cervantes'),
        (2, null, 'John', 'Bunyan'),
        (3, null, 'Daniel', 'Defoe'),
        (4, null, 'Jonathan', 'Swift'),
        (5, null, 'Henry', 'Fielding'),
        (6, 'Dr.', 'Neil', 'deGrasse Tyson'),
        (7, 'Dr.', 'Jane', 'Goodall'),
        (8, null, 'George', 'Orwell'),
        (9, null, 'Jane', 'Austen'),
        (10, 'Dr.', 'Stephen', 'Hawking');
        
insert into bformat (`fName`)
	values 
		('Paperback'),
        ('eBook'),
        ('Hard Cover'),
        ('Audiobook');
        
insert into genre (`gName`, `gType`)
	values 
		('Satire', 'Fiction'),
        ('Religion', 'Fiction'),
        ('Adventure', 'Fiction'),
        ('Science', 'Non-fiction'),
        ('Political', 'Non-fiction');
        
insert into publisher (`id`, `pName`, `address`)
	values
		(1, 'Penguin Random House LLC', '1745 Broadway 15‐3, New York, NY 10019'),
        (2, 'Aneko Press', '203 E. Birch Street, Abbotsford, WI 54405'),
        (3, 'CreateSpace', '4900 Lacross Rd, North Charleston, SC 29406'),
        (4, 'Dover Publications', '1325 Franklin Ave, Garden City, NY 11530'),
        (5, 'Wordsworth Edition Ltd.', 'PO Box 13147, Stansted CM21 1BT'),
        (6, 'National Geographic', '1145 17th Street NW, Washington, DC 20036'),
        (7, 'Aladdin', '1230 Avenue of the Americas 4th Floor, New York, NY 10020');
        
insert into is_of_type (`isbn`, `fName`)
	values
		('978-0142437230', 'Paperback'),
        ('978-0191569579', 'eBook'),
        ('978-1503292383', 'Paperback'),
        ('978-0486292731', 'Hard Cover'),
        ('978‐18535260216', 'Paperback'),
        ('978-1426221774', 'Paperback'),
        ('978-0671562717', 'Paperback'),
        ('978-0451524935', 'Paperback'),
        ('978-1493663644', 'Paperback'),
        ('978-0553380163', 'Paperback');
        
insert into publishes (`isbn`, `publisherId`)
	values 
		('978-0142437230', 1),
        ('978-0191569579', 2),
        ('978-1503292383', 3),
        ('978-0486292731', 4),
        ('978‐18535260216', 5),
        ('978-1426221774', 6),
        ('978-0671562717', 7),
        ('978-0451524935', 1),
        ('978-1493663644', 3),
        ('978-0553380163', 1);
        
insert into writes (`isbn`, `authorId`)
	values 
		('978-0142437230', 1),
        ('978-0191569579', 2),
        ('978-1503292383', 3),
        ('978-0486292731', 4),
        ('978‐18535260216', 5),
        ('978-1426221774', 6),
        ('978-0671562717', 7),
        ('978-0451524935', 8),
        ('978-1493663644', 9),
        ('978-0553380163', 1);
        
insert into belongs (`isbn`, `gName`)
	values
		('978-0142437230', 'Satire'),
        ('978-0191569579', 'Religion'),
        ('978-1503292383', 'Adventure'),
        ('978-0486292731', 'Satire'),
        ('978‐18535260216', 'Satire'),
        ('978-1426221774', 'Science'),
        ('978-0671562717', 'Science'),
        ('978-0451524935', 'Political'),
        ('978-1493663644', 'Satire'),
        ('978-0553380163', 'Science');