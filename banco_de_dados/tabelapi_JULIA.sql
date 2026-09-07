-- TABELA DE CLIENTES
CREATE DATABASE infoconnect;
USE infoconnect;

CREATE TABLE clientes (
id INT PRIMARY KEY AUTO_INCREMENT,
nomeRepresentanteLegal VARCHAR(50),
nomeFantasia VARCHAR(50),
CNPJ CHAR(14),
dataAdesao DATE,
dataCancelamento DATE,
qtdSensores INT,
telefone VARCHAR(11),
cidade VARCHAR(50),
UF CHAR(2)
);

-- TABELA DO SENSOR
CREATE DATABASE infoconnect;
USE infoconnect;
-- será que tem como "importar" uma chave de outra tabela? pq assim dá pra fazer
-- um campo pra indicar de qual cliente aquele dado é
CREATE TABLE dadosSensor(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT, -- mudar quando aprender a importar id de outra tabela
dataHora DATETIME,
distSensor DECIMAL (10,2)
);

-- TABELA DE CONFIGURACAO DO SENSOR

CREATE TABLE configSensor (
idConfig INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT,
idSensor INT,
localizacao VARCHAR (50),
distanciaMin DECIMAL (10,2),
distanciaMax DECIMAL (10,2),
alarmeAtivo TINYINT,
dataUltimaManutencao DATETIME
);



