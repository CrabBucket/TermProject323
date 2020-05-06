use cecs323sec07bg05;

-- 3

CREATE VIEW Sous_Mentor_V AS
(
	select
	s1.firstname,
	s1.lastname,
	sc1.expertise
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
    s2.firstname,
    s2.lastname
from staff s1,
	(select firstname,lastname
    from staff
    inner join Mentorship
    using (staffID)) s2
inner join SousChef sc1
using  (staffID)
where isMentoring = 
	(select staffID 
    from Mentorship
    inner join staff
    using (staffID) ) 
order by s1.firstname, s1.lastname;
