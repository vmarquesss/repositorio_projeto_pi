create database infoConnect;

-- TABELA 1 - CLIENTE

use infoConnect;
create table cliente(

	id int primary key auto_increment,
    nomeEmpresa varchar(40) not null,
    email varchar(40) not null, constraint chkEmail check(email like '%@%'),
    telefeone char(11),
	cnpj char(18) unique,
    cidade varchar(15),
    uf char(2),
    dtInicio datetime  

);


insert into cliente values 
	(default, 'Super Mercado acai','superacai@gmail.com','11934473860','12.345.678/1234-99', 'São Paulo', 'SP', default),
	(default, 'Super Mercado Extra','superextra@gmail.com','11934411110','12.333.678/1234-99', 'Rio de Janeiro', 'RJ', default),
	(default, 'Super Mercado Nagumo','supernagumo@gmail.com','11934499990','19.444.678/1234-99', 'Mairiporã', 'SP', default),
	(default, 'Super Mercado Higas','superhigas@gmail.com','11929643860','13.555.678/1234-99', 'Poá', 'SP', default);

update cliente set  dtInicio  = now()
	where id >= 0;
    
select concat( 'Mercado cliente: ', nomeEmpresa, ' ',
                case
					when email is null then concat ('Telefone: ' , telefeone)
                    else concat ('Email:' , email)
                    end)as 'Informações' from cliente;
                    
select nomeEmpresa as Empresa , telefeone as Numero_Contato, uf as Estado from cliente;    
select * from cliente;

-- TABELA 2 - SENSORES

create table sensores (

	idSensor int primary key auto_increment , 
    mercado varchar(15) not null,
    lugarSensor varchar(30) not null,
    dataHora datetime default current_timestamp,  
    valor float,
    statuss varchar(15), constraint chkstatus check(statuss  in ('Ativo', 'Inativo'))
); 

insert into sensores values 
	(default, 'Extra', 'Seção de limpeza', default, 444, 'Ativo' ),
	(default, 'Extra', 'Seção de frios', default, 0, 'Inativo' ),
	(default, 'Extra', 'Seção de perfumaria', default, 0, 'Inativo' ),
	(default, 'Extra', 'Seção de bebidas', default, 200, 'Ativo' );
        
select mercado as Mercado, lugarSensor as 'Local', valor as Valor,  concat(
	case 
		when valor > 200 then concat (statuss, ': Movimentação boa')
        when valor > 0 then concat(statuss, ': Da pra melhorar')
        else  'Sensor  inativo ou em manutenção'
        end ) as 'Status', 
	date_format (dataHora , '%d/%m/%y %h:%i') as 'Entrada: ' from sensores; 

select * from sensores;


-- TABELA 3 - 

create table relatorio(
	
    idRelatorio int primary key auto_increment,
    nomeMercado varchar(20),
    valorSensor float,
    lugar varchar(20),
    dataeHora datetime default current_timestamp

);

insert into relatorio values
	(default, 'Nagumo', 20, 'Seção de frios', default),
	(default, 'Nagumo', 10, 'Seção de frutas', default),
	(default, 'Extra', 50, 'Seção de bebidas', default);


select concat('Mercado: ',nomeMercado,' ', 'No dia/horario: ' , date_format(dataeHora , '%d/%m/%y %h:%i'),
		case 
			when valorSensor > 200 then concat(' Aréa bem movimentada e com alta demanda, no setor de: ', lugar, 'Com fluxo de: ', valorSensor,'%')
			else concat(' Aréa pouco movimentada e com baixa demanda, no setor de: ',lugar,  'Com fluxo de: ', valorSensor, '%' ) 
			end  
	) as 'Relatorio:' from relatorio;
    