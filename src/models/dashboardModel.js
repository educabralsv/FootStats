var database = require("../database/config")

function contarUsuarios() {
    var instrucaoSql = `
    SELECT COUNT(*) AS totalUsuarios
    FROM usuario;
    `

    return database.executar(instrucaoSql)
}

function listarTimesFavoritos() {
    var instrucaoSql = `
    SELECT
    time_.nome AS nomeTime,
    COUNT(usuario.id) AS quantidadeUsuarios
    FROM time_
    LEFT JOIN usuario ON usuario.fk_time = time_.id
    GROUP BY time_.id, time_.nome
    ORDER BY quantidadeUsuarios DESC;
    `

    return database.executar(instrucaoSql)
}

function contarTentativas() {
    var instrucaoSql = `
    SELECT COUNT(*) AS totalTentativas
    FROM tentativa
    WHERE data_fim IS NOT NULL;
    `

    return database.executar(instrucaoSql)
}

function contarAcertos() {
    var instrucaoSql = `
    SELECT COUNT(*) AS totalAcertos
    FROM alternativa
    JOIN tentativa_alternativa
    ON alternativa.id = tentativa_alternativa.fk_alternativa
    WHERE alternativa.alternativa_correta = 1;
    `

    return database.executar(instrucaoSql)
}

function calcularMediaPorcentagem() {
    var instrucaoSql = `
    SELECT ROUND (SUM(alternativa_correta)  / (COUNT(*) ) * 100 , 2) AS mediaAproveitamento
    FROM alternativa 
    JOIN tentativa_alternativa ON alternativa.id = tentativa_alternativa.fk_alternativa
    JOIN tentativa ON tentativa.id = tentativa_alternativa.fk_tentativa
    WHERE tentativa.data_fim IS NOT NULL
    `

    return database.executar(instrucaoSql)
}

function listarAproveitamento(idUsuario) {
    var instrucaoSql = `
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
    `;

    return database.executar(instrucaoSql, [idUsuario]);

}

function listarQuestoesDificeis() {
    var instrucaoSql = `
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
    `

    return database.executar(instrucaoSql)
}

module.exports = {
    contarUsuarios,
    listarTimesFavoritos,
    contarTentativas,
    contarAcertos,
    calcularMediaPorcentagem,
    listarAproveitamento,
    listarQuestoesDificeis
}