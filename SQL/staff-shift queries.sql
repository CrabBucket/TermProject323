use cecs323sec07bg05;

select * from SousChef;

-- 3 incomplete
select firstname, 
lastname, 
count(expertise)
from staff
inner join SousChef using(staffID)
group by staffID;

 
-- 4 incomplete
select s1.firstname,
	s1.lastname,
    s2.firstName,
    s2.lastname
from staff s1
inner join staff s2 using (staffID)
inner join SousChef using (staffID);

-- 6 incomplete
select 
	week(shiftDate),
	firstname, 
	lastname,
    (count(shiftID) * 8) as 'Number of hours worked'
from staff
inner join shift_assignment
using (staffID)
inner join shift
using (shiftID)
group by staffID,shiftDate;

-- 12 complete
select firstname,
lastname,
expertise,
max(`Num of students`)
from (
	select firstname,
    lastname,
    count(isMentoring) as `Num of students`, 
    expertise
	from SousChef
	inner join staff
	using (staffID)
	group by staffID) sc1;

-- 13 incomplete
select firstname,
lastname,
min(`Number of Expertise`)
from (
	select firstname,
	lastname,
	count(expertise) as `Number of Expertise`
	from SousChef
	inner join staff
	using (staffID)
	group by staffID) sc1;
    
-- 16 incompleted
-- 1.Head chef can train an apprentice to become a head chef (encoded in the one to one between head chef and sous chef)
-- 2.Max amount of 3 Maitre’ds in one shift