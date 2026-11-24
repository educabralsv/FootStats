var areaPerguntas = document.getElementById("area_perguntas")
var feedbackResposta = document.getElementById("feedback_resposta")
var btnConfirmar = document.getElementById("btn_confirmar")
var btnProxima = document.getElementById("btn_proxima")
var perguntas = []
var indicePergunta = 0
var idTentativa
var perguntaAtual
var respostaCerta = 0
var respostaIncorreta = 0

function confirmarResposta() {
    var alternativaSelecionada = document.querySelector('input[name="questao' + perguntaAtual.id + '"]:checked')

    if (alternativaSelecionada == null) {
        feedbackResposta.innerHTML = "Selecione uma alternativa antes de confirmar!";
        feedbackResposta.className = "feedback aviso";
    } else {
        var idAlternativaSelecionada = alternativaSelecionada.value
        btnConfirmar.disabled = true;
        var alternativas = document.querySelectorAll('input[name="questao' + perguntaAtual.id + '"]')
        for (var i = 0; i < alternativas.length; i++) {
            alternativas[i].disabled = true;
        }

        fetch("/quiz/registrarResposta", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                idTentativa: idTentativa,
                idQuestao: perguntaAtual.id,
                idAlternativa: idAlternativaSelecionada
            })
        })

            .then(function (resposta) {
                console.log("Status do registro:", resposta.status);
                return fetch("/quiz/verificarResposta", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/json",
                    },
                    body: JSON.stringify({
                        idAlternativa: idAlternativaSelecionada
                    }),
                })
            })

            .then(function (resposta) {
                resposta.json().then(function (resultado) {
                    if (resultado[0].alternativa_correta == 1) {
                        feedbackResposta.innerHTML = "Resposta correta!"
                        feedbackResposta.className = "feedback correto"
                        respostaCerta++
                    } else {
                        feedbackResposta.innerHTML = "Resposta incorreta!"
                        feedbackResposta.className = "feedback incorreto"
                        respostaIncorreta++
                    }
                    btnProxima.style.display = "block"
                })
            })
    }
}


function proximaPergunta() {
    if (indicePergunta < perguntas.length - 1) {
        indicePergunta++
        perguntaAtual = perguntas[indicePergunta]
        mostrarPergunta()
        btnConfirmar.disabled = false;
        feedbackResposta.innerHTML = ''
        feedbackResposta.className = ''
        btnProxima.style.display = "none"
    } else {

        fetch("/quiz/finalizarTentativa", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                idTentativa: idTentativa
            })
        })

            .then(function (resposta) {
                var aproveitamento = (respostaCerta / (respostaCerta + respostaIncorreta)) * 100
                feedbackResposta.innerHTML = `
                Parabéns! Você concluiu o quiz!<br>
            Você acertou: ${respostaCerta}<br>
            Você errou: ${respostaIncorreta}<br>
            Porcentagem de acertos: ${aproveitamento.toFixed(1)}%<br>
            Total de questões: ${respostaCerta + respostaIncorreta}
            `
                btnConfirmar.style.display = "none";
                btnProxima.innerHTML = "Ir para Dashboard";
                btnProxima.onclick = function () {
                    window.location = "dashboard.html";
                }
            })
    }
}


btnConfirmar.onclick = confirmarResposta
btnProxima.onclick = proximaPergunta

fetch("/quiz/listarPerguntas")

    .then(function (resposta) {
        resposta.json().then(function (dados) {
            var conteudo = ''
            for (let i = 0; i < dados.length; i++) {

                if (i == 0 || dados[i].idQuestao != dados[i - 1].idQuestao) {
                    var novaPergunta = {
                        "id": dados[i].idQuestao,
                        "questao": dados[i].questao,
                        "alternativas": []
                    }
                    perguntas.push(novaPergunta)
                }
                novaPergunta.alternativas.push({
                    id: dados[i].idAlternativa,
                    texto: dados[i].alternativa
                });
            }


            perguntaAtual = perguntas[indicePergunta]
            mostrarPergunta()

        });
    });

function mostrarPergunta() {
    areaPerguntas.innerHTML = ''

    var conteudo = ''

    conteudo += '<div class="pergunta">';

    conteudo += '<h3>Questão ' + perguntaAtual.id + '</h3>';
    conteudo += '<p>' + perguntaAtual.questao + '</p>';
    conteudo += '<div class="alternativas">';

    for (var i = 0; i < perguntaAtual.alternativas.length; i++) {
        var alternativaAtual = perguntaAtual.alternativas[i]
        conteudo += '<label class="alternativa-item">';
        conteudo += '<input type="radio" name="questao' + perguntaAtual.id + '" value="' + alternativaAtual.id + '">';
        conteudo += alternativaAtual.texto;
        conteudo += '</label>';
    }

    conteudo += '</div>';
    conteudo += '</div>';

    areaPerguntas.innerHTML = conteudo;
}

console.log("ID do usuário:", sessionStorage.ID_USUARIO)
fetch("/quiz/iniciarTentativa", {
    method: "POST",
    headers: {
        "Content-Type": "application/json",
    },
    body: JSON.stringify({
        idUsuario: sessionStorage.ID_USUARIO
    }),

}).then(function (resposta) {
    resposta.json().then(function (resultado) {
        idTentativa = resultado.insertId
        console.log("ID da tentativa:", idTentativa)
    })
})

function sair() {
    sessionStorage.clear();
    window.location = "login.html";
}