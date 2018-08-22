DROP DATABASE IF EXISTS UnisaSvapo;
CREATE DATABASE UnisaSvapo;
USE UnisaSvapo;

DROP TABLE IF EXISTS Admin;
CREATE TABLE Admin(
	id INT UNSIGNED AUTO_INCREMENT,
	Nome VARCHAR(20),
	Via VARCHAR(20),
	N°Civico VARCHAR(3),
	CAP CHAR(5),
    Città VARCHAR(20),
    N°Telefono VARCHAR(10),
    Email VARCHAR(40),
    Password VARCHAR(40),
PRIMARY KEY(id)
);

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente(
	CodiceCliente INT UNSIGNED AUTO_INCREMENT,
	Nome VARCHAR(20) NOT NULL, 
    Cognome VARCHAR(25),
    Città VARCHAR(20) NOT NULL,
	Via VARCHAR(20) NOT NULL,
	N°Civico CHAR(3) NOT NULL,
	CAP CHAR(5) NOT NULL,
    CodFiscale CHAR(20),
    Email VARCHAR(40),
    N°Telefono CHAR(10),
    Password VARCHAR(40) NOT NULL,
PRIMARY KEY(CodiceCliente)
);

DROP TABLE IF EXISTS Vendita;
CREATE TABLE Vendita(
	CodiceVendita INT UNSIGNED AUTO_INCREMENT,
	Ora TIME NOT NULL,
    DataVendita DATE NOT NULL,
    Totale FLOAT(15,2) UNSIGNED NOT NULL,
    IdCliente INT UNSIGNED NOT NULL,
    Sconto FLOAT(4,2) UNSIGNED DEFAULT 0.0,
    Status ENUM('IN ELABORAZIONE','SPEDITO','CONSEGNATO') NOT NULL DEFAULT "IN ELABORAZIONE",
    PRIMARY KEY (CodiceVendita)
);

DROP TABLE IF EXISTS Prodotti;
CREATE TABLE Prodotti(
	CodiceProdotto  VARCHAR(10) ,
	PrezzoDiAcquisto FLOAT(10,2) UNSIGNED,
	Aliquota ENUM('22.00') NOT NULL,
	PrezzoDiVendita FLOAT(10,2) UNSIGNED NOT NULL,
	UnitaDiMisura ENUM('Pz','Ml','L')  NOT NULL DEFAULT 'Pz',
	Descrizione VARCHAR(100) NOT NULL DEFAULT "Nessuna descrizione",
    Categoria VARCHAR(20) NOT NULL DEFAULT "Senza Categoria",
PRIMARY KEY(CodiceProdotto)
);

DROP TABLE IF EXISTS Magazzino;
CREATE TABLE Magazzino(
	CodiceMagazzino VARCHAR(6),
	PIvaPuntoVendita CHAR(11) NOT NULL,
	Via VARCHAR(20),
	N°Civico CHAR(3),
	CAP CHAR(5),
PRIMARY KEY(CodiceMagazzino)
);

DROP TABLE IF EXISTS HaDisponibilitaDi;
CREATE TABLE HaDisponibilitaDi(
	CodiceMagazzino VARCHAR(6) NOT NULL,
	CodiceProdotto VARCHAR(11) NOT NULL,
	Quantita INT UNSIGNED DEFAULT 0,
PRIMARY KEY(CodiceMagazzino, CodiceProdotto),
FOREIGN KEY (CodiceMagazzino) REFERENCES Magazzino(CodiceMagazzino) ON UPDATE CASCADE,
FOREIGN KEY (CodiceProdotto) REFERENCES Prodotti(CodiceProdotto) ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ComposizioneVendita;
CREATE TABLE ComposizioneVendita(
	CodiceVendita INT UNSIGNED NOT NULL,
    CodiceProdotto VARCHAR(11) NOT NULL,
    Quantita INT UNSIGNED NOT NULL,
    PrezzoEffettivo FLOAT UNSIGNED,
    PRIMARY KEY(CodiceVendita, CodiceProdotto),
    FOREIGN KEY(CodiceVendita) REFERENCES Vendita(CodiceVendita) ON UPDATE CASCADE,
    FOREIGN KEY(CodiceProdotto) REFERENCES Prodotti(CodiceProdotto) ON UPDATE CASCADE
);