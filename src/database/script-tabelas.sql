-- Arquivo de apoio, caso você queira criar tabelas como as aqui criadas para a API funcionar.
-- Você precisa executar os comandos no banco de dados para criar as tabelas,
-- ter este arquivo aqui não significa que a tabela em seu BD estará como abaixo!

/*
comandos para mysql server
*/

CREATE DATABASE footstats;

USE footstats;

CREATE TABLE time_ (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45) NOT NULL,
estado VARCHAR (45) NOT NULL
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL,
email VARCHAR (50) NOT NULL UNIQUE,
senha VARCHAR (50) NOT NULL,
sexo VARCHAR (45) NOT NULL,
data_nascimento DATE NOT NULL,
fk_time INT NOT NULL, 

FOREIGN KEY (fk_time) REFERENCES time_(id)
);

CREATE TABLE quiz (
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR (45) NOT NULL,
descricao VARCHAR (150) NOT NULL
);

CREATE TABLE questao (
id INT AUTO_INCREMENT,
questao VARCHAR (100) NOT NULL,
fk_quiz INT NOT NULL,
fk_alternativa_correta INT,

PRIMARY KEY (id, fk_quiz),

FOREIGN KEY (fk_quiz) REFERENCES quiz (id)
);

CREATE TABLE alternativa (
id INT AUTO_INCREMENT,
alternativa VARCHAR (45) NOT NULL,
ordem VARCHAR (45) NOT NULL,
fk_questao INT NOT NULL,

PRIMARY KEY (id, fk_questao),

FOREIGN KEY (fk_questao) REFERENCES questao (id)
);

CREATE TABLE resposta (
fk_usuario INT NOT NULL,
fk_quiz INT NOT NULL,
fk_questao INT NOT NULL,
fk_alternativa_respondida INT NOT NULL,

PRIMARY KEY (fk_usuario, fk_quiz, fk_questao),

FOREIGN KEY (fk_usuario) REFERENCES usuario (id),
FOREIGN KEY (fk_quiz) REFERENCES quiz (id),
FOREIGN KEY (fk_questao) REFERENCES questao (id),
FOREIGN KEY (fk_alternativa_respondida) REFERENCES alternativa (id)
);

ALTER TABLE questao ADD CONSTRAINT chk_alternativa_correta  
FOREIGN KEY (fk_alternativa_correta) REFERENCES alternativa (id);