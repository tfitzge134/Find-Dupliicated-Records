--/****** Script for SelectTopNRows command from SSMS  ******/


---find duplicate records
with duplicate
as (
select max(Locationid) as locationid, officename
from office 
group by officename
having count(*) > 1
)

--delete duplicated records.
delete o
--select *
from office  o
join duplicate as cte
on cte.locationid=o.locationid
where o.locationid not in (select distinct locationid from Employee1)
