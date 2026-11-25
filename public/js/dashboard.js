console.log("DASHBOARD.JS FOI CARREGADO!");
var canvasTimes = document.getElementById("graficoTimes")
var contextoTimes = canvasTimes.getContext("2d")

fetch("/dashboard/listarTimesFavoritos")
    .then(function (resposta) {
        resposta.json().then(function (dados) {
            var nomesTimes = []
            var quantidadeUsuarios = []

            for (var i = 0; i < dados.length; i++) {
                nomesTimes.push(dados[i].nomeTime)
                quantidadeUsuarios.push(dados[i].quantidadeUsuarios)
            }
            document.getElementById("timeFavorito").innerHTML = dados[0].nomeTime

            new Chart(contextoTimes, {
                type: "bar",
                data: {
                    labels: nomesTimes,
                    datasets: [{
                        label: "Quantidade de Usuários",
                        data: quantidadeUsuarios,
                        backgroundColor: [
                            '#E32636',
                            '#1C1C1C',
                            '#A6A6A6',
                            '#006437',
                            '#C8102E',
                            '#7A263A',
                            '#000000',
                            '#333333',
                            '#D71920',
                            '#0066A1',
                            '#202020',
                            '#005CA9',
                            '#707070',
                            '#BDBDBD'
                        ],
                    }

                    ]
                },
                options: {
                    plugins: {
                        legend: {
                            display: false
                        }
                    }
                }
            })
        })
    })

fetch("/dashboard/contarUsuarios")
    .then(function (resposta) {
        resposta.json().then(function (dados) {
            document.getElementById("totalUsuarios").innerHTML = dados[0].totalUsuarios
        })
    })

fetch("/dashboard/contarTentativas")
    .then(function (resposta) {
        resposta.json().then(function (dados) {
            document.getElementById("tentativasRealizadas").innerHTML = dados[0].totalTentativas
        })
    })

fetch("/dashboard/contarAcertos")
    .then(function (resposta) {
        resposta.json().then(function (dados) {
            document.getElementById("totalAcertos").innerHTML = dados[0].totalAcertos
        })
    })

fetch("/dashboard/calcularMediaPorcentagem")
    .then(function (resposta) {
        resposta.json().then(function (dados) {
            document.getElementById("mediaAproveitamento").innerHTML = dados[0].mediaAproveitamento + "%"
        })
    })

fetch("/dashboard/listarAproveitamento/" + sessionStorage.ID_USUARIO)
    .then(function (resposta) {
        resposta.json().then(function (dados) {
            console.log(dados);
            var canvasAproveitamento = document.getElementById("graficoAproveitamento");
            var contextoAproveitamento = canvasAproveitamento.getContext("2d");
            var tentativas = [];
            var aproveitamentos = [];

            for (var i = 0; i < dados.length; i++) {
                tentativas.push(dados[i].numeroTentativa)
                aproveitamentos.push(dados[i].aproveitamento)


            }

            new Chart(contextoAproveitamento, {
                type: "line",
                data: {
                    labels: tentativas,
                    datasets: [{
                        label: "Aproveitamento (%)",
                        data: aproveitamentos,
                        color: "#0B1F3A"
                    }]

                },
                options: {
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            ticks: {
                                callback: function (valor) {
                                    return valor + "%";
                                }
                            },
                            title: {
                                display: true,
                                text: "Aproveitamento (%)"
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: "Tentativas"
                            }
                        }
                    }
                }
            });
        });
    });

fetch("/dashboard/listarQuestoesDificeis/")

    .then(function (resposta) {
        resposta.json().then(function (dados) {
            console.log("DADOS RECEBIDOS:", dados);
            console.log("PRIMEIRA QUESTÃO:", dados[0]);
            var canvasAcertos = document.getElementById("graficoAcertos");
            var contextoAcertos = canvasAcertos.getContext("2d");
            var nomesQuestoes = []
            var percentuaisAcertos = []

            for (let i = 0; i < dados.length; i++) {
                nomesQuestoes.push("Questão " + dados[i].numeroQuestao)
                percentuaisAcertos.push(dados[i].percentualAcertos)
            }

            new Chart(contextoAcertos, {
                type: "bar",
                data: {
                    labels: nomesQuestoes,
                    datasets: [{
                        label: "Percentual de Acertos (%)",
                        data: percentuaisAcertos,
                        backgroundColor: "#65B985",
                        borderColor: "#65B985",
                        categoryPercentage: 0.65,
                        barPercentage: 0.8
                    }]
                },
                options: {
                    indexAxis: "y",
                    plugins: {
                        legend: {
                            display: false
                        }
                    },
                    scales: {
                        x: {
                            ticks: {
                                callback: function (valor) {
                                    return valor + "%";
                                }
                            },
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: "Percentual de acertos (%)"
                            }
                        },
                        y: {
                            ticks: {
                                autoSkip: false
                            },
                            title: {
                                display: true,
                                text: "Questões"
                            }
                        }
                    }
                }
            })

        })
    })

function sair() {
    sessionStorage.clear();
    window.location = "login.html";
}