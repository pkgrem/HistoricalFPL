Based off of the following CSV files
https://github.com/vaastav/Fantasy-Premier-League

Imported the file into a DB cleaned_merged_seasons

See FileTypes for import:

| column\_name       | DATA\_TYPE | IS\_NULLABLE |
| ------------------ | ---------- | ------------ |
| column1            | varchar    | YES          |
| season\_x          | nvarchar   | YES          |
| name               | nvarchar   | YES          |
| position           | nvarchar   | YES          |
| team\_x            | varchar    | YES          |
| assists            | tinyint    | YES          |
| bonus              | tinyint    | YES          |
| bps                | varchar    | YES          |
| clean\_sheets      | bit        | YES          |
| creativity         | float      | YES          |
| element            | varchar    | YES          |
| fixture            | varchar    | YES          |
| goals\_conceded    | varchar    | YES          |
| goals\_scored      | varchar    | YES          |
| ict\_index         | float      | YES          |
| influence          | float      | YES          |
| kickoff\_time      | nvarchar   | YES          |
| minutes            | tinyint    | YES          |
| opponent\_team     | tinyint    | YES          |
| opp\_team\_name    | nvarchar   | YES          |
| own\_goals         | bit        | YES          |
| penalties\_missed  | bit        | YES          |
| penalties\_saved   | tinyint    | YES          |
| red\_cards         | tinyint    | YES          |
| round              | tinyint    | YES          |
| saves              | tinyint    | YES          |
| selected           | int        | YES          |
| team\_a\_score     | float      | YES          |
| team\_h\_score     | float      | YES          |
| threat             | float      | YES          |
| total\_points      | smallint   | YES          |
| transfers\_balance | int        | YES          |
| transfers\_in      | int        | YES          |
| transfers\_out     | int        | YES          |
| value              | tinyint    | YES          |
| was\_home          | bit        | YES          |
| yellow\_cards      | bit        | YES          |
| GW                 | tinyint    | YES          |

After creating the base set of data I created a subset of data based on some queries and groupings to get averages. From the base set of data I created a new table, so it would be queriable. Is that a word? Essentially, it would create less of system load due to the data being in a table instead of a query with rotten groups.


```
SELECT 
	name, 
	c.season_x, 
	c.position, 
	sum(minutes) as MinutesPlayed, 
	sum(total_points) as TotalPoints,
	ROUND(AVG(CAST(total_points AS FLOAT)), 2) as AveragePoints,
	ROUND(CAST((select top 1 value FROM [FPL].[dbo].[cleaned_merged_seasons] cm where cm.season_x = c.season_x and cm.element = c.element and value is not null order by gw asc)  AS FLOAT), 2)  /10 as StartingPrice,
	ROUND(CAST((select top 1 value FROM [FPL].[dbo].[cleaned_merged_seasons] cm where cm.season_x = c.season_x and cm.element = c.element and value is not null order by gw desc)  AS FLOAT), 2)  /10 as EndPrice
 INTO BaseData
 FROM [FPL].[dbo].[cleaned_merged_seasons] c
   where c.minutes !=0
   group by name, season_x, position, element
   ;
   ```
