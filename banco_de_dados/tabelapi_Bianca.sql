CREATE DATABASE projeto;

-- TABELA 01 - 
CREATE TABLE cliente (
id INT PRIMARY KEY AUTO_INCREMENT,
razaoSocial VARCHAR(100) NOT NULL,
nomeFantasia VARCHAR(50) NOT NULL,
CNPJ CHAR(18) NOT NULL,
dtAdesao DATE NOT NULL,
dtCancelamento DATE,
cidade VARCHAR(30) NOT NULL,
UF CHAR(2) NOT NULL
);

INSERT INTO cliente (razaoSocial, nomeFantasia, CNPJ, dtAdesao, cidade, UF) VALUES
('Supermercados Exemplo LTDA', 'Supermercado Exemplo', '12.345.678/0001-90', '2026-01-15', 'Rio de Janeiro', 'RJ'),
('Mercado Boa Compra LTDA', 'Boa Compra', '23.456.789/0001-81', '2026-02-03', 'São Paulo', 'SP'),
('Rede Mais Econômica LTDA', 'Mais Econômica', '34.567.890/0001-72', '2026-02-20', 'Belo Horizonte', 'MG'),
('Alimentos Brasil S.A.', 'Alimentos Brasil', '45.678.901/0001-63', '2026-03-10', 'Curitiba', 'PR'),
('Supermercado Central LTDA', 'Central Market', '56.789.012/0001-54', '2026-04-05', 'Salvador', 'BA'),
('Grupo Varejo Inteligente S.A.', 'Varejo Inteligente', '67.890.123/0001-45', '2026-05-18', 'Brasília', 'DF');

SELECT * FROM cliente;

-- TABELA 02 -- 
CREATE TABLE sensor(
id INT PRIMARY KEY AUTO_INCREMENT,
clienteID INT NOT NULL,
localizacaoSensor VARCHAR(50) NOT NULL,
dtInstalacao DATE NOT NULL,
statuss VARCHAR(10) NOT NULL
CONSTRAINT chkStt CHECK(statuss IN('Ativo', 'Inativo', 'Manutenção'))
);

INSERT INTO sensor (clienteID, localizacaoSensor, dtInstalacao, statuss) VALUES
(1, 'Entrada principal', '2026-08-10', 'Ativo'),
(2, 'Corredor de bebidas', '2026-08-12', 'Ativo'),
(3, 'Setor de hortifruti', '2026-08-15', 'Manutenção'),
(4, 'Área de estoque', '2026-08-18', 'Ativo'),
(5, 'Seção de congelados', '2026-08-20', 'Inativo'),
(6, 'Caixa principal', '2026-08-22', 'Ativo');

SELECT * FROM sensor;

-- TABELA 03 --
CREATE TABLE monitoramento(
id INT PRIMARY KEY AUTO_INCREMENT,
sensorID INT,
dataHora DATETIME,
aproximacao TINYINT,
permanencia INT
);

INSERT INTO monitoramento (sensorID, dataHora, aproximacao, permanencia) VALUES
(1, '2026-08-25 08:15:00', 1, 45),
(1, '2026-08-25 09:30:00', 1, 0),
(3, '2026-08-25 10:45:00', 1, 120),
(4, '2026-08-25 12:10:00', 1, 75),
(5, '2026-08-25 14:25:00', 0, 0),
(6, '2026-08-25 16:40:00', 1, 180);

SELECT CASE
	WHEN aproximacao = 0
    THEN 'Sim'
    ELSE 'Não'
    END as 'Aproximação'
    FROM monitoramento;