insert into book (`isbn`, `title`, `isRead`, `numberPages`)
	values ('978-0-06-197796-1', 'Reamde', 1, 1056);

insert into author (`id`, `professionalDesignation`, `firstName`, `lastName`)
	values (11, null, 'Neal', 'Stephenson');
    
insert into writes (`isbn`, `authorId`)
	values ('978-0-06-197796-1', 11);
    
insert into publisher (`id`, `pName`, `address`)
	values (11, 'William Morrow', '10 East 53rd Street. City: New York. State, Zip: NY, 10022');
    
insert into is_of_type (`isbn`, `fName`)
	values ('978-0-06-197796-1', 'Hard Cover'); 
    
insert into publishes (`isbn`, `publisherId`)
	values ('978-0-06-197796-1', 11);

insert into genre (`gName`, `gType`)
		values('Thriller', 'Fiction');
        
insert into belongs (`isbn`, `gName`)
	values ('978-0-06-197796-1', 'Thriller');

        
