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
descricao VARCHAR (150)
);

CREATE TABLE questao (
id INT AUTO_INCREMENT,
questao VARCHAR (100),
fk_quiz INT,
fk_alternativa_correta INT,

PRIMARY KEY (id, fk_quiz),

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

ALTER TABLE questao ADD CONSTRAINT chk_alternativa_correta  
FOREIGN KEY (fk_alternativa_correta) REFERENCES alternativa (id);

-- ------------------------- INSERTS ------------------------------

INSERT INTO time_ (nome, estado) VALUES 
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
('Cruzeiro', 'MG');

INSERT INTO quiz (titulo, descricao) VALUES 
('Desafio FootStats', 'Você conhece os gigantes do futebol brasileiro? 
Teste seus conhecimentos sobre os 12 grandes clubes, suas histórias, conquistas, ídolos e torcidas.');

INSERT INTO questao (questao, fk_quiz) VALUES 
('Qual é o mascote principal do Flamengo?', 1),
('Qual destes clubes tem o apelido de verdão?', 1),
('Qual jogador ficou eternizado como um dos maiores ídolos da história do Corinthians e era conhecido como Doutor?', 1),
('Qual é o estádio tradicionalmente conhecido como casa do Santos?', 1),
('Em qual ano o Vasco conquistou sua primeira Copa Libertadores?', 1),
('Qual clube conquistou a Libertadores de 2023 pela primeira vez em sua história?', 1),
('Qual jogador é conhecido como Rei de Roma e foi um dos grandes ídolos do Botafogo?', 1),
('Qual clube tem como um de seus maiores ídolos históricos o goleiro Rogério Ceni?', 1),
('Qual é o apelido mais conhecido do Cruzeiro?', 1),
('Em qual clube do G12 Neymar começou a ganhar destaque no futebol profissional?', 1);

INSERT INTO alternativa (alternativa, ordem, fk_questao) VALUES
-- Questão 1: Mascote do Flamengo: B - Urubu
('Raposa', 'A', 1),
('Urubu', 'B', 1),
('Mosqueteiro', 'C', 1),
('Galo', 'D', 1),

-- Questão 2: Apelido de Verdão: D - Palmeiras
('Botafogo', 'A', 2),
('Vasco', 'B', 2),
('Internacional', 'C', 2),
('Palmeiras', 'D', 2),

-- Questão 3: Ídolo conhecido como Doutor: D - Sócrates
('Rivelino', 'A', 3),
('Marcelinho Carioca', 'B', 3),
('Ronaldo Fenômeno', 'C', 3),
('Sócrates', 'D', 3),

-- Questão 4: Estádio tradicional do Santos: D - Vila Belmiro
('Mineirão', 'A', 4),
('Morumbi', 'B', 4),
('Maracanã', 'C', 4),
('Vila Belmiro', 'D', 4),

-- Questão 5: Primeira Libertadores do Vasco: C - 1998
('1996', 'A', 5),
('2000', 'B', 5),
('1998', 'C', 5),
('2011', 'D', 5),

-- Questão 6: Campeão da Libertadores de 2023: C - Fluminense
('Botafogo', 'A', 6),
('Flamengo', 'B', 6),
('Fluminense', 'C', 6),
('Palmeiras', 'D', 6),

-- Questão 7: Ídolo histórico do Botafogo: C - Garrincha
('Zico', 'A', 7),
('Tostão', 'B', 7),
('Garrincha', 'C', 7),
('Rogério Ceni', 'D', 7),

-- Questão 8: Clube de Rogério Ceni: A - São Paulo
('São Paulo', 'A', 8),
('Santos', 'B', 8),
('Flamengo', 'C', 8),
('Corinthians', 'D', 8),

-- Questão 9: Apelido do Cruzeiro: B - Raposa
('Galo', 'A', 9),
('Raposa', 'B', 9),
('Porco', 'C', 9),
('Leão', 'D', 9),

-- Questão 10: Clube em que Neymar começou a ganhar destaque: C - Santos
('Flamengo', 'A', 10),
('Corinthians', 'B', 10),
('Santos', 'C', 10),
('São Paulo', 'D', 10);

-- FAZENDO UPDATE DA FK_ALTERNATIVA_CORRETA PARA INSERIR A RESPOSTA CORRETA
UPDATE questao SET fk_alternativa_correta = 2
WHERE id = 1;
UPDATE questao SET fk_alternativa_correta = 8
WHERE id = 2;
UPDATE questao SET fk_alternativa_correta = 12
WHERE id = 3;
UPDATE questao SET fk_alternativa_correta = 16
WHERE id = 4;
UPDATE questao SET fk_alternativa_correta = 19
WHERE id = 5;
UPDATE questao SET fk_alternativa_correta = 23
WHERE id = 6;
UPDATE questao SET fk_alternativa_correta = 27
WHERE id = 7;
UPDATE questao SET fk_alternativa_correta = 29
WHERE id = 8;
UPDATE questao SET fk_alternativa_correta = 34
WHERE id = 9;
UPDATE questao SET fk_alternativa_correta = 39
WHERE id = 10;