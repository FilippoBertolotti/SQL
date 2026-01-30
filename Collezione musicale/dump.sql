
INSERT INTO ARTISTA(ID, NOME, COGNOME, NOTE_BIOGRAFICHE, NAZIONALITA)
VALUES
(1, 'Luciano', 'Ligabue', NULL , 'italiana'),
(2, 'Vasco', 'Rossi',NULL , 'italiana'),
(3, NULL ,'u2',NULL , 'irlandese'),
(4,NULL ,'queen', NULL, 'inglese'),
(5,NULL ,'beatles', NULL, 'inglese'),
(6, NULL,'pinkfloyd', NULL,'inglese');


INSERT INTO BRANO(ID, TITOLO, DURATA)
VALUES
(1, 'urlando contro il cielo', 1),
(2, 'sarà un bel souvenir', 1),
(3, 'leggero', 1),
(4, 'siamo solo noi', 1),
(5, 'incredibile romantica', 1),
(6, 'non lhai mica capito', 1),
(7, 'asilo republic', 1),
(8, 'e...', 1),
(9, 'un senso', 1),
(10, 'bohemian rapsody', 1),
(11, 'a kind of magic', 1),
(12, 'who wants to live forever', 1),
(13, 'i still havent found...', 1),
(14, 'with or without you', 1),
(15, 'one', 3),
(16, 'let it be', 3),
(17, 'mother', 3);


INSERT INTO REGISTRAZIONE(ID, TITOLO, FORMATO, GENERE, NOTE, COSTO, IDARTISTA)
VALUES
(1, 'lambrusco coltelli rose rosse&popcorn', NULL, 'rock', NULL, 10.00, 1),
(2, 'buon compleanno elvis',NULL,  'rock',NULL, 10.00, 1),
(3, 'siamo solo noi', NULL, 'rock', NULL,10.00,  2),
(4, 'colpa dalfredo', NULL, 'rock', NULL, 10.00, 2),
(5, 'buoni o cattivi', NULL, 'rock', NULL, 100.00, 2),
(6, 'a night at the opera',NULL,  'rock',NULL,  10.00, 4),
(7, 'a kind of magic',NULL,  'rock', NULL,  10.00, 4),
(8, 'the joshua tree', NULL, 'rock',NULL,  10.00, 3),
(9, 'achtung baby', NULL,  'rock', NULL, 10.00, 3),
(10, 'let it be', NULL, 'british invasion',NULL,  10.00,  5),
(11, 'the wan', NULL, 'british invasion', NULL, 10.00,  6);


INSERT INTO INTERPRETARE(ID, IDBRANO, IDREGISTRAZIONE)
VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 2),
(4, 4, 3),
(5, 5, 3),
(6, 6, 4),
(7, 7, 5),
(8, 8, 5),
(9, 9, 5),
(10, 10, 6),
(11, 11, 7),
(12, 12, 7),
(13, 13, 8),
(14, 14, 8),
(15, 15, 9),
(16, 16, 10),
(17, 17, 11);