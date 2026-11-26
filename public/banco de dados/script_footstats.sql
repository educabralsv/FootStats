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

INSERT INTO usuario (nome, email, senha, fk_time) VALUES

-- São Paulo (14 novos)
('Usuario SP 02', 'sp02@footstats.com', 'senha_teste', 1),
('Usuario SP 03', 'sp03@footstats.com', 'senha_teste', 1),
('Usuario SP 04', 'sp04@footstats.com', 'senha_teste', 1),
('Usuario SP 05', 'sp05@footstats.com', 'senha_teste', 1),
('Usuario SP 06', 'sp06@footstats.com', 'senha_teste', 1),
('Usuario SP 07', 'sp07@footstats.com', 'senha_teste', 1),
('Usuario SP 08', 'sp08@footstats.com', 'senha_teste', 1),
('Usuario SP 09', 'sp09@footstats.com', 'senha_teste', 1),
('Usuario SP 10', 'sp10@footstats.com', 'senha_teste', 1),
('Usuario SP 11', 'sp11@footstats.com', 'senha_teste', 1),
('Usuario SP 12', 'sp12@footstats.com', 'senha_teste', 1),
('Usuario SP 13', 'sp13@footstats.com', 'senha_teste', 1),
('Usuario SP 14', 'sp14@footstats.com', 'senha_teste', 1),
('Usuario SP 15', 'sp15@footstats.com', 'senha_teste', 1),

-- Flamengo (12)
('Usuario Flamengo 01', 'flamengo01@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 02', 'flamengo02@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 03', 'flamengo03@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 04', 'flamengo04@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 05', 'flamengo05@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 06', 'flamengo06@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 07', 'flamengo07@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 08', 'flamengo08@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 09', 'flamengo09@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 10', 'flamengo10@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 11', 'flamengo11@footstats.com', 'senha_teste', 5),
('Usuario Flamengo 12', 'flamengo12@footstats.com', 'senha_teste', 5),

-- Corinthians (12)
('Usuario Corinthians 01', 'corinthians01@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 02', 'corinthians02@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 03', 'corinthians03@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 04', 'corinthians04@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 05', 'corinthians05@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 06', 'corinthians06@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 07', 'corinthians07@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 08', 'corinthians08@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 09', 'corinthians09@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 10', 'corinthians10@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 11', 'corinthians11@footstats.com', 'senha_teste', 3),
('Usuario Corinthians 12', 'corinthians12@footstats.com', 'senha_teste', 3),

-- Palmeiras (11)
('Usuario Palmeiras 01', 'palmeiras01@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 02', 'palmeiras02@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 03', 'palmeiras03@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 04', 'palmeiras04@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 05', 'palmeiras05@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 06', 'palmeiras06@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 07', 'palmeiras07@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 08', 'palmeiras08@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 09', 'palmeiras09@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 10', 'palmeiras10@footstats.com', 'senha_teste', 4),
('Usuario Palmeiras 11', 'palmeiras11@footstats.com', 'senha_teste', 4),

-- Santos (9)
('Usuario Santos 01', 'santos01@footstats.com', 'senha_teste', 2),
('Usuario Santos 02', 'santos02@footstats.com', 'senha_teste', 2),
('Usuario Santos 03', 'santos03@footstats.com', 'senha_teste', 2),
('Usuario Santos 04', 'santos04@footstats.com', 'senha_teste', 2),
('Usuario Santos 05', 'santos05@footstats.com', 'senha_teste', 2),
('Usuario Santos 06', 'santos06@footstats.com', 'senha_teste', 2),
('Usuario Santos 07', 'santos07@footstats.com', 'senha_teste', 2),
('Usuario Santos 08', 'santos08@footstats.com', 'senha_teste', 2),
('Usuario Santos 09', 'santos09@footstats.com', 'senha_teste', 2),

-- Cruzeiro (9)
('Usuario Cruzeiro 01', 'cruzeiro01@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 02', 'cruzeiro02@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 03', 'cruzeiro03@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 04', 'cruzeiro04@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 05', 'cruzeiro05@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 06', 'cruzeiro06@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 07', 'cruzeiro07@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 08', 'cruzeiro08@footstats.com', 'senha_teste', 12),
('Usuario Cruzeiro 09', 'cruzeiro09@footstats.com', 'senha_teste', 12),

-- Grêmio (8)
('Usuario Gremio 01', 'gremio01@footstats.com', 'senha_teste', 9),
('Usuario Gremio 02', 'gremio02@footstats.com', 'senha_teste', 9),
('Usuario Gremio 03', 'gremio03@footstats.com', 'senha_teste', 9),
('Usuario Gremio 04', 'gremio04@footstats.com', 'senha_teste', 9),
('Usuario Gremio 05', 'gremio05@footstats.com', 'senha_teste', 9),
('Usuario Gremio 06', 'gremio06@footstats.com', 'senha_teste', 9),
('Usuario Gremio 07', 'gremio07@footstats.com', 'senha_teste', 9),
('Usuario Gremio 08', 'gremio08@footstats.com', 'senha_teste', 9),

-- Atlético-MG (7)
('Usuario Atletico 01', 'atletico01@footstats.com', 'senha_teste', 11),
('Usuario Atletico 02', 'atletico02@footstats.com', 'senha_teste', 11),
('Usuario Atletico 03', 'atletico03@footstats.com', 'senha_teste', 11),
('Usuario Atletico 04', 'atletico04@footstats.com', 'senha_teste', 11),
('Usuario Atletico 05', 'atletico05@footstats.com', 'senha_teste', 11),
('Usuario Atletico 06', 'atletico06@footstats.com', 'senha_teste', 11),
('Usuario Atletico 07', 'atletico07@footstats.com', 'senha_teste', 11),

-- Fluminense (5)
('Usuario Fluminense 01', 'fluminense01@footstats.com', 'senha_teste', 6),
('Usuario Fluminense 02', 'fluminense02@footstats.com', 'senha_teste', 6),
('Usuario Fluminense 03', 'fluminense03@footstats.com', 'senha_teste', 6),
('Usuario Fluminense 04', 'fluminense04@footstats.com', 'senha_teste', 6),
('Usuario Fluminense 05', 'fluminense05@footstats.com', 'senha_teste', 6),

-- Vasco (4)
('Usuario Vasco 01', 'vasco01@footstats.com', 'senha_teste', 8),
('Usuario Vasco 02', 'vasco02@footstats.com', 'senha_teste', 8),
('Usuario Vasco 03', 'vasco03@footstats.com', 'senha_teste', 8),
('Usuario Vasco 04', 'vasco04@footstats.com', 'senha_teste', 8),

-- Botafogo (3)
('Usuario Botafogo 01', 'botafogo01@footstats.com', 'senha_teste', 7),
('Usuario Botafogo 02', 'botafogo02@footstats.com', 'senha_teste', 7),
('Usuario Botafogo 03', 'botafogo03@footstats.com', 'senha_teste', 7),

-- Internacional (3)
('Usuario Internacional 01', 'internacional01@footstats.com', 'senha_teste', 10),
('Usuario Internacional 02', 'internacional02@footstats.com', 'senha_teste', 10),
('Usuario Internacional 03', 'internacional03@footstats.com', 'senha_teste', 10),

-- Outros (2)
('Usuario Outros 01', 'outros01@footstats.com', 'senha_teste', 13),
('Usuario Outros 02', 'outros02@footstats.com', 'senha_teste', 13),

-- Não torce para nenhum time (1)
('Usuario Sem Time 01', 'semtime01@footstats.com', 'senha_teste', 14);



-- SELECTS DASHBOARD
-- Contar usuarios
SELECT COUNT(*) AS totalUsuarios
FROM usuario;

-- Listar times favoritos
SELECT
    time_.nome AS nomeTime,
    COUNT(usuario.id) AS quantidadeUsuarios
    FROM time_
    LEFT JOIN usuario ON usuario.fk_time = time_.id
    GROUP BY time_.id, time_.nome
    ORDER BY quantidadeUsuarios DESC;
    
-- Contar Tentativas
SELECT COUNT(*) AS totalTentativas
    FROM tentativa
    WHERE data_fim IS NOT NULL;
    
-- Contar acertos
SELECT COUNT(*) AS totalAcertos
    FROM alternativa
    JOIN tentativa_alternativa
    ON alternativa.id = tentativa_alternativa.fk_alternativa
    WHERE alternativa.alternativa_correta = 1;
    
-- Contar media porcentagem 
SELECT ROUND (SUM(alternativa_correta)  / (COUNT(*) ) * 100 , 2) AS mediaAproveitamento
    FROM alternativa 
    JOIN tentativa_alternativa ON alternativa.id = tentativa_alternativa.fk_alternativa
    JOIN tentativa ON tentativa.id = tentativa_alternativa.fk_tentativa
    WHERE tentativa.data_fim IS NOT NULL;
    
-- Listar aproveitamento 
SELECT
        tentativa.id AS numeroTentativa,
        ROUND((SUM(alternativa.alternativa_correta) / COUNT(*)) * 100, 2) AS aproveitamento
    FROM tentativa
    JOIN tentativa_alternativa
        ON tentativa.id = tentativa_alternativa.fk_tentativa
    JOIN alternativa
        ON alternativa.id = tentativa_alternativa.fk_alternativa
    WHERE tentativa.data_fim IS NOT NULL
    AND tentativa.fk_usuario = ?
    GROUP BY tentativa.id
    ORDER BY tentativa.id;
    
-- Listar Questoes Dificeis
 SELECT
    ROUND(
        (SUM(alternativa.alternativa_correta) / COUNT(*)) * 100,
        2
    ) AS percentualAcertos,
    questao.questao,
    questao.id AS numeroQuestao,
    SUM(alternativa.alternativa_correta) AS totalAcertos,
    COUNT(*) AS totalRespostas
    FROM questao
    JOIN alternativa
    ON questao.id = alternativa.fk_questao
    JOIN tentativa_alternativa
    ON alternativa.id = tentativa_alternativa.fk_alternativa
    JOIN tentativa
    ON tentativa.id = tentativa_alternativa.fk_tentativa
    WHERE tentativa.data_fim IS NOT NULL
    GROUP BY questao.id, questao.questao
    ORDER BY questao.id ASC;
    
    
    
-- SELECTS QUIZ
-- Listar Perguntas
SELECT
            questao.id AS idQuestao,
            questao.questao,
            alternativa.id AS idAlternativa,
            alternativa.alternativa,
            alternativa.ordem
        FROM questao
        JOIN alternativa
            ON questao.id = alternativa.fk_questao
        ORDER BY questao.id, alternativa.ordem;

-- Verificar Resposta
SELECT alternativa_correta
    FROM alternativa
    WHERE id = ?