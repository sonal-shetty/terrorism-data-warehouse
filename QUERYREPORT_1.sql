USE [Global_Terrorism]
GO


CREATE PROCEDURE [dbo].[QUERYREPORT1] as
 SELECT
  ATD.TargType,
  COUNT(*) AS total_attacks,
  SUM(AEF.TotalDeaths) AS total_fatalities,
  SUM(AEF.TotalWounded) AS total_wounded
FROM AttackEvent_Fact AS AEF
INNER JOIN AttackTarget_Dim ATD ON AEF.TargetKey = ATD.TargetKey
WHERE ATD.TargType != 'Unknown'
GROUP BY ATD.TargType


GO


