USE `3PL1_parduotuvė`;

SELECT * FROM kasininkai;

#UPDATE kasininkai SET ArAktyvus = 1




#ALTER TABLE kasininkai ADD COLUMN ArAktyvus BOOL
#ALTER TABLE kasininkai DROP COLUMN ArAktyvus
#ALTER TABLE kasininkai ADD COLUMN ArAktyvus BOOL DEFAULT TRUE;

#insert into kasininkai (Numeris, ParduotuvėsId, ArAktyvus) values ('H3660', 1, TRUE)
#insert into kasininkai (Numeris, ParduotuvėsId) values ('H3660', 1)

ALTER TABLE kasininkai ADD COLUMN Vardas VARCHAR(50) NOT NULL AFTER Id;
ALTER TABLE kasininkai ADD COLUMN Pavardė VARCHAR(70) AFTER Vardas;

ALTER TABLE kasininkai ADD CONSTRAINT UQ_Numeris UNIQUE (Numeris);



