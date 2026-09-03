CREATE DATABASE entregaveis;
USE entregaveis;

CREATE TABLE cliente(
idCliente			INT PRIMARY KEY AUTO_INCREMENT,
cnpj				CHAR(14) UNIQUE,
nomeEmpresa			VARCHAR(50),
nomeResponsavel		VARCHAR(20),
endereco			VARCHAR(100)
);

INSERT INTO cliente VALUES
(default, '12.345.678/9098-76', 'XPTO Congelados', 'Irineu Irinoso', 'Rua Alfredo, 68'),
(default, '09.876.543/2123-45', 'ABC Salgadinhos', 'Luiz Gonzaga', 'Rua Presidente, 102');

CREATE TABLE sensor(
idSensor		INT PRIMARY KEY AUTO_INCREMENT,
distancia		FLOAT,
corredorSensor	VARCHAR(10),
fluxoDia		INT
);

INSERT INTO sensor VALUES
(default, 0.75, 'Corredor 3', 229),
(default, 1.2, 'Corredor 5', 123);

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
	CONCAT('Empresa: ', nomeEmpresa, ' | Responsável: ', nomeResponsavel, ' | Endereço: ', endereco) AS Empresa
FROM cliente;

SELECT
	CONCAT('Corredor: ', corredorSensor, ' | Distância Média das Prateleiras: ', (distancia / 24), ' distancia/dia | Fluxo por dia: ', (fluxoDia/24)) AS SENSOR_HCSR04
FROM sensor;

SELECT
	CONCAT('Nome do produto: ', nomeProduto, ' | Marca do produto: ', marcaProduto, 
    ' | Quantidade em estoque: ', qtdEstoque, ' | Quantidade vendida: ', qtdVendido, 
    ' | Diferença no Estoque: ', (qtdEstoque - qtdVendido)) AS Produtos
FROM produto;

-- SET SQL_UPDATES_SAFEMODE = 1;
