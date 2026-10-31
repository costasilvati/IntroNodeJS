--- 
title: "Desenvolvimento web Avançado"
author: "Juliana Costa Silva"
date: "2026-10-30"
site: bookdown::bookdown_site
documentclass: book
bibliography: [book.bib, packages.bib]
# url: your book url like https://bookdown.org/yihui/bookdown
# cover-image: path to the social sharing image like images/cover.jpg
description: |
  This is a minimal book of using the bookdown package to write a book.
  The HTML output format for this example is bookdown::bs4_book,
  set in the _output.yml file.
biblio-style: apalike
csl: chicago-fullnote-bibliography.csl
---
# Sobre este livro {-}

Este livro foi desenvolvido como material de apoio para a disciplina de **Desenvolvimento Web Avançado**, com foco na construção de aplicações back-end utilizando **JavaScript e Node.js**.

Ao longo dos capítulos, o leitor é conduzido de uma revisão estruturada da linguagem JavaScript — considerando conceitos fundamentais como variáveis, funções, objetos, programação funcional e manipulação de dados — até a implementação prática de uma **API completa**, incluindo:

- criação de servidores com Node.js  
- organização de projetos com NPM  
- construção de APIs REST com Express  
- manipulação e persistência de dados  
- autenticação de usuários  
- integração com bancos de dados  

O material foi pensado para estudantes que já possuem conhecimentos prévios em lógica de programação e outras linguagens, permitindo uma abordagem mais direta e aplicada aos desafios do desenvolvimento moderno.

---

## Abordagem didática {-}

A organização deste livro segue uma abordagem orientada à prática, inspirada na metodologia [**ABC-LD (_Aquisition. Behavior and Construction - Learning Design_)**](https://abc-ld.org), na qual cada conteúdo é estruturado em três momentos:

- **Aquisition:** apresentação dos conceitos fundamentais e exemplos iniciais  
- **Behavior:** exploração guiada dos conceitos  
- **Construction:** desenvolvimento de soluções práticas e progressivas  

Essa abordagem busca promover não apenas a compreensão teórica, mas também o desenvolvimento de habilidades técnicas por meio da experimentação.

---

## Estrutura do conteúdo{-}

O livro está organizado de forma incremental, permitindo que o leitor evolua gradualmente:

- fundamentos de JavaScript no contexto de back-end  
- manipulação de dados e programação funcional  
- comunicação via WebServices  
- introdução ao ambiente Node.js  
- gerenciamento de dependências com NPM  
- construção de APIs com Express  
- tratamento de requisições e erros  
- uso de JSON e integração com banco de dados  
- autenticação e estruturação de aplicações reais  

Ao final do percurso, o leitor será capaz de compreender e implementar os principais componentes de uma aplicação web moderna no lado do servidor.

---

## Objetivo{-}

O principal objetivo deste material é proporcionar uma base sólida para o desenvolvimento de aplicações back-end, conectando conceitos fundamentais da linguagem JavaScript com práticas utilizadas no mercado.

Mais do que apresentar ferramentas, este livro busca desenvolver no leitor a capacidade de:

- estruturar soluções escaláveis  
- compreender o fluxo de dados em aplicações web  
- aplicar boas práticas de desenvolvimento  
- evoluir de exercícios simples para projetos completos  

---

## Público-alvo {-}

Este livro é destinado a:

- estudantes de cursos de Computação e áreas afins  
- desenvolvedores iniciantes em Node.js  
- alunos que já possuem experiência com outras linguagens e desejam migrar para o ecossistema JavaScript  

---

## Considerações finais {-}

O conteúdo foi estruturado para ser utilizado tanto em sala de aula quanto como material de estudo independente. Recomenda-se que o leitor execute todos os exemplos e desenvolva as atividades propostas, pois a aprendizagem neste contexto é fortemente baseada na prática.

Ao final do livro, espera-se que o leitor tenha desenvolvido não apenas conhecimento técnico, mas também autonomia para construir e evoluir aplicações web completas.

<!--chapter:end:index.Rmd-->

# JavaScript Basico para NodeJS

**Disciplina:** Desenvolvimento Web Avançado\
**Contexto:** Programação Back-end com Node.js\
**Data:** 10/03/2026

------------------------------------------------------------------------

## O que é JavaScript no contexto do Node.js

JavaScript é uma linguagem de programação originalmente criada para execução em navegadores.\
Com o **Node.js**, o JavaScript também pode ser executado **no servidor**, permitindo o desenvolvimento de aplicações back-end.

Em Node.js, scripts JavaScript são executados diretamente pelo interpretador:

``` bash
node arquivo.js
```

Exemplo simples:

``` javascript
console.log("Hello Node.js");
```

------------------------------------------------------------------------

## Declaração de Variáveis

JavaScript possui três formas principais de declarar variáveis:

| Palavra-chave | Escopo | Observação                       |
|---------------|--------|----------------------------------|
| `var`         | função | legado, evitar em código moderno |
| `let`         | bloco  | variável mutável                 |
| `const`       | bloco  | valor constante                  |

Exemplo:

``` javascript
let nome = "Ana";
const idade = 20;

console.log(nome);
console.log(idade);
```

Boa prática:

-   usar **const por padrão**
-   usar **let quando o valor precisa mudar**

------------------------------------------------------------------------

## Tipos de Dados

JavaScript é **dinamicamente tipada**, ou seja, o tipo é definido em tempo de execução.

Tipos primitivos principais:

| Tipo      | Exemplo                      |
|-----------|------------------------------|
| string    | `"Olá"`                      |
| number    | `10`, `3.14`                 |
| boolean   | `true`, `false`              |
| null      | ausência de valor            |
| undefined | variável declarada sem valor |

Exemplo:

``` javascript
let nome = "Carlos";
let idade = 30;
let ativo = true;

console.log(typeof nome);
console.log(typeof idade);
console.log(typeof ativo);
```

------------------------------------------------------------------------

## Operadores Matemáticos {-}

| Operador | Descrição        |
|----------|------------------|
| `+`      | soma             |
| `-`      | subtração        |
| `*`      | multiplicação    |
| `/`      | divisão          |
| `%`      | resto da divisão |
| `**`     | potência         |

Exemplo:

``` javascript
let a = 10;
let b = 3;

console.log(a + b);
console.log(a % b);
console.log(a ** 2);
```

------------------------------------------------------------------------

## Operadores Relacionais {-}

| Operador | Significado                     |
|----------|---------------------------------|
| `>`      | maior                           |
| `<`      | menor                           |
| `>=`     | maior ou igual                  |
| `<=`     | menor ou igual                  |
| `==`     | igualdade (com coerção de tipo) |
| `===`    | igualdade estrita               |

Exemplo:

``` javascript
let x = 10;
let y = "10";

console.log(x == y);
console.log(x === y);
```

Boa prática: usar **sempre `===`**.

------------------------------------------------------------------------

## Operadores Lógicos {-}

| Operador          | Significado |     |     |
|-------------------|-------------|-----|-----|
| `&&`              | AND         |     |     |
| `|             |` | OR          |     |     |
| `!`               | NOT         |     |     |

Exemplo:

``` javascript
let idade = 20;
let possuiCarteira = true;

if (idade >= 18 && possuiCarteira) {
    console.log("Pode dirigir");
}
```

------------------------------------------------------------------------

## Estruturas Condicionais

### if / else {-}

``` javascript
let idade = 18;

if (idade >= 18) {
    console.log("Maior de idade");
} else {
    console.log("Menor de idade");
}
```

------------------------------------------------------------------------

### switch {-}

``` javascript
let dia = 2;

switch(dia){
    case 1:
        console.log("Segunda");
        break;
    case 2:
        console.log("Terça");
        break;
    default:
        console.log("Outro dia");
}
```

------------------------------------------------------------------------

## Estruturas de Repetição

### for {-}

``` javascript
for (let i = 0; i < 5; i++) {
    console.log(i);
}
```

------------------------------------------------------------------------

### while {-}

``` javascript
let i = 0;

while (i < 5) {
    console.log(i);
    i++;
}
```

------------------------------------------------------------------------

### for...of (muito comum em JavaScript) {-}

``` javascript
let numeros = [1,2,3,4];

for (let n of numeros) {
    console.log(n);
}
```

------------------------------------------------------------------------

## Funções

Funções podem ser declaradas de várias formas.

### Função tradicional {-}

``` javascript
function soma(a, b){
    return a + b;
}

console.log(soma(5,3));
```

------------------------------------------------------------------------

### Arrow Function {-}

Muito utilizada em aplicações Node.js modernas.

``` javascript
const soma = (a, b) => {
    return a + b;
};
```

Versão reduzida:

``` javascript
const soma = (a,b) => a + b;
```

## Arrow Functions em JavaScript

As **Arrow Functions** são uma forma mais concisa de declarar funções em JavaScript.  
Elas foram introduzidas no **ECMAScript 6 (ES6)** e são amplamente utilizadas em aplicações modernas, especialmente em projetos **Node.js**.

Seu principal objetivo é:

- reduzir a verbosidade da sintaxe
- tornar funções mais expressivas
- facilitar o uso de funções como argumentos (callbacks)
- preservar o contexto de `this`

---

### Funções tradicionais em JavaScript {-}

Antes do ES6, a forma mais comum de declarar funções era:


``` javascript
function soma(a, b) {
    return a + b;
}
```

Uso:


``` javascript
console.log(soma(2,3));
```

Esse modelo é muito semelhante ao que encontramos em linguagens como **C, Java ou C#**.

---

## Arrow Functions — Sintaxe Básica  {-}

A mesma função pode ser escrita usando **Arrow Function**:


``` javascript
const soma = (a, b) => {
    return a + b;
};
```

Uso:


``` javascript
console.log(soma(2,3));
```

Componentes da sintaxe:

```{}
(parametros) => { corpo da função }
```

---

## Versão simplificada  {-}

Quando a função possui **apenas uma expressão**, o `return` pode ser omitido:


``` javascript
const soma = (a, b) => a + b;
```

Esse estilo é muito comum em **Node.js**, especialmente em:

* callbacks
* manipulação de arrays
* APIs assíncronas

---

## Arrow Function com um único parâmetro {-}

Quando há apenas **um parâmetro**, os parênteses podem ser omitidos:


``` javascript
const quadrado = x => x * x;

console.log(quadrado(5));
```

---

## JavaScript {-}


``` javascript
(a, b) => a + b
```

JavaScript permite usar arrow functions **como qualquer outra função**, inclusive armazenando em variáveis.

---

## Uso com arrays (muito comum em Node.js) {-}

Arrow functions aparecem frequentemente em métodos de arrays.

Exemplo:

```javascript
let numeros = [1,2,3,4,5];

let dobrados = numeros.map(n => n * 2);

console.log(dobrados);
```

Equivalente com função tradicional:

```javascript
let dobrados = numeros.map(function(n){
    return n * 2;
});
```

A arrow function reduz bastante a quantidade de código.

---

## Arrow Functions e o comportamento de `this` {-}

Uma das diferenças mais importantes entre **funções tradicionais** e **arrow functions** é o comportamento de `this`.

### Função tradicional {-}

O valor de `this` depende de **como a função é chamada**.

### Arrow Function {-}

A arrow function **não cria seu próprio `this`**.
Ela utiliza o `this` do **escopo onde foi definida**.

Exemplo:

```javascript
const pessoa = {
    nome: "Ana",
    falar: function(){
        console.log(this.nome);
    }
};

pessoa.falar();
```

Agora usando arrow function:

```javascript
const pessoa = {
    nome: "Ana",
    falar: () => {
        console.log(this.nome);
    }
};
```

Nesse caso, `this` não se refere ao objeto `pessoa`.

Por isso:

**Arrow functions não devem ser usadas como métodos de objetos.**

---

### Quando usar Arrow Functions {-}

Arrow functions são ideais para:

* callbacks
* funções pequenas
* operações em arrays
* programação funcional
* manipulação de promessas
* código assíncrono

Exemplo comum em Node.js:

```javascript
setTimeout(() => {
    console.log("Executado após 2 segundos");
}, 2000);
```

---

### Quando NÃO usar Arrow Functions {-}

Evite usar arrow functions em:

* métodos de objetos
* construtores
* quando precisar de `this` dinâmico

Exemplo incorreto:

```javascript
const Usuario = (nome) => {
    this.nome = nome;
};
```

Arrow functions **não funcionam como construtores**.

### Conclusão {-}

Arrow functions são uma ferramenta essencial no desenvolvimento moderno com JavaScript e Node.js.
Elas permitem escrever código mais conciso e legível, especialmente em cenários com **callbacks, manipulação de dados e programação assíncrona**.


------------------------------------------------------------------------

## Arrays

Arrays armazenam coleções de valores.

``` javascript
let numeros = [10, 20, 30];

console.log(numeros[0]);
```

Iteração:

``` javascript
for (let n of numeros) {
    console.log(n);
}
```

------------------------------------------------------------------------

## Objetos

Objetos são estruturas chave-valor.

``` javascript
let usuario = {
    nome: "Ana",
    idade: 25,
    ativo: true
};

console.log(usuario.nome);
```

Iteração:

``` javascript
for (let chave in usuario){
    console.log(chave, usuario[chave]);
}
```

------------------------------------------------------------------------

## Template Strings

Permitem interpolação de variáveis.

``` javascript
let nome = "João";
let idade = 30;

console.log(`Nome: ${nome}, Idade: ${idade}`);
```

------------------------------------------------------------------------

## Módulos no Node.js

Node.js utiliza **módulos** para organizar código.

### Exportando {-}

``` javascript
function soma(a,b){
    return a+b;
}

module.exports = soma;
```

------------------------------------------------------------------------

### Importando {-}

``` javascript
const soma = require('./soma');

console.log(soma(2,3));
```

------------------------------------------------------------------------

### Boas práticas iniciais {-}

-   utilizar **const sempre que possível**
-   preferir **=== em vez de ==**
-   usar **arrow functions**
-   manter funções pequenas
-   organizar código em **módulos**

------------------------------------------------------------------------

### Executando programas Node.js

Estrutura típica:

```         
projeto/
 ├── index.js
 ├── utils.js
 └── package.json
```

Executar:

``` bash
node index.js
```

------------------------------------------------------------------------

### Próximos conceitos importantes em Node.js {-}

Após dominar a sintaxe básica, os próximos tópicos normalmente incluem:

-   JSON
-   manipulação de arquivos
-   módulos NPM
-   criação de servidores HTTP
-   Express
-   APIs REST
-   acesso a banco de dados

------------------------------------------------------------------------

## Atividade em Sala — Desafio JavaScript (Node.js)

**Disciplina:** Desenvolvimento Web Avançado\

------------------------------------------------------------------------

### Desafio: Construindo um Mini Processador de Dados {-}

Você recebeu um conjunto de dados simulando registros de usuários de um sistema.

``` javascript
const usuarios = [
  { nome: "Ana", idade: 20, ativo: true, compras: [100, 50, 25] },
  { nome: "Bruno", idade: 17, ativo: false, compras: [30, 20] },
  { nome: "Carlos", idade: 32, ativo: true, compras: [200, 150, 50, 100] },
  { nome: "Diana", idade: 25, ativo: true, compras: [] },
  { nome: "Eduardo", idade: 15, ativo: false, compras: [10] }
];
```

Seu objetivo é desenvolver um **script Node.js** que processe esses dados e gere relatórios.

------------------------------------------------------------------------

### Parte 1 — Total de Compras por Usuário {-}

Utilizando **arrow functions**, calcule o valor total de compras de cada usuário.

Resultado esperado:

```         
Ana: total = 175
Bruno: total = 50
Carlos: total = 500
Diana: total = 0
Eduardo: total = 10
```

------------------------------------------------------------------------

### Parte 2 — Usuários Ativos {-}

Utilizando **arrow functions**, filtre apenas os usuários que estão **ativos**.

Resultado esperado:

```         
Ana
Carlos
Diana
```

------------------------------------------------------------------------

### Parte 3 — Usuários Maiores de Idade {-}

Liste apenas usuários com **idade \>= 18**.

Utilize **arrow functions**.

------------------------------------------------------------------------

### Parte 4 — Usuário com Maior Volume de Compras {-}

Determine qual usuário possui o **maior total de compras**.

Resultado esperado (aproximado):

```         
Usuário com maior volume: Carlos
Total: 500
```

------------------------------------------------------------------------

### Parte 5 — Desafio de Coerção de Tipos {-}

Analise o seguinte código:

``` javascript
console.log("5" + 2);
console.log("5" - 2);
console.log(true + 1);
console.log(false == 0);
console.log(false === 0);
```

Explique **por que cada resultado ocorre**.

Dica: pesquise sobre **coerção de tipos em JavaScript**.

------------------------------------------------------------------------

### Parte 6 — Desafio Arrow Function vs Function {-}

Observe os dois códigos:

**Código 1**

``` javascript
const pessoa = {
  nome: "Maria",
  falar: function(){
    console.log(this.nome);
  }
};

pessoa.falar();
```

**Código 2**

``` javascript
const pessoa = {
  nome: "Maria",
  falar: () => {
    console.log(this.nome);
  }
};

pessoa.falar();
```

Execute os dois exemplos e responda:

1.  Qual deles funciona corretamente?
2.  Por que o outro não funciona?
3.  Qual é o comportamento de `this` em arrow functions?

------------------------------------------------------------------------

### Parte 7 — Desafio Final {-}

Crie uma função chamada `gerarRelatorio`.

Ela deve retornar um objeto contendo:

```         
{
 totalUsuarios: X,
 usuariosAtivos: X,
 usuariosInativos: X,
 mediaIdade: X,
 maiorComprador: "nome"
}
```

Utilize **arrow functions sempre que possível**.

Exemplo de saída:

``` javascript
{
 totalUsuarios: 5,
 usuariosAtivos: 3,
 usuariosInativos: 2,
 mediaIdade: 21.8,
 maiorComprador: "Carlos"
}
```

------------------------------------------------------------------------

### Regras do Desafio {-}

-   Utilize **arrow functions sempre que possível**
-   Utilize **arrays e objetos**
-   Utilize **console.log para exibir os resultados**
-   Não utilizar bibliotecas externas

------------------------------------------------------------------------

### Desafio Extra (para quem terminar antes) {-}

Implemente uma função que retorne:

-   o **usuário mais jovem**
-   o **usuário mais velho**
-   o **valor médio das compras por usuário**

Utilizando **arrow functions e métodos de array**.

------------------------------------------------------------------------

<!--chapter:end:02-aula.Rmd-->

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



<!--chapter:end:03-aula.Rmd-->

# Atividade avaliativa

Desenvolva, em JavaScript executado com *node.js*, um programa capaz de
processar os dados de um pequeno sistema de controle de participantes de
um evento de tecnologia.

Seu programa deverá trabalhar com um conjunto de participantes
previamente definido no código.

1.  Cada participante deve ser representado por um objeto contendo, no
    mínimo, as seguintes informações: nome; idade; curso; presença no
    evento (true ou false); Uma lista com três notas correspondentes ao
    desempenho em desafios práticos realizados durante a oficina.

``` javascript
const participante = {
  nome: "Ana",
  idade: 25,
  curso: "BES",
  presenca: true,
  notas = [7, 9, 8.1]
};
```

2.  Você deve criar um array com pelo menos cinco participantes
    diferentes;

3.  A partir desses dados, o programa deverá exibir no terminal um
    relatório organizado com as seguintes informações:

    > nome e curso de cada participante;
    >
    > média das três notas de cada participante;
    >
    > situação de cada participante de acordo com a média, considerando
    > “aprovado” para média maior ou igual a 7 e “em recuperação” para
    > média menor que 7;
    >
    > indicação de maioridade, informando se o participante é maior ou
    > menor de idade;
    >
    > indicação de presença, informando se compareceu ou faltou ao
    > evento.

4.  Além disso, seu programa deverá calcular e exibir:

    > a quantidade total de participantes cadastrados;
    >
    > a quantidade de participantes presentes;
    >
    > a quantidade de participantes ausentes;
    >
    > a média geral das notas de todos os participantes;
    >
    > o nome do participante com maior média;
    >
    > e uma lista contendo apenas os nomes dos participantes aprovados.

5.  Implemente pelo menos uma função tradicional e pelo menos uma arrow
    function. Uma das funções deve ser responsável por calcular a média
    de um participante, e outra deve ser usada em algum processamento
    sobre arrays, como seleção, transformação ou agregação de dados.

    -   Sempre que fizer sentido, utilize template strings para montar
        as mensagens exibidas no terminal.
    -   Durante o desenvolvimento, evite repetir código
        desnecessariamente.
    -   Organize o programa de modo legível, com nomes claros para
        variáveis e funções.
    -   O uso de estruturas como for, for...of, if, operadores lógicos e
        métodos de array pode ser combinado conforme a sua estratégia de
        solução.

Ao final, entregue apenas o conteúdo (copie e cole o script) do arquivo
.js gerado, contendo todo o código-fonte. O programa deve executar sem
erros com o comando node script.js.

A avaliação considerará:

A)  o funcionamento correto do programa;

B)  o uso adequado dos conceitos básicos de JavaScript;

C)  a clareza da solução e a organização do código.

## Código resposta
O código da atividade está disponível na pasta de códigos do repositório de aula: [Para ver o código, clique AQUI](https://github.com/costasilvati/DesWebAvancado/blob/main/codigos/atividadde1/script.js)

<!--chapter:end:04-aula.Rmd-->

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

<!--chapter:end:05-aula.Rmd-->

# Lista de Atividades — Estudo JavaScript (NodeJS)

**Disciplina:** Desenvolvimento Web Avançado  
**Objetivo:** Reforçar os conceitos básicos de JavaScript aplicados ao desenvolvimento back-end  

---

## Instruções

- Desenvolver os exercícios em Node.js  
- Utilizar `console.log()` para exibir resultados  
- Criar um único arquivo `lista_revisao.js` ou arquivos separados  
- Não utilizar bibliotecas externas  

---

1. Declare três variáveis: nome, idade e curso. Exiba uma frase com template string.

2. Dado um número, verifique se ele é:
   - positivo
   - negativo
   - zero

3. Crie um programa que calcule a média de três notas e informe:
   - aprovado (>= 7)
   - reprovado (< 7)

4. Verifique se uma pessoa pode dirigir considerando:
   - idade >= 18
   - possui carteira (true/false)

---

5. Crie um array com 5 números e exiba todos usando `for...of`.

6. Calcule a soma dos valores de um array manualmente (sem reduce).

7. Conte quantos números são pares em um array.

8. Dado um array de números, crie outro array contendo apenas os números maiores que 10.

---

9. Crie um objeto `produto` com:
   - nome
   - preço
   - quantidade  

Exiba o valor total em estoque.

---

10. Crie um array de objetos representando alunos:

```javascript
{ nome: "Ana", notas: [7,8,9] }
````

Exiba o nome de cada aluno.

---

11. Para cada aluno, calcule a média das notas.

---

12. Crie uma função tradicional que calcule a média de um array.

13. Reescreva a função usando arrow function.

14. Crie uma função que receba um produto e retorne:

* "estoque baixo" (quantidade < 5)
* "estoque ok"

---

15. Dado um array de números, utilize `map` para gerar o dobro de cada valor.

16. Utilize `filter` para retornar apenas números pares.

17. Utilize `reduce` para calcular a soma de um array.

---

18. Dado um array de produtos:

```javascript
{ nome: "Notebook", preco: 2000 }
```

Calcule o valor total usando `reduce`.

---

19. Dado um array de alunos:

```javascript
{ nome: "Ana", notas: [7,8,9] }
```

Crie um novo array contendo:

```javascript
{ nome: "Ana", media: X }
```

---

20. Filtre apenas alunos com média >= 7.

---

21. Gere uma lista apenas com os nomes dos aprovados.

---

22. Crie um sistema simples de produtos:

```javascript
{ nome, preco, quantidade }
```

O programa deve:

* exibir todos os produtos
* calcular valor total de cada produto
* identificar produtos com estoque baixo
* calcular valor total do estoque
* encontrar o produto mais caro

---

23. Dado um array de usuários:

```javascript
{ nome, idade, ativo }
```

O programa deve:

* listar usuários ativos
* contar quantos estão ativos
* calcular média de idade
* listar apenas maiores de idade

---

24. Crie um sistema de pedidos:

```javascript
{ cliente, total, status }
```

O programa deve:

* listar pedidos aprovados
* calcular total de vendas
* agrupar por cliente
* identificar cliente que mais comprou

---

## Dica importante

Se você não souber por onde começar:

1. Resolva com `for` primeiro
2. Depois refatore usando `map`, `filter` e `reduce`

---

<!--chapter:end:05-lista_de_estudo.Rmd-->

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

<!--chapter:end:06-aula.Rmd-->

# NPM, JSON e organização de projetos Node JS

Neste capítulo, vamos estudar o uso do **NPM** em projetos Node.js, a configuração do arquivo `package.json`, o uso de scripts como `npm start`, a instalação de dependências, o uso do `nodemon`, além da manipulação de dados em formato JSON. O conteúdo dá continuidade à criação de servidores HTTP com Node.js, seguindo a abordagem apresentada por Lecheta [@lecheta_node] e complementada pela documentação oficial do Node.js e do NPM [@node_npm; @npm_package_json].

## O que é o NPM

O **NPM** (*Node Package Manager*) é o gerenciador de pacotes padrão do Node.js. Ele permite criar projetos, instalar bibliotecas, gerenciar dependências e configurar comandos de execução.

Segundo a documentação oficial do Node.js, o NPM surgiu como ferramenta para baixar e gerenciar dependências de projetos Node.js, mas atualmente também é amplamente utilizado em aplicações JavaScript front-end e back-end [@node_npm].

Em um projeto Node.js, o NPM é usado principalmente para:

- criar o arquivo `package.json`;
- instalar bibliotecas externas;
- registrar dependências do projeto;
- executar comandos personalizados;
- facilitar o compartilhamento e a execução do projeto em outros computadores.

## Criando um projeto com npm init

O comando `npm init` é utilizado para iniciar um projeto Node.js e criar o arquivo `package.json`. Esse arquivo armazena informações importantes sobre o projeto, como nome, versão, arquivo principal, scripts e dependências.

Para criar um novo projeto, crie uma pasta e execute:

```bash
mkdir projeto-npm
cd projeto-npm
npm init
````

O NPM fará algumas perguntas, como:

```text
package name:
version:
description:
entry point:
test command:
git repository:
keywords:
author:
license:
```

Caso você queira criar o projeto rapidamente, aceitando os valores padrão, utilize:

```bash
npm init -y
```

De acordo com a documentação do NPM, o comando `npm init --yes` cria automaticamente um arquivo `package.json` com valores padrão extraídos do diretório atual [@npm_init].

Um exemplo simples de `package.json` gerado é:

```json
{
  "name": "projeto-npm",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "keywords": [],
  "author": "",
  "license": "ISC"
}
```

## O arquivo package.json

O `package.json` descreve o projeto Node.js. A documentação oficial do Node.js define um pacote como uma árvore de diretórios descrita por um arquivo `package.json` [@node_packages].

Os campos mais comuns são:

```json
{
  "name": "api-carros",
  "version": "1.0.0",
  "description": "Servidor HTTP para gerenciamento de carros",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "dependencies": {},
  "devDependencies": {}
}
```

Os campos principais são:

* `name`: nome do projeto;
* `version`: versão do projeto;
* `description`: breve descrição;
* `main`: arquivo principal da aplicação;
* `scripts`: comandos personalizados que podem ser executados pelo NPM;
* `dependencies`: bibliotecas necessárias para executar o projeto;
* `devDependencies`: bibliotecas usadas apenas durante o desenvolvimento.

## Configurando npm start

O comando `npm start` executa o script chamado `start` definido no `package.json`.

Considerando o projeto de gerenciamento de carros desenvolvido anteriormente, com o arquivo principal chamado `server.js`, podemos editar o `package.json` da seguinte forma:

```json
{
  "name": "api-carros",
  "version": "1.0.0",
  "description": "Servidor HTTP para gerenciamento de carros",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "author": "Seu nome",
  "license": "ISC"
}
```

Depois disso, em vez de executar:

```bash
node server.js
```

podemos executar:

```bash
npm start
```

Esse comando é muito útil porque padroniza a forma de iniciar o projeto. Assim, mesmo que o arquivo principal mude de nome, basta atualizar o campo `scripts`.

Por exemplo, se o arquivo principal fosse `app.js`, bastaria configurar:

```json
"scripts": {
  "start": "node app.js"
}
```

E o comando continuaria sendo:

```bash
npm start
```

## Usando npm start no projeto de carros

No projeto anterior, o servidor HTTP respondia rotas como:

```text
/carros/classicos
/carros/esportivos
/carros/luxo
```

Suponha que a estrutura do projeto esteja assim:

```text
api-carros/
├── package.json
├── server.js
├── classicos.json
├── esportivos.json
└── luxo.json
```

O arquivo `server.js` pode conter:

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

Para iniciar esse projeto com NPM, o arquivo `package.json` deve conter:

```json
{
  "name": "api-carros",
  "version": "1.0.0",
  "description": "API simples de carros usando Node.js",
  "main": "server.js",
  "scripts": {
    "start": "node server.js"
  },
  "author": "",
  "license": "ISC"
}
```

Depois, execute:

```bash
npm start
```

## O problema de reiniciar o servidor manualmente

Durante o desenvolvimento, sempre que alteramos o arquivo `server.js`, precisamos parar o servidor e iniciar novamente.

Normalmente, fazemos isso com:

```bash
Ctrl + C
node server.js
```

Esse processo é repetitivo e pouco produtivo. Para resolver esse problema, podemos utilizar uma ferramenta que reinicia automaticamente o servidor sempre que algum arquivo é alterado.

## Instalando e usando nodemon

O `nodemon` é uma ferramenta usada em desenvolvimento para reiniciar automaticamente aplicações Node.js quando os arquivos do projeto são modificados. Ele é útil durante a criação de APIs, pois evita reiniciar manualmente o servidor a cada alteração.

Para instalar o `nodemon` como dependência de desenvolvimento, execute:

```bash
npm install nodemon --save-dev
```

A opção `--save-dev` indica que a biblioteca será usada apenas no desenvolvimento, sendo registrada em `devDependencies`.

O `package.json` ficará parecido com:

```json
{
  "name": "api-carros",
  "version": "1.0.0",
  "description": "API simples de carros usando Node.js",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "devDependencies": {
    "nodemon": "^3.0.0"
  }
}
```

Agora o projeto pode ser executado em modo desenvolvimento com:

```bash
npm run dev
```

Observe que:

* `npm start` executa o script `start`;
* outros scripts, como `dev`, devem ser executados com `npm run`.

Assim, usamos:

```bash
npm start
```

para execução normal, e:

```bash
npm run dev
```

para desenvolvimento com reinicialização automática.

## O comando npm install

O comando `npm install` é usado para instalar dependências em um projeto Node.js.

Uma dependência é uma biblioteca externa usada pelo projeto. Por exemplo, quando instalamos `nodemon`, estamos adicionando uma ferramenta externa ao projeto.

Para instalar uma biblioteca, usamos:

```bash
npm install nome-da-biblioteca
```

Exemplo:

```bash
npm install express
```

Ao executar esse comando, o NPM normalmente realiza três ações:

* cria ou atualiza a pasta `node_modules`;
* registra a dependência no `package.json`;
* cria ou atualiza o arquivo `package-lock.json`.

A pasta `node_modules` contém os arquivos das bibliotecas instaladas. O arquivo `package-lock.json` registra exatamente as versões instaladas, ajudando a manter consistência entre diferentes ambientes.

## dependencies e devDependencies

O NPM separa as dependências em dois grupos principais:

```json
"dependencies": {}
```

e:

```json
"devDependencies": {}
```

As `dependencies` são necessárias para a aplicação funcionar em produção. As `devDependencies` são usadas apenas durante o desenvolvimento.

Segundo a documentação do NPM, dependências podem ser adicionadas ao campo `dependencies` com `npm install <package-name>`, comportamento padrão atual, ou explicitamente com `--save-prod`. Para dependências de desenvolvimento, utiliza-se `--save-dev` [@npm_dependencies].

Exemplo de dependência de produção:

```bash
npm install express
```

ou:

```bash
npm install express --save
```

Em versões atuais do NPM, o `--save` é o comportamento padrão para dependências de produção.

Exemplo de dependência de desenvolvimento:

```bash
npm install nodemon --save-dev
```

O resultado no `package.json` pode ser:

```json
{
  "dependencies": {
    "express": "^4.18.0"
  },
  "devDependencies": {
    "nodemon": "^3.0.0"
  }
}
```

## Instalando dependências de um projeto existente

Quando recebemos um projeto Node.js que já possui `package.json`, normalmente não precisamos copiar a pasta `node_modules`.

Basta executar:

```bash
npm install
```

Esse comando lê o arquivo `package.json` e instala todas as dependências necessárias.

Por isso, em projetos versionados no GitHub, normalmente a pasta `node_modules` não é enviada. Em vez disso, o projeto contém:

```text
package.json
package-lock.json
```

E cada desenvolvedor executa:

```bash
npm install
```

para reconstruir o ambiente local.

## O que é JSON

**JSON** significa *JavaScript Object Notation*. É um formato textual para representação e troca de dados. Apesar de sua sintaxe ser inspirada em objetos JavaScript, JSON é independente de linguagem e pode ser usado por sistemas escritos em Java, Python, PHP, C#, JavaScript e outras linguagens.

JSON é muito utilizado em APIs porque é:

* leve;
* legível;
* fácil de gerar;
* fácil de interpretar;
* compatível com diversas linguagens.

Um exemplo de JSON é:

```json
{
  "nome": "Ana",
  "sobrenome": "Silva",
  "idade": 25
}
```

Um array JSON pode ser representado assim:

```json
[
  {
    "nome": "Ana",
    "sobrenome": "Silva"
  },
  {
    "nome": "Carlos",
    "sobrenome": "Souza"
  }
]
```

Segundo a MDN, `JSON.parse()` interpreta uma string JSON e constrói o valor ou objeto JavaScript correspondente [@mdn_json_parse]. Já `JSON.stringify()` converte um valor JavaScript para uma string JSON [@mdn_json_stringify].

## Criando um novo projeto Node.js com NPM e nodemon

Agora vamos criar um novo projeto Node.js do zero, usando NPM e `nodemon`.

Crie a pasta:

```bash
mkdir projeto-json-node
cd projeto-json-node
```

Inicialize o projeto:

```bash
npm init -y
```

Instale o `nodemon` como dependência de desenvolvimento:

```bash
npm install nodemon --save-dev
```

Crie o arquivo principal:

```bash
touch server.js
```

Edite o `package.json`:

```json
{
  "name": "projeto-json-node",
  "version": "1.0.0",
  "description": "Projeto introdutório com Node.js, NPM e JSON",
  "main": "server.js",
  "scripts": {
    "start": "node server.js",
    "dev": "nodemon server.js"
  },
  "devDependencies": {
    "nodemon": "^3.0.0"
  }
}
```

Agora podemos executar:

```bash
npm run dev
```

## Retornando texto simples na resposta

No arquivo `server.js`, crie um servidor HTTP simples:

```javascript
const http = require('node:http');

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain; charset=utf-8');
  res.end('Servidor Node.js funcionando!');
});

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
```

Neste exemplo, usamos:

```javascript
res.setHeader('Content-Type', 'text/plain; charset=utf-8');
```

Esse cabeçalho informa ao cliente que a resposta enviada é texto simples.

Acesse:

```text
http://localhost:3000
```

## Retornando JSON na resposta

Para retornar JSON, alteramos o tipo de conteúdo para:

```javascript
application/json
```

Exemplo:

```javascript
const http = require('node:http');

const server = http.createServer((req, res) => {
  const resposta = {
    mensagem: 'Servidor Node.js funcionando!',
    status: 'ok'
  };

  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  res.end(JSON.stringify(resposta));
});

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
```

Nesse caso, `resposta` é um objeto JavaScript. Para enviá-lo pela rede como JSON, usamos:

```javascript
JSON.stringify(resposta)
```

## Convertendo objetos JavaScript em JSON

Um objeto JavaScript pode ser convertido para JSON usando `JSON.stringify()`.

```javascript
const pessoa = {
  nome: 'Ana',
  sobrenome: 'Silva'
};

const pessoaJson = JSON.stringify(pessoa);

console.log(pessoaJson);
```

Saída:

```json
{"nome":"Ana","sobrenome":"Silva"}
```

A MDN define `JSON.stringify()` como o método que converte um valor JavaScript em uma string JSON [@mdn_json_stringify].

## Convertendo arrays JavaScript em JSON

Também podemos converter arrays:

```javascript
const pessoas = [
  { nome: 'Ana', sobrenome: 'Silva' },
  { nome: 'Carlos', sobrenome: 'Souza' }
];

const pessoasJson = JSON.stringify(pessoas);

console.log(pessoasJson);
```

Saída:

```json
[
  {"nome":"Ana","sobrenome":"Silva"},
  {"nome":"Carlos","sobrenome":"Souza"}
]
```

Na prática, quando uma API retorna uma lista de registros, ela normalmente está retornando um array convertido para JSON.

## Convertendo JSON em objeto JavaScript

Quando recebemos uma string JSON, podemos transformá-la em objeto JavaScript usando `JSON.parse()`.

```javascript
const textoJson = '{"nome":"Ana","sobrenome":"Silva"}';

const objeto = JSON.parse(textoJson);

console.log(objeto.nome);
console.log(objeto.sobrenome);
```

Segundo a MDN, `JSON.parse()` interpreta uma string JSON e constrói o valor JavaScript correspondente [@mdn_json_parse].

## Trabalhando com classes e JSON

Classes também podem ser usadas em conjunto com JSON. Quando criamos um objeto a partir de uma classe, podemos convertê-lo para JSON com `JSON.stringify()`.

```javascript
class Pessoa {
  constructor(nome, sobrenome) {
    this.nome = nome;
    this.sobrenome = sobrenome;
  }

  nomeCompleto() {
    return `${this.nome} ${this.sobrenome}`;
  }
}

const pessoa = new Pessoa('Ana', 'Silva');

console.log(pessoa.nomeCompleto());
console.log(JSON.stringify(pessoa));
```

A saída do `JSON.stringify()` será:

```json
{"nome":"Ana","sobrenome":"Silva"}
```

Observe que o método `nomeCompleto()` não aparece no JSON. Isso acontece porque JSON representa dados, não comportamentos. Métodos pertencem à classe/protótipo, mas não são serializados como parte dos dados.

## Criando uma classe em arquivo separado

Em projetos Node.js, é comum separar responsabilidades em arquivos diferentes. Vamos criar uma classe `Pessoa` em um arquivo separado.

Estrutura do projeto:

```text
projeto-json-node/
├── package.json
├── server.js
└── Pessoa.js
```

Crie o arquivo `Pessoa.js`:

```javascript
class Pessoa {
  constructor(nome, sobrenome) {
    this.nome = nome;
    this.sobrenome = sobrenome;
  }

  nomeCompleto() {
    return `${this.nome} ${this.sobrenome}`;
  }
}

module.exports = Pessoa;
```

O comando:

```javascript
module.exports = Pessoa;
```

exporta a classe para que ela possa ser usada em outros arquivos. Na documentação do Node.js, esse padrão faz parte do sistema de módulos CommonJS, no qual valores são exportados por `module.exports` e importados com `require()` [@node_commonjs].

## Usando a classe no arquivo principal

Agora edite o arquivo `server.js`:

```javascript
const http = require('node:http');
const Pessoa = require('./Pessoa');

const server = http.createServer((req, res) => {
  const pessoa = new Pessoa('Ana', 'Silva');

  const resposta = {
    nome: pessoa.nome,
    sobrenome: pessoa.sobrenome,
    nomeCompleto: pessoa.nomeCompleto()
  };

  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json; charset=utf-8');
  res.end(JSON.stringify(resposta));
});

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
```

Agora execute:

```bash
npm run dev
```

E acesse:

```text
http://localhost:3000
```

A resposta será:

```json
{
  "nome": "Ana",
  "sobrenome": "Silva",
  "nomeCompleto": "Ana Silva"
}
```

## Criando uma rota para listar pessoas

Podemos evoluir o servidor para responder diferentes rotas.

```javascript
const http = require('node:http');
const Pessoa = require('./Pessoa');

const pessoas = [
  new Pessoa('Ana', 'Silva'),
  new Pessoa('Carlos', 'Souza'),
  new Pessoa('Mariana', 'Oliveira')
];

const server = http.createServer((req, res) => {
  const url = new URL(`http://localhost:3000${req.url}`);
  const rota = url.pathname;

  res.setHeader('Content-Type', 'application/json; charset=utf-8');

  if (rota === '/') {
    res.statusCode = 200;
    res.end(JSON.stringify({ mensagem: 'API de pessoas' }));
  } else if (rota === '/pessoas') {
    const resposta = pessoas.map(pessoa => ({
      nome: pessoa.nome,
      sobrenome: pessoa.sobrenome,
      nomeCompleto: pessoa.nomeCompleto()
    }));

    res.statusCode = 200;
    res.end(JSON.stringify(resposta));
  } else {
    res.statusCode = 404;
    res.end(JSON.stringify({ erro: 'Rota não encontrada' }));
  }
});

server.listen(3000, () => {
  console.log('Servidor executando em http://localhost:3000');
});
```

Neste exemplo:

* a classe `Pessoa` está em um arquivo separado;
* o arquivo principal importa a classe com `require`;
* a rota `/pessoas` retorna um array JSON;
* `map()` é usado para converter objetos da classe em objetos simples para resposta.

<!--
## Considerações finais

Neste capítulo, estudamos como o NPM organiza projetos Node.js, como configurar scripts no `package.json`, como instalar dependências e como usar ferramentas de desenvolvimento como o `nodemon`.

Também revisamos o uso de JSON, essencial para APIs REST, e vimos como objetos, arrays e instâncias de classes podem ser convertidos para respostas JSON usando `JSON.stringify()`.

Esses conceitos são fundamentais para avançar para frameworks como Express, pois a criação de APIs modernas depende diretamente de:

* organização de projeto;
* dependências;
* scripts de execução;
* módulos;
* JSON;
* rotas;
* respostas HTTP.-->

## Referências {-}

<!--chapter:end:07-npm-JSON.Rmd-->

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

<!--chapter:end:08-express.Rmd-->

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

<!--chapter:end:09-database.Rmd-->

# APIs Node JS com JWT

[Código da aula anterior](https://github.com/costasilvati/DesWebAvancado/blob/main/codigos/26052026_api-express.zip)

Neste capítulo vamos estudar como proteger rotas de uma API Node.js utilizando **JWT** (*JSON Web Token*), **Express** e o middleware **express-jwt**. O objetivo é compreender como funciona a autenticação baseada em token e aplicar esse conceito ao sistema de carros desenvolvido no capítulo anterior, que já possui conexão com banco de dados.

A autenticação é uma etapa essencial no desenvolvimento de APIs, pois permite verificar a identidade de um usuário antes de liberar o acesso a determinados recursos. Em APIs REST, é comum utilizar autenticação baseada em token, especialmente com JWT, porque esse modelo é compacto, independente de sessão e adequado para arquiteturas stateless [@rocketseat_jwt_node; @w3schools_express_jwt].

## O que é autenticação

Autenticação é o processo de verificar se um usuário é quem afirma ser. Em sistemas web, isso normalmente ocorre por meio de credenciais, como e-mail e senha.

Um fluxo simples de autenticação funciona assim:

1. O usuário envia e-mail e senha para uma rota de login.
2. A API verifica se os dados estão corretos.
3. Se as credenciais forem válidas, a API gera um token.
4. O cliente armazena esse token.
5. Em novas requisições, o cliente envia o token.
6. A API valida o token antes de permitir acesso à rota protegida.

Esse modelo evita que o servidor precise manter uma sessão ativa para cada usuário, o que combina bem com APIs REST.

## O que é token

Um **token** é uma credencial digital temporária usada para representar uma autorização de acesso. Em uma API, o token funciona como uma espécie de “comprovante” de que o usuário já realizou login.

Depois que o usuário autentica, ele não precisa enviar e-mail e senha em todas as requisições. Em vez disso, envia o token no cabeçalho HTTP.

Exemplo de cabeçalho:

```http
Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6...
````

A palavra `Bearer` indica que o cliente está enviando um token de acesso.

## O que é JWT

**JWT** significa **JSON Web Token**. Trata-se de um padrão para representar informações de forma segura entre duas partes. Um JWT é composto por três partes separadas por ponto:

```text
header.payload.signature
```

Exemplo simplificado:

```text
xxxxx.yyyyy.zzzzz
```

As três partes são:

* **Header**: informa o tipo do token e o algoritmo de assinatura.
* **Payload**: contém os dados, também chamados de *claims*.
* **Signature**: assinatura usada para verificar se o token foi alterado.

O payload pode conter informações como:

```json
{
  "id": 1,
  "email": "admin@email.com",
  "perfil": "admin"
}
```

É importante destacar que o payload do JWT não deve armazenar informações sensíveis, como senhas. O token é assinado, mas seu conteúdo pode ser decodificado por qualquer pessoa que o possua. A segurança do JWT está principalmente na assinatura e na validação do token [@rocketseat_jwt_node; @w3schools_express_jwt].

## Como APIs utilizam token

Em APIs REST, o token normalmente é usado para proteger rotas privadas. O fluxo mais comum é:

1. O usuário faz login na rota `/login`.
2. A API gera um JWT.
3. O cliente recebe o token.
4. O cliente envia o token nas próximas requisições.
5. A API valida o token antes de executar operações protegidas.

Exemplo de requisição protegida:

```http
DELETE /carros/3 HTTP/1.1
Authorization: Bearer token_aqui
```

Se o token for válido, a API permite a operação. Caso contrário, retorna erro de autenticação, normalmente com status `401 Unauthorized`.

## Instalando as dependências

No projeto de carros criado anteriormente, instale as bibliotecas necessárias:

```bash
npm install jsonwebtoken express-jwt
```

A biblioteca `jsonwebtoken` será usada para gerar o token no login. A biblioteca `express-jwt` será usada como middleware para validar o token nas rotas protegidas. Segundo a documentação do pacote, `express-jwt` fornece um middleware Express para validar JWTs e disponibilizar o payload decodificado na requisição [@express_jwt_npm].

## Estrutura do projeto

Vamos considerar a seguinte estrutura:

```text
api-carros/
├── database/
│   └── connection.js
├── middleware/
│   └── auth.js
├── models/
│   └── Carro.js
├── routes/
│   ├── auth.js
│   └── carros.js
├── package.json
└── server.js
```

Neste capítulo, vamos adicionar:

* uma rota de login;
* um middleware de autenticação;
* proteção das rotas `POST`, `PUT` e `DELETE`.

As rotas `GET` continuarão públicas, pois representam apenas consulta.

## Criando a tabela de usuários

Para autenticar usuários, precisamos de uma tabela no banco de dados.

```sql
USE api_carros;

CREATE TABLE usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) NOT NULL UNIQUE,
    senha VARCHAR(100) NOT NULL
);
```

Vamos inserir um usuário inicial:

```sql
INSERT INTO usuarios (nome, email, senha)
VALUES ('Administrador', 'admin@email.com', '123456');
```

Neste exemplo, a senha foi salva em texto puro apenas para fins didáticos. Em sistemas reais, senhas devem ser armazenadas com hash, usando bibliotecas como `bcrypt`.

## Criando o arquivo de configuração do token

Para gerar e validar tokens, precisamos de uma chave secreta.

Crie o arquivo:

```text
middleware/auth.js
```

Conteúdo:

```javascript
const { expressjwt } = require('express-jwt');

const segredo = 'chave_secreta_da_api';

const protegerRota = expressjwt({
  secret: segredo,
  algorithms: ['HS256']
});

module.exports = {
  segredo,
  protegerRota
};
```

A função `expressjwt()` cria um middleware que valida o token recebido no cabeçalho `Authorization`. O algoritmo `HS256` é um algoritmo simétrico, no qual a mesma chave é usada para assinar e verificar o token [@express_jwt_npm].

## Criando a rota de login

Crie o arquivo:

```text
routes/auth.js
```

Conteúdo:

```javascript
const express = require('express');
const jwt = require('jsonwebtoken');

const router = express.Router();

const connection = require('../database/connection');
const { segredo } = require('../middleware/auth');

router.post('/login', (req, res) => {

  const { email, senha } = req.body;

  const sql = 'SELECT * FROM usuarios WHERE email = ? AND senha = ?';

  connection.query(sql, [email, senha], (erro, resultados) => {

    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao autenticar usuário'
      });
    }

    if (resultados.length === 0) {
      return res.status(401).json({
        erro: 'E-mail ou senha inválidos'
      });
    }

    const usuario = resultados[0];

    const token = jwt.sign(
      {
        id: usuario.id,
        nome: usuario.nome,
        email: usuario.email
      },
      segredo,
      {
        expiresIn: '1h'
      }
    );

    res.json({
      mensagem: 'Login realizado com sucesso',
      token: token
    });

  });

});

module.exports = router;
```

Neste código:

* `req.body` lê o JSON enviado pelo cliente;
* o banco é consultado para verificar e-mail e senha;
* `jwt.sign()` gera o token;
* `expiresIn: '1h'` define validade de uma hora;
* a resposta retorna o token para o cliente.

## Configurando a rota de autenticação no servidor

No arquivo `server.js`, importe e use a rota de autenticação.

```javascript
const express = require('express');

const app = express();

const carrosRoutes = require('./routes/carros');
const authRoutes = require('./routes/auth');

app.use(express.json());

app.use('/auth', authRoutes);
app.use('/carros', carrosRoutes);

app.listen(3000, () => {
  console.log('Servidor executando na porta 3000');
});
```

Agora a rota de login será:

```text
POST http://localhost:3000/auth/login
```

## Testando o login

Envie a seguinte requisição:

```http
POST /auth/login HTTP/1.1
Content-Type: application/json

{
  "email": "admin@email.com",
  "senha": "123456"
}
```

Resposta esperada:

```json
{
  "mensagem": "Login realizado com sucesso",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6..."
}
```

Esse token será usado para acessar rotas protegidas.

## Protegendo rotas da API de carros

No capítulo anterior, criamos rotas para:

* listar carros;
* buscar carro por ID;
* inserir carro;
* atualizar carro;
* remover carro.

Agora vamos permitir que qualquer usuário consulte os carros, mas apenas usuários autenticados possam inserir, atualizar ou remover registros.

Arquivo:

```text
routes/carros.js
```

```javascript
const express = require('express');

const router = express.Router();

const Carro = require('../models/Carro');
const { protegerRota } = require('../middleware/auth');

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

    if (resultados.length === 0) {
      return res.status(404).json({
        erro: 'Carro não encontrado'
      });
    }

    res.json(resultados[0]);

  });

});

router.post('/', protegerRota, (req, res) => {

  Carro.inserir(req.body, (erro, resultado) => {

    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao inserir carro'
      });
    }

    res.status(201).json({
      mensagem: 'Carro inserido com sucesso',
      idInserido: resultado.insertId
    });

  });

});

router.put('/:id', protegerRota, (req, res) => {

  Carro.atualizar(req.params.id, req.body, (erro, resultado) => {

    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao atualizar carro'
      });
    }

    res.json({
      mensagem: 'Carro atualizado com sucesso'
    });

  });

});

router.delete('/:id', protegerRota, (req, res) => {

  Carro.remover(req.params.id, (erro, resultado) => {

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

module.exports = router;
```

Observe que o middleware `protegerRota` foi inserido apenas nas rotas:

```javascript
router.post('/', protegerRota, ...)
router.put('/:id', protegerRota, ...)
router.delete('/:id', protegerRota, ...)
```

Assim, as rotas `GET` continuam públicas, enquanto as operações que modificam o banco exigem autenticação.

## Enviando o token nas requisições protegidas

Depois de realizar o login, copie o token retornado e envie no cabeçalho:

```http
Authorization: Bearer SEU_TOKEN_AQUI
```

Exemplo com `curl`:

```bash
curl -X POST http://localhost:3000/carros \
-H "Content-Type: application/json" \
-H "Authorization: Bearer SEU_TOKEN_AQUI" \
-d "{\"nome\":\"Gol\",\"marca\":\"Volkswagen\",\"ano\":2020,\"preco\":50000}"
```

Se o token for válido, o carro será inserido.

Se o token não for enviado, a API retornará erro.

## Tratando erro de autenticação

Por padrão, quando o token é inválido ou ausente, o middleware gera um erro. Podemos tratar esse erro no `server.js`.

```javascript
const express = require('express');

const app = express();

const carrosRoutes = require('./routes/carros');
const authRoutes = require('./routes/auth');

app.use(express.json());

app.use('/auth', authRoutes);
app.use('/carros', carrosRoutes);

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

Esse middleware de erro torna a resposta mais clara para o cliente.

## Consultando o usuário autenticado

Quando o token é validado, o `express-jwt` disponibiliza os dados decodificados do token na requisição. Em versões atuais, por padrão, o payload fica em:

```javascript
req.auth
```

Exemplo:

```javascript
router.post('/', protegerRota, (req, res) => {

  console.log(req.auth);

  Carro.inserir(req.body, (erro, resultado) => {

    if (erro) {
      return res.status(500).json({
        erro: 'Erro ao inserir carro'
      });
    }

    res.status(201).json({
      mensagem: `Carro inserido pelo usuário ${req.auth.email}`,
      idInserido: resultado.insertId
    });

  });

});
```

Isso permite saber qual usuário realizou determinada operação.

## Melhorando a segurança

O exemplo anterior é didático. Em uma aplicação real, alguns cuidados são indispensáveis.

### Não salvar senha em texto puro

Senhas não devem ser salvas diretamente no banco de dados.

Em sistemas reais, utilize hash de senha:

```bash
npm install bcrypt
```

### Não deixar a chave secreta no código

A chave secreta do JWT deve ficar em variável de ambiente.

Exemplo:

```javascript
const segredo = process.env.JWT_SECRET;
```

### Usar HTTPS em produção

Tokens não devem trafegar em conexões inseguras. Em produção, utilize HTTPS.

### Definir tempo de expiração

Tokens devem ter tempo de validade limitado:

```javascript
expiresIn: '1h'
```

Esse cuidado reduz riscos caso o token seja exposto.

## Fluxo completo da autenticação

O fluxo final da API pode ser resumido assim:

1. Cliente envia `POST /auth/login`.
2. API verifica e-mail e senha no banco.
3. API gera JWT.
4. Cliente armazena o token.
5. Cliente envia o token no cabeçalho `Authorization`.
6. Middleware `express-jwt` valida o token.
7. Se válido, a rota é executada.
8. Se inválido, a API retorna `401`.

## Considerações finais

Neste capítulo estudamos autenticação baseada em token utilizando JWT em uma API Node.js com Express. Vimos que o JWT permite proteger rotas sem armazenar sessões no servidor, o que se ajusta bem ao modelo REST.

Também adaptamos a API de carros para que:

* as rotas `GET` sejam públicas;
* as rotas `POST`, `PUT` e `DELETE` sejam protegidas;
* o login gere um token;
* o token seja validado por middleware;
* a API responda com status adequado em caso de token inválido.

Esses conceitos são fundamentais para avançar no desenvolvimento de APIs completas, seguras e próximas de aplicações reais.

## Referências

<!--chapter:end:10-atentica.Rmd-->

# Projeto Final — API de Controle Financeiro {#projeto-api-financas}

**Disciplina:** Programação Web Back-end
**Tipo:** Projeto avaliativo (enunciado)
**Tecnologias obrigatórias:** Node.js, NPM, Express, MySQL (driver `mysql2`), autenticação com JWT (`jsonwebtoken` + `express-jwt`) e `bcrypt`
**Modalidade:** grupos de até 3 pessoas
**Pré-requisitos:** todos os capítulos anteriores deste livro, em especial [Web Services](web-services.html), [NPM, JSON e organização de projetos Node JS](npm-json-e-organiza%C3%A7%C3%A3o-de-projetos-node-js.html), [Express Framework](express-framework.html), [Integração de APIs Node.js com Banco de Dados](integra-de-apis-node.js-com-banco-de-dados.html), [APIs Node JS com JWT](apis-node-js-com-jwt.html) e [Loja de carros com clientes e vendas](loja-de-carros-com-clientes-e-vendas.html)

---

## Visão geral

Ao longo deste livro, construímos passo a passo a **API da loja de carros**: começamos com um servidor HTTP, organizamos o projeto com o NPM, migramos para o Express, conectamos ao MySQL, protegemos as rotas com JWT e, por fim, relacionamos carros, clientes e vendas com transações.

Neste projeto, o grupo vai aplicar **os mesmos conceitos** para construir, do zero, uma **API REST de controle financeiro pessoal**. Não há interface gráfica: o produto entregue é a **API**, testada com `curl` (ou outro cliente HTTP, como Postman, Insomnia ou a extensão Thunder Client do VS Code).

Na API, um usuário se cadastra, faz *login* e registra suas movimentações de dinheiro. Cada movimentação (chamada aqui de **lançamento**) é:

- de um de **dois tipos**: **entrada** (dinheiro que chega) ou **saída** (dinheiro que sai);
- relacionada a uma **categoria**, por exemplo *alimentação*, *saúde*, *mobilidade*, *moradia* ou *salário*;
- relacionada a uma **fonte** (para entradas) ou a um **destino** (para saídas), por exemplo *salário*, *cartão Nubank*, *Visa crédito*, *poupança* ou *conta corrente*.

A partir desses dados, a API deve gerar **relatórios em JSON**: gastos por categoria, movimentação por fonte/destino e **previsão das faturas dos cartões de crédito**. Como **desafio** (pontuação extra), o grupo pode criar uma rota de **saúde financeira**, que devolve indicadores, projeções e dicas calculados a partir dos dados do usuário.

```text
┌───────────────────────┐   HTTP + JSON     ┌──────────────────────────────┐   mysql2   ┌──────────────┐
│ curl / Postman /      │ ────────────────► │ server.js (Express)          │ ─────────► │ MySQL        │
│ Insomnia / Thunder    │ ◄──────────────── │  routes/  → rotas (Router)   │ ◄───────── │ api_financas │
│                       │  Authorization:   │  middleware/auth.js (JWT)    │            │              │
│                       │  Bearer <token>   │  models/  → classes com SQL  │            │              │
└───────────────────────┘                   └──────────────────────────────┘            └──────────────┘
```

> **Comparando com a loja de carros.** Na loja, as rotas `GET` eram **públicas** e só as operações de escrita exigiam *token*. Aqui é diferente: os dados financeiros são **privados**, e **todas** as rotas (exceto cadastro e *login*) exigem *token*. Além disso, cada usuário só pode enxergar os **próprios** dados.

---

## Objetivos de aprendizagem

Ao concluir o projeto, o(a) aluno(a) deve ser capaz de:

1. Organizar um projeto Node.js com **NPM**, *scripts* (`npm start`, `npm run dev`) e **nodemon**.
2. Construir uma **API REST** com **Express**, separando as rotas em arquivos com `express.Router()` e usando corretamente **verbos HTTP**, ***path parameters***, ***query parameters*** e **códigos de *status***.
3. **Modelar** um banco **MySQL** com chaves estrangeiras e restrições **`UNIQUE`**, e acessá-lo com o driver **`mysql2`** usando **consultas parametrizadas** (`?`).
4. Organizar o acesso a dados em **classes de modelo** (`models/`), como na classe `Carro`.
5. Implementar **cadastro** com senha protegida por ***hash*** (`bcrypt`) e ***login*** com **JWT**, protegendo as rotas com um *middleware*.
6. Usar **transações** (`beginTransaction`, `commit`, `rollback`) quando várias instruções SQL precisam ser gravadas juntas.
7. Implementar **regras de negócio** no servidor: validações, agregações (`SUM`, `GROUP BY`) e o cálculo de faturas de cartão de crédito.

---

## Conceitos do livro aplicados no projeto

O projeto foi pensado para que **cada capítulo** do livro seja usado. A tabela abaixo serve de roteiro de estudo e de *checklist*.

Table: (\#tab:tabela-conceitos-livro) Onde cada conceito do livro aparece no projeto

| Capítulo do livro | Conceito | Onde aparece no projeto |
|---|---|---|
| JavaScript básico e objetos | Funções, *arrow functions*, objetos, arrays (`map`, `filter`, `reduce`), *template strings*, classes | Validações, cálculo de faturas, montagem das respostas JSON, classes de modelo |
| Web Services | REST, recursos no plural (`/lancamentos`), verbos HTTP, códigos de *status*, `Content-Type: application/json` | Todas as rotas |
| Servidor HTTP com Node.js | Ciclo requisição/resposta | Base do entendimento do Express |
| NPM, JSON e organização | `npm init`, `package.json`, `dependencies` × `devDependencies`, `npm start`, `nodemon`, `module.exports` / `require` | Estrutura do projeto e *scripts* |
| Express Framework | `express.json()`, `express.Router()`, `app.use`, `req.params`, `req.query`, `req.body`, `res.status().json()` | `server.js` e pasta `routes/` |
| Integração com banco de dados | MySQL, `mysql2`, `database/connection.js`, SELECT/INSERT/UPDATE/DELETE com `?`, classes de modelo | Pasta `models/` |
| APIs com JWT | `jwt.sign` com `expiresIn`, `express-jwt` (`protegerRota`), `Authorization: Bearer`, `UnauthorizedError`, `req.auth` | Pasta `middleware/` e rota `auth.js` |
| JWT — Melhorando a segurança | Senha com *hash*, chave secreta fora do código, tempo de expiração | **Obrigatórios** neste projeto (no livro eram recomendações) |
| Loja de carros com clientes e vendas | Relacionamentos 1–N, `UNIQUE` no banco, transações, id do usuário vindo do *token* | Modelo de dados, cadastro e lançamentos |

### Conceitos novos (pequenos passos além do livro)

Três itens que o livro apenas **recomendou** passam a ser **obrigatórios**. Eles serão revisados em aula:

**1. Variáveis de ambiente com `dotenv`.** A chave secreta do JWT e a senha do banco não podem ficar no código nem no repositório.

```bash
npm install dotenv
```

```text
# .env  (NÃO versionar — incluir no .gitignore)
PORT=3000
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=sua_senha
DB_NAME=api_financas
JWT_SECRET=uma_frase_longa_e_dificil_de_adivinhar
```

```js
// primeira linha do server.js
require('dotenv').config();

// em qualquer arquivo
const segredo = process.env.JWT_SECRET;
```

O repositório deve conter um arquivo **`.env.example`**, com os mesmos nomes de variáveis e valores fictícios, e um **`.gitignore`** com `node_modules/` e `.env`.

**2. *Hash* de senha com `bcrypt`.** A senha **nunca** é gravada em texto puro, e o *login* deixa de comparar a senha no SQL:

```js
const bcrypt = require('bcrypt');

// no cadastro
const senhaHash = await bcrypt.hash(senha, 10);   // 10 = custo (rodadas de salt)

// no login: busca o usuário SÓ pelo e-mail e compara a senha no Node
const confere = await bcrypt.compare(senhaDigitada, usuario.senha_hash);
```

**3. Restrições `CHECK` no MySQL.** A partir do MySQL 8.0.16, as restrições `CHECK` são verificadas pelo banco. Elas impedem, por exemplo, um valor negativo, mesmo que a validação da rota falhe.

---

## Modelo de dados

O modelo abaixo é a **referência mínima**. O grupo pode acrescentar campos e tabelas, mas **não pode remover** as entidades, os relacionamentos e as restrições descritas.

```text
usuarios 1 ──── N categorias
usuarios 1 ──── N fontes_destinos
usuarios 1 ──── N lancamentos
categorias 1 ── N lancamentos
fontes_destinos 1 ── N lancamentos

┌────────────────────────┐        ┌──────────────────────────────┐        ┌──────────────────────────┐
│ usuarios               │        │ lancamentos                  │        │ fontes_destinos          │
│────────────────────────│        │──────────────────────────────│        │──────────────────────────│
│ id (PK)                │◄───────│ usuario_id (FK)              │        │ id (PK)                  │
│ nome                   │        │ id (PK)                      │        │ usuario_id (FK)          │
│ email   UNIQUE         │        │ tipo (entrada | saida)       │───────►│ nome                     │
│ cpf     UNIQUE         │        │ descricao                    │        │ tipo (renda | conta |    │
│ senha_hash             │        │ valor (> 0)                  │        │       cartao_credito)    │
│ criado_em              │        │ data                         │        │ dia_fechamento (cartão)  │
└────────────────────────┘        │ categoria_id (FK)            │        │ dia_vencimento (cartão)  │
                                  │ fonte_destino_id (FK)        │        │ limite         (cartão)  │
┌────────────────────────┐        │ parcela_atual                │        └──────────────────────────┘
│ categorias             │        │ total_parcelas               │
│────────────────────────│◄───────│ grupo_parcelamento           │
│ id (PK)                │        └──────────────────────────────┘
│ usuario_id (FK)        │
│ nome                   │
│ tipo (entrada | saida) │
└────────────────────────┘
```

Table: (\#tab:tabela-entidades-backend) Entidades do sistema

| Entidade | Descrição | Regras principais |
|---|---|---|
| **Usuário** | Pessoa que usa a API. | `email` e `cpf` **únicos no banco**; senha guardada **apenas** como *hash*. |
| **Categoria** | Classifica o lançamento (*alimentação*, *saúde*, *salário*...). | Pertence a um usuário. Tem `tipo` (`entrada` ou `saida`); um lançamento só pode usar categoria do **mesmo tipo**. |
| **Fonte/Destino** | De onde o dinheiro vem ou para onde vai (*salário*, *poupança*, *cartão Nubank*...). | Pertence a um usuário. `tipo` ∈ {`renda`, `conta`, `cartao_credito`}. Se for cartão, `dia_fechamento`, `dia_vencimento` e `limite` são **obrigatórios**. |
| **Lançamento** | Uma movimentação financeira. | `valor` **positivo** (o sinal vem do `tipo`); `data` obrigatória; **deve** ter categoria e fonte/destino do **mesmo usuário**. Compras no cartão podem ser **parceladas**. |

### Script de criação do banco

Arquivo: `database/schema.sql`

```sql
CREATE DATABASE IF NOT EXISTS api_financas;
USE api_financas;

CREATE TABLE usuarios (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  nome        VARCHAR(120) NOT NULL,
  email       VARCHAR(160) NOT NULL,
  cpf         CHAR(11)     NOT NULL,                 -- só dígitos
  senha_hash  VARCHAR(100) NOT NULL,
  criado_em   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT uq_usuarios_email UNIQUE (email),
  CONSTRAINT uq_usuarios_cpf   UNIQUE (cpf)
);

CREATE TABLE categorias (
  id          INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id  INT NOT NULL,
  nome        VARCHAR(60) NOT NULL,
  tipo        ENUM('entrada', 'saida') NOT NULL,
  CONSTRAINT uq_categorias_nome UNIQUE (usuario_id, nome, tipo),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE fontes_destinos (
  id              INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id      INT NOT NULL,
  nome            VARCHAR(60) NOT NULL,
  tipo            ENUM('renda', 'conta', 'cartao_credito') NOT NULL,
  dia_fechamento  TINYINT NULL,
  dia_vencimento  TINYINT NULL,
  limite          DECIMAL(12, 2) NULL,
  CONSTRAINT uq_fontes_nome UNIQUE (usuario_id, nome),
  CONSTRAINT ck_dias CHECK (
    (dia_fechamento IS NULL OR dia_fechamento BETWEEN 1 AND 31) AND
    (dia_vencimento IS NULL OR dia_vencimento BETWEEN 1 AND 31)
  ),
  CONSTRAINT ck_cartao CHECK (
    tipo <> 'cartao_credito' OR
    (dia_fechamento IS NOT NULL AND dia_vencimento IS NOT NULL AND limite IS NOT NULL)
  ),
  FOREIGN KEY (usuario_id) REFERENCES usuarios(id) ON DELETE CASCADE
);

CREATE TABLE lancamentos (
  id                  INT AUTO_INCREMENT PRIMARY KEY,
  usuario_id          INT NOT NULL,
  tipo                ENUM('entrada', 'saida') NOT NULL,
  descricao           VARCHAR(120)   NOT NULL,
  valor               DECIMAL(12, 2) NOT NULL,
  data                DATE           NOT NULL,
  categoria_id        INT NOT NULL,
  fonte_destino_id    INT NOT NULL,
  parcela_atual       TINYINT NOT NULL DEFAULT 1,
  total_parcelas      TINYINT NOT NULL DEFAULT 1,
  grupo_parcelamento  CHAR(36) NULL,                 -- mesmo valor em todas as parcelas
  criado_em           DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT ck_valor    CHECK (valor > 0),
  CONSTRAINT ck_parcelas CHECK (total_parcelas BETWEEN 1 AND 48
                                AND parcela_atual BETWEEN 1 AND total_parcelas),
  FOREIGN KEY (usuario_id)       REFERENCES usuarios(id) ON DELETE CASCADE,
  FOREIGN KEY (categoria_id)     REFERENCES categorias(id),
  FOREIGN KEY (fonte_destino_id) REFERENCES fontes_destinos(id),
  INDEX idx_lancamentos_usuario_data (usuario_id, data)
);
```

Além do `schema.sql`, o grupo deve entregar um **`database/seed.sql`** com pelo menos **2 usuários** e **3 meses de lançamentos** (incluindo ao menos um cartão de crédito e uma compra parcelada), para a demonstração. Como as senhas são gravadas com *hash*, o *seed* deve conter o *hash* gerado pelo `bcrypt` (ou o grupo pode criar os usuários pela rota de cadastro e inserir o restante pelo SQL).

### E-mail e CPF únicos: a garantia vem do banco

O sistema **não pode permitir dois usuários com o mesmo e-mail ou o mesmo CPF**. Assim como, na loja de carros, a restrição `UNIQUE` em `carro_id` garantia que um carro fosse vendido uma única vez, aqui as restrições `uq_usuarios_email` e `uq_usuarios_cpf` garantem a regra **no próprio banco**.

> **Por que não basta fazer um SELECT antes de inserir?** Se duas requisições de cadastro chegarem ao mesmo tempo, as duas podem executar o `SELECT`, não encontrar ninguém e, em seguida, as duas fazerem o `INSERT`. Esse problema se chama **condição de corrida** (*race condition*). A restrição `UNIQUE` é verificada pelo MySQL de forma atômica: a segunda inserção sempre falha. O `SELECT` prévio pode existir para dar uma resposta mais rápida, mas **a garantia é do banco**.

Para que a regra funcione de verdade, os dados precisam ser **normalizados** antes de gravar:

- e-mail: `email.trim().toLowerCase()` (assim, `Ana@Email.com` e `ana@email.com` são o mesmo e-mail);
- CPF: somente dígitos, `cpf.replace(/\D/g, '')` (assim, `529.982.247-25` e `52998224725` são o mesmo CPF).

Quando o MySQL recusa uma inserção por causa de um `UNIQUE`, o erro devolvido pelo `mysql2` tem `code === 'ER_DUP_ENTRY'` (número `1062`), e a mensagem (`sqlMessage`) contém o **nome da restrição** violada. É por isso que as restrições foram nomeadas no `schema.sql`.

---

## Requisitos funcionais

Com exceção de RF1 e RF2, **todas** as rotas devem estar protegidas pelo *middleware* JWT. Todas as validações devem ser feitas **no servidor**, com respostas em JSON e o código de *status* adequado.

### RF1 — Cadastro de usuário

`POST /auth/cadastro`, com corpo JSON contendo `nome`, `email`, `cpf` e `senha`.

- **Validações** (resposta `400` com as mensagens):
    - todos os campos obrigatórios;
    - e-mail em formato válido;
    - CPF com **dígitos verificadores válidos** (não basta ter 11 dígitos);
    - senha com no mínimo 8 caracteres, contendo letras e números.
- Senha gravada com `bcrypt`. O `senha_hash` **nunca** aparece em nenhuma resposta da API.
- E-mail ou CPF já cadastrado → **`409 Conflict`**, indicando **qual** campo está duplicado.
- O cadastro deve criar, **na mesma transação**, o usuário, um conjunto de **categorias padrão** (ex.: *Salário* e *Outras entradas* como entrada; *Alimentação*, *Moradia*, *Saúde*, *Mobilidade*, *Lazer*, *Educação* e *Outras saídas* como saída) e uma fonte/destino padrão (*Conta corrente*). Se qualquer inserção falhar, nada é gravado (`rollback`).
- Sucesso → **`201 Created`** com `id`, `nome` e `email`.

Função utilitária de validação de CPF:

Arquivo: `utils/cpf.js`

```js
// Valida os dois dígitos verificadores do CPF
function cpfValido(cpf) {
  const d = String(cpf).replace(/\D/g, '');            // mantém só os dígitos
  if (d.length !== 11 || /^(\d)\1{10}$/.test(d)) {     // rejeita 111.111.111-11 etc.
    return false;
  }
  const digito = (tamanho) => {
    let soma = 0;
    for (let i = 0; i < tamanho; i++) soma += Number(d[i]) * (tamanho + 1 - i);
    const resto = (soma * 10) % 11;
    return resto === 10 ? 0 : resto;
  };
  return digito(9) === Number(d[9]) && digito(10) === Number(d[10]);
}

module.exports = { cpfValido };

// cpfValido('529.982.247-25') → true
// cpfValido('529.982.247-24') → false (dígito verificador errado)
```

Trecho da classe `Usuario`, com a **transação** do cadastro (mesmo padrão da classe `Venda`):

Arquivo: `models/Usuario.js` (trecho)

```js
const connection = require('../database/connection');

const CATEGORIAS_PADRAO = [
  ['Salário', 'entrada'], ['Outras entradas', 'entrada'],
  ['Alimentação', 'saida'], ['Moradia', 'saida'], ['Saúde', 'saida'],
  ['Mobilidade', 'saida'], ['Lazer', 'saida'], ['Educação', 'saida'], ['Outras saídas', 'saida'],
];

class Usuario {
  cadastrar({ nome, email, cpf, senhaHash }, callback) {
    connection.beginTransaction((erro) => {
      if (erro) return callback(erro);

      const sqlUsuario = 'INSERT INTO usuarios (nome, email, cpf, senha_hash) VALUES (?, ?, ?, ?)';
      connection.query(sqlUsuario, [nome, email, cpf, senhaHash], (erro, resultado) => {
        if (erro) return connection.rollback(() => callback(erro));

        const usuarioId = resultado.insertId;
        const linhas = CATEGORIAS_PADRAO.map(([nomeCat, tipo]) => [usuarioId, nomeCat, tipo]);

        // INSERT de várias linhas: VALUES ? recebe um array de arrays
        connection.query('INSERT INTO categorias (usuario_id, nome, tipo) VALUES ?', [linhas], (erro) => {
          if (erro) return connection.rollback(() => callback(erro));

          const sqlFonte = "INSERT INTO fontes_destinos (usuario_id, nome, tipo) VALUES (?, 'Conta corrente', 'conta')";
          connection.query(sqlFonte, [usuarioId], (erro) => {
            if (erro) return connection.rollback(() => callback(erro));

            connection.commit((erro) => {
              if (erro) return connection.rollback(() => callback(erro));
              callback(null, { id: usuarioId, nome, email });
            });
          });
        });
      });
    });
  }
}

module.exports = new Usuario();
```

Trecho da rota de cadastro, tratando o `ER_DUP_ENTRY`:

Arquivo: `routes/auth.js` (trecho)

```js
const express = require('express');
const bcrypt = require('bcrypt');
const Usuario = require('../models/Usuario');
const { cpfValido } = require('../utils/cpf');

const router = express.Router();

router.post('/cadastro', async (req, res) => {
  const { nome, email, cpf, senha } = req.body;
  const erros = {};

  if (!nome || !nome.trim()) erros.nome = 'Informe o nome.';
  if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) erros.email = 'E-mail inválido.';
  if (!cpf || !cpfValido(cpf)) erros.cpf = 'CPF inválido.';
  if (!senha || senha.length < 8 || !/[A-Za-z]/.test(senha) || !/\d/.test(senha)) {
    erros.senha = 'A senha deve ter ao menos 8 caracteres, com letras e números.';
  }
  if (Object.keys(erros).length > 0) {
    return res.status(400).json({ erro: 'Dados inválidos.', campos: erros });
  }

  const senhaHash = await bcrypt.hash(senha, 10);
  const dados = {
    nome: nome.trim(),
    email: email.trim().toLowerCase(),   // normalização
    cpf: cpf.replace(/\D/g, ''),         // normalização
    senhaHash,
  };

  Usuario.cadastrar(dados, (erro, usuario) => {
    if (erro && erro.code === 'ER_DUP_ENTRY') {
      const campo = erro.sqlMessage.includes('uq_usuarios_cpf') ? 'cpf' : 'email';
      return res.status(409).json({
        erro: 'Usuário já cadastrado.',
        campos: { [campo]: `Já existe um usuário com este ${campo === 'cpf' ? 'CPF' : 'e-mail'}.` },
      });
    }
    if (erro) {
      return res.status(500).json({ erro: 'Erro ao cadastrar usuário.' });
    }
    return res.status(201).json(usuario);
  });
});

module.exports = router;
```

### RF2 — *Login*

`POST /auth/login`, com `email` e `senha`.

- Buscar o usuário **somente pelo e-mail** (normalizado) e comparar a senha com `bcrypt.compare`.
- Credenciais inválidas → **`401`** com mensagem **genérica** ("E-mail ou senha inválidos."). A resposta não pode revelar se o e-mail existe.
- Sucesso → **`200`** com o *token* gerado por `jwt.sign({ id, nome, email }, process.env.JWT_SECRET, { expiresIn: '1h' })` e os dados básicos do usuário.
- Rota `GET /auth/me` (protegida): devolve os dados do usuário dono do *token* (sem `senha_hash`).

O *middleware* segue o capítulo de JWT, agora lendo a chave do `.env`:

Arquivo: `middleware/auth.js`

```js
const { expressjwt } = require('express-jwt');

const protegerRota = expressjwt({
  secret: process.env.JWT_SECRET,
  algorithms: ['HS256'],
});

module.exports = protegerRota;
```

Arquivo: `server.js` (trecho)

```js
require('dotenv').config();
const express = require('express');
const protegerRota = require('./middleware/auth');

const app = express();
app.use(express.json());

app.use('/auth', require('./routes/auth'));            // cadastro, login (públicas) e /me
app.use('/categorias', protegerRota, require('./routes/categorias'));
app.use('/fontes-destinos', protegerRota, require('./routes/fontesDestinos'));
app.use('/lancamentos', protegerRota, require('./routes/lancamentos'));
app.use('/relatorios', protegerRota, require('./routes/relatorios'));

// Rota inexistente
app.use((req, res) => res.status(404).json({ erro: 'Rota não encontrada.' }));

// Tratamento de erros (sempre com 4 parâmetros e por último)
app.use((erro, req, res, next) => {
  if (erro.name === 'UnauthorizedError') {
    return res.status(401).json({ erro: 'Token ausente, inválido ou expirado.' });
  }
  console.error(erro);
  return res.status(500).json({ erro: 'Erro interno do servidor.' });
});

app.listen(process.env.PORT || 3000, () => console.log('API de finanças rodando.'));
```

> Em `routes/auth.js`, a rota `/me` deve receber o *middleware* individualmente: `router.get('/me', protegerRota, (req, res) => { ... })`.

### RF3 — Isolamento dos dados entre usuários

Requisito **transversal**, válido para todas as rotas protegidas:

- O id do usuário vem **sempre** de `req.auth.id` (o *token*), **nunca** do corpo da requisição, da URL ou da *query string*.
- **Toda** consulta deve filtrar pelo dono: `WHERE id = ? AND usuario_id = ?`.
- Ao criar ou editar um lançamento, a API deve verificar que a **categoria** e a **fonte/destino** informadas pertencem ao **mesmo usuário**.
- Pedir um registro de outro usuário (ex.: `GET /lancamentos/57`, sendo o 57 de outra pessoa) deve devolver **`404`**: para esse usuário, o registro "não existe".

```js
// ❌ ERRADO — qualquer usuário autenticado lê qualquer lançamento
connection.query('SELECT * FROM lancamentos WHERE id = ?', [id], callback);

// ✅ CERTO — o dono vem do token
connection.query('SELECT * FROM lancamentos WHERE id = ? AND usuario_id = ?', [id, usuarioId], callback);
```

### RF4 — CRUD de categorias

| Método | Rota | Descrição |
|---|---|---|
| `GET` | `/categorias?tipo=saida` | Lista as categorias do usuário (filtro opcional por tipo) |
| `POST` | `/categorias` | Cria (`201`); nome repetido para o mesmo tipo → `409` |
| `PUT` | `/categorias/:id` | Atualiza (`200`); inexistente ou de outro usuário → `404` |
| `DELETE` | `/categorias/:id` | Exclui (`204`); se houver lançamentos vinculados → `409` com mensagem explicativa |

### RF5 — CRUD de fontes/destinos

Mesmas rotas e regras das categorias, em `/fontes-destinos`. Além disso:

- `tipo` deve ser `renda`, `conta` ou `cartao_credito` (`400` caso contrário);
- se o tipo for `cartao_credito`, `dia_fechamento`, `dia_vencimento` (1 a 31) e `limite` (> 0) são obrigatórios (`400` se faltarem).

### RF6 — CRUD de lançamentos

| Método | Rota | Descrição |
|---|---|---|
| `GET` | `/lancamentos?inicio=2026-10-01&fim=2026-10-31&tipo=saida&categoriaId=3&fonteDestinoId=2&pagina=1` | Lista com filtros (todos opcionais; o padrão é o mês corrente) e paginação (20 por página) |
| `GET` | `/lancamentos/:id` | Detalha um lançamento |
| `POST` | `/lancamentos` | Cria um lançamento (ou várias parcelas) |
| `PUT` | `/lancamentos/:id` | Atualiza |
| `DELETE` | `/lancamentos/:id?todasParcelas=true` | Exclui a parcela ou, com `todasParcelas=true`, todas as parcelas da mesma compra |

Regras:

- **Validações** (`400`): `tipo`, `descricao`, `valor`, `data`, `categoriaId` e `fonteDestinoId` obrigatórios; valor numérico **maior que zero**; data válida no formato `AAAA-MM-DD`; o **tipo da categoria** deve ser igual ao **tipo do lançamento** (uma saída não pode usar a categoria *Salário*).
- Categoria ou fonte/destino inexistente **ou de outro usuário** → `404`.
- **Parcelamento:** se o destino for um cartão de crédito, o corpo pode trazer `parcelas` (1 a 48). A API grava **um lançamento por parcela**, todos com a **mesma `data` da compra**, o mesmo `grupo_parcelamento` (gerado com `crypto.randomUUID()`, nativo do Node) e `parcela_atual` de 1 a N. O valor é dividido **em centavos**, e a diferença de arredondamento vai para a primeira parcela: R$ 100,00 em 3× → 33,34 + 33,33 + 33,33.
- A resposta da listagem deve trazer, além dos itens, um **resumo do período filtrado**: total de entradas, total de saídas e saldo.

```js
// Divide um valor em parcelas sem perder centavos
function dividirEmParcelas(valorTotal, quantidade) {
  const centavos = Math.round(valorTotal * 100);
  const base = Math.floor(centavos / quantidade);
  const resto = centavos - base * quantidade;
  return Array.from({ length: quantidade }, (_, i) => (base + (i === 0 ? resto : 0)) / 100);
}

// dividirEmParcelas(100, 3) → [33.34, 33.33, 33.33]
```

Exemplo de requisição e de resposta da listagem:

```bash
curl -X POST http://localhost:3000/lancamentos \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer SEU_TOKEN_AQUI" \
  -d '{"tipo":"saida","descricao":"Notebook","valor":3000,"data":"2026-10-28",
       "categoriaId":7,"fonteDestinoId":3,"parcelas":10}'
```

```json
{
  "periodo": { "inicio": "2026-10-01", "fim": "2026-10-31" },
  "resumo": { "entradas": 5200.00, "saidas": 3250.00, "saldo": 1950.00 },
  "pagina": 1,
  "totalPaginas": 2,
  "itens": [
    {
      "id": 41, "tipo": "saida", "descricao": "Notebook", "valor": 300.00, "data": "2026-10-28",
      "categoria": { "id": 7, "nome": "Educação" },
      "fonteDestino": { "id": 3, "nome": "Cartão Nubank" },
      "parcela": "1/10"
    }
  ]
}
```

### RF7 — Relatório por categoria

`GET /relatorios/categorias?inicio=AAAA-MM-DD&fim=AAAA-MM-DD`

- Total de **saídas por categoria**, com o **percentual** de cada uma sobre o total, do maior para o menor.
- Total de **entradas por categoria**.
- **Comparação com o período anterior** de mesmo tamanho (ex.: outubro × setembro): para cada categoria, o valor do período anterior e a variação percentual.
- `inicio` e `fim` obrigatórios e válidos, com `inicio <= fim` (`400` caso contrário).

Os totais devem ser calculados **com SQL** (`SUM` e `GROUP BY`), e não carregando todos os lançamentos para somar no JavaScript:

```sql
SELECT c.id, c.nome, SUM(l.valor) AS total
  FROM lancamentos l
  JOIN categorias  c ON c.id = l.categoria_id
 WHERE l.usuario_id = ?
   AND l.tipo = 'saida'
   AND l.data BETWEEN ? AND ?
 GROUP BY c.id, c.nome
 ORDER BY total DESC;
```

> **Atenção:** o `mysql2` devolve colunas `DECIMAL` e o resultado de `SUM` como **texto** (`"980.50"`), para não perder precisão. Converta com `Number(...)` antes de calcular percentuais e de devolver o JSON.

Exemplo de resposta:

```json
{
  "periodo": { "inicio": "2026-10-01", "fim": "2026-10-31" },
  "periodoAnterior": { "inicio": "2026-09-01", "fim": "2026-09-30" },
  "saidas": {
    "total": 3250.00,
    "categorias": [
      { "id": 4, "nome": "Moradia",     "total": 1500.00, "percentual": 46.15, "anterior": 1500.00, "variacao": 0.00 },
      { "id": 3, "nome": "Alimentação", "total": 980.50,  "percentual": 30.17, "anterior": 870.00,  "variacao": 12.70 },
      { "id": 6, "nome": "Mobilidade",  "total": 769.50,  "percentual": 23.68, "anterior": 812.30,  "variacao": -5.27 }
    ]
  },
  "entradas": {
    "total": 5200.00,
    "categorias": [ { "id": 1, "nome": "Salário", "total": 5200.00, "percentual": 100.00 } ]
  }
}
```

### RF8 — Relatório por fonte/destino

`GET /relatorios/fontes-destinos?inicio=AAAA-MM-DD&fim=AAAA-MM-DD`

- Total de **entradas por fonte** (quanto veio do salário, de *freelances*, de rendimentos...).
- Total de **saídas por destino** (quanto saiu da conta corrente, de cada cartão, da poupança...).
- Para fontes/destinos do tipo `conta`: **saldo do período** (entradas − saídas).

### RF9 — Previsão de faturas de cartão de crédito

`GET /relatorios/faturas?meses=3`

Para **cada cartão de crédito** do usuário, devolver a **fatura atual** (aberta) e as **próximas faturas** (o padrão é 3; `meses` aceita de 1 a 12), considerando as **parcelas futuras**. Para cada fatura:

- data de **fechamento**, data de **vencimento** e **referência** (`AAAA-MM`, mês do vencimento);
- os lançamentos que a compõem, com a parcela (ex.: `"Notebook — 3/10"`);
- o **valor total**.

Para cada cartão, também: **limite total**, **limite utilizado** (soma de todas as parcelas cuja fatura ainda não venceu) e **limite disponível**.

**Regra de fechamento.** Uma compra entra na fatura que fecha **no mesmo mês** se for feita **antes** do dia de fechamento; se for feita **no dia do fechamento ou depois**, entra na fatura do mês seguinte. A parcela *k* cai *k* − 1 meses depois da fatura da primeira parcela. Se o dia de vencimento for **maior** que o de fechamento, o vencimento é no mesmo mês do fechamento; senão, no mês seguinte. Dias que não existem no mês (ex.: dia 31 em fevereiro) viram o último dia do mês.

Table: (\#tab:tabela-exemplo-faturas-backend) Exemplos de aplicação da regra de fechamento

| Cartão | Compra | Parcela | Fechamento | Vencimento | Referência |
|---|---|---|---|---|---|
| Nubank (fecha dia 3, vence dia 10) | 02/11/2026 | 1/1 | 03/11/2026 | 10/11/2026 | 2026-11 |
| Nubank (fecha dia 3, vence dia 10) | 03/11/2026 | 1/1 | 03/12/2026 | 10/12/2026 | 2026-12 |
| Visa (fecha dia 25, vence dia 5) | 28/12/2026 | 1/1 | 25/01/2027 | 05/02/2027 | 2027-02 |
| Visa (fecha dia 25, vence dia 5) | 20/12/2026 | 3/3 | 25/02/2027 | 05/03/2027 | 2027-03 |

Implementação de referência (o grupo pode usá-la, adaptá-la ou escrever a sua):

Arquivo: `utils/faturas.js`

```js
// Datas em UTC para evitar problemas de fuso horário
function ultimoDiaDoMes(ano, mes) {              // mes: 0 a 11
  return new Date(Date.UTC(ano, mes + 1, 0)).getUTCDate();
}

function dataSegura(ano, mes, dia) {             // aceita mes > 11 e ajusta dia 31 em meses curtos
  const a = ano + Math.floor(mes / 12);
  const m = ((mes % 12) + 12) % 12;
  return new Date(Date.UTC(a, m, Math.min(dia, ultimoDiaDoMes(a, m))));
}

// dataCompra: 'AAAA-MM-DD'; cartao: { diaFechamento, diaVencimento }
function calcularFatura(dataCompra, cartao, numeroParcela = 1) {
  const [ano, mes, dia] = dataCompra.split('-').map(Number);
  const m = mes - 1;
  const fechamentoDoMes = Math.min(cartao.diaFechamento, ultimoDiaDoMes(ano, m));

  let mesFechamento = dia < fechamentoDoMes ? m : m + 1;   // antes do fechamento: fatura deste mês
  mesFechamento += numeroParcela - 1;                       // parcelas seguintes: meses seguintes

  const fechamento = dataSegura(ano, mesFechamento, cartao.diaFechamento);
  const mesVencimento = cartao.diaVencimento > cartao.diaFechamento ? mesFechamento : mesFechamento + 1;
  const vencimento = dataSegura(ano, mesVencimento, cartao.diaVencimento);

  const iso = (d) => d.toISOString().slice(0, 10);
  return { referencia: iso(vencimento).slice(0, 7), fechamento: iso(fechamento), vencimento: iso(vencimento) };
}

module.exports = { calcularFatura };

// calcularFatura('2026-12-28', { diaFechamento: 25, diaVencimento: 5 })
// → { referencia: '2027-02', fechamento: '2027-01-25', vencimento: '2027-02-05' }
```

> **Dica de implementação.** Busque no banco todos os lançamentos de saída de cada cartão, calcule a fatura de cada um com `calcularFatura(data, cartao, parcela_atual)` e agrupe os resultados por `referencia` com `reduce`. Depois, mantenha só as faturas a partir da atual. Isso exercita bem os métodos de array do capítulo de JavaScript.
>
> **Datas no `mysql2`.** Por padrão, colunas `DATE` chegam como objetos `Date`, sujeitos ao fuso horário. Para receber o texto `'AAAA-MM-DD'`, use a opção `dateStrings: true` na configuração da conexão.

### Desafio (pontuação extra) — Saúde financeira

`GET /saude-financeira`

Uma rota que **analisa os dados do próprio usuário** e devolve, em JSON, **indicadores**, **projeções** e **dicas**. Não há resposta única: o grupo escolhe as análises. Sugestões:

Table: (\#tab:tabela-indicadores-backend) Sugestões de indicadores

| Indicador | Como calcular (sugestão) | Exemplo de dica |
|---|---|---|
| **Taxa de poupança** | (entradas − saídas) ÷ entradas, por mês | "Você guardou 4% da sua renda em outubro. Uma meta comum é guardar pelo menos 10%." |
| **Comprometimento com cartões** | Total das próximas faturas ÷ renda média mensal | "Suas faturas dos próximos 3 meses comprometem 62% da sua renda." |
| **Parcelas futuras** | Soma das parcelas a vencer, por mês | "Você tem R$ 1.240,00 em parcelas até março de 2027." |
| **Regra 50/30/20** | Classificar as categorias em *necessidades*, *desejos* e *poupança* e comparar com 50% / 30% / 20% | "Os gastos com desejos estão em 41% (referência: 30%)." |
| **Projeção de saldo** | Média das entradas e saídas dos últimos 3 meses + parcelas já conhecidas, para os próximos 3 a 6 meses | Lista mês a mês com o saldo previsto e um alerta se ficar negativo |
| **Categoria fora da curva** | Gasto do mês na categoria × média dos 3 meses anteriores | "Seus gastos com Alimentação estão 35% acima da sua média." |
| **Reserva de emergência** | Saldo das contas marcadas como reserva (sugere-se um campo `reserva` em `fontes_destinos`) ÷ média de saídas mensais | "Sua reserva cobre 1,8 mês de despesas. Uma referência comum é de 3 a 6 meses." |

```json
{
  "aviso": "Informações educativas; não constituem recomendação financeira profissional.",
  "indicadores": {
    "taxaPoupanca": 0.04,
    "comprometimentoCartoes": 0.62,
    "mesesDeReserva": 1.8
  },
  "projecao": [
    { "mes": "2026-11", "entradas": 5200.00, "saidas": 4950.00, "saldoPrevisto": 250.00 },
    { "mes": "2026-12", "entradas": 5200.00, "saidas": 5410.00, "saldoPrevisto": -210.00 }
  ],
  "dicas": [
    "Seus gastos com Alimentação estão 35% acima da sua média dos últimos 3 meses.",
    "Seu saldo previsto para dezembro é negativo: revise as compras parceladas."
  ]
}
```

As dicas podem ser geradas por **regras** (`if` com limites definidos pelo grupo e documentados no README). A resposta deve conter o campo `aviso` informando que as informações são **educativas** e **não constituem recomendação financeira profissional**.

---

## Padrão de respostas e códigos de *status*

Todas as respostas de erro devem ter **o mesmo formato**:

```json
{
  "erro": "Dados inválidos.",
  "campos": {
    "valor": "O valor deve ser maior que zero.",
    "categoriaId": "A categoria informada é de entrada, mas o lançamento é de saída."
  }
}
```

Table: (\#tab:tabela-status-backend) Códigos de *status* esperados

| Código | Quando usar neste projeto |
|---|---|
| `200 OK` | Consultas, atualização e *login* bem-sucedidos |
| `201 Created` | Cadastro de usuário, categoria, fonte/destino e lançamento |
| `204 No Content` | Exclusão bem-sucedida (sem corpo) |
| `400 Bad Request` | Campos obrigatórios ausentes, formatos inválidos, regras de negócio violadas |
| `401 Unauthorized` | *Token* ausente, inválido ou expirado; *login* com credenciais erradas |
| `404 Not Found` | Registro inexistente **ou de outro usuário**; rota inexistente |
| `409 Conflict` | E-mail/CPF já cadastrado; nome repetido; exclusão de registro com lançamentos vinculados |
| `500 Internal Server Error` | Erros inesperados (o detalhe vai para o `console.error`, não para o cliente) |

---

## Estrutura do projeto

A estrutura segue a da loja de carros, acrescida de `utils/` e dos arquivos de configuração:

```text
api-financas/
├── database/
│   ├── connection.js       → conexão com o MySQL (lendo o .env)
│   ├── schema.sql          → criação do banco e das tabelas
│   └── seed.sql            → dados para teste e demonstração
├── middleware/
│   └── auth.js             → protegerRota (express-jwt)
├── models/                 → classes com o SQL (Usuario, Categoria, FonteDestino, Lancamento, Relatorio)
├── routes/                 → um Router por recurso (auth, categorias, fontesDestinos, lancamentos, relatorios)
├── utils/                  → funções puras (cpf.js, faturas.js, parcelas)
├── testes/
│   └── requisicoes.md      → comandos curl (ou coleção Postman/Insomnia exportada) para TODAS as rotas
├── .env.example
├── .gitignore              → node_modules/ e .env
├── package.json
├── README.md
└── server.js
```

Regras:

- Sistema de módulos **CommonJS** (`require` / `module.exports`), como em todo o livro.
- **SQL apenas em `models/`**. As rotas validam os dados, chamam os métodos das classes e montam a resposta.
- *Scripts* no `package.json`: `"start": "node server.js"` e `"dev": "nodemon server.js"` (com o `nodemon` em `devDependencies`).
- `database/connection.js` deve ler `DB_HOST`, `DB_USER`, `DB_PASSWORD` e `DB_NAME` do `.env`. O uso de `mysql.createPool(...)` no lugar de `createConnection` é **opcional** e recomendado. Atenção: com *pool*, a transação deve ser feita em uma conexão obtida com `pool.getConnection(...)`.
- O uso de `async`/`await` com a interface de *promises* do `mysql2` (`connection.promise()` ou `require('mysql2/promise')`) é **permitido**, no lugar dos *callbacks* usados no livro.

---

## Política acadêmica

- Bibliotecas além de `express`, `mysql2`, `jsonwebtoken`, `express-jwt`, `bcrypt`, `dotenv` e `nodemon` precisam de **aprovação prévia** do professor; caso contrário, serão desconsideradas da avaliação.
- Se for constatada **cópia de artefatos** de outros projetos, será atribuída **nota zero**, sem direito à etapa de recuperação.
- O uso de assistentes de IA é permitido como apoio, mas **ambos os integrantes devem ser capazes de explicar qualquer trecho** do código durante a apresentação. A incapacidade de explicar o código entregue será tratada como ausência de autoria daquele trecho.

---

## Entrega e apresentação

A entrega consiste no **link do repositório Git**, com *commits* incrementais dos dois integrantes, e em uma **apresentação de no máximo 10 minutos**, contemplando obrigatoriamente:

1. **Código-fonte:** estrutura de pastas, `schema.sql`, uma classe de modelo, um arquivo de rotas e o *middleware*.
2. **Execução pela linha de comando:** criação do banco (`schema.sql` + `seed.sql`), `npm install` e `npm run dev`.
3. **Cadastro e unicidade:** cadastro de um usuário e tentativas de cadastro com o **mesmo e-mail** (com letras maiúsculas) e com o **mesmo CPF** (com pontuação), ambas rejeitadas com `409`.
4. ***Login* e proteção:** *login*, requisição **sem** *token* (`401`) e tentativa de ler, alterar e excluir um lançamento **de outro usuário** (`404`).
5. **CRUD:** categorias, fontes/destinos e lançamentos, incluindo uma **compra parcelada** no cartão e uma validação que falha (ex.: saída com categoria de entrada).
6. **Relatórios:** por categoria, por fonte/destino e previsão de faturas, mostrando em qual fatura caiu cada parcela da compra do item 5.
7. **Desafio** (se implementado): rota de saúde financeira.

---

## Critérios de avaliação

A nota do projeto é de **100 pontos**, mais até **10 pontos extras** pelo desafio.

Table: (\#tab:tabela-criterios-backend) Critérios de avaliação

| # | Critério | Pontos |
|---|---|---|
| | **A. Usuários e autenticação** | **25** |
| 1 | Cadastro com validações no servidor (campos, e-mail, CPF com dígitos verificadores, senha) e transação com categorias/fonte padrão | 6 |
| 2 | E-mail e CPF únicos garantidos por `UNIQUE` no banco, com normalização e resposta `409` indicando o campo | 6 |
| 3 | Senha com `bcrypt`, *login* com JWT e expiração, chave secreta no `.env` | 7 |
| 4 | Rotas protegidas com `express-jwt`, tratamento do `UnauthorizedError` (`401`) e isolamento dos dados entre usuários (RF3) | 6 |
| | **B. Cadastros e lançamentos** | **25** |
| 5 | CRUD de categorias e de fontes/destinos com as regras de tipo, cartão, duplicidade e exclusão | 8 |
| 6 | CRUD de lançamentos com validações (valor, data, compatibilidade de tipo, posse da categoria e da fonte/destino) | 9 |
| 7 | Filtros por *query parameters*, paginação e resumo (entradas, saídas e saldo) | 4 |
| 8 | Compras parceladas, com divisão correta dos centavos e exclusão de todas as parcelas | 4 |
| | **C. Relatórios** | **20** |
| 9 | Relatório por categoria com `SUM`/`GROUP BY`, percentuais e comparação com o período anterior | 7 |
| 10 | Relatório por fonte/destino (entradas, saídas e saldo das contas) | 5 |
| 11 | Previsão de faturas (regra de fechamento, parcelas futuras, limite utilizado e disponível) | 8 |
| | **D. Organização e qualidade** | **15** |
| 12 | Estrutura de pastas, `express.Router()` por recurso, SQL somente nas classes de `models/`, CommonJS | 4 |
| 13 | Verbos HTTP, códigos de *status* e padrão único de resposta de erro | 4 |
| 14 | Consultas parametrizadas (`?`), restrições no banco (FK, `UNIQUE`, `CHECK`) e tipos adequados para dinheiro | 4 |
| 15 | `package.json` com *scripts* e `nodemon`, `.env.example`, `.gitignore`, `schema.sql`, `seed.sql`, README e arquivo de testes com todas as rotas | 3 |
| | **E. Apresentação** | **15** |
| 16 | Explicação do código-fonte (ambos os integrantes) | 5 |
| 17 | Execução pela linha de comando (banco e API) | 5 |
| 18 | Demonstração de todos os itens obrigatórios do roteiro, dentro do tempo | 5 |
| | **TOTAL** | **100** |
| | **Desafio — Saúde financeira** (pelo menos 3 indicadores, uma projeção mês a mês e dicas geradas a partir dos dados) | **+10** |

---

## Sugestão de cronograma

Table: (\#tab:tabela-cronograma-backend) Marcos sugeridos (as datas oficiais estão no ambiente virtual da disciplina)

| Marco | Entregável esperado |
|---|---|
| **1. Projeto e banco** | `npm init`, dependências, *scripts*, `.env`, `schema.sql`, `connection.js` e `server.js` respondendo. |
| **2. Autenticação** | Cadastro (com `UNIQUE` e transação), *login*, `protegerRota` e `/auth/me`. |
| **3. CRUD** | Categorias, fontes/destinos e lançamentos (com parcelamento), com validações e isolamento. |
| **4. Relatórios** | Relatórios por categoria e por fonte/destino; previsão de faturas. |
| **5. Acabamento** | `seed.sql`, arquivo de testes, README, desafio (opcional) e ensaio da apresentação. |

---

## *Checklist* final do grupo

- [ ] Cadastrar o mesmo e-mail com letras maiúsculas diferentes é rejeitado com `409`.
- [ ] Cadastrar o mesmo CPF com e sem pontuação é rejeitado com `409`.
- [ ] Mesmo sem o `SELECT` prévio no código, o banco impede duplicatas.
- [ ] Nenhuma resposta da API contém `senha_hash`.
- [ ] Uma requisição sem *token*, ou com *token* expirado, recebe `401` em JSON (e não uma página de erro HTML).
- [ ] Trocar o id na URL não dá acesso a dados de outro usuário.
- [ ] Um lançamento de **saída** não aceita categoria de **entrada**.
- [ ] Uma compra de R$ 100,00 em 3× gera parcelas que somam exatamente R$ 100,00.
- [ ] Uma compra feita **no dia do fechamento** aparece na fatura do mês seguinte.
- [ ] Os relatórios devolvem números (`980.5`), e não textos (`"980.50"`).
- [ ] O `.env` **não** está no repositório; o `.env.example` está.
- [ ] Seguindo apenas o README, outra pessoa consegue criar o banco e subir a API.

---

## Referências

- Express: [Roteamento](https://expressjs.com/pt-br/guide/routing.html), [Usando *middlewares*](https://expressjs.com/pt-br/guide/using-middleware.html), [Tratamento de erros](https://expressjs.com/pt-br/guide/error-handling.html)
- [mysql2 — documentação](https://sidorares.github.io/node-mysql2/docs) (consultas parametrizadas, *pool*, transações e opção `dateStrings`)
- MySQL: [Restrições `CHECK`](https://dev.mysql.com/doc/refman/8.0/en/create-table-check-constraints.html) e [Mensagens de erro do servidor](https://dev.mysql.com/doc/mysql-errors/8.0/en/server-error-reference.html) (`ER_DUP_ENTRY`, 1062)
- [jsonwebtoken](https://www.npmjs.com/package/jsonwebtoken), [express-jwt](https://www.npmjs.com/package/express-jwt), [bcrypt](https://www.npmjs.com/package/bcrypt), [dotenv](https://www.npmjs.com/package/dotenv)
- OWASP: [*Password Storage Cheat Sheet*](https://cheatsheetseries.owasp.org/cheatsheets/Password_Storage_Cheat_Sheet.html)

<!--chapter:end:12-projeto-api-controle-financeiro.Rmd-->

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

<!--chapter:end:12-venda.Rmd-->

# Materiais extras

Este conteúdo é uma curadoria de materiais que podem apoiar seus estudos na disciplina. 


- [Playlist - Curso Node.JS](https://youtube.com/playlist?list=PLJ_KhUnlXUPtbtLwaxxUxHqvcNQndmI4B&si=d-xPyWFJCWIDY_rI)
- [Documentação Node.JS](https://nodejs.org/learn)
- [Apostila Legal!](https://blog.reativa.dev/apostila-nodejs-completa/)

<!--chapter:end:20-Extras.Rmd-->

