# 📱 Frontend Flutter Web: API de Usuários

Bem-vindo ao repositório do nosso aplicativo Frontend! Este projeto foi desenvolvido em **Flutter** (com foco na execução Web) para consumir a nossa API RESTful de Usuários construída com Node.js e PostgreSQL.

O objetivo deste projeto é demonstrar na prática como estruturar um aplicativo separando as responsabilidades visuais (Telas) da lógica de negócios e comunicação com a internet (Modelos e Serviços).

## 🛠️ Tecnologias Utilizadas
* **Flutter & Dart**: Framework e linguagem para construção da interface.
* **Pacote `http`**: Para realizar as requisições de rede (GET, POST) para a nossa API.
* **Material Design**: Padrão de design de interface nativo do Flutter.

---

## 📋 Pré-requisitos
Para que este aplicativo funcione perfeitamente, você **precisa** que o backend esteja rodando na sua máquina.

1. Ter o **Flutter SDK** instalado e configurado.
2. Ter o projeto do **Backend (Node.js + Postgres)** rodando na porta `3000`. 
   *(Se você não sabe como fazer isso, consulte o repositório do backend da nossa disciplina).*
3. **Crucial:** O backend deve estar com a biblioteca `cors` configurada e ativada no `app.js`, caso contrário o navegador bloqueará a comunicação!

---

## 🚀 Como Rodar o Projeto

### Passo 1: Clonar o Repositório
Abra o terminal e clone este projeto em uma pasta separada do backend:
```bash
git clone https://github.com/ipolato/opt120_fontend_exemplo.git
cd opt120_fontend_exemplo
```
### Passo 2: Instalar as Dependências
Baixe os pacotes necessários (como o pacote http) definidos no arquivo pubspec.yaml:

```bash
flutter pub get
```

### Passo 3: Executar no Navegador
Como o nosso foco para evitar travamentos com emuladores é a Web, execute o aplicativo diretamente no Google Chrome:

```bash
flutter run -d chrome
```

## 📁 Arquitetura do Projeto
Nós não misturamos regras de internet com botões! O código fonte (dentro da pasta lib/) está estruturado da seguinte forma:

* models/usuario_model.dart: A "fôrma" dos nossos dados. Ele traduz o JSON que vem da internet para um Objeto Dart, e vice-versa.

* services/api_service.dart: O nosso "carteiro". É o único arquivo que sabe o endereço do servidor (http://127.0.0.1:3000) e usa o pacote http para fazer as chamadas.

* screens/: Onde a mágica visual acontece.

- tela_principal.dart: O menu com os botões de navegação.

- tela_cadastro.dart: O formulário que captura a digitação e faz o POST.

- tela_listagem.dart: Usa um FutureBuilder poderoso para ler a resposta do GET e desenhar a lista na tela automaticamente.

* main.dart: O ponto de partida limpo, que apenas configura as cores (Tema) e chama a tela principal.

## 🚨 Resolução de Problemas Comuns (Troubleshooting)
Erro: ClientException: Failed to fetch
Este é o erro número 1 de comunicação. Se ele aparecer, verifique duas coisas:

1. O Servidor Node.js está ligado? Você precisa rodar node server.js no terminal do outro projeto.

2. Problema de Localhost: No arquivo lib/services/api_service.dart, certifique-se de que a baseUrl está usando http://127.0.0.1:3000 em vez de http://localhost:3000. O Flutter Web costuma se confundir com a palavra localhost.

3. CORS Bloqueado: Verifique se no arquivo app.js do seu Node.js, a linha app.use(cors()); está antes da linha de rotas (app.use('/usuarios', usuarioRoutes);).
