# Womens-Basketball-Database
Database Project

Restore the Group6BasketballWNBA_1 backup file then run the Group6_SQL_Code.

The purpose of this project was to show that you can create tables using existing sql code and how to clean data.


----------------------------------------------------------------------------------------------------------------------------------
Notes While Creating the Database

in draft table where tmID = CHR change to CHA to fit FK
because no CHR team in team table
// 31 rows were affected
only after doing this did the FK work.

Dont think we need names in the draft table since we have the Player ID, but we can delete names anytime.

these playerids were in the fact but not in the lookup. must add these records to the lookup to create the fk w name unknown 

Add these values to the Master table
buescer01w	Unknown
dorresc01w	Unknown
feenska01w	Unknown
reisska01w	Unknown
willimi01w	Unknown
willita02w	Unknown
zolmash01w	Unknown

these in coach table not in bio, put in bioID
Add these values to the Master table
kloppga99w
reevech99w
richano99w
----------------------------------------------------------------------------------------------------------------------------------
