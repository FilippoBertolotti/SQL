-- Active: 1770419977198@@127.0.0.1@3306@videoteca
-- Active: 1770419977198@@127.0.0.1@3306@mysql
DROP DATABASE IF EXISTS videoteca;
CREATE DATABASE videoteca;
USE videoteca;

CREATE TABLE Nazione (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Attore (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL,
    id_nazione INT,
    FOREIGN KEY (id_nazione) REFERENCES Nazione(ID)
);

CREATE TABLE Regista (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    cognome VARCHAR(50) NOT NULL
);

CREATE TABLE Genere (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Film (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(100) NOT NULL,
    anno YEAR NOT NULL,
    durata INT NOT NULL,           -- durata in minuti
    costo DECIMAL(10,2),
    id_genere INT,
    id_regista INT,
    FOREIGN KEY (id_genere) REFERENCES Genere(ID),
    FOREIGN KEY (id_regista) REFERENCES Regista(ID)
);

CREATE TABLE Interpreta (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    id_attore INT,
    id_film INT,
    FOREIGN KEY (id_attore) REFERENCES Attore(ID),
    FOREIGN KEY (id_film) REFERENCES Film(ID)
);


INSERT INTO Genere VALUES 
(1, 'azione'), 
(2, 'drammatico'), 
(3, 'avventura');

INSERT INTO Nazione VALUES 
(1, 'stati uniti'), 
(2, 'spagna'), 
(3, 'italia'), 
(4, 'danimarca');

INSERT INTO Regista VALUES 
(1, 'quentin', 'tarantino'), 
(2, 'tim', 'burton'), 
(3, 'rob', 'marshall'),
(4, 'clint', 'eastwood'),
(5, 'cristopher', 'nolan'),
(6, 'paolo', 'sorrentino'),
(7, 'sean', 'penn');

INSERT INTO Attore VALUES 
(1, 'uma', 'thurman', 1),
(2, 'john', 'travolta', 1),
(3, 'brad', 'pitt', 1),
(4, 'johnny', 'depp', 1),
(5, 'penelope', 'cruz', 2),
(6, 'clint', 'eastwood', 1),
(7, 'leonardo', 'di caprio', 1),
(8, 'sean','penn' , 1), 
(9,'yorge','hirsch' , 1);

INSERT INTO Film (ID, Titolo, Anno, Durata, Costo, id_Regista, id_Genere) VALUES 
(2, 'kill bill 1', 2003, 115, 800000.0000, 1, 1),
(3, 'kill bill 2', 2004, 120, 900000.0000, 1 ,1),
(4, 'pulp fiction', 1994, 100, 750000.0000, 1 ,1),
(5, 'bastardi senza gloria', 2009, 160, 800000.0000, 2 ,2),
(6, 'edward mani di forbice', 1990, 100, 500000.0000, 2 ,2),
(7, 'pirati dei caraibi:oltre i confini del mare', 2011, 137, 1000000.0000, 3, 1),
(8, 'million dollar baby', 2004, 120, 80000.0000, 4, 2),
(9, 'inception', 2010, 142, 90000.0000, 5, 1),
(10, 'this must be the place', 2011, 118, 75000.0000, 6, 2),
(11, 'into the wild', 2007, 148, 60000.0000, 7, 3);

INSERT INTO Interpreta (ID, id_film, id_attore) VALUES 
(1, 2, 1), 
(2, 3, 1), 
(3, 4, 2),
(4, 4, 1),
(5, 5 ,3),
(6 ,6 ,4),
(7 ,7 ,4),
(8 ,7 ,5),
(9 ,8 ,6),
(10 ,9 ,7),
(11 ,10 ,8),
(12 ,11 ,9);

--1.
SELECT f.TITOLO
FROM film f
JOIN genere g ON g.ID = f.id_genere
WHERE g.nome LIKE 'azione';

--2. 
SELECT TITOLO,ANNO
FROM film
WHERE ANNO > 2009;

--3. 
SELECT TITOLO,COSTO
FROM film
WHERE costo > 600000;

--4. 
SELECT TITOLO
FROM film
WHERE titolo LIKE "I%";

--5. 
SELECT COGNOME,NOME
FROM attore
ORDER BY COGNOME ASC,NOME ASC;

--6. 
SELECT DISTINCT n.NOME
FROM nazione n
JOIN attore a ON a.id_nazione = n.ID;

--7. 
SELECT a.COGNOME, a.NOME
FROM nazione n
JOIN attore a ON a.id_nazione = n.ID
WHERE n.nome LIKE "spagna";

--8. 
SELECT f.TITOLO
FROM film f
JOIN interpreta i ON i.id_film = f.ID
JOIN attore a ON a.ID = i.id_attore
WHERE a.nome = :nome AND a.cognome = :cognome;

--9. 
SELECT COUNT(*)
FROM film f
JOIN regista r ON r.ID = f.id_regista
WHERE r.nome = :nome AND r.cognome = :cognome;

--10. 
SELECT COUNT(*)
FROM film;

--11. 
SELECT a.nome, a.cognome, AVG(f.durata)
FROM attore a
join interpreta i ON i.id_attore = a.ID
JOIN film f ON f.ID = i.id_film
GROUP BY a.ID;

--12. 
SELECT f.titolo
from film f
JOIN genere g ON G.ID = f.id_genere
WHERE f.anno = :anno AND g.nome = :nome1;

--13. 
SELECT r.nome, r.cognome, GROUP_CONCAT(DISTINCT CONCAT(a.nome, ' ', a.cognome) SEPARATOR "\n")
FROM regista r
JOIN film f ON f.id_regista = r.ID
JOIN interpreta i ON i.id_film = f.ID
JOIN attore a ON a.ID = i.id_attore
GROUP BY r.ID;

--14.
SELECT a.nome, a.cognome, COUNT(DISTINCT i.id_film) AS numero_film
FROM attore a
JOIN interpreta i ON i.id_attore = a.ID
GROUP BY a.ID
ORDER BY numero_film DESC
LIMIT 1;

--15.
SELECT titolo
FROM film
ORDER BY durata DESC;

--16.
SELECT f.titolo, f.anno, f.durata, r.nome as Nome_Regista, r.cognome as Cognome_Regista, g.nome as Genere, GROUP_CONCAT(DISTINCT CONCAT(a.nome, ' ', a.cognome) SEPARATOR "\n") AS Attori
FROM film f
JOIN regista r ON f.id_regista = r.ID
JOIN interpreta i ON i.id_film = f.ID
JOIN attore a ON a.ID = i.id_attore
JOIN genere g ON g.ID = f.id_genere
GROUP BY f.ID
ORDER BY f.anno DESC;

--17.
SELECT titolo
FROM film
WHERE titolo LIKE "%Kill%";

--18. 
SELECT f.titolo, f.anno, f.durata, f.costo, CONCAT(r.nome, ' ', r.cognome) as Regista
FROM film f
JOIN regista r ON f.id_regista = r.`ID`
WHERE f.titolo LIKE :titolo18

--19.
SELECT a.nome, a.cognome
FROM attore a
JOIN interpreta i ON i.id_attore = a.ID
JOIN film f ON f.ID = i.id_film
WHERE f.titolo LIKE :titolo19
GROUP BY a.ID;

--20.
SELECT titolo, anno, durata
FROM film
ORDER BY anno DESC;

--21. 
SELECT titolo, anno
from film
ORDER BY anno DESC
LIMIT 1; 

--22. 
SELECT DISTINCT CONCAT(a.nome, ' ', a.cognome) as Attore
FROM attore a
JOIN interpreta i ON i.id_attore = a.ID;

--23. 
SELECT COUNT(a.ID)
FROM film f
JOIN interpreta i ON i.id_film = f.ID
JOIN attore a ON a.ID = i.id_attore
WHERE f.titolo LIKE :titolo23;

--24. 
SELECT CONCAT(r.nome, ' ', r.cognome) as Regista, f.titolo, f.anno
FROM regista r
JOIN film f ON f.id_regista = r.ID
ORDER BY r.nome ASC, r.cognome ASC, f.anno DESC; 

--25.
SELECT titolo, anno, YEAR(DATE_SUB(NOW(), INTERVAL anno YEAR)) AS anni_trascorsi
FROM film;

--26. 
SELECT CONCAT(a.nome, ' ', a.cognome) as Attore, COUNT(i.ID) AS Numero_Film
FROM attore a
JOIN interpreta i ON i.id_attore = a.ID
WHERE a.nome = :nome26 AND a.cognome = :cognome26;