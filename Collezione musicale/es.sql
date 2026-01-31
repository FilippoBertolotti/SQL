-- Active: 1769847123043@@127.0.0.1@3306@spotify
USE SPOTIFY;
-- 1. Individuare i brani realizzati da un particolare artista.
SELECT o.`TITOLO`
FROM BRANO o
JOIN INTERPRETARE i ON o.`ID` = i.`IDBRANO`
JOIN registrazione r ON r.`ID` = i.`IDREGISTRAZIONE`
JOIN artista q ON q.`ID` = r.`IDARTISTA`
WHERE q.`NOME` = :nome AND q.`COGNOME` = :cognome;

-- 2. Contare gli artisti itliani.
SELECT COUNT(*) AS Artisti_Italiani
FROM artista
WHERE `NAZIONALITA` LIKE 'Italiana';

-- 3. Visualizzate il costo totale dei cd di un determinato cantante.
SELECT SUM(r.`COSTO`)
FROM registrazione r
JOIN artista q ON q.`ID` = r.`IDARTISTA`
WHERE q.`NOME` = :nome AND q.`COGNOME` = :cognome;

-- 4. Individuare qual è l’artista di un determinato brano.
SELECT a.NOME, a.COGNOME, b.TITOLO
FROM BRANO b
JOIN INTERPRETARE i ON b.ID = i.IDBRANO
JOIN REGISTRAZIONE r ON r.ID = i.IDREGISTRAZIONE
JOIN ARTISTA a ON a.ID = r.IDARTISTA
WHERE b.TITOLO LIKE :titolo;

-- 5. Individuare quali e quanti sono i brani appartenenti ad un determinato genere.
SELECT r.GENERE, COUNT(*) AS Numero_Brani, GROUP_CONCAT(b.TITOLO SEPARATOR '\n') AS Titoli
FROM REGISTRAZIONE r
JOIN INTERPRETARE i ON r.ID = i.IDREGISTRAZIONE
JOIN BRANO b ON b.`ID` = i.`IDBRANO`
WHERE r.GENERE = :genere
GROUP BY r.`GENERE`;

-- 6. Conoscere l’elenco degli artisti ordinato in modo crescente.
SELECT COGNOME, NOME
FROM ARTISTA
ORDER BY COGNOME ASC, NOME ASC;

-- 7. Visualizzate gli artisti che hanno brani che durano non più di 2 min.
SELECT a.COGNOME, a.NOME
FROM ARTISTA a
JOIN REGISTRAZIONE r ON a.ID = r.IDARTISTA
JOIN INTERPRETARE I ON r.ID = i.IDREGISTRAZIONE
JOIN BRANO b ON b.ID = i.IDBRANO
WHERE b.DURATA <= 2
GROUP BY a.`ID`;

-- 8. Visualizzate tutti gli artisti il cui nome inizia con la lettera R
SELECT NOME, COGNOME
FROM ARTISTA
WHERE `COGNOME` LIKE "R%";

-- 9. Visualizzate la media dei costi di tutte le registrazioni di un determinato artista
SELECT ROUND(AVG(r.COSTO),2) AS Costo_Medio
FROM REGISTRAZIONE r
JOIN ARTISTA a ON a.ID = r.IDARTISTA
WHERE a.NOME = :nome AND a.COGNOME = :cognome;

-- 10. Visualizzate tutte le durate dei brani in ordine decrescente. Ciascuna durata deve essere
-- visualizzata una sola volta.
SELECT DISTINCT DURATA
FROM BRANO
ORDER BY DURATA DESC;

-- 11. Conoscere i cognomi degli artisti con meno di 2 registrzioni 
SELECT a.COGNOME, COUNT(*) AS Numero_Registrazioni
FROM ARTISTA a
JOIN REGISTRAZIONE r ON a.ID = r.IDARTISTA
GROUP BY a.ID
HAVING COUNT(*) < 2;