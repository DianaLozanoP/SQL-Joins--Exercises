--This file contains all the exercises required using the database created inside data.sql
-- write your queries here
--Write the following SQL commands to produce the necessary output

--1. Join the two tables so that every column and record appears, regardless of if there is not an ***owner_id*** . 

--SELECT *
-- FROM owners o
-- LEFT JOIN vehicles v
-- ON o.id = v.owner_id;

--2.Count the number of cars for each owner. Display the owners first_name , last_name and count of vehicles.
--The first_name should be ordered in ascending order. 

--SELECT o.first_name, o.last_name, COUNT(*) AS count
-- FROM owners o
-- JOIN vehicles v
-- ON o.id = v.owner_id
-- GROUP BY o.first_name, o.last_name
-- ORDER BY count;

--3.Count the number of cars for each owner and display the average price for each of the cars as integers. 
--Display the owners first_name , last_name, average price and count of vehicles. 
--The first_name should be ordered in descending order. 
--Only display results with more than one vehicle and an average price greater than 10000.

-- SELECT o.first_name, o.last_name, AVG(price) AS average_price, COUNT(*) AS count
-- FROM owners o
-- JOIN vehicles v
-- ON o.id = v.owner_id
-- GROUP BY o.first_name, o.last_name
-- HAVING count(*) > 1 AND AVG(price) > 10000
-- ORDER BY o.first_name DESC;


--PART TWO: SQL Zoo
--Complete the exercises in the Tutorials steps 6 and 7

--1.The first example shows the goal scored by a player with the last name 'Bender'. The * says to list all the columns in the table - a shorter way of saying matchid, teamid, player, gtime
-- Modify it to show the matchid and player name for all goals scored by Germany. To identify German players, check for: teamid = 'GER'

--SELECT matchid, player FROM goal
-- JOIN eteam 
-- ON eteam.id = goal.teamid
-- WHERE teamid = 'GER';

--2.From the previous query you can see that Lars Bender's scored a goal in game 1012. Now we want to know what teams were playing in that match.
-- Notice in the that the column matchid in the goal table corresponds to the id column in the game table. We can look up information about game 1012 by finding that row in the game table.
-- Show id, stadium, team1, team2 for just game 1012

--SELECT id,stadium,team1,team2
--   FROM game
-- WHERE id =1012

--3.The FROM clause says to merge data from the goal table with that from the game table. The ON says how to figure out which rows in game go with which rows in goal - the matchid from goal must match id from game. (If we wanted to be more clear/specific we could say
-- ON (game.id=goal.matchid)
-- The code below shows the player (from the goal) and stadium name (from the game table) for every goal scored.
-- Modify it to show the player, teamid, stadium and mdate for every German goal.

--SELECT player, teamid, stadium, mdate
--   FROM game JOIN goal ON (id=matchid)
-- WHERE teamid = 'GER'

--4.Use the same JOIN as in the previous question.
-- Show the team1, team2 and player for every goal scored by a player called Mario player LIKE 'Mario%'

--SELECT team1, team2, player
--   FROM game JOIN goal ON (id=matchid)
-- WHERE player LIKE 'Mario%'

--5.The table eteam gives details of every national team including the coach. You can JOIN goal to eteam using the phrase goal JOIN eteam on teamid=id
-- Show player, teamid, coach, gtime for all goals scored in the first 10 minutes gtime<=10

--SELECT player, teamid, coach, gtime
-- FROM goal 
-- JOIN eteam
-- ON teamid=id
-- WHERE gtime<=10

--6.To JOIN game with eteam you could use either
-- game JOIN eteam ON (team1=eteam.id) or game JOIN eteam ON (team2=eteam.id)
-- Notice that because id is a column name in both game and eteam you must specify eteam.id instead of just id
-- List the dates of the matches and the name of the team in which 'Fernando Santos' was the team1 coach.

--SELECT mdate, teamname
-- FROM game
-- JOIN eteam 
-- ON (team1=eteam.id)
-- WHERE coach = 'Fernando Santos'

--7.List the player for every goal scored in a game where the stadium was 'National Stadium, Warsaw'
--SELECT player
-- FROM game JOIN goal ON (id=matchid)
-- WHERE stadium = 'National Stadium, Warsaw'

--8.The example query shows all goals scored in the Germany-Greece quarterfinal.
-- Instead show the name of all players who scored a goal against Germany.

--SELECT DISTINCT(player)
-- FROM game JOIN goal ON matchid = id 
-- WHERE (team1='GER' OR team2 = 'GER') AND teamid != 'GER'

--9.Show teamname and the total number of goals scored.
--SELECT teamname, COUNT(*)
-- FROM eteam JOIN goal ON id=teamid
-- GROUP BY teamname

--10.Show the stadium and the number of goals scored in each stadium.
--SELECT stadium, COUNT(*)
--  FROM game JOIN goal ON (id=matchid)
-- GROUP BY stadium

--11. For every match involving 'POL', show the matchid, date and the number of goals scored.
--SELECT matchid,mdate, COUNT (*) as goals
--SELECT matchid,mdate, COUNT (*) as goals
-- FROM game JOIN goal ON matchid = id 
-- WHERE (team1 = 'POL' OR team2 = 'POL')
-- GROUP BY matchid, mdate

--12.For every match where 'GER' scored, show matchid, match date and the number of goals scored by 'GER'.
-- FROM game JOIN goal ON matchid = id 
-- WHERE (team1 = 'GER' OR team2 = 'GER') AND teamid = 'GER'
-- GROUP BY matchid, mdate

--13.List every match with the goals scored by each team as shown. This will use "CASE WHEN" which has not been explained in any previous exercises.
--SELECT mdate,
    --    team1,
    --    SUM(CASE WHEN teamid = team1 THEN 1 ELSE 0 END) AS score1,
    --    team2,
    --    SUM(CASE WHEN teamid = team2 THEN 1 ELSE 0 END) AS score2 
    -- FROM game LEFT JOIN goal ON (id = matchid)
    -- GROUP BY mdate,team1,team2


