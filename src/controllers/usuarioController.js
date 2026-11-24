var usuarioModel = require("../models/usuarioModel");

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo cadastro.html
    var nome = req.body.nomeServer;
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;
    var fkTime = req.body.fkTimeServer

    // Faça as validações dos valores
    if (nome == undefined) {
        res.status(400).send("Seu nome está undefined!");
    } else if (email == undefined) {
        res.status(400).send("Seu email está undefined!");
    } else if (senha == undefined) {
        res.status(400).send("Sua senha está undefined!");
    } else if (fkTime == undefined) {
        res.status(400).send("Seu time está undefined!");
    } else {

        // Passe os valores como parâmetro e vá para o arquivo usuarioModel.js
        usuarioModel.cadastrar(nome, email, senha, fkTime)
            .then(
                function (resultado) {
                    res.status(200).json('Cadastro realizado com sucesso');
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o cadastro! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

function autenticar(req, res) {
    var email = req.body.emailServer;
    var senha = req.body.senhaServer;

    if (email == undefined) {
        res.status(400).send(`Seu email não está indefinido`)
    } else if (senha == undefined){
        res.status(400).send(`Sua senha não está indefinido`)
    }else {

    usuarioModel.autenticar(email, senha)
        .then(
            function (resultadoSelect) {

                console.log(resultadoSelect)

                if (resultadoSelect.length > 0) {
                    res.json({
                        id: resultadoSelect[0].id,
                        nome: resultadoSelect[0].nome
                    });
                } else if (resultadoSelect.length == 0) {
                    res.status(403).send("Email e/ou senha inválido(s)");
                } else {
                    res.status(500).send("Ocorreu um erro inesperado ao autenticar")
                }
            }
        )
    }
}

module.exports = {
    cadastrar,
    autenticar
}