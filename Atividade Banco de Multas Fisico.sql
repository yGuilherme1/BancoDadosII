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
    FOREIGN KEY (fk_estado_id) REFERENCES estado(id_estado)
);

CREATE TABLE proprietario (
id_proprietario INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
email_proprietario VARCHAR(70),
telefone_proprietario VARCHAR(14),
    fk_veiculo_id INTEGER,
    FOREIGN KEY (fk_veiculo_id) REFERENCES veiculo(id_veiculo)
);

CREATE TABLE pessoa_fisica (
CPF_pf VARCHAR(11) PRIMARY KEY UNIQUE,
RGP_pf VARCHAR(20) UNIQUE,
nome_pf VARCHAR(30),
sexo_pf CHAR,
fk_proprietario_id INTEGER,
FOREIGN KEY (fk_proprietario_id) REFERENCES proprietario (id_proprietario)
);

CREATE TABLE pessoa_juridica (
cnpj_pj VARCHAR(14) PRIMARY KEY UNIQUE,
razao_social_pj VARCHAR(40),
    jp_commercial_name VARCHAR(20),
    jp_status BOOLEAN,
    jp_business_area VARCHAR(40),
    fk_person_id INTEGER,
    FOREIGN KEY (fk_person_id) REFERENCES person(person_id)
);

CREATE TABLE cnh (
cnh_id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    cnh_issue_date DATE NOT NULL,
cnh_expiration_date DATE NOT NULL,
    cnh_category VARCHAR(2) NOT NULL,
    cnh_points INTEGER NOT NULL,
    cnh_number VARCHAR(9) UNIQUE NOT NULL,
    fk_np_CPF VARCHAR(11) NOT NULL,
    FOREIGN KEY (fk_np_CPF) REFERENCES natural_person(np_CPF)
);


CREATE TABLE brand (
brand_id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    brand_name VARCHAR(50),
    brand_observations VARCHAR(255),
    fk_add_id INTEGER,
    FOREIGN KEY (fk_add_id) REFERENCES address(add_id)
);

CREATE TABLE model (
model_id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    model_description VARCHAR(255),
    model_axles_numbers INTEGER,
model_weight INTEGER,
    model_max_seats INTEGER,
    model_engine_power VARCHAR(20),
    fk_brand_id INTEGER,
    FOREIGN KEY (fk_brand_id) REFERENCES brand(brand_id)
);

CREATE TABLE vehicle (
vehicle_id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    vehicle_chassis VARCHAR(17) NOT NULL,
    vehicle_plate VARCHAR(7) NOT NULL,
    vehicle_renavam VARCHAR(11) NOT NULL,
    vehicle_status BOOLEAN,
    vehicle_engine VARCHAR(50) NOT NULL,
    fk_model_id INTEGER, FOREIGN KEY (fk_model_id) REFERENCES model(model_id),
    fk_person_id INTEGER, FOREIGN KEY (fk_person_id) REFERENCES person(person_id),
    fk_add_id INTEGER, FOREIGN KEY (fk_add_id) REFERENCES address(add_id)
);

CREATE TABLE fines (
fine_id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    fine_description VARCHAR(255),
    fine_level CHAR NOT NULL,
fine_current_price DOUBLE NOT NULL,
    fine_penalty_points INTEGER NOT NULL,
    fine_total_value DOUBLE NOT NULL
);

CREATE TABLE infractions (
    infr_id INTEGER PRIMARY KEY AUTO_INCREMENT UNIQUE,
    infr_type VARCHAR(20) NOT NULL,
    infr_datetime DATETIME NOT NULL,
    infr_latitude VARCHAR(20) NOT NULL,
    infr_longitude VARCHAR(20) NOT NULL,
    fk_vehicle_id INTEGER,
    FOREIGN KEY (fk_vehicle_id)
        REFERENCES vehicle (vehicle_id),
    fk_fine_id INTEGER,
    FOREIGN KEY (fk_fine_id)
        REFERENCES fines (fine_id),
    fk_person_id INTEGER,
    FOREIGN KEY (fk_person_id)
        REFERENCES person (person_id)
);
