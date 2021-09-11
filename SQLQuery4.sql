create database TQdb
use TQdb
create table Student
(
studentid int Identity not null,
studentname varchar(10) not null,
)

select *
from Student

-- ADDING PRIMARY KEY CONSTRAINT
alter table Student
add constraint pkstudid Primary key (studentid)

-- DML 
insert into Student (studentname) values('Swapnil'),
('Abhishek'),('Jana'),('Kalyani'),('Pallavi')

delete from Student 
where studentid=2

insert into Student 
(studentname) 
values ('Chaitrali')	

SET IDENTITY_INSERT Student ON
insert into Student 
(studentid,studentname) 
values (2, 'Abhi')

-- DQL
select * 
from Student

create table Library1
(
Bookid varchar(10) not null,
Bookname varchar(20) not null,
Studentid int references Student(studentid),
Studentname varchar(24),
DateIssue date  Default getdate(),
Returndays int Check (ReturnDays <=7) 
)

select * 
from Student

insert into Library 
(Bookid,Bookname,Studentid) 
values
('B001','SQL',1)

insert into Library 
values 
('B002','Python',3,default,0)

select * 
from Library1

update Library 
set Returndays=8
where Bookid='B002' 

insert into Library1
values
('B001', 'Java', 001, 'Pallavi',default,0)

insert into Library1
(Bookid,Bookname,Studentid, Studentname) 
values
('B002', 'PHP', 002, 'Abhi')

delete from Library1
where Bookid ='B002'

insert into Library1
(Bookid,Bookname,Studentid, Studentname) 
values
('B003', 'JS', 004, 'Kalyani')



select * 
from Library

-- adding new column
alter table Library
add ReturnDate date constraint dfreturn default getdate()+7 


-- updating existing record  for the new column
update Library
set ReturnDate =DATEADD(dd,7,DateIssue)
where BookId='B002'

----- Exception (dependent)
ALTER TABLE Library
drop column ReturnDays
