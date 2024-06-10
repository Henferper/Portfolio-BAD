-- PREPARAÇÃO

DROP TABLE products;

DROP TABLE clients CASCADE; -- CASCADE POR CAUSA DAS FORAICH KEY

CREATE TABLE clients (
	idclient SERIAL PRIMARY KEY,
	cpf varchar(14),
	firstname text,
	lastname text,
	address text
);

CREATE TABLE products (
	idproduct SERIAL PRIMARY KEY,
	idclient int,
	CONSTRAINT fk_client FOREIGN KEY (idclient) REFERENCES clients (idclient),
	productname varchar(50),
	brand varchar(20),
	category varchar(20),
	discount numeric,
	price numeric
);

INSERT INTO clients (cpf,firstname,lastname,address) VALUES
('000.000.000-00','Rodrigo','Junior','Rua 00, 000, Bairro 0'),
('111.111.111-11','Joao','Silva','Rua 01, 100, Bairro 1'),
('222.222.222-22','Maria','Gomez','Rua 02, 200, Bairro 2'),
('333.333.333-33','José','Andrade','Rua 03, 300, Bairro 3'),
('444.444.444-44','Bruno','Silveira','Rua 04, 400, Bairro 4'),
('555.555.555-55','Ana','Cabral','Rua 05, 500, Bairro 5'),
('666.666.666-66','Lucia','Silva','Rua 06, 600, Bairro 6'),
('777.777.777-77','Antonio','Mange','Rua 07, 700, Bairro 7'),
('888.888.888-88','Nicolas','Silva','Rua 08, 800, Bairro 8'),
('999.999.999-99','Sandra','Fourlan','Rua 09, 900, Bairro 9');

INSERT INTO products (idclient,productname,brand,category,discount,price) VALUES
(2,'Headset','jbl','eletronicos',0.1,195.89),
(1,'notebook','dell','eletronicos',0.12,3500.00),
(10,'cadeira gammer','dragon','imobiliario',0.0,1630.9),
(2,'mesa para computador','dragon','imobiliario',0.0,695.89),
(1,'mouse','dell','eletronicos',0.12,124.79),
(3,'prateleira',null,'imobiliario',0.0,80.9),
(5,'postit','faber castel','papelaria',0.02,5.29),
(8,'lapiseira','pentel','papelaria',0.02,18.9);

--COMANDO DQL

-- Visualizando a tabela de clientes
SELECT * FROM clients

-- Selecionando colunas específicas
SELECT idclient, firstname, lastname FROM clients -- Apenas mostra os dados, não os altera no banco de dados

SELECT * FROM products

SELECT productname, price, discount , price*discount AS " Desconto em reais" FROM products

-- Desafio: Exibir nome do produto, preço e preço com desconto

SELECT productname, price, (1 - discount)*price AS " Preço com desconto" FROM products

-- Exibe valores sem repetição
SELECT DISTINCT brand FROM products

--Calculadora
--SELECT |/4 -- RAIZ CUBICA
--SELECT ||/27 -- RAIZ QUADRADA

--FUNÇÕES
SELECT random()

-- SELECT com clausula WHERE

-- Operadores de comparação >,<,>=,<=,=,<> ou !=
-- Exibir products com valor acima de 100 reais
SELECT productname, price FROM products 
WHERE price >=100

-- Operadores lógicos: AND, OR e NOT

-- Produtos entre 100 e 800 reais
SELECT productname, price FROM products 
WHERE price>=100 AND price <=800
-- Alternativa
SELECT productname, price FROM products 
WHERE price BETWEEN 100 AND 800

--DESAFIO
-- Produtos 
SELECT productname, price FROM products 
WHERE price<=100 OR price >=800

--DESAFIO
--Listar todos os produtos da marca dell
SELECT productname FROM products 
WHERE brand = 'dell'

--DESAFIO
--Listar todos os produtos que joão comprou
SELECT productname FROM products 
WHERE idclient = '2'
--Alternativa
SELECT productname FROM products 
WHERE idclient = (SELECT idclient FROM clients 
				  WHERE firstname = 'joao')
				  
--DESAFIO
--Listar todos os IDs com número par
SELECT idclient, firstname FROM clients
WHERE idclient%2 = 0

--COUNT
--Quantos produtos foram vendidos no total
SELECT COUNT (idproduct) FROM products

--Função AVG (média)
-- Qual o Preço médio dos produtos vendidos
SELECT AVG (price) FROM products

--Função max (Máximo)
--Função min (Mínimo)
SELECT MAX(price) FROM products
SELECT MIN(price) FROM products

--Função sum (soma)
-- Qual o valor total vendido
SELECT SUM(price) FROM products

--Order BY / DESC
SELECT * FROM client
ORDER BY lastname DESC --DESC apenas para caso de forma decrescente


-- 1. Quantos produtos da marca dell foram vendidos?
-- 2. Quantos produtos João comprou?
-- 3. Qual o preço médio dos produtos da dell?
-- 4. Qual o produto mais caro vendido?
-- 5. Qual o produto mais barato vendido?
-- 6. Qual o valor total de equipamentos dell vendidos?
-- 7. Quanto Rodrigo já gastou no eCommerce?
-- 8. Exiba todos os produtos da catergoria eletronicos ordenados do mais barato para o mais caro.
-- 9. Exiba todos os produtos comprados por Rodrigo ordenados do mais caro para o mais barato.

--1
SELECT COUNT (idclient) FROM products -- 2
WHERE brand = 'dell'

--2
SELECT COUNT (idclient) FROM products
WHERE idclient = (SELECT idclient FROM clients 
				  WHERE firstname = 'joao')

--3
SELECT AVG (price) FROM products 
WHERE brand = 'dell' --1.812,39

--4
SELECT productname, price FROM products -- Notebook - 3.500
WHERE price = (SELECT MAX(price)FROM products)

--5
SELECT productname, price FROM products -- Postit - 5.29
WHERE price = (SELECT MIN(price)FROM products)

--6
SELECT SUM (PRICE) FROM products--3.624
WHERE brand = 'dell'

--7
SELECT SUM (price) FROM products--3.624
WHERE idclient = (SELECT idclient FROM clients WHERE firstname = 'Rodrigo')

--8
SELECT productname,price FROM products
WHERE category = 'eletronicos'
ORDER BY price

--9
SELECT productname,price FROM products
WHERE idclient = (SELECT idclient FROM clients WHERE firstname='Rodrigo')
ORDER BY price DESC

SELECT clients.firstname,products.productname
FROM clients INNER JOIN products USING (idclient)

SELECT clients.firstname,products.productname
FROM clients LEFT JOIN products USING (idclient)

SELECT clients.firstname,products.productname
FROM clients RIGHT JOIN products USING (idclient)


--Exercicios
--1. Quais clientes compraram produtos da categoria eletronicos?
SELECT clients.firstname,clients.lastname,products.productname,products.category
FROM clients INNER JOIN products USING (idclient)
WHERE products.category = 'eletronicos'

--2. Quais clientes não compraram nenhum produto?
SELECT clients.firstname,products.productname
FROM clients LEFT JOIN products USING (idclient)
WHERE products.productname IS NULL

--3. Quais produtos não foram vendidos?
SELECT products.productname
FROM clients RIGHT JOIN products USING (idclient)
WHERE clients.firstname IS NULL

--4. Quais produtos Rodrigo comprou?
SELECT clients.firstname,products.productname
FROM clients INNER JOIN products USING (idclient)
WHERE clients.firstname = 'Rodrigo'

--5. Quais clientes compraram produtos da marca DELL?
SELECT clients.firstname ,products.productname,products.brand
FROM clients INNER JOIN products USING (idclient)
WHERE products.brand ='dell'

