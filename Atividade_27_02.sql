CREATE DATABASE bd_questao;
USE bd_questao;

CREATE TABLE Banca(
id_banca INT PRIMARY KEY AUTO_INCREMENT,
nome_ban VARCHAR(40) NOT NULL,
sigla_ban VARCHAR (10)
);

CREATE TABLE Professor(
id_professor INT PRIMARY KEY AUTO_INCREMENT,
nome_prof VARCHAR(60) NOT NULL,
telefone_prof VARCHAR(20),
email_prof VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE Disciplina(
id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
nome_dis VARCHAR(40) NOT NULL
);

CREATE TABLE Usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usu VARCHAR(60) NOT NULL,
data_cadastro DATE,
email_usu VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE Assunto(
id_assunto INT PRIMARY KEY AUTO_INCREMENT,
texto_asu VARCHAR(300) NOT NULL,
fk_disciplina_id INT,
FOREIGN KEY (fk_disciplina_id)
        REFERENCES Disciplina (id_disciplina)
);

CREATE TABLE Questao(
id_questao INT PRIMARY KEY AUTO_INCREMENT,
enunciado VARCHAR(150) NOT NULL,
modalidade VARCHAR(40) NOT NULL,
nivel VARCHAR(40),
fk_banca_id INT,
fk_assunto_id INT,
FOREIGN KEY (fk_banca_id)
        REFERENCES Banca (id_banca),
FOREIGN KEY (fk_assunto_id)
        REFERENCES Assunto (id_assunto)
);

CREATE TABLE Alternativas(
id_alternativa INT PRIMARY KEY AUTO_INCREMENT,
gabarito_alter VARCHAR(120) NOT NULL,
texto_alter VARCHAR(300) NOT NULL,
fk_questao_id INT NOT NULL,
FOREIGN KEY (fk_questao_id)
        REFERENCES Questao (id_questao)
);

CREATE TABLE Questao_Usuario(
id_questao_usuario INT PRIMARY KEY AUTO_INCREMENT,
fk_questao_id INT NOT NULL,
fk_usuario_id INT NOT NULL,
FOREIGN KEY (fk_questao_id)
        REFERENCES Questao (id_questao),
FOREIGN KEY (fk_usuario_id)
        REFERENCES Usuario (id_usuario)
);

CREATE TABLE Questao_Professor(
id_questao_professor INT PRIMARY KEY AUTO_INCREMENT,
fk_questao_id INT NOT NULL,
fk_professor_id INT NOT NULL,
FOREIGN KEY (fk_questao_id)
        REFERENCES Questao (id_questao),
FOREIGN KEY (fk_professor_id)
        REFERENCES Professor (id_professor)
);

INSERT INTO Usuario(nome_usu, email_usu) VALUES ("Elias", "elias.silva@ifro.edu.br");
INSERT INTO Usuario(nome_usu, email_usu) VALUES ("Vinicius", "pinheiro.v@estudante.ifro.edu.br");
INSERT INTO Usuario(nome_usu, email_usu) VALUES ("Guilherme", "guilherme.assuncao@estudante.ifro.edu.br");
INSERT INTO Usuario(nome_usu, email_usu) VALUES ("Sunamita", "sunamita@estudante.ifro.edu.br");
INSERT INTO Usuario(nome_usu, email_usu) VALUES ("Victor Daniel", "victor.daniel@estudante.ifro.edu.br");

SELECT * FROM Usuario;

INSERT INTO Professor(nome_prof, email_prof) VALUES ("Elias de Abreu", "elias.silva@ifro.edu.br");
INSERT INTO Professor(nome_prof, email_prof) VALUES ("Jefferson A. dos Santos", "jefferson.santos@ifro.edu.br"); 
INSERT INTO Professor(nome_prof, email_prof) VALUES ("Walter Ferreira Siqueira", "walter.ferreira@ifro.edu.br"); 
INSERT INTO Professor(nome_prof, email_prof) VALUES ("Clayton Ferraz Andrade", "clayton.andrade@ifro.edu.br"); 
INSERT INTO Professor(nome_prof, email_prof) VALUES ("Hailton Cesar Alves dos Reis", "hailton.reis@ifro.edu.br");

SELECT * FROM Professor;

INSERT INTO Disciplina(nome_dis) VALUES("Banco de Dados II"), ("Programação Orientada a Objetos"), ("Tópicos Especiais em Tecnologia I");

SELECT * FROM Disciplina;

INSERT INTO Assunto(texto_asu, fk_disciplina_id) VALUES ("Modelo Conceitual", 1), ("Modelo Logico", 1), ("Modelo Fisico", 1), ("Comandos SQL", 1);
INSERT INTO Assunto(texto_asu, fk_disciplina_id) VALUES ("Classes", 2), ("Atributos", 2), ("Métodos", 2), ("Método Construtor", 2);
INSERT INTO Assunto(texto_asu, fk_disciplina_id) VALUES ("Introdução HTML", 3), ("Origem HTML e CSS", 3), ("Vinculando CSS no código HTML", 3), ("Formatação de textos", 3);

SELECT * FROM Assunto;

UPDATE Usuario SET data_cadastro = "2024-03-12" WHERE id_usuario = "1";
UPDATE Usuario SET data_cadastro = "2024-03-12";

ALTER TABLE Usuario ADD aniversario_usu DATE;

INSERT INTO Usuario(nome_usu, data_cadastro, email_usu, aniversario_usu) VALUES 
("Gabriel de Oliveira Silva", "2024-03-12", "gabriel.oliveira.s177@gmail.com", "2004-09-26"),
("Filipe Maciel Lopes", "2024-03-12", "filipemaciellopes01@gmail.com", "2003-09-20"),
("Vinícius de Oliveira Pinheiro", "2024-03-12", "pinheiro.v@estudante.ifro.edu.br", "1994-10-01"),
("Guilherme Maciel de Assunção", "2024-03-12", "guilherme.assuncao@estudante.ifro.edu.br", "2004-10-02"),
("Daniel Cristian Amorim Rocha", "2024-03-12", "danielcristian0706@gmail.com", "2004-06-07"),
("João Pedro Gundim Guimarães", "2024-03-12", "joaopedrogundimg@gmail.com", "2005-03-05"),
("Lucas Freire Sêmeler", "2024-03-12", "lucasemeler@gmail.com", "2003-11-07"),
("Vitor Hugo Sodré Quinelato", "2024-03-12", "vitorhugoquinelato@gmail.com", "2003-09-25"),
("Victor Daniel de Oliveira Cruz", "2024-03-12", "Victor.34241361@gmail.com", "2004-04-19"),
("Alicy Rodrigues da Costa ", "2024-03-12", "alicyrc@hotmail.com", "2004-03-30"),
("Sunamita Santos Nascimento", "2024-03-12", "mymytasu@outlook.com", "2000-11-05"),
("Ana Beatriz Tomaz de Sá", "2024-03-12", "anabeatrizts.12@gmail.com", "2003-12-12"),
("Lucayan Felipe Teixeira da Silva", "2024-03-12", "lucayanfelips@hotmail.com", "2000-02-18"),
("Patrick Macêdo Felicio", "2024-03-12", "patrickmacedofeliceo@gmail.com", "2004-09-30"),
("Théo Teodoro Novais", "2024-03-12", "theotn12@gmail.com", "2005-01-20"),
("Vitor dos Reis Eugenio", "2024-03-12", "vitorreiseugenio@gmail.com", "2003-04-18"),
("Renan da Rocha Santos", "2024-03-12", "renanro919@gmail.com", "2004-04-28"),
("Eloizy Campi Reis", "2024-03-12", "campieloizy80@gmail.com", "2004-09-09"),
("Elizeu Silva de Freitas", "2024-03-12", "elizeubbb@gmail.com", "2004-06-02"),
("João Carlos da Silva Andrade", "2024-03-12", "jeancarlos95279@gmail.com", "2004-11-25");

ALTER TABLE Usuario ADD Sexo CHAR;
ALTER TABLE Usuario Change Sexo sexo CHAR;

UPDATE Usuario SET Sexo = 'M' WHERE id_usuario IN(1, 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 15, 16, 17, 19, 20);
UPDATE Usuario SET Sexo = 'F' WHERE id_usuario IN(10, 11, 12, 18);

SELECT * FROM Usuario WHERE Sexo = 'F';
SELECT * FROM Usuario WHERE nome_usu LIKE 'A%';
SELECT * FROM Usuario WHERE nome_usu LIKE '%S';
SELECT * FROM Usuario WHERE nome_usu LIKE '%Z%';
SELECT * FROM Usuario WHERE id_usuario BETWEEN 5 AND 15;

ALTER TABLE Usuario ADD tipo_usu BOOL;

UPDATE Usuario SET tipo_usu = true WHERE tipo_usu IS NULL;

SELECT * FROM Usuario WHERE tipo_usu IS NOT NULL;