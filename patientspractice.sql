SELECT * FROM practice.patients;

# Find patients who have at least one paid bill
select name 
from patients as p
where exists 
(select pid
from appointments as a
join billing as b on
a.appid = b.appid
where status = "Paid");

# Find patients who never had any appointment
select name
from patients
where pid not in 
(select pid 
from appointments);

# Find the highest spending patient
with cte_2 as
(
select a.fee, p.name
from patients as p
join appointments as a
on p.pid = a.pid 
order by a.fee desc limit 1
)
select * from cte_2;

# Find position of 'a' in patient names
select instr(name, "a") as location, name
from patients;

# Combine name and city
select concat_ws("  ", name, city) as concatenated
from patients;

# Count patients per city having more than 1 patient
select city, count(*) as no_oftimes
from patients
group by city
having count(*)>1;

# Create procedure to get all appointments of a patient
delimiter //
create procedure p_1()
begin
select 
p.name, a.appid
from patients as p
join appointments as a
on p.pid = a.pid;
end //
delimiter ;
call p_1();







