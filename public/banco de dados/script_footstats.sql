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
id INT,
data_inicio DATETIME NOT NULL,
data_fim DATETIME,
fk_usuario INT NOT NULL,

PRIMARY KEY (id, fk_usuario),

FOREIGN KEY (fk_usuario) REFERENCES usuario (id)
);

CREATE TABLE questao (
id INT PRIMARY KEY AUTO_INCREMENT,
questao VARCHAR (150) NOT NULL
);

CREATE TABLE alternativa (
id INT AUTO_INCREMENT,
alternativa VARCHAR (45) NOT NULL,
ordem CHAR (1),
alternativa_correta TINYINT NOT NULL,
fk_questao INT NOT NULL,

PRIMARY KEY (id, fk_questao),

FOREIGN KEY (fk_questao) REFERENCES questao (id)
);

CREATE TABLE tentativa_alternativa (
fk_alternativa INT,
fk_tentativa INT, 

PRIMARY KEY (fk_alternativa, fk_tentativa),

FOREIGN KEY (fk_alternativa) REFERENCES alternativa (id),
FOREIGN KEY (fk_tentativa) REFERENCES tentativa (id)
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
('Qual é o mascote principal do Flamengo?'),
('Qual destes clubes tem o apelido de verdão?'),
('Qual jogador ficou eternizado como um dos maiores ídolos da história do Corinthians e era conhecido como Doutor?'),
('Qual é o estádio tradicionalmente conhecido como casa do Santos?'),
('Em qual ano o Vasco conquistou sua primeira Copa Libertadores?'),
('Qual clube conquistou a Libertadores de 2023 pela primeira vez em sua história?'),
('Qual jogador é conhecido como Rei de Roma e foi um dos grandes ídolos do Botafogo?'),
('Qual clube tem como um de seus maiores ídolos históricos o goleiro Rogério Ceni?'),
('Qual é o apelido mais conhecido do Cruzeiro?'),
('Em qual clube do G12 Neymar começou a ganhar destaque no futebol profissional?');

INSERT INTO alternativa (alternativa, ordem, alternativa_correta, fk_questao) VALUES
-- Questão 1: Mascote do Flamengo: B - Urubu
('Raposa', 'A', 0, 1),
('Urubu', 'B', 1, 1),
('Mosqueteiro', 'C', 0, 1),
('Galo', 'D', 0, 1),

-- Questão 2: Apelido de Verdão: D - Palmeiras
('Botafogo', 'A', 0, 2),
('Vasco', 'B', 0, 2),
('Internacional', 'C', 0, 2),
('Palmeiras', 'D', 1, 2),

-- Questão 3: Ídolo conhecido como Doutor: D - Sócrates
('Rivelino', 'A', 0, 3),
('Marcelinho Carioca', 'B', 0, 3),
('Ronaldo Fenômeno', 'C', 0, 3),
('Sócrates', 'D', 1, 3),

-- Questão 4: Estádio tradicional do Santos: D - Vila Belmiro
('Mineirão', 'A', 0, 4),
('Morumbi', 'B', 0, 4),
('Maracanã', 'C', 0, 4),
('Vila Belmiro', 'D', 1, 4),

-- Questão 5: Primeira Libertadores do Vasco: C - 1998
('1996', 'A', 0, 5),
('2000', 'B', 0, 5),
('1998', 'C', 1, 5),
('2011', 'D', 0, 5),

-- Questão 6: Campeão da Libertadores de 2023: C - Fluminense
('Botafogo', 'A', 0, 6),
('Flamengo', 'B', 0, 6),
('Fluminense', 'C', 1, 6),
('Palmeiras', 'D', 0, 6),

-- Questão 7: Ídolo histórico do Botafogo: C - Garrincha
('Zico', 'A', 0, 7),
('Tostão', 'B', 0, 7),
('Garrincha', 'C', 1, 7),
('Rogério Ceni', 'D', 0, 7),

-- Questão 8: Clube de Rogério Ceni: A - São Paulo
('São Paulo', 'A', 1, 8),
('Santos', 'B', 0, 8),
('Flamengo', 'C', 0, 8),
('Corinthians', 'D', 0, 8),

-- Questão 9: Apelido do Cruzeiro: B - Raposa
('Galo', 'A', 0, 9),
('Raposa', 'B', 1, 9),
('Porco', 'C', 0, 9),
('Leão', 'D', 0, 9),

-- Questão 10: Clube em que Neymar começou a ganhar destaque: C - Santos
('Flamengo', 'A', 0, 10),
('Corinthians', 'B', 0, 10),
('Santos', 'C', 1, 10),
('São Paulo', 'D', 0, 10);