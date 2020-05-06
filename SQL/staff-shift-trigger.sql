CREATE DEFINER=`cecs323sec07s19`@`10.%` TRIGGER `cecs323sec07bg05`.`HeadChef_AFTER_INSERT` 
AFTER INSERT ON `HeadChef` FOR EACH ROW
BEGIN
	if(HeadChefID = SousChef.staffID) THEN
		delete from SousChef
		where HeadChefID = SousChef.staffID;
	end if;
END
