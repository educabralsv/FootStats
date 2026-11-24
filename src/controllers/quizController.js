var quizModel = require("../models/quizModel")

function listarPerguntas(req, res) {
    quizModel.listarPerguntas()

        .then(function (resultado) {
            res.status(200).json(resultado);
        });
}

function verificarResposta(req, res) {
    var idAlternativa = req.body.idAlternativa
    quizModel.verificarResposta(idAlternativa)

        .then(function (resultado) {
            res.status(200).json(resultado)
        });
}

function iniciarTentativa(req, res) {
    var idUsuario = req.body.idUsuario
    quizModel.iniciarTentativa(idUsuario)

        .then(function (resultado) {
            res.status(200).json(resultado)
        })
}

function registrarResposta(req, res) {
    var idTentativa = req.body.idTentativa
    var idQuestao = req.body.idQuestao
    var idAlternativa = req.body.idAlternativa

    quizModel.registrarResposta(idTentativa, idQuestao, idAlternativa)
        .then(function (resultado) {
            res.status(200).json(resultado)
        })

}

function finalizarTentativa(req, res) {
    var idTentativa = req.body.idTentativa

    console.log("ID recebido para finalizar:", idTentativa)

    quizModel.finalizarTentativa(idTentativa)

        .then(function (resultado) {
            res.status(200).json(resultado)
        })
}

module.exports = {
    listarPerguntas,
    verificarResposta,
    iniciarTentativa,
    registrarResposta,
    finalizarTentativa
}