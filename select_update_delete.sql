USE `3pl1_parduotuvė`;

SELECT Id, Adresas 
FROM parduotuvės;

SELECT Adresas
FROM parduotuvės;

SELECT Serija, Numeris
FROM kvitai;

/*INSERT INTO kvitai (KasosId, Numeris, MokėtinaSuma, SumokėtaSuma, SpausdinimoData) VALUES
(1, 'F84', 23.68, 24.00, CURDATE()),
(1, 'F85', 48.23, 48.50, CURDATE()),
(2, 'F86', 50.30, 60.00, CURDATE());*/

CREATE TEMPORARY TABLE tempKvitai(
   KasosId int,
   Numeris char(6),
   MokėtinaSuma decimal(4,2),
   SumokėtaSuma decimal(4, 2),
   SpausdinimoData datetime
);

INSERT INTO tempKvitai
SELECT KasosId, Numeris, MokėtinaSuma, SumokėtaSuma, SpausdinimoData
FROM kvitai;

SELECT * FROM tempKvitai;

DROP TABLE tempKvitai;



SELECT *
FROM kvitai
WHERE Numeris = 'F85';

#Kvitu numerius, kurie atspausdinti pirmoje kasoje
SELECT Numeris FROM kvitai WHERE KasosId = 1;

#KasosId kvitų, už kuriuos buvo sumokėta daugiau nei 50 eurų
SELECT KasosId FROM kvitai where SumokėtaSuma > 50.00;

#Kvito id, mokėtinos sumos, kvitų, kurie buvo atspausdinti kovo 2 diena
SELECT Id, MokėtinaSuma FROM kvitai 
WHERE SpausdinimoData >= '2021-03-05 00:00:00' AND SpausdinimoData <= '2021-03-05 23:59:59';

SELECT Id, MokėtinaSuma FROM kvitai 
WHERE SpausdinimoData BETWEEN '2021-03-05 00:00:00' AND '2021-03-05 23:59:59';

SELECT Id, MokėtinaSuma FROM kvitai 
WHERE SpausdinimoData BETWEEN '2021-03-05 00:00:00' AND '2021-03-05 23:59:59';

#'2020-03-05 08:15:17'
#'2020-03-05' -> '2020-03-05 00:00:00'

#UPDATE
UPDATE kvitai SET Serija = 'F' WHERE Id = 1 OR Id = 2 OR Id = 3 OR Id = 4;
UPDATE kvitai SET Serija = 'F' WHERE Id IN (1, 2, 3, 4);
#UPDATE kvitai SET Serija = 'F' WHERE Id IN (SELECT Id FROM kvitai WHERE Numeris LIKE 'F%');

#DELETE 
DELETE FROM kvitai WHERE Id = 3;

UPDATE kvitai SET Grąža = SumokėtaSuma - MokėtinaSuma;

SELECT * 
FROM kvitai
ORDER BY MokėtinaSuma DESC
LIMIT 1;


SELECT *
FROM kvitai
ORDER BY Numeris ASC








