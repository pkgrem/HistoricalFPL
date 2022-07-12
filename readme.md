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
