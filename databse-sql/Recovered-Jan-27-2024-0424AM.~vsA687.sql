

create table Library_card (
	id int primary key,
	card_expiry_date date not null,
	Member_id int not null unique
	

)

create table Library_member(
	id int,
	birthdate date not null,
	Fname varchar(25) not null,
	Lname varchar(25) not null,
	Gender char(1) CHECK (Gender = 'M' OR Gender = 'F')
	primary key(id)

)


create table book(
	isbn int,
	book_name varchar(25) not null, 
	shelf_id int not null
	primary key(isbn)
)


create table borrowed_book(
	Member_id int ,
	book_isbn int ,
	borrowed_date date not null,
	return_date date not null
	primary key(member_id ,book_isbn)


)

create table shelf(
	id int,
	capacity int not null 
	primary key(id)

)

create table member_address(
	member_id int ,
	city varchar(25),
	street_name varchar(25),
	building varchar(25)
	primary key(member_id,city,street_name,building)


)

create table member_phone(
	member_id int, 
	member_phone int 
	primary key(member_id,member_phone)
)



alter table Library_card 
add constraint member_id foreign key (member_id) references Library_member(id) 


alter table borrowed_book 
add constraint member_id_2 foreign key (member_id) references library_member(id),
constraint book_isbn foreign key (book_isbn) references book(isbn)



alter table book 
add constraint shelf_id foreign key (shelf_id) references shelf(id)

alter table member_address  
add constraint member_id_3 foreign key (member_id) references Library_member(id)

alter table member_phone 
add constraint member_id_4 foreign key (member_id) references Library_member(id)


alter table Library_card
drop constraint Member_id;


alter table Library_card
add constraint Member_id
foreign key(Member_id) references Library_member(id)
on update cascade 
on delete cascade;


alter table book
drop constraint shelf_id;


alter table book
add constraint shelf_id
foreign key(shelf_id) references shelf(id)
on update cascade 
on delete cascade;

alter table book
drop constraint shelf_id;


alter table book
add constraint shelf_id
foreign key(shelf_id) references shelf(id)
on update cascade 
on delete cascade;



alter table borrowed_book
drop constraint member_id_2


alter table borrowed_book
add constraint member_id_2
foreign key(Member_id) references Library_member(id)
on update cascade 
on delete cascade;

alter table borrowed_book
drop constraint book_isbn

alter table borrowed_book
add constraint book_isbn
foreign key(book_isbn) references book(isbn)
on update cascade
on delete cascade

alter table member_address
drop constraint member_id_3

alter table member_address
add constraint member_id_3
foreign key(member_id) references Library_member(id)
on update cascade
on delete cascade





INSERT INTO Library_member (id, birthdate, Fname, Lname, Gender) VALUES
(101, '1980-05-15', 'Alice', 'Smith', 'F'),
(102, '1992-07-20', 'Bob', 'Johnson', 'M'),
(103, '1988-03-05', 'Charlie', 'Williams', 'M'),
(104, '1975-11-30', 'Diana', 'Brown', 'F');



INSERT INTO Library_card (id, card_expiry_date, Member_id) VALUES
(201, '2025-12-31', 101),
(202, '2024-10-15', 102),
(203, '2026-08-20', 103),
(204, '2025-07-25', 104);



INSERT INTO shelf (id, capacity) VALUES
(301, 50),
(302, 30),
(303, 40);



INSERT INTO book (isbn, book_name, shelf_id) VALUES
(1001, 'The Great Gatsby', 301),
(1002, 'To Kill a Mockingbird', 302),
(1003, '1984', 303),
(1004, 'Pride and Prejudice', 301);



INSERT INTO borrowed_book (Member_id, book_isbn, borrowed_date, return_date) VALUES
(101, 1001, '2024-01-10', '2024-02-10'),
(102, 1002, '2024-01-12', '2024-02-12'),
(103, 1003, '2024-01-15', '2024-02-15'),
(104, 1004, '2024-01-18', '2024-02-18');


INSERT INTO member_address (member_id, city, street_name, building) VALUES
(101, 'Amman', 'qayrawan', '9'),
(102, 'Amman', 'khalil neimat', '25'),
(103, 'Amman', 'wahdeh Street', '45'),
(104, 'Amman', 'basha street', '34'),
(104, 'Amman', 'taima', '37');

INSERT INTO member_phone (member_id, member_phone) VALUES
(101, '0790000001'),
(102, '0790000002'),
(103, '0790000003'),
(104, '0790000004'),
(104, '0790000005');


CREATE VIEW BorrowedBooks AS
SELECT lm.Fname, lm.Lname, bb.book_isbn, b.book_name
FROM Library_member lm
JOIN borrowed_book bb ON lm.id = bb.Member_id
JOIN book b ON b.isbn = bb.book_isbn;


CREATE VIEW MemberContactInfo AS
SELECT lm.id, lm.Fname, lm.Lname, lm.Gender, ma.city, ma.street_name, ma.building, mp.member_phone
FROM Library_member lm
 JOIN member_address ma ON lm.id = ma.member_id
 JOIN member_phone mp ON lm.id = mp.member_id;


CREATE VIEW LibraryCards AS
SELECT lc.id AS CardID, lm.Fname, lm.Lname, lc.card_expiry_date
FROM Library_card lc
JOIN Library_member lm ON lc.Member_id = lm.id

drop view MemberBorrowingHistory

CREATE VIEW MemberBorrowingHistory AS
SELECT lm.id, lm.Fname, lm.Lname, bb.book_isbn, b.book_name, bb.borrowed_date, bb.return_date
FROM Library_member lm
JOIN borrowed_book bb ON lm.id = bb.Member_id
JOIN book b ON b.isbn = bb.book_isbn





CREATE PROCEDURE RenewLibraryCard @cardId int, @newExpiryDate date
as
update Library_card set card_expiry_date = @newExpiryDate 
where id = @cardId




CREATE procedure UpdateBookShelf @book_isbn int , @new_shelf_id int
as
update book set shelf_id = @new_shelf_id

where isbn = @book_isbn


create procedure AddMemberPhone @member_id int , @member_new_phone int 
as 
Insert into member_phone (member_id,member_phone) values (@member_id,@member_new_phone)



create procedure AddMemberAddress @member_id int , @city varchar(25) , @street varchar(25) , @building varchar(25) 
as 

Insert into member_address (member_id,city,street_name,building) values (@member_id,@city,@street,@building)



create login administrator with password = 'admin@123'

create user administrator for login administrator

grant select,insert,update,delete on library_member to administrator
grant select,insert,update,delete on library_card to administrator
grant select,insert,update,delete on book to administrator
grant select,insert,update,delete on borrowed_book to administrator
grant select,insert,update,delete on member_address to administrator
grant select,insert,update,delete on member_phone to administrator
grant select,insert,update,delete on shelf to administrator



CREATE LOGIN book_manager WITH PASSWORD = 'book_manager@123';
CREATE USER book_manager FOR LOGIN book_manager;

GRANT SELECT, INSERT, UPDATE, DELETE ON book TO book_manager;


CREATE LOGIN it_support WITH PASSWORD = 'it_support@123';
CREATE USER it_support FOR LOGIN it_support;
grant select on library_member to it_support
grant select on library_card to it_support
grant select on book to it_support
grant select on borrowed_book to it_support
grant select on member_address to it_support
grant select on member_phone to it_support
grant select on shelf to it_support




















BACKUP DATABASE Library TO DISK = 'D:\backup\Library.bak'






BACKUP DATABASE Library TO DISK = 'D:\backup\LibraryDF.bak' WITH
DIFFERENTIAL












