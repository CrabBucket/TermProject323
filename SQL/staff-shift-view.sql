use cecs323sec07bg05;

-- 3

CREATE VIEW Sous_Mentor_V AS
(
select firstname,lastname,trainingStartDate,'Mentorship' as "Type"
from staff
inner join SousChef
on staff.staffID = SousChef.staffID
inner join Mentorship
on Mentorship.staffID = staff.staffID
order by firstname,lastname

);


select firstname,lastname,trainingStartDate, 'Mentorship' as "Type"
from staff
inner join SousChef
on staff.staffID = SousChef.staffID
inner join Mentorship
on Mentorship.staffID = staff.staffID
order by firstname,lastname;

SELECT * FROM Sous_Mentor_V;

select * from Mentorship;

select firstname,lastname from staff;
