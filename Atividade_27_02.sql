CREATE DATABASE bd_questao;
use bd_questao;

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

CREATE TABLE Banca(
id_banca INT PRIMARY KEY AUTO_INCREMENT,
nome_ban VARCHAR(40) NOT NULL,
sigla_ban VARCHAR (10)
);

CREATE TABLE Assunto(
id_assunto INT PRIMARY KEY AUTO_INCREMENT,
texto_asu VARCHAR(300) NOT NULL,
fk_disciplina_id INT,
FOREIGN KEY (fk_disciplina_id)
        REFERENCES Disciplina (id_disciplina)
);

CREATE TABLE Disciplina(
id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
nome_dis VARCHAR(40) NOT NULL
);

CREATE TABLE Alternativas(
id_alternativa INT PRIMARY KEY AUTO_INCREMENT,
gabarito_alter VARCHAR(120) NOT NULL,
texto_alter VARCHAR(300) NOT NULL,
fk_questao_id INT NOT NULL,
FOREIGN KEY (fk_questao_id)
        REFERENCES Questao (id_questao)
);

CREATE TABLE Professor(
id_professor INT PRIMARY KEY AUTO_INCREMENT,
nome_prof VARCHAR(60) NOT NULL,
telefone_prof VARCHAR(20),
email_prof VARCHAR(40) UNIQUE NOT NULL
);

CREATE TABLE Usuario(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome_usu VARCHAR(60) NOT NULL,
data_cadastro DATE,
email_usu VARCHAR(40) UNIQUE NOT NULL
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