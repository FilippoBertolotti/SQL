/* ============================================
   DATABASE: OPERAZIONI_BANCARIE
   ESERCITAZIONE 3 - SOLO QUERY SQL
   ============================================ */

/* 1. Elenco di tutte le città */
SELECT NomeCitta
FROM CITTA;

/* 2. Elenco conti correnti con saldo > 15000 */
SELECT *
FROM CONTO
WHERE Saldo > 15000;

/* 3. Riepilogo elenco clienti con saldo */
SELECT c.Cognome, c.Nome, co.Saldo
FROM CLIENTE c
JOIN CONTO co ON c.ID = co.IDCliente;

/* 4. Elenco clienti con saldo superiore a 50000 */
SELECT c.Cognome, c.Nome
FROM CLIENTE c
JOIN CONTO co ON c.ID = co.IDCliente
WHERE co.Saldo > 50000;

/* 5. Elenco clienti residenti a Rubiera */
SELECT c.Cognome, c.Nome
FROM CLIENTE c
JOIN CITTA ci ON c.IDCitta = ci.ID
WHERE ci.NomeCitta = 'Rubiera';

/* 6. Città e CAP del cliente Algeri */
SELECT ci.NomeCitta, ci.CAP
FROM CLIENTE c
JOIN CITTA ci ON c.IDCitta = ci.ID
WHERE c.Cognome = 'Algeri';

/* 7. Visualizzare il saldo di un dato cliente
   (inserire cognome e nome) */
SELECT co.Saldo
FROM CLIENTE c
JOIN CONTO co ON c.ID = co.IDCliente
WHERE c.Cognome = 'ROSSI'
  AND c.Nome = 'MARIO';

/* 8. Elenco dei clienti (solo cognome e nome)
   ordinati alfabeticamente per cognome */
SELECT Cognome, Nome
FROM CLIENTE
ORDER BY Cognome, Nome;

/* 9. Elenco dei conti con relativo saldo
   ordinati per saldo dal maggiore al minore */
SELECT *
FROM CONTO
ORDER BY Saldo DESC;

/* 10. Dettaglio operazioni effettuate sul conto
   con codice 1 (data, tipo operazione, importo) */
SELECT DataM, Causale, Importo
FROM MOVIMENTO
WHERE IDConto = 1;

/* 11. Elenco di tutti i prelievi (data e importo)
   sul conto con codice 2 */
SELECT DataM, Importo
FROM MOVIMENTO
WHERE IDConto = 2
  AND Causale = 'Prelievo';

/* 12. Elenco di tutti i versamenti di Buttiglieri
   (data e importo) */
SELECT m.DataM, m.Importo
FROM CLIENTE c
JOIN CONTO co ON c.ID = co.IDCliente
JOIN MOVIMENTO m ON co.ID = m.IDConto
WHERE c.Cognome = 'Buttiglieri'
  AND m.Causale = 'Versamento';

/* 13. Elenco di tutti i movimenti effettuati
   dal 01/10/2019 */
SELECT *
FROM MOVIMENTO
WHERE DataM >= '2019-10-01';

/* 14. Elenco di tutti i versamenti effettuati
   prima del 20/10/2019 */
SELECT *
FROM MOVIMENTO
WHERE Causale = 'Versamento'
  AND DataM < '2019-10-20';

/* 15. Elenco di tutti i prelievi effettuati
   dal 01/10/2019 al 20/10/2019 con importo > 100 */
SELECT *
FROM MOVIMENTO
WHERE Causale = 'Prelievo'
  AND DataM BETWEEN '2019-10-01' AND '2019-10-20'
  AND Importo > 100;

/* 16. Cognome e nome del cliente con operazioni
   nel mese di settembre 2019 */
SELECT DISTINCT c.Cognome, c.Nome
FROM CLIENTE c
JOIN CONTO co ON c.ID = co.IDCliente
JOIN MOVIMENTO m ON co.ID = m.IDConto
WHERE m.DataM BETWEEN '2019-09-01' AND '2019-09-30';

/* 17. Elenco di tutti i clienti il cui cognome
   inizia con la lettera B */
SELECT Cognome, Nome
FROM CLIENTE
WHERE Cognome LIKE 'B%';
