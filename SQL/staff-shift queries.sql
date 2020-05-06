use cecs323sec07bg05;

-- 3 Completed
select firstname, 
lastname,
count(CookinCapabality.staffID) as 'Num of Menu Items',
Group_Concat(DisplayName)
from staff
inner join CookinCapabality using(staffID)
inner join FoodItem using (FoodItemID)
group by staffID
having count(CookinCapabality.staffID) > 3;

 
-- 4 incomplete
select * 
from CookinCapabality cc1, CookinCapabality cc2
where cc1.FoodItemID = cc2.FoodItemID;

-- 6 Completed
select 
	week(shiftDate),
	firstname, 
	lastname,
    (count(shiftID) * 8) as 'Total number of hours'
from staff
inner join shift_assignment
using (staffID)
inner join shift
using (shiftID)
group by staffID,shiftDate;

-- 12 incomplete
select firstname,
lastname,
expertise,
max(`Num of students`)
from (
	select firstname,
    lastname,
    count(TrainedBy) as `Num of students`, 
    expertise
	from Mentorship
	inner join staff
	using (staffID)
    inner join SousChef
    using (staffID)
	group by staffID) sc1;

-- 13 Completed

select
CC1.DisplayName,
`Number of Sous Chef skilled in that menu item`
from
	(select DisplayName,
    count(staffID) as `Number of Sous Chef skilled in that menu item`
	from CookingCapability
    inner join FoodItem
    using (FoodItemID)
	group by FoodItemID) CC1
where `Number of Sous Chef skilled in that menu item` = 
	(select min(`Number of Expertise`)
		from (
		select firstname,
		lastname,
		count(expertise) as `Number of Expertise`
		from SousChef
		inner join staff
		using (staffID)
		group by staffID) sc1
limit 3 );
    
-- 16 incompleted
-- 1.Head chef can train an apprentice to become a head chef (encoded in the one to one between head chef and sous chef)
-- 2.Max amount of 3 Maitre’ds in one shift