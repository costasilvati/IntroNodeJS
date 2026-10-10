# Criando um servidor HTTP com Nodejs

Neste capítulo vamos construir, passo a passo, um servidor HTTP usando apenas módulos nativos do Node.js. O objetivo é compreender a base do funcionamento de um servidor web antes de avançar para frameworks como Express. O módulo `node:http` faz parte da API oficial do Node.js e permite criar servidores HTTP; já o construtor `URL` pode ser usado para interpretar a URL da requisição, inclusive separando rota e parâmetros [@lecheta_node].

Ao longo do capítulo, vamos evoluir o servidor em três versões: primeiro, um servidor mínimo que responde na rota raiz; depois, uma versão com callback nomeado e rotas; por fim, uma versão que lê arquivos JSON e responde com dados diferentes para rotas específicas. Como o servidor será criado com `node:http`, os testes serão feitos com endereços do tipo `http://localhost:3000/...`. Para usar HTTPS, o Node disponibiliza o módulo `node:https`, que trabalha com conexões criptografadas [@node_http].

## Criando um servidor HTTP simples

Vamos começar com a menor versão possível de um servidor HTTP. Crie uma pasta para o projeto e, dentro dela, um arquivo chamado `server.js`.

```bash
mkdir servidor-http
cd servidor-http
```

Agora adicione o seguinte código ao arquivo `server.js`:

```javascript
const http = require('node:http');

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('Servidor HTTP ativo na rota /');
});

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});

```

Esse primeiro exemplo importa o módulo `node:http`, cria uma instância de `http.Server` com `http.createServer(...)` e coloca o servidor para escutar na porta `3000`. A documentação oficial informa que `http.createServer([options][, requestListener])` retorna uma nova instância de `http.Server`, e que o `requestListener` é automaticamente associado ao evento `'request'` [@node_http].

Para executar:

```bash
node server.js
```

Depois, abra o navegador em:

```text
http://localhost:3000
```

Como esse servidor ainda não trata rotas, ele responderá da mesma forma para qualquer caminho acessado, por exemplo `/`, `/teste` ou `/qualquer-coisa`.

## Entendendo o `createServer`

A função `createServer` pode ser usada de duas formas didaticamente importantes. A primeira é passar a função diretamente como callback, como fizemos no exemplo anterior. A segunda é criar a função antes e guardá-la em uma variável, deixando mais explícito o papel do callback. A documentação do Node mostra tanto a criação do servidor já com a função passada ao `createServer`, quanto a alternativa de criar o servidor e tratar o evento `'request'` separadamente [@node_http].

Veja a versão com callback armazenado em variável:

```javascript
const http = require('node:http');

const callback = (req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('Resposta enviada pela função callback');
};

const server = http.createServer(callback);

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
```

Aqui, a variável `callback` guarda a função que recebe dois objetos muito importantes:

* `req`: representa a requisição recebida pelo servidor;
* `res`: representa a resposta que o servidor enviará ao cliente.

Essa organização ajuda bastante no início do estudo, porque deixa claro que o servidor apenas “entrega” a requisição para uma função que sabe o que fazer com ela.

Se você quiser apresentar a documentação oficial no capítulo, uma boa forma é comentar no texto que:

* o método está documentado no módulo HTTP do Node.js;
* ele retorna um `http.Server`;
* o callback passado é o `requestListener`;
* esse `requestListener` é associado ao evento `'request'`.

## Adicionando rotas

Até aqui, o servidor responde exatamente da mesma maneira para qualquer URL. Em aplicações reais, isso não é suficiente, pois normalmente queremos que cada rota represente um recurso ou uma funcionalidade diferente.

De forma simples, podemos pensar na rota como a parte da URL que identifica o recurso solicitado. Em Node.js, a URL bruta da requisição chega em `request.url`, e a documentação oficial mostra que esse valor contém apenas a URL presente na requisição HTTP. A própria documentação sugere usar `new URL(...)` para separar essa URL em partes [@node_url].

Vamos criar uma segunda versão do servidor que aceita apenas duas rotas:

* `/`
* `/carros`

Se o usuário acessar qualquer outra rota, o servidor exibirá “rota inválida”.

```javascript
const http = require('node:http');

const callback = (req, res) => {
  const url = new URL(`http://localhost:3000${req.url}`);
  const rota = url.pathname;

  res.setHeader('Content-Type', 'text/plain; charset=utf-8');

  if (rota === '/') {
    res.statusCode = 200;
    res.end('Você acessou a rota /');
  } else if (rota === '/carros') {
    res.statusCode = 200;
    res.end('Você acessou a rota /carros');
  } else {
    res.statusCode = 404;
    res.end('Rota inválida');
  }
};

const server = http.createServer(callback);

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
```

Alguns pontos merecem destaque:

1. `req.url` contém a URL enviada na requisição.
2. `new URL(...)` cria um objeto `URL` com várias partes da URL separadas.
3. `url.pathname` retorna apenas o caminho da rota, como `/` ou `/carros` [@node_http].

Agora você pode testar:

```text
http://localhost:3000/
http://localhost:3000/carros
http://localhost:3000/usuarios
```

As duas primeiras rotas retornarão mensagens válidas. A terceira retornará `Rota inválida`.

## Criando a terceira versão do servidor com arquivos JSON

Agora vamos dar um passo importante: em vez de responder apenas texto, o servidor vai ler arquivos `.json` e devolver dados diferentes para cada rota. Isso aproxima bastante o exemplo do que fazemos em APIs.

Para esse exemplo, vamos usar três rotas:

* `http://localhost:3000/carros/classicos`
* `http://localhost:3000/carros/esportivos`
* `http://localhost:3000/carros/luxo`

Como material didático autocontido, vamos criar três arquivos JSON na pasta do projeto. Para ler os arquivos, usaremos o módulo `node:fs`, que é o módulo oficial do Node para operações com sistema de arquivos. A documentação informa que `node:fs` oferece APIs síncronas, assíncronas com callback e baseadas em promises; neste capítulo usaremos a forma síncrona por simplicidade didática [@node_fs].

Organize a pasta assim:

```text
servidor-http/
├── server.js
├── classicos.json
├── esportivos.json
└── luxo.json
```

### Arquivo `classicos.json`

```json
[
  {
    "id": 1,
    "nome": "Fusca",
    "marca": "Volkswagen",
    "ano": 1972
  },
  {
    "id": 2,
    "nome": "Opala",
    "marca": "Chevrolet",
    "ano": 1978
  }
]
```

### Arquivo `esportivos.json`

```json
[
  {
    "id": 1,
    "nome": "Ferrari F40",
    "marca": "Ferrari",
    "ano": 1987
  },
  {
    "id": 2,
    "nome": "Porsche 911",
    "marca": "Porsche",
    "ano": 2020
  }
]
```

### Arquivo `luxo.json`

```json
[
  {
    "id": 1,
    "nome": "Mercedes Classe S",
    "marca": "Mercedes-Benz",
    "ano": 2022
  },
  {
    "id": 2,
    "nome": "BMW Série 7",
    "marca": "BMW",
    "ano": 2023
  }
]
```

Agora vamos criar uma função auxiliar para ler um arquivo JSON e retornar seu conteúdo:

```javascript
const fs = require('node:fs');

function lerArquivoJson(nomeArquivo) {
  const conteudo = fs.readFileSync(nomeArquivo, 'utf-8');
  return JSON.parse(conteudo);
}
```

A função usa `fs.readFileSync(...)` para ler o arquivo como texto UTF-8 e depois `JSON.parse(...)` para converter o texto em objeto/array JavaScript. Como as APIs síncronas do Node bloqueiam a execução até a operação terminar e reportam erros por exceção, é recomendável tratá-las com `try...catch` quando o capítulo avançar para cenários mais robustos [@node_fs].

## Servidor versão 3

A seguir está a terceira versão completa do servidor:

```javascript
const http = require('node:http');
const fs = require('node:fs');

function lerArquivoJson(nomeArquivo) {
  const conteudo = fs.readFileSync(nomeArquivo, 'utf-8');
  return JSON.parse(conteudo);
}

const callback = (req, res) => {
  const url = new URL(`http://localhost:3000${req.url}`);
  const rota = url.pathname;

  res.setHeader('Content-Type', 'application/json; charset=utf-8');

  try {
    if (rota === '/carros/classicos') {
      const dados = lerArquivoJson('classicos.json');
      res.statusCode = 200;
      res.end(JSON.stringify(dados));
    } else if (rota === '/carros/esportivos') {
      const dados = lerArquivoJson('esportivos.json');
      res.statusCode = 200;
      res.end(JSON.stringify(dados));
    } else if (rota === '/carros/luxo') {
      const dados = lerArquivoJson('luxo.json');
      res.statusCode = 200;
      res.end(JSON.stringify(dados));
    } else {
      res.statusCode = 404;
      res.end(JSON.stringify({ erro: 'Rota inválida' }));
    }
  } catch (erro) {
    res.statusCode = 500;
    res.end(JSON.stringify({ erro: 'Erro ao ler arquivo JSON' }));
  }
};

const server = http.createServer(callback);

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
```

Nessa versão, o fluxo do servidor é:

1. receber a requisição;
2. fazer o parse da URL;
3. verificar a rota acessada;
4. carregar o arquivo JSON correspondente;
5. devolver os dados ao cliente em formato JSON.

O cabeçalho `Content-Type` foi alterado para `application/json; charset=utf-8`, pois agora a resposta do servidor não é mais texto simples: ela é JSON.

## Testando as rotas

Com o servidor em execução, teste no navegador ou com outra ferramenta HTTP:

```text
http://localhost:3000/carros/classicos
http://localhost:3000/carros/esportivos
http://localhost:3000/carros/luxo
```

Você também pode testar com `curl` no terminal:

```bash
curl http://localhost:3000/carros/classicos
curl http://localhost:3000/carros/esportivos
curl http://localhost:3000/carros/luxo
```

Se a rota não existir, por exemplo:

```text
http://localhost:3000/carros/utilitarios
```

o servidor responderá com erro `404` e a mensagem:

```json
{ "erro": "Rota inválida" }
```

## O que foi aprendido neste capítulo

Com essas três versões do servidor, já foi possível praticar conceitos muito importantes para o restante da disciplina:

* criação de um servidor HTTP com `node:http`;
* uso de `http.createServer(...)`;
* compreensão de callback como função passada ao servidor;
* leitura da URL da requisição com `req.url`;
* parse da URL com `new URL(...)`;
* criação de rotas com base em `pathname`;
* envio de respostas em texto e em JSON;
* leitura de arquivos com `node:fs`.

Esse entendimento te prepara para o próximo passo, que normalmente é usar o Express para tornar a criação de rotas, middlewares e respostas mais produtiva.

## Exercício

Como atividade de fixação, desenvolva:

1. adicionem uma nova rota `/carros/suv`;
2. criem o arquivo `suv.json`;
3. modifiquem a função `lerArquivoJson()` para receber o nome do arquivo dinamicamente;
4. retornem também um objeto com metadados, por exemplo:

```json
{
  "categoria": "classicos",
  "quantidade": 2,
  "itens": [...]
}
```
