USE SE389_JMB
GO

CREATE TABLE DBO.Company
(Company_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Name CHAR(21)NOT NULL)

INSERT INTO Company (Name)
VALUES ('Stew-Mac');

INSERT INTO Company (Name)
VALUES ('Warmoth');

INSERT INTO Company (Name)
VALUES ('Seymour Duncan');

INSERT INTO Company (Name)
VALUES ('Gotoh');

INSERT INTO Company (Name)
VALUES ('Grover');

INSERT INTO Company (Name)
VALUES ('EMG');

INSERT INTO Company (Name)
VALUES ('Fender');

INSERT INTO Company (Name)
VALUES ('Gibson');

INSERT INTO Company (Name)
VALUES ('Bigsby');

INSERT INTO Company (Name)
VALUES ('DiMarzio');

INSERT INTO Company (Name)
VALUES ('Floyd Rose');
GO


CREATE TABLE DBO.Parts
(Part_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
PartName CHAR(36) NOT NULL)

INSERT INTO Parts (PartName)
VALUES ('Necks');

INSERT INTO Parts (PartName)
VALUES ('Tuning Pegs');

INSERT INTO Parts (PartName)
VALUES ('Bridges');

INSERT INTO Parts (PartName)
VALUES ('Pick Ups');

INSERT INTO Parts (PartName)
VALUES ('Pick Guards');

INSERT INTO Parts (PartName)
VALUES ('Body');
GO


CREATE TABLE DBO.Necks
(Neck_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
NeckName CHAR(180) NOT NULL,
NeckWoodType CHAR(36) NOT NULL,
FretWoodType CHAR (36) NOT NULL,
NeckShape CHAR (18) NOT NULL,
NeckRadius CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

CREATE INDEX INDEX_NeckBuild
ON Necks (NeckWoodType,FretWoodType)

ALTER TABLE DBO.Necks
ADD CONSTRAINT FK_Neck_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO Necks (NeckName, NeckWoodType, FretWoodType, NeckShape, NeckRadius, Part_ID)
VALUES ('Stratocaster Replacement Neck with Maple Fingerboard and Jumbo Frets', 'Maple', 'Maple', 'U', '9.5"', '1');

INSERT INTO Necks (NeckName, NeckWoodType, FretWoodType, NeckShape, NeckRadius, Part_ID)
VALUES ('Fender Classic Series 50s Stratocaster Replacement Neck', 'Maple', 'Maple', 'V', '7.25"', '1');

INSERT INTO Necks (NeckName, NeckWoodType, FretWoodType, NeckShape, NeckRadius, Part_ID)
VALUES ('Warmoth Roasted Maple Tele Neck', 'Roasted Maple', 'Roasted Maple', 'C', '10.16', '1');
GO


CREATE TABLE DBO.TuningPegs
(Tuner_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
TunerName CHAR(180) NOT NULL,
TunerType CHAR (36) NOT NULL,
TunerMaterial CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

ALTER TABLE DBO.TuningPegs
ADD CONSTRAINT FK_TuningPeg_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO TuningPegs (TunerName, TunerType, TunerMaterial, Part_ID)
VALUES ('Grover Original Rotomatics (102 Series) 3+3 Tuners', '3+3', 'Chrome', '2');

INSERT INTO TuningPegs (TunerName, TunerType, TunerMaterial, Part_ID)
VALUES ('Gotoh Vintage-style Oval Knob 6-In-Line Tuners', '6-In-Line', 'Relic Nickel', '2');

INSERT INTO TuningPegs (TunerName, TunerType, TunerMaterial, Part_ID)
VALUES ('Gibson Vintage Nickel Machine Heads with Pearloid Buttons', '3+3', 'Nickel', '2');

INSERT INTO TuningPegs (TunerName, TunerType, TunerMaterial, Part_ID)
VALUES ('Fender American Vintage Stratocaster/Telecaster Tuning Machines', '6-In-Line', 'Nickel', '2');
GO


CREATE TABLE DBO.Bridges
(Bridge_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
BridgeName CHAR(180) NOT NULL,
BridgeType CHAR (36) NOT NULL,
BridgeMaterial CHAR (36) NOT NULL,
Part_ID INT NOT NULL)

ALTER TABLE DBO.Bridges
ADD CONSTRAINT FK_Bridge_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO Bridges (BridgeName, BridgeType, BridgeMaterial, Part_ID)
VALUES ('Golden Age Roller Bridge', 'Roller', 'Chrome', '3');

INSERT INTO Bridges (BridgeName, BridgeType, BridgeMaterial, Part_ID)
VALUES ('Gotoh Modern Bridge for Tele', 'Tele-Bridge', 'Crome', '3');

INSERT INTO Bridges (BridgeName, BridgeType, BridgeMaterial, Part_ID)
VALUES ('Floyd Rose Original Tremolo System', 'Tremelo', 'Black Nickel', '3');

INSERT INTO Bridges (BridgeName, BridgeType, BridgeMaterial, Part_ID)
VALUES ('Acoustic Guitar Bridge', 'Acoustic', 'Rose Wood', '3');
GO





CREATE TABLE DBO.PickUps
(PickUp_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
PickUpName CHAR(180) NOT NULL,
PickUpType CHAR (36) NOT NULL,
PickUpMaterial CHAR (18) NOT NULL,
PickUpConfig CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

CREATE INDEX INDEX_PickUp_Pairs
ON PickUps (PickUpType,PickUpConfig)

ALTER TABLE DBO.PickUps
ADD CONSTRAINT FK_PickUp_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO PickUps (PickUpName, PickUpType, PickUpMaterial, PickUpConfig, Part_ID)
VALUES ('Seymour Duncan Alnico Pro II Humbucker Pickup Set Black', 'Humbucker', 'Alnico 2', 'H/H', '4');

INSERT INTO PickUps (PickUpName, PickUpType, PickUpMaterial, PickUpConfig, Part_ID)
VALUES ('Fender Pure Vintage 65 Strat Pickups', 'Single-Coil', 'Alnico 2', 'S/S/S', '4');

INSERT INTO PickUps (PickUpName, PickUpType, PickUpMaterial, PickUpConfig, Part_ID)
VALUES ('EMG SA/SA/85 Strat Set - White', '2x Single-Coil w/Humbucker' ,'Alnico 5', 'H/S/S', '4');

INSERT INTO PickUps (PickUpName, PickUpType, PickUpMaterial, PickUpConfig, Part_ID)
VALUES ('Seymour Duncan Antiquity P90 Soapbar Neck Cream Pickup', 'P90','Alnico 2', 'Bridge','4');
GO


CREATE TABLE DBO.PickGuards
(PickGuard_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
GuardType CHAR(180) NOT NULL,
GuardMaterial CHAR (36) NOT NULL,
GuardPly CHAR (18) NOT NULL,
Part_ID INT NOT NULL)

ALTER TABLE DBO.PickGuards
ADD CONSTRAINT FK_PickGuard_Part
FOREIGN KEY (Part_ID)
REFERENCES DBO.Parts(Part_ID)

INSERT INTO PickGuards (GuardType, GuardMaterial, GuardPly, Part_ID)
VALUES ('Fender American Standard Strat 11-Hole 3-Ply Pickguard Black', 'Plastic', '3-ply', '5');

INSERT INTO PickGuards (GuardType, GuardMaterial, GuardPly, Part_ID)
VALUES ('Fender American Standard Strat 11-Hole 5-Play Pickguard Black', 'Plastic', '5-ply', '5');

INSERT INTO PickGuards (GuardType, GuardMaterial, GuardPly, Part_ID)
VALUES ('Gibson Les Paul Cream Pickguard with Screws', 'Plastic', '3-ply', '5');

INSERT INTO PickGuards (GuardType, GuardMaterial, GuardPly, Part_ID)
VALUES ('Gibson SG Large White Pearloid', 'Plastic', '3-ply', '5');
GO


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
VALUES ('Stratacaster', 'Alder', '6');

INSERT INTO Body (BodyType, WoodType, Part_ID)
VALUES ('Stratacaster', 'Mahogany', '6');

INSERT INTO Body (BodyType, WoodType, Part_ID)
VALUES ('Telecaster', 'Ash', '6');

INSERT INTO Body (BodyType, WoodType, Part_ID)
VALUES ('Telecaster', 'Maple', '6');

INSERT INTO Body (BodyType, WoodType, Part_ID)
VALUES ('Les-Paul', 'Maple', '6');
GO


CREATE TABLE DBO.Reviewers
(Reviewer_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
Username CHAR(12) NOT NULL,
Password CHAR (12) NOT NULL)

INSERT INTO Reviewers (Username, Password)
VALUES ('Admin', '12345');

INSERT INTO Reviewers (Username, Password)
VALUES ('User', 'password');
GO

IF OBJECT_ID('NewUserTrigger') IS NOT NULL
	DROP TRIGGER NewUserTrigger
GO

CREATE TRIGGER NewUserTrigger
ON Reviewers
AFTER INSERT
AS
BEGIN
	PRINT 'A new User has been added.'
END
GO


CREATE TABLE DBO.PartReviews
(Review_ID INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
 Rating CHAR(1) NOT NULL, CONSTRAINT CHK_PartReviews CHECK (Rating IN 
 ('1','2','3','4','5')),
 Comment CHAR(1000) NOT NULL,
Part_ID INT NOT NULL,
Neck_ID INT NOT NULL,
Tuner_ID INT NOT NULL,
Body_ID INT NOT NULL,
PickGuard_ID INT NOT NULL,
PickUp_ID INT NOT NULL,
Bridge_ID INT NOT NULL,
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
GO
















