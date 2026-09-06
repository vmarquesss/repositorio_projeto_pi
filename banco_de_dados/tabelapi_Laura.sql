-- Tabelo Projeto de PI

CREATE DATABASE projetoPI;
USE projetoPI;

CREATE TABLE sensor (
idSensor INT PRIMARY KEY AUTO_INCREMENT,
dtInstalacaov DATE,
prateleiraSensor INT,
statuss VARCHAR(20)
CONSTRAINT chkSta CHECK(statuss IN('Operante', 'Inoperante', 'Em manutenção'))

);

INSERT INTO sensor VALUES
(default, '2026-02-28', 3, 'Operante'),
(default, '2026-06-23', 10, 'Operante'),
(default, '2026-05-24', 1, 'Em manutenção'),
(default, '2026-02-25', 5, 'Inoperante'),
(default, '2026-01-30', 2, 'Operante'),
(default, '2026-03-09', 8, 'Inoperante'),
(default, '2026-01-30', 4, 'Em manutenção'),
(default, '2026-06-20', 7, 'Operante'),
(default, '2026-08-19', 6, 'Em manutenção'),
(default, '2026-04-16', 9, 'Operante');

SELECT * FROM sensor;

SELECT * FROM sensor
	ORDER BY prateleiraSensor ASC;
    
SELECT * FROM sensor
	WHERE statuss like 'O%';
    
SELECT * FROM sensor
	WHERE statuss LIKE 'I%';
    
SELECT * FROM sensor
	WHERE statuss LIKE 'E%';
    
SELECT * FROM sensor
	WHERE dtInstalacaov <= '2026-04-23';
    
SELECT * FROM sensor
	WHERE dtInstalacaov > '2026-04-23';
    

CREATE TABLE cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
CNPJ CHAR(18) NOT NULL,
NomeFantasia VARCHAR(50),
IE VARCHAR(20), -- Incrição Estadual
Endereço VARCHAR(100),
Contato CHAR(13) -- 0800-XXX-XXXX

);

INSERT INTO cliente VALUES
(default, '47.508.411/0001-56', 'Pão de Açúcar', '10.536.002-3', 'Av. T-63, 110 - Setor Bueno, Goiânia - GO', '0800 779 6761'),
(default, '45.543.915/0001-81', 'Carrefour', '206.115.342.115', 'Av. Morvan Dias de Figueiredo, 6169 - São Paulo - SP', '0800 718 2222'),
(default, '06.057.223/0001-71', 'Assaí Atacadista', '148.650.047.115', 'Av. Aricanduva, 5555 - Jardim Marília, São Paulo - SP', '0800 773 2322'),
(default, '75.315.333/0001-09', 'Atacadão', '64.111.216', 'Av. Eduardo Fróes da Mota, S/N - Salvador - BA', '0800 722 8472'),
(default, '76.430.438/0124-20', 'Muffato', '905.69830-44', 'Av. Madre Leônia Milito, 1400 - Londrina - PR','0800 200 8110'),
(default, '33.130.543/0001-82', 'Supermercados Guanabara', '77.940.852', '	Av. Monsenhor Félix, 1213 - Irajá, Rio de Janeiro - RJ','0800 724 8020'),
(default, '93.015.006/0001-13', 'Zaffari', '096/0593373', 'Av. Plínio Brasil Milano, 1000 - Porto Alegre - RS','0800 600 3311'),
(default, '10.194.833/0001-94', 'Giga Atacado', '144.921.230.119', 'Av. Otaviano Alves de Lima, 2758 - Limão, São Paulo - SP','0800 720 1111');

SELECT * FROM cliente;

SELECT * FROM cliente
	ORDER BY NomeFantasia ASC;
    
SELECT * FROM cliente 
	WHERE CNPJ = '45.543.915/0001-81';
    
SELECT
    CONCAT('Empresa:  ', NomeFantasia, ' -  CNPJ: ', CNPJ, '  -  Contato: ', Contato) AS 'Dados da Empresa'
FROM cliente;

SELECT
	CONCAT('Empresa:  ', NomeFantasia, '  -  IE: ', IE, '  -  Endereço: ', Endereço) AS 'Dados da Empresa'
FROM cliente;

drop table FluxoReposicao;
CREATE TABLE FluxoReposicao (
idRep INT PRIMARY KEY AUTO_INCREMENT,
idCorredor INT,
dtReposição DATETIME DEFAULT CURRENT_TIMESTAMP,
motivoReposicao VARCHAR(20)
CONSTRAINT chkMotivo CHECK(motivoReposicao IN('Estoque baixo', 'Promoção', 'Avaria')),
qtdVenda INT, 
MaiorFluxo VARCHAR(20)
CONSTRAINT chkFluxo CHECK(MaiorFluxo IN('Manhâ', 'Tarde', 'Noite'))

);

INSERT INTO FluxoReposicao (idCorredor, motivoReposicao, qtdVenda, MaiorFluxo) VALUES
(2, 'Estoque baixo', 100, 'Manhã'),
(5, 'Promoção', 23, 'Noite'),
(3, 'Avaria', 120, 'Tarde'),
(1, 'Estoque baixo', 64, 'Manhã'),
(4, 'Estoque baixo', 10, 'Manhã'),
(6, 'Avaria', 87, 'Tarde');

SELECT * FROM FluxoReposicao;

SELECT CASE
	WHEN qtdVenda >= 100 THEN CONCAT('O corredor ', idCorredor, ' teve um ótimo fluxo para reposição neste hórario')
    WHEN qtdVenda <= 15 THEN CONCAT('O corredor ', idCorredor, ' precisa passar por uma avaliação para melhoria de PDV')
	ELSE CONCAT('O corredor ', idCorredor, ' está no fluxo médio')
    END AS FluxoDeReposição
    FROM FluxoReposicao
    ORDER BY idCorredor ASC;
    
SELECT date_format(dtReposição, '%d/%m/%Y %h:%i') AS dtReposição,
    CONCAT('O maior fluxo do corredor:  ', idCorredor, ' foi durante a ', MaiorFluxo) AS 'Maior Fluxo'
FROM FluxoReposicao ORDER BY idCorredor ASC;

SELECT * FROM FluxoReposicao
	WHERE MaiorFluxo = 'Manhã';
    
SELECT CONCAT('A data de resposição do corredor ', idCorredor, ' foi dia ', 
		date_format(dtReposição, '%d de %M de %Y às %h:%i')) AS dtReposição 
FROM FluxoReposicao;









