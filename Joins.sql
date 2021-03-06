USE `3PL1_parduotuvė`;

SELECT * FROM Parduotuvės
INNER JOIN Kasininkai ON Parduotuvės.Id = Kasininkai.ParduotuvėsId;

SELECT * FROM Kasininkai
LEFT JOIN Parduotuvės ON Parduotuvės.Id = Kasininkai.ParduotuvėsId AND ArAktyvus = 1;
#WHERE ArAktyvus = 1;

SELECT * FROM Parduotuvės
RIGHT JOIN Kasininkai ON Parduotuvės.Id = Kasininkai.ParduotuvėsId;

SELECT * FROM Kasininkai
FULL JOIN Parduotuvės #ON Parduotuvės.Id = Kasininkai.ParduotuvėsId;