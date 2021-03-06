-- -------------------------------------------------------
-- Create Group 6's Database
-- -------------------------------------------------------

  Create database Group6BasketballWNBA_1;

-- -------------------------------------------------------
-- Find lengths of Round, Conference, Diviosion Tables
-- -------------------------------------------------------
  select max(len(full_name)) from BasketballWNBA.dbo.wom_basketball_abbrev
         where abbrev_type='Division'; -- 21
  select max(len(AbbreviationLongDescription)) from Destination.Abbreviations
           where AbbreviationShortDescription='Division'; -- 21

   select max(len(full_name)) from BasketballWNBA.dbo.wom_basketball_abbrev
         where abbrev_type='Round';  -- 17
  select max(len(AbbreviationLongDescription)) from Destination.Abbreviations
           where AbbreviationShortDescription='Round'; -- 17

  select max(len(full_name)) from BasketballWNBA.dbo.wom_basketball_abbrev
         where abbrev_type='Conference'; -- 19
  select max(len(AbbreviationLongDescription)) from Destination.Abbreviations
           where AbbreviationShortDescription='Conference'; -- 19

--------------------------------------------------------
-- Create Conference Table
--------------------------------------------------------
Create table Group6BasketballWNBA_1.dbo.Conference
(
  code varchar(2),
  name varchar(19)
);

ALTER TABLE Group6BasketballWNBA_1.dbo.Conference
 ALTER COLUMN code varchar(2) NOT NULL;
ALTER TABLE Group6BasketballWNBA_1.dbo.Conference
ADD CONSTRAINT PK_Conference_Code PRIMARY KEY (code);
-- --------------------------------------------------------
-- Load Conference Table
-- --------------------------------------------------------
Go 
Create PROCEDURE LoadConferenceTable
AS
Insert into Group6BasketballWNBA_1.dbo.Conference
 select code, full_name
 from  BasketballWNBA.dbo.wom_basketball_abbrev
 where abbrev_type = 'Conference';
 GO

 LoadConferenceTable;
 select * from Group6BasketballWNBA_1.dbo.Conference;
-- -------------------------------------------------------
-- Create Round Table
-- -------------------------------------------------------
Create table Group6BasketballWNBA_1.dbo.Round
(
  code varchar(2),
  name varchar(17)
);

ALTER TABLE Group6BasketballWNBA_1.dbo.Round
 ALTER COLUMN code varchar(2) NOT NULL;
ALTER TABLE Group6BasketballWNBA_1.dbo.Round
ADD CONSTRAINT PK_Round_code PRIMARY KEY (code);
-- -------------------------------------------------------
-- Load Round Table
-- -------------------------------------------------------
Go 
Create PROCEDURE LoadRoundTable
AS
Insert into Group6BasketballWNBA_1.dbo.Round
 select code, full_name
 from  BasketballWNBA.dbo.wom_basketball_abbrev
 where abbrev_type = 'Round';
GO

 LoadRoundTable;
 select * from Group6BasketballWNBA_1.dbo.Round;

 -- -------------------------------------------------------
 -- Create Division Table
 -- -------------------------------------------------------
 Create table Group6BasketballWNBA_1.dbo.Division
(
  code varchar(2),
  name varchar(21)
);

ALTER TABLE Group6BasketballWNBA_1.dbo.Division
 ALTER COLUMN code varchar(2) NOT NULL;
ALTER TABLE Group6BasketballWNBA_1.dbo.Division
ADD CONSTRAINT PK_Division_code PRIMARY KEY (code);
-- -------------------------------------------------------
-- Load Divisiom Table
-- -------------------------------------------------------
Go 
Create PROCEDURE LoadDivisionTable
AS
 Insert into Group6BasketballWNBA_1.dbo.Division
 select code, full_name
 from  BasketballWNBA.dbo.wom_basketball_abbrev
 where abbrev_type = 'Division';

 Insert into Group6BasketballWNBA_1.dbo.Division
values
('ED', 'East Division'),
('WD', 'West Division');
Go

 LoadDivisionTable;
 select * from Group6BasketballWNBA_1.dbo.Division;

-- -------------------------------------------------------
-- Find max Values in teams Columns 
-- -------------------------------------------------------
   select max(len(tmID)) from BasketballWNBA.dbo.wom_basketball_teams; -- 3
   select max(len(name)) from BasketballWNBA.dbo.wom_basketball_teams; -- 24
   select max(len(lgID)) from BasketballWNBA.dbo.wom_basketball_teams; -- 4
   select max(len(franchID)) from BasketballWNBA.dbo.wom_basketball_teams; -- 3
-- -------------------------------------------------------
-- Create Team Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.Team
(
  tmID varchar(3),
  name varchar(24),
  lgID varchar(4),
  franchID varchar(3)
);

ALTER TABLE Group6BasketballWNBA_1.dbo.Team
 ALTER COLUMN tmID varchar(3) NOT NULL;
ALTER TABLE Group6BasketballWNBA_1.dbo.Team
ADD CONSTRAINT PK_Team_tmID PRIMARY KEY (tmID);
-- -------------------------------------------------------
-- Load Team Table
 -- -------------------------------------------------------
 Go 
Create PROCEDURE LoadTeamTable
AS
insert into Group6BasketballWNBA_1.dbo.Team
  select distinct tmID, name, lgID, franchID
 from  BasketballWNBA.dbo.wom_basketball_teams;
Go

 LoadTeamTable;
 select * from Group6BasketballWNBA_1.dbo.Team;
-- -------------------------------------------------------
-- Find max Values in League columns 
-- -------------------------------------------------------
 select max(len(lgID)) from BasketballWNBA.dbo.wom_basketball_teams; -- 4
 select max(len('Women''s National Basketball Association')) -- 39
-- -------------------------------------------------------
-- Create Leauge Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.League
(
  lgID varchar(4),
  name varchar(40)
);

ALTER TABLE Group6BasketballWNBA_1.dbo.League
 ALTER COLUMN lgID varchar(4) NOT NULL;
ALTER TABLE Group6BasketballWNBA_1.dbo.League
ADD CONSTRAINT PK_League_lgID PRIMARY KEY (lgID);
-- -------------------------------------------------------
-- Load Leauge Table
-- -------------------------------------------------------
 Go 
Create PROCEDURE LoadLeagueTable
AS
insert into Group6BasketballWNBA_1.dbo.League
values 
('WNBA','Women''s National Basketball Association'),
('ABL', 'American Basketball Leauge');
GO

 LoadLeagueTable;
 select * from Group6BasketballWNBA_1.dbo.League;

-- -------------------------------------------------------
-- Find max Values in Franchise columns 
-- -------------------------------------------------------
 select max(len(franchID)) from BasketballWNBA.dbo.wom_basketball_teams; -- 3
-- -------------------------------------------------------
-- Create Franchise Table
-- --------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.Franchise
(
  franchID varchar(3),
);

ALTER TABLE Group6BasketballWNBA_1.dbo.Franchise
 ALTER COLUMN franchID varchar(3) NOT NULL;
ALTER TABLE Group6BasketballWNBA_1.dbo.Franchise
ADD CONSTRAINT PK_Franchise_franchID PRIMARY KEY (franchID);
-- -------------------------------------------------------
-- Load Franchise Table
-- -------------------------------------------------------
 Go 
Create PROCEDURE LoadFranchiseTable
AS
insert into Group6BasketballWNBA_1.dbo.Franchise
 select distinct franchID
 from  BasketballWNBA.dbo.wom_basketball_teams;
Go

 LoadFranchiseTable;
 select * from Group6BasketballWNBA_1.dbo.Franchise;

-- -------------------------------------------------------
-- Find max values in Award Columns 
-- -------------------------------------------------------
   select max(len(award)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 38
-- -------------------------------------------------------
-- Create Award Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.Award
(
	awardID int IDENTITY(1,1) primary key,
	name varchar(38)
);
-- -------------------------------------------------------
-- Load Award Table
-- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadAwardTable
AS
insert into Group6BasketballWNBA_1.dbo.Award
  select distinct award
 from  BasketballWNBA.dbo.wom_basketball_awards_players;
Go

 LoadAwardTable;
 select * from Group6BasketballWNBA_1.dbo.Award;

-- -------------------------------------------------------
-- Find max values in TeamsPost Columns 
-- -------------------------------------------------------
   select max(len(year)) from BasketballWNBA.dbo.wom_basketball_teams_post; -- 4
   select max(len(tmID)) from BasketballWNBA.dbo.wom_basketball_teams_post; -- 3
   select max(len(W)) from BasketballWNBA.dbo.wom_basketball_teams_post; -- 2
   select max(len(L)) from BasketballWNBA.dbo.wom_basketball_teams_post; -- 2
-- -------------------------------------------------------
-- Create TeamsPost Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.TeamsPost
(
	TeamsPostID int IDENTITY(1,1) primary key,
	year int,
	tmID varchar(3),
	W varchar(2),
	L varchar(2)
);
-- -------------------------------------------------------
-- Load TeamsPost Table
-- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadTeamsPostTable
AS
insert into Group6BasketballWNBA_1.dbo.TeamsPost
  select year, tmID, W, L
 from  BasketballWNBA.dbo.wom_basketball_teams_post;
Go

 LoadTeamsPostTable;
 select * from Group6BasketballWNBA_1.dbo.TeamsPost;

  
-- -------------------------------------------------------
-- Find max values in SeriesPost Columns 
-- -------------------------------------------------------
   select max(len(year)) from BasketballWNBA.dbo.wom_basketball_series_post; -- 4
   select max(len(round)) from BasketballWNBA.dbo.wom_basketball_series_post; -- 2
   select max(len(series)) from BasketballWNBA.dbo.wom_basketball_series_post; -- 1
   select max(len(tmIDWinner)) from BasketballWNBA.dbo.wom_basketball_series_post; -- 3
   select max(len(tmIDLoser)) from BasketballWNBA.dbo.wom_basketball_series_post; -- 3
   select max(len(W)) from BasketballWNBA.dbo.wom_basketball_series_post; -- 2
   select max(len(L)) from BasketballWNBA.dbo.wom_basketball_series_post; -- 2
 -------------------------------------------------------
 -- Create SeriesPost Table
 -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.SeriesPost
(
	SeriesPostID int IDENTITY(1,1) primary key,
	year int,
	round varchar(2),
	series varchar(1),
	tmIDWinner varchar(3),
	tmIDLoser varchar(3),
	W varchar(2),
	L varchar(2)
);
-- -------------------------------------------------------
-- Load SeriesPost Table
-- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadSeriesPostTable
AS
insert into Group6BasketballWNBA_1.dbo.SeriesPost
  select year, round, series, tmIDWinner, tmIDLoser, W, L
 from  BasketballWNBA.dbo.wom_basketball_series_post;
Go

 LoadSeriesPostTable;
 select * from Group6BasketballWNBA_1.dbo.SeriesPost;

-- -------------------------------------------------------
-- Find max values in Coach Columns 
-- -------------------------------------------------------
   select max(len(coachID)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 10
   select max(len(fullName)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 21

-- -------------------------------------------------------
-- Create Coach Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.Coach
(
	coachID varchar(15) primary key,
	fullName varchar(21),
);

-- -------------------------------------------------------
-- Find Coaches who are not in the coach table, but are in Coach Awards table
-- -------------------------------------------------------

select distinct ca.coachID 
from Group6BasketballWNBA_1.dbo.CoachAward as ca
where ca.coachID not in
	(select  c.coachID
	from Group6BasketballWNBA_1.dbo.Coach as c); 
-- ( reevech99wc, 'Cheryl Reeve')
 -------------------------------------------------------
 -- Load Coach Table
 ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadCoachTable
AS
insert into Group6BasketballWNBA_1.dbo.Coach
  select distinct coachID, fullName
 from  BasketballWNBA.dbo.wom_basketball_coaches
 where fullname != 'Suzie McConnell Serio';

 insert into Group6BasketballWNBA_1.dbo.Coach (coachID, fullName)
values
 ('reevech99wc', 'Cheryl Reeve');
Go



 LoadCoachTable;
 select * from Group6BasketballWNBA_1.dbo.Coach;

 
-- -------------------------------------------------------
 -- Find max values in CoachAward Columns 
-- -------------------------------------------------------
   select max(len(playerID)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 10
   select max(len(year)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 4
   select max(len(note)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 3
   select max(len(lgID)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 4

-- -------------------------------------------------------
-- Create CoachAward Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.CoachAward
(
	coachAwardID int identity(1,1) primary key,
	coachID varchar(15),
	awardID int,
	year int,
	lgID varchar(4),
	note varchar(25)
);
-- -------------------------------------------------------
-- Load CoachAward Table
-- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadCoachAwardTable
AS
insert into Group6BasketballWNBA_1.dbo.CoachAward
  select ap.playerID as coachID, a.awardID, ap.year, ap.lgID, ap.note
 from  
     BasketballWNBA.dbo.wom_basketball_awards_players as ap,
	 Group6BasketballWNBA_1.dbo.Award as a
 where 
     a.name = ap.award and
	 ap.playerID != '' and 
	 ap.award = 'Coach of the Year';

insert into Group6BasketballWNBA_1.dbo.CoachAward (coachID, awardID, year, lgID)
values
('reevech99wc', 3, 2011, 'WNBA'),
('rossca99wc', 3, 2012, 'WNBA');

Go

 LoadCoachAwardTable;
 select * from Group6BasketballWNBA_1.dbo.CoachAward;

-- -------------------------------------------------------
-- Find max values in CoachStatistic Columns 
-- -------------------------------------------------------
   select max(len(coachID)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 10
   select max(len(year)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 4
   select max(len(stint)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 1
   select max(len(tmID)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 3
   select max(len(won)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 2
   select max(len(post_wins)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 1
   select max(len(post_losses)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 1
   select max(len(playerCoach)) from BasketballWNBA.dbo.wom_basketball_coaches; -- 1

-- -------------------------------------------------------
-- Create CoachStatistic Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.CoachStatistic
(
	coachStatisticID int identity(1,1) primary key,
	coachID varchar(15),
	year int,
	tmID varchar(3),
	stint int,
	won int,
	lost int,
	post_wins int,
	post_losses int,
	playerCoach varchar(1)
);
-- -------------------------------------------------------
-- Load CoachStatistic Table
-- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadCoachStatisticTable
AS
insert into Group6BasketballWNBA_1.dbo.CoachStatistic
  select coachID, year, tmID, stint, won, lost, post_wins, post_losses, playerCoach
from BasketballWNBA.dbo.wom_basketball_coaches;
Go

 LoadCoachStatisticTable;
 select * from Group6BasketballWNBA_1.dbo.CoachStatistic;

-- -------------------------------------------------------
-- Find max values in PlayerAward Columns 
-- -------------------------------------------------------
   select max(len(playerID)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 10
   select max(len(year)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 4
   select max(len(lgID)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 4
   select max(len(note)) from BasketballWNBA.dbo.wom_basketball_awards_players; -- 3

-- -------------------------------------------------------
-- Create PlayerAward Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.PlayerAward
(
	playerAwardID int identity(1,1) primary key,
	playerID varchar(15),
	awardID int,
	year int,
	lgID varchar(4),
	note varchar(25)
);
-- -------------------------------------------------------
-- Load PlayerAward Table
-- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadPlayerAwardTable
AS
insert into Group6BasketballWNBA_1.dbo.PlayerAward
  select ap.playerID, a.awardID, ap.year, ap.lgID, ap.note
from 
    BasketballWNBA.dbo.wom_basketball_awards_players as ap,
	Group6BasketballWNBA_1.dbo.Award a
where
    a.name = ap.award and
	ap.award != 'Coach of the Year'
;
Go

 LoadPlayerAwardTable;
 select * from Group6BasketballWNBA_1.dbo.PlayerAward;
-- -------------------------------------------------------
-- Find max values in PlayerStatistic Columns 
-- -------------------------------------------------------
select max(len(playerID)) from BasketballWNBA.dbo.wom_basketball_players; -- 10
select max(len(year)) from BasketballWNBA.dbo.wom_basketball_players; -- 4
select max(len(stint)) from BasketballWNBA.dbo.wom_basketball_players; -- 1
select max(len(tmID)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(GP)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(GS)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(minutes)) from BasketballWNBA.dbo.wom_basketball_players; -- 4
select max(len(points)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(oRebounds)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(dRebounds)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(rebounds)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(assists)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(steals)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(blocks)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(turnovers)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(PF)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(fgAttempted)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(fgMade)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(ftAttempted)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(ftMade)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(threeAttempted)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(threeMade)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(dq)) from BasketballWNBA.dbo.wom_basketball_players; -- 1
select max(len(PostGP)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostGS)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostMinutes)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(PostPoints)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(PostoRebounds)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostdRebounds)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostRebounds)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(PostAssists)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostSteals)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostBlocks)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostTurnovers)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostPF)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostfgAttempted)) from BasketballWNBA.dbo.wom_basketball_players; -- 3
select max(len(PostfgMade)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostftAttempted)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostftMade)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostthreeAttempted)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostthreeMade)) from BasketballWNBA.dbo.wom_basketball_players; -- 2
select max(len(PostDQ)) from BasketballWNBA.dbo.wom_basketball_players; -- 1

-- -------------------------------------------------------
-- Create PlayerStatistic Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.PlayerStatistic
(
  PlayerStatisticID int identity(1,1) primary key,
  playerID varchar(15),
  year int,
  stint int,
  tmID varchar(3),
  GP int,
  GS int,
  minutes int,
  points int,
  oRebounds int,
  dRebounds int,
  rebounds int,
  assists int,
  steals int,
  blocks int,
  turnovers int,
  PF int,
  fgAttempted int,
  fgMade int,
  ftAttempted int,
  ftMade int,
  threeAttempted int,
  threeMade int,
  dq int,
  PostGP int,
  PostGS int,
  PostMinutes int,
  PostPoints int,
  PostoRebounds int,
  PostdRebounds int,
  PostRebounds int,
  PostAssists int,
  PostSteals int,
  PostBlocks int,
  PostTurnovers int,
  PostPF int,
  PostfgAttempted int,
  PostfgMade int,
  PostftAttempted int,
  PostftMade int,
  PostthreeAttempted int,
  PostthreeMade int,
  PostDQ int
);
 -- -------------------------------------------------------
 -- Load PlayerAward Table
 -- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadPlayerStatisticTable
AS
insert into Group6BasketballWNBA_1.dbo.PlayerStatistic
  select playerID, year, stint, tmID, GP, GS, minutes, points, oRebounds, dRebounds, rebounds, assists, steals, blocks, turnovers, PF, 
         fgAttempted, fgMade, ftAttempted, ftMade, threeAttempted, threeMade, dq, PostGP, PostGS, PostMinutes, PostPoints, 
         PostoRebounds, PostdRebounds, PostRebounds, PostAssists, PostSteals, PostBlocks, PostTurnovers, PostPF, PostfgAttempted, 
         PostfgMade, PostftAttempted, PostftMade, PostthreeAttempted, PostthreeMade, PostDQ
from 
    BasketballWNBA.dbo.wom_basketball_players;
Go

 LoadPlayerStatisticTable;
 select * from Group6BasketballWNBA_1.dbo.PlayerStatistic;

  

-- -------------------------------------------------------
-- Find max values in Master Columns 
-- -------------------------------------------------------
select max(len(bioID)) from BasketballWNBA.dbo.wom_basketball_master; -- 11
select max(len(firstName)) from BasketballWNBA.dbo.wom_basketball_master; -- 11
select max(len(middleName)) from BasketballWNBA.dbo.wom_basketball_master; -- 20
select max(len(lastName)) from BasketballWNBA.dbo.wom_basketball_master; -- 26
select max(len(nameGiven)) from BasketballWNBA.dbo.wom_basketball_master; -- 0
select max(len(fullGivenName)) from BasketballWNBA.dbo.wom_basketball_master; -- 29
select max(len(marriedName)) from BasketballWNBA.dbo.wom_basketball_master; -- 43
select max(len(nameNick)) from BasketballWNBA.dbo.wom_basketball_master; -- 22
select max(len(pos)) from BasketballWNBA.dbo.wom_basketball_master; -- 3
select max(len(firstseason)) from BasketballWNBA.dbo.wom_basketball_master; -- 1
select max(len(lastseason)) from BasketballWNBA.dbo.wom_basketball_master; -- 1
select max(len(height)) from BasketballWNBA.dbo.wom_basketball_master; -- 5
select max(len(weight)) from BasketballWNBA.dbo.wom_basketball_master; -- 3
select max(len(college)) from BasketballWNBA.dbo.wom_basketball_master; -- 29
select max(len(collegeOther)) from BasketballWNBA.dbo.wom_basketball_master; -- 29
select max(len(birthDate)) from BasketballWNBA.dbo.wom_basketball_master; -- 10
select max(len(birthCity)) from BasketballWNBA.dbo.wom_basketball_master; -- 20
select max(len(birthState)) from BasketballWNBA.dbo.wom_basketball_master; -- 3
select max(len(birthCountry)) from BasketballWNBA.dbo.wom_basketball_master; -- 3
select max(len(highSchool)) from BasketballWNBA.dbo.wom_basketball_master; -- 39
select max(len(hsCity)) from BasketballWNBA.dbo.wom_basketball_master; -- 26
select max(len(hsState)) from BasketballWNBA.dbo.wom_basketball_master; -- 7
select max(len(hsCountry)) from BasketballWNBA.dbo.wom_basketball_master; -- 3
select max(len(deathDate)) from BasketballWNBA.dbo.wom_basketball_master; -- 10

-- -------------------------------------------------------
-- Create Master Table
-- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.Master
(
  bioID varchar(15) primary key,
  firstName varchar(20), 
  middleName varchar(25), 
  lastName varchar(30), 
  nameGiven varchar(30), 
  fullGivenName varchar(30), 
  marriedName varchar(45), 
  nameNick varchar(25), 
  pos varchar(3), 
  firstseason varchar(3), 
  lastseason varchar(3), 
  height decimal(4,2), 
  weight int, 
  college varchar(30), 
  collegeOther varchar(30), 
  birthDate varchar(10), 
  birthCity varchar(20), 
  birthState varchar(3), 
  birthCountry varchar(3), 
  highSchool varchar(40), 
  hsCity varchar(30), 
  hsState varchar(10), 
  hsCountry varchar(3), 
  deathDate varchar(10)
);

select distinct p.playerID 
from BasketballWNBA.dbo.wom_basketball_players as p
where p.playerID not in
	(select  m.bioID
	from BasketballWNBA.dbo.wom_basketball_master as m);

-- (bioID, fullGivenName)
-- ('buescer01w', 'Erin Buescher'),
-- ('dorresc01w', 'Unknown'),
-- ('feenska01w', 'Unknown'),
-- ('reisska01w', 'Unknown'),
-- ('willimi01w', 'Unknown'),
-- ('willita02w', 'Unknown'),
-- ('zolmash01w', 'Unknown');

-- --------------------------------------------------------------
-- Shows Coaches mot in Master
-- --------------------------------------------------------------
select distinct c.coachID 
from BasketballWNBA.dbo.wom_basketball_coaches as c
where c.coachID not in
	(select  m.bioID
	from BasketballWNBA.dbo.wom_basketball_master as m);

-- (bioID, fullGivenName)
-- ('kloppga99w', 'Gary Kloppenburg'),
-- ('reevech99w', 'Cheryl Reeve'),
-- ('richano99w', 'Nolan Richardson');

-- -------------------------------------------------------
-- Load PlayerAward Table
-- ------------------------------------------------------- 


 Go 
Create PROCEDURE LoadMasterTable
AS
insert into Group6BasketballWNBA_1.dbo.Master
   select bioID, firstName, middleName, lastName, nameGiven, fullGivenName, marriedName, nameNick, pos, firstseason, 
          lastseason, height, weight, college, collegeOther, birthDate, birthCity, birthState, birthCountry, highSchool, 
          hsCity, hsState, hsCountry, deathDate
   from 
        BasketballWNBA.dbo.wom_basketball_master;

insert into Group6BasketballWNBA_1.dbo.Master (bioID, fullGivenName)
values
 ('buescer01w', 'Erin Buescher'),
 ('dorresc01w', 'Unknown'),
 ('feenska01w', 'Unknown'),
 ('reisska01w', 'Unknown'),
 ('willimi01w', 'Unknown'),
 ('willita02w', 'Unknown'),
 ('zolmash01w', 'Unknown'),
 ('kloppga99w', 'Gary Kloppenburg'),
 ('reevech99w', 'Cheryl Reeve'),
 ('richano99w', 'Nolan Richardson');

Go

 LoadMasterTable;
 select * from Group6BasketballWNBA_1.dbo.Master;


   
-- -------------------------------------------------------
-- Find max values in Draft Columns 
-- -------------------------------------------------------
select max(len(draftYear)) from BasketballWNBA.dbo.wom_basketball_draft; -- 4
select max(len(draftRound)) from BasketballWNBA.dbo.wom_basketball_draft; -- 2
select max(len(draftSelection)) from BasketballWNBA.dbo.wom_basketball_draft; -- 1
select max(len(draftOverall)) from BasketballWNBA.dbo.wom_basketball_draft; -- 3
select max(len(tmID)) from BasketballWNBA.dbo.wom_basketball_draft; -- 3
select max(len(firstName)) from BasketballWNBA.dbo.wom_basketball_draft; -- 19
select max(len(lastName)) from BasketballWNBA.dbo.wom_basketball_draft; -- 18
select max(len(fullName)) from BasketballWNBA.dbo.wom_basketball_draft; -- 29
select max(len(suffixName)) from BasketballWNBA.dbo.wom_basketball_draft; -- 0
select max(len(playerID)) from BasketballWNBA.dbo.wom_basketball_draft; -- 0
select max(len(draftFrom)) from BasketballWNBA.dbo.wom_basketball_draft; -- 42
select max(len(playedPro)) from BasketballWNBA.dbo.wom_basketball_draft; -- 1
select max(len(notes)) from BasketballWNBA.dbo.wom_basketball_draft; -- 9
select max(len(pickRoute)) from BasketballWNBA.dbo.wom_basketball_draft; -- 17
 -- -------------------------------------------------------
 -- Create Draft Table
 -- -------------------------------------------------------
  Create table Group6BasketballWNBA_1.dbo.Draft
(
  draftID int identity(1,1) primary key,
  draftYear int, 
  draftRound int, 
  draftSelection int, 
  draftOverall int, 
  tmID varchar(3), 
  firstName varchar(20), 
  lastName varchar(20), 
  fullName varchar(30), 
  suffixName varchar(10), 
  playerID varchar(15), 
  draftFrom varchar(50), 
  playedPro varchar(1), 
  notes varchar(25), 
  pickRoute varchar(20)
);
 -- -------------------------------------------------------
 -- Load Draft Table
 -- ------------------------------------------------------- 
 Go 
Create PROCEDURE LoadDraftTable
AS
insert into Group6BasketballWNBA_1.dbo.Draft
   select d.draftYear, d.draftRound, d.draftSelection, d.draftOverall, d.tmID, d.firstName, d.lastName, d.fullName, 
		  d.suffixName, m.bioID as playerID, d.draftFrom, d.playedPro, d.notes, d.pickRoute
   from 
        BasketballWNBA.dbo.wom_basketball_draft as d,
        Group6BasketballWNBA_1.dbo.Master as m
  where 
		m.fullGivenName = d.fullName;

UPDATE Group6BasketballWNBA_1.dbo.Draft
SET tmID = 'CHR'
where tmID = 'CHA';

Go


 LoadDraftTable;
 select * from Group6BasketballWNBA_1.dbo.Draft;

-- ------------------------------------------------------- 
-- Foreign Keys
-- -------------------------------------------------------

ALTER TABLE Group6BasketballWNBA_1.dbo.PlayerAward
ADD CONSTRAINT fk_PlayerAward_awardID
    FOREIGN KEY (awardID)
    REFERENCES Group6BasketballWNBA_1.dbo.Award (awardID);

ALTER TABLE Group6BasketballWNBA_1.dbo.PlayerAward
ADD CONSTRAINT fk_PlayerAward_playerID
    FOREIGN KEY (playerID)
    REFERENCES Group6BasketballWNBA_1.dbo.Master (bioID);

ALTER TABLE Group6BasketballWNBA_1.dbo.PlayerAward
ADD CONSTRAINT fk_PlayerAward_lgID
    FOREIGN KEY (lgID)
    REFERENCES Group6BasketballWNBA_1.dbo.League (lgID);

ALTER TABLE Group6BasketballWNBA_1.dbo.CoachAward
ADD CONSTRAINT fk_CoachAward_awardID
    FOREIGN KEY (awardID)
    REFERENCES Group6BasketballWNBA_1.dbo.Award (awardID);

ALTER TABLE Group6BasketballWNBA_1.dbo.CoachAward
ADD CONSTRAINT fk_CoachAward_coachID
    FOREIGN KEY (coachID)
    REFERENCES Group6BasketballWNBA_1.dbo.Coach (coachID);

ALTER TABLE Group6BasketballWNBA_1.dbo.CoachAward
ADD CONSTRAINT fk_CoachAward_lgID
    FOREIGN KEY (lgID)
    REFERENCES Group6BasketballWNBA_1.dbo.League (lgID);

ALTER TABLE Group6BasketballWNBA_1.dbo.SeriesPost
ADD CONSTRAINT fk_SeriesPost_round
    FOREIGN KEY (round)
    REFERENCES Group6BasketballWNBA_1.dbo.Round (code);

ALTER TABLE Group6BasketballWNBA_1.dbo.SeriesPost
ADD CONSTRAINT fk_SeriesPost_tmIDWinner
    FOREIGN KEY (tmIDWinner)
    REFERENCES Group6BasketballWNBA_1.dbo.Team (tmID);

ALTER TABLE Group6BasketballWNBA_1.dbo.SeriesPost
ADD CONSTRAINT fk_SeriesPost_tmIDLoser
    FOREIGN KEY (tmIDLoser)
    REFERENCES Group6BasketballWNBA_1.dbo.Team (tmID);

ALTER TABLE Group6BasketballWNBA_1.dbo.TeamsPost
ADD CONSTRAINT fk_TeamsPost_tmID
    FOREIGN KEY (tmID)
    REFERENCES Group6BasketballWNBA_1.dbo.Team (tmID);

ALTER TABLE Group6BasketballWNBA_1.dbo.Team
ADD CONSTRAINT fk_Team_lgID
    FOREIGN KEY (lgID)
    REFERENCES Group6BasketballWNBA_1.dbo.League (lgID);

ALTER TABLE Group6BasketballWNBA_1.dbo.Team
ADD CONSTRAINT fk_Team_franchID
    FOREIGN KEY (franchID)
    REFERENCES Group6BasketballWNBA_1.dbo.Franchise (franchID);

ALTER TABLE Group6BasketballWNBA_1.dbo.CoachStatistic
ADD CONSTRAINT fk_CoachStatistic_tmID
    FOREIGN KEY (tmID)
    REFERENCES Group6BasketballWNBA_1.dbo.Team (tmID);

ALTER TABLE Group6BasketballWNBA_1.dbo.CoachStatistic
ADD CONSTRAINT fk_CoachStatistic_coachID
    FOREIGN KEY (coachID)
    REFERENCES Group6BasketballWNBA_1.dbo.Coach (coachID);

ALTER TABLE Group6BasketballWNBA_1.dbo.Coach
ADD CONSTRAINT fk_Coach_coachID
    FOREIGN KEY (coachID)
    REFERENCES Group6BasketballWNBA_1.dbo.Master (bioID);

ALTER TABLE Group6BasketballWNBA_1.dbo.PlayerStatistic
ADD CONSTRAINT fk_PlayerStatistics_playerID
    FOREIGN KEY (playerID)
    REFERENCES Group6BasketballWNBA_1.dbo.Master (bioID);

ALTER TABLE Group6BasketballWNBA_1.dbo.PlayerStatistic
ADD CONSTRAINT fk_PlayerStatistics_tmID
    FOREIGN KEY (tmID)
    REFERENCES Group6BasketballWNBA_1.dbo.Team (tmID);

ALTER TABLE Group6BasketballWNBA_1.dbo.Draft
ADD CONSTRAINT fk_Draft_playerID
    FOREIGN KEY (playerID)
    REFERENCES Group6BasketballWNBA_1.dbo.Master (bioID)

ALTER TABLE Group6BasketballWNBA_1.dbo.Draft
ADD CONSTRAINT fk_Draft_tmID
    FOREIGN KEY (tmID)
    REFERENCES Group6BasketballWNBA_1.dbo.Team (tmID);
-- -------------------------------------------------------




