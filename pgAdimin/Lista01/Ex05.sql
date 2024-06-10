CREATE TABLE Funcionario (
	idFuncionario SERIAL PRIMARY KEY,
	NomeCargo VARCHAR (50),
	DataAdims DATE 
)

ALTER TABLE Funcionario ADD COLUMN idGerente INT

CREATE TABLE Departamento (
	idDepartamento SERIAL PRIMARY KEY,
	Nome VARCHAR (50)
)

CREATE TABLE Gerente (
	idGerente SERIAL PRIMARY KEY,
	Nome VARCHAR (50)
)

INSERT INTO Funcionario (NomeCargo,DataAdims) VALUES
('Gerente','2015-03-10'),
('Produção','2016-07-22'),
('Produção','2014-11-15'),
('Gerente','2017-05-30'),
('Técnico','2013-08-18'),
('Manutenção','2018-09-25'),
('Técnico','2012-12-08'),
('Supervisor','2019-02-12'),
('Gerente','2011-06-03'),
('Produção','2020-04-17')

INSERT INTO Departamento (Nome) VALUES
('Vendas'),
('Marketing'),
('Recursos Humanos'),
('Finanças'),
('Tecnologia da Informação'),
('Logistica'),
('Produção'),
('Jurídico'),
('Pesquisa e Desenvolvimento'),
('Atendimento ao Cliente')

INSERT INTO Gerente (Nome) VALUES
('Carlos Silva'),
('Ana Oliveira'),
('Pedro Costa'),
('Sofia Pereira'),
('Lucas Almeida'),
('Isabela Rodrigues'),
('Mateus Oliveira'),
('Giovanna Martins'),
('Guilherme Ferreira'),
('Laura Mendes')