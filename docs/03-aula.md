# Javascript e Objetos


## Hash Tables (Tabelas de Hash)

Em JavaScript, não existe uma estrutura chamada explicitamente “hash table” como em outras linguagens (ex: `HashMap` em Java). No entanto, **objetos (`Object`) e estruturas como `Map`** implementam esse conceito internamente.

Uma hash table é uma estrutura que armazena pares **chave → valor**, permitindo acesso eficiente.

### Uso com Object

```javascript
const usuario = {
  nome: "Ana",
  idade: 25
};
````

### Leitura

```javascript
console.log(usuario.nome);
console.log(usuario["idade"]);
```

### Inserção e atualização

```javascript
usuario.email = "ana@email.com";
usuario.idade = 26;
```

### Uso com Map (mais moderno)

```javascript
const mapa = new Map();

mapa.set("nome", "Carlos");
mapa.set("idade", 30);

console.log(mapa.get("nome"));
```

📌 Segundo a documentação do MDN, `Map` é recomendado quando:

* as chaves não são apenas strings
* há necessidade de melhor controle de iteração

---

## Classes e Objetos

JavaScript é uma linguagem baseada em protótipos, mas a partir do ES6 introduziu a sintaxe de **classes**, que facilita o uso de conceitos de orientação a objetos.

### Declaração de Classe

```javascript
class Pessoa {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }

  apresentar() {
    return `Olá, meu nome é ${this.nome}`;
  }
}
```

### Instanciação

```javascript
const p1 = new Pessoa("Ana", 25);
console.log(p1.apresentar());
```

### Leitura de atributos

```javascript
console.log(p1.nome);
```

### Observação

Apesar da sintaxe de classe, o JavaScript continua sendo baseado em **protótipos** (MDN).

---

## Criação de Objetos

Objetos são estruturas fundamentais em JavaScript, representando coleções de pares chave-valor.

### Forma literal (mais comum)

```javascript
const carro = {
  marca: "Toyota",
  modelo: "Corolla",
  ano: 2020
};
```

### Acesso

```javascript
console.log(carro.marca);
console.log(carro["modelo"]);
```

### Método dentro do objeto

```javascript
const pessoa = {
  nome: "Ana",
  falar() {
    return `Oi, sou ${this.nome}`;
  }
};

console.log(pessoa.falar());
```

---

## Programação Funcional

JavaScript possui forte suporte à programação funcional, permitindo tratar funções como **valores de primeira classe**.

Isso significa que funções podem:

* ser armazenadas em variáveis
* ser passadas como argumento
* ser retornadas por outras funções

### Exemplo

```javascript
const soma = (a, b) => a + b;

function executar(funcao, a, b) {
  return funcao(a, b);
}

console.log(executar(soma, 2, 3));
```

### Funções puras

Funções que:

* não alteram estado externo
* sempre retornam o mesmo resultado para a mesma entrada

```javascript
const dobro = x => x * 2;
```

📌 Segundo MDN, programação funcional melhora:

* legibilidade
* reutilização
* previsibilidade do código

---

## var, let e const

JavaScript possui três formas principais de declarar variáveis.

### var

* escopo de função
* permite reatribuição
* permite redeclaração

```javascript
var x = 10;
var x = 20;
```

---

### let

* escopo de bloco (`{}`)
* permite reatribuição
* não permite redeclaração no mesmo escopo

```javascript
let y = 10;
y = 20;
```

---

### const

* escopo de bloco
* não permite reatribuição
* deve ser inicializada na declaração

```javascript
const z = 10;
```

⚠ Importante:

```javascript
const obj = { nome: "Ana" };
obj.nome = "Maria"; // permitido
```

O que é constante é a **referência**, não o conteúdo.

📌 Boas práticas (MDN / W3Schools):

* usar `const` por padrão
* usar `let` quando houver reatribuição
* evitar `var`

---

## map()

O método `map()` cria um **novo array** transformando os elementos do array original.

### Exemplo

```javascript
const numeros = [1, 2, 3];

const dobrados = numeros.map(n => n * 2);

console.log(dobrados); // [2, 4, 6]
```

### Características

* não altera o array original
* retorna um novo array
* muito usado em programação funcional

---

## filter()

O método `filter()` retorna um novo array contendo apenas os elementos que atendem a uma condição.

### Exemplo

```javascript
const numeros = [1, 2, 3, 4, 5];

const pares = numeros.filter(n => n % 2 === 0);

console.log(pares); // [2, 4]
```

---

## reduce()

O método `reduce()` reduz um array a um único valor.

### Exemplo

```javascript
const numeros = [1, 2, 3, 4];

const soma = numeros.reduce((acumulador, valor) => {
  return acumulador + valor;
}, 0);

console.log(soma); // 10
```

### Forma simplificada

```javascript
const soma = numeros.reduce((acc, v) => acc + v, 0);
```

---

## Integração: map + filter + reduce

Muito comum em Node.js e aplicações modernas:

```javascript
const numeros = [1,2,3,4,5,6];

const resultado = numeros
  .filter(n => n % 2 === 0)
  .map(n => n * 2)
  .reduce((acc, n) => acc + n, 0);

console.log(resultado);
```

## Atividade em Sala — Processamento Funcional de Dados em Node.js

### Cenário

Você está desenvolvendo um módulo de backend que processa dados de pedidos de um sistema de e-commerce.

Considere o seguinte conjunto de dados:

```javascript
const pedidos = [
  { id: 1, cliente: "Ana", total: 120, status: "aprovado" },
  { id: 2, cliente: "Bruno", total: 80, status: "pendente" },
  { id: 3, cliente: "Ana", total: 200, status: "aprovado" },
  { id: 4, cliente: "Carlos", total: 50, status: "cancelado" },
  { id: 5, cliente: "Bruno", total: 150, status: "aprovado" }
];
````

---

### Manipulação Básica (map e filter) {-}

1. Crie um novo array contendo apenas pedidos com status `"aprovado"`
2. Gere um array contendo apenas os nomes dos clientes desses pedidos

Utilize `filter` e `map`

---

### Agregação de Dados (reduce) {-}

Calcule:

* o valor total de vendas (somente pedidos aprovados)
* o valor médio das vendas

Utilize `reduce`

---

### Hash Table (Agrupamento por Cliente) {-}

Crie uma estrutura que agrupe os pedidos por cliente.

Resultado esperado:

```javascript
{
  Ana: [ ... ],
  Bruno: [ ... ],
  Carlos: [ ... ]
}
```

Utilize:

* `Object` OU `Map`
* `reduce`

---

### Classe (Modelagem) {-}

Crie uma classe `Pedido` com:

* atributos: `id`, `cliente`, `total`, `status`
* método: `isAprovado()` → retorna true/false

Recrie o array de pedidos utilizando a classe.

---

### Programação Funcional

Implemente uma função pura:

```javascript
const calcularTotalCliente = (pedidos, nomeCliente) => { ... }
```

Essa função deve:

* receber a lista de pedidos
* retornar o total gasto por um cliente

Não modificar o array original

---

### Desafio com map + filter + reduce {-}

Gere o seguinte resultado:

```javascript
[
  { cliente: "Ana", total: 320 },
  { cliente: "Bruno", total: 150 }
]
```

Regras:

* considerar apenas pedidos aprovados
* agrupar por cliente
* calcular total por cliente

---

### var, let e const (Análise) {-}

Analise o código:

```javascript
for (var i = 0; i < 3; i++) {
  setTimeout(() => {
    console.log(i);
  }, 100);
}
```

1. Qual será a saída?
2. Reescreva usando `let`
3. Explique a diferença de comportamento

---

### Entrega {-}

O aluno deve entregar:

* link para o arquivo .js no guthub


### Desafio Extra {-}

1. Ordenar clientes pelo maior valor gasto
2. Retornar o cliente que mais comprou
3. Converter o resultado final para JSON (`JSON.stringify`)

---

### Dica {-}

Evite loops tradicionais (`for`) sempre que possível.
Priorize **programação funcional**.


