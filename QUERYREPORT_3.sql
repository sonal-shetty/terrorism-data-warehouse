USE [Global_Terrorism]
GO

CREATE PROCEDURE [dbo].[QUERYREPORT3] @attackYear INT
AS

SELECT
  AL.Region,
  DD.IYear AS AttackYear,
  COUNT(AEF.eventid) as Total_Attacks,
  SUM(AEF.TotalDeaths) AS Total_Fatalities,
  SUM(AEF.TotalWounded) AS Total_Wounded,
  SUM(AEF.TotalDamages) AS Total_Damages
FROM AttackEvent_Fact AS AEF
INNER JOIN AttackLocation_Dim AL ON AEF.LocationKey = AL.LocationKey
INNER JOIN Date_Dim DD ON AEF.DateKey = DD.DateKey
WHERE DD.IYear = @attackYear and (AL.Region !='Unknown' or AL.Country !='Unknown')
GROUP BY AL.Region, DD.IYear


GO


