var dashboardModel = require("../models/dashboardModel")

function contarUsuarios(req, res) {
    dashboardModel.contarUsuarios()

        .then(function (resultado) {
            res.status(200).json(resultado);
        });
}

function listarTimesFavoritos(req, res) {
    dashboardModel.listarTimesFavoritos()
        .then(function (resultado) {
            res.status(200).json(resultado);
        });
}

function contarTentativas(req, res) {
    dashboardModel.contarTentativas()
        .then(function(resultado) {
            res.status(200).json(resultado)
        });
    
}

function contarAcertos(req, res) {
    dashboardModel.contarAcertos()
        .then(function(resultado) {
            res.status(200).json(resultado)
        });
}

function calcularMediaPorcentagem(req, res) {
    dashboardModel.calcularMediaPorcentagem()
        .then(function(resultado) {
            res.status(200).json(resultado)
    });
}

function listarAproveitamento(req, res) {
    var idUsuario = req.params.idUsuario;
    dashboardModel.listarAproveitamento(idUsuario)
        .then(function (resultado) {
            res.status(200).json(resultado)
    });
}

function listarQuestoesDificeis(req, res) {
    dashboardModel.listarQuestoesDificeis() 
        .then(function (resultado) {
            res.status(200).json(resultado)
    });
    
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