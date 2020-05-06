use cecs323sec07bg05;

-- 3

CREATE VIEW Sous_Mentor_V AS
(
	select
	s1.firstname,
	s1.lastname,
	sc1.expertise,
    sc1.isMentoring
from staff s1
inner join SousChef sc1
using  (staffID)
where isMentoring = 
	(select staffID 
    from Mentorship
    inner join staff
    using (staffID))
order by s1.firstname, s1.lastname
);


SELECT * FROM Sous_Mentor_V;
-- incomplete

select
	s1.firstname,
	s1.lastname,
	sc1.expertise,
    sc1.isMentoring
from staff s1
inner join SousChef sc1
using  (staffID)
where isMentoring = 
	(select staffID 
    from Mentorship
    inner join staff
    using (staffID))
order by s1.firstname, s1.lastname;

select firstname,lastname
from staff
inner join SousChef 
using (staffID);

select firstname,lastname from staff
inner join Mentorship using (staffID);