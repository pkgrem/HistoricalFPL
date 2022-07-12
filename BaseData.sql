SELECT 
	name, 
	c.season_x, 
	c.position, 
	sum(minutes) as MinutesPlayed, 
	ROUND(AVG(CAST(total_points AS FLOAT)), 2) as AveragePoints,
	ROUND(CAST((select top 1 value FROM [FPL].[dbo].[cleaned_merged_seasons] cm where cm.season_x = c.season_x and cm.element = c.element and value is not null order by gw asc)  AS FLOAT), 2)  /10 as StartingPrice,
	ROUND(CAST((select top 1 value FROM [FPL].[dbo].[cleaned_merged_seasons] cm where cm.season_x = c.season_x and cm.element = c.element and value is not null order by gw desc)  AS FLOAT), 2)  /10 as EndPrice
 
 FROM [FPL].[dbo].[cleaned_merged_seasons] c
   where c.minutes !=0
   group by name, season_x, position, element;
