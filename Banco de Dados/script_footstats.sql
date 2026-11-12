CREATE DATABASE footstats;

USE footstats;

CREATE TABLE time_ (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
estado VARCHAR (45)
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
email VARCHAR (45),
senha VARCHAR (45),
sexo VARCHAR (45),
data_nascimento DATE,
fk_time INT, 

FOREIGN KEY (fk_time) REFERENCES time_(id)
);

CREATE TABLE quiz (
id INT PRIMARY KEY AUTO_INCREMENT,
titulo VARCHAR (45),
descricao VARCHAR (60)
);

CREATE TABLE questao (
id INT AUTO_INCREMENT,
questao VARCHAR (100),
ordem VARCHAR (45),
fk_alternativa_certa INT, 
fk_quiz INT,

PRIMARY KEY (id, fk_quiz),

FOREIGN KEY (fk_alternativa_certa) REFERENCES alternativa (id),
FOREIGN KEY (fk_quiz) REFERENCES quiz (id)
);

CREATE TABLE alternativa (
id INT AUTO_INCREMENT,
alternativa VARCHAR (45),
ordem VARCHAR (45),
fk_questao INT,

PRIMARY KEY (id, fk_questao),

FOREIGN KEY (fk_questao) REFERENCES questao (id)
);

CREATE TABLE resposta (
fk_usuario INT,
fk_quiz INT,
fk_questao INT,
fk_alternativa_respondida INT,

PRIMARY KEY (fk_usuario, fk_quiz, fk_questao),

FOREIGN KEY (fk_usuario) REFERENCES usuario (id),
FOREIGN KEY (fk_quiz) REFERENCES quiz (id),
FOREIGN KEY (fk_questao) REFERENCES questao (id),
FOREIGN KEY (fk_alternativa_respondida) REFERENCES alternativa (id)
);