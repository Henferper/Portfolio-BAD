CREATE TABLE Medico(
	idMedico SERIAL PRIMARY KEY,
	Nome VARCHAR (100),
	Espec VARCHAR (100)
)
CREATE TABLE paciente(
	idPaciente SERIAL PRIMARY KEY,
	Nome VARCHAR (100),
	DataNasc DATE
)
CREATE TABLE Consulta(
	idConsulta SERIAL PRIMARY KEY,
	idPaciente INT,
	idMedico INT,
	CONSTRAINT FK_Medico FOREIGN KEY (idMedico) REFERENCES Medico (idMedico),
	CONSTRAINT FK_paciente FOREIGN KEY (idPaciente) REFERENCES paciente (idPaciente)
)
ALTER TABLE Consulta ADD COLUMN idMedico INT
ALTER TABLE Consulta ADD COLUMN paciente INT
ALTER TABLE Consulta ADD COLUMN DataCons INT

INSERT INTO Medico (Nome,Espec) VALUES
('Pedro Silva','Cardiologia'),
('Ana Santos','Dermatologia'),
('Ricardo Mendes','Ortopedia'),
('Mariana Costa','Pediatria'),
('André Ferreira','Neurologia'),
('Camila Oliveira','Ginecologia'),
('Bruno Almeida','Urologia'),
('Fernanda Carvalho','Oftalmologia'),
('Carlos Rodrigues','Endocrinologia'),
('Juliana Martins','Psiquiatria')

INSERT INTO paciente (Nome,DataNasc) VALUES
('Maria Silva','1990-05-15'),
('João Santos','1985-10-28'),
('Ana Oliveira','1988-03-07'),
('Pedro Costa','1976-01-11'),
('Sofia Pereira','2001-08-20'),
('Lucas Almeida','1998-02-14'),
('Isabela Rodrigues','1983-11-03'),
('Mateus Oliveira','1995-06-25'),
('Giovanna Martins','1979-04-09'),
('Guilherme Ferreira','1992-09-30')

INSERT INTO Consulta VALUES
()