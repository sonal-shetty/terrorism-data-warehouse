USE [Global_Terrorism]
GO

CREATE PROCEDURE [dbo].[QUERYREPORT2]
AS

SELECT TerrorGroup_Dim.GroupName,
  AWD.WeaponType,
  ATD.TargType,
  DD.IYear,
  COUNT(*) AS total_attacks
FROM AttackEvent_Fact AS AEF
INNER JOIN AttackTarget_Dim ATD ON AEF.TargetKey = ATD.TargetKey
INNER JOIN AttackWeapon_Dim AWD ON AEF.WeaponKey = AWD.WeaponKey
INNER JOIN TerrorGroup_Dim ON AEF.GroupKey = TerrorGroup_Dim.GroupKey
INNER JOIN Date_Dim DD on AEF.DateKey=DD.DateKey
WHERE TerrorGroup_Dim.GroupName != 'Unknown'
GROUP BY TerrorGroup_Dim.GroupName,AWD.WeaponType, ATD.TargType, DD.IYear

GO


