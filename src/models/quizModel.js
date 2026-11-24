var database = require("../database/config");

function listarPerguntas() {

    var instrucaoSql = `
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
    `;

    return database.executar(instrucaoSql);
}

function verificarResposta(idAlternativa) {
    var instrucaoSql = `
    SELECT alternativa_correta
    FROM alternativa
    WHERE id = ?
    `

    return database.executar(instrucaoSql, [idAlternativa])
}

function iniciarTentativa(idUsuario) {
    var instrucaoSql = `
    INSERT INTO tentativa (data_inicio, fk_usuario)
    VALUES (NOW(), ?);
    `

    return database.executar(instrucaoSql, [idUsuario])
}

function registrarResposta(idTentativa, idQuestao, idAlternativa) {
    var instrucaoSql = `
    INSERT INTO tentativa_alternativa (fk_tentativa, fk_questao, fk_alternativa)
    VALUES (?, ?, ?);   
    `

    return database.executar(instrucaoSql, [idTentativa, idQuestao, idAlternativa])
}

function finalizarTentativa(idTentativa) {
    var instrucaoSql = `
    UPDATE tentativa
    SET data_fim = NOW()
    WHERE id = ?;
    `

    return database.executar(instrucaoSql, [idTentativa])
}

module.exports = {
    listarPerguntas,
    verificarResposta,
    iniciarTentativa,
    registrarResposta,
    finalizarTentativa
};