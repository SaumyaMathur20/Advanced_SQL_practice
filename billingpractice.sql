SELECT * FROM practice.billing;

# Count number of Paid vs Pending bills
select 
count(case when status="Paid" then 1 end) as paid_status,
count(case when status="pending" then 1 end) as pending_status
from billing;


