CREATE DATABASE PI1;

-- TABELA 1

USE PI1;

CREATE TABLE tabelaPI1(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
nomeEmpresa VARCHAR(60),
CNPJ CHAR(14) UNIQUE,
dtContratacao DATE,
valorContrato DECIMAL(10,2),
qtdPrateleiras INT
);

ALTER TABLE tabelaPI1 MODIFY COLUMN cnpj CHAR(19) UNIQUE;

INSERT INTO tabelaPI1 VALUES 
(default, 'Silvio Santos', 'Carrefour', '18.532.749/0001-90', now(), 5900, 6),
(default, 'Luciano Hang', 'Havan', '42.109.835/0001-26', now(), 5000, 5),
(default, 'Silvio Santos', 'atacadão', '173.914.058/0001-83', now(), 6800, 7);

SELECT * FROM tabelaPI1;

-- TABELA 2

USE P1;

CREATE TABLE sensoresPI1 (
id INT PRIMARY KEY AUTO_INCREMENT,
prateleira VARCHAR(30),
corredor VARCHAR(25),
horario TIMESTAMP default CURRENT_TIMESTAMP,
distancia decimal(7,2)
);

INSERT INTO sensoresPI1 VALUES 
(default, 'prateleira 1', 'corredor 3', default, 89.20),
(default, 'prateleira 2', 'corredor 4', default, 72.20),
(default, 'prateleira 3', 'corredor 1', default, 45.49),
(default, 'prateleira 4', 'corredor 2', default, 56.10),
(default, 'prateleira 5', 'corredor 3', default, 65.70);

SELECT * FROM sensoresPI1;

-- tabela 3

USE P1;

CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
prateleira VARCHAR(30),
pessoas_detectadas INT,
pessoas_interessadas INT,
pessoas_compraram INT,
tempo_medio_permanencia DECIMAL(5,2)
);


INSERT INTO clientes VALUES 
(default, 'prateleira 1', 73, 32, 11, 35.20),
(default, 'prateleira 2', 123, 78, 47, 59.87),
(default, 'prateleira 3', 90, 58, 18, 45.43),
(default, 'prateleira 4', 83, 49, 23, 51.44),
(default, 'prateleira 5', 44, 40, 13, 39.30);

SELECT * FROM clientes;