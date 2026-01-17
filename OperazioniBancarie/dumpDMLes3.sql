-- Popolare la tabella CITTA
INSERT INTO CITTA (ID, NomeCitta, Cap) VALUES 
(1, 'Reggio Emilia', '42121'),
(2, 'Rubiera', '42048'),
(3, 'Scandiano', '42019'),
(4, 'Correggio', '42015'),
(5, 'Guastalla', '42016'),
(6, 'Castelnovo nei Monti', '42035'),
(7, 'Novellara', '42017');

-- Popolare la tabella CLIENTE
INSERT INTO CLIENTE (ID, Cognome, Nome, Sesso, IDCitta) VALUES 
(1, 'Algeri', 'Anna', 'F', 1),
(2, 'Buttiglieri', 'Mario', 'M', 2),
(3, 'Bianchi', 'Luca', 'M', 3),
(4, 'Verdi', 'Giulia', 'F', 4),
(5, 'Neri', 'Marco', 'M', 5),
(6, 'Gialli', 'Sara', 'F', 6),
(7, 'Blu', 'Paolo', 'M', 7);

-- Popolare la tabella CONTO
INSERT INTO CONTO (ID, Saldo, IDCliente) VALUES 
(1, 1000.00, 1),
(2, 1500.00, 2),
(3, 2000.00, 3),
(4, 2500.00, 4),
(5, 3000.00, 5),
(6, 3500.00, 6),
(7, 4000.00, 7);

-- Popolare la tabella MOVIMENTO
INSERT INTO MOVIMENTO (ID, Datam, Causale, Importo, IDConto) VALUES 
(1, '2019-08-20', 'P', 500.00, 1),
(2, '2019-08-15', 'V', 200.00, 1),
(3, '2019-08-16', 'P', 300.00, 2),
(4, '2019-08-31', 'V', 110.00, 2),
(5, '2019-10-14', 'P', 400.00, 3),
(6, '2019-09-11', 'V', 150.00, 3),
(7, '2019-12-12', 'P', 250.00, 4);