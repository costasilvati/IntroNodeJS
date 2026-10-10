# Loja de carros com clientes e vendas

Neste capítulo vamos finalizar a sequência prática da API da loja de carros. Até aqui, a aplicação já possui cadastro de carros, conexão com banco de dados, organização em rotas e classes, além de autenticação com JWT para proteger rotas sensíveis. Agora, vamos ampliar o sistema para incluir **clientes** e **vendas**.

A regra principal do sistema será:

- um cliente pode comprar vários carros;
- cada carro pode ser vendido para apenas um cliente;
- o cadastro de clientes e o registro de vendas só podem ser feitos por usuários autenticados.

Essa estrutura é comum em aplicações reais, nas quais os dados são persistidos em banco relacional e as operações que modificam informações precisam de autenticação [@lecheta_node; @express_db; @rocketseat_jwt_node].

## Modelo de dados da loja

A aplicação terá quatro tabelas principais:

- `usuarios`: usuários autorizados a cadastrar clientes e registrar vendas;
- `clientes`: pessoas que compram carros;
- `carros`: veículos disponíveis na loja;
- `vendas`: registro da venda de um carro para um cliente.

O relacionamento principal será:

```text
clientes 1 ---- N vendas
carros   1 ---- 0..1 vendas
usuarios 1 ---- N vendas
````

Isso significa que:

* um cliente pode aparecer em várias vendas;
* um carro pode aparecer em no máximo uma venda;
* um usuário autenticado pode registrar várias vendas.

## Criando as tabelas do banco de dados

Vamos considerar o banco já utilizado anteriormente:

```sql
USE api_carros;
```

A tabela `usuarios` já foi criada no capítulo sobre autenticação. Caso ainda não exista, ela pode ser criada assim:

```sql
CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);
```


A tabela `clientes` será responsável por armazenar os compradores.


```sql
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE,
    email VARCHAR(120),
    telefone VARCHAR(20),
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

A tabela `carros` pode ser mantida como no capítulo anterior, mas vamos acrescentar o campo `vendido`, para facilitar consultas.

```sql
CREATE TABLE carros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    marca VARCHAR(100) NOT NULL,
    ano INT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    vendido BOOLEAN DEFAULT FALSE
);
```

A tabela `vendas` registra a associação entre cliente, carro e usuário responsável pela venda.

```sql
CREATE TABLE vendas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    carro_id INT NOT NULL UNIQUE,
    usuario_id INT NOT NULL,
    valor_venda DECIMAL(10,2) NOT NULL,
    data_venda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_vendas_clientes
        FOREIGN KEY (cliente_id)
        REFERENCES clientes(id),

    CONSTRAINT fk_vendas_carros
        FOREIGN KEY (carro_id)
        REFERENCES carros(id),

    CONSTRAINT fk_vendas_usuarios
        FOREIGN KEY (usuario_id)
        REFERENCES usuarios(id)
);
```

O campo:

```sql
carro_id INT NOT NULL UNIQUE
```

impede que o mesmo carro seja vendido mais de uma vez. Essa restrição é importante porque representa uma regra de negócio diretamente no banco de dados.

## Inserindo dados iniciais

Podemos cadastrar alguns carros disponíveis:

```sql
INSERT INTO carros (nome, marca, ano, preco, vendido)
VALUES
('Fusca', 'Volkswagen', 1972, 25000, false),
('Ferrari F40', 'Ferrari', 1987, 1500000, false),
('Porsche 911', 'Porsche', 2020, 950000, false),
('BMW Série 7', 'BMW', 2023, 750000, false);
```

Também podemos inserir clientes de teste:

```sql
INSERT INTO clientes (nome, cpf, email, telefone)
VALUES
('Ana Silva', '111.111.111-11', 'ana@email.com', '43999990000'),
('Carlos Souza', '222.222.222-22', 'carlos@email.com', '43988880000');
```

## Estrutura final do projeto

A estrutura do projeto será organizada em pastas:

```text
api-carros/
├── database/
│   └── connection.js
├── middleware/
│   └── auth.js
├── models/
│   ├── Carro.js
│   ├── Cliente.js
│   └── Venda.js
├── routes/
│   ├── auth.js
│   ├── carros.js
│   ├── clientes.js
│   └── vendas.js
├── package.json
└── server.js
```

Essa organização separa responsabilidades:

* `database`: conexão com banco;
* `middleware`: autenticação;
* `models`: classes de acesso aos dados;
* `routes`: definição das rotas da API;
* `server.js`: configuração principal da aplicação.

## Arquivo de conexão com banco de dados

O arquivo de conexão permanece semelhante ao utilizado nos capítulos anteriores.

Arquivo:

```text
database/connection.js
```

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

  console.log('Conectado ao banco de dados MySQL');
});

module.exports = connection;
```

Esse arquivo exporta a conexão para que ela possa ser reutilizada nas classes `Carro`, `Cliente` e `Venda`.

## Classe Cliente

A classe `Cliente` será responsável pelas operações de cadastro, consulta, atualização e remoção de clientes.

Arquivo:

```text
models/Cliente.js
```

```javascript
const connection = require('../database/connection');

class Cliente {

  listar(callback) {
    const sql = 'SELECT * FROM clientes';
    connection.query(sql, callback);
  }

  buscarPorId(id, callback) {
    const sql = 'SELECT * FROM clientes WHERE id = ?';
    connection.query(sql, [id], callback);
  }

  inserir(dados, callback) {
    const sql = `
      INSERT INTO clientes (nome, cpf, email, telefone)
      VALUES (?, ?, ?, ?)
    `;

    connection.query(
      sql,
      [
        dados.nome,
        dados.cpf,
        dados.email,
        dados.telefone
      ],
      callback
    );
  }

  atualizar(id, dados, callback) {
    const sql = `
      UPDATE clientes
      SET nome = ?, cpf = ?, email = ?, telefone = ?
      WHERE id = ?
    `;

    connection.query(
      sql,
      [
        dados.nome,
        dados.cpf,
        dados.email,
        dados.telefone,
        id
      ],
      callback
    );
  }

  remover(id, callback) {
    const sql = 'DELETE FROM clientes WHERE id = ?';
    connection.query(sql, [id], callback);
  }

}

module.exports = new Cliente();
```

A classe isola o acesso à tabela `clientes`, evitando que os comandos SQL fiquem diretamente espalhados pelas rotas.

## Rotas de clientes protegidas por autenticação

Como o enunciado do sistema define que o cadastro de clientes deve ser feito apenas por usuários autenticados, vamos proteger as rotas que modificam dados.

Arquivo:

```text
routes/clientes.js
```

```javascript
const express = require('express');

const router = express.Router();

const Cliente = require('../models/Cliente');
const { protegerRota } = require('../middleware/auth');

router.get('/', (req, res) => {
  Cliente.listar((erro, resultados) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao listar clientes'
      });
    }

    res.json(resultados);
  });
});

router.get('/:id', (req, res) => {
  Cliente.buscarPorId(req.params.id, (erro, resultados) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao buscar cliente'
      });
    }

    if (resultados.length === 0) {
      return res.status(404).json({
        erro: 'Cliente não encontrado'
      });
    }

    res.json(resultados[0]);
  });
});

router.post('/', protegerRota, (req, res) => {
  Cliente.inserir(req.body, (erro, resultado) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao inserir cliente'
      });
    }

    res.status(201).json({
      mensagem: 'Cliente cadastrado com sucesso',
      idInserido: resultado.insertId
    });
  });
});

router.put('/:id', protegerRota, (req, res) => {
  Cliente.atualizar(req.params.id, req.body, (erro) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao atualizar cliente'
      });
    }

    res.json({
      mensagem: 'Cliente atualizado com sucesso'
    });
  });
});

router.delete('/:id', protegerRota, (req, res) => {
  Cliente.remover(req.params.id, (erro) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao remover cliente'
      });
    }

    res.json({
      mensagem: 'Cliente removido com sucesso'
    });
  });
});

module.exports = router;
```

Neste exemplo:

* `GET /clientes` é público;
* `GET /clientes/:id` é público;
* `POST /clientes` exige token;
* `PUT /clientes/:id` exige token;
* `DELETE /clientes/:id` exige token.

Essa estratégia é comum em APIs: consultas podem ser públicas, enquanto alterações exigem autenticação [@express_jwt_npm].

## Classe Venda

A classe `Venda` será responsável por registrar e consultar vendas.

A venda envolve relacionamento entre três tabelas:

* `clientes`;
* `carros`;
* `usuarios`.

Além disso, a operação de venda precisa:

1. verificar se o carro existe;
2. verificar se o carro ainda não foi vendido;
3. registrar a venda;
4. atualizar o carro como vendido.

Esses passos envolvem mais de uma operação no banco. Em sistemas reais, o ideal é usar **transação**, pois ela garante que todas as operações sejam concluídas corretamente ou nenhuma delas seja efetivada.

Arquivo:

```text
models/Venda.js
```

```javascript
const connection = require('../database/connection');

class Venda {

  listar(callback) {
    const sql = `
      SELECT 
        vendas.id,
        vendas.valor_venda,
        vendas.data_venda,
        clientes.nome AS cliente,
        carros.nome AS carro,
        carros.marca AS marca,
        usuarios.nome AS usuario
      FROM vendas
      INNER JOIN clientes ON vendas.cliente_id = clientes.id
      INNER JOIN carros ON vendas.carro_id = carros.id
      INNER JOIN usuarios ON vendas.usuario_id = usuarios.id
      ORDER BY vendas.data_venda DESC
    `;

    connection.query(sql, callback);
  }

  buscarPorId(id, callback) {
    const sql = `
      SELECT 
        vendas.id,
        vendas.valor_venda,
        vendas.data_venda,
        clientes.nome AS cliente,
        carros.nome AS carro,
        carros.marca AS marca,
        usuarios.nome AS usuario
      FROM vendas
      INNER JOIN clientes ON vendas.cliente_id = clientes.id
      INNER JOIN carros ON vendas.carro_id = carros.id
      INNER JOIN usuarios ON vendas.usuario_id = usuarios.id
      WHERE vendas.id = ?
    `;

    connection.query(sql, [id], callback);
  }

  inserir(dados, usuarioId, callback) {
    connection.beginTransaction((erroTransacao) => {
      if (erroTransacao) {
        return callback(erroTransacao);
      }

      const sqlBuscaCarro = 'SELECT * FROM carros WHERE id = ?';

      connection.query(sqlBuscaCarro, [dados.carro_id], (erroBusca, carros) => {
        if (erroBusca) {
          return connection.rollback(() => callback(erroBusca));
        }

        if (carros.length === 0) {
          return connection.rollback(() => callback(new Error('Carro não encontrado')));
        }

        const carro = carros[0];

        if (carro.vendido) {
          return connection.rollback(() => callback(new Error('Carro já vendido')));
        }

        const sqlVenda = `
          INSERT INTO vendas (cliente_id, carro_id, usuario_id, valor_venda)
          VALUES (?, ?, ?, ?)
        `;

        connection.query(
          sqlVenda,
          [
            dados.cliente_id,
            dados.carro_id,
            usuarioId,
            dados.valor_venda
          ],
          (erroVenda, resultadoVenda) => {
            if (erroVenda) {
              return connection.rollback(() => callback(erroVenda));
            }

            const sqlAtualizaCarro = `
              UPDATE carros
              SET vendido = true
              WHERE id = ?
            `;

            connection.query(sqlAtualizaCarro, [dados.carro_id], (erroAtualiza) => {
              if (erroAtualiza) {
                return connection.rollback(() => callback(erroAtualiza));
              }

              connection.commit((erroCommit) => {
                if (erroCommit) {
                  return connection.rollback(() => callback(erroCommit));
                }

                callback(null, resultadoVenda);
              });
            });
          }
        );
      });
    });
  }

}

module.exports = new Venda();
```

## Explicando a transação

A venda precisa alterar duas tabelas:

* inserir registro em `vendas`;
* atualizar o campo `vendido` em `carros`.

Se a venda for inserida, mas o carro não for atualizado, o banco ficará inconsistente. Por isso usamos:

```javascript
connection.beginTransaction()
```

Para iniciar a transação.

Se ocorrer erro:

```javascript
connection.rollback()
```

Para desfazer as operações.

Se tudo der certo:

```javascript
connection.commit()
```

Para confirmar as alterações.

Essa lógica é importante em qualquer operação que envolva múltiplas tabelas relacionadas.

## Rotas de vendas

O registro de venda deve ser feito apenas por usuário autenticado, pois representa uma alteração importante no sistema.

Arquivo:

```text
routes/vendas.js
```

```javascript
const express = require('express');

const router = express.Router();

const Venda = require('../models/Venda');
const { protegerRota } = require('../middleware/auth');

router.get('/', (req, res) => {
  Venda.listar((erro, resultados) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao listar vendas'
      });
    }

    res.json(resultados);
  });
});

router.get('/:id', (req, res) => {
  Venda.buscarPorId(req.params.id, (erro, resultados) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao buscar venda'
      });
    }

    if (resultados.length === 0) {
      return res.status(404).json({
        erro: 'Venda não encontrada'
      });
    }

    res.json(resultados[0]);
  });
});

router.post('/', protegerRota, (req, res) => {
  const usuarioId = req.auth.id;

  Venda.inserir(req.body, usuarioId, (erro, resultado) => {
    if (erro) {
      return res.status(400).json({
        erro: erro.message
      });
    }

    res.status(201).json({
      mensagem: 'Venda registrada com sucesso',
      idVenda: resultado.insertId,
      usuarioResponsavel: usuarioId
    });
  });
});

module.exports = router;
```

A rota `POST /vendas` recebe o cliente, o carro e o valor da venda.

O usuário responsável pela venda não vem do corpo da requisição. Ele vem do token JWT:

```javascript
const usuarioId = req.auth.id;
```

Isso impede que o cliente da API informe manualmente o usuário responsável pela venda.

## Exemplo de JSON para registrar uma venda

Para registrar uma venda, o cliente da API deve enviar:

```json
{
  "cliente_id": 1,
  "carro_id": 2,
  "valor_venda": 1500000
}
```

A requisição deve conter o token:

```http
Authorization: Bearer SEU_TOKEN_AQUI
```

Exemplo com `curl`:

```bash
curl -X POST http://localhost:3000/vendas \
-H "Content-Type: application/json" \
-H "Authorization: Bearer SEU_TOKEN_AQUI" \
-d "{\"cliente_id\":1,\"carro_id\":2,\"valor_venda\":1500000}"
```

## Atualizando a classe Carro

A classe `Carro` pode ser mantida como nos capítulos anteriores, mas é interessante listar também se o carro está vendido.

Arquivo:

```text
models/Carro.js
```

```javascript
const connection = require('../database/connection');

class Carro {

  listar(callback) {
    const sql = 'SELECT * FROM carros';
    connection.query(sql, callback);
  }

  listarDisponiveis(callback) {
    const sql = 'SELECT * FROM carros WHERE vendido = false';
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

## Rota para listar carros disponíveis

Podemos acrescentar uma rota específica para carros ainda não vendidos.

Arquivo:

```text
routes/carros.js
```

```javascript
router.get('/disponiveis', (req, res) => {
  Carro.listarDisponiveis((erro, resultados) => {
    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao listar carros disponíveis'
      });
    }

    res.json(resultados);
  });
});
```

Essa rota ajuda a aplicação cliente a exibir apenas carros que ainda podem ser vendidos.

## Configurando as rotas no servidor

Arquivo:

```text
server.js
```

```javascript
const express = require('express');

const app = express();

const carrosRoutes = require('./routes/carros');
const clientesRoutes = require('./routes/clientes');
const vendasRoutes = require('./routes/vendas');
const authRoutes = require('./routes/auth');

app.use(express.json());

app.use('/auth', authRoutes);
app.use('/carros', carrosRoutes);
app.use('/clientes', clientesRoutes);
app.use('/vendas', vendasRoutes);

app.use((erro, req, res, next) => {
  if (erro.name === 'UnauthorizedError') {
    return res.status(401).json({
      erro: 'Token inválido ou não informado'
    });
  }

  res.status(500).json({
    erro: 'Erro interno no servidor'
  });
});

app.listen(3000, () => {
  console.log('Servidor executando na porta 3000');
});
```

Agora a API possui os seguintes conjuntos de rotas:

```text
/auth/login
/carros
/clientes
/vendas
```

## Testando o fluxo completo

Primeiro, faça login:

```bash
curl -X POST http://localhost:3000/auth/login \
-H "Content-Type: application/json" \
-d "{\"email\":\"admin@email.com\",\"senha\":\"123456\"}"
```

Copie o token retornado.

Depois, cadastre um cliente:

```bash
curl -X POST http://localhost:3000/clientes \
-H "Content-Type: application/json" \
-H "Authorization: Bearer SEU_TOKEN_AQUI" \
-d "{\"nome\":\"Mariana Lima\",\"cpf\":\"333.333.333-33\",\"email\":\"mariana@email.com\",\"telefone\":\"43977770000\"}"
```

Liste carros disponíveis:

```bash
curl http://localhost:3000/carros/disponiveis
```

Registre uma venda:

```bash
curl -X POST http://localhost:3000/vendas \
-H "Content-Type: application/json" \
-H "Authorization: Bearer SEU_TOKEN_AQUI" \
-d "{\"cliente_id\":3,\"carro_id\":1,\"valor_venda\":25000}"
```

Liste as vendas:

```bash
curl http://localhost:3000/vendas
```

## Resultado esperado da listagem de vendas

A rota `/vendas` retorna dados integrados das tabelas relacionadas.

Exemplo:

```json
[
  {
    "id": 1,
    "valor_venda": "25000.00",
    "data_venda": "2026-06-01T12:00:00.000Z",
    "cliente": "Mariana Lima",
    "carro": "Fusca",
    "marca": "Volkswagen",
    "usuario": "Administrador"
  }
]
```

Esse resultado é produzido por meio de `INNER JOIN`, que combina registros das tabelas relacionadas.

## Por que usar INNER JOIN

A venda armazena apenas os identificadores:

```text
cliente_id
carro_id
usuario_id
```

Esses campos são chaves estrangeiras. Para exibir nomes e informações completas, usamos `INNER JOIN`.

Exemplo:

```sql
SELECT 
  vendas.id,
  clientes.nome AS cliente,
  carros.nome AS carro
FROM vendas
INNER JOIN clientes ON vendas.cliente_id = clientes.id
INNER JOIN carros ON vendas.carro_id = carros.id;
```


Esse comando permite retornar uma resposta mais útil para quem consome a API.

## Considerações finais

Neste capítulo, a API da loja de carros evoluiu para um sistema com relacionamento entre entidades. O sistema passou a registrar clientes e vendas, mantendo as regras:

* um cliente pode comprar vários carros;
* cada carro pode ser vendido apenas uma vez;
* a venda é registrada por um usuário autenticado;
* alterações sensíveis exigem token JWT;
* relacionamentos são persistidos no banco com chaves estrangeiras.

Também foram aplicados conceitos importantes de desenvolvimento back-end:

* modelagem relacional;
* chaves estrangeiras;
* relacionamento um-para-muitos;
* uso de `INNER JOIN`;
* transações;
* autenticação em rotas protegidas;
* organização em classes e rotas.


## Referências {-}
