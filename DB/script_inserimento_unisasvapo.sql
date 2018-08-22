/* INSERIMENTO DATABASE */
/* ADMIN */
INSERT INTO Admin VALUES("1","Admin","Via Benevento","144","82016","Montesarchio","3273557200","admin@unisasvapo.it","admin");
/* CLIENTI */
INSERT INTO Cliente(Nome,Cognome,Città,Via,N°Civico,CAP,CodFiscale,Email,N°Telefono,Password) VALUES ("Sara","Pirozzi","Montesarchio","Via Benevento","144","82016","PRZTTL95D06A783L","sara@test.it","3273557200","attilio");

/* PRODOTTI */
/* BASI */
INSERT INTO Prodotti  VALUES ("B2",2.8,1,3.05,"L","AVORIA - Liquido base VG/PG 1L 12MG nicotina","Basi");
INSERT INTO Prodotti  VALUES ("B3",3.7,1,4.10,"Ml","Ribilio - Liquido base Pure 100ml 18MG nicotina","Basi");
INSERT INTO Prodotti  VALUES ("B4",3.1,1,3.5,"Ml","GIOARK - Liquido base VG/PG 250 ML senza nicotina","Basi");

	/*AROMI*/
INSERT INTO Prodotti  VALUES ("A2",65,1,80,1,"La Tabaccheria - Aroma American Blend 10ml","Aromi");
INSERT INTO Prodotti  VALUES ("A3",47,1,60,1,"Capella Flavors - Aroma Cappuccino V2 13ml","Aromi");

	/*Liquidi*/
INSERT INTO Prodotti  VALUES ("L2",1.3,1,1.80,1,"American Stars - Grass Hopper 12mg nicotina","Liquidi");
INSERT INTO Prodotti  VALUES ("L3",1.5,1,1.90,1,"TNT Vape - HELLOMARY 6mg nicotina","Liquidi");
	/*KIT*/
INSERT INTO Prodotti  VALUES ("K1",27,1,35,1,"eGrip OLED CL Joyetech Box","Kit Completi");

/* MAGAZZINI */
INSERT INTO Magazzino VALUES("IT001","00112233445","Via Terni","123","22565");

/* DISPONIBILITA' NEI MAGAZZINI */
	/* MAGAZZINO IT001 */
INSERT INTO HaDisponibilitaDi VALUES("IT001","B2",50);
INSERT INTO HaDisponibilitaDi VALUES("IT001","B3",50);
INSERT INTO HaDisponibilitaDi VALUES("IT001","B4",50);
INSERT INTO HaDisponibilitaDi VALUES("IT001","A2",100);
INSERT INTO HaDisponibilitaDi VALUES("IT001","A3",100);
INSERT INTO HaDisponibilitaDi VALUES("IT001","L2",70);
INSERT INTO HaDisponibilitaDi VALUES("IT001","L3",100);
INSERT INTO HaDisponibilitaDi VALUES("IT001","K1",20);

/* VENDITE */
INSERT INTO Vendita(Ora, DataVendita, Totale, IdCliente, Sconto) VALUES('10:20', '2016-09-11', 22,"1",0.0);

/* COMPOSIZIONE  DELLE VENDITE */	
INSERT INTO ComposizioneVendita VALUES(1,"B2",2,9);
UPDATE HaDisponibilitaDi SET Quantita=Quantita-2.0 WHERE CodiceMagazzino="IT001" AND CodiceProdotto="B2";
