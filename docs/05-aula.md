# Web Services

Este capítulo apresenta os conceitos fundamentais de **Web Services**, essenciais para o desenvolvimento de aplicações back-end com Node.js. A comunicação entre sistemas modernos ocorre majoritariamente por meio de APIs, utilizando o protocolo HTTP e o padrão REST.

---

## O que são Web Services

Web Services são serviços acessíveis via rede que permitem a comunicação entre diferentes sistemas. No contexto do desenvolvimento web, eles são geralmente implementados como **APIs (Application Programming Interfaces)**, que recebem requisições e retornam respostas, normalmente no formato JSON.

Em aplicações Node.js, Web Services são utilizados para:

- fornecer dados para aplicações front-end  
- integrar sistemas diferentes  
- disponibilizar funcionalidades via rede  

---

## GET versus POST

Os métodos **GET** e **POST** são os mais utilizados em APIs.

### GET

O método GET é utilizado para **buscar dados** no servidor.

Características:

- não altera o estado do sistema  
- parâmetros enviados na URL  
- pode ser cacheado  

### Exemplo (API pública)

```bash
GET https://jsonplaceholder.typicode.com/posts
````

Resposta (JSON):

```json
[
  {
    "userId": 1,
    "id": 1,
    "title": "Exemplo",
    "body": "Conteúdo do post"
  }
]
```

---

### POST

O método POST é utilizado para **enviar dados ao servidor**, geralmente para criar novos registros.

Características:

* altera o estado do sistema
* dados enviados no corpo da requisição
* não é cacheado

### Exemplo

```bash
POST https://jsonplaceholder.typicode.com/posts
```

Corpo da requisição:

```json
{
  "title": "Novo Post",
  "body": "Conteúdo",
  "userId": 1
}
```

Resposta:

```json
{
  "id": 101,
  "title": "Novo Post",
  "body": "Conteúdo",
  "userId": 1
}
```

---

## Web Services RESTful

REST (Representational State Transfer) é um estilo arquitetural baseado em recursos e operações HTTP.

### REST

* define princípios de comunicação
* utiliza recursos identificados por URLs
* usa métodos HTTP

### RESTful

Um serviço é considerado **RESTful** quando segue corretamente os princípios REST:

* uso adequado dos métodos HTTP
* URLs que representam recursos (ex: `/usuarios`, `/produtos`)
* respostas padronizadas (geralmente JSON)
* ausência de estado no servidor (stateless)

### Exemplo RESTful

```bash
GET /usuarios
GET /usuarios/1
POST /usuarios
PUT /usuarios/1
DELETE /usuarios/1
```

---

## Métodos do Protocolo HTTP

Os principais métodos HTTP utilizados em APIs são:

### GET

* utilizado para obter dados
* não altera o servidor

```javascript
app.get('/usuarios', (req, res) => {
    res.json(listaUsuarios);
});
```

---

### POST

* utilizado para criar novos dados

```javascript
app.post('/usuarios', (req, res) => {
    const usuario = req.body;
    listaUsuarios.push(usuario);
    res.status(201).json(usuario);
});
```

---

### PUT

* utilizado para atualizar dados existentes

```javascript
app.put('/usuarios/:id', (req, res) => {
    const id = req.params.id;
    const dados = req.body;

    // atualização simulada
    res.json({ id, ...dados });
});
```

---

### DELETE

* utilizado para remover dados

```javascript
app.delete('/usuarios/:id', (req, res) => {
    const id = req.params.id;

    res.json({ mensagem: `Usuário ${id} removido` });
});
```

---

## Códigos de Retorno HTTP

As respostas HTTP possuem códigos que indicam o resultado da requisição.

### Principais categorias

| Código | Significado      |
| ------ | ---------------- |
| 1xx    | Informacional    |
| 2xx    | Sucesso          |
| 3xx    | Redirecionamento |
| 4xx    | Erro do cliente  |
| 5xx    | Erro do servidor |

---

### Exemplos comuns

| Código | Descrição           |
| ------ | ------------------- |
| 200    | OK                  |
| 201    | Criado              |
| 204    | Sem conteúdo        |
| 400    | Requisição inválida |
| 401    | Não autorizado      |
| 404    | Não encontrado      |
| 500    | Erro interno        |

### Exemplo em Node.js

```javascript
res.status(200).json(dados);
res.status(201).json(novoRegistro);
res.status(404).json({ erro: "Não encontrado" });
```

---

## Tipo de Conteúdo (Content-Type / MIME Type)

O cabeçalho `Content-Type` informa o formato dos dados enviados na requisição ou resposta.

### Tipos mais comuns

| Tipo                | Descrição          |
| ------------------- | ------------------ |
| application/json    | JSON               |
| text/html           | HTML               |
| text/plain          | Texto simples      |
| multipart/form-data | Upload de arquivos |

---

### Exemplo de resposta JSON

```javascript
res.setHeader("Content-Type", "application/json");
res.json({ mensagem: "Sucesso" });
```

---

### Exemplo de requisição HTTP

```http
POST /usuarios HTTP/1.1
Content-Type: application/json
```

---


## Criando um projeto Node.js com GET e POST

Nesta seção será desenvolvido um projeto inicial em **Node.js** capaz de responder a requisições HTTP dos tipos **GET** e **POST**. O objetivo é compreender, na prática, como uma aplicação back-end recebe requisições, processa dados e devolve respostas ao cliente.

Para facilitar o aprendizado, será utilizado apenas o módulo nativo `http` do Node.js. Dessa forma, o foco permanece na lógica básica da comunicação HTTP antes da introdução de frameworks como o Express.

### Criando a pasta do projeto

Crie uma pasta para o projeto e acesse seu conteúdo pelo terminal:

```bash
mkdir projeto-get-post
cd projeto-get-post
````

### Inicializando o projeto

Em seguida, inicialize o projeto Node.js:

```bash
npm init -y
```

Esse comando cria o arquivo `package.json`, responsável por armazenar informações e configurações do projeto.

### Criando o arquivo principal

Crie um arquivo chamado `server.js`.

Estrutura inicial do projeto:

```text
projeto-get-post/
├── package.json
└── server.js
```

### Implementando o servidor

No arquivo `server.js`, adicione o código abaixo:

```javascript
const http = require("http");

const porta = 3000;

const servidor = http.createServer((req, res) => {
  if (req.method === "GET" && req.url === "/") {
    res.writeHead(200, { "Content-Type": "application/json" });
    res.end(JSON.stringify({
      mensagem: "Requisição GET recebida com sucesso"
    }));
  }

  else if (req.method === "POST" && req.url === "/dados") {
    let corpo = "";

    req.on("data", (chunk) => {
      corpo += chunk;
    });

    req.on("end", () => {
      const dadosRecebidos = JSON.parse(corpo);

      res.writeHead(201, { "Content-Type": "application/json" });
      res.end(JSON.stringify({
        mensagem: "Requisição POST recebida com sucesso",
        dados: dadosRecebidos
      }));
    });
  }

  else {
    res.writeHead(404, { "Content-Type": "application/json" });
    res.end(JSON.stringify({
      erro: "Rota não encontrada"
    }));
  }
});

servidor.listen(porta, () => {
  console.log(`Servidor executando em http://localhost:${porta}`);
});
```

### Explicação do código

O módulo `http` é importado com `require("http")`. Em seguida, é criado um servidor com `http.createServer()`, que recebe uma função callback com dois parâmetros:

* `req` representa a requisição recebida
* `res` representa a resposta que será enviada

A lógica do servidor verifica:

* se o método é `GET` e a rota é `/`
* se o método é `POST` e a rota é `/dados`

Quando a requisição é do tipo **GET**, o servidor devolve uma mensagem simples em formato JSON.

Quando a requisição é do tipo **POST**, o servidor lê o corpo da requisição por partes. Isso ocorre porque, no Node.js, os dados chegam em blocos (`chunks`). Após o término da leitura, o conteúdo é convertido de JSON para objeto JavaScript com `JSON.parse()`.

### Executando o servidor

No terminal, execute:

```bash
node server.js
```

Se tudo estiver correto, será exibida uma mensagem semelhante a:

```text
Servidor executando em http://localhost:3000
```

### Testando a rota GET

Abra o navegador e acesse:

```text
http://localhost:3000
```

Resposta esperada:

```json
{
  "mensagem": "Requisição GET recebida com sucesso"
}
```

Também é possível testar com `curl`:

```bash
curl http://localhost:3000
```

### Testando a rota POST

Para testar a rota POST, use o terminal com `curl`:

```bash
curl -X POST http://localhost:3000/dados \
-H "Content-Type: application/json" \
-d "{\"nome\":\"Ana\",\"idade\":25}"
```

Resposta esperada:

```json
{
  "mensagem": "Requisição POST recebida com sucesso",
  "dados": {
    "nome": "Ana",
    "idade": 25
  }
}
```

### O que esse exemplo permite compreender

Com esse pequeno projeto, já é possível observar conceitos fundamentais do desenvolvimento back-end com Node.js:

* criação de servidor HTTP
* identificação de método (`GET`, `POST`)
* identificação de rota (`/`, `/dados`)
* envio de resposta com código HTTP
* uso do cabeçalho `Content-Type`
* leitura de dados enviados no corpo da requisição
* conversão entre JSON e objeto JavaScript

### Melhorando a organização

À medida que o projeto evolui, não é recomendável manter toda a lógica em um único arquivo. Em aplicações maiores, o código normalmente é dividido em:

* arquivo principal do servidor
* rotas
* controladores
* serviços
* modelos

Entretanto, neste momento, manter o código em um único arquivo ajuda a visualizar de forma clara o fluxo completo de uma requisição HTTP.

### Observação importante

No exemplo apresentado, o comando `JSON.parse(corpo)` assume que o conteúdo enviado pelo cliente é um JSON válido. Em aplicações reais, é necessário tratar erros para evitar que o servidor pare de funcionar caso o cliente envie dados inválidos.

Uma versão mais segura seria:

```javascript
req.on("end", () => {
  try {
    const dadosRecebidos = JSON.parse(corpo);

    res.writeHead(201, { "Content-Type": "application/json" });
    res.end(JSON.stringify({
      mensagem: "Requisição POST recebida com sucesso",
      dados: dadosRecebidos
    }));
  } catch (erro) {
    res.writeHead(400, { "Content-Type": "application/json" });
    res.end(JSON.stringify({
      erro: "JSON inválido"
    }));
  }
});
```

### Conclusão

Este primeiro projeto mostra como o Node.js pode ser utilizado para criar servidores HTTP sem bibliotecas externas. Embora essa abordagem seja mais simples e próxima do funcionamento interno da plataforma, em projetos reais costuma-se utilizar frameworks como **Express**, que tornam a definição de rotas e o tratamento de requisições mais produtivos.
