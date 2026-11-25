CREATE DATABASE footstats;

USE footstats;

CREATE TABLE time_ (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45) NOT NULL,
UF VARCHAR (2)
);

CREATE TABLE usuario (
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50) NOT NULL,
email VARCHAR (50) NOT NULL UNIQUE,
senha VARCHAR (255) NOT NULL,
sexo VARCHAR (45) NOT NULL,
CONSTRAINT chk_sexo CHECK (sexo IN ('Masculino', 'Feminino', 'Prefiro não informar')),
data_nascimento DATE NOT NULL,
fk_time INT NOT NULL,

FOREIGN KEY (fk_time) REFERENCES time_ (id)
);

CREATE TABLE tentativa (
id INT PRIMARY KEY AUTO_INCREMENT,
data_inicio DATETIME NOT NULL,
data_fim DATETIME,
fk_usuario INT NOT NULL,

FOREIGN KEY (fk_usuario) REFERENCES usuario (id)
);

CREATE TABLE questao (
id INT PRIMARY KEY AUTO_INCREMENT,
questao VARCHAR (150) NOT NULL
);

CREATE TABLE alternativa (
id INT PRIMARY KEY AUTO_INCREMENT,
alternativa VARCHAR (45) NOT NULL,
ordem CHAR (1),
alternativa_correta TINYINT NOT NULL,
fk_questao INT NOT NULL,

FOREIGN KEY (fk_questao) REFERENCES questao (id)
);

CREATE TABLE tentativa_alternativa (
fk_alternativa INT,
fk_tentativa INT, 
fk_questao INT,

PRIMARY KEY (fk_questao, fk_tentativa),

FOREIGN KEY (fk_alternativa) REFERENCES alternativa (id),
FOREIGN KEY (fk_tentativa) REFERENCES tentativa (id),
FOREIGN KEY (fk_questao) REFERENCES questao (id)
);

-- ------------------------- INSERTS ------------------------------

INSERT INTO time_ (nome, UF) VALUES 
('São Paulo', 'SP'),
('Santos', 'SP'),
('Corinthians', 'SP'),
('Palmeiras', 'SP'),
('Flamengo', 'RJ'),
('Fluminense', 'RJ'),
('Botafogo', 'RJ'),
('Vasco', 'RJ'),
('Grêmio', 'RS'),
('Internacional', 'RS'),
('Atlético-MG', 'MG'),
('Cruzeiro', 'MG'),
('Outros', NULL),
('Não torço para nenhum time', NULL);

INSERT INTO questao (questao) VALUES 
('Qual foi o primeiro clube brasileiro a conquistar a Copa Libertadores da América?'),
('Qual destes clubes é conhecido como Tricolor Gaúcho?'),
('Quantas equipes disputam atualmente a Série A do Campeonato Brasileiro?'),
('Qual clube brasileiro é conhecido como Furacão?'),
('Qual seleção conquistou a Copa do Mundo de 2002, disputada no Japão e na Coreia do Sul?'),
('Qual clube venceu a Copa Libertadores de 2013? '),
('Qual jogador marcou o gol do título do Brasil na final da Copa do Mundo de 2002?'),
('Qual clube brasileiro conquistou a Copa Libertadores de 1995?'),
('Na final da Copa Libertadores de 2006, qual clube brasileiro enfrentou o Internacional?'),
('Qual clube brasileiro foi o primeiro a conquistar a Copa Libertadores três vezes?');

INSERT INTO alternativa (alternativa, ordem, alternativa_correta, fk_questao) VALUES
('Palmeiras', 'A', 0, 1),
('Santos', 'B', 1, 1),
('São Paulo', 'C', 0, 1),
('Flamengo', 'D', 0, 1),

('Cruzeiro', 'A', 0, 2),
('Internacional', 'B', 0, 2),
('Juventude', 'C', 0, 2),
('Grêmio', 'D', 1, 2),

( 19, 'A', 0, 3),
( 18, 'B', 0, 3),
( 22, 'C', 0, 3),
( 20, 'D', 1, 3),

('Chapecoense', 'A', 0, 4),
('Avaí', 'B', 0, 4),
('Coritiba', 'C', 0, 4),
('Athletico', 'D', 1, 4),

('Japão', 'A', 0, 5),
('França', 'B', 0, 5),
('Brasil', 'C', 1, 5),
('Alemanha', 'D', 0, 5),

('Fluminense', 'A', 0, 6),
('Cruzeiro', 'B', 0, 6),
('Atlético Mineiro', 'C', 1, 6),
('Internacional', 'D', 0, 6),

('Ronaldinho Gaúcho', 'A', 0, 7),
('Rivaldo', 'B', 0, 7),
('Ronaldo Fenômeno', 'C', 1, 7),
('Kaká', 'D', 0, 7),

('Grêmio', 'A', 1, 8),
('Santos', 'B', 0, 8),
('Cruzeiro', 'C', 0, 8),
('Corinthians', 'D', 0, 8),

('Botafogo', 'A', 0, 9),
('São Paulo', 'B', 1, 9),
('Vasco', 'C', 0, 9),
('Palmeiras', 'D', 0, 9),

('Flamengo', 'A', 0, 10),
('Palmeiras', 'B', 0, 10),
('São Paulo', 'C', 1, 10),
('Santos', 'D', 0, 10);