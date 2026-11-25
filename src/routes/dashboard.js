    var express = require("express")
    var router = express.Router()

    var dashboardController = require("../controllers/dashboardController");

    router.get("/contarUsuarios", function (req, res) {
        dashboardController.contarUsuarios(req, res);
    });

    router.get("/listarTimesFavoritos", function (req, res) {
        dashboardController.listarTimesFavoritos(req, res)
    })

    router.get("/contarTentativas", function (req, res) {
        dashboardController.contarTentativas(req, res);
    });

    router.get("/contarAcertos", function (req, res) {
        dashboardController.contarAcertos(req, res);
    });

    router.get("/calcularMediaPorcentagem", function (req, res) {
        dashboardController.calcularMediaPorcentagem(req, res);
    });

    router.get("/listarAproveitamento/:idUsuario", function (req, res) {
        dashboardController.listarAproveitamento(req, res);
    });

    router.get("/listarQuestoesDificeis", function (req, res) {
        dashboardController.listarQuestoesDificeis(req, res)
    })

    module.exports = router