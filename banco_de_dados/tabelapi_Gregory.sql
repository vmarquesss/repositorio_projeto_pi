create database tabelasPI;
use tabelasPI;

create table clientes (
id INT primary key auto_increment,
nome varchar(40),
cnpj char(18) unique,
empresa varchar(20),
dtContrato DATE,
qtdPratileiras INT,
valorFinal DECIMAL(10,2)
);


insert into clientes values
	(default, 'Janderson da Silva', '45.892.114/0001-30', 'Açai', '2025-11-25', 5, 5000),
	(default, 'Thomas Pedroso', '12.358.964/0001-15', 'Carrefour', '2026-06-12', 8, 7700),
	(default, 'Mario Cezar', '88.241.703/0002-50', 'Atacadão', '2025-03-28', 10, 9000),
	(default, 'Pedro Rocha', '23.109.253/0001-20', 'Trimais', '2026-08-05', 10, 9000),
	(default, 'Claudio Frizzarini', '30.584.912/0001-44', 'Andorinha', '2026-08-29', 3, 3200);
    
create table sensores (
id INT primary key auto_increment,
locall varchar(30),
distanciaCM DECIMAL(5,2),
dataHora TIMESTAMP default current_timestamp
);
    
insert into sensores values
	(default, 'Prateleira 1', 60.50, default),
	(default, 'Prateleira 6', 30.32, default),
	(default, 'Prateleira 2', 20.22, default),
	(default, 'Prateleira 1', 50.00, default),
	(default, 'Prateleira 5', 15.20, default);
    
create table instalacao (
id int primary key auto_increment,
cliente varchar(50),
empresa varchar(20),
qtdSensores int,
statuss varchar(10)
constraint chkStatus check (statuss in('Ativo', 'Inativo', 'Manutenção')),
dtInstalacao date
);

select * from instalacao;

insert into instalacao values
	(default, 'Janderson da Silva', 'Açai', 5, 'Ativo', '2025-11-30'),
	(default, 'Thomas Pedroso', 'Carrefour', 8, 'Inativo', '2026-06-16'),
	(default, 'Mario Cezar', 'Atacadão', 10, 'Manutenção', '2025-04-01'),
	(default, 'Pedro Rocha', 'Trimais', 10, 'Ativo', '2026-08-09'),
	(default, 'Claudio Frizzarini', 'Andorinha', 3, 'Ativo', '2026-09-03');
    
