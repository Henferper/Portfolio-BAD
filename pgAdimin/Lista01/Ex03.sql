CREATE TABLE Funcionarios (
	id_func SERIAL PRIMARY KEY,
	Nome_func VARCHAR (100),
	data_admissao DATE
)

CREATE TABLE Projetos (
	id_projeto SERIAL PRIMARY KEY,
	nome_projeto VARCHAR (250),
	descricao TEXT 
)

CREATE TABLE funcionarios_projetos (
	id_func INT,
	CONSTRAINT fk_func FOREIGN KEY (id_func) REFERENCES funcionarios (id_func),
	id_projeto INT,
	CONSTRAINT fk_proj FOREIGN KEY (id_projeto) REFERENCES projetos (id_projeto)
)

SELECT * FROM Funcionarios

SELECT * FROM Projetos

SELECT * FROM funcionarios_projetos

INSERT INTO funcionarios_projetos VALUES
(1,2),(1,3),(4,4),(4,5),(5,6),(7,6),(7,8),(8,9),(10,8),(10,1),(3,5),(2,10),(2,8),(6,2)

DROP TABLE funcionarios_projetos

--Exercicio 01
SELECT projetos.nome_projeto,Funcionarios.nome_func
FROM (Projetos NATURAL INNER JOIN funcionarios_projetos)
INNER JOIN Funcionarios USING (id_func)
WHERE funcionarios_projetos.id_projeto = '2'

--Exercicio 02
SELECT Funcionarios.nome_func,projetos.nome_projeto
FROM (Projetos NATURAL INNER JOIN funcionarios_projetos)
INNER JOIN Funcionarios USING (id_func)
WHERE funcionarios_projetos.id_func = '2'

--Exercicio 03
SELECT SUM (funcionarios_projetos.id_func)/(funcionarios_projetos.id_projeto)