# Integra de APIs Node.js com Banco de Dados


[Código desenvolvido em aula](https://github.com/costasilvati/DesWebAvancado/tree/main/codigos/26052026_api-express)

Neste capítulo vamos integrar a API desenvolvida anteriormente com um banco de dados relacional. Utilizaremos o MySQL em conjunto com Node.js e Express para implementar operações de persistência de dados utilizando SQL.

Segundo Lecheta [-@lecheta_node], uma API sem persistência normalmente perde os dados ao reiniciar o servidor. Por isso, aplicações reais utilizam bancos de dados para armazenar informações permanentemente.

Também utilizaremos como referência a documentação do Express sobre integração com banco de dados [@express_db] e os exemplos de MySQL para Node.js apresentados pelo W3Schools [@w3_mysql].

Ao final deste capítulo, a API será capaz de:

- listar carros;
- buscar um carro específico;
- inserir novos carros;
- atualizar carros;
- remover carros;
- organizar o código utilizando classes.

## Banco de dados da aplicação

A aplicação utilizará um banco chamado:

```text
api_carros
```

A tabela principal será:

```text
carros
```

## Criando o banco de dados

Antes de desenvolver a API, precisamos criar o banco de dados.

Execute os comandos SQL abaixo no MySQL:

```sql
CREATE DATABASE api_carros;
```

Selecionando o banco:

```sql
USE api_carros;
```

Criando a tabela:

```sql
CREATE TABLE carros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    placa VARCHAR(7) NOT NULL
);
```

Inserindo alguns registros:

```sql
INSERT INTO carros (nome, marca, ano, preco, placa)
VALUES
('Fusca', 'Volkswagen', 1972, 25000, 'FUS1C80'),
('Ferrari F40', 'Ferrari', 1987, 1500000, 'FER4R11'),
('Porsche 911', 'Porsche', 2020, 950000, 'POR5H31');
```

## Instalando o driver MySQL

Para conectar Node.js ao MySQL, utilizaremos a biblioteca `mysql2`.

Segundo a documentação do Express, aplicações Node.js normalmente utilizam bibliotecas específicas para comunicação com bancos relacionais [@express_db].

Instale a dependência:

```bash
npm install mysql2
```

O `package.json` será atualizado automaticamente:

```json
"dependencies": {
  "express": "^5.0.0",
  "mysql2": "^3.0.0"
}
```

## Estrutura inicial do projeto

A estrutura da aplicação será:

```text
api-carros/
├── database/
│   └── connection.js
├── routes/
│   └── carros.js
├── models/
│   └── Carro.js
├── package.json
└── server.js
```

## Conectando-se ao banco de dados

Crie o arquivo:

```text
database/connection.js
```

Conteúdo:

```javascript
const mysql = require('mysql2');

const connection = mysql.createConnection({
  host: 'localhost',
  user: 'root',
  password: '',
  database: 'api_carros'
});

connection.connect((erro) => {

  if (erro) {
    console.error('Erro ao conectar no banco:', erro);
    return;
  }

  console.log('Conectado ao MySQL');

});

module.exports = connection;
```

Neste exemplo:

* `mysql.createConnection()` cria a conexão;
* `host` indica o servidor;
* `user` e `password` representam o usuário do banco;
* `database` indica o banco utilizado.

Segundo o W3Schools, o objeto de conexão permite executar comandos SQL diretamente pelo Node.js [@w3_mysql].

## Criando o servidor Express

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
  console.log('Servidor executando na porta 3000');
});
```

## Web service que retorna lista de carros

Arquivo:

```text
routes/carros.js
```

```javascript
const express = require('express');

const router = express.Router();

const connection = require('../database/connection');

router.get('/', (req, res) => {

  const sql = 'SELECT * FROM carros';

  connection.query(sql, (erro, resultados) => {

    if (erro) {

      return res.status(500).json({
        erro: 'Erro ao buscar carros'
      });

    }

    res.json(resultados);

  });

});

module.exports = router;
```

Neste exemplo:

* `SELECT * FROM carros` busca todos os registros;
* `connection.query()` executa o SQL;
* `resultados` contém os dados retornados.

Teste:

```text
http://localhost:3000/carros
```

Resposta esperada:

```json
[
  {
    "id": 1,
    "nome": "Fusca",
    "marca": "Volkswagen",
    "ano": 1972,
    "preco": "25000.00"
  }
]
```

## Selecionando registros na tabela (SELECT)

O comando SQL:

```sql
SELECT * FROM carros;
```

retorna todos os registros.

No Node.js:

```javascript
connection.query('SELECT * FROM carros', (erro, resultados) => {

  console.log(resultados);

});
```

## Selecionando um registro específico

Podemos buscar um carro específico utilizando o ID.

### Rota

```text
/carros/:id
```

### Código

```javascript
router.get('/:id', (req, res) => {

  const id = req.params.id;

  const sql = 'SELECT * FROM carros WHERE id = ?';

  connection.query(sql, [id], (erro, resultados) => {

    if (erro) {

      return res.status(500).json({
        erro: 'Erro ao buscar carro'
      });

    }

    if (resultados.length === 0) {

      return res.status(404).json({
        erro: 'Carro não encontrado'
      });

    }

    res.json(resultados[0]);

  });

});
```

## O que significa o caractere ?

O caractere `?`.

é um placeholder utilizado para evitar SQL Injection.

O valor real é enviado separadamente: `[id]`

Segundo a documentação do MySQL2, esse mecanismo faz o escape automático dos valores [@mysql2_docs].

## Inserindo registros na tabela (INSERT)

Agora vamos permitir inserção de carros.

### Método HTTP

`POST`

### Código

```javascript
router.post('/', (req, res) => {

  const { nome, marca, ano, preco } = req.body;

  const sql = `
    INSERT INTO carros (nome, marca, ano, preco)
    VALUES (?, ?, ?, ?)
  `;

  connection.query(
    sql,
    [nome, marca, ano, preco],
    (erro, resultado) => {

      if (erro) {

        return res.status(500).json({
          erro: 'Erro ao inserir carro'
        });

      }

      res.status(201).json({
        mensagem: 'Carro inserido com sucesso',
        idInserido: resultado.insertId
      });

    }
  );

});
```

### JSON enviado

```json
{
  "nome": "BMW Série 7",
  "marca": "BMW",
  "ano": 2023,
  "preco": 750000
}
```

## Atualizando registros na tabela (UPDATE)

Método:

```text
PUT
```

### Código

```javascript
router.put('/:id', (req, res) => {

  const id = req.params.id;

  const { nome, marca, ano, preco } = req.body;

  const sql = `
    UPDATE carros
    SET nome = ?, marca = ?, ano = ?, preco = ?
    WHERE id = ?
  `;

  connection.query(
    sql,
    [nome, marca, ano, preco, id],
    (erro, resultado) => {

      if (erro) {

        return res.status(500).json({
          erro: 'Erro ao atualizar carro'
        });

      }

      res.json({
        mensagem: 'Carro atualizado com sucesso'
      });

    }
  );

});
```

## Deletando registros da tabela (DELETE)

Método:

```text
DELETE
```

### Código

```javascript
router.delete('/:id', (req, res) => {

  const id = req.params.id;

  const sql = 'DELETE FROM carros WHERE id = ?';

  connection.query(sql, [id], (erro, resultado) => {

    if (erro) {

      return res.status(500).json({
        erro: 'Erro ao remover carro'
      });

    }

    res.json({
      mensagem: 'Carro removido com sucesso'
    });

  });

});
```

## Testando os métodos HTTP

Ferramentas comuns para testar APIs:

* Postman;
* Insomnia;
* Thunder Client;
* curl.

Exemplo com curl:

```bash
curl http://localhost:3000/carros
```

Inserindo:

```bash
curl -X POST http://localhost:3000/carros \
-H "Content-Type: application/json" \
-d "{\"nome\":\"Gol\",\"marca\":\"Volkswagen\",\"ano\":2020,\"preco\":50000}"
```

## Problema da organização do código

À medida que a aplicação cresce, colocar toda a lógica SQL nas rotas torna o projeto difícil de manter.

Por isso, aplicações reais normalmente utilizam:

* models;
* controllers;
* services;
* repositories.

Neste capítulo, utilizaremos uma abordagem baseada em classes.

## Organizando o código em classes

Vamos criar uma classe responsável pelas operações da tabela `carros`.

Arquivo:

```text
models/Carro.js
```

## Classe Carro

```javascript
const connection = require('../database/connection');

class Carro {

  listar(callback) {

    const sql = 'SELECT * FROM carros';

    connection.query(sql, callback);

  }

  buscarPorId(id, callback) {

    const sql = 'SELECT * FROM carros WHERE id = ?';

    connection.query(sql, [id], callback);

  }

  inserir(dados, callback) {

    const sql = `
      INSERT INTO carros (nome, marca, ano, preco)
      VALUES (?, ?, ?, ?)
    `;

    connection.query(
      sql,
      [
        dados.nome,
        dados.marca,
        dados.ano,
        dados.preco
      ],
      callback
    );

  }

  atualizar(id, dados, callback) {

    const sql = `
      UPDATE carros
      SET nome = ?, marca = ?, ano = ?, preco = ?
      WHERE id = ?
    `;

    connection.query(
      sql,
      [
        dados.nome,
        dados.marca,
        dados.ano,
        dados.preco,
        id
      ],
      callback
    );

  }

  remover(id, callback) {

    const sql = 'DELETE FROM carros WHERE id = ?';

    connection.query(sql, [id], callback);

  }

}

module.exports = new Carro();
```

## Utilizando a classe nas rotas

Arquivo:

```text
routes/carros.js
```

```javascript
const express = require('express');

const router = express.Router();

const Carro = require('../models/Carro');

router.get('/', (req, res) => {

  Carro.listar((erro, resultados) => {

    if (erro) {

      return res.status(500).json({
        erro: 'Erro ao listar carros'
      });

    }

    res.json(resultados);

  });

});

router.get('/:id', (req, res) => {

  Carro.buscarPorId(req.params.id, (erro, resultados) => {

    if (erro) {

      return res.status(500).json({
        erro: 'Erro ao buscar carro'
      });

    }

    res.json(resultados[0]);

  });

});

router.post('/', (req, res) => {

  Carro.inserir(req.body, (erro, resultado) => {

    if (erro) {

      return res.status(500).json({
        erro: 'Erro ao inserir carro'
      });

    }

    res.status(201).json({
      mensagem: 'Carro inserido'
    });

  });

});

module.exports = router;
```

## Vantagens da organização em classes

Separar regras em classes oferece vantagens importantes:

* código mais organizado;
* reutilização;
* manutenção simplificada;
* separação de responsabilidades;
* melhor escalabilidade.

Segundo a documentação do Express, aplicações maiores normalmente separam rotas, lógica de negócio e acesso ao banco [@express_db].

## Considerações finais

Neste capítulo estudamos:

* criação de banco de dados;
* conexão Node.js + MySQL;
* SELECT;
* INSERT;
* UPDATE;
* DELETE;
* respostas JSON;
* organização do projeto;
* uso de classes.

Agora a API possui persistência real em banco de dados, permitindo armazenamento permanente das informações.

Nos próximos capítulos, esses conceitos servirão como base para autenticação, middleware e arquiteturas mais avançadas.
