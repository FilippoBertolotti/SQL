-- Active: 1768205845864@@127.0.0.1@3306@spotify
USE SPOTIFY;
-- 1. Individuare i brani realizzati da un particolare artista.
SELECT o.`TITOLO`
FROM BRANO o
JOIN INTERPRETARE i ON o.`ID` = i.`IDBRANO`
JOIN registrazione r ON r.`ID` = i.`IDREGISTRAZIONE`
JOIN artista q ON q.`ID` = r.`IDARTISTA`
WHERE q.`NOME` = :nome AND q.`COGNOME` = :cognome;
-- 2. Contare gli artisti italiani.
SELECT COUNT(*) AS Artisti_Italiani
FROM artista
WHERE `NAZIONALITA` LIKE 'Italiana';
-- 3. Visualizzate il costo totale dei cd di un determinato cantante.
SELECT SUM(r.`COSTO`)
FROM registrazione r
JOIN artista q ON q.`ID` = r.`IDARTISTA`
WHERE q.`NOME` = :nome AND q.`COGNOME` = :cognome;
-- 4. Individuare qual è l’artista di un determinato brano.
-- 5. Individuare quali e quanti sono i brani appartenenti ad un determinato genere.
-- 6. Conoscere l’elenco degli artisti ordinato in modo crescente.
-- 7. Visualizzate gli artisti che hanno brani che durano non più di 2 min.
-- 8. Visualizzate tutti gli artisti il cui nome inizia con la lettera R
-- 9. Visualizzate la media dei costi di tutte le registrazioni di un determinato artista
-- 10. Visualizzate tutte le durate dei brani in ordine decrescente. Ciascuna durata deve essere
-- visualizzata una sola volta.