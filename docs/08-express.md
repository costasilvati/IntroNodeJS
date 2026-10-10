# Express Framework

Neste capítulo vamos estudar o framework **Express**, uma das bibliotecas mais utilizadas para desenvolvimento de aplicações web e APIs com Node.js. O Express simplifica a criação de servidores HTTP, o gerenciamento de rotas e o processamento de requisições e respostas, tornando o desenvolvimento mais produtivo e organizado [@express_docs; @mdn_express_intro].

O conteúdo deste capítulo continua o projeto iniciado anteriormente com NPM e `nodemon`, substituindo o uso direto do módulo `http` por uma abordagem baseada em framework.

## O que é o Express

O **Express** é um framework minimalista para Node.js utilizado no desenvolvimento de aplicações web e APIs REST. Segundo a documentação oficial, o Express fornece um conjunto enxuto de funcionalidades para aplicações web e móveis [@express_docs].

Antes do Express, ao utilizar apenas o módulo `http`, era necessário:

- analisar manualmente URLs;
- verificar métodos HTTP;
- configurar cabeçalhos;
- implementar tratamento de rotas;
- gerenciar respostas.

O Express simplifica essas tarefas oferecendo:

- sistema de rotas;
- middlewares;
- tratamento simplificado de requisições;
- tratamento simplificado de respostas;
- integração com templates;
- integração com bibliotecas externas.

Segundo a MDN, o Express é popular porque:

- possui sintaxe simples;
- é flexível;
- possui grande ecossistema;
- é amplamente utilizado pela comunidade Node.js [@mdn_express_intro].

## Criando um projeto Express

O código de aula está no repositório do github: (https://github.com/costasilvati/DesWebAvancado/tree/main/codigos)[https://github.com/costasilvati/DesWebAvancado/tree/main/codigos]

Crie uma nova pasta:

```bash
mkdir api-express
cd api-express
````

Inicialize o projeto:

```bash
npm init -y
```

Instale o Express:

```bash
npm install express
```

Instale o `nodemon` como dependência de desenvolvimento:

```bash
npm install nodemon --save-dev
```

Estrutura inicial:

```text
api-express/
├── package.json
└── server.js
```

Edite o `package.json`:

```json
{
  "name": "api-express",
  "version": "1.0.0",
  "description": "Projeto Express",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "dependencies": {
    "express": "^5.0.0"
  },
  "devDependencies": {
    "nodemon": "^3.0.0"
  }
}
```

Agora o projeto pode ser executado com:

```bash
npm run dev
```

## Criando o primeiro servidor Express

Crie o arquivo `server.js`:

```javascript
const express = require('express');

const app = express();

app.listen(3000, () => {
  console.log('Servidor Express executando na porta 3000');
});
```

Neste exemplo:

* `express()` cria a aplicação;
* `app` representa o servidor;
* `app.listen()` inicia o servidor.

Segundo a documentação do Express, a aplicação criada por `express()` é uma função JavaScript que pode responder requisições HTTP [@express_api].

## Configurando rotas na raiz do projeto

Uma rota define como o servidor responderá a uma URL específica.

No Express, rotas são criadas com:

```javascript
app.metodoHTTP(caminho, callback)
```

Exemplo:

```javascript
app.get('/', (req, res) => {
  res.send('Página inicial');
});
```

### Exemplo completo {-}

```javascript
const express = require('express');

const app = express();

app.get('/', (req, res) => {
  res.send('Página inicial');
});

app.get('/carros', (req, res) => {
  res.send('Lista de carros');
});

app.get('/usuarios', (req, res) => {
  res.send('Lista de usuários');
});

app.listen(3000, () => {
  console.log('Servidor executando');
});
```

Neste exemplo:

* `/` representa a rota raiz;
* `/carros` representa o recurso carros;
* `/usuarios` representa o recurso usuários.

### Como funciona internamente {-}

Quando o navegador acessa:

```text
http://localhost:3000/carros
```

o Express:

1. recebe a requisição;
2. verifica o método HTTP;
3. verifica a rota;
4. executa a função callback correspondente.

## Objeto res

O objeto `res` representa a resposta enviada ao cliente [@express_api].

O Express fornece diversas funções utilitárias nesse objeto.

## Retornando texto simples

```javascript
app.get('/', (req, res) => {
  res.send('Servidor Express funcionando');
});
```


## Retornando JSON


```javascript
app.get('/produto', (req, res) => {
  const produto = {
    nome: 'Notebook',
    preco: 3500
  };

  res.json(produto);
});
```

A função:

```javascript
res.json()
```

converte automaticamente o objeto para JSON e configura:

```text
Content-Type: application/json
```

## Informando status HTTP

```javascript
app.get('/erro', (req, res) => {
  res.status(404).json({
    erro: 'Recurso não encontrado'
  });
});
```

Neste exemplo:

* `status(404)` define o código HTTP;
* `json()` envia a resposta.

## Informando o tipo de conteúdo

O tipo de conteúdo pode ser definido com:

```javascript
res.type()
```

Exemplo:

```javascript
app.get('/html', (req, res) => {
  res.type('text/html');

  res.send('<h1>Olá Express</h1>');
});
```

Também é possível usar:

```javascript
res.set()
```

Exemplo:

```javascript
res.set('Content-Type', 'application/json');
```

## Exemplo completo usando res

```javascript
app.get('/resposta', (req, res) => {

  const dados = {
    mensagem: 'Resposta enviada com sucesso'
  };

  res
    .status(200)
    .type('application/json')
    .json(dados);

});
```

## Objeto req

O objeto `req` representa a requisição recebida pelo servidor [@express_api].

Ele contém:

* parâmetros da URL;
* query parameters;
* corpo da requisição;
* cabeçalhos;
* método HTTP.

## Query Parameters

Query parameters são parâmetros enviados na URL após `?`.

Exemplo:

```text
/produtos?categoria=esportivo
```

### Lendo query parameters {-}

```javascript
app.get('/produtos', (req, res) => {

  const categoria = req.query.categoria;

  res.json({
    categoriaRecebida: categoria
  });

});
```

Se o usuário acessar:

```text
http://localhost:3000/produtos?categoria=esportivo
```

Resposta:

```json
{
  "categoriaRecebida": "esportivo"
}
```

## Path Parameters

Path parameters são parâmetros inseridos diretamente na rota.

Exemplo:

```text
/produtos/10
```

### Definindo parâmetros na rota {-}

```javascript
app.get('/produtos/:id', (req, res) => {

  const id = req.params.id;

  res.json({
    idRecebido: id
  });

});
```

Se o usuário acessar:

```text
http://localhost:3000/produtos/10
```

Resposta:

```json
{
  "idRecebido": "10"
}
```

## Recebendo dados via POST

Para ler dados enviados via POST, precisamos habilitar o parser JSON.

```javascript
app.use(express.json());
```

Segundo a documentação do Express, `express.json()` é um middleware que interpreta requisições JSON [@express_json].

## Lendo JSON enviado por POST

```javascript
const express = require('express');

const app = express();

app.use(express.json());

app.post('/usuarios', (req, res) => {

  const dados = req.body;

  res.status(201).json({
    mensagem: 'Usuário recebido',
    dados: dados
  });

});

app.listen(3000);
```

### JSON enviado {-}

```json
{
  "nome": "Ana",
  "idade": 25
}
```

### Resposta {-}

```json
{
  "mensagem": "Usuário recebido",
  "dados": {
    "nome": "Ana",
    "idade": 25
  }
}
```

Envie o JSON através do comando CURL

```bash
curl -X POST https://localhost:3000/usuarios\
     -H "Content-Type: application/json" \
     -d '{"name":"Ana","idade":25}'
```

## Recebendo dados chave=valor

O Express também pode interpretar formulários enviados como:

```text
application/x-www-form-urlencoded
```

Ative o middleware:

```javascript
app.use(express.urlencoded({ extended: true }));
```

Exemplo:

```javascript
app.post('/login', (req, res) => {

  const usuario = req.body.usuario;
  const senha = req.body.senha;

  res.json({
    usuario,
    senha
  });

});
```

## Definindo o tipo de conteúdo aceito

É possível validar o tipo de conteúdo recebido usando:

```javascript
req.is()
```

Exemplo:

```javascript
app.post('/dados', (req, res) => {

  if (!req.is('application/json')) {

    return res.status(415).json({
      erro: 'Tipo de conteúdo inválido'
    });

  }

  res.json({
    mensagem: 'JSON aceito'
  });

});
```

Neste exemplo:

* `415` significa *Unsupported Media Type*;
* apenas requisições JSON são aceitas.

## Organizando rotas na pasta routes

À medida que o projeto cresce, não é recomendável manter todas as rotas no arquivo principal.

Uma prática comum é separar as rotas em arquivos.

Estrutura:

```text
api-express/
├── routes/
│   └── carros.js
├── package.json
└── server.js
```

## Criando arquivo de rotas

Arquivo:

```text
routes/carros.js
```

Conteúdo:

```javascript
const express = require('express');

const router = express.Router();

router.get('/', (req, res) => {

  const carros = [
    { nome: 'Fusca' },
    { nome: 'Ferrari' }
  ];

  res.json(carros);

});

router.get('/luxo', (req, res) => {

  res.json({
    categoria: 'Luxo'
  });

});

module.exports = router;
```

## Utilizando as rotas no arquivo principal

Arquivo:

```text
server.js
```

```javascript
const express = require('express');

const app = express();

const carrosRoutes = require('./routes/carros');

app.use(express.json());

app.use('/carros', carrosRoutes);

app.listen(3000, () => {
  console.log('Servidor executando');
});
```

## Como funciona o app.use

O comando:

```javascript
app.use('/carros', carrosRoutes);
```

define que todas as rotas presentes em `carrosRoutes` terão o prefixo:

```text
/carros
```

Assim:

```javascript
router.get('/')
```

torna-se:

```text
/carros
```

E:

```javascript
router.get('/luxo')
```

torna-se:

```text
/carros/luxo
```

## Testando as rotas

Agora podemos acessar:

```text
http://localhost:3000/carros
http://localhost:3000/carros/luxo
```

## Considerações finais

Neste capítulo estudamos:

* o framework Express;
* criação de rotas;
* objetos `req` e `res`;
* query parameters;
* path parameters;
* leitura de JSON;
* leitura de formulários;
* definição de tipo de conteúdo;
* organização de rotas.

O Express simplifica significativamente o desenvolvimento de APIs com Node.js, permitindo focar na lógica da aplicação em vez de lidar manualmente com detalhes do protocolo HTTP.

Nos próximos capítulos, esses conceitos serão utilizados para construção de APIs REST completas com persistência em banco de dados.
