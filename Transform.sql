DECLARE @name VARCHAR(100)
DECLARE db_cursor CURSOR FOR 
SELECT COLUMN_NAME from INFORMATION_SCHEMA.COLUMNS where TABLE_NAME='Dataset' and DATA_TYPE='nvarchar'

OPEN db_cursor  
FETCH NEXT FROM db_cursor INTO @name  

WHILE @@FETCH_STATUS = 0  
BEGIN  
      
	  
	  EXEC('UPDATE Dataset SET '+ @name+' ='+'''UNKNOWN''' +' WHERE '+@name+' IS NULL')

      FETCH NEXT FROM db_cursor INTO @name 
END 

CLOSE db_cursor  
DEALLOCATE db_cursor

--------------------------------------------------------------------------------------------------------------


DELETE FROM Dataset WHERE iyear=0 OR imonth=0 OR iday=0

--------------------------------------------------------------------------------------------------------------

/*  -99 prop value refers very low damage. Hence updating it to 0.  */

UPDATE DATASET SET propvalue=0 where propvalue =-99 and propvalue is null
DELETE FROM Dataset WHERE propextent_txt='7'


--------------------------------------------------------------------------------------------------------------

UPDATE DATASET SET nkill=0 where nkill is NULL

UPDATE DATASET SET nkillter=0 where nkillter is NULL

UPDATE DATASET SET nkillus=0 where nkillus is NULL

UPDATE DATASET SET nwound=0 where nwound is NULL

UPDATE DATASET SET nwoundte=0 where nwoundte is NULL

UPDATE DATASET SET nwoundus=0 where nwoundus is NULL
