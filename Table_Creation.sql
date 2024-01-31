USE Global_Terrorism
go

CREATE TABLE AttackTarget_Dim
(TargetKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
TargType  NVARCHAR(255),
TargSubtype NVARCHAR(255),
Nationality NVARCHAR(255));
GO


CREATE TABLE AttackWeapon_Dim
(WeaponKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Weapontype NVARCHAR(255),
WeaponSubtype NVARCHAR(255));
GO

CREATE TABLE AttackLocation_Dim
(LocationKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Country NVARCHAR(255),
Region NVARCHAR(255),
ProvState NVARCHAR(255),
City NVARCHAR(255));
GO

CREATE TABLE TerrorGroup_Dim
(GroupKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
GroupName NVARCHAR(255));
GO 

CREATE TABLE Date_Dim
(DateKey INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
EventDate DATE,
IYear FLOAT,
IMonth FLOAT,
IDay FLOAT);
GO

CREATE TABLE AttackEvent_Fact
(EventID FLOAT NOT NULL UNIQUE,
TotalDeaths FLOAT,
TotalWounded FLOAT,
TotalDamages FLOAT,
LocationKey INT NOT NULL,
TargetKey INT NOT NULL,
GroupKey INT NOT NULL,
WeaponKey INT NOT NULL,
DateKey INT NOT NULL,
FOREIGN KEY (LocationKey) REFERENCES AttackLocation_Dim(LocationKey),
FOREIGN KEY (TargetKey) REFERENCES AttackTarget_Dim(TargetKey),
FOREIGN KEY (GroupKey) REFERENCES TerrorGroup_Dim(GroupKey),
FOREIGN KEY (WeaponKey) REFERENCES AttackWeapon_Dim(WeaponKey),
FOREIGN KEY (DateKey) REFERENCES Date_Dim(DateKey),
PRIMARY KEY(EventID,LocationKey,TargetKey,GroupKey,WeaponKey,DateKey)
);
GO

