CREATE TABLE Aluno (
	idAluno SERIAL PRIMARY KEY,
	Nome VARCHAR (100),
	DataNasc DATE
)
CREATE TABLE Turma (
	idTurma SERIAL PRIMARY KEY, 
	ProfResp VARCHAR (100)
)
CREATE TABLE Curso (
	idCurso SERIAL PRIMARY KEY,
	Nome VARCHAR (100)
)
//'Problema
CREATE TABLE AlunoTurma (
    idAluno INT,
    CONSTRAINT FK_Aluno FOREIGN KEY (idAluno) REFERENCES Aluno(idAluno),
    idTurma INT,
    CONSTRAINT FK_Turma FOREIGN KEY (idTurma) REFERENCES Turma(idTurma)
)'
SELECT * FROM AlunoTurma

ALTER TABLE Turma ADD COLUMN idCurso int

INSERT INTO Aluno (Nome,DataNasc) VALUES
('Maria Silva','2005-03-10'),
('João Santos','2004-08-22'),
('Ana Oliveira','2006-01-15'),
('Pedro Costa','2003-11-05'),
('Sofia Pereira','2007-06-30'),
('Lucas Almeida','2004-04-18'),
('Isabela Rodrigues','2006-09-25'),
('Mateus Oliveira','2005-02-08'),
('Giovanna Martins','2007-12-12'),
('Guilherme Ferreira','2003-07-03')

INSERT INTO Turma (ProfResp) VALUES
('Carlos Xavier'),
('Mariana Costa'),
('Ricardo Santos'),
('Ana Lima'),
('João Oliveira'),
('Fernanda Pereira'),
('Isabel Martins'),
('Rafael Ferreira'),
('Carolina Almeida'),
('Miguel Silva')

INSERT INTO Curso (Nome) VALUES
('Python Básico'),
('Marketing Online'),
('Gerência de Projetos'),
('Fotografia Digital'),
('Design Gráfico'),
('Finanças Pessoais'),
('Inglês para Negócios'),
('Introdução à IA'),
('Culinária Italiana'),
('Yoga e Meditação')