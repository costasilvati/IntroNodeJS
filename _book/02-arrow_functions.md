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

#### Comparação {-}

| Linguagem  | Função                   |
| ---------- | ------------------------ |
| C          | `int soma(int a, int b)` |
| Java       | `int soma(int a, int b)` |
| JavaScript | `function soma(a,b)`     |

A diferença principal é que **JavaScript não exige declaração de tipo**.

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

## Comparação com outras linguagens {-}

As arrow functions possuem semelhanças com **lambda expressions** presentes em outras linguagens.

## Java


``` java
(a, b) -> a + b
```

Usado com interfaces funcionais.

---

## C# {-}


``` csharp
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

## Quando usar Arrow Functions {-}

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

## Quando NÃO usar Arrow Functions {-}

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

## Conclusão {-}

Arrow functions são uma ferramenta essencial no desenvolvimento moderno com JavaScript e Node.js.
Elas permitem escrever código mais conciso e legível, especialmente em cenários com **callbacks, manipulação de dados e programação assíncrona**.
