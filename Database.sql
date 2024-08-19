CREATE TABLE clienti (
    numero_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    anno_di_nascita INT,
    regione_residenza VARCHAR(50)
);

CREATE TABLE prodotti (
    id_prodotto SERIAL PRIMARY KEY,
    descrizione VARCHAR(255),
    in_produzione BOOLEAN,
    in_commercio BOOLEAN,
    data_attivazione DATE,
    data_disattivazione DATE
);

CREATE TABLE fornitori (
    numero_fornitore SERIAL PRIMARY KEY,
    denominazione VARCHAR(255),
    regione_residenza VARCHAR(50)
);

CREATE TABLE fatture (
    numero_fattura SERIAL PRIMARY KEY,
    tipologia CHAR(1),
    importo DECIMAL(10, 2),
    iva DECIMAL(5, 2),
    id_cliente INT REFERENCES clienti(numero_cliente),
    data_fattura DATE,
    numero_fornitore INT REFERENCES fornitori(numero_fornitore)
);
DROP TABLE IF EXISTS clienti CASCADE;

CREATE TABLE clienti (
    numero_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    anno_di_nascita INT,
    regione_residenza VARCHAR(50)
);

CREATE TABLE prodotti (
    id_prodotto SERIAL PRIMARY KEY,
    descrizione VARCHAR(255),
    in_produzione BOOLEAN,
    in_commercio BOOLEAN,
    data_attivazione DATE,
    data_disattivazione DATE
);

CREATE TABLE fornitori (
    numero_fornitore SERIAL PRIMARY KEY,
    denominazione VARCHAR(255),
    regione_residenza VARCHAR(50)
);

CREATE TABLE fatture (
    numero_fattura SERIAL PRIMARY KEY,
    tipologia CHAR(1),
    importo DECIMAL(10, 2),
    iva DECIMAL(5, 2),
    id_cliente INT REFERENCES clienti(numero_cliente),
    data_fattura DATE,
    numero_fornitore INT REFERENCES fornitori(numero_fornitore)
);

DROP TABLE IF EXISTS clienti CASCADE;
DROP TABLE IF EXISTS prodotti CASCADE;
DROP TABLE IF EXISTS fornitori CASCADE;
DROP TABLE IF EXISTS fatture CASCADE;

CREATE TABLE clienti (
    numero_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(50),
    cognome VARCHAR(50),
    anno_di_nascita INT,
    regione_residenza VARCHAR(50)
);

CREATE TABLE prodotti (
    id_prodotto SERIAL PRIMARY KEY,
    descrizione VARCHAR(255),
    in_produzione BOOLEAN,
    in_commercio BOOLEAN,
    data_attivazione DATE,
    data_disattivazione DATE
);

CREATE TABLE fornitori (
    numero_fornitore SERIAL PRIMARY KEY,
    denominazione VARCHAR(255),
    regione_residenza VARCHAR(50)
);

CREATE TABLE fatture (
    numero_fattura SERIAL PRIMARY KEY,
    tipologia CHAR(1),
    importo DECIMAL(10, 2),
    iva DECIMAL(5, 2),
    id_cliente INT REFERENCES clienti(numero_cliente),
    data_fattura DATE,
    numero_fornitore INT REFERENCES fornitori(numero_fornitore)
);

INSERT INTO clienti (nome, cognome, anno_di_nascita, regione_residenza)
VALUES ('Mario', 'Rossi', 1982, 'Lombardia');
INSERT INTO clienti (nome, cognome, anno_di_nascita, regione_residenza)
VALUES ('Fabio', 'Russo', 1992, 'Lazio');
INSERT INTO clienti (nome, cognome, anno_di_nascita, regione_residenza)
VALUES ('Marco', 'Esposito', 1992, 'Liguria');

INSERT INTO fornitori (denominazione, regione_residenza)
VALUES ('Fornitore A', 'Lombardia'),
       ('Fornitore B', 'Lazio'),
       ('Fornitore C', 'Sicilia');

INSERT INTO prodotti (descrizione, in_produzione, in_commercio, data_attivazione, data_disattivazione)
VALUES 
    ('Prodotto A', TRUE, TRUE, '2016-05-10', NULL),
    ('Prodotto B', TRUE, FALSE, '2017-03-15', '2020-01-01'),
    ('Prodotto C', FALSE, TRUE, '2018-07-20', NULL),
    ('Prodotto D', TRUE, TRUE, '2017-10-05', '2019-12-31'),
    ('Prodotto E', FALSE, FALSE, '2017-01-25', '2018-04-15'),
    ('Prodotto F', TRUE, TRUE, '2017-11-13', NULL),
    ('Prodotto G', TRUE, FALSE, '2015-02-25', '2016-09-30'),
    ('Prodotto H', FALSE, TRUE, '2017-06-30', NULL),
    ('Prodotto I', TRUE, TRUE, '2017-12-22', NULL),
    ('Prodotto J', TRUE, FALSE, '2019-04-10', '2021-08-20');



INSERT INTO fatture (tipologia, importo, iva, id_cliente, data_fattura, numero_fornitore)
VALUES 
    ('A', 1200.00, 20.00, 1, '2023-01-15', 1),
    ('B', 950.00, 22.00, 2, '2023-02-20', 2),
    ('C', 500.00, 10.00, 3, '2023-03-05', 3),
    ('A', 2200.00, 20.00, 1, '2022-11-11', 2),
    ('B', 300.00, 20.00, 2, '2021-07-22', 1),
    ('C', 4000.00, 10.00, 3, '2020-06-15', 3),
    ('A', 1800.00, 20.00, 1, '2019-09-29', 3),
    ('B', 250.00, 20.00, 2, '2023-04-18', 2),
    ('C', 1500.00, 15.00, 3, '2022-12-20', 1),
    ('A', 750.00, 20.00, 1, '2023-05-30', 1);

SELECT * FROM clienti WHERE anno_di_nascita = 1992;
SELECT nome, cognome FROM clienti WHERE anno_di_nascita = 1992;
SELECT COUNT(*) FROM fatture WHERE iva = 20;

SELECT f.*, c.* 
FROM fatture f 
JOIN clienti c ON f.id_cliente = c.numero_cliente
WHERE f.importo < 1000;

SELECT * FROM prodotti 
WHERE EXTRACT(YEAR FROM data_attivazione) = 2017 
AND (in_produzione = TRUE OR in_commercio = TRUE);

SELECT f.numero_fattura, f.importo, f.iva, f.data_fattura, forn.denominazione
FROM fatture f
JOIN fornitori forn ON f.numero_fornitore = forn.numero_fornitore;

SELECT EXTRACT(YEAR FROM data_fattura) AS anno, COUNT(*) AS numero_fatture
FROM fatture
WHERE iva = 20
GROUP BY EXTRACT(YEAR FROM data_fattura);

SELECT EXTRACT(YEAR FROM data_fattura) AS anno, COUNT(*) AS numero_fatture, SUM(importo) AS totale_importi
FROM fatture
GROUP BY EXTRACT(YEAR FROM data_fattura);







