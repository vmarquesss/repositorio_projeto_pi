create database varejo;
use varejo;

create table cliente(
	id int primary key auto_increment,
    nomeEmpresa varchar(40) not null,
    cnpj char(18) unique not null,
    email varchar(40) not null,
    telefoneSAC char(11),
    cidade varchar(40),
    uf char(2),
    constraint chkEmailContato check(email like '%@%')
) auto_increment = 1;

INSERT INTO cliente (nomeEmpresa, cnpj, email, telefoneSAC, cidade, uf) VALUES
('Mercado Central do Povo LTDA', '12.345.678/0001-90', 'sac@centraldopovo.com.br', '1133214567', 'São Paulo', 'SP'),
('Supermercado Alvorada Eireli', '98.765.432/0001-10', 'contato@superalvorada.com', '21987654321', 'Rio de Janeiro', 'RJ'),
('Hortifruti Vale Verde', '23.456.789/0002-88', 'sac@valeverdehorti.com.br', '3132248899', 'Belo Horizonte', 'MG'),
('Mercadinho Sol Nascente', '34.567.890/0001-22', 'solnascentesac@gmail.com', '8134457788', 'Recife', 'PE'),
('Hipermercado Nova Era', '45.678.901/0003-55', 'atendimento@novaera.com.br', '6133445566', 'Brasília', 'DF'),
('Mini Preço Supermercados', '56.789.012/0001-44', 'sac@miniprecosuper.com', '4130229900', 'Curitiba', 'PR'),
('Mercado do Bairro S/A', '67.890.123/0001-33', 'ouvidoria@mercadobairro.com', '71991223344', 'Salvador', 'BA'),
('Super Todo Dia', '78.901.234/0001-77', 'contato@supertodia.com.br', '8532521122', 'Fortaleza', 'CE');

select * from cliente;

select concat('O ', nomeEmpresa, ' possui o cnpj ', cnpj, ' ,seu email para contato é: ', email, ' seu telefone é: ', telefoneSAC, ' , ele está localizado na cidade: ', cidade, ' no estado: ', uf) as Frase from cliente order by id desc;

create table sensor (
	id int primary key auto_increment,
    nomeIdentificacao varchar(15) unique,
    dtInstalacao date,
    gondola varchar(40),
    statuss varchar(15),
    constraint chkStatuss check(statuss in('Ativo', 'Inativo'))
) auto_increment = 1;

INSERT INTO sensor (nomeIdentificacao, dtInstalacao, gondola, statuss) VALUES
('SNS-01-ALIM', '2026-01-15', 'Gôndola de Alimentos Enlatados', 'Ativo'),
('SNS-02-BEB',  '2026-02-10', 'Gôndola de Bebidas Alcoólicas', 'Ativo'),
('SNS-03-LIM',  '2026-02-20', 'Corredor de Produtos de Limpeza', 'Inativo'),
('SNS-04-PAD',  '2026-03-01', 'Balcão de Panificação e Doces', 'Ativo'),
('SNS-05-HORT', '2026-03-12', 'Ilha de Hortifrúti Central', 'Ativo'),
('SNS-06-CONG', '2026-04-05', 'Freezer de Congelados e Sorvetes', 'Inativo'),
('SNS-07-HIG',  '2026-04-18', 'Gôndola de Higiene Pessoal', 'Ativo'),
('SNS-08-PET',  '2026-05-02', 'Seção de Produtos para Pets', 'Ativo');

select nomeIdentificacao as código_do_sensor, dtInstalacao as data_de_instalação, gondola as corredor_pertencente from sensor where statuss = 'Ativo';

create table produto (
	id int primary key auto_increment,
    nome varchar(40),
    estoqueQuant int,
    reabastecimentoQuant int,
    precoCusto float,
    precoVenda float,
    categoria varchar(40)
) auto_increment = 1;

INSERT INTO produto (nome, estoqueQuant, reabastecimentoQuant, precoCusto, precoVenda, categoria) VALUES
('Arroz Integral Tipo 1 5kg', 120, 30, 18.50, 24.90, 'Alimentos'),
('Refrigerante de Cola 2L', 250, 50, 4.20, 7.99, 'Bebidas'),
('Sabão em Pó Concentrado 1kg', 85, 20, 9.80, 14.50, 'Limpeza'),
('Pão de Forma Tradicional 400g', 40, 15, 3.10, 5.49, 'Panificação'),
('Azeite de Oliva Extra Virgem 500ml', 60, 10, 22.00, 31.90, 'Alimentos'),
('Hambúrguer Bovino Congelado 12un', 95, 25, 11.40, 17.80, 'Congelados'),
('Shampoo Controle de Oleosidade 400ml', 70, 15, 8.50, 13.99, 'Higiene Pessoal'),
('Ração Premium para Cães Adultos 3kg', 45, 10, 35.00, 49.90, 'Pet Shop');

select * from produto where categoria = 'Alimentos' or categoria = 'Bebidas' or categoria = 'Congelados';