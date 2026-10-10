--- 
title: "Desenvolvimento web Avançado"
author: "Juliana Costa Silva"
date: "2026-03-17"
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

# About

This is a _sample_ book written in **Markdown**. You can use anything that Pandoc's Markdown supports; for example, a math equation $a^2 + b^2 = c^2$.

## Usage 

Each **bookdown** chapter is an .Rmd file, and each .Rmd file can contain one (and only one) chapter. A chapter *must* start with a first-level heading: `# A good chapter`, and can contain one (and only one) first-level heading.

Use second-level and higher headings within chapters like: `## A short section` or `### An even shorter section`.

The `index.Rmd` file is required, and is also your first book chapter. It will be the homepage when you render the book.

## Render book

You can render the HTML version of this example book without changing anything:

1. Find the **Build** pane in the RStudio IDE, and

1. Click on **Build Book**, then select your output format, or select "All formats" if you'd like to use multiple formats from the same book source files.

Or build the book from the R console:


``` r
bookdown::render_book()
```

To render this example to PDF as a `bookdown::pdf_book`, you'll need to install XeLaTeX. You are recommended to install TinyTeX (which includes XeLaTeX): <https://yihui.org/tinytex/>.

## Preview book

As you work, you may start a local server to live preview this HTML book. This preview will update as you edit the book when you save individual .Rmd files. You can start the server in a work session by using the RStudio add-in "Preview book", or from the R console:


``` r
bookdown::serve_book()
```




<!--chapter:end:index.Rmd-->

# Hello bookdown 

All chapters start with a first-level heading followed by your chapter title, like the line above. There should be only one first-level heading (`#`) per .Rmd file.

## A section

All chapter sections start with a second-level (`##`) or higher heading followed by your section title, like the sections above and below here. You can have as many as you want within a chapter.

### An unnumbered section {-}

Chapters and sections are numbered by default. To un-number a heading, add a `{.unnumbered}` or the shorter `{-}` at the end of the heading, like in this section.

<!--chapter:end:01-intro.Rmd-->

# JavaScript Básico para Node.js

**Disciplina:** Desenvolvimento Web Avançado\
**Contexto:** Programação Back-end com Node.js\
**Data:** 10/03/2026

------------------------------------------------------------------------

## 1. O que é JavaScript no contexto do Node.js

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

## 2. Declaração de Variáveis

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

## 3. Tipos de Dados

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

## 4. Operadores Matemáticos

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

## 5. Operadores Relacionais

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

## 6. Operadores Lógicos

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

## 7. Estruturas Condicionais

### if / else

``` javascript
let idade = 18;

if (idade >= 18) {
    console.log("Maior de idade");
} else {
    console.log("Menor de idade");
}
```

------------------------------------------------------------------------

### switch

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

## 8. Estruturas de Repetição

### for

``` javascript
for (let i = 0; i < 5; i++) {
    console.log(i);
}
```

------------------------------------------------------------------------

### while

``` javascript
let i = 0;

while (i < 5) {
    console.log(i);
    i++;
}
```

------------------------------------------------------------------------

### for...of (muito comum em JavaScript)

``` javascript
let numeros = [1,2,3,4];

for (let n of numeros) {
    console.log(n);
}
```

------------------------------------------------------------------------

## 9. Funções

Funções podem ser declaradas de várias formas.

### Função tradicional

``` javascript
function soma(a, b){
    return a + b;
}

console.log(soma(5,3));
```

------------------------------------------------------------------------

### Arrow Function

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

[Leia mais sobre arrow functions](aula2_arrow_function.md)

------------------------------------------------------------------------

## 10. Arrays

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

## 11. Objetos

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

## 12. Template Strings

Permitem interpolação de variáveis.

``` javascript
let nome = "João";
let idade = 30;

console.log(`Nome: ${nome}, Idade: ${idade}`);
```

------------------------------------------------------------------------

## 13. Módulos no Node.js

Node.js utiliza **módulos** para organizar código.

## Exportando

``` javascript
function soma(a,b){
    return a+b;
}

module.exports = soma;
```

------------------------------------------------------------------------

### Importando

``` javascript
const soma = require('./soma');

console.log(soma(2,3));
```

------------------------------------------------------------------------

## 14. Boas práticas iniciais

-   utilizar **const sempre que possível**
-   preferir **=== em vez de ==**
-   usar **arrow functions**
-   manter funções pequenas
-   organizar código em **módulos**

------------------------------------------------------------------------

## 15. Executando programas Node.js

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

## 16. Próximos conceitos importantes em Node.js

Após dominar a sintaxe básica, os próximos tópicos normalmente incluem:

-   JSON
-   manipulação de arquivos
-   módulos NPM
-   criação de servidores HTTP
-   Express
-   APIs REST
-   acesso a banco de dados

------------------------------------------------------------------------

# Atividade em Sala — Desafio JavaScript (Node.js)

**Disciplina:** Desenvolvimento Web Avançado\

------------------------------------------------------------------------

## Desafio: Construindo um Mini Processador de Dados

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

## Parte 1 — Total de Compras por Usuário

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

## Parte 2 — Usuários Ativos

Utilizando **arrow functions**, filtre apenas os usuários que estão **ativos**.

Resultado esperado:

```         
Ana
Carlos
Diana
```

------------------------------------------------------------------------

## Parte 3 — Usuários Maiores de Idade

Liste apenas usuários com **idade \>= 18**.

Utilize **arrow functions**.

------------------------------------------------------------------------

## Parte 4 — Usuário com Maior Volume de Compras

Determine qual usuário possui o **maior total de compras**.

Resultado esperado (aproximado):

```         
Usuário com maior volume: Carlos
Total: 500
```

------------------------------------------------------------------------

## Parte 5 — Desafio de Coerção de Tipos

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

## Parte 6 — Desafio Arrow Function vs Function

Observe os dois códigos:

### Código 1

``` javascript
const pessoa = {
  nome: "Maria",
  falar: function(){
    console.log(this.nome);
  }
};

pessoa.falar();
```

### Código 2

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

## Parte 7 — Desafio Final

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

## Regras do Desafio

-   Utilize **arrow functions sempre que possível**
-   Utilize **arrays e objetos**
-   Utilize **console.log para exibir os resultados**
-   Não utilizar bibliotecas externas

------------------------------------------------------------------------

## Desafio Extra (para quem terminar antes)

Implemente uma função que retorne:

-   o **usuário mais jovem**
-   o **usuário mais velho**
-   o **valor médio das compras por usuário**

Utilizando **arrow functions e métodos de array**.

------------------------------------------------------------------------

```         
```

<!--chapter:end:02-aula2_conteudo.Rmd-->

# Arrow Functions em JavaScript

As **Arrow Functions** são uma forma mais concisa de declarar funções em JavaScript.  
Elas foram introduzidas no **ECMAScript 6 (ES6)** e são amplamente utilizadas em aplicações modernas, especialmente em projetos **Node.js**.

Seu principal objetivo é:

- reduzir a verbosidade da sintaxe
- tornar funções mais expressivas
- facilitar o uso de funções como argumentos (callbacks)
- preservar o contexto de `this`

---

# 1. Funções tradicionais em JavaScript

Antes do ES6, a forma mais comum de declarar funções era:

```javascript
function soma(a, b) {
    return a + b;
}
````

Uso:

```javascript
console.log(soma(2,3));
```

Esse modelo é muito semelhante ao que encontramos em linguagens como **C, Java ou C#**.

### Comparação

| Linguagem  | Função                   |
| ---------- | ------------------------ |
| C          | `int soma(int a, int b)` |
| Java       | `int soma(int a, int b)` |
| JavaScript | `function soma(a,b)`     |

A diferença principal é que **JavaScript não exige declaração de tipo**.

---

# 2. Arrow Functions — Sintaxe Básica

A mesma função pode ser escrita usando **Arrow Function**:

```javascript
const soma = (a, b) => {
    return a + b;
};
```

Uso:

```javascript
console.log(soma(2,3));
```

Componentes da sintaxe:

```
(parametros) => { corpo da função }
```

---

# 3. Versão simplificada

Quando a função possui **apenas uma expressão**, o `return` pode ser omitido:

```javascript
const soma = (a, b) => a + b;
```

Esse estilo é muito comum em **Node.js**, especialmente em:

* callbacks
* manipulação de arrays
* APIs assíncronas

---

# 4. Arrow Function com um único parâmetro

Quando há apenas **um parâmetro**, os parênteses podem ser omitidos:

```javascript
const quadrado = x => x * x;

console.log(quadrado(5));
```

---

# 5. Comparação com outras linguagens

As arrow functions possuem semelhanças com **lambda expressions** presentes em outras linguagens.

## Java

```java
(a, b) -> a + b
```

Usado com interfaces funcionais.

---

## C#

```csharp
(a, b) => a + b
```

Muito utilizado com LINQ.

---

## Python

```python
lambda a, b: a + b
```

Funções anônimas simples.

---

## JavaScript

```javascript
(a, b) => a + b
```

JavaScript permite usar arrow functions **como qualquer outra função**, inclusive armazenando em variáveis.

---

# 6. Uso com arrays (muito comum em Node.js)

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

# 7. Arrow Functions e o comportamento de `this`

Uma das diferenças mais importantes entre **funções tradicionais** e **arrow functions** é o comportamento de `this`.

### Função tradicional

O valor de `this` depende de **como a função é chamada**.

### Arrow Function

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

⚠ **Arrow functions não devem ser usadas como métodos de objetos.**

---

# 8. Quando usar Arrow Functions

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

# 9. Quando NÃO usar Arrow Functions

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

---

# 10. Resumo

| Característica           | Função tradicional | Arrow Function |
| ------------------------ | ------------------ | -------------- |
| Sintaxe curta            | ❌                  | ✔              |
| Suporte a `this` próprio | ✔                  | ❌              |
| Boa para callbacks       | ✔                  | ✔✔             |
| Pode ser construtor      | ✔                  | ❌              |

---

# Conclusão

Arrow functions são uma ferramenta essencial no desenvolvimento moderno com JavaScript e Node.js.
Elas permitem escrever código mais conciso e legível, especialmente em cenários com **callbacks, manipulação de dados e programação assíncrona**.

```
```

<!--chapter:end:02-aula2_function.Rmd-->

# Cross-references {#cross}

Cross-references make it easier for your readers to find and link to elements in your book.

## Chapters and sub-chapters

There are two steps to cross-reference any heading:

1. Label the heading: `# Hello world {#nice-label}`. 
    - Leave the label off if you like the automated heading generated based on your heading title: for example, `# Hello world` = `# Hello world {#hello-world}`.
    - To label an un-numbered heading, use: `# Hello world {-#nice-label}` or `{# Hello world .unnumbered}`.

1. Next, reference the labeled heading anywhere in the text using `\@ref(nice-label)`; for example, please see Chapter \@ref(cross). 
    - If you prefer text as the link instead of a numbered reference use: [any text you want can go here](#cross).

## Captioned figures and tables

Figures and tables *with captions* can also be cross-referenced from elsewhere in your book using `\@ref(fig:chunk-label)` and `\@ref(tab:chunk-label)`, respectively.

See Figure \@ref(fig:nice-fig).


``` r
par(mar = c(4, 4, .1, .1))
plot(pressure, type = 'b', pch = 19)
```

<div class="figure" style="text-align: center">
<img src="02-cross-refs_files/figure-html/nice-fig-1.png" alt="Plot with connected points showing that vapor pressure of mercury increases exponentially as temperature increases." width="80%" />
<p class="caption">(\#fig:nice-fig)Here is a nice figure!</p>
</div>

Don't miss Table \@ref(tab:nice-tab).


``` r
knitr::kable(
  head(pressure, 10), caption = 'Here is a nice table!',
  booktabs = TRUE
)
```



Table: (\#tab:nice-tab)Here is a nice table!

| temperature| pressure|
|-----------:|--------:|
|           0|   0.0002|
|          20|   0.0012|
|          40|   0.0060|
|          60|   0.0300|
|          80|   0.0900|
|         100|   0.2700|
|         120|   0.7500|
|         140|   1.8500|
|         160|   4.2000|
|         180|   8.8000|



<!--chapter:end:02-cross-refs.Rmd-->

# Parts

You can add parts to organize one or more book chapters together. Parts can be inserted at the top of an .Rmd file, before the first-level chapter heading in that same file. 

Add a numbered part: `# (PART) Act one {-}` (followed by `# A chapter`)

Add an unnumbered part: `# (PART\*) Act one {-}` (followed by `# A chapter`)

Add an appendix as a special kind of un-numbered part: `# (APPENDIX) Other stuff {-}` (followed by `# A chapter`). Chapters in an appendix are prepended with letters instead of numbers.




<!--chapter:end:03-parts.Rmd-->

# Footnotes and citations 

## Footnotes

Footnotes are put inside the square brackets after a caret `^[]`. Like this one ^[This is a footnote.]. 

## Citations

Reference items in your bibliography file(s) using `@key`.

For example, we are using the **bookdown** package [@R-bookdown] (check out the last code chunk in index.Rmd to see how this citation key was added) in this sample book, which was built on top of R Markdown and **knitr** [@xie2015] (this citation was added manually in an external file book.bib). 
Note that the `.bib` files need to be listed in the index.Rmd with the YAML `bibliography` key.


The `bs4_book` theme makes footnotes appear inline when you click on them. In this example book, we added `csl: chicago-fullnote-bibliography.csl` to the `index.Rmd` YAML, and include the `.csl` file. To download a new style, we recommend: https://www.zotero.org/styles/


The RStudio Visual Markdown Editor can also make it easier to insert citations: <https://rstudio.github.io/visual-markdown-editing/#/citations>

<!--chapter:end:04-citations.Rmd-->

# Blocks

## Equations

Here is an equation.

\begin{equation} 
  f\left(k\right) = \binom{n}{k} p^k\left(1-p\right)^{n-k}
  (\#eq:binom)
\end{equation} 

You may refer to using `\@ref(eq:binom)`, like see Equation \@ref(eq:binom).


## Theorems and proofs

Labeled theorems can be referenced in text using `\@ref(thm:tri)`, for example, check out this smart theorem \@ref(thm:tri).

::: {.theorem #tri}
For a right triangle, if $c$ denotes the *length* of the hypotenuse
and $a$ and $b$ denote the lengths of the **other** two sides, we have
$$a^2 + b^2 = c^2$$
:::

Read more here <https://bookdown.org/yihui/bookdown/markdown-extensions-by-bookdown.html>.

## Callout blocks


The `bs4_book` theme also includes special callout blocks, like this `.rmdnote`.

::: {.rmdnote}
You can use **markdown** inside a block.


``` r
head(beaver1, n = 5)
#>   day time  temp activ
#> 1 346  840 36.33     0
#> 2 346  850 36.34     0
#> 3 346  900 36.35     0
#> 4 346  910 36.42     0
#> 5 346  920 36.55     0
```

:::

It is up to the user to define the appearance of these blocks for LaTeX output. 

You may also use: `.rmdcaution`, `.rmdimportant`, `.rmdtip`, or `.rmdwarning` as the block name.


The R Markdown Cookbook provides more help on how to use custom blocks to design your own callouts: https://bookdown.org/yihui/rmarkdown-cookbook/custom-blocks.html

<!--chapter:end:05-blocks.Rmd-->

# Sharing your book

## Publishing

HTML books can be published online, see: https://bookdown.org/yihui/bookdown/publishing.html

## 404 pages

By default, users will be directed to a 404 page if they try to access a webpage that cannot be found. If you'd like to customize your 404 page instead of using the default, you may add either a `_404.Rmd` or `_404.md` file to your project root and use code and/or Markdown syntax.

## Metadata for sharing

Bookdown HTML books will provide HTML metadata for social sharing on platforms like Twitter, Facebook, and LinkedIn, using information you provide in the `index.Rmd` YAML. To setup, set the `url` for your book and the path to your `cover-image` file. Your book's `title` and `description` are also used.


This `bs4_book` provides enhanced metadata for social sharing, so that each chapter shared will have a unique description, auto-generated based on the content.

Specify your book's source repository on GitHub as the `repo` in the `_output.yml` file, which allows users to view each chapter's source file or suggest an edit. Read more about the features of this output format here:

https://pkgs.rstudio.com/bookdown/reference/bs4_book.html

Or use:


``` r
?bookdown::bs4_book
```




<!--chapter:end:06-share.Rmd-->


# References {-}


<!--chapter:end:07-references.Rmd-->

