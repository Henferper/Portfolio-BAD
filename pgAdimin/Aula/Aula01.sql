--COMANDOS DDL (DATA DEFINITION LANGUAGE)
-- Criando a tabela de cliente
CREATE TABLE  client (
	idClient int primary key,
	cpf varchar (14) unique,
	firstName text not null,
	lastName text,
	address text
);

CREATE TABLE product (
	idProduct int primary key,
	productName text,
	brand text,
	category text,
	price decimal
);

-- Fazer alterações na tabela 
-- Renomeando uma coluna BRANCH -> BRAND
ALTER TABLE product RENAME COLUMN branch TO brand

-- Alterando um tipo de dado na coluna 
ALTER TABLE client ALTER COLUMN address TYPE varchar(50)

-- Adicionar coluna
ALTER TABLE product ADD COLUMN aaaa text

-- Apagar tabela
ALTER TABLE product DROP COLUMN aaaa 

-- Adicionando foreign key
ALTER TABLE product ADD COLUMN idClient int

ALTER TABLE product ADD
FOREIGN KEY (inClient) REFERENCES client

-- Adicionando Restrições
ALTER TABLE product ALTER COLUMN productName
SET NOT NULL


--COMANDOS DML (DATA MANIPULATION LANGUAGE)
-- Inserir dados na tabela
INSERT INTO client VALUES(
	2,
	'111.111.111-12',
	'Cain',
	'',
	'Praça Roberto Mange, 30, Sorocaba')
	
--Outra forma de colocar os dados
INSERT INTO client (idClient, cpf, firstName, lastName, address)
VALUES (3,'111.111.111-13','Abel','','')

--Mais Outra forma
INSERT INTO client (idClient, cpf, firstName)
VALUES (4, '111.111.111-14','Jose')

--Atualizando Valores
UPDATE client SET address = 'rua 1'
WHERE idClient = 1

--Tabela produto (Preencher)
INSERT INTO product VALUES (1, 'Camisa', 'Supreme', 'Vestimento', '40.00',1);
INSERT INTO product VALUES (2, 'Copo', '', 'Acessório', 'R$10.00',2);
INSERT INTO product VALUES (3, 'Mochila', '', 'Acessório', 'R$70.00',1);
INSERT INTO product VALUES (4, 'Tênis', 'Nike', 'Calçado', 'R$300.00',3);
INSERT INTO product VALUES (5, 'Calça', '', 'Vestimento', 'R$75.00',1);

--Conceder desconto de 10 reais para todos os produtos acima de 50 reais
UPDATE product SET price=price-10
WHERE price > 50

--Reajustar preço em 5 reais para todos os produtos entre 1 e 80 reais
UPDATE product SET price = price+5
WHERE price > 1 AND price < 80

--COMANDOS DQL (DATA QUERY LANGUAGE)
--Mostrar a tabela
SELECT * FROM client
SELECT * FROM product