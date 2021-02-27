CREATE SCHEMA `3PL1_Parduotuvė`;

USE `3PL1_Parduotuvė`;

CREATE TABLE Parduotuvės
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Adresas VARCHAR(50) NOT NULL
);

CREATE TABLE Kasos
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    ParduotuvėsId INT,
    Numeris VARCHAR(15),
    FOREIGN KEY (ParduotuvėsId) REFERENCES Parduotuvės(Id)
);

CREATE TABLE Kasininkai (
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Numeris VARCHAR(15),
    ParduotuvėsId INT,
    FOREIGN KEY (ParduotuvėsId) REFERENCES Parduotuvės(Id)
);

CREATE TABLE KasininkųDarboGrafikai 
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    KasosId INT,
    KasininkoId INT,
    LaikasNuo DATETIME,
    LaikasIki DATETIME,
    FOREIGN KEY (KasosId) REFERENCES Kasos(Id),
    FOREIGN KEY (KasininkoId) REFERENCES Kasininkai(Id)
);

CREATE TABLE Prekės 
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    Pavadinimas VARCHAR(100),
    Kaina DECIMAL(4,2),
    MatavimoVienetai tinyint
);

CREATE TABLE Kvitai
(
	Id INT PRIMARY KEY AUTO_INCREMENT,
    KasosId INT,
    Serija CHAR(4),
    Numeris CHAR(6),
    MokėtinaSuma DECIMAL(4,2),
    SumokėtaSuma DECIMAL(4,2),
    Grąža DECIMAL(4,2),
    SpausdinimoData DATETIME,
    FOREIGN KEY (KasosId) REFERENCES Kasos(Id)
);

CREATE TABLE KvitoPrekės
(
	Id BIGINT PRIMARY KEY AUTO_INCREMENT,
    KvitoId INT,
    PrekėsId INT,
    Kiekis DECIMAL(4,3),
	FOREIGN KEY (KvitoId) REFERENCES Kvitai(Id),
    FOREIGN KEY (PrekėsId) REFERENCES Prekės(Id)
);
