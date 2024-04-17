CREATE DATABASE gurudev;
USE gurudev;

CREATE TABLE estado (
    id_estado INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome_estado VARCHAR(20) NOT NULL,
    sigla_estado VARCHAR(2) UNIQUE NOT NULL,
    pais_estado VARCHAR(15) NOT NULL
);

CREATE TABLE cidade (
    cidade_id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome_cidade VARCHAR(30) NOT NULL,
    codigo_ibge_cidade INTEGER UNIQUE,
    fk_estado_id INTEGER NOT NULL,
    FOREIGN KEY (fk_estado_id)
        REFERENCES estado (id_estado)
);

CREATE TABLE marca (
    id_marca INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    nome_marca VARCHAR(30),
    observacoes_marca VARCHAR(300),
    origem_marca VARCHAR(60)
);

CREATE TABLE modelo (
    id_modelo INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    descricao_modelo VARCHAR(300),
    numeros_eixo_modelo INTEGER,
    peso_modelo DOUBLE,
    bancos_modelo INTEGER,
    cavalaria_modelo INTEGER,
    cilindrada_modelo INTEGER,
    fk_marca_id INTEGER,
    FOREIGN KEY (fk_marca_id)
        REFERENCES marca (id_marca)
);

CREATE TABLE veiculo (
    id_veiculo INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    niv_veiculo VARCHAR(30) NOT NULL,
    placa_veiculo VARCHAR(7) NOT NULL,
    renavam_veiculo INTEGER NOT NULL,
    situacao_veiculo BOOLEAN,
    motor_veiculo VARCHAR(30) NOT NULL,
    fk_modelo_id INTEGER,
    fk_cidade_id INTEGER,
    FOREIGN KEY (fk_modelo_id)
        REFERENCES modelo (id_modelo),
    FOREIGN KEY (fk_cidade_id)
        REFERENCES cidade (id_cidade)
);

CREATE TABLE proprietario (
    id_proprietario INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    email_proprietario VARCHAR(70),
    telefone_proprietario VARCHAR(14),
    endereco_proprietario VARCHAR(60),
    fk_veiculo_id INTEGER,
    FOREIGN KEY (fk_veiculo_id)
        REFERENCES veiculo (id_veiculo)
);

CREATE TABLE pessoa_fisica (
    cpf_pf VARCHAR(11) PRIMARY KEY UNIQUE,
    rg_pf VARCHAR(20) UNIQUE,
    nome_pf VARCHAR(30),
    data_nascimento_pf DATE,
    sexo_pf CHAR,
    fk_proprietario_id INTEGER,
    FOREIGN KEY (fk_proprietario_id)
        REFERENCES proprietario (id_proprietario)
);

CREATE TABLE pessoa_juridica (
    cnpj_pj VARCHAR(14) PRIMARY KEY UNIQUE,
    razao_social_pj VARCHAR(40),
    nome_fantasia_pj VARCHAR(20),
    situacao_pj BOOLEAN,
    atividade_pj VARCHAR(40),
    fk_proprietario_id INTEGER,
    FOREIGN KEY (fk_proprietario_id)
        REFERENCES proprietario (id_proprietario)
);

CREATE TABLE cnh (
    id_cnh INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    data_emissao_cnh DATE NOT NULL,
    data_vencimento_cnh DATE NOT NULL,
    categoria_cnh VARCHAR(5) NOT NULL,
    pontuacao_cnh INTEGER NOT NULL,
    numero_cnh INTEGER UNIQUE NOT NULL,
    fk_pessoa_fisica_id VARCHAR(15) NOT NULL,
    FOREIGN KEY (fk_pessoa_fisica_id)
        REFERENCES pessoa_fisica (cpf_pf)
);

CREATE TABLE multas (
    id_multa INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    descricao_multa VARCHAR(300),
    tipo_multa VARCHAR(15) NOT NULL,
    valor_multa DOUBLE NOT NULL,
    penalidade_multa INTEGER NOT NULL,
    fator_multa INTEGER NOT NULL
);

CREATE TABLE infracoes (
    id_infracao INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    data_infracao DATE NOT NULL,
    hora_infracao TIME NOT NULL,
    longitude_infracao VARCHAR(15) NOT NULL,
    latitude_infracao VARCHAR(15) NOT NULL,
    fk_veiculo_id INTEGER,
    fk_multa_id INTEGER,
    fk_proprietario_id INTEGER,
    FOREIGN KEY (fk_veiculo_id)
        REFERENCES veiculo (id_veiculo),
    FOREIGN KEY (fk_multa_id)
        REFERENCES multas (id_multa),
    FOREIGN KEY (fk_proprietario_id)
        REFERENCES proprietario (id_proprietario)
);

INSERT INTO estado VALUES 
(1, 'Acre', 'AC', 'Brasil'),
(2, 'Alagoas', 'AL', 'Brasil'),
(3, 'Amapá', 'AP', 'Brasil'),
(4, 'Amazonas', 'AM', 'Brasil'),
(5, 'Bahia', 'BA', 'Brasil'),
(6, 'Ceará', 'CE', 'Brasil'),
(7, 'Distrito Federal', 'DF', 'Brasil'),
(8, 'Espírito Santo', 'ES', 'Brasil'),
(9, 'Goiás', 'GO', 'Brasil'),
(10, 'Maranhão', 'MA', 'Brasil'),
(11, 'Mato Grosso', 'MT', 'Brasil'),
(12, 'Mato Grosso do Sul', 'MS', 'Brasil'),
(13, 'Minas Gerais', 'MG', 'Brasil'),
(14, 'Pará', 'PA', 'Brasil'),
(15, 'Paraíba', 'PB', 'Brasil'),
(16, 'Paraná', 'PR', 'Brasil'),
(17, 'Pernambuco', 'PE', 'Brasil'),
(18, 'Piauí', 'PI', 'Brasil'),
(19, 'Rio de Janeiro', 'RJ', 'Brasil'),
(20, 'Rio Grande do Norte', 'RN', 'Brasil'),
(21, 'Rio Grande do Sul', 'RS', 'Brasil'),
(22, 'Rondônia', 'RO', 'Brasil'),
(23, 'Roraima', 'RR', 'Brasil'),
(24, 'Santa Catarina', 'SC', 'Brasil'),
(25, 'São Paulo', 'SP', 'Brasil'),
(26, 'Sergipe', 'SE', 'Brasil'),
(27, 'Tocantins', 'TO', 'Brasil');

INSERT INTO veiculo (niv_veiculo, placa_veiculo, motor_veiculo, renavam_veiculo, situacao_veiculo, 
fk_modelo_id, fk_cidade_id) VALUES
('1e68b3Ybn6rAb6153', 'XYZ1234', '1.6 VVT', '12345678901', 'Ativo',  1, 1),
('78t1AW6FbWh9Z7455', 'ABC5678', '2.0 TDI', '23456789012', 'Ativo',  1, 8),
('19t cHAA3A cz GA8316', 'DEF1234', '1.8 TFSI', '34567890123', 'Ativo',  1, 4),
('30T 4sEXkb AW 9k2095', 'GHI5678', '2.5 SFI', '45678901234', 'Ativo',  3, 6),
('8AX 23GEA5 1s j25905', 'JKL1234', '1.4 Turbo', '56789012345', 'Ativo',  1, 10),
('1mN c0248R AD 6p3948', 'MNO5678', '3.0 V6', '67890123456', 'Ativo',  1, 7),
('2Ry vD6z4g 49 ZJ5820', 'PQR1234', '4.0 V8', '78901234567', 'Ativo',  1, 2),
('26A A7NCSA P8 Yc1186', 'STU5678', '2.2 HDi', '89012345678', 'Ativo',  2, 1),
('2UW X6mMWB 9L T56320', 'VWX1234', '3.5 EcoBoost', '90123456789', 'Ativo',  3, 6),
('88V TndK4D nj es0001', 'YZA5678', '2.4 GDI', '01234567890', 'Ativo', 1, 9),
('4HGBH41JXMN109186', 'BCD2345', '1.3 Hybrid', '09876543211', 'Ativo', 2, 3),
('5FNYF4H90FB018187', 'CDE3456', '2.0 BiTurbo', '98765432102', 'Ativo', 3, 1),
('6G1MK5U22BL637188', 'DEF4567', '1.5 Electric', '87654321093', 'Ativo', 1, 5),
('7HKRM4H50CU541189', 'EFG5678', '2.7 V6 TT', '76543210984', 'Ativo', 2, 4),
('8JH4DB16513001990', 'FGH6789', '3.8 V8', '65432109875', 'Ativo', 3, 4),
('9KL8M3H72EC002191', 'GHI7890', '4.0 V12', '54321098766', 'Ativo', 1, 5),
('1M8GDM9AXKP042192', 'HIJ8901', '1.2 TSI', '43210987657', 'Ativo', 2, 3),
('2N6RD7AT5EC011193', 'IJK9012', '2.5 TFSI', '32109876548', 'Ativo', 3, 2),
('3P3E9CCG1NT026194', 'JKL0123', '1.6 GDi', '21098765439', 'Ativo', 1, 4),
('4S4BP61C797132195', 'KLM1234', '3.0 TDI', '10987654320', 'Ativo', 2, 5);