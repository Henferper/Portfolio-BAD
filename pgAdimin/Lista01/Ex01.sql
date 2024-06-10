CREATE TABLE Livro (
	ISBN SERIAL PRIMARY KEY,
	Titulo VARCHAR (50),
	Editora VARCHAR (50),
	Ano_Pub VARCHAR (4)
)

ALTER TABLE Livro ALTER COLUMN Editora TYPE VARCHAR (50)

CREATE TABLE Autor (
	Id_Autor SERIAL PRIMARY KEY,
	Nome VARCHAR (30),
	Cidade VARCHAR (20)
)

CREATE TABLE Livro_Autor(
	ISBN INT,
	CONSTRAINT FK_Livro FOREIGN KEY (ISBN) REFERENCES Livro (ISBN),
	Id_Autor INT,
	CONSTRAINT FK_Autor FOREIGN KEY (Id_Autor) REFERENCES Autor (Id_Autor)
)

INSERT INTO Livro (ISBN,Titulo,Editora,Ano_Pub) VALUES
('978057','The Da Vinci Code','Doubleday','2003'),
('978006','To Kill a Mockingbird','HarperPerennial','1960'),
('978073','Harry Potter and the Deathly Hallows','Listening Library','2007'),
('978043','Harry Potter and the Sorcerer s Stone','Arthur A. Levine Books','1997'),
('978140','The Kite Runner','Riverhead Books','2003'),
('978067','1984','Signet Classic','1949'),
('978038','The Catcher in the Rye,Little', 'Brown and Company','1951'),
('978069','The Bell Jar','Harper Perennial Modern Classics','1963'),
('978145','Gone Girl','Crown Publishing Group','2012'),
('978055','Lord of the Flies','Perigee Trade','1954')

INSERT INTO Autor (Nome,Cidade) VALUES
('John Green','Indianapolis'),
('J.K. Rowling','Yate'),
('Khaled Hosseini','Kabul'),
('George Orwell','Motihari'),
('J.D. Salinger','Nova Iorque'),
('Sylvia Plath','Boston'),
('Gillian Flynn','Kansas City'),
('William Golding','St. Columb Minor')

SELECT * FROM Livro
SELECT * FROM Autor
SELECT * FROM Livro_Autor

INSERT INTO Livro_Autor VALUES
(978006,1),(978057,1),(978073,2),(978043,2),(978140,3),(978067,4),(978038,5),(978069,6),(978145,7),(978055,8)

--Exercicio A
SELECT Livro.Titulo,Autor.Nome
FROM (Livro NATURAL INNER JOIN Livro_Autor)
INNER JOIN Autor USING (id_Autor)

--Exercicio B
SELECT Autor.Nome,Livro.Titulo
FROM (Autor NATURAL INNER JOIN Livro_Autor)
INNER JOIN Livro USING (ISBN)
WHERE Livro_Autor.id_Autor = '5'
--Exercicio C