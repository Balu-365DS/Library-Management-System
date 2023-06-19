create database library_management_system;
use library_management_system;
create table library1_info(
lib_name varchar(15),
lib_id int(5),
lib_address varchar(30),
lib_area_code int(5)
);
create table library2_info(
lib_name varchar(15),
lib_id int(5),
lib_address varchar(30),
lib_area_code int(5)
);
create table library3_info(
lib_name varchar(15),
lib_id int(5),
lib_address varchar(30),
lib_area_code int(5)
);

drop table library_info;

insert into library1_info values (
'mgr',517801,'cgr',101);

insert into library2_info values (
'tdp',57601,'tpt',111);

insert into library3_info values (
'ysr',50931,'ctr',123);

create table publisher(
publisher_name varchar(10),
publisher_id int,
published_book varchar(30),
lib_id int
);

drop table publisher;


insert into publisher values
('Arihant',1501,'Jee Practice',101),
('Shrihti',1502,'Life is What Make You',111),
('deepak',1503,'virpaksh',111),
('bala',1504,'akhand',123),
('Krishna',1505	,'Karthikeya',123),
('Radha',1506,'Jogendra',123),
('Deeksha',1507,'BalaKrishna',123),
('Telugu',1508,'Hello Guru',101),
('Sanskrit',1509,'Basics',111),
('Hare Kris',1510,'Bhagavadgitha',101),
('Gorakhpur',1511,'Bhagavatam',123),
('Wiley',1512,'Discrete Maths',123),
('McgrawHill',1513,'Database Systems',111);

Create table book(
book_id int Primary Key,
book_name varchar(35),
publisher_id int,
status_id int);

insert into book values
(141,'Dabase Systems',1513,161),
(142,'Discrete Maths',1512,171),
(143,'Bhagavatam',1511,181),
(144,'Bhagavadgitha',1510,191),
(145,'Sanskrit',1509,201),
(146,'Deeksha',1507,211),
(147,'Jogendra',1506,221);

Create table customers(
cust_id int primary key,
fname varchar(20),
lname varchar(20),
gender varchar(1),
Age int
);

insert into customers values
(1014,'Deeksha Sriya','Baddula','F',22),
(1015,'Lahari','Ammisetty','F',23),
(1016,'Ramya','Singamsetty','F',31),
(1017,'Saiyana','Ramisetty','F',33),
(1018,'Soudamini','Sreepada','F',32),
(1019,'Pooja','Palod','F',33),
(1020,'Raviteja','Anantha','M',30);

Create table Transaction(
trans_id int primary key,
cust_id int
);

insert into Transaction values
(2123,1020),
(2124,1018),
(2125,1017),
(2126,1016),
(2127,1014);

create table Borrowing(
Borrow_id int primary key,
cust_id int,
Book_id int,
Borrow_date date,
Borrow_return date
);

insert into Borrowing values
(6166,1014,141,'2022-04-12','2022-04-22'),
(6161,1015,142,'2022-05-12','2022-05-22'),
(6162,1016,143,'2022-06-12','2022-06-22'),
(6163,1017,144,'2022-07-12','2022-07-22'),
(6164,1018,145,'2022-08-12','2022-08-22');

select * from Borrowing bk left join customers ck on bk.cust_id=ck.cust_id ;

-- retrieve data by publisher
with publisher as(
select * from  publisher group by lib_id)
select * from publisher;

-- retrieve book by partitcular publisher
with book_by_publusher as (
select bk.book_name,bk.book_id,pb.publisher_name,bok.Borrow_id,bok.Borrow_return from book bk join publisher pb on bk.publisher_id=pb.publisher_id
-- where pb.publisher_name='McgrawHill'
right join Borrowing bok on bok.Book_id=bk.Book_id where bok.Borrow_return <= '2022-06-22' )
select * from book_by_publusher ;


-- retrieve customer,transaction details 
with cust_details as (
select cs.cust_id,cs.fname,bk.book_name,bok.Book_id,bok.Borrow_date from customers cs left join Transaction tc on tc.cust_id=cs.cust_id
join Borrowing bok on bok.cust_id=cs.cust_id 
 join  book bk on bk.Book_id=bok.Book_id 
)select * from cust_details;






