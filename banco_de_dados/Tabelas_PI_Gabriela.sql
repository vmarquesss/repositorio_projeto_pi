CREATE DATABASE monitoramento_varejo;
USE monitoramento_varejo;

CREATE TABLE DadosDoSensor (
    idDeleitura INT AUTO_INCREMENT PRIMARY KEY,
    datas DATE NOT NULL,
    hora DATETIME NOT NULL DEFAULT NOW(),
    temperatura DECIMAL(5,2),
    umidade DECIMAL(5,2),
    idDoSensor INT NOT NULL
);
INSERT INTO DadosDoSensor VALUES
(default, '2026-09-01', default, 24.50, 65.20, 24),
(default,'2026-08-02', default, 25.30, 63.80, 232),
(default,'2026-12-03', default, 23.90, 68.40, 54),
(default,'2026-10-04', default, 26.10, 61.50, 234),
(default,'2026-08-05', default, 22.80, 70.10, 257);



CREATE TABLE clientes (
    NumeroDeRegistro INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(150) NOT NULL UNIQUE,
    senhaAcesso VARCHAR(255) NOT NULL,
    quantidadeDeSensores INT DEFAULT 0);

     INSERT INTO clientes VALUES
(Default, 'Supermercado Boa Compra', '111.111.111-11', 'contato@boacompra.com', 'senha123', 5),
(Default,'Mercado Central', '222.222.222-22', 'contato@mercadocentral.com', 'senha456', 3),
(Default,'Supermercado Avenida', '333.333.333-33', 'contato@avenida.com', 'senha789', 8),
(Default,'Mercado São Paulo', '444.444.444-44', 'contato@mercadosp.com', 'senha321', 4),
(Default,'Supermercado Econômico', '555.555.555-55', 'contato@economico.com', 'senha654', 10);
    
    CREATE TABLE TabelaInteresse (
    idDoInteresse INT AUTO_INCREMENT PRIMARY KEY,
    idDoSensor INT NOT NULL,
    tempoNoSensorS INT NOT NULL,
    dia DATE NOT NULL,
    hora DATETIME NOT NULL DEFAULT NOW());
    
   INSERT INTO TabelaInteresse VALUES
(1, 201, 35, '2026-09-01', DEFAULT),
(2, 54, 52, '2026-09-02', DEFAULT),
(3, 84, 18, '2026-09-03', DEFAULT),
(4, 88, 74, '2026-09-04', DEFAULT),
(5, 12, 41, '2026-09-05', DEFAULT);

SELECT * FROM DadosDoSensor;
SELECT * FROM Clientes;
SELECT * FROM TabelaInteresse;
