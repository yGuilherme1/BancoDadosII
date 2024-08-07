CREATE DATABASE bd_mercado;
USE bd_mercado;

CREATE TABLE funcionario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    CPF VARCHAR(15)
);

CREATE TABLE servicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    valor DOUBLE,
    descricao VARCHAR(200),
    tempo TIME
);

CREATE TABLE cliente (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL,
    CPF VARCHAR(15),
    email VARCHAR(30),
    telefone VARCHAR(20),
    data_nascimento DATE
);

CREATE TABLE dispositivo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    aliquota DOUBLE,
    descricao VARCHAR(200),
    dis_status BOOL
);

CREATE TABLE caixa (
    id INT PRIMARY KEY AUTO_INCREMENT,
    saldo_inicial DOUBLE,
    total_entradas DOUBLE,
    total_saidas DOUBLE,
    cai_status BOOL,
    fk_funcionario_id INT NOT NULL,
    FOREIGN KEY (fk_funcionario_id)
        REFERENCES funcionario (id)
);

CREATE TABLE despesas (
    id INT PRIMARY KEY AUTO_INCREMENT,
    valor DOUBLE,
    data_vencimento DATE,
    data_pagamento DATE,
    des_status BOOL,
    fk_caixa_id INT NOT NULL,
    FOREIGN KEY (fk_caixa_id)
        REFERENCES caixa (id)
);

CREATE TABLE venda (
    id INT PRIMARY KEY AUTO_INCREMENT,
    ven_data DATE,
    hora TIME,
    valor_total DOUBLE,
    desconto DOUBLE,
    valor_final DOUBLE,
    tipo ENUM('a vista', 'a prazo'),
    fk_cliente_id INT,
    FOREIGN KEY (fk_cliente_id)
        REFERENCES cliente (id)
);

CREATE TABLE venda_servicos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    quantidade INT,
    valor_unitario DOUBLE,
    fk_venda_id INT,
    FOREIGN KEY (fk_venda_id)
        REFERENCES venda (id),
    fk_servicos_id INT NOT NULL,
    FOREIGN KEY (fk_servicos_id)
        REFERENCES servicos (id)
);

CREATE TABLE recebimento (
    id INT PRIMARY KEY AUTO_INCREMENT,
    valor DOUBLE,
    data_vencimento DATE,
    data_pagamento DATE,
    Rec_status BOOL,
    fk_caixa_id INT NOT NULL,
    FOREIGN KEY (fk_caixa_id)
        REFERENCES caixa (id),
    fk_venda_id INT,
    FOREIGN KEY (fk_venda_id)
        REFERENCES venda (id)
);

CREATE TABLE encargo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    valor DOUBLE,
    descricao VARCHAR(200),
    fk_dispositivo_id INT NOT NULL,
    FOREIGN KEY (fk_dispositivo_id)
        REFERENCES dispositivo (id),
    fk_recebimento_id INT NOT NULL,
    FOREIGN KEY (fk_recebimento_id)
        REFERENCES recebimento (id)
        ON DELETE CASCADE
);

-- inserção de dados nas tabelas

INSERT INTO funcionario (nome, cpf) VALUES ("João", "11111111111"), ("Maria", "22222222222");
INSERT INTO caixa(saldo_inicial, total_entradas, total_saidas, cai_status, fk_funcionario_id) VALUES (1000.00, 500.00, 300.00, true, 1), (800.00, 400.00, 200.00, true, 2);
INSERT INTO cliente(nome, cpf, email, data_nascimento) VALUES ('José', '11122233300', 'jose1950dias@gmail.com', '1950-08-20'), ('Joana', '33322211100', 'Joana1980silva@gmail.com', '1980-04-09)');
INSERT INTO servicos(valor, descricao, tempo) VALUES (300.00, 'Manicure, Pedicure, Cabelo', '6:00');
INSERT INTO servicos(valor, descricao, tempo) VALUES (30.00, 'Corte de cabelo masculino', '0:30:00');
INSERT INTO dispositivo(aliquota, descricao, dis_status) VALUES (5.20, 'maquina de cartão stone', true);
INSERT INTO despesas(valor, data_vencimento, data_pagamento, des_status, fk_caixa_id) VALUES (100.00, '2024-09-20', '2024-07-25', true, 1);
INSERT INTO venda(ven_data, hora, valor_total, desconto, valor_final, tipo, fk_cliente_id) VALUES ('2024-07-18', '13:40:20', 300.87, 30.87, 270, 'a vista', 1);
INSERT INTO venda(ven_data, hora, valor_total, desconto, valor_final, tipo, fk_cliente_id) VALUES ('2024-07-18', '14:00:00', 30.00, null, 30.00, 'a vista', null);
INSERT INTO venda_servicos (quantidade, valor_unitario, fk_venda_id, fk_servicos_id) VALUES (1, '300', 1, 1);
INSERT INTO recebimento (valor, data_vencimento, data_pagamento, Rec_status, fk_caixa_id, fk_venda_id) VALUES (270, '2024-07-18', '2024-07-10', true, 1, 1);
INSERT INTO encargo (valor, descricao, fk_dispositivo_id, fk_recebimento_id) VALUES (13.1, "aliquota maquina stone", 1, 1);

-- verificação dos inserts

SELECT * FROM funcionario;
SELECT * FROM caixa;
SELECT * FROM cliente;
SELECT * FROM servicos;
SELECT * FROM dispositivo;
SELECT * FROM despesas;
SELECT * FROM venda;
SELECT * FROM recebimento;
SELECT * FROM encargo;

-- correção da tabela caixa

ALTER TABLE caixa ADD saldo_final DOUBLE AFTER saldo_inicial;

-- pegando o valor medio dos serviços

SELECT AVG(valor) FROM servicos;

-- select com where

SELECT * FROM servicos WHERE valor > 100;
SELECT * FROM servicos WHERE valor > 100 OR tempo > '02:30:00'; 
SELECT * FROM servicos WHERE descricao LIKE 'b%';

-- select limitado

SELECT 
    nome, cpf
FROM
    cliente;

-- Testando os Joins

SELECT * FROM venda WHERE fk_cliente_id IS NOT NULL;
SELECT * FROM venda INNER JOIN cliente ON venda.fk_cliente_id = cliente.id WHERE venda.fk_cliente_id IS NOT NULL;
SELECT * FROM venda RIGHT JOIN cliente ON venda.fk_cliente_id = cliente.id;
SELECT * FROM venda LEFT JOIN cliente ON venda.fk_cliente_id = cliente.id;

-- Consultas alinhadas(where com select)

SELECT * FROM servicos WHERE valor = (SELECT MAX(valor) FROM servicos);

SELECT * FROM servicos WHERE valor > (SELECT AVG(valor) FROM servicos);
SELECT * FROM servicos WHERE valor > (SELECT AVG(valor_unitario) FROM venda_servicos);

SELECT * FROM recebimento AS r INNER JOIN caixa AS c ON r.fk_caixa_id = c.id INNER JOIN funcionario AS f ON c.fk_funcionario_id = f.id;