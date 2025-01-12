DROP DATABASE IF EXISTS condominio;
CREATE DATABASE condominio;
USE condominio;

CREATE TABLE apartamento (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    num INT NOT NULL
);

CREATE TABLE visitante (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(14), 
    data_reg DATE NOT NULL
);

CREATE TABLE morador (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(200) NOT NULL,
    cpf VARCHAR(14) NOT NULL,
    celular VARCHAR (15) NOT NULL,
    data_nasc DATE,
    data_entr DATE,
    data_said DATE,
    proprietario CHAR(1) NOT NULL
);

CREATE TABLE visita (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_visitante INT NULL NULL,
    id_apartamento INT NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    CONSTRAINT fk_visitante FOREIGN KEY (id_visitante) REFERENCES visitante (id),
    CONSTRAINT fk_aptovisita FOREIGN KEY (id_apartamento) REFERENCES apartamento (id)
);

CREATE TABLE entregas (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_apartamento INT NOT NULL,
    descricao VARCHAR(200),
    quantidade INT NOT NULL,
    data DATE NOT NULL,
    CONSTRAINT fk_aptoentrega FOREIGN KEY (id_apartamento) REFERENCES apartamento (id)
);

CREATE TABLE reserva_salao_festas (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    id_apartamento INT NOT NULL,
    CONSTRAINT fk_aptosalao FOREIGN KEY (id_apartamento) REFERENCES apartamento (id)
);

CREATE TABLE apartamento_morador (
	id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    id_apartamento INT NOT NULL,
    id_morador INT NOT NULL,
    CONSTRAINT fk_apto FOREIGN KEY (id_apartamento) REFERENCES apartamento (id),
    CONSTRAINT fk_morador FOREIGN KEY (id_morador) REFERENCES morador (id)
);