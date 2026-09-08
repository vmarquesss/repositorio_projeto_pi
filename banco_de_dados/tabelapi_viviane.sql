CREATE DATABASE info_connect;
USE info_connect;

CREATE TABLE cliente(
idCliente			INT PRIMARY KEY AUTO_INCREMENT,
cnpj				CHAR(14) UNIQUE,
nomeFantasia		VARCHAR(50),
nomeResponsavel		VARCHAR(20),
telefone			CHAR(11)
);

INSERT INTO cliente VALUES
(default, '12.345.678/9098-76', 'XPTO Congelados', 'Irineu Irinoso', '11999999999'),
(default, '09.876.543/2123-45', 'ABC Salgadinhos', 'Luiz Gonzaga', '11988888888');

CREATE TABLE sensor(
idSensor		INT PRIMARY KEY AUTO_INCREMENT,
corredorSensor	INT,
fluxo			INT -- pessoas por dia
);

INSERT INTO sensor VALUES
(default, 1, 123),
(default, 3, 111);

CREATE TABLE produto(
idProduto		INT PRIMARY KEY AUTO_INCREMENT,
nomeProduto		VARCHAR(20),
marcaProduto	VARCHAR(20),
qtdEstoque		INT,
qtdVendido		INT
);

INSERT INTO produto VALUES
(default, 'Bolacha', 'XPTO', 4000, 2500),
(default, 'Salgadinho', 'ABC', 4000, 1500);

SELECT * FROM cliente;
SELECT * FROM sensor;
SELECT * FROM produto;

SELECT 
	CONCAT('Empresa: ', nomeFantasia, ' | Responsável: ', nomeResponsavel, ' | Contato: ', telefone) AS 'Dados do Cliente'
FROM cliente;

SELECT
	CONCAT('Corredor: ', corredorSensor, ' | Fluxo de pessoas por dia: ', fluxo) AS 'Dados do Sensor'
FROM sensor;

SELECT 
	CONCAT('Produto: ', nomeProduto, ' | Marca: ', marcaProduto, ' | Quantidade em estoque: ', qtdEstoque, 
    ' | Quantidade vendida: ', qtdVendido, ' | Quantidade Atual: ', (qtdEstoque - qtdVendido)) AS 'Dados do Produto'
FROM produto;

-- SET SQL_UPDATES_SAFEMODE = 1;
