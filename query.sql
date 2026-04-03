create database practice;
use practice;

# table patients 
create table patients(
pid int,
name varchar(20),
city varchar(20),
datee date);
insert into patients values
(1, "Riya", "Delhi", '2023-06-01'),
(2, "Arjun", "Mumbai", '2023-06-05'),
(3, "Meera", "Delhi", '2023-06-10'),
(4, "Kabir", "Pune", '2023-06-15');
select * from patients;

# table appointments
create table appointments(
appid int,
pid int,
docid int,
appdate date,
fee int);
insert into appointments values
(101, 1, 201, '2023-06-02', 500),
(102, 2, 202, '2023-06-06', 800),
(103, 3, 203, '2023-06-10', 300),
(104, 4, 201, '2023-06-12', 700),
(105, 5, 204,'2023-06-20' , 400);
select * from appointments;

# table billing
create table billing(
billid int,
appid int,
mode varchar(10),
status varchar(20));
insert into billing values
(1, 101, "UPI", "Paid"),
(2, 102, "Card", "Pending"),
(3, 103, "Cash", "Paid"),
(4, 104, "UPI", "Paid"),
(5, 105, "Card", "Paid");
select * from billing;











