USE SE389_JMB
GO



CREATE DATABASE GuitarPartsReview
GO



--Creates COMPANY Table and adds dumby data
--
--
CREATE TABLE DBO.Company
(Company_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name CHAR(21)NOT NULL)

INSERT INTO Company (Name)
VALUES ('Stew-Mac'), ('Warmoth'), ('Seymour Duncan'),('Gotoh'),
('Grover'), ('EMG'), ('Fender'), ('Gibson'), ('Bigsby'), ('DiMarzio'),
('Floyd Rose'), ('Mighty Mite'), ('Dean Markley'), ('Hipshot'),
('Musicians Gear'), ('Proline');
GO



--Creates Company PARTS and adds dumby data
--
--
CREATE TABLE DBO.Parts
(Part_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
PartName CHAR(36) NOT NULL)

INSERT INTO Parts (PartName)
VALUES ('Necks'), ('Tuning Pegs'), ('Bridges'), ('Pick Ups'),
('Pick Guards'), ('Body');
GO



--Creates NECKS Table and adds dumby data
--Index on neck build variation
--
CREATE TABLE DBO.Necks
(Neck_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
NeckName CHAR(180) NOT NULL,
NeckWoodType CHAR(36) NOT NULL,
FretWoodType CHAR (36) NOT NULL,
NeckShape CHAR (18) NOT NULL,
NeckRadius CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

CREATE INDEX INDEX_NECK_BUILD
ON Necks (NeckWoodType,FretWoodType,NeckShape,NeckRadius)

ALTER TABLE DBO.Necks
ADD CONSTRAINT FK_Neck_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO Necks (NeckName, NeckWoodType, FretWoodType, NeckShape, NeckRadius, Part_ID)
VALUES ('Mighty Mite MM2905V Telecaster Vintage', 'Maple', 'Maple', 'V', '9.5"', '1'),
('Fender Classic Series 50s Stratocaster Neck', 'Maple', 'Maple', 'V', '7.25"', '1'),
('Warmoth Roasted Maple Telecaster Neck', 'Roasted Maple', 'Roasted Maple', 'C', '10.16"', '1'),
('Mighty Mite MM2904 Telecaster Replacement Neck', 'Maple', 'Rosewood', 'U', '9.5"', '1'),
('Mighty Mite MM2902 Stratocaster Replacement Neck', 'Maple', 'Maple', 'U', '9.5"', '1'),
('Mighty Mite MM2900L Left-Handed Stratocaster Replacement Neck', 'Maple', 'Rosewood', 'U', '9.5"', '1'),
('Mighty Mite MM2914 Birds Eye Telecaster Replacement Neck', 'Birds Eye Maple', 'Maple', 'U', '9.5"', '1'),
('Fender American Channel-Bound Telecaster Maple Neck', 'Maple', 'Rosewood', 'Modern C', '9.5-14"', '1'),
('Fender USA Stratocaster Neck', 'Maple', 'Maple', 'Modern C', '9.5"', '1'),
('Fender USA Stratocaster Neck', 'Maple', 'Rosewood', 'Modern C', '9.5"', '1'),
('Warmoth SN18729 Stratocaster Maple Neck', 'Maple', 'Pau Ferro', 'Modern C', '10-16"', '1'),
('Warmoth Stratocaster Tiltback Neck', 'Wenge', 'Figured Ziricote', 'Modern C', '10-16"', '1'),
('Fender Classic Series 72 Telecaster Deluxe Neck', 'Maple', 'Maple', 'C', '12"', '1'),
('Fender Classic Series 72 Telecaster Neck', 'Maple', 'Maple', 'U', '7.25"', '1'),
('Fender Classic Player 50s Stratocaster Neck', 'Maple', 'Maple', 'V', '9.5"', '1');
GO



--Creates TUNING PEGS Table and adds dumby data
--Index created to grab tuning pegs best made for a Fender
--
CREATE TABLE DBO.TuningPegs
(Tuner_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TunerName CHAR(180) NOT NULL,
TunerType CHAR (36) NOT NULL,
TunerMaterial CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

CREATE INDEX INDEX_TUNINGPEGS_FNDR
ON TuningPegs (TunerType)
WHERE TunerType = '6-In-Line'

ALTER TABLE DBO.TuningPegs
ADD CONSTRAINT FK_TuningPeg_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO TuningPegs (TunerName, TunerType, TunerMaterial, Part_ID)
VALUES ('Grover Original Rotomatics (102 Series) 3+3 Tuners', '3+3', 'Chrome', '2'),
('Gotoh Vintage-style Oval Knob 6-In-Line Tuners', '6-In-Line', 'Relic Nickel', '2'),
('Gibson Vintage Nickel Machine Heads with Pearloid Buttons', '3+3', 'Nickel', '2'),
('Grover 406C6 Mini Locking Rotomatic Tuners', '6-In-Line', 'Chrome', '2'),
('Fender Deluxe Locking Machine Heads', '6-In-Line', 'Chrome', '2'),
('Fender American Standard Guitar Tuning Machines', '6-In-Line', 'Chrome', '2'),
('Fender 70s F-Tuning Machines', '6-In-Line', 'Chrome', '2'),
('D-Addario Planet Waves Auto-Trim Tuning Machines', '3+3', 'Chrome', '2'),
('Gibson Vintage Nickel Machine Heads with Pearloid Buttons', '3+3', 'Nickel', '2'),
('Gotoh MLB3-G 3-On-A-Side Locking Tuners', '3+3', 'Chrome', '2'),
('D-Addario Planet Waves Auto-Trim Tuning Machines', '3+3', 'Black Chrome', '2'),
('Hipshot GT2 Electric Xtender', '3+3', 'Chrome', '2'),
('D-Addario Planet Waves Auto-Trim Tuning Machines', '3+3', 'Gold', '2'),
('Hipshot 6GLO Grip-Lock Locking Guitar Tuning Machines', '3+3', 'Chrome', '2'),
('Fender American Vintage Stratocaster/Telecaster Tuning Machines', '6-In-Line', 'Nickel', '2');
GO



--Creates BRIDGES Table and adds dumby data
--Index for non-chrome bridges
--
CREATE TABLE DBO.Bridges
(Bridge_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
BridgeName CHAR(180) NOT NULL,
BridgeType CHAR (36) NOT NULL,
BridgeMaterial CHAR (36) NOT NULL,
Part_ID INT NOT NULL)

CREATE INDEX INDEX_NON_CHROME_BRIDGES
ON Bridges (BridgeMaterial)
WHERE BridgeMaterial != 'Chrome'

ALTER TABLE DBO.Bridges
ADD CONSTRAINT FK_Bridge_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO Bridges (BridgeName, BridgeType, BridgeMaterial, Part_ID)
VALUES ('Golden Age Bridge', 'Roller', 'Chrome', '3'),
('Gotoh Modern Bridge for Telecaster', 'Tele-Bridge', 'Crome', '3'),
('Floyd Rose Original Tremolo System', 'Tremelo', 'Black Nickel', '3'),
('Gibson TP-6', 'Tailpiece', 'Gold', '3'),
('Hipshot 6-String US .125', 'Fixed', 'Gold', '3'),
('Bigsby B5', 'Vibrato Tailpiece', 'Chrome', '3'),
('Gibson Nashville Tune-O-Matic', 'Tailpiece', 'Nickel', '3'),
('Gibson Nashville Tune-O-Matic', 'Tailpiece', 'Chrome', '3'),
('Bigsby B5 for Telecaster', 'Vibrato Tailpiece', 'Chrome', '3'),
('Gibson Stop Bar', 'Tailpiece', 'Nickel', '3'),
('Hipshot Stainless Steel 3 Hole Mount with Compensated Saddles', ' Tele-Bridge ', 'Chrome', '3'),
('Gibson Historic ABR-1 Bridge', 'Non-wire', 'Nickel', '3'),
('Fender Vintage 3-Saddle Bridge', 'Tele-Bridge', 'Nickel', '3'),
('Fender Telecaster Bridge Kit', 'Tele-Bridge', 'Chrome', '3'),
('Acoustic Guitar Bridge', 'Acoustic', 'Rose Wood', '3');
GO



--Creates PICK UPS Table and adds dumby data
--Index on basic pick up information
--
CREATE TABLE DBO.PickUps
(PickUp_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
PickUpName CHAR(180) NOT NULL,
PickUpType CHAR (36) NOT NULL,
PickUpMaterial CHAR (18) NOT NULL,
PickUpConfig CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

CREATE INDEX INDEX_PickUp_Pairs
ON PickUps (PickUpName,PickUpType,PickUpConfig)

ALTER TABLE DBO.PickUps
ADD CONSTRAINT FK_PickUp_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO PickUps (PickUpName, PickUpType, PickUpMaterial, PickUpConfig, Part_ID)
VALUES ('Seymour Duncan Alnico Pro II Humbucker Pickup Set Black', 'Humbucker', 'Alnico 2', 'H/H', '4'),
('Fender Pure Vintage 65 Strat Pickups', 'Single-Coil', 'Alnico 2', 'S/S/S', '4'),
('EMG SA/SA/85 Strat Set - White', '2x Single-Coil w/Humbucker' ,'Alnico 5', 'H/S/S', '4'),
('Dean Markley XM Acoustic Guitar Pickup', 'Single-Coil' ,'ProMag Plus', 'S', '4'),
('Fender Tex Mex Pickups', 'Single-Coil' ,'Alnico 5', 'S/S/S', '4'),
('Fender Pure Vintage 65 Strat Pickups', 'Single-Coil' ,'Vintage Bobbins', 'S/S/S', '4'),
('Seymour Duncan Hot Rodded Humbucker Set', 'Humbucker' ,'SH-2 and SH-4', 'H/H', '4'),
('EMG ZW Zakk Wylde 81/85 Humbucker Set', 'Active Humbuckers' ,'Alnico', 'H/H', '4'),
('Seymour Duncan Pearly Gates Pickup Set Nickel Cover', 'Humbucker' ,'Alnico 2 Bar', 'H/H', '4'),
('Gibson 57 Classic Humbucker Neck Pickup Nickel', 'Humbucker' ,'Alnico 2', 'Neck', '4'),
('DiMarzio DP193 Air Norton Pickup', 'Humbucker' ,'Alnico 5', 'Neck', '4'),
('Seymour Duncan SH-4 JB Humbucker Pickup', 'Humbucker' ,'4 Conductor', 'N/M/B', '4'),
('Seymour Duncan SH-2 Jazz Model Pickup', 'Humbucker' ,'4 Conductor', 'Neck', '4'),
('DiMarzio DP178 True Velvet T Pickup', 'Single-Coil' ,'Alnico 5', 'Bridge', '4'),
('Seymour Duncan Antiquity P90 Soapbar Neck Pickup', 'P90','Alnico 2', 'Bridge','4');
GO

--Creates PICK GUARD Table and adds dumby data
--I am trying to make an Index for Stratocaster guards but can seem 
--to figure out why the INDEX does not like the LIKE statement 
--
CREATE TABLE DBO.PickGuards
(PickGuard_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
GuardType CHAR(180) NOT NULL,
GuardMaterial CHAR (36) NOT NULL,
GuardPly CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

CREATE INDEX INDEX_STRAT_GUARDS
ON PickGuards (GuardType)
WHERE GuardType LIKE '%Stratocaster%';
GO

ALTER TABLE DBO.PickGuards
ADD CONSTRAINT FK_PickGuard_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO PickGuards (GuardType, GuardMaterial, GuardPly, Part_ID)
VALUES ('Fender American Standard Stratocaster 11-Hole Black', 'Plastic', '3-ply', '5'),
('Fender American Standard Stratocaster 11-Hole Black', 'Plastic', '5-ply', '5'),
('Fender American Standard Telecaster 8-Hole  Black', 'Plastic', '3-ply', '5'),
('Fender American Standard Stratocaster Pickguard 11-Hole White Pearl', 'Plastic', '5-ply', '5'),
('Fender Telecaster Pickguard White Pearl', 'Plastic', '3-ply', '5'),
('Fender Lone Star Pickguard Tortoise Shell', 'Plastic', '4-ply', '5'),
('Fender Telecaster Pickguard for B Bender White Pearl', 'Plastic', '3-ply', '5'),
('Fender American Standard Stratocaster Pickguard 11-Hole 1HB/2SC Black Pearl', 'Plastic', '3-ply', '5'),
('Fender 62 Jazzmaster Tortoiseshell Pickguard', 'Plastic', '4-ply', '5'),
('Fender Big Apple Strat Dual Humbucker Pickguard Tortoise Shell', 'Plastic', '4-ply', '5'),
('Fender 56-59 10-Hole Stratocaster Pickguard Eggshell', 'Plastic', '1-ply', '5'),
('Gibson Les Paul Pickguard with Screws Cream', 'Plastic', '5-ply', '5'),
('Gibson Les Paul Pickguard with Screws Black', 'Plastic', '5-ply', '5'),
('Seymour Duncan Triple Rails Loaded Pickguard White', 'Plastic', '3-ply', '5'),
('Gibson SG Large White Pearloid', 'Plastic', '3-ply', '5');
GO



--Creates BODY Table and adds dumby data
--
--
CREATE TABLE DBO.Body
(Body_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
BodyType CHAR(36) NOT NULL,
WoodType CHAR (36) NOT NULL,
Part_ID INT NOT NULL)

ALTER TABLE DBO.Body
ADD CONSTRAINT FK_Body_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO Body (BodyType, WoodType, Part_ID)
VALUES ('Stratacaster', 'Alder', '6'),
('Stratacaster', 'Mahogany', '6'),
('Stratacaster', 'Ash', '6'),
('Stratacaster', 'Swamp Ash', '6'),
('Stratacaster', 'Walnut', '6'),
('Stratacaster', 'Koa', '6'),
('Telecaster', 'Ash', '6'),
('Telecaster', 'Mahogany', '6'),
('Telecaster', 'Alder', '6'),
('Telecaster', 'Maple', '6'),
('SG', 'Mahogany', '6'),
('Flying V', 'Korina', '6'),
('Flying V', 'Mahogany', '6'),
('Les-Paul', 'Mahogany', '6'),
('Les-Paul', 'Maple', '6');
GO



--Creates REVIEWERS Table and adds dumby data
--Trigger set for new user
--
CREATE TABLE DBO.Reviewers
(Reviewer_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Username CHAR(18) NOT NULL,
Password CHAR (12) NOT NULL)

INSERT INTO Reviewers (Username, Password)
VALUES ('Admin', '12345'),
('User', 'password');
GO

IF OBJECT_ID('newUser') IS NOT NULL
	DROP TRIGGER newUser
GO

CREATE TRIGGER newUser
ON Reviewers
AFTER INSERT
AS
BEGIN
	PRINT 'TRIGGER: A New User has been added.'
END
GO



--Creates PART REVIEWS Table and adds dumby data
--
--
CREATE TABLE DBO.PartReviews
(Review_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Rating CHAR(1) NOT NULL, CONSTRAINT CHK_PartReviews CHECK (Rating IN 
 ('1','2','3','4','5')),
 Comment CHAR(1000) NOT NULL,
Part_ID INT NOT NULL,
Neck_ID INT NULL,
Tuner_ID INT NULL,
Body_ID INT NULL,
PickGuard_ID INT NULL,
PickUp_ID INT NULL,
Bridge_ID INT NULL,
Reviewer_ID INT NOT NULL,
)

ALTER TABLE DBO.PartReviews

ADD FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID),

FOREIGN KEY(Neck_ID)
REFERENCES DBO.Necks(Neck_ID),

FOREIGN KEY(Tuner_ID)
REFERENCES DBO.TuningPegs(Tuner_ID),

FOREIGN KEY(Body_ID)
REFERENCES DBO.Body(Body_ID),

FOREIGN KEY(PickGuard_ID)
REFERENCES DBO.PickGuards(PickGuard_ID),

FOREIGN KEY(PickUp_ID)
REFERENCES DBO.PickUps(PickUp_ID),

FOREIGN KEY(Bridge_ID)
REFERENCES DBO.Bridges(Bridge_ID),

FOREIGN KEY(Reviewer_ID)
REFERENCES DBO.Reviewers(Reviewer_ID)

INSERT INTO PartReviews (Rating, Comment, Part_ID, PickUp_ID, Neck_ID, Reviewer_ID)
VALUES 
('5', 'Tone sounds amazing when clean also has that muddy snarl', '5', '1', null, '1'),
('4', 'The perfect pick up for a tele or a strat!', '5', '2', null, '1'),
('5', 'Great pick up for the blues rock player!', '5', '1', null, '1'),
('4', 'Awesome clean tone with just enough of that classic twang', '5', '2', null, '1'),
('5', 'The feel of this neck is great and fit my tele perfectly', '1', null, '3', '2');
GO



--Strored Procedure to grab all 5 star PART REVIEWS
--with execute statement
--
IF OBJECT_ID('GetFiveStars') IS NOT NULL
	DROP PROCEDURE GetFiveStars
GO
GO

CREATE PROCEDURE GetFiveStars   
AS   

    SET NOCOUNT ON;  
    SELECT Part_ID, Comment 
    FROM PartReviews
    WHERE Rating = '5'; 
GO

EXEC GetFiveStars
GO




--Insert statement to TEST TRIGGER
--
--
INSERT INTO Reviewers (Username, Password)
VALUES ('JordanMichael', 'EsCueEll');
GO
SELECT *
FROM Reviewers
GO



--Some statements
--
--
SELECT BridgeName, BridgeType, BridgeMaterial FROM Bridges
WHERE BridgeType = 'Tele-Bridge';
GO

SELECT PickUpName, PickUpType,PickUpMaterial FROM PickUps
WHERE PickUpType Like '%Single-Coil%';
GO

SELECT BodyType, WoodType FROM Body
WHERE WoodType = 'Ash' 
OR WoodType = 'Mahogany';
GO



--Catalog Queries
--1
--
SELECT * FROM sys.columns
INNER JOIN sys.objects ON sys.columns.object_id=sys.objects.object_id
WHERE type='U'
ORDER BY sys.objects.name;


--2
--
--
SELECT * FROM sys.objects
WHERE type_desc='FOREIGN_KEY_CONSTRAINT'


--3
--
--
SELECT * FROM sys.user_token


--4
--
--
SELECT * FROM sys.objects
WHERE type_desc='USER_TABLE' 



--Creates Full Text Catalog
--and Index
--
CREATE FULLTEXT CATALOG ReviewsFTC
AS DEFAULT
GO

CREATE FULLTEXT INDEX ON dbo.Necks (Comment)
KEY INDEX Review_ID
ON ReviewsFTC
GO



--Full Text Queries
--1
--
SELECT Rating, Comment FROM dbo.PartReviews
WHERE CONTAINS(Comment, 'tone')
GO


--2
--
--
SELECT Rating, Comment FROM dbo.PartReviews
WHERE CONTAINS(Comment, 'clean')
GO


--3
--
--
SELECT Rating, Comment FROM dbo.PartReviews
WHERE CONTAINS(Comment, 'telecaster')
GO



--Thesaurus code
--
--<thesaurus xmlns="x-schema:tsSchema.xml">
--<diacritics_sensitive>0</diacritics_sensitive>
--	<expansion>
--		<sub>tones</sub>
--		<sub>sounds</sub>
--		<sub>tone</sub>
--		<sub>sound</sub>
--	</expansion>
--	<replacement>
--		<pat>great</pat>
--		<pat>awesome</pat>
--		<pat>amazing</pat>
--	</replacement>
--</thesaurus>
--
--



--Thesaurus Queries
--1
--
SELECT Rating, Comment FROM dbo.PartReviews
WHERE CONTAINS(Comment, 'FORMSOF(THESAURUS, tone)')


--2
--
--
SELECT Rating, Comment FROM dbo.PartReviews
WHERE CONTAINS(Comment, 'FORMSOF(THESAURUS, "tone*" NEAR clean)')