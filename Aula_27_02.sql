CREATE DATABASE bd_escola;
USE bd_escola;

CREATE TABLE Aluno (
    id_alu INT PRIMARY KEY AUTO_INCREMENT,
    nome_alu VARCHAR(80) NOT NULL,
    email_alu VARCHAR(50) NOT NULL,
    telefone_alu VARCHAR(80),
    dataNascimento_alu DATE NOT NULL,
    ativo_alu BOOLEAN DEFAULT TRUE
);

ALTER TABLE Aluno ADD cpf_alu VARCHAR(15) NOT NULL UNIQUE AFTER id_alu;

CREATE TABLE Departamento (
    id_departamento INT PRIMARY KEY AUTO_INCREMENT,
    nome_dep VARCHAR(50)
);

CREATE TABLE Funcionario (
    id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    nome_fun VARCHAR(50),
    id_departamento_fk INT,
    FOREIGN KEY (id_departamento_fk)
        REFERENCES Departamento (id_departamento)
);