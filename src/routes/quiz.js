var express = require("express");
var router = express.Router();

var quizController = require("../controllers/quizController");

router.get("/listarPerguntas", function (req, res) {
    quizController.listarPerguntas(req, res);
});

router.post("/verificarResposta", function (req, res) {
    quizController.verificarResposta(req, res);
});

router.post("/iniciarTentativa", function (req, res) {
    quizController.iniciarTentativa(req, res);
});

router.post("/registrarResposta", function (req, res) {
    quizController.registrarResposta(req, res);
});

router.post("/finalizarTentativa", function (req, res) {
    quizController.finalizarTentativa(req, res)
});

module.exports = router;