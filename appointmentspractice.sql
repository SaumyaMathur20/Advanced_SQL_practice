SELECT * FROM practice.appointments;
# Find patients whose appointment fee is greater than average fee
select name
from patients 
where pid in (select pid 
from appointments
where fee>(select avg(fee) from appointments));

# Find appointments where fee is greater than that patient’s average fee
select appid 
from appointments
where fee>(select avg(fee) from appointments);

# Find total spending of each patient and show only those spending > 700
with cte_1 as
(
select sum(a.fee), a.pid, p.name
from appointments as a
join patients as p
on p.pid = a.pid
group by a.pid, p.name
having sum(a.fee) >700
)
select * from cte_1;

# Assign row number to appointments per patient (by date)
select p.name, a.appid,
row_number()over(partition by a.appdate) as rn
from patients as p
join appointments as a
on p.pid = a.pid;

# Rank all appointments based on fee
select dense_rank()over(order by fee desc), fee, appid
from appointments;

# Show previous appointment fee for each patient
select lag(fee)over(order by fee desc) as prior,fee, pid
from appointments; 

# Categorize appointments:  700 → High  400–700 → Medium  <400 → Low
select pid, fee,
case 
when fee> 700 then "High" 
when fee between 400 and 700 then "medium" 
else "Low"
end as category
from appointments;

# Find total revenue from appointments where fee > 500
select 
sum(case when fee>500 then fee else 0 end) as revenue
from appointments;

# Extract month from appointment_date
select pid, 
monthname(appdate)
from appointments;

# Find number of days between appointment_date and admission_date
select 
a.pid, 
datediff(a.appdate, p.datee) as difference
from appointments as a
join patients as p
on a.pid = p.pid;

# Add 7 days to appointment_date
select appdate,
date_add(appdate, interval 7 day) as add_7days
from appointments;

# Show year and month separately
select appdate,
year(appdate),
monthname(appdate)
from appointments;

# Create index on patient_id in appointments
create index i1 on
appointments(pid);
show index from appointments;

# Create function to calculate 10% service tax on fee
delimiter //
create function f1(fee int)
returns float
deterministic
begin  
return (0.1 * fee);
end //
delimiter ;

select f1(800);





