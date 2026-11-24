# Especificação: Governança de Espécies em Aquários

## 1. Contexto

A AquaTech gerencia aquários com diferentes tipos de água (doce e salgada). A gente percebeu que a equipe está tendo problemas no dia a dia: o mesmo peixe acaba sendo cadastrado várias vezes por causa de letras maiúsculas ou traços (tipo "Peixe Dourado", "peixe-dourado", etc), o que bagunça o sistema. 

Além disso, às vezes um peixe de água doce é colocado num aquário de água salgada por engano, o que causa a morte dos peixes e dá prejuízo. Para piorar, o time sofre para achar os peixes porque faltam filtros visuais.

## 2. Objetivo

A ideia é resolver essa dor de cabeça melhorando o sistema que a equipe já usa. Queremos evitar que os peixes morram por estarem na água errada, acabar com a duplicação de nomes no banco de dados e facilitar a vida de quem precisa olhar as informações dos aquários.

## 3. Escopo

O que vamos fazer nessa versão:

- **Dentro do escopo:** 
  - Fazer uma validação no cadastro para não deixar salvar peixe com nome duplicado.
  - Validar se o peixe é compatível com a água do aquário escolhido.
  - Criar dois filtros na listagem: um para o tipo de água e outro para ordenar o tamanho do peixe (crescente e decrescente).

- **Fora do escopo:** 
  - Filtro para buscar o peixe pelo nome.
  - Tela de login ou cadastro de usuários (isso já tem no sistema).

## 4. Funcionalidades

- **Cadastrar espécie:** A pessoa vai inserir o nome do peixe, o tamanho e se ele é de água doce ou salgada.
- **Associar ao aquário:** O usuário vai escolher um peixe que já está cadastrado e colocar ele num aquário.
- **Listar e filtrar:** O usuário vai conseguir ver todos os peixes de um aquário e usar os botões para filtrar pela água ou ordenar do menor pro maior (e vice-versa).

## 5. Regras de negócio

- **Nomes únicos:** Antes de salvar, o sistema tem que padronizar o texto (ex: deixar tudo minúsculo). Assim, ele percebe que "Peixe Dourado" é a mesma coisa que "peixe-dourado" e não deixa duplicar.
- **Compatibilidade:** Peixe de água doce só entra em aquário de água doce. Se tentar colocar no salgado, o sistema tem que travar a ação.
- **Tudo preenchido:** Não dá pra cadastrar o peixe se não preencher o nome, o tipo de água e o tamanho.

## 6. Interface

- As telas de cadastro precisam ser simples e diretas.
- Se o usuário tentar fazer algo errado (duplicar peixe ou errar a água), o sistema tem que mostrar uma mensagem de erro vermelha bem clara na tela.
- Na tela de visualização do aquário, os botões de filtro (tamanho e tipo de água) têm que ficar fáceis de achar e clicar.

## 7. Critérios de aceitação

- **Critério de aceitação 1:** Se eu tentar cadastrar o peixe "peixe-dourado" e já tiver um "Peixe Dourado" salvo, o sistema tem que dar erro e não cadastrar.
- **Critério de aceitação 2:** Se eu tentar colocar um peixe de água doce num aquário de água salgada, tem que aparecer uma mensagem de erro na tela e a ação deve ser cancelada.
- **Critério de aceitação 3:** Quando eu estiver olhando o aquário e clicar nos botões de filtro e ordenação, a lista de peixes tem que atualizar certinho na hora.