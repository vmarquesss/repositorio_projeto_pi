CREATE DATABASE InfoConnect;
use InfoConnect;

CREATE TABLE cadastro(
id INT PRIMARY KEY AUTO_INCREMENT,
nomeEmpresa VARCHAR (50),
CNPJ CHAR(18) UNIQUE NOT NULL,
representante VARCHAR (50),
email VARCHAR(50) NOT NULL,
numeroContato VARCHAR (20) NOT NULL,
endereco VARCHAR (120),
dataCadastro DATE DEFAULT (CURRENT_DATE),
ativo TINYINT,
manutencaoContratada TINYINT,
tipoContrato VARCHAR (8) CHECK (tipoContrato IN ('Alugado', 'Comprado')),
quantidadeSensores INT,
fimContrato DATE
) AUTO_INCREMENT = 1;

INSERT INTO cadastro (nomeEmpresa, CNPJ, representante, email, numeroContato, endereco, ativo, manutencaoContratada, tipoContrato, quantidadeSensores, fimContrato) VALUES
('Empresa1', '12.345.678/0001-01', 'Representante1', 'exemplo1@email.com', '(DDD)1-2345-6789', 'Avenida do Exemplo, nº 1234 – Bairro Exemplar, Cidade Exemplo/SP – CEP 12345-678', 1, 1, 'Alugado', 5, '2027-12-31'),
('Empresa2', '23.456.789/0001-02', 'Representante2', 'exemplo2@email.com', '(DDD)2-3456-7890', 'Rua Exemplo Primeiro, nº 56 – Vila do Exemplo, Porto Exemplo/RJ – CEP 23456-789', 1, 0, 'Comprado', 10, '2028-06-30'),
('Empresa3', '34.567.890/0001-03', 'Representante3', 'exemplo3@email.com', '(DDD)3-4567-8901', 'Alameda dos Exemplos, nº 890, Bloco B, Apto 12 – Jardim Exemplo, Belo Exemplo/MG – CEP 34567-890', 0, 1, 'Alugado', 15, '2027-09-15'),
('Empresa4', '45.678.901/0001-04', 'Representante4', 'exemplo4@email.com', '(DDD)4-5678-9012', 'Praça do Exemplo Novo, nº 4321 – Distrito Industrial Exemplo, Curitiba Exemplo/PR – CEP 45678-901', 1, 1, 'Comprado', 20, '2029-01-01'),
('Empresa5', '56.789.012/0001-05', 'Representante5', 'exemplo5@email.com', '(DDD)5-6789-0123', 'Rodovia Exemplo Principal, Km 12 – Zona Rural Exemplar, Salvador Exemplo/BA – CEP 56789-012', 0, 0, 'Alugado', 25, '2026-12-31');

SELECT * FROM cadastro;


CREATE TABLE sensor (
id INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR (15) DEFAULT 'HC-SR04',
clienteId INT,
statuss VARCHAR(15) NOT NULL CHECK (statuss IN ('Ativo', 'Inativo'))
) AUTO_INCREMENT = 2000;

INSERT INTO sensor (tipo, clienteId, statuss) VALUES 
('HC-SR04', 1, 'Ativo'),
('HC-SR04', 2, 'Ativo'),
('HC-SR04', 3, 'Inativo'),
('HC-SR04', 4, 'Ativo'),
('HC-SR04', 5, 'Inativo');

SELECT * FROM sensor;


CREATE TABLE leitura (
    id INT PRIMARY KEY AUTO_INCREMENT,
    sensorId INT,
    distancia FLOAT NOT NULL,
    permanencia TIME,
    passagem INT,
    dataHora DATETIME DEFAULT (CURRENT_TIMESTAMP)
);

INSERT INTO leitura (sensorId, distancia, permanencia, passagem) VALUES 
(2000, 2.5, '00:05:30', 12),
(2001, 150.0, '01:15:00', 45),
(2002, 45.2, '00:00:15', 3),
(2003, 399.8, '00:45:10', 89),
(2004, 12.3, '00:02:45', 23);

SELECT * FROM leitura;