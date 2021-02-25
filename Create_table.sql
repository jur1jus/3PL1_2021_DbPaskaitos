#Duomenų bazės (schemos) sukūrimas
CREATE SCHEMA `3PL1_Mokymasis`;

#Pasirenkam duomenų bazę (schemą)
USE `3PL1_Mokymasis`;

#Darbuotojo lentelės kūrimas
CREATE TABLE Darbuotojai
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Vardas VARCHAR(50),
    Pavardė VARCHAR(80),
    Adresas VARCHAR(200),
    ElPaštas VARCHAR(255)
);

#Pareigų lentelės sukūrimas
CREATE TABLE Pareigos
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Pavadinimas VARCHAR(50)
);

#Darbuotojų pareigų lentelės sukūrimas
CREATE TABLE DarbuotojųPareigos
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    PareigosId INT,
    DarbuotojoId INT,
    FOREIGN KEY (PareigosId) REFERENCES Pareigos(Id),
    FOREIGN KEY (DarbuotojoId) REFERENCES Darbuotojai(Id)
);
