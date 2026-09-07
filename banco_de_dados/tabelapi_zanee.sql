-- ------------

CREATE DATABASE sprintzanee;

use sprintzanee;


CREATE TABLE clientes (
	idClientes INT PRIMARY KEY AUTO_INCREMENT,
    nomeEmpresa VARCHAR(30) NOT NULL,
    cnpj CHAR(18) UNIQUE,
	dataContratacao DATE,
    dataCancelamento DATE,
    emailAcesso VARCHAR(60) UNIQUE, 
    CONSTRAINT chkEmail CHECK (emailAcesso like '%@%'),
    senhaAcesso VARCHAR(15)
);


INSERT INTO clientes VALUES (default, 'Assaí Atacadista', '06.057.223/0001-71', '2025-05-09', '2026-11-08', 'assaiatacadista@gmail.com', '123456789'),
							(default, 'Carrefour', '45.543.915/0001-81', '2025-10-12', '2026-10-03', 'carrefour@gmail.com', '987654321'),
                            (default, 'Pão de Açúcar', '47.508.411/0001-56', '2025-05-03', '2026-07-09', 'paodeacucar@gmail.com', '293859325');
                            
                            
CREATE TABLE sensor (
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    distancia VARCHAR(20),
    tempoAtivado VARCHAR(20),
    quantPessoasPassadas VARCHAR(20)
);

INSERT INTO sensor VALUES (default, '10 m', '2 seg', '1 pessoa'),
						  (default, '5 m', '10 seg', '3 pessoas'),
						  (default, '7 m', '2 min', '4 pessoas');
                          
                          
                          
CREATE TABLE produtos (
	idProduto INT PRIMARY KEY AUTO_INCREMENT,
	nomeProduto VARCHAR(30),
    precoProduto DECIMAL(10,2),
    quantVendida INT,
    quantInvestida DECIMAL(10,2)
);

INSERT INTO produtos VALUES (default, 'Trakinas', 3.99, 15, 200),
							(default, 'Kit Kat', 5.99, 35, 350),
                            (default, 'Cebolitos', 1.99, 13, 150);
                          